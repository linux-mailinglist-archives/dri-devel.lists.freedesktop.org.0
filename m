Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B8AFA0B3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 17:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6F10E219;
	Sat,  5 Jul 2025 15:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddY1/DNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A0910E219
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 15:45:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565Dw1gp004908
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 15:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RqPSWAF8btgqGQx2RmoN6IKt
 lOrg2Ps03GpJ9+btV+k=; b=ddY1/DNzQl+wCtYQrNwLVGwgZKGibGWLuLHgpgUg
 vAviCZV+Kl4Nnl73SxPBrU6VXauvAQkVXiCAWAZa16BdkWOuWTKjUOSVESTeSOBc
 8/68GsYyq5LD5aXe8fVCZLq1Y9A7fdV17Wfss1Jr5ZdsW/SFEE2M8gRSs9BqT/Ai
 jhoy0eAwc/W3kkXpo2hqf0NXuHa4MTMbX7s1EEIdC/jUD+8NY+GfGiV8fraupkFX
 IWP3sDVQ3M9ar7ebLaZ7MuVH6Y40xf2zRNemdVs8YlMw0FsNjCJHrZeau03UUngr
 8tWrkDCQi0BqvKzTIhtDGRFi9X678el1ZbDFDZUYoHhTzQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv971ajs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 15:45:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6faf265c3c5so26422376d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 08:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751730333; x=1752335133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqPSWAF8btgqGQx2RmoN6IKtlOrg2Ps03GpJ9+btV+k=;
 b=kklaniGTNzYqWHOlf4wBa62l7tGG637v38TiUO5mevrduYJydMDxkW/8cbSxzIWQgh
 CRTMg418dWOWh1B13OkOYAUjLTaIgBLEeZjl/I/5g6auwzqj9/5NjfGvf8HAQzuuVAWN
 Qzw8dxtzQysCk8+3PLqwszCRoJMkhUP4OpGoZ80m/iWqAXqaPcSIc6OUldPCTruCvzCg
 UHQ6MOIXec2nIhrOx7h5YaEny6Suv3TG+OXE93Outmsb86DiqeVRmDyK26sOsHxmFjin
 +qjmZQPlvLTqLDRTLM3OrUPmap4AVkiAsq29DMRwAEY2XpxRE6RDoujecl1u6O6RArLn
 KS6A==
X-Gm-Message-State: AOJu0YyusyM6wR3+7u95yf2k+u0/lItOZGSaEkY8qgKWHlz+G5qN6vpj
 TvDNMhqFDMQDWpwbkTcKyiW7mfpAF1Hvts9R6689vWA+wCrgHLD3JtaLv1ptmx3nygoPj6loKIw
 oTaw62a1y2NS2eTJGWU6F0l6lXwObWKOlQqMwAmKodQ2N500Vg/9UPEBVKYwbkBeVYDUAP94=
X-Gm-Gg: ASbGncsHQxppakab35q/o37SBOs8jHacVVX9pvG4qMz7fvphladkyuCYq/aTg4Z3lGE
 aqbzP9Nxio2WqB/GbqO0qBOpFsl3v1sj+ojxiiaJJW5tjpn27/OE/HCnt4YGB29vYnFAKCInfzw
 zK+ay12sXoh/BmDfRzvpexVlBoJ/a7MMoH92ocCNYVbxmUu5f7E8aVoDCocv67J7gC6GuEFxL6C
 UYF8nCk47vx+F+I1iWpoJ3dUYgW+G+a4hU1dkRapPrhTMzv6Rft4f8ER2uXEXfRI4tc+QTU6o6Q
 wZ6CRL1tkLsgbaBucaP4cxYaTpHQgv5B2uH7goCeFj499vCYUCHWETFOl43c7mYDtka1umdRgjT
 ds3pmVH2eqvp6MbhSJ6y4vBgIuNjXk/TpB50=
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id
 af79cd13be357-7d5f10fa23amr305358385a.31.1751730332900; 
 Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdQQO9z80uLLq2RxC8dU/JD4SNPSo1XPiRPBeKRm/HHhGqxbe1NBor478/kV8KQ2/9nkaUcA==
X-Received: by 2002:a05:620a:4150:b0:7d3:f3e1:b8db with SMTP id
 af79cd13be357-7d5f10fa23amr305352485a.31.1751730332313; 
 Sat, 05 Jul 2025 08:45:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55638494f06sm609028e87.121.2025.07.05.08.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 08:45:31 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Take the ioctls away from the KMS-only driver
Message-ID: <g7vusfodm52goeid27twl7ocspyf6zfl3zsxfo3jolhjgh4nng@oz5m3xmlj3pp>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-3-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=6869489e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ff70caK0HrvyZWHSuAMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfXy5AN3MmdCZ4J
 m5dUPx7SJcEKEEr+yX7emZQXMYP7mBbiCb/3Aq/RU+TbmVIdNI6vJl2cmGG+sb5vGpk2UXHfjfZ
 4/DeLUntNf62vqZrLopaqmMDo9K48NahJs4jRvQLgPL3+8WryEovF1FV2diAikVIjTHqFkGz6mO
 qoPPIaS3dKkRApIKHMGzrBQEIrM8PtlkcvFBDnGi4Yu1LR7d/O7uW4drtAEPScG4aH6GX/uD2rs
 DadAVvMZsR/vOkhAh7MoRMn18iGkzMP+NCJoLSCJb9ajQ2Wr5SDdjNeu1c5sXR+l34bU4a7VaFG
 SmbhXI9+PQfFOmqGC5oW5XMTZQXQLomrSXXl2CDF2WPydzIsSlzeqboI5m7gQJ64GAkIln11tGs
 3xmmobGAvv8qL9t3AiFfXNg5R+Q/m3FfmZj0vp8eRTfke7uZRPYR9U8J4N77u4uYSPRBrsFX
X-Proofpoint-GUID: 1UbhZV1Rm-qUHs7wa73QADK6kSM0ld0Q
X-Proofpoint-ORIG-GUID: 1UbhZV1Rm-qUHs7wa73QADK6kSM0ld0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=760 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104
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

On Sat, Jul 05, 2025 at 07:52:41AM -0700, Rob Clark wrote:
> KMS-only drivers should only allocate dumb buffers.  The driver custom
> ioctls are only meant for the usermode gpu driver (mesa), and not for
> general consumption, so they don't make sense for standalone KMS
> drivers.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 

If we need GEM IOCTLs for the KMS node, we can think about it later.
Let's remove them for now.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
