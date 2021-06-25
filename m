Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2533B3B42
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 05:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916E56EBC4;
	Fri, 25 Jun 2021 03:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B2D6EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 03:39:26 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 n99-20020a9d206c0000b029045d4f996e62so7969307ota.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 20:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NgBcYRoIlctACD+L2YYbad3iw3ek5NyZ4dgv7eQ3Lxs=;
 b=d5Z7R72WbYSoShvKXvQHAJXVwL9hbpA/qb5R/LJlrIh+pVPidB5zbsT9XIsS2eBFAt
 UJ47Eqc334KXUncOythdccWWcpLa66oC85s02pMEYC9A54iPhc3Mhix+k6aEAP+K9W2R
 nxQhXV4ZJJ4+gf11TL6cIq92u+Cc0itFy6GYLedkbkJpC9JU32x6vKXlKxK/HsF+iL0o
 Spw5qiiteoNzA7/ruwNUEyNFWsZOnWjDCh7F/JIiLGmvk8bRAmXhOBcMvC6vOPwi5WbT
 SnJzGZ1JwYqdDihOS3zBQevpoQ+h9uJPXUg3PpaYmnpR+LohY+sA6d0IvlDkWMkGYOpc
 vxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NgBcYRoIlctACD+L2YYbad3iw3ek5NyZ4dgv7eQ3Lxs=;
 b=VKrKGQsVQdVmCw8TYDGSJTkiEKxvwLp1qZM8mKWAEaSnWRjk7hvnsx83wKyYev5Hs6
 7OXNdM3E6DFQfuuLg3vEojm1xrtOxWB1wTpHfhpXHW7bsxbkqO7Gmf6tQ5CA9pH4Arjk
 CqeBrcLVI2sRSNuY7fQ0iJLFupu/XRmgUh1RyE0izl/DNOF39DqCw1jyVELZoenuCM8B
 VgnuaydAq2sW/oehKv2ZW8LegLFWQb5gFVUJq8pGaydr1tRx2/MhLHamKN23kperIMLG
 AMZy26hvWMAorJMubDtX3G8+y46WSvQF2mCW+93Y3GU4/HduKbflC+Mb6UwuTEY5kBPV
 qWBQ==
X-Gm-Message-State: AOAM533W+bJeUAX7CrwBJxe6wbMwUCaACxUZA+WUg6gIb1ozbddR/86r
 RL7r2+Nwo85ZWa0zhGoeHaYiQg==
X-Google-Smtp-Source: ABdhPJxICvy4DH/gmlYi4aOPrUOcJ+WDYuzwO6ESj2tt39upXIdEx5yfKOxDmtDKbeC3lx3i+SQnUg==
X-Received: by 2002:a9d:1e5:: with SMTP id e92mr5472028ote.353.1624592365276; 
 Thu, 24 Jun 2021 20:39:25 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t21sm1140288otd.35.2021.06.24.20.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 20:39:24 -0700 (PDT)
Date: Thu, 24 Jun 2021 22:39:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
Message-ID: <YNVP6rfQ699BejsI@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-4-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 iommu@lists.linux-foundation.org,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:
[..]
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 50d881794758..6975b95c3c29 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  		unsigned long iova, int flags, void *arg)
>  {
>  	struct msm_iommu *iommu = arg;
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> +	struct adreno_smmu_fault_info info, *ptr = NULL;
> +
> +	if (adreno_smmu->get_fault_info) {

This seemed reasonable when I read it last time, but I didn't realize
that the msm_fault_handler() is installed for all msm_iommu instances.

So while we're trying to recover from the boot splash and setup the new
framebuffer we end up here with iommu->base.dev being the mdss device.
Naturally drvdata of mdss is not a struct adreno_smmu_priv.

> +		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);

So here we just jump straight out into hyperspace, never to return.

Not sure how to wire this up to avoid the problem, but right now I don't
think we can boot any device with a boot splash.

Regards,
Bjorn

> +		ptr = &info;
> +	}
> +
>  	if (iommu->base.handler)
> -		return iommu->base.handler(iommu->base.arg, iova, flags);
> +		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>  	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>  	return 0;
>  }
