Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB6AE9F55
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AC210E8BA;
	Thu, 26 Jun 2025 13:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ejnbEwkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0581010E8AF;
 Thu, 26 Jun 2025 13:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDkLlOq5l72jp8R3cUinCmNlz3C78aq3RB9HI+XfW2T+9+fE5txyd+qg5cutgTCEjoqTklpyzxZ3ITVBul6rIJhOWqEe4fgElcfUJZoZu3CWNS2aU86J2bfO7nNPo/gHz6Z/oijWV//XV9Q7bZvxY0uovg4CnvWEG9Ctp83nMErD7HtFQoUm+nFyHwhhzbPOFWmrebrCfuSDUFrP3xyLUvrZBRUIbOUAXBDhLkORulms8nshPFf0SdqRM9153Ew7rHmLPjwZkQPlnyCtd+VqSkiTvgMYcD54J768o757DfDmwrUMZ5ykB9cygtvVXpNb+1V4I7G9hapagcwi1NpcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz7RRvntuv7x+pNGO/b8zxsY0a9EZB7sqs1SKEo83zQ=;
 b=I4dUg9oyQixSMvUyctfS+UtzeHuX1hKHJzmXtenbeP4k/2QjaE7C2HgIeIgrJAUDq7rDFYKK/4BnR+/DV1U81vKR6Oa2vfubywHK6V4f+QvcGxs8FRzJh/KLL9jz011mQkYhm8uWt1tmRFkbW6mMhYp3Pac1NIiw5HMPrumkhfNlYWrpEHa6J/AR3iqWFKMHniIYyIb+7ELxlmoS74J5rRHvV0yyDudz869SYT51TiverLAkvv41UdQ/h/9bJU1IAh+9zK2ZMW/DgnqCPBnHEkarXKCLeQImr/xoBbmfNZb5lorH2p7xWAbtx542/6xmHo9X4HZWjJeXfHC2TxrthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mz7RRvntuv7x+pNGO/b8zxsY0a9EZB7sqs1SKEo83zQ=;
 b=ejnbEwkVA3Kf+mHuzuRT23GOX66VMLJznjEibjSePnapgxDy98kDKzTTnpi8QPwMCiXIo0tBsRc1dbMNn13NGJJW6HbcGE9zoL615qKmXqwz4ioG5wivbjB3HJpWabcr2ETqSuA7Pp+8uiyiBmK01Qam/iAYbm/RmVaoKLHgHeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 13:48:44 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 13:48:44 +0000
Content-Type: multipart/alternative;
 boundary="------------3bV0iu0bQZiQenTey58tM1hc"
Message-ID: <568e519a-a3fa-4da0-b8b4-6ac3df19947f@amd.com>
Date: Thu, 26 Jun 2025 19:18:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm: add debugfs support on per client-id basis
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-3-sunil.khatri@amd.com>
 <12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com>
