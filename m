Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16094B52F01
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 12:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95C710E03B;
	Thu, 11 Sep 2025 10:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5lOs8zqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827CB10E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZBZLRSv+eYd9SynHZaBB3YKez6D2LcZiKUzBflT51G6efvhI0abUqqnker5OWbpPPu08UCe+ZoywYntN56+fObzGsyMq4TDr6+xht62pKzyvD2gRoKvq1nchoKqner7bpNxKTa/iohqjCNskHvOZVT99Y19nX/wKYZzqpYo3M5MdrLYeA5c2k2/LBKonZUJFfEGGLRijExcPQWTpVbdTdRhuiIv8DnkoxOvuFRGV9JZribr1C3TkfiqX55/0qDkIoEMWqr7IqXuB0qnSE4NylsRgv3V3RYQTowOeSnwMR/qwGrKtAd70VPm/3Qi8ysroMMwN2/cu7IQ5iTF7PYX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj7ETT2fb+lMaAGteiFWSmHIR3vFbIWP03Ak6Cn4Nh8=;
 b=cxtZhdCvsmO2SL4FyjDpUo1JkxPn0W+SlC0eaiSiVwJVsNUZylR9qlvvcd1IJ9z20poXnJsSulnqNat9444CKJh0RuFjD8EycPjlZbXieXwsFY/RIpMbf+2r3R4bOQn8odYEn/rzr7vlKu6TmrRbxrDCMM3ApfJxsShGsLWk6vcYA3mDRWNLxg0U1YEml3OI2ts4MCaIi7iA9/XlqcW+m0FLBPI8weStbnM5fXibQrrOWFsqvSs/C9glj8MHFZBNUgYUK/xvzEffyyUq8r4flJX0/Ldo8cVLMZ5ZwfoRQgX3nugQS5j1MJ4g0aXlhAgnn9hMQ+J20zvDbNYTgJ4QVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lj7ETT2fb+lMaAGteiFWSmHIR3vFbIWP03Ak6Cn4Nh8=;
 b=5lOs8zqbhTLh35W7UhywTZ8IUFjdmfSmAs+XtlEkHX9eOOPyny3ishSfiB4HoBdB4DoaSDbKLQV/TD2MPsnFYr/8YOrsQTk53cjL7GJZIkz0KBaOMokkKTwGR2yn6uMhnEBPd727FGfGov90lwFJYGqdjhClQGAb6E9btXNkanQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:56:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 10:56:16 +0000
