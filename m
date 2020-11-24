Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BD2C1F74
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0A6E209;
	Tue, 24 Nov 2020 08:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2306E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 01:59:02 +0000 (UTC)
IronPort-SDR: Zb8A8Ne6e9LJs2RHchgOoTfGwgeTQ8TO6DQaf2kztFs0gTXbotPiRZuiTijivZ0QepTdR2SYLS
 pM9gdoUzIjOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="158918695"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="158918695"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 17:59:02 -0800
IronPort-SDR: CaDAt9UDhGHqufvBvoa2tWzXJH2+gmjDSyzErutaX0KETUJfRMe9dBT44e6c4RKVoGnROpXyEF
 vjfQqSpUb9Zw==
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="478335191"
Received: from xingzhen-mobl.ccr.corp.intel.com (HELO [10.238.4.68])
 ([10.238.4.68])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 17:58:58 -0800
Subject: Re: [drm/fb] 6a1b34c0a3:
 WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work
To: Thomas Zimmermann <tzimmermann@suse.de>,
 kernel test robot <oliver.sang@intel.com>
References: <20201122141849.GH2390@xsang-OptiPlex-9020>
 <5dddb55b-cbe1-7778-3109-b84624bac407@suse.de>
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
Message-ID: <aa34dc60-96c1-e188-a0f8-51b7f8275e69@linux.intel.com>
Date: Tue, 24 Nov 2020 09:58:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5dddb55b-cbe1-7778-3109-b84624bac407@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: 0day robot <lkp@intel.com>, airlied@linux.ie,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org, christian.koenig@amd.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/23/2020 4:04 PM, Thomas Zimmermann wrote:
> Hi
> =

> Am 22.11.20 um 15:18 schrieb kernel test robot:
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 6a1b34c0a339fdc75d7932ad5702f2177c9d7a1c ("drm/fb-helper: Move =

>> damage blit code and its setup into separate routine")
>> url: =

>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-fb-helper=
-Various-fixes-and-cleanups/20201120-182750 =

>>
>>
>>
>> in testcase: trinity
>> version: trinity-static-i386-x86_64-f93256fb_2019-08-28
>> with following parameters:
>>
>> =A0=A0=A0=A0runtime: 300s
>>
>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>>
>>
>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 =

>> -m 8G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire =

>> log/backtrace):
> =

> That dmesg is full of messages like
> =

> [=A0 696.323556] alloc_vmap_area: 24 callbacks suppressed
> [=A0 696.323562] vmap allocation for size 3149824 failed: use =

> vmalloc=3D<size> to increase size
> =

> I think the test system needs to be reconfigured first.
> =


We have tried "vmalloc=3D256M" and "vmalloc=3D512M", the same warning still =

happened.


> Best regards
> Thomas
> =

>>
>>
>> +-----------------------------------------------------------------------=
+------------+------------+ =

>>
>> |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | =

>> 154f2d1afd | 6a1b34c0a3 |
>> +-----------------------------------------------------------------------=
+------------+------------+ =

>>
>> | =

>> WARNING:at_drivers/gpu/drm/drm_fb_helper.c:#drm_fb_helper_damage_work =

>> | 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 36=A0=A0=A0=A0=A0=A0=A0=A0 |
>> | =

>> EIP:drm_fb_helper_damage_work                                         =

>> | 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 36=A0=A0=A0=A0=A0=A0=A0=A0 |
>> +-----------------------------------------------------------------------=
+------------+------------+ =

>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> [=A0 106.616652] WARNING: CPU: 1 PID: 173 at =

>> drivers/gpu/drm/drm_fb_helper.c:434 drm_fb_helper_damage_work+0x371/0x390
>> [=A0 106.627732] Modules linked in:
>> [=A0 106.632419] CPU: 1 PID: 173 Comm: kworker/1:2 Not tainted =

>> 5.10.0-rc4-next-20201120-00007-g6a1b34c0a339 #3
>> [=A0 106.637806] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =

>> BIOS 1.12.0-1 04/01/2014
>> [=A0 106.642853] Workqueue: events drm_fb_helper_damage_work
>> [=A0 106.647664] EIP: drm_fb_helper_damage_work+0x371/0x390
>> [=A0 106.652305] Code: b1 17 c7 01 68 bd 5b 2d c5 53 50 68 55 21 2d c5 =

>> 83 15 44 b1 17 c7 00 e8 ae bc b1 01 83 05 48 b1 17 c7 01 83 15 4c b1 =

>> 17 c7 00 <0f> 0b 83 05 50 b1 17 c7 01 83 15 54 b1 17 c7 00 83 c4 10 e9 =

>> 78 fd
>> [=A0 106.663517] EAX: 0000002d EBX: c8730520 ECX: 00000847 EDX: 00000000
>> [=A0 106.668423] ESI: ca987000 EDI: cab274d8 EBP: f62f5f20 ESP: f62f5ee8
>> [=A0 106.673214] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: =

>> 00010246
>> [=A0 106.678295] CR0: 80050033 CR2: 00000000 CR3: 063a7000 CR4: 000406d0
>> [=A0 106.683160] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
>> [=A0 106.687967] DR6: fffe0ff0 DR7: 00000400
>> [=A0 106.690763] Call Trace:
>> [=A0 106.693394]=A0 process_one_work+0x3ea/0xaa0
>> [=A0 106.693501] ixgbevf: Intel(R) 10 Gigabit PCI Express Virtual =

>> Function Network Driver
>> [=A0 106.695300]=A0 worker_thread+0x330/0x900
>> [=A0 106.697406] ixgbevf: Copyright (c) 2009 - 2018 Intel Corporation.
>> [=A0 106.702963]=A0 kthread+0x190/0x210
>> [=A0 106.705709]=A0 ? rescuer_thread+0x650/0x650
>> [=A0 106.708379]=A0 ? kthread_insert_work_sanity_check+0x120/0x120
>> [=A0 106.711271]=A0 ret_from_fork+0x1c/0x30
>> [=A0 106.713973] ---[ end trace dd528799d3369ac1 ]---
>>
>>
>> To reproduce:
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0 # build kernel
>> =A0=A0=A0=A0cd linux
>> =A0=A0=A0=A0cp config-5.10.0-rc4-next-20201120-00007-g6a1b34c0a339 .conf=
ig
>> =A0=A0=A0=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prep=
are =

>> modules_prepare bzImage
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0 git clone https://github.com/intel/lkp-tests.git
>> =A0=A0=A0=A0=A0=A0=A0=A0 cd lkp-tests
>> =A0=A0=A0=A0=A0=A0=A0=A0 bin/lkp qemu -k <bzImage> job-script # job-scri=
pt is attached =

>> in this email
>>
>>
>>
>> Thanks,
>> Oliver Sang
>>
> =

> =

> _______________________________________________
> LKP mailing list -- lkp@lists.01.org
> To unsubscribe send an email to lkp-leave@lists.01.org
> =


-- =

Zhengjun Xing
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
