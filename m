Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E95B3B92B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 12:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCA410EB7C;
	Fri, 29 Aug 2025 10:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZkZvPfbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DBE10E143;
 Fri, 29 Aug 2025 10:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4KJGWQgf00rdFmAIW5A0QTVq9G8M3zT/vC06s4amAOUjZShbwzdcuGrKj0SfEpjugwHtswWb53MI7Mc9+ptXTAMEebMgGHZbZdv3Vlij6QJ2HNxktRdzaxcyBqx72Nsw+5yAnwWLHadoFQbmjXlBf3U/twOcsjIpCVJMWMFEqRGvF6r1mGkK9EgTsTuAyIPaid/vNnOdo96aE4jC/u6x5M+PQ4itQ5sbOrUNs8VmFxfawsjexbrN8ny7JSZQ0RUm9x9xJp3q+4f2vWYwZXkYfHiqvWU7bohdfdeP4v+g21NjG93iFWMJj1GP66d6M6GL/z9I0DN/8gMcvRBY2PN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjpzq5zJxyO8d6P4J7SFgEU5AWPzJOO/CBPEL+pDPRY=;
 b=NvjW4KsRmuqvn4VgjbFUS2f51pmYsraVN0P4Fq7TSarLjzh3ydfK1Qf9dCa33DqN9/Bwyg9MiIAqQdryATxoLHOx9AnkR0Rwg9VB9XZcPWn2egwTBzXJ8rpL0lmXAgiRBp5Qtilj6iwx0l1KMI5P3aWZDkeJx6W/PFFyqsBdjAShNLsm8Sla0PDm4VoUjk9fana8KfNqiR9iFtAxnbxC3vjeEFupT5nIb/cty6imxn0yi6b7j4/lqv1SX5esQ698iHY5qK+gwA2wqE/1AQ9pUMd9B5nDBiMn8rDOK4qkWmUQ0jxL05wadvLyoeLcQLaiYAkqIyaNqeCbPJzNtcHgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjpzq5zJxyO8d6P4J7SFgEU5AWPzJOO/CBPEL+pDPRY=;
 b=ZkZvPfbiDLMbJkXYfgibbMA4X5vHLsDP1uaSpz4kIpVw67Sh4Nx6PAU56qTaUcYzvzELeCzWvUBEE9otDVGfCzojFfK4JZGO6Q4z1JOWYHUMcoCqFdl+It+LyG8WIGFW13MB4A9/MII1y8ZyV6BxTkPdJFaxgRKifnR+bbtXJjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Fri, 29 Aug 2025 10:50:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 10:50:09 +0000
