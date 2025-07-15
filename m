Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCAB05AD2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9BB10E390;
	Tue, 15 Jul 2025 13:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iOC+mIX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8CB10E104
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:07:56 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso3413573f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752584875; x=1753189675; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vhalk+tFLZLcoAcVW7SM+79/QnX7jEAgMagSpNChQks=;
 b=iOC+mIX/YvvgoKYr29TQaOR+cBKdPNGwnVRUK/l7YrOEIUADSMd1pcdIyWJn/vgBSa
 KF1PlE6Yxeau0WqaORHmxMroTmiR7BwVgVoxIzLgqzJU+nIjSq/UMD696o2fqDjrGVLE
 5+KVda7qJJ5ldXxrFKWG4ydTdcWNhhhh6gcqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752584875; x=1753189675;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vhalk+tFLZLcoAcVW7SM+79/QnX7jEAgMagSpNChQks=;
 b=Z0nJq1OLmwZJMtniGzyIKZBT3rFsm2h+ImYcFiQHuoi6LefO6zePGU77ruUNL9VIXL
 xTQKv6Xv6cEBJfIqNXSs/xNxulRw/6I09T9pqSV2A+rBJh7gyLpZF2PJ2nnXHazS+O6s
 irYpY3+2E4hXf70AxP1rHE5KePN9itiR8nE2ZjpIRGNdJpQYGso5Ou+MXft4Ws+NIzVV
 KuAJtiQSh9lNX/ySDRGz3kr7lOu6yF/kzaL1wvX2i8SCjH+Y/bd3fdtBYBVNmDa8Fri5
 uMGycUOoeaP44yYfv8BtA0ZIjAYCQxpVOtO2IExqGG3HV3xwctcCwSfqRWOtNg14wIR2
 F3Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/B9KqLL6TiNVcbLv7euhx9+acQKnYXzI0JX7XEaC+/4AlnJOTamMyygdpckd85MJ0OE7kz7+yAlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLK4evaivM+w9A5lIiEwVtv3/+ua9YLxgAiOJ48yl8etGcmP0+
 /DjkfZ71CXROQSWCH7zAifr/f/WYaOqOSxRCr7hXFLM4AZ6uLRMxt6Pi9aWzYD288BQ=
X-Gm-Gg: ASbGncsGjYBHBwrnSFCfcmyNXObRpVfPGOvJdBvd2K2TABxFLGHPyOdlU6I67pOn7tb
 UdJgnCtZBg2hO5PXwo1vL1pXEdKBVba0gQERgL7F/ZK60LLMoOh4uJKUEvN0pKjk5ySIpPciQeN
 BcInhZp3/pP9ZzeeTotUzmSqyXi4dnj1kYNR6vDjYnN9OgFyVu3VmVy9jKkLwMukpSTRlnYsxHq
 3tW2MqBwCGoD5756Y6jRU/z2gUkGYW5ngw/gdjEo8LdEBgOE+spoIg1z2tJZpPzTba7itNmEMRr
 M4HAdj8xUZ/mtYhnsN5ajvYosaMcdqvoAOhwE40fe3GEhlmaX1OcXc7EmCSsCv9diGYA+4Oxmt/
 5UIh/fsk9R4I41IB8wbiC6KI1hDkPFMi2tHNtzphFklbG
X-Google-Smtp-Source: AGHT+IFvjJv0iQ1esKVhC2U9EfqSY36m9csxovxVuTxGwCMaO1aKfhcXc28AxThBk/EuVM6f1XOsAA==
X-Received: by 2002:a05:6000:2c09:b0:3a3:63d3:369a with SMTP id
 ffacd0b85a97d-3b5f188e822mr16534712f8f.25.1752584874381; 
 Tue, 15 Jul 2025 06:07:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d76fsm15422563f8f.64.2025.07.15.06.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:07:53 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:07:51 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, simona@ffwll.ch,
 airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com,
 christian.gmeiner@gmail.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
Message-ID: <aHZSp3BBBgS0p88B@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <aHT6i723ffg2_m2v@phenom.ffwll.local>
 <7053d7c9-62c1-480c-bca6-ca8ad6ca49a0@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7053d7c9-62c1-480c-bca6-ca8ad6ca49a0@suse.de>
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

