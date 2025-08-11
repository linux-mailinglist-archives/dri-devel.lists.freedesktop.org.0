Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B82B21750
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A1610E315;
	Mon, 11 Aug 2025 21:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u9hxThiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658A210E315;
 Mon, 11 Aug 2025 21:26:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBzo3OO8FskAeoAqSrSDcJ63+O9HwmTAcBiQtrGyX7QfHpdvTsoGhraFX/ySFdo88GASogkM3/oLo0rG83acaZmQ1JQVAf+gdiv4QvUpmenYTlBalNElUAgyHs8ln7fN+QsRnZFNTh7CiaDrls51Bpo318LGH+9GTi3SD0mukb7gFJQHAIU5UXSjN+W8FE2j0H59HOHZtq/zZxEZ2Q7kRoNn/aawUDZ6m1LopN4LGM10+LeGr15falw9c74Tlik5PT1M8esJ41MvhnL6maAUjCw+u8L1tdjo6PcS1UTBwbM3wusX5PfpE9ekfRwxdXCSy2QhkDLwAT4AtEoUQ56mIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cZ65EPinmRxKZ7cqMkjlx4rxENaMS+RhszSd4MNgRQ=;
 b=u0m4iFx5zeQSLD9KL1TH8jEIhDa21CrOLR07enjnAWQ9eQTMweQsGXIB/oOdq3W+5Z2sSUqVWRJN0VMQL1w1cSr8o1Ak2PHj6h2Hjd2PhK0NY2nTmP5TyUadggJ8PlnmIma3tPmU3mC9VRGRAew5vUhpeKrWQMuHkojXK8yCwjl9QmYWU5mV6iMnOml0RvtEtdhAueYXw0bhhhy6f1t4ddH8ueOgD/n8VOua8kwkkfUb86xEBpJMHogGtf6cV/5TNJ+w3mRV+SSJ9dMUQM0xqSjM+OfoJaHauJNc6XGrzf/viITx2vyS1k8gMiEydoDtsZTyupbheuyXfeQGh+iWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cZ65EPinmRxKZ7cqMkjlx4rxENaMS+RhszSd4MNgRQ=;
 b=u9hxThiKOd5jA2Yoa1STm0fFUso6JJeeO3oEbhrbQ/08b07ya3n1YpZaSDblgjShBt7AX1/9nonrF2HV2jvaKHSioAboI207caGo6gaw7gz8HhbGm4MVJoCy71Qb/cymnGcouH/rfnJoIHElgZbVWn2ndYfLyCHNstR5Rky5F9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:26:35 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 21:26:35 +0000
