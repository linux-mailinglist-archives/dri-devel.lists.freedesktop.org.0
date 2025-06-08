Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A98AD142C
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 22:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632C010E691;
	Sun,  8 Jun 2025 20:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bS5KRQr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2D510E691;
 Sun,  8 Jun 2025 20:19:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589eTe4001097;
 Sun, 8 Jun 2025 20:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ebjeNRseKqUDttm9BjoWMCbWg+pOJ3HwUqTpbP41Hfg=; b=bS5KRQr1+FUcJVd6
 2jLkeyN71QdLA56H3/wKqgC4H3NEPZNV4ffSyALggB2aCQEC/fHsFSj2hXeX6ACV
 Hy6/j1WjSJ0pfsqZ4eOcbnMtVnVSsdeejtF+NvqM9lm26j3m1RqqV1PbxQGFBdLP
 74NC3H/t/bc/K/5bMk1okQmgJBcIPss+slkzuAyiggjPlb3xzKmME6xW+i8LZ6Gj
 TBEVKlxW227OMPh3UXTNN72p0EhdcFtw85njZqiPqZOoDyir1vuasT+EEB/B1NS0
 oniaBg+aC2nuid2rrnVLL28qn7Bpva1/q8r5x0w/bEhGIVtVQaaDrfjrygsCDmnI
 PyavVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv3ryx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Jun 2025 20:18:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 558KIowt001788
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 8 Jun 2025 20:18:50 GMT
Received: from [10.216.51.238] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Jun 2025
 13:18:43 -0700
Message-ID: <dbbcc6b5-0d7d-440e-97e6-07b430d4f657@quicinc.com>
Date: Mon, 9 Jun 2025 01:48:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 <rob.clark@oss.qualcomm.com>
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Andersson
 <andersson@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
 <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
 <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
 <rwjc7zkitubi6cdre5a7owmo76nopavkgifvvn6yq2mv2hrth4@bhwbodchd2gx>
 <CACSVV03mNkELWDB_uxdjEa5GeWZUY=42O8QG4qTrg6zquT1Bgw@mail.gmail.com>
 <42a69fa4-48ac-4a2f-a2ff-b4e1fe3a228a@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <42a69fa4-48ac-4a2f-a2ff-b4e1fe3a228a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gIssG8YUeIYlp7vgTBTkhvyilbuiGDki
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6845f02b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=jk5spBuy_7rvZDU0t7YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gIssG8YUeIYlp7vgTBTkhvyilbuiGDki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE2NSBTYWx0ZWRfX8+GaHB3UvpfZ
 pNYvCtSCb/GhPuuKQlUpl8Zn7icxtjEtOnR/W1M/7wSLHpLDBjUapt3avXNkxwAWXqUjP0OE7r5
 s+D/ja+ayUtu+JF+WA7igMK1mdo6XsQRhKem1puBl11qRsklPrDb/LlJIXRck7gHCqWJTFH3NNo
 VqhU3fXoDFfwYSZO6vIKSWhDxWgsyABk2H/j34E8PngxTyskM5Me3jbaEe+gq+IZwc6GapZ7u+r
 f+xmYi/M7wt95Myj4B9yRGzz7wcJgY9aHKn2NL3cPVZNcu/CUcKg9eyDi/ik6tv6Q7uVAEPu3pe
 RcaHHKgRquPBaZXwAU1uolXVEKxFXsHNXe4BRECaHFG0+kG/LhGf/4ndH+CBC9g6I/pdO5u88Q9
 HIKIFqtLs8F7aRnhjaCTBYhJC/jQjWYJQz98OeO/w9woGKDSOYs7w8FjVBJVmWWr1F39h00H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080165
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

