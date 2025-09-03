Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29015B41A09
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65410E65F;
	Wed,  3 Sep 2025 09:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="emsqakHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B3110E3CB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:30:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832PXdL010204
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 09:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VR2iqlpPGndqBZFzRTnrJAZ1
 ADEc/HrM9Jf0+mHC/Lg=; b=emsqakHi2lzXHfrsTQNrTMRswHsZGuewjNcTD1QV
 2ICTx+HhdBoUYNDVgySPULe+BZ/oZNBBM+6QzAywjXPj5nwqwDjD4ZenKRjqQDBP
 P0EJC9B7LTYdtE+a9sAzLxYcC61a7MT0u9L1Hw4riZGb9oU2YUAgLBe7QwUlNpQA
 lVpbAEQc2iErpMPjUV5MLxJo9ZjGo4Yb3nA6fjLRiqmL8Lj7iHVXIc5/keMxMtkS
 Tjh17+Pqx8ocUTAGOK94lUxjvSRLaazFhIizbqkrm84Cxh7OS4eWV5HuP2HceGVO
 n1Ds7KmD9hIl3v0UaC8nQarf5T+Ybr5CQ5IEBTFqR2Fx7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ek5tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:30:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-724ee8d2a33so6631026d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 02:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891814; x=1757496614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VR2iqlpPGndqBZFzRTnrJAZ1ADEc/HrM9Jf0+mHC/Lg=;
 b=Tm/CQwCfKciU199TwhX/hzocn0H4dtRJFhSwRAm6MKbsxV7w+fa7/jBDVpf4jzY1TH
 c9k06vf1rHQ9AljPtlAVFURomX8S3i2GNw4p7fBKAHon4N3fi88wVJTr6eVh6xpS5qli
 8U+54KrImUIN3kgqOqF0vHjwmC3ezEjudhBx/RcAPIDJmtuirYxww4RMjCEb0WmZtVTP
 9NQNAIXuznSXsTaLEb74y1ptvMAa7i4y+nduM62/OjNghO4M0kh0FXBUijH37TzPxOoI
 HOLVnPn+A/N+Ra6FXB+tHYQe+mNLSzx4QfCrk5BhWBRKlEoIQpPdLdPdkIsrwGVDwiaM
 ssBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdq7hgG6zIy3FZ8W1QoZbbOFuPbntHme0lDqWnOpFYaw2MxWpnaXcMtbts616mS6mR6iOKz4lyLa4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3+uv4eB0xuKNuujxIEbY3Rv2+r2uZ8iuvADKppsg4SQVHJqWT
 6+peJ0FTpNfq5rbnZq6rvYC0468Dy5mncAMc1n76hLHiL2y6ywvXzDGfqJmK8UMJ1i0gKNBQEPl
 WGZLZqesrnr5jn1+KJhYd27v8hOqVZpStWm+VNq7wOaI/qqTEOwstYDxpylywB5cT0rrFvUI=
X-Gm-Gg: ASbGncu0qkdhtBofK7HtDDE6jVechl7WMh0oZFkhQJlTroNe59SMfKEf0AK4zYQj0q1
 w71R8wjGaOK4WCWhlaKlJj5PnAZxJ9J8YKZskvCTQrWtZ1Dbemv8qeETgzDl4u05uJCdLxDOGbr
 SvN6ucE79kn3tj+jUgh9oM1XZmuG3MdkvANQ8co+g5VcfMgxYVoG3bHscWXiKLdzG5NAZSzVeTS
 ilPFReaa1Vc/s53c36l5iawVaUxdIdLALS6QS2goJmQrNPQhxOI+xNi3wmgoHedN3HREJaFwCtk
 KC2g1VsdjYWy3gyZRjxI6fsNcIYq+0UeRVGV/dbfecVF76EhX9X7pVFkt8Bi5rs1GHxmwOc0kSS
 HCR/sDvR+MyiT8bWKIVmQ4VE7YxTS3G44622IxdkU8WXlC3EAYcb1
X-Received: by 2002:a05:6214:cc1:b0:71a:a3be:a900 with SMTP id
 6a1803df08f44-71aa3beaf2bmr97801766d6.53.1756891814027; 
 Wed, 03 Sep 2025 02:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpD2N/3qjIowrxvQnC6imiMX7OAFJFGHqei1Jwm2q0yHkKx6yG1SLbJKLYa3X8+eZrl0XbAQ==
X-Received: by 2002:a05:6214:cc1:b0:71a:a3be:a900 with SMTP id
 6a1803df08f44-71aa3beaf2bmr97801396d6.53.1756891813408; 
 Wed, 03 Sep 2025 02:30:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfbfa8sm400984e87.96.2025.09.03.02.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:30:12 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:30:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v5 2/5] drm/msm/adreno: Add speedbin data for A623 GPU
Message-ID: <vit4he67rvz2yjihjz6lio4cnkfr3eqydcayspijssn3o3mgqf@6eyxrpkwvfhp>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
 <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
X-Proofpoint-GUID: rKWUSen30SFIWwZLX8HvcGlVlK0ehPWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX90XXsUg1tpXw
 Rprd6j08MFKB23ybz+pW4sPLvnzJXE5/x65D+/WACH3huo3cCYBEK2QgGd1zTURYSP7JCZ7p5xY
 cp+QdGiD2acPXttnS9qn/TrDmLBi6lxVMEMXfKc9QgxE/xgng9sxmOj7kSE1NPGugw9m+/ywVy7
 kHl7l8zSM2o2DP8bG1Qa1wMratNMBOzQRf0LcFWnqAgZYqBeV5O+Oe3w3iL2vxw3Kq24bn5kf9/
 pQLUu0YlwP476pX4liDgicOAjieHmRA7U99/SyJKfrXY9N69E2g3pJmW5aEk2KZxrwefaUJ9AZ4
 ewGk/W/Whh6i4gvKgRJTu0WRzVQK5V30ebRvyclBscG9Mvhx1hfCDgv2J61P6FSbMOf5r76aBOy
 nEMe5tu2
X-Proofpoint-ORIG-GUID: rKWUSen30SFIWwZLX8HvcGlVlK0ehPWc
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b80aa7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fAZFXs4-8VxaQHOqD40A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Wed, Sep 03, 2025 at 12:49:53PM +0530, Akhil P Oommen wrote:
> Add the speedbin mappings for Adreno 623 GPU.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
