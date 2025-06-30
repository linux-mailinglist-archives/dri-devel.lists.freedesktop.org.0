Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D1AEE364
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 18:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2A510E232;
	Mon, 30 Jun 2025 16:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bwOAFjzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67410E232
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751299596;
 bh=K04c3OVn55WWIJlwhBX8hHaUfgghWX+cT61EBJ8XJqE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bwOAFjzzr2QVs2HFWx9HxAfk2c9HX14sFJU3T8ka5rk4z1+4SpnJzM7VtHPpkD5Wn
 jRWeMVD078cSgP2z1A8zZaIjyKdQdi8zrR0HVvBXdTqL8R3Dbfj8KP8pzDC0j5bPPb
 Bzf83c4xnJ35dBanw1DOCdYX94Zie4Pjj5R4qPM04+zmo9wZd/KtaLcbcL3f/3YY5C
 5CccLKCUQ7ibuLD1zv0QDrcWvnQJ0VlCc0k1/QhAsuO4BJEosr/mUB42xsDnSc5e9W
 ZvQqQJ7sQuW/T4eyAXG0KcLlF1Thy6kbovogGTkaxIrepvuA4NFd4fAaUA3wiQbRBB
 cBfAnxD7dpmTg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C052017E09C6;
 Mon, 30 Jun 2025 18:06:35 +0200 (CEST)
Date: Mon, 30 Jun 2025 18:06:31 +0200
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
Message-ID: <20250630180631.5e8066cd@fedora>
In-Reply-To: <aF8lYpK_l2I-ts1k@pollux>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux>
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

On Sat, 28 Jun 2025 01:12:34 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> > +    pub(crate) fn log(&self, pdev: &platform::Device) {
> > +        let major = (self.gpu_id >> 16) & 0xff;
> > +        let minor = (self.gpu_id >> 8) & 0xff;
> > +        let status = self.gpu_id & 0xff;
> > +
> > +        let model_name = if let Some(model) = GPU_MODELS
> > +            .iter()
> > +            .find(|&f| f.major == major && f.minor == minor)
> > +        {
> > +            model.name
> > +        } else {
> > +            "unknown"
> > +        };
> > +
> > +        dev_info!(
> > +            pdev.as_ref(),
> > +            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
> > +            model_name,
> > +            self.gpu_id >> 16,
> > +            major,
> > +            minor,
> > +            status
> > +        );
> > +
> > +        dev_info!(
> > +            pdev.as_ref(),
> > +            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
> > +            self.l2_features,
> > +            self.tiler_features,
> > +            self.mem_features,
> > +            self.mmu_features,
> > +            self.as_present
> > +        );
> > +
> > +        dev_info!(
> > +            pdev.as_ref(),
> > +            "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
> > +            self.shader_present,
> > +            self.l2_present,
> > +            self.tiler_present
> > +        );
> > +
> > +        dev_info!(
> > +            pdev.as_ref(),
> > +            "PA bits: {}, VA bits: {}",
> > +            self.pa_bits(),
> > +            self.va_bits()
> > +        );
> > +    }  
> 
> This is called from probe() and seems way too verbose for dev_info!(), please
> use dev_dbg!() instead.

We do have the same level of verbosity in Panthor, and it's proven
useful when people are filling bug reports. Asking them to reload
the module with debug prints enabled is kinda annoying, and I don't
think I've heard anyone complaining that this was too verbose or slowing
down the boot, so I'd be tempted to keep it like that, and least for
the information printed in this function.
