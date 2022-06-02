Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB053BE29
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 20:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76E11357F;
	Thu,  2 Jun 2022 18:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C8F113582;
 Thu,  2 Jun 2022 18:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654195474; x=1685731474;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B4mhY1oLyEmrV7MR1iSen1Ly0egGqBiI4a7I8XiSy0E=;
 b=QtKaRlYEX03i1vD+uX19qyFThnOKilVjW1iIEFAo25p89yZvUjyL881j
 /Udb/40sruFn13nT2GU9f6EqJ5d9MbcZneDOKSMNu1xiOgPcNWnsiIOAl
 AsI9gAb+M/o+fIszIL66bQDBtBaTiv8o145ZonGDSYkVQMddsnkCLjFi0 o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 11:44:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 11:44:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 11:44:33 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 11:44:30 -0700
Message-ID: <ec832d06-a74a-64b5-20ed-b45a833c0fa7@quicinc.com>
Date: Thu, 2 Jun 2022 11:44:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/7] drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to
 hw_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> Rather than detecting VBIF_XINL_QOS_LVL_REMAP_000 based on the
> hwversion, push the offset to the hw_catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This one is fine because sc7180 and sc7280 use sdm845_vbif.

All chipsets listed in the catalog are covered.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c    | 4 ++--
>   3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 78c7d987c2ca..cff6fe3a85ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1339,6 +1339,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
>   	.default_ot_wr_limit = 32,
>   	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
>   	.xin_halt_timeout = 0x4000,
> +	.qos_rp_remap_size = 0x20,
>   	.dynamic_ot_rd_tbl = {
>   		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
>   		.cfg = msm8998_ot_rdwr_cfg,
> @@ -1366,6 +1367,7 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
>   	.base = 0, .len = 0x1040,
>   	.features = BIT(DPU_VBIF_QOS_REMAP),
>   	.xin_halt_timeout = 0x4000,
> +	.qos_rp_remap_size = 0x40,
>   	.qos_rt_tbl = {
>   		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
>   		.priority_lvl = sdm845_rt_pri_lvl,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 80bc09b1f1b3..f70de97f492a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -709,6 +709,7 @@ struct dpu_vbif_qos_tbl {
>    * @ot_rd_limit        default OT read limit
>    * @ot_wr_limit        default OT write limit
>    * @xin_halt_timeout   maximum time (in usec) for xin to halt
> + * @qos_rp_remap_size  size of VBIF_XINL_QOS_RP_REMAP register space
>    * @dynamic_ot_rd_tbl  dynamic OT read configuration table
>    * @dynamic_ot_wr_tbl  dynamic OT write configuration table
>    * @qos_rt_tbl         real-time QoS priority table
> @@ -721,6 +722,7 @@ struct dpu_vbif_cfg {
>   	u32 default_ot_rd_limit;
>   	u32 default_ot_wr_limit;
>   	u32 xin_halt_timeout;
> +	u32 qos_rp_remap_size;
>   	struct dpu_vbif_dynamic_ot_tbl dynamic_ot_rd_tbl;
>   	struct dpu_vbif_dynamic_ot_tbl dynamic_ot_wr_tbl;
>   	struct dpu_vbif_qos_tbl qos_rt_tbl;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> index b757054e1c23..046854c3fbed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> @@ -30,7 +30,7 @@
>   #define VBIF_XIN_HALT_CTRL0		0x0200
>   #define VBIF_XIN_HALT_CTRL1		0x0204
>   #define VBIF_XINL_QOS_RP_REMAP_000	0x0550
> -#define VBIF_XINL_QOS_LVL_REMAP_000(v)	(v < DPU_HW_VER_400 ? 0x570 : 0x0590)
> +#define VBIF_XINL_QOS_LVL_REMAP_000(vbif)	(VBIF_XINL_QOS_RP_REMAP_000 + (vbif)->cap->qos_rp_remap_size)
>   
>   static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
>   		u32 *pnd_errors, u32 *src_errors)
> @@ -163,7 +163,7 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
>   
>   	c = &vbif->hw;
>   
> -	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(c->hwversion);
> +	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(vbif);
>   	reg_high = ((xin_id & 0x8) >> 3) * 4 + (level * 8);
>   	reg_shift = (xin_id & 0x7) * 4;
>   
