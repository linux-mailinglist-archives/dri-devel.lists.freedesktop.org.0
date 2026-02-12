Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMi8KW5zjWlk2wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:30:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411A12AB89
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8B610E6E3;
	Thu, 12 Feb 2026 06:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gW7MWNaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3199E10E6E3;
 Thu, 12 Feb 2026 06:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP41JL4MjhYUIo0e+YsSSDJt+QlkLZAX30Q8BEfgCbQp5w1YgWacMVpWTN/Rey/KF58EDA8gyZuOFiq+bSG82lDnpSlV5rKGdMy/yVhzhvkbWc0aOZPzRsya0nOoVCrihfbHiNBPYCYIBZF+cHzuc9kNhEJxGQSR33E6GjQNdepEBacf987XB6iwKBDoNoTpck2lxPehXnnURBUVoVpVoD9bq/8kgbpgQiJOvUWRd1zxyKfG4azP2SMl7a27Q1gYw+OROQiee0ci+3htQhvM6OnlJJT3iGLedn2sFOQbuI7n/mc/FriP6BlZX1XBlxW5bDG2kY5AoZ4PFikxJho/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W0nJYkWMBGIQOpk8qWFt7tnI6CZkkLsJmWJYTt0iy8=;
 b=R+P5bADZaAj/ybdlJuHCx7fd0c7YDs+U2ORcBT1euXJkP2uMisMlOSVjBVl9AWuJ2vAK6rNlIef+UJnLg1g8S9kvpasF0XtO+ikWuCvaHu5mtNgTqXMyV/cAHSYF3r+OF8G3SwY3ucUQvYNLYdUYLRNPQaxI5gnUXV9nc/HpPLezAommfzr+qYEdakDk/ajOQockM94doYJ1/UYlNV5hlCLEbJp2JiiaEGn2ioH4mdXlIxMQwoWXwoZ1oThtvfAegO2Hi4HPYGr+9UqPxN/lGDr+NF1CLrWecsys6+aSpl2otax/i1ppH1MgtoGnOcJxOVq2e5TnHx+0oY3Lscn62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W0nJYkWMBGIQOpk8qWFt7tnI6CZkkLsJmWJYTt0iy8=;
 b=gW7MWNaf4P0tHmYoGttSJcrBFWp2EcFxzGVf6M7erZjk3u+ts6dvZ3ryOlYGED5uazkEIeMBHwSG9k/Ff/cN1nwRHee87GIFtsgPEDm8A540NY/Nh6QbfirGYu/wn8BYQlNqfwknfZXuE5QdsqV8pD9iSPlZx5XotKtsUo5IvPSvtZSLrN/rz1eRSlfQJ5aogKHl9MAsFA023yQKu3nTJNyDOpEnyvDlnmUWMUaD0r/ZAmVojY5H5G/SwJuu4CIoHytBJR2Pfsbn3bAOOD09pl/vQwsG2pIMRxcRL4FoFzfES55QC5e9cgnGOaAw+NEhDwx3sKDIMQqcHqfLhypjjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:29:57 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:57 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 12 Feb 2026 15:28:08 +0900