Message-ID: <094606f3-a138-4561-a0b7-d952f4896939@amd.com>
Date: Fri, 29 Aug 2025 12:50:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: stupid and complicated PAT :)
To: David Hildenbrand <david@redhat.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
 <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
 <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
 <75aca34d-3557-49e9-a523-bd3244c28190@redhat.com>
 <a01f7ca8-7930-4b04-b597-0ebf8500a748@amd.com>
 <d32fa753-66a1-451a-8cef-95c1f78fc366@redhat.com>
 <87050572-811e-4b0c-9ebd-8ebb05f3c617@amd.com>
 <e717c8b8-51f1-4332-b5fd-ade55aaba1b0@redhat.com>
 <3a91d9df-1536-490b-bbc6-268a3a32ac1c@redhat.com>
 <00aaca69-2549-48b4-bd3c-fcebe2589df0@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <00aaca69-2549-48b4-bd3c-fcebe2589df0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: e955ce8a-6852-4ee5-ea52-08dde6e9d291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFF1Wm9ETUN6YVNia3A3RFBCUStBVGpPNExEbE5jYTNtRWgwUnRRNVZBQlRw?=
 =?utf-8?B?SDVrUk43L0pFWHhUN2RaUTJpd3pDZjczZXlESlNJa2cvMDZOT2grQldYS3lT?=
 =?utf-8?B?WlRSQXV0ZWs1a1lhbnRnWS85akU3VDg2d0lPR1NyWkdDbUw5ZHc3US96bS9p?=
 =?utf-8?B?ckpXQXZmeWRkWHFoQzIyOFZhd1Nvam95dFVGL2JIYVplL21KTklKR3R6TzhX?=
 =?utf-8?B?WVUrb0tqTGpYb2ptSk11NkFlbmFqcGpycUdkNzBnNDRrcUNxOWxSRkx5M2p3?=
 =?utf-8?B?bzRrN0dvR3lMeUsyYVprQUwxL0RvVFZoRU0vcGl3elRpT0JQQ3AvWlR2VlFE?=
 =?utf-8?B?bEtKbmYvZlhzTmxkTDIrdUMyT0JqaWN1blR5cEg1ZUFCY2l2NnMxOGxGR3VC?=
 =?utf-8?B?dThFc1VtbTgvdVhxc25VNzdnckxZdEI4cCswVDc4dytKWk1zRVdjcnpZaVh3?=
 =?utf-8?B?TU41WnNsR2E4aVU1Ty9RZk11bk1BM3BlVkxRWFBXdlFRMElzVG5zdGh6Z3lx?=
 =?utf-8?B?aW1VQW1ZaXZHWGgxZGNKanAzQTdkNnRNVXI1OVNObCs2dFNERUVtNCtzOHRi?=
 =?utf-8?B?bjBqNlB2Yjd4cFYwdTlBNG9EOE1KMmgvdnlsY0xJc2lxRStrNFRXVnJ0bHJG?=
 =?utf-8?B?OWtGbHJLUVJ5TXl4bjlOQ1BXQWFhaHU3ZGJsNHZ0OC95WC9oSS9PYStnV0NK?=
 =?utf-8?B?ejdNSXN1aFo3NDZhZEFmeXkrWkgyd2NSTitWeU5GR1AybEE3djRHRC9WazAw?=
 =?utf-8?B?U1ppN1g2bUhIbFZkb2dRa0p0NTlDa2hWTi9Ea0ZiNXVHUUZKN2dtMEpPajAy?=
 =?utf-8?B?MjdETk9ac2lqMGRXbk0wQkdrWWZXZDZJQVRRZmFkOG90UEszZEh3QXFOWGVr?=
 =?utf-8?B?d0lyR1ZQcURKc0V0NDFBdnloYTRuaUFhNm9Dd2prdFJOVDFudlplL0h6ZnVw?=
 =?utf-8?B?aFpQZm92QWU0bmFYSGZUTjI1NUlld0pxSlM1QXJXeHhmM1pUQmhOZVpSUlFZ?=
 =?utf-8?B?eXUwdG1BMXkrREpzMmd2MzlLMWU4cThSOHdrODJDcjB1bUVvb3RNR1FtZGN1?=
 =?utf-8?B?T3oxQnRQS1RtM0lyQWcxeEFjYXE3UjQ0L003TXRXWGFOdUhCL25PNXh5aW1W?=
 =?utf-8?B?N3BPUVdZaVozUWpycGpPdGZJek9tWEtlcFRRbm5QZnR1RTBnMFNPamxuWHg4?=
 =?utf-8?B?L2hhRzVhZGJ6d0UrcVI4WXBjWGJxYTJ4UXNPYmt1QUQ3R25vWXhaMDZ4RnM0?=
 =?utf-8?B?cEloSVJ1R1Bvbk1IZDd0cWQrdklpQTRZL25CeSsvVk1nTXhuajM0NEU4eUhz?=
 =?utf-8?B?M3ZUSll4cjdTakEyQW43dnF1YjlJZ3RncUVGVDFUL0pLM0xubGt0bHQ2LzB1?=
 =?utf-8?B?RjJFVFA0TmxFTDdLOGN3V2RJMXBiTWxUZFR1M3hISjZSczQ3QUcrRDRpdm0w?=
 =?utf-8?B?bkxON2JZeWVxSWFsaEdaeC9Gb2JsNDFDcFdSV2hPUDhOZUdPQStXVnlQMGZm?=
 =?utf-8?B?TnB6WmIyS3MxSGJTVlp2VDBNU2xPK3kzL1g3WkdFL2dtdUQ3bjdwNDNSQ0x5?=
 =?utf-8?B?dmxnSktjTHd0em5DN3VkRndmTER5Q2NJRGtCemt2djl4WWRCMU92STQ5SS9E?=
 =?utf-8?B?NUdZKzBjbzNwRHdGb1lyTUdybkc3RUlUN2VwdHNWT0oxVXYrNlRLbkQzdnVy?=
 =?utf-8?B?TVRVZG5BL0ZNWjUvWEJsU2crTGQ4Q1lkeWVBdFRMWEx4dkFiWEhYY0VCeDdN?=
 =?utf-8?B?Nm96UUtHUExodnVZNklUUFo5a1JwK2ZCZjZWY3ZuV0FyN0dZTmc0dGhlN1Z3?=
 =?utf-8?B?YU9vS2NWaStENTdVYWUycnFDVlZSTzRVaSt2aEdhSEpNM2xvTEt4bmV1THB6?=
 =?utf-8?B?RTJ2WDF6cGFZRlhhTXkybzBDeU9VQk4yaC9sL0k2TzBLdTAwUkIxQjY0WDlC?=
 =?utf-8?Q?0Uh2Lt3gbKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk92TnhlRDh5Z0lOQWh4RUVnSmpBdUFNY3VuSUU0RDVPRnhyekJxaHZKZnJ3?=
 =?utf-8?B?dUttS3l5K1NSYmJ1a3MrT2xEYlJpbGJsNlR0WVlBdExWcXhVL0RmcGxwZFhi?=
 =?utf-8?B?aFZ4MG5VSmVuL016RWtUekF0YWlQVHc4UFA3dHQxR2g2WjJsTzVNSGxzWm93?=
 =?utf-8?B?RGRmSklueHVoellORTU0Tk9yMXN4MkdURC9wd1hjZ2EvTmdnVU56WlkrRlMw?=
 =?utf-8?B?MnZSVkpHRmREbXVXNW80bHFrWkZsbmJVTjViZ1lwVTZ1cE9SN3huY29Xa20w?=
 =?utf-8?B?K1hPLzFYZVh1aktwZWtlNmJDeW1kUHVmTWJZNzFDVDRjNVYzb3VhV2YwMzM5?=
 =?utf-8?B?ZFNCeGdad3J6a2dIbjJaK1BiUk5aV3JrNloyWXZaalJta1FwUDVIYnZpaTRL?=
 =?utf-8?B?Zy9BblZKcWo3SVBERUNySHYzc09ySWtWcEhvZXVZVHZFekNGMGtpWGhmMU50?=
 =?utf-8?B?SzB2L0hVdlBPRGRhUW44b2g5UUVZLzRrWlpsNHU0SHJlSzgyWG9hK3BlUHVS?=
 =?utf-8?B?SzFHbExBdFppV1BJR3NYSldWWkprUUE3UmdGazZFZGxIZmV5N015SFJ5eElR?=
 =?utf-8?B?ckNMcWRta1IrY1NwV3VMOHZKSURWM0REemNVV1NTNkRoVWtLVEVVS3lHY2dm?=
 =?utf-8?B?TElMOXVXVXI3VkxvaTdoVXZWRE9ZV0lOR2pKeG1BZjVBOFdPMDRxSlI1L2tV?=
 =?utf-8?B?MWc5dXE1WEVUQi9Ub1ZNK0JkZXpudHZENWV2RVdYOWtYS0V5dDVscVlPTEVI?=
 =?utf-8?B?TUpROUVKQ3JnOXhJRkZ0a042SGtremRmUHU3MVFjaTF6b093YThmbFVJbTNa?=
 =?utf-8?B?eEY5Nkl1ajdvZXJFVlRCQVc2SHF4eWx4Z21JaGhtRWxDQVY2eWhGKzdGajJL?=
 =?utf-8?B?aE1VV2haeWhrMUpZRm11UmRkWTFrQlQrbTU5bno5SzhNcE5GV1Q5TFZEUC80?=
 =?utf-8?B?aGJxejJRQnZSRDZlMWovTzZENUJtOGFzL0MwNHpIckpmdlpHcnB1bzc3MWtS?=
 =?utf-8?B?NGJHaWZJaGxTWnc0UWlia09NcEVSK3dPS2xnR1ZoUlhld1lPakx2dzRjRHpZ?=
 =?utf-8?B?enBhQW1GSThCNExBSE53S0lWY1l2b0E1bEtaUGR1NXhJNWtVRm1YcDBqVFE0?=
 =?utf-8?B?aVFxa2prbVJ3OFZJY3cvbG5jYk5tZk14aU02THJseGJzR21wLzFxUjVkV3My?=
 =?utf-8?B?Y0tCNEN4QU1LcTBrNkFpdGM5K3YvbXZTN0xRbWJ3d2hramhYaXJ5SmVzZ0dr?=
 =?utf-8?B?S2xRSTJOQnJOcVFJeFFxdnZqZ3BGeWRYYkUwckcxTnNqNk1uYkh0clQzc2dB?=
 =?utf-8?B?Y0pVcUxXeWhuenBsN2xHOGRrdkJRTEJDRG1MTTZzZWc4NzcyUE9RSzZTRTBm?=
 =?utf-8?B?b1ozUkpwVW5jMFcvd3VSZVl1WTkra1RGRWNLS1c0WDVlb3pZS0g0bHVpUnBw?=
 =?utf-8?B?UVFlZ0VhUjUvUVU2UFVqRGN2ckdoOWlLUU9WRFFoMVloMTlOOXFMRVJ4OGZU?=
 =?utf-8?B?bDN3dURSc0E3REpNZGxHUk8zZUdOWXNBbUFSUkNvM2puays5SHFxR2IrMU1B?=
 =?utf-8?B?NVBoeGR5REVySlU3TUZGdktRaXFHVlpRVk1uNDVCaUFReVUvbnA0eEJiYWRk?=
 =?utf-8?B?ZlRWWHJ0K29UQkNlKzdraFhLK3pva1U4V2pTSkYwbGQyK1NoVkJkbjFwQUdR?=
 =?utf-8?B?UlJKOHBwd0xHQUs2c3JSTzNpQlp2VTJMOC9RS3lnMGVlbG9qT0JNSEZYZkph?=
 =?utf-8?B?c01aT3FNMC9RRUVXbmk5VVZIR3oyVW9FWm1uK2x4TG9DaUV0cS9FMU81LytK?=
 =?utf-8?B?WHI2SXBDS2JaYkh6QVl0Ykp0eVlSSURpWUI1TGdnNkM4WldoQklqZ05qOTNh?=
 =?utf-8?B?aGpMU1hTVmo5aWZob0FVekY3Q1QzTTlxWTRaakY1Tnp4ZFVHVm9QbkxZU2hG?=
 =?utf-8?B?dlA3cFliSnRHU0FMbXhYTHJzb1JRdDBQVW5mTTk3NmdWYzRKN2x2Vzl1MjN3?=
 =?utf-8?B?ejVkK2p0TGJMUWg3Z2g3dG1JMUFtTnFVUjZBb2xYT1g1NFFVNkxRUUZLeDFy?=
 =?utf-8?B?RFl6T2NMc0JWUzJ4RkFWc0wyOHVjOG1VL0Z5bEszOW5KYjltay9qdVFMd2di?=
 =?utf-8?Q?j+Tl6tQ3/R9PWgFFxozwl9gCl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e955ce8a-6852-4ee5-ea52-08dde6e9d291
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 10:50:09.3515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76yRyqt+uIBjI1EgaNo14A7RabKf3UUoAKYREL5+NWs449wWRmmOymfhRIeegI0H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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

