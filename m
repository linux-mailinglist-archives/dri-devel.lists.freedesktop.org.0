Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FCB914798
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 12:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B37810E236;
	Mon, 24 Jun 2024 10:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O9xVPINS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB0310E236
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 10:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VB85SCMcG7XJWWzlE4gt8mnkh1r6pQiPgApidDfBrOowY2YxLde+IYwSzheKRM2HqF+Ow9tgsjUbd+FVsWYEJFBKt5jqQdh/iCxpy5P2kUq6XpAuPX7mhfHFR2Hg1XiTHPZVBm3R5J34CDbsz5VEcF68HAWDaUKCtCJP2nWN2S3tNA2gAMwT+Fym+ic9uHMAJBtk78QERY+p8MoC9WZ5W/Waq9wWBl9caGzkoosLEAOc+rG6ZTsxXYZoozOX0ZibUTxWv6u2pQbO7p8s/7OkTLmgDTOKW3/wxJ/grdYFJN09KMoffTjPWWeBfvvbAABk46hbA13sN0g0u8WqPeIv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbzD3V/66nZQ3M/6ArpdGiGLEZ49hxI717F2XEGElxI=;
 b=U5FgptFhcneNvRTaJozdQ2e1870niahk/r5lyoDwwiA07Sw1LfAq+NpVNrT9U8X7DvUGD/m2/HdfdRrsykDE6sRhxUq7FvzRBCjWq44oYEpkw98lWvUxcfCj8XgXLMz2MyNu/I7vWju+zEUlbsj7Dr6YSOJDLU+6U82guX6XsHW2EL/5NkFFWUWjlCSGDOcK44NfxRFVNYyiQRWO5/4cGkQeYMAIjlrRj7Ra94EykAo1G1XRW8ynaLCOhgBkVf28jr04D1BC/ousWqDPHYNYDA95XM/8Ym+o47PFg/40/WfX/C85Ad2lUwaxzrHT1EdOyVgGzhCwOitnS4qw9lFOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbzD3V/66nZQ3M/6ArpdGiGLEZ49hxI717F2XEGElxI=;
 b=O9xVPINSavF3vc2j4ng9nQIylhnXwp0mYtl2api0pkitBxhT3biRuGLTayL7GaDOqILb8/dhcbUxE7pkkZy2epd5s5pEvQi9BUTRFc1D48kiGvn6YUv8TNkmnzUwoOKqpMdsIaIl4GsoWmzjVCYr2LkhZL78Ro0Qoc/EXMZ4M+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Mon, 24 Jun
 2024 10:37:28 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7698.024; Mon, 24 Jun 2024
 10:37:27 +0000
Content-Type: multipart/alternative;
 boundary="------------9t0NtR9djMfyNaLS0YqqfPDG"