Subject: [PATCH 6/7] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-cmdq-continuation-v1-6-73079ded55e6@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 0690cbe0-284d-4810-de28-08de6a002413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUpmUnJidGgwM1pSVCtkUmhhczlKMGRBc1dJK2NGZDRUalp0WnlhQlA5QnMr?=
 =?utf-8?B?RzBTdTNlKzQ3TmNnSzFKTllrZlBKcHFMK0pCQmgwUjZYOVdSaVE1eXdvazZI?=
 =?utf-8?B?cGw5Sy9BMFNZallEeVcwNXFmTzVmdjZXQVBPUktPOVk5Q0dvVnBqYzFXZnhZ?=
 =?utf-8?B?V1gyUk1ZRGtoZzZPeVRqTXdVM3VyMllUQVBNNzlmZUJHcmVIZVBOdlZTQnBG?=
 =?utf-8?B?M1dFd2pIelg1TDBaNVNucExzc0NFQlRmMy90WU9hV2hCYkpmVVBPMnlMZDUw?=
 =?utf-8?B?UmhqbE05RUpEclRvOVZheGJJQldZN0RyUXZFVFBUZ05zSllZNVBSaTFlOUd4?=
 =?utf-8?B?aHBvWGo4WEdKL1kzdWM0YURWQ2N0cVQ3UEVaaUduVy9NdWl2Yjh5WmlzU1ZE?=
 =?utf-8?B?bUo3Qi9GN0dWVHNLZDNQN29IUzk3SFZpZWlLQ3BUUXR5SWprYTRlejFvTWV4?=
 =?utf-8?B?bFNBQ2tnRmxyQnIxdkZKSlFTZHEyK3lJYWdPSk0xNnQzUEphb3BMdlEzRXY5?=
 =?utf-8?B?a01RV0N0S3FFU2U3bWlzMnpXUlhIbytPZkVta2F3Y0JSa1RjNmNvSld1RmtN?=
 =?utf-8?B?MVlSN1FCTmdadTNKaGUwVWFlUlpYeHhMNmtRQU9ueUtFbUd3ZmZPOVhZU1NV?=
 =?utf-8?B?Qk9WWTgycUNuS01DV0VqblFZNklkNUlCSWdsYzV3QS9tN25JVGFZWVE5WVZt?=
 =?utf-8?B?TDVkK0tzbFllQmp6SkFUZmlDdlljL25MVmtKRnlUaUp1Z05GNTJvQngwdDF6?=
 =?utf-8?B?c2cvRzlNdTlvUzZDUll6emJCZFRqMDFJcnMzYXZVcnFoYUdRQlVIT2hZakgv?=
 =?utf-8?B?eEl5WFFRTk0zY29vT0pUdmg4NHhvQmdManpRVmJvWW9vUXo0SngyY1kwcldr?=
 =?utf-8?B?d0pWQ0F5aEE2MzJOSnlmNDRoYkRYV0M0L0tNclVSQnlRK1IvcmxyNUpaUjZp?=
 =?utf-8?B?eTVLak5zeSs5T0NvZzRFQTFhUUFaMWk0TkF2MFZpNXN6NE5oeng0UmdaMGtY?=
 =?utf-8?B?MHQ1VTdJZjVDQXBmRk5LN1JaVmxOd3d3bnJPVkkwUE1XQVJTVnRUMzJWVW1i?=
 =?utf-8?B?T0dpdkJoM3V5QlluMUxZK282QUdkbUQweGx5ajM5WlE5TnUzSDVUYnU0aGxJ?=
 =?utf-8?B?ZmtscUNraW1BVGc3R3NYNk5ONysydytwRUZ1aDJwWTZpQnA0S21VTHNESEtG?=
 =?utf-8?B?SGpJTGwrUnlsenRJMVpNTDRkaVZDUTY2MzZ2ZlBqQXV4bkpyT3BEbG01Ty9z?=
 =?utf-8?B?UzIxaTVQUG5Ib0dLL0c3bFBoTXlXdTNiSEY5OXVTdkd5NXd0Z3B4NGZXeC92?=
 =?utf-8?B?aldyTmNaZlB0OU4rOG9aa1B1WmhJd1poUEJ1QXMzb0pJNm0rYUZEbXR3L0Q5?=
 =?utf-8?B?SkpVSkluNG5LNHRNVE8vOTdjSmhRZFYxNVdwNE1MMForOGczWWpxMG1QcWJa?=
 =?utf-8?B?NHpEalJ4d0hYSkNsb0xLSVVxU3NLdHhBaE5IcmlIVXpoT2wxbTNRTFVqMnIx?=
 =?utf-8?B?dFBGbVI1UUE0aVlXazc0b3FJVWZTMlNyQmlIc2lCWnZIZEh0R21ocnFGVVJW?=
 =?utf-8?B?Q0NMLzR0WEZ5L1R4RVlyTUhlWmMyMy84UUxCRG5IZHB2NHh5YzhkTDlCandu?=
 =?utf-8?B?azFrazFaN0NETTNqRXE5UThZUmF4ZkxTbjRrYWNCQnZrUmluZi85Yk8yVXli?=
 =?utf-8?B?RW1xSmwwYVE4OEM5K0V0WHgwLzFlMTFOTXVJUU40QW9udnNQWkQ3dmhOWm4z?=
 =?utf-8?B?cUd6N0h2aWxaa1RKL1FTenNVMStBY29iQVpZeVdPM3E3RzdIMmMxOTRuRHFa?=
 =?utf-8?B?OUZNaTY5VXd1NFhaeTdDWVd4K05FQXppTWN6bndGK1ZmQnBhdkdIUmxSTys0?=
 =?utf-8?B?Qnc1RWxDNHQ5OEI4OWJmNDcwSWx5OVlmSzVOUzBUVklNOUtLNHhGTEVScnJ6?=
 =?utf-8?B?NU81dXZnWTFFeThmbVhMNUZXcjlZRnpjNXRvOWNpSHFtbFlhV1Q2ZTZkUDRU?=
 =?utf-8?B?b2cyeTdMTjlIcmxQalpUZG1MMnpmNVdMcWJiZEwwd1hlK1VYQXdIRjBCNjE4?=
 =?utf-8?B?M0JOVUlJbnQ0M05NMW8wTmpndFpQZStyZkxJWDFWTWRHMXZCcm04c2NiSDR4?=
 =?utf-8?Q?Kga8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhJOUlkRXltTlJQcTFTVUtDdXZDZTdFM1IzZ3dsaUpiNmEwaVJtcGtBT3FH?=
 =?utf-8?B?a0tJY1JrUFZFZEpuSnl0ZG5IZG5KeVhSNnFheDlOWlIxbDMzSjMwVFM5MytM?=
 =?utf-8?B?VGtBYy9KWHl0ZFZ6a0d1RUpVOE5QdGxwLzRjRnhMMUEvblk1RHFjUGVKRU9O?=
 =?utf-8?B?dnBzQUdnaHRtV2JIRE43cnV2TExYemd0cGFmQTY5bEtISUtPcUlmQ01sK091?=
 =?utf-8?B?cHVQVjd6NkF2Q2M2ejFPUXhCeFcyVFRWb3J3eW42dXFSRWVhZGlGeUk3eGZj?=
 =?utf-8?B?SDFsbHJXRW1JZWsyK1RDTmllV2FJdnJIL0lVQUQ4UlhFVk5ROFV0eWR6Zm1r?=
 =?utf-8?B?RFdwZ3RJcVJYNVYxNHVnaTBIcnpoY0FrWjFIaC93MGM3UmtUN2taMFU2SUk2?=
 =?utf-8?B?VGNPOWEvK0FaZTRNK1ZUazhZSzg3NmwxbTRUNXNwYTZqT3RUUm11eVhCd0lG?=
 =?utf-8?B?ME5SWk9CMjhHdmd5eGJFL2ZudmU0SEtSODRFcWpaaDF5bGJiR01FZlk3aUVq?=
 =?utf-8?B?d1V6aTdQakg1YjlGSVFUejUzK1I2YS9vVkp5czlyRDFaWWZHclZxTGhmb1FT?=
 =?utf-8?B?cTlzUXZuOXNLTmxYck1hc09oUWdzSWF4Y3VOQ0p1K2NtQy9sZE5wOWJSWUhh?=
 =?utf-8?B?M3NZVzFPUERjL1JMWlc0dTlMeVVrNEpTVDEyUC93Q3NrYXhveXRkTXh3cUhx?=
 =?utf-8?B?cGVDd2QxWlNLdnlJSkl2eFZIOEhpZHh2UUc3N1dnR1ErQUpsazJrLzQyeXA3?=
 =?utf-8?B?M1VSQkFkUXVTcjFWak9VSkFSdk1sdTJBWWpJMnd6R2VmNkxtQnRHZHJMM1FI?=
 =?utf-8?B?KzV0WGxmMFBUamtFM08vZjQwdm9LVlp1UWRjN3paZFlURXJ0MlpackNRSDJx?=
 =?utf-8?B?a2lTQkhPRW9XcG51eXFNRXlObFF6TElzQzA1ZmUvakhscmdlR2xaRUF6MVQz?=
 =?utf-8?B?Q1VOaHd6RmVsMm05YTdObnlZemowY2FMWS9Gc0IxZnJLRnlHcWg0NzJmTVFJ?=
 =?utf-8?B?Z004YnIvOGQxL2sxM3VnL2duaDI2SDhUZmZ2cHJwRFBQVFEzQVpqemRyS2RV?=
 =?utf-8?B?TGlGUkQ1Mk1EUVZxMkg0Qzg5L3ZTamdSbTJpR3lxeTFFaXF1RzlPNnM5VVRK?=
 =?utf-8?B?UUxSWFZuT2JJZ0xvWTRtcTZIdlJITVE0SDFBZ1Vpa3FWRWYyTGFOUi9oT254?=
 =?utf-8?B?dS8zTTk3OWZEYmw3ekJFbVliYUZXZUlrTTJSeVNkT1htbVcvdCtsb0JLQUZ2?=
 =?utf-8?B?ZFZsSnpBQVhsblFEaGplYlFRVElHMVVVaFhEa0xyMXdGbEJUT0pCenptZ1dY?=
 =?utf-8?B?OTkwSVhJWUJZSjNQODNHUHM2NlNJTTdDbnc3TmIySHhPMHcycnBmemtTTGtv?=
 =?utf-8?B?L1ErY0x0dXl5dEZ1dGlIN2VFKzVIbk9EVFpMSFQzcDkyYVJhamJXeWNRaXpO?=
 =?utf-8?B?Y1RJM3ZkN3R6VytCbXhkcjVOQ0ZSTG9jTk1zdHVlWjlXbHpjNzRuVmZhOHZ0?=
 =?utf-8?B?clBtRHRSS29IYU54OU5TYXQ5QXB6dGlDVzN2U20vaDN6SHF0NXY3a3NQQ3dn?=
 =?utf-8?B?U3lBT1ptUGxOdEREMmRLNTg3KzA5MjlNVzd6YnpUeG1GUHpMM2E4SGpWK1A0?=
 =?utf-8?B?Y2pxV1FoV2w3N2ROUUY3b3hwbEN0bE1XVTlhc3Z4RXRrNGk5UEJvT0Q0QXJ4?=
 =?utf-8?B?RVgyUlUxdmhXWHE2aSszdUZhS21uZzM1V1Q5Z0s5MndkbDlINUd5UTVVaEJB?=
 =?utf-8?B?T1k4Q1JFdzVNQWpGRXVuOGU0RDlMZXZ0R29SaTE0ZWpSSUtqM2VuN0EvblM0?=
 =?utf-8?B?SExYZktuc3J4RnNTcGFEeVRxRXhGczU5SDdIcUlFQUNiNldxNjVwVytLMjVR?=
 =?utf-8?B?OUFxRHlpK3pYaHA5bFhpYjQva040M2xrUXJwNmlWeTN4b01sQlFVMlBCMmE5?=
 =?utf-8?B?ZzNXQ0pkcVNLdlhVc0NKS1JUYXZnRzRMZEhEaW80MjhVVjVycXBaY2RRNmhK?=
 =?utf-8?B?YWRBTVlsSkZlUXZCRkt5OXc2R08zdmx0SU4zVWpaZ21KT3U1cTVSRWV4cE5Z?=
 =?utf-8?B?RlFPTEhubzN3OVVMSDV6TW1EZGUyR053WVJmSm44WGpROU1hclI1QkhsWHhB?=
 =?utf-8?B?Yi9ZT25WekRFYjRvemhwYWZmYnNZWCtUMklOSkhGM1d1WG5ZekJYYkVTSTNi?=
 =?utf-8?B?d2tiRzl5WnRRVWRJZGlyTUQ1U2Zvd2RGQ3lhRmIwSGtOZnQ2SFVEd3VzTHc1?=
 =?utf-8?B?MTdGbW9QME1leUJuOU45endoaDcwZTV6Q3JsTDNTdDFuaDNIMzJacURHWTN5?=
 =?utf-8?B?eUdYY0hWNlZTSDEvVXM5Q3BiYjF3SXpBYWJqN3hFbmNxcng1NTVBdWhvTEQr?=
 =?utf-8?Q?g+aPsmWJ47VNBOJkDVsVBjYoy8kQSa4rt4tUkoSTKFO9A?=
