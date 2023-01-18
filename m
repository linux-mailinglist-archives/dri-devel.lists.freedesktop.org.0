Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED086727FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E00610E7F6;
	Wed, 18 Jan 2023 19:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4510E7F6;
 Wed, 18 Jan 2023 19:17:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so39068778ejc.7;
 Wed, 18 Jan 2023 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IpoGDyyHiMyxVVqXlDO8VXUaDac4ka8Hm9JUqwyeyEs=;
 b=atkQCQJMxd0XKviaE+UGS4QaMizaO5XFY9lGdr8QkLZNebZ3/1c4AJuHBGKorF+ald
 ucp1wwZb9t9kt9ing+5GrUMjg/lBgAMx961qMXBf9skjzhdB0VCB8dai/YWVmixds1vu
 FH+2JvlD3wmvzx/WbdAibxi10VD6q34Bb6dPf5RJT8PbGNpl6yoD7qzzZ8sq+BgmqLZQ
 copT2IyjOrNnH/2HkjNQPgM7SpoNpwSRurrxiYf9bNXDHMIwKe5nNWL1dZL1HDpjoV+k
 FZmZXFIfHnm9CLEACZmwH89MLsEcakoxgibu0h5YCciqGMLx87NDachpPAjcNvdJVYFw
 Kutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IpoGDyyHiMyxVVqXlDO8VXUaDac4ka8Hm9JUqwyeyEs=;
 b=umfqzGEundJqyV2cSh+NMnehcF7YsYu0D9rSuLKaSZWOM2+l3FnYcgGd/TbJxj+mGw
 5sEDUb9egbfRrvIbCLLSRK/6TfKk1g2j6hf/Pb5NEOyXckVT9tSMS7TE/uUFJWFUrB2k
 Z1TRcrNzKPQuToQ7ScSe1YkY3edn609TJTHZa6/gnAxU333MTKZAb65DvyRW51tF34zk
 kzPeqTB/mh+Ap6A8ksdr+GFq+JmGmpfsvcFZPlZGqfc+roiw2zFJdEb0PkDP/3PQUayb
 9OSJ68w6SiZwj2yUUIgoOBB1PqtGb6WPsRUpa7Ccl4hUhEX6cXNX8BPpplUSuTvzeuFv
 jTuQ==
X-Gm-Message-State: AFqh2krohMbzz5+WYf86dfeaBqZ7h8xLHHtCfinSYPSYhwCUdNH8ZmMl
 /6woBVRXZYyXdwf/YnvPU3EmUN4bxps1jZCMqoE=
X-Google-Smtp-Source: AMrXdXvtXTlbwhBPmycKaEdv4lJMm5Eg+oxV9M8XAggIWPaTaOGLbfWlK5wovvMFonSRuGsooqZ5pDcDH1/PhUnQDes=
X-Received: by 2002:a17:906:816:b0:86a:d572:93ae with SMTP id
 e22-20020a170906081600b0086ad57293aemr741640ejd.273.1674069449336; Wed, 18
 Jan 2023 11:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20230118061256.2689-1-dakr@redhat.com>
 <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
 <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
 <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com>
 <CADnq5_PGaXFW-z3gt+R+W+vBVdeuL4wMuMOQh4muxU13Bemy3A@mail.gmail.com>
 <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
 <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
In-Reply-To: <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Jan 2023 05:17:16 +1000
Message-ID: <CAPM=9txMZO1uYj+kVdTfmCwV2Fq8uu_b3i4eq4xhqPEPKBW8Eg@mail.gmail.com>
Subject: Re: [PATCH drm-next 00/14] [RFC] DRM GPUVA Manager & Nouveau VM_BIND
 UAPI
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
Cc: jason@jlekstrand.net, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 bskeggs@redhat.com, tzimmermann@suse.de, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023 at 02:54, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Jan 18, 2023 at 11:50 AM Danilo Krummrich <dakr@redhat.com> wrote=
:
> >
> >
> >
> > On 1/18/23 17:30, Alex Deucher wrote:
> > > On Wed, Jan 18, 2023 at 11:19 AM Danilo Krummrich <dakr@redhat.com> w=
rote:
> > >>
> > >> On 1/18/23 16:37, Christian K=C3=B6nig wrote:
> > >>> Am 18.01.23 um 16:34 schrieb Danilo Krummrich:
> > >>>> Hi Christian,
> > >>>>
> > >>>> On 1/18/23 09:53, Christian K=C3=B6nig wrote:
> > >>>>> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
> > >>>>>> This patch series provides a new UAPI for the Nouveau driver in
> > >>>>>> order to
> > >>>>>> support Vulkan features, such as sparse bindings and sparse resi=
dency.
> > >>>>>>
> > >>>>>> Furthermore, with the DRM GPUVA manager it provides a new DRM co=
re
> > >>>>>> feature to
> > >>>>>> keep track of GPU virtual address (VA) mappings in a more generi=
c way.
> > >>>>>>
> > >>>>>> The DRM GPUVA manager is indented to help drivers implement
> > >>>>>> userspace-manageable
> > >>>>>> GPU VA spaces in reference to the Vulkan API. In order to achiev=
e
> > >>>>>> this goal it
> > >>>>>> serves the following purposes in this context.
> > >>>>>>
> > >>>>>>       1) Provide a dedicated range allocator to track GPU VA
> > >>>>>> allocations and
> > >>>>>>          mappings, making use of the drm_mm range allocator.
> > >>>>>
> > >>>>> This means that the ranges are allocated by the kernel? If yes th=
at's
> > >>>>> a really really bad idea.
> > >>>>
> > >>>> No, it's just for keeping track of the ranges userspace has alloca=
ted.
> > >>>
> > >>> Ok, that makes more sense.
> > >>>
> > >>> So basically you have an IOCTL which asks kernel for a free range? =
Or
> > >>> what exactly is the drm_mm used for here?
> > >>
> > >> Not even that, userspace provides both the base address and the rang=
e,
> > >> the kernel really just keeps track of things. Though, writing a UAPI=
 on
> > >> top of the GPUVA manager asking for a free range instead would be
> > >> possible by just adding the corresponding wrapper functions to get a
> > >> free hole.
> > >>
> > >> Currently, and that's what I think I read out of your question, the =
main
> > >> benefit of using drm_mm over simply stuffing the entries into a list=
 or
> > >> something boils down to easier collision detection and iterating
> > >> sub-ranges of the whole VA space.
> > >
> > > Why not just do this in userspace?  We have a range manager in
> > > libdrm_amdgpu that you could lift out into libdrm or some other
> > > helper.
> >
> > The kernel still needs to keep track of the mappings within the various
> > VA spaces, e.g. it silently needs to unmap mappings that are backed by
> > BOs that get evicted and remap them once they're validated (or swapped
> > back in).
>
> Ok, you are just using this for maintaining the GPU VM space in the kerne=
l.
>

Yes the idea behind having common code wrapping drm_mm for this is to
allow us to make the rules consistent across drivers.

Userspace (generally Vulkan, some compute) has interfaces that pretty
much dictate a lot of how VMA tracking works, esp around lifetimes,
sparse mappings and splitting/merging underlying page tables, I'd
really like this to be more consistent across drivers, because already
I think we've seen with freedreno some divergence from amdgpu and we
also have i915/xe to deal with. I'd like to at least have one place
that we can say this is how it should work, since this is something
that *should* be consistent across drivers mostly, as it is more about
how the uapi is exposed.

Dave.
