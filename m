Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CC7DBE51
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 17:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101C10E0E9;
	Mon, 30 Oct 2023 16:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4313110E110;
 Mon, 30 Oct 2023 16:54:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+hwk6+RUm3RBxnPtRIrgb5/oOem8koJwIDouMGURwExQW0n7DzXr87GEeN0Zs2MqVYyXg6IZ2lJe0UYDm4/UN+TJPBNbHxdl4wvLJW0Ps5tNVzu/MkePndV+1yAD23M3iM7b+cGVCU6oi/b9QaANTtGyrpxKjP9MTk6f3pxmW6EIK4/8IdOIRRLssyJpbFRsH5TevmKQScHIq4DXQ2b+RtcWZ1W9HDbgi1Jt61q0mU0NKX1AyCMWdQROxDNCRXeRbtOYs2LtcmO39CMJ+gGT7dCLyu8xkevDvPBYLUbHhqHsnXlClyrnwtoEyq9MT9xZnuHPYAzDDIJj2H+zDUEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkGCn9dNz40ZlKnolDsdkEWtEmSkWCPpUl3Qb18sFmU=;
 b=WVVXK3YVKtaOmxSC0pFvGpyw8LhU/aI/TnbygpKWa0KyAWhBgV/ILUXmV04MMbtqmfkDgH7QNftGyz+xXmXRa+MAeP2Q883mouEEtid3kjV8KOR7abnTSa3+EtnE1h9yZZsXYIixKQigy5J0s/SeX4R6CcACqeAuzx2PoUTXsz8k5+AbhXewiUsTDsZhVZzzRK4GTVT6DsxIVLF6UpPBb1HtmlWKwTIec1doc1sTJRK3+Dz5AY/kw4pWMznVgAjOSV67gMnY6k0lx8/6ZHYM2QKaBlqHPq0+SuxRvs+ZrfjDpBDj8lBhxLj7SSjjKEdrWGvnw/qznTb//8toEvciuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkGCn9dNz40ZlKnolDsdkEWtEmSkWCPpUl3Qb18sFmU=;
 b=5s1WLtQI5pKhJGth7rHgzwr6H21Sk+5xXN8I5vBxBGu3kyqDAfDgIZab4EtqlaYsMEuHupffO5thUsOgI1VW0LU7d3mHz6RlErPfbJjaccEnLTxkh5Sy3bruDfVpi1Gj1sEyx+YcYXXKwo8xaV4nqNUNKoz2n/xL7sF5r1Qr7PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Mon, 30 Oct
 2023 16:54:01 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::33ed:3162:e4ed:3569%6]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 16:54:01 +0000
