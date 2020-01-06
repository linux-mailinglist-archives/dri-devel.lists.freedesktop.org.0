Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4668131BE8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 23:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC6D6E584;
	Mon,  6 Jan 2020 22:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12DC6E584;
 Mon,  6 Jan 2020 22:59:02 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so51737109wro.2;
 Mon, 06 Jan 2020 14:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vAbag40zsQCrmcVPzc57zPSUPwvwkh0dJEGfxu/U1Y=;
 b=kTKSdyzsCRaLRMgfxPyrYU+qAHSHjYUAuyA/d3DXfedQ2la8oNPknedyJrEGOq4Voq
 QQh1Cn6RfcfBJY2jd/MADPMZKYuCGIt3Tr2KEV66A8SJPmVIFs04E7yNdpv94IZAiF9K
 AbShQ4sxHzWA9i+1p0veXVdi45ICtTF2CDeLb32KN86J/D0RvEMNN1cvS4oP5PTDsQ9e
 fEWP5hmhljskkEHVCchzf0CnaRs230FsS/cPJwy/VrsTCwOvgo7flv4yIKZC6n3q1+oT
 8UzjZBB28Rmwqf6UtidJIpHR9f5qkg8H2xyGvZbbrEivuMH8QRieKhDwegKql44VwZ8O
 k78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vAbag40zsQCrmcVPzc57zPSUPwvwkh0dJEGfxu/U1Y=;
 b=JAwPan2uGfgyTqDhH6m9U6RgTvMUAycK+5v7ToEOu0D8JyMUMk9iWCmNjpCRtlhsEA
 lSUkelbqtmxYDs/4Kmpl1yAPl95SMREyXNqswezWStZN2NWfJwnpBY2e3e6/aNBA+kBT
 rpPE6j/bjuTK7w9JSy6Z9PrbWqppM1c4B8IXMBpfYDqeHqTqx0/TU77nAtgO2lwKRf8u
 g7ztFKV+ikGcYT0ioI6FZvKHWYcS3+n5rOOuk/hC65qa1w9ax/G0ZCeSF8I+Okf+q1R1
 HCMhfy1LxRPpLdzwRX3LDx/fVqa8P1KIkS8oMG3EwjUol5adViiKgpyHFYAJYuR23/6D
 vTUg==
X-Gm-Message-State: APjAAAXh8ajhMwZtFeSChF01dAei8RdB1R4+c9Uo23g0ER8tFQC/qkA8
 /5JUzgpF6tc8gfIvqXtJvdCRR4I5NCqB7qxKfi8=
X-Google-Smtp-Source: APXvYqyUQebrvLlbh0GkgSfcfoss85D42SwTknJXT1Zd/cd62hr/WDmy+YWSurTM+FaMJhMhdIgh2c1zkziSWNVeY10=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr92441274wru.154.1578351541526; 
 Mon, 06 Jan 2020 14:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20200103131912.26681-1-wambui.karugax@gmail.com>
