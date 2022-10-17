Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36204600714
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 08:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB5510E360;
	Mon, 17 Oct 2022 06:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528E210E360
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 06:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCqLit54d27SXIVTH/cl1ztYHAEF32syyYw2X9eiLXYJh1s8J6PlRdx2AsdRv1gboVTzP4IGZYraSm9M+RlfaCuIVd4oHil1CW1DsFTIFgrGIoiR7tzPJKGmTsEmTtTD4n6Hrpr4cA8nc8Bf9sa+S+LKyIiDbYtv1127mvNBBZ6H3AexXMOmQg1iVrwYbxAPRJCK8bPqG6MLXVhdAuXYwuN8KRTS9kKPGwu/+as2/bs1N6rHRhz5Srnn5GrWdqgNMo/ccWttJFifncCbKl6KTvsfPRH2+cdreaFi8Ag+Q70uyWvKcSzt8kgyL7ZoIFfdA+9JgySQ8pg34m/Pc9Ww/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17oR9ElJHCjYucX507l5LWYDZr1bYHsrk84j6EVMQEY=;
 b=AGw+XmjtH65j/7RoCjqgVEG8qLJ7WyIjNH4pVMNJ32YssCa5Gk6CEDE+kKJRAr0sFymy0GJh4yTAUwXLfFP1fSW6t/+vuGKKKomgKqV7D9m1tkxSa7UD0c7pNqpSFQcEGs6RSPm/mb6JdqkI/NgPsvuUu1nsOeKfIo/tDk2fGZEiBYdBNKvmKKhkNeOp0Va5Cpo8LEezA4o3OHjf0acP01C0fvT918n5bbpV69tORI/Wt8W3WfdkPQUgQf9xrnEwzWR7LeHjk0SWKdXnuNkfuvHHfxsxN6lvq4e1bnKc3ci4ZBdQKvF82N0vfSKdUjiZ1oWxne2Kp9sfeigojl/6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17oR9ElJHCjYucX507l5LWYDZr1bYHsrk84j6EVMQEY=;
 b=bY8HQD7V/3RVJgv1mTKe/rxdm/5msbetRiF7CuiF5nth3darj3SpTe0vlawDZo0dmKN92IyVO4+UUzMI31K+vhO2H+9XfVoW6wXnMx+9Y58MUTlgTbOhAgnJd++q5ItawJ7tO/Z/zsyC8KRpRXZNgiMOmbJ+zk2tcvSh/6PqUC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 06:54:51 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::597:967e:d8b8:8fb9]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::597:967e:d8b8:8fb9%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 06:54:51 +0000
