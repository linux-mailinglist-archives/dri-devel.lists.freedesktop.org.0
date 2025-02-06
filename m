Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E578BA2AF2F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE76010E8F0;
	Thu,  6 Feb 2025 17:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.b="ASJ9K7Rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47B10E8F0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:43:26 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso12199715e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 09:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.com; s=google; t=1738863805; x=1739468605; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zPOsA0SVCb2OgoBNEM8yQP2F+WVhHEBlKzlr8d60SSw=;
 b=ASJ9K7Rf2KuG4K6V/59XyFOnUvpXwhH5+m6znpB+E5ITmaVhUlj1CiMGF+X3rZX8KZ
 bryAzCzH0gfo5QYjT3DNCxBngt+Crb8g3+jIC30XJNNo/VABFhNaQ8rNoBqQZlv+X34k
 r5hy76blNy9GMysb+8pWg5IYemrHSilJZLyqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738863805; x=1739468605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPOsA0SVCb2OgoBNEM8yQP2F+WVhHEBlKzlr8d60SSw=;
 b=gUjhGSKf4OjiT5HytuBFQqkI6vwiB3lwqt6eimo2g/ybJ1sqPdOG19yPHh4JevettQ
 cKDf/nmn7ftxKWvoROliifqb5GQ3Z6p7JIRymtzcpizcMmplsa4Elg8TmVybrlHd55jw
 Q7qiDb+CxU+5pyFLv/DgWUYQMjozxjZEXTsFgpt7A0RjAomSKjUl9Qd+UdfOk0FV4xjf
 Ak175AJB3XGHEqd6TreMTx0k41l/DyQxn7WL8BbAEJQJ6KjNF/bPWXL5wKrRcd+quVwY
 fe8RKsNOcG25o9FxdOmR0VfhAAscNeo/PxEiKyp5GTCBqIFPFpLWjkYjI6Rar+atQ6Ot
 lqnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhg/GOjM9AiQ1opl6VcQigXN3c0nHIGh5AtjSpKt/NyouNvKnEZQmPftjB/J1MzT0Ge70LZ3pXnME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQZOCx0JYndmUzt7OPSNdsenKvOj5wYWTbFr7z8fkg+3DDkjwf
 1/4cpCmDK7ZBhhFL5k5Gk/7BDbilqevbQ9J9IWGe2fyiky1RVO2T4m8N+mi8HUM=
X-Gm-Gg: ASbGncvvowFEwELxt8QmEKEjHkH7dVHKcdK+1akbDZoFepzLSsyOid+67JHkgb802DR
 YikEwu8lkDjYbEqruTG6CeI1o6Fs5yLqvmBWmtAdGeumhMEhi1q/XZwPF5/YJxSXD7UWfWr0pzF
 macK2+eNAiHwCQNXauv3ugEokpwi89b8kblkbEHW7RX/z7vqM5+JkKV2pTg4jHYtdKi9PDZDnoN
 gt/gBd/rP++OKwdwPyoL/cVgftB+69YCp74BbPrBMkCuxArFyfS08GQMIiSrL7xjUQIdrsc7ocz
 svzPx7RLhrxs0/HFlI4m
X-Google-Smtp-Source: AGHT+IFU4jwEb/bO/ShJPxLWINJiEecNyq6hYAc5n2NXQsIEvGTG67KFeNF1dtHNcxIthVTMwoiEdg==
X-Received: by 2002:a7b:cb88:0:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-43924a27b05mr2555695e9.31.1738863800775; 
 Thu, 06 Feb 2025 09:43:20 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd7f039sm2321610f8f.59.2025.02.06.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 09:43:20 -0800 (PST)
Date: Thu, 6 Feb 2025 18:43:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?=
 <marmarek@invisiblethingslab.com>, 
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen memory management primitives for GPU virtualization
Message-ID: <Z6T0t4DMJeY6K18w@macbook.local>
References: <Z5794ysNE4KDkFuT@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z5794ysNE4KDkFuT@itl-email>
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

On Sun, Feb 02, 2025 at 12:08:46AM -0500, Demi Marie Obenour wrote:
> Cc: 
> Bcc: 
> Subject: Xen requirements for GPU virtualization via virtio-GPU
> Reply-To: 
> X-Mutt-Fcc: =INBOX,=xen-devel,=Sent
> X-Mutt-PGP: S
> 
> Recently, AMD submitted patches to the dri-devel mailing list to support
> using application-provided buffers in virtio-GPU.  This feature is
> called Shared Virtual Memory (SVM) and it is implemented via an API
> called User Pointer (userptr).  This lead to some discussion on
> dri-devel@lists.freedesktop.org and dri-devel IRC, from which I
> concluded that Xen is missing critical primitives for GPU-accelerated
> graphics and compute.  The missing primitives for graphics are the ones
> discussed at Xen Project Summit 2024, but it turns out that additional
> primitives are needed for compute workloads.
> 
> As discussed at Xen Project Summit 2024, GPU acceleration via virtio-GPU
> requires that an IOREQ server have access to the following primitives:
> 
> 1. Map: Map a backend-provided buffer into the frontend.  The buffer
>    might point to system memory or to a PCIe BAR.  The frontend is _not_
>    allowed to use these buffers in hypercalls or grant them to other
>    domains.  Accessing the pages using hypercalls directed at the
>    frontend fails as if the frontend did not have the pages.

