Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6280BB402E6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C1610E333;
	Tue,  2 Sep 2025 13:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="biGR24Zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110F110E6E8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:25:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AKfK6025153
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=S2dUObUWG53QI8u9lQNC/Hv0
 LAmOc3ff0Mhc3gon7M0=; b=biGR24ZtJjNMJQUtETF32FAB93EdGIfnEiuPw4Jq
 Ix0lb225Z7itHnndeHt+r8kof2Y3BqHqLAlyFcynzQOfiOCVGHjLoUhrOzkbFYlr
 GFxVuQSf8ez+wMhs9HsDqZos/QrrE5UaI6HI9H+DA8jxcIrh5+ROHqJ1uC2bHilu
 bgRuRWr8pXlfZV1lQnwqk6enDY3fECxAQn2VdSyKqdfqE2lkioL83veVbM6F/GHq
 Vd3E5LfnWs8BwM2dpbicIxi8co/Nw5HeDD0dVz6SYd50oVfwexxXsZRcTlj6S1bI
 o7hBmPOQuLMtllWTOxOV2L8j2HsN93x8HiuGOgmh6A8GLw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuyxwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 13:25:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-718c2590e94so38596306d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 06:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819516; x=1757424316;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2dUObUWG53QI8u9lQNC/Hv0LAmOc3ff0Mhc3gon7M0=;
 b=b23WKpWv9h9MrHKaR9FTZY6wI+enyWs8Gq+TyXeYEBLOHRnR0obsarjov7f7xgPPG7
 L/vukSG4PYyX2/Gf163sffH1HD3rVaij027F5zllJSfWk4TIy3kMLBgHeSH/sM5LqXyJ
 qzFvyClOqSJfz9XpEPNwsyd5Tb26ogd3bkEX7lY6+sBi77euv9i3Uw2F/uqDYHKNjLW5
 54oik0U1BjXFYzbI+p5hYltrrDvqQJNIfvjAIO79CPXsxXexq91INpt71ANMzwBpPs8h
 4gMijPwHsLdWeSU3d4EiWXLgz/XkeP/YbObplCSYA3sdKFRYSLSoM9xTDE35khMUKIjt
 ixMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0sXHljKTzSOAdHJJZ7cNR3K1N0I/iyoq5y383wDGDiC6FjBIbYhRbBJXU1QYktHPR+ZLpIHpjic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+M7IiXwDh4E2n6qL5NLlqTvXLPcJY4ZGC9MClJei0X+bdiBeH
 NECZTRb4aEmoQJuF/e9YXZTaAXFLvfOXv6Hrhdo1zVv6GFK2nqc/jM1Sn0g1/N/8DAMSRzaDaI6
 cmOWAZsbt9UQeIbWcxHm4Zhm7lKl501rwUrcjmMpErK/mtsf5FImJHK9nLGb5I6tRkHAv5aU=
X-Gm-Gg: ASbGncuPpxgq9mRyG0+PCv9k5IUzsQSs9jlrdgJeBrSOwUoqyJY8preGx0KOXLKMwRi
 94sXOUeAGjgrCJvp2J6E+GwaxxaCS7VIuXMbPj3vSOtenZ9l0atXLUjMo/yDCqIO/WDxhUdrsYW
 KkLFKC+IF9sUhT5WZjLO3UhdxwLAQ/koFo2mYG+CbdjQKwsCHF2+MrisfkGFGX4aolyTn9sRIED
 qVTUkJjmb1XqjzCWMYW3cc78g+uUZBNIfl1hxec8Ow6TcIBV7kAM75YVYwIq5DTq6hPSYfmQHJr
 zFLVdoLBBeAI0CcPEdTLt3BEc6Khe6YhRYPvadpfBcN+HrguPCjitaZNzRSy9ilV6y5PhcoX7xk
 OLUj5JwyxM/U+qQnwxLVVZBl7IJkA83lG75AxO8cphM8fsEyy6guT
X-Received: by 2002:a05:622a:46:b0:4b2:cf8d:ff4c with SMTP id
 d75a77b69052e-4b31ba09797mr126925981cf.38.1756819515492; 
 Tue, 02 Sep 2025 06:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjl4DlT0FFJ03cQkSmad42LJSG9OQT741H5HLMUe2TPqxkbOdx3X/2qBu+ZwdKHMcjqrIWrA==
X-Received: by 2002:a05:622a:46:b0:4b2:cf8d:ff4c with SMTP id
 d75a77b69052e-4b31ba09797mr126925531cf.38.1756819514907; 
 Tue, 02 Sep 2025 06:25:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50332cdsm4786291fa.36.2025.09.02.06.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:25:14 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:25:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 36/37] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
Message-ID: <tmph723nw4bdmekhgvgrcyk6hngu7dw5stajeiskmaugfdhfa2@bcmbqpzeavy4>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-36-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-no-more-existing-state-v2-36-de98fc5f6d66@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+KyR8furOHXF
 C7J1y40DcNpFpE0ahgx4uTM4J8qBNSBJKOVUuCXE4kI8xrmLpJ36yZP3A1GlizA2ETngfj7y0+a
 DgQQROZ8oXYaSTrJmHLdmvtJ4w4mmF7iUyNShRlmOStmwt3bqN/dZfjMlTI+hT9fJNl3j/WvZlN
 UUsaX202VVgwzl/elZW+JbenyJH4RZMg1SE7m8nwgJqTdx+mXEEB/tLO+QhKotDlScvFGlEKwav
 OLApf+TwuH1ZstOUu4xUA7m0AFTU0wG66IE55W5NMoUEtgb2y4/Z/LUrf7WUWfEILu70IvU3GyN
 a7dAP5kLOukoYefLywmU6t7p0VkPE9C9siz8tdBQx1KK01JIKb6Hb0IwOh3gO6ppJVehf5pFsWj
 Ohl782gg
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6f057 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ZszGz_lcGCkL6nuCI68A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: fAP-yTZEXcG7zgV_DDnPXS-mgiek1PTR
X-Proofpoint-GUID: fAP-yTZEXcG7zgV_DDnPXS-mgiek1PTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

On Tue, Sep 02, 2025 at 11:35:35AM +0200, Maxime Ripard wrote:
> The drm_atomic_get_private_obj_state() function tries to find if a
> private_obj had already been allocated and was part of the given
> drm_atomic_state. If one is found, it returns the existing state
> pointer.
> 
> At the point in time where drm_atomic_get_private_obj_state() can be
> called (ie, during atomic_check), the existing state is the new state
> and we can thus replace the hand-crafted logic by a call to
> drm_atomic_get_new_private_obj_state().


This function is being used in e.g. this call stack:
ingenic_drm_crtc_atomic_enable -> ingenic_drm_get_priv_state ->
drm_atomic_get_private_obj_state(). Please correct me if I'm wrong,
doesn't it happen already after the state switch?

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
