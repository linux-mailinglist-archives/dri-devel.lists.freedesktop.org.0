Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A002956EB3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C273810E2C4;
	Mon, 19 Aug 2024 15:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u5W1mOSG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B73510E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euYMA2bmUPcWQDOWCHoseWaVZzL7hFcnDmUZ1lWQnTdyY/iT6bUgzfm8i73t4aU7DjIjOVG7HeRfhTnTwk2OMYqruEarApadr3m1ks0yErzFtQ3tv1cocZ/p0870UnpAvaSQQvDBfICd4wXbaz5nJst4IFzaWplVXNQXoP6MeL2nlge0mlDqk/KQlQrJ9dZkS02GLAqOtJsmcTrp4KWu4enQUw0ZegYVhJDuxCWCrhLiof8giVER0MJD5fPeWTvFRvP2urqEZ2u23WzLhe6LOxQ6VbiOXzjwkP+ttt1FxjgUE4h8YhJFDc2V6D8Lk8qcMJ/sMl4/eHv5sP7qm4zbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCCysHkonwwfvgbPBX7PUq7zrR3Y01v+rHsl4M4yLjE=;
 b=sti/78Aa/yd9eQ/uwccjvSKUu0tKVMJQz+t40qSLtBjRPaN1SyJze4MoxGizFhoo5jR55os8GtnxkKdp7IDMtH9fa8q3Q7Qu6jgIvZCRqqxK5EViZ/jkGGP80QlUv2Bs87THkc2NvvtUuMz9EDpIJKPSqRm9N3ayz3gKH/MB7lGaRC/ZBCpIy8jwr39iYYaJHgG7MXb4dZHKahjypCFt3dJPEPAmzRLzLk5dkE+G50umDDrg/4GD+kimh1l9d/IgjKFAn1y0o70UOkmMpti2SJ0Ag8Cb6Bfl9SJVJ35A1xwjCjR1YmPibbo2H5XVcVgQts+GivieR6OIQNRqZPeq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCCysHkonwwfvgbPBX7PUq7zrR3Y01v+rHsl4M4yLjE=;
 b=u5W1mOSGoDEm97mBZOTnfG9W02rCQOZnY4AhgWfob05ohxwl/aovTyO3Z6W3tGYWBVfPHF0yuOigyaKZMWH3qCpp0KgKHBYd8WflJU/cifoJ6CzS9W0Yaeue1Wg6ajBmcGr24B4L6Kqh0PM9FqqhH5w3iNudIQwMSEZfTFY829k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.23; Mon, 19 Aug 2024 15:26:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 15:26:29 +0000
Content-Type: multipart/alternative;
 boundary="------------pQPGCrkKpOq0VONXlsrYQK0M"
