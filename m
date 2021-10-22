Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A43437E6A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 21:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29D86EDBE;
	Fri, 22 Oct 2021 19:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11996EDBE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 19:13:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634930042; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=pRZPuY6pGgdzsFCqO2tK/CmQ5Q/2tEuIRVqkEKc1Q5s=;
 b=Fo7uG2ob6NYDlLTKZ89CYVTZFIhJARMksHT3vdGDgyZOFmMXZhaiqtbqNRLjE0GaC8OavhuS
 eiPwtayOBEVrpfEh/D5bpqrfk3Vg5RxU+irTouYMSq6YOXzFVUsMx9Sh/D8aR3BwcV68Mkwj
 VuKLVwvlxIpzlEEGLoS3k/tm+xc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61730d62c75c436a3046a6e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 19:13:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DCA43C43616; Fri, 22 Oct 2021 19:13:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [10.71.111.83] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F37AC4338F;
 Fri, 22 Oct 2021 19:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2F37AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <e070bb16-7c7a-3b1a-0e0c-1330b1d0b8d3@codeaurora.org>
Date: Fri, 22 Oct 2021 12:13:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] drm/msm/dpu: Remove impossible NULL check
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Jessica Zhang <jesszhan@codeaurora.org>, Mark Yacoub
 <markyacoub@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20211022172053.3219597-1-robdclark@gmail.com>
From: Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211022172053.3219597-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/22/2021 10:20 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jessica Zhang <jesszhan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e91568d4f09a..0ae397044310 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -187,11 +187,6 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   	int i = 0;
>   	int rc = 0;
>   
> -	if (!crtc) {
> -		DPU_ERROR("Invalid crtc\n");
> -		return -EINVAL;
> -	}
> -
>   	crtc_state = to_dpu_crtc_state(crtc->state);
>   	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
>   
