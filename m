Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7BA28A2F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 13:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E36510E0FF;
	Wed,  5 Feb 2025 12:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yxxs/623";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AA110E0FF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 12:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtR3T6dFX3YY0BjHCPI7dZ2L+g0zZOwlyet23I4bgsn/2jFu47IRlpxFLXTB4YIqIpUoUHrmOxZbk5mSo6KMEbntIehYVba7AOTIdIxYSSypTGj+GU3y05v8YmMl4QK8BanECMN9Hg/Yw9X64L5aahIJerBDYV5Iaf/P2BIAqRswF5UK0SoQenLG36u3G9kMecnWHHHJm/6bAPdFYG5E/jzxiMCc6IOeqCcg+W/WQg/Q3rq8BXMBTX3aDNB9db7k2iXDWqmaA8bOfO+VGSSHD/f9Q9z6U/eL6x7ajQM8J+jRHVZXst/fZGG3OxKQ8EkjMIj7PqZmwZN/5IENMn2ndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85FEN7jVyasdsQJZl4H5YyMtj6WjV3eWqzLcbt3tJmE=;
 b=m8Cyd2VVedf/FF7jXrefk07tqrm0Ina1a9o/pw3NcPTqSGwoOf/xpXeIstmFlgbENfdLloh6leCEpFFTgUnVK0YlRQD7Etofob0qXtMUjErMinZip8nyC8fpo3EK/2koSl3wSMv/6CV1CNCRjYGZ4Ykd3hUXKTtMftTHOERq6try8yuKaJYhCOgJMNq9F8vgGAqM5jPxji3aQe/SWcWRjJywFUjuXNrYnyJ3PWY5Uic6atJQsUJJj3ZuC0sBscFm/GSJcnjMYDaSsgsfyZps71KLvjx0EzS691JHR6bGyaOY9hn0Oe2U2sl6nWbAOcHj+nOiqqg3+nZauwW0FWa2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85FEN7jVyasdsQJZl4H5YyMtj6WjV3eWqzLcbt3tJmE=;
 b=Yxxs/623BIVMsTryfycw4VhWjOjN/ekucOYlhByM4C1WTcBE/D62Hba0csRu5y7n+CCXqUG+jtSkxDMWNm+awtkShDCSqqUddDTm2camefD6arpJ6u/1VB59jMkbGGINnjAX8PPTv590MZjLVe46mKT07CrMjB31NMAUBxW4vOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 12:22:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 12:22:40 +0000
