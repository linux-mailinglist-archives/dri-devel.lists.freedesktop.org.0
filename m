Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D213315431
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 17:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9422D6EB82;
	Tue,  9 Feb 2021 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B5E6EB82
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 16:44:56 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y199so18063690oia.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gN16favH/iC4rxRgxx/lx/VHFA6Gx+7MF7QvB3qoLA=;
 b=p8EmyOCM/n0ylrMxfgEe/7EGdsIgXwpcHY2MFeqlYLhB/eu/hmFyZ5/uIdF6zWbwBn
 LCjs42wVja1M6rzgqxk0DCAz3vGjeuTPDL942osKWwE8OIozzRT6KHeUM90zmlxWo1h6
 gWx7x2f/DwJmGE4OJO5KnUxFF1zpmd1Xin5n4x5VpGS0JcNlQJBD+e2M/X6xuEAT/W+6
 ww5y+ZRGMgjrlVx2a1ED7rsHptSxXX6/JrWMbF3eHPvvItSDZxI3N72sbtUVhrFBve/0
 chJwd4Em28ln06FyGUNaJmPVIRScyaUmhEUmKPbE00wiwObPRgAyp4TqzUrNHQsGbF3b
 OQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gN16favH/iC4rxRgxx/lx/VHFA6Gx+7MF7QvB3qoLA=;
 b=t4KBbno+plY3fwceB9crlhph5Qhgt7mc56Y+0DZAAd8YFmMTgxlBlGaYoDdzo8LlWn
 ChLluD55p+DWB17Z+gCor/BLqm8gI4ybYGug1u86Kkf2X4kuteeC8TiZHEEJqTq9dI8+
 wU9QalWYJqsc96zHUkG1ARCgMcOOjdpVlqzP4smO/4Dl6QCaSPggpp3MjWn2kicubx3T
 dciQrsHGOCOQjdNlfOoNoOGZ21vu+tm0dGbsJNiVN6qL61aMDuSrmSlB1Y0UV5N/xELM
 y32lfCtPqbT/ZOf2F7K1SkkV0t7EaErQES5Dhwnv866q3b7ZRLVad5d9ptYPdXxXvgH4
 7hBw==
X-Gm-Message-State: AOAM533mDVAHDsqR2LKJplE+tBKa8OeJHtHFTuLbnthsZ9XYWdbjzqqM
 uComT2niKv8v4mXZ3qBP5slJgzvPYUtVSSBjHF20mHnJcjE=
X-Google-Smtp-Source: ABdhPJysDpA6J+6O/aju5MhBRV+vPljGtCVDlkFE1mgIg6pph+S4DDPfa160QpJDj3NCEkkcnK51D+D891cx4KncWYw=
X-Received: by 2002:aca:5404:: with SMTP id i4mr3014569oib.123.1612889095411; 
 Tue, 09 Feb 2021 08:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20210207123341.5944-1-djraszit@gmail.com>
In-Reply-To: <20210207123341.5944-1-djraszit@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Feb 2021 11:44:44 -0500
Message-ID: <CADnq5_PTvFgDU2bKbckJqMVFEZFS1=jceZfdPhne200g_3Kcfw@mail.gmail.com>
Subject: Re: [PATCH] radeon: added support for 2560x1080 resolution
To: Marcin Raszka <djraszit@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 7, 2021 at 1:13 PM Marcin Raszka <djraszit@gmail.com> wrote:
>
> I was wondering why I can't set the resolution to 2560x1080,
>  while in windows 7 I can without a problem. I looked at the radeon driver
>  code and found it doesn't support this resolution. So I made some changes. I
>  added the hdmi_mhz parameter. In cmdline I set radeon.hdmi_mhz=190
>  Only tested on the Radeon HD 5830
>
> ---
>  drivers/gpu/drm/radeon/radeon_benchmark.c  |  5 +++--
>  drivers/gpu/drm/radeon/radeon_connectors.c | 25 +++++++++++++---------
>  drivers/gpu/drm/radeon/radeon_drv.c        |  5 +++++
>  drivers/gpu/drm/radeon/radeon_encoders.c   |  6 ++++--
>  4 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_benchmark.c b/drivers/gpu/drm/radeon/radeon_benchmark.c
> index ac9a5ec481c3..c283b6b15925 100644
> --- a/drivers/gpu/drm/radeon/radeon_benchmark.c
> +++ b/drivers/gpu/drm/radeon/radeon_benchmark.c
> @@ -30,7 +30,7 @@
>  #define RADEON_BENCHMARK_COPY_DMA  0
>
>  #define RADEON_BENCHMARK_ITERATIONS 1024
> -#define RADEON_BENCHMARK_COMMON_MODES_N 17
> +#define RADEON_BENCHMARK_COMMON_MODES_N 18
>
>  static int radeon_benchmark_do_move(struct radeon_device *rdev, unsigned size,
>                                     uint64_t saddr, uint64_t daddr,
> @@ -184,7 +184,8 @@ void radeon_benchmark(struct radeon_device *rdev, int test_number)
>                 1680 * 1050 * 4,
>                 1600 * 1200 * 4,
>                 1920 * 1080 * 4,
> -               1920 * 1200 * 4
> +               1920 * 1200 * 4,
> +               2560 * 1080 * 4
>         };
>

