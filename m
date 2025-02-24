Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0686A42DB1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3754B10E36E;
	Mon, 24 Feb 2025 20:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+cEEI41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3572D10E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:26:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKOLWG012658
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 65ZKk2GtEBap0WC6JfQnvOCcYk0q6mp1fm75hAwKexE=; b=L+cEEI41C6nWNjyv
 x3fE+tlVbbb1p6Qn/6V/hxl/wNoyArBMgKbJPPbfVEQq+jgfI8bADBOjsP8DPFVj
 6mdOXo1i26JUOCe3akULpU3cnUlQAGO1VV7OMS3xdfZYRC8WacaOp63oqDhvSk0+
 3EFRGZ86ccJfmJ/1cckB6ats39mRFy1Cs4DKSFqrSLAZCp1eU1kGpPg/wvsiVrmd
 QbN1oZ5xIb2apWMxgMpLNKsmAHU2/QquJ2nRpqd1x4GpaZyeYlRsNtifNlFRloL4
 ADeTOYfGHraIn4T5yy5jtWd97LpB4YVizyIFzfylEBDLtq42XxF3PzpdIMJEGImU
 dozm6g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y65xxeam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:25:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e65bc4f2d8so7260026d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 12:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740428758; x=1741033558;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=65ZKk2GtEBap0WC6JfQnvOCcYk0q6mp1fm75hAwKexE=;
 b=cYANjPdQuYcRQ2d2iLVCmdceMKUoIZdbndJDa86v3uAxQVKGvVotgjCWHiGFByz44u
 yyaLvnJrAIRoi/FBUUuH56NUUPZI/fJ2pMayRX1WwCFP0rr1Qi6ZZUpov1r9VmI5VWeb
 jvXoXhAvVUwKm8FuTIKRPdzuSLp+Tgbw3yYKMf/ti0+YuTaEzmYaZdZ3UgNB6XZJORtW
 a4dOY010OVRchtWjCkSKBvRiMkPqLGD5YyxzPIsNOCkuVSVX5V6e/Ut1gn/sHdkmAwO9
 bW+3OTR3oAVhEoEILtk+UbTIcondm7ppjqxSNTBiK5psj5WzmqvfoQwNmVD/BmLR58ft
 tOxw==
X-Gm-Message-State: AOJu0Yyh5cm6mgBGMR0npbuhmH55vBfaQMkt8hzAocKI3DvRnHugWCMY
 lcyruFO6AoKXrNjzbXB3iByyaYV1MrjSdGgzPMh4RlQ7F82YCr/r1tmTL83sdrkADOkFYvOw1Ca
 gvr/oxXvqpmj5Mkvc/RADWG8KHkkKuduzT7DhsOBXgJmvFG2qgqe3U6OyfypEPbKbooA=
X-Gm-Gg: ASbGncvxDmtmReCyDvwaPZSmj/1kWPEOkkfcUh1B0dHOJBZYF4pBG1CEqi4v3ENGWwi
 5wrvZQCs/bx8S01gSeTwm/FjiiUof3B0mNfPsHxlq1p/jY3A2uedDw4MmXN8rFQjGYAH6kIWx4M
 oIKHswIBt+OheAiPwcRhvmXS/VdFT25vlqnWVHdS1PYvR8LZMeA7dBknTtjHtsZ2+h4gcJrEfAt
 zrpVmdVK0jtWlYJa9ujKcuETqcXS2YN7VwLEeLgENqprOmAOSQurmfbSK7aFWyWBc9fSemmDdno
 rPRxnEiBJ9Fq9uVEMhkysvgVkcD1C+3VHFjW7fAjt2p8HtK0x0eCsw78Bk/G42VHN6wlkw==
X-Received: by 2002:ad4:594d:0:b0:6e6:5d69:ec2f with SMTP id
 6a1803df08f44-6e6ae9d2e05mr63774556d6.8.1740428758378; 
 Mon, 24 Feb 2025 12:25:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfKUxFcIDY7voAldnprBxDRpcJ8vSl3Q4jTMO+GbQSLIoMZ1VG0lqyLwhpCWUnpAzTaWApvQ==
X-Received: by 2002:ad4:594d:0:b0:6e6:5d69:ec2f with SMTP id
 6a1803df08f44-6e6ae9d2e05mr63774336d6.8.1740428757890; 
 Mon, 24 Feb 2025 12:25:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1da1c2dsm17830366b.77.2025.02.24.12.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 12:25:57 -0800 (PST)
Message-ID: <6fe42573-7e98-47d1-8815-c11d44671395@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 21:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vhVTcBIRctfUsUIClsgI3HbSrPTZvWxp
X-Proofpoint-ORIG-GUID: vhVTcBIRctfUsUIClsgI3HbSrPTZvWxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240129
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

On 22.02.2025 6:58 PM, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
