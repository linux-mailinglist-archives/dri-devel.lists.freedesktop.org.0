Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B64E502D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBB910E010;
	Wed, 23 Mar 2022 10:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7261F10E010;
 Wed, 23 Mar 2022 10:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlC3sDq8uw1zj5caKY/LQCKqrVIGu/6OCMXpjwIBq0wHDBHNUxniIvS6EYMEKde5de7sTOfJFgUd3x5tzxIO94xcTAiGFJEiXeFVV7lgk3DXIN8RY5wXh0mfRalvx8oVX5bbXlBhpKFlGrTBJbOouQxPhLVjx/4hTBmGffd/s1Tg784yrCWkC/JogAaEIlZxqvwfMgbeBf9Bsz3jJTeYlIX9ll3MPojbDraTB9NAainGUpo3chC5pXiO0YunQHbMFgE0+w0Xs+2AmUcGvjwUDviWx+2i/f/1joFb2G6Qzk8+V5U+Q2fFSPmhWbdm/x4Kxk4brAQ9C4NAkMV0ilMrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDalb07HCbF7/o9wbIEJ2yiV2CPGxDakO1c2FAR/tBU=;
 b=cQqKQzd/E2+AuxOHGS36JpbBWfQHGOWAeXKTr4iU4U9iAABb+5Fq69rSM+Aoq3wKgLRO9jMpvxe+0NDIcrE1iKI6Z4bpvOoDpdxHBVnrxhekQz5IMUDiG20pgd5HoxGBq+ffKkQqvJK83wtyi5JDu8TIZwFVGoHJ0sFZrfpa+mhS9tuSJ6lgh0m0GLmWtBMPwqN+mwSxo0OPdjIqEcX8a1z2eZ87jKcuw2pyRX3LfcanIURGf2xd4ekQIgTfc4kIOu6PD6Vz9M1sUhYYxIKVxdfnXUhIPEL+GBD028d70/OZ/p4p3/PJYvb3WcxGeF4EdBk5rcK0WDcIzQqqmN2rIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDalb07HCbF7/o9wbIEJ2yiV2CPGxDakO1c2FAR/tBU=;
 b=V0cfckzmQPV4dIEEkiFDLxT+oo47AudS9cEn4kf8we4RcNvQiSIGZnfTnFUTLDRexsH086GafdIBKFYJfCfe+QLvcuWvjq8bNh/zooBb6ROKRyfwvMlcKA+L3Sxb6yKi0tGy9rPpUIGuuFj8/9qElBjRCeYK+hpgAWPGHPQKTZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR1201MB0272.namprd12.prod.outlook.com (2603:10b6:301:52::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 10:17:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 10:17:31 +0000
Content-Type: multipart/alternative;
 boundary="------------308dHuU80vCo6m8JEF31XTBr"
Message-ID: <e12cbb24-e261-f81f-953e-8ad65aee2d1f@amd.com>
Date: Wed, 23 Mar 2022 11:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IFtQQVRDSCB2MSAxLzJd?=
 =?UTF-8?Q?_drm/qxl=3a_replace_ioremap_by_ioremap=5fcache_on_arm64?=
Content-Language: en-US
To: liucong2@kylinos.cn, airlied@redhat.com, kraxel@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, ray.huang@amd.com,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <odhwkkfdf7-odj6iduf90@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <odhwkkfdf7-odj6iduf90@nsmail6.0>
X-ClientProxiedBy: AM7PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::33) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe8bc58-c7c3-4ea6-c5ca-08da0cb656ee
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0272:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02726024066827EC8A6F89D283189@MWHPR1201MB0272.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbViWbLKTVF51MRpB4fObA13s/QVM+GzClcYo/kHZenZDRfz3yUAXYLfi8D9q+u0SbJXyHmOo9qdVmD9a//jUbBlPQ5Szm2Ll+Lri9rAtSskJYS3shEV4rjbrAcK8ms4DjmFEN2jKyBb1aR8Fx/1CkpRB9/Bro6zVkNJtIajWgPXRTYpch+82L28gDLQl84zuZpWsM1Mu6FuS+yQmVo6JG1HAJwrS1Ixya3pRLaJJI21rKQcXco/ikZgrk2HPHlRNsJc94IOhgRZneRrnegsiJ488CGpnUhTCYmxq3cwMeo6nDzTqILEEVcvS11tqWYlrKjvmf8O3J7KBnDWeJzHY4FDIqo5MBsdVAxakHoggJiSIkoPZB6LuqA6Nm3hEJKhoEk9AezOdq0dpV8rnKhInkmJcChWntPBA25THgZUgCo1sXjn5lpTo/ip0PHRnzTDtHaqAzTbw0sA8RHL8ndgUIweovoQdd3OYFAps/TEa70gjcn0fFYFGbUeJJ37iCseNRv09H5/CVHjkLwlsg6iTH/9V4caEfR7bZdfPggXApJktfvGPZIBOFKsEWN+sstu1roHdYoO6iLCMFIGuT9neGwy9sE+NJ2uov8qQqkK5sfIzaUAiEaJ6us+yGFAUPRZV3k5vBgVPBHwoWNYMuhJOg+9EOSJHh5k+O0TlTlTttSfNd6UIEqxwOnx4J2Xq06d8OnYLBzff1DwnaxwXx/44060Kx1hPlaWStTCJ3EuNjdi9/mDg668g2O+qeGKkXsM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(30864003)(31696002)(508600001)(316002)(31686004)(8936002)(36756003)(5660300002)(38100700002)(66946007)(66556008)(66476007)(224303003)(2906002)(86362001)(83380400001)(6486002)(66574015)(2616005)(33964004)(6512007)(6506007)(6666004)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjNqc2w4eVpsMVVoL1Z5TFhPVmM5bXFVU1Y3U1VzTUt4STByK09qSUJOTmNI?=
 =?utf-8?B?bzM3ajRzN1puUTdLbEhzbGZRR2YrN0ZoTmU5cTVaelRKNFU2cTZyci9SMUly?=
 =?utf-8?B?MHFtVG5kU2d2NUt3MEhtOXFqWmt5aEZJdnJ4am5DZ1pneGpzazNnWVJsdW1W?=
 =?utf-8?B?WDdZZ0xzRkdRK0N0SVN0MW5HNG5CZTlobWZadGNWckNpUVZrckd0cFgxQ1ZV?=
 =?utf-8?B?WjJCVkZnK1JYc1FvL05UdWVTdDY4Uzk3SHRBTmpBQ1ZURnFiOWhTbGVYMFdY?=
 =?utf-8?B?SmlOd2tUSmcvZWNlYnQxUi9Scy8rUUthM0JOTmMzMS9SY3ArV3I3aUhPWlZW?=
 =?utf-8?B?dlQrSmIxYUJPb2VvRHFkc1F5NzZOVGV2dDZZeWV6ZkoxV2RwZnVJU0g2V1Bw?=
 =?utf-8?B?UUcrZDFyZXliZDIwMngvWEVNY0FjUFN1eXdjSUFVYTJ6SG85VjdHUVRPMnZE?=
 =?utf-8?B?S3liWlR2NTlFSlZiZmR0SXAySUVsSTBYelFjR3Z6N0ltK2pDcWZBREtnbjZN?=
 =?utf-8?B?WmxaM1A2QmJmcXFMNDlWWTJSeTY3SnAwWjlUL3ZRdWt2cXRMb1NYNTJ5ME5Q?=
 =?utf-8?B?Z1F0SGJmaHVRTFBVVkpwTjB1SFgzSjVMR2NqdHJzTWZ0SnVacHZ3OUp1OVpt?=
 =?utf-8?B?bEg4Y01oc3ZYU0NhZUpTbDkxa2EvWmxsYmdxT0hwd2pFOXpWdEZCZmNXeDhM?=
 =?utf-8?B?ZklpQWZXQ1VaQWNqVXJkMTNEVDdlK2ZFOHA0YUdwYlBscWV1RDc4NjNsNnc1?=
 =?utf-8?B?UkFOeWU1aVJGWHNrT3BkRmRGSm4zWUxUdzNyUFZGZm5uNkZDbjR2aW5IUWw2?=
 =?utf-8?B?OWJUS08xM2FVRnIvbmRrWGEzaWY4MDFLSkJveUpCMGowWU5NQVdROEhwdnlY?=
 =?utf-8?B?ekw0S25SMEpCU2phcFc1eUFieHF2T2EydmtPVDVhWDQrOU1WeW9nbkhNalBK?=
 =?utf-8?B?R1pSdTNqL1owQTUxRFRheDVzTlhZa3ViSmZ0aTRkMCtnK0dnMkFNNlZsUFJP?=
 =?utf-8?B?dVZSM3UrSERjVEhYUDZDUXJ6bHBUQXErenc0R1VSZW5HR3ZreWpXOXU0amRj?=
 =?utf-8?B?ZU1rRWpyTE1WbGp1VmkzNW4xcGdBMk1aTE1JY1FudGowMU0vZzVLNWtaSVh2?=
 =?utf-8?B?U3Vwd09iYW12RlR4QlhXZUozNlBrL2ppZmhMa2ZHcnJuUG9nQ0VsR0VoK29h?=
 =?utf-8?B?YWIrdllRS21JVEE5VUpieWxMZHZUTUhybTZjSm1vb29QM0RYNmVscDFrQnJP?=
 =?utf-8?B?SzBRRFd5SmI4QzVTZHhYdW11Nm94LzRoUVJCbjZEdXg3U3dKSldmQmszOFZQ?=
 =?utf-8?B?bkV6d2JhZklVK1VRSlE3ZWFFNXpVcmx3TDFnbnY3aGRxOGVRNXFQMnZDSEdY?=
 =?utf-8?B?QytkSC9IaFdMcEhjeVpTLzhiNFZPamdLQmZ4eDkya1FucVZHZDZhcVZGNzds?=
 =?utf-8?B?OVl0SmJEZlVBTzBKcGRKc2RsZWMvaGJEY2Vsb1VWMXRyOVgyRDNRMEJoNkdy?=
 =?utf-8?B?cFEzNllNQ3ZoQ3RBMVVrWkQ2WEFQNXhXMnNlL05iRkZYQmUwSXM0MzArKzN6?=
 =?utf-8?B?RTh0aFNiektqNnI1MjBlV1V5ZVVRMmV1UjJSNlNkUVJDNkd2N0FkVGFITXcz?=
 =?utf-8?B?NGJIR243YzVON3hVQ1hCLzZ1T0pTWlVaVWVCa2VKZVpIQXJsNEsvR1lWWWdN?=
 =?utf-8?B?QUt4TnNjUHVzamlhQjV4YUhrcGxOWExoT3FPK2lQOU1NVzVKWmQxYmphOFVP?=
 =?utf-8?B?czFJVnR1b3VWaXlaMXJYdEQxSWttNmhvSWNlU01HNmZvUGdXcHZIMHNHTEF6?=
 =?utf-8?B?VnZMZkFYZXM5RzFQeitBbEdrZHl6THVZd2hpZE5COEgrMVdTYTJVOEVQOVdm?=
 =?utf-8?B?N0llNnFkWnBQL2tsYlZYQjNtekJic1NSWXJQaTh2eTZ4cVJDUEdORXEvUUkw?=
 =?utf-8?Q?ufKeRDXocOUV5eSl4ImcdtVcV0qL+jhb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe8bc58-c7c3-4ea6-c5ca-08da0cb656ee
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 10:17:31.0916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCgZutpxcywM4ar0cHSH48SFE7Ixl8upDIKx8l3R+F8C7A+vPnd7t9ItSO1VJdcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0272
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

