Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D239CE16F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D64710E011;
	Fri, 15 Nov 2024 14:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uCxuqkhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ECC10E011
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl1biNU61QdYsW67r8Fqpmi0LTOm5IapIAoeePFLpvFpiVUqrF0Rfl79cSW26i+oCvsa5pqodG+LoZt5ghx+EKCkXQ5BAfDcMzIRS3Bkoi8WL6i7BfyCYK8b1BJra965a6k8lHUnQvXJhym3mFe4VJJXmr5U2mzuDAVbn9Q8RBDSC/l+HytdlmQiT1+xYq+PyDrLPhSSJW8W7+E5efAxR9EuQhtWQoIuHtyS+dmpaDQsHeu0kSY95FMygZThBRvrtqzlhOC/DWe5abIQuQLDHuCFCS8qg08/4q4hn6lGsgcuhQhPCTRLvVPEpGrUDpTnbZvlET0Vxl4v+en3VVIMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwoTHxjhQbQMvdt5ZOGugGaB5mo27lOXgCinbpBh5jI=;
 b=DabxXTwcDYnCteYBPAHIrdfy7suE6924ewA+DmSmaKqYQ75oBRH9e35ZqF4BU7b3c8O0QM0JKTCHWoGIpuABdxRB3KSbj/6qI2SwWHijndO80gGkgBqkeZp+mbq65dVZUrJ2pF535ar2N0p8MJj3v7OR6wBABTVN0bpz9zml9h6tpP+lMSTNnPZgPUco7z6uRI53y15X/anSmB2J9QXcSOh9ByMTRYZsjHyvwpSU54wtk6dkLlI5EY/s08UxihjQkztWfNQuYqbsZUkJvzZ+QZaHlHhpkiU0xQVczqsXJpLLYHiZ7KbdXyke4yhasdDrORQEYJChApHuwGzYMjj1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwoTHxjhQbQMvdt5ZOGugGaB5mo27lOXgCinbpBh5jI=;
 b=uCxuqkhhKd6pgE03aPgFxP3RnxEMWL7E086HdZW9qSI24imldxwuSG1egRe5FgkZaGF/EoDr2ycD2Pw5PmrjQXravbZAno3Hn79qnkC2pQfcx+Fp/DrR386wZd+MzkwuP38CtTA6h71M7Qk+DUcmKL88EQ/oM92QkW6hTUWEb7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 14:39:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 14:39:49 +0000
Content-Type: multipart/alternative;
 boundary="------------tAyAhMWrWawBd9mKtwiXTTOl"
