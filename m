Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D824B20B87
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 16:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D701710E45F;
	Mon, 11 Aug 2025 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ac+O51fg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9410E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 14:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPVdmo77eXROtDXdIsgktBHVkjorf9W18maOoh37Y657PBCwmsLJO4d9Vw4WbTBU3RV8ssmnoI/J11+d7yf+rQPU/ollG4mzToeeM4EqByh6CZ3unWSZcVhFDMQQRR8VFFUYCi8pDtpBkfIpqyD5wFdid5o0oEW+6r//k1aMwzzWcvckTfcZZK5vci9wKPO20aJkraIwPXmjOyn9WIyDAgXG8j4B/SlODXcFNeFH6Eyr8Dg3ZzrNSaYJHMu25WBDObSGYQaSTpA7URmoAsgNRh6xeutl0B6Sx8rce0u81oZjp/dz/KIRFXZbupmtA7OC92RMWT/UL+J/CkO0z2U4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVCyrdzB+v4Nqfujm55AStG4VeaO73NeksVisw6rzzY=;
 b=SL1wNd8zxT+Njb0MHqf76wvd/Sc2WrWJu+KlgOGzDF0WRcZyGBHMR7PYcizMaDodJLc1o2NExAJNgReHoWrWkFdNeJZLAlcG7KdaPFesQiPByrDCPmWIvD8Z2ov/w38WZzNZBCnHudRkrvkmgoWzD3a+ekfS2JF4D5AxhmvC50rHLaK9oMHMWDPiwT7bHXOZEZAM6FqS+XyaffENZ3hnlGMnQsXaBfSzqV8vFPATNsNL8FAUn+TI41sFtpS5GRwUdIJmguK8nRt7kHPbWnbd9C1cfbgU1TlK9CI3UIFTPteGwzg/SokEjEXk6/Zu3h8LImxwK+ok7T+WbcuwXU/H0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVCyrdzB+v4Nqfujm55AStG4VeaO73NeksVisw6rzzY=;
 b=Ac+O51fgQ3CWZjWNtpWPfEXaU2OWuLbRC+VTQAO1GgcMax5teC55nDzbSJ3sVvHLInAwiBRT0NURIHb52smrxYq3J8+t+5+/hgWTyI7QT6TzLNKAShtGRe6E2kbxi1Bp8M3IO1BYz11xZ3bFu5y5tPyL9fWf2M9qIB7xausuLoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 14:17:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 14:17:27 +0000
