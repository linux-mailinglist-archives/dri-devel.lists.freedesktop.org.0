Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4962E810F94
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126AE10E74A;
	Wed, 13 Dec 2023 11:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2A210E74A;
 Wed, 13 Dec 2023 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702466053; x=1734002053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/RDAdUmWTinWpqoggex25c4O3sHOQPxI9ibcRvo3KmQ=;
 b=egiej/T2urXdJiz0f9jfQ6sVDQ03gKDGtZIazCSPZCrBXBGmL60DS2Kf
 jnAgeK6Ty64/5VTzf5gy0RtH3/wUq12MYm/A79QQikLgtatJn4fs5Ub65
 OnyaD+HLvLFT7CPVpy6mgclPkpdc+CcoGc01GNJrXQ5qrMUnRxdLJm1B+
 ZhiPj+cq6wF2LpnQBOw/yiVJTZC94dhKe7k4O6eG9oJgOjgWAw9UxvZc0
 LKtsnvEUmqF3xjPBuJrS62p9F8Tx6IAZ5dEbJQwvEm1jRYzVu1nPyyzae
 CweYK/vNmDI67JyIXIlMQ12oTiO8Dn3lKv1m5LcGayDps6USThQ81yTCc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="459267894"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="459267894"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 03:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="21919087"
Received: from kryanx-mobl.ger.corp.intel.com (HELO [10.213.231.240])
 ([10.213.231.240])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 03:14:12 -0800
Message-ID: <dd1d3a3d-b979-4b8b-810c-601ed6d72a7b@linux.intel.com>
Date: Wed, 13 Dec 2023 11:14:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/uapi: fix typos/spellos and punctuation
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20231213044014.21410-1-rdunlap@infradead.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231213044014.21410-1-rdunlap@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Randy,

On 13/12/2023 04:40, Randy Dunlap wrote:
> Use "its" for possessive form instead of "it's".
> Hyphenate multi-word adjectives.
> Correct some spelling.
> End one line of code with ';' instead of ','. The before and after
>    object files are identical.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> ---
>   include/uapi/drm/i915_drm.h |   12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff -- a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -693,7 +693,7 @@ typedef struct drm_i915_irq_wait {
>   #define I915_PARAM_HAS_EXEC_FENCE	 44
>   
>   /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to capture
> - * user specified bufffers for post-mortem debugging of GPU hangs. See
> + * user-specified buffers for post-mortem debugging of GPU hangs. See
>    * EXEC_OBJECT_CAPTURE.
>    */
>   #define I915_PARAM_HAS_EXEC_CAPTURE	 45
> @@ -1606,7 +1606,7 @@ struct drm_i915_gem_busy {
>   	 * is accurate.
>   	 *
>   	 * The returned dword is split into two fields to indicate both
> -	 * the engine classess on which the object is being read, and the
> +	 * the engine classes on which the object is being read, and the
>   	 * engine class on which it is currently being written (if any).
>   	 *
>   	 * The low word (bits 0:15) indicate if the object is being written
> @@ -1815,7 +1815,7 @@ struct drm_i915_gem_madvise {
>   	__u32 handle;
>   
>   	/* Advice: either the buffer will be needed again in the near future,
> -	 *         or wont be and could be discarded under memory pressure.
> +	 *         or won't be and could be discarded under memory pressure.
>   	 */
>   	__u32 madv;
>   
> @@ -3246,7 +3246,7 @@ struct drm_i915_query_topology_info {
>    * 	// enough to hold our array of engines. The kernel will fill out the
>    * 	// item.length for us, which is the number of bytes we need.
>    * 	//
> - * 	// Alternatively a large buffer can be allocated straight away enabling
> + *	// Alternatively a large buffer can be allocated straightaway enabling
>    * 	// querying in one pass, in which case item.length should contain the
>    * 	// length of the provided buffer.
>    * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> @@ -3256,7 +3256,7 @@ struct drm_i915_query_topology_info {
>    * 	// Now that we allocated the required number of bytes, we call the ioctl
>    * 	// again, this time with the data_ptr pointing to our newly allocated
>    * 	// blob, which the kernel can then populate with info on all engines.
> - * 	item.data_ptr = (uintptr_t)&info,
> + *	item.data_ptr = (uintptr_t)&info;
>    *
>    * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
>    * 	if (err) ...
> @@ -3286,7 +3286,7 @@ struct drm_i915_query_topology_info {
>   /**
>    * struct drm_i915_engine_info
>    *
> - * Describes one engine and it's capabilities as known to the driver.
> + * Describes one engine and its capabilities as known to the driver.
>    */
>   struct drm_i915_engine_info {
>   	/** @engine: Engine class and instance. */

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks for the clean up! Will merge it as soon as CI gives green light 
(yes I know its only comments :).

Regards,

Tvrtko
