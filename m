Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A912418A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9D889CF5;
	Tue, 11 Aug 2020 08:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30BD89CF5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:58:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 184so2088580wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=kI5qakFErIhAtlSahv1ie780vLsnJZJzRH85CVk9xkc=;
 b=ZhqiEQB0gxx0HMNGdIud33HXbwCcUGzAFvTEZOcnfrRehwjb8pJce47DxCS3Vpe/hO
 0W/c/dlmjtWDghDUtpf+BYA89HTOVxVctUrjarY7zXxYNXIwVqSUqn6u4n2MAPyGdHzH
 dPBRBhHUwVzJsYQnp6o2LC1HI/cO4MqsXyKNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=kI5qakFErIhAtlSahv1ie780vLsnJZJzRH85CVk9xkc=;
 b=X7rDbtM7WoHlyrFavzqyhT2l4EAE2ZkeuoGgQs5074I3ib1Ej5/Q9ildsXxWUbgGXL
 oS3cy4OwvEWdFzZr2/XHLKxVyAlpCGqWJqHGoMtwUWfn7/kpUt2htPz5yKbtdp53khPN
 O9G8nf1ol0v68ycxLVsXZuIDA2tW6QzyLQsSRcsKJ0aWKa/NWeRXvSE5O7xioj8JUnMW
 6/IA4CM5voOeu5M3isbv9SQbA3+X9wkcnR2VfIplG0ppcctZQslHZa91ZB3giDjAPRSX
 6j9Xrqn84LgQgco86BAHfOEfE8f+KN58KO4pmp1a/el2WI2MqBvUcax4w7cOYrh4kozU
 mhVQ==
X-Gm-Message-State: AOAM530CGzElsVEM6i16sl7TisK+vUmiHCk4mctAtQlRRFurrYpXCT9I
 RKNxwUB4HsazPxJ6bZEcP2KuuQ==
X-Google-Smtp-Source: ABdhPJySHjTR0UHPleGabdZv7zNIZM+F28Kgk+liHl+qFW7HhY9BvenSYNBJUkXh68zLkce7tt7d0g==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr3067068wmg.34.1597136312570; 
 Tue, 11 Aug 2020 01:58:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g25sm3735876wmh.35.2020.08.11.01.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 01:58:31 -0700 (PDT)
Date: Tue, 11 Aug 2020 10:58:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zwane Mwaikambo <zwanem@gmail.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
Message-ID: <20200811085830.GZ2352366@phenom.ffwll.local>
Mail-Followup-To: Zwane Mwaikambo <zwanem@gmail.com>, tcamuso@redhat.com,
 dkwon@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
References: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
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
Cc: dkwon@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, tcamuso@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 10:11:50AM -0700, Zwane Mwaikambo wrote:
> Hi Folks,
> 	I know this thread eventually dropped off due to not identifying 
> the underlying issue. It's still occuring on 5.8 and in my case it 
> happened because the udev device nodes for the DP aux devices were not 
> cleaned up whereas the kernel had no association with them. I can 
> reproduce the bug just by creating a device node for a non-existent minor 
> device and calling open().

Hm I don't have that thread anymore, but generally these bugs are solved
by not registering the device before it's ready for use. We do have
drm_connector->late_register for that stuff. Just a guess since I'm not
seeing full details here.
-Daniel

> 
> To me it still makes sense to just check aux_dev because the chardev has 
> no way to check before calling.
> 
> (gdb) list *drm_dp_aux_dev_get_by_minor+0x29
> 0x17b39 is in drm_dp_aux_dev_get_by_minor (drivers/gpu/drm/drm_dp_aux_dev.c:65).
> 60      static struct drm_dp_aux_dev *drm_dp_aux_dev_get_by_minor(unsigned index)
> 61      {
> 62              struct drm_dp_aux_dev *aux_dev = NULL;
> 63
> 64              mutex_lock(&aux_idr_mutex);
> 65              aux_dev = idr_find(&aux_idr, index);
> 66              if (!kref_get_unless_zero(&aux_dev->refcount))
> 67                      aux_dev = NULL;
> 68              mutex_unlock(&aux_idr_mutex);
> 69
> (gdb) p/x &((struct drm_dp_aux_dev *)(0x0))->refcount
> $8 = 0x18
> 
> static int auxdev_open(struct inode *inode, struct file *file)
> {
>     unsigned int minor = iminor(inode);
>     struct drm_dp_aux_dev *aux_dev;
> 
>     aux_dev = drm_dp_aux_dev_get_by_minor(minor);
>     if (!aux_dev)
>         return -ENODEV;
> 
>     file->private_data = aux_dev;
>     return 0;
> }
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
