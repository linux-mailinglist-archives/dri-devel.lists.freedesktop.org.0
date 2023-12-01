Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8978017E0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE77110E999;
	Fri,  1 Dec 2023 23:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B789510E999;
 Fri,  1 Dec 2023 23:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q679nbjXCRvoWKyAq0EF3+i4CzpBBwyp0HZ7U7GC/AS7umiTsPEkMLHv5VsrbRfZFYeITo2qImdZwKvgw/gi7a1bbx0qO6k2gZXZ9DCGa866DzAmzTofLnBpI/6ODu/ViFw4RsIZ+aDd4plsj5MvRrGUok4cdrgKwZJmc+l2u3XQXFY5Lnz2mb5QFPW/vOLLnDUbEltMe3fxZqU2dXtfDZAUItVA/cMpAhEfTOBpsVcBXRbTx1A+pyHDlC46dl335t/WzYVOPBybMtjuRBjaJUrrlw4+DcyzOfC1H2npmUge71ZiCKv/APoWhRTtHbjU+COKw3l48LMMrxEdhbCWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz12fRqrcHmwi56/p6/sgjrTZ0/cxs3aQbeMD7hDIZw=;
 b=I5fJ1aRKbL4banQimSYJkN5NGx0Am+uVB6aDbk2dyio+bkPhBA9gkvShduIGUEX7jV9Wavi6VleSseF0Nzx1behU5cINJx9KfbeIaMKs7pWmk/+6Pvc1OJ+5Lk2qe/Cmbl5sXTWJJiXeeojy9Sy/L9XlUdF+0s7wY5/73KlZZf7Wtgu2Qzj6D0vgmu1XeDn6MILFz51UWtOAUoXVn/ywt8pt26tgabOInl+Fje52hzxLE6I87M3Aisx6NLzcxqIyLx6C/KgsEeq/o7A3AEpIsh1fP3FwJecJ5wg4fMYRjxV8bdi7wujMnrOR/q3LeI89Jp1JUKMev6TLS+EBN4ljqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz12fRqrcHmwi56/p6/sgjrTZ0/cxs3aQbeMD7hDIZw=;
 b=0GTU+7LGW4AUp4rnA2sv2eRFfJiLnnLiObQsxE8vvpWVPufgNodCQG+Qqj4tMLYZD/7uSXwPEyrcVJDY8dwejZVelj/8TyIEo15GebfjPSw8WE1yAstmTpKMJMzyI5RYUAkgluzLC8Dec6uRvzOeZXC1xRBksxwoMZ3JJwESawo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 23:40:25 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 23:40:25 +0000
