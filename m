Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2042F7AFFB7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 11:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099D10E4B7;
	Wed, 27 Sep 2023 09:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDFB10E4B8;
 Wed, 27 Sep 2023 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695806432; x=1727342432;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Tn+GHc5qRBWLlhaXpIYXYR3cdYa1BlDi1vM8+/7e6nA=;
 b=hrz6xJRQdkIEAIlASkV0mSUaP+Y/Genl11ZuRj7dY5zbS7JRvJzCWToW
 Taq2ywCoCvTdxln5kTzw+iNFotzFPrT69yfBPTtCeP/H+OjRqoGRKPLQL
 Ichp5RcY94Np1zw0azxdiTsY0uwhUOTgMDIpVpPQnIAL6e3FIG4YIsLXm
 iT3PNwzxBERYqQamOKP6TrV1ggIRfU7efoum2welpYmVDPhz621rP9A0M
 bxHbTHwgGdRcFybuPGB6AvjD6xONZeDxAnDXF2hIDYh+0ZReG1si0KtRr
 xCU5HKtuEnXGMH3Mv3h2FwjUtC8tZrM3cGcF8CCUO9bLbQ+52rFtcYyTe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412690793"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412690793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 02:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778477889"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="778477889"
Received: from mscanex-mobl.ger.corp.intel.com (HELO [10.213.204.17])
 ([10.213.204.17])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 02:20:17 -0700
Message-ID: <c248c6b1-923d-2e19-9ee9-60445d822fa9@linux.intel.com>
Date: Wed, 27 Sep 2023 10:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [Patch v1] drm/i915: Add uAPI to query
 micro-controller FW version
Content-Language: en-US
To: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <900c90f4-8db5-b0b3-caec-4d7d76291f2c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <900c90f4-8db5-b0b3-caec-4d7d76291f2c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/09/2023 05:14, Balasubrawmanian, Vivaik wrote:
> Due to a bug in GuC firmware, Mesa can't enable by default the usage of 
> compute engines in DG2 and newer.
> 
> 
> A new GuC firmware fixed the issue but until now there was no way
> 
> for Mesa to know if KMD was running with the fixed GuC version or not,
> 
> so this uAPI is required.

Is the firmware bug making the ccs engines generally useless, or just 
not suitable for this specific Mesa use case?

> It may be expanded in future to query other firmware versions too.
> 
> More information: 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
> 
> Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
> 
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> 
> Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_query.c | 47 +++++++++++++++++++++++++++++++
>   include/uapi/drm/i915_drm.h       | 32 +++++++++++++++++++++
>   2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c 
> b/drivers/gpu/drm/i915/i915_query.c
> index 00871ef99792..7f22a49faae7 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -551,6 +551,52 @@ static int query_hwconfig_blob(struct 
> drm_i915_private *i915,
>       return hwconfig->size;
>   }
> 
> +static int
> +query_uc_fw_version(struct drm_i915_private *i915, struct 
> drm_i915_query_item *query)
> +{
> +    struct drm_i915_query_uc_fw_version __user *query_ptr = 
> u64_to_user_ptr(query->data_ptr);
> +    size_t size = sizeof(struct drm_i915_query_uc_fw_version);
> +    struct drm_i915_query_uc_fw_version resp;
> +
> +    if (query->length == 0) {
> +        query->length = size;
> +        return 0;
> +    } else if (query->length != size) {
> +        drm_dbg(&i915->drm,
> +            "Invalid uc_fw_version query item size=%u expected=%zu\n",
> +            query->length,    size);
> +        return -EINVAL;
> +    }
> +
> +    if (copy_from_user(&resp, query_ptr, size))
> +        return -EFAULT;

The above can probably be replaced by using the copy_query_item() helper 
and it would work a bit better even since no reason to reject a buffer 
too large.

> +
> +    if (resp.pad || resp.pad2 || resp.reserved) {
> +        drm_dbg(&i915->drm,
> +            "Invalid input fw version query structure parameters 
> received");
> +        return -EINVAL;
> +    }
> +
> +    switch (resp.uc_type) {
> +    case I915_QUERY_UC_TYPE_GUC: {
> +        struct intel_guc *guc = &i915->gt0.uc.guc;
> +
> +        resp.major_ver = guc->submission_version.major;
> +        resp.minor_ver = guc->submission_version.minor;
> +        resp.patch_ver = guc->submission_version.patch;

Submission version is not the same as fw version, right? So 
DRM_I915_QUERY_UC_FW_VERSION and uapi kerneldoc is misleading.

Name the query type I915_QUERY_UC_TYPE_GUC*_SUBMISSION* and make it clear?

Regards,

Tvrtko

> +        resp.branch_ver = 0;
> +        break;
> +    }
> +    default:
> +        return -EINVAL;
> +    }
> +
> +    if (copy_to_user(query_ptr, &resp, size))
> +        return -EFAULT;
> +
> +    return 0;
> +}
> +
>   static int (* const i915_query_funcs[])(struct drm_i915_private 
> *dev_priv,
>                       struct drm_i915_query_item *query_item) = {
>       query_topology_info,
> @@ -559,6 +605,7 @@ static int (* const i915_query_funcs[])(struct 
> drm_i915_private *dev_priv,
>       query_memregion_info,
>       query_hwconfig_blob,
>       query_geometry_subslices,
> +    query_uc_fw_version,
>   };
> 
>   int i915_query_ioctl(struct drm_device *dev, void *data, struct 
> drm_file *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 7000e5910a1d..9be241fb77d8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
>        *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
> drm_i915_query_memory_regions)
>        *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>        *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
> drm_i915_query_topology_info)
> +     *  - %DRM_I915_QUERY_UC_FW_VERSION (see struct 
> drm_i915_query_uc_fw_version)
>        */
>       __u64 query_id;
>   #define DRM_I915_QUERY_TOPOLOGY_INFO        1
> @@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
>   #define DRM_I915_QUERY_MEMORY_REGIONS        4
>   #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
> +#define DRM_I915_QUERY_UC_FW_VERSION        7
>   /* Must be kept compact -- no holes and well documented */
> 
>       /**
> @@ -3213,6 +3215,36 @@ struct drm_i915_query_topology_info {
>       __u8 data[];
>   };
> 
> +/**
> +* struct drm_i915_query_uc_fw_version - query a micro-controller 
> firmware version
> +*
> +* Given a uc_type this will return the major, minor, patch and branch 
> version
> +* of the micro-controller firmware.
> +*/
> +struct drm_i915_query_uc_fw_version {
> +    /** @uc: The micro-controller type to query firmware version */
> +#define I915_QUERY_UC_TYPE_GUC 0
> +    __u16 uc_type;
> +
> +    /** @pad: MBZ */
> +    __u16 pad;
> +
> +    /* @major_ver: major uc fw version */
> +    __u32 major_ver;
> +    /* @minor_ver: minor uc fw version */
> +    __u32 minor_ver;
> +    /* @patch_ver: patch uc fw version */
> +    __u32 patch_ver;
> +    /* @branch_ver: branch uc fw version */
> +    __u32 branch_ver;
> +
> +    /** @pad2: MBZ */
> +    __u32 pad2;
> +
> +    /** @reserved: Reserved */
> +    __u64 reserved;
> +};
> +
>   /**
>    * DOC: Engine Discovery uAPI
>    *
> 
> base-commit: a42554bf0755b80fdfb8e91ca35ae6835bb3534d