In-Reply-To: <20200103131912.26681-1-wambui.karugax@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Jan 2020 17:58:49 -0500
Message-ID: <CADnq5_Mb6OPCunU2=fa_YL0Vj7cj6KWwqZ4hU8KrCUfsLi_nUg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove boolean checks in if statements.
To: Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 2:34 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> Remove unnecessary variable comparisions to true/false in if statements
> and check the value of the variable directly.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/cik_sdma.c               |  2 +-
>  drivers/gpu/drm/radeon/r100.c                   |  2 +-
>  drivers/gpu/drm/radeon/r600.c                   |  2 +-
>  drivers/gpu/drm/radeon/radeon_bios.c            | 12 ++++++------
>  drivers/gpu/drm/radeon/radeon_connectors.c      |  4 ++--
>  drivers/gpu/drm/radeon/radeon_display.c         |  4 ++--
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c |  4 ++--
>  drivers/gpu/drm/radeon/radeon_pm.c              |  2 +-
>  8 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik_sdma.c b/drivers/gpu/drm/radeon/cik_sdma.c
> index 35b9dc6ce46a..68403e77756d 100644
> --- a/drivers/gpu/drm/radeon/cik_sdma.c
> +++ b/drivers/gpu/drm/radeon/cik_sdma.c
> @@ -333,7 +333,7 @@ void cik_sdma_enable(struct radeon_device *rdev, bool enable)
>         u32 me_cntl, reg_offset;
>         int i;
>
> -       if (enable == false) {
> +       if (!enable) {
>                 cik_sdma_gfx_stop(rdev);
>                 cik_sdma_rlc_stop(rdev);
>         }
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 0017aa7a9f17..957994258860 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -2815,7 +2815,7 @@ void r100_vga_set_state(struct radeon_device *rdev, bool state)
>         uint32_t temp;
>
>         temp = RREG32(RADEON_CONFIG_CNTL);
> -       if (state == false) {
> +       if (!state) {
>                 temp &= ~RADEON_CFG_VGA_RAM_EN;
>                 temp |= RADEON_CFG_VGA_IO_DIS;
>         } else {
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index 0d453aa09352..eb56fb48a6b7 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -3191,7 +3191,7 @@ void r600_vga_set_state(struct radeon_device *rdev, bool state)
>         uint32_t temp;
>
>         temp = RREG32(CONFIG_CNTL);
> -       if (state == false) {
> +       if (!state) {
>                 temp &= ~(1<<0);
>                 temp |= (1<<1);
>         } else {
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index c84d965c283e..c42f73fad3e3 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -664,17 +664,17 @@ bool radeon_get_bios(struct radeon_device *rdev)
>         uint16_t tmp;
>
>         r = radeon_atrm_get_bios(rdev);
> -       if (r == false)
> +       if (!r)
>                 r = radeon_acpi_vfct_bios(rdev);
> -       if (r == false)
> +       if (!r)
>                 r = igp_read_bios_from_vram(rdev);
> -       if (r == false)
> +       if (!r)
>                 r = radeon_read_bios(rdev);
> -       if (r == false)
> +       if (!r)
>                 r = radeon_read_disabled_bios(rdev);
> -       if (r == false)
> +       if (!r)
>                 r = radeon_read_platform_bios(rdev);
> -       if (r == false || rdev->bios == NULL) {
> +       if (!r || rdev->bios == NULL) {
>                 DRM_ERROR("Unable to locate a BIOS ROM\n");
>                 rdev->bios = NULL;
>                 return false;
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 0851e6817e57..90d2f732affb 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -440,7 +440,7 @@ radeon_connector_analog_encoder_conflict_solve(struct drm_connector *connector,
>                                 if (radeon_conflict->use_digital)
>                                         continue;
>
> -                               if (priority == true) {
> +                               if (priority) {
>                                         DRM_DEBUG_KMS("1: conflicting encoders switching off %s\n",
>                                                       conflict->name);
>                                         DRM_DEBUG_KMS("in favor of %s\n",
> @@ -700,7 +700,7 @@ static int radeon_connector_set_property(struct drm_connector *connector, struct
>                         else
>                                 ret = radeon_legacy_get_tmds_info_from_combios(radeon_encoder, tmds);
>                 }
> -               if (val == 1 || ret == false) {
> +               if (val == 1 || !ret) {
>                         radeon_legacy_get_tmds_info_from_table(radeon_encoder, tmds);
>                 }
>                 radeon_property_change_mode(&radeon_encoder->base);
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index dfb921899853..e42d9e0a4b8c 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -847,11 +847,11 @@ static bool radeon_setup_enc_conn(struct drm_device *dev)
>         if (rdev->bios) {
>                 if (rdev->is_atom_bios) {
>                         ret = radeon_get_atom_connector_info_from_supported_devices_table(dev);
> -                       if (ret == false)
> +                       if (!ret)
>                                 ret = radeon_get_atom_connector_info_from_object_table(dev);
>                 } else {
>                         ret = radeon_get_legacy_connector_info_from_bios(dev);
> -                       if (ret == false)
> +                       if (!ret)
>                                 ret = radeon_get_legacy_connector_info_from_table(dev);
>                 }
>         } else {
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> index a33b19566b2d..44d060f75318 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> @@ -1712,7 +1712,7 @@ static struct radeon_encoder_int_tmds *radeon_legacy_get_tmds_info(struct radeon
>         else
>                 ret = radeon_legacy_get_tmds_info_from_combios(encoder, tmds);
>
> -       if (ret == false)
> +       if (!ret)
>                 radeon_legacy_get_tmds_info_from_table(encoder, tmds);
>
>         return tmds;
> @@ -1735,7 +1735,7 @@ static struct radeon_encoder_ext_tmds *radeon_legacy_get_ext_tmds_info(struct ra
>
>         ret = radeon_legacy_get_ext_tmds_info_from_combios(encoder, tmds);
>
> -       if (ret == false)
> +       if (!ret)
>                 radeon_legacy_get_ext_tmds_info_from_table(encoder, tmds);
>
>         return tmds;
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index b37121f2631d..8c5d6fda0d75 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1789,7 +1789,7 @@ static bool radeon_pm_debug_check_in_vbl(struct radeon_device *rdev, bool finish
>         u32 stat_crtc = 0;
>         bool in_vbl = radeon_pm_in_vbl(rdev);
>
> -       if (in_vbl == false)
> +       if (!in_vbl)
>                 DRM_DEBUG_DRIVER("not in vbl for pm change %08x at %s\n", stat_crtc,
>                          finish ? "exit" : "entry");
>         return in_vbl;
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
