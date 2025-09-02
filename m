Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F08B402B9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534210E6E1;
	Tue,  2 Sep 2025 13:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3j//npb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0710E6E2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:22:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BMtK2020623
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kVd4nbno4GjHYV38Sk6YZSLY
 vrJ7Zx2U3cAQl7ukNTA=; b=X3j//npbYb9SV6V9N30xjQOwy4KEsVWjfn6KDVlk
 fSvKUEvYEnmPTB15bhJcq+ZSP25SA7cB/0eu+pXvY+DcXWHUfGTiPNxMtQKX+AS6
 nBr5b3ZbZdVUCDKlIQKKcX1lMO5secnBk7e7Zt9E0Y8fWfDEa+7G0ne8MoYO8qw3
 RYX+nIccMB7yJ1O1YPd2CjWDO3yJxWip3y7UiFeh84dPrN578HCdVjMMi8C23rpM
 BvGcasQSm/rySIRiqF/ASkwxTU1cZrBZLjkNmSuwFT1frAyahzAeQF/Gpek3qm1P
 UwsOUeFartus0CZO7YqbGCDFmzpXgAWuQ67GosA4cFyNhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryyra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:22:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b325446155so50211311cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819356; x=1757424156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVd4nbno4GjHYV38Sk6YZSLYvrJ7Zx2U3cAQl7ukNTA=;
 b=uODN0Hd0PsB245Q2zohj5uME9OY701lMAErQCySiG+5ruC05Jt0wA5XbqH0RBo2ER3
 O0XHUaHpYzAHz5GS+M5QgHdjmfjC6ObUmmRLx0TXbMuj+3RUo2FuygELW0HPK5D8VQdq
 0rwOgvdNyiTYNT517NlmUvSJ846Jv1sxgZkIATpN8jjryanbgBpuL2K7nagBRyikh+9+
 m+CTmnjfMDu3GsFi+VYqZxiTaD1t517Ca6oNTZU3NE1g0HLJk4bNYNVRDN8M6zfZnlTv
 aH9uKtd3VH/b9i1oVV/1n54NEZaNovglWhWSTJ8kf0N0KHooYYCEHItcnCOmGBuMy+61
 /Dxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYAm8XPiQwXupRxAeWjC1TPXXTGRyphGVEHqm82LOCHMyVJB76ppSAmT8YbFMQNa12OCTfJkooi/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywic5B72vDONsJDPpkKlE/KvL8+0LNkSFg1UgaYSnpvCEkiYemW
 hOvbnaeOwUUADZ9BTcmGdKX8z9kTkmOMwWLk7QU91P1PBxLym4DbB26O9o7afmDF7fErcIDChnk
 18J7DSro5ulOuiSPMG2kZmyw8j2Ya6lbmzOYuFggqSgixLuKvLqvyLiuYEiLsJtBmrhdftRw=
X-Gm-Gg: ASbGncvjW/WNks3haPU8iSLEScK4S7ZF+iBShj+qm3/NHYmheJAWVorI1kcTF0nGHdW
 t07YS7Qq0ncIG585HXoz4xzy/ldoMm7deuNCkPZZzq/bc2ypdEwA57H3wkogBMyAhlPMD7iXSgQ
 vJ5aC575qhm9M0KTuAk9wrGFvrHe3cde+whMTgKTXp8SPuJvygVRaAcjW0ou6txigOAjhSFYLNN
 j0DqRIjrF7v8sPT5mk2Maxrk4+LQt89yea5y/q+ThvyYjrgUb1dilySHYo//vaW6m1qZd/FSEFt
 SUIncajyaM+i9+bTTbELCPj2i3ap999ZQKFXiqjUUr0WY/OrWVMKdsXt9sDV6BfBmoKRobrWnIY
 nd/0cNVMQuoYzu74cT9Wo/gN/AQ7zQ5iyAZvI/mRkVkXCEhDJuzdt
X-Received: by 2002:a05:622a:47c5:b0:4b2:f627:6d59 with SMTP id
 d75a77b69052e-4b31dccce6amr118701131cf.43.1756819354214; 
 Tue, 02 Sep 2025 06:22:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Tx4qXB0T7M9Gt4jR4Eu2yI/MCTycX7XhVYb6eo4yqLbXs63KMyCMdJgHT0qPhUkw9SbVkw==
X-Received: by 2002:a05:622a:47c5:b0:4b2:f627:6d59 with SMTP id
 d75a77b69052e-4b31dccce6amr118700591cf.43.1756819353564; 
 Tue, 02 Sep 2025 06:22:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827af03bsm687057e87.138.2025.09.02.06.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:22:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:22:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 33/37] drm/framebuffer: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <hn6nldv6r2xwgsl5i4hcrhihoy22ziucpu2mdnsr5uey23gmh7@prv2phqr5gyq>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-33-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-no-more-existing-state-v2-33-de98fc5f6d66@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX8joSnhqPpdpq
 SBbKGE9QBC8LAM/1fFexoDcAXeJBHyhc9z4tnbqozRvgzIXbN0az9ohWlXL16XDqpyE1Ge4Dx+/
 vJH/agkUUxL8CaRcQ55tPw0LTHPeCpqMWSyEAy09Pk9ejCPOoLtTZJYAYRXSk3PhqW1UEB9w3Ms
 RPVoVnxEg4LA1LhUOVY7E6+d9ZIAmbjWon0rcVBRdJIb1H86i8ASYnnUnOBui+ktuFT4GEeSRhy
 l9g6SYQULxYEk9HsHJKy01JJfcygFYGLlDyBELwhvT2f54pjIonanfvGDjkr1XiHAx++HHQ6gWR
 0Nv4p0Wt1BwQcKmxOAniba9oZXHPtnnvYGsSdcXkjl3fZT7rumY+M2XCuDQEvA9D/XOcPUlXC9V
 hnzMKhpK
X-Proofpoint-GUID: 35R7OeQktxru-nW42Nzd8mjRYP0ozIUS
X-Proofpoint-ORIG-GUID: 35R7OeQktxru-nW42Nzd8mjRYP0ozIUS
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6ef9d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hDJQd5pY8NwZLQ6IRJUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On Tue, Sep 02, 2025 at 11:35:32AM +0200, Maxime Ripard wrote:
> The atomic_remove_fb() function uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> Despite its name, this function builds and commit a new
> drm_atomic_state, and the call to drm_atomic_get_existing_crtc_state()
> is part of the state building, thus happening before the states are
> swapped.
> 
> As such, the existing state points to the new state, and we can use
> drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
