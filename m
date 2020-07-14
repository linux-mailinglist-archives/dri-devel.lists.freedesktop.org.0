Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9F21ED65
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 11:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055706E802;
	Tue, 14 Jul 2020 09:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5D6E7FE;
 Tue, 14 Jul 2020 09:57:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so4171624wme.5;
 Tue, 14 Jul 2020 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dHnFvOIsrXw6jrB6m+7BeIm/WgTb5Cqh7gsjXssaU1c=;
 b=KnoAcjX4xbVjcEeEVJH8HgscVFZmdZqaHYPU5EtBNSakspRZVOZRaF/dmW850mwgBb
 EIEhQt2487O5Ch8XMPP3/ZU0Tssjmmc7st+F7gnirRjowDijU/yBcwEg3SOb9H1XsW6O
 ZHx7iwIiziKTbK9+5KHYm9bGfe6nUHtsA16tHYKBk0E3M0omDqd8kn8O5ydg6O3+BZtA
 PutrPQjiZTbEN81UwfdkSWanowJeW2hnqp7xV47pvtph9xIjnMWVQWpGmaH8ubZFQrdd
 I/n+BAZE77F8uVwo3QQ03YNLe+6OGonbu4pK0o7ZgyMLHkHiHLHLknU5JFB2PiFJ+gQS
 W0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dHnFvOIsrXw6jrB6m+7BeIm/WgTb5Cqh7gsjXssaU1c=;
 b=AfMJw5Ci/luUB3syeTvfm3kUhRMnGZBcVthPg9abHLobQi9dQyzE3kI2QX5wrG37hq
 PknLLeL3+GzUy8Jbp4Lag+O1EYBIZ3s+6cUI3asp2YgLQdeW4ba+PNhfeyh6LESonQ0Z
 1u7bNabbnqfVIPawiHlYhPuaRhXaWi8IbDYUGmAbz0P6uGSkbPqE/fG60jlh/aoQico4
 z8K9klEOuU1jX8/zbyS7r9Qq8t+H1SU4V7riJMFEWM7Bm+TyjYAm/y5NCX43BSrwTRSt
 Nyrsw/B0VaziPSag/9o1O7bS6Ydtn2Wtb7NF/dj/XWpYl5zwQkZ0PZc4vYjRL3ZsaKEO
 k4xw==
X-Gm-Message-State: AOAM5332HReM6hpZMX/gpgryZhHmK80qMrpYLX5DPFHd1pA8v1Cm6t/v
 6zfGo59KAi9HcwtXV0Id1iM=
X-Google-Smtp-Source: ABdhPJy//OrDpSJANwxwERqV3gHdFYgIJtILxA4cb/jXIXye2R9kTiX9uf+7YtLVsgsXyKpQFfoArw==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr3301652wma.129.1594720644598; 
 Tue, 14 Jul 2020 02:57:24 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id r28sm27797330wrr.20.2020.07.14.02.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:57:23 -0700 (PDT)
Date: Tue, 14 Jul 2020 06:57:17 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 04/25] drm/vkms: Annotate vblank timer
Message-ID: <20200714095717.njwk2u4tkgro54jn@smtp.gmail.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-5-daniel.vetter@ffwll.ch>
 <20200712222716.4rhvj7hryiecjthv@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200712222716.4rhvj7hryiecjthv@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/12, Rodrigo Siqueira wrote:
> Hi,
> =

> Everything looks fine to me, I just noticed that the amdgpu patches did
> not apply smoothly, however it was trivial to fix the issues.
> =

> Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> =

> Melissa,
> Since you are using vkms regularly, could you test this patch and review
> it? Remember to add your Tested-by when you finish.
>
Hi,

I've applied the patch series, ran some tests on vkms, and found no
issues. I mean, things have remained stable.

Tested-by: Melissa Wen <melissa.srw@gmail.com>

> Thanks
> =

> On 07/07, Daniel Vetter wrote:
> > This is needed to signal the fences from page flips, annotate it
> > accordingly. We need to annotate entire timer callback since if we get
> > stuck anywhere in there, then the timer stops, and hence fences stop.
> > Just annotating the top part that does the vblank handling isn't
> > enough.
> > =

> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-rdma@vger.kernel.org
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> > index ac85e17428f8..a53a40848a72 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -1,5 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> >  =

> > +#include <linux/dma-fence.h>
> > +
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_probe_helper.h>
> > @@ -14,7 +16,9 @@ static enum hrtimer_restart vkms_vblank_simulate(stru=
ct hrtimer *timer)
> >  	struct drm_crtc *crtc =3D &output->crtc;
> >  	struct vkms_crtc_state *state;
> >  	u64 ret_overrun;
> > -	bool ret;
> > +	bool ret, fence_cookie;
> > +
> > +	fence_cookie =3D dma_fence_begin_signalling();
> >  =

> >  	ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> >  					  output->period_ns);
> > @@ -49,6 +53,8 @@ static enum hrtimer_restart vkms_vblank_simulate(stru=
ct hrtimer *timer)
> >  			DRM_DEBUG_DRIVER("Composer worker already queued\n");
> >  	}
> >  =

> > +	dma_fence_end_signalling(fence_cookie);
> > +
> >  	return HRTIMER_RESTART;
> >  }
> >  =

> > -- =

> > 2.27.0
> > =

> =

> -- =

> Rodrigo Siqueira
> https://siqueira.tech


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
