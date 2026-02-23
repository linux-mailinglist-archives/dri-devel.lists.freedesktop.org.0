Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IMjEHOsnGlnJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:37:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99C17C732
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E26310E447;
	Mon, 23 Feb 2026 19:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcojuaHG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1EXmTzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD7310E448
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:37:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NHh3L2322187
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eY/T1hA+HF6UhSUVKBJ0gs+zsZZBPbjvoFStA+IANlE=; b=OcojuaHG4QO4uQun
 soP7EQgSuvGdGKhiYsOrHqgSJ7Vok7GLD5FiZUnuIQ3XMmlK47PtQz5ry1D8A7Jz
 x/zFVCdhjcAV+P6MVNXEjFWD/tXuJurkWu4EL5jmTbLPorC1ZEg/0F/bUBE9OpVa
 rORdxeJNvFzpNsjbQ4q3755MH6Eg2pjTqHOt3ut/F8i4r/QGOvRQaFahz3TGX1cY
 ykOuuZTa/izUW84bIooPevfj99se6YzlFhbcRvpzhvArMdoIfArzhlrvCujDy8pP
 hJy1uIz1JXP90arn8+LJiC4Z7o5hMGpoYIHA/9qFl6Bohf3R+zQziYoKQqZYxPjs
 pwkJmA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1pua-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:37:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-89463017976so537984646d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771875438; x=1772480238;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eY/T1hA+HF6UhSUVKBJ0gs+zsZZBPbjvoFStA+IANlE=;
 b=b1EXmTzg5uLPeec63hx1lhTQM9uQ6VJGijlvxQFRMVyTg3JPoUBFLu1PPZtpvATSPi
 WqweWhOKV9CPQbyNuv5+XrDGR3B4Ei8Qw7r5M043qFP1Ljof0+j44DlrFMh8HfEk9OAa
 3g2sCk9DhfgQR8HwvGE24nS6ba2yIl2Z9aVcOaGdL4NYi2gXr4ln2zkAX1RA8xq9mJxS
 7eivBG5MCIQKbtC+2W0KooQY1cMu9PqpeKnbWQTsAWVm+hinGr8EATGWvoym7lAlafgq
 LGenQtt5ByrhmRswxr77Gyh116BwavWvZMd1o9nCmXaok+yCZcK/6QiFWjZ0fuZU5tlv
 Rr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771875438; x=1772480238;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eY/T1hA+HF6UhSUVKBJ0gs+zsZZBPbjvoFStA+IANlE=;
 b=jWzeF4K9oqSt3Zsqh1ZTUVxtY+rTseItIkrMMt1SS1V3Bso6Gt8deFGVRWBCnzvL6L
 /Utz4uofxIErnvAx3oByHpcnZ+d2LGgqZZKK9ZeSHZSBWAbSgUsc8L4SScvhKPvkEpJc
 1Ra8f1HSER1w5bcDRerKZBF5A7Vp89PfK2zdJbufZjMSuiRsPGDQlKTGJ1+AMoye+g9h
 6RMEyvUw19d4C7nonIsI0C4loaSAYGjZWxWOQ+ycTq36XSqQWymJXTWE/96Td9QwYweC
 giyetQKNT/UPLcaT8y9ftA3YiPhqUB5XLGcysGYkaFbHlSe7ZldQL1i5JVtSXb3EYZMb
 4tBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi6Vx2peqMi80oM6DySV1bWdP8IBHuGzbTiwK5ZphMRB0cEG1cyzRNst3Fgcdf9axyG+9zzGBNg2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgJWv05YZG9fSZfFJrKoahcQl34wfmJoNSQqki51JVxFp6Mctr
 7cq3RFajsoiUajCA0vA/6t//fM6sy42IwuKKyUScNZExnxBZZQz9kFSP2rhhs0U39wygs27uc1l
 i9lhUCqYcv+oMTLiMPlvyEYcc/0GIhtQML740WRpr1OfO49jLQ/DwP3KhcT/LrsdmgOXXRXw=
X-Gm-Gg: AZuq6aICKQBvI0CLWTqxmghA9aJGQq93H88owjNqwqcEFzLBOYvws6oVFPU1pc8fSZS
 RdC6UwAez1xjJX19scfx65EMoCunNPK6nWPVkU9FX9vDOaSAJHW1hOBMoiJe+E+3zg1/3IxkfJQ
 pWVCA2swEyC7IyOvkgn4SZ18flb4xyL8LvO1XqEBZZGzYQbn/REdMt09+Rfwk9bd2RRZrVDQxi3
 2zoC1UQJuVDL4HNEc1+4Sux2kpZHlMPZKd3Eyfu8bcSad+ufNSLcoj5Dkc8/cxkNbkt2Z7ftYOk
 td3NJQGwQW30RSZpwIbxJWhHBwZ3oFTETr+UfiTjZT5eG4vyG5apCIiYZx5kLpx7rayCp5PtJQB
 SrDm7JbDIi7Wm2F/1lUWjAHW3b4VhFJsZtvYZw1ahQKP46vUN4xeWdnaHdYwZP1hT+g4vZRPZyt
 Oqe2Jh1r8li3ZgGmiVLLs5BHt1pL+es4tb4J8=
