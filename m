Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKvsCJXxeWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:23:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDEEA0420
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7471010E671;
	Wed, 28 Jan 2026 11:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="QIs0fQ9+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QIs0fQ9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D8210E671
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:22:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tGf9lfbNo+X0rpmJyLiN9++XRgPJHj5aWfDOz5U+CLkHHSUNgLJ0fDMC8cayGxMZ8jeeU3TFT54bf5j7PE0LqnsYJbRD3KUi7TROAo9P6ATeLGwjXt+BVKyEidp1gpVMEwAZmqHVw1dhG8CfuuC0ihEL28jFcRTJYvHg5xMhdfsocEXaAaFngQTpDHBwEn38eDNKKi8UHjrNjTrGmPpDplhCsfGW/E4viB4zIw/VLUcDp13vf5MUwxv4hkDYzFHC7TSYbRMRSYMtGYWHOPU/1vN0J39UHVjgVRMRBDoiJrDlbEmVH8mJwU/E0ay2amY+bCoJigwqxCusPWdgSsngWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdinO5KAGqWcxSnTy5N0jz3vg8fsZESDShJl7mNBFNI=;
 b=wSPkWkgV+68TBlIvNwEZJx0h0iCTPfFVOPvUbLa29z6Vy56RiW3tLUfWh6tjc5RFuCQjD5u3L0qIXu0/miBB01xDlRS24LyS9mlrZ/36L0M74xT9VVA/yjOXQO0wCsuEC4y4GUDJcmTe99t2lbZGECsCYC0DBF/JZXzG4mKmCwL5R8XxySqQJYtWPpBlslyZN40i4H5LLKZPbSMFroT7hytcxpK1dPMqwPJrb09RiLu4zTl4NEkGMoFXgGrx6eSTO9FEFmzNElEdPVj4601Lb8yfw6j3rhpchZbL/LvfdQBe2VCfFdNkMM/wCLKqMLxzhVmk5BPuh5mYoIJ53vh23g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdinO5KAGqWcxSnTy5N0jz3vg8fsZESDShJl7mNBFNI=;
 b=QIs0fQ9+Z3Xa6dqb5gQ70eq/O7H1eOXcKs13pWxcVzJhC1VRzTOYfp3lDSvKKClAPH6GR4MhIidcAG50ySCX/rbtiNyJT7tNvKqsmNzH5kghvX/zO/hAMnv8qcyM0kHerXO8/bbkgi/6B8QkGSjw19YNI9QL7E1BdwELs+kRMkI=
