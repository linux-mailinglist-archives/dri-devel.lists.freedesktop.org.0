Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418D12FEFD
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 00:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FC56E36F;
	Fri,  3 Jan 2020 23:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64DA6E35F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578092480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRyK0cYYMkehGxlm9k3Z4bRzJwH3WMWw6wR1Zk7mY7c=;
 b=O17otkwJPV6fw7kmLo4UXKSV9HMKvhI95yx5Gc9BK2ni9k5fYRKF8mHYnBMXvwHgiXkmDG
 yFHEDC4k+1z0/6zgITGiiMNB4FQU8V729GCnpL9tn9lunK86VjwlC7XBaoG9DOShYN81eS
 z2eY3ah7+rJi9aWARrtBBS6DVD1p7Kw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Auz3T8VdPZOti8juKv4JUw-1; Fri, 03 Jan 2020 18:01:16 -0500
Received: by mail-qt1-f197.google.com with SMTP id d9so25767962qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 15:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=pRyK0cYYMkehGxlm9k3Z4bRzJwH3WMWw6wR1Zk7mY7c=;
 b=OKcPK0HaabdxgAAYaV3uGY8LWjwUU92fRU9zPjPn7kqEw0NTwT5hBhxUgGFmyhjsR/
 7y0r79EYNf9RAXiNyFqc15NQ78C19eXzFu42iZYgtbqNBxImEKTFLj3gvSKTnQXC8SGU
 H4pKq2Qis9g0ubrm/XhKMzc+w0hFvpG1EqgdwT5thpAZLHG9bkrLQlYG721diiPB4Dqa
 qiD3wIhXbLT6GkhU0qcOOQnC+IzgX7P3rcb+BWBqpFrt6SZ5SL/ZqNZ9/MQ9p6f9eJEE
 oeSOIR/NiiRho0lPd3EkPkB1wDEh5dyPY8VZvUNqt5Natwf/PtDgD4IbOCMa+q5c7vkE
 Cpaw==
X-Gm-Message-State: APjAAAXlD/jVL/AtF0T1QAbSqW9DapGPm9tETHedFoUJ11xEDbXHKoAZ
 sO9IjchYrdsXfpiDV6pqw4s1zFz9b0k9epiX/dlp8tv7M30sL7GNMPzFXEGQ8uEMbi5HIrnW2D2
 NLBJaCxQxzb9TPztxNAAzzNSMiUka
X-Received: by 2002:aed:218f:: with SMTP id l15mr59267345qtc.247.1578092476191; 
 Fri, 03 Jan 2020 15:01:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyU9Ckv92edx9HhkOaoC1tTW7GXU1xDQPAJNZbR0hqdqu/+jDdtlt920k90dHv+TGKYuix08Q==
X-Received: by 2002:aed:218f:: with SMTP id l15mr59267322qtc.247.1578092475913; 
 Fri, 03 Jan 2020 15:01:15 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id l62sm17232971qke.12.2020.01.03.15.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 15:01:15 -0800 (PST)
Message-ID: <22b7ae5b1535ae51333250b12f47e4e715be3795.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Add HD-audio component notifier support
From: Lyude Paul <lyude@redhat.com>
To: Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org
Date: Fri, 03 Jan 2020 18:01:14 -0500
In-Reply-To: <20190722143815.7339-3-tiwai@suse.de>
References: <20190722143815.7339-1-tiwai@suse.de>
 <20190722143815.7339-3-tiwai@suse.de>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: Auz3T8VdPZOti8juKv4JUw-1
