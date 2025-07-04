Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D4AF9AE6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 20:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4002E10EA49;
	Fri,  4 Jul 2025 18:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XWURf2Eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BC510EA49
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=42XmKWmkZOBKqoppcAX7MLfKR1swd4WMG7QYpGY8LJo=; b=XWURf2EgT9RSMDqbX8m/Z6/qED
 AdAugS5J7nUAbyOKXGydPF9fipN9BGzfd3Oow+ZiOORFvIhblkdS88FshK7SB3AmBpje2spU1eOBx
 zoq3PKbVaUg2bv4plPwQCJdcGaZnNMtMAHk3oXHD/jePYGa5E6ka+kchbi0n8GAc+upoT6bffjDzI
 qKsgXprvqt9Jtv1JCKvYi1aLKblqsiP7NLQzo0soT3Q2reI0BXMz9ZUfFKVa5bUHtUjwhEF7/9i0f
 JvKXEUPPI7HQRWKo7rUcS6i9IxwpB9NAtk17EfdK3gglzsIUJFRvzqkWaLoyh+VMAN71BhYxMyGeC
 IVi3M9nQ==;
Received: from [179.100.5.63] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXlTi-00CXk3-Hi; Fri, 04 Jul 2025 20:49:42 +0200
Message-ID: <73a84621-400e-41f8-b3a3-96499fc3320b@igalia.com>
Date: Fri, 4 Jul 2025 15:49:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <aGggPuSCEK_opydS@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aGggPuSCEK_opydS@black.fi.intel.com>
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

Em 04/07/2025 15:41, Raag Jadav escreveu:
> On Fri, Jun 27, 2025 at 02:17:13PM -0300, André Almeida wrote:
>> Fix the following warning:
>>
>> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
>>
>> Task information
>> --------------- [docutils]
>>
>> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v2: Add Reported-by tag
>> ---
>>   Documentation/gpu/drm-uapi.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 263e5a97c080..10dea6a1f097 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
>>   complete wedging.
>>   
>>   Task information
>> ----------------
>> +----------------
>>   
>>   The information about which application (if any) was involved in the device
>>   wedging is useful for userspace if they want to notify the user about what
>> @@ -728,4 +728,4 @@ Stable uAPI events
>>   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>>   
>>   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> -   :doc: uAPI trace events
>> \ No newline at end of file
>> +   :doc: uAPI trace events
> 
> Unrelated change. Someone with a different editor added this and now
> your editor disagrees with it.
> 
> Switching to binary mode usually fixes the issue.
> 
> Raag

After fixing that, can I add your Reviewed-by:?
