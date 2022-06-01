Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4324853A002
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E822010E22A;
	Wed,  1 Jun 2022 09:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5952010E22A;
 Wed,  1 Jun 2022 09:03:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id y19so2363220ejq.6;
 Wed, 01 Jun 2022 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RwXE16fRNY9JBNkXk6bLTiLoBYX4V4QKVYCobAwSTiY=;
 b=JRWG/j8WRnEb3FrZnql/hSj1rrNvaG9M3a2JrqFuBjoyLwmFWRuOHAilOGwnZpMOB/
 Qn5VHeOEeWJ0th0KhsjiyyXqdRSSTm31oOooclbVeZF0y9sIrX2uEfXDGcY/vPRSrKnU
 VRKyitroTRjIE8556p3ojKZI8i/d5Uuwdlv24prlcf/gUhVAKBu45FBAE9KZpcXnokqp
 jSa76U736kDD8bpI4iJuGOrkhe+Cao2sizWf3eBhQvzLdnxWrgamxmJd9K8GWybLHhul
 Vd4rjoDjX0Yg9zaqBqBoQxv3iz60WxNU0RwZqG1lAgPNLiKAHj/t5nvyAWBD0tch25mV
 U76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RwXE16fRNY9JBNkXk6bLTiLoBYX4V4QKVYCobAwSTiY=;
 b=cs4pcDVLvDjWbFchYSPI5DWglFQHPKPRPQczqDzRJ7gOfo9aPEBN2zKbgGu9WIE/+7
 VEqNb99eEo0A2aH8casSu/6x49200REXwhrrGLURNo+caREFztfbCAXBdwFl4+MdTJH0
 XeF/vchiUBb5U1JIqRrbd3qN4tYDFd+58Y8d6tS1mexiRkdXIQFCs0KZZXxVbXmJHBIb
 aoAqhqsbbkWfCNnN9WuKDG1wE8uKR43Xik2fhyku6i7LQBQHQgWFFpdTXeQ4DQBtNwKW
 kWmsqgrwu+kRwWqJLI4gtnkhBugqDIWf0U1nPiIZc7UBj8lrpg5G6vMFi8220DcRHPdT
 ruWg==
X-Gm-Message-State: AOAM533Cl9OR//d60JARot8Ze1Vevp4GG/VFwk/x3NCtUInz+6bWXdCk
 YjwAuTilI5mwFD24EZ74uvCAEr2WrH47QSgMZuI=
X-Google-Smtp-Source: ABdhPJw/SrI2dxHoiRDTovZKAKGMvQJ0a40NEKWmc9JJ7HdioQQ8gzukigNLPpqjX+o7KblPixa+zo4+DL1HGA9hMkg=
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr56231246ejc.66.1654074182706; Wed, 01
 Jun 2022 02:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-4-niranjana.vishwanathapura@intel.com>
 <e4e1989c314d3958d58010431515ea371935d0c3.camel@intel.com>
 <20220523191943.GH4461@nvishwa1-DESK>
