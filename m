Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE604B39AF8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 13:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C7D10E972;
	Thu, 28 Aug 2025 11:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkzNktIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D610E972
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 11:05:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5foiT029013
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 11:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GWz4EmxyWXf7dXG5o/SW5rNMyyXGmYaGBN9NZMKjXjw=; b=dkzNktIes08QLczO
 hlxo3ShN3hIS6b4EPWNK7XpY0ycS08KtG+q8doSF83aKpqd8BIjg9xWQfREPwSgH
 MQNIkYh6KYv64gvNZgoCoJKybu/BjmFW3o+p7V0K78upoKCyHZ2Bw2f6Ak14MLdK
 HGUgeeSx5sYiI6+kuCH31IWr/5fNHnVVi4iPifl//6dCEHs2spk8IfxR3r96dODv
 jfXHjwiWOdPTWCYQT7zTp+2bCJqHQQ8Xs1ZProWWlP3TLDlGCvVlz7COfXqLDPhD
 2gtdzc08CYCrgXLmuh8p25hghTl8KsKLuHAfPfMY1dahPyKzPoDYFu7Jqxb5PZrK
 EVWzdw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umg4k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 11:05:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70db892e7b2so17153636d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 04:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756379113; x=1756983913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWz4EmxyWXf7dXG5o/SW5rNMyyXGmYaGBN9NZMKjXjw=;
 b=DwbxyqGHpuprbh6OU7XmOkICdo+CiJY94sEd4+BRCjj/f7C8CxbZM63LHX1zg/jEPK
 JLSsbVIZ/s6AmFke+OOB2HczpZDbX7D7/OTLe/z/BlQuc05kKN8blqYnjWWhHoBDUU9U
 YJ7covI4m6rDuL50tk46a78v7VPvZzQk+mfosrhpQTAbMgiSt0PgvWQu+OFVVfHoQ6Ej
 xk+XPnwFFviqKImBWwCF2sdv0Z4a4CSaTTip86QR1A905KK3mxgLTlac4fQNUkzIiTIF
 wLSnfGE/NndGIlxAb5REC+D9re5KSONOA4N8inJoddW6B7nTD+LO70y/IyCq3C+CqnJs
 +gbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ1figbVYUQnzkmalS81ukblwJZg2uNBOt/pt45tYewaiMZtzCDBWujfTCsZZvZyPR7kZlf0uyhTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZu2jzYTjZIkzSddWOWDKfjTqxnuwnq7UvLJoaA+LftY8hvtTu
 wd6VopZQWJN13XH59vwQytqXv6jgrxrdY6MnGQJSd4kvmq8su6hD17QIyvqpks3flakBUEm9vGy
 0KHCe1dm0RCn6b2ITiXWrA0DLs2PLsfeeWOTzv3UVwmnGu9c9ko6VCgtwjVsSXo+nn8IQATw=
X-Gm-Gg: ASbGncs4rYUzULihJdsOECI2IGvpSADVKnF/crUpdBnq2bwsFqM6Ox60Alt12d8TN4k
 D/WC3QpKElKtcUc5ZJP1Neq06ZdsVurXMBEhmKR6qol+EDSo9w4jXwv9pxc1WPjI23cuGDJDAgz
 WeDsHalzyq4Iw1PJcIbOlX1BRu+AhsWA4aqdHt/MH4f7FkJy4rAPMcHSWS2CVKweXgT6qVC8YwY
 YuewZNwLAO5XEDmbb3wDWWhaTRL59tnai4AgnaFPiQNyt8ArWF4l3SGlU+MrN1rxUAEYwONo6sQ
 NNx+AaD5FcsJKkvTCw+MIGIqDhMyAySpTcIil48UpOG4DTWizU+aqC0V33bZSUa6BfqL4Tx7i9W
 bJuZAVKGaeWJPtSl9t4RfJkhh+iHG9QGh/QkJk97oqnw=
X-Received: by 2002:a05:6214:1312:b0:70d:9291:bdd8 with SMTP id
 6a1803df08f44-70d97109866mr271525666d6.30.1756379113198; 
 Thu, 28 Aug 2025 04:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLnBHAxYeOFUCjvzXXjJoPfriPl5kZ9soekFn2bdbrOltVRygzUC2PVtjW1wYnOgDWaHGQnQ==
X-Received: by 2002:a05:6214:1312:b0:70d:9291:bdd8 with SMTP id
 6a1803df08f44-70d97109866mr271524786d6.30.1756379112368; 
 Thu, 28 Aug 2025 04:05:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5da244sm30163331fa.58.2025.08.28.04.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 04:05:10 -0700 (PDT)
Message-ID: <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 14:05:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
 <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b037ea cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KSO3TaR41uafEWVwNF4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX2QM2Dmxmtkpe
 cyG7ljkYeOqgYYMe5F2d4lv8pbWY3M3gaqCGDknuDmCef0gEYQlftmyDW66+lqQvHzWJzHg6RQh
 qp7w7clVuN/1FhNYMRuhSsBS0o44H1+udrSQ8tqQsd0nlHl3SXEsorWHV9DN4G9y5rMriyxt/hL
 YZmjqd1dLorrcP5eU/JP0PL3DrHLzm8PizijbgN8DDfnlAjrrVg+ZY5Ja84c7pNvz018u20iq7J
 K++a8qgB08hdgHPaBsD+b5ivpioHDdMNS6Xk9sp46nKHqUW4Ae946HKE/ek+8vhSzvlU+5txaIl
 kqZGHO/KgmjOW9kM8G/+UHMzQiQn0bag4vcP+0r4PI5CLa6+2KtFgEeQSIzEM4Xu56bP/QsCxxa
 cLqYPEWb
X-Proofpoint-GUID: jHQBK2zD1ARIJugcugnAirNXm1YG5-fk
X-Proofpoint-ORIG-GUID: jHQBK2zD1ARIJugcugnAirNXm1YG5-fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On 28/08/2025 07:51, Xiangxu Yin wrote:
> 
> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>> While SM6150 currently shares the same configuration as SC7180,
>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>> and avoids potential issues if SC7180 support evolves in the future.
>> I assume, it has no MST support. Am I right?
> 
> 
>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.

Then please describe MST as the main difference between SM6150 and 
SC7180 (which doesn't have MST).

Also this needs to be rebased on top of the MST bindings. I've picked up 
the latest posted revision, but basing on the on-list discussion I might 
need to drop it and post another iteration.

> 
> According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources,
> 
> the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.
> 
> 
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -27,6 +27,7 @@ properties:
>>>             - qcom,sc8280xp-dp
>>>             - qcom,sc8280xp-edp
>>>             - qcom,sdm845-dp
>>> +          - qcom,sm6150-dp
>>>             - qcom,sm8350-dp
>>>             - qcom,sm8650-dp
>>>         - items:
>>>
>>> -- 
>>> 2.34.1
>>>


-- 
With best wishes
Dmitry