Message-ID: <d103054f-7331-4b00-8105-3e88fdab0486@amd.com>
Date: Fri, 15 Nov 2024 15:39:43 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com>
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 423d4afe-8cf5-4907-049f-08dd05835ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alh4eGRTenRYOC82dTNERk9EVHFUb0o4M3NJU0dqZDQyS01CWDAvNzJSVnFQ?=
 =?utf-8?B?TUo5WDVlQ0lQVGlhUGh4NHNvWXVMaG43d1dzajJYSkx6c1dRZkw3cVplMHJX?=
 =?utf-8?B?b0tJcWdQTURrQTQrejkrOWtxSnQ4N0p3Unc0eVBQNUwvK2NVZ2F0S0NzMUNp?=
 =?utf-8?B?bE9tQ0QzR3oyYjdzc2lJWHpqZ1ducjlMUHBvcVJVN3VnaUtKcDNlZXFlMkkr?=
 =?utf-8?B?QktxRWhWYWhwYTRiVTkzSVIvbzcvZTVidGhkbVc4WFFsYVFLS3BSVXdwMkNO?=
 =?utf-8?B?R29BZHhhb2FtOVduRDR2Y0dmMW5lLzRBVEQwWFUza1hyMW9ZM1pvL0dmVm5J?=
 =?utf-8?B?WmU5eENCMHIvYnNhdERpQjlBS2JYNWloVW9NUTdndkFvNC93SlJMRG5ubTF1?=
 =?utf-8?B?WU4rNm9RbkplZkVYVGFBczNnb08xZzFhS2Y4VnllNHQydlBVQUlDNE42MDhO?=
 =?utf-8?B?V1U3YkcxSzJCQXhMZU16Snl0bVpQYW9qUTZqQkdxYVZqa3RYa2NNMlZqeHJY?=
 =?utf-8?B?c2JRS2JpMWZuVGtMWGZJMEtleU5yblRyMjhmdk9HQnUwU2hyOTlEdXljNFZC?=
 =?utf-8?B?TEIzNEVSTWQyTk1oMXg0REdGTXpNRERkd0ZRSVE0cGF4Wnc5UE5kdkVmcFd5?=
 =?utf-8?B?SjdrUUYwdm1UMGFaNEMwY21uK0tEb3ZMamdCeTVvVDZKaTRhbDEwdEpZMnVJ?=
 =?utf-8?B?WjFwS1VyNjlRN1RrWHg0WGs4Wmt6TEZ0VzF1T3FBR0s0QncrUTZZd2FBMTdm?=
 =?utf-8?B?eGFFdHJkeDhhc3NLdml4RFlvWFlBVTEvMVFVeVdBVzBTcjdXUys4NHhUODBO?=
 =?utf-8?B?dTV3WTZJRG5kb2x3aDJyQ3ZTa0ovaTRONmIvZUp3MjB0UTJDMHVOSWxKeWJk?=
 =?utf-8?B?cVJpSmZyMWV1eGJCdHQ2K2FkRklBUW8wQnFyaWIxMTdUWEl3dDl5eXZ2bVJH?=
 =?utf-8?B?VUpkeTl5c2pFNS9EWU1rYTJHQmpaUHN1M3RSUlU0ZHl2WFAvY0ErWW9mV0RE?=
 =?utf-8?B?RXZUMVJNL0pJZ1UwYjAzNmFQbDZOWi9BVmNkcTJRV1BTckNQQW9qVnlRYlp3?=
 =?utf-8?B?RGZCU2g2UDBrd2Yyc3Y2MCsyRytuMkFPcGl1ejFYSW4rQkNoYnM3cUxFRzlL?=
 =?utf-8?B?Z0FqdGViT3V4ZGQyV3JOTUNvMVVQVER6T0tiUE5XaDNrbTJpTnNHblFGTFhZ?=
 =?utf-8?B?RmJRcWdYdUpseHVFSFlGSjRTdXRlR2FMR3pEQm5LQW1HaHplUEtScVVYUndH?=
 =?utf-8?B?YnFhRU1HMFRlN20va3NNSjFCYlhHaTBQUWQzcXZ1ZUlQRVE0VzBPZmF2eFQ5?=
 =?utf-8?B?c0JJRDBiOXRuTGRrNFJ1cnRQNnEyVU9BTjFGb29RaVJBYVhleDFSaWhiK1Zo?=
 =?utf-8?B?S0kySmFwa1NkLzk0YW5uSGpkRjhTc083OW8vbW5CQ0hJZUFEVXJHRWpqL0xM?=
 =?utf-8?B?a3JMLzBGOHN2Z2dIVWtUUWEwbjAwTTF1dlZvazZvSHppK1BGaUVYVkJwTFU2?=
 =?utf-8?B?UVRxa2srb1E0NnJCMDNmTVVzZWlRODVGaDJVd0hya1J1MXE2WEd4MnZXcjNF?=
 =?utf-8?B?TmM5Tm1OUE11ZmZ6WkREYkdxUXJjc3V4cWFmZGlqbndWNHVSWmh4bkFiblpE?=
 =?utf-8?B?OEZUV2ZpYkFIbFFnZEU4UG51cGZETkR6bzdTUDJiOUdLaDhZVTNmZGNzaTU1?=
 =?utf-8?B?ZTVzRDdwMkd0cmZhNXdSaEVzL2dQUjkzc2lzOUxINU8weVlpSlRyQTBjWk1H?=
 =?utf-8?Q?JDLn+Jl3jD5GkpzteIKCnS7UoWT8DKOz6/fOhb5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtxNk9VWmUvV293am1RK29hRGtSUGV4MUJkVzZVdGZ0blYxbXdBa1BaSm80?=
 =?utf-8?B?QzRZS1N4MnNyMDJ5czFZTndtZ25sNnZnMWxVMVZkRnhzMFBOU2hsUlhxTGdD?=
 =?utf-8?B?QnMwMXV3ekpKd04xaVZ5d2FnZHFnczNFeVlFOGdVbUZZeS9sNld3RFlkQS9E?=
 =?utf-8?B?RDhucEgvY3NudG5IcENYUlF2VkpsbjBwalVVR2ZjeEpjaVllY1B2ejJ4ejMv?=
 =?utf-8?B?TjFzcjVuY2hxRFpEdUh5cnYyVWVZSXRuT0kxZ3VGMzVyQ1ZHYjlUUVU4MGtl?=
 =?utf-8?B?c3BQYklLMDM4S3pVNHNMTEV3SU9MY05rM3YzZllwajVoQnZlQTBrdmZFVERD?=
 =?utf-8?B?NlYvZHUzOS8rQk9aSGd0cFJlekhmZUZzNHl4QlZxR1g4cEJURW1lcHhWNUNV?=
 =?utf-8?B?cXdWYm9RZ1piSVlqT21nRE91NStneExPR0VNaThOaTduRXNPUFJoSkxxc0Iy?=
 =?utf-8?B?cXU4QXlFc2pXRHlOeU4yam1ucTl2dTlSOWZNcDA1ZmEwdXJqQUVxQ0x2bThR?=
 =?utf-8?B?Ync5MGhTeHAwSjVKLzRFUTZzMVZ6V3NXSEdiQ3J6K1ZQazJkdFBha3pxeWlS?=
 =?utf-8?B?MGhvTjBLc1lBL0F5cll3bXZMTzVYQU0zMXJBeHlHUC80QUl4T2YrYlR6L1BI?=
 =?utf-8?B?Kzh2WFZmY0Q5SGMxUnNIQVQ0b29MdlJjK3lGRXZjRkxHNnVxNGFLYWFZS21L?=
 =?utf-8?B?bFdISWVmdWxIdyt1ZGxIY3BsZVpRMEk3S0h2U3ZiM1ZRZkpsaHNIbzJVTm5N?=
 =?utf-8?B?cklmdGNCMnUxOHJLWjhubHVUNHpKRFl4eFBmVHNxejF3RFV1cnFwc1dJdWJr?=
 =?utf-8?B?ZURGdmxBUkN6MC8xakJJOWVTcVVITWYwc2ovTWJrS0gyU3drY0wwekJISlJi?=
 =?utf-8?B?U1ExSzRoekYyNGJHZE1WWnBvbkJHRHdUOGQxanpxd1VqV3QrVkRycTdDckUz?=
 =?utf-8?B?OWE2d3ZnNkkxRTRrN3A4M0lUa2R1RkZyTUlHaGtMM21Xc1dndk9pYlJGbGJN?=
 =?utf-8?B?MllWbHo5Yk1xUys5SDF5TTJzTjhHNDhIeFc1Zk1BUlZKK3pvekFCN3NMekNv?=
 =?utf-8?B?OFVmeitjMWxrTUhlR0NHbWtVUjBtckNrc09UamhSWkNvcGZXQ2J1T1R4WG8x?=
 =?utf-8?B?TGdlNGZVUVZZazh2V2NHd1JuRk1jak56Y1IrTkM3bUFSSDdNMXdtcis0MHE5?=
 =?utf-8?B?MzV3Y3JyeHE0ZXJ2eHQ3cHdjZVZtNzY5WTYyTGtoNjkrOHZtcUl3KzR4NVo3?=
 =?utf-8?B?eVBlaW9CcmladGszV1BETmlRMzFQOXY1MW1aWEU5bVhaeVBkYlloRmd6QUhm?=
 =?utf-8?B?aVY3dEJZc0QzRzJxejZ1Ym9ZZnNWN0dlVWFaWlROc3ozZUlZNTFOL3JiZ2R2?=
 =?utf-8?B?WGZlank5MTNXUjVybEVnZjBNNHQ1VlV6aXdWbVBPcTFFQkxRb3RpVUY2NDVu?=
 =?utf-8?B?SksvU1hvblhkekpQRldEVTdZbkwybHJhblhKZUpNL1BjYk9lWHRUVDRLVnhI?=
 =?utf-8?B?TnlWcFdSTlhHMnBFdUFSTkwzS2dZSGR3elI2Z0ZhT0lHaUV4OUU0WWUrMUFi?=
 =?utf-8?B?bFNENE5leTAyYURRYUM5dFJJMTdTbTlIZzBhT0pJZ0hQZkZnZlpvRzAyZ0Ny?=
 =?utf-8?B?cEVKMTJ2d0RETndqOVdnMTZsa1RDRzdUQkUyUnBFUEFIMG9IT2xlSWZxTzlL?=
 =?utf-8?B?SkZJU1BuVHpuRHlSSVRzVHVubGdndWZ0UGhpMUdJdTJFdFo2VWpZK1oxQjJt?=
 =?utf-8?B?ZnJzc3QwcFdtRmNMVitqaHlha3RETGhjNk5GMmF5dWREajA5VUduUDIydWR5?=
 =?utf-8?B?QVNhRVNvMGxrS3VaNUNZdi9mMXVGYzg2N0pneGpwb0t2M2VUNVJaUkwrNWVB?=
 =?utf-8?B?UU9WWlhhU1JOZ05nUUcxZU03WmdZRDlFdE5jMXY5aXErUUhjQStYZnFkV3hz?=
 =?utf-8?B?aU05NWJXQmgzZTg2RWpMTUxmLy9LSGJUQnRLWXozR0FpWGJ0OHQ3WXpzZ1A5?=
 =?utf-8?B?RXppRDNDZjB0K1VnUmFOOFBBVlBoMEE1a3B0UmFOR1Iza1VCVDVsaXd2bkQ5?=
 =?utf-8?B?Vi9vbmtMZFZ3NWpEK0RKbEZCUnBTTWtoSjFmREhoelN0SzhqZDZkcXBwSXNz?=
 =?utf-8?Q?hjnM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423d4afe-8cf5-4907-049f-08dd05835ba6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 14:39:49.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKMyK91xmOhVtTiOLRktN8Mr2SiSxMc/1BnuC4AmZPFcY9S3lXebZApQdM8BQwQ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7887
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