Message-ID: <7f620860-bd4d-4b14-9832-2fa25fd4b086@amd.com>
Date: Mon, 11 Aug 2025 16:17:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Extend and update documentation
To: phasta@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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
 <9caf8709-91ef-445a-aa4e-aede1899f364@amd.com>
 <90c89caeb8ec3ac0fcae583df722bad20fa72827.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <90c89caeb8ec3ac0fcae583df722bad20fa72827.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:207:3d::46) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 067a79d9-bbde-4c2f-3f31-08ddd8e1cccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnJteFlrY1dkeWFYSEIrTkg2akNMRFhTalYveExXbXJINW5lbXMrR0lhcVBp?=
 =?utf-8?B?a2llald5WkxMRHhKYnFERUlySDNVT2IvdkZPMEg0RklIdUlVVm55L1IyS0Q5?=
 =?utf-8?B?SzJ2WGhNSldiU2w1UjFrNmpLRWRFV3p4YjVBTkxhZDBMV2RCSDVFNUNjK3M4?=
 =?utf-8?B?MFR6RWNsdStWZkVmVnhpeGo4NzZHZDg4cExnTDQ1WDAvTVZaWUc5RXRQTEcr?=
 =?utf-8?B?MmJTZWpFdXBUbEtrdGx5SFVkMEdydXdjN0JBY2RxTVJETWEyRk1Xbmo3eFBF?=
 =?utf-8?B?ZlBrelhQM1BsM1J4ZmorWWYwVGFpYkpDV09hWEtZQnN5SWVhU3FMaHh6cVdP?=
 =?utf-8?B?Uzk5c0R6TDBCUlliZElxd09KRFJRNjY5RVd3YTNBM3pWdmtFTy9ZakNtdEE4?=
 =?utf-8?B?c0lCZmhjOXdDems2cjN2ZU9xYnBkU0NKTXdEMWtLUHozSlo4VXlpeGJpNkxB?=
 =?utf-8?B?MlVJY3JFTzJxUjhIK1hHSE5qbVcrRWNKeVprQmtQUnU1UGFsd0xOYWI3WEtQ?=
 =?utf-8?B?d3dYbTJOc2lGTGhXV0g1dTlQWmdURlI4cjdTVlF4OHdoTHZmZzBQKzBFN1VM?=
 =?utf-8?B?emc0QXBwVHVRMmg3UDk2c2tFaitvWU5XeFdKZDBrT0t3dUZMTnlWOHIvN1hi?=
 =?utf-8?B?NlYzaWlJSVhxZW14S2xSd2hIeHo0U2xjTU1ZSHRtekQvWXNwNmgwUVkwUDNa?=
 =?utf-8?B?VzBhRk5McmRBUXZKeEdnTWo3MkMwd0hlT1RvVFVXUGgxVGpHdTFJbUdkeDNI?=
 =?utf-8?B?blp6eElaZzl3WTJBdTNpK28yR1ZqcTQ3dHVtS1pCcVF2RXFROTREbE4yUlFD?=
 =?utf-8?B?TjZjZ3p3Z3JNUmMyKzU0Z3Vwc3BuQS8ySnNFTTdCbTVWVG01VUkzMVNOS0dG?=
 =?utf-8?B?MDFBQlR0NVRxeG8rWk9OTmZDUElNdUl3OGpVbEF3M25TcWZBYzFoSmN5UkJw?=
 =?utf-8?B?UkQ2VXdKajhoSzlaL3ZLbkE0Skpub2VkbitTdWs0OHQzemhKQTlSMEVIVjd4?=
 =?utf-8?B?azB1dm12UExRMVd0STdPU1pYeDgvR0dyb1p5cnFvYzJHUU55WTNxMTVORzF2?=
 =?utf-8?B?UUJob0tHQkhYRDE5T1NLcmd0Wnltd2lzanQ5cVV5YmxIOGU5WDhWYWhTd2Q2?=
 =?utf-8?B?TWpoUkR3cTJ6RFdudDJRRmdSTEFrQWRvZ1hvQXZXYUpHelpIOGdzNXNaOUU5?=
 =?utf-8?B?bjI0dXk0L3dsT1VmaE53T0FzNnZvYi9jMC9EZFlacE5zdDYvRERlY1oyVkJy?=
 =?utf-8?B?bUlIQUUydzBQOHVBaHArVkU2bWN4Y1hjMlEzM2x3MkY4QnRRMW1SR0w2NGRq?=
 =?utf-8?B?N3AzWHprOWZrbnliV0pkZEJmdlBYOEx2ZXNVN3NZa1JqaURNUDlZbzlIa0Fn?=
 =?utf-8?B?R3BHVUZ0NzdOOVdtaU50ZitJeENoODZGSWRkS3Y1eWlybEIxdFIrQUI4N0FY?=
 =?utf-8?B?NXFCLy90ZDdhU1YxaEJWdllXYkM0SWcwaExURGsycVhRWERvR29JQVM2bjFK?=
 =?utf-8?B?ckQvRENKQVRtek9LM0FSSjVybGQxTWZLNy8zQk1iOUliaHI3NVBtOWRpdDlG?=
 =?utf-8?B?K1ZFQUpuK1BLTmlKeFFSeWtOVkxjZG9xZGFRdmI3TEYzcjVFWjBnc1dDOTdo?=
 =?utf-8?B?UmZsdzBIK2dzQWhYRVE5NW4ybjNtTGtVMmFobHJMYzNRVWlMN2lJa0gxSkQ2?=
 =?utf-8?B?cHZnSitBaE8vc28zbzd1WUVNcVdYYU1aelp2V08rQ0dSRHJ2MkFPQlpITWZ1?=
 =?utf-8?B?Z21yQUJYNmxTdk5PaEFWcXU2OXJ6T1hqTkt6bFlXZk5jUjhpYU5ZOFFIVjIv?=
 =?utf-8?B?TWk5RHpObWU1djJCSVp6N3BEWDNJck02bFAraVJ2MjEvOUl4Y2k3L2ZJYlda?=
 =?utf-8?B?REd2UHFjVGdyU09sYUFHQkkzZlh2NEZmQWtwckhTWjFxc3UxTzVhTmY3VVNh?=
 =?utf-8?B?Wld0eStxdjRySzFGTkt0K2JoVWtTVFpWaW4zVEpGemx4N0wwdjlpaGZoazQ4?=
 =?utf-8?B?MllxM2dxc3NnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNwMDJiZzUyb2w0OTd5Sk1YekViQ1pSSlVyRTB4NXN0MlFJcG9aOU1idXc4?=
 =?utf-8?B?VFU3c2xZRGNPS2YrcWdxeHpZcGpST1ZtU1JQNGhFNGlhcm5wQkJQNzVidXhE?=
 =?utf-8?B?SHM5RTEvTXFnNWkvUmVIbm5pNUEwalV4dHZIb2NoVmM2eFRXekVCOGNzaEpZ?=
 =?utf-8?B?RlRRZldva3RNbGdVYktHbjZ3QWVWRTh6Z21ZeE1sL1FkeTBlOWoxdmROd1Iv?=
 =?utf-8?B?d0twV3ZnMTVXMU5XZXN1ZjhneE9mWXRWVTNKLzNlTDM1WmdCNEZxNVFQYUlK?=
 =?utf-8?B?bDJpdW8zcDhvd3dkUURKbU1nSDlBNGZnRlFqNVpLT05ZWUVDMkZ2SGN0YlVr?=
 =?utf-8?B?Sm92b0FpYmRBNFljTUhrcmFSOGpJNkJZZmduTDZscHdXTHdYTUNRTnVKYU1Q?=
 =?utf-8?B?Y3FURHZuck9lV21FUkRTLzJ4b3FCSy9SL1U5UkdsWHMza0x4YW1Gbm1PSWZD?=
 =?utf-8?B?bWhaU2VOdG9xdU5xOUdjeEU1d05yNnZDU2xUTUNjOTBCQmU1eElJV1FKdTlj?=
 =?utf-8?B?bzNtYVo5MWNyU2pQemQxaExtVWNyZGtCODZwU2pGcEZwdElmWWF6bmdUUExL?=
 =?utf-8?B?Qlp4UjErcG9CUmY3aFhZUW5oUnhFZnhtYnlqdG95d3duSVovQlNMMTV1VFdn?=
 =?utf-8?B?Q3FuUks0OVBwV1EwRzl4TElQbFFqNnBMZW1yVFNwUGtpdTd5NFh1cGtLVG5x?=
 =?utf-8?B?Mno5K01tbWowVDhndzkzVVU1dVpHWHBjUXBpejFZMnRla0VYYzZiVzJrb2RL?=
 =?utf-8?B?YVdJQVFQUmZPU3ZJb2JsRmxoV0V0Umo0THA0dUZWYlZCM1c1cXcvRmYyUVhz?=
 =?utf-8?B?UlB0VFFjMUNFWjU0V0tjTGJ5VFMyNWVHeGZOU1RhamZFLzk0M0Rzd2pYQzBS?=
 =?utf-8?B?R2FIR2Y4TmZ6L0N0dWg4aWFUY3RJQkxkOFM5V1FIdktvdDFOZjdPZFB0STRZ?=
 =?utf-8?B?aXkvZmVOTWh4enU2TVgrWEhhYnFYTEZjL3FHa3FsOEdOMXA1ZTFpT2dIK054?=
 =?utf-8?B?RXlNZ1RvSno3U21Da09SUVpqYWVDbUJ6UGcvUXVQWUtqcVN2d0lPcUtQcmNi?=
 =?utf-8?B?WE80OGE3WEpPSkdHdVVFa3h5VXVva1Z2bkExTnNDOEN4VTNraVZiN1p0TG85?=
 =?utf-8?B?blJKMjNwQ1Nya0Y1cStTYm5TUXJXT1dVcm1qWnJVK0VXd21rQm5xZzR6cDhK?=
 =?utf-8?B?YTNqejg4RGgxL0prMmFIaGtrSmxSSlFNVjVzb0lmZ2czVnl1cUJmQm1YM0Fx?=
 =?utf-8?B?Q0NrbTRNK3AyUFhPeUM2aUN3QTFnVmYwUkw5UmlvbEJ1R0JrYmFNOGIzVGw4?=
 =?utf-8?B?dG9lWkljN092UkhoRHFvMUIyampuaWY5RTlhb2hsdnF2ZFdicEo4bHJQZWE0?=
 =?utf-8?B?eTZxaDFrV0xxT0NoTWpscmZyWjcrTnFJMVZSN0hhZ09zamNPNDRTTk1EdnhF?=
 =?utf-8?B?V1h4aWJtam5ZUFJiZysxTFJQZEF5TnNrYWhhK1RJOCtVU1J5U3R5azloNnZJ?=
 =?utf-8?B?ZVZsbTRvN0FSSkJSRmE2eFdlL0VRV2NoV2tkTkFzdmpZTGJZMDF6YkZhMXJu?=
 =?utf-8?B?NUhHdGZaUDZYL3ZKYlBCb01WOG5oTElpekN1bVM5Rlh3cldBa3VsUVk0d0FT?=
 =?utf-8?B?TEdPNlNRQTNFQi9KSjZIcGNtcmd2ZnNMLyttQ0F3YnJpRDB2NitDL2QwaVFu?=
 =?utf-8?B?bWJmS05vVmd4UlRVbXBMbkJvNW5UR3VQQ2RQT0t6ZUFLUHIvYTV1YUxFZU84?=
 =?utf-8?B?RHIzUU9Nd1Y3eTA1czd0T0VBTWt4N29XTHZIMnRWSEVCYjh2dmRLaDdoaHdC?=
 =?utf-8?B?bHFEb01IWUc3Ry80azJVWlQ3dDdCb1liN09XVGdic0dZNExqQkJ0QXZXRnpl?=
 =?utf-8?B?WVQ5YWNqR3o2c2tCYk5ZcitPMUNxNU5RS1k5ZXR4UnhhRUY3RDRUNTdscG5t?=
 =?utf-8?B?RmZhMFlvQ04wbEdRVmk3UVZXYUZxUHlJZmFpTkRiMFFmVW1PSkNkVk1Hdk9z?=
 =?utf-8?B?d2JkOUpHT1pyaTF6UE9JaEZFbmNwaWJsb3QrREJlbzFvcmFuczcvK25kcUpD?=
 =?utf-8?B?Y0hONk5GZm9TY0k2djlaaEpRVGRBSW9IU2dGeW9UUi9XYXZPWEQ5NGZLREF3?=
 =?utf-8?Q?BDUZmfkQb8a7Bt65nhCOx9mZ3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067a79d9-bbde-4c2f-3f31-08ddd8e1cccb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 14:17:27.4246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ku5pwWtcEivmERCsRO3i/aqqkIcdppkdmYXAkkNFj2ttvMHG3H2T9zXRisM+Tmke
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586
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

