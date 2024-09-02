Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B79684BD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EADA10E13E;
	Mon,  2 Sep 2024 10:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wU3lCuJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E6610E13E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONClXL/8QT1UKnyf6rq9gV8awS64xcU4tchukGFDtvZecroYrgF7Q4ucYH5PNDGiQBMfqzB+xsqbzwiQ15ag5bbLvZU9NHl870K1wIkPA+NlT9XXStRLsusIbXrn0BngbAbP5/EWknRL2/pOLPidTL0Ie7fQl8ZnXh83MOkE4jg1gObgsBBeEJWVWXMAA9FiGEosoShrh1qIrcUQTnpa0rlk+tEymSahri9TVP3gRN8MwIITlmwCk6kekLTXSICuHwj3+9ED2aPnw0vnVfw3d2jOk6IMU5QMbT3/ss6FjehQaP3UL1ahgVpT8uzrU+0M/dbcrPrBIEHXBLh7doAexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6GaiRfZDutRkkvoIWN7BT1xg/bG21u5hXw7ir0yI2U=;
 b=xSWVo51mEbC+vw8xf5dSIFmUdeqIV1yZveVuypHxk32Xke/wNhmiPr4nd1MvAboKnZC84dS5EN75p3gkMXxjvuFP/WsuU3qdw8H4TF0/fn0YY3o41MEmTkFCNK14RdX8HQM19QErPzWfJbA7vcjFDd/tBt06xZY6cIisYMRW4wugnDyNOS5OsOsDfye/tvwfWxkI+syrTc5tWxdsuhDt9DnE7Ofy28C6iuL/XNvWW58umsx3FEVLwmYwGXbqWs7/gkROH9FrKnHWCvRs8YjNohmuP/Zblv3f779wnD2sbMPxMG87B6gb3CO3TX7KTRMPB6F3FymA1AS5qvlw3UvfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6GaiRfZDutRkkvoIWN7BT1xg/bG21u5hXw7ir0yI2U=;
 b=wU3lCuJsCgb7LEwNInyitXsg11Inw8q1ULlYglg57rmUf2IefL5wkjQw4i1Z8LJ7aRBhlAmwiCYZEy59svaPCCgbB+kaKlSsUYCQKI2l+5tJwdmC1Lu0lnx4HukFqb23QjZ4edLFcejZSP3oBQSNp2jqHHBOC9gk1vxs/IVuWJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 10:33:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:33:57 +0000
Message-ID: <5c493bd5-e657-4241-81d7-19ccd380b379@amd.com>
Date: Mon, 2 Sep 2024 12:33:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] drm fixes for 6.11-rc6
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, lingshan.zhu@amd.com,
 Matthew Brost <matthew.brost@intel.com>
