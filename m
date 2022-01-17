Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC34911CA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F6611218A;
	Mon, 17 Jan 2022 22:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBB9112184;
 Mon, 17 Jan 2022 22:34:00 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id l15so33094196uai.11;
 Mon, 17 Jan 2022 14:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6GKKmupfWWlnbgXJKPfzJduT4T53vFjxxafbxuWCWg=;
 b=petsnc8lPMN850o8bB7rXXqsr7jTek96Ibwh+lLVqGy1nC6IOknt0HnjXjpcmfOEqm
 N/8+yo35F8ZgjCaaeqzv1NMEfg7Pt8yXnHz6muenSeqEVoSTHjOUb8xy/SD9+ryVqwn6
 Fj5lk09WqWsy0Kf+4puiN1ivWTVcYpLYEq9dkw1ntuRXpuYJsqjg/5AdiWeRYvAMh/iN
 k7pZNkMA5uha61nx/Z/SLrNpCkLup0vmUItmGaIpaQHallceNw9mza3k38ierx/W2LY8
 aPSdCBM1OrasuuvSjuu8RVtTHKm6rIkCTLJs18gthrAO1slm8npdnXZLDIRFkAoEm8T9
 4tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6GKKmupfWWlnbgXJKPfzJduT4T53vFjxxafbxuWCWg=;
 b=qy9Gj9KSy4KIdUAgOBNzJnhi1M4CWEiA8IdIoCUMLXmfrF+uhQuwhZaEgwROC/ea/Z
 5F9DE+5vTew56xV/R2JKMOOoI9eyV8IA6WOPYJhuAlL66QF3R/48ev4nLJR6Bw7zZrZA
 UBJMETz8Y6n4zN0F36isXLu9+QZjOWd/1Z3xqcunnjQ3rNmhebJk9N8iLQsVMDuZCEox
 7jea5A8pONIGlybwUZUwTlT0DfroHOtV5gnI4oUqQanL1fcXr7ZVEYcyaifWrwyvqw4P
 Gi+0rVu7k7NuG6wrc5Shbu+/QjC+XDGeGr7p4ozaucJN+ct97izALBMA23LCEj07tPv/
 leHA==
X-Gm-Message-State: AOAM533xudQ9R4yre4tEKS7fBX9YHHbzLLscFaol+duTE1qljAhhVEv7
 4WLTxzZi0rKTVLVI/ow5lFAeVjo6/ZNagOLTKc8=
X-Google-Smtp-Source: ABdhPJxWhkcwjL2R6hpGY61yBJ6r2FktnPVmLesfV1BZdfVRhtY/6a2CDJAHrMsl0L46bPttGQkAEE28ovqTC/SSiYI=
X-Received: by 2002:a05:6102:3f56:: with SMTP id
 l22mr7888725vsv.20.1642458839004; 
 Mon, 17 Jan 2022 14:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
 <20220107052942.1349447-2-jim.cromie@gmail.com>
 <20220114115718.GB23983@axis.com>
In-Reply-To: <20220114115718.GB23983@axis.com>
From: jim.cromie@gmail.com
Date: Mon, 17 Jan 2022 15:33:33 -0700
Message-ID: <CAJfuBxw1scH7xS7-RfxZ369wVQ8umP+0MHqz1U_3cW-BLPsDkg@mail.gmail.com>
Subject: Re: [PATCH v11 01/19] dyndbg: add _DPRINTK_FLAGS_ENABLED
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

On Fri, Jan 14, 2022 at 4:57 AM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> On Fri, Jan 07, 2022 at 06:29:24AM +0100, Jim Cromie wrote:
> >  #ifdef CONFIG_JUMP_LABEL
> > -                     if (dp->flags & _DPRINTK_FLAGS_PRINT) {
> > -                             if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
> > +                     if (dp->flags & _DPRINTK_FLAGS_ENABLED) {
> > +                             if (!(modifiers->flags & _DPRINTK_FLAGS_ENABLED))
> >                                       static_branch_disable(&dp->key.dd_key_true);
> > -                     } else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
> > +                     } else if (modifiers->flags & _DPRINTK_FLAGS_ENABLED)
> >                               static_branch_enable(&dp->key.dd_key_true);
> >  #endif
> >                       dp->flags = newflags;
> > --
> > 2.33.1
> >
>
> I haven't tested it so I could be mistaken, but when
> _DPRINTK_FLAGS_ENABLED gets two flags in the next patch, it looks like
> this code still has the problem which I mentioned in
> https://lore.kernel.org/lkml/20211209150910.GA23668@axis.com/?
>

Yes, thanks for noticing.  I missed that detail.
Apriori, I dont know why bit-and of bit-or'd flags doesnt cover it,
but I will take a careful look.

> | I noticed a bug inside the CONFIG_JUMP_LABEL handling (also present
> | in the last version I posted) which should be fixed as part of the
> | diff below (I've added a comment).
> | [...]
> |  #ifdef CONFIG_JUMP_LABEL
> | -                     if (dp->flags & _DPRINTK_FLAGS_PRINT) {
> | -                             if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
> | +                     if (dp->flags & _DPRINTK_FLAGS_ENABLE) {
> | +                             /*
> | +                              * The newflags check is to ensure that the
> | +                              * static branch doesn't get disabled in step
> | +                              * 3:
> | +                              *
> | +                              * (1) +pf
> | +                              * (2) +x
> | +                              * (3) -pf
> | +                              */
> | +                             if (!(modifiers->flags & _DPRINTK_FLAGS_ENABLE) &&
> | +                                 !(newflags & _DPRINTK_FLAGS_ENABLE)) {
> |                                       static_branch_disable(&dp->key.dd_key_true);
> | -                     } else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
> | +                             }
> | +                     } else if (modifiers->flags & _DPRINTK_FLAGS_ENABLE) {
> |                               static_branch_enable(&dp->key.dd_key_true);
> | +                     }
> |  #endif
