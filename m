Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6221A2CB65
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC1D10EBA5;
	Fri,  7 Feb 2025 18:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="FN/vpCzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04olkn2084.outbound.protection.outlook.com [40.92.47.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B5010EBA5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:35:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4uEx+uSlq9fIML5037g3apnO2NfqYnOuP9mL5+l/7qdys7VthXd7paRf6X0wvbMZ3AWAYLZkklhM+uCfzjrZXxAxahoCQmLcnkJ4xld4RkToJOD04C2F9D8PH7KJjCF75HnZhmrJMEbeUvR4iDTiA6rD8vz2gPzB+45/q0LPiMkguf9ClhWDzqJbuXt1g0X/OvTvfq28BLE6o4p9SG8uus5HMBSS4E79Kq3woxO4VUkUV74DEcPM+iIZiaOe61yGIIBhbku3H4O4XGBdLRNyGo8SpAeP5PjOSaSD6nwvC0DQ7/j1aaDL1/IuZ6gXSoQmhTIaiex06dNGQGmPWnxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBGK87HQebxBK3KJGseY29HhYwGuMBpjtVfVPouosXg=;
 b=C2d7PCj2tBrniL124+CRNC65CLvM6F8RsW+FpXZqrN7jqb8QTKebXRD9sjSM+WeeiQ1cJfVN2d3SLQ8zuiGG57CdX1fuxCilsCok3jCM4eQXOW3GEjp2YPBZYyILFujlfeVM/8OXgNtQqM6B0B+WyqBYl/vmBwFhcudwvk7cYJZP2v/CFCa7CG5IrHkfUQLxPoAmrTiHMhIFdF9Z/ym+SB+AHriYwwlM4isP6W3CQqiY5zOVml9q4VZ04wUfdiAT9tdRtGuYo3tNnhnKgLMMLeanpr00zJgUOI6M4vmQscHhivFSLC2GVF3QEiiB+KTwxBdsqwSJx0IONQRx19zJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBGK87HQebxBK3KJGseY29HhYwGuMBpjtVfVPouosXg=;
 b=FN/vpCzC2OvbEH3yyD+5HMj9lbGYbCDW7dV7THUs4YT0Y8l5nFh9KGT4wtIXkWelO977cBlLxLGMMLBW3nkouVDnb1/BWzVfdwncQzuiL1tnz48knV5lov1y0BmBp3eCAURVMIwHlMS4wNPZao8m084qAt1MmoXJO8Azs3cAv2nxGmm4YD2E/TPGOZRNdnQx3ubJVZPupQ41XNk1woYA7tHJI5xF0YX/ThSUyAYVzm+0ArA5uliUW9whB2O95/PHmJebYuivGLwpsHkiU4bCwvhQsIfz2ts7ULJW7JapWx3Bh8SsxWqI90CHHIuWm9XPAEEIMC4KMprrcYOm6XCPhA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SN3PEPF00013E29.namprd02.prod.outlook.com
 (2603:10b6:82c:400:0:3:0:4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Fri, 7 Feb
 2025 18:35:29 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 18:35:29 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@microsoft.com>, Thomas Tai
 <thomas.tai@oracle.com>, "mhkelley58@gmail.com" <mhkelley58@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, "javierm@redhat.com"
 <javierm@redhat.com>, Helge Deller <deller@gmx.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Topic: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwAAALyBRAAANwVQADJ+eeAAJV+q6AAJLKdwAAJqlww
Date: Fri, 7 Feb 2025 18:35:28 +0000
Message-ID: <SN6PR02MB41576DC39121E6340C6A860DD4F12@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
 <TYZP153MB079619B42859CAD4CAEB8771BEF12@TYZP153MB0796.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <TYZP153MB079619B42859CAD4CAEB8771BEF12@TYZP153MB0796.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c2f405a4-4cb7-4a3f-88d0-a72b07b69b33;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-02-07T13:52:35Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SN3PEPF00013E29:EE_
x-ms-office365-filtering-correlation-id: 7da71cb2-2e5b-4cd2-45f6-08dd47a63251
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799006|461199028|8062599003|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?nTXJewAetonr9LngJ420IrZ4CZkEqp0wa8vhstU7/r/UVqIQLGPVFcjuuylZ?=
 =?us-ascii?Q?KdzC7df+J2m1kSID9SzygHJtTJcoVuycoFLwzvv29nsFKQsVq4wiffAmHlAz?=
 =?us-ascii?Q?6cgQhyeb/1PXgoFxvaQAMtaJzi89zHgfvJPJBPrwL4kBSxRvXWEURn+gPZ0Z?=
 =?us-ascii?Q?1dfNZcvi2CSr86XFqRg/2KievuIFvIX7ADeEKiuaB2NwL22Mz/jq3QYIcyCU?=
 =?us-ascii?Q?Ir7n5xplOOhPw8IrOIZ3FIRBfab5ZikfvuikFeZL08VZNGLL6zkWN1WFVd4g?=
 =?us-ascii?Q?nwvovsJRfWqOnt8glPwOjxu9ZQwxgyinsjJc8aGTeYlbOwhEfyN9AFBJCQvG?=
 =?us-ascii?Q?wrnd5Mx3aIWAb9DYCaAsS+FNT5lw8NQPFHWyfN/DRH4tifG+nGTiFzqRf4vS?=
 =?us-ascii?Q?3nfzXO4wb2MqaDuDgfvS7KdWcAIly3QjH1bUUi1gZZYTFpWsFcKoemtD1Cdr?=
 =?us-ascii?Q?Rw1MSn3s+MXCW+ADaQbirzdeqWD1+Q2aHQ9Fad04/cZ3Xd8r9wRJNdprFg4r?=
 =?us-ascii?Q?0n/aj98MSVI+nMTSz4EPRFzXvIzIWSB0zXWmSQyp+obu9xj/XTS2n0wXl0B2?=
 =?us-ascii?Q?/uEknUDFDaynYzYODIIsL8mXpP2zBoIyI3RCFN5z5PMSS/2F9+8nZdaoS7J6?=
 =?us-ascii?Q?FU/3COE/CeDZ0BgCZOlRINoiKzf7frtplYxnw5x4jgPKs3+XvWbZHkGGUjB5?=
 =?us-ascii?Q?0/tB5K9M4AUvAGTlCih8ZHB7pzVr6zuKt/44bfFPs9Mp3fZVKLGSM1RRfMRR?=
 =?us-ascii?Q?57vixtq1MJxHLmujfQUlhksvo6DY7oS/Oq9hw849W7NhmOn78KCL3c/UqBhH?=
 =?us-ascii?Q?NF2YzceDlZvvilL3RYLHF9YGUBqSthpuOvEmkgzsBqa/SAX+thYjAQjkf+ZB?=
 =?us-ascii?Q?jPUmrMl0MB0MeN3BgCAM2QSRhNJdQw0MZ26ayn+sAeQus3X3ctNS8mbb1f0Z?=
 =?us-ascii?Q?r4P5JLgibnsrK90M69Qtil6xRhkEblRDh6CkNFuvuADWm/T2JoKvOqx3mhCq?=
 =?us-ascii?Q?eZNCiu2vYUauuPvllfca1tLHZIbqu/RfcrnpIhMAxFwBX0puLhaYiZH7V1Nk?=
 =?us-ascii?Q?8AVAYEz498A11rGlKbzDblwhxVJUPA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MqRMRQx3x2odiUKtGEKWMNxPiXa67BEgIea/MXMlImFb/qPpY7S1NT9Fg5h3?=
 =?us-ascii?Q?clcNYUCnOsJvbZgqPADjSJmLqvBLyOHVaxQtARKF5vJGE31Goy9AVViZvA4P?=
 =?us-ascii?Q?ItlT4mGr8pDnM6kOrwnacUBHb+oXjrFatymeimp+PK27SUJKEtk1aSZT+q6M?=
 =?us-ascii?Q?YoRx/S/KRIBtJol1G1WvkeTHikiVw+NR0a5NYBxoqwn+1Cx1LqZtXYu3cn2z?=
 =?us-ascii?Q?0gSy4fhJsFO/TkOaIDg2yZWfqyeHxwljMHx98GJoVPRjSOmtkdNQPF4YKmzX?=
 =?us-ascii?Q?IvfMc1naVnmFH80Mf/zuMBb+RurlOeIEFDA/E2zFnATYeDp7WMe/w1daRZI/?=
 =?us-ascii?Q?8dNPSsf3nMR8WB4Bg2sHyBX9zgOz565zAog1oX8vaRcxprXXqzcp3MhCX2On?=
 =?us-ascii?Q?ORiCR/PoelEGjrpdfxpIyBOIUhxa3/czuvsyTXxtyHGSofTR5v2WmgeucL29?=
 =?us-ascii?Q?/MmEeOyOOIiQJrKJuqSFkfrqCyw3LmrlvQV2S3xWNOwKY+fE8G0zs+TQ5Nc6?=
 =?us-ascii?Q?bkuKiyekpvlyVYQNiuc2QAeB4zspX7cw7YBQH/maFJY/74vpclgw2cPprUhC?=
 =?us-ascii?Q?sRAVzv1KkTGN5l06gZItryPkwJnkEAlZiMMrfuWvfpuWfPefstwuGwUUpWe9?=
 =?us-ascii?Q?99oaz73ilIrG+Daevvz7IN1hABbPVHBnp3OrSJrOYzjskjiY6btCrnEWTDIB?=
 =?us-ascii?Q?jAefF0K9gv1cdKE0VqTogDeLRM3iXunReKTBJXA9wrlaSw0iHiQPiak5Icp+?=
 =?us-ascii?Q?mmzIvDSXtObyRxNTNX83dw/RuI1gRvyxsLdmjnc1qFgfJGNdC0DUk5XJVXqi?=
 =?us-ascii?Q?ICF7aN4yU2Nh/5PPSecbOzHVoY8d6IhytB3xB0bUzUNRqSb4NKGu7/qj5N18?=
 =?us-ascii?Q?D880IrVtK0wydCXrfcg8NWa8QRkdyrWMKMqDR0Wx/Y8mocr1Umo9jGRgUYvE?=
 =?us-ascii?Q?fni1VuSq2+csvyPaMMPCDv+AB+aezb7oR9RLbCbkYJYeP+Kg2S5EzDNuDrmP?=
 =?us-ascii?Q?Jec6gxpBdRqGrZdnozO68e8ToE84Uq8qUKhlPXs/gfFE81ojgrP0Wemc+GBb?=
 =?us-ascii?Q?dkgciU00XBfS0E27gfLyNkOSDM/VKvCRben/PYCtKTM5tofDawRYnFnBjk/v?=
 =?us-ascii?Q?W6aUCqLUcPmseG5LAB/XQ0e7MirNK85x9Yls3Mx5EJ1mZ6QzdCoC8N1bh9fA?=
 =?us-ascii?Q?FrvKVW5i0HgL1f74CBG5DZJ1qhNuM6SxPZCK6JzQltl+LQVj6cSxN3kwwjE?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da71cb2-2e5b-4cd2-45f6-08dd47a63251
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 18:35:29.0398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN3PEPF00013E29
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

From: Saurabh Singh Sengar <ssengar@microsoft.com> Sent: Friday, February 7=
, 2025 6:06 AM
>=20
> Thanks Michael, for the analysis.
>=20
> I have tried the kdump steps on Oracle 9.4, 6.13.0 kernel as well. Althou=
gh I couldn't see
> the soft lockup issue I see some other VMBus failures. But I agree the bo=
otup is
> extremely slow, which should be due to same reason.

Yes, I would also think it is the same underlying reason.

>=20
> My system is having newer UEFI version, wondering if the latest UEFI vers=
ion
> (UEFI Release v4.1 08/23/2024) causing this difference in behaviour.

I've seen both the original behavior that Thomas Tai reported, as well as
the extremely slow behavior. In my experiments, it seems to depend on
the Azure V size being used, though I didn't fully investigate. Originally =
I
was using a DS5_v2 VM (which is what Thomas was using) and saw the
same "soft lockup" as Thomas. Then I moved to a D8ds_v5 VM, which
is somewhat cheaper, and was seeing the very slow behavior.

See my separate email from this morning with a full explanation of the
root cause.

Michael

>=20
> Relevant part of the logs:
> ---------------------------------------------------------
> echo 1 > /proc/sys/kernel/sysrq
> echo c > /proc/sysrq-trigger
> [  982.948352] sysrq: Trigger a crash
> [  982.949553] Kernel panic - not syncing: sysrq triggered crash
> [  982.951515] CPU: 31 UID: 0 PID: 6938 Comm: bash Kdump: loaded Not tain=
ted
> 6.13.0 #1
> [  982.954115] Hardware name: Microsoft Corporation Virtual Machine/Virtu=
al
> Machine, BIOS Hyper-V UEFI Release v4.1 08/23/2024
> [  982.957641] Call Trace:
> [  982.958508]  <TASK>
> [  982.959251]  panic+0x37e/0x3b0
> [  982.960373]  ? _printk+0x64/0x90
> [  982.961452]  sysrq_handle_crash+0x1a/0x20
> [  982.962840]  __handle_sysrq+0x9b/0x190
> [  982.964145]  write_sysrq_trigger+0x5f/0x80
> [  982.965578]  proc_reg_write+0x59/0xb0
> [  982.966905]  vfs_write+0x111/0x470
> [  982.968004]  ? __count_memcg_events+0xbf/0x150
> [  982.969432]  ? count_memcg_events.constprop.0+0x26/0x50
> [  982.971190]  ksys_write+0x6e/0xf0
> [  982.972307]  do_syscall_64+0x62/0x180
> [  982.973438]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  982.975102] RIP: 0033:0x7f3d570fdbd7
> [  982.976421] Code: 0f 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1=
f 00 f3 0f 1e fa
> 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff=
 ff 77 51 c3
