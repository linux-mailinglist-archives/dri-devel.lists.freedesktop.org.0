Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOotJBKkm2mG4AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:49:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C7171036
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBF610E1D3;
	Mon, 23 Feb 2026 00:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4YJe/RP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67210E155;
 Mon, 23 Feb 2026 00:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBJUw2w7HQxtbrEfcYVhx140iG+FUoqMmmh8HPwV7WRU2gUVWhZbZWGFJk+ogwpkXNzrdx8JpWn2bFr8fTMDkUG/JOhYEzO1EM4vzKh75VuusTio3lnSaNbRXEMcW00wmiUPcZz+WdylPQKlt0/y6IhYQTAT1v9PmCzmDqwgA9PDWFKS94OFrknPGULm1FGimkqwPVWuFxZpidB+/0XaX4glWL19v45CQhC8NV9qceSCoJQu0zwsdNcgETZxP4ovHhuc0OPbUdCZ+1pI/5sJltJBdhrTRYxjCYfgnLmOgL3nRkrKRzzKVktl9LqvwpoJNOdMEK+pPLZ3pRuln2XBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/trVtwYcWlCGfrxeh7z37MpETv0RAFasyE7lixqyVA=;
 b=bjNFu8rjOSCI8AQQzvvJj0H6HQ8VTJ8pWo+yyQnzlgG9XTkS10Vt1BcZ07dHkxU9uOmevejxzWZguV5PWu7rdultjpBLEsi+4dQREMKfH9euflGj8PbNAaGEJFFIgNfjW1Vf8YZkD5nM+4VMykT2XtVtvb6jo8EaKrC7fW2QY2cAOTLbHyO9r5XtR4OK/ijdRHjf+lBMdqj8T50bdOWcrmiL6RTnEFKwmd9mBC0norlpcN+kTBSnW5OfJ7VBNpwbBwkKiSA/oucHNSogAn3g41R1gSK75KqEx1jq4dlmrR5b0IKRavmYXTqFHGeezJtR29UiBukDRhFzOB45zGQ8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/trVtwYcWlCGfrxeh7z37MpETv0RAFasyE7lixqyVA=;
 b=r4YJe/RPpkLD38L9zwBvAeoaLAehNTyGsB8nmVzQn3ArWyp9lru9HKDEa9FGCSGYP96e4vR2Q9OxKiSj6cU0uozgda1UGVN0Qv7lRE200tK5dDq+WPFxuO6VRmKV/ZEOSNo1vWJfg7hqW1A/Ou5QRx6jductocnhMFDw2OufqLVZybkACJiCQhO9CsZniVrIf9ACaxMqlbwkld18W7AqpBtBPdNGdIrwEa1i3CJszLDKmCqerBfmEtt5UDW9hpgNqt/BmUcuLVlHx5H0kY2b82LZAgKi1pznfyy2Vo89bLXlmxgHGvWfO1sZhHZQOdNCmzizBlthjm6xcxYZxg3H6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.19; Mon, 23 Feb 2026 00:49:13 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 00:49:13 +0000
