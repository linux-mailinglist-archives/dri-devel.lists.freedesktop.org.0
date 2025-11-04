Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF89C319AE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FA510E619;
	Tue,  4 Nov 2025 14:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SIMn1mOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2479C10E615;
 Tue,  4 Nov 2025 14:48:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 222A3601EC;
 Tue,  4 Nov 2025 14:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F802C116B1;
 Tue,  4 Nov 2025 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762267697;
 bh=xCBxlDXzIhVQ/B7058fyymHUafvIparv+hEqSxtneH0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=SIMn1mOQrQQxcwiBwuWqP29ydZ+FP6EcFaa3okcvWYTrLLh4dqx1Aat7xwUVxgxP0
 auydmpD+uvywmyro/TOJ9RZhvxObN1EV6F83xQErcgMXXiRUc2Uwl4SQDZE+kIQItk
 bdVmf3q3inpKZN3kfVXj06HMZAYUfhzGptBS36PkdxxrGaIBWjgkrKpRMVHhRlHX0d
 E2QCMTyie6s5pamvD/LI5E4V8QktSmB7hH7sB0v+HDD1MyWns7fHxF05+izv/ZK/Lg
 HP3m4oD3DqawLom/Qt8t+yXEPUPfxdO0RgXv2csT0YxvTNkgEM/A6orgH+LfIRcH4x
 ut3EPx4B99UXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 15:48:10 +0100
Message-Id: <DDZZRCRHBLVI.MGWBUONLZ94K@kernel.org>
Subject: Re: [PATCH] firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS
 select FW_LOADER
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrew
 Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>, "Russell
 King" <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251104-b4-select-rust-fw-v1-1-afea175dba22@nvidia.com>
 <2025110407-scouting-unpiloted-39f4@gregkh>
In-Reply-To: <2025110407-scouting-unpiloted-39f4@gregkh>
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

On Tue Nov 4, 2025 at 3:35 PM CET, Greg Kroah-Hartman wrote:
> On Tue, Nov 04, 2025 at 11:04:49PM +0900, Alexandre Courbot wrote:
>> diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmwar=
e_loader/Kconfig
>> index 752b9a9bea03..15eff8a4b505 100644
>> --- a/drivers/base/firmware_loader/Kconfig
>> +++ b/drivers/base/firmware_loader/Kconfig
>> @@ -38,7 +38,7 @@ config FW_LOADER_DEBUG
>>  config RUST_FW_LOADER_ABSTRACTIONS
>>  	bool "Rust Firmware Loader abstractions"
>>  	depends on RUST
>> -	depends on FW_LOADER=3Dy
>> +	select FW_LOADER
>
> Please no, select should almost never be used, it causes hard-to-debug
> issues.

I agree that select can be very annoying at times, but in this case it seem=
s to
be the correct thing to do?

For instance for something like:

	config MY_DRIVER
		depends on PCI
		depends on DRM
		select AUXILIARY_BUS
		select FW_LOADER

In this case MY_DRIVER is only available if PCI and DRM is enabled, which m=
akes
sense, there is no reason to show users PCI and DRM drivers if both are
disabled.

However, for things like AUXILIARY_BUS and FW_LOADER, I'd argue that they a=
re
implementation details of the driver and should be selected if the driver i=
s
selected.

Otherwise, wouldn't we expect users to know implementation details of drive=
rs
before being able to select them?