--------------tAyAhMWrWawBd9mKtwiXTTOl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.11.24 um 14:55 schrieb Philipp Stanner:
> [SNIP]
>> A good bunch of the problems we have here are caused by abusing the
>> job
>> as state for executing the submission on the hardware.
>>
>> The original design idea of the scheduler instead was to only have
>> the
>> job as intermediate state between submission and picking what to
>> execute
>> next. E.g. the scheduler in that view is just a pipeline were you
>> push
>> jobs in on one end and jobs come out on the other end.
> So let's get a bit more precise about this:
>     1. Driver enqueues with drm_sched_job_arm()
>     2. job ends up in pending_list
>     3. Sooner or later scheduler calls run_job()
>     4. Job is pushed to hardware
>     5. Fence gets signaled
>     6. ???
>
> What would the "come out on the other end" part you describe look like?
>
> How would jobs get removed from pending_list and, accordingly, how
> would we avoid leaks?

Let me describe the full solution a bit further down.

>> In that approach the object which represents the hardware execution
>> is
>> the dma_fence instead of the job. And the dma_fence has a well
>> defined
>> lifetime, error handling, etc...
>>
>> So when we go back to this original approach it would mean that we
>> don't
>> need to wait for any cleanup because the scheduler wouldn't be
>> involved
>> in the execution of the jobs on the hardware any more.
> It would be involved (to speak precisely) in the sense of the scheduler
> still being the one who pushes the job onto the hardware, agreed?

