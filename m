Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9C6A089F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3362610E204;
	Thu, 23 Feb 2023 12:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2C510E204
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HozNDxSI97Oc4tV0WbC0UyDQYOmrRbflscZ2liEroK+pSRWo+UYHZYQJ+8GYGITv+OHybb4ISYOBzo3KQ8sG1BpSdj8S4e57z/O5uZNSW54kqFy4peomvsW0/LqwVWmqEgG9C2Q5zrYWFF7IJWOIaroONYj1mhlKXk5OMVlIvog3y0dCT5xkAKou2AvOSFM+Hojr+Tvc17/r2A+PcWSIfOJiGzFUNxX1QnUneIgdv7cGHamh1Im3IA7Axqr0Hln6vKIgAOOKO4C3sMTCQ55gf9EjZfSlvxowq4xYTL57IOgq7yriSMlgpMXtCKt7/hm0ljK9mrIOG7F534h0AGeBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK9430EiIM3m+P7HTA0aKcZN//kqAtM4w6gX/ti5ryQ=;
 b=RDQGt7GBi6e+zCogzvftck2azFFXC8wog0HuqTovQMkposgywVD5gn1MzCWTQtmJCgAi980GNPWSXwfnOrvLBtgVYyNb2bVxACnCuCc2gafgEMP2c8QZ4lAkiWX6vrkd5Qcttg0zZF96JxZpHmgaXjsQnDRmZMCt1r3OdkPLpFe+xCZzKNVwdvPMzg/Uc/FrHWAbUjobkgfsSZReE4ugZ9O0Ant9aW1x4teHwlFQrQquzXeCY0V3PWojj43VkJpmoqm/KIaJE+odjCdDh1CEghFNqYPKZ0y4AXrXkSd59mIZrZm+eLny+bs6gGQMmpABIX/vRmVxbY2Omw6vgMB9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK9430EiIM3m+P7HTA0aKcZN//kqAtM4w6gX/ti5ryQ=;
 b=ONThDYuCO8pheNV2QfxyhkzzpQIJCyEFs6Vs03rarnekJbma/I6/FErQkv/eO+dPzPh9FhrgFSWq+Qbe/3lEj2+VdfLIGc2ZPPZcmkTEOYK5BrpSt4L/iXoZEd2dikGZHnYuokAsuLvtGRM5XeGceS7I5gkuNxvZpJ/CQBlWjN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7468.namprd12.prod.outlook.com (2603:10b6:303:212::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 12:30:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 12:30:07 +0000
Message-ID: <df032ad9-d9b7-52ac-1c58-132714676953@amd.com>
Date: Thu, 23 Feb 2023 13:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dma-buf: Include missing parentheses to documentation
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230223121909.149980-1-mcanal@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230223121909.149980-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e89ec3c-0564-4e93-455c-08db1599b266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCU2aNuDEwq4HMd5XerU7pEx/T2sJPcc3gyQaiQF25iq2nJLKKD1h00AuEr5D40FqKseRWUxsEBjTtD3zJ6uYbeIvJjdMLCWeqFcUQEJPtO6wbMEwtym4nJv8GpEhyDctcQcPtJC5+jrZu+m2dlVmLhLLfmk+pt9Ar/7zXLl5CMUij7XMTmh/Xd/iWTn7uptebygOvTCT6/HNM4qWaO5zYVXouwW6+lElUKJ7yK/e7RrmSkGc7u6e3nLNWSxEkzDy/yJXPytJFKx/asJ+03qrEw3nONw0MaRIXwmScTV7u5Zef5RKJa80nFRs2oIvrKCZswDiWrnmEWo0ihHbJszJU1jbUzqjrPCvbb6H1GM9Lg6+55yy0QVzYXe/KKe6GaEzC3fO6/9m1XzP2h/6ij3Wbly5Fxg3cvvn1BMi9F3yGbcigfer/aGk2W10cjcUZJEGdYirKbWFuIhalg1nLyMDr/kmJv81dtZO2TgkvklDtvCal6DVXSl1baqOhhCVdPNXYJnHwGlir/SFqXXEZcKKhCKxVkBG3Kjxv1TsbC4FdhdMOYAC2SGTL2rgjaQEECp/46iCermpC7YigZ8S4cLQAPOxAgf96qYJTc8WZT7sB+2+Q3YYnGb92K0rNK7DAqgysgyEu5qS0Vai032mr7hd/0KwDaLB4DKa3tuH1PtvKOMMNyd9QQ9F9a4LujywKLbGD+j2YOpFhubonBs6SlOg1PvbThE1wtUhPMEYg/WKBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199018)(2616005)(41300700001)(83380400001)(478600001)(31696002)(5660300002)(186003)(8936002)(26005)(86362001)(38100700002)(110136005)(8676002)(4326008)(4744005)(66946007)(6512007)(6506007)(66574015)(316002)(6486002)(66556008)(36756003)(66476007)(31686004)(2906002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC9wVWt6bjV2NXVIekFoT2UvMGx0VkZtMXhPalNZejNuSTZBQ0ZQOHN0R3c0?=
 =?utf-8?B?d1UrV0Q3VkZJelkzMWdTWm1LUHplRUxsa29hQkRkWVhDZWpxbmgwYy93SS8v?=
 =?utf-8?B?ZkRjNnpxaHZITDhnTldYTXJsbGpQcmN5Ri83ZExzQUN3NngrUWxqQ1FJTHVF?=
 =?utf-8?B?ckVLTThFcWd0aGdFS1NaNzczamd1akFoMW85U2tSeDJZYnd5QnVYQmE0YUVQ?=
 =?utf-8?B?YldmTUNFMzF4NU9hMmsrSlhieGszMFE4OERZRVRLOCtmVkNqQkw2VWU1N25Y?=
 =?utf-8?B?RHIrWENyL0kzb1ZBV1h0RU5JdW1vZWI4TFJXL2xaalVCTHpSMVk0L2xNUWYz?=
 =?utf-8?B?Mk4vT1FzR0UvR2luS3E5UUhuemJlMDRid3J3UjdCU1E0djhrdzVaQk84VTAz?=
 =?utf-8?B?OWxGWHpOZERLMjdhcXhrTWZVVnFNVGxZUXBUT2JWU1ZZMmZzTkVtTE9ibjda?=
 =?utf-8?B?V1VBUk1QYnRuYWV5bVRIQjFTMVdMSTkzT25nOGlSSGVPUElYdVI1dEtMQTlz?=
 =?utf-8?B?V3pjRHlUTjJJa2JvTXlDb0xsRnNJbk0vMDk4S0lkTExIaHdxRTNWRFhHcUVl?=
 =?utf-8?B?RnQxb1NMSlpMUU0xNXcyeDY2b1RPVC9URU0wK2M3WThKL2tzeTg5RG5GVDky?=
 =?utf-8?B?YUE2dG1RWUpkNnJBUlh0RENKMGhmT2wyQXk3NGZOMEJkZCtXRXdScWVadDFQ?=
 =?utf-8?B?dHFodVduODRTbTVlZkluaGZlYnNNWVhYa2poNXl5OHZ0TzVMK1J4NUF5Z3ZD?=
 =?utf-8?B?V2t6aC95elBIZWhtZHM5UHYxYUtDUGxjZk83U2RGdmZHVFA5SDVxNE5iTFp3?=
 =?utf-8?B?Vmg0ZU92QWpwcWsvUnREMkpFZGJ0eUFwNGpkRVB1TGx3SkUzRm1MbTYvT2Ri?=
 =?utf-8?B?Z3o2ck1sZERQbERSb000OVk0VXNMRTU5aFdKTFhGb3R6aFBzc0NydkE5Y0Nm?=
 =?utf-8?B?bGh4Zy84ZUVIUDZwaVc4UUl3M0ZCSU16d2NHa3ZWaGhubFIyR3h0VTVjVnRL?=
 =?utf-8?B?TkQzam9UTHh1ekQ2ZFAzdWJEY3p1N0hWMFNVZGdlSEVqV29PbzhxMjN3amlj?=
 =?utf-8?B?K3h5S3lYelY1OTJpbjFLUHdqaUVhalROVmVPSWZMbnF0TmFFYmxXL21mNDF0?=
 =?utf-8?B?Q2hrRkVnSjhITkI4QWpmNFljS2M4a05TdEVZTEY3VldhMmVBamxFZlBzMmM4?=
 =?utf-8?B?L0thaXVqSFdZWkU5d3V2eHkwRDQ5YjNCOHk4by9Ga25qVGdEd0JVNGptUWVk?=
 =?utf-8?B?eXhLWGUySHJtY0hkUFl6dHJQYkxwckNpa0xncWNML2hxcFYyMEFWN0dpam5K?=
 =?utf-8?B?b0xIRno0VENGZ3NDK1grQm40R1VGS0k1UkZQcUJuS3h0RDhNaklpUG1FN21T?=
 =?utf-8?B?cklPVVNidFNBYW1Od1phcTgvQWNUeUlDSmV3V1dSSTZzOXZUWkRjcnhBMkFO?=
 =?utf-8?B?VlczVGVDaENPMjNsZm42bnVLUHlGSHB1WU1IMDJTSlJnT0MvRTU2UlBIOWR0?=
 =?utf-8?B?Mk9SdmJlcS8yUm1zOURmdUdsaHpBN1FRdFMrN1FlZXlWRHJDUFJmQzBELzZQ?=
 =?utf-8?B?Wi9jenpVdDd5TjgxSTFDb053OSsrbURVN2ZRVk4zUk1wakdlZGtNTzVLWDZm?=
 =?utf-8?B?VnVyNDdEN1BGOXpWWG9RelFiV21QMVREVCs1cG5vSHRYeDk2RmV2cndHK3Ji?=
 =?utf-8?B?SnEzRG1BM0xUVTkwM0tWTzZ0b0xUbWd4OWFOL3plb3Y1dDZzNWt3bzNiYmtN?=
 =?utf-8?B?R3lYblBSSFc4UFBpR081RTZjZkJNdFo4K2N1d0JERk5tRWdVWUpRWWoxMXlx?=
 =?utf-8?B?bU9hZ2o5OVg3VjFoS0pzZlBNcDJNcy9nNXJxemVZeXp1dkoxQTJaWEdMc3lv?=
 =?utf-8?B?OUhwZE92TXRkUFk5aVZyMEozdnBRRWQrcWZBSFRjSDJDVFJJSGZidGkvd2FJ?=
 =?utf-8?B?VlkzVy9SWnNGdXFaNDVOcUFibWhSUDYwamVMK1lPbHFqNlcxN0I3eXUwTS9D?=
 =?utf-8?B?blVnb0I2MituRnJ5T245NG00emRtY1RYMzBPMEY1SGJjMGpqSTJQTnphaHNE?=
 =?utf-8?B?RU9HTHhPM1laYktLNVE4QzhGb3k2K0Z3MDJoTlNTd2ZQSmt2RVRKTTNqM2Y5?=
 =?utf-8?Q?nBVvXx3Bc42qTwKJ6bSCnk4rw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e89ec3c-0564-4e93-455c-08db1599b266
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:30:07.2627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6pHkx65V3kRl9lHa6X5GeAb5nhP9E6oAAlvRE2KR+yC4IuLB+GNimhV4Y/Eaqn4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7468
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
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.23 um 13:19 schrieb Maíra Canal:
> The missing parentheses prevents the function to be rendered as a link
> in the documentation. So, add the missing parentheses to the function on
> the documentation.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-next.

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-buf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 757c0fb77a6c..aa4ea8530cb3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -828,7 +828,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>    *     - dma_buf_attach()
>    *     - dma_buf_dynamic_attach()
>    *     - dma_buf_detach()
> - *     - dma_buf_export(
> + *     - dma_buf_export()
>    *     - dma_buf_fd()
>    *     - dma_buf_get()
>    *     - dma_buf_put()