> 48 83 ec 28 48 89 54 24 18 48 89 74 24
> [  982.982893] RSP: 002b:00007fff6d613c48 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000001
> [  982.985424] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f3d5=
70fdbd7
> [  982.987613] RDX: 0000000000000002 RSI: 000056362a928470 RDI:
> 0000000000000001
> [  982.989774] RBP: 000056362a928470 R08: 0000000000000000 R09:
> 00007f3d571b0d40
> [  982.992109] R10: 00007f3d571b0c40 R11: 0000000000000246 R12:
> 0000000000000002
> [  982.994321] R13: 00007f3d571fa780 R14: 0000000000000002 R15:
> 00007f3d571f59e0
> [  982.996461]  </TASK>
> [  982.998317] Kernel Offset: 0x10c00000 from 0xffffffff81000000 (relocat=
ion range:
> 0xffffffff80000000-0xffffffffbfffffff)
> [    0.000000] Linux version 6.13.0 (lisatest@lisa--505-e0-n0) (gcc (GCC)=
 11.5.0
> 20240719 (Red Hat 11.5.0-2.0.1), GNU ld version 2.35.2-54.0.1.el9) #1 SMP
> PREEMPT_DYNAMIC Thu Feb  6 10:05:27 UTC 2025
> [    0.000000] Command line: elfcorehdr=3D0xd000000
> BOOT_IMAGE=3D(hd0,gpt1)/vmlinuz-6.13.0 ro console=3Dtty0 console=3DttyS0,=
115200n8
> rd.lvm.vg=3Drootvg irqpoll nr_cpus=3D1 reset_devices cgroup_disable=3Dmem=
ory mce=3Doff
> numa=3Doff udev.children-max=3D2 panic=3D10 acpi_no_memhotplug
> transparent_hugepage=3Dnever nokaslr hest_disable novmcoredd cma=3D0 huge=
tlb_cma=3D0
> iommu=3Doff disable_cpu_apicid=3D0
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000000fff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000001000-0x000000000009ffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000000c0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x000000000d0e00b0-0x000000002cffffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000003eead000-0x000000003eeb3fff]
> reserved
> [    0.000000] BIOS-e820: [mem 0x000000003ff41000-0x000000003ffc8fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x000000003ffc9000-0x000000003fffafff] ACP=
I data
> [    0.000000] BIOS-e820: [mem 0x000000003fffb000-0x000000003fffefff] ACP=
I NVS
> [    0.000000] random: crng init done
>=20
> <snip>
>=20
> [    0.928063] Console: switching to colour frame buffer device 128x48
> [   13.391297] fb0: EFI VGA frame buffer device
>=20
> <snip>
>=20
> [  590.199511] hv_netvsc 7c1e527c-2980-7c1e-527c-29807c1e527c (unnamed
> net_device) (uninitialized): VF slot 1 added
> [  595.120270] Console: switching to colour dummy device 80x25
> [  605.203700] hyperv_fb: Time out on waiting vram location ack
> [  605.206161] iounmap: bad address 0000000005f4dac5
> [  605.207740] CPU: 0 UID: 0 PID: 30 Comm: kworker/u4:2 Not tainted 6.13.=
0 #1
> [  605.209984] Hardware name: Microsoft Corporation Virtual Machine/Virtu=
al
> Machine, BIOS Hyper-V UEFI Release v4.1 08/23/2024
> [  605.213869] Workqueue: async async_run_entry_fn
> [  605.215601] Call Trace:
> [  605.216382]  <TASK>
> [  605.217123]  dump_stack_lvl+0x66/0x90
> [  605.218184]  hvfb_putmem+0x32/0x110 [hyperv_fb]
> [  605.219646]  hvfb_probe+0x27f/0x360 [hyperv_fb]
> [  605.221120]  vmbus_probe+0x3d/0xa0 [hv_vmbus]
> [  605.222623]  really_probe+0xd9/0x390
> [  605.223779]  __driver_probe_device+0x78/0x160
> [  605.225213]  driver_probe_device+0x1e/0xa0
> [  605.226591]  __driver_attach_async_helper+0x5e/0xe0
> [  605.228166]  async_run_entry_fn+0x34/0x130
> [  605.229681]  process_one_work+0x187/0x3b0
> [  605.231075]  worker_thread+0x24e/0x360
> [  605.232376]  ? __pfx_worker_thread+0x10/0x10
> [  605.233758]  kthread+0xd3/0x100
> [  605.234805]  ? __pfx_kthread+0x10/0x10
> [  605.236053]  ret_from_fork+0x34/0x50
> [  605.237251]  ? __pfx_kthread+0x10/0x10
> [  605.238519]  ret_from_fork_asm+0x1a/0x30
> [  605.239833]  </TASK>
> [  605.240855] hv_vmbus: probe failed for device 5620e0c7-8062-4dce-aeb7-
> 520c7ef76171 (-110)
> [  605.243404] hyperv_fb 5620e0c7-8062-4dce-aeb7-520c7ef76171: probe with
> driver hyperv_fb failed with error -110
> [  605.254672] hv_vmbus: registering driver hv_pci
>=20
>=20
>=20
>=20
> - Saurabh
>=20
> > -----Original Message-----
> > From: Michael Kelley <mhklinux@outlook.com>
> > Sent: 07 February 2025 02:30
> > To: Michael Kelley <mhklinux@outlook.com>; Thomas Tai
> > <thomas.tai@oracle.com>; mhkelley58@gmail.com; Haiyang Zhang
> > <haiyangz@microsoft.com>; wei.liu@kernel.org; Dexuan Cui
> > <decui@microsoft.com>; drawat.floss@gmail.com; javierm@redhat.com;
> > Helge Deller <deller@gmx.de>; daniel@ffwll.ch; airlied@gmail.com;
> > tzimmermann@suse.de
> > Cc: dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org; linux=
-
> > kernel@vger.kernel.org; linux-hyperv@vger.kernel.org
> > Subject: [EXTERNAL] RE: hyper_bf soft lockup on Azure Gen2 VM when taki=
ng
> > kdump or executing kexec
> >
> > From: Michael Kelley <mhklinux@outlook.com>
> > >
> > > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30,
> > > 2025 12:44 PM
> > > >
> > > > > -----Original Message-----
> > > > > From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday,
> > > > > January 30, 2025 3:20 PM
> > > > >
> > > > > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January
> > > > > 30,
> > > > > 2025 10:50 AM
> > > > > >
> > > > > > Sorry for the typo in the subject title. It should have been
> > > > > > 'hyperv_fb soft lockup on Azure Gen2 VM when taking kdump or
> > executing kexec'
> > > > > >
> > > > > > Thomas
> > > > > >
> > > > > > >
> > > > > > > Hi Michael,
> > > > > > >
> > > > > > > We see an issue with the mainline kernel on the Azure Gen 2 V=
M
> > > > > > > when trying to induce a kernel panic with sysrq commands. The
> > > > > > > VM would hang with soft lockup. A similar issue happens when
> > executing kexec on the VM.
> > > > > > > This issue is seen only with Gen2 VMs(with UEFI boot). Gen1
> > > > > > > VMs with bios boot are fine.
> > > > > > >
> > > > > > > git bisect identifies the issue is cased by the commit
> > > > > > > 20ee2ae8c5899
> > > > > > > ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getme=
m()" ).
> > > > > > > However, reverting the commit would cause the frame buffer no=
t
> > > > > > > to work on the Gen2 VM.
> > > > > > >
> > > > > > > Do you have any hints on what caused this issue?
> > > > > > >
> > > > > > > To reproduce the issue with kdump:
> > > > > > > - Install mainline kernel on an Azure Gen 2 VM and trigger a
> > > > > > > kdump
> > > > > > > - echo 1 > /proc/sys/kernel/sysrq
> > > > > > > - echo c > /proc/sysrq-trigger
> > > > > > >
> > > > > > > To reproduce the issue with executing kexec:
> > > > > > > - Install mainline kernel on Azure Gen 2 VM and use kexec
> > > > > > > - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img
> > > > > > > --command- line=3D"$( cat /proc/cmdline )"
> > > > > > > - sudo kexec -e
> > > > > > >
> > > > > > > Thank you,
> > > > > > > Thomas
> > > > >
> > > > > I will take a look, but it might be early next week before I can =
do so.
> > > > >
> > > >
> > > > Thank you, Michael for your help!
> > > >
> > > > > It looks like your soft lockup log below is from the kdump kernel
> > > > > (or the newly kexec'ed kernel). Can you confirm? Also, this looks=
 like a
> > subset of the full log.
> > > >
> > > > Yes, the soft lockup log below is from the kdump kernel.
> > > >
> > > > > Do you have the full serial console log that you could email to
> > > > > me?  Seeing everything might be helpful. Of course, I'll try to
> > > > > repro the problem myself as well.
> > > >
> > > > I have attached the complete bootup and kdump kernel log.
> > > >
> > > > File: bootup_and_kdump.log
> > > > Line 1 ... 984 (bootup log)
> > > > Line 990       (kdump kernel booting up)
> > > > Line 1351      (soft lockup)
> > > >
> > > > Thank you,
> > > > Thomas
> > > >
> > >
> > > I have reproduced the problem in an Azure VM running Oracle Linux
> > > 9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
> > > in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
> > > the 6.13.0 kernel. There are several differences in the two
> > > environments:  the version of Hyper-V, the VM configuration, the Linu=
x
> > > distro, and the .config file used to build the 6.13.0 kernel. I'll tr=
y
> > > to figure out what make the difference, and then the root cause.
> > >
> >
> > This has been a real bear to investigate. :-(  The key observation is t=
hat with
> > older kernel versions, the efifb driver does *not* try to load when run=
ning in
> > the kdump kernel, and everything works.
> > In newer kernels, the efifb driver *does* try to load, and it appears t=
o hang.
> > (Actually, it is causing the VM to run very slowly. More on that in a m=
inute.)
> >
> > I've bisected the kernel again, compensating for the fact that commit
> > 20ee2ae8c5899 is needed to make the Hyper-V frame buffer work. With tha=
t
> > compensation, the actual problematic commit is 2bebc3cd4870 (Revert
> > "firmware/sysfb: Clear screen_info state after consuming it").
> > Doing the revert causes screen_info.orig_video_isVGA to retain its valu=
e of
> > 0x70 (VIDEO_TYPE_EFI), which the kdump kernel picks up, causing it to l=
oad
> > the efifb driver.
> >
> > Then the question is why the efifb driver doesn't work in the kdump ker=
nel.
> > Actually, it *does* work in many cases. I built the 6.13.0 kernel on th=
e Oracle
> > Linux 9.4 system, and transferred the kernel image binary and module
> > binaries to an Ubuntu 20.04 VM in Azure. In that VM, the efifb driver i=
s
> > loaded as part of the kdump kernel, and it doesn't cause any problems. =
But
> > there's an interesting difference. In the Oracle Linux
> > 9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on =
the
> > Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This differenc=
e is
> > due to differences in how the screen_info variable gets setup in the tw=
o VMs.
> >
> > When the normal kernel starts in a freshly booted VM, Hyper-V provides =
the
> > EFI framebuffer at 0x40000000, and it works. But after the Hyper-V FB d=
river
> > or Hyper-V DRM driver has initialized, Linux has picked a different MMI=
O
> > address range and told Hyper-V to use the new address range (which ofte=
n
> > starts at 0x40900000). A kexec does *not* reset Hyper-V's transition to=
 the
> > new range, so when the efifb driver tries to use the framebuffer at
> > 0x40000000, the accesses trap to Hyper-V and probably fail or timeout (=
I'm
> > not sure of the details). After the guest does some number of these bad
> > references, Hyper-V considers itself to be under attack from an ill-beh=
aving
> > guest, and throttles the guest so that it doesn't run for a few seconds=
. The
> > throttling repeats, and results in extremely slow running in the kdump =
kernel.
> >
> > Somehow in the Ubuntu 20.04 VM, the location of the frame buffer as sto=
red
> > in screen_info.lfb_base gets updated to be 0x40900000. I haven't fully
> > debugged how that happens. But with that update, the efifb driver is us=
ing
> > the updated framebuffer address and it works. On the Oracle Linux 9.4
> > system, that update doesn't appear to happen, and the problem occurs.
> >
> > This in an interim update on the problem. I'm still investigating how
> > screen_info.lfb_base is set in the kdump kernel, and why it is differen=
t in the
> > Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is well
> > understood, we can contemplate how to fix the problem. Undoing the reve=
rt
> > that is commit 2bebc3cd4870 doesn't seem like the solution since the or=
iginal
> > code there was reported to cause many other issues.
> > The solution focus will likely be on how to ensure the kdump kernel get=
s the
> > correct framebuffer address so the efifb driver works, since the frameb=
uffer
> > address changing is a quirk of Hyper-V behavior.
> >
> > If anyone else has insight into what's going on here, please chime in.
> > What I've learned so far is still somewhat tentative.
> >
> > Michael

