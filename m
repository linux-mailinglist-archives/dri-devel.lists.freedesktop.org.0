Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD+VCTQ9n2kiZgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:19:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811919C297
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3D910E7E5;
	Wed, 25 Feb 2026 18:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXPcw2cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490610E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772043567; x=1803579567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g+Rv5twtrHNkAa0fHy+gO6vfhR8gb9fyA2QB0P0BZgA=;
 b=kXPcw2cbG4LpKQV9SHmEQzwBzP/kjVmyHRmvZN8pwLZbDc89dPiZ5qLw
 4PtOximCmsAvIZk0yfu2OnZBk4WjW+JKcSRDYDdLGp/0GzPI5o5VmpOZE
 pyXa3rsobhpyIuNoQs/E1/sUi+9ZySE58/++hkGWO88gKVg7gM2DUmWYs
 4KVKT44Hg3O2QRenZm/uvjoP46cO/dT0t617OETzjLkrtcnpLglAmBaCO
 gXTM0Q5RQSDVb8ZXSD/X25DhPcxAqudO1kxnXsV3QGRVln6hNedjxl36j
 T0TjguvvqY3EfmCHGogtKdvgVqPW7/8sheyQNyg3eek+RL4mTKcnRDJx8 Q==;
X-CSE-ConnectionGUID: 4FeYp5XwQS+Li5qcCAKx4A==
X-CSE-MsgGUID: brzUtAatTlug0MEGgdCHUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73269232"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73269232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:19:26 -0800
X-CSE-ConnectionGUID: MEm1pWz2TE+yzmwhjUOS7g==
X-CSE-MsgGUID: e02kCWvCRtirQ+kehBsaNQ==
X-ExtLoop1: 1
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.84.158])
 ([10.245.84.158])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:19:25 -0800
Message-ID: <afb45a6b-c7ef-489a-beea-2245c08b10e3@linux.intel.com>
Date: Wed, 25 Feb 2026 19:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/amdxdna: Reduce log noise during process
 termination
To: Mario Limonciello <mario.limonciello@amd.com>, lizhi.hou@amd.com,
 mamin506@gmail.com, ogabbay@kernel.org, superm1@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20260210164521.1094274-1-mario.limonciello@amd.com>
 <20260210164521.1094274-3-mario.limonciello@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20260210164521.1094274-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 7811919C297
X-Rspamd-Action: no action

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 2/10/2026 5:42 PM, Mario Limonciello wrote:
> During process termination, several error messages are logged that are
> not actual errors but expected conditions when a process is killed or
> interrupted. This creates unnecessary noise in the kernel log.
>
> The specific scenarios are:
>
> 1. HMM invalidation returns -ERESTARTSYS when the wait is interrupted by
>     a signal during process cleanup. This is expected when a process is
>     being terminated and should not be logged as an error.
>
> 2. Context destruction returns -ENODEV when the firmware or device has
>     already stopped, which commonly occurs during cleanup if the device
>     was already torn down. This is also an expected condition during
>     orderly shutdown.
>
> Downgrade these expected error conditions from error level to debug level
> to reduce log noise while still keeping genuine errors visible.
>
> Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c     | 6 ++++--
>   drivers/accel/amdxdna/aie2_message.c | 4 +++-
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 37d05f2e986f9..79f6316655e73 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -497,7 +497,7 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>   
>   	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
>   		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
> -		if (ret)
> +		if (ret && ret != -ENODEV)
>   			XDNA_ERR(xdna, "Destroy temporal only context failed, ret %d", ret);
>   	} else {
>   		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
> @@ -1070,6 +1070,8 @@ void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo,
>   
>   	ret = dma_resv_wait_timeout(gobj->resv, DMA_RESV_USAGE_BOOKKEEP,
>   				    true, MAX_SCHEDULE_TIMEOUT);
> -	if (!ret || ret == -ERESTARTSYS)
> +	if (!ret)
>   		XDNA_ERR(xdna, "Failed to wait for bo, ret %ld", ret);
> +	else if (ret == -ERESTARTSYS)
> +		XDNA_DBG(xdna, "Wait for bo interrupted by signal");
>   }
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 77e3cdf18658b..5697c0c2dd43f 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -216,8 +216,10 @@ static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
>   
>   	req.context_id = id;
>   	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> -	if (ret)
> +	if (ret && ret != -ENODEV)
>   		XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);
> +	else if (ret == -ENODEV)
> +		XDNA_DBG(xdna, "Destroy context: device already stopped");
>   
>   	return ret;
>   }
