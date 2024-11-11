Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF29C3D2A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 12:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239F10E405;
	Mon, 11 Nov 2024 11:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kwZLWlWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1810E00B;
 Mon, 11 Nov 2024 11:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXcPMjVbou4CbiWax+Zz/dWAZnRocmGNhoURDjCegcD9kiDevs+cbv9RVaud4tPszhbqkyYdhf/NcLF6KqefuMOLodRi0+A5aQBUUK0HwW4YnC+eZ6fdqas7a0GYcCW1XQWV8lSpAhPsGzu+ql5aOScJhhF5A+eyJ5IpNT+ufdPH0QHZHhhlI6+Ej+2HWt6/9yS3bhqu+ZkWFP/6Qijzuq6CZudwg1ArdYeTzpX7TgI1UmHGR5eL+aA2HZQGmoD76o6JWnXjCnHJUAYMTW0j27aP7BbOQCZsN/PjHAwKHnKoryrENTHSgVEIi4O08WhqP4HG+Jm4o6cJaPboc1Atkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRSIMcjguPjr+BuSTe+YnemyQoRxbBMwdH7t6j8mMv0=;
 b=CDiUzfzZ3e2td8emilgLmz6aCUJHnxQ5b3qqx2N7YS5ho/Ew2Ae2I3OdoYYcB3ghxQ+jdwYvV8VOu5HuRBhJLnL7MXVTLopHCRmv6VgKr5zmRl7n9Xs+m/qRQJHDvJOqfEIlyJfC7Dm9NPlOx55dw4wMFfCnKtuyP3bzmWMxKVrZGse+5Kuu0xjVPIVx1rIcR+/F8Iee2D0ec8hKEoaLRhSnfdZjYggGWzdu8uEKAK+9laGw371uc3brL+UtlaPjVsOD776xmxxti2gElbISNiR4tyoYhvH7KdusSVM9rjgUM8Uq8T+1fi3Yv/nyWz6uPSbPAFFnfop9GEZm6XrI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRSIMcjguPjr+BuSTe+YnemyQoRxbBMwdH7t6j8mMv0=;
 b=kwZLWlWN0YM+xMmGFhpCgb4xIP2CbaL71zcMMe7Ms4u4g67wAwk56BwYpHRqjmkZAGYtsVSggXwId1rHFFquPAsXC10+1je1Uo/Kxn/iINvGTdLpC1fsELhyvE3Gaur3d7jyo4q8FBtqLJhifa3ZY0tVSm7HfdO8ETUsAucv2O4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 11:27:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 11:27:13 +0000
Content-Type: multipart/alternative;
 boundary="------------BXijmnTLxCxQh0rOrKhkQLmd"
