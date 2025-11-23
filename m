Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E1C7E78F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 22:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D8210E14B;
	Sun, 23 Nov 2025 21:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SkKDk/vY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEE910E050
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 13:16:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so18048775e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763903787; x=1764508587; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vWsYIQ2Ggbhbzka70Nij3a4arpdwqNARnWCMeN/qSWA=;
 b=SkKDk/vYsWozyy5C5m/77TLHZUFPH4So1wMjCa/Osok7L7rjlYLoo/cjw3xtdAsmdg
 a6pQ+XVrMKluNPRfmB2T+DBZmuxxKH4CoPUaqkoFcBZoiAsz1hnfm+REjxbE3/qx8nY+
 qgzC1qcCvlul4yM9/T1i204YwLENTEqGDSaQINWgGHpYrybQUHvU9lBjJ5gm39qComMJ
 wB8FxXhknEjPq9+6E57PkJexh5hEVhSBF11DQkqpiFG7b+LOwt7CeUyJE9FtHx6IzX4i
 H5EkyR+yoN4YRuOrNp/YrMRSNWonLRQr+CPSDAnrfWn0Kw5DAj3lc5cx+C/jvs8ldzX2
 MlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763903787; x=1764508587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWsYIQ2Ggbhbzka70Nij3a4arpdwqNARnWCMeN/qSWA=;
 b=cmVPUk8np9UVYuAezkj0YiV7B3N1l7/araT2Xa7NHcl0mUdZ0fL10X+TibLqkArPc9
 n3V300phu04C9XZior+Zot0Y+m8sIAvnyg+CymT+ZCjoqTwqxKsfPNvMYuchTKS/0qWQ
 vwRJAcuLhZI0Rs5du5NcU+Io1YDO6Xx1+cTFYiDB7ggRZVcY7MIJ1PJQHc347oxyNtVC
 yMyd/R1hX83/m/nP5w/yP1jEV5pWVECZBfmsezAKJ+a2d6leawqQFbyw1y6sZ8zvdJvA
 oEdaXXNzvxy9yhEgI/YNbII8eySckYCE2oXBNehIcgrlMv7ELHoGc4I9JH0Yk4D+ByS+
 adcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6kSEEV6tHRVkdiUaUpdyhd/BsXoDH6WjxBzCYLEipIirQIfrWHCtWaE5VckeuaQg5vOtM8aKEmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVCe7AdvKg/6NvUcl8AuLKZFEGVn/KHDaRzG57APRrmD8oVEhW
 D+eQyCt9uNMw10WCBcMIENvYhfg2wR4jjXAiOp5bZuJRI6aIE7TzW06X
X-Gm-Gg: ASbGnctCOQ7+Mz2SlkyqqnJOGCjowqNVQIm4ZTxYh6cYtwLukK1l0Rea4hNkFNv/+td
 f97ZrTsOy3BHH4V8vPpJJ9635mVCmBkDoJFbW1zchIhr3Q7r4RC00iwEVQuu70nEm6/tlxYs9rT
 kJyxeLNgWRYXityygynXzFOZsj74x3HqAkNqVomTEkp2bB3u6Pt5a0bvrJRo5cJ9XjqLFslDAQA
 OvQ+jT5XJpAWM4zr9V55aRqVJCKKp5qesTIJPHCmVClgYPPCvBAjy5Nbjw0/mDosB0b1uwWYDgR
 5hymqwfpw5UzCfeOEgTwReL/Vl/2LoiZFcrYUHfnu2CdF91kB4Wp+f8HPIorjIqu4l77Ey30c7Y
 Zo8s4UC83hpAdgS8aSFjzyV1M2FeRn1y0v/IUy76w0xpDttsu5e+bunj5dQBH7uhMeGR1i/aVQT
 Ktr/EBcqqLQwl3N+Cne1ba8mdCQwJEk6lrTE9CI4n/lJXPSxtm/C5bZuOaRnHW7fLdyVK/uWfG9
 5qc9w==
X-Google-Smtp-Source: AGHT+IGwu9HAU1GTXcVV6PqyT2WVWbNnyTLYP+26LVoRcWUnFI2rUjGr2LZvtLw3Ln81be9Wp+f1+Q==
X-Received: by 2002:a05:600c:840f:b0:477:632a:fd67 with SMTP id
 5b1f17b1804b1-477c10d6d13mr93671615e9.12.1763903786586; 
 Sun, 23 Nov 2025 05:16:26 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:f1a3:6462:6c03:ec0e?
 ([2a06:5906:2618:cb00:f1a3:6462:6c03:ec0e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb919bsm22549569f8f.34.2025.11.23.05.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Nov 2025 05:16:26 -0800 (PST)
Message-ID: <7bd3232c-90cc-4e71-8aed-2ac911cb20f9@gmail.com>
Date: Sun, 23 Nov 2025 13:16:24 +0000
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
X-Mailman-Approved-At: Sun, 23 Nov 2025 21:09:40 +0000
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

Hello Shankari

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

NIT: This module already imports `AlwaysRefCounted`, so please use the
imported name instead of the full path for consistency.

>       fn inc_ref(&self) {
>           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
>           unsafe { bindings::i2c_get_adapter(self.index()) };

Thanks
Igor
