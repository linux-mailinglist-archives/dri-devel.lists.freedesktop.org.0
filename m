Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D38C33DE
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 23:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9DE10E098;
	Sat, 11 May 2024 21:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xqmO2UmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7BE10E045
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 21:47:05 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-61e01d5ea74so32745277b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 14:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715464024; x=1716068824; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UUDDnmzrxB3l3/4aj031ZrzOLNCmAjmO9rvghUTgzkE=;
 b=xqmO2UmLRcXeO9qGvY4OJ16iBWgRgL8IM2rGm2CbT0bv2PQOv7GJ5E7IaE6hGFAdJz
 qjURN1Z0savjPEa2FYHxuiP6EwjNUZCozvTo4d4qWtM5fMcOtZDcaRTXISGRaOluNsj7
 WCjRh8N8tot6VWyY9Vr6/KY1p5QgPICr9me0r/jVJeGVh03Ov0sVETQv8KSJoGqSLrJM
 9ilq/0DW6OnCiABLkWMVske8uxxyS+RTkv5FQoR3fyGbEfSvpooZPGiwuMS03mV4yQ/V
 EdWVtl4O2jSIiXRwGsmY+3YFBSp9DfV935oNPnYapW1uOG+M41bMpq6A637S3cxCDi+8
 rApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715464024; x=1716068824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUDDnmzrxB3l3/4aj031ZrzOLNCmAjmO9rvghUTgzkE=;
 b=H9I/hmVL3I5bZdc/nvK+obVxj1vEWfHC3lWLgK/8LD/zT0r2cZvRgAv+O1C2or+9xz
 eW2/SCfebgX9cTZTYnNxmCyl2Lc7ICqFT4WTuPR7FAh+SjRBbGEfT3SDBJa/pSCjO4f+
 tp4R2yKM/AhxjxO8F0DWYXvANAwjaxR0AJiF5w51PzmqlqogNjIp4pT0dPcKLifoShVl
 G2I5RzTZWI7a55UIDoLRjUyHqLlCnX7vXKRH3xmATBZe2hWVko+g49igZukoU9s2CUrE
 6Oio3R3lXf5l2reFrkyMUJA6maWnSxc5NLc9ImClBo0Xapmj3lzIDNZ5bamaHvI4P2dD
 sdXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU96LJDJ9ilSp0BivS2/+LU4mb/+wUzt3/cPcgEoYcE4tM+kndXfsYcH04C3XOve63fhXXcfM2r62I1b+gbjjjsbRJg6kzG6J3UYRlD/yam
X-Gm-Message-State: AOJu0YwqbCRFBZpG/UMfXLvc88GDSSeT5Hc4bMcYugAA+KOTDkCfLTmv
 3nS9xiL2mvVlYzZ8JKUBu9R+X9N0PkTOwcHCdj40CcQLgDO/WaMkVhrSOXwdjoHOQMvB2C7/ijF
 lV1DYhY/Qe3A8cbGzuERWLEB6rGhPY2VLSDs3kg==
X-Google-Smtp-Source: AGHT+IGG3nr3fWq7oYomiHLISDdigDRI73rcAWer5xHynouZBj9dhN1hlkvK3TDT9c5wAPBOWXNGkt1XOlWrmP10/T4=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr84631617b3.8.1715464024566; Sat, 11 May 2024
 14:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
In-Reply-To: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:46:53 +0300
Message-ID: <CAA8EJprMULN1BbRvUjh81f7x02cdg7UeNzuEnw2nUNrmKC7eFw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx: request memory region
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, 11 May 2024 at 22:56, Kiarash Hajian
<kiarash8112hajian@gmail.com> wrote:
>
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
>
> Implement the region-request through the corresponding managed
> devres-function.
>
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v2:
> - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.

Same comment as I posted for v1 of the patch.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..aa83cb461a75 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>
>  err:
>         if (!IS_ERR_OR_NULL(pdcptr))
> -               iounmap(pdcptr);
> +               devm_iounmap(&pdev->dev,pdcptr);
>         if (!IS_ERR_OR_NULL(seqptr))
> -               iounmap(seqptr);
> +               devm_iounmap(&pdev->dev,seqptr);
>  }
>
>  /*
> @@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ret = ioremap(res->start, resource_size(res));
> +       ret = devm_ioremap_resource(&pdev->dev, res);
>         if (!ret) {
>                 DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>                 return ERR_PTR(-EINVAL);
> @@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>
>         /* Drop reference taken in of_find_device_by_node */
>         put_device(gmu->dev);
> @@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>         dev_pm_domain_detach(gmu->cxpd, false);
>
>  err_mmio:
> -       iounmap(gmu->mmio);
> +       devm_iounmap(gmu->dev ,gmu->mmio);
>         if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
> -               iounmap(gmu->rscc);
> +               devm_iounmap(gmu->dev ,gmu->rscc);
>         free_irq(gmu->gmu_irq, gmu);
>         free_irq(gmu->hfi_irq, gmu);
>
>
> ---
> base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
> change-id: 20240511-msm-adreno-memory-region-2bcb1c958621
>
> Best regards,
> --
> Kiarash Hajian <kiarash8112hajian@gmail.com>
>


-- 
With best wishes
Dmitry
