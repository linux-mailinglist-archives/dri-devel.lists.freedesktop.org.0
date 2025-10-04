Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ED0BB8C34
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 11:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320D10E21F;
	Sat,  4 Oct 2025 09:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHdf8jSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD9F10E21F
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 09:53:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5949S8rc019899
 for <dri-devel@lists.freedesktop.org>; Sat, 4 Oct 2025 09:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PEu4XGrNpP8Sls3jA34iE2v0
 JtpnErFtIM1Spm/CEcw=; b=EHdf8jSyX1HVhonHRF51NNtpRt5DKbEgf8KW+kNV
 wsBD/DhcZn7FoP8DyV3mu4ukIp75k48epks5mY/1wBKgHhCCyRXs7EEBaF1/bliu
 E3/HdgznVJjJKWX+M+K1LpJQ97kpCEYf9LyuTI7hTgQ3HHpp+AF3LsizXbqCJaQl
 uN82/3br3CfjIUDDGocP2mDDo07Dasa8ozWzyq0s3PHtAFs6St3F0ij4xm085ZM6
 L252K+lY5vz/iGZfXM7plzUeESq/0V8CgybqLvOtxqXu67WzeKsWWE6X/EqBCFxe
 m5krfjeL9MUPnD0R6dcC73zK2YWV+L/90+50roTsdvwrdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvbdgbvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 09:53:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e56cd1d360so75769421cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Oct 2025 02:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759571592; x=1760176392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEu4XGrNpP8Sls3jA34iE2v0JtpnErFtIM1Spm/CEcw=;
 b=NXFSetZHXRvr33ho+SutOEHEyUlC2CVvnkGFk8/wVjHpem1O/Ke6zi9CS7sEjLLYeJ
 qabql4DNCPa/Jo8fv23h9GXGAxCW2XZzMRTit22ASq0g6Q+d5faUmAR+LiY1+o4BJpz+
 krlIqXqH3VsBsYe/rQrhx/ovi2uzltl0jTvkt7uIeYlPqn8PfnNfT+Ngw7oPYUYmzjyZ
 nU1wz+G6vF/TgfcPnv2iVXAiUwzdpddl6XSt0Nv/gTpDsJnQUgDyIvkERY5MWBeYSKuV
 aoORmwYPwPcp8x+9wk6jgcPYCuOa9mrvigA9ANjik2zPXzKM85GcTZprwavVq5swbfHH
 hW+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZwWpVw3J4bA4ztkvAWp6xwnek1J5f8kNc3y8xMq0u0NpnZ7aWUr2roLtH4UBD8kI1NIT5hh3dxCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP7KAE3SwAdrbCsytLEuWjCXbnCwc7hZ3TGxKI2DL0dy/sTfXm
 teFdk0Cp3cT3RZcSmzty9NDFFxkrfMcTLS7qstRrYj3/Elhm/sUTSKmY/OTJoJftLIj+WPLDR0M
 3lBYZmNsDZq0sYJz4cnnK2jXHhhWRqed7v7MGUf86XgZF8ncoxVIZYoSH92cniYtmywpu3Jk=
X-Gm-Gg: ASbGncv1cX5t/GxlmmWptZYd0xw8vat/7SOUTNMdv8GQN1fYR8CEX3D1faaJHfIAVug
 5PwUlh0YwvVbD7gFSepjNCumZUh1eY5v+SL62lVJWsyRx1zPN26OX5+n6FBoa1ZylFM1mbxVJby
 aCmJAaACZsb2/TqV2QWH1bh5OpWpSn/X6tRSTBhEcz98DMzeAURlR4zFZLrSAVQbFyCP5oyKPmg
 6nmAL53rlLhutNcffDrf5lwRvojnCX9vfD8vHE57pMbw+4AxSwY9iQFD73HoM8yg3XVw8SrCULa
 LG/TdxbhwuNh7YHI60mfemUNQ2tijR7LJ1ZRMLuqmG06XJd1Lyc7Ip+6Hyi5jCQvJgCscwqz74a
 EOMUzxipLvl4NtnHZ6a0dghAauag9t0ZJcIQpjmmiPLu6A7k3ezV4l+E43Q==