Do you really need to strictly enforce failure of access when used as
hypercall buffers?

Would it be fine to just get failures when the p2m entries are not
populated?  I assume the point is that accesses to those guest pages
from Xen should never go into the IOREQ?

>    The only
>    exception is that the frontend _may_ be allowed to use the buffer in
>    a Map operation, provided that Revoke (below) is transitive.

The fact that the mapped memory can either be RAM or MMIO makes it a
bit harder to handle any possible reference counting, as MMIO regions
don't have backing page_info structs, and hence no reference counting.
I think that might be hidden by the p2m handling, but needs to be
checked to be correct.

Also when mapping MMIO pages, will those maps respect the domain
d->iomem_caps permission ranges, and then require modifications for
the mappings to succeed, or just ignore d->iomem_caps?

> 
> 2. Revoke: Revoke access to a buffer provided by the backend.  Once
>    access is revoked, no operation on or in the frontend domain can
>    access or modify the pages, and the backend can safely reuse the
>    backing memory for other purposes.

It looks to me that revocation means removing the page from the p2m?

(and additionally adjusting d->iomem_caps if required to revoke domain
permission to map the page)

>    Furthermore, revocation is not
>    allowed to fail unless the backend or hypervisor is buggy, and if it
>    does fail for any reason, the backend will panic.  Once access is
>    revoked, further accesses by the frontend will cause a fault that the
>    backend can intercept.

Such faults would translate into a new IOREQ type, maybe IOREQ_TYPE_FAULT.

I think that just having a rangeset on the ioreq to signal the
accesses that should trigger a IOREQ_TYPE_FAULT instead of an
IOREQ_TYPE_COPY should be enough?

The p2m type could be set as p2m_mmio_dm for those ranges.

> 
> Map can be handled by userspace, but Revoke must be handled entirely
> in-kernel.  This is because Revoke happens from a Linux MMU notifier
> callback, and those are not allowed to block, fail, or involve userspace
> in any way.  Since MMU notifier callbacks are called before freeing
> memory, failure means that some other part of the system still has
> access to freed memory that might be reused for other purposes, which
> is a security vulnerability.

This "revoke" action would just be an hypercall, I think that would
satisfy your requirements?

> 
> It turns out that compute has additional requirements.  Graphics APIs
> use DMA buffers (dmabufs), which only support a subset of operations.
> In particular, direct I/O doesn't work.  Compute APIs allow users to
> make malloc'd memory accessible to the GPU.  This memory can be used
> in Linux kernel direct I/O and in other operations that do not work
> with dmabufs.  However, such memory starts out as frontend-owned pages,
> so it must be converted to backend pages before it can be used by the
> GPU.  Linux supports migration of userspace pages, but this is too
> unreliable to be used for this purpose.  Instead, it will need to be
> done by Xen and the backend.
> 
> This requires two additional primitives:
> 
> 3. Steal: Convert frontend-owned pages to backend-owned pages and
>    provide the backend with a mapping of the page.

What does "owned" exactly mean in this context?

What you describe above sound very much like a foreign map, but I'm
not sure I fully understand the constrains below.

Does this "steal" operation make the pages inaccessible by the domain
running the frontend (so the orignal owner of the memory).

>    After a successful
>    Steal operation, the pages are in the same state as if they had been
>    provided via Map.  Steal fails if the pages are currently being used
>    in a hypercall, are MMIO (as opposed to system memory), were provided
>    by another domain via Map or grant tables, are currently foreign
>    mapped, are currently granted to another domain, or more generally
>    are accessible to any domain other than the target domain.

I think the above means that "stealed" pages must have the
"p2m_ram_rw" type in the frontend domain p2m.   IOW: must be strictly
RAM and owned by the domain running the frontend.

>    The
>    frontend's quota is decreased by the number of pages stolen, and the
>    backend's quota is increased by the same amount.  A successful Steal
>    operation means that Revoke and Map can be used to operate on the
>    pages.

Hm, why do you need this quota adjustment?  Aren't the "stolen" pages
still owned by the domain running the frontend (have
page_info->v.inuse._domain == frontend domain)?

> 
> 4. Return: Convert a backend-owned page to a frontend-owned page.  After
>    a successful call to Return, the backend is no lonter able to use
>    Revoke or Map.  The returned page ceases to count against backend
>    quota and now counts against frontend quota.
> 
> Are these operations ones that Xen is interested in providing?  There
> may be other primitives that are sufficient to implement the above four,
> but I believe that any solution that allows virtio-GPU to work must
> allow the above four operations to be implemented.  Without the first
> two, virtio-GPU will not be able to support Vulkan or native contexts,
> and without the second two also being present, shared virtual memory
> and compute APIs that require it will not work.

I'm sure Xen can arrange for what's required, but the Xen primitives
should be as simple as possible, offloading all possible logic to the
backend.

Thanks, Roger.
