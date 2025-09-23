Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34FB93CA8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6E910E00A;
	Tue, 23 Sep 2025 01:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQP4aTFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AC510E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:10:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MH6AH7027935
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aC6xtZ2Xq3V/aoM/1E2yl/Rv
 YTGjb8DsxBZkEhoHUs0=; b=kQP4aTFzNQ2UuzbT4ikHpSFm3WaFRyXiNs2GrX1D
 NOWQh3swouH9vJ1fAxVXC6PCPqnticuckinCgv8kquP2cFLdmTNHqGDbpgIh3ic5
 HhdSV0BKnlWkJLFZeGrTyNU2cQym6INqa8JoGWm3XQiSkQd1Fv+CWSb1KePAMs2k
 wGIvF9VgWOBP9v+kIAh4IRCzFD1nQtI8BHSCyjVKIOz8cr1W+zSd/EEDTKsqq248
 YjLoM6Pq0PFnCL7+VWkYLy7Cy/zDlG7J3Z2vOWAuA+pfn3YrzhzFUnQ9mU9MG101
 Hb90tz017gvT47+qynKe99HkOwpeaZHUOOOyb39SLXiPMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajes4ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:10:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-79e48b76f68so88759706d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758589821; x=1759194621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aC6xtZ2Xq3V/aoM/1E2yl/RvYTGjb8DsxBZkEhoHUs0=;
 b=juKJyDM5dyLmn4xBv9xcjzHIiPNuscf1p+sLg7Pl3pfqZjNUS4u2TZ7xRALT4teQOq
 TJOxh/Bd0nCDkiw+Qc2Y3ympIlFo23MgNIkO0XrLiwljFwGgkZvSTskal+p1umznQo2D
 XKj/WK8KUSo7+ZKQTBtqtdWM67extsaHGWdcJg/5ogEycEYQZVzMryCzZEbHr6TWHeYT
 145oe74nG6gUf3lFMTKtx0tzncjaZwjrpTrJTtQ5Xn7SHB2cikhzNncz0i93l5NRvvtk
 WbASFa3jUwLcZ8Qk1PBhWJDwPXKoRh+FX5zxNe+gbpVc06xwyN+4yZzD5zJMmQPXc1bg
 Bb0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYBqi4LVc6+tki6BicIieV5xGUBQKoWOnitCXqYMEMqbqyL3TX7/oaad/PgqWM2WTYxGa1dnHR2OI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSBfjXtRflxiGtfH8ueKorZ67YieDA/ptceJpcG6E3JnqIvGXR
 OfcwK+CDknCS3pEYpmlKZfL7iDOve+GsVxf1z26hfIWBbDlF7AfArqKJFyt+K1Or0sx1nbtALxW
 zSzPeNg2oNxxPh3QPzi9i3YVStJCpzWgTVf/UlfzJxojjpIUTCgovLTH7vIZoylDcVKfkkCA=
X-Gm-Gg: ASbGncsxegPusOAQ4iUWHCWWsv5qAE78BlDa6n73E24FtUoywdU9SjyhFLYkHN9eY5J
 lKS/f4t3bfOiDJgztDvsAMNgDKWyoIx29F1liVnkGRy8LELEgzEww4SmtJTPvQ7g/8AdSbnR1ES
 taCbjqycyF0uE2z3EhYY9kHkUzOhQBKdYRWwDPQjbbun254WQXcHWK92ZST5kv6Jv2blhGPnOVr
 5kukAqx2rb1m/ca9hNJMgh9lEsJzKg+mKl2xuk5LhC3duOOaPG9Y4D4tychcft7AJJlyCSfk0qP
 F0oW3h+5HVVByReyGfGssI/4fO2Ph6Ti5nqUs4mNwnPguV0hGR/Sj+u3bu9nHiAPvk0vnxmmyCj
 YAKnfgynV5Kce6U+NJPQL84o0c/5H/hf/z46GstNiPw/byd1HJ5Kg
X-Received: by 2002:a05:6214:21cd:b0:75f:6116:83e with SMTP id
 6a1803df08f44-7e712ef9c76mr10311926d6.37.1758589820522; 
 Mon, 22 Sep 2025 18:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/AqhiaebrPXH+fi3RCpVWDIqMTUfClYaLPwNMtBGbndVg1ntx4aReI8HayNz/8sSGkQvDNw==
