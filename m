Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77DABB4FE
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 08:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503A910E248;
	Mon, 19 May 2025 06:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g5i9VPw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACC610E248
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:18:51 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so672283266b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 23:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747635530; x=1748240330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vK0gx1ykqEks3iig04qjuy13U8xSjbAqQzrJA0P4uP4=;
 b=g5i9VPw5agYHyEePOT2/AO+XspB6YQLQopR7J/HiTDyg3WI9SHjcY6U7CKb1Drqf7o
 54sPP0G1t/znLr6PfcDt5yhagF6XAFhE/Y/zsRF1tBv07z46irICU3kl5as7jNheqGM2
 CIrSoCI/WtyYsi0HzTeLlvbGxXJzwDxvampPQOXS3Ef++DdinA135ROXTD/w8wCjAQip
 0HNtP4GUGzOonR1r+/sSUMq8n8MV87sWiZSyYqe3tnF8HMD2PKxmeOqvYdQQneq7YPGj
 k2alfFpPkredvzws/ql7TGDgdbsgIWnGJHrz0o3Fox95KPJfNGzvbYFwgRrMU42/r6VD
 V3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747635530; x=1748240330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vK0gx1ykqEks3iig04qjuy13U8xSjbAqQzrJA0P4uP4=;
 b=WmMKTvrptCYSY3JEWM67ZIsPu/TY90sqYtm6IHFECyU+20RjjMHbFRSei9gGtBHXer
 09uzONtY3hI8/LVDwOabl0HrV1PMaOom/7AM8wlSHGGhXHIZgWUs6/kQBVEzb0mm7SVG
 CatbLExsxl6cfN0+dvyljyaG4BsuXCw1hRDpuQjcSfmRxVycWpiktJXAiqtj/PU1Eqqo
 R0HuVPsgPr+0FBLdshLCNdElP5up/oNThyabNkO+sbpZX3DV5jdZk0khstjE5bcwpRvs
 cBpmfo3PA53qJo9AV3w46zqyBqhyvZb8eF0GURKhsqzfP3EBbmlFOSEC8dusfOHjd87T
 STLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmi7l9k39OLPoITyw+G0GpcE2lhFhe+cK1HXvCHt6P4KdhaUeD5VW22UIBWWFlaa1S95Br51HLhNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR/aj4QSmjUDFI/wyC/vU77+3DffRHlb2ZYnBjS5bvx/4Isb/o
 eR9iasEWFdTxMV+AqzVe+dAooOTHXcoF/q/hk7YxRYUKD59p9Y3kp86LghjtAniU7YPAE9ptM9H
 dFbQUCs3vPyNuN6HHKv34G+Ayc3VX+sI=
X-Gm-Gg: ASbGncvExqvJ92RvpSblEHvalwpduhLOcO/lD7CZsgU+y9OZT4ODqCCh/AX5PKRfTTs
 Z5XRT0/b/rzwXMD2S8Hs88kZ0Q2NDZFqTg6C7dxMoeas05tf4V6g5GZP7SXWTfES7aNRtUKkkIy
 zcaBzizCSv3A8+YZ2JjP4oTR4neGsEy2M=
X-Google-Smtp-Source: AGHT+IED1MGrTJUgDiXAUoxy2ZS37P5iCwFTBvVZgDuAbwR2oTt4wpSQ5cSDfGjdU1nNJ3yVKy67BGxv6DklZhbROQ0=
X-Received: by 2002:a17:907:1c2a:b0:ad2:3fa9:751f with SMTP id
 a640c23a62f3a-ad536dce3demr987314466b.38.1747635529329; Sun, 18 May 2025
 23:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <5c0df728-2100-4078-8020-4aac8eb31d2b@amd.com>
