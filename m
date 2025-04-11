Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD7A85895
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 11:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779BC10EB4B;
	Fri, 11 Apr 2025 09:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wy2CUYdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8FD10EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B556aT000726
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=l6UL+0Wn7aO1X0HRtw4EPKkl
 ISshVQkpFC8ihWRKdgQ=; b=Wy2CUYdmChXXIyow9bMe9xGBz6PUxdiQ2mHm0BmH
 Ll5FMuM+Zot50Xp11PXy1R8eeZyHbc+zjy+svKuFGTnPD+nzs9eeQxYcC9jeeV9R
 ZSyUUe54eImsBo7r7OtcC/UHYOfc5os6YLDklUasz5MPs0J6Ur8kbGABTr/Us8R+
 QiMyIMrhcp3zQ/HCUp3mNXj9fz2SLzH6+MLw95MGZmW6J1lSpnig/Xci2JDCMh9M
 YqCeXgzEHD2mYmh8jTkqqlN8GJW12IntZb5qj6bL2ulrFLlMHy2XgtqZHbxe73nC
 T3FrCZwz5kTnGUHfCtWBY+FUP5UbRrbu/MIN6mAGN8onIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd31y9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ff78dd28ecso2154249a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 02:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744365514; x=1744970314;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6UL+0Wn7aO1X0HRtw4EPKklISshVQkpFC8ihWRKdgQ=;
 b=RSutwOdP3wuz2QoOaB95EbAKMojAVbx2jODVhZbLuoxKg0BsLP6PoIb9+G+Zyd2O1G
 4DsW/bgW+sw+VjbmWJero0IsJoO4JGz2fHoCBE6zgwkAKu87XoX1DDacZy7TilD1uMx6
 FfJx47Iwl0xcYud8GbRLJ/xh/EHuL3hZ7FwFtU9SqlMVEVkxhw/S5JQaRyKZJHkfTH4a
 XRT4goWYIn3X59KsgS/N7UTkmuD9BbezfjUqUS39BgJdl03O8Pw9J4JGo9qB7rAU4qDC
 A7juFk6nplMhd22PKhhiC3XRMQB38vTkxE5RfzrsSomnjDoWzMMhjoayaK939Dc7Q3wA
 HBVA==
X-Gm-Message-State: AOJu0Yy7Mk3wK0wkrkVlQBl1DRbRPvAsjo77ez5q27MYLT6/JbjES1zK
 50oQsskoqn2pm55hFBK+Mfjg7qKSbQoyR55/ixV6OWQJWnMaX7Q6JlLqIMuI9BoSv0+t8zFAPr6
 oAggPcE0qLoTpxDH0FIufgpRgH6zgNDR3JC3w+ZM1UppgxnCKE9sFtWEetiSvMlccDyKcGFhDMC
 py9vhqBywch7M9FcvdrhFvvnNqB/ExbMUmQDNA8TLT/g==
X-Gm-Gg: ASbGncuUVcEzqGmdGBt6NO0HyWc3OKTdRpSWdUJ2C23jmphYSZDWAl7BdBUGWa1rYWs
 Y2U0ttNcXWFkxSMWNTvfWkV2ghN7T2sMLML0jjAIeZHnhZJwwvX3gLWhlBoMhUP0wvh67
X-Received: by 2002:a17:90b:520a:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-30823784559mr3506439a91.30.1744365513671; 
 Fri, 11 Apr 2025 02:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6sJSVzfqjm6LHCdN+XCA922f5sJBxUz7MfgfUbTg612+3CbLuyLzFE8TzIIa/iJZJwYcC7RAiXF9ZM3HIXkQ=
X-Received: by 2002:a17:90b:520a:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-30823784559mr3506413a91.30.1744365513284; Fri, 11 Apr 2025
 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <20250409061543.311184-2-vignesh.raman@collabora.com>
 <hs7tgbl6f6a5ksuijoxhbmkxtjwr4phedzhlsjycf6kw3fa3wg@27ep6rsq7ok5>
 <6adbfd63-46ff-4120-b315-1669216d0516@collabora.com>
In-Reply-To: <6adbfd63-46ff-4120-b315-1669216d0516@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:58:22 +0300
X-Gm-Features: ATxdqUFB7OAThTSXIV_KL9pBaqatyH2xYwq2f5QLgdtEPY83ZXJy2HTSd4EU7cc
Message-ID: <CAO9ioeV+RVmqPcAy0BofrZcVknEfKFg+uqhdV2hH97tPsch4wQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 daniel@fooishbar.org, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: yaleltoxsmCEZZdfAyRniiTNVT-Oc0zz
X-Proofpoint-GUID: yaleltoxsmCEZZdfAyRniiTNVT-Oc0zz
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f8e7ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=QX4gbG5DAAAA:8 a=VoHzyVz3eI8A9jJUxmkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=640 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110062
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

On Fri, 11 Apr 2025 at 11:32, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Hi Dmitry,
>
> On 11/04/25 01:02, Dmitry Baryshkov wrote:
> > On Wed, Apr 09, 2025 at 11:45:38AM +0530, Vignesh Raman wrote:
> >> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> >> exit with a non-zero error code while configuring them as warning in
> >> the GitLab CI pipeline.
> >>
> >> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> >> ---
> >>
> >> v2:
> >>    - Use LLVM to build.
> >
> > Why?
>
> We are using LLVM/Clang instead of GCC to avoid architecture-specific
> toolchain for cross compiling. This is done to make the script generic
> and run only kunit tests. I will update this section.

Ack




-- 
With best wishes
Dmitry
