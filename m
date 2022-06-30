Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF035612DE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 09:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49F10FB60;
	Thu, 30 Jun 2022 07:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC4010FBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656572518; x=1688108518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AeHi61WsIJAmFsEU0j7KjinoFRAELD1Z5s+ZxYgSLyY=;
 b=jVYxtOOUPNLTb2/e5vVgx7cIGOEkIKxLtz8NRNQzqLSOLKkzfLyt8GJI
 qhNSuawgVUu+G/HQN2YIbvYK9gpZTFx1C+LS5nZsgw/3QbRMDAicgJ1Vn
 8KNYvWcJI4rXHnyrRv1B6kRcHiYoxMNrQ038lJvyNNV/K4+usAv5JsM0T
 UWHWXt/Ti0PAcldWJ4RORnDBrvglAay+xYQGnopYkN11/kW8Wf+/xvRjz
 xUAyKare9pmXa6oPF72jox+by7J1upVJyO+kVeSyuRYVfpOGY+J1j5sGI
 zt6a9622srDvARDlTyFzB0+S7Q2wWSAN9bfO9n5bXyNwUrdscwnkrlHyp w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="283362558"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="283362558"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 00:01:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="647761832"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.217.92])
 ([10.251.217.92])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 00:01:49 -0700
Message-ID: <83341d51-6c63-4b37-2f02-b3f305930308@linux.intel.com>
Date: Thu, 30 Jun 2022 09:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] Fix: SYNCOBJ TIMELINE Test failed.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220629060236.3283445-1-jesse.zhang@amd.com>
 <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <8499b1f1-cd39-5cb4-9fac-735e68393556@amd.com>
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vijendar.Mukunda@amd.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/2022 11:12 AM, Christian König wrote:
> Am 29.06.22 um 08:02 schrieb jie1zhan:
>>   The issue cause by the commit :
>>
>> 721255b527(drm/syncobj: flatten dma_fence_chains on transfer).
>>
>> Because it use the point of dma_fence incorrectly
>>
>> Correct the point of dma_fence by fence array
>
> Well that patch is just utterly nonsense as far as I can see.
>
>>
>> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>
>
> I have strong doubts that Nirmoy has reviewed this and I certainly 
> haven't reviewed it.


I haven't  reviewed this either.


Nirmoy

>
> Christian.
>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c 
>> b/drivers/gpu/drm/drm_syncobj.c
>> index 7e48dcd1bee4..d5db818f1c76 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -887,7 +887,7 @@ static int drm_syncobj_flatten_chain(struct 
>> dma_fence **f)
>>           goto free_fences;
>>         dma_fence_put(*f);
>> -    *f = &array->base;
>> +    *f = array->fences[0];
>>       return 0;
>>     free_fences:
>
