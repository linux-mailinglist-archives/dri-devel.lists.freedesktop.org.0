Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3F96B58B4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 06:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15B410E06F;
	Sat, 11 Mar 2023 05:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3610E06F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 05:41:06 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id l18so8179411qtp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 21:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678513266;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBnbrHjdJqCycEaPHLF3SoWIQqolVe0vVU3sGJzdcqg=;
 b=JCrmDH75MWI6C4BQ6Nt6hJet7wA8eJiW8PPfMZAOC9Eb0zicSw4iJgBXqGFl4tbd07
 kSBQhixAf+a1xmDOjNKCmPKrl6L0jyPy/MOtfMx9LA76vw9NYif240OF35sL3cMAdrB9
 20UyOpDx/F6mf8b3T23HfOV7LfqSH7uVgI6mrf8fs1Q0T6nbzCSt+bd7gdRZXbXoB6nN
 Oag00Y1PIbB6zIzFq+TWAH9VD4h1Ew4SVDYx0dtZxHQwgF/P2YuoacOmlGijGey0sRgp
 pH3r+gp3XuwduyRHF4szq8xbf7fCxHENdRJr7mQhhZD/4GVsssboE4kBk98s6xNoZW7g
 2BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678513266;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hBnbrHjdJqCycEaPHLF3SoWIQqolVe0vVU3sGJzdcqg=;
 b=Gy93nXI3BpvoWLzWwD9u7Lm7VxRpe3Jpo7WYmTO+ABK+zxpjjZC20MkqfY2NIHTZ2O
 VjF7mR7/fFY4/q6xj/K4NkqLfI8Z3gH64Tf5aOMIXO4vySLv69og/lGvaBKdy66FdBV3
 0/66WuColuhC9COuc0K9l71JWuhwvxcBSRErdUHfIfci8lxry3bUqqOiH3G1PydCsVgm
 Ag8agLhKrGtV68xnz7cJZB181TOeoKw2EXWfE4OP9BEzFHk54d2HIE15dI/ejJ5nQVZZ
 5FowoUR1atO0si8EZIMf8wdsAodH7FIN7p0FNlLYXq4wMnYlVTJAvjE2u1Xa/BWuRzXN
 Yi0w==
X-Gm-Message-State: AO0yUKWdNoVuc7T/jg93UN5Qd3HOIw8VzVrbpO4lNw8wYgBEwTB3Z0E0
 OFXI7zVIDORPYx2zlFgbnuY=
X-Google-Smtp-Source: AK7set/plVrigjnAHyTng8mFOgTpletal/lAWhwq8z+Al90Y9yMeAfybv5E81mH4i9EeLrrAFNPPTg==
X-Received: by 2002:a05:622a:182a:b0:3bf:cd42:7724 with SMTP id
 t42-20020a05622a182a00b003bfcd427724mr49636710qtc.11.1678513265735; 
 Fri, 10 Mar 2023 21:41:05 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227]) by smtp.gmail.com with ESMTPSA id
 h9-20020ac85e09000000b003ba2a15f93dsm1381649qtx.26.2023.03.10.21.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 21:41:05 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailauth.nyi.internal (Postfix) with ESMTP id 799A327C0054;
 Sat, 11 Mar 2023 00:41:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 11 Mar 2023 00:41:04 -0500
X-ME-Sender: <xms:bhQMZBfymQwN8rpPD2I7inos-RmgCfUvR91xgSJj-Px65DbLzROxRw>
 <xme:bhQMZPPZNhTZ8fqeWdzBYxy5q3nKRCA6MQ5bTsT0vdKXySaD6SMOcUY2A4GfVaF4R
 P1aXaOiW7idfkQaVA>
X-ME-Received: <xmr:bhQMZKh2j4CRc34OgSzc7zD9IHg1IyreWKH49AqSiafOVd15IptlpyxDJn0CFxLtXFlRxuXA21Fntiq7r8iDpGS0_h8QDVZr72c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduledgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
 nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpeefuddvvdelieeguefgveffvdffudeiueejiedvudfhleejgefhgeffveff
 hfekffenucffohhmrghinhepphhtrhdruggvvhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
 shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
 hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:bhQMZK_hc_mxP2PBVZaKsvEYZbv5qnMolvIg5gNaCSbqHa6VYq2CbQ>
 <xmx:bhQMZNsVsl6HnB3_XXn1BcSra2Nh0ZQsFKDSptGHjauurJofQj_idQ>
 <xmx:bhQMZJGsQOI_bpjrAdFslcuZpUS4v9HbNv-4iPwrqzy7x9s5B1Mw2g>
 <xmx:cBQMZNd1EQ9WNauHj_wI5NjKkSljOiZ_2aFgNwPO5npgKD1jkWbpdQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Mar 2023 00:41:02 -0500 (EST)
Date: Fri, 10 Mar 2023 21:41:00 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 02/18] rust: drm: Add Device and Driver abstractions
Message-ID: <ZAwUbAWvPt9aavXp@Boquns-Mac-mini.local>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:25:27PM +0900, Asahi Lina wrote:
> Add the initial abstractions for DRM drivers and devices. These go
> together in one commit since they are fairly tightly coupled types.
> 
> A few things have been stubbed out, to be implemented as further bits of
> the DRM subsystem are introduced.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/drm/device.rs       |  76 +++++++++
>  rust/kernel/drm/drv.rs          | 339 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   2 +
>  4 files changed, 420 insertions(+)
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 2687bef1676f..2a999138c4ae 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,10 +6,13 @@
>   * Sorted alphabetically.
>   */
>  
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/fs.h>
>  #include <linux/ioctl.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/ktime.h>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> new file mode 100644
> index 000000000000..6007f941137a
> --- /dev/null
> +++ b/rust/kernel/drm/device.rs
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM device.
> +//!
> +//! C header: [`include/linux/drm/drm_device.h`](../../../../include/linux/drm/drm_device.h)
> +
> +use crate::{bindings, device, drm, types::ForeignOwnable};
> +use core::marker::PhantomData;
> +
> +/// Represents a reference to a DRM device. The device is reference-counted and is guaranteed to
> +/// not be dropped while this object is alive.
> +pub struct Device<T: drm::drv::Driver> {
> +    // Type invariant: ptr must be a valid and initialized drm_device,
> +    // and this value must either own a reference to it or the caller
> +    // must ensure that it is never dropped if the reference is borrowed.
> +    pub(super) ptr: *mut bindings::drm_device,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: drm::drv::Driver> Device<T> {
> +    // Not intended to be called externally, except via declare_drm_ioctls!()
> +    #[doc(hidden)]
> +    pub unsafe fn from_raw(raw: *mut bindings::drm_device) -> Device<T> {
> +        Device {
> +            ptr: raw,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    #[allow(dead_code)]
> +    pub(crate) fn raw(&self) -> *const bindings::drm_device {
> +        self.ptr
> +    }
> +
> +    pub(crate) fn raw_mut(&mut self) -> *mut bindings::drm_device {
> +        self.ptr
> +    }

Since you can always get a *mut bindings::drm_device safely from

	a.raw() as *mut _

, this mutable version seems unnecesarry to me. In other words, no way
to prevent getting a *mut bindings::drm_device from only &Device.

Regards,
Boqun

> +
> +    /// Returns a borrowed reference to the user data associated with this Device.
> +    pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
> +        unsafe { T::Data::borrow((*self.ptr).dev_private) }
> +    }
> +}
> +
[...]