Message-ID: <f0110d36-a9c2-c1b9-b193-32da4f98a975@amd.com>
Date: Mon, 17 Oct 2022 12:24:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [git pull] drm fixes for 6.1-rc1
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arthur Marsh <arthur.marsh@internode.on.net>, Dave Airlie
 <airlied@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
 <20221016080833.5503-1-user@am64>
 <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
 <C98B32CF-86B0-438D-BC8D-10FA255B3B4F@internode.on.net>
 <7c645fa8-bf29-4b30-bdc5-e61e6bb09927@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <7c645fa8-bf29-4b30-bdc5-e61e6bb09927@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::8) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DM6PR12MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: 66255d3c-3518-48ef-7874-08dab00c7d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: myBt4XFXjvfHTwRIDHlIm9+Ph4SND7yIWbrC7CMybldLf9wPuvirf+qGQNJoTVkcgDiGpUfVZCJ44GYbaBjCueRhoE8qlNGJLRSu5DJeqV1FHbeYIFz1cHJrxdKOVRZRoJl4gluY0/nEnHZrZdsPbvu/L54IIbySg2x5RkulyhWCFfJ/mK1hQNNPrArNIQ2T2ACJfYrFa01wftaGECOGBAWQcXs7U1v8Y6jbaMIZ/3pOPjIEJFGcjSbrFC/yHZP1zmngxVSyLaXnX+94V6ZVgafj7yfBPgN6Hewy09OcW8NuVkKTzOc+yGYtwK4O02yHhMs2nNFSvCU/JtUKBXaG5QPSyxgE4uVRXvWuFQmtNpfCouRmJW+H5ng2G0TrbTKCErfUGDZ7IzPBjbOUISJizQ6TflsoTgYAQSVprZvr0O6M/W7doTkqSEBXGrd1aEHtNibVXuDd7hZPlanRvN6nYcjjFmoWq7EBc0YL3vOEu744o0kodH2BAa41xRTrmPhpJ4xKDo4nYJtl2r0v3q2nz6y7cMQBn3ZEQCpHtQ1GPMYqMvQYLzrMQYbFSn9VJPBwiKSAdP9d9FDqbdAUEkgLanwat2KPIrnigHoQAk0MdgX953pfI1iIgylPgTOmT3tC4tE5jY0dDtbtgLzFAFzXl5R7xZ7J7OAASspMRZIm1nzzWAvebc2Ft6GtJ65bULKN4mOmbEzaGpsd28muMcwG4R1RhGR6t+LPz+YH+U4IQu7bULC1ir/vxrJihxvXcZ/uNOZR6F7NgMaCzhZKvK6P7QhuKDweb9UE/4WXfwNS4p0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(31686004)(45080400002)(6486002)(478600001)(38100700002)(8936002)(6512007)(110136005)(19627235002)(83380400001)(31696002)(316002)(6636002)(6666004)(41300700001)(53546011)(6506007)(36756003)(4326008)(2906002)(186003)(2616005)(26005)(66476007)(66556008)(66946007)(86362001)(8676002)(66574015)(30864003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmIwTmphaWJIOUpoUTU1eUN0a2VQRjFCSEc2aXJRaTRPR3hoUFcyWWQxS1Rj?=
 =?utf-8?B?VEg0WDVuR1A5dkZJV2RpcTQ2ZXlZQ2dLWU1YSG9tdExPMXdsNmpXdVUxUWQ1?=
 =?utf-8?B?bElpUW5CM1pQc0JzZ3AweFYzNGp5amQ5eEh0cUk0YjQ5NzJ6U0hLNlJPeFlZ?=
 =?utf-8?B?WjFvWXlkcUdqYnBMZ0FDR2xzeERIZjUrSk55T0NUVjdKVk53dU01ZktVUExt?=
 =?utf-8?B?QVhIcHJYeXVXUHMyeTlzYWlncGxJU0ZTbFoyTVdxSzBDU3luNDRIMTN6VTNR?=
 =?utf-8?B?dHVJd0huaDBqUVZvdVpaTXhUR2xacnQzamN6VVZWMStBTjdDZW94bks4ZVZz?=
 =?utf-8?B?Y29nZnpFUEpKTGNTcjVRbmNLTXpEalZScnUrSExpMHF3YzY2MkE1TENmMHZj?=
 =?utf-8?B?bFp6SEFsZFlEdE9ac3BnbUdFQThqbER0dzlzaDdxQXhHemYwQUUweVJvalow?=
 =?utf-8?B?UGZ2a1JKYjg0OTJxZmJqR0RQN0xadmI4YzA1UGFUTlI3OS9JT0VzampIVnpJ?=
 =?utf-8?B?ZkpGRyt2WHRPemIxaEFoV0N3Q2pTQ1Q2NCswRnZqVDJWOFAwSDRBdnFVN2dT?=
 =?utf-8?B?YzIzajRzbGhZdzhnSDNoSVJMZXdIUkZSYTlZayszc3ZqRkVJRG5tU3gvMFUy?=
 =?utf-8?B?eDB2REh2UVhxazU1UUg3Z0NldDJJaUNhNWowRFZQTkpiaEFyMGZCWTFrUmZi?=
 =?utf-8?B?cm91VkZ5Ly83OEQ4RmNYWVNFMjdXQVZ1cFpqcVp2M2dadi9YL0gzc1dITUY2?=
 =?utf-8?B?VGY5VkNhMGY4ZFpyN3ZnNXJURFM3dDlqUTgwN3RYMDVyVUJiWXJjQ2NCOXRX?=
 =?utf-8?B?M2phUkIxcy9UNXMyeUlPanp0eE5RS2RLWDFyd3dQdjhXMWF0Wnd1amtRNHNn?=
 =?utf-8?B?a0R0NDNRU3pKZVkyVXZUc1U4UVpOeWFKTUVDclBLQ01ZZ1hPSlZEdmNKQUlB?=
 =?utf-8?B?Q3ZCQXVvL29EdkRaNllKdDlnZmxUSllIMkdLM2JQRklzL1RXT1BudUhpd1dT?=
 =?utf-8?B?akthWHZBTTNVdzdDaUovbUpsNmVPNHRndTkvUlR0QnQvSWpSWDRYeW05eitP?=
 =?utf-8?B?emNrbmxGUFdqeVA0Y25FeWlZaWtQN0VHaVFvQTBWd2pid2NyOGZHV25KcjB3?=
 =?utf-8?B?K09vdmdzM0JkTDkxcldHQ0JYTml0STZEblN5M1ZQWU84VzdleExld1hyb2F1?=
 =?utf-8?B?NVAyNE90TjNLZjVOVmdEWTJQcElxRUozSnVSWDJJQlV2c1RmOXNhVkdxZTNw?=
 =?utf-8?B?MzZzbFowTFZoUkx1SGowaVJJbHdCbG5oQzJadTJpd0RwMEdqRGRTcnVLb3Ri?=
 =?utf-8?B?MUhKaE5IdUN5bkV3emVjZTl6Z01xOGJhcEp0azdwQ3JBYTRiTUQwd05SVkR2?=
 =?utf-8?B?eEZsQzl0ajhQYzJINGNqVEVhNlJacVRSc1k4anZ1K09uZjZ0NWt0dTdRcWQ0?=
 =?utf-8?B?SkpJd21uVlZpeUZoc3RxKyswVDRrOGc0SGFDeS9telp6NlM2ZTFJeUNCTmNX?=
 =?utf-8?B?cFhqR2l0R28zcUNpeDlIR1NwQmJ3UHgzYkJNNVJMMEs5ZVExK01jUFV4L1Bi?=
 =?utf-8?B?bU4rMEJPeVNoOEozRUFIOWpvMTJ2ZU5BRmlkVnlnSFNQbW5XWlNyd3RseXA2?=
 =?utf-8?B?cER2Nmp0TzdnaXgySFdsVkJCVk82WWhRdHlaM0Rsd0J0elNzdG5SRXNhVC9R?=
 =?utf-8?B?V005SzR1MnNpNjdwWUErK2NObk1SNEVrVWprOGh2U3h1OG1XT0h4aVo5ZXFY?=
 =?utf-8?B?SFc2Wm0wdmJ2US8rdVlVTkNVaVRvcWxqTk1xemNTaHdlNmxsK2pKUHRka0Q0?=
 =?utf-8?B?L0R5L2hEN2NxS0ZtcHEzYWRKaWd6b1JyU0NtYjV0MDVVbTI1dlh0dit5TmhD?=
 =?utf-8?B?ZWZZRGFQdjNWdVpteDJjSTFCMW0ya1lZR25CS0g0c3F3K3dRMGVoczhVRzkz?=
 =?utf-8?B?MHFPbnBBMnFjNTd0R2xOQnRINWxjVTYwUXFBRUR3TWlxTDloTGZTTVFYUnN0?=
 =?utf-8?B?ZFM1WUFtVDQzcHRuMkFJb08vZCtqR21XS0JOMExhZ0dyb2hDU2diaFZOZmor?=
 =?utf-8?B?YTJFNFVIV2ZaSTcyek5aZFREMjlPWUdiYnZ3RFIzV1VXeUh3ajc0YTh2Wnhm?=
 =?utf-8?Q?ELT0ofq2IGZd+T9rJHMjYu1CX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66255d3c-3518-48ef-7874-08dab00c7d34
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 06:54:51.4908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEW0+91U2BJd/OiNG7nBhHVdr0CvgHAYrhQh1kn/roONbukCWmi0XwUz5BTicLmTQqzSElVSKb9+RGjYq7rWnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
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
Cc: daniel.vetter@ffwll.ch, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

Is this old radeon card?

Thanks,
Arun

On 10/17/2022 11:50 AM, Christian König wrote:
> Arun please take a look into this ASAP.
>
> Thanks,
> Christian.
>
> Am 17.10.22 um 03:13 schrieb Arthur Marsh:
>> Thanks Dave, I reverted patch 
>> 312b4dc11d4f74bfe03ea25ffe04c1f2fdd13cb9 against 6.1-rc1 and the 
>> resulting kernel loaded amdgpu fine on my pc with Cape Verde GPU.
>>
>> Regards,
>>
>> Arthur.
>>
>> On 17 October 2022 8:14:18 am ACDT, Dave Airlie <airlied@gmail.com> 
>> wrote:
>>> On Sun, 16 Oct 2022 at 18:09, Arthur Marsh
>>> <arthur.marsh@internode.on.net> wrote:
>>>> From: Arthur Marsh <arthur.marsh@internode.on.net>
>>>>
>>>> Hi, the "drm fixes for 6.1-rc1" commit caused the amdgpu module to 
>>>> fail
>>>> with my Cape Verde radeonsi card.
>>>>
>>>> I haven't been able to bisect the problem to an individual commit, but
>>>> attach a dmesg extract below.
>>>>
>>>> I'm happy to supply any other configuration information and test 
>>>> patches.
>>>>
>>> Can you try reverting: it's the only think I can spot that might
>>> affect a card that old since most changes in that request were for
>>> display hw you don't have.
>>>
>>> ommit 312b4dc11d4f74bfe03ea25ffe04c1f2fdd13cb9
>>> Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Date:   Tue Oct 4 07:33:39 2022 -0700
>>>
>>>     drm/amdgpu: Fix VRAM BO swap issue
>>>
>>>     DRM buddy manager allocates the contiguous memory requests in
>>>     a single block or multiple blocks. So for the ttm move operation
>>>     (incase of low vram memory) we should consider all the blocks to
>>>     compute the total memory size which compared with the struct
>>>     ttm_resource num_pages in order to verify that the blocks are
>>>     contiguous for the eviction process.
>>>
>>>     v2: Added a Fixes tag
>>>     v3: Rewrite the code to save a bit of calculations and
>>>         variables (Christian)
>>>
>>>     Fixes: c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>>     Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>>     Reviewed-by: Christian König <christian.koenig@amd.com>
>>>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>>
>>> Thanks,
>>> Dave.
>>>
>>>> Arthur.
>>>>
>>>>   Linux version 6.0.0+ (root@am64) (gcc-12 (Debian 12.2.0-5) 
>>>> 12.2.0, GNU ld (GNU Binutils for Debian) 2.39) #5179 SMP 
>>>> PREEMPT_DYNAMIC Fri Oct 14 17:00:40 ACDT 2022
>>>>   Command line: BOOT_IMAGE=/vmlinuz-6.0.0+ 
>>>> root=UUID=39706f53-7c27-4310-b22a-36c7b042d1a1 ro single 
>>>> amdgpu.audio=1 amdgpu.si_support=1 radeon.si_support=0 
>>>> page_owner=on amdgpu.gpu_recovery=1
>>>> ...
>>>>
>>>>   [drm] amdgpu kernel modesetting enabled.
>>>>   amdgpu 0000:01:00.0: vgaarb: deactivate vga console
>>>>   Console: switching to colour dummy device 80x25
>>>>   [drm] initializing kernel modesetting (VERDE 0x1002:0x682B 
>>>> 0x1458:0x22CA 0x87).
>>>>   [drm] register mmio base: 0xFE8C0000
>>>>   [drm] register mmio size: 262144
>>>>   [drm] add ip block number 0 <si_common>
>>>>   [drm] add ip block number 1 <gmc_v6_0>
>>>>   [drm] add ip block number 2 <si_ih>
>>>>   [drm] add ip block number 3 <gfx_v6_0>
>>>>   [drm] add ip block number 4 <si_dma>
>>>>   [drm] add ip block number 5 <si_dpm>
>>>>   [drm] add ip block number 6 <dce_v6_0>
>>>>   [drm] add ip block number 7 <uvd_v3_1>
>>>>   [drm] BIOS signature incorrect 5b 7
>>>>   resource sanity check: requesting [mem 0x000c0000-0x000dffff], 
>>>> which spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000dffff 
>>>> window]
>>>>   caller pci_map_rom+0x68/0x1b0 mapping multiple BARs
>>>>   amdgpu 0000:01:00.0: No more image in the PCI ROM
>>>>   amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from ROM BAR
>>>>   amdgpu: ATOM BIOS: xxx-xxx-xxx
>>>>   amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) feature 
>>>> not supported
>>>>   amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
>>>>   [drm] PCIE gen 2 link speeds already enabled
>>>>   [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment 
>>>> size is 9-bit
>>>>   RTL8211B Gigabit Ethernet r8169-0-300:00: attached PHY driver 
>>>> (mii_bus:phy_addr=r8169-0-300:00, irq=MAC)
>>>>   r8169 0000:03:00.0 eth0: Link is Down
>>>>   amdgpu 0000:01:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 - 
>>>> 0x000000F47FFFFFFF (2048M used)
>>>>   amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x000000FF00000000 - 
>>>> 0x000000FF3FFFFFFF
>>>>   [drm] Detected VRAM RAM=2048M, BAR=256M
>>>>   [drm] RAM width 128bits DDR3
>>>>   [drm] amdgpu: 2048M of VRAM memory ready
>>>>   [drm] amdgpu: 3979M of GTT memory ready.
>>>>   [drm] GART: num cpu pages 262144, num gpu pages 262144
>>>>   amdgpu 0000:01:00.0: amdgpu: PCIE GART of 1024M enabled (table at 
>>>> 0x000000F400A00000).
>>>>   [drm] Internal thermal controller with fan control
>>>>   [drm] amdgpu: dpm initialized
>>>>   [drm] AMDGPU Display Connectors
>>>>   [drm] Connector 0:
>>>>   [drm]   HDMI-A-1
>>>>   [drm]   HPD1
>>>>   [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e 0x194f 0x194f
>>>>   [drm]   Encoders:
>>>>   [drm]     DFP1: INTERNAL_UNIPHY
>>>>   [drm] Connector 1:
>>>>   [drm]   DVI-D-1
>>>>   [drm]   HPD2
>>>>   [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952 0x1953 0x1953
>>>>   [drm]   Encoders:
>>>>   [drm]     DFP2: INTERNAL_UNIPHY
>>>>   [drm] Connector 2:
>>>>   [drm]   VGA-1
>>>>   [drm]   DDC: 0x1970 0x1970 0x1971 0x1971 0x1972 0x1972 0x1973 0x1973
>>>>   [drm]   Encoders:
>>>>   [drm]     CRT1: INTERNAL_KLDSCP_DAC1
>>>>   [drm] Found UVD firmware Version: 64.0 Family ID: 13
>>>>   amdgpu: Move buffer fallback to memcpy unavailable
>>>>   [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init of IP 
>>>> block <uvd_v3_1> failed -19
>>>>   amdgpu 0000:01:00.0: amdgpu: amdgpu_device_ip_init failed
>>>>   amdgpu 0000:01:00.0: amdgpu: Fatal error during GPU init
>>>>   amdgpu 0000:01:00.0: amdgpu: amdgpu: finishing device.
>>>>   BUG: kernel NULL pointer dereference, address: 0000000000000090
>>>>   #PF: supervisor write access in kernel mode
>>>>   #PF: error_code(0x0002) - not-present page
>>>>   PGD 0 P4D 0
>>>>   Oops: 0002 [#1] PREEMPT SMP NOPTI
>>>>   CPU: 3 PID: 447 Comm: udevd Not tainted 6.0.0+ #5179
>>>>   Hardware name: System manufacturer System Product Name/M3A78 PRO, 
>>>> BIOS 1701    01/27/2011
>>>>   RIP: 0010:drm_sched_fini+0x80/0xa0 [gpu_sched]
>>>>   Code: 76 83 0e c4 c6 85 8c 01 00 00 00 5b 5d 41 5c 41 5d c3 cc cc 
>>>> cc cc 4c 8d 63 f0 4c 89 e7 e8 08 99 8e c4 48 8b 03 48 39 d8 74 0f 
>>>> <c6> 80 90 00 00 00 01 48 8b 00 48 39 d8 75 f1 4c 89 e7 e8 c9 99 8e
>>>>   RSP: 0018:ffffbeb3c06bfbb8 EFLAGS: 00010213
>>>>   RAX: 0000000000000000 RBX: ffff99bae8269a98 RCX: ffff99bab703afc0
>>>>   RDX: 0000000000000001 RSI: ffff99bab703afe8 RDI: 0000000000000000
>>>>   RBP: ffff99bae82699f0 R08: ffffffff85cd0bc2 R09: 0000000000000010
>>>>   R10: 0000000000000035 R11: ffff99bb594806c0 R12: ffff99bae8269a88
>>>>   R13: ffff99bae82699f8 R14: ffff99bae82665e8 R15: 0000000000000000
>>>>   FS:  00007fd81fcd9840(0000) GS:ffff99bb67cc0000(0000) 
>>>> knlGS:0000000000000000
>>>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>   CR2: 0000000000000090 CR3: 0000000111822000 CR4: 00000000000006e0
>>>>   Call Trace:
>>>>    <TASK>
>>>>    amdgpu_fence_driver_sw_fini+0xc2/0xd0 [amdgpu]
>>>>    amdgpu_device_fini_sw+0x17/0x3c0 [amdgpu]
>>>>    amdgpu_driver_release_kms+0x12/0x30 [amdgpu]
>>>>    devm_drm_dev_init_release+0x4a/0x70 [drm]
>>>>    release_nodes+0x40/0xb0
>>>>    devres_release_all+0x89/0xc0
>>>>    device_unbind_cleanup+0xe/0x70
>>>>    really_probe+0x245/0x3a0
>>>>    ? pm_runtime_barrier+0x61/0xb0
>>>>    __driver_probe_device+0x78/0x170
>>>>    driver_probe_device+0x2d/0xb0
>>>>    __driver_attach+0xdc/0x1d0
>>>>    ? __device_attach_driver+0x100/0x100
>>>>    bus_for_each_dev+0x69/0xa0
>>>>    bus_add_driver+0x1d4/0x230
>>>>    ? _raw_spin_unlock+0x15/0x40
>>>>    driver_register+0x89/0xe0
>>>>    ? 0xffffffffc0c3b000
>>>>    do_one_initcall+0x44/0x200
>>>>    ? __kmem_cache_alloc_node+0x90/0x360
>>>>    ? kmalloc_trace+0x38/0xc0
>>>>    do_init_module+0x4a/0x1e0
>>>>    __do_sys_finit_module+0xb5/0x130
>>>>    do_syscall_64+0x3a/0x90
>>>>    entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>>>   RIP: 0033:0x7fd81ff5b1b9
>>>>   Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 48 89 f8 
>>>> 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 
>>>> <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 1c 0d 00 f7 d8 64 89 01 48
>>>>   RSP: 002b:00007ffc5b37cbb8 EFLAGS: 00000246 ORIG_RAX: 
>>>> 0000000000000139
>>>>   RAX: ffffffffffffffda RBX: 000055e5f2f6a140 RCX: 00007fd81ff5b1b9
>>>>   RDX: 0000000000000000 RSI: 000055e5f2f67e30 RDI: 0000000000000017
>>>>   RBP: 000055e5f2f67e30 R08: 0000000000000000 R09: 000055e5f2f46700
>>>>   R10: 0000000000000017 R11: 0000000000000246 R12: 0000000000020000
>>>>   R13: 0000000000000000 R14: 000055e5f2f65b00 R15: 0000000000000024
>>>>    </TASK>
>>>>   Modules linked in: amdgpu(+) snd_emu10k1_synth snd_emux_synth 
>>>> snd_seq_midi_emul snd_seq_virmidi snd_seq_midi snd_seq_midi_event 
>>>> snd_seq wmi_bmof snd_emu10k1 edac_mce_amd gpu_sched drm_buddy video 
>>>> kvm_amd drm_ttm_helper ttm snd_util_mem drm_display_helper 
>>>> snd_ac97_codec ccp drm_kms_helper snd_hda_codec_hdmi rng_core 
>>>> ac97_bus snd_rawmidi snd_hda_intel snd_intel_dspcfg snd_hda_codec 
>>>> snd_hda_core snd_seq_device drm kvm snd_hwdep snd_pcm_oss 
>>>> snd_mixer_oss evdev serio_raw snd_pcm irqbypass i2c_algo_bit 
>>>> fb_sys_fops syscopyarea sysfillrect emu10k1_gp pcspkr gameport 
>>>> k10temp snd_timer sysimgblt snd acpi_cpufreq wmi soundcore button 
>>>> sp5100_tco asus_atk0110 ext4 crc16 mbcache jbd2 btrfs 
>>>> blake2b_generic xor raid6_pq zstd_compress libcrc32c crc32c_generic 
>>>> uas usb_storage sg sd_mod hid_generic t10_pi usbhid hid sr_mod 
>>>> cdrom crc64_rocksoft crc64 ata_generic ahci pata_atiixp libahci 
>>>> ohci_pci firewire_ohci libata firewire_core crc_itu_t xhci_pci 
>>>> scsi_mod ohci_hcd r8169 ehci_pci xhci_hcd
>>>>    realtek ehci_hcd mdio_devres i2c_piix4 scsi_common usbcore 
>>>> libphy usb_common
>>>>   CR2: 0000000000000090
>>>>   ---[ end trace 0000000000000000 ]---
>>>>   RIP: 0010:drm_sched_fini+0x80/0xa0 [gpu_sched]
>>>>   Code: 76 83 0e c4 c6 85 8c 01 00 00 00 5b 5d 41 5c 41 5d c3 cc cc 
>>>> cc cc 4c 8d 63 f0 4c 89 e7 e8 08 99 8e c4 48 8b 03 48 39 d8 74 0f 
>>>> <c6> 80 90 00 00 00 01 48 8b 00 48 39 d8 75 f1 4c 89 e7 e8 c9 99 8e
>>>>   RSP: 0018:ffffbeb3c06bfbb8 EFLAGS: 00010213
>>>>   RAX: 0000000000000000 RBX: ffff99bae8269a98 RCX: ffff99bab703afc0
>>>>   RDX: 0000000000000001 RSI: ffff99bab703afe8 RDI: 0000000000000000
>>>>   RBP: ffff99bae82699f0 R08: ffffffff85cd0bc2 R09: 0000000000000010
>>>>   R10: 0000000000000035 R11: ffff99bb594806c0 R12: ffff99bae8269a88
>>>>   R13: ffff99bae82699f8 R14: ffff99bae82665e8 R15: 0000000000000000
>>>>   FS:  00007fd81fcd9840(0000) GS:ffff99bb67cc0000(0000) 
>>>> knlGS:0000000000000000
>>>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>   CR2: 0000000000000090 CR3: 0000000111822000 CR4: 00000000000006e0
>>>>   note: udevd[447] exited with preempt_count 1
>>>>   udevd[433]: worker [447] terminated by signal 9 (Killed)
>>>>   udevd[433]: worker [447] failed while handling 
>>>> '/devices/pci0000:00/0000:00:02.0/0000:01:00.0'
>>>>   r8169 0000:03:00.0 eth0: Link is Up - 1Gbps/Full - flow control off
>>>>   IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>>>>   Adding 4194300k swap on /dev/sda4.  Priority:-2 extents:1 
>>>> across:4194300k FS
>>>>   EXT4-fs (sda5): re-mounted. Quota mode: none.
>>>>   lp: driver loaded but no devices found
>>>>   ppdev: user-space parallel port driver
>>>>   it87: Found IT8716F chip at 0xe80, revision 3
>>>>   ACPI Warning: SystemIO range 
>>>> 0x0000000000000E85-0x0000000000000E86 conflicts with OpRegion 
>>>> 0x0000000000000E85-0x0000000000000E86 (\_SB.PCI0.SBRG.ASOC.HWRE) 
>>>> (20220331/utaddress-204)
>>>>   ACPI: OSL: Resource conflict; ACPI support missing from driver?
>>>>   BUG: unable to handle page fault for address: 00000000000065c0
>>>>   #PF: supervisor read access in kernel mode
>>>>   #PF: error_code(0x0000) - not-present page
>>>>   PGD 0 P4D 0
>>>>   Oops: 0000 [#2] PREEMPT SMP NOPTI
>>>>   CPU: 2 PID: 55 Comm: kworker/2:1 Tainted: G D            6.0.0+ 
>>>> #5179
>>>>   Hardware name: System manufacturer System Product Name/M3A78 PRO, 
>>>> BIOS 1701    01/27/2011
>>>>   Workqueue: events output_poll_execute [drm_kms_helper]
>>>>   RIP: 0010:amdgpu_device_rreg.part.0+0x39/0x100 [amdgpu]
>>>>   Code: 6c 24 08 48 89 fb 4c 89 64 24 10 44 8d 24 b5 00 00 00 00 4c 
>>>> 3b a7 88 08 00 00 89 f5 73 70 83 e2 02 74 2f 4c 03 a3 90 08 00 00 
>>>> <45> 8b 24 24 48 8b 43 08 0f b7 70 3e 66 90 44 89 e0 48 8b 1c 24 48
>>>>   RSP: 0018:ffffbeb3c0717c48 EFLAGS: 00010206
>>>>   RAX: 0000000000000000 RBX: ffff99bae8260000 RCX: 0000000000000000
>>>>   RDX: 0000000000000000 RSI: 0000000000001970 RDI: ffff99bae8260000
>>>>   RBP: 0000000000001970 R08: ffffbeb3c0717e08 R09: 0000000000000000
>>>>   R10: 0000000000000018 R11: fefefefefefefeff R12: 00000000000065c0
>>>>   R13: ffffbeb3c0717d70 R14: 0000000000000000 R15: 000000010005e340
>>>>   FS:  0000000000000000(0000) GS:ffff99bb67c80000(0000) 
>>>> knlGS:0000000000000000
>>>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>   CR2: 00000000000065c0 CR3: 000000008980a000 CR4: 00000000000006e0
>>>>   Call Trace:
>>>>    <TASK>
>>>>    amdgpu_i2c_pre_xfer+0x163/0x180 [amdgpu]
>>>>    bit_xfer+0x36/0x530 [i2c_algo_bit]
>>>>    __i2c_transfer+0x185/0x550
>>>>    i2c_transfer+0xa2/0x110
>>>>    amdgpu_display_ddc_probe+0xbd/0x100 [amdgpu]
>>>>    amdgpu_connector_vga_detect+0x8e/0x200 [amdgpu]
>>>>    drm_helper_probe_detect_ctx+0x7b/0xd0 [drm_kms_helper]
>>>>    output_poll_execute+0x152/0x220 [drm_kms_helper]
>>>>    process_one_work+0x1ae/0x370
>>>>    worker_thread+0x4d/0x3b0
>>>>    ? rescuer_thread+0x380/0x380
>>>>    kthread+0xe3/0x110
>>>>    ? kthread_complete_and_exit+0x20/0x20
>>>>    ret_from_fork+0x22/0x30
>>>>    </TASK>
>>>>   Modules linked in: max6650 hwmon_vid parport_pc ppdev lp parport 
>>>> amdgpu(+) snd_emu10k1_synth snd_emux_synth snd_seq_midi_emul 
>>>> snd_seq_virmidi snd_seq_midi snd_seq_midi_event snd_seq wmi_bmof 
>>>> snd_emu10k1 edac_mce_amd gpu_sched drm_buddy video kvm_amd 
>>>> drm_ttm_helper ttm snd_util_mem drm_display_helper snd_ac97_codec 
>>>> ccp drm_kms_helper snd_hda_codec_hdmi rng_core ac97_bus snd_rawmidi 
>>>> snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core 
>>>> snd_seq_device drm kvm snd_hwdep snd_pcm_oss snd_mixer_oss evdev 
>>>> serio_raw snd_pcm irqbypass i2c_algo_bit fb_sys_fops syscopyarea 
>>>> sysfillrect emu10k1_gp pcspkr gameport k10temp snd_timer sysimgblt 
>>>> snd acpi_cpufreq wmi soundcore button sp5100_tco asus_atk0110 ext4 
>>>> crc16 mbcache jbd2 btrfs blake2b_generic xor raid6_pq zstd_compress 
>>>> libcrc32c crc32c_generic uas usb_storage sg sd_mod hid_generic 
>>>> t10_pi usbhid hid sr_mod cdrom crc64_rocksoft crc64 ata_generic 
>>>> ahci pata_atiixp libahci ohci_pci firewire_ohci libata 
>>>> firewire_core crc_itu_t xhci_pci
>>>>    scsi_mod ohci_hcd r8169 ehci_pci xhci_hcd realtek ehci_hcd 
>>>> mdio_devres i2c_piix4 scsi_common usbcore libphy usb_common
>>>>   CR2: 00000000000065c0
>>>>   ---[ end trace 0000000000000000 ]---
>>>>   RIP: 0010:drm_sched_fini+0x80/0xa0 [gpu_sched]
>>>>   Code: 76 83 0e c4 c6 85 8c 01 00 00 00 5b 5d 41 5c 41 5d c3 cc cc 
>>>> cc cc 4c 8d 63 f0 4c 89 e7 e8 08 99 8e c4 48 8b 03 48 39 d8 74 0f 
>>>> <c6> 80 90 00 00 00 01 48 8b 00 48 39 d8 75 f1 4c 89 e7 e8 c9 99 8e
>>>>   RSP: 0018:ffffbeb3c06bfbb8 EFLAGS: 00010213
>>>>   RAX: 0000000000000000 RBX: ffff99bae8269a98 RCX: ffff99bab703afc0
>>>>   RDX: 0000000000000001 RSI: ffff99bab703afe8 RDI: 0000000000000000
>>>>   RBP: ffff99bae82699f0 R08: ffffffff85cd0bc2 R09: 0000000000000010
>>>>   R10: 0000000000000035 R11: ffff99bb594806c0 R12: ffff99bae8269a88
>>>>   R13: ffff99bae82699f8 R14: ffff99bae82665e8 R15: 0000000000000000
>>>>   FS:  0000000000000000(0000) GS:ffff99bb67c80000(0000) 
>>>> knlGS:0000000000000000
>>>>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>   CR2: 00000000000065c0 CR3: 000000008980a000 CR4: 00000000000006e0
>