Message-ID: <60ec3476-d141-4900-b87c-5135da6cfdd6@amd.com>
Date: Thu, 11 Sep 2025 12:56:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: rename ttm_bo_put to _fini v3
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
References: <20250909144311.1927-1-christian.koenig@amd.com>
Content-Language: en-US
In-Reply-To: <20250909144311.1927-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: b30d87c8-0d09-40a9-fa65-08ddf121d4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWU2UU5wdnBOL3JQb3k0b1F3RHYwMGE5MTJacTBQU3I2RnRCMW1QWDBYOUIw?=
 =?utf-8?B?bmg2V2NPSldIaTdSVHdkb3VLT2kvOHU1Z3RVdW9Rc1FxZzJ1TC9ta0ZES1Fh?=
 =?utf-8?B?emFrTE81cmVmNmxYNERhMXplNnY0OXJRcThKS1lwbXBYT3pZTzdxckhSSjA2?=
 =?utf-8?B?MmlLK3FsTC9nUGQ2enFPMnZXL1NOZkRNbzJrdVdpcmRaRnBobGpHR1lMMmcx?=
 =?utf-8?B?N3gvakx4YzRmQW9KOG1iaG53OWVUenJYWHNLaGlvbExJUVBIaUlhejFtdGF3?=
 =?utf-8?B?ZGxQODgyTXdlOUZFS1ZxLzV0MHc3U1RFRmFUeGtyZ3Y4QzJhQ1gzTWRlakxX?=
 =?utf-8?B?cFdSTWtwVk5td2lRUEpDUHBJblA5SVc3OUVlMHdBQUl6UjlDaFl2T3pUVElK?=
 =?utf-8?B?enhSSGpGWDlLY3pjd0lvQ3hXM0wvamhGaW9zY2Vjem9OVWxxOVhyaFFXeHYx?=
 =?utf-8?B?WUY3Q0l2T3RCcVBxaXRWK2N1UWZSOTcybllUb09iNnl1Q3lJRm5Sc0RpOW9M?=
 =?utf-8?B?WkJWYzFhZWlxNlV3WE81WkVaTE4rVHRPL01teFIwRGVacmVJWWsvQk5UVTdi?=
 =?utf-8?B?M0pzem5ranBxeEtpVnNmTEVSOGFENkIyY0JuMVh6cDhMMXZQbkYzRnlqbk9M?=
 =?utf-8?B?WFFwYVM4V1prMXV2Uk1sWFRTUUxwK3lvcWFNdDJVU2J6aE5XUXd0cFpoSlpx?=
 =?utf-8?B?cW83Nnc5cHVwQlN0S2dZNHFHTWYzNWxmZTZHOXVzOHhwcERwZGNMZ3ZzVVN0?=
 =?utf-8?B?VkdUUW5CY2FMU1pFUXRqQkttTFFEKzZ2MGE4aWp2NDdKOWdEdEoyem1SYWNk?=
 =?utf-8?B?cHQvNGlXNlRmY3pUdFQ3SzJ1QjRJYjJCem1GUlBqc0o4M291S2c4MEtFU1pG?=
 =?utf-8?B?ZFNUT0FhZlkrY3JzWWJaM0gyL3BkK0xlb2JBa2JHUnlnWkpUUnB3aVJlZUdO?=
 =?utf-8?B?YmRJMDJ1eEE0YWJUUW5HZWhFUExFeFRldmlUUTNHK1MvbkR1cWNiYTF4VDJ4?=
 =?utf-8?B?Nk00cE9EZk9sYVdJeEx1elZxWjloaEFuVUtlcVVmeVdkMjZzdVhLeTZ2TEFB?=
 =?utf-8?B?SzlDR2ltbkNLVWFQaXllcnZHNUlxNFZna2xUdExucHZWY1JMSHFmWmlCaW9G?=
 =?utf-8?B?dFhZQVRjRUQ4a3g5b2ZpUWJpRWZ3NWNWSE1pa0FoZE1YamRYWmVTYU14em1N?=
 =?utf-8?B?bXBZSTlsWGNjRHBiQi9VaVlRa08rVENWOFZEMGlkNEZHcjhLTDlJdEtMbUI3?=
 =?utf-8?B?cVY1dTkxRk5xTkNTZzRKdjRoY0lLdHd1cmI4N1AxN294NkdSODIxUW9ScEVl?=
 =?utf-8?B?R0l4aDg3UERmN2RSek55bEtLZ1F2aGoxZXhlQml4cGgxUHlmSkJ2Wkt2Snho?=
 =?utf-8?B?QUV4Y3VuaUFoUGVtc3k5TGhreHR1SFZCdDZTS3pjdDV3ek4rSUhuQUYxL2dH?=
 =?utf-8?B?V1VROWtKS1kyUndlc1JVNXIwQXNXYkQxc2UrZUJicDFHZDkxNkdBeTBQUFFI?=
 =?utf-8?B?YXI5citVUnRyMzNKY1FobTBFbDBnU0NKTVF4alVwekJYbmdZN2t1eE1qMDYy?=
 =?utf-8?B?Y3YwUnEzTTlwVlA2QXNMdk1oRFpHaHBJSGF5dXhWZXNhTkRRcmIvbWtlVGlj?=
 =?utf-8?B?cndKYzFGcVRCa3BXQzdHNko2Zk1CL2kxSm9UNDNKdkNPVVNmbERPZ1JxNnNX?=
 =?utf-8?B?dmdwSGZ5TC9WZGYzTVdGY05vMGU1VS9ZY2xjWTRTQ0VJVGdTY25veDRPWWhl?=
 =?utf-8?B?VGwrU3JiTjdQb0p1WEFQa3ZqT2EwVFRrbmt1c3JmK21SM2ZQUkxkUTBhWkdS?=
 =?utf-8?B?ODMzK25DdXpkb1FEMy9ZZUF2bzN1cmp0dzFXQllWMXJzcjZiTm9Eb0xZOG5o?=
 =?utf-8?B?dDZXVmRVWVNyYmswNVdNUDBxNUF5UEFKalVOb3VkL3hoS1k4Wms3MElZekJO?=
 =?utf-8?Q?BOxi/psoBfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3crb2NxMHd3WlVadWlleTIxd0U4UUtLSldoYy9icTR2TTJPUi9TTTBUUXpi?=
 =?utf-8?B?NVV6QkVCa1o3Q05MNXNlUDVDa0N6a0ZTZ2E2ZWlmcG1KOStuLzkvNm5TYXZy?=
 =?utf-8?B?Nks3SjYwL3l6NE9hbktmNTJ1bStIQjNYL2FXb0crVmtEWkZDblRZbVRYdUEw?=
 =?utf-8?B?RWJtRHdNL3YzY2srOGczT1VRRFZQdEE2SWk5SzB6YUFHVkgwclBnMkloOXV4?=
 =?utf-8?B?bDFwNWwvdDdUTk42ckVQS0dFUHlkZE1lRGt0bzd3NC94a3FsenE0a0lDb1Z5?=
 =?utf-8?B?UFFhcSt0Q29uRDBreGZmK1JBNVlRNWNWVks2MVRhTS9SaVJ6K3V4bGs5azRM?=
 =?utf-8?B?dkMxakF0clhXNklZbjIzSU5SR3FWb08vK0NTa2pJNGpZVmJYeXNWQXA1QUNo?=
 =?utf-8?B?Q0ptS0V1cndnRktWT0ZXMFdjT1c5WVNOVVRrSjkyYkVzbUVPV1FsUytIcHVt?=
 =?utf-8?B?ekZLZjR6OTRzT3daNmUzZ3JNdEs2Z08rV2F4VW4za0J3QUFXdXFRdVpiLzhC?=
 =?utf-8?B?YjR1M1Jmd29EODZ0QmRLRmtJUnhmckpPY0ZjZ3RWQldGbWRSK0JGTW5Dc2Jz?=
 =?utf-8?B?TVA0Ty9VcjMxOUhHUHRZaTZmb1krL01NbXJzOGluUkRvTGhmOTZwdTJzcHln?=
 =?utf-8?B?bDZoSjdFVUY3TGpwd3c1RisyaHNYWGUzb1k3a1pmZWNPR3VNSTVoZ1VFN3ho?=
 =?utf-8?B?bUlRdmxPdjVWTUxZekJ3d252RVdjZmgwNm92OVY0eW5YaitnMVlGWFZTZXgz?=
 =?utf-8?B?RmNUVGY0RHpSMEF0ZmdvNC8zcjgxSjUra3BSanVsZHdYb1NUM0pyWHArbkxI?=
 =?utf-8?B?RnJSSUpkdUh3ajFEMGdXOTRJSmRrZThza0ZjUXI5WEJ1YVU0dDRqU0ltMUl2?=
 =?utf-8?B?UnZBL3ZsWW95SHhLek1naGJrcXFXdGZsMGgxT3ZYN3M4UjhLSEFzMXFDNDZu?=
 =?utf-8?B?SVk2cUR1UTZaMXAvZ01wQXNEa0kvSUU2bllQMURlV2xQOHl4YkdEcWhoQ3c3?=
 =?utf-8?B?dEZyY01XOGt0Y0h0a3dYdFJhcFFrQWxTTTVwdUlGL1pjc0t1THIxZFp6TGYv?=
 =?utf-8?B?RktaZVpYTWJmT3dXQWE2UUNRN3JuZEExTWk2U3pCTms3UHdaTkxHeENyZlNr?=
 =?utf-8?B?dkV4c2doUVJHUG84VzFZbE9PWFk4NWlIU3ZSYnBobmhwdGt4R1pDSjM5cDBL?=
 =?utf-8?B?b2F1Umk5WFpiNk1oSUs5UG5uWG1OZmJCNitLbDRNYjNuQnlvVU5Nb2lZOFY5?=
 =?utf-8?B?L0ZXanBacWZkdnREOFB1cHdXSHZqSCtMWC9jQW14QS82eUp6TEJLODNSZERD?=
 =?utf-8?B?a0wvSFJmMnY4VmJBWnp4aVBzdjY0bndGaGlzRVhQUkN1K0FnTTRZTlZMdDRT?=
 =?utf-8?B?Z1N3ZVZyb0ZHdTlmSU4xc2ZlbXBTdVhiVjB1MzM4MlpVM3BORXRkOEplMm45?=
 =?utf-8?B?QUdWczRqVFRRTFVOM0xMT1drZklBbWxTSE5qeS9DOTZDdWptRXlQL2VSYWFQ?=
 =?utf-8?B?QnRlRlEwbk83bG1KUW9xMnhKaTdqbllpd2RUbGNrUldSR2N6SFUybnVFZTF0?=
 =?utf-8?B?ejN2ejh3NFNYVkVnZnBsRzUrZ3RHNUl6M1o4d2VPaHFDT1h0cjBUZ1FOcGxN?=
 =?utf-8?B?VGRtdGVpNkEwVVorT2VCanBJWWZ3SnFyVVdsdEZXM0F6Q3VkZDd0QnJkcG9k?=
 =?utf-8?B?L0VuTGZkSUt5U2xwVGhJZ1dkU1hPcEc2ejF0VnBlVTBrQlEzbEJ2SndjTC8v?=
 =?utf-8?B?T1NCUTVqQkdaVUtWMGdYRkxjZW11NkpBam1xb280ZEF0WVc0M0Mzc2c5aXR5?=
 =?utf-8?B?T3FsejRuRUhPRlVVRTZrNzU0RFBYT0wxVzdDRUJKdWtqZDJuWm04aDBnUHZa?=
 =?utf-8?B?ZzA1RjVXUFlpRFFmamExemErODlQUGRxanVJOEd5N1prSnU0ZG84cGdOL3Vu?=
 =?utf-8?B?TkZkMXQyTm9SL3lZUHBjWVYrUmlPR1FnNjhob2puRWV3ZzlHRFRCVlJjcmNN?=
 =?utf-8?B?TjRTcHVweDdMNFJiUlJ6TW5sUFI2L2dCQUFOODRHSzhKNGdNMFFlNEpWbTg1?=
 =?utf-8?B?bitWMUorZFc1VWlVdWZiZEZmRS95L2lSRmNmZkNhRjNhVzZPbSttSTE5V092?=
 =?utf-8?Q?rSYIcZr4WPUeiOu1QvIXYCHhe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30d87c8-0d09-40a9-fa65-08ddf121d4c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:56:16.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLbNA/jN27emsf8QktBbDKHOpTa8MQQa4CgzOVrPFwg3WziUNV3Htv5IDzk0ipPd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535
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

