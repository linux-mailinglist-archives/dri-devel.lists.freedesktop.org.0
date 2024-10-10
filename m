Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48373997EA0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5214810E885;
	Thu, 10 Oct 2024 08:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rVawqqay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B7D10E885
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 08:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVGRqOzeUdh8saPORWot9YMYfpfUTALCBemDlzvYlbLU7LkjoHeqTsntEMfgpw3kLDxxy19bt0jjuIMB+lk8JlkMIkRwSCBTQ05tcCa23l2LFDp/0CM8PilB04x9q4mgQRdoIGRLtrdr1zSBDij6j2O98ZqIYr5oFY73SxPADWg9w5B22T89jhBYQHBfVyEOd/vG7QLg2o+j3XTWYnNEqzXcNmxwQvWXrDmOesq1ptxIeKq76uWIUn/Y2wCbxEkU5gnnD5reIKp3O28c5cteyWrgJ4IBbTvhLyruom54axiB6kvNR7kZcdCDbKO2kizlCOJktechnwWfb5EEYwZXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPxLqsjE/b8RuFcatIHfgcSMNqqp27bZOvYfcHZWgOQ=;
 b=xiiaiNODs3aMnnBGm9jwP2BIKCWLtpG+l79VVX/C005u2nRw0yEBFHrVIICWhwKWyVpMDJUkdLGkTx2fbgFTXMjQPu3C4rfPIL6PL4JZVz+v7Kp9XnwPLPVct1m/T3M1e6ONj6YE15oC2AbHcBGKObB9oP03xkmBXg2JLeCCmXDwH+zwn64hhjUoiu3QMw7id3uzk2kC1F3iLQiBz0kDARNHm3nxLoGUdvVXaLJzuw747bNp8B53aQQqYAn1LzO1gkEQ/yhXTZw7dKsirENm+ZAgwGpoJhkDtB913b4Srx6M3GzbA/2ReA7yH30Y/rx7yB+JBEcaxF3C2293IJqQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPxLqsjE/b8RuFcatIHfgcSMNqqp27bZOvYfcHZWgOQ=;
 b=rVawqqaya7q0mUWfIh+3/+PteHbW6zHQbzccU8tGtVSEBde9CF00qflTyfNi+pHPkFgwmPw3EqtdOnhYEgOaCaSmRwttIunLc8cMXfLCCQiMZHcVzrvnmKigHmWB8D3zWQghZ8W63BxyyEgLTmNHDfx/9/ITI4FqR39qQVz7Z0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:00:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 08:00:36 +0000
Content-Type: multipart/alternative;
 boundary="------------ou6ZK8ZwbbGQVFzgjU2PPY8i"