Message-ID: <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
Date: Mon, 19 Aug 2024 17:26:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
X-ClientProxiedBy: FR4P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc06cf0-d0f9-4f2e-a41a-08dcc0634c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlBBaG5NN2JMa284cTl5UExUc0tEb0Ewd3p5UXVRUTlIWWpMcVYzV2dya1Uw?=
 =?utf-8?B?SzkxcHVnQ2V4RG1Id2J2TU4xL091ZWg5ekdZZWtFNlBLOXY1OGRSc1NGcmRM?=
 =?utf-8?B?dElIa3lkK2dzMTVKTFViQ1Q0U1FHRHZCdDl3T1FoSytkTjNLd2laRHN3bDBx?=
 =?utf-8?B?U3BJaXNubjNCNXRoL1N1TDl4dUpndVNraDhTakVCbWhOcHZNaERRUTRQekVK?=
 =?utf-8?B?VUErblRtS3p6N1ViTkYrVWZjNTN5Rmt3dzFXTm93U1dUOWF6Y2hrdHRWNzF2?=
 =?utf-8?B?Wit6RnhyWEVhV3pucjhaTVdWY3ZVTWl5RXAyaHJBZmZsUmltMXFDOUR2SFRt?=
 =?utf-8?B?cmtVMEVZVURhb3JvZWpqZU1VNUJQdVVENC9rV0FrMkZ1ajcvZjBOZVhEd3hK?=
 =?utf-8?B?L0NsaGxFN1c0K2puUFhOYnJ2WkErR1BEdWhTUnVSaFc5dEpwNWVjMlNXMGRN?=
 =?utf-8?B?QndNZWdnRXAvOXFKRXlneTU2MTdQWWtQMmNneDVzZERsRnRmOW5YOEVuRkp6?=
 =?utf-8?B?cm1rVzJLSms2eTA4aksxMUhTRlpzWHRna2VVOFFIYzF1UklGZmlMUktlSzRh?=
 =?utf-8?B?djdOM1Z6bVR5VzQwZU9tT0NJcUtxbVlOdERLLzl4V2VnKzZDejBZYkU4OXFk?=
 =?utf-8?B?QlFKb3dROUx0OWFHUTA1L09uZUhFcGx0UmlNdXNIc0JydFdLRzdsc1ViWW14?=
 =?utf-8?B?QkRkTTNNVVRqWlFKM1ZhZGt1cTI1bmdTQWdlblRhOHRTUTU5MytGMXJZbGxN?=
 =?utf-8?B?R3N4STdTNmxDTVJLSTlJT0svajVpUXgyRzFGM2dGZ0xac2NHaXUyZWVBWGJk?=
 =?utf-8?B?RzFJVXhCbjJQT2drMVhCWXZYMGFQTFp3cytSNTEwMzZmc3RvNTNsNnZyenVl?=
 =?utf-8?B?UEtPOTd3eUM5eDJXbTRDMjFUS3MwanVQOWlLeFdyYW9PT09NT0IvRkFYTTYr?=
 =?utf-8?B?bmNUMGZSdXo2WHp2OWZpZG5TZUthUy9IR1l0VGhYYmJzYzROMjhmNkUzUjJM?=
 =?utf-8?B?R25FQzRUOWk5R0piajM1SEhueEhZVHJROGxMdm9HZ0tGaEFENXBvSnlDT0cz?=
 =?utf-8?B?RE10cWh6OWxnRTJobjQ5dm9IeGJ1RDhtbi9OT3N6Z0Z2S1NHc25vRmlVSUgx?=
 =?utf-8?B?WXpERjAyeGh6NjFwUCtWUmgzVEl4TnJhQnVoYTRQS3lOWllKbGdjRDh3QTJX?=
 =?utf-8?B?QU9aUGhvS0FUSnRjTVNvNVcvc2xnNjFiSk1PUDVwVzIvYXNobVVCQVZBdnEv?=
 =?utf-8?B?WFpRWGVnK3Jia0JvRE9iVzMwdlN1TCt3U2J1NVJKamxPMXNUdEVzRzZ3dnRR?=
 =?utf-8?B?ZmlzRW91WUZ2RjJhUUlLck5XelBXZVZZbjFNNkVEdTc1M1lWdGIxR0J1QkhG?=
 =?utf-8?B?RDdMc1ZUN1dXRGFQd3JDVkFYSHIxVHVkU3ZmdDBSRUlFTDdpeUtaa1NDNkI0?=
 =?utf-8?B?Q2ZKZUtxcVBCWmFmUndna1paM0pBaFc5bU5pdW5QU2YzM2RIWFBPQ0hsQzI5?=
 =?utf-8?B?ajJEaWJEdUZKTllwTkNqZGIvSEFILzhNclNIaUpuWFIxTXFSb0w3V2djNlFi?=
 =?utf-8?B?TFQ0OW1DajBXd0Y2V0FyY2h4UUNHT2g1MlpQelBBQUxGZ0JCa2gzQ3RKM0E5?=
 =?utf-8?B?Vlo1YTdCTWVBVlBMUVVraEpuOE1iMlhmdlpxTXV1QVlZN3BRNFU0dW1JLzl4?=
 =?utf-8?B?VnFMSlBIME9kMlVZdWZVditBcFRxU3R2TjFqMWdNK21nLzZJQi9LcmZGVVhP?=
 =?utf-8?Q?IVmrA0DOeS6eEMR4Iw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkRRa2xSN3hJZlZPRm1pb250ZnZ3WUh0dUdBTmZtVXZBRVVxMzkvd0k3dWhV?=
 =?utf-8?B?a3pXNHdxM0pDTzZpL1ROTzFoRG9uVmc3WjZvaHdrb1FDSzJwVDdCQlFuT3Ew?=
 =?utf-8?B?RlpYa0lqU3BQTEF4bVlLUTAyaHJIOWtnZ2cxUkpKQTZtUDh1ekVoVmR2OHVV?=
 =?utf-8?B?ZDNOWjBkNkp1ZXZNMFphUnNaTVJ3bFdWaWFDOWtRUFpYWGE0TjN0REJlUjhq?=
 =?utf-8?B?UW1pSlUrYy9uSnR6N2xSK3UzRzRNblhBWkFOTGd0amhkSVZ3WnFLemplVHVm?=
 =?utf-8?B?RTIrcXlJbmNnR1Z1MW8rRjluMFdhTFdseXNNbVpmVU9MOXE4cFkwNUlVTHNq?=
 =?utf-8?B?U3A4RDB3bTk4OVZJT3NzbVhuRjNETGhINVMzK0dxaG1Bc0FlV2tYZytvQld6?=
 =?utf-8?B?M2ZhTVlkVVk5WlArUGFNL2I4N3RCR2V4WjJRamRsVDlOek1sOEREWlNVblBM?=
 =?utf-8?B?K2ZISURtYW9oTE0zT0QrMU55akMySGNCell3VHY2NVBMLzczNEZwM05VWENW?=
 =?utf-8?B?ZUkzZ1VLeGhqWnRMVHQyRUJCL2N2QmpOamt2TVpSQzArNklFOGFLWmN5TWo4?=
 =?utf-8?B?ejNwT2R6dDhuQjZydlljbkt5RE8yS2d1NUxWVDNmZHJ0VGVyTnpqSGc1dlky?=
 =?utf-8?B?WHVPK0VaL2E1ekRnTml5Qk5Fb2RZRmEzN3hvM0dQdlcrRVA4N01FM3hJQUpD?=
 =?utf-8?B?WWtUMjd5VG5GaXBwbUNEV3JGRVNmNFl4dmo5alBHWXdIbXBXSG5ScE81Zmds?=
 =?utf-8?B?RVVjL0VzMmU3SHdqd2E4OTVWK2hscnpvMnFwMi8xQ0Vnb0NmMzBSbXU2MXVv?=
 =?utf-8?B?bXU5MzlCcHhmcnZBQzFLNVdiWUNSN21XWE0vSGZJbkt1emdxR0VPa3kreElZ?=
 =?utf-8?B?TVFsMWhVb2FPZFAyUElJYlJrbG9wTEVONzhRQStXUHpRek9GUmVpQ001SUpp?=
 =?utf-8?B?QWdUL2F4L3JLRnZvRDRtOHNGRlNxZWg5Y2g2WDlZVW1laEgzYldMcERIWW9Z?=
 =?utf-8?B?TTljTVZncU0xK090ZkwzN05HMmdXZWdMZVNkQ1Y2c1ZRQy9va2tHT2phYm85?=
 =?utf-8?B?cHNkWXQ1TTY3TW1JM04veExOM2RwYmNoRnFyWXpVM0ZVV0R6VnorWVhQZ3RO?=
 =?utf-8?B?SzJwc1FLM3IrNnF2NGFvUyswb0FTRUlaV3pLVXVDUzgwVFpmVFd2RXNROWNV?=
 =?utf-8?B?Wm5oc3RiYkxEdTVscVpkNC9COThicUxvYm1UQS9SM29pNStJc1dKU1QrZldB?=
 =?utf-8?B?ektIaFlneUNEekhSdTJWQ3VRRTMvU1FZOS9DNFlLTzdzQ0ZuQ3h3MHdKT3N1?=
 =?utf-8?B?Y2UzY2tLOXhiMEV2L2RtTlZISGhFSDlwV2dXSU1CSWZONUJPaS9RVmQra3p2?=
 =?utf-8?B?Ym1LSEgxVGp5OVdIeENYSlhDMGpVWmZSNzZyc3lQN0pQYUFUckdxMjdyUklP?=
 =?utf-8?B?KzhtTGFOSW05VkowVXQydkphMFlqRVFiUXVJUHZvQWFIdS9KRVRHOGFNZHdm?=
 =?utf-8?B?YVRhU1djaDFOLzdxL2xlSkJkaEQxeGZWaEMrQzg4MWs0TUxVSUt0ekxDdkZQ?=
 =?utf-8?B?OVJCdmx0R0FhQzRVSWY3eVozNVAwWWtVTnVDdWFEcSthTzdSNXFPUWJPZ3Fs?=
 =?utf-8?B?dGVkUVZKVDhJM3JxQlhBWXFzTS9LalVlbjZTK3JiNmZFV1RERmd4bTdKV21o?=
 =?utf-8?B?N3haUnlSdzQrRWRFUVNNNHlnR3VWY0hHLzBSaFp2SmNpNmQxeVgzcUJoeUNP?=
 =?utf-8?B?b3V4cGlZZEhFcHR3dG8vemtEUG5pVS9CNUNjYzBWZWtINkM3N01ORk8wb2tO?=
 =?utf-8?B?U0VSbnplNDhFdzE3ZVdWaWk5eW9mc2xmVlZSYVp1TlRCZHlOY0NiN2MxUjFi?=
 =?utf-8?B?YW12aEdoRlpMMExRczVWRllNbHJScFVxM3A0aWhCbUZRL3QyeHZzQk5PZGhj?=
 =?utf-8?B?ZDNtd2FUZE9uMVJIcmJ4QlFEb05Ha3ZzR1ErcW9TTzJKcTYxNjlLUlBzZlRz?=
 =?utf-8?B?VE5FME5sR3BNMndETW15LzlPcEF6K1RYeVJiQ1ovTi8xOHlEaGhKK1FISVZz?=
 =?utf-8?B?QWFqY2xobFdDdE56b0c4bGVGdTVkTkgyVGlyN25oby9yOWZpcWZZQlNzR2JX?=
 =?utf-8?Q?Soz7efdUuOXTtrS94mgyUfMhz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc06cf0-d0f9-4f2e-a41a-08dcc0634c5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 15:26:29.6303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBBkSdQP1/dKW3I66HcQ0U4dC1v1j3/M0BC1Xi6CfYeR6A9eAQeNj34yMTrkga2c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144
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

