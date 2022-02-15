Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F44B6CF2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 14:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6667E10E456;
	Tue, 15 Feb 2022 13:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4953810E438;
 Tue, 15 Feb 2022 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644930208; x=1676466208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QXI+b5nm+dXiNy+QsKCS49GQCYUWHA3Lyfl/FkgXUyY=;
 b=MRlFJaVMb7z8+FPCI7EvHI7etCC5eJUA+M1YIpj6/Yz1rpH27jjE795n
 voE4qgDY+t2tSKtANnOwK5xV2xg2Ar7vjiGUWfiXLc4irSnFsnia0uKAX
 c4hG/ELw5k1t1tPGNmy1MN8LF3mDD/v7RwyxikVe+Y8T1wNdKMTxoyvhF
 VI+iPk82atbM/6AZ3xQT+vpK3lJ5n01Bl57lnPLLkb6Nw7PH14Y8hlBLl
 hu7FOSq/+D7t1TQwKDRfAPwxKsXof8/Nyfs7mkd91hxBv4N6GdSX8QQdw
 DjGJlISBgPeEe+AmbHTGhxWKFGB5NYrEqaGOMg+Din1tEeGC94uxhrnnG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250548893"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="250548893"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 05:03:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="486162564"
Received: from nheffern-mobl1.ger.corp.intel.com (HELO [10.252.19.119])
 ([10.252.19.119])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 05:03:24 -0800
Message-ID: <94582ad9-5ebc-73b2-6521-3563cd067d3a@intel.com>
Date: Tue, 15 Feb 2022 13:03:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/perf: Skip the i915_perf_init for dg2
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220215053115.6023-1-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220215053115.6023-1-ramalingam.c@intel.com>
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
Cc: Nerlige Ramappa Umesh <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/02/2022 05:31, Ramalingam C wrote:
> i915_perf is not enabled for dg2 yet, hence skip the feature
> initialization.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/i915_perf.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 36f1325baa7d..5ac9604d07b3 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4373,6 +4373,10 @@ void i915_perf_init(struct drm_i915_private *i915)
>   
>   	/* XXX const struct i915_perf_ops! */
>   
> +	/* i915_perf is not enabled for DG2 yet */
> +	if (IS_DG2(i915))
> +		return;
> +
>   	perf->oa_formats = oa_formats;
>   	if (IS_HASWELL(i915)) {
>   		perf->ops.is_valid_b_counter_reg = gen7_is_valid_b_counter_addr;
