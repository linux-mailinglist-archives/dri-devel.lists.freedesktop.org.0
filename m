Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA6ADCEEE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65DA10E487;
	Tue, 17 Jun 2025 14:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="T44WCR6c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F4310E487
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:11:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so31373205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 07:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750169465; x=1750774265; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u2TEDZAHvRsjOXsv032PRSO4B7twopptHn6NVIWR/1U=;
 b=T44WCR6cfo9UPbeUTCgSYkdhvF8HqpEVQKXPl9SqAsn+hs+6xDwF8y25JXfjMcaknP
 5CejRLyt3L/Z8BvT0N11p+3DlePfpneR2va/zsoREAoaju0d+pDo/XeWk2dofC8s1HSq
 XnOL4UW7oLgIUPjcDwzK2JcXN2Bc1HP/9tuQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750169465; x=1750774265;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u2TEDZAHvRsjOXsv032PRSO4B7twopptHn6NVIWR/1U=;
 b=WOJYkkMIwP4R1euP31tbsnO47hIk1wI7RAQZanBQ3NSsiPsnmR0uQaxlRZKYPdkErB
 aCYXBFiyWsMQVYZ/RzClpYZdtz+LMj1rti4n3W6uqbTmnIq0lqGK+DkNcjyvtfuB3raU
 nqhtduf7BXdSFOcPHfFCvT06uZNCrRaDlqtqJJH5S+Sofw9MtaTz8WOU20aG7alHAnlZ
 AmDk/vkckz9FwbKyQhrJx67pXOk5OaGVEYmWheRdnyBJ5hzHP7OnGZWvWYZzzO7Rq92R
 CuxsW2fN4vdcHpZd0pZXSqv4bx+PgIbGe14JZSvLGc13taoz8De+yN91gY3Qk0KZg2dy
 ecqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcGRklTrMufcX2GYvpBXugWUkQ03q7UGAKRhGzpDDBbaSBYx9sgB9p6WmVwyh+Y5/TUlCNYTbGJ3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1aytlaCfocyRXjdbYB/g7gatdo7vZADqZBS2T/zOmC8sMLUXO
 UuydNVEO7KDmiX5w9GC+wH9uL7fXh4nR1BqqFcMkZD+w8+qEDEMGVgbccyHFUMhJavE=
X-Gm-Gg: ASbGncv8USH29YJew2hvlX2S2BsVsJcivLQyJjFG1qPCFErc8CQxWtXcBEGagZejK65
 IXijDhy558Bu6YQi58uT18pHcl21U9jw8OeLkhbNuhpUxBptNkO+wnjQoOP146bI2ccZ/MLD9Uf
 AZgzQcu1qjI0MVhJWoeEIxR9XTnI6+s6vU4VvxtvKaKXB/lXjpO3YzBAtxh729LebN2CrHFK91T
 eQnqBVLcO030JPDye0aadk+gSNqWTwckOdSbGAQMyuKflEJW0eZev/uej2DrYbX+pJZrhG2FrZa
 NEOx0gopnhOIZXCIGdCOmtZAFZAHU8ZZkg4kG/hvONNgmAZaH4cAwLWIikDApytupf52+/Fpfw=
 =
X-Google-Smtp-Source: AGHT+IFb6rDKTaqi4TNMTQStEegAW+UlHVC1uucbd2QVoW8BehFP/rRCxZiqmvntBHZhOHpm0uyQZw==
X-Received: by 2002:a05:6000:2289:b0:3a4:f723:3e73 with SMTP id
 ffacd0b85a97d-3a5723a3627mr11668290f8f.16.1750169464646; 
 Tue, 17 Jun 2025 07:11:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b087a9sm14384488f8f.55.2025.06.17.07.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 07:11:04 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:11:02 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com,
 tursulin@ursulin.net, simona.vetter@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Message-ID: <aFF3dvM1Ibu2gVM3@phenom.ffwll.local>
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <aEwxTkK3w19L1_T2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEwxTkK3w19L1_T2@phenom.ffwll.local>
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

On Fri, Jun 13, 2025 at 04:10:22PM +0200, Simona Vetter wrote:
> On Fri, Jun 13, 2025 at 04:04:46PM +0200, Simona Vetter wrote:
> > On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
> > > It is possible through flink or IOCTLs like MODE_GETFB2 to create
> > > multiple handles for the same underlying GEM object.
> > > 
> > > But in prime we explicitely don't want to have multiple handles for the
> > > same DMA-buf. So just ignore it if a DMA-buf is exported with another
> > > handle.
> > > 
> > > This was made obvious by removing the extra check in
> > > drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
> > > find it in the housekeeping structures.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > > index 1d93b44c00c4..f5f30d947b61 100644
> > > --- a/drivers/gpu/drm/drm_prime.c
> > > +++ b/drivers/gpu/drm/drm_prime.c
> > > @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> > >  
> > >  		rb = *p;
> > >  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> > > +
> > > +		/*
> > > +		 * Just ignore the new handle if we already have an handle for
> > > +		 * this DMA-buf.
> > > +		 */
> > > +		if (dma_buf == pos->dma_buf) {
> > > +			dma_buf_put(dma_buf);
> > > +			kfree(member);
> > > +			return 0;
> > 
> > This feels a bit brittle, because this case should only be possible when
> > called from drm_gem_prime_handle_to_dmabuf and not from
> > drm_gem_prime_fd_to_handle() (where it would indicate a real race and
> > hence bug in our code).
> > 
> > I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 
> 
> Simplest would be to return -EEXISTS here and then either silence that
> errno or warn about it in the two call sites. Not pretty, but everything
> else looks worse.

Did you send a v2 for this one? I think we should at least sort out the
regression and then figure out the longer-standing issue. Not even sure
that's a regression from the r-b tree conversion or whether that goes back
to my original linke-list walk code.
-Sima

> > Otherwise yes this is the functional change that I've missed :-/ Note that
> > there's no race in the original code, because it's all protected by the
> > file_priv->prime.lock. Which means I think you're claim that you've only
> > widened the race with your patch is wrong.
> > 
> > Cheers, Sima
> > 
> > > +
> > > +		}
> > >  		if (dma_buf > pos->dma_buf)
> > >  			p = &rb->rb_right;
> > >  		else
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
