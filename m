Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB6C7BE80
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 23:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDC210E917;
	Fri, 21 Nov 2025 22:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzJZS4fX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nb0ynU+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4001F10E917
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:52:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALGXINW3675800
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2etO1CJNtpNIPe+HOa0WpqfB
 qr/+g9F6UdlSM1ZdxJQ=; b=jzJZS4fX5y7pYNvKK11iZHHL5+4nqDZXgr3QEVUz
 o3tFCpcTvUaJuQPdrNDiE8C78eBWcOkpXPWmdseLoMti2LxlaMRMJzw9bEkfMnB3
 +23FBecTiSkJYQfloTP/UO9WoGtu30UJbYJdiN/ejDgri+wkRzvwExQbfE3vigEm
 BqKxWkjLAxKQGwAYv6iiXxlg92cH6JyWknTCUs2LZH18Ktp454vkhTz4EGe49Imw
 jDt+f8xe3cSARZUhYpxN9Fustx65F3fDoy2lDV0yIPFYQcz8sC8cQva3zxMtTs39
 wfxjjwnBcm9U30HZqOgWN5HefauN2cFIZ76ZyugEwtgJ/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyjaex5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:52:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b1d8f56e24so739088085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763765569; x=1764370369;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2etO1CJNtpNIPe+HOa0WpqfBqr/+g9F6UdlSM1ZdxJQ=;
 b=Nb0ynU+FI1bKqS6HZn/mE7eRZ3dCMGiLgEb5O4AxiXEsHBP43U2uQIoM1DHeAMR1+Q
 xkQy50U+yKEn57a/hpLFKS1CEyBLwkhqCdUpGPsBCkkzkDAODPKcNMgRzRFOKMTr3w//
 1CRRO4YrMuOPNJgxaSdtyKcCYETuOGmkIfoEDhqMED2nucXSSH2Y6qgZtkKecp02babX
 HnIiAJO+m3WIIh1um+XwaxLgc7PNiq+8Yialt1ewOyH1kJXS01VqV61Pp1D+/qsLVraU
 LyKWFum8uHoSri1I6rTba4CGlhVfFx5iCp6JvvxhthxrjLShPcj2fgbdWDhkQe84KmoQ
 xKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763765569; x=1764370369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2etO1CJNtpNIPe+HOa0WpqfBqr/+g9F6UdlSM1ZdxJQ=;
 b=I6L3Nl+xCZHf7i8jIJyAMwUHj4VRV04mzLbVlVWIvwd8jg3CkhR7C8mFkBp5s8aoF0
 DRonJwuLrrFhWm+sETVFe5pxFBCtP7ZK+1O3PoauZzIjtdcfnYqRp02XaWXKOHeFJeqg
 8rbaz6FOitdt4AhW7goze06SI1m3AipYks81MQBuPglY/HlR0ZE7JNUx4eMb/OKOMk8U
 UymN6I6X+zeeHfDM7NddDWRLnvXBhuKIafy/Q8GpfIetqOGMGqrXnIOW9z3UzBlCSRMY
 iYS+U9DWAwSGSSQ6RG5aYJPWfXQumaD3QSTC+/5XI5yhlsUldadmK4gkn6OU0aOddJWW
 5Eog==
X-Forwarded-Encrypted: i=1;
 AJvYcCW38xiIf//6TcN+MPV4SRT6+IIPk0dlnQeh3rcmPZwrGztFJ1ymisas1Rq8PVUqwkNmW3LG8CblnXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYaHlOo0mSoH+1giGBJAoatxb23TPgOqoKNpEmowixCtCHQOon
 3wg+FgE1LBFj47jY/yobWAWWHa/7Ry4PpD0dfsz3VWb4AVOcxJQWO7oQyBIo76M7KaDzY9Yde9L
 8aOVKDZHNCmoBuZ6yVXuthBMN68tHLDwowCMhiQWApvoRhIKUoYMiJ2g5kopP86n+7s5CGlarUg
 Ut+rc=