X-Received: by 2002:a05:620a:f06:b0:8b2:e8a0:f4e with SMTP id
 af79cd13be357-8cb8ca9e3e5mr1205845985a.77.1771875437553; 
 Mon, 23 Feb 2026 11:37:17 -0800 (PST)
X-Received: by 2002:a05:620a:f06:b0:8b2:e8a0:f4e with SMTP id
 af79cd13be357-8cb8ca9e3e5mr1205842485a.77.1771875437007; 
 Mon, 23 Feb 2026 11:37:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb3ea5bsm1755489e87.42.2026.02.23.11.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:37:15 -0800 (PST)
Date: Mon, 23 Feb 2026 21:37:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: gpu: drm: panel: Add Samsung S6E8FCO
Message-ID: <5ibwkfovm2vvpin475c47lueomscnetwv6myglxqtaw7x26l2m@q6p5vye7itnh>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-2-7756209477f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-panel-patches-v1-2-7756209477f9@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE3MCBTYWx0ZWRfXznTyb6Z83xJm
 V0123Q/9wGQSLWU5T71nWNsAFr8ySHXmi1DosIUJzrcNgX/dbx9xUnoexWjL0ZXQ0SDcpUP+/j8
 +iUiRzYaf0Pb4UkASVYJqKMeSnfuar+TJCpPD5ZOINL7gqvmd6wXZp5EbzeDOeYriypAgL6mcuO
 XU0v2+/0aSuMtG+OBFWr0YOJyt71tWjOqeAPqdznX0XhcDKOUrUnJ0D+Iok3JtU8vN9B65tmkj2
 hGw6zahySmgk21AzPpaiM1ZVEluZug0L4gWMcF6WLew5IUf+ceaLLMaLyhzx6m2dVVNZmNsp9nx
 OGqMeDPZjNO62FlQYGYY/AWdqYxbd5gcSqdwEJW45U2se8fJyk8E+euoT4O5QNHD0LlGCDsbk1S
 vaqSV7AQPlgg2N3mDuFmtEpNesppAdDy6E49scVhicKFdV/VEPykr2bd1L9jbcD925UUhIJKlMw
 7n4WRF76HDqvpldPFEw==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699cac6f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5_deXYglJ-IJTFlCAz8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: hTvMHINkcsjxpY9SyeW85NHyVnvdgvwY
X-Proofpoint-ORIG-GUID: hTvMHINkcsjxpY9SyeW85NHyVnvdgvwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230170
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,protonmail.com:email,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: AD99C17C732
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:24:03PM +0200, Yedaya Katsman wrote:
> Add driver for Samsung S6E8FCO DSI video mode panel, used in
> Xiaomi Mi A3 mobile phone.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  12 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 ++++++++++++++++++++++++++
>  4 files changed, 307 insertions(+)

Please change the subject to follow "drm: panel: foo bar baz".

With that in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb9834084e24671ccaee79939 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
>  M:	Yedaya Katsman <yedaya.ka@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
>  
>  DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
>  M:	David Heidelberg <david@ixit.cz>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a83804fedca1b688ce6fbe4295ec9009007e693..734640bb3f73c83e9273573aeb720ea1ba20862f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -893,6 +893,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
>  	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
>  	  DSI protocol with 4 lanes.
>  
> +config DRM_PANEL_SAMSUNG_S6E8FCO
> +	tristate "Samsung S6E8FCO DSI video mode panel"
> +	depends on OF
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the Samsung video
> +	  mode panel S6E8FCO. The panel has a 6.09 inch AMOLED display, with
> +	  a resolution of 720x1560.
> +	  Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> +
>  config DRM_PANEL_SAMSUNG_SOFEF00
>  	tristate "Samsung SOFEF00 DSI panel controller"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..54eca60e5b57328ea94ed7880f4dead981f87fc1 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) += panel-samsung-s6e8fco.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
>  obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a1a1c680ee143d2429a6e1ea59a4fdd16b156b4
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2025 Kamil Gołda <kamil.golda@protonmail.com>
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> +// Copyright (c) 2026, The Linux Foundation. All rights reserved.

Hmm, so Kamil worked on it before it was written by LF? Are you sure
that the year here is correct?

> +

> +
> +static const struct backlight_ops s6e8fco_samsungp_bl_ops = {
> +	.update_status = s6e8fco_samsungp_bl_update_status,
> +	.get_brightness = s6e8fco_samsungp_bl_get_brightness,

Does it actually return the written value?

> +};
> +

-- 
With best wishes
Dmitry
