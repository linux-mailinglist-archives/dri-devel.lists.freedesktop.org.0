Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KZNDjtynGmcGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:28:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982F6178B9E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 16:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE71310E3CD;
	Mon, 23 Feb 2026 15:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ClAon9H0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C755410E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 15:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoapGF7kMU9mvSDrff1dMcsp2VvvzH+5H/EEUhimaTsg84LHNCMRfQjdAtyk05I2HFhvX91P2HmtYiplqO2wneW0sjc6s1KCtMKhWNM2uJiLVvbbCkl4Qi/jFOmUJSuXit+8FykjmcC53DMmCXT/ghceD/urPjxviCV2vo4jrIaSaYY37fjItgvzcyDJuO3THeWSuAg+QPaCN1Bwaw9GfxRB7O4/BBj9gt6AKzEnkoo8hv/7fzvnlQEGC8JZBgjxM9SfD1Ba8a3J3zuFB3sFc7RBfsIwSbFXkkIzIMols993LD1MTGpNw6xqdAAl/J/aUNCBKBvE8c/r2kY2PT/0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZCCEPPJKiGBojHruLTGj+WvfsQRDRxM51DNmZ8VZEc=;
 b=Lh3r+FAwipW4dWRTPRLXzhYNN3xWa9OV2EtvXV27T1d/ny6NyVu87KgDd0b01w3Z1xP7hrhKKNKz6Kz0t4/kEBL2u//L84Tw1O85nWkF7bmUMScfqpaMqMnOSrCk5nNkOwo7uBep+Mdxjc3vcYG+OWoBWszRkhKbxrg/g8HLmDve/olXt7OyD5BUyEzWV41IyRgHZTFZDbZdieBOMmnyODo6OiawJ1BkIgaBG2bH9O2MTxagA2T6qJuju/S+bcYIu7dV+OKikDPLgU32MPCR4B8UlJePbbL2nPdos1DMbjQqnc1BNA30HvNjgsUhdxqySH6Ut2/KXZY36eyJZCax4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZCCEPPJKiGBojHruLTGj+WvfsQRDRxM51DNmZ8VZEc=;
 b=ClAon9H05Mn5b4KEnADEwif6I1UAeyFdki3ZrEz6fcq02ah7QmMgXPxXkPAnOZ0kID04X1UnWBBZiDakrnYJ9ufQcXIBW+ZVBefOexAhGVJlRYxiYItbNVdg5+Yf1y0IopeBEDGM0Ll/5SYVAQodCtS6TrKw9xmdW63w96UFMRg2B6XeacECHJYA5AhSv3VuG4VS6/V6EteVGAn70j8JK4zDPgokiWYUxaXiyvTObNr+bF4ALlcgjUVraPZdckWURW9yDXLc1dOHKI47exRagsqyrdWdoBVuHK9OopAToNJVCTdk/ooOmD8h2PIRUd+8TPBJIGOR9QIZbDsZURC+9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Mon, 23 Feb
 2026 15:28:49 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::778:72e1:e792:df81]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::778:72e1:e792:df81%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 15:28:48 +0000
Message-ID: <b1da71d7-3daf-4850-9239-fd3e2a946d95@nvidia.com>
Date: Mon, 23 Feb 2026 17:28:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rdma-next v3 2/3] RDMA/uverbs: Add DMABUF object type and
 operations
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
References: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
 <20260201-dmabuf-export-v3-2-da238b614fe3@nvidia.com>
 <716e8a8e-e4e0-468d-9314-10082c2bbb8d@roeck-us.net>
