Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA792AC2D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 00:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12310E0BB;
	Mon,  8 Jul 2024 22:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4c5WrQal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41910E011;
 Mon,  8 Jul 2024 22:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYUEouYiQgRFxeN7IAlAgFwasSiD6ypTCiYUMg+5+Y9N6ZP8Std7WGuhmQ5RYeeXTtTlRh7Kv1VGIzEO6B8uUnstNror59eD3tA3t0GU6iB5WbkfNuag/FOIbLgtVdT516ZSaFMn2ClRlIlzRW2rkQbkoba8Z/Qa2ty4TLq7MlqWMeK45tEiXgHWZ8EcggiVezVm1K1iFqVBydsoh/FPmuXTWKs66wupDHTFSJCFnZdMTu8TVJQH02tnhvv/86pXG96iK9X8pjr+ol7mCykNgt5YFKyzc7x88ytjP/I7ESjSXu9exoIfo6Fd1DtGSx6HpNYZQyxC81/rYK2RswpHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv3mFuhq3FMZMPcHaTwfDyiFQcnW6kHiYNdHFQI925k=;
 b=YPxzKe7cQZMU+x3O7w7cMGbXm6PAZcfZbcC4lz+NY/oAewqRNFvu45LkJyEQyofy+XCJC45l0AcVKnM63teirck+ScHJo7Znims2dvQFg1JtXellleK2Up0CJj9I+Rc3YzOX5zkPp8R2lS8icGZxgWe+z71sWsbjecOTRMLebEVbfQAHdxDgA9DdHhdmt4bFYpIielcpX47EaP/qKdrNqG9OvmXT7aMNt5oievX2EQYUQI8tVIKIpoQLojgsZ4JRcezW7vFfvp137bnNVwWAAqyjjKXzQdJnfK8h4wmpJTU+1FG96gP+0qAhDmXVV2uvxHDz3pT69bJT064HltUTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv3mFuhq3FMZMPcHaTwfDyiFQcnW6kHiYNdHFQI925k=;
 b=4c5WrQalXVZmWK2M7jh+Yf1Tq5uGzHAMkhyq1DBNKGdnieeO9Q2jlKmLSUdoWqZG8MMwQ1B6v7DG25j0wvMrPkf+hxhOgKmhDxEltMK55mP0SPaqwmiHaegg1Rw5+mELJLVaMymDYJ4PNWEzqM99STPLlpK8tyFUu83FpK2QiGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 22:40:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:40:45 +0000
Message-ID: <29cab8f8-a544-4e5c-a87c-b7f4c31a1a64@amd.com>
Date: Mon, 8 Jul 2024 18:40:41 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_Re=EF=BC=9AProposal_to_add_CRIU_support_to_DRM_rend?=
 =?UTF-8?Q?er_nodes?=
