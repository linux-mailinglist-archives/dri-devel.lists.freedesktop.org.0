Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54242C1BB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6BE6E083;
	Wed, 13 Oct 2021 13:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A326E083
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 13:50:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i12so8627256wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hd7jl+fSmwr3eKAP92nMHeBPJwHQZwl1qU6FxKOiBJk=;
 b=IxSq8q4avm0Budo6T7EkwwNZ4bnXCK7lze5ejxXDzv84So+TxO1IfMBem3BmrE6XGt
 OZxtZ21psRBW5obZLG7wV8ku26/+Sy8vOxGcZZS0ulIQkjfsPjzuh6RnJCEljMNiSvAc
 I5Z675kGwRqfhijmTEjWhUFTsI8MhqVlZGtFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hd7jl+fSmwr3eKAP92nMHeBPJwHQZwl1qU6FxKOiBJk=;
 b=sS3lXcZ0a45YOO6EezWu108lq1SHtjekf9YoscaO2Rcqfa3BolcLR7BDPUUuHNY2s9
 W0QcAniqW8/Kin6YY9bP/ow+7l8j9Y2A5IIOoSYbUcMXRReVhFn81nh0TuG9zx0JYDHq
 0DQ7I+92mW4ZAV3q3Sry2+9+P1cT0rPq1atiQ2dLysKTTwEEZevuIB2y2o39nM8ZktPb
 tIMlxDLcNGTwTURHzhL0AeY4eg+Rd/oRVte9PRBQo8lQoG2hVrNJwt3g4y6rJTwTLsu5
 r5KfZyiFcahtam2bTTjapPj4k2I5dtoc3aC/R5IRDR4zCoORphRuOq8oi6blMBUbI3PY
 U7pw==
X-Gm-Message-State: AOAM530O9I5sXMuWow+RFnEXKLVYF5LLg5jccUSEKReN0HhDkj77CZAC
 y+x2xVbs4ie4Av+7k5Ib0O+hxA==
X-Google-Smtp-Source: ABdhPJzWnppBJu8Ki0PJBK+AFTRpB7kInSTxVQmtmlJOtpSGSbg3qnxNs+UDoHDx2d3kO7eM5+tDMQ==
X-Received: by 2002:a05:600c:3b24:: with SMTP id
 m36mr12823690wms.176.1634133025821; 
 Wed, 13 Oct 2021 06:50:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l16sm5709308wmj.33.2021.10.13.06.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 06:50:25 -0700 (PDT)
Date: Wed, 13 Oct 2021 15:50:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 14/14] Doc/gpu/rfc/i915: i915 DG2 uAPI
Message-ID: <YWbkH+l3VEMx6QE1@phenom.ffwll.local>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-15-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011161155.6397-15-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 11, 2021 at 09:41:55PM +0530, Ramalingam C wrote:
> Details of the new features getting added as part of DG2 enabling and their
> implicit impact on the uAPI.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  Documentation/gpu/rfc/i915_dg2.rst | 47 ++++++++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst    |  3 ++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

Please move this and any uapi doc patch this relies on to the front of the
series, so it serves as an intro.

I think the 64k side looks good with the uapi docs, once it's fully
reviewed and acked.

What we still need is proper uapi docs for flat CCS. I think for that a
separate flat ccs DOC: section would be good, which is then references by
the gem_create_ext kerneldoc with a sphinx hyperlink.

The other thing that's missing here are the dg2 flat ccs drm_modifiers. So
we need another patch for that, which in it's kerneldoc then also links to
the flat ccs DOC: section.

Finally that flat ccs doc section needs to discuss all the flat ccs issues
and uapi we've discussed. That patch needs to be acked both by userspace
driver folks, and by compositor folks (because of the modifier uapi
aspect). Please cc Pekka and Simon Ser for the compositor acks (but feel
free to add more people).
-Daniel

> 
> diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
> new file mode 100644
> index 000000000000..a83ca26cd758
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_dg2.rst
> @@ -0,0 +1,47 @@
> +====================
> +I915 DG2 RFC Section
> +====================
> +
> +Upstream plan
> +=============
> +Plan to upstream the DG2 enabling is:
> +
> +* Merge basic HW enabling for DG2(Still without pciid)
> +* Merge the 64k support for lmem
> +* Merge the flat CCS enabling patches
> +* Add the pciid for DG2 and enable the DG2 in CI
> +
> +
> +64K page support for lmem
> +=========================
> +On DG2 hw, local-memory supports minimum GTT page size of 64k only. 4k is not supported anymore.
> +
> +DG2 hw dont support the 64k(lmem) and 4k(smem) pages in the same ppgtt Page table. Refer the
> +struct drm_i915_gem_create_ext for the implication of handling the 64k page size.
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +        :functions: drm_i915_gem_create_ext
> +
> +
> +flat CCS support for lmem
> +=========================
> +Gen 12+ devices support 3D surfaces compression and compression formats. This is
> +accomplished by an additional compression control state (CCS) stored for each surface.
> +
> +Gen 12 devices(TGL and DG1) stores compression state in a separate region of memory.
> +It is managed by userspace and has an associated set of userspace managed page tables
> +used by hardware for address translation.
> +
> +In Gen 12.5 devices(XEXPSDV and DG2) Flat CCS is introduced to replace the userspace
> +managed AUX pagetable with the flat indexed region of device memory for storing the
> +compression state
> +
> +GOP Driver steals a chunk of memory for the CCS surface corresponding to the entire
> +range of local memory. The memory required for the CCS of the entire local memory is
> +1/256 of the main local memory. The Gop driver will also program a secure register
> +(XEHPSDV_FLAT_CCS_BASE_ADDR 0x4910) with this address value.
> +
> +So the Total local memory available for driver allocation is Total lmem size - CCS data size
> +
> +Flat CCS data needs to be cleared when a lmem object is allocated. And CCS data can
> +be copied in and out of CCS region through XY_CTRL_SURF_COPY_BLT.
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index 91e93a705230..afb320ed4028 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -20,6 +20,9 @@ host such documentation:
>  
>      i915_gem_lmem.rst
>  
> +.. toctree::
> +    i915_dg2.rst
> +
>  .. toctree::
>  
>      i915_scheduler.rst
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
