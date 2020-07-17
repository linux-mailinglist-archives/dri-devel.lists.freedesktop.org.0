Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478DA2240D2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 18:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80FC6E067;
	Fri, 17 Jul 2020 16:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E316E067
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 16:54:12 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id n22so8649384ejy.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/tcpiEgnv1Vg5/I/OqgwYTF2aG01fzIys/jsiwnsBI=;
 b=V08GEdlJqw4cSc4CYRXDay4U2O0xjmQgoh0OxThxGSd8zlyBOJCSG0LvDkG+BS5q1U
 WQv0Rec190mcxfeNnx9LuXQbIcPLoGhH9X8bLpMg7FMUa8CJ4BFRAVr21oo/Ux4WjiXV
 XQP26ElmfuVKTXFD2k5+sr7XL8I08MHgj8irONWZb+auOwjrSAvavYNSxJaAwRtE+8rV
 44qJWazIJ97dD/JSmF3tSb5TPixZ3QkjOHRwMoYqP2y9Yrp9oLo51Wc+hHjAOh1KK9S2
 PQSr2dtMbPXRDKC1aEq87RcfJ3uV/RCo9mYd7hZGPLwFVaPb4Z3ZGA6AC1NARDnv5O43
 rNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/tcpiEgnv1Vg5/I/OqgwYTF2aG01fzIys/jsiwnsBI=;
 b=Q2rQecqtgY6qZgw+rmFf6b9j0y/LDgkhiHCo71JlMAf9JMV+u25A2JhtZebH2jOWXS
 755FtP6XRKTByl9MjJbPmtIEgMlJReO46smiNMGNqqbuc6humjzbORxs0xRrEiOf8jVN
 UUCW5Q9oCIGvzJOxmXZlSw2Wjvwr8i5qTRB7dYMG4CkAtxTnvB8WyPH8Y3Sy3TtGXSyk
 qXuaf7n+nmhiKjSM6hMS8tD6I0FFZgKXvcZQWZBPqiuLJiXwn8OYGFnnGG9485n9gBvK
 4rGIApjE95DWX8WjR0EWE8irA7bTvwBMfbq8za86wtQ5okOK+KCN17/go8XCNMfrQpJk
 x6wg==
X-Gm-Message-State: AOAM533onD+d5/Nu0KFU0asKgRe8O4BGnAoCTTGtHS2Fimp++uwqQAoO
 RF65Vzo6whdR+QCziiEJU0SEyaURT4jnTgNMcNpQtB3J
X-Google-Smtp-Source: ABdhPJxeMxUiEad3F5pqF1zmMQCX7DX5YW7te/oFGx5apYjlR/tGaK2csLBqusCu4S1I2ioC55TIZ0IM57TEY9PInGA=
X-Received: by 2002:a17:906:1751:: with SMTP id
 d17mr9220665eje.140.1595004850955; 
 Fri, 17 Jul 2020 09:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200716144927.7193-1-nsaenzjulienne@suse.de>
In-Reply-To: <20200716144927.7193-1-nsaenzjulienne@suse.de>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 17 Jul 2020 09:54:00 -0700
Message-ID: <CADaigPWN9fJS2YB3Ly3bBTj8ur=F8_Li+hBzbDuSN0ig3mOiiA@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Use platform_get_irq_optional() to get optional
 IRQs
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Emett <david.emett@broadcom.com>, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 7:51 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Aside from being more correct, the non optional version of the function
> prints an error when failing to find the IRQ.
>
> Fixes: eea9b97b4504 ("drm/v3d: Add support for V3D v4.2")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  drivers/gpu/drm/v3d/v3d_irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index c88686489b88..0be2eb7876be 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -217,7 +217,7 @@ v3d_irq_init(struct v3d_dev *v3d)
>                 V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS);
>         V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS);
>
> -       irq1 = platform_get_irq(v3d_to_pdev(v3d), 1);
> +       irq1 = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
>         if (irq1 == -EPROBE_DEFER)
>                 return irq1;
>         if (irq1 > 0) {
> --

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
