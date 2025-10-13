Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BBEBD64DE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B310E158;
	Mon, 13 Oct 2025 20:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNZRzhsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2F910E158
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:59:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBtO003094
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ySrLifkltjX1MyeBlHP2PYxG
 vJxVD9I05Z9UyzULgc0=; b=gNZRzhsNzNZJIeN27FEt2JANa184xNXwZi/jDXia
 NReWbxnQFjpMau9jGzG0g0/UaxGJpbiVHMrVEV+iSVfvK1DuBSeBFeGjYZL/u+Ls
 cuOqmcePe6AIB+j1fN46U9FZEq0XU6AD04DoAqweAAJnr0vTtYUr4UcUutEAr+m7
 5r8KgHAmHvCq7vmGeKwH9841UM8bKj3ajBStl+50SdcpfZFYaF1pSfBeJ1KrhQ/x
 pO4/EpY46lDd4f5SzYCQ2JB1M0/3yZni831wCb/4SbWcf6/cny36rA1kJUfC05E0
 9bjlutOVTVHICrMQmSD7CWc/CgnnB4gbAlYreyDytXs5kA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0p599-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:59:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-88375756116so480118285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760389153; x=1760993953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ySrLifkltjX1MyeBlHP2PYxGvJxVD9I05Z9UyzULgc0=;
 b=DFGs6I2N//bXWnTeNGs3sx9LXJFbp1HBn3s+261zP0I9uOhrrRVdfugfVkebbNOdHW
 5nrI/ieBLutRJpgOAM/E+lrptgrRS3qSCMlfI7oTzws7nJV0lc/5WnxuHkEUxxNxpbLx
 O6eJprEMXDASMuYBnC7hyBob4gRhBzHhqRndMJMPF/ZA5KHiypvulmQAecRW+n2nll6Y
 nEjT5IR3RDx9xY2oNC5wgRQ7VoumZWKNtU3EWnPSbHb0aneI2COZPGWep5EGFdrmV8ZT
 D7PHrfh4wpWe2JY28qtesN4bLtHLdQ7ExWPpkVIwuj4JLEj+PqNTLgitclAeUO0hUBUN
 u5UQ==
X-Gm-Message-State: AOJu0Yw7eXL/vdZa/4/PMl3PDctDK1+/TVn4JfDQNJ/gJ5ORcHHyTqD2
 w8I8C4pH3F21afMbw81ewfd/rnWijUn+0aEsiHjeC6FfEKvLpLMWjNQ1S1ThR2xFxCBCyUgfcvr
 9poCZsGjKDprCc6c6tnMicLpIiSrIjiIuNetNIDC9uy5xto74OOEfkON0IpmwuUaY+5hImis=
X-Gm-Gg: ASbGncsxprR/L+tvYTbExGIXdcgJQ5pqywyqoBi4ifb7e3OtxdwfrnDeiCcbgGLE28U
 3IQI27UaqHKGndAIbem+jnZWn2lwgXMwW3X6Pe5zzjUaXsnNnHH9+7xFa/dAkO7SedtLzA3BrC0
 csMzCrhF/RC2O9z2bD5t7Lf1h82l25/ff9dBSgExo6NTJIrjVfuIFKq3cew2V3T+++1Hy+JNQA2
 dYY42HXhg8af3SD6RGSsTuWk4HaZADEINWG27MMjfCuogWdyMPuYKolKCL31YQl9V+G7XaBxYGu
 zY9VQPhsT7YpvxHOvEErfoUTLQ4gOeD3zrZ33OP2kX3TXNNL1n1LcKSGXBZO1WHAnhhiuGk42Lz
 WiRul1K5t4RFz1zGB8NbHOHlymP5iwaeQbLxl+1odLowD+hVQeEwQ
X-Received: by 2002:a05:620a:17ac:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-88353b33b3emr2867038985a.53.1760389153332; 
 Mon, 13 Oct 2025 13:59:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDcNjBXnK6hzJ9vsR2bUTJhKX6nknppdpL1zRylepA4C0kgR1fgp6jvWThoAE+XD38Yq28FA==
