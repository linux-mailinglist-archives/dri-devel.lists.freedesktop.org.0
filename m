Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE368A5F721
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BE210E194;
	Thu, 13 Mar 2025 14:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j8AfFLJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015B10E178
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:00:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EF6E20457;
 Thu, 13 Mar 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741874427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4th1xfAhxeNnhCqVA5l5BQOQHLDtHxDxY2MkG8tNN5Y=;
 b=j8AfFLJz2nb3KUTTbLdJN+NTaUuDMsfgXcbCbSEbY23iIuGB5TU//i4pIhQcDKthpRAtOy
 sRRpDjBTESbiFqhiaXx8G4pu9cw1O9hm8qasD7Rxg1wMGeOePHDklOkGGR1kwfa7zi/pCv
 Aoo+T/L/nilhgZPHmc52LGwKO6MCLohDVq5ZY0YfklXWBdn7aG3jcLQVIHqBTWuCDEEFpR
 lOOgVVRS7eHRnBEP2T2e5HD20n5IwgyrJA6WDnuYU8pX4O4Wbyg7kH/jzZj98NGyLwJLcm
 nlcf6KN/6ONksYgoPdCZOBWPtP8wQUTGbN6Z+rwGunq7BGh0kr4BAa7NIjT+iA==
Message-ID: <1ebda1a2-779b-4642-9df2-d24cbf223875@bootlin.com>
Date: Thu, 13 Mar 2025 15:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: vkms: kms_flip@modeset-vs-vblank-race flake
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: "hamohammed.sa" <hamohammed.sa@gmail.com>, simona.vetter@ffwll.ch,
 "melissa.srw" <melissa.srw@gmail.com>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, tzimmermann <tzimmermann@suse.de>,
 airlied <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, daniels <daniels@collabora.com>,
 sergi.blanch.torne@collabora.com,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
References: <2364a6bf-e6bc-4741-8c78-cea8bdb06e03@collabora.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <2364a6bf-e6bc-4741-8c78-cea8bdb06e03@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefftdduueetheejledvkeetjeekudfhffduvdeugfevfeeifeehieffjeetfefgveenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepvhhighhnvghshhdrrhgrmhgrnhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtp
 hhtthhopehsihhmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 13/03/2025 à 11:45, Vignesh Raman a écrit :
> Hi Maintainers,
> 

Hi Vignesh,

Thanks for the report.

On my setup, this test passed, and the others are skipped.

I think the issue on this specific test may be due to performance (seems 
to be a timing issue, I will try to slow down my VM). The other tests 
require suspend/resume, which I failed to setup on my VM.

To understand what is wrong, I would like to have an environment very 
similar to the CI, how can I reproduce this on my machine? Is there a 
setup script somewhere I can run to create a virtual machine?

Thanks,
Louis Chauvet

> There are some flake test reported for vkms driver testing in drm-ci.
> 
> # Board Name: vkms
> # Failure Rate: 20
> # IGT Version: 1.30-g04bedb923
> # Linux Version: 6.14.0-rc4
> kms_flip@modeset-vs-vblank-race
> 
> DEBUG - Begin test kms_flip@modeset-vs-vblank-race
> ERROR - Igt error: (kms_flip:1250) CRITICAL: Test assertion failure
> function run_test_step, file ../tests/kms_flip.c:979:
> ERROR - Igt error: (kms_flip:1250) CRITICAL: Failed assertion: end -
> start > 0.9 * actual_frame_time(o) && end - start < 2.6 *
> actual_frame_time(o)
> ERROR - Igt error: (kms_flip:1250) CRITICAL: wait for two vblanks took
> 47374 usec (frame time 16665.600000 usec)
> ERROR - Igt error: Dynamic subtest A-Virtual17 failed.
> ERROR - Igt error: **** DEBUG ****
> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
> igt_create_fb_with_bo_size(width=1024, height=768,
> format=XR24(0x34325258), modifier=0x0, size=0)
> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
> igt_create_fb_with_bo_size(handle=1, pitch=4096)
> ERROR - Igt error: (kms_flip:1250) ioctl_wrappers-DEBUG: Test
> requirement passed: igt_has_fb_modifiers(fd)
> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
> igt_create_fb_with_bo_size(width=1024, height=768,
> format=XR24(0x34325258), modifier=0x0, size=0)
> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
> igt_create_fb_with_bo_size(handle=2, pitch=4096)
> ERROR - Igt error: (kms_flip:1250) ioctl_wrappers-DEBUG: Test
> requirement passed: igt_has_fb_modifiers(fd)
> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: Test requirement
> passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: Test requirement
> passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> ERROR - Igt error: (kms_flip:1250) igt_kms-INFO:   1024x768: 60 65000
> 1024 1048 1184 1344 768 771 777 806 0x48 0xa
> ERROR - Igt error: (kms_flip:1250) DEBUG: No stale events found
> ERROR - Igt error: (kms_flip:1250) INFO: Expected frametime: 16666us;
> measured 16665.6us +- 0.500us accuracy 0.01%
> ERROR - Igt error: (kms_flip:1250) CRITICAL: Test assertion failure
> function run_test_step, file ../tests/kms_flip.c:979:
> ERROR - Igt error: (kms_flip:1250) CRITICAL: Failed assertion: end -
> start > 0.9 * actual_frame_time(o) && end - start < 2.6 *
> actual_frame_time(o)
> ERROR - Igt error: (kms_flip:1250) CRITICAL: wait for two vblanks took
> 47374 usec (frame time 16665.600000 usec)
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO: Stack trace:
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #0
> ../lib/igt_core.c:2055 __igt_fail_assert()
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #1
> ../tests/kms_flip.c:1023 run_test_on_crtc_set.constprop.0()
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #2
> ../tests/kms_flip.c:1845 run_test()
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #3
> ../tests/kms_flip.c:2078 __igt_unique____real_main2001()
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #4
> ../tests/kms_flip.c:2001 main()
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #5
> [__libc_init_first+0x8a]
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #6
> [__libc_start_main+0x85]
> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #7 [_start+0x21]
> ERROR - Igt error: ****  END  ****
> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Test assertion
> failure function kmstest_set_connector_dpms, file ../lib/igt_kms.c:2246:
> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Failed assertion:
> found_it
> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Last errno: 9, Bad
> file descriptor
> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: DPMS property not
> found on 39
> ERROR - Test kms_flip@modeset-vs-vblank-race: Fail: See
> "/builds/vigneshraman/linux/results/igt.kms_flip@modeset-vs-vblank-race.log"
> DEBUG - End test kms_flip@modeset-vs-vblank-race
> 
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72473690
> 
> Please could you have a look at these test results and let us know if
> you need more information. Thank you.
> 
> Regards,
> Vignesh

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

