Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3C6B9586
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 14:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9C10E7D8;
	Tue, 14 Mar 2023 13:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CF310E17A;
 Tue, 14 Mar 2023 13:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvIYxNWL8MylPpaeMGvVHgkapAt0bUvfPe2eU+xhQCTYP6n2Ga6u3CftZiCM3tkS3FTr0P6afMRULKPquXj8K/S4l89ylftMp6unN1lymPxPJFCeXIzaBKjat7JJ8D5AYmIIdWKmCR8h9QdMSKTOYlJOWHov+JUAbgT57vV2vn3DIHMA7Vr253lwRrno/257Tha2IAWuMxNl45TQS9HNCLdZN1dzC+/xFPqVz7vmSkkAPFNh9Xb7nW3IKecUvYmMJtObn9VOZrdnx+MYKJNYOxe/H47CntdnSQLLByzGxO+EEpmJGDRA0s0hbv/1EFWGfp1E3kQD7DqkEbaIXQxFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy/kl5XTz5vVfTpuKvbZ0ccTc8MsZ81xw9RC6nq0d8U=;
 b=RxcpZv9K6Rb/OsrUBknCUNMIfQzxj3AFP47WxLDVDiCW7JzDYcyhCmdNXps+dBxEJADBvSPnUQoEOSBYrf5N2bN9f3pY+uswBZSWmCWzaB0xefFlFAqiKRhrJk4IgKztSyReJP6QaQl95RCxaB+g2GPeLBRo0mnbukjke+uhJwaW/FL3CW3wWzc6D81pXKCBtMPcS0RMPTeLSia2yWnAEDNRUdNa+HZvjC9l2Y/ISqhu5jW3Bc0HrHd5gg8Z/IiIkShSCjX2L2KJcNDCm9pS14hgNvblcOCo6GcsvFTqvMqp4QfXgpHUfEDlOohA6BR80UJ9ezanPBRD1Qf7wVxZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy/kl5XTz5vVfTpuKvbZ0ccTc8MsZ81xw9RC6nq0d8U=;
 b=TqSwD78zCSNqaZdVidO6gRm0rgsGe5+RVNraZ5BIAPjclYawKSIZxiQSzryeY9Ybza0JVHHJaNRYPgLI4vNOKxQFRBXDBRm5EY7KARxuF/4UNdN3+2Gjm9NVph22XnOCfWMOzCRDIJynfStagDek/uo3WHZeVECNE91thnm/xNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7383.namprd12.prod.outlook.com (2603:10b6:303:219::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 13:08:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 13:08:14 +0000
Message-ID: <b14b8827-7d09-c37e-0548-a30b14ffe64f@amd.com>
Date: Tue, 14 Mar 2023 14:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/radeon: remove unused variable rbo
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20230314130616.2170856-1-trix@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230314130616.2170856-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e91a1ea-4736-49a7-69b8-08db248d2b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNH05qPkhwoe73lrz/tjdJPHDZL3g+CRjqK5EBAZeAjD61FDa255p6bQWLH2XK9PmEaZyM5s3bzYQEe2uK6FoEHKPZlM63OF8d+cxUF4StiF9e+NcyiLIdC+VCJoWXgwIMjhDxStecm/WzLGO7v2yT17iL0rQs4T7oVlhfljOfSMloZh9GLVSoQrM1bRp8Jp80/TLcgwtCvt8WYyVQtSLniiK2oZie/87iSsC33tJQUmLYxyz5NYGVTIPgtpzTDy+dmgtvPtLtC95UQ8GWjmOyWljGuV/UP0cZN6pkREF0FhPdXuf9ZDVyTeipzAY8tfpjFM9mnYFY7aHe8wSB4flq4qAA9cEcQV3KS/AqZepoRBt9QZIUcqk5pRv+49of/g9vBLH1LLQu8DOo5X6cUp72NNtPWyZdSB/5Krb/mNdOHL5oSd4AkCdarVTHQSqo9dcBbByrQ62iDqjrEnvBMKH2ZTWdiTp9Z/9G5nLL6tAiqwwh4lnhXPNMujzggmRJxM9mIdlpsg0WqSgPEqoAmqyAU4DN7ZRiH3BoUghAlUnwnC+ijHrEMsFduUWO/2lPpZFBoWzEx7tsM4YaYbkpjzcrcwRogzreT/yOt34l6a2SSBqEhBz/MXpBk/gwQEshc/ZONt00twHBpbDLN+mJLnN/XjiNafEeCoHX2wZuapEn9iVxkJALWoZ+iPbuO10ACduw49IUmnqW9ljKKP22ItuGykPjnOoVBpGzA8eFSl3Wg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199018)(36756003)(316002)(38100700002)(83380400001)(26005)(6666004)(6506007)(478600001)(2616005)(186003)(6486002)(8936002)(41300700001)(5660300002)(2906002)(86362001)(6512007)(31696002)(66556008)(66476007)(4326008)(8676002)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2dtT3N0TE1oaFkwdXloT0loa3FjMU9oTUdtejIvbGY1M1czaHVVWFZnRnNR?=
 =?utf-8?B?cFVRSmVQZm43WnlnSFFjdVNoWGpuRnV6Z3hRSFIrc0Q2dGJaMFFyUG93ZHY1?=
 =?utf-8?B?UkhtNzRRRlFEZXZScXNJdlRFL0FGRHloMmR3S3lTb2orbkdEWHRKR08wS2J4?=
 =?utf-8?B?OFByck1iTFRpdDhiTGRRTXRlM1NmTjgxT2V4eGN5Tnc3SDdrUkc4OG8xVGkz?=
 =?utf-8?B?QWxnNFpMR2hoWjN1Sys4TkdGa1l2bGx2QjhsOEM0TGI3WUNsamFvSzdLTzdL?=
 =?utf-8?B?ck4vUWhYbklCTHdMdTVqYWFZamtOME5ZVXJsZDVhYUNoNGZwRjIrMHpzdVhz?=
 =?utf-8?B?UVAxZngxTjhNeXlKSnU1c3JmNXhab1ZPYkh1UTRPd1J4MTQzclpGdDh1OU9F?=
 =?utf-8?B?U001ZXRBS29RZG4zNDNMMzJxZlpqYUZZZDlPbHhwZE4vWWF3aTFkV1V2Yk81?=
 =?utf-8?B?RVZCQmFtUU9Ha2h5MTUxUG9sK1hYUmVadzM1d1lRbjA5a2FhMDEvb201RVZx?=
 =?utf-8?B?Mkk2V25LTWczNzBMSGNJZjB4TFNDcnNkdlVBSG00OXVJNUZGV25qQ01yT0ZV?=
 =?utf-8?B?YzJQWU5oTUpVU0NKNS9LVkRiUGd6cGFmenlDUzRybXNVZXR3Q2laU2FKbEpB?=
 =?utf-8?B?WTlxcGV1ZnhodGtBRExZcE5PU2VnaFFWZTZwbUJudlNyVWJkd3d1bHlLWXBq?=
 =?utf-8?B?VVozcDgrdHZFZmpQczhmd0FDUTVQem1raWlXQlhTWkUxcEMwbWZuK2Q0YlUz?=
 =?utf-8?B?eWlQbVVvSkVyUHZtNkMvOFhIRU1tYkVLcS9WcDEwZTEyM0FiSXFVN3Z2VUxj?=
 =?utf-8?B?L1dRZFNpaXlyNUFEK3dmZnMwUU13MTFkU2lEczJRbHRKUjRTN0N2MzJGd3Ix?=
 =?utf-8?B?VmZTQlpLWEZnVC91RzNRayt6T09vSGI3Y0NRenZTOGpNeXR5L0loNTVKd0t3?=
 =?utf-8?B?d3l4L1ZXcWgvWnZGRU1ScmI2OGNyOWpmb2ZhR2ZwNHo2dWFOU2NXdzhOZkdH?=
 =?utf-8?B?TjhId1ZDZGdZRkJLdDR0Wk91QnFWNWNZUHdvaDFEVEJhbVk2WVZsdGZKUFlE?=
 =?utf-8?B?TDlmeDN3TlFpcnBGOHpRYm1WKzlyTnp1ZVA0N3FLRkVPMkNheE5QQmQzQ3pX?=
 =?utf-8?B?WS9Pc3J2cndvaTR2VnBsbzlnZ095SjhHZk9NSmhiRnNUdG1jYXhTdkMyaXV5?=
 =?utf-8?B?eXFhY28xWVRhLzZqTmxxemp5M09jd0NwZys4ejdualg0MDRqMVRzTEU0WXpV?=
 =?utf-8?B?dEtNTXoraU1HZzVMTkRGUlNJTllhRmJWQ2tWOTNjcE93SEJjQlcvUVV1R2dz?=
 =?utf-8?B?MWRRWTdROVcwV09YelpiUC9GL1VWbC81ckZoT29aQ2N4RVptbExabG9JenRR?=
 =?utf-8?B?T2RUN09qdnJYRGplcXlZNWtlc2hsYjVZYk9JT05uaUdCSXV1NEIvTW5GRC96?=
 =?utf-8?B?bmpUaEVjZ0I1NDlKTTh5WFBZM2xGSU1xNGVreFAvSXNYWFJoT0lpR202MFNu?=
 =?utf-8?B?SXMxSUhpcXJhZ29rRTlXNHdIMUlxN0dBbzRCbytJc2FtSWUxaldLTDFYS0N5?=
 =?utf-8?B?V0VsbFdsUklOUHQxS0dzU0tRU0x6L3ZSMzN0ajRRb3ppL1RReTRLVytDbWUz?=
 =?utf-8?B?VmgrYTlhVHNuQy91OTdoY0pWZ1lxUkdKTDljWThXRWxZT25WVXpZbGJPOWd5?=
 =?utf-8?B?R2wvakhCbVJ5S3hvSjBHQ0YyWTlrd05rTWp2KzlZOHJSSHd1NStXVzNwWW1r?=
 =?utf-8?B?T0ovWHNxbFFkNk9XT1NocWNQRnBLRHVsL2VGTTY0Z0xuazZyemtHRkE0MmVx?=
 =?utf-8?B?R09VL3JkSmNnNlVTbmJraTJXM1FDRnppTGtoemV3dExSdm8zVGRnUUxZN28y?=
 =?utf-8?B?NWNEaDdxZVRaeE4vMHlHbVFqQjVMZkRPK015RURtWHo1cFRpQ1liQjNxY1pu?=
 =?utf-8?B?MytzKzVORUtmOHQ5SDE2dzdReWVpTlVhK1JBdWNXWDAvb3BzNmFydllnVzI2?=
 =?utf-8?B?d0Ztbk45cTE2elN2VURmdHZmM015ZjMvazNFUGUyZjdFQmZ3dkR3N0srM2lZ?=
 =?utf-8?B?QWFaN2ZWZ2hVZW1UTXZUcmdjS3FrY05FVEpWQmJGblR4WDE5bDNtUm5ZMUtM?=
 =?utf-8?Q?tsgvGm84UXIfguK40NvKzVeKN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e91a1ea-4736-49a7-69b8-08db248d2b86
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 13:08:14.4774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyjEUqgDmJlCl+d1oeE6h72mkiwLUcEqjZkIu404uAZpuONCX/LVa4CqULYvwGpU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7383
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.03.23 um 14:06 schrieb Tom Rix:
> gcc with W=1 reports this error
> drivers/gpu/drm/radeon/radeon_ttm.c:201:27: error:
>    variable ‘rbo’ set but not used [-Werror=unused-but-set-variable]
>    201 |         struct radeon_bo *rbo;
>        |                           ^~~
>
> rbo use was removed with
> commit f87c1f0b7b79 ("drm/ttm: prevent moving of pinned BOs")
> Since the variable is not used, remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_ttm.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 2220cdf6a3f6..0ea430ee5256 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -198,7 +198,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   {
>   	struct ttm_resource *old_mem = bo->resource;
>   	struct radeon_device *rdev;
> -	struct radeon_bo *rbo;
>   	int r;
>   
>   	if (new_mem->mem_type == TTM_PL_TT) {
> @@ -211,7 +210,6 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	if (r)
>   		return r;
>   
> -	rbo = container_of(bo, struct radeon_bo, tbo);
>   	rdev = radeon_get_rdev(bo->bdev);
>   	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
>   			 bo->ttm == NULL)) {

