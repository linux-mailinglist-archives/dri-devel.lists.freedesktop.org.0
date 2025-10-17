Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BEBE8B82
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C3D10EBE2;
	Fri, 17 Oct 2025 13:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="at5IVjdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0310EBE2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:04:55 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-426ce339084so1816503f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760706294; x=1761311094;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QsGulBtXOolWogbv37P9kOPn3EPzZ7HWeVFTvLjVVtA=;
 b=at5IVjdr15H9kmmzG1Q2UFKyiZqazDuCiU+W1jhAJOg2E2lyJQx8DWmNi4p9C9FyNh
 vH70CGzsemgfCucuERlgkLH7lqAk//YjnIGzmdNvPjzBXZo1EBkhOaLLnSCzlKFsSWLU
 lsPsGl6FpiC1R5Syv+Rrc4IrMLaZMAdXNaVQU3gxCqG6WrUavWJwc9xyFACvfbbhSQqT
 wuuBNmoEYiJJYTkJFQug//8SU7glvCmzhhyy++C3Ugv8ytuT5qOLnzf3hF5gtU0G9aKQ
 S6hLrsLZsehC9ZoyQLoAykD5CB6oRLX2TzGxqibfPCZ+fYeO3iiH429uOkslK2Wvc/Y3
 9whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706294; x=1761311094;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QsGulBtXOolWogbv37P9kOPn3EPzZ7HWeVFTvLjVVtA=;
 b=Pb1j6AspePcqXT7bPoAnVfihETdzf6EMaqax1ASSv/3CB6SfT7m6obwjS3NO9ZTDib
 Ee9t2b5gUFVn/jH4thHuSnYwiCqGoTiwkbSPi3/5G12SLXPMWSIXqkZNqNsFNVJVuNx5
 2XQxWiWDKY/F1Nf7aJnQt7pU0Fqt4Ptg3+InG7ihrrxDCUficyzYLTpIr2DMWnAqzErw
 IWJMc/BvBmWM8UblDXNdW8GcKzWAr1l+PV21Kw2K60cLONz+H2OeDt9nyHnQelCpac9s
 Rgk30isosRkdKPkzLkrBlOfBLLTgv5DJdDZ9LH6Gq2X5xpWjYzjQQX4jFnrnLzgxwsFc
 octA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMdWVU5CUNgf8wiLTneHSvf6XGvr8FU0UnvMcOIjAI2YBPAhB83jAfnxcavc4HFmtm0yKMaz+K4Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiS7jHANcMqzHA2dzp4hHok4B9TVU7QK1wodhKljIWzb8IhJMY
 15empEjeIg32RAdYf3qBigJPhYFejc8BOgIjChMTJN6FP+27KjH7v8QGn3fDuCtzzoF8YBDEKlK
 3LXMfyGu0apR0crUpOw==
X-Google-Smtp-Source: AGHT+IHmxuUy/higL8bMvF0u1RF+TfLvGKbJRuFXq91cThOSrZ5KPNHsS9I5kFewP7afvF/ZcVPnLKvl0oA6dKw=
X-Received: from wmbgx4.prod.google.com ([2002:a05:600c:8584:b0:46e:1fc1:6636])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40ce:b0:427:6a8:532a with SMTP id
 ffacd0b85a97d-42706a8535dmr1784522f8f.31.1760706293678; 
 Fri, 17 Oct 2025 06:04:53 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:04:52 +0000
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20251016125544.15559-1-dakr@kernel.org>
Message-ID: <aPI-9GoI7ZsNCpQr@google.com>
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, viresh.kumar@linaro.org, 
 acourbot@nvidia.com, ira.weiny@intel.com, leon@kernel.org, 
 daniel.almeida@collabora.com, bhelgaas@google.com, kwilczynski@kernel.org, 
 abdiel.janulgue@gmail.com, robin.murphy@arm.com, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
 tmgross@umich.edu, rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Oct 16, 2025 at 02:55:28PM +0200, Danilo Krummrich wrote:
> The driver model defines the lifetime of the private data stored in (and
> owned by) a bus device to be valid from when the driver is bound to a
> device (i.e. from successful probe()) until the driver is unbound from
> the device.
> 
> This is already taken care of by the Rust implementation of the driver
> model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
> from probe().
> 
> Unlike in C, where we do not have the concept of initializers, but
> rather deal with uninitialized memory, drivers can just return an
> impl PinInit<Self, Error> instead.
> 
> This contributed to more clarity to the fact that a driver returns it's
> device private data in probe() and the Rust driver model owns the data,
> manages the lifetime and - considering the lifetime - provides (safe)
> accessors for the driver.
> 
> Hence, let probe() functions return an impl PinInit<Self, Error> instead
> of Result<Pin<KBox<Self>>>.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Depends on a minor pin-init patch [1] (Benno will send it to the list
> soon). A branch with this patch and the pin-init dependency is available
> in [2].
> 
> [1] https://github.com/Rust-for-Linux/pin-init/pull/86/commits
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=probe_return

Overall LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  impl Device<CoreInternal> {
>      /// Store a pointer to the bound driver's private data.
> -    pub fn set_drvdata(&self, data: impl ForeignOwnable) {
> +    pub fn set_drvdata<T: 'static>(&self, data: impl PinInit<T, Error>) -> Result {
> +        let data = KBox::pin_init(data, GFP_KERNEL)?;

Perhaps the gfp flags should be an argument set_drvdata?

Alice