Message-ID: <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
Date: Sun, 22 Feb 2026 19:49:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com> <2026022156-citizen-shredding-5d6d@gregkh>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <2026022156-citizen-shredding-5d6d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac60295-c7c8-44f6-b7b1-08de72755d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVQ3ZW80U1lVQ3JOck9MRk8xSGlmS1p0bk1Fd3N0VVRrZ1hDbWF2QVB1SjRF?=
 =?utf-8?B?cGNneVZ0OUUrSExhYVBrY2hGb1gvWEFRa0ZyalFIenlRKzlmenlXMGlMZzd5?=
 =?utf-8?B?Z093Mkg5UXl4OWNMbm5SWHUyMDQvR3JYV0lqaVBiQ3Q4MThIYUR5NWpZR1lV?=
 =?utf-8?B?SVlKZ0hmY253NHEweC9hbVZHZW5mTk1Lek9mQ3gxZTlwdEdob3hYQ3dkczRS?=
 =?utf-8?B?SkVUbnBtVklnN1lTMFlMVDJua3l5YjVEcFVzU1ZHME93dElXRFRrd2U1RlFj?=
 =?utf-8?B?V2E0NWtEWHp1cWtCcHBrcURrM2tIOXpFd2tyWFhyZktGMk1PMG5kbklMYnQ3?=
 =?utf-8?B?d1VpYWdRbkdzSkJoYnYxcnRWUm53WUZvbGs5YVN3enhPejBnZ3A3RWtpaFV5?=
 =?utf-8?B?OTc1KzdMMHFTOGVsVVNUaHNjaCtrbGpQSzBTdGZLYURCTWVLUTZGaWI4MWlV?=
 =?utf-8?B?TEovVXZiQk1QN0xBVGYzRFA0aHByYlRaaDFlUElZZHZmbUhRamh1YlRNdGVu?=
 =?utf-8?B?OVp2ZjFHQ3YzQ2JmaENxcWR5cnExdWNuS1kwNk56M3REZ3BiUXB1aEdueFRE?=
 =?utf-8?B?VGd5bm9IR1l4dEMxUVcyYmNzWng5bVk4MzhIUGYxbVBzRHY1bi9NeWFCTkgy?=
 =?utf-8?B?b2NVTG1FRks0YzNWcHZlVVFBY0pUZTQ4NEVwaGQ2ZE1selhVSWtxakxURElY?=
 =?utf-8?B?MElIRUdxRW52cUppbTR0bUhNd1VERk0zbzBPVHBma3J2cCtSZUxjQ05EMW5F?=
 =?utf-8?B?Q2JmbEVKUWRhTDErRDlSTUxxMndzRUJ5M3p5ODNiTnhxQ25VQThHZnk1MWhD?=
 =?utf-8?B?dE96OXdzZ3MxNlRhUEF1cDlERGc3QkF4WVliYW9VcUZmbU50UUVGYlZmMkp4?=
 =?utf-8?B?Ly9RRHB2emt0L0lNb3RrZXl4RGwvcDNBN0ZPOEN0TThFbkNKVDE5b0NnY1BL?=
 =?utf-8?B?dnErUVVja1lidXhaV016YUFJZzZBYmdCQnBKWG50NVIzRncvd1RJQTlsQTZx?=
 =?utf-8?B?bW5TVmtXVCszMDZYSWRTVWFrUmlLOUE1Zk5MNUJOWFhWSUtJYUg1MjBmZ0d6?=
 =?utf-8?B?Ym5FMEFPY2l3YjJ1MzY2RVhSSFl3VytkRVJqSFk1ckVHeEp3eVZsYjY3QUFM?=
 =?utf-8?B?SWRzbkRWU2pYdTlRY1NrWUFFK3ZsRXdGVzB3QTZKNUdKejVOb3lINTNXTEt0?=
 =?utf-8?B?S3g5S3E3cE9td0NXWFNoZXUvYU9Kek9aQzlJY1h3RVJNS0tkWmR1RmF3ZExt?=
 =?utf-8?B?cGoyT0Y4UjZwb1doK09RSkxrd1U2bGFhb29tRzU2QUc2WGFPZDNQNnNKbVor?=
 =?utf-8?B?RXJCbXpPZWtETk9OUXNQQU94a3FONGpkYlk2RTVxQmNualMzMDVFTnZ6eEM2?=
 =?utf-8?B?MURSRDJLQ2dQZzI3UDUwYm91aHhXUVREc0hJN0o4VG4rb2RGTm9vM0VJRGV1?=
 =?utf-8?B?SHBEV3Bvc21GNXdOVlFoVUdCcjc0cnRGbHRxM2t1VSs1QWE3WnZuRy9NYVBz?=
 =?utf-8?B?RmZDQzFWVS9qR2xWR2hkblBqZ1hhTXgwMGVEbGdMdE53YjRRUm13dGwxUVBO?=
 =?utf-8?B?WmxSeCtDb0E3RlQxc1VBUVh4Mmt0Tk1MUTJXRWUwUFdvNXpzWHBhMlRtTXNS?=
 =?utf-8?B?QUtnNWxLREpVTnNBbHVtRGwyV2VUY2QwcDRRcUpRai9XT3I3a3hlS29mM2lG?=
 =?utf-8?B?c2ZnMkVLZDhOQlUyUWJoSTczVWVtZkZJTDJqanUvajBVSmM2K0puVmhQZ0tM?=
 =?utf-8?B?Tys3Y0pZSi8vRWs2dU9wWVNaZGw5RWhHejBNVFNIV3NvTmcrYzA3anBEdFBP?=
 =?utf-8?B?eTY3c0tFN3V2Ym5ma3Q1SFVsZ281cmVWS1gwOGNnWmhRWEdkcUQzaVBmQ08r?=
 =?utf-8?B?ZE9pQzBDdkZiZXNpNEZLZ2w0N0dlWkZRN2FlTW9EcVltNnFMQ1IvTEordC9u?=
 =?utf-8?B?dUVpelNhQ0YwOEUyMlpwRnNMQVpEamRBdnl0dEg1RjNiVDlDTjlHNUYzMmpX?=
 =?utf-8?B?NS9oNWZxUi9xM0VjdENUMVZOTnlWQVhML0ZVVHFqUHQ0Z3JIZmYwaDRMbzN0?=
 =?utf-8?B?dHlLb3phYzRPN2ZqYms3SGlOemFvQWNKUUZsVWhMS081VCtNVkI4dHZXZ3VV?=
 =?utf-8?Q?X/v4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3NIdCtNakVKSjlva1RRcUdiRnBtR0V1WHU3d1JoNzNodW54b2hpTHJRRWdO?=
 =?utf-8?B?S2tUVFBMSkw2VWZ5Zy9hMWxqQmk3aElRaDBRNGNpMUE5cjMyZUs0VDBFK2hB?=
 =?utf-8?B?VzZUdDB5eE5jTXp0YmZ0ZVdzOENjNmFrdGxjNEowcTRCVXA0ejVVM3lvSFc0?=
 =?utf-8?B?VFY5dGMzeWsrd1lTQjYxNXV2QUlNdG5GcU1QZXVOQ1p6WThJUUs0YWg3RDRO?=
 =?utf-8?B?NDVFZkRDUVd6VjJBZ3hsbnZndTA5WmRiekZaZTBNcmtOSmgrSDBsMHhBL0Ns?=
 =?utf-8?B?Q2RFVzlSVysrRFVicDNEckVXQlF4YUZFN2dQcEU4WXhmN2ZkMjgyVzBnRGxq?=
 =?utf-8?B?eERwejMwWmxWajhmZVdjRDd5c05YbG1zS0wvYmt6Rm9iZGt3VGx6Y1VSb0gx?=
 =?utf-8?B?dlZZZWk3ZUF0a2lJT3llQVpqVVRJVkhSTnhxeWgyNXNTZGtHQ1ZzUHBNTm15?=
 =?utf-8?B?VGpDUVZ0QmJIclIrQnRYL2tuRm5iRlJ6MlhLK0xEMG0zeEJKUkx6anEzd3NH?=
 =?utf-8?B?OGtjVHdFTFRPTnVnZ0grMUxrVjdFeWw4UHQwWnZhTlBBZ0MyLzBickNxbG5x?=
 =?utf-8?B?VHFyVXkwcWxHV003Zy9lMDFzSDRwUnJRZVZuYi9Bd2VOZXMvcm5taWUwNjZT?=
 =?utf-8?B?OVd5eHk1WFJYWHkvV1ZHQUZxUktWN1ZWTXdDWldzOWhuR3E0dFE1YXUvdmc5?=
 =?utf-8?B?VmVGUXc5YVBXV0NGVzlHSDF0clU0V1Y0bkNUQTcxdk4vNTQyb1FaeWNHZktW?=
 =?utf-8?B?a2tCZ051azIrOEdDVTdjOFN4MGdmWnozL21FVkkwUHA4VzBoZDFRVll1LytM?=
 =?utf-8?B?MTVhUWlQTVBrRWdxN0N1RWpvM0UwOWxERmpBOTJ3S1JNODNTKy9FMFFHQ0R2?=
 =?utf-8?B?bVhacXdKVUthc0VmbmZ6cUdiS0UxaVBraXZhdXB0bjB3RVo1a3pSQngyTWlJ?=
 =?utf-8?B?REtLV0RaQmkrb1VkbTBOdnFBY3p4dnF6REtjeWNWZEg3RDQ1SHdUQWUwb3k5?=
 =?utf-8?B?b3RIbGg4OHdpVUNQTm5RaDNpQkY0RzVkRGVVVFEvbHZzbEtZaUlLZzZqM0la?=
 =?utf-8?B?MG9haHhlL1Ewc1owSHVZUUdBMjArdEJmODRVRHZVRVZHdTlJNjhNNTFKdnoy?=
 =?utf-8?B?S1BZYkJyZWFndGcybVhBbW0yVXBKbEJwbEkwL0g3Vll4U2E2b1hGL3FvaVZs?=
 =?utf-8?B?cTJiZHBiUEd5bXlMa3I1eU1OdFA3TjBZaFVJL2hMNlI0OUlGc2UzV0EzNGVR?=
 =?utf-8?B?VWhOWW9TY0FvQTZvRDhyVE8xdXZJaGs2eVdBdGF4VXVuYnJ3dUxXejRhQWdo?=
 =?utf-8?B?MHUranNFZnAzbTVuMVlxMkpLWmNYNnc0QldkUGNDQUtlcGZYYmtRT0NUSTB5?=
 =?utf-8?B?WUYrRnhzTERQVFpvTEdhOUpVVnFhOFFzV000elRYeG1rdTRSRFpDSDhldzR4?=
 =?utf-8?B?T1BZYkJIVE8zY010MEtZUjRIc3dPeWcwd0RWTG8zN3VYZjBlOTBCQVhsZEhj?=
 =?utf-8?B?RlpoM3ZkaS9qVFExU05tMHF0TmtITXR5OTR0NmEvN2tsSVBJdEhXMDhkb0xY?=
 =?utf-8?B?MWpJNUVHQzNJYkFxUm4zSW9nL2d5KzN0VGhMZ3lwY0ZiQ0RGWUttcmZxSW5i?=
 =?utf-8?B?M04vaUtHQ2VLR0U0VCtXek5rZStNUFhrSzZoQ0UxYXpUZSsxL0RSazdWcEpi?=
 =?utf-8?B?MDk2RWZ2a3cwelNHUmhyb3VMY2luT05jQU9HcDVRdDZ2NTBKRkhtWXFqWHIr?=
 =?utf-8?B?TXR1MXVnVXQrbGdvSjhhY3RSWGp3UFBGakRoQXBkV0MvZFJoVjZoNWNaUDJW?=
 =?utf-8?B?aFRZVWt5MW1iT1NYQ1BkUEdVeGFFSkd6cGRoWXJhKzA5eGVxSGFubEoxdnUw?=
 =?utf-8?B?SlgxNkwxemZhWHRMTHRBOWgyc2xWS3h2cDdSbmY4YzRYWU81V202ZUVhbXIv?=
 =?utf-8?B?ZmJJYStwYnZjYjBHZ3hlLzdPT2F3eUR1VkZCNWxlUXc3aDZ2Z2U0U3NzOUNa?=
 =?utf-8?B?QzgzSUF5NTNqOXJrcFNqTXdIZk9ZbS9rRldRYzdRbE11a3l1SE1XMExvZnBl?=
 =?utf-8?B?TVE4d2dZckhjL1VsdVR5blVqZS9YSC9UVmdaSDQ3RDQyaTdsUy9sV3FZUmgx?=
 =?utf-8?B?NEdBM1N2T0FiNVBxbDlVc0NUUjhYdGR1UjQxRmc4V044R0NGNFNoRGhNOUpM?=
 =?utf-8?B?djUxS3B5K3RtdnpKb2FTeEN6d1R6a1oxUnc5bEFPdDY2ZXBTbGx0Rk5yVVRI?=
 =?utf-8?B?a2lOQlNwWTlvRGpzdUpTNE4xdktBUmtPejdQeXJ3N01abVBMZndSUmdsU3BX?=
 =?utf-8?B?ZDlaV05mVkdDOGVobzZaNC9GY1VaSmM4Rmp6YTV3M0ZGN1llblNDUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac60295-c7c8-44f6-b7b1-08de72755d04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 00:49:13.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZMBJBIIPFHLDR+B6RzYFvSkNbk9K4GImJh4AJsgUTIMLr7RPEDDnZN6vpsmmk31G/FfxRKCd960W4OC3gHdlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 031C7171036
