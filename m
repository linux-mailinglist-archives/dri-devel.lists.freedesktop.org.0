Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C22A7A36A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F82510E9A1;
	Thu,  3 Apr 2025 13:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s+uXwUmw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D29E10E9A1;
 Thu,  3 Apr 2025 13:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7F0MA/oLmike++O/C/MHidJanRqR/NYJgfLv4RjZXUNE1c88SXwnuKGD5EjnEbXU/w5mEhx2noKqQ4SymKl8A62kQmhzwGTyQSCTozy44LbmRbzOiKfdQPuThtvIjTyqjIzXCX3Vdxcskll50RGW6Rjgr6zfacekKutk56OoMSoHDVTgUBPPQlw6mD5Fg2eklPrI2odMt14Nqrr2Qq2k5sQtmsWQX8o6KE6bY3RjgVKgOab6ZuNaAwNm6BYNR1+Aq6wDSztJk8ho89OHtZR11JLxU5mH251lihNKeuqHjMj0eBxnkKOpRcrNmoY5ISk8SSwI4Z9vImQ4biV5NZ1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4gcJsyHtiIWVrN4t3B0AzlYuyh4beMt4C8N4m9Uqe8=;
 b=s70G+Zw4df9gYkvFL51oP1afK1jts2Jw24MxSp0F3p9Jwh2RqA+5F8D1YnfrRN2yWV+wdJff5ydrACTN2PdDU6SoI+54ftVIPymNzQwZlQidB6alb+aqHwNFgPQlHhHPpOR0WKFD7UsYB5G1SyMZt7cD0bPYHaeiAshFVVBhFp5+zz7Yy9PQ6JHP8k/qx7MtnvXIjbhclbrfjAxLEimmUrDv69zt42mNHXSi1sJ5McxtTiKWU8uwarOJblNZ5Ug6EHFbAwZjc9sm25qaKVrKiS/Egy6nzxJ7HQQFcrM/IoKzbxfkZzdYFQcAu+N4cXmlcbUtCX1STcEQYwXGXcEK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4gcJsyHtiIWVrN4t3B0AzlYuyh4beMt4C8N4m9Uqe8=;
 b=s+uXwUmwyEbzYC8mEAnakI98EEBsfldfXoOQjDYNxDLeJVXuveDfPwoXGrYJrKcRiP4izPda+x6NGlL0fCZ/64a68pFCuTzOkJWhYLDvAzVbrj5rEgK2HK2zL/FfnQfO2cqj/nxOxo0riK6sA4Ennbjb82N2+eXxvsmWNHy2iVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Thu, 3 Apr
 2025 13:10:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 13:10:48 +0000
Content-Type: multipart/alternative;
 boundary="------------x1KSOmlDHBueIZmLp9Be2XrG"
