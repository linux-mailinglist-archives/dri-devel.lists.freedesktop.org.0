Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8FB96AAD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DC810E0EB;
	Tue, 23 Sep 2025 15:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tm5Oh3uy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD52910E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:53:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFNx8f023900
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0hsU8MaSRuqPxlzHdg+Y1wsb
 LMvJv1WUZbxn+NgjZus=; b=Tm5Oh3uy4/lpGC0FmBxPnIZaWbXU02K6peibeGQt
 D1xuy/oZRmDQrkmIedvQe0yTX/Z18yDZIIN8S5dRJh/shP7baAglZhvBDx4T5L2Q
 QooaKViQprv7jMxhrkmwVSJ2d2MLpBoHFO0Zn/YaY0H4OVoeEitoqG7gA1ZfFVM8
 6vrS5u0tE7Pp8otQn4DsM0omAcTRwYB5TyNJ6euVqtNXMMRqnub1WbC3wqpGSWM5
 W6NKQWCHA5V0A7cH/kax4BZK7pKw9iotu5ziY6vb0FSYvMM8CqLkkBewbKnPyc7j
 0F4KPevryXVUoV8p9BlNV49WRH7JmhF5Rr6DkgMIaVV7vg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyd040-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:53:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d59a4c23a3so13047391cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758642785; x=1759247585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hsU8MaSRuqPxlzHdg+Y1wsbLMvJv1WUZbxn+NgjZus=;
 b=mXPKtmxnYoU/0hEAUC+dwcTcZBOBge5oCDattm5A/hjk2dQUUQcdz1xV3F1vi55cLb
 UsHyEBZBhiOs4+pZI/MxXm874Cka0dj7UBrKorjSdlM/fTtXLcM/8QfsfkriqchSLsz9
 zAxZ7Zf2enZXstucGmMyC+zDgIizxRzS+rU+/iGyYOak0iAXXyiiEe3GwDfH9NGX3Vkx
 ZJk1uk6xX7a0Ydrc4LrHQ53mAgdEJxb/0lxcoaNOfYLw59mpNS083ueIr6pPIKKvaZO7
 oeVlUz9GbjnPOibxC5tGR0mdKUg8YZWzArTDWaHhFhS0KpqHXgG4w2x3WQd/fKR9HoEN
 lFmg==
X-Gm-Message-State: AOJu0YynNC17CUQb170XOj6iqgEzDaYWX22+aYOS8GPRSWi2nW6myqgW
 72fouCelIHtZanXVWXIrLIdwcbwJrekLyRDhf5lpING5RBOLRcVXW6DomF2v9GFUl3hskOc47WV
 b2dvbVVIQwpgyNYEO4I5Bo2xtRvfRjfsr8+ZZNhbm/nWH2HMwpzAH80D3/sdNWoQsuCcF4TA=
X-Gm-Gg: ASbGnctXZ5nysuaEXvXnAHALXWEmXhFHvIlvdfPrFpBVP841C2lLsPjrjUmLHlM/YPx
 uMal/oYUoCBw8PxSUhf0+/1DUNtHywpEJQQYh3H27knqQgqfvJq3UL7PTBQgocFgJ5b61SPJUwF
 5/zGHUpQ0roAYijudqvOxP3sK7dl6g81GLH1RQA4O06LQxq6riwilrIwz70pwEySUHXmW80pD0B
 rpXEJx/hDHMQIW8ZqbNDKdjQSEN/+paImGYqo4tTSaTv8kMz5dFFlzpqRh7NDLo1Ft/xqZ9abPl
 v38zwMh3O0X5pxtwQpHaT1Tu2nQHLNBdLbG1bqEUW5mpKKQ5b4VFq77861dYsP38L9lKoiczqvq
 iSUn6Oey4JbIRRSEjB4kCMDeUBHdcwig97dEJKWqOE7IB+7HuSVrR
X-Received: by 2002:a05:622a:1206:b0:4cc:228d:4b8b with SMTP id
 d75a77b69052e-4d3698e74f7mr34353981cf.32.1758642784783; 
 Tue, 23 Sep 2025 08:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpp0mBq5nm3cdEllJP8eHw/Mtsah7iPz9tMHUNa6gzQHiqx7Z1m9qJ3AkCZw3JYzxWMvBgJQ==
