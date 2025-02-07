Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF118A2CB43
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0511310EBA4;
	Fri,  7 Feb 2025 18:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="CR3e/26E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2103.outbound.protection.outlook.com [40.92.20.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D38A10EBA4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlMdF9IqbXmuSvGO/NfqVu/2lLoJH+w1eAGpU/wVzFpvtIBuG34fgB3GPLY7Q1sOTWCunFGSRHUoc3vVQGGZQzWkZGq5qYKNB3XQSywu2lyPZTu+8DYl03D944iGmSlQfEOLqf2r/7PxRhxuHuBMqYXoJmC5qK2DubAXVQu8QoJzumC1d6ODdyINQJUWDPU098gtYMqorop0flRwZp9+q4F5IQF+pkzlFS3RQJyZz/Klq0N8OBnbrh9haGkKihrRtiStVKY8EvHcVrE7rufhb/UPGG0G2Wqnwq20x/zcLq7ev/1rlXUHhUqMZfeGWSfyGSTXIHBx7rK6w+O0Qu5C+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZplYoDIXKcxDX5zu687GjACEF8cpKCSxVS9aJnq9NGs=;
 b=R+k3AekKesQGvnnRhI9Mkzr3a08bTFlYSQ2hUJ9q1sl4A3o66vSr8VtL8Cxy2A7Put7mW0A1PFtNskSuJGVpxYmMmpB4TGz3l2tMApULiUBdXZ4N1/KHPWCkvIuffZt7TcqIpWEbyZExJy5A8DUnRApuv7pGDhkcBTIx/CJOXaJCjY2WL/SWUWVeMrVnU1fctopAirEgd8RH4yR6LQkAzE4Pdjg+u17EKUWhiO/L6edBrqGcsj/vnf3CrMIIOmUv7Ww4zfh/cazyRN3mm8Y+ywCEvNoq0Z1BPGZN04zS/rLym0wA/+pOLXrgTmYkTrferBzENZd1Y5yJ89PYv0lE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZplYoDIXKcxDX5zu687GjACEF8cpKCSxVS9aJnq9NGs=;
 b=CR3e/26ECwaRnHwVtURV//Bxr4kR9wXkA9VGxn9w0mtjbQQw0aOkq/de+VBLYxZtaYC0/6TRpJ8I6bntAjeKVpty+x22EOPfoujsus/M59tZedEpx1DY3AT2hiaXoaOUy8oKcfWhenfk/tpwlGaUakPrfd8iXSjKi10WsAZuJYB0tKSsYi7lvPkt7maBuYZarDc2o4vinK4Zex9NYR9APwhFdY8/58kRgdnrrYfhQTyP0TV1y+/NW07P9tb9J5Q8NLg133W1wpBxc+dEW13L2Zp2c4b5U0CPidZdZID1AvmmBfZIhHRFUHmnzi1C6wF7LVxytrL2odoTnPuqOwt8lw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ0PR02MB7389.namprd02.prod.outlook.com (2603:10b6:a03:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 7 Feb
 2025 18:29:02 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 18:29:02 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Michael Kelley <mhklinux@outlook.com>, Thomas Tai <thomas.tai@oracle.com>, 
 "mhkelley58@gmail.com" <mhkelley58@gmail.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "javierm@redhat.com" <javierm@redhat.com>, Helge
 Deller <deller@gmx.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Topic: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwAAALyBRAAANwVQADJ+eeAAJV+q6AADyinUA==
