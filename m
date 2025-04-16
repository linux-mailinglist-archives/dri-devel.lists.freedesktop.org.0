Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C53A90F37
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1085C10E9E6;
	Wed, 16 Apr 2025 23:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMfnBcr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA0210E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GM0uTG021789
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=10e9Gm2RPGDf+oQLDehdobGU
 Daa+U5XpyPoSez3rMCg=; b=aMfnBcr5HCNeSj3J1sOS2UQQrEYYtqAMgtbc13hx
 jrEzDtXXg3gWz6c/NrKgCvfKPZC2j40txojwvXbjEsizncb4L6qY7gHYOdZljgfm
 SDw/HUs5kAQzeCZNC0oL8XFZxP8y3Y2iw0HGEYU7EFtcAmQvW6NPsjiIAos6Q9eO
 fOS8ohEQ2RuImLrQiioMaGRH2satLxtF6m2T3A1aiE6aOiAfx17EnuKzOiZ0QPqh
 Q+ygy9ShgjRD6CMklNGkOG02z3NTVTLxKLg8hsSvIEbtSMdVq0RssXiYgLWsJA47
 hTnkCKFIcnkZw+N1zW4hPf0/+9Tkv1duW6l+RAx3s/Slng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69w0vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:11:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f6443ed5so21121436d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845117; x=1745449917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10e9Gm2RPGDf+oQLDehdobGUDaa+U5XpyPoSez3rMCg=;
 b=Iihg3f3UNoQDCst+7zubb3jeM2oHbQ8hJ5FD3JZ2DA8dRhdM3sXDFHuPStTVWsbrrQ
 u32cTnAb6QULlNPz6PK40eb7WHYGzFcT8zS5RAJgVMlcoiUXkuigQ/icQ6j7Jfv4fq1I
 AVxUCpUGHPAcDiCYrmxbg62Kte+2O6BIKwoiq6iab6yXEp1PDF6yoXzHsXKAxRYrkPGG
 R1k7nCDgZyVYJeJbYxomuQj9Zg/D/j3SuI2sU1bhy3p6QU+mUJaNXOAJbmcT2aiEks6B
 4OlKJjwWDyMVyAjYYs36rv44gjeV+Kdcyubk5RZ+8NwUsR0gBY4FcWH9xLIYHK81hSPc
 TAnA==
X-Gm-Message-State: AOJu0Yxp0OO4/T19zCV77L766y6v7UPEhkTVEvvJnr/2EX3RdaGGrFH3
 NAU19entvclOe5iJLiZupJDek2G1D2tHS2uSrI23ETzJIxoi5EmWUgRRpU2pblViIEHprVPs8gf
 FjCV/Wrqvb4Ht+HLzJEU5aKjz9j+aBK3De6YnpgddmzwFreDb4Z6UyWTzvTS8M1YitSU=
X-Gm-Gg: ASbGnct87GhP/am/mtDXl9pOKe9Nzf9ZIt6h3WORwIcssEeSZgBNu51bHM4NWgcDIL4
 UgPMgG2bDp1YZCDVgp6ZjmMb0VRWE50BBq35DtAypmmVipO1ZeuBIX6V+WtZhVLGaQzeC33rQIZ
 8Zw4Oirzc+HdcjBACd6kRIoULAY64LYo8xR9ejcCVdvrKKAsXOWLstvaGXJXMB2ENhoizYPvZZy
 3/7X+5vjCLKnhoQf8edpbmzZDc07i1ZgpBMHaaUtWtYUUONuBsW+/DsS4WCKG6OJbz150dyLk3I
 KuM4byMeIKDHRHNyWa9JqDPr7uEhH45Zin1M0JeLueqm9itJfaGfGUiWTQzkI4R/7Gv5B07+CIM
 =
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6f2ba665fecmr13701456d6.8.1744845117441; 
 Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgAiezriok5YJFlEPY56geiSrXUHE9y3nHh405AYuoPCKrzUZwk1oQwHN9lCS5j+H7KnD9zQ==
X-Received: by 2002:a05:6214:226f:b0:6e6:9b86:85d0 with SMTP id
 6a1803df08f44-6f2ba665fecmr13701116d6.8.1744845117120; 
 Wed, 16 Apr 2025 16:11:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464e9f2dsm25270101fa.53.2025.04.16.16.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:11:56 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:11:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 05/34] drm/msm: Rename msm_file_private -> msm_context
Message-ID: <lb4to65g2xr3ryzhhabrejau3h6b7impchrlcfpv7bogme33r4@5b5gdqldk5h2>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-6-robdclark@gmail.com>
X-Proofpoint-GUID: fMcZqlj1pspglDW9xWKGtYHzhlFBtiab
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6800393e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=OUvj5yb-mTn8qsDSrQoA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: fMcZqlj1pspglDW9xWKGtYHzhlFBtiab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=838 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

On Wed, Mar 19, 2025 at 07:52:17AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This is a more descriptive name.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
>  drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
>  drivers/gpu/drm/msm/msm_gem.c           |  2 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
>  drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
>  drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
>  9 files changed, 49 insertions(+), 51 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
