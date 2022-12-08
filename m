Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47687646F51
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 13:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04B10E1B8;
	Thu,  8 Dec 2022 12:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD4D10E1B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 12:11:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 08EAE2B059E0;
 Thu,  8 Dec 2022 07:11:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 08 Dec 2022 07:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670501495; x=1670508695; bh=9S7c6Vjexs
 FghoYK7FcmLDwH+TnbUGR78+H67wM0/W4=; b=E44BGaStnPmIUtVHekwMSk0SVi
 btVkGN5VslHZbtEFKyKAH9rVTacshdJCDGZOxlJMmYUno5+A1sIDTK7SAI4V9cbw
 Zz1mwlna5Q2FjhoHVpb5u/4WCM7Co11dXCtFBK48i2RH5kIyMjQLT4ayyDbTxXKF
 Krd9ieOV2zgVxeBKTXCrmmdh12tdkJ+CnAJkekUO5Gab/JZNaogPPjqNpS6I8AR1
 JcMgVBA1+DZg3QQFNwpiRyc56vU4fyDPnGUdzpzAnK0a8acjWIwi46QutFk109RB
 VqCqJoW6fRzkgWGtXWKpa/N3VjKENdqEzR+o6A4qrI8Y8AFYDH70vdiznqNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670501495; x=1670508695; bh=9S7c6VjexsFghoYK7FcmLDwH+Tnb
 UGR78+H67wM0/W4=; b=Py+HcF8mFBh/DfPxOeU+3S8KR/H0YG+0hrrg80L5NLFN
 A7GEBHQSuH8cJAJQb/Nj7/ibmqpMWmPwI8Gjt1SV4Ye/3UIEypAUBl9p+UQG7kp2
 jbdpKTmuT69a7gUryKLDbxV59AOedpFS8dxEkUGTVMxaevk9TUXBNuozYxjNrICH
 jt3wtbWMq60xnCzKrGWNswJuyU4geIVAcHhzHps0Bfw1ddNP1BKUmrhws0VoS0T5
 xFYJ7UbvVa2TeoW9tbJpC8cLT8XBEggyZZ/72TVfQeNVu98HQU/DIT/VTkiRx9Nx
 zaHX6ZY9kuUx7NHyfCPpm0nwqjHxTcOGziGbyK6ybQ==
X-ME-Sender: <xms:dtSRY5zjOe9NbcxlncGctVaKAS_XhGYrzOXwXGewTwq9bfg3OWuN0g>
 <xme:dtSRY5Qt6kEOT3_BPKYzVNExc7kVCy-Gh_AszkMbjhYnTPZbXKFH4xgq9yHxv0kWc
 BTYOXYtZ0eoHn-C904>
X-ME-Received: <xmr:dtSRYzW4eMm6f__E_nZ3tgLfgkOQxcFfNO2kqVUsXu-xOb-LX9bOV9w7JPv4BGSuFNrp8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleejuefggeevteelveekteffgeduveeiteeiueegueegiedvtdejjedvfeef
 tefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dtSRY7h4pUkBXfxoVmSTsBV5bE7TSlIQrbQ950ye1f7aC1ZhHHWDCg>
 <xmx:dtSRY7B6zRuRf6HDST4OqC3bephTiUnffaSc6LkRm4zUS0-OuHwlnQ>
 <xmx:dtSRY0L53a3JtpRqDcNxan4OCVXNorVlkcARrFKCHA73F5yZ_6XVcA>
 <xmx:d9SRY2X2fxb2NYl8IS1tu-OpNVo4dvnNxCK9skucL1Ipp5X-efybTN-X4uo>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 07:11:33 -0500 (EST)
Date: Thu, 8 Dec 2022 13:11:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 3/6] drm/vc4: use new debugfs device-centered functions
Message-ID: <20221208121131.cm2f6e33el5agf5p@houat>
References: <20221207132325.140393-1-mcanal@igalia.com>
 <20221207132325.140393-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cdlhnzwr5xdlwq2a"
Content-Disposition: inline
In-Reply-To: <20221207132325.140393-4-mcanal@igalia.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cdlhnzwr5xdlwq2a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 10:23:22AM -0300, Ma=EDra Canal wrote:
> Currently, vc4 has its own debugfs infrastructure that adds the debugfs
> files on drm_dev_register(). With the introduction of the new debugfs,
> functions, replace the vc4 debugfs structure with the DRM debugfs
> device-centered function, drm_debugfs_add_file().
>=20
> Moreover, remove the explicit error handling of debugfs related functions,
> considering that the only failure mode is -ENOMEM and also that error
> handling is not recommended for debugfs functions, as pointed out in [1].
>=20
> [1] https://lore.kernel.org/all/YWAmZdRwnAt6wh9B@kroah.com/
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--cdlhnzwr5xdlwq2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY5HUcwAKCRDj7w1vZxhR
xSQfAQCguhxm2S1zvh5BBhAJyMgFNk/ClSljeUu03PYGiWRe4QD/WSMFCxQR/XHL
Oqeu1UwlNpWUWtA1dk/QAB9UsIiUfgc=
=P3DW
-----END PGP SIGNATURE-----

--cdlhnzwr5xdlwq2a--
