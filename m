Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B41990EE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 11:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F1B6E2D8;
	Tue, 31 Mar 2020 09:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8C06E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:16:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r16so1610446wmg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/1bZOCUNGF1gmZL+jNN6OWPaC9nWHbCENgwpD1B+JtU=;
 b=Q49YP0Bew1LBlgiW52dwgEjqKt0TJQv7UheGCdNIazsLlfQYsZc6TTK3v3AbtqaykP
 Vdv9HfezhpFzR7V5BKe4QNIQH+OVR0LKcnPQmJXvX5gqOwnCiAB9SjvyL0ljcp5UffXN
 7ssrFlIiQDkV0FOHaoqr/hZwpfHn/0bmDAM4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/1bZOCUNGF1gmZL+jNN6OWPaC9nWHbCENgwpD1B+JtU=;
 b=rFICoaYzq1VGHzbXjxXB4ZcuJpcXVj1nXvOyxF6aXt/g33FwPFa2dUvRFRQO0KZ12d
 Y7howdSBYAejYYKIutj/HhY5jdEqWGW+hfK7A/iVvZaFqKGFrG5vouQe7ZCLlGKuqBMP
 9Uae2v+ZjVT1H9z3bUIleXYmmscywqVYzc1EoDV6+kSR8j1kG5audQRXT9mG3HQR4suf
 +MCBslQXnPu3wTyJOkwuiv0O4iH4Mf2Xr9aW3epR65MmyPMmVl9bTYd+uYJnCCFKJL2S
 sjibO7OYKHA2YaUqlruuWb786v4sYDK+RqWPJDaBHya+VdEMvnNZW3oyhbhTwYvXQ0W0
 VKTw==
X-Gm-Message-State: ANhLgQ2SRwAOd8hkfv9GXhgQvP8znyjmtr7Y+N+Msq+DEeP2RSU4ecJS
 ynRbaI6JWnzTL/2Yk2eRRGIJ/lsi3ExpGw==
X-Google-Smtp-Source: ADFU+vv5fzx1GIZxE2GAtPPk2/lsX/3pZtVJT9luJjscKr1ICNNkEnGEcaTuOtRGXsT9m9Wt3Gu+ug==
X-Received: by 2002:a05:600c:21cb:: with SMTP id
 x11mr2476954wmj.111.1585646180656; 
 Tue, 31 Mar 2020 02:16:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s131sm2979264wmf.35.2020.03.31.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 02:16:19 -0700 (PDT)
Date: Tue, 31 Mar 2020 11:16:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented
 address spaces"
Message-ID: <20200331091618.GM2363188@phenom.ffwll.local>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: andi.shyti@intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, zbigniew.kempczynski@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 10:59:45AM +0200, Christian K=F6nig wrote:
> A not so gentle ping, since this pretty much broke all TTM based drivers.
> =

> Could we revert this for now?

Always ack for revert.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Needs to go to drm-misc-next-fixes, and then maybe also ask for a
backmerge since the patch landed pre-split. Also ping Maarten to do
another pull request (there's other stuff in there already anyway).
-Daniel
> =

> Thanks,
> Christian.
> =

> Am 30.03.20 um 14:34 schrieb Christian K=F6nig:
> > This reverts commit 7be1b9b8e9d1e9ef0342d2e001f44eec4030aa4d.
> > =

> > The drm_mm is supposed to work in atomic context, so calling schedule()
> > or in this case cond_resched() is illegal.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/drm_mm.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> > index bc6e208949e8..8981abe8b7c9 100644
> > --- a/drivers/gpu/drm/drm_mm.c
> > +++ b/drivers/gpu/drm/drm_mm.c
> > @@ -45,7 +45,6 @@
> >   #include <linux/export.h>
> >   #include <linux/interval_tree_generic.h>
> >   #include <linux/seq_file.h>
> > -#include <linux/sched/signal.h>
> >   #include <linux/slab.h>
> >   #include <linux/stacktrace.h>
> > @@ -367,11 +366,6 @@ next_hole(struct drm_mm *mm,
> >   	  struct drm_mm_node *node,
> >   	  enum drm_mm_insert_mode mode)
> >   {
> > -	/* Searching is slow; check if we ran out of time/patience */
> > -	cond_resched();
> > -	if (fatal_signal_pending(current))
> > -		return NULL;
> > -
> >   	switch (mode) {
> >   	default:
> >   	case DRM_MM_INSERT_BEST:
> > @@ -563,7 +557,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * con=
st mm,
> >   		return 0;
> >   	}
> > -	return signal_pending(current) ? -ERESTARTSYS : -ENOSPC;
> > +	return -ENOSPC;
> >   }
> >   EXPORT_SYMBOL(drm_mm_insert_node_in_range);
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