Message-ID: <fd1e3932-a582-4166-aa6f-7dddc7dea508@amd.com>
Date: Mon, 24 Jun 2024 16:07:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/12] Improve test coverage of TTM
To: "Somalapuram, Amaranath" <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
 <462151b9-be3a-4a77-8455-c879623ee1ab@intel.com>
 <f0158a5f-6f1b-1544-90c9-8d5f7bd3b981@amd.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <f0158a5f-6f1b-1544-90c9-8d5f7bd3b981@amd.com>
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|IA1PR12MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5dbd5d-90fe-4fa9-e705-08dc9439a477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c05YOEFOTXFGMzdwTU5qdG83Ly9qTE1JUXcxNzN2YWpYSVhaT3pyY2M1eVdM?=
 =?utf-8?B?K043ZjFrdjR3T082ZkRTRnVNdmIzZktOaU42aWxKNXh2dTFNbFBSODNFRDl6?=
 =?utf-8?B?UEY0MGtOYTZYa3JsclRmQnVHWTluWkUraDJOWXpVVlpsOWRUeWh1bHFSdUlt?=
 =?utf-8?B?RkZxdkRGbEM4QWxadHdreU9kQmFkcDVKNEV4SXdyeEsyaGdIVlNrL1NpMWZr?=
 =?utf-8?B?ajlKVVVKTGliOU9hZXpuNndPVHZqenVOTmVseVJhVGYxeHl4aUxrS0JTUnU1?=
 =?utf-8?B?OVlSQTlrd3g5MzdmMVhhb05KR0FuL2NZNE1CanRvcWhPSXJkRkw2bmhrTnpS?=
 =?utf-8?B?cmlWclBlVnI1bWlWRWNyeEhUN0lpSXRMNU9rUHhTckZWaS9aOWthMFE1b2Jh?=
 =?utf-8?B?bzZMQXpFaGFtZ1JDTlFqVjhVZlk3SDdTalA0YVRPL3dpRVFtYVQ5Tm4rWk91?=
 =?utf-8?B?ajJWMStVQy9TZkk2cEVHWkZncUZIbVlZOGhKbC9sUHI5RUk0SDNxOTZlczNZ?=
 =?utf-8?B?bkhEL203Y3ovZFBrM0lvd0VpeWRRUE5QRGJnV3BxL0p0UnRyZlpMVXF3SWQr?=
 =?utf-8?B?amxZTzZwOHJMeG1jOUNveVV2cHFCdnZoUTI2Ly9vY2poS2VpSVFqaHRVY1hw?=
 =?utf-8?B?VENaZmpkRDQrRHNhWkpqam91Vk1CcHBZdVZXS2c5RStxQ2lRZzBrZWxiWHJR?=
 =?utf-8?B?YVFzYkhnU3kzSnNDS0xIVXlYc1YvWTZ4ZHZtNEowdlVRRHJ2ak5lRXJrc3ZH?=
 =?utf-8?B?YlJnV2dRZTExcnlabEMvcGhpZ05NOWZxQlRsaU5VQktlSkxCU1NwQzdVRVhr?=
 =?utf-8?B?Z2xMWitQTHBnNnQzR0piN2dXQ1k2cTk3TFNja2p3M042T2tYTDNyTC9IRFZG?=
 =?utf-8?B?QTZPK1RnellnZnlQdURrdGw3dGJlN0s0N1lvVzY2OVJjd28wR2pqbzFMK1FK?=
 =?utf-8?B?NHByNDhUekpZWXhXdDFhaUgxdUhQTUNWTFJWeXBuKzJOTmR3K0F4dks0Lyt4?=
 =?utf-8?B?ZTVJVEQ3dXhKR2JQY0g1OTNLOWpZUGMwOW5UZlNXczVlY3dTSTV3c254ZXc2?=
 =?utf-8?B?M2doeTdRYkdVaUVIeDFZb3ZXcStWendqRkowZDdtanpSZ09Gd3ZabmplU0Fs?=
 =?utf-8?B?VnBpeExvem5rZElUaUxIRTNkNi95eGlOdXpqTWs2RmIyZ0c5dXJXMm5BdWND?=
 =?utf-8?B?MVVZdzd4SjZXWkp0ZjNLaHAwQjJ2b2lQV0ErYUU4dkh5eDJMaXZBcUQvaHFF?=
 =?utf-8?B?cXY1SVdkVFU2QnJIaExDM2lMaWVrZC9ZZldzZFFrUXBiZlYvQjJEcWF4OHE5?=
 =?utf-8?B?dlVaakNPTCt5c05SczEyWHNXeFI3S0YyalFIOUNFOS9iUzNTUkF3VlBZV09n?=
 =?utf-8?B?eWt3dzBpRHBzS1pETWdnQXAycHU1Ris5MStTVEdFNWE1QVV1anVlSmhxczdp?=
 =?utf-8?B?TVZtTzh0aFluYkhZdnhIMUdIbVl3UGlKUXJaNjlVRStha2tOcVdnZXF6cGhO?=
 =?utf-8?B?ckQ5MlQwMUMwTkdGREJBc1gza2Z2ZWQ3bXAyMXRYNzFYcVZJWm5GeGkwb3A0?=
 =?utf-8?B?Q2tqVUdaTmxGanFSdjV3bXhkRW5yQ2sxaG13OEdveldRR0lUMGdQazlWRmVK?=
 =?utf-8?B?a2V1MGJGTjZnc1pJaStGUktkbTB0MW5JUW9ta3ZFNW05bHJUcVk1YnN3bWJZ?=
 =?utf-8?Q?xRuPBXblF+1kG5PifHZ2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzdCQmNYN1UyOHArSURXL0s2T3FLblBxWkFjaUdxS2RYT1ZlMUdxaW1jbjVo?=
 =?utf-8?B?VnlNallwYmtJVVJLZjJ5bDlkUDA0YytqUGVtR3hPSXozcno5bEZNbU5UK0NH?=
 =?utf-8?B?YXZYZDg2MExmVW1DZTc3WjF5UVZJY1JHU285ZHpUZC9UT2NNQ2FjNnRFUlJZ?=
 =?utf-8?B?VW5GOE5yY0VHY2RXcnBZVUVYTFRZUzhDYklMbW9veGpOMS9SeUlYY3VSclAy?=
 =?utf-8?B?VjRvUE9vZk00OTg1Q2dHWlFQNWhjVFMrTTBKUHUvNENjVzNDS3E3bm9QZk1a?=
 =?utf-8?B?VFJIdDBKTlZEOFZSTnMyNnBPRmN0b0pNak1jNmJKMjhNVjRnZlhPM28yczcy?=
 =?utf-8?B?R0dTZ01uZDdMekNnQ0xhZnNkblNkTmJ3WmJsTVRCbHlYUkVFenNGZVlEengx?=
 =?utf-8?B?bkVPTGFJdUx5c2lZTHR3U1dvWjE4YVlyZlI3a3lBb203QjM5eFE2VjRzREhQ?=
 =?utf-8?B?bHF0V2hackg0cHM2cExlaDArbUYyclpTTVBhSXpQMEQxdjJoTi92am9kd29l?=
 =?utf-8?B?dnBOYzhZcDkxUHlHZkRSY1hUSGFPZWdFVHB1Y0M1U0hwYXdGaXdmSWphcnFa?=
 =?utf-8?B?djJsbXdJTC9UL3JYWU15SU52TTMyV0VxU1QycTI3SEJDaGwzOGU5NzdmamxF?=
 =?utf-8?B?d1p4Snd2Y1lIYUhZQmlQc0orM1A0SnR4OG5aVEVrVU4zV0Uydy9vKzgrSXN5?=
 =?utf-8?B?Q29jQnZaVnVYNjlRSXpMRHBTcU42by9PWWhvUkZ6R09CNVhvcGVMT2ZzSUh0?=
 =?utf-8?B?Q0Yra216em0zenJ4UVNsdmVIbGdORWZ4emdvNmlUcUZBWVlKa3plaHpSRC9t?=
 =?utf-8?B?Y0dIWmxleThPMkdlVTBnWkpPTVRFbkVhL2ZvUW56V0RzSWdTVklLNkdMbE9y?=
 =?utf-8?B?dDNHSUlsSjdBYlk0KzJ1WURiZWZoWVd4NTNXOTkwNGdpQjdsM1Uwem9CK2lK?=
 =?utf-8?B?a2dNUXJ5U0FtRUNxUVFXRy83VUhjZ1RQdWVYMkNFS0hQQlJTWWdOQURjWWFF?=
 =?utf-8?B?NG9xK29sa3hFREtpd3Zscnd5WmJkV3RRbXpWZTBIVEpyYjcrWENCdStReC83?=
 =?utf-8?B?b205WXE5bGkvRHpEZjR2eGdUOHJkRlJhRjhvQmFOaThRQUlCUC84Zi9YaDl5?=
 =?utf-8?B?UkJ1ZDc0Q0ZNbWY3MjdnVmJtRGdLTCtrbm5zclNxUkFKNHIxUDgwUmQwVllP?=
 =?utf-8?B?YVhWSkRWVEMyV2FvUWZLN1IxSDMxOUNvVE1KWkVac0RjRUtiMjNaZXFOeFJF?=
 =?utf-8?B?RjVRQUo0SWphSkpib0JFNUg2ZU11b25ZUUs2R2RnRXlKbGZlZ0dwQmNoN3ZI?=
 =?utf-8?B?Y09YNmJTQXAreklTN09oeUozWUpxRk5jT3ZFRXRtRU1lRjc0VjBNMWJkMUJ6?=
 =?utf-8?B?bHZqeDFhbW5TVkF1YXZRYU9VRHk0RFkwM3RCNzlXemRJamVSRGZXTldVYnk3?=
 =?utf-8?B?dGt3cUQxWUI1bXU2aDJzeVBIVjg4U2NWMEJPaTR5QVFwUWNXNnpaRkRrNnBv?=
 =?utf-8?B?WnNpNzExZ0dGdWF6RklpYmtQdDhrSnBaUGVlblNSNXN0T0NVYVlibGtmem9V?=
 =?utf-8?B?SEp0ZTMzTnhWUTU1YmNkbmZDaDJVQVUxc3BWWUw3cTFjaXd0eFlxTEd2Lysx?=
 =?utf-8?B?UVR1SEswYy9WSnF4Uklyall2aDI3NWdOd01MUWYwalE2WFM5dkFBVUxOUEJI?=
 =?utf-8?B?dXhGdXkrajN3UmpKYUlkZEZYUitZYlBHVEc5Z2kxZGhvaXVXU3h3dHArYWRQ?=
 =?utf-8?B?RzdzaCtncG9maW1VdnpOVU9iOFFVbXoyYmxrcHl4aXl6Y1dBSS9Bc0pnYVJQ?=
 =?utf-8?B?a3R1dDJlb01xOU9halNiT1FJSkZvRnkzRm12eDNFaFB6aVJNaGNUcXQyYnZr?=
 =?utf-8?B?UFczaDBMYlZ1dnBIeE9mVXNvenJJVzIvTkNhSUg1WjFvMHMzb2lvYmplTUh6?=
 =?utf-8?B?cnk3UzVwYXhCNW90a2VHcFl1aXhOWUkzQlR3bnIvTm0wM3phaW80UFZXSEEr?=
 =?utf-8?B?UHl5Sm8vWmgyUmsyeEZqcnNlMHh3SlNVT1cyUHk5MVorSVB1V2RzUG1JSkJD?=
 =?utf-8?B?MUI0WXpUc3NsY1pJQ3cwTU1NWXFmdE11bkhXQkVvY3ViVWMwcG00UDY1RitE?=
 =?utf-8?Q?C7EdS7KNEh3dIvBGGMwuLMAP0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5dbd5d-90fe-4fa9-e705-08dc9439a477
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 10:37:27.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPICpLdiBCuLP78lvvhEKGGsacK4bWNTqshyamEcWq4MkIWkP1/2O5IsIu4So4vloeI3dOu2gGQho1EHlvChTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664
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

