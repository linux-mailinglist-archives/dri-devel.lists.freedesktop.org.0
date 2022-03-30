Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADD4EC4F3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8E10E387;
	Wed, 30 Mar 2022 12:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2CE10E387
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 12:51:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h23so29132312wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AWZVUSA0BYyJxtCr3MVmw8Z1MMpShw9NO2XI1bvTyCg=;
 b=lfTPMtqkkXIYWOWWWMBzXYz6wj6WklNEogcqIhnjXiPrE1wAek3JxIDZThCjPv2OCs
 BadS5GROS1tlbOcc3jRV5mSXMXAoccB7HiFU+mUxECSw/HfVTGklZg/wxcrJkc9djJp5
 33mRp6hpEGNtFjKTZqbmnug1qwj6WNlhp4Z/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AWZVUSA0BYyJxtCr3MVmw8Z1MMpShw9NO2XI1bvTyCg=;
 b=zVk2dC8hErz6ltESeEDepGAetqz6WxMdMVEtUZSvMHKYXMkZ1t1maJYLwo3jjz7g1z
 4YpH+IYppzEKatC604mE+MApG5iihpS+Cmj38MZUFGnB61QDCIX0qNDa8UYx1leG8Q9i
 DNL+jnzQ+tdoWbfIL5+E6a6wbJXKuCQwmyaHkWRpR+QzxbjlvQdYVmKLOHXBFOVn1aWT
 fzpAUElrrN/abzJ51zeb9fDJrN8Z0Alae4mGpvkFUcofO8OOEmr1O8kJ7RcW3xV4wSw/
 LKrP7+4DZVaNoIej35mQU5CLdAznqc68uGeHPWVkgYCHKcvI+PwpcP6+FpJCTH4UYsq/
 ot/A==
X-Gm-Message-State: AOAM531nHZ/37dFtY4knpUJJ/qBthlhfSqrft8cJ4ypaKkxuYNy46Z7i
 69wsNUdR9glRp+LHH37l/bpWVA==
X-Google-Smtp-Source: ABdhPJzBRHROi0CI1USbmU6Nf64UXoFgWWncVTCB3IBPyBwQHnM6YxMQld5WEftcnb+ni4o1chmpwg==
X-Received: by 2002:a5d:4ad2:0:b0:203:d56d:9c82 with SMTP id
 y18-20020a5d4ad2000000b00203d56d9c82mr36188876wrs.307.1648644704020; 
 Wed, 30 Mar 2022 05:51:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm17276376wrv.10.2022.03.30.05.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 05:51:43 -0700 (PDT)
Date: Wed, 30 Mar 2022 14:51:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-gfx] [RFC v2 2/2] drm/doc/rfc: VM_BIND uapi definition
Message-ID: <YkRSXcnAmUGqpNmD@phenom.ffwll.local>
References: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
 <20220307203146.648-3-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220307203146.648-3-niranjana.vishwanathapura@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@intel.com, chris.p.wilson@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 12:31:46PM -0800, Niranjana Vishwanathapura wrote:
> VM_BIND und related uapi definitions
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  Documentation/gpu/rfc/i915_vm_bind.h | 176 +++++++++++++++++++++++++++

Maybe as the top level comment: The point of documenting uapi isn't to
just spell out all the fields, but to define _how_ and _why_ things work.
This part is completely missing from these docs here.

>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
> 
> diff --git a/Documentation/gpu/rfc/i915_vm_bind.h b/Documentation/gpu/rfc/i915_vm_bind.h
> new file mode 100644
> index 000000000000..80f00ee6c8a1
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_vm_bind.h

You need to incldue this somewhere so it's rendered, see the previous
examples.

> @@ -0,0 +1,176 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +/* VM_BIND feature availability through drm_i915_getparam */
> +#define I915_PARAM_HAS_VM_BIND		57

Needs to be kernel-docified, which means we need a prep patch that fixes
up the existing mess.