On Tue, Jul 15, 2025 at 09:41:12AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.07.25 um 14:39 schrieb Simona Vetter:
> > On Fri, Jul 11, 2025 at 11:35:15AM +0200, Thomas Zimmermann wrote:
> > > Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> > > in the affected places. Also revert any fixes on top. Separates references
> > > to imported and exported DMA bufs within a GEM object; as before.
> > > 
> > > Using the dma_buf as the one authoritative field for the DMA buf turns
> > > out to be fragile. The GEM object's dma_buf pointer can be NULL if
> > > userspace releases the GEM handle too early. Sima mentioned that the fix
> > > in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
> > > framebuffers") is conceptionally broken. Linus still notices boot-up
> > > hangs that might be related.
> > > 
> > > Reverting the whole thing is the only sensible action here.
> > > 
> > > Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
> > > 
> > > Thomas Zimmermann (9):
> > >    Revert "drm/framebuffer: Acquire internal references on GEM handles"
> > >    Revert "drm/gem: Acquire references on GEM handles for framebuffers"
> > Ok, I think all the below we should still apply for -fixes, because
> > fundamentally gem_bo->dma_buf is not invariant over the lifetime of the
> > buffer, while gem_bo->import_attach.dmabuf is. And so we blow up.
> > 
> > For display drivers the handle_count reference mostly papers over the
> > issues, but even display drivers are allowed to keep internal references
> > to the underlying gem bo for longer. So there could be a bunch of really
> > tricky bugs lurking.
> > 
> > For render drivers it's even clearer, they don't have framebuffers as
> > objects, so there the fb handle_count references does not help.
> > 
> > I'm not opposed to trying to unify these fields for imported dma_buf, but
> > currently they're just not. Hence all the reverts.
> 
> Thanks for the write up.
> 
> > 
> > The patches also need Fixes: and as needed, cc: stable added for merging.
> > With that and the above text as additional justification added:
> > 
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > 
> > Also we'd need to chase down any addiotional conversions that have only
> > landed in -next meanwhile of course.
> > 
> > ₣or the handle_count patches I'm less sure. I don't think they're
> > justified for fixing the gem_bo->dma_buf NULL pointer issues, but they do
> > probably help with the GETFB/2 confusion Christian has pointed out.
> > Personally my preference is:
> > 1. Apply the two reverts.
> > 2. Create an igt testcase for the GETFB confusion
> > 3. Figure out what the right fix for that is, which might or might not be
> > the handle_count reference of drm_fb.
> > 
> > But with my maintainer hat on I don't mind about the exact path, as long
> > as we get there somehow. If you decide to do land the reverts, they also
> > have my:
> > 
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Let's first revert all the dma_buf switching in drm-misc and other trees.
> They should
> be easy. If we revert the framebuffer-related A changes first, we might end
> up with
> these intermediate errors again.
> 
> There's no hurry with the framebuffer changes. We can address them after
> upstream
> picked up the dma-buf reverts.

Yeah I think that's the most prudent path forward, otherwise we might
accidentally regress linux-next in an avoidable way.
-Sima

> 
> Best regards
> Thomas
> 
> > 
> > Cheers, Sima
> > 
> > >    Revert "drm/virtio: Use dma_buf from GEM object instance"
> > >    Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
> > >    Revert "drm/etnaviv: Use dma_buf from GEM object instance"
> > >    Revert "drm/prime: Use dma_buf from GEM object instance"
> > >    Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
> > >    Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
> > >    Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> > > 
> > >   drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
> > >   drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
> > >   drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
> > >   drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
> > >   drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
> > >   drivers/gpu/drm/drm_internal.h               |  2 -
> > >   drivers/gpu/drm/drm_prime.c                  |  8 ++-
> > >   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
> > >   drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
> > >   include/drm/drm_framebuffer.h                |  7 ---
> > >   11 files changed, 35 insertions(+), 106 deletions(-)
> > > 
> > > -- 
> > > 2.50.0
> > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