Message-ID: <08a82bc9-b9bd-4491-8a25-b8d0e6cb20d2@amd.com>
Date: Thu, 10 Oct 2024 10:00:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
 <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
 <Zs4EPT1DR7OrE5X-@phenom.ffwll.local> <Zs4Ss8LJ-n9NbBcb@phenom.ffwll.local>
 <c890ecbf-e7eb-479d-bb54-807edd1f66e6@amd.com>
 <ZtWca-cpqUsE8WTZ@phenom.ffwll.local>
 <4c634e5c1bd9907f315d8b3535ebb6154819d5ea.camel@linux.intel.com>
 <2bca2a15-029e-4d8a-9eb4-3dc54f42798e@amd.com>
 <d48f5c1ef67bfe57253aa33370f3105080577534.camel@linux.intel.com>
 <ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e5907-4cd4-41cf-3147-08dce9019fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG9qQmdQeUhZUk9JMVI0dzFlS3lRMUR1SnkvUlNyc0I1b09tTDE1ZFNFV2Y3?=
 =?utf-8?B?RU1QTVg1dnFnZTNFRCs0cm1KZngwMlFRUDBQM3VYRElITHFvbTNoMjlwU01r?=
 =?utf-8?B?YWc4eEI2WVdNNk4wSm1ySXNCTWNSK1dXUHN0VnVRTFJ3UUdibGpYTUJtN2VM?=
 =?utf-8?B?aXN0ejd0L05oTFZsaHRIaTFoa3JsaEVIRVQxZEw4VGRZaFF2cFFBZzBJdWt0?=
 =?utf-8?B?TzVBWTA0bW90VjN1Mm11UnJMRHkrWVJzbTZBSHNtS2Flb05DZkg2N3lvZUUx?=
 =?utf-8?B?UFh4RzJNNEIwL2lKYlAvalJGMFJuRmExaTNmYnpVZDNCMHZLQ09wbFUxaklI?=
 =?utf-8?B?akJndy9HZGw1amhRUERUMjZQMWFmcFU3aFJNVEN2L0hMTlhWNWNIZWZQU0Uv?=
 =?utf-8?B?VU51TURnY3hEMmEwNHpsd2NtTHhZcHkrNU5LMyt3bnBmd1Arb3VuUUZJbzRq?=
 =?utf-8?B?Qmc5SDBscFZHb1FiVVh3K1VtSU1vYWxKNVQ3Tnd5cUdYMHJYaWZ4OVgvcmFv?=
 =?utf-8?B?alBmeWZpS04yWVlzN0EvV3pBQ3p4SndMTmVOTWdld1F3SDcxVnI0ekdjNkg1?=
 =?utf-8?B?RXRucmpndityZk9XYnU3eit6SkhINVpDaHJHbVhYSUNhK0hUT3Vqckw5RHEy?=
 =?utf-8?B?d28wMzR4YlllZkFheWIrMFowOTZXL0cxRlZucmNUVm9JTkF0VnJkNktab0pi?=
 =?utf-8?B?SE9jWHRpZjhTVSt1UGRVUUtISHNOcDNxSHE0cVNDMzltandyUE1SYUw1RW8v?=
 =?utf-8?B?MG41aWE5VDIrK2pITUNSa3E3NkFTWEdVbGd4aUthVkZwYkE2WGFNRWVsSk9m?=
 =?utf-8?B?RGIrc2s2UmNGbWZZN3dJM3hLQk91QmViam13dzVkTGgxMjc2MWJqM3U1MjZF?=
 =?utf-8?B?M0w1NllRenpKclVqdXJ2SjlpN29OdHpwYmRXWVdHMnpPY2lhR3lCYkRWM2tj?=
 =?utf-8?B?ZktJeUVQVlM5djRCUTNteUJtckpVZzRPbnBEekZ1WGpaRi9Rb1YvVldLbTFG?=
 =?utf-8?B?RGllS2dXREozSWxTSmoxeTBkOHNMd2hNMkpGMFVSbWNCSUxndXpDWHd0NU5T?=
 =?utf-8?B?czVudHY1MFZKZUhpYlZMWloyVjE3NjVBOU1RZjZ1SDNVSWNVcjNaZEQzcE1T?=
 =?utf-8?B?anlRVmtqcTBsNk1uczEweitqSURHcGs4TGFWVHVIM3ZKMXR3TnI4Q0toZURM?=
 =?utf-8?B?T1JFQldLdndQd1NrbXNpZWU1UWFZQ2ZQUG9WTlVhcmV5c1NRS1BPWDRvUEpt?=
 =?utf-8?B?Z2pQdk0vV2lXdXdybXZZaUQySUk3Mjg0TE1BTG5pM2dYYm5rZU43dGJud0pV?=
 =?utf-8?B?cFVhTjZyaGY5V1NtbENXS3VvdTBRZFJTZFVDV2MzMitwWGtTOURZTksyQk50?=
 =?utf-8?B?TnNFbWtieXg1WCtubTBEeFFSeDJCUWtUK05NNG9XZzQ0RUQ3STRURUtNbk5H?=
 =?utf-8?B?bnpWQ2xZZ2FLZWNMWmh0L05nRUZvTlNtVWpZQ28weTdlcFRpc2NlcDhVUUhV?=
 =?utf-8?B?QTQwa2FxSkNzWFVtNlhNaHI2Rm5nWmh3OG5odDVwV1NlOGpraTJMY1BtQ29C?=
 =?utf-8?B?V3dpbmxxSlloMklCR1FlNFQzUkd2eW1tVUlXbFZYMktzNDc1ZjN5cmZFZ1pO?=
 =?utf-8?Q?zJGWfxyVSMG4yuBka05TOaaoURLQKdfJ6abkfRAV4ACg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1VsWE1QOWhNNDZmM0JkOTZtU1ZBN0hVN3NWcDdEaUY5RUJTTkI1Sld3Mm93?=
 =?utf-8?B?dGdKckh6d3hEUmNCTHNmVEZ0QVhOZkl0enJwZm1ocDZiZWtxcW5YWERtTWRl?=
 =?utf-8?B?RVpkeWppbmdqN200YVpudWdQTmI0MGM0U1ZUZkxMeDdnb2xlVVFzVVQwSGpr?=
 =?utf-8?B?MlpRMnlXY0Z6MzFrTTRPcVhaMXllQlNVa0VtUSs4VHRNdFA4NDQ5cnppTFBG?=
 =?utf-8?B?M1hxWEQrTzExTFNmc2xzVzBJSG9RQ1F0ZllDUXpodk15TWpxaTNLY29JY0Mv?=
 =?utf-8?B?RW9hbWk1ajFnZUtnOVlnTE1hdUdYaU55V25UNXk0NnU4RWhJYStzdEZtdXJS?=
 =?utf-8?B?TkVVcHZkZ2hKZ3pPQkhlZWMxTDQxaWtub1BsbzNLUE9sdlFhMWRkam42REsw?=
 =?utf-8?B?R2ZnTE45bTRKT2g4L1JxTm11L0xyZnFZRysvWWJ1Sm5uNWU2SEtUOHJiSzVq?=
 =?utf-8?B?ZUxDNVNJc3EzRzFJNld1bURueE5NQy9ZMUk0bXprNHYxNk96WTJaa3g2Q2Fs?=
 =?utf-8?B?L1o0cjRFTmxkaVFTRjk1VG5Ob3VOOGJMY3dUOFpUU3pQQjJmblp0U0l3a2dV?=
 =?utf-8?B?cGlxVkxVekgvTkJLZnlDY3UvbHEySjR2T1BkT25kSWNuWWxUVnA1enJ6bGw2?=
 =?utf-8?B?MUNFSzBhNEZCK2wyYUg3WmpJU0poUkZzUlNqSE1saXdaV1NVaTN6NGFVbU5n?=
 =?utf-8?B?MmczbXEyZ282UkNzTGZqWjR4S202WERaYmlmWjh0dmRvVVpMbHUwdG1FcDZs?=
 =?utf-8?B?ZHlSQnB2ZU12NDAxL3BmM0RDT0phbG1tTkZKZG9rWU1kcGJ6OEdNR0VJdWNh?=
 =?utf-8?B?WGJRbnFmSVZEbnoyNEZnc1kxLyt4aDdyR0xQcWUvVmdoMWtpSEdzSGlSVzBO?=
 =?utf-8?B?ME1ESk5EYjBWWmN1N3JPWDBQTTNvTitKVUF4eWFQb0lYdzlacjBvS3dWVUFy?=
 =?utf-8?B?WDd6amdqVzhaWTdhNm11K3RobUdmRHFaRzlEUHR4L3k3UlRJQ05HWUlrVk1y?=
 =?utf-8?B?UEIyR1BIMnphNUlnNUYrUG5RWXlBNEY0MW1NR1BLNnJXK2FEZGRWK0J0dXVz?=
 =?utf-8?B?TWhEWVErVHMyRjRuRXM0UXFaZlQxR1VueGUraFVVd3V1WHh2Ylo1TU54RzAz?=
 =?utf-8?B?b0VEaU5hWlBQOVdwMkFPUTBvOVBaOUw3aHR5VUdyZFZGMTMxUHdKd3k1emRB?=
 =?utf-8?B?Q1BIb3VjSit6aklRWnhjYk9WeHZ2ZU1pd0Z4aWtHcGZiRTRGVW8rYnQ3M0Zj?=
 =?utf-8?B?THpzOG0vL1JDTWYyUjlyU2NIVWkrSFk3WUNFeUx5cTFBZEdvaTk3U1QyZnJ1?=
 =?utf-8?B?Y0dadzVmNUg4QUw5UkFOa2xCU2FzcnBCMFlFOXMrK3poRDZibkZKZW5uVHJv?=
 =?utf-8?B?ZjVwdlAwaE11ekNIWTNyaGFsckFoVmRUOUhLRUFNOTh3WjJjdmM2LzFMaHov?=
 =?utf-8?B?b09kaitrL1dFNldaa0Z6SjQ5eFV1Vkwza2Fra29BdnR1SkVSaS9CczhzTWt2?=
 =?utf-8?B?RHdvQlArMEFlNCtscE91STBicU80ZnhVWTNFTjhIOTU4R04wa3Vha00zSVQr?=
 =?utf-8?B?Qy9aUys5dWFhSTRCNzQ3ZUFXRkVwSzZwZVZVaWE4bncyUHpMekt1U2NIZG9P?=
 =?utf-8?B?MFFJU2h0QmpBcTh6UWNMVE4yb0lSaHJnNUF2dVY2VWxsbUhKYWdaQ1dPU1lY?=
 =?utf-8?B?Vm5yZ2JDOXozSzZMU1BHTHRyamxVeEVuOHY5c0hDeTN6bWRGMVNCeVFWVmJC?=
 =?utf-8?B?OUs5bzVFRkVFSkxtZzIrQkdPSHFzaEpkbzNqYlI1MlVHaEJQWmZqMjdwY2pt?=
 =?utf-8?B?cklIdU40d1NIOFVDUEdKN2Job3RVNWFsREZ0M0pFdUxSKys3cEZWV2c1TUda?=
 =?utf-8?B?WGFEempUeXZCUWlzMWFPbkhsdTB3OFpMUkM3OVA0TGYxajJWNmk4TVMzbDUr?=
 =?utf-8?B?bWh3M0YzY1BsaElUU0VIRDU1TDA5cUNKbnU3dktGT0hhdDBHUkRVK3h4RFZU?=
 =?utf-8?B?SHFIamZQdlJaTHJMQVFGNUEvc05hZ3JpWHlkaG1iZ1RLMzdLYjdTNUp0VHRi?=
 =?utf-8?B?b21FUHJubDk2SDcrdzN4T0NGdFdLQjJMcGlXWWNLUjl1Ung1UEJLTitLNW0x?=
 =?utf-8?Q?edjxCCgghmc/cwNw4UuyHD0p6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e5907-4cd4-41cf-3147-08dce9019fbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:00:36.6146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhcEJAkxMbVgioR7uYl7IuMZxfPUZbDPbZGofQYuC3UqYMxF5o+GH1N5551BNHGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561
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

