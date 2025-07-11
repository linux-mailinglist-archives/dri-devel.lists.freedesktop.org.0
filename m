Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF294B01A87
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 13:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424C110E118;
	Fri, 11 Jul 2025 11:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fl1ORV3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960BA88C4C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:26:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4537fdec39fso6245385e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752233199; x=1752837999; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N2PVAjumjM6QBebDLC5QW4Rc7DpYox7DcXnPsrpWBK0=;
 b=fl1ORV3KqG3F+fFS9OhhmX1361x+S/QHcMJM61+6oWeJmiEztlbuOB6vbT/0p4JiwG
 apK23AVAruNABPK0d+7F4JS+s28AyaOS5AA+0n9DaJI2Gsgz7mxpTrdOiKOjZKuwFsBX
 Q5jewYosUWUOb4SMO7A3t1k8+9x2QehUAhoa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752233199; x=1752837999;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N2PVAjumjM6QBebDLC5QW4Rc7DpYox7DcXnPsrpWBK0=;
 b=r3Hchop7fvhqPztvQ13PknPyxRFM1pAw/h/NHiQrLJuPgNL81yCb2YshG/YeRwxQ+j
 EJ+ptecg3hyf3NzQaRrmK/JqNtNVW0hY/Y9Ado5fllJ1z3MkzCzHQBpHogdGqVTlLFFr
 iLWG78fS+4CL9/qCP1d7zZtZC2xuKallWCt7qmcyBj5KDJhefb3IPKp+sEA2bM8+vJQP
 8qdWgUxVeVnjjiYeQtqmR97yBYyby/oiMHjyNEADAZO1lshXb5Oarje9ErSqpMkxjs67
 0NlW4iBOaWDg+77XdZ2r9pB/OMl0Mp6EVEagbv/4I7GMikLZO2MyiSZvyifrkyjeUX0/
 nHvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfSN8MrY6SMsKs9gu3/HEJkLOSLc0IXAXwFk3xBbuoMFnVU8pCE4YC7d1Q2GFVP+aTp1N071zNCEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxdOhJw+ndvmOvUWMCJmj2/FPPu+InIK8QSg62P6bdL/pH2v1E
 9wZhWG+VmT3QH1nHc75FXjIOQw+c/0a5c+dq8lklTJ04pL9ADXozWjGlZfeg84It+HU=
X-Gm-Gg: ASbGncv68I/1WkHBh7UL88S3E7W2Gta1G0Y5mpXfXz1wYieR5H08blQ5EKPD6iRZekq
 9tTmpTytmgZDrIHURf8XprR5u+rfmb9Hdrv1qf1r/XmkhJ8zVexPC/Z8E8ZU8l00NHmcqs3eSjR
 /I5FntyA1bU3baBUGWv5LP8J7uPTxBC5rLvB1+RZork4TpmuDw4b/M/tNsNl/K/kL7/zQ09SuQr
 bXJ3v8uNnziQ0E7wAVSTm9cx1Y7S0dWAt+d27j9yY2L7LPfWF7+W9RVPyu0k8pRySSuHZCzLcAv
 nIn5ksnMRgyDx4CVOqqBtGn8P26ngyQOiF85+eVbYyiEii8z6TbX9zAClNRWdtWvfziV2kyWNVt
 W+1KuZMlckJMlz0R0CGEmKUwHdL1v7nHDhOB9CkmBUISg
X-Google-Smtp-Source: AGHT+IFVi7nm2kebBAJ8+93+5amqUpcfmZWMLm3ginfXIg49P5tt280hta+taQINrMUsHsBQFiNG1w==
X-Received: by 2002:a05:600c:6295:b0:43b:ca39:6c7d with SMTP id
 5b1f17b1804b1-455ebce3f18mr16886065e9.3.1752233198798; 
 Fri, 11 Jul 2025 04:26:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2464sm4296653f8f.38.2025.07.11.04.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 04:26:38 -0700 (PDT)
Date: Fri, 11 Jul 2025 13:26:36 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, torvalds@linux-foundation.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
Message-ID: <aHD07IF9Y7lntOLo@phenom.ffwll.local>
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <bd14fdec-7e75-477c-a241-bac67f93d210@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd14fdec-7e75-477c-a241-bac67f93d210@amd.com>
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

On Fri, Jul 11, 2025 at 12:32:02PM +0200, Christian König wrote:
> On 11.07.25 11:35, Thomas Zimmermann wrote:
> > Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
> > in the affected places. Also revert any fixes on top. Separates references
> > to imported and exported DMA bufs within a GEM object; as before.
> > 
> > Using the dma_buf as the one authoritative field for the DMA buf turns
> > out to be fragile. The GEM object's dma_buf pointer can be NULL if
> > userspace releases the GEM handle too early. Sima mentioned that the fix
> > in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
> > framebuffers") is conceptionally broken. Linus still notices boot-up
> > hangs that might be related.
> 
> Did I missed that response? What exactly is the issue?

Sorry, private thread from Linus that he's hit the regression, applied the
fix, which was apparently not enough. Then applied the revert of "drm/gem:
Acquire references on GEM handles for framebuffers", which worked better,
but still resulted in not-before-seen issues somehow. At that point I
figured it's best we backtrack because we seem to have a history of not
really understanding this anymore collectively. Thomas also found yet
another related regression around drm_prime in -next, so this looks way
too messy to me for late -rc.

The regressions left over after the bugfix from Thomas that's in
drm-misc-fixes is some silent hangs at login, without any traces anywhere
what got stuck.

We don't yet have feedback from Linus whether the revert more approach
here helps.

> > Reverting the whole thing is the only sensible action here.
> 
> Feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the entire series.

Thanks, I'll apply it to drm-fixes directly assuming intel-gfx-ci
approves.

Note that I'm not fundamentally opposed to the concepts here, at least the
usage count extensions of handle_count seems not entirely off. But it does
look very questionable to fix the patches that switched from
->import_attach.dmabuf to ->dma_buf, and it's simply too late in the -rc
for more big games.

Cheers, Sima

> 
> Regards,
> Christian.
> 
> > 
> > Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
> > 
> > Thomas Zimmermann (9):
> >   Revert "drm/framebuffer: Acquire internal references on GEM handles"
> >   Revert "drm/gem: Acquire references on GEM handles for framebuffers"
> >   Revert "drm/virtio: Use dma_buf from GEM object instance"
> >   Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
> >   Revert "drm/etnaviv: Use dma_buf from GEM object instance"
> >   Revert "drm/prime: Use dma_buf from GEM object instance"
> >   Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
> >   Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
> >   Revert "drm/gem-dma: Use dma_buf from GEM object instance"
> > 
> >  drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
> >  drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
> >  drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
> >  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
> >  drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
> >  drivers/gpu/drm/drm_internal.h               |  2 -
> >  drivers/gpu/drm/drm_prime.c                  |  8 ++-
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
> >  drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
> >  include/drm/drm_framebuffer.h                |  7 ---
> >  11 files changed, 35 insertions(+), 106 deletions(-)
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
