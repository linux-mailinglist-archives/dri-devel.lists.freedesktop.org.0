Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F7C74ADD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B15210E766;
	Thu, 20 Nov 2025 14:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JoWCoIMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78210E766
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zWq2fl02t6zIbocRM2Om+Qa5Dn0ty7kRUEJEpCh1BvI=; b=JoWCoIMkE2woqrkceZA65fJsr9
 MHYNFPvnu4+RgTKcT6nRfWDV5IQTMyTAeceCyvPcyRARFOySnUn5WjLRqx2z0n/Z6GuK/4dWFcXtS
 2LeDfBnnGryXnFeNg/oc1Js+HoMoPS7lQZp+PgREjJpW1lwo64D6t79ZoxeknGYOTcX0xkNKU1Itx
 r0XEO7VhKtW3FIhQdusfV1kJGXde0+ViXWaB5JbihDQZLlbOp+WziOHz1Hab0Q0EqemtaXODbUYRb
 5Nah1PCjSRwtYQYIW8zvKyozg95dctMnpiYFZXktLOE67022tey944cYpAHRSJJ0VxMovQnda/2rb
 lL1OlcbQ==;
Received: from [187.101.0.152] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vM63r-003HFq-Eo; Thu, 20 Nov 2025 15:55:03 +0100
Message-ID: <c37479da-dc17-4789-9b09-9192f845a927@igalia.com>
Date: Thu, 20 Nov 2025 11:55:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gem: Use vmemdup_array_user in
 drm_gem_objects_lookup
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20251112092732.23584-1-tvrtko.ursulin@igalia.com>
 <765f43f5-2cd8-400b-bb8e-2a03132268f9@igalia.com>
 <a52bb8ed-6c4e-4173-947e-7c4f7f4436a4@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <a52bb8ed-6c4e-4173-947e-7c4f7f4436a4@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 20/11/2025 11:53, Tvrtko Ursulin escreveu:
> 
> On 20/11/2025 14:39, André Almeida wrote:
>> Hi Tvrtko,
>>
>> Em 12/11/2025 06:27, Tvrtko Ursulin escreveu:
>>> Using a helper shrinks the code and separating the user and kernel slabs
>>> is more secure.
>>
>> As in the commit message, the commit description should be writing in 
>> the imperative mood.
> 
> "Use a helper to shrink the code and separate the user and kernel slabs 
> for better security."
> 
> This sounds good?
> 

All good to me, thanks! With both observations addressed:

Reviewed-by: André Almeida <andrealmeid@igalia.com>

>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> ---
>>> v2:
>>>   * Remove now unused dev local.
>>> ---
>>>   drivers/gpu/drm/drm_gem.c | 13 +++----------
>>>   1 file changed, 3 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index a1a9c828938b..68168d58a7c8 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -783,7 +783,6 @@ static int objects_lookup(struct drm_file *filp, 
>>> u32 *handle, int count,
>>>   int drm_gem_objects_lookup(struct drm_file *filp, void __user 
>>> *bo_handles,
>>>                  int count, struct drm_gem_object ***objs_out)
>>>   {
>>> -    struct drm_device *dev = filp->minor->dev;
>>>       struct drm_gem_object **objs;
>>>       u32 *handles;
>>>       int ret;
>>> @@ -798,15 +797,9 @@ int drm_gem_objects_lookup(struct drm_file 
>>> *filp, void __user *bo_handles,
>>>       *objs_out = objs;
>>> -    handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
>>> -    if (!handles) {
>>> -        ret = -ENOMEM;
>>> -        goto out;
>>> -    }
>>> -
>>> -    if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>>> -        ret = -EFAULT;
>>> -        drm_dbg_core(dev, "Failed to copy in GEM handles\n");
>>
>> Why the debugged message has been removed?
> 
> I should indeed have mentioned in the commit message:
> 
> "While at it lets remove the useless debug message."
> 
> Regards,
> 
> Tvrtko
>>> +    handles = vmemdup_array_user(bo_handles, count, sizeof(u32));
>>> +    if (IS_ERR(handles)) {
>>> +        ret = PTR_ERR(handles);
>>>           goto out;
>>>       }
>>