To: =?UTF-8?B?5ZGo5pil5piOKOaXpeaciCk=?= <riyue.zcm@alibaba-inc.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 criu <criu@openvz.org>
Cc: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <235dda7b-7622-43f9-ab6f-6df13429092a.riyue.zcm@alibaba-inc.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <235dda7b-7622-43f9-ab6f-6df13429092a.riyue.zcm@alibaba-inc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: 784b16f1-c20e-476c-cef3-08dc9f9f012a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|3613699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1B6b2d5cmlIZmdhL1BUZTVKWEZjUzg5QmNTeC91eU5GVDM5eVRrcHM5TFd5?=
 =?utf-8?B?TXNtbUdSNlgxVTZuZHhlWDloTm8wZXhLZDREWnhqSUhHQ3lWT25qZ0E3UW9x?=
 =?utf-8?B?VXJsVlBtK0t6SER5MFRwc0ZOTGdoNU0rWkc1V0JLVXhjdEd4UWY1M0ZVVGlS?=
 =?utf-8?B?M3g1Vm9aRGI3TlAzbTd5ajkzWmczNEsxRTI1SE1XeDZaeEZselNuTlRhL0FD?=
 =?utf-8?B?RCt4dStuYVNja3JBRTlhNWI0OWR0VGRYZDNnNlgyRFgyb0g0UUs4WjUyNXRB?=
 =?utf-8?B?SnFXVFpJVkV5VVJ1cjRYWmI2SHNmWWRtdTRoSURNQzAydjdFN2duRE1lcmlJ?=
 =?utf-8?B?dFlxZm9qN0hSdGcvbFZKbzJSTm5EV2JXOHlwOTdNNUJ3VFlGaEpubmtxN2ww?=
 =?utf-8?B?cWMyQ0ovdjdXR0xPUjlVU1IzTlJlaHJ5eDdhRHc1aEhGT2twbEc1VjBqbWFG?=
 =?utf-8?B?RE1pamZGeU52VVF1LzJPVFlJcENpSmF2MXBqclk4REFKK1ZVYy9Rd0lqR0wz?=
 =?utf-8?B?bmtGS3o1VmVYSmZOSjAvNEdLSEpLK3pqU3VCZ2Zycko5QlNPMWlxMGdwWkV0?=
 =?utf-8?B?bWNyektaZ2hvdDVVOERLeUlWWHNLVy9WQmpQY2FuTjRyUEUrc3kwMUc4czZX?=
 =?utf-8?B?QXFNU3FialczVW1GZUV0TnpQM0lGT1lPcUtlM0JoZEYvMVpKMmVVdW5ha05k?=
 =?utf-8?B?dk5NcFdwYzFLbHc4MFQ1eXI2Y3VTNkF2UU14Z0YySUtPRXhtbG1xcGJ2VXB3?=
 =?utf-8?B?MldvTkx3Nkp0WlF4dEk4QnlGV2tCMm9wY2F1bHRoZmNhOVo3Qm1PNm5jSlVj?=
 =?utf-8?B?NmpTeU5wWmpUZ0IyaXFZLzJxNGFHM3N6RkxQM21neGRHOUNCOEE5aW5OSDBF?=
 =?utf-8?B?SDBHdkpFR3o3S05rWC8xVitmVU5JSnRYYXBxSjlYUFlUTXNLME53RE1VWHBD?=
 =?utf-8?B?alB4cmlWTnBFbnk5aDZtWVFTbmV0YkZXMncxL0NZTFBRa3o1d1JYV1hxbW9j?=
 =?utf-8?B?bXlXRUxtS2d2czFzZGxKRlJ3OW11Y3FvTTZTb09Uem9tbUIyVzBqbllYZDVQ?=
 =?utf-8?B?eWdjaHFuMlpHdXVacldZTFcxckZqRU5CdHlVREwwMmxQN1paRjV4TGt5NWNS?=
 =?utf-8?B?dHVYUFBqczgwY2hKRFkxZHI5M3V1cm14WjV4VkVJaGtmUUJ4bHJKd01Pbm4w?=
 =?utf-8?B?MkUwSGQ2cEx6TGNhUnZlODVuc2FhSDJCL0ViTXl2MitxN2llRHByYXZhdWxt?=
 =?utf-8?B?VFYzcXNCVkt0WHdINTlRa0Y0aTVsYStXb2dHbzl3Y01VRjNBUWczV2VwZGU4?=
 =?utf-8?B?SmRWNWNtRjVQc05MMStlL1dwQ0pjMWpQMlg2V0VzRHFyN2k2enZJMnA4S1Zz?=
 =?utf-8?B?cUZVSlcvS2tsMDJSOWlRMnFmaW1vSzRKbWg2VndWOFl0S3d5bENVTUdWUkNG?=
 =?utf-8?B?R1JkWVl2cDZtN0U2eDcwLzVwSnNDTk0wQWZHZFkvaW14Rk4rUWZuWC9WM2Qz?=
 =?utf-8?B?MHhrVlBYelV4VjlNSDRnU0x1V01ZUDB1dzB1SmprZ05FVTVHUENSNjFQTndX?=
 =?utf-8?B?cWUrTno4emdocW1NdlloQk1SekVFTlc1ZDBvVXE4RkpURTQ0eS9IQWlRUlBJ?=
 =?utf-8?B?VE5wclV0UXptY3M5YlhqNlVGc3hITjd5K3g4clVVZXgxaFk3WFZESFNjMVpw?=
 =?utf-8?B?L3VlUnNRME1WUnlva0NtWm5rMWVWMUNFTXprSHlKd1lnQlhWRFkrTE94cTli?=
 =?utf-8?B?Zlp3bE1sWUFvcHhnWVpBeGhCc0M4T1lvSkk5RzlHMjNCbmU3OWs2WGxFNnpt?=
 =?utf-8?Q?SvtWpPRzLU9uvzr0SZilpb++OMh+PKYnX2+ck=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3613699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUJCK3FaRTU4M002b0hRWjBOOGU2VEZpVzl3ajlIVCsyekJCTkhmbHVRWmFS?=
 =?utf-8?B?OUdRVjNrQVducHE2RW9hQWNPNU56N0hXUys5N0s4Q3RJdUVNTzRSckVxZmNS?=
 =?utf-8?B?VUNxR2hmMzdkZVBRdGpYRG1OSXJkdUJYWWJkeEExM09WSmNEVEpPeWUxUmdt?=
 =?utf-8?B?TllNQXJJOEY4eVR1QUFYSzE4QXZ0N3dpQWlrUlhNL055M2FlOENwWGVDc3Fa?=
 =?utf-8?B?b2dlRWhETE1WY2NPa3B0WkR1V2cwZ1ExWXM4dmhmeGkzTlhTQm9qeWl0L3Ba?=
 =?utf-8?B?VEhMcDJ3eEdrNHR0WEJyc200cjVvRSszWnFucnZHM3lzVUVNMUQ5VW9QNDAv?=
 =?utf-8?B?YklDbWF3ME54ZkVHYlJLOXBFUGczaXJidmk2ZUtWdzdoSk9yUmRPZ25qNEpU?=
 =?utf-8?B?czNvTHFsc0hvcWQ0aEtwVlV1ZE52bjB4a09YSnFwUzFpVUVPL3Z1R3NOL3dZ?=
 =?utf-8?B?M2hsdGZycmpTNm5TTEJQUWw4M1BYbUtPKy9tNEMvNHRRV1VvY3dZMGt3dkJv?=
 =?utf-8?B?ZUZWNkJhN2hJVXo4Mkx4d3VhbStNM3RIWHZkSlFGQi9PZGdDc1lzamJxdVBE?=
 =?utf-8?B?RzBUNFp5SU9KU2NLcDhwL09hK2cza1F4QWZDSVB5dlh1RVBHUkkxUVo2UkJG?=
 =?utf-8?B?UG1yV1Nyd28zUG11Qzl5YWRodWwwaFdiSXlmT0V3SVkvVHM0NDRwOTlxRWFY?=
 =?utf-8?B?VWNnUXBoSW5MdUQvaXFHOXZvQnUxYVppRWd6ZS8wYk1hL0lhT3ZTZlpTOXlG?=
 =?utf-8?B?UXErWFVlM2o3bTlxQnl1UUViTTFWZ3lDT2h5d3VGQUtrR0ltK2xnSGltbVla?=
 =?utf-8?B?UG43N3lpOUJrTFNIcnlnbTJoVUxadFRmeEE3OXp2UlJ5RitiUXFRdTdKcGV1?=
 =?utf-8?B?emRXbVJiM0hWZ3NnSElHS2NDYzBweDlsRHdhUWZRVmNJN3NRaWphSzZORnVn?=
 =?utf-8?B?N2d6djRUbFhOcjcxcjZCTkNaVnd4dDNJVG1DeDZIdytsQzB3Y2hHRG9Mam5t?=
 =?utf-8?B?K29zNTY5VW5UUEIybTdNYzdNVFhLTEcxNllxcjllK3ZmakFCd1lWTkhwSlI1?=
 =?utf-8?B?bS9YM0tsRUY2UktTNzVBMHJjU3RPWlJuQVJlc0J5K1NsWEVvaXR3L21LT0lh?=
 =?utf-8?B?MlIvOHRtQnlQY05Mb3c1MXorNUFkQTFzeUwvV1NYRVFJWlk1c0FHS0VOQ2lk?=
 =?utf-8?B?SlpPZTZyUDJ4eGl3MHUydjFyVXVGU2NKNzg5TGFOV2dWbklsVkVGNmN4REtX?=
 =?utf-8?B?bUhtU2xiK25qRVhrV1gvbUZ2TFpyZ0UvZ3pXeU53L2dQS29mN1p4bzB3aHNm?=
 =?utf-8?B?QmdJeXQ2WDJ1VnJFWVcxa3VuNXZDcGNQdmo3VXEvNVZNZmM0UkJpSXRsNHkx?=
 =?utf-8?B?QkZXU2VIRDhOUnREZ1lTQjliV0ltVlNIbE9NT2swN09Kci9CdnMyZlNGVDBs?=
 =?utf-8?B?L2taS2pSUEtPbE5tS0R1YmVZc3IySXVhOHAwWno3UVpSTm5FR1p5TUkzdXYv?=
 =?utf-8?B?Rm5PSnF3dlgvRzMzTmhuazJoMEpUM2J2M0lwMnljV0RkOTZmUy9XdTlKZlBj?=
 =?utf-8?B?aUwyQ3lvUGRsV1lPcCtreVo1VmN5MUNqdjFtTFBpdDBHMTMwdU5KUTY5eG0r?=
 =?utf-8?B?MXFJZnMzdXhWQWJ3eFZWSFhZb3JmaEtFdFdpazJCSU9XK2o4dEZPMGd4dHNG?=
 =?utf-8?B?VDhuS1o1QzRBM0RNb2FpTXJrRHNmdndkclBiL05IdDdtbTFRK0FtU0lDbXdy?=
 =?utf-8?B?bXJ2R2JTMVlJOXJPL1prcmt1R2M2THVRVGJ6TWp1SHhQMEt1SHFzUWkxM0g3?=
 =?utf-8?B?dVBxa1NsMFBMSlU0Q2V3ZlBoN0FXOW1sZE1mM25zNTVFYnFuc1AzNSt4bUVo?=
 =?utf-8?B?WHZLN000QmJZRFk3S0hBYWdrd3FjMlV6bXF0UGxHRWY1NEluOS9WOWxteDVs?=
 =?utf-8?B?MC9nMnVGSCtzWUQ4MkVsRWJtVDMycUlPWUlOTlFzWTNxbzYvMW9Id1ZhdkVz?=
 =?utf-8?B?aUJZS1dVV0Y5KytnNHFtNWpETGUxYXpFcDJ6NjBRK2pmT3J5SUtaLytvVjU1?=
 =?utf-8?B?VlB3WmxiUE5DS3AweEpCa0lKUlgrSnRnY1Uvd3lzT1MrVFdFOXVPNWI0RG5L?=
 =?utf-8?Q?N9AoKSIjaKSSkCJBJbpJscZfX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784b16f1-c20e-476c-cef3-08dc9f9f012a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:40:45.7709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6xRQcQFQ4g7vHjDuWRXcpFrk1yqgoyvpiTQGYNxw/ZVt5qsHkdZPk242W5AA3jPpXwpM1a2msWoielk7LkMLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
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


