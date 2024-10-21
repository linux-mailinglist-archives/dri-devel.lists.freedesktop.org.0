Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F829A72D3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 21:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B1E10E57E;
	Mon, 21 Oct 2024 19:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HfAWCEwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A710E57E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 19:03:17 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e28fd8cdfb8so4427888276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729537396; x=1730142196; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zvl5j8GY6xxT48+PDh05t1YeQhkFTt/d7c/rGxhmWmQ=;
 b=HfAWCEwo6wBdSy+5lDLaUXVydyGGC1bz2y7pkihaDEwi41gL3IbyhSd5EghZg5fBkF
 q/OInkuPC40/b2ThOZmpMduHvrzPEcQhsWupvBGWthdEEaywi6DTA9yo7vtjQciOjsz7
 im7BibEy8RFjOXhxndXhKs3fMnMMu3aqRY+0nP93CO5nks/sFtdCEH6ZX1hJjtpbOjlO
 qjqUmQGwa0VUuCwgwkQB1Phyaw2vpVzITvcTp3v2MkCXXy2S9l1XxbdZEf1B28+RHkUg
 kNmqBTehBGefa2prJPZRJI9yboK/PXK6DDqjyTOhSuIK9JnUVY+wFW7+2zvu4sn1cgbW
 NC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729537396; x=1730142196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zvl5j8GY6xxT48+PDh05t1YeQhkFTt/d7c/rGxhmWmQ=;
 b=S+xQn++c0GPwM80QRiwS9y6UNbDI7bhJNBzeIAtxjgralohqEK4Dw+oTFvTMRiyNvT
 W0VPLkdjBZoUeql+yobIXLBCQHUMh4NNcdlzQkaBKbQVZxYa7vJpihrKhL/ywX/F94bC
 K0wS0nQAiu/seRd/1kpRnI+ObySYB3CPf3AgNol0B8DLUkPsrj1OMmvEezNiatCRdsPb
 kYvfw0I0YxsXTWgXt+vS8kd9SFcDikxEvhUQAxSfs//sHVneuTnz3x7ybrja9dLHRYp6
 lHu/mL1QwoPvF9XiZNAqyhijHi2edXViejQkJo0dk/GjNRV+9WFc2F+D1e+vDpuLcld6
 wOTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQFef2bw2rxe/54i/NvRfzeLO6Jul6dOSxT67iX2r/6OrvssJWHYUzxyxN8zOYJQmRioT62prQAxM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy04+ZqxOms14GSETar+aMdfzR5ErD6zMQhqXP98TdTh+74P6JL
 /mqLb+p3MbnMhFaOf1cV0Z/fNyXyNiDTDVhEODv9JjhUjHyvi/QjoKpc9JdFLUiAJXf763glv4l
 IitbdtHd5MPwbv24a1GWfb3/EttOHvc4+sApHww==
X-Google-Smtp-Source: AGHT+IFw6ofUQkqzWyNMI2FtgBN3vvVTDk3qQDpOKITNNWCcXB/ic89esi1afFvp5h98Sem6vY56OuWzqFJAnFUCjYc=
X-Received: by 2002:a05:690c:488a:b0:6e3:28ec:1a7f with SMTP id
 00721157ae682-6e5bf9e81aemr126667917b3.23.1729537396350; Mon, 21 Oct 2024
 12:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-5-shiyongbang@huawei.com>
 <xeemxeld4cqpx47kzb5qqsawk7mu5kje6r7n335dhe2s7ynw6m@eaiowriiilgr>
 <277b126d-e17c-4ef9-a6fe-56f36061606e@huawei.com>
In-Reply-To: <277b126d-e17c-4ef9-a6fe-56f36061606e@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 22:03:05 +0300
Message-ID: <CAA8EJpontTXUd0TzvwJZ4gCZ2i6vdB8+PqE+W3ChCuBH3WkfaA@mail.gmail.com>
Subject: Re: [PATCH drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
To: s00452708 <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, 
 liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com, 
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, 21 Oct 2024 at 14:54, s00452708 <shiyongbang@huawei.com> wrote:
>
> Thanks, I will modify codes according to your comments, and I also
> replied some questions or reasons why I did it below.
>
> > On Mon, Sep 30, 2024 at 06:06:10PM +0800, shiyongbang wrote:
> >> From: baihan li <libaihan@huawei.com>
> >>
> >> To support DP interface displaying in hibmc driver. Add
> >> a encoder and connector for DP modual.
> >>
> >> Signed-off-by: baihan li <libaihan@huawei.com>
> >> ---
> >>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
> >>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 195 ++++++++++++++++++
> >>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  17 +-
> >>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   5 +
> >>   4 files changed, 217 insertions(+), 2 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> >>

[...]

> >> +
> >> +static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> >> +{
> >> +    int count;
> >> +
> >> +    count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
> >> +                                 connector->dev->mode_config.max_height);
> >> +    drm_set_preferred_mode(connector, 800, 600); /* default 800x600 */
> > What? Please parse EDID instead.
> > I'll add aux over i2c r/w and get edid functions in next patch.

At least please mention that it's a temporal stub which will be changed later.

> >> +
> >> +    return count;
> >> +}
> >> +

[...]

> >> @@ -116,10 +120,17 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
> >>              return ret;
> >>      }
> >>
> >> +    /* if DP existed, init DP */
> >> +    if ((readl(priv->mmio + DP_HOST_SERDES_CTRL) &
> >> +         DP_HOST_SERDES_CTRL_MASK) == DP_HOST_SERDES_CTRL_VAL) {
> >> +            ret = hibmc_dp_init(priv);
> >> +            if (ret)
> >> +                    drm_err(dev, "failed to init dp: %d\n", ret);
> >> +    }
> >> +
> >>      ret = hibmc_vdac_init(priv);
> >>      if (ret) {
> >>              drm_err(dev, "failed to init vdac: %d\n", ret);
> >> -            return ret;
> > Why?
> > We have two display cables, if VGA cannot work, this change makes DP
> > still work.

But that has nothing to do with init errors. If initialising (aka
probing) VGA fails, then the driver init should fail. At the runtime
the VGA and DP should be independent and it should be possible to
drive just one output, that's true.

-- 
With best wishes
Dmitry
