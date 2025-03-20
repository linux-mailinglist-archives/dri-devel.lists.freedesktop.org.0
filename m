Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64BEA6AD03
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B2410E683;
	Thu, 20 Mar 2025 18:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFeXWu/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3336910E683;
 Thu, 20 Mar 2025 18:18:28 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4769f3e19a9so7155361cf.0; 
 Thu, 20 Mar 2025 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742494707; x=1743099507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LomTTqYpuCaFq7iSHprNyvYgv1kuqToo7AopkRQx8fk=;
 b=HFeXWu/Tv/iGeGYaKgVHV/cTM+8apIJ+JWWGUtyh4oDqHHd0IGoJPhqxwWyvLZKmi8
 O/GK68R8/VtSWrnO5ZSv57ptDehoP3YDW2hLmj4x1B5wL41S3ndJ0Uf2tKLFm7oB4tq5
 PX87Y38iYS+akVcBSHkSKZHh8nn0oxXXJsp76WDPKWUSeKJs/LmcRn72hnoVL9+ybtic
 i3nL+j0Q+yo+Na5lvC3b1wiS3K8dYoONgLn8jn5hOqdLzCSiBQdhGwYnSp0B8f6cAG/T
 1NMCHzraKMn0ef6nWtgUYCZEP0cy2sFrkRD3qiPiw7A5GDE8kerqjTYkBp0/jwPFo8f8
 rN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742494707; x=1743099507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LomTTqYpuCaFq7iSHprNyvYgv1kuqToo7AopkRQx8fk=;
 b=wsgGtAtz8TG2nJOtMlAAb+GRUCedli/z0cfKO7RxWYQETGCi8xbBlsWLFYrm3Xt9mt
 DvD0mpl2c7QNv1leiQx2Xs9TOwpW2wAqP5ONc6PzfDRXg1yV3GmXLi8OGg8GFdT2NL8P
 Zb1mumXw/hYfxfrpq/BzSpMPJ1PzFDI9kXbXVtH5xbe1eWihBwqu8DssVlGcUatan9xN
 99rJTm+jIb9zwBjKRlz+0iZ6CLeahfovlwYC0wGV16hoVZ7ze4DaSFC+gEjK1o8xlEO4
 qu32KxSLnk41+95ro4XLqAKVezaHzqYYOCUF9cDoQ2jGAbegiseHQDZLb8UPeexqhYYD
 cIfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOVDPtVskFsPqr8wYe3JD5Wm/lr4CJAkPuMlJuyCbIQ2/IAMr407psDukH3w1qO3/yGoZ4hcqBBnA=@lists.freedesktop.org,
 AJvYcCXMvcHEYKtDzf2hrkQrZJpk/6HpNu7FWyCL9kRhokZzj73XPVPBxhdAhGOnOEVu8/GPn2sM1PwNDA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQhjKlrWEwkgwxKVik7O0hEgU+BBvL2WqHiHgfoxaBmeAiuRNK
 6DOTLfa0p+vI252LyTR87hkK2anzmfw5zZkFDdF2XCHl0pOCoINP
X-Gm-Gg: ASbGnctbzB267BiBPciJsx9ko9tqBy+O/epo02qX3vtfgRrJwPvPxitepgeejShIKvt
 RSvmjJ1zISKr/9c06Uk72Q/7Tb/CKFlm1Y2QBCMK2AlelNJIe6Cx1XxU19R5jRUCYYtWvU+N+OM
 eyHdy4AUnevww9JaUHDAI8ul4PZodHEiEOTqXTtN42MsqOrrOVdoNgFW5f5lbaUMyMznHfDexiq
 QlFxKn3hkMOfG+mvkVhVIL5qFZGh5tGWppr8wrVEmk48Sf1Vr21GTwt4dnd/QSb44b2ygPZVwI9
 gIaGk8VvssP5qgHiAqVBp0acrPx73p9QVK1suxECA9dB5FCz/Z+AH4dyF9P+uY+IpYyWITJBBSU
 wlfkfopQ/WhcKMJ2mfWi3uj6N0WoYPDV5yt8=
