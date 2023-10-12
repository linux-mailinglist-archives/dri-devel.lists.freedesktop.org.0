Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74D7C6F04
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 15:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2060110E4E2;
	Thu, 12 Oct 2023 13:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E843C10E4EA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 13:18:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e17a2eabcso153208a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697116729; x=1697721529; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pESXSq2cB1yHJ+chcqnwZf4qBvXPZQ+xBIxCqTvUZk=;
 b=dGzcn5kvFvS4neuopcfM8o9k5wh8mPNo0pWsAA9YmCZjRXoV1lOveewO8pE53MOjFM
 Df93GpOXKtHJwMlPidSSFRKXhiEy5i9Ufne/6/T4/cxgVuJTOlEHg2pb6d1RO5eA0yc7
 uyxJNDFuhQWYKQ6oqICxlNeieROMtiAPp8CE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697116729; x=1697721529;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7pESXSq2cB1yHJ+chcqnwZf4qBvXPZQ+xBIxCqTvUZk=;
 b=kolslVT2dm1XZnMCInALs3XKXICTr+Ouq4mj4XMT9OC4ecd72ySRo4unuko6eLdYiH
 BDEspayH8XoGbGIwt0oDSIhRaWCbc4a9q7Kg110N2WEHlwUa/zwHQfcQUSRVIJRpJdzM
 aWtFw1RdckKq9ohHzLZPGGS21OLrvG41Y9lXuePRgMvRkDNVQ7s6lZ9hC7IOY/EzwAV+
 /D2PHgfDeOIe1FR0A4gFyqK8tTuUklYeYiii/0xkLSkYwwdhknBXRdqXrQapVlQNgUK2
 9Psr7yaKflaljctWYiP0kjubr15RJsAum6I6mJjaaG1mW3i0gH27izIUd5CBwhOIunLc
 sO3A==
X-Gm-Message-State: AOJu0Yz604EQbF5fn3iV/XoLp58ix1wfIRMWlP14jQ8ilnPc+L7y7wKb
 Suxwo68Hh8vuTmg2YIwcR+TfYw==
X-Google-Smtp-Source: AGHT+IGJcRZ7cTA96fEttPOGRTmKTsJPCw4j/SDo4Z8rYwpHN8ZI7B+Q4X82DmJvmTQpxyufoY2UqQ==
X-Received: by 2002:a05:6402:278c:b0:523:2e64:122b with SMTP id
 b12-20020a056402278c00b005232e64122bmr22060277ede.3.1697116729023; 
 Thu, 12 Oct 2023 06:18:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gy6-20020a0564025bc600b0053e2a64b5f8sm137382edb.14.2023.10.12.06.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 06:18:48 -0700 (PDT)
Date: Thu, 12 Oct 2023 15:18:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
Message-ID: <ZSfyNgaHGGPiKqjN@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>, jim.cromie@gmail.com,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell>
 <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
 <20231012115548.292fa0bb@eldfell>
 <ZSfCMBXOOi9Luc6F@phenom.ffwll.local>
 <20231012133944.69711822@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012133944.69711822@eldfell>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 01:39:44PM +0300, Pekka Paalanen wrote:
> On Thu, 12 Oct 2023 11:53:52 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Thu, Oct 12, 2023 at 11:55:48AM +0300, Pekka Paalanen wrote:
> > > On Wed, 11 Oct 2023 11:42:24 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   
> > > > On Wed, Oct 11, 2023 at 11:48:16AM +0300, Pekka Paalanen wrote:  
> 
> ...
> 
> > > > > - all selections tailored separately for each userspace subscriber
> > > > > (- per open device file description selection of messages)    
> > > > 
> > > > Again this feels like a userspace problem. Sessions could register what
> > > > kind of info they need for their session, and something like journald can
> > > > figure out how to record it all.  
> > > 
> > > Only if the kernel actually attaches all the required information to
> > > the debug messages *in machine readable form* so that userspace
> > > actually can do the filtering. And that makes *that* information UABI.
> > > Maybe that's fine? I wouldn't know.  
> > 
> > Well if you configure the filters to go into separate ringbuffers for each
> > session (or whatever you want to split) it also becomes uapi.
> 
> It's a different UAPI: filter configuration vs. message structure. I
> don't mind which it is, I just suspect one is easier to maintain and
> extend than the other.
> 
> > Also I'd say that for the first cut just getting the logs out on demand
> > should be good enough, multi-gpu (or multi-compositor) systems are a step
> > further. We can figure those out when we get there.
> 
> This reminds me of what you recently said in IRC about a very different
> topic:
> 
> 	<sima> swick[m], tell this past me roughly 10 years ago, would
> 	have been easy to add into the design back when there was no
> 	driver code yet 
> 
> I just want to mention today everything I can see as useful. It's up to
> the people doing the actual work to decide what they include and how.

I actually pondered this a bit more today, and I think even with hindsight
the atomic design we ended up with was probably rather close to optimal.

Sure there's a bunch of things that would have been nice to include, but
another very hard requirement of atomic was that it's feasible to convert
current drivers over to it. And I think going full free-standing state
structures with unlimited (at least at the design level) queue depth would
have been a bridge too far.

The hacks and conversion helpers are all gone by now, but "you can just
peek at the object struct to get your state" was a huge help in reducing
the conversion churn.

But it definitely resulted in a big price we're still paying.

tldr I don't think getting somewhere useful, even if somewhat deficient,
is bad.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
