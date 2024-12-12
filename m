Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB149EFB83
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB6510E64C;
	Thu, 12 Dec 2024 18:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CBk5+fbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74510E64C;
 Thu, 12 Dec 2024 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JAFcxHXTlvHsT25S57LpsY+SoS6Z7yQppFWLsddyh90=; b=CBk5+fbcGtIbhrgXDirSsOB7xn
 LLdZCDl3KhEUsJGYWm49Hc/Omvh1gOI/W5QAnQl43KTUWTg+Kre1S8jc2ojcKZgj9saR6nz2QnDsG
 aDxZhRmrd3Czp4lytsF5EWv09Uk8wN1sWpaN5phYHt0rJS54lazeff5ldKnkncUUJuD6PqE4VNswF
 PHiwuB8Q2Lhf4/+gns8aa4E9Zg9XfOEFCm7eYUhm8JzJeis2gMLrTUUcfjVsEvFgeil/F34DxQ3HD
 AHp/Xfejllx+1fSi7rKXfoyWYOqjil8ELZYc0FBTrHf6r5plgTQuFLljgGW25eOuIyGu/Nwa53Ixz
 Hl4E8iRg==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tLoGq-002MJu-CG; Thu, 12 Dec 2024 19:50:44 +0100
Message-ID: <cfb07238-841c-45ca-9a8e-c5aca80ee47c@igalia.com>
Date: Thu, 12 Dec 2024 15:50:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] drm/doc: Document device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-3-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20241128153707.1294347-3-raag.jadav@intel.com>
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



Em 28/11/2024 12:37, Raag Jadav escreveu:
> Add documentation for device wedged event in a new 'Device wedging'
> chapter. The describes basic definitions, prerequisites and consumer
> expectations along with an example.
> 
>   v8: Improve documentation (Christian, Rodrigo)
>   v9: Add prerequisites section (Christian)
> v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   Documentation/gpu/drm-uapi.rst | 112 ++++++++++++++++++++++++++++++++-
>   1 file changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index b75cc9a70d1f..da2927cde53d 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -371,9 +371,115 @@ Reporting causes of resets

I think it's a good idea to add a note about "device wedged event" in 
the section "Device reset > Kernel Mode Driver" since the idea is to 
explain what should kernel developer add to their kernel drivers to be 
used when a device resets.

>   
>   Apart from propagating the reset through the stack so apps can recover, it's
>   really useful for driver developers to learn more about what caused the reset in
> -the first place. DRM devices should make use of devcoredump to store relevant
> -information about the reset, so this information can be added to user bug
> -reports.
> +the first place. For this, drivers can make use of devcoredump to store relevant
> +information about the reset and send device wedged event without recovery method

and send a device wedged event with recovery method as "none" (as 
explained in the chapter "Device wedging")

> +(as explained in next chapter) to notify userspace, so this information can be
> +collected and added to user bug reports.
> +

With those changes applied:

Reviewed-by: André Almeida <andrealmeid@igalia.com>

