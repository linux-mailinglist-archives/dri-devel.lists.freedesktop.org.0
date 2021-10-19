Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BE4337AE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 15:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514D6E16D;
	Tue, 19 Oct 2021 13:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B137D6E16D;
 Tue, 19 Oct 2021 13:47:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E084C580A2F;
 Tue, 19 Oct 2021 09:47:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Oct 2021 09:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=1CqiKRK7ixf1hZLZuR94f9GfY2d
 mSrTwONDsODObvOk=; b=bgRFaT5gzDBxJ8t3Tnn7Sf76prcDJckbpDV7++TpN6R
 5OUz8/ZoTDqjrgZMRCI741wp3FozEMfSjVL9TQ2oTlSTsOBESLrZ/eR6rzLetjWj
 NANZPAt6eL8BWOTR6sHmVDwjEY/uW04jvCbziklujB3GhHHNAVgD7OpKmpfNK597
 33/9xJ8xy2sRybC9k1MlkdHP68dVZG5N1VeQ4ySRLJWodTD652ajthTWSQiIvJOV
 6/i658FTli/Sb1UyiUma4awtRZcNiYbFI92U3tagJcAk0uHOUKZXoquyzvhj9FlX
 bpbqnxIoBlmhSK80ZZAv1Xk+04XFvkt89GwWN7Asoew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1CqiKR
 K7ixf1hZLZuR94f9GfY2dmSrTwONDsODObvOk=; b=D2sSlzoUeHmNJ2ehromBqV
 K719qIg1ZoyRhgOeIvimlEKzwNMMcmiRhIFZZmgtH0xUoqU5z9gptQ4h1b2bgapp
 Xwu6GxbiW3j399P8Mw0Sq+y4Au7VOrhgMmMGxWHSvMPVPp/xA0hDjVjgsaLrDpI5
 bNhNablZUEARpGarWzWlER36PpIHYFc3mJGA53fHEZrvtRddCT4IO1bUKJKEhOhB
 sQpHEZIe/95YVqqyMJXTIRR9x8Demx8pJTXZ4m5CvMr5tqIMFPAcoWCH6Z4itqUB
 Mh48Cwkr0l3Og8aE12yp3oK9UDjcsDHkSdJ3rxpiG4Ps/kiDaSqvRyGpIXb8D5PQ
 ==
X-ME-Sender: <xms:iMxuYVcczd4KAJThwz-fSYxr9TJvS7L4ccyOSFefA-hW5cZrCVinBg>
 <xme:iMxuYTNX9f780oZq5ea-dQjwI7Wx6U_NYfnKBrCmVC5i_7WDo1OH5NwO1RVo7A_Af
 Jn6xUsYeBTG7B5LTM8>
X-ME-Received: <xmr:iMxuYehKMo8n1BaBNFkc5qDWBr3-7-eEeSNxUof8UgL3yJIs6iAmB5SBMk2ZkB83jICgRC3tKJjnWE47yFODahJpar-oLquhk2CI3vLN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iMxuYe_AeaovKA-EjuX-_OmyfNXGTzSatwMBdL3Zw0U9b49CzBETPQ>
 <xmx:iMxuYRukxVPGa-nQTbqTWOPXdK8Zz1LscgexlP8soYllPGcm1c5FcA>
 <xmx:iMxuYdG9YXA6qH2NN8lXzK820nTOwB4BNVBdL8UAGxFcWDgnGFyPKg>
 <xmx:iMxuYXL7zGUUCMuBo370vksRhqLfjq5rAQeaaJctZqvvQf-MjX96JQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Oct 2021 09:47:51 -0400 (EDT)
Date: Tue, 19 Oct 2021 15:47:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] topic/drm-dp-training-delay-helpers for drm-misc-next and
 drm-intel-next
Message-ID: <20211019134749.xjyydm6xdcfe6hkm@gilmour>
References: <878ryps5b6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7niyo5rqdpeforqc"
Content-Disposition: inline
In-Reply-To: <878ryps5b6.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7niyo5rqdpeforqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 12:59:57PM +0300, Jani Nikula wrote:
>=20
> Hi all -
>=20
> These are the drm dp helpers for figuring out link training delays, to
> be pulled to both drm-misc-next and drm-intel-next.
>=20
>=20
> topic/drm-dp-training-delay-helpers-2021-10-19:
> Core Changes:
> - drm dp helpers for figuring out link training delays

Merged into drm-misc-next, thanks!
Maxime

--7niyo5rqdpeforqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW7MhQAKCRDj7w1vZxhR
xdpRAQCcaIzSi+Z73NtOUYhgEHF7u5ScRF/fK9rwxGDsC97W9AEA7ZRi7wo1Dgxh
AC+3UWVlJh5NWIw4SUrJWp/JFYLsBQU=
=0dOT
-----END PGP SIGNATURE-----

--7niyo5rqdpeforqc--
