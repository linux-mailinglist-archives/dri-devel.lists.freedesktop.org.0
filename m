Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718FDC967D9
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163FB10E367;
	Mon,  1 Dec 2025 09:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DgaehzF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB710E365
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 09:55:03 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477771366cbso24362415e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 01:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764582902; x=1765187702;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=72s8cxP8m32nLOQlBnrTppnRNNSnWx6bZ8vmeua9AuM=;
 b=DgaehzF0NZWlB5rV+2Zs/z4QLmoK+HwRQ2n2zgGo7b36o3hdCi0CLJ8WxxXqvQsfeQ
 P/gP5GwEXfrzljGtLL8jsocM5FdZ5EQbPyGVjWJrx97C3HRG4xl5FMwmc9DWnDYeRqST
 wAeCqXUxmOBxp8us4KizBI3UtXQygGdDV/79ilJ8C/ig8f1G5Fm1IixSZCcxMzshbej0
 FPPElt5uQIVE8K3hALNamir9/JKOf/7feP2Sh9E+T9zNy7wYYrw34KBgo8NtBu5QVldu
 eTM5QXYrDSoOBSMJeFq4tQkr1pOyECUNdZ/oLfgSQ1g09arFK+/iHSc8Sm5xtBAvqucW
 1OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764582902; x=1765187702;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=72s8cxP8m32nLOQlBnrTppnRNNSnWx6bZ8vmeua9AuM=;
 b=NWCPp5yz3M351tNkv9v1tYKTpD70A+wfOIBlc4XcOjEdIGh72MnZfFgQFyy3IpOlO6
 /XGBr7Nv7oJ17Qw36D8l9wWIsOQcD69cQnIXnYiXlI4weZyl5i/snUDNUKIdmza5uKc2
 D8V45G75ev5gVieq+LwcfBMfF7XkihlBEd8tvhU8R59KuLyUn5uaIZj2QjJraXUP89pK
 H3PdTCpMQDemHHGSYgcMImjMroOxfRcjGnecYi8IZ5dVnNoOWDafO9V1eKN5cS5jL7wL
 JmF2I13j3jtbRLzBCNSxRvcdu5k4tLPnqY/iSbII7AYHKLGhpTC0proz2jrXfpuWyAjo
 Wnfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF1SjYh0dnp8rJoXZikkmgDgpjW9NU4FQanPm6+Rc1o4wAfx4mbpc6IpzWdihwOD9otuxRLxoE0rY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvE1tTnbPWaA7YvY6QPZ/7BySdVaqah/tUive6zkTPJpXsGeJJ
 s5kn/OQcTBcDNELkKops4MoPAeMTGDkgToqBkDucK6Mn3PG0FUGKwYCy/EVQslW1qDdahmwxN/0
 pcRywIhcqQupiDLQvuQ==
X-Google-Smtp-Source: AGHT+IHR/gzeFh7+KeD1MsGLOFVqoY8R7VwUnjkirrmR28Kdsu+0Qy8DFoIl1J3N86VCTwEGoZO2EDfdb0ODTEY=
X-Received: from wmba22.prod.google.com ([2002:a05:600c:6dd6:b0:477:7ad9:2aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4c:b0:475:da1a:53f9 with SMTP id
 5b1f17b1804b1-477c0184b1emr414720285e9.14.1764582901820; 
 Mon, 01 Dec 2025 01:55:01 -0800 (PST)
Date: Mon, 1 Dec 2025 09:55:00 +0000
In-Reply-To: <20251128152403.72aedafa@fedora>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
 <20251128152403.72aedafa@fedora>
Message-ID: <aS1l9Mm9smUzAJ3A@google.com>
Subject: Re: [PATCH 1/4] drm/gpuvm: take GEM lock inside
 drm_gpuvm_bo_obtain_prealloc()
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="utf-8"
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

On Fri, Nov 28, 2025 at 03:24:03PM +0100, Boris Brezillon wrote:
> On Fri, 28 Nov 2025 14:14:15 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > When calling drm_gpuvm_bo_obtain_prealloc() and using immediate mode,
> > this may result in a call to ops->vm_bo_free(vm_bo) while holding the
> > GEMs gpuva mutex. This is a problem if ops->vm_bo_free(vm_bo) performs
> > any operations that are not safe in the fence signalling critical path,
> > and it turns out that Panthor (the only current user of the method)
> > calls drm_gem_shmem_unpin() which takes a resv lock internally.
> > 
> > This constitutes both a violation of signalling safety and lock
> > inversion. To fix this, we modify the method to internally take the GEMs
> > gpuva mutex so that the mutex can be unlocked before freeing the
> > preallocated vm_bo.
> > 
> > Note that this modification introduces a requirement that the driver
> > uses immediate mode to call drm_gpuvm_bo_obtain_prealloc() as it would
> > otherwise take the wrong lock.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Should we add a Fixes tag?

Yeah, let's add:

Fixes: 63e919a31625 ("panthor: use drm_gpuva_unlink_defer()")

Alice
