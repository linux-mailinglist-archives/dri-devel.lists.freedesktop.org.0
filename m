Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFQAJ7fNrWmL7gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 20:27:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D95231E72
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 20:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD87C10E479;
	Sun,  8 Mar 2026 19:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFSPuFoJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gh/mxMht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AA910E479
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 19:27:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 628HjQFd3598953
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Mar 2026 19:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yvhx0hHAKfkZNVagkFb9Vhg0
 n3xxbR9f3Gh39D0w35g=; b=oFSPuFoJloQVraPqj+MjVcOxkYVlbs8mVdJ6pbYq
 t60RM9jHlPydfzUeO1VD5BBK3rZJvLE7Q3kEeRrFFI90Xy8boYK/Io5jzByRPfgq
 4P9QdpaXfnW+BhKsHOTAdo0zGO20xSNCilUDAX/G//kFdPjsLP1zcZ46gqHnkrSn
 5sQo8rjd0PaWPUDvIAdRzQzeYzIqtY/sunn1lq6DhzjDHzH+nGwxLNZp192YqOOe
 mvzAvK6aEkw8i3/Rwjd9lLrGGKvZLzkFXuaIJbuH8V12q5RZ7iThQcrfpAEuHVPr
 I6JfordXVPvYpdCfPvqRt8u8cruwkY9qR41AWurll0LRyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6faw66-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 19:27:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cd77e5e187so790196785a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 12:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772998064; x=1773602864;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yvhx0hHAKfkZNVagkFb9Vhg0n3xxbR9f3Gh39D0w35g=;
 b=gh/mxMht9TeBMOVGiIBvgnyd7F/DXkIz8hsLfJwMKQ0dNmc4ApsxSrPfvnrseZTRlv
 tJV1vlsASdTIqr+G0I/TRR0zLjSj55Y2D6+CiOuFgnKeOid8ZUYfVFaz3Q5UEZz82beQ
 ZhTp1kyh5kIjsUWVTHBXAvGf5n+rn9tMji5JO/gqdC/wZOnbVN0DXhberiqjsQ+ONt1b
 PyfA2HuzeqNDgsIm4SFvRuOZvL6LWG8LNDNvQ+ldBVQm8R0S9q9Fv/jP5CYM2YQUEM9/
 0JEZNWYC1P3Arb3YtP94GJUxLJ9H6wFpodvFb0HLqsmeFgBUHMh0W37b+02gYDmay2xh
 BnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772998064; x=1773602864;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvhx0hHAKfkZNVagkFb9Vhg0n3xxbR9f3Gh39D0w35g=;
 b=ABUD2zGgnskuGlcSMxDxCdmGJLXGha90nWL4A+nY8ZeAH/dl/FiOkjKVAihm3kM9LU
 B3RI3LAYeSYFFjbQ66nwxMZsZ+flnpiIiMeE++VZAnjJr20fGJQlpxxK9YHK3SNUfwPw
 KkZNhzQsHSHPEX6P+0k95SRRwa9m8AP/SO12G8Ws8d6DUTiaG9KlSW8IuKF/4yCALsMd
 zMLiB3U1k0TrJdNMf300O8wEhW7qQ8VIjUUgK3/rWOL3Mfsfy3qcdRV40Kk7ueEBNZsd
 02Z74N1aj9YQPXL61sbebiBzzVbRAr8Mkv4q26BPxuWc/cyuOs82pFPPVFZS/T3KXEDh
 0ypw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8KvhsRAk+eb/leSbfQ9WGQY1x25WILqDNhitbzHztvl2HQXhyyiM2op/oTf/gKoiKzGZIZ3LoMzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDTiELE9+bh+f2NMnblPWzJEpoYgCuSxCPcbl8h8SveKP1E24I
 SoGrYlS66xZjfOgBPHqmy4BP//gD4fjtn0wRti4K1HwSPSoyyrKgguECREG76ASLq4sJqa1LYiU
 kuBiXXNr2QHzR+YhAvy0XyVcCToOUuVV2Qv1eYNHZTEE6etg4Guy4+MDY1C4SKgaN1DpaPQM=
X-Gm-Gg: ATEYQzwQWkS2VXMKPpnCEhtOAuH6MqpuMvJ5wxeEnrcXpd9KxCprZ/JnQaLJ0ob4o15
 Svynr4PM5IKhAXMwUvsJAFyTSbzOA8VNp1X1mk1ZIHh6c+TpTbD9FbpGDlWx1CpDUuuQJR7Men5
 m5KO69sWXzeQYH35GwycdGLaLvjhLHB+setdctleUJVSaLCaiQssPPlhUJeDRJDAl9bXEBfnF7x
 D0KRjHHLSj7tHkobHyUl2UwX9R9z38hv3wj/ba5wiwUNuzoMSqW89gqZBeMB6K2nzEfwVUinYip
 LcC0CzJ2sklzeylPICWCceGZBmhrEDAJ1mQ8HAYzr0ek0GL7HkqHlUBCtybNh6hwZSugGlLjZHO
 Up3zziGCRVydCpSwIiuajRl1YwyoHTVHkZX8XxhqYl6vGWpbpC0LlRJYIVrg7C73Y69KENaZMJP
 /R1vw9U/otd+VusEsoOj/M4JuXmRv0a0iNmzA=