Message-ID: <fb50acf2-0306-4246-bb69-3a71d3dca353@amd.com>
Date: Mon, 11 Nov 2024 12:27:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20241031181048.2948948-3-matthew.brost@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef84ff2-647a-4afc-8a92-08dd0243ca3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2owL2lMMGdSNXhhY3BuY0pJd0tUQUdjUlp2UTlaQWxZT3ZBcDJHLy8wVXFP?=
 =?utf-8?B?ZHNoODVaM3E5anI1MUlHMXRpV3VXYnhmNFpZNUFaTm13enJWclFldDd4OXBL?=
 =?utf-8?B?R1VQUlVMd28vRGkzemF6WXZzMmE1Y1ZLRnkvVFdORHQ4QlM2UThFNlkrbHBZ?=
 =?utf-8?B?SEViRHM2Y1UzdW5WUjhYQm96UDhoNStaR1F4SGRoYTNHWCtNVlM2U09PMVZY?=
 =?utf-8?B?RVpqdWV3THg3NkdaTWtCV0RQQzU2N3BRaU8vclNjR21sSzhpUVQ3YzdHS1lh?=
 =?utf-8?B?Y1VBVnl4bGZadDhUZTA2S1JUMmNwd0VWRzRzYW9iWEdabGwrSXBzN3o0MEQv?=
 =?utf-8?B?cEVzUEdhU2pFaG42SjVETVBUSFErM1NqRGw1SisrZWNMQU92Q3JQejg2Z1Fo?=
 =?utf-8?B?Sjd5VTI2U0hZUG1LTngwWExKMzNrRElFcG5BMzF6Rk9kejVEdnRGT3dUSDV4?=
 =?utf-8?B?L3lPT1VMU2l0R1JvZE1jY0Q1dHk0SGtZN21UcHQ2THBONndrNXE1SXFJaTBr?=
 =?utf-8?B?bklFMW85eWQ1bXQzYTNPdHFvUjJ1YmRmT0E2SWJTRjMveEpLWExpeEV4YkFF?=
 =?utf-8?B?cmNjMTdlMTIyWEhJMG9jcFhwSVAzc0w5SVQzR2cxOXNkcDRkZHIxMzM4VmZw?=
 =?utf-8?B?YUg4SjJqOGxlY3BvUXRZYVNxY0JLZndLWGEwZGowalhIYjZKaVI5aGQxczg5?=
 =?utf-8?B?SC9OZzJMWVZPTFNRRWVaZ1MxM09SV1A2NEVqQW5VTTRKcWhDSUNmRlgyZ1hY?=
 =?utf-8?B?aXdaYjdsVW8rUHN0V0Q1b0ZSQ2FoR3A0UWwvd3pUd0hvOWxTQ25DV0xHenVB?=
 =?utf-8?B?cFQyWGgzVUhpMzRyVHo2Lzl4WXZPSjNaTjFqMmhxQm1oYmk0dXhVTHVFWDhl?=
 =?utf-8?B?MkhlNGp1TVowRzQ0SU5YejBKRHlyMHk2VHF5RGRBMldzdFM4dVlkdU54TEh6?=
 =?utf-8?B?K3RjMTZ0K2lPVFRUSkkyT01IZis1TWc4QXJPSXdxYXhNdGVMcXcweldNVzV0?=
 =?utf-8?B?SUNENk54Q0FkQ2JoZGNGWlozSVA5Ly9xN0dQci9ldzFmc2c2dzhjOTZ4M3pW?=
 =?utf-8?B?a0V5M1RaVkdwbkNRM1d3ZkZPUG1UNHI4S2g1V2twdUVLbVRqdytWaGVkcEhM?=
 =?utf-8?B?Y3Q3UzhHb0pNRjJ2Nlc4SVpkOXJIK210ZU8rTXYwTmNZbDk3TVQ5cWlVdlRh?=
 =?utf-8?B?SkpOTjJRVExMZHpVSExmYVJhUXVBYzY1NXRQTVBCaFM4VXdkMncySmhBaWRO?=
 =?utf-8?B?MkswMVQ5UFBTRlNNK21XTmc0Rm0vcDFGYXgwbFRYRzBtcUtqZWcwbUorU3Jk?=
 =?utf-8?B?dzNoZ2EvL3lKSzhTb3h2U0JCd1o1Mmx6cXp4amd6T1BLUS80R3RsYWtoVDZL?=
 =?utf-8?B?SEpTUWF2cEd4b1ZHSWJuTkUvYjJvTnNBWVMzZ3FQSXFKRHovdkU0V2dtTURu?=
 =?utf-8?B?YlZvZ3RwUEtLdi9zak15T3NRNkJGclRmeXFRYmtZK3JDVzJHaVhRVkw4NEo1?=
 =?utf-8?B?SEowZVJQZ2RBUEg3QnBBWEU4KzhCN1dlNW56MXFnMFFybnB5aVdiczRzbXFu?=
 =?utf-8?B?eTJpL0V4N2FORi9aWlZEano4QmJDbE1xcTdoUU4vY1FRU0xqcXQ0WmFpcDVD?=
 =?utf-8?B?YWNJQ3FLZXRaS1lkSU9VN0h0OGNlSUZPNzVUR05lUW5Ed3grenlIUFNyMXRS?=
 =?utf-8?B?U25HcHdOZHVqa1J4MWp6ZnBvVXNsWjdVTHZ5b3VPeGZwQUxRZUtyZ01nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlBhMlB6bThVT2c0RUJxN1VodHo3Tzh0bUlFWHdkT09rMlcxNFBVdjk4Qytr?=
 =?utf-8?B?cFRsSFM2cHhhUHVYa0ZPUCs5VGdldzhBRE1wZGhFNy9ONk8zemI2Z05HQmZ0?=
 =?utf-8?B?djBkQkZ2c2tXNmZEdW5VL29vMS9wQzVMQkVYR1JKaWhQdFdKdnlPNEJ1M1p2?=
 =?utf-8?B?a3FYTzFxMDFlRTNZQzJWNlgrRnlQZmdObk12dFNtR3YxRUY1eU1yT3VSNUta?=
 =?utf-8?B?N3lna1Y0aFAvalRVTHZXTVZHeU52TUhGd1V1VnVJdFJoNStxSmh2SlFPV2tm?=
 =?utf-8?B?QzFkNHVhcDFUUlpNOW42YThXRy90QjdNMVIvYnpYVS8yaG9MditLT3lVV3NK?=
 =?utf-8?B?TlF6ZThZV2JTdlE1c0hXVGpTVlNqQXhLZ2ZUK2dXOGxDbExhSEJVVDd6ekxN?=
 =?utf-8?B?dVBiK09YdXpiN1NkOW84WndzRjBMV2o0SlZuclN5UjMyaHlva1Fia0Q4MURO?=
 =?utf-8?B?aUxLV09yZDlGQXV3Q0NIU2dhbXkzNnRadUJGUmhPZUxJL0ljUWJWY0JyWHl6?=
 =?utf-8?B?ck1yQUVFRXNJbUFqd1BndUZMM3VReWpKMlAxaW1sWFh4R0orc1JXN0dkeHli?=
 =?utf-8?B?UC81eXlYWEUxWmRXS3VZZEFSSXJTVWdNaXNMN29JdTZFc0JuVjdXRWtOdFNL?=
 =?utf-8?B?aGplL0RhanA2MFVUL2Y0dDV0WWo0NnJGVXdOZjVzRkw0N0NKYzFPNm8yREZq?=
 =?utf-8?B?TTlXUXN6dHFYZEVZUlcwV1JPeXRrRENGdkJqOEN2c3pINzZkZ2RQbllodGJ2?=
 =?utf-8?B?L0NyK3Q3bmpzY3hqWVQyZVgrL0NCeHJ1Rnh4NFpJWEpwSlRTYVQ3YXJ0c0l0?=
 =?utf-8?B?eWJ4MDFRYW5ucnpDSkNvRU5tZmo5Z215UnR5UTNWYlRRTGE1SDBjTFJQWEM2?=
 =?utf-8?B?Tnh3WVV3SXgwNnBGS1FLR0p6eE9saG92Z3YvM09GYi9UOThDaEF3OWMzNEkz?=
 =?utf-8?B?dmxGWnJsYzRiWXVuQlV2QkV4L0txTGh2VGpUMVF3WEpFbkxheU9LRWp1N1BJ?=
 =?utf-8?B?czExWTVmQk9vcVZwcCtHcHhBOUZTNlRDeDlDNDZ1c3FCb2RpSTVXb21wUkhC?=
 =?utf-8?B?U3ZFcGtmMkhLRDlPVFlzT3BSU3RicVFXcGxmakNnSmE5cGhwU3pYL3d0MkNN?=
 =?utf-8?B?bnZ3Q1kwSlNyUmZUcS9OdWNqcHh5K05xb0czN25ocWpldVBaYlZKemhiSnB4?=
 =?utf-8?B?M2RWem9XTStXV0FZL1doSFRkbU9qcmJ0Um44NnZUeGRxMDRDa3lSZnRIYXUy?=
 =?utf-8?B?N0JoenRUWks4cUxlM1lTU1FNSE5oMXZLRlByYnlQbnhpMWRHcCtrQkxYSmtR?=
 =?utf-8?B?bXNkTTk4VWhJRzVnWjFiN3dtdWIzVUgvUncrUDJmd2FsUTREcGN4aXk4QURw?=
 =?utf-8?B?L0U4L0JaSi9mcExYOHBBbTdJRDlCQVMvUFloY2VsVzlZTW8wUGNFSzdrbXly?=
 =?utf-8?B?VytyelFjYjRPRVM1QlUwS1hXUkFMdTMvRG15V1JMeWtJQjZOUklqN1pPSk1W?=
 =?utf-8?B?dkZzSTNCeUZtT0N2VmtXSnhGd2VXTUYzem1IeFZzM0lBcmZrbHdEQ2o3SzM2?=
 =?utf-8?B?UXpvU1dNRURKaGhIMVdLYTNqK0E0RXlUaU9aT0pIM2Q1U1Z0V1JOZ3kyMXU4?=
 =?utf-8?B?Y3pDNUV4RWR5UlJLZi8xOGxOMllsLzQ1WWhQNENjSUJMaW42Z3BHUHVJM2Nn?=
 =?utf-8?B?VTJOTjAvMFoxUjlOZ2h2UzQ0MHE0ZGlBVE9sQktuZ0tpTzR3c0FRWllNai9X?=
 =?utf-8?B?Mm5PcTlYM1ZETHlObm1KR0lrcklYOGtmRkhSdjVBWUo0dmZiREJScjVMRXdH?=
 =?utf-8?B?UXo4SnRvTng4NllBTXVZWS9mbWJVVWEySyt0d3RPU0RpT0RaaWg1aXgxeldS?=
 =?utf-8?B?dFRTbnQxVzlKam11dVJTZEdoL2pRSmxhdG14WlE0eTlXQzdsTUQrcXRubGVR?=
 =?utf-8?B?UGtHb3lucjNRMWZzdmYwTEd0cVQvQTZWOG9GODd3azJ2RmZubUpOU0VCcWU3?=
 =?utf-8?B?cXdVOWxPNzR0OFF3VDUvQkdFci9lYUpZZk5jMDdBcHdvVmdpVXR2SUZKdmdm?=
 =?utf-8?B?ajg2dDRDYU9Icnp4MUdkb1NXeGw2ZkdVSGltMDB1MjZRdHd0U3cwajR3NlRU?=
 =?utf-8?Q?ORuQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef84ff2-647a-4afc-8a92-08dd0243ca3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:27:13.8019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8PUK/EJFCWs97eeOxH2dvaOrQd/+AXI8WJSnJbw79vB0AShyutGeHlPk4W+e3Sm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533
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

