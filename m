Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F358627B8E6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 02:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCEB6E427;
	Tue, 29 Sep 2020 00:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB226E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 00:31:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601339470; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VyZ5pmQqa7xLFxb3IAghjc47NWjJ59HQREfpQdKbl/U=;
 b=VnpDYxltdfOjcy+GDgOxsmqntG5AYZOLt8s9B0CTpwmakX5R5Ry5UzcBn3g+8iPbXqmp7s34
 sDxEYScHj8pECLjRDU0tzubRvdEwMFn8OFpiZyEXGvjGjyaLJsXV0nVYtLMB++CjjeRsw117
 NY6fNs/m2iJtdEd/cra9kgXi8Ww=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f72804daada82eaa4cf6d40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 00:31:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ED5DEC433CA; Tue, 29 Sep 2020 00:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A7AB1C433FE;
 Tue, 29 Sep 2020 00:31:06 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 28 Sep 2020 17:31:06 -0700
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: fix 32b build warns
In-Reply-To: <20200929001925.2916984-1-robdclark@gmail.com>
References: <20200929001925.2916984-1-robdclark@gmail.com>
Message-ID: <99486d8eae2223bc5131c56accca1444@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-28 17:19, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Neither of these code-paths apply to older 32b devices, but it is rude
> to introduce warnings.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index fd8f491f2e48..458b5b26d3c2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -209,7 +209,7 @@ adreno_iommu_create_address_space(struct msm_gpu 
> *gpu,
>  	size = iommu->geometry.aperture_end - start + 1;
> 
>  	aspace = msm_gem_address_space_create(mmu, "gpu",
> -		start & GENMASK(48, 0), size);
> +		start & GENMASK_ULL(48, 0), size);
> 
>  	if (IS_ERR(aspace) && !IS_ERR(mmu))
>  		mmu->funcs->destroy(mmu);
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index 029cc8bf5a04..de0dfb815125 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -879,7 +879,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct
> platform_device *pdev, int id)
>  	pll->max_rate = 3500000000UL;
>  	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
>  		pll->min_rate = 600000000UL;
> -		pll->max_rate = 5000000000UL;
> +		pll->max_rate = (unsigned long)5000000000ULL;
>  		/* workaround for max rate overflowing on 32-bit builds: */
>  		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
>  	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