--------------9t0NtR9djMfyNaLS0YqqfPDG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Amar,

I pushed all the patches into drm-misc-next.

Regards,
Arun.

On 6/21/2024 11:41 AM, Somalapuram, Amaranath wrote:
>
> Hi Arun,
>
> I still don't have commit permission. Can you please help to push this 
> patches.
>
> Regards,
> S.Amarnath
> On 6/20/2024 2:38 PM, Karolina Stolarek wrote:
>> Hi Christian and Amaranath,
>>
>> On 12.06.2024 14:02, Karolina Stolarek wrote:
>>> Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that 
>>> exercise
>>> simple BO placement as well as eviction (including the case where 
>>> the evict
>>> domain also requires eviction to fit the incoming buffer). Prepare 
>>> KUnit
>>> helpers to handle such scenarios and add a mock VRAM manager. This 
>>> series also
>>> includes some updates to the helpers and more definitions used to 
>>> define
>>> "special" memory domains (e.g., one that can't allocate resources or 
>>> is busy),
>>> as well as drive-by fixes for the tests.
>>>
>>> There are a couple of areas in which this test suite can be improved.
>>> Suggestions for future work can be found in the TODO file.
>>>
>>> Use kunit_tool script to manually run all the tests:
>>>
>>> $ ./tools/testing/kunit/kunit.py run 
>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>
>> I collected r-bs for all patches in the series, they apply cleanly on 
>> the top of drm-misc and drm-tip and all the tests pass[1]. Would it 
>> be possible to merge them?
>>
>> In other news, we enabled TTM KUnit tests in CI for Xe driver, the 
>> results can be seen on patchwork. For example:
>>
>> https://patchwork.freedesktop.org/series/134956/
>>
>> (see CI.KUnit step)
>>
>> All the best,
>> Karolina
>>
>> --------------------------------------------------------------
>> [1]:
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>> [10:49:50] Configuring KUnit Kernel ...
>> [10:49:50] Building KUnit Kernel ...
>> Populating config with:
>> $ make ARCH=um O=.kunit olddefconfig
>> Building with:
>> $ make ARCH=um O=.kunit --jobs=8
>> [10:49:53] Starting KUnit Kernel (1/1)...
>> [10:49:53] ============================================================
>> Running tests with:
>> $ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
>> [10:49:53] ================= ttm_device (5 subtests) ==================
>> [10:49:53] [PASSED] ttm_device_init_basic
>> [10:49:53] [PASSED] ttm_device_init_multiple
>> [10:49:53] [PASSED] ttm_device_fini_basic
>> [10:49:53] [PASSED] ttm_device_init_no_vma_man
>> [10:49:53] ================== ttm_device_init_pools ==================
>> [10:49:53] [PASSED] No DMA allocations, no DMA32 required
>> [10:49:53] [PASSED] DMA allocations, DMA32 required
>> [10:49:53] [PASSED] No DMA allocations, DMA32 required
>> [10:49:53] [PASSED] DMA allocations, no DMA32 required
>> [10:49:53] ============== [PASSED] ttm_device_init_pools ==============
>> [10:49:53] =================== [PASSED] ttm_device ====================
>> [10:49:53] ================== ttm_pool (8 subtests) ===================
>> [10:49:53] ================== ttm_pool_alloc_basic ===================
>> [10:49:53] [PASSED] One page
>> [10:49:53] [PASSED] More than one page
>> [10:49:53] [PASSED] Above the allocation limit
>> [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
>> [10:49:53] [PASSED] Above the allocation limit, with coherent DMA 
>> mappings enabled
>> [10:49:53] ============== [PASSED] ttm_pool_alloc_basic ===============
>> [10:49:53] ============== ttm_pool_alloc_basic_dma_addr ==============
>> [10:49:53] [PASSED] One page
>> [10:49:53] [PASSED] More than one page
>> [10:49:53] [PASSED] Above the allocation limit
>> [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
>> [10:49:53] [PASSED] Above the allocation limit, with coherent DMA 
>> mappings enabled
>> [10:49:53] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
>> [10:49:53] [PASSED] ttm_pool_alloc_order_caching_match
>> [10:49:53] [PASSED] ttm_pool_alloc_caching_mismatch
>> [10:49:53] [PASSED] ttm_pool_alloc_order_mismatch
>> [10:49:53] [PASSED] ttm_pool_free_dma_alloc
>> [10:49:53] [PASSED] ttm_pool_free_no_dma_alloc
>> [10:49:53] [PASSED] ttm_pool_fini_basic
>> [10:49:53] ==================== [PASSED] ttm_pool =====================
>> [10:49:53] ================ ttm_resource (8 subtests) =================
>> [10:49:53] ================= ttm_resource_init_basic =================
>> [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM
>> [10:49:53] [PASSED] Init resource in TTM_PL_VRAM
>> [10:49:53] [PASSED] Init resource in a private placement
>> [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
>> [10:49:53] ============= [PASSED] ttm_resource_init_basic =============
>> [10:49:53] [PASSED] ttm_resource_init_pinned
>> [10:49:53] [PASSED] ttm_resource_fini_basic
>> [10:49:53] [PASSED] ttm_resource_manager_init_basic
>> [10:49:53] [PASSED] ttm_resource_manager_usage_basic
>> [10:49:53] [PASSED] ttm_resource_manager_set_used_basic
>> [10:49:53] [PASSED] ttm_sys_man_alloc_basic
>> [10:49:53] [PASSED] ttm_sys_man_free_basic
>> [10:49:53] ================== [PASSED] ttm_resource ===================
>> [10:49:53] =================== ttm_tt (15 subtests) ===================
>> [10:49:53] ==================== ttm_tt_init_basic ====================
>> [10:49:53] [PASSED] Page-aligned size
>> [10:49:53] [PASSED] Extra pages requested
>> [10:49:53] ================ [PASSED] ttm_tt_init_basic ================
>> [10:49:53] [PASSED] ttm_tt_init_misaligned
>> [10:49:53] [PASSED] ttm_tt_fini_basic
>> [10:49:53] [PASSED] ttm_tt_fini_sg
>> [10:49:53] [PASSED] ttm_tt_fini_shmem
>> [10:49:53] [PASSED] ttm_tt_create_basic
>> [10:49:53] [PASSED] ttm_tt_create_invalid_bo_type
>> [10:49:53] [PASSED] ttm_tt_create_ttm_exists
>> [10:49:53] [PASSED] ttm_tt_create_failed
>> [10:49:53] [PASSED] ttm_tt_destroy_basic
>> [10:49:53] [PASSED] ttm_tt_populate_null_ttm
>> [10:49:53] [PASSED] ttm_tt_populate_populated_ttm
>> [10:49:53] [PASSED] ttm_tt_unpopulate_basic
>> [10:49:53] [PASSED] ttm_tt_unpopulate_empty_ttm
>> [10:49:53] [PASSED] ttm_tt_swapin_basic
>> [10:49:53] ===================== [PASSED] ttm_tt ======================
>> [10:49:53] =================== ttm_bo (14 subtests) ===================
>> [10:49:53] =========== ttm_bo_reserve_optimistic_no_ticket ===========
>> [10:49:53] [PASSED] Cannot be interrupted and sleeps
>> [10:49:53] [PASSED] Cannot be interrupted, locks straight away
>> [10:49:53] [PASSED] Can be interrupted, sleeps
>> [10:49:53] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
>> [10:49:53] [PASSED] ttm_bo_reserve_locked_no_sleep
>> [10:49:53] [PASSED] ttm_bo_reserve_no_wait_ticket
>> [10:49:53] [PASSED] ttm_bo_reserve_double_resv
>> [10:49:53] [PASSED] ttm_bo_reserve_interrupted
>> [10:49:53] [PASSED] ttm_bo_reserve_deadlock
>> [10:49:53] [PASSED] ttm_bo_unreserve_basic
>> [10:49:53] [PASSED] ttm_bo_unreserve_pinned
>> [10:49:53] [PASSED] ttm_bo_unreserve_bulk
>> [10:49:53] [PASSED] ttm_bo_put_basic
>> [10:49:53] [PASSED] ttm_bo_put_shared_resv
>> [10:49:53] [PASSED] ttm_bo_pin_basic
>> [10:49:53] [PASSED] ttm_bo_pin_unpin_resource
>> [10:49:53] [PASSED] ttm_bo_multiple_pin_one_unpin
>> [10:49:53] ===================== [PASSED] ttm_bo ======================
>> [10:49:53] ============== ttm_bo_validate (22 subtests) ===============
>> [10:49:53] ============== ttm_bo_init_reserved_sys_man ===============
>> [10:49:53] [PASSED] Buffer object for userspace
>> [10:49:53] [PASSED] Kernel buffer object
>> [10:49:53] [PASSED] Shared buffer object
>> [10:49:53] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
>> [10:49:53] ============== ttm_bo_init_reserved_mock_man ==============
>> [10:49:53] [PASSED] Buffer object for userspace
>> [10:49:53] [PASSED] Kernel buffer object
>> [10:49:53] [PASSED] Shared buffer object
>> [10:49:53] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
>> [10:49:53] [PASSED] ttm_bo_init_reserved_resv
>> [10:49:53] ================== ttm_bo_validate_basic ==================
>> [10:49:53] [PASSED] Buffer object for userspace
>> [10:49:53] [PASSED] Kernel buffer object
>> [10:49:53] [PASSED] Shared buffer object
>> [10:49:53] ============== [PASSED] ttm_bo_validate_basic ==============
>> [10:49:53] [PASSED] ttm_bo_validate_invalid_placement
>> [10:49:53] ============= ttm_bo_validate_same_placement ==============
>> [10:49:53] [PASSED] System manager
>> [10:49:53] [PASSED] VRAM manager
>> [10:49:53] ========= [PASSED] ttm_bo_validate_same_placement ==========
>> [10:49:53] [PASSED] ttm_bo_validate_failed_alloc
>> [10:49:53] [PASSED] ttm_bo_validate_pinned
>> [10:49:53] [PASSED] ttm_bo_validate_busy_placement
>> [10:49:53] ================ ttm_bo_validate_multihop =================
>> [10:49:53] [PASSED] Buffer object for userspace
>> [10:49:53] [PASSED] Kernel buffer object
>> [10:49:53] [PASSED] Shared buffer object
>> [10:49:53] ============ [PASSED] ttm_bo_validate_multihop =============
>> [10:49:53] ========== ttm_bo_validate_no_placement_signaled ==========
>> [10:49:53] [PASSED] Buffer object in system domain, no page vector
>> [10:49:53] [PASSED] Buffer object in system domain with an existing 
>> page vector
>> [10:49:53] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
>> [10:49:53] ======== ttm_bo_validate_no_placement_not_signaled ========
>> [10:49:53] [PASSED] Buffer object for userspace
>> [10:49:53] [PASSED] Kernel buffer object
>> [10:49:53] [PASSED] Shared buffer object
>> [10:49:53] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
>> [10:49:53] [PASSED] ttm_bo_validate_move_fence_signaled
>> [10:49:53] ========= ttm_bo_validate_move_fence_not_signaled =========
>> [10:49:53] [PASSED] Waits for GPU
>> [10:49:53] [PASSED] Tries to lock straight away
>> [10:49:53] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
>> [10:49:53] [PASSED] ttm_bo_validate_swapout
>> [10:49:53] [PASSED] ttm_bo_validate_happy_evict
>> [10:49:53] [PASSED] ttm_bo_validate_all_pinned_evict
>> [10:49:53] [PASSED] ttm_bo_validate_allowed_only_evict
>> [10:49:53] [PASSED] ttm_bo_validate_deleted_evict
>> [10:49:53] [PASSED] ttm_bo_validate_busy_domain_evict
>> [10:49:53] [PASSED] ttm_bo_validate_evict_gutting
>> [10:49:53] [PASSED] ttm_bo_validate_recrusive_evict
>> [10:49:53] ================= [PASSED] ttm_bo_validate =================
>> [10:49:53] ============================================================
>> [10:49:53] Testing complete. Ran 102 tests: passed: 102
>> [10:49:53] Elapsed time: 3.305s total, 0.002s configuring, 2.635s 
>> building, 0.572s running

--------------9t0NtR9djMfyNaLS0YqqfPDG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Amar,<br>
    <br>
    I pushed all the patches into drm-misc-next.<br>
    <br>
    Regards,<br>
    Arun.<br>
    <br>
    <div class="moz-cite-prefix">On 6/21/2024 11:41 AM, Somalapuram,
      Amaranath wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f0158a5f-6f1b-1544-90c9-8d5f7bd3b981@amd.com">
      
      <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;}
</style>
<![endif]--> </p>
      <p class="MsoPlainText">Hi Arun,</p>
      <p class="MsoPlainText">I still don't have commit permission. Can
        you please help to push this patches.</p>
      Regards,<br>
      S.Amarnath<br>
      <div class="moz-cite-prefix">On 6/20/2024 2:38 PM, Karolina
        Stolarek wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:462151b9-be3a-4a77-8455-c879623ee1ab@intel.com">Hi
        Christian and Amaranath, <br>
        <br>
        On 12.06.2024 14:02, Karolina Stolarek wrote: <br>
        <blockquote type="cite">Introduce tests for
          ttm_bo_validate()/ttm_bo_init_validate() that exercise <br>
          simple BO placement as well as eviction (including the case
          where the evict <br>
          domain also requires eviction to fit the incoming buffer).
          Prepare KUnit <br>
          helpers to handle such scenarios and add a mock VRAM manager.
          This series also <br>
          includes some updates to the helpers and more definitions used
          to define <br>
          &quot;special&quot; memory domains (e.g., one that can't allocate
          resources or is busy), <br>
          as well as drive-by fixes for the tests. <br>
          <br>
          There are a couple of areas in which this test suite can be
          improved. <br>
          Suggestions for future work can be found in the TODO file. <br>
          <br>
          Use kunit_tool script to manually run all the tests: <br>
          <br>
          $ ./tools/testing/kunit/kunit.py run
          --kunitconfig=drivers/gpu/drm/ttm/tests <br>
        </blockquote>
        <br>
        I collected r-bs for all patches in the series, they apply
        cleanly on the top of drm-misc and drm-tip and all the tests
        pass[1]. Would it be possible to merge them? <br>
        <br>
        In other news, we enabled TTM KUnit tests in CI for Xe driver,
        the results can be seen on patchwork. For example: <br>
        <br>
        <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/134956/" moz-do-not-send="true">https://patchwork.freedesktop.org/series/134956/</a>
        <br>
        <br>
        (see CI.KUnit step) <br>
        <br>
        All the best, <br>
        Karolina <br>
        <br>
        -------------------------------------------------------------- <br>
        [1]: <br>
        $ ./tools/testing/kunit/kunit.py run
        --kunitconfig=drivers/gpu/drm/ttm/tests <br>
        [10:49:50] Configuring KUnit Kernel ... <br>
        [10:49:50] Building KUnit Kernel ... <br>
        Populating config with: <br>
        $ make ARCH=um O=.kunit olddefconfig <br>
        Building with: <br>
        $ make ARCH=um O=.kunit --jobs=8 <br>
        [10:49:53] Starting KUnit Kernel (1/1)... <br>
        [10:49:53]
        ============================================================ <br>
        Running tests with: <br>
        $ .kunit/linux kunit.enable=1 mem=1G console=tty
        kunit_shutdown=halt <br>
        [10:49:53] ================= ttm_device (5 subtests)
        ================== <br>
        [10:49:53] [PASSED] ttm_device_init_basic <br>
        [10:49:53] [PASSED] ttm_device_init_multiple <br>
        [10:49:53] [PASSED] ttm_device_fini_basic <br>
        [10:49:53] [PASSED] ttm_device_init_no_vma_man <br>
        [10:49:53] ================== ttm_device_init_pools&nbsp;
        ================== <br>
        [10:49:53] [PASSED] No DMA allocations, no DMA32 required <br>
        [10:49:53] [PASSED] DMA allocations, DMA32 required <br>
        [10:49:53] [PASSED] No DMA allocations, DMA32 required <br>
        [10:49:53] [PASSED] DMA allocations, no DMA32 required <br>
        [10:49:53] ============== [PASSED] ttm_device_init_pools
        ============== <br>
        [10:49:53] =================== [PASSED] ttm_device
        ==================== <br>
        [10:49:53] ================== ttm_pool (8 subtests)
        =================== <br>
        [10:49:53] ================== ttm_pool_alloc_basic&nbsp;
        =================== <br>
        [10:49:53] [PASSED] One page <br>
        [10:49:53] [PASSED] More than one page <br>
        [10:49:53] [PASSED] Above the allocation limit <br>
        [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
        <br>
        [10:49:53] [PASSED] Above the allocation limit, with coherent
        DMA mappings enabled <br>
        [10:49:53] ============== [PASSED] ttm_pool_alloc_basic
        =============== <br>
        [10:49:53] ============== ttm_pool_alloc_basic_dma_addr&nbsp;
        ============== <br>
        [10:49:53] [PASSED] One page <br>
        [10:49:53] [PASSED] More than one page <br>
        [10:49:53] [PASSED] Above the allocation limit <br>
        [10:49:53] [PASSED] One page, with coherent DMA mappings enabled
        <br>
        [10:49:53] [PASSED] Above the allocation limit, with coherent
        DMA mappings enabled <br>
        [10:49:53] ========== [PASSED] ttm_pool_alloc_basic_dma_addr
        ========== <br>
        [10:49:53] [PASSED] ttm_pool_alloc_order_caching_match <br>
        [10:49:53] [PASSED] ttm_pool_alloc_caching_mismatch <br>
        [10:49:53] [PASSED] ttm_pool_alloc_order_mismatch <br>
        [10:49:53] [PASSED] ttm_pool_free_dma_alloc <br>
        [10:49:53] [PASSED] ttm_pool_free_no_dma_alloc <br>
        [10:49:53] [PASSED] ttm_pool_fini_basic <br>
        [10:49:53] ==================== [PASSED] ttm_pool
        ===================== <br>
        [10:49:53] ================ ttm_resource (8 subtests)
        ================= <br>
        [10:49:53] ================= ttm_resource_init_basic&nbsp;
        ================= <br>
        [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM <br>
        [10:49:53] [PASSED] Init resource in TTM_PL_VRAM <br>
        [10:49:53] [PASSED] Init resource in a private placement <br>
        [10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM, set
        placement flags <br>
        [10:49:53] ============= [PASSED] ttm_resource_init_basic
        ============= <br>
        [10:49:53] [PASSED] ttm_resource_init_pinned <br>
        [10:49:53] [PASSED] ttm_resource_fini_basic <br>
        [10:49:53] [PASSED] ttm_resource_manager_init_basic <br>
        [10:49:53] [PASSED] ttm_resource_manager_usage_basic <br>
        [10:49:53] [PASSED] ttm_resource_manager_set_used_basic <br>
        [10:49:53] [PASSED] ttm_sys_man_alloc_basic <br>
        [10:49:53] [PASSED] ttm_sys_man_free_basic <br>
        [10:49:53] ================== [PASSED] ttm_resource
        =================== <br>
        [10:49:53] =================== ttm_tt (15 subtests)
        =================== <br>
        [10:49:53] ==================== ttm_tt_init_basic&nbsp;
        ==================== <br>
        [10:49:53] [PASSED] Page-aligned size <br>
        [10:49:53] [PASSED] Extra pages requested <br>
        [10:49:53] ================ [PASSED] ttm_tt_init_basic
        ================ <br>
        [10:49:53] [PASSED] ttm_tt_init_misaligned <br>
        [10:49:53] [PASSED] ttm_tt_fini_basic <br>
        [10:49:53] [PASSED] ttm_tt_fini_sg <br>
        [10:49:53] [PASSED] ttm_tt_fini_shmem <br>
        [10:49:53] [PASSED] ttm_tt_create_basic <br>
        [10:49:53] [PASSED] ttm_tt_create_invalid_bo_type <br>
        [10:49:53] [PASSED] ttm_tt_create_ttm_exists <br>
        [10:49:53] [PASSED] ttm_tt_create_failed <br>
        [10:49:53] [PASSED] ttm_tt_destroy_basic <br>
        [10:49:53] [PASSED] ttm_tt_populate_null_ttm <br>
        [10:49:53] [PASSED] ttm_tt_populate_populated_ttm <br>
        [10:49:53] [PASSED] ttm_tt_unpopulate_basic <br>
        [10:49:53] [PASSED] ttm_tt_unpopulate_empty_ttm <br>
        [10:49:53] [PASSED] ttm_tt_swapin_basic <br>
        [10:49:53] ===================== [PASSED] ttm_tt
        ====================== <br>
        [10:49:53] =================== ttm_bo (14 subtests)
        =================== <br>
        [10:49:53] =========== ttm_bo_reserve_optimistic_no_ticket&nbsp;
        =========== <br>
        [10:49:53] [PASSED] Cannot be interrupted and sleeps <br>
        [10:49:53] [PASSED] Cannot be interrupted, locks straight away <br>
        [10:49:53] [PASSED] Can be interrupted, sleeps <br>
        [10:49:53] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket
        ======= <br>
        [10:49:53] [PASSED] ttm_bo_reserve_locked_no_sleep <br>
        [10:49:53] [PASSED] ttm_bo_reserve_no_wait_ticket <br>
        [10:49:53] [PASSED] ttm_bo_reserve_double_resv <br>
        [10:49:53] [PASSED] ttm_bo_reserve_interrupted <br>
        [10:49:53] [PASSED] ttm_bo_reserve_deadlock <br>
        [10:49:53] [PASSED] ttm_bo_unreserve_basic <br>
        [10:49:53] [PASSED] ttm_bo_unreserve_pinned <br>
        [10:49:53] [PASSED] ttm_bo_unreserve_bulk <br>
        [10:49:53] [PASSED] ttm_bo_put_basic <br>
        [10:49:53] [PASSED] ttm_bo_put_shared_resv <br>
        [10:49:53] [PASSED] ttm_bo_pin_basic <br>
        [10:49:53] [PASSED] ttm_bo_pin_unpin_resource <br>
        [10:49:53] [PASSED] ttm_bo_multiple_pin_one_unpin <br>
        [10:49:53] ===================== [PASSED] ttm_bo
        ====================== <br>
        [10:49:53] ============== ttm_bo_validate (22 subtests)
        =============== <br>
        [10:49:53] ============== ttm_bo_init_reserved_sys_man&nbsp;
        =============== <br>
        [10:49:53] [PASSED] Buffer object for userspace <br>
        [10:49:53] [PASSED] Kernel buffer object <br>
        [10:49:53] [PASSED] Shared buffer object <br>
        [10:49:53] ========== [PASSED] ttm_bo_init_reserved_sys_man
        =========== <br>
        [10:49:53] ============== ttm_bo_init_reserved_mock_man&nbsp;
        ============== <br>
        [10:49:53] [PASSED] Buffer object for userspace <br>
        [10:49:53] [PASSED] Kernel buffer object <br>
        [10:49:53] [PASSED] Shared buffer object <br>
        [10:49:53] ========== [PASSED] ttm_bo_init_reserved_mock_man
        ========== <br>
        [10:49:53] [PASSED] ttm_bo_init_reserved_resv <br>
        [10:49:53] ================== ttm_bo_validate_basic&nbsp;
        ================== <br>
        [10:49:53] [PASSED] Buffer object for userspace <br>
        [10:49:53] [PASSED] Kernel buffer object <br>
        [10:49:53] [PASSED] Shared buffer object <br>
        [10:49:53] ============== [PASSED] ttm_bo_validate_basic
        ============== <br>
        [10:49:53] [PASSED] ttm_bo_validate_invalid_placement <br>
        [10:49:53] ============= ttm_bo_validate_same_placement&nbsp;
        ============== <br>
        [10:49:53] [PASSED] System manager <br>
        [10:49:53] [PASSED] VRAM manager <br>
        [10:49:53] ========= [PASSED] ttm_bo_validate_same_placement
        ========== <br>
        [10:49:53] [PASSED] ttm_bo_validate_failed_alloc <br>
        [10:49:53] [PASSED] ttm_bo_validate_pinned <br>
        [10:49:53] [PASSED] ttm_bo_validate_busy_placement <br>
        [10:49:53] ================ ttm_bo_validate_multihop&nbsp;
        ================= <br>
        [10:49:53] [PASSED] Buffer object for userspace <br>
        [10:49:53] [PASSED] Kernel buffer object <br>
        [10:49:53] [PASSED] Shared buffer object <br>
        [10:49:53] ============ [PASSED] ttm_bo_validate_multihop
        ============= <br>
        [10:49:53] ========== ttm_bo_validate_no_placement_signaled&nbsp;
        ========== <br>
        [10:49:53] [PASSED] Buffer object in system domain, no page
        vector <br>
        [10:49:53] [PASSED] Buffer object in system domain with an
        existing page vector <br>
        [10:49:53] ====== [PASSED] ttm_bo_validate_no_placement_signaled
        ====== <br>
        [10:49:53] ======== ttm_bo_validate_no_placement_not_signaled&nbsp;
        ======== <br>
        [10:49:53] [PASSED] Buffer object for userspace <br>
        [10:49:53] [PASSED] Kernel buffer object <br>
        [10:49:53] [PASSED] Shared buffer object <br>
        [10:49:53] ==== [PASSED]
        ttm_bo_validate_no_placement_not_signaled ==== <br>
        [10:49:53] [PASSED] ttm_bo_validate_move_fence_signaled <br>
        [10:49:53] ========= ttm_bo_validate_move_fence_not_signaled&nbsp;
        ========= <br>
        [10:49:53] [PASSED] Waits for GPU <br>
        [10:49:53] [PASSED] Tries to lock straight away <br>
        [10:49:53] ===== [PASSED]
        ttm_bo_validate_move_fence_not_signaled ===== <br>
        [10:49:53] [PASSED] ttm_bo_validate_swapout <br>
        [10:49:53] [PASSED] ttm_bo_validate_happy_evict <br>
        [10:49:53] [PASSED] ttm_bo_validate_all_pinned_evict <br>
        [10:49:53] [PASSED] ttm_bo_validate_allowed_only_evict <br>
        [10:49:53] [PASSED] ttm_bo_validate_deleted_evict <br>
        [10:49:53] [PASSED] ttm_bo_validate_busy_domain_evict <br>
        [10:49:53] [PASSED] ttm_bo_validate_evict_gutting <br>
        [10:49:53] [PASSED] ttm_bo_validate_recrusive_evict <br>
        [10:49:53] ================= [PASSED] ttm_bo_validate
        ================= <br>
        [10:49:53]
        ============================================================ <br>
        [10:49:53] Testing complete. Ran 102 tests: passed: 102 <br>
        [10:49:53] Elapsed time: 3.305s total, 0.002s configuring,
        2.635s building, 0.572s running <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------9t0NtR9djMfyNaLS0YqqfPDG--
