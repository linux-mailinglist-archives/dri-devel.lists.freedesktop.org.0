Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277DAEF2CC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F21910E575;
	Tue,  1 Jul 2025 09:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XiY0mipX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCE210E575
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751361070;
 bh=rAIL7P5+qgQNxK6HoIqMiX8Nk+ttOzK/4HLG7PIlpec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XiY0mipXyPR5TGdzWUzCkYtMFOFA9XsLStZoUjZL6EMse9DdrVrca8Mrd7cE0DmW8
 wmR0+Lb8y590XdxthIJQGP75zQY79S1hOMPK8tUOEmBEH2hnvgXBjDMZD14edIiTGP
 MixfqPrVmDwiu62qP91NCqC2GKBMj8gjtY38Ky1Rgb1x9zKnk592Cx3gbT+g2SKBs9
 iWx5Qiy9TfHTeP9t5sZU6TUn6f9s6/piHke1BNvMh5C4b6BmTSyHztDWtqU6wVvR1X
 9wMY6c4jgyuZ9k0Lv6K3X0kk6aF8564rKmR1kEX7ev11LcKdz924p51PF/JVuv8LsB
 kcYT9taBGpgVg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DAC417E0342;
 Tue,  1 Jul 2025 11:11:09 +0200 (CEST)
Date: Tue, 1 Jul 2025 11:11:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Daniel Stone <daniels@collabora.com>, Rob
 Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>, Beata
 Michalska <beata.michalska@arm.com>, Carsten Haitzler
 <carsten.haitzler@foss.arm.com>, Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <20250701111103.728ef3d7@fedora>
In-Reply-To: <e64c20ae-5aaf-44cf-a463-c7eb1134daee@kernel.org>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux> <20250630180631.5e8066cd@fedora>
 <e64c20ae-5aaf-44cf-a463-c7eb1134daee@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Mon, 30 Jun 2025 18:12:02 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On 6/30/25 6:06 PM, Boris Brezillon wrote:
> > On Sat, 28 Jun 2025 01:12:34 +0200
> > Danilo Krummrich <dakr@kernel.org> wrote:
> >   
> >>> +    pub(crate) fn log(&self, pdev: &platform::Device) {
> >>> +        let major = (self.gpu_id >> 16) & 0xff;
> >>> +        let minor = (self.gpu_id >> 8) & 0xff;
> >>> +        let status = self.gpu_id & 0xff;
> >>> +
> >>> +        let model_name = if let Some(model) = GPU_MODELS
> >>> +            .iter()
> >>> +            .find(|&f| f.major == major && f.minor == minor)
> >>> +        {
> >>> +            model.name
> >>> +        } else {
> >>> +            "unknown"
> >>> +        };
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
> >>> +            model_name,
> >>> +            self.gpu_id >> 16,
> >>> +            major,
> >>> +            minor,
> >>> +            status
> >>> +        );
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
> >>> +            self.l2_features,
> >>> +            self.tiler_features,
> >>> +            self.mem_features,
> >>> +            self.mmu_features,
> >>> +            self.as_present
> >>> +        );
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
> >>> +            self.shader_present,
> >>> +            self.l2_present,
> >>> +            self.tiler_present
> >>> +        );
> >>> +
> >>> +        dev_info!(
> >>> +            pdev.as_ref(),
> >>> +            "PA bits: {}, VA bits: {}",
> >>> +            self.pa_bits(),
> >>> +            self.va_bits()
> >>> +        );
> >>> +    }  
> >>
> >> This is called from probe() and seems way too verbose for dev_info!(), please
> >> use dev_dbg!() instead.  
> > 
> > We do have the same level of verbosity in Panthor, and it's proven
> > useful when people are filling bug reports. Asking them to reload
> > the module with debug prints enabled is kinda annoying, and I don't
> > think I've heard anyone complaining that this was too verbose or slowing
> > down the boot, so I'd be tempted to keep it like that, and least for
> > the information printed in this function.  
> 
> Yeah, I think for the GPU revision bits that's reasonable, but do you really
> also need the other prints to be dev_info()? Don't you know this information
> from the combination of the GPU revision bits and the kernel version?

Sure, we could have a tool extracting most of that from the driver info
and DEV_QUERY ioctl(), but those info have been printed in Panfrost
since the early days. I picked those traces up in Panthor because devs
were used to it, and I honestly see no good reason to not print those as
dev_info() in Tyr too. What's your concern here? Is this about boot
time, not bloating the kernel logs or something else? I mean, we're
talking about less than 10 lines printed at boot/module-load-time.