Gentle ping. Thomas can I get an ack on this?

It's just a rename with no intended technical change.

Thanks,
Christian.

On 09.09.25 16:43, Christian König wrote:
> Give TTM BOs a separate cleanup function.
> 
> No funktional change, but the next step in removing the TTM BO reference
> counting and replacing it with the GEM object reference counting.
> 
> v2: move the code around a bit to make it clearer what's happening
> v3: fix nouveau_bo_fini as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  6 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  4 +-
>  drivers/gpu/drm/loongson/lsdc_gem.c           |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h          |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
>  drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 12 ++--
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 60 +++++++++----------
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 15 +++--
>  drivers/gpu/drm/ttm/ttm_bo_internal.h         |  2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>  include/drm/ttm/ttm_bo.h                      |  2 +-
>  15 files changed, 59 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 6626a6e64ff5..0a5b204086f3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -198,7 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>  	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>  
>  	amdgpu_hmm_unregister(aobj);
> -	ttm_bo_put(&aobj->tbo);
> +	ttm_bo_fini(&aobj->tbo);
>  }
>  
>  int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b04cde4a60e7..90760d0ca071 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -107,7 +107,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>  
>  static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
>  {
> -	/* We got here via ttm_bo_put(), which means that the
> +	/* We got here via ttm_bo_fini(), which means that the
>  	 * TTM buffer object in 'bo' has already been cleaned
>  	 * up; only release the GEM object.
>  	 */
> @@ -234,11 +234,11 @@ EXPORT_SYMBOL(drm_gem_vram_create);
>   * drm_gem_vram_put() - Releases a reference to a VRAM-backed GEM object
>   * @gbo:	the GEM VRAM object
>   *
> - * See ttm_bo_put() for more information.
> + * See ttm_bo_fini() for more information.
>   */
>  void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
>  {
> -	ttm_bo_put(&gbo->bo);
> +	ttm_bo_fini(&gbo->bo);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_put);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 1f4814968868..57bb111d65da 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1029,7 +1029,7 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
>  {
>  	GEM_BUG_ON(!obj->ttm.created);
>  
> -	ttm_bo_put(i915_gem_to_ttm(obj));
> +	ttm_bo_fini(i915_gem_to_ttm(obj));
>  }
>  
>  static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
> @@ -1325,7 +1325,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>  	 * If this function fails, it will call the destructor, but
>  	 * our caller still owns the object. So no freeing in the
>  	 * destructor until obj->ttm.created is true.
> -	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
> +	 * Similarly, in delayed_destroy, we can't call ttm_bo_fini()
>  	 * until successful initialization.
>  	 */
>  	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..22d0eced95da 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -57,7 +57,7 @@ static void lsdc_gem_object_free(struct drm_gem_object *obj)
>  	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
>  
>  	if (tbo)
> -		ttm_bo_put(tbo);
> +		ttm_bo_fini(tbo);
>  }
>  
>  static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct iosys_map *map)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
> index d59fd12268b9..6c26beeb427f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> @@ -57,7 +57,7 @@ nouveau_bo(struct ttm_buffer_object *bo)
>  static inline void
>  nouveau_bo_fini(struct nouveau_bo *bo)
>  {
> -	ttm_bo_put(&bo->bo);
> +	ttm_bo_fini(&bo->bo);
>  }
>  
>  extern struct ttm_device_funcs nouveau_bo_driver;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 690e10fbf0bd..395d92ab6271 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -87,7 +87,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
>  		return;
>  	}
>  
> -	ttm_bo_put(&nvbo->bo);
> +	ttm_bo_fini(&nvbo->bo);
>  
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
> diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
> index fc5e3763c359..d26043424e95 100644
> --- a/drivers/gpu/drm/qxl/qxl_gem.c
> +++ b/drivers/gpu/drm/qxl/qxl_gem.c
> @@ -39,7 +39,7 @@ void qxl_gem_object_free(struct drm_gem_object *gobj)
>  	qxl_surface_evict(qdev, qobj, false);
>  
>  	tbo = &qobj->tbo;
> -	ttm_bo_put(tbo);
> +	ttm_bo_fini(tbo);
>  }
>  
>  int qxl_gem_object_create(struct qxl_device *qdev, int size,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index f86773f3db20..18ca1bcfd2f9 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -86,7 +86,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
>  
>  	if (robj) {
>  		radeon_mn_unregister(robj);
> -		ttm_bo_put(&robj->tbo);
> +		ttm_bo_fini(&robj->tbo);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 6c77550c51af..5426b435f702 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>  	dma_resv_fini(resv);
>  }
>  
> -static void ttm_bo_put_basic(struct kunit *test)
> +static void ttm_bo_fini_basic(struct kunit *test)
>  {
>  	struct ttm_test_devices *priv = test->priv;
>  	struct ttm_buffer_object *bo;
> @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit *test)
>  	dma_resv_unlock(bo->base.resv);
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static const char *mock_name(struct dma_fence *f)
> @@ -423,7 +423,7 @@ static const struct dma_fence_ops mock_fence_ops = {
>  	.get_timeline_name = mock_name,
>  };
>  
> -static void ttm_bo_put_shared_resv(struct kunit *test)
> +static void ttm_bo_fini_shared_resv(struct kunit *test)
>  {
>  	struct ttm_test_devices *priv = test->priv;
>  	struct ttm_buffer_object *bo;
> @@ -463,7 +463,7 @@ static void ttm_bo_put_shared_resv(struct kunit *test)
>  	bo->type = ttm_bo_type_device;
>  	bo->base.resv = external_resv;
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_pin_basic(struct kunit *test)
> @@ -616,8 +616,8 @@ static struct kunit_case ttm_bo_test_cases[] = {
>  	KUNIT_CASE(ttm_bo_unreserve_basic),
>  	KUNIT_CASE(ttm_bo_unreserve_pinned),
>  	KUNIT_CASE(ttm_bo_unreserve_bulk),
> -	KUNIT_CASE(ttm_bo_put_basic),
> -	KUNIT_CASE(ttm_bo_put_shared_resv),
> +	KUNIT_CASE(ttm_bo_fini_basic),
> +	KUNIT_CASE(ttm_bo_fini_shared_resv),
>  	KUNIT_CASE(ttm_bo_pin_basic),
>  	KUNIT_CASE(ttm_bo_pin_unpin_resource),
>  	KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 1bcc67977f48..3a1eef83190c 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -144,7 +144,7 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
>  				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
>  
>  	ttm_resource_free(bo, &bo->resource);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_init_reserved_mock_man(struct kunit *test)
> @@ -186,7 +186,7 @@ static void ttm_bo_init_reserved_mock_man(struct kunit *test)
>  				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
>  
>  	ttm_resource_free(bo, &bo->resource);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
>  
> @@ -221,7 +221,7 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
>  	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
>  
>  	ttm_resource_free(bo, &bo->resource);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_validate_basic(struct kunit *test)
> @@ -265,7 +265,7 @@ static void ttm_bo_validate_basic(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo->resource->placement,
>  			DRM_BUDDY_TOPDOWN_ALLOCATION);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
>  
> @@ -292,7 +292,7 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
>  
>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_validate_failed_alloc(struct kunit *test)
> @@ -321,7 +321,7 @@ static void ttm_bo_validate_failed_alloc(struct kunit *test)
>  
>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
>  }
>  
> @@ -353,7 +353,7 @@ static void ttm_bo_validate_pinned(struct kunit *test)
>  	ttm_bo_unpin(bo);
>  	dma_resv_unlock(bo->base.resv);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
> @@ -403,7 +403,7 @@ static void ttm_bo_validate_same_placement(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  
>  	if (params->mem_type != TTM_PL_SYSTEM)
>  		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
> @@ -452,7 +452,7 @@ static void ttm_bo_validate_busy_placement(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
>  	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
> @@ -495,7 +495,7 @@ static void ttm_bo_validate_multihop(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>  	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
> @@ -567,7 +567,7 @@ static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
>  		KUNIT_ASSERT_TRUE(test, flags & TTM_TT_FLAG_ZERO_ALLOC);
>  	}
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static int threaded_dma_resv_signal(void *arg)
> @@ -635,7 +635,7 @@ static void ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
>  	/* Make sure we have an idle object at this point */
>  	dma_resv_wait_timeout(bo->base.resv, usage, false, MAX_SCHEDULE_TIMEOUT);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
> @@ -668,7 +668,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
>  	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	dma_fence_put(man->move);
>  }
>  
> @@ -753,7 +753,7 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  	else
>  		KUNIT_EXPECT_EQ(test, bo->resource->mem_type, fst_mem);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
> @@ -807,8 +807,8 @@ static void ttm_bo_validate_happy_evict(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type, mem_type);
>  
>  	for (i = 0; i < bo_no; i++)
> -		ttm_bo_put(&bos[i]);
> -	ttm_bo_put(bo_val);
> +		ttm_bo_fini(&bos[i]);
> +	ttm_bo_fini(bo_val);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> @@ -852,12 +852,12 @@ static void ttm_bo_validate_all_pinned_evict(struct kunit *test)
>  
>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>  
> -	ttm_bo_put(bo_small);
> +	ttm_bo_fini(bo_small);
>  
>  	ttm_bo_reserve(bo_big, false, false, NULL);
>  	ttm_bo_unpin(bo_big);
>  	dma_resv_unlock(bo_big->base.resv);
> -	ttm_bo_put(bo_big);
> +	ttm_bo_fini(bo_big);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> @@ -916,13 +916,13 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo_evictable->resource->mem_type, mem_type_evict);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2 + BO_SIZE);
>  
> -	ttm_bo_put(bo);
> -	ttm_bo_put(bo_evictable);
> +	ttm_bo_fini(bo);
> +	ttm_bo_fini(bo_evictable);
>  
>  	ttm_bo_reserve(bo_pinned, false, false, NULL);
>  	ttm_bo_unpin(bo_pinned);
>  	dma_resv_unlock(bo_pinned->base.resv);
> -	ttm_bo_put(bo_pinned);
> +	ttm_bo_fini(bo_pinned);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> @@ -973,8 +973,8 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
>  	KUNIT_EXPECT_NULL(test, bo_big->ttm);
>  	KUNIT_EXPECT_NULL(test, bo_big->resource);
>  
> -	ttm_bo_put(bo_small);
> -	ttm_bo_put(bo_big);
> +	ttm_bo_fini(bo_small);
> +	ttm_bo_fini(bo_big);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
>  
> @@ -1025,8 +1025,8 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type, mem_type);
>  	KUNIT_EXPECT_NULL(test, bo_val->resource);
>  
> -	ttm_bo_put(bo_init);
> -	ttm_bo_put(bo_val);
> +	ttm_bo_fini(bo_init);
> +	ttm_bo_fini(bo_val);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
> @@ -1070,8 +1070,8 @@ static void ttm_bo_validate_evict_gutting(struct kunit *test)
>  	KUNIT_ASSERT_NULL(test, bo_evict->resource);
>  	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC);
>  
> -	ttm_bo_put(bo_evict);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo_evict);
> +	ttm_bo_fini(bo);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
> @@ -1128,9 +1128,9 @@ static void ttm_bo_validate_recrusive_evict(struct kunit *test)
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type_evict);
>  
> -	ttm_bo_put(bo_val);
> -	ttm_bo_put(bo_tt);
> -	ttm_bo_put(bo_mock);
> +	ttm_bo_fini(bo_val);
> +	ttm_bo_fini(bo_tt);
> +	ttm_bo_fini(bo_mock);
>  }
>  
>  static struct kunit_case ttm_bo_validate_test_cases[] = {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e7..9c9e132558d4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -318,18 +318,17 @@ static void ttm_bo_release(struct kref *kref)
>  	bo->destroy(bo);
>  }
>  
> -/**
> - * ttm_bo_put
> - *
> - * @bo: The buffer object.
> - *
> - * Unreference a buffer object.
> - */
> +/* TODO: remove! */
>  void ttm_bo_put(struct ttm_buffer_object *bo)
>  {
>  	kref_put(&bo->kref, ttm_bo_release);
>  }
> -EXPORT_SYMBOL(ttm_bo_put);
> +
> +void ttm_bo_fini(struct ttm_buffer_object *bo)
> +{
> +	ttm_bo_put(bo);
> +}
> +EXPORT_SYMBOL(ttm_bo_fini);
>  
>  static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
>  				     struct ttm_operation_ctx *ctx,
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> index 9d8b747a34db..e0d48eac74b0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -55,4 +55,6 @@ ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
>  	return bo;
>  }
>  
> +void ttm_bo_put(struct ttm_buffer_object *bo);
> +
>  #endif
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index eedf1fe60be7..39f8c46550c2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -37,7 +37,7 @@ static void vmw_gem_object_free(struct drm_gem_object *gobj)
>  {
>  	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gobj);
>  	if (bo)
> -		ttm_bo_put(bo);
> +		ttm_bo_fini(bo);
>  }
>  
>  static int vmw_gem_object_open(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 18f27da47a36..8830f0142881 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1668,7 +1668,7 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>  	 * refcount directly if needed.
>  	 */
>  	__xe_bo_vunmap(gem_to_xe_bo(obj));
> -	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> +	ttm_bo_fini(container_of(obj, struct ttm_buffer_object, base));
>  }
>  
>  static void xe_gem_object_close(struct drm_gem_object *obj,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 479b7ed075c0..da5c2e4971dc 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -391,7 +391,7 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
>  int ttm_bo_validate(struct ttm_buffer_object *bo,
>  		    struct ttm_placement *placement,
>  		    struct ttm_operation_ctx *ctx);
> -void ttm_bo_put(struct ttm_buffer_object *bo);
> +void ttm_bo_fini(struct ttm_buffer_object *bo);
>  void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
>  			  struct ttm_lru_bulk_move *bulk);
>  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,

