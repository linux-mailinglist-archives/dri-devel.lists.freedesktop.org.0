Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5B204CB6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 10:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484166E907;
	Tue, 23 Jun 2020 08:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C946E907
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:42:22 +0000 (UTC)
IronPort-SDR: 63m/BygW93TlvzvTSFmOqNrgIlJ90Yvov2PAxd2+aXz0S9ZoquQOgHqYJwi7ZiT6ClNgYCH2Go
 2zCxCByewB7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="228674312"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="228674312"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 01:42:22 -0700
IronPort-SDR: nLDBnRfhsGtImtksNUoKGLC7pn2zeCBEyOm82AAPW4alBAXst0U1Nd6sM/MNKZVpM0R68g/a14
 JF0/zV0VDCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="319091250"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2020 01:42:20 -0700
Subject: Re: [PATCH] drm/mgag200: Enable caching for SHMEM pages
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20200618133435.25425-1-tzimmermann@suse.de>
 <20200622150050.GV5535@shao2-debian>
 <31025445-7ffd-7feb-5af9-097f8c657410@suse.de>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <054d6509-1572-c7ed-e964-68fdfa482bb2@intel.com>
Date: Tue, 23 Jun 2020 16:41:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <31025445-7ffd-7feb-5af9-097f8c657410@suse.de>
Content-Language: en-US
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
Cc: John Donnelly <john.p.donnelly@Oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/22/20 11:12 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 22.06.20 um 17:00 schrieb Rong Chen:
>> Hi Thomas,
>>
>> I tested the patch based on commit 24b806b0a1dd3, the regression
> Thanks!
>
>> of phoronix-test-suite.glmark2.1024x768.score still exists:
> I expected that the test is related to drawing onto the screen.

Hi Thomas,

This server doesn't connect a monitor.

> Do you
> know what exactly it is testing?

It's a glmark2 test, please see 
https://openbenchmarking.org/test/pts/glmark2
the test command is ./glmark2 --annotate -s 1024x768

Best Regards,
Rong Chen


> Best regards
> Thomas
>
>> 1f58fcaf27cb7 drm/mgag200: Enable caching for SHMEM pages                                            2 2 2
>> 24b806b0a1dd3 drm-tip: 2020y-06m-22d-07h-52m-06s UTC integration manifest                            2 2 2 2 2
>> 913ec479bb5cc drm/mgag200: Replace VRAM helpers with SHMEM helpers                                   2 2 2 2 2
>> 88fabb75ea9ed drm/mgag200: Convert to simple KMS helper                                              165 168 167 165 164
>>
>> Best Regards,
>> Rong Chen
>>
>> On Thu, Jun 18, 2020 at 03:34:35PM +0200, Thomas Zimmermann wrote:
>>> We've had reports about performance regressions after switching
>>> mgag200 from VRAM helpers to SHMEM helpers. SHMEM pages use
>>> writecombine caching by default, but can also use the platform's
>>> default page caching. Doing so improves the performance of I/O
>>> on the framebuffer.
>>>
>>> Mgag200's hardware does not access framebuffer pages directly (i.e.,
>>> via DMA), so enabling caching does not have an effect on consistency
>>> of the framebuffer memory or the displayed data.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 913ec479bb5c ("drm/mgag200: Replace VRAM helpers with SHMEM helpers")
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Emil Velikov <emil.velikov@collabora.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Rong Chen <rong.a.chen@intel.com>
>>> Cc: John Donnelly <john.p.donnelly@Oracle.com>
>>> Link: https://lore.kernel.org/dri-devel/20200617092252.GA5279@shao2-debian/
>>> ---
>>>   drivers/gpu/drm/mgag200/mgag200_drv.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
>>> index e19660f4a637..7189c7745baf 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>>> @@ -36,6 +36,7 @@ static struct drm_driver mgag200_driver = {
>>>   	.major = DRIVER_MAJOR,
>>>   	.minor = DRIVER_MINOR,
>>>   	.patchlevel = DRIVER_PATCHLEVEL,
>>> +	.gem_create_object = drm_gem_shmem_create_object_cached,
>>>   	DRM_GEM_SHMEM_DRIVER_OPS,
>>>   };
>>>   
>>> -- 
>>> 2.27.0
>>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
