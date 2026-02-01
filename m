Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNWyEky8f2nAwwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 21:49:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71464C7376
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 21:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445110E0DF;
	Sun,  1 Feb 2026 20:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="anyzAZjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010069.outbound.protection.outlook.com
 [40.93.198.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E7C10E0DF;
 Sun,  1 Feb 2026 20:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slTKyiePjGLlSkMU8/zATnCORYpaWBzcKSNEez8a2RNNibfEYNz8Cz11WIkoIoE89U3ounZ4sVWtmV70BjTM3f9Cm/ft8DQTrkB92THCqEUHV4EotLdNJ7CcOMjM8OQinb4evxORdgWMGk4eDcWsVeDv1yrbsz6A5UXk+1nAKi81qBEPiu9NY2BTuvAGgluH9GgjfCL3xi+I+PEmuBEys4SlGDzALNtrbxip2taBKqXZYN72rQDXkg5s2zwu4XKWQ4fwUcYcMdR3ONWGwAie9x7XEyqqY3XhKVWppQSRO5j+GoDxeQgu/zi/vQv4DDfP7GKUVyHsj45EbrsUjv+cgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qc8BxuIdQuCu6p8puGCu3Ix62wcZnFd8+TyK5awbBzA=;
 b=VkFKxJJQsguFQ7VbC/WaOlQ2sJtCNWAmRW+ePwfUkJbpxzCfCigtB+krZPFWueuDgSEWeUxMktLzGzteoRfV5ozJCoHLFqCT5SSpPVaDUHqymngGKzblA29CYX1rFuxldiI9Id9OCKYdSYzICmBDzSgY1loFJsOtN06KRDIZpLAry4RPuUxUKIIfh9SJkLiE/qEc/3lY8YGfkimUeAlRV4c8uTWhiiz3uSFjDyC+6dcdCpH9FMNUbww7ZHWqFmVd1Pj52zhJ3ThW920fd4/P8B6FdMDRV9Hfrbt56uZsLXhIcOGepezhnYbZG+Mgs6al3TiEuIDonba86uv6aKmryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc8BxuIdQuCu6p8puGCu3Ix62wcZnFd8+TyK5awbBzA=;
 b=anyzAZjMO8CzANqgrQkl8TpBIjF9xJ8U3JbPrPKnSnLU/E8tp9PXnw5M1i6n4LV99gImdVo/j+OhMXAN5CCpNLcZE9PZSGZ9jjQ+kQs8oBpBxYD0hXmV1Grt5ncrrZoBIFVRVrivyVV8eoymtzOkKivUS/E4MPD3mS03odBE5Ejr40616C7u5ZRRiUu3Y4XMXGDpsw1UwiLrobNYRmfd8j2paULB6s6C2MfE7KyYQnFT0ITkJ4LSjMrJR28HKmyc7t+O5FwxnRCYFz5lke2w85c+HgnTqzqe40JipUKFOOj9DLOUeLaOslSEcUNW3n3DYeWBxjNjVn3Eh5spp8NBKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFA42F4F89B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6dd)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Sun, 1 Feb
 2026 20:49:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.016; Sun, 1 Feb 2026
 20:49:04 +0000
