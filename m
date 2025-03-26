Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451CFA71712
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A7B10E6BD;
	Wed, 26 Mar 2025 13:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HfB+S4+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4B810E6BD;
 Wed, 26 Mar 2025 13:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDQAbu9StzMDF3ygTJH2ZhP7YMApx734wM0A/LVH0mUZZt9ipaQOkqZDkjD4Wq8FOfQQm5MShnHeDuG31wtz1A8hXsCQNgFcM9PS4NWn+1XAhPWoP5k2tzNLDa1yao5CWTnCVR60IW6BB8Eijrqo5moYFz/VBAjS/L7Cy3B/9X9/iw4HFmrjuYPIH6kDJ2BcR+iLNSphFd/A+aSu+kIhlF5BjEdct9pnJE5aiMFyMFTrUXF9LYpSynyHcY7j3lciL5bScn6q6diBpw7fiErRyCg86yHHWuLplEHwBjqCbZSZcASqvnxi5OTcp9tkFWtzCU+JruS2Ku7dmFKB+vPMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K62xCvMvu+m20ngsJc2enRmtWlVOJ56KFKmB6esKvBk=;
 b=RFj2iTsgUGYGgzFLKLE+StpVkaSvlhYhOPKn/twxszAsUXOUWXBVkAuvrrAaF4IPZ/vEbZQ3Ud1FnXv1MGUTuNVf/S3QSaBXTHcgvDAe1Up2/YuO9YiW59tdXczquAT+tRszo7/ZPo8uJ6/dxy8AVSdUVz2hRokXE63LyOe3HpNd2nMj1eTpi60HUnAcaJbStfrINt0ukP2zbFsRQopYwlvCMXlrmDQ6q9fzCXE1K70aTWsIIgahHgE1r3Fq4OBvEXZeG6lCb7SmzDl5Ym+Y8LQzFbO5kTn0lu/e9ZfnfxPJCgzvdkW1E1UOCgTt0QT/dse+pm408lPAxvlFtqUopQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K62xCvMvu+m20ngsJc2enRmtWlVOJ56KFKmB6esKvBk=;
 b=HfB+S4+g1a45Lw+pkjNCBlhV2yIFA4zTDLk7V9bhDlYNpIow1PWuTrr3LNz9v71dRkRBM69K3hFu0jFRDJV3EQnoBG/poDj/kPreXwet0+WCUAccPucGKwESKjmyGcDGGDmwt1eCSghhU2Q9L7I3vDl5AsiM9Y1OrigPIcpyBWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 13:05:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 26 Mar 2025
 13:05:24 +0000