X-Rspamd-Action: no action



On 2/21/2026 12:44 AM, Greg KH wrote:
> On Fri, Feb 20, 2026 at 08:55:52AM -0500, Joel Fernandes wrote:
>>> On Feb 20, 2026, at 5:17 AM, Danilo Krummrich <dakr@kernel.org> wrote:
>>>
>>> ﻿On Fri Feb 20, 2026 at 7:06 AM CET, Greg KH wrote:
>>>>> On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
>>>>> Use subsys_initcall() instead of module_init() (which compiles to
>>>>> device_initcall() for built-ins) for buddy, so its initialization code
>>>>> always runs before any (built-in) drivers.
>>>>> This happened to work correctly so far due to the order of linking in
>>>>> the Makefiles, but this should not be relied upon.
>>>>
>>>> Same here, Makefile order can always be relied on.
>>>
>>> I want to point out that Koen's original patch fixed the Makefile order:
>>>
>>> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
>>> index 5cd54d06e262..b4e5e338efa2 100644
>>> --- a/drivers/gpu/Makefile
>>> +++ b/drivers/gpu/Makefile
>>> @@ -2,8 +2,9 @@
>>> # drm/tegra depends on host1x, so if both drivers are built-in care must be
>>> # taken to initialize them in the correct order. Link order is the only way
>>> # to ensure this currently.
>>> +# Similarly, buddy must come first since it is used by other drivers.
>>> +obj-$(CONFIG_GPU_BUDDY)    += buddy.o
>>> obj-y            += host1x/ drm/ vga/ tests/
>>> obj-$(CONFIG_IMX_IPUV3_CORE)    += ipu-v3/
>>> obj-$(CONFIG_TRACE_GPU_MEM)        += trace/
>>> obj-$(CONFIG_NOVA_CORE)        += nova-core/
>>> -obj-$(CONFIG_GPU_BUDDY)        += buddy.o
>>>
>>> He was then suggested to not rely on this and rather use subsys_initcall().
>>
>> I take the blame for the suggestion; however, I am not yet convinced it is a bad
>> idea. 
>>>
>>> When I then came across the new patch using subsys_initcall() I made it worse; I
>>> badly confused this with something else and gave a wrong advise -- sorry Koen!
>>>
>>> (Of course, since this is all within the same subsystem, without any external
>>> ordering contraints, Makefile order is sufficient.)
>>
>> If we are still going to do the link ordering by reordering in the Makefile,
>> may I ask what is the drawback of doing the alternative - that is, not
>> relying on that (and its associated potential for breakage)?
>>
>> Even if Makefile ordering can be relied on, why do we want to rely on it if
>> there is an alternative? Also module_init() compiles to device_initcall() for
>> built-ins and this is shared infra.
>>
>> We use this technique in other code paths too, no? See
>> drivers/i2c/i2c-core-base.c:
>>
>>   /* We must initialize early, because some subsystems register i2c drivers
>>    * in subsys_initcall() code, but are linked (and initialized) before i2c.
>>    */
>>   postcore_initcall(i2c_init);
>>
>> If there is a drawback I am all ears but otherwise I would prefer the new
>> patch tbh. 
> 
> The "problem" is that the init levels are very "coarse", and the link
> order is very specific.  You can play with init levels a lot, but what
> happens if another driver also sets to the same init level, or an
> earlier one to try to solve something that way?
> 
> So it can be a loosing battle for many things, choose the best and
> simplest solution, but always remember, Makefile order matters, which is
> what I was wanting to correct here.
Fair enough, the solution you are suggesting also sounds good to me.

thanks,

--
Joel Fernandes

