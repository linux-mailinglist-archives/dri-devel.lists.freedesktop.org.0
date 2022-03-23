Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540844E4F7F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 10:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E1F10E64B;
	Wed, 23 Mar 2022 09:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E210E176;
 Wed, 23 Mar 2022 09:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWm+HnY2jjoiwDmCsEbs0TYRkUWYd/w7kPPdL6JiKnlG40cbOkK++N+UeS5qcW93ejvhplL0fYaEPCfBiXg/tw3ZZyPzKzYyf11XX7jsQUbQ2ohycBs+F5batQXCounNzf7YU7nhrIqF9YOHJEgTwp/rSq8Ong4BFmd0qFXgaigZC9JYhLV7hcpDyqZXC+uqix3Q38SmQfAnbJMh8EgJXQ4mB9teLgpLe8k6geDU4SL1iEnRGg3APNHd5ImEqwCGu/XQoSJzdTKuQTgFUnzgVQS8Rjx5JZiY+8d+XKUjMMqDHNf9om5ArbYepSVFTdsLRt8YIHuMNjSR7YX/hEy5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d+Z6MELOXZVcF25UdGqriheDvHFMgDgyQElF2Rwoeo=;
 b=ERMU3JCm/qEs6hM6RbhgqvUBByg3hsszkUamYbkKyzFFpwOSBeaoV8skQuPif47O8IiBcsXraruHj/5XmxGEAkxjkiyRROgNTu1X/Yo7KiHZg3uSUDgF+hDostVF3pRJ9DJxZZQmPr+i4fsD3EjRDGCSc9EXkcMldjR/lg0qiFFzje3g5u5ASPNkNjHSN4y75osXe2Nem3S7PzUn6GxJDkJYHWit9O7WLVn3beZwVXTP69TtvrhjIkD0oJBnLdxhwM4L+1yXs0JK6s4ZmT3948DiFhexrtOHgX8l+cf17BTUL1xUNZsBb/ruGgIS+COSzW4w39k3+1WCH/f1xPAbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d+Z6MELOXZVcF25UdGqriheDvHFMgDgyQElF2Rwoeo=;
 b=KEuEJp2/q8KBcO6IiFcBW1ozVXpePQTjRKZL/IW1F1pWhez5A71lWsepGInGUSgky4jCg/6sjSKMhHN9m+ISvBcqp6Q3Q2PK7yejjdeMKoLRPZ52Npyw8y4i6m/koBDDeRW/y9gQcF3Cx7frhIsCPUPoXBhfS9RPh/+CHu14viw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3380.namprd12.prod.outlook.com (2603:10b6:408:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Wed, 23 Mar
 2022 09:34:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 09:34:43 +0000
Content-Type: multipart/alternative;
 boundary="------------JIronl0u3pro0A05G1Xs23vD"
Message-ID: <446f8b34-92f2-136a-6076-a8a7991c9fa8@amd.com>
Date: Wed, 23 Mar 2022 10:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IFtQQVRDSCB2MSAxLzJdIGRybS9xeGw6IHJl?=
 =?UTF-8?Q?place_ioremap_by_ioremap=5fcache_on_arm64?=
Content-Language: en-US
To: liucong2@kylinos.cn, airlied@redhat.com, kraxel@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, ray.huang@amd.com,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <18a8ijpwp6j-18a9shjbr0c@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <18a8ijpwp6j-18a9shjbr0c@nsmail6.0>
X-ClientProxiedBy: AM6PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c923d13-9392-4e5a-41b0-08da0cb05c8d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3380:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3380C5EFBD315CA8306B117183189@BN8PR12MB3380.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygtaOhWGsL63Eqrm4yDds0K/9I9ZUom61thYBKkJfrMKVfJMo44T5ROLmT9xuX/jbqxqwdYnJse6JFKIVLCZIq5uRBH0uIYsyig9MHdaidysr6eyPW7r004+dyAtwbjEWbwVPjM5dqYvrGijZvOJ2tJKfymgdWbJPGPb3nGx5Lbu7EvZRq+LIIiev7DQkfxsq8L8l6gjI2SwEhtsD5FQFYbean0gY65SnXy9strVkSIrU9OM5hiC65yor0pCt2aTu2QdUzeGogHA9A5vwRCKh+qQYLwHouveWaPHSCWh8EO9UtsriGlzRrZc7fRpUXARSf9e7nt65KE3FZLEr7W7aFvEPFJNLpQIRVbH/aumdAodDmQgHv9aGnjZOhsuPGbXUcvG+6FOnX9YqZ+fkjto3+eyPFMdvBJT3uQWPUn76uKqPI6bhBsHqRMNq8ECbRJSe6KWNltlvd/9/ZY3reX39ItwUbCFAxGD/cCA8qC/1Csekketr/ClPdr7G2voy+M1ki6kbf5Fn4ultSa2sDsCo78L+pKE03NEFO6UXzIBDn3cFZv2bVmErbojJsASrl+kYuLA4Ph+SWlDse+mSQpwijmOuZhcTyK5bZIoLVmCm6pXRM1fuua3xIDZLcsTYDP4rvIFopcMLsqcPz+BT11Ho3qbI4oNxDS8lGDL9tj8hmz0vlbbNriRpvHWYDYGm42cl0SHbbR4cvxa8q2adqSk93Vz08Fh0PoL6aiPXQovZvDHKW+kLJ/53SChv37+EJ7/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(86362001)(6506007)(6486002)(33964004)(2616005)(5660300002)(31696002)(8936002)(6666004)(6512007)(66946007)(66556008)(66476007)(38100700002)(508600001)(224303003)(66574015)(83380400001)(36756003)(2906002)(30864003)(186003)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZBU3B2QlBGaDJSY2hjbm1oL1FwamNZWlVCV2VyWW1kM0N3V0RFRXBxUlRL?=
 =?utf-8?B?RXk0TGJseEo3MDQvTTZZR1ZubkFDRzNsMi9RUDQ1aFJUYW9BT1BMUjZIdXZR?=
 =?utf-8?B?REswR1FYUFllVTE1UkVuL1F3MTVVcnlhRHpkZkZ5b1NmQTdnMWpoSVhkdWZL?=
 =?utf-8?B?UlZNZkVjZzNidU1BNDFmVUR0M2JVV203NzVXZFo3TXZNcy9oQWdzeFMwSDg5?=
 =?utf-8?B?TG1FMU01TEhVTWlPZExsQjJoNjU0blI3c3RXa0ZxOUhOcmg3SkJTMFBMdHVy?=
 =?utf-8?B?bjErTm9QNGYwWHRYMWhVM1NVR3cxNFhMK2pQN0JhWFRGc083UmZvaU5uWDd6?=
 =?utf-8?B?a09hZEdTUVFkMStYRFhRV0t3d0pIYnAyMldKNlpONnU0Z1ZpVDZPMTBDWXJQ?=
 =?utf-8?B?UE94ekdtTTF6V2l2cTllQS9CVjVKOWxrVGQ4Q2ZXWklrd3FldG9MYkVXZm40?=
 =?utf-8?B?OWVwL2M5Z2s4ZFk4VjFCUzJRSWQ0WkpCMEJMbFE1RXFLVGFxSjRzUGFYWDM0?=
 =?utf-8?B?bUROcVpScGRla0p0WnY0N0NMWXFBbGY2Ykl1VDdybTNIam5hWStOVEVUODhL?=
 =?utf-8?B?ZmEvTmV4TDZyQ2J4b2lXOHlxK3NudmxpRmZMR1dVczVFOVRBVHBqd1FYK1Ay?=
 =?utf-8?B?aXB5UldTSU1pQzcwZ2ZDQVBNVmp3YzBKdmMvRWFIY0tzY3FUN1NLTHM4Mi9R?=
 =?utf-8?B?dzhWS1NhYjFNUGpEY3U4ZFMrWnpTczFDL2c2ZDAyZkFlMmV2cWRPNjFaM2xu?=
 =?utf-8?B?SzFYdUlUNzRQWnUxYWdXd1NUQzVxVVJyZEx6YVpCUnRxeWZvek02aVA0WEVT?=
 =?utf-8?B?K011amZQTXVObCswZmxURkZSWHlYejMvMkF1ZVpOYXR6WlVWZlcwMzRkQkRF?=
 =?utf-8?B?QjhCU2NuMnIvVkFKelhKVG15RTY1RFZjVERyZ0pCS3M1UDc3RkVaVktLa0Zj?=
 =?utf-8?B?WEo3RmlEVjFIdnk0WldYSnAraWhteFNJZmwramZZbkg5Y2UydUNGazNlNjBV?=
 =?utf-8?B?ZFo2NGtQYWhleHhQYlRIYm9vL2Y1QlpIdUQrekVwdjJjQ3NXWnNMOW5EZm5n?=
 =?utf-8?B?Y2NhT042UFZ0RE9OQ3hGcnk3QU5ZZmw1UnNoSUI5T3lnUEc3dFk2TklqZVZq?=
 =?utf-8?B?aUt2WlJwM1IyZ0ZDVlgyZEZZcTNieElxcFhOaGhPSFFmZnQrZ0hTclg4ajFy?=
 =?utf-8?B?YS9ER2V3RWxKL1pDTzE1MmJPYWQ1MHlXR3lXTzJObCtHMWtmcm1Pbkw0RGtH?=
 =?utf-8?B?VG5pVTQyKzN6S2VEYXQvMmJ2cjAxdTBDcUg0OU1jTzVpeFkrbVNMZUNsOVla?=
 =?utf-8?B?TDVVRk1yUkJkUU5KS2xLb0daUHA3aHJ5RndMS04ydVZORmtlODJlb2FOZjd2?=
 =?utf-8?B?WGMxWlZvUDRRQiswSi8rRjZwQ083SUVuYllFK3RkMG1Xd2VPTjNQZTFZSitO?=
 =?utf-8?B?Zy82TFBlOTN5VlJVUmtwUTdENENyUWkyZ1I4d1o3Z0lmaWNYOUkxVUJodEVw?=
 =?utf-8?B?NklyM2ZWMnpNOEY3Q1BZTzZVeXhTUENGeTcvZk13UGp0VXAxOUoxNE01VlJy?=
 =?utf-8?B?bU80dlJsMVhBV2pVajFQTGc3SHhiL0t4RXk1UGFqY1R3SDJ1NUpxcTlLSSsx?=
 =?utf-8?B?Y05RWUw1eG5OYkEyU2dRRVpRVzg3c2FEbUJWTlRtb1FaWnhKR05IK3hFa0o2?=
 =?utf-8?B?bHpkSnd3aHg1K09vTHB6b2FXYTNjaWFZcDlKU0tGelhibytaR1Q3NnZidFp2?=
 =?utf-8?B?M3pkY3pjcXBobDNUbENPb1dvckxja0I5WFA3UW83SG5WZ1dhdjhScG5oRldE?=
 =?utf-8?B?WHJsTi9wa2YrWDFzK1MyVldhb1RjNmwwV0grK2ZJTFRiYTkxRW1MSitKcDZK?=
 =?utf-8?B?UlU1Mk1OOFcxN1BEZVg1ekUyNFg2UnovaEpaR0RRMmRmMlRoUHVKTENvMDht?=
 =?utf-8?Q?dp6vPUpxyi2Cp//HxHXsZAYsQgZ6tt+0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c923d13-9392-4e5a-41b0-08da0cb05c8d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 09:34:43.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stbNMGdwsqlidlEEiHE4kUom/Wt9fUhjL7H3tajzffLSm+C8CT/Aq6MkaQGzsito
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3380
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

--------------JIronl0u3pro0A05G1Xs23vD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cong,

well than Dave must decide what to do here.

When QXL emulates a device it should also not use memory accesses which 
won't work on a physical device.

BTW: Your patch is really buggy, it misses the cases in ttm_module.c

Regards,
Christian.

Am 23.03.22 um 09:48 schrieb liucong2@kylinos.cn:
>
> Hi Christian,
>
>
> according to 'Arm Architecture Reference Manual Armv8,for Armv8-A
>
> architecture profile' pdf E2.6.5
>
>
> E2.6.5 Generation of Alignment faults by load/store multiple accesses to
>
>  Device memory
>
>
> When FEAT_LSMAOC is implemented and the value of the applicable nTLSMD
>
> field is 0, any memory access by an AArch32 Load Multiple or Store
>
> Multiple instruction to an address that the stage 1 translation
>
> assigns as Device-nGRE, Device-nGnRE, or Device-nGnRnE generates
>
> an Alignment fault.
>
>
> so it seems not just some ARM boards doesn't allow unaligned access to 
> MMIO
>
> space, all pci memory mapped as Device-nGnRE in arm64 cannot support
>
> unaligned access. and qxl is a device simulated by qemu, it should be 
> able to access
>
> to MMIO space in a more flexible way(PROT_NORMAL) than the real physical
>
> graphics card.
>
>
> ----
>
>
>
> Cong.
>
>
>
>
>
> *主　题：*Re: [PATCH v1 1/2] drm/qxl: replace ioremap by ioremap_cache on 
> arm64
> *日　期：*2022-03-23 15:15
> *发件人：*Christian König
> *收件人：*Cong 
> Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org 
>
>
>
> Am 22.03.22 um 10:34 schrieb Cong Liu:
> > qxl use ioremap to map ram_header and rom, in the arm64 implementation,
> > the device is mapped as DEVICE_nGnRE, it can not support unaligned
> > access.
>
> Well that some ARM boards doesn't allow unaligned access to MMIO space
> is a well known bug of those ARM boards.
>
> So as far as I know this is a hardware bug you are trying to workaround
> here and I'm not 100% sure that this is correct.
>
> Christian.
>
> >
> >    6.620515] pc : setup_hw_slot+0x24/0x60 [qxl]
> > [    6.620961] lr : setup_slot+0x34/0xf0 [qxl]
> > [    6.621376] sp : ffff800012b73760
> > [    6.621701] x29: ffff800012b73760 x28: 0000000000000001 x27: 
> 0000000010000000
> > [    6.622400] x26: 0000000000000001 x25: 0000000004000000 x24: 
> ffffcf376848c000
> > [    6.623099] x23: ffff0000c4087400 x22: ffffcf3718e17140 x21: 
> 0000000000000000
> > [    6.623823] x20: ffff0000c4086000 x19: ffff0000c40870b0 x18: 
> 0000000000000014
> > [    6.624519] x17: 000000004d3605ab x16: 00000000bb3b6129 x15: 
> 000000006e771809
> > [    6.625214] x14: 0000000000000001 x13: 007473696c5f7974 x12: 
> 696e696666615f65
> > [    6.625909] x11: 00000000d543656a x10: 0000000000000000 x9 : 
> ffffcf3718e085a4
> > [    6.626616] x8 : 00000000006c7871 x7 : 000000000000000a x6 : 
> 0000000000000017
> > [    6.627343] x5 : 0000000000001400 x4 : ffff800011f63400 x3 : 
> 0000000014000000
> > [    6.628047] x2 : 0000000000000000 x1 : ffff0000c40870b0 x0 : 
> ffff0000c4086000
> > [    6.628751] Call trace:
> > [    6.628994]  setup_hw_slot+0x24/0x60 [qxl]
> > [    6.629404]  setup_slot+0x34/0xf0 [qxl]
> > [    6.629790]  qxl_device_init+0x6f0/0x7f0 [qxl]
> > [    6.630235]  qxl_pci_probe+0xdc/0x1d0 [qxl]
> > [    6.630654]  local_pci_probe+0x48/0xb8
> > [    6.631027]  pci_device_probe+0x194/0x208
> > [    6.631464]  really_probe+0xd0/0x458
> > [    6.631818]  __driver_probe_device+0x124/0x1c0
> > [    6.632256]  driver_probe_device+0x48/0x130
> > [    6.632669]  __driver_attach+0xc4/0x1a8
> > [    6.633049]  bus_for_each_dev+0x78/0xd0
> > [    6.633437]  driver_attach+0x2c/0x38
> > [    6.633789]  bus_add_driver+0x154/0x248
> > [    6.634168]  driver_register+0x6c/0x128
> > [    6.635205]  __pci_register_driver+0x4c/0x58
> > [    6.635628]  qxl_init+0x48/0x1000 [qxl]
> > [    6.636013]  do_one_initcall+0x50/0x240
> > [    6.636390]  do_init_module+0x60/0x238
> > [    6.636768]  load_module+0x2458/0x2900
> > [    6.637136]  __do_sys_finit_module+0xbc/0x128
> > [    6.637561]  __arm64_sys_finit_module+0x28/0x38
> > [    6.638004]  invoke_syscall+0x74/0xf0
> > [    6.638366]  el0_svc_common.constprop.0+0x58/0x1a8
> > [    6.638836]  do_el0_svc+0x2c/0x90
> > [    6.639216]  el0_svc+0x40/0x190
> > [    6.639526]  el0t_64_sync_handler+0xb0/0xb8
> > [    6.639934]  el0t_64_sync+0x1a4/0x1a8
> > [    6.640294] Code: 910003fd f9484804 f9400c23 8b050084 (f809c083)
> > [    6.640889] ---[ end trace 95615d89b7c87f95 ]---
> >
> > Signed-off-by: Cong Liu
> > ---
> >   drivers/gpu/drm/qxl/qxl_kms.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/qxl/qxl_kms.c 
> b/drivers/gpu/drm/qxl/qxl_kms.c
> > index 4dc5ad13f12c..0e61ac04d8ad 100644
> > --- a/drivers/gpu/drm/qxl/qxl_kms.c
> > +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> > @@ -165,7 +165,11 @@ int qxl_device_init(struct qxl_device *qdev,
> >   (int)qdev->surfaceram_size / 1024,
> >   (sb == 4) ? "64bit" : "32bit");
> >
> > +#ifdef CONFIG_ARM64
> > + qdev->rom = ioremap_cache(qdev->rom_base, qdev->rom_size);
> > +#else
> >   qdev->rom = ioremap(qdev->rom_base, qdev->rom_size);
> > +#endif
> >   if (!qdev->rom) {
> >   pr_err("Unable to ioremap ROM\n");
> >   r = -ENOMEM;
> > @@ -183,9 +187,15 @@ int qxl_device_init(struct qxl_device *qdev,
> >   goto rom_unmap;
> >   }
> >
> > +#ifdef CONFIG_ARM64
> > + qdev->ram_header = ioremap_cache(qdev->vram_base +
> > +   qdev->rom->ram_header_offset,
> > +   sizeof(*qdev->ram_header));
> > +#else
> >   qdev->ram_header = ioremap(qdev->vram_base +
> >     qdev->rom->ram_header_offset,
> >     sizeof(*qdev->ram_header));
> > +#endif
> >   if (!qdev->ram_header) {
> >   DRM_ERROR("Unable to ioremap RAM header\n");
> >   r = -ENOMEM;
>

--------------JIronl0u3pro0A05G1Xs23vD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Cong,<br>
    <br>
    well than Dave must decide what to do here.<br>
    <br>
    When QXL emulates a device it should also not use memory accesses
    which won't work on a physical device.<br>
    <br>
    BTW: Your patch is really buggy, it misses the cases in ttm_module.c<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 23.03.22 um 09:48 schrieb
      <a class="moz-txt-link-abbreviated" href="mailto:liucong2@kylinos.cn">liucong2@kylinos.cn</a>:<br>
    </div>
    <blockquote type="cite" cite="mid:18a8ijpwp6j-18a9shjbr0c@nsmail6.0">
      
      <p>Hi Christian,</p>
      <p><br>
      </p>
      <p>according to 'Arm Architecture Reference Manual Armv8,for
        Armv8-A</p>
      <p>architecture profile' pdf E2.6.5</p>
      <p><br>
      </p>
      <p>E2.6.5 Generation of Alignment faults by load/store multiple
        accesses to</p>
      <p>&nbsp;Device memory</p>
      <p><br>
      </p>
      <p><span style="white-space:pre">	</span>When FEAT_LSMAOC is
        implemented and the value of the applicable nTLSMD</p>
      <p><span style="white-space:pre">	</span>field is 0, any memory
        access by an AArch32 Load Multiple or Store&nbsp;</p>
      <p><span style="white-space:pre">	</span>Multiple instruction to
        an address that the stage 1 translation&nbsp;</p>
      <p><span style="white-space:pre">	</span>assigns as Device-nGRE,
        Device-nGnRE, or Device-nGnRnE generates&nbsp;</p>
      <p><span style="white-space: pre;">	</span>an Alignment fault.</p>
      <br>
      <p>so it seems not just&nbsp;some ARM boards doesn't allow unaligned
        access to MMIO&nbsp;</p>
      <p>space, all pci memory mapped as&nbsp;Device-nGnRE in arm64 cannot
        support</p>
      <p>unaligned access. and qxl is a device&nbsp;simulated by qemu, it
        should be able to access&nbsp;</p>
      <p>to MMIO space in a more flexible way(PROT_NORMAL) than the real
        physical&nbsp;</p>
      <p>graphics card.</p>
      <p><br>
      </p>
      <p>----</p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p>Cong.<br>
      </p>
      <p><br>
      </p>
      <p><br>
        <br>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><strong>主　题：</strong><span id="subject">Re: [PATCH v1 1/2]
          drm/qxl: replace ioremap by ioremap_cache on arm64</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>日　期：</strong><span id="date">2022-03-23 15:15</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>发件人：</strong><span id="from">Christian König</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>收件人：</strong><span id="to">Cong
<a class="moz-txt-link-abbreviated" href="mailto:Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org">Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org</a></span>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>Am 22.03.22 um 10:34 schrieb Cong Liu:<br>
        &gt; qxl use ioremap to map ram_header and rom, in the arm64
        implementation,<br>
        &gt; the device is mapped as DEVICE_nGnRE, it can not support
        unaligned<br>
        &gt; access.<br>
        <br>
        Well that some ARM boards doesn't allow unaligned access to MMIO
        space <br>
        is a well known bug of those ARM boards.<br>
        <br>
        So as far as I know this is a hardware bug you are trying to
        workaround <br>
        here and I'm not 100% sure that this is correct.<br>
        <br>
        Christian.<br>
        <br>
        &gt;<br>
        &gt; &nbsp; &nbsp;6.620515] pc : setup_hw_slot+0x24/0x60 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.620961] lr : setup_slot+0x34/0xf0 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.621376] sp : ffff800012b73760<br>
        &gt; [ &nbsp; &nbsp;6.621701] x29: ffff800012b73760 x28: 0000000000000001
        x27: 0000000010000000<br>
        &gt; [ &nbsp; &nbsp;6.622400] x26: 0000000000000001 x25: 0000000004000000
        x24: ffffcf376848c000<br>
        &gt; [ &nbsp; &nbsp;6.623099] x23: ffff0000c4087400 x22: ffffcf3718e17140
        x21: 0000000000000000<br>
        &gt; [ &nbsp; &nbsp;6.623823] x20: ffff0000c4086000 x19: ffff0000c40870b0
        x18: 0000000000000014<br>
        &gt; [ &nbsp; &nbsp;6.624519] x17: 000000004d3605ab x16: 00000000bb3b6129
        x15: 000000006e771809<br>
        &gt; [ &nbsp; &nbsp;6.625214] x14: 0000000000000001 x13: 007473696c5f7974
        x12: 696e696666615f65<br>
        &gt; [ &nbsp; &nbsp;6.625909] x11: 00000000d543656a x10: 0000000000000000
        x9 : ffffcf3718e085a4<br>
        &gt; [ &nbsp; &nbsp;6.626616] x8 : 00000000006c7871 x7 : 000000000000000a
        x6 : 0000000000000017<br>
        &gt; [ &nbsp; &nbsp;6.627343] x5 : 0000000000001400 x4 : ffff800011f63400
        x3 : 0000000014000000<br>
        &gt; [ &nbsp; &nbsp;6.628047] x2 : 0000000000000000 x1 : ffff0000c40870b0
        x0 : ffff0000c4086000<br>
        &gt; [ &nbsp; &nbsp;6.628751] Call trace:<br>
        &gt; [ &nbsp; &nbsp;6.628994] &nbsp;setup_hw_slot+0x24/0x60 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.629404] &nbsp;setup_slot+0x34/0xf0 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.629790] &nbsp;qxl_device_init+0x6f0/0x7f0 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.630235] &nbsp;qxl_pci_probe+0xdc/0x1d0 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.630654] &nbsp;local_pci_probe+0x48/0xb8<br>
        &gt; [ &nbsp; &nbsp;6.631027] &nbsp;pci_device_probe+0x194/0x208<br>
        &gt; [ &nbsp; &nbsp;6.631464] &nbsp;really_probe+0xd0/0x458<br>
        &gt; [ &nbsp; &nbsp;6.631818] &nbsp;__driver_probe_device+0x124/0x1c0<br>
        &gt; [ &nbsp; &nbsp;6.632256] &nbsp;driver_probe_device+0x48/0x130<br>
        &gt; [ &nbsp; &nbsp;6.632669] &nbsp;__driver_attach+0xc4/0x1a8<br>
        &gt; [ &nbsp; &nbsp;6.633049] &nbsp;bus_for_each_dev+0x78/0xd0<br>
        &gt; [ &nbsp; &nbsp;6.633437] &nbsp;driver_attach+0x2c/0x38<br>
        &gt; [ &nbsp; &nbsp;6.633789] &nbsp;bus_add_driver+0x154/0x248<br>
        &gt; [ &nbsp; &nbsp;6.634168] &nbsp;driver_register+0x6c/0x128<br>
        &gt; [ &nbsp; &nbsp;6.635205] &nbsp;__pci_register_driver+0x4c/0x58<br>
        &gt; [ &nbsp; &nbsp;6.635628] &nbsp;qxl_init+0x48/0x1000 [qxl]<br>
        &gt; [ &nbsp; &nbsp;6.636013] &nbsp;do_one_initcall+0x50/0x240<br>
        &gt; [ &nbsp; &nbsp;6.636390] &nbsp;do_init_module+0x60/0x238<br>
        &gt; [ &nbsp; &nbsp;6.636768] &nbsp;load_module+0x2458/0x2900<br>
        &gt; [ &nbsp; &nbsp;6.637136] &nbsp;__do_sys_finit_module+0xbc/0x128<br>
        &gt; [ &nbsp; &nbsp;6.637561] &nbsp;__arm64_sys_finit_module+0x28/0x38<br>
        &gt; [ &nbsp; &nbsp;6.638004] &nbsp;invoke_syscall+0x74/0xf0<br>
        &gt; [ &nbsp; &nbsp;6.638366] &nbsp;el0_svc_common.constprop.0+0x58/0x1a8<br>
        &gt; [ &nbsp; &nbsp;6.638836] &nbsp;do_el0_svc+0x2c/0x90<br>
        &gt; [ &nbsp; &nbsp;6.639216] &nbsp;el0_svc+0x40/0x190<br>
        &gt; [ &nbsp; &nbsp;6.639526] &nbsp;el0t_64_sync_handler+0xb0/0xb8<br>
        &gt; [ &nbsp; &nbsp;6.639934] &nbsp;el0t_64_sync+0x1a4/0x1a8<br>
        &gt; [ &nbsp; &nbsp;6.640294] Code: 910003fd f9484804 f9400c23 8b050084
        (f809c083)<br>
        &gt; [ &nbsp; &nbsp;6.640889] ---[ end trace 95615d89b7c87f95 ]---<br>
        &gt;<br>
        &gt; Signed-off-by: Cong Liu<liucong2@kylinos.cn><br>
          &gt; ---<br>
          &gt; &nbsp; drivers/gpu/drm/qxl/qxl_kms.c | 10 ++++++++++<br>
          &gt; &nbsp; 1 file changed, 10 insertions(+)<br>
          &gt;<br>
          &gt; diff --git a/drivers/gpu/drm/qxl/qxl_kms.c
          b/drivers/gpu/drm/qxl/qxl_kms.c<br>
          &gt; index 4dc5ad13f12c..0e61ac04d8ad 100644<br>
          &gt; --- a/drivers/gpu/drm/qxl/qxl_kms.c<br>
          &gt; +++ b/drivers/gpu/drm/qxl/qxl_kms.c<br>
          &gt; @@ -165,7 +165,11 @@ int qxl_device_init(struct
          qxl_device *qdev,<br>
          &gt; &nbsp; (int)qdev-&gt;surfaceram_size / 1024,<br>
          &gt; &nbsp; (sb == 4) ? &quot;64bit&quot; : &quot;32bit&quot;);<br>
          &gt; &nbsp; <br>
          &gt; +#ifdef CONFIG_ARM64<br>
          &gt; + qdev-&gt;rom = ioremap_cache(qdev-&gt;rom_base,
          qdev-&gt;rom_size);<br>
          &gt; +#else<br>
          &gt; &nbsp; qdev-&gt;rom = ioremap(qdev-&gt;rom_base,
          qdev-&gt;rom_size);<br>
          &gt; +#endif<br>
          &gt; &nbsp; if (!qdev-&gt;rom) {<br>
          &gt; &nbsp; pr_err(&quot;Unable to ioremap ROM\n&quot;);<br>
          &gt; &nbsp; r = -ENOMEM;<br>
          &gt; @@ -183,9 +187,15 @@ int qxl_device_init(struct
          qxl_device *qdev,<br>
          &gt; &nbsp; goto rom_unmap;<br>
          &gt; &nbsp; }<br>
          &gt; &nbsp; <br>
          &gt; +#ifdef CONFIG_ARM64<br>
          &gt; + qdev-&gt;ram_header = ioremap_cache(qdev-&gt;vram_base
          +<br>
          &gt; + &nbsp; qdev-&gt;rom-&gt;ram_header_offset,<br>
          &gt; + &nbsp; sizeof(*qdev-&gt;ram_header));<br>
          &gt; +#else<br>
          &gt; &nbsp; qdev-&gt;ram_header = ioremap(qdev-&gt;vram_base +<br>
          &gt; &nbsp; &nbsp; qdev-&gt;rom-&gt;ram_header_offset,<br>
          &gt; &nbsp; &nbsp; sizeof(*qdev-&gt;ram_header));<br>
          &gt; +#endif<br>
          &gt; &nbsp; if (!qdev-&gt;ram_header) {<br>
          &gt; &nbsp; DRM_ERROR(&quot;Unable to ioremap RAM header\n&quot;);<br>
          &gt; &nbsp; r = -ENOMEM;<br>
          <br>
        </liucong2@kylinos.cn></p>
    </blockquote>
    <br>
  </body>
</html>

--------------JIronl0u3pro0A05G1Xs23vD--
