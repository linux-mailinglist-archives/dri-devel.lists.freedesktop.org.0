Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740595A53D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 21:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3310E67A;
	Wed, 21 Aug 2024 19:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCszfIy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897FE10E67A;
 Wed, 21 Aug 2024 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724268258; x=1755804258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fH8ysp6e/+jTh4lromgP4DZCRCbrp0pQld922SLGqYM=;
 b=bCszfIy83ttLITjBCeGZamUOBDT09XfjM9ueWi+TO2xBXoH5s8MK0rJ7
 tK4Uas/cqPySbt8HUdI8J5UIEEGMrrhiSZN/xQKiG95v+nwUByAEWDxGT
 ZUYWnaeZJG+EKrkphWoJ+rb0devYbzT7w0r3PUML1pd3Hql4dhE7zx0xd
 F+NKr4yR2abbAA6qfRLRzMlq5OFOZ4wN+FzLbU1aT/3qJp9U8e7v8XykN
 KHiFRKXymOYGsMpir9GShRFJ/Pb8vernU/8QHh3ZiGryRSPRgkpWt96r7
 rzyKmJH8/2Mc89ew+TaBcaf516xCxmMaR7AE28brdfcfo5diwsZ8gQhCK Q==;
X-CSE-ConnectionGUID: bN2OjTKkQE+F9vfyBaudZg==
X-CSE-MsgGUID: vCeBRpxpQuiXXVR4emyulg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22785977"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22785977"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:24:18 -0700
X-CSE-ConnectionGUID: HWGWNci0T/2JNw5jkUC0Aw==
X-CSE-MsgGUID: 7ERa2Z//TeGLSkIHafz+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91920185"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.33])
 ([10.245.244.33])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:24:15 -0700
Message-ID: <8cdd38ed-434d-483b-8893-46509f24158c@linux.intel.com>
Date: Wed, 21 Aug 2024 21:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/fourcc: define Intel Xe2 related tile4 ccs
 modifiers
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240816115229.531671-1-juhapekka.heikkila@gmail.com>
 <20240816115229.531671-3-juhapekka.heikkila@gmail.com>
 <j362retusy4czdvzt4jc55aoww273fuam5zx4k4pgoznjml5wl@jgafsq7qqdex>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <j362retusy4czdvzt4jc55aoww273fuam5zx4k4pgoznjml5wl@jgafsq7qqdex>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2024-08-17 kl. 02:06, skrev Lucas De Marchi:
> On Fri, Aug 16, 2024 at 02:52:28PM GMT, Juha-Pekka Heikkila wrote:
>> Add Tile4 type ccs modifiers to indicate presence of compression on Xe2.
>> Here is defined I915_FORMAT_MOD_4_TILED_LNL_CCS which is meant for
>> integrated graphics with igpu related limitations
>> Here is also defined I915_FORMAT_MOD_4_TILED_BMG_CCS which is meant
>> for discrete graphics with dgpu related limitations
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> not very fond of adding the platform names, but looks like this was
> always the approach, so this keeps the consistency.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> We will need an ack from drm-misc maintainer to merge this through
> drm-intel. Let's add some Cc.
> 
> Lucas De Marchi
> 
>> ---
>> include/uapi/drm/drm_fourcc.h | 25 +++++++++++++++++++++++++
>> 1 file changed, 25 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 2d84a8052b15..78abd819fd62 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -702,6 +702,31 @@ extern "C" {
>>  */
>> #define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
>>
>> +/*
>> + * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
>> + * on integrated graphics
>> + *
>> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
>> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
>> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
>> + * GEM object in a reserved memory area dedicated for the storage of the
>> + * CCS data for all compressible GEM objects.
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_LNL_CCS fourcc_mod_code(INTEL, 16)
>> +
>> +/*
>> + * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
>> + * on discrete graphics
>> + *
>> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
>> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
>> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
>> + * GEM object in a reserved memory area dedicated for the storage of the
>> + * CCS data for all compressible GEM objects. The GEM object must be stored in
>> + * contiguous memory with a size aligned to 64KB
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_BMG_CCS fourcc_mod_code(INTEL, 17)
>> +
>> /*
>>  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>>  *
>> -- 
>> 2.45.2
>>