Message-ID: <72156b6a-9a8b-4485-8091-95f02c96eba8@amd.com>
Date: Thu, 3 Apr 2025 15:10:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
 <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e9c3b7-37d9-4057-2587-08dd72b0f382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVJZbkVVN0ZjeVdzVXY0SDhzR2ZSNVo3aDRPaFFJZ3VWeFh0OUY5Q2hoYU9T?=
 =?utf-8?B?RkFkSWkzeFZQeU5CZm5tc2F0aHhXL3RrUlRvSG85TWt1R1JVY2RtcnpxQVBo?=
 =?utf-8?B?Uk15cWdSUU5wZldCaWxXc1pXcHlhcVNCaDRwcXc0N3pNcjFwRXVZZktVMnVT?=
 =?utf-8?B?cjMveUtaNkJoQ1ArcHpwcmJvQ0NobW5SQnQrWXkzYURLcS82UC80OG9Cd1Bp?=
 =?utf-8?B?dDlNbVJJUEFNdGtteEEvcFFYbVhkV0ZiNmFZQTRmNHhkQ1liNjZmdGFzUWZy?=
 =?utf-8?B?M2hmeFQydDRDSnU5Z2FHSFJNTXF0Tm5POTlTYnVicjFzWC8xdTB2dGdsTkQv?=
 =?utf-8?B?NndBeE0rWExZVHBENlBNSlhOS3RWYms1ZU1uKy9uT0pKcWJhMXd5cEdra1lW?=
 =?utf-8?B?WnhLS0k4cklOL3BVN0hQaXdteVg0NG5vblZIMC8zbi93Y0s0cWpialQ4Wks4?=
 =?utf-8?B?Q2QyS096ayszaFExelNhWVQzK05scEJKSXFWVW8vaUxnTFg2Q0xSQ3NvUHBM?=
 =?utf-8?B?enhuODRvTHowQ05CS2RsdVFnbk1ZMW5vMU0zQUN1RW1MUHV2L1F6YVlDSXFN?=
 =?utf-8?B?Z2MvNE5abWVybmhUTmlJZ1dvbm1IK3lpdFl2cDExZXpraXBWMnJWZThIalps?=
 =?utf-8?B?TlRVMXNZNVgySFlYbng1cTZLMHRBTTcwVC9oUUVFa0hQbnVobTJsbHovU2RK?=
 =?utf-8?B?clNGMS9MeUc4VVBXTTl4alNqTWFadUhGWEw3YTVvcmxMQk5lMXk1K1crU3F1?=
 =?utf-8?B?ZXVsZnZLSmRmNE03dlYwYllpZHlwUXViWDBueU5vVXU3OEs4bXVCREw3a2tp?=
 =?utf-8?B?Sm41azNPaFdLMFpMdmVIdUwrNkNvaU00Tmtic0grYlk3RDl3dGhYM1VLeFgw?=
 =?utf-8?B?VklFSnlzTU1jbzJGMWd1eU9maTdrenphVDhjSHZPQTdJdlkzZmlKWTFaV0hp?=
 =?utf-8?B?UnFiTThtNWt2dlkxOWFQNWtadHB4S1QrWlphZi9YbXZQRU1sd0xndjlMQW11?=
 =?utf-8?B?WFVmZE5VVVpBU0NHWllIK3R4SHNmR2M0MjYrN0hRMWhEbkMxYjFSUU5FWjhO?=
 =?utf-8?B?SFZPNHJ2aGxVK21sRXJjaFZCbGYwUTczWUp6Tm5OUU5JMTZ2UFVFb21tWE5P?=
 =?utf-8?B?bGJMMUlmMWloZk1YV0d2Q1dsYWNCc01JT3R1c0VEN2pGSUR5ZWNYQkFHWE5W?=
 =?utf-8?B?aWhSdjRWc210QjRBUnpwai9FaU9qQ0ZtQ1JyNXdHeGNwcUxyRjc2OHZNUVlS?=
 =?utf-8?B?VTA1WmRNWkgxZ3ZCUXI4Z0lHYWtIT1lFR3BhS2JWU0t0Z0dTN0p1NmdRdjZs?=
 =?utf-8?B?bG5CRVdpTzF0R0pVSFlsMlhzNjFyN21qYStQclhSUDh0R2Z6dkJZaEM0Y2E2?=
 =?utf-8?B?TU1iS2hVYWhyQk9VZ0NvMldiL2FrSUY2amR6WnNvWjNLSXExbVVveXdqclZZ?=
 =?utf-8?B?ZVRrWTB5NjFHS0h5aVBHT2ZEb0k1Q3cwYS9aM2kwY2xDQlZ1U2dJbUQ4bDBl?=
 =?utf-8?B?RjlweUo3aUZmMHBPTVNmK2VkREFQTXpaRXhWbDJWSllKMVYzWlVucmNmYmxX?=
 =?utf-8?B?MTVjUGdyTG5heHloYUo4RG5OZ2dhaUc5MjlkdmdLR0hwNHN0bzgxYi92K1Y0?=
 =?utf-8?B?QWpmV0FlZllzOEZ2OWZFdlA2WG9pa1ZXb2VsdFRMVytaS1BWRVpVWTA0SmxU?=
 =?utf-8?B?UXJMb1Q5MnRYcVAvMGhmRHlKZFkrK1lwdHRFZ3pReFNTVGtsWDhSVTRTMXNC?=
 =?utf-8?B?Q0hnWnVsZ2ZvWGJETjNEbjRvZnlEcVpFOHNJR0s5UnU0RVZsNGRHZGNscEVS?=
 =?utf-8?B?T3V5dldxVmdxenBIcTlvV1J5R1FERlBJbzJ0NDNmYVRQaTFxMDBLOS9ydlJY?=
 =?utf-8?Q?snswiXjO7UdiQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnE4RUd5REJudTRETjVlOTdYL25QRm1DNXhrcnRDRTIrMGNnRWpZeUFBZnBK?=
 =?utf-8?B?VzNZM1RiakNHcUNqcmdyaEFrZm53NHdpVkZOT0ZpQW9udy9YSjUyNTE0dWln?=
 =?utf-8?B?bkFZUi9QSkNuVi9RY0ttMlZpYmhISUVTRDBMV3VaM1o5RjZobHh2b20vaVdy?=
 =?utf-8?B?TkowWkljWjlzVDVmWERBWFAzcUd2Vm5OTW9pelZSTmR5S2c4TlFzOHpEcGF3?=
 =?utf-8?B?cSt4eXQwZmJHMzRTTU1WYm1mdmp5cGZHSnZ3Mm9wS01ZYVUwK1RPdXRBSERu?=
 =?utf-8?B?amVYaGxMS3hHdnI2aVZtR0doWnZ2WldDT0Y0VUE3NitYcEdIbmJ1N1lPOXZD?=
 =?utf-8?B?R2pLYjR0SElNNnFQc1NoaTVXNEtYN0EveVI5NHMwTldLOVo1T0JDQ3I5QWhW?=
 =?utf-8?B?M0hBbnNSMHhmN2FDdkdQcHpaNWpnK3NtSmNMNWRFbXJNL1VxM0YyRFkrWkxq?=
 =?utf-8?B?MDU2dlBUcm0za09aVVdXNFlxMGxoWW1nVWVvT1ArU2xRSjJTRVlnOWpXVlpt?=
 =?utf-8?B?dEdqQWVUMS9SdmNZRkcxd0hGT1EzVXpzWlowZFJzdWhoMlBqUnF6NHVLVFJC?=
 =?utf-8?B?ZWUzSmlEK0diS0c3dTFKb0V2Mkw0bFVVc3BHSzFaTWxoTzZ1ZXJKd0MwalJT?=
 =?utf-8?B?cTFFQU1YN1pXYmlpWTlDTENGcE5HRE5TMkJNd3ZwaEFsc2IyMFY3eUk4NVdt?=
 =?utf-8?B?TCtZK1NXWC81blZJNExwbWJNOXdyRHZPUVFpeXE1dmE3amdYR0QyOUQ4N1NB?=
 =?utf-8?B?K3NMczR4RDNxNFBCS24wQVcza3Q0ZjEzRi9wUkNYdVM0azhlenlzN2xheFlN?=
 =?utf-8?B?TzlDSFlmQzd5WFBNdnZxbjloQk0vK2ZxTTVKUzB5NDJWRGlnSSsxSDljaU03?=
 =?utf-8?B?T29kcmlGWE93MmdIRVdoQStEeHdGenJzT3ZxNklJQVk5WXkwNjhuSERENVBY?=
 =?utf-8?B?UHRUcFlGNk1rRWRKSy94WllndTBTd3VWdHUyckpSQ1NsTmd5K2VZT0V0S080?=
 =?utf-8?B?bXlNZGE3cncyK0d5dzdOd0gzMDdGc2JDYVBWd2ZzdENkZldpclEvUU5MVkM0?=
 =?utf-8?B?cklXS1JRNnY0eVFSak53WEZXOElYM1BmaXZYaHA3MzZoTnp5cytsRG5yUk13?=
 =?utf-8?B?bHphUnlveS9WMUZWUHE5elhiK2cwbnBIclRMZTBIczRyYTJiZk5JKzZJOG1y?=
 =?utf-8?B?RXA3eWNJNmd2NDZVRkFUY2k0T3RTaDJIUHBBQVlUYklyTmwrOWFRTlZlRkMx?=
 =?utf-8?B?OVNmWTlzK0ovQ24wOEhVdFdqVnVaUnArNElQVjBGakZmQk93VysvdVVtNEVI?=
 =?utf-8?B?UnIxYnNzTDh4dVo3Z2IvU3N5eUg5anJ0dDBlM2xadk9nR2Z4SzRZNnVxWFJr?=
 =?utf-8?B?NDJzd25JTCtsb2t4NTFMS2tzUlc1OW1WTWRua1h6TG95UVpVYjVhRjNVZkJ1?=
 =?utf-8?B?K2RjY1VOZG02V21JOWwxUENSY2lkd1NCSmtRc0lGMHNicWdZWFlDeGtnMW8w?=
 =?utf-8?B?cW1MYm5XVGxtRlorR3YveEE4eXZuRnBLU2hISmhWK0MrSjY4a0lBdGRBSkd3?=
 =?utf-8?B?cCtud01KRi92YWwyR1Q3RFQxdnp0b2szR0dFNG5mdk4vSUlVcS8yckhUN0or?=
 =?utf-8?B?WXcvVVVBZFJxbFMrTHg3VE16ekZWM3RTMmxkVXdRNFlLcGNpRkVuaTU5Z3lT?=
 =?utf-8?B?RnJVZHZSVTkyZ2MvZnc5YTRQMzJBUFd0TTkxN3NBS1BGS3podDhZZHFwdlJG?=
 =?utf-8?B?OGtGdTZFbG5NL096dVRkTHhRT3dKSjJFem81dUJvcFZkQUV3ajJjamp0SDB1?=
 =?utf-8?B?WlJZZHZDdlFUVjRBMTlkbjJFNG9ldzQ5cUcvTnZjREt1SnFsaHUyVEhqeVh6?=
 =?utf-8?B?TU1ZU0liU1V1cmpMMEFGUkFQbkMzMno0bE9WZGNwYUVUU25QK2dJZHJpamkz?=
 =?utf-8?B?aHZWeXZBOFdCbmd0SzN0d1kvMEx1MDR5bVRoQ3Y0c1JmY2x4UktBa0g0UGJs?=
 =?utf-8?B?TXJPV2NIdHlBU1dxcnU2QUlRSkxGd3VXaFc4eDY2Z0QrU242cldJYzZFMitL?=
 =?utf-8?B?SmRSUzJPZW4rQjh3bDlSbXlOaC90cll2bnhaVHlzZmV5TXk5UTR0ZWEzcGti?=
 =?utf-8?Q?CCh8k3qpRSNfsf0CJ/8NOLuM/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e9c3b7-37d9-4057-2587-08dd72b0f382
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 13:10:48.6733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwbvMLrwORgPkRbeeGdJ3OFHYCNstPkrLH1yiIhe4pConoc/8r6iwgPpB+PCnwBG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
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

