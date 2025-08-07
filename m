Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B932B1D9C3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6870210E339;
	Thu,  7 Aug 2025 14:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NGZNk1gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA00610E339
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 14:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlG/jX9gTgrFCODU7utU9EhetrTfzLYpP1HnsuEl03KbKlu+YvOP5jXj4w9gpaR/0SlDlZut8bgIOnwQ/dmp3Xz8cAYpzXS+duLj7WG5IkaCGZOFdPDozVxu3C2QIXO9s1uAb17MeKUUtrEMRQjZu4MaUn7poUwcrsjdmaKTs0SZhyKs0FDtJlFG1hwsz1EAkJHsST6DqRnH4ijd7d4j+2PbKZdP9G6HLD7kPghYtP5JJ5/Cm4GbumIPdcUs/9vQvc6kIfkI913REINzYqkS3SjX5s7+RiFZSCPe3rSWeiQOlCxDHUwVgKv5+j1nPQRVOH0BNHhXgqBWugImLLgonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myy4H46A2jJHcM50tCJLGXaElsSzqN33PGdnzskVQAI=;
 b=DudT/COE7oq/q8blqBufLIy8ycoK1RGrYjde5X17Fjeq56Wgk/15s48PoAHi1wuwjINSgBXdaam4kqSQJbtsEl5zalzp2hKWcwCZB3vqVSw8BnXgPSp3YMGLgjTQ2DHdYiay327KUscNNGqCZEwfQhzk/iHrE868yWSgnrr4+eANstmnyULE1ti8o1ElF2imEKRPtt6fbOWz/ZogmizFO4LJC8tsYRyk8rZGWyrlnQdVa54r5IloVYhnp7y7pEinsUjMyzX25Fkg4kTNem+lAx2oR1JnkAzT8d7i0Dehxwi/tRi/x79Tj9913RcL/ZijyM/y38fLPHEIbc2WxP4NPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myy4H46A2jJHcM50tCJLGXaElsSzqN33PGdnzskVQAI=;
 b=NGZNk1ggRhlfi3u2aoOmcLUjg8PEG1obXzRttKXcKqtioBfUbVZsskW4jbNMjOie4b5ch4KZ9HR8T1IBoIfQbsFbMusiV4oV3tWCNBIX8Mec/2/CSKcnkAm8M8Kp7ucXdfQn770Sm/fkVQ/c8U9eOPvbMX9IlFP5fXvM36IiSbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 14:15:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 14:15:13 +0000
