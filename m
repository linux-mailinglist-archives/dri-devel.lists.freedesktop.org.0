Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35019A2B3AC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74B10E00E;
	Thu,  6 Feb 2025 21:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Q/BCPyf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2102.outbound.protection.outlook.com [40.92.19.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D0B10E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXGpTNyg7KDKI/uFm+7XpoEfiJh+Ry98+b7YVwniExbzzG9rCPCI91V8jWu7my9jWD7jwYWEiHMCmGNRM3t5Z82CwbCp91zMHlxw+F7XUseqkfecffywJB8I3/GVN+lVEsZhu+0QeqSlP9wu/aNOP/fv+fV0jtBTtTII1tD+QXRDJwgmAn4F8k521gGgW+qD1AlT5fFg96RF2TS4q9JXSjDExpXLSehwKWGBn3DZ2vmS7OP+Z/QcIA5asPNH+XNa4uPuUFl7nOHKRz0ekmI7VdG69YoxGKClrnYeNkCfmJsBvVKHBgFZtdwFCJytSz8hhO5F3Kc1FcrH3uIFRxbvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvNr6ZL7lC+5eClYHTwRgsCiqJ/MVWs2mavz0VJkX4k=;
 b=KLBmPE/jwlSI2faQdKc0LXK5kGX2akkuYt7Q4jUvnf4hUTHMvIH0u99BhQ8KQtaYCFTYiYUPSMoc5G6eAGhoX5/WNWhKj9CmpM8EnJ0Ufofek6u6sM4UsrEIDHI6W1ym2ELMNzxrJF9c8840vixy3hE2ticPh32n2ZCw2M0rJUY1qwC9OG5/BTFAQfIraM9OahPMRQOPiPLcFTbtnJRa5Pxy5isxPIheKDL4mZbzWUTgq2htAWtWYM6cGuCRsxYIWBtHVVJdTl1/oMBFxv4Gvpkt+Rx7XYaOWx+sYvU7ZovMBRsL7wZ+wVEdVq6fxJ4Ai4GOj8BvE6g2PVmA2NRNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvNr6ZL7lC+5eClYHTwRgsCiqJ/MVWs2mavz0VJkX4k=;
 b=Q/BCPyf7EPr5QotSq4FG1SuWYy+seEs992u0BVl8Q2AnCp6t1Scjd0IuHg66Ypcd3WLqCleu0Bz9vGGiHKapLaGbXeq9T0FElZQuKWCRY20+oVaTTFO8FvjS1PKUSGom3A+KeeEe+NHbCY5bX7xSJV6zW/lEoAUrqbWTTxQf6KcEBZRQ5Calsv50PlvQshsV2dy+/9lNDYiUZKWLnMyyq1jzL/Dx4fjs/P9sQvXzGobKtb9JUpV8QiOlwnEy6ndDVN8peMFUbNeby6KgZjhtNDC7uGLwGxcdwTGKTqP1Jubk9W3xL1g/Ei5TP5mAOoJT3B0lR7kQlt0zUID/69btiQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ0PR02MB7422.namprd02.prod.outlook.com (2603:10b6:a03:291::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 21:00:16 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 21:00:15 +0000
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
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwAAALyBRAAANwVQADJ+eeAAJV+q6A=
Date: Thu, 6 Feb 2025 21:00:15 +0000
Message-ID: <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ0PR02MB7422:EE_
x-ms-office365-filtering-correlation-id: b734611c-2c19-44cb-0902-08dd46f14196
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799006|8060799006|461199028|8062599003|440099028|3412199025|41001999003|102099032|1710799026;
x-microsoft-antispam-message-info: =?us-ascii?Q?4+ixPJqMlMgirMWjD1UkpZ8dy9zeOVy8idbRF0NqmH+icGd42dUuGEXu/YKG?=
 =?us-ascii?Q?/4WZ7+dksnnIWhRWYeQaSKY5E8Mi3sv81l6vx6d//Osu+6/rVbWe5ktgKioX?=
 =?us-ascii?Q?gYbVDfG1dqN/7so3MKETBg7mPBZZX5LRqtoBBVBES5rBJ8Ar21h73fqNIrbx?=
 =?us-ascii?Q?o2uBKTdgL+vta4H07U8qHnrYIHNS9T5v6gS/xDxyoug1zIY8q/CuT/tzOrbG?=
 =?us-ascii?Q?v5Y9ZGdRvPm19JHzip/kqoFjCpPh/qPXduzjTHd90OpWnAZtHT4Zgmmw6De+?=
 =?us-ascii?Q?zE/BzqmoLuI4BTy4k/2LWxr6G6bey/B4iI3E15Rq7AX2WORF6d7QyJq+T5ZI?=
 =?us-ascii?Q?01108pS0V7s/RggQwU6HS+Sp1g6rjmnGCDsecsPkM37jzeTR2b/Lh/fZakCf?=
 =?us-ascii?Q?nP3NVCdvvtCiFo+dVN6LO4o0EvpNAVFjm+QTJgJrhNTk8GioQGR7sXk8G29q?=
 =?us-ascii?Q?kp3hcYLcxH3TAdUW3y9xA+uPEVivbToFUtKWu2lWd67if5eSN3pDlH7Rwjsj?=
 =?us-ascii?Q?j2kFR2CkKTtYX4fT2MaYVB0OP/84F25+7cAVNNPvIbB8RfQuwoCwMuPnrjaE?=
 =?us-ascii?Q?56xj0ZgsAsl0kGbGPYeQgn9nSfAFpudnyBRzf/rZnlQHCU3lyJq5mSioOEZi?=
 =?us-ascii?Q?H6CUE0Eppstb9k8cvjZ2WcElnSOai2zucCM9G93f1hRh64yzr08AUTHA3PS8?=
 =?us-ascii?Q?VwV+HJ9lmAFz3BkIsa7LLVasw9vbd2vMhPdF/5YXKtICoPycDE4M+ZwdsSby?=
 =?us-ascii?Q?8GQ8U+i5DQ1DBOzeaECuSn0NwlC4shWBuI39Phe8MHgcaJkm+I0OlDNqtBax?=
 =?us-ascii?Q?NXXbYSJFtHJw+vxIZFGCxsoo6yuGRO1y5b+NSHRkTXPzoJpCIMQsTd8U8ecB?=
 =?us-ascii?Q?FOuwgIVzTenmCXF92Ec/KttQ/jWLsK/KMRljDzubgcuMzRAxTvvF7F8j+ApS?=
 =?us-ascii?Q?K9sJVeKuOSUViBQwN4N10ArYAkQ19nDE7Crqru8Tif0OjoxLLL06/hawbkf4?=
 =?us-ascii?Q?PfWUu+GlDdFozDdLv+YP/6cn3qV7oHWX0SA7+vCqDMgo6Pb6w9CT1ej89ZFS?=
 =?us-ascii?Q?ojIHR+gYpT9VAXpeBCVTNbTRrTgPVi44Ce0cqS2zQpRCRasjIr8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wv/RRKNEz3vDJNKw4mvf5OqO58QtOzBK5bh9ifwvddyMYVutatXtG9PmTZWy?=
 =?us-ascii?Q?ZzrUUlOnvBW05qot8w/qlk0ZiYkY7d7dCxtvFv/DiYbJgWmWdckPRbZRzdaQ?=
 =?us-ascii?Q?e9lZpGLXmAmRd2C8LAqdzb8R7jM4wOx59hivyywryZfI6y7kMrTt4567x3gC?=
 =?us-ascii?Q?DaySOFM4Y9gbMwaAGUB/BpmJ/0o+BcoJcnHuZlzkJOirX3PH3JxCgM5HytGN?=
 =?us-ascii?Q?moqlgdHv/8lq3CVh6Lfe4Kf+5nYYyzPs+vGsM8NDQeYV3tOU73Zd2ortFpi4?=
 =?us-ascii?Q?HGRQJiUk6fmvAIBQGcDjEzdini+h60duPzwYHO9f/CFw1bDzDcKEmXcV/WZj?=
 =?us-ascii?Q?ZMe2/I00+X7S2a3g3/n5ORrY45HzXVX/GOxxynpsVfo69xG0BdKPq5Knu9QH?=
 =?us-ascii?Q?az0lANX7B3irb8Kb07jSQ1NPaUsl0fFSBec716xXUf8OUb0SxV2jXO3PP8jM?=
 =?us-ascii?Q?yoRjqN0Ic0NYvVyJZTmK/uIcTOA5eWfyFt5AFkFQvut2rF/7UgA6cWbRJEfC?=
 =?us-ascii?Q?rK87+OWRZJXnzE1aZEA1JyhzM1Z/f/v7lrzpVdCMZFJ5UlLZkfGoR7j0Enrc?=
 =?us-ascii?Q?Ydt7drFxvLFBIEjSB/+Blz45y+5Jz2i9dkvBtOCFU7tYeLTN2JgINJZNM6Mj?=
 =?us-ascii?Q?pLAChDPiYES9EC2z3wceJ/AHghing7yx5a01HlQAwIcY3jwLjKWM1xLSZzaR?=
 =?us-ascii?Q?eLs52hD1KVf7Op9Lwh3PCUueboncTWHhi5nTqQquuxaDxpnMrZL8tVvwAZ2p?=
 =?us-ascii?Q?2x9GNUnJdfivK5FR8yddKqMEcu6CpSUzOy2mZ8LBVwMdP1isAXEsVXPLs/qF?=
 =?us-ascii?Q?gHirKIe+Br5ZcWZ/iljifOcprZihGxed7Lwl4o9SSwoY9aDbrjvf3vxs7aDT?=
 =?us-ascii?Q?pEQTReoMeld64Wiu0s2V3CDl4STNp8wiYvgIuPB6yEJcmnmJ/jBxBUBQqXvu?=
 =?us-ascii?Q?IszGdtnVZVC5RtpeylSuUrsVNvyZBYhXEeiKEXVPOKBdFjyqOZBW+YIcW/kw?=
 =?us-ascii?Q?MYsUfNlBPm2kwRFWkwAzGistcuNnbldRrksEJ1HCZmzWUicklQV733oh/TAd?=
 =?us-ascii?Q?hL3IDPA5ScUXdomP34jnXRetPYlS/3gYAADxebA08Vfi9tcxBFHtlIU0kpbk?=
 =?us-ascii?Q?64DxTA1YGq3jNubqDiZnHRILw3OJlqpSOmWL/1UFM2D5zJen+xvBaQy3aZyI?=
 =?us-ascii?Q?5hhu4fSc01l4N6S10qYBunIDU6I7Lfu8qVihOBZxjMWNCVLcgw+BsnaEHvY?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b734611c-2c19-44cb-0902-08dd46f14196
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 21:00:15.7615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7422
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

From: Michael Kelley <mhklinux@outlook.com>
>=20
> From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30, 2025=
 12:44 PM
> >
> > > -----Original Message-----
> > > From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday, January 3=
0, 2025 3:20 PM
> > >
> > > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30,
> > > 2025 10:50 AM
> > > >
> > > > Sorry for the typo in the subject title. It should have been 'hyper=
v_fb soft lockup on
> > > > Azure Gen2 VM when taking kdump or executing kexec'
> > > >
> > > > Thomas
> > > >
> > > > >
> > > > > Hi Michael,
> > > > >
> > > > > We see an issue with the mainline kernel on the Azure Gen 2 VM wh=
en
> > > > > trying to induce a kernel panic with sysrq commands. The VM would=
 hang
> > > > > with soft lockup. A similar issue happens when executing kexec on=
 the VM.
> > > > > This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs w=
ith bios
> > > > > boot are fine.
> > > > >
> > > > > git bisect identifies the issue is cased by the commit 20ee2ae8c5=
899
> > > > > ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()"=
 ).
> > > > > However, reverting the commit would cause the frame buffer not to=
 work
> > > > > on the Gen2 VM.
> > > > >
> > > > > Do you have any hints on what caused this issue?
> > > > >
> > > > > To reproduce the issue with kdump:
> > > > > - Install mainline kernel on an Azure Gen 2 VM and trigger a kdum=
p
> > > > > - echo 1 > /proc/sys/kernel/sysrq
> > > > > - echo c > /proc/sysrq-trigger
> > > > >
> > > > > To reproduce the issue with executing kexec:
> > > > > - Install mainline kernel on Azure Gen 2 VM and use kexec
> > > > > - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img --co=
mmand-
> > > > > line=3D"$( cat /proc/cmdline )"
> > > > > - sudo kexec -e
> > > > >
> > > > > Thank you,
> > > > > Thomas
> > >
> > > I will take a look, but it might be early next week before I can do s=
o.
> > >
> >
> > Thank you, Michael for your help!
> >
> > > It looks like your soft lockup log below is from the kdump kernel (or=
 the newly
> > > kexec'ed kernel). Can you confirm? Also, this looks like a subset of =
the full log.
> >
> > Yes, the soft lockup log below is from the kdump kernel.
> >
> > > Do you have the full serial console log that you could email to me?  =
Seeing
> > > everything might be helpful. Of course, I'll try to repro the problem=
 myself
> > > as well.
> >
> > I have attached the complete bootup and kdump kernel log.
> >
> > File: bootup_and_kdump.log
> > Line 1 ... 984 (bootup log)
> > Line 990       (kdump kernel booting up)
> > Line 1351      (soft lockup)
> >
> > Thank you,
> > Thomas
> >
>=20
> I have reproduced the problem in an Azure VM running Oracle Linux
> 9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
> in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
> the 6.13.0 kernel. There are several differences in the two
> environments:  the version of Hyper-V, the VM configuration, the Linux
> distro, and the .config file used to build the 6.13.0 kernel. I'll try to
> figure out what make the difference, and then the root cause.
>=20

This has been a real bear to investigate. :-(  The key observation
is that with older kernel versions, the efifb driver does *not* try
to load when running in the kdump kernel, and everything works.
In newer kernels, the efifb driver *does* try to load, and it appears
to hang.  (Actually, it is causing the VM to run very slowly. More on
that in a minute.)

I've bisected the kernel again, compensating for the fact that commit
20ee2ae8c5899 is needed to make the Hyper-V frame buffer work. With
that compensation, the actual problematic commit is 2bebc3cd4870
(Revert "firmware/sysfb: Clear screen_info state after consuming it").
Doing the revert causes screen_info.orig_video_isVGA to retain its value
of 0x70 (VIDEO_TYPE_EFI), which the kdump kernel picks up, causing it
to load the efifb driver.

Then the question is why the efifb driver doesn't work in the kdump
kernel. Actually, it *does* work in many cases. I built the 6.13.0 kernel
on the Oracle Linux 9.4 system, and transferred the kernel image binary
and module binaries to an Ubuntu 20.04 VM in Azure. In that VM, the
efifb driver is loaded as part of the kdump kernel, and it doesn't cause
any problems. But there's an interesting difference. In the Oracle Linux
9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on
the Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This
difference is due to differences in how the screen_info variable gets
setup in the two VMs.

When the normal kernel starts in a freshly booted VM, Hyper-V provides
the EFI framebuffer at 0x40000000, and it works. But after the Hyper-V
FB driver or Hyper-V DRM driver has initialized, Linux has picked a
different MMIO address range and told Hyper-V to use the new
address range (which often starts at 0x40900000). A kexec does *not*
reset Hyper-V's transition to the new range, so when the efifb driver
tries to use the framebuffer at 0x40000000, the accesses trap to
Hyper-V and probably fail or timeout (I'm not sure of the details). After
the guest does some number of these bad references, Hyper-V considers
itself to be under attack from an ill-behaving guest, and throttles the
guest so that it doesn't run for a few seconds. The throttling repeats,
and results in extremely slow running in the kdump kernel.

Somehow in the Ubuntu 20.04 VM, the location of the frame buffer
as stored in screen_info.lfb_base gets updated to be 0x40900000. I
haven't fully debugged how that happens. But with that update, the
efifb driver is using the updated framebuffer address and it works. On
the Oracle Linux 9.4 system, that update doesn't appear to happen,
and the problem occurs.

This in an interim update on the problem. I'm still investigating how
screen_info.lfb_base is set in the kdump kernel, and why it is different
in the Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is
well understood, we can contemplate how to fix the problem. Undoing
the revert that is commit 2bebc3cd4870 doesn't seem like the solution
since the original code there was reported to cause many other issues.
The solution focus will likely be on how to ensure the kdump kernel gets
the correct framebuffer address so the efifb driver works, since the
framebuffer address changing is a quirk of Hyper-V behavior.

If anyone else has insight into what's going on here, please chime in.
What I've learned so far is still somewhat tentative.

Michael