X-MS-Exchange-AntiSpam-MessageData-1: 7J7CLteIB+560w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0690cbe0-284d-4810-de28-08de6a002413
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:57.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRpxfo6gwhIIvj9/11ugcSSMMhEiE7tUsS/2VkNtBigZ/YIBB6rgcxuluzA59iOsf0CFAnKO0i+9gnu3vM5BjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,self.data:url];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 3411A12AB89
X-Rspamd-Action: no action

Splits large RPCs if necessary and sends the remaining parts using
continuation records. RPCs that do not need continuation records
continue to write directly into the command buffer. Ones that do write
into a staging buffer first, so there is one copy.

Continuation record for receive is not necessary to support at the
moment because those replies do not need to be read and are currently
drained by retrying `receive_msg` on ERANGE.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |  47 ++++++++++++-
 drivers/gpu/nova-core/gsp/commands.rs | 124 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs       |   5 ++
 3 files changed, 173 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3e9f88eec7cc..c24d813fc587 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -29,6 +29,10 @@
 use crate::{
     driver::Bar0,
     gsp::{
+        commands::{
+            ContinuationRecord,
+            WrappingCommand, //
+        },
         fw::{
             GspMsgElement,
             MsgFunction,
@@ -524,7 +528,7 @@ fn command_size<M>(command: &M) -> usize
         size_of::<M::Command>() + command.variable_payload_len()
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
     ///
@@ -533,13 +537,13 @@ fn command_size<M>(command: &M) -> usize
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: &Bar0, command: &M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = Self::command_size(&command);
+        let command_size = Self::command_size(command);
         let dst = self.gsp_mem.allocate_command_with_timeout(command_size)?;
 
         // Extract area for the command itself. The GSP message header and the command header
@@ -590,6 +594,43 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
     }
 
+    fn send_continuation_record(&mut self, bar: &Bar0, cont: &ContinuationRecord<'_>) -> Result {
+        self.send_single_command(bar, cont)
+    }
+
+    /// Sends `command` to the GSP.
+    ///
+    /// The command may be split into multiple messages if it is large.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp,
+        Error: From<M::InitError>,
+    {
+        let msg_max_size = MSGQ_MSG_SIZE_MAX - size_of::<GspMsgElement>();
+        let mut wrapped = WrappingCommand::new(command, msg_max_size)?;
+
+        self.send_single_command(bar, &wrapped)?;
+
+        while let Some(continuation) = wrapped.next_continuation_record() {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: send continuation: size=0x{:x}\n",
+                Self::command_size(&continuation),
+            );
+            self.send_continuation_record(bar, &continuation)?;
+        }
+
+        Ok(())
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c8430a076269..99603880d56f 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -242,3 +242,127 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticIn
         }
     }
 }
