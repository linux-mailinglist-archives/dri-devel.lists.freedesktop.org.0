Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5763D706
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E18510E458;
	Wed, 30 Nov 2022 13:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2210E455;
 Wed, 30 Nov 2022 13:43:06 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 35F955C016A;
 Wed, 30 Nov 2022 08:43:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 30 Nov 2022 08:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1669815784; x=1669902184; bh=hNL9XAfnBy
 feKoCvN7QcpcdwSt8m+s07CRc5Eq/WC1M=; b=ibtyhgw0EALKmRY93kaMfz4MnF
 MBb4WJ0819Py5dUaUKSGXJW7/GqQQwZOdcMjQOcHTrmg1MfVjT5FMwKECV75t81u
 nam+BwYP4pMi6+p2LQqU501vfP4QusqkNIuP1K11I8SkELz9MFjMKsI1OkzdkJIK
 E6IuUqZAkMEzsw/Lkq5zbQZ3+nyaopbUBNobVR7KNpfUM7VerqtVqovvCd9UnMbA
 gUXf8UZGAh3jkFThPStDHUPe8ybJYuO40XWSDMj5zSMCuPhqVarCegKxRZ0X4YEK
 c7KiNiVGKA4Fz69gqu+kBcdIUXFgxClEDU5cSjYEKBAekrq+cuDJchDeto3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669815784; x=1669902184; bh=hNL9XAfnByfeKoCvN7QcpcdwSt8m
 +s07CRc5Eq/WC1M=; b=fshVi6JzF/4+vTSPApDytEw/dUo5k4rKKtmSowD3/F+N
 rnD9YfMpe3SWGACxYVHtQb1nTgJufei0mJp0aoQbNbAZfS7P2EBvpgTG4Qboyh8n
 q21fDqJV+okNcT65RdOZPwPltTBKXYyNQcJ2ZAFCmo57CJjrilNWmv5s0Blp0+Cd
 HQPVsUEGOLCDkAwP7hTr2sUxjjIN6k5PxPZFl04QPOzL2aI1t4woCfwniCTQUGV5
 K1tt8ee3VTCDgPE4IjVoVcA5TIpcNkgRIiqLQyXGHySOV1U7E2oiKqeWcg90pwkQ
 avfhD6QKn54+e47Y+Ln3qq7ZJNHSvuQHv4oPWqeqfQ==
X-ME-Sender: <xms:512HY_4XzQYbj2jJg7_QQR8tN7R2roCv4krkUbPUTHPs96WnqU3NcA>
 <xme:512HY06H_9LoGNLiHEW4rE7P4h6Rf94jxwvaDxW7xSjkX6VmAujhCFxCkNAEIm7cH
 YPOvsdblSw9hQwYB68>
X-ME-Received: <xmr:512HY2cIpcGPM3Ju5_Ln60_OKp67dTu1BIiVAwn6QTvVMRZF6vOTmhe51mm-1_IvwZpm3-sg06p-b35Vf1cKKGvu6sMIcwivStfquC0qrSYJsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:512HYwKKqA4lD51ObpfIKd1gP1j_MUCz_3rSDfLQPoBVSZCOUtxNjg>
 <xmx:512HYzJT3NueOyK_RclF-hFCM3VjHi8AuJO0F-XFUj-DfZRdN4l23A>
 <xmx:512HY5z0jB6nl6z23mr3p4_W2DrU-8LAeszliEEWQd4qh62FC-NaOQ>
 <xmx:6F2HY4DH1xlYxaI0-qMC6RG3dQfNeWl9pN8j_OI2INUTgumVqHkuKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 08:43:03 -0500 (EST)
Date: Wed, 30 Nov 2022 14:43:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <20221130134301.ia2vhzmupwer5auo@houat>
References: <b37af070-21f9-fa40-89f5-5a1be6aaa20b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hxgrt5lyrpaa5ebq"
Content-Disposition: inline
In-Reply-To: <b37af070-21f9-fa40-89f5-5a1be6aaa20b@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hxgrt5lyrpaa5ebq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maarten

On Wed, Nov 30, 2022 at 02:16:05PM +0100, Maarten Lankhorst wrote:
> A single fix to vmwgfx mks-guest-stats ioctl.
> I lost my internet connection when pushing the tag, so I put together this mail
> manually. I hope you remember where drm-misc is hosted. :)

For reference, you can generate the mail content after the fact by using something like:

git request-pull drm/fixes drm-misc drm-misc-fixes-2022-11-30

Maxime

--hxgrt5lyrpaa5ebq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY4dd5QAKCRDj7w1vZxhR
xT38AP97/kjie0lzK0D21RrWe7hW7RCgIL0SvzyVFEsvXl/OTgEAt0WOsDWlolMw
1z/kUFp4HeizCE2JQ0LbFxoyAaDEoQw=
=mZY3
-----END PGP SIGNATURE-----

--hxgrt5lyrpaa5ebq--
