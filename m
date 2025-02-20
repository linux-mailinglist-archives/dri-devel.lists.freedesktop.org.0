Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB7A3DE14
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB38610E1C3;
	Thu, 20 Feb 2025 15:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9vjG56F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC75A10E987
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:17:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6mKo8014977
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kyqX/wPqcVrrLtvA/RqDwo6FUcM/5iLCU4temwHdiYM=; b=Q9vjG56FFKu9Fupk
 rTl/jzXxjNSgMUPblmVVtcXl0TzBsAj10QUIUXlm1XSfoY2wRKxMPMR4DfhhukUk
 1rsG4o8aUPmFn0iAX5086dXNzp6NhYW3vqc62A0GP/3mIl3f1pRI2a75Qw4ohjOJ
 rQf7fnU8yoC2E7SYWL4Gh7Q9A1+NMS14euQu1o6w2TKEopasiQtG3o574ErnhsbP
 u8dYgEkLcChJ1XkvpKQtVk9BleU/QLtsn72aEZIoQ3vPtmWHWs4IW0nxP8s6FgXq
 VUKYpF+QJh7idSfJc6thV4qVeX6VS7Dv74eUtzk2LGKAqH8BVU8vGn1JsJEHM2o5
 3Ov7JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy16fxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:17:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e249d117b7so756446d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064636; x=1740669436;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kyqX/wPqcVrrLtvA/RqDwo6FUcM/5iLCU4temwHdiYM=;
 b=rFmV+cQpEBb+Y92+qnRCtyv+/IcRu1DTQBTVPaPlFzWIweJEC3SBAMV+U9Cy0to8J2
 3MmzcWgw1Tm2PwY06EClEmiQutjDDp7MVFB9NvqGhvkmg6+MKN64MM9tKMO5PpbNsXsN
 f6FYiwZOL9Ic7lrZAtPEXe27utdOFsI1SKdaLrTZD0nZUNFaHclwN37ES4fERFqOpdON
 Lm/NDXprqAODJLbbElC5gB6XEE9WpI0Xs5Mr+k3IFjpvdkbnXRU+dY/uIXGxUeoR8sbb
 YrbvnBgKzEnhO3+lVnU195ZVuaC4KtveE+rJXYdv/bofoobnAtVV7YV0jgkNvQDLsR+5
 HfhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRe8nqG/dbDs8co8QlYcgTdVnTvGS2kZZLT3/06m6vuiZ0JB1KSzD3xpo0c2I7N9wPxKPto7T+eEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQaWyt1NHrSVJRhZ5Aqfa/L1BIH4g9axH9uhlP+4NWmoFLdaBl
 TkqG+1fvfnygGbmYFRy7DAEMKjiRL4N7/UrX5LxSBz4Agic+ezY/0Iy93vv0hyywFPVk1Pg7oo8
 DlN/ihBXLAuq6wX0Z9ZZKW4Jl4lsCH7z156+fXvSMyNCv6X6McMpuY103c1EQ2HgZTC8=
X-Gm-Gg: ASbGncuNBgCwNMKfKkkTP/v9by3FO7M50a6+77/EOgdk6anSBIPv11fg7zAfhMJRyyH
 9ppj41Zps9AZME3oD8Q2TnM6m6fxZri4DVbArH2Wql2BCVM3lsrtaok2CPclcUa3uMRomXp6bqN
 Rd+3e0ixBY3HClKKah94iWnGJLuH5vqsFKeYtR3GPh88ERKvDFaQ/TKwl5hb3QepFP/v7vWwCey
 f3YXN2/J/i6rMov8gHpWHY0G8grcChmlRCvmKcteRIxSF4OFjUJP8LyHl12dDKDCR69q6ivR5i3
 x3KUfwQAFjo0cJtLT1trUNkMORez5ZhIkOUAdAQjP/9l/j3tZHOvycUBvMU=
X-Received: by 2002:a05:6214:d6f:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6e66cd0f7e5mr109551166d6.11.1740064635971; 
 Thu, 20 Feb 2025 07:17:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtyET8snLYOZ5UG6zsxyvaebgAOp1Lqtaa+U4eVMQcS6k6ousx/ewVzRncsaB9ipBkNQttnA==
X-Received: by 2002:a05:6214:d6f:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6e66cd0f7e5mr109550916d6.11.1740064635495; 
 Thu, 20 Feb 2025 07:17:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbbefd080asm517329366b.179.2025.02.20.07.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 07:17:15 -0800 (PST)
Message-ID: <b3b20d5f-6281-41c3-9769-6545c6782eea@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 16:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm: dts: qcom: apq8064: link LVDS clocks
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
 <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bcIa0uwVh6aYusrLm3RvCtxLBIKcjAu-
X-Proofpoint-ORIG-GUID: bcIa0uwVh6aYusrLm3RvCtxLBIKcjAu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=758 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200109
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
> Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
> to the MDP4 display controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