X-Mimecast-Spam-Score: 0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Got shown this patch at work and realized it still needed review, so I went
ahead and did that :)

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2019-07-22 at 16:38 +0200, Takashi Iwai wrote:
> This patch adds the support for the notification of HD-audio hotplug
> via the already existing drm_audio_component framework.  This allows
> us more reliable hotplug notification and ELD transfer without
> accessing HD-audio bus; it's more efficient, and more importantly, it
> works without waking up the runtime PM.
> 
> The implementation is rather simplistic: nouveau driver provides the
> get_eld ops for HD-audio, and it notifies the audio hotplug via
> pin_eld_notify callback upon each nv50_audio_enable() and _disable()
> call.  As the HD-audio pin assignment seems corresponding to the CRTC,
> the crtc->index number is passed directly as the zero-based port
> number.
> 
> The bind and unbind callbacks handle the device-link so that it
> assures the PM call order.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/gpu/drm/nouveau/Kconfig         |   1 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 111
> ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |   7 ++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig
> b/drivers/gpu/drm/nouveau/Kconfig
> index 96b9814e6d06..33ccf11bd70d 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -16,6 +16,7 @@ config DRM_NOUVEAU
>  	select INPUT if ACPI && X86
>  	select THERMAL if ACPI && X86
>  	select ACPI_VIDEO if ACPI && X86
> +	select SND_HDA_COMPONENT if SND_HDA_CORE
>  	help
>  	  Choose this option for open-source NVIDIA support.
>  
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 8497768f1b41..919f3d3db161 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -29,6 +29,7 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/hdmi.h>
> +#include <linux/component.h>
>  
>  #include <drm/drmP.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -466,12 +467,113 @@ nv50_dac_create(struct drm_connector *connector,
> struct dcb_output *dcbe)
>  	return 0;
>  }
>  
> +/*
> + * audio component binding for ELD notification
> + */
> +static void
> +nv50_audio_component_eld_notify(struct drm_audio_component *acomp, int
> port)
> +{
> +	if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
> +		acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
> +						 port, -1);
> +}
> +
> +static int
> +nv50_audio_component_get_eld(struct device *kdev, int port, int pipe,
> +			     bool *enabled, unsigned char *buf, int max_bytes)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(kdev);
> +	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +	struct drm_encoder *encoder;
> +	struct nouveau_encoder *nv_encoder;
> +	struct nouveau_connector *nv_connector;
> +	struct nouveau_crtc *nv_crtc;
> +	int ret = 0;
> +
> +	*enabled = false;
> +	drm_for_each_encoder(encoder, drm->dev) {
> +		nv_encoder = nouveau_encoder(encoder);
> +		nv_connector = nouveau_encoder_connector_get(nv_encoder);
> +		nv_crtc = nouveau_crtc(encoder->crtc);
> +		if (!nv_connector || !nv_crtc || nv_crtc->index != port)
> +			continue;
> +		*enabled = drm_detect_monitor_audio(nv_connector->edid);
> +		if (*enabled) {
> +			ret = drm_eld_size(nv_connector->base.eld);
> +			memcpy(buf, nv_connector->base.eld,
> +			       min(max_bytes, ret));
> +		}
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static const struct drm_audio_component_ops nv50_audio_component_ops = {
> +	.get_eld = nv50_audio_component_get_eld,
> +};
> +
> +static int
> +nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
> +			  void *data)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(kdev);
> +	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +	struct drm_audio_component *acomp = data;
> +
> +	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
> +		return -ENOMEM;
> +
> +	drm_modeset_lock_all(drm_dev);
> +	acomp->ops = &nv50_audio_component_ops;
> +	acomp->dev = kdev;
> +	drm->audio.component = acomp;
> +	drm_modeset_unlock_all(drm_dev);
> +	return 0;
> +}
> +
> +static void
> +nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
> +			    void *data)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(kdev);
> +	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +	struct drm_audio_component *acomp = data;
> +
> +	drm_modeset_lock_all(drm_dev);
> +	drm->audio.component = NULL;
> +	acomp->ops = NULL;
> +	acomp->dev = NULL;
> +	drm_modeset_unlock_all(drm_dev);
> +}
> +
> +static const struct component_ops nv50_audio_component_bind_ops = {
> +	.bind   = nv50_audio_component_bind,
> +	.unbind = nv50_audio_component_unbind,
> +};
> +
> +static void
> +nv50_audio_component_init(struct nouveau_drm *drm)
> +{
> +	if (!component_add(drm->dev->dev, &nv50_audio_component_bind_ops))
> +		drm->audio.component_registered = true;
> +}
> +
> +static void
> +nv50_audio_component_fini(struct nouveau_drm *drm)
> +{
> +	if (drm->audio.component_registered) {
> +		component_del(drm->dev->dev, &nv50_audio_component_bind_ops);
> +		drm->audio.component_registered = false;
> +	}
> +}
> +
>  /**************************************************************************
> ****
>   * Audio
>  
> ****************************************************************************
> */
>  static void
>  nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc
> *nv_crtc)
>  {
> +	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>  	struct nv50_disp *disp = nv50_disp(encoder->dev);
>  	struct {
> @@ -486,11 +588,14 @@ nv50_audio_disable(struct drm_encoder *encoder, struct
> nouveau_crtc *nv_crtc)
>  	};
>  
>  	nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
> +
> +	nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
>  }
>  
>  static void
>  nv50_audio_enable(struct drm_encoder *encoder, struct drm_display_mode
> *mode)
>  {
> +	struct nouveau_drm *drm = nouveau_drm(encoder->dev);
>  	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>  	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
>  	struct nouveau_connector *nv_connector;
> @@ -517,6 +622,8 @@ nv50_audio_enable(struct drm_encoder *encoder, struct
> drm_display_mode *mode)
>  
>  	nvif_mthd(&disp->disp->object, 0, &args,
>  		  sizeof(args.base) + drm_eld_size(args.data));
> +
> +	nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
>  }
>  
>  /**************************************************************************
> ****
> @@ -2281,6 +2388,8 @@ nv50_display_destroy(struct drm_device *dev)
>  {
>  	struct nv50_disp *disp = nv50_disp(dev);
>  
> +	nv50_audio_component_fini(nouveau_drm(dev));
> +
>  	nv50_core_del(&disp->core);
>  
>  	nouveau_bo_unmap(disp->sync);
> @@ -2401,6 +2510,8 @@ nv50_display_create(struct drm_device *dev)
>  	/* Disable vblank irqs aggressively for power-saving, safe on nv50+ */
>  	dev->vblank_disable_immediate = true;
>  
> +	nv50_audio_component_init(drm);
> +
>  out:
>  	if (ret)
>  		nv50_display_destroy(dev);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index aae035816383..15e4f2aa19bf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -55,6 +55,8 @@
>  #include <drm/ttm/ttm_module.h>
>  #include <drm/ttm/ttm_page_alloc.h>
>  
> +#include <drm/drm_audio_component.h>
> +
>  #include "uapi/drm/nouveau_drm.h"
>  
>  struct nouveau_channel;
> @@ -212,6 +214,11 @@ struct nouveau_drm {
>  	struct nouveau_svm *svm;
>  
>  	struct nouveau_dmem *dmem;
> +
> +	struct {
> +		struct drm_audio_component *component;
> +		bool component_registered;
> +	} audio;
>  };
>  
>  static inline struct nouveau_drm *
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
