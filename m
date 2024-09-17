Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8697ACAC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 10:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D810E1FE;
	Tue, 17 Sep 2024 08:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YyQ8hnum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06F010E1FE;
 Tue, 17 Sep 2024 08:13:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GFEtL6007234;
 Tue, 17 Sep 2024 08:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6RdX0bFCBFita5q9pO6XTSQJpayvjOJ/luZyvNW3Cn0=; b=YyQ8hnumYeB79eof
 espbv8XOu908CLozu+8rC7jxULWG1TzfYrKk1t65xpvxuCS1UU/tZGbGfgk3/6Ru
 Q0QZu9KJ3fbHIAxStdQ92/9LKjMWoEFQlO4HR0m4NcmSzV8LAoTsk+yLsNXmdFDb
 hRZTp5MJat/PTBlqTvwzC0dxJxseWEzt3Q0tmS9evQqwXkuwj2jXHw83raE4tcTd
 v7kjws+vE0a7KDJLFXBsHGn7o+eKsCL8+v1E2pKckrs7hgNyT2D6VI1PzlSnlj4t
 JsEqpy+j2NT7WL/XeHfPbGlQ1+RD026vBsteYGdVKl1MEwszKGJhe3Qp0B7e+J6W
 kx11+w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jhp8e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 08:13:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H8D65w000864
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 08:13:06 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 01:12:57 -0700
Message-ID: <b2d94fa5-6924-46f6-95cf-bde315ccbdbd@quicinc.com>
Date: Tue, 17 Sep 2024 13:42:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
 <andersson@kernel.org>, <simona@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
 <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <quic_riteshk@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-6-quic_mukhopad@quicinc.com>
 <ZuH3WqMwn7fl3nhh@hu-bjorande-lv.qualcomm.com>
 <a44a6f08-1f4a-4e5c-a4e4-30ab65c467f7@quicinc.com>
 <ZuStkRFvwJT7re6D@hu-bjorande-lv.qualcomm.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <ZuStkRFvwJT7re6D@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: C2cU45NdQrzcj1_yrumqfypF_LZ5lcmM
X-Proofpoint-GUID: C2cU45NdQrzcj1_yrumqfypF_LZ5lcmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170061
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


On 9/14/2024 2:54 AM, Bjorn Andersson wrote:
> On Thu, Sep 12, 2024 at 03:34:05PM +0530, Soutrik Mukhopadhyay wrote:
>> On 9/12/2024 1:32 AM, Bjorn Andersson wrote:
>>> On Wed, Sep 11, 2024 at 03:38:13PM +0530, Soutrik Mukhopadhyay wrote:
>>>> The Qualcomm SA8775P platform comes with a DisplayPort controller
>>>> with a different base offset than the previous SoCs,
>>>> add support for this in the DisplayPort driver.
> Please check the line wrapping of this as well; the lines here should be
> wrapped at 75 columns.


Yes, it is within 75 columns, we ran checkpatch.pl before posting the patch.


>
>>>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index e1228fb093ee..e4954fd99eb0 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -118,6 +118,12 @@ struct msm_dp_desc {
>>>>    	bool wide_bus_supported;
>>>>    };
>>>> +static const struct msm_dp_desc sa8775p_dp_descs[] = {
>>>> +	{ .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>>> +	{ .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>>> Why is this list incomplete?
>>>
>>> Regards,
>>> Bjorn
>>
>> Do you mean to add for mdss_1 as well?
>>
> I don't see a reason for not submitting them as well.


Sure, we will add for mdss_1 as well.


>
>> We only added dp controllers for mdss_0 as we plan to validate and enable
>> only these.
>>
> As far as I can tell there are 5 DPTX blocks on mdss_0.
>
>
> It is perfectly fine that you just state in the commit message that
> "Only MDSS0 DPTX0 and DPTX1 have been validated", but please add the
> others as well in this commit.
>
> Regards,
> Bjorn


We cross-checked the mdss architecture and found that there are only 2 
dp controllers for each mdss.

We will add all 4 and mention in the commit message that "Only MDSS0 
DPTX0 and DPTX1 have been validated".


>
>>>> +	{}
>>>> +};
>>>> +
>>>>    static const struct msm_dp_desc sc7180_dp_descs[] = {
>>>>    	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>>>>    	{}
>>>> @@ -162,6 +168,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
>>>>    };
>>>>    static const struct of_device_id dp_dt_match[] = {
>>>> +	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
>>>>    	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>>>>    	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
>>>>    	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
>>>> -- 
>>>> 2.17.1
>>>>