--------------308dHuU80vCo6m8JEF31XTBr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cong,

yes I've seen that, but that is still not sufficient.

You need to update the check in ttm_module.c as well or otherwise your 
userspace mapping might not work correctly either.

Regards,
Christian.

Am 23.03.22 um 11:00 schrieb liucong2@kylinos.cn:
>
> Hi Christian,
>
>
> another commit fix the case in ttm. I send two patches at the same 
> time, but seems I miss
>
>  '--cover-letter' when run format-patch or some other bad operation.
>
> ----
>
>
> Regards,
>
> Cong.
>
>
>
>
> *主　题：*Re: 回复: Re: [PATCH v1 1/2] drm/qxl: replace ioremap by 
> ioremap_cache on arm64
> *日　期：*2022-03-23 17:34
> *发件人：*Christian König
> *收件人：*liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org 
>
>
> Hi Cong,
>
>    well than Dave must decide what to do here.
>
>    When QXL emulates a device it should also not use memory accesses   
>  which won't work on a physical device.
>
>    BTW: Your patch is really buggy, it misses the cases in ttm_module.c
>
>    Regards,
>    Christian.
>
> Am 23.03.22 um 09:48 schrieb liucong2@kylinos.cn:
>>
>> Hi Christian,
>>
>>
>> according to 'Arm Architecture Reference Manual Armv8,for        Armv8-A
>>
>> architecture profile' pdf E2.6.5
>>
>>
>> E2.6.5 Generation of Alignment faults by load/store multiple       
>>  accesses to
>>
>>  Device memory
>>
>>
>> When FEAT_LSMAOC is        implemented and the value of the 
>> applicable nTLSMD
>>
>> field is 0, any memory        access by an AArch32 Load Multiple or 
>> Store
>>
>> Multiple instruction to        an address that the stage 1 translation
>>
>> assigns as Device-nGRE,        Device-nGnRE, or Device-nGnRnE generates
>>
>> an Alignment fault.
>>
>>
>> so it seems not just some ARM boards doesn't allow unaligned       
>>  access to MMIO
>>
>> space, all pci memory mapped as Device-nGnRE in arm64 cannot       
>>  support
>>
>> unaligned access. and qxl is a device simulated by qemu, it       
>>  should be able to access
>>
>> to MMIO space in a more flexible way(PROT_NORMAL) than the real       
>>  physical
>>
>> graphics card.
>>
>>
>> ----
>>
>>
>>
>> Cong.
>>
>>
>>
>>
>>
>> *主　题：*Re: [PATCH v1 1/2]          drm/qxl: replace ioremap by 
>> ioremap_cache on arm64
>> *日　期：*2022-03-23 15:15
>> *发件人：*Christian König
>> *收件人：*CongLiuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org 
>>
>>
>>
>> Am 22.03.22 um 10:34 schrieb Cong Liu:
>>        > qxl use ioremap to map ram_header and rom, in the arm64     
>>    implementation,
>>        > the device is mapped as DEVICE_nGnRE, it can not support     
>>    unaligned
>>        > access.
>>
>>        Well that some ARM boards doesn't allow unaligned access to 
>> MMIO        space
>>        is a well known bug of those ARM boards.
>>
>>        So as far as I know this is a hardware bug you are trying to   
>>      workaround
>>        here and I'm not 100% sure that this is correct.
>>
>>        Christian.
>>
>>        >
>>        >    6.620515] pc : setup_hw_slot+0x24/0x60 [qxl]
>>        > [    6.620961] lr : setup_slot+0x34/0xf0 [qxl]
>>        > [    6.621376] sp : ffff800012b73760
>>        > [    6.621701] x29: ffff800012b73760 x28: 0000000000000001   
>>      x27: 0000000010000000
>>        > [    6.622400] x26: 0000000000000001 x25: 0000000004000000   
>>      x24: ffffcf376848c000
>>        > [    6.623099] x23: ffff0000c4087400 x22: ffffcf3718e17140   
>>      x21: 0000000000000000
>>        > [    6.623823] x20: ffff0000c4086000 x19: ffff0000c40870b0   
>>      x18: 0000000000000014
>>        > [    6.624519] x17: 000000004d3605ab x16: 00000000bb3b6129   
>>      x15: 000000006e771809
>>        > [    6.625214] x14: 0000000000000001 x13: 007473696c5f7974   
>>      x12: 696e696666615f65
>>        > [    6.625909] x11: 00000000d543656a x10: 0000000000000000   
>>      x9 : ffffcf3718e085a4
>>        > [    6.626616] x8 : 00000000006c7871 x7 : 000000000000000a   
>>      x6 : 0000000000000017
>>        > [    6.627343] x5 : 0000000000001400 x4 : ffff800011f63400   
>>      x3 : 0000000014000000
>>        > [    6.628047] x2 : 0000000000000000 x1 : ffff0000c40870b0   
>>      x0 : ffff0000c4086000
>>        > [    6.628751] Call trace:
>>        > [    6.628994]  setup_hw_slot+0x24/0x60 [qxl]
>>        > [    6.629404]  setup_slot+0x34/0xf0 [qxl]
>>        > [    6.629790]  qxl_device_init+0x6f0/0x7f0 [qxl]
>>        > [    6.630235]  qxl_pci_probe+0xdc/0x1d0 [qxl]
>>        > [    6.630654]  local_pci_probe+0x48/0xb8
>>        > [    6.631027]  pci_device_probe+0x194/0x208
>>        > [    6.631464]  really_probe+0xd0/0x458
>>        > [    6.631818]  __driver_probe_device+0x124/0x1c0
>>        > [    6.632256]  driver_probe_device+0x48/0x130
>>        > [    6.632669]  __driver_attach+0xc4/0x1a8
>>        > [    6.633049]  bus_for_each_dev+0x78/0xd0
>>        > [    6.633437]  driver_attach+0x2c/0x38
>>        > [    6.633789]  bus_add_driver+0x154/0x248
>>        > [    6.634168]  driver_register+0x6c/0x128
>>        > [    6.635205]  __pci_register_driver+0x4c/0x58
>>        > [    6.635628]  qxl_init+0x48/0x1000 [qxl]
>>        > [    6.636013]  do_one_initcall+0x50/0x240
>>        > [    6.636390]  do_init_module+0x60/0x238
>>        > [    6.636768]  load_module+0x2458/0x2900
>>        > [    6.637136]  __do_sys_finit_module+0xbc/0x128
>>        > [    6.637561]  __arm64_sys_finit_module+0x28/0x38
>>        > [    6.638004]  invoke_syscall+0x74/0xf0
>>        > [    6.638366]  el0_svc_common.constprop.0+0x58/0x1a8
>>        > [    6.638836]  do_el0_svc+0x2c/0x90
>>        > [    6.639216]  el0_svc+0x40/0x190
>>        > [    6.639526]  el0t_64_sync_handler+0xb0/0xb8
>>        > [    6.639934]  el0t_64_sync+0x1a4/0x1a8
>>        > [    6.640294] Code: 910003fd f9484804 f9400c23 8b050084     
>>    (f809c083)
>>        > [    6.640889] ---[ end trace 95615d89b7c87f95 ]---
>>        >
>>        > Signed-off-by: Cong Liu
>>          > ---
>>          >   drivers/gpu/drm/qxl/qxl_kms.c | 10 ++++++++++
>>          >   1 file changed, 10 insertions(+)
>>          >
>>          > diff --git a/drivers/gpu/drm/qxl/qxl_kms.c 
>>  b/drivers/gpu/drm/qxl/qxl_kms.c
>>          > index 4dc5ad13f12c..0e61ac04d8ad 100644
>>          > --- a/drivers/gpu/drm/qxl/qxl_kms.c
>>          > +++ b/drivers/gpu/drm/qxl/qxl_kms.c
>>          > @@ -165,7 +165,11 @@ int qxl_device_init(struct         
>>  qxl_device *qdev,
>>          >   (int)qdev->surfaceram_size / 1024,
>>          >   (sb == 4) ? "64bit" : "32bit");
>>          >
>>          > +#ifdef CONFIG_ARM64
>>          > + qdev->rom = ioremap_cache(qdev->rom_base,  qdev->rom_size);
>>          > +#else
>>          >   qdev->rom = ioremap(qdev->rom_base,  qdev->rom_size);
>>          > +#endif
>>          >   if (!qdev->rom) {
>>          >   pr_err("Unable to ioremap ROM\n");
>>          >   r = -ENOMEM;
>>          > @@ -183,9 +187,15 @@ int qxl_device_init(struct         
>>  qxl_device *qdev,
>>          >   goto rom_unmap;
>>          >   }
>>          >
>>          > +#ifdef CONFIG_ARM64
>>          > + qdev->ram_header = ioremap_cache(qdev->vram_base          +
>>          > + qdev->rom->ram_header_offset,
>>          > +   sizeof(*qdev->ram_header));
>>          > +#else
>>          >   qdev->ram_header = ioremap(qdev->vram_base +
>>          > qdev->rom->ram_header_offset,
>>          >     sizeof(*qdev->ram_header));
>>          > +#endif
>>          >   if (!qdev->ram_header) {
>>          >   DRM_ERROR("Unable to ioremap RAM header\n");
>>          >   r = -ENOMEM;
>>
>

--------------308dHuU80vCo6m8JEF31XTBr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Cong,<br>
    <br>
    yes I've seen that, but that is still not sufficient.<br>
    <br>
    You need to update the check in ttm_module.c as well or otherwise
    your userspace mapping might not work correctly either.<br>
    <br>
    Regards,<br>
    Christian. <br>
    <br>
    <div class="moz-cite-prefix">Am 23.03.22 um 11:00 schrieb
      <a class="moz-txt-link-abbreviated" href="mailto:liucong2@kylinos.cn">liucong2@kylinos.cn</a>:<br>
    </div>
    <blockquote type="cite" cite="mid:odhwkkfdf7-odj6iduf90@nsmail6.0">
      
      &nbsp; &nbsp;<br>
      <p>Hi&nbsp;<span style="background-color: rgb(245, 247, 250);">Christian,</span></p>
      <p><br>
      </p>
      <p>another commit fix the case in ttm. I send two patches at the
        same time, but seems I miss</p>
      <p>&nbsp;'--cover-letter' when run format-patch or some other bad
        operation.</p>
      <p>----</p>
      <div id="cs2c_mail_sigature">
        <p><br>
        </p>
        <p>Regards,</p>
        <p>Cong.</p>
      </div>
      <div id="re" style="margin-left:0.5em;padding-left:0.5em;border-left:1px
        solid green;"><br>
        <br>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;
        <div style="background-color:#f5f7fa"><b>主　题：</b><span id="subject">Re: 回复: Re: [PATCH v1 1/2] drm/qxl: replace
            ioremap by ioremap_cache on arm64</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          <b>日　期：</b><span id="date">2022-03-23 17:34</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          <b>发件人：</b><span id="from">Christian König</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          <b>收件人：</b><span id="to"><a class="moz-txt-link-abbreviated" href="mailto:liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org">liucong2@kylinos.cnairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org</a></span>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;
        <div id="content">
          <div class="viewer_part">
            <div>Hi Cong,<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;well than Dave must decide what to do here.<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;When QXL emulates a device it should also not use
              memory accesses &nbsp; &nbsp;which won't work on a physical device.<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;BTW: Your patch is really buggy, it misses the cases in
              ttm_module.c<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;Regards,<br>
              &nbsp; &nbsp;Christian.<br>
              &nbsp; &nbsp;<br>
              &nbsp; &nbsp;
              <div class="moz-cite-prefix">Am 23.03.22 um 09:48 schrieb
                &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-abbreviated
                  moz-txt-link-freetext" href="mailto:liucong2@kylinos.cn" moz-do-not-send="true">liucong2@kylinos.cn</a>:<br>
                &nbsp; &nbsp;</div>
              <blockquote type="cite" cite="mid:18a8ijpwp6j-18a9shjbr0c@nsmail6.0">
                <p>Hi Christian,</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p>according to 'Arm Architecture Reference Manual
                  Armv8,for &nbsp; &nbsp; &nbsp; &nbsp;Armv8-A</p>
                <p>architecture profile' pdf E2.6.5</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p>E2.6.5 Generation of Alignment faults by load/store
                  multiple &nbsp; &nbsp; &nbsp; &nbsp;accesses to</p>
                <p>&nbsp;Device memory</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p><span style="white-space:pre">	</span>When
                  FEAT_LSMAOC is &nbsp; &nbsp; &nbsp; &nbsp;implemented and the value of the
                  applicable nTLSMD</p>
                <p><span style="white-space:pre">	</span>field is 0, any
                  memory &nbsp; &nbsp; &nbsp; &nbsp;access by an AArch32 Load Multiple or
                  Store&nbsp;</p>
                <p><span style="white-space:pre">	</span>Multiple
                  instruction to &nbsp; &nbsp; &nbsp; &nbsp;an address that the stage 1
                  translation&nbsp;</p>
                <p><span style="white-space:pre">	</span>assigns as
                  Device-nGRE, &nbsp; &nbsp; &nbsp; &nbsp;Device-nGnRE, or Device-nGnRnE
                  generates&nbsp;</p>
                <p><span style="white-space: pre;">	</span>an Alignment
                  fault.</p>
                <br>
                &nbsp; &nbsp; &nbsp;
                <p>so it seems not just&nbsp;some ARM boards doesn't allow
                  unaligned &nbsp; &nbsp; &nbsp; &nbsp;access to MMIO&nbsp;</p>
                <p>space, all pci memory mapped as&nbsp;Device-nGnRE in arm64
                  cannot &nbsp; &nbsp; &nbsp; &nbsp;support</p>
                <p>unaligned access. and qxl is a device&nbsp;simulated by
                  qemu, it &nbsp; &nbsp; &nbsp; &nbsp;should be able to access&nbsp;</p>
                <p>to MMIO space in a more flexible way(PROT_NORMAL)
                  than the real &nbsp; &nbsp; &nbsp; &nbsp;physical&nbsp;</p>
                <p>graphics card.</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p>----</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p>Cong.<br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp;</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
                <p><strong>主　题：</strong><span id="subject">Re: [PATCH v1
                    1/2] &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drm/qxl: replace ioremap by
                    ioremap_cache on arm64</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<strong>日　期：</strong><span id="date">2022-03-23
                    15:15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<strong>发件人：</strong><span id="from">Christian
                    König</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<strong>收件人：</strong><span id="to">Cong<a class="moz-txt-link-abbreviated
                      moz-txt-link-freetext" href="mailto:Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org" moz-do-not-send="true">Liuairlied@redhat.comkraxel@redhat.comairlied@linux.iedaniel@ffwll.chray.huang@amd.comvirtualization@lists.linux-foundation.orgspice-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org</a></span>
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
                <p><br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
                <p>Am 22.03.22 um 10:34 schrieb Cong Liu:<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; qxl use ioremap to map ram_header and rom,
                  in the arm64 &nbsp; &nbsp; &nbsp; &nbsp;implementation,<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; the device is mapped as DEVICE_nGnRE, it
                  can not support &nbsp; &nbsp; &nbsp; &nbsp;unaligned<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; access.<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;Well that some ARM boards doesn't allow
                  unaligned access to MMIO &nbsp; &nbsp; &nbsp; &nbsp;space <br>
                  &nbsp; &nbsp; &nbsp; &nbsp;is a well known bug of those ARM boards.<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;So as far as I know this is a hardware bug you
                  are trying to &nbsp; &nbsp; &nbsp; &nbsp;workaround <br>
                  &nbsp; &nbsp; &nbsp; &nbsp;here and I'm not 100% sure that this is
                  correct.<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;Christian.<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp;6.620515] pc : setup_hw_slot+0x24/0x60
                  [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.620961] lr : setup_slot+0x34/0xf0
                  [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.621376] sp : ffff800012b73760<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.621701] x29: ffff800012b73760 x28:
                  0000000000000001 &nbsp; &nbsp; &nbsp; &nbsp;x27: 0000000010000000<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.622400] x26: 0000000000000001 x25:
                  0000000004000000 &nbsp; &nbsp; &nbsp; &nbsp;x24: ffffcf376848c000<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.623099] x23: ffff0000c4087400 x22:
                  ffffcf3718e17140 &nbsp; &nbsp; &nbsp; &nbsp;x21: 0000000000000000<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.623823] x20: ffff0000c4086000 x19:
                  ffff0000c40870b0 &nbsp; &nbsp; &nbsp; &nbsp;x18: 0000000000000014<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.624519] x17: 000000004d3605ab x16:
                  00000000bb3b6129 &nbsp; &nbsp; &nbsp; &nbsp;x15: 000000006e771809<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.625214] x14: 0000000000000001 x13:
                  007473696c5f7974 &nbsp; &nbsp; &nbsp; &nbsp;x12: 696e696666615f65<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.625909] x11: 00000000d543656a x10:
                  0000000000000000 &nbsp; &nbsp; &nbsp; &nbsp;x9 : ffffcf3718e085a4<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.626616] x8 : 00000000006c7871 x7 :
                  000000000000000a &nbsp; &nbsp; &nbsp; &nbsp;x6 : 0000000000000017<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.627343] x5 : 0000000000001400 x4 :
                  ffff800011f63400 &nbsp; &nbsp; &nbsp; &nbsp;x3 : 0000000014000000<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.628047] x2 : 0000000000000000 x1 :
                  ffff0000c40870b0 &nbsp; &nbsp; &nbsp; &nbsp;x0 : ffff0000c4086000<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.628751] Call trace:<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.628994] &nbsp;setup_hw_slot+0x24/0x60
                  [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.629404] &nbsp;setup_slot+0x34/0xf0 [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.629790]
                  &nbsp;qxl_device_init+0x6f0/0x7f0 [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.630235] &nbsp;qxl_pci_probe+0xdc/0x1d0
                  [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.630654] &nbsp;local_pci_probe+0x48/0xb8<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.631027]
                  &nbsp;pci_device_probe+0x194/0x208<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.631464] &nbsp;really_probe+0xd0/0x458<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.631818]
                  &nbsp;__driver_probe_device+0x124/0x1c0<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.632256]
                  &nbsp;driver_probe_device+0x48/0x130<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.632669] &nbsp;__driver_attach+0xc4/0x1a8<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.633049] &nbsp;bus_for_each_dev+0x78/0xd0<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.633437] &nbsp;driver_attach+0x2c/0x38<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.633789] &nbsp;bus_add_driver+0x154/0x248<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.634168] &nbsp;driver_register+0x6c/0x128<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.635205]
                  &nbsp;__pci_register_driver+0x4c/0x58<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.635628] &nbsp;qxl_init+0x48/0x1000 [qxl]<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.636013] &nbsp;do_one_initcall+0x50/0x240<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.636390] &nbsp;do_init_module+0x60/0x238<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.636768] &nbsp;load_module+0x2458/0x2900<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.637136]
                  &nbsp;__do_sys_finit_module+0xbc/0x128<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.637561]
                  &nbsp;__arm64_sys_finit_module+0x28/0x38<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.638004] &nbsp;invoke_syscall+0x74/0xf0<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.638366]
                  &nbsp;el0_svc_common.constprop.0+0x58/0x1a8<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.638836] &nbsp;do_el0_svc+0x2c/0x90<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.639216] &nbsp;el0_svc+0x40/0x190<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.639526]
                  &nbsp;el0t_64_sync_handler+0xb0/0xb8<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.639934] &nbsp;el0t_64_sync+0x1a4/0x1a8<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.640294] Code: 910003fd f9484804
                  f9400c23 8b050084 &nbsp; &nbsp; &nbsp; &nbsp;(f809c083)<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; [ &nbsp; &nbsp;6.640889] ---[ end trace
                  95615d89b7c87f95 ]---<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
                  &nbsp; &nbsp; &nbsp; &nbsp;&gt; Signed-off-by: Cong Liu<liucong2@kylinos.cn><br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; ---<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; drivers/gpu/drm/qxl/qxl_kms.c | 10
                    ++++++++++<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; 1 file changed, 10 insertions(+)<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; diff --git
                    a/drivers/gpu/drm/qxl/qxl_kms.c &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;b/drivers/gpu/drm/qxl/qxl_kms.c<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; index 4dc5ad13f12c..0e61ac04d8ad
                    100644<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; --- a/drivers/gpu/drm/qxl/qxl_kms.c<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +++ b/drivers/gpu/drm/qxl/qxl_kms.c<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -165,7 +165,11 @@ int
                    qxl_device_init(struct &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl_device *qdev,<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; (int)qdev-&gt;surfaceram_size /
                    1024,<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; (sb == 4) ? &quot;64bit&quot; : &quot;32bit&quot;);<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#ifdef CONFIG_ARM64<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + qdev-&gt;rom =
                    ioremap_cache(qdev-&gt;rom_base, &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;qdev-&gt;rom_size);<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#else<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; qdev-&gt;rom =
                    ioremap(qdev-&gt;rom_base, &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;qdev-&gt;rom_size);<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#endif<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; if (!qdev-&gt;rom) {<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; pr_err(&quot;Unable to ioremap ROM\n&quot;);<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; r = -ENOMEM;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -183,9 +187,15 @@ int
                    qxl_device_init(struct &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qxl_device *qdev,<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; goto rom_unmap;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; }<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#ifdef CONFIG_ARM64<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + qdev-&gt;ram_header =
                    ioremap_cache(qdev-&gt;vram_base &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;+<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp;
                    qdev-&gt;rom-&gt;ram_header_offset,<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; sizeof(*qdev-&gt;ram_header));<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#else<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; qdev-&gt;ram_header =
                    ioremap(qdev-&gt;vram_base +<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp;
                    qdev-&gt;rom-&gt;ram_header_offset,<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; sizeof(*qdev-&gt;ram_header));<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +#endif<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; if (!qdev-&gt;ram_header) {<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; DRM_ERROR(&quot;Unable to ioremap RAM
                    header\n&quot;);<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; r = -ENOMEM;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
                    &nbsp; &nbsp; &nbsp; &nbsp;</liucong2@kylinos.cn></p>
              </blockquote>
              <br>
              &nbsp;</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------308dHuU80vCo6m8JEF31XTBr--