X-Gm-Gg: ASbGncsNpGj/Muv0k/apeOmfKst1QoJBKDjM7lxiyYLKxwyxlqP+umU2PX+opQ7dIFr
 v1xj0oET/iRlltnUgyjFNaK2MqcMfAv3Aoh4RkPOHwenLTVECBjO67oWa4O6Hn5jvubrPdZpGWQ
 V6U5iZaJ/j7/1VsU6LdwglzBbYKMopc+COyMHGlkxU1+ekWJXohilbXULu3+/Ih6ihHrOeRGSZn
 66qGRZV07RmNNDOUtl8tWIS0QQFFTWGeY9jaXm0jEP0l35JLR+JSb4E7mxV1e9AQK0gBlioJ9uS
 /RdF/RwLIQeW4KtqidVGdy8GZHlUEChxTqDNdyqK0XcWXTznQ290B14VGMMWCsDAfngNOKLiSYM
 QsGiHrI2G8KAJlVlZOItAc16ij7vygouZyNM48d+FEMV3Gv9xBFFX5at7nUwOIRjSxXz5At+nGX
 yIjpFMp6l6F9fiKHUiLP9kUhA=
X-Received: by 2002:a05:620a:4404:b0:8b2:ed71:ded3 with SMTP id
 af79cd13be357-8b33d4a01a3mr524688485a.67.1763765569311; 
 Fri, 21 Nov 2025 14:52:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb23lCKZ23glBp74IiVfz/K6muOGBwS6W382uq1fVOh0KAzZTTZ0BY7nggZa+sLLASNUkjfg==
X-Received: by 2002:a05:620a:4404:b0:8b2:ed71:ded3 with SMTP id
 af79cd13be357-8b33d4a01a3mr524686285a.67.1763765568941; 
 Fri, 21 Nov 2025 14:52:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbcc90asm1975272e87.90.2025.11.21.14.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:52:48 -0800 (PST)
Date: Sat, 22 Nov 2025 00:52:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH REGRESSION] drm/panel: simple: restore connector_type
 fallback
Message-ID: <4am5nvb4ldzvvaavkdu2o36viltoxxyxwybrmj3h35wtdhfcpa@53t4zahc3y6c>
References: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6920ed42 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=XYAwZIGsAAAA:8 a=255BHluu6XS_bZfolTkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NiBTYWx0ZWRfX5WVAT2Qjeemh
 XgPlY/Cv+MEQha47ssN6iOEdI75ZeIg2p7R4uS1tpjcNLNut7xE/9O8SpA2ChwDLz+YG539BVu5
 1boEbcHje0nWdhQWZWgSkW+3h5jWdxntPPKDaUKnaqo8dnYyWNTzKyhEnTkJ9iTigJ4rn8Ni79R
 WxVvz24YzRH4gQJArFye17DWLlAVhNMSmOLPDtMGTAx5EL1EQKDqYO6Fwqh4dIFO1yWrJXMsKdV
 dL4gwdrHCxpymLpkHgzNvsIrnzFHugJBgudijjxBAAXk9VjcLEFPgE9CcZ+1pqjfn6kIs4oGE/C
 /dhyGNbI6yB0ISpOjjyj9I+59/ywzGXHGt2Dri+o7Amr3qUyQ8tb7aXeCgb1Qgx8IJVhduKiswQ
 8yzMEQtmJS37Y8jQfQzAGZ7ns/oWew==
X-Proofpoint-GUID: 7mGX-MmpOQKj8xfy1k3kHLxY5Hw17fMV
X-Proofpoint-ORIG-GUID: 7mGX-MmpOQKj8xfy1k3kHLxY5Hw17fMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210176
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

On Fri, Nov 21, 2025 at 02:20:48PM +0100, Ludovic Desroches wrote:
> The switch from devm_kzalloc() + drm_panel_init() to
> devm_drm_panel_alloc() introduced a regression.
> 
> Several panel descriptors do not set connector_type. For those panels,
> panel_simple_probe() used to compute a connector type (currently DPI as a
> fallback) and pass that value to drm_panel_init(). After the conversion
> to devm_drm_panel_alloc(), the call unconditionally used
> desc->connector_type instead, ignoring the computed fallback and
> potentially passing DRM_MODE_CONNECTOR_Unknown, which
> drm_panel_bridge_add() does not allow.
> 
> Move the connector_type validation / fallback logic before the
> devm_drm_panel_alloc() call and pass the computed connector_type to
> devm_drm_panel_alloc(), so panels without an explicit connector_type
> once again get the DPI default.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> ---
> Hi,
> 
> I am not sure whether this regression has already been reported or
> addressed. If it has, please feel free to drop this patch.

Would it be better to fix those panels instead? In the end, the panel
usually has only one bus.

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 86 ++++++++++++++++++------------------
>  1 file changed, 43 insertions(+), 43 deletions(-)

-- 
With best wishes
Dmitry
