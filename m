Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604B83F883A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 15:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEFB6E845;
	Thu, 26 Aug 2021 13:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC236E844;
 Thu, 26 Aug 2021 13:00:09 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id j12so820392vka.6;
 Thu, 26 Aug 2021 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocFFaMnpP/NK5k6jGasl64HMse3t1Sh2zr+zn0SwV+M=;
 b=MKdgsD3skHusjl9BNP/Q3G/9e20/iXnmW0VTMNm31s2zKx3/EqdUj3fwoNAsi/G3s+
 yKi3kFV4DzuNUImg5s8PfOD6inHbj/5N00EC1fy4Ri6GislaYs0uFkucQ4RH8VIiiYX7
 DhHWuH0bIeXdXtcPSDoXHWP0Sqpk5xbyYnbp0APV85I9EAwb+vVk96FFMvafuntQtd2v
 vwLei9S9sMdtlIe4yedOC4NjT04WjNkCCs6sEtGd+NYhjFioLxLnHVPSUNJwSi0R7163
 YGqpBuy1DSNxcFHZTUk9K32tkPegiVCF6ojaIaIoiEFsu8Atywmy06oBOEA4u3P7EnCW
 9Asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocFFaMnpP/NK5k6jGasl64HMse3t1Sh2zr+zn0SwV+M=;
 b=FIFy7uRFlZAOMEHYUw04njkrlncnZbPtLmQGMossZxjilCKx1biQlcWoIKyfycEP1L
 0l+1qYBT0Vulx5CjaZb4VtVXc3hYSZY5tKBW+aJ2Jp1fitk6eLvEvCtlfwmFuvK+7YIE
 b4R7spHv0QXQ8Xv+SKW0RfrrhwGbHQE7JLo+bhThHwgxZdKwux1Qn8Rk110LE19MhqWi
 VtpP5oIE5ToB6LsHDIefTRoHgcMHPVMj555Nmx/RDZ9F2H/dOc3C5iU2hDB7liJaHmoJ
 k41Nd9+gEQzJE7HkVzIEJyBGqsjVJJocPErDpXOlAztrfmLg+FDH1caZYvFaB/WXdUZL
 /XuA==
X-Gm-Message-State: AOAM533IcB7wAI4xZqwxRTK/yzSp+Avljg8Pag4JxZqwws0XRrWilexB
 Df7WJfZ1PbW+N3SGVjNuwPyEy7w1UPmQElFVYWQ=
X-Google-Smtp-Source: ABdhPJw3aw85jut73xut5Y2i6V/6gxTcFzKq2kOS6bgJFbpSwBicdQkFyh7ayj+OYPNpfBvqMtHwF512RYxlTaGstBI=
X-Received: by 2002:a1f:90cd:: with SMTP id s196mr1638807vkd.5.1629982808785; 
 Thu, 26 Aug 2021 06:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-2-michael@walle.cc>
In-Reply-To: <20210826121006.685257-2-michael@walle.cc>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 26 Aug 2021 14:59:57 +0200
Message-ID: <CAH9NwWcFdt=C=aEp48462wXA6Q47CvTVoRQawyZMuPwwgVzzUA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/etnaviv: use PLATFORM_DEVID_NONE
To: Michael Walle <michael@walle.cc>
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "Lukas F . Hartmann" <lukas@mntre.com>, Marek Vasut <marek.vasut@gmail.com>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
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

Am Do., 26. Aug. 2021 um 14:10 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> There is already a macro for the magic value. Use it.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

I will wait for v2 for the rest of the changes to review.

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 7dcc6392792d..2509b3e85709 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -653,7 +653,7 @@ static int __init etnaviv_init(void)
>                 if (!of_device_is_available(np))
>                         continue;
>
> -               pdev = platform_device_alloc("etnaviv", -1);
> +               pdev = platform_device_alloc("etnaviv", PLATFORM_DEVID_NONE);
>                 if (!pdev) {
>                         ret = -ENOMEM;
>                         of_node_put(np);
> --
> 2.30.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
