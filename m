Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BCBDBFDB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 03:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C3110E6C9;
	Wed, 15 Oct 2025 01:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkHXfgjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE9D10E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 01:35:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR4EI014411
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 01:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k2n5J3Jvlq5ovhLn5DGN5KkteKpvoUV0qo2PgJM6Fp0=; b=WkHXfgjXNdO/iuhp
 iSWmUM3w50cjnd4o7FH7Yc7dq20uzSaIAHKnp766ugBFJbUpt/i+WluFzWTu4wWp
 IcY1HybFxkhHF2Ck2kRyeljJhsliSzo/gkQe66b90M15G9LdbKmJSVU+ypnmvL7K
 01DcAPUvK6sSRvTnOIrZ3M2NwYI/fjUR2P7yMWXVmsohrFNApmm39hsqnGdjl+3t
 80PL6jhZGrbor9cqVMql3jDzipq6lT4iRFhUNOAzVDux4vW49Aj3Y990UlOOQUmy
 AQwd/2H2aETVxO1u6lr2RBDXcc+Q4My+zdZ9bCQkRgS4uR4+zampQ/zvEN9t0STt
 T7zupg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwmwrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 01:35:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-339ee6fe72cso2571224a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 18:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760492119; x=1761096919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k2n5J3Jvlq5ovhLn5DGN5KkteKpvoUV0qo2PgJM6Fp0=;
 b=lR1kmn7+E9prFOvVIkgAS/FncJqyHc+vUblExsn5beZo2NEvS+BaQY9+ztvQt7mfdL
 KqNHqomR3I6Popnww6Oj8o0g1AP8LBSpxs2aC9TbA5WC0YXkrQmIl5IQC1amCmbqn1lK
 cTUQQ9rOSqGXzSApStqFfWL3lmWyMYZtY+RfDv14sev5blLpnJ9xvwslQaOSSPhhvD4Y
 281JIxatutd+Gh81ThiJ/3nMj1hJOaL/Ql7uxDrmGEbHGyLLKZytOkRmWS2LYl0/Dmr1
 vTsphxu1Zar2jVFeshkkwTbmmcfqwxNBqhcerVkVEwoYNKeaRu4etvSk/IwEios1hCBE
 CnGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPhQQdKDXdikS9iw8HUUdN/bTSALqnhi64Y9ZZfHZlhX1iBC0b/VBz62PEHws1OfHjF0tP0n68fH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9W28qHf/1kgMjbLP+bBHJIyRWvXZjIRUpvhNZa1er7kIj/Mf/
 Y6WxUcBWqqvj1V/N5eHz31ivgyvWQ97QQ7Hp3ercdrZ4XA/o0CF3yTAE7cTBZzmZAs0W9sYbgR0
 HM181yFOkWqdPVoAFaDLp0mYILaLBEd9hQsJlkEpZWRyvIfJmWpgnjJpOrpq5t7omc7lS4D4=
X-Gm-Gg: ASbGncvv6rK8BtzNXVagv53ajfWGhOqq5OGb6YU3owpd5OixOfy54hIPUziuM1qRc/W
 tPuTVzaZQvctiPCFl7rD1dFwzA6sBkfJXum4Fu200q1A0swPyTQ3qkFO83447dnYD402J1iO1Yn
 fkMsIbzXWUThW7SyIlxWj1DHcJ2MMb2IsVyyI2uMrN/Xq3w/8bEA2YDIYheJY67dKkRmbodcO2J
 27UvOOcRotE23sYAsZsmSkHDWFQRaGju55vdEV/Tdv/mSxl/uFhOMhpGW5kCZQ9HrSfaORrA5rr
 gl0tJfiLgnyf6+eaq2B34fbLgP0L5CxcdZgL5z+4IvJh2oaKKmMpSBU9RgYiFX3LYoF7yK63FUN
 lCGRKk+R1WPLeYSFC4GPooJHofUD2pEUtagU=
X-Received: by 2002:a17:90b:1d10:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-33b95dfc275mr970065a91.5.1760492118740; 
 Tue, 14 Oct 2025 18:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc+CZt0xREG6/4LPwJm/Rd0O6qubFBGwHV4l8y5dMCUoHmdZH14Lg5AhY6jiw29nPPSwGWyA==
X-Received: by 2002:a17:90b:1d10:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-33b95dfc275mr970028a91.5.1760492118252; 
 Tue, 14 Oct 2025 18:35:18 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df7e1d1sm13305597a12.40.2025.10.14.18.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 18:35:17 -0700 (PDT)
Message-ID: <fb83f6b4-019d-4dca-86d5-87ed018153a3@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:35:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
 <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX/KgGtWplCHdr
 eBsRAFMYUljllfrsfo3cMSV+iFFIoW8J1t9sRpsEOYlgbqioyahrnXmjx1+XPmWIuJcxBOvEcDQ
 faMsnsfGdOfSRK7n2N0tSeYECUvBNW7J4WF36pEO2NrthgnI6To7IfDxEF/s7Sw4rLrteIczABL
 F5MbC8Xmal5RGjkIcD/82AxtM3GfycRLWxjOLfoC2XoGhVImMjGvksc8hzukbaZuXvZXrVAwbbB
 iMAQzfn90+CL4B+4eqSuSuLr3412qb3Sd6RbKH/td5AHzaPm9klxRk+PJfhITllXRA3wS1JVqVi
 h2aVeARKqJAXfFa6LxQcXWzxBC3jlAuNV2cjbdaYMfl5d3hhcrMM2FFU2S3ktfBLTtwDoGJaZgZ
 hYe36AHfw9ovBbvAta4rzUjrzeb8Hw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68eefa57 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2THbcKMbQ0HsdItsycQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9zzThlDCQHqmaSDlTTHYLsyHWpChDx0w
X-Proofpoint-ORIG-GUID: 9zzThlDCQHqmaSDlTTHYLsyHWpChDx0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
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


On 10/15/2025 6:16 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 07:54:56PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
> The "lane mapping" no longer applies. LGTM otherwise.


Oh, I forgot to update the commit message. I’ll fix it in the next version.


>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