+
+#[derive(Zeroable)]
+pub(crate) struct Empty {}
+
+// SAFETY: `Empty` is a zero-sized type with no bytes, therefore it trivially has no uninitialized
+// bytes.
+unsafe impl AsBytes for Empty {}
+
+// SAFETY: `Empty` is a zero-sized type with no bytes, therefore it trivially has no uninitialized
+// bytes.
+unsafe impl FromBytes for Empty {}
+
+/// The `ContinuationRecord` command.
+pub(crate) struct ContinuationRecord<'a> {
+    data: &'a [u8],
+}
+
+impl<'a> ContinuationRecord<'a> {
+    /// Creates a new `ContinuationRecord` command with the given data.
+    pub(crate) fn new(data: &'a [u8]) -> Self {
+        Self { data }
+    }
+}
+
+impl<'a> CommandToGsp for ContinuationRecord<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
+    type Command = Empty;
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        Empty::init_zeroed()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.data.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(self.data)
+    }
+}
+
+/// Wrapper that splits a command across continuation records if needed.
+pub(crate) struct WrappingCommand<C: CommandToGsp> {
+    inner: C,
+    offset: usize,
+    max_size: usize,
+    staging: KVVec<u8>,
+}
+
+impl<C: CommandToGsp> WrappingCommand<C>
+where
+    Error: From<C::InitError>,
+{
+    /// Creates a new `WrappingCommand` that wraps `inner`, splitting it into
+    /// multiple messages if its size exceeds `max_size`.
+    pub(crate) fn new(inner: C, max_size: usize) -> Result<Self> {
+        let payload_len = inner.variable_payload_len();
+        let command_size = size_of::<C::Command>() + payload_len;
+        let (offset, staging) = if command_size > max_size {
+            let mut staging = KVVec::<u8>::from_elem(0u8, payload_len, GFP_KERNEL)?;
+            let mut sbuffer = SBufferIter::new_writer([staging.as_mut_slice(), &mut []]);
+            inner.init_variable_payload(&mut sbuffer)?;
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+            drop(sbuffer);
+
+            (max_size - size_of::<C::Command>(), staging)
+        } else {
+            (0, KVVec::new())
+        };
+        Ok(Self {
+            inner,
+            offset,
+            max_size,
+            staging,
+        })
+    }
+
+    pub(crate) fn next_continuation_record(&mut self) -> Option<ContinuationRecord<'_>> {
+        let remaining = self.staging.len() - self.offset;
+        if remaining > 0 {
+            let chunk_size = remaining.min(self.max_size);
+            let record = ContinuationRecord::new(
+                &self.staging.as_slice()[self.offset..(self.offset + chunk_size)],
+            );
+            self.offset += chunk_size;
+            Some(record)
+        } else {
+            None
+        }
+    }
+}
+
+impl<C: CommandToGsp> CommandToGsp for WrappingCommand<C> {
+    const FUNCTION: MsgFunction = C::FUNCTION;
+    type Command = C::Command;
+    type InitError = C::InitError;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        self.inner.init()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.inner
+            .variable_payload_len()
+            .min(self.max_size - size_of::<C::Command>())
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        if self.staging.is_empty() {
+            self.inner.init_variable_payload(dst)
+        } else {
+            dst.write_all(&self.staging.as_slice()[..self.variable_payload_len()])
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5b96f5e622a4..5ceb070aa0d7 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -199,6 +199,7 @@ pub(crate) enum MsgFunction {
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
     AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
     BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    ContinuationRecord = bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
     GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
@@ -234,6 +235,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
             MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
             MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
+            MsgFunction::ContinuationRecord => write!(f, "CONTINUATION_RECORD"),
             MsgFunction::Free => write!(f, "FREE"),
             MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
             MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
@@ -273,6 +275,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
             bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD => {
+                Ok(MsgFunction::ContinuationRecord)
+            }
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),

-- 
2.53.0

