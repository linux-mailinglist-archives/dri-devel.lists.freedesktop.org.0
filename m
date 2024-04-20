Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD748ABA38
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 10:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9710FD0B;
	Sat, 20 Apr 2024 08:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFbbuhkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3F410FD06;
 Sat, 20 Apr 2024 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713600587; x=1745136587;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iHGqxMZGYV0xw6S1BxgVHQ+xofYdWkr5SzbbZY3VejI=;
 b=mFbbuhkvwfjb4JdpMOrMqU3y3lqnQ3Hy8+12PFzNYesR6qato4IjPC3x
 TLuzOGUOHZZTNA4bt89jRKwD0Eqg/513kHlvM3+pNgdIUxZpm/s0Bf0LA
 ZyyF7YLXogk4JgD72CnqtbWlbrgEpNA59zPgdbjmUDObOD6WhXV6H7TJ7
 tG06Tr+nKQX9aNDvkWFikeHfAxgK2ZGltSIWvsZLxgKK1oQRBgDu2WZGu
 Q9jXHqUv6q+xRMCQcsGISgAF534hAQcau6mSpj8p0rWQ6h8ajyu04XNim
 RW7N20OMzxQd7UWPiDbj2ygqhRxbW8NO1f2ACZzgjNf5buJhb+PCQgBaj Q==;
X-CSE-ConnectionGUID: hoBdadzBSpGqsB+9nCYwSw==
X-CSE-MsgGUID: okO4JLcfRDKH9r1zOTNrNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9326976"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9326976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2024 01:09:46 -0700
X-CSE-ConnectionGUID: DWwAgZgQRjKF1yNzJaSaFg==
X-CSE-MsgGUID: bmiPqiTgT6ypOvDnNSagbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; d="scan'208";a="28366091"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2024 01:09:44 -0700
Message-ID: <4aabb36d-3e84-457a-bf64-64720029114c@linux.intel.com>
Date: Sat, 20 Apr 2024 13:42:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm: add devm release action
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
 <20240419085826.263743-2-aravind.iddamsetty@linux.intel.com>
 <20240419-stimulating-passionate-mule-bbd4b2@houat>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240419-stimulating-passionate-mule-bbd4b2@houat>
Content-Type: text/plain; charset=UTF-8
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


On 19/04/24 14:41, Maxime Ripard wrote:
> On Fri, Apr 19, 2024 at 02:28:23PM +0530, Aravind Iddamsetty wrote:
>> In scenarios where drm_dev_put is directly called by driver we want to
>> release devm_drm_dev_init_release action associated with struct
>> drm_device.
>>
>> v2: Directly expose the original function, instead of introducing a
>> helper (Rodrigo)
>>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>>  include/drm/drm_drv.h     | 2 ++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 243cacb3575c..ba60cbb0725f 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>>  					devm_drm_dev_init_release, dev);
>>  }
>>  
>> +void devm_drm_dev_release_action(struct drm_device *dev)
>> +{
>> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
>> +}
>> +EXPORT_SYMBOL(devm_drm_dev_release_action);
> Again, this needs to be documented.

sorry I missed your earlier email, will address this.

Thanks,
Aravind.
>
> Maxime
