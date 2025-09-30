Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006CBAE844
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD5E10E62F;
	Tue, 30 Sep 2025 20:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KC4LMGSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9735C10E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UJruNb027381
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n8MgadJhrhV1HSlrIC9UJrgh
 Bv6+bn6nyOEgzE424I4=; b=KC4LMGSI/MkfGts/Zkvpo++UDTVu6cGxuLJRMZN6
 B3V3ISoLz+WZKqAOjUMg1ITb///6JCiV70XD/NnyJP4qb8hEt23JcKTMhFQlytzk
 WFRy4OOmGC+cv2PTMqMUgxUVX+O4B41wIOhjLvHhgRZrJZqg47a31LzD9X6TSHwx
 66AqZTneRJW3OwKZZGG1tMul6aPdINuXo220OJlxMO3cLlRixLKH09JCmuddVpKQ
 XaH+Du6KXizvQnTqc5ct2MX+9rfjAf42liLu+8BTrYS0AOO/iR2rEEwzsalGWn0P
 YQE10RDlZZ01gGBQiahlpcF2hMToLxvPI72MqumAKq9Fmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851ja6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:18:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso78152441cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759263508; x=1759868308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8MgadJhrhV1HSlrIC9UJrghBv6+bn6nyOEgzE424I4=;
 b=Vgn11jGwc7znVnSb9qkpesg26dZ9M5aPbZHSsEOCVPQchTTK3J2CVZikPpFMa0n4p1
 uyRrBlK4TC7KJxq5PyB4nm754F8clHAq6tmf1f7a7efH79RtfsIJBiD2C/BLHHN+dXXK
 C3mqNi+QNiPSTdvkpMWnp6h/5RNMfr2o8cyAJchdeWQEDj0W0yrSRdQK9v+0vJVkLVir
 j7aL6WLQQoskqEGX6bDM07N9+m7uBGvqglTsUnpydGBZxq2bCzpH05Jh3ic7pIO0Y6gA
 fFmQRvF0blUqm5+WMQPlchDdqhLD96IUhZsH8F+T3GMwa/nYhUZbZTJSeMT6kAcKRdQW
 m4tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrQP8Sf0diKT/pIjcSBugUwTztj+OtI/6j3ga2Q7tQEpJLJ4kw/M2lJB2KSMjb1XI3Kwtmvbdk0S4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAivyk19G7dWRmpEG/gaBG/Fkm8jN1dn17toOEGv4phxPD/Lsl
 urbbkX/14xpNtK8IhPwxZZeR2hS92hP4rqWLwg8UEogLJHTnMQft4IgJm+0ZN7qCTFzCYXKNxQ7
 vuWeedBtcua81fn2B5W5TCbzjVd/YsPnUJH3zuS05Cqo8C5Ax1GcMRsraVK/Bxgobc+WKBKI=
X-Gm-Gg: ASbGnctODZ0WINSszTygzeJWLZ1ovdfpDDW7mF8FjsKNmp2MMghSlEJN04wxy5zTGnE
 adIcOVTgA5xFAw8a0QcX34oWSZ2xqz2rJzD3tQZ8TGZzYS+ope5BQYyoePUzx53xPXHnGEwUSQG
 hK9sxPYEY3E52RzPMIQ9TuvJOGYaPF0Dq8Wz7WR1YUh1g/huly6NysalbPKVob93t+IBpsa4Uqk
 0kc96gswTAX8qxuOgtdSQAmcK6B9UyuLgq6yOpY+tYrUvb9K9rWEL1I6nTWE859xcG9vke5W5+X
 HCUMxWfUvd6CZm2hdf6eVOfzaEZBGDbNCCcCqmCDj83JM72R3Q4j6i+zX7+Mh7uGmwUFIbRwXBJ
 m+v1n4JfQYIF58mBQSc6DHqDb1di4yYkDjzualThQMLtxWudWlQJDMTkybQ==
X-Received: by 2002:ac8:594d:0:b0:4d9:1d03:83c9 with SMTP id
 d75a77b69052e-4e41c733801mr12497511cf.25.1759263507523; 
 Tue, 30 Sep 2025 13:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETZ6omCmx9fZgdyWrCa0U77D6Uv9hU6fSO42h/F5hPLOdENOJ0bn/O6k9+KhYjIKci/Pfe9A==
X-Received: by 2002:ac8:594d:0:b0:4d9:1d03:83c9 with SMTP id
 d75a77b69052e-4e41c733801mr12496841cf.25.1759263506980; 
 Tue, 30 Sep 2025 13:18:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316ff5bafsm5186157e87.136.2025.09.30.13.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:18:24 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:18:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 09/18] drm/bridge: analogix_dp: Move the color format
 check to .atomic_check() for Rockchip platforms
Message-ID: <5ed4lpdjqru6fbjl5ulaqdex7kppk7bsze2hv37mzgq3c22qir@2srh3jc7sqnf>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-10-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc3b15 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=0r3lTzsetTvyPaIB0MAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX2Jf0V1CZaC/Q
 kBYFrgmVE06jbk78nLhquHcr0D3Ij1R+9rXRGvcVdORAawGcZVRyvMFgpzrund6N0z6jzsjpZaH
 z3yS3zOcAhW4cYftuyE77hkH6nhXIAXx4nuskh9s42aEUtW77a75OGka9/toS0D2YsdtWbZSqCe
 i0SM0b96M7i3OD1aydA3bfqeNomU0oDQYXGycEaTP/eGoYIgRM7S5UtPHbudOAq75UfKfQTpF5f
 BW1de6DXTYEGnWRCCh2+0VVh13zjwNr/S3Tq5+G8WYJML7eZmkeeb8VMF/dp/6zDjf1lLwPRMqD
 kpV5FDjwLx+DGFbpKGcUD9/55OqkTJPg9xopVG1UcBY9qnt/4fkcEvfGy7y8pkobuD6+BOwBYw5
 LmXWT9tSFy6D+HguWugeCf7GeIWHwQ==
X-Proofpoint-ORIG-GUID: 9u4DfXJxiAw3vTC2fQHUiEDtc8m4I6NX
X-Proofpoint-GUID: 9u4DfXJxiAw3vTC2fQHUiEDtc8m4I6NX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Tue, Sep 30, 2025 at 05:09:11PM +0800, Damon Ding wrote:
> For Rockchip platforms, the YUV color formats are currently unsupported.
> This compatibility check was previously implemented in
> &analogix_dp_plat_data.get_modes().
> 
> Moving color format check to &drm_connector_helper_funcs.atomic_check()
> would get rid of &analogix_dp_plat_data.get_modes() and be more
> reasonable than before.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++++
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c    | 18 ------------------
>  2 files changed, 11 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
