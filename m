Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D92B529A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905FD6EA80;
	Mon, 16 Nov 2020 20:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318DB6EA80
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJbwvHWkGCJfKi4Z8cHfYlBdEQP7HifxSlprTlcBShYvivQ8WXZnPRXN8mfuySIvkPEDSiZRfIUYn+GKTTK1bmbTBkU3vgCQNMj6ofsRvKrHmBg5aPQ1wmjI7M5Nt+grKgjM47woVOO48CPdKdand/GCf63GFAE9x9AitaVtcCqDy0fnkFX4guOHMPuLKtnl6LRQAlP4izot5fG1r8Ve7yKnNEPRe8PK+RAf5dIpTrh4zqB6MlJvIvgWarIjeDfMg2N3Ei72nKL/X6PGxeOxYxfjPOKvauCeU4RSvEH746JmUAtn1X/IL+TC2IWNMKh/fa/OKasQqhSjCAFQO4gLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4bFXctpIMV2aYyghfyoQXn2+z9lv1mn7dkt5fZSZM4=;
 b=MDP1QCNcBq/GmKT+j2qT3gtFxtnrBiXGDcRjgdqjzQjwkbMvVkeeEBJp0/bvOIXfOm9BQFvBnVE53J1M8JZYI+1EAR5H5o4bh1abt8jVZAggZQ2ew/tFRQVNpx5YSlKSsG7jESlgopPKsrewgt0uR9sRn06piOK3BjZjbR6kypR+2+wkL2UGDg5MaTXjhYE2ywOwGNPn05d37aBLOxTbwdc5uJd4W+e1iVq508V0hKC9y7HVR3cPClyykEZ2iI+iMql6HctxnNNGtkPL66our5Xa4zUcCv9INY83qAklBFLg5PxOvx4l5uJ1Fo0mnOCpNRCvAWnP5VHr8QJ4+ro20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4bFXctpIMV2aYyghfyoQXn2+z9lv1mn7dkt5fZSZM4=;
 b=KkAYB5c9J2kaPDdTrRanMRtB9dE77H8e/1SluWfVmkr3Cq2coezynpLOgmFOyfT67b1tGGRlYA+mWaht0l0OSZTcY1h16oF9kgBtRhYU2/i/Lrfi0/1jHjJLFL0wdv2HSxBjCSsOZzScXKqa2iGfw2XF6RTrgJets6DARqJ02+4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 20:32:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 20:32:32 +0000
Subject: Re: [PATCH 32/42] drm/ttm/ttm_tt: Demote kernel-doc header format
 abuses