--------------ou6ZK8ZwbbGQVFzgjU2PPY8i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 09.10.24 um 16:17 schrieb Thomas Hellström:
> On Wed, 2024-10-09 at 15:39 +0200, Thomas Hellström wrote:
>> On Mon, 2024-10-07 at 11:08 +0200, Christian König wrote:
>>> Hi Thomas,
>>>
>>> I'm on sick leave, but I will try to answer questions and share
>>> some
>>> thoughts on this to unblock you.
>>>
>>> Am 18.09.24 um 14:57 schrieb Thomas Hellström:
>>>> Sima, Christian
>>>>
>>>> I've updated the shrinker series now with a guarded for_each
>>>> macro
>>>> instead:
>>>>
>>>> https://patchwork.freedesktop.org/patch/614514/?series=131815&rev=9
>>> Yeah that looks like a big step in the right direction.
>>>
>>>> (Note I forgot to remove the export of the previous LRU walker).
>>>>
>>>>    so the midlayer argument is now not an issue anymore. The
>>>> cleanup.h
>>>> guard provides some additional protection against drivers exiting
>>>> the
>>>> LRU loop early.
>>>>
>>>> So remaining is the question whether the driver is allowed to
>>>> discard a
>>>> suggested bo to shrink from TTM.
>>>>
>>>> Arguments for:
>>>>
>>>> 1) Not allowing that would require teaching TTM about purgeable
>>>> objects.
>>> I think that is actually not correct. TTM already knows about
>>> purgeable
>>> objects.
>>>
>>> E.g. when TTM asks the driver what to do with evicted objects it is
>>> perfectly valid to return an empty placement list indicating that
>>> the
>>> backing store can just be thrown away.
>>>
>>> We use this for things like temporary buffers for example.
>>>
>>> That this doesn't apply to swapping looks like a design bug in the
>>> driver/TTM interface to me.
>> Yes we can do that with TTM, but for shrinking there's no point in
>> trying to shrink when there is no swap-space left, other than
>> purgeable
>> object. The number of shrinkable objects returned in shrinker::count
>> needs to reflect that, and *then* only those objects should be
>> selected
>> for shrinking. If we were to announce that to TTM using a callback,
>> we're actually back to version 1 of this series which was rejected by
>> you exactly since it was using callbacks a year or so ago????

