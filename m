Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED9C1FAC2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 11:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E0810E25D;
	Thu, 30 Oct 2025 10:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uw06uMS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0C10E25B;
 Thu, 30 Oct 2025 10:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC06wpPSlXFnagAp9OrDOJUZdYJbI+9UBZqFwHe94IikKT0GNSEOtvh0Qj4tfNin8OzMvsfeqbBwjtL5FYoJyfizY7C5VQDnbR9g4dqCAkr8HYPRLiKmHWqs3vCdNKKL7IeEDZSutCpb2HiiU3S/L/lBcxBSrnh7DUL+KfVfSd0UWltqgF1nbnfuj9MgCGwAVdVIqDqR7odLyhnLMsEbQzxa73KJRVUEArodISmworro2wBMW5lQ/1UmQm+YFtLn3CnmfewQSR2bm1bt+0GSTUOCAOR8OstRWfSdTvW/fZqhIVaNdeJeugtOzF/WeemInbRMnmYM7NPB/wleI5uZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk/1rAfi+7bGODpcqYhM3gfqkeHClSL8PIQiLBtrBFA=;
 b=SBJor7urHob7+R/1oMrGMzEyxlwiml3gkJ0WIK7QADi9ZwSMKRs2z0ks9VBKu3QZoJjuXZ3Q8PS1QF+o2bLyfwneHwxwEGN9RngZEIprCCmLCoe4s8ZFODov215NGXB4Uj8MqTgnasum/grLRPpXFtqN8CG/dL7/kivsHH7ES76hWG0GYd7ca2M3ilo3WljVAf3pAo7M5rwvdNZOjGFgRhCLH3V51/XPsrw58gTID89X7PYxI/ehZmI1QP8jEB2licGGAiyN+LTfKD5FEg1MKoGNYN3Yy+YzMmyhvsf7+/raXlZClZQNxr0f4ULTwXm4/DgdpkZT691+fgbpkUtcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk/1rAfi+7bGODpcqYhM3gfqkeHClSL8PIQiLBtrBFA=;
 b=Uw06uMS3QaQQf3+F/yvNpthn2fglTVSO6fcw75FU3NNe0h4OqQklolumAjSNM/PIbCB2Q0+cikMhhg9iCXUmppUuRxUrx1qAA9CFGZeTV/tYwB1S0fTLRxW+weoAcvhdmlRe/f9AkZ+quIh0lQKK2t8AHMeVid0vBYDLsEm561o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7144.namprd12.prod.outlook.com (2603:10b6:303:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 10:59:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 10:59:05 +0000
Message-ID: <6739aebe-45eb-44a5-a539-209fc3ed809b@amd.com>
Date: Thu, 30 Oct 2025 11:59:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Independence for dma_fences!
To: Matthew Brost <matthew.brost@intel.com>
Cc: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
 <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
 <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
 <aQJ+08BFLtmsM8LQ@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aQJ+08BFLtmsM8LQ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0401.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e0ed0d-8351-456c-42da-08de17a3579b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXprNlRHS1R5U244c0t0ZHFSSXVGUFpjTUtlaHUwSXkwUTYxTWZqcDU0U1FX?=
 =?utf-8?B?WlFFTVM3emxTNWc1M2RlWkJPS2NSQ1V4eXhJWlovdm0yNEx5M2cyd2puam9Y?=
 =?utf-8?B?WjJFamhlc2FQTUFUQ2xlbXhYOGZVbkhLcjVZWEllYzV1L2labkUrWXdzMWo2?=
 =?utf-8?B?MFd5b1pzRGlqN2wyWFN2ZzJuSWxCa0E5MVdIc0d1WkJhYWxxa1UweitHS1My?=
 =?utf-8?B?WHdTYzEwM3dWRHpVN25mSExMZ1V5WTlucEtiNjBlUXpMUDEvOHY2MitLMjRl?=
 =?utf-8?B?K09pYndEOXZDaHVnd1EvOHhaUUtZTnNNTzhlbDE5S29NT1ZxQlNEdk1JT3BW?=
 =?utf-8?B?enpiT1h6TmQrbTgzRWpNREJiYmFVemdlNmhSSzVaRWlzTjNTTnNFTHlEVGlp?=
 =?utf-8?B?YS9FYllCVmQzb29aNUpyaktzSXV2UFJ6UC9seU9hZmtrYjVJVnQzNEhYT3pK?=
 =?utf-8?B?WndUbUFnV3dZSkJxVFo2OFBDTFc0U2lrWGRMQ041bDB5RkEycFdKeFN6elk1?=
 =?utf-8?B?ZnozeEh0NGFiM01TQ1Joa3RaOHJjRW5uM1h3ckVhd042RkRrdTdHNUxTbjZ3?=
 =?utf-8?B?Nm9jVmF2ZW5wZk9ZRU1KZE93VXo0QWJDQXlBSUczT3NBZExkSEJMN0NSMHd4?=
 =?utf-8?B?MFMzNnU1YWhPa3pYTy9GRUhYR0lKd084YjlqNWp2Yk9lMExLOUNBdEFnM2pj?=
 =?utf-8?B?dkRNc0VoVE9OVkZKWkp1NHY3OFdaU2x5M1h4aW0ySUhpczlwazRDdW1iMFZH?=
 =?utf-8?B?aVJGemQ5RTdCSGZ5dU94M1V1TkJldXJ6V3pVMDgvWFJmYnRxQ0MzUTJqalRL?=
 =?utf-8?B?MWpDV2g4Y3FURFk1N2s1c2Vaa05kWEZpVU1YSC80TFVhcSs5UGxlcjlnRGlq?=
 =?utf-8?B?R2JBd2lvR3pBb0xVZmtKbldaaDc1SjdwUVQ0OTZNVEREc0dWaUs0aFJmckdt?=
 =?utf-8?B?T2diakJNdndJTFdDYTMzc1lYMkc4bHIrUmRSR1k1QXo1V0hxS3lTVVE5UWdo?=
 =?utf-8?B?RGw1MEZRclF6Qm9tS2UyRG9zYkV4Sjc4STMzNkovdkcwRlV5YmROaGd5cDZ0?=
 =?utf-8?B?T0lrSVhTY2FvajZnQUxtaVdvOFhPQjZ2RC9rUmphZ1hNQVh2NHZJMWVSWkFw?=
 =?utf-8?B?WnZGbWpXd3RNSkZjV3dBOFQzOWJTelhuRUtvc0tFYnhvOEt2SmR6VlVOSHBn?=
 =?utf-8?B?ai9aU1ZlUXFNSGtwU3FlMEpYa1BRSmRJYmNqUGhsYi95TlowdVVNRVd3dCsz?=
 =?utf-8?B?YkxJeWxhcUM1RWtURkpOdVZBNkp4Mk1ZQ2J5TW1VN3RZVHplMzdidForU1lu?=
 =?utf-8?B?QnJON1Vha3RmY1RiYllWZmJmSFYvUHE4aHpubGFqRWE2ZWhmK1FGUnRCSy9C?=
 =?utf-8?B?TEhuK0lOODYvWjRIUmxWYmx2aXNlL0pVK2g5NkFDMWhxK0RqendzR1hJNlEr?=
 =?utf-8?B?Wkd4eHlQQXZhUUdEQTB1OWxqKzR1dlBWWEhnLzMwM0owNVc4NFdJTTB4MnJa?=
 =?utf-8?B?Q3FZMk0vcTZwaUdORWd2M05ybzJRdDJDUk94TnFtQ0Q4Y3Zaa2t3NUhWTGNj?=
 =?utf-8?B?dXlJWkt6bjUydjAyLzU1SWdVaWY0UmFDYTc5dnhrdWFOWVoxalU1RDFxVVFC?=
 =?utf-8?B?M3k1NCtpVmJ2emtWUktxMU5aYUxveVlNejdjbXgvdlNDUFAxVlZ0dmlHR1A1?=
 =?utf-8?B?b2ZkZHM1UDVkdkRzaGxjVkRtTTA0WHczV1dLMjh1TzFhUktZb0dxa095UnJL?=
 =?utf-8?B?RXo0eFd6NGpnZmxPaUQ1eEJEVGdBNkZScW9BVXVDQXBKT1lOM2ZQSzlwaWJq?=
 =?utf-8?B?UnhSTFVRSysrakt0dE0ra0dIeE1OSWZiUFY5NHJiVnVDK0VSVktlZXRFVGsy?=
 =?utf-8?B?T3RtNzhTcWNpZjJwNVBraUt5Zkp4UGdacWxYVEswam1VMzBYeFlNeVpRb3dr?=
 =?utf-8?Q?FaHvDe4i+qeFeuYG20U1IGY0cHIPls/X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRBV0lqZllIUkEzRFlETWZvSGNUd1FCSS9mQmV1azdSbDhVajZyaEs4Skxq?=
 =?utf-8?B?ZEI1WTJ3aEQrbWU4TmVpTjZUQWliZHpwcVlmYXV5R1NGbDloS245YkRLQ05w?=
 =?utf-8?B?S09HdyswTnhvQWV0VUNrb1dPRVJLT3F6bmtMcWxhTHA4ME9ORFNrNStZTXBk?=
 =?utf-8?B?QllWRHdOK3VnY3BwOVlVMUNQSXM4bkdiNFhxTTNKb3JZSUZGZGVDcjMrdlhi?=
 =?utf-8?B?eEFNTGtMUDJxeHM1b2VGR2U5SjZ5MW1wdURhcU5FSW1YMjR1ZlZnVC9qSzVJ?=
 =?utf-8?B?c2RmY0lvNyt5ZHp2VUtqRndaWFNQd1VONUdFSW96ZHFEaGFURXFuWFdrbkRQ?=
 =?utf-8?B?d1NSa3JCS1hudjdPTi9MVjVPaHZDc3gxRDVtMC9uUk5vNUptSVdGYWtvWmkr?=
 =?utf-8?B?OG1IT2RMamdnb3E0a3Y5aGpIU2Erc3JxNWZ0SVdyekZlYXB5OFJoMnZaWTVO?=
 =?utf-8?B?cGN5djRNeEc3dC82ajJqczNXSkE3dVE4QWZrcVpXSVBnclM1ODJubm5GbXpC?=
 =?utf-8?B?NEZ0UE4zNUpkU2FLZ0hsL0VLdGdSRzZXZExqdHJzTjlsdk9SN3VldEMxdy92?=
 =?utf-8?B?clhmcnZDYVFUMU96enlRKzU5dlFJMGU5dVF5QUtYZzNnUHI2UnJFUFdQbjl5?=
 =?utf-8?B?Q2gya3VHSVYwQmNPN05MTFRrSnpSOEI3WlFYc1VxZ2RJcGF0c2pKbmxVYkdp?=
 =?utf-8?B?WnRrTEN0S3FPT1lScElDbE4zS25LdTJqMzlROTQyWk1DWU45ZGROcmMrZ3dC?=
 =?utf-8?B?aFAvcGwxZy9tNUhhZDVMYXlSSmdzUWZqUXBRWUlqM0lubCtoRjF1N0hWRDNV?=
 =?utf-8?B?OGczaDEwRENwNDMrdWx2dW10Q2ZELzM0SkdrUjA5YTl5QUlSYk1qS1EzZG12?=
 =?utf-8?B?VE4xMGYxd3BJQWVGYUlRN1Jta2JycGtETVZtUjF1M1dJZFRmRUVWcUY5YW16?=
 =?utf-8?B?dkplb0NhdVh3WFFjR0NvR0FHTUJTb25VUWlMNC90TUhML2NnV2ZBVEdHQmY3?=
 =?utf-8?B?Qm1CdkkxYzM1UUZQQUVDaTg0MkR4djlVMGwxS1kyZ2oxaVM2M1VOelI3eGZW?=
 =?utf-8?B?QkNtM2JQRlBTd05CZUprOGgveSthaXkzU2JwNXE5b3A5YVh5b0pvL0F2M1Vq?=
 =?utf-8?B?U1hIUExwM3hGWFhUdWxHLzVXU2NmLytDV0tyNmpQSXRUeE5hb3NYQnpkKzB6?=
 =?utf-8?B?WEQ3TjhMaGVwQ1lzTDdnaVNVWlNGRVRNUTB6K25nSFVSTmczNFNNWCs4QTBL?=
 =?utf-8?B?MnJvZmpZWElWaEtqejJlRTFRVWtaOUg3OTZ2bHBnZmR0QmNBclhiR1QxTWNp?=
 =?utf-8?B?WElJV3g1UERZWVdLWWExc1h6NlBwRERUd2IzakgySHFzWVBqMWpUQTI1RElj?=
 =?utf-8?B?VDVVblFQWkwxSGkvWHFEV3VrMzdUZW5DRHY2V3g3aDk2ZUY2V0ZaV0tEUE1C?=
 =?utf-8?B?dUphT2hqdmRLRWZnbnhpVWZSZnFldHBnQU5MSVovRXJ5SFNNdGcwbVZ3Y3NI?=
 =?utf-8?B?S0xoYjFubWI1NmJtZmppanhnMjNNYkVFV1UwV1dJU2JLUDZDcklmQUkweGgw?=
 =?utf-8?B?aDRqT1djWUc0NkoyQzhZYW1NYlJYL1V6bjlRVWRPT1JVVUVKeExUK1FhRk5T?=
 =?utf-8?B?QXNLZk8rUGpwYlhkMnBZVlVVSDRZSVBObmxzblBDOERsR016SDdIUndYWTV2?=
 =?utf-8?B?QnEwSUZ3UHNSYzJyMGkrQlcyMkFDZ0xUREpPMENpUkhKcm5QNTN3M2RGd3VU?=
 =?utf-8?B?VmFQQ3QxMDEwcnBTQ0xjaFpVc2xZSkEwK2ZRcmZBWmkwV0dwQ0prRXZWT2VJ?=
 =?utf-8?B?L0Z4S3F2aVl3QkdudkNUb0ExZjhnRFF4RmlxdVVDWmpNN2M5RmxlWDJJTTlZ?=
 =?utf-8?B?T05VSnExTVVybWU2ZjY5c0J4d3ZCMmxQSHNIY1UwOFVzWEUrRjB2VTBTWHNI?=
 =?utf-8?B?RFJhUVVjQ0VaMndLMlpveDBzR1MyaEg2VVdreTJXRmt6Y0pyekRSRFpqMTNP?=
 =?utf-8?B?WXFoT3BXNFAvTWhKRjVIeC9OcE44QTY4UmEyQUlYQXFFcWFlNHBmZC82SEN1?=
 =?utf-8?B?c1BBZWtKQTREKzN5dTF1dnNuMU5LZERyL1F0cVVtVkZBa3Bhd1dmbjA0VVZC?=
 =?utf-8?Q?owkJeVOmY/xUyPKIawShkkjwf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e0ed0d-8351-456c-42da-08de17a3579b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 10:59:05.1540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hJ+oPuHQiDSU6RThtd9A7X1gOxJW2YmyYKMvGsUrsxmxUv20R+UYzXoR22+yP4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7144
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

On 10/29/25 21:53, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 03:06:22PM +0100, Christian König wrote:
>> On 10/17/25 10:32, Philipp Stanner wrote:
>>> On Tue, 2025-10-14 at 17:54 +0200, Christian König wrote:
>>>> On 13.10.25 16:54, Philipp Stanner wrote:
>>>>> On Mon, 2025-10-13 at 15:48 +0200, Christian König wrote:
>>>>>> Hi everyone,
>>>>>>
>>>>>> dma_fences have ever lived under the tyranny dictated by the module
>>>>>> lifetime of their issuer, leading to crashes should anybody still holding
>>>>>> a reference to a dma_fence when the module of the issuer was unloaded.
>>>>>>
>>>>>> But those days are over! The patch set following this mail finally
>>>>>> implements a way for issuers to release their dma_fence out of this
>>>>>> slavery and outlive the module who originally created them.
>>>>>>
>>>>>> Previously various approaches have been discussed, including changing the
>>>>>> locking semantics of the dma_fence callbacks (by me) as well as using the
>>>>>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
>>>>>> from their actual users.
>>>>>>
>>>>>> Changing the locking semantics turned out to be much more trickier than
>>>>>> originally thought because especially on older drivers (nouveau, radeon,
>>>>>> but also i915) this locking semantics is actually needed for correct
>>>>>> operation.
>>>>>>
>>>>>> Using the drm_scheduler as intermediate layer is still a good idea and
>>>>>> should probably be implemented to make live simpler for some drivers, but
>>>>>> doesn't work for all use cases. Especially TLB flush fences, preemption
>>>>>> fences and userqueue fences don't go through the drm scheduler because it
>>>>>> doesn't make sense for them.
>>>>>>
>>>>>> Tvrtko did some really nice prerequisite work by protecting the returned
>>>>>> strings of the dma_fence_ops by RCU. This way dma_fence creators where
>>>>>> able to just wait for an RCU grace period after fence signaling before
>>>>>> they could be save to free those data structures.
>>>>>>
>>>>>> Now this patch set here goes a step further and protects the whole
>>>>>> dma_fence_ops structure by RCU, so that after the fence signals the
>>>>>> pointer to the dma_fence_ops is set to NULL when there is no wait nor
>>>>>> release callback given. All functionality which use the dma_fence_ops
>>>>>> reference are put inside an RCU critical section, except for the
>>>>>> deprecated issuer specific wait and of course the optional release
>>>>>> callback.
>>>>>>
>>>>>> Additional to the RCU changes the lock protecting the dma_fence state
>>>>>> previously had to be allocated external. This set here now changes the
>>>>>> functionality to make that external lock optional and allows dma_fences
>>>>>> to use an inline lock and be self contained.
>>>>>
>>>>> Allowing for an embedded lock, is that actually necessary for the goals
>>>>> of this series, or is it an optional change / improvement?
>>>>
>>>> It is kind of necessary because otherwise you can't fully determine the lifetime of the lock.
>>>>
>>>> The lock is used to avoid signaling a dma_fence when you modify the linked list of callbacks for example.
>>>>
>>>> An alternative would be to protect the lock by RCU as well instead of embedding it in the structure, but that would make things even more complicated.
>>>>
>>>>> If I understood you correctly at XDC you wanted to have an embedded
>>>>> lock because it improves the memory footprint and because an external
>>>>> lock couldn't achieve some goals about fence-signaling-order originally
>>>>> intended. Can you elaborate on that?
>>>>
>>>> The embedded lock is also nice to have for the dma_fence_array, dma_fence_chain and drm_sched_fence, but that just saves a few cache lines in some use cases.
>>>>
>>>> The fence-signaling-order is important for drivers like radeon where the external lock is protecting multiple fences from signaling at the same time and makes sure that everything stays in order.
> 
> Not to derail the conversation, but I noticed that dma-fence-arrays can,
> in fact, signal out of order. The issue lies in dma-fence-cb, which
> signals the fence using irq_queue_work. Internally, irq_queue_work uses
> llist, a LIFO structure. So, if two dma-fence-arrays have all their
> fences signaled from a thread, the IRQ work that signals each individual
> dma-fence-array will execute out of order.
> 
> We should probably fix this.

No we don't. That's what I'm trying to point out all the time.

The original idea of sharing the lock was to guarantee that fence signal in order, but that never worked correct even for driver fences.

The background is the optimization we do in the signaling fast path. E.g. when dma_fence_is_signaled() is called.

This means that when fence A,B and C are submitted to the HW it is perfectly possible that somebody query the status of fence B but not A and C. And this querying of the status is faster than the interrupt which signals A and C.

So in this scenario B signals before A.

The only way to avoid that is to not implement the fast path and as far as I know no real HW driver does that because it makes your driver horrible slow.

So of to the trash bin with the signaling order, things have worked for over 10 years without it and as far as I know nobody complained about it.

Regards,
Christian.
 

> 
> Matt
> 
>>>
>>> I mean, neither external nor internal lock can somehow force the driver
>>> to signal fences in order, can they?
>>
>> Nope, as I said before this approach is actually pretty useless.
>>
>>> Only the driver can ensure this.
>>
>> Only when the signaled callback is not implemented which basically all driver do.
>>
>> So the whole point of sharing the lock is just not existent any more, it's just that changing it all at once as I tried before results in a way to big patch.
>>
>>>
>>> I am, however, considering modeling something like that on a
>>> FenceContext object:
>>>
>>> fctx.signal_all_fences_up_to_ordered(seqno);
>>
>> Yeah, I have patches for that as well. But then found that amdgpus TLB fences trigger that check and I won't have time to fix it.
>>
>>
>>
>>>
>>>
>>> P.
>>>
>>>>
>>>> While it is possible to change the locking semantics on such old drivers, it's probably just better to stay away from it.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> P.
>>>>>
>>>>>
>>>>>>
>>>>>> The new approach is then applied to amdgpu allowing the module to be
>>>>>> unloaded even when dma_fences issued by it are still around.
>>>>>>
>>>>>> Please review and comment,
>>>>>> Christian.
>>>>>>
>>>>>
>>>>
>>>
>>

