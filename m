Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E023D71CD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65A56E49D;
	Tue, 27 Jul 2021 09:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCD16E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:17:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l4so14329519wrs.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pJADEBr0lK6P7+G+8gSoVZQ35Hq49xlvXJGQN1nspaw=;
 b=hJWLgwhFryooSXpByHHvflMOL3FknNzBheooAV7e64Vn7wfXkAA8oYR23powhQpuJo
 r2rQ4aBurUv9rLi4HmHfD1vG3H/mPA+Rokm/JNDsmaofkX18fVDBs+kpdG4RjgZ77d5+
 vrLZ5MQuWFX8GW+1Qj3Mnx+fZE+38JzxXvdLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pJADEBr0lK6P7+G+8gSoVZQ35Hq49xlvXJGQN1nspaw=;
 b=WI7V7N/NURrd6fLe9iKJUBXhh2IxrJ+d9FGjrSTHnstZpMDsaqFrDiE+qgknH7AvcU
 JVBRLXzBO41NJa4gJAUTTrmilymmshA0+4mMx5faTrp4I01POMkkg7I5H53+TW4Ct3T+
 Uz5OgVQmGYmm8f7JKvIoSqSAUrKoYw43n0a/rVDhT4UOiYuCLoQ7WsujijIl5fhLlDTD
 JPiD05fWVXWsrIEb5dsrYTOB1c4GRO8ICnmi/vsLaVxKN18uYdvjeVaF+Dfl6WDARNYB
 p7ow1rAesezl4mEDFdfDZ8trxfSB7KDkhBgmC0QXWGWa+esW0lEXnuwyrAKhTKYdmnQN
 6efg==
X-Gm-Message-State: AOAM530aRnYcE4ygKlD9ZPXJLp70uuFRTsjkM/mydukrA6qRcGkBqaeQ
 hHRiymgTasC9ECFEHK6weTdArg==
X-Google-Smtp-Source: ABdhPJyzP7y69x6iByJII/DKyp3G4erRPx4NiFE3mtqBren7+te/t6LUIfckZ2OO9vuwEC6Zfj6foA==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr6071426wrs.12.1627377468957;
 Tue, 27 Jul 2021 02:17:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o28sm2675169wra.71.2021.07.27.02.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:17:48 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:17:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <YP/PMvbsMS7H/5Sy@phenom.ffwll.local>
References: <20210705082950.3573841-1-boris.brezillon@collabora.com>
 <20210705082950.3573841-6-boris.brezillon@collabora.com>
 <YOLRnPjCDkc9DRxE@phenom.ffwll.local>
 <1fe2d843-041d-40f6-b552-91f159487495@gmail.com>
 <20210726122706.7fb3a8d5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726122706.7fb3a8d5@collabora.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 12:27:06PM +0200, Boris Brezillon wrote:
> On Thu, 8 Jul 2021 14:10:45 +0200
> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
> 
> > >> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > >> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > >> @@ -254,6 +254,9 @@ static int panfrost_acquire_object_fences(struct panfrost_job *job)
> > >>   				return ret;
> > >>   		}
> > >>   
> > >> +		if (job->bo_flags[i] & PANFROST_BO_REF_NO_IMPLICIT_DEP)
> > >> +			continue;  
> > > This breaks dma_resv rules. I'll send out patch set fixing this pattern in
> > > other drivers, I'll ping you on that for what you need to change. Should
> > > go out today or so.
> 
> I guess you're talking about [1]. TBH, I don't quite see the point of
> exposing a 'no-implicit' flag if we end up forcing this implicit dep
> anyway, but I'm probably missing something.

Yeah that's the patch set.

Note that there's better ways to do this, it's just that these better ways
take more typing and need some actual testing (and ideally igts and
everything).

The NO_IMPLICIT flag is still useful even with the hacky solution, as long
as you don't set a write fence too. For that it might be better to look
into the dma_fence import patch from Jason:

https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/

> > I'm really wondering if the behavior that the exclusive fences replaces 
> > all the shared fences was such a good idea.
> 
> Is that what's done in [1], or are you talking about a different
> patchset/approach?

That's just how dma_resv works for the exclusive slot.
-Daniel

> 
> > 
> > It just allows drivers to mess up things in a way which can be easily 
> > used to compromise the system.
> 
> I must admit I'm a bit lost, so I'm tempted to drop that flag for now
> :-).
> 
> [1]https://patchwork.freedesktop.org/patch/443711/?series=92334&rev=3

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