You write mails faster than I can answer :)

I will try to answer all questions and comment here, here but please ping me if I miss something.

On 28.08.25 23:32, David Hildenbrand wrote:
> On 28.08.25 23:28, David Hildenbrand wrote:
>> On 28.08.25 23:18, David Hildenbrand wrote:
>>> On 26.08.25 18:09, Christian König wrote:
>>>> On 26.08.25 14:07, David Hildenbrand wrote:
[SNIP]
>>>> Well that was nearly 30years ago, PCI, AGP and front side bus are long gone, but the concept of putting video controller (GPU) stuff into uncached system memory has prevailed.
>>>>
>>>> So for example even modern AMD CPU based laptops need uncached system memory if their local memory is not large enough to contain the picture to display on the monitor. And with modern 8k monitors that can actually happen quite fast...
>>>>
>>>> What drivers do today is to call vmf_insert_pfn_prot() either with the PFN of their local memory (iomem) or uncached/wc system memory.
>>>
>>> That makes perfect sense. I assume we might or might not have "struct
>>> page" (pfn_valid) for the iomem, depending on where these areas reside,
>>> correct?

Exactly that, yes.

>>>> To summarize that we have an interface to fill in the page tables with either iomem or system memory is actually part of the design. That's how the HW driver is expected to work.
>>>>
>>>>>> That drivers need to call set_pages_wc/uc() for the linear mapping on x86 manually is correct and checking that is clearly a good idea for debug kernels.
>>>>>
>>>>> I'll have to think about this a bit: assuming only vmf_insert_pfn() calls pfnmap_setup_cachemode_pfn() but vmf_insert_pfn_prot() doesn't, how could we sanity check that somebody is doing something against the will of PAT.
>>>>
>>>> I think the most defensive approach for a quick fix is this change here:
>>>>
>>>>     static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm)
>>>>     {
>>>> -       *prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
>>>> -                        cachemode2protval(pcm));
>>>> +       if (pcm != _PAGE_CACHE_MODE_WB)
>>>> +               *prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
>>>> +                                cachemode2protval(pcm));
>>>>     }
>>>>
>>>> This applies the PAT value if it's anything else than _PAGE_CACHE_MODE_WB but still allows callers to use something different on normal WB system memory.
>>>>
>>>> What do you think?
>>>
>>> This feels like too big of a hammer. In particular, it changes things
>>> like phys_mem_access_prot_allowed(), which requires more care.
>>>
>>> First, I thought we should limit what we do to vmf_insert_pfn_prot()
>>> only. But then I realized that we have stuff like
>>>
>>>     vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>>>
>>> I'm still trying to find out the easy way out that is not a complete hack.

