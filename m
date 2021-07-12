Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7723B3C421E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 05:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F089BA5;
	Mon, 12 Jul 2021 03:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CAC89BA5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 03:41:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626061314; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hs7Tqld0fBRwacaQc2I/5U3RxF7nEO0L5nh1M+lL7NQ=;
 b=UE9ehvoZjF5wmCKJsQxarR5xwlJ+Auqf69WphgjHbXi20jLftZjYChZTCKXUgTYj2ukQ9uN7
 vUwaTzi7VrlRCVcmy4aOl7g+cs4vmNN21mYkL7zsAfLw4X4bBIA1dnE7+1+vfiFH97i+tbp+
 4Q8WOdtf3D+ggIOJQDUtUneF0PI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60ebb9ec193894195560c884 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Jul 2021 03:41:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0BE23C433D3; Mon, 12 Jul 2021 03:41:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 12B2AC433F1;
 Mon, 12 Jul 2021 03:41:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 12 Jul 2021 09:11:30 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [v1] drm/msm/disp/dpu1: add safe lut config in dpu driver
In-Reply-To: <1625827244-23274-1-git-send-email-kalyan_t@codeaurora.org>
References: <1625827244-23274-1-git-send-email-kalyan_t@codeaurora.org>
Message-ID: <38beafdc174cbb16de6f1d646fff6816@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
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
Cc: devicetree@vger.kernel.org, rnayak@codeaurora.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-09 16:10, Kalyan Thota wrote:
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
> 
> Issue reported on SC7280:
> 
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
> 
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d01c4c9..2e482cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -974,6 +974,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = 
> {
>  	.amortizable_threshold = 25,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sdm845_qos_linear),
>  		.entries = sdm845_qos_linear
> @@ -1001,6 +1002,7 @@ static const struct dpu_perf_cfg sc7180_perf_data 
> = {
>  	.min_dram_ib = 1600000,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
>  		.entries = sc7180_qos_linear
> @@ -1028,6 +1030,7 @@ static const struct dpu_perf_cfg sm8150_perf_data 
> = {
>  	.min_dram_ib = 800000,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
>  		.entries = sm8150_qos_linear
> @@ -1056,6 +1059,7 @@ static const struct dpu_perf_cfg sm8250_perf_data 
> = {
>  	.min_dram_ib = 800000,
>  	.min_prefill_lines = 35,
>  	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
>  		.entries = sc7180_qos_linear
> @@ -1084,6 +1088,7 @@ static const struct dpu_perf_cfg sc7280_perf_data 
> = {
>  	.min_dram_ib = 1600000,
>  	.min_prefill_lines = 24,
>  	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xff00, 0xff00, 0xffff},
>  	.qos_lut_tbl = {
>  		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
>  		.entries = sc7180_qos_macrotile

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> 
(sc7280, sc7180)

This will need fixes and stable tag and I think this should also fix the
wait-for-safe issue with sdm845 (ufs/usb speed slowdown with display 
active)
which we have in arm-smmu-qcom.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
