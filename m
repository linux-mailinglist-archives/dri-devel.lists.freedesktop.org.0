Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA74AEE5F7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 19:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936D310E4B2;
	Mon, 30 Jun 2025 17:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BICIHqHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8210E056;
 Mon, 30 Jun 2025 17:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEudRrnQEiKD+YW0ilab9W2HZ1q8NhLeD9thYPhHjEIG33Dv8g+t7wCQlfHXHdtkwiOdbu4cGyZNo61CJzVq5eqiH3aDfb3fQoCV7gm/3fxKwiVIpZ8mbxvoGANfyZBwV/xfDlqn795bj9ojHCDEMzSAEOsaNp8wBLMoqEte+BKM3Z/QklZ14zzLjcauvcQtvJm4pAUOUvysJDRXJ8NsRYphBdgDyJTLRw+uNyGMUFyYrDgLEb7prycaIf+Gy0EV+AjRkxPcgNdD0/rmiyEueb7P+cawS1kr1H/lywn3iDVz3/hmKafat15db1nSFbN2y4UUEB5hVasZvIP7xLjKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KojP1ti9imOql4Yr5Vn2D2+CO1m2eib9J/PY0ouhSXc=;
 b=jHmYmoX8icF9YoN1bhVDdw3dIsuo7C1oSg+oPZ8clw7IlMkZgDegiNKCjt1hfXqo27Ew9Y8oykF91KH/BcTWsmvWyDdNODndSNIBKm41oCvfTahfjkJTKnsgVHS4CaVfroX21id+js6NFj/IKZ6jRDOrja2kafPPmf80+ena5bCZLGPyRDj9tmSwW/RF/E737HCbavIVs9Tvln9RhuZD8Sl4vEWYJ/bDyjI+Nj3b6TgfpqwCB1IO5PQZi1hl7EQWpLxFgZN2oYBqu8ra/mQFZXuRPAuRi80qkbcYI1tffbhgOwA+daM7noa4qiXrh+4CLd/pwL2Uk9NUApHe8yJSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KojP1ti9imOql4Yr5Vn2D2+CO1m2eib9J/PY0ouhSXc=;
 b=BICIHqHNmjNcfIdSzxCLTIdMa3wHV8B3ZA+sfuKvgqW9NEmcgUTTeTNIzxAe9TG/au9aUIlLmjGHxim7atGLV6BTqvSFYMB8tctE3wr/qmExbSbrGkYkrBdYm6a+CPVbCpIGD607Ym9BVgMHu50tj3J6xmdiMcVRYZtnw/lOz0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 17:39:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 17:39:22 +0000
