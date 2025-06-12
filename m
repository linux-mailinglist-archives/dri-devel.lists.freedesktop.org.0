Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F2AD753B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6913D10E88D;
	Thu, 12 Jun 2025 15:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D9pJDTIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D15E10E890;
 Thu, 12 Jun 2025 15:07:32 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7d098f7bd77so116898585a.0; 
 Thu, 12 Jun 2025 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749740850; x=1750345650; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ak1LLtwfOBZwskRiUyNHNLlsyugdrztZNAWM/dn6MRU=;
 b=D9pJDTICFxMiFzwKW5doNpYDUDKrAdOND5EJUhxmWPU9Z5gtH2t+g8QBfTxbyrU4Yn
 FcPYAMrRraxebkxVPERh70BJfiNZlOVREodctP8+QbV12CHUOAfWzXPpQfGVcdlK+vV2
 kHLEH3DsN86AgdC2HuyeJv1E2se+8MerdLkCl7vHmnM8UCsKdiVDBeVFAaR2oLUYxfUF
 TGPyz32oAN5/cEjcI7eYucOfcr+T3SMLC7I1Q25OX2LmHFrAlC2od24Xc6Se7nwKu16/
 kLXJLyOIAhc87vGUtqHc+O9MkayMpUhIxD7crXWf7ylR1yZJ5tp86HWaRG+zlfVyhFmH
 tPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749740850; x=1750345650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ak1LLtwfOBZwskRiUyNHNLlsyugdrztZNAWM/dn6MRU=;
 b=nUHRcFMP7p93pI+dWVrQRi6q1BbGSpYxQNQOT6a7VEIkYfhJ8YiSB8cy4ViPDCQYQJ
 VPaOzKMotx0ku4Cs+ca7+NQau347dXKqYVuoG4zY+24h2SsgmNgzQ3uAR8xsKNAVNwrR
 Jwk+IbsHzXPXHia7HksoK1DkD7fBvu5SAS55JcNOKRf8fM6SN67z1s9I3JZYIOPV3CpM
 MOd30iPig/Ib9gmsJ26z/1t+NHxg+IBJ2X+49lStLPV/WaQDM1N4qZFaLv1uO3inkiJH
 rGjBATVDcJgZ6FdA68RTRKxo8RHWsI8r1vBHjtJTf6Uzmz5v4aDL8VgPkRCUjDowt6y+
 jGWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz7+ythaW1fqYqDfSXUOLBS1V9JyhyK4zc+cey7rcMXqpiGVtvuhcbsH6cq7HzWNBzeco4VWa2WPU=@lists.freedesktop.org,
 AJvYcCXZMjDchpDSHXK1wTALs++EXjxakJBa6tMe/XnzKjgIrnsYEvcAM4OXLqvkwoh05NyHyxUt6mS0Hg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaN4tq8CBiI0Wk1Z6i2KwkpskA18fCx1VnoS80S7bY3kbTHRjk
 BLm3c6IkS7VdG6Hlzowrb4BQ3Jhk4z5VKUcKdEC7aJgnlSk9udWnnIsc
X-Gm-Gg: ASbGncvcFmoTTQNdB29S7nKYFTv13XZ3Q0++s+JVsXVnVmw0xP3Ti5g+SsR5T70u8/i
 oV/dqzjE8SQb3Fw6PJJp4kodk06UNBk7GGOwVx/OfIqWw5XvAoozRzu2/LwsTjdX1ZhQsL39W1+
 VbnYtE1PZWo4uat2/zfQWizIqXc7kHrLuYIM9iLyWUaJD9bw2dBlqtEfflqebxl1HQlJqrdfYkj
 Ya7vHnfoioczrrBe0Ysi8SxMCOFoC2KroeqZPdSQ8g+rXajbCRYY/mp5g/+nfXb5Xy3CHLE/bW7
 gmjKiRdAeHeOLAObGxcMRajDs+ah2RCYcbOtltBbCzrTktvMEf60X2ywbGv58SmMcv5XmmtEvx1
 6D9tDQ2r2mfOobmfUUXW7c9NDF3QYQOSz5ELgFmCJs7d/5+5bfSLy
X-Google-Smtp-Source: AGHT+IEWKSZx6VTctdm5flg6YAMB36hqq32ZNEDxmUm3MgkF6Ea8BVoTaEKdXSFIYzRhM3toOK+vxg==
X-Received: by 2002:a05:620a:9518:b0:7d2:26b4:9a91 with SMTP id
 af79cd13be357-7d3b2d767demr440353885a.2.1749740850284; 
 Thu, 12 Jun 2025 08:07:30 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8eaccc4sm50231485a.74.2025.06.12.08.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 08:07:29 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 181D01200068;
 Thu, 12 Jun 2025 11:07:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 12 Jun 2025 11:07:29 -0400
X-ME-Sender: <xms:MO1KaDgHMEhzVqJlxjRbGTXEXxba_2qIWf9aziNlqYslBuHKbBIICQ>
 <xme:MO1KaAB_hWLwQ_KumJ9goIyJTHl87nDGHJeoV1QZvQQbv-hbn9Cjd73UXTi7KVseK
 j8DwPJNENniuMWQgQ>
X-ME-Received: <xmr:MO1KaDFrUe4Ns8hrcz79ANJs6xQ4RjzbYopnsXhnYAPv_Iqbn3chdQh1LIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
 homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
 lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
 hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
 ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
 pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
 gvlhdrohhrgh