Date: Fri, 7 Feb 2025 18:28:59 +0000
Message-ID: <SN6PR02MB41572155B6D139C499814EB7D4F12@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ0PR02MB7389:EE_
x-ms-office365-filtering-correlation-id: a5db5035-1579-40e1-5d42-08dd47a54a36
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|8060799006|15080799006|461199028|3412199025|440099028|41001999003|102099032|1710799026;
x-microsoft-antispam-message-info: =?us-ascii?Q?tCLCxkxAo7VIGWq+XABIxGDWfYTWg9gGRU92/vUN45hqiGw056XjFXIOd+m7?=
 =?us-ascii?Q?VXYLTUYO2zhYbMOCgp43MeeKS1rgaRxZvkh6yxsiWUkn/+rd9VpS3Q4fWTC0?=
 =?us-ascii?Q?XjsFIHgeBsybdJ6CGqnGwIz2MK+bmspJcFV9r8YDzjTgXDx6KFaDwKQC+1OZ?=
 =?us-ascii?Q?woP1V9+AK/89Qt+pIob7T4QrTKsQIzEjStTrYWc2mcgXEqOS2CJwrvcnr1aC?=
 =?us-ascii?Q?5rfXHbMN+XIFfJaF3rmnXKU5lpgy2MzFu4VGReilPuo0ubBzPZ8f/0w49JiI?=
 =?us-ascii?Q?aiiD1FO0AK9rrP76RAQ9PpotclhV9/HQyTs3+BUd/PwDfNxYyLuWeZ3e8a3z?=
 =?us-ascii?Q?7y/N92nIqIFkS7oII767OMCztPJFhEEJ/kYm/kGARbx0YKRwzh5ImwkrET1l?=
 =?us-ascii?Q?lE6x1o6vWQXYdEaQoiHG2Rrpc6wVVp42e3kS/8MEX6tNOjpgrCB8iN+T80Ok?=
 =?us-ascii?Q?MPGCsrMyCIm3s3F5JqwS01H81b8cGC/1+UGAgSugUA8C8bjBUXxEnoDoUbAK?=
 =?us-ascii?Q?RqGAmmyO9+eaAgqHnfU/Qvg37Cy51hENhw6t+T8jBHprwMlWct8hR0SvWsKj?=
 =?us-ascii?Q?Jtk97SXx7TBAcDN/2SdzEZKD+Bkc6hLGFEPvAAFwOLg36sdk0+f4cuHz1aUI?=
 =?us-ascii?Q?I3lAYzSoMN1bKy5MLaGnzQTqXZCbOGmIKDkpfpGq7G47vxS/qOlRyA0lBNK3?=
 =?us-ascii?Q?UfoMONqSyMtkPWDcnaSC2EHu9lgTfeDv7W+m3zul4tIDamFZ1YsG7YW2mkDj?=
 =?us-ascii?Q?nsZKoCJiwfrUYBIHDvhAL2PRbdgVqbk8IDA2FFTaGS/aGvRrtx5w/tYx4ySw?=
 =?us-ascii?Q?S/uqncf4zSTlm//X+LYZo3rXNaA7DDvI12Tw4413TFqU6qIalYU4BzZwgqbF?=
 =?us-ascii?Q?sklADZkpKouBN7P245ok/YII3Y3FeyVcMhMbS6KLrBoOmv2Lr8w0zZDOO1Ae?=
 =?us-ascii?Q?EntV54VIUd4w9y1FFJ6YMRPuyNmJh9WztxZaklZwXvY1w3zwt0nnGVW66JDV?=
 =?us-ascii?Q?q9MCbtt4a4k/Fp3xvD1ptkMKMd5L8AtUZznt2BS8xQrv8wUrDVP4uD2cSHse?=
 =?us-ascii?Q?1L96BjoE5EbOGtfzkJ3pDKhU1Ng8We9KEiiPe7fiEFrAzu4uUAg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fVfOUi7Y0gNAcKv1vJOT4eZTRxahGDg0UsvVhNHFnFAh1+Hg+V4JdrTi/EM8?=
 =?us-ascii?Q?PnsVazCaZ0TaIcdpAfyTmEvyRpI1jyemXwjrzfFv+LYC7+c66WFlWj0q5KiZ?=
 =?us-ascii?Q?MZREK87pAWqK8UYfiSI1m3Jm213GvKIsgAwJVTH66Ay7lsdYFbJAlXMpT2PF?=
 =?us-ascii?Q?Ylll7vGIVwAqJ8NFNkjMWOtCyNNISPTDWfuYU38HiHKUW8Fs/bJ6Fj//khFv?=
 =?us-ascii?Q?yKj3W79m06isbcBSI0fawzytVwreRHEWG9V41teOlucGWw7OjHQz042fSn/0?=
 =?us-ascii?Q?ykaMklEGxXk4FUuk4R+JArKbL5WtQRNlcqsPX32mBPjjDoWNcqvhUERKO0oi?=
 =?us-ascii?Q?CHIx4tj+RvW8smPpQGFczL4V2+nNIgs1Ojixm54CQhcgxck93KyBAnNFOA0V?=
 =?us-ascii?Q?sKyCi/xx5FuZp+0FVQbOI7DnWr1eLSbxHUMAWl2h6Ej4ssA21ziqAkcHLT1E?=
 =?us-ascii?Q?IcMgxQ27iLvfQJDJ8MetkB7z9LX5fBWTuhmfjfmCefJ9ZT4JNsoNiC9ofaxV?=
 =?us-ascii?Q?bDx2eCQEaztbEvd1IcsTJQNc1jGevH7e0qpaQoCWjt8Ka6jLhd8mkYQh54/y?=
 =?us-ascii?Q?d8IHtlm8ERRWFPj4RKOe8zxQ3FRL+6d5WgycSNQk0Gp6odPPyisSCAGc1OR+?=
 =?us-ascii?Q?3ugA+URW2NS+ZpTirkXkVQ1cFevMrm7KUDZpNwu0ty9qsblP6+DjHOSky1V3?=
 =?us-ascii?Q?cZatnOtQuy9kJpkuZcJmhPkXkmo5fd3ArfPf6cR8ha5u5HIJAFvkwep6pehh?=
 =?us-ascii?Q?MVEa1H/CEjYVYh0hceEc2Eo1U032NsddxI9GOEZQObWG3kzoG4N50XRbOZyB?=
 =?us-ascii?Q?Bm3TIoifMzO0DQMkyv+7hxIht9/LBU/62dUJv3emzp7kzwtU1YzC1lms9//+?=
 =?us-ascii?Q?QiU6Nd0gPGyNOjnae9fDAmhjezvYsDl9W4kYzKs9epqq5K99jw7oRtDXA6sY?=
 =?us-ascii?Q?90FsIL7MyEw+ua/RtgJxaDR0ClzaBFOqNOJvCju3jW/FGqCBceq/+9A6c5he?=
 =?us-ascii?Q?iIWr6iMSs1UwgLw/PhnIY/29O6y1j183QxsjooPscGGBiBkdrD5LG7t1io66?=
 =?us-ascii?Q?I2ykA1Vivt+TL/yjY3s1HMb6piP40hMISdrmRt4hdaZ90ygh2i70ixNC0fWn?=
 =?us-ascii?Q?2M2cM6NO/4DIVmyUQHaEXu6W3or7gvL9mcfuFD8MXXqxXGTCmmCqD3bwN60K?=
 =?us-ascii?Q?06y3QSIJHyfQBk3e9zEJIdf4g1V0HVwtx9npZBZ7LNi7S/x/RiZheGnYjT0?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a5db5035-1579-40e1-5d42-08dd47a54a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 18:28:59.6390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7389
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