Message-ID: <c29f550b-a787-4e6c-a615-3e7aff253fb6@amd.com>
Date: Mon, 30 Jun 2025 19:39:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Remove unneeded blank line in comment
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20250630144154.44661-1-jfalempe@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630144154.44661-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0040.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3e7ea8-5e9a-4f3f-581a-08ddb7fd0cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ellWRisvRS81a29odkgvZFF0SUZEdlc1RWFOQ1padFJBeVZ2QUdQb2dNU3p1?=
 =?utf-8?B?aDZLc3JTQUVFckdMdThmOFRZMEF3RVRUZGtDUWVlcWtycDI4Z2p6c0ZqQjBz?=
 =?utf-8?B?L3BNZ2tuZ2piMDFhZGoyRnNBeXMvRWFvb0doNldYaDBmZDNTZ2pnQllnTFJt?=
 =?utf-8?B?cW45SkJvOWpHaGF1UTlEbElKaG1CSVlxRm9KQUFndGJXamh2NG5nUEJ3UWhx?=
 =?utf-8?B?b0Q5OUJ3a0VmQ0RwZ2hsOXVuVTZpZG52cWNaWDcwVDFLTFVKcHN6WVp4ZnJS?=
 =?utf-8?B?RTB4RDkvNmVRaEhQNEtNSG03NGxUMTRHQVJRbjloNDlHTzZGenRVdEM4R25z?=
 =?utf-8?B?RnpzQkpMTFdkamFtMFZIYUxGeHRMVFE1MVBwM2xKMWprdFl1S2dZVjNTOWtp?=
 =?utf-8?B?WGU0MWJha2VYR3FlaU0rUHRWVmphMjR3dUU4NXNNZ2N0Z2VZSzREd09tN3I5?=
 =?utf-8?B?Q2YwMEEvQVUwazZaSU5DQU1JM2VEbE1yR3cwVDBwUUVVbll3RTQ4dHg1elBn?=
 =?utf-8?B?VFlXK0NUR2thMGNqbHhhZk5pNnJ1SUpNZVJsVVJjMGlIdm41T1VucWhxNUtJ?=
 =?utf-8?B?Y3hobEYxazJXT2ZkRU5wM3Q1MXhJM29DcE9NL2hZQVk2aE9qUWYyWUo1L2Yw?=
 =?utf-8?B?ZVBMQ294TFdsdGFncDI3dGtBbXZjRVZ2Z0s3TVIyV0JFQUNGNml3dlFIbjBV?=
 =?utf-8?B?U1gzMU94ZjZ4YkZOR1hVT1dDS08rc1FVcGVOTlpNaE5RTmhIM1hlVXQ5RUdV?=
 =?utf-8?B?RjZmUVJlUEtGQ0ZMOWpTZG9YYllyWU9yVTBuMGxkd0pTYUpkOHdOZytBUHlo?=
 =?utf-8?B?R21Ub0dQRTJvSE84Zzg2andMR0E1K0cxV2hHaFRrd01sOWNuU05sVklJRFdE?=
 =?utf-8?B?V0ZBSnVrUnFQMDlURVhBdVlXbnFGdGxmQTNDVkQzQnFpa29VMVdYQlRWSDJr?=
 =?utf-8?B?eFFkZThSK0syOEpicGc5SUhrdUt2ODMvOVlZMmJuOUhBYTZSck9SZG1rZ3pn?=
 =?utf-8?B?Z2dsMW5tanJrOTlqUGkxWS93ZHZKRGswOHFOc1dFQjEyV2c4R0tyT1BPbEZF?=
 =?utf-8?B?dURGS1RTRmNPNVR5VndSQnRQSVpQYmFmUEQwYnc2RGE5eXNzcjIzSzNTRGdX?=
 =?utf-8?B?aHlnOFdFNVZZdEFiYVRleWVvT1JVaERDUTE4ZkJITUx3SmFPOVMxZGlNK1Yx?=
 =?utf-8?B?Y0ZQV1hWWUt2N3hsaHpsUGY2eUM5cnF0amg5YmZWcDNPNlk4S3c5bmFPdEs1?=
 =?utf-8?B?QnRzTDVnMTZUUlFGdjBNU0pyaWx1SlBUWHVRZTczb3EwZzRBVHJZN2J2MW1O?=
 =?utf-8?B?d0lNMU5SMkQ0UmZ4UWhKclBEbGpNSXEwYlk3OEhUeXBDQUl4dE1BMURQSnkr?=
 =?utf-8?B?dFJ0U3NydnJrbmNvWWpVN2g0WUlRWmNlZ0k2dVN2dG5lNXlQSDZlYXJzNm9R?=
 =?utf-8?B?MzlWTG13alJjVjgzZGpZb0tkS2R3YnFwSVNHc2NGMzRibWkzVk1KWUJIRXpJ?=
 =?utf-8?B?YUtRQjdoWXU1RVVEczV2Q1FQSy9GczBFdlVRMklvSFZpSThSMko2YWJZNjNE?=
 =?utf-8?B?OGhlTDlGaTB6UWVMQ1hlOGIzbk5IL1BHVVJRMXRhQXhNd0wxNGJYdVZYdHFm?=
 =?utf-8?B?Mkh4N09waWlGL2N1Y05uc0lzdldsYkd1WDd0K3ZmRWVMamY1dzBGbnFzd0xh?=
 =?utf-8?B?TDRhU2pHOENJb2JmUjR3Y2syUEt2TUp2cjdRbHZzMDVCdkpnMWtyK3VXOXRE?=
 =?utf-8?B?Z3I3M3lzbmhUcTUzQXRiU0ttRCt1dUlPZ1daNnBQVFN3SW1jOFVKdUJMcDBM?=
 =?utf-8?B?ak54YnpEektFOXc1WHowdkVxWHhkOVNUZXNxM1g4NUhVRGVrZmlqK082b011?=
 =?utf-8?B?UWZkZ05Fd2I5V29xRVRvdTh3azNuZlJUMVZtQUNnRHJlN29uNnhkaFZHMGdk?=
 =?utf-8?B?REk0ZVhKTERQdEE1N2ZNREVEb2dldmZpQWtNWkozdFRKSXA0MEFZYkVKb205?=
 =?utf-8?B?QmlIcEl1RmJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2Vpbm5xSUNwdDZ0ZDFVVnpVZDQwVm9TZ0taWDBJMjI4aDBTeXlaa3FKRHNX?=
 =?utf-8?B?dDBXSzdhUXU3T2xPdXRhRmVGK2RPU3BBYmhZK3BnQ0s2MytzUy9NT3VmMk9T?=
 =?utf-8?B?bkt0VkdGZ2xUdTJ6QmVmdElRcEcwMWpoSTZkV3NLaHFrUzRyYmNRZm5IL243?=
 =?utf-8?B?MVF4TDUwR2cyeGg1ZFpoMmR6V3JRcFduc2Q2ZnV0TU5EbjdWN2dQaGhDTGJE?=
 =?utf-8?B?U2htNnk4bkViYk9zeVdUWVc5eFVua0tTWC9FTGxSb1NKcnFHbkM5N0RDbnND?=
 =?utf-8?B?cTR5MXlEK3R2UEhRZWlLRHNyaVRHZkRQdjh3R1ZHMUsvbVFqZTA2eGhMalBr?=
 =?utf-8?B?K1hiV2lic2F0UW0ya2lTVkx2R3RKSVFVcm9sS01rL3g1RXRvQTdhK1BGTmV2?=
 =?utf-8?B?MWtYYUxqckcxU2hlNUlOQmRaZzREL2hUSjFTL2hoNDJLSG9zQUlaTi85R0d0?=
 =?utf-8?B?NlBqNlVMdlI5KzdnaHJzOHJnVU1UbGpzenRzUmZOVjZkbkF3R0NFQ20xbTdU?=
 =?utf-8?B?ZlJBMGJTTWFzUlRnY2RSckZkTWk0VlUxSmkvc2g0V2gxQStvVDJCQmh6Q0or?=
 =?utf-8?B?YWh4b3JMc3pOVDdEZmVJamhBU2YyMmNKMVVtTDF4RTh2aU9YcDczZVhkSXcv?=
 =?utf-8?B?YWNmKzVwS3EyU0t2SzZMdXkzQ0hGQUM2WjA5VEcxM2J0bHdEbklsWVNsTCtX?=
 =?utf-8?B?T25MSW5ZQVVuMytsYi81anJCSEtFbm9pWFJzYzVwZFMxRWJoak9EblZacEZG?=
 =?utf-8?B?UEtkZDFQWVc2QS9kYW03QTJXNUkvSG02aWR5enl4UWl6LzBCNnExWms0NUNz?=
 =?utf-8?B?V25vMGo4T3FrdXRuZjZmQi95SmFzSlQzOXBIeU1nT1pIOHh4eWhuUUY3WjV6?=
 =?utf-8?B?bTd0VVdmTC9rVnc2aHJieWFaZlYwZ2dWOHJrSGpXQlk2QzdpWWN3VmFBZkNm?=
 =?utf-8?B?bGJ2R2hrdndKRnNQZll1UzR0ZW1WVFBqOThQK2Rqa3E2bzJmVTlUN20zZjd5?=
 =?utf-8?B?MmJtWUhFN3BMT2UvUURtY1F5N2ZMZGdoTFpRU3JEWkdGVXlIZ3NkQlZuU3hm?=
 =?utf-8?B?M2VtWFZDRlBPTHN2UitrYVZZL1FrYTloeTVMOXdrSTBubERRcVJRbEpxQzRH?=
 =?utf-8?B?TzhoSmdZcWR0UWYwZnM1QkVqWnJSS01VMkg2cTNxUXA4dkIxMDM1ZG5Eakw0?=
 =?utf-8?B?MEx6TWJ4Q21WWFZON3Z4NHJDRHFnazJaRjhjWG04T0dqbE85MXc0SWdQeTN1?=
 =?utf-8?B?ejdKc29HYThueTVReDVOdUswdUUvc1k5YTBpOW1aZHExQlZLSk5vNXgvR3hq?=
 =?utf-8?B?cUp0Q1BhenJoZk5oRFRtMTdRcE93Y2FOSlo5aW5LY25wc3NORllLMXBzbGJN?=
 =?utf-8?B?ZGlXeHFNOHVyY0J1OFVURjk4K2oreWNYbWZNMWVKUTd5bjJUZldDM2FrUU5X?=
 =?utf-8?B?S1I0eWZ6T0xPM0x5U3o0QW5SRDFnOU5ya3pIMzZRbjdwSmwwWFpzbnBOMGl4?=
 =?utf-8?B?K0F5WGsyWEx1UWptOUQrUVhIMDExWGpoN2MrSS85RmdDSUNnLzhOVC9CVGtI?=
 =?utf-8?B?Y09tRmhPbkMwcHNCUm1McUU2bHltWmIvQ0FISWNadHNtU2VUOHVCWC9OcEtI?=
 =?utf-8?B?Vmw2bmU3aDhjek4weHJyTmwxbU1HTE9tN0hvK2FvcEIvenpnN25ocVZ5Zkl4?=
 =?utf-8?B?Q0RrdjNmM0xCZWxWdlNKUVRNNnF2dDIvR3lPTXNyVjBmVU5nUUlGeVJHZ3Vu?=
 =?utf-8?B?MEt4d2xpMjJsOEJDVGhhM2twUVVKWkNBUnVVSmo4ZE1RWkMwNmxaSTRZUmhN?=
 =?utf-8?B?b0VWREVBaDlQUGJjQ3RYNEZHSTNHTVBiZWxVWUNmcElRbHlaQmE5a1lMZEFU?=
 =?utf-8?B?blFwdlIvd2JWNTZzQzA3REpRenpTQUNIU1NpbU1RdExmamhRTTBMWE1GblhF?=
 =?utf-8?B?MXVMK0FiQ09uR0VxRktTQlZEUmRyVmtLSHR3TW1IUTIxNm50RWJGWjE2WWVx?=
 =?utf-8?B?eHdNa1Y4YTNlTm4zRWRwMVhHOXFiTlF4K1UyOUtDbjF5SCtuaEJ4TDlTMGhO?=
 =?utf-8?B?YXUrREx2a0xOOGNXaXZTbUcrR0dPTlNZK1E5RXpOakV1b1h5R0l1aFNLOVha?=
 =?utf-8?Q?BVa3FNvl9Nwm+nirTO/fCKKls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3e7ea8-5e9a-4f3f-581a-08ddb7fd0cbd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:39:22.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZTuudM4vNdGDbHIlM1qoLs1AZMSLDG1SEoFJ4vPJMUhIybUh5nHi3RmdxlvHCm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853
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

On 30.06.25 16:41, Jocelyn Falempe wrote:
> There is an unneeded blank line in the documentation of the function
> ttm_bo_kmap_try_from_panic().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506290453.NeTXAb7S-lkp@intel.com/
> Fixes: 718370ff28328 ("drm/ttm: Add ttm_bo_kmap_try_from_panic()")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> 
> Can this be merged through the drm-intel-next, as this is were the
> offending commit was merged.
> 
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index ad95e8b9852b..16cb4065214d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -382,7 +382,6 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  }
>  
>  /**
> - *
>   * ttm_bo_kmap_try_from_panic
>   *
>   * @bo: The buffer object
> 
> base-commit: d5bafb1c294cf99cc5991f7fdecc79898f9b8d0e

