Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED2B0BDB8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 09:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8D610E257;
	Mon, 21 Jul 2025 07:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hC2C+AQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D1010E257
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:35:18 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-234b9dfb842so31956045ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753083318; x=1753688118; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z5dBnPu5UuatkXMTVj9BGvrncU8K1V9rUHxc0C/1nEk=;
 b=hC2C+AQhffBoLAQUKiqVt+ekUHzF9mIgUR9eWGXNE6RWFhnwRFSG3qBOOD8XhVdWM5
 BTr/jI2wMLLQF6M6pMTx6EUV7WlN5ri5N5JQX2jBFA1s7/bcj6RouATuhrb//M0VmE9e
 1rRY2dnQgmzWaWRA50vuTkkKlaw1j+N/+bblgqPICAmTukZ+79Spdq1uuphZ/FBCjk7Q
 qPxQ5SrzELT/GUuca01/6YvcaPta+ubvmyuDYzhSOUwrUyRY2T3k44d2p47oG0XzeWO1
 Sq9CPls0nhWP7X95weFiscmvEmNXRw3LYKx2rLCqNKX2SS5CCKtAGWzodknW4bzdSiFR
 dZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753083318; x=1753688118;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5dBnPu5UuatkXMTVj9BGvrncU8K1V9rUHxc0C/1nEk=;
 b=n5Ep0vcYk599XxO8uMYvqQOGrxQvxwBlO4R/rTK1tMr79ZsK5xKnjXfLIVHpA6o+q3
 w72Cail3K3AvIZ1ZlLd8nfqfMHO+Q7PpVT5N35O6UBY4fp0ivUqau7vo2pH/ENcwJX5B
 Q5SEJbTswYvJCOo1vYmHF2YHKodh8/bWvpEEW6mE/GPlBx7zE4JVAQgCl0ImfFR+wtkI
 izzOG/qnnFUj3xSrbFJYRCLrwxwbR+vNvIW2bQw7RT1VXBHuU1UKyE+JnLTfC6ggzOSC
 0sfgWb2VjxjiJx/NXM5COcfJFJFKqLRNMirdXI5z7BrzNg3jiOUmPq+rSsFS7S2Qyfqf
 mH2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUilhyDmBO10IV0TqCq/C/ji0LhqEYG/lQb3ygSzUKAq1GA/5isjFqSVNdzaE4NMcfjIdcOv4k3P4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzZMdXDQZWy3eYLgwltA8YxNJLn5kyGSa12FJsj8Ljp+CeHwlT
 xsEWfd5QIrXnYSNVa9Y2k8RvyaNtYIahzqNrZZSWIx53TDCyAPkTruiLtECbv80pmws=
X-Gm-Gg: ASbGnctaxx5cjeMa2y6v0zEaNVkcCzX4OdszRoblkyBLkwvjyAKLbU3vPQ7JN4PO0Hb
 jWTEpy8gtvkyj+ns0oHSyvTxYqlFdydvEZtesrzki4A2w/eogY9fsVxF/5EC2OSV62riZNcSlDw
 qUliZrgCV006fZJ2wLXWRKpzRybODEbKfRgYtfT70TG1db3UKcfVB8tUFlSl13N3isRfy0kMTrR
 J5CkYmbT/y+sr79XU7taRBNZQSEs/A1S35ngm6q6VSWG9OhMTwnQWwPZcC1XV6EjyZoicCT9cgH
 vwC9Qnra8jIZq7W0y5MsdCMdPdizOqFa6lG2SfTDm2D0WIgud/KmJuqVP61VLMskG/Yz0uY82dW
 SoVv+5BshZr7H5hFjE3eIliqK2GU2lOtkww==
X-Google-Smtp-Source: AGHT+IETNDRZoddMesKOQhKRvcZzakzOmMfiCHJxW7eO5wvM2qbmpmfxE8rY5ugFlkzEUO27/HUOzQ==
X-Received: by 2002:a17:902:d58c:b0:234:a139:120a with SMTP id
 d9443c01a7336-23e2572ab00mr258734915ad.32.1753083318367; 
 Mon, 21 Jul 2025 00:35:18 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d239dsm52577175ad.155.2025.07.21.00.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 00:35:17 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:05:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/10] rust: cpufreq: use `core::ffi::CStr` method names
Message-ID: <20250721073515.2srip46utnyap7fb@vireshk-i7>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
 <20250719-core-cstr-fanout-1-v2-4-e1cb53f6d233@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719-core-cstr-fanout-1-v2-4-e1cb53f6d233@gmail.com>
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

On 19-07-25, 18:42, Tamir Duberstein wrote:
> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoid methods that only exist on the latter.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/cpufreq.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index e8d231971276..71d601f7c261 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1018,7 +1018,7 @@ impl<T: Driver> Registration<T> {
>      };
>  
>      const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
> -        let src = name.as_bytes_with_nul();
> +        let src = name.to_bytes_with_nul();
>          let mut dst = [0; CPUFREQ_NAME_LEN];
>  
>          build_assert!(src.len() <= CPUFREQ_NAME_LEN);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
