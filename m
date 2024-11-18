Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548A9D1018
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 12:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDFF10E13B;
	Mon, 18 Nov 2024 11:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YyJ5uhGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB1C10E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 11:48:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQOcVXw1LasCnHTyq7LjJJsHAzh3G6/NlZH4WaRfKrRsRvvD5XgYEYvd+bwUTD6vPYzHK0OGmH40cL9Jttv3EEP1eaQoH5W40LkwFxA1iJKuN9JptJtI+O/oU14ofqXhK1fopPkQUgdaOMUCKtMPOSjZ7crlIRYUooslYPytUZhCbj1MHabVqPeV2Ufd0znLBNK/u3WyeQnAg9hyix9rGpV+WOZbc6AhCN78LByuA412vowvmBChxgQacJOtjQt45SLWZmfV/FCAXwN4ty1XjS23cQ1FL3a5ifBgARM8W/8cgKgbVX8xee4gU/0jR/E/RicBn3aOyhcq0GbUEnkQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aqRSzh4wEE65PTYMQla5l/jSqEjv12VC6sTTfP8XHs=;
 b=KaNu3JC64xceQ6QM8BpqAteEUXB09GnfR+dtD7UQwCqtXrba/3UWoLAU35ONDFAYhTPJaYl+oVk6EA0Hn3VhyIPytvhF+4QJIff40SHoceOYXRuoy1sfnu9feqrJdu0ju9a8rfoMJAekIn1wW8fC98vrZShvB0YZse3qP399343/veOo99HdZ93Tf7+mdyuneKGSfWRMKrWsmk+7HbRSSjsKVHHU5/lpffEcgdaopJmQR9eZsG8bc74DVWzCeD4ERKudpXEx0JuK73uyBKWwSmPNrw758qKwLkmdWFGLaydmTIA4PAq0FVq+vnZlLJ4cYtzqhX255iy7Uny7ibGLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aqRSzh4wEE65PTYMQla5l/jSqEjv12VC6sTTfP8XHs=;
 b=YyJ5uhGHuqMbR4Icwbg8l1HVlsrmW1Nci1wGIljsKINpqizXeKrAmykqQ7hbzwNyt+P8ILrf+wiK5wyF5ZckwEJxjHozTpEtD+2/diTh7ZbLaHdkNlZUIAP57L6Bt63IIqjTbc9yWpoCXMuSriE9aG2jH1UEG2IdFGFolBPvlsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6050.namprd12.prod.outlook.com (2603:10b6:a03:48b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 11:48:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 11:48:16 +0000
Content-Type: multipart/alternative;
 boundary="------------NZoQTz0HHi23mhik00rlX0gR"
Message-ID: <bf44095a-8f31-46c4-8bf5-cf98b4848a76@amd.com>
Date: Mon, 18 Nov 2024 12:48:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: Philipp Stanner <pstanner@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 ltuikov89@gmail.com, Matthew Brost <matthew.brost@intel.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
 <a2ef4cdfeb31ad95de9311274de73a51cdc54a97.camel@redhat.com>
 <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com> <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
 <32fdb74a-00c5-489c-b561-c530d23c4098@amd.com>
 <4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com>
 <d103054f-7331-4b00-8105-3e88fdab0486@amd.com>
 <85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com>
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2a8673-9485-402c-7d9e-08dd07c6e40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUp6UkY0akVYUFZqQUxJcHltYUNQcFJlSjFmRWVlVG1DMzhlOGJFVUZXaUto?=
 =?utf-8?B?UGtlTUY3MnVNYkRKUFUwQ25UMU9oZytQMHJ1MXFHbGhFL1RPZ1krNzZITitV?=
 =?utf-8?B?Ukp1Q1FRRWI4TmR0NUxRVjQvVVR2NjdJcyt3MW1Xd1VUNUhTaUwxbEFzbm9u?=
 =?utf-8?B?b0c0QmFoTjE2MGVXNERpYlZVMXZyRVpSRi9XTHYwcmI2dnh2ekZpME1LTVNh?=
 =?utf-8?B?bEg0NTFmT0U0Um4wcGp6ei9WaDRORWhtK29sZnZFcUxZejQrNC8rTkttSzZz?=
 =?utf-8?B?UTRxZElGTTlNaGw2RC9WNUV3V3d2U2ZjeUtpQ3BsaTNIY3FXSmg5STYyeGxn?=
 =?utf-8?B?dTE5UE5tMVV6Mnc1Sm5BdW10aTFLN3ZLYUN6clJydER4VjlUeTNuVFh0RnFi?=
 =?utf-8?B?ZVhzaVFpQSsvYmJvZTkxaWhzZ2tESk9tQTJaZmdNV2szT2o4L1B4VkF6TjdX?=
 =?utf-8?B?V2VnNVdqaWgwTU51UGV0bUdBOXo2NkQxbnhCTVo0bU9HUDEvSW5uODk1c0pN?=
 =?utf-8?B?aHBCVDQ1VWVSZ1hETkV5UTNZRkEyalEvSjFDT2tuZGJXVmU5NVZvZklDaGlW?=
 =?utf-8?B?ejhaM0JVazh1ekovQzZzTmxNUDg1dHpGRGNSOVE5bEVTMmttNVlCNW8yTmJk?=
 =?utf-8?B?T1VHVXpoZ2JtQXhUVnQ0aHFGN0tONzdsb29EMUFjbDZpUlF3bXhzc3ZFOTlz?=
 =?utf-8?B?R21jRmY2TEYwYlp4cGtmUzgzRnJ2L1lTcHE1UU9QV1JUSXFaeGRZWERxckRz?=
 =?utf-8?B?Wm41MjRHdE9DejA3bHRWemFKTk1aekpHQ21sNGR2OWRrZm5Ncmc0RzdWK29O?=
 =?utf-8?B?N0cxRjRYNFFDeVArcnFlQ1kySkE2ZVhvOGE5TnNMOUVFY0hTSUFKTzlWTzRs?=
 =?utf-8?B?ZGw1U3hKcmp2QUgzWUxPQVFaTU5uaGUzWXFzRWt4UmY3MjBXbEFLaEhLZy80?=
 =?utf-8?B?NUkvRVJLQlNEUC9qU2ZyNUh4SllrcEZSN0RRejQxZERoK1pKQVdtOWQweGlB?=
 =?utf-8?B?THRsc1dkRElDN0d1TVFhV0p2b0ZyRGE2Ym9tdnh0aHNMQlRWRXNYNEU5QVR5?=
 =?utf-8?B?OVcySGZHYXlVRTY0ekp0TnhzbVpSN3NFRGI0Q3hrL0tVcFdia2hsTnFiUGg1?=
 =?utf-8?B?aEszSlpsWlgveTRyRmlsN3VFcjhPRUMzRk93amR5TFliTWpkWUwwRkg3UVkx?=
 =?utf-8?B?MlZHWUJkZngrLy9DWUNidDdlVnpFbk44aFdLc2wxcDE3VzRURmxpanU5bWpk?=
 =?utf-8?B?eDcrVlJ6SDRHSmlubGtLQ3N2SjVuWndSdkJ3Rzd3NG0zOGc5T1FkejFGZW1S?=
 =?utf-8?B?ZUV5dlVIdStmWFR0eFNwWWNha1gxSERXalVsM1kyNkxrZDcyYjdaK25wZVdH?=
 =?utf-8?B?Q0g5WUNrclhkOFJJNktOWDBnbWl1QTA3RWtDTHF3eXpWZzhOMWxubXJYSS9L?=
 =?utf-8?B?bmRiWjRlSktXcGFMdFJNT0E2UTkzSW1UN1dSc09qZjA3WGdGL09weU5yOGR1?=
 =?utf-8?B?NGhzTXlZZU1WS21PQm1mR0s4UVduSFBMNjBCLytXWFFFcWdHbjRPRmxtVjVk?=
 =?utf-8?B?S3E0dXZNS0h5aUVGWlp3Q2pYa1pJdVRXSzVONnhhZHhlT0NyQ3dNeUlmY05F?=
 =?utf-8?B?UDVKVmV4QmFFTlpNbkIyaEZQdHRhc2d4YkFVNndoUHYrOGhEUWtmb1RQL082?=
 =?utf-8?B?Y0tvMjhSQ0RwWFhWSUxnMTJTdy9QV2tXcGtlRXZUbkRrSmRVVko3Zm1tUW9j?=
 =?utf-8?Q?21ftRR6WtS9Klv8J6b0krV68bBJdfJ809cBQNXc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N08vWVNEajVldHZzSTJiSUJyaFFPS3hNeDR0eE53M2Q4YlZYbkFVV1lUNUw5?=
 =?utf-8?B?ZFlzcXFMTk0weEM3b2RtUVdOWUxOMndYTDNBZTU4OUk5TWdSS2poN0dIWU0v?=
 =?utf-8?B?SFYwMmVWVzRSM09QMzNjcnVmVS9NaGpyRzVYYkcwdm1ObmhmUUdHSlZTWVJz?=
 =?utf-8?B?SlFFdnJ5TUZOK0YzSVNXMkVlNTVhS0xjK2Vkd0JpY0p4dm1JTEZ0SU5aY2xY?=
 =?utf-8?B?bVNhRzFLdTNJNEh5VndzZS9kd1lqYUpRcXl5cTI3ekxNQ0djTlpxVkRLdkJw?=
 =?utf-8?B?SG1PN3lNR3YwZlhNYVdFZ2w0bUcwTW96VU8yV0g0d21pby9WOTYza29rOUlU?=
 =?utf-8?B?VzQ1bStoOTd3MlZockpBMlloNktsc0ZFZmFjNGlzWXQ0OFBnVTJrZTVzYURq?=
 =?utf-8?B?ZjEyZTk5MHFrOUNFYzdrdjRaSi9aUXZtUzMrRmM3YWJOUm1pMU9WMWM3NCtX?=
 =?utf-8?B?OTZyVWdsYU1XMENDQWJoSGhTQXdHNTJkNndIUlJVdURmajBDdTZJaDMwRGJs?=
 =?utf-8?B?akdXRzkzV1cvdUlpeVhiaks3aXZNN3BMb1NpWjV4eXVNZGMwTUJTdktqaW43?=
 =?utf-8?B?SG5wRGM1d0I5Qy9RMmt6a3RDZWxvM1FjckVhbFl1eEJlaTZGN1FKakc3WGc5?=
 =?utf-8?B?ZTJtUUhEMVUrcHlvRXkyb1hURUFTSmtlQ0liWnZkRU1pWVdMbmRwL1N2QkUr?=
 =?utf-8?B?WlBpVXpWcVpqSzVhOC9mVEk0M0lzYVdQZVovbE1PMDFVYkNsdlJocGhBb3Rh?=
 =?utf-8?B?bER5SW9KdklNdHBnTEVMSU94M2tselpxVGtRRzg4cjRncWRQVmhCUXJKSjVm?=
 =?utf-8?B?d2oyY0Z0OGpicmp4K1BzZVVPKzdzZVRsTE5CbGdvUUQ1OVBvVDdYMlp0U3hC?=
 =?utf-8?B?UTJ1RW80VGdpdVBTcm8xMTZDUS9GSFZBakJSRnMyaWZOQm1iMnJuU2gvNkZY?=
 =?utf-8?B?b1ZrU3Q0L0J5Qkw0NDEzaVFjMEdIYXdFeDdBdGV3YWE1eUpvTDhxOW5nU2I5?=
 =?utf-8?B?b0RxWnRUMjV1RXdZRVdacE02V2hQYWR2NXBRbnhQNThSbXN6SmVFeWc3blVK?=
 =?utf-8?B?eTV0Y1NCN1lBV202aStORUNUTER0blA0aWVwcEhHYU5QWnlocXJiSWhOWTUx?=
 =?utf-8?B?V1NKRkpSb2FLdWFPZ1ZDTWhoTkJTZUpyUWFTVWpDQWM3bnRXMkkrZnBQR3l1?=
 =?utf-8?B?SU1XQ3RWcVdYTW55RVkySDVhVHFxV1FMdXE1UnBNT2lPTU56MmV3VEZEalFz?=
 =?utf-8?B?cWFPSEpyemMvWjRTNUU4NUk2NDIzcnlBZWt6VFhsTHI1U1FETStod0lFYzhj?=
 =?utf-8?B?clVQMmZBcHZSNHlnNUJtSTZlUGZHRW9jN2dMTzNXN0JaNWFaMlJrOTU2bzZs?=
 =?utf-8?B?anYvdGVMem1WenI0Y0hpQmwrV3JGUDZQeGV1a2toL2xxS0dZNTVNVDBMcW5L?=
 =?utf-8?B?NVdCOGcwU0dVYWV1R3E2alNpWFdSK3dRVDRiQnVwSjU4R1Q2ZlZRUnpCU1Vo?=
 =?utf-8?B?QlJMK0NiVmVjdWZVT1ZITWovUWg1elRlVDFHdXdPT2NjWlZwL3hDTXZUSzhp?=
 =?utf-8?B?UW1IaE8xSFZnTENDZFh6R3V3VTBERnQzSFJ3S29yVERNNk5uZ0pSRGU2aDVU?=
 =?utf-8?B?a2dBUzc1ZDVrMkJpa09RUTZwc3ZXRGt2ZUNFYmNFcjBUMDRyWlNuSElXR1Va?=
 =?utf-8?B?V01nM3JxVWhoeWxTOW9uVENvTTAzTUFmTGhzWVpYQlExTUlHMDd2aGFHYmUr?=
 =?utf-8?B?clhwc054VUo2L2VQMW9tZkw0MWprZWxodExYL0hNYkhCSUZmU21SMEl3bDMr?=
 =?utf-8?B?SzAwZkdYK1M1a28yVkwySWhMYUhKZDBueUd2Vk9PMGdOOWZFZ3RORUpNY1o3?=
 =?utf-8?B?dndVMi9QNVN3WW9yOFkvNksxdFR3ZHNMWXlOcXpYVGN4R1FXSi9CMm5aUzFL?=
 =?utf-8?B?SHlBZmdTc3FrRFBjVTFGcHErZ3I2WmNFeDkxd3B0dXlLdCtTcHB3QWZsa2ZZ?=
 =?utf-8?B?WW1ERmJNTlJjTklzMHM0NjZmZ0NPeGFXNjhIbWRKd1ZVN0xoM2VRbW1uZ3hF?=
 =?utf-8?B?Qmk0UDBESTFJeEE0bm1LZkdoTU11amJjUVJqeU1yWUcxdnVCZU1NQno2em1m?=
 =?utf-8?Q?Owt2LwfvjHofvBq91STG5qzFJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2a8673-9485-402c-7d9e-08dd07c6e40b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 11:48:16.8198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zci8ZZU7prWkzlsBL7XbZ6XsFx3tgh1asB5t6guhQPzZcHCXT5qD41NH4adn+y6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6050
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

--------------NZoQTz0HHi23mhik00rlX0gR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.11.24 um 17:07 schrieb Philipp Stanner:
> On Fri, 2024-11-15 at 15:39 +0100, Christian König wrote:
>>   Am 15.11.24 um 14:55 schrieb Philipp Stanner:
>>   
>>> [SNIP]
>>> But you wouldn't want to aim for getting rid of struct
>>> drm_sched_job
>>> completely, or would you?
>>>   
>>   
>>   No, the drm_sched_job structure was added to aid the single producer
>> single consumer queue and so made it easier to put the jobs into a
>> container.
>>   
>>   
>>   In my mind the full solution for running jobs looks like this:
>>   
>>   1. Driver enqueues with drm_sched_job_arm()
>>   2. job ends up in pending_list
>>   3. Sooner or later scheduler calls run_job()
>>   4. In return scheduler gets a dma_fence representing the resulting
>> hardware operation.
>>   5, This fence is put into a container to keep around what the hw is
>> actually executing.
>>   6. At some point the fence gets signaled informing the scheduler
>> that the next job can be pushed if enough credits are now available.
>>   
>>   There is no free_job callback any more because after run_job is
>> called the scheduler is done with the job and only the dma_fence
>> which represents the actually HW operation is the object the
>> scheduler now works with.
>>   
>>   We would still need something like a kill_job callback which is used
>> when an entity is released without flushing all jobs (see
>> drm_sched_entity_kill()), but that is then only used for a specific
>> corner case.
> Can't we just limit the scheduler's responsibility to telling the
> driver that it has to flush, and if it doesn't it's a bug?

We still need to remove the pending jobs from the scheduler if flushing 
times out.

Without timing out flushing and/or aborting when the process was killed 
we run into the same problem again that we don't want ti block on _fini().
>>   Blocking for the cleanup in drm_sched_fini() then becomes a trivial
>> dma_fence_wait() on the remaining unsignaled HW fences and eventually
>> on the latest killed fence.
> But that results in exactly the same situation as my waitque solution,
> doesn't it?

The key part is that dma_fence's have a documented requirement to never 
block infinitely.

> Blocking infinitely in drm_sched_fini():
>
> If the driver doesn't guarantee that all fences will get signaled, then
> wait_event() in the waitque solution will block forever. The same with
> dma_fence_wait().
>
> Or are you aiming at an interruptible dma_fence_wait(), thereby not
> blocking SIGKILL?

That is basically what drm_sched_entity_flush() is already doing.

> That then would still result in leaks. So basically the same situation
> as with an interruptible drm_sched_flush() function.
>
> (Although I agree that would probably be more elegant)

If the wait_event really would just waiting for dma_fences then yes.

The problem with the waitqueue approach is that we need to wait for the 
free_job callback and that callback is normally called from a work item 
without holding any additional locks.

When drm_sched_fini starts to block for that we create a rat-tail of new 
dependencies since that one is most likely called from a file descriptor 
destruction.

>
>>   
>>   The problem with this approach is that the idea of re-submitting
>> jobs in a GPU reset by the scheduler is then basically dead. But to
>> be honest that never worked correctly.
>>   
>>   See the deprecated warning I already put on
>> drm_sched_resubmit_jobs(). The job lifetime is not really well
>> defined because of this, see the free_guilty hack as well.
> drm_sched_resubmit_jobs() is being used by 5 drivers currently. So if
> we go for this approach we have to port them, first. That doesn't sound
> trivial to me

Yeah, completely agree. I think the scheduler should provide something 
like drm_sched_for_each_pending_fence() which helps to iterate over all 
the pending HW fences.

The individual drivers could then device by themself what to do, e.g. 
upcast the HW fence into the job and push it again or similar.

But what we really need to get away from are those fence pre-requisite 
violations Sima pointed out. For example we can't allocate memory for 
run_job.

Regards,
Christian.

>
>
> P.
>
>>   
>>   Regards,
>>   Christian.
>>   
>>   
>>>   
>>>
>>>
>>> Grüße,
>>> P.
>>>
>>>   
>>   

--------------NZoQTz0HHi23mhik00rlX0gR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.11.24 um 17:07 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Fri, 2024-11-15 at 15:39 +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;Am 15.11.24 um 14:55 schrieb Philipp Stanner:
&nbsp;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">[SNIP] 
</pre>
          <span style="white-space: pre-wrap">
</span></blockquote>
      </blockquote>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">But you wouldn't want to aim for getting rid of struct
drm_sched_job
completely, or would you?
&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;No, the drm_sched_job structure was added to aid the single producer
single consumer queue and so made it easier to put the jobs into a
container.
&nbsp;
&nbsp;
&nbsp;In my mind the full solution for running jobs looks like this:
&nbsp;
&nbsp;1. Driver enqueues with drm_sched_job_arm()
&nbsp;2. job ends up in pending_list
&nbsp;3. Sooner or later scheduler calls run_job()
&nbsp;4. In return scheduler gets a dma_fence representing the resulting
hardware operation.
&nbsp;5, This fence is put into a container to keep around what the hw is
actually executing.
&nbsp;6. At some point the fence gets signaled informing the scheduler
that the next job can be pushed if enough credits are now available.
&nbsp;
&nbsp;There is no free_job callback any more because after run_job is
called the scheduler is done with the job and only the dma_fence
which represents the actually HW operation is the object the
scheduler now works with.
&nbsp;
&nbsp;We would still need something like a kill_job callback which is used
when an entity is released without flushing all jobs (see
drm_sched_entity_kill()), but that is then only used for a specific
corner case.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can't we just limit the scheduler's responsibility to telling the
driver that it has to flush, and if it doesn't it's a bug?</pre>
    </blockquote>
    <br>
    We still need to remove the pending jobs from the scheduler if
    flushing times out.<br>
    <br>
    Without timing out flushing and/or aborting when the process was
    killed we run into the same problem again that we don't want ti
    block on _fini().<br>
    <span style="white-space: pre-wrap">&nbsp;</span>
    <blockquote type="cite" cite="mid:85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;Blocking for the cleanup in drm_sched_fini() then becomes a trivial
dma_fence_wait() on the remaining unsignaled HW fences and eventually
on the latest killed fence.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
But that results in exactly the same situation as my waitque solution,
doesn't it?</pre>
    </blockquote>
    <br>
    The key part is that dma_fence's have a documented requirement to
    never block infinitely.<br>
    <br>
    <blockquote type="cite" cite="mid:85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">Blocking infinitely in drm_sched_fini():

If the driver doesn't guarantee that all fences will get signaled, then
wait_event() in the waitque solution will block forever. The same with
dma_fence_wait().

Or are you aiming at an interruptible dma_fence_wait(), thereby not
blocking SIGKILL?</pre>
    </blockquote>
    <br>
    That is basically what drm_sched_entity_flush() is already doing.<br>
    <br>
    <blockquote type="cite" cite="mid:85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">That then would still result in leaks. So basically the same situation
as with an interruptible drm_sched_flush() function.

(Although I agree that would probably be more elegant)</pre>
    </blockquote>
    <br>
    If the wait_event really would just waiting for dma_fences then yes.<br>
    <br>
    The problem with the waitqueue approach is that we need to wait for
    the free_job callback and that callback is normally called from a
    work item without holding any additional locks.<br>
    <br>
    When drm_sched_fini starts to block for that we create a rat-tail of
    new dependencies since that one is most likely called from a file
    descriptor destruction.<br>
    &nbsp;<br>
    <blockquote type="cite" cite="mid:85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;The problem with this approach is that the idea of re-submitting
jobs in a GPU reset by the scheduler is then basically dead. But to
be honest that never worked correctly.
&nbsp;
&nbsp;See the deprecated warning I already put on
drm_sched_resubmit_jobs(). The job lifetime is not really well
defined because of this, see the free_guilty hack as well.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
drm_sched_resubmit_jobs() is being used by 5 drivers currently. So if
we go for this approach we have to port them, first. That doesn't sound
trivial to me</pre>
    </blockquote>
    <br>
    Yeah, completely agree. I think the scheduler should provide
    something like drm_sched_for_each_pending_fence() which helps to
    iterate over all the pending HW fences.<br>
    <br>
    The individual drivers could then device by themself what to do,
    e.g. upcast the HW fence into the job and push it again or similar.<br>
    <br>
    But what we really need to get away from are those fence
    pre-requisite violations Sima pointed out. For example we can't
    allocate memory for run_job.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">


P.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">&nbsp;
&nbsp;Regards,
&nbsp;Christian.
&nbsp;
&nbsp;
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">&nbsp;


Grüße,
P.

&nbsp;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&nbsp;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------NZoQTz0HHi23mhik00rlX0gR--
