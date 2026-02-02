Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCsHOEBzgGkw8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:49:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F279CA48A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA1510E28E;
	Mon,  2 Feb 2026 09:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4FHKik3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE910E28E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770025782; x=1801561782;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KYLWXHG5CV4pfZ0AMIfxHVjeWQhyjMHTo9SoYGh5nSE=;
 b=b4FHKik3NeYQQkUxLt04Sb/CeRZ1+DwPvDXkwHlBNOzgOkMRRUkEPdqe
 thlRdF8uK7DR4CBfCEo94vsdv41zw6N70Mt+xRxAKCTNlB9dCe7T+wfCm
 bYkk0TZcK9/RyER6Gn97U5++IVg9QMRxoBxG4dlDzdWMCZme0xP663+jr
 0442pZ7x9rbgPhk2J9pCaRuYnfIPrXv6eLlWhIRDuY2Eq84bd9JBnDCLv
 HPpGogWfcRG8UDqRW/BqMLcDjx1RZDXXsa7JL7WJBl6DTgmTjFcbI3OCO
 8BPmoxc3H+yAsNk30G23I4KfvfxtSBrvLp1aLgot37eCvVsisZ8eqqfja Q==;
X-CSE-ConnectionGUID: 7DzpiwVaQ52WlaRGY8i+xA==
X-CSE-MsgGUID: xSCrOLpFQNGP2MsmtB6Oyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="74802547"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="74802547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:49:42 -0800
X-CSE-ConnectionGUID: KGnY2pOJQfaAjQSF8RtbjQ==
X-CSE-MsgGUID: d5gdnoEPSQmYDQ9HO0Dvgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="247082861"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:49:40 -0800
Message-ID: <081c00e4b349ec6b81ef9659b8180c1b834909b7.camel@linux.intel.com>
Subject: Re: drm_gpusvm: questions on multi-GPU support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Honglei Huang <honghuan@amd.com>, matthew.brost@intel.com
Cc: Ray.Huang@amd.com, dri-devel@lists.freedesktop.org
Date: Mon, 02 Feb 2026 10:49:37 +0100
In-Reply-To: <a1dc7f3a-376f-4910-b6ae-8ee733bd598f@amd.com>
References: <a1dc7f3a-376f-4910-b6ae-8ee733bd598f@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:honghuan@amd.com,m:matthew.brost@intel.com,m:Ray.Huang@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 1F279CA48A
X-Rspamd-Action: no action

On Mon, 2026-02-02 at 15:56 +0800, Honglei Huang wrote:
>=20
> Hi Matthew and Thomas,
>=20
> I'm exploring the use of drm_gpusvm for multi-GPU shared virtual
> memory
> scenarios and have some questions about potential synchronization
> issues.
>=20
> The drm_gpusvm design is per-device oriented, so for multi-GPU
> setups,
> each GPU would have its own drm_gpusvm instance with independent MMU
> notifiers registered to the same mm_struct.
>=20
> When multiple drm_gpusvm instances share the same process address
> space,
> I'm concerned about the following synchronization issues:
>=20
> 1. MMU notifier ordering: When CPU modifies memory (e.g., munmap),
> =C2=A0=C2=A0=C2=A0 multiple notifier callbacks are triggered independentl=
y. Is there
> any
> =C2=A0=C2=A0=C2=A0 guarantee on the ordering or atomicity across GPUs? Co=
uld this
> lead
> =C2=A0=C2=A0=C2=A0 to inconsistent states between GPUs?

The guarantee is that the invalidation may not proceed until all mmu
notifiers have completed, and then gpusvm_range_get_pages() will never
complete successfully until the invalidation is complete.

>=20
> 2. Range state consistency: If GPU-A and GPU-B both have ranges
> =C2=A0=C2=A0=C2=A0 covering the same virtual address, and an invalidation=
 occurs,
> how
> =C2=A0=C2=A0=C2=A0 should we ensure both GPUs see a consistent view befor=
e allowing
> =C2=A0=C2=A0=C2=A0 new GPU accesses?

Multiple gpus may maintain ranges of different size with different
attributes pointing to the same memory, and that's really not a
problem. It's up to user-space to ensure that we're not bouncing data
around between gpus. In xe, we're using the gpu_madvise() ioctl to
allow UMD to specify things like preferred region and access mode.


>=20
> 3. Concurrent fault handling: If GPU-A and GPU-B fault on the same
> =C2=A0=C2=A0=C2=A0 address simultaneously, is there potential for races i=
n
> =C2=A0=C2=A0=C2=A0 drm_gpusvm_range_find_or_insert()?

each drm_gpusvm() instance is meant to be per-vm and per-device so each
vm on each gpu only sees its own ranges. The drm_pagemap code is then
the code that maintains the migration state, and that is per-cpu-vm so
if it is fed conflicting migration requests from different gpus or even
different vms, it will try its best to mitigate.

However, the invalidation scheme in 1. will always guarantee that all
gpus either have invalid page-tables causing gpu-faults or point to
common memory that holds the data.


>=20
> Is multi-GPU a considered use case for drm_gpusvm? If so, are there
> recommended patterns for handling these coordination issues?

For us it's considered a valid use-case. In the end I guess that
depends on the API you are exposing to the end-user. KMD ensures all
GPUs always point to the correct data for a given cpu virtual address
space, but leaves it to user-space to supply non-conflicting migration
requests to avoid excessive migration. I'm under the impression that
our L0 user-facing API is also forwarding this responsibility to the
end-user.

Hope this information helps.

Thanks,
Thomas


>=20
> Regards,
> Honglei
