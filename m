Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3658A234FA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 21:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C9D10E097;
	Thu, 30 Jan 2025 20:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="CciR1lv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn19011033.outbound.protection.outlook.com [52.103.12.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AB910E097
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 20:19:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxi09+l8Yh4dMj5+F/wJL4YoKuKcoYlW20baAkQSzA63Kwyr0U//kt6rOm8P73y5dy45Ui5CCBP1stt1Uf1cY66IsXhWM+K+VNRTEHmCOptt+4kBXM8RiJsQxqCzJ3SfW2XpJW+Xl9vONUL+rZ6LfFqwqGNballKPKuUqSFbo9H3fHn/2JfNBf4RppBMsr+t0JAXVh2LV0P6FzHgyMJNHspcIINIPZnOzR51Lknxdoc0jqJSTJv9Z0h31YPcUcSdeRM8jvwvHm2aDbuLRXn6lYDU4zjlFj04hY6G+jyV8Rq0Ri3vW/nVU9AiVOa+El2oDfIWiyTk+yEdYAYjHynd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nWABQVq75ldhVvaRk2v5005B81ReWF9UfBznTIDICY=;
 b=UsehuusF2kQ+gXn7I31qVgVT7j+cgkbfxKARw/3QrLwG+KNp562+A+QWwgIt53J8QAhJC+rRqWKuzynrRyO7XwfGpPM2eL9olaqfg5mQ0EINzgfjZKi4lRhHxKazzbxWaLgSzm/0YajjDvTJG0hCp7g6lGCA49Ce2ABGU5V24jC4g7A3KnluEuyItFVGHkwFOhtP6f8+rHdc8k7VmE5kSkQlYbgwwMgGrwDlZbhl+mYdXdRcpEpt6kEg1NZ+c+vLgl6vzD8jJBZP5CYaqC9piuiC7dmO0xtiE0VbGHd/zmDJ67DMQG6w44iMj+aj6bQyV3bvVm7X4zuTv8Fw16sIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nWABQVq75ldhVvaRk2v5005B81ReWF9UfBznTIDICY=;
 b=CciR1lv/FNyKaXqFQP+DuEV3yQaAhbmjTcQ8efEkyihNXOsDTQ66uCzk9PRzILSMT4OiLc2x88VBAvHB7EL2BFoF2yneZ+l++J8SoLMXc1Tdg+YLNtKYoiwc5Q+YJOIq0bA11uPtmgKCeeCw52HPx8S+NRLdm48bOo6V7WPdpC7fZXiPWj0pVhQ57gnopXMfuuygIGa2f2XnGE7JYOuR3OkUVP996LsukBp3fGjTN26scLr2HKUdly7pdC4N1oSspj3OAIJ7URjkqoiTtqXDwmDrT9J0WmSfYq9atOEIlnqKiXj2vEugjriXpe6zhSDRaBMPVg1NUU+Pf02bw16xRQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BL3PR02MB8282.namprd02.prod.outlook.com (2603:10b6:208:345::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 20:19:34 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 20:19:34 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Tai <thomas.tai@oracle.com>, "mhkelley58@gmail.com"
 <mhkelley58@gmail.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
 <decui@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Topic: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwAAALyBRA=
Date: Thu, 30 Jan 2025 20:19:34 +0000
Message-ID: <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
In-Reply-To: <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BL3PR02MB8282:EE_
x-ms-office365-filtering-correlation-id: 70e99210-b660-42eb-a0a5-08dd416b697f
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799006|8062599003|19110799003|8060799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?zkWTbE95NfhaWFYW8yg/XRgMAHDEbY7dPJXN/0su1P+AiBBw9lhTbAI9mNbl?=
 =?us-ascii?Q?AJzjOdx7a9ztapdCz3yadxf9XcdSfB50XUAl2UO7/YYqeIgCH3xasXspPy5W?=
 =?us-ascii?Q?SgPz+kHnlmIBxyskwGNZ3vodcJs8dTrqBpvPkIZ0ipgo5hKXGudSr2ZpRtxw?=
 =?us-ascii?Q?dHUvarkWOPV0aig6NNGLpfXcsw7GFz07DrZKKPQgP1V17+NmIhHhQS5q0+ZC?=
 =?us-ascii?Q?P0qBBBF+FrH+BC28AbTZzbINMpByZYo608O5mmx2VFjKFqz0xW1aybBW1S3Q?=
 =?us-ascii?Q?VI64Xf75IQ/TOtllSmxXpLvbnrob101YVVb9+w1DfpJHqMReIPhBNpJtxq32?=
 =?us-ascii?Q?MGI1U5GgS99dQtrZixzUqcNfP8NLoaJ981ueJ8FlaiBg9PRYzRZk9Uyy48sU?=
 =?us-ascii?Q?21uegJVKOKhf51GlUwl+r/TnnTKthry6KOJJ4JrjP42/7h1m3HY3/5arFj1/?=
 =?us-ascii?Q?xb1G7H0DfvfkTsSoFxyl7NS/eWpPbiyUr0b5nojlNxrcl1FyH+OViYfDMrNf?=
 =?us-ascii?Q?n/GKFn/bVQsgr3PnGVuY878vIx2YX3OTn5fKAphsmaYIv7bfkBFxJwT2lpkw?=
 =?us-ascii?Q?K4OJBBTKxi5qUJtNiIgePkkG2szfZ2mXORPT7tnBllfkUQ+cI/0yWA38P++x?=
 =?us-ascii?Q?8havj4OqGRHAEvG1crHT9a3yUFC8f/2Ueq5z5mPORUn/a5rqL1php+4Jcz/u?=
 =?us-ascii?Q?fFCD/giye1Q8JHEAGu/PFOcVj1AnIqK6Xn4uXR0+4xa+rr8Ttcqgfk77v4r5?=
 =?us-ascii?Q?mWPirkts9ToaPfiLBJAa7fsDHMHnI7jx0HaA/wtWbM63cawnIulSRXnTFxWq?=
 =?us-ascii?Q?6Ddc7VQ5bdHsvHt29JjdgvCwnUqfOEH0vvX6MvtN1063eY1sbjqDRrviK2G7?=
 =?us-ascii?Q?FvCf6+vuaUMRT3KOPPdDyEkUmobZH1a7PBY+/fsEvAd6rddRGGB01Pm32Y2i?=
 =?us-ascii?Q?A5ouXtFBpLkbKeL5+nFoI/X5MHtmPJf1t8sxUlp5Cnsg8GKL3WpX5/9wkl8i?=
 =?us-ascii?Q?+ejrDgcC6o5PhHwZ+WljsCVRYVsBWZBpj1AEW1AuMD8J1eE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5S2tF4RvrnHPrLQAwSvZT2+NPd/xmjtExDEdewzI0CP4dgQYjyBKlsgfgkFQ?=
 =?us-ascii?Q?amtLEZwRC2O97Xwsql1bK/r8QpPBNMSuuuX1U16BA9oE+XSXzISjsrl5/I45?=
 =?us-ascii?Q?l4p7LrN9nRN5JxTyKNGRiaWvkYbGUX7oWyYoVcmnIUqbgZ02lrfc/+Xzlj6u?=
 =?us-ascii?Q?6Bic3Utz46MagWBGbtQ3A7wJ8Q7iQI1T+oej7qz8WW0gzNUh4mLHIeFXsV0l?=
 =?us-ascii?Q?ePOm4dy+qHUodsVbSU0LT6pyLmr4aqHiZYK6Vo1HLLjGgCLYGSPRMAWzmRgS?=
 =?us-ascii?Q?3RTl8vUOh+HHVLiikE0tXKr6ErRxqnD7BGyI9zYR7Oz1CRHTuFjvdyKcXo5l?=
 =?us-ascii?Q?e+XK6/2dFHtX94OZn0xLnwReBg3uuVrwrfji19pU7EyVVr1nj3scQT/pRpsS?=
 =?us-ascii?Q?HKVG/Tl6u1QlGXQzXn4nPklHdUWi7vM+VHYuqskFwrkN0hfHwGw6+RZfQdP7?=
 =?us-ascii?Q?k1q5vSZqOfh9e1P6q6xp3XDSiT7Opus33JBjhPiD9gyqtDqvfME1KrIeJmT+?=
 =?us-ascii?Q?oOlZNZreDxCNF6YbehrzNoTAPG58TiLHAtZRe+XG1gmhaZynOWGyLmxl8qRV?=
 =?us-ascii?Q?IU7cDylLstdTuQ3MdzJf7xpAPp5uly7c4Yd1fT/k2HWYEscD/EQsxCU0j+K9?=
 =?us-ascii?Q?R4gVGm/eHsXF+tymd5avZJM9/mk6nDab8VOYX9ub2i1bnYElOkDuN/V2UiAS?=
 =?us-ascii?Q?KFrFYblk9PbhpyKI6ns82z0c19T6010HjK3qAMcmMsiSktpPgfhUEmqRxz9h?=
 =?us-ascii?Q?6E+C9Y5B7upvqyow0uNryq7ebT2/9uxAicDpi1/nA2TuJRLfquRYMNgHBtCo?=
 =?us-ascii?Q?de6ISxTUQZJL1Vh67gxYdxLTN0ZIOcfOEDtZv7Olh/f579CX82JNLe6Zcc5K?=
 =?us-ascii?Q?cJfnPLO8LLTaOgcJQD+Lzt5wGd30Ik/aMn575Y3P9uPGs7nlJa4GxkgVmScl?=
 =?us-ascii?Q?v1SQ+OnZscO9OfZ0cMRWTgNPjGL/EvMIYQFoP2rzd3ih7Mj8RH8VnA11CuTW?=
 =?us-ascii?Q?hLJkXeR+sOgtv+mSt8k0lZhAxIXQAHfijQX9m0aecd5v+pV89ZSRCDbTkGfy?=
 =?us-ascii?Q?2m9mc1NHD8yqzK01Z9qPzEIJ3p2mrxz6likIjE7VzN56B469osty9ehSxVBT?=
 =?us-ascii?Q?fE4/5E9OxfSTevXSJ4jagkx2VaMqaLh9XXZAkzAFGj7bJbqASng4ja1YfBtG?=
 =?us-ascii?Q?h9r29cz2S+7+SD7C52al/o9GqNcRw+rTY36gVgFEMj9g+8/fwp87FdPkvUY?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e99210-b660-42eb-a0a5-08dd416b697f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 20:19:34.3527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8282
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

From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30, 2025 1=
0:50 AM
>=20
> Sorry for the typo in the subject title. It should have been 'hyperv_fb s=
oft lockup on
> Azure Gen2 VM when taking kdump or executing kexec'
>=20
> Thomas
>=20
> >
> > Hi Michael,
> >
> > We see an issue with the mainline kernel on the Azure Gen 2 VM when
> > trying to induce a kernel panic with sysrq commands. The VM would hang
> > with soft lockup. A similar issue happens when executing kexec on the V=
M.
> > This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs with bi=
os
> > boot are fine.
> >
> > git bisect identifies the issue is cased by the commit 20ee2ae8c5899
> > ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()" ).
> > However, reverting the commit would cause the frame buffer not to work
> > on the Gen2 VM.
> >
> > Do you have any hints on what caused this issue?
> >
> > To reproduce the issue with kdump:
> > - Install mainline kernel on an Azure Gen 2 VM and trigger a kdump
> > - echo 1 > /proc/sys/kernel/sysrq
> > - echo c > /proc/sysrq-trigger
> >
> > To reproduce the issue with executing kexec:
> > - Install mainline kernel on Azure Gen 2 VM and use kexec
> > - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img --command-
> > line=3D"$( cat /proc/cmdline )"
> > - sudo kexec -e
> >
> > Thank you,
> > Thomas

I will take a look, but it might be early next week before I can do so.

It looks like your soft lockup log below is from the kdump kernel (or the n=
ewly
kexec'ed kernel). Can you confirm? Also, this looks like a subset of the fu=
ll log.
Do you have the full serial console log that you could email to me?  Seeing
everything might be helpful. Of course, I'll try to repro the problem mysel=
f as
well.

Thanks,

Michael

> >
> > --- soft lockup log---
> > [    1.690032] efifb: probing for efifb
> > [    1.693989] efifb: framebuffer at 0x40000000, using 3072k, total 307=
2k
> > [    1.700996] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
> > [    1.706999] efifb: scrolling: redraw
> > [    1.710981] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> > [    1.716806] Console: switching to colour frame buffer device 128x48
> > [   29.176649] watchdog: BUG: soft lockup - CPU#0 stuck for 26s!
> > [swapper/0:1]
> > [   29.176655] Modules linked in:
> > [   29.176658] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0+=
 #1
> > [   29.176661] Hardware name: Microsoft Corporation Virtual
> > Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 03/08/2024
> > [   29.176663] RIP: 0010:fast_imageblit.isra.0+0x2de/0x460
> > [   29.176669] Code: 07 49 21 f1 41 83 e1 01 46 8b 4c 8c 40 44 89 09 41=
 89 d1
> > 4c 8d 79 08 41 c0 e9 06 49 21 f1 41 83 e1 03 46 8b 4c 8c 40 45 89 0e <4=
1> 89
> > d1 4c 8d 71 0c 41 c0 e9 05 49 21 f1 41 83 e1 07 46 8b 4c 8c
> > [   29.176671] RSP: 0018:ffffc900000437a8 EFLAGS: 00010246
> > [   29.176673] RAX: 0000000000000400 RBX: 0000000000000005 RCX:
> > ffffc900006bb140
> > [   29.176674] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
> > ffff888012146600
> > [   29.176675] RBP: 0000000000000080 R08: ffffc900006bb000 R09:
> > 0000000000000000
> > [   29.176676] R10: 0000000000000001 R11: ffff888012146580 R12:
> > 0000000000001000
> > [   29.176677] R13: ffff88801214658a R14: ffffc900006bb144 R15:
> > ffffc900006bb148
> > [   29.176678] FS:  0000000000000000(0000) GS:ffff888026a00000(0000)
> > knlGS:0000000000000000
> > [   29.176680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   29.176681] CR2: 00007f8bc160c238 CR3: 000000002ac38002 CR4:
> > 00000000003706b0
> > [   29.176683] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> > 0000000000000000
> > [   29.176684] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> > 0000000000000400
> > [   29.176685] Call Trace:
> > [   29.176687]  <IRQ>
> > [   29.176690]  ? watchdog_timer_fn+0x220/0x2a0
> > [   29.176695]  ? __pfx_watchdog_timer_fn+0x10/0x10
> > [   29.176697]  ? __hrtimer_run_queues+0x112/0x2b0
> > [   29.176702]  ? hrtimer_interrupt+0x108/0x270
> > [   29.176704]  ? sched_clock_cpu+0x60/0x1a0
> > [   29.176708]  ? __sysvec_hyperv_stimer0+0x32/0x60
> > [   29.176712]  ? sysvec_hyperv_stimer0+0x70/0x90
> > [   29.176715]  </IRQ>
> > [   29.176716]  <TASK>
> > [   29.176716]  ? asm_sysvec_hyperv_stimer0+0x1a/0x20
> > [   29.176722]  ? fast_imageblit.isra.0+0x2de/0x460
> > [   29.176724]  cfb_imageblit+0x433/0x470
> > [   29.176726]  bit_putcs+0x291/0x570
> > [   29.176731]  ? __pfx_bit_putcs+0x10/0x10
> > [   29.176733]  fbcon_putcs+0x139/0x1a0
> > [   29.176735]  do_update_region+0xf1/0x110
> > [   29.176740]  redraw_screen+0x22f/0x290
> > [   29.176743]  do_bind_con_driver.isra.0+0x2ab/0x3d0
> > [   29.176745]  do_take_over_console+0x3a/0x50
> > [   29.176747]  do_fbcon_takeover+0x5c/0xe0
> > [   29.176749]  fbcon_fb_registered+0x4f/0x70
> > [   29.176751]  do_register_framebuffer+0x1bc/0x2a0
> > [   29.176755]  devm_register_framebuffer+0x28/0x90
> > [   29.176757]  efifb_probe+0x544/0x720
> > [   29.176760]  platform_probe+0x43/0xb0
> > [   29.176763]  really_probe+0xd9/0x390
> > [   29.176767]  ? __pfx___device_attach_driver+0x10/0x10
> > [   29.176769]  __driver_probe_device+0x78/0x160
> > [   29.176771]  driver_probe_device+0x1e/0xa0
> > [   29.176773]  __device_attach_driver+0x99/0x130
> > [   29.176775]  bus_for_each_drv+0x98/0xf0
> > [   29.176777]  __device_attach+0xbc/0x1f0
> > [   29.176779]  bus_probe_device+0x8d/0xb0
> > [   29.176781]  device_add+0x4f1/0x6e0
> > [   29.176785]  platform_device_add+0xfa/0x260
> > [   29.176787]  sysfb_init+0x109/0x120
> > [   29.176791]  ? __pfx_sysfb_init+0x10/0x10
> > [   29.176793]  do_one_initcall+0x5b/0x330
> > [   29.176796]  do_initcalls+0xac/0x130
> > [   29.176800]  kernel_init_freeable+0x134/0x1e0
> > [   29.176802]  ? __pfx_kernel_init+0x10/0x10
> > [   29.176806]  kernel_init+0x1a/0x1d0
> > [   29.176808]  ret_from_fork+0x34/0x50
> > [   29.176813]  ? __pfx_kernel_init+0x10/0x10
> > [   29.176815]  ret_from_fork_asm+0x1a/0x30
> > [   29.176819]  </TASK>
> > [  432.306986] fb0: EFI VGA frame buffer device