> +
> +/* VM_BIND related ioctls */
> +#define DRM_I915_GEM_VM_BIND		0x3d
> +#define DRM_I915_GEM_VM_UNBIND		0x3e
> +#define DRM_I915_GEM_WAIT_USER_FENCE	0x3f
> +
> +#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_VM_UNBIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_bind)
> +#define DRM_IOCTL_I915_GEM_WAIT_USER_FENCE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_WAIT_USER_FENCE, struct drm_i915_gem_wait_user_fence)
> +
> +/**
> + * struct drm_i915_gem_vm_bind - VA to object/buffer mapping to [un]bind.

Both binding and unbinding need to specify in excruciating detail what
happens if there's overlaps (existing mappings, or unmapping a range which
has no mapping, or only partially full of maps or different objects) and
fun stuff like that.

> + */
> +struct drm_i915_gem_vm_bind {
> +	/** vm to [un]bind */
> +	__u32 vm_id;
> +
> +	/**
> +	 * BO handle or file descriptor.
> +	 * 'fd' value of -1 is reserved for system pages (SVM)
> +	 */
> +	union {
> +		__u32 handle; /* For unbind, it is reserved and must be 0 */

I think it'd be a lot cleaner if we do a bind and an unbind struct for
these, instead of mixing it up.

Also I thought mesa requested to be able to unmap an object from a vm
without a range. Has that been dropped, and confirmed to not be needed.

> +		__s32 fd;

If we don't need it right away then don't add it yet. If it's planned to
be used then it needs to be documented, but I kinda have no idea why you'd
need an fd for svm?

> +	}
> +
> +	/** VA start to [un]bind */
> +	__u64 start;
> +
> +	/** Offset in object to [un]bind */
> +	__u64 offset;
> +
> +	/** VA length to [un]bind */
> +	__u64 length;
> +
> +	/** Flags */
> +	__u64 flags;
> +	/** Bind the mapping immediately instead of during next submission */

This aint kerneldoc.

Also this needs to specify in much more detail what exactly this means,
and also how it interacts with execbuf.

So the patch here probably needs to include the missing pieces on the
execbuf side of things. Like how does execbuf work when it's used with a
vm_bind managed vm? That means:
- document the pieces that are there
- then add a patch to document how that all changes with vm_bind

And do that for everything execbuf can do.

> +#define I915_GEM_VM_BIND_IMMEDIATE   (1 << 0)
> +	/** Read-only mapping */
> +#define I915_GEM_VM_BIND_READONLY    (1 << 1)
> +	/** Capture this mapping in the dump upon GPU error */
> +#define I915_GEM_VM_BIND_CAPTURE     (1 << 2)
> +
> +	/** Zero-terminated chain of extensions */
> +	__u64 extensions;
> +};
> +
> +/**
> + * struct drm_i915_vm_bind_ext_user_fence - Bind completion signaling extension.
> + */
> +struct drm_i915_vm_bind_ext_user_fence {
> +#define I915_VM_BIND_EXT_USER_FENCE	0
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +
> +	/** User/Memory fence qword alinged process virtual address */
> +	__u64 addr;
> +
> +	/** User/Memory fence value to be written after bind completion */
> +	__u64 val;
> +
> +	/** Reserved for future extensions */
> +	__u64 rsvd;
> +};
> +
> +/**
> + * struct drm_i915_gem_execbuffer_ext_user_fence - First level batch completion
> + * signaling extension.
> + *
> + * This extension allows user to attach a user fence (<addr, value> pair) to an
> + * execbuf to be signaled by the command streamer after the completion of 1st
> + * level batch, by writing the <value> at specified <addr> and triggering an
> + * interrupt.
> + * User can either poll for this user fence to signal or can also wait on it
> + * with i915_gem_wait_user_fence ioctl.
> + * This is very much usefaul for long running contexts where waiting on dma-fence
> + * by user (like i915_gem_wait ioctl) is not supported.
> + */
> +struct drm_i915_gem_execbuffer_ext_user_fence {
> +#define DRM_I915_GEM_EXECBUFFER_EXT_USER_FENCE		0
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +
> +	/**
> +	 * User/Memory fence qword aligned GPU virtual address.
> +	 * Address has to be a valid GPU virtual address at the time of
> +	 * 1st level batch completion.
> +	 */
> +	__u64 addr;
> +
> +	/**
> +	 * User/Memory fence Value to be written to above address
> +	 * after 1st level batch completes.
> +	 */
> +	__u64 value;
> +
> +	/** Reserved for future extensions */
> +	__u64 rsvd;
> +};
> +
> +struct drm_i915_gem_vm_control {
> +/** Flag to opt-in for VM_BIND mode of binding during VM creation */

This is very confusingly docunmented and I have no idea how you're going
to use an empty extension. Also it's not kerneldoc.

Please check that the stuff you're creating renders properly in the html
output.

> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1 << 0)
> +};
> +
> +
> +struct drm_i915_gem_create_ext {
> +/** Extension to make the object private to a specified VM */
> +#define I915_GEM_CREATE_EXT_VM_PRIVATE		2

Why 2?

Also this all needs to be documented what it precisely means.

> +};
> +
> +
> +struct prelim_drm_i915_gem_context_create_ext {
> +/** Flag to declare context as long running */
> +#define I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING   (1u << 2)

The compute mode context, again including full impact on execbuf, is not
documented here. This also means any gaps in the context uapi
documentation need to be filled first in prep patches.

Also memory fences are extremely tricky, we need to specify in detail when
they're allowed to be used and when not. This needs to reference the
relevant sections from the dma-fence docs.

> +};
> +
> +/**
> + * struct drm_i915_gem_wait_user_fence
> + *
> + * Wait on user/memory fence. User/Memory fence can be woken up either by,
> + *    1. GPU context indicated by 'ctx_id', or,
> + *    2. Kerrnel driver async worker upon I915_UFENCE_WAIT_SOFT.
> + *       'ctx_id' is ignored when this flag is set.
> + *
> + * Wakeup when below condition is true.
> + * (*addr & MASK) OP (VALUE & MASK)
> + *
> + */
> +~struct drm_i915_gem_wait_user_fence {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	__u64 extensions;
> +
> +	/** User/Memory fence address */
> +	__u64 addr;
> +
> +	/** Id of the Context which will signal the fence. */
> +	__u32 ctx_id;
> +
> +	/** Wakeup condition operator */
> +	__u16 op;
> +#define I915_UFENCE_WAIT_EQ      0
> +#define I915_UFENCE_WAIT_NEQ     1
> +#define I915_UFENCE_WAIT_GT      2
> +#define I915_UFENCE_WAIT_GTE     3
> +#define I915_UFENCE_WAIT_LT      4
> +#define I915_UFENCE_WAIT_LTE     5
> +#define I915_UFENCE_WAIT_BEFORE  6
> +#define I915_UFENCE_WAIT_AFTER   7
> +
> +	/** Flags */
> +	__u16 flags;
> +#define I915_UFENCE_WAIT_SOFT    0x1
> +#define I915_UFENCE_WAIT_ABSTIME 0x2
> +
> +	/** Wakeup value */
> +	__u64 value;
> +
> +	/** Wakeup mask */
> +	__u64 mask;
> +#define I915_UFENCE_WAIT_U8     0xffu
> +#define I915_UFENCE_WAIT_U16    0xffffu
> +#define I915_UFENCE_WAIT_U32    0xfffffffful
> +#define I915_UFENCE_WAIT_U64    0xffffffffffffffffull

Do we really need all these flags, and does the hw really support all the
combinations? Anything the hw doesn't support in MI_SEMAPHORE is pretty
much useless as a umf (userspace memory fence) mode.

> +
> +	/** Timeout */

Needs to specificy the clock source.
-Daniel

> +	__s64 timeout;
> +};
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
