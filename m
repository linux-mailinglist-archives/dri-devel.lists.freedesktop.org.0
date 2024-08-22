Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95EE95B64C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CC910EA80;
	Thu, 22 Aug 2024 13:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0yL6zEt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4200710EA80
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:19:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSAXTufK2Nu2tMpM+4DV4+QmiNo5S2gFa887iMHuC3Xh2D3rnL4OQWLHvLP5M5/YaZuAPnkVDYRfNqaorsRobbC/WkprPkV7r3Df4TAgdKpWJzfIjBcV43KzLOqSNmGvwumWbh3iuShZr57v8JdCtRheDPnuWxY/v5j+mHwqxeXzk3DObs9OZrXEbiWqZU44ek0xdwvKtouxAh05vhbrAELv052/8IqT6eiV/qlYV3rBYopZPcWe9I8u9qLlPjtYTHL98IbA9WpAlMlFAk3ScmoHimTefjmDl/WvWDve8zTgnfcUii+AmVDAKNLiu0g9c75/KO2w2XJK28ldaCJodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivjdFVAku+dlaGlC34wMrPsJlmtk+Zk5RbMvt2rjAg8=;
 b=ndhCG9XvfgQRRnnWIHXiFdCtflaYOij3KauYmuMbSm2jZ7s2jKkhcfDNlQW/dS6L18Xbrf2f/uQ7wI+UXDR8RGcZpVzMO5JMYnX0Fb6t25Vba1vUp0BIMzq2lyPBtoRsgFw7vRbb8enXHm9CDo6o7OZgBbu0/GiTv6YVCsJ8gxtK+sei0eZPVoDUjVCS+NtuLOLVpUI5IVVaU6AUmW0hlzMehkvYc3fwRpoErj61mRSJa6M2aM+5W+0tP6mV2g/l5uuNTpZb+njN7DFHgWNo6v1jde/a3BIJF8n25W11VLV3yifLU8NteczndZ1spdjDqlpKN3bbp3jmV2J8ug+Dfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivjdFVAku+dlaGlC34wMrPsJlmtk+Zk5RbMvt2rjAg8=;
 b=0yL6zEt0LHVDbZp5gk5n2hpdA+z0iM3g5fFxYx3AYrJytBtzxisBSiULZk8xEzaB8eLuSdcJ2Li2Z1TbF90PIbGTuW8Lve74XFqn0RUX73lhRoMGWo5CDPhtLBDpt1irTfpF9jke4yVubFXX5Xo+Rd9W1bBEhn73kljJVklUrFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 13:19:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 13:19:35 +0000
Content-Type: multipart/alternative;
 boundary="------------0rCoIduWithmVw2YW4O69lYn"