Message-ID: <c399cdf9-ec3b-4162-8175-05b34d9e5042@amd.com>
Date: Mon, 11 Aug 2025 17:26:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
References: <20250726003816.435227-1-mwen@igalia.com>
 <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
 <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
 <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
 <4e94993a-92b3-4584-bfed-468d7606830d@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <4e94993a-92b3-4584-bfed-468d7606830d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::9) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 17555f6c-9d0e-4f91-788e-08ddd91dbfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RExVZm1UU2VmOC9UaEdkTVlwcUYyL2UxZ0FJWnpkaHV6VzFHbmtnYjZIR3Jy?=
 =?utf-8?B?NVhGb0hLeklkWDYyQXppeE9wMERJK25GTTJSOWVxWnA5ZDhvenYwbktyd013?=
 =?utf-8?B?ZWp3bTljSlNhZzBuR0pkSnNkUVpjclR3YU1qYjV4R1kza1QvdDAwN2owRGJB?=
 =?utf-8?B?dWNQY0dhMy9RNkg5U2ZzdExiOXRrTXozNERMMDBWR0xpYlhxWXlNQUpXcjRs?=
 =?utf-8?B?d0N2aURsdlNGYSt5WHo4a1Npd2haMGZMd3B4eWRXR1lKUHNRbXh1MXh1THI4?=
 =?utf-8?B?Nkx5YjN6S3orWmNWalFDU3U5VGpub012MURjSnhMNlZWdWhwcDVnOHdBUkJH?=
 =?utf-8?B?Q2xBdGw5L0VtVHNUK29SR2EzRUpmdFZLUVhObkJVRDZGOGsyNnU3Y2QzUDVX?=
 =?utf-8?B?emJVNFNxTk0xNThtditLbm5wYWg1ekhMbEsvL1NZb2gvNWFxdXhsMXNOcHJp?=
 =?utf-8?B?MWJlYWd6YnIwUHVaMjllaXJDZGt6WW1sUURHWmJ3V1pxaEV4U3pwRUh6L0Ru?=
 =?utf-8?B?MlBXK2VaQ2x6Y3NPWW5VRWlEaE5ZVTE4a003SXBOMnZVZ0MwakEva1pzNnh6?=
 =?utf-8?B?MzhTVElXS29tbnREZ2hZcit5NSs5bC96ZjU2T2JSZ2d6TENNWnh2WXM4dnJ3?=
 =?utf-8?B?QTRUMXFoSXdNZFBPVlVHNHltNnY2bkU5M2VkQmlKYTlkOUhvdEJham0rZWtu?=
 =?utf-8?B?U2kzZkdBUmRoaVVDTmVpaWNTc3BoQzE2ZWxLcXdQemRtQWxRTkZXTGd6a09J?=
 =?utf-8?B?bVNHV0pEcWI2Tk1RUTMwYXB5ZVRlQWFkRlhESDZlSlRPQlpUNWJWVmVNdW82?=
 =?utf-8?B?eG1kK0tKcjFWODdsNzV5anhPZjFoUXhMa3NZYkUrS0FaaDZMdjU0MytXWldD?=
 =?utf-8?B?QmpSK21wa0ZveU8wNEFPQ1ZBbkkrSEVWekNtMWRmOUhOM1NnYmp2N1BXWUxl?=
 =?utf-8?B?UlYyZlVjbk0wRUVUNStuNVVsb1VzRFZhcWRTRU9LSC9pbGNSRE0wM3lGLzds?=
 =?utf-8?B?TWU0WjNlM0oyZHh4Q2dzWEJkWVBZbDBGamJIUFNxS1BHOEs0R2RHdFA5eTY2?=
 =?utf-8?B?ZVM0Q2VwaE93L2JJYXQvazNEcXI1cEZCSVNJUkdKNXV4WEdFTC9pNlFQSjd4?=
 =?utf-8?B?NituQzZSbG9kR2Rtdi9xR1JaTXg1cnU4b2FhM0tYdlowSzRyRlV1YkhUaHZ0?=
 =?utf-8?B?V2l0bmtISG53cXFaQTJUNGQ4WXg0MVRhcXJucUZVMXRWMEZNV005cGl4QVdF?=
 =?utf-8?B?bzdQZW14MHdaYVVWaGdvVWFoaTZlc1VCZ3BVZ3RRYUZodEdSVU42Wml2TzlC?=
 =?utf-8?B?bWZBRFMxM05vLzBZZEhoNFdTeFN6Rm1iaVhpQVgzQzRncHNxY2puS3NUaktn?=
 =?utf-8?B?c0RVY0NGVU5laFZhR1BrU0lhUGk0eXhibGcvcWxSZG5BWVAzcXlqYVdWQmJr?=
 =?utf-8?B?TExOdXNUQ3o5dy93QlhWcTdMUEhhcmtSUjRWcnJCRjJXVnZiQ0F3V1NOMjZJ?=
 =?utf-8?B?QnIyNERHamNXNXZHNnZmK3lXOEIyb1NScXdOSmhqU0gzWU9pMmtnZ285QVcy?=
 =?utf-8?B?TWxIUkowWEJydXNiK0dURzFnRjJrbkxwTzhDaERCWWZpMStEUFJNRXdoSGFa?=
 =?utf-8?B?c1N1TGpYUHJWMXdRbGVpMnFHbXNJRG5GRXEySUxEWnZaaElXTzhtR2hqTlND?=
 =?utf-8?B?cXVVUU13SjZienFmSHJLenA4aEE4T3M0Q3FIUEM3dEV3aC8rN1FIQ3FlSjdo?=
 =?utf-8?B?VnJ0NHR5eGFyV1JwUkp4VXRrRmlydzU0ZnpBdk9mYlNjd1FIeVYxbURmZ3du?=
 =?utf-8?B?N2kyM1R4UWRPQmluU016REVORDkrUzJRanlnWTdZSTMzMHM4Mk5xY3E3UmxR?=
 =?utf-8?B?cGYxYTR5MnZaaDZSeHJhY3U0R2p4UjJaWFpMaGk3WXcyUWdBRFp5NnFiN3hK?=
 =?utf-8?B?WnhMRHNIRmpCbWVxUklFS1RXbE5jdE5NTXo3VitIckhRdDh2MlFoM3NkWXpC?=
 =?utf-8?B?cVl2Q21XUVRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDcrT0lkS010U2l3dVBQaGwra3QrL3UyYzNDbk9Vc3BsQVd4eDEyTzhGV0x2?=
 =?utf-8?B?aG1hS1QxSUx2NzIrYjBpTEFDaUt6YXhmc2pqNmw4S2RUbWlYbElzUHdjV0xy?=
 =?utf-8?B?d0lrdDU1V2NINm16RzZmbStXajlVUUhPYVpRNlJHcVFlRjJQUHl1ZGN4ZGJY?=
 =?utf-8?B?Qkd0YnBlc3g2Q2cyamhGTDJRVlNxM0daTiszSjNmeUtCeDVTQlREd3FNNEF5?=
 =?utf-8?B?aXd3eGlwTnBNVnVFSWJhR3pWYWpJVDZ0QWNLczk5MTkrZndoeTNTajJYeTFx?=
 =?utf-8?B?M1lhUm96b21wb0dXTlJtSGxzQThtUlF0RnducnpMTzEwQnpTb21nN0M4N0Nq?=
 =?utf-8?B?RVhnVHdacnRpVFhEeTJRdWJEanNrbUNPbzBuaXBhRjJEZFhPc2pMVmlORDNh?=
 =?utf-8?B?N3c5N0ExbFNpc0Z5TE15Vi9HVmwrcXZsSmZDUEd0S0dTU2x4QXJPemRFd1ZX?=
 =?utf-8?B?SmtPMWRWR21kdGQ0bnR2S2xlUFduTjl2V1hOanIyMzJFczZtTmFXNGFpa2pt?=
 =?utf-8?B?Y3A2R0FzbmhUQ0pjYzdtUzR0VDg1RDIyZG9VNEJDQ2NSaStOWGtVdHZYaWlq?=
 =?utf-8?B?ZlVhV3FsZlFVdlh2Y0xRSUtsdkh3TEU2Rjg3TnNNdUhXQXpIaWRmSUs2bDZx?=
 =?utf-8?B?dUFBRm5EeFVxUTI5Z3ZtUjQ4TExrRE1oNGgxNWVPRTZBbzNtQXJYcUFnUjV0?=
 =?utf-8?B?Q2QzaXJDZUNxSWFUaEZ4VUZOdG9CVnUwaDl6aEhGalZHMUphVTNVcEZCZFF1?=
 =?utf-8?B?TGtZTFp0ZG41SGRLaElNQzFBV0xFK0xLSm5naDJRRTIxdzZkbTVGaWhoWGs0?=
 =?utf-8?B?ZW1MZmROOHNLN080MEtuL2hXRXEyZ3I1ZUZlbHlxNFpIVi9xRG0vS3JrZzZK?=
 =?utf-8?B?ZGpveGo4V3h1WTNFL21vd3E5YWVOWm9hcmZvQkZHQy9NMC9lcXd5UElQai94?=
 =?utf-8?B?VHBWNTdiazVTQVM1N0ZvM0FLL3lLSHNCUE1VcnVFTHRLMkhXWmR5UlZxSVhV?=
 =?utf-8?B?Z044bHAyb09URHEwY2ZTWWJDeXZ3bjhpallpVUVoc1kwbkNzOFFvTHVZdUlR?=
 =?utf-8?B?QXEvYmdkRG1vWCtRdHJ6SUNjOVJEdmNuVk5qTGZGbyt5dXoxcW9nUWZkKytz?=
 =?utf-8?B?U0d5VzZPUjhIamJhdDNxem5PLys1S0VoQ1NRZXJKT3BQd3dJd254dlNWRkpk?=
 =?utf-8?B?TFVtRFVKKzdoQVBjS2k5LzE4bFI3MGJBbndMMGNqcWhzcDZjR0xDM2Q2WVNH?=
 =?utf-8?B?czdrWXdkR05LQ0l2OTRWR0ZHbnBkSnZSOHY1M2hoaTI4RXM2d2JKQUU5Qllq?=
 =?utf-8?B?Vkc2K0ZsUmRLS0c2dVAvTGJrZWFlQk1XMVlCaTlWL3ZJc3p3dnJRRnYyeGZz?=
 =?utf-8?B?cDBXNDgraU0wY0pBOGxka0VlQjZVK1BiS2srMnNKek94dVV4R3VYbzV4bTNy?=
 =?utf-8?B?ZFlieDgxZDBBalcvMngrczg2SXNBSnRUM0FCaXZIQ0l5SVAySmViN1IvMVJI?=
 =?utf-8?B?L0N6aXRESkt1RWFTbVh0RExFbkNXYXhZRkhtQ3lRQzZNSXJSd0JWNkhjSDcz?=
 =?utf-8?B?RGI2QlpidkljT0p2ZHVoVHZIY3FUS3c0YWVXUTRTVFV5Wm53MS9nbVp0Mk1a?=
 =?utf-8?B?WktVWVRWM0NGUkdndmFUTmxBR0hIODRrMjh6ZkFQNHkzWGV0MTk2ZWVCTlpv?=
 =?utf-8?B?SXZYQjJlU1ZCc0pMclVPQUJzRmJ2Q3BCem95eWZWUXI1S3lES0ZXcVA1ZkFX?=
 =?utf-8?B?SjVvWFNHaG9makorV3dTWTZIcVZtTlpyNml5WEt0a1FjQkFRRzdUL3MvNzRs?=
 =?utf-8?B?eWY5b1J4WFR3UGZSSzNSck9QcnhZcnIxUlFNbTZoRVRMeGt5bWxKeEJLN3ZY?=
 =?utf-8?B?c2R3YjZLN1NTSVNURG9rZGdqUlJiS2pqNGcyNGlqYUROMEpNNFdiUnl2Z0hm?=
 =?utf-8?B?VzRkU0FNUm5rT0sySVlKc1RDejV0Wm5FTEhJVUEyektBWnJQV21mWS81NlJL?=
 =?utf-8?B?RFF5ektUM3RiaHNqQmJ6UTc1RUtsNzZydkx5L0JyTWM5T2JjWXJDREFTQVhH?=
 =?utf-8?B?Z0pPRXEwNkoyV1JHOUlVMEdnRVlXdjY4ZUdXb2N4c2kvR0gwci9pbDBEMGFa?=
 =?utf-8?Q?RyIX3+PR/10pU4NZTHlVqjWt+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17555f6c-9d0e-4f91-788e-08ddd91dbfb2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:26:35.2299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQIdkpJiZINt2rKocK16O0BBApEUfb9Yd8SuM2IX0Scb9RSBRbHsS87QgWlz/WlkOfX0veH5IweM9Dzx7WrxQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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



