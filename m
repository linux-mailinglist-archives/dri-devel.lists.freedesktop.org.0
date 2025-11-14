Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D7C5BFE7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADED710E9C9;
	Fri, 14 Nov 2025 08:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LoktKZZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0510E9C9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:31:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BEA96440EE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99478C116D0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763109086;
 bh=9sRdpBAr4pDaJQu+063L/ZRDghjYzUJdvKL0rCJ8ZHc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LoktKZZDyRF2oDG5GUkgHfu8u1iHRFVQUrtgmtb3z6OzPFt/nUwkSy2UCGAn1BLmK
 3iPXjkEQmMjFkgM+HqO0z2/+yrcyr0IWdELCkO1pM/IBa6hD7+HEmohH/y+OurGYPU
 7U+bW7OaNWmZ9m111HgB64Rcd+PPd96cXHdZXf+oA+g1zFWv5AR7DqolAu9xAw22+4
 L7L0mzJySLQGDO+ZDtO4N7SRpUEjiF/NgV8IvmHO80EZUUFVze19Jok5yZ+FiCbKhH
 7ZUIpO9nV8EcdwqjHI0P9rORy4fJSdGlTDC202HaZHSYncCuX0ky3PfTllb6aud9SX
 00GkwnMG10sMA==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5957f0218a1so1692187e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 00:31:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUwt28znUFKiaZ/WERNA2W0vXniBUIOSmkXNLROFlcD1YAuTkMTtx7qO/lLWhCPsgD5wVSYZQ+UOlY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcfXc6ae+IqxxyCTUgypIVCD/6ZG2fNNYEIalmsJNquq092Y7D
 eipWbpDkYsNtok0ZDjhVksfTcBUOoitAs5HCGPFu/rIsyc2TT7HCYMq9v9SUQ5ErdMUoZP6PkEb
 f6P5qv6lhsfFgxdIURcpHD+HXWh1x4M0=
X-Google-Smtp-Source: AGHT+IHzr7Xwl7I0m+u0V85alnzAW8nT8AHpkZb/Gxdntf82JYxBf88U8NTonQ+/GM+9LzXCaNrnd2wtLCgNfae0FyQ=
X-Received: by 2002:a05:6512:3e02:b0:594:34ae:1446 with SMTP id
 2adb3069b0e04-5958424f6a9mr738219e87.41.1763109084959; Fri, 14 Nov 2025
 00:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20251015160816.525825-1-tzimmermann@suse.de>
In-Reply-To: <20251015160816.525825-1-tzimmermann@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 09:31:13 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF62pEMUJAM12HnF7qMt5xhZaZXpPoMdebMUKCfoAYisQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmiovAl4gWxXpIwmfqjjRg_to99axyg_4XeQaLxrb5VrHGw7cpY_DeO3qU
Message-ID: <CAMj1kXF62pEMUJAM12HnF7qMt5xhZaZXpPoMdebMUKCfoAYisQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] efi: x86: Provide EDID from GOP device
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jonathan@marek.ca, javierm@redhat.com, linux-efi@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 15 Oct 2025 at 18:08, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Add support for EFI_EDID_ACTIVE_PROTOCOL and EFI_EDID_DISCOVERED_PROTOCOL
> on x86. Refactor the GOP helpers for EDID support, then retrieve the EDID
> into x86 boot_params.
>
> Later boot code copies the EDID from the boot parameters into the global
> variable edid_info. Graphics drivers, such as efidrm, can pick up the
> information from there. In the case of efidrm, it provides the EDID to
> user-space compositors, which use it for improved QoS on the display
> output. Similar functionality is already available on old VESA systems
> with vesadrm.
>
> Tested on x86 EFI systems.
>
> Another patch is required to provide EDID on non-x86 systems via the
> generic EFI stub. The implementation can directly build upon this
> series.
>
> Thomas Zimmermann (5):
>   efi: Fix trailing whitespace in header file
>   efi/libstub: gop: Find GOP handle instead of GOP data
>   efi/libstub: gop: Initialize screen_info in helper function
>   efi/libstub: gop: Add support for reading EDID
>   efi/libstub: x86: Store EDID in boot_params
>

Hi,

Apologies for the delay. This series looks fine to me, although I
would prefer it if we could make things a bit more generic?

Everything you are adding here is arch-agnostic, except for the bit
where we use x86-specific plumbing to pass the EDID info between the
EFI stub and the core kernel.

More specifically, could we do the following:
- move struct edid_info edid_info into common code
- pass the detected EDID info block via a EFI config table instead of
boot_params
- make CONFIG_FIRMWARE_EDID depend on (X86 || EFI_STUB)