X-Google-Smtp-Source: AGHT+IGTSTOAyuGocnflySrE4kK1S9ukavorDpX0IfEuohTfTc5QeQmhb4wijjvjF5rRXiU5mHxsJg==
X-Received: by 2002:a05:622a:1805:b0:477:1e1f:8a0a with SMTP id
 d75a77b69052e-4771e1f928bmr1807731cf.0.1742494706873; 
 Thu, 20 Mar 2025 11:18:26 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d634b90sm1609991cf.70.2025.03.20.11.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:18:26 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfauth.phl.internal (Postfix) with ESMTP id 46499120006C;
 Thu, 20 Mar 2025 14:18:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 20 Mar 2025 14:18:25 -0400
X-ME-Sender: <xms:8VvcZ5UKVJwXhYXWhXHtn2haxbLwZG2xAlXKsRBB3J7gcApJFSE3HA>
 <xme:8VvcZ5l7nFDUCjTFsvyYygAvgM5vQvptROtTZcgie_Yvlg68YXlZYFyOvNHuo9igV
 8J-Cz3xKm__avnQEA>
X-ME-Received: <xmr:8VvcZ1ZuGICIojz_S3rzkf-3VyuA58sX-zxcEeYW77xIsVzZ4eriIirIknE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekleduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
 teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
 nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
 ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
 nhgrmhgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpth
 htoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopegurghkrhes
 khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
 dprhgtphhtthhopehjhhhusggsrghrugesnhhvihguihgrrdgtohhmpdhrtghpthhtohep
 sghskhgvghhgshesnhhvihguihgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
 mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjh
 horhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:8VvcZ8Wqsw1Rx59o_KwVZBTx3fF9JNGGeIXnvhmqpA_j1_Wj8iT2dA>
 <xmx:8VvcZzl4zMDdm7jFIEG9Tf4t4R5JP79QuaQHEl5DfgdBlq2TLQfmiQ>
 <xmx:8VvcZ5cChY4oQsQsEgQoijGu4887dbwk6RTkereQmOrVwtHNoCbm5Q>
 <xmx:8VvcZ9FVx_aPIQM5EcBsvF1ernTFGseOKLmF4lg4zNBHS1bjUSUG5g>
 <xmx:8VvcZ9kcVo0qoFOysMd7fVwXLQ4DagQz6fWfwIRG9YT6NTm1pNsytu4o>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 14:18:24 -0400 (EDT)
Date: Thu, 20 Mar 2025 11:17:58 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
Message-ID: <Z9xb1r1x5tOzAIZT@boqun-archlinux>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
 <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
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

Hi Alexandre,

On Thu, Mar 20, 2025 at 10:39:14PM +0900, Alexandre Courbot wrote:
> Add a basic timer device and exercise it during device probing. This
> first draft is probably very questionable.
> 
> One point in particular which should IMHO receive attention: the generic
> wait_on() method aims at providing similar functionality to Nouveau's
> nvkm_[num]sec() macros. Since this method will be heavily used with
> different conditions to test, I'd like to avoid monomorphizing it
> entirely with each instance ; that's something that is achieved in
> nvkm_xsec() using functions that the macros invoke.
> 
> I have tried achieving the same result in Rust using closures (kept
> as-is in the current code), but they seem to be monomorphized as well.
> Calling extra functions could work better, but looks also less elegant
> to me, so I am really open to suggestions here.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs    |   4 +-
>  drivers/gpu/nova-core/gpu.rs       |  55 +++++++++++++++-
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |  11 ++++
>  drivers/gpu/nova-core/timer.rs     | 132 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 201 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 63c19f140fbdd65d8fccf81669ac590807cc120f..0cd23aa306e4082405f480afc0530a41131485e7 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>      pub(crate) gpu: Gpu,
>  }
>  
> -const BAR0_SIZE: usize = 8;
> +const BAR0_SIZE: usize = 0x9500;
>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>  
>  kernel::pci_device_table!(
> @@ -42,6 +42,8 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>
>              GFP_KERNEL,
>          )?;
>  
> +        let _ = this.gpu.test_timer();
> +
>          Ok(this)
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index d96901e5c8eace1e7c57c77da7def209e8149cd3..f010d3152530b1cec032ca620e59de51a2fc1a13 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -6,8 +6,10 @@
>  
>  use crate::driver::Bar0;
>  use crate::regs;
> +use crate::timer::Timer;
>  use crate::util;
>  use core::fmt;
> +use core::time::Duration;
>  

