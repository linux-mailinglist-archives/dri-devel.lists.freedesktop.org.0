Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEAA063E6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86F310E07F;
	Wed,  8 Jan 2025 18:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZJaRFTcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5782C10E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:01:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso1247085e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736359199; x=1736963999; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6eaqDI44QDB1p2t5v1R+AWoi3oZbL3EOD2XQmLHLleQ=;
 b=ZJaRFTcD8Tvkd8+nlKeSLIreplfWWM7gRKpQMX4chxT5Oj5LGFwRUjGwIaerKZDeI6
 ihNCUxcZrrUidijArTIqWMPN1UTfI4TPyv0MDWvZFfMIm0MLBAGIeBw1YtsoKunwtmya
 kmMXY1knTYnDjy7j4A92HN6svd7dYsBxxSlYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736359199; x=1736963999;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6eaqDI44QDB1p2t5v1R+AWoi3oZbL3EOD2XQmLHLleQ=;
 b=t2i/pn6sPVglrd5JaZeEs+NPMT+8D/aEizCIfHlzeELEqjsrTD3/CP9BsFHOUaV6uW
 0HIvQ2LbJ/dYpSS36vrd1ZRgP3D7nvxlT2qG+puX14evzVOTs62YrR3CMB4fXQREy2P6
 Dq89u2aVeK+4riwZCETBwfo2DoWgIpIJTmCVblRbQTZw25XdwDulC/5luA3IRMZpqOEL
 bwORzISWuVF8p52OK4llbbXSax1z9ufh8vMzZ8Hu+uk5E/Uw4q5P8sUewn03nyFMkex4
 3qfUjWq1ODo24Rs9CSMSbZD+Bw+NaZF2FESU7hoQXSMlbseRnQohsWVEe2NXdj056PwT
 9aLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEqixp3XP88Lc05Y4ztBvgR9/1w4+/IbrezCSqHgjc2C2MxiRPC/5TefIs2YaU5DAnC3q112jyWpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0yciOFS/RA/pUsE8HAyaL2xGZUvqTNoGNVr5sCfKtHlWICzYv
 anj+EMisL6XZeTecVzHpLI1Hqau+XIdxRPIQiedEDyjthKWEQgYlMqV1saN0fNo=
X-Gm-Gg: ASbGncu5ixp91bL3h78veWS7Muekkj+ve058KtL3ZG7FLcK60wvVY4BofddsXEntRhE
 PADAR/Bd/OVpnBPkt/sgb5y5Ma5/XIdpxSg45qB+Mnlk/ZJdwZ1KoEosbaogwdl3wt1GHQ5jw+0
 JaHSBRZAeodjUwEFySaOxJzjd0U075grodsKqLziHiSfekUem0EFuzP/cKQC1/k2es7Gb2hSzdq
 1wiD63ZY2DarL/G5/An/e+Lshcbtwxf/K63lLIDVIrtvocaSSVv0th9Ol5v3OyrBcqH
X-Google-Smtp-Source: AGHT+IFpPAsxki/pJH6uIdUzMbYRV3qPhPPbWLnPOzXxLgdsVqLbQ2EprwaCH9KVlcN9/gmcJZGw1g==
X-Received: by 2002:a05:600c:3b88:b0:435:192:63fb with SMTP id
 5b1f17b1804b1-436e2686662mr32549955e9.3.1736359198894; 
 Wed, 08 Jan 2025 09:59:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc14d5sm28497265e9.11.2025.01.08.09.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:59:58 -0800 (PST)
Date: Wed, 8 Jan 2025 18:59:56 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: AW: [RFC 00/14] Deadline scheduler and other ideas
Message-ID: <Z369HN8gkxOOMAPT@phenom.ffwll.local>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <PH7PR12MB568508440AB661A0B168721A83152@PH7PR12MB5685.namprd12.prod.outlook.com>
 <Z3vfDWrQUYV7k7VJ@phenom.ffwll.local>
 <9ba4f8b8d400d937bff1f4019df68a7625408993.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ba4f8b8d400d937bff1f4019df68a7625408993.camel@redhat.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 08, 2025 at 09:07:44AM +0100, Philipp Stanner wrote:
