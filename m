Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACF492E54
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 20:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA5810E4DB;
	Tue, 18 Jan 2022 19:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A101C10E4B0;
 Tue, 18 Jan 2022 19:19:00 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id w21so29769uan.7;
 Tue, 18 Jan 2022 11:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTtIokhsxNEKlwhkarhww6LL6UsgKRiayY8jPQeBEwY=;
 b=CTc9C58WpPdD8FXdGRlcnMWrMWNJpcK+y6Rj3zUyCWdwt9dQLqWVsqH1YHBewi6eXG
 TVXL54as5+fZwnP5csySA8G7bCIvcyKPvSiBUd+GrWLEV+MZfzm3C4f+itk1QZftidvg
 LJKU6yzS78/172cHFHccKLpzMhmscJwEjItec7F5xI6diRS+I880mydn8KGrrmaZceV3
 OZpCa9+CVwLnOjxUXVk7D8b0ObU0FO6PXWZJzdcxd8vNgfrVV11NYRvHxRLgRlTLBo4O
 Q0GLzBjotcSVxS8uqcxrk7IdG3QZri13dV+SSWWoVMHq30Z5wrhXzlDreWg6/pjBsKOo
 1Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTtIokhsxNEKlwhkarhww6LL6UsgKRiayY8jPQeBEwY=;
 b=Is8z3ojMYcj1hPtNKHMlGswgJ5jQWu2pkK2Pz41s8YCh+WpXDVg1C/VaVvd3Px8Mrh
 F4LM5Ob+Ml+mnaYwyA3X34CO82haEu/Ara8SiL45uZKUabP+fNcANN+uPtSPngjStJxT
 pyoagafsDcK09Q9EgbAPhKVK7UAtEbljT7+nZLEJbV0fNd1hnFbkQhDLeVgRnPUAP+4F
 p19KhQqkj+pwB7A6wYrwMuxpmnC8uxjmEZDrFNn5Xbg3G//QSVkFxiBEI6dNcOXnonbp
 yrU9LsyAOooxM4XFl8LoUwzChcTVWUy/xnUuroaqLXPEqznXWZFvfx5kpD/W2lEK3U05
 hOQg==
X-Gm-Message-State: AOAM5328HEHjyvzi3LOoaccr4v1fupl/+jF3qUUr1EMFZCK3O7DO1ASN
 ycTz42VcCPgM0Sj2Ts4yBrCgxzGLJvcO0LTWB0Y=
X-Google-Smtp-Source: ABdhPJxgTCdC9Z6jpp7wLDECuwoHlNTebzLVe83RZmXf5Re5kCwIRrubG/CS+W1/249WqUYsva2FLP9+ncT0xjegJbI=
X-Received: by 2002:a67:d903:: with SMTP id t3mr5929684vsj.42.1642533539591;
 Tue, 18 Jan 2022 11:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
 <20220107052942.1349447-4-jim.cromie@gmail.com>
 <20220114114654.GA23983@axis.com>
In-Reply-To: <20220114114654.GA23983@axis.com>
From: jim.cromie@gmail.com
Date: Tue, 18 Jan 2022 12:18:33 -0700
Message-ID: <CAJfuBxxKQK+X-5LW=ysPU-4mP25BnuCNxvo4xg-SgPwQsr7kXw@mail.gmail.com>
Subject: Re: [PATCH v11 03/19] dyndbg: add write-to-tracefs code
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
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
Cc: "quic_saipraka@quicinc.com" <quic_saipraka@quicinc.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "will@kernel.org" <will@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jbaron@akamai.com" <jbaron@akamai.com>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "quic_psodagud@quicinc.com" <quic_psodagud@quicinc.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 4:46 AM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> On Fri, Jan 07, 2022 at 06:29:26AM +0100, Jim Cromie wrote:
> >

> > Enabling debug-to-tracefs is 2 steps:
> >
> >   # event enable
> >   echo 1 > /sys/kernel/tracing/events/dyndbg/enable
> >   # callsite enable
> >   echo module foo +T > /proc/dynamic_debug/control
> >
> > This patch,~1,~2 are based upon:
> >   https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/
> >
> > .. with simplification of temporarily reusing trace_console() rather
> > than adding a new printk:dyndbg event.  Soon, add 2 new events
> > capturing the pr_debug & dev_dbg() args.
>
> The example above does not match the code in this patch since the
> dyndbg:* events are only added in a later patch.  Perhaps you could
> reorder this patch stack so that you don't use trace_console() in this
> patch just to replace it with the new events in the next patch?
>

good catch, thanks.
Ive just dropped the example, it seemed the simplest fix.
It seemed proper to commit your code as pristine as practical,
so that subsequent mistakes receive the blame.

and Ive fixed the spurious whitespace change you noted.