Message-ID: <3afe3ab2-4a58-49a9-acd7-c989980c68f2@amd.com>
Date: Thu, 22 Aug 2024 15:19:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <ZscDox5KoiNHXxne@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZscDox5KoiNHXxne@phenom.ffwll.local>
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: f35b6581-00d6-400e-3348-08dcc2ad116b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmk5UUJYOVBja0lPb1hMLzRuRlRCaUEyU2NFVEhvVlRtVDQyM2RTbnlDTDdE?=
 =?utf-8?B?OVE4MVF1Q2w4b05LSm5GZnM5c1VIbXJlQjZ0R0hqb1hCMjFzUUpKWnpxVFhi?=
 =?utf-8?B?bGdmSTI1cEJ1LzU0cDBKUksvYXk0YW1OQ1JlN0d0RU1keVBlUC9DZzJuY1NN?=
 =?utf-8?B?eEdMVDJTNjRETklTSkwxcVNXSHJjNG1BZXBycFlNNlNYUDN3TG5zVmdEM3FP?=
 =?utf-8?B?T2RjNjFWU0NsZUIrV2JOSzlYZHFtMEhMN2ZjcDRlb0xFc2JTaVI0bXlRNFBS?=
 =?utf-8?B?VHJrZnFWYVU0VnF1WDR6YmtGcVY1ams4MGhPRXppL205ZDByRytMak1QcDZp?=
 =?utf-8?B?SUhKVUo3SzExY254Q1FCWW5NR1Y1YzZGbU5DZDRyUTA3UmxPdlRXY0hzd05m?=
 =?utf-8?B?RWEzWTliT2FzeitHNFQ4R0RUbVFCUWR6b24yRHE0bGRQdzRpZjM2WE9YZmpE?=
 =?utf-8?B?UE5XK0ptYWhBSm9RWnB5bkMwZ0NZYXBycmIxUHFvMDZlKzUyQVg3d1pLVzdR?=
 =?utf-8?B?cGYzYUc1Tm80UTJIQ2wrcUswTFcrbTJNaFJFUmE1VGV4cmVybDlLOVYzRVBO?=
 =?utf-8?B?MURsWXI2ODZaTzhnVGZNV0Y4S3c0bDBmWm8zb3ZZcW1DaTUrbWNjNWl6bW9X?=
 =?utf-8?B?UFU1R3lpSkRzUUVLTmoxcld5VlJoaE5xcm54eHZPTGZocGlvdDcwLzBEbUZv?=
 =?utf-8?B?UHpNdGZ4VUJydElIL094NTJTdlFwMzJJZWlNYzRrbHZRZ00rYWxMN3hpRlU0?=
 =?utf-8?B?bkdlb0JGL3c5MSs2dXY2ZG1ESWJGVFFKSGxrdDhndFlDMFdNRi8zUGVYSTFF?=
 =?utf-8?B?UWZjVXYzZXJLV1ZOSFIzMSt5S3VuczJNaEdjdkxTcnNlUStVYmgwMm5uWnov?=
 =?utf-8?B?cExTaWZDQjJ2R1dERXFWMzVTb255c1VpUTBwUFZnQTZKYXZFQ1dVTHEzUndC?=
 =?utf-8?B?b1hlTFR4TUtXVWpCWElnNWNSUVVUakFuZ2M1am0wRzIxRVk2eXlXbS9DU0gx?=
 =?utf-8?B?M3lmb0NFd1c0cS96ZXdML3piQ0R4UVBrYjZsMFgzTmtwalJmbmNldVJlZEpR?=
 =?utf-8?B?czF2T2Yrc2k2ZmVyQUppWlZDaHFCTGZId3JDdVpvOGx1THlSR3ZLV25VeE56?=
 =?utf-8?B?MTdNVVo3aGFkOHJ3eUtEVGtvMHJIMk5PRCsxcUtRVFlOS3N1K2N5RjJQdXRZ?=
 =?utf-8?B?dmRjQVUxcnl5SjVWYlF2T3lFS0xGRkk0UEl2R2lUSHBLcExZNURqZ2hLNnl6?=
 =?utf-8?B?Y3hXdzN2b1J5R1VwenZUYk0rWkl2aHJoQ25TZ1BEVWpNL3g1QTNmZUg2em5l?=
 =?utf-8?B?S2tId2xrQklETHJ4K1RrZyszU2RWTE5CQTFxRUxNUCtFUGJvZkxtMExCaWxY?=
 =?utf-8?B?eS8xUUZtVXRtREgwYXNVQUIyS3ArTmNOUkFEL1JUNVROU2RYMk9weEpaZXk0?=
 =?utf-8?B?M3Y4ek5XdEVGRXB3aHJWNFJPN20xSFZqZWM2dzlpOXFUQlFLb0FzbzBSenBl?=
 =?utf-8?B?akw4TlBhMEJ4Smh0UWcyTXFGUnREODJLSzVHLzdVMnFYUTVCUm5WTm1aZHlP?=
 =?utf-8?B?bFRpTGFSRUEwbDJmcTNKVDYrUW9hQXZpQ2ppWURxd0pZZUtHRnBaNHM1dmVs?=
 =?utf-8?B?OHNIMkJWZ1RRc1g2dXRrMVBEdmo1SzNMdGY2V0VJYW9ic0pLaUIzWTN6YVht?=
 =?utf-8?B?Q3VRRVlrb0JUUHBPayt4aWZNc3k4bnFsczJ6b2FBVUJLUlB4Sm5vWlNHQmd0?=
 =?utf-8?B?K0UyR3VEOFVTSnRLV3NuUmUzUVhCVUp3bVdSaFdFamVoTEwwRnBoV1pBUmlU?=
 =?utf-8?B?WlFkWEE5MlhsVzJPTHE2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzFQazhWVm1DaG1RbEQ0Q3Y2L1hmdndybDM2K1E4SVBWY0krUG9YcFJrenQz?=
 =?utf-8?B?M0pqNC9vZGtpY2g2dllXSUNLbUVOT2tDbE9OVDhTeXZDa1ZabFdySzdsZ3A1?=
 =?utf-8?B?MytIK3FUY09CYTl2V0xYTldvTVgzTzVmekRreE91RTE2dVB1WFd1eGsxd1BL?=
 =?utf-8?B?NEhsaG9QMzJSbkRqZitlRmt3VlR0TVIxbU5zeGNsYm9NUGFwK0hzeUp2bUNQ?=
 =?utf-8?B?REYxOUJsdU41TkFCbGZtOWh2K0NLSGw3YXlyVHVLU2FwSW95azJVMXhHUTJ1?=
 =?utf-8?B?TnBqMEZYUVF2Tzh1YjBINVU2cU9zVk96dlZZL0N4dGU2NFI3UmNDMWsvazZq?=
 =?utf-8?B?alBQZDNrb29RT1dTZllGWkRFOE9nemV6US9TelNMQTZJYjM5bEFWazU1WUov?=
 =?utf-8?B?UmtKOVFiNUh5VFg5QkVTRGVkWlJEZ3hzRGwxYlR5UkN5akhzSzFlSkZCdFVj?=
 =?utf-8?B?YkwyTlJhYnRCM3Z1Lzl4Wjgrc3AyaWV0aTFJZUtLUldHMCtUbkxoaVYzN3Jj?=
 =?utf-8?B?UnEveXRyZ1ZCeHJSQ2hScUc0cUpCRWE2cmJ4cG8wUUNlcjlFaVdFWTkwQnZQ?=
 =?utf-8?B?OWF1M3BiWCtnZGI3MG1TSVk5T0w0THhPeGZuUlRlUDdGd29GMzQ2ci9paC94?=
 =?utf-8?B?cEVVb2lKT3MvYVNwc0w1Q1l3T0l0U0hleWJIb0RoRmdONDJZaHRIZkNQUW9G?=
 =?utf-8?B?cjlsWkVNc1habEdwNjZsb2UwUk0zU0ZtZDNYa0kzdmRIWGROY1h1NDVZRVlh?=
 =?utf-8?B?WXdCdnNuMk8zaDhncjgxOVdtMlc4TFFZWS8vTUxYcEF4NjM3YkQ0YXNmbWpk?=
 =?utf-8?B?bVRFSW5OczFXMTkrRmxhaGluZHU3MHlOZkxqYThWejY5cTZGc0tCcUxBK2ph?=
 =?utf-8?B?aE1obHAreGZtbEsrOE1XeFh3MkRES2hFb3ZuZyszcXZmRXJ6WWdYbFNpWHY0?=
 =?utf-8?B?bHZyc2x1Um9MNHlIM1lWbVd4YlFxekp5Nm9Ibk8yaHBjRG9oQnBHVFBkdHFG?=
 =?utf-8?B?cG5teTJjNHpBYjM4bFkzUU5UTXc1UHRPTExGWFllTXZucHh3NFNjang2Uzdn?=
 =?utf-8?B?OWcwL1hxa1hjcjRvYW5mM2pST1g3dUpBYU9UaEJFanpaNjE0eEp6d0dTdjFz?=
 =?utf-8?B?ZnZBTWpYNExNZE9uVTkvcWN1YkpZeUxFR0hSTE1qRkw0eGFBWFBGeUVNWGpi?=
 =?utf-8?B?UkJIQnpPOEJoRS9zL203azdlVWlLdmtDcEtmdStNZS92WVFoTVJ2MlMzNlg0?=
 =?utf-8?B?c0w2UDBNNUFTNTg1bG9EWTR2NlJMZEpYTEUwZmZMdGtaS2lQd0JjaW1TOU8w?=
 =?utf-8?B?SUpRWGhwZE9VVE94VmlzYk1Wa3cxYlYwRWNYaHJxZXEyZnkzS3NYeTQ4QXRG?=
 =?utf-8?B?RGZnV1diQ0FMcTFQRWR5cER6aksrd1NsN1UzWkFiSlM0R3BIMWJ5cnRyUlo0?=
 =?utf-8?B?QzNmVzF0NWUvV1lpV1E0Qlc2MDNZajRVVWxkK1VRT2xUQ2poWWJJVmdxcGVC?=
 =?utf-8?B?WVp5azJpYy9rV0pTVFM5cmZTMzk3ODI0cVVaUDhMN1Uvb09yOWUvSXNTak1i?=
 =?utf-8?B?SjRybGY4Nm5CNnNWcGdmV01XMDhma2toOTJLd283WVdPUm5mNWRVbHI5alhZ?=
 =?utf-8?B?TlRMYUF4bHB6UUg0d2pmUldNSVo4WjdKSDFnTThjUXJmbUtMOUhISGlLc1cz?=
 =?utf-8?B?LzFPY0xybVFneFhKc3NXdmNteHdBT1VyODRSajkvSDFlczlLS1pFUm9sR04z?=
 =?utf-8?B?c0J2S3QrWkwyd0U5RDk2bTlMYk92MGdlQTNZUndXM1hnZFI2ejFCQjZYSXJD?=
 =?utf-8?B?RW5vdThzYjg3Q3JIbXZVbG9FY1l1aDJIcW1pUmV5WWs1alNkakdKS2duUEw5?=
 =?utf-8?B?Zmg0SHcvdjI3WkxTZFU1ekprZ1laMHAvalBGR201RFZwY0NnU2lTb29RdlY0?=
 =?utf-8?B?VDgyWnlqQUQwYVpqbEF0K0dCQXpqQlpRU0FjRzlNRFFNYVg0ZVE0eTMySFlP?=
 =?utf-8?B?VWM4c3lUeWc2eUcrWjlFWk5NSXMwdUV3YWd4aDNOcEdhZG1uWENvTXIrNWxW?=
 =?utf-8?B?QkJTZXcxL1c4VEg0UkJwN3F3UTlacjYwakF0Q1p1dHA3b1ZiSWJVTlNWaTUy?=
 =?utf-8?Q?zso4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35b6581-00d6-400e-3348-08dcc2ad116b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:19:35.8717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGSghXjzAkfYkmu0kv8aHO5XaaZ4yQoe0luZqwUeWIm6yinOnuNRsmuY4kcpTQCL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
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

