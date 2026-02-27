Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6YnFLNxroWmxswQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:03:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8D1B5B6A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E64710EAE4;
	Fri, 27 Feb 2026 10:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S5J9irtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F82F10EAE4;
 Fri, 27 Feb 2026 10:03:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 52CC361421;
 Fri, 27 Feb 2026 10:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7424C116C6;
 Fri, 27 Feb 2026 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772186581;
 bh=sISMdSV3MNe6kKHUHQrwVRu3NlbGB3BBMRsgKKDIT+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5J9irtkImNgOvUchtE2Y8u8nvLaypnpZHgv5io9ECXRTfnI1cORhtOuhEK/vHsdr
 x0wiYZ1FE+iylyYacAB0us+I8h0CJofwVPYdr/Lm+GGHfvbHmOFD0ODdjIlcUioc0k
 W9guaB/I2nyJPGgr+ZGe/fz3ctp6jG0lHP7z+yUTd1/AjW8/4SR7fNvIOo35xkvtMf
 EpewwUY0Oq492yw0PLisp9tn4/fOsbx7H/5T7FyKTbfMbulGpumMO+rK3/+npTJZVl
 xr/giDoZLFd/xsDXNT82zYyQr1jrtjBxqnRJDjhHkVG2lZWKeUZbkL8bHs2kyxGfkK
 vjmayruymALHg==
Date: Fri, 27 Feb 2026 11:02:55 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/vrr: partial revert of
 dda7dcd9da73c5327aef42b89f0519bb51e84217
Message-ID: <aaFriOQRrLFnHjuP@plouf>
References: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
 <cd2e1c87-b0e4-4123-a1b7-88c86722e088@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd2e1c87-b0e4-4123-a1b7-88c86722e088@intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 58C8D1B5B6A
X-Rspamd-Action: no action

On Feb 20 2026, Nautiyal, Ankit K wrote:
> 
> On 2/18/2026 9:53 PM, Benjamin Tissoires wrote:
> > Commit dda7dcd9da73 ("drm/i915/vrr: Use fixed timings for platforms that
> > support VRR") introduced a regression on my Ice Lake laptop with an Iris
> > Plus G7.
> > 
> > The screen can go blank (screen lock or just idle), but if I try to wake
> > it up, there is an immediate kernel lock. The netconsole was really
> > unhelpful here, and a bisect gave me the commit above to be the culprit.
> > 
> > For reference, the netconsole I could get was:
> > [  103.553110] netconsole: network logging started
> > [  125.642395] mce: [Hardware Error]: CPU 0: Machine Check Exception: 5 Bank 6: ba00000011000402
> > [  125.642400] mce: [Hardware Error]: RIP !INEXACT! 33:<00007fa4471665ec>
> > [  125.642403] mce: [Hardware Error]: TSC 38282e339d
> > [  125.642404] mce: [Hardware Error]: PROCESSOR 0:706e5 TIME 1771365482 SOCKET 0 APIC 0 microcode ca
> > [  125.642406] mce: [Hardware Error]: Run the above through 'mcelog --ascii'
> > [  125.642406] mce: [Hardware Error]: Machine check: Processor context corrupt
> > [  125.642407] Kernel panic - not syncing: Fatal machine check
> > [  125.642415] Kernel Offset: 0x1d400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> > 
> > and then the backtrace lead to the netconsole in itself.
> > 
> > If I restore the early return when vmin >= vmax (in my case vmin==vmax),
> > then I can use my machine again after it goes idle.
> > 
> > I have strictly no ideas if this is the correct solution, so please take
> > this with a grain of salt, but this is effectively preventing me to use
> > distro kernel since v6.16.
> 
> 
> Hi Benjamin,
> 
> Thanks for bisecting and getting the problematic commit.
> 
> This seem to be an issue while trying to fill few VRR related stuff. Your
> change effectively makes an early return from the
> intel_vrr_compute_config(), probably avoiding setting those VRR related
> parameters in sw state.
> 
> To understand the issue better and to debug further I request you to file a
> bug for i915 in gitlab [1] . More details in [2].
> 
> Also request you to test with the latest drm-tip : [3], and attach the logs
> from boot. The link [2] has the necessary details.

Both done:
- drm-tip still shows the crash
- issue filed at https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15777

Sorry for not coming back earlier, got my plate full this week.

Cheers,
Benjamin

> 
> 
> Links:
> 
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> 
> [2] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
> 
> [3] https://gitlab.freedesktop.org/drm/tip/-/commits/drm-tip
> 
> 
> Thanks & Regards,
> 
> Ankit
> 
> 
> 
> > 
> > Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> > ---
> > I've been experiencing this bug since kernel v6.16.
> > 
> > System Information
> >          Manufacturer: Dell Inc.
> >          Product Name: XPS 13 7390 2-in-1
> > 
> > cpu: Intel(R) Core(TM) i7-1065G7 CPU @ 1.30GHz
> > 
> > lspci:
> > 00:00.0 Host bridge [0600]: Intel Corporation Ice Lake-LP Processor Host Bridge/DRAM Registers [8086:8a12] (rev 03)
> > 	Subsystem: Dell Device [1028:08b0]
> > 	Flags: bus master, fast devsel, latency 0, IOMMU group 2
> > 	Capabilities: <access denied>
> > 	Kernel driver in use: icl_uncore
> > 
> > 00:02.0 VGA compatible controller [0300]: Intel Corporation Iris Plus Graphics G7 [8086:8a52] (rev 07) (prog-if 00 [VGA controller])
> > 	DeviceName: To Be Filled by O.E.M.
> > 	Subsystem: Dell Device [1028:08b0]
> > 	Flags: bus master, fast devsel, latency 0, IRQ 188, IOMMU group 1
> > 	Memory at 603d000000 (64-bit, non-prefetchable) [size=16M]
> > 	Memory at 4000000000 (64-bit, prefetchable) [size=256M]
> > 	I/O ports at 4000 [size=64]
> > 	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> > 	Capabilities: <access denied>
> > 	Kernel driver in use: i915
> > 	Kernel modules: i915
> > 
> > Again, I have really no idea if this is the correct fix, but it would be
> > nice if the issue could be solved in v7.0 and backported to older
> > kernels.
> > 
> > Please tell me if I need to provide more information.
> > 
> > Cheers,
> > Benjamin
> > ---
> >   drivers/gpu/drm/i915/display/intel_vrr.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> > index b92c42fde937..3d16dd4611d9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -377,6 +377,9 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
> >   		vmax = vmin;
> >   	}
> > +	if (vmin >= vmax)
> > +		return;
> > +
> >   	if (crtc_state->uapi.vrr_enabled && vmin < vmax)
> >   		intel_vrr_compute_vrr_timings(crtc_state, vmin, vmax);
> >   	else if (is_cmrr_frac_required(crtc_state) && is_edp)
> > 
> > ---
> > base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> > change-id: 20260218-wip-fix-iris-plus-28a916221bdc
> > 
> > Best regards,
