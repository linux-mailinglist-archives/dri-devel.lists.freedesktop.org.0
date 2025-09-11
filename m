Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925FB53461
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9E210EB38;
	Thu, 11 Sep 2025 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqjrwJcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643510EB38
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:51:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBQh19016125
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=d5oPByJJHNuH8KoSHkfw+ojN
 BfV4fLGKoWjo9RAn7So=; b=EqjrwJcS5dtzNi9NMxuIu7PIZOft9/yR4KCC9vrB
 XurpxfWW+mvaPVOYZ+MNKaAG+m/prg3g5cwPpz8DQwdUNBY9I84oLqT3wOBZceTU
 tDdvWyuKD4EiRMB9KxkEBDxvm8N+jIvgoju6EXv8pLvmYXmHeORjUCGZ2wuigeaC
 O/vI+MjHd3mpnd700ovMgk62KSU3sISmD8Tc9IYNERJp34cwSNTZvN9bcHfspS7G
 bhIXIK8Ucsjf3JJm5JiVw4TTLR04t8FIAdmOyXs9TOD1gorfkuQUOM0Ngz5HjIy5
 wwiZxBOzXq3HnkSCIDpEIC57WgTNpSt9qsQZ9mEErCanYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t384ab8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:51:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so16705261cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757598663; x=1758203463;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5oPByJJHNuH8KoSHkfw+ojNBfV4fLGKoWjo9RAn7So=;
 b=AUcc4/BAPg1kpLu6iVF384u4hw82o421lPvXhe1+/I0Ej1yXl4C4RYrMPTLpC9t+s4
 jFQpjwnVrkUbZcQwyIAmGo5SZeNiJv+udbica/qTxKf0/AMJDr+ztAa+PQLbh0RsWOxo
 g2VuhzSUhCilw/jPK1uXM6Hk7nCg21iq1Zkx/a2j9H6eKIQOReHRlzcA6Der69L0NavT
 IhURDVR5QcliDIZ73xLYqfkJh/TD6f2UhGDri0tinfw61qr0tkahP5cCNHyCqdmVMnFp
 BLkGpW2Q2vJ04nZuot6+7ameqBb0Ou+UjPUILhnILPIhljZK6StXhnGODgAg8neRSZAp
 1B8w==
X-Gm-Message-State: AOJu0Yxqb73yYPHbnNQ533Kkg4CzkgcIzEFdYGd8GN7D49H9/nAZxbH3
 WL8dGnk021pU5xp9APSH0Oki6o5ZqCRToNHXREsjjcVnFAbr691lmmZc9Yi0z4po1LVnJFp2Xdi
 3qR2SFZvEFKa4vNW+RoIXpn0Iqpy13PEyDriR5noJvbwIcU4fB0HHvXv3oWIFrzSj1EDdayk=
X-Gm-Gg: ASbGncs+O4tL4bEES3mQl+qNuGAIJX+rG33QN7shYSEAr1QB33223xbvXmqpjlM8GpJ
 lo4ZdNwZFHsf3DwTPYL9u20fskJPKy2uPdoYMhHWjNpLUDHbMA5wlVbM2sQK0Ga20sct4O3A4kl
 q6MOyjtqON695jpP1E6vGAvQECo88JCFq+6ZkWLZ3HC740Rr5WZucR/mNYCECRAdBLjLmHvLhE1
 7/HMn2xjHZ05MpygocofpDoU1ZyVoOlS5peBsWB48fYmI1WkEJwYgoXt75LJ6ECBobx9nWy/45U
 4+xQrs6MWjnWb/NQGOLjxP4COXMLmSINdshTkBPD3R91QAsCn6iPDBmGX7QwRgUMxRaWfiwXmVm
 tfwoK94Vto5xsn7eefmzmNTcYFqkRPXHmcjSF+dNMfFxySSqgXeVV
X-Received: by 2002:a05:622a:4d2:b0:4b3:f0e1:be96 with SMTP id
 d75a77b69052e-4b5f83b0f07mr202264971cf.25.1757598662434; 
 Thu, 11 Sep 2025 06:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC6fOr3P1Mh7M0LS1DwAaQ1PnLL7iyF2lgwoAT8YjBKLMkeka9GqcABW+DPD1Nu+gTxj9+3g==
X-Received: by 2002:a05:622a:4d2:b0:4b3:f0e1:be96 with SMTP id
 d75a77b69052e-4b5f83b0f07mr202264621cf.25.1757598661998; 
 Thu, 11 Sep 2025 06:51:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a33771sm427831e87.133.2025.09.11.06.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:51:01 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:50:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com, mripard@kernel.org,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
Message-ID: <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911130739.4936-4-marius.vlad@collabora.com>
X-Proofpoint-ORIG-GUID: CTXiB2OYN-cjMpVsPDLlkQ4YgIAvRHEg
X-Proofpoint-GUID: CTXiB2OYN-cjMpVsPDLlkQ4YgIAvRHEg
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c2d3c8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=yDUiu3_GAAAA:8 a=QX4gbG5DAAAA:8 a=bDwM_fcg3tGIVG_HqXcA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=gafEeHOdjwYkg5oUpzAY:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9TK40CcKPPP5
 IwhXURytyE1gaaqq8K5U9gQ6QINSHPeVEq8Lh14uF6AgmR7JN7+HVw/9BeVU9WkZBMGObsf5C/C
 fopH29W3aUNh1n0cBTs9ysJZLjXRpRV09f7DX+YKjle/HZEn9CG6hyA0K36qE5vcSJSnGRtaUNy
 8k3svX0a4u+rTK4dZme8uEorh2j/0MjpCv+htsQRSX1KubbWirx88CngR6bCCnt4ZNU9IkDVZ2s
 E+LvvcvCSnPmr6+rTPVSDBRRfYbTPPDJkprHjPIFIV/IpVp83LqSrFaXiS2y+L30JPnXZ4G7OHr
 ng8MMeudLUuwjcIH6KDKWzDJGAcqFoFFbiCYftY9vO/bkRLOiATB4WWiXWMKPs4GcnzD44wQG/7
 asYlv/T1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

On Thu, Sep 11, 2025 at 04:07:34PM +0300, Marius Vlad wrote:
> From: Andri Yngvason <andri@yngvason.is>
> 
> Adds a new general DRM property named "color format" which can be used by
> userspace to force the display driver output a particular color format.
> 
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
> 
> Drivers should advertise from this list the formats which they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.

It's unclear, who should be combining this data: should it be the kernel
or the userspace.

From my POV deferring this to the userspace doesn't make sense: there
will be different quirks for monitors / panels, e.g. the EDID wrongly
advertising YUV or not advertising a knowlingly-working capability.

I think that the property should reflect the kernel view on the possible
formats, which should be updated during get_modes() (or every time EDID
is being read).

And that's not to mention that there are enough use-cases where the
connector doesn't have EDID at all.

> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c   |   4 +
>  drivers/gpu/drm/drm_connector.c     | 177 ++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         |  54 ++++++++-
>  4 files changed, 235 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