--------------0rCoIduWithmVw2YW4O69lYn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.08.24 um 11:23 schrieb Daniel Vetter:
> On Wed, Aug 21, 2024 at 10:14:34AM +0200, Christian König wrote:
>> Am 20.08.24 um 18:00 schrieb Thomas Hellström:
>>>> Or why exactly should shrinking fail?
>>> A common example would be not having runtime pm and the particular bo
>>> needs it to unbind, we want to try the next bo. Example: i915 GGTT
>>> bound bos and Lunar Lake PL_TT bos.
>> WHAT? So you basically block shrinking BOs because you can't unbind them
>> because the device is powered down?
> Yes. amdgpu does the same btw :-)

Well, amdgpu wouldn't block shrinking as far as I know.

When the GPU is powered down all fences are signaled and things like 
GART unbinding is just postponed until the GPU wakes up again.

> It's a fairly fundamental issue of rpm on discrete gpus, or anything that
> looks a lot like a discrete gpu. The deadlock scenario is roughly:
>
> - In runtime suspend you need to copy any bo out of vram into system ram
>    before you power the gpu. This requires bo and ttm locks.
>
> - You can't just avoid this by holding an rpm reference as long as any bo
>    is still in vram, because that defacto means you'll never autosuspend at
>    runtime. Plus most real hw is complex enough that you have some driver
>    objects that you need to throw out or recreate, so in practice no way to
>    avoid all this.
>
> - runtime resume tends to be easier and mostly doable without taking bo
>    and ttm locks, because by design you know no one else can possibly have
>    any need to get at the gpu hw - it was all powered off after all. It's
>    still messy, but doable.
>
> - Unfortunately this doesn't help, because your runtime resume might need
>    to wait for a in-progress suspend operation to complete. Which means you
>    still deadlock even if your resume path has entirely reasonable locking.

