Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE726FD2B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B36ECE3;
	Fri, 18 Sep 2020 12:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723D6ECE3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:46:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l9so5450410wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9nKWEv4dqtFaB3khWsO7OhilKhzjQuKg+zNG2DgVNfc=;
 b=cFL7Cr4fUlm88EsXHo2hZseg3GRSaZWTh67y+zgK8c0H4jnh9UkA2cRbpMRisyIUSR
 y2qGpNBpez/O5wzmGAyy8L/YInTvZnCoOMFi7eLa0U4I9VCjGVrV4zNOGcTBj14oB4Id
 rmqQ8WdtNVC1hHRmicQsddqOEQPIgSo1V/LTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9nKWEv4dqtFaB3khWsO7OhilKhzjQuKg+zNG2DgVNfc=;
 b=F7HhBAji5XSIgYrNUsiw1ZuA+cCC4T8qdETkEP4P2DVGYivg8ADeV5cOyiKQfFZyrp
 nIvV/vQ3jo4g3hsackJqFO9nlHx7lAup3N8MXZ2riwbj/01n+QOOETUH/DoQLHM3JMlZ
 dImrcN4cm4j/8gpiruGZm4XgvyfSE0WvtjVbP3YYjvR4i2rPD0zjeyZjxdFO5/JY8OL4
 6Y7MJEuGiEeuOs/UxXgw8aBJqe5T1S5NaC5TsmBZt+I2efYaYehRgIiImNbHrGJ0IVNk
 0sf9uovGeaxAZAOui0CIhEDpeI9dxfegKYgKlcK6WO8oqqirsd6Exx5F91eo0XqisQcK
 Jv7A==
X-Gm-Message-State: AOAM532piOPIORdvz3qTL8eR0/kfLZVqhS874B6g8I9aK9hMmGC3ioRy
 uTsgK5U8xxbBwLPdWFogt7oSOuGmd5PdiRmw
X-Google-Smtp-Source: ABdhPJxa+Ko/uTyz0A9Rq71hnhe4gvteY4mBBhDwvfQb7Q4UmniiepKLTBQ4xSA0TQmDqnOqHrOFPA==
X-Received: by 2002:a1c:610b:: with SMTP id v11mr15920556wmb.181.1600433217590; 
 Fri, 18 Sep 2020 05:46:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p1sm19827390wma.0.2020.09.18.05.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:46:56 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:46:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH] drm/ttm: update kernel-doc line comments
Message-ID: <20200918124654.GC438822@phenom.ffwll.local>
References: <1600422778-888-1-git-send-email-tiantao6@hisilicon.com>
 <20200918104425.GA2644518@hr-amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918104425.GA2644518@hr-amd>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tian Tao <tiantao6@hisilicon.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 06:44:25PM +0800, Huang Rui wrote:
> On Fri, Sep 18, 2020 at 05:52:58PM +0800, Tian Tao wrote:
> > Update kernel-doc line comments to fix warnings reported by make W=1.
> > 
> > drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> > member 'glob' not described in 'ttm_shrink'
> > drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> > member 'from_wq' not described in 'ttm_shrink'
> > drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> > member 'extra' not described in 'ttm_shrink'
> > drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
> > member 'ctx' not described in 'ttm_shrink'
> > 
> > Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 
> Acked-by: Huang Rui <ray.huang@amd.com>

It would be nice to go through ttm docs and polish them so their proper.
This patch here just shuts up the warning without fixing any of the
documentation issues. Fixing the docs would be much better.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/ttm/ttm_memory.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
> > index acd63b7..0b51773 100644
> > --- a/drivers/gpu/drm/ttm/ttm_memory.c
> > +++ b/drivers/gpu/drm/ttm/ttm_memory.c
> > @@ -259,7 +259,7 @@ static bool ttm_zones_above_swap_target(struct ttm_mem_global *glob,
> >  	return false;
> >  }
> >  
> > -/**
> > +/*
> >   * At this point we only support a single shrink callback.
> >   * Extend this if needed, perhaps using a linked list of callbacks.
> >   * Note that this function is reentrant:
> > -- 
> > 2.7.4
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