Since there is already a Delta type proposed to represent the timestamp
difference in kernel:

	https://lore.kernel.org/rust-for-linux/20250220070611.214262-4-fujita.tomonori@gmail.com/

, could you please make your work based on that and avoid using
core::time::Duration. Thanks!

>  macro_rules! define_chipset {
>      ({ $($variant:ident = $value:expr),* $(,)* }) =>
> @@ -179,6 +181,7 @@ pub(crate) struct Gpu {
>      /// MMIO mapping of PCI BAR 0
>      bar: Devres<Bar0>,
>      fw: Firmware,
> +    timer: Timer,
>  }
>  
[...]
> +
> +/// A timestamp with nanosecond granularity obtained from the GPU timer.
> +///
> +/// A timestamp can also be substracted to another in order to obtain a [`Duration`].
> +///
> +/// TODO: add Kunit tests!
> +#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
> +pub(crate) struct Timestamp(u64);
> +

Also an Instant type has been proposed and reviewed for a while:

	https://lore.kernel.org/rust-for-linux/20250220070611.214262-5-fujita.tomonori@gmail.com/

we should use that type instead of re-inventing the wheel here. Of
course, it's currently not quite working because Instant is only for
CLOCK_MONOTONIC. But there was a proposal to make `Instant` generic over
clock:

	https://lore.kernel.org/rust-for-linux/20230714-rust-time-v2-1-f5aed84218c4@asahilina.net/

if you follow that design, you can implement a `Instant<NovaGpu>`, where

    ipml Now for NovaGpu {
        fn now() -> Instant<Self> {
	    // your Timer::read() implementation.
	}
    }

Thanks!

Regards,
Boqun

> +impl Display for Timestamp {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +        write!(f, "{}", self.0)
> +    }
> +}
> +
> +impl Add<Duration> for Timestamp {
> +    type Output = Self;
> +
> +    fn add(mut self, rhs: Duration) -> Self::Output {
> +        let mut nanos = rhs.as_nanos();
> +        while nanos > u64::MAX as u128 {
> +            self.0 = self.0.wrapping_add(nanos as u64);
> +            nanos -= u64::MAX as u128;
> +        }
> +
> +        Timestamp(self.0.wrapping_add(nanos as u64))
> +    }
> +}
> +
> +impl Sub for Timestamp {
> +    type Output = Duration;
> +
> +    fn sub(self, rhs: Self) -> Self::Output {
> +        Duration::from_nanos(self.0.wrapping_sub(rhs.0))
> +    }
> +}
> +
> +pub(crate) struct Timer {}
> +
> +impl Timer {
> +    pub(crate) fn new() -> Self {
> +        Self {}
> +    }
> +
> +    /// Read the current timer timestamp.
> +    pub(crate) fn read(&self, bar: &Bar0) -> Timestamp {
> +        loop {
> +            let hi = regs::PtimerTime1::read(bar);
> +            let lo = regs::PtimerTime0::read(bar);
> +
> +            if hi.hi() == regs::PtimerTime1::read(bar).hi() {
> +                return Timestamp(u64::from_u32s(hi.hi(), lo.lo()));
> +            }
> +        }
> +    }
> +
[...]
