Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A96BC5D8A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C705010E126;
	Wed,  8 Oct 2025 15:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZFTjJoL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E615210E126
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:48:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Vu6028956
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 15:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HI/OJD1yi//2Fa9XolZ8qb/T
 bZGD8v9O1L+qFzAnKhU=; b=SZFTjJoLWmDPeHLRy/4PZbJ36YIwaZNKdtDX5Koo
 iV0Tajhl3p5fJW0jFA0vntcNn8X9DY41QhaJY5jtiYZ9xasd1kXX8L7UONgXj429
 jAvSCvrgg3L9oJgEmXYAfF0TqB83cM+YO2oz9QshIj5BQJCVkGM/Jw91TX7gcpPQ
 VmaKVEw+yqT9PESCpzRzGvmJ0sfaOgysenBLAzlww/RbvbEWXqtXV3RYHiWkxIqa
 BNYJI7UQ1s0TkNkBKvRKyk+De5CerUgZGuUAec/4mtXqklr6hsnibvNUXPUGhqMx
 OkY11zC9ay1oGjTbEzSfR8ti3DUAN5LMRkGHE39WAI7s2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgu58q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 15:48:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d602229d20so152447131cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 08:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759938519; x=1760543319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HI/OJD1yi//2Fa9XolZ8qb/TbZGD8v9O1L+qFzAnKhU=;
 b=dm0EniHb2QsGOWRkfD9FPpfG5sVqg4ZccQDdR004xoplXNL79toMJpFSNDA+Be5/Js
 fL6QZii2pKDkJ6dUvgFGiRZxEX0Y8yf0zlNAOZiNq7konNmh382omYLwVNqzYHLnNjOC
 gwHlN8YuP2wKaWs6PtjR46s+YqDDUH2rxWcf3l1P6J8OIPkT2dk7ykObryMFlnCsdlXr
 n0j6JyGWDN9BHcV6VNnn7dXa50nyRDSQoNOGxPkxYKiUKngYQGX5MLrNGangOUIFT5ie
 xeBp1Lgj+AnkiPqbFDj0iBSBF5XQcfuGQ+RvBQ0YL9c0b3TtMkhS7yGUDMaZrf2Oe/x6
 eLUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCGXnjBSwLrFM7ldaefowaSOHdf9L408T8vgV2tTLCnfFQ+b4XoUAmvWd6K9krauwCXoIEvw5ytCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUviU2BDqAVCV5aMEXfrPT1AY0HZ9SK+S2g/m/5Z2KTfczi49g
 Jfj6ViPsEG56S2YjAnto3XbZankBExMPDaNrMtc0eEdKtSpTMmHlVd4eYGurmxTTNdeW7takiYJ
 6WZt5NqjctSfQMJ3QWOlyUi0YFzAUN90vOhE1aHNhUl6CDVJin7KEWrACbsngqyBB83bokjY=
X-Gm-Gg: ASbGnctUYpAwijqzBHt3YTM15N6qPwd7oeoYpeJbFLjSIlEfEu9/3Sr3APnbXwTisR/
 1G3a7qLstOxHjkxU1tQw+IgQOLanVdB4xho/FkBlJnuItYtjS5WIXWoY/o80DBeOQZKpZhEV7Ym
 vG5KXlABMy7KfM/VMXuPzIGfF8Rry+EfMf9la8BSR0Od4d/ryt/XzQZvRrd+8O0hRin8fQQW3ng
 nvp9mQ+cjKaTV5KAXYXNs00K8zlN8WSDjx+/XbJzSFctP7CjWaxRXh5wP5RcLf615qN/29hRBh/
 94UIc9BL27zhDm59i3ZycvpZZ8sLeIhsy/2/F5GjNDBVbE3PQdUWFo+SSmkRXbE0RkZsPWuS3jw
 fy+64pQB1Zk0vEk5ci6XPXMlxHmXaK7lLrm2vN8qy7NMSw9VR0l9o4R0t8w==
X-Received: by 2002:a05:622a:1a94:b0:4d8:372b:e16a with SMTP id
 d75a77b69052e-4e6eacc5dd8mr59261421cf.4.1759938519064; 
 Wed, 08 Oct 2025 08:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2DR4QcqETIBWEEKpZkSVFFlBjkXNqM3R4e/ore/pbAPFtskJ2Bze2z8NPqplUUTrk2WAEw==
X-Received: by 2002:a05:622a:1a94:b0:4d8:372b:e16a with SMTP id
 d75a77b69052e-4e6eacc5dd8mr59261021cf.4.1759938518567; 
 Wed, 08 Oct 2025 08:48:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ad9e0e6sm102466e87.60.2025.10.08.08.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 08:48:37 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:48:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/16] drm/atomic: Add dev pointer to drm_private_obj
Message-ID: <rcbkt2ywxnmstnvgzdcap2jpg4ca7qe57bqtsfmn6wxaur7fll@nubrlg3upgc3>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-1-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-1-805ab43ae65a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXyTrQvN4i4ab1
 b63NEikzeg9jpSOnx++soSRlT3JAmql6TnkjFbEcQM1Zysoe+NZ4DEHDrUjHAPCbw0CFS64hxT/
 EuClUYNHQyiaqLsEFLRwX7Ncy5Iww2ilkBw/kB4YsbjD2CX0pJQr9WmrDheACNWIXSdKwX1x7De
 a5H3l5OBDu9MlfgIwB63K33u955D/9vhjsG3tsfuT3RpHLt/iktBTqnLqsZGlQutsf2sdo0xH4+
 YWKDPpOZkiKBKnrP+rFszkYP75qWFX9KSSlxbegDQzm4kdtx63y70pj8Q3T4sVRUw2duI9nQw8s
 4gfw7/+J7JkzbIs7dvKTXp/kyCuHvZ7mHdcsYKmhl8MSqEQsQNaAmBKrHJauB/ph2UKJutaQqgc
 gsAoQ0AEfnOIjW4ssZJeccmpp6+eCQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e687d7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X71it487EcNKyYSIUmAA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HKkfT22-o9O_jFPu5G3FUyPdWzT5f4OP
X-Proofpoint-ORIG-GUID: HKkfT22-o9O_jFPu5G3FUyPdWzT5f4OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

On Wed, Oct 08, 2025 at 02:03:59PM +0200, Maxime Ripard wrote:
> All the objects that need to implement some callbacks in KMS have a
> pointer in there structure to the main drm_device.
> 
> However, it's not the case for drm_private_objs, which makes it harder
> than it needs to be to implement some of its callbacks. Let's add that
> pointer.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 1 +
>  include/drm/drm_atomic.h     | 5 +++++
>  2 files changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
