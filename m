Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C5A84D17
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9672610E399;
	Thu, 10 Apr 2025 19:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3UBY8Ky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6FA10E399
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:32:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFmMEP018368
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8DC/ULaxKHJNAWyjnCUleasg
 vjglrf6X9u3PGKsISlg=; b=T3UBY8Kygit4NGggSoZNBrJdpQgE4LhTQkIRWHFg
 xkf6jgmejro++jMKsqaEqVLrD8EfcefvdfXt7R8CsTgQu0VIHgwP9XUVc0L/aD0/
 GvLDbuQnkZZABhrV4DRoLyVdlawi4+KUFMPLHJmLrlUXSf3EL2mzANiPQt+GA+n4
 TwNhCwG51Pr/BeuF7va1WmCZqvTsyoed8wgPzxbb0/DFWXJRqku1RIUjRZ25o++x
 1slSfFKEbagMFxOEB1akI0Iu3B9RLYzD1Re0XbPEgSjZKh9mu3Cbw/Xa44irJ6NQ
 a1R6iznbOzcM3g5eRr8sxxTZ6jMWnbbd+1hzo+ZktNZQXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb88af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:32:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54767e507so200160385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744313535; x=1744918335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DC/ULaxKHJNAWyjnCUleasgvjglrf6X9u3PGKsISlg=;
 b=ghM27UyUrm9m7BwMpECZqp5hNUmyhTqY8Z12IiWddUSomQST2bDNonCuQJJ9q5s1lM
 Y6ks4vTPZzfve7geqHQGOMOqDZqsCL7Eo8p6wLQdMnNtA7hObgGIQu9z/53KwtaQVRRE
 OxeMkrPqQujbxmshb/G4OTC8YeqUBJ7OLwutswn5OmYRUZ7AD6UYXvVYuCPURlFsSpiI
 m37llFDii0K5kir4nmMAPjbGNVOGP+/ojtxJUOnrr/E0biz7QjXhFFGyzHz9trmF0Q7I
 crXBSqwHOJM1rOQZN+Decsfbtiz2hFS6vOYLQ/Imd2GtfJlgqtOHJh2tNhUkDHJQb++a
 T1Ig==
X-Gm-Message-State: AOJu0YzF02i5P0eHlt2WAbj959zSaK71Oxri2FAS6c/Q8Pls2XFTtNj8
 TBalcQLV6UtSm+/u7VKpD6ol+zvuROwZuurS3R23MWqGakJKVo4cOVncD0HIf5GGz+j3mWGQHn4
 U+SgPsPsJ7lviRUveRQPEVQoKDKSe5wLZ2X++GdhiM1Gdc9bfwvS9VnGcMo2ihHnzGrM=
X-Gm-Gg: ASbGncumKpwnoVqvDFdps4+UeHsblUJfGOTiXhvcYc4FzSVbS9UYwioLH4TaHWHbLvj
 0apoQ4FP4Uv7P7wvW/ALI0zhyomapwQDkvKfMgNhW/B561gX+3UFPympJFZW8pEb+5ZS9GBv2rM
 /zBB98kmgFCiP6vdU/5RBiZiNMaoGa/QUTMSBHX3F1WZuNCXd16RP1TgQamCDtkodAPvM4YmYl5
 9UcTzYmpOzNykg7L3NagsiP/gVAnEyYMhhFDiza9ljoDAitcON6JCDf2DapRoo2NSW8sTLTvpFQ
 c5qLLN5MKnn5S5syJvWAat423ELwz6LEUliHgp80YcWc05N2ZYx3zNoxvd63UL5iqdHE5VbIugk
 =
X-Received: by 2002:a05:620a:468c:b0:7c7:a5f5:61be with SMTP id
 af79cd13be357-7c7af0e2b87mr33265785a.32.1744313535713; 
 Thu, 10 Apr 2025 12:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmlVMlr0hl8Yh87KvoA7HWiOyYF1t30gdG7pSQ/S3ZJUQqhzyZ6eV3mA6i9O7Jrazwr8gRtA==
X-Received: by 2002:a05:620a:468c:b0:7c7:a5f5:61be with SMTP id
 af79cd13be357-7c7af0e2b87mr33261585a.32.1744313535330; 
 Thu, 10 Apr 2025 12:32:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d123259sm227317e87.15.2025.04.10.12.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:32:14 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:32:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
Message-ID: <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <20250409061543.311184-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409061543.311184-2-vignesh.raman@collabora.com>
X-Proofpoint-GUID: iBckOqLVduxb4MzfA5QOGYBI4p-gbQcl
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f81cc1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=Y-6xsq27O-P2zhJ8F8cA:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: iBckOqLVduxb4MzfA5QOGYBI4p-gbQcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=713 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Wed, Apr 09, 2025 at 11:45:38AM +0530, Vignesh Raman wrote:
> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> exit with a non-zero error code while configuring them as warning in
> the GitLab CI pipeline.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Use LLVM to build.

Why?

>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