On 2025-08-11 17:09, Limonciello, Mario wrote:
> On 8/11/25 4:08 PM, Hung, Alex wrote:
>> Melissa,
>>
>> The patchset passed promotion and CI.
>>
>> However, since our DC code is shared with the other OS, calling drm_* 
>> functions in DC won't work for us. For example, calling 
>> dc_edid_copy_edid_to_sink from dc/link/link_detection.c in patch 14.
>>
>> I don't have a good way to handle it. Does it make sense not to touch DC 
>> code for now?
> 
> What about if we have a set of compatibility macros in DC code?
> 
> Something like this:
> 
> #ifndef drm_dbg
> #define drm_dbg ....
> #endif

DC should stay OS-agnostic. No DRM concepts in DC please.

Why the need to change dc_edid_is_same_edid?

I'll comment directly on the patch.

Harry

>>
>> On 8/11/25 13:40, Melissa Wen wrote:
>>>
>>>
>>> On 28/07/2025 20:29, Alex Hung wrote:
>>>> Thanks. I will send v6 to promotion test.
>>> Hi Alex,
>>>
>>> Any news about this round of tests?
>>>
>>> BR,
>>>
>>> Melissa
>>>
>>>>
>>>> On 7/25/25 18:33, Melissa Wen wrote:
>>>>> Hi,
>>>>>
>>>>> Siqueira and I have been working on a solution to reduce the usage of
>>>>> drm_edid_raw in the AMD display driver, since the current guideline in
>>>>> the DRM subsystem is to stop handling raw edid data in driver-specific
>>>>> implementation and use opaque `drm_edid` object with common-code
>>>>> helpers.
>>>>>
>>>>> To keep DC as an OS-agnostic component, we create a mid layer that
>>>>> isolates `drm_edid` helpers called in the DC code, while allowing other
>>>>> OSes to implement their specific implementation.
>>>>>
>>>>> This work is an extension of [1].
>>>>>
>>>>> - Patch 1 addresses a possible leak added by previous migration to
>>>>>    drm_edid.
>>>>> - Patch 2 allocates a temporary drm_edid from raw edid for parsing.
>>>>> - Patches 3-7 use common-code, drm_edid helpers to parse edid
>>>>>    capabilities instead of driver-specific solutions. For this, patch 4
>>>>>    introduces a new helper that gets monitor name from drm_edid.
>>>>> - Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
>>>>>    code in the DC shared code
>>>>> - Patch 10 creates a mid layer to make DC embraces different ways of
>>>>>    handling EDID by platforms.
>>>>> - Patch 11 move open-coded management of raw EDID data to the mid
>>>>>    layer created before.
>>>>> - Patch 12 introduces a helper that compares EDIDs from two drm_edids.
>>>>> - Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
>>>>>    free `drm_edid`.
>>>>> - Patch 14 switch dc_edid to drm_edid across the driver in a way that
>>>>>    the DC shared code is little affected by Linux specific stuff.
>>>>>
>>>>> [v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1- 
>>>>> mwen@igalia.com/
>>>>> Changes:
>>>>> - fix broken approach to get monitor name from eld (Jani)
>>>>>    - I introduced a new helper that gets monitor name from drm_edid
>>>>> - rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
>>>>> - add NULL edid checks (Jani)
>>>>> - fix mishandling of product_id.manufacturer_name (Michel)
>>>>>    - I directly set it to manufacturer_id since sparse didn't complain.
>>>>> - add Mario's r-b in the first fix patch and fix commit msg typo.
>>>>>
>>>>> [v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1- 
>>>>> mwen@igalia.com/
>>>>> Changes:
>>>>> - kernel-doc and commit msg fixes (Jani)
>>>>> - use drm_edid_legacy_init instead of open coded (Jani)
>>>>> - place drm_edid new func into the right section (Jani)
>>>>> - paramenter names fix (Jani)
>>>>> - add Jani's r-b to the patch 12
>>>>> - remove unnecessary include (Jani)
>>>>> - call dc_edid_sink_edid_free in link_detection, instead of 
>>>>> drm_edid_free
>>>>> - rebase on top of asdn
>>>>>
>>>>> [v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1- 
>>>>> mwen@igalia.com/
>>>>> Changes:
>>>>> - rebase to asdn
>>>>> - some kernel-doc fixes
>>>>> - move some changes to the right commit
>>>>>
>>>>> [v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1- 
>>>>> mwen@igalia.com/
>>>>> Changes:
>>>>> - fix comments and commit messages (Mario)
>>>>> - remove unnecessary drm_edid dup and fix mem leak (Mario)
>>>>> - add Mario's rb to patches 5-7
>>>>>
>>>>> [v5] https://lore.kernel.org/amd-gfx/20250618152216.948406-1- 
>>>>> mwen@igalia.com/
>>>>> Changes:
>>>>> - fix NULL pointer dereference (Alex H.) with the same approach 
>>>>> proposed
>>>>>    by 7c3be3ce3dfae
>>>>>
>>>>> --->
>>>>> There are three specific points where we still use drm_edid_raw() in 
>>>>> the
>>>>> driver:
>>>>> 1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
>>>>>     drm_dp_dpcd_write(), that AFAIK there is no common code solution 
>>>>> yet;
>>>>> 2. open-coded connectivity log for dc link detection, that maybe can be
>>>>>     moved to drm (?);
>>>>> 3. open-coded parser that I suspect is a lot of duplicated code, but
>>>>>     needs careful examining.
>>>>>
>>>>> I suggest to address those points in a next phase for regression 
>>>>> control.
>>>>>
>>>>> [1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1- 
>>>>> mwen@igalia.com/
>>>>>
>>>>> Let me know yours thoughts!
>>>>>
>>>>> Melissa
>>>>>
>>>>> Melissa Wen (12):
>>>>>    drm/amd/display: make sure drm_edid stored in aconnector doesn't 
>>>>> leak
>>>>>    drm/amd/display: start using drm_edid helpers to parse EDID caps
>>>>>    drm/amd/display: use drm_edid_product_id for parsing EDID product 
>>>>> info
>>>>>    drm/edid: introduce a helper that gets monitor name from drm_edid
>>>>>    drm/amd/display: get panel id with drm_edid helper
>>>>>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>>>>>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>>>>>    drm/amd/display: simplify dm_helpers_parse_edid_caps signature
>>>>>    drm/amd/display: change DC functions to accept private types for 
>>>>> edid
>>>>>    drm/edid: introduce a helper that compares edid data from two 
>>>>> drm_edid
>>>>>    drm/amd/display: add drm_edid to dc_sink
>>>>>    drm/amd/display: move dc_sink from dc_edid to drm_edid
>>>>>
>>>>> Rodrigo Siqueira (2):
>>>>>    drm/amd/display: add a mid-layer file to handle EDID in DC
>>>>>    drm/amd/display: create a function to fill dc_sink with edid data
>>>>>
>>>>>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
>>>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
>>>>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 109 ++++++ 
>>>>> +-----------
>>>>>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
>>>>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  39 +++++++
>>>>>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
>>>>>   .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
>>>>>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
>>>>>   drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
>>>>>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
>>>>>   drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
>>>>>   .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
>>>>>   .../drm/amd/display/dc/link/link_detection.h  |   9 +-
>>>>>   drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
>>>>>   drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>>>>>   drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
>>>>>   include/drm/drm_edid.h                        |  10 +-
>>>>>   17 files changed, 199 insertions(+), 164 deletions(-)
>>>>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>>>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>>>>
>>>>
>>>
>>
> 

