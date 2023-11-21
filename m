Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C817F340C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B004C10E50D;
	Tue, 21 Nov 2023 16:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC2F10E50D;
 Tue, 21 Nov 2023 16:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNcnMF2eX9P1w7rJbzEMVwjnC45XRLHABM8CmRA/G2IqBbk58divc+S+zJw6XQuuy8kiGMwgj61ySzS/LoODCEM0qnPB3mI4iJcgHmbabvycZRTMBvl0R7D6JmSx7mqG8P6qKL4WdVKY0YQtn4KNXH7CbLxg7LOIqzzRhu9xuZR0VimHSVigjIJ41Zh5w7eA2MVM/72N3UTCT/MoicJDENM61lzI0BH+o5cr/AV05U6as6+Jzc7JtUU6sI2kCoy/XD76gURMJs+dlQaCVd3dDf99/WiV1MjaI1lbZ1OUKNb/iR5zc/y9wjDd4oEGTDKaBzjP/irFPCa0yqXidKOgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVGM3ETCkkmMJBcNgPksQm10XmtucRdS/ZVrjj0v9VM=;
 b=VO76zal78DEXgGm8yZVUTjn/xxESTnncB8g9M38JbQJ7thrJo31m2ta6E7N50eVjEHQJ0v4quJsb1O+VK5yj9pUwpxuKJ2bpMbNyL/1lhBszPlgugXKdGcj2leMq16Xopi3v/hRUkPthk1yz5+8N80NZnCrUHuX+RljOxK60Ipdn/OwDbMbripJU1PqmMNjejCrSMQ9UTYlilGlKAbE17acfuKXrJXicLZjyazLreMq+q34Y5mjO65cqw2sYb3EBWbJhIf5cwR8c/oOy5pgTR/O/8x+UGlCS23KseBGXRAiIwkuVat5l1Pm8z9b5AshE8aZ0dFSp3nBq6P09mAk4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVGM3ETCkkmMJBcNgPksQm10XmtucRdS/ZVrjj0v9VM=;
 b=M3I1L5Btm70mCq04ooWN+be4N0XGfvZp5xAuGSxJV8g6l4tIOmzahn0XDzPBtZXjUfxeFxstkOBzOYII3AMY9xYIvW0UAkgAOAE9ZflScFmHEeHtWTMBCp9jsyYZGY2dhSQAZzTmC8sOs7Pz0fVxI4NhV3V6r/TxKyRFvjSVB/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 16:41:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7002.026; Tue, 21 Nov 2023
 16:41:30 +0000
Message-ID: <fe6549e8-12b7-4ccb-96d1-a01cfa39709c@amd.com>
Date: Tue, 21 Nov 2023 11:41:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 218168] New: amdgpu: kfd_topology.c warning: the frame size
 of 1408 bytes is larger than 1024 bytes
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, bugzilla-daemon@kernel.org,
 dri-devel@lists.freedesktop.org
