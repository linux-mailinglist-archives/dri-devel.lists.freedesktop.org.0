Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6CBB4258D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EA510E8CA;
	Wed,  3 Sep 2025 15:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRKl18PC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E41810E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 15:33:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx2pv019832
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 15:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 18o1iHxtl5lTw0Ly+5dz1N5tWp+vbDygIfwrS6qTOYE=; b=mRKl18PCkjiiZrjF
 RK5cDhHOTeFBUGNaLF50985gAUPoKy0UxpWGyefJ/sIymAFf9WdrsZAvBGysKlZL
 ogiYrL67EsG/NDKsyv2D/2YyeA8ZAXXglAo1vppSAZ4KMdVWXVzZP0uFT2kC9njE
 QJkiDe9jZk+J7xcYcUwICfIwE0lMk4sXFh/gXB9jrJMF1KyDr/qu4UlqyRQ/STiQ
 rVh6q10wu9HngwX5Ir35vQ8xCcVWY4BM653n4wK14w7SvJOmJcT75oD6f8ey23UK
 SyGxuNtnf3SMY591WQwDVi2Ng2a8+Vieb1aWog1FVGfwl+yldEo8irqlQUxCv8jP
 Sl6RJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk941mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 15:33:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b32dfb5c6fso95351cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 08:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756913627; x=1757518427;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18o1iHxtl5lTw0Ly+5dz1N5tWp+vbDygIfwrS6qTOYE=;
 b=s94a7jykEIBqhnM4tlSmcZm6mlTn21nb+DzOg2hbWS52oXGZ5Bu6Kx+h2iuDdocSY8
 GPbnyuUBoR4F3yaGpycDSbbDkQ7bbNq/vN+cOkBhK230du54B/E/vfFXPT3jXKMft+X8
 NnMrL9HU5+JzhLoK60Pzg5o+8FsRfYfNibVAAIsONnS6Gv3JXEaKcawM8xWYoUNgwxtO
 kVl8uv3YNOcn7ktU23vvdwfnXDo2IzhwIseNq24NAqUEs6S33IzUfAVzNfElNNdorH/c
 3fVr0JirARisUPP86L3Quv4PoOhrmJh+WZKf/XlUp/wZnMNIQLUC3YLJbt4wrw9eOcoS
 fsjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Mx+ELLQbVoivbXzHubT242hT+xrumfKeNfHPGL/bPvJTqY7LBjZUw3eOf5zXs4rg8TWmybt2bm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoKjUop/UijqhhycQ/eaMLmPXu+vvj7mPcVY9oFqF1rAnOyn4s
 nG9+15vmD4cCIB4/yJaXdSLw/hTZQNjjRIHMXqSodgSFYjpSbQOcTUUs7fnyAXLq2PpLyaF6pkB
 tXjYQqoP46151k7tzvxeuIOwlgzdPpMcOqwFdAWpkxU8E1qF29zz7kmmLfcdEafPD8ahEGgg=
X-Gm-Gg: ASbGncvj9AQ1DQ48cL9uXZm5E42hMhX9VwcjAF0kIuKDuz6DeXuG5JynQpraae1rXz2
 NxycETJgbWU631Bmk5VKcNqHdFYPNHajVomWhrdx6SqQcJw/p+qTaEdJXqR+5pq6mZHwCcOXJco
 DaGstjdTNFZ517LousP6WxorWtc2JkNnATqCVYaFDxEl4PEdKpWrtt/A2JyCfVdLGtw+g8n2cx9
 yJ0JRZhz9rRYbCBd5ZC5vmvAzFBkcWrwkbfTHwJIPdetdeWQu6ODGBdpNBmqmJGsZHFFcx1sp9j
 os1X30LUHHM8xuzXU7gHSVnVNI8smTl4GHwO2nBdE/wxwV4AT2Jx5GFMNc0HDDnQ6+oHUlob5I5
 8aVWX861L+HDf5qs39b2YxA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id
 d75a77b69052e-4b5a0fb5d27mr3956011cf.2.1756913626418; 
 Wed, 03 Sep 2025 08:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL1vuGWMGXs2GJGdTf4JnsvsnA4SogcFyon1Ve1Y6vNl70a0aW3lgP59SAzB8uqaJmkyQcnA==
