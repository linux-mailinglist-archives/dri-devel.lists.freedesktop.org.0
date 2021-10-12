Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C73429D11
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 07:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919989F08;
	Tue, 12 Oct 2021 05:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E8E89F08;
 Tue, 12 Oct 2021 05:23:28 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j5so82861844lfg.8;
 Mon, 11 Oct 2021 22:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=12BNlbCQgd+waveWEis1i977xILPo4T6UTRLGRk5nQc=;
 b=SVirUMtzvIevieCz+PIbarz6CpfQKiu6wvuoCdwVu4FygCvzvWwAwH8HpSbGoJNRsp
 2362NdRYNni2XIhJUlJdq912ImtrofNmSzI58NfsKYBxZaWYSlxjb3XWkfXNy+az3tes
 LJOxH4cM06Df+7LLiMhZSCYoj7sNRngGksiYzH7mFobXhfBKKcjeeAGPW6+UysaV3bij
 iWgIBcuScPDDM3UdMarE+YIHKIpmbptL20fw+8atXSDw1YkFXXkYbr3wz5EtknhkE4UA
 PewAKc6GKJGXPqJAOqqoy3TEe/Ky2Lp+6Jri8IijAUjYcz0Ag1B+/2AHSwHkRd0idH4U
 1fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=12BNlbCQgd+waveWEis1i977xILPo4T6UTRLGRk5nQc=;
 b=TrmYWfE607d7a/uJGpJblBgyYW84f5peWd8GBOZx9N0HP9KnvBvAgfDBIW5zlJh6er
 JHmwH5y+9D8XphFvFkMR8p3gg/TRvC+nfWe8urPlP9YgpmjJfgjiGUooehsvjFxumOwa
 zSM3x8zt0u5EFvgNZcjuQAjUBJvb2Mq8uELkhXYyw9FyL+Z9MvVTe52k6KpDZ9Qa+wzM
 qv+m6NeeNgvAZxDYaAATO+P2a4fApBfjyWEvp3l7DbekXxLmHvmHY/CEAU4aFebfQxDz
 l8M6qNRz0IIrFEGNN3NE7pC44gOVnegn0amcUV+VNcI1KOt3pPsEqgE0WSGXq1i3r+j1
 K3Zg==
X-Gm-Message-State: AOAM532jvIdFMKWoVq2QN7vZJkaDIxTgMXVpVeLeMK/zlGQVTMPwfo9m
 zNsQhFgf8yttpSVaPFeBZBkCg7c0+cNe8OivHpzurFzU
X-Google-Smtp-Source: ABdhPJx6e3tLq9pQQ9HeruBuNvSBr1oDsBc30h4zwEIg+aaklhKpcioPvoJderU155t61xL26fOPs2Lu11pSsU/9Mxk=
X-Received: by 2002:a05:651c:1596:: with SMTP id
 h22mr26926505ljq.405.1634016206901; 
 Mon, 11 Oct 2021 22:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-15-ramalingam.c@intel.com>
In-Reply-To: <20211011161155.6397-15-ramalingam.c@intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Mon, 11 Oct 2021 22:23:15 -0700
Message-ID: <CAKi4VAJg2C1p6ceXqLUFtwCRoSp2c+c4D-RyxDy4QB8130s9nQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] Doc/gpu/rfc/i915: i915 DG2 uAPI
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthew Auld <matthew.auld@intel.com>, CQ Tang <cq.tang@intel.com>, 
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 11, 2021 at 9:10 AM Ramalingam C <ramalingam.c@intel.com> wrote:
>
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

here and everywhere below, missing space before (

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

s/hw dont/doesn't/

> +struct drm_i915_gem_create_ext for the implication of handling the 64k page size.
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +        :functions: drm_i915_gem_create_ext
> +
> +
> +flat CCS support for lmem

Flat

> +=========================
> +Gen 12+ devices support 3D surfaces compression and compression formats. This is
> +accomplished by an additional compression control state (CCS) stored for each surface.
> +
> +Gen 12 devices(TGL and DG1) stores compression state in a separate region of memory.

s/stores/store/

> +It is managed by userspace and has an associated set of userspace managed page tables
> +used by hardware for address translation.
> +
> +In Gen 12.5 devices(XEXPSDV and DG2) Flat CCS is introduced to replace the userspace

There is no such thing as Gen 12.5. The "Gen" nomenclature stopped on Gen 12.

Lucas De Marchi

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
