Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B83B3F00E8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 11:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA6B89AB2;
	Wed, 18 Aug 2021 09:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4518389ABE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:49:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i22so2164611edq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IbsdFsZvgtzHkO3O8nnMZG8gO0+9zl+nSJ0tzY18DoE=;
 b=cyFMrvp0ChIA6UGySvE6yQf4XnXdD8JzWXT/G84t6YJ+xCxdoEnZtAEAAyzPt0V8vg
 YYAY+HZf9m1U2mrtPEF5kBbMSSu8iYcYv+cSV+m3E46UcpUwI0atYHQWfTGepHpRm9cY
 io8N8p2NRIwxQlWZm7Vq04XFCH+hyh36+3hRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IbsdFsZvgtzHkO3O8nnMZG8gO0+9zl+nSJ0tzY18DoE=;
 b=OYd6u8Tz+5YjTNzZTV1nzaxACM12zchKWIG5A8SAehrDSUWNGEZ7sZlspvXwS0jgSE
 AE+gD8/GlTpauWUTr/3zySeRiQYwkJSWyDK1uFnWgfTgV4vtUvpES0oWV5v+X27PlFIo
 sDb4KLzGoqESpnskyZdoN8BJ1ENKpVhxbcIS5ZF3IPyGp7ip6wSzscqNW02j64t+8TqV
 ErY4mugnFCK6g9NT6cz+dzm7Yu/zU5YHCxDzhFNUv2yEJ36qHtwh6Ikdc1YNrDdZsbI4
 W2h29OGgtCrhYVLzYA8+QL45Wsrgob5tSZtLdKbVJi2Gr1eiP8pKHGCQDIdT7PgwzBaJ
 afhw==
X-Gm-Message-State: AOAM53287h4lwy82gakLJYZ+coi5CAipvcZHMQ7DK/JHNsBCoACexqE1
 65OKkfjL1iJFddE5YJHFDh1Ycg==
X-Google-Smtp-Source: ABdhPJyOl7QAulb19tzbvtI0mIJFKXvS9qEiUdchkVc676PBczU9kytbdMOorbEK3VEzRSwg7dwJxw==
X-Received: by 2002:a05:6402:202:: with SMTP id
 t2mr9205392edv.116.1629280180727; 
 Wed, 18 Aug 2021 02:49:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e7sm2481505edk.3.2021.08.18.02.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 02:49:40 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:49:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Harrison <john.c.harrison@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/1] Fix gem_ctx_persistence failures with
 GuC submission
Message-ID: <YRzXssmALC1v6C9w@phenom.ffwll.local>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <YRIe8jEI+0TLreAI@phenom.ffwll.local>
 <669f9d98-8128-eb4f-60f7-342c79f7f428@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <669f9d98-8128-eb4f-60f7-342c79f7f428@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 05:08:02PM -0700, John Harrison wrote:
> On 8/9/2021 23:38, Daniel Vetter wrote:
> > On Wed, Jul 28, 2021 at 05:33:59PM -0700, Matthew Brost wrote:
> > > Should fix below failures with GuC submission for the following tests:
> > > gem_exec_balancer --r noheartbeat
> > > gem_ctx_persistence --r heartbeat-close
> > > 
> > > Not going to fix:
> > > gem_ctx_persistence --r heartbeat-many
> > > gem_ctx_persistence --r heartbeat-stop
> > After looking at that big thread and being very confused: Are we fixing an
> > actual use-case here, or is this another case of blindly following igts
> > tests just because they exist?
> My understanding is that this is established behaviour and therefore must be
> maintained because the UAPI (whether documented or not) is inviolate.
> Therefore IGTs have been written to validate this past behaviour and now we
> must conform to the IGTs in order to keep the existing behaviour unchanged.

No, we do not need to blindly conform to igts. We've found enough examples
in the past few months where the igt tests where just testing stuff
because it's possible, not because any UMD actually needs the behaviour.

And drm subsystem rules are very clear that low-level tests do _not_
qualify as userspace, so if they're wrong we just have to fix them.

> Whether anybody actually makes use of this behaviour or not is another
> matter entirely. I am certainly not aware of any vital use case. Others
> might have more recollection. I do know that we tell the UMD teams to
> explicitly disable persistence on every context they create.

Does that include mesa?

> > I'm leaning towards that we should stall on this, and first document what
> > exactly is the actual intention behind all this, and then fix up the tests
> I'm not sure there ever was an 'intention'. The rumour I heard way back when
> was that persistence was a bug on earlier platforms (or possibly we didn't
> have hardware support for doing engine resets?). But once the bug was
> realised (or the hardware support was added), it was too late to change the
> default behaviour because existing kernel behaviour must never change on
> pain of painful things. Thus the persistence flag was added so that people
> could opt out of the broken, leaky behaviour and have their contexts clean
> up properly.
> 
> Feel free to document what you believe should be the behaviour from a
> software architect point of view. Any documentation I produce is basically
> going to be created by reverse engineering the existing code. That is the
> only 'spec' that I am aware of and as I keep saying, I personally think it
> is a totally broken concept that should just be removed.

There is most likely no spec except "what does current userspace actually
expect". Yes this sucks. Also if you expect me to do this, I'm backlogged
by a few months on random studies here, and largely this boils down to
checking all the umds and checking what they actually need.

Important: What igt does doesn't matter if there's not a corresponding
real world umd use-case.

> > to match (if needed). And only then fix up GuC to match whatever we
> > actually want to do.
> I also still maintain there is no 'fix up the GuC'. This is not behaviour we
> should be adding to a hardware scheduler. It is behaviour that should be
> implemented at the front end not the back end. If we absolutely need to do
> this then we need to do it solely at the context management level not at the
> back end submission level. And the solution should work by default on any
> submission back end.

With "Fix up GuC" I dont mean necessarily the guc fw, but our entire
backend. We can very much fix that to fix most anything reasonable.

Also we don't actually need the same solution on all backends, because the
uapi can have slight differences across platforms. That's why changing the
defaults is so hard once they're set in stone.
-Daniel

> 
> John.
> 
> 
> > -Daniel
> > 
> > > As the above tests change the heartbeat value to 0 (off) after the
> > > context is closed and we have no way to detect that with GuC submission
> > > unless we keep a list of closed but running contexts which seems like
> > > overkill for a non-real world use case. We likely should just skip these
> > > tests with GuC submission.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Matthew Brost (1):
> > >    drm/i915: Check if engine has heartbeat when closing a context
> > > 
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
> > >   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
> > >   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
> > >   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
> > >   6 files changed, 26 insertions(+), 24 deletions(-)
> > > 
> > > -- 
> > > 2.28.0
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
