Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D1A34A90
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571A10E45E;
	Thu, 13 Feb 2025 16:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmR6xa6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2B910E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:47:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D832Q9008889
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pdPqwdhySUYtLxO6ZXkv3AyokTUz8gph0Rz4I17smjk=; b=PmR6xa6RZSIyGQYa
 1ohpI/2W5xKQVxwfYPJ0awefbsNAr4lfM/CAAqFZteBUfN/Hk7lWv7DgZJ67Q5J4
 c0rzp3k/0BDNkKkZbheK4pWx9AWAuimPWGQ2kl3MU6uY8pepcnELWRO2Utp+QssC
 3iJvGz1SVsAiFYPQZc2cFWZyG0Q1mQkeZU/+yhfEmsa/yNWF/2RnPo/YP4MLkElr
 mb9Wc4i+X9gNSB1zhyDWEAYcEG6eYMdgP87W9Jo+OJ0ZKkeAu5n8kB0Qxk0geN4c
 FBJ3kU3ek6CgDpgJv2DrnjUB3TCBNFMwvjiD6YLH3shOCg9/8l1ZfdjNV+Onap//
 GLxRbA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qvnh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:47:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e1b2251f36so2779226d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739465247; x=1740070047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdPqwdhySUYtLxO6ZXkv3AyokTUz8gph0Rz4I17smjk=;
 b=wKuMU1i/AUD+q0eRHMwRoiv0AtB/IOy+BQKUn3U4eXqs0Pt8DyuIH/6IBtzOTJzIuh
 dyIbllLSHh6MY5vjLbroyQa9wVqqUeItREXmfn/veQtxb65hSnxxJs10X/3wwXy3H44n
 dXdCHitALijq6rZFVGhbaLaqHlm4WKojFPbfZTWzu5SK0XqWFEV02XyKa0VFF6da1vqt
 CcHohiKS/XdsEf9AFZXqKKB18a4Rk79d6slf5iQWk6lNk600+VGAAfx/NjmvvS+HP87I
 Do4Lz+h3veYw4Lgi4fMHeBW22R7/wbhItouuq9jOXDNKVCX3+MzbRv0WoPoXcuteAJO2
 sCEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF81niEjhQw8rRJMqjb1zRCqGIQt6wozIRNmtmGPsGBbmQcSwJwvmS+HmNxXKz+oHAryVK44HHUO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw25I81gR4Twptw/t6DWp0T5zzwiMeUdn0kuFQShoDiF5iE+bMS
 lg80/GXiJNzrYTV7e+/09tJGaD6vjt/PHt8le4l2C9FyK55VjV7xmm7Qa8ggHdTWdBBtBIiqFYO
 nt/yzSoKYeFC5ttbs8VBflQx3eAMuYhE+TaTwI2WI0C3l8JSrVI8SKn5rgYhAf1tiWsg=
X-Gm-Gg: ASbGnctFulrggUincyNh0xBQN62sbrRS+SXg3D1q6Fg/2mazS+mhOdXBUDKRNVyHTb6
 DdtdvwMzvGIlneYd5H0lLzHaC3W6eEkfA+u5julHpMGgUPkOJsCqcJeUnHAkeljELDon2yrlhCt
 UpjnsYpNdZPpEKUs/mQ4yHc5u077FMEHXDoyXbiuQXEP6QHeEW8dYznZePah1qEoGXLHYgafavH
 Erj+Z1PycQ4Pwf1LptJ+cWQMBnbr9Q1KFNF4q2YvRIYnmEli+x26zKJKOByy4i50SZpEhn+ijC9
 25GJVxtPcN66SFqbEV+a96C8p27gA8yB3OseXwwuj3hsX5Y40yScKMPJyVc=
X-Received: by 2002:a05:6214:1d0e:b0:6d8:967a:1a60 with SMTP id
 6a1803df08f44-6e46ed93ca3mr48905566d6.2.1739465247477; 
 Thu, 13 Feb 2025 08:47:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEetTXePMyTND5uVB//0Cph5yyIkXDH1QnV5NVQnh4WczSnYALFJyWUjGFeD039hxpYavxng==
X-Received: by 2002:a05:6214:1d0e:b0:6d8:967a:1a60 with SMTP id
 6a1803df08f44-6e46ed93ca3mr48905226d6.2.1739465247027; 
 Thu, 13 Feb 2025 08:47:27 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bee4asm162967666b.170.2025.02.13.08.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:47:26 -0800 (PST)
Message-ID: <eb7ec79c-a9d1-4d8e-975e-30f12bf583e5@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 17:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Print GMU core firmware version at boot
To: Thomas Zimmermann <tzimmermann@suse.de>, Abel Vesa <abel.vesa@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
 <20241219-topic-gmu_fw_ver-v1-2-d403a70052d8@oss.qualcomm.com>
 <Z64fUjIfFzs4R8Im@linaro.org> <b8004a16-6130-4232-91fd-85d62c2b84ec@suse.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8004a16-6130-4232-91fd-85d62c2b84ec@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d-chEwm5Fiy-wFM0uf4D11Xy5VDryeHF
X-Proofpoint-ORIG-GUID: d-chEwm5Fiy-wFM0uf4D11Xy5VDryeHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130120
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

On 13.02.2025 5:41 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.02.25 um 17:35 schrieb Abel Vesa:
>> On 24-12-19 23:36:56, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Log the version for informational purposes, such as for keeping track
>>> of possible GMU fw-related failures in crash / CI logs.
>>>
>>> Intentionally not implemented on the if (gmu->legacy) codepath, as
>>> these registers seem not to be used on there.
>>>
>>> Downstream additionally warns if the firmware version is too old for
>>> a given GPU, but we already pair the binary to a given GPU, so let's
>>> not go there at the moment.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---

[...]

>> So maybe DRM_INFO_ONCE instead ?
> 
> drm_dbg() seems appropriate. Most of the time, firmware versions are not interesting.

Unfortunately, in our case they are, given users source them from all
kinds of places..

Konrad