--------------x1KSOmlDHBueIZmLp9Be2XrG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 03.04.25 um 14:58 schrieb Philipp Stanner:
> On Thu, 2025-04-03 at 14:08 +0200, Christian König wrote:
>> Am 03.04.25 um 12:13 schrieb Philipp Stanner:
>>> Nouveau currently relies on the assumption that dma_fences will
>>> only
>>> ever get signalled through nouveau_fence_signal(), which takes care
>>> of
>>> removing a signalled fence from the list
>>> nouveau_fence_chan.pending.
>>>
>>> This self-imposed rule is violated in nouveau_fence_done(), where
>>> dma_fence_is_signaled() can signal the fence without removing it
>>> from
>>> the list. This enables accesses to already signalled fences through
>>> the
>>> list, which is a bug.
>>>
>>> Furthermore, it must always be possible to use standard dma_fence
>>> methods an a dma_fence and observe valid behavior. The canonical
>>> way of
>>> ensuring that signalling a fence has additional effects is to add
>>> those
>>> effects to a callback and register it on that fence.
>>>
>>> Move the code from nouveau_fence_signal() into a dma_fence
>>> callback.
>>> Register that callback when creating the fence.
>>>
>>> Cc: <stable@vger.kernel.org> # 4.10+
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> Changes in v2:
>>>   - Remove Fixes: tag. (Danilo)
>>>   - Remove integer "drop" and call nvif_event_block() in the fence
>>>     callback. (Danilo)
>>> ---
>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 52 +++++++++++++--------
>>> ----
>>>  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
>>>  2 files changed, 29 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index 7cc84472cece..cf510ef9641a 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -50,24 +50,24 @@ nouveau_fctx(struct nouveau_fence *fence)
>>>  	return container_of(fence->base.lock, struct
>>> nouveau_fence_chan, lock);
>>>  }
>>>  
>>> -static int
>>> -nouveau_fence_signal(struct nouveau_fence *fence)
>>> +static void
>>> +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
>>> dma_fence_cb *cb)
>>>  {
>>> -	int drop = 0;
>>> +	struct nouveau_fence_chan *fctx;
>>> +	struct nouveau_fence *fence;
>>> +
>>> +	fence = container_of(dfence, struct nouveau_fence, base);
>>> +	fctx = nouveau_fctx(fence);
>>>  
>>> -	dma_fence_signal_locked(&fence->base);
>>>  	list_del(&fence->head);
>>>  	rcu_assign_pointer(fence->channel, NULL);
>>>  
>>>  	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence-
>>>> base.flags)) {
>>> -		struct nouveau_fence_chan *fctx =
>>> nouveau_fctx(fence);
>>> -
>>>  		if (!--fctx->notify_ref)
>>> -			drop = 1;
>>> +			nvif_event_block(&fctx->event);
>>>  	}
>>>  
>>>  	dma_fence_put(&fence->base);
>>> -	return drop;
>>>  }
>>>  
>>>  static struct nouveau_fence *
>>> @@ -93,8 +93,7 @@ nouveau_fence_context_kill(struct
>>> nouveau_fence_chan *fctx, int error)
>>>  		if (error)
>>>  			dma_fence_set_error(&fence->base, error);
>>>  
>>> -		if (nouveau_fence_signal(fence))
>>> -			nvif_event_block(&fctx->event);
>>> +		dma_fence_signal_locked(&fence->base);
>>>  	}
>>>  	fctx->killed = 1;
>>>  	spin_unlock_irqrestore(&fctx->lock, flags);
>>> @@ -127,11 +126,10 @@ nouveau_fence_context_free(struct
>>> nouveau_fence_chan *fctx)
>>>  	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
>>>  }
>>>  
>>> -static int
>>> +static void
>>>  nouveau_fence_update(struct nouveau_channel *chan, struct
>>> nouveau_fence_chan *fctx)
>>>  {
>>>  	struct nouveau_fence *fence;
>>> -	int drop = 0;
>>>  	u32 seq = fctx->read(chan);
>>>  
>>>  	while (!list_empty(&fctx->pending)) {
>>> @@ -140,10 +138,8 @@ nouveau_fence_update(struct nouveau_channel
>>> *chan, struct nouveau_fence_chan *fc
>>>  		if ((int)(seq - fence->base.seqno) < 0)
>>>  			break;
>>>  
>>> -		drop |= nouveau_fence_signal(fence);
>>> +		dma_fence_signal_locked(&fence->base);
>>>  	}
>>> -
>>> -	return drop;
>>>  }
>>>  
>>>  static void
>>> @@ -152,7 +148,6 @@ nouveau_fence_uevent_work(struct work_struct
>>> *work)
>>>  	struct nouveau_fence_chan *fctx = container_of(work,
>>> struct nouveau_fence_chan,
>>>  						      
>>> uevent_work);
>>>  	unsigned long flags;
>>> -	int drop = 0;
>>>  
>>>  	spin_lock_irqsave(&fctx->lock, flags);
>>>  	if (!list_empty(&fctx->pending)) {
>>> @@ -161,11 +156,8 @@ nouveau_fence_uevent_work(struct work_struct
>>> *work)
>>>  
>>>  		fence = list_entry(fctx->pending.next,
>>> typeof(*fence), head);
>>>  		chan = rcu_dereference_protected(fence->channel,
>>> lockdep_is_held(&fctx->lock));
>>> -		if (nouveau_fence_update(chan, fctx))
>>> -			drop = 1;
>>> +		nouveau_fence_update(chan, fctx);
>>>  	}
>>> -	if (drop)
>>> -		nvif_event_block(&fctx->event);
>>>  
>>>  	spin_unlock_irqrestore(&fctx->lock, flags);
>>>  }
>>> @@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence
>>> *fence)
>>>  			       &fctx->lock, fctx->context, ++fctx-
>>>> sequence);
>>>  	kref_get(&fctx->fence_ref);
>>>  
>>> +	fence->cb.func = nouveau_fence_cleanup_cb;
>>> +	/* Adding a callback runs into
>>> __dma_fence_enable_signaling(), which will
>>> +	 * ultimately run into nouveau_fence_no_signaling(), where
>>> a WARN_ON
>>> +	 * would fire because the refcount can be dropped there.
>>> +	 *
>>> +	 * Increment the refcount here temporarily to work around
>>> that.
>>> +	 */
>>> +	dma_fence_get(&fence->base);
>>> +	ret = dma_fence_add_callback(&fence->base, &fence->cb,
>>> nouveau_fence_cleanup_cb);
>> That looks like a really really awkward approach. The driver
>> basically uses a the DMA fence infrastructure as middle layer and
>> callbacks into itself to cleanup it's own structures.
> What else are callbacks good for, if not to do something automatically
> when the fence gets signaled?

