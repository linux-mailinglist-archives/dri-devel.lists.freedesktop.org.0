Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDEC3D1F45
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683DF6EE49;
	Thu, 22 Jul 2021 07:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918F86EE49
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:49:26 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b16so4971261ljq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=qWPC1Dho+bPE7gbJAUXm9sE09urflPH2EN7AAn84i4Q=;
 b=I+Nk6QiSwwyD6Ox+8sdv3zEF+8j9VQW1xXfa0U6DO1tiT76EbmRYv3LXf8njUWnmU3
 PdbccCGGaLR8NrDsDaScO4OWS6YrqrTef31ZjDpqfFH+bfZC04WN7BwfboQ+dI71znQk
 oZMpoUywNLpdTyIuI5xKZcuzrtxP/5Akb7IQ2F+qHZcgK36tlvimmOp+2KZWR64Ss9V3
 MFuT3r+j9unU5/pOJgvSrotv3t4ArNPOKIjR0UIL8d/ZCYTXemlM4FrVjKhocw3anna7
 ldTAmaTgq8+EMPFkQuW0jzdraqOtMPhVh9pQmzw9vdamVo4XVia69UrUm9stDKBKpXIm
 yjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qWPC1Dho+bPE7gbJAUXm9sE09urflPH2EN7AAn84i4Q=;
 b=A7xn5BTw+3jvaXC4+muPO+t6NSaRNoOKRk2u30APPUgtpyD/M2MprKhwzLdyDTF0hg
 QJX5DmkHxkuQK5i7XU97Lfhmu7oAMgv/ogRJkvacIFuhmiu5N2IQ1yVJ/xG8FRK+fllC
 UTSZhyum0gPVbQ4Sg/P6by5SCkDdbd7KM3y9ETpj3SK3qSZqSDBPllymFs//eM8MWDGG
 zsRbGcTuo9cw4MPkTWuYt03vzQ19i9c8uag1huQvL3Uqt95Df3SWk1VgIkHyZ/kFbi+Z
 AYHHIY8m41rde4m15QyzW1SFLc51jQPPD1vSYwTa5M2MGUvUJ1ZT3kbOTFvP/105M/Xj
 k6Ug==
X-Gm-Message-State: AOAM530shDVcczFXMVWWX8CQ9JKDeU85Pc0E/Xi4A7F23gnVr3Is6/gJ
 K9i+pkQabGYOGOwusqqZGJk=
X-Google-Smtp-Source: ABdhPJzCkVKKE/S3B7qKfgPFFvp2J1+npF4pnaGGoH7jzfXsaAulo9W7QBh15lWu5vm6HGkddtAFKg==
X-Received: by 2002:a2e:7612:: with SMTP id r18mr34446179ljc.76.1626940165036; 
 Thu, 22 Jul 2021 00:49:25 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id s5sm3174556ljg.63.2021.07.22.00.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:49:24 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:49:21 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [RESEND PATCH v6 00/14] drm/trace: Mirror DRM debug logs to
 tracefs
Message-ID: <20210722104921.594d604c@eldfell>
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V/n=52wGsud8g83ncPfl9yu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/V/n=52wGsud8g83ncPfl9yu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jul 2021 13:55:07 -0400
Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>=20
> Hi all,
> I just had the pleasure of rebasing this set on our CrOS downstream
> kernel and wanted to resend it for consideration once again. There
> hasn't been any resistence to the set AFAIK, just perhaps not enough
> motivation for anyone to hit the go bit. There was some interest from
> the msm folks about a month ago, and it has been an invaluable tool
> on CrOS for the past ~year. Hopefully someone can dig into this and
> provide some feedback so we can move this forward.
>=20
> Thanks!
>=20
> Sean
>=20
> Changes since last v6:
> -Rebased on drm-tip
>=20
> Original v6 of the set available here:
> https://patchwork.freedesktop.org/series/78133/
> https://lore.kernel.org/dri-devel/20200818210510.49730-1-sean@poorly.run/
>=20

Woo! Yes!

Do you have a link to your userspace?

You wouldn't happen to have already written a privileged userspace
service that would deliver on request the logs to non-privileged actors
like a compositor to be dumped in an error report?


Thanks,
pq

> Sean Paul (14):
>   drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
>   drm/sil164: Convert dev_printk to drm_dev_dbg
>   drm/i915/utils: Replace dev_printk with drm helpers
>   drm/msm/dpu: Replace definitions for dpu debug macros
>   drm/print: rename drm_debug* to be more syslog-centric
>   drm/amd: Gate i2c transaction logs on drm_debug_syslog
>   drm/etnaviv: Change buffer dump checks to target syslog
>   drm/nouveau: Change debug checks to specifically target syslog
>   drm/i915: Change infoframe debug checks to specify syslog
>   drm/print: Add drm_debug_category_printer
>   drm/mst: Convert debug printers to debug category printers
>   drm/i915: Use debug category printer for welcome message
>   drm/atomic: Use debug category printer for atomic state printer
>   drm/print: Add tracefs support to the drm logging helpers
>=20
>  Documentation/gpu/drm-uapi.rst               |   6 +
>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
>  drivers/gpu/drm/drm_drv.c                    |   3 +
>  drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
>  drivers/gpu/drm/drm_print.c                  | 242 ++++++++++++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
>  drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
>  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
>  drivers/gpu/drm/i915/i915_drv.c              |   3 +-
>  drivers/gpu/drm/i915/i915_utils.c            |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
>  include/drm/drm_print.h                      |  96 +++++++-
>  15 files changed, 331 insertions(+), 95 deletions(-)
>=20


--Sig_/V/n=52wGsud8g83ncPfl9yu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmD5IwEACgkQI1/ltBGq
qqfIMxAAl/4JRjb1JlFdVTR/qUMauFvq964XCSL1eXY7wZrcmdUPhFzkjtoSGZko
wRF2R2QkEFuaK/pEYtvKVsHsmAZXrV6IPisvz+/VlU7JU64zGPcAgdU0YJPZRpCb
z1vh5jom4UGQUldRZjTH2hOnNIRBZv4lBDmpn58KWlO29qm8C2fWcwDmcrHv8V2D
S/nZlSTqONUtCVlvgfxxCa7gn1KHCa0xf9tXEsU3Tk/Q8edMD6TemjAJffiQzd4B
GunlbcqE4YdN8gr5neRxTLmV8AduL7b8nyqe8Vzj4PJK8+vLGY9jelD1z1ApqxrS
71rqARMoXOdyITbaoFaOrhjrfBrvZ1Z0onSaDil/s1jBEp7GnG1jdrOaoEz6SjCl
+sWXFlpKf8KfN6IPMULSjGn9xtmIxFqznh8C4ZcWzEO9Ap3SJbZBH5+wJYYxCM0n
8B9hgY7PKZadST3yYTDVPINKPpfSsLcuh4029eazSc2RLf8B7S8jw2LcHk9qY9V3
gFmxxVG80T1D2ysYuxXAgv/Bg8TGxWgGkWSTWgbCHbR3jPk3pZQXQ8KE3OAlm43Q
6WGTD21n5IYceFr47H8V1vr8O1Kspln4ApCajzzuNWo+uKcVW+ut9loOMgeSqSVY
ls7qmuxQ8xw0hPFN1qM6VBrxDN1coT0pYIKxKW3PV3LnY7whmhg=
=u4ey
-----END PGP SIGNATURE-----

--Sig_/V/n=52wGsud8g83ncPfl9yu--
