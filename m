Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PKuI7cEg2njggMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:35:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2590E3320
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480010E551;
	Wed,  4 Feb 2026 08:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gnviAn8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B210E551
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770194097;
 bh=S539VUjPKJOISaRuCvVzZgVIORN48iX4j7g9m1M/SUA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gnviAn8VOpCQvAbz+CFRxQypz7qvcpfjOb2G2wJRWOh/+lMebqB5hk83JLnqsQJ1S
 zWnIzMxhynU9qrALblyY56qJ/2A+PAGpZLX+uyw8UtzOynUioZf3UmBdjiMri6KXzN
 eFO8yHoYxzP5ZaDzJLz8Y4hWql0BJUJBCmHSv1JvJL9oSPZDZFoGH38Xmd6W9Hjqnp
 a1kGqR8zY1r2P29KKmhLcTchLYj/bPc5emTgX2Z/cCCDUJrNInZ39T+++IRq87Lr9P
 B+lhlY++yuvP4guImejnwA0WodXh0P1Dbi37G1Vt8UREoI0H9IUnvo9zXV9xvw7Q8J
 WeuPWB75z966w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BEDE117E0E90;
 Wed,  4 Feb 2026 09:34:56 +0100 (CET)
Date: Wed, 4 Feb 2026 09:34:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com
Subject: Re: [PATCH] drm/tyr: Use vertical style for imports
Message-ID: <20260204093453.1b5130d0@fedora>
In-Reply-To: <20260204013331.427210-1-deborah.brouwer@collabora.com>
References: <20260204013331.427210-1-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D2590E3320
X-Rspamd-Action: no action

On Tue,  3 Feb 2026 17:33:31 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently Tyr uses rustfmt style for imports, but the kernel uses a
> vertical layout that makes it easier to resolve conflicts and rebase.
> 
> Import guidelines are documented here:
> 	https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
> Change all of Tyr's imports to use the vertical layout. This will
> ease the introduction of additional Tyr patches upstream.
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 62 ++++++++++++++++++++---------------
>  drivers/gpu/drm/tyr/file.rs   | 18 ++++++----
>  drivers/gpu/drm/tyr/gem.rs    | 13 +++++---
>  drivers/gpu/drm/tyr/gpu.rs    | 38 ++++++++++++---------
>  drivers/gpu/drm/tyr/regs.rs   | 14 +++++---
>  5 files changed, 88 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 568cb89aaed8..46b65e004a15 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -1,31 +1,41 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use kernel::clk::Clk;
> -use kernel::clk::OptionalClk;
> -use kernel::device::Bound;
> -use kernel::device::Core;
> -use kernel::device::Device;
> -use kernel::devres::Devres;
> -use kernel::drm;
> -use kernel::drm::ioctl;
> -use kernel::io::poll;
> -use kernel::new_mutex;
> -use kernel::of;
> -use kernel::platform;
> -use kernel::prelude::*;
> -use kernel::regulator;
> -use kernel::regulator::Regulator;
> -use kernel::sizes::SZ_2M;
> -use kernel::sync::aref::ARef;
> -use kernel::sync::Arc;
> -use kernel::sync::Mutex;
> -use kernel::time;
> -
> -use crate::file::File;
> -use crate::gem::TyrObject;
> -use crate::gpu;
> -use crate::gpu::GpuInfo;
> -use crate::regs;
> +use kernel::{
> +    clk::{
> +        Clk,
> +        OptionalClk, //
> +    },
> +    device::{
> +        Bound,
> +        Core,
> +        Device, //
> +    },
> +    devres::Devres,
> +    drm,
> +    drm::ioctl,
> +    io::poll,
> +    new_mutex,
> +    of,
> +    platform,
> +    prelude::*,
> +    regulator,
> +    regulator::Regulator,
> +    sizes::SZ_2M,
> +    sync::{
> +        aref::ARef,
> +        Arc,
> +        Mutex, //
> +    },
> +    time, //
> +};
> +
> +use crate::{
> +    file::File,
> +    gem::TyrObject,
> +    gpu,
> +    gpu::GpuInfo,
> +    regs, //
> +};
>  
>  pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
>  
> diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
> index 0ef432947b73..48bff4476d74 100644
> --- a/drivers/gpu/drm/tyr/file.rs
> +++ b/drivers/gpu/drm/tyr/file.rs
> @@ -1,12 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use kernel::drm;
> -use kernel::prelude::*;
> -use kernel::uaccess::UserSlice;
> -use kernel::uapi;
> -
> -use crate::driver::TyrDevice;
> -use crate::TyrDriver;
> +use kernel::{
> +    drm,
> +    prelude::*,
> +    uaccess::UserSlice,
> +    uapi, //
> +};
> +
> +use crate::{
> +    driver::TyrDevice,
> +    TyrDriver, //
> +};
>  
>  #[pin_data]
>  pub(crate) struct File {}
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 1273bf89dbd5..8f2d23e3c093 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -1,9 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use crate::driver::TyrDevice;
> -use crate::driver::TyrDriver;
> -use kernel::drm::gem;
> -use kernel::prelude::*;
> +use kernel::{
> +    drm::gem,
> +    prelude::*, //
> +};
> +
> +use crate::driver::{
> +    TyrDevice,
> +    TyrDriver, //
> +};
>  
>  /// GEM Object inner driver data
>  #[pin_data]
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index bfbf2a1d80e6..affca5b0dc6c 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -1,20 +1,28 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use core::ops::Deref;
> -use core::ops::DerefMut;
> -use kernel::bits::genmask_u32;
> -use kernel::device::Bound;
> -use kernel::device::Device;
> -use kernel::devres::Devres;
> -use kernel::io::poll;
> -use kernel::platform;
> -use kernel::prelude::*;
> -use kernel::time::Delta;
> -use kernel::transmute::AsBytes;
> -use kernel::uapi;
> -
> -use crate::driver::IoMem;
> -use crate::regs;
> +use core::ops::{
> +    Deref,
> +    DerefMut, //
> +};
> +use kernel::{
> +    bits::genmask_u32,
> +    device::{
> +        Bound,
> +        Device, //
> +    },
> +    devres::Devres,
> +    io::poll,
> +    platform,
> +    prelude::*,
> +    time::Delta,
> +    transmute::AsBytes,
> +    uapi, //
> +};
> +
> +use crate::{
> +    driver::IoMem,
> +    regs, //
> +};
>  
>  /// Struct containing information that can be queried by userspace. This is read from
>  /// the GPU's registers.
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index f46933aaa221..a7672fffbba5 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -7,11 +7,15 @@
>  // does.
>  #![allow(dead_code)]
>  
> -use kernel::bits::bit_u32;
> -use kernel::device::Bound;
> -use kernel::device::Device;
> -use kernel::devres::Devres;
> -use kernel::prelude::*;
> +use kernel::{
> +    bits::bit_u32,
> +    device::{
> +        Bound,
> +        Device, //
> +    },
> +    devres::Devres,
> +    prelude::*, //
> +};
>  
>  use crate::driver::IoMem;
>  

