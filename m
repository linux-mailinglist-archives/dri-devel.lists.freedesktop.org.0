Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC46B247E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 13:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E300E10E806;
	Thu,  9 Mar 2023 12:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F66E10E806;
 Thu,  9 Mar 2023 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678366152; x=1709902152;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OFjDyfLrUDkU1YGh+ZyN9wgKT0vD0CcMqprMV1F85Us=;
 b=Y97pHCCHQyBsF5epKQrLnxoiXH4DUd0WMMxGF+lG+YX5on2E8oQ3JWvy
 yIV58aeQwan9/oke+TJq6Q8YztQhYZK9qAYt1c9g2bi6DlkXJZdxrApET
 c6AETCl0GHkrOD/yW2ptEnzG/q0dVM4eyEqMfX3glc0+qhrzQ6sVPnyQI
 cyZDBlIs+sZHrPuWxju2FrTg/Rf4lJ7NBMhwrHwv+N+Pz/cB1p3xdHBTD
 dIe2Dl4DVD2LCIot0UgEWmqZcpuOQ6eaYVQRhQdJbPbsZG69aoXpAGq42
 Afgdu6VTxCftTYfTyHLKx968CewDuh82tEtREwk+zFDDR/d3ND+B31GDj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="399011341"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="399011341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709834278"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="709834278"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.145])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:49:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
In-Reply-To: <d844e8f4-dbfe-15a6-32db-4ab928fad77d@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309123700.528641-1-jani.nikula@intel.com>
 <d844e8f4-dbfe-15a6-32db-4ab928fad77d@amd.com>
Date: Thu, 09 Mar 2023 14:49:03 +0200
Message-ID: <87bkl29jk0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Mar 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 09.03.23 um 13:37 schrieb Jani Nikula:
>> Make the struct ttm_device_funcs pointers const so the data can be place=
d in rodata.
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Good idea, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks!

> Should I push it to drm-misc-next or do you need it on some other branch?

Go ahead, I'm not urgently depending on it.

BR,
Jani.

>
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>>   include/drm/ttm/ttm_device.h     | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_=
device.c
>> index ae2f19dc9f81..a71bb1362de4 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -190,7 +190,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>>    * Returns:
>>    * !0: Failure.
>>    */
>> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *f=
uncs,
>> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_fu=
ncs *funcs,
>>   		    struct device *dev, struct address_space *mapping,
>>   		    struct drm_vma_offset_manager *vma_manager,
>>   		    bool use_dma_alloc, bool use_dma32)
>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>> index 56e82ba2d046..c22f30535c84 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -223,7 +223,7 @@ struct ttm_device {
>>   	 * @funcs: Function table for the device.
>>   	 * Constant after bo device init
>>   	 */
>> -	struct ttm_device_funcs *funcs;
>> +	const struct ttm_device_funcs *funcs;
>>=20=20=20
>>   	/**
>>   	 * @sysman: Resource manager for the system domain.
>> @@ -287,7 +287,7 @@ static inline void ttm_set_driver_manager(struct ttm=
_device *bdev, int type,
>>   	bdev->man_drv[type] =3D manager;
>>   }
>>=20=20=20
>> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *f=
uncs,
>> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_fu=
ncs *funcs,
>>   		    struct device *dev, struct address_space *mapping,
>>   		    struct drm_vma_offset_manager *vma_manager,
>>   		    bool use_dma_alloc, bool use_dma32);
>

--=20
Jani Nikula, Intel Open Source Graphics Center
