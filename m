Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695EBF0D7D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FE910E41D;
	Mon, 20 Oct 2025 11:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xVUDeRRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF7A10E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:31:47 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47106720618so24899265e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 04:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760959906; x=1761564706;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DMcqFZ5cAqBQM1biUtf3Krfxn1U/zGBC3gm6VwatmXg=;
 b=xVUDeRRc26liKAPzgc2YVlE04osNEQ/pYqQ/fOQs+IvXHESocYx9zQEQn2TfGWBl9R
 MQYPhztDOC08G4N43UuY7xfsjWeNYyyLNaX+cAjWnU1ejNTfYsDHHtyGPXlKBY8LndpR
 9SN72RpuKizgKMQ4Olf/97uCySukbUALW+yTlCsQwc5hPLef5RR9/vNZiQjXiJa1iSz4
 4YIHz1Hm/t6baPi5KGht36E0XvGptm3Ky5I8EXKn+JQ8Ki2a1u5vAuZTX4xRGAe3woMA
 ZNOSvzNpMUwBnPm4dH//miaV4aT+Xx5c64MMp5jfPN+a1F//TS4xY3KzQWScY9CRvelx
 KoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760959906; x=1761564706;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DMcqFZ5cAqBQM1biUtf3Krfxn1U/zGBC3gm6VwatmXg=;
 b=CH9e7RMI8DD068jMuPj7i4z7m+19czZ2PvBjTm4VdRytBQthPdFrxtpiVGBn42Fl3X
 LoxKq9K0o+rL7KOyVOl57D8yips7uiGPxj4H5yAzN5LOFcDX6ThVQ9ozWf/yCuyej0Y6
 9ziN5JCMDy9pJ4MROmpNL0S4FQirsDmFu8F8+7xoWYovRvloizdKibuiPGnBZaeB2iFc
 VnIShzoML63G4m7vmHwczzozRnj4dhT6WldFwZAzGiHBa5HVLA5zM+LCpw7YN8O00dSr
 PY/OwoXnqmKotNbW+2rdVBVPrprNNBNqNKWdQuEVMwXN2rPqQtZ9fwTPWM5ui51QjA2u
 FSWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUuoCaVuJjYOtah2m/oi0sR7M+DWDWMpDZkjAIOJm1pOib/Vogxwc8zV38Q7m3vg22aW8FaXvRtWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7G3PjNdI2H62gR7njvuPOo6WljvwvFy4in8/98nwPeiUzr+1N
 il6+bRtxVKKJe/GkDCyHgXIahmIYZx70x5Y9HZdJzDXQoLnBzUFYXtXFwh9fFU4KWRCNV/G0Xd0
 pn0dRHxHrRZu/LjqfCQ==
X-Google-Smtp-Source: AGHT+IH2Qofc6ndiBT2TBEJUwAKSdi714gdnYYSKwoeWjdLZfKMzLOYYEgFO9KCms/5i7YzVpY9EuZiKpgOsDG8=
X-Received: from wmbjx13.prod.google.com
 ([2002:a05:600c:578d:b0:46e:5611:ee71])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:46f:b327:ecfb with SMTP id
 5b1f17b1804b1-4711787bfe8mr99039325e9.9.1760959906081; 
 Mon, 20 Oct 2025 04:31:46 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:31:45 +0000
In-Reply-To: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Mime-Version: 1.0
References: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Message-ID: <aPYdoU-Fey8hBqJ_@google.com>
Subject: Re: [PATCH v4 0/2] Defer vm_bo cleanup in GPUVM with
 DRM_GPUVM_IMMEDIATE_MODE
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Oct 06, 2025 at 12:05:54PM +0000, Alice Ryhl wrote:
> There are two main ways that GPUVM might be used:
> 
> * staged mode, where VM_BIND ioctls update the GPUVM immediately so that
>   the GPUVM reflects the state of the VM *including* staged changes that
>   are not yet applied to the GPU's virtual address space.
> * immediate mode, where the GPUVM state is updated during run_job(),
>   i.e., in the DMA fence signalling critical path, to ensure that the
>   GPUVM and the GPU's virtual address space has the same state at all
>   times.
> 
> Currently, only Panthor uses GPUVM in immediate mode, but the Rust
> drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
> worth to support both staged and immediate mode well in GPUVM. To use
> immediate mode, we must manage the vm_bos and vas during the fence
> signalling critical path.
> 
> The first part of that work was the introduction of a fence signalling
> safe mutex for the GEMs GPUVA list in commit e7fa80e2932c ("drm_gem: add
> mutex to drm_gem_object.gpuva").
> 
> This is series the second part of that work: Dropping a vm_bo object in
> the fence signalling critical path is problematic for two reasons:
> 
> * When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
>   the extobj/evicted lists during the fence signalling path.
> * Dropping a vm_bo could lead to the GEM object getting destroyed.
>   The requirement that GEM object cleanup is fence signalling safe is
>   dubious and likely to be violated in practice.
> 
> Panthor already has its own custom implementation of postponing vm_bo
> cleanup. Take inspiration from that by moving the logic into GPUVM, and
> adjust Panthor to use the new GPUVM logic.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Pushed to drm-rust-next.

I added this to drm-rust instead of drm-misc as a prerequisite for
another patch. If merge conflicts show up, we can do a backmerge.
