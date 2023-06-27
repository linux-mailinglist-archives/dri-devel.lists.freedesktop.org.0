Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2407401F5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 19:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B19F10E320;
	Tue, 27 Jun 2023 17:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1B710E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 17:16:18 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-19674cab442so4045608fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687886176; x=1690478176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=06QREl/waagMjgkoRvpEan36fi1fKjqwiODOUhKqFJk=;
 b=TTG2x1CQ/WQa/ktuBdQuwwikF3HqSA80EHyhwxfk09pbHV+S+DWaSLuwC1OpcjDcu2
 JgrejyvZ1TcQIFX8rykiBnnXtia/dJMiqefxvg/y+9mlcW8ZAhT0GziudsbB9rW6H13q
 WHbgIn4xHs7UZe9EGIN5uL60cxLn58K0jYacLyCgf2xXO8oaPdpwEKgyIoEWz/+Qal61
 IbIFXA41rZHaMrpblrOYeolZuC6YN7c93+2VZgcEZMaHpnSotFuDipusAN1V4xPkJxbF
 OvZkKmil3c1y0Wfbb0XGOjwii+H+3Q91CqatWRTfavfQL7I0V4/kmIbBZVmlWhXxWVVn
 0e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687886176; x=1690478176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=06QREl/waagMjgkoRvpEan36fi1fKjqwiODOUhKqFJk=;
 b=FG0tUAy4OK0WU+tYXk9NURKh6iDKJVzQi5A1Lz2QbHhCKRVXbw+7pqo9AMMJzkFzZE
 i91gSq6VTefoTTNpz+PdP1GciqHcNPDQnGMCjGf1VYYckrC1Ktg2K7CfNJLmh0Cehty6
 +zY3RWQAgVbz5XchCFb0ZMB3haHCcZ2xBTcJueYBk4O2iS4WYNLxQsAGqojRkWFHtmBQ
 Eg5ZosHpHqY0D5QS1npfJR4xNHkD8odAEBf25+iJD+yECs8nSnR6M3+5EOMQCAitxvrA
 60T6nWDPcaFg4R5yv38KBE6cMaSkSBFe76cr+JHs4tENiQJXtM1mIPlK30VOArITxV4C
 vHmg==
X-Gm-Message-State: AC+VfDzW446rt3exl3XYLYhi5xGYl9crvEfxCR1QZai9kn95cuJNl0CO
 x/qduWxwv2OCWfG09gWoo94rSy30JJZbrhQFifI=
X-Google-Smtp-Source: ACHHUZ7wFXC47Mc6RzEQNSf/CZtZbwT730zRQJ4DI7Y4jSjIrEizPEYLev23trAV3eEzc+gi0dI5WTX3R2vNcO3n9ig=
X-Received: by 2002:a05:6870:a705:b0:1b0:49a7:c285 with SMTP id
 g5-20020a056870a70500b001b049a7c285mr4311598oam.24.1687886176290; Tue, 27 Jun
 2023 10:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
 <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
 <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
 <a453d562-7e93-aef3-a533-171f572b6ee3@collabora.com>
 <CAAfnVBmwVTBNx4GC2hiYQ9Ya8ufP_D8N0-JOzT2iPV9BYZhD9w@mail.gmail.com>
In-Reply-To: <CAAfnVBmwVTBNx4GC2hiYQ9Ya8ufP_D8N0-JOzT2iPV9BYZhD9w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Jun 2023 10:16:05 -0700
Message-ID: <CAF6AEGvWrUN9W9DKv45OT-MfYAS4D_bXa_Sb5ptgrMEf9WSSqA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 2:23=E2=80=AFPM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
> On Thu, May 11, 2023 at 7:33=E2=80=AFPM Dmitry Osipenko <dmitry.osipenko@=
collabora.com> wrote:
>>
>> On 5/12/23 03:17, Gurchetan Singh wrote:
>> ...
>> > Can we get one of the Mesa MRs reviewed first?  There's currently no
>> > virtio-intel MR AFAICT, and the amdgpu one is marked as "Draft:".
>> >
>> > Even for the amdgpu, Pierre suggests the feature "will be marked as
>> > experimental both in Mesa and virglrenderer" and we can revise as need=
ed.
>> > The DRM requirements seem to warn against adding an UAPI too hastily..=
.
>> >
>> > You can get the deqp-vk 1.2 tests to pass with the current UAPI, if yo=
u
>> > just change your mesa <--> virglrenderer protocol a little.  Perhaps t=
hat
>> > way is even better, since you plumb the in sync-obj into host-side com=
mand
>> > submission.
>> >
>> > Without inter-context sharing of the fence, this MR really only adds g=
uest
>> > kernel syntactic sugar.
>> >
>> > Note I'm not against syntactic sugar, but I just want to point out tha=
t you
>> > can likely merge the native context work without any UAPI changes, in =
case
>> > it's not clear.
>> >
>> > If this was for the core drm syncobj implementation, and not just
>> >> driver ioctl parsing and wiring up the core helpers, I would agree
>> >> with you.
>> >>
>> >
>> > There are several possible and viable paths to get the features in que=
stion
>> > (VK1.2 syncobjs, and inter-context fence sharing).  There are paths
>> > entirely without the syncobj, paths that only use the syncobj for the
>> > inter-context fence sharing case and create host syncobjs for VK1.2, p=
aths
>> > that also use guest syncobjs in every proxied command submission.
>> >
>> > It's really hard to tell which one is better.  Here's my suggestion:
>> >
>> > 1) Get the native contexts reviewed/merged in Mesa/virglrenderer using=
 the
