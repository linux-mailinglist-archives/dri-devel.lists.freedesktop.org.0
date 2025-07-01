Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7693AAF0188
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 19:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401910E2D4;
	Tue,  1 Jul 2025 17:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LMW4Qskz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4B510E107;
 Tue,  1 Jul 2025 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6IEtzqE137u9jHssTSFjJCmKDbuni2jML6h3b370Esw=; b=LMW4QskzgN+AmWYIdci2g3KNqY
 vDTc4KmueohTnV3NHrg/8zyQIrmRtzAd8/jo/y7VdbCwxkXQBtiFwobVFCov9st88rSTCLxKuvMm0
 016kNTF3GGHXTwetTWSuczPT9hjXKZUmRpFzIo3ONvk+q7u9+2qKE+Zs9oDB+tfkaC1NRaXopD/zG
 Yh+VLGd/O75HIH9FPtZiefybglAj1nalP+YcZwCTz6OTiH7mIFsy3ZJi4z1ioPuMrtye3qOz0r2l/
 naxaZOhcnaoe9/GcfUg6cCTMOw3rzRCaXE8jl7Ls7KQVjbXO4uOZW/RJl5u7lXap19VBmekUJrok3
 PZLqceRQ==;
Received: from [179.100.5.63] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWeaU-00B4RS-0I; Tue, 01 Jul 2025 19:16:06 +0200
Message-ID: <a820d534-42ef-4391-ab81-36316af4411b@igalia.com>
Date: Tue, 1 Jul 2025 14:15:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Riana Tauro <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 David Airlie <airlied@gmail.com>
References: <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com> <aFsaXXKZSBPrcYJb@intel.com>
 <aF8PZMuMgmWKYJgo@intel.com> <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
 <aGLKgholpl8Z3zWm@intel.com> <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
 <eb143cc5-306c-4900-b391-9ee023c1c5b7@intel.com>
 <aGPvbagza6HwF4kE@black.fi.intel.com>
 <8f0c1489-df00-4d40-a51c-39dcfa185d3e@amd.com>
 <aGQGnrDZRcq9pC9q@black.fi.intel.com>
 <6e1aaa77-2d4f-484f-8abd-b62d7ddb80b5@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <6e1aaa77-2d4f-484f-8abd-b62d7ddb80b5@intel.com>
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

