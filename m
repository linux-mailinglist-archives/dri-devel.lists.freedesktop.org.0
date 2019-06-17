Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2B47EDF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 11:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108C4891AF;
	Mon, 17 Jun 2019 09:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A8D89153;
 Mon, 17 Jun 2019 09:53:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so8512018wme.4;
 Mon, 17 Jun 2019 02:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1+ZuezaHitgO68kl0J8R9YlOnuvV3cM+V3rGlK/aacE=;
 b=SPZLq9hUmjruO8dvD6zAQkLrG8AldZiYzAMiBZp+PN6zF9YQ9IAKCpEkKMsmFEGC6x
 MpIJANVPvytq1DHaoCqQ1AIjrNxjomY1ew7sec6gCW6/T2wJQSXn6lBJbGl3+qyIFd0q
 zJh+N96hKVMXjnJgttag+VyZUa0/tWGONMksYITVFngXB+CR+JBCboePLwEoafv1UBfP
 TpP1t8SnJ1vD4hKMR/gOwJqnCPnrvH63UuCzUgUbYhtyWzicp5c467FYnxS1OjaOK4Jp
 tgELVzctE0uSMs+Ac2qyG1WTWFoxF2+L1hGyJ0FtAZzoce6rsHMgqAk59TULjAF11oVf
 Ipng==
X-Gm-Message-State: APjAAAXZmtnU8lCQVsjK8gJ0sPyo+DuzEfuoAMItz8V6Yrt0i2cI8N6r
 vINOaYUqgpFRQ/6l0yjL3MI=
X-Google-Smtp-Source: APXvYqyBbsCt1Qjb7ZV0h1doQY5Am3ubjUkH3yu78LtAln1+36pcwqF8gQC+y5/KqFHDlWD3vyD9QA==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr18894219wmi.14.1560765236212; 
 Mon, 17 Jun 2019 02:53:56 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id p13sm8066986wrt.67.2019.06.17.02.53.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 02:53:55 -0700 (PDT)
Date: Mon, 17 Jun 2019 11:53:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/59] drm/prime: Align gem_prime_export with
 obj_funcs.export
Message-ID: <20190617095354.GE508@ulmo>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190614203615.12639-10-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1+ZuezaHitgO68kl0J8R9YlOnuvV3cM+V3rGlK/aacE=;
 b=EJlHbtBpc9C4VxJfqiKGGFmtV0JByLLFdgfpN3wrxxC8LDQL4YsCJhApCcvAV+quAn
 tb1vl0JKfPiB1HlD+YPb7DEb9n7OsdSv/YYJ2QFVsQNYGdk8w+pHsi02ilfntqCv0Gr/
 NAujW0XAFKqFmNUMGg2p7E0+16PZY8okjglHi38QRdOnlXN64fh/cssoVP9/mLiNb5df
 nXNvXSJtXN9UkxTr8PamsFlCQnfhrl8z8V1yfuPbEZDSvAuyHIOvVCz8/0D02NW0hdln
 CX8sx3/L86X6vkj1OGyUczhHVHRiENlbcUDV6HGDm5YFA5u8wFXVsBKuID4T7rDZLAE8
 yPTw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Feifei Xu <Feifei.Xu@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tdz@users.sourceforge.net>, Huang Rui <ray.huang@amd.com>,
 Jilayne Lovejoy <opensource@jilayne.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Matthew Auld <matthew.auld@intel.com>,
 Dave Airlie <airlied@redhat.com>, Zhi Wang <zhi.a.wang@intel.com>,
 linux-tegra@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Junwei Zhang <Jerry.Zhang@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 intel-gvt-dev@lists.freedesktop.org, Jim Qu <Jim.Qu@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1699321749=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1699321749==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 10:35:25PM +0200, Daniel Vetter wrote:
> The idea is that gem_prime_export is deprecated in favor of
> obj_funcs.export. That's much easier to do if both have matching
> function signatures.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: "Michel D=C3=A4nzer" <michel.daenzer@amd.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Feifei Xu <Feifei.Xu@amd.com>
> Cc: Jim Qu <Jim.Qu@amd.com>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Thomas Zimmermann <tdz@users.sourceforge.net>
> Cc: Kate Stewart <kstewart@linuxfoundation.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jilayne Lovejoy <opensource@jilayne.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mikulas Patocka <mpatocka@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Junwei Zhang <Jerry.Zhang@amd.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c          | 7 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h          | 3 +--
>  drivers/gpu/drm/armada/armada_gem.c                  | 5 ++---
>  drivers/gpu/drm/armada/armada_gem.h                  | 3 +--
>  drivers/gpu/drm/drm_prime.c                          | 9 ++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 5 ++---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 8 ++++----
>  drivers/gpu/drm/i915/gvt/dmabuf.c                    | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h                      | 3 +--
>  drivers/gpu/drm/omapdrm/omap_gem.h                   | 3 +--
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c            | 5 ++---
>  drivers/gpu/drm/radeon/radeon_drv.c                  | 3 +--
>  drivers/gpu/drm/radeon/radeon_prime.c                | 5 ++---
>  drivers/gpu/drm/tegra/gem.c                          | 7 +++----
>  drivers/gpu/drm/tegra/gem.h                          | 3 +--
>  drivers/gpu/drm/udl/udl_dmabuf.c                     | 5 ++---
>  drivers/gpu/drm/udl/udl_drv.h                        | 3 +--
>  drivers/gpu/drm/vc4/vc4_bo.c                         | 5 ++---
>  drivers/gpu/drm/vc4/vc4_drv.h                        | 3 +--
>  drivers/gpu/drm/vgem/vgem_fence.c                    | 2 +-
>  include/drm/drm_drv.h                                | 4 ++--
>  include/drm/drm_prime.h                              | 3 +--
>  22 files changed, 39 insertions(+), 57 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HYzIACgkQ3SOs138+
s6HxLQ/+IJSDeTbnIzRqn4TaMdKNu1FVggK+ADeKsMTPzxC++oZbESUWovyZqtXH
d7Bo0CLqgkYPEVs2gY7wwfqgGb0/TdKgCFrh9qO4Bw3Yy+zz3dnypNYa/fXqacwe
5hacUyrJ33Q8uJoiCgmys4ePTIM5xnxLGkqdBxRpXeS9Jrnb4d5+2WWOCk2sRee5
oBODNqNNam6sL17u1UlFf+6AMVcs3vjn3RHC+cLDThv+ScNQHOMVzIXhX20DQ7fr
N7G0yOPDWSeLJoPZExyaBUeu/JTj/TL9I1QZn3+xqghw2cw5et4ESgotC19nz01z
Zy+TVn4/xCbhUDMid5W8EkqamqHfwHW09hmQAWgVVU7tSpx+l8T4ET/XZv/5pjlN
AUlKLNhwuGS9vV7EJMm36w6IuSlpZixK5fkeytOnqKHHxf37a5Zarp8YYBsdNsrm
2AUGAsFuN6yBn45aBXQJFGN0fB4FfX4uY5up2dtZp79mdCr/w82UJeHRy5fh2rmq
pXlAspYSybP59KN6H0dNcrRHipfVMIuXbvEB00OteWxmu7C5gdyNz5Kcklz3YOdo
jbEyhlTQN1yMoGhDjekGqQAANCmUtwWuUWCeJx8M3Wzu9RhShdLscJC8Uvp69Bm9
pnZLmgDIx0kl21NPmaP9fWIXSflV5D0C8bfDWY43pHN7q3dtNKQ=
=OSua
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--

--===============1699321749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1699321749==--
