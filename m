Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91EB44AA9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 02:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6257210E293;
	Fri,  5 Sep 2025 00:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANr/enwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913A010E293
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 00:05:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Iapmb023895
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 00:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FnmVTYg5qyuC90TtxfAp5dg0
 tH1WOGwDVnnWVDmLEjk=; b=ANr/enwScsWo25ym6A1EbFIwB93CVeITfG6TuTZx
 pQTNyfMDG8Xa7Ezx1E9lXfol9wnfY20WWcZ1cZbJBBou19QgAkT0glyuuZeIOeX4
 a0AUMxBP/GE1bFIpcGJYPUCVVxQk/ijPxwWqETOQFecWo+4FmKDfIATFMBdGst8V
 W28PAhm3PTEduaRGkkrY+HBb19Vq1TAfQ6NLhOd7LSXCmRq9NgZ4SJJcV8x3tDFd
 KYh+Zx/N7Hx78Jd+fhI5Q8Weu1SFTncOM1BU5XYGP44AQRj45IRkTo/HdeWdjqCc
 sAFxdBG1xZQexXDbkXRlAiULQIOCiOTywAEo4UTXGN251g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fs2x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:05:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70fa9206690so39921426d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757030711; x=1757635511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnmVTYg5qyuC90TtxfAp5dg0tH1WOGwDVnnWVDmLEjk=;
 b=YeSZ6Ttxcjk27fAjNF1ImZc1fXZ4FgMBki7+eExCGQxS1gO7+eX7nlSGNjbognfnlB
 ewTAFkx+OhH5SLuQOIcxL53j6pvE+PtqdNOW/aBw4gLXppMwb6k9b1QdE8Ctw9o/F3VD
 35k3+JWtnIwNjm9xht0lwlfcPKnP51/v5iFcZGqXBkYa5/cJODKSjCqX5JGrgDiY2edb
 AiPAASUwLTXaSyR9GLlLROyjcZrPp0seNK7gbp39aJTr99e9xrUHsHGF+Hg/5VjXXilN
 4KNwaRibUdrc01K9hzIqOGw5haLq4DKtU6wJ1rT2L4XP3B6v4O8DUk9pmxiYKZbwwSf4
 nleA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBoc0hegeY6poezO67iff2nd2pbSIt4+QQ/8hxJ665gnCADUovxx9u/lRrIf3ZjJ/XrGCG4saFyOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj/yiXwmCG9hB+T+qFg5IyWF/1C+AHH5y7/e7azCnY88Q+RbUU
 ibGyJZWeZx6uhP2acKzA2F5bnUmi8mGML4YXsk5DevuBwokRvlzTG33M4wI2iyaHzKjB8gsLkXW
 2HvoelfeRHDL5xB/cfBklWAOiiAduL58A1noP2dvJT/QhrihmyGV+AzdOgqpP9Klx9amr7iw=
X-Gm-Gg: ASbGncuBVt8yXVFr9vS62g2osEv40WVLbGBD3neu+mHbYwfig6R/Q1oRrF03GmIw2xf
 a/pmrDlXQ2JEJveLuJNiqTaxsIdipmUcZcq/sa9qFLQzGVs8uGLGqUDpIhSq+6TeIhcAXgHSujO
 vDR6frn8iLg9YBViC/G6YtACFe9QKOH1W5E4CKjIVBPjwonFSUNjDwSzvXnoTyQCcyglvFPvvbp
 veGtrt6Y90Oyps8P+htrX35qbTx1dIQUX0dfPT5amR/zIIlLl6/LDFrl2p/gO3+ZwDXN8+WmpRv
 hBnAZm2ztj4kqeSMDyBma6y/8EDMi6EezItR21LDYa3J/p3YOBeasFPsK1nVjCcfcY/fwrFk8ht
 67NeXMo/dB0LEtv3V/1PnzulgB41EbEslXina4yfSdv8+bD9itIrQ
X-Received: by 2002:a05:6214:2025:b0:70f:a558:2955 with SMTP id
 6a1803df08f44-72bc355d107mr23890976d6.22.1757030710933; 
 Thu, 04 Sep 2025 17:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuz7rSIAfCmUlEAAoYDamxMn3kE6MVpgENng2PopXAtvFP/43O0lsMhMkHtfYx9Az0yrIbYA==
X-Received: by 2002:a05:6214:2025:b0:70f:a558:2955 with SMTP id
 6a1803df08f44-72bc355d107mr23890406d6.22.1757030710379; 
 Thu, 04 Sep 2025 17:05:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad4d3efsm1478298e87.146.2025.09.04.17.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:05:09 -0700 (PDT)