Content-Language: en-US
From: Edward Srouji <edwards@nvidia.com>
In-Reply-To: <716e8a8e-e4e0-468d-9314-10082c2bbb8d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::12) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|PH7PR12MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ddc88a0-be29-4302-eb8e-08de72f03d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVZQUmdGeXVhbUFSODYrdWtZeWppdFpITENrWWIyckt0TldsRlV0N1JFNUNz?=
 =?utf-8?B?ODVQR0sxRlFoMGVkbnh3dFdvMERpZmhnWU1SaG44ZS85YzE5QVVVWktRUGVi?=
 =?utf-8?B?QlZJM09mRkYvNUUvek1SQk5CTkg2R1BCZzN6MHg2VUJmVWhhb1dPZDRka3JY?=
 =?utf-8?B?c2FLZC9aMlBEWXZyZEdxY3lJdngzTHNYejUybUI3ckV4UWRzNHJBZjJVc21V?=
 =?utf-8?B?UUprY2RmY0RUemlOazMrZGJVV2FiR3pUS1cyU2E5cXFxQU5tRjF5ZXp4WDBu?=
 =?utf-8?B?aFYzWWE3RktVY0xIVzNjV0tGWTA4QmZoRDdaSTJ3alpwWGVUd0I1bjNONElt?=
 =?utf-8?B?M1BvUXNwejIzU3Qra0ZMYjhYVkxEUE9pV2pNMHdWbFl5cW5qOUtBdjVrRzNS?=
 =?utf-8?B?aDE0cHoycWRla3JqZXN6bjA3VHU2NWNPTVI0aGRhOUFnSU1hUXNPSklBZVlV?=
 =?utf-8?B?Sk1YVEt4NGI2RkduSFNUVTl3ZUZoRXAxQWljTzJLNTFrUVhsSXFLM25VNGxx?=
 =?utf-8?B?MGZHUXJzVStKV0lMSUVJbkMxTkNQTUpiaEFOZERZMXZRR0dyVXVwTUlMV1pV?=
 =?utf-8?B?VkJNYVYwZGFFK0poelhkdEY2MzQ4WEp2eGthV2FMbjMrcE9SK1FhbjUxZW5s?=
 =?utf-8?B?SDN0ZjB6Q0plaThxcDdGcjZpVm1HMzF5SVQ4eXVoTlJGd3p4K2lqTTROWmJi?=
 =?utf-8?B?ejI0d2lLOWtaQ2pqTS8xSEJzMkVVazlJaHloeXR3Um84ZW5keUYxVzBwL1Ni?=
 =?utf-8?B?SytZaWpZZjRkN3ZFSWhLaEVxWWI1K1dwUFU3Q3YzU1pqaTM3WjVHYi9YWkV5?=
 =?utf-8?B?d3JyMGZXVGl0azVvVlZUSko0OG9kNmVYUjhUdFVNTHRPR2xpUDhFekVOaWhl?=
 =?utf-8?B?YWFLelk4T0c4Qk5IaTFUZ0hWaG1iUFlMTWtTbGZrMGdWQVJDWjR6SVZSbmxP?=
 =?utf-8?B?MGRSTEV3SWFPWkgvMEExbmR4Q2Q2S3JQWTk1WTRyeC9jVURrSmMvS2R2K0lI?=
 =?utf-8?B?ekluMVROMi90eDN2aUpnMUc3c1d1RWxaWHJOVFFDREIzK2QwODU2d0diNmcx?=
 =?utf-8?B?RHRMRUxSS3RNczdnMEtRSXU3U01HcGdLQlRzSjlMeDRpdVUvN2ZMRlU1NFR3?=
 =?utf-8?B?cXlPSDBja3YwWUlLTkdEdUZqUWhVbmtqWTFROURXK1EvYUQxdFJ5MnhoSWJJ?=
 =?utf-8?B?V3lac1NzYkNGSE1BYm94RXJzdUN5eTlxMGFpcjZCN1NNa1ZxSnJKOWNKV2VC?=
 =?utf-8?B?bkVnRlVIaFA5dGtHVUxPUit3WTE0cDZPdDJEa093QThlR3FaZmcrTnFlWENX?=
 =?utf-8?B?S3l3c2s2ejZxbFE4TmN1b2V1UE9JNmhqSU9XU2NIVFNxa0ZaTUFTQXBXRlQw?=
 =?utf-8?B?SEwxNXM3NmVFWHEwTUVBcnlsSHRETUd5SDFRZVlGYVlGMks5cXZNYlFDZVc3?=
 =?utf-8?B?d0gwM1BJM3ZsTnhFMEhSbnJCUFdtQTZZdUhyQVN3engwa1NyRHJEMnRZZnZk?=
 =?utf-8?B?TXNjdk5ESkNuenBrd3pGOFdVdWFFQ3gyNk9VRkRVU0F1aGZHdDEwVDB6L2Ix?=
 =?utf-8?B?ZWorZ283WEs4YmpzY3ZId25NK3kvQjVpWmVCMmd3SXZnSEdZeTR5QnRDRGZo?=
 =?utf-8?B?OWxzcW8xREhtemluMlRhczAvdHBHcUxrVUxVdE9QeHI1cFpEeU9CVmFNdS9l?=
 =?utf-8?B?a040eXZIdVhZYTFzc3hqYnY0dW9UQlVwZnBtV3FNbk9WR21JK2lIbWM5TlNv?=
 =?utf-8?B?MmxCMUhNV01nbzh2SGxSU2dwZTdDOUJnLzNnMjVHMkxmdnd4WHRLSTFSZzZW?=
 =?utf-8?B?aHp1Vm5XWWZDTlB0ZDVSY0hIU0ZtWnJMQTlWbUkvaDhyNW0rS1B0bW9DWnZQ?=
 =?utf-8?B?NExLZlh3Qm5yM2tXc0hTSEdSYmQwZHhWSzYyQkxPSFdxMjhQN0pWL1hERFZB?=
 =?utf-8?B?ZnNmTTFZQ1BIYXlvb014bU9DSVo5MHZuUGZmd0RSdFZsZUxvWmpIdGRLaU9P?=
 =?utf-8?B?S00ycXQzZ0RzMS9vT3VjT1dlQ1c4ano4L20wU0o5Qy9VVGlHdjFWT24rWjNG?=
 =?utf-8?B?eDZhMjY5SllFOCtBNy9YTEFIT09xalNleUl1RTRsdk1jMWJBRGRVMDV0NDdD?=
 =?utf-8?Q?9TOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUdybmtxZXhEWTdzZTVVWFE4SDJhazFIaklJOE5Icis1dkxKWGtOMjJVTXNU?=
 =?utf-8?B?YnpBdEtEL3RScTZsdkM5d1A3VFZsTVIxN3ozMnhSZlRUMUVJbWFUNkxDVVd2?=
 =?utf-8?B?MFNuQ1J0Z2ViVGtmalE4OVJMTU80NUdYQitneFYrSnM1MXFyeE9xM3dTOC9Q?=
 =?utf-8?B?ek5ydkN1MkVEQ2U0dkc0c0hEMzhDZTlYcm96NkQ1TkgwbS81K3loR3h2Zy80?=
 =?utf-8?B?R28vRFYzOG56eFhtc1dSeStLcTFsV21ndzhwL01NT3d2eXlnelo1akVJd1Mr?=
 =?utf-8?B?d2tqbnN4dzhuNVdXMWdiQTB6SG5uUTBNNEJnblpuRUlDNmpybUI5SDFxS09j?=
 =?utf-8?B?ZVVVd3REU0F1SUFjZHljaG9UZ0g3Q3dBdkIrYkQ2a1JaY0dXMi9jeEZ0ejBo?=
 =?utf-8?B?a2FjR29JQnBGQ3RER2RRUVhwSGNjdm5QQXRYMlVjc21IZFpWdXpoMEc3ZEhv?=
 =?utf-8?B?YmF2RnJIRzRwcHo1elVLaUN1UjdUa1pidHh4aWRrVFNQaGdqU0paUHFMdHhw?=
 =?utf-8?B?MzdPL2NLQ3hJS24xY0d5d1RaaFh5b24vM1ZZMDQwMTcxbFJQYVVoQmRJU3pm?=
 =?utf-8?B?RFc0MTFjU3VUZERXSXV3QzNjbFkwTkwxT0VEYkJtK1BLM0pRRW9OZHNoVlpH?=
 =?utf-8?B?eUdmSFNldHgybk5JMVljOHVXM2dWTVE3M3ZtWkN1MGVONHJMNDVrRnkrSDlW?=
 =?utf-8?B?ZDRkL1plbk1NQnk0VFhvVThjMTNaVUJQUG5SbkJGbFkvRVAzSXdCdmVlNmNn?=
 =?utf-8?B?K1l3U0lxL1JUNFFjZXVvZmNsWFgvcHVzK1UwcDZPLzBmSThGdzI0UGhybVJZ?=
 =?utf-8?B?S1NxcXExWXFSTnFEWUxNWUoxRHg1OXNTdncvd3RWUlFOMkNHQ0RKVW9MenVN?=
 =?utf-8?B?RnR3anVBRkxJdE5Ic1NCdnUrMXRvOWM2ZlVMWXNlZThldFczcTZmUCtrUTNm?=
 =?utf-8?B?MEFITlFkc2gwTWkva3dNM1RINnN5WnBjNThqS3YzQ0x1cDJDQk5VTnRtODhN?=
 =?utf-8?B?R2YyVnlRTGZjOCtBR2t3MmNVVml3b0JFZ0F4Ry9URC94cnE4ZHJNM0U3d0F6?=
 =?utf-8?B?NCtmSjkxNU5DSERyT2ZMVUZ2TVdTM1hRTzREVzVrN1A3UTMyWXRqdWpENVIv?=
 =?utf-8?B?M05hNmRvVjBJZ3NnWjJwRUFRSzF6S3daV3cvSEkzUmh1eS9SeDRpVjQyWlBC?=
 =?utf-8?B?L0dueEt2UVphcmVTUWF4Zzg1ZkJsdnEvbFkyN3IxL2lzMEhNVjcvenBoVjJ6?=
 =?utf-8?B?c3JwT3poN0xFY2hJa1RyTzQ3WmM0djgyUEk2cGJ5YmNGelA2eW45Z3pwVjAv?=
 =?utf-8?B?bnZTR05sdjBTTGxPM3RoZzArQTZxY2YxbXIxWEVuYlBEYzRMa0o0UitsaERL?=
 =?utf-8?B?aHNrOFJEbjRXSVNyRCsxZzA5RFBuQmFIcDQ2YUJxL3EzUzh0Ri9wUjdCd1U5?=
 =?utf-8?B?U0txZ213YWdhWkNKWDQ0R1BZM0psRG9tSWRQb1NmNUNtamxUa1pnb3ZEYkM1?=
 =?utf-8?B?L0Frc2hteXNZMzRqbDI4d3JwcEtXWlFZaWJPandPVHVmb2FxYng2SFVOalJG?=
 =?utf-8?B?QWtlcXh1RDV0M29JcHUwbldTVzRqMEs1cVdQMDhwWWp4WG1zS3dqb2hMWnRw?=
 =?utf-8?B?RzdBT1UvWHNxUFZxcDltN05DS1hKdkl6M2pDZCtpaDY0SDVNb2JnM3IyV3Zt?=
 =?utf-8?B?UHZHZG90OWZ1dDIzR2Nvb3pXWVNRdWdwMlBJR0VQR2JRK28yRzhsSzA5Z00y?=
 =?utf-8?B?ODdrZ04xbFV1N0UyUmZ1WTdqQVBHRFZyZnlqWkRBZ2lXRlk1RGtndDFydXM0?=
 =?utf-8?B?b0pOVDZLdmdPWEJsNU1vVDR5cDhtaEhLQzM2SWRKWlltS2drQS9BTG9lTXB5?=
 =?utf-8?B?emJEMmdFUStaRU9OcUc2NnpsVURiUGN3UUUrRHFIY2p2NE85NEt6WkVVZ3JC?=
 =?utf-8?B?ZmNNeGFYM2RZWVNDT3FKZkk0K016T1YranNOMGNMb1FuM0UzK3ltaGFrSGlD?=
 =?utf-8?B?L3kzbUlVZGVDUDEwVjcrZDBtcXRSdUZYNFpyblNsOG1YSVRJcXJHSDg0bmVz?=
 =?utf-8?B?dkREcXUrc2Zia1NMUmRhVnhKTnptREJqazRvZXZkbmUzZ2FTWk1iUnVpbTI2?=
 =?utf-8?B?TjFSVW54Y3JnL3A5Y21RUlVjVU5zTGF3WURnWG5MYWhHYk1ra0xEVUhoK0JL?=
 =?utf-8?B?S005N3JaaXNTTnlYaW5YWnB0QjgvMW9QbXphMDdrV01JSzRXUlRGUDBFbndM?=
 =?utf-8?B?WlFwV29OV1pzelJEbDJ6a1hCYnpqbE43ZkdEd0FoTzlxREo4cUJUdG1wcm81?=
 =?utf-8?Q?d5YFPO5XCxIiYOEIxG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddc88a0-be29-4302-eb8e-08de72f03d99
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:28:48.7829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrYMbYLz3VAbQh2awNb1AkaGPfYwHCXYRhuV/J0Lis5SwIpq0HK0pv6qrY7urYlvFMRozK+3fiBZmq7wpKiEDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7163
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:jgg@ziepe.ca,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwards@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 982F6178B9E
X-Rspamd-Action: no action