This change is unrelated.

>         switch (test_number) {
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 607ad5620bd9..182f1e364cbd 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -37,6 +37,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/vga_switcheroo.h>
>
> +extern int hdmimhz;
> +
>  static int radeon_dp_handle_hpd(struct drm_connector *connector)
>  {
>         struct radeon_connector *radeon_connector = to_radeon_connector(connector);
> @@ -503,7 +505,7 @@ static void radeon_add_common_modes(struct drm_encoder *encoder, struct drm_conn
>         struct mode_size {
>                 int w;
>                 int h;
> -       } common_modes[17] = {
> +       } common_modes[] = {
>                 { 640,  480},
>                 { 720,  480},
>                 { 800,  600},
> @@ -520,10 +522,11 @@ static void radeon_add_common_modes(struct drm_encoder *encoder, struct drm_conn
>                 {1680, 1050},
>                 {1600, 1200},
>                 {1920, 1080},
> -               {1920, 1200}
> +               {1920, 1200},
> +               {2560, 1080}
>         };
>
> -       for (i = 0; i < 17; i++) {
> +       for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
>                 if (radeon_encoder->devices & (ATOM_DEVICE_TV_SUPPORT)) {
>                         if (common_modes[i].w > 1024 ||
>                             common_modes[i].h > 768)

Same with these changes.

> @@ -1491,25 +1494,27 @@ static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connecto
>             (mode->clock > 135000))
>                 return MODE_CLOCK_HIGH;
>
> -       if (radeon_connector->use_digital && (mode->clock > 165000)) {
> +       if (radeon_connector->use_digital && (mode->clock > (hdmimhz * 1000))) {
>                 if ((radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_I) ||
>                     (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_DUAL_LINK_DVI_D) ||
> -                   (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B))
> +                   (radeon_connector->connector_object_id == CONNECTOR_OBJECT_ID_HDMI_TYPE_B)){
>                         return MODE_OK;
> -               else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +               }else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
>                         /* HDMI 1.3+ supports max clock of 340 Mhz */
> -                       if (mode->clock > 340000)
> +                       if (mode->clock > 340000){
>                                 return MODE_CLOCK_HIGH;
> -                       else
> +                       }else{
>                                 return MODE_OK;
> +                       }
>                 } else {
>                         return MODE_CLOCK_HIGH;
>                 }
>         }
>
>         /* check against the max pixel clock */
> -       if ((mode->clock / 10) > rdev->clock.max_pixel_clock)
> +       if ((mode->clock / 10) > rdev->clock.max_pixel_clock){
>                 return MODE_CLOCK_HIGH;
> +       }

Unrelated whitespace change.

>
>         return MODE_OK;
>  }
> @@ -1809,7 +1814,7 @@ static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector
>                                 if (mode->clock > 340000)
>                                         return MODE_CLOCK_HIGH;
>                         } else {
> -                               if (mode->clock > 165000)
> +                               if (mode->clock > (hdmimhz * 1000))
>                                         return MODE_CLOCK_HIGH;
>                         }
>                 }
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index e45d7344ac2b..fce8f9ab8018 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -281,6 +281,11 @@ int radeon_cik_support = 1;
>  MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
>  module_param_named(cik_support, radeon_cik_support, int, 0444);
>
> +int hdmimhz = 165;
> +MODULE_PARM_DESC(hdmi_mhz, "set HDMI max frequency, default is 165");
> +module_param_named(hdmi_mhz, hdmimhz, int, 0444);

A similar patch has been proposed before.  I'd prefer not to add an
option to overclock the display hardware.  See this discussion for
more background:
https://bugzilla.kernel.org/show_bug.cgi?id=172421

Alex

> +
> +
>  static struct pci_device_id pciidlist[] = {
>         radeon_PCI_IDS
>  };
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
> index 46549d5179ee..6b805bcd5726 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -35,6 +35,8 @@
>  #include "radeon_legacy_encoders.h"
>  #include "atom.h"
>
> +extern int hdmimhz;
> +
>  static uint32_t radeon_encoder_clones(struct drm_encoder *encoder)
>  {
>         struct drm_device *dev = encoder->dev;
> @@ -389,7 +391,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
>                                 else
>                                         return false;
>                         } else {
> -                               if (pixel_clock > 165000)
> +                               if (pixel_clock > (hdmimhz * 1000))
>                                         return true;
>                                 else
>                                         return false;
> @@ -414,7 +416,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
>                                 else
>                                         return false;
>                         } else {
> -                               if (pixel_clock > 165000)
> +                               if (pixel_clock > (hdmimhz * 1000))
>                                         return true;
>                                 else
>                                         return false;
> --
> 2.30.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