Message-ID: <408f223f-cb86-4ebc-b1db-26be0a964bfe@amd.com>
Date: Fri, 1 Dec 2023 18:40:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 35da113b-9fd3-4f16-4e40-08dbf2c6e482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Af+U6lP7DKe7BXnlY5vRf8ZNz8RraLlOYsZO0AZb281LArqFjXmQvPGvrN+L8bWKfBv08CFMGAVIrfRqCX9MNpOAKXGwe2CP4ospJyt5+AGAAmzIbVssy+tdZCpgP6n2nfs9ccUQ0XcV3fZikXWs+Tebr0YqDaB1O/7P0JQdeDpgGnXeSJ9aDmaBlWqhUGebFpNVRSAO9rO4sCacFFz3Xzw1XwbETz+yrTuQtCdiKWpyYA+W/S6pPImGToIS1tHdmf3lxU9xbUZq/Mjug4kNhxUyZ8NJs7kFOJQ/C9FtTPH2uu2E8jBrxHIKE8lQfr/4U6e9Gi14aQLIogqzTDwA1Fdh+nCM4gd5P5w5GSSGWWs8C6TnExugHzbM+piDsnziFoIMwUg8QpMgUnuV8Nfzaab30M8E8gv1GSGflcT12AnhIvkSDOjdZpcItLTK/FMtXvXWPju0ujG1meHR671VLZQKkKGmMsb67boy+zQd3AAOuwDyx6LFhQl9QP2Aw+zW+WWfYbX4e+A/f4QCXHikFYnbcxvH7Tb8nQbFy2HjSETf0YOWn5Huy0RexuEoD4hznlwxLjdM68JclMOMY7Tp3ax/WgUcSNN0hO+2LHVkwVtsr05aEGOBVyDNIsaRhlGd1s2OP4Bl9LJEty1BVc35nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(6636002)(66946007)(66556008)(66476007)(54906003)(38100700002)(83380400001)(86362001)(36756003)(31696002)(66574015)(6506007)(26005)(2616005)(6512007)(53546011)(36916002)(6486002)(2906002)(37006003)(316002)(478600001)(41300700001)(5660300002)(6862004)(8676002)(4326008)(44832011)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d21BS1pjT0pPYXppa1R1V2d1ZTlYemNVYXVTeExLYndOVHNOT1hxbTd6T0dv?=
 =?utf-8?B?R2pMdnhvVjl0MHZ4VllwUjNkSERQSWRKb0YyT1RhSUpiMW1CM05TbVJjUTkz?=
 =?utf-8?B?NHFuQjhWUGhOdW9pV0VpZy81U2I4d285V1l3cjV3b0N4R1M0YTRjQ1BKZG1s?=
 =?utf-8?B?bytJYzBkbURzQ0lqU3k5TzYzNkUvUU1tWmV5K3JXUndOWmVzOCtGV1pnY2N6?=
 =?utf-8?B?N3R2bWFta0dnQStNMzFyYkdFa2Z2OUpzR094UmxZVW03OS9MWW1NM2tZK213?=
 =?utf-8?B?Tnd6cTVmNXpLVkVRMmR1eGEwcE94M3B4U2RRQmN4UmxOTEVQTC8xRmNoblM0?=
 =?utf-8?B?bzdIZ2NZQW95MWhBSEpOUTJtcjlEeE80TktjUEZNeFloMEpIYTM4NWVEYjlC?=
 =?utf-8?B?TmlRMXJ6Q3dYV3I4MG13VmVya2NqVDJLdmpTUzltVStQMXUvSEZ5c3dDSEF1?=
 =?utf-8?B?TStmOXdmYUcwNHYxaXM5ZmYrekZHWTdSOWhBRGpYRGNmSlcrbnNoS3JtOHgv?=
 =?utf-8?B?T3ErTVRMZG1WOFo4eGU0bGF0Y3lvY3VtaHBEYVJqWFcrZzV4aWVnOTVBZ0xk?=
 =?utf-8?B?NC9iN0dTLzZRRUpLY3duQ3NWczNqcHVtbldPY0k3akc1ejBHdlRPUklpWlFU?=
 =?utf-8?B?TFZFZzZqSitMa0RYbjU0TEJGV2tyVXJjT1Z1bHI0OXgvWFRLMEowK2gzb3N0?=
 =?utf-8?B?cTdCU1dVY3pRMW1FeEE3ZDRGOWtZa1ZEclhmRUpkWjcyQzdwU2tuRzg3dmFJ?=
 =?utf-8?B?Yk9TVGFoT1RheCtFZjFYdmhRK01xWHZVSFRrTzVEMEVNR2tweFNaMFFNMERz?=
 =?utf-8?B?Wk52elRBdzJVZnd0SmtqbTFFT01Ha25JaEdOTk5KOGROZnFjenVuSmtVRlpr?=
 =?utf-8?B?c3Y4bXhLZ0pYd0ZhSXNadzlPME5BdXVZMEVZREl4dTh0UHJDMUs3YksrRVVs?=
 =?utf-8?B?VjgvMXFBSStKVjJwVGxiQlowNnZ0YytHZTVvTS9NaERGb0g2WTJpeGJ5QW1j?=
 =?utf-8?B?aXpUb04wV0lHVUU2WlMyWUxuT2liVXpzdVRtRjQ3TjN6VmFPMU1pK3U4eW5z?=
 =?utf-8?B?Rk5yWUdGanVVUm1pTks0ZjJ0eDQxRXdIaDNjV3N0VjlST1Zjdk8rT29SZHpY?=
 =?utf-8?B?M1h1Qit0MFdNRHJCakcwMlJCbXJjQ3JoMlNRbXRqU0VobWZBUGpqY2tyUkd1?=
 =?utf-8?B?WUJoLys5NnMvbEM2cDF3VjluMDBieS91THhoYURrOURnQWx4RUJXd3lRVXBQ?=
 =?utf-8?B?bmhOeVQyQ2NNc0N4ckFzQVJEZW9kZEhodXlyNUNzdUIralNJQWVkZGZSWUhx?=
 =?utf-8?B?dXdoR0lHOTVxZit3dGdNWmlvQi8rOVRIb0tYRXdzZ2RvNVJ1Ui9XR0FhNWFM?=
 =?utf-8?B?MWtDdDl4YkROWmFXcUljNG5ZZkZwSnNIQ3lqV0NXZWlSNzhuWmE4VFM1cVZl?=
 =?utf-8?B?MmdSZWp1dUJOM3BVQm9HUi8xM0RYSUpqYkVtNDkwTi9RVnV1czRLVHI2dDBV?=
 =?utf-8?B?QWJSUG1ON1VkZ1FyQncvbVRQODZKUDJVc253WTY4dTluOTJuMkloWGNVQmpX?=
 =?utf-8?B?MjMzRmJOOFV3NXFDdkFhR041a1JXV3dndTBRUnY0L05wVXFMQS96VXN0NlpK?=
 =?utf-8?B?dXR1TFRKT0lVYlR4YjNISlFBQWx5TU9kNVpKYUhxRVEwY0V2ZUpRdjFLbkly?=
 =?utf-8?B?eFBxb1RJVHoyajFSb3g0YTkrVUMwcVpDVDJQMHl3NDBBRjhzNWJES1hYK3l6?=
 =?utf-8?B?ZHJFRmVjZ3g0OHBYOExHR3YvYjVSTjB0c1ZwUENnTkdON0Yybi9FZ0ozL2Fo?=
 =?utf-8?B?MitIT1FqVXZaNktMRDFLVE5hZkZRSUg3RlNOdDR1QTd0cEpzUmpjWCt1YTlN?=
 =?utf-8?B?ZWVkcVlsZmNuZkp2VGF1MlBjVzNTbnB4em9ueWdudjN2K21BUWpHOVdoY2ZQ?=
 =?utf-8?B?LzhvbXNQbEZLRExqcWkyRzJkNHFkZXRRR2lLbHFjUGFuY05Hb1dBclBub0Rw?=
 =?utf-8?B?MnJQeVJ2MTdqd240TDUxU05VTXdEOGZHbEVVOWF6NzJ5TWNMbFBpSEs3dldr?=
 =?utf-8?B?TlJUK2tYRyszdFA0ZjBGd2QyK3FvbnZvVXNRUmRYWkR5OU1iM3M5dElDSXg5?=
 =?utf-8?Q?sYIYMFxeGtQvDtdyC6RfAOe2u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35da113b-9fd3-4f16-4e40-08dbf2c6e482
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:40:25.5656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPw/XJTIB9XChdCtdL4mMeQD6uQvylUXCU1MCvrThqBUoW9nWXqbtsz6q2IF0hO2PBNFZgOJ758GS1/DkaJN3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

