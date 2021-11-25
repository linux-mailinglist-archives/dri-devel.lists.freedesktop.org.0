Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C245DBAE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 14:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575506F384;
	Thu, 25 Nov 2021 13:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10396EF38;
 Thu, 25 Nov 2021 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1637848282;
 x=1669384282; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IZMfh96pc1eATKuBd9LQI2ag0STcz/D7Jqsa3v1w6EA=;
 b=jgzgG10w9vP4Gs2lzNKK5OcYWIoSjFCceX8DfO4YOJzZrwuB6uWkU+lh
 N/CD5xSySDkCXP39gNpoQDqbD9npZ2jEJ67qoJ4Y1m4s8/63qSGXmtpdX
 v5+YKWgrrJK5qrNiqgPcu2XvrW3x/1/v+fDfTHjFniB74T+Az0yq/bY+d
 QuIqeYSQVmODoOG7SlniN07TqY+gmVtrFhfcvJrzsUfO+ayb/EoOACknS
 Ecc+Tik9aU72uOh3QCtDj7VvFxOM7Md34cuvpJxb4ZiUm7St+4SVFi2zd
 fQeBhoivxxvTPhX68ikboM3RrwAH98C6zhGLcjst+LHcPtZt5qNv1CAHJ A==;
Date: Thu, 25 Nov 2021 14:51:19 +0100
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: "jim.cromie@gmail.com" <jim.cromie@gmail.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
Message-ID: <20211125135119.GA7625@axis.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
 <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
 <20211118172401.0b4d722e@eldfell>
 <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
 <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "quic_saipraka@quicinc.com" <quic_saipraka@quicinc.com>,
 Jason Baron <jbaron@akamai.com>, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Will Deacon <will@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sean Paul <seanpaul@chromium.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Sean Paul <sean@poorly.run>,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 "quic_psodagud@quicinc.com" <quic_psodagud@quicinc.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 11:46:31PM +0100, jim.cromie@gmail.com wrote:
> Vincent's code has the macro magic to define that event, which IIUC
> is what  makes it controllable by ftrace, and therefore acceptable in
> principle to Steve.
> Would there be any reason to expand his set of 2 events into dev_dbg,
> pr_debug etc varieties ?
> (ie any value to separating dev, !dev ?, maybe so
> 
> Sean's code uses trace_array_printk primarily, which is EXPORTed,
> which is a virtue.
> 
> Vincents code does
> +/*
> + * This code is heavily based on __ftrace_trace_stack().
> + *
> + * Allow 4 levels of nesting: normal, softirq, irq, NMI.
> + */
> 
> to implement
> 
> +static void dynamic_trace(const char *fmt, va_list args)
> 
> Has this __ftrace_trace_stack() code been bundled into or hidden under
> a supported interface ?
> 
> would it look anything like trace_array_printk() ?
> 
> what problem is that code solving inside dynamic-debug.c ?

I'm not sure I fully understand all of your questions, but perhaps this
thread with Steven's reply to the first version of my patchset will
answer some of them:

 https://lore.kernel.org/lkml/20200723112644.7759f82f@oasis.local.home/