--------------pQPGCrkKpOq0VONXlsrYQK0M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 19.08.24 um 16:14 schrieb Daniel Vetter:
> On Mon, Aug 19, 2024 at 01:38:56PM +0200, Thomas Hellström wrote:
>> Hi, Christian,
>>
>> On Mon, 2024-08-19 at 13:03 +0200, Christian König wrote:
>>> Am 06.08.24 um 10:29 schrieb Thomas Hellström:
>>>> Hi, Christian.
>>>>
>>>> On Thu, 2024-07-11 at 14:01 +0200, Christian König wrote:
>>>>> Am 10.07.24 um 20:19 schrieb Matthew Brost:
>>>>>> On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König
>>>>>> wrote:
>>>>>>> That is something drivers really shouldn't mess with.
>>>>>>>
>>>>>> Thomas uses this in Xe to implement a shrinker [1]. Seems to
>>>>>> need
>>>>>> to
>>>>>> remain available for drivers.
>>>>> No, that is exactly what I try to prevent with that.
>>>>>
>>>>> This is an internally thing of TTM and drivers should never use
>>>>> it
>>>>> directly.
>>>> That driver-facing LRU walker is a direct response/solution to this
>>>> comment that you made in the first shrinker series:
>>>>
>>>> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>>> Ah, yeah that was about how we are should be avoiding middle layer
>>> design.
>>>
>>> But a function which returns the next candidate for eviction and a
>>> function which calls a callback for eviction is exactly the opposite.
>>>
>>>> That is also mentioned in the cover letter of the recent shrinker
>>>> series, and this walker has been around in that shrinker series for
>>>> more than half a year now so if you think it's not the correct
>>>> driver
>>>> facing API IMHO that should be addressed by a review comment in
>>>> that
>>>> series rather than in posting a conflicting patch?
>>> I actually outlined that in the review comments for the patch series.
>>> E.g. a walker function with a callback is basically a middle layer.
>>>
>>> What outlined in the link above is that a function which returns the
>>> next eviction candidate is a better approach than a callback.
>>>
>>>> So assuming that we still want the driver to register the shrinker,
>>>> IMO that helper abstracts away all the nasty locking and pitfalls
>>>> for a
>>>> driver-registered shrinker, and is similar in structure to for
>>>> example
>>>> the pagewalk helper in mm/pagewalk.c.
>>>>
>>>> An alternative that could be tried as a driver-facing API is to
>>>> provide
>>>> a for_each_bo_in_lru_lock() macro where the driver open-codes
>>>> "process_bo()" inside the for loop but I tried this and found it
>>>> quite
>>>> fragile since the driver might exit the loop without performing the
>>>> necessary cleanup.
>>> The point is that the shrinker should *never* need to have context.
>>> E.g.
>>> a walker which allows going over multiple BOs for eviction is exactly
>>> the wrong approach for that.
>>>
>>> The shrinker should evict always only exactly one BO and the next
>>> invocation of a shrinker should not depend on the result of the
>>> previous
>>> one.
>>>
>>> Or am I missing something vital here?
>> A couple of things,
>>
>> 1) I'd like to think of the middle-layer vs helper like the helper has
>> its own ops, and can be used optionally from the driver. IIRC, the
>> atomic modesetting / pageflip ops are implemented in exactly this way.
>>
>> Sometimes a certain loop operation can't be easily or at least robustly
>> implemented using a for_each_.. approach. Like for example
>> mm/pagewalk.c. In this shrinking case I think it's probably possible
>> using the scoped_guard() in cleanup.h. This way we could get rid of
>> this middle layer discussion by turning the interface inside-out:
>>
>> for_each_bo_on_lru_locked(xxx)
>> 	driver_shrink();
>>
>> But I do think the currently suggested approach is less fragile and
>> prone to driver error.
>>
>> FWIW in addition to the above examples, also drm_gem_lru_scan works
>> like this.
> a iteration state structure (like drm_connector_iter) plus then a macro
> for the common case that uses cleanup.h should get the job done.

