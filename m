Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E1C150CB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050D110E5C7;
	Tue, 28 Oct 2025 14:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gBuqNiFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB5610E403;
 Tue, 28 Oct 2025 14:06:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpbARjiZtWHAOwgSZjDpSIJYZq2KIUgFtkc5cLt6acxsgc/cxRWLYqXGqz9Dd8vRQlaSuNNJxsERAXfM3QnXct/xHqC1bGKmatqTSxLsAmvKWNRO/1wYpkd5BjYUiCdjKg7OgG1p7un9GjmT4yRnW7ko9wjYirbA7mspjk3lXWyp6lpMxh0BS0e9CeUQ+ck+mb3LRcaNEOiRR+G749ltAYMzmFMwD7RAOeJW1tvrJ5RzMHguZ6scDjgwhxEUxSXJT2+Y3zUoLFlnIU9MhSWnM6jLKDHak7VBwb5dQCrWuk/FS5izXqPSa0aVQIIahRHnCJI4EZmw6WMjzgB1YTIW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUvPzgeYvGK2RWo/sZZZe4HK96pE+aDkTPp219Fp7NI=;
 b=GJ3SJoBYLX+g+NmInUtyqSnzcj1PKXubMKQXsZgngXqujeaaPHp47gYZR3c/BpxpHfKpHdL4XlGwQVOMVvBp/u64oUEqeKK3wPDPAYmv65pqCFddIiV49nGKYMZnInxS4c/DcbMy12S2o/P/WFf7zYjY2CVYwP5WcPCGW9w5fGgCQ1DmulBxbrvu+Ss3v39sDZiUFBjQ1QDc8M1NiSWziLpJmTllywLXsHkkqYnKTklcXON8eg/GWgBO8mfZ8Tf112+ceJ8jajoq+RPh/3U0J3yp0dIbb0+0KBl0LmUu52lnpGpiznOy3vzLhQrhxTs4GmwAZP86GHqdeIhx7XLxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUvPzgeYvGK2RWo/sZZZe4HK96pE+aDkTPp219Fp7NI=;
 b=gBuqNiFKunPnbNiVfk0ZCW4wBbsZWvfjdmE9iLcl+cQ3YtY2m7uvSf30CG08YNAKArFpC/cwlsZY703E65F2QeoH9nJihX7SO/uT0deXcCOnkxuScTgSJ6l8fZjU0Ur+9TUsgNDvKHcDL1c+yaw0rwUkcS/U+C39HkMUoOU3WaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 14:06:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 14:06:26 +0000
