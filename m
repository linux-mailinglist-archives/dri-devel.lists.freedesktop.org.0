Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEVgJCzknmnQXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:59:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D95196EE2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907AB10E746;
	Wed, 25 Feb 2026 11:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GSR4sYTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65C110E744;
 Wed, 25 Feb 2026 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772020774;
 bh=0Lz7uZRTXCWj/J+aEommdk6N7FhzZohw5kJNaec9mzY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GSR4sYTMP6QN+rF38uAsipmaRY+lwOiR8UdQHXC3/xOo7jq1E18WBF2bv7R2lDMmI
 KJHS2KrA8euWPpJibK6Ml5f8jZsEw7pwumyADpd27kUSbg06dBekw0scC/IsXGTcGi
 lV6zUPQTkFqSH8Thd8mprYZQAPAzmvgXT8e+TLB81UKQQICK88Z8SLCBS6BNoiHAiT
 GHZWRv0RrwpiIKuRIP0SDFRQ8F2M+O8uYrN/qOxdXrNhbpkUBvrSOMBGoKoSYo7WIO
 62pw9EtRcrZMPPoZX5NRbwz2trWdrAZkhvk568xpRGyfsHaMyNGIw2iOXv8lzVBuId
 EUvs5xknWyXuQ==
Message-ID: <35881d45-3a17-4f82-aae8-65579b10a9a6@lankhorst.se>
Date: Wed, 25 Feb 2026 12:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i915-rt v6 13/24] drm/i915/display: Use intel_de_write_fw in
 intel_pipe_fastset
To: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260220083657.28815-39-dev@lankhorst.se>
 <4537cb8e981e2f49e1ba212237134dc5e812756e@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <4537cb8e981e2f49e1ba212237134dc5e812756e@intel.com>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Queue-Id: 66D95196EE2
X-Rspamd-Action: no action

Hey,

Den 2026-02-25 kl. 10:25, skrev Jani Nikula:
> On Fri, 20 Feb 2026, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> intel_set_pipe_src_size(), hsw_set_linetime_wm(),
>> intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
>> are called from an atomic context on PREEMPT_RT, and should be using the
>> _fw functions.
> 
> Problem is, ~nobody knows when they should be using _fw anymore when
> they're all over the place. It'll get cargo culted.

It's not too hard, IMO.

Called from vblank evasion:
All functions should use the _dsb postfixed functions if applicable, and intel_de_read_fw.
On code only for old platforms, the _fw functions can be used.

Lockdep complains hard on PREEMPT_RT if this is not the case, especially since vblank
evasion with this series  doesn't acquire or release any lock at all. It will allow us
to uncouple the VBLANK_EVASION_TIME_US define from PROVE_LOCKING.

Should I switch to use the _dsb prefixes all the time for readability?

Called from vblank readout:
- we're disabling preemption, so _fw functions must be used as the spinlocks cannot be taken.

Other cases:
- Normal functions. Same for encoder enabling etc.

Sidenote:
I believe it's a mistake to make the intel_dmc_wl_get/put() functions implicit. There
is already power well support for everything that needs it.

Explicit force_wake like xe_force_wake would be a better model. It could be implemented as
simple as holding the dmc forcewake around the entire modeset sequence, which would still
be protective. While for debugging we can still complain about affected registers outside
the sequence until CI is clean.

Kind regards,
~Maarten Lankhorst
