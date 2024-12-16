Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A59F31B7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C217310E685;
	Mon, 16 Dec 2024 13:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FtdzG3v7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0171510E2E1;
 Mon, 16 Dec 2024 13:39:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/iBwSNi0+c1H0Z5HOMHn98sPEPtm538BoCRCwVTrQg6Aeid9g8RfRLyJbyrvDNE1JcvcRGIuy4Lw/iPUPPhhuckEPkXCPFDWlBnzNdMPjmoI+0xzCDQICAclq0kAh5VJghfuhFX6UtOwvkhXSL5DxlXzFH6OLyGtsO4ZOYA1UdqF0phK2S8ImCPKpW9OpTYmxQ19+nxf6gR4zXOHnaVmTUYZa4jTpp3zQzW6I1BliHcVzr12xQ4nV6x+6eo3xMUt3ab6bHvmyI3Y+cvEGMqwGZplY0n5VKHYnImbbQWZwZZgZM0W6WLbUFndK3+PX9ABm5z4t7r2r2E6UBKuHs4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAvXLVTpbNT3YaGscpyANLw7Ln+xlphm8sW1tLAenhk=;
 b=diPkVQF7gpykU6MHDxMKnrqDQhS4eZskz8Zn5UKsGrULujB5aPoQnHWBu91Y9ypjb4S4XwcwpqMHr992CEtzIT9Q2H2I1f77OKQbM7US25NCqKOimWmK3nIQm816f9XnnkCHcPLpgxxUugkGXicEp2Ji53tujLVldNUKegOQhVKPZgMXsBu+sgOcaXmGZ+izQ0l1heToO1vvPtDYtSQFQw2aHRy0Q7y2JZlmINx14UVhCu3x3+41IoxM2IKBm6LdKMmECb5V5De+FIXqQUmSlJ7X5ILAD6+gXNm1XHHxvjFlAoLrRfYkYeuQiPnqEie6XPWQz8EZ1FBKMWuzniQgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAvXLVTpbNT3YaGscpyANLw7Ln+xlphm8sW1tLAenhk=;
 b=FtdzG3v7CZlRhPRlu8/Tplh4LY9BizHbl4vyud601+K0MYCPp1JkwaC3w9PgrLgK3hr96Wcp/6fCcGpQlTgjBy2ZDmjIN7BHIjF0v+8HGQijODZ25XJDuQM1Khh8JKphGeqPfDhL+5Iej/ZXW4j1bBF83RXYILrwgygCrK3Sbms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 13:39:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 13:39:52 +0000
Content-Type: multipart/alternative;
 boundary="------------NhugjEOkOWAjDnJdrJQFU73g"