Message-ID: <94eeb36a-9aa5-4afd-9ba6-76e8ace10122@amd.com>
Date: Wed, 26 Mar 2025 14:05:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: prime: drm_prime_gem_destroy comment
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lyude@redhat.com, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com> <Z9rSTkXlub-JZAz0@cassiopeiae>
 <Z-P4zQ1464SeZGmB@debian.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z-P4zQ1464SeZGmB@debian.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 88faf40f-0f06-4b7e-160c-08dd6c66def2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGlJZTNKRzZDYWtOZVJVbEthdytWcS93Z1BvNlY1L3RYMTVBYStDMEJqa0p4?=
 =?utf-8?B?Y3d1aUhzcURBaTJXVU1FQk1abUxJdlkxODVhN29ORWNPSGx0R3A0Umc4UXFW?=
 =?utf-8?B?RktXN0ErUm4yQW5Ga3Q2ODRPaWNUdmszOVA4WGN6OTF6anpnV3lyU3FiOTBx?=
 =?utf-8?B?OFMydC8zUERGZFJncGcyYjI1YlEzMWE2UEJaRGVQUFRYM1ViM3p4R2hjTWxq?=
 =?utf-8?B?MVRxOHJQQUh4UHVjbWp4MlI4STdvZjlSdEdRd1ZnbHJZT3gvUExtZjNCRUhH?=
 =?utf-8?B?ejlXOFFYVEhGMDE5cm9GYlpIQk16b1drcml2UkpMSkpPWnNzVHRDWHJ1Mjhk?=
 =?utf-8?B?L1pNOG5JUGNQVVZLTzNiSzBPNjNUWVYzRVZ4SnJKL2g3T3RjaEhxMmdrWVVH?=
 =?utf-8?B?QktmQjV1WUplVVJlQVUyc0l2L3pKQlpIY29kdk11V1RTdjFlTkhjdVBtdFNn?=
 =?utf-8?B?SnVtUHE5c2JGemdUbHNkelYySU1TTjFicDdSbnI3bE1xdm9DR2ROd2k4L0xU?=
 =?utf-8?B?VjM3aGNMdHRDR1FEaFFoT0U5YTh5SFNySk9TQzRZWWNVSkdyZTl5T09iZ1R0?=
 =?utf-8?B?V0NaeHN3a2M0YisrVkFZSlZaREdPUHlaTDJTS0p0Z0hYZnFWbXJ2RWZHQWpq?=
 =?utf-8?B?QnRkajJqSWdsVyt1VU1taVFXdDdhVEdEQmVUL3ZVS2dGL1M0cWg4Rkk5TFNM?=
 =?utf-8?B?bUs4enRqUjVINGx4QkNONm5PcFJrL1F0UXpTYjFSbVZ0V1VxdmVQKzV3YzYv?=
 =?utf-8?B?QkdNTnU1b1BvOThvaDRqZ1RKdXhzbStYUGszNDZpQ0xTNTZ4b1l4SnU0YkVk?=
 =?utf-8?B?U1REZVFScmlkRHBrQ1lwMjBDQXgwNk1SVW1zWFlHZzBWWVhHdmJaQ1Y4a1di?=
 =?utf-8?B?Nlo5cFpOSnhxdWhUTGY0WWluM0MzUUdMU3VUTnI2dUhFZzZxT28yczUrY1Jy?=
 =?utf-8?B?MGdaUTU1Tis1WGppYmw4Q0g3M3oxbFFpVXh1cnVMUW13K0dPREZWRXljSW1N?=
 =?utf-8?B?TWdJZFlMWWhTMEhkY2cxY1N2SmFrTkVQUk9CV2srUXc4cFA4blNibUNUVEFk?=
 =?utf-8?B?UnZYOFBXVHMwRUpyYXNTYkNEZmVTYUZLSlhZZnZFK1NVNEoreFpiVjFKL0lW?=
 =?utf-8?B?YXp4Y2I1Nmxub0pRY0NKY1FEL2oxVmtLRTM1T3hQd0krcnA5azROWW5JOXl2?=
 =?utf-8?B?REllb1RhbGZWMzZUQklyNjA2S1hXK0VnY2RZRnZCVjd1R05IbTVaaXVsODdz?=
 =?utf-8?B?ZE80M2d5SEErOExXOUlod2JpOEUyeEE3REJGNFpscHNESHF4L0Q0cWxuSDZu?=
 =?utf-8?B?cGR2aUJtZU1kZjZNQksvcFFQOHV4Tk1zMkFJRFY0T1ZIWEpjdGRSTXplbnB2?=
 =?utf-8?B?c0JaM2hXNDNxbDhHY1lXSGUvbVdjZjYvM3hFZ3N4RzhROXRMcTlLUHh1ejVt?=
 =?utf-8?B?QmxBOFUyTzRTM0JGa2FMcEdScGdBR1BlajJnRjUra0NpTEhoTlBxTnM4L3py?=
 =?utf-8?B?bmlTVHJZcFZLS2hqcThVcTM2bkloelR2dVpsK0F3cE1TaFFjT2ZMM2loSHVX?=
 =?utf-8?B?eTdEZlMwZy9EeHBSLzRtY0J4MlVodHVHUEtRY0JsRXQxeHNUOWs1amJPdXFp?=
 =?utf-8?B?alRFd3BQY2tBOFNxSXBzNDZQSkVwcFpCRXFaallpb1dyMCtqdXBrWHhBZ2c5?=
 =?utf-8?B?eUN4SWQwWUdGblJpUnB4M25QdnhoTVhBSGpDdDVYZ2RjZkNPRVpESHBXdFdD?=
 =?utf-8?B?aVgycXNyUFA1UUZwNGZVUGRmaGIrcWFYTWlydnNkcE9hSG5xeTdkRFNES01o?=
 =?utf-8?B?WmxLRDQvRTFMR1Y3c0FGUDkvbm1yNzdXZUlPcGtDSXczQWJ6UkNtNkxtb3BS?=
 =?utf-8?Q?/Gw0P3I/69kpa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXAvQytIZDR3TjQvOHBnSWU3OG5OU3dKLzVMYUhHYVU3a3RKYXB5NkEyNlR2?=
 =?utf-8?B?YWxZc3ZId1gxS3NYWWpISzdsRlR3SFIwSFFqU1Q3S2xESGJaWVZzVGt5TmF4?=
 =?utf-8?B?d3krUk4yRTFCTDlzaU41UFI1RjE5MmxsQVQ4QlZUbEV3Q3NkU3NhL1I4Q2xa?=
 =?utf-8?B?d3AwaXlNN0xXNlEzbnZxLzN5NllaNUhGY0Yva1ZBSHdsNDlaTWhEN0NVVHBS?=
 =?utf-8?B?ZmZvOEhIMDZ3eWwxV0pzS2xDcC9jZ0FrWVFQRGRiTEhIWTNZU0pYRHdlcmt4?=
 =?utf-8?B?Wm1IcG11MTQ3a2hNVDh1eGVYMnI1eVN1SzJXWWhRQUx1MGtRaUZyQ3hnRlI3?=
 =?utf-8?B?UE40Y1o4anN4eUhsNGVLN25EYVFnZklzYkttUzBvbVVjYm9qOS8yVFM2bFdF?=
 =?utf-8?B?MWxCMWZNYzEzeFc0SHUwdVI3ZTBXL0Y5RndCS0dnT2NzMXhFL1d2R0NsL3N6?=
 =?utf-8?B?WDlVV0dOdHV3anlyalBRYUtrSDladVRGSElvWk13cFFJd29NdmlnZUlVVWZm?=
 =?utf-8?B?SVVIMm9Rd3dOTzdVamIycS9DWm40WXpibURBTHZXa3VKdnBkNVdmYTZ5NW5x?=
 =?utf-8?B?SUo5bWZwQXJqc2c2ak9hbHoycVUvc0Q0ODNGZHY1TzY0ZElQS214TnJvSTZO?=
 =?utf-8?B?OWNBQVNoUmlwOVlyR3kyQkdjODJjcXBUV1FKUGdmMVg2ZExxeDJxalJ5cGlQ?=
 =?utf-8?B?RWJEQzdVRTM3TmpsT0hGblBSTFRrVEdhL3liU1Jvb1k0YXc2eDJCZkUwYUN6?=
 =?utf-8?B?ZE9xS2NUcEZRT3R4TkJ1UjdOc3ZBZXM5dDVvajhtQnlLTVZ2dER5Y05NZlhY?=
 =?utf-8?B?ZzhUVys3R0pmUjVJMUJKZWEyVVVWV2VvUkZ4YzZwb0h6NElyYW9VNXBSVXVM?=
 =?utf-8?B?Ni9PL2xCUkIyckkySUIxMlhrVnd4SU5mMUtsMC9mdFlXSlRhQ3g5TndibXo1?=
 =?utf-8?B?WG8zcHVmNjJvcHZ1VjVmK3k2cUsvSXdmV3ArOGVGU0JoQTBtQi9DWnJzbTF6?=
 =?utf-8?B?MWZJbkZHdVNCazBtVUx3aFNCVUNySis4MUhOQ3EwRGFZRTVPbmZFa3dId2Zl?=
 =?utf-8?B?Y3dPd0dHWmcyMXhPeDBEamsrOU5QTVZLblJvNzA5RTlqTXppZllheEo2VnlS?=
 =?utf-8?B?Wmd6MlRNSXNjLytqL3FZRjJQY3BRYVdtMkJ0ODZQOFppMnYrTGVZMDdyc1hX?=
 =?utf-8?B?dU9zcDdQMFpMUmNST1M3WHlFM1ltMERsS3ZJTjN1eS9EUmx5ZkthbzZIK1Jq?=
 =?utf-8?B?NXFmYmtpbG9mRTNLMVphWUJEaHdlWjJpeWdmWU5lTnN6V3o3VWFPdTZ0bUto?=
 =?utf-8?B?cHBtVHgrelB4dEhhb2Fkb2EydUJjQ3pOWjA1VmhRSk1RdXNuaHNxNDdyZ1l4?=
 =?utf-8?B?RTMwTS9GWTdUeDRFOFA4cG1lalNzZHQ2aVpnNXZlTXd0cVhJelFZWWtEZlp4?=
 =?utf-8?B?UVFMQmtKVjVlT3R6QzkzS2UyUS9vNGJvU0VyaTFrM1dMZVR2R1ZYdExzVTZ2?=
 =?utf-8?B?aG92R0NBeG5MQ09sUHVNUzdaRDFlQ1owQmFWRGo1eERJWjFHWXZyckxSQXZt?=
 =?utf-8?B?RWkvSVBTSER0YWJPeS9sSnk4N2ZIeEZWTThnVWN5NkZZWGpocXNjbFlKTm5O?=
 =?utf-8?B?cjJ2b1d5em0vUHBSTGJwdDhVY1RrWVZkTmVoWjg5eXVaOEl3Vk9wWVladm8v?=
 =?utf-8?B?R1p5d1k1R0ZFaHBwZDVXNHFvUDFvYVBWT2EyRHhmUis0ZUhDWUV0aHAwODZR?=
 =?utf-8?B?dENJTk1HSHZVektUczRwZy94eVlCY2UrL2VHV1ZwUjRhTWtma1lPWUlSRExW?=
 =?utf-8?B?dll1dUpQVlA0QVVtQmQrbVEzZUdNMnp2R3ZsK0JMTEtWK21mblB4ZmswWThU?=
 =?utf-8?B?cVJ2bkxVcDR1bEZqN2Q3eEk4S3hicWp3S0JhVllqZHVxUm45VVFmQXU0c2RT?=
 =?utf-8?B?blIvTTFMdHN6OFdUWHF3TjR4SElIUTJIQ3RHYVF3QkNXVmZ6YnZQSjBLUUlx?=
 =?utf-8?B?T0FSV3U2RGczN2VhUmw5azEvNTF4elZrem5JYkhZWWFQTzlEVmpFNmxUM1R2?=
 =?utf-8?B?aXFWN3Vob1JTcm1GVldSL0xXeEFiQjJtWTdQNVFuNjVBdlRPOWJIRTdvVlhB?=
 =?utf-8?Q?CxUByZtITDaNDAQgUGXRsg4pj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88faf40f-0f06-4b7e-160c-08dd6c66def2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 13:05:24.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COfvcCI1MYaFJ6Qk/ISXuUBNCKveloghM31OLPdA21D6i3wzcPRnWk16krKGeYqj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186
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