Yeah that indeed doesn't sound like a good idea.

On the other hand the decision that only purgeable objects should be 
selected when there is no swap space left sounds like something TTM 
should do and not the driver.

>>>> 2) Devices who need the blitter during shrinking would want to
>>>> punt
>>>> runtime_pm_get() to kswapd to avoid sleeping direct reclaim.
>>> I think the outcome of the discussion is that runtime PM should
>>> never
>>> be
>>> mixed into TTM swapping.
>>>
>>> You can power up blocks to enable a HW blitter for swapping, but
>>> this
>>> then can't be driven by the runtime PM framework.
>> Still that power-on might be sleeping, so what's the difference using
>> runtime-pm or not? Why should the driver implement yet another power
>> interface, just because TTM refuses to publish a sane LRU walk
>> interface?

See the discussion with Sima around the PM functions.

My understanding might be wrong, but I now think that with local memory 
you can't do the i915 approach where the PM functions are so low level 
that they can also be called inside the shrinker.

So you basically have PM functions for your whole device and PM 
functions for only the HW blocks necessary for the shrinker.

>>
>>>> 3) If those devices end up blitting (LNL) to be able to shrink,
>>>> they
>>>> would want to punt waiting for the fence to signal to kswapd to
>>>> avoid
>>>> waiting in direct reclaim.
>>> Mhm, what do you mean with that?
>> When we fired the blitter from direct reclaim, we get a fence. If we
>> wait for it in direct reclaim we will be sleeping waiting for gpu,
>> which is bad form. We'd like return a failure so the object is
>> retried
>> when idle, or from kswapd.