Message-ID: <18343eaf-7eb3-481c-ad99-9e6fcd837c39@amd.com>
Date: Mon, 16 Dec 2024 14:39:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: "Lazar, Lijo" <lijo.lazar@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
 <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
 <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
 <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
 <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
 <6028b434-2be7-453a-9be8-bf2e85c0756f@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6028b434-2be7-453a-9be8-bf2e85c0756f@amd.com>
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 134e9df3-8382-47b4-2559-08dd1dd71e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUJHeWtWWGp1RGZaUlUrZEUzYlRxUHQ0amdtdCtvWXN3a2EvdEhQOWExbXpS?=
 =?utf-8?B?RUlxUEU4QjlZV2ZWbHExSDBoeTlxRVJKREJWQlB4NjdMczhxNnVtWk5KYXJL?=
 =?utf-8?B?M2lNelhtbUovczJoOHMrRVVFblNPQUhNd1pUSXBabzJPVjV3bFRyOGpUcS9V?=
 =?utf-8?B?M0JJcWNUSHIxcHRZS2NBaG5tVFRPaW9odkQ0VzFHWnJMVDFIOWNzc3hDRE44?=
 =?utf-8?B?MHZWdzBYTXdHeXFJR1lmbFRWSHd0Qjc5S1hiUzIvdHZQb0x2Ulk0V1lQeUNB?=
 =?utf-8?B?b0FWMUx5USttYjZ3amR1N0N3RDRLTWxiakt1a3podlIxcnBxWXMvZktHcVdS?=
 =?utf-8?B?R2NPTzJiNW93MnpvZUZjVUdVS3RSTnR2clo2ZFFkR0hIMHYyMTRqUkJZWVlU?=
 =?utf-8?B?Y1RpRGVVa3VQQVlWMnU4aExVY25DbjZjU0R6Mjh1SHRPZzRyQitpSVo1dG50?=
 =?utf-8?B?Ny9Jcm1GMGpQbEdVTjRLUVo2NENTOTIvOU11TTliTThwRGNLVlZHZnhGeVlm?=
 =?utf-8?B?SksvY2NwenNZMUxIZFZ1TmFSQ0NzQmViekQ5ZmVRZCtUTEJkM2xTRHJJb2ZY?=
 =?utf-8?B?THVvUmFYWHFnK050VGoxdXNHTzltNHY4am1manExbkg5aXE2eFNoWWRsbXNN?=
 =?utf-8?B?QXVNUTE0aExTSy9TWStjWlc0MGVTTmgvSFNPbkZmWlRNTCtOTkdxLzkvdDVh?=
 =?utf-8?B?ZWZ6bmlrZlpaSnZSSkgxcElaUjNqcjZ6QTkrZnh4SEJUSWZuaVAwMXNMZjBz?=
 =?utf-8?B?eS9vK1BoSWxmNkplQW5sanFLc1RrSGVlNEZzczFkN3A4ZGlTN2N4aHl1NXdE?=
 =?utf-8?B?L253ZTR4ekRrQWZaUlBtSDcxYUdxUkw4SDgyVTRuNHRQSnJyNlNDbzFTYjRZ?=
 =?utf-8?B?Zitwb2Irbk9ZQkVIZ3dUUzJRamFTN2pFcFg5U2FLWmt1UHVkR2ZvRXRKQ2o0?=
 =?utf-8?B?RlRkZU9HWnV5ak1ZN0RlenJVNE1WQlFuMjJ0QVhrSXVPRmMyTzZ0NXE3djVG?=
 =?utf-8?B?OUdveEo1VUlWSE5DUUtjeGNCb3EveGxUZThUOWJJVnpZR1N5bTRTUWhWOTNn?=
 =?utf-8?B?OEpOTnhzWUxXaVh1U0t5by8rdnpLVDRXQitCYWpQdlVYczhIQVZyQzJKKzlC?=
 =?utf-8?B?MVNrWVJsN1JLVEo5S25BdElXd3VqcGZpQnlUbzFvMFhiek9NYWQ5dmhSKzBt?=
 =?utf-8?B?ajMxMHpTMEJQVTNOUzZHYS9BYzRMT2NsQWZoeFY0RS9tSDNYazViL3o0M2pP?=
 =?utf-8?B?WTRrKzlRaUlwV2NkN0wzbEVCZnVtbFg4SXk1YldGQXJCdnllcnZWQ0lmM2Fs?=
 =?utf-8?B?L2ZIZ1BTcGlCZXhYVEJGeUVSbldOSEI5b2lzaUtTc1pCaUhVOWxzRmxzcGJ4?=
 =?utf-8?B?RmJ6ZzIwWjJabHdtVXZWY2t6V2g4ZXJVeTZuSmx3TisxWWNVYjl6MmlXdGdS?=
 =?utf-8?B?UXNBL01kT1ErQ0t3cnRucUJnci96Mnk4ZXBzTHJOQ1M2Z3ZaakR3SWwydjN6?=
 =?utf-8?B?Z1VBeER0VEhTc2N1NWJncU1WS1UxUmljNFJ2dXlidjl3MyttUGYzRitFNURQ?=
 =?utf-8?B?M0RSbVd4N3Y0Vzd5ekdWRkxnZHU2YUkxVjBUbm9VT1R1SjdQbnUrd1pReUJT?=
 =?utf-8?B?Z2pFSVdaRzdVZmhNd2p1RE8xZGxRVDJvM2hyNDZFVEdzOW5YbkhEeHJOWEhk?=
 =?utf-8?B?U3B5dkpBbS8rSi9qSysvbGN2anNOT0hqNElxcUtVVW95UzRzMEUwdDdUVDFj?=
 =?utf-8?B?a3BuZWZjYVg2YWFiM3dKVExhM0hMWjNiRHVkWjVLY2ZOSkJzeG1MUmIzTzFK?=
 =?utf-8?B?L1NoYkk4QjFYNzczdEVjUlR1R21XR1Bkb1JpQ29jSWFRU1d1U2g1MWNjMDFr?=
 =?utf-8?Q?CrdCUEklmnixF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW1jdlZGVFlEMzlHNlo1OURRSzkycFpFODlJdnVlanVLMGRoWi9xN1NQTzFy?=
 =?utf-8?B?UXVaRksvdnQ1WDJpcXZGcGJGdE03b1MvU3B6SHprTm5mR3JHbEhRMmVqZEk2?=
 =?utf-8?B?NTJOU2pDS0dGTTRTZUttVWd1NlRrbmtTK1JrUVFkQU1CRlc4RVd1ZEhXMmFZ?=
 =?utf-8?B?QXRIdU5CVlV6V0NWblllRVV4ci9hSlJNYllta3BBQlBabVNTWW9jck84QWdk?=
 =?utf-8?B?MTB5dER3eGV6MktZY2NleUhRZnVmMXliNlQyNmxpcmd3WFBMNUZxdXpUNWg2?=
 =?utf-8?B?WG1meFhPTTBCZmVQVEV2RG14c1pUaFl6cGduNkRlQ0NVUlI0K1Z2a0lSRzlR?=
 =?utf-8?B?Q0xDNERwZXhVSHJRR3VyRk5ySDNKVG43VDFUYnNxSkFoZm02YnBPa3VSSFlJ?=
 =?utf-8?B?RmpnTFdSWGsyb0tMYi9TY0tDdjBHV0x3ekJWOTZCZW1yemkwbDdpS0JhSXZK?=
 =?utf-8?B?a3AxMFFwSEprZ3NCZXpWQk95VnV2N2ppbHJ2cWNMNWltNjY5R2FwVUluMFl3?=
 =?utf-8?B?KzVRQ3VVTzEwMDRvTHB0eFVWbkJwMlFGY1E4MVFPUXJna2grWmc4a0Mybjlo?=
 =?utf-8?B?eE1RdEpoQXhxTFNvQldVOFFhREZXd1h4VU55cjNPOGhSemtaSlNhZ1lCOVlu?=
 =?utf-8?B?MXJZMHVKRHViOHlEam55SEUzdVlIRHlrU1JoSzNkSFQ1NEhSSTZJWTI3MG5n?=
 =?utf-8?B?cVNFdXl6Tzh0MURFaTBYUStibUZ5R1BXSVNValpsV3lscFV2c3Q2Mi8yamph?=
 =?utf-8?B?NW1VandhK083dFNrQmdsejRUNkJrcE95WS94c3RjcTF3ZWNobFFDaWI0dnl0?=
 =?utf-8?B?NHJuY09oeGtreUpCUjlFRDlaT21BV1JEZnk0MFJmQzh1cnNLL3NsOEFoaWkz?=
 =?utf-8?B?SDBnNDA4b0dqUjVNQnd6dGtIL2NBak5KUXZFUTBpRCtneTJHY2hBNEIva0tM?=
 =?utf-8?B?NUpaVzNhQWFtL1ExMlgrcDkwN3BseEVwRjdMSkQ2RkgrdU81NElsKzZ0dmNN?=
 =?utf-8?B?WjhDcHk5TFhqR2k4V2hTb1gwei8vRVQvSlNEMitOK3U3VzdCNjQzb1pIbndF?=
 =?utf-8?B?eUlMZEhXRmd3QTFVeWdLR2hGek5TSTVVSU5LVCs1MjZCNUxBcForTWFBRENm?=
 =?utf-8?B?UHMxWENJTjNzZFh6RGRSZGQ0ckM0NjJ4eExhV0JGd25JYWk1OG1TWFIrRWQv?=
 =?utf-8?B?T2hFOHErQXZ5Y2UzeFNsSmpPZ3NQenJPMUp5MXVucFJaeHRDb3Qra1lQZzNZ?=
 =?utf-8?B?ajlnTjZvQS9kcHZUQStVNzJXUTN5V1hmbE05dXlXckVXWUtadTJKN0ZQOGZo?=
 =?utf-8?B?ZVRPT3Vpb3ZEU1E4Z3N3NnNiV01QT2pxTGdncWJJaFBsWkhYNk13ZWxPN3Z4?=
 =?utf-8?B?MVEwcWpHc3UzcHQrdEFjYTVjWWtlSjVNVXJJR29OSFlTb0RLZm1OdXh2SzAy?=
 =?utf-8?B?MGkyNnZ2UURuUGxHdVlLR1hlTXlYd3VHaU0rRGx2TUgxR0hGYmhsang3UWRS?=
 =?utf-8?B?aTA1b3VxbENGS0U0VXVNQWdoenNqMkxmTlo2QTluNnRWMElYWkFlaWtOM0d0?=
 =?utf-8?B?YTZqRU5NbHk1WVlncDUzNUVzSzh3a09nQS9QQnhUMlUrS3ZwakM4T0w0RDJh?=
 =?utf-8?B?SkNZZm11ekViVTh3UmErYUo3aFArWW9CZGdubXpoam5xaWRvR3Q4NVZXc2dM?=
 =?utf-8?B?ckNoUlRYYTBaNVY0U1ZyMThLZGsySG5ZYlA2RGd1bDBqYzkrK0dtWllVQ2x1?=
 =?utf-8?B?RjFkVlVpanFtRzVmQXQvOVdQcjhmZkdyb2pIbWo4YU1US0VJYlQwZSsyeExU?=
 =?utf-8?B?Rk9hdVFwS3RGU1QvK0ZERzRQVkN4VzdoaE5IdkNvRExENG51WnNOWEdOL3F6?=
 =?utf-8?B?MUt1bjI4MFd4YTVuclhyV3k3TXVpYWlDTjZnWVNlS0VDSi9OaTVwV1gzc2pE?=
 =?utf-8?B?a0dicmk5blJCOGlZQTl2OUlnNWJsQXNvVFg3dzdKQ1E1YWFjN05lOUtMd0hv?=
 =?utf-8?B?QlUwL3U3WW96L3dWMnMrYlR2OVdPTW5PTlhCUXdJdVVlcTVpbWxjS0ZkeS9a?=
 =?utf-8?B?T1ArV3ZBcGZYTFdRcFdIWmxGNUZlL1NjMEdoRlpLWittTUpnRTJwZUFyYVRF?=
 =?utf-8?Q?JWbt6xLqYBTnRhprhxoCP3Vs/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134e9df3-8382-47b4-2559-08dd1dd71e2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:39:52.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPJEqfixODXAwqDWI2UQ9gg/YSAB+cg0ZsCFPc70Dud9hxRcbiqxpmT7aS8WXdme
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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

