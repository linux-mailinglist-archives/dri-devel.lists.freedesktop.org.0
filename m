Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25338747612
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C47710E2F4;
	Tue,  4 Jul 2023 16:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD5F10E2F4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:05:25 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bd77424c886so6699750276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688486724; x=1691078724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o0bIvavwh39cojjj0M3fvmyiHYK336zCUqmMtpFKq3o=;
 b=Edx4/t0jJNXA8jsWr5MU02zwuPSSLKouBlotiGVO2PEEKkYWspwsE2gmMAJ1YStbt6
 Vx2HhgcGeXS7F0/zp02eyLdLrWAS8yGBcttzJQWwVS0AOuf35FRjLAmvQqaPKsMlskKN
 MLIsdE+qEW2XzICZIVVUJQt3On/G43rhULaT5lj0YxS613ehByRGxvbLQBqTfwXkBmYO
 GS6hnVGQS+5wjc1ku0yhufRCvkIVPaA2pbl0ZflQxTmznTBfGyfag97Nk/Wl/8Pyp1GF
 AG01EEu0JswkjMoTz45AVfSotvsEZ2Q/6HBbhnc30qa6VI4AX5n57cXMIn0jlQWnvFDK
 p5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688486724; x=1691078724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0bIvavwh39cojjj0M3fvmyiHYK336zCUqmMtpFKq3o=;
 b=dRhpkgbGQEgrQL6/g+tHjyUcOPcdPdBRUwUdS2QiDJ2DhHzBgrG+LdjH0W9HZjuCjp
 kkv5a9UUsVTLLJC4IXnwhChhn+tgs8vVdL0bWV4DRkzNRcVuQkUgwv0D9Yza4QL151UB
 E2TfpjiKUXKQWRl523rmAupj0lsg2tkOSDqsDAXY8Wm59KKIHR3uHDua1Cdhn5ecRAch
 B0Z1Z3bpd4U7OPw4wXh4Zf5OX0ELTLmwS3YneptgL7axIWgJY4Dotk5XY5lTHYehA7GI
 nNQ8ai4l9C/NpD/ctM2dg9X2do3G7Wh0KI2qYhHYpVniE903/s1Vt97VTsq+h1RVr0Uc
 5ATg==
X-Gm-Message-State: ABy/qLa967NHP/oQ8eLil8UKdB2/8VddAwHYCI8D3suFhcrph5DoDxx1
 lyIK00fiEVU0p6eNfdwk4zO4XqXg51UiCqgIoFmtAg==
X-Google-Smtp-Source: APBJJlFq9JMvEVBMpVGYtKel274O4gRqs6omP9fI/C3ozbtpysUcbqdytZ8XTtZ+cmvgsLz4DMPYU7RNnZJ53AyW5qg=
X-Received: by 2002:a25:e789:0:b0:b9e:889:420f with SMTP id
 e131-20020a25e789000000b00b9e0889420fmr14225188ybh.12.1688486724644; Tue, 04
 Jul 2023 09:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230319125524.58803-1-aford173@gmail.com>
In-Reply-To: <20230319125524.58803-1-aford173@gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Wed, 5 Jul 2023 00:05:13 +0800
Message-ID: <CAMSo37Whxvp82i9hr-L-O4Qo9Pxkh5L+hFXqw9hNQ+asrD6oyA@mail.gmail.com>
Subject: Re: [PATCH V2] drm/bridge: adv7533: Fix adv7533_mode_valid for
 adv7533 and adv7535
To: Adam Ford <aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, John Stultz <jstultz@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dmitry.baryshkov@linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Adam, All

On Sun, 19 Mar 2023 at 20:55, Adam Ford <aford173@gmail.com> wrote:
>
> When dynamically switching lanes was removed, the intent of the code
> was to check to make sure that higher speed items used 4 lanes, but
> it had the unintended consequence of removing the slower speeds for
> 4-lane users.
>
> This attempts to remedy this by doing a check to see that the
> max frequency doesn't exceed the chip limit, and a second
> check to make sure that the max bit-rate doesn't exceed the
> number of lanes * max bit rate / lane.
>
> Fixes: 9a0cdcd6649b ("drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge")
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>
> V2:  Fix whitespace in comment
>      Remove TODO comment
>      Add R-B from Robert.

With this change, the ACK android-mainline based hikey960 build failed
to show UI on the HDMI
monitor connected, but it works if I revert this change.
Here is the serial console output: http://ix.io/4zK8

Not sure if you have any idea what the problem is there,
and how to have it fixed.

Please let me know if you need any other information.

Thanks,
Yongqin Liu

> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index fdfeadcefe80..7e3e56441aed 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -103,22 +103,19 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>  enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>                                         const struct drm_display_mode *mode)
>  {
> -       int lanes;
> +       unsigned long max_lane_freq;
>         struct mipi_dsi_device *dsi = adv->dsi;
> +       u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>
> -       if (mode->clock > 80000)
> -               lanes = 4;
> -       else
> -               lanes = 3;
> -
> -       /*
> -        * TODO: add support for dynamic switching of lanes
> -        * by using the bridge pre_enable() op . Till then filter
> -        * out the modes which shall need different number of lanes
> -        * than what was configured in the device tree.
> -        */
> -       if (lanes != dsi->lanes)
> -               return MODE_BAD;
> +       /* Check max clock for either 7533 or 7535 */
> +       if (mode->clock > (adv->type == ADV7533 ? 80000 : 148500))
> +               return MODE_CLOCK_HIGH;
> +
> +       /* Check max clock for each lane */
> +       max_lane_freq = (adv->type == ADV7533 ? 800000 : 891000);
> +
> +       if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> +               return MODE_CLOCK_HIGH;
>
>         return MODE_OK;
>  }
> --
> 2.34.1
>


--
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