Oh, that is a really good point. So basically you want to avoid 
dependencies on the dma_fence.

>>>> 4) It looks like we need to resort to folio_trylock in the shmem
>>>> backup
>>>> backend when shrinking is called for gfp_t = GFP_NOFS. A failing
>>>> trylock will require a new bo.
>>> Why would a folio trylock succeed with one BO and not another?
>> Good point. We'd fail anyway but would perhaps need to call
>> SHRINK_STOP..
>>
>>> And why would that trylock something the device specific driver
>>> should
>>> handle?
>> It happens in the TTM shrinker helper called from the driver in the
>> spirit of demidlayering.
>>
>>>> Arguments against:
>>>> None really. I thought the idea of demidlayering would be to
>>>> allow
>>>> the
>>>> driver more freedom.
>>> Well that is a huge argument against it. Giving drivers more
>>> freedom
>>> is
>>> absolutely not something which turned out to be valuable in the
>>> past.
>> So then what's the point of demidlayering?

So that drivers can prepare the environment for TTM to work with instead 
of TTM asking for it.

In your case for example that means powering up HW blocks so that BOs 
could be moved.

>>> Instead we should put device drivers in a very strict corset of
>>> validated approaches to do things.
>>>
>>> Background is that in my experience driver developers are perfectly
>>> willing to do unclean approaches which only work in like 99% of all
>>> cases just to get a bit more performance or simpler driver
>>> implementation.
>>>
>>> Those approaches are not legal and in my opinion as subsystem
>>> maintainer
>>> I think we need to be more strict and push back much harder on
>>> stuff
>>> like that.
>> Still, historically that has made developers abandon common
>> components
>> for driver-specific solutions.
>>
>> And the question is still not answered.
>>
>> Exactly *why* can't the driver fail and continue traversing the LRU,
>> because all our argumentation revolves around this and you have yet
>> to
>> provide an objective reason why.
> And in the end, while I think there definitely things worthy of
> discussion in this series,
>
> I don't think there is a point in trying to land a LNL shrinker
> operating against a crippled TTM LRU walk interface, nor do I think
> anyone would want to attempt to port i915 over, and reworking it three
> times I'm now pretty familiar with what works and what doesn't.
>
> So question becomes, with proper reviews can I merge the series here as
> is, *with* the de-midlayered LRU walk and noting your advise against
> it, or not?

More or less yes, I still have a bad feeling about it but we probably 
need to see the whole thing getting used to judge if it really works or not.

I mean it's not UAPI we are talking about, so even if we find in 5years 
from now that it was a bad idea we can still roll it back and try 
something else.

So yeah, feel free to go ahead.

Regards,
Christian.


