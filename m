Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8D382582
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 09:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190B46E0DE;
	Mon, 17 May 2021 07:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699E06E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:40:57 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p24so6451966ejb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=B8FVvdrYV7pRJNP/rUxfxaSr7LQz2pvmtedFAKqPA5s=;
 b=CSFvg+tjQEVYhc705mOMRwpzk8Gqt8xv+H0Ikr17UUGkrdXsoTWL0M/0aboeQW7SL0
 WGnU4bdI0p5NbtPBxoIeo/1cgqFGkNieW6G7xHDeOo+2I+gaAhQxABCrVRSNg5NWzPMn
 3o9RmP2fWWxIhM54sngD7vFBAb3B0wP539qc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=B8FVvdrYV7pRJNP/rUxfxaSr7LQz2pvmtedFAKqPA5s=;
 b=tl3USUVEa6wilpShVyOf0k/Q0THQnq9XskerIzeQyh0Ysuqp7cbn1j9C9a4cyQscby
 LXKJ5aujzVqOQHl54+Ok5h5qLm76bFDhxChKM28F/zAXmV2KUTVBgDEe+KFD4alAVJVZ
 959wyr8zt80abNID2sTzJfx7eYnFAgUuWs0iMpMjurg6iop+btwsieacn64G44C9hZAq
 ut+QgR3NlbJpKPR1Ul2Dw33GADY1VybtIx3F2DsQlkvO+Zi2+nR6ZitsL+KctEUYt3Lk
 4s7+l7cXdzpbcPn397hrn4URZ8rHOww6u0OrqrzSaWg+SkWX9zaOkCLLH8j/4YCTW5Iq
 sgDg==
X-Gm-Message-State: AOAM533H61lufwnK0Zcerla4U+JPrWHpPqiGF/A8y2zxovotiyPTbQ62
 +TT1Jy4q+FqiWMjBsTSHIy0vxA==
X-Google-Smtp-Source: ABdhPJxsNKvac4CwIYd6QJnPC6F9qO8I0E39FRtgpcmyeUqnVrz/aM5qdvLz6CPniRZqwmrChq++FA==
X-Received: by 2002:a17:906:cb1:: with SMTP id
 k17mr60265688ejh.307.1621237256090; 
 Mon, 17 May 2021 00:40:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p14sm6814861ejz.51.2021.05.17.00.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:40:55 -0700 (PDT)
Date: Mon, 17 May 2021 09:40:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <YKIeBdwFb9Ng275X@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 Dave Airlie <airlied@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> > > Dear kernel maintainers,
> > >
> > > This submission is a kernel driver to support Intel(R) Gaussian & Neural
> > > Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> > > available on multiple Intel platforms. AI developers and users can offload
> > > continuous inference workloads to an Intel(R) GNA device in order to free
> > > processor resources and save power. Noise reduction and speech recognition
> > > are the examples of the workloads Intel(R) GNA deals with while its usage
> > > is not limited to the two.
> >
> > How does this compare with the "nnpi" driver being proposed here:
> >         https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com
> >
> > Please work with those developers to share code and userspace api and
> > tools.  Having the community review two totally different apis and
> > drivers for the same type of functionality from the same company is
> > totally wasteful of our time and energy.
> 
> Agreed, but I think we should go further than this and work towards a
> subsystem across companies for machine learning and neural networks
> accelerators for both inferencing and training.

We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
think G as in General, not Graphisc.

> We have support for Intel habanalabs hardware in drivers/misc, and there are
> countless hardware solutions out of tree that would hopefully go the same
> way with an upstream submission and open source user space, including
> 
> - Intel/Mobileye EyeQ
> - Intel/Movidius Keembay
> - Nvidia NVDLA
> - Gyrfalcon Lightspeeur
> - Apple Neural Engine
> - Google TPU
> - Arm Ethos
> 
> plus many more that are somewhat less likely to gain fully open source
> driver stacks.

We also had this entire discussion 2 years ago with habanalabs. The
hang-up is that drivers/gpu folks require fully open source userspace,
including compiler and anything else you need to actually use the chip.
Greg doesn't, he's happy if all he has is the runtime library with some
tests.

These two drivers here look a lot more like classic gpus than habanalabs
did, at least from a quick look they operate with explicit buffer
allocations/registration model. So even more reasons to just reuse all the
stuff we have already. But also I don't expect these drivers here to come
with open compilers, they never do, not initially at least before you
started talking with the vendor. Hence I expect there'll be more
drivers/totally-not-drm acceleration subsystem nonsense.

Anyway this horse has been throughroughly beaten to death and more, the
agreement is that accel drivers in drivers/misc must not use any gpu
stuff, so that drivers/gpu people dont end up in a prickly situation they
never signed up for. E.g. I removed some code sharing from habanalabs.
This means interop between gpu and nn/ai drivers will be no-go until this
is resolved, but *shrug*.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