Message-ID: <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
Date: Sun, 1 Feb 2026 12:48:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, intel-xe@lists.freedesktop.org,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, linux-mm@kvack.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: 097ebbb3-100d-493f-df6a-08de61d355dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N21sb2hFT1dpYVJoYUdGa25mdzZ5d0NzblRabFk2TE9wMEdDcFdUbWsvTmhr?=
 =?utf-8?B?bDh3eS9zMnRaaWtjREZ0NzhvTUFnajdmM2xaQ2NRT1Npb0Zja2dVUDVrQVI2?=
 =?utf-8?B?dlNCY2xycEJsYVR0bWNqeDhBS2l6Ym5udFM2SGhGY3Y3VDR0UUpRVFZXZHhy?=
 =?utf-8?B?eDFZTnRubXA5Qm9YbHJXT01hcmZBSTRPdzhxc3BSa0Uva0ZBT2N4UUFrbGVs?=
 =?utf-8?B?eWRTLzR5NEIxRTNwQWdkaStJamlmd2dFOFExTE80ZmNzUGJERm01M0NaUEl0?=
 =?utf-8?B?T0lIWnRKcHhScUEwbnoxOEJydEhqcVE2eVRJSDJTaDBjL1Z4RjhuUHk0cjZx?=
 =?utf-8?B?aTR2Mm1yTCs3ajZVYWZVOHoxQnUyeUVEQ1NEVjFRN1BpTUltamtqd20yYzFB?=
 =?utf-8?B?eEtDZHEwU2ROWWlXcExYdzg1RFd1WlhHV1VpMStPekxyN05lUW9NQlRHQ3Ez?=
 =?utf-8?B?bktCWlhNQTRaRVBmOGxpMDUyZk9pTnlKTDFsRDV0MTJkY1JtazczdE9Xd1pK?=
 =?utf-8?B?dGp1WkNJcUJpT2pSU21xZ0JTTHNldGlMTzFSV1lJYytiQk14aWZRWHgvNjAv?=
 =?utf-8?B?OGl0ZnJqZHVQTkdGeEl5MXg5YUNQTFVRVE56K1h6WG5UaUZhbmFCUVlFRVBl?=
 =?utf-8?B?Qk1Fa01KQUNTK1FBNXp3NTJFSVRXbEtDQnRkTjRObWpQTk9BaEw1OXFvdWlJ?=
 =?utf-8?B?MU5rR2ZQMy90L1F1QzVoN0wrVnZSdmRpWUUrY1czVGNvby9KOG0xTDVpOWpl?=
 =?utf-8?B?d2F6b3YyazhqL0s1WkE1ZXkxc2R3TGlrOVFDM1JJeFdVQzBMWE1WamlweTVL?=
 =?utf-8?B?T1hyRjlBV0M2Z1loL3VDQ0FEQWRnMjFUMGFMY1RCY3dlaGMwVkNSeDN1d0l2?=
 =?utf-8?B?c0pFL3A5ZUxxMVdacjc5cUVUNzZxbGdBUXNCdHFHZFVjRkltNjY5MnIxd1Fn?=
 =?utf-8?B?cEZ3eWZXWDZIUGl1TStQaFh5ZmxkcTdUYlBFam1qM1ptWTk5L01jaVJVNGhi?=
 =?utf-8?B?ZmlFVlhaM3ZFS0dveGlUMzVNWDZ1QmZobnd2RU1XdDJtMWt0WjJ0aTl4dUVJ?=
 =?utf-8?B?VUpxVW1YaG9LQVpNb2l2blV5bjRaakJtcDRKWGh6Yk55QmZZZGpJUzdBbjRX?=
 =?utf-8?B?VmlQa08yR1FTZEo4aS92eG1iTUEyaStPYUNYWEhaWmtuMTFLZ0xNaXo1NnFs?=
 =?utf-8?B?ZFYxdjYrNSsvODBLcGM4YnFTdDB3NnFXNUtvLzhVUW9EZ3Frb09NYWkxK3c0?=
 =?utf-8?B?c21NRVJTK0xWeWtUNU42RlZkbW1hQXJqNHFRczIwV0paUkdhSS9hRFdTM1lG?=
 =?utf-8?B?YXRRaDVraTU0b1oydDBsU0czUFpGcm5HTWVXWGdzNGMxWjJMeGppamQ5WU42?=
 =?utf-8?B?T0V1NGs3VTE3cmJjUzl3Rm5lKzhxQjFFMk1KY201L2Z2ZG9IOHh5NGp4eXhi?=
 =?utf-8?B?TzF5Z2YxRTVPVWFvWHY5WEpnZlhwM1ZNSE5SZzYrZitwRTlOWFpuUk1aS2Jl?=
 =?utf-8?B?VE5BWkE2UWQwNmNBMFRGUzdSUFN1SWUxZDBvS2VCM2MzUE5ORmZkOEZVODZq?=
 =?utf-8?B?SnhDdGVDTVh1T0FWSkk1Si8yL3JFSW9neStaMFFQWi9CcHVrazBzc1JjTVJK?=
 =?utf-8?B?bUg2MkNEVHprT0RSVkZqSXVOTi9Semo1c3FCeDNpcXB2ZEJXTW9sYW1ndVJx?=
 =?utf-8?B?V1NNck4rWmNoSW8xY2xXVVQveVZ0cGJuRmJ3N0hTdkcvTEVaQjZvVyt3MHpB?=
 =?utf-8?B?WkM1V2xpY2R5cnpxVklmN2piNlptLzlJdjIzaEtmQ2VhRkVwL3dDMHRrM0Ix?=
 =?utf-8?B?Zy9ORHhqcmFnUHY3T3FFTmpGYThpMitWaUhQcnM4WDhlSklsL3paV3kxWkg1?=
 =?utf-8?B?S2tkU05tOWxwVFBHaXo3RmlncnM1VW5wQzZaeFp0TVl1Y3luZmVmVmJtaFFo?=
 =?utf-8?B?K1g3MWZ4TVIyZkZnU2ptdnVrUVduMDJSVy96aDlXR0s2N2JJcFJFRGJrbGhY?=
 =?utf-8?B?bXNpME9Kd3ZVWnR3Q1dGODhoYmpFdEN4MFY4Q3RoUE85MTBaaFhZaDVNSGdR?=
 =?utf-8?B?cnpjQ0tmcDhRTnNQZzh5dGNhK25JSWdrc1poN3pGOFk2Skh4U3owR0IyTTY1?=
 =?utf-8?Q?wVBg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGhxeDhQL0F6S2krL1NydzR2VTIzaHViaENJT3RsOUNRNGVkakJ1ZzA2OWlu?=
 =?utf-8?B?d2dLRittRjBTR1Jkc3R3ejJ6Qnd0b3JvM2l6YkxYNy9zNXVKL2RIc293dmJP?=
 =?utf-8?B?dmdaSlh4WEhpMHNRa3BvWjJVYWFjNFdhbDU4Qk9SWFFpa2gwYUYxM1k4ci9P?=
 =?utf-8?B?NXM1c3R5S3JoNmFoUnpaUXEwckEyQkVnRlNjS1c2bU1uR1Qxdkd3SFg5YjM5?=
 =?utf-8?B?ajFqQWk5M1ZzNkN1U1lpSXgxaFNtTzRWS1cvQ05QL2swYWVHM0cveFNHYnJH?=
 =?utf-8?B?Mkp4VFc5RjJwWWhjVnpKOFRWNEVqaFFFckJYdlNtYnprWktnZ0dCa0tUeWpQ?=
 =?utf-8?B?REhCQm5JY2s2R2FSWTh0U3UyWnhmVW5wdTRnRWZaNkNMLzRRYTE2YUJXQlJl?=
 =?utf-8?B?NE5VZU5OOE9Td1V6dU9BbGtKejFtTjQ2bW0rNDV6Nm9pWnVMN3ZUeFRlekh5?=
 =?utf-8?B?Q1EwVWk0TDFqNkJDSHg2YnNPTHI0Y1hzWVMwVTNNQmJIbDluU0M4YTRPcE5v?=
 =?utf-8?B?RHo4c2xVN0YrMjNMZ3l5bWFoZENsNUg0SFB0T0cyZlNjTjNSeU9JQ0VKVXNV?=
 =?utf-8?B?cEc3L0c0VTdyMDhLT2Z5dmtMcWYvb0FIU2E5SzV4R2NyclhMRXhXa1dWWE1V?=
 =?utf-8?B?ZkpvdUc5R2l0REQvc1paOWh2RkFLYkhPdEU0em0rL2UrL3BuZ29QRW4xcS9N?=
 =?utf-8?B?N0pyak52UHpRdTRzNUZETHlIeE1MN0JscGJXdHV5TkFiS2lhejlVZmNDakli?=
 =?utf-8?B?MThjSmduM1FFMjBnR3BWeWlvS2pRQUpOUlpMY3Q4ZzRLR0pOS2h0K3pkMXVP?=
 =?utf-8?B?ZHB0TFVMWEJzTWMzTXd0bWYvZzV6QXl5UjB4VExqTkJycVpRZWhhR3VORTlW?=
 =?utf-8?B?NVJobmlpOEdxTnJvWjJPSi9ZSVUyek5FcDRybG0yWWpCZXhzejNnTHlaSXBq?=
 =?utf-8?B?UEFDOWRhcWFTMS9uNkdURzFsSTlDbmIyelpYQnBHOEl4L0hmWE5RNTJ0Ym9I?=
 =?utf-8?B?emRjam81L09VZHI0QXB6RExBS2lVZE12UHYwV3ZOOTkzSTk5SDBCYTBVaS9l?=
 =?utf-8?B?L1h1WFdlTDNCc0pHUktheHhGUExtSStWMkozSE9iRkcxVGxqWkJUWkY2SWFL?=
 =?utf-8?B?MGxIbTZlK1lWWW1TamVuMUNUTDNNOExDMWxQbTBsOEY1eDd2em1vSy9BaVA0?=
 =?utf-8?B?MUtwdVg0YU42RldHZnhOTGFKTkpIanN2YWJ0b0hRamlVV2JQamxzUUZ4TE1G?=
 =?utf-8?B?czRsbVFLVUdUSTJLamMyUDNiOHd6WXBTOVlNZTVmazVPSHBMRjhvSXF1eUww?=
 =?utf-8?B?MVRVSmxhcFh4ODExVlhBck5nenU0MnRFeFY5d0F3UUhqbCt5NUJ3RUtNbUVs?=
 =?utf-8?B?VzZtdkI3WGhCWEQ3bEdmcDA0N0poUEpMZkpPVEY4aldsOUtEeUxITkpROFNU?=
 =?utf-8?B?MUZQZ2xWQlBHWWVEL0FRc2ZoNEM0UW5xVEJsVGg2VktuYU5NUGhOeXl3Mktp?=
 =?utf-8?B?TUdJVlIxNWZ3ZnFvMW4xOU9uK2ZiMDVYL2J0akNnSmt0dHJZWlpWVnB0QTV4?=
 =?utf-8?B?b21BZE9IWEJUL0dXQmtNUEc2YUdEUW04RXF4RjVHUzdpb2ZMOXRqWHA0L0pJ?=
 =?utf-8?B?Zyt5dGZFT0xUZmhGZ245ZHZ5SFNBWDB6UG54em1zb2FhenlJMFg2VHpieldH?=
 =?utf-8?B?dEJiY054Wkw5VENiZkZlczBWQjZpYUFiay8rOUxnYk9WSkZsdExnQ0tkaGg2?=
 =?utf-8?B?MG1jUUluNWtnWGhaQ1lObFNtZjdWcVFBK1NYNnVaY1JNTExBeGcwM1k4T2lo?=
 =?utf-8?B?eGxoN3dVRTgzTU1MRUxoZC9LQy9PdU1rOTNsT1EvZTRxcXhtTzU5allISFht?=
 =?utf-8?B?Qyt0cFZnQWR2Z0FXMUMvOHEzUTNqbkUyUnlISW05MW9PaVVrc2NDbHVzaThl?=
 =?utf-8?B?elJ1OW1BZVRkVkVIdE40d1doWkppbVhtMlBJVHp1aU5vdVIvenNBaFBoYzhX?=
 =?utf-8?B?aEE5ZGJuQ2dRWENodjFtSlpibHlpbkI0cFFtRWlyQWtNbEJaWlNOaENIczRC?=
 =?utf-8?B?bGlqTG9nUmU5WWpUaElZRWNSUWZMSFM2VG8zVC9penhWWWlZeUZ0ZGdKb2o2?=
 =?utf-8?B?NTRhU2ZEVSttRzFKM3ZOSnBpL3B2c3RkQzZXL3BVYnY2b2tvU0tGbnFkTW9W?=
 =?utf-8?B?dU1qWS9VRjRPL1JlV1hBZ1BseFJRclE0QmVsQ201RDZtRG13SUtEa3MxZUJX?=
 =?utf-8?B?NTFHWlBTYjFoK01GbDY4RldCZGR2Y2tXZFpvd1lWK3ZqaThtUnhhSm5haVox?=
 =?utf-8?B?N0hZdGt5bkRsb2hJT25PRHAzQTg5UEJiSHFRa1pzTldHTFlScEMzVnQ4c3V2?=
 =?utf-8?Q?kumzGkAjmmiYQVKc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097ebbb3-100d-493f-df6a-08de61d355dd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 20:49:04.1692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gS0qag0KVj2iWjPTJRUWxDqGuS+mdOR27pPDsTKJQeGPgN1OYXajkTaoExjeIH/y4Nu93qYc9J/HMdwOaTEXsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 71464C7376
