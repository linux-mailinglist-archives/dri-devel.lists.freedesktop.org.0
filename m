Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553952F4D2
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 23:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623C10ECF2;
	Fri, 20 May 2022 21:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874E10ECF2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 21:13:06 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id rs12so6034622ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5tfmEi05Xxp6dAU46ufHV2sPoKhSLRcQSmdSLO82mmA=;
 b=bA/NyeZJkA1hcMARgGoi/q6CxSZb4tZNUCU2SXUH09N5rv135UYjG5RiL08e98QaZF
 NIDWP0MjQkSWnDPFpM2qKUjPHNuJ/ehR4zvL7ebrBnqYtQLo7zmft+h3vEqrGGwyMA74
 WQoSa3DGbkfxVg8lmGeuisHCLuaTOSzltsN2TrXtllC/61Mdk4tju1sfAu/xQeYNWZex
 tz6pRHj5vNRbN7Co6i7gV6+4+bZhcD2rBiCZsPemvHbDopbhwfCTKM98kKdnLEn1MgEy
 1zCcGxm8mF/uw0lXTWu5s0kVMnYdtZJe+y0i9Q3glQNlBQgqkM0bpfONpICjraYnMrGd
 KUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5tfmEi05Xxp6dAU46ufHV2sPoKhSLRcQSmdSLO82mmA=;
 b=fSKnHAROVB5pE4QS2g1lrRHPB3YNYxt4duoaQRkWh7k3ICHBGVl2xbcEM697eiZWi3
 o5/W6aHKk9HpLwguPuORumJC1T9vuyboZLMg+br2B9uXCWyov9lb0c9X2u7jtV0XD4oX
 zWD4Q7hzjRTm0pXuWsS6KhC5Jfjpbo46/wpclJIFEoEeB7wKCZ/4sBuyrK8hg9t+hf2F
 VFnnGeOj2wHyvmFbU7GD5OcCAM9Zsd220hltmbt7FTLLp+J4a6j7PjlEwpA8pLvUHxhE
 4zqb/YFTpxdVdSa/6H7ulZFrd2LYZ9BP2384jE3vnHmU9RtN++6GVcebr0LcVx02wbQ4
 Jznw==
X-Gm-Message-State: AOAM530gDBk0RwcbRuIGkarCwIrqcxNO5gGru3u2cyFMA6n+djAN7LqU
 nL/KINN3t0gECRz37/fdLbRhYXb8Sg3lnmB5HJuzag==
X-Google-Smtp-Source: ABdhPJyFNfBP1soSSW+7t14vdrjq1IQP8RcJSq0V3+aYaQxEfVyt7JYMA4eZujIkkMiueV9zFTA+HtvtZUjGyJAAOV4=
X-Received: by 2002:a17:907:6e18:b0:6fe:324a:65c1 with SMTP id
 sd24-20020a1709076e1800b006fe324a65c1mr10678202ejc.368.1653081184534; Fri, 20
 May 2022 14:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <d820893c-fa2e-3bac-88be-f39c06d89c01@amd.com>
 <CABdmKX2m1b1kdACKM19S+u9uR5RTy1UGMRgd+3QA_oAyCpeggg@mail.gmail.com>
 <7f895a99-adfa-bcbd-c130-a924c668b8af@amd.com>
 <CABdmKX0XLvRZvXyiN0P_B-fUACiF5xwQ07+u_gaR+hDhu_x_TA@mail.gmail.com>
 <953d4a2c-bf0c-9a92-9964-eae445a8f113@amd.com>
In-Reply-To: <953d4a2c-bf0c-9a92-9964-eae445a8f113@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 May 2022 14:12:53 -0700
Message-ID: <CABdmKX2dNYhgOYdrrJU6-jt6F=LjCidbKhR6t4F7yaa0SPr+-A@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, kernel-team@android.com,
 Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 12:03 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.05.22 um 00:58 schrieb T.J. Mercier:
> > [SNIP]
> >>> Is there some other
> >>> solution to the problem of exports getting blocked that you would
> >>> suggest here?
> >> Well pretty much the same as Greg outlined as well. Go back to your
> >> drawing board and come back with a solution which does not need such
> >> workarounds.
> >>
> >> Alternatively you can give me a full overview of the design and explai=
n
> >> why exactly that interface here is necessary in exactly that form.
> >>
> > We ended up here because we could not use debugfs.
>
> [SNIP]
>
> > Another idea was adding per-buffer stats to procfs, but that was not
> > an option since per-buffer stats are not process specific.
> >
> > So it seemed like sysfs was an appropriate solution at the time. It
> > comes with a stable interface as a bonus, but with the limitation of 1
> > value per file this leads to creating lots of files in sysfs for all
> > dma buffers. This leads to increased kernfs lock contention, and
> > unfortunately we try to take the lock on the hot path.
>
> That's what I totally agree on about. debugfs is for debugging and not
> for production use.
>
> So either sysfs or procfs or something completely different seems to be
> the right direction for the solution of the problem.
>
> > With the description and links to the userspace code which actually
> > uses the feature I feel like that's a complete picture of what's
> > currently happening with this interface. If you could explain what
> > information is missing I'll do my best to provide it.
>
> Yeah, I've realized that I didn't made it clear what my concerns are
> here. So let me try once more from the beginning:
>
> DMA-buf is a framework for sharing device buffers and their handles
> between different userspace processes and kernel device. It's based
> around the concept of representing those buffers as files which can then
> be mmap(), referenced with a file descriptor, etc....
>
> Those abilities come with a certain overhead, using inode numbers,
> reference counters, creating virtual files for tracking (both debugfs,
> sysfs, procfs) etc... So what both drivers and userspace implementing
> DMA-buf is doing is that they share buffers using this framework only
> when they have to.
>
> In other words for upstream graphics drivers 99.9% of the buffers are
> *not* shared using DMA-buf. And this is perfectly intentional because of
> the additional overhead. Only the 3 or 4 buffers which are shared per
> process between the client and server in a display environment are
> actually exported and imported as DMA-buf.
>
> What the recent patches suggest is that this is not the case on Android.
> So for example overrunning a 32bit inode number means that you manage to
> created and destroy over 4 billion DMA-bufs. Same for this sysfs based
> accounting, this only makes sense when you really export *everything* as
> DMA-buf.
>
> So if that is correct, then that would be a pretty clear design issue in
> Android. Now, if you want to keep this design then that is perfectly
> fine with the kernel, but it also means that you need to deal with any
> arising problems by yourself.
>
> Pushing patches upstream indicates that you want to share your work with
> others. And in this case it suggests that you want to encourage others
> to follow the Android design and that is something I would pretty
> clearly reject.
>
Ok thank you, this is clear and I understand your position. Yes
Android does things a little differently. My team is actually hoping
to create a presentation on this topic explaining why things are the
way they are because these differences keep coming up in discussions.

The inode number rollover happened after running for two weeks, but
that's still around 300M a day which is extraordinary, so I think they
must have been stress testing. But yes the Android graphics stack does
make much more use of DMA-bufs than other users.

> >> Yeah and to be honest I have the strong feeling now that this was
> >> absolutely not well thought through.
> > I'm open to working on a replacement for this if we can't find an
> > acceptable solution here, but I would appreciate some direction on
> > what would be acceptable. For example Greg's idea sounds workable, but
> > the question is if it mergeable?
>
> Well one possibility would be to use cgroups. That framework needs to do
> accounting as well, just with an additional limitation to it.
>
> And there are already some proposed cgroup patches for device driver
> memory. While reviewing those both Daniel and I already made it pretty
> clear that it must be separated from DMA-buf, exactly because of the
> reason that we probably don't want every buffer exported.
>
Cgroups definitely would help out with per-application accounting.
Much nicer than parsing through procfs. For our use case this requires
associating the exporter name with the cgroup resource, which is part
of the data that comes from sysfs now. I have some patches which do
this, but this naming component is a point of contention at the
moment. Maybe it would be better to focus efforts on the problem of
how to categorize and aggregate (or not aggregate) graphics resources
for accounting with cgroups in a way that suits everyone's needs.

Thanks,
T.J.


> But to work on a full blown solution I need a better understanding of
> how your userspace components do.
>
> Regards,
> Christian.