On 6/8/2025 8:52 PM, Dmitry Baryshkov wrote:
> On 08/06/2025 18:20, Rob Clark wrote:
>> On Sun, Jun 8, 2025 at 8:09 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Sun, Jun 08, 2025 at 07:10:11AM -0700, Rob Clark wrote:
>>>> On Sat, Jun 7, 2025 at 1:17 PM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
>>>>>> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
>>>>>> version of Adreno X1-85 GPU. Describe this new GPU and also add
>>>>>> the secure gpu firmware path that should used for X1P42100 CRD.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>>>>>>   arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>>>>>>   arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++
>>>>>> +++++++++++++-
>>>>>>   3 files changed, 131 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/
>>>>>> boot/dts/qcom/x1e80100.dtsi
>>>>>> index
>>>>>> a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>>> @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
>>>>>>                        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>                };
>>>>>>
>>>>>> +             qfprom: efuse@221c8000 {
>>>>>> +                     compatible = "qcom,x1e80100-qfprom",
>>>>>> "qcom,qfprom";
>>>>>> +                     reg = <0 0x221c8000 0 0x1000>;
>>>>>> +                     #address-cells = <1>;
>>>>>> +                     #size-cells = <1>;
>>>>>> +             };
>>>>>> +
>>>>>>                pmu@24091000 {
>>>>>>                        compatible = "qcom,x1e80100-llcc-bwmon",
>>>>>> "qcom,sc7280-llcc-bwmon";
>>>>>>                        reg = <0 0x24091000 0 0x1000>;
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/
>>>>>> arm64/boot/dts/qcom/x1p42100-crd.dts
>>>>>> index
>>>>>> cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>>>>>> @@ -15,3 +15,7 @@ / {
>>>>>>        model = "Qualcomm Technologies, Inc. X1P42100 CRD";
>>>>>>        compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
>>>>>>   };
>>>>>> +
>>>>>> +&gpu_zap_shader {
>>>>>> +     firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
>>>>>> +};
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/
>>>>>> boot/dts/qcom/x1p42100.dtsi
>>>>>> index
>>>>>> 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
>>>>>> @@ -17,15 +17,134 @@
>>>>>>   /delete-node/ &cpu_pd9;
>>>>>>   /delete-node/ &cpu_pd10;
>>>>>>   /delete-node/ &cpu_pd11;
>>>>>> +/delete-node/ &gpu_opp_table;
>>>>>>   /delete-node/ &pcie3_phy;
>>>>>>
>>>>>>   &gcc {
>>>>>>        compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>>>>>>   };
>>>>>>
>>>>>> -/* The GPU is physically different and will be brought up later */
>>>>>> +&gmu {
>>>>>> +     /delete-property/ compatible;
>>>>>> +     compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
>>>>>> +};
>>>>>> +
>>>>>> +&qfprom {
>>>>>> +     gpu_speed_bin: gpu_speed_bin@119 {
>>>>>> +             reg = <0x119 0x2>;
>>>>>> +             bits = <7 9>;
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>>   &gpu {
>>>>>>        /delete-property/ compatible;
>>>>>
>>>>> I think, you can drop this line.

I wasn't sure about this and I thought it was harmless to delete it.
Anyway, I will remove the "delete" from both GPU and GMU nodes.

>>>>>
>>>>>> +
>>>>>> +     compatible = "qcom,adreno-43030c00", "qcom,adreno";
>>>>>> +
>>>>>> +     nvmem-cells = <&gpu_speed_bin>;
>>>>>> +     nvmem-cell-names = "speed_bin";
>>>>>> +
>>>>>> +     gpu_opp_table: opp-table {
>>>>>> +             compatible = "operating-points-v2-adreno",
>>>>>> "operating-points-v2";
>>>>>> +
>>>>>> +             opp-1400000000 {
>>>>>> +                     opp-hz = /bits/ 64 <1400000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
>>>>>> +                     opp-peak-kBps = <16500000>;
>>>>>> +                     qcom,opp-acd-level = <0xa8295ffd>;
>>>>>> +                     opp-supported-hw = <0x3>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-1250000000 {
>>>>>> +                     opp-hz = /bits/ 64 <1250000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
>>>>>> +                     opp-peak-kBps = <16500000>;
>>>>>> +                     qcom,opp-acd-level = <0x882a5ffd>;
>>>>>> +                     opp-supported-hw = <0x7>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-1107000000 {
>>>>>> +                     opp-hz = /bits/ 64 <1107000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>>>>>> +                     opp-peak-kBps = <16500000>;
>>>>>> +                     qcom,opp-acd-level = <0x882a5ffd>;
>>>>>> +                     opp-supported-hw = <0xf>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-1014000000 {
>>>>>> +                     opp-hz = /bits/ 64 <1014000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>>>>>> +                     opp-peak-kBps = <14398438>;
>>>>>> +                     qcom,opp-acd-level = <0xa82a5ffd>;
>>>>>> +                     opp-supported-hw = <0xf>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-940000000 {
>>>>>> +                     opp-hz = /bits/ 64 <940000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>>>>>> +                     opp-peak-kBps = <14398438>;
>>>>>> +                     qcom,opp-acd-level = <0xa82a5ffd>;
>>>>>> +                     opp-supported-hw = <0xf>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-825000000 {
>>>>>> +                     opp-hz = /bits/ 64 <825000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>>>>>> +                     opp-peak-kBps = <12449219>;
>>>>>> +                     qcom,opp-acd-level = <0x882b5ffd>;
>>>>>> +                     opp-supported-hw = <0xf>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-720000000 {
>>>>>> +                     opp-hz = /bits/ 64 <720000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
>>>>>> +                     opp-peak-kBps = <10687500>;
>>>>>> +                     qcom,opp-acd-level = <0xa82c5ffd>;
>>>>>> +                     opp-supported-hw = <0xf>;
>>>>>> +             };
>>>>>> +
>>>>>> +             opp-666000000-0 {
>>>>>> +                     opp-hz = /bits/ 64 <666000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>>>>> +                     opp-peak-kBps = <8171875>;
>>>>>> +                     qcom,opp-acd-level = <0xa82d5ffd>;
>>>>>> +                     opp-supported-hw = <0xf>;
>>>>>> +             };
>>>>>> +
>>>>>> +             /* Only applicable for SKUs which has 666Mhz as Fmax */
>>>>>> +             opp-666000000-1 {
>>>>>> +                     opp-hz = /bits/ 64 <666000000>;
>>>>>> +                     opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>>>>> +                     opp-peak-kBps = <16500000>;
>>>>>
>>>>> This looks odd, why is it so high?
>>>>
>>>> You want max bandwidth on max opp
>>>
>>> Yes, but can it actually sustain / provide this BW?
>>>
>>
>> I'd have to trust Akhil on that one, but I have no reason to believe
>> otherwise.  Just pointing out we've done analogous things elsewhere
>> (for ex, cpu bw for sc7180-lite.dtsi)

Window's GPU KMD seems to vote Max bandwidth for this SKU, so I think
this is fine. Our GPUs from last few generations can easily saturate DDR
with the right usecase.

-Akhil

> 
> Ack. Then I'll wait for v2 with no deleting of compatible lines (a new
> line here would just replace the existing one).
> 
> 

