Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB8A45790B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8666E82D;
	Fri, 19 Nov 2021 22:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514C6E311;
 Fri, 19 Nov 2021 22:46:59 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id w23so24267890uao.5;
 Fri, 19 Nov 2021 14:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zFqARuc/+Lw2I8xXuND6mlPXskUS/aYJU6LEBPOEf5o=;
 b=oEPAJiVHkKnLUb2OIn7pnuCkNWLF2CXFsJpcC586yzL6zLjYrrilICjeZrWleJWLUA
 MUByli/RmDmWqxlSVqhDR1C6bIQ0kDaDMNLZDqRvCOMUuPzE+51dTc3LxWouNEGcGgc1
 D3eB6R/C73PHkIIxZrOk1ifLLIZfh5g9wTKHiS1Gx4GFuwrAy7AUNeO12seW0K7OCP6X
 wBsRQR2wN3yUSuw/0E2+rUjdxgnI0i7jVjmx3OHTGjVDW4mcqOaMDO9EnnoolD3awCvu
 fl/4nE0dYzj0SFkSkk6Yb1vEf42ZmYf02pxLyBJlXedQLEo+weyRWKRNMJ/oBAiRB/KC
 uBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zFqARuc/+Lw2I8xXuND6mlPXskUS/aYJU6LEBPOEf5o=;
 b=0V0K0eevlf3ltf/NJprc7DOeCiu4gu4YbEYppK2wGmTOu6Z/85UtoToHrTJRw8mjfB
 RjEU9LVQnra7QBbwVSkbwKEekSW76ADUBDvSgvM6N7Ayq6YuzXOumjd70sPq7UzJzkIA
 WDlbaVbd2WpF5JHV0OedQ4b83/itmq6JsIegY4cKFJyeyki1xTnBHch8RZF3Nukoa4TB
 Zk9tlHwEWs6JGnwNA+gxqnx+CWB+hI92tOQX7FUDyYqShJTx6LpvK9yP2kWBR9eQKTZs
 DYjbzcrw5KAP7SohoYFuvVIso+vdorgE8V7AF7HhIaY7Dic35Ws1hlKd/zXk140N6fpj
 d9jw==
X-Gm-Message-State: AOAM531Wll5IjGqwp7sG9zXrAMd0sot5u4yHt79lWvVyN+n/rHnFyGD4
 B+zXWZvHZodu1NUrUoArmNQQT+I8wkQw+xYqnOg=
X-Google-Smtp-Source: ABdhPJzexc6BskoZ7bxCgeL3na7HhjycEVACnUbSLbHZVhqRta9op3uUnUg4gkVAlSInN0VBX8WCQTbjvDaXvz2/O/8=
X-Received: by 2002:ab0:44e:: with SMTP id 72mr54616355uav.121.1637362018620; 
 Fri, 19 Nov 2021 14:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
 <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
 <20211118172401.0b4d722e@eldfell>
 <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
In-Reply-To: <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
From: jim.cromie@gmail.com
Date: Fri, 19 Nov 2021 15:46:31 -0700
Message-ID: <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
To: Jason Baron <jbaron@akamai.com>
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
 maz@kernel.org, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sean Paul <seanpaul@chromium.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Sean Paul <sean@poorly.run>,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 quic_psodagud@quicinc.com, mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 9:21 AM Jason Baron <jbaron@akamai.com> wrote:
>
>
>
> On 11/18/21 10:24 AM, Pekka Paalanen wrote:
> > On Thu, 18 Nov 2021 09:29:27 -0500
> > Jason Baron <jbaron@akamai.com> wrote:
> >
> >> On 11/16/21 3:46 AM, Pekka Paalanen wrote:
> >>> On Fri, 12 Nov 2021 10:08:41 -0500
> >>> Jason Baron <jbaron@akamai.com> wrote:
> >>>
> >>>> On 11/12/21 6:49 AM, Vincent Whitchurch wrote:
> >>>>> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:
> >>>>>> Sean Paul proposed, in:
> >>>>>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRA8Dki4A$
> >>>>>> drm/trace: Mirror DRM debug logs to tracefs
> >>>>>>
> >>>>>> His patchset's objective is to be able to independently steer some of
> >>>>>> the drm.debug stream to an alternate tracing destination, by splitting
> >>>>>> drm_debug_enabled() into syslog & trace flavors, and enabling them
> >>>>>> separately.  2 advantages were identified:
> >>>>>>
> >>>>>> 1- syslog is heavyweight, tracefs is much lighter
> >>>>>> 2- separate selection of enabled categories means less traffic
> >>>>>>
> >>>>>> Dynamic-Debug can do 2nd exceedingly well:
> >>>>>>
> >>>>>> A- all work is behind jump-label's NOOP, zero off cost.
> >>>>>> B- exact site selectivity, precisely the useful traffic.
> >>>>>>    can tailor enabled set interactively, at shell.
> >>>>>>
> >>>>>> Since the tracefs interface is effective for drm (the threads suggest
> >>>>>> so), adding that interface to dynamic-debug has real potential for
> >>>>>> everyone including drm.
> >>>>>>
> >>>>>> if CONFIG_TRACING:
> >>>>>>
> >>>>>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> >>>>>> available by default to all pr_debugs.  This will likely need some
> >>>>>> further per-module treatment; perhaps something reflecting hierarchy
> >>>>>> of module,file,function,line, maybe with a tuned flattening.
> >>>>>>
> >>>>>> endif CONFIG_TRACING
> >>>>>>
> >>>>>> Add a new +T flag to enable tracing, independent of +p, and add and
> >>>>>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
> >>>>>> the flag checks.  Existing code treats T like other flags.
> >>>>>
> >>>>> I posted a patchset a while ago to do something very similar, but that
> >>>>> got stalled for some reason and I unfortunately didn't follow it up:
> >>>>>
> >>>>>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$
> >>>>>
> >>>>> A key difference between that patchset and this patch (besides that
> >>>>> small fact that I used +x instead of +T) was that my patchset allowed
> >>>>> the dyndbg trace to be emitted to the main buffer and did not force them
> >>>>> to be in an instance-specific buffer.
> >>>>
> >>>> Yes, I agree I'd prefer that we print here to the 'main' buffer - it
> >>>> seems to keep things simpler and easier to combine the output from
> >>>> different sources as you mentioned.
> >>>
> >>> Hi,
> >>>
> >>> I'm not quite sure I understand this discussion, but I would like to
> >>> remind you all of what Sean's original work is about:
> >>>
> >>> Userspace configures DRM tracing into a flight recorder buffer (I guess
> >>> this is what you refer to "instance-specific buffer").
> >>>
> >>> Userspace runs happily for months, and then hits a problem: a failure
> >>> in the DRM sub-system most likely, e.g. an ioctl that should never
> >>> fail, failed. Userspace handles that failure by dumping the flight
> >>> recorder buffer into a file and saving or sending a bug report. The
> >>> flight recorder contents give a log of all relevant DRM in-kernel
> >>> actions leading to the unexpected failure to help developers debug it.
> >>>
> >>> I don't mind if one can additionally send the flight recorder stream to
> >>> the main buffer, but I do want the separate flight recorder buffer to
> >>> be an option so that a) unrelated things cannot flood the interesting
> >>> bits out of it, and b) the scope of collected information is relevant.
> >>>
> >>> The very reason for this work is problems that are very difficult to
> >>> reproduce in practice, either because the problem itself is triggered
> >>> very rarely and randomly, or because the end users of the system have
> >>> either no knowledge or no access to reconfigure debug logging and then
> >>> reproduce the problem with good debug logs.
> >>>
> >>> Thank you very much for pushing this work forward!
> >>>
> >>>
> >>
> >> So I think Vincent (earlier in the thread) was saying that he finds it
> >> very helpful have dynamic debug output go to the 'main' trace buffer,
> >> while you seem to be saying you'd prefer it just go to dynamic debug
> >> specific trace buffer.
> >
> > Seems like we have different use cases: traditional debugging, and
> > in-production flight recorder for problem reporting. I'm not surprised
> > if they need different treatment.
> >
> >> So we certainly can have dynamic output potentially go to both places -
> >> although I think this would mean two tracepoints? But I really wonder
> >> if we really need a separate tracing buffer for dynamic debug when
> >> what goes to the 'main' buffer can be controlled and filtered to avoid
> >> your concern around a 'flood'?
> >
> > If the DRM tracing goes into the main buffer, then systems in
> > production cannot have any other sub-system traced in a similar
> > fashion. To me it would feel very arrogant to say that to make use of
> > DRM flight recording, you cannot trace much or anything else.
> >
> > The very purpose of the flight recorder is run in production all the
> > time, not in a special debugging session.
> >
> > There is also the question of access and contents of the trace buffer.
> > Ultimately, if automatic bug reports are enabled in a system, the
> > contents of the trace buffer would be sent as-is to some bug tracking
> > system. If there is a chance to put non-DRM stuff in the trace buffer,
> > that could be a security problem.
> >
> > My use case is Weston. When Weston encounters an unexpected problem in
> > production, something should automatically capture the DRM flight
> > recorder contents and save it alongside the Weston log. Would be really
> > nice if Weston itself could do that, but I suspect it is going to need
> > root privileges so it needs some helper daemon.
> >
> > Maybe Sean can reiterate their use case more?
> >
> >
> > Thanks,
> > pq
> >
>
> Ok, so in this current thread the proposal was to create a "dyndbg-tracefs"
> buffer to put the dynamic debug output (including drm output from dynamic
> debug) into. And I was saying let's just put in the 'main' trace buffer
> (predicated on a dynamic debug specific tracepoint), since there seems
> to be a a use-case for that and it keeps things simpler.
>
> But I went back to Sean's original patch, and it creates a drm specific
> trace buffer "drm" (via trace_array_get_by_name("drm")). Here:
> https://patchwork.freedesktop.org/patch/445549/?series=78133&rev=5
>
> So I think that may be some of the confusion here? The current thread/
> proposal is not for a drm specific trace buffer...
>

