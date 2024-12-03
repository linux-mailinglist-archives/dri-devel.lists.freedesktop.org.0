Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08439E1FFF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEFE10EA48;
	Tue,  3 Dec 2024 14:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FQc8g0Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A310EA44;
 Tue,  3 Dec 2024 14:52:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfC0skxLrgkIQHdEDpCUKhKlnpYakQOLtKVhzTUNQXtpBDHXqqM0zzYmt74EGqX738nqRXlPHT53PP+yewHE2yqkGBLEFmuanBk+gK/3qUX7o6QTfg5CnJzQVRaf0KmpiSmLJ/L7nwTwKK+6s1wxbI3L83cMP2WaqSufOezEi02iON00SpTpp/74cY/FFmczKCjo8Yt5eT8nU4Nd+BLWHphPK2br04fHUpYCrmogTmCC7OLV+23IRVp5upE4D21AViOHvoXroCuVTaQKn4Ae7usAG5lykwDDHujwuY7K4Zxd9OOzIJK5KM6erJB2/7MWO+/Hn8qlj64nMybYNyMGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbNlUgP5PbuSc2G/EopZKS6joxGEjBzGEI4/z3unbSg=;
 b=qCZp8Tdkgk40Lg7LHS6emKFhVM6wscOlRsP08t+Tb2emFg4DYuYqY8YTkofd94OK6fq0tMJoRG06JSa2SIqVo4Rs5MOtA4DL6c/EktrQDAjEE+4Pqsap39gEZM8Nkj40EQcch3MgJ+Kl3eCiT3x/phbfhJFCfHVxxvnG8BYxUUITEr1SVKgZmddsHjxqgN08JKgWP5+04rRFKgINtkaCBYMQ33RU+iJqy7zZ8AS6SQtn/S8+YKPhHxz7CpGmf6BOl57A4GZqBzGXlA/95FwF9WYtep1wtUkgh9sLXGrNR0NL79Mq7SeduIU3niysqYcgPyj40jm+QfYxsa9RogGCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbNlUgP5PbuSc2G/EopZKS6joxGEjBzGEI4/z3unbSg=;
 b=FQc8g0Hixbv7I81nc3e8lD9DaC7OpKCxMOa8AVVX3Jw1G3QsPSSOl4WJ+haAmdJsmF8AeDd5sg+qoKjYWEL0POtxpAiOfQFpGy9niLWlT/e5d8YsBHYoNpLHfadJhU1VCB0hE5LE9rnUkyFZ/e57J2wLqqjombyIBArHvveyc5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 14:51:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:51:56 +0000
Content-Type: multipart/alternative;
 boundary="------------KUkE7phiCBsOBg6pkvbjOkG0"
Message-ID: <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
Date: Tue, 3 Dec 2024 15:51:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: cb928c4b-c1a7-4bb7-942d-08dd13aa088b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0pEQ3A2cndQM3BVOVJ6bVRxY0VWRlk3aFZoZ0RUQWxoT0dHeks0bDdnQ21N?=
 =?utf-8?B?dWMyYkViOWpoN2N5czhkeGNOa2NZU0N1U1EyOHFaUEMxK2FyczBYb1I5MUwy?=
 =?utf-8?B?RUdkTkl3bDMwcytxSEpLVlM4dElDOVRYU003UEpVOWFtbWJpU2hEeTZsNE90?=
 =?utf-8?B?RU1ybTQzaVc2WnFKbkRKWVdkeEhwQWRuczJ3R1RFaHNkd0U4Ty90MDQ5enpz?=
 =?utf-8?B?aEhsODBWRlZESXY1Mkg3ZC9aaDQ5TFp6SUMrQk9ycDQyd0FDSzhvQ0NyaC9D?=
 =?utf-8?B?SVE3WEtxWVhuc0M3VmMzWUhRQlJlVWdFYmszRmczWnlmdW92VVdqSjlzYjVI?=
 =?utf-8?B?cERwL2RYUmF0MVYrd3FlZU1pNGNKd3dnaEZUU3UrZEVxemxxQVl5MzFDMlB3?=
 =?utf-8?B?NTJHTWNvbUpmUnoxM2lCNUZ2N1h1enJEb1E2RUV4b2NNR1krNzhMUXNoclZO?=
 =?utf-8?B?V3hUb0xWMjRhWGFHa2Nzd0pEQk9jVWd5eGQ0OTArcGpwandxSnozN3c5YitI?=
 =?utf-8?B?eExDS0tub1haQkNZQ0F5RlhFc1BiWmorYmE4SVpBazJBcW1GQ256Mi91cG5S?=
 =?utf-8?B?dDJaUTF0enRtWHhDNTdjZUd3ZGpmY09ZRGZKUlM4eXVGLzcrSVlNbTlZc1RG?=
 =?utf-8?B?TCtPRVNLUEpubFpWenlrUUtQMGZ2SFNpQWQ0RlpJRlIyKzB5MHg0M2FDODNv?=
 =?utf-8?B?d0wrNmpqUFphdTExdnpwL1FPbTRuUWNrYk9VbFlvdHdaQzREbWk1MUV5SE1E?=
 =?utf-8?B?Y2QreGVHWGIyTkQ5anNXU0U2c3lTanFpTVczSjlwOFVubDJJYnhuYm91WmZB?=
 =?utf-8?B?YUNlRnBsTjBVa25VVjBCR3YwUGN1YXJ6cXBuVTNwV2Z2YXc3QjlDMXRsaU5u?=
 =?utf-8?B?cjdXZkpRbCtmYmhwbktzMlRnOU1BMmllV2JrMFFqT0J0K0Nlb0QxeU4wempP?=
 =?utf-8?B?alR5bVlNbHVvZjNidkVqSHk3bFZ1WlU2YzVOUHVSODRGdmNyeHoyc1pScFJ0?=
 =?utf-8?B?NytNT1pyTFd3Mk9BRmJNc3pmT2hxZkpqSWcrVWE0c3IrTXBoNDlvTU9reGZD?=
 =?utf-8?B?STMzT3p1ZnhWZUhQakZEK2tHMzVHc1JUOHE5a3Vxc2dzSXNwL1ZEWjB0NzJF?=
 =?utf-8?B?MjN3b1lnWnRTYlVlZ0htS1YyMENtbkNjQUV3UDRiTVpKd3hXMFNlWnVJdTJi?=
 =?utf-8?B?QjFqRUFqbkw1amQ5cncwQjY3Sm5HVEtvTVBDWUhnRzRPTzR5YXhYa282UjlF?=
 =?utf-8?B?WHJST3FvUkk1emxRdEJNYWJkWDE3ZE14N3BpbUtkTmlFM2hUUENiNk8yK2Rx?=
 =?utf-8?B?V2lLU1d5RmVXTnhpS1VtU0ZlbUc4SWZWWmNSTVdaYXdXU1BMTUE0Z1IwSURQ?=
 =?utf-8?B?MzNPVmh4Y2V0M2pvVUV0eENyeEJtRmdJbUczUjRRbTIxMnAvWnJMR1pXd2pr?=
 =?utf-8?B?ZkxvaWlSVjV5b0VxMUZ1djFRNDRFZ2E4anZGK1VML3IvQ2RjZnRKditCSmRn?=
 =?utf-8?B?YnZuajZ2ZTZsV3FNb0FEL0pDckpVem9GWWgzTFdvbGpsTi8rWmRVUGQ5dWhN?=
 =?utf-8?B?RHhCcml1TEhRNndUSTB3aUxKcHZnWWdhaGdDUEpJWTluVEU4S05sbWFoOFV4?=
 =?utf-8?B?UW1rTWVCSmxoNXB2bGNKUUhLUWxQTEd6aWZYTE50SjZYMEhkVzdKd0tVY2Fv?=
 =?utf-8?B?dkkxVUpyY291b0ZWN3pMek9QekFnMERrbTlBTTkvRWtWK2Z5clhSQmdUczFu?=
 =?utf-8?B?NTRra3pkbDhjUmNJWWdMVHBNWEFHRTdycmtvREpTeEpxclY2Mnc4UGJaTTFL?=
 =?utf-8?Q?BOtHxtyxioljLTeLZ5TgGGq6D8U+MmGT/xU9A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHVRZkN0cnJGUjR6ZXp5UFYxSFg1UENDMCtITDZqdVE2RGE0K1JFemhsaTU0?=
 =?utf-8?B?cHhyR3hQYWZZanlaVnV1UHNQcDJnOCt4QU5VQ2xjL3NZSzdGbHZCZHNhM0VB?=
 =?utf-8?B?bWVnaVZXdjBiRzd2UDFaMWVHNVI3ZzB5dFRnYXY4Rlo4M3U0eXFNVlNBUGx2?=
 =?utf-8?B?djZoSmE2dkxPK1k3emJ2M1duU3RmMlEvSkpFSExmckNuaU1OcXgvYStYUGc4?=
 =?utf-8?B?dE00bDhHajRtYzAvZ21EVE5xYmlEbmVUV0NzRldQcDA5bzB0aHFFZ2RxWVJF?=
 =?utf-8?B?Tm9LOXBjTFdOM0Q1UnhzSXA4eFplYnFsZktyMUljSzZOSW1ZMEhZTHo3WmVi?=
 =?utf-8?B?a0VLV2Vmd1JSTEl6ZTZtVktYV241NzgzUDlwVkNWSng1L1lWaFZWZzl3YkVV?=
 =?utf-8?B?eWIwOHFhRXFrTFhWQ21RVXN0MWpuTThaMGl0M2FIc3dseDB6b3FTNFM4ODZz?=
 =?utf-8?B?L3grby9FYlpnRy9yNFZXTG0vVlF4ZTVqeGZJQlpINmd6ZWdZaGhkL2NiOEll?=
 =?utf-8?B?cWkwVE9DdnBaYWowd1djaDBVYzRreXhWczRBbWFVaUp2Mjl6L3BQOTYrdHl5?=
 =?utf-8?B?cHRkOSt1emFLRXFtT0F6V2lmb1RJL3hDbndYcE1EL1ppT3c0V3YxdzBuNFNI?=
 =?utf-8?B?Y1RBSUc1UnVVYkdJYzEvRTIyTEJBaE95VHhlUEdnZHJvUzVYTXYvS2VrRjdy?=
 =?utf-8?B?QzdJTjdTelNBZ0RnWExtd2pXQThWbEFYaUNYcklSNVNiSmE4UlJuRkRHeXVZ?=
 =?utf-8?B?OC9UUkRlK0hTQ1VBekprTVpZZG9wN0cxRmRNMTBhZkFBMm94Y0dhMVZRc1ZN?=
 =?utf-8?B?ZXNQSVRnejAzRVFsb01EV0FkTUVHclRtTDFEK3lBZHpVRlU2SUc4YVFnS3ZM?=
 =?utf-8?B?ekNLbWtyYUE3WFZkRTV4eURZWUN3Q2FiNXo2UW9HWHRkZGl2ckxPbnBkMVFq?=
 =?utf-8?B?WVBTWGZ3WkljT0NjOWZ4cURGSnBLQWJkSTdjcGVTTTBibGZpOEZqellmNUpr?=
 =?utf-8?B?SC9mQWZrUkpKaDhEaUloTmlvbVFyU1pZL3ZCb2plem16eHJNMUZVbmV6bnFD?=
 =?utf-8?B?OFpZL0tka0RmVm1TV0w0dWhsdnhGYXhaNjFYcE9QMnNSTmY4SzhVMnR4TXpa?=
 =?utf-8?B?MTJtaEM5QmU3UHdKVUk5eHZWVWhkNnJ5Y1VyaUluWTVYV1Zick1maHhsMnIy?=
 =?utf-8?B?OFBlUDAwTERNMitTL0txc21halRpVXZNWkhEcGVEM2pXbXkzSzc0eVF4blZB?=
 =?utf-8?B?aDR0M1VsZ21ybVJpL2ZVVHQ1YncwTi93RW1oRjlhSHpGa1RaNTlrT29rRWEr?=
 =?utf-8?B?RFhrbkhack5LUzdlZk90K3dmR0daNUhEWGNWbDZ5ZzkvSFJ1MjhtRmhIcVNp?=
 =?utf-8?B?WTVDak5SVnpubElOVVJtL1o1TERGbTA3WlRRa0hRdER4ZHQ1a3NoVVQxN2xW?=
 =?utf-8?B?TVYyYlpwd1dWRTREVmx0SWJKZVdTVi94SXlKRlM3VHdmZWdWQTJmS2M5ZWYw?=
 =?utf-8?B?ZE0xb3NjMkhydk9RMHZNSDFiMXlzRkdUY21iRnFjZkZmNXBZb01LN2ozV0dn?=
 =?utf-8?B?ME52RjBXOUVMWFJrbkVZSklSTnJaM2FHOGlVRU02VVJncE41SDZXNXBxaG1B?=
 =?utf-8?B?dStYeEVmRmZyTzRZQTlnc3RmeEk1eW5ROXNtYXhDQ3dFcm42TkN4MTFPSVJT?=
 =?utf-8?B?MWt3U04vRXhtN3lyVlYwUG1mRlNxcUVYQnFhVitGZGFQU0Y5LzJuTy9ENFQv?=
 =?utf-8?B?QXNzNVFoMUJYbEZyTW1JMHFMZURrdk5DUlVFeTdoUVdhRm1WVzJrd3daWkd0?=
 =?utf-8?B?OVRLenE3aDg1eEFzZmtScUtCM3JsNDh5RkU5VDFvTUlvYi9XTWY3UEZEL0pO?=
 =?utf-8?B?Zmh2NEtJRWFLMzZSWTlUOVkzY0wrTU15OC9sVHRYdDc2ZzQ2cU9nSStCQmYv?=
 =?utf-8?B?RUthQldjSVFpanc1TEszT0dCQVg3bXdZZldsMm4xTHJBeVF4L2RiNjdGK2R1?=
 =?utf-8?B?emEwZ0poMkx3K1gyYk9jRE5PNTdmZi8wODAwVWxBQnRjSlpZS2xjY091UGRC?=
 =?utf-8?B?WTkzM01kcEx1WWNIdmdtYjd2QU9nWkZwTW1GNHMwR0k4VGxKMEk0NzZ1WDdZ?=
 =?utf-8?Q?T9g1ez+0rLWIZYUTTaz16TTMk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb928c4b-c1a7-4bb7-942d-08dd13aa088b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 14:51:56.8527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Lsf3MgW/k1UFXt3MrIUICptQ7l11eataXnMF+r5vv8iNbfQLjhGmYU8faJNEfhQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
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