Am 26.03.25 um 13:53 schrieb Chris Bainbridge:
> Edit the comments on correct usage of drm_prime_gem_destroy to note
> that, if using TTM, drm_prime_gem_destroy must be called in the
> ttm_buffer_object.destroy hook, to avoid the dma_buf being freed leaving
> a dangling pointer which will be later dereferenced by
> ttm_bo_delayed_delete.
>
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Suggested-by: Christian König <christian.koenig@amd.com>

The subject line of the patch should probably read "drm/prime: fix drm_prime_gem_destroy comment" since this isn't nouveau specific at all.

It's just that all other TTM drivers except for nouveau got that right.

Regards,
Christian.

> ---
>  drivers/gpu/drm/drm_prime.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..452d5c7cd292 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -929,7 +929,9 @@ EXPORT_SYMBOL(drm_gem_prime_export);
>   * &drm_driver.gem_prime_import_sg_table internally.
>   *
>   * Drivers must arrange to call drm_prime_gem_destroy() from their
> - * &drm_gem_object_funcs.free hook when using this function.
> + * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
> + * hook when using this function, to avoid the dma_buf being freed while the
> + * ttm_buffer_object can still dereference it.
>   */
>  struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  					    struct dma_buf *dma_buf,
> @@ -999,7 +1001,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>   * implementation in drm_gem_prime_fd_to_handle().
>   *
>   * Drivers must arrange to call drm_prime_gem_destroy() from their
> - * &drm_gem_object_funcs.free hook when using this function.
> + * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
> + * hook when using this function, to avoid the dma_buf being freed while the
> + * ttm_buffer_object can still dereference it.
>   */
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)