X-Rspamd-Action: no action

On 2/1/26 11:24 AM, Matthew Brost wrote:
> On Sat, Jan 31, 2026 at 01:42:20PM -0800, John Hubbard wrote:
>> On 1/31/26 11:00 AM, Matthew Brost wrote:
>>> On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
>>>> On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
>>>>> On 1/30/26 10:00 AM, Andrew Morton wrote:
>>>>>> On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström wrote:
>>>>> ...
>>> I’m not convinced the folio refcount has any bearing if we can take a
>>> sleeping lock in do_swap_page, but perhaps I’m missing something.
>>
>> So far, I am not able to find a problem with your proposal. So,
>> something like this I believe could actually work:
> 
> I did something slightly more defensive with a refcount protection, but
> this seems to work + fix the raised by Thomas and shows no noticeable
> performance difference. If we go this route, do_huge_pmd_device_private
> would need to be updated with the same pattern as well - I don't have
> large device pages enabled in current test branch but would have to test
> that part out too.
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..1e7ccc4a1a6c 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>                          vmf->page = softleaf_to_page(entry);
>                          ret = remove_device_exclusive_entry(vmf);
>                  } else if (softleaf_is_device_private(entry)) {
> +                       struct dev_pagemap *pgmap;
> +
>                          if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>                                  /*
>                                   * migrate_to_ram is not yet ready to operate
> @@ -4670,21 +4672,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>                                                          vmf->orig_pte)))
>                                  goto unlock;
> 
> -                       /*
> -                        * Get a page reference while we know the page can't be
> -                        * freed.
> -                        */
> -                       if (trylock_page(vmf->page)) {
> -                               struct dev_pagemap *pgmap;
> -
> -                               get_page(vmf->page);
> -                               pte_unmap_unlock(vmf->pte, vmf->ptl);
> +                       pte_unmap_unlock(vmf->pte, vmf->ptl);
> +                       lock_page(vmf->page);
> +                       if (get_page_unless_zero(vmf->page)) {

I think this ordering has a problem, because it releases the PTL before
getting a refcount. That allows another thread to free the page, and
then the lock_page() call here will be doing a use-after-free.

That's why I reversed the order of those, and then as a result the
get_page_unless_zero() also becomes unnecessary.

>                                  pgmap = page_pgmap(vmf->page);
>                                  ret = pgmap->ops->migrate_to_ram(vmf);
>                                  unlock_page(vmf->page);
>                                  put_page(vmf->page);
>                          } else {
> -                               pte_unmap_unlock(vmf->pte, vmf->ptl);
> +                               unlock_page(vmf->page);
>                          }
>                  } else if (softleaf_is_hwpoison(entry)) {
>                          ret = VM_FAULT_HWPOISON;
> 
>> diff --git a/mm/memory.c b/mm/memory.c
>> index da360a6eb8a4..af73430e7888 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>   			vmf->page = softleaf_to_page(entry);
>>   			ret = remove_device_exclusive_entry(vmf);
>>   		} else if (softleaf_is_device_private(entry)) {
>> +			struct dev_pagemap *pgmap;
>> +
>>   			if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>>   				/*
>>   				 * migrate_to_ram is not yet ready to operate
>> @@ -4674,18 +4676,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>   			 * Get a page reference while we know the page can't be
>>   			 * freed.
>>   			 */
>> -			if (trylock_page(vmf->page)) {
>> -				struct dev_pagemap *pgmap;
>> -
>> -				get_page(vmf->page);
>> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> -				pgmap = page_pgmap(vmf->page);
>> -				ret = pgmap->ops->migrate_to_ram(vmf);
>> -				unlock_page(vmf->page);
>> -				put_page(vmf->page);
>> -			} else {
>> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
>> -			}
>> +			get_page(vmf->page);
>> +			pte_unmap_unlock(vmf->pte, vmf->ptl);
>> +			lock_page(vmf->page);
>> +			pgmap = page_pgmap(vmf->page);
>> +			ret = pgmap->ops->migrate_to_ram(vmf);
>> +			unlock_page(vmf->page);
>> +			put_page(vmf->page);
>>   		} else if (softleaf_is_hwpoison(entry)) {
>>   			ret = VM_FAULT_HWPOISON;
>>   		} else if (softleaf_is_marker(entry)) {
>>
>>>
>>>> But it looks like an AR for us to try to check how bad
>>>> lru_cache_disable() really is. And perhaps compare with an
>>>> unconditional lru_add_drain_all() at migration start.
>>>>
>>>> Does anybody know who would be able to tell whether a page refcount
>>>> still should block migration (like today) or whether that could
>>>> actually be relaxed to a page pincount?
>>
>> Yes, it really should block migration, see my response above: both
>> pincount and refcount literally mean "do not move this page".
>>
>> As an aside because it might help at some point, I'm just now testing a
>> tiny patchset that uses:
>>
>>      wait_var_event_killable(&folio->_refcount,
>>                              folio_ref_count(folio) <= expected)
>>
>> during migration, paired with:
>>
>>       wake_up_var(&folio->_refcount) in put_page().
>>
>> This waits for the expected refcount, instead of doing a blind, tight
>> retry loop during migration attempts. This lets migration succeed even
>> when waiting a long time for another caller to release a refcount.
>>
>> It works well, but of course, it also has a potentially serious
>> performance cost (which I need to quantify), because it adds cycles to
>> the put_page() hot path. Which is why I haven't posted it yet, even as
>> an RFC. It's still in the "is this even reasonable" stage, just food
>> for thought here.
>>
> 
> If you post an RFC we (Intel) can give it try as we have tests that
> really stress migration in odd ways and have fairly good metrics to
> catch perf issues too.
> 

That would be wonderful, thanks! Testing is hard.

thanks,
-- 
John Hubbard

