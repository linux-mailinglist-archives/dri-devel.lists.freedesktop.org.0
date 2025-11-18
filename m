Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2131C69A34
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF9610E4C5;
	Tue, 18 Nov 2025 13:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHwaacsz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQcYXIPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2220E10E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:41:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIAQlpI2926659
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eqRV2aVVd+Us1s82VVuj58sUCW2v0MN6BPbX+PLpd0g=; b=dHwaacszWgUkcRdx
 gxzK9IXVoA8YvPwRHKvF+U6RtAb6N9x8pA/YCQmWZttBBnx7OncZgz2XGEfSlVXb
 SfSfRrtBxjT5w7cU1dCw3O53XyfLkbRnBufksmBWwLSMrTIyRPR25C4I968eNSXL
 IW0K9mHu9/v/oIFbPk8JDiKrQgtKuX6PBXL0aPTYar2koKrtaRnLp05adGDYcfOm
 dgm0b1CqLovmg7AqWrw1QsIq2lQQ+fmGIoiVYnVyKh0obYS3G1TL+7cZrrGDsOG9
 Fr2OJBrH0azhHQWeghRjIqUCU/0dWDjGQUSUVKfuGnlpWkrs2dr5F1HWVA+RebGC
 X3UXsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq290fmh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:41:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed5ff5e770so13748241cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763473302; x=1764078102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eqRV2aVVd+Us1s82VVuj58sUCW2v0MN6BPbX+PLpd0g=;
 b=SQcYXIPSU+VkGCmrUyNjXz2NrExVu0SSFcY+rQREZ8pXaHQipMNb/YVoeJ908IAZOc
 ur9Ta+sgnlNeHcjTI/nHTr/ll/EroGPhBNek8qFSCx/ZZlzvlPccvS+L58Cq6QD1O0Ih
 2Zmg55SC+F2thzRo/KnFw6S91CaqwhLSxL8FLZ2e6zLQhtzWesSa11y/hveU/o5KfFhd
 KQ0ZvYIiTxUQq3susgMmGap0Si0Sk29xwBjUbAVs1AFE/NlrZ2d0n25qQkkYdwBMt5tw
 /qxCNO7u8uNiUKoMi2EfRAWCmZNVWUuYlRyTtJGXLFnQgS3kyd2MQ19KNoRFvM5K+RrL
 jCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763473302; x=1764078102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqRV2aVVd+Us1s82VVuj58sUCW2v0MN6BPbX+PLpd0g=;
 b=cJvfSvMJqHjRvPXoox2DmWKYaK1721bNaJsgQzXpLh1uNo0wtfmQMcDRSp9tpiSB8s
 UZ0zCW5jfjdVRYFVWfsft1FUk6mjok5USbzB9j0UIsRQNxUY1iiGUQpiWqPtBHjmQAwq
 +/7d/1GgAJQauDaQtmqusRJY3RibwYi+zdStt2DarMKcmNnGSnzhywzXH7ou5zhx6kfQ
 fgAY2Tw71oPBGIr99jvtAXcDKGdIfp07HgyCq9L7eM2JdT0Mae4kDU+WGmuFMJfi42rl
 BMHuVNjd6Ahs6TvylLO9WONT4rOeojMITMzmO3qkP7Qtxn1k+h7/jrNmvTGHwmZKTzcz
 bF9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMcS9KsT1znpqV/vxWuVFQzfySM9G+TM3zf8DrqfM1FzhyiRCzazGSc2PwUIWuVOI8kBc8Se6Mm0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX4J16DEqoZ2gu2PgpECm1bHUtlEJtodCVln/EuvTLmXT44+BW
 19ILYekF0WooD8qoYkWmc9pNe3PD1MBK7cTcu7AVqNLd7IjiXXRUDHtFnFJpO0L/px/J4LSZvzn
 nIvYdEHHUN3xqRG+nG8u2Pu1ppND6oGUM4jBTaUsosrRkSHhQTAXdTj6LhfuLgipuUfH0aHA=