>
> Thanks,
> Thomas
>
>
>
>
>
>> /Thomas
>>
>>
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> So any feedback appreciated. If that is found acceptable we can
>>>> proceed
>>>> with reviewing this patch and also with the shrinker series.
>>>>
>>>> Thanks,
>>>> Thomas
>>>>
>>>>
>>>> On Mon, 2024-09-02 at 13:07 +0200, Daniel Vetter wrote:
>>>>> On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian König
>>>>> wrote:
>>>>>> Am 27.08.24 um 19:53 schrieb Daniel Vetter:
>>>>>>> On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter
>>>>>>> wrote:
>>>>>>>> On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König
>>>>>>>> wrote:
>>>>>>>>> Completely agree that this is complicated, but I still
>>>>>>>>> don't
>>>>>>>>> see the need
>>>>>>>>> for it.
>>>>>>>>>
>>>>>>>>> Drivers just need to use pm_runtime_get_if_in_use()
>>>>>>>>> inside
>>>>>>>>> the shrinker and
>>>>>>>>> postpone all hw activity until resume.
>>>>>>>> Not good enough, at least long term I think. Also
>>>>>>>> postponing hw
>>>>>>>> activity
>>>>>>>> to resume doesn't solve the deadlock issue, if you still
>>>>>>>> need
>>>>>>>> to grab ttm
>>>>>>>> locks on resume.
>>>>>>> Pondered this specific aspect some more, and I think you
>>>>>>> still
>>>>>>> have a race
>>>>>>> here (even if you avoid the deadlock): If the condiditional
>>>>>>> rpm_get call
>>>>>>> fails there's no guarantee that the device will
>>>>>>> suspend/resume
>>>>>>> and clean
>>>>>>> up the GART mapping.
>>>>>> Well I think we have a major disconnect here. When the device
>>>>>> is
>>>>>> powered
>>>>>> down there is no GART mapping to clean up any more.
>>>>>>
>>>>>> In other words GART is a table in local memory (VRAM) when
>>>>>> the
>>>>>> device is
>>>>>> powered down this table is completely destroyed. Any BO which
>>>>>> was
>>>>>> mapped
>>>>>> inside this table is now not mapped any more.
>>>>>>
>>>>>> So when the shrinker wants to evict a BO which is marked as
>>>>>> mapped
>>>>>> to GART
>>>>>> and the device is powered down we just skip the GART
>>>>>> unmapping
>>>>>> part
>>>>>> because
>>>>>> that has already implicitly happened during power down.
>>>>>>
>>>>>> Before mapping any BO into the GART again we power the GPU up
>>>>>> through the
>>>>>> runtime PM calls. And while powering it up again the GART is
>>>>>> restored.
>>>>> My point is that you can't tell whether the device will power
>>>>> down or
>>>>> not,
>>>>> you can only tell whether there's a chance it might be powering
>>>>> down
>>>>> and
>>>>> so you can't get at the rpm reference without deadlock issues.
>>>>>
>>>>>>> The race gets a bit smaller if you use
>>>>>>> pm_runtime_get_if_active(), but even then you might catch
>>>>>>> it
>>>>>>> right when
>>>>>>> resume almost finished.
>>>>>> What race are you talking about?
>>>>>>
>>>>>> The worst thing which could happen is that we restore a GART
>>>>>> entry
>>>>>> which
>>>>>> isn't needed any more, but that is pretty much irrelevant
>>>>>> since
>>>>>> we
>>>>>> only
>>>>>> clear them to avoid some hw bugs.
>>>>> The race I'm seeing is where you thought the GART entry is not
>>>>> issue,
>>>>> tossed an object, but the device didn't suspend, so might still
>>>>> use
>>>>> it.
>>>>>
>>>>> I guess if we're clearly separating the sw allocation of the
>>>>> TTM_TT
>>>>> with
>>>>> the physical entries in the GART that should all work, but
>>>>> feels
>>>>> a
>>>>> bit
>>>>> tricky. The race I've seen is essentially these two getting out
>>>>> of
>>>>> sync.
>>>>>
>>>>> So maybe it was me who's stuck.
>>>>>
>>>>> What I wonder is whether it works in practice, since on the
>>>>> restore
>>>>> side
>>>>> you need to get some locks to figure out which gart mappings
>>>>> exist
>>>>> and
>>>>> need restoring. And that's the same locks as the shrinker needs
>>>>> to
>>>>> figure
>>>>> out whether it might need to reap a gart mapping.
>>>>>
>>>>> Or do you just copy the gart entries over and restore them
>>>>> exactly
>>>>> as-is,
>>>>> so that there's no shared locks?
>>>>>
>>>>>>> That means we'll have ttm bo hanging around with GART
>>>>>>> allocations/mappings
>>>>>>> which aren't actually valid anymore (since they might
>>>>>>> escape
>>>>>>> the
>>>>>>> cleanup
>>>>>>> upon resume due to the race). That doesn't feel like a
>>>>>>> solid
>>>>>>> design
>>>>>>> either.
>>>>>> I'm most likely missing something, but I'm really scratching
>>>>>> my
>>>>>> head where
>>>>>> you see a problem here.
>>>>> I guess one issue is that at least traditionally, igfx drivers
>>>>> have
>>>>> nested
>>>>> runtime pm within dma_resv lock. And dgpu drivers the other way
>>>>> round.
>>>>> Which is a bit awkward if you're trying for common code.
>>>>>
>>>>> Cheers, Sima

--------------ou6ZK8ZwbbGQVFzgjU2PPY8i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 09.10.24 um 16:17 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2024-10-09 at 15:39 +0200, Thomas Hellström wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Mon, 2024-10-07 at 11:08 +0200, Christian König wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Thomas,

I'm on sick leave, but I will try to answer questions and share
some 
thoughts on this to unblock you.

Am 18.09.24 um 14:57 schrieb Thomas Hellström:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Sima, Christian

I've updated the shrinker series now with a guarded for_each
macro
instead:

<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/614514/?series=131815&amp;rev=9">https://patchwork.freedesktop.org/patch/614514/?series=131815&amp;rev=9</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yeah that looks like a big step in the right direction.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">(Note I forgot to remove the export of the previous LRU walker).

&nbsp; so the midlayer argument is now not an issue anymore. The
cleanup.h
guard provides some additional protection against drivers exiting
the
LRU loop early.

So remaining is the question whether the driver is allowed to
discard a
suggested bo to shrink from TTM.

Arguments for:

1) Not allowing that would require teaching TTM about purgeable
objects.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I think that is actually not correct. TTM already knows about
purgeable 
objects.

E.g. when TTM asks the driver what to do with evicted objects it is
perfectly valid to return an empty placement list indicating that
the
backing store can just be thrown away.

We use this for things like temporary buffers for example.

That this doesn't apply to swapping looks like a design bug in the 
driver/TTM interface to me.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes we can do that with TTM, but for shrinking there's no point in
trying to shrink when there is no swap-space left, other than
purgeable
object. The number of shrinkable objects returned in shrinker::count
needs to reflect that, and *then* only those objects should be
selected
for shrinking. If we were to announce that to TTM using a callback,
we're actually back to version 1 of this series which was rejected by
you exactly since it was using callbacks a year or so ago????</pre>
      </blockquote>
    </blockquote>
    <br>
    Yeah that indeed doesn't sound like a good idea.<br>
    <br>
    On the other hand the decision that only purgeable objects should be
    selected when there is no swap space left sounds like something TTM
    should do and not the driver.<br>
    <br>
    <blockquote type="cite" cite="mid:ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">2) Devices who need the blitter during shrinking would want to
punt
runtime_pm_get() to kswapd to avoid sleeping direct reclaim.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I think the outcome of the discussion is that runtime PM should
never
be 
mixed into TTM swapping.

You can power up blocks to enable a HW blitter for swapping, but
this
then can't be driven by the runtime PM framework.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Still that power-on might be sleeping, so what's the difference using
runtime-pm or not? Why should the driver implement yet another power
interface, just because TTM refuses to publish a sane LRU walk
interface?</pre>
      </blockquote>
    </blockquote>
    <br>
    See the discussion with Sima around the PM functions.<br>
    <br>
    My understanding might be wrong, but I now think that with local
    memory you can't do the i915 approach where the PM functions are so
    low level that they can also be called inside the shrinker.<br>
    <br>
    So you basically have PM functions for your whole device and PM
    functions for only the HW blocks necessary for the shrinker.<br>
    <br>
    <blockquote type="cite" cite="mid:ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">3) If those devices end up blitting (LNL) to be able to shrink,
they
would want to punt waiting for the fence to signal to kswapd to
avoid
waiting in direct reclaim.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Mhm, what do you mean with that?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
When we fired the blitter from direct reclaim, we get a fence. If we
wait for it in direct reclaim we will be sleeping waiting for gpu,
which is bad form. We'd like return a failure so the object is
retried
when idle, or from kswapd.</pre>
      </blockquote>
    </blockquote>
    <br>
    Oh, that is a really good point. So basically you want to avoid
    dependencies on the dma_fence.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">4) It looks like we need to resort to folio_trylock in the shmem
backup
backend when shrinking is called for gfp_t = GFP_NOFS. A failing
trylock will require a new bo.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Why would a folio trylock succeed with one BO and not another?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good point. We'd fail anyway but would perhaps need to call
SHRINK_STOP..

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
And why would that trylock something the device specific driver
should 
handle?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
It happens in the TTM shrinker helper called from the driver in the
spirit of demidlayering.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Arguments against:
None really. I thought the idea of demidlayering would be to
allow
the
driver more freedom.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Well that is a huge argument against it. Giving drivers more
freedom
is 
absolutely not something which turned out to be valuable in the
past.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
So then what's the point of demidlayering?</pre>
      </blockquote>
    </blockquote>
    <br>
    So that drivers can prepare the environment for TTM to work with
    instead of TTM asking for it.<br>
    <br>
    In your case for example that means powering up HW blocks so that
    BOs could be moved.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Instead we should put device drivers in a very strict corset of 
validated approaches to do things.

Background is that in my experience driver developers are perfectly
willing to do unclean approaches which only work in like 99% of all
cases just to get a bit more performance or simpler driver
implementation.

Those approaches are not legal and in my opinion as subsystem
maintainer 
I think we need to be more strict and push back much harder on
stuff 
like that.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Still, historically that has made developers abandon common
components
for driver-specific solutions. 