--------------BXijmnTLxCxQh0rOrKhkQLmd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jonas,

Am 11.11.24 um 09:00 schrieb Joonas Lahtinen:
> Back from some time off and will try to answer below.

welcome back, good to have the designer of this at hand.

> Adding Dave and Sima as this topic has been previously discussed to some
> extent and will be good to reach common understanding about what the
> series is trying to do and what is the difference to the AMD debugging
> model.

Yeah, I was already wondering why that wasn't issued before.

> Quoting Christian König (2024-11-07 11:44:33)
>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
>>
>>      [SNIP]
>>
>>      This is not a generic interface that anyone can freely access. The same
>>      permissions used by ptrace are checked when opening such an interface.
>>      See [1] [2].
>>
>>      [1]https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
>>      [2]https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2
>>
>>
>> Thanks a lot for those pointers, that is exactly what I was looking for.
>>
>> And yeah, it is what I feared. You are re-implementing existing functionality,
>> but see below.
> Could you elaborate on what this "existing functionality" exactly is?
> I do not think this functionality exists at this time.

You can get the exact same functionality by requesting the render FD 
from the debugged process.

This also doesn't cause any security concerns since it uses the existing 
systemcall interfaces, especially see pidfd_getfd() and fdinfo for 
reference.

> The EU debugging architecture for Xe specifically avoids the need for GDB
> to attach with ptrace to the CPU process or interfere with the CPU process for
> the debugging via parasitic threads or so.

