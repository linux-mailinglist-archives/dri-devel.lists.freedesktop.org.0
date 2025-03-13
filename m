Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD36EA5FCC3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B2010E8F8;
	Thu, 13 Mar 2025 16:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pwSeryW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE9810E8F8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:58:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8293EA477B9;
 Thu, 13 Mar 2025 16:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9B1C4CEDD;
 Thu, 13 Mar 2025 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741885106;
 bh=jJPD3iDu/7Avldh6k6MrUF1w+kcGOzq9GackaM0qxcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pwSeryW5DS+4QEguqURPfb/JnuwqDn+l1Fv9r4CsUSNCO1VRThyuZ1jmvfZwbx4x1
 9BMbb6hC1al1Cbn0XcneZZW0QLZBRvBkygPbeLYxd3U0yk6NppemFsds4hJ4roPz2i
 nsXy7HCLwph7uUpv40MSHumiA620PY86Rul/cXsqf5tw6l9dHwaIabpvx20QoF9j+R
 coVX5d+GiZSvvYZ6bZ4U3JI+ZCkLXpuF+j7t7grRQkel03qA39wi/ZnSnl/M6klE5r
 sd229BxDF2gkCMDLDuM9i/ihyxcs73o4mssY4Fpj8UuTFzVf2VHLPjOUzbe8XAK0DW
 PjczxkLa1dQYA==
Date: Thu, 13 Mar 2025 17:58:19 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Kosina <jikos@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Julius Zint <julius@zint.sh>
Subject: Re: [PATCH RFC 2/3] rust: hid: USB Monitor Control Class driver
Message-ID: <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c>
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-5-sergeantsagara@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313160220.6410-5-sergeantsagara@protonmail.com>
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

On Mar 13 2025, Rahul Rameshbabu wrote:
> This code will eventually contain the logic needed to drive the backlight
> of displays that implement the USB Monitor Control Class specification.
> Examples include the Apple Studio Display and Apple Pro Display XDR
> monitors. USB Monitor Control Class encompasses more than just backlight
> control, so the driver could be further extended as monitors support more
> functionality in the specification.
> 
> This code is a skeleton currently, where the focus right now is on the core
> Rust API. The driver skeleton was written before approaching the Rust API
> and C binding work. This was done to provide a guide for what the Rust API
> should look like and avoid any rough C binding work from being exposed to
> Rust HID device drivers.

skeletons are good for documentation, but not really for code review as
they can not compile.

You should make this patch part of a documentation in
Documentation/hid/, and squash it with the next one (having a minimal
full driver instead of skeleton+fill in the voids).

Cheers,
Benjamin

> 
> To go forward with this driver for the purpose of external monitor
> backlight control, a new DRM backlight API that is scoped per connector
> will be required. I am currently in the process of developing this new API.
> I document the details in my related blog posts. The issue with the current
> backlight API is it was designed on the assumption that only internal
> panels have controllable backlights. Using this assumption combined with
> another that there can only ever be a single internal panel, having more
> than one device register with the backlight interface would confuse
> userspace applications.
> 
> Julius Zint originally tried to implement such a driver a bit more than a
> year ago with a C driver but was blocked by the limitations of the
> backlight API. I asked him for permission to continue the work in Rust
> while accrediting him for the HID report parsing logic for the backlight
> support in the USB Monitor Control Class specification.
> 
> Cc: Julius Zint <julius@zint.sh>
> Link: https://lore.kernel.org/lkml/20230820094118.20521-1-julius@zint.sh/
> Link: https://binary-eater.github.io/posts/linux_usb_monitor_control/
> Link: https://www.usb.org/sites/default/files/usbmon11.pdf
> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
> ---
>  drivers/hid/Kconfig                |  8 +++++++
>  drivers/hid/Makefile               |  1 +
>  drivers/hid/hid_monitor_control.rs | 37 ++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 drivers/hid/hid_monitor_control.rs
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index e085964c7ffc..92be13acb956 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -722,6 +722,14 @@ config RUST_HID_ABSTRACTIONS
>  	Adds support needed for HID drivers written in Rust. It provides a
>  	wrapper around the C hid core.
>  
> +config HID_MONITOR_CONTROL
> +	tristate "USB Monitor Control Class support"
> +	depends on USB_HID
> +	depends on RUST_HID_ABSTRACTIONS
> +	help
> +	Say Y here if you want to enable control over a monitor that uses USB
> +	Monitor Control Class.
> +
>  config HID_REDRAGON
>  	tristate "Redragon keyboards"
>  	default !EXPERT
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 482b096eea28..bf8b096bcf23 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_HID_MCP2221)	+= hid-mcp2221.o
>  obj-$(CONFIG_HID_MAYFLASH)	+= hid-mf.o
>  obj-$(CONFIG_HID_MEGAWORLD_FF)	+= hid-megaworld.o
>  obj-$(CONFIG_HID_MICROSOFT)	+= hid-microsoft.o
> +obj-$(CONFIG_HID_MONITOR_CONTROL)	+= hid_monitor_control.o
>  obj-$(CONFIG_HID_MONTEREY)	+= hid-monterey.o
>  obj-$(CONFIG_HID_MULTITOUCH)	+= hid-multitouch.o
>  obj-$(CONFIG_HID_NINTENDO)	+= hid-nintendo.o
> diff --git a/drivers/hid/hid_monitor_control.rs b/drivers/hid/hid_monitor_control.rs
> new file mode 100644
> index 000000000000..18afd69a56d5
> --- /dev/null
> +++ b/drivers/hid/hid_monitor_control.rs
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Rahul Rameshbabu <sergeantsagara@protonmail.com>
> +
> +use kernel::prelude::*;
> +use kernel::hid::{
> +    self,
> +    Driver,
> +};
> +
> +struct HidMonitorControl;
> +
> +#[vtable]
> +impl Driver for HidMonitorControl {
> +    fn probe(dev: &mut hid::Device, id: &hid::DeviceId) -> Result<()> {
> +        /* TODO implement */
> +        Ok(())
> +    }
> +
> +    fn remove(dev: &mut hid::Device) {
> +        /* TODO implement */
> +    }
> +}
> +
> +kernel::module_hid_driver! {
> +    driver: HidMonitorControl,
> +    id_table: [
> +        kernel::usb_device! {
> +            vendor: /* TODO fill in */,
> +            product: /* TODO fill in */,
> +        },
> +    ],
> +    name: "monitor_control",
> +    author: "Rahul Rameshbabu <sergeantsagara@protonmail.com>",
> +    description: "Driver for the USB Monitor Control Class",
> +    license: "GPL",
> +}
> -- 
> 2.47.2
> 
> 
