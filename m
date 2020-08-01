Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B09235420
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 21:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372346EC03;
	Sat,  1 Aug 2020 19:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A87F6EC03
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 19:20:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x5so11094498wmi.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 12:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DwMdwJNuGqH14xSny5IewSTmQ+L5ClGvkT7BqQpshcI=;
 b=X/yADJH6W+WcpFPMt8nhBPO5k50T82DtANbGRgYBxap/xl/05WQ670GoNPT1RLkTqa
 bfHsHFkdAOW5LRxV0IbIlh4jaME6xFz2cVzq0Ip53nRJNJ2FZLe8rIA+cBCSnDM2jDCE
 IP0h59fWtCvxbDH4fBfZNyDcCghBX4BdHtDfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DwMdwJNuGqH14xSny5IewSTmQ+L5ClGvkT7BqQpshcI=;
 b=mbhI8P/g6IL4IRPqfd7DR/g+9wd+4YY5/j6q3VX+xk4P+9qYVxGO30uixA6i6sDatu
 +eMwuu1wjKefzx70wvPYtLJREgPM5AW8jIaFNao54CKPnZtsvcla64kJkmdbT4nvTeNo
 nyuFxoV48g9BFRYnP5cxd3iRf1JRD2HWQFKvfhYtXuKL2phyQrlIrD2AUkbD3pNT9gKE
 crLtv5FjpVpFEIHLEqEQ1csFgE0zFVgTw8WTD/ThRwx029nFe5+ThPO5w9KseXnG7SSA
 RjRJcK7YBburRUNU66sNF5o0B5ls7loaAUjbSHJ2NV44VCYAE9MXImPxfj9DP+xwz1Nn
 KYfg==
X-Gm-Message-State: AOAM533p73KimE241ChaylmTFeVeLLxk1/h4MjAOwYIGthZiQWxEivEb
 Jfk+zyzFjQip933NeTMWvoVCBg==
X-Google-Smtp-Source: ABdhPJyhxRzXh0oseHu84RlWufogYVVVy7gM4c5UxeL8tyk8UN+QerG6L/YkiLk2wcp9dCwQ0AfOsA==
X-Received: by 2002:a1c:bc54:: with SMTP id m81mr8916052wmf.60.1596309598862; 
 Sat, 01 Aug 2020 12:19:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j145sm3775140wmj.12.2020.08.01.12.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 12:19:58 -0700 (PDT)
Date: Sat, 1 Aug 2020 21:19:56 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/syncobj: Tune down unordered timeline DRM_ERROR
Message-ID: <20200801191956.GF6419@phenom.ffwll.local>
References: <20200801092625.1107609-1-daniel.vetter@ffwll.ch>
 <6c320fd4-81d4-1a96-e83e-ecbdedfbd7f8@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c320fd4-81d4-1a96-e83e-ecbdedfbd7f8@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 01, 2020 at 05:39:50PM +0300, Lionel Landwerlin wrote:
> On 01/08/2020 12:26, Daniel Vetter wrote:
> > Userspace can provoke this, we generally don't allow userspace to spam
> > dmesg. Tune it down to debug. Unfortunately we don't have easy access
> > to the drm_device here (not at all without changing a few things), so
> > leave it as old style dmesg output for now.
> > =

> > References: https://patchwork.freedesktop.org/series/80146/
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/drm_syncobj.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 3bf73971daf3..6e74e6745eca 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -297,7 +297,7 @@ void drm_syncobj_add_point(struct drm_syncobj *sync=
obj,
> >   	prev =3D drm_syncobj_fence_get(syncobj);
> >   	/* You are adding an unorder point to timeline, which could cause pa=
yload returned from query_ioctl is 0! */
> >   	if (prev && prev->seqno >=3D point)
> > -		DRM_ERROR("You are adding an unorder point to timeline!\n");
> > +		DRM_DEBUG("You are adding an unorder point to timeline!\n");
> >   	dma_fence_chain_init(chain, prev, fence, point);
> >   	rcu_assign_pointer(syncobj->fence, &chain->base);
> =

> Thanks,
> =

> Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Thanks for taking a look, applied it now.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