From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday, February 6, 202=
5 1:00 PM
>=20
> From: Michael Kelley <mhklinux@outlook.com>
> >
> > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30, 20=
25 12:44 PM
> > >
> > > > -----Original Message-----
> > > > From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday, January=
 30, 2025 3:20 PM
> > > >
> > > > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30=
,
> > > > 2025 10:50 AM
> > > > >
> > > > > Sorry for the typo in the subject title. It should have been 'hyp=
erv_fb soft lockup on
> > > > > Azure Gen2 VM when taking kdump or executing kexec'
> > > > >
> > > > > Thomas
> > > > >
> > > > > >
> > > > > > Hi Michael,
> > > > > >
> > > > > > We see an issue with the mainline kernel on the Azure Gen 2 VM =
when
> > > > > > trying to induce a kernel panic with sysrq commands. The VM wou=
ld hang
> > > > > > with soft lockup. A similar issue happens when executing kexec =
on the VM.
> > > > > > This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs=
 with bios
> > > > > > boot are fine.
> > > > > >
> > > > > > git bisect identifies the issue is cased by the commit 20ee2ae8=
c5899
> > > > > > ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem(=
)" ).
> > > > > > However, reverting the commit would cause the frame buffer not =
to work
> > > > > > on the Gen2 VM.
> > > > > >
> > > > > > Do you have any hints on what caused this issue?
> > > > > >
> > > > > > To reproduce the issue with kdump:
> > > > > > - Install mainline kernel on an Azure Gen 2 VM and trigger a kd=
ump
> > > > > > - echo 1 > /proc/sys/kernel/sysrq
> > > > > > - echo c > /proc/sysrq-trigger
> > > > > >
> > > > > > To reproduce the issue with executing kexec:
> > > > > > - Install mainline kernel on Azure Gen 2 VM and use kexec
> > > > > > - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img --=
command-
> > > > > > line=3D"$( cat /proc/cmdline )"
> > > > > > - sudo kexec -e
> > > > > >
> > > > > > Thank you,
> > > > > > Thomas
> > > >
> > > > I will take a look, but it might be early next week before I can do=
 so.