In-Reply-To: <5c0df728-2100-4078-8020-4aac8eb31d2b@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 19 May 2025 16:18:37 +1000
X-Gm-Features: AX0GCFuphdrkbUIehiBml6CnXJWdoRvQjaJ47FArohPiypk3t12x3bE1pnOOt84
Message-ID: <CAPM=9tysB4iNkGViN1iaGXjPC7y=YwB05ReHdUVR_-4zHahEFg@mail.gmail.com>
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 19 May 2025 at 02:28, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 5/16/25 22:25, Dave Airlie wrote:
> > On Sat, 17 May 2025 at 06:04, Johannes Weiner <hannes@cmpxchg.org> wrot=
e:
> >>> The memory properties are similar to what GFP_DMA or GFP_DMA32
> >>> provide.
> >>>
> >>> The reasons we haven't moved this into the core memory management is
> >>> because it is completely x86 specific and only used by a rather
> >>> specific group of devices.
> >>
> >> I fully understand that. It's about memory properties.
> >>
> >> What I think you're also saying is that the best solution would be
> >> that you could ask the core MM for pages with a specific property, and
> >> it would hand you pages that were previously freed with those same
> >> properties. Or, if none such pages are on the freelists, it would grab
> >> free pages with different properties and convert them on the fly.
> >>
> >> For all intents and purposes, this free memory would then be trivially
> >> fungible between drm use, non-drm use, and different cgroups - except
> >> for a few CPU cycles when converting but that's *probably* negligible?
> >> And now you could get rid of the "hack" in drm and didn't have to hang
> >> on to special-property pages and implement a shrinker at all.
> >>
> >> So far so good.
> >>
> >> But that just isn't the implementation of today. And the devil is very
> >> much in the details with this:
> >>
> >> Your memory attribute conversions are currently tied to a *shrinker*.
> >>
> >> This means the conversion doesn't trivially happen in the allocator,
> >> it happens from *reclaim context*.
>
> Ah! At least I now understand your concern here.
>
> >> Now *your* shrinker is fairly cheap to run, so I do understand when
> >> you're saying in exasperation: We give this memory back if somebody
> >> needs it for other purposes. What *is* the big deal?
> >>
> >> The *reclaim context* is the big deal. The problem is *all the other
> >> shrinkers that run at this time as well*. Because you held onto those
> >> pages long enough that they contributed to a bonafide, general memory
> >> shortage situation. And *that* has consequences for other cgroups.
>
> No it doesn't, or at least not as much as you think.
>
> We have gone back and forth on this multiple times already when discussio=
n the shrinker implementations. See the DRM mailing list about both the TTM=
 and the GEM shared mem shrinker.
>
> The TTM pool shrinker is basically just a nice to have feature which is u=
sed to avoid deny of service attacks and allows to kick in when use cases c=
hange. E.g. between installing software (gcc) and running software (Blender=
, ROCm etc..).
>
> In other words the TTM shrinker is not even optimized and spends tons of =
extra CPU cycles because the expectation is that it never really triggers i=
n practice.
>
> > I think this is where we have 2 options:
> > (a) moving this stuff into core mm and out of shrinker context
> > (b) fix our shrinker to be cgroup aware and solve that first.
>
> (c) give better priorities to the shrinker API.
>
> E.g. the shrinker for example assumes that the users of the API must scan=
 the pages to be able to clean them up.

Well my again naive approach is to just add simpler low-overhead
shrinkers to the start of the shrinker list and if they free up enough
memory then win, otherwise we were in reclaim anyways,

however this asks the question if just going into reclaim and having
to touch any shrinkers at all is bad, if the overheads of just doing
that aren't acceptable then we would need to come up with a better way
I suspect?

adding a single shrinker flag to put the ttm shrinker at the top of
the list is pretty trivial.

Thanks for use-cases that probably matter, I can see the online gaming
workloads being useful overhead reduction.

There probably isn't much appetite to just migrate the ttm pools into
the core mm, I see a couple of other users like sound do set_memory_*
calls, but I doubt they are on the radar for how much it costs.

Dave.
