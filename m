Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA3CB8B82
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A5510E343;
	Fri, 12 Dec 2025 11:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/jCAW6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9D10E2D2;
 Fri, 12 Dec 2025 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765539298; x=1797075298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V/5HlzE1NuHFzsLgqkIzXv//Qw55rsgi9PmHGj+rRw4=;
 b=c/jCAW6G9vj4mu2WZCpB0PYZA+BzLtZJQzCgVwFqKZthbpJ56C53WRnS
 ILuYuN9uGvssMdbOKHigTDd3n/nrU8b4gCphYyNL5F5oCSlsrVSTvpICV
 akU8hSDwLe2tc/Clc2FXBme/7e9DPb85XnWF/NGI2vwFKQTUVqVdQ3a57
 Zaj57F+BO4w35PjFcF8VQxp7jxfcXsOBCx12u7N8f6ElVV3mmypTh5N6b
 r+D7+ObaDzFAZmsaFtKAEGkIfIFnbUUqv3aF8bTFDEOwwZu2J7KAZt6Fe
 yesAq28ftNhgJ0jYmYmP5mcGLkQinMsB50znnNC6gv/wEoPHU2YhGwZ9N w==;
X-CSE-ConnectionGUID: ZD599fVfRPCsiYV4Fel6fw==
X-CSE-MsgGUID: 1irplVKgQ5SiKMSOG1AtkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78172895"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78172895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:34:58 -0800
X-CSE-ConnectionGUID: 6wV0L8zxSxqNhlZ90DmX8g==
X-CSE-MsgGUID: LBPYg4MXTXuqBtVkVVx1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197130559"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:34:56 -0800
Date: Fri, 12 Dec 2025 13:34:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Steve Wahl <steve.wahl@hpe.com>
Subject: Re: vgaarb, and bridges not capable of VGA forwarding
Message-ID: <aTv93a2Sqpj88Low@intel.com>
References: <f5069152-3cb7-459e-9727-f5a25256fd9c@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5069152-3cb7-459e-9727-f5a25256fd9c@hogyros.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Dec 11, 2025 at 11:43:13PM +0900, Simon Richter wrote:
> Hi,
> 
> (cc Steve Wahl because UV BIOS is tangentially involved)
> (cc Ville Syrjala because of the recent thread about VGA arbiter)
> 
> I'm looking into
> 
>      https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
> 
> again because I have a similar problem.
> 
> In pci_set_vga_state, we traverse the PCI bridges upwards, and set the 
> VGA forwarding bit on all of them up to the root. Now I happen to have a 
> root bridge that refuses to set this bit, so if I read it back after 
> setting it, it is still unset.
> 
> TTBOMK, that is allowed in the PCI specification, and the correct way to 
> indicate that a bridge cannot forward VGA accesses.
> 
> The smallest possible change is to read back the bridge control 
> register, and if the bit is still unset, terminate the loop and return 
> an error.
> 
> I'm trying to find out now if this is a good idea, and am a bit puzzled:
> 
> It appears the only place that can generate errors is 
> pci_set_vga_state_arch, which is a dispatch mechanism with a single 
> user, uv_bios_set_legacy_vga_target.
> 
> According to the comment, the errors generated here are -EINVAL, -ENOSYS 
> and -EBUSY. The implementation returns the return value from an EFI 
> call, which appears to be defined to be a negated POSIX errno number, so 
> this has a high chance of being correct.
> 
> If pci_set_vga_state_arch does not return an error, the normal 
> pci_set_vga_state function runs, and there is no way for the arch 
> specific function to indicate that the rest of the function should not 
> run. Is that intentional, or should the BIOS call replace the normal 
> implementation?
> 
> It also seems that vgaarb is the only caller, and it does not look at 
> the return value from this function. So if I fix that, and propagate the 
> error upwards, I first need a way to indicate that __try_vga_get failed 
> without there being a conflict, and then I need all vga_get callers to 
> have error handling. The latter sounds doable.
> 
> What I'm unsure about:
> 
> 1. Does this seem like a viable approach?
> 
> 2. What interface makes sense for returning an error here? This function 
> is supposed to return the conflicting device -- should I just make this 
> a PTR_ERR?
> 
> 3. What error would be appropriate for a bridge refusing to activate the 
> VGA bit? It's not EIO, it's not EACCES, it's not EINVAL, the closest is 
> probably ENOSYS, but even that feels wrong.
> 
> 4. How likely is it for this to break something else? Are there PCI 
> bridges that forward VGA but implement the bridge control register 
> incorrectly?
> 
>     Simon

I wonder how bad it would be to just tickle the VGA bit
when the bridge is added. Basically something like:

if (BRIDGECTL.VGA) {
	bridge.has_vga = true;
} else {
	BRIDGECTL.VGA = 1
	if (BRIDGECTL.VGA)
		bridge.has_vga = true;
	BRIDGECTL.VGA = 0
}

Obviously there is a tiny race there where the bridge might
temporarily forward VGA accesses to the wrong device. But
maybe the race is small enough to not really matter? Or I
guess if you're really worried about the race you could do
this check under stop_machine() *shudder*.

BTW I recently posted this:
https://lore.kernel.org/intel-gfx/20251208182637.334-1-ville.syrjala@linux.intel.com/
where I'm trying to fix the mess around VGA accesses in i915/xe.
Some of the more hacky things there should probably be properly
fixed in vgaarb, but I don't really have the time/energy to
deal with that right now.

-- 
Ville Syrjälä
Intel
