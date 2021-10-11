Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B250D428A8B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 12:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EDE6E479;
	Mon, 11 Oct 2021 10:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E3A6E479
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 10:08:07 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id y1so10927179plk.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u66x+DvFzcvxDL4R401DA3OxtOZOzKWRxFNlQpUAwk4=;
 b=bhIfWYIIsEpxeC2fqXuWaiwromauVoxgfuX1ZjnFfvYMuku409+s0YOxThZsFfvtbG
 DxXcwxPkufZJu3igkA0k8zj7ZmILEUtmERd/15rsRPXodJgriQf/EjfSZhz4R2FUG+u3
 L/lNgosrQpVUM2VxcQ98jGq2Mz4PFKJMV4P5F5liLsAKc+/h3esK+lo9XAr6HeXQA1VW
 K7AvDBvqNIeE/LSnRCL9lUzEUyRmcUgb9fYKHZI1ps9YdIA8TBoyHgQWLNeIdxReDnub
 A8Udfs+tXulfA1d92hQpLXRLOQiDBPE+MNjTFmqOWhAV0gNakLCSbBwtFwaLbqY4VUU8
 LMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u66x+DvFzcvxDL4R401DA3OxtOZOzKWRxFNlQpUAwk4=;
 b=Yp1RDhbA+32I//lUExNwRLgkVbHWBtMxqEmWZS6/Nl4IEIc79m0R5Wj7ZtXDzliOp3
 hfSrQApMR1wTL0P0LnkNXbCaCuZ+jwAqLx+aEgQGrdGwSSYpcQ4nD1aU6NOOdIqv4eV7
 PWqoQdD1LT6xGdDs/D3QYhxuZBdKsPBcLXCdu5NanPOgpCmohmKQW8dwiG/Xy0vkwWDC
 0E2bs+DxyzHoQPQ185JVOXVc+VtbbjPsGocPsubsuVEmHChv7PrX+dPTY1IENbqJBQyK
 nIreyUGmZhvMnkXekUBT32GvK9p/BIyPUetUIjQHuwKwGKfiC1MmlsipMXvmTbTPboMV
 52oA==
X-Gm-Message-State: AOAM533L78Rk1ZXVRcTWMOf8WzrWN1r1vWXqfc2r3KQ3ji/mivS3FyLF
 Ezm7RU+6bSllSr1WJdHKwMmRc0/OtP8FczgqKDyZkA==
X-Google-Smtp-Source: ABdhPJw32gI1+wJBKZuA3dhXVX7I7x2jha8F2ADZUukokqUNwu8HWhMiXDfHvVNzI720oozgZqJbHscFj9IXZst17DI=
X-Received: by 2002:a17:90a:190:: with SMTP id
 16mr29679685pjc.152.1633946887083; 
 Mon, 11 Oct 2021 03:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210924152607.28580-1-tim.gardner@canonical.com>
In-Reply-To: <20210924152607.28580-1-tim.gardner@canonical.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 11 Oct 2021 12:07:55 +0200
Message-ID: <CAG3jFysLheGY1_8Vq_hq-5K_d_-zsN-H=c_+8s=wW-AHOTwqqg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: check return values in
 ps8640_aux_transfer()
To: Tim Gardner <tim.gardner@canonical.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-iio@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Tim,

Thanks for submitting this.

I'm seeing some checkpatch --strict warnings. Could you fix them and
resubmit the series?

On Fri, 24 Sept 2021 at 17:26, Tim Gardner <tim.gardner@canonical.com> wrote:
>
> Coverity complains of an unused return code:
>
> CID 120459 (#1 of 1): Unchecked return value (CHECKED_RETURN)
> 7. check_return: Calling regmap_bulk_write without checking return value (as is

Checkpatch is unhappy about the length of this line.

> done elsewhere 199 out of 291 times).
> 204        regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> 205                          ARRAY_SIZE(addr_len));
>
> While I was at it I noticed 2 other places where return codes were not being
> used, or used incorrectly (which is a real bug).
>
> Fix these errors by correctly using the returned error codes.
>
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-iio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 3aaa90913bf8..591da962970a 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -201,8 +201,12 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>         addr_len[PAGE0_SWAUX_LENGTH - base] = (len == 0) ? SWAUX_NO_PAYLOAD :
>                                               ((len - 1) & SWAUX_LENGTH_MASK);
>
> -       regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> +       ret = regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
>                           ARRAY_SIZE(addr_len));

Align to open parenthesis.

> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "failed to bulk write ADDR_7_0: %d\n", ret);
> +               return ret;
> +       }
>
>         if (len && (request == DP_AUX_NATIVE_WRITE ||
>                     request == DP_AUX_I2C_WRITE)) {
> @@ -218,13 +222,17 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>                 }
>         }
>
> -       regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
> +       ret = regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "failed to write SEND: %d\n", ret);
> +               return ret;
> +       }
>
>         /* Zero delay loop because i2c transactions are slow already */
>         regmap_read_poll_timeout(map, PAGE0_SWAUX_CTRL, data,
>                                  !(data & SWAUX_SEND), 0, 50 * 1000);
>
> -       regmap_read(map, PAGE0_SWAUX_STATUS, &data);
> +       ret = regmap_read(map, PAGE0_SWAUX_STATUS, &data);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n",
>                               ret);
> --
> 2.33.0
>