--------------KUkE7phiCBsOBg6pkvbjOkG0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 03.12.24 um 14:42 schrieb Thomas Hellström:
> On Tue, 2024-12-03 at 14:12 +0100, Christian König wrote:
>> Am 15.11.24 um 16:01 schrieb Thomas Hellström:
>>> Provide a helper to shrink ttm_tt page-vectors on a per-page
>>> basis. A ttm_backup backend could then in theory get away with
>>> allocating a single temporary page for each struct ttm_tt.
>>>
>>> This is accomplished by splitting larger pages before trying to
>>> back them up.
>>>
>>> In the future we could allow ttm_backup to handle backing up
>>> large pages as well, but currently there's no benefit in
>>> doing that, since the shmem backup backend would have to
>>> split those anyway to avoid allocating too much temporary
>>> memory, and if the backend instead inserts pages into the
>>> swap-cache, those are split on reclaim by the core.
>>>
>>> Due to potential backup- and recover errors, allow partially
>>> swapped
>>> out struct ttm_tt's, although mark them as swapped out stopping
>>> them
>>> from being swapped out a second time. More details in the
>>> ttm_pool.c
>>> DOC section.
>>>
>>> v2:
>>> - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
>>> - s/back_up/backup/
>>> - Add a writeback parameter to the exported interface.
>>> v8:
>>> - Use a struct for flags for readability (Matt Brost)
>>> - Address misc other review comments (Matt Brost)
>>> v9:
>>> - Update the kerneldoc for the ttm_tt::backup field.
>>> v10:
>>> - Rebase.
>>> v13:
>>> - Rebase on ttm_backup interface change. Update kerneldoc.
>>> - Rebase and adjust ttm_tt_is_swapped().
>>>
>>> Cc: Christian König<christian.koenig@amd.com>
>>> Cc: Somalapuram Amaranath<Amaranath.Somalapuram@amd.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Cc:<dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>> Reviewed-by: Matthew Brost<matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_pool.c | 396
>>> +++++++++++++++++++++++++++++++--
>>>    drivers/gpu/drm/ttm/ttm_tt.c   |  37 +++
>>>    include/drm/ttm/ttm_pool.h     |   6 +
>>>    include/drm/ttm/ttm_tt.h       |  32 ++-
>>>    4 files changed, 457 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 8504dbe19c1a..f58864439edb 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -41,6 +41,7 @@
>>>    #include <asm/set_memory.h>
>>>    #endif
>>>    
>>> +#include <drm/ttm/ttm_backup.h>
>>>    #include <drm/ttm/ttm_pool.h>
>>>    #include <drm/ttm/ttm_tt.h>
>>>    #include <drm/ttm/ttm_bo.h>
>>> @@ -58,6 +59,32 @@ struct ttm_pool_dma {
>>>    	unsigned long vaddr;
>>>    };
>>>    
>>> +/**
>>> + * struct ttm_pool_tt_restore - State representing restore from
>>> backup
>>> + * @alloced_pages: Total number of already allocated pages for the
>>> ttm_tt.
>>> + * @restored_pages: Number of (sub) pages restored from swap for
>>> this
>>> + *		     chunk of 1 << @order pages.
>>> + * @first_page: The ttm page ptr representing for @old_pages[0].
>>> + * @caching_divide: Page pointer where subsequent pages are
>>> cached.
>>> + * @old_pages: Backup copy of page pointers that were replaced by
>>> the new
>>> + *	       page allocation.
>>> + * @pool: The pool used for page allocation while restoring.
>>> + * @order: The order of the last page allocated while restoring.
>>> + *
>>> + * Recovery from backup might fail when we've recovered less than
>>> the
>>> + * full ttm_tt. In order not to loose any data (yet), keep
>>> information
>>> + * around that allows us to restart a failed ttm backup recovery.
>>> + */
>>> +struct ttm_pool_tt_restore {
>>> +	pgoff_t alloced_pages;
>>> +	pgoff_t restored_pages;
>>> +	struct page **first_page;
>>> +	struct page **caching_divide;
>>> +	struct ttm_pool *pool;
>>> +	unsigned int order;
>>> +	struct page *old_pages[];
>>> +};
>>> +
>>>    static unsigned long page_pool_size;
>>>    
>>>    MODULE_PARM_DESC(page_pool_size, "Number of pages in the
>>> WC/UC/DMA pool");
>>> @@ -354,11 +381,105 @@ static unsigned int
>>> ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>>>    	return p->private;
>>>    }
>>>    
>>> +/*
>>> + * To be able to insert single pages into backup directly,
>>> + * we need to split multi-order page allocations and make them
>>> look
>>> + * like single-page allocations.
>>> + */
>>> +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct
>>> page *p)
>>> +{
>>> +	unsigned int order = ttm_pool_page_order(pool, p);
>>> +	pgoff_t nr;
>>> +
>>> +	if (!order)
>>> +		return;
>>> +
>>> +	split_page(p, order);
>> What exactly should split_page() do here and why is that necessary?
>>
>> IIRC that function just updated the reference count and updated
>> things
>> like page owner tracking and memcg accounting. Which should both be
>> completely irrelevant here.
>>
>> Or do you just do that so that you can free each page individually?
> Yes, exactly. Like For a 2MiB page we'd otherwise have to allocate 2MiB
> of shmem backing storage, potentially from kernel reserves before we
> could actually free anything. Since (currently) the shmem objects we
> use are 4K-page only, this should make the process "allocate shmem and
> back up" much less likely to deplete the kernel memory reserves.

Ah, yes that makes totally sense now.

>
> Taking a step back and looking at potentially other solution, like
> direct insertion into the swap cache, then even if inserting a 2MiB
> page into the swap cache, vmscan would split it before writeback, and
> still it didn't appear very stable. So inserting one 4K page at a time
> seemed neccessary. If I were to take a guess that's why shmem, when
> configured for 2MiB pages, like with i915, also splits the pages before
> moving to swap-cache / writeback.
>
>
>>> +	nr = 1UL << order;
>>> +	while (nr--)
>>> +		(p++)->private = 0;
>>> +}
>>> +
>>> +/**
>>> + * DOC: Partial backup and restoration of a struct ttm_tt.
>>> + *
>>> + * Swapout using ttm_backup_backup_page() and swapin using
>>> + * ttm_backup_copy_page() may fail.
>>> + * The former most likely due to lack of swap-space or memory, the
>>> latter due
>>> + * to lack of memory or because of signal interruption during
>>> waits.
>>> + *
>>> + * Backup failure is easily handled by using a ttm_tt pages vector
>>> that holds
>>> + * both swap entries and page pointers. This has to be taken into
>>> account when
>>> + * restoring such a ttm_tt from backup, and when freeing it while
>>> backed up.
>>> + * When restoring, for simplicity, new pages are actually
>>> allocated from the
>>> + * pool and the contents of any old pages are copied in and then
>>> the old pages
>>> + * are released.
>>> + *
>>> + * For restoration failures, the struct ttm_pool_tt_restore holds
>>> sufficient state
>>> + * to be able to resume an interrupted restore, and that structure
>>> is freed once
>>> + * the restoration is complete. If the struct ttm_tt is destroyed
>>> while there
>>> + * is a valid struct ttm_pool_tt_restore attached, that is also
>>> properly taken
>>> + * care of.
>>> + */
>>> +
>>> +static bool ttm_pool_restore_valid(const struct
>>> ttm_pool_tt_restore *restore)
>>> +{
>>> +	return restore && restore->restored_pages < (1 << restore-
>>>> order);
>>> +}
>>> +
>>> +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore
>>> *restore,
>>> +			       struct ttm_backup *backup,
>>> +			       struct ttm_operation_ctx *ctx)
>>> +{
>>> +	unsigned int i, nr = 1 << restore->order;
>>> +	int ret = 0;
>>> +
>>> +	if (!ttm_pool_restore_valid(restore))
>>> +		return 0;
>>> +
>>> +	for (i = restore->restored_pages; i < nr; ++i) {
>>> +		struct page *p = restore->old_pages[i];
>>> +
>>> +		if (ttm_backup_page_ptr_is_handle(p)) {
>>> +			unsigned long handle =
>>> ttm_backup_page_ptr_to_handle(p);
>>> +
>>> +			if (handle == 0)
>>> +				continue;
>>> +
>>> +			ret = ttm_backup_copy_page
>>> +				(backup, restore->first_page[i],
>>> +				 handle, ctx->interruptible);
>> That coding style looks really odd, I didn't even notice that it is a
>> function call initially.
>>
>> Maybe put everything under the if into a separate function.
> At a minimum, I'll fix up the formatting here.
>
>>> +			if (ret)
>>> +				break;
>>> +
>>> +			ttm_backup_drop(backup, handle);
>>> +		} else if (p) {
>>> +			/*
>>> +			 * We could probably avoid splitting the
>>> old page
>>> +			 * using clever logic, but ATM we don't
>>> care, as
>>> +			 * we prioritize releasing memory ASAP.
>>> Note that
>>> +			 * here, the old retained page is always
>>> write-back
>>> +			 * cached.
>>> +			 */
>>> +			ttm_pool_split_for_swap(restore->pool, p);
>>> +			copy_highpage(restore->first_page[i], p);
>>> +			__free_pages(p, 0);
>>> +		}
>>> +
>>> +		restore->restored_pages++;
>>> +		restore->old_pages[i] = NULL;
>>> +		cond_resched();
>> There is a push to remove cond_resched(), see here:
>> https://patchwork.kernel.org/project/linux-mm/patch/20231107230822.371443-30-ankur.a.arora@oracle.com/
>>
>> Not sure in which discussion that removal went, but IIRC we should
>> not
>> add any new users of it.
> I'll read up on that and remove if needed. I'm curious how / if
> voluntary preemption is going to be handled.

I didn't fully understood it either, but the push kind of seems to be 
that drivers or in this cases subsystems are not supposed to mess with 
cond_resched() any more and just rely on preemptive kernels.

>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    /* Called when we got a page, either from a pool or newly
>>> allocated */
>>>    static int ttm_pool_page_allocated(struct ttm_pool *pool,
>>> unsigned int order,
>>>    				   struct page *p, dma_addr_t
>>> **dma_addr,
>>>    				   unsigned long *num_pages,
>>> -				   struct page ***pages)
>>> +				   struct page ***pages,
>>> +				   struct ttm_pool_tt_restore
>>> *restore)
>>>    {
>>>    	unsigned int i;
>>>    	int r;
>>> @@ -369,6 +490,16 @@ static int ttm_pool_page_allocated(struct
>>> ttm_pool *pool, unsigned int order,
>>>    			return r;
>>>    	}
>>>    
>>> +	if (restore) {
>>> +		memcpy(restore->old_pages, *pages,
>>> +		       (1 << order) * sizeof(*restore-
>>>> old_pages));
>>> +		memset(*pages, 0, (1 << order) * sizeof(**pages));
>>> +		restore->order = order;
>>> +		restore->restored_pages = 0;
>>> +		restore->first_page = *pages;
>>> +		restore->alloced_pages += 1UL << order;
>>> +	}
>>> +
>>>    	*num_pages -= 1 << order;
>>>    	for (i = 1 << order; i; --i, ++(*pages), ++p)
>>>    		**pages = p;
>>> @@ -394,22 +525,39 @@ static void ttm_pool_free_range(struct
>>> ttm_pool *pool, struct ttm_tt *tt,
>>>    				pgoff_t start_page, pgoff_t
>>> end_page)
>>>    {
>>>    	struct page **pages = &tt->pages[start_page];
>>> +	struct ttm_backup *backup = tt->backup;
>>>    	unsigned int order;
>>>    	pgoff_t i, nr;
>>>    
>>>    	for (i = start_page; i < end_page; i += nr, pages += nr) {
>>>    		struct ttm_pool_type *pt = NULL;
>>> +		struct page *p = *pages;
>>> +
>>> +		if (ttm_backup_page_ptr_is_handle(p)) {
>>> +			unsigned long handle =
>>> ttm_backup_page_ptr_to_handle(p);
>>> +
>>> +			nr = 1;
>>> +			if (handle != 0)
>>> +				ttm_backup_drop(backup, handle);
>>> +			continue;
>>> +		}
>>> +
>>> +		if (pool) {
>>> +			order = ttm_pool_page_order(pool, p);
>>> +			nr = (1UL << order);
>>> +			if (tt->dma_address)
>>> +				ttm_pool_unmap(pool, tt-
>>>> dma_address[i], nr);
>>>    
>>> -		order = ttm_pool_page_order(pool, *pages);
>>> -		nr = (1UL << order);
>>> -		if (tt->dma_address)
>>> -			ttm_pool_unmap(pool, tt->dma_address[i],
>>> nr);
>>> +			pt = ttm_pool_select_type(pool, caching,
>>> order);
>>> +		} else {
>>> +			order = p->private;
>>> +			nr = (1UL << order);
>>> +		}
>>>    
>>> -		pt = ttm_pool_select_type(pool, caching, order);
>>>    		if (pt)
>>> -			ttm_pool_type_give(pt, *pages);
>>> +			ttm_pool_type_give(pt, p);
>>>    		else
>>> -			ttm_pool_free_page(pool, caching, order,
>>> *pages);
>>> +			ttm_pool_free_page(pool, caching, order,
>>> p);
>>>    	}
>>>    }
>>>    
>>> @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>    	else
>>>    		gfp_flags |= GFP_HIGHUSER;
>>>    
>>> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER,
>>> __fls(num_pages));
>>> -	     num_pages;
>>> -	     order = min_t(unsigned int, order, __fls(num_pages)))
>>> {
>>> +	order = min_t(unsigned int, MAX_PAGE_ORDER,
>>> __fls(num_pages));
>>> +
>>> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
>>> +		if (!tt->restore) {
>>> +			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
>>> +
>>> +			if (ctx->gfp_retry_mayfail)
>>> +				gfp |= __GFP_RETRY_MAYFAIL;
>>> +
>>> +			tt->restore =
>>> +				kvzalloc(struct_size(tt->restore,
>>> old_pages,
>>> +						     (size_t)1 <<
>>> order), gfp);
>>> +			if (!tt->restore)
>>> +				return -ENOMEM;
>>> +		} else if (ttm_pool_restore_valid(tt->restore)) {
>>> +			struct ttm_pool_tt_restore *restore = tt-
>>>> restore;
>>> +
>>> +			num_pages -= restore->alloced_pages;
>>> +			order = min_t(unsigned int, order,
>>> __fls(num_pages));
>>> +			pages += restore->alloced_pages;
>>> +			r = ttm_pool_restore_tt(restore, tt-
>>>> backup, ctx);
>>> +			if (r)
>>> +				return r;
>>> +			caching = restore->caching_divide;
>>> +		}
>>> +
>>> +		tt->restore->pool = pool;
>>> +	}
>> Hui? Why is that part of the allocation function now?
>>
>> At bare minimum I would expect that this is a new function.
> It's because we now have partially backed up tts, so the restore is
> interleaved on a per-page basis, replacing the backup handles with
> page-pointers. I'll see if I can separate out at least the
> initialization here.

