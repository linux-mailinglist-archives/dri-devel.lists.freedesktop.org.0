Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B212763FF1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 21:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0744510E4AD;
	Wed, 26 Jul 2023 19:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9517110E096;
 Wed, 26 Jul 2023 19:50:00 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bba04b9df3so1470525ad.0; 
 Wed, 26 Jul 2023 12:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690401000; x=1691005800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=o0fC+88gZBz8jtA7XWzXX83zAKhjWaVQ+UtgjI6/8g4=;
 b=oukBQFR9IQO7+GHjeNafPLNndng0nKABjpaczwth9BgzQpiqLcIQmG3R0hQGndcxJm
 cYdWVh5nwhTZeVggUqY+dTHuIGwyN30/6fp2sp0wyfL72IGfNgg/LyhmK/aOsL0qe9rh
 hdl08+mPzCse2OTUc3DCOSQQdlnPnOVKbMtUM7PQdS9pjxjPVU1Ss81NUNDkqum4hDE7
 kbOOH4W3oJ+SWJh62vMxckP4920VO+vrtvTrkBs9b9GwH/Y8ktjUNvzdGAnSNbKu64a/
 V4UOi3avOQ9xPragbr0BWF/d/6EXsVAYc16BmiSMrYcqsAW0FvN+x0wHlEhYvWG6eIOr
 cRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690401000; x=1691005800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0fC+88gZBz8jtA7XWzXX83zAKhjWaVQ+UtgjI6/8g4=;
 b=kSuacYTvIVIXEkd1a3oSLcxSyeXQLctyXfoSETae3iz897qPzE3viCo0Z1wE30PHQ9
 0Es7WBMWQorvAR640PvdD/mxLpJ4VAsO7QaNjAhx8Kp6Avc5Pbpa62Nc9VMMDlccuRiR
 2EWrC/UD/YJnasTsp2J51lgiTmwcFpVHevDPncpOSnS20CkeGBPkMOnLpWnUNDgLyaBi
 VUdmDNBBSt0Lmei6NJ3/0+SArMbSiOfHrCnRqEriHh7epoFM6cRe5v27B44cMlHHWESM
 /zGG7ENe2fITod/oxeBBJnwRbVpSXZAL8VP3x9Drni1tVpoymaUi9fJ/L68GlbhDpG32
 BUJA==
X-Gm-Message-State: ABy/qLbBlsixPFXK1wJFLVCApoIydWsHt9hdNJnj+b7X32triS334+YU
 vSpLnjfXt57NPZdvFmV15z4=
X-Google-Smtp-Source: APBJJlH9zA2mvZYIt6QxxOCW9WRumbHaz6Bvl8nhJS60Ba3BomJSyn3mO77wiPDJYkyr1sgu1cfIgw==
X-Received: by 2002:a17:903:2286:b0:1b8:66f6:87a3 with SMTP id
 b6-20020a170903228600b001b866f687a3mr3538222plh.52.1690400999964; 
 Wed, 26 Jul 2023 12:49:59 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:18d])
 by smtp.gmail.com with ESMTPSA id
 iy12-20020a170903130c00b001bbb25dd3a7sm5477801plb.187.2023.07.26.12.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 12:49:59 -0700 (PDT)
Date: Wed, 26 Jul 2023 09:49:57 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 16/17] cgroup/drm: Expose memory stats
Message-ID: <ZMF45fhrZhiNdn53@slm.duckdns.org>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
 <20230712114605.519432-17-tvrtko.ursulin@linux.intel.com>
 <ZLsFBHqCQdPHoZVw@slm.duckdns.org>
 <8959f665-4353-3630-a6c7-5dca60959faa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8959f665-4353-3630-a6c7-5dca60959faa@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, Jul 26, 2023 at 05:44:28PM +0100, Tvrtko Ursulin wrote:
...
> > So, yeah, if you want to add memory controls, we better think through how
> > the fd ownership migration should work.
> 
> It would be quite easy to make the implicit migration fail - just the matter
> of failing the first ioctl, which is what triggers the migration, after the
> file descriptor access from a new owner.

So, it'd be best if there's no migration involved at all as per the
discussion with Maarten.

> But I don't think I can really add that in the RFC given I have no hard
> controls or anything like that.
> 
> With GPU usage throttling it doesn't really apply, at least I don't think it
> does, since even when migrated to a lower budget group it would just get
> immediately de-prioritized.
> 
> I don't think hard GPU time limits are feasible in general, and while soft
> might be, again I don't see that any limiting would necessarily have to run
> immediately on implicit migration.

Yeah, I wouldn't worry about hard allocation of GPU time. CPU RT control
does that but it's barely used.

> Second part of the story are hypothetical/future memory controls.
> 
> I think first thing to say is that implicit migration is important, but it
> is not really established to use the file descriptor from two places or to
> migrate more than once. It is simply fresh fd which gets sent to clients
> from Xorg, which is one of the legacy ways of doing things.
> 
> So we probably can just ignore that given no significant amount of memory
> ownership would be getting migrated.

So, if this is the case, it'd be better to clarify this. ie. if the summary is:

fd gets assigned to the user with a certain action at which point the fd
doesn't have significant resources attached to it and the fd can't be moved
to some other cgroup afterwards.

then, everything is pretty simple. No need to worry about migration at all.
fd just gets assigned once at the beginning and everything gets accounted
towards that afterwards.

> And for drm.memory.stat I think what I have is good enough - both private
> and shared data get accounted, for any clients that have handles to
> particular buffers.
> 
> Maarten was working on memory controls so maybe he would have more thoughts
> on memory ownership and implicit migration.
> 
> But I don't think there is anything incompatible with that and
> drm.memory.stats as proposed here, given how the categories reported are the
> established ones from the DRM fdinfo spec, and it is fact of the matter that
> we can have multiple memory regions per driver.
> 
> The main thing that would change between this RFC and future memory controls
> in the area of drm.memory.stat is the implementation - it would have to get
> changed under the hood from "collect on query" to "account at
> allocation/free/etc". But that is just implementation details.

I'd much prefer to straighten out this before adding a prelimiary stat only
thing. If the previously described ownership model is sufficient, none of
this is complicated, right? We can just add counters to track the resources
and print them out.

Thanks.

-- 
tejun
