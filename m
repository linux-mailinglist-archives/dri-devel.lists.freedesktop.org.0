Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED4572A71
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 02:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021AD97EC6;
	Wed, 13 Jul 2022 00:53:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2367C9381F;
 Wed, 13 Jul 2022 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657673597; x=1689209597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gHsLlCw5MZt5gcL80JcArai8kt7lbwSrtjj350PMMMk=;
 b=i1sk3J0XfwZ42IU4WlLHpZ5enLX1TGxhXUGq5xnjKBjDU57W1RkeEqdL
 JVUwZIC23qQOrCe7gHwMVeMrzJ39LAww0zOwgOE09eZVYEBodbpYb2x+d
 lMC1i2M8kEs+jNjAENxTH/YuuYJtOSlBMtKCbeJuSGshaP0pb6eLBd04R
 ki5lZRPJbURhlzcGMZbMqrZNTZHP9HAMC2yar+LwGbbHsKIs5j82bgoJ3
 jVR/QT2mgENyKfIfsHjHdVUUWgDh/L8cD+IUr0e0OeXkMD5pESF35w1Si
 VNVN1a/NPcf6+RYZ+PnN7UraMSq0fgstT2+EdVl1H1tD7cb9kdl9lY09r Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="349050944"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="349050944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 17:53:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="653138435"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 17:53:14 -0700
Date: Tue, 12 Jul 2022 17:46:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [PATCH 12/12] drm/i915/guc: Add a helper for log buffer size
Message-ID: <20220713004648.GA2991@jons-linux-dev-box>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-13-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712233136.1044951-13-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 04:31:36PM -0700, John.C.Harrison@Intel.com wrote:
> From: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> Add a helper to get GuC log buffer size.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

John - you need to add a Signed-off-by since you posted.

Patch LGTM:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 49 ++++++++++++----------
>  1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index ff091adb56096..4bb81d2cf3828 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -15,6 +15,32 @@
>  
>  static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log);
>  
> +static u32 intel_guc_log_size(struct intel_guc_log *log)
> +{
> +	/*
> +	 *  GuC Log buffer Layout:
> +	 *
> +	 *  NB: Ordering must follow "enum guc_log_buffer_type".
> +	 *
> +	 *  +===============================+ 00B
> +	 *  |      Debug state header       |
> +	 *  +-------------------------------+ 32B
> +	 *  |    Crash dump state header    |
> +	 *  +-------------------------------+ 64B
> +	 *  |     Capture state header      |
> +	 *  +-------------------------------+ 96B
> +	 *  |                               |
> +	 *  +===============================+ PAGE_SIZE (4KB)
> +	 *  |          Debug logs           |
> +	 *  +===============================+ + DEBUG_SIZE
> +	 *  |        Crash Dump logs        |
> +	 *  +===============================+ + CRASH_SIZE
> +	 *  |         Capture logs          |
> +	 *  +===============================+ + CAPTURE_SIZE
> +	 */
> +	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE + CAPTURE_BUFFER_SIZE;
> +}
> +
>  /**
>   * DOC: GuC firmware log
>   *
> @@ -461,32 +487,11 @@ int intel_guc_log_create(struct intel_guc_log *log)
>  
>  	GEM_BUG_ON(log->vma);
>  
> -	/*
> -	 *  GuC Log buffer Layout
> -	 * (this ordering must follow "enum guc_log_buffer_type" definition)
> -	 *
> -	 *  +===============================+ 00B
> -	 *  |      Debug state header       |
> -	 *  +-------------------------------+ 32B
> -	 *  |    Crash dump state header    |
> -	 *  +-------------------------------+ 64B
> -	 *  |     Capture state header      |
> -	 *  +-------------------------------+ 96B
> -	 *  |                               |
> -	 *  +===============================+ PAGE_SIZE (4KB)
> -	 *  |          Debug logs           |
> -	 *  +===============================+ + DEBUG_SIZE
> -	 *  |        Crash Dump logs        |
> -	 *  +===============================+ + CRASH_SIZE
> -	 *  |         Capture logs          |
> -	 *  +===============================+ + CAPTURE_SIZE
> -	 */
>  	if (intel_guc_capture_output_min_size_est(guc) > CAPTURE_BUFFER_SIZE)
>  		DRM_WARN("GuC log buffer for state_capture maybe too small. %d < %d\n",
>  			 CAPTURE_BUFFER_SIZE, intel_guc_capture_output_min_size_est(guc));
>  
> -	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> -		       CAPTURE_BUFFER_SIZE;
> +	guc_log_size = intel_guc_log_size(log);
>  
>  	vma = intel_guc_allocate_vma(guc, guc_log_size);
>  	if (IS_ERR(vma)) {
> -- 
> 2.36.0
> 