I can understand why you don't want to use parsitic threads, but why 
don't you want to attach with GDB to the process?

I mean you somehow need to prevent that the debugging information you 
try to gather or modify change while you access them.

> Debugger connection is opened to the DRM driver for given PID (which uses the
> ptrace may access check for now) after which the all DRM client of that
> PID are exposed to the debugger process.

That sounds extremely questionable and just re-implements existing 
functionality as far as I can see.

The fdinfo file under proc already provides the necessary information 
which file render nodes a pid uses and the pidfd_getfd() system call 
then gives you access to those render node file descriptors.

Why do you need that as separate and especially driver specific 
functionality?

> What we want to expose via that debugger connection is the ability for GDB to
> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
> the EU threads would see them. Note that the layout of the ppGTT is
> completely up to the userspace driver to setup and is mostly only partially
> equal to the CPU address space.
>
> Specifically as part of reading/writing the ppGTT for debugging purposes,
> there are deep flushes needed: for example flushing instruction cache
> when adding/removing breakpoints.

Is that not something you can do through the render node the PID uses as 
well?

If yes I think it would still be much more cleaner to expose that as 
IOCTL on the render node.

> Maybe that will explain the background. I elaborate on this at the end some more.
>
>>              kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
>>              failing to see the problem with adding a simple helper based on existing
>>              code.
>>
>>          What#s possible and often done is to do kmap/vmap if you need to implement a
>>          CPU copy for scanout for example or for copying/validating command buffers.
>>          But that usually requires accessing the whole BO and has separate security
>>          checks.
>>
>>          When you want to access only a few bytes of a BO that sounds massively like
>>          a peek/poke like interface and we have already rejected that more than once.
>>          There even used to be standardized GEM IOCTLs for that which have been
>>          removed by now.
> Referring to the explanation at top: These IOCTL are not for the debugging target
> process to issue. The peek/poke interface is specifically for GDB only
> to facilitate the emulation of memory reads/writes on the GPU address
> space as they were done by EUs themselves. And to recap: for modifying
> instructions for example (add/remove breakpoint), extra level of cache flushing is
> needed which is not available to regular userspace.
>
> I specifically discussed with Sima on the difference before moving forward with this
> design originally. If something has changed since then, I'm of course happy to rediscuss.

