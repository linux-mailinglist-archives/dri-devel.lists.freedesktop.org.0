Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B43A87F4E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E62310E58A;
	Mon, 14 Apr 2025 11:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ZlYgP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC6510E589
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:40:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99ok9015751
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=; b=b8ZlYgP0nO/bKyvG
 B0H3DK80AYm2/oG18ZJ0U99qoqONX15MY2fJGBOVGfpoCwpRxxyO67Q5G+Y1F5uT
 avl+sT/nNwTcg21E9hjhwJNA1N0009iEWfOffuuqFNKFL/H9ckoiEU6ssf0A2ny1
 FM+XYt/hx8dJ0VzRYdHMRCwAC9EJQ9tj6CfG0SnMAbpWY7FtK71bqWOtVyu5Bi9g
 dldORNiYnfdb+5OSA7WLziG4CXIy6n2VAG4CFRe+u8h6ra2ilPrnSIKk8XefejGJ
 kRpe4oat1/kgg2KtQ4yQUAeaqoN2ksNRUqO2Win5ctdRMzNZ7cuqRekyRrJAB0l3
 0fJvPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6cdec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:40:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54be4b03aso84553485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 04:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744630802; x=1745235602;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=;
 b=N84OXTwNRRKEBd//5KStLwrwmKmd5PZj8jw4a4a3jOLYR101z4mVBVMuvEZduM4A8T
 p4fMHCRL/A4XvqfKoo4wo4AdDMsfoOG8PjSR3xO/MS0uwK2ltNTcIQgSyp2yIHqcUq4+
 EVk1Xt/XZdnGAUNBOWgqHO3/ovdEGnZwZJf0A5CTtE2fo1lX+ChXJwOA3A4aYBwUZy37
 YkoC8QyhDOZa3JU5XbW6GrXJlWwSW/0QEw6H7K4S+fws5DNOG0tuuvvg4Z2LZKNHek2f
 rvSHxun97NLDzHErFr8NuGyXZmWGuyzjY9oMbEZOf1xmfBxKB0bOgy1GGniQVYagrSh2
 GA5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAncVagOZXSlvBZAzqKua25qXkEvvBugATOboTdPpRdKnd7CDZGqlUvxr9YIEaWAinfqYIus2aAU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu44GDDxH1LyCYfyNGq3LZDS2v/ja+6+W1CrE4D5MXcqBW3IZL
 vBAeObPwelygTl+vGXnkUxsp+X9Q3Qqql4IHlXfh1/CZWDZ/4ibv1v7KlS7YLfsPX/QBBKpNhcq
 24Ev5xWwvYCeGzWkHpDEVWyODN9n1ZYWXI9Ops4d5pr1qeAGnVBATPRAVBkR8IE0Aw0M=
X-Gm-Gg: ASbGncuYbCKdXtmCMKKJZ4xxL3pDNQuSHPLQhA/PF8sIRTviQA1ATZaTcHYuysxuKp7
 jVOweFp1w5UlLedi5o6R3SQXPyvN1+HIY3E/mP6rbVXBClJ9WakNFeWHuy5l7NHoj4G2kZACWil
 IAMBNdkc9j1ENhW4qnpb4J1qg0lZV8B2MQMtBUOKZ7+xSGMuWgm3YVpamuebOOLwvPrtGOYkdRu
 WLeR8C2/DzqR5e9MqIJAkv654PD19I84YQKhR+Q7xq0iDdWj9OKEELgQf1nA6ONP/iopCGpfxo8
 +AOzH6kavzeCdu0gj799Zt0JHzZLb0Ex+90xwgzch20d53JxxwnyDrJLEPyXip5clw==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id
 6a1803df08f44-6f283adc8e5mr73751906d6.1.1744630802057; 
 Mon, 14 Apr 2025 04:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E0L9e0/RIci+ADRrX4qrK6GQFhC+G2QaLdC4aN8GFac4k2hQr5Yh2rzqnOdAyJM+rcAvig==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id
 6a1803df08f44-6f283adc8e5mr73751686d6.1.1744630801548; 
 Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3569sm887225066b.3.2025.04.14.04.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Message-ID: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OeOXQhbEPKIOLJg2LzDBKroNc--VXLJM
X-Proofpoint-GUID: OeOXQhbEPKIOLJg2LzDBKroNc--VXLJM
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fcf413 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=wOxLtKptuZxHWs9q4SMA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=760 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140084
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

On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>> controller. Link DP to the QMP Combo PHY.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +			mdss_mdp: display-controller@ae01000 {
>>> +				compatible = "qcom,sar2130p-dpu";
>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>
>> size = 0x3000
> 
> Existing platforms (including SM8650) use 0x2008 here. Would you like to
> change all the platforms and why?

The last register is base+0x2004 but the region is 0x3000-sized on 2130

[...]

>>> +
>>> +					opp-540000000 {
>>> +						opp-hz = /bits/ 64 <540000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>> Weirdly enough the 540 rate isn't in the clock plan for the pclk
>> and so isn't 162
> 
> Nevertheless we need them for the DP to work.

I would assume one would like to have dp compliance, so perhaps they were
just not on the very page I looked at..

Konrad
