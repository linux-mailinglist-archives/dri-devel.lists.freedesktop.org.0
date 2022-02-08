Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79034AD499
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 10:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA27910E1E0;
	Tue,  8 Feb 2022 09:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBE110E12F;
 Tue,  8 Feb 2022 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644311974; x=1675847974;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zV+V76OnRMqAbJSeq2Bn63kdxs5jpubZc22grdtAD9A=;
 b=en5k9kwF3JZbjk4zWbbZdNEG4xMg+RllmRWjI7cO/npAHF4RJVtxgWBv
 i/sf7VXssIA70UOmIZy1pLWdbK/U6uU/801swHxNC/yVlhqyAo7UTJD+I
 93LKZUsHQvRIlX2KZ/cuGFAEptS0qYuqeERYiSTgUEspKou/q8Q0vLMy0
 gUURcC2OCelsM2Wwb42cVzgeI8Fol/1DZeeiXHLXgMbtqHx1yrje1VJ46
 ptgTXw5tsfRP4V/s9JKz3rZbENhKQJ+83/vGVxixNj4tX17zqSA3LJh2S
 mzmNvqE9Q9oPU1dxVQUf4Crg/Z1NS1+Y0MVbsQVcfK6FDB4v8J8F2Cwre Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228876838"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="228876838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:19:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="484747335"
Received: from kgonza2-mobl2.gar.corp.intel.com (HELO [10.213.198.226])
 ([10.213.198.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 01:19:26 -0800
Message-ID: <0eeb87ae-a4d8-17f5-8b6b-9a1da8e3de51@linux.intel.com>
Date: Tue, 8 Feb 2022 09:19:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220207192854.862959-1-jordan.l.justen@intel.com>
 <20220207192854.862959-4-jordan.l.justen@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220207192854.862959-4-jordan.l.justen@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/02/2022 19:28, Jordan Justen wrote:
> Also, document DRM_I915_QUERY_HWCONFIG_BLOB with this struct.
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>   include/uapi/drm/i915_drm.h | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 069d2fadfbd9..38b8c11e91f0 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3276,6 +3276,30 @@ struct drm_i915_gem_create_ext_protected_content {
>   	__u32 flags;
>   };
>   
> +/**
> + * DOC: GuC HWCONFIG blob uAPI
> + *
> + * The GuC produces a blob with information about the current device.
> + * i915 reads this blob from GuC and makes it available via this uAPI.
> + *
> + * The returned blob is an array of items described by struct
> + * drm_i915_query_hwconfig_blob_item. The
> + * drm_i915_query_hwconfig_blob_item length field gives the length of
> + * the drm_i915_query_hwconfig_blob_item data[] array for the item.
> + *
> + * The length of the query data returned by
> + * DRM_I915_QUERY_HWCONFIG_BLOB will align with the end at the final
> + * drm_i915_query_hwconfig_blob_item entry.

Align _with_ the end maybe? Or "be equal to the size of all items added 
together"?

> + *
> + * The meaning of the key field and the data values are documented in
> + * the Programmer's Reference Manual.
> + */
> +struct drm_i915_query_hwconfig_blob_item {
> +	u32 key;
> +	u32 length;
> +	u32 data[];

__u32 for uapi headers, just in case you haven't figured out what kernel 
test robot meant.

Regards,

Tvrtko

> +};
> +
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
