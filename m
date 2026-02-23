Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id exk8G2X1m2kg+QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:36:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F71722F6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB8910E24B;
	Mon, 23 Feb 2026 06:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9wOGwQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA8310E249
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771828577; x=1803364577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OWpm1fw5X1UlFpCnVACOZoldwrjn3bzGtBX9HF0dZNU=;
 b=E9wOGwQl3zFqYvr2bOystPM5iuwb5vX1ICSMN219G35rZf47Xh2sMape
 2tXNe9wJV4ddT5PPP8TMUYOVCvidvS7aNiVqM4iQfFoAsWFlK655W8UpB
 YtAv/sIVqPQQG0ORp1WTKcUhlcO1XfmeNWiXBq8sy9MjHExzvtIm3JyRv
 hrRbOIIXVDADxpCrC7FnOFOgADwF9CLFhdQrPBhj2kuMyf2E67EvCn9hP
 SsWlsZOBqEjWrrF9YsyXp7jPkerf1ih1uizKKTyirvYyhW3FhL/3PJjep
 lssnsL43U5DoniW58F9cWekv+TWtRnDm6Eb0NJ4RSB6d39LuEWuJIk0Bl g==;
X-CSE-ConnectionGUID: YrpCrxGPTXafNGczUgcePg==
X-CSE-MsgGUID: jZHZLjzYRNepqaZTBI8wlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90224098"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90224098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:36:17 -0800
X-CSE-ConnectionGUID: KndYkeIaQ5KAIY8yqpFynA==
X-CSE-MsgGUID: SLaBY/5eRzqfZrdq1+pKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219973537"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:36:15 -0800
Date: Mon, 23 Feb 2026 08:36:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Hughes <hughsient@gmail.com>
Subject: Re: power saving, dpcd access and fwupd/userspace expectations
Message-ID: <aZv1XP3vkXQrdFxs@intel.com>
References: <CAPM=9twkqUu=CJ6+AotavnDga5F=2SGRcjLeZNRy1soFbrO6cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9twkqUu=CJ6+AotavnDga5F=2SGRcjLeZNRy1soFbrO6cA@mail.gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spamd-Result: default: False [-0.48 / 15.00];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:hughsient@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: E15F71722F6
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:54:43AM +1000, Dave Airlie wrote:
> I've been hitting a problem on the laptop I used as my desktop for the
> last while, and I finally has the inspiration to track it down this
> morning at 5am.
> 
> The problem is when nouveau goes into runtime pm suspend, and fwupd
> hits the /dev/drm_dp_aux* nothing wakes up nouveau, we get to sending
> a message to GSP and it times out and I get an oops and things fail.
> 
> Now the question I have is what do we want to do in this situation, do
> we really want to restore power to the GPU because fwupd is probing
> possibly attached docks, or whatever. Like do we want to integrate the
> drm_dp_aux stuff into the power domains properly so we can have a
> proper hierarchy so it wakes up the parent device when it gets used,
> or do we just want to return -EBUSY from the driver when the device is
> dynamically off.
> 
> I'll probably submit a patch doing the latter when I get to writing it
> and test it on my laptop.

FWIW i915 has always woken up the device for any kind of userspace
access that needs to poke the hardware.

Simply returning -EBUSY or something doesn't sound very safe in
case the hardware powers down while the DPCD access for some
firmware update has already started. I suppose at the very least
you'd need to hold some kind of power reference even if you don't
wake the hardware. Though if you already have to figure out the
correct power reference then I'm not sure why you wouldn't just
wake it up anyway.

And if you don't wake the hardware, is is safe to let the device
power down during a firmware update because then only some of
AUX transfers would go through and subsequent ones could still
fail.

I've also occasionally wondered what happens to the thing whose
firmware is being updated if other AUX transfers are happening at
the same time...

-- 
Ville Syrjälä
Intel
