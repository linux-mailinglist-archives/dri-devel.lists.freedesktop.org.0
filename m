Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B2AD3102
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDC310E4C9;
	Tue, 10 Jun 2025 08:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cfOIb8NO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36B110E4BB;
 Tue, 10 Jun 2025 08:58:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F2E98A51024;
 Tue, 10 Jun 2025 08:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A436C4CEED;
 Tue, 10 Jun 2025 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749545882;
 bh=cFuJa1MbaQff0D7/bg5dOYx+v1MxdgpT1Fbr8faIue8=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=cfOIb8NOcXGU/mySXLxZkDRzL5vdr78k1PL0AQIb6in8sw9/Q/pNhYrpJKrOtgOMn
 c/fYLdNp8wf8zizDUB//BynCOy0f2+lToIYd1bZVffz673hKoY6zWgkX9EH0Y7Mde0
 SMNn2/8E2XrJCOXaIl8e/E7kyKGSrfQv5B86uhtLIQ5Fob+HMnLokFhbJwXboRxAmo
 IruBZ/WmEqUxDNta+rNrXxngd2itlzd6Q/ubdNZTv4MZ0cjuGmqvq6KIHTGKRvRAeN
 jCoiBQvU7orzJj01HBDY7e0JzP/LoJlqNUfmp58Ku9xQBfGnRJjhAy+A3tyVXzpgXd
 karynLUNxTcJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 10:57:54 +0200
Message-Id: <DAIQ9342ZFYD.3VQVI80A18HKX@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: module: remove deprecated author key
From: "Benno Lossin" <lossin@kernel.org>
To: "Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <dakr@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <mcgrof@kernel.org>, <russ.weight@linux.dev>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <leitao@debian.org>,
 <gregkh@linuxfoundation.org>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <fujita.tomonori@gmail.com>,
 <tamird@gmail.com>, <igor.korotin.linux@gmail.com>,
 <walmeida@microsoft.com>, <anisse@astier.eu>
X-Mailer: aerc 0.20.1
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>
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

On Mon Jun 9, 2025 at 2:22 PM CEST, Guilherme Giacomo Simoes wrote:
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 618632f0abcc..f405d7a99c28 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -13,7 +13,7 @@
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
>      name: "NovaCore",
> -    author: "Danilo Krummrich",
> +    authors: ["Danilo Krummrich"],

Unrelated to this change, I think we should add email addresses to
people in authors. Possibly enforce it by scanning each author element
and checking if there is an email address.

>      description: "Nova Core GPU driver",
>      license: "GPL v2",
>      firmware: [],
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 2494c96e105f..ed2fc20cba9b 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -181,7 +181,7 @@ unsafe impl Sync for Firmware {}
>  /// module! {
>  ///    type: MyModule,
>  ///    name: "module_firmware_test",
> -///    author: "Rust for Linux",
> +///    authors: ["Rust for Linux"],

We would need to special case "Rust for Linux Developers" or something
similar. But in several cases -- such as this one, we should just name
the actual authors.

What do you guys think?

---
Cheers,
Benno
