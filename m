Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0ED2D261E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D796E997;
	Tue,  8 Dec 2020 08:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3607A89933
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:56:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 969EE5C012E;
 Mon,  7 Dec 2020 10:56:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Dec 2020 10:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+bNT2iEDtXhxlbg2H3Dg5gfon7s
 YjPMSJtgn7TZKtWw=; b=NgkSvHJA2tIq3OXHTa/UXizK6ZB7w66rQxBp3e4L7ps
 9jW8Z7IDiDPejAYv8UbfXcCm8xPtX7PC8VraIJ3qVAMM/HA2MwVRKNVo2GWI+Oq5
 a8mwYkzsl++t1QIBB92SO53hwYBX4Xla2OOLSgsfLlkVMvZaMkZE1HRwLmsYHZs2
 c5rEI/lrtpYT2hMoBhy9J9s9r4Bw9T667KvEISt15eOj7JKK3QL3udtixuHKRzVI
 YsK3qS7cl+I9nI3OLoQhBWCA7V634J6mWSW1VagD1ZmQeyngmsQaYYKNy0Zl4KQ0
 u/sJlTsCbEoSfEH7Ic/ehx0c8NU9n4FYUWayaISyEGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+bNT2i
 EDtXhxlbg2H3Dg5gfon7sYjPMSJtgn7TZKtWw=; b=clcLGP27DV41FJAuHafVSk
 m8EVH92XLL85NzMsefCNtYchy5wwMD53KE1xB0Uyp9hqAQ20AxeuYe1dJMmM2geS
 j5p4AEZuP1i4OV+q5fkvd+k1LaON6vsNi+cDKIRA+BVZ35fInLLj3GWVP0F9UZTP
 iD9MS4zWR2yDemefx63kcZsk7I668Kryk6dmXf21+AVQ3AeihpfXmqs5p69Ae7X6
 qj2qKBD/8qpWY9LOjsnaRlx18zbx8s4EmN+R4vZJdVrSqDy/jO/GMawiDC1g/pqW
 F81N3jvtm55kidNV1eXPHLmOUldr8903Jw96QL9Uoyc0u1I+iA0sIixtdnlSNm/w
 ==
X-ME-Sender: <xms:nlDOXwvL9LSn8x3p6bd6xkunts85f5-eTtCuar1N_5j1v6PnI1FO2Q>
 <xme:nlDOX9bWPxuGJW4RsNRTMaM3IvE8QC5pNRhe1N7x88_ztJ-p9y9vlGAvKTWc71vd8
 W72dMFNqhQ0QHj8GeU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nlDOX4qynzcy1bpuVVXQz81B9TarzK3wdNPpEr9pq9SmTsESrISomg>
 <xmx:nlDOX6_tSS6GgzS7_WmwAmHcTzyojfEn6n302Beyb54vIPN2AQEd8g>
 <xmx:nlDOX_92WA9Zp61VNpC7J-j2XrGvHO6o11As4-PwZO7DdoswcnkeZA>
 <xmx:n1DOX8iHz2WNw0pUNf3vkb61wSDK2s078IQw1oRv-x58OIvCuSJ6aA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A59B240064;
 Mon,  7 Dec 2020 10:56:13 -0500 (EST)
Date: Mon, 7 Dec 2020 16:56:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/8] drm/vc4: Pass the atomic state to encoder hooks
Message-ID: <20201207155612.3tshmsh46qdsuwha@gilmour>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-3-maxime@cerno.tech>
 <69f099da-fa12-c370-2a9b-44b1d6afc6df@suse.de>
MIME-Version: 1.0
In-Reply-To: <69f099da-fa12-c370-2a9b-44b1d6afc6df@suse.de>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1953735565=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1953735565==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v5xkit52ygg7bted"
Content-Disposition: inline


--v5xkit52ygg7bted
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 03:16:40PM +0100, Thomas Zimmermann wrote:
>=20
>=20
> Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> > We'll need to access the connector state in our encoder setup, so let's
> > just pass the whole DRM state to our private encoder hooks.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> This becomes relevant in patch 5, I guess?

Yep, we can't access the connector state from the crtc state alone,
hence why the change is needed.

> If so
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!
Maxime

--v5xkit52ygg7bted
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX85QnAAKCRDj7w1vZxhR
xR3lAP9tgPWUlNS5HKiBVYGCdyASgvKMeQJByYuTKzo2rjMLEQD/S4C0JB63xY8U
X44YbflIxB5WtXpLU//6fjLrOLGgdgE=
=5Ru9
-----END PGP SIGNATURE-----

--v5xkit52ygg7bted--

--===============1953735565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1953735565==--
