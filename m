Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D4344F5B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 19:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D55B6E593;
	Mon, 22 Mar 2021 18:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2325F6E593;
 Mon, 22 Mar 2021 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=EDEFJDZ99EPzhVmwaQu38D2Z521MorJ947ogN0j39Wk=; b=gdovrSPy4OwiUpMluUjNxjPbml
 puAnHwHKUyMTK10zo7yYhV7r8rh7Q1qdrvMnSjLmOCAisumXT11bfEk/tfTEiOr2IAwiNtUZY47k+
 oEukIBh7x54y7mZq2aDfZDpvzIRIPrBZhXzoKCu1u/qGv7d6FBdVsFFRda9JwZMr+6UvHFesxeF4a
 Fv6qgMAV1z9XROC1MVWegIxSIIYxFcUQIkfpAB4JLJ+2UWvJJYZEGFfEZwQMcucWFBmZpINY47QCO
 duJMS34d3uekar3BHZ0yrpZJQR1+kpqH2URK+ugH/5+B7gw5v8mnTtFDu20Amuwor9pmhsEQlHeZk
 pNoAO+IQ==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPkY-008whK-S2; Mon, 22 Mar 2021 18:58:15 +0000
Subject: Re: [PATCH] drm/msm/dpu: Fix a typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, viresh.kumar@linaro.org,
 dsterba@suse.com, eric@anholt.net, rnayak@codeaurora.org, huawei@kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210322120601.2086438-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <57ae0aab-1a1a-fada-9aef-42373d0018f1@infradead.org>
Date: Mon, 22 Mar 2021 11:57:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322120601.2086438-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/21 5:06 AM, Bhaskar Chowdhury wrote:
> 
> s/poiner/pointer/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d6717d6672f7..a448eb039334 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -258,7 +258,7 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder);
> 
>  /**
>   * dpu_kms_get_clk_rate() - get the clock rate
> - * @dpu_kms:  poiner to dpu_kms structure
> + * @dpu_kms:  pointer to dpu_kms structure
>   * @clock_name: clock name to get the rate
>   *
>   * Return: current clock rate
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