Message-ID: <9caf8709-91ef-445a-aa4e-aede1899f364@amd.com>
Date: Thu, 7 Aug 2025 16:15:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Extend and update documentation
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250724140121.70873-2-phasta@kernel.org>
 <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
 <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
 <c1f7c4adaa0ac8d1994046436da8eb64bba5e06e.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c1f7c4adaa0ac8d1994046436da8eb64bba5e06e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8a2182-bab2-4a5a-af04-08ddd5bcd317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZBYUtxODNhZW52YUxVbUhiY1oveTZUTmFwOW9ZbUEycWxzNWNkUU9NZW1t?=
 =?utf-8?B?M1RXWnlvelg5WlB5b2oxb2NEcGtnMW9tZDFMVjZnYjE4WnRzZXFDUit0bkNx?=
 =?utf-8?B?b1JpbElDektlN2ZqTU9pTFRHVXJmNW1nSFZ3bjVzdUVyTmNlRDZXd1pad2NB?=
 =?utf-8?B?Nkh2MVZrTVBIb2hQZ3Q4YXYxRjA2QXRNQ2lWaHBselRlNTl5NWpzWmgxaXFC?=
 =?utf-8?B?bExPa1F0b1RXSkJXdGNmWmEweExDMG1QMlRUbHdZNlVnU2FXV1VlUFVUZFoz?=
 =?utf-8?B?VGxpMnNXZkJzMzBwbksyNnQvNHNITUhYVmI1cVVCSTVXczJFdm85VUViNDN2?=
 =?utf-8?B?eTJkNDlmVFUxZ0djUDRlUlVxMk8wayt0WVFwMlVIM2VvVFl5MGorL0hQY2Vi?=
 =?utf-8?B?WTVoS0tkVDNMdFFBa0RkOTdjOFMvZUZrYThFb0drNmlkbEROR3JiM2phdG0r?=
 =?utf-8?B?Tk82QUNtT0VtRGtYaWFQVkREb2hVZ3ZhSTUxTzN6K0pTVmZGZTRvNnMybjJr?=
 =?utf-8?B?RjlvMDBMNmluOUNpdlhndi8vWmF3SGkrc0FBa3NFL1NzM0t4WlZyUHAwUHc5?=
 =?utf-8?B?eG1ESjl3TlE5aVNYUWFVV0lSYUFYOTlNK2RGeCtMejNiMVVoaTVNT2hhVTRz?=
 =?utf-8?B?TVp0TzZUTHl2UDJaeHRrRFdEdm00VEFvMm9FeEVWdzVqblAxMElJelNWUzRB?=
 =?utf-8?B?d0hDb2ZrUW9mdVIvM0RnNWo0d2MxaTFoSHlkNWJldWpUbElQa05RSEcyRXM0?=
 =?utf-8?B?Vm1lY3RpbXJleDJPM3dVNnpJc3RONVI5R1FTUjdGbFVCRkNOM2dndm90Rmxy?=
 =?utf-8?B?OEhYTVBVUUgzNHBYK3pieVhhYXQ1NzBuY3kvcDRLMk50TzVsd3VqSmZNVFk2?=
 =?utf-8?B?UTJDa05lK2RGNTNPVHVmaGtiakQrMThXTU0wdmhsSWFXdWZoODZ1cUkyZlJW?=
 =?utf-8?B?ZDFhWVp4Yjh4S0E4Tlh5dWEzd3VYcGlhRDNSeW1hQzNOUUZ0OGZvUVVxeDdl?=
 =?utf-8?B?OG1iczFxSE5QV1hKdUtnNmNZdStGLzdDZ1RkVXJBWGY3YjZhMmZ4SFBHWTM1?=
 =?utf-8?B?T2xVS2w4SW0xcjcyY25wZ3JKNTZTRmg4UytSZTVYRzMvc3VVb1Rnd2xSRHVn?=
 =?utf-8?B?dUJKaURUbjdoYXNnMXpqM3VBUGZwTkp6dmlwSVpMRTd3SEJwWkNjMjFHU2Fw?=
 =?utf-8?B?ckhNUDFyR1NmS3ppbnBjYm1pMlNNcUlRbGovNktJNC93bjFQalI5VjdZT2l1?=
 =?utf-8?B?MXhyMXc4VlcybUk4ejdIYnYrSmoyTkIveHVjNG9OSjQxQVRrUjRzZGhwcHlE?=
 =?utf-8?B?L0JqZ0pDUVhpVmYyR3lyVXlNTHZ0TVdQeittRzFvc0t5K1ZWS2xXY1E1WkFD?=
 =?utf-8?B?RlF0bnpTb3hKRkc4TVZMWDcrMnNjQThmWHdwRU5Rb1dneURvVnFpK1F3Q1pr?=
 =?utf-8?B?YTNpTWl1b1hUSlJHSnpZUzh1RlBIeWRRc2NVVmxSR3pPT0IxdHExUEFTTk9z?=
 =?utf-8?B?blR3OXBVc3BSMVVUTGYzME9lSzZRRHZrRUkvdlBXVk8xamw0bDhNUGQyZkxk?=
 =?utf-8?B?WkxWM2x1YkNNWEp0VDdnUGdOeGlYc2pad3J4eS9UQ2RmN3ZjblNqbVdEN2pm?=
 =?utf-8?B?R1I1VEx5WE02azdzeGp2VGlySUkrSklmRnpjdmtxWUFLRlN6Mm9tZ3VsZzF4?=
 =?utf-8?B?TVNzRXVsZ2lUckNjTlNacVZOSXF3SG1GcWRFRldtMXJXeGpjZGY3Nm9UZHZ3?=
 =?utf-8?B?YzRLUVR4NDlUcTBVRkNzOWFnV3grWmNieGVaSUdqMVBkVUpRQ2h4T2c2VUFU?=
 =?utf-8?B?Ni84WWxnQVhQSUZyM012amx0OVFRY2g0NUgwQkI4UlYydXFwZ0NnQ0JyYWN5?=
 =?utf-8?B?TUtKbm9vT1J4ZVdabE5sM0Vnc2piTENHbmxTL2h0RXZTT3dZamlWNURxZmpr?=
 =?utf-8?B?NWFCSWZrSGx3bXI2bHRWYWtPRE9kemVBSGYwTFRxZjQwV292eVpOQkRycE1x?=
 =?utf-8?B?NjhHQkI5dWZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTFNaFpMTU1uV2Nmb1RYem4ySUZtUXhVNGE3YnNlZnhtV0NSeURyVTR4WXRT?=
 =?utf-8?B?NVdRWXpPQmk2czRzZjFMbVVDL3BYZUltVnJ0eE4rNy9ocW5wY2JhM0lCa0wx?=
 =?utf-8?B?VDMxRlptYVZGOGZabC9YWXNHRWVBdGd6L0tkYVVKa29zZlVkdHFLM2NOaUxS?=
 =?utf-8?B?aXRZU0tDWndob0Vyb1hhMmhBbWxmdWk4UFFTTC9kS05MN3RvbTJiaUVsaVZz?=
 =?utf-8?B?Vk52L0tBaThqRWdyUVlOampFZkdDVUdzL2VTU3FUYlNYcDZEUE1rMmJPRUZn?=
 =?utf-8?B?WC9QRXBsblY2ZlBDT0xWcTBRdGk4WXN3WDZrbGdPMzZjR1FEbUNyelVHUXlK?=
 =?utf-8?B?b05mSzFtWjJ5ZGZ3N09MdGdGcjdsZDI0U0pGQTQ0ckNLcjJmc2tFdW5YV1VS?=
 =?utf-8?B?ZFB6TkgybzFlREJOMlgrK2ViYUhVSUpwYldLM1ljQ2YzdmdYL2tDL3dwaW8x?=
 =?utf-8?B?dktYOUZnQnVJVnBMU0FPY0JqeGIzWU95Qmw1OUVsTHQyeVdwdGJ5OWMyRjR6?=
 =?utf-8?B?OHdzQ003YnhwUWhxY3dIUngvWVg0S3Mvb1lleXdaUkRUZnloYmdDNlJFdmRo?=
 =?utf-8?B?L3YwL25MdjJqVlZMZWd5NTNqemVzK012N1pER0tOUGFodnEvRU16ZXB5NHZD?=
 =?utf-8?B?YUhCWlg2UHA1UXUrZXJzdzlnZW9UY1Rtbmo0cVhlR2N1aFRJR0Q3cDZDcThN?=
 =?utf-8?B?WVpwaWwxZTNCWi93MHBPZzA3MkdRekJoM3QvNFVoRWhKcWczRG5OUFY5RWNV?=
 =?utf-8?B?YkxZNlVtS01od1lGdVZaN3NsajR1QTBNSUpNK2hQamdHdTMvdTllcGNPS0I1?=
 =?utf-8?B?NWNRajVnYzlyZWZUeE9TZEdMUk1rUzJyYllRSHFSNWlNRS9tVUxnWDhhcFlv?=
 =?utf-8?B?dlFrelVEOGJQY01CRFVpYlllQldrKzF4ZUR4OVVOeXNMbXNxS2dLSUJ3L0Fr?=
 =?utf-8?B?Q2hEQlc5L2RkaE1DcTU0Mkw5b0hVV3ZyODVBektqMzdHbEJVQ1BNRE5vSGor?=
 =?utf-8?B?VzNZWTU0YW91akRCL3A4U1ZNZmp4NUlacU9uOWNTMlRTWWpvR0xVaHNQcmpP?=
 =?utf-8?B?TEJQNlRKRWx1aVFOcnB5eEpPZ3REZXJkVk44bExQWGhLSDRLYndrMnB4VGRB?=
 =?utf-8?B?TmVZTmRQbE9qTFkxWjhBQ0JGNERvWTNXY3AwTVVNRWN5VmdoUFRxTEU3b2ZY?=
 =?utf-8?B?emtSN25pV3YyQTlXem5Wci9MYmFVR2N0S2JlWDd0Mnd6UzhOYWNzSjA0Y2J5?=
 =?utf-8?B?SEhtUlJjdVRySS81cVRxRjRNdnIvOXNBeFZSY2taVGRNMERmcDZvaXloWXgy?=
 =?utf-8?B?bVRobDBpZEt6M0l6WnhyUkNLR2pIVGU5c1gzWUlDRkJJeDRJNmp2VFIvNXlW?=
 =?utf-8?B?OERGU1l6ZC83cGFxT0Rab2ptWDZoQkpDWi8waGhpdHd5Mk92NUQzdlRzdktV?=
 =?utf-8?B?V3pPKzlRdldZS05hYzF0Ny9UZVR2VC9oYjdmT1dPcEFFQXlUWjM2aE54ZGVo?=
 =?utf-8?B?SHpZT0VzUHd2MkFUNDFncTJXdTl4Yy9BbVZucTcrRkVPT2w4d0JUaHVqRHBa?=
 =?utf-8?B?dFdRRmlwS1NBWVhVQ0s5VWhLTTMyd2tXaUNXUi93cTU3U2FvS2RocDFmb2k0?=
 =?utf-8?B?dmtQUzdibk5RamZWa09sc2txNVV4Zm9ObkFvMHhJR3pkSS9VcGJERVNKYWxw?=
 =?utf-8?B?eTVBWFZ6bXBmQVdaQkUxdGFJN2NBWS9acUl4VjZUU3RJb1Y5czlYczY3bXRQ?=
 =?utf-8?B?dndIYWNBT1liMCtnay8rMWllOWZaejNyTDhvS21lZ1dNeFhUNEhJUnhEZCsx?=
 =?utf-8?B?U01wNWllcWpaMUxnZWVVS2c5Nml6TEErZ2FjRjdHQ0JZSG9TNkZ4clU5djln?=
 =?utf-8?B?dXRGbHc4RlFzSGRFb3B3ZnBTU3lwaUQ5ZzV0dHgyTnc3aStBS1p0K1JXZ0hS?=
 =?utf-8?B?UDVaakJLM0oyM01QSFZOck9mTUZTKzJnV2YxMHlESzJSYkgxbGNZOVNiNlBi?=
 =?utf-8?B?NGwvbUp0aW9oUmZlQmdCZnpFcENLVDZ2N1VzS3FXRE5sUG5BalFubC9oYjhG?=
 =?utf-8?B?WWhKSkNxdmgySkJlV3p1YWtNVVZGaDRkRGQxeGozSCtONzFCbFhPU3dXR21n?=
 =?utf-8?Q?hZ1V86wqf5DEGKtzrPK1qidcp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8a2182-bab2-4a5a-af04-08ddd5bcd317
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 14:15:13.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQI5zHHYr0KMCk7zUt5c28VSdUEYGI5zx5+SoHrqagh0v8pDXmjyZl/tdm2LYE5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325
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

