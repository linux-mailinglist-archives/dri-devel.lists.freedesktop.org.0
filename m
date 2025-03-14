Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19980A610AA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 13:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F5F10E9C7;
	Fri, 14 Mar 2025 12:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fM5lvj0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00CA10E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741954279;
 bh=HhblN6Qj5S8/SU1qllYaeAkn6GMN6+wfLrFAqAeEljE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fM5lvj0r5QJg7oEaOGWcfqd4LoqNcE9r1MIzwptVFPVLM0ClhES0oouZFnQlaCMo5
 MxutYJNMQaYZaPuw9GVgxo8PLAhY/pxC6m/x1c5OYTpxwO0Cg5LInYv8Qo/deEHQFQ
 10nC55cLqKmQTHYsDtqoSlAHzsGc2A0ICBJLiaW1CgIVrBgBQcqVZxfiJAQMbRXcwZ
 zO/sV9gZdIJRPgVHbsRa5BsYdztTBHwRY6sb6xjBM4kFtjrFXDC9upyxn8yvgIWiZF
 KwTNrwTp4M1MGWjiuDn3GGPuZmQSctAI60f0WmdO+bwf2/HFdHyB0VazNhx+6ruE9X
 H1lvKBFNgmHiQ==
Received: from [10.20.64.106] (unknown [103.163.65.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 262A117E017D;
 Fri, 14 Mar 2025 13:11:14 +0100 (CET)
Message-ID: <aa3eead2-b416-4f33-a6a1-1af19665989c@collabora.com>
Date: Fri, 14 Mar 2025 17:41:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: vkms: kms_flip@modeset-vs-vblank-race flake
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: "hamohammed.sa" <hamohammed.sa@gmail.com>, simona.vetter@ffwll.ch,
 "melissa.srw" <melissa.srw@gmail.com>,
 "maarten.lankhorst" <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, tzimmermann <tzimmermann@suse.de>,
 airlied <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, daniels <daniels@collabora.com>,
 sergi.blanch.torne@collabora.com,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 corentin.noel@collabora.com
References: <2364a6bf-e6bc-4741-8c78-cea8bdb06e03@collabora.com>
 <1ebda1a2-779b-4642-9df2-d24cbf223875@bootlin.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <1ebda1a2-779b-4642-9df2-d24cbf223875@bootlin.com>
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

Hi Louis,

On 13/03/25 19:30, Louis Chauvet wrote:
> 
> 
> Le 13/03/2025 à 11:45, Vignesh Raman a écrit :
>> Hi Maintainers,
>>
> 
> Hi Vignesh,
> 
> Thanks for the report.
> 
> On my setup, this test passed, and the others are skipped.
> 
> I think the issue on this specific test may be due to performance (seems 
> to be a timing issue, I will try to slow down my VM). The other tests 
> require suspend/resume, which I failed to setup on my VM.
> 
> To understand what is wrong, I would like to have an environment very 
> similar to the CI, how can I reproduce this on my machine? Is there a 
> setup script somewhere I can run to create a virtual machine?

You can follow the instructions below to use the same container that 
drm-ci uses from mesa (From pipeline 
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72473690). 
drm-ci uses the crosvm-runner.sh script. You can also build specific IGT 
version and run the tests from the container. Thanks Corentin for the 
documentation.

https://gitlab.collabora.com/virgl-es/documentation/-/blob/master/dev-ci-container.md

If you want to run only specific tests for vkms in drm-ci, you can use 
this commit,
https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/0773affa01a4347056c891bc58887ae1daa0161c

Once the pipeline is created you can use the ci_run_n_monitor.py [1] 
from mesa project to run only vkms and its dependent jobs.

../mesa/bin/ci/ci_run_n_monitor.py --pipeline-url 
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1384344 
--target vkms:none

[1] 
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/bin/ci/ci_run_n_monitor.py

Please let us know if you need more information. Thanks.

Regards,
Vignesh

> 
> Thanks,
> Louis Chauvet
> 
>> There are some flake test reported for vkms driver testing in drm-ci.
>>
>> # Board Name: vkms
>> # Failure Rate: 20
>> # IGT Version: 1.30-g04bedb923
>> # Linux Version: 6.14.0-rc4
>> kms_flip@modeset-vs-vblank-race
>>
>> DEBUG - Begin test kms_flip@modeset-vs-vblank-race
>> ERROR - Igt error: (kms_flip:1250) CRITICAL: Test assertion failure
>> function run_test_step, file ../tests/kms_flip.c:979:
>> ERROR - Igt error: (kms_flip:1250) CRITICAL: Failed assertion: end -
>> start > 0.9 * actual_frame_time(o) && end - start < 2.6 *
>> actual_frame_time(o)
>> ERROR - Igt error: (kms_flip:1250) CRITICAL: wait for two vblanks took
>> 47374 usec (frame time 16665.600000 usec)
>> ERROR - Igt error: Dynamic subtest A-Virtual17 failed.
>> ERROR - Igt error: **** DEBUG ****
>> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
>> igt_create_fb_with_bo_size(width=1024, height=768,
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
>> igt_create_fb_with_bo_size(handle=1, pitch=4096)
>> ERROR - Igt error: (kms_flip:1250) ioctl_wrappers-DEBUG: Test
>> requirement passed: igt_has_fb_modifiers(fd)
>> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
>> igt_create_fb_with_bo_size(width=1024, height=768,
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG:
>> igt_create_fb_with_bo_size(handle=2, pitch=4096)
>> ERROR - Igt error: (kms_flip:1250) ioctl_wrappers-DEBUG: Test
>> requirement passed: igt_has_fb_modifiers(fd)
>> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: Test requirement
>> passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> ERROR - Igt error: (kms_flip:1250) igt_fb-DEBUG: Test requirement
>> passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> ERROR - Igt error: (kms_flip:1250) igt_kms-INFO:   1024x768: 60 65000
>> 1024 1048 1184 1344 768 771 777 806 0x48 0xa
>> ERROR - Igt error: (kms_flip:1250) DEBUG: No stale events found
>> ERROR - Igt error: (kms_flip:1250) INFO: Expected frametime: 16666us;
>> measured 16665.6us +- 0.500us accuracy 0.01%
>> ERROR - Igt error: (kms_flip:1250) CRITICAL: Test assertion failure
>> function run_test_step, file ../tests/kms_flip.c:979:
>> ERROR - Igt error: (kms_flip:1250) CRITICAL: Failed assertion: end -
>> start > 0.9 * actual_frame_time(o) && end - start < 2.6 *
>> actual_frame_time(o)
>> ERROR - Igt error: (kms_flip:1250) CRITICAL: wait for two vblanks took
>> 47374 usec (frame time 16665.600000 usec)
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO: Stack trace:
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #0
>> ../lib/igt_core.c:2055 __igt_fail_assert()
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #1
>> ../tests/kms_flip.c:1023 run_test_on_crtc_set.constprop.0()
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #2
>> ../tests/kms_flip.c:1845 run_test()
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #3
>> ../tests/kms_flip.c:2078 __igt_unique____real_main2001()
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #4
>> ../tests/kms_flip.c:2001 main()
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #5
>> [__libc_init_first+0x8a]
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #6
>> [__libc_start_main+0x85]
>> ERROR - Igt error: (kms_flip:1250) igt_core-INFO:   #7 [_start+0x21]
>> ERROR - Igt error: ****  END  ****
>> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Test assertion
>> failure function kmstest_set_connector_dpms, file ../lib/igt_kms.c:2246:
>> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Failed assertion:
>> found_it
>> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: Last errno: 9, Bad
>> file descriptor
>> ERROR - Igt error: (kms_flip:1250) igt_kms-CRITICAL: DPMS property not
>> found on 39
>> ERROR - Test kms_flip@modeset-vs-vblank-race: Fail: See
>> "/builds/vigneshraman/linux/results/igt.kms_flip@modeset-vs-vblank- 
>> race.log"
>> DEBUG - End test kms_flip@modeset-vs-vblank-race
>>
>> Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/ 
>> jobs/72473690
>>
>> Please could you have a look at these test results and let us know if
>> you need more information. Thank you.
>>
>> Regards,
>> Vignesh
> 