X-Received: by 2002:a05:622a:295:b0:4b5:a0fb:599e with SMTP id
 d75a77b69052e-4b5a0fb5d27mr3955501cf.2.1756913625820; 
 Wed, 03 Sep 2025 08:33:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff138a8c1dsm1235771166b.99.2025.09.03.08.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:33:45 -0700 (PDT)
Message-ID: <f34c72ee-971b-47e8-8d49-6355b2660925@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-9-7526f0311eaa@oss.qualcomm.com>
 <964a58d4-ddb6-4c98-9283-1769c0f11204@oss.qualcomm.com>
 <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rfhqfbx4q3kl35ktzaexjjshzosv4a2tkjthtvo24aoisrdvj7@i63a55qx4mnn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4Jn1TdbJ4bywrjOVPzuYLIUenVfNy_EH
X-Proofpoint-ORIG-GUID: 4Jn1TdbJ4bywrjOVPzuYLIUenVfNy_EH
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b85fdc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xrVuZHS62xsaktVfuFIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXzOEP/6VUYQjE
 zOs7luS18VKcVEaACv+sni4gt64o6jzWlKCBZm0bw954TQxaXiX9F3PIIN23HIMjyo/TlCmwwy/
 UG2BADkiC1Wf3b+dMVgwCIxpQH9V5dHck6FhPn1OOEOxlidSNuiMqmuECGl+1kn025sP5U1w0O2
 41vDO+zBa5JvsQ5UTOtDHlXZG9PpBK0CTeOoFkNuex6B6M4360lDWS7D/EpK6p88R/t9E6TwQX5
 PlcmDwZwNvJpWb6l56PRkqnTF6wnIou/AUOnBWByl6ECXpOkfKKTOw48OOIPobmRdecGdwNT36/
 dnlBOslXLtRqWei3kR2+2e4W5R5Fw6b1XahvPHmmchHswAvrAcUQepibTx35KWgOoU5O1yXaUSI
 65LhOSP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

On 9/3/25 3:58 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 03:41:45PM +0200, Konrad Dybcio wrote:
>> On 9/3/25 1:58 PM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>
>>> Update Qualcomm DT files in order to declare extra stream pixel clocks
>>> and extra register resources used on these platforms to support
>>> DisplayPort MST.
>>>
>>> The driver will continue to work with the old DTS files as even after
>>> adding MST support the driver will have to support old DTS files which
>>> didn't have MST clocks.
>>>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>> index 70c87c79e1325f4ab4c81f34e99c0b52be4b3810..e6a7248040095077d6f98d632f4e8a1868432445 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
>>> @@ -3241,16 +3241,20 @@ mdss_dp0: displayport-controller@ae90000 {
>>>  					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>>  				clock-names = "core_iface",
>>>  					      "core_aux",
>>>  					      "ctrl_link",
>>>  					      "ctrl_link_iface",
>>> -					      "stream_pixel";
>>> +					      "stream_pixel",
>>> +					      "stream_1_pixel";
>>>  
>>>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>>  				assigned-clock-parents = <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>>> +							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>>  							 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>>  
>>>  				phys = <&usb_prim_qmpphy QMP_USB43DP_DP_PHY>;
>>> @@ -3319,16 +3323,20 @@ mdss_dp1: displayport-controller@ae98000 {
>>>  					 <&dispcc DISP_CC_MDSS_DP_AUX1_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_CLK>,
>>>  					 <&dispcc DISP_CC_MDSS_DP_LINK1_INTF_CLK>,
>>> -					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>;
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
>>>  				clock-names = "core_iface",
>>>  					      "core_aux",
>>>  					      "ctrl_link",
>>>  					      "ctrl_link_iface",
>>> -					      "stream_pixel";
>>> +					      "stream_pixel",
>>> +					      "stream_1_pixel";
>>>  
>>>  				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK1_CLK_SRC>,
>>> -						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>;
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL2_CLK_SRC>,
>>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
>>>  				assigned-clock-parents = <&usb_sec_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>>> +							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>>>  							 <&usb_sec_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>
>> Something's not right here
> 
> No, it's correct as far as I understand. On this platform INTF3 / PIXEL1
> is shared between INTF0 / PIXEL and INTF4 / PIXEL2. So it is
> counterintuitive, but seems to be correct.

Eh, I unfortunately found confirmation for what you said. Hopefully this
doesn't cause too much extra pain on the driver side

Konrad