References: <bug-218168-2300@https.bugzilla.kernel.org/>
 <22a0edcb-26fa-415a-a05a-e4d807e2b703@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <22a0edcb-26fa-415a-a05a-e4d807e2b703@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::13)
 To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: e579f691-753d-46e8-9398-08dbeab0b6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5ouKgW1WNzezU+ptvAQe9MDzGfQvuJPGe6oQOWFPVdG/xK2RDS8mETBji2cIsg5CeU0qQMgLqMdwCuqSdu7ky9WsrRIoBQBuf4MNTpokyXbe0uZi7DrZQiAhtEv5wuHn6ngFUFskNUxg1Ef38F+Dny+VkrFFYKbDeKrUPEtrDMtscTdmNMZexIipEhO9Ov5pS+TNdDR+iXIytqJrkrt/hArg513gDBqrRVbXZEqTasBQ1zPa+/QLAZ64+9yDYJqr1nCPcJLplKo4v0S0P/FVz2pXRhS36xspb5ww1xFfkpCprN06n7fYsOVFhVfOktFuOdHPQ17tOYDIMVaE7TU1zctnL0KZ8X8mnUetMtcHcw+Q/1y+AyqiaozyVNQ5WClv/b0aClI60OdLNdCYhI9Hek75OhMiBewqQtj0pUMyEenhjUWJmSJva0uoUg0a9a9SHD5zdGtCKIwQQG3RDuNIU3fbFtT34I2CN/r3cbH0XJYE42g3CofAIq7oiDUjAYcYOG/Kk4tp7/uG9J3NIsb7yuh0SXJ5xaA47LwzCGX38ZTh9CS9YOrPDCThAeSWJdtfiVIdr8VDZa9fbn3pSEdoSWrCoQys1DSDtxbSLSMbztSDGBQolHjwLWLMWEWglJerJn3TZdD11kt/NoZ0yYGyCETAHev+CgLAmNI+KpYaf6k/9IY1NIHBpwZi6hau2R9HjfVxLWIrABXUVcZjKafxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(6506007)(478600001)(2616005)(53546011)(36916002)(6486002)(966005)(26005)(66574015)(316002)(31686004)(66556008)(66476007)(66946007)(6512007)(4326008)(8936002)(8676002)(38100700002)(44832011)(31696002)(5660300002)(2906002)(41300700001)(86362001)(36756003)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1NGaVkxeGVCOS9rSWkxQXFDMnJycXJhSFpDRzFEb0EvdnNaQnlPaE1jd0wr?=
 =?utf-8?B?QThKb2JtNi8wZ1NFU1o5QkhuWXB4LytyZGIwTzM0cklROEtEQm42SWRvUCts?=
 =?utf-8?B?VEpsRmdoVmhFZGk1MERDano3Q2NEWnRkeWVzdVZmTm5HQUJnNXdOVUh2UnZN?=
 =?utf-8?B?WU9NaUloNVgzcnZ4ZHRsNDMzYlJjSWpwTFI2KzZFWVJMVXdaVitUSXd5aTNL?=
 =?utf-8?B?QW1UY3kxSFp1cDBMempTdHRjRXZGbkhyL0xnOEQ1MDJlbkU4Nng3T0VBTEJZ?=
 =?utf-8?B?c0tHUEVuMnJMUGV3cGg0S2p2eTdlUnhCOW9mOThGQ3hhY0piMlYycUQ4anhq?=
 =?utf-8?B?WE9KMTdNVS9iOGpRd29XVzhtS09NeDBYZHFMODloSWt4S0h1WnFNcXlQbWY0?=
 =?utf-8?B?Y2MzRUxiVDFWenNMYW5DdmNRRTRlZVQ2UFdZR3M3bEE0ck5PdFRoU2FVNVFZ?=
 =?utf-8?B?YmRRK3ZZUWlFS3B0MkVYa1ZvTENxUzNiUkVNWWczc25pRnowWXYyejVOVjJN?=
 =?utf-8?B?OWtGdlpRTXZtK1dkZTFQcVYzL0w4Z0lyMG1rZnNob1VRc2tUY3ZQTGpOMjRF?=
 =?utf-8?B?YmI1S3hXT0lYSHp2dWMxWXNDNHRHYVY0aGhEZVNUOXl1S2RNNXFSM1p0SDhJ?=
 =?utf-8?B?bGdKZkpnTFMxRGtEWThYVk9MRWdRa0F4b0NuK1ljRlpScDZSWDFtSjdxQjVR?=
 =?utf-8?B?clBFaTgwaGpLcUl5NXE5T3N4S1dTem5HV2lqNThZZS9TSXpJU3JvNVBRSC9u?=
 =?utf-8?B?MWtRaXl2Zm1WR1RNSDlqZlhSRWl6OTFjVUdRY0tHdE8ydENtZEtEcVRwUVJv?=
 =?utf-8?B?YWZOemNKL3R0SHRYdXQvaHZCUWdtOVV2bmNPcmVNcnVIaUllZSs1d29VMDh6?=
 =?utf-8?B?bXNjOU9tNldMNXFaRHhUYlpsUm9yM1dCditxSnFFemZkY280TC9uVVF1cWVR?=
 =?utf-8?B?UGZpckFrb0lvYmpGTnVNQThUQ3hiaEwvZlRneGZWV3RITVAyc0haUEdaLzZW?=
 =?utf-8?B?SUdRdllZQlBMM3VIWE9RSDJGVmd4ZUhVcjdneHI5a2tBbiszYVpmR0VWQklM?=
 =?utf-8?B?ZVpoZVZ6a1R6Y1FaRnJWMEhyQjQ4UEUwa1owZ05YNVMrYlh5NFJUTjg1MUx3?=
 =?utf-8?B?YUJYUVI2cFdEdVJ3a0dkM3ZhMHB0c2tTLzJEclI3b1pNeDhTQTJFeFRiVG9Z?=
 =?utf-8?B?VVQrcXg5Y3pWYkRuQ3VYai94YVk1eUU2UVBndWFkaURMNThpRlN2NEpONHk1?=
 =?utf-8?B?OFBoUkwwckFHRXl6Q1JJdXFPUkpEaFAxQWg3NWVMbHZ0SEp4dFg5enBHK0RS?=
 =?utf-8?B?azBiNlhDak9iZW81cmZxK3dLeUUwaXZxQ2RXRWZQdHpON3FQdGhkeU52Vm5r?=
 =?utf-8?B?Q2x3UHM4U0JZSElLQ1hZZHB3S1VQTFNuQVlPYU8rbmRmaFJSVVB1NWZLZGJJ?=
 =?utf-8?B?Q0tEenZrb1UzVTlqNFpDNFdwY2xVUWhPUmtyU053V1VvRyt4Yi9kSmNzaUFI?=
 =?utf-8?B?VVZ5VEhmZUZrK3Y2SHlWSi9aZW0raE14K3lIVnNSRm0wdGZpRE1Hd0cvS2kz?=
 =?utf-8?B?eVlTYnQyN0ZiTlVURER1aHlMK3ZONVoxQmpyaWxrSDNoUlV1ZmpuQlFiNFBx?=
 =?utf-8?B?SzlGdHpSNHN6KzlVZWNYdnlCbnVxMTMrbmFDZHB3U1Fud1BLZURyTVRKWGlz?=
 =?utf-8?B?MFdFNjl1MUVYaUVGbW5obGwwYnhLOUMya3RLWEZEeEZsR1EwSnQvSHFvZVpR?=
 =?utf-8?B?SEd6ZDJiS3RHb2FaSFJDNmY5a3hwTlVubEJRVkVCZnlFSmFQc1NmUS9NTHNh?=
 =?utf-8?B?aDFsMndMbDNBQThJSXcxSWZVODU1SHQwTUpRQzFQS2tQeDZxYUt6bklDQTc4?=
 =?utf-8?B?MnpROXdCSVplMXN4TDg2TnQrckJvcnUzSGpnSWpscEFZWGNRTlg5TERKMzgz?=
 =?utf-8?B?MnJFMmlNWFNPY0JpdEtBLzNxeldBWGxjQlMzUkt0Rm80OGNrNHd1dGVLVzEr?=
 =?utf-8?B?UzcvWmFPZGxiekdJZXgrWmtGSXBaSkhIaFR3UTg0cDBMaHJNWXEwdm1wblps?=
 =?utf-8?B?Uzk2TlBLaSt4M1BTcFZVY3M0clBtbG1QYm9ZRlJJay83Y3dVWXFlcDliK0FD?=
 =?utf-8?Q?qVbkUgI2MMf/mE/MH1dxrSjxj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e579f691-753d-46e8-9398-08dbeab0b6d3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:41:30.7450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9XalHvkzQkXeJaao0URKyjINnvnB9REqXvWouL/psXVqIS5wmlxCZXILDa/iAHg61zwfgRBMOaDl1pB0ci/4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428
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
Cc: amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two patches that didn't make it into Linux 6.6 that reduce the 
stack size in kfd_topology_add_device. Can you check if those fix the 
problem?

