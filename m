Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F3A9F50C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4559610E5BA;
	Mon, 28 Apr 2025 16:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jlKRp8sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9010E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:00:28 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so6149644a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1745856027; x=1746460827; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ju0m/te+QHiEcI4eXrGOD7HxlePKof8EZ1iR5gDsFoA=;
 b=jlKRp8sj5vY62lV7bmLiNU+JqREDxqiGemt7SQ7l3G5uuZ/7qMlqNcOBRB5AbRuLu6
 fL8wiBR/cMLUL4MFA7sgvm2ul6e1eADPJz7LUA1h0/2Z3TyX4GaASwPdbVG6Vfi3wH2X
 TjtnUDyjlqp8Mq9p2EW2lSB2c7ja+uYakCGaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745856027; x=1746460827;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ju0m/te+QHiEcI4eXrGOD7HxlePKof8EZ1iR5gDsFoA=;
 b=cOOM3sqxOE3mgN3dTkeeSjbEUZD2cF3OPH2WamXSokh/uSxtwxqi7so6Zu1EC7WrLq
 ZP/e+quEF4zghCPbfonjFH1Fj153wwP8eP8xP5hZObisz07SWs7+hRJsvKt4kXEQvGTm
 we7Bk48lgL1zOAC3310UKV0ogIC3NykLNo/KSoUtWR/AtR6v3jpJsgWgX98cHpdQgSRD
 vAVk0JLvMIABo54aFp7ntTvAqVgK1t7U/9FpQL96PUxtwzz2lD8e6zWHA65ct+jXa/EM
 XTvdE7a70xFrSMkuVI0WF/Afkek0VvhamdOSbzO2m4CqjVDv7R062kIYyUS8d0kO4aRc
 EOCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRhF6zoG1shRin4rFtnYGRZyAZg39qLxKMAe/HvfwjKpDBzJkgNmUFbs6FHcSfsZ/FNm45LcT0y4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNe9a2xIb5dbd0DfIrRlEwpUlZx2hyJIG+YqOrik2B5w+mNyPH
 6Dx6k9eEJVvARV1nx5jbiBz/WuWqWcv0MWUy66c0opC/Cb8rMxeNjw4FYJ8ilMs=
X-Gm-Gg: ASbGncu5UaDrGPNGzjNWMts5+jRQ7j1q33gkNIKLxWmDpCA8iDEsNDJQJtKxuSgQDT2
 n+iJ/KtKzPaQtaFWSBPHVgm6ZMTblgSJ6zFdQVE14Oc+mrd6515dKKx/VIYaIPRxOcswY00+OUR
 JuHwOx3jZGnMGVjIl/rrhF167I6T0bmE/AARm4cPgnaAC/Nyvqsaw8KQ2KR0AqyRketKoS/4g9/
 xI1sGYf4sIm9ynQyfVEGE+3ZnEjCci9Riluv3vJd6qkHPhgnWGlu3pJL3yTZFTrBYUn3MIaZSPQ
 k5LYoWfDbF6CgdRUYeZvDeT37ozAuV0p+ShIKwP+Sw4iv4Ni4bIN
X-Google-Smtp-Source: AGHT+IGobhrNlPW8PAYgax+LM4vV2hUFDS1mN92blyYJKuh5RqZBSLMeJEn91SiPcJWgZJR9F0eutQ==
X-Received: by 2002:a17:907:971f:b0:acb:5ae1:f6b8 with SMTP id
 a640c23a62f3a-ace848c0465mr950005366b.7.1745856026876; 
 Mon, 28 Apr 2025 09:00:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecfb35bsm646493866b.100.2025.04.28.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:00:26 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:00:24 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, cgroups@vger.kernel.org
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration
Message-ID: <aA-mGO547zETZpFK@phenom.ffwll.local>
References: <20250423214321.100440-1-airlied@gmail.com>
 <4bac662a-228e-4739-b627-5d81df3d4842@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bac662a-228e-4739-b627-5d81df3d4842@amd.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Mon, Apr 28, 2025 at 12:43:30PM +0200, Christian König wrote:
