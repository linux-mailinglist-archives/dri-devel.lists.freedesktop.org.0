Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC73FFA69
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 08:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA72F6E842;
	Fri,  3 Sep 2021 06:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C72E6E841;
 Fri,  3 Sep 2021 06:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJCQvocxMfZgSqEUiimZ14AvA0YoABIewoGqj85/UFammDVDkNedIBk3edpYJLKt9lS754UOl8EWF2v9qPDxM+0Y4JoW6s7d4pzLqvfgWowf9WanVlrerJX3KbDesVoslkD+dRkOYtiIPhgS04z92cExXz1R3RR5pNlGRlKDnwEV8GMXhUP9lxnOonKcUQqSXITPRKN5NCYEiqp8oPkWxl0bGUEh2sMWrCLur7prAgsyHKDgqlTEwdCDipfo/UnXQLfppz1pn13rw/QyYXcl8y6Oh0Ab7af2/zU1OxbdGRqNfdw5/6eUxs5bfbdUmFSWRCR+x6QNpPAKIfJl8Sz2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+lkZWMtoFBd3kMTrb83z2cjySlv6x4BTX3yOeofvqrg=;
 b=Ta5oQyDOeHIabgjSgyiKe0zesjXj1JZ2+TeNZqS7XpqY8gWuXk4hBZOTyQoHWmLS0kG8pvJCIcGPEVmzSS5p0ww9syfAiCjgA7+WOGu7hsUvynNZWzxIZK+R/k5AZKiSbnXhp7nrSa6zMWk/Jmu8NgXitw+yNzlQWIE8RaVowEk2JN+SGQBJK2h5tzeAzKtmDSVgoPRZOtbzNdi7L6NLtHoeywaPOifrIoi7/34byV5g4gSYTUpPD302vEllaqRDYehwxWxIJYL0l8Ypft/UCkIPRSGzYZ97kAD3ldfjE7Yja6Dm2d/iAAKIA46AOxTNgbGG8jacnfuAPJk3oPmI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lkZWMtoFBd3kMTrb83z2cjySlv6x4BTX3yOeofvqrg=;
 b=wBQpFEtMMLeOkMS4txKz5Q06Vm5Uzhmm50Y/OnARisHecAjtdnanJlNd44bwKPBNWzbSDZ/DImlGcq1vBI9ZQ8KGExpwmG0AVPiAlGN2tI2P1grLgLt3uf/FCaMoACt+x+pwRe6yCNJIkhie+z2t2yhJ+Eq46C0+6DUDI9sslV4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 06:31:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 06:31:39 +0000
