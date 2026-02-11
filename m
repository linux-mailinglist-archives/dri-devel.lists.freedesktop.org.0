Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP1TDFOEjGmfqAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:29:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B22124BEA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1211B10E02A;
	Wed, 11 Feb 2026 13:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djKpoIPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25BA10E02A;
 Wed, 11 Feb 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770816590; x=1802352590;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gLpm7dDSxnfrlsXVu2MEpHtLinDCiWYkQTzG3wIavo8=;
 b=djKpoIPkwHfYMVWXwvWqvOtVEW8z83iqEvvZHOStjrpuLweoEgViSgic
 KMhD1ZA2/LrKwcBjz0WqxCIfrRkH0kDgVOMOODkeczsfFNeI0DiYxOpfo
 LYcf5ayIyxXY8wXo8ITj61UNNtLI/h4ctRTJY5muQtMSkuOq1efBhdqM0
 oG8M3hcFCV0HuOiH2yDBDoCjCErVJtmENRUVKjcDfTCZnueWLzYNpts5F
 bU7wZ225LDewCsaNhB8KvJovJ6AOywmVuMMOAiINQ/vWx6pxuS30wTrS+
 Px472yzzBWgKSC/Px1TRztz9qQoJ9F3nhDvR9mEQU5JB6gOZCQsyFWURR A==;
X-CSE-ConnectionGUID: 8pDIJI2DRMqWnN+TYg3luw==
X-CSE-MsgGUID: i1b9bGfjROmDilVpiIKTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71862472"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71862472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:29:49 -0800
X-CSE-ConnectionGUID: akBCJI2rSWib5pjO+ivptA==
X-CSE-MsgGUID: z3Dy5xlwTzyboDgkNnnQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212272558"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:29:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 2/4] drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET
 recovery method
In-Reply-To: <20260211115946.2014051-8-mallesh.koujalagi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
 <20260211115946.2014051-8-mallesh.koujalagi@intel.com>
Date: Wed, 11 Feb 2026 15:29:42 +0200
Message-ID: <baaa52a6b75c783b7f65e626b7577e383e0da5b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 60B22124BEA
X-Rspamd-Action: no action

On Wed, 11 Feb 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
> Add documentation for the DRM_WEDGE_RECOVERY_COLD_RESET recovery
> method introduced for handling critical errors. This method is
> designated for severe errors that compromise core device functionality
> and are unrecoverable via recovery mechanisms such as driver reload or PCIe
> bus reset. The documentation clarifies when this recovery method should be
> used and its implications for userspace applications.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 73 +++++++++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index d98428a592f1..eae6aef68876 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -418,7 +418,7 @@ needed.
>  Recovery
>  --------
>  
> -Current implementation defines four recovery methods, out of which, drivers
> +Current implementation defines five recovery methods, out of which, drivers

"several" to avoid having to update this?

>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>  more side-effects. See the section `Vendor Specific Recovery`_
> @@ -435,6 +435,7 @@ following expectations.
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
>      vendor-specific vendor specific recovery method
> +    cold-reset      full device cold reset required
>      unknown         consumer policy
>      =============== ========================================
>  

-- 
Jani Nikula, Intel