Yeah, completely agree. It basically boils down to which one needs to 
pack a state bag.

In a mid-layer design it's the driver or the caller of functions, e.g. 
the much hated init callback in the DRM layer was a perfect example of that.

In a non mid-layer approach it's the framework or the called function, 
examples are how the fence iterators in the dma_resv or the 
drm_connector, plane etc.. work.

One big difference between the two approach is who and where things like 
preparation and cleanup are done, e.g. who takes locks for example.

>> 2) The shrinkers suggest to shrink a number of pages, not a single bo,
>> again drm_gem_lru_scan works like this. i915 works like this. I think
>> we should align with those.
> Yeah that's how shrinkers work, so if we demidlayer then it realls needs
> to be a loop in the driver, not a "here's the next bo to nuke" I think.

Hui? Well that's not how I understand shrinkers.

The shrinker gives you the maximum number of objects to scan and not how 
many pages to free. In return you give the actual number of objects to 
scanned and pages freed.

As far as I know the number of objects are in the sense of SLUBs or 
rather different LRU lists.

So for BO shrinking we should probably only free or rather unpin a 
single BO per callback otherwise we mess up the fairness between 
shrinkers in the MM layer.

>> 3) Even if we had a function to obtain the driver to shrink, the driver
>> needs to have its say about the suitability for shrinking, so a
>> callback is needed anyway (eviction_valuable).
>> In addition, if shrinking fails for some reason, what would stop that
>> function to return the same bo, again and again just like the problem
>> we previously had in TTM?
> Yeah I think if consensus moves back to drivers not looking at ttm lru
> directly, then that entire shrinker looping needs to be as some kind of
> midlayer in ttm itself. Otherwise I don't think it works, so agreeing with
> Thomas here.

