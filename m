Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A82C3E69
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 11:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7CB6E896;
	Wed, 25 Nov 2020 10:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A038A6E896
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 10:50:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so1427800wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dbid+wntBG+K6X7iyhkUNMneOKYkyXw5MgQKzeb759I=;
 b=lC0uLlGRy2XOpsw0TVgma76WzCM3ZO9W+Xt7mv3UgbEoJLMFH8u2xDLwfZJgZkTl+M
 0ZklcnnTBeoWbEhC2ssDInpoit3B27T2MLh6utu0ciADHkxoLMEYSHr3tKWapdiE8E3N
 /mBKCwyBVjRLnhlYo59O6ktitGTcNr/Z5t11M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbid+wntBG+K6X7iyhkUNMneOKYkyXw5MgQKzeb759I=;
 b=asaZPARmpouDGXM0MYzVyw9D70EZi5nk4VPh3SjKRQybmOiX5XGvPAJCmrQW/LyB0I
 OI+vl/KyfrO1B0OaBbe5/iV/eOOm4iaPPD7uZMJkrt89J/JsbSQdn3KG59bQLfODBfuc
 QaIx7KSnf/tkZkvVO+/ZtLFsa4l6Fmk6J81ZlJ0VEjelV35sMHHJliWo75VkrWh1HBJf
 UhK16X9uqtd8LOP/DCg/AXDnsMyIUCBbYnfiA2Ws8nces814YelLxwt7LMQM+xOnBQWL
 3vR424dl1+zohvz7icbGNxkiR03xbZOFozC1+cYucZDNklVeashgb/pLvhYsPEpgm/pd
 Bckg==
X-Gm-Message-State: AOAM531GwE1JWpkuOtp+2iHNDq+xjgfq8VkcmOIPEBlrnBc/zYR8ODEF
 R2JLYG3woAUIT+YOPE/fiUOHNQ==
X-Google-Smtp-Source: ABdhPJygzAIvTOlpUoBDHn45BEkEBF9FjCc4t6mc0lKvBSO9U0pBJ4Me1FeEcIo9aXbaVoYQPyGpJw==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr3301528wrs.377.1606301444354; 
 Wed, 25 Nov 2020 02:50:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u16sm4014316wrn.55.2020.11.25.02.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 02:50:43 -0800 (PST)
Date: Wed, 25 Nov 2020 11:50:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Message-ID: <20201125105041.GX401619@phenom.ffwll.local>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local>
 <MW3PR11MB45554AAEB1C370A78EB87816E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45554AAEB1C370A78EB87816E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 06:45:06PM +0000, Xiong, Jianxin wrote:
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Tuesday, November 24, 2020 7:17 AM
> > To: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-
> > devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> > <christian.koenig@amd.com>
> > Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
> > 
> > On Mon, Nov 23, 2020 at 02:05:04PM -0400, Jason Gunthorpe wrote:
> > > On Mon, Nov 23, 2020 at 09:53:02AM -0800, Jianxin Xiong wrote:
> > >
> > > > +cdef class DmaBuf:
> > > > +    def __init__(self, size, unit=0):
> > > > +        """
> > > > +        Allocate DmaBuf object from a GPU device. This is done through the
> > > > +        DRI device interface (/dev/dri/card*). Usually this
> > > > +requires the
> > 
> > Please use /dev/dri/renderD* instead. That's the interface meant for unpriviledged rendering access. card* is the legacy interface with
> > backwards compat galore, don't use.
> > 
> > Specifically if you do this on a gpu which also has display (maybe some testing on a local developer machine, no idea ...) then you mess with
> > compositors and stuff.
> > 
> > Also wherever you copied this from, please also educate those teams that using /dev/dri/card* for rendering stuff is a Bad Idea (tm)
> 
> /dev/dri/renderD* is not always available (e.g. for many iGPUs) and doesn't support
> mode setting commands (including dumb_buf). The original intention here is to
> have something to support the new tests added, not for general compute. 

Not having dumb_buf available is a feature. So even more reasons to use
that.

Also note that amdgpu has killed card* access pretty much, it's for
modesetting only.

> > > > +        effective user id being root or being a member of the 'video' group.
> > > > +        :param size: The size (in number of bytes) of the buffer.
> > > > +        :param unit: The unit number of the GPU to allocate the buffer from.
> > > > +        :return: The newly created DmaBuf object on success.
> > > > +        """
> > > > +        self.dmabuf_mrs = weakref.WeakSet()
> > > > +        self.dri_fd = open('/dev/dri/card'+str(unit), O_RDWR)
> > > > +
> > > > +        args = bytearray(32)
> > > > +        pack_into('=iiiiiiq', args, 0, 1, size, 8, 0, 0, 0, 0)
> > > > +        ioctl(self.dri_fd, DRM_IOCTL_MODE_CREATE_DUMB, args)
> > > > +        a, b, c, d, self.handle, e, self.size = unpack('=iiiiiiq',
> > > > + args)
> > 
> > Yeah no, don't allocate render buffers with create_dumb. Every time this comes up I'm wondering whether we should just completely
> > disable dma-buf operations on these. Dumb buffers are explicitly only for software rendering for display purposes when the gpu userspace
> > stack isn't fully running yet, aka boot splash.
> > 
> > And yes I know there's endless amounts of abuse of that stuff floating around, especially on arm-soc/android systems.
> 
> One alternative is to use the GEM_CREATE method which can be done via the renderD*
> device, but the command is vendor specific, so the logic is a little bit more complex. 