On 11.08.25 11:50, Philipp Stanner wrote:
>>>>
>>>>> But the original draft from Christian hinted at that. So, @Christian,
>>>>> this would be an opportunity to discuss this matter.
>>>>>
>>>>> Otherwise I'd drop this docu section in v2. What users don't know, they
>>>>> cannot misuse.
>>>>
>>>> I would rather like to keep that to avoid misusing the job as the object for tracking the submission lifetime.
>>>
>>> Why would a driver ever want to access struct drm_sched_fence? The
>>> driver knows when it signaled the hardware fence, and it knows when its
>>> callbacks run_job() and free_job() were invoked.
>>>
>>> I'm open to learn what amdgpu does there and why.
>>
>> The simplest use case is performance optimization. You sometimes have submissions which ideally run with others at the same time.
>>
>> So we have AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES which basically tries to cast a fence to a scheduler fence and then only waits for the dependency to be pushed to the HW instead of waiting for it to finish (see amdgpu_cs.c).
> 
> But the driver recognizes that a certain fence got / gets pushed right
> now through backend_ops.run_job(), doesn't it?

Yeah, but how does that helps?

>>
>> Another example are gang submissions (where I still have the TODO to actually fix the code to not crash in an OOM situation).
>>
>> Here we have a gang leader and gang members which are guaranteed to run together on the HW at the same time.
>>
>> This works by adding scheduled dependencies to the gang leader so that the scheduler pushes it to the HW only after all gang members have been pushed.
>>
>> The first gang member pushed now triggers a dependency handling which makes sure that no other gang can be pushed until gang leader is pushed as well.
> 
> You mean amdgpu registers callbacks to drm_sched_fence?

