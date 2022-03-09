Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F94D3C61
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8595010E4BF;
	Wed,  9 Mar 2022 21:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3726F10E4BF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 21:51:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q14so5108260wrc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 13:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wB+NOcZPjuBQ7I++42cwqpD+y9hE+iVjMiQbLppxTXQ=;
 b=S5ziUcSwcWcbqql4ryBgFaU9gKpCBE1RLKnQP7DR/A/4pJO6wUAXSOpyOC/PimqW0K
 enPHbFGVz/35MIg78/PK2T2OmkRBZlHkZvRYSg31B27Ojy6Ymwd7fNI8qSHlnt75iSVX
 UzwdOpu2dZf0hwZ4B9nww9hl9WhRfSTUI35DLGd0M9FKMZKdlpVsVn4yPoxhx+DAiqkm
 NSylcRRoIzknJ19apuqe5z+3Z1yNmpa0sIlQBa5ZBFZjdmun0ZFn9enrkE9px7gNyuSR
 9sEAsMuA2MFx4TFTw0bsjNEJRtihF96nvJDmKiSuS83NE1nUoynqmTX/VcJAh8K/tiTO
 15mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wB+NOcZPjuBQ7I++42cwqpD+y9hE+iVjMiQbLppxTXQ=;
 b=dPAx7QPH09YIFzKXnfnKv7+bkAUrqEbDYlgOfcM6TfywK4hSxMt6ZDG8ruyATvcxvG
 7G497psQq6Z41tIr4bPxVJ0TVo9Fzbp6vI37vACgOTZvKsXvlvglnTWZyrNiaCs+ERSD
 zHpgtcjX1+Z10QJuXeA7AZ8pWsN4HJYeoQESS4Wdjn02T9oP18dEkN+ohwqctmuJBSeE
 X+5H1OkLBz1NNmFgVlMvy1bdHuUmUfOzVoNBcGiYiDs2jWpOR2nL4KHkwEFmVfJNUcOS
 GS1LaR2AB9bPs9En73BU4JW6rsjgvQr1g9jt5QAZotb4wSBlnR49h8O9yjnhYvu+v421
 xtsg==
X-Gm-Message-State: AOAM531x1UA/XuR3GhRS2g9ngDezB7yyNoB/N7cP/wury57bY1nq3f6R
 VX3eYcD8hcb2x+tLlQoweLg8SdTcL/CdNRkQivE=
X-Google-Smtp-Source: ABdhPJz2ayymHz8VybPKo5wyBEMKvIoEykqiV82sROIEpsyQSqwGfjcsaesHGo/FmmgPPT5CBmcho8SDwODf8kuYNoU=
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr1224465wrj.297.1646862663329; Wed, 09
 Mar 2022 13:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
 <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
 <CAF6AEGuR8B6z+z=VFQ6y01wbboYS_qpkghD1GYdLES_RZOW1wA@mail.gmail.com>
 <42facae5-8f2c-9c1f-5144-4ebb99c798bd@collabora.com>
 <CAF6AEGtebAbWhkvrxzi4UBLdv2LJPQVPBzH-sXcACs7cxznQ8A@mail.gmail.com>
 <05e1fe61-1c29-152f-414b-cd6a44525af0@collabora.com>
In-Reply-To: <05e1fe61-1c29-152f-414b-cd6a44525af0@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 9 Mar 2022 13:51:42 -0800
Message-ID: <CAF6AEGvf81epGOs7Zh4WK-7mkXRApO2p-h4g8dTuk4xtc1HOeg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 9, 2022 at 12:06 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 3/9/22 03:56, Rob Clark wrote:
> >> If we really can't track madvise state in the guest for dealing with
> >> host memory pressure, I think the better option is to introduce
> >> MADV:WILLNEED_REPLACE, ie. something to tell the host kernel that the
> >> buffer is needed but the previous contents are not (as long as the GPU
> >> VA remains the same).  With this the host could allocate new pages if
> >> needed, and the guest would not need to wait for a reply from host.
> > If variant with the memory ballooning will work, then it will be
> > possible to track the state within guest-only. Let's consider the
> > simplest variant for now.
> >
> > I'll try to implement the balloon driver support in the v2 and will get
> > back to you.
> >
>
> I looked at the generic balloon driver and looks like this not what we
> want because:
>
> 1. Memory ballooning is primarily about handling memory overcommit
> situations. I.e. when there are multiple VMs consuming more memory than
> available in the system. Ballooning allows host to ask guest to give
> unused pages back to host and host could give pages to other VMs.
>
> 2. Memory ballooning operates with guest memory pages only. I.e. each
> ballooned page is reported to/from host in a form of page's DMA address.
>
> 3. There is no direct connection between host's OOM events and the
> balloon manager. I guess host could watch system's memory pressure and
> inflate VMs' balloons on low memory, releasing the guest's memory to the
> system, but apparently this use-case not supported by anyone today, at
> least I don't see Qemu supporting it.
>

hmm, on CrOS I do see balloon getting used to balance host vs guest
memory.. but admittedly I've not yet looked closely at how that works,
and it does seem like we have some things that are not yet upstream
all over the place (not to mention crosvm vs qemu)

>
> So the virtio-balloon driver isn't very useful for us as-is.
>
> One possible solution could be to create something like a new
> virtio-shrinker device or add shrinker functionality to the virtio-gpu
> device, allowing host to ask guests to drop shared caches. Host then
> should become a PSI handler. I think this should be doable in a case of
> crosvm. In a case of GNU world, it could take a lot of effort to get
> everything to upstreamable state, at first there is a need to
> demonstrate real problem being solved by this solution.

I guess with 4GB chromebooks running one or more VMs in addition to
lots of browser tabs in the host, it shouldn't be too hard to
demonstrate a problem ;-)

(but also, however we end up solving that, certainly shouldn't block
this series)

> The other minor issue is that only integrated GPUs may use system's
> memory and even then they could use a dedicated memory carveout, i.e.
> releasing VRAM BOs may not help with host's OOM. In case of virgl
> context we have no clue about where buffers are physically located. On
> the other hand, in the worst case dropping host caches just won't help
> with OOM.

Userspace should know whether the BO has CPU storage, so I don't think
this should be a problem virtio_gpu needs to worry about

> It's now unclear how we should proceed with the host-side shrinker
> support. Thoughts?
>
> We may start easy and instead of thinking about host-side shrinker, we
> could make VirtIO-GPU driver to expire cached BOs after a certain
> timeout. Mesa already uses timeout-based BO caching, but it doesn't have
> an alarm timer and simply checks expiration when BO is allocated. Should
> be too much trouble to handle timers within Mesa since it's executed in
> application context, easier to do it in kernel, like VC4 driver does it
> for example. This is not good as a proper memory shrinker, but could be
> good enough in practice.

I think that, given virgl uses host storage, guest shrinker should be
still useful.. so I think continue with this series.

For host shrinker, I'll have to look more at when crosvm triggers
balloon inflation.  I could still go the MADV:WILLNEED_REPLACE
approach instead, which does have the advantage of host kernel not
relying on host userspace or vm having a chance to run in order to
release pages.  The downside (perhaps?) is it would be more specific
to virtgpu-native-context and less so to virgl or venus (but I guess
there doesn't currently exist a way for madvise to be useful for vk
drivers).

BR,
-R