Message-ID: <2da2077c-4226-4ba4-8935-e7e15e6b9765@amd.com>
Date: Tue, 28 Oct 2025 15:06:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Independence for dma_fences!
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
 <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
 <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0e7f3ab50a2c30f193491bb82f97004150b99772.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0504.namprd03.prod.outlook.com
 (2603:10b6:408:130::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfcfdcd-a38c-4042-fa97-08de162b2f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHpPRkVkeUJXSmZUYk9JSmFXVGV2N3BYMXh6UmVPWVUvbEJBTUpiRUE5RHBE?=
 =?utf-8?B?QzQrUWpzcmhpbHNzN0JIcElJcy9ock9OMVdxYmJPWk80QkhZNHFUZUdIa1ZW?=
 =?utf-8?B?NmQ5RnBrWU00ekxndHNIQ0FEQ1J5S0ZWOHFkMWJXSHAwQk45czJPTGVTdFBQ?=
 =?utf-8?B?OFUzb0FUN2tNQ0l6UXhSV1p5cSttWXg1aDF1RGI0bm82MHhFSk93WHB2WllO?=
 =?utf-8?B?Wk1NdjVKc0pKZmMyNllBU2Z0WDlIdVduYTJXZDB4bUxsTGVtVjI4Zm1OZ3Zu?=
 =?utf-8?B?TFlIN1owVHBkNVVjV1IrR2YxMWVxcGFXbnZlNHZvMG0yK21majU2MzJZSEpY?=
 =?utf-8?B?RnN4UTRHTEZLeGUvU0twNDlxaTBscVdBTzVmam13SkFzTXM3TmlJTDVFT1ND?=
 =?utf-8?B?UjdlTUVSMktacktCSlRrVmhoZnRueTBKcDV3S1c3NDl6dUZIMkJtMksvWUNa?=
 =?utf-8?B?M1JjbDZscFdLMW9kQi8yQU1XNG03eHh2Q3FoZHpLSnFTQzFiUDJsVnBScGl3?=
 =?utf-8?B?cU5GNnFOVDZhZk9qbUQ3TFFyd0pDQ1dLKzV5QjBLVHQweVNUOUhOcGI1bXdP?=
 =?utf-8?B?ZUtKVTFNcE9YdGZwTEZOZG1zQW5ET0ppd2JwRE1URDh4NGZ3WEwrNmtWMnQy?=
 =?utf-8?B?cGZiRDAxOEVQSFk0M1doYjBWVmVXTERVcG4wbm9vcFNXeUNhTElLTTdSaXZp?=
 =?utf-8?B?dnh2RmdFdlRHMU4rOWNESWhhRzNoWVNJWnFHc1dKL0ZraFNOUUVrNW92Q2RW?=
 =?utf-8?B?QVFBV3ZwN1QyaGdESDF6a0Vwc2Nyd3R0QXI5ZThicmxHM2VYUG1zR1BuOWND?=
 =?utf-8?B?WlAxNE9nc21aRjUwWVdjSHZlOXdkUnAvRW1haUFSQnJKTEJKL2VKNlMzVGdo?=
 =?utf-8?B?OXJ3RDJZRGFhUTZiZjh4UUt2QmpvMmZmRXJoWmpWVy9ZM1VVbGhRd0lSbEwr?=
 =?utf-8?B?b0k5UDVpMU14UWxQM2l5RXRGeTY4bis1MTBWMGlZQXArOTVTUXlMc3puY3FE?=
 =?utf-8?B?QXN4Nll0c3hIVDBkUFk5WlAwcmRacDl5V0Y2Q3VSUzhqeEhmc2NCTkdDSHV6?=
 =?utf-8?B?UlUxdW1OSm9FS2J6bWRzUHppNlJvYUxSRjVpVzBXY0xNcmJqbFgyVHMzM1JF?=
 =?utf-8?B?Sm5ieHNLZ0dxb3BvdzdpMk9wdkowWEFNREJWcWdPRG9YZ1poS0RvSTJNR1RW?=
 =?utf-8?B?N3NhNG5iZDNoSjBsUjRWdE9hY2MwSnBFSGJRS0gza3RyNzVlSlJPVUxieGdF?=
 =?utf-8?B?ekg0S2dhd2ZGN1VNd1hsNHF3bWVmVi9Vc2VsQ3I3VVZxaWNydTNqdXcxZ1pl?=
 =?utf-8?B?UmNKTW1uK0ZqNXhMRVlRcm1MWXlwYmNMVTFORjY3K0R2a3A3bUtnOE1ndnNE?=
 =?utf-8?B?dkVvUUJkeVZmRzE4UThqem0rRFZYcVQ4Mkd3cjMwWEg4NUJ1Q29hOVJrMmZ1?=
 =?utf-8?B?a3JveG9BMG9POGFlM1JZSmE2ZU80Q1RINzJUYmJTUlk3YUh5VFNBRnJPSzdL?=
 =?utf-8?B?bEtCS3Uwbk1IcmU4WnlmK1pVVUR4eEhRYkc5WjFUam9jNktuYWRHczJ0cG9R?=
 =?utf-8?B?V00yMDBiUkZvelJpTWtyUzVOUXl2TmFIVmFuM2s1V3VzbkQrbDJINXNMQ2J4?=
 =?utf-8?B?OFZYRzhxODJjYkRLWkRtTGpXNlZYSUd6Zlk5eWl5Z0JxcFlnM3VrMFV6OERO?=
 =?utf-8?B?c2JFcml2Yk5QdHlJVXoxZCtsMXhXd0ZSZktFajQ5cWx0TkUybm9maXhYNlk3?=
 =?utf-8?B?YmN6UHJHZVc2dGx3eXI1aTcwN3E5bU1QbkZhN0dwQmd1ai91aWJnYnFLT0VU?=
 =?utf-8?B?RmJoclgwWkpIU1FRenI1RStQSHZaOExPMGttSEdxL2orUWQ5OUFzTnc2MmhV?=
 =?utf-8?B?ZjFtN0Z2MjNERC9sdE5sais3NSs4cXVBc1FDRlZuODFsOFZxKzQrZWd6WTc4?=
 =?utf-8?Q?27NDWgi2NxDcIxwqJhca/4UOz5ZChm6K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qnh6VmZIalk0UGlidFRDNnZxYVhKM21keHpJM3h3MDQzOE5TeHA5RG1ISFl2?=
 =?utf-8?B?aDRrVERIUXJ2bHFTNEViNDY0WTdCKzRYVEhyQVNGMGxNUkc1QjUyaFVkU3hJ?=
 =?utf-8?B?UllkUUoyQ3FXTm9sSmdEZENMMzNpVDg4bnU3eGFDWU5zRE5PdnpZbERzZ2NF?=
 =?utf-8?B?NGRXRFVxV2NxL2FSZFJSNEduSWx4eWZnMCtOVnMzNHB3SWpFblZvOUJ3UWs5?=
 =?utf-8?B?UWRvbG92LzRDYXBJcUhISXU5eStPNUtaaFU3S3NDSm8yRVowbU9zZjhHWXJY?=
 =?utf-8?B?U1J1Y0twSUVUcFBYZzZtVTVYMDhad3hONmgrc084OTdqNHFKbzVCVmNjeExD?=
 =?utf-8?B?a0JMZi9UY01hVG5EakFITEFtbmFaOWR5MHA2N2dUZDI1TUl0akttZG9ubkVB?=
 =?utf-8?B?clJIb2MyciswUXUweE1ZbmhMWUQ1UHd5THd2V29QclRTVkZYTHNPanNWV1Uw?=
 =?utf-8?B?dW9STWlLNy9JaTlmSVMvZ21EZnplak1FZFl5Mmk2T0IzcHNCalR1OWVGREhi?=
 =?utf-8?B?QmN5TVd5ano3RUUyVTc0dnZ3M214OXErNkc5cHBFZU03SUN3ZmpqN0NtUGpj?=
 =?utf-8?B?S0wydEUrY243aW1tUjIvQ2hZeHFHa1lES2hWcG1kUTNHT3p5bWRYdEdLbGU5?=
 =?utf-8?B?NHJtVHRrTFl2ZFhteWg1eGdRVG14MStIRUl3ZDNWdkUvZVNzRGE3Z0psaHh5?=
 =?utf-8?B?TWUvOWtzNGdidXhXNGhJdVpnV1pTbFZNb0ZvN25TbzNtUUF3b0JveDlCcjVN?=
 =?utf-8?B?OUd3NlRJWjJJcUZqWWNtdFN0VmxGMGltSVVES1JMMjFPMGFsQjBLWUNsNnFn?=
 =?utf-8?B?YTBxb09kS3pzWjRFSTlEQ0JTc2cxUkl4MDdSYkxqSjBRSFZEY1lFU2NDYVB0?=
 =?utf-8?B?Vm5tQ2Iya01qeEphSEIrT1E3c0VZTFJBTzFRMTJEc29EUDVuMWV2MFFDcWw1?=
 =?utf-8?B?dkpMU3lteFh5RXpVM1F5R28zQW54SFNRN3BHTlVSd1JUR3FNRFRheW5MbmFl?=
 =?utf-8?B?ZWp3bmYzMzJqYzdyK1FzYzJWSnVnRU1zMUJOREFYK1lhUTU1UFBWR2czcDlF?=
 =?utf-8?B?NStTMnlVRkF2ME50YVJBTGFuREU0TXhtZDV1b0dUUDRZcjMwdWRVa3cyeklL?=
 =?utf-8?B?c01DOWtLdlp6STFlUHlFejJidHBYb1lZa0xyaEhCeEROeVBFbVFvTUlkOC9n?=
 =?utf-8?B?aEdOSFp2UWVBL3VyU0xGL29nZG9SanZIUEhkMGhzcTYrb2ZlVXlMVGNXWThD?=
 =?utf-8?B?djRHeEZvTVRzdFlmbHYvSU9LKytoOHlQTkRLN3MxQmRpVkwzVTVRbk1hUkZ2?=
 =?utf-8?B?VzVrSzkvUUE4UkdzQzJCSzBaOTA1SXZSVlB1czJON0lBUWhoc3poQUpFRVNi?=
 =?utf-8?B?c0pYcnd1L1dVL0ZVQ0txMldpbXNIdFVFYjhoSXZ5alJibHFlSldYNWRpYThB?=
 =?utf-8?B?cWlhdHFVMDd5T1NCNkJqWlg4NXBKSThBM0g2MHM1em9XcXJia0RvUzVOQ1dM?=
 =?utf-8?B?L3BJaEZzVUpaUDJlZVlwN1V4d1hWdm1PTFpFcTh4RC9TeXNpaTJpYzN4bG1V?=
 =?utf-8?B?VVFJdnRTRzQrNEhCdTNsdVMxR3NEMDI5Q0dTNlNoaVM3Yml6N1FSK0RnUFA3?=
 =?utf-8?B?Y0FmYlYxYnMrNHVBU2xaWjZ0QXdwNGVhMHcyS1N1QUtqZFVCSGk4MXovMGM0?=
 =?utf-8?B?WHN1MThsTFN4Y0hzYXVkekxLUzlyenBNSjZmZVVBdGxpWndNNkV2clNCVGlk?=
 =?utf-8?B?S3lNMHV6R3ZqSFFNb0hwc1lOTVlSU0ZqUG1Tc3Z6LzVUeXFwUDBkOVZwT2Er?=
 =?utf-8?B?bHR6RE94Q3B1Z2FQbmtmd3ViV2YvTHo3b2RybGhZQ1R2NjdpQzJ0TGg1ckhP?=
 =?utf-8?B?V2lHc1UremZuUGx4Zm1DOTBCczhmRGtiNlRpWUVXT3k3azM1bEVjVWNDUXJT?=
 =?utf-8?B?NW1MbHVOYnhKcjFDQ0FnTnVZRlpTYVFSeHY3dHM4VitjekJYZ2VwTXlkTStB?=
 =?utf-8?B?d3BnUUlyRVdqekQ0NlV3aFJJaDJORXAyS2dNeE5EYlBtWjlsZEhNcldDT0dr?=
 =?utf-8?B?dTFkZXdIQWpRL2J0ZXpkSDhwUGxEb2xwelRQa1RFbGUzYk5sZnlDMGl4VDJ6?=
 =?utf-8?Q?b01VgPU523EWhcdINwFRN49fr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfcfdcd-a38c-4042-fa97-08de162b2f32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:06:26.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN+w9L6R7lX1w4p1YxbENSo3Dfhy9EEtBeN10k4BZ7OoQK/kZoguyYOvMP/D3AB+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630
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

On 10/17/25 10:32, Philipp Stanner wrote:
> On Tue, 2025-10-14 at 17:54 +0200, Christian König wrote:
>> On 13.10.25 16:54, Philipp Stanner wrote:
>>> On Mon, 2025-10-13 at 15:48 +0200, Christian König wrote:
>>>> Hi everyone,
>>>>
>>>> dma_fences have ever lived under the tyranny dictated by the module
>>>> lifetime of their issuer, leading to crashes should anybody still holding
>>>> a reference to a dma_fence when the module of the issuer was unloaded.
>>>>
>>>> But those days are over! The patch set following this mail finally
>>>> implements a way for issuers to release their dma_fence out of this
>>>> slavery and outlive the module who originally created them.
>>>>
>>>> Previously various approaches have been discussed, including changing the
>>>> locking semantics of the dma_fence callbacks (by me) as well as using the
>>>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
>>>> from their actual users.
>>>>
>>>> Changing the locking semantics turned out to be much more trickier than
>>>> originally thought because especially on older drivers (nouveau, radeon,
>>>> but also i915) this locking semantics is actually needed for correct
>>>> operation.
>>>>
>>>> Using the drm_scheduler as intermediate layer is still a good idea and
>>>> should probably be implemented to make live simpler for some drivers, but
>>>> doesn't work for all use cases. Especially TLB flush fences, preemption
>>>> fences and userqueue fences don't go through the drm scheduler because it
>>>> doesn't make sense for them.
>>>>
>>>> Tvrtko did some really nice prerequisite work by protecting the returned
>>>> strings of the dma_fence_ops by RCU. This way dma_fence creators where
>>>> able to just wait for an RCU grace period after fence signaling before
>>>> they could be save to free those data structures.
>>>>
>>>> Now this patch set here goes a step further and protects the whole
>>>> dma_fence_ops structure by RCU, so that after the fence signals the
>>>> pointer to the dma_fence_ops is set to NULL when there is no wait nor
>>>> release callback given. All functionality which use the dma_fence_ops
>>>> reference are put inside an RCU critical section, except for the
>>>> deprecated issuer specific wait and of course the optional release
>>>> callback.
>>>>
>>>> Additional to the RCU changes the lock protecting the dma_fence state
>>>> previously had to be allocated external. This set here now changes the
>>>> functionality to make that external lock optional and allows dma_fences
>>>> to use an inline lock and be self contained.
>>>
>>> Allowing for an embedded lock, is that actually necessary for the goals
>>> of this series, or is it an optional change / improvement?
>>
>> It is kind of necessary because otherwise you can't fully determine the lifetime of the lock.
>>
>> The lock is used to avoid signaling a dma_fence when you modify the linked list of callbacks for example.
>>
>> An alternative would be to protect the lock by RCU as well instead of embedding it in the structure, but that would make things even more complicated.
>>
>>> If I understood you correctly at XDC you wanted to have an embedded
>>> lock because it improves the memory footprint and because an external
>>> lock couldn't achieve some goals about fence-signaling-order originally
>>> intended. Can you elaborate on that?
>>
>> The embedded lock is also nice to have for the dma_fence_array, dma_fence_chain and drm_sched_fence, but that just saves a few cache lines in some use cases.
>>
>> The fence-signaling-order is important for drivers like radeon where the external lock is protecting multiple fences from signaling at the same time and makes sure that everything stays in order.
> 
> I mean, neither external nor internal lock can somehow force the driver
> to signal fences in order, can they?

Nope, as I said before this approach is actually pretty useless.

> Only the driver can ensure this.

Only when the signaled callback is not implemented which basically all driver do.

So the whole point of sharing the lock is just not existent any more, it's just that changing it all at once as I tried before results in a way to big patch.

> 
> I am, however, considering modeling something like that on a
> FenceContext object:
> 
> fctx.signal_all_fences_up_to_ordered(seqno);

Yeah, I have patches for that as well. But then found that amdgpus TLB fences trigger that check and I won't have time to fix it.



> 
> 
> P.
> 
>>
>> While it is possible to change the locking semantics on such old drivers, it's probably just better to stay away from it.
>>
>> Regards,
>> Christian.
>>
>>>
>>> P.
>>>
>>>
>>>>
>>>> The new approach is then applied to amdgpu allowing the module to be
>>>> unloaded even when dma_fences issued by it are still around.
>>>>
>>>> Please review and comment,
>>>> Christian.
>>>>
>>>
>>
> 