And the question is still not answered.

Exactly *why* can't the driver fail and continue traversing the LRU,
because all our argumentation revolves around this and you have yet
to
provide an objective reason why. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And in the end, while I think there definitely things worthy of
discussion in this series,&nbsp;

I don't think there is a point in trying to land a LNL shrinker
operating against a crippled TTM LRU walk interface, nor do I think
anyone would want to attempt to port i915 over, and reworking it three
times I'm now pretty familiar with what works and what doesn't.

So question becomes, with proper reviews can I merge the series here as
is, *with* the de-midlayered LRU walk and noting your advise against
it, or not?</pre>
    </blockquote>
    <br>
    More or less yes, I still have a bad feeling about it but we
    probably need to see the whole thing getting used to judge if it
    really works or not.<br>
    <br>
    I mean it's not UAPI we are talking about, so even if we find in
    5years from now that it was a bad idea we can still roll it back and
    try something else.<br>
    <br>
    So yeah, feel free to go ahead.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:ff1d2e900d66664bd2ee6d29955ed7a858c0e44d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Thomas





</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
/Thomas




</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
So any feedback appreciated. If that is found acceptable we can
proceed
with reviewing this patch and also with the shrinker series.

Thanks,
Thomas


On Mon, 2024-09-02 at 13:07 +0200, Daniel Vetter wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Wed, Aug 28, 2024 at 02:20:34PM +0200, Christian König
wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Am 27.08.24 um 19:53 schrieb Daniel Vetter:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">On Tue, Aug 27, 2024 at 06:52:13PM +0200, Daniel Vetter
wrote:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">On Thu, Aug 22, 2024 at 03:19:29PM +0200, Christian König
wrote:
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Completely agree that this is complicated, but I still
don't
see the need
for it.

Drivers just need to use pm_runtime_get_if_in_use()
inside
the shrinker and
postpone all hw activity until resume.
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Not good enough, at least long term I think. Also
postponing hw
activity
to resume doesn't solve the deadlock issue, if you still
need
to grab ttm
locks on resume.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">Pondered this specific aspect some more, and I think you
still
have a race
here (even if you avoid the deadlock): If the condiditional
rpm_get call
fails there's no guarantee that the device will
suspend/resume
and clean
up the GART mapping.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Well I think we have a major disconnect here. When the device
is
powered
down there is no GART mapping to clean up any more.

In other words GART is a table in local memory (VRAM) when
the
device is
powered down this table is completely destroyed. Any BO which
was
mapped
inside this table is now not mapped any more.

So when the shrinker wants to evict a BO which is marked as
mapped
to GART
and the device is powered down we just skip the GART
unmapping
part
because
that has already implicitly happened during power down.

Before mapping any BO into the GART again we power the GPU up
through the
runtime PM calls. And while powering it up again the GART is
restored.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">My point is that you can't tell whether the device will power
down or
not,
you can only tell whether there's a chance it might be powering
down
and
so you can't get at the rpm reference without deadlock issues.

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">The race gets a bit smaller if you use
pm_runtime_get_if_active(), but even then you might catch
it
right when
resume almost finished.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">What race are you talking about?

The worst thing which could happen is that we restore a GART
entry
which
isn't needed any more, but that is pretty much irrelevant
since
we
only
clear them to avoid some hw bugs.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">The race I'm seeing is where you thought the GART entry is not
issue,
tossed an object, but the device didn't suspend, so might still
use
it.

I guess if we're clearly separating the sw allocation of the
TTM_TT
with
the physical entries in the GART that should all work, but
feels
a
bit
tricky. The race I've seen is essentially these two getting out
of
sync.

So maybe it was me who's stuck.

What I wonder is whether it works in practice, since on the
restore
side
you need to get some locks to figure out which gart mappings
exist
and
need restoring. And that's the same locks as the shrinker needs
to
figure
out whether it might need to reap a gart mapping.

Or do you just copy the gart entries over and restore them
exactly
as-is,
so that there's no shared locks?

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">That means we'll have ttm bo hanging around with GART
allocations/mappings
which aren't actually valid anymore (since they might
escape
the
cleanup
upon resume due to the race). That doesn't feel like a
solid
design
either.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I'm most likely missing something, but I'm really scratching
my
head where
you see a problem here.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I guess one issue is that at least traditionally, igfx drivers
have
nested
runtime pm within dma_resv lock. And dgpu drivers the other way
round.
Which is a bit awkward if you're trying for common code.

Cheers, Sima
</pre>
            </blockquote>
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

--------------ou6ZK8ZwbbGQVFzgjU2PPY8i--