X-ClientProxiedBy: PN4P287CA0108.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::11) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|SN7PR12MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7ad33d-44d8-4e3a-8267-08ddb4b82b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFpkdE1YSUNSMGgwZUs1Q3hVcGpmTW1PejVjSlVnZjZZK1AySytCZng5TkFj?=
 =?utf-8?B?ekM1RFZZQnYybGN2UUtkYlBoYzU2Q3dqb0k1NmRXQUUyK2R1Tkk3Rzc2WFFQ?=
 =?utf-8?B?Y2Z6aUNhUzFwVC9VZTF2UFViOE9IZ0RFMnFnT1NnNTRCdkVOWVNjbXJHY1Vw?=
 =?utf-8?B?NHRqMFlIczV3WSs2UjQxRU1qYWZjQzVoRGhIRXVHL2QxL2pySTJkMXdRdmdS?=
 =?utf-8?B?NHhlaWoyWkphenlrK3U1ZjR1MEtZRmVwR1p1TDA0OGc2cDVIeHVjeVJWQlIr?=
 =?utf-8?B?c1c0VHNBNklEQ3hIVGFTdFhtOENrcXNEVjJodTEyY0oyN0xXN3dCQjFjOHlE?=
 =?utf-8?B?UWRzc0tISUR3K0o5aXlXS3lPa0pnUWU1SkI2M09yU0REU200RXBSRnBGUEhU?=
 =?utf-8?B?TUdTTGZwZW9rUWZWMTJSb2pmZWtqaG1sVFgwTjZvd1ZuL1VqVzdLMW9LYnlK?=
 =?utf-8?B?ZHJDNGVFS3JmaEF5UlZnOGNVa3JTd0hPdkM0d2hFYUV2TWJLL0xuZ0Z2RUxG?=
 =?utf-8?B?RUhDREFwNzNKRTd3WHdwTDUxdGt4ZG1TVHh0b0NQSGhLNS85RWlFZWZaWTRt?=
 =?utf-8?B?ZVNvU0RZU0xMa2F5Q0RlS3o5akgwSndUUkdjVi9VMVB3bXZIUXYxekJBNm5z?=
 =?utf-8?B?UXMxL3BWa3RUTk5OYlhaKzNMc2lyRkZYV0M4U2FEeU9UR2hybUVEOG1TYjds?=
 =?utf-8?B?YnBOL2NWaWdaZWRsSU81dklVYkJXRlF4M1pJK1RVaFVsUWFSU1Z6OUhOeUh1?=
 =?utf-8?B?dVJITFZlNzJBTGphTzlDVUgrdSs0enJRcnhaRTBDVGlqdEtBb3J5NUtPakV6?=
 =?utf-8?B?S3k3blR1TmIzTkM4ejFadStobmZvT2pWbEwwQWRoNHZkdSsxV29UYmhvOGxu?=
 =?utf-8?B?SFViVnZRRENTaVVIR2pkNWcxRWNhc1I1QmJiR3J0dHRPVUZuYkxKK25tUU1s?=
 =?utf-8?B?TlVocEsyOEJmdlZ3S3dGMkhVdEpCb05lSjROTHl5YWNON0RUWEVxV2E4cVpH?=
 =?utf-8?B?STRUQmNhMGZ1MHhqUFpENm03YW9wdytQLzR6a3Q1aklyU0dUaG1OK0kxQXBv?=
 =?utf-8?B?K2VRQ2hzUjRHcXY5ZGVhVnVWa3gwMWFlYmpLNmx2U3AzY1QvdlJIU2ZxdWFx?=
 =?utf-8?B?a25jZzJzaVRLMk9zRmFXdzluTSs5OTFtMkJSZDFWWU0zTDdYckFDMnM2NExs?=
 =?utf-8?B?a0ZuaUxtT3NjcFUwUjlTc21tRFZxN1hub1hKRVZmZUgxRnhSNW1kQS9LWVBN?=
 =?utf-8?B?aWYxTlVPOVBqckFlSXBFSW55Y1N4MW5HdUJZajhXYlFJc3hXMFA0alRJQURl?=
 =?utf-8?B?NWhIcGZ5ZWl3dS9PeVI0SXh0dHdrandlZGV0azVjTk1CWVdvVmRKc1c5YzJG?=
 =?utf-8?B?WktKd3BRSHRJNjdwTDBqM082QnplZC9oTExlQklnR1hPTUxWWk0xRlp6akpG?=
 =?utf-8?B?Z0JRVy9Pc2ZrVVFSQnVYVmYrNEdreHJzeUhXeWxnb3ZSanZVbmYwZ280dVhJ?=
 =?utf-8?B?dmd5dzgzK0poZmdSeXJiWDNua0hsQVNqU3ZiUmJJOXk4ZFpTQ0VKZFRyaGUy?=
 =?utf-8?B?bFc0L2xwcGVtcEwwZ0pLWHdBVmY5eExVbEFsV0lwemhlSkRSb2NKZWxaYk1B?=
 =?utf-8?B?cExUYnVQU1I3QnI3SGlMOTRlTFBIUzVxYXFDWU8wN1VrMFpGNUM5UitFM3NN?=
 =?utf-8?B?eGdsa09KZ1RObXZSYXpnWU5YaWowc1N5WFJNUUY4dnlQUVBtTkNaZXhoYnZI?=
 =?utf-8?B?aWpXbitiQW1GZERyYXErVG03Y21qTGNKNFl6Z2ZQdFUvSWhnK29iOFRwMml6?=
 =?utf-8?B?MmlYTDMvVFlaOHFGRFRZNEpzcmFSak5zY1N6T0dacmdtL3JGNGhDUTV0Wmp5?=
 =?utf-8?B?dlJHTUwzdkZtZEZnQk9IanQwWFBvbG8vRmtXRWxIVEFMV0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFB1ZUNJUlVFS0JDYmF5blpPZ0RzcjlPVlhyY3dXdUM3RUp3c3IrNGtqMFlY?=
 =?utf-8?B?cnB5UmNHd0xJeDdKZmU4bVZqTlhpMmxhNEdWdUIxY2hLVjdwT09IenBISWhD?=
 =?utf-8?B?ckthQzBNK0lCTjBOTUx2Z1FtbU1lZ2NNNmJtODIvdmFIaFdPdFVWRDFnekh4?=
 =?utf-8?B?MkpYSUN4VVp5UEw2SU1adDJSQzRpdU41cjl0TEtseWVxZ21ET0lmL1NEVE5y?=
 =?utf-8?B?V0NqM3gzYjRaQ1d0TFpTSGVXRzkrZEwyWFZRclFWcGlJejB4ZFpScXRZUytU?=
 =?utf-8?B?aTNpN2tLeUNDMWRuN0w4bytIOUZwc0FIK1p4bkxFR2Jkc1RDT1paditBR0tm?=
 =?utf-8?B?WXcyMFdZNUtJbGVud1Y2YUhvcE9vTHNyVE5kVkxGOXphV0IwUVhUdlZ5U1B6?=
 =?utf-8?B?aWpBYUM0emlrRDcxRTFYL0xTSTFEK3ZVN25BSVROcmhnVGVzeEIrT3N3OEZq?=
 =?utf-8?B?dkl4UjBXdTkwWDVPRDZ0OHBoV1liUWJaS0luZGxOenZ4MXlIQ0NjcGpISzFL?=
 =?utf-8?B?eDBIaUQ0dG9UTU40NVBkRlYvRHdrTGd6NkpUODRvRWR2cnJkU2hKNXl2Wk41?=
 =?utf-8?B?Y1NIdXJiTW5NOU1JTWVVdW0zcGpWMUU0bFZab0dYejAwenQvUXErc1VMYmN2?=
 =?utf-8?B?VS9qQ1hCak9aeHVwS2E0dEVoNldWTGhnc2NwcFliMjh1a2IvRVgwN3dBcUo4?=
 =?utf-8?B?Ni9BSG5TVWpkdk91RHNadmpUSFNIRjhBV2gwd1RIOGtlNlFFbS83Q1ROdVJ6?=
 =?utf-8?B?R2QzYTQ5L0lyME83MmJiUEU3WFgvNW9ZaWRHNVRJakVsL1kxR21RUXRCa2FS?=
 =?utf-8?B?a2FyNkhNdkFsdStJYnBvMlJhY1VzS1B5Q1IwS05BVmt0MFV3Z1AwTzZPekJI?=
 =?utf-8?B?TmIzak5UTDZDQ0dTN3E3Y3I4S3JxWCtQMDRPTjRpZWtDdkVxQzN0UlE1SUZM?=
 =?utf-8?B?Z3NFSkQzb29NUlowMzBSaVBtcDMzQjZPb0h6bWRtRTBJT253Wng2QnFTaTdJ?=
 =?utf-8?B?Ti9PcUFoR0dOdmN6ZUE1U1VWeEVrRmdyZ1RSWjY1RlozR21WZG1jbkc5R3pw?=
 =?utf-8?B?aDBVUWJxL3VvV1BXYjR3N3NjUGJqWDR2aGIzY2VVL1ZHcTJYU3dFd3M3Nnht?=
 =?utf-8?B?enlBeVJoYytITmxrQ1BlQ2xiOUxOaElNcHR4Nk5PcW4vZzYwNmkySDFDSEJn?=
 =?utf-8?B?ekorSWlGMkk0bEtSMGtFQmVVcGRSdUlwalpWMythRTljcG1tbEgzZ0pndmFx?=
 =?utf-8?B?ZlpGclJtZm5HdWU3Q0QrQmNucFJHSXBDN2ZrcEZBOEs0UVZ0UklhY0QvL2h5?=
 =?utf-8?B?YW5ORWQ2K0lxclg1bkFUSmJwNFBaMSt4ZUVaNi9JZTBDeUFGbS9mdFJGL1d2?=
 =?utf-8?B?MXQwYnVsajJyQnhDTVNkR200UnhhVmFjZ3NVanoxOGNBV2RkbjBFV2RDSnNk?=
 =?utf-8?B?aVdTM1pTeE9WQWJhNGQrVGFLbXNZSTVmT052NmdFbDQ1dUpDalZGM01CNXBt?=
 =?utf-8?B?TzlmYnRFR0J3c2x6V1FaNG5HbUpzdVBtUmludXhjRHU4N256V0dRMjd2dCts?=
 =?utf-8?B?WDBoMzAzenpKeFZlQTBaLzFxcVY0dThJOVQ5bjdxYVYzQUcwVlV6Z3RESlZH?=
 =?utf-8?B?MkkzdWNPVW5oemJVTTRYaDZObXBKaDJzb2plYkhIekQyMHZZS0lXbzRXdmxs?=
 =?utf-8?B?VHRqT0pkRmtURzB2dDZuTk9sWjVNMXFtOTlFSUVDQnNkNEx3NHlYcEVKOFdn?=
 =?utf-8?B?MWdVZkFpd2JCMllaR1pMSW9RVC9hV29QMEZxMXhRR0preWRVSzR0bEtPSzRW?=
 =?utf-8?B?VWczY0ZRM1c1OERrODVFRlc0dUQ5dnFIWWptNXlyblpMUE1keGdkR1RZVUpR?=
 =?utf-8?B?OTQreWRrck9SbUR6VE05UHVWN25qd0dMZkd2QldFcHhGZktsb3BIWnFxb3Ju?=
 =?utf-8?B?VG9EREZrcnJXS1Fqalh2RG03dnRDalRnRnNHaE1mTHhrZmtBSmRpRHdoMy9O?=
 =?utf-8?B?UDJCMzJGV3h3ZEt0dkpvV3B4MW1GUXAyM3BjMUdZVXJaOXFxYlVidjNGeEwr?=
 =?utf-8?B?R0k5dkJaZlpmVTUybWxyQ0dXU1o5L2FFL1E5RTRZM0Q0d0VpV0M2NDRSdlQ2?=
 =?utf-8?Q?WegXAGCRAL9G+OF/QJl2tICRj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7ad33d-44d8-4e3a-8267-08ddb4b82b0a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:48:44.6803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJzI6Q12zwzX24rSPXv2UQOBIO7zJXJOzfRXbTOhbMYBM9NRjXW4B6RIKZH+j4eqm6LZudQ1IF4O2I1t1Kp3RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021
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

