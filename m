Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBFABC65C8
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911310E8A1;
	Wed,  8 Oct 2025 18:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Db7NaxiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848EF10E8A1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:52:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IQW027653
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vVjFLGcYouerL8vzkeewUnxc
 jHzrBIUbHKdll+Bz7uY=; b=Db7NaxiD0ZwtrnfNKZgSVIJ/QQg28eIDUuF49WIC
 mvE68AKvGhPgZfncdtpkrmxLbXWE6JslwbJk4YG+kBNUwwpDHTyVLVB6kUgyH174
 jtMrmlBzwtOW82C+fwWLVA1riP0PgMeizIjJlZ21VYtgq1LUc6zWa01dk0gXeNwR
 RWzNjGxgHogSHW0NGT2NHEfFcUzYJq8D1A7fG0MFVqT/1/SU/n+v6tLRWBdAa6Mq
 xl95tB/dyhEbQEsPk6nV435fAkuUgQhSfp/mLfPNkJ8UWbDI0vMGwUF1dUgX7jym
 TPYvwHnF0dTJLVMhbsEH9BguPOq90MQQ/c/U/5u/pb83lg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nr9hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:52:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ddc5a484c9so4060091cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949560; x=1760554360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVjFLGcYouerL8vzkeewUnxcjHzrBIUbHKdll+Bz7uY=;
 b=WggfpBCFmd/1NRvMCIQ+hu4Yl/ANe/zgsZ5Y1HZ2QWqHwCtRwcNw6+jnPVoFcdA7Z0
 2bQh0elnEHDgxCH2RdZdIy7Fm0KSKeFQb94WIs+9TOkXL1vq06blycsTr5G9aN55URPZ
 nFnLVB8rSVcUKmsJ5kIz/f8tg4DULqeDhxyjDmu2hf/XsW6GYHC44PhHwxLRq1jH814F
 WxvppI5gGgGqoUPpOPdSUSyeP7MwZP+HW+xPHJzX+iPTrp7BqDvJid/fhJo5XPGWukUa
 DAP053Dw0ttDWrCE5ZXXIqSNGqG0w1GQZiuCxmA1ATpNeNBJFsQTkx1qmKsZPgVhzUfJ
 QEEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa/BcRGzmpspvf40gCXFC091Wwa1V3YdrjBtiegUOM69LP5tpK6UCB3q7Ak+9MtCK3t7dNrtAz/xk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAYRNafucVWeGOBrbHyLbD6eqQskLBana1U6Ja66J+G7wOuuB9
 5QccojjoGA+zn//Xr8ObTOGMYSCRYXao//1Fg3kvZBczKfT5DYxuBrygh+0fbnm0vxpRBl0Hf0E
 1pKe2EDdUYmHaCkUdjsNAiInMEx0XixTR/6Vb25+GC4WwJEuGcT/IOCp9CTvBMzaM/nxYcXT+f/
 YcvCQ=
X-Gm-Gg: ASbGncsjJL8ror2+eIwpSDKPdmaRiQcbD25sdefl8OwEUgdFlsJpAOeu/OXIKPTyUHf
 Zke50bHpbHyOf0O32HN8CforL4V+VRQ5ioyaBKo2EwhH2XQmOl9rSJpVPABI3olprKAWac+aoIb
 rromzYqK2X4uWWHPCVCXxmPgkaL/zCy8Qt8oUPFxOJ5he3LJY+TcNgfcTS6tdHSCDfg5Wt3pqyM
 ElyZraHIRkWBRcLDzrL+nLueUTfT5yr6+9486Md7ZangxYRAYqaeysrV0Onfslknn+vvShdSnBO
 WuvXb0/xlFV87VdbH/ud48J/xfTmTv/HPHkpYMOyYTjbnXp0FVqVu19GvEMwEIxXh5QO9Nk2L+x
 01s7Xt/WuYCZVrBVH7573D5BQLVqJNfYcTp6sNmZ6Pw80mZ/o6haiFJ5huQ==
X-Received: by 2002:ac8:5aca:0:b0:4de:9079:6755 with SMTP id
 d75a77b69052e-4e6ead6bd19mr71866801cf.81.1759949560321; 
 Wed, 08 Oct 2025 11:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRDMJgxozu7GpE8vuClwMhxKzfh1N0FOWqji908B8PsWLJ24hNfcQXzKF+rht0ZjikHxaJwQ==
X-Received: by 2002:ac8:5aca:0:b0:4de:9079:6755 with SMTP id
 d75a77b69052e-4e6ead6bd19mr71866341cf.81.1759949559845; 
 Wed, 08 Oct 2025 11:52:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f39d2fe6sm22333091fa.1.2025.10.08.11.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:52:39 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:52:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 16/16] drm/mode_config: Call private obj reset with the
 other objects
Message-ID: <zunipasyu3abuscjqrpqtehsrqp3pbxojpmf54kmjui4dq4kot@46e7zpokjgqn>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-16-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-16-805ab43ae65a@kernel.org>
X-Proofpoint-ORIG-GUID: qIKHYZBXeGIK8rcSkZXMZzHo53Kc5vAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwp02nd0s/Lvy
 HSc7Be9wULESO3DEZp1W5K29O9NbXKo05hukzcuW833bHW6NutT9NpI3wS55j45Wk6wDwPlm0MM
 vNBxY09r2noL1UVEHMI3Sp+1HBHkmH235VK/Z8GKRDqAi/lOtQBHE7KHgieqlR4FMe+v/UamiEz
 TKvJghMryvmaMia48PWz/KeeUrGBxTYDA3zLYYSPd56m0+En1LFzUjOHPFTND+1vedCsK7LUHOp
 +aVaW+7LcV1OqXeOTKYD/c+D17bEdC1XwZjw+pBVl6+91iZlgpWurlBTB2qU0/pHzYwz8/EwtkO
 LE7nP/D9oWdxVXoSJcirjOy+/advFP0v30l8kecQTcpnn57QP720Ckf7eYvE/jLxr8AzfaxyeEX
 f9OPkdCK2cx36rmuu9fo/gRaBBoJEg==
X-Proofpoint-GUID: qIKHYZBXeGIK8rcSkZXMZzHo53Kc5vAi
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e6b2f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XNMsMLdGYLHsCiX4oUYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 02:04:14PM +0200, Maxime Ripard wrote:
> Now that we have all the drm_private_obj users relying on the reset
> implementation, we can move that call from drm_private_obj_init, where
> it was initially supposed to happen, to drm_mode_config_reset, which is
> the location reset is called for every other object in KMS.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c      | 3 ---
>  drivers/gpu/drm/drm_mode_config.c | 6 ++++++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