X-Received: by 2002:a05:620a:4bc4:b0:8cd:7cea:ae9f with SMTP id
 af79cd13be357-8cd7ceac583mr374002385a.36.1772998064081; 
 Sun, 08 Mar 2026 12:27:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4bc4:b0:8cd:7cea:ae9f with SMTP id
 af79cd13be357-8cd7ceac583mr374000485a.36.1772998063516; 
 Sun, 08 Mar 2026 12:27:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d03d319sm1603817e87.38.2026.03.08.12.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 12:27:41 -0700 (PDT)
Date: Sun, 8 Mar 2026 21:27:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <kvq4py5svidg7c4tu2kxwpj6fnsod66kq555pwchd44nfdjejk@yvpk4ismso7r>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-2-aa2c330572c0@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-2-aa2c330572c0@protonmail.com>
X-Proofpoint-ORIG-GUID: z1l0RblCMyfcp2VU7V8_AdYbYH1KbouL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE4MCBTYWx0ZWRfX5af2CQJpICfd
 BVurinesDXIdTT2dOO7eB/LggdmZKemo0aNJl9yO2zGqmL3kqsqnWd5nGE/zGtKxKGqFVNbPZNv
 cYDtPtmQZv25SNK5/u5FxqKXVDTZR8lt31v3/IaHQsZwkTNvTxq7KQ4+rSbkRufuM3a2Ymf2dkd
 BcWa7G10iztUZS68gHTtvs/nXPMwuyduhOGU8B2VjuEBh9wBqOdfBNAQL/HzGKqJyY1LUsZSvqo
 IokL2qA/Ip+v1+WYWgUdOPn+J8ZCoO9zeZ4yndvUZYkkc85H5lHEQBLtxtVexpM4Ta70xP5H3t8
 If9WysrxaZ2SvhooG3TVlVarfQnhKk9f1qioZ2s/KcSkXx/V7kKDPJZobmngoObeTiRhjNmCd5q
 DPjWxT3TN7CHomC4NblYF5sCsTzyiUHpdpjXmQg+T0v1VhOpxRGcp+X40a1tdq8m+j1LIwL1Gwr
 FCakBrdqFtn7XDkC5Vw==
X-Proofpoint-GUID: z1l0RblCMyfcp2VU7V8_AdYbYH1KbouL
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69adcdb1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=sfOm8-O8AAAA:8
 a=VwQbUJbxAAAA:8 a=43JGVj5kcgoAPVrWvbgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080180
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
X-Rspamd-Queue-Id: 03D95231E72
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
	FORGED_RECIPIENTS(0.00)[m:cristian_ci@protonmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:42PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add support for Novatek NT35532-based 1080p video mode DSI panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 767 ++++++++++++++++++++++++++
>  4 files changed, 780 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12243feb0b27..d854804dc8cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8143,6 +8143,7 @@ DRM DRIVER FOR NOVATEK NT35532 PANELS
>  M:	Cristian Cozzolino <cristian_ci@protonmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt35532.c
>  
>  DRM DRIVER FOR NOVATEK NT35560 PANELS
>  M:	Linus Walleij <linusw@kernel.org>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 307152ad7759..4eb9691ab552 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -500,6 +500,17 @@ config DRM_PANEL_NOVATEK_NT35510
>  	  around the Novatek NT35510 display controller, such as some
>  	  Hydis panels.
>  
> +config DRM_PANEL_NOVATEK_NT35532
> +	tristate "Novatek NT35532-based DSI video mode panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +	select DRM_KMS_HELPER
> +	help
> +	  Say Y or M here if you want to enable support for Novatek
> +	  NT35532-based 1080p video mode DSI panels.
> +
>  config DRM_PANEL_NOVATEK_NT35560
>  	tristate "Novatek NT35560 DSI command mode panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index aeffaa95666d..f2b3d9b7abee 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
>  obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3052C) += panel-newvision-nv3052c.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35532) += panel-novatek-nt35532.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35560) += panel-novatek-nt35560.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35532.c b/drivers/gpu/drm/panel/panel-novatek-nt35532.c
> new file mode 100644
> index 000000000000..51ba548d0a8b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35532.c
> @@ -0,0 +1,767 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2026 Cristian Cozzolino <cristian_ci@protonmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct novatek_nt35532 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data nt35532_supplies[] = {
> +	{ .supply = "vsn" },
> +	{ .supply = "vsp" },
> +};
> +
> +static inline struct novatek_nt35532 *to_novatek_nt35532(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct novatek_nt35532, panel);
> +}
> +
> +static void nt35532_reset(struct novatek_nt35532 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int nt35532_on(struct novatek_nt35532 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x01);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x6e, 0x80);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x68, 0x13);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xff, 0x02);

If this goes to be resent for any reason, could you please insert an
empty line before 0xff, 0xNN wries?

> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xfb, 0x01);

[...]

> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x11, 0x00);

I suppose this is MIPI_DCS_EXIT_SLEEP_MODE,

> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x29, 0x00);

MIPI_DCS_SET_DISPLAY_ON

> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	return dsi_ctx.accum_err;
> +}
> +

-- 
With best wishes
Dmitry