>> > current UAPI.  Options for VK1.2 include: pushing down the syncobjs to=
 the
>> > host, and simulating the syncobj (as already done).  It's fine to mark
>> > these contexts as "experimental" like msm-experimental.  That will all=
ow
>> > you to experiment with the protocols, come up with tests, and hopefull=
y
>> > determine an answer to the host versus guest syncobj question.
>> >
>> > 2) Once you've completed (1), try to add UAPI changes for features tha=
t are
>> > missing or things that are suboptimal with the knowledge gained from d=
oing
>> > (2).
>> >
>> > WDYT?
>>
>> Having syncobj support available by DRM driver is a mandatory
>> requirement for native contexts because userspace (Mesa) relies on sync
>> objects support presence. In particular, Intel Mesa driver checks
>> whether DRM driver supports sync objects to decide which features are
>> available, ANV depends on the syncobj support.
>>
>>
>> I'm not familiar with a history of Venus and its limitations. Perhaps
>> the reason it's using host-side syncobjs is to have 1:1 Vulkan API
>> mapping between guest and host. Not sure if Venus could use guest
>> syncobjs instead or there are problems with that.
>
>
> Why not submit a Venus MR?  It's already in-tree, and you can see how you=
r API works in scenarios with a host side timeline semaphore (aka syncobj).=
  I think they are also interested in fencing/sync improvements.
>
>>
>>
>> When syncobj was initially added to kernel, it was done from the needs
>> of supporting Vulkan wait API. For Venus the actual Vulkan driver is on
>> host side, while for native contexts it's on guest side. Native contexts
>> don't need syncobj on host side, it will be unnecessary overhead for
>> every nctx to have it on host. Hence, if there is no good reason for
>> host-side syncobjs, then why do that?
>
>
> Depends on your threading model.  You can have the following scenarios:
>
> 1) N guest contexts : 1 host thread
> 2) N guest contexts : N host threads for each context
> 3) 1:1 thread
>
> I think the native context is single-threaded (1), IIRC?  If the goal is =
to push command submission to the host (for inter-context sharing), I think=
 you'll at-least want (2).  For a 1:1 model (a la gfxstream), one host thre=
ad can put another thread's out_sync_objs as it's in_sync_objs (in the same=
 virtgpu context).  I think that's kind of the goal of timeline semaphores,=
 with the example given by Khronos as with a compute thread + a graphics th=
read.
>
> I'm not saying one threading model is better than any other, perhaps the =
native context using the host driver in the guest is so good, it doesn't ma=
tter.  I'm just saying these are the types of discussions we can have if we=
 tried to get one the Mesa MRs merged first ;-)
>
>>
>> Native contexts pass deqp synchronization tests, they use sync objects
>> universally for both GL and VK. Games work, piglit/deqp passing. What
>> else you're wanting to test? Turnip?
>
>
> Turnip would also fulfill the requirements, since most of the native cont=
ext stuff is already wired for freedreno.
>
>>
>>
>> The AMDGPU code has been looked and it looks good. It's a draft for now
>> because of the missing sync objects UAPI and other virglrender/Qemu
>> changes required to get KMS working.
>
>
> Get it out of draft mode then :-).  How long would that take?
>
> Also, there's crosvm which builds on standard Linux, so I wouldn't consid=
er QEMU patches as a requirement.  Just Mesa/virglrenderer part.
>
>>
>> Maybe it will be acceptable to
>> merge the Mesa part once kernel will get sync objects supported, will
>> need to revisit it.
>
>
> You can think of my commentary as the following suggestions:
>
> - You can probably get native contexts and deqp-vk 1.2 working with the c=
urrent UAPI
> - It would be terrific to see inter-context fence sharing working (with t=
he wait pushed down to the host), that's something the current UAPI can't d=
o
> - Work iteratively (i.e, it's fine to merge Mesa/virglrenderer MRs as "ex=
perimental") and in steps, no need to figure everything out at once
>
> Now these are just suggestions, and while I think they are good, you can =
safely ignore them.
>
> But there's also the DRM requirements, which state "userspace side must b=
e fully reviewed and tested to the standards of that user-space project.". =
 So I think to meet the minimum requirements, I think we should at-least ha=
ve one of the following (not all, just one) reviewed:
>
> 1) venus using the new uapi
> 2) gfxstream vk using the new uapi
> 3) amdgpu nctx out of "draft" mode and using the new uapi.
> 4) virtio-intel using new uapi
> 5) turnip using your new uapi

forgot to mention this earlier, but
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23533

Dmitry, you can also add, if you haven't already:

Tested-by: Rob Clark <robdclark@gmail.com>

> Depending on which one you chose, maybe we can get it done within 1-2 wee=
ks?
>
>> I'm not opening MR for virtio-intel because it has open questions that
>> need to be resolved first.
>>
>> --
>> Best regards,
>> Dmitry
>>