Subject: Re: [PATCH][next] drm/amdgpu: sdma: clean up identation
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902215127.55330-1-colin.king@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bb5105f8-2ec6-e494-8764-3dcc5fc0681b@amd.com>
Date: Fri, 3 Sep 2021 08:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210902215127.55330-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 06:31:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2beca05-0d84-4ac7-1fdd-08d96ea47c77
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB455067470E56037555BC440C83CF9@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAcX42yHudV7e8hBpUdryXc3SeJUJSjFm5yu553VfMSIURAB61OTz5pHMV1+G13pr8a/HHBwVtPXqdUCvfHlOk86aO9VoK2Rr5r+qj2Q2049BGiJqzXtaioCzlivNiBFa4385NaZbVEJRUpS5+iJGKaDcTvKTN8sIqp+tRj2C97LCuXbazvV/rSG+MNzXFUVfc5Uj4IslI0jblJTxyBjJcBhXZl9tQMPzfCGvNm9Pb6Kw+TrvnVpKzfaglRCaGmZfPyOoPKRzA53frMxO88MxNzqSRvFLM4X+I2sxXN4ohusNRkJdLXGHdyUJdL3boeCxQfoKYkeCeBrW7YNPRhTAzHGIciwuSY3GdlMbLFuQKk6hlxvwdiki6Dx8SldgLxdJb2ceoL1+VjcyrCyxSK7aF50CpD7lNsZ0cO1YwuZSuY6wu/hVWaqUN1sQAuyNE0WwYi+JdVCch+KDhFHYCYgE0yhVQD33DoMztJlRebjncBCum8+hL0Xmlo+ET//vZ0SSR3vMHefbeYXQuJMKn0oKiKBbcLyk2KPPguk1Y+eObstf47PXDQdhiz4YlS+cE0VnlXvQavFUPZdcrhI22gP0V3MX9q3qNUbj9SqJjJQzpXa/YQvdxZgTEZQc8AHdYCSOkJWdRqer5SM6BIKaahMysVSHyO31z8FKSugSNRwYvvfB3ZvB8vYlNBQa6TGzQo3PoDPTm84bq2Kj9c0alqXnoaCHe8sibp9aCTdhcroQFw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(316002)(478600001)(186003)(86362001)(8676002)(31696002)(26005)(66556008)(2906002)(110136005)(4326008)(83380400001)(38100700002)(36756003)(66476007)(6486002)(2616005)(6666004)(8936002)(5660300002)(31686004)(16576012)(66946007)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3IyUFYwT2NDQk5ISlJ1V2N0aUZ5OTYvZVNnRjAwWU5kNUFPdGxHQ1BBR3pp?=
 =?utf-8?B?YUt3ZkJOVGJJV0ZuVG5BVzRWVjNEMGgyNklvVlhDU21zRXpZeDZDVjlQQmtz?=
 =?utf-8?B?OHNEVHBjYmJIZ05uRFdHSEF0V1ppNzVtcUFWdlhKMWl4eVRkU0YwV2Ixb0w1?=
 =?utf-8?B?Ylg2bktqTUNWc2lDbGdsMHpUUXk3NThvQklteEVkRUpFUGZhdWowNjFpYm00?=
 =?utf-8?B?eStmUXZHYUdIV2Rvc1FLU1VPSU5ma3Q4RU1IbkJESlF6M1BhYmNwSFozTDg5?=
 =?utf-8?B?SGpHMDU3VEFzSGoxVXhwT2pyTlJuYWo3cGdMZTcvRVdZcldhV1BsYS9RSUR1?=
 =?utf-8?B?cXFNaFJWdjJ5ZW1CNFJmU0poR09hT2RpaHZDSjUxdjk0YlBlSFdKeFE3RDRH?=
 =?utf-8?B?THBMaEJnWUlWbWpNRXBhclRXSlVub2w1V0FVUDhwVTBxVnc1ZVVxeWhuekRU?=
 =?utf-8?B?QUJjeDVrVkwzbnVYeGl2T1l4MFlJczM0b0N4eGs1dFBSZWx3ZzNIdGZ5U00r?=
 =?utf-8?B?ZTNHNk1sL1EwVXdmVlpodTZobG5yTy9YOWtnWU9KcjgraCtsckhhZ29JdExL?=
 =?utf-8?B?NUtqVWp0TGNtbnhVNlFwZ1FqQzg0aHdDbmVVRVpncXd4S0N2WnpUa2JTT2xl?=
 =?utf-8?B?TExHM3diWSs0ZTZoTWQwUkxpeE9qTnNQSkNFNzhJRHV1UHE0NVB0WUN0VFNS?=
 =?utf-8?B?MjlrL3d0dXlqK3V5SFhNUkFQbjFJM3Jmeis3VERycGx3Slh2VWxJdGVTY0pu?=
 =?utf-8?B?NXJnVFhxeFZNanh4ZTl5ZTF6cEFYc2lMRVZtWjV5d2Y1MHRldUV4QTBIb3pD?=
 =?utf-8?B?enRhRUtFQmhrZ1VEUXN3S3J6azk2YngzOStsd3BXak5mMmM1SDVlbVFIdTVr?=
 =?utf-8?B?MndDeCtpQU1KZkVPdkxqN2pmaG9oK3VGZjU0bCtQampyM1ZrSm1LRlB1anJI?=
 =?utf-8?B?NDdtSllxUWgxeldOVnNPM0U0WFg2aGNNU0RsbFJVZXJPVEpOWDhIMnV4Q2hD?=
 =?utf-8?B?UkQrZGYrSnFod3VzdzBXM0w1TVlqY3Q5SGt4bXpGdldEL0gveVRZUWtVdjcx?=
 =?utf-8?B?QWw4WHRQQk9MeEJZcEFERnI4OFRLWncyU1NpV2E5d0JScWJxVWRlb1ZSZW9Q?=
 =?utf-8?B?eDFLbUQ2MWNDajM4bUFEMEpoYitucTU1dHFQb2pKV3VmUC92blhWU0lSMjlj?=
 =?utf-8?B?ai9QaHBVakJNdDQwUmhqVzhqN0lwSndSUFBKT2twOFZUWmx1cXg1VTVvSXc0?=
 =?utf-8?B?SCt3WGpmQ3hWZlRQQU5kWDNtRmFvLy9iQnZLNko3ZEEwdllGREcwaG91NUd4?=
 =?utf-8?B?ZE42YmNVREpSYjQ5WVNrM1BQTHVERnRyMFR1TktFc1ZNN2J0a2FHNldSOFYw?=
 =?utf-8?B?RytYNGduejFJSHVsSEFabktaaDAwUFhvVzloV3pwdXBZNm5Ic3RQSWw0aFo1?=
 =?utf-8?B?aDRZcjUxUjhtdURvUmFCaUsrYWc0VjNYcmJMUHhlMW0rS1RtZHdnZHVubG9X?=
 =?utf-8?B?eEt5d3JObEQ5ak1YZUt2ZUE0MlVld3llcEJKbnBWalpoVGVNZy9pckdnUVE5?=
 =?utf-8?B?aVVRazNlamJ0b2l6Z1BaVzJqaEFhcEgvd2N3RE02N3Q5NkIzNW85VXoydFdR?=
 =?utf-8?B?MkFVZlNuR2xyaTd4MUZDL3dvTkRTeXhScnM2UFRPUmVzME8xUmlaZlBaTHdv?=
 =?utf-8?B?QlgzSzdlQXJpaCtaalFnc0V0YmxCSkRFeHdSY3h6Z0NpN2xKbjdkNnRnRHVV?=
 =?utf-8?Q?dbNqovR4j4rQpPmrDZKy8BurYQ8BSJ4Rdhif23S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2beca05-0d84-4ac7-1fdd-08d96ea47c77
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 06:31:39.3338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44PpZztBFGEHK4xtooMi4soPHG/M3SmOJQ0ZRC3+kcXPjwvosEheanktpTGjmSWV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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

Am 02.09.21 um 23:51 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a statement that is indented incorrectly. Clean it up.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 779f5c911e11..e4a96e7e386d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -375,10 +375,10 @@ static void sdma_v5_2_ring_emit_ib(struct amdgpu_ring *ring,
>    */
>   static void sdma_v5_2_ring_emit_mem_sync(struct amdgpu_ring *ring)
>   {
> -    uint32_t gcr_cntl =
> -		    SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
> -			SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
> -			SDMA_GCR_GLI_INV(1);
> +	uint32_t gcr_cntl = SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB |
> +			    SDMA_GCR_GLM_INV | SDMA_GCR_GL1_INV |
> +			    SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
> +			    SDMA_GCR_GLI_INV(1);
>   
>   	/* flush entire cache L0/L1/L2, this can be optimized by performance requirement */
>   	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_GCR_REQ));

