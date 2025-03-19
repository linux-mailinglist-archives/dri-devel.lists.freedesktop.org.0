Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F59BA683DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFFC10E254;
	Wed, 19 Mar 2025 03:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="cHTADKtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at gabe;
 Wed, 19 Mar 2025 03:40:05 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6FD10E254
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:40:05 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250319033039epoutp01df1ec8d3f763c646afabbf90645b326d~uFq1Mg-Lr0065000650epoutp01R
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:30:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250319033039epoutp01df1ec8d3f763c646afabbf90645b326d~uFq1Mg-Lr0065000650epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1742355039;
 bh=9P5mVE9rcZVAhHrU2b7b3R9v9xwF3k2DzIypDiwkNSs=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=cHTADKtU52hbFuQrIEmGhPziAbqq1XxXEuIH0CtWVzp2py9sGEVYPCIixY0Z238rt
 pje1E1fV06Sv7oVASwMlDvbHCxtFqXiGvNK4RDJdvSBA6VCDn1KNnYUcb4iEUpUS7L
 wHqeUbxMWl9NzSc1BhUg5dIVVNvIjT1OaDaIg29Y=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250319033038epcas1p19bf6bb3adc8be4e0366955a5d7cf4f95~uFq0mwiJz2149621496epcas1p1S;
 Wed, 19 Mar 2025 03:30:38 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.132]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4ZHZ3d5YBrz4x9Pv; Wed, 19 Mar
 2025 03:30:37 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.64.24218.D5A3AD76; Wed, 19 Mar 2025 12:30:37 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20250319033037epcas1p475273cf6fbc1c1acb71fd84b64711a1a~uFqzJQqFn1648116481epcas1p4K;
 Wed, 19 Mar 2025 03:30:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250319033037epsmtrp16c341f21c0e1ba2071e2ae3a105832ba~uFqzIfnVT1703917039epsmtrp1m;
 Wed, 19 Mar 2025 03:30:37 +0000 (GMT)
X-AuditID: b6c32a38-580dc70000005e9a-fb-67da3a5d10be
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5F.C1.18949.C5A3AD76; Wed, 19 Mar 2025 12:30:37 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20250319033036epsmtip2f5cd10a6e715c06c02f8803d401743d3~uFqy2EXsH0786807868epsmtip2X;
 Wed, 19 Mar 2025 03:30:36 +0000 (GMT)
From: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Wentao Liang'" <vulab@iscas.ac.cn>, <jani.nikula@linux.intel.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <krzk@kernel.org>, <alim.akhtar@samsung.com>
Cc: <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20250306042720.2296-1-vulab@iscas.ac.cn>
Subject: RE: [PATCH] drm/exynos/vidi: Remove redundant error handling in
 vidi_get_modes()
