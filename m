Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E521E6F5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 06:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08B76E8B3;
	Tue, 14 Jul 2020 04:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB866E8B2;
 Tue, 14 Jul 2020 04:26:49 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id dr13so20040603ejc.3;
 Mon, 13 Jul 2020 21:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nqCoGwxLWGUFRBYoJniUFlye2WrM2A+0xdgEnvNr9HI=;
 b=hjS2gMhVrldRfX3nM6QqxvhIBoyg9YiGOpunLo7+C+MAYqRCaHWRjc0EqMdI0eZh4d
 lZsSl4Uoz/i5Qd4RehsEgZkuQ/zn5S1+aGGWVcbHbZeY+SDQcwcFJsrmkfKVZsyBqz40
 K2rV/M7xTm+iZwrj46EfWNYBRe5QzEv6H9IG7uzqOBNYLXHeoCRm/7MIVOw3eqgoGzCX
 4bgP5xgf61QiKBCkGF1fXAJ/rm2H0M4bZTYfAbGVMPJvLifWOzJaR58np44JvgxL5dxt
 RGmX+kqg2+TfzwVfZJC8JCrCyeZHbZI/x3N3tHtg/iDSnlHVlSxuwNOUVZKZtDhqHSW3
 U/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nqCoGwxLWGUFRBYoJniUFlye2WrM2A+0xdgEnvNr9HI=;
 b=B4b6OpYGfTEgye9wkNK1/9nEDeYt7TgxGLCQ6OSyACtxn9jvOoraU3kcrZCMynUerv
 RiJvsdpG9nh8no0yDxhvAl0akz/aVHU64f3UJS0cFna2oIhOfHJ4NVBxU8x5CFjstHfd
 430NpyJ0L9r3YSH2VzALZ/8ILyxEXuMfWZth+WnMt2TOOPv8nzqDO2D+qfxhP5dFSzh3
 p0W+JM+J+zn40ozG7y6PI46cLqkJmwaV1yEHxOE1cukfhAu94Vrj5EA/1ShDC5vdUAF0
 PkGjSzMPdBuO+DeYwtzU1Gtzm5X1nY5m71OIwh+kr3DXICHVMMfKHlZ2laP7EoP/gPd0
 rO8w==
X-Gm-Message-State: AOAM532EabRU5srWOP1LPaZnOPddHgOehHwEtF8ohPufprteq2+5J5hA
 JoLmktPXHv8lun1iFr68JZzohl2AiKdK1tj1wuA=
X-Google-Smtp-Source: ABdhPJyPDtsENIHNU9Sfmr51ejVDY+d4x8zX0rxlLIs3+2mdIDMKPJT7NPJBw+4IDkIkNNUnG4jMzB2P403XW0Ib2Lk=
X-Received: by 2002:a17:906:40cb:: with SMTP id
 a11mr2656590ejk.340.1594700807554; 
 Mon, 13 Jul 2020 21:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
 <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
 <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
In-Reply-To: <4245d340-f4f6-eeb5-40a6-3afd7754852c@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Jul 2020 14:26:36 +1000
Message-ID: <CAPM=9tz3UC8VuP=n_OAF5LnAmXSVR32LztqeEWtssnodMj70dQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jul 2020 at 14:09, Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> Am 2020-07-13 um 11:28 p.m. schrieb Dave Airlie:
> > On Tue, 14 Jul 2020 at 13:14, Felix Kuehling <Felix.Kuehling@amd.com> wrote:
> >> This allows exporting and importing buffers. The API generates handles
> >> that can be used with the HIP IPC API, i.e. big numbers rather than
> >> file descriptors.
> > First up why? I get the how.
>
> The "why" is compatibility with HIP code ported from CUDA. The
> equivalent CUDA IPC API works with handles that can be communicated
> through e.g. a pipe or shared memory. You can't do that with file
> descriptors.

Okay that sort of useful information should definitely be in the patch
description.

>
> https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g8a37f7dfafaca652391d0758b3667539
>
> https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html#group__CUDART__DEVICE_1g01050a29fefde385b1042081ada4cde9
>
> >
> >> + * @share_handle is a 128 bit random number generated with
> >> + * @get_random_bytes. This number should be very hard to guess.
> >> + * Knowledge of the @share_handle implies authorization to access
> >> + * the shared memory. User mode should treat it like a secret key.
> >> + * It can be used to import this BO in a different process context
> >> + * for IPC buffer sharing. The handle will be valid as long as the
> >> + * underlying BO exists. If the same BO is exported multiple times,
> > Do we have any examples of any APIs in the kernel that operate like
> > this? That don't at least layer some sort of file permissions  and
> > access control on top?
>
> SystemV shared memory APIs (shmget, shmat) work similarly. There are
> some permissions that can be specified by the exporter in shmget.
> However, the handles are just numbers and much easier to guess (they are
> 32-bit integers). The most restrictive permissions would allow only the
> exporting UID to attach to the shared memory segment.
>
> I think DRM flink works similarly as well, with a global name IDR used
> for looking up GEM objects using global object names.

flink is why I asked, because flink was a mistake and not one I'd care
to make again.
shm is horrible also, but at least has some permissions on what users
can attack it.

> > The reason fd's are good is that combined with unix sockets, you can't
> > sniff it, you can't ptrace a process and find it, you can't write it
> > out in a coredump and have someone access it later.
>
> Arguably ptrace and core dumps give you access to all the memory
> contents already. So you don't need the shared memory handle to access
> memory in that case.

core dumps might not dump this memory though, but yeah ptrace would
likely already mean you have access.

> > Maybe someone who knows security can ack merging this sort of uAPI
> > design, I'm not confident in what it's doing is in any ways a good
> > idea. I might have to ask some people to take a closer look.
>
> Please do. We have tried to make this API as secure as possible within
> the constraints of the user mode API we needed to implement.

I'll see if I hear back, but also if danvet has any input like I
suppose it's UUID based buffer access, so maybe 128-bit is enough and
you have enough entropy not to create anything insanely predictable.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
