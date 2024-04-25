Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F78B24F2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6B511A54B;
	Thu, 25 Apr 2024 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="f3Ob8V05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015AE11A54B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:22:08 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C72B740E01C5; 
 Thu, 25 Apr 2024 15:22:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zo89ggfrjeLT; Thu, 25 Apr 2024 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1714058521; bh=6wNh2/5WJqAiPo6RPMCDTroIUccA+3uUajnQfIANALw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3Ob8V057rdVSck90A83wZXeph/7GtAdQYLuTScSMYcMsRlDy322GITOZB08R+2zH
 WJAQPRKWgI6rGP5DekauVZRYVC6v+x0djmLHr4YM5x8Sn+yE6qw1+Tuw/dFLoxEgMt
 O4WWlkpuAoNiMRBJIWn6gaOqdtb0+P14QGl5fOYzlw1cGRu1xYEGnL3uxMdJKaBuJg
 R2OzjcscwRkLGZGJ3L9V1kttt6yFvrs+wGpvAlQIdZqVA1JLfMMFfr74b67uvPbPRS
 61vpzoxHqCtIK3bBjCPcbv3xBolTUaMjEqobmzgwaMNEViuOPbwbZLkVTaKtxPomon
 3wS2TjSW3M4l/KPIhyPrbevzhE8yRvOBxhxxkhaB0armH29aAtv0vcphTaf+tTHM8k
 69IEcBdf6tdGFrOUOn41HjjaBQyB0AtllH4DNANzvv/oerKUqq4NZ3AbGUpnosCefQ
 SAsCoJR+lxGWQL67jAC4kRYHVm12uzQyPEE0QCcHZbba2O+TG2976Zb9N7UsemohsT
 I9Y9qSmIgHdiLXC0hpawtrmiSpZ8y80rSue9T0oeWT5mdgSp2JwtFEfPzdeMkPY1Jv
 YTBrtpi4DOkMmVnoT1dzUQF30BsuCRgLfSnbYez9K4Kdomax740C14p2fW3I3gfpbh
 DxbQwYxgvWIRX+kxSk0WuNpo=
Received: from zn.tnic (pd953020b.dip0.t-ipconnect.de [217.83.2.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3D3DB40E0192;
 Thu, 25 Apr 2024 15:21:36 +0000 (UTC)
Date: Thu, 25 Apr 2024 17:21:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de, x86@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: Re: [PATCH v9 1/8] x86/vmware: Correct macro names
Message-ID: <20240425152130.GJZip0-l040XCyUapN@fat_crate.local>
References: <adcbfb9a-a4e1-4a32-b786-6c204d941e9f@broadcom.com>
 <20240424231407.14098-1-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424231407.14098-1-alexey.makhalov@broadcom.com>
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

On Wed, Apr 24, 2024 at 04:14:06PM -0700, Alexey Makhalov wrote:
> VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
> These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
> Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
> operation to the macro body.

I don't understand:

$ git grep GETVCPU_INFO
arch/x86/kernel/cpu/vmware.c:51:#define VMWARE_CMD_GETVCPU_INFO  68
arch/x86/kernel/cpu/vmware.c:478:       VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);

so that's a VMWARE_CMD 68, at least the prefix says so.

And those two are *bits* in that eax which that hypercall returns.

Or are those two bits generic but defined in a vmware-specific
hypercall?

Hm.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
