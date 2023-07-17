Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B99756AA7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD69A10E293;
	Mon, 17 Jul 2023 17:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB7810E288;
 Mon, 17 Jul 2023 17:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689615189; x=1721151189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eQMVOLCj1sUJmhStNsl3ehDS8aXuiLD9Rhpm5tSybp8=;
 b=H9fzulQG/KMkOqymORA3VYAiDg5YwFmABTCR6HmNvqBT9E5vnFD7jVlX
 oIR98ON20Aq2hfq7JfOhQwTGRa7Ojm5Lq7xiLp5YNF3BNi3AxIUnEoFQi
 lMvRosFb9ym7A388oAbb3AAlMmBROqOO/E08knM8HYcRVRar8/TrY+FEQ
 wvoz2JdIHFaZ/s4RkSMEeW5b2KKh4DCD/mHAzpThvUZVNHoEaA7vmdN5K
 KYmdAAGjp7b/C5l1HaOry3eJupBzcYISfC6U+dnaBhNSyYskyM3mWY5F9
 4PtTmbutjT+Wf+yBoHa38G3V98amvV0dA11LtQOH/LQavkXsvnlxrQ/Kg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432165470"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="432165470"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="847388722"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="847388722"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:32:58 -0700
Date: Mon, 17 Jul 2023 19:32:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 3/6] drm/i915/gt: Rename flags with bit_group_X
 according to the datasheet
Message-ID: <ZLV7QcpoLx0T6qBT@ashyti-mobl2.lan>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-4-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717173059.422892-4-andi.shyti@linux.intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 17, 2023 at 07:30:56PM +0200, Andi Shyti wrote:
> In preparation of the next patch allign with the datasheet (BSPEC
> 47112) with the naming of the pipe control set of flag values.
> The variable "flags" in gen12_emit_flush_rcs() is applied as a
> set of flags called Bit Group 1.
> 
> Define also the Bit Group 0 as bit_group_0 where currently only
> PIPE_CONTROL0_HDC_PIPELINE_FLUSH bit is set.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 34 +++++++++++++-----------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index bee3b7dc595cf..3c935d6b68bf0 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -210,7 +210,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		mode |= EMIT_FLUSH;
>  
>  	if (mode & EMIT_FLUSH) {
> -		u32 flags = 0;
> +		u32 bit_group_0 = 0;
> +		u32 bit_group_1 = 0;

I could eventually add here a comment to explain better the
meaning of these two bit_group_{0,1}.

Andi