Well if you add a callback for a signal you issued yourself then that's kind of awkward.

E.g. you call into the DMA fence code, just for the DMA fence code to call yourself back again.

>> Additional to that we don't guarantee any callback order for the DMA
>> fence and so it can be that mix cleaning up the callback with other
>> work which is certainly not good when you want to guarantee that the
>> cleanup happens under the same lock.
> Isn't my perception correct that the primary issue you have with this
> approach is that dma_fence_put() is called from within the callback? Or
> do you also take issue with deleting from the list?

Well kind of both. The issue is that the caller of dma_fence_signal() or dma_fence_signal_locked() must hold the reference until the function returns.

When you do the list cleanup and the drop inside the callback it is perfectly possible that the fence pointer becomes stale before you return and that's really not a good idea.

>
>> Instead the call to dma_fence_signal_locked() should probably be
>> removed from nouveau_fence_signal() and into
>> nouveau_fence_context_kill() and nouveau_fence_update().
>>
>> This way nouveau_fence_is_signaled() can call this function as well.
> Which "this function"? dma_fence_signal_locked()

No the cleanup function for the list entry. Whatever you call that then, the name nouveau_fence_signal() is probably not appropriate any more.

>
>> BTW: nouveau_fence_no_signaling() looks completely broken as well. It
>> calls nouveau_fence_is_signaled() and then list_del() on the fence
>> head.
> I can assure you that a great many things in Nouveau look completely
> broken.
>
> The question for us is always the cost-benefit-ratio when fixing bugs.
> There are fixes that solve the bug with reasonable effort, and there
> are great reworks towards an ideal state.