--------------3bV0iu0bQZiQenTey58tM1hc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/2025 5:34 PM, Christian König wrote:
> On 24.06.25 13:34, Sunil Khatri wrote:
>> add support to add a directory for each client-id
>> with root at the dri level. Since the clients are
>> unique and not just related to one single drm device,
>> so it makes more sense to add all the client based
>> nodes with root as dri.
>>
>> Also create a symlink back to the parent drm device
>> from each client.
>>
>> Signed-off-by: Sunil Khatri<sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_file.c    |  6 ++++++
>>   include/drm/drm_debugfs.h     | 11 +++++++++++
>>   include/drm/drm_file.h        |  7 +++++++
>>   4 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index a227903c29c4..ebdf60665b86 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -309,6 +309,32 @@ void drm_debugfs_remove_accel_root(void)
>>   	debugfs_remove(accel_debugfs_root);
>>   }
>>   
>> +void drm_debugfs_clients_add(struct drm_file *file)
>> +{
>> +	char *client;
>> +
>> +	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>> +	if (!client)
>> +		return;
>> +
>> +	/* Create a debugfs directory for the client in root on drm debugfs */
>> +	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
>> +	kfree(client);
>> +
>> +	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
>> +	if (!client)
>> +		return;
>> +
>> +	/* Create a link from client_id to the drm device this client id belongs to */
>> +	debugfs_create_symlink("device", file->debugfs_client, client);
> Mhm, that won't work for accel devices. How should we fix that?

All the clients we are creating is doing for the dri clients only and 
not for accel driver, Since the root itself is different for accel it 
cant be in dri and we could leave that for accel driver to take care if 
they need client
directory for something or this we could pick later if there is a need.

In the mean while what we can do in the drm_alloc/drm_free is to add an 
extra condition to check if (drm_core_check_feature(dev, 
DRIVER_COMPUTE_ACCEL)) or not. and create and remove client onyl for !accel
if(!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
drm_debugfs_clients_add(file); and
if(!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
drm_debugfs_clients_remove(file);


>
>> +	kfree(client);
>> +}
>> +
>> +void drm_debugfs_clients_remove(struct drm_file *file)
>> +{
>> +	debugfs_remove_recursive(file->debugfs_client);
>> +	file->debugfs_client = NULL;
>> +}
>>   
>>   /**
>>    * drm_debugfs_dev_init - create debugfs directory for the device
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 06ba6dcbf5ae..17b803ab119e 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -45,6 +45,7 @@
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_print.h>
>> +#include <drm/drm_debugfs.h>
>>   
>>   #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>> @@ -167,6 +168,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>   
>>   	drm_prime_init_file_private(&file->prime);
>>   
>> +	drm_debugfs_clients_add(file);
>> +
>>   	if (dev->driver->open) {
>>   		ret = dev->driver->open(dev, file);
>>   		if (ret < 0)
>> @@ -181,6 +184,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>   		drm_syncobj_release(file);
>>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>>   		drm_gem_release(dev, file);
>> +
>> +	drm_debugfs_clients_remove(file);
>>   	put_pid(rcu_access_pointer(file->pid));
>>   	kfree(file);
>>   
>> @@ -236,6 +241,7 @@ void drm_file_free(struct drm_file *file)
>>   		     atomic_read(&dev->open_count));
>>   
>>   	drm_events_release(file);
>> +	drm_debugfs_clients_remove(file);
> That most likely needs to come even before releasing the events.

Sure will move it before events_release.

Regards
Sunil Khatri

>
> Regards,
> Christian.
>
>>   
>>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>   		drm_fb_release(file);
>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>> index cf06cee4343f..2b3767ad8f5d 100644
>> --- a/include/drm/drm_debugfs.h
>> +++ b/include/drm/drm_debugfs.h
>> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>>   
>>   int drm_debugfs_gpuva_info(struct seq_file *m,
>>   			   struct drm_gpuvm *gpuvm);
>> +
>> +void drm_debugfs_clients_add(struct drm_file *file);
>> +void drm_debugfs_clients_remove(struct drm_file *file);
>>   #else
>>   static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>>   					    int count, struct dentry *root,
>> @@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>>   {
>>   	return 0;
>>   }
>> +
>> +static void drm_debugfs_clients_add(struct drm_file *file)
>> +{
>> +}
>> +
>> +static void drm_debugfs_clients_remove(struct drm_file *file)
>> +{
>> +}
>>   #endif
>>   
>>   #endif /* _DRM_DEBUGFS_H_ */
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 5c3b2aa3e69d..eab7546aad79 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -400,6 +400,13 @@ struct drm_file {
>>   	 * @client_name_lock: Protects @client_name.
>>   	 */
>>   	struct mutex client_name_lock;
>> +
>> +	/**
>> +	 * @debugfs_client:
>> +	 *
>> +	 * debugfs directory for each client under a drm node.
>> +	 */
>> +	struct dentry *debugfs_client;
>>   };
>>   
>>   /**
--------------3bV0iu0bQZiQenTey58tM1hc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/2025 5:34 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com">
      <pre wrap="" class="moz-quote-pre">On 24.06.25 13:34, Sunil Khatri wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">add support to add a directory for each client-id
with root at the dri level. Since the clients are
unique and not just related to one single drm device,
so it makes more sense to add all the client based
nodes with root as dri.

Also create a symlink back to the parent drm device
from each client.

Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
 drivers/gpu/drm/drm_debugfs.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_file.c    |  6 ++++++
 include/drm/drm_debugfs.h     | 11 +++++++++++
 include/drm/drm_file.h        |  7 +++++++
 4 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index a227903c29c4..ebdf60665b86 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -309,6 +309,32 @@ void drm_debugfs_remove_accel_root(void)
 	debugfs_remove(accel_debugfs_root);
 }
 
+void drm_debugfs_clients_add(struct drm_file *file)
+{
+	char *client;
+
+	client = kasprintf(GFP_KERNEL, &quot;client-%llu&quot;, file-&gt;client_id);
+	if (!client)
+		return;
+
+	/* Create a debugfs directory for the client in root on drm debugfs */
+	file-&gt;debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
+	kfree(client);
+
+	client = kasprintf(GFP_KERNEL, &quot;../%s&quot;, file-&gt;minor-&gt;dev-&gt;unique);
+	if (!client)
+		return;
+
+	/* Create a link from client_id to the drm device this client id belongs to */
+	debugfs_create_symlink(&quot;device&quot;, file-&gt;debugfs_client, client);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Mhm, that won't work for accel devices. How should we fix that?</pre>
    </blockquote>
    <p>All the clients we are creating is doing for the dri clients only
      and not for accel driver, Since the root itself is different for
      accel it cant be in dri and we could leave that for accel driver
      to take care if they need client<br>
      directory for something or this we could pick later if there is a
      need.<br>
    </p>
    In the mean while what we can do in the drm_alloc/drm_free is to add
    an extra condition to check if (drm_core_check_feature(dev,
    DRIVER_COMPUTE_ACCEL)) or not. and create and remove client onyl for
    !accel<br>
    <div style="color: #cccccc;background-color: #1f1f1f;font-family: Consolas, 'Courier New', monospace;font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><div><span style="color: #c586c0;">if</span><span style="color: #cccccc;"> (</span><span style="color: #d4d4d4;">!</span><span style="color: #dcdcaa;">drm_core_check_feature</span><span style="color: #cccccc;">(</span><span style="color: #9cdcfe;">dev</span><span style="color: #cccccc;">, DRIVER_COMPUTE_ACCEL))</span></div><div><span style="color: #cccccc;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style="color: #dcdcaa;">drm_debugfs_clients_add</span><span style="color: #cccccc;">(</span><span style="color: #9cdcfe;">file</span><span style="color: #cccccc;">);

and 
</span><div style="color: #cccccc;background-color: #1f1f1f;font-family: Consolas, 'Courier New', monospace;font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><div><span style="color: #c586c0;">if</span><span style="color: #cccccc;"> (</span><span style="color: #d4d4d4;">!</span><span style="color: #dcdcaa;">drm_core_check_feature</span><span style="color: #cccccc;">(</span><span style="color: #9cdcfe;">dev</span><span style="color: #cccccc;">, DRIVER_COMPUTE_ACCEL))</span></div><div><span style="color: #cccccc;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style="color: #dcdcaa;">drm_debugfs_clients_remove</span><span style="color: #cccccc;">(</span><span style="color: #9cdcfe;">file</span><span style="color: #cccccc;">);</span></div></div></div></div>
    <br>
    <br>
    <blockquote type="cite" cite="mid:12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	kfree(client);
+}
+
+void drm_debugfs_clients_remove(struct drm_file *file)
+{
+	debugfs_remove_recursive(file-&gt;debugfs_client);
+	file-&gt;debugfs_client = NULL;
+}
 
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 06ba6dcbf5ae..17b803ab119e 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -45,6 +45,7 @@
 #include &lt;drm/drm_file.h&gt;
 #include &lt;drm/drm_gem.h&gt;
 #include &lt;drm/drm_print.h&gt;
+#include &lt;drm/drm_debugfs.h&gt;
 
 #include &quot;drm_crtc_internal.h&quot;
 #include &quot;drm_internal.h&quot;
@@ -167,6 +168,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 	drm_prime_init_file_private(&amp;file-&gt;prime);
 
+	drm_debugfs_clients_add(file);
+
 	if (dev-&gt;driver-&gt;open) {
 		ret = dev-&gt;driver-&gt;open(dev, file);
 		if (ret &lt; 0)
@@ -181,6 +184,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 		drm_syncobj_release(file);
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_release(dev, file);
+
+	drm_debugfs_clients_remove(file);
 	put_pid(rcu_access_pointer(file-&gt;pid));
 	kfree(file);
 
@@ -236,6 +241,7 @@ void drm_file_free(struct drm_file *file)
 		     atomic_read(&amp;dev-&gt;open_count));
 
 	drm_events_release(file);
+	drm_debugfs_clients_remove(file);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That most likely needs to come even before releasing the events.</pre>
    </blockquote>
    <p>Sure will move it before events_release.</p>
    <p>Regards<br>
      Sunil Khatri <br>
    </p>
    <blockquote type="cite" cite="mid:12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com">
      <pre wrap="" class="moz-quote-pre">

Regards,
Christian.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		drm_fb_release(file);
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index cf06cee4343f..2b3767ad8f5d 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
 
 int drm_debugfs_gpuva_info(struct seq_file *m,
 			   struct drm_gpuvm *gpuvm);
+
+void drm_debugfs_clients_add(struct drm_file *file);
+void drm_debugfs_clients_remove(struct drm_file *file);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
 {
 	return 0;
 }
+
+static void drm_debugfs_clients_add(struct drm_file *file)
+{
+}
+
+static void drm_debugfs_clients_remove(struct drm_file *file)
+{
+}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5c3b2aa3e69d..eab7546aad79 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -400,6 +400,13 @@ struct drm_file {
 	 * @client_name_lock: Protects @client_name.
 	 */
 	struct mutex client_name_lock;
+
+	/**
+	 * @debugfs_client:
+	 *
+	 * debugfs directory for each client under a drm node.
+	 */
+	struct dentry *debugfs_client;
 };
 
 /**
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------3bV0iu0bQZiQenTey58tM1hc--
