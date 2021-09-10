Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCE406F2A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 18:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E316EA29;
	Fri, 10 Sep 2021 16:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9DB6EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 16:10:39 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so2867621otg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jo5OwxEWWhiw1vRCZY9Md42z//D7x07LY6Hl1A6tjps=;
 b=a0BoFV2TX+cHGSEkivRtqdXQcXf3GOKizfSbi6dcn7QP9OoYDw1ehnFhDE/QjMj511
 FCZZhv+ouEx5reHS+gkUQDH/M+ewX1aX1Xgg6XZQDp85y7pT+zngdTdq2+vS9wva64ll
 JzfFxb9DqiDM1q/QIF89slqZpHJyyzwVKNvPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jo5OwxEWWhiw1vRCZY9Md42z//D7x07LY6Hl1A6tjps=;
 b=6KnXFK4tBh5roiS3ZCDnTurF7k/b9LpC8s7xoSRI7dn6G7sqeYO1mMQkLyVZMDae4+
 pCu6+2H0BcOPLcmSAUq4wIKF2799oG7F3EoKxJCyXCrgnlAl9AMgXOFfPkEiASMk/WD/
 NiUHBirZiNBuT3wajKBb9PJRD94lkDXOLB/djxpP3bYcBzDgryD2fgj1EX1AwD0iaXm3
 KsmOyxTWIxCFhx6dQUTa7NEZ36Ffx5AwDvBjjr+48p4sOSTzlpWISWwoUT1Yp0SeBYax
 8dp1ROCEnZOS2Qu+xgOH5hMczqgmSxZ857fq/AoeRuSoX4s+HpSGLUp2s89zc3qplsgK
 gNSw==
X-Gm-Message-State: AOAM531vhMKctzCXXuhGykSBLuKW2uWTos2PTG693I5Vmskj/KtU10V+
 BR7lcFuTCoQwwr+6uFO4UOiZC7nTX68PaglPcYHgNA==
X-Google-Smtp-Source: ABdhPJys2gnxbrHm2zi8RWfzvu1eIvi6jhZXOMYm/oQiNsIMFOEpuQ0wxhKujydoIGCLqH9b8BU5AlqILlp4u13Kfc0=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr5195333otn.239.1631290238353; 
 Fri, 10 Sep 2021 09:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf119s7iXk+qpwoVPnRtOGcxeuZb3rnihf6NWWoVT-4ODHA@mail.gmail.com>
 <YTsQJ753sm701R/n@kroah.com>
 <CAKMK7uFLBmdHphtnEa1nyAGUHdcP1KgmaK+vtV_GOU6wZZAOxg@mail.gmail.com>
In-Reply-To: <CAKMK7uFLBmdHphtnEa1nyAGUHdcP1KgmaK+vtV_GOU6wZZAOxg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 10 Sep 2021 18:10:27 +0200
Message-ID: <CAKMK7uFj-m4y+N-q8uoNasJuksgDj-oRK3K=SjoyKMQL=QCENw@mail.gmail.com>
Subject: Re: Habanalabs Open-Source TPC LLVM compiler and SynapseAI Core
 library
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, mzuckerman@habana.ai, dsinger@habana.ai, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forgot to add dri-devel.

On Fri, Sep 10, 2021 at 6:09 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Fri, Sep 10, 2021 at 9:58 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Fri, Sep 10, 2021 at 10:26:56AM +0300, Oded Gabbay wrote:
> > > Hi Greg,
> > >
> > > Following our conversations a couple of months ago, I'm happy to tell you that
> > > Habanalabs has open-sourced its TPC (Tensor Processing Core) LLVM compiler,
> > > which is a fork of the LLVM open-source project.
> > >
> > > The project can be found on Habanalabs GitHub website at:
> > > https://github.com/HabanaAI/tpc_llvm
> > >
> > > There is a companion guide on how to write TPC kernels at:
> > > https://docs.habana.ai/en/latest/TPC_User_Guide/TPC_User_Guide.html
> >
> > That's great news, thanks for pushing for this and releasing it all!
>
> Yeah this is neat.
>
> There's still the problem that we spent the past 2.5 years pissing off
> a lot of people for an imo questionable political project, bypassing
> all the technical review and expertise. Now that the political
> nonsense is resolved I think we need to look at at least the technical
> cleanup. The angered people are much harder to fix, so let's maybe
> ignore that (or perhaps a ks topic, no idea, I'm honestly not super
> motivated to rehash this entire story again). Here's what I think we
> should do:
>
> - move drivers/misc/habanalabs under drivers/gpu/habanalabs and
> review/discussions on dri-devel
> - grandfather the entire current situation in as-is, it's not the only
> driver we have with a funny uapi of its own (but the other driver did
> manage to get their compiler into upstream llvm even, and not like 2
> years late)
> - review the dma-buf stuff on dri-devel and then land it through
> standard flows, not the gregk-misc bypass
> - close drivers/misc backdoor for further accel driver submissions,
> I'd like to focus on technical stuff in this area going forward and
> not pointless exercises in bypassing due process and all that
>
> I expect we'll have a proper discussion what the stack should look
> like with the next submission (from a different vendor maybe), that
> ship kinda sailed with habanalabs.
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
