Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PxpAAobdGnS2AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 02:06:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3C7BDF7
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 02:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6610EC12;
	Sat, 24 Jan 2026 01:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F1bRYiy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65D410EC12
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 01:06:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1C7281A2A41;
 Sat, 24 Jan 2026 01:06:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C99A660760;
 Sat, 24 Jan 2026 01:06:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACDB3119A836A; Sat, 24 Jan 2026 02:06:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769216769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yVcNQe5CVuMwqB3e4Nejf9DQznk27DfMCyjqn6VJXgM=;
 b=F1bRYiy2zKp+8/TNzT2/DTi6JZ3DiKxxT0Ij8Ape7tNpSxgyHnPtc/bCYoZMC3tVNkSnbr
 2grEbI8VLPlBOr/A2k6nl/1cY01vZkID45xhuekd4jxNn4PMkQkwMEwCfyD9905olOgyo5
 lbN2xqdmZBzpkPlljrqM5n9fxdbTe04Wak9hI+wuHr3LzAcDRhQDFe+auoTZeaOo/BofzI
 EPwcTeVtf046pXT8SisnppJmwC95Ei3FkCtKz0lticllLWPgOtwZK5gXtEqn2mWSYSWH0o
 /gjWgVX6Oaml2wMnAK1L6LPDKaJX7fT2KrB2x6Uk3zGs6TUQeX4ignhHTcfPrw==
Message-ID: <b331c39f-f38b-4ff8-94f0-563dab202561@bootlin.com>
Date: Sat, 24 Jan 2026 02:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] vkms: Pass the vkms connector as opposed to the
 device on hotplug
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Daniel Stone <daniel.stone@collabora.com>,
 Ian Forbes <ian.forbes@broadcom.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Marius Vlad <marius.vlad@collabora.com>
References: <20260123-hot-plug-passup-v6-0-aaaf61d960bb@collabora.com>
 <20260123-hot-plug-passup-v6-4-aaaf61d960bb@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260123-hot-plug-passup-v6-4-aaaf61d960bb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:ville.syrjala@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:daniel.stone@collabora.com,m:ian.forbes@broadcom.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:marius.vlad@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,broadcom.com,oss.qualcomm.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2DA3C7BDF7
X-Rspamd-Action: no action

Hello Nicolas,

On the principle I agree with this patch, I just need to take time to 
properly think about lifetime of vkms_config vs connector and pointer 
validity to avoid use-after-free / null pointer dereference. I will try 
to review it next week or more probably just after the FOSDEM.

In the meantime, if you want to try / think about the possible issue: I 
think there will be a use-after-free if you unbind the driver using the 
sysfs interface and interract with configfs interface.

Thanks a lot for this series,
Louis Chauvet


On 1/23/26 20:44, Nicolas Frattaroli wrote:
> From: Marius Vlad <marius.vlad@collabora.com>
> 
> By passing the connector rather than the device to
> vkms_trigger_connector_hotplug, vkms can trigger connector hotplugging
> events that contain the connector ID.
> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/gpu/drm/vkms/vkms_configfs.c  | 2 +-
>   drivers/gpu/drm/vkms/vkms_connector.c | 6 +++---
>   drivers/gpu/drm/vkms/vkms_connector.h | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index d6e203d59b45..63a27f671e6a 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -554,7 +554,7 @@ static ssize_t connector_status_store(struct config_item *item,
>   		vkms_config_connector_set_status(connector->config, status);
>   
>   		if (connector->dev->enabled && old_status != status)
> -			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +			vkms_trigger_connector_hotplug(connector->config->connector);

Here connector->config is valid, but connector->config->connector is 
probably invalid if the driver is unbind. We may need to add some 
refcount to avoid this kind of issue.

The other way around, I think there could be issue if the configfs 
folder is completly removed (that possible, there is no way to forbid 
deletions in configfs), the config object is freed but maybe used in the 
"DRM" part of VKMS (for connector status update maybe).

>   	}
>   
>   	return (ssize_t)count;
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index b0a6b212d3f4..cad64eff72ea 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -88,9 +88,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
>   	return connector;
>   }
>   
> -void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
> +void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector)
>   {
> -	struct drm_device *dev = &vkmsdev->drm;
> +	struct drm_connector *connector = &vkms_connector->base;
>   
> -	drm_kms_helper_hotplug_event(dev);
> +	drm_kms_helper_connector_hotplug_event(connector);
>   }
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index ed312f4eff3a..7cd76d01b10b 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -28,8 +28,8 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
>   
>   /**
>    * vkms_trigger_connector_hotplug() - Update the device's connectors status
> - * @vkmsdev: VKMS device to update
> + * @vkms_connector: VKMS connector to update
>    */
> -void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
> +void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector);
>   
>   #endif /* _VKMS_CONNECTOR_H_ */
> 

