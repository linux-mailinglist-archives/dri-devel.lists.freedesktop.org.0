Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE7B55AE88
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 05:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4310FD58;
	Sun, 26 Jun 2022 03:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210510FD58
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 03:46:26 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so6311801pjj.5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 20:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NkR3yCBKwWtovdy4WYrNPg8uwIMMvvK6YP84XNpC5FM=;
 b=SxczHg72LRcYZZeyIiUC/dUDmUHIX+IHXLm7tA8PS5Ey9h032Xo+Sjupj1Ocg4iqZF
 irqH8LnQAzeWHEXHcpEt3W4vm6vsGmG6DIjsthtOpO5exP/Br/dq49lYYjfJebUUYmZb
 KrL7/zML1qJP6xaQ6jcxtxWNVEI9A8LuBDc/ePcgtgxx4XW/t7xnoij0Z/kNkT2bqVj9
 eMatniqkhJwtBACFarHU48BoitruvajYm4RApdoaFJy+smp6Ffyjf+yj/q1rmOhbfbzp
 uXy3tgH3cKC77M01KYi1TuygQFn3/FC5YO6Z4ZrGtitatyQwH9b+q52m3GKtVZ7h1nAc
 8IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NkR3yCBKwWtovdy4WYrNPg8uwIMMvvK6YP84XNpC5FM=;
 b=gkzeS8+SFAoOu0mcEy/HxzctC64E3PJeSDWODUsbJkbNSZ5LxIoZYof5WoUY9bd2K2
 SXNRinqax4/HzH/uwwG6QLtdrdQIaYYW5laVZ9ygRBMQ/4I+hUsvz+/YExivk4rUwrZd
 w5Dl/6UC7jL8QgtIHLQccDLSPVAPiYjZwIXIAQB7BS603oJ1g9PpGsELp60MEeU7yGfn
 CuuNsp6qe5VqmwC2yKAX3Sjp320OnC/q4RNir+BMb8ItD8WOpZlWO/iJQb5WOabL0/xe
 q8/FxUcWwN8qL/XIodJU+7m1MqH/y7ns758UoMbpRroYkX3qgmu6n1bCg4OskqBl0G7S
 SU8g==
X-Gm-Message-State: AJIora9W5qj46m5QGejBwnZok7y66oZnBf/h4eXzU+sCwHD1LTQQLyiR
 M5G3kHZo0VvR/ueA/O6Eg0v/4eeQtvX7/tkYx2o=
X-Google-Smtp-Source: AGRyM1vIlFu2iMfIY1UA/3VhwYoNMAHpoKy2HsfungMuGCOUct2c8BjuyKL2gt576KiN6kYP7FPK+vw5/HCjoIbmG5E=
X-Received: by 2002:a17:902:e748:b0:16a:726e:7c9e with SMTP id
 p8-20020a170902e74800b0016a726e7c9emr7253919plf.12.1656215186453; Sat, 25 Jun
 2022 20:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220624005036.37268-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220624005036.37268-1-yang.lee@linux.alibaba.com>
From: Orson Zhai <orsonzhai@gmail.com>
Date: Sun, 26 Jun 2022 11:46:15 +0800
Message-ID: <CA+H2tpHf-LoJE45-OJ17M4r9oE7_ruitvq9P4tk8odQBiw0YPg@mail.gmail.com>
Subject: Re: [PATCH -next] drm: Remove unnecessary print function dev_err()
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, Lyra Zhang <zhang.lyra@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 8:50 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
>
> Eliminate the follow coccicheck warning:
> ./drivers/gpu/drm/sprd/sprd_dpu.c:808:2-9: line 808 is redundant because platform_get_irq() already prints an error
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Orson Zhai <orsonzhai@gmail.com>

> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index 3664089b6983..de4848dc0d22 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -804,10 +804,8 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>         }
>
>         ctx->irq = platform_get_irq(pdev, 0);
> -       if (ctx->irq < 0) {
> -               dev_err(dev, "failed to get dpu irq\n");
> +       if (ctx->irq < 0)
>                 return ctx->irq;
> -       }
>
>         /* disable and clear interrupts before register dpu IRQ. */
>         writel(0x00, ctx->base + REG_DPU_INT_EN);
> --
> 2.20.1.7.g153144c
>
