Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D7534ED4
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 14:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FBE10E031;
	Thu, 26 May 2022 12:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A0D10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 12:08:45 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id y1so1540193pfr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JjOWEbyt4Ro1fIWUT8SNiX3DuKLQiF+WmKI78RmvKKE=;
 b=UNWyzFK8Vc7v4ZA885SMSw+7EH0q15ojR+He2o6c5PxLMYP+x3PbY6JBy0VcaVPJHF
 WKli4RyrW7xEnyMdLL5JZVRVgDjeyANAJLHBVixC0H78FxnnFzuDhUA2fIbMVq2aEKJe
 4FnNrYfrIl3fyYA11iur6l32ecwOD4e6R5CKEvb5T7r6LG5lcKY7jUUc2EXRMCFiFwdt
 tiEcZIta2HU51d61YIlZFjFQOWX3nbhrWItKA03jAlHeHgT1yQ/5USPtUIeL1ceHDujt
 H9oEJOPJcAy07G/eGTiZW6KRA2dr9h1HWYZNmfi2jOhXSq8aHYmQ/R46Sgsj7+XTevbv
 HCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjOWEbyt4Ro1fIWUT8SNiX3DuKLQiF+WmKI78RmvKKE=;
 b=x6OwYiHky+6tSap1PvsWL7skCu9Uh2TDkupw+0hmX7x13o36rhsiJJQCrVl1xmUW62
 CFUvmWhmSlrz0Pb3YX9TCU5RcfZwr8jMyH/0cbKWn70VTlyfQCE8Y8+sSpNWh0y9ngDl
 UH7ugA+/KWBEM/pHJEB1UcXdFdRNnW2EnS7DCOB/TDuVlDmvd0+e/OQdTqrTMSzo1tRs
 e+l1QIgfz3+CibrEq2POg+KXDcEdyeXp0ObGK/jNc3mjimfWt/3W+WZM3ydje9fU9C7A
 B0IitbeJg2Ud8UbC+pq3Q7ZSDxsulG9RYHID5zBE2G+zfT77BgHD6L5YbJelAP+IE4IP
 p22g==
X-Gm-Message-State: AOAM5309YUxzxUCzl17S8b9bQDx7YJQsYsxLaS0poOkTSkPBKIg1F3jm
 4ZxTQ2hFAnTUcWSw0slonvu0AcbxTIGW9V9MU9pp1A==
X-Google-Smtp-Source: ABdhPJwLSJF2+bp+VvmR3MEKtg4PATwjIP6ZcUm+9oZ3uYMHbgr9rT4ptK8D8m31usIIvnqN9A9UgB0SwMZLl1VLhnQ=
X-Received: by 2002:a05:6a00:174a:b0:50d:44ca:4b with SMTP id
 j10-20020a056a00174a00b0050d44ca004bmr38665734pfc.0.1653566924909; Thu, 26
 May 2022 05:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220523130144.444225-1-net147@gmail.com>
 <868d010c-9fca-3fac-7657-faaa2f271c14@denx.de>
 <CANwerB30qwH4pe1wMqAvRgi6gAntZX=AqAh67dEvg4+D1jcnfQ@mail.gmail.com>
 <4c740b30-9ba0-c5a9-13b6-7f6c3b417595@denx.de>
In-Reply-To: <4c740b30-9ba0-c5a9-13b6-7f6c3b417595@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 26 May 2022 14:08:34 +0200
Message-ID: <CAG3jFysO9Pqagnrrzs=+8_MFh-+zv5Pj3H=zPzVVN-R4+t6cHQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: icn6211: Adjust clock phase using
 SYS_CTRL_1
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonathan Liu <net147@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 May 2022 at 15:25, Marek Vasut <marex@denx.de> wrote:
>
> On 5/23/22 15:20, Jonathan Liu wrote:
> > Hi Marek,
> >
> > On Mon, 23 May 2022 at 23:15, Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 5/23/22 15:01, Jonathan Liu wrote:
> >>> The code from [1] sets SYS_CTRL_1 to different values depending on the
> >>> desired clock phase (0, 1/4, 1/2 or 3/4). A clock phase of 0 aligns the
> >>> positive edge of the clock with the pixel data while other values delay
> >>> the clock by a fraction of the clock period. A clock phase of 1/2 aligns
> >>> the negative edge of the clock with the pixel data.
> >>>
> >>> The driver currently hard codes SYS_CTRL_1 to 0x88 which corresponds to
> >>> aligning the positive edge of the clock with the pixel data. This won't
> >>> work correctly for panels that require aligning the negative edge of the
> >>> clock with the pixel data.
> >>>
> >>> Adjust the clock phase to 0 if DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE is
> >>> present in bus_flags, otherwise adjust the clock phase to 1/2 as
> >>> appropriate for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE.
> >>>
> >>> [1] https://github.com/tdjastrzebski/ICN6211-Configurator
> >>>
> >>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>> ---
> >>> V2: Use GENMASK and FIELD_PREP macros
> >>> ---
> >>>    drivers/gpu/drm/bridge/chipone-icn6211.c | 18 ++++++++++++++++--
> >>>    1 file changed, 16 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> >>> index 47dea657a752..f1538fb5f8a9 100644
> >>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> >>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> >>> @@ -9,6 +9,8 @@
> >>>    #include <drm/drm_print.h>
> >>>    #include <drm/drm_mipi_dsi.h>
> >>>
> >>> +#include <linux/bitfield.h>
> >>> +#include <linux/bits.h>
> >>>    #include <linux/delay.h>
> >>>    #include <linux/gpio/consumer.h>
> >>>    #include <linux/i2c.h>
> >>> @@ -26,6 +28,11 @@
> >>>    #define PD_CTRL(n)          (0x0a + ((n) & 0x3)) /* 0..3 */
> >>>    #define RST_CTRL(n)         (0x0e + ((n) & 0x1)) /* 0..1 */
> >>>    #define SYS_CTRL(n)         (0x10 + ((n) & 0x7)) /* 0..4 */
> >>> +#define SYS_CTRL_1_CLK_PHASE_MSK     GENMASK(5, 4)
> >>
> >> This should be GENMASK(7, 6) , no ?
> >
> > Clock phase 0 = 0b_1000_1000 = 0x88
> > Clock phase 1/4 = 0b_1001_1000 = 0x98
> > Clock phase 1/2 = 0b_1010_1000 = 0xA8
> > Clock phase 3/4 = 0b_1011_1000 = 0xB8
> >
> > The clock phase bits are 5:4 not 7:6. The upper 2 bits and lower 4
> > bits are unknown.
>
> Doh, you're right.
>
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied to drm-misc-next.
