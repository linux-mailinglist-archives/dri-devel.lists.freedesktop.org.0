Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BA8027A0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 21:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC1810E0B9;
	Sun,  3 Dec 2023 20:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB31910E0B9
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 20:57:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D55C15C0159;
 Sun,  3 Dec 2023 15:57:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 03 Dec 2023 15:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701637042; x=1701723442; bh=4Z
 /fGdtWxhmus/QtkDC03Lf4hSdh2IdQELBGib5hdMs=; b=oG3sgBr5MpyGM080ml
 UTQsdXBa172u+R0VY2NVw3POssRNePmxC1U69iaBfHvoRM6e7U8tOc7zY/FeRSP6
 EzI2QdWvITFKqxRpk+odWVDLFPjEfPdERh1MlSymslfK8LxWNCVHAs7EnaW7iRoj
 kSj2dCFa4AFXoDNtzS6PAiXK0VLtO923Z1IuDC1XnVLYqRZREYRN+Fa+bSMqM2GM
 R0ft/Qwc/Gfk8VkhGtsnYo2lea+KiFliotd0/Yo5ck4TP5KPLrQ6P6y+kCJwUXgn
 humqLBeaEolIXcuPIHMIIXUxOz/gosEQtUQpRC7s1xwg+/sxH3KyntYFriWUeetw
 6sdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701637042; x=1701723442; bh=4Z/fGdtWxhmus
 /QtkDC03Lf4hSdh2IdQELBGib5hdMs=; b=pAfWzn3N9photzFEcv8pAoy02u/Hh
 dseORM1JlWiSaJ3uqWgEG7ywJqO37MjMR3MW+Ugn7Ajt5vLEucXQt3sS9CIrxlS0
 /F0OlDdTpz8wdP00jV9ASqQY2qKjbranhCv10sGqIMwHkCHlVWTe+bYf8yscB94z
 manNqkAgFksT121Ib21rGBR7DAFqFJ55iP7GvNDKNQk40uK76pUL/WQ+BXPrsbOt
 7SacDv6KuxyKySiteq3eKqmymmb6j/vbYZ6/ZmN6WVNUA7W0DCJHhKA+iFYZLHCE
 30+U/gyDPD3QrAHBW6rr4f/DCKXDxiIcn7w/VUy4Gy28UhqFs8TBsGsSg==
X-ME-Sender: <xms:setsZYXngvOxnGcmSsSBtH9jP6qVqbCHr0pQt0s-O1SxkAyIy1es0w>
 <xme:setsZcktUFdRhW-11jZ_I68uQ6HhoixovMAQfxD_BeP0CfCkUTsnbESeePQ2_NCCK
 t2lCIb_dez3IIarcw>
X-ME-Received: <xmr:setsZcZs8rBpdI7B_9qbfrOHJVP-QHT__f3cF---eVnsYfUJHx36kPRWuZXjvtj5ZW8orbJou-OYYn8CdhKZYExHVmPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejgedgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufgjfhffkfggtgesghdtreertddttdenucfhrhhomheptehlhihs
 shgrucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrfgrthhtvghrnheptd
 dtkedtvdeltdeufeetheffjedtjeektdegudegjedujefhveevtdekueejgeejnecuffho
 mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehhihesrghlhihsshgrrdhish
X-ME-Proxy: <xmx:sutsZXWgXWTzCG5v_ufblFZBqNwH6nr7aGlDz7Bs9Himw2-OB89Hcw>
 <xmx:sutsZSk0JngmoTkc5eyc5ynCshQINh8VaH4OviFxnXaOJVCfN-Vjww>
 <xmx:sutsZcen059QSKiyXfODaNUxKYyDjF8nd5I4kTSbeTpQV8RoP5ggOg>
 <xmx:sutsZQY4vU1arnpogu2h_m15PXko1cdxqNwn-xpPl25-JzkjK_LpWA>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Dec 2023 15:57:21 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id D6DE375D9; Sun,  3 Dec 2023 21:57:19 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/atomic-helpers: Invoke end_fb_access while
 owning plane state