> On 4/23/25 23:37, Dave Airlie wrote:
> > Hey,
> > 
> > I've been tasked to look into this, and I'm going start from hopeless
> > naivety and see how far I can get. This is an initial attempt to hook
> > TTM system memory allocations into memcg and account for them.
> 
> Yeah, this looks mostly like what we had already discussed.
> 
> > 
> > It does:
> > 1. Adds memcg GPU statistic,
> > 2. Adds TTM memcg pointer for drivers to set on their user object
> > allocation paths
> > 3. Adds a singular path where we account for memory in TTM on cached
> > non-pooled non-dma allocations. Cached memory allocations used to be
> > pooled but we dropped that a while back which makes them the best target
> > to start attacking this from.
> 
> I think that should go into the resource like the existing dmem approach
> instead. That allows drivers to control the accounting through the
> placement which is far less error prone than the context.
> 
> It would also completely avoid the pooled vs unpooled problematic.
> 
> 
> > 4. It only accounts for memory that is allocated directly from a userspace
> > TTM operation (like page faults or validation). It *doesn't* account for
> > memory allocated in eviction paths due to device memory pressure.
> 
> Yeah, that's something I totally agree on.
> 
> But the major show stopper is still accounting to memcg will break
> existing userspace. E.g. display servers can get attacked with a deny of
> service with that.
> 
> The feature would need to be behind a module option or not account
> allocations for DRM masters or something like that.

The trouble is that support is very uneven, and it will be even more
uneven going forward. Especially if we then also add in SoC drivers, which
have all kinds of fun between system memory, cma, carveout and userptr all
being differently accounted for.

Which means I think we need two pieces here:

1. opt-in enabling, or things break

2. some way to figure out whether what userspace expects in term of
enforcement matches what the kernel actually does

Without two we'll never manage to get this beyond the initial demo stage I
fear, and we'll have a really hard time rolling out the various pieces to
various drivers.

But I have no idea what this should look like at all unfortuantely. Best I
can come up with is a set of flags of what kind of enforcement the kernel
does, and every time we add something new we set a new flag. And if the
flags userspace or the modoption opt-in sets don't match what the kernel
supports, you get a fallback to no enforcment.

But a module option flag approach doesn't cover at all per-driver or
per-device changes. I think for that we need the kernel to provide enough
information to userspace in sysfs, which userspace then needs to use to
set/update cgroup limits to fit whatever use-case it case. Or maybe a
per-device opt-in flag set.

Also I think the only fallback we can realistically provide is "no
enforcement", and that would technically be a regression every time we add
a new enforcement feature and hence another opt-in flag. And see below
with just the eviction example, I think there's plenty of really tricky
areas where we will just never get to the end state in one step, because
it's too much work and too hard to get right from the first attempt.

I think once we have a decent opt-in/forward-compatible strategy for
cgroups gpu features, adding not-entirely-complete solutions to get this
moving is the right thing to do.

> > This seems to work for me here on my hacked up tests systems at least, I
> > can see the GPU stats moving and they look sane.
> > 
> > Future work:
> > Account for pooled non-cached
> > Account for pooled dma allocations (no idea how that looks)
> > Figure out if accounting for eviction is possible, and what it might look
> > like.
> 
> T.J. suggested to account but don't limit the evictions and I think that
> should work.

I think this will need a ladder of implementations, where we slowly get to
a full featured place. Maybe something like:

1. Don't account evicted buffers. Pretty obvious gap if you're on a dgpu,
but entirely fine with an igpu without stolen memory.

2. Account, but don't enforce any limits on evictions. This could already
get funny if then system memory allocations start failing for random
reasons due to memory pressure from other processes.

3. Probably at this point we need a memcg aware shrinker in ttm drivers
that want to go further.

4. Start enforcing limits even on eviction.

I probably missed a few steps, like about enforcing dmem limits. And
memory pin limits also tie into this all in interesting ways (both for
system and device memory).

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
