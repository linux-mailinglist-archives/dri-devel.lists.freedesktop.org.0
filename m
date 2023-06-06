Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5CF72585D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9F710E483;
	Wed,  7 Jun 2023 08:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7537910E39F;
 Tue,  6 Jun 2023 19:44:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356Jb4JW018493; Tue, 6 Jun 2023 19:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7Ib3pRB2zdQ1NMCX/TsQx6PlX7XSN7yv8pkLwJ5z4Os=;
 b=mLLJUk4di1xJmSivr1//dz/KTnmNwMu1EjGVpGwpu5tY1FJEO5fjyVP1MI2yGyboSgyw
 kTxqjLE8aV6T0+80R872JsGO2nlx2nox+CuWvhPrfeM9bl37BUgcJ3C79LYMenOrdILg
 Am7BrD7HKh/6fdf2yZpDrKXwAf/urSyP0y2hjbzf8aDSdlMdmA+DhLtLeKlioUqG5VOh
 V/oy3i4Ktx4JXFzy8sHwP5F/WB0OC/uraEA3Loa1kzHaDu52Ox6ZeqZVbCu/tDQDcGhv
 CB0LjfLiGcLNQUDql6e5OKABqmE6I+Q0FmkcM9AtXg22dem+eiYgqJrsuLYDvKMu7H4S fA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a9u83g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 19:44:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356Jielf018343
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 19:44:40 GMT
Received: from [10.134.71.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 12:44:39 -0700
Message-ID: <576a2645-4e06-2ad2-475a-39451fae4bf7@quicinc.com>
Date: Tue, 6 Jun 2023 12:44:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v3 4/7] drm/msm/mdp5: Add MDP5 configuration
 for MSM8226
To: Luca Weiss <luca@z3ntu.xyz>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-4-b6284145d67a@z3ntu.xyz>
Content-Language: en-US
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230308-msm8226-mdp-v3-4-b6284145d67a@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yy4Lw2zr9MujSmW7W8XpVZudq2N4Cnnf
X-Proofpoint-GUID: yy4Lw2zr9MujSmW7W8XpVZudq2N4Cnnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_14,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060167
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:26 +0000
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/2023 10:00 AM, Luca Weiss wrote:
> Add the required config for the v1.1 MDP5 found on MSM8226.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 2eec2d78f32a..694d54341337 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -103,6 +103,87 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
>   	.max_clk = 200000000,
>   };
>   
> +static const struct mdp5_cfg_hw msm8x26_config = {
> +	.name = "msm8x26",
> +	.mdp = {
> +		.count = 1,
> +		.caps = MDP_CAP_SMP |
> +			0,
> +	},
> +	.smp = {
> +		.mmb_count = 7,
> +		.mmb_size = 4096,
> +		.clients = {
> +			[SSPP_VIG0] =  1,
> +			[SSPP_DMA0] = 4,
> +			[SSPP_RGB0] = 7,
> +		},
> +	},
> +	.ctl = {
> +		.count = 2,
> +		.base = { 0x00500, 0x00600 },
> +		.flush_hw_mask = 0x0003ffff,
> +	},
> +	.pipe_vig = {
> +		.count = 1,
> +		.base = { 0x01100 },
> +		.caps = MDP_PIPE_CAP_HFLIP |
> +			MDP_PIPE_CAP_VFLIP |
> +			MDP_PIPE_CAP_SCALE |
> +			MDP_PIPE_CAP_CSC   |
> +			0,
> +	},
> +	.pipe_rgb = {
> +		.count = 1,
> +		.base = { 0x01d00 },
> +		.caps = MDP_PIPE_CAP_HFLIP |
> +			MDP_PIPE_CAP_VFLIP |
> +			MDP_PIPE_CAP_SCALE |
> +			0,
> +	},
> +	.pipe_dma = {
> +		.count = 1,
> +		.base = { 0x02900 },
> +		.caps = MDP_PIPE_CAP_HFLIP |
> +			MDP_PIPE_CAP_VFLIP |
> +			0,
> +	},
> +	.lm = {
> +		.count = 2,
> +		.base = { 0x03100, 0x03d00 },
> +		.instances = {
> +				{ .id = 0, .pp = 0, .dspp = 0,
> +				  .caps = MDP_LM_CAP_DISPLAY, },
> +				{ .id = 1, .pp = -1, .dspp = -1,
> +				  .caps = MDP_LM_CAP_WB },
> +			     },
> +		.nb_stages = 2,
> +		.max_width = 2048,
> +		.max_height = 0xFFFF,
> +	},
> +	.dspp = {
> +		.count = 1,
> +		.base = { 0x04500 },
> +	},
> +	.pp = {
> +		.count = 1,
> +		.base = { 0x21a00 },
> +	},
> +	.intf = {
> +		.base = { 0x00000, 0x21200 },
> +		.connect = {
> +			[0] = INTF_DISABLED,
> +			[1] = INTF_DSI,
> +		},
> +	},
> +	.perf = {
> +		.ab_inefficiency = 100,
> +		.ib_inefficiency = 200,
> +		.clk_inefficiency = 125
> +	},
> +	.max_clk = 200000000,
> +};
> +
>   static const struct mdp5_cfg_hw msm8x74v2_config = {
>   	.name = "msm8x74",
>   	.mdp = {
> @@ -1236,6 +1317,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
>   
>   static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
>   	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
> +	{ .revision = 1, .config = { .hw = &msm8x26_config } },
>   	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
>   	{ .revision = 3, .config = { .hw = &apq8084_config } },
>   	{ .revision = 6, .config = { .hw = &msm8x16_config } },
> 
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