On 05.08.25 12:22, Philipp Stanner wrote:
> On Tue, 2025-08-05 at 11:05 +0200, Christian König wrote:
>> On 24.07.25 17:07, Philipp Stanner wrote:
>>>> +/**
>>>> + * DOC: Scheduler Fence Object
>>>> + *
>>>> + * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
>>>> + * time from pushing the job into the scheduler until the hardware has finished
>>>> + * processing it. It is managed by the scheduler. The implementation provides
>>>> + * dma_fence interfaces for signaling both scheduling of a command submission
>>>> + * as well as finishing of processing.
>>>> + *
>>>> + * The lifetime of this object also follows normal dma_fence refcounting rules.
>>>> + */
>>>
>>> The relict I'm most unsure about is this docu for the scheduler fence.
>>> I know that some drivers are accessing the s_fence, but I strongly
>>> suspect that this is a) unncessary and b) dangerous.
>>
>> Which s_fence member do you mean? The one in the job? That should be harmless as far as I can see.
> 
> I'm talking about struct drm_sched_fence.

Yeah that is necessary for the drivers to know about. We could potentially abstract it better but we can't really hide it completely.

>>
>>> But the original draft from Christian hinted at that. So, @Christian,
>>> this would be an opportunity to discuss this matter.
>>>
>>> Otherwise I'd drop this docu section in v2. What users don't know, they
>>> cannot misuse.
>>
>> I would rather like to keep that to avoid misusing the job as the object for tracking the submission lifetime.
> 
> Why would a driver ever want to access struct drm_sched_fence? The
> driver knows when it signaled the hardware fence, and it knows when its
> callbacks run_job() and free_job() were invoked.
> 
> I'm open to learn what amdgpu does there and why.