On 2024-07-08 2:51, 周春明(日月) wrote:
> 
> Hi Felix,
> 
> When I learn CRIU you introduced in https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu <https://github.com/checkpoint-restore/criu/tree/criu-dev/plugins/amdgpu> , there is a sentence
> "ROCm manages memory in the form of buffer objects (BOs). We are also working on a new memory management API that will be based on virtual address ranges...", 
> Out of curious, how about "new memory management based on virtual address ranges"? Any introduction for that?

Hi David,

This refers to the SVM API that has been in the upstream driver for a while now: https://elixir.bootlin.com/linux/v6.9.8/source/include/uapi/linux/kfd_ioctl.h#L732

Regards,
  Felix


> 
> Thanks,
> -David
> 
>     ------------------------------------------------------------------
>     发件人：Felix Kuehling <felix.kuehling@amd.com>
>     发送时间：2024年5月3日(星期五) 22:44
>     收件人：Tvrtko Ursulin <tursulin@ursulin.net>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Dave Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>; criu <criu@openvz.org>
>     抄　送："Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>; "Christian König" <christian.koenig@amd.com>
>     主　题：Re: Proposal to add CRIU support to DRM render nodes
> 
> 
> 
>     On 2024-04-16 10:04, Tvrtko Ursulin wrote:
>     >
>     > On 01/04/2024 18:58, Felix Kuehling wrote:
>     >>
>     >> On 2024-04-01 12:56, Tvrtko Ursulin wrote:
>     >>>
>     >>> On 01/04/2024 17:37, Felix Kuehling wrote:
>     >>>> On 2024-04-01 11:09, Tvrtko Ursulin wrote:
>     >>>>>
>     >>>>> On 28/03/2024 20:42, Felix Kuehling wrote:
>     >>>>>>
>     >>>>>> On 2024-03-28 12:03, Tvrtko Ursulin wrote:
>     >>>>>>>
>     >>>>>>> Hi Felix,
>     >>>>>>>
>     >>>>>>> I had one more thought while browsing around the amdgpu CRIU plugin. It appears it relies on the KFD support being compiled in and /dev/kfd present, correct? AFAICT at least, it relies on that to figure out the amdgpu DRM node.
>     >>>>>>>
>     >>>>>>> In would be probably good to consider designing things without that dependency. So that checkpointing an application which does not use /dev/kfd is possible. Or if the kernel does not even have the KFD support compiled in.
>     >>>>>>
>     >>>>>> Yeah, if we want to support graphics apps that don't use KFD, we should definitely do that. Currently we get a lot of topology information from KFD, not even from the /dev/kfd device but from the sysfs nodes exposed by KFD. We'd need to get GPU device info from the render nodes instead. And if KFD is available, we may need to integrate both sources of information.
>     >>>>>>
>     >>>>>>
>     >>>>>>>
>     >>>>>>> It could perhaps mean no more than adding some GPU discovery code into CRIU. Which shuold be flexible enough to account for things like re-assigned minor numbers due driver reload.
>     >>>>>>
>     >>>>>> Do you mean adding GPU discovery to the core CRIU, or to the plugin. I was thinking this is still part of the plugin.
>     >>>>>
>     >>>>> Yes I agree. I was only thinking about adding some DRM device discovery code in a more decoupled fashion from the current plugin, for both the reason discussed above (decoupling a bit from reliance on kfd sysfs), and then also if/when a new DRM driver might want to implement this the code could be move to some common plugin area.
>     >>>>>
>     >>>>> I am not sure how feasible that would be though. The "gpu id" concept and it's matching in the current kernel code and CRIU plugin - is that value tied to the physical GPU instance or how it works?
>     >>>>
>     >>>> The concept of the GPU ID is that it's stable while the system is up, even when devices get added and removed dynamically. It was baked into the API early on, but I don't think we ever fully validated device hot plug. I think the closest we're getting is with our latest MI GPUs and dynamic partition mode change.
>     >>>
>     >>> Doesn't it read the saved gpu id from the image file while doing restore and tries to open the render node to match it? Maybe I am misreading the code.. But if it does, does it imply that in practice it could be stable across reboots? Or that it is not possible to restore to a different instance of maybe the same GPU model installed in a system?
>     >>
>     >> Ah, the idea is, that when you restore on a different system, you may get different GPU IDs. Or you may checkpoint an app running on GPU 1 but restore it on GPU 2 on the same system. That's why we need to translate GPU IDs in restored applications. User mode still uses the old GPU IDs, but the kernel mode driver translates them to the actual GPU IDs of the GPUs that the process was restored on.
>     >
>     > I see.. I think. Normal flow is ppd->user_gpu_id set during client init, but for restored clients it gets overriden during restore so that any further ioctls can actually not instantly fail.
>     >
>     > And then in amdgpu_plugin_restore_file, when it is opening the render node, it relies on the kfd topology to have filled in (more or less) the target_gpu_id corresponding to the render node gpu id of the target GPU - the one associated with the new kfd gpu_id?
> 
>     Yes.
> 
>     >
>     > I am digging into this because I am trying to see if some part of GPU discovery could somehow be decoupled.. to offer you to work on at least that until you start to tackle the main body of the feature. But it looks properly tangled up.
> 
>     OK. Most of the interesting plugin code should be in amdgpu_plugin_topology.c. It currently has some pretty complicated logic to find a set of devices that matches the topology in the checkpoint, including shader ISA versions, numbers of compute units, memory sizes, firmware versions and IO-Links between GPUs. This was originally done to support P2P with XGMI links. I'm not sure we ever updated it to properly support PCIe P2P.
> 
> 
>     >
>     > Do you have any suggestions with what I could help with? Maybe developing some sort of drm device enumeration library if you see a way that would be useful in decoupling the device discovery from kfd. We would need to define what sort of information you would need to be queryable from it.
> 
>     Maybe. I think a lot of device information is available with some amdgpu info-ioctl. It may not cover all the things we're checking in the KFD topology, though.
> 
>     >
>     >>>> This also highlights another aspect on those spatially partitioned GPUs. GPU IDs identify device partitions, not devices. Similarly, each partition has its own render node, and the KFD topology info in sysfs points to the render-minor number corresponding to each GPU ID.
>     >>>
>     >>> I am not familiar with this. This is not SR-IOV but some other kind of partitioning? Would you have any links where I could read more?
>     >>
>     >> Right, the bare-metal driver can partition a PF spatially without SRIOV. SRIOV can also use spatial partitioning and expose each partition through its own VF, but that's not useful for bare metal. Spatial partitioning is new in MI300. There is some high-level info in this whitepaper: https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf <https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf>.
>     >
>     > From the outside (userspace) this looks simply like multiple DRM render nodes or how exactly?
> 
>     Yes, that's correct. Each partition has its own render node and its own node in the KFD topology.
> 
>     Regards,
>       Felix
> 
>     >
>     > Regards,
>     >
>     > Tvrtko
>     >
>     >>
>     >> Regards,
>     >>    Felix
>     >>
>     >>
>     >>>
>     >>> Regards,
>     >>>
>     >>> Tvrtko
>     >>>
>     >>>>>>> Otherwise I am eagerly awaiting to hear more about the design specifics around dma-buf handling. And also seeing how to extend to other DRM related anonymous fds.
>     >>>>>>
>     >>>>>> I've been pretty far under-water lately. I hope I'll find time to work on this more, but it's probably going to be at least a few weeks.
>     >>>>>
>     >>>>> Got it.
>     >>>>>
>     >>>>> Regards,
>     >>>>>
>     >>>>> Tvrtko
>     >>>>>
>     >>>>>>
>     >>>>>> Regards,
>     >>>>>>    Felix
>     >>>>>>
>     >>>>>>
>     >>>>>>>
>     >>>>>>> Regards,
>     >>>>>>>
>     >>>>>>> Tvrtko
>     >>>>>>>
>     >>>>>>> On 15/03/2024 18:36, Tvrtko Ursulin wrote:
>     >>>>>>>>
>     >>>>>>>> On 15/03/2024 02:33, Felix Kuehling wrote:
>     >>>>>>>>>
>     >>>>>>>>> On 2024-03-12 5:45, Tvrtko Ursulin wrote:
>     >>>>>>>>>>
>     >>>>>>>>>> On 11/03/2024 14:48, Tvrtko Ursulin wrote:
>     >>>>>>>>>>>
>     >>>>>>>>>>> Hi Felix,
>     >>>>>>>>>>>
>     >>>>>>>>>>> On 06/12/2023 21:23, Felix Kuehling wrote:
>     >>>>>>>>>>>> Executive Summary: We need to add CRIU support to DRM render nodes in order to maintain CRIU support for ROCm application once they start relying on render nodes for more GPU memory management. In this email I'm providing some background why we are doing this, and outlining some of the problems we need to solve to checkpoint and restore render node state and shared memory (DMABuf) state. I have some thoughts on the API design, leaning on what we did for KFD, but would like to get feedback from the DRI community regarding that API and to what extent there is interest in making that generic.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> We are working on using DRM render nodes for virtual address mappings in ROCm applications to implement the CUDA11-style VM API and improve interoperability between graphics and compute. This uses DMABufs for sharing buffer objects between KFD and multiple render node devices, as well as between processes. In the long run this also provides a path to moving all or most memory management from the KFD ioctl API to libdrm.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Once ROCm user mode starts using render nodes for virtual address management, that creates a problem for checkpointing and restoring ROCm applications with CRIU. Currently there is no support for checkpointing and restoring render node state, other than CPU virtual address mappings. Support will be needed for checkpointing GEM buffer objects and handles, their GPU virtual address mappings and memory sharing relationships between devices and processes.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Eventually, if full CRIU support for graphics applications is desired, more state would need to be captured, including scheduler contexts and BO lists. Most of this state is driver-specific.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> After some internal discussions we decided to take our design process public as this potentially touches DRM GEM and DMABuf APIs and may have implications for other drivers in the future.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> One basic question before going into any API details: Is there a desire to have CRIU support for other DRM drivers?
>     >>>>>>>>>>>
>     >>>>>>>>>>> This sounds like a very interesting feature on the overall, although I cannot answer on the last question here.
>     >>>>>>>>>>
>     >>>>>>>>>> I forgot to finish this thought. I cannot answer / don't know of any concrete plans, but I think feature is pretty cool and if amdgpu gets it working I wouldn't be surprised if other drivers would get interested.
>     >>>>>>>>>
>     >>>>>>>>> Thanks, that's good to hear!
>     >>>>>>>>>
>     >>>>>>>>>
>     >>>>>>>>>>
>     >>>>>>>>>>> Funnily enough, it has a tiny relation to an i915 feature I recently implemented on Mesa's request, which is to be able to "upload" the GPU context from the GPU hang error state and replay the hanging request. It is kind of (at a stretch) a very special tiny subset of checkout and restore so I am not mentioning it as a curiosity.
>     >>>>>>>>>>>
>     >>>>>>>>>>> And there is also another partical conceptual intersect with the (at the moment not yet upstream) i915 online debugger. This part being in the area of discovering and enumerating GPU resources beloning to the client.
>     >>>>>>>>>>>
>     >>>>>>>>>>> I don't see an immediate design or code sharing opportunities though but just mentioning.
>     >>>>>>>>>>>
>     >>>>>>>>>>> I did spend some time reading your plugin and kernel implementation out of curiousity and have some comments and questions.
>     >>>>>>>>>>>
>     >>>>>>>>>>>> With that out of the way, some considerations for a possible DRM CRIU API (either generic of AMDGPU driver specific): The API goes through several phases during checkpoint and restore:
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Checkpoint:
>     >>>>>>>>>>>>
>     >>>>>>>>>>>>  1. Process-info (enumerates objects and sizes so user mode can allocate
>     >>>>>>>>>>>>     memory for the checkpoint, stops execution on the GPU)
>     >>>>>>>>>>>>  2. Checkpoint (store object metadata for BOs, queues, etc.)
>     >>>>>>>>>>>>  3. Unpause (resumes execution after the checkpoint is complete)
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Restore:
>     >>>>>>>>>>>>
>     >>>>>>>>>>>>  1. Restore (restore objects, VMAs are not in the right place at this time)
>     >>>>>>>>>>>>  2. Resume (final fixups after the VMAs are sorted out, resume execution)
>     >>>>>>>>>>>
>     >>>>>>>>>>> Btw is check-pointing guaranteeing all relevant activity is idled? For instance dma_resv objects are free of fences which would need to restored for things to continue executing sensibly? Or how is that handled?
>     >>>>>>>>>
>     >>>>>>>>> In our compute use cases, we suspend user mode queues. This can include CWSR (compute-wave-save-restore) where the state of in-flight waves is stored in memory and can be reloaded and resumed from memory later. We don't use any fences other than "eviction fences", that are signaled after the queues are suspended. And those fences are never handed to user mode. So we don't need to worry about any fence state in the checkpoint.
>     >>>>>>>>>
>     >>>>>>>>> If we extended this to support the kernel mode command submission APIs, I would expect that we'd wait for all current submissions to complete, and stop new ones from being sent to the HW before taking the checkpoint. When we take the checkpoint in the CRIU plugin, the CPU threads are already frozen and cannot submit any more work. If we wait for all currently pending submissions to drain, I think we don't need to save any fence state because all the fences will have signaled. (I may be missing some intricacies and I'm afraid it may not be that simple in reality, but that's my opening bid. ;)
>     >>>>>>>>
>     >>>>>>>> It feels feasible to me too, for the normally behaving clients at least.
>     >>>>>>>>
>     >>>>>>>> Presumably, given that the whole checkpointing is not instant, it would be okay to wait a second or two longer for the in-progress submissions complete. After which kernel would need to prune all signalled fences from the respective container objects before checkpointing.
>     >>>>>>>>
>     >>>>>>>> For the "misbehaving" clients who have perhaps queued up too much work, either still in the scheduler with unsatisfied dependencies, or already submitted to the hardware and/or driver backend, is there a timeout concept in CRIU so it would be possible to say something like "try to checkpoint but if the kernel says no time period t then give up"?
>     >>>>>>>>
>     >>>>>>>>>>>> For some more background about our implementation in KFD, you can refer to this whitepaper: https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md <https://github.com/checkpoint-restore/criu/blob/criu-dev/plugins/amdgpu/README.md>
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Potential objections to a KFD-style CRIU API in DRM render nodes, I'll address each of them in more detail below:
>     >>>>>>>>>>>>
>     >>>>>>>>>>>>   * Opaque information in the checkpoint data that user mode can't
>     >>>>>>>>>>>>     interpret or do anything with
>     >>>>>>>>>>>>   * A second API for creating objects (e.g. BOs) that is separate from
>     >>>>>>>>>>>>     the regular BO creation API
>     >>>>>>>>>>>>   * Kernel mode would need to be involved in restoring BO sharing
>     >>>>>>>>>>>>     relationships rather than replaying BO creation, export and import
>     >>>>>>>>>>>>     from user mode
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> # Opaque information in the checkpoint
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> This comes out of ABI compatibility considerations. Adding any new objects or attributes to the driver/HW state that needs to be checkpointed could potentially break the ABI of the CRIU checkpoint/restore ioctl if the plugin needs to parse that information. Therefore, much of the information in our KFD CRIU ioctl API is opaque. It is written by kernel mode in the checkpoint, it is consumed by kernel mode when restoring the checkpoint, but user mode doesn't care about the contents or binary layout, so there is no user mode ABI to break. This is how we were able to maintain CRIU support when we added the SVM API to KFD without changing the CRIU plugin and without breaking our ABI.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Opaque information may also lend itself to API abstraction, if this becomes a generic DRM API with driver-specific callbacks that fill in HW-specific opaque data.
>     >>>>>>>>>>>
>     >>>>>>>>>>> This feels sound in principle to me. Fundamentally the state is very hardware specfic, and/or driver version specific, so I don't see anything could be gained in practice by making it much less opaque. (Apart from making things more complicated.)
>     >>>>>>>>>>>
>     >>>>>>>>>>> I was however unsure of the current split of how you dump buffer objects with some data in the defined bo structure, and some in completely opaque private data. Is there a benefit to that split, or maybe in other words, is there a benefit on having part transparent and part opaque for buffer objects?
>     >>>>>>>>>
>     >>>>>>>>> Some of the buffer object state is needed by the plugin. E.g. the size and mmap offset are needed to match VMAs with BOs. I'd have to review the plugin in detail to prove that all the fields are, in fact, needed by the plugin, but that was the intent. Anything that the plugin doesn't need to know should be in the opaque data structures.
>     >>>>>>>>
>     >>>>>>>> Right, got it.
>     >>>>>>>>
>     >>>>>>>> Would it make sense to make the opaque data in the same block as the defined one? I mean instead of separating the two in the binary image for instance have struct kfd_criu_bo_bucket have a trailing priv_data blob? Maybe it is too late now if the image format is not versioned or something.
>     >>>>>>>>
>     >>>>>>>>>>> To slightly touch upon the question of whether this could become a generic DRM API. It feels it would be hard to do it from the start. What sounds more feasible is if/when generic looking helpers can be spotted while developing the RFC then potentially structure the code they can easily be promoted to shared/common at some future moment.
>     >>>>>>>>>
>     >>>>>>>>> Yes, that's how this usually goes, in my experience. Thanks for confirming.
>     >>>>>>>>>
>     >>>>>>>>>
>     >>>>>>>>>>>
>     >>>>>>>>>>>> # Second API for creating objects
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Creating BOs and other objects when restoring a checkpoint needs more information than the usual BO alloc and similar APIs provide. For example, we need to restore BOs with the same GEM handles so that user mode can continue using those handles after resuming execution. If BOs are shared through DMABufs without dynamic attachment, we need to restore pinned BOs as pinned. Validation of virtual addresses and handling MMU notifiers must be suspended until the virtual address space is restored. For user mode queues we need to save and restore a lot of queue execution state so that execution can resume cleanly.
>     >>>>>>>>>>>
>     >>>>>>>>>>> This also sounds justified to me. Restore creating all internal objects is definitely special and sounds better to add uapi to create them directly with the correct properties, than to add uapi to adjust internal properties after creation. And in case you would always need some new uapi - so at least to adjust after creation. At which point you may have both in one. Internally implementation can be split or common, whatever makes sense for a given object type, but new uapi definitely sounds is required.
>     >>>>>>>>>>>> # Restoring buffer sharing relationships
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> Different GEM handles in different render nodes and processes can refer to the same underlying shared memory, either by directly pointing to the same GEM object, or by creating an import attachment that may get its SG tables invalidated and updated dynamically through dynamic attachment callbacks. In the latter case it's obvious, who is the exporter and who is the importer. In the first case, either one could be the exporter, and it's not clear who would need to create the BO and who would need to
>     >>>>>>>>>>>
>     >>>>>>>>>>> To see if I follow the former case correctly.
>     >>>>>>>>>>>
>     >>>>>>>>>>> This could be two clients A and B, where B has imported a dma-buf shared BO from A and has since closed the dma-buf fd? Which results in a single BO with reference count of 2 and obj->import_attach unset. History of who created the object is lost.
>     >>>>>>>>>
>     >>>>>>>>> Yes. In the amdgpu driver this happens when the exporter and import device are the same.
>     >>>>>>>>>
>     >>>>>>>>>
>     >>>>>>>>>>>
>     >>>>>>>>>>> In fact it could even be that two imported objects remain (clients A, B and C) and A, who originally created the BO, has since fully released it. So any kind of "creator" tracking if added wouldn't be fully reliable either.
>     >>>>>>>>>
>     >>>>>>>>> That's a good point.
>     >>>>>>>>>
>     >>>>>>>>>
>     >>>>>>>>>>>
>     >>>>>>>>>>>> import it when restoring the checkpoint. To further complicate things, multiple processes in a checkpoint get restored concurrently. So there is no guarantee that an exporter has restored a shared BO at the time an importer is trying to restore its import.
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> A proposal to deal with these problems would be to treat importers and exporters the same. Whoever restores first, ends up creating the BO and potentially attaching to it. The other process(es) can find BOs that were already restored by another process by looking it up with a unique ID that could be based on the DMABuf inode number. An alternative would be a two-pass approach that needs to restore BOs on two passes:
>     >>>>>>>>>>>>
>     >>>>>>>>>>>>  1. Restore exported BOs
>     >>>>>>>>>>>>  2. Restore imports
>     >>>>>>>>>>>>
>     >>>>>>>>>>>> With some inter-process synchronization in CRIU itself between these two passes. This may require changes in the core CRIU, outside our plugin. Both approaches depend on identifying BOs with some unique ID that could be based on the DMABuf inode number in the checkpoint. However, we would need to identify the processes in the same restore session, possibly based on parent/child process relationships, to create a scope where those IDs are valid during restore.
>     >>>>>>>>>>>
>     >>>>>>>>>>> If my understanding above is on the right track, then I think this is the only thing which can be done (for all scenarios).
>     >>>>>>>>>
>     >>>>>>>>> I presented two alternatives. I think you're in favor of the first one, where it doesn't matter who is the importer and exporter. I think the two-pass approach requires that you can identify an exporter. And as you pointed out, the exporter may already have dropped their reference to the BO.
>     >>>>>>>>
>     >>>>>>>> Yep.
>     >>>>>>>>
>     >>>>>>>>>>> I also *think* it would be safe. At least at the moment I cannot think what could go wrong. Semantics are that it doesn't really matter who created the object.
>     >>>>>>>>>
>     >>>>>>>>> I would agree. What matters is that the object is recreated on the correct device, and that all the direct references and import attachments pointing to it are restored.
>     >>>>>>>>>
>     >>>>>>>>>
>     >>>>>>>>>>>
>     >>>>>>>>>>>> Finally, we would also need to checkpoint and restore DMABuf file descriptors themselves. These are anonymous file descriptors. The CRIU plugin could probably be taught to recreate them from the original exported BO based on the inode number that could be queried with fstat in the checkpoint. It would need help from the render node CRIU API to find the right BO from the inode, which may be from a different process in the same restore session.
>     >>>>>>>>>>>
>     >>>>>>>>>>> This part feels like it is breaking the component separation a bit because even for buffers fully owned by amdgpu, strictly speaking the dma-buf fd is not. At least my understanding from the above is that you propose to attempt to import the fd, from the kernel side, during the checkpoint process? Like:
>     >>>>>>>>>>>
>     >>>>>>>>>>> Checkpoint:
>     >>>>>>>>>>>
>     >>>>>>>>>>> CRIU for each anon fd:
>     >>>>>>>>>>>    amdgpu_plugin(fd)
>     >>>>>>>>>>>      -> attempt in kernel dma buf import (passes fd to kernel via ioctl?)
>     >>>>>>>>>>>          -> is it ours? (no -> error)
>     >>>>>>>>>>>              -> create a record mapping fd number to amdgpu BO
>     >>>>>>>>>>>
>     >>>>>>>>>>> Restore:
>     >>>>>>>>>>>
>     >>>>>>>>>>> for each dma-buf fd record:
>     >>>>>>>>>>>     create BO if does not exists
>     >>>>>>>>>>>     export BO to same fd
>     >>>>>>>>>>>     close BO handle if not in regular BO handle records
>     >>>>>>>>>>>
>     >>>>>>>>>>> Or since you mention lookup by inode, that would need to be dmabuf_plugin so it can lookup inodes in the private mount space. However how would it co-operate with amdgpu_plugin is not clear to me.
>     >>>>>>>>>
>     >>>>>>>>> The way I think about the ownership is, whichever driver created the underlying BO owns the checkpointing of the dmabuf. You need driver-specific information to link the dmabuf with the driver's BO and you need the right driver to recreate the BO and the dmabuf fd when restoring the checkpoint.
>     >>>>>>>>>
>     >>>>>>>>> It gets really interesting if you have an amdgpu plugin and an i915 plugin, and they checkpoint an application that shares BOs between the two devices through DMABufs. E.g. if i915 created a BO and amdgpu imported it, then during restore, i915 needs to restore the dmabuf before the amdgpu import of it can be restored. I think that brings us back to a two-phase approach to restoring the memory sharing relationships. Uff.
>     >>>>>>>>
>     >>>>>>>> I think this part of the discussion somewhat depends on the previous part about idling. If it is feasible to completely idle and prune, and fail if that is not happening quickly enough, then maybe there wouldn't be too much hierarchical state to save.
>     >>>>>>>>
>     >>>>>>>> Otherwise my idea was that there is a top-level drm_plugin.so which understands amdgpu fds, i915, syncobj, sync_file, and uses some new uapi to uniquely identify each, associate with the correct driver, and then internally dispatches to amdgpu|i915|dmabuf|..._plugin.so. Building the in memory representation of their relationships. As long as all objects and their relationships have been recorded I think everything could then be correctly restored.
>     >>>>>>>>
>     >>>>>>>> It is possible there is flaw in my thinking and that something in CRIU design would make this impossible? I think it would require the top-level drm_plugin.so to hold all state in memory until the whole checkpointing is done, and then verify something is not incomplete, failing it all if it was. (For instance one plugin discovered an reference to an object which was not discoverd by any other plugin or things like that.) May need some further tweaks to CRIU common code.
>     >>>>>>>>
>     >>>>>>>> Maybe I need to better understand how exactly you mean to query the DRM driver about random anonymous fds. I see it as a problem in the design, possibly even implementation, but maybe I am missing something which makes it not so. I mean even with my general idea I don't know how would one determine which driver to query about a particular anonymous inode.
>     >>>>>>>>
>     >>>>>>>>>> I later also realised that I was maybe increasing the scope for you here. :) You did state focus is ROCm applications which possibly doesn't care about dma-resv, fences, syncobjs etc?
>     >>>>>>>>>
>     >>>>>>>>> That's my focus for now. But I don't want to engineer a solution that would preclude your use cases in the future.
>     >>>>>>>>>
>     >>>>>>>>>
>     >>>>>>>>>>
>     >>>>>>>>>> But I think the "how to handle dma-bufs" design question is still relevant and interesting. For example I had this thought that perhaps what would be needed is a CRIU plugin hierarchy.
>     >>>>>>>>>>
>     >>>>>>>>>> Because fundamentally we would be snapshoting a hierarcy of kernel objects belonging to different drivers (kfd, amdgpu, dma-buf, ...). And if one day someone would to try to handle dma fences and drm syncobjs, the argument for a hierarchial design would be even stronger I think.
>     >>>>>>>>>>
>     >>>>>>>>>> Something like a drm_plugin.so could call sub-plugins (amdgpu, dma-buf, sync file, ...) and internally build the representation of the whole state and how the relationship between the objects.
>     >>>>>>>>>
>     >>>>>>>>> Maybe. I guess a structure similar to libdrm makes sense. I'm not sure it's strictly a hierarchy. Maybe more like some common code shared by multiple GPU driver plugins. I think the common checkpoint state is quite limited and restoring it requires the GPU-specific drivers anyway.
>     >>>>>>>>>
>     >>>>>>>>> Also the idea of building a representation of the whole state doesn't work well with the CRIU design, because "the whole state" can include multiple processes that restore themselves concurrently and only synchronize with each other in a few places in the restore process. I feel, if we can work out how to checkpoint and restore shared objects between processes, we can do the same for shared objects between drivers without imposing a strict hierarchy and some omniscient entity that needs to know "the whole state".
>     >>>>>>>>
>     >>>>>>>> Okay, this continues on the same problem space as above. And you obviously know how CRIU works much better than me.
>     >>>>>>>>
>     >>>>>>>>>> With that kind of design there probably would be a need to define some common kernel side api and uapi, so all involved objects can be enumerated with some unique ids etc.
>     >>>>>>>>>>
>     >>>>>>>>>> Now.. the counter argument.. the more state from different drivers would one want to handle the bigger this project would get. Would it even be feasible is the question, to the point that it may be simpler to just run the workload in a VM via SR-IOV and simply hibernate the whole thin guest. :)
>     >>>>>>>>>
>     >>>>>>>>> Well, CRIU kind of tries to do that, but with containers instead of VMs. ;)
>     >>>>>>>>
>     >>>>>>>> It would definitely be useful for hardware and drivers without SR-IOV support so lets hope it is doable. :)
>     >>>>>>>>
>     >>>>>>>> Regards,
>     >>>>>>>>
>     >>>>>>>> Tvrtko
