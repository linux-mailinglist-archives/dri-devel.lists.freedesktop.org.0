Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E092D52AE91
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 01:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B986A1133BE;
	Tue, 17 May 2022 23:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1413310FB0B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 23:30:42 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id kq17so623821ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kje1fxePklyTYdwuahnUd7jrh3kjOYPr65ooSYjVE44=;
 b=BZgE0jkbkeLVvFmb8ruOV8av8A5Vi/cJesgkFUe7yW3/UIFp5JuLCAIksYmq6dxaPC
 UTmFxH4fn4hS3/gzRePwOA9Zgz2QoeR/e7KsL6wHOQMvCBYOzvoW2yP96YAu1wlsdo/W
 OYW4HOnAUXA1JVGJiazKgXoK/bUipg6BPRZaPd0iU4I6XDCU9CWewInibc8sy+vWJYxb
 GbGtI+anWZDqWuOTylV0pzWc9p1n+hpH4zF0jqzCG43N/eDSdV5LLd69UT0bGeoGyGse
 0mKYTvfzrYVwqtPqL3gqbyjVL7SFmO6Pfdv96YRbeDf3urkh47YcrQa2GcXbFgbNtfr9
 LXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kje1fxePklyTYdwuahnUd7jrh3kjOYPr65ooSYjVE44=;
 b=RgAxynR8vvv8CETsQM5XdVstn328mW3bHwAyrJRBECvf3grnHCJTSa3tj/nkItY8/a
 wRaiUAdjAq8ATsjgOm7uNua6LrtHm8/5kNYErIOlsT/Z38Xfw160L9pcl/d29VT+Wetx
 ewWC9LHRiBzsiLTiOqjWdRFG1ab8yr87b2likQ6Z1dADO9Xtugw8G4YGtpn6w32l7YuS
 2xR1giHP1gNybAYW9gm4KtEVK+Kx92lHqXhTiX2sgRQrLaE2Kxns+hSR8LW1Ch+LlE/m
 K+hV//IuX1U4jmjct5cZvlUozMecukvEhwTpuenB06XpkFo/SK2LdnCNpAG/6O8m6qTa
 xsXQ==
X-Gm-Message-State: AOAM532ZOARTZWp5nB0d7wqn5/303NFzk25G2JRJfmAvSuFvhbDKU/0F
 69Q5E4XGWN6Y0UZLunYLpjXjC7GV9sxKaLu3vefkRw==
X-Google-Smtp-Source: ABdhPJynpuiODXlilJ4ccPPw09Oypx2Cww6BUXEGpKKQ1/r4bC3SNcHdzpBPpWcDWLBl7XOueU5+lIF135DZSaWqEEs=
X-Received: by 2002:a17:906:6a10:b0:6f5:5e4:9d5 with SMTP id
 qw16-20020a1709066a1000b006f505e409d5mr21615657ejc.122.1652830241187; Tue, 17
 May 2022 16:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220510235653.933868-1-tjmercier@google.com>
 <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
 <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
 <81026ef07c1ce20f8673b75b17bab79a2b39c548.camel@ndufresne.ca>
 <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
 <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
In-Reply-To: <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 May 2022 16:30:29 -0700
Message-ID: <CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] Proposal for a GPU cgroup controller
To: Tejun Heo <tj@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Carlos Llamas <cmllamas@google.com>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Zefan Li <lizefan.x@bytedance.com>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Laura Abbott <labbott@redhat.com>,
 kernel-team@android.com, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 13, 2022 at 9:13 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, May 12, 2022 at 08:43:52PM -0700, T.J. Mercier wrote:
> > > I'm actually happy I've asked this question, wasn't silly after all. I think the
> > > problem here is a naming issue. What you really are monitor is "video memory",
> > > which consist of a memory segment allocated to store data used to render images
> > > (its not always images of course, GPU an VPU have specialized buffers for their
> > > purpose).
> > >
> > > Whether this should be split between what is used specifically by the GPU
> > > drivers, the display drivers, the VPU (CODEC and pre/post-processor) or camera
> > > drivers is something that should be discussed. But in the current approach, you
> > > really meant Video memory as a superset of the above. Personally, I think
> > > generically (to de-Andronized your work), en-globing all video memory is
> > > sufficient. What I fail to understand is how you will manage to distinguished
> > > DMABuf Heap allocation (which are used outside of Android btw), from Video
> > > allocation or other type of usage. I'm sure non-video usage will exist in the
> > > future (think of machine learning, compute, other high bandwidth streaming
> > > thingy ...)
> > >
> > Ok thank you for pointing out the naming issue. The naming is a
> > consequence of the initial use case, but I guess it's too specific.
> > What I want out of this change is that android can track dmabufs that
> > come out of heaps, and drm can track gpu memory. But other drivers
> > could track different resources under different names. Imagine this
> > were called a buffer cgroup controller instead of a GPU cgroup
> > controller. Then the use component ("video memory") isn't tied up with
> > the name of the controller, but it's up to the name of the bucket the
> > resource is tracked under. I think this meets the needs of the two use
> > cases I'm aware of now, while leaving the door open to other future
> > needs. Really the controller is just enabling abstract named buckets
> > for tracking and eventually limiting a type of resource.
>
> So, there hasn't been whole lot of discussion w/ other GPU folks and what
> comes up still seems to indicate that we're still long way away from having
> a meaningful gpu controller.
>
Yes, and I would still be happy to collaborate.

> For your use case, would it make sense to just
> add dmabuf as a key to the misc controller?
>
Thanks for your suggestion. This almost works. "dmabuf" as a key could
work, but I'd actually like to account for each heap. Since heaps can
be dynamically added, I can't accommodate every potential heap name by
hardcoding registrations in the misc controller.

> I'm not sure it makes sense to
> push "gpu controller" forward if there's no conceptual consensus around what
> resources are.
>
> Thanks.
>
> --
> tejun
