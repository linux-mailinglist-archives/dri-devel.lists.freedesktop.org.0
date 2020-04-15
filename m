Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714371AAB36
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7241A6EA02;
	Wed, 15 Apr 2020 15:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CB56EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586962945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0EuYdE39kebv6qi4JKnmKjtG4iLkRnAmbQWQIpPHo0=;
 b=QyN15KrDNUZHfW4TjkpBcbvnPzJR1wQ+e+Lyo6vq6/qQmX3KQAyFk8FZWNuoBbAVL7cYCI
 VSC3lfDRWUGph3zbRIHCKPQG/p9q+ZXdvmoEo5Sv/1ab8mq6f9T354UGOz+HJxgIa+Wjn4
 5QzmMyX1tcDEJruPJuw+VgRtnpULMg8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-6pV5cFPaPNy956WZtfqQeA-1; Wed, 15 Apr 2020 11:02:23 -0400
X-MC-Unique: 6pV5cFPaPNy956WZtfqQeA-1
Received: by mail-wm1-f69.google.com with SMTP id f17so5062638wmm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q0EuYdE39kebv6qi4JKnmKjtG4iLkRnAmbQWQIpPHo0=;
 b=tWsXRiRJEKtKIV48+W6R2e9fNQTeyPkZL3Tn67Gj3TU7hcwGFI19Lj5J/rZl/VmU7k
 RNczswwM6EdcwbRSaWORlzDyJgMe0XYYbvrr2Z6YMWdx/UOWrCZ2rSdVOzKKnD3oUbrY
 442SLKjHgTp5ZBWhK3onuCdRWOj4kESbkQrA+vrgcKuDR1vTp7eaiDAHpBapbdkD1UgH
 WghiS8GliIT6Sed7tEYJf0K87HBrKahUbU69cEtCzfRBpaDa1UDjrUPrn1NjSq0OIk1t
 S30E0FcIGJs0OGsTUZ5nSn3kL1oYC25FTxQWfhIPPAGmm2Hfgtn+byh5ZPOVVjc3oEZ3
 +v3Q==
X-Gm-Message-State: AGi0PuatuqjWPnu47o6I0LAV21GFeL+UkXS3ChEjLYjGLyaf2DVmz4FI
 8cJzOPD0alVlLo++i9KvRN+heM4TW4sltKVh5dpr35o2QA/m3RAJCl5iGyiseQY3uNMGUcDdKWg
 6sVwkiRPdfHXKkoyoI9aZZmBpmrtw
X-Received: by 2002:a05:6000:1008:: with SMTP id
 a8mr23829887wrx.189.1586962942626; 
 Wed, 15 Apr 2020 08:02:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypJqT9IEirqvuR3V7bc7XcNVVEzGf4dD9KyUc8TaM1mHE2qBWJyA/q/wIAX4EQvfsRJtoCjRiQ==
X-Received: by 2002:a05:6000:1008:: with SMTP id
 a8mr23829816wrx.189.1586962941781; 
 Wed, 15 Apr 2020 08:02:21 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id p6sm16253295wrt.3.2020.04.15.08.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 08:02:21 -0700 (PDT)
Subject: Re: [PATCH 04/59] drm/vboxvideo: Stop using drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-5-daniel.vetter@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <21dd3550-058c-e172-b0cd-00a12ffd9fd1@redhat.com>
Date: Wed, 15 Apr 2020 17:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-5-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 9:39 AM, Daniel Vetter wrote:
> We use the baseclass pattern here, so lets to the proper (and more
> typesafe) upcasting.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

LGTM:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/gpu/drm/vboxvideo/vbox_drv.c  |  1 -
>   drivers/gpu/drm/vboxvideo/vbox_drv.h  |  1 +
>   drivers/gpu/drm/vboxvideo/vbox_irq.c  |  2 +-
>   drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++++-----
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index 7dd25c7a3768..cfa4639c5142 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -52,7 +52,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		return PTR_ERR(vbox);
>   
>   	vbox->ddev.pdev = pdev;
> -	vbox->ddev.dev_private = vbox;
>   	pci_set_drvdata(pdev, vbox);
>   	mutex_init(&vbox->hw_mutex);
>   
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> index 87421903816c..ac7c2effc46f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -127,6 +127,7 @@ struct vbox_encoder {
>   #define to_vbox_crtc(x) container_of(x, struct vbox_crtc, base)
>   #define to_vbox_connector(x) container_of(x, struct vbox_connector, base)
>   #define to_vbox_encoder(x) container_of(x, struct vbox_encoder, base)
> +#define to_vbox_dev(x) container_of(x, struct vbox_private, ddev)
>   
>   bool vbox_check_supported(u16 id);
>   int vbox_hw_init(struct vbox_private *vbox);
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> index 16a1e29f5292..631657fa554f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> @@ -34,7 +34,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
>   irqreturn_t vbox_irq_handler(int irq, void *arg)
>   {
>   	struct drm_device *dev = (struct drm_device *)arg;
> -	struct vbox_private *vbox = (struct vbox_private *)dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(dev);
>   	u32 host_flags = vbox_get_flags(vbox);
>   
>   	if (!(host_flags & HGSMIHOSTFLAGS_IRQ))
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 0883a435e62b..d9a5af62af89 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -36,7 +36,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>   	u16 flags;
>   	s32 x_offset, y_offset;
>   
> -	vbox = crtc->dev->dev_private;
> +	vbox = to_vbox_dev(crtc->dev);
>   	width = vbox_crtc->width ? vbox_crtc->width : 640;
>   	height = vbox_crtc->height ? vbox_crtc->height : 480;
>   	bpp = fb ? fb->format->cpp[0] * 8 : 32;
> @@ -77,7 +77,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>   static int vbox_set_view(struct drm_crtc *crtc)
>   {
>   	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
> -	struct vbox_private *vbox = crtc->dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
>   	struct vbva_infoview *p;
>   
>   	/*
> @@ -174,7 +174,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
>   					int x, int y)
>   {
>   	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
> -	struct vbox_private *vbox = crtc->dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
>   	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
>   	bool needs_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
>   
> @@ -272,7 +272,7 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
>   {
>   	struct drm_crtc *crtc = plane->state->crtc;
>   	struct drm_framebuffer *fb = plane->state->fb;
> -	struct vbox_private *vbox = fb->dev->dev_private;
> +	struct vbox_private *vbox = to_vbox_dev(fb->dev);
>   	struct drm_mode_rect *clips;
>   	uint32_t num_clips, i;
>   
> @@ -704,7 +704,7 @@ static int vbox_get_modes(struct drm_connector *connector)
>   	int preferred_width, preferred_height;
>   
>   	vbox_connector = to_vbox_connector(connector);
> -	vbox = connector->dev->dev_private;
> +	vbox = to_vbox_dev(connector->dev);
>   
>   	hgsmi_report_flags_location(vbox->guest_pool, GUEST_HEAP_OFFSET(vbox) +
>   				    HOST_FLAGS_OFFSET);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
