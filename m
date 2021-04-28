Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89736D0A7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 04:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7466EA80;
	Wed, 28 Apr 2021 02:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF406EA80
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 02:47:59 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 p12-20020a4a2f0c0000b02901ecdbb16887so6596582oop.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OmH6bqqM9Umuziq/ASGMVuY66RM06TYhOzF6GFYglyE=;
 b=hsiFE+d3VwiSdA4Fpn5p9aAjePnWVILHTooTxE9/ag0yiLWn1uGXIfCc77N4U5ozhM
 QRqIYR6TmGbz1AZCM222ECbkDxoUoA2O0o7j7qhldt0GQ6Hl6rEMSnJPTnnXsElcSw6/
 e5JWuBo2aK3u/MYl5fkZdaOpbbAQn+Iy0s0+knVCOWj2kbIhOj/V/weM5X0OByI/YS/T
 H4h8G5ljkdeLW1coWI1SsxeiXh6E9MQP+KXtHOOrucFi0rfSRauCpLjy/mItshkdd4tk
 7oRBLUPL03HAXXmxHFPKJyI6MIHmeoTfREsMEZKA8KrdJs3nkJnAgZBEPjrgajz2zkEQ
 rSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OmH6bqqM9Umuziq/ASGMVuY66RM06TYhOzF6GFYglyE=;
 b=hrB5uHKkZCQ9lspkNkRUCFx/lRaTRzedBwYVrCChHpscyqkwiG2qHd1JQ1PBSQwxkG
 IwMyK8U7UTEanYQlBpI5eISKWzXAX8ONj+FSu707cjHb5I5c6XK/VmRl/+9zvOUHGeam
 +GaIWW/PDT/9JHCrLRdGrYlIbh4Z7YI3J7py1Qvzbjk8QeFG8NNFKMSsd8GKmpM8jOwI
 Eol0gl/R0rig8LI3K4KqkFKN+HG8IfbHe1XsTl6t42r/a2fHqafkhkmX3n8kyw5yce7b
 Ez3LFPP8JLNiPKXW+md8k4YxWYpkIHaB1FbbY2sFCM7dTRjJZwquMVqf4OTcLHD1RNkx
 Ialw==
X-Gm-Message-State: AOAM531zLHlH9qr0u9Q7raUeTaPPXsYG14F+OiKh9bNnrBQlZtA4skVc
 Bp7tqAZC6tr69NzwNMcc2hQOMg==
X-Google-Smtp-Source: ABdhPJw+BDAPF5Ijg4kePS4aeXTm2iPsm7UphTIEXAEh45YVZHv1ZCNpir+NJS07PNWd1uZVngGUJg==
X-Received: by 2002:a4a:960c:: with SMTP id q12mr20568629ooi.83.1619578078655; 
 Tue, 27 Apr 2021 19:47:58 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u1sm431110otj.43.2021.04.27.19.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 19:47:58 -0700 (PDT)
Date: Tue, 27 Apr 2021 21:47:55 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
Message-ID: <20210428024755.GJ1908499@yoga>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
[..]
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 92fe844b517b..be578fc4e54f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>  }
>  
>  static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> -				  const char *dbgname, bool quiet)
> +				  const char *dbgname, bool quiet, phys_addr_t *psize)

size_t sounds like a better fit for psize...

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
