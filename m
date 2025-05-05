Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B8AA95EE
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5587010E0EC;
	Mon,  5 May 2025 14:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pfxoOKvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5010E0EC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 14:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk31mLfEotdc/m5QZhv5z5YaY72ElyJf/FFoI3W0gLuadGsYTMcpo6GtR2XJgjLdbYKXvQyypvGZHATBAAOaWFcwRD3b+So4KKypMr0/FIm8WR0hyEoSp2+hID7UBBq7WkdWcwfAHLFlkWK9gXCZBqfvNqXCPZ8x36MI8w6AwSrQEcw9OSHg26pKHg1z3EuYHLbzLN8wpHewN4DtV+j6A+A4zoTm5TxIC+lHqZ8HE5RMDa4oEc+Eq1zT1Cy1HhcDPeTwfw+feO6Y+E40Y6FvG0g+zS45O0bPVPnlD3hRfRCdv3ZtRV51a6JwXWPin88UZ79jBKT1AceLsHJqp+SuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7wgpoOcPWfH+B/E3HRtPoDu6zuHvtfgeEwVSgZZ83M=;
 b=AnBHfZhxLjqSIyzbT9LBf1dwLmL9R+drwYb06om9ZOswEuZJQjI/+V/iCHFr0QVg/GqSPY0CCVOB4NnQvMnRTSMeltHgYYhsllJ76hScjdsR1uZukw8k7Iz3+OZ9K0CYuKCfg5iJVuoqjpuHJrXciLspp8TsHcID80f3jK+e3JyTJFo/nF6dQctSgWoe6uCTjXTjVBP6Vl7uGmofESSFl920KTR+b/bUKfcpQQq4Vpwe0A6SYNxvUUZJ1o9ZILRcqjLuRQjw3ZhTO8aSDSqfrJn4RBAnOkCazpt6PXE7DBBE+/XEmUIFG8b01FCCwxcOggfgO5ohuGQKyma5lA+yMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7wgpoOcPWfH+B/E3HRtPoDu6zuHvtfgeEwVSgZZ83M=;
 b=pfxoOKvVAV+FLmx813ke0qXHjFnV9MPz/FJ0Ds19XHu5AJwZn838dbJQaHXaRImgPmITeM0GifHECJHY7IdWIEDv9OVNwH29G4EBCUw1j8cbI7xN5R7PjExxfcTh2L/6Tpd0Bbc/7C9/MXaEZEDBkb7anlPBECTWRqm4k4hfZzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CY8PR12MB7196.namprd12.prod.outlook.com (2603:10b6:930:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 14:32:20 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 14:32:20 +0000
Message-ID: <58fb9a49-4f4f-48f6-ad98-8be27ef0c0f7@amd.com>
Date: Mon, 5 May 2025 16:32:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/shmem-helper: Import dmabuf without mapping its
 sg_table
To: oushixiong <oushixiong1025@163.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250501064324.398650-1-oushixiong1025@163.com>
 <71ec7bd1-be90-462e-8a07-e56fccae4096@suse.de>
 <8e4f60ec-caa8-431a-88f8-aee8183d96e5@amd.com>
 <a681cfd8-0c8c-4ffe-9f42-f0e54ee2539d@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a681cfd8-0c8c-4ffe-9f42-f0e54ee2539d@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CY8PR12MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b455ba-a3e1-4220-ca8b-08dd8be1a3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG42b0swZnczR0gzVVJuQm1OSGkxQ3F3VmVTbGR5SU5Ea0V0UFBaTlpZSHVx?=
 =?utf-8?B?Qk5jMjhjc2hBOGhXb1UvekZRcm8rYkZJY2lTNU5vWFEvR0lhaGpwak14NCtk?=
 =?utf-8?B?OXlIS21HUEp2TiszYkhXbVplWDdhZjFvTEwrRlNPcCt1TkRMSXp2b1E1aDhJ?=
 =?utf-8?B?QmNuNjZVM2I4UGU1SGxxUGtnNWZiMmZOSm9mdlFOenVWMUxGNU9rdFI0TlUw?=
 =?utf-8?B?U0NHY0JtTlMxZkR6QVVoTjFENmNWbUtCRGlCbGlnZzhMbVZub1RhelUybjVM?=
 =?utf-8?B?Ukd3TGpzSWVsOUNxY3BHdkUxUTV0YTNWdTVEaWJobEVORDJXSnYxZVBka0t0?=
 =?utf-8?B?a09hemtIdzcyOWNNUW9Ja0dRR21lbVRIWjJwb0FXU3pxd1cyTUpvS2ZSc3By?=
 =?utf-8?B?ZHFNMkYyK2xuMzRkRU9jM29pZDBsRmczZUQ2Tm96TDJXQzZvRGppWE9XbCt0?=
 =?utf-8?B?SUU0R0N2WjlDSTR6QXBJdmxZaG5ESmR3bldqMXVWeko1L2VHeDZsN1pBR0p4?=
 =?utf-8?B?YkVIU3hXN3ZxN3dlNmdkTTFnNDBTTkI3WnR4bUxxbGFaQWl1V0pPeDBTMU5k?=
 =?utf-8?B?SHlxdCs3eXk5cFE1MWhpbGJzcE01bVkwcnFkTEkyY2tTVkN4SjlSOWNxem0z?=
 =?utf-8?B?K05PWVNWYU81ZlRxT0h2TEVZSklLdzZDTDBzcHlEV0ZPVW1ydWdrdllxUWtE?=
 =?utf-8?B?OGc2Zm9RZXNnMTZhcWY5RDBuSEZwMTl2RHVPeDRpRG9jM2xSWHFWN0lhL1RV?=
 =?utf-8?B?TUZSZFVrNmUxYUc3aWREbS84MWNmUWgzRytpN09FWm9JSnRra2VZTzdvWHg2?=
 =?utf-8?B?N2dTM1RXNjRyV1ByRmtNclcySHlkZ3l0RG15cEwzL3U2SExva2UzbW9nRlhq?=
 =?utf-8?B?TDhhN2pSTHF6USs0d1BWMWc4VkJSdUhhQU9pYlpWVzFxcDRic2paaWxBN0pQ?=
 =?utf-8?B?b0JqODJMNWtDRWtRd0V5T2kxNW10UlVjb0h6Z05NdlRua1ZNTWlPMUJja0I1?=
 =?utf-8?B?TmZSend3WmZlNzRaZ0lReGkwWFBVS3lkNW1sdlFZc0Zvd1Z2SzZlRGV0Rkxq?=
 =?utf-8?B?bmdqdzhZUnZnNmxVQnNnQjNKMjczU1I2TytQTDFhYmpCTVVSaE1PZWxoSTBo?=
 =?utf-8?B?MElmT1pCQjFBZFBNV3ZIMXA0aTZ5VzA5TjFqbEwraG8xZnBBOUZFMTFRRHBv?=
 =?utf-8?B?REtMWFRhMktTSW9WemoxcDB2amxjenEvbEZtTWpQMjB1SlZ3ZFVGRnpOVmVN?=
 =?utf-8?B?WlZoQ212Z25iUExneHR1Y1VxcnQrYUtjZ0piVkhZcnZidzNtR0JnaEs3V1Rp?=
 =?utf-8?B?U1VWNDdKK1N1ZGFCVXMxNENydmdRcUdQTlRDd1hOaHoyWTBTdU9ncmFLSSs2?=
 =?utf-8?B?MHdwZGo2N1RJRTB5bkYrbC9uYklLaXRkWmVaNEhxRndNOUhybFBQZXhhcFpW?=
 =?utf-8?B?d0IrQjVRQXg5dnpEQStnbGthTHRlRXU4cUNtZGQ1cFNPVWFiRUJJODU1eHVi?=
 =?utf-8?B?SjVCR3dibCtmb09CS3cxdmkrdFQ3c09QeWhVbW85dVczOTUwNTRrU2V0MnAz?=
 =?utf-8?B?d0dQT0VMT21yKzVhTkVUWDNXcDI1MXpVSW5yUTV0ODJNV1JLVVZQa3NUM2tl?=
 =?utf-8?B?anpQdTRTbGV1K2lXbEUydHJSZ1kvdXI2M0NuY1dnZ1l2NWdNTzluTjM5UFlV?=
 =?utf-8?B?RnlCM2diNXl0L1cxM05Yc2RTaGwyN3B2K2gzeStIbzluNUdSUzFSWi9LSk93?=
 =?utf-8?B?OVVLeDdHT3NFaVRTcy9LcVVqOHZXY1IrZ3JWRzE0UjZPZTIxYktyVHd2K0gv?=
 =?utf-8?Q?wJDiJ3vajPuQoSDVunfqjTQ/kxwnLeeAKi1Nk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnk4OUxwbSt1NXBacVUvcTdlcTVUNzBjUU5zdnRUcGxic1J6ejNMZi9CMlhC?=
 =?utf-8?B?WFlCUUlScTJsM05Ja0gvQXZyRERTMUZlaUJLRm9qQS9GZDdiWG5VY0x3bkxm?=
 =?utf-8?B?dGlydXBJV1FBdG0xbkFCU0VLaVpiWUxBUWZsZzdBaEJ4RERLL2IwYWF1R0ht?=
 =?utf-8?B?RmVrdm5aSmFLbUh4QUw0ZlhmZU5iMmRlREJlUXdCcXJDN2dOVHR0cXlrN0pL?=
 =?utf-8?B?K0ZyWHl1eTN5K2xqTHF4ME1wL3NMZmY1U2pVVzQyT2hzZlRkdHpFUnA3VURD?=
 =?utf-8?B?Y0NZVFl1cUx5RTBVcWo5S2VQRXkzQU1CeWxveGdrU2NyNnlqcVdlVmJ6aEx6?=
 =?utf-8?B?SmtVdzVnWE15OG9hZFFueHBiZXQxSUErQlRONG5TcnhUSGY0NThNanQ4VVYw?=
 =?utf-8?B?dFR4USs5b1lqdGhvM3RiZ3NGcXQ4Z3N0Q3EwSkpvckVPVGozaUlObEgrNGJE?=
 =?utf-8?B?MTZVemZWVkdyWTJoREluRVlxV0VwbXBPcXhqZ25oNjFBaWtCSkM1YzZrWEJX?=
 =?utf-8?B?UHFWYjR4VndkNFNsR1RaU2pIdTJnMFhTUi92d0JkMXBDYk5yU2lTaUR4bHNE?=
 =?utf-8?B?QlAzYmkvQ3p2M2NkY2dWVDJBTHRQVWxnWERPaGx5L0pPbHZJaWw0cDZiQjl4?=
 =?utf-8?B?dHVINlE0cnRyVGdMOXhXR2V2TXcrVyt5ajIrVUNzQmJvWEVoVVh5R2pHWlBu?=
 =?utf-8?B?ZW9xVTFxYjRnN29UTmduMkpsQzEycG9IQkI0dmJIbitEWlBLSEI2elh4VkVv?=
 =?utf-8?B?M3laTENkSkF6SEx1OGkrNVFtRU1Ca2NGek8rOUxodG5WUVhjbTlpRHkzMG1k?=
 =?utf-8?B?eDJRSWNUSDByNUhSQTFhRFFqQTZQZDl6LzhsbUN4cjFuLzlTdyticWcvbzcx?=
 =?utf-8?B?OFhydFYrRXNDME9tdUpMVHk1YXZUamdBZFpEb2l3YmFGS0hmd29DU3AyLzIx?=
 =?utf-8?B?T0l3b3g2bTl5ZVNhZDdlOGRVc3hadWpvZWYzY2ovTUkvVzdPYjgrRzVWSVR6?=
 =?utf-8?B?NGV2Tm1NZnBtTDlrS3ZIOFQ2YnQxTWROd2xLdjBkREtkeXBmOGpHRzFiSUtv?=
 =?utf-8?B?UHRQYVZIRUp5VlAvWmpVdGF6Zm0rYTA3Qy9ZWHRvaXVvWldBWEtsenNoUXhY?=
 =?utf-8?B?M0YrSkZKd2dmclhNbktsUmFDS1haV2M5cUdUYjJ1ZGY4TnpoNi9nS3NYV0Rh?=
 =?utf-8?B?SThzR0lGUXE1VXl0d2srRm4vbGErK3RYa1JRRDVPRWtTWFQvODhudTFaZXRQ?=
 =?utf-8?B?RjBZeVlDOHEzc0ZSM3ZRcVNKUU0yVnhCck53YkZ1L1d1MGJFelp0K3MzK2VD?=
 =?utf-8?B?NDJqTjR3Y0RwOEVFakVuSy9jd2ZuUFpGZHBabER3dlA0R1Q1eld6MzhreVNh?=
 =?utf-8?B?azROaklsa0h6SG5DSjNsSEpoRDNyMnJSbEw5eDlpajNXL0cwaVU3S1A4b05l?=
 =?utf-8?B?ZkdmZ3lmaXJtQzl0R1R1UC9ZY0VDZytEMGVhOHEvZkd4c0FlK3laKzRtNnp4?=
 =?utf-8?B?VUI5SVhSTEpaNWZTbmlocWRqSlZjSTBPQzZJamo0YTZ6Z284VENvT2FlKy9Y?=
 =?utf-8?B?emRTWUFXN1lTYzl5RFIweTQ3RFRJNnd1UzF1L2RUQWpTUVEvQ2U1TkRyU0dj?=
 =?utf-8?B?U1FaZzlEVHNxWTJDSWdCa3UwenAyMnB1U1hXVFhPajNseHEwZ3BaWHdmVU5I?=
 =?utf-8?B?NU9YdHM3cXBjNDJ0K0RPRzgzMkRkLzNEZGM3bjFYRmFMamxHczVOL0VSNGkw?=
 =?utf-8?B?czdEOFhVVWpxQVVIUEVXeWJrMG5odkpDOWdVVFJZRnR3UU1aaFJyM0x2MVIr?=
 =?utf-8?B?Tjc4TjJnZ3NydFpUc2FlbDFUY2tyRmZBUHk1QzROZmpSVXhvWDdCSHcxTzlq?=
 =?utf-8?B?Vi9kdk1mM3owNFYzTkZDUE9XLzU3VTNneXVzcHB4Y3lUQWJObFlkcEJmbFFu?=
 =?utf-8?B?YytMbGdyVWx4WTNoNHFTdFJ3c1lpVkhUNjBTYkx6aEkwMDF2WnhYWHQvQU50?=
 =?utf-8?B?aE5XelVGeUVvTzdTcnBmMWVNWFVnSW9rTHJsTTZPNEJhbzNtNTg3NEN0L2lE?=
 =?utf-8?B?cXpaS3ExNzRLdXcyZ2FwZ2ZYcDFXVy9rdE1WejdWamorQ0FXODFmREU4L1F0?=
 =?utf-8?Q?2CFSE2FR60AQydYVLNFodc9Qi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b455ba-a3e1-4220-ca8b-08dd8be1a3f7
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:32:20.0641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IICJn/pSq0bC66f+QJsgtsIqS36wd+TqxGW3e/hkVVvULJwLHtCqtTL8TChmDqvD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7196
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

Hi Shixiong,

for drm changes please base your patches on drm-misc-next or drm-next.

That is probably fixed by this one here:

commit b72f66f22c0e39ae6684c43fead774c13db24e73
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Feb 11 17:20:53 2025 +0100

    dma-buf: drop caching of sg_tables
    
    That was purely for the transition from static to dynamic dma-buf
    handling and can be removed again now.
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
    Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
    Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20250211163109.12200-5-christian.koenig@amd.com

After this patch SG tables where only created when necessary.

Regards,
Christian.

On 5/5/25 16:22, oushixiong wrote:
> Hi Christian,
> 
> My patch is based on linux-next, so this patch is not based on the latest code. Then, I'd like to ask which patch resolved the issue with sg-tables?
> 
> 
> Thanks and Regards,
> 
> Shixiong.
> 
> 
> 在 2025/5/5 19:25, Christian König 写道:
>> Hi Thomas & Shixiong,
>>
>> first of all the patch is still based on outdated code. For example the cache_sgt_mapping member is already removed in drm-misc-next.
>>
>> So if I'm not completely mistaken the issue is already resolved upstream.
>>
>> Regards,
>> Christian.
>>
>> On 5/5/25 13:12, Thomas Zimmermann wrote:
>>> (cc'ing Christian)
>>>
>>> Hi,
>>>
>>> I don't feel qualified to fully review this patch.
>>>
>>> It would be good to have the issue with sg-tables solved, but I dislike the dedicated initializer macros. So my question is if this has any drawbacks. Or could we make this available and the default for all shmem-based drivers?
>>>
>>> Best regards
>>> Thomas
>>>
>>> Am 01.05.25 um 08:43 schrieb oushixiong1025@163.com:
>>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>>
>>>> [WHY]
>>>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>>>      DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>>>      sg_table import.
>>>>      They only need dma_buf_vmap() to access the shared buffer's
>>>>      kernel virtual address.
>>>>
>>>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>>>      trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>>>      restricts the maximum DMA streaming mapping memory, resulting in
>>>>      errors like:
>>>>
>>>>      ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>>>
>>>> [HOW]
>>>> Provide a gem_prime_import implementation without sg_table mapping
>>>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>>>> require sg_table can adopt this.
>>>>
>>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>>> ---
>>>>    drivers/gpu/drm/drm_gem_shmem_helper.c | 95 ++++++++++++++++++++++++++
>>>>    include/drm/drm_gem_shmem_helper.h     | 24 +++++++
>>>>    2 files changed, 119 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> index d99dee67353a..9e41e350ff6f 100644
>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>> @@ -39,6 +39,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>>>>    static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>>>>        .free = drm_gem_shmem_object_free,
>>>>        .print_info = drm_gem_shmem_object_print_info,
>>>> +    .export = drm_gem_shmem_object_prime_export,
>>>>        .pin = drm_gem_shmem_object_pin,
>>>>        .unpin = drm_gem_shmem_object_unpin,
>>>>        .get_sg_table = drm_gem_shmem_object_get_sg_table,
>>>> @@ -799,6 +800,100 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>>>    +const struct dma_buf_ops drm_gem_shmem_prime_dmabuf_ops =  {
>>>> +    .cache_sgt_mapping = true,
>>>> +    .attach = drm_gem_map_attach,
>>>> +    .detach = drm_gem_map_detach,
>>>> +    .map_dma_buf = drm_gem_map_dma_buf,
>>>> +    .unmap_dma_buf = drm_gem_unmap_dma_buf,
>>>> +    .release = drm_gem_dmabuf_release,
>>>> +    .mmap = drm_gem_dmabuf_mmap,
>>>> +    .vmap = drm_gem_dmabuf_vmap,
>>>> +    .vunmap = drm_gem_dmabuf_vunmap,
>>>> +};
>>>> +
>>>> +/**
>>>> + * drm_gem_shmem_prime_export - implementation of the export callback
>>>> + * @shmem: shmem GEM object
>>>> + */
>>>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>>>> +                       int flags)
>>>> +{
>>>> +    struct drm_gem_object *obj = &shmem->base;
>>>> +    struct drm_device *dev = obj->dev;
>>>> +    struct dma_buf_export_info exp_info = {
>>>> +        .exp_name = KBUILD_MODNAME, /* white lie for debug */
>>>> +        .owner = dev->driver->fops->owner,
>>>> +        .ops = &drm_gem_shmem_prime_dmabuf_ops,
>>>> +        .size = obj->size,
>>>> +        .flags = flags,
>>>> +        .priv = obj,
>>>> +        .resv = obj->resv,
>>>> +    };
>>>> +
>>>> +    return drm_gem_dmabuf_export(dev, &exp_info);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_gem_shmem_prime_import - Import dmabuf without mapping its sg_table
>>>> + * @dev: Device to import into
>>>> + * @dma_buf: dma-buf object to import
>>>> + *
>>>> + * Drivers that use the shmem helpers but also wants to import dmabuf without
>>>> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
>>>> + * implementation.
>>>> + */
>>>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>>>> +                          struct dma_buf *dma_buf)
>>>> +{
>>>> +    struct dma_buf_attachment *attach;
>>>> +    struct drm_gem_shmem_object *shmem;
>>>> +    size_t size;
>>>> +    int ret;
>>>> +
>>>> +    if (dma_buf->ops == &drm_gem_shmem_prime_dmabuf_ops) {
>>>> +        struct drm_gem_object *obj;
>>>> +
>>>> +        obj = dma_buf->priv;
>>>> +        if (obj->dev == dev) {
>>>> +            /*
>>>> +             * Importing dmabuf exported from our own gem increases
>>>> +             * refcount on gem itself instead of f_count of dmabuf.
>>>> +             */
>>>> +            drm_gem_object_get(obj);
>>>> +            return obj;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>>>> +    if (IS_ERR(attach))
>>>> +        return ERR_CAST(attach);
>>>> +
>>>> +    get_dma_buf(dma_buf);
>>>> +
>>>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>>>> +
>>>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>>> +    if (IS_ERR(shmem)) {
>>>> +        ret = PTR_ERR(shmem);
>>>> +        goto fail_detach;
>>>> +    }
>>>> +
>>>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>>>> +
>>>> +    shmem->base.import_attach = attach;
>>>> +    shmem->base.resv = dma_buf->resv;
>>>> +
>>>> +    return &shmem->base;
>>>> +
>>>> +fail_detach:
>>>> +    dma_buf_detach(dma_buf, attach);
>>>> +    dma_buf_put(dma_buf);
>>>> +
>>>> +    return ERR_PTR(ret);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import);
>>>> +
>>>>    MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>>>    MODULE_IMPORT_NS("DMA_BUF");
>>>>    MODULE_LICENSE("GPL v2");
>>>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>>>> index cef5a6b5a4d6..78ef91593a8e 100644
>>>> --- a/include/drm/drm_gem_shmem_helper.h
>>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>>> @@ -110,6 +110,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
>>>>    void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>>>>                  struct iosys_map *map);
>>>>    int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>>>> +struct dma_buf *drm_gem_shmem_prime_export(struct drm_gem_shmem_object *shmem,
>>>> +                          int flags);
>>>>      int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>>>>    void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
>>>> @@ -168,6 +170,18 @@ static inline void drm_gem_shmem_object_print_info(struct drm_printer *p, unsign
>>>>        drm_gem_shmem_print_info(shmem, p, indent);
>>>>    }
>>>>    +/**
>>>> + * drm_gem_shmem_object_prime_export - GEM object function for export()
>>>> + * @obj: GEM object
>>>> + *
>>>> + */
>>>> +static inline struct dma_buf *drm_gem_shmem_object_prime_export(struct drm_gem_object *obj,
>>>> +                                int flags)
>>>> +{
>>>> +    struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>>> +
>>>> +    return drm_gem_shmem_prime_export(shmem, flags);
>>>> +}
>>>>    /**
>>>>     * drm_gem_shmem_object_pin - GEM object function for drm_gem_shmem_pin()
>>>>     * @obj: GEM object
>>>> @@ -276,6 +290,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>>                        struct sg_table *sgt);
>>>>    int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>>                      struct drm_mode_create_dumb *args);
>>>> +struct drm_gem_object *drm_gem_shmem_prime_import(struct drm_device *dev,
>>>> +                          struct dma_buf *buf);
>>>>      /**
>>>>     * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>>>> @@ -287,4 +303,12 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>>        .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>>>        .dumb_create           = drm_gem_shmem_dumb_create
>>>>    +/**
>>>> + * This macro provides a shmem GEM operations that implementate a simple
>>>> + * gem_prime_import.
>>>> + */
>>>> +#define DRM_GEM_SHMEM_SIMPLE_DRIVER_OPS \
>>>> +    .gem_prime_import    = drm_gem_shmem_prime_import, \
>>>> +    .dumb_create        = drm_gem_shmem_dumb_create
>>>> +
>>>>    #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> 

