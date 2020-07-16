Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB522201A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 12:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D895D88830;
	Thu, 16 Jul 2020 10:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6788830
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 10:02:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w3so10986475wmi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HmJaP7NVFikmcFK4iQg7dTx43rAgLK9eCD2nR0ykggk=;
 b=QXqXKWHD595aOxvBvIH0/gxFgCKeBmrudeJvMWbRzyIjiUcd8RY3hApeSAnEV1kvE3
 QpgeeNZA2EfDthgH3ykQZgPNBvm2P3awtwuaXp2nmwOFPFwcQ0DOVXbvhgDB53c/Ae0I
 XIkCuf6zc8kz51rbtP8PDxSLTOyINc3kqx25w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=HmJaP7NVFikmcFK4iQg7dTx43rAgLK9eCD2nR0ykggk=;
 b=XoIwMmizc2NqYifmfuUPMqq+6ebJWKxhWfbWq/q/YZeuFfZaoFIjONTlZ8QMcuKFC1
 6eh7X0FALXtcVfbGXK71nabvxzHGZ6ZqcnQD7ru8yMikc3ZY0A6GS2cyQoj2sv4Ax6lo
 HIZFSJfY3TQKlgQ8B7v2WWiP147IQ4Eu72gAo3aYmknZTvubdS4xC2Hk4+9dfNcWSofk
 51NR9mO3shBRJkcmnRRSNqNcOTcN2RwWQiYoZo7TTGNXn20bos0w1VFb0OY+PGxDelkE
 jj1aJdD8I+WekyqiX05C5P92Xrar2xax6gIWhW1iN1rF6fd4cZj6s0f2L9hABW4rSs8f
 oqwg==
X-Gm-Message-State: AOAM531yC81TNxitWfmXpkBDwRr2E7QgM6V/xmasZIqUJtB17mefj7tm
 1WGkkejBbIdGaFWNuxgCP2oeyg==
X-Google-Smtp-Source: ABdhPJy/fuyzYF8bhQ0P7Z9zswy1xZik8dtBkFxL5eo+aszv5YPTqw8TmSmFdKQ6/aArjI3D5ObphA==
X-Received: by 2002:a1c:5418:: with SMTP id i24mr3521598wmb.47.1594893742062; 
 Thu, 16 Jul 2020 03:02:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x9sm8030657wmk.45.2020.07.16.03.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 03:02:21 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:02:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: Re: [PATCH] drm: remove redundant assignment to variable 'ret'
Message-ID: <20200716100202.GO3278063@phenom.ffwll.local>
Mail-Followup-To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, ajax@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200715070559.180986-1-jingxiangfeng@huawei.com>
 <20200715120503.GJ3278063@phenom.ffwll.local>
 <5F0FB48A.6080407@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F0FB48A.6080407@huawei.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 09:59:38AM +0800, Jing Xiangfeng wrote:
> 
> 
> On 2020/7/15 20:05, Daniel Vetter wrote:
> > On Wed, Jul 15, 2020 at 03:05:59PM +0800, Jing Xiangfeng wrote:
> > > The variable ret has been assigned the value '-EINVAL'. The assignment
> > > in the if() is redundant. We can remove it.
> > 
> > Nope, that's not correct. Before this assignement ret is guaranteed to be
> > 0.
> 
> Before this assignment ret is '-EINVAL'(see commit 45bc3d26c95a: "drm:
> rework SET_MASTER and DROP_MASTER perm handling"). It is set to 0 above
> around the drm_drop_master() calls.

Ah indeed, but it got fixed already in 

commit 264ddd077c72092178153fc32d510dcecff32eeb
Author: Emil Velikov <emil.l.velikov@gmail.com>
Date:   Sat May 30 13:46:40 2020 +0100

    drm/auth: make drm_{set,drop}master_ioctl symmetrical

That's why your patch didn't make any sense to me.
-Daniel

> 
> Thanks
> > -Daniel
> > 
> > > 
> > > Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> > > ---
> > >   drivers/gpu/drm/drm_auth.c | 1 -
> > >   1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index 800ac39f3213..6e1b502f2797 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -299,7 +299,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> > > 
> > >   	if (file_priv->master->lessor != NULL) {
> > >   		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
> > > -		ret = -EINVAL;
> > >   		goto out_unlock;
> > >   	}
> > > 
> > > --
> > > 2.17.1
> > > 
> > 
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