Date: Wed, 19 Mar 2025 12:30:36 +0900
Message-ID: <000001db987f$479ece60$d6dc6b20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI/yHXXKYbFaiJrYWOw9xvHUpbC7QI3gW3fsp+widA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxjN7SvvtWrlWeu4I9ssT7cFMrDFwl4Z4JLV+RhugmQxmzG10pcH
 o7/saxfUuRGyAUUyZFZXa0GGDKQhwRWFwlK2FbHg4grSCW6IS8A4KlQnavbjn5U+3PjvnHvP
 d893vnuvABFfQRMFpQYLbTZodAS6it8zmJyWui/rF0b2re8VcniihUf+1tSDkqHH91GyfbwL
 kMHgBYy8VjmPkZ6ZG3HkeL8LJR3BAR55JvIdRjpOzKFkx2c+/utrKN+TZj7V57yFUQPebkB5
 3DaUahoppG4fC/Co7tZPqM8vugG16HmhQPh+WXYJrdHSZiltKDZqSw1MDpFfpH5DnZEpk6fK
 leSrhNSg0dM5hGpnQeqbpbpox4T0Q43OGl0q0LAssSU322y0WmhpiZG15BC0SaszZZjSWI2e
 tRqYNANtyZLLZOkZUeH+spLqodvAdC2+/I8hG1oBXKJaIBRAXAEjP17l14JVAjHuBfBs+C7C
 kYcAXh9p5HHkCYCn7CHwtOSbvi7AbfgAbLjQgnFkDsCZygFkSYXiDJyrHY8dLMEnARy8a48R
 BD8FoL/RxltSCfFMeOvvfnQJr8f3wp8W22KYj78IK7y12BIW4UoYPPEryuF1cOT0LH8JI/hG
 2LvgQriepPCvO21xtUAQdcuCQx25nEQCz9iqYoEgPiWAlc5BPqdXwZ/t7jgOr4fhwEWMw4lw
 rr4K4wqqAew81r1M6gDsnfYuq7bBjshXMTcET4Zd/Vs4t7Uw8rgutgxxEaypEnNqAl4Zm1ye
 HYSjrQ0ohyk43zONHgdJzhXRnCuiOVdkcP5v1gz4bvAMbWL1DM3KTYr/LrzYqPeA2INOIb2g
 ceFBmh/wBMAPoAAhJKIdsxOMWKTVHDpMm41qs1VHs36QER12A5K4odgY/REGi1quUMoUmelb
 FaQ8U04kiEZ7PmXEOKOx0GU0baLNT+t4AmFiBW9XZ+7m6rzC987N7i3Cjnh2tygD7ee1k6+1
 MXW9l5rsnmHJyZ2H1cTzN1bXNP8zkxKxzknfKW90jRWuyQtNF+5Kcliqw9nUfNqeA/uJ6+GP
 +jprPDe/HLL7RZ7V7xonFUWbkD2Pku0P7p09TQTyHQ0PfT9MGNk8KBnd8L0+LHxJkrB77cvn
 99nL8fDCdhDvqw8+d39q4eZb+Qy1YzHvSO/WevWEEo5tdAzEG7VH60xHWz++93bQNyVzGKBL
 deB4UfFw/US5OOL2KunFgwmO37+402979PViZmg6VWU7pD+IBbepusHmywF5yISdTMq/eunZ
 9kBy0eVz6a6yD/5ESwk+W6KRpyBmVvMvKZGs71kEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSvG6s1a10g10vmC1OXF/EZPFg3jY2
 iytf37NZLL+8ntHi/PkN7BZnm96wW2x6fI3V4vKuOWwWM87vY7KY/W4/u8WMyS/ZLFa27mVx
 4PHY+20Bi8fOWXfZPfbt2MzosWlVJ5vHvJOBHve7jzN5bF5S79G3ZRWjx+dNcgGcUVw2Kak5
 mWWpRfp2CVwZ7UfvMxac5a/4eLSTrYFxDm8XIyeHhICJxMad6xm7GLk4hAR2M0qcb53A1MXI
 AZSQkNiylQPCFJY4fLgYouQ5o0RP72I2kDibQKrE69V1IHERgUeMEh13OlhAHGaBGYwSa7dd
 YoLoaGeU2L9lDjPINk4BM4m7v3aBdQsLREqcXqoPEmYRUJVo2NHFDmLzClhKnJ98mw3CFpQ4
 OfMJC4jNLKAt8fTmUyhbXmL7W4iREgIKEj+fLmMFGSkiYCVxdKUdRImIxOzONuYJjMKzkEya
 hWTSLCSTZiFpWcDIsopRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzhCtbR2MO5Z9UHv
 ECMTB+MhRgkOZiURXvcn19OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ83573ZsiJJCeWJKanZpa
 kFoEk2Xi4JRqYHKs5PxRXxPwXVtWsFc+7rm/c+6H0u9dO3e87Ho2R/zm/og1KafvB/y89UV2
 t+aa013K227d+cF6+f+e/dx1y35xL5mfs+x1+cYo0WvaqsvmrbHoKDq6++QqgatvVfmmXeR7
 8OHrDJsP4u0CEmkdj5nL4uZbFnSaG8ZWfL1qs9kl9ah1HLe5oed/Q5Uz3O8eR7stanplJ8N5
 vYVr5fnTzftvHz+nx9mRecN6Y7pWvDnPvDv9dtUT+FSPzfx2+sq8G5m8b2RCFArz/t21COXO
 et7jvvjXjeP3Vd2+uchbL1q/MvVr6L8Z2WUOmre4W8TmCagcW6l26f/5k2G1HMd0z2YdPLtt
 V+JsRXtDF9Hzj3qUWIozEg21mIuKEwH8r8YXPwMAAA==
X-CMS-MailID: 20250319033037epcas1p475273cf6fbc1c1acb71fd84b64711a1a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250306042753epcas1p3983510872a862109f7f72aff5d074ea3
References: <CGME20250306042753epcas1p3983510872a862109f7f72aff5d074ea3@epcas1p3.samsung.com>
 <20250306042720.2296-1-vulab@iscas.ac.cn>
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

Hi,

> -----Original Message-----
> From: Wentao Liang <vulab@iscas.ac.cn>
> Sent: Thursday, March 6, 2025 1:27 PM
> To: jani.nikula@linux.intel.com; inki.dae@samsung.com;
> sw0312.kim@samsung.com; kyungmin.park@samsung.com; airlied@gmail.com;
> simona@ffwll.ch; krzk@kernel.org; alim.akhtar@samsung.com
> Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Wentao
> Liang <vulab@iscas.ac.cn>
> Subject: [PATCH] drm/exynos/vidi: Remove redundant error handling in
> vidi_get_modes()
> 
> In the vidi_get_modes() function, if either drm_edid_dup() or
> drm_edid_alloc() fails, the function will immediately return 0,
> indicating that no display modes can be retrieved. However, in
> the event of failure in these two functions, it is still necessary
> to call the subsequent drm_edid_connector_update() function with
> a NULL drm_edid as an argument. This ensures that operations such
> as connector settings are performed in its callee function,
> _drm_edid_connector_property_update. To maintain the integrity of
> the operation, redundant error handling needs to be removed.

You are right. Merged.

Thanks,
Inki Dae

> 
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index fd388b1dbe68..a956cdb2f33a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -312,9 +312,6 @@ static int vidi_get_modes(struct drm_connector
> *connector)
>  	else
>  		drm_edid = drm_edid_alloc(fake_edid_info,
> sizeof(fake_edid_info));
> 
> -	if (!drm_edid)
> -		return 0;
> -
>  	drm_edid_connector_update(connector, drm_edid);
> 
>  	count = drm_edid_connector_add_modes(connector);
> --
> 2.42.0.windows.2