Yes, exactly.

See in the original design the "job" wasn't even a defined structure, 
but rather just a void*.

So basically what the driver did was telling the scheduler here I have a 
bunch of different void* please tell me which one to run first.

And apart from being this identifier this void* had absolutely no 
meaning for the scheduler.

>> The worst thing that could happen is that the driver messes things up
>> and still has not executed job in an entity,
> I can't fully follow.
>
> So in your mind, the driver would personally set the dma_fence callback
> and hereby be informed about the job being completed, right?

No. The run_job callback would still return the hw fence so that the 
scheduler can install the callback and so gets informed when the next 
job could be run.

> But you wouldn't want to aim for getting rid of struct drm_sched_job
> completely, or would you?

No, the drm_sched_job structure was added to aid the single producer 
single consumer queue and so made it easier to put the jobs into a 
container.


In my mind the full solution for running jobs looks like this:

1. Driver enqueues with drm_sched_job_arm()
2. job ends up in pending_list
3. Sooner or later scheduler calls run_job()
4. In return scheduler gets a dma_fence representing the resulting 
hardware operation.
5, This fence is put into a container to keep around what the hw is 
actually executing.
6. At some point the fence gets signaled informing the scheduler that 
the next job can be pushed if enough credits are now available.

There is no free_job callback any more because after run_job is called 
the scheduler is done with the job and only the dma_fence which 
represents the actually HW operation is the object the scheduler now 
works with.

We would still need something like a kill_job callback which is used 
when an entity is released without flushing all jobs (see 
drm_sched_entity_kill()), but that is then only used for a specific 
corner case.

Blocking for the cleanup in drm_sched_fini() then becomes a trivial 
dma_fence_wait() on the remaining unsignaled HW fences and eventually on 
the latest killed fence.

