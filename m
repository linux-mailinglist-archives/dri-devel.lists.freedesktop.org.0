Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858321B0F5C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 17:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4566E5B6;
	Mon, 20 Apr 2020 15:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83276E5B6;
 Mon, 20 Apr 2020 15:10:39 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id b5so6226470vsb.1;
 Mon, 20 Apr 2020 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dNzKdVNw/y2yDQaVrRieyT4KFZArRiYw0+stJCrhWMM=;
 b=JNPvc9kLgjs5c9Uy8hyHPgxiH8+0negQy6zmpAHp2KR6Ir9JpMb7vP75WjtW3y0ml3
 duKpnVNLX7bu1KKmfoNSSZTd2XfqLNgfybcp7NcogR/KjElgrEgPekEydh+OYoHy7WX1
 5Q35lOKzjXK6z+M81TfHZLXOyDX4SrnLSb7JlKtPgsA8BYznUlwbOMver8L5++NGeUty
 CyPJtO3+WaFWoxFV0kx1ALlDuCBjDedXYhzrQnL6PClY6VeGZOrfR4hOo01pSmF7BAI+
 To9EM+eupvrq1bDopsdFZXw5gapsU0Uu45aXg1/+jrS7mbxs7w5xBq8kQIfLGZkcn/9B
 s+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dNzKdVNw/y2yDQaVrRieyT4KFZArRiYw0+stJCrhWMM=;
 b=NA5QNHnJLN1d1peGKVCSJfp/FoXdSTk5R6l5wYFCMYc3+hbr9kNxaHAmGp0T97tbPs
 FAzEfMEV2e9wuzORNF5mdBbMiHZmfCAkhsTsXz8uXnqO2cbKP83vmcPg84t8+1bQL3jy
 D53sgTm54dWcJ0CTrquk11YXgk5w975y9J3xdEsNU1hlMoXTYYF8yhOLHYlVazYD2hQv
 XjtRi0EUnJbyd7t5vsg0+6zQl5S8hFp7ZEBPziVmHULon7K7vsIu2yoFpPFG0ENHyyUS
 hdph2OSRMGjum/w9o9bcjtm+cmZVUFIdM0q+wLoXasP96/XWYlBz14RTLD71yTG/LhEj
 q1eA==
X-Gm-Message-State: AGi0PuZsQfDlr15tPfYYW7RTqlsly/o5knKR/mzKPgoeEKh/p41tVMeg
 4NNIGK61gkEiBqWV/+GG9oE1NeBJ4KvhAX8584w=
X-Google-Smtp-Source: APiQypL2QQKbpGTWOQ+R3+RLwT9Wlq4zMNhd6n1JfD0GCVkNSx+1rXyQG12GB7grmz3Zt9kxXQTBLbme8f5g5qTDxc0=
X-Received: by 2002:a67:7d83:: with SMTP id y125mr10557611vsc.96.1587395438822; 
 Mon, 20 Apr 2020 08:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200418100248.4552-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20200418100248.4552-1-tangbin@cmss.chinamobile.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 20 Apr 2020 17:10:27 +0200
Message-ID: <CAH9NwWck5KwOGNcYWOAsfKa5CQjJHqMr2j8FW9SmWUYiyu1ebA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Omit superfluous error message in
 etnaviv_gpu_platform_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>
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
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sa., 18. Apr. 2020 um 12:01 Uhr schrieb Tang Bin
<tangbin@cmss.chinamobile.com>:
>
> In the function etnaviv_gpu_platform_probe(), when get irq failed,
> the function platform_get_irq() logs an error message, so remove
> redundant message here.
>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index a31eeff2b..6dbe0c45b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1770,10 +1770,8 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>
>         /* Get Interrupt: */
>         gpu->irq = platform_get_irq(pdev, 0);
> -       if (gpu->irq < 0) {
> -               dev_err(dev, "failed to get irq: %d\n", gpu->irq);
> +       if (gpu->irq < 0)
>                 return gpu->irq;
> -       }
>
>         err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
>                                dev_name(gpu->dev), gpu);
> --
> 2.20.1.windows.1
>
>
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