Date: Fri, 5 Sep 2025 03:05:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, mripard@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <u72vkfojufgvuqwuqpvgvnip3wogpgdcuc7bn46zo3bp7ogbu5@fmqotgyahrsn>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903110825.776807-2-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX6m+8nFGmNCeR
 Hk108bhUJRkf8DWVlIBX7mx6qEBXWcO3m+qrT6h/VrV2DCZyYEg7RPNX0tD5QzRHCpXCdcKW5p2
 MUhWhOZnsirx0fguF+p+ORg6xvDrgUi7Lq2Ulm+0Es9x3uq2xmTfZhSRz9PNeQMye5O3eDSGv2t
 E+E187E/v9B6my/srnNoCFWk5ObczoO9t95vc37vCi27YMfSPAj0r9cGXcDjbDM09GjkPaGlUNy
 Obx+FcrG+VbMjErEY5Mdj9noYSuh2qLSNPW/BnxHk649ubLIady7g/tTXu/BGpElqf3IynE//nx
 2QvG5zIZb2ffcteMWm8T/fNzziMAJm1dddf95FlW/ggSSi/f3kx38nXj/cvt1I910B4O1Ul+5ui
 hSA1a4Dk
X-Proofpoint-ORIG-GUID: fEgoBFR-R-KdTleWi9QOTe5sByC0O9h5
X-Proofpoint-GUID: fEgoBFR-R-KdTleWi9QOTe5sByC0O9h5
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba293f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=s8YR1HE3AAAA:8
 a=kdxkXz20giiO-m4nxtAA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On Wed, Sep 03, 2025 at 07:07:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v7:
> - Rebase on latest drm-misc-next
> 
> Changes in v6:
> - Rebase on latest drm-misc-next
> - Link to V5: https://lore.kernel.org/linux-rockchip/20250512124615.2848731-1-andyshrk@163.com/
> 
> Changes in v5:
> - Split cleanup code to seperate patch
> - Switch to devm_drm_bridge_alloc() API
> - Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/
> 
> Changes in v4:
> - Do not store colorimetry within inno_hdmi struct
> - Link to V3: https://lore.kernel.org/linux-rockchip/20250402123150.238234-1-andyshrk@163.com/
> 
> Changes in v3:
> - First included in v3
> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> 
>  drivers/gpu/drm/bridge/Kconfig                |   7 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  .../inno_hdmi.c => bridge/inno-hdmi.c}        | 502 +++++-------------
>  drivers/gpu/drm/rockchip/Kconfig              |   1 +
>  drivers/gpu/drm/rockchip/Makefile             |   2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 188 +++++++
>  include/drm/bridge/inno_hdmi.h                |  33 ++
>  7 files changed, 366 insertions(+), 368 deletions(-)
>  rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (69%)
>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>  create mode 100644 include/drm/bridge/inno_hdmi.h
> 
> @@ -637,14 +584,13 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
>  	hdmi_modb(hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_INT_HOTPLUG(1));
>  }
>  
> -static int inno_hdmi_disable_frame(struct drm_connector *connector,
> -				   enum hdmi_infoframe_type type)
> +static int inno_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> +					    enum hdmi_infoframe_type type)
>  {
> -	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
> +	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
>  
>  	if (type != HDMI_INFOFRAME_TYPE_AVI) {
> -		drm_err(connector->dev,
> -			"Unsupported infoframe type: %u\n", type);
> +		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
>  		return 0;
>  	}
>  
> @@ -653,20 +599,19 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
>  	return 0;
>  }
>  
> -static int inno_hdmi_upload_frame(struct drm_connector *connector,
> -				  enum hdmi_infoframe_type type,
> -				  const u8 *buffer, size_t len)
> +static int inno_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> +					    enum hdmi_infoframe_type type,
> +					    const u8 *buffer, size_t len)
>  {
> -	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
> +	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
>  	ssize_t i;
>  
>  	if (type != HDMI_INFOFRAME_TYPE_AVI) {
> -		drm_err(connector->dev,
> -			"Unsupported infoframe type: %u\n", type);
> +		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
>  		return 0;
>  	}
>  
> -	inno_hdmi_disable_frame(connector, type);
> +	inno_hdmi_bridge_clear_infoframe(bridge, type);
>  
>  	for (i = 0; i < len; i++)
>  		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i, buffer[i]);

It's not an issue for this patch (and I think it can be fixed after this
series is merged). I took a quick glance at frame programming. It feels
like the clear_infoframe should be poking at registers 0x9c / 0x9d. And
write_infoframe then can support HDMI, SPD and Audio infoframes in
addition to the AVI. I don't have hardware to experiment (nor time :-)),
but would there be a chance to improve this?

-- 
With best wishes
Dmitry