Well, the idea was to get rid of callbacks like eviction_valuable.

So instead of TTM calling the driver asking if a BO is valuable to evict 
TTM provides the functionality to iterate over the possible candidates 
and the driver then says "oh yeah evict that one".

We probably can't do that fully, e.g. in case of contention on a 
resource we still need a callback to inform the driver and we also need 
a copy callback. But that's basically it.

>> So basically all the restartable LRU work was motivated by this use-
>> case in mind, so making that private I must say comes as a pretty major
>> surprise.
>>
>> I could have a look at the
>>
>> for_each_bo_on_lru_locked(xxx)
>> 	driver_shrink();
>>
>> approach, but having TTM just blindly return a single bo without
>> context will not work IMO.
> Another thing to keep in mind is that at least experience from really
> resource-starved igpu platforms says that cpu consumption for shrinking
> matters. So really need to not toss list walk state, and also at least
> from I think msm experience and maybe also i915 (i915-gem's a bit ... too
> complex to really understand it anymore) is that parallelism matters too.
> Eventually under memory pressures multiple cpu cores just aboslutely
> hammer the shrinkers, so being stuck on locks is no good.

Yeah that's basically the reason why I looked into this before as well.

Thomas implementation is actually pretty good at that because it only 
has the LRU spinlock as contented object and multiple CPUs can walk the 
LRU at the same time otherwise.