Received: from DU7P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::19)
 by DU5PR08MB10636.eurprd08.prod.outlook.com (2603:10a6:10:523::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:22:49 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::84) by DU7P190CA0009.outlook.office365.com
 (2603:10a6:10:550::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 11:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 11:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pS1aGbebNxY4WuwMOAmUZCzN4Y15CsJ6kLwgIWG832EBfASnx96DQaXFV2XjsOpvYkNNOSkjf8dFVK2yknRhfXBKfpV5hxq4AdqS7IGH18xkCnhovATFaObFmgCni/2zcthp6kYxW3vViaJliDo798FcTBTxZFdskQQLcvrKgssdrVK5zt30oRofVZfkOgGRdULLaS2txKUFZDM79AqmWF6jPR0E3WDHl5OKe2qNlChEvOn8g9cBM6J1d8n1/JDMT1N9e7WDdfXGAxsUo4As/JT+Gb2MB3ITFbQ2xQCgHVKMzwuPeC6I8DSX3g9A8h2UMcaDf6R2hW+15vKvXW2t2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdinO5KAGqWcxSnTy5N0jz3vg8fsZESDShJl7mNBFNI=;
 b=Kkf2VUbo2wpKgYIBcNQoqPwaZdF6st3hXSe9eHTSMt1KwT7njw2WatfLBRFNheKY7PCRRQwl2C/Iil1ma6PsSvO7GI45Bn24HTnkMqoAv3SG9U0eZoYZ+Wc/SEvHzrHRSU2LCCUaS5cfw2BFY2vGW0+NlF+Si6CApIRI5NWTg1Dk/sjtukWlXc+K6w0Z76y2F2SQrwjDZ8JPiSC6PwEL8WPGYAaosd1J0Bz33Ke0prfVzIoxChCCJJWrVIsP/S9LgWsy4MzMaRy4mlPpaNqnUASnhUSfIZvfq3JNrTMaf7BekVsXiXnv2Cy7COPcx9s2g/BVKRpASR5CsID4BJTr0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdinO5KAGqWcxSnTy5N0jz3vg8fsZESDShJl7mNBFNI=;
 b=QIs0fQ9+Z3Xa6dqb5gQ70eq/O7H1eOXcKs13pWxcVzJhC1VRzTOYfp3lDSvKKClAPH6GR4MhIidcAG50ySCX/rbtiNyJT7tNvKqsmNzH5kghvX/zO/hAMnv8qcyM0kHerXO8/bbkgi/6B8QkGSjw19YNI9QL7E1BdwELs+kRMkI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by VI0PR08MB10710.eurprd08.prod.outlook.com (2603:10a6:800:207::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:21:45 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:21:45 +0000
Message-ID: <77dec915-da6d-4ff5-b949-a883288f2672@arm.com>
Date: Wed, 28 Jan 2026 11:21:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com, nd@arm.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <714d2b72-67df-4590-9943-6289886c0a89@arm.com>
 <20260121155238.2a6c0274@fedora>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20260121155238.2a6c0274@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0612.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::6) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|VI0PR08MB10710:EE_|DU6PEPF0000B61B:EE_|DU5PR08MB10636:EE_
X-MS-Office365-Filtering-Correlation-Id: 255ec8f0-0fcd-4d8a-1572-08de5e5f918f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dHM0akxLeFVKRVUxS2V1cTZjN3VqVmhXZS8zWWxGd0tHTVFPU2tJdzdrRFFS?=
 =?utf-8?B?czRDUjljYnpGNWw1NVVtWmJBK3Z0ZytzZUZVdmc0ZlFoU2Z1Qy95N21LbWxl?=
 =?utf-8?B?ZXovalhKcmw3UzBWT1ByOEsrbDNGYVpreS8xMnd3Y25xeUFsY1g1NjFwWEMy?=
 =?utf-8?B?dThKZWpCVGdLRERwU3R0Z2FKTnpNdi82Q3N5WGFvVmFvbEVQcXZ3OHZuaG5m?=
 =?utf-8?B?RnBOcnpkVllxZXUyTWNQMGhLZEdERXFhMkRuL2EzTjVTaG94RjQzOVFOTFZk?=
 =?utf-8?B?dHpjZEczUytGODI0NDBkQ3N4QjdiSlZxS3VsY1VlRnpHSzlQKytpREJkM0d0?=
 =?utf-8?B?aVhZRC9leStJQzB0ZjFLamtsUzYvTU9NUzVOanYzekhtZjhvQmk1b0lCais2?=
 =?utf-8?B?SVZ5SUdiSE1sYXlqdDEyTnZIeDhKcWhDTnJSR3d2OXVZa002aFJpRlBEZERn?=
 =?utf-8?B?bjVYaEVBb3ViazI2NFNGZ2JQSnNCeDAzbkhCano1aGZ4MFdzaHhwV0lEWjFq?=
 =?utf-8?B?TFdhUkcydjF4ZzZVMWFCL0ovRjBldXhXbm1tc1dZdnRmQjE1ZEEwOGRxcTQr?=
 =?utf-8?B?S1BEdnd0TFY0YkdtcFhzM2JjNkJmSmZpaVEwcHNLUHhxc1dpY2lsU21tSmtI?=
 =?utf-8?B?VG9yTlBuUnlwODJ3cjQycStwd00vM01FbTdwdWthMXBPb3puajd6SDBkR2d1?=
 =?utf-8?B?UkRFWUd0eitnRkRFZytrdVBWUDZxekVGblNlbzJKVWt1ZmE5dHdlOXJlV0k4?=
 =?utf-8?B?NzJtVU5aeVlGVlkwTUtZU0ErYTFsaEV1YzJSSmp3M3FadlQwVWtudG1RUHlx?=
 =?utf-8?B?VFdYQzU5dnlzeitPakNCeTJSTFVONkpOUzhQWXVTamk2eDhWaDRDUUFQelZ5?=
 =?utf-8?B?L0thV1FpZVRhVWpVTXRDd3czL3ZJVERuSnBZTnQrRGVGTG52TUlEblordWpE?=
 =?utf-8?B?aTFqK3dRZ0h1bituNFcrUVJaY2MvNXR0ckpxMVQ5N3ZUcE82eWJ2bCtkL1lz?=
 =?utf-8?B?Q1crRjh4RXlaVVk0RDZ0TFRSUXpQOThrOTJ4ZnQ5bmlHRXBZMnd0eUloUjBr?=
 =?utf-8?B?UkkwMEt3emZITnNWdXM1N2hma3lnczc2a2ROdXNwNWRxdWkwc3NHcTRqbjg0?=
 =?utf-8?B?MXJVcTNnSEd2dkRnUVlzS1VVQ1d6YkhHU3ZWZXFPVEw3Nzdsc0VCVlV2U1lu?=
 =?utf-8?B?bkxkY0Iyang0WVpTTVlmZkErOFlmcWZBeGZBWi9uRm1iUXFWY3hnSlBXSE83?=
 =?utf-8?B?T1VQbHlseFdCVHZnSFcyTjFMenNaZWRtQXhmRU56UVJ5Qm1LWHdadEM0WXVX?=
 =?utf-8?B?YmxBVCsvUGtXaUhZYVB4RjVwSWtSMm5aV3VTUWUxZFpMOFM5WkZFbnhTdmUx?=
 =?utf-8?B?Yi9tQlFtSkF1VGQ2VWhEVm1EbGo3WWhiQmFlZEUvWXI1eFE0RlJvSlpsUnU1?=
 =?utf-8?B?dmEvMHlweVZuZy9hM2NxVUhVU0RHOUJaZDQ2SWZoTnZJNTJ4TzFSRk1YeVhq?=
 =?utf-8?B?bkRlbExGUG9pbEdQUld5TFNiVmhoM2hmSnFqUUwrc1AzemVwckUvSHoxRjRr?=
 =?utf-8?B?WkNvRzZuOUdiTG1wS2REWUxTWWtsdHUzNWVRMGVTSmdwdnV3SjM0Z1VWVXhM?=
 =?utf-8?B?cFhXaXc5UnlJMkVHOHNMcEhud3Z0cXNSVE5FR05oa1J3czdkbEFmbXJKZm55?=
 =?utf-8?B?SElmcG42TnczYXBkcVkvU2VsK1kwQ3dsVml6dzR1VUR5MmF3WW5hcTdVM2k4?=
 =?utf-8?B?aWppc0twMUhUdjBpeklTZ2lEcVo4WFVJc1M2eUhwR2NRQnZtM1M4akR5WlZ6?=
 =?utf-8?B?V3FtVGs5Y0pYdldyVG9DZFlTTzZ2R3I4VGVscGJkQWdsNmFMbG9tUG1oN1lz?=
 =?utf-8?B?MTdua0RLd1RZUzFyeDJ4S1pEUGpKS3NibUhNMUlzOTcyWTFFUE9TbVlsTzZm?=
 =?utf-8?B?NDlsRjFJcXM4RExwNVNyRkVNSktpZXh2MEtWSk00dERlbmRaSWVqNDcxKzZo?=
 =?utf-8?B?OFg5SEV0dUtvYysrWWhnWGJXMCsybW5kUmIrRm1wOUcrNUxOdkl5cGhVU0tZ?=
 =?utf-8?Q?tY99FA?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10710
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49590efb-abb2-4977-c42c-08de5e5f6b9a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|36860700013|7416014|376014|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmlzMzc2NGRZTkZEWGg0M09pMEoxNCtzdFF2ZG1VSzNRZ25sMjVyTDFDc3hP?=
 =?utf-8?B?Q1F3U3NpR0twL3h5a1l5U0Fjb3d5TkJac1NqN3BuTW9iaDVyQ25kVFBZNDBY?=
 =?utf-8?B?bi9YNVIrc1VXaXJLdnUwa08yWi9BbHhzY1JPS2wvdlU3VHJybFRwUGxUbjRo?=
 =?utf-8?B?VG50dUJzNnkzN3NiSWNPS1lCSnBwVU56eXd2WERsQ0dla1N1RzlrR0U4WExp?=
 =?utf-8?B?WjgweGlDbTYzUStBaTVwbzNsdU1qNTlZR3M1ZDc2U1hqVVhrNmlEYmFzRkZU?=
 =?utf-8?B?MjIwN2lMSjVVTUtPRUxlVWY0WHppODJDbitQMTJQUzNuckNiZ3VYU3d0VXM2?=
 =?utf-8?B?RXU3YWVPSHMwcHZwWjJFaUpZSzczRmRxMWxJYVoxM0VaZVFFbk1XaUVYb3dW?=
 =?utf-8?B?ZkxTRStpNXoyUm1kSU0xcERqQllaazFqQU1IK29YWUtXRDFXcUFrK1Yrajhi?=
 =?utf-8?B?VTlGeUpEak5MaG96OFVQTVljR3JqZmpKbEd4OGZ0ZmJUZEFnUEI2cU1mc09X?=
 =?utf-8?B?bVNFZkQ1WWJDekM0c0sybEVaSTZJbUd4WTR0YkRMdWlra3R0eGJnY3NWeU00?=
 =?utf-8?B?N0Z1d3M3K3lCQldWT3E1RFYzeHJFVFE1U3FFc0RQcUpRa3VlK3dFSGlNOWI1?=
 =?utf-8?B?UDFZV2ZkbmFyQVBvVHR3NCtBL293S1FldEsrWnRTQlFjNk11ODEzd1k2bHFh?=
 =?utf-8?B?UlhzcE55c053ZVRja0RGbkdnSU03UWlHOTJiVUxuc3ZLYTBCakR0VDluL2NN?=
 =?utf-8?B?SHRtL3lBZU5HVkxmNi81cCtQZ2VydGZuRGVLRXdmcmpERXJlT3F4UnV6OGxH?=
 =?utf-8?B?cjduOHlSVzZWbFRCK29PN3dzT0lqK041ZFBTTEtrRDBpMkVON0VQYlhUUFpD?=
 =?utf-8?B?b2thVkVSVVYyVXNhenpJbmxCRi9UVURlRThLNmtNWTlSMHZaTEpvR2p1TDV2?=
 =?utf-8?B?RFBQS1BlaTVUL3ExWEdNSXJMY01MNFFHUWFUYThIcXd4NGVCN0NyeTlTNjhN?=
 =?utf-8?B?bFFFRldkeFBTTG5WRWZFS3lERkNSOEhsR1pKRnkzQ3FjVFpQcTdxV2dONnNt?=
 =?utf-8?B?VDA4ZTFCcHo4UThPNmw2dDFOd2VIMVNjWVJSa2E3R2ZwOU1MKzEzVWU5VkRI?=
 =?utf-8?B?b1JtWlFMeURQSXFNbDZPQ1ZkZmc2NERTZnl1VHNWKzRuOGY4YkdvUnNsRHpY?=
 =?utf-8?B?WVJGWUpwK1ZXNTRhblFIbkhYdGZTaGtJQkhuOGxsY2FLNDd0cjZsOEdLdVRZ?=
 =?utf-8?B?aWViRE9GRUVzRTR0dkxVaE9FK0h6a29lOXFZL3lzZTA5VDY1T3BRS252RXF2?=
 =?utf-8?B?ZTdKTWNrR1JxVFg1M29ZY0ZzY0NRU0tCbXgxTnNwWTVyS2J1WG5Zd1I2S0tI?=
 =?utf-8?B?Sjh5TjFUVGRscG56QlFOaFJZdUlLSGpwWWVzRXV4L1REMWQ4WEdFZnhKUHJI?=
 =?utf-8?B?YXZKcWhZTzFFKzZkSXhreThZUUtOYi8zcDV3cFhtWnpoMmJoUU1mc0lNYUtB?=
 =?utf-8?B?VTJ3UHl0TnNUY1BFYkhrYThlU1Z1NE5aMGRCckJGOVI5UmNqdWZSMElEOUFi?=
 =?utf-8?B?VWdIa2xNS0RTSndFcGpQdlo5L0J0N0RsNHVmTGVibVlhM2ZPVC80MVQxZk5W?=
 =?utf-8?B?OUpGdUtieFRYWmpCWEMzd1ptTTE5emhEZTZCK0hSTDg1a0U3eFJQcGh6RnZi?=
 =?utf-8?B?aTNDdGlUbjFTS29XUkoxM2tMaGRxbWs4YnNjR0RwWU1GbW1WU1llU1gyRGMz?=
 =?utf-8?B?K1ZxaGhtTUVnd1RYZURsQ2NzbUdKTFBOaDg0Q05oRS9FLzVpc0w4WlB5V1di?=
 =?utf-8?B?bUFtSzNXOW02aGg4UlVMNFZOVkovSHE1M1BDYmdZWG55MEsyNUNLdDB3MDhw?=
 =?utf-8?B?eGpCZHB4SUcwOCtpL3RxL0pVbkIrdCtrNXBGcXpmeVFaRE04WUxaTlpqMEJn?=
 =?utf-8?B?ZEU2N0FscU5rK05XdVVTYnBhYkU0UU8rbzNhRk5hZjNsMjBkVi9JVlRHRU1J?=
 =?utf-8?B?WkZ3V1ZaTkYwMytuMk1CQzhFd3NteVowSzlvbFZpRUtDMnkyQXBZQnpyRm82?=
 =?utf-8?B?MytJZDl2elU3ME4zam5ZbGFiNWxVTktYdWpNWUJVNVFMbVdhekNQUEt2MEpz?=
 =?utf-8?B?UHBidldjKy9yNnRaZFFiRjh5RlNrMkR4Vmo2YWx5cjdkY3pGL1hpbFNhV3Q5?=
 =?utf-8?Q?IVhHXuD3NjzllmCR5DHtsLs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(36860700013)(7416014)(376014)(82310400026)(1800799024)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:22:48.8886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255ec8f0-0fcd-4d8a-1572-08de5e5f918f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10636
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,collabora.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.goel@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CDEEA0420
X-Rspamd-Action: no action

Hi Boris,

On 1/21/26 14:52, Boris Brezillon wrote:
> On Wed, 21 Jan 2026 11:49:34 +0000
> Akash Goel <akash.goel@arm.com> wrote:
> 
>> Hi Boris,
>>
>> On 1/9/26 13:08, Boris Brezillon wrote:
>>> From: Akash Goel <akash.goel@arm.com>
>>>
>>> This implementation is losely based on the MSM shrinker, and it's
>>> relying on the drm_gpuvm eviction/validation infrastructure.
>>>
>>> Right now we only support swapout/eviction, but we could add an extra
>>> flag to specify when buffer content doesn't need to be preserved to
>>> avoid the swapout/swapin dance.
>>>
>>> Locking is a bit of a nightmare, but using _trylock() all the way in
>>> the reclaim path seems to make lockdep happy. And yes, we might be
>>> missing opportunities to reclaim when the system is under heavy GPU
>>> load/heavy memory pressure/heavy GPU VM activity, but that's better
>>> than no reclaim at all.
>>>
>>> Signed-off-by: Akash Goel <akash.goel@arm.com>
>>> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>    drivers/gpu/drm/panthor/panthor_device.c |  11 +-
>>>    drivers/gpu/drm/panthor/panthor_device.h |  73 ++++
>>>    drivers/gpu/drm/panthor/panthor_gem.c    | 427 ++++++++++++++++++++++-
>>>    drivers/gpu/drm/panthor/panthor_gem.h    |  67 ++++
>>>    drivers/gpu/drm/panthor/panthor_mmu.c    | 338 +++++++++++++++++-
>>>    drivers/gpu/drm/panthor/panthor_mmu.h    |   8 +
>>>    6 files changed, 901 insertions(+), 23 deletions(-)
>>>    
>>

>>
>>>    
>>>    /**
>>>    
>>> +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
>>> +	struct panthor_vm *vm = NULL;
>>> +	struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +	lockdep_assert_held(&bo->base.gpuva.lock);
>>> +
>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
>>> +		/* We're only supposed to have one vm_bo in the list if we get there. */
>>> +		drm_WARN_ON(&ptdev->base, vm);
>>> +		vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +
>>> +		mutex_lock(&ptdev->reclaim.lock);
>>> +		drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base);
>>> +		if (list_empty(&vm->reclaim.lru_node))
>>> +			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
>>> +		mutex_unlock(&ptdev->reclaim.lock);
>>> +	}
>>> +}
>>> +
>>> +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	struct drm_gpuvm_bo *vm_bo;
>>> +
>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
>>> +		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
>>> +		struct drm_gpuva *va;
>>> +
>>> +		if (!mutex_trylock(&vm->op_lock))
>>> +			return -EDEADLK;
>>> +
>>> +		drm_gpuvm_bo_evict(vm_bo, true);
>>> +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>> +			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
>>> +
>>> +			panthor_vm_lock_region(vm, va->va.addr, va->va.range);
>>> +			panthor_vm_unmap_pages(vm, va->va.addr, va->va.range);
>>
>> On further testing, I ran into a kernel warning issue.
>>
>> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/iommu/io-pgtable-arm.c#L641
>>
>> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/gpu/drm/panthor/panthor_mmu.c#L930
>>
>> Call trace:
>>    __arm_lpae_unmap+0x570/0x5c8 (P)
>>    __arm_lpae_unmap+0x144/0x5c8
>>    __arm_lpae_unmap+0x144/0x5c8
>>    arm_lpae_unmap_pages+0xe8/0x120
>>    panthor_vm_unmap_pages+0x1f0/0x3f8 [panthor]
>>    panthor_vm_evict_bo_mappings_locked+0xf4/0x1d8 [panthor]
>>    panthor_gem_try_evict+0x190/0x7c8 [panthor]
>>    drm_gem_lru_scan+0x388/0x698
>>
>> Following sequence leads to the kernel warnings.
>>
>> - BO is mapped to GPU and is in GPU_MAPPED_PRIVATE state.
>>
>> - Shrinker callback gets invoked and that BO is evicted. As a result BO
>> is moved to UNRECLAIMABLE state.
>>
>> - Userspace accesses the evicted BO and panthor_gem_fault() gets the
>> backing pages again. BO is moved back to GPU_MAPPED_PRIVATE state (even
>> though technically the BO is still in evicted state, both vm_bo->evicted
>> and vma->evicted are TRUE.
>>
>> - Shrinker callback is invoked again and tries to evict the same BO.
>>
>> - panthor_vm_evict_bo_mappings_locked() calls panthor_vm_unmap_pages()
>> and the kernel warnings are emiited as PTEs are already invalid.
> 
> Yep, it looks like the other side of the problem pointed out by Steve:
> CPU mappings can make the buffer reclaimable again, but those are still
> evicted from the VM PoV.
> 
>>
>>
>> Made the following change locally to avoid the warning.
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
>> b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index ffd821b3be46..e0a1dda1675f 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -2344,6 +2344,8 @@ int panthor_vm_evict_bo_mappings_locked(struct
>> panthor_gem_object *bo)
>>                   drm_gpuvm_bo_for_each_va(va, vm_bo) {
>>                           struct panthor_vma *vma = container_of(va,
>> struct panthor_vma, base);
>>
>> +                       if (vma->evicted)
>> +                               continue;
>>                           panthor_vm_lock_region(vm, va->va.addr,
>> va->va.range);
>>                           panthor_vm_unmap_pages(vm, va->va.addr,
>> va->va.range);
>>                           panthor_vm_unlock_region(vm);
>>
>>
>>
>> Do you think we can also update is_gpu_mapped() so that an evicted BO
>> moves to MMAPPED state, instead of GPU_MAPPED_PRIVATE state, on CPU
>> access ?.
>>
>> Not sure if the following change makes sense.
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c
>> b/drivers/gpu/drm/panthor/panthor_gem.c
>> index 6e91c5022d0d..8a8411fed195 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>> @@ -125,6 +125,8 @@ static bool is_gpu_mapped(struct panthor_gem_object *bo,
>>           struct drm_gpuvm_bo *vm_bo;
>>
>>           drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
>> +               if (vm_bo->evicted)
>> +                       continue;
>>                   if (!vm) {
>>                           *state = PANTHOR_GEM_GPU_MAPPED_PRIVATE;
>>                           vm = vm_bo->vm;
>>
>>
>> Please let me know.
> 
> Yep, this looks correct. I'll add that to my list of fixups.
> 

Thanks.

Sorry I have a doubt.

Should we update the panthor_gem_sync() function to ensure pages can't 
get reclaimed whlilst they are being synced ?.

panthor_ioctl_bo_sync() takes a reference on the BO before calling 
panthor_gem_sync(). But I think due to this patch, the backking pages 
can get released in the middle of sync loop.

	sgt = panthor_gem_get_dev_sgt(bo);
	if (IS_ERR(sgt))
		return PTR_ERR(sgt);
	for_each_sgtable_dma_sg(sgt, sgl, count) {
		dma_addr_t paddr = sg_dma_address(sgl);
		size_t len = sg_dma_len(sgl);

		dma_sync_single_for_device();
		dma_sync_single_for_cpu();
	}


Please can you confirm.

Best regards
Akash


> Thanks,
> 
> Boris