I would just simply drop that function. As far as I can see it severs no purpose other than doing exactly what the common DMA fence code does anyway.

Just one less thing which could fail.

Christian.

>
> P.
>
>
>> As far as I can see that is completely superfluous and should
>> probably be dropped. IIRC I once had a patch to clean that up but it
>> was dropped for some reason.
>>
>> Regards,
>> Christian.
>>
>>
>>> +	dma_fence_put(&fence->base);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>  	ret = fctx->emit(fence);
>>>  	if (!ret) {
>>>  		dma_fence_get(&fence->base);
>>> @@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>>>  			return -ENODEV;
>>>  		}
>>>  
>>> -		if (nouveau_fence_update(chan, fctx))
>>> -			nvif_event_block(&fctx->event);
>>> +		nouveau_fence_update(chan, fctx);
>>>  
>>>  		list_add_tail(&fence->head, &fctx->pending);
>>>  		spin_unlock_irq(&fctx->lock);
>>> @@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
>>>  
>>>  		spin_lock_irqsave(&fctx->lock, flags);
>>>  		chan = rcu_dereference_protected(fence->channel,
>>> lockdep_is_held(&fctx->lock));
>>> -		if (chan && nouveau_fence_update(chan, fctx))
>>> -			nvif_event_block(&fctx->event);
>>> +		if (chan)
>>> +			nouveau_fence_update(chan, fctx);
>>>  		spin_unlock_irqrestore(&fctx->lock, flags);
>>>  	}
>>>  	return dma_fence_is_signaled(&fence->base);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> index 8bc065acfe35..e6b2df7fdc42 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
>>> @@ -10,6 +10,7 @@ struct nouveau_bo;
>>>  
>>>  struct nouveau_fence {
>>>  	struct dma_fence base;
>>> +	struct dma_fence_cb cb;
>>>  
>>>  	struct list_head head;
>>>  

--------------x1KSOmlDHBueIZmLp9Be2XrG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.04.25 um 14:58 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">On Thu, 2025-04-03 at 14:08 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 03.04.25 um 12:13 schrieb Philipp Stanner:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Nouveau currently relies on the assumption that dma_fences will
only
ever get signalled through nouveau_fence_signal(), which takes care
of
removing a signalled fence from the list
nouveau_fence_chan.pending.

This self-imposed rule is violated in nouveau_fence_done(), where
dma_fence_is_signaled() can signal the fence without removing it
from
the list. This enables accesses to already signalled fences through
the
list, which is a bug.

Furthermore, it must always be possible to use standard dma_fence
methods an a dma_fence and observe valid behavior. The canonical
way of
ensuring that signalling a fence has additional effects is to add
those
effects to a callback and register it on that fence.

Move the code from nouveau_fence_signal() into a dma_fence
callback.
Register that callback when creating the fence.

Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # 4.10+
Signed-off-by: Philipp Stanner <a class="moz-txt-link-rfc2396E" href="mailto:phasta@kernel.org">&lt;phasta@kernel.org&gt;</a>
---
Changes in v2:
&nbsp; - Remove Fixes: tag. (Danilo)
&nbsp; - Remove integer &quot;drop&quot; and call nvif_event_block() in the fence
&nbsp;&nbsp;&nbsp; callback. (Danilo)
---
&nbsp;drivers/gpu/drm/nouveau/nouveau_fence.c | 52 +++++++++++++--------
----
&nbsp;drivers/gpu/drm/nouveau/nouveau_fence.h |&nbsp; 1 +
&nbsp;2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..cf510ef9641a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -50,24 +50,24 @@ nouveau_fctx(struct nouveau_fence *fence)
&nbsp;	return container_of(fence-&gt;base.lock, struct
nouveau_fence_chan, lock);
&nbsp;}
&nbsp;
-static int
-nouveau_fence_signal(struct nouveau_fence *fence)
+static void
+nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
dma_fence_cb *cb)
&nbsp;{
-	int drop = 0;
+	struct nouveau_fence_chan *fctx;
+	struct nouveau_fence *fence;
+
+	fence = container_of(dfence, struct nouveau_fence, base);
+	fctx = nouveau_fctx(fence);
&nbsp;
-	dma_fence_signal_locked(&amp;fence-&gt;base);
&nbsp;	list_del(&amp;fence-&gt;head);
&nbsp;	rcu_assign_pointer(fence-&gt;channel, NULL);
&nbsp;
&nbsp;	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &amp;fence-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">base.flags)) {
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">-		struct nouveau_fence_chan *fctx =
nouveau_fctx(fence);
-
&nbsp;		if (!--fctx-&gt;notify_ref)
-			drop = 1;
+			nvif_event_block(&amp;fctx-&gt;event);
&nbsp;	}
&nbsp;
&nbsp;	dma_fence_put(&amp;fence-&gt;base);
-	return drop;
&nbsp;}
&nbsp;
&nbsp;static struct nouveau_fence *
@@ -93,8 +93,7 @@ nouveau_fence_context_kill(struct
nouveau_fence_chan *fctx, int error)
&nbsp;		if (error)
&nbsp;			dma_fence_set_error(&amp;fence-&gt;base, error);
&nbsp;
-		if (nouveau_fence_signal(fence))
-			nvif_event_block(&amp;fctx-&gt;event);
+		dma_fence_signal_locked(&amp;fence-&gt;base);
&nbsp;	}
&nbsp;	fctx-&gt;killed = 1;
&nbsp;	spin_unlock_irqrestore(&amp;fctx-&gt;lock, flags);
@@ -127,11 +126,10 @@ nouveau_fence_context_free(struct
nouveau_fence_chan *fctx)
&nbsp;	kref_put(&amp;fctx-&gt;fence_ref, nouveau_fence_context_put);
&nbsp;}
&nbsp;
-static int
+static void
&nbsp;nouveau_fence_update(struct nouveau_channel *chan, struct
nouveau_fence_chan *fctx)
&nbsp;{
&nbsp;	struct nouveau_fence *fence;
-	int drop = 0;
&nbsp;	u32 seq = fctx-&gt;read(chan);
&nbsp;
&nbsp;	while (!list_empty(&amp;fctx-&gt;pending)) {
@@ -140,10 +138,8 @@ nouveau_fence_update(struct nouveau_channel
*chan, struct nouveau_fence_chan *fc
&nbsp;		if ((int)(seq - fence-&gt;base.seqno) &lt; 0)
&nbsp;			break;
&nbsp;
-		drop |= nouveau_fence_signal(fence);
+		dma_fence_signal_locked(&amp;fence-&gt;base);
&nbsp;	}
-
-	return drop;
&nbsp;}
&nbsp;
&nbsp;static void
@@ -152,7 +148,6 @@ nouveau_fence_uevent_work(struct work_struct
*work)
&nbsp;	struct nouveau_fence_chan *fctx = container_of(work,
struct nouveau_fence_chan,
&nbsp;						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
uevent_work);
&nbsp;	unsigned long flags;
-	int drop = 0;
&nbsp;
&nbsp;	spin_lock_irqsave(&amp;fctx-&gt;lock, flags);
&nbsp;	if (!list_empty(&amp;fctx-&gt;pending)) {
@@ -161,11 +156,8 @@ nouveau_fence_uevent_work(struct work_struct
*work)
&nbsp;
&nbsp;		fence = list_entry(fctx-&gt;pending.next,
typeof(*fence), head);
&nbsp;		chan = rcu_dereference_protected(fence-&gt;channel,
lockdep_is_held(&amp;fctx-&gt;lock));
-		if (nouveau_fence_update(chan, fctx))
-			drop = 1;
+		nouveau_fence_update(chan, fctx);
&nbsp;	}
-	if (drop)
-		nvif_event_block(&amp;fctx-&gt;event);
&nbsp;
&nbsp;	spin_unlock_irqrestore(&amp;fctx-&gt;lock, flags);
&nbsp;}
@@ -235,6 +227,19 @@ nouveau_fence_emit(struct nouveau_fence
*fence)
&nbsp;			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;fctx-&gt;lock, fctx-&gt;context, ++fctx-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">sequence);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;	kref_get(&amp;fctx-&gt;fence_ref);
&nbsp;
+	fence-&gt;cb.func = nouveau_fence_cleanup_cb;
+	/* Adding a callback runs into
__dma_fence_enable_signaling(), which will
+	 * ultimately run into nouveau_fence_no_signaling(), where
a WARN_ON
+	 * would fire because the refcount can be dropped there.
+	 *
+	 * Increment the refcount here temporarily to work around
that.
+	 */
+	dma_fence_get(&amp;fence-&gt;base);
+	ret = dma_fence_add_callback(&amp;fence-&gt;base, &amp;fence-&gt;cb,
nouveau_fence_cleanup_cb);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That looks like a really really awkward approach. The driver
basically uses a the DMA fence infrastructure as middle layer and
callbacks into itself to cleanup it's own structures.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What else are callbacks good for, if not to do something automatically
when the fence gets signaled?</pre>
    </blockquote>
    <br>
    Well if you add a callback for a signal you issued yourself then
    that's kind of awkward.<br>
    <br>
    E.g. you call into the DMA fence code, just for the DMA fence code
    to call yourself back again.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Additional to that we don't guarantee any callback order for the DMA