Uff, yeah that totally confirms my gut feeling that this looked really 
questionable.

> On integrated you can mostly avoid this all because there's no need to
> swap out bo to system memory, they're there already. Exceptions like the
> busted coherency stuff on LNL aside.
>
> But on discrete it's just suck.

Mhm, I never worked with pure integrated devices but at least radeon, 
amdgpu and nouveau seems to have a solution which would work as far as I 
can tell.

Basically on suspend you make sure that everything necessary for 
shrinking is done, e.g. waiting for fences, evacuating VRAM etc...

Hardware specific updates like GART while the device is suspended are 
postponed until resume.

> TTM discrete gpu drivers avoided all that by simply not having a shrinker
> where you need to runtime pm get, instead all runtime pm gets are outmost,
> without holding any ttm or bo locks.

Yes, exactly that.

>> I would say that this is a serious NO-GO. It basically means that powered
>> down devices can lock down system memory for undefined amount of time.
>>
>> In other words an application can allocate memory, map it into GGTT and then
>> suspend or even get killed and we are not able to recover the memory because
>> there is no activity on the GPU any more?
>>
>> That really sounds like a bug in the driver design to me.
> It's a bug in the runtime pm core imo. I think interim what Thomas laid
> out is the best solution, since in practice when the gpu is off you really
> shouldn't need to wake it up. Except when you're unlucky and racing a
> runtime suspend against a shrinker activity (like runtime suspend throws a
> bo into system memory, and the shrinker then immediately wants to swap it
> out).

