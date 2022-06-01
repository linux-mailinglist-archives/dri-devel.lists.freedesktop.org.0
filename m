Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1A53A04B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904AE10E615;
	Wed,  1 Jun 2022 09:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D0010E615
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:27:29 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id b135so1422146pfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FQKjGdHAdslJkazyUX8MnPpWOb0qPSiFo8Q2p07MgUQ=;
 b=F9Bb6WmCXe9/R0yLgWTXRmWI7cHU1vy60dY3ezfMjKSSsQTK0KYg2oJ1RxG9qtRG/0
 vchifc9GdpgfKb2+o8fT3PL5/+1c37t4gyyoeRw9QjadYaSuC85rtPt8rAZBUmU9fo15
 plpCg+YzpK05ERtIDc/FZVho1EBDW/JanjXWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQKjGdHAdslJkazyUX8MnPpWOb0qPSiFo8Q2p07MgUQ=;
 b=ZAtChftxtQWZGzzve2i4f8jBF381gG4dl4LtdedW8EB31Zp+8HrckQ81PcvE5uFgJk
 vkIcj5MPezwucPwDOWHOqGT7WpUbrfYOavscKgmAGwjBI/vZ8WbqtBQdvM3IgVNIZ25j
 S/IgCI66cK/BHuEV0mMkaMY49Cr9PK+bUUVKLJDSFl1QGK+TfC2fIyJbfpHCSwraeHGI
 iCT1fwNxLeIH9Nn23ovY7IuaSW7s+ix8K7/bO1OJKgl9yne4SPLgXqzPeMVOYzunznNn
 JNRpR/QXjyzNpIzVXy4MnDnOAX+Z7DsJAvn4xRWimKS1kWTaUKwgkPO70XfmDyN1d0fd
 7u6g==
X-Gm-Message-State: AOAM533Yqn6g0ZIK3Ph3w4Pc1mIOzIB7OcmqlBsrBpEip50EwHBvLrQJ
 S6lgWQ5WPeTKUo3upzTRW/cbWPFmT6EH7lLBlLNudQ==
X-Google-Smtp-Source: ABdhPJw3Cl7Gv4p9NiEw7jKbv9qGIbZuFcyCf0TBryc4WxWQTqvFUUlFHvGQHfL0RcKuAVwYoPZ0w6PgcPc0VjGx27o=
X-Received: by 2002:a63:e43:0:b0:3fb:ca8e:616d with SMTP id
 3-20020a630e43000000b003fbca8e616dmr18837597pgo.443.1654075648939; Wed, 01
 Jun 2022 02:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-4-niranjana.vishwanathapura@intel.com>
 <e4e1989c314d3958d58010431515ea371935d0c3.camel@intel.com>
 <20220523191943.GH4461@nvishwa1-DESK>
 <CAPM=9tzcYL5kwv18cfq5NzE00jwHuwTj_L73NVgE8vdcBgrQww@mail.gmail.com>