The simplest use case is performance optimization. You sometimes have submissions which ideally run with others at the same time.

So we have AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES which basically tries to cast a fence to a scheduler fence and then only waits for the dependency to be pushed to the HW instead of waiting for it to finish (see amdgpu_cs.c).

Another example are gang submissions (where I still have the TODO to actually fix the code to not crash in an OOM situation).

Here we have a gang leader and gang members which are guaranteed to run together on the HW at the same time.

This works by adding scheduled dependencies to the gang leader so that the scheduler pushes it to the HW only after all gang members have been pushed.

The first gang member pushed now triggers a dependency handling which makes sure that no other gang can be pushed until gang leader is pushed as well.

>>>> +/**
>>>> + * DOC: Error and Timeout handling
>>>> + *
>>>> + * Errors are signaled by using dma_fence_set_error() on the hardware fence
>>>> + * object before signaling it with dma_fence_signal(). Errors are then bubbled
>>>> + * up from the hardware fence to the scheduler fence.
>>>> + *
>>>> + * The entity allows querying errors on the last run submission using the
>>>> + * drm_sched_entity_error() function which can be used to cancel queued
>>>> + * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
>>>> + * pushing further ones into the entity in the driver's submission function.
>>>> + *
>>>> + * When the hardware fence doesn't signal within a configurable amount of time
>>>> + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
>>>> + * then follow the procedure described in that callback's documentation.
>>>> + *
>>>> + * (TODO: The timeout handler should probably switch to using the hardware
>>>> + * fence as parameter instead of the job. Otherwise the handling will always
>>>> + * race between timing out and signaling the fence).
>>>
>>> This TODO can probably removed, too. The recently merged
>>> DRM_GPU_SCHED_STAT_NO_HANG has solved this issue.
>>
>> No, it only scratched on the surface of problems here.
>>
>> I'm seriously considering sending a RFC patch to cleanup the job lifetime and implementing this change.
>>
>> Not necessarily giving the HW fence as parameter to the timeout callback, but more generally not letting the scheduler depend on driver behavior.
> 
> That's rather vague. Regarding this TODO, "racing between timing out
> and signaling the fence" can now be corrected by the driver. Are there
> more issues? If so, we want to add a new FIXME for them.

Yeah good point. We basically worked around all those issues now.

It's just that I still see that we are missing a general concept. E.g. we applied workaround on top of workaround until it didn't crashed any more instead of saying ok that is the design does that work? Is it valid? etc...

> That said, such an RFC would obviously be great. We can discuss the
> paragraph above there, if you want.

I will try to hack something together. Not necessarily complete but it should show the direction.

Christian.

> 
> 
> Regards
> P.