Do you have pointers to this discussion?

> However, if this code can't be added, not sure how we would ever be able
> to implement core dumps for GPU threads/memory?

Exactly that's what I tried to point out before. Use cases like core 
dumps or even CPU copies are valid use cases.

We do that inside AMDGPU as well or at least have plans for it, but we 
already figured out that you can't use the TTM interfaces for that.

When you want to do a core dump the GPU is usually stuck executing and 
when you try to call kmap/vmap it is possible that those calls wait for 
the stuck GPU to finish whatever it is executing.
That's why drivers need to use hardware specific approaches to access 
data for crash dumps.
[SNIP]
>> As far as I can see that allows for the same functionality as the eudebug
>> interface, just without any driver specific code messing with ptrace
>> permissions and peek/poke interfaces.
>>
>> So the question is still why do you need the whole eudebug interface in the
>> first place? I might be missing something, but that seems to be superfluous
>> from a high level view.
> Recapping from above. It is to allow the debugging of EU threads per DRM
> client, completely independent of the CPU process. If ptrace_may_acces
> is the sore point, we could consider other permission checks, too. There
> is no other connection to ptrace in this architecture as single
> permission check to know if PID is fair game to access by debugger
> process.

I would rather say that you try to debug completely independent of the 
CPU process is a really bad idea.

> Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
> the DRM client would also pave way for being able to extend core kernel generated
> core dump with each DRM client's EU thread/memory dump. We have similar
> feature called "Offline core dump" enabled in the downstream public
> trees for i915, where we currently attach the EU thread dump to i915 error state
> and then later combine i915 error state with CPU core dump file with a
> tool.
>
> This is relatively little amount of extra code, as this baseline series
> already introduces GDB the ability to perform the necessary actions.
> It's just the matter of kernel driver calling: "stop all threads",

