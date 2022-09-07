Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1713C5AFC24
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8138010E32A;
	Wed,  7 Sep 2022 06:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F5110E32F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:08:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id q21so10486098edc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 23:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=s4afVmtZrj2yE4ZH0qN126RX1/YJ7bOqfTTyi6e2VfQ=;
 b=iNvn+xFvBU3gG202ZB3IxSE7E2zfsCPETADmVVvwwTaGefLtdfoy13uL4QSQFdeNan
 9KOVmrIvNndmzBekqn1tpdVMjkUJ+CBJlvMm8KODLzsp7jZnH0z23WCuZHdkPqOVkM/8
 NW9A/F0g4Z5oKQjAcynPAWs3/rgX/QQTVAs7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=s4afVmtZrj2yE4ZH0qN126RX1/YJ7bOqfTTyi6e2VfQ=;
 b=RGm3m/JAgnbozEA6y7eoEHQOJ6Zfz2Igna1lb1QFSUuv7OTnFMQrXglj5mkOzpmtMh
 QyXI2pvr/1Bt4KBPRUoNivAj5gK6qJiUKZpbN/prBPkeiwdzO6BD4wB0uPg3w6irI7fR
 6ArweDQqvJGP2TFdeDrfAO65JHcB3EGMNXZW/7eaSMcGA1J6/loEG0/XwY9wIib2yHIi
 3v9sQaMNOl9cP6tDrAKDd7GHnYLwwxg05jm4VS3BaXa1zz6L6HhpyOleIcL2m4Gn2Ovf
 mMvb5ArPqCJiMBvNbmEhlyW12oMWVQInDOra2GL8gj/avfPb1C2wXjSJBqvsKW3mYgl2
 AcUw==
X-Gm-Message-State: ACgBeo0ffNUrm3jQgpHmc2gGlm3xN5hOhGfLF6Zj6uUzvnlc6AlRsqQf
 wvIvEF9GtBi3ct+Jr+rEfL7+qw==
X-Google-Smtp-Source: AA6agR77BAciYBgwqpKnAc9x8rLCWXKGOPypzZ9RHfLUvfx/sMK/oygA+CUYL6PI6U3Cntlx11hJhQ==
X-Received: by 2002:a05:6402:2804:b0:439:83c2:8be2 with SMTP id
 h4-20020a056402280400b0043983c28be2mr1748729ede.292.1662530922538; 
 Tue, 06 Sep 2022 23:08:42 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 m14-20020a1709062b8e00b0072f42ca292bsm7642841ejg.129.2022.09.06.23.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 23:08:41 -0700 (PDT)
Date: Wed, 7 Sep 2022 08:08:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <Yxg1Z8SzpcuTpRAC@phenom.ffwll.local>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
 <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
 <YvUz2Nk6YHl+jVwR@phenom.ffwll.local> <YvXtQ7/FJFSVXlGU@kroah.com>
 <Yxec8VRCQT5fJdqk@phenom.ffwll.local> <YxgwXgEpzyqg0cjR@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxgwXgEpzyqg0cjR@kroah.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 07:47:10AM +0200, Greg KH wrote:
> On Tue, Sep 06, 2022 at 09:18:09PM +0200, Daniel Vetter wrote:
> > On Fri, Aug 12, 2022 at 08:03:47AM +0200, Greg KH wrote:
> > > On Thu, Aug 11, 2022 at 06:52:40PM +0200, Daniel Vetter wrote:
> > > > On Wed, Aug 03, 2022 at 04:13:05PM -0400, Jason Baron wrote:
> > > > > 
> > > > > 
> > > > > On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> > > > > > On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
> > > > > >>
> > > > > > 
> > > > > >> Hi Jason, Greg, DRM-folk,
> > > > > >>
> > > > > >> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
> > > > > >> means either DISJOINT (like drm debug categories), or VERBOSE (like
> > > > > >> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
> > > > > >> drivers i915, amdgpu, nouveau.
> > > > > >>
> > > > > > 
> > > > > > This revision fell over, on a conflict with something in drm-MUMBLE
> > > > > > 
> > > > > > Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> > > > > > not applied
> > > > > > Applying: dyndbg: fix static_branch manipulation
> > > > > > Applying: dyndbg: fix module.dyndbg handling
> > > > > > Applying: dyndbg: show both old and new in change-info
> > > > > > Applying: dyndbg: reverse module walk in cat control
> > > > > > Applying: dyndbg: reverse module.callsite walk in cat control
> > > > > > Applying: dyndbg: use ESCAPE_SPACE for cat control
> > > > > > Applying: dyndbg: let query-modname override actual module name
> > > > > > Applying: dyndbg: add test_dynamic_debug module
> > > > > > Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> > > > > > 
> > > > > > Jason,
> > > > > > those above are decent maintenance patches, particularly the drop export.
> > > > > > It would be nice to trim this unused api this cycle.
> > > > > 
> > > > > Hi Jim,
> > > > > 
> > > > > Agreed - I was thinking the same thing. Feel free to add
> > > > > Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.
> > > > 
> > > > Does Greg KH usually pick up dyndbg patches or someone else or do I need
> > > > to do something? Would be great to get some movement here since -rc1 goes
> > > > out and merging will restart next week.
> > > 
> > > Yes, I can take these into my tree after -rc1 is out.
> > 
> > [uncovering from an absolutely impressive cascade of holes :-(]
> > 
> > Did this happen and I can stop worrying here? I'd like to make sure these
> > drm debug infra improvements keep moving.
> 
> I didn't take these, and I think I saw a 6th series sent:
> 	https://lore.kernel.org/r/20220904214134.408619-1-jim.cromie@gmail.com
> 
> If you ack them, I will pick them up.

Hm here we only talked about the first 9 or so patches from the series, do
you still want my ack on those?

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Since yeah I do like the direction of this :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
