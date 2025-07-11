Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674EB01A94
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFB610EA21;
	Fri, 11 Jul 2025 11:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Fd0iBxpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0975010E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:32:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so11150695e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752233520; x=1752838320; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/dNrxn0YIHnXxTbrqnAMkGtS4RTsd+jjEf/10Hz2GZA=;
 b=Fd0iBxpJC1mJa3LQjy+zvhVA6iWYf0SoPB1G2u1UsUPA3ZXhNSZBpcDeuY4JeZ9Jln
 MFOBfxVe9JzIsMxqPQC7YepmkFW7csEeXdgKS/tL5goQLyDBFc+v7BtH/JQxz7ZRdf3s
 n8cKcoGbEVoUpGrTR06qph2VPL9ClQo6PYUg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752233520; x=1752838320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dNrxn0YIHnXxTbrqnAMkGtS4RTsd+jjEf/10Hz2GZA=;
 b=As74bK/KEjRjp98i11+KL37wOUjSP1E9ConESs70FFwVw1DjM8SMY4I5LjGjopoFl9
 5M6L6g1u0PWW6RdPz+Pvgjg9TuAY5XKGPoKPFMbEKSRqYJhTXnq5CyNmkcorSdjmY8nE
 QicQwiz5eYHEx4Ciiu3aUB1pnfSeCwQZS8wi8v9GqKseMQTKB7VWGamGcFnoG7CGhI2A
 bPaDEdqxwgkzfXeWPg33YSIwBhiDFAzE/T7aUS+mvRrUXgpgwL2vI6igGg06CKfXqoi9
 s4rFlvJWj91F0F7A5SA+SVBKO6w3u36EeOOgS5hVGwnRtsUcK+wWsj+FCjFJmniqGJvn
 od3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJRuE1uRk4pghtNCK6c4/yBxAq66pt8v/njAjnr/C0OkPcMcdxA+44Olr/HdlU+NsPHStVPiajvUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZU8yVUUKo5PCzYp+6kb7c1HLURWZZlRm39WSJgZcmoApZ+OFB
 gU9wcq0MsyxQcwdEFvWHPYlNR1AQxRD7NxlPxA2YnQ8gTCw5UAszsZKW4iqDVj+0GIc=
X-Gm-Gg: ASbGncsbv0u/iCRCbFwsITRoX4zCETh3NW5zvSpimzRKjEK2RHWr8PMeEHASKQA1n7p
 W4kC1/tcrjCeUf8WAyD6xzVYpJ8c4k40yV3pwR85Xy2u+n0w9GptizvkGP+VbgfWGxpUfKG1S8+
 wbA11JewRvXUzntqc9CyGz6D3zbqPmkiXuy/4OBSPUEEQ5/IDVWo6t8wzzZlpI3TNleyTLLD5F/
 jjdg12Ysz637cJqkfZ48AjAnwVBmYiWEtbMFB8vtDMr8/DrholZTmLjzelVOg7KRE5dbjP9dMRw
 GRyEInZr93KijIa3apEzHX4/vLoqwl+9EgFMitdOTil4oj5mUB7egChh1GS1myGPk4Gj16Q1iwM
 JazPMXh1XSk2+ZAxJT8d2L/du2GtGLmsleA==
X-Google-Smtp-Source: AGHT+IExin2KICT09xxIWEiy7oXdoYxqzYy1rlv7xdICXXPI31huPS+YOlQR6sPcBxEiaeI5BkQrcw==
X-Received: by 2002:a05:600c:1551:b0:448:e8c0:c778 with SMTP id
 5b1f17b1804b1-454ec27d5d5mr21986325e9.22.1752233520484; 
 Fri, 11 Jul 2025 04:32:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5103c2asm81356815e9.33.2025.07.11.04.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:32:00 -0700 (PDT)
Date: Fri, 11 Jul 2025 13:31:58 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/9] Revert "drm/virtio: Use dma_buf from GEM object
 instance"
Message-ID: <aHD2LmTe238vh5BS@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <20250711093744.120962-4-tzimmermann@suse.de>
 <9058368a-0e5b-4cb5-a04f-6feaa80329a0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9058368a-0e5b-4cb5-a04f-6feaa80329a0@collabora.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jul 11, 2025 at 02:29:04PM +0300, Dmitry Osipenko wrote:
> On 7/11/25 12:35, Thomas Zimmermann wrote:
> > This reverts commit 415cb45895f43015515473fbc40563ca5eec9a7c.
> > 
> > Reverting because the fix-up commits are suspected to cause regressions.
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Are the fixes and stable tags missing in the patches? AFAICT, the intent
> is to fix stable 6.15 kernel regression.

Yes, I'll add them when merging to drm-fixes.

> > ---
> >  drivers/gpu/drm/virtio/virtgpu_prime.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> > index 722cde5e2d86..97aaee26cb02 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> > @@ -204,15 +204,16 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
> >  {
> >  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> >  	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> > +	struct dma_buf_attachment *attach = obj->import_attach;
> >  
> >  	if (drm_gem_is_imported(obj)) {
> > -		struct dma_buf *dmabuf = bo->dma_buf;
> > +		struct dma_buf *dmabuf = attach->dmabuf;
> 
> Nit: I'd write this as `dmabuf = obj->import_attach->dmabuf` for more
> consistency with drm_gem_is_imported()

Reverts shouldn't have any additional changes, even style nits imo, so
I'll leave it as-is.

> 
> >  		dma_resv_lock(dmabuf->resv, NULL);
> >  		virtgpu_dma_buf_unmap(bo);
> >  		dma_resv_unlock(dmabuf->resv);
> >  
> > -		dma_buf_detach(dmabuf, obj->import_attach);
> > +		dma_buf_detach(dmabuf, attach);
> >  		dma_buf_put(dmabuf);
> >  	}
> >  
> 
> Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
