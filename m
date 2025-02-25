Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D830A44ED8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B3B10E7F5;
	Tue, 25 Feb 2025 21:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h7TGGKsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25910E7F4;
 Tue, 25 Feb 2025 21:28:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC2F45C51B7;
 Tue, 25 Feb 2025 21:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB825C4CEE2;
 Tue, 25 Feb 2025 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740518900;
 bh=tGjkofuEIivMoNaX8ssUQFzlcHymMjbHgcL8gzhpL3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7TGGKsfCTkJdmSxZyRzaIDKpvWNjnL3R7TEVJUivR4JCbODKEeqJw7UN/PPUtztn
 mlRPt91uG9cDeszd6o3qwUi8uN9DGg2aLNc0tYisW1CgDoX2fANrKVlU3a1OCbV2X8
 mPReHSf2MUeCu+1G/i0TOz7/clTaAjUzubo7Gt4d2jMnXZKFz1otlfk8sgT0012itq
 XVbXOTJADBf1FPWINL/nLE7jSvyHVuXSTHTsP3sRYfsXbk/cFElbRcgLWLRF6LF9Ex
 l/WF6LeZWWty+OTCeSpDbny0CE8wgsUBFXNU7z55SNMWiKYt3Fu5HiEJdDpO9dPaPW
 MGCRv3vngc8Fw==
Date: Tue, 25 Feb 2025 22:28:08 +0100
From: Ingo Molnar <mingo@kernel.org>
To: linux@treblig.org, Andrew Morton <akpm@linux-foundation.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, x86@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier
Message-ID: <Z7416P1rZPNMHQq7@gmail.com>
References: <20241225175010.91783-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225175010.91783-1-linux@treblig.org>
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


* linux@treblig.org <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> removed in 2017 by
> commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> intel_uncore_forcewake_reset()")
> 
> Remove it.
> 
> Note the '_unlocked' version is still used.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  arch/x86/include/asm/iosf_mbi.h      |  7 -------
>  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
>  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
>  3 files changed, 26 deletions(-)

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
