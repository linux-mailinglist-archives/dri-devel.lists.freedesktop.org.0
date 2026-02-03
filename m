Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI1lCDtEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:53:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2CDDE30
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747610E338;
	Tue,  3 Feb 2026 18:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRfx2RwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB7B10E338
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770144822; x=1801680822;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rXmi5UZAJkMgy2V/fciReSK1x+ItVfaJ18E6C0XQJ7Q=;
 b=fRfx2RwRqU1hjX0IyM+xN8tZO/8GA3BDB5qq1H/9dV06SkiQTcNQM6jF
 p1v1eWLABqWnLTLsS9aiiWeXHGLZquA20EvC0Jo6hzeh3XHZh9e8VX+Y+
 aN2Ris6/Fl8CJbIHRb+fAu3vRWQUQGNUZRqPWsBBpb66DouhPP6kUqIYN
 xpmp20If+lePvQo9BcqEOsau04bgbUBMktzwSE2zU8nJoiPL7Zxm3plG6
 L9boWd/WiyTQYTkH2S/FMLAF/Y6zMrZSn9f+HUbAZKffRQynpXjAwtsun
 jN3MOLnuAQOGlmc9BTvgKo0QJ+PLMai51JRzhUJmLMjI4aVG1fmx0/CFB A==;
X-CSE-ConnectionGUID: kftUmzz7QG6Y8GTVn/OVww==
X-CSE-MsgGUID: PEvIbqm5QNG8NjWckSymFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81955349"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="81955349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 10:53:42 -0800
X-CSE-ConnectionGUID: RG0R9RTSSeConIDq2UgJww==
X-CSE-MsgGUID: DM0qs6WuQoWuS+WkfRDVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214084448"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.20.146])
 ([10.246.20.146])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 10:53:39 -0800
Message-ID: <5f5194c4-fa2b-4a05-8a86-435642753650@linux.intel.com>
Date: Tue, 3 Feb 2026 19:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Replace platform name strings
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20260202212529.2681307-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20260202212529.2681307-1-lizhi.hou@amd.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maciej.falkowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Queue-Id: 6DD2CDDE30
X-Rspamd-Action: no action

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 2/2/2026 10:25 PM, Lizhi Hou wrote:
> Update platform name strings to be more accurate and user-friendly.
>
> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/npu1_regs.c | 2 +-
>   drivers/accel/amdxdna/npu4_regs.c | 2 +-
>   drivers/accel/amdxdna/npu5_regs.c | 2 +-
>   drivers/accel/amdxdna/npu6_regs.c | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 6f36a27b5a02..cee42c49cbb6 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -117,7 +117,7 @@ const struct amdxdna_dev_info dev_npu1_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu1",
> +	.vbnv              = "NPU Phoenix",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu1_dev_priv,
>   	.ops               = &aie2_ops,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 3fc0420e8e3e..ed0382925b59 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -144,7 +144,7 @@ const struct amdxdna_dev_info dev_npu4_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu4",
> +	.vbnv              = "NPU Strix",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu4_dev_priv,
>   	.ops               = &aie2_ops, /* NPU4 can share NPU1's callback */
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index c0a35cfd886c..8427e9f2b4ec 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -108,7 +108,7 @@ const struct amdxdna_dev_info dev_npu5_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu5",
> +	.vbnv              = "NPU Strix Halo",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu5_dev_priv,
>   	.ops               = &aie2_ops,
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 1fb07df99186..a960149b5408 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -109,7 +109,7 @@ const struct amdxdna_dev_info dev_npu6_info = {
>   	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
>   	.dev_mem_base      = AIE2_DEVM_BASE,
>   	.dev_mem_size      = AIE2_DEVM_SIZE,
> -	.vbnv              = "RyzenAI-npu6",
> +	.vbnv              = "NPU Krackan",
>   	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
>   	.dev_priv          = &npu6_dev_priv,
>   	.ops               = &aie2_ops,