fence and so it can be that mix cleaning up the callback with other
work which is certainly not good when you want to guarantee that the
cleanup happens under the same lock.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Isn't my perception correct that the primary issue you have with this
approach is that dma_fence_put() is called from within the callback? Or
do you also take issue with deleting from the list?</pre>
    </blockquote>
    <br>
    Well kind of both. The issue is that the caller of
    dma_fence_signal() or dma_fence_signal_locked() must hold the
    reference until the function returns.<br>
    <br>
    When you do the list cleanup and the drop inside the callback it is
    perfectly possible that the fence pointer becomes stale before you
    return and that's really not a good idea.<br>
    <br>
    <blockquote type="cite" cite="mid:2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Instead the call to dma_fence_signal_locked() should probably be
removed from nouveau_fence_signal() and into
nouveau_fence_context_kill() and nouveau_fence_update().

This way nouveau_fence_is_signaled() can call this function as well.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Which &quot;this function&quot;? dma_fence_signal_locked()</pre>
    </blockquote>
    <br>
    No the cleanup function for the list entry. Whatever you call that
    then, the name nouveau_fence_signal() is probably not appropriate
    any more.<br>
    <br>
    <blockquote type="cite" cite="mid:2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
BTW: nouveau_fence_no_signaling() looks completely broken as well. It
calls nouveau_fence_is_signaled() and then list_del() on the fence
head.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I can assure you that a great many things in Nouveau look completely
broken.

