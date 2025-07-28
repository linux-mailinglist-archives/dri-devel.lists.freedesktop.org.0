Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D19B13EEE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 17:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF88010E529;
	Mon, 28 Jul 2025 15:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZkElJdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760FE10E529
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:41:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlOTp018302
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EXq6VEpL7hYqGBW2WEJQ4EO7n31vxijncodySag+8ro=; b=NZkElJdWIaPOV+oH
 a1qltXjv0wJHJEAuu/lNAxBmzPvVFTb/6Zuor1TJ0yzyia3WtSWf2L6hb6jzZJMS
 1gSkUtpnPYeRHgz+lVoXC+ryYz/JQChoGW4p3xt90ypRL5J6oiWeGJOQhxYjVP9H
 PVtlREepbaDx62KB+iRIRb6oNSgmBVFjZ523vf4hawckgHA13a6VXgo8gkxCn1D5
 llQgKzA6PyVzHi4s/Kw3muWJ4I3/kkE9UPrqJgJt3scGW0BRdA4rqSAx1AfT+5Yu
 mLg2Uf7p2jeYd3N/5w2b8ntMiy3H/ZMEByo2pbpUJXKhUvpgVU3QZb6ZykFzuIJK
 xvqKhQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkw1h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:41:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073cc86450so30567516d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753717298; x=1754322098;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EXq6VEpL7hYqGBW2WEJQ4EO7n31vxijncodySag+8ro=;
 b=UgXxW7cmdr32uMdMxRtvkMTzojFG5xuik5ZWKuXPzV3LK+n1CjyuiD5iBCL1Y8n7z0
 5fGq285rHgiltUfL6AwmcKmoLP8T0+YmfQJn0OsWJY4uZjlhB7DZaIx7Cp9sa5rkqc4P
 L6T4OapwKiqGf8D/7OPR05eXa44wd1vinCHtAq77+kyKe3konFXK/uDBQnCF8DaHtRJ8
 2IXiHlWKj4RotLRsqluNFI+NzkE8TExjaf7ygaFtw8FJ2qHEOGi93U3gyzzJ4gwfWpSj
 0JgR9v7hpp1oLh+E3PKA+KdnpOBxVL6e82DOPZrIhaEjNHolOVuCfJZNiKAa6GN22MmB
 rsTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSjVTRNGxxQvLViLSWj9rzgyumcJ4RuseT10ux3ElJPQvQGFiOQmLvltEh6qUIG6uvfjNLzMqIEmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXrW0aM6n7bKIkrOviYql1QI45/7oRpm3fbTclmuu3F3RK4Y5/
 IvwhDPeqkXGjZFDnC/bM+3zl0eyC1Jsqp07+Ytw6YcxKiuGYIZbwW5dNM1VEVkWYOPZGrtjgj5B
 pFVp781jWdEyBDqPwdLhuudNpXNom6OJGw8O4/J+QKPlWYnJ4zT4p1p7e+Au+SD1k0TeDlzo=
X-Gm-Gg: ASbGncvkrUAWNpR8WiRWmmT0lZvxl1wAYMvRzqT7hm5K4d5YHwiUZeaXBXImk/UPQkG
 DMpw23+1sZiLYIiH52cmMmglGdz7+J5/L84wbFzCrWIv1ftE3V9L6wyQ/Nz2S965MPGO65r8AS1
 CgqBJh5EfXRNM6AVEtEK2qFYW1z90/KN/0731m6ibMOxVFImEa8GiUycooi5CGSVwu1UJMHSBQk
 +BbRKXamxbqIeOFqmi+U57gmwcZQa5TKpjorPwHRCkIhugv7jnfO4iJxY29/QUq646qcKDs7J4w
 nSwY0ThXyJf5Ay/RnnapYv7VxOGlp7srjiJPg5fOq/hbfy+4kprqjDwpwqf7fjYfzy2indj/+B9
 X6RsqL1j4irIpcyfG86q2qbj60q9ut+E5MTKp6hFwMr1qdNQlYbBU
X-Received: by 2002:ad4:5cec:0:b0:702:b805:276b with SMTP id
 6a1803df08f44-70720550e3dmr176120126d6.20.1753717297833; 
 Mon, 28 Jul 2025 08:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtpkAaEPkqVbrDhK504iZlESPvKjw5q7ogUAbju/dv5ZjpgMNtfNlbQNxM17o0MaH509yAzQ==
X-Received: by 2002:ad4:5cec:0:b0:702:b805:276b with SMTP id
 6a1803df08f44-70720550e3dmr176119496d6.20.1753717297082; 
 Mon, 28 Jul 2025 08:41:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63363508sm1329723e87.116.2025.07.28.08.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:41:36 -0700 (PDT)
Date: Mon, 28 Jul 2025 18:41:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] drm: sprd: remove plane and crtc destroy callbacks
Message-ID: <wtzu7loep4cacjxe2b2bv2xcwac5sq7v7b2cun2sgeaxisqehm@hrlk27wejnny>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-4-e4344a05eb3d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250719-ums9230-drm-v1-4-e4344a05eb3d@abscue.de>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68879a33 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=mw97kSRHHgrdNCgrsq8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNCBTYWx0ZWRfX7E9DzE7jhaMi
 BlvEfpS3Tbl3Of64XRslphkloam56PZnI/3//T7amx8tMW1qoLbqgY++R/eNigTErlbDojltgCy
 dsdi6O0pFBkZitF0Acyf8V2sUyhagt46b4+raxaEsmk8UeLFzEDX+5CwSt54JjOXPIews45EyjN
 1vYzrz2sQzI+qdH3Kqh80sS7hoRIMecWeYW8yErEaeEwS9aE7nacEigKHteTQNLZB91XyEey46Q
 UAPULtMYHAfLS1x9cFLVbJyQ7DNVu90rBAY4eIoGCbYQEIA9Rf6c1tXSMGjxXQAioaqNDb3QPBR
 7f6+8JsqJiFI+bm1J87CJ3Tvwe5skOyMiFp790k18Yj4xM+g0xoIhBY/Klle9i14claUdWzx56v
 cYUL9HbXysorz7+iVhRoD4fcvwTNgCpmTJzOL1861KHy6Pb1L69dHdGxM8c7cPX7mfdrlzcf
X-Proofpoint-ORIG-GUID: DICT8HsC7dSwaS4fkEOuYu8Fac5dqmaA
X-Proofpoint-GUID: DICT8HsC7dSwaS4fkEOuYu8Fac5dqmaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=902 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280114
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

On Sat, Jul 19, 2025 at 02:09:40PM +0200, Otto Pflüger wrote:
> These callbacks are now required to be NULL and trigger a runtime
> warning if they are present.

Fixes ?

> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index a3447622a33cd612e34be038e833222567bdcd2c..0d9eb778794d92418b39f8535d94abde3566de43 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -577,7 +577,6 @@ static const struct drm_plane_helper_funcs sprd_plane_helper_funcs = {
>  static const struct drm_plane_funcs sprd_plane_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy = drm_plane_cleanup,
>  	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> @@ -704,7 +703,6 @@ static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs = {
>  };
>  
>  static const struct drm_crtc_funcs sprd_crtc_funcs = {
> -	.destroy	= drm_crtc_cleanup,
>  	.set_config	= drm_atomic_helper_set_config,
>  	.page_flip	= drm_atomic_helper_page_flip,
>  	.reset		= drm_atomic_helper_crtc_reset,
> 
> -- 
> 2.50.0

-- 
With best wishes
Dmitry