References: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
 <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
 <CAPM=9txF4+rC_CXQTftPctUd0N37t306YKcV3oKPjz+_zQGqag@mail.gmail.com>
 <440d041982f7f232f0ce3284bed4db391adb05c1.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <440d041982f7f232f0ce3284bed4db391adb05c1.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0305.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f759bc-b208-4178-a812-08dccb3ac06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K010dDhtT2Z0UXBrRUdkZ241MUpKdmJ3NzN1bDZNMXlPWG5EVmJMZ1ZqWjZ2?=
 =?utf-8?B?SkVSMHYrdDMwVVo2cUdNOHFTSnYvMVdWM0ZJQk1uZmpPOHM1bW5NNTdsaTBN?=
 =?utf-8?B?QWJLRjhuTS96RW1ZN1lXbjNYb2l0NkpmYWF1UVRKenZtb01JMThDbm9FZE1I?=
 =?utf-8?B?WTlnajA1V2lZSUVXNzVIZ1RmbEdRZWFvTC93S21EakxtRFg1dDBGbVF6RDNW?=
 =?utf-8?B?ck9YWWxxNEM0Z092OVlETjNGakxEazlxaXVmblZpUzRKM2xWcUNQeE02dVdR?=
 =?utf-8?B?ZE9tZDVqQnhyd2oyaC9vb3ZrVWdTbDYrZ0lJazZhSlhpL3l4Q2F1QzZGVFRP?=
 =?utf-8?B?VEZQZ0tSYXBDZ2VLTFF4VGxuNGFGcWRlSzBITHlDVEM5bXYrNlR5VkpySG1Q?=
 =?utf-8?B?dUg4aytOR1R0UHFjczYzY1p1NmxPVWVpd25ibjU0N3h1dHRNQWpKd2UwWDJv?=
 =?utf-8?B?cUE4NnhxMHlXb2ZISVpLMXBwc1hkL3hBVlh1N1BmczZHMHhxZHhUM01FZnpj?=
 =?utf-8?B?ZVBBTnlUR1dlZDIzN2FiR25GMlJ3ZmtUOG1TNFpYMzF1WDIvaGZyYzUvWmlE?=
 =?utf-8?B?Z1RIdXhEMVN3djJtR3JsTXF1Z1ptSlpZSlJYbUsvdFVMVGcvd0JtV01IUUlj?=
 =?utf-8?B?cS9CNndBRWZxVFB0Qkd1ZzE5WUNZcENOcFErZWFZckVzeW5xemdhYjNxTk9U?=
 =?utf-8?B?Z3RFcjFJdGE2TFJtQ1YwMXRoYWlFZGVndm9ObC84blQwdmZQK2JiMDdqTXc0?=
 =?utf-8?B?RTB5LzFGcUJueFFrdDNjUG0zQnV1MmtFZTRGR1piNE91Z1JnTGhJVHM5eGZG?=
 =?utf-8?B?b2xGeXRpN240anNIU1V3VGRPVnB4S0x4OUhuNHViZFQweFF1Mk0wUW14S21S?=
 =?utf-8?B?MUZKRElGVDVlcjZuamY1dFBaWDQzajJLVmZCVjJuT0V5WmRkY0IzNzI0RDdC?=
 =?utf-8?B?U3I0c2NsL3lOK0ExMDB3Q29tRnFCbW5BcWx1NVVaVzBLeHB1bDlnTmdMK0xu?=
 =?utf-8?B?UitUUXB6VWJydEJjM1V3Z2prS0luUUwraGwrWTFyVkNTc09SclNHS3QzRG5v?=
 =?utf-8?B?a1BpQitnUnpJUjFaQ0gwLzM0L0ZCKzRBcE5RN1NwWnRhWWZFcTluTmF6NTQw?=
 =?utf-8?B?S05QOXJOOFNGOTFBbWJqY0s2dGY4NTNFSGJWNngzNGZRSFVZREFqbEdUcWov?=
 =?utf-8?B?ZkJjTVVLZ0QrQ1dzblNyUi84WHJpaTBXaTRQQ2ljVVNKWWNvQ2pZNGdFdUhx?=
 =?utf-8?B?WmRtMGhNS3pZbUVZODZRRnVQUUJnN3JvS0dXWGh5NXBSNjBSYVk5ZkpGdVdn?=
 =?utf-8?B?M0ZwQ0lYNzhEU3dKaXAvQitGQTJ4bHVacDVrUHBBU3RITTBFOGJmMDIwc2dm?=
 =?utf-8?B?NGg1dEg4Y0FqVlFoNEduODd4NHBvWEVyWTlNV2NlT3p0eTNEWEdsTEcxbE5G?=
 =?utf-8?B?L096dHJaV3k5OXJPY3h5UVpGUUlPcFdsWHRSRCtVN2JTaEMwWVg3UC84OEFU?=
 =?utf-8?B?MnB6anY0eWxOTkMyVG9iTTVCaWtwWmROMHk1MHBqTEpTa0Y0S1JkTlQ4bmdp?=
 =?utf-8?B?OVNUYmpxUjVmYU1KWHd4M21XT1FuMDZsdGpFdUlJb1dlaEczUC9qTCs0WXNz?=
 =?utf-8?B?ck53MFBJOVhoWjRDZGFkVUZhNXVYZGJ0UFJnaFRtUlZCNms5WDhURjJpNnR0?=
 =?utf-8?B?NXRXV255T2M5bzlMdUR5Y0tNSEdoaWRVQ0kzOTNlUWRQdElJaHRoL0s3bnJ2?=
 =?utf-8?B?dFhZSHZiM1cvZHdOcGtUOFFGREl1WWJkR0RseURTd1czTFoxUnVoYXA5Lzk2?=
 =?utf-8?B?bEtxM2ZuVm9PYWxvOEsvUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9ESnJ4NkVpTVlianpnNktSdTFWenBVZzRucmsrbzVSUlEweUhoTHZqdVo0?=
 =?utf-8?B?MDV4cno0RTBKVnZBZXJTclQ4M0xmdFI4SnNLUXRSWldyN3N1a2FlVnFMSHUz?=
 =?utf-8?B?bXdWcnNKQXpNeHdWTnhXN09kQmtLTDRuMThDQmhVODZjdjIrNVlVOGdQUjVN?=
 =?utf-8?B?cGZaSXFjRGwrSGRSR2hXSlF6SzEza2Z5VTAyelExK3dadlpoTkJmTVpnZlZT?=
 =?utf-8?B?Mm9EaGYxVjlnbUJTRnpQa3FBdjduQlRsZ2J0MElsK3k4ZS9kK1plUFgyaVgx?=
 =?utf-8?B?Q2pZU2tibU9zanlLSFdOTlhxOXBaQUxPczhzUWNMR0hxc21HeHBFTWU2TXhj?=
 =?utf-8?B?cHJ0N0RFSlgwQlVsblpzTFpmRXRJbzB4UUZjZjUvWGlUbmMvSHFOT1hmdFlN?=
 =?utf-8?B?Q3lhMzZ1WUljdS91L2VtSjFkSkRqZVI5dVN1ZU5HYW81TWhoSWFCa05Ja0ly?=
 =?utf-8?B?bmVaMFNoTUdpalZ6bVNyb3hCczJoZktiS2Y5UmNYcno2TXNYSjNoSlZocmJp?=
 =?utf-8?B?RUtzQ2hZQ0pBc3Z4L0doSUZ5Q05sbWh6b2ZvcVdNcVplT0NjdVkwWDVLRWVz?=
 =?utf-8?B?a0Vjd0xrM3FFbDFObFJlbzB5djVaeDNxM2RHaFFOVDVBeU9XUEtmaWpRYmdH?=
 =?utf-8?B?cnRWY1ZwakFhdjBMbEs5QmhQRS91SFZTWGp5dXFzQlpNRGJGUDF3VlExNkN0?=
 =?utf-8?B?RWI3S3dUUFlMckJDQmtsMUM0aUxWYUJNcTlyYTlueWNUYUowWHpuM2d2alVK?=
 =?utf-8?B?REN4UENnKzhDZ1RIOEtjRUJFMjdiR00vMnhWOU5vOFZoL2tOeXZhQ09pb29o?=
 =?utf-8?B?QmlyUHhySGRZK0xMM2dOejB3d1ZWMlZXTllTdFRYY2ZsOFhpamh0S1VYZDNm?=
 =?utf-8?B?V1p5SVJNdkxLS3RBc1N4MWZ6UkNhZFVubHRUUnFqTXBTbmJwZmlteEdNOERv?=
 =?utf-8?B?K1pYbU9PUUduZndERnVRZHdZTG1Wdkx4R29JbytYNkx5YmVteVBmclcxUi92?=
 =?utf-8?B?S1ltMHBHNklhNkk5MTVyWGpZdENNSHFtaW5ZTXBOblhYUmN3eXlCQk9OTkEz?=
 =?utf-8?B?VGlWdXVVbnNCVXFVNlJNamZzc3FlS3NjVzc2SklSVW5jaFFhM2FxZ1ZZaEo3?=
 =?utf-8?B?TE1nK01yUVFXYitBeDFBNmNSQnpYdDNETU5CbC9sQVZJbFd3bWs2Mm9wUzh4?=
 =?utf-8?B?cGRWYlNLWDAwbHdUbVArbzJHZnp6cWtiUDlaUXdlV1hNZjF4Z0JpRE5wdE04?=
 =?utf-8?B?RHBrSGhON3hjUC9JY3cwV09BWC9NQ2hWOUJaajcyN1ZxOTI4ZHlvQ2JkSUxC?=
 =?utf-8?B?VmwzSm1GYjlnWU9oclBNejdNYmV2OWRPQ2cvV013RzZmUXVmK2pqcmZPMWl2?=
 =?utf-8?B?cm90NlhpZWczRWFUMC9RUjlhZDFBc1AvWm0yT2d4VGxhc3NZVDVRUklURExL?=
 =?utf-8?B?T01kaUZGR1FQYlkvOFdhR3lUK25CMnYzRHI2T3NEZ0VhM3g5OHp0cjV3aVZO?=
 =?utf-8?B?ZmdYT1JGZWpOV01lQ2poUVBZMXFhTkM4Qzd3ZC9aZGxmdWVJcjd5TDdOVU8y?=
 =?utf-8?B?SUpEdzV0NXpNNFI2a0V1U1MwSllVYmpSYzlYcjFzTnNGSld4djRid0ZOSGE1?=
 =?utf-8?B?T3E0ZjI3M296c2thQlpUTndxam4wUlYraFB0TEtvaExTRDNoV3UrWTlWRXhy?=
 =?utf-8?B?NVlzVmtackZWelg5b3V0dE1tTlY2L3RzMU9HZGVRcVJBL05ISTFLUjREUVJJ?=
 =?utf-8?B?TVFtWkxqSWVPdEpTcTc1YWc1anVEVENFRFp5eGh6Q24zTjdrMEVqVDVrUDlh?=
 =?utf-8?B?SDI3WmZrSWVIWk5CQ1d4UjBJbS8rSHBPRnFONVJSdVJ5V0hxOUV5NW9wMkhJ?=
 =?utf-8?B?TVNlRlZDZnEzNGMrVHRPSFVTMUFCaUZpbEpZWDl3aGZUREx1R1g1VkpCeitq?=
 =?utf-8?B?eTF6M2EvK2lTUDhjN0VteldUNTJUY3g5OHVSUStzVDk1UmFPTUEzMWRlaE5V?=
 =?utf-8?B?dzJzdnBsb3FNWEczdmUxSkprbmZKaWlsM2wxL3RVOXpyYlNNeUpWWDFPbXJK?=
 =?utf-8?B?ZkZvc2Q2bVE0T0lYNXNpQXZRbzc2ekdqYy9uUFgxRVg4Y3E3RGRJK2lWcTZF?=
 =?utf-8?Q?EinU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f759bc-b208-4178-a812-08dccb3ac06f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:33:57.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcE4RBvpdD/Pqxp+Ew08qOWyf5zJ6geZCjyr90I4hJreDIx2K+PmPSAUlwS5ebIM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638
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