commit aa5a9b2ccda2fa834fddb4bd30a2ab831598f551
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Sep 26 12:00:23 2023 -0400

     drm/amdkfd: drop struct kfd_cu_info
     
     I think this was an abstraction back from when
     kfd supported both radeon and amdgpu.  Since we just
     support amdgpu now, there is no more need for this and
     we can use the amdgpu structures directly.
     
     This also avoids having the kfd_cu_info structures on
     the stack when inlining which can blow up the stack.
     
     Cc: Arnd Bergmann <arnd@kernel.org>
     Acked-by: Arnd Bergmann <arnd@arndb.de>
     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Acked-by: Christian König <christian.koenig@amd.com>
     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

commit 1f3b515578a1d73926993629a06a7f3b60535b59
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Thu Sep 21 10:32:09 2023 -0400

     drm/amdkfd: reduce stack size in kfd_topology_add_device()
     
     kfd_topology.c:2082:1: warning: the frame size of 1440 bytes is larger than 1024 bytes
     
     Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2866
     Cc: Arnd Bergmann <arnd@kernel.org>
     Acked-by: Arnd Bergmann <arnd@arndb.de>
     Acked-by: Christian König <christian.koenig@amd.com>
     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Regards,
   Felix


On 2023-11-20 10:36, Hamza Mahfooz wrote:
> + amd-gfx
> + Felix
>
> On 11/20/23 10:16, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=218168
>>
>>              Bug ID: 218168
>>             Summary: amdgpu: kfd_topology.c warning: the frame size 
>> of 1408
>>                      bytes is larger than 1024 bytes
>>             Product: Drivers
>>             Version: 2.5
>>            Hardware: All
>>                  OS: Linux
>>              Status: NEW
>>            Severity: normal
>>            Priority: P3
>>           Component: Video(DRI - non Intel)
>>            Assignee: drivers_video-dri@kernel-bugs.osdl.org
>>            Reporter: bluesun654@gmail.com
>>          Regression: No
>>
>> Trying to compile Linux 6.6.2 with GCC 13.2.1 and CONFIG_WERROR=y:
>>
>> [...]
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function
>> 'kfd_topology_add_device':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2082:1: error: 
>> the frame
>> size of 1408 bytes is larger than 1024 bytes 
>> [-Werror=frame-larger-than=]
>>   2082 | }
>>        | ^
>> cc1: all warnings being treated as errors
>> [...]
>>
