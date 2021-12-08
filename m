Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF77A46CCE4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 06:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC06E5AB;
	Wed,  8 Dec 2021 05:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA676E1A3;
 Wed,  8 Dec 2021 05:16:37 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id h1so889832vkh.0;
 Tue, 07 Dec 2021 21:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k4TgxotWqQC+UlMjLdxFb8gJ1bUTmHEtBJSUoVsJhbA=;
 b=dVBGqtg8koZ9wqmjjuaZvkBfXkRf/kw1KsZepp29Q8qDovegqcg9NxXyMW6CoR7OSm
 b2P9yP7Pb+VfvrbkouXsZMzxmewSEVJhhvx4If4eAkek0wNCAtX5pqwsNCIS7PSuhTvj
 MpkvE9zG+deiW7rnuk2CvcIDcQ+AtMcePhtzm3B04gQBdE1bezQ1SJ8QzW1aMrUqxeU8
 MDgUmyhVWk+K/KUTD8hkIB+gkkHm+Hm3sui05dDYPKldSe3gTIY7ySrronq3JsMvfL5x
 db6M4IeoB/h6jOexLFMfirmWrFtvLPUShEKeEGrYhKI5QKl8DkXpk1JnCOmNQ1Vcah4S
 G86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4TgxotWqQC+UlMjLdxFb8gJ1bUTmHEtBJSUoVsJhbA=;
 b=HVMLYrpCC61Z0cLbeEPWdlSJZww0Xr4SLUerUf4Tkgmesh34y7hSLDdp+RyAaKmMgI
 932YlsgYllUfK4o1MhwuyHKAfvjG9xTsz/CciT8UGcHyHEuxpGLhUjtnkq6BsEWmtGyb
 5L0UyhMBygp3fCPBKOO9RKvy8nmcSKpH1MlwSIuT5cxb9vP1JZRaoNUo/cxX4ms21nGY
 YMUvjgmNF6hzW159PBUTFjn9iuIuxxeXFOHN5FGlcfq4BgnpE86OsrLUkw/1AM8YusHb
 Y4L/VmjtdDYSDytCN2KbTzutgVaQX3PtGEcppXE53t1YleN27GJV2wcgb0Mdg7TL0Cgx
 kGcw==
X-Gm-Message-State: AOAM532vOQnwBLPbOszOQ0hCckccCECeeSyV8fhFr7GKOg1vlyJioD98
 fA+N4wJl+dgWGIr174XaBtu5v3KAs0k3xe2Xm/M=
X-Google-Smtp-Source: ABdhPJy5g05zqhLHrO7v+lI4QlKgKpZEKYc8OgtA3+ilRbrq9uHuXaijZGY1/p2g4C3MzOnNU8lJIXaD1kawd4yGmzc=
X-Received: by 2002:a05:6122:21a2:: with SMTP id
 j34mr60403060vkd.17.1638940596668; 
 Tue, 07 Dec 2021 21:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
In-Reply-To: <20211112114953.GA1381@axis.com>
From: jim.cromie@gmail.com
Date: Tue, 7 Dec 2021 22:16:10 -0700
Message-ID: <CAJfuBxxnuXAR7Jgn74MNQC7MLRc0xcDLw1cCidUJ9Xyar+O_2g@mail.gmail.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_saipraka@quicinc.com, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Will Deacon <will@kernel.org>,
 maz@kernel.org, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Sean Paul <sean@poorly.run>,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 quic_psodagud@quicinc.com, mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 4:49 AM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:
> > Dynamic-Debug can do 2nd exceedingly well:
> >
> > A- all work is behind jump-label's NOOP, zero off cost.
> > B- exact site selectivity, precisely the useful traffic.
> >    can tailor enabled set interactively, at shell.
> >
> > Since the tracefs interface is effective for drm (the threads suggest
> > so), adding that interface to dynamic-debug has real potential for
> > everyone including drm.
> >
> > Add a new +T flag to enable tracing, independent of +p, and add and

>
> I posted a patchset a while ago to do something very similar, but that
> got stalled for some reason and I unfortunately didn't follow it up:
>
>  https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/
>
> A key difference between that patchset and this patch (besides that
> small fact that I used +x instead of +T) was that my patchset allowed
> the dyndbg trace to be emitted to the main buffer and did not force them
> to be in an instance-specific buffer.
>
> That feature is quite important at least for my use case since I often
> use dyndbg combined with function tracing, and the latter doesn't work
> on non-main instances according to Documentation/trace/ftrace.rst.
>
> For example, here's a random example of a bootargs from one of my recent
> debugging sessions:
>
>  trace_event=printk:* ftrace_filter=_mmc*,mmc*,sd*,dw_mci*,mci*
>  ftrace=function trace_buf_size=20M dyndbg="file drivers/mmc/* +x"
>

Hi Vincent,

are you planning to dust this patchset off and resubmit it ?

Ive been playing with it and learning ftrace (decade+ late),
I found your boot-line example very helpful as 1st steps
(still havent even tried the filtering)


with these adjustments (voiced partly to test my understanding)
I would support it, and rework my patchset to use it.

- change flag to -e, good mnemonics for event/trace-event
   T is good too, but uppercase, no need to go there.

- include/trace/events/dyndbg.h - separate file, not mixed with print.h
  dyndbg class, so trace_event=dyndbg:*

- 1 event type per pr_debug, dev_dbg, netdev_dbg ? ibdev_dbg ?
  with the extra args: descriptor that Steven wanted,
  probably also struct <|net|ib>dev

If youre too busy for a while, I'd eventually take a (slow) run at it.
