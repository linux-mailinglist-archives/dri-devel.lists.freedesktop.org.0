Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A892297D9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 14:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AC76E08C;
	Wed, 22 Jul 2020 12:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1C66E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 12:05:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o8so1696602wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 05:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6GWvDSxKVzDi/s6ITFiKMMMFly/c7KlombXtQhBuv00=;
 b=XK91tgsj7Qt9gpsgpfpN0lC0LQJxFMqVPeVpO4Fq0eR7g4/ysEl3MrZ+/Re4ap3N0u
 F59alOWc3+V8dAKPb6Ssg9Bu1+flnbYxXlnfu60fSmvFNKfL7xZPDz6poqyQjGY86A+A
 /kiRUrZPCe+PdYq4RMrUh8+jBa7CHZ3k25wHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6GWvDSxKVzDi/s6ITFiKMMMFly/c7KlombXtQhBuv00=;
 b=jmflq80uhyq3nfMBnP97arRGiOhYtriZ9c46s1Cl8BDmFOuHnQN3ktkkjco8iQY3BD
 praOv7f/QG7J44LHi/SveKgT5/IDq5Ju3s+2JXP/zXjRdqDy7Y8l3npq/Zvj6wGRptp+
 K5ihFyHloclw+PoQPlGfjyHPYRcyFnVuVLOFOzPOOx275Dbj+A0ry7O1rTu01Z339A1j
 7PFfAeGs3sw3CmfqDiwv+Mf82Edh5jiVozpDIpG9ckrkKqAS6E7zsgir2PjVlYZN/bra
 WykpW0PH9nq4BJ47rBHfNqoswyue+YvI+5b798KLwKyWBVQGJSNiv9cVyKKZknGZodBX
 Ex8Q==
X-Gm-Message-State: AOAM5318ACNoAtnvFJa+TjZ0Qs8b2N6gQb981IJgLvDvt7cK1k1gqw1n
 WHTko5MxF88R6Ei2OYNVTqBX0A==
X-Google-Smtp-Source: ABdhPJw5teh0kJ9n0kFgkPZpHVeCcGwgwrxpfLIchalSpl0s28bTMzTBwfbXFw7tqdEFaPT82mXzvQ==
X-Received: by 2002:a1c:ac81:: with SMTP id v123mr8021449wme.159.1595419505356; 
 Wed, 22 Jul 2020 05:05:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y77sm7920297wmd.36.2020.07.22.05.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 05:05:04 -0700 (PDT)
Date: Wed, 22 Jul 2020 14:05:02 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200722120502.GK6419@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-usp@googlegroups.com, twoerner@gmail.com
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> This patch adds a missing drm_crtc_vblank_put op to the pair
> drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> 
> It clears the execution of the following kms_cursor_crc subtests:
> 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
>    random, fast-moving])] - successful when running individually.
> 2. pipe-A-cursor-dpms passes again
> 3. pipe-A-cursor-suspend also passes
> 
> The issue was initially tracked in the sequential execution of IGT
> kms_cursor_crc subtest: when running the test sequence or one of its
> subtests twice, the odd execs complete and the pairs get stuck in an
> endless wait. In the IGT code, calling a wait_for_vblank before the start
> of CRC capture prevented the busy-wait. But the problem persisted in the
> pipe-A-cursor-dpms and -suspend subtests.
> 
> Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> blocking in the 2nd start of CRC capture, which may indicate that
> something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> the crc setup was able to sync things and free all kms_cursor_crc
> subtests.
> 
> Tracing and comparing a clean run with a blocked one:
> - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> started. Moreover, a series of vkms_vblank_simulate flow out until
> disabling vblanks.
> Also watching the steps of vkms_crtc_atomic_flush, when the very first
> drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> hand, when vblank_get succeeded, the subtest completed. Finally, checking
> the flush steps: it increases counter to hold a vblank reference (get),
> but there isn't a op to decreased it and release vblanks (put).
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index ac85e17428f8..a99d6b4a92dd 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  
>  		spin_unlock(&crtc->dev->event_lock);
>  
> +		drm_crtc_vblank_put(crtc);

Uh so I reviewed this a bit more carefully now, and I dont think this is
the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():

 * Caller must hold a vblank reference for the event @e acquired by a
 * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.

So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
for us. And that's the only case where we successfully acquired a vblank
interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
success for that function, failure negative error number) we directly send
out the event.

So something else fishy is going on, and now I'm totally confused why this
even happens.

We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
we don't underflow the refcount, so it's also not that I think (except if
this patch creates more WARNING backtraces).

But clearly it changes behaviour somehow ... can you try to figure out
what changes? Maybe print out the vblank->refcount at various points in
the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
is enabled/disabled ...

I'm totally confused about what's going on here now.
-Daniel

>  		crtc->state->event = NULL;
>  	}
>  
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