--------------NhugjEOkOWAjDnJdrJQFU73g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 16.12.24 um 14:36 schrieb Lazar, Lijo:
>>>>> I had asked earlier about the utility of this one here. If this is just
>>>>> to inform userspace that driver has done a reset and recovered, it
>>>>> would
>>>>> need some additional context also. We have a mechanism in KFD which
>>>>> sends the context in which a reset has to be done. Currently, that's
>>>>> restricted to compute applications, but if this is in a similar
>>>>> line, we
>>>>> would like to pass some additional info like job timeout, RAS error
>>>>> etc.
>>>>>
>>>> DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done a
>>>> reset and recovered, but additional data about like which job
>>>> timeout, RAS error and such belong to devcoredump I guess, where all
>>>> data is gathered and collected later.
>>> I think somebody else mentioned it as well that the source of the
>>> issue, e.g. the PID of the submitting process would be helpful as well
>>> for supervising daemons which need to restart processes when they
>>> caused some issue.
>>>
>> It was me :) we have a use case that we would need the PID for the
>> daemon indeed, but the daemon doesn't need to know what's the RAS error
>> or the job name that timeouted, there's no immediate action to be taken
>> with this information, contrary to the PID that we need to know.
>>
> Regarding devcoredump - it's not done every time. For ex: RAS errors
> have a different way to identify the source of error, hence we don't
> need a coredump in such cases.
>
> The intention is only to let the user know the reason for reset at a
> high level, and probably add more things later like the engines or
> queues that have reset etc.