I'm about to push patches 1-3 to the rebased amd-staging-drm-next. It 
would be good to get patch 1 into drm-fixes so that Linux 6.6 will be 
the only kernel without these prime helpers. That would minimize the 
hassle for DKMS driver installations on future distros.

Thanks,
   Felix


On 2023-12-01 18:34, Felix Kuehling wrote:
> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>
> These helper functions are needed for KFD to export and import DMABufs
> the right way without duplicating the tracking of DMABufs associated with
> GEM objects while ensuring that move notifier callbacks are working as
> intended.
>
> Acked-by: Christian König <christian.koenig@amd.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>   include/drm/drm_prime.h     |  7 +++++++
>   2 files changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 63b709a67471..834a5e28abbe 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_release);
>   
> -/*
> +/**
>    * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
>    * @dev: drm_device to import into
>    * @file_priv: drm file-private structure
> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>    *
>    * Returns 0 on success or a negative error code on failure.
>    */
> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> -				      struct drm_file *file_priv, int prime_fd,
> -				      uint32_t *handle)
> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> +			       struct drm_file *file_priv, int prime_fd,
> +			       uint32_t *handle)
>   {
>   	struct dma_buf *dma_buf;
>   	struct drm_gem_object *obj;
> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>   	dma_buf_put(dma_buf);
>   	return ret;
>   }
> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>   
>   int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv)
> @@ -408,7 +409,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>   	return dmabuf;
>   }
>   
> -/*
> +/**
>    * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>    * @dev: dev to export the buffer from
>    * @file_priv: drm file-private structure
> @@ -421,10 +422,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>    * The actual exporting from GEM object to a dma-buf is done through the
>    * &drm_gem_object_funcs.export callback.
>    */
> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> -				      struct drm_file *file_priv, uint32_t handle,
> -				      uint32_t flags,
> -				      int *prime_fd)
> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> +			       struct drm_file *file_priv, uint32_t handle,
> +			       uint32_t flags,
> +			       int *prime_fd)
>   {
>   	struct drm_gem_object *obj;
>   	int ret = 0;
> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>   
>   int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv)
> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>    * @obj: GEM object to export
>    * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>    *
> - * This is the implementation of the &drm_gem_object_funcs.export functions
> - * for GEM drivers using the PRIME helpers. It is used as the default for
> - * drivers that do not set their own.
> + * This is the implementation of the &drm_gem_object_funcs.export functions for GEM drivers
> + * using the PRIME helpers. It is used as the default in
> + * drm_gem_prime_handle_to_fd().
>    */
>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>   				     int flags)
> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>    * @dev: drm_device to import into
>    * @dma_buf: dma-buf object to import
>    *
> - * This is the implementation of the gem_prime_import functions for GEM
> - * drivers using the PRIME helpers. It is the default for drivers that do
> - * not set their own &drm_driver.gem_prime_import.
> + * This is the implementation of the gem_prime_import functions for GEM drivers
> + * using the PRIME helpers. Drivers can use this as their
> + * &drm_driver.gem_prime_import implementation. It is used as the default
> + * implementation in drm_gem_prime_fd_to_handle().
>    *
>    * Drivers must arrange to call drm_prime_gem_destroy() from their
>    * &drm_gem_object_funcs.free hook when using this function.
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index a7abf9f3e697..2a1d01e5b56b 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -60,12 +60,19 @@ enum dma_data_direction;
>   
>   struct drm_device;
>   struct drm_gem_object;
> +struct drm_file;
>   
>   /* core prime functions */
>   struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>   				      struct dma_buf_export_info *exp_info);
>   void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>   
> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> +			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> +			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
> +			       int *prime_fd);
> +
>   /* helper functions for exporting */
>   int drm_gem_map_attach(struct dma_buf *dma_buf,
>   		       struct dma_buf_attachment *attach);