No, we give it as dependency to drm_sched_job_add_dependency().

>>> That's rather vague. Regarding this TODO, "racing between timing out
>>> and signaling the fence" can now be corrected by the driver. Are there
>>> more issues? If so, we want to add a new FIXME for them.
>>
>> Yeah good point. We basically worked around all those issues now.
>>
>> It's just that I still see that we are missing a general concept. E.g. we applied workaround on top of workaround until it didn't crashed any more instead of saying ok that is the design does that work? Is it valid? etc...
> 
> Yes, that seems to have been our destiny for a while now :) :(
> 
> What I'm afraid of right now is that with the callbacks vs.
> drm_sched_fence we now potentially have several distinct mechanisms for
> doing things. The hardware fence is clearly the relevant
> synchronization object for telling when a job is completed; yet, we
> also have s_fence->finished.

Not quite, the s_fence->finished is what is relevant to the outside. The HW fence is only relevant to the inside of the scheduler.

> Using it (for what?) is even encouraged by the docu:
> 
>         /**
>          * @finished: this fence is what will be signaled by the scheduler
>          * when the job is completed.
>          *
>          * When setting up an out fence for the job, you should use
>          * this, since it's available immediately upon
>          * drm_sched_job_init(), and the fence returned by the driver
>          * from run_job() won't be created until the dependencies have
>          * resolved.
>          */

That comment sounds correct to me. Drivers should mostly use s_fence->finished and not the HW fence to determine if something is done.

> Anyways.
> I think this is a big topic very suitable for our work shop at XDC. I
> also have some ideas about paths forward that I want to present.

Sounds good.

Halve a year ago I was more or less ready to suggest to rip out the scheduler and start from scratch again, but now it more and more looks like we have light at the end of the tunnel.

Christian.

> 
> 
> P.
> 
>>
>>> That said, such an RFC would obviously be great. We can discuss the
>>> paragraph above there, if you want.
>>
>> I will try to hack something together. Not necessarily complete but it should show the direction.
>>
>> Christian.
>>
>>>
>>>
>>> Regards
>>> P.
> 