Regards,
Christian.

>
> But maybe let's get this off the ground first.
> -Sima

--------------pQPGCrkKpOq0VONXlsrYQK0M
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 19.08.24 um 16:14 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:ZsNTTCfBCpZNrSQH@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Mon, Aug 19, 2024 at 01:38:56PM +0200, Thomas Hellström wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi, Christian,

On Mon, 2024-08-19 at 13:03 +0200, Christian König wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Am 06.08.24 um 10:29 schrieb Thomas Hellström:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi, Christian.

On Thu, 2024-07-11 at 14:01 +0200, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 10.07.24 um 20:19 schrieb Matthew Brost:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian König
wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">That is something drivers really shouldn't mess with.

</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Thomas uses this in Xe to implement a shrinker [1]. Seems to
need
to
remain available for drivers.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">No, that is exactly what I try to prevent with that.

This is an internally thing of TTM and drivers should never use
it
directly.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">That driver-facing LRU walker is a direct response/solution to this
comment that you made in the first shrinker series:

<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9">https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Ah, yeah that was about how we are should be avoiding middle layer
design.

But a function which returns the next candidate for eviction and a 
function which calls a callback for eviction is exactly the opposite.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">That is also mentioned in the cover letter of the recent shrinker
series, and this walker has been around in that shrinker series for
more than half a year now so if you think it's not the correct
driver
facing API IMHO that should be addressed by a review comment in
that
series rather than in posting a conflicting patch?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I actually outlined that in the review comments for the patch series.
E.g. a walker function with a callback is basically a middle layer.

What outlined in the link above is that a function which returns the 
next eviction candidate is a better approach than a callback.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">So assuming that we still want the driver to register the shrinker,
IMO that helper abstracts away all the nasty locking and pitfalls
for a
driver-registered shrinker, and is similar in structure to for
example
the pagewalk helper in mm/pagewalk.c.

An alternative that could be tried as a driver-facing API is to
provide
a for_each_bo_in_lru_lock() macro where the driver open-codes
&quot;process_bo()&quot; inside the for loop but I tried this and found it
quite
fragile since the driver might exit the loop without performing the
necessary cleanup.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
The point is that the shrinker should *never* need to have context.
E.g. 
a walker which allows going over multiple BOs for eviction is exactly
the wrong approach for that.

The shrinker should evict always only exactly one BO and the next 
invocation of a shrinker should not depend on the result of the
previous 
one.

Or am I missing something vital here?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
A couple of things,

1) I'd like to think of the middle-layer vs helper like the helper has
its own ops, and can be used optionally from the driver. IIRC, the
atomic modesetting / pageflip ops are implemented in exactly this way.

Sometimes a certain loop operation can't be easily or at least robustly
implemented using a for_each_.. approach. Like for example
mm/pagewalk.c. In this shrinking case I think it's probably possible
using the scoped_guard() in cleanup.h. This way we could get rid of
this middle layer discussion by turning the interface inside-out:

for_each_bo_on_lru_locked(xxx)
	driver_shrink();

But I do think the currently suggested approach is less fragile and
prone to driver error.

FWIW in addition to the above examples, also drm_gem_lru_scan works
like this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
a iteration state structure (like drm_connector_iter) plus then a macro
for the common case that uses cleanup.h should get the job done.</pre>
    </blockquote>
    <br>
    Yeah, completely agree. It basically boils down to which one needs
    to pack a state bag.<br>
    <br>
    In a mid-layer design it's the driver or the caller of functions,
    e.g. the much hated init callback in the DRM layer was a perfect
    example of that.<br>
    <br>
    In a non mid-layer approach it's the framework or the called
    function, examples are how the fence iterators in the dma_resv or
    the drm_connector, plane etc.. work.<br>
    <br>
    One big difference between the two approach is who and where things
    like preparation and cleanup are done, e.g. who takes locks for
    example.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZsNTTCfBCpZNrSQH@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">2) The shrinkers suggest to shrink a number of pages, not a single bo,
again drm_gem_lru_scan works like this. i915 works like this. I think
we should align with those.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah that's how shrinkers work, so if we demidlayer then it realls needs
to be a loop in the driver, not a &quot;here's the next bo to nuke&quot; I think.</pre>
    </blockquote>
    <br>
    Hui? Well that's not how I understand shrinkers.<br>
    <br>
    The shrinker gives you the maximum number of objects to scan and not
    how many pages to free. In return you give the actual number of
    objects to scanned and pages freed.<br>
    <br>
    As far as I know the number of objects are in the sense of SLUBs or
    rather different LRU lists.<br>
    <br>
    So for BO shrinking we should probably only free or rather unpin a
    single BO per callback otherwise we mess up the fairness between
    shrinkers in the MM layer. <br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZsNTTCfBCpZNrSQH@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">3) Even if we had a function to obtain the driver to shrink, the driver
needs to have its say about the suitability for shrinking, so a
callback is needed anyway (eviction_valuable).
In addition, if shrinking fails for some reason, what would stop that
function to return the same bo, again and again just like the problem
we previously had in TTM?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah I think if consensus moves back to drivers not looking at ttm lru
directly, then that entire shrinker looping needs to be as some kind of
midlayer in ttm itself. Otherwise I don't think it works, so agreeing with
Thomas here.</pre>
    </blockquote>
    <br>
    Well, the idea was to get rid of callbacks like eviction_valuable.<br>
    <br>
    So instead of TTM calling the driver asking if a BO is valuable to
    evict TTM provides the functionality to iterate over the possible
    candidates and the driver then says &quot;oh yeah evict that one&quot;.<br>
    <br>
    We probably can't do that fully, e.g. in case of contention on a
    resource we still need a callback to inform the driver and we also
    need a copy callback. But that's basically it.<br>
    <br>
    <blockquote type="cite" cite="mid:ZsNTTCfBCpZNrSQH@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So basically all the restartable LRU work was motivated by this use-
case in mind, so making that private I must say comes as a pretty major
surprise.

I could have a look at the 

for_each_bo_on_lru_locked(xxx)
	driver_shrink();

approach, but having TTM just blindly return a single bo without
context will not work IMO.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Another thing to keep in mind is that at least experience from really
resource-starved igpu platforms says that cpu consumption for shrinking
matters. So really need to not toss list walk state, and also at least
from I think msm experience and maybe also i915 (i915-gem's a bit ... too
complex to really understand it anymore) is that parallelism matters too.
Eventually under memory pressures multiple cpu cores just aboslutely
hammer the shrinkers, so being stuck on locks is no good.</pre>
    </blockquote>
    <br>
    Yeah that's basically the reason why I looked into this before as
    well.<br>
    <br>
    Thomas implementation is actually pretty good at that because it
    only has the LRU spinlock as contented object and multiple CPUs can
    walk the LRU at the same time otherwise.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZsNTTCfBCpZNrSQH@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

But maybe let's get this off the ground first.
-Sima
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------pQPGCrkKpOq0VONXlsrYQK0M--