Message-ID: <1ce5a7ae-b38e-433b-8f73-4bfc95bfe9c3@amd.com>
Date: Mon, 30 Oct 2023 12:53:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove redundant check
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
References: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
 <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
 <3c228e4f69c01dddd4743bdb68845566@foxhound.fi>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <3c228e4f69c01dddd4743bdb68845566@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::35) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ca40d5-5fb2-42cd-c52e-08dbd968d107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQjyu1z65yAurG2K2ycxsQWYmxrryCuZrXAaI5EWSo02djgQuR+wDDoNWnb9pa/T3hI3V3FKKVVyU1JGn9pcUt6WxXbjE7pmz2jLNdQcHD2kj5OvskLj4pd0mH9PRd4+msNTdDHV1IRouU9nN0m1vTOLTQoz5PpSmpESuZXje2SAw9F70XW8b4wE3VcRkeMSCvRuPDq+a6qqOT4XGALWjar+oAyglmN1VzYY2M2O/zDJDyXorCdFnQloABeeKzJHMj0zM37qRWqchpJV1JEMvr4Z1zsqkUj8IvKzG+k+wGQ/5Z8QATTlfSswr0FVJ1Qg74Xkz31udXXFV00YcGiwz7IX0cdsK+lj7Y0JJ0agmA89zRFTfveL8FaYJJLBshWfr75lswYHA0ahFGRfWbOJt1riRMOD+G84o1KnUxPRbX2SeuV13wA3iG4bV5HUrK1arwG61DKRLA2+nmMgUYvB3g+AFXkrphZngyjTJxtgL+SAcr3GxC01P2YJ2PL24ZhApbKVboX4duKLMqjZ9VC9wBNbTywRvQ7PdlnqAh5EkEubpVxDo+713W8zqlASsF2anL9NKgFR6G+jNcq5ME7hGwLMq2gYtbzye4cHDsYbcPBe2uB1NWDaFZZAq4hmfiq4+HKXWLn41EikxbTrKxSApvry+em5lFEymb8H0UDAggfCg/lPRxyjSjBRN73ibffV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(64100799003)(1800799009)(31686004)(478600001)(6666004)(66946007)(6506007)(6486002)(83380400001)(36756003)(38100700002)(66556008)(4001150100001)(66476007)(2906002)(41300700001)(2616005)(26005)(6512007)(53546011)(44832011)(86362001)(31696002)(5660300002)(8676002)(4326008)(6916009)(8936002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDI2a3ExaU1CS2d0NVozL0NCVnJ6ZDIxdjNmMU9ac0pOTXJDMzhCT2NRTzRS?=
 =?utf-8?B?NnpXM0c3eE9DL1JYRklHYldTcE8reHhZVVBvYzFtMUJWWWwraGlMM3pPU1VR?=
 =?utf-8?B?UHBpQUk5bkthVnBYaUI2RmJPcWl4ZVdsSEF4NmpyaW8rTU5QUmVUTStyLytG?=
 =?utf-8?B?dlFab1NBYmRONGdOWit0Y3NTMUJBMUIwS1g1bVZyQTgvdEVpYlNBSGVVcmUx?=
 =?utf-8?B?c3JKekk5djNJbmVPcWE0UUxlYUs1RW5GR2VEbGtmYWh6ZU82aDlWcXNkT0lJ?=
 =?utf-8?B?SStpUzhhUWV6SjRZZlBUdXBoUGV5M05VNk9aczAraTZ1OHphUGtEMi81aURB?=
 =?utf-8?B?Z0pna1VmQVV2QUpEbjB2RTA3VGl6V3dxc1cwT1U3dDBZbWE4RGdxUjVxQTYy?=
 =?utf-8?B?cHFMZEdocjJmZmFGaGtmZ1BvL2wrTGNYdDZWb3AwTW9yUzVUTG5zcWhsL2d3?=
 =?utf-8?B?NE11L29peUx2aFMxcEdlU0lSeGx5bjZKdkd6YzhZTlhScTZGSVQrbThqVzJt?=
 =?utf-8?B?a1htMmZlY3Avc0FKc0cwMkxlRzROc01nWXBkdVE0ZEJ5VERheDJhbFE3b2E1?=
 =?utf-8?B?a0p3T1g1VFhFbzRhSkdZLzU1TGQzd3NRRWQ1RWFTTE5BR2RKT2FyQjE2Z0lU?=
 =?utf-8?B?UEcwbFdDT3oyRlpLRGRTNGlGNFNnRW5Pb2JVVzNYTWl4VVAvdks1Vk5PanJj?=
 =?utf-8?B?bEhvQ3lCb2pvRnRqQlJDTnE1T3NaaGtDdUJwVXdmYWdJbVlLbk5Sbm80U0NC?=
 =?utf-8?B?bHRhOGNhd1N0V0ZDMlNoMFpMRzRoajlaNG1EcWNaTms1ZXJzU055VzZsNlhi?=
 =?utf-8?B?TVVzSTJDL2tPSFBZS3ZkYWtnMU50SU1keVM5alM1SmVIWDc2a3luSk5Ibmcr?=
 =?utf-8?B?eHJKOXd1VXJuS0ErWlZ1NjRwbk1XbUxEWnd5NUdiMzFWdzRjN1Y0L3lvUFU3?=
 =?utf-8?B?b0JvbGxQNm5XT1hXR3l6aFBmSEorYlhDZGIrM1NnaWhMNE96bzZ0aWx2cXpG?=
 =?utf-8?B?Q0VGWjdmUlFCRzVGTFhoaHBCZHJ5NnE3c2h4NGszTlFEWU15cEExUlFoQk1n?=
 =?utf-8?B?NHU4b2NyZlY5YkJYSFdzVDNUa2EycUdudTFkNzczemJsZlRObGVoUVRXblBs?=
 =?utf-8?B?OEJwMWY4MURCejBRSWMxeXBzekZ6ZVJUNlFQWEtET0MyR1dQL3FtYjMySi9i?=
 =?utf-8?B?TXFZZVBRb3MzeFlTTU9iandrRlZPNEkxQkhiUFArY3RocTZER2RGS1B3amlD?=
 =?utf-8?B?REZ0L3REZnhhSVdrMFRZR0RsRkdPOWkvVWdpaFFuTUNPblNzMFY5a0phZjZk?=
 =?utf-8?B?SGs2a0FlRjZrTjh6YzM1VS9LbG9wSkJyNUUwcmFjSlZXbXlLUVVEdlB5YWF1?=
 =?utf-8?B?SVo1L0dTU3pPYUQ0YUZsaUhicGpaNGZPZm5oVCtRQXRHR05nUm9La3RRdVFa?=
 =?utf-8?B?ZGpuUmdncFYzNVdIa044RDByUG80T1FNSW9BeDRzd2wxdmsyVTA5aHNKNGNn?=
 =?utf-8?B?U1Vna05XSUMwckhLQlRiRjArMTllQmZIM084RU0wb1JFRldoM1dqMUh2ZEZl?=
 =?utf-8?B?R3RGM3ZtNXhmR25DOGI1MUlwdEdncTk0cHV1SDdFQTdNK25ybkZSNW5NT1Fq?=
 =?utf-8?B?cUtYYmxPOUlEV2VsU2lsbXE4bWpQVUdHZm1OTmtPbktNNVpVd2NVeWljeDhK?=
 =?utf-8?B?Q0xOMHVnWVUxbEEwejAzYXpHby9EbmdVQjJudUNLSXh1alZhZHp6Vy9ONGxR?=
 =?utf-8?B?VmdaRC82NnBWR241WDVPU1BYelZkSys3UUhQWHl0cWVlK2xBVi9sbEs4RkdE?=
 =?utf-8?B?TFBHMTJRaWl4aHk3dlRVR3pvUlBxSHVMYnNaT3A0ZEd0SllDNDNVamNNZ0Nu?=
 =?utf-8?B?MXIrdmJxdWhJWTJVaDYycjk0NVRUeldkS20xdzhHNjIzcWZDR004L2RXREpC?=
 =?utf-8?B?NXVQZlN1RkxGY1FndXc2dkI3WCt0cEpJejBXUStnMHhPWW5paTVwZHh3SzA2?=
 =?utf-8?B?TmsxTDkyVDJFUjltSDVtQXp3NEVHQ210dmo5YXNCODRRYXVFdzJBdW1CaW55?=
 =?utf-8?B?cm45aEpseVhHVXRITWhDU3VQUjQ3V0VDbHoyR011aVdRY0hIUGlGT0dBbkhl?=
 =?utf-8?Q?GqAyXjoUNzhYZAI71n3nINTB/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ca40d5-5fb2-42cd-c52e-08dbd968d107
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 16:54:01.2114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHo6Q+zTjRp8NNNNKX0EPZi6ey9imuMRFKmDWjYbxTRpDCe8VIAeyGkIaBoZNbPMtCi0+Y3Xi0BUkYwmQkln8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369
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
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, SyedSaaem.Rizvi@amd.com,
 amd-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 alexander.deucher@amd.com, Jun.Lei@amd.com, christian.koenig@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-30 12:26, José Pekkarinen wrote:
> On 2023-10-30 15:52, Aurabindo Pillai wrote:
>> On 10/29/2023 8:44 AM, José Pekkarinen wrote:
>>> This patch addresses the following warning spotted by
>>> using coccinelle where the case checked does the same
>>> than the else case.
>>>
>>> drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:8-10: WARNING: possible condition with no effect (if == else)
>>>
>>> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>>> ---
>>>   .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git 
>>> a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c 
>>> b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
>>> index ecea008f19d3..d940dfa5ae43 100644
>>> --- 
>>> a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
>>> +++ 
>>> b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
>>> @@ -4661,10 +4661,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
>>>       } else if (AllowForPStateChangeOrStutterInVBlankFinal == 
>>> dm_prefetch_support_uclk_fclk_and_stutter) {
>>>           *MinPrefetchMode = 0;
>>>           *MaxPrefetchMode = 0;
>>> -    } else if (AllowForPStateChangeOrStutterInVBlankFinal ==
>>> -            dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
>>> -        *MinPrefetchMode = 0;
>>> -        *MaxPrefetchMode = 3;
>>>       } else {
>>>           *MinPrefetchMode = 0;
>>>           *MaxPrefetchMode = 3;
>>
>> What tree did you use to generate the patch? On amd-staging-drm-next,
>> MaxPrefetchMode is 0 for the second last branch, which is the correct
>> one, so this patch isnt needed.
> 
>      I'm using the stable tree, sorry, if it is out of
> date just ignore it then.
> 
>      Thanks!
> 
>      José.
Actually, you're right - the patch's limited context mislead me, sorry.
But please add the following tag and sent it to stable@vger.kernel.org 
instead:

Fixes: 974ce181 ("drm/amd/display: Add check for PState change in DCN32")