Mhm, why exactly is that problematic?

Wouldn't pm_runtime_get_if_in_use() just return 0 in this situation and 
we postpone any hw activity?

> I've been pondering this mess for a few months, and I think I have a
> solution. But it's a lot of work in core pm code unfortunately:
>
> I think we need to split the runtime_suspend callback into two halfes:
>
> ->runtime_suspend_prepare
>
> This would be run by the rpm core code from a worker without holding any
> locks at all. Also, any runtime_pm_get call will not wait on this prepare
> callback to finish, so it's up to the driver to make sure all the locking
> is there. Synchronous suspend calls obviously have to wait for this to
> finish, but that should only happen during system suspend or driver
> unload, where we don't have these deadlock issues.
>
> Drivers can use this callback for any non-destructive prep work
> (non-destructive aside from the copy engine time wasted if it fails) like
> swapping bo from vram to system memory. Drivers must not actually shut
> down the hardware because a runtime_pm_get call must succeed without
> waiting for this callback to finish.
>
> If any runtime_pm_get call happens while the suspend attempt will be
> aborted without further action.
>
> ->runtime_suspend
>
> This does the actual hw power-off. The power core must guarantee that the
> ->runtime_suspend_prepare has successfully completed at least once without
> the rpm refcount being elevated from 0 to 1 again.
>
> This way drivers can assume that all bo have been swapped out from vram
> already, and there's no need to acquire bo or ttm locks in the suspend
> path that could block the resume path.
>
> Which would then allow unconditional runtime_pm_get in the shrinker paths.
>
> Unfortunately this will be all really tricky to implement and I think
> needs to be done in the rumtime pm core.

Completely agree that this is complicated, but I still don't see the 
need for it.

Drivers just need to use pm_runtime_get_if_in_use() inside the shrinker 
and postpone all hw activity until resume.

At least for amdgpu that shouldn't be a problem at all.

Regards,
Christian.

>
> Cheers, Sima

--------------0rCoIduWithmVw2YW4O69lYn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 22.08.24 um 11:23 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Wed, Aug 21, 2024 at 10:14:34AM +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 20.08.24 um 18:00 schrieb Thomas Hellström:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Or why exactly should shrinking fail?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">A common example would be not having runtime pm and the particular bo
needs it to unbind, we want to try the next bo. Example: i915 GGTT
bound bos and Lunar Lake PL_TT bos.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
WHAT? So you basically block shrinking BOs because you can't unbind them
because the device is powered down?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes. amdgpu does the same btw :-)</pre>
    </blockquote>
    <br>
    Well, amdgpu wouldn't block shrinking as far as I know.<br>
    <br>
    When the GPU is powered down all fences are signaled and things like
    GART unbinding is just postponed until the GPU wakes up again.<br>
    <br>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">It's a fairly fundamental issue of rpm on discrete gpus, or anything that
looks a lot like a discrete gpu. The deadlock scenario is roughly:

- In runtime suspend you need to copy any bo out of vram into system ram
  before you power the gpu. This requires bo and ttm locks.