X-ME-Proxy: <xmx:Me1KaAQWCDPz59Di9vz5U0N7B10kWFcUgfBUHSaSuaYRWrDPAGDxhg>
 <xmx:Me1KaAy8LP5ECCWuA5HrBXqqBuQqGMr4JwYSc-CpMHn3FCregyUwBA>
 <xmx:Me1KaG519a0LAZhG7fNKhrZEThmGhIkE5KsbPgZMF2oy0NiZe-j-Gg>
 <xmx:Me1KaFxlCbEIwqzjbg901zjDvebFIzJjneViKSvTbXkr3wyENdQ0tw>
 <xmx:Me1KaAidkRMYTHUUSt0MLjkxQgk755O_1_iwQspLEApSUd7t61Y08YXn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 11:07:28 -0400 (EDT)
Date: Thu, 12 Jun 2025 08:07:27 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Message-ID: <aErtL6yxLu3Azbsm@tardis.local>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
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

On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> Introduce the `num` module, featuring the `PowerOfTwo` unsigned wrapper
> that guarantees (at build-time or runtime) that a value is a power of
> two.
> 
> Such a property is often useful to maintain. In the context of the
> kernel, powers of two are often used to align addresses or sizes up and
> down, or to create masks. These operations are provided by this type.
> 
> It is introduced to be first used by the nova-core driver.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |   1 +
>  rust/kernel/num.rs | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 174 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e4272ff178b8211a892c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -89,6 +89,7 @@
>  pub mod mm;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee0f67ad1a89e69f5f8d2077eba5541b472e7d8a
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +use crate::build_assert;
> +use core::borrow::Borrow;
> +use core::fmt::Debug;
> +use core::hash::Hash;
> +use core::ops::Deref;
> +
> +/// An unsigned integer which is guaranteed to be a power of 2.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(transparent)]
> +pub struct PowerOfTwo<T>(T);
> +
> +macro_rules! power_of_two_impl {
> +    ($($t:ty),+) => {
> +        $(
> +            impl PowerOfTwo<$t> {
> +                /// Validates that `v` is a power of two at build-time, and returns it wrapped into
> +                /// `PowerOfTwo`.
> +                ///
> +                /// A build error is triggered if `v` cannot be asserted to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// let v = PowerOfTwo::<u32>::new(256);
> +                /// assert_eq!(v.value(), 256);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn new(v: $t) -> Self {

Then this function should be unsafe, because an invalid `v` can create
an invalid PowerOfTwo.

> +                    build_assert!(v.count_ones() == 1);
> +                    Self(v)
> +                }
> +
> +                /// Validates that `v` is a power of two at runtime, and returns it wrapped into
> +                /// `PowerOfTwo`.
> +                ///
> +                /// `None` is returned if `v` was not a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(16).unwrap().value(), 16);
> +                /// assert_eq!(PowerOfTwo::<u32>::try_new(15), None);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn try_new(v: $t) -> Option<Self> {
> +                    match v.count_ones() {
> +                        1 => Some(Self(v)),
> +                        _ => None,
> +                    }
> +                }
> +
> +                /// Returns the value of this instance.
> +                ///
> +                /// It is guaranteed to be a power of two.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// let v = PowerOfTwo::<u32>::new(256);
> +                /// assert_eq!(v.value(), 256);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn value(&self) -> $t {
> +                    self.0
> +                }
> +
> +                /// Returns the mask corresponding to `self.value() - 1`.
> +                #[inline(always)]
> +                pub const fn mask(&self) -> $t {
> +                    self.0.wrapping_sub(1)
> +                }
> +
> +                /// Aligns `self` down to `alignment`.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_down(0x4fff), 0x4000);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn align_down(self, value: $t) -> $t {

I'm late to party, but could we instead implement:

    pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
        value & !((1 << shift) - 1)
    }

    pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
        let mask = (1 << shift) - 1;
        value.wrapping_add(mask) & !mask
    }

? It's much harder to pass an invalid alignment with this.

Regards,
Boqun

> +                    value & !self.mask()
> +                }
> +
> +                /// Aligns `value` up to `self`.
> +                ///
> +                /// Wraps around to `0` if the requested alignment pushes the result above the
> +                /// type's limits.
> +                ///
> +                /// # Examples
> +                ///
> +                /// ```
> +                /// use kernel::num::PowerOfTwo;
> +                ///
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x4fff), 0x5000);
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x4000), 0x4000);
> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_up(0x0), 0x0);
> +                /// assert_eq!(PowerOfTwo::<u16>::new(0x100).align_up(0xffff), 0x0);
> +                /// ```
> +                #[inline(always)]
> +                pub const fn align_up(self, value: $t) -> $t {
> +                    self.align_down(value.wrapping_add(self.mask()))
> +                }
> +            }
> +        )+
> +    };
> +}
> +
> +power_of_two_impl!(usize, u8, u16, u32, u64, u128);
> +
> +impl<T> Deref for PowerOfTwo<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T> PartialEq for PowerOfTwo<T>
> +where
> +    T: PartialEq,
> +{
> +    fn eq(&self, other: &Self) -> bool {
> +        self.0 == other.0
> +    }
> +}
> +
> +impl<T> Eq for PowerOfTwo<T> where T: Eq {}
> +
> +impl<T> PartialOrd for PowerOfTwo<T>
> +where
> +    T: PartialOrd,
> +{
> +    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
> +        self.0.partial_cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Ord for PowerOfTwo<T>
> +where
> +    T: Ord,
> +{
> +    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
> +        self.0.cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Hash for PowerOfTwo<T>
> +where
> +    T: Hash,
> +{
> +    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
> +        self.0.hash(state);
> +    }
> +}
> +
> +impl<T> Borrow<T> for PowerOfTwo<T> {
> +    fn borrow(&self) -> &T {
> +        &self.0
> +    }
> +}
> 
> -- 
> 2.49.0
> 