In-Reply-To: <20220523191943.GH4461@nvishwa1-DESK>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Jun 2022 19:02:51 +1000
Message-ID: <CAPM=9tzcYL5kwv18cfq5NzE00jwHuwTj_L73NVgE8vdcBgrQww@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v3 3/3] drm/doc/rfc: VM_BIND uapi definition
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 05:20, Niranjana Vishwanathapura
<niranjana.vishwanathapura@intel.com> wrote:
>
> On Thu, May 19, 2022 at 04:07:30PM -0700, Zanoni, Paulo R wrote:
> >On Tue, 2022-05-17 at 11:32 -0700, Niranjana Vishwanathapura wrote:
> >> VM_BIND and related uapi definitions
> >>
> >> v2: Ensure proper kernel-doc formatting with cross references.
> >>     Also add new uapi and documentation as per review comments
> >>     from Daniel.
> >>
> >> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@in=
tel.com>
> >> ---
> >>  Documentation/gpu/rfc/i915_vm_bind.h | 399 ++++++++++++++++++++++++++=
+
> >>  1 file changed, 399 insertions(+)
> >>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
> >>
> >> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/=
rfc/i915_vm_bind.h
> >> new file mode 100644
> >> index 000000000000..589c0a009107
> >> --- /dev/null
> >> +++ b/Documentation/gpu/rfc/i915_vm_bind.h
> >> @@ -0,0 +1,399 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright =C2=A9 2022 Intel Corporation
> >> + */
> >> +
> >> +/**
> >> + * DOC: I915_PARAM_HAS_VM_BIND
> >> + *
> >> + * VM_BIND feature availability.
> >> + * See typedef drm_i915_getparam_t param.
> >> + */
> >> +#define I915_PARAM_HAS_VM_BIND               57
> >> +
> >> +/**
> >> + * DOC: I915_VM_CREATE_FLAGS_USE_VM_BIND
> >> + *
> >> + * Flag to opt-in for VM_BIND mode of binding during VM creation.
> >> + * See struct drm_i915_gem_vm_control flags.
> >> + *
> >> + * A VM in VM_BIND mode will not support the older execbuff mode of b=
inding.
> >> + * In VM_BIND mode, execbuff ioctl will not accept any execlist (ie.,=
 the
> >> + * &drm_i915_gem_execbuffer2.buffer_count must be 0).
> >> + * Also, &drm_i915_gem_execbuffer2.batch_start_offset and
> >> + * &drm_i915_gem_execbuffer2.batch_len must be 0.
> >> + * DRM_I915_GEM_EXECBUFFER_EXT_BATCH_ADDRESSES extension must be prov=
ided
> >> + * to pass in the batch buffer addresses.
> >> + *
> >> + * Additionally, I915_EXEC_NO_RELOC, I915_EXEC_HANDLE_LUT and
> >> + * I915_EXEC_BATCH_FIRST of &drm_i915_gem_execbuffer2.flags must be 0
> >> + * (not used) in VM_BIND mode. I915_EXEC_USE_EXTENSIONS flag must alw=
ays be
> >> + * set (See struct drm_i915_gem_execbuffer_ext_batch_addresses).
> >> + * The buffers_ptr, buffer_count, batch_start_offset and batch_len fi=
elds
> >> + * of struct drm_i915_gem_execbuffer2 are also not used and must be 0=
.
> >> + */
> >
> >From that description, it seems we have:
> >
> >struct drm_i915_gem_execbuffer2 {
> >        __u64 buffers_ptr;              -> must be 0 (new)
> >        __u32 buffer_count;             -> must be 0 (new)
> >        __u32 batch_start_offset;       -> must be 0 (new)
> >        __u32 batch_len;                -> must be 0 (new)
> >        __u32 DR1;                      -> must be 0 (old)
> >        __u32 DR4;                      -> must be 0 (old)
> >        __u32 num_cliprects; (fences)   -> must be 0 since using extensi=
ons
> >        __u64 cliprects_ptr; (fences, extensions) -> contains an actual =
pointer!
> >        __u64 flags;                    -> some flags must be 0 (new)
> >        __u64 rsvd1; (context info)     -> repurposed field (old)
> >        __u64 rsvd2;                    -> unused
> >};
> >
> >Based on that, why can't we just get drm_i915_gem_execbuffer3 instead
> >of adding even more complexity to an already abused interface? While
> >the Vulkan-like extension thing is really nice, I don't think what
> >we're doing here is extending the ioctl usage, we're completely
> >changing how the base struct should be interpreted based on how the VM
> >was created (which is an entirely different ioctl).
> >
> >From Rusty Russel's API Design grading, drm_i915_gem_execbuffer2 is
> >already at -6 without these changes. I think after vm_bind we'll need
> >to create a -11 entry just to deal with this ioctl.
> >
>
> The only change here is removing the execlist support for VM_BIND
> mode (other than natual extensions).
> Adding a new execbuffer3 was considered, but I think we need to be carefu=
l
> with that as that goes beyond the VM_BIND support, including any future
> requirements (as we don't want an execbuffer4 after VM_BIND).

Why not? it's not like adding extensions here is really that different
than adding new ioctls.

I definitely think this deserves an execbuffer3 without even
considering future requirements. Just  to burn down the old
requirements and pointless fields.

Make execbuffer3 be vm bind only, no relocs, no legacy bits, leave the
older sw on execbuf2 for ever.

Dave.