X-Gm-Gg: ASbGncuXwqeYe1N5Eo1hSM3yw+WxD65FHro0SbLIctRlw9JGXiEFj/i8jPGV98jygeT
 atthBhOfOftLHnIGCoCbSyAz7+Z+X599fMkN/WTbcFPUenfsyA1TkjzsZmyj20V2APUcD/LjSJS
 YuvLkC/ugvGh2W8hGWrBs8CPy3v6pnwVtHclSc1l7AXIqGfP5UiyyQyU3bN/Zey9q/bIplsf7Cj
 kM30MukkfO8T3wVQWiFCOCCIAkSSU/pBz71x/VJUVkdIvcsfHE0UsCKb3x5TOgPBRBRffHP5oFE
 1dGxa/l8jfBHQocrtJZrqSRGCjFMJQu573m+2LtRNBMVQknE6qK6kpNV4zliRYvmdDQUObdVC+q
 m4kUuxguNobzqW1NusYni9q6DOMlavfqGerLdV7cw/6yfet7Vr3WKfu4pbjqUVjaTbO8=
X-Received: by 2002:ac8:570f:0:b0:4ed:94e7:97bc with SMTP id
 d75a77b69052e-4edf202fd18mr175516121cf.3.1763473302437; 
 Tue, 18 Nov 2025 05:41:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2L5dm2T1z2wEDohRTNQGcAvzKF98sJtsZ9cN+Q3K8DeR9Z4KdenAu1WYqthASSoj5p8VKjQ==
X-Received: by 2002:ac8:570f:0:b0:4ed:94e7:97bc with SMTP id
 d75a77b69052e-4edf202fd18mr175515671cf.3.1763473301831; 
 Tue, 18 Nov 2025 05:41:41 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8da2sm1322499966b.55.2025.11.18.05.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:41:41 -0800 (PST)
Message-ID: <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
 <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com>
 <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c7797 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=wtcFHR801LI_0YcmPCAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: QpJcJc8hdG2MDTyjrLMJj2JiyNW7yP2t
X-Proofpoint-GUID: QpJcJc8hdG2MDTyjrLMJj2JiyNW7yP2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMCBTYWx0ZWRfX2u4ptsz4fN60
 2DUtYlgcBT8xUh1hlZWY0t0YHTzYJF2xzw2GzYpmmDMD73A1S59gAZkGif139xKZVQsa+nX4yio
 GHmYFyEZ/wAwdoEi0xPsfGx/v1JzED15WO7LHtpxsnNxabf49ROkhUfpq4jwzaM+rrPRD2s3gZ8
 9C8p7OEra/L9CsLPNqAIw9Px7t+wJzVJ1AcIhbbGsPZrkamw/CIYvkjMzhST1Mq23tbt4l06Muf
 VKBWz4V0fkaMV5R90X470au9QrVSXklH/MFaGo/5RRFeDaCRsHwkjP4+UGojYeW8d+K9pj7+UB+
 t0eShGqOFkXuYHmFfygGHAKccF7zXlopUbLNENt6FbtyO7F8sQj3lcTBdnut2jVGI2yFO/T2uUA
 sBMNUtISnSHerul3H7yjHYjQDVhfJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180110
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

On 11/18/25 2:31 PM, David Heidelberg wrote:
> On 18/11/2025 13:32, Konrad Dybcio wrote:
>> On 11/18/25 12:30 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> This adds initial device tree support for the following phones:
>>>
>>>   - Google Pixel 3 (blueline)
>>>   - Google Pixel 3 XL (crosshatch)

[...]

>>> +&adsp_pas {
>>> +    firmware-name = "qcom/sdm845/Google/blueline/adsp.mbn";
>>
>> Sorry if I asked this before, but are the binaries identical for
>> both devices?
> 
> Yes, there is only one firmware, which crosshatch has different, but all listed in the initial bringup are used for both.
> 
> To add, crosshatch was somehow not that popular device, so as I've been suggested in u-boot discussion, I would love to keep blueline everywhere.
> 
> One exception is LineageOS kernels, where they go by name crosshatch, but again for the both phones.

Google seems to suggest crosshatch is the 'base'

https://android.googlesource.com/device/google/crosshatch/+/refs/heads/main

Ultimately if none of the Googlers (hello +Doug) care that much, it's up
to you to choose

Konrad
