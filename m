Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D5452D3C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FF36EE67;
	Tue, 16 Nov 2021 08:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204BB6EE67
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghaVs6JC/hCloY3vcDh8RS7c/1MJq0nhyMYUTD/y3pFWkNADO/g+8glnYVIAP48BWlgO85t4ZsgflGJvM7IjhgCJTfG/GbIXskKnePVxCS20fKPQPeJi2F9QJn6pLD6BbJ4p9mkUE6lVjkpXYkomv45Z4RDwgbxEyT6P7/Cs20UyesJ1T5ixD31ISpkMJvDD0kQ5r0EI72NM4thpxzYz9hPZo/f/4n8oreN+qpgo3CE6xzjNjTcGyXikCS1UsY3qb3g1QyNYdRLTtwVG420P38RGn+0X2ZltYSPFf1fhOqR0A1WGFPI3uS+19KWLnbofq/Med6PUxT2XUgwA+3bJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLANjBKTwB7r+VaYx/aKKUm9tdoyPs7X9kFSPVqBl7Q=;
 b=lfEyIISyVW/AOeo7tnbjUDnr0m8zahKfTX3UDsmLYY06nJM8hEXCSmki49Nd7X4iQDb0u06AD+bQjLh2+UgJCs4d4xiMkJLI7WcM/2yMHoxjZdcIdtYq6TcAzeOqoGXhPSxDKkCFxUvjqCfzuM+ZTe8F1wUtI0IzsJeQFoOZmjLiAISfEiGAw/HzKd1n4g1GG7VITT8tpN4kUfDl5U+hgRPJlaEYzVqm16dkX9Lb0rnCtIzpTbxIVkHSoWLGdj9yPbDmPjorag/3bpHut1mvnNuFyi9a/uNckxr0CN0C/aC5Zb4DolRk3Hcr/sldHelxWc3HjainR1OiiEgG2hdujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLANjBKTwB7r+VaYx/aKKUm9tdoyPs7X9kFSPVqBl7Q=;
 b=iORKUupAu2y0XG1OS2D7rp1vwhGE4D2Omokq4PnD7/D53c5E2Er/MPVP6+yqfMM2PbeqQbmlSSMy91vGSwsZUqQ9Qz5dK3bxiPRmwb30W+bQjivo6FYEr/5mVmgFTBPeupwPptYpoz7Rpo7djIWZp3gc2IztOOeJt00wZnbZxg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1213.namprd12.prod.outlook.com
 (2603:10b6:300:f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 08:54:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 08:54:52 +0000
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
 <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
 <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
 <112af1da-87ff-ee03-9461-e23173e84e86@amd.com>
 <ddc99a8c-0887-9fc3-718e-98963723415c@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5609a30f-2625-9b27-6ad6-4c6d73fb10f6@amd.com>
Date: Tue, 16 Nov 2021 09:54:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ddc99a8c-0887-9fc3-718e-98963723415c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR10CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::49) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM6PR10CA0072.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.18 via Frontend Transport; Tue, 16 Nov 2021 08:54:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecaa3b48-2e4f-4661-d3ee-08d9a8dec128
X-MS-TrafficTypeDiagnostic: MWHPR12MB1213:
X-Microsoft-Antispam-PRVS: <MWHPR12MB121396769C9F8B0AEE5DE3DF83999@MWHPR12MB1213.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PckmAgjQeKjmUwTTnLvG1sRHcD9IAvaPRZBtJsQkG6kN9KwTCmM/OnIQTpkIojbl3/LJOB0BRbBipr6Izttc0NOsdOl2x/sduus/iMCct44sTVWHeDOysOkC+flbK5idiIjAdJ7WbBl73D1JNy/AsM9K69TDcqYrfCOpPc2t3iBlIqKxmQrqwKyZPIIUbW4UXHKSBFihvbokr6Vcs4hefoGpH0A3nb38ZVEgHwK2+bcmVJl9peK9E+tmZ9J6BmueYW1N2P4OQNR64CBjJisNhgcBYZTC5M85L4fnwepx5DGLVtUoqPpvDlMdpwYpoVymYwNhVwSLWjiXdlNqXoATSg9No8FLGY1abIXYbW9rsB4JbpMwGWaAAwbnHqksX1CH7HjrX/cxCrV2KFIgVz4+6tZopkOZARDwVwDnSEXxhDsHicMldFWTIcQU6iLjCmpcWpA4+3wpxAml5sxdQsLlOU3Y3M8MURZHSFFeIgJ1Nnkq7K6hJ0PsbjWurvBoiCkacm86tJdIRHzvgXWZ20VRE/m9EkkytQxVS2xhyMQ61lrVyYHkUpiPSj+zv0c1CuXnZMtuEq8b9gpEx0W2nnt6WGMsw3wovS7zutGFOlrjDP/sWzSkxXTw40j3Y2W8tPFXTcMxOSqNq6j7EuJX5NzulFDl+B7fO6eBOFcLHDNbETGRl+MUS/LyaWRkgBa5tfkXMPLvfbEeFHrM8QAauSwx+HGlszePFcDWo2pmhEFcq4sUaK+13VnvNOFjq2EP/fdPbmRv4DA7QVU/7yJPCJF0qIJWnA8jW95/TIhk3x5WRcLwqzf9RLKRY3DZBmLcBVi/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(45080400002)(66556008)(508600001)(2906002)(16576012)(66946007)(8936002)(966005)(31696002)(186003)(6486002)(4001150100001)(316002)(110136005)(66476007)(26005)(36756003)(956004)(6666004)(2616005)(66574015)(31686004)(8676002)(86362001)(83380400001)(38100700002)(5660300002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXlsdThBd2J5TERDRlNITzRUTlRjN0gxS25lK0J0V3hUTHJPN1N2dlJNZDZk?=
 =?utf-8?B?NkViWHVPMzY0dVV4N0ZtTkFISGo2RCtrUUdzZFhyY2k5WW50WTI5NTdPNnZX?=
 =?utf-8?B?Yi9INnZOWmlGM2g5MWVYdm1Ud0MwNjllVUxZbkM1cnVWS1dReUlpS010N3J3?=
 =?utf-8?B?VkhNbUNURTBBcGpVTlhrT29uenptRDA4SWV2VUJ5WVYzbjdVSVl1eGF3cHJD?=
 =?utf-8?B?OWxvK3E4Y2VORkVPRUErdFVCeGxVRkZGQ1VRWWFTUGh6bGNKdEtMSkl2cVFm?=
 =?utf-8?B?d0xsZUxOdXorS2JFK1VoaUxyVGhPL3YyandEQUdJQVVVdTk0Mk00Yk9IMzZH?=
 =?utf-8?B?YlZueUtrWU5Vc1lTbzE5TnArT0Q0a3pSalRJOXZYRnpONFAwSURrVXc2aWQv?=
 =?utf-8?B?cHNzWWYzZmNwL0RCd2xFbkNRY2FUdGErcEkvTUY4c0J6aWxZNVhXR0JtdStn?=
 =?utf-8?B?RmtBcUROcDBKSHYrZU0zUVI0TnBmNVNtRjlkZndpNG1teXppc2pkblZDOTVE?=
 =?utf-8?B?UjN6elA3QlRONFk4TDVVaWNJeGpuUnpTbFlRUExpdUJOeFJLL0hTUFdmMDM2?=
 =?utf-8?B?YUw2SURrTEtMcmw3SEdGcWREMDNSanVKSW52eThrWDNGN2NGSnhpY29rTmZl?=
 =?utf-8?B?RnZ6NnBxczV2OUowaER0aHZiVSs3dmhMTTJqSFNMdUY0My9IbDBqRjZKUFBr?=
 =?utf-8?B?c2g5MW5hZk9CWDNRbCtnRVhZTWlmZzkxcXhhZExiZldiOWRBVldDZzk1RHlo?=
 =?utf-8?B?Q3RUeVAwWkxrRWpMdzFIMGVUcjd0YU5JaCtVVTZsTUpJbUpaSDl3cDkwMS81?=
 =?utf-8?B?V0FsZWl4djlGYkp1RlZmSkFwS2w5Z0Mwci9ySlBYcDU0V0lMR3plMXA5c2F1?=
 =?utf-8?B?bXg0dG13ZFdUV1ppYTJrTE9ObndEMUwvd3V3T1IzZHBaTElvVG5rcld2ckJX?=
 =?utf-8?B?LzdIbWl1dmlrb0hXU3pvSnlDQUtndWRHenFFRGwwcTlXNEtrR0x5b3U4VUEw?=
 =?utf-8?B?ZUZ0d0Z0MThaSTgxRVZPSTF6QmRuRklDVkhvOUF1aVgrdFp6eUlQYmRhM1lx?=
 =?utf-8?B?R3hQSTg3VDl0V2NZTWdEYjJSWkpCTGRRTTZpakZWbEtZUThHanN4bnppZ2RR?=
 =?utf-8?B?VEVzT2RIUC9WVmNjNkhHZnZPcEdUVTNJSG9oei9uVWVhdEtqMGRKbUQrRTY1?=
 =?utf-8?B?STE3ckkwTkg0UTQrV1VUdW1Ybk5RQXRIRVVVNHRrZTNxcmNmc0g3SnBkY3ZM?=
 =?utf-8?B?ckVZTk40THhjZlU3VHdCYlovZFcrVEhvTGJoWWt5QktvaFY0Ump2VWxudTVn?=
 =?utf-8?B?UWZSZWVBRkFXVVE0V29xdUJuaHhWSjhobWlQK3dTd2JLSFpxdTJoRi9SeTRJ?=
 =?utf-8?B?MnYxVm54bGZKZzZMVFdZNkJVTEtOSjkzUmxwMkUxV2pQR2hkQ2xkUGRCRUlj?=
 =?utf-8?B?T0d1R0hweXJUTHFYazZ4QnNHWlVjempPcGNhdWVnUWdmMVNwcmNrYTJodGxB?=
 =?utf-8?B?OUw2eDRyUnlrY0s2VnBoc1hTRTBIc05FVXBsU0xpNkc4WW9UOGI1Y3d0cGIx?=
 =?utf-8?B?TmZsTSs1TFRKeTc1Y3ZYbEV4cFk5WlZoS1RGcEdLZFRQS2lWUFJOenIwZk9R?=
 =?utf-8?B?eVlRRzRjeWtBZ3JSSm80RmJKZzFPdk9TaThGbnJ6bzB1TlFKUnkwT0xVWHl4?=
 =?utf-8?B?RnVqOHhMWlVkOFZVQ1hVU3FYUWRNYzNkWE5NaFhVN3RwdDFtVWxtUHNBWGxk?=
 =?utf-8?B?UFhiTkU5NXg3ZTNYdTQxSkIrZVltUG5sRmN1Sk8vR2xKenQ3MlhJY0NSY0w5?=
 =?utf-8?B?QWlaMHliWjFSYkRLem1paURCTm1yOFBudDROc0tWa1pOU0c5aGFQVCtMS25o?=
 =?utf-8?B?TWRXTmYyR3lmUXpQSElzWmw1V2dxMGRBNVVSRStXMmZyYkdldGdyekdIcHYx?=
 =?utf-8?B?SDNGL1BvUFBBUW5ublJ1amlSa09ESUZncFVSTXBRSk1sSThXRy9xRlZHTjEy?=
 =?utf-8?B?b0J4WVBTZWwxcE5RMzN3WDNpTVNRRkRoQnNxRFg5SjdtZWUxYTd0YWxESUNH?=
 =?utf-8?B?R25vS1lvbzI3by8reit1SjhoeHc5M3dQelppSDRJMHlmQlhKSHVzUjNia1Uz?=
 =?utf-8?Q?77Lc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaa3b48-2e4f-4661-d3ee-08d9a8dec128
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:54:52.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLE4/B0+9EQw5nDzIJUbYvJUnLI9lS2FxLiGgPzg8soCZesmeSe0SCiW7gcUCsQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1213
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

Am 16.11.21 um 09:33 schrieb Thomas Hellström:
> On 11/16/21 09:20, Christian König wrote:
>> Am 16.11.21 um 08:43 schrieb Thomas Hellström:
>>> On 11/16/21 08:19, Christian König wrote:
>>>> Am 13.11.21 um 12:26 schrieb Thomas Hellström:
>>>>> Hi, Zack,
>>>>>
>>>>> On 11/11/21 17:44, Zack Rusin wrote:
>>>>>> On Wed, 2021-11-10 at 09:50 -0500, Zack Rusin wrote:
>>>>>>> TTM takes full control over TTM_PL_SYSTEM placed buffers. This 
>>>>>>> makes
>>>>>>> driver internal usage of TTM_PL_SYSTEM prone to errors because it
>>>>>>> requires the drivers to manually handle all interactions between 
>>>>>>> TTM
>>>>>>> which can swap out those buffers whenever it thinks it's the right
>>>>>>> thing to do and driver.
>>>>>>>
>>>>>>> CPU buffers which need to be fenced and shared with accelerators
>>>>>>> should
>>>>>>> be placed in driver specific placements that can explicitly handle
>>>>>>> CPU/accelerator buffer fencing.
>>>>>>> Currently, apart, from things silently failing nothing is enforcing
>>>>>>> that requirement which means that it's easy for drivers and new
>>>>>>> developers to get this wrong. To avoid the confusion we can 
>>>>>>> document
>>>>>>> this requirement and clarify the solution.
>>>>>>>
>>>>>>> This came up during a discussion on dri-devel:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C582935bfd2d94d97fa4808d9a8dbd574%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637726484406316306%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4p9KuhMpWHabLEuIvJB2JEuKRhYx2gUuDywUuZ86s0o%3D&amp;reserved=0 
>>>>>>>
>>>>>
>>>>> I took a slightly deeper look into this. I think we need to 
>>>>> formalize this a bit more to understand pros and cons and what the 
>>>>> restrictions are really all about. Anybody looking at the prevous 
>>>>> discussion will mostly see arguments similar to "this is stupid 
>>>>> and difficult" and "it has always been this way" which are not 
>>>>> really constructive.
>>>>>
>>>>> First disregarding all accounting stuff, I think this all boils 
>>>>> down to TTM_PL_SYSTEM having three distinct states:
>>>>> 1) POPULATED
>>>>> 2) LIMBO (Or whatever we want to call it. No pages present)
>>>>> 3) SWAPPED.
>>>>>
>>>>> The ttm_bo_move_memcpy() helper understands these, and any 
>>>>> standalone driver implementation of the move() callback 
>>>>> _currently_ needs to understand these as well, unless using the 
>>>>> ttm_bo_move_memcpy() helper.
>>>>>
>>>>> Now using a bounce domain to proxy SYSTEM means that the driver 
>>>>> can forget about the SWAPPED state, it's automatically handled by 
>>>>> the move setup code. However, another pitfall is LIMBO, in that if 
>>>>> when you move from SYSTEM/LIMBO to your bounce domain, the BO will 
>>>>> be populated. So any naive accelerated move() implementation 
>>>>> creating a 1GB BO in fixed memory, like VRAM, will needlessly 
>>>>> allocate and free 1GB of system memory in the process instead of 
>>>>> just performing a clear operation. Looks like amdgpu suffers from 
>>>>> this?
>>>>>
>>>>> I think what is really needed is either
>>>>>
>>>>> a) A TTM helper that helps move callback implementations resolve 
>>>>> the issues populating system from LIMBO or SWAP, and then also 
>>>>> formalize driver notification for swapping. At a minimum, I think 
>>>>> the swap_notify() callback needs to be able to return a late error.
>>>>>
>>>>> b) Make LIMBO and SWAPPED distinct memory regions. (I think I'd 
>>>>> vote for this without looking into it in detail).
>>>>>
>>>>> In both these cases, we should really make SYSTEM bindable by GPU, 
>>>>> otherwise we'd just be trading one pitfall for another related 
>>>>> without really resolving the root problem.
>>>>>
>>>>> As for fencing not being supported by SYSTEM, I'm not sure why we 
>>>>> don't want this, because it would for example prohibit async 
>>>>> ttm_move_memcpy(), and also, async unbinding of ttm_tt memory like 
>>>>> MOB on vmgfx. (I think it's still sync).
>>>>>
>>>>> There might be an accounting issue related to this as well, but I 
>>>>> guess Christian would need to chime in on this. If so, I think it 
>>>>> needs to be well understood and documented (in TTM, not in AMD 
>>>>> drivers).
>>>>
>>>> I think the problem goes deeper than what has been mentioned here 
>>>> so far.
>>>>
>>>> Having fences attached to BOs in the system domain is probably ok, 
>>>> but the key point is that the BOs in the system domain are under 
>>>> TTMs control and should not be touched by the driver.
>>>>
>>>> What we have now is that TTMs internals like the allocation state 
>>>> of BOs in system memory (the populated, limbo, swapped you 
>>>> mentioned above) is leaking into the drivers and I think exactly 
>>>> that is the part which doesn't work reliable here. You can of 
>>>> course can get that working, but that requires knowledge of the 
>>>> internal state which in my eyes was always illegal.
>>>>
>>> Well, I tend to agree to some extent, but then, like said above even 
>>> disregarding swap will cause trouble with the limbo state, because 
>>> the driver's move callback would need knowledge of that to implement 
>>> moves limbo -> vram efficiently.
>>
>> Well my long term plan is to audit the code base once more and remove 
>> the limbo state from the SYSTEM domain.
>>
>> E.g. instead of a SYSTEM BO without pages you allocate a BO without a 
>> resource in general which is now possible since bo->resource is a 
>> pointer.
>>
>> This would still allow us to allocate "empty shell" BOs. But a 
>> validation of those BOs doesn't cause a move, but rather just 
>> allocates the resource for the first time.
>>
>> The problem so far was just that we access bo->resource way to often 
>> without checking it.
>
> So the driver would then at least need to be aware of these empty 
> shell bos without resource for their move callbacks? (Again thinking 
> of the move from empty shell -> VRAM).

My thinking goes more into the direction that this looks like a BO 
directly allocated in VRAM to the driver.

We could of course also make it a move, but of hand I don't see a reason 
for it.

Christian.

>
> Thanks,
>
> /Thomas
>
>

