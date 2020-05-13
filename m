Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE7E1D1BE9
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 19:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609FE89D6C;
	Wed, 13 May 2020 17:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38389D6C;
 Wed, 13 May 2020 17:08:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b6so441852ljj.1;
 Wed, 13 May 2020 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ct92GoQxmjkrJFsjfbiJncWVHhbFDJqrFKHkKPJTo14=;
 b=Tl5Rbiyng5LgHx5Gg6sJfh0nYM5fQaO5R9FbQ+FxIU77QOtG1peH+rYIp9YdGC0Ki+
 WMXudb69z9CbqDUAkmJ3uZ+faKYl1Afni3nUwNKCKi/+a1HCy7m0BUJxuCLN/QaJaXC+
 PdNYd1Dh5DYxj84YQrMpUC8Zm0+T5H/JPUxd1oW787D9a/0TLAHR9oDiFXTD7MWyUNo4
 qRy6awADaPbdSVWfF+K7VbVR8QXWfuQEN6/5D1EnO0K1dC14g/EkK/vbB2U5oLD7vdWu
 L4SEzlMjFeNtqCBrEZGIyJkYetgwgmZzYWL5R+Ve1HRbh+gpXwa2AYqY2ccWB6P+Aj9w
 zADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ct92GoQxmjkrJFsjfbiJncWVHhbFDJqrFKHkKPJTo14=;
 b=crYtbN3hP4GYEb+Zmb04IhgepHiBoYYL6zbqeT2KrGU43Fh7tK8619qV07HgtIn9z2
 tG4inPMuLB/s6WMtykd8DQxIssy1UOEr+1La7mUJkiXlei1OfOmgyKFmBMQdU1HJ8M5E
 XL/szojJOXOan0UkVTKnGBFMq9h4FTOhuDm0NguuP+EiNh0Mi7p/mI2GKao579tFQt9C
 KaYrRTDB8RMVUtoA3bZ7UyoELB3tayJn9Ohl6cSzgevflZceK9SlLK1gZc0cPv+ynmze
 VY92f1eDKXxiHSM8nHbB0LLyxA+9F8oxSf387rDet9fe60VSDero3zNfupguERdF+DXY
 ndDA==
X-Gm-Message-State: AOAM5306U1QttZSH7xU8FYfNT4TAvel84IDfJMEmBu9ZKNPFFmi5tswz
 7gLNArCi2bUZaQNsSsiWchDJlWOiBdU8GhjAzdg=
X-Google-Smtp-Source: ABdhPJztZOzynU5omXWIWITm6a2uO+5uiPsUQ2mpbi7pLnKEITDKvJ/cWebb6gPS7BsFK4UO0pNiyNMAI5b0QypN0sM=
X-Received: by 2002:a2e:9b50:: with SMTP id o16mr75061ljj.164.1589389687029;
 Wed, 13 May 2020 10:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200513150007.1315395-1-lkundrak@v3.sk>
 <20200513150007.1315395-3-lkundrak@v3.sk>
In-Reply-To: <20200513150007.1315395-3-lkundrak@v3.sk>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 May 2020 14:09:21 -0300
Message-ID: <CAOMZO5B582=tZ_YBCyVYFtGh=z5hZKFxP7XoUHEmH3jZsk2uYQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/etnaviv: Don't ignore errors on getting clocks
To: Lubomir Rintel <lkundrak@v3.sk>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 12:08 PM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> There might be good reasons why the getting a clock failed. To treat the
> clocks as optional we're specifically only interested in ignoring -ENOENT,
> and devm_clk_get_optional() does just that.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index c6dacfe3d321..e7dbb924f576 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1786,26 +1786,26 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>         }
>
>         /* Get Clocks: */
> -       gpu->clk_reg = devm_clk_get(&pdev->dev, "reg");
> +       gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
>         DBG("clk_reg: %p", gpu->clk_reg);
>         if (IS_ERR(gpu->clk_reg))
> -               gpu->clk_reg = NULL;
> +               return err;
>
> -       gpu->clk_bus = devm_clk_get(&pdev->dev, "bus");
> +       gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");

The binding doc Documentation/devicetree/bindings/gpu/vivante,gc.yaml
says that only the 'reg' clock could be optional, the others are
required.


>         DBG("clk_bus: %p", gpu->clk_bus);
>         if (IS_ERR(gpu->clk_bus))
> -               gpu->clk_bus = NULL;
> +               return err;
>
> -       gpu->clk_core = devm_clk_get(&pdev->dev, "core");
> +       gpu->clk_core = devm_clk_get_optional(&pdev->dev, "core");
>         DBG("clk_core: %p", gpu->clk_core);
>         if (IS_ERR(gpu->clk_core))
> -               gpu->clk_core = NULL;
> +               return err;
>         gpu->base_rate_core = clk_get_rate(gpu->clk_core);
>
> -       gpu->clk_shader = devm_clk_get(&pdev->dev, "shader");
> +       gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
>         DBG("clk_shader: %p", gpu->clk_shader);
>         if (IS_ERR(gpu->clk_shader))
> -               gpu->clk_shader = NULL;
> +               return err;
>         gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
>
>         /* TODO: figure out max mapped size */
> --
> 2.26.2
>
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
