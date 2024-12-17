Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291399F4A62
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262AD10E20E;
	Tue, 17 Dec 2024 11:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="k4Pc7NCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465C10E20E;
 Tue, 17 Dec 2024 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q0C9ZfTUJSBEghSJHIUvn6yAyoiJhPjoU7oXeo5Ike4=; b=k4Pc7NCHPvTE0AreRMR4Q+aKi2
 PCjGKHK981TDSEby1+G5kVBV7jCjmVoa8SPlXypb0Zied2DAp7e2K6G/3ofbqGLCW1CpZEJql7Rp4
 L0VtJPS+wD/0+MQbCisyCvSV/Qzpy9xZzBvZTIvY8uUsbBcdRG6A0+pAj60FXsp7wNa/fJmbFnE+q
 lXkttLiHJzbX+j1s1sTWg+aQltXcZoZpE1JtG1d2p7aYI6rJzDqE7toIsr+Lod2Czx5ZwSO8WTg3F
 Iv6teQAc5SayNue/fcGUsWIS/KGomcWneSOiNMhbPTrEGtFw75oCC0g7DZ5zjNY7bcR22UrSnAb+B
 jh+8afQQ==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNWCh-004LpZ-5X; Tue, 17 Dec 2024 12:57:31 +0100
Message-ID: <314af6e1-82e5-405f-aa2c-21708207e7d8@igalia.com>
Date: Tue, 17 Dec 2024 08:57:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
 <cfb07238-841c-45ca-9a8e-c5aca80ee47c@igalia.com>
 <Z2E5ZbRym80khid2@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <Z2E5ZbRym80khid2@black.fi.intel.com>
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

Em 17/12/2024 05:42, Raag Jadav escreveu:
> On Thu, Dec 12, 2024 at 03:50:29PM -0300, André Almeida wrote:
>> Em 28/11/2024 12:37, Raag Jadav escreveu:
>>> Add documentation for device wedged event in a new 'Device wedging'
>>> chapter. The describes basic definitions, prerequisites and consumer
>>> expectations along with an example.
>>>
>>>    v8: Improve documentation (Christian, Rodrigo)
>>>    v9: Add prerequisites section (Christian)
>>> v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    Documentation/gpu/drm-uapi.rst | 112 ++++++++++++++++++++++++++++++++-
>>>    1 file changed, 109 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>> index b75cc9a70d1f..da2927cde53d 100644
>>> --- a/Documentation/gpu/drm-uapi.rst
>>> +++ b/Documentation/gpu/drm-uapi.rst
>>> @@ -371,9 +371,115 @@ Reporting causes of resets
>>
>> I think it's a good idea to add a note about "device wedged event" in the
>> section "Device reset > Kernel Mode Driver" since the idea is to explain
>> what should kernel developer add to their kernel drivers to be used when a
>> device resets.
> 
> Wouldn't that be just a repetition of below? Also, I'm not sure if it's a hard
> requirement.
> 

Right, it can get repetitive indeed, no need to apply this suggestion then.