> On Mon, 2025-01-06 at 14:47 +0100, Simona Vetter wrote:
> > On Fri, Jan 03, 2025 at 03:16:56PM +0000, Koenig, Christian wrote:
> > > [AMD Official Use Only - AMD Internal Distribution Only]
> > > 
> > > Could you send that whole patch set to me once more?
> > > 
> > > The AMD mails servers seem to have had a hickup over the holidays
> > > and
> > > all mails received between ~25.12.2024 and 1.1.2025 are somehow
> > > mangled.
> > 
> > I seem to have the same issue with fetching from lore.o.k, despite
> > that
> > the archives seem to be complete. No idea what's happened.
> 
> I could pull it just fine with b4

Yeah now they all just magically showed up. No idea what happened.
-Sima

> 
> P.
> 
> > -Sima
> > 
> > > 
> > > Thanks in advance,
> > > Christian.
> > > 
> > > ________________________________________
> > > Von: Tvrtko Ursulin <tursulin@igalia.com>
> > > Gesendet: Montag, 30. Dezember 2024 17:52
> > > An: dri-devel@lists.freedesktop.org
> > > Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian;
> > > Danilo Krummrich; Matthew Brost; Philipp Stanner
> > > Betreff: [RFC 00/14] Deadline scheduler and other ideas
> > > 
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > 
> > > <tldr>
> > > Replacing FIFO with a flavour of deadline driven scheduling and
> > > removing round-
> > > robin. Connecting the scheduler with dma-fence deadlines. First
> > > draft and
> > > testing by different drivers and feedback would be nice. I was only
> > > able to test
> > > it with amdgpu. Other drivers may not even compile.
> > > </tldr>
> > > 
> > > If I remember correctly Christian mentioned recently (give or take)
> > > that maybe
> > > round-robin could be removed. That got me thinking how and what
> > > could be
> > > improved and simplified. So I played a bit in the scheduler code
> > > and came up
> > > with something which appears to not crash at least. Whether or not
> > > there are
> > > significant advantages apart from maybe code consolidation and
> > > reduction is the
> > > main thing to be determined.
> > > 
> > > One big question is whether round-robin can really be removed. Does
> > > anyone use
> > > it, rely on it, or what are even use cases where it is much better
> > > than FIFO.
> > > 
> > > See "drm/sched: Add deadline policy" commit message for a short
> > > description on
> > > what flavour of deadline scheduling it is. But in essence it should
> > > a more fair
> > > FIFO where higher priority can not forever starve lower priorities.
> > > 
> > > "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
> > > deadlines to
> > > the scheduler because it is easy and makes logical sense with this.
> > > And I
> > > noticed userspace already uses it so why not wire it up fully.
> > > 
> > > Otherwise the series is a bit of progression from consolidating RR
> > > into FIFO
> > > code paths and going from there to deadline and then to a change in
> > > how
> > > dependencies are handled. And code simplification to 1:1 run queue
> > > to scheduler
> > > relationship, because deadline does not need per priority run
> > > queues.
> > > 
> > > There is quite a bit of code to go throught here so I think it
> > > could be even
> > > better if other drivers could give it a spin as is and see if some
> > > improvements
> > > can be detected. Or at least no regressions.
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > 
> > > Tvrtko Ursulin (14):
> > >   drm/sched: Delete unused update_job_credits
> > >   drm/sched: Remove idle entity from tree
> > >   drm/sched: Implement RR via FIFO
> > >   drm/sched: Consolidate entity run queue management
> > >   drm/sched: Move run queue related code into a separate file
> > >   drm/sched: Ignore own fence earlier
> > >   drm/sched: Resolve same scheduler dependencies earlier
> > >   drm/sched: Add deadline policy
> > >   drm/sched: Remove FIFO and RR and simplify to a single run queue
> > >   drm/sched: Queue all free credits in one worker invocation
> > >   drm/sched: Connect with dma-fence deadlines
> > >   drm/sched: Embed run queue singleton into the scheduler
> > >   dma-fence: Add helper for custom fence context when merging
> > > fences
> > >   drm/sched: Resolve all job dependencies in one go
> > > 
> > >  drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
> > >  drivers/gpu/drm/scheduler/Makefile          |   2 +-
> > >  drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
> > >  drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
> > >  drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++-----------
> > > ----
> > >  drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
> > >  include/drm/gpu_scheduler.h                 |  74 ++-
> > >  include/linux/dma-fence-unwrap.h            |  31 +-
> > >  14 files changed, 606 insertions(+), 678 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> > > 
> > > --
> > > 2.47.1
> > > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
