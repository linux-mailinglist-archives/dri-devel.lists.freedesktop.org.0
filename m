Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218377B78D5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52F010E0E0;
	Wed,  4 Oct 2023 07:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C8B10E0E0;
 Wed,  4 Oct 2023 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696405037; x=1727941037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lH2yySvOsZ4VCwoNxaRVxN1CB8Fiih6UCzosIeY22Rc=;
 b=KBCw7ZGBY2Gj1eM7nIKW1VEsf+2mGxqVE5cug0sZBaT2TNk5jTpDXRwI
 fCv23Ha2ahDxWEWID92dh/DdUxnlOSU5r763dqdC9AdHdYbzTBEzN8Epl
 RGlUIRgT3NFr1R//eKZrznQnXkbgykFoVFLJngKRHSyApHhAxLV+TVMHP
 iekhv+xtFyl15FhHiszw9h5sezqFm6mFcf9MyvI0XIOOXlyoKiFj+DiVF
 VxqNMw/wexsPI2ByRLC+K4MiOu9Nwf436JaJpdl0Ij6k2zAEgTjnyTcM4
 aeJEbRSzoCO0EUiipzzKyV8V2/wUKcxehOUllda2iYQ8azlrEOqgPGFCV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386955562"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="386955562"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 00:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="786399736"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="786399736"
Received: from azainola-mobl3.gar.corp.intel.com (HELO intel.com)
 ([10.214.163.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 00:37:12 -0700
Date: Wed, 4 Oct 2023 09:37:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
Subject: Re: [Intel-gfx] [Patch v2] Add uAPI to query microcontroller fw
 version
Message-ID: <ZR0WIngilVQo8ykA@ashyti-mobl2.lan>
References: <20231004034012.66334-1-vivaik.balasubrawmanian@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004034012.66334-1-vivaik.balasubrawmanian@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivaik,

On Tue, Oct 03, 2023 at 08:40:12PM -0700, Vivaik Balasubrawmanian wrote:
> Due to a bug in GuC firmware, Mesa can't enable by default the usage of 
> async compute engines feature in DG2 and newer. A new GuC firmware fixed the issue but 
> until now there was no way for Mesa to know if KMD was running with the fixed GuC version or not,
> so this uAPI is required.
> 
> More context on the issue:
> Vulkan allows applications to create types of queues: graphics, compute and copy.
> Today Intel Vulkan driver uses Render engine to implement all those 3 queues types.
> 
> There is a set of operations that a queue type is required to implement, 
> DG2 compute engine have almost all the operations required by compute queue but still lacks some.

/have/has/

> So the solution is to send those operations not supported by compute engine to render engine 
> and do some synchronization around it. But doing so causes the GuC scheduler to get stuck 

/to get/gets/

> around the synchronization, until KMD resets the engine and ban the application context.

/ban/bans/

> This issue was root caused to a GuC firmware issue and was fixed in newer version.
> 
> So Mesa can't enable the "async compute" without knowing for sure that KMD is running 
> with a GuC version that has the scheduler fix. Same will happen when Mesa start to use 
> copy engine.
> 
> This uAPI  may be expanded in future to query other firmware versions too.

Thanks for the explanation, it's clear and comprehensive.

Can you please wrap it to 75 characters (as per the Kernel
doc[1]) or 65 characters (as per the e-mail netiquette[2]).

[1] https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format
[2] https://www.ietf.org/rfc/rfc1855.txt

> More information:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
> Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
> 
> v2:
> - incorporated feedback from Tvrtko Ursulin:
>   - updated patch description to clarify the use case that identified
>     this issue.
>   - updated query_uc_fw_version() to use copy_query_item() helper.
>   - updated the implemented GuC version query to return Submission
>     version.
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> 
> Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>

Please don't leave blank lines in the tag section.

> ---
>  drivers/gpu/drm/i915/i915_query.c | 42 +++++++++++++++++++++++++++++++
>  include/uapi/drm/i915_drm.h       | 32 +++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 00871ef99792..3e3563ab62b7 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -551,6 +551,47 @@ static int query_hwconfig_blob(struct drm_i915_private *i915,
>  	return hwconfig->size;
>  }
>  
> +static int
> +query_uc_fw_version(struct drm_i915_private *i915, struct drm_i915_query_item *query)
> +{
> +	struct drm_i915_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data_ptr);
> +	size_t size = sizeof(struct drm_i915_query_uc_fw_version);
> +	struct drm_i915_query_uc_fw_version resp;
> +	int ret;
> +
> +	ret = copy_query_item(&resp, size, size, query);
> +	if (ret == size) {
> +		query->length = size;
> +		return 0;
> +	} else if (ret != 0)
> +		return ret;

please use braces around the "else if".

> +
> +	if (resp.pad || resp.pad2 || resp.reserved) {

why do you care to check the padding?

> +		drm_dbg(&i915->drm,
> +			"Invalid input fw version query structure parameters received");

"Invalid firmware query" maybe it's a bit more understandable.

Andi
> +		return -EINVAL;
> +	}
