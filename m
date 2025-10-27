Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3E2C0DA11
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6974810E469;
	Mon, 27 Oct 2025 12:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1r/83dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128F10E469
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:43:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBK0LH2546933
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fdjmtQpetkz0YQn4BhbUe1OxkW0bA3u5wuojcjr81Ic=; b=N1r/83dxtRdH1PdG
 ld+vkrqOaa2GEiTAQUHgYE1tyMwJu3czrggpwQVCcOPbPbOcGSYZUofUgMs5Fox/
 o2F4/lpx/IkAe01l7HeFUzg69lLC32wCuDWwXr9rz6LxvSakesAojLTmf+XNbG2U
 aCv6gFavGvdqJsF0sxMrQPDPg6gSi1peGzsLhkAWN7SJgMXgVdUXyQSaeJByFY4R
 w1G9Vca4fBrpBtvOGyoD/ftKpEbjR2Buh+9A8nGonT/ZLbllZhIO3eR/Fx9h64Dx
 741FCKNv8sEa4hAOe4UrTw4XCuNwo18YSleuJ17FV1bmWGxuMqYuXrVlKmY+EFZO
 BUS5Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2g6rd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:43:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ecee4fdb80so1162791cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 05:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568990; x=1762173790;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdjmtQpetkz0YQn4BhbUe1OxkW0bA3u5wuojcjr81Ic=;
 b=R7zJL0KUyPERNCbSfnT+MJUCY4IlrjO4d7TR7IMfLFxCGhT2n3alZmPLGMmNAwGdNF
 6WvuAaD+8JXoHGwfm7VlRJZu7L0kefrpnQs4XmoNJVTQi+EDV5pXPojd5J66O/fz6HD8
 76D+mJFXFVn0k0f94tkec0noH8G25+IdkoYv2Yv42czBBFs49CzPZTrwjjHS4wnDprSP
 48MOVPR9Qh0UL9XSGUdKl9z3e87KSnFnZ8tLXs7pLIP1YfdehBw7BvHAxKuGJ2IoMwpl
 k0tYAMRgb9VuW29QVczrchBSWJ7Wyn6bxq5o+1O7YoUflMKk+m7V0G0wK4OnddracLzl
 j6oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA7s8Nu/jykqo2eQoc1fyFRlWQE4xghYNLunTqCdhrtdZ5RW8BhOdqU67tkidKsgFiD+oGFeka32g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRn7mJOkzqM9Rs5y463JrbA7EcI1yVNU6r2vyQVIhNEE9onQvc
 QlHvDbvcxnfsZwpqE6bSEcL/n38la9R1/W3LzXB4wPz2q73Q5BM8S3rp5mX0p3LHyFloHkMKvBT
 qa0DecRdJtd4iB5l5Z4JaICya7FPrdKyib8W3TyksPx2dADvIw6otgxppPTKGeatJq0gpMTM=
X-Gm-Gg: ASbGncvVa4jju+magT4wXzXim3HMsEm4m43tsBdG4QEB14DmkcJNtR5P2mW4kvXhtFd
 QthH8ny/9lzguZ/KvGnrCzsJbZgtXwxmUeh8DsV6mC5C1/1oBsY+vKoXuNQy2PM4Yqfjf9uxxRT
 jV6BtuOJG5GjGeVq+OhcUK3KkTw2lIIqEvsz81BpWcVfMLF51iROUiAizH2c2ihDP6KMwJRhZwg
 RpW+KiGtzPwDM7sEh6X/iDcgo/IgsAAwFuuJX5kMdGwmXEBu4Vxz4dtV36ggizkyVQxWTLoflO9
 gSo0FSVzn70MFTmNgqjSVtUXpPzhH9rqT8tDDndJgfo8Ff9VinRIvSspy6OoVYAEoDxYMpHuMJ/
 Ud+ExYvnOkB0XDxsy5kaZI9bXzA8Ad87GrmYBY5RcjZr91riGD51tmCUH
X-Received: by 2002:a05:622a:1a04:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4eceec8f9cemr45634481cf.7.1761568989525; 
 Mon, 27 Oct 2025 05:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1HqeE9MvodZNYXC7WwzDrvESBdzQm1TEemMfGCepQyLUEGzFaK7Rb8u7ydwVzQs3atb4nNQ==
X-Received: by 2002:a05:622a:1a04:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4eceec8f9cemr45634011cf.7.1761568988857; 
 Mon, 27 Oct 2025 05:43:08 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d854763b1sm747106966b.71.2025.10.27.05.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:43:08 -0700 (PDT)
Message-ID: <82971ca7-8f52-4350-947f-309e913a6886@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
 <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
 <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qSUwgY7f21bywKEnYSxtVw7993Xqg3yW
X-Proofpoint-GUID: qSUwgY7f21bywKEnYSxtVw7993Xqg3yW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExOCBTYWx0ZWRfXxjEOw6azbF1s
 53sv+3pu9xtKAes7D5159c5rg/24kFMfBhTjWqw7IBCVeUsERkO1uI4PHsUb6sOG3pJtNVG1ANS
 dBHtK2BbFvBZwIy/0u+DJpMwEM1cJppwzpU6yzJ0WFwQIdgkGzTApmCd0FdhJgo6tCWYcgEChJc
 J6vWBo58K4SWamZBxXCPdhkV+hSeVJbLvuzaz3DnDhXU5tTvv9GvfrD0KqbLSJ/VL9b110jXx5m
 23fNNb3PRCFv1UXObbnTDU+m6LXMYcSZj4I1I+oSJZnoVmge45KNgx6Q+re4Y733Y/KOdXCQA9u
 A0PjmpfAWzKORD4TDpeN3YNQSJK4XIOGSOUG7F3DwypiYTKeCDvhiptajHDiocSqueKA9B/TLDQ
 3tZnfyHcNSOrcZASWnrqII5H9maeXw==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff68de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=7pKaQVV4AfFCDnn0ZdoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270118
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

On 10/27/25 1:38 PM, Krzysztof Kozlowski wrote:
> On 27/10/2025 13:20, Konrad Dybcio wrote:
>> On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
>>> Add necessary DAI links and DAI name prefixes to enable audio playback
>>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>>> should carry respective DAI name prefix regardless.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> ALSA UCM and audioreach topology will follow up as well.
>>> ---
>>
>> [...]
>>
>>>  &mdss_dp0 {
>>> +	sound-name-prefix = "DisplayPort0";
>>
>> We should probably push this into SoC dtsi since #sound-dai-cells
>> is there
> 
> 
> Hm, that's important for user-space and represents actual naming or
> wiring on the board, so it is strictly a board property. IOW, there
> could be a board which does not have DP0, thus mdss_dp1 should be called
> DP0.
> 
> If you are sure that such case does not exist, then indeed we can make
> it shared.

On at least x1e, any of DP012 (not 3) host can be re-routed to any
QMPPHY output, at runtime, so I'd rather keep this bound to the DP host
index.

This is utilized e.g. for USB4 or MST. Or if someone has a fantasy for
remapping their PHY<->DP links for no good reason.

Konrad