In-Reply-To: <20231128090158.15564-1-tzimmermann@suse.de>
References: <20231128090158.15564-1-tzimmermann@suse.de>
Date: Sun, 03 Dec 2023 21:57:15 +0100
Message-ID: <87r0k3c8d0.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com, mripard@kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Invoke drm_plane_helper_funcs.end_fb_access before
> drm_atomic_helper_commit_hw_done(). The latter function hands over
> ownership of the plane state to the following commit, which might
> free it. Releasing resources in end_fb_access then operates on undefined
> state. This bug has been observed with non-blocking commits when they
> are being queued up quickly.
>
> Here is an example stack trace from the bug report. The plane state has
> been free'd already, so the pages for drm_gem_fb_vunmap() are gone.
>
> Unable to handle kernel paging request at virtual address 0000000100000049
> [...]
>  drm_gem_fb_vunmap+0x18/0x74
>  drm_gem_end_shadow_fb_access+0x1c/0x2c
>  drm_atomic_helper_cleanup_planes+0x58/0xd8
>  drm_atomic_helper_commit_tail+0x90/0xa0
>  commit_tail+0x15c/0x188
>  commit_work+0x14/0x20
>
> Fix this by running end_fb_access immediately after updating all planes
> in drm_atomic_helper_commit_planes(). The existing clean-up helper
> drm_atomic_helper_cleanup_planes() now only handles cleanup_fb.
>
> For aborted commits, roll back from drm_atomic_helper_prepare_planes()
> in the new helper drm_atomic_helper_unprepare_planes(). This case is
> different from regular cleanup, as we have to release the new state;
> regular cleanup releases the old state. The new helper also invokes
> cleanup_fb for all planes.
>
> The changes mostly involve DRM's atomic helpers. Only two drivers, i915
> and nouveau, implement their own commit function. Update them to invoke
> drm_atomic_helper_unprepare_planes(). Drivers with custom commit_tail
> function do not require changes.
>
> v3:
> 	* add drm_atomic_helper_unprepare_planes() for rolling back
> 	* use correct state for end_fb_access
> v2:
> 	* fix test in drm_atomic_helper_cleanup_planes()
>
> Reported-by: Alyssa Ross <hi@alyssa.is>
> Closes: https://lore.kernel.org/dri-devel/87leazm0ya.fsf@alyssa.is/
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Fixes: 94d879eaf7fb ("drm/atomic-helper: Add {begin,end}_fb_access to plane helpers")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: <stable@vger.kernel.org> # v6.2+

I've been running this for days now, and haven't had a single Oops.
Given the rate with which I encountered them before in this
configuration, it looks very likely that the issue is resolved.

Tested-by: Alyssa Ross <hi@alyssa.is>

And, once the wrong parameter name in the kerneldoc identified by the
kernel test robot is resolved,

Reviewed-by: Alyssa Ross <hi@alyssa.is>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmVs66sACgkQ+dvtSFmy
ccBm/g/+JtddooDhlyC0BzeDXpHuQiKW9puH1MFtU/nvGRXXoxUw7t1KavA85g1x
tEJ39rDvyptmEZzH4Y54RIlm94LtfOkhp6nWUaESMKupIRo1+REDOBKlxysE5iBA
yKkRm2yuEOOh3zdvBvmShVEMQhzG5eb3aKkYrgvrnnAof2QSWmwdQlp4Oxu8YYUS
UM+qW7wgTiPx1TXo1nVu1l5dk4+Y5MufGMjF1JqsUDEkklQLomc/wIxYWXQKkBrh
j0MHOQCSZ/ZfJPf5d4UJOn42F0J/luJb48e+sieWokhPXpAxkt1oRr4JgW2Iy3BA
cGryrTu7HXaUepJjSqTYyKyL5OLfxwhNqKSpQgJbCcRjws+olV3YK6afrj6r6olt
AfzNwd5r+d4eorosCrRRXMRBxSbRmUDSGxHLWY8DaexrpmrOpwl3gLO+euAPQSdt
IBGZFO4h9P66ZsuS5VYo4xIawOAc3af37Q543qFv7DJDPL2TyRkyr+p4knvWkwAv
M54CYFaq8WSjNZ6T/1CzCHeyGxkV0gKi2FxYQp3uR+YClFsQMxn23ex97j8CIR+h
N80UZtx1rz/RYU2mokBG5gQRMA4CaEYVCPyg243DZ4A0BUF0XPq4eHD8vaCkl/lw
0RhpJzHveufm4W+wOq3JfNI2RU/nka8wUBqyElPJCRH8dktT8Ts=
=jM9Y
-----END PGP SIGNATURE-----
--=-=-=--