X-Received: by 2002:a05:622a:98e:b0:4e2:f1b3:3466 with SMTP id
 d75a77b69052e-4e576adc4dbmr83002221cf.49.1759571592330; 
 Sat, 04 Oct 2025 02:53:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTbBIG6kyIQSt9ZYaRoA6T3Hag/xgJTs/P9Rv1Tz+gyuxM60ZQciRckMkBxOJAK+a1jNQcgg==
X-Received: by 2002:a05:622a:98e:b0:4e2:f1b3:3466 with SMTP id
 d75a77b69052e-4e576adc4dbmr83002021cf.49.1759571591862; 
 Sat, 04 Oct 2025 02:53:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b011ab24fsm2675693e87.120.2025.10.04.02.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Oct 2025 02:53:10 -0700 (PDT)
Date: Sat, 4 Oct 2025 12:53:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
 jani.nikula@intel.com, praneeth@ti.com, vigneshr@ti.com,
 aradhya.bhatia@linux.dev, s-jain1@ti.com, s-wang12@ti.com,
 r-donadkar@ti.com, h-shenoy@ti.com
Subject: Re: [PATCH] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <gc7prlpfdb4zgqtxz5fog2mi4x6vefwcrnuw53i6xbd3vguf3h@gtb3bdy7zogu>
References: <20251003143642.4072918-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003143642.4072918-1-devarsht@ti.com>
X-Proofpoint-ORIG-GUID: yItED3gZI6PzNXuYW2_tXxkSyS5mtLBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzMiBTYWx0ZWRfX/9H2gdc3sB88
 r/cZ42PaLE8j0RPOV09NGjvkAt60XmkAsVqlKVRfdN8CB+9MFMy8pX5VKBq5bzQufIVa4V+u5bz
 KqxSHlZVv4vGLrZ1g6SgycC+SURj5Cglx4B+9jgW6OkBqnhXmILn7UBOHRVMcnU3t/O+1IgybeZ
 VuUyioFzCxj8bdIwSkTAK1yNXJGr0NmASS7fn4/ooc/PDl858Jlj4EjYaTZ6QQnmIUrK4OrxpSw
 L7B8Xdc4nidGje6BwYRae2LzK5hngAH0pDP79H/0a6hi0nxjf39Z2kYZwMn11+sOiDDZEkO9Omn
 cXty9ToUF7nWwF9JPDKlkMOFuaPKEwLzaKL/0dW535Qfg8X8xbywH7mI+frnWj0zKIpV72u363h
 oImLJUb0HjjxczQpz66Ivqpca45lBg==
X-Authority-Analysis: v=2.4 cv=D89K6/Rj c=1 sm=1 tr=0 ts=68e0ee89 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sozttTNsAAAA:8 a=KF_ZkVnESvHIPKe9pLAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: yItED3gZI6PzNXuYW2_tXxkSyS5mtLBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040032
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

On Fri, Oct 03, 2025 at 08:06:42PM +0530, Devarsh Thakkar wrote:
> The SII902x HDMI bridge driver wasn't working properly with drivers that
> use the newer bridge connector architecture with the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, like TIDSS.  This caused HDMI audio to
> fail since the driver wasn't properly setting the sink_is_hdmi flag when
> the bridge was attached without a connector since .get_modes() is never
> called in this case. Fix it by setting sink_is_hdmi flag when reading
> the EDID block itself.
> 
> Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d537b1d036fb..3d169b9fac70 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -292,10 +292,16 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
>  						struct drm_connector *connector)
>  {
>  	const struct drm_edid *drm_edid;
> +	const struct edid *edid;
>  
>  	mutex_lock(&sii902x->mutex);
>  
>  	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
> +	if (drm_edid) {
> +		edid = drm_edid_raw(drm_edid);
> +		if (edid && drm_detect_hdmi_monitor(edid))
> +			sii902x->sink_is_hdmi = true;

Just call drm_edid_connector_update() here. The drm_edid_raw() has a
very nice comment:

 * This is for transition only. Avoid using this like the plague.


And we really need to convert the bridge to the HDMI helpers.

> +	}
>  
>  	mutex_unlock(&sii902x->mutex);
>  
> @@ -315,8 +321,6 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  		drm_edid_free(drm_edid);
>  	}
>  
> -	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
> -
>  	return num;
>  }
>  
> -- 
> 2.39.1
> 

-- 
With best wishes
Dmitry
