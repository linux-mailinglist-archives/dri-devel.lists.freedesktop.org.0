Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F64EEB06
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3E210E4A6;
	Fri,  1 Apr 2022 10:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26D410E4A6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:10:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id cm17so2017128pjb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 03:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7vUviIqjagA800+Kfi0dOW+YwFLrbsBNlctvy9tVv7U=;
 b=W+mLW/+G5TCFCm8phJQTLqsU1G+jYZcSAuGIyNiP4vmyj1z2hWptUMeTeomzOsGpZb
 rjt4CwUXHo/T15YP09eGJhZtTPgkAlLzuPBjYmMcTk8ENK862rbA/kcMnJBLPlJ6OdGf
 rZ4aP2Zcxg/qArrSrc7E12SIh6d+B715a78/W9wysAMoRHSfj42A/Osgv2GX67TQQJ8b
 vSSd/8/CeHXMUw5x0cXic+cbSIfTDGny0+7aF8iu65d5RBIXjO7hjIYOZJRyuLVOhp+T
 rHTKL/5V5vYjiQys+sRlJIJjFJ00fNcD5Dm2byGiv8LyPbR+e6YCczyR0tI5hHNWc3IO
 zUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7vUviIqjagA800+Kfi0dOW+YwFLrbsBNlctvy9tVv7U=;
 b=YLlQMSj2Ro7XNQsRacoPmPEXHDpt0iLlMiEHRLPX32qttOc4txNCia4rU5A4b6f6vA
 5cAFmaBjpNCoPiHG5yd4WFjSLp9s3Kd44JBDQOo+9zQqZztAD+2rKMKMbMAp9j/GBNcQ
 sldUJMqbaYPxKxscsNCcNV+LGcAu0HToc0wyDFOxQj7lF+5JZl8mj3cFZXBGIMK5JHS+
 uSSgeqTFucuyMeoNGkLoP+XXmM/RRrwqmxEbgmr5KfVYL8WyR9PU0DI55sAPuzZcBsiB
 3o0xOs4fMgExjIxqT9alVg99eFHatS3JchBKHmA2EBUkEgQSpPqSzLEb6wiDnEm72oNK
 HL1Q==
X-Gm-Message-State: AOAM533I3eWPM3+EEPR4cV2Dz7GpccMhwOUaKG+C4Yw45hSFHvMeG7zy
 QfWtJKX1KZVKrAlEAhtmnUAYD2HQI99666y98wE=
X-Google-Smtp-Source: ABdhPJwGgXT66OAkRhojQj+TZttJ0jww9Zm57oWFkDEbSio/I5VriQ+zEmVbBvLUt1a8OfJ/3Oq2tgRKgvjYi4LMICk=
X-Received: by 2002:a17:90b:3850:b0:1c6:572e:f39a with SMTP id
 nl16-20020a17090b385000b001c6572ef39amr11010201pjb.233.1648807859421; Fri, 01
 Apr 2022 03:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
 <20220330120246.25580-6-xiam0nd.tong@gmail.com>
In-Reply-To: <20220330120246.25580-6-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 1 Apr 2022 12:10:48 +0200
Message-ID: <CAMeQTsYcyk9vRO6OaBi-KsptBzJ1Jh-2bOa0UW1+F+JUnDwH=g@mail.gmail.com>
Subject: Re: [PATCH 5/5] gma500: fix a missing break in psb_driver_load
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Zhao Yakui <yakui.zhao@intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 2:03 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. To
> avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
> add a break after the switch statement.
>
> Fixes: 5c49fd3aa0ab0 ("gma500: Add the core DRM files and headers")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

This is incorrect. If we always break on the first iteration we will
only run gma_backlight_init() if the first connector is LVDS or MIPI.
This might not be the case and gma_backlight_init() will never run.
The other loops you have been looking at have an "if (xxx != yyy)
continue;" statement at the top which skips all the unwanted entries
but this loop does not.

> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 65cf1c79dd7c..d65a68811bf7 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -398,6 +398,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>                         ret = gma_backlight_init(dev);
>                         break;
>                 }
> +
> +               break;
>         }
>
>         if (ret)
> --
> 2.17.1
>
