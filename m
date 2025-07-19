Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5573B0ACB8
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 02:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F96410EA59;
	Sat, 19 Jul 2025 00:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogcVf+1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D21610EA59
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 00:17:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG9FYC020662
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 00:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nuzVlXIUuXiwaB1rXnj3/BisM57GE6oPUvR/VRrQ9ko=; b=ogcVf+1Mi2RJjWsm
 N4/bxGhDxJWgZEmBOPRgtXkG6XeX0sqcmyGhMFNYk+olWF3MPuliVDBYQRQfFtIZ
 3C/k+l68y/QjhuoTTllfs6oDHg4syZVN9BBwe3VaPqYIvKnmdfY844ZEcOZWnTPo
 uRGU8a6h2Xk7ATsmk8MMQBrsNPmRGh/ThBgtZ74HevpdHxQeRR+2rfI5nxZDgc1t
 1XEXuLaqG+h26EhrHWTDlu5xTJhwBVJakYvvZ70dlilfV9v3DTRZviZRt8yZO70z
 jjVRYENQmAaetturbXa+O3691tdeP8ROS8SsxPjww+iyDdOBchUDb9HEfXTAfT6c
 pCAlOw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dprbr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 00:17:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b3642ab4429so1852268a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752884220; x=1753489020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nuzVlXIUuXiwaB1rXnj3/BisM57GE6oPUvR/VRrQ9ko=;
 b=QqGRyHcRb9ukA9ogd3xICAPH+nUPzaZFEkvdICGCqmtQ5vLDGOydGRxRifIzKNj3hw
 t5AfKRA70pLYwxxE6h/5OWRiIkM48iByZPiCnHEslN1SbYhG15qBOPVNTvRi6H4fvfvP
 Lf3cvYlI6e4KFMdG88Nzb+VSUt0tz01rlnjeAqgNKNq9k0zDCyuVtG4Dc3rwAJosaMmo
 RhYH93q89svjmeRW7wYn58ZbWnvlbMHlfVra0+yIBoIq+YbRvNG2RGZ/i1GnRGkCDkka
 KbkxQuqf8qVEVeu94AmRcJ4OeI9mvYL9Vn1JINUJDF5bKCHBJydcQVD43mvqJqvOg2DQ
 aneQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn9IkP8AIRCoskGV2Qv1doQ/QxJ9Iv8mC9KYJomLDTPsaHS6XgJ3/UkCrAszb6dqsXe+vpqUuOFjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPjIhTIRpwF4WTcxM91zMq4wEPyrWdhu4gd27Wk5QgR3wFU1fU
 PpjyQtl3ODtLqqNrchySWhxuXKTCWdJXBLzIuFXWOjTCY4eRSaxy+o3cw/OH7COXUd6T7SWzZiv
 TPKi/5eTQjofBJ4NWlJw88cElatYCXVn440vgunjL9SHgzAUzhJ9vuZRwVjLg4bKKp5bHq0+nrk
 vcl0A=
X-Gm-Gg: ASbGncvsdh3nYoUx699HUdapjSaqnru734N6xykQP8AD2uVANVyNbHV7k8/ckElHGp/
 Aayc8AmQ6o3wXJx7jXLUt/ya1MS+jvMCWm0LbeXEh82Jble50SmBgSyvgajQyXSG8BXRGVia8Oa
 oJnO+jXtqxd3IuMU0Vyo40zexXTLy1HrrOl8iYHNJcg+XFouNMfQEUTtYSEisIVPqbZuZrJC5pF
 RDPr7vZZNUwS9syFr4CjRbp+QFl2o9JTCRYvmr68zTVHcFRWi58lGnqtnT6UNnxR7RRBEKuB6iZ
 yIqj3J67qwZFcLq/PCR/wCBU6jP5FpCSk3UnsRBZ+3d0H0X2t1sHLvnqh18/FjGl3GAlz2b9Xqe
 5p1eZGUrnsyMN0O72klmfUg==
X-Received: by 2002:a17:90b:5385:b0:31a:bc78:7fe1 with SMTP id
 98e67ed59e1d1-31c9f42ea51mr19843823a91.18.1752884219765; 
 Fri, 18 Jul 2025 17:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZU0AEoPTJMZYugSgAQPqMLAHd7s8fV5oFYzAqjw2f8AX6fmugw7QfAMkMHVcutfa9ueugdA==
