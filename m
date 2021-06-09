Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355113A1CD0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 20:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244F56EACD;
	Wed,  9 Jun 2021 18:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DDE6EAAD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 18:31:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z8so26510811wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lx83ZGKt+iDDXrwOclg8FQkbL0UmQ1IZwGRbLXheO1w=;
 b=EXMmfevkhi93LOs2hao75VuWkhgTE0SBQDtgyIDY+oIpuXGrg7PpRG/MCbqeIPDIyq
 CEghl6xFEU5AW5K7CNjcgYcs4ErkvuRlVDpD0OqnDXX97Gm6Rf7XGSf6OMNCRnW5c4E5
 C5YGfgRO+qByDYlUVdYwfgve5ufbaIj8Fa3Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lx83ZGKt+iDDXrwOclg8FQkbL0UmQ1IZwGRbLXheO1w=;
 b=UzsrmaQVMUHjRsfzqk0twXl4L8Sil3Qa2McYEhf2uotwhGct9n3J8mQVHgaq2tpBGi
 ANu8/0y6ZtRk2R3qnt/Uc8oubddx/uSXrxcvervYNH8joeqSWt8PxcwmZfWafSBHEM2g
 NcjNECww7AWrv6Yo2I8teBSC76lXF1gQXH1tbd5udw99+s1mcR9l0YA7W875ZsPW1yr7
 7Ohzt30GIypuqrUAW9kyyb1FikLr7JLEfvpd4+iLIdN6Tj/daDVqSFcpYL/4LQYwpnvp
 8BCwoqryAfObWZqdcjKvCLymPAdJFyCGVyawl4R4Xzq8Ez7Rbny9ySBpQV/WOjKkdMVX
 fn1g==
X-Gm-Message-State: AOAM531KRRlSK4yJEvTWQ08tut0juaW/N8sa1LqrLPE1gZ5D5ZFN35tU
 a/e2S0D/m6JapKYvxO9zn4Lfxw==
X-Google-Smtp-Source: ABdhPJzhI0yAfakknfD6QQuIuWSQu2OQvFa44iraaPib8MfSn6+7vL0kuZypDXzo7UjNMVrkrKjgOw==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr1153791wrv.343.1623263476425; 
 Wed, 09 Jun 2021 11:31:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f8sm524858wmg.43.2021.06.09.11.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:31:15 -0700 (PDT)
Date: Wed, 9 Jun 2021 20:31:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <YMEI8pcXpt22gi3D@phenom.ffwll.local>
References: <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
 <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
 <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
 <YLnq6Vuf4amZld3n@phenom.ffwll.local>
 <586edeb3-73df-3da2-4925-1829712cba8b@gmail.com>
 <YMC/4IhCePCu57HU@phenom.ffwll.local>
 <1478737b-88aa-a24a-d2d7-cd3716df0cb0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1478737b-88aa-a24a-d2d7-cd3716df0cb0@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 03:58:26PM +0200, Christian König wrote:
> Am 09.06.21 um 15:19 schrieb Daniel Vetter:
> > [SNIP]
> > > Yeah, we call this the lightweight and the heavyweight tlb flush.
> > > 
> > > The lighweight can be used when you are sure that you don't have any of the
> > > PTEs currently in flight in the 3D/DMA engine and you just need to
> > > invalidate the TLB.
> > > 
> > > The heavyweight must be used when you need to invalidate the TLB *AND* make
> > > sure that no concurrently operation moves new stuff into the TLB.
> > > 
> > > The problem is for this use case we have to use the heavyweight one.
> > Just for my own curiosity: So the lightweight flush is only for in-between
> > CS when you know access is idle? Or does that also not work if userspace
> > has a CS on a dma engine going at the same time because the tlb aren't
> > isolated enough between engines?
> 
> More or less correct, yes.
> 
> The problem is a lightweight flush only invalidates the TLB, but doesn't
> take care of entries which have been handed out to the different engines.
> 
> In other words what can happen is the following:
> 
> 1. Shader asks TLB to resolve address X.
> 2. TLB looks into its cache and can't find address X so it asks the walker
> to resolve.
> 3. Walker comes back with result for address X and TLB puts that into its
> cache and gives it to Shader.
> 4. Shader starts doing some operation using result for address X.
> 5. You send lightweight TLB invalidate and TLB throws away cached values for
> address X.
> 6. Shader happily still uses whatever the TLB gave to it in step 3 to
> accesses address X
> 
> See it like the shader has their own 1 entry L0 TLB cache which is not
> affected by the lightweight flush.
> 
> The heavyweight flush on the other hand sends out a broadcast signal to
> everybody and only comes back when we are sure that an address is not in use
> any more.

Ah makes sense. On intel the shaders only operate in VA, everything goes
around as explicit async messages to IO blocks. So we don't have this, the
only difference in tlb flushes is between tlb flush in the IB and an mmio
one which is independent for anything currently being executed on an
egine.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