The problem with this approach is that the idea of re-submitting jobs in 
a GPU reset by the scheduler is then basically dead. But to be honest 
that never worked correctly.

See the deprecated warning I already put on drm_sched_resubmit_jobs(). 
The job lifetime is not really well defined because of this, see the 
free_guilty hack as well.

Regards,
Christian.

>
>
> Grüße,
> P.
>
--------------tAyAhMWrWawBd9mKtwiXTTOl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 15.11.24 um 14:55 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com">[SNIP]
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
A good bunch of the problems we have here are caused by abusing the
job 
as state for executing the submission on the hardware.

The original design idea of the scheduler instead was to only have
the 
job as intermediate state between submission and picking what to
execute 
next. E.g. the scheduler in that view is just a pipeline were you
push 
jobs in on one end and jobs come out on the other end.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So let's get a bit more precise about this:
   1. Driver enqueues with drm_sched_job_arm()
   2. job ends up in pending_list
   3. Sooner or later scheduler calls run_job()
   4. Job is pushed to hardware
   5. Fence gets signaled
   6. ???

What would the &quot;come out on the other end&quot; part you describe look like?

How would jobs get removed from pending_list and, accordingly, how
would we avoid leaks?</pre>
    </blockquote>
    <br>
    Let me describe the full solution a bit further down.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
In that approach the object which represents the hardware execution
is 
the dma_fence instead of the job. And the dma_fence has a well
defined 
lifetime, error handling, etc...

So when we go back to this original approach it would mean that we
don't 
need to wait for any cleanup because the scheduler wouldn't be
involved 
in the execution of the jobs on the hardware any more.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It would be involved (to speak precisely) in the sense of the scheduler
still being the one who pushes the job onto the hardware, agreed?</pre>
    </blockquote>
    <br>
    Yes, exactly.<br>
    <br>
    See in the original design the &quot;job&quot; wasn't even a defined
    structure, but rather just a void*.<br>
    <br>
    So basically what the driver did was telling the scheduler here I
    have a bunch of different void* please tell me which one to run
    first.<br>
    <br>
    And apart from being this identifier this void* had absolutely no
    meaning for the scheduler.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The worst thing that could happen is that the driver messes things up
and still has not executed job in an entity,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I can't fully follow.

So in your mind, the driver would personally set the dma_fence callback
and hereby be informed about the job being completed, right?</pre>
    </blockquote>
    <br>
    No. The run_job callback would still return the hw fence so that the
    scheduler can install the callback and so gets informed when the
    next job could be run.<br>
    <br>
    <blockquote type="cite" cite="mid:4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">But you wouldn't want to aim for getting rid of struct drm_sched_job
completely, or would you?</pre>
    </blockquote>
    <br>
    No, the drm_sched_job structure was added to aid the single producer
    single consumer queue and so made it easier to put the jobs into a
    container.<br>
    <br>
    <br>
    In my mind the full solution for running jobs looks like this:<br>
    <br>
    1. Driver enqueues with drm_sched_job_arm()<br>
    2. job ends up in pending_list<br>
    3. Sooner or later scheduler calls run_job()<br>
    4. In return scheduler gets a dma_fence representing the resulting
    hardware operation.<br>
    5, This fence is put into a container to keep around what the hw is
    actually executing.<br>
    6. At some point the fence gets signaled informing the scheduler
    that the next job can be pushed if enough credits are now available.<br>
    <br>
    There is no free_job callback any more because after run_job is
    called the scheduler is done with the job and only the dma_fence
    which represents the actually HW operation is the object the
    scheduler now works with.<br>
    <br>
    We would still need something like a kill_job callback which is used
    when an entity is released without flushing all jobs (see
    drm_sched_entity_kill()), but that is then only used for a specific
    corner case.<br>
    <br>
    Blocking for the cleanup in drm_sched_fini() then becomes a trivial
    dma_fence_wait() on the remaining unsignaled HW fences and
    eventually on the latest killed fence.<br>
    <br>
    The problem with this approach is that the idea of re-submitting
    jobs in a GPU reset by the scheduler is then basically dead. But to
    be honest that never worked correctly.<br>
    <br>
    See the deprecated warning I already put on
    drm_sched_resubmit_jobs(). The job lifetime is not really well
    defined because of this, see the free_guilty hack as well.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">


Grüße,
P.

</pre>
    </blockquote>
  </body>
</html>

--------------tAyAhMWrWawBd9mKtwiXTTOl--
