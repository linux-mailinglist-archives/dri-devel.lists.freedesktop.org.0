Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3DB32915
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 16:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6A610E1D5;
	Sat, 23 Aug 2025 14:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCzJiM3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9A10E1D5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:21:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57NCUI2D023832
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ECk1LsCNk3gjT6xoXSEgvWTIsSpYG9wG+965yN0jkes=; b=pCzJiM3iXeqj/lbN
 IV/J3mt6UntuZdlR3Ql5v+ass/KUy5aSHm8CbHFhBC9mm/jj2TVb32KpOIBEwYp5
 QlcmpyeDvvuKpxB/F4r8HH81zxGA3gblbiB+uWnoH9sFc2QA64XKxmEi0MoL0NH6
 lplW6K+gf5NrLnI18QZ4xKgXKem+MTryp9xjAhyuxJGjAU+Dkn+h1tTDP5s0N4A1
 baR5OUcMbcNmBL0qEN+OzZzSQ3uARnI2aDX/bAnMotkfRkNpicaP2oHj2QuC8Vw8
 ksopgrjb5AI7c4WgnaNjEXlPtzn8rr3rHdICw3NdEz5+xFBIaflKVOnzQzKfZ5XB
 4HMIjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x80v8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 14:21:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e8704fad73so762984085a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 07:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755958887; x=1756563687;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECk1LsCNk3gjT6xoXSEgvWTIsSpYG9wG+965yN0jkes=;
 b=T7aQSRlsgGQd4NeU9AK26/ztSVd6P2YfSYztPHyWC3zUPAFlg2SqrFWET4OuWB3xoA
 eeLK4l7518J95OzhpF/uVfWRzOU59QPeNwG7mQ8/vQE3w4gGvSTGUAFEL53gNKixJRNB
 3m/Rt/2hvz80j5uNnDCvK1OyHdAnuctC1tMfKmwUwBH5vEEgBg9oiG67OUXW0Cb+kufX
 hhT7hmNCcYoaXIWRntUPrhN0oTrlsFqGQDgNOaCmy+OBxHuJPzqrRbenDQXw76Q0RRvS
 DGMXRFKkw7ApjRR+jFHXT82ZoQWv58mbax0TL211XTAaRjX7Ro1LVuF+79xihGS7fesH
 d0bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpEHY+FRP1rMjvg1gGJMQ2AvcRsie7sVx6nD/c3L1T8uL7wx+xAlaRMXJhnZP4Olhg2iqIMZf9pC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhqqUnPYr5HTPO2fhQ1ZqFMpy/oXVgR2pyZuwHg3tXag4itXKa
 tuMtuCNT9Ry5HiTcHeetMxj7Wb29xeCnZHwmrWeQksa1aN14TV1jmleQc4ck6BIy/F2n/W3/sAU
 NXMXzccazqpbrWl6hp1vRl2CQJOecpIoECTPYUX4jq4nf9/8QlFvL24nYkbnuAbAEkMFqhkY=
X-Gm-Gg: ASbGnct46l0LArintlhKvCqJ89AJi1zOHfeu7ZUr9vCy+4RDuc6932NT0GEhtHC52Er
 eCDnsniSq07rEB7xQpxKWzmWLr4EnBRIG5jLFBy6bCg4ufZcGx7+ztYwQhQbo4z10JkIMnqnwzj
 DHSpfrFtB5aqV07flG2c5biYsqNdigQD/ahP1BCg41ks/Zk/a6VmCUwNsVH7ZLntloMlDOnTZ6F
 IV1mOSCc8K0fECg2GSRnIoUz8RinedrQZNKi3La4ezJqAK4p8j78yJlkWBKnkkkuS0bY7udfLIV
 YVrEpGWEvaTvJWI6Nrb//bojo4KBiy1oFED7Ke5XIOfgXrw6SRuK9lQ0FU+qJvDlBpCRgssgv3b
 09DcYnN3l5bcsTz64QBD7Fg88Wxg/oIM1dzA3jssIarC2b5x7Pf8Y
X-Received: by 2002:ac8:690d:0:b0:4b1:a3f:adde with SMTP id
 d75a77b69052e-4b2aaa40e39mr103546741cf.27.1755958887002; 
 Sat, 23 Aug 2025 07:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4PmkSmlgiF18xFq5d2W4o3JzzrwhL20Gh1Sspi04wdUKBR/io81yO2DxJF6sLkzYTQNqwZQ==
X-Received: by 2002:ac8:690d:0:b0:4b1:a3f:adde with SMTP id
 d75a77b69052e-4b2aaa40e39mr103546091cf.27.1755958886482; 
 Sat, 23 Aug 2025 07:21:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c9a1efsm523398e87.118.2025.08.23.07.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 07:21:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Danct12 <danct12@disroot.org>
In-Reply-To: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-Id: <175595888536.1764874.11815793767108601921.b4-ty@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 17:21:25 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: -OELZlZV7Ah10uneGcLuVCn5UyWwrqy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX6rWEfDkXPEoF
 4UZP3VVyy82WwK+uxV32xYuAFd2airlLMJqRh0veevr/MzSIFWmNidrUl5D4JPa7fYmF6RpOz+Z
 SBxSRmGo3bV2PVWITdFWYI1EfKQq00GxvSGmPGaUdZXXa5GKUvQHQMyY07Drng0jz+wKBQZD4Ct
 RHEmuLqU1n47keHRXZ26z5/fmHmu1UEqBh0LgBW83feHrls29P7XtRimqWd0mCMYL5nHQEwDAYX
 hPkHK5+gn0Ai5yvx0/K+DhrCfx7myYKwULXaP2Ny5lonpzhKLP+O36QIJ7W87/8Joh8x8zh7KOn
 Q3f2FTflyEWGepsnxDXF5fR6aPtcn9MZtDen5hKo88Kdav6z1XmPkf6JsDwB4M/9xk9J/7/eUbC
 hs5VYPWt
X-Proofpoint-GUID: -OELZlZV7Ah10uneGcLuVCn5UyWwrqy1
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68a9ce69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=yaBPxWdkq7d3F1QRnygA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Sat, 23 Aug 2025 03:12:00 +0300, Dmitry Baryshkov wrote:
> Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> allocate memptrs: -22" errors. The mentioned commit reworked the
> function, but didn't take into account that op_map is initialized at the
> top of the function, while ranges might change if GPUVM is managed by
> the kernel.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
      commit: efe927b9702643a1d80472664c2642f0304cb608

Best regards,
-- 
With best wishes
Dmitry


