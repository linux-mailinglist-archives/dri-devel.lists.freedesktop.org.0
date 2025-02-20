Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BDA3DC4C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C9610E968;
	Thu, 20 Feb 2025 14:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+FnlPVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B8F10E967
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:16:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6rt8d001838
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JuYdE4dlbQ4IVCBmM2eClz9fsFF9FHokS9b6ozmwZV4=; b=k+FnlPVzYzdZ2PE6
 Kroj/0BmRoWTMqyMDL74lahz3z0gUJEHra+1atu0vb92f2OmCzhuUwgwubYsaH9K
 kZIijV8sXs4gJd9882zuZr9MDEh8UUUWfjgxceNdpuv0JkcEh1psJ72Vl57W8TET
 6uX9aq//ihEVPSyatHS9FU4PpQjNzu61Ea94TK3akqkIXp3VKOi08OHQ0ftKO2x7
 gFwI3B10Ahan1UtT6vu7pXJTpTM8rTP75+nznsOj+SdU7WYzjUDQ8dNc9e4JhVX7
 qNssf5RV1Li7Ii6Dx4PWwnJOTpW4S03QSjt4nNqlZMn9+Nhk3tKlqe0RUzvnIE6I
 1BiaYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2eckt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:16:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e4546f8c47so1926176d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740060980; x=1740665780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JuYdE4dlbQ4IVCBmM2eClz9fsFF9FHokS9b6ozmwZV4=;
 b=usUjp+lz/9W07M2G6CycvBKMB6Lup1DXOXMSj+hIQbooWxSqIZ3IQgwDyj+E4MD3Rc
 90qlU8dVgC3gHAU7T5c0jeV/PHS06j+TU0NbAU1X/+FIycY/lTvGS42N2kZz3RV0KkKL
 X65k5661q0w2qYwoo+6PrC1G6UokgGS9Zlo8J3TodJ8qeAklvsxN0zk/8f63DPO4A1UP
 3maAbJKiMUHtO8T4fVrQ4YfF74nNQtaQBt9yMl0kPVETS2qDnXThWP2ZQN7dJ1YMgeF4
 gxAYBVjIkH/3rMATYm2waQrGfg8Ejm4n0yjBIHSmAlccn4JYmJD3UXxAslKrwFkz6COa
 lBSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuUDtLcb3v6xplQia5navHZzpw3uiWRMUh5Oeewr1/DGhEcpDZrIxiukaMV/0uwFVMbbjiH3WC3+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6BWzzAMUNND+xDh8Yqqt728fSbJ+vz9HF0Ym+Jm+quRnSEG9B
 3/VPyELIrDgz14xgYbhP4bcxulf96ZlyWL2c/XdFDT5hnwLdj5IIg9nP+6fGcA41t4Ljsig9v56
 1Q0q1y3R1yuXDVkWYtEZH7i8g14U5WmkO8A0OkaOjO295qIg9/kbBGdbyT7Lk6CQWJ8o=
X-Gm-Gg: ASbGncvxzVAzxMJsAo+L3itu+xZsWQsbQ8whiIZv4FzOr29vpoHYn4FzCyCkVRTcvgq
 EpFqAkNzfgLokkOqncUnGnYhRb0s/aXJA043LNDZk6QBH2aEKCupK3uJfz0XVKfqKQ/0f6TPoMc
 VFqkbu4ms4t58uGuS831iVOvTVtHBnFvkXLGD7/QeMmOnrw+8zuW5Z5JFo/JQFEziZPQgxer+3z
 vuPJNXgbPWLobvAUd0A/t4lsQILbZd6hrJx4Mk4ouaUs7Jl4mhlwd4/z9C5hCFKbctN109cAB6Q
 ni3DoJpyeLcqqdRhWtyHsTYk4D7ifexvRfhmCr7Nc65QhwnpU1bhb9gprBs=
X-Received: by 2002:a05:6214:daa:b0:6d4:d1c:47d with SMTP id
 6a1803df08f44-6e66cc81ee6mr117329846d6.2.1740060980168; 
 Thu, 20 Feb 2025 06:16:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/rtxy8V+ibsuKKWTYNnpHRyUUiiKw18tEiKCIKFtweF7nc0fiGiUTgniZ2kAyBjdw0RVwQA==
X-Received: by 2002:a05:6214:daa:b0:6d4:d1c:47d with SMTP id
 6a1803df08f44-6e66cc81ee6mr117329606d6.2.1740060979770; 
 Thu, 20 Feb 2025 06:16:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322e6sm1462102766b.1.2025.02.20.06.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 06:16:19 -0800 (PST)
Message-ID: <bbb099ae-2389-4b7c-9161-83d8fe94b45d@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KowSAUiGqgpD9u5pn3RASj8exDfxXA8M
X-Proofpoint-GUID: KowSAUiGqgpD9u5pn3RASj8exDfxXA8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=878
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200103
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
> depends on COMMON_CLK.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Ha, nice bit of archeology

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
