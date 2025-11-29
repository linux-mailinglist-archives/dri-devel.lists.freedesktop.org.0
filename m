Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFBC93D6B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 13:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DB10E033;
	Sat, 29 Nov 2025 12:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TithUnsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EA910E038
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 12:21:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so24658035e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 04:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764418871; x=1765023671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KcVPfmTekyLiABGhJu4xmxadfb6FIwZsqQzyLFSkQjE=;
 b=TithUnsSi2tCCtGltPh1k3Tw3WMhWtAjlhtnC2k0NKLPdnxUBQ+JRNskqzrD4NR/LC
 GN3xBYpwOP7ejbe1VhHknJAudRIupo3L11bJFkJkMxIikI7niCwE1x1SYsmC8XLIW+Os
 iDL6KfIG3R15p1Si/vy1Gt++wewOms3gAgy1It2Dfx5UHOfD+OqP5CFjRHD2O0FAxVxL
 MwJEQ1tLSG+NBpqt2a7twBS5ukhF0VtPa8r8aVDXpvBc133Spj6QeIE1GnoUB6cbB0r5
 owWkUvGNsBNKpwAKQr5WhOv5TR1ThY6f7d+tQmTrl78iXC1SeFVR1THXKMwiweWsEaAB
 KY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764418871; x=1765023671;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KcVPfmTekyLiABGhJu4xmxadfb6FIwZsqQzyLFSkQjE=;
 b=dvkO5iOuYlDDB6wj7N6dcKHCkY+0hx1zQQ0Ucs/qGKU+kkHSHlTU4ptGajAVTVjrmk
 869jjPgRSeM++sdyoLaby2ankAb8JG2iWqNCAZV1dvOAuqpy2xXkWBWiLIBnqsM61YBW
 VpAeuYJsaAdRnhya3X/gi83Wut24rWGoEvJq9/YmJG+k47UhYeZIJzF+gfK6+HkA7xdk
 J+LbhoX/8Yi1VCQsS8t/m35juo6N2numiLka+UJZInZ+eC56EysBYDapzFb5Lg25QtLh
 ec6OHFUUUXwVE8wf2S+J7DSTwRSpQUlLPtPsXU7cCcWpappqHGew5TC1/7PdcpfUFZ+K
 MJ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeERAqtHfqaxTEu3IxdrbSlnf/WX96JX8w5m4GR1gIJhi0ZwEtY6oTGA6dhgOnPa6X8y55zJ5PhJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3dB3nzkOkQqE4/9BT1JxO5UyJbxW3ISkeZR62ZyeOdu/kXYRu
 CN239Zq1IHZKqn3j0PMUximo7wSa32Whs7Gu2PmZ0Z75JA3V8cb60ty1
X-Gm-Gg: ASbGncvHzwsaFf/cKjAvMTtZ3dcUF+aPVjcRBcTZsbbVXQAmLs4Msgcd3FC2PAvNACz
 rOfUe9eEftoxA4kGn3aPhpLNneQO/c8e0Iv4JKWhXL9dxehkHhIDIRWWM7X62iR0YZ6InP7ZPFW
 ellzP3ekp2beOcGK2JHuOHMznaigD1t9/r570c8DSBYdlfiiJRM1yT3DC8Y3h/NcyfX3mhSi9mP
 m8kYzIhuskQOaRRX63SbpFKyfdm4q6TEN3qbRedx5z4M7PYLeGjGBWlDsvoj8JtUEctVM+Hj115
 DYe0zscyn+GovBal4qKZ4Ne7FC34Yt0KXsTNK+oQJbUDogXcKmRb8XtUE5ESCEMNIIX7/0jtfOj
 MCpIBmgOT5adraKfZNzu3SxyLehfmQgy2cisiEKXqenVz0JOBqeDjA0xqnKJETppJshP/hsWAdw
 h1mOo+7qYaGNKsdv928L+I60qfuCBHRGx/AVrtRtDqy78mbu66HyJB5SFoUaWYB9pwd3KIxred/
 9Q62boMkpkWVcGO
X-Google-Smtp-Source: AGHT+IHPdRho1zaUXZGS4ozcekK0LR1lA9bfnMYzOaD4j+9k0x7QM6vylSP8/9z2op9t+DSRd2h1Jw==
X-Received: by 2002:a05:600c:3b96:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-47904ad907amr211433865e9.10.1764418870809; 
 Sat, 29 Nov 2025 04:21:10 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:ddd6:3141:6a4a:f8d8?
 ([2a06:5906:2618:cb00:ddd6:3141:6a4a:f8d8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a3f1sm15343627f8f.28.2025.11.29.04.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Nov 2025 04:21:09 -0800 (PST)
Message-ID: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
Date: Sat, 29 Nov 2025 12:21:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-6-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20251123092438.182251-6-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/23/2025 9:24 AM, Shankari Anand wrote:
> Update call sites in `i2c.rs` to import `ARef` and
> `AlwaysRefCounted` from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>   rust/kernel/i2c.rs | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 1aee46f59460..c50ca464d87c 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -17,10 +17,8 @@
>       of,
>       prelude::*,
>       str::CStrExt as _,
> -    types::{
> -        AlwaysRefCounted,
> -        Opaque, //
> -    }, //
> +    sync::aref::AlwaysRefCounted,
> +    types::Opaque, //
>   };
>   
>   use core::{
> @@ -32,7 +30,7 @@
>       }, //
>   };
>   
> -use kernel::types::ARef;
> +use kernel::sync::aref::ARef;
>   
>   /// An I2C device id table.
>   #[repr(transparent)]
> @@ -408,7 +406,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>   kernel::impl_device_context_into_aref!(I2cAdapter);
>   
>   // SAFETY: Instances of `I2cAdapter` are always reference-counted.
> -unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +unsafe impl crate::sync::aref::AlwaysRefCounted for I2cAdapter {
>       fn inc_ref(&self) {
>           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
>           unsafe { bindings::i2c_get_adapter(self.index()) };

I'm fine with this going through either tree.

Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>

Thanks
