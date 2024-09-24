Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D19845EE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2361F10E8B0;
	Tue, 24 Sep 2024 12:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MA/u2rPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DC610E8AC;
 Tue, 24 Sep 2024 12:31:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O9HtHp029683;
 Tue, 24 Sep 2024 12:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KDMLxLpa4DvKZTxB9Er0izaxMUHOO8cKu8XznRIeN7A=; b=MA/u2rPQiMw7LHUh
 FKcze571vcNzzwHLePoNiOxUHD/by8Pqg1tElRTgdh0zWzMyvNZubuqII7xOBUQ6
 W6tLEdoer0LQLSDNVSgicW55obAtmW5v6PB+Uk2/YW3wlfPcDzbiMCp3KVC70u/2
 RqjJEdeps/7e8pdX/eNGIzEFYoQO5vSCTYEDxeikKz/1aOj04oTksiMhQcbkBwI9
 neBpo5iPJ+zLf8MjFnGQqXk3h9PT8HmMxXZ8v+moend7voAjMvQToTnDQpVs58Vf
 szrjBsgSZcml/DKoM1eOiOGXufQl4zd0nyizZIvxuLO/NrS9KCpl5ILs+l0ZoL2c
 dWh8ug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwer8hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 12:31:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OCVGYt026341
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 12:31:16 GMT
Received: from [10.204.67.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 05:31:08 -0700
Message-ID: <ba0bc896-41ad-4f1d-9218-fc5a44add422@quicinc.com>
Date: Tue, 24 Sep 2024 18:01:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SA8775P support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <swboyd@chromium.org>,
 <konrad.dybcio@linaro.org>, <danila@jiaxyga.com>,
 <bigfoot@classfun.cn>, <neil.armstrong@linaro.org>,
 <mailingradian@gmail.com>, <quic_jesszhan@quicinc.com>,
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <quic_kalyant@quicinc.com>, <quic_jmadiset@quicinc.com>,
 <quic_vpolimer@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-5-quic_mahap@quicinc.com>
 <v4cnmso3nl5oi3scd2lkg6kepb52vjrzgoti42ikds3y2wq6aw@sbn2yu4xeiun>
 <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com>
 <rmndmhq67lajdmva6gt46rqtkvf6jh2afbqazafz6oxv7ep56j@bznopz3aexyt>
From: Mahadevan P <quic_mahap@quicinc.com>
In-Reply-To: <rmndmhq67lajdmva6gt46rqtkvf6jh2afbqazafz6oxv7ep56j@bznopz3aexyt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Fgaw1YBB5oBIDuwJY2-TfFv7nOrfD-Y_
X-Proofpoint-ORIG-GUID: Fgaw1YBB5oBIDuwJY2-TfFv7nOrfD-Y_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=992 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240088
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


On 9/24/2024 5:46 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 24, 2024 at 04:42:02PM GMT, Mahadevan P wrote:
>> On 9/12/2024 1:34 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 12, 2024 at 12:44:36PM GMT, Mahadevan wrote:
>>>> Add definitions for the display hardware used on the
>>>> Qualcomm SA8775P platform.
>>>>
>>>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
>>>> ---
>>>>    .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>>>>    4 files changed, 491 insertions(+), 3 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>>>>
> [...]
>
>>>> +static const struct dpu_intf_cfg sa8775p_intf[] = {
>>>> +	{
>>>> +		.name = "intf_0", .id = INTF_0,
>>>> +		.base = 0x34000, .len = 0x280,
>>>> +		.features = INTF_SC7280_MASK,
>>>> +		.type = INTF_DP,
>>>> +		.controller_id = MSM_DP_CONTROLLER_0,
>>>> +		.prog_fetch_lines_worst_case = 24,
>>>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
>>>> +	}, {
>>>> +		.name = "intf_1", .id = INTF_1,
>>>> +		.base = 0x35000, .len = 0x300,
>>>> +		.features = INTF_SC7280_MASK,
>>>> +		.type = INTF_DSI,
>>>> +		.controller_id = MSM_DSI_CONTROLLER_0,
>>>> +		.prog_fetch_lines_worst_case = 24,
>>>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>>>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>>>> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
>>>> +	}, {
>>>> +		.name = "intf_2", .id = INTF_2,
>>>> +		.base = 0x36000, .len = 0x300,
>>>> +		.features = INTF_SC7280_MASK,
>>>> +		.type = INTF_DSI,
>>>> +		.controller_id = MSM_DSI_CONTROLLER_1,
>>>> +		.prog_fetch_lines_worst_case = 24,
>>>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>>>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>>>> +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
>>>> +	}, {
>>>> +		.name = "intf_3", .id = INTF_3,
>>>> +		.base = 0x37000, .len = 0x280,
>>>> +		.features = INTF_SC7280_MASK,
>>>> +		.type = INTF_NONE,
>>>> +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>>> +		.prog_fetch_lines_worst_case = 24,
>>>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
>>>> +	}, {
>>>> +		.name = "intf_4", .id = INTF_4,
>>>> +		.base = 0x38000, .len = 0x280,
>>>> +		.features = INTF_SC7280_MASK,
>>>> +		.type = INTF_DP,
>>>> +		.controller_id = MSM_DP_CONTROLLER_1,
>>>> +		.prog_fetch_lines_worst_case = 24,
>>>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
>>>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
>>>> +	}, {
>>> Where is intf_5 ?
>>
>> intf_5 of base address 0x39000 is not supported on this target.
> Not supported by whom?


In sa8775p mdss architecture intf_5 is not present. So we are not adding 
in SW too.


>
>>
>>>> +		.name = "intf_6", .id = INTF_6,
>>>> +		.base = 0x3A000, .len = 0x280,
>>>> +		.features = INTF_SC7280_MASK,
>>>> +		.type = INTF_NONE,
>>>> +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>>> +		.prog_fetch_lines_worst_case = 24,
>>>> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>>> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>>> +	}, {
> [skipped]
>
>>>> @@ -1464,6 +1464,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>>>    	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
>>>>    	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
>>>>    	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
>>>> +	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
>>> Wrong sorting order
>>
>> Sure will move below sm8650-dpu.
> What makes you think that in a dictionary sa8775p comes after sm8650?


Will update according to alphabetical order in next patch.


>
>>
>>>>    	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
>>>>    	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
>>>>    	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
>>>> -- 
>>>> 2.34.1
>>>>
