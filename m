Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C32ABAF12
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDD410E1D4;
	Sun, 18 May 2025 09:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ob2VaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD5210E1D4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:47:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I4MDYS000737
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TFlU0fSZgntNkoaZyg/NsxA2
 mHRMkBsFVOawTRTvNFA=; b=H1ob2VaQRI9r5AAOWB2Ea5Frzx+JtL8rCY9MiJmK
 nQ0DRiOiiaLUuxUNM9rgl/LO0rFBhhC5oXquNkKd+hKJISw5oqYNKs1pC+TvzlQA
 LKzbgv6Z00HM1O4coXxfnicNAyE6/EQbjAqaeEnXEf3kG7PJbmpvq1zquYI9Qjhd
 8PUHmbJG11lurGuVbXOEDn3WfOYv6EMhZJHRVYfi/ZmdaH1xTdKv9gD6+6URK3Zw
 pP1U10hBwQ3jxNNPkjCozKQOw/SoTlxx/x3bhUJSy2hscWy4bs7P5ktCdu/kxL0/
 RKBrF7AP0YeS2LMJPp6HcZNNe6DVLEFhJ7G27RrovTwAKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4hstu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:47:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f6ee43c4a6so99352056d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561662; x=1748166462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFlU0fSZgntNkoaZyg/NsxA2mHRMkBsFVOawTRTvNFA=;
 b=ULRTAMYjMoJlWnonomO19XttBwB+L7XW7O0NpzNc2w8bthkdrphtXZYqd6ToILGfCH
 2kKEXfwZbnvmfkcAG0zDfSYbBl6Z+Mk/p8HrcuuwsjLVvRaeLTDFT6+wrfv2a8F41XOI
 8kzBlOd6DZxg9wLs6f16Xq9t8EkGoNY3hfcD3p7gW7yfQgYID6Ov9g6jfx5dkdJCiQSh
 ieONp9wWdgkCl5WlANVtkQwXmFWDJBt9ZpzRq7NfbQB807WOTVFhkQ1IMpPycUktNdCS
 g6WOmTz07JJ/HklpdPUFjmGouGpDD4CtJrUpobhwFdIhaF3Yyo4sR/Org1V6qDUgpPkg
 +odw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW87dHX9IhBgKV5sQzLfGlPaNvy0Onw/p9rOvJiWKLoC+6Z1quo/m4JYWBbllSCTLPB0eXHC3M8aAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV7ttksgGodVd1VorBAKqVxRsAiBb1N625eAYyjR7jc8ERZLCk
 /2TRpB42c3Zijxpqo+NNWJPGHoWmgpE2sqR+bSRuDmAfD7Iwo533umk+oNk1H3g1SwOrLRapZjQ
 7UtdformBIG2yhV8cEyEL61XjkpEdlbtUuB0KNVoqk2tJaCvYq6LbftL2Cuep0DcNoRn1xP2XHI
 Omcy0=
X-Gm-Gg: ASbGncvpPClxESAL/SfOgfF2CJgj2+2yOe/PKzO66M8LEy6TPMbcpxumN/tNCvfs2rm
 07JU4TeX2LiU8+IxwHj1k2dv51Fil0+Ejh4fT0la20oDFpkpaMtmmJRZmb2D8kSKljWrGIJuAUf
 YOu0nIarfoNbako605rqkSBEZ8YnlFFu+8guIF4Ml/3PVmppKYl/Itqz2HAit66mJtxwchZkeau
 nwTQJ1812bND8BN5U3qFsIfTCMw7vdxGhrVKEUqRwwHisdj6bI0wES3jbNhHFtCWNxtgLg/Ems/
 VH5sTL5wTZy8jtGm6bvKLzWNTaQyj5lSI+39uGu11WCgN0AVn4i1++6+23PNrNjk/aNT5mZgcAg
 =
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6f8b2c845aemr142878686d6.22.1747561662433; 
 Sun, 18 May 2025 02:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETeYU1lKZj8FbSxpmtHQ7ao1CaOfNBSNhCCtY6clLi/oJVGUTSIlf3QIwNUZfc/juiBKD4BQ==
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6f8b2c845aemr142878466d6.22.1747561662111; 
 Sun, 18 May 2025 02:47:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f2fceasm1374479e87.60.2025.05.18.02.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:47:41 -0700 (PDT)
Date: Sun, 18 May 2025 12:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 07/14] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <wwty3mev3cihpyo7utwoe4aspeqf6hzuo45p4xbr6wali7axjc@uqwhsgqcllzh>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mKCaV5BlMmvELnOpBhJYQpl7emejrp4L
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=6829acbf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Abfa49PQOijBjWCf-xgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: mKCaV5BlMmvELnOpBhJYQpl7emejrp4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX9GnYwm7UkR4t
 Yj9qURkV048HrPy5SWbf1ujiHE7+UsggdDSfrDw01TF3a4WEihBX4JCCuaI8EKV/qNurgOUx3MF
 wEKyO7wt9Lf6VYibRxVB5lYeZC8y61jiu1yaIRDEFtgQXJldq3/qHSNL7yzn0HyRfeNRRt8pLxD
 cuCCtJdmHRUWMMzN8/lt+d1ywOs6FQBJvO7NKlhw9ekQTCs1Gx6TwVkycc+Y0fFUssXEEBnuDS3
 o8QiTonqxolvN4n6fR3vT1e8+ObuNGkNvKq7YVEelB2wuQks1KkleLcm9PYK09h67MQXOLnDFI9
 ojAdrTzHKhjCpyAsl4yB39YS1mcEE/T1FaC6pvt7k3XPVBQ16pf3Q4KUHkI/XruVxKv2FBjF7TP
 j0c/qXwNFwn4dTLjTgmoXGUhaqDNJlHPRKVBqJP7wR9wCc5iYflfHvq/74hkl2YKosqAIGAq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> This commit is intentionally cross-subsystem to ease review, as the
> patchset is intended to be merged together, with a maintainer
> consensus.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
>  include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