Em 01/07/2025 13:44, Riana Tauro escreveu:
> 
> 
> On 7/1/2025 9:32 PM, Raag Jadav wrote:
>> On Tue, Jul 01, 2025 at 04:35:42PM +0200, Christian König wrote:
>>> On 01.07.25 16:23, Raag Jadav wrote:
>>>> On Tue, Jul 01, 2025 at 05:11:24PM +0530, Riana Tauro wrote:
>>>>> On 7/1/2025 5:07 PM, Riana Tauro wrote:
>>>>>> On 6/30/2025 11:03 PM, Rodrigo Vivi wrote:
>>>>>>> On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
>>>>>>>> On 27.06.25 23:38, Rodrigo Vivi wrote:
>>>>>>>>>>> Or at least print a big warning into the system log?
>>>>>>>>>>>
>>>>>>>>>>> I mean a firmware update is usually something which
>>>>>>>>>>> the system administrator triggers very explicitly
>>>>>>>>>>> because when it fails for some reason (e.g.
>>>>>>>>>>> unexpected reset, power outage or whatever) it can
>>>>>>>>>>> sometimes brick the HW.
>>>>>>>>>>>
>>>>>>>>>>> I think it's rather brave to do this automatically.
>>>>>>>>>>> Are you sure we don't talk past each other on the
>>>>>>>>>>> meaning of the wedge event?
>>>>>>>>>>
>>>>>>>>>> The goal is not to do that automatically, but raise the
>>>>>>>>>> uevent to the admin
>>>>>>>>>> with enough information that they can decide for the right 
>>>>>>>>>> correctable
>>>>>>>>>> action.
>>>>>>>>>
>>>>>>>>> Christian, Andre, any concerns with this still?
>>>>>>>>
>>>>>>>> Well, that sounds not quite the correct use case for wedge events.
>>>>>>>>
>>>>>>>> See the wedge event is made for automation.
>>>>>>>
>>>>>>> I respectfully disagree with this statement.
>>>>>>>
>>>>>>> The wedged state in i915 and xe, then ported to drm, was never 
>>>>>>> just about
>>>>>>> automation. Of course, the unbind + flr + rebind is one that driver
>>>>>>> cannot
>>>>>>> do by itself, hence needs automation. But wedge cases were also very
>>>>>>> useful
>>>>>>> in other situations like keeping the device in the failure stage for
>>>>>>> debuging
>>>>>>> (without automation) or keeping other critical things up like
>>>>>>> display with SW
>>>>>>> rendering (again, nothing about automation).
>>>
>>> Granted, automation is probably not the right term.
>>>
>>> What I wanted to say is that the wedge event should not replace 
>>> information in the system log.
>>>
>>>>>>>
>>>>>>>> For example to allow a process supervising containers get the
>>>>>>>> device working again and re-start the container which used it or
>>>>>>>> gather crash log etc .....
>>>>>>>>
>>>>>>>> When you want to notify the system administrator which manual
>>>>>>>> intervention is necessary then I would just write that into the
>>>>>>>> system log and raise a device event with WEDGED=unknown.
>>>>>>>>
>>>>>>>> What we could potentially do is to separate between
>>>>>>>> WEDGED=unknown and WEDGED=manual, e.g. between driver has no
>>>>>>>> idea what to do and driver printed useful info into the system
>>>>>>>> log.
>>>>>>>
>>>>>>> Well, you are right here. Even our official documentation in drm- 
>>>>>>> uapi.rst
>>>>>>> already tells that firmware flashing should be a case for 'unknown'.
>>>>>>
>>>>>> I had added specific method since we know firmware flash will recover
>>>>>> the error.  Sure will change it.
>>>>>>
>>>>>> In the current code, there is no recovery method named "unknown" even
>>>>>> though the document mentions it
>>>>>>
>>>>>> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/gpu/drm/
>>>>>> drm_drv.c#L534
>>>>>>
>>>>>> Since we are adding something new, can it be "manual" instead of 
>>>>>> unknown?
>>>>>
>>>>> Okay missed it. It's in the drm_dev_wedged_event function. Will use 
>>>>> unknown
>>>>>>
>>>>>>> Let's go with that then. And use other hints like logs and sysfs so,
>>>>>>> Admin
>>>>>>> has a better information of what to do.
>>>>>>>
>>>>>>>> But creating an event with WEDGED=firmware-flash just sounds to
>>>>>>>> specific, when we go down that route we might soon have
>>>>>>>> WEDGE=change- bios-setting, WEDGE=....
>>>>>>>
>>>>>>> Well, I agree that we shouldn't explode the options exponentially 
>>>>>>> here.
>>>>>>>
>>>>>>> Although I believe that firmware flashing should be a common case 
>>>>>>> in many
>>>>>>> case and could be a candidate for another indication.
>>>>>>>
>>>>>>> But let's move on with WEDGE='unknown' for this case.
>>>>
>>>> I understand that WEDGED=firmware-flash can't be handled in a 
>>>> generic way
>>>> for all drivers but it is simply not as same as WEDGED=unknown since 
>>>> the
>>>> driver knows something specific needs to be done here.
>>>>
>>>> I'm wondering if we could add a WEDGED=vendor-specific method for such
>>>> cases?
>>>
>>> Works for me as well.
>>>
>>> My main concern was that we should not start to invent specific wedge 
>>> events for all kind of different problems.
>>>
>>> On the other hand what's the additional value to distinct between 
>>> unknown and vendor-specific?
>>>
>>> In other words even if the necessary handling is unknown to the wedge 
>>> event, the administrator could and should still examine the logs to 
>>> see what to do.
>>
>> They're somewhat similar except the consumer can execute vendor specific
>> triggers (look at some sys/proc entries or logs) based on device id that
>> the consumer is already familiar with as defined by the vendor, and could
>> potentially be automated.
>>
>> Unknown is basically "I'm clueless and good luck with your 
>> investigation".
>>
>> So the distinction is whether the driver is able to provide definition 
>> for
>> its vendor specific cases and how well documented they are.
> 
> Agree with Raag. We know which recovery method works here. Rather than 
> using 'unknown', 'manual/vendor' macro seems better with vendor specific 
> documentation for recovery.
> 

That makes sense for me as well, thanks!

> Thanks
> Riana
> 
>>
>> Raag
> 
> 

