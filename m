Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42970653CC7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 09:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F416410E00D;
	Thu, 22 Dec 2022 08:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402E210E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 08:08:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id m21so1878633edc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 00:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aWl2qoDVkyJv80Dcc1T5jz7QH+u5H5UltZOFP/s+yNc=;
 b=pxjve+q03lKhs9SeI/Plbwt+Lh8uP7gi1x/bjlCAL591ccNGllzK8muEElztCm5iUh
 mS0twT3wf+xxGqzYK3BsDx/gvFSz4ISBvX8iqJZGXbnGRdQpcLsbopmYDk1Vd2Smv/7I
 F/trMddiOnaywB0ILgvT4aIHLcoAQ8zQYrsfQyPSGX8i72oCryK8lMyRuFDIwtd9C339
 vbdtqh5IlwEVvxKj1QceSj+xghj6cH02HJywNPUGBmJ93ZVRpLR3iP9AO2kJILUYvUH4
 0/xhFPV8hDQsQGUBbMjr0JqnUHrI+JcGPKQO/woydj2xCzN03+akoAHUEidDm2IgbrMI
 U+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aWl2qoDVkyJv80Dcc1T5jz7QH+u5H5UltZOFP/s+yNc=;
 b=oQlt0K/3FxkJaKmZFvEvSJqnquFrjTtCtQ/DD7cQNbAt8EcQl2PgNn0nzxmZGO9uvB
 Sub3IvPcxjGVO0ClxIflHNWikK3qz0SAqLOpRwNsyJ0KY2JCTyMN1/L9slqlZTIoakry
 9JcAM1kARsh/r7TsqDKatPyDmIHIFhLsIgGsoTAY+J8bBZ66nUetGeXrdsUqAZtw5KGF
 guxDzOI0j1JEST3xUKM906Qbk7uts7+bkg5kGJK7iH1NIdo1qMED3w/k0/0f9WZrLnIk
 cOB9Fymgw+B0LS+dpOm3qIkNXjEvJ4zjJo1K2jpldbqv5DRmuNsvfCOzKlSebWr7IFGU
 hL0A==
X-Gm-Message-State: AFqh2kroUMTPQrWh+Yt2NPMQxJETmaqqujeyokskmZGxPujzLEFRVK8f
 5nAIWUqS0U51KkUFJ2HXRNurITUVqvUjPmVcknw=
X-Google-Smtp-Source: AMrXdXusTK9Hhv8wh8JqFhdYHmGuw61kpiPUKpJ/RHarx/sqLCZ/vGyocTEVJbmzH+H6TkwPBJNf4iI2gDX4yf+P1K4=
X-Received: by 2002:aa7:c986:0:b0:46c:5a22:b00c with SMTP id
 c6-20020aa7c986000000b0046c5a22b00cmr512937edt.46.1671696511568; Thu, 22 Dec
 2022 00:08:31 -0800 (PST)
MIME-Version: 1.0
References: <Y5XhPJ39ipMCcctq@qemulion>
In-Reply-To: <Y5XhPJ39ipMCcctq@qemulion>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 22 Dec 2022 16:07:54 +0800
Message-ID: <CAAfSe-sa2Vw7bUxuRne-fw7GZrHW+7OMj6gCS9jPTamsGF5MBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sprd: remove redundant error logging
To: Deepak R Varma <drv@mailo.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 11 Dec 2022 at 21:55, Deepak R Varma <drv@mailo.com> wrote:
>
> A call to platform_get_irq() already prints an error on failure within
> its own implementation. So printing another error based on its return
> value in the caller is redundant and should be removed. The clean up
> also makes if condition block braces unnecessary. Remove that as well.
>
> Issue identified using platform_get_irq.cocci coccicheck script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index 88f4259680f1..db0bcea1d9f4 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -803,10 +803,8 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>         }
>
>         ctx->irq = platform_get_irq(pdev, 0);
> -       if (ctx->irq < 0) {
> -               dev_err(dev, "failed to get dpu irq\n");
> +       if (ctx->irq < 0)

Thanks for the patch, it makes sense to me, so
Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

>                 return ctx->irq;
> -       }
>
>         /* disable and clear interrupts before register dpu IRQ. */
>         writel(0x00, ctx->base + REG_DPU_INT_EN);
> --
> 2.34.1
>
>
>