Well I think when the change is limited to only to vmf_insert_pfn_prot() for now we can limit the risk quite a bit as well.

Background is that only a handful of callers are using vmf_insert_pfn_prot() and it looks like all of those actually do know what they are doing and using the right flags.

>>> Will the iomem ever be mapped by the driver again with a different cache
>>> mode? (e.g., WB -> UC -> WB)

Yes, that can absolutely happen. But for iomem we would have an explicit call to ioremap(), ioremap_wc(), ioremap_cache() for that before anybody would map anything into userspace page tables.

But thinking more about it I just had an OMFG moment! Is it possible that the PAT currently already has a problem with that?

We had customer projects where BARs of different PCIe devices ended up on different physical addresses after a hot remove/re-add.

Is it possible that the PAT keeps enforcing certain caching attributes for a physical address? E.g. for example because a driver doesn't clean up properly on hot remove?

If yes than that would explain a massive number of problems we had with hot add/remove.

>> What I am currently wondering is: assume we get a
>> pfnmap_setup_cachemode_pfn() call and we could reliably identify whether
>> there was a previous registration, then we could do
>>
>> (a) No previous registration: don't modify pgprot. Hopefully the driver
>>       knows what it is doing. Maybe we can add sanity checks that the
>>       direct map was already updated etc.
>> (b) A previous registration: modify pgprot like we do today.

That would work for me.

>> System RAM is the problem. I wonder how many of these registrations we
>> really get and if we could just store them in the same tree as !system
>> RAM instead of abusing page flags.
> 
> commit 9542ada803198e6eba29d3289abb39ea82047b92
> Author: Suresh Siddha <suresh.b.siddha@intel.com>
> Date:   Wed Sep 24 08:53:33 2008 -0700
> 
>     x86: track memtype for RAM in page struct
>         Track the memtype for RAM pages in page struct instead of using the
>     memtype list. This avoids the explosion in the number of entries in
>     memtype list (of the order of 20,000 with AGP) and makes the PAT
>     tracking simpler.
>         We are using PG_arch_1 bit in page->flags.
>         We still use the memtype list for non RAM pages.
> 
> 
> I do wonder if that explosion is still an issue today.

Yes it is. That is exactly the issue I'm working on here.

It's just that AGP was replaced by internal GPU MMUs over time and so we don't use the old AGP code any more but just call get_free_pages() (or similar) directly.

Thanks a lot for the help,
Christian.