OH! Wait a second, you do WHAT? How do you guarantee dma_fence forward 
progress in that case?

See here: 
https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences

[SNIP]
>> So you need to have a really really good explanation why the eudebug interface
>> is actually necessary.
> TL;DR The main point is to decouple the debugging of the EU workloads from the
> debugging of the CPU process. This avoids the interference with the CPU process with
> parasitic thread injection. Further this also allows generating a core dump
> without any GDB connected. There are also many other smaller pros/cons
> which can be discussed but for the context of this patch, this is the
> main one.
>
> So unlike parasitic thread injection, we don't unlock any special IOCTL for
> the process under debug to be performed by the parasitic thread, but we
> allow the minimal set of operations to be performed by GDB as if those were
> done on the EUs themselves.
>
> One can think of it like the minimal subset of ptrace but for EU threads,
> not the CPU threads. And thus, building on this it's possible to extend
> the core kernel generated core dumps with DRM specific extension which
> would contain the EU thread/memory dump.

I can understand that you don't want to use complicated and hard to get 
right approaches like parasitic debugging threads, but this should also 
be absolutely not necessary.

The problem is that when you completely avoid ptrace and the existing 
interface you also have to implement a lot of stuff which is already 
more or less there. In other words debuggers like gdb already have the 
ability to interact with device drivers through their file descriptors. 
And that includes all IOCTLs, mmap() as well as things like command 
submission etc...

It could be that you need some addition IOCTL, e.g. like flushing caches 
etc..., but you certainly don't need a separate file descriptor gated by 
exporting ptrace access check functions. That's a really questionable 
design.


But taking a step back: When you stop GPU execution and insert break 
points you need to guarantee that this will never affect any dma_fence. 
Otherwise the core memory management can run into a deadlock.

Neither the preemption fence XE uses for it's threads nor the hardware 
fence used for end of submission indication can be delayed while things 
like a core dump is underway. That's why you also can't fully core dump 
in the case of a GPU hang.

What is possible is that you wait for the XE preemption fence to signal 
(which AFAIK is implemented XE internally as stopping all threads), but 
skimming over the code this absolutely doesn't seem what you do.

So at least of hand that looks like a classic indefinite DMA fence 
problem to me which will get you a whale big NAK from Sima and Dave.

While for the peek/poke interface is maybe a bit ugly, but more or less 
doable, stopping the GPU without signaling the dma_fences is really 
*not* something you can do.

Regards,
Christian.




>
> Regards, Joonas
>
>> Regards,
>> Christian.
>>
>>
>>
>>      Matt
>>
>>      [3]https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
>>
>>
>>          Regards,
>>          Christian.
>>
>>
>>              Matt
>>
>>
>>                  Regards,
>>                  Christian.
>>

--------------BXijmnTLxCxQh0rOrKhkQLmd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Jonas,<br>
    <br>
    <div class="moz-cite-prefix">Am 11.11.24 um 09:00 schrieb Joonas
      Lahtinen:<br>
    </div>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Back from some time off and will try to answer below.</pre>
    </blockquote>
    <br>
    welcome back, good to have the designer of this at hand.<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Adding Dave and Sima as this topic has been previously discussed to some