In-Reply-To: <CAPM=9tzcYL5kwv18cfq5NzE00jwHuwTj_L73NVgE8vdcBgrQww@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 1 Jun 2022 11:27:17 +0200
Message-ID: <CAKMK7uFt23yZxGJfuZ71ngNw-46yvyed8LaQCQ1ksq73MLGEug@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v3 3/3] drm/doc/rfc: VM_BIND uapi definition
To: Dave Airlie <airlied@gmail.com>
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Jun 2022 at 11:03, Dave Airlie <airlied@gmail.com> wrote:
>
> On Tue, 24 May 2022 at 05:20, Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com> wrote:
> >
> > On Thu, May 19, 2022 at 04:07:30PM -0700, Zanoni, Paulo R wrote:
> > >On Tue, 2022-05-17 at 11:32 -0700, Niranjana Vishwanathapura wrote:
> > >> VM_BIND and related uapi definitions
> > >>
> > >> v2: Ensure proper kernel-doc formatting with cross references.
> > >>     Also add new uapi and documentation as per review comments
> > >>     from Daniel.
> > >>
> > >> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@=
intel.com>
> > >> ---
> > >>  Documentation/gpu/rfc/i915_vm_bind.h | 399 ++++++++++++++++++++++++=
+++
> > >>  1 file changed, 399 insertions(+)
> > >>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
> > >>
> > >> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gp=
u/rfc/i915_vm_bind.h
> > >> new file mode 100644
> > >> index 000000000000..589c0a009107
> > >> --- /dev/null
> > >> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
> > >> @@ -0,0 +1,399 @@
> > >> +/* SPDX-License-Identifier: MIT */
> > >> +/*
> > >> + * Copyright =C2=A9 2022 Intel Corporation
> > >> + */
> > >> +
> > >> +/**
> > >> + * DOC: I915_PARAM_HAS_VM_BIND
> > >> + *
> > >> + * VM_BIND feature availability.
> > >> + * See typedef drm_i915_getparam_t param.
> > >> + */
> > >> +#define I915_PARAM_HAS_VM_BIND               57
> > >> +
> > >> +/**
> > >> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
> > >> + *
> > >> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
> > >> + * See struct drm_i915_gem_vm_control flags.
> > >> + *
> > >> + * A VM in VM_BIND mode will not support the older execbuff mode of=
 binding.
> > >> + * In VM_BIND mode, execbuff ioctl will not accept any execlist (ie=
., the
> > >> + * &drm_i915_gem_execbuffer2.buffer_count must be 0).
> > >> + * Also, &drm_i915_gem_execbuffer2.batch_start_offset and
> > >> + * &drm_i915_gem_execbuffer2.batch_len must be 0.
> > >> + * DRM_I915_GEM_EXECBUFFER_EXT_BATCH_ADDRESSES extension must be pr=
ovided
> > >> + * to pass in the batch buffer addresses.
> > >> + *
> > >> + * Additionally, I915_EXEC_NO_RELOC, I915_EXEC_HANDLE_LUT and
> > >> + * I915_EXEC_BATCH_FIRST of &drm_i915_gem_execbuffer2.flags must be=
 0
> > >> + * (not used) in VM_BIND mode. I915_EXEC_USE_EXTENSIONS flag must a=
lways be
> > >> + * set (See struct drm_i915_gem_execbuffer_ext_batch_addresses).
> > >> + * The buffers_ptr, buffer_count, batch_start_offset and batch_len =
fields
> > >> + * of struct drm_i915_gem_execbuffer2 are also not used and must be=
 0.
> > >> + */
> > >
> > >From that description, it seems we have:
> > >
> > >struct drm_i915_gem_execbuffer2 {
> > >        __u64 buffers_ptr;              -> must be 0 (new)
> > >        __u32 buffer_count;             -> must be 0 (new)
> > >        __u32 batch_start_offset;       -> must be 0 (new)
> > >        __u32 batch_len;                -> must be 0 (new)
> > >        __u32 DR1;                      -> must be 0 (old)
> > >        __u32 DR4;                      -> must be 0 (old)
> > >        __u32 num_cliprects; (fences)   -> must be 0 since using exten=
sions
> > >        __u64 cliprects_ptr; (fences, extensions) -> contains an actua=
l pointer!
> > >        __u64 flags;                    -> some flags must be 0 (new)
> > >        __u64 rsvd1; (context info)     -> repurposed field (old)
> > >        __u64 rsvd2;                    -> unused
> > >};
> > >
> > >Based on that, why can't we just get drm_i915_gem_execbuffer3 instead
> > >of adding even more complexity to an already abused interface? While
> > >the Vulkan-like extension thing is really nice, I don't think what
> > >we're doing here is extending the ioctl usage, we're completely
> > >changing how the base struct should be interpreted based on how the VM
> > >was created (which is an entirely different ioctl).
> > >
> > >From Rusty Russel's API Design grading, drm_i915_gem_execbuffer2 is
> > >already at -6 without these changes. I think after vm_bind we'll need
> > >to create a -11 entry just to deal with this ioctl.
> > >
> >
> > The only change here is removing the execlist support for VM_BIND
> > mode (other than natual extensions).
> > Adding a new execbuffer3 was considered, but I think we need to be care=
ful
> > with that as that goes beyond the VM_BIND support, including any future
> > requirements (as we don't want an execbuffer4 after VM_BIND).
>
> Why not? it's not like adding extensions here is really that different
> than adding new ioctls.
>
> I definitely think this deserves an execbuffer3 without even
> considering future requirements. Just  to burn down the old
> requirements and pointless fields.
>
> Make execbuffer3 be vm bind only, no relocs, no legacy bits, leave the
> older sw on execbuf2 for ever.

I guess another point in favour of execbuf3 would be that it's less
midlayer. If we share the entry point then there's quite a few vfuncs
needed to cleanly split out the vm_bind paths from the legacy
reloc/softping paths.

If we invert this and do execbuf3, then there's the existing ioctl
vfunc, and then we share code (where it even makes sense, probably
request setup/submit need to be shared, anything else is probably
cleaner to just copypaste) with the usual helper approach.

Also that would guarantee that really none of the old concepts like
i915_active on the vma or vma open counts and all that stuff leaks
into the new vm_bind execbuf.

Finally I also think that copypasting would make backporting easier,
or at least more flexible, since it should make it easier to have the
upstream vm_bind co-exist with all the other things we have. Without
huge amounts of conflicts (or at least much less) that pushing a pile
of vfuncs into the existing code would cause.

So maybe we should do this?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
