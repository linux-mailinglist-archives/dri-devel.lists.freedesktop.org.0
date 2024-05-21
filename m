Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433218CAD74
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BA110E916;
	Tue, 21 May 2024 11:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kzhoysrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7410E916
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:38:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-354c28d4e2aso76685f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716291529; x=1716896329; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=javIARIQYa6PXJ+GHsHLdFJuCntUaJgV+5ZQt3fbfwo=;
 b=kzhoysrv1twBRJziH1yXGIFu8vajqk8RcuIBm359TO7unnWfuY3lDIGTOewKs4ukdU
 4bGWCdyrvValI7IiomKHk+nxVafTgnMumCGcTAEtK1L9XNdkrqIzuu8PjyK41mrs8t9E
 yWRMBYIL9XdOR76bVADI2QqVDwamt7/+n3E5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716291529; x=1716896329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=javIARIQYa6PXJ+GHsHLdFJuCntUaJgV+5ZQt3fbfwo=;
 b=wbTGmLE8xZMEFC9ehz3X1g+Z8rhvTbfewhhx0hIN/I2bPJ3snMsof41PbF5d4Nw/jP
 kdArwAOcAwz+CkY5KZeOuhU80Hiri7jHaBmyJ+ogNXqIcg+CLVkkcqd2sse8g64Qfg1x
 Y7I8SMElo186tzpFN4OafQdQ+l+Ee7rEFa868VQhCnhxleYbhbEsxCBMuzcsqzxswVgX
 uJBFnQFBrOa3CwG2zW4Vl53mwlbs3f0UssBYtUNifurkyLBywLQBgNHBe607BLLzx5ul
 thae9nXHj8+feeqtXXifS4CWV3VRupuZfU6J+qv7u0vr15KZGUYTTiTH/y2CNrfHKLGb
 IMWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+2+TXhQQLYdZXGCzp1QZlBvJobj8QXf6VzcRfIIpkDAiymuZScIKRSvhzvunDAUm79mJlGnj+RuQ1W3cHsBxUQB19jVw8wl7uuTbgTSyd
X-Gm-Message-State: AOJu0Yy7UkLE0rGsx1aIR6Xz/MEKdEzNYrnz5i6ne78nJw9HHxpX99wL
 tAg1U0goFz6FUCJGqkBTDTPSrGSizMnWmYRO1Q7TS9ZvForHGhgLvasCxvquMg4=
X-Google-Smtp-Source: AGHT+IGl5K7kDjgb0LE1RiE7z5Mn0bPHCIyADdQYsK8/33rqu8b6GsIF9Hj9cddcGA0YRsVeQ3UTOQ==
X-Received: by 2002:a05:600c:3582:b0:41a:bb50:92bb with SMTP id
 5b1f17b1804b1-41fea539aafmr233712465e9.0.1716291528455; 
 Tue, 21 May 2024 04:38:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42013b4e9aesm353748295e9.40.2024.05.21.04.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 04:38:47 -0700 (PDT)
Date: Tue, 21 May 2024 13:38:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH] drm/etnaviv: switch devcoredump allocations to GFP_NOWAIT
Message-ID: <ZkyHxStIbBv2JLav@phenom.ffwll.local>
References: <20240126164623.1191363-1-l.stach@pengutronix.de>
 <6c61933be624d8d6fe7609e56763e760c9721179.camel@pengutronix.de>
 <7740cc0acb7a4c6d168315ba94ad23df4f45d63a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7740cc0acb7a4c6d168315ba94ad23df4f45d63a.camel@pengutronix.de>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, May 17, 2024 at 10:18:50AM +0200, Philipp Zabel wrote:
> On Do, 2024-05-16 at 19:20 +0200, Lucas Stach wrote:
> > Am Freitag, dem 26.01.2024 um 17:46 +0100 schrieb Lucas Stach:
> > > The etnaviv devcoredump is created in the GPU reset path, which
> > > must make forward progress to avoid stalling memory reclaim on
> > > unsignalled dma fences. The currently used __GFP_NORETRY does not
> > > prohibit sleeping on direct reclaim, breaking the forward progress
> > > guarantee. Switch to GFP_NOWAIT, which allows background reclaim
> > > to be triggered, but avoids any stalls waiting for direct reclaim.
> > > 
> > Any takers for reviewing this one?
> > 
> > Regards,
> > Lucas
> > 
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > ---
> > >  drivers/gpu/drm/etnaviv/etnaviv_dump.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > > index 898f84a0fc30c..42c5028872d54 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> > > @@ -159,8 +159,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
> > >  	file_size += sizeof(*iter.hdr) * n_obj;
> > >  
> > >  	/* Allocate the file in vmalloc memory, it's likely to be big */
> > > -	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> > > -			__GFP_NORETRY);
> > > +	iter.start = __vmalloc(file_size, GFP_NOWAIT | __GFP_NOWARN);
> > >  	if (!iter.start) {
> > >  		mutex_unlock(&submit->mmu_context->lock);
> > >  		dev_warn(gpu->dev, "failed to allocate devcoredump file\n");
> > > @@ -230,5 +229,6 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
> > >  
> > >  	etnaviv_core_dump_header(&iter, ETDUMP_BUF_END, iter.data);
> > >  
> > > -	dev_coredumpv(gpu->dev, iter.start, iter.data - iter.start, GFP_KERNEL);
> > > +	dev_coredumpv(gpu->dev, iter.start, iter.data - iter.start,
> > > +		      GFP_NOWAIT | __GFP_NOWARN);
> 
> Should this be __GFP_NOWARN? There is no fallback on failure, and if
> this fails and the __vmalloc() above didn't, there is no error message
> at all.

GFP_NOWAIT already has __GFP_NOWARN, so redundant. And there's really
nothing you can do as a fallback (aside from dmesg output, which this code
already does - ok mabye dev_coredump could also do warnings, but that's a
separate patch).

With the __GFP_NOWARN dropped:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
