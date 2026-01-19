Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511CED3B429
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 18:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122510E4D5;
	Mon, 19 Jan 2026 17:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVeCHOCE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oq+GxRp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4D210E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:25:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JA7Ugj597652
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1Tag4iWcSMj4uF0TKGFisUcF
 KVhtEbfnFgWjgJokzBM=; b=UVeCHOCEvSbdHdxeBZbp7H+kr/FcTor2oWsBDwRL
 XWgSyuk1cieYNq6S4BylnZOTVC6Z4pE2YmC1+ovoSp4C/6EYw3RpecPN4jizz+rv
 2hJlYoJD4mokZpUe1W8SjnTWiK7Yj0VLsJ/KyrEy9wjaGEr0VrWQj3XdVfvlnKjA
 9RCGhWLs1FPma2BK9dsMEmld2E4QSWqTg8ILd/vtY3hoqhtUVTXZJ1EG1zBFiOtY
 yFHgm3YFewI6NJQVAqIKmYU7ETo7VYq1knY1V48rjf8YIEZ3lFyhpuLe3pakPcbz
 DsgMRSsWJK4HSYyyM246koVWLjKTIolgfsA2F1LpVLrqSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7h8dy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:25:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6a289856eso894790185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768843554; x=1769448354;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1Tag4iWcSMj4uF0TKGFisUcFKVhtEbfnFgWjgJokzBM=;
 b=Oq+GxRp73nfyYDdntbgRk00XaRkvWOID8yDPkZJraJl+ytPiQuXw6odNLqdBDMgmfn
 7XAAihDxzggiVRVGsTusbrmZmxFgmy+QmXAIx2Rlcl/uC3c7y4UHaZ3KAkTpUvV3XFkE
 pLxfAkibNzZyG+vw3ZQIrSy/ncvmDtxCGG7x2bK16Qg7gjeqddV7L5a0Q/ZJRq+eXMxu
 cBW6SNdDKycp3AhLHLJXKRXJ4DKocGdj+UMxdinL7vxnf6E94qx/pi+EoRAj9odqZQN7
 pi1ftCNYaTv0dgCeVRuAbAZIyxyC0HLj8mKZQB4KS1WkuVtGKejx26m6OKUZyoKS8MFr
 pIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768843554; x=1769448354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Tag4iWcSMj4uF0TKGFisUcFKVhtEbfnFgWjgJokzBM=;
 b=umI9HqCkVcq03Nkp8NoE+K2Fb2O7zQ4FXadP6jWxZNfXqMu5v2SB9ypg3+CNFpvByB
 9OZabqEmR50f+8t04DUazd3LT4+it1L3FA04ZM7ShgDR/u9tj/1fiGtx5y3mgJ+AVvds
 0TPGx/yWczHrR4iz5Vr29zqlR4DF3Z2/+WOzbuy+NF1R76yp/khcOMF8VHU5TTyRzm0U
 V9yWrYPvFIHTyzZfyYkDD6TJafAx94ckhiEI7QuLcABL/Xp8/Z5qIXWM9vRVYPEjjwdg
 Gukw7egJSIzSCJhDinl0zRzG8Yv3U6sBX5yGmjFd5uf69MsJCKC3pwWZjcDAoOO7QzET
 qJOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU75mZ9i5Y6x8EyE3mkhAjtI7oBmqZ8ee++DY+8ZDGrD/+WJZsH2Vmn0WTI40g6rtDf1wIh7RIaeXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp1Vq2xWvKw7v94H2moEN06/sVlecpxTprhe6Rmd5tpnv+PcOI
 R7BnyDmAM0pyfja3wyn3iO0fTZ7mhSkPPRWChyrXWDRWgYzw7DdTGYmKOmxpMOtNUCEATA9ZwDe
 m9wgG6W7BRfz5zc//myXePx/BpwUNDsdnL8h/zDX84rBlBk+MEXzOdHJxHsroCvTTsWeBFLA=