- You can't just avoid this by holding an rpm reference as long as any bo
  is still in vram, because that defacto means you'll never autosuspend at
  runtime. Plus most real hw is complex enough that you have some driver
  objects that you need to throw out or recreate, so in practice no way to
  avoid all this.

- runtime resume tends to be easier and mostly doable without taking bo
  and ttm locks, because by design you know no one else can possibly have
  any need to get at the gpu hw - it was all powered off after all. It's
  still messy, but doable.

- Unfortunately this doesn't help, because your runtime resume might need
  to wait for a in-progress suspend operation to complete. Which means you
  still deadlock even if your resume path has entirely reasonable locking.</pre>
    </blockquote>
    <br>
    Uff, yeah that totally confirms my gut feeling that this looked
    really questionable.<br>
    <br>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On integrated you can mostly avoid this all because there's no need to
swap out bo to system memory, they're there already. Exceptions like the
busted coherency stuff on LNL aside.

But on discrete it's just suck.</pre>
    </blockquote>
    <br>
    Mhm, I never worked with pure integrated devices but at least
    radeon, amdgpu and nouveau seems to have a solution which would work
    as far as I can tell.<br>
    <br>
    Basically on suspend you make sure that everything necessary for
    shrinking is done, e.g. waiting for fences, evacuating VRAM etc...<br>
    <br>
    Hardware specific updates like GART while the device is suspended
    are postponed until resume.<br>
    <br>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">TTM discrete gpu drivers avoided all that by simply not having a shrinker
where you need to runtime pm get, instead all runtime pm gets are outmost,
without holding any ttm or bo locks.</pre>
    </blockquote>
    <br>
    Yes, exactly that.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I would say that this is a serious NO-GO. It basically means that powered
down devices can lock down system memory for undefined amount of time.

In other words an application can allocate memory, map it into GGTT and then
suspend or even get killed and we are not able to recover the memory because
there is no activity on the GPU any more?

That really sounds like a bug in the driver design to me.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's a bug in the runtime pm core imo. I think interim what Thomas laid
out is the best solution, since in practice when the gpu is off you really
shouldn't need to wake it up. Except when you're unlucky and racing a
runtime suspend against a shrinker activity (like runtime suspend throws a
bo into system memory, and the shrinker then immediately wants to swap it
out).</pre>
    </blockquote>
    <br>
    Mhm, why exactly is that problematic?<br>
    <br>
    Wouldn't pm_runtime_get_if_in_use() just return 0 in this situation
    and we postpone any hw activity?<br>
    <br>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">I've been pondering this mess for a few months, and I think I have a
solution. But it's a lot of work in core pm code unfortunately:

I think we need to split the runtime_suspend callback into two halfes:

-&gt;runtime_suspend_prepare

This would be run by the rpm core code from a worker without holding any
locks at all. Also, any runtime_pm_get call will not wait on this prepare
callback to finish, so it's up to the driver to make sure all the locking
is there. Synchronous suspend calls obviously have to wait for this to
finish, but that should only happen during system suspend or driver
unload, where we don't have these deadlock issues.

Drivers can use this callback for any non-destructive prep work
(non-destructive aside from the copy engine time wasted if it fails) like
swapping bo from vram to system memory. Drivers must not actually shut
down the hardware because a runtime_pm_get call must succeed without
waiting for this callback to finish.

If any runtime_pm_get call happens while the suspend attempt will be
aborted without further action.

-&gt;runtime_suspend

This does the actual hw power-off. The power core must guarantee that the
-&gt;runtime_suspend_prepare has successfully completed at least once without
the rpm refcount being elevated from 0 to 1 again.

This way drivers can assume that all bo have been swapped out from vram
already, and there's no need to acquire bo or ttm locks in the suspend
path that could block the resume path.

Which would then allow unconditional runtime_pm_get in the shrinker paths.

Unfortunately this will be all really tricky to implement and I think
needs to be done in the rumtime pm core.</pre>
    </blockquote>
    <br>
    Completely agree that this is complicated, but I still don't see the
    need for it.<br>
    <br>
    Drivers just need to use pm_runtime_get_if_in_use() inside the
    shrinker and postpone all hw activity until resume.<br>
    <br>
    At least for amdgpu that shouldn't be a problem at all.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZscDox5KoiNHXxne@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

Cheers, Sima
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------0rCoIduWithmVw2YW4O69lYn--