while thats true, it was a KISS choice, not intrinsic.
Now that a requirement has emerged, I can think about it.

I thought use of all the pr_debug()s as a tracefs event provider made sense,
since the callsite descriptor is passed in, and could be passed in to
the tracefs interface.

Vincent's code has the macro magic to define that event, which IIUC
is what  makes it controllable by ftrace, and therefore acceptable in
principle to Steve.
Would there be any reason to expand his set of 2 events into dev_dbg,
pr_debug etc varieties ?
(ie any value to separating dev, !dev ?, maybe so)

Sean's code uses trace_array_printk primarily, which is EXPORTed,
which is a virtue.

Vincents code does
+/*
+ * This code is heavily based on __ftrace_trace_stack().
+ *
+ * Allow 4 levels of nesting: normal, softirq, irq, NMI.
+ */

to implement

+static void dynamic_trace(const char *fmt, va_list args)

Has this __ftrace_trace_stack() code been bundled into or hidden under
a supported interface ?

would it look anything like trace_array_printk() ?

what problem is that code solving inside dynamic-debug.c ?


> Having a subsystem specific trace buffer would allow subsystem specific
> trace log permissions depending on the sensitivity of the data. But
> doesn't drm output today go to the system log which is typically world
> readable today?
>

> So I could see us supporting subsystem specific trace buffer output
> via dynamic debug here. We could add new dev_debug() variants that
> allow say a trace buffer to be supplied. So in that way subsystems
> could 'opt-out' of having their data put into the global trace buffer.
> And perhaps some subsystems we would want to allow output to both
> buffers? The subsystem specific one and the global one?
>

 * trace_array_printk - Print a message to a specific instance
 * @tr: The instance trace_array descriptor
 * @ip: The instruction pointer that this is called from.
 * @fmt: The format to print (printf format)
 *

what happens when @tr == NULL ?
It could allow up-flow of events to the global instance

> Thanks,
>
> -Jason
>
>

So I wonder, is there any conceptual utility to this ?

echo 1 > instances/foo/filter_up  # enable event upflow (or query-time merging?)

Maybe enabling this causes other files (the ones missing from
instances/foo) to magically appear
so all those filtering capacities also appear.
