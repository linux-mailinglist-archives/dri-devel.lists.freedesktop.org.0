Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC0B4FD7B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A69610E250;
	Tue,  9 Sep 2025 13:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Eqms/uCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA73310E250
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:39:41 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b0419841db9so382965066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757425180; x=1758029980;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=S/cWSKApgCqU8gCN90/R56WkIagNeujRN6OKwQyz0bk=;
 b=Eqms/uCr/kiJEAFWYnKDrdxBTkCdhsEYfnJdHs0uIY60usQ0ScBSybZQ8SBAOkak75
 RXLEDFYvSmw5hJyzoQ+9i5OvFbA5Cejs9PjEECFB0T21J0qQup8K9MHNOxjAN89xjInO
 S+KiMaVw3Nd35oJGVlBSt8YGWT3L897HZYm2h00XSXtlmkmzfHS7t4jj+uhNRsjk/JJr
 uCgaLsXdodlw2LUUeOfZp6L0HDualldba8vGHrGvoqf1U2npOlTGlps8wf+SqvrybIgz
 lRvhe2LNE2sdTeLkaFEnemdaP904LIV5FO+abWBLRX10U9m0Urr4jFYE3ZqGGr1bx3JW
 zKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425180; x=1758029980;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/cWSKApgCqU8gCN90/R56WkIagNeujRN6OKwQyz0bk=;
 b=asGZgf+y668/R0A4lLrOBXyKeOyyePfo9zyrU8SM5pyKOeyAituJpw6xUCgAhA4daM
 FcohBzfLSWk9C7haSZj1hFjQXRIQQkus3qLNsdsk08Vyof9NO1ntufQI1LjzYXb3dEGo
 jroqDYwSs5h0eqIQybDKLnqFXGg7vKbep91pg7eevR/f1eIj/29S5yiTsFDZiqyqbeGr
 fOoS+ZfiTkPDGf37hTshlyZNpO6/CzzkFx2LtyvK9zikG0hqzhDCKk79XBqkuiKB1mPA
 w5Ud+sc91fJuJXM/f6LIMX1kFT0aVsms1JKpuevaLKzudRUWSDoJYcybo5ERc/6/V7LO
 ftpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrivDbx4KsOuITvjRc2TPqsQIXihTZLono/paH22R7FMPdX30bCCi3wTTBfPo+i9AaJP0k1gK1M98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyesjfYmI5DkzLQD77yeynEurvYWruwf30ZsPqMJqm4SJWJO9hU
 5GqZajzQBG+S6V1hmSxhXIFwIx85WgT5d9x6EM4W/bHqpkbuHFHiyZ7qHa/1WuZSk3cU8MM8EF4
 kUhpiOo1ZNbqjTN6ZEw==
X-Google-Smtp-Source: AGHT+IFklFVheyARxR3qqSDXvhkKe8XA6XwiuCSVTGag3JTwA8+KX1InqMPhxPHUjqN8oInLSi0RtsKFDfniBqE=
X-Received: from ejcre10.prod.google.com ([2002:a17:907:a2ca:b0:b04:4fb2:458b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d8d:b0:b04:33a1:7f11 with SMTP id
 a640c23a62f3a-b04b1459913mr1134074866b.26.1757425179999; 
 Tue, 09 Sep 2025 06:39:39 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:39:39 +0000
In-Reply-To: <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
Message-ID: <aMAuGy6Rc55mkqCW@google.com>
Subject: Re: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Tue, Sep 09, 2025 at 01:36:22PM +0000, Alice Ryhl wrote:
> When using GPUVM in immediate mode, it is necessary to call
> drm_gpuvm_unlink() from the fence signalling critical path. However,
> unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> 
> 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
>    can't do from the fence signalling critical path.
> 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
>    to be unsafe to call from the fence signalling critical path.
> 
> To solve these issues, add a deferred version of drm_gpuvm_unlink() that
> adds the vm_bo to a deferred cleanup list, and then clean it up later.
> 
> The new methods take the GEMs GPUVA lock internally rather than letting
> the caller do it because it also needs to perform an operation after
> releasing the mutex again. This is to prevent freeing the GEM while
> holding the mutex (more info as comments in the patch). This means that
> the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I'm not sure if we came to a conclusion on the gpuva defer stuff on v1,
but I found a less confusing way to implement the locking. Please check
it out.

Alice
