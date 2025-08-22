Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03AFB32471
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11BA10EBCB;
	Fri, 22 Aug 2025 21:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNKFBTLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7BB10EBCB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:30:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHVHns021296
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=K3cYnrvKK4mhHukBokbvlM2E
 5ZvRA8F45PiHRCM8eU0=; b=pNKFBTLdp3s0SaZ0VE6ZFwnfCw/8o+c4sxhPxbqx
 zpxYkwY8UY45hUj/Sxrjl7dfuhcZi9ZBGfe7lPXk/Q2MgFQSSzH9JifK09hoOvCU
 ewCCH5Tu4BJKLjNogP+WGKWbjUXOKH2w7V0vEVQxpg05qw/10ehybSuQiuHWHlpk
 363L8J9zwwTeXxGeouKcYPz9cGk/sEqf/qI4SI/jYB74QWVh/S1HrCv0bEUiTwMw
 mKJQuicm/wz3nTRwAwjIvkFu5XMFp/++U5KtfEUT3jAtrcNof+qz/vdt+W6n3quO
 VlXnm41JYxfZZB+qAZnozFHSjsTDZcyHhoz+tLEHkKA07w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw13gh29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 21:30:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b29a0b8a6aso68554181cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755898233; x=1756503033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3cYnrvKK4mhHukBokbvlM2E5ZvRA8F45PiHRCM8eU0=;
 b=eEntTAD294rRSvS+begk3ZEm56NkVboJcvYC6kSJ9xP5vkWj1pNDckU25Z8iGPMFD7
 ige6bJshiJ/JwrckvNDRxVxqIAMT68jZCCeMgt4asbTm18NWhbjdPUPyUMc00bhd6+Ra
 5PfPAk0KF2ENqwcuJrkrJzcND4PCsCUs5w0XAR2jAEE14oZXTHhJIZP9C31/SZbwEVe4
 AbaxuFREsbU7wzZq/Rdo1u7FESAa5nyAHGRwqt07HI+TD6rcoKT1aTJVh/y2pSvKI7tG
 5BSI0HrBIqv6UOM38cQk+cREDiCWgItCf6pxsPsGrK41QqWteAAMcuhBuXb53yJwBOxO
 JUPA==
X-Gm-Message-State: AOJu0Yx5y40GObC0JfweSSdIGL88fIYyFwS+NfkZxKrkDLSHOXrsQ0F2
 j2ftDmGRwLcK5cdRKtzkgyCL5IrOVkhMaCLoB49Jq23LThTcDIYCibgpgTynh3pk4P1fxJOjrz9
 bcNwikofW5AzgISIM1Kdx7JDrUUKv0xvyLy3jDOZgow/sFGvahFcv6UxYkE+ey8zs/leRfAE=
X-Gm-Gg: ASbGncvYDROqttXxlfAN9li1J8GFxubh3DqBRq1ZNIsgbVkvgC7uWVxqy4Fe+cekEX5
 X5d1ckPhMdwKytkknOAxgpJcES92vZoXHpjL7fQvIdnqAqNQAV6n8yfo8lMBJJN/xZdYGZhuf8C
 U9VdPjRxfgE0KFeSAoPlRoY0NOPDPy58Buuv+FgE8XYO3Czdg6UZiTd9QuvNRONd9g6GZvxG2Mz
 BW5n2ppZvdW2sHR8AnCvkN0WLI9rdI9zJaoRZuiOGGoo8jcSH8QP5XeqVtxHh6Qr4Ax9frP8eo1
 Huhv9bpn6PhWS9UiPm7ptIi7c39n6f8WFZwco5Bjt6RsTlHJ1t2qnFQHB2CBnQ0/A/n+tWJRTvA
 CRk8EIXf1r5QaOCOUVmOfkqfPglzcvMtHbSds+iflz00d8PnLcgWC
X-Received: by 2002:a05:622a:486:b0:4b0:ec28:6fee with SMTP id
 d75a77b69052e-4b2aaaf9a16mr60011521cf.38.1755898232422; 
 Fri, 22 Aug 2025 14:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalw4tfcyoY3q+WzkqkrtQCzH0eRtrlr+WbjIlyYLzc0gIsv4VtglLs8MsDt/kD+TaiThLjA==
X-Received: by 2002:a05:622a:486:b0:4b0:ec28:6fee with SMTP id
 d75a77b69052e-4b2aaaf9a16mr60010801cf.38.1755898231446; 
 Fri, 22 Aug 2025 14:30:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bb19sm150718e87.73.2025.08.22.14.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 14:30:30 -0700 (PDT)
