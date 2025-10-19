Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B837BBEE97F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 18:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6DD10E218;
	Sun, 19 Oct 2025 16:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A60wrfVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030D10E216
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 16:02:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JDf2Nf023970
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 16:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yrSgxSLSjug2hqzstf5hGIeQ
 dvScIsYA26L3fjhfwUQ=; b=A60wrfVL9zZXiJo1IpYz5nSiXDhJggSOBHOpZkcc
 tlEyseTYqS/ksvdbaDIM4xqXhH0AI8SNEg5poSQa6MnO0U3gkv0/wHZ+LW401cjl
 TbpqwHrALb3oAEU3qn8lDhxRWU6UjE4aA0EP7S7HhCQ95vm0ShrjGSygZnkV8DfV
 u/1b75DmFFnSSN7r4zNkl5rIOQexFxo47+aLiFttYBRZrGcB7lugIdY6BdlEwmIm
 LVu9DQpsYbPjUFdm8qtASQ8ptQKYjFfAIVun/PdmA3OcU46mVZNAH6SlHqa/kAyy
 xkh0MQo9VfIfM5eqvPM/87ayI4rlCiexYTCfrN7WlcCNqQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pavm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 16:02:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-54bcbbc35d1so182820e0c.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760889749; x=1761494549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrSgxSLSjug2hqzstf5hGIeQdvScIsYA26L3fjhfwUQ=;
 b=uyzcbjOyo4WeQIfe1U23KIi66DzbRIlHF0eJdKeplsBIuhdfN73uGKL2UMCZSdWAM8
 wcWNGWTS5ji9vdRKnK0vlLIJ0CS5+JfEwCGEmPogjd8bR0x/0rRU96zBYgvoTJ7MF1tx
 svpP0f00vlf/08x3Daach0K5NLeSK4Id4RL1QvIbSEvdUtbKOR+TzPzYxzy3gdaE5R3n
 +0lZGIGHBRP4jtpk100xrPZCgUGQCEZCqOc9ruGtJWRuP372OsdtVLHPXzOr4DLQWj2x
 lucJvn2MM7gSK7nSwphf19w8XQNdtaoRdwbm7W7c7TkwSpnSI5JB30aQIr6pqoKO3K1X
 LiZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdFngCKDc62IJtnoYHdtajqRhLvinINkkGCwVPHXB2izGqbx4SEMaZYEu/IOkJZ8HaZ1BmEEboVCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwqvYGcV+SvUejP5vRHDoqslNm6qu96i7lCK6I5dPrFD3ZkUmE
 7vNXPifqqW8REhliiDiTMXPqCCdL40qHDya6OXUTwsGBnYnrgFyIAFgD6DbXfK8u6nUxndbEX5q
 bhjur6bafvqPvsuv9gZ5iCixWYiXTwg/oO/nI/uihIv9LTIWS8hSktbA8HMkvMp9RIsXNH0I=
X-Gm-Gg: ASbGnct7VP1qX4X552+ZX+uQbrF9DEQHDTLz6d8a7oAJfMELN+pT8GhLIC5juv1H6ik
 FhI8Jf0aHONUwWFrHJkbtL/BF3DB7nV0IVVRxSLW1D7qPCvagk+6+EezBiUaCR9chFEEKQp94zh
 51sP6oHCQ5fvP/4mEJ1PgFBGz++Cpf5yPetlFNp4FZK/SMM/Fhq29Ir5urmfvQNeQkTMPpkR2+W
 xQe54KNlxcZPSoP+DTSHJivcsCL8xain4isBO9fldoiAWjj2/5ESqhW8Ndh3+dRa0QyJ0nNdIt2
 c4onAB6pNwJ8feuXVM3NsTU3FK44JgAAq886ffCXdsqP272mfljHaXO/9YD/JKdVA6Gvh5Zct6Z
 ozW3Gaus483o8Zx0bRIcbY2cXPFBUtAWmXHQf1ei4KDZQEnDByn1uvqoGlzou5B+7YEKNug8iWE
 KJjdm/Sqstd1M=
X-Received: by 2002:a05:6122:3d05:b0:54a:8cfe:193e with SMTP id
 71dfb90a1353d-5564ee5fc31mr2779096e0c.5.1760889749466; 
 Sun, 19 Oct 2025 09:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX12e9u2jTwAw/ohWphMrO/Z/+CwpFfiWoBiRqZoykAWDjj50XtmQqV9+4tCn2aAkVSr9v8A==
X-Received: by 2002:a05:6122:3d05:b0:54a:8cfe:193e with SMTP id
 71dfb90a1353d-5564ee5fc31mr2779046e0c.5.1760889748963; 
 Sun, 19 Oct 2025 09:02:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a9578a51sm14051151fa.42.2025.10.19.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 09:02:27 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:02:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
Message-ID: <aruuyvtzi2notuxdoi6mk45y3zybu7dpttpteqrektszkhh4hw@uipxhhy5nar4>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXwV4xDlqHYIkw
 ty/MowIUcudqUnvKVPdyhZcCI5hlj20kIdr7AN17p4pF/DVhXIsNK/tzcBEvYehU2gzCEU+Wi4F
 QY03NVahJHSbOaCjndXotqbWIdyHk0TUmf2O5fJXq3vKa5u1t5sJGAPx28FOzFzHAz2pHLuxfuN
 XT8jJEwRP4AUQBnP3JA4aOiOPR33KPz19ALPUk08FIrWxXA9JOttSdIwkmyqpU7t54mtYPHNqab
 rGW4mzlliF8+QMs67M9EZUnPT30EdK6GGX1/B5TNmRbEuy7w8k1dY7AFExs9CU5GmwLHpWIk6ke
 bTLG7zpzC39dTeH5aW65jri+dgpte/o64rWC9AK+BPaEzd8Pyfh26deVFa9bw5Yd7pHmxn4tUi4
 5n+gb6DnkS2RkV7di6A4hxHTi+D9Jg==
X-Proofpoint-GUID: mb0mC_YifmkLjyLQ5mJaLzm5Ri5lMz5o
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f50b96 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jqVs4JzIjkIIVyEy1LMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: mb0mC_YifmkLjyLQ5mJaLzm5Ri5lMz5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

On Wed, Oct 15, 2025 at 09:53:19AM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 113 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