On 2/23/2026 6:59 AM, Guenter Roeck wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Sun, Feb 01, 2026 at 04:34:05PM +0200, Edward Srouji wrote:
>> From: Yishai Hadas <yishaih@nvidia.com>
>>
>> Expose DMABUF functionality to userspace through the uverbs interface,
>> enabling InfiniBand/RDMA devices to export PCI based memory regions
>> (e.g. device memory) as DMABUF file descriptors. This allows
>> zero-copy sharing of RDMA memory with other subsystems that support the
>> dma-buf framework.
>>
>> A new UVERBS_OBJECT_DMABUF object type and allocation method were
>> introduced.
>>
>> During allocation, uverbs invokes the driver to supply the
>> rdma_user_mmap_entry associated with the given page offset (pgoff).
>>
>> Based on the returned rdma_user_mmap_entry, uverbs requests the driver
>> to provide the corresponding physical-memory details as well as the
>> driver’s PCI provider information.
>>
>> Using this information, dma_buf_export() is called; if it succeeds,
>> uobj->object is set to the underlying file pointer returned by the
>> dma-buf framework.
>>
>> The file descriptor number follows the standard uverbs allocation flow,
>> but the file pointer comes from the dma-buf subsystem, including its own
>> fops and private data.
>>
>> When an mmap entry is removed, uverbs iterates over its associated
>> DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
>> their importers are notified.
>>
>> The same procedure applies during the disassociate flow; final cleanup
>> occurs when the application closes the file.
>>
>> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
>> Signed-off-by: Edward Srouji <edwards@nvidia.com>
> 
> When trying to build powerpc:ppc64e_defconfig:
> 
> ERROR: modpost: "dma_resv_wait_timeout" [drivers/infiniband/core/ib_core.ko] undefined!
> ERROR: modpost: "dma_buf_move_notify" [drivers/infiniband/core/ib_core.ko] undefined!
> ERROR: modpost: "dma_resv_reset_max_fences" [drivers/infiniband/core/ib_core.ko] undefined!
> 
> The code now requires CONFIG_DMA_SHARED_BUFFER which is not enabled for
> this platform.
> 
> Guenter

A fix was already sent, which I believe solves your issue:
https://lore.kernel.org/linux-rdma/20260216121213.2088910-1-arnd@kernel.org/
It adds 'select DMA_SHARED_BUFFER' to the infiniband Kconfig entry.


