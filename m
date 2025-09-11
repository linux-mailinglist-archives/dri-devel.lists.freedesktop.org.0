Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45679B5325B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3872D10EB00;
	Thu, 11 Sep 2025 12:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YYQCU349";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8E410EB00
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:34:28 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45b467f5173so4594595e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757594067; x=1758198867;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pKAhhQ7EQT3ITqPJPLmtcPIPJOPizGgbnSGyXoCBRDE=;
 b=YYQCU349Ss2Jzr6ohS9k4/m1bqSwog06q8V1qsXFyYJIgyptqk0AIOAnye1nMeRjF6
 tvnr05h1YMRJBbqZvzbEOXTpv7s9N1SN7y+Iumi/bgFd+oB1GEJCYT3ivmbpm7STh84K
 +z3Kvm7W/HNazW5pRpUhjnKseOspIzEZvFS1kOKHs6n99ZByhIES+U/zum0Ov6LJwM/T
 TFRQq2G9a5FE+0nfW6fwyYMNznSp2SnDScnEW+upmb2J414VynWjGleDZC3Uk1N4LKXg
 SnswXZMPqQ1RQlCfMDeEDLRNlN8x9wawwZCdTYeOyNSwFdERvFwcHGword1hlHG7RbB9
 vNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757594067; x=1758198867;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKAhhQ7EQT3ITqPJPLmtcPIPJOPizGgbnSGyXoCBRDE=;
 b=qw3D7LvsPBBloLiQVDJh15ORq5PNRHHSnPmpRFcSgcmWqD3G26iklZJ8AIYU4T9vk2
 oXbt7z3FLPczRJQNqHoDja1znFc3JukHg6Gfllin/G8hiNxtQFasBphL7TSfLW4V8iny
 K8E1CMW52KQHNjUZ9V1OWIbc6u1VcjNHiB+e4Qn011iZ3FF0BOK4mX5D/c2r1t3li+dm
 XNlnDhvXFdqPypBJPK7Z5WIKouCEIoS1gyfiQWljd9fqoJQmc6VaHDKYC+sA0JR2Z33A
 yXGPJyQmHleZu6qMDw0IKB+uDwDhxwLwY56zLRpRNpGhXAGUgbNou7gNL3dnIxLMT0pW
 Zxmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBcescT8ru4Yxwn22QkhAYEWV+wXuGIDU2Va3j06hkNNnsMrTuZKHuiUi9ifGDpJnlGcYeLe+Uht0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaiPRQIQGVs9HIb9YtkayD+d5eLi2YoTppx3+ZHeYVbw3VqBsF
 EkVKp9I06AjUjQBpQMniLkFLfsyCXiXMk9KIZHvKE99NSA8fuVIaWArtXOXHFS21wv1Rz7R/4I0
 9A13BXM9AHWjtU7Oevg==
X-Google-Smtp-Source: AGHT+IGl8w80l5VRfy9+dUQff20OHdHaZJ3RYQuhQiruTdXc/3L59+Ug0OGhP0Boqr2Ywaymx5xbgF0/dbgrrNw=
X-Received: from wmbdo21.prod.google.com
 ([2002:a05:600c:6815:b0:45d:d059:f534])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4c:b0:45b:7bee:db8f with SMTP id
 5b1f17b1804b1-45de727c608mr133801165e9.25.1757594066620; 
 Thu, 11 Sep 2025 05:34:26 -0700 (PDT)
Date: Thu, 11 Sep 2025 12:34:25 +0000
In-Reply-To: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
Mime-Version: 1.0
References: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
Message-ID: <aMLB0Vs0dJ_AkU4z@google.com>
Subject: Re: [PATCH v3] rust: drm: Introduce the Tyr driver for Arm Mali GPUs
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, 
 Steven Price <steven.price@arm.com>, Jeffrey Vander Stoep <jeffv@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 kernel@collabora.com
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

On Wed, Sep 10, 2025 at 10:51:18AM -0300, Daniel Almeida wrote:
> Add a Rust driver for ARM Mali CSF-based GPUs. It is a port of Panthor
> and therefore exposes Panthor's uAPI and name to userspace, and the
> product of a joint effort between Collabora, Arm and Google engineers.
> 
> The aim is to incrementally develop Tyr with the abstractions that are
> currently available until it is consider to be in parity with Panthor
> feature-wise.
> 
> The development of Tyr itself started in January, after a few failed
> attempts of converting Panthor piecewise through a mix of Rust and C
> code. There is a downstream branch that's much further ahead in terms of
> capabilities than this initial patch.
> 
> The downstream code is capable of booting the MCU, doing sync VM_BINDS
> through the work-in-progress GPUVM abstraction and also doing (trivial)
> submits through Asahi's drm_scheduler and dma_fence abstractions. So
> basically, most of what one would expect a modern GPU driver to do,
> except for power management and some other very important adjacent
> pieces. It is not at the point where submits can correctly deal with
> dependencies, or at the point where it can rotate access to the GPU
> hardware fairly through a software scheduler, but that is simply a
> matter of writing more code.
> 
> This first patch, however, only implements a subset of the current
> features available downstream, as the rest is not implementable without
> pulling in even more abstractions. In particular, a lot of things depend
> on properly mapping memory on a given VA range, which itself depends on
> the GPUVM abstraction that is currently work-in-progress. For this
> reason, we still cannot boot the MCU and thus, cannot do much for the
> moment.
> 
> This constitutes a change in the overall strategy that we have been
> using to develop Tyr so far. By submitting small parts of the driver
> upstream iteratively, we aim to:
> 
> a) evolve together with Nova and rvkms, hopefully reducing regressions
> due to upstream changes (that may break us because we were not there, in
> the first place)
> 
> b) prove any work-in-progress abstractions by having them run on a real
> driver and hardware and,
> 
> c) provide a reason to work on and review said abstractions by providing
> a user, which would be tyr itself.
> 
> Despite its limited feature-set, we offer IGT tests. It is only tested
> on the rk3588, so any other SoC is probably not going to work at all for
> now.
> 
> The skeleton is basically taken from Nova and also
> rust_platform_driver.rs.
> 
> Lastly, the name "Tyr" is inspired by Norse mythology, reflecting ARM's
> tradition of naming their GPUs after Nordic mythological figures and
> places.
> 
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Beata Michalska  <beata.michalska@arm.com>
> Signed-off-by: Beata Michalska  <beata.michalska@arm.com>
> Co-developed-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> Co-developed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Link: https://www.collabora.com/news-and-blog/news-and-events/introducing-tyr-a-new-rust-drm-driver.html
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

[aliceryhl: minor Kconfig update on apply]
[aliceryhl: s/drm::device::/drm::/]

Applied to drm-rust-next. Thanks!

