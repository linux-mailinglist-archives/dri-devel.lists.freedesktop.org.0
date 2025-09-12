Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE5B545CE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE8810EBBF;
	Fri, 12 Sep 2025 08:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGkDy38r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C359810EBBF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:46:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C6M6mC006011
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lGDrGSwQe5Wxsvo3kpmlzGmuY1iFtGQeQKswsFIUacE=; b=EGkDy38rYrnjaKFW
 5EWhmMA0KGDcOE5BcF6+mohdOrto8vCfS0ZsLlPcGzGjvyjjFExh3s665KxQ5Kfv
 7keM2U5DyWmGO1hfmLY1tpbCn6jkw3YjiF2pqc9eU59reSEAN7Uo/HSC2GFlcnyH
 ugju1T8lvtHcRBLmNTwEyMyjC2hmNjRPrLSU+4d5xHWxJjYdcqzLCvh5iMrERuge
 puJUZB/mpPQjhXCRVLZjTPTIutQ1hyuq8p9agGlSZ0chJt8WkGakoQVd+LWjpTbF
 bK+D054z+d2HDhLcNEDFqx8SS/xGdHJ2M/zKo8HtG5IytIX/zIxvxaNHf7/JPO5t
 WejYQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ajv8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:46:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b613a54072so6304131cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757666787; x=1758271587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGDrGSwQe5Wxsvo3kpmlzGmuY1iFtGQeQKswsFIUacE=;
 b=GkGEP9kUVj086KGYEjXSrOZX7suxiX9PWTgIDRTim/4tyvKt6BmrWgLTFbGpyDCtlf
 DZ07KIcNgn0TdLgX82UDKHf28BiBjGTf75WCWynX1xn2zeoxK6QiuRqNgSEZIn5mANXn
 rQVQWaV7A4B18WWgFoJXAj6v2uhzvop9yowHW2gYCJsM3BSv/5BLNDXTKT5L98lacVmW
 1F05yvSi4IDvECV3MZ8IMpoF20cR1i8ETuvrwVahQDMdLD8myANeCYfY7oCISAhKdr/Z
 Ek2gE6CA0jq73hEVSs+cX/fUtqsRbKdEbVo6xN6NDcsdd1KG69a2pYFf1cXlIfnEWDnS
 gPfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaLtRwfA1NoDYgOlLDOVS1p5hJD61HYQSjq41wglIUhxhVs1BBVQWM80IaABR2jVkju9GLry0MVXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDc1qa1RPz2xRpQXJS6tpJyO+ZY1/CUL/mGKz+/9/iF5ObUCCf
 hRwTXKbMlA8VDYKRRBOccW61qGdzxPnuHCPuooIz/n5usXqtDEdHTqQ1I9lnh27e0JIEUvTYUpq
 9Rl2DSLFo/f6BNlvphABvje4ntHrK6cXB7rUPbZpkz7H49+S3efCFNiIgv7/BSgyW1zaCTTQ=
X-Gm-Gg: ASbGncuoSLf/r7jzlqN/+MR2aDM9VC2qmuQ3xUytpk4oGrzI1EfT1PW4J64x0UIcXNg
 86VqaE1HIdJY2/yH+zuoaa1kMbgxxHRikecAqUlFpMhQjJuDWmVFyQW3l6aFF3l5Tk7d33otOk4
 r4XUKK/YwvSCpc0RQBhf4IFncxB7A8KwZRuzo85jAup3mS2gn57Wb6mAbg55YaO1oVsV3KtPPVG
 lp/0L58Pm0FCOHOR7W9CqiL+1iEO2UTxRxabzdf1URsqZlxDhXXDgRTj8fNZYstN28Pf4gngZaM
 M2r+yTycqHgXdJyXnBPte2cfAaH+C9FDFeTCjUvEbu36eF3qNzDbiIKhqvixCJ/WUJiyjFwRpxe
 WWQvikl7nUZCBwjLm28fDKg==
X-Received: by 2002:a05:622a:5ca:b0:4b5:d60c:3f33 with SMTP id
 d75a77b69052e-4b77d13a75cmr17660041cf.13.1757666786784; 
 Fri, 12 Sep 2025 01:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+NVmc9TA9PDMivtFQF3GWnTURuIOA8rik1NCbnbvalHLcjpoipS/fO2pMicU4DnVEo5yPGA==
X-Received: by 2002:a05:622a:5ca:b0:4b5:d60c:3f33 with SMTP id
 d75a77b69052e-4b77d13a75cmr17659811cf.13.1757666786285; 
 Fri, 12 Sep 2025 01:46:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07c337e785sm150379466b.25.2025.09.12.01.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 01:46:25 -0700 (PDT)
Message-ID: <274b27e6-ef43-4597-a7d6-1f948f2e6c5b@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 10:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-4-2702bdda14ed@oss.qualcomm.com>
 <3ihzpsmf3btzeltxggdnbheji6bdeornravua76adw5dhotztu@e3fca2prl45r>
 <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e974ffc4-9bcf-4de3-ac09-76b34b47cf5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3dde4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Y7PaXT35z5vDV90y7_UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wHedYsXpEM9_daf2W8OYtV8gKzyyMGLm
X-Proofpoint-ORIG-GUID: wHedYsXpEM9_daf2W8OYtV8gKzyyMGLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXwkZOtTM7kww9
 A8H8kLAGqbCBS4aO4Ad3zfiAMobs3fkOlYgEpHjSSJxIQheOWs9rEe78rbhIrQfWVwC/+pyD3Au
 0HarrNGPRWsTEafsiVwAKshzntMdUQlRF420NIS7lb1643fsY66NWfY7UgufueNbhhGtfnffnwA
 BU4X03kihO/J122WKwQ8op+7EQdjg6BMIjVRDUo7zr5uB/Uc80RkneDK+h35QXIiu9RKh5tKs74
 xPPaX8oJVUjFsiSivDBRajyIHxphfLKv5utTL1QytlWOgPR+PK/l2QpFHuwfFNwnPKNhlEJUKvx
 RbyETZUz4GfnkzWOO9hJXhQ3TM5dGU8yFHhcHrKUBY9WwPd+yd+A+L5aOlEcbU/0O5/gnaab1NR
 LOIumSos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On 9/12/25 4:15 AM, Xiangxu Yin wrote:
> 
> On 9/12/2025 9:24 AM, Dmitry Baryshkov wrote:
>> On Thu, Sep 11, 2025 at 10:55:01PM +0800, Xiangxu Yin wrote:
>>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>>> including register offsets, initialization tables, voltage swing
>>> and pre-emphasis settings.
>>>
>>> Add qcs615-qmp-usb3-dp-phy compatible string to associate QCS615
>>> platform with its USB/DP switchable PHY configuration.
>> This should be the last patch in the series: once you add the compatible
>> string, it is expected that it works.
>>
>> The patch LGTM.
> 
> 
> In v3[12/14], the compatible string was placed in the last, and you remind me
> will trigger unused warnings for the earlier-defined qcs615_usb3dp_phy_cfg.
> So I merged them in v4. 

The intention is that you can do all the preparing first (which doesn't need
to include an assignment to e.g. DP tables, since the code operates on a
pointer if it's non-null), and you can push all the platform additions at the
end (both tables and compatible in one patch)

Konrad
> 
> If move this patch to the end, patch v4[07/13] will hit unused warnings due to
> missing references. Should I squash patches 04 & 07 and move them to the end?
> I'm concerned the resulting patch might be too large.
> 
> 
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 141 +++++++++++++++++++++++++++++++
>>>  1 file changed, 141 insertions(+)
>>>
> 
