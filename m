Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA6383D9B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A786EA62;
	Mon, 17 May 2021 19:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7D06EA62
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:39:51 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 e7-20020a4ad2470000b02902088d0512ceso1717164oos.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3j1vAcC0e9yX5+KBAlb122jwzeMLbo0gBTA1q4Cqjn4=;
 b=lW+41HOiV3M3UyHyQ5yIZc7ZN6wM/y16KLWGAet7h/8/2hwuHhHt20qGqdni0umUI3
 BppDe2WaobU1EPJa+2dJTVp4LJoRnI7lFOgZjnM9tDppo1AlBF6ZuCwVwpB9l5zY2cT4
 69G5xajWBnEGLm0ouCm0AEMPp380iFlpEcdK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3j1vAcC0e9yX5+KBAlb122jwzeMLbo0gBTA1q4Cqjn4=;
 b=BmaLyhjnDtXqkLMhStu4GqxB+z7/CXBmKbhN6u9QxOSqaF15cM1DhrV/zaIpfUmhXR
 G0Ao9O6GoGolgequ3Idp/196niVcXJFIg1OHgOFpFgXqAZ14g1CPdy+AU6FijixeQiHe
 rJo3kOM9au0Vs1dZV6VYVDwHuSXTNGcOt2x+7tA+wOD0mvtFGeF1+KI5BxhRf0ye+UC1
 TBWKAdJQydoODpQJE+kU3kZETtxT3vRLyJ/FpuOBy4H+ZHYAql1g62O4aoOLOwAjnva3
 rB9eZxz4LX9huArO2W9awM6FPfx7X1cAV+6VMCOoYlOAu5OK9gBDysUJkJ0S5ssef4zg
 SAng==
X-Gm-Message-State: AOAM531M+L26NvFPJUEkMLcRwQXDbuwdhgN//2UZEQDhBwbfUy902U7t
 x3X/Tl+X52nCyf4vHe4qCBtFubQHYzw6e+pwjVXEJQ==
X-Google-Smtp-Source: ABdhPJxvEfz5A/yPd3bgGTZqfua++DtVwARgRFKZICirmJHitiLm0al+0eQTJixE/QmJWxVpCkWiK9ucSzd0+XnP/GE=
X-Received: by 2002:a4a:d442:: with SMTP id p2mr1177338oos.89.1621280391096;
 Mon, 17 May 2021 12:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
 <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
In-Reply-To: <CADnq5_NR+ysqmx6ftakGTjqjw0p6roiupa3sYTN8NuAMoGa6sQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 21:39:39 +0200
Message-ID: <CAKMK7uFzcdX-knzZEwLWsPiF2WfePdr0ou1dD169Pwx0GMzgtQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 9:23 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, May 17, 2021 at 3:12 PM Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> >
> > Hi
> >
> > Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> > > On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> > >> On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> > >> <gregkh@linuxfoundation.org> wrote:
> > >>> On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> > >>>> Dear kernel maintainers,
> > >>>>
> > >>>> This submission is a kernel driver to support Intel(R) Gaussian & =
Neural
> > >>>> Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-=
processor
> > >>>> available on multiple Intel platforms. AI developers and users can=
 offload
> > >>>> continuous inference workloads to an Intel(R) GNA device in order =
to
> > free
> > >>>> processor resources and save power. Noise reduction and speech rec=
ognition
> > >>>> are the examples of the workloads Intel(R) GNA deals with while it=
s usage
> > >>>> is not limited to the two.
> > >>>
> > >>> How does this compare with the "nnpi" driver being proposed here:
> > >>>          https://lore.kernel.org/r/20210513085725.45528-1-guy.zadic=
ario@intel.com
> > >>>
> > >>> Please work with those developers to share code and userspace api a=
nd
> > >>> tools.  Having the community review two totally different apis and
> > >>> drivers for the same type of functionality from the same company is
> > >>> totally wasteful of our time and energy.
> > >>
> > >> Agreed, but I think we should go further than this and work towards =
a
> > >> subsystem across companies for machine learning and neural networks
> > >> accelerators for both inferencing and training.
> > >
> > > We have, it's called drivers/gpu. Feel free to rename to drivers/xpu =
or
> > > think G as in General, not Graphisc.
> >
> > I hope this was a joke.
> >
> > Just some thoughts:
> >
> > AFAICT AI first came as an application of GPUs, but has now
> > evolved/specialized into something of its own. I can imagine sharing
> > some code among the various subsystems, say GEM/TTM internals for memor=
y
> > management. Besides that there's probably little that can be shared in
> > the userspace interfaces. A GPU is device that puts an image onto the
> > screen and an AI accelerator isn't. Treating both as the same, even if
> > they share similar chip architectures, seems like a stretch. They might
> > evolve in different directions and fit less and less under the same
> > umbrella.
>
> The putting something on the screen is just a tiny part of what GPUs
> do these days.  Many GPUs don't even have display hardware anymore.
> Even with drawing APIs, it's just some operation that you do with
> memory.  The display may be another device entirely.  GPUs also do
> video encode and decode, jpeg acceleration, etc.  drivers/gpu seems
> like a logical place to me.  Call it drivers/accelerators if you like.
> Other than modesetting most of the shared infrastructure in
> drivers/gpu is around memory management and synchronization which are
> all the hard parts.  Better to try and share that than to reinvent
> that in some other subsystem.

Maybe to add: Most of our driver stack is in userspace (like for NN/AI
chips too), both where high amounts of code sharing are the norm (like
with mesa3d) and areas there the landscape is a lot more fragmented
(like compute and media, where the userspace driver APIs are all
different for each vendor, or at least highly specialized). That's
another thing which I don't think any other kernel subsystem has, at
least as much as we do.

So for both the big design questions on how the overall stack is
organized down to the details like code sharing, drivers/g^Hxpu should
be the best place. Aside from the pesky problem that we do actually
look at the userspace side and have some expectations on that too, not
just on the kernel code alone.
-Daniel

>
> Alex
>
> >
> > And as Dave mentioned, these devices are hard to obtain. We don't reall=
y
> > know what we sign up for.
> >
> > Just my 2 cents.
> >
> > Best regards
> > Thomas
> >
> >
> >
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > (HRB 36809, AG N=C3=BCrnberg)
> > Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
