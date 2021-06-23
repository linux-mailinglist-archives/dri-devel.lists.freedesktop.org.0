Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4B3B1D5F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF36E930;
	Wed, 23 Jun 2021 15:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217A86E930
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 15:15:11 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gn32so4628657ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DvsYEcXsNWTy6Jnkq47KIklkbgVvy5KtMShh7FtY3u0=;
 b=WlyCtxxrit0F13PB5LKVc4W8ioTDxZGoz0BDxhp5ADy/+x0DPfJAboMCXqIWhMcdLM
 fG/7Lud5ltzga56OxZ3HjQOTY4JYgDVcvHd5L5Es73O2G10XryTWLzzy68cbS0Bc9LMT
 Vy9D6jY1Dy+wQUgKscUFQz8BiTIsqJcWTtFOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DvsYEcXsNWTy6Jnkq47KIklkbgVvy5KtMShh7FtY3u0=;
 b=MoZtZ6vVSfUWqhoygTsPHHy1MG9ldnh4iaINMbdsp+iN4YuTQrdC0WROKKIA1l/OC/
 FKUXeQTiPCi1YkaBrERCMgz/+DlLyK5S68xAu6uTm8o0cWasaV94qcSsO7iJawzYu86h
 vKWZZFd+NQ4VnICc8+JQTemJJlf9p8qh9WSombCrhvM+JMzcDfbNc0LN71xEDJnbfFMS
 QRzMA/G1RVg7tX+HKCvlSnzR9/9IYYu5TSrZ75LSAiOIJKuN5WZ+IZGBKvzgnHRHbKCT
 XS2PjCjPNxyvpFGoekL5VkUsxh1+gHVFH6cW0AWMXOzn7LTW48SrSTlXy7uqAI+uvcFl
 B1gg==
X-Gm-Message-State: AOAM530ZirV5bcE4xFbQocGr8v1VJgc0XVStALmVFakcyg94Aisvly/x
 cXZIe1PFMsZEbRJ1CgUJodN1lQ==
X-Google-Smtp-Source: ABdhPJzKLxUo3F8LpT0py8NX3d9PVLeW21ZVMvCiRMqKaQMl+9VP6WwlxqUsTydvPwu4FdZbDj+/aA==
X-Received: by 2002:a17:906:2608:: with SMTP id
 h8mr531968ejc.380.1624461309756; 
 Wed, 23 Jun 2021 08:15:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h6sm192144edj.91.2021.06.23.08.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:15:09 -0700 (PDT)
Date: Wed, 23 Jun 2021 17:15:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/15] dma-resv: Fix kerneldoc
Message-ID: <YNNP+0YuiqsBxpZK@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
 <87f6529c-caf0-6e4b-6506-b0e2d1a0f9e0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87f6529c-caf0-6e4b-6506-b0e2d1a0f9e0@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 10:31:18AM +0200, Christian König wrote:
> Am 22.06.21 um 18:54 schrieb Daniel Vetter:
> > Oversight from
> > 
> > commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
> > Author: Christian König <christian.koenig@amd.com>
> > Date:   Mon May 10 16:14:09 2021 +0200
> > 
> >      dma-buf: rename and cleanup dma_resv_get_excl v3
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Pushed to drm-misc-next.
-Daniel

> 
> > ---
> >   include/linux/dma-resv.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 562b885cf9c3..e1ca2080a1ff 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
> >   }
> >   /**
> > - * dma_resv_exclusive - return the object's exclusive fence
> > + * dma_resv_excl_fence - return the object's exclusive fence
> >    * @obj: the reservation object
> >    *
> >    * Returns the exclusive fence (if any). Caller must either hold the objects
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