Am 02.09.24 um 11:32 schrieb Thomas Hellström:
> On Mon, 2024-09-02 at 08:13 +1000, Dave Airlie wrote:
>> On Fri, 30 Aug 2024 at 12:32, Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>>> On Fri, 30 Aug 2024 at 14:08, Dave Airlie <airlied@gmail.com>
>>> wrote:
>>>> The TTM revert is due to some stuttering graphical apps probably
>>>> due
>>>> to longer stalls while prefaulting.
>>> Yeah, trying to pre-fault a PMD worth of pages in one go is just
>>> crazy talk.
>>>
>>> Now, if it was PMD-aligned and you faulted in a single PMD, that
>>> would
>>> be different. But just doing prn_insert_page() in a loop is insane.
>>>
>>> The code doesn't even stop when it hits a page that already
>>> existed,
>>> and it keeps locking and unlocking the last-level page table over
>>> and
>>> over again.
>>>
>>> Honestly, that code is questionable even for the *small* value,
>>> much
>>> less the "a PMD size" case.
>>>
>>> Now, if you have an array of 'struct page *", you can use
>>> vm_insert_pages(), and that's reasonably efficient.
>>>
>>> And if you have a *contiguous* are of pfns, you can use
>>> remap_pfn_range().
>>>
>>> But that "insert one pfn at a time" that the drm layer does is
>>> complete garbage. You're not speeding anything up, you're just
>>> digging
>>> deeper.
>
>> I wonder if there is functionality that could be provided in a common
>> helper, by the mm layers, or if there would be too many locking
>> interactions to make it sane,
>>
>> It seems too fraught with danger for drivers or subsystems to be just
>> doing this in the simplest way that isn't actually that smart.
> Hmm. I see even the "Don't error on prefaults" check was broken at some
> point :/.
>
> There have been numerous ways to try to address this,
>
> The remap_pfn_range was last tried, at least in the context of the i915
> driver IIRC by Christoph Hellwig but had to be ripped out since it
> requires the mmap_lock in write mode. Here we have it only in read
> mode.
>
> Then there's the apply_to_page_range() used by the igfx functionality
> of the i915 driver. I don't think we should go that route without
> turning it into something like vm_insert_pfns() with proper checking.
> This approach populates all entries of a buffer object.
>
> Finally there's the huge fault attempt that had to be ripped out due to
> lack of pmd_special and pud_special flags and resulting clashes with
> gup_fast.
>
> Perhaps a combination of the two latter if properly implemented would
> be the best choice.

I'm not deep enough into the memory management background to judge which 
approach is the best, just one more data point to provide:

The pre-faulting was increased because of virtualization. When KVM/XEN 
is mapping a BO into a guest the switching overhead for each fault is so 
high that mapping a lot of PFNs at the same time becomes beneficial.

Regards,
Christian.

>
> /Thomas
>
>> Dave.