Message-ID: <c0d4fa1a-6efe-4de1-b799-435d37313d0a@amd.com>
Date: Wed, 5 Feb 2025 13:22:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Remove some unused prototypes
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250205110410.7941-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250205110410.7941-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0383.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ff2289-6d8a-417a-4aa2-08dd45dfc8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVFiVWdQSThJenpYaTVOQ1FpMUF6c2hMQWdyN0hVUUJRYnlaRkxMS2Q4bk81?=
 =?utf-8?B?QWZDYTZXT2pDVm1DMmZ3dnI1Yy96VVNEakxEWmdmelRrV1FYMHFNdkU1U0Rk?=
 =?utf-8?B?UUVUSEhiT2tKWU9iZlAvWVRLYUY0WFNrbE1sQVZrY2pmd2orSDBFZi9kaDNn?=
 =?utf-8?B?S2NPMHd3enVZREZUbGJueCtoNmxIay9jR1gvbjZuR3VhQjFNaWJ0bjhQNy8x?=
 =?utf-8?B?NXZ6QW1vWExNdUZFdVBxTkQwTWtmM3dLMDkwT0g5ZmVHNWI2TUVDNXpaVUlQ?=
 =?utf-8?B?YzZBZGN5ajJ3QStoa0wwVWpFV3BjcGhySjJ6dlhyREJuWUczalNENDV2Ymlq?=
 =?utf-8?B?b3l6c0hTeElUR2RHcnBTbmZIcnYzTkJrUjgxekVsTUZYRkd6QlBoWTZFc0Zr?=
 =?utf-8?B?SFFMeVJkcHdNQTV5RFQ1dHdhNzZUZWEraGZDd0NOeU5PU1Zuc1NiOFlGUk9O?=
 =?utf-8?B?QUFZeHZ5N1FVRHkrci82c3RETVYwN1pXSE14enZZWXF4RGVBL1l0cGdHaVFM?=
 =?utf-8?B?NkcrQ1FpWFc2UW9XRlpDWllsdEUyRmprb3djdkV0RkZkSmdsR0h5NS9jYmxV?=
 =?utf-8?B?K3JHRFBwaU85bHFkUW43dWxJTGsyWXowVzk1ZFlvSC9CYUIva0FhVFhINk9r?=
 =?utf-8?B?MXZnUXE1dXFJcURTYk5LNlg4WmRnUjhrMEFvS1Uxbk1YNTV6M3lhaXJWWndo?=
 =?utf-8?B?czgybzZDaHR5SGpwQVo2YytRVDJXMWpmdXRwUThBNDVjSlgvTFJBMWF2Tkhn?=
 =?utf-8?B?dTN0OU02UFJwY1krMW1rbGoyQzZ2NnBaQXNDQW1OajZuRER4c0xCYy9FMlRN?=
 =?utf-8?B?ZGQycVY5ZzRMajY3VFFzOFBQRndRbm1uZUVRd3ptT0lhWW9BM0JOMTVJU0hl?=
 =?utf-8?B?T3dQaGVRbUlIOWtmWUsxSTRjVmFrMGtCRXBiMnZUcVl2VU1PN0pBNUtHa3l2?=
 =?utf-8?B?dGFsNy9LRnlRT2NIOHBDUytaQjVxR3Jza1d0bDc5SkFUd2d4amRiME84bTlN?=
 =?utf-8?B?dkRQZmZOdzg3bVhiVC9OK09HZHh2eCs0dmxMdlYreTR3MmtBRFFjbXFNUjVz?=
 =?utf-8?B?emFYNkQrUVFEUXNpcDFoejFFdEp0MytUUzNFekFzNzJHUXJtZmFFSWNUNVph?=
 =?utf-8?B?bWk3T1JlRDIybm9BdlNzYzNpdDd4NnNJeWtBVWV0WFNzc0tFUjY4TWZDQ1Zk?=
 =?utf-8?B?NCtqRFEwKyt2dm0rUGQ4OE8zUWpKM2N3VFNMblJ4bjlUQ0R3TWpTbmF6bVJP?=
 =?utf-8?B?UFBNSWdKdU5KUWhXWE9HVS83bDFBZGtXL3hWZFZBbWR4TUhEb3NTTjRzZ1kz?=
 =?utf-8?B?bll1Z2dkZHp4bUpFbHJPSlJ4R0g1dXl6YVRMYUgwSHRaTzc1TEFMbk1iQndm?=
 =?utf-8?B?aEtGMnhqNE8xOFM0UjFqeWdjWFY5RUd5RU9wVFlmUkQ0TXVoaWdqU1Fna2V5?=
 =?utf-8?B?bCt6NVpYRVc2Z2locTBqMUhFeEZRVGZaQnptVXMrK0ZrcHFITFBOSlJZbGNj?=
 =?utf-8?B?bThLT3JtQ2pVcU91QVFTVVJvaTFPaHQ2YVVreGI1a0M3WU84ellRVXNldWdI?=
 =?utf-8?B?bmdEWi9MVENGVlBsaS9leDlGcHhFait4WGgzNVBhbm8wTnZQMEcxVlAwWFhB?=
 =?utf-8?B?K0M3Y3FkRitZM1duTFBPZlZXNDU3d05kVUlWK3liVTcrVy9HQ3licW9ZSWNI?=
 =?utf-8?B?NFNaMDc4b0lkRkR4UUs3TVE4REpidFlzWDBuK0h1ckQ2UjQzR3lWcjBuaUw0?=
 =?utf-8?B?Zy9MS2VkUnFWQVVEL3NzTHRjOElwNEhMcTB1RmJ0NnVxUkZRcDk5eWNxWnpx?=
 =?utf-8?B?TmlBTDlvelh1WGZvQVkzZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZhcTB0My8vVWtwVjlORFJCSFVDTTYxVHhIWEk0WDMvMkI4SEVkdTNuRnpS?=
 =?utf-8?B?MnY2MVU1Y1VZcHUyRjZFSnovbzd0alNyMVJqaGlNZU0yN0Jta3E5Um5MbnpM?=
 =?utf-8?B?S2VrWmxQWHpiT3l5NWlGbnlXdURkNlJrL3U2MTQyVWJHcjRzN3hJSDkvSGt1?=
 =?utf-8?B?TDJMdWwwRkZGeTlqRm1URlNFT1lTUC9WMUUvV2x5U3ZWMndiOUNvRTFpRWV4?=
 =?utf-8?B?dUVJNGEwaHVvbG5vQVZPNHpDeUN5OUl6ZVpkOEF5L0VJQUNwT3Q4Mys5ZUF0?=
 =?utf-8?B?NlN2Y1NyNHF3bVg0RHhnSGJ0MzNvR1FEcktoODZscTYxSys0cHVLTS9MTnlF?=
 =?utf-8?B?TSt5K2lwNnBXaW9ocWtqS3hDZ09zNmIrMXhmQVMvOS9YRnFHODRjVUsvY2Ir?=
 =?utf-8?B?blpaMnFvRzVYdjNiUUJJd0JzN1VZczA4ZXNENDZIYk01V1RPdU9XMnAxYmpF?=
 =?utf-8?B?WkkvVCtwanBpYm1KTGRuSnVSMUxsYTFkK2ZQeUFJZkFLMzZPdE9oTlhuUzNH?=
 =?utf-8?B?eExZeEl5ZmMwTHgyTlNzaWliN2w3ZS9YOUZxcGZxNG0zb3FxczZodGpvQ1I3?=
 =?utf-8?B?aHZkN09VZXhYYS9GMFR0QmdLdXU2NUJVdXoraS9ZSmZCRmV1VU1hWWZ0c2Nn?=
 =?utf-8?B?OVhtZE1kK0Z5U1lJRmYxT0YvL3Y1Mzkvd3Q4eVBwZmtJZXpUcDYwYzFqMmI5?=
 =?utf-8?B?bk9ud05TK3BTbzhTQU1zYmxPWnhESkNYWVJCTkxtZFFWSlZkK0wvd1FNckhM?=
 =?utf-8?B?aWFKOWVxZ3VrOFN5eHlwMnFoQzd6R3JwTUlRWVlMaFhuZTdPR2NTUDZMTnEv?=
 =?utf-8?B?bjc5aGJkckNSdFhnSVBvak5tZElvUkpHcFdrV2VSOUttNlVIM3pPRWZDUVJ4?=
 =?utf-8?B?ckIvK3lSbk5uZ3VzY3Y5U2pwd1RWN3BuYnZyWnRLbWZhTk00d2NEU05WQzNa?=
 =?utf-8?B?bXlyOTgyMXU3aDI3WWJmenVSVGU5cVVudFZVbElad2svcVZCVUtXS1RiTWxL?=
 =?utf-8?B?UmpWVUF2cS9IU2hGT2VFMVZjZnpsbGdaMVYyOHBDSTFoN0RNV2RMNEptK08w?=
 =?utf-8?B?WjhKMEVzSUJ4clE5NnhrUTZMVmY4NkppckdDTFZEMXhmLzB6SHJHTE5ibTNX?=
 =?utf-8?B?dDdYOU5oZ3Q5d0drc0tKaGtpRXFSM0dIa3JYdzhNMzdjUVhmdlZuRVFMVmxC?=
 =?utf-8?B?dnY5SWJDelA4VU4wKzhsdEI4TjJsaUxKajQ1TFlnVFRpUkQ1UXplNGFkcnFq?=
 =?utf-8?B?T2JJNEhiUSt1YThkRW80aTJUc25TZkJDR29NM3h3eDVCSHhxb0RzeU9CcDZJ?=
 =?utf-8?B?QmpMbVJRS1VpU1VYNk81SWJjOXlFaTlIMVV0NXY5Qzc2RUs0OUNTdkpJQk5N?=
 =?utf-8?B?RjZUTlRkYmVZZXRCVlNuMStSZTVZRS9SSUpFUmVUMnA1VHptMWZCREJ3dEhJ?=
 =?utf-8?B?SFExTzVhZGJvdVNFamFOVkRaTWsyV1hyaW1pc2ZEbjFLbldMQlgyeGFXdU4z?=
 =?utf-8?B?ZHduM2ZrSS81a2xCaVBwanRNYjlNNysxaUxxZ0FhcFJGa0ZKNVlXSFhEdlhL?=
 =?utf-8?B?NWZxLy9KaE5jdTFtVXc5bXZKbnNtSTI1S1FrQ2Fta1Z4WUpsSk9UYUs0TmZN?=
 =?utf-8?B?WUtvMEw1WlNRcTBoYzJZY2dzaHR0Q3dRNytaZjVlTVNBWk9hVEExeFEvNXRQ?=
 =?utf-8?B?eko4a0oza21UZlovT0JhbThyWm0zUWJsa2IwTE9pS09DYnNkaEhDLzBkN3ZE?=
 =?utf-8?B?SGxtVzZtTDdGZk9KZ0ZNeHRNdXFKRGoxZVhneVR0T3ozMW9EYXhJYmFHZk03?=
 =?utf-8?B?bXRqRisyMDNmaFFtMXVxUncxdzRieSs1ZDlGbFl4NjZYSFVjTEw3aWVpUEly?=
 =?utf-8?B?Mmw1Q2w0Y3lBc2pXd0xVbnUwNUFFNVVQTW52b2xNQjdJbEw5L0lKdFdhekFr?=
 =?utf-8?B?aENEczB5L3VsVWdkVUhmaEhZYXpLY0V3NEVOREhlZEE1bXlTZ21HeHNlZjJq?=
 =?utf-8?B?QUpsb0JXK202Y0plV2Npa09RNmVUdmRoRThEWVZ4UFh1Mnh6MkptRmhmaWxa?=
 =?utf-8?B?bUFwYUdHNkw4Mk5Xa3BUL1lKZ0tPc3V5ODNvam1RbkpvZHluelRaZmExRHBk?=
 =?utf-8?Q?ntpo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ff2289-6d8a-417a-4aa2-08dd45dfc8b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 12:22:40.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu/v6dip8lMGLbJpi7dhTW54PR7DJD+S54F5vTJUxAvIrzmXakYT5z1dt0Il5NFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835
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

Am 05.02.25 um 12:04 schrieb Tvrtko Ursulin:
> As far as I can tell some removed prototypes were introduced by probably
> bad conflict resolution in
> fc58764bbf60 ("Merge tag 'amd-drm-next-6.2-2022-11-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next").
>
> Remove them.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/drm/gpu_scheduler.h | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index bc573ee8c2be..666968cf505d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -581,10 +581,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>   void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>   void drm_sched_increase_karma(struct drm_sched_job *bad);
> -void drm_sched_reset_karma(struct drm_sched_job *bad);
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
> -bool drm_sched_dependency_optimized(struct dma_fence* fence,
> -				    struct drm_sched_entity *entity);
>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>   
>   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,