Date: Sat, 23 Aug 2025 00:30:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch
Subject: Re: [PATCH v2 1/2] drm: Introduce a new connector status
Message-ID: <kd3hwsrsves5tc42code3r5ueiqzxekjz2strijlcrhhydwic5@otohedg77l6d>
References: <20250729165708.9947-1-marius.vlad@collabora.com>
 <20250729165708.9947-2-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729165708.9947-2-marius.vlad@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXwH9jZnELKLXI
 FsykxHrgedLVdvvJsMYTMwLVBY7iFbhT9QKsthF0ciGZLCepSh9iZl7pFOkdqeQi0mM5dDj4rJo
 RAbhJ2nwKfWH9aoOek5StrSSvuEqS4/VX7CZRTMgYIftgeMdJ0QnWCYTHq4pv1o5rgiSDXm5ZB1
 YjpQXCvXytXXNtbpfeC0pkDdGcp+t/rXJwYMV10bvnYWmfXbqrKcn+UqSwFUKTDrdl/VHVhGgWz
 vGvd91fGe7FsQAUAWXhwlMFt7l3B0sZkgzKucAT0Zdoc7HbcYYlAFkRaXiI8gqVkwxQldDZHLB2
 vKmzI65ko0yP/gLL+8Zmz/8C9cgmqV0UoMOa75YiiXPhdcQlN1CWoI1sL4hw3TNWZ350jRdOp2F
 1DbzdX1R
X-Proofpoint-ORIG-GUID: KNwiLykqynCb_RkUfKXAoGkm5YYWQ6sU
X-Authority-Analysis: v=2.4 cv=F6NXdrhN c=1 sm=1 tr=0 ts=68a8e17a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QX4gbG5DAAAA:8 a=TRIvmjwQPL6R-e3u1AEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: KNwiLykqynCb_RkUfKXAoGkm5YYWQ6sU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160
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

On Tue, Jul 29, 2025 at 07:57:07PM +0300, Marius Vlad wrote:
> This patch introduces a new boolean variable used to track connector's
> connect/disconnect status and it is being used on both polling and
> the HPD (Hot Plug Detect) paths.
> 
> A subsequent patch would make use of this connector status to propagate
> per-connector udev hot plug events. This allows user-space to receive
> the connector's ID, rather than having a generic hot-plug event for all
> connectors, or in the HPD path, just the first one found with a
> connection status change.

This looks good, the main question would be, what prevents a races
during modifications of this field? I think it should be toggled under
the dev->mode_config.mutex.

> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c    |  1 +
>  drivers/gpu/drm/drm_probe_helper.c | 12 ++++++++++++
>  drivers/gpu/drm/drm_sysfs.c        |  1 +
>  include/drm/drm_connector.h        |  3 +++
>  4 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..3c6628ee3096 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -274,6 +274,7 @@ static int drm_connector_init_only(struct drm_device *dev,
>  
>  	/* provide ddc symlink in sysfs */
>  	connector->ddc = ddc;
> +	connector->status_changed = false;
>  
>  	INIT_LIST_HEAD(&connector->head);
>  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 6b3541159c0f..761766181e99 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -628,6 +628,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  			mod_delayed_work(system_wq,
>  					 &dev->mode_config.output_poll_work,
>  					 0);
> +		connector->status_changed = true;
>  	}
>  
>  	/*
> @@ -731,6 +732,15 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
>   */
>  void drm_kms_helper_hotplug_event(struct drm_device *dev)
>  {
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		connector->status_changed = false;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
>  	drm_sysfs_hotplug_event(dev);
>  	drm_client_dev_hotplug(dev);
>  }
> @@ -747,6 +757,7 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
>  
> +	connector->status_changed = false;
>  	drm_sysfs_connector_hotplug_event(connector);
>  	drm_client_dev_hotplug(dev);


What would be the rule? Should it be unset before or after calling all
the notifiers? Otherwise it's really strange. In the chunk below you set
the flag, then it calls this function and the flags gets immediately
unset.

>  }
> @@ -1041,6 +1052,7 @@ bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
>  	mutex_unlock(&dev->mode_config.mutex);
>  
>  	if (changed) {
> +		connector->status_changed = true;
>  		drm_kms_helper_connector_hotplug_event(connector);
>  		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
>  			    connector->base.id,
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 60c1f26edb6f..77f880654d6a 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -196,6 +196,7 @@ static ssize_t status_store(struct device *device,
>  		return ret;
>  
>  	old_force = connector->force;
> +	connector->status_changed = true;
>  
>  	if (sysfs_streq(buf, "detect"))
>  		connector->force = 0;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..e4310df3d55c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2146,6 +2146,9 @@ struct drm_connector {
>  	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
>  	enum drm_connector_force force;
>  
> +	/** @status_changed: if the old status doesn't match current connection status */
> +	bool status_changed;
> +
>  	/**
>  	 * @edid_override: Override EDID set via debugfs.
>  	 *
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
