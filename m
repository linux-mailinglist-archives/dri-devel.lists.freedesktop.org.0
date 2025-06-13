Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27792AD8ECA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8872510E9DD;
	Fri, 13 Jun 2025 14:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BQomSR9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4868B10E9E3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:10:27 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so12856285e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749823826; x=1750428626; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QLCVNAc87wfpZD43ljbxVUv38wXJRIKVm0Sxqgd/qz8=;
 b=BQomSR9An1tF1DV4vzl3ko8GUglrGgzhS6/JEu5M69cCeiCPjkH/wQKuE8vLZ7+QbE
 C0XRL/sZiVtvCzVWwwJzlMSu+PML+IWYFF7bP9/YIoJ/l4Z7Sfwm62AXdgI/MZCDsjsA
 S3J18EtIU0rTa+mzm7KFUU7e39CI5eVNuTIZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823826; x=1750428626;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLCVNAc87wfpZD43ljbxVUv38wXJRIKVm0Sxqgd/qz8=;
 b=BK0qmpVTiD/eTXGZKwYQkr/97/1acgi+SzlzR2XJ/QIvq78sfvp26soZhtIQID/4SJ
 wexkCow0yGF/wujlYUXZubGCw4a1LHebdy62wBaCFQRRyr60RFW2g+UY7hB+EzwZKKHW
 Biy4xn/zQM0iWFLSsZRZz2KEIC6Ubfj/z8uKzLTVDtKu9Set9PehFMF/AyFyun3fCTL0
 UwwToXEoXAkscc9/ba67jEOIvrMKoi6GZ1CcCNW8pQeIdFumRrUipJyXYHSNme+APft4
 dSjkFuLBFYGD7NJe8yNzxNVts3G+jhFx49OEy4r2PUA/LU1t/Ooth1POKXp1vDww+ODS
 xRqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxxaAbxxl6+S4TXqgZsBG/5QVRMwBC/S6YLvP7SbUqvnxZGzfM4GxX1aURPiqvodwXYE21h7aPKm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeQbqCrc4TUCk4AECYO5K8SiE383il1W2qWmUrHTw8ovM6yXmQ
 BurjBxt7baqZexfK5a3B5eP+x8FK+ClSumMTFgC64fux6yhrScT3u2L9HrCy8D4dVjk=
X-Gm-Gg: ASbGncuTyJXmLXxFhJsqpIOQ8e4cNUTDH3rwJ+xEVPH1DjwXZ1/GqnfgGpuyjWFfadI
 h0+xXfWOaxmL72SaxJbdJ3ZSC7q3KvCdlQbf1wxeoTv8IVGMjBCsulB4oJEJL0+/x6YR7toUnhM
 iSrxJZZYHc9Z7yBbN0jZzyjhTNsvA91DXWVsfaI7EHfwz1Ce2FhE8QXfIxtmaaUsobE2WwfzzyI
 W1/uukdr4a4rUvR/ygajJUvKlT+KHzc5msdQndYD+oQipT+yNOoO5mXRgkHx/OQvhMIpRPLgrRM
 q31t8kuuJ8byl0masD6gAxBDP2zknV2EnsLHCv513kypsqsICiBNDz0m0lSJ2Vrrph774QfVNg=
 =
X-Google-Smtp-Source: AGHT+IElADjXV+dQLwlWoKpvXWjwItHvlVKiku0Zs7DZXok1V0FWo9D/bj6S7ml6GCRbgE+McQVeKQ==
X-Received: by 2002:a05:600c:4fd6:b0:442:e03b:589d with SMTP id
 5b1f17b1804b1-45334ae7434mr33798365e9.24.1749823825442; 
 Fri, 13 Jun 2025 07:10:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b087b4sm2527742f8f.51.2025.06.13.07.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:10:24 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:10:22 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com,
 tursulin@ursulin.net, simona.vetter@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Message-ID: <aEwxTkK3w19L1_T2@phenom.ffwll.local>
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
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

On Fri, Jun 13, 2025 at 04:04:46PM +0200, Simona Vetter wrote:
> On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
> > It is possible through flink or IOCTLs like MODE_GETFB2 to create
> > multiple handles for the same underlying GEM object.
> > 
> > But in prime we explicitely don't want to have multiple handles for the
> > same DMA-buf. So just ignore it if a DMA-buf is exported with another
> > handle.
> > 
> > This was made obvious by removing the extra check in
> > drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
> > find it in the housekeeping structures.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 1d93b44c00c4..f5f30d947b61 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> >  
> >  		rb = *p;
> >  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> > +
> > +		/*
> > +		 * Just ignore the new handle if we already have an handle for
> > +		 * this DMA-buf.
> > +		 */
> > +		if (dma_buf == pos->dma_buf) {
> > +			dma_buf_put(dma_buf);
> > +			kfree(member);
> > +			return 0;
> 
> This feels a bit brittle, because this case should only be possible when
> called from drm_gem_prime_handle_to_dmabuf and not from
> drm_gem_prime_fd_to_handle() (where it would indicate a real race and
> hence bug in our code).
> 
> I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 

Simplest would be to return -EEXISTS here and then either silence that
errno or warn about it in the two call sites. Not pretty, but everything
else looks worse.
-Sima

> 
> Otherwise yes this is the functional change that I've missed :-/ Note that
> there's no race in the original code, because it's all protected by the
> file_priv->prime.lock. Which means I think you're claim that you've only
> widened the race with your patch is wrong.
> 
> Cheers, Sima
> 
> > +
> > +		}
> >  		if (dma_buf > pos->dma_buf)
> >  			p = &rb->rb_right;
> >  		else
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
