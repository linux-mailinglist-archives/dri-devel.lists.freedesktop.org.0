Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67581B03EE4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55FF10E48F;
	Mon, 14 Jul 2025 12:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hMmxChMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A96410E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:39:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so3538668f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752496782; x=1753101582; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XErAJu/6i7g4EFf9vKNbP+OcUQZQKENL92ttAjzjYEU=;
 b=hMmxChMMCbhPzyyuptZxZaXBxuD0tslMaJRY0Nm5C9cA3kgSMkuENLgAisV6yeVXfz
 JnJ7Kx35V86OdutNWKu4gLg/cohNlpFRCIVFDsl8tJwwhnQTVY0PBF8jdRwYjjcxEvco
 5pV2j8FaqZlfj/CAfxZ2ELmtQ7o9aP2BrwJDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496782; x=1753101582;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XErAJu/6i7g4EFf9vKNbP+OcUQZQKENL92ttAjzjYEU=;
 b=KJLH+G+sGs90U6w+EvftCx0wElWVuP+i6nhYoOd2kmUftNShRagjdE/0tbPIx/S2dz
 F7SaYs5Net56zNeD6LuALyhrGx02V3NrfDYcXQD6087muoiJGDVxpBj6YYUVK00wDh5n
 fPux37/a7f5nbkQ17Cy7tiI/iRTzb9GqRMtlc2PVta+4ueWzfbxm2C9BjilSVVI3mldi
 ST+nygAWh83B/DMWpPkbDtFXCF/o440zPhg0gk2oHfnyTUwuY6dcz/TllF1sRAgVCK6a
 aAIPP78rDnKYt9t1pJY8uufR8tb6Sq5omNmrH0bHTY+WWFRrmo58gMaqA/EuLXO4DUz+
 QkKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtzt8jfS6bf6lnYksRl/c5Ptr7bceaYKiO7Hwqq/jWkC4bZ6mTj7CochMw0Lt3Tkt3g1Q2vK/8yao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5gtxDpA5UmoGK/x+4l8onHeXdX1C2CSmgaZu60iFqKnAhU66T
 7W/zggzcy+l9cBvMAv+Eni+i+K7nvEcvPTLaFQDV4I5CP2YDPMhhSiZ7WfvToaKJBY0=
X-Gm-Gg: ASbGncuOO+U695FPg4qMy3bNg8O7yh5tNBMs6zF4DPk/ko2iL4x7XmS8MW2fbuUuYxx
 7Ir5KA3tOSHA3aMf7o4Yc4PwDt8rU7vNTbSP6SpTQBxdQURxNV0IW1+RUyelUfVLgnQivHbq5qS
 MzoWmxm9S1K03eUHSc+cdtq00GXi5omnUsPqb9KgxAcwQSul1lFuwGOgYUbnPx9skiFTTWCH1bJ
 d9iiqMCcJmotJE7oQV4uKWzwXI9mJ7tVQ+BFMdpFqTcZnruC4PWfsRE+QWkwovG18m/AKmHmsyW
 X1lpNKPz/+ohcdsHOAm3T9+qPstslkL8wYIyGG+bHfcsqNeYez6cXy7Qu0naI5fShnxQSjSpXlT
 xZ/yMuYrptYHL4QonUBrLccd9kPCjFFoIjdQrrq4J+s6k
X-Google-Smtp-Source: AGHT+IG6tSn1rFwzUvQrU3dFhdLGnz5/j4mh9qiCr0au1QUPGoiO9awMtbUHlEtASqVdx2HXNSxeBQ==
X-Received: by 2002:a05:6000:25f6:b0:3a5:2875:f985 with SMTP id
 ffacd0b85a97d-3b5f18ffd7bmr10766504f8f.59.1752496781706; 
 Mon, 14 Jul 2025 05:39:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26938sm12188789f8f.89.2025.07.14.05.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:39:41 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:39:39 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
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
Message-ID: <aHT6i723ffg2_m2v@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
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

On Fri, Jul 11, 2025 at 11:35:15AM +0200, Thomas Zimmermann wrote:
> Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> in the affected places. Also revert any fixes on top. Separates references
> to imported and exported DMA bufs within a GEM object; as before.
> 
> Using the dma_buf as the one authoritative field for the DMA buf turns
> out to be fragile. The GEM object's dma_buf pointer can be NULL if
> userspace releases the GEM handle too early. Sima mentioned that the fix
> in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
> framebuffers") is conceptionally broken. Linus still notices boot-up
> hangs that might be related.
> 
> Reverting the whole thing is the only sensible action here.
> 
> Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
> 
> Thomas Zimmermann (9):
>   Revert "drm/framebuffer: Acquire internal references on GEM handles"
>   Revert "drm/gem: Acquire references on GEM handles for framebuffers"

Ok, I think all the below we should still apply for -fixes, because
fundamentally gem_bo->dma_buf is not invariant over the lifetime of the
buffer, while gem_bo->import_attach.dmabuf is. And so we blow up.

For display drivers the handle_count reference mostly papers over the
issues, but even display drivers are allowed to keep internal references
to the underlying gem bo for longer. So there could be a bunch of really
tricky bugs lurking.

For render drivers it's even clearer, they don't have framebuffers as
objects, so there the fb handle_count references does not help.

I'm not opposed to trying to unify these fields for imported dma_buf, but
currently they're just not. Hence all the reverts.

The patches also need Fixes: and as needed, cc: stable added for merging.
With that and the above text as additional justification added:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Also we'd need to chase down any addiotional conversions that have only
landed in -next meanwhile of course.

₣or the handle_count patches I'm less sure. I don't think they're
justified for fixing the gem_bo->dma_buf NULL pointer issues, but they do
probably help with the GETFB/2 confusion Christian has pointed out.
Personally my preference is:
1. Apply the two reverts.
2. Create an igt testcase for the GETFB confusion
3. Figure out what the right fix for that is, which might or might not be
the handle_count reference of drm_fb.

But with my maintainer hat on I don't mind about the exact path, as long
as we get there somehow. If you decide to do land the reverts, they also
have my:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima

>   Revert "drm/virtio: Use dma_buf from GEM object instance"
>   Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
>   Revert "drm/etnaviv: Use dma_buf from GEM object instance"
>   Revert "drm/prime: Use dma_buf from GEM object instance"
>   Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
>   Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
>   Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> 
>  drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
>  drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
>  drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
>  drivers/gpu/drm/drm_internal.h               |  2 -
>  drivers/gpu/drm/drm_prime.c                  |  8 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
>  include/drm/drm_framebuffer.h                |  7 ---
>  11 files changed, 35 insertions(+), 106 deletions(-)
> 
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