The question for us is always the cost-benefit-ratio when fixing bugs.
There are fixes that solve the bug with reasonable effort, and there
are great reworks towards an ideal state.</pre>
    </blockquote>
    <br>
    I would just simply drop that function. As far as I can see it
    severs no purpose other than doing exactly what the common DMA fence
    code does anyway.<br>
    <br>
    Just one less thing which could fail.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">

P.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
As far as I can see that is completely superfluous and should
probably be dropped. IIRC I once had a patch to clean that up but it
was dropped for some reason.

Regards,
Christian.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	dma_fence_put(&amp;fence-&gt;base);
+	if (ret)
+		return ret;
+
&nbsp;	ret = fctx-&gt;emit(fence);
&nbsp;	if (!ret) {
&nbsp;		dma_fence_get(&amp;fence-&gt;base);
@@ -246,8 +251,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
&nbsp;			return -ENODEV;
&nbsp;		}
&nbsp;
-		if (nouveau_fence_update(chan, fctx))
-			nvif_event_block(&amp;fctx-&gt;event);
+		nouveau_fence_update(chan, fctx);
&nbsp;
&nbsp;		list_add_tail(&amp;fence-&gt;head, &amp;fctx-&gt;pending);
&nbsp;		spin_unlock_irq(&amp;fctx-&gt;lock);
@@ -270,8 +274,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
&nbsp;
&nbsp;		spin_lock_irqsave(&amp;fctx-&gt;lock, flags);
&nbsp;		chan = rcu_dereference_protected(fence-&gt;channel,
lockdep_is_held(&amp;fctx-&gt;lock));
-		if (chan &amp;&amp; nouveau_fence_update(chan, fctx))
-			nvif_event_block(&amp;fctx-&gt;event);
+		if (chan)
+			nouveau_fence_update(chan, fctx);
&nbsp;		spin_unlock_irqrestore(&amp;fctx-&gt;lock, flags);
&nbsp;	}
&nbsp;	return dma_fence_is_signaled(&amp;fence-&gt;base);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h
b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 8bc065acfe35..e6b2df7fdc42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -10,6 +10,7 @@ struct nouveau_bo;
&nbsp;
&nbsp;struct nouveau_fence {
&nbsp;	struct dma_fence base;
+	struct dma_fence_cb cb;
&nbsp;
&nbsp;	struct list_head head;
&nbsp;
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

--------------x1KSOmlDHBueIZmLp9Be2XrG--
