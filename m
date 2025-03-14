Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C646AA608F0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D59010E969;
	Fri, 14 Mar 2025 06:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXyRTU/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E2510E969
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:11:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKDDEB027610
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IScPRMJWlAypVVGTG3eAzrrq
 ZqNhSbnrEPn3z5FtHkc=; b=iXyRTU/KjwoMm7sAi2n6/0MoFdyJBjWemiSQIiuz
 9+4o1A0h52Vtt1uwzkVm62tTPwx1p+E6Ix1ZZdhdKzgsIf8jjUlOrUus7eqjFtHA
 LMKpgYLYM3O61kvZTgWqJNUnACPaAqn2dgqp9Hq17OkXQ7XGH0Z4qj8nhZIJ7g5i
 HU/rIBrLqPtn+w44KjNhCPsHp4TlRKHm4LiY/EXUwU25ZjU5Ti9IsUdbgdsOpGNC
 +6KVypEYLvaIH3Cf+Aj68WzdW9r3GIM3K5XPoRiPtkE8n8kEpb+ZfmzHTcCdxDgw
 Jf7TaekIC7TH0cNdEGa3clDdH3MAFJTfWtBd1qP4bvsYXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c6731507-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:11:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-476b2179079so34398871cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932686; x=1742537486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IScPRMJWlAypVVGTG3eAzrrqZqNhSbnrEPn3z5FtHkc=;
 b=NbgpZMFNLVrhGBeLx9TqsmuCDi0Q14eTKyLUF6H8dW61+wfTHV7FFioIMF3leATQ9q
 jRT0B9vWFqrR62ZM7vugsS/LvrWLZ5j6BFJxWwSfvEQYR5haIV7fzPmotAUkpG2XPiDP
 wbjRXxIzOQKRkhXTC/S/gQVT+L+WuKeG73bi2GbdIATlodffFPm6EB4Q6I9Nzr1mX/Ti
 sqY/60G9Fp4l6M4RI1T+MVjBlJSIsBl/h+87sAX6n9LwVOr2vIOz+nZOB8HQdJGMiTUQ
 N/ldAWTxrBan+NrqfgtvFQcbNBZSx3AaTqhrcE7Lqbd/STOJNZRp70/WkiuOskgysrvq
 CyXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIWxt7cg9jxStF1m6ChpPiMOa181y09MQPCypwTgYwxJZXwfFudWiSvhzLXDjId3aZJ9o+6KIDpW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXhp5xTy7lR5SG0qw4zL5n7onSYMaJa+7VoA604WcK1OuI43s0
 p7iEJfPOaZLkXcianSktznoPliJurF+KNiksDIdaevuXr4+1CJlyKGb7HYroG05EwDPvu217ci2
 EJEKzWszDEZa+bf8r3akn0BKfc3XU9S9yXtAXUWfqmtA4hobdopQCNr4jSIKgiPpLrt0=
X-Gm-Gg: ASbGncufAq2b2Jqmuj8T+PZsdfF7AQLMKsPbyJqDLRRaZ+zgaRT2fp3LbnRba8Rq+DW
 EccrO6EgYe4AS3YwEPuWcLDsa2qkkx0WApLXTLtycx68vSxJx8qIcpfPN/E2hzP2M+lZbZrBOqN
 ICQ7yeHh0e3kOT+xF48D0EbGkObFTTRQcitnnSCyVjANOTFrCqDn0RiIGwOvwWQcwibG9iGcvt2
 h4hAMlPHb4SHInoCHtNkRPbYHOJwU6aGJtewqxeyAWD/mADT29kXjVNIlp/eU67UsvZuFpxNdrK
 OlI2CUX4dWy/g1Sf6u9WOkPi3VYgNhh57sh1zxj+rFMn+nuuMT08j7hjpoRjKvU14txBID3nHQz
 otGM=
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id
 d75a77b69052e-476c815ef7bmr17237821cf.28.1741932686422; 
 Thu, 13 Mar 2025 23:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHNONjkAR8RZmnBgw7/nNpbDzwNbQgBnWMqJdks15ZpyrrMTOeZPgm8VR3KSNnTn4CBULsAw==
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id
 d75a77b69052e-476c815ef7bmr17237651cf.28.1741932686118; 
 Thu, 13 Mar 2025 23:11:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba88577csm415667e87.205.2025.03.13.23.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:11:24 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:11:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix error pointers in
 dpu_plane_virtual_atomic_check
Message-ID: <5dhbi7a62mebu6trwr3umjnkiia7nnaru533653z67qmmsc2hb@krmvfeuw5xtn>
References: <20250314011004.663804-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314011004.663804-1-chenyuan0y@gmail.com>
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c88f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fWY0QR86pWCIX_IcxasA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: edSbCaexoutyonsTqzQKyIaNDuq4uFbv
X-Proofpoint-ORIG-GUID: edSbCaexoutyonsTqzQKyIaNDuq4uFbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=967
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

On Thu, Mar 13, 2025 at 08:10:04PM -0500, Chenyuan Yang wrote:
> The function dpu_plane_virtual_atomic_check was dereferencing pointers
> returned by drm_atomic_get_plane_state without checking for errors. This
> could lead to undefined behavior if the function returns an error pointer.
> 
> This commit adds checks using IS_ERR to ensure that plane_state is
> valid before dereferencing them.
> 
> Similar to commit da29abe71e16
> ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
