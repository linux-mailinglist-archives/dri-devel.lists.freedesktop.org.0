Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF40FB40203
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7FF10E6D2;
	Tue,  2 Sep 2025 13:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhtvZUl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3168B10E6D2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:08:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AVaTU029702
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZRBz/oAjYHCmAPLhcM96ZMKm
 XNv8xdKx2jiSw2CIuZY=; b=KhtvZUl/O1KFOCANCrVw/lAiOarr0SiI+FzKLrM0
 1v//RhuubW7T1ZqJVGKUpowaGWqi67oNlCy0/nQBbIHioAbOP3vzciu/EGKTCUTS
 esdqLKp4zMmQADuav+HwFl7mFhxzFtjZ3nUC1MKFZeE8f0hb3IbfCKbofS/ExPOf
 JM9zWTacYsWZtvTX5gl1zuFDWFcxwofYGxaEk8kSaSPIbG6nlKB4yWYQTOJ/jRVi
 MF8lVvNnqm4hj+hQbZ7tDAFuiQujSaST/LNhaIxuu47QppE7AyUbkX8hGDkWpUNO
 qegp8HAwRL9CszdrRT6wPu2GaQf5+a00mAy9Vr+U2mhkrg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qu1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:08:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5228ed1eff1so879685137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756818484; x=1757423284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRBz/oAjYHCmAPLhcM96ZMKmXNv8xdKx2jiSw2CIuZY=;
 b=R0ILZ5ClrHqDixk1yJQuZ8yQPvNSAB6bWcGtCVo8x/7atEzg72ODLXM9B+jONfbwHh
 BPZf8WAe9cg2D9mOQ4NvLByFl1ndaUKJl1AweyEekeJonJzlqEheIQvBczoMeBB8/wcf
 Ex3dm4Rh1oM4SEJyEN+lp3ggD3J7wqskTgQDIvpLHu5HXWiDhaR7CMBXsRhwpNg7zsld
 xjgbdoSR25L4ZTLSsoVD+wbGy/l/CP0wzjp1YSANBouTtIiYCZWAjvNeY4V0SykBbzHc
 YctjsFmlJ+ht4vD1R2SOjgrXNBPqn00Y7GDH9fQ8ozaegREQ1ayXCyOAmJwpJmk5juUT
 5kMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDnwk0YgMwxK1obfIqcDPCftXVqqG5J4wFrhNHJOHmo+Uep3ssMgfcgn3p5jJQ7EshKvL5MP40bqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxktDWBxRb9TD7WrTTgPsqmMZ/nwc6hFRt03NWAM3607r/6HW6a
 Q3x9PzEK0EfjYAFfNpdG9ZG2ZCnAtF6zej05WBNzA0kloOLewhS/Jq18LuhtAQGpFgKHle42qQG
 mV+Rm7+oj1E2V27valR3EmWgFqzIMfuubeQH04GoLmSKMsRjrKG2xzw5Wg4+BwAUosar+JA4=
X-Gm-Gg: ASbGnctncE22/p4/JBRM4sJjZ+WEyMWLTtSZ64PxZJlBeCZ1/qwM87RLUAPZH4sxSym
 0VE0Y5ZLdVbJfHWCVkmCinsM+A/TNqidNsfO/mQ9/LlIMdyCGs1XTQyKcDkuwnLJxIitFppz6/S
 KiBpuPBqm3oIVDVfrw2Clgb8zmVG/DaqbDVV5N/HGEuu5aH5x/iMhuFmgPV2ahyKiJ1JhVvtN8q
 0lA/wrAsghD+i8bOk9kWINa2ONW06ezkofpU04udb5WDmMHQktDu8ThJIij0+hne0GiMnsG9b4Z
 es9tP9AbmIioWlaVFSvbc1Q1mx/AGdfGCskGB2Cvec3D2gWjguHszxyJK8S1GtnvYpdQm1L8htH
 M5Ymdj9c0Xin7dH0XiJVXDFmyiXu1eZ7zeqQUfz625VTW+7Dm5KXF
X-Received: by 2002:a05:6102:598e:b0:4e6:edce:4b55 with SMTP id
 ada2fe7eead31-52b19331f18mr3207810137.4.1756818484021; 
 Tue, 02 Sep 2025 06:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfFPCk8GdIE7i+CCCalYQF2D81dUnjKxyLpYG3Vz27PBrW2KoAobdHzmTstT1U5wxNEj6rBw==
X-Received: by 2002:a05:6102:598e:b0:4e6:edce:4b55 with SMTP id
 ada2fe7eead31-52b19331f18mr3207741137.4.1756818483229; 
 Tue, 02 Sep 2025 06:08:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560826d663bsm687768e87.38.2025.09.02.06.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:08:02 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:08:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 01/37] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
Message-ID: <2ox2bf3u6totjn7bwfwsxj2v3tqjvr7ptzbejl7iiao52dyre5@f7kdk6ls2szp>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-1-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-no-more-existing-state-v2-1-de98fc5f6d66@kernel.org>
X-Proofpoint-ORIG-GUID: 4XNHx9gMokoktyAjtifVR9Gyfti275aM
X-Proofpoint-GUID: 4XNHx9gMokoktyAjtifVR9Gyfti275aM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXy5mta7q/DHxl
 JzH6uatFOxat8RCcYDkzzrTEd4gR/XeUsixUIxnBZiQI090sTlvlpSQOYQT8Q7i2kvlyJGBBVg3
 jAZZBD+0ZFa3ar6eJJuXYCCMVe5rZj6IoqHQIexgAwMaeqZj0f+om0baiCrAe1p3txk1e8UTvJC
 /e6TS8iZAcYPr99Ded1kKHZjfbDRVe42WzSa4zzCZkLnKBPfC3lZumx5YGwsxL3hbWVxNwmU8aj
 +rSz8zLG5pqaWRgVVT0w5htHG2QlbQ3EvOukFlaLuUIU8qFby4/5tHToJDMSvoi+4OBe3n+Cyl8
 2/uL25kzlDTvi/Vuyi0JRZJ2DoLv7jaa0DVpyuGsJlbVKDkA7/UyG+LCRv3UOnCQzAa1edwc6t2
 QaRZkxME
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6ec35 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ql4iupRt5yY0ms4iALUA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On Tue, Sep 02, 2025 at 11:35:00AM +0200, Maxime Ripard wrote:
> The drm_atomic_get_connector_state() function calls a hand-rolled
> implementation of the deprecated
> drm_atomic_get_existing_connector_state() helper to get find if a
> connector state had already been allocated and was part of the given
> drm_atomic_state.
> 
> At the point in time where drm_atomic_get_connector_state() can be
> called (ie, during atomic_check), the existing state is the new state
> and drm_atomic_get_existing_connector_state() can thus be replaced by
> drm_atomic_get_new_connector_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