> > > >
> > >
> > > Thank you, Michael for your help!
> > >
> > > > It looks like your soft lockup log below is from the kdump kernel (=
or the newly
> > > > kexec'ed kernel). Can you confirm? Also, this looks like a subset o=
f the full log.
> > >
> > > Yes, the soft lockup log below is from the kdump kernel.
> > >
> > > > Do you have the full serial console log that you could email to me?=
  Seeing
> > > > everything might be helpful. Of course, I'll try to repro the probl=
em myself
> > > > as well.
> > >
> > > I have attached the complete bootup and kdump kernel log.
> > >
> > > File: bootup_and_kdump.log
> > > Line 1 ... 984 (bootup log)
> > > Line 990       (kdump kernel booting up)
> > > Line 1351      (soft lockup)
> > >
> > > Thank you,
> > > Thomas
> > >
> >
> > I have reproduced the problem in an Azure VM running Oracle Linux
> > 9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
> > in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
> > the 6.13.0 kernel. There are several differences in the two
> > environments:  the version of Hyper-V, the VM configuration, the Linux
> > distro, and the .config file used to build the 6.13.0 kernel. I'll try =
to
> > figure out what make the difference, and then the root cause.
> >
>=20
> This has been a real bear to investigate. :-(  The key observation
> is that with older kernel versions, the efifb driver does *not* try
> to load when running in the kdump kernel, and everything works.
> In newer kernels, the efifb driver *does* try to load, and it appears
> to hang.  (Actually, it is causing the VM to run very slowly. More on
> that in a minute.)
>=20
> I've bisected the kernel again, compensating for the fact that commit
> 20ee2ae8c5899 is needed to make the Hyper-V frame buffer work. With
> that compensation, the actual problematic commit is 2bebc3cd4870
> (Revert "firmware/sysfb: Clear screen_info state after consuming it").
> Doing the revert causes screen_info.orig_video_isVGA to retain its value
> of 0x70 (VIDEO_TYPE_EFI), which the kdump kernel picks up, causing it
> to load the efifb driver.
>=20
> Then the question is why the efifb driver doesn't work in the kdump
> kernel. Actually, it *does* work in many cases. I built the 6.13.0 kernel
> on the Oracle Linux 9.4 system, and transferred the kernel image binary
> and module binaries to an Ubuntu 20.04 VM in Azure. In that VM, the
> efifb driver is loaded as part of the kdump kernel, and it doesn't cause
> any problems. But there's an interesting difference. In the Oracle Linux
> 9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on
> the Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This
> difference is due to differences in how the screen_info variable gets
> setup in the two VMs.
>=20
> When the normal kernel starts in a freshly booted VM, Hyper-V provides
> the EFI framebuffer at 0x40000000, and it works. But after the Hyper-V
> FB driver or Hyper-V DRM driver has initialized, Linux has picked a
> different MMIO address range and told Hyper-V to use the new
> address range (which often starts at 0x40900000). A kexec does *not*
> reset Hyper-V's transition to the new range, so when the efifb driver
> tries to use the framebuffer at 0x40000000, the accesses trap to
> Hyper-V and probably fail or timeout (I'm not sure of the details). After
> the guest does some number of these bad references, Hyper-V considers
> itself to be under attack from an ill-behaving guest, and throttles the
> guest so that it doesn't run for a few seconds. The throttling repeats,
> and results in extremely slow running in the kdump kernel.
>=20
> Somehow in the Ubuntu 20.04 VM, the location of the frame buffer
> as stored in screen_info.lfb_base gets updated to be 0x40900000. I
> haven't fully debugged how that happens. But with that update, the
> efifb driver is using the updated framebuffer address and it works. On
> the Oracle Linux 9.4 system, that update doesn't appear to happen,
> and the problem occurs.
>=20
> This in an interim update on the problem. I'm still investigating how
> screen_info.lfb_base is set in the kdump kernel, and why it is different
> in the Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is
> well understood, we can contemplate how to fix the problem. Undoing
> the revert that is commit 2bebc3cd4870 doesn't seem like the solution
> since the original code there was reported to cause many other issues.
> The solution focus will likely be on how to ensure the kdump kernel gets
> the correct framebuffer address so the efifb driver works, since the
> framebuffer address changing is a quirk of Hyper-V behavior.
>=20
> If anyone else has insight into what's going on here, please chime in.
> What I've learned so far is still somewhat tentative.
>=20

Here's what is happening. On Ubuntu 20.04, the kdump image is
loaded into crash memory using the kexec command. Ubuntu 20.04
has kexec from the kexec-tools package version 2.0.18-1ubuntu1.1,
and per the kexec man page, it defaults to using the older kexec_load()
system call. When using kexec_load(), the contents to be loaded into
crash memory is constructed in user space by the kexec command.
The kexec command gets the "screen_info" settings, including the
physical address of the frame buffer, via the FBIOGET_FSCREENINFO
ioctl against /dev/fb0. The Hyper-V FB or DRM driver registers itself
with the fbdev subsystem so that it is /dev/fb0, and the ioctl returns
the updated framebuffer address. So the efifb driver loads and runs
correctly.

On Oracle Linux 9.4, the kdump image is also loaded with the
kexec command, but from kexec-tools package version=20
kexec-tools-2.0.28-1.0.10.el9_5.x86_64, which is slightly later than
the version on Ubuntu 20.04. This newer kexec defaults to using the
newer kexec_file_load() system call. This system call gets the
framebuffer address from the screen_info variable in the kernel, which
has not been updated to reflect the new framebuffer address. Hence
in the kdump kernel, the efifb driver uses the old framebuffer address,
and hence the problem.

To further complicate matters, the kexec on Oracle Linux 9.4 seems to
have a bug when the -c option forces the use of kexec_load() instead
of kexec_file_load(). As an experiment, I modified the kdumpctl shell
script to add the "-c" option to kexec, but in that case the value "0x0"
is passed as the framebuffer address, which is wrong. Furthermore,
the " screen_info.orig_video_isVGA" value (which I mentioned earlier
in connection with commit 2bebc3cd4870) is also set to 0, so the
kdump kernel no longer thinks it has an EFI framebuffer. Hence the
efifb driver isn't loaded, and the kdump works, though for the wrong
reasons. If kexec 2.0.18 from Ubuntu is copied onto the Oracle Linux 9.4
VM, then kdump works as expected, with the efifb driver being loaded
and using the correct framebuffer address. So something is going wrong
with kexec 2.0.28 in how it sets up the screen_info when the -c option
is used. I'll leave the debugging of the kexec bug to someone else.

I'm still thinking about alternatives to fix this mess. Please chime
in if you have suggestions.

Michael