extent and will be good to reach common understanding about what the
series is trying to do and what is the difference to the AMD debugging
model.</pre>
    </blockquote>
    <br>
    Yeah, I was already wondering why that wasn't issued before.<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Quoting Christian König (2024-11-07 11:44:33)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 06.11.24 um 18:00 schrieb Matthew Brost:

    [SNIP]

    This is not a generic interface that anyone can freely access. The same
    permissions used by ptrace are checked when opening such an interface.
    See [1] [2].

    [1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2</a>
    [2] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2</a>


Thanks a lot for those pointers, that is exactly what I was looking for.

And yeah, it is what I feared. You are re-implementing existing functionality,
but see below.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you elaborate on what this &quot;existing functionality&quot; exactly is?
I do not think this functionality exists at this time.</pre>
    </blockquote>
    <br>
    You can get the exact same functionality by requesting the render FD
    from the debugged process.<br>
    <br>
    This also doesn't cause any security concerns since it uses the
    existing systemcall interfaces, especially see pidfd_getfd() and
    fdinfo for reference.<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">The EU debugging architecture for Xe specifically avoids the need for GDB
to attach with ptrace to the CPU process or interfere with the CPU process for
the debugging via parasitic threads or so.</pre>
    </blockquote>
    <br>
    I can understand why you don't want to use parsitic threads, but why
    don't you want to attach with GDB to the process?<br>
    <br>
    I mean you somehow need to prevent that the debugging information
    you try to gather or modify change while you access them.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Debugger connection is opened to the DRM driver for given PID (which uses the
ptrace may access check for now) after which the all DRM client of that
PID are exposed to the debugger process.</pre>
    </blockquote>
    <br>
    That sounds extremely questionable and just re-implements existing
    functionality as far as I can see.<br>
    <br>
    The fdinfo file under proc already provides the necessary
    information which file render nodes a pid uses and the pidfd_getfd()
    system call then gives you access to those render node file
    descriptors.<br>
    <br>
    Why do you need that as separate and especially driver specific
    functionality?<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">What we want to expose via that debugger connection is the ability for GDB to
read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just like
the EU threads would see them. Note that the layout of the ppGTT is
completely up to the userspace driver to setup and is mostly only partially
equal to the CPU address space.

Specifically as part of reading/writing the ppGTT for debugging purposes,
there are deep flushes needed: for example flushing instruction cache
when adding/removing breakpoints.</pre>
    </blockquote>
    <br>
    Is that not something you can do through the render node the PID
    uses as well?<br>
    <br>
    If yes I think it would still be much more cleaner to expose that as
    IOCTL on the render node.<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Maybe that will explain the background. I elaborate on this at the end some more.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">            kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
            failing to see the problem with adding a simple helper based on existing
            code.

        What#s possible and often done is to do kmap/vmap if you need to implement a
        CPU copy for scanout for example or for copying/validating command buffers.
        But that usually requires accessing the whole BO and has separate security
        checks.

        When you want to access only a few bytes of a BO that sounds massively like
        a peek/poke like interface and we have already rejected that more than once.
        There even used to be standardized GEM IOCTLs for that which have been
        removed by now.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Referring to the explanation at top: These IOCTL are not for the debugging target
process to issue. The peek/poke interface is specifically for GDB only
to facilitate the emulation of memory reads/writes on the GPU address
space as they were done by EUs themselves. And to recap: for modifying
instructions for example (add/remove breakpoint), extra level of cache flushing is
needed which is not available to regular userspace.

I specifically discussed with Sima on the difference before moving forward with this
design originally. If something has changed since then, I'm of course happy to rediscuss.</pre>
    </blockquote>
    <br>
    Do you have pointers to this discussion?<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">However, if this code can't be added, not sure how we would ever be able
to implement core dumps for GPU threads/memory?</pre>
    </blockquote>
    <br>
    Exactly that's what I tried to point out before. Use cases like core
    dumps or even CPU copies are valid use cases.<br>
    <br>
    We do that inside AMDGPU as well or at least have plans for it, but
    we already figured out that you can't use the TTM interfaces for
    that.<br>
    <br>
    When you want to do a core dump the GPU is usually stuck executing
    and when you try to call kmap/vmap it is possible that those calls
    wait for the stuck GPU to finish whatever it is executing.<br>
    <span style="white-space: pre-wrap">
That's why drivers need to use hardware specific approaches to access data for crash dumps.

</span><br>
    [SNIP]<br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As far as I can see that allows for the same functionality as the eudebug
interface, just without any driver specific code messing with ptrace
permissions and peek/poke interfaces.

So the question is still why do you need the whole eudebug interface in the
first place? I might be missing something, but that seems to be superfluous
from a high level view.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Recapping from above. It is to allow the debugging of EU threads per DRM
client, completely independent of the CPU process. If ptrace_may_acces
is the sore point, we could consider other permission checks, too. There
is no other connection to ptrace in this architecture as single
permission check to know if PID is fair game to access by debugger
process.</pre>
    </blockquote>
    <br>
    I would rather say that you try to debug completely independent of
    the CPU process is a really bad idea.<br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Why no parasitic thread or ptrace: Going forward, binding the EU debugging to
the DRM client would also pave way for being able to extend core kernel generated
core dump with each DRM client's EU thread/memory dump. We have similar
feature called &quot;Offline core dump&quot; enabled in the downstream public
trees for i915, where we currently attach the EU thread dump to i915 error state
and then later combine i915 error state with CPU core dump file with a
tool.

This is relatively little amount of extra code, as this baseline series
already introduces GDB the ability to perform the necessary actions.
It's just the matter of kernel driver calling: &quot;stop all threads&quot;,</pre>
    </blockquote>
    <br>
    OH! Wait a second, you do WHAT? How do you guarantee dma_fence
    forward progress in that case?<br>
    <br>
    See here:
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences">https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences</a><br>
    <br>
    [SNIP]<br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So you need to have a really really good explanation why the eudebug interface
is actually necessary.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
TL;DR The main point is to decouple the debugging of the EU workloads from the
debugging of the CPU process. This avoids the interference with the CPU process with
parasitic thread injection. Further this also allows generating a core dump
without any GDB connected. There are also many other smaller pros/cons
which can be discussed but for the context of this patch, this is the
main one.

So unlike parasitic thread injection, we don't unlock any special IOCTL for
the process under debug to be performed by the parasitic thread, but we
allow the minimal set of operations to be performed by GDB as if those were
done on the EUs themselves.

One can think of it like the minimal subset of ptrace but for EU threads,
not the CPU threads. And thus, building on this it's possible to extend
the core kernel generated core dumps with DRM specific extension which
would contain the EU thread/memory dump.</pre>
    </blockquote>
    <br>
    I can understand that you don't want to use complicated and hard to
    get right approaches like parasitic debugging threads, but this
    should also be absolutely not necessary. <br>
    <br>
    The problem is that when you completely avoid ptrace and the
    existing interface you also have to implement a lot of stuff which
    is already more or less there. In other words debuggers like gdb
    already have the ability to interact with device drivers through
    their file descriptors. And that includes all IOCTLs, mmap() as well
    as things like command submission etc...<br>
    <br>
    It could be that you need some addition IOCTL, e.g. like flushing
    caches etc..., but you certainly don't need a separate file
    descriptor gated by exporting ptrace access check functions. That's
    a really questionable design.<br>
    <br>
    <br>
    But taking a step back: When you stop GPU execution and insert break
    points you need to guarantee that this will never affect any
    dma_fence. Otherwise the core memory management can run into a
    deadlock.<br>
    <br>
    Neither the preemption fence XE uses for it's threads nor the
    hardware fence used for end of submission indication can be delayed
    while things like a core dump is underway. That's why you also can't
    fully core dump in the case of a GPU hang.<br>
    <br>
    What is possible is that you wait for the XE preemption fence to
    signal (which AFAIK is implemented XE internally as stopping all
    threads), but skimming over the code this absolutely doesn't seem
    what you do.<br>
    <br>
    So at least of hand that looks like a classic indefinite DMA fence
    problem to me which will get you a whale big NAK from Sima and Dave.<br>
    <br>
    While for the peek/poke interface is maybe a bit ugly, but more or
    less doable, stopping the GPU without signaling the dma_fences is
    really *not* something you can do.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

Regards, Joonas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.



    Matt

    [3] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6">https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6</a>


        Regards,
        Christian.


            Matt


                Regards,
                Christian.

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------BXijmnTLxCxQh0rOrKhkQLmd--