X-Received: by 2002:a05:6214:21cd:b0:75f:6116:83e with SMTP id
 6a1803df08f44-7e712ef9c76mr10311466d6.37.1758589819848; 
 Mon, 22 Sep 2025 18:10:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-579e716407dsm3036752e87.97.2025.09.22.18.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 18:10:18 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:10:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-2-kernel@airkyi.com>
X-Proofpoint-GUID: eqsfPoMjl2umvg_Mn_essCBCXBW7oq-B
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d1f37e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=BpK9xR3a_xoX_XwHwW8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX9BblRHmLSRKV
 Wu8MQpBhmjTXsIbcDh1Unr5TfyVMTMvShQmOW33hUe4Srd7AlMDodMh5+QP3wHLv1Rr3IcY8MDU
 8T88ziajd0X9EtdU8m+CLMFGJ7dD1MkN7paOQrU4admYHvnlziOaHER+q7kshN4Pn0lT9XBmIQC
 GuiOqZ+5W/xDLmEu6npK5dybUfILnH6+kltdrkH+Yco5jX82+eUhHHg7rdX13AVuu5KhJ/XqULx
 ZL2MoVDdM5NV8+HTJ2+mcaI8bJbU2FBq7NBGus6OOed1aQTor9MmfHyLRT7Wmq65I291adjn1AI
 eRBUEqhf7y9FgQ6vIwWTCXoEx3E1ypk6+Fe1DsjUeCJiKfvc9krINJxM2hMHscRmRr1XA1F+HVq
 Rpmv9bw+
X-Proofpoint-ORIG-GUID: eqsfPoMjl2umvg_Mn_essCBCXBW7oq-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168
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

On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add default DRM AUX HPD bridge device when register DisplayPort
> altmode. That makes it redundant for each Type-C driver to implement
> a similar registration process in embedded scenarios.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
>  drivers/usb/typec/altmodes/displayport.h |  2 ++
>  drivers/usb/typec/class.c                |  8 +++++++
>  include/linux/usb/typec_altmode.h        |  2 ++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 1dcb77faf85d..e026dc6e5430 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -14,6 +14,7 @@
>  #include <linux/property.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
> +#include <drm/bridge/aux-bridge.h>
>  #include <drm/drm_connector.h>
>  #include "displayport.h"
>  
> @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  				dp->pending_irq_hpd = true;
>  		}
>  	} else {
> +		if (dp->port->hpd_dev)
> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +						  hpd ? connector_status_connected :
> +							connector_status_disconnected);

There should be no need for these calls. Once the HPD bridge is added to
a correct fwnode, the drm_connector_oob_hotplug_event() calls should
deliver the signal as expected.

>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
>  						      connector_status_disconnected);
> @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 * configuration is complete to signal HPD.
>  	 */
>  	if (dp->pending_hpd) {
> +		if (dp->port->hpd_dev)
> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +						  connector_status_connected);
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						connector_status_connected);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.status = 0;
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
> +				if (dp->port->hpd_dev)
> +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> +								  connector_status_disconnected);
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  								connector_status_disconnected);
>  				dp->hpd = false;
> @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
>  	NULL,
>  };
>  
> +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> +{
> +	if (alt->svid != USB_TYPEC_DP_SID)
> +		return;
> +
> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> +						  dev_of_node(alt->dev.parent->parent));

This needs at least a comment, what is dev.parent->parent. Also, the
of_node is not correct here. It should be a node of the connector,
rather than the device itself. Consider USB-C controllers which handle
several USB-C connectors (e.g. UCSI). The DRM core won't be able to
identify the correct bridge.

> +	if (IS_ERR(alt->hpd_dev))
> +		alt->hpd_dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);

Having the function here will bring a typec -> displayport dependency
between drivers (which you didn't document). It means it won't be
possible to build typec core into the kernel, having the DP AltMode
driver in the module (which also doesn't sound like a good idea).

> +
>  int dp_altmode_probe(struct typec_altmode *alt)
>  {
>  	const struct typec_altmode *port = typec_altmode_get_partner(alt);

-- 
With best wishes
Dmitry