To: Lee Jones <lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-33-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bcb40255-312f-8cdb-28a8-7ee2e6596f90@amd.com>
Date: Mon, 16 Nov 2020 21:32:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201116174112.1833368-33-lee.jones@linaro.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0902CA0015.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0015.eurprd09.prod.outlook.com (2603:10a6:200:9b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 20:32:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f02a96d-fa9d-4b06-db6b-08d88a6ebe68
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4961B10C0559D3EB6F65851E83E30@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TNrRD0E+QZUvnh1yjeH7yhG+oiHMAVCMUZHGCwdagxatxeCa//iCGdAEaCs4DQVVedgAEZfz51gjCPuGgFwlShbuM5SNxyeCKVGMUYnVjQVUpplS3ozo0e14GtmbIjK7CUIWamlvqafDa9XiZlK8w0tlXr+BryGvx8WrLAv1Yr2BYHNIq2ww6zjbd1aAqSSubUZL/UMih7hC0En7HIvqfFt+9wiq495RzVq5p8zJx7sp2rTz1Nf+G5PVYIT40P+2b/gpeH0U3ARhOVVAycpNdywpbr8vPRda0GcWovRdPdx7Frl38yjM64PRafGFLKYjjPEF3c0ROPWRCao4h2iDUP4g56dYvBJoQGNcefUT12RlYF9utpjZPGatEiicg50
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(186003)(16526019)(8936002)(6916009)(8676002)(6486002)(66946007)(54906003)(66556008)(66476007)(52116002)(6666004)(31686004)(36756003)(83380400001)(478600001)(4326008)(86362001)(2906002)(31696002)(2616005)(5660300002)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHlFc1Nyb2Rzak1URXdqakp1ak9WZUY3UWl4UzVucFB3cG1EbUllTWtpUTFQ?=
 =?utf-8?B?NFg1aDBwVzg4TU1qM05YamxjWVNRRmo4YUZYNStrU2hGeUY4UkI0ZGFkTUx4?=
 =?utf-8?B?bEVDL3VpRjIzQzBvN0FkMy9ybGVLa3JJUnhGNWJxOUE3WTFaRFhhV2FuRERu?=
 =?utf-8?B?ZkNrNWp5bnlrYkluRUdRM2ljR2dOQktkOUQ5ekJYUkhVRHpEdWpyNExocDFM?=
 =?utf-8?B?eG9QK0dzYXJGSDRaUG1kS0tLejllMmQ2WitCMXBRWDRheGN1YkxYZWN2Q1M2?=
 =?utf-8?B?NUIybEF6Q1FQTllsRUpJeUZFZXN5ejc0OEN0TXJMdHpRRjF6Q0YwYkovSWRS?=
 =?utf-8?B?ZGJyYTNkVmVVaDNJYWxCZVlNZ1RIRENNVksrR1Q2N0FmTUIrcjVCU25hbmt6?=
 =?utf-8?B?Lzl6ODRmc2ppcnROd2d3RU96dURiemVXcnY0Y29XMHE3ejcxb2ZUcXo2WDFR?=
 =?utf-8?B?d1dnYnc0U1l5VXJnYmkwZC9iRFRlUlBUQUhTeUFsNTAxbVZrQmNGTyttcVUw?=
 =?utf-8?B?c1pOd0R3TkhLM3VqQ05VekhQR3dCQjIwbGFYTmNhVXFXc2E3T0lVYUZFeHhm?=
 =?utf-8?B?QWt3cHpHbEJkVU5XWGVDQWpENEhDVDhleTZDZ25sRmt3TUxpaWQ1eDhGUzJn?=
 =?utf-8?B?VlR3Q0VTNVZkVEFNZTVselRMZHR5MmNZbkxIdEZDakRpd2ErOHdBMGdLY2xV?=
 =?utf-8?B?Q1JwTW1uVDc2VWNzVTN2bmg2U3JoeXYyRWZmZVVoYVAvSzYxTHhkQndyTjQz?=
 =?utf-8?B?NHRadC9URHBnaVUzS0lqdWNwTDVWTnZZb290UFA4NDMwdCtPdWFNRFV4NTZj?=
 =?utf-8?B?aGRHY29JTzRLVG11RkNrM2JSSjhMK3FTWnZFNlFRYTRKRGlCMU96em1zRXNL?=
 =?utf-8?B?Z1c5UmY5ZEsrTUZuckltanhkbkhkQTg1RmdCbll6MzZtY1VzZ015SkpqTW5U?=
 =?utf-8?B?U2EwM3F4K3pnM0wwTXhhWWludU5aNGdaWFhITjdpczdudUNTb205MXJycTlB?=
 =?utf-8?B?c1VMNWlhMVl1YStTcHd1ZFppNDlBZUJKajAwMGowQWVuSlZJSUFta2dXalBW?=
 =?utf-8?B?VGRya1o2NFRlbFhxMHliTjFGK29jWXFjS1ZDZnNZM0ROMjhWZTZNRXdxQ1d6?=
 =?utf-8?B?bXZ0bDVsc1VqTnZneU9KbC94N2NFam5wTGVKL1RleDhsbVFEOTB2d0EzTVAy?=
 =?utf-8?B?NERjd3VNOFdncXk1Wm5LZkJ2TmN5SGVpaGpMMUl1RlU3d1M1ZTcyd29WUitQ?=
 =?utf-8?B?c2R4TkU3bHNQYndQMzkxTjBzSVJBMkR6WnVsNHRFY0M5enByQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f02a96d-fa9d-4b06-db6b-08d88a6ebe68
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 20:32:32.8588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wWjupp4pH86lVf4z+wRO2KByrDaxM5jA0AMHTWv94e72BhzsEQSdcjrf0aBFsED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.20 um 18:41 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/ttm/ttm_tt.c:45: warning: Function parameter or member 'bo' not described in 'ttm_tt_create'
>   drivers/gpu/drm/ttm/ttm_tt.c:45: warning: Function parameter or member 'zero_alloc' not described in 'ttm_tt_create'
>   drivers/gpu/drm/ttm/ttm_tt.c:83: warning: Function parameter or member 'ttm' not described in 'ttm_tt_alloc_page_directory'

Couldn't we rather describe the missing parameters? Shouldn't be much work.

Regards,
Christian.

>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index cfd633c7e7643..da9eeffe0c6d7 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -38,7 +38,7 @@
>   #include <drm/drm_cache.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   
> -/**
> +/*
>    * Allocates a ttm structure for the given BO.
>    */
>   int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
> @@ -73,7 +73,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   	return 0;
>   }
>   
> -/**
> +/*
>    * Allocates storage for pointers to the pages that back the ttm.
>    */
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