Well what is the use case for that? That doesn't looks valuable to me.

RAS errors should generally be reported to the application who issued 
the submission.

As a system wide event they are only useful in things like logfiles I think.

Regards,
Christian.

>
> Thanks,
> Lijo
>
>>> We just postponed adding that till later.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>> Thanks,
>>>>> Lijo
>>>>>
>>>>>> Regards,
>>>>>> Christian.

--------------NhugjEOkOWAjDnJdrJQFU73g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 16.12.24 um 14:36 schrieb Lazar, Lijo:<br>
    <blockquote type="cite" cite="mid:6028b434-2be7-453a-9be8-bf2e85c0756f@amd.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I had asked earlier about the utility of this one here. If this is just
to inform userspace that driver has done a reset and recovered, it
would
need some additional context also. We have a mechanism in KFD which
sends the context in which a reset has to be done. Currently, that's
restricted to compute applications, but if this is in a similar
line, we
would like to pass some additional info like job timeout, RAS error
etc.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done a
reset and recovered, but additional data about like which job
timeout, RAS error and such belong to devcoredump I guess, where all
data is gathered and collected later.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I think somebody else mentioned it as well that the source of the
issue, e.g. the PID of the submitting process would be helpful as well
for supervising daemons which need to restart processes when they
caused some issue.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
It was me :) we have a use case that we would need the PID for the
daemon indeed, but the daemon doesn't need to know what's the RAS error
or the job name that timeouted, there's no immediate action to be taken
with this information, contrary to the PID that we need to know.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Regarding devcoredump - it's not done every time. For ex: RAS errors
have a different way to identify the source of error, hence we don't
need a coredump in such cases.

The intention is only to let the user know the reason for reset at a
high level, and probably add more things later like the engines or
queues that have reset etc.</pre>
    </blockquote>
    <br>
    Well what is the use case for that? That doesn't looks valuable to
    me.<br>
    <br>
    RAS errors should generally be reported to the application who
    issued the submission.<br>
    <br>
    As a system wide event they are only useful in things like logfiles
    I think.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:6028b434-2be7-453a-9be8-bf2e85c0756f@amd.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Lijo

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">We just postponed adding that till later.

Regards,
Christian.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Thanks,
Lijo

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Regards,
Christian.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------NhugjEOkOWAjDnJdrJQFU73g--
