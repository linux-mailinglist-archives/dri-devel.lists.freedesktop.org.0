Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1770A84D00
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5B10EA4E;
	Thu, 10 Apr 2025 19:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TV4G4NM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923410EA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2kMM006879
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=; b=TV4G4NM312v9HVjc
 4D+iftoKVsdsS1L546pNBCtLGMuaUjOi1i+2q/Rc99W3Gy+RKhX/da/xJqB9aZjP
 veEcWjCTpQi3x6EUD+9YUCNH6qpCMRDPD3UvOx5BixWbOrjSUK6D6ReErtp/I72r
 +lcckd1McY3/c5+PLVPa5IGTLerXSEHtzfPhXFotyqtAtbQ7Qj2MoZjjw7IbCqbm
 vfeAHOLFn5A3x2LyofkyAPTArhTS922s/mpEbwNoYRrmJx80ytRVpzOIgedLLfat
 PvWxdArk3gO6xLndoArp9e/BlpUY5sYu4V9p2ILWk5y4j99w5BkcMBk1ePzeAMj1
 g2UdGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3h525-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:28:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5f7210995so224375585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744313294; x=1744918094;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qh0Ep6gRYMgrzLkSqX3dxAeXJYkCyrxkcSbtorndPrE=;
 b=tESAclBGXD2nmA4K01N7WJRHf96H5YZRGjvChgWbVLmhlm5wRwi/Nq4Ewi8UeRMmgK
 Emku7WsVXwOaaicbrmbQLbRCpIcOMsihkIfLAzJZBaqbBQ7V96tJ/ktzDVvYoZ0Lwaur
 YRsZ7yun51eqZrWYoV5kZGoJTdIDgk04yik0zaQ/QbZq+2Bz86qnAJNTIdpos8JH/UpV
 w5af4qIWA6e7WLqVPftX0c220dbsn+FleqvkhOJ88QKm8wdwHOUWsAFSM13DCwir4K51
 Y4owltkZQNWH9H9E5AjGI5ADC1nVjTOmnQEuYbcm9UbigpWSaNMTLWVt07Okmi9axS2O
 COTA==
X-Gm-Message-State: AOJu0YxRR6wFSspg90gbyUZz4hu9mumvu6tB14i/XY+SJ7acIEV7+HqJ
 S6tltqjMZEP/zg7dT/A076rsg5E5HJnJ/zf15bJdsWqOyaH18pLsxRGvKKFsh+6abR8e1mxNpf4
 HX7Qa91cl0xbuN+nfajiJHO3EuNcX8TNjPF/cCR4hI2FRXh1QCBq1u06pZT7UEbyfCXA=
X-Gm-Gg: ASbGnctXUSxACLQmawBbuZIwGTXIVJv3MJqXA1SWg3UGAOuxxi3ja7aBmMwlhNFbBnR
 fJQ/jALCfuceU1CyqLJTLl+9UKUoj2psRSKtk8Ay1L+7BR2OZncAJOgte4365rRcx5dPorU7xlh
 8Asmqz0SEF3GxoEU+fwI2UjuNl2wRFUenfnKwAyEu+WVEE8GzfLBtZo1OoUrQCOR7aXFh54yeY3
 MUi22KUZkmmwETzRjaJN+OnixtTa1+Iqm+OyzBPDp4mo4eCAbxypAwliFzwHREgZxIJSMvl5+8J
 vC66xIlj21XXbT7+6rqX0a23QJ1fSGpF3DdpPQLHs5HhpZxrmD/xW8TWXBVM2zMbmSIqz5it84s
 =
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c7a765e51dmr560004385a.8.1744313293997; 
 Thu, 10 Apr 2025 12:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSpgRoH6+EQN77MiLX+UVvWsFRwqYiRJvK45u6T/7sV2nB5QKrHoRaFMSU86+dK9p42cd08g==
X-Received: by 2002:a05:620a:390a:b0:7c2:3f1f:1a15 with SMTP id
 af79cd13be357-7c7a765e51dmr560001585a.8.1744313293707; 
 Thu, 10 Apr 2025 12:28:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d502654sm227020e87.111.2025.04.10.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:28:12 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 15/19] drm/msm: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <ljqytcjityeqrek5ik72duv3oblcapm7sqysminnknud34x2v6@gmjngn7odejm>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-16-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-16-ville.syrjala@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f81bce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=2eKwwukf-V9ccoo5c-0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: QmoioJLbeVjZYoILxcrPASEGC1x43HJF
X-Proofpoint-ORIG-GUID: QmoioJLbeVjZYoILxcrPASEGC1x43HJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=992 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141
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

On Thu, Apr 10, 2025 at 07:32:14PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookups.
> 
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/msm_fb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