X-Received: by 2002:a05:620a:17ac:b0:85c:bb2:ad9c with SMTP id
 af79cd13be357-88353b33b3emr2867037285a.53.1760389152901; 
 Mon, 13 Oct 2025 13:59:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881f8651sm4441041e87.30.2025.10.13.13.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:59:12 -0700 (PDT)
Date: Mon, 13 Oct 2025 23:59:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <lq2etybizdf3jqregv2gj64u3kwdtmz3ly23c7wy4chjue7agx@2n6ehezkahz3>
References: <20251013143658.25243-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.b5126fec-b83c-46dd-9f18-6b82f3894607@emailsignatures365.codetwo.com>
 <20251013143658.25243-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013143658.25243-3-mike.looijmans@topic.nl>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1KW5mEdoDMIq
 z3J18MiB8N59uCA01SZPmDrBG9O9q2FGGTYKlTst1ZGdZGy6E16MbDqWaFk0142vl1wtaONmJPF
 Twrm/KlcwYL26Jn1sVLqwbz+5N+r1vy5Y9CfJmy1lBybSJ6J6bPP98DjQjq5E3ZyfdthbzThao1
 UiNRASv151XyBtedV8Qup0PomuW8DdUNhD1/3QyxSGSzLly10yuoiaa7uPz8Lhw94mfazMcBBzj
 DS22V7I8RDveqluGff+qdUNK0f8I0mMD4hAn1wzmgyqcvfINtwemSv2XTelPZs4Lh4y6O1a8sr7
 O3n3KVUQgmJc0YVmx1wu21bM62j0vxU7L2SN733KuIFKxUbT44FS+kbnHZP9H8iUuowv7jqxDT7
 MryyfonmIM45CmFtXS7dKFlc85qRdg==
X-Proofpoint-GUID: jxFMgmv5TXCB0TnVsatQgDPnqbk2E3vL
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed6822 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Z6EfDJrRAAAA:8 a=EUspDBNiAAAA:8 a=vJdPPGod3d2eY7P0RLwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GLvejNd0Yr38jcbvy3o4:22
X-Proofpoint-ORIG-GUID: jxFMgmv5TXCB0TnVsatQgDPnqbk2E3vL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Mon, Oct 13, 2025 at 04:36:50PM +0200, Mike Looijmans wrote:
> The tmds181 and sn65dp159 are "retimers" and hence can be considered
> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
> FPGA into a valid HDMI signal, and it will typically be inserted
> between an encoder and hdmi-connector.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
> Changes in v7:
> Add DRM_DISPLAY_HELPER to Kconfig
> 
> Changes in v6:
> Add DRM_DISPLAY_HDMI_HELPER to Kconfig
> Change "ti,mode" to "ti,retimer-mode"
> 
> Changes in v5:
> Really added vcc/vdd regulator support
> "oe" gpio is now "reset" (reversed logic)
> devicetree enums ti,equalizer and ti,mode
> Always disable HDMI_SEL (formerly "dvi-mode")
> 
> Changes in v4:
> dev_err_probe, this_module, of_match_ptr
> Use fallback compatible
> Add vcc-supply and vdd-supply
> 
> Changes in v3:
> Lower-case hex values and use defines for EYESCAN registers
> Remove equalizer code (unlikely to be used)
> Remove attributes (no longer useful, undocumented)
> Fix build for 6.17 kernel
> Use devm_drm_bridge_alloc
> Sort includes and add linux/bitfield.h
> Check chip type and complain on mismatch
> 
> Changes in v2:
> Use atomic_enable/disable
> Use #defines for bit fields in registers
> Allow HDMI 2 compliance
> Filter modes on clock range
> Use cross-over pixel frequency instead of manual overides
> Devicetree bindings according to standards
> 
>  drivers/gpu/drm/bridge/Kconfig      |  13 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ti-tmds181.c | 427 ++++++++++++++++++++++++++++
>  3 files changed, 441 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
