Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A288B19B59
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 08:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AE710E2B4;
	Mon,  4 Aug 2025 06:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GQKD5j3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315310E011;
 Mon,  4 Aug 2025 06:11:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NmQcu023642;
 Mon, 4 Aug 2025 06:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TLVvWx7auwW1Ppo2fq0JsGCh3Ktn/Y3PWgh+pjCBlt4=; b=GQKD5j3Ywim0MOLP
 oDRk0EvyE5Hlbz9uN4yTMppUrnsxF42FeyxVWSQvZFxUnzNVLwJ2h8HeTedIzX6M
 mzx9TYqgfXyY4A58J568xtYLOND+tYeXadfDLLkMZ15SxsUoSIRHU5JsD9Y3ZdnE
 9GbhhsTdHGJc05XrPF0uhifq+YMgl2rdTbhd5YzJSAGEcNeipdEChUl4tdB7m3Kz
 iwOHskMVOZFyKOW2fyAA/ywZcidlxW/+XS1epgPlYXyV4UdaE5wu4QFpjLA/fDV5
 s4ENACyK7yoffIwl3CQiSl4eYIj4lRmH1qEjnUerMizzRJX704IZuayBPJjGm0HN
 REQlnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m3pff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Aug 2025 06:11:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5746B4Om021188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Aug 2025 06:11:04 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 3 Aug
 2025 23:10:58 -0700
Message-ID: <a3ee95ab-79ba-443d-9b40-35531da48cc6@quicinc.com>
Date: Mon, 4 Aug 2025 14:10:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 <freedreno@lists.freedesktop.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 <dri-devel@lists.freedesktop.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 David Airlie <airlied@gmail.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <175390746243.1660386.11206814214268936734.robh@kernel.org>
 <cdbe1013-4f15-4638-870b-151292920ce7@quicinc.com>
 <aiaonlbxwzbpuvnzijzp7btf2oxvtseq7zoylopllooeqshmux@unhoejkdyl6v>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <aiaonlbxwzbpuvnzijzp7btf2oxvtseq7zoylopllooeqshmux@unhoejkdyl6v>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=68904efa cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8
 a=voM4FWlXAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=zHEVz4YWXsmZ1JJS7FsA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=IC2XNlieTeVoXbcui8wp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _ofudS0BzEGoMe8LuQozfjuUYp788ZHx
X-Proofpoint-ORIG-GUID: _ofudS0BzEGoMe8LuQozfjuUYp788ZHx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzMCBTYWx0ZWRfX2w/lF8tt8WzP
 FWApmrkUiilEHE6bBjP5vVVcs2OcRGohFDiBfQ7xvTPoTjR4LhW+Ngk5zd6Ow22uLV4KlFNZdJD
 RHRgU7jcjms3kJqMorw4OcTLl/17NA1WLEDxT1AgmUqfJs206P7hjbEupIVOLPmIV6VorqlX5ib
 yPg99wungEwBYIqG7aMENMV9KBRODRyEmKCGON28uPAUAfjhw62ZEE2CAC4wCyTP2z4N9HofVrn
 dePbl8o8VQePfuSxf43Jb2WU1Nj+a5m1iuL7e1c1PqDeUHA6/BOJSTGNIcUcjIkKCgFbkwqsDM9
 GlkhhBEEnmIVGOl1Yvb32EoScHK+qYFTnTx38YT9WRmU1AdypWj4FADfyK66MiO2stWE9ONE1SI
 q0d4KQyKN3C/B7t8oe56QsWywQzJXhGAxd16AS6K1cg01s3ZrI9G8ejqBbCsbbxk+jzIAE7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040030
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



On 2025/8/4 12:49, Dmitry Baryshkov wrote:
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> 
> On Mon, Aug 04, 2025 at 12:00:39PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/7/31 4:31, Rob Herring (Arm) wrote:
>>> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
>>>
>>> On Wed, 30 Jul 2025 17:42:28 +0800, Yongxing Mou wrote:
>>>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
>>>>    1 file changed, 284 insertions(+)
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible:0: 'qcom,qcs8300-edp-phy' is not one of ['qcom,sa8775p-edp-phy', 'qcom,sc7280-edp-phy', 'qcom,sc8180x-edp-phy', 'qcom,sc8280xp-dp-phy', 'qcom,sc8280xp-edp-phy', 'qcom,x1e80100-dp-phy']
>>>           from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible: ['qcom,qcs8300-edp-phy', 'qcom,sa8775p-edp-phy'] is too long
>>>           from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com
>>>
>>> The base for the series is generally the latest rc1. A different dependency
>>> should be noted in *this* patch.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit after running the above command yourself. Note
>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>> your schema. However, it must be unset to test all examples with your schema.
>>>
>> This warning need to apply this patch..
>> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
>> thanks, link in the cover-letter seem wrong. and there is an unnecessary ~
> 
> It's not listed in b4 dependencies.
> 
> --
> With best wishes
> Dmitry
Ohh, sorry.. will update it in next version...