X-Gm-Gg: AY/fxX5p9H0Jb/zAkf1fx1RlPXwJj0/MtbqY2FyUx3uQ9yV4WwJdPbbqZ1waa9bNCtR
 MLsmIYz62ABnfosWU7rCGDV1vn+475pZ6vV8PaUeogeEQvK98OZXYCY2iMvhgasLkVIFvNNNNp8
 g1xNx/+Po45dSCHeY1uvN7TVysk9xxhC54algTkdQUBMzgJgQ/xaLrGg/2IiNE3IuWhGKnr3DYh
 YF6tNKzAhIYsiGyE+86+DhbrnBkfWfDzSlwe49p6/UmyzRaLwCdk0ryUwNACbq8op/SU8Oml4qk
 Vz0JuVc0Ui5oXDsIVYGzLbkT4fcNVD4614Jxk0e7MdpmaX4CsWvToRnprdICbcFs/B/Jb0mRvbR
 WS+RclHLV+420RxyPyPK3cuQZ9koKGpGlxDaqjUCJjA6cJ2D/S7e/xsV42KZwYxYuvuEvwDV/I3
 MNdXO6iTdaziyq8YCUOK3dWPw=
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id
 af79cd13be357-8c5919e2319mr2044805185a.26.1768843554041; 
 Mon, 19 Jan 2026 09:25:54 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b2:62ae:acba with SMTP id
 af79cd13be357-8c5919e2319mr2044801285a.26.1768843553468; 
 Mon, 19 Jan 2026 09:25:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384d3da7fsm34583141fa.2.2026.01.19.09.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 09:25:52 -0800 (PST)
Date: Mon, 19 Jan 2026 19:25:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 02/15] drm/atomic: Add new atomic_create_state
 callback to drm_private_obj
Message-ID: <qws4kdtz5hnymhb23l4wosq5iknbq2uclnfjhooh33vjnlxene@2gsvw7ttnu63>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-2-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-2-b931abe3a5e3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX5qTM2KOX4UJr
 7NX3OOyev2rVtbh6QkIlSqCCMpFrcH7ALtLavDqGib/M+SfzfRQE8nxMB1FQhWzO/rjOzJwlz1K
 VYFoxl/L2C8vMccTuOX/6DoHvljIGltX7ylSGd/q0Tm+uXQSdAYpp1Y6Vhf47+1eWT2u9ycoDiR
 b/cmXmHQQHMEYIttcTgpauULyK+lJnq/QLU1uDi+LdGskRzoSs/V/cd96sD6qYPc+eURGFS1dql
 T8m0/DcejDQRstomw6t4lBmka9QTWNukpj1k3+B1eh2ZzHoYtbc9kMEOJHfk0dEAQ+NI/XJcfGR
 GV8dY9uTkpDh+AQfOBloc9S9TeoZdhCrOKKMvYsIuYIpp5pQ2Pui47P3UNRY4y2s2QBO23XesE+
 iHjC0xLixe4taLI0U7F9tuGZnVJB0Mztu6FVVXyOr8E4z4kHY4iiiei0uH5jpvZEn4ZEP1mlrwa
 r8yAW9D5XioewiuujpA==
X-Proofpoint-ORIG-GUID: B-vQkVHzC9EMJBRgSGQ6oeP-B2tCklGT
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e6922 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vnwCyPpFTL31y_W89ggA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: B-vQkVHzC9EMJBRgSGQ6oeP-B2tCklGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
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

On Mon, Jan 19, 2026 at 01:49:58PM +0100, Maxime Ripard wrote:
> The drm_private_obj initialization was inconsistent with the rest of the
> KMS objects. Indeed, it required to pass a preallocated state in
> drm_private_obj_init(), while all the others objects would have a reset
> callback that would be called later on to create the state.
> 
> However, reset really is meant to reset the hardware and software state.
> That it creates an initial state is a side-effect that has been used in
> all objects but drm_private_obj. This is made more complex since some
> drm_private_obj, the DisplayPort ones in particular, need to be
> persistent across and suspend/resume cycle, and such a cycle would call
> drm_mode_config_reset().
> 
> Thus, we need to add a new callback to allocate a pristine state for a
> given private object.
> 
> This discussion has also came up during the atomic state readout
> discussion, so it might be introduced into the other objects later on.
> 
> Until all drivers are converted to that new allocation pattern, we will
> only call it if the passed state is NULL. This will be removed
> eventually.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 18 ++++++++++++++++--
>  include/drm/drm_atomic.h     | 13 +++++++++++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