X-Received: by 2002:a17:90b:5385:b0:31a:bc78:7fe1 with SMTP id
 98e67ed59e1d1-31c9f42ea51mr19843760a91.18.1752884219178; 
 Fri, 18 Jul 2025 17:16:59 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e5b038sm1959290a91.10.2025.07.18.17.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 17:16:58 -0700 (PDT)
Message-ID: <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 17:16:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDAwMCBTYWx0ZWRfX0swYmaETcKa7
 Yw9XRkGf3zM2SPutNV+YiJIJrpcezBM2HjkTy2fcqFJZVklCti4tGwgZz2ef+IhXzf4BOGV+R0I
 gmsMUjBSHyX1d0YlPC22kFk9RwiceiKtRxs8t8j6GAASCLt8NXcUkHc0i9XX6KuKhqr7Pl12qvv
 AmtDB+7yOGf+OJdZSe0THCzvmuOd0HoVjUs+TjNh0h+G0Q1FqPM9CU24u07LxQtzFPxVUOjcT7e
 I2mnWinps8YPtHKpoaDUQotnkTlnZ0z5vuEbDncbP0qANPMg8Zi8ehJSL1rA2UNwUVO9J87+PUe
 y5q3TrtNK+xVqTaukv5MYencl/1lCmgmhzG/Ych/JVAae3PIsNPdZpawXSHlvR18Eg31slNEygj
 HthhnIfB8exKaG2UfMpP+cb5t2gmXoiap51smPwd79KeOd9mBS6eRiRDGt0XvapC8bO6qAJV
X-Proofpoint-GUID: D4iFoBskltLCr2LtFmKpnyTLM7CQG95A
X-Proofpoint-ORIG-GUID: D4iFoBskltLCr2LtFmKpnyTLM7CQG95A
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687ae3fd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EOe-Aop8_12Esa9JHLYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_06,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190000
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



On 7/18/2025 2:13 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Please fix the patch subject.

Hi Dmitry,

Ack.

> 
>>
>> Add x1e80100 to the dp-controller bindings, fix the
>> displayport-controller reg bindings, and drop
>> assigned-clock-parents/assigned-clocks
> 
> Why?

IIRC issues with the x1e80100 dp-controller bindings (i.e. the reg 
bindings) weren't being picked up by dtschema because the x1e80100-dp 
compatible string wasn't in dp-controller.yaml.

I can add this to the commit msg after moving the 
assigned-clocks/clock-parents change to patch 3.

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
>>   .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
> 
> Split into two commits.

Would it be better if I kept the compatible/reg bindings fix in this 
commit then squashed the assigned-clocks/clock-parents change with patch 3?

Thanks,

Jessica Zhang

> 
>>   2 files changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323b..4676aa8db2f4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -29,6 +29,8 @@ properties:
>>             - qcom,sdm845-dp
>>             - qcom,sm8350-dp
>>             - qcom,sm8650-dp
>> +          - qcom,x1e80100-dp
>> +
>>         - items:
>>             - enum:
>>                 - qcom,sar2130p-dp
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>> index 3b01a0e47333..0e699de684c8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
>> @@ -170,11 +170,11 @@ examples:
>>   
>>           displayport-controller@ae90000 {
>>               compatible = "qcom,x1e80100-dp";
>> -            reg = <0 0xae90000 0 0x200>,
>> -                  <0 0xae90200 0 0x200>,
>> -                  <0 0xae90400 0 0x600>,
>> -                  <0 0xae91000 0 0x400>,
>> -                  <0 0xae91400 0 0x400>;
>> +            reg = <0xae90000 0x200>,
>> +                  <0xae90200 0x200>,
>> +                  <0xae90400 0x600>,
>> +                  <0xae91000 0x400>,
>> +                  <0xae91400 0x400>;
>>   
>>               interrupt-parent = <&mdss>;
>>               interrupts = <12>;
>> @@ -189,11 +189,6 @@ examples:
>>                       "ctrl_link_iface",
>>                       "stream_pixel";
>>   
>> -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
>> -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
>> -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> -
>>               operating-points-v2 = <&mdss_dp0_opp_table>;
>>   
>>               power-domains = <&rpmhpd RPMHPD_MMCX>;
>>
>> -- 
>> 2.50.1
>>
> 