X-Received: by 2002:a05:622a:1206:b0:4cc:228d:4b8b with SMTP id
 d75a77b69052e-4d3698e74f7mr34353621cf.32.1758642784048; 
 Tue, 23 Sep 2025 08:53:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57917119ba9sm4018266e87.121.2025.09.23.08.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 08:53:03 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:53:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH 1/2] drm: Introduce a new connector status
Message-ID: <whsopn2fp4pa6mcomezcib35uxsubxtr5qtltxthbsv2apbuxl@xtxuvuyfaib2>
References: <20250923083636.4749-1-marius.vlad@collabora.com>
 <20250923083636.4749-2-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923083636.4749-2-marius.vlad@collabora.com>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d2c262 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=0z8rxhjHY4BcZuySQzsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: VTrx1CkW1y1JADkb-uno32qCNZ7o0bdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX9tlMvXK8Qgaz
 byyY1GtJ0pMrTmfdxTmD8xraV0/oKWfQsvc5F2WBRKRvAJRqfAOwn9uDstWKY+xSHhhLP4/2BHx
 sBoEoT/NNC0bamT5j2FnCPaT47Ep+eWMy8R818OniKS/Bzs2CGY23hKuCEBry3eOY8pql+54EJy
 h/O2l3rGCl9gsC9K/ubbHjCvWO+LsVXSrN7/Ield33kYqu6UzcJOp9ItmWgJT3SE96z1HHMRibV
 4EJrMe+4muZ8AtcEMlVihI7nTBCknFPu1LYwu0HIYpsB3CDtvAi/alSpx08aHtveOLQInGEuEIy
 HbEyZYqnu4fEwZ71dRsOOd3E1l74JjqotDNLlBssMIBHAfIPngawX7Z6SmPjxNRlfYR8+65vyZ7
 5VslubQg
X-Proofpoint-ORIG-GUID: VTrx1CkW1y1JADkb-uno32qCNZ7o0bdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090
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

On Tue, Sep 23, 2025 at 11:36:35AM +0300, Marius Vlad wrote:
> This patch introduces a new boolean variable used to track connector's
> connect/disconnect status and it is being used on both polling and
> the HPD (Hot Plug Detect) paths.

Please see Documentation/process/submitting-patches.rst, it has special
paragraph about "This patch".

> 
> A subsequent patch would make use of this connector status to propagate
> per-connector udev hot plug events. This allows user-space to receive
> the connector's ID, rather than having a generic hot-plug event for all
> connectors, or in the HPD path, just the first one found with a
> connection status change.

It's not clear from the commit message, what is the expected behaviour.
The flag has to be set when we've detected the status change - e.g.
monitor being plugged or unplugged. When is it expected to be cleared?

> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c    |  1 +
>  drivers/gpu/drm/drm_probe_helper.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/drm_sysfs.c        |  1 +
>  include/drm/drm_connector.h        |  3 +++
>  4 files changed, 23 insertions(+)
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
> index 09b12c30df69..a865d5aa6f73 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -629,6 +629,9 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  			mod_delayed_work(system_wq,
>  					 &dev->mode_config.output_poll_work,
>  					 0);
> +		mutex_lock(&dev->mode_config.mutex);
> +		connector->status_changed = true;
> +		mutex_unlock(&dev->mode_config.mutex);
>  	}
>  
>  	/*
> @@ -732,6 +735,17 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
>   */
>  void drm_kms_helper_hotplug_event(struct drm_device *dev)
>  {
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		mutex_lock(&dev->mode_config.mutex);
> +		connector->status_changed = false;
> +		mutex_unlock(&dev->mode_config.mutex);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
>  	drm_sysfs_hotplug_event(dev);
>  	drm_client_dev_hotplug(dev);
>  }
> @@ -748,6 +762,10 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
>  
> +	mutex_lock(&dev->mode_config.mutex);
> +	connector->status_changed = false;
> +	mutex_unlock(&dev->mode_config.mutex);
> +
>  	drm_sysfs_connector_hotplug_event(connector);
>  	drm_client_dev_hotplug(dev);
>  }
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index b01ffa4d6509..bd9161490116 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -199,6 +199,7 @@ static ssize_t status_store(struct device *device,
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
