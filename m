Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78EFB50086
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0897D10E766;
	Tue,  9 Sep 2025 15:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXWfFaKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFC510E766
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LciL024604
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PGW3tJNZDteIP3YWspfNxoS6
 +2pzYXFb7hKBbebA/DM=; b=YXWfFaKkMC1+j5b1iYb6QUPrqIk7nP6cr8L/UC16
 Cl+bpVKeRzCRGQtXdtvTpP7BVGjRCz4rswD1ScxBqUGkOAevNK3ZsQSkYVEw3296
 odiZJzF1WEuWmus0e7fSEpl2iorE6UbrjKU+fl4Xr4uZcEvNGV65h9xmjchkFE66
 O1o5K/6IDPWh3b19rVk9FPUdmuUOTPFV//LLoI7T7V8quO8SM62kmEbrV25Xjzy1
 LXLq9BUMEsbVwm1avYXcKbWNlNh/gVKGmzhzq/XP2pkDIJQpOFTihbt74QfLXKt8
 7lz7FyxIiL8uhg1gdyCk+eUDBIIMGYpvYJ+VpACymMbxZw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90n3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-53b17394ddaso2417171e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430094; x=1758034894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGW3tJNZDteIP3YWspfNxoS6+2pzYXFb7hKBbebA/DM=;
 b=NNG33YUPjm+kBjN3fqIjyBbA1rPaRxrULNVFAXlT/diuIlLq9xOzHBhti7glTi5wjN
 5ainQ6cYtj1sCf9ElZ6HbZtJhZyZaa0xKNVuMQXJ4CKcDkCsKen55T+tBntz1PZK087R
 Og7wuAaQTjw58NS7Fk1GMLjPJZk6JZ5FKqRi+rDwYk+d3E2DyCCrsiHZ9xnnzPik6Z0Q
 UH3OWBrvbsTEGTVaD7XBOLbVMsgg1q8JNrOJ7r9Z2nxlb9oNtMY5yK4TcRLzRZLlmw3V
 K+eauJ+Z+YgemL0O5vA1sDUvtTPSZb9kYJEJmvyAh3+TISlUtJ72J46ibl7+3084xcpv
 7vMg==
X-Gm-Message-State: AOJu0Yzdgrn9oj0nxdb4MB1kSMG/YsulI194vfSdXcSTdw3LQqIv95Z7
 tKh+pM+mR8+VWPbWD/DEcy+Nw5H+X/o+AVHG3MSqxm635gVN+B8lUhBy6mx+7arqPhogaN6+ypi
 x54QaZe49ggXtcU/bj1bpP6DqXa6V6yRoD19M+VLpwTqn8fHkBLVhebxIo4g4I7uXi7JbM7E=
X-Gm-Gg: ASbGncuPNKEQM3kUJlW4g3+ORboy3kdnyb4Khb4oQXkbOS3AsBSLzzRx2HSyKLDjclu
 Uc642m3z6kbHOxa0wvXaAvXTqXeFV+KjRVQvtiLTntv0Y3PddP2TlL/9+1SQyLN69K9Y0cNxR+H
 KPo2JwCJeMgvbqLYJH/Npgim1UgkvaYXbJfBAt8uus2lj87TuzFO8VZe7Kjkxp2Wr9toIdNli4g
 k31ghpa23qx8oIu4dh0hAH6pvb43qmy87AnV9QyRZXwDI7va6GxDzsDT4Gaa/ytMS932cS20+Dv
 fM/CDJpJmhgs0/PbVnkyP3+gsEIue3qyAaC6GruhB/VlH2X/U69hjA65orZi36NVUMrk6iHcRXV
 yobpz9PTbPQICG3d+U28rH/62MJ4c6L9V6E+3i47mCdn0hHOcxL0l
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-5472aaeafbdmr3072904e0c.5.1757430092416; 
 Tue, 09 Sep 2025 08:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tVoSxr+v5y2YajVPq9Q5lmHZV/iznnupYsR5oyRCsxpu2WpDH/jpQIioCiy1sxWM2IufDg==
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-5472aaeafbdmr3072611e0c.5.1757430090771; 
 Tue, 09 Sep 2025 08:01:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032be5sm39213621fa.34.2025.09.09.08.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:01:28 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] drm/msm/registers: Generate _HI/LO builders for reg64
Message-ID: <pzj3qurdrz5k6h3nylqeiplfj5rnbayp7itzonxnekdrtzkii7@gh542xo2qm3b>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c0414e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: JDkDOYPfoAmDCyEXNjrC4edfaNJy0mgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX4Au2KpuGfiWD
 c95rWfM1B/MwDWLXCKF3xBFxqAiGDKwvjvZvXPoK1C49ohiPXJpZqif0H9r+cZ+uE15KffhTYmE
 F16RRruyR5ZrjQXLtkLNn7nqUvZTzquuxtW7AETS8vASdt5p/pVOcHEE/bVRB00TIZ0I3VNOq/m
 c21a2or88tgahg8EgRYKGuvzIrafxt7xBZLTCSUnLzNGHTWtzxVIjqmVUygLpcjsifGZc5TDVWq
 R/m5hMeD14FP0JVGrped9+0sNIrqHRz7nJqyknC0cuTaHD+NE1dZ/kyiaMFc80auV7rl4jGasvB
 8nPRfzc4MlNVp/Q6nww
X-Proofpoint-ORIG-GUID: JDkDOYPfoAmDCyEXNjrC4edfaNJy0mgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509060018
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

On Mon, Sep 08, 2025 at 12:30:07PM -0700, Rob Clark wrote:
> The upstream mesa copy of the GPU regs has shifted more things to reg64
> instead of seperate 32b HI/LO reg32's.  This works better with the "new-
> style" c++ builders that mesa has been migrating to for a6xx+ (to better
> handle register shuffling between gens), but it leaves the C builders
> with missing _HI/LO builders.
> 
> So handle the special case of reg64, automatically generating the
> missing _HI/LO builders.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
