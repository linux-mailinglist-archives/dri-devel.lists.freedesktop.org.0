Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8548BEC1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 08:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEBC10EFBA;
	Wed, 12 Jan 2022 07:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640AD10EFAF;
 Wed, 12 Jan 2022 07:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuvX8mzymWi+y3EZBqOMLuicXukk8dSNUqCliHzlMPtXBjsa2h5Uaicy1KE7Nu4+4aa3d2WK5Hf6hqgtB5IK/zygXeDBYyCSxNnkJcXBd5Y4nFkTKr1G7pqClrQ6jBtXtTCBDJHng5ydNMo+vQiWgj0PG7OaC4Nds4WOCri1ahTczIgx70NRc0Vjx7oo77lqY3TeXMEN32cBg3ibrY7EhS4eNdLWfffzaoVU78OrOF5sdjVMbV6qzVeaYT4kR5LuKPoa4y0JZsmPHNg7FzArg2zW+xVg/uFZyQOm0xPY+ZrEIDB/UmjqVbNWDdNOQ8QLHIar4ESLGaMCpmCO3j4yPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpuzsekq3LzYnCrsbTMmDQ93BqmHEJenDWsFb8sQ8uk=;
 b=htbpsmcAr6chxfYtBihJ9Ap7Lt+lSiv/A4ultnVQbKBfvt3TYw/FpxSpuyO2o+bnkF7eKPU3fVQ1b54NeHi6Z4sRM+Y6mewAqr/L6t6j73FlOpwau8jx+5jON+udTrjy/Yx6DObF8D8/WPvZp1mA9b3e1VtXCe7L14H3mMw93Eei7QO2lYeNw7F+0kcjnlFVCSXsvQ94H4FofI9Y+V7hVBPkGpJq7Qeh7+RcprDnIWFZKt6V28GfDfQ+viLC6S4nwvaHkP7oJiun46AF732khMPTSTOoB+xDgBw04uLSZYMRakHNtS5KhsIG1RQGwo4/eKEWn6AzBcjoCGsUNCGv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpuzsekq3LzYnCrsbTMmDQ93BqmHEJenDWsFb8sQ8uk=;
 b=WynQ2BdTj7Lmr9g7+N1HJjgkkT2qPKDFfchcXqBEX/pAevUi2KDKgCNS81bpP8zbI/Qeh8wowMDIr8F2CDlSH79WDfE2CgGlU006KQXWcuHXrPVsEPFhLjooRqdM5+LfR1DGBlmqe6cdu2uDk+aMyDIsVg056jbUVfJZiwpWQhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by DM5PR12MB2535.namprd12.prod.outlook.com
 (2603:10b6:4:b5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 07:00:23 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 07:00:23 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRz?=
 =?UTF-8?Q?_memory_manager=27s_lru_list?=
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM5PR12MB246972E69DADF83D83FD9C73F1519@DM5PR12MB2469.namprd12.prod.outlook.com>
 <04b252b5-b04c-a5a7-23ec-adc10024d317@gmail.com>
 <DM5PR12MB246955A077D5C6245EFE9052F1529@DM5PR12MB2469.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8558bf41-3422-87d7-0937-e08a0abd9eec@amd.com>
Date: Wed, 12 Jan 2022 08:00:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DM5PR12MB246955A077D5C6245EFE9052F1529@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0206.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c81de8f-74ca-4ca4-70cf-08d9d5993383
X-MS-TrafficTypeDiagnostic: DM5PR12MB2535:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB25357FD3306DF2F407797FB983529@DM5PR12MB2535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DmZZtZnFc/AB3zFeslxZZ5N7Dv+v1gc9o+kk+eFcEkbltS4rxFEEG+T/aJkhfMbxQW5voxsLH35mJg7u00GRG4x4NHv0gZ95pW1r6G8+G077KCdd4OL0Pr8WUyDx717R6UMrPkgMPSHnyneMWhoJQLM6vMCDy0pIxFyNshp3+CmJFTBEci9H4KBVQuW8WGYFf4kAM3Cp50QDfcF3Y/YkwRpcKpuyyFh2EpQd+s+ZBahAG/E8p+kkM0K/HfgeigcxwQnOyXklPz5sBhgLulwv+RYuI6gEY+8o+THoJ3/HKKt4rNhd0jPDE8zga20bIlXaSOZacwTfDxdT1lzGDcxMRaDMfdozWefdxeOmaRz7O0lZ3jPJfb+0hcPcHK0JpzTWqN85XZ0zosN5bR/Jw3kUDiqosHDqt72IB7+kqBOuMvEfDIqWncVIYaqvZOpBDIMUkmrUIxTnHOOU5ai0LciUk89Qbs18aXHKmOmQI8DIc7TzOw7/4ptK5dQ9RwH47WrspBgsxNe3U5/g5idxZB7wbTnwIEr2lz21YAaoMhhuyqQmNn5RMI+vRMXfMGRYGXDw8ytW0caOGsu47J7iieaAqkWMXnVapFvvXHW3unaRxqUgiBA3tYq2NA6tI2p5m1duiXCDSW+dj+KwZYCQBqHAHwvBDP0zdCusi+mMfgIHFKlEdV3KqNCTUOC83iU6YeA1kH30Ot5Bs8IEDR6XkLq2uVzedX0NqT2PeQin/oXiO5SqAvthfSiznJi9UO8QalNrhafykBMar1SZMeuhsUkyUOnvuSbPQ1DLCg+YFPS1E3PLsgPZZLHWKsZNpfoIv1JM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6512007)(83380400001)(31686004)(508600001)(38100700002)(53546011)(6506007)(966005)(66946007)(86362001)(224303003)(45080400002)(8936002)(6486002)(36756003)(66476007)(66556008)(2906002)(6666004)(316002)(186003)(31696002)(4326008)(66574015)(2616005)(26005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bERiKzBQb1pLSUxRQThJTGpqcW51dHJ2VHl2VE1GTjRSZ0pxOW84TmhMamVB?=
 =?utf-8?B?TkVSY3d1R1RZZzNnTjYvb0plWFZoOFhHcUNQbWVuakNPdmJYNkI4bXQ3ZSsz?=
 =?utf-8?B?RHl1Rm8vKys4MHUrOFBYVFV5ZHdvZWpIcUxJSENGazMwN1Z4N0dQVmRyRVQr?=
 =?utf-8?B?MENlN0YwWWsvaHVKR1hpNC8weTNSaE1lV3VOb0RFS3g0NVRLMTJPZXVQU2lw?=
 =?utf-8?B?d3dSNGdyN3k3MndQeDMrRGJVL0ZMVjcxZmN4Wk5XRmFlVFhLOVlrOFUvczBN?=
 =?utf-8?B?K1pFUTVoSDNiUkt5cFNONERjbWwvaFdOK05IdGt6ejl4dDhiaVhiVjVOUGs3?=
 =?utf-8?B?eWNyYlo1dk9YN1BaL05PS28yTkc2eWJqUFJRUWpVMzRJcEtYWUU4RzZRTGRp?=
 =?utf-8?B?djV5TGs4QkFRVEJtbG16Sm9ORkswOVhYdEtvWGdqUGFwWlZQVzZVenUwWWdk?=
 =?utf-8?B?U0hoU2FWaW5nZExhaG85K29KVFZ5WnUzdnR6UjZlenJEUE11a1lRZ1h4Zmdr?=
 =?utf-8?B?clAwaXZOdG1sWWpoVDRWVnVHZUpXZWQ5Ylg1UjJ4Mk9QRk1jMlJadU5oMUd2?=
 =?utf-8?B?REJGd0ZSVFp5eHNjb0tsQisyYmNSU09NMjlPKzRYM0I2a2p2bUY1ODU3akxG?=
 =?utf-8?B?Qnhrd0VDNTI4dDBOWVB0Q1Vic1RvM3g3d2E1ZWxZSHdjd0pzSEdUU3Bwcldl?=
 =?utf-8?B?TkhCbjlhNzBRU2syTE80UHBibmc5ZXp4Tmh0UDFsbXhpZmNCOW0xeTRIaE1P?=
 =?utf-8?B?S0x1UmcwbnNQOUN5WExKcTNpMGU4M1BLLy8rNUs5OXEwR2dSQyszVndPZFFG?=
 =?utf-8?B?TE52cjlUL214U2ZtVTU5WnphaWI3NFd6Y01rV1NZMW84b3NLR0JtN0g1dVJK?=
 =?utf-8?B?dWlRbXRyaXZ4c1U1ZjB6ZWFPTnVFKzIvdTd1NHdzcGx3ZnU4VjQxc0M3SFhH?=
 =?utf-8?B?Wnk5REVFRUhaWTFyRWNiTllEeFNjcDRRc0hZbm03UU5nd1RJSExEVWg0VEpN?=
 =?utf-8?B?dzJ4NWVRc3hDS1Q0WTFuNGlkbkVnY0ppUmo0UVFJUGdJWmJ1dWg0Q2JuU0xx?=
 =?utf-8?B?d2lTUnk1ZVEwc1M5OXpiSFVGaSt2dW5GOFFXOEtDVUxSaUNvUFhoNzVSbmFE?=
 =?utf-8?B?dzNjbDlhUnRacEJZOTJ4Zlg1bWw5WGhkMEdNMFV5MUdHSUg5cHVSOTdLWi8v?=
 =?utf-8?B?dUVZNFZlQkFHcm9rNmZLNEJFelpROUp0eTdkNFdITjVxQVYzOVhmWEdubmZa?=
 =?utf-8?B?UTF1WEJRVkt0R0F4aEcvRkF5bUUzNVArMG9vVnJxNjNsQVhGeXBZc3lmbSta?=
 =?utf-8?B?dHJ0UlhMZWc1MDFPY0krc25nVGp4ejY0NXhYbTUrTEhUejdON2pybXVtN0pM?=
 =?utf-8?B?YWRETkxNUnZYdkFPRmY1UzVJVEdJREFjZUtXZFNhcnRVMW0vaHk1UktpbjZP?=
 =?utf-8?B?K1lvRHExRlRsSG9nZ2FqaXhld0tSS2JzNkVuUEtaMWRPWGo0MmNabFl3blU3?=
 =?utf-8?B?RFlveFhDM2RQRnRhRXhJaTZkcGtaWE1Kbi9SL2JSeGVEL3FGU2VqR0JXWC9P?=
 =?utf-8?B?V2V1OHBOcEp0blh0VFJ2RHVEMzJZVW5tV3dIV0t5YUhTQmp5cFNKVktOelov?=
 =?utf-8?B?bmxadEVWKy8vRE50alM0VHVYbFVZajZicHZKV1NKclNhRklvOGQ0djdnSkZi?=
 =?utf-8?B?RE5Lb25pQmZlWWhNb3pCSWUySUtOUFZIeFNGUHNDZjZ1Uzgxdm16MDk2RUZp?=
 =?utf-8?B?WDBQWFRIV1lqNThITDcvdHErSUk4a2ROaGp5eE9mVXNNdFdwRVpGdmhEWGhN?=
 =?utf-8?B?Wm5qMGVaYmlJaml3N1ZkZzBFMHFjdHhTNVdKdkVJNEw3SU5VZlpOOWYvQUZ5?=
 =?utf-8?B?bVBXTWhhdFQ5emc0a2pIK2tSVjVyTDU1ZjE4UEJzMmlHSU5Xb0NIYlZtVytL?=
 =?utf-8?B?Tnh2UjdXeHZJNXRpYk9kdE9FNUIxWm04ek9GeDFYdUpoSmNMVW4vUXpTcjVH?=
 =?utf-8?B?QkgyU0Rtb0kydG52Rk1zNEZxcGovV1hzN2taZ3ZzUFUwVmxuK3VGL2YzQUY3?=
 =?utf-8?B?cnRNeFlwTk9UWDBCbGZsWlg3ZHZDbDJYS2tqaEVzWWVjQlMzR2wzdnpUMkdK?=
 =?utf-8?Q?sguk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c81de8f-74ca-4ca4-70cf-08d9d5993383
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 07:00:22.3569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33K1A+drGpTAyInIMPRZp60qmS3aVYsuiisAwWltxyprdRNv+jP3mfo+9YBZSjuK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2535
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah, that should probably be the right one.

Christian.

Am 12.01.22 um 03:19 schrieb Chen, Guchun:
> [Public]
>
> Hi Christian,
>
> My BAD, I checked that discussion history of this just now. So If I read it correctly, the double check at a different place to skip evict is: " drm/ttm: Double check mem_type of BO while eviction"? It is in 5.16 kernel.
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> Sent: Tuesday, January 11, 2022 7:27 PM
> To: Chen, Guchun <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> IIRC we have completely dropped this patch in favor of a check at a different place.
>
> Regards,
> Christian.
>
> Am 11.01.22 um 09:47 schrieb Chen, Guchun:
>> [Public]
>>
>> Hi Christian,
>>
>> Looks this patch still missed in 5.16 kernel. Is it intentional?
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>> kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
>> Ftree%2Fdrivers%2Fgpu%2Fdrm%2Fttm%2Fttm_bo.c%3Fh%3Dv5.16&amp;data=04%7
>> C01%7CGuchun.Chen%40amd.com%7Cf3b7f4971dc8405b0c2908d9d4f55547%7C3dd89
>> 61fe4884e608e11a82d994e183d%7C0%7C0%7C637774972434004088%7CUnknown%7CT
>> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>> 6Mn0%3D%7C3000&amp;sdata=vbuBPHO40J2HGt7abzfzC0nC1DQa62qal5S6TXBRj4w%3
>> D&amp;reserved=0
>>
>> Regards,
>> Guchun
>>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Pan, Xinhui
>> Sent: Tuesday, November 9, 2021 9:16 PM
>> To: Koenig, Christian <Christian.Koenig@amd.com>;
>> amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Subject: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru
>> list
>>
>> [AMD Official Use Only]
>>
>> [AMD Official Use Only]
>>
>> Actually this patch does not totally fix the mismatch of lru list with mem_type as mem_type is changed in ->move() and lru list is changed after that.
>>
>> During this small period, another eviction could still happed and evict this mismatched BO from sMam(say, its lru list is on vram domain) to sMem.
>> ________________________________________
>> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
>> 发送时间: 2021年11月9日 21:05
>> 收件人: Koenig, Christian; amd-gfx@lists.freedesktop.org
>> 抄送: dri-devel@lists.freedesktop.org
>> 主题: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>
>> Yes, a stable tag is needed. vulkan guys say 5.14 hit this issue too.
>>
>> I think that amdgpu_bo_move() does support copy from sysMem to sysMem correctly.
>> maybe something below is needed.
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index c83ef42ca702..aa63ae7ddf1e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -485,7 +485,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>>           }
>>           if (old_mem->mem_type == TTM_PL_SYSTEM &&
>>               (new_mem->mem_type == TTM_PL_TT ||
>> -            new_mem->mem_type == AMDGPU_PL_PREEMPT)) {
>> +            new_mem->mem_type == AMDGPU_PL_PREEMPT ||
>> +            new_mem->mem_type == TTM_PL_SYSTEM)) {
>>                   ttm_bo_move_null(bo, new_mem);
>>                   goto out;
>>           }
>>
>> otherwise, amdgpu_move_blit() is called to do the system memory copy which use a wrong address.
>>    206         /* Map only what can't be accessed directly */
>>    207         if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
>>    208                 *addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
>>    209                         mm_cur->start;
>>    210                 return 0;
>>    211         }
>>
>> line 208, *addr is zero. So when amdgpu_copy_buffer submit job with such addr, page fault happens.
>>
>>
>> ________________________________________
>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>> 发送时间: 2021年11月9日 20:35
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: dri-devel@lists.freedesktop.org
>> 主题: Re: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>
>> Mhm, I'm not sure what the rational behind that is.
>>
>> Not moving the BO would make things less efficient, but should never cause a crash.
>>
>> Maybe we should add a CC: stable tag and push it to -fixes instead?
>>
>> Christian.
>>
>> Am 09.11.21 um 13:28 schrieb Pan, Xinhui:
>>> [AMD Official Use Only]
>>>
>>> I hit vulkan cts test hang with navi23.
>>>
>>> dmesg says gmc page fault with address 0x0, 0x1000, 0x2000....
>>> And some debug log also says amdgu copy one BO from system Domain to system Domain which is really weird.
>>> ________________________________________
>>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>>> 发送时间: 2021年11月9日 20:20
>>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>>> 抄送: dri-devel@lists.freedesktop.org
>>> 主题: Re: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>>
>>> Am 09.11.21 um 12:19 schrieb xinhui pan:
>>>> After we move BO to a new memory region, we should put it to the new
>>>> memory manager's lru list regardless we unlock the resv or not.
>>>>
>>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> Interesting find, did you trigger that somehow or did you just
>>> stumbled over it by reading the code?
>>>
>>> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I
>>> will pick that up for drm-misc-next.
>>>
>>> Thanks,
>>> Christian.
>>>
>>>> ---
>>>>      drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>>>      1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c index f1367107925b..e307004f0b28
>>>> 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>>          ret = ttm_bo_evict(bo, ctx);
>>>>          if (locked)
>>>>                  ttm_bo_unreserve(bo);
>>>> +     else
>>>> +             ttm_bo_move_to_lru_tail_unlocked(bo);
>>>>
>>>>          ttm_bo_put(bo);
>>>>          return ret;