Yup. I guess the most minimal thing is to have a per-vendor (you can ask
drm for the driver name to match the right one) callback here to allocate
buffers correctly. Might be less churn than trying to pull in vulkan or
something like that.

It's at least what we're doing in igt for testing drm drivers (although
most of the generic igt tests for display, so dumb_buffer fallback is
available).

DRM_IOCTL_VERSION is the thing you'd need here, struct drm_version.name
has the field for figuring out which driver it is.

Also drivers without render node support won't ever be in the same system
as an rdma card and actually useful (because well they're either very old,
or display-only). So not an issue I think.

> > > > +
> > > > +        args = bytearray(12)
> > > > +        pack_into('=iii', args, 0, self.handle, O_RDWR, 0)
> > > > +        ioctl(self.dri_fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, args)
> > > > +        a, b, self.fd = unpack('=iii', args)
> > > > +
> > > > +        args = bytearray(16)
> > > > +        pack_into('=iiq', args, 0, self.handle, 0, 0)
> > > > +        ioctl(self.dri_fd, DRM_IOCTL_MODE_MAP_DUMB, args);
> > > > +        a, b, self.map_offset = unpack('=iiq', args);
> > >
> > > Wow, OK
> > >
> > > Is it worth using ctypes here instead? Can you at least add a comment
> > > before each pack specifying the 'struct XXX' this is following?
> > >
> > > Does this work with normal Intel GPUs, like in a Laptop? AMD too?
> > >
> > > Christian, I would be very happy to hear from you that this entire
> > > work is good for AMD as well
> > 
> > I think the smallest generic interface for allocating gpu buffers which are more useful than the stuff you get from CREATE_DUMB is gbm.
> > That's used by compositors to get bare metal opengl going on linux. Ofc Android has gralloc for the same purpose, and cros has minigbm
> > (which isn't the same as gbm at all). So not so cool.
> 
> Again, would the "renderD* + GEM_CREATE" combination be an acceptable alternative? 
> That would be much simpler than going with gbm and less dependency in setting up
> the testing evrionment.

Yeah imo makes sense. It's a bunch more code for you to make it work on
i915 and amd, but it's not terrible. And avoids the dependencies, and also
avoids the abuse of card* and dumb buffers. Plus not really more complex,
you just need a table or something to match from the drm driver name to
the driver-specific buffer create function. Everything else stays the
same.

Also this opens up the door to force-test stuff like p2p in the future,
since at least on i915 you'll be able to ensure that a buffer is in vram
only.

Would be good if we also have a trick for amdgpu to make sure the buffer
stays in vram. I think there's some flags you can pass to the amdgpu
buffer create function. So maybe you want 2 testcases here, one allocates
the buffer in system memory, the other in vram for testing p2p
functionality. That kind of stuff isn't possible with dumb buffers.
-Daniel




> > 
> > The other generic option is using vulkan, which works directly on bare metal (without a compositor or anything running), and is cross vendor.
> > So cool, except not used for compute, which is generally the thing you want if you have an rdma card.
> > 
> > Both gbm-egl/opengl and vulkan have extensions to hand you a dma-buf back, properly.
> > 
> > Compute is the worst, because opencl is widely considered a mistake (maybe opencl 3 is better, but nvidia is stuck on 1.2). The actually used
> > stuff is cuda (nvidia-only), rocm (amd-only) and now with intel also playing we have xe (intel-only).
> > 
> > It's pretty glorious :-/
> > 
> > Also I think we discussed this already, but for actual p2p the intel patches aren't in upstream yet. We have some internally, but with very
> > broken locking (in the process of getting fixed up, but it's taking time).
> > 
> > Cheers, Daniel
> > 
> > > Edward should look through this, but I'm glad to see something like
> > > this
> > >
> > > Thanks,
> > > Jason
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