Yeah, that kind of makes sense.

My expectation was just that we now have explicit ttm_pool_swapout() and 
ttm_pool_swapin() functions.

Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> +
>>> +	for (; num_pages; order = min_t(unsigned int, order,
>>> __fls(num_pages))) {
>>>    		struct ttm_pool_type *pt;
>>>    
>>>    		page_caching = tt->caching;
>>> @@ -472,11 +647,19 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>    				r = ttm_pool_page_allocated(pool,
>>> order, p,
>>>    							
>>> &dma_addr,
>>>    							
>>> &num_pages,
>>> -							
>>> &pages);
>>> +							
>>> &pages,
>>> +							    tt-
>>>> restore);
>>>    				if (r)
>>>    					goto error_free_page;
>>>    
>>>    				caching = pages;
>>> +				if (ttm_pool_restore_valid(tt-
>>>> restore)) {
>>> +					r =
>>> ttm_pool_restore_tt(tt->restore, tt->backup,
>>> +								ct
>>> x);
>>> +					if (r)
>>> +						goto
>>> error_free_all;
>>> +				}
>>> +
>>>    				if (num_pages < (1 << order))
>>>    					break;
>>>    
>>> @@ -496,9 +679,17 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>    				caching = pages;
>>>    			}
>>>    			r = ttm_pool_page_allocated(pool, order,
>>> p, &dma_addr,
>>> -						    &num_pages,
>>> &pages);
>>> +						    &num_pages,
>>> &pages,
>>> +						    tt->restore);
>>>    			if (r)
>>>    				goto error_free_page;
>>> +
>>> +			if (ttm_pool_restore_valid(tt->restore)) {
>>> +				r = ttm_pool_restore_tt(tt-
>>>> restore, tt->backup, ctx);
>>> +				if (r)
>>> +					goto error_free_all;
>>> +			}
>>> +
>>>    			if (PageHighMem(p))
>>>    				caching = pages;
>>>    		}
>>> @@ -517,12 +708,26 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>    	if (r)
>>>    		goto error_free_all;
>>>    
>>> +	if (tt->restore) {
>>> +		kvfree(tt->restore);
>>> +		tt->restore = NULL;
>>> +	}
>>> +
>>> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
>>> +		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
>>> +				    TTM_TT_FLAG_SWAPPED);
>>> +
>>>    	return 0;
>>>    
>>>    error_free_page:
>>>    	ttm_pool_free_page(pool, page_caching, order, p);
>>>    
>>>    error_free_all:
>>> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
>>> +		tt->restore->caching_divide = caching;
>>> +		return r;
>>> +	}
>>> +
>>>    	num_pages = tt->num_pages - num_pages;
>>>    	caching_divide = caching - tt->pages;
>>>    	ttm_pool_free_range(pool, tt, tt->caching, 0,
>>> caching_divide);
>>> @@ -549,6 +754,171 @@ void ttm_pool_free(struct ttm_pool *pool,
>>> struct ttm_tt *tt)
>>>    }
>>>    EXPORT_SYMBOL(ttm_pool_free);
>>>    
>>> +/**
>>> + * ttm_pool_release_backed_up() - Release content of a swapped-out
>>> struct ttm_tt
>>> + * @tt: The struct ttm_tt.
>>> + *
>>> + * Release handles with associated content or any remaining pages
>>> of
>>> + * a backed-up struct ttm_tt.
>>> + */
>>> +void ttm_pool_release_backed_up(struct ttm_tt *tt)
>>> +{
>>> +	struct ttm_backup *backup = tt->backup;
>>> +	struct ttm_pool_tt_restore *restore;
>>> +	pgoff_t i, start_page = 0;
>>> +	unsigned long handle;
>>> +
>>> +	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
>>> +		return;
>>> +
>>> +	restore = tt->restore;
>>> +
>>> +	if (ttm_pool_restore_valid(restore)) {
>>> +		pgoff_t nr = 1UL << restore->order;
>>> +
>>> +		for (i = restore->restored_pages; i < nr; ++i) {
>>> +			struct page *p = restore->old_pages[i];
>>> +
>>> +			if (ttm_backup_page_ptr_is_handle(p)) {
>>> +				handle =
>>> ttm_backup_page_ptr_to_handle(p);
>>> +				if (handle == 0)
>>> +					continue;
>>> +
>>> +				ttm_backup_drop(backup, handle);
>>> +			} else if (p) {
>>> +				ttm_pool_split_for_swap(restore-
>>>> pool, p);
>>> +				__free_pages(p, 0);
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	if (restore) {
>>> +		pgoff_t mid = restore->caching_divide - tt->pages;
>>> +
>>> +		start_page = restore->alloced_pages;
>>> +		/* Pages that might be dma-mapped and non-cached
>>> */
>>> +		ttm_pool_free_range(restore->pool, tt, tt-
>>>> caching,
>>> +				    0, mid);
>>> +		/* Pages that might be dma-mapped but cached */
>>> +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
>>> +				    mid, restore->alloced_pages);
>>> +	}
>>> +
>>> +	/* Shrunken pages. Cached and not dma-mapped. */
>>> +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt-
>>>> num_pages);
>>> +
>>> +	if (restore) {
>>> +		kvfree(restore);
>>> +		tt->restore = NULL;
>>> +	}
>>> +
>>> +	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
>>> TTM_TT_FLAG_SWAPPED);
>>> +}
>>> +
>>> +/**
>>> + * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
>>> + * @pool: The pool used when allocating the struct ttm_tt.
>>> + * @ttm: The struct ttm_tt.
>>> + * @flags: Flags to govern the backup behaviour.
>>> + *
>>> + * Back up or purge a struct ttm_tt. If @purge is true, then
>>> + * all pages will be freed directly to the system rather than to
>>> the pool
>>> + * they were allocated from, making the function behave similarly
>>> to
>>> + * ttm_pool_free(). If @purge is false the pages will be backed up
>>> instead,
>>> + * exchanged for handles.
>>> + * A subsequent call to ttm_pool_alloc() will then read back the
>>> content and
>>> + * a subsequent call to ttm_pool_release_shrunken() will drop it.
>>> + * If backup of a page fails for whatever reason, @ttm will still
>>> be
>>> + * partially backed up, retaining those pages for which backup
>>> fails.
>>> + *
>>> + * Return: Number of pages actually backed up or freed, or
>>> negative
>>> + * error code on error.
>>> + */
>>> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
>>> +			const struct ttm_backup_flags *flags)
>>> +{
>>> +	struct ttm_backup *backup = ttm->backup;
>>> +	struct page *page;
>>> +	unsigned long handle;
>>> +	gfp_t alloc_gfp;
>>> +	gfp_t gfp;
>>> +	int ret = 0;
>>> +	pgoff_t shrunken = 0;
>>> +	pgoff_t i, num_pages;
>>> +
>>> +	if ((!ttm_backup_bytes_avail() && !flags->purge) ||
>>> +	    pool->use_dma_alloc ||
>>> +	    (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
>>> +		return -EBUSY;
>>> +
>>> +#ifdef CONFIG_X86
>>> +	/* Anything returned to the system needs to be cached. */
>>> +	if (ttm->caching != ttm_cached)
>>> +		set_pages_array_wb(ttm->pages, ttm->num_pages);
>>> +#endif
>>> +
>>> +	if (ttm->dma_address || flags->purge) {
>>> +		for (i = 0; i < ttm->num_pages; i += num_pages) {
>>> +			unsigned int order;
>>> +
>>> +			page = ttm->pages[i];
>>> +			if (unlikely(!page)) {
>>> +				num_pages = 1;
>>> +				continue;
>>> +			}
>>> +
>>> +			order = ttm_pool_page_order(pool, page);
>>> +			num_pages = 1UL << order;
>>> +			if (ttm->dma_address)
>>> +				ttm_pool_unmap(pool, ttm-
>>>> dma_address[i],
>>> +					       num_pages);
>>> +			if (flags->purge) {
>>> +				shrunken += num_pages;
>>> +				page->private = 0;
>>> +				__free_pages(page, order);
>>> +				memset(ttm->pages + i, 0,
>>> +				       num_pages * sizeof(*ttm-
>>>> pages));
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	if (flags->purge)
>>> +		return shrunken;
>>> +
>>> +	if (pool->use_dma32)
>>> +		gfp = GFP_DMA32;
>>> +	else
>>> +		gfp = GFP_HIGHUSER;
>>> +
>>> +	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
>>> __GFP_RETRY_MAYFAIL;
>>> +
>>> +	for (i = 0; i < ttm->num_pages; ++i) {
>>> +		page = ttm->pages[i];
>>> +		if (unlikely(!page))
>>> +			continue;
>>> +
>>> +		ttm_pool_split_for_swap(pool, page);
>>> +
>>> +		handle = ttm_backup_backup_page(backup, page,
>>> flags->writeback, i,
>>> +						gfp, alloc_gfp);
>>> +		if (handle) {
>>> +			ttm->pages[i] =
>>> ttm_backup_handle_to_page_ptr(handle);
>>> +			put_page(page);
>>> +			shrunken++;
>>> +		} else {
>>> +			/* We allow partially shrunken tts */
>>> +			ret = -ENOMEM;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (shrunken)
>>> +		ttm->page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
>>> +				    TTM_TT_FLAG_SWAPPED);
>>> +
>>> +	return shrunken ? shrunken : ret;
>>> +}
>>> +
>>>    /**
>>>     * ttm_pool_init - Initialize a pool
>>>     *
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 3baf215eca23..dd4eabe4ad79 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -40,6 +40,7 @@
>>>    #include <drm/drm_cache.h>
>>>    #include <drm/drm_device.h>
>>>    #include <drm/drm_util.h>
>>> +#include <drm/ttm/ttm_backup.h>
>>>    #include <drm/ttm/ttm_bo.h>
>>>    #include <drm/ttm/ttm_tt.h>
>>>    
>>> @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt
>>> *ttm,
>>>    	ttm->swap_storage = NULL;
>>>    	ttm->sg = bo->sg;
>>>    	ttm->caching = caching;
>>> +	ttm->restore = NULL;
>>> +	ttm->backup = NULL;
>>>    }
>>>    
>>>    int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>>> @@ -182,6 +185,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
>>>    		fput(ttm->swap_storage);
>>>    	ttm->swap_storage = NULL;
>>>    
>>> +	ttm_pool_release_backed_up(ttm);
>>> +	if (ttm->backup) {
>>> +		ttm_backup_fini(ttm->backup);
>>> +		ttm->backup = NULL;
>>> +	}
>>> +
>>>    	if (ttm->pages)
>>>    		kvfree(ttm->pages);
>>>    	else
>>> @@ -253,6 +262,34 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>>>    }
>>>    EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
>>>    
>>> +/**
>>> + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
>>> + * @bdev: The TTM device.
>>> + * @tt: The struct ttm_tt.
>>> + * @flags: Flags that govern the backup behaviour.
>>> + *
>>> + * Update the page accounting and call ttm_pool_shrink_tt to free
>>> pages
>>> + * or back them up.
>>> + *
>>> + * Return: Number of pages freed or swapped out, or negative error
>>> code on
>>> + * error.
>>> + */
>>> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
>>> +		   const struct ttm_backup_flags flags)
>>> +{
>>> +	long ret;
>>> +
>>> +	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
>>> +		return 0;
>>> +
>>> +	ret = ttm_pool_backup_tt(&bdev->pool, tt, &flags);
>>> +
>>> +	if (ret > 0)
>>> +		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    /**
>>>     * ttm_tt_swapout - swap out tt object
>>>     *
>>> diff --git a/include/drm/ttm/ttm_pool.h
>>> b/include/drm/ttm/ttm_pool.h
>>> index 160d954a261e..3112a4be835c 100644
>>> --- a/include/drm/ttm/ttm_pool.h
>>> +++ b/include/drm/ttm/ttm_pool.h
>>> @@ -33,6 +33,7 @@
>>>    
>>>    struct device;
>>>    struct seq_file;
>>> +struct ttm_backup_flags;
>>>    struct ttm_operation_ctx;
>>>    struct ttm_pool;
>>>    struct ttm_tt;
>>> @@ -89,6 +90,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
>>>    
>>>    int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>>>    
>>> +void ttm_pool_release_backed_up(struct ttm_tt *tt);
>>> +
>>> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
>>> +			const struct ttm_backup_flags *flags);
>>> +
>>>    int ttm_pool_mgr_init(unsigned long num_pages);
>>>    void ttm_pool_mgr_fini(void);
>>>    
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index 991edafdb2dd..6ca2fc7b2a26 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -32,11 +32,13 @@
>>>    #include <drm/ttm/ttm_caching.h>
>>>    #include <drm/ttm/ttm_kmap_iter.h>
>>>    
>>> +struct ttm_backup;
>>>    struct ttm_device;
>>>    struct ttm_tt;
>>>    struct ttm_resource;
>>>    struct ttm_buffer_object;
>>>    struct ttm_operation_ctx;
>>> +struct ttm_pool_tt_restore;
>>>    
>>>    /**
>>>     * struct ttm_tt - This is a structure holding the pages,
>>> caching- and aperture
>>> @@ -88,6 +90,9 @@ struct ttm_tt {
>>>    	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>>> USE. This is
>>>    	 * set by TTM after ttm_tt_populate() has successfully
>>> returned, and is
>>>    	 * then unset when TTM calls ttm_tt_unpopulate().
>>> +	 *
>>> +	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is
>>> set if the
>>> +	 * struct ttm_tt has been (possibly partially) backed up.
>>>    	 */
>>>    #define TTM_TT_FLAG_SWAPPED		BIT(0)
>>>    #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
>>> @@ -96,6 +101,7 @@ struct ttm_tt {
>>>    #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>>>    
>>>    #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
>>> +#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
>>>    	uint32_t page_flags;
>>>    	/** @num_pages: Number of pages in the page array. */
>>>    	uint32_t num_pages;
>>> @@ -105,11 +111,20 @@ struct ttm_tt {
>>>    	dma_addr_t *dma_address;
>>>    	/** @swap_storage: Pointer to shmem struct file for swap
>>> storage. */
>>>    	struct file *swap_storage;
>>> +	/**
>>> +	 * @backup: Pointer to backup struct for backed up tts.
>>> +	 * Could be unified with @swap_storage. Meanwhile, the
>>> driver's
>>> +	 * ttm_tt_create() callback is responsible for assigning
>>> +	 * this field.
>>> +	 */
>>> +	struct ttm_backup *backup;
>>>    	/**
>>>    	 * @caching: The current caching state of the pages, see
>>> enum
>>>    	 * ttm_caching.
>>>    	 */
>>>    	enum ttm_caching caching;
>>> +	/** @restore: Partial restoration from backup state. TTM
>>> private */
>>> +	struct ttm_pool_tt_restore *restore;
>>>    };
>>>    
>>>    /**
>>> @@ -131,7 +146,7 @@ static inline bool ttm_tt_is_populated(struct
>>> ttm_tt *tt)
>>>    
>>>    static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
>>>    {
>>> -	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
>>> +	return tt->page_flags & (TTM_TT_FLAG_SWAPPED |
>>> TTM_TT_FLAG_PRIV_BACKED_UP);
>>>    }
>>>    
>>>    /**
>>> @@ -235,6 +250,21 @@ void ttm_tt_mgr_init(unsigned long num_pages,
>>> unsigned long num_dma32_pages);
>>>    struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
>>> ttm_kmap_iter_tt *iter_tt,
>>>    					    struct ttm_tt *tt);
>>>    unsigned long ttm_tt_pages_limit(void);
>>> +
>>> +/**
>>> + * struct ttm_backup_flags - Flags to govern backup behaviour.
>>> + * @purge: Free pages without backing up. Bypass pools.
>>> + * @writeback: Attempt to copy contents directly to swap space,
>>> even
>>> + * if that means blocking on writes to external memory.
>>> + */
>>> +struct ttm_backup_flags {
>>> +	u32 purge : 1;
>>> +	u32 writeback : 1;
>>> +};
>>> +
>>> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
>>> +		   const struct ttm_backup_flags flags);
>>> +
>>>    #if IS_ENABLED(CONFIG_AGP)
>>>    #include <linux/agp_backend.h>
>>>    

--------------KUkE7phiCBsOBg6pkvbjOkG0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.12.24 um 14:42 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 2024-12-03 at 14:12 +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 15.11.24 um 16:01 schrieb Thomas Hellström:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Provide a helper to shrink ttm_tt page-vectors on a per-page
basis. A ttm_backup backend could then in theory get away with
allocating a single temporary page for each struct ttm_tt.

This is accomplished by splitting larger pages before trying to
back them up.

In the future we could allow ttm_backup to handle backing up
large pages as well, but currently there's no benefit in
doing that, since the shmem backup backend would have to
split those anyway to avoid allocating too much temporary
memory, and if the backend instead inserts pages into the
swap-cache, those are split on reclaim by the core.

Due to potential backup- and recover errors, allow partially
swapped
out struct ttm_tt's, although mark them as swapped out stopping
them
from being swapped out a second time. More details in the
ttm_pool.c
DOC section.

v2:
- A couple of cleanups and error fixes in ttm_pool_back_up_tt.
- s/back_up/backup/
- Add a writeback parameter to the exported interface.
v8:
- Use a struct for flags for readability (Matt Brost)
- Address misc other review comments (Matt Brost)
v9:
- Update the kerneldoc for the ttm_tt::backup field.
v10:
- Rebase.
v13:
- Rebase on ttm_backup interface change. Update kerneldoc.
- Rebase and adjust ttm_tt_is_swapped().

Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Somalapuram Amaranath <a class="moz-txt-link-rfc2396E" href="mailto:Amaranath.Somalapuram@amd.com">&lt;Amaranath.Somalapuram@amd.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>
Signed-off-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
&nbsp; drivers/gpu/drm/ttm/ttm_pool.c | 396
+++++++++++++++++++++++++++++++--
&nbsp; drivers/gpu/drm/ttm/ttm_tt.c&nbsp;&nbsp; |&nbsp; 37 +++
&nbsp; include/drm/ttm/ttm_pool.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +
&nbsp; include/drm/ttm/ttm_tt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 32 ++-
&nbsp; 4 files changed, 457 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
b/drivers/gpu/drm/ttm/ttm_pool.c
index 8504dbe19c1a..f58864439edb 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -41,6 +41,7 @@
&nbsp; #include &lt;asm/set_memory.h&gt;
&nbsp; #endif
&nbsp; 
+#include &lt;drm/ttm/ttm_backup.h&gt;
&nbsp; #include &lt;drm/ttm/ttm_pool.h&gt;
&nbsp; #include &lt;drm/ttm/ttm_tt.h&gt;
&nbsp; #include &lt;drm/ttm/ttm_bo.h&gt;
@@ -58,6 +59,32 @@ struct ttm_pool_dma {
&nbsp;&nbsp;	unsigned long vaddr;
&nbsp; };
&nbsp; 
+/**
+ * struct ttm_pool_tt_restore - State representing restore from
backup
+ * @alloced_pages: Total number of already allocated pages for the
ttm_tt.
+ * @restored_pages: Number of (sub) pages restored from swap for
this
+ *		&nbsp;&nbsp;&nbsp;&nbsp; chunk of 1 &lt;&lt; @order pages.
+ * @first_page: The ttm page ptr representing for @old_pages[0].
+ * @caching_divide: Page pointer where subsequent pages are
cached.
+ * @old_pages: Backup copy of page pointers that were replaced by
the new
+ *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page allocation.
+ * @pool: The pool used for page allocation while restoring.
+ * @order: The order of the last page allocated while restoring.
+ *
+ * Recovery from backup might fail when we've recovered less than
the
+ * full ttm_tt. In order not to loose any data (yet), keep
information
+ * around that allows us to restart a failed ttm backup recovery.
+ */
+struct ttm_pool_tt_restore {
+	pgoff_t alloced_pages;
+	pgoff_t restored_pages;
+	struct page **first_page;
+	struct page **caching_divide;
+	struct ttm_pool *pool;
+	unsigned int order;
+	struct page *old_pages[];
+};
+
&nbsp; static unsigned long page_pool_size;
&nbsp; 
&nbsp; MODULE_PARM_DESC(page_pool_size, &quot;Number of pages in the
WC/UC/DMA pool&quot;);
@@ -354,11 +381,105 @@ static unsigned int
ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
&nbsp;&nbsp;	return p-&gt;private;
&nbsp; }
&nbsp; 
+/*
+ * To be able to insert single pages into backup directly,
+ * we need to split multi-order page allocations and make them
look
+ * like single-page allocations.
+ */
+static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct
page *p)
+{
+	unsigned int order = ttm_pool_page_order(pool, p);
+	pgoff_t nr;
+
+	if (!order)
+		return;
+
+	split_page(p, order);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
What exactly should split_page() do here and why is that necessary?

IIRC that function just updated the reference count and updated
things 
like page owner tracking and memcg accounting. Which should both be 
completely irrelevant here.

Or do you just do that so that you can free each page individually?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, exactly. Like For a 2MiB page we'd otherwise have to allocate 2MiB
of shmem backing storage, potentially from kernel reserves before we
could actually free anything. Since (currently) the shmem objects we
use are 4K-page only, this should make the process &quot;allocate shmem and
back up&quot; much less likely to deplete the kernel memory reserves.</pre>
    </blockquote>
    <br>
    Ah, yes that makes totally sense now.<br>
    <br>
    <blockquote type="cite" cite="mid:a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

Taking a step back and looking at potentially other solution, like
direct insertion into the swap cache, then even if inserting a 2MiB
page into the swap cache, vmscan would split it before writeback, and
still it didn't appear very stable. So inserting one 4K page at a time
seemed neccessary. If I were to take a guess that's why shmem, when
configured for 2MiB pages, like with i915, also splits the pages before
moving to swap-cache / writeback.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	nr = 1UL &lt;&lt; order;
+	while (nr--)
+		(p++)-&gt;private = 0;
+}
+
+/**
+ * DOC: Partial backup and restoration of a struct ttm_tt.
+ *
+ * Swapout using ttm_backup_backup_page() and swapin using
+ * ttm_backup_copy_page() may fail.
+ * The former most likely due to lack of swap-space or memory, the
latter due
+ * to lack of memory or because of signal interruption during
waits.
+ *
+ * Backup failure is easily handled by using a ttm_tt pages vector
that holds
+ * both swap entries and page pointers. This has to be taken into
account when
+ * restoring such a ttm_tt from backup, and when freeing it while
backed up.
+ * When restoring, for simplicity, new pages are actually
allocated from the
+ * pool and the contents of any old pages are copied in and then
the old pages
+ * are released.
+ *
+ * For restoration failures, the struct ttm_pool_tt_restore holds
sufficient state
+ * to be able to resume an interrupted restore, and that structure
is freed once
+ * the restoration is complete. If the struct ttm_tt is destroyed
while there
+ * is a valid struct ttm_pool_tt_restore attached, that is also
properly taken
+ * care of.
+ */
+
+static bool ttm_pool_restore_valid(const struct
ttm_pool_tt_restore *restore)
+{
+	return restore &amp;&amp; restore-&gt;restored_pages &lt; (1 &lt;&lt; restore-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">order);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+}
+
+static int ttm_pool_restore_tt(struct ttm_pool_tt_restore
*restore,
+			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_backup *backup,
+			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_operation_ctx *ctx)
+{
+	unsigned int i, nr = 1 &lt;&lt; restore-&gt;order;
+	int ret = 0;
+
+	if (!ttm_pool_restore_valid(restore))
+		return 0;
+
+	for (i = restore-&gt;restored_pages; i &lt; nr; ++i) {
+		struct page *p = restore-&gt;old_pages[i];
+
+		if (ttm_backup_page_ptr_is_handle(p)) {
+			unsigned long handle =
ttm_backup_page_ptr_to_handle(p);
+
+			if (handle == 0)
+				continue;
+
+			ret = ttm_backup_copy_page
+				(backup, restore-&gt;first_page[i],
+				 handle, ctx-&gt;interruptible);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That coding style looks really odd, I didn't even notice that it is a
function call initially.

Maybe put everything under the if into a separate function.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
At a minimum, I'll fix up the formatting here.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+			if (ret)
+				break;
+
+			ttm_backup_drop(backup, handle);
+		} else if (p) {
+			/*
+			 * We could probably avoid splitting the
old page
+			 * using clever logic, but ATM we don't
care, as
+			 * we prioritize releasing memory ASAP.
Note that
+			 * here, the old retained page is always
write-back
+			 * cached.
+			 */
+			ttm_pool_split_for_swap(restore-&gt;pool, p);
+			copy_highpage(restore-&gt;first_page[i], p);
+			__free_pages(p, 0);
+		}
+
+		restore-&gt;restored_pages++;
+		restore-&gt;old_pages[i] = NULL;
+		cond_resched();
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
There is a push to remove cond_resched(), see here: 
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/linux-mm/patch/20231107230822.371443-30-ankur.a.arora@oracle.com/">https://patchwork.kernel.org/project/linux-mm/patch/20231107230822.371443-30-ankur.a.arora@oracle.com/</a>

Not sure in which discussion that removal went, but IIRC we should
not 
add any new users of it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'll read up on that and remove if needed. I'm curious how / if
voluntary preemption is going to be handled.</pre>
    </blockquote>
    <br>
    I didn't fully understood it either, but the push kind of seems to
    be that drivers or in this cases subsystems are not supposed to mess
    with cond_resched() any more and just rely on preemptive kernels.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	}
+
+	return ret;
+}
+
&nbsp; /* Called when we got a page, either from a pool or newly
allocated */
&nbsp; static int ttm_pool_page_allocated(struct ttm_pool *pool,
unsigned int order,
&nbsp;&nbsp;				&nbsp;&nbsp; struct page *p, dma_addr_t
**dma_addr,
&nbsp;&nbsp;				&nbsp;&nbsp; unsigned long *num_pages,
-				&nbsp;&nbsp; struct page ***pages)
+				&nbsp;&nbsp; struct page ***pages,
+				&nbsp;&nbsp; struct ttm_pool_tt_restore
*restore)
&nbsp; {
&nbsp;&nbsp;	unsigned int i;
&nbsp;&nbsp;	int r;
@@ -369,6 +490,16 @@ static int ttm_pool_page_allocated(struct
ttm_pool *pool, unsigned int order,
&nbsp;&nbsp;			return r;
&nbsp;&nbsp;	}
&nbsp; 
+	if (restore) {
+		memcpy(restore-&gt;old_pages, *pages,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1 &lt;&lt; order) * sizeof(*restore-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">old_pages));
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+		memset(*pages, 0, (1 &lt;&lt; order) * sizeof(**pages));
+		restore-&gt;order = order;
+		restore-&gt;restored_pages = 0;
+		restore-&gt;first_page = *pages;
+		restore-&gt;alloced_pages += 1UL &lt;&lt; order;
+	}
+
&nbsp;&nbsp;	*num_pages -= 1 &lt;&lt; order;
&nbsp;&nbsp;	for (i = 1 &lt;&lt; order; i; --i, ++(*pages), ++p)
&nbsp;&nbsp;		**pages = p;
@@ -394,22 +525,39 @@ static void ttm_pool_free_range(struct
ttm_pool *pool, struct ttm_tt *tt,
&nbsp;&nbsp;				pgoff_t start_page, pgoff_t
end_page)
&nbsp; {
&nbsp;&nbsp;	struct page **pages = &amp;tt-&gt;pages[start_page];
+	struct ttm_backup *backup = tt-&gt;backup;
&nbsp;&nbsp;	unsigned int order;
&nbsp;&nbsp;	pgoff_t i, nr;
&nbsp; 
&nbsp;&nbsp;	for (i = start_page; i &lt; end_page; i += nr, pages += nr) {
&nbsp;&nbsp;		struct ttm_pool_type *pt = NULL;
+		struct page *p = *pages;
+
+		if (ttm_backup_page_ptr_is_handle(p)) {
+			unsigned long handle =
ttm_backup_page_ptr_to_handle(p);
+
+			nr = 1;
+			if (handle != 0)
+				ttm_backup_drop(backup, handle);
+			continue;
+		}
+
+		if (pool) {
+			order = ttm_pool_page_order(pool, p);
+			nr = (1UL &lt;&lt; order);
+			if (tt-&gt;dma_address)
+				ttm_pool_unmap(pool, tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">dma_address[i], nr);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp; 
-		order = ttm_pool_page_order(pool, *pages);
-		nr = (1UL &lt;&lt; order);
-		if (tt-&gt;dma_address)
-			ttm_pool_unmap(pool, tt-&gt;dma_address[i],
nr);
+			pt = ttm_pool_select_type(pool, caching,
order);
+		} else {
+			order = p-&gt;private;
+			nr = (1UL &lt;&lt; order);
+		}
&nbsp; 
-		pt = ttm_pool_select_type(pool, caching, order);
&nbsp;&nbsp;		if (pt)
-			ttm_pool_type_give(pt, *pages);
+			ttm_pool_type_give(pt, p);
&nbsp;&nbsp;		else
-			ttm_pool_free_page(pool, caching, order,
*pages);
+			ttm_pool_free_page(pool, caching, order,
p);
&nbsp;&nbsp;	}
&nbsp; }
&nbsp; 
@@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool *pool,
struct ttm_tt *tt,
&nbsp;&nbsp;	else
&nbsp;&nbsp;		gfp_flags |= GFP_HIGHUSER;
&nbsp; 
-	for (order = min_t(unsigned int, MAX_PAGE_ORDER,
__fls(num_pages));
-	&nbsp;&nbsp;&nbsp;&nbsp; num_pages;
-	&nbsp;&nbsp;&nbsp;&nbsp; order = min_t(unsigned int, order, __fls(num_pages)))
{
+	order = min_t(unsigned int, MAX_PAGE_ORDER,
__fls(num_pages));
+
+	if (tt-&gt;page_flags &amp; TTM_TT_FLAG_PRIV_BACKED_UP) {
+		if (!tt-&gt;restore) {
+			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
+
+			if (ctx-&gt;gfp_retry_mayfail)
+				gfp |= __GFP_RETRY_MAYFAIL;
+
+			tt-&gt;restore =
+				kvzalloc(struct_size(tt-&gt;restore,
old_pages,
+						&nbsp;&nbsp;&nbsp;&nbsp; (size_t)1 &lt;&lt;
order), gfp);
+			if (!tt-&gt;restore)
+				return -ENOMEM;
+		} else if (ttm_pool_restore_valid(tt-&gt;restore)) {
+			struct ttm_pool_tt_restore *restore = tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">restore;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+
+			num_pages -= restore-&gt;alloced_pages;
+			order = min_t(unsigned int, order,
__fls(num_pages));
+			pages += restore-&gt;alloced_pages;
+			r = ttm_pool_restore_tt(restore, tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">backup, ctx);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+			if (r)
+				return r;
+			caching = restore-&gt;caching_divide;
+		}
+
+		tt-&gt;restore-&gt;pool = pool;
+	}
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hui? Why is that part of the allocation function now?

At bare minimum I would expect that this is a new function.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's because we now have partially backed up tts, so the restore is
interleaved on a per-page basis, replacing the backup handles with
page-pointers. I'll see if I can separate out at least the
initialization here.</pre>
    </blockquote>
    <br>
    Yeah, that kind of makes sense.<br>
    <br>
    My expectation was just that we now have explicit ttm_pool_swapout()
    and ttm_pool_swapin() functions.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+	for (; num_pages; order = min_t(unsigned int, order,
__fls(num_pages))) {
&nbsp;&nbsp;		struct ttm_pool_type *pt;
&nbsp; 
&nbsp;&nbsp;		page_caching = tt-&gt;caching;
@@ -472,11 +647,19 @@ int ttm_pool_alloc(struct ttm_pool *pool,
struct ttm_tt *tt,
&nbsp;&nbsp;				r = ttm_pool_page_allocated(pool,
order, p,
&nbsp;&nbsp;							&nbsp;&nbsp;&nbsp;
&amp;dma_addr,
&nbsp;&nbsp;							&nbsp;&nbsp;&nbsp;
&amp;num_pages,
-							&nbsp;&nbsp;&nbsp;
&amp;pages);
+							&nbsp;&nbsp;&nbsp;
&amp;pages,
+							&nbsp;&nbsp;&nbsp; tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">restore);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">&nbsp;&nbsp;				if (r)
&nbsp;&nbsp;					goto error_free_page;
&nbsp; 
&nbsp;&nbsp;				caching = pages;
+				if (ttm_pool_restore_valid(tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">restore)) {
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+					r =
ttm_pool_restore_tt(tt-&gt;restore, tt-&gt;backup,
+								ct
x);
+					if (r)
+						goto
error_free_all;
+				}
+
&nbsp;&nbsp;				if (num_pages &lt; (1 &lt;&lt; order))
&nbsp;&nbsp;					break;
&nbsp; 
@@ -496,9 +679,17 @@ int ttm_pool_alloc(struct ttm_pool *pool,
struct ttm_tt *tt,
&nbsp;&nbsp;				caching = pages;
&nbsp;&nbsp;			}
&nbsp;&nbsp;			r = ttm_pool_page_allocated(pool, order,
p, &amp;dma_addr,
-						&nbsp;&nbsp;&nbsp; &amp;num_pages,
&amp;pages);
+						&nbsp;&nbsp;&nbsp; &amp;num_pages,
&amp;pages,
+						&nbsp;&nbsp;&nbsp; tt-&gt;restore);
&nbsp;&nbsp;			if (r)
&nbsp;&nbsp;				goto error_free_page;
+
+			if (ttm_pool_restore_valid(tt-&gt;restore)) {
+				r = ttm_pool_restore_tt(tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">restore, tt-&gt;backup, ctx);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+				if (r)
+					goto error_free_all;
+			}
+
&nbsp;&nbsp;			if (PageHighMem(p))
&nbsp;&nbsp;				caching = pages;
&nbsp;&nbsp;		}
@@ -517,12 +708,26 @@ int ttm_pool_alloc(struct ttm_pool *pool,
struct ttm_tt *tt,
&nbsp;&nbsp;	if (r)
&nbsp;&nbsp;		goto error_free_all;
&nbsp; 
+	if (tt-&gt;restore) {
+		kvfree(tt-&gt;restore);
+		tt-&gt;restore = NULL;
+	}
+
+	if (tt-&gt;page_flags &amp; TTM_TT_FLAG_PRIV_BACKED_UP)
+		tt-&gt;page_flags &amp;= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
+				&nbsp;&nbsp;&nbsp; TTM_TT_FLAG_SWAPPED);
+
&nbsp;&nbsp;	return 0;
&nbsp; 
&nbsp; error_free_page:
&nbsp;&nbsp;	ttm_pool_free_page(pool, page_caching, order, p);
&nbsp; 
&nbsp; error_free_all:
+	if (tt-&gt;page_flags &amp; TTM_TT_FLAG_PRIV_BACKED_UP) {
+		tt-&gt;restore-&gt;caching_divide = caching;
+		return r;
+	}
+
&nbsp;&nbsp;	num_pages = tt-&gt;num_pages - num_pages;
&nbsp;&nbsp;	caching_divide = caching - tt-&gt;pages;
&nbsp;&nbsp;	ttm_pool_free_range(pool, tt, tt-&gt;caching, 0,
caching_divide);
@@ -549,6 +754,171 @@ void ttm_pool_free(struct ttm_pool *pool,
struct ttm_tt *tt)
&nbsp; }
&nbsp; EXPORT_SYMBOL(ttm_pool_free);
&nbsp; 
+/**
+ * ttm_pool_release_backed_up() - Release content of a swapped-out
struct ttm_tt
+ * @tt: The struct ttm_tt.
+ *
+ * Release handles with associated content or any remaining pages
of
+ * a backed-up struct ttm_tt.
+ */
+void ttm_pool_release_backed_up(struct ttm_tt *tt)
+{
+	struct ttm_backup *backup = tt-&gt;backup;
+	struct ttm_pool_tt_restore *restore;
+	pgoff_t i, start_page = 0;
+	unsigned long handle;
+
+	if (!(tt-&gt;page_flags &amp; TTM_TT_FLAG_PRIV_BACKED_UP))
+		return;
+
+	restore = tt-&gt;restore;
+
+	if (ttm_pool_restore_valid(restore)) {
+		pgoff_t nr = 1UL &lt;&lt; restore-&gt;order;
+
+		for (i = restore-&gt;restored_pages; i &lt; nr; ++i) {
+			struct page *p = restore-&gt;old_pages[i];
+
+			if (ttm_backup_page_ptr_is_handle(p)) {
+				handle =
ttm_backup_page_ptr_to_handle(p);
+				if (handle == 0)
+					continue;
+
+				ttm_backup_drop(backup, handle);
+			} else if (p) {
+				ttm_pool_split_for_swap(restore-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">pool, p);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+				__free_pages(p, 0);
+			}
+		}
+	}
+
+	if (restore) {
+		pgoff_t mid = restore-&gt;caching_divide - tt-&gt;pages;
+
+		start_page = restore-&gt;alloced_pages;
+		/* Pages that might be dma-mapped and non-cached
*/
+		ttm_pool_free_range(restore-&gt;pool, tt, tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">caching,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+				&nbsp;&nbsp;&nbsp; 0, mid);
+		/* Pages that might be dma-mapped but cached */
+		ttm_pool_free_range(restore-&gt;pool, tt, ttm_cached,
+				&nbsp;&nbsp;&nbsp; mid, restore-&gt;alloced_pages);
+	}
+
+	/* Shrunken pages. Cached and not dma-mapped. */
+	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">num_pages);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+
+	if (restore) {
+		kvfree(restore);
+		tt-&gt;restore = NULL;
+	}
+
+	tt-&gt;page_flags &amp;= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
TTM_TT_FLAG_SWAPPED);
+}
+
+/**
+ * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
+ * @pool: The pool used when allocating the struct ttm_tt.
+ * @ttm: The struct ttm_tt.
+ * @flags: Flags to govern the backup behaviour.
+ *
+ * Back up or purge a struct ttm_tt. If @purge is true, then
+ * all pages will be freed directly to the system rather than to
the pool
+ * they were allocated from, making the function behave similarly
to
+ * ttm_pool_free(). If @purge is false the pages will be backed up
instead,
+ * exchanged for handles.
+ * A subsequent call to ttm_pool_alloc() will then read back the
content and
+ * a subsequent call to ttm_pool_release_shrunken() will drop it.
+ * If backup of a page fails for whatever reason, @ttm will still
be
+ * partially backed up, retaining those pages for which backup
fails.
+ *
+ * Return: Number of pages actually backed up or freed, or
negative
+ * error code on error.
+ */
+long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
+			const struct ttm_backup_flags *flags)
+{
+	struct ttm_backup *backup = ttm-&gt;backup;
+	struct page *page;
+	unsigned long handle;
+	gfp_t alloc_gfp;
+	gfp_t gfp;
+	int ret = 0;
+	pgoff_t shrunken = 0;
+	pgoff_t i, num_pages;
+
+	if ((!ttm_backup_bytes_avail() &amp;&amp; !flags-&gt;purge) ||
+	&nbsp;&nbsp;&nbsp; pool-&gt;use_dma_alloc ||
+	&nbsp;&nbsp;&nbsp; (ttm-&gt;page_flags &amp; TTM_TT_FLAG_PRIV_BACKED_UP))
+		return -EBUSY;
+
+#ifdef CONFIG_X86
+	/* Anything returned to the system needs to be cached. */
+	if (ttm-&gt;caching != ttm_cached)
+		set_pages_array_wb(ttm-&gt;pages, ttm-&gt;num_pages);
+#endif
+
+	if (ttm-&gt;dma_address || flags-&gt;purge) {
+		for (i = 0; i &lt; ttm-&gt;num_pages; i += num_pages) {
+			unsigned int order;
+
+			page = ttm-&gt;pages[i];
+			if (unlikely(!page)) {
+				num_pages = 1;
+				continue;
+			}
+
+			order = ttm_pool_page_order(pool, page);
+			num_pages = 1UL &lt;&lt; order;
+			if (ttm-&gt;dma_address)
+				ttm_pool_unmap(pool, ttm-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">dma_address[i],
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_pages);
+			if (flags-&gt;purge) {
+				shrunken += num_pages;
+				page-&gt;private = 0;
+				__free_pages(page, order);
+				memset(ttm-&gt;pages + i, 0,
+				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_pages * sizeof(*ttm-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">pages));
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+			}
+		}
+	}
+
+	if (flags-&gt;purge)
+		return shrunken;
+
+	if (pool-&gt;use_dma32)
+		gfp = GFP_DMA32;
+	else
+		gfp = GFP_HIGHUSER;
+
+	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
__GFP_RETRY_MAYFAIL;
+
+	for (i = 0; i &lt; ttm-&gt;num_pages; ++i) {
+		page = ttm-&gt;pages[i];
+		if (unlikely(!page))
+			continue;
+
+		ttm_pool_split_for_swap(pool, page);
+
+		handle = ttm_backup_backup_page(backup, page,
flags-&gt;writeback, i,
+						gfp, alloc_gfp);
+		if (handle) {
+			ttm-&gt;pages[i] =
ttm_backup_handle_to_page_ptr(handle);
+			put_page(page);
+			shrunken++;
+		} else {
+			/* We allow partially shrunken tts */
+			ret = -ENOMEM;
+			break;
+		}
+	}
+
+	if (shrunken)
+		ttm-&gt;page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
+				&nbsp;&nbsp;&nbsp; TTM_TT_FLAG_SWAPPED);
+
+	return shrunken ? shrunken : ret;
+}
+
&nbsp; /**
&nbsp;&nbsp; * ttm_pool_init - Initialize a pool
&nbsp;&nbsp; *
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
b/drivers/gpu/drm/ttm/ttm_tt.c
index 3baf215eca23..dd4eabe4ad79 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -40,6 +40,7 @@
&nbsp; #include &lt;drm/drm_cache.h&gt;
&nbsp; #include &lt;drm/drm_device.h&gt;
&nbsp; #include &lt;drm/drm_util.h&gt;
+#include &lt;drm/ttm/ttm_backup.h&gt;
&nbsp; #include &lt;drm/ttm/ttm_bo.h&gt;
&nbsp; #include &lt;drm/ttm/ttm_tt.h&gt;
&nbsp; 
@@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt
*ttm,
&nbsp;&nbsp;	ttm-&gt;swap_storage = NULL;
&nbsp;&nbsp;	ttm-&gt;sg = bo-&gt;sg;
&nbsp;&nbsp;	ttm-&gt;caching = caching;
+	ttm-&gt;restore = NULL;
+	ttm-&gt;backup = NULL;
&nbsp; }
&nbsp; 
&nbsp; int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -182,6 +185,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
&nbsp;&nbsp;		fput(ttm-&gt;swap_storage);
&nbsp;&nbsp;	ttm-&gt;swap_storage = NULL;
&nbsp; 
+	ttm_pool_release_backed_up(ttm);
+	if (ttm-&gt;backup) {
+		ttm_backup_fini(ttm-&gt;backup);
+		ttm-&gt;backup = NULL;
+	}
+
&nbsp;&nbsp;	if (ttm-&gt;pages)
&nbsp;&nbsp;		kvfree(ttm-&gt;pages);
&nbsp;&nbsp;	else
@@ -253,6 +262,34 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
&nbsp; }
&nbsp; EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
&nbsp; 
+/**
+ * ttm_tt_backup() - Helper to back up a struct ttm_tt.
+ * @bdev: The TTM device.
+ * @tt: The struct ttm_tt.
+ * @flags: Flags that govern the backup behaviour.
+ *
+ * Update the page accounting and call ttm_pool_shrink_tt to free
pages
+ * or back them up.
+ *
+ * Return: Number of pages freed or swapped out, or negative error
code on
+ * error.
+ */
+long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
+		&nbsp;&nbsp; const struct ttm_backup_flags flags)
+{
+	long ret;
+
+	if (WARN_ON(IS_ERR_OR_NULL(tt-&gt;backup)))
+		return 0;
+
+	ret = ttm_pool_backup_tt(&amp;bdev-&gt;pool, tt, &amp;flags);
+
+	if (ret &gt; 0)
+		tt-&gt;page_flags &amp;= ~TTM_TT_FLAG_PRIV_POPULATED;
+
+	return ret;
+}
+
&nbsp; /**
&nbsp;&nbsp; * ttm_tt_swapout - swap out tt object
&nbsp;&nbsp; *
diff --git a/include/drm/ttm/ttm_pool.h
b/include/drm/ttm/ttm_pool.h
index 160d954a261e..3112a4be835c 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -33,6 +33,7 @@
&nbsp; 
&nbsp; struct device;
&nbsp; struct seq_file;
+struct ttm_backup_flags;
&nbsp; struct ttm_operation_ctx;
&nbsp; struct ttm_pool;
&nbsp; struct ttm_tt;
@@ -89,6 +90,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
&nbsp; 
&nbsp; int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
&nbsp; 
+void ttm_pool_release_backed_up(struct ttm_tt *tt);
+
+long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
+			const struct ttm_backup_flags *flags);
+
&nbsp; int ttm_pool_mgr_init(unsigned long num_pages);
&nbsp; void ttm_pool_mgr_fini(void);
&nbsp; 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 991edafdb2dd..6ca2fc7b2a26 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -32,11 +32,13 @@
&nbsp; #include &lt;drm/ttm/ttm_caching.h&gt;
&nbsp; #include &lt;drm/ttm/ttm_kmap_iter.h&gt;
&nbsp; 
+struct ttm_backup;
&nbsp; struct ttm_device;
&nbsp; struct ttm_tt;
&nbsp; struct ttm_resource;
&nbsp; struct ttm_buffer_object;
&nbsp; struct ttm_operation_ctx;
+struct ttm_pool_tt_restore;
&nbsp; 
&nbsp; /**
&nbsp;&nbsp; * struct ttm_tt - This is a structure holding the pages,
caching- and aperture
@@ -88,6 +90,9 @@ struct ttm_tt {
&nbsp;&nbsp;	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
USE. This is
&nbsp;&nbsp;	 * set by TTM after ttm_tt_populate() has successfully
returned, and is
&nbsp;&nbsp;	 * then unset when TTM calls ttm_tt_unpopulate().
+	 *
+	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is
set if the
+	 * struct ttm_tt has been (possibly partially) backed up.
&nbsp;&nbsp;	 */
&nbsp; #define TTM_TT_FLAG_SWAPPED		BIT(0)
&nbsp; #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
@@ -96,6 +101,7 @@ struct ttm_tt {
&nbsp; #define TTM_TT_FLAG_DECRYPTED		BIT(4)
&nbsp; 
&nbsp; #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
+#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
&nbsp;&nbsp;	uint32_t page_flags;
&nbsp;&nbsp;	/** @num_pages: Number of pages in the page array. */
&nbsp;&nbsp;	uint32_t num_pages;
@@ -105,11 +111,20 @@ struct ttm_tt {
&nbsp;&nbsp;	dma_addr_t *dma_address;
&nbsp;&nbsp;	/** @swap_storage: Pointer to shmem struct file for swap
storage. */
&nbsp;&nbsp;	struct file *swap_storage;
+	/**
+	 * @backup: Pointer to backup struct for backed up tts.
+	 * Could be unified with @swap_storage. Meanwhile, the
driver's
+	 * ttm_tt_create() callback is responsible for assigning
+	 * this field.
+	 */
+	struct ttm_backup *backup;
&nbsp;&nbsp;	/**
&nbsp;&nbsp;	 * @caching: The current caching state of the pages, see
enum
&nbsp;&nbsp;	 * ttm_caching.
&nbsp;&nbsp;	 */
&nbsp;&nbsp;	enum ttm_caching caching;
+	/** @restore: Partial restoration from backup state. TTM
private */
+	struct ttm_pool_tt_restore *restore;
&nbsp; };
&nbsp; 
&nbsp; /**
@@ -131,7 +146,7 @@ static inline bool ttm_tt_is_populated(struct
ttm_tt *tt)
&nbsp; 
&nbsp; static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
&nbsp; {
-	return tt-&gt;page_flags &amp; TTM_TT_FLAG_SWAPPED;
+	return tt-&gt;page_flags &amp; (TTM_TT_FLAG_SWAPPED |
TTM_TT_FLAG_PRIV_BACKED_UP);
&nbsp; }
&nbsp; 
&nbsp; /**
@@ -235,6 +250,21 @@ void ttm_tt_mgr_init(unsigned long num_pages,
unsigned long num_dma32_pages);
&nbsp; struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
ttm_kmap_iter_tt *iter_tt,
&nbsp;&nbsp;					&nbsp;&nbsp;&nbsp; struct ttm_tt *tt);
&nbsp; unsigned long ttm_tt_pages_limit(void);
+
+/**
+ * struct ttm_backup_flags - Flags to govern backup behaviour.
+ * @purge: Free pages without backing up. Bypass pools.
+ * @writeback: Attempt to copy contents directly to swap space,
even
+ * if that means blocking on writes to external memory.
+ */
+struct ttm_backup_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+};
+
+long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
+		&nbsp;&nbsp; const struct ttm_backup_flags flags);
+
&nbsp; #if IS_ENABLED(CONFIG_AGP)
&nbsp; #include &lt;linux/agp_backend.h&gt;
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

--------------KUkE7phiCBsOBg6pkvbjOkG0--
