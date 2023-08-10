Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D606777120
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48AD10E4C4;
	Thu, 10 Aug 2023 07:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3EE10E4C7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 07:15:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Db6RrFsx68Mg1IQrmWG6vOeZeWhP3CTVx0xFTmSMHbuKAlWuzdcF5B/w4v6Gb2zZoTXoKte18eUyrB2f8JJog+Jp54O9fyBttJcXWCDAVeEMlGIX8QB7vBF+rg1nfdYIwSCWhurGUMvKIGV+2PlnCinaHQ2qMZH923gm16OHv1cI76pbJHoJlny3U+NyFA676SJ1DaI6eaYuTR0M0OP+CUomj6I1X0tV9ZGE7hmG+z8gLXLxOErPLy+e/oBfw1z9gfECGT/Dr9QWsGL+jnpBL33I86kd7T/3ZMnp+RZAMZR6MiO/hMF47R04lKGOe8OVi/AUTpUE3hzrx3fK7cfxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McMhBzCrNga/1VAp855aNe3ufrdLEICPegtaOaT4H8M=;
 b=IQJ8x1kYwoS6kC2gPp5eF5Hjllml6PEfQTjEWq9SAXi8qqToZewNfhqIK2jz4GIkc8EfQV4K31Qw7EsS58X+gQcN5nz2tzm2bbMoJm44b6lcAWAtKOBLi3WKNIYLs7OBBkN4uUz0gx2NFaLsFBj1PlWZr7M5lOCpIAriBVVbYdkKHiWF7ktDAf1j9Em0eFTA6oAcm9fuPwzCjho1+hX/zliJqZ7JzGzCYPCiL+F5ykwFflLJ7cEM5VsOKtT8rulangE966lCq9MgEI/PWp9jslaXd2SKK1kuE3JHySFqPQ8IbjFsWrT3ChsodgPUuJ1K/dyi4hMZyj+OXb1SGizXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McMhBzCrNga/1VAp855aNe3ufrdLEICPegtaOaT4H8M=;
 b=JHhl1+Y56A0HfxxJdnFdWaTKLBPNB0nuKbBWdXMeCLy+qU5dT1SL4TE5p8olUfdUAbhVw0bxIReYm+MyRhTEIVGvr+/NbfzoNjpaW0SsULYXP+xTPTiuSGw+xI7XHzA8nnvPVUQqAPyRCnJUvl8kPwUjoy+cv7JUQi0M+1j2seY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:15:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 07:15:19 +0000
Message-ID: <d5add85d-7615-0b45-bdad-d8221930f210@amd.com>
Date: Thu, 10 Aug 2023 09:15:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/ttm: Remove two unused function declarations
Content-Language: en-US
To: Yue Haibing <yuehaibing@huawei.com>, ray.huang@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230809135839.13216-1-yuehaibing@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230809135839.13216-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 11feee66-75dd-4def-1c06-08db99718dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2Q+PKsOULfYT0fBISvGalFVlYIwEpDvMHOf41Wosv2vDwwm9d6BUoYPmI+C3DCfQbD1b5/41jN+KTqLMg14vccNTr9lTCPkFNX1RKIjFiz3+RZ2M+3L4zJzFXwUYRDBkk4UbczpfIXUW6x8+e/QcQGkwZLkEsEyqP0FxOnZNdUBvtDjtL8U0bAIaVAwsGDQK1rsglAkLnuZs5FhjJSEIc7MZ3qFRmfJX8yewGGwHeor+vndJExQGxXdxbOt5hSfE4AOEY64WQIH/LQDWc5lHfHzdDIUvyCkCfv/xl0zBzuFaTEAuZm5VaHsyCwE3P3PyznxLHFusjC70z8ukInEy1w8zpD2Wmgi7F4RQw+BKc68NHlkMlFtLjJRdC/16a5GMYJBvUuWsAJEzt1OsWkse0vSznmcaD+o1/GCi/RlQM7yiE012DzgAeapPHrLw5lPA4W+mzx7lQfy0N9CAs6+/8W38wE26dwGXbhXSGnVOTBsPVERlsKt6ufFd0SMjarPOkr/wxkCnJFz19tFtRL0lpgjz40kyHoxA3oyZCCMxi6o767TIW80PY/rMUFchp87IOQ7fXL3+KO1QFi8ke8263Ak6UA4fihyX55xyM8P19tmXDcLzQ4YkbxDuF2jMRE3cef/bI+dNYz+t/EuSBD24w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(186006)(451199021)(1800799006)(36756003)(31696002)(86362001)(2906002)(6506007)(83380400001)(2616005)(478600001)(31686004)(8676002)(6486002)(6512007)(6666004)(8936002)(66476007)(66556008)(5660300002)(66946007)(41300700001)(316002)(4326008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWZqUm9NcDI4bGVsSldpa3B3UmxpTEdDVHhFS3g1Q3U3Y2R1UEtCTUc4elpU?=
 =?utf-8?B?cVpvVUZKMDVQekUyejV5RmxTSSt2dWF4NjdYVzBRMVFBOXJWenVDeC9hVG1u?=
 =?utf-8?B?cmI2OEpTdU8yVCtiblBrRUVwZHl2eVRhUUlxR1FGajA1dUpvS3lhbTlwakti?=
 =?utf-8?B?UEE3L0hqWld4UUw3ZFd1bjRXaHpUaHZXNUxaamVpVjNkWFZpemQ0WVFZMTdB?=
 =?utf-8?B?K3htVG5jcjltaE80MmpUZzhsSlQwRWtZN2Z3RTREVTZUR1RoNzAvQXlmLzNY?=
 =?utf-8?B?Znhyd2ZZOG9sdCt0bTJWUDB3S0pvTkpDUU41WC9MUjFHUUFxWWJnckw3MGo2?=
 =?utf-8?B?TEc5T0k0aXRPcWI1b1RobEp6bWZwcXFzcy9oZTI1VHFFV0s4aHlvdmtKR0tx?=
 =?utf-8?B?emsvSUx1eG8rRUJQcUQ4MVRmR29sL3hyMXFYZExMbGNvZUN2N0kvSkx4S3dX?=
 =?utf-8?B?T2hJNXRQZkZucXhWMmlubG9wd3Jpb0srUGtRdXQ2Z3V3SGZOS2JibzFOU3h3?=
 =?utf-8?B?UmJpUnphWmxmaS9YekJSN1ZiT2ROZ2FHTkk2SDlXUE9jMGJQSTJxZjVMRStM?=
 =?utf-8?B?RmNYMU5NTHY5NklnRXUyQnZ4QjB4N2FJRDl1bUdEa0UrUU1qVDlYVTdUUFJV?=
 =?utf-8?B?YjhzUlVTbDQ2UEdqL1Zxd29CM2RzY24zSDVRMWtRUzEyd1djWXNYeEcwS2w1?=
 =?utf-8?B?cWJkdHFOZ2NFblZTNUlpZWJPSG93WFk5Rmc1SUw3S0lzcTUzcGM0M1N4eTIx?=
 =?utf-8?B?N1laMUYzS25QZGU5KzhHMWhsNUJkN050WXdMUVkvZ1g2VnJTelpacTVHRDBK?=
 =?utf-8?B?VGVsbGJyYmEwRVlPbW5qd3U4WVRnWGVwTU5lZ0VOeVdLUEpiTUQwaGlUdnZW?=
 =?utf-8?B?akZBR1BjY1RVd3VPTTF4NnA4SXF4QTR6a1lmU1JQYkdvTEdmU0FVNEc5Ym1E?=
 =?utf-8?B?RHRvVjNCVnoyVDFzREI5UFA5Q0ZNTUEzMjhaSVA0dW1kN3dTSnF3VCtXUHNx?=
 =?utf-8?B?V0pRbVdXUUhJdlI3THBkSzNnaXp4NjFTVUJuQ0QwVmNIZG9ZbW9IRC9qNHVJ?=
 =?utf-8?B?bXdYckRqby9zYlVIV3hQRmsvMkgzWVF4dXh6T1BnVm5XNDgwQ2VQcUJEeG42?=
 =?utf-8?B?dGtOVUZmTWsyWTUxc2ptOWVSQjlMdzFxTmRPd0Y3MjlvR1JzSzNQTnRFbnFK?=
 =?utf-8?B?NTRJMXlDc25NV3piK1VPalcvRC9pS1ErK01DUnBNVDB2UFB5b1pmTUQrRWFE?=
 =?utf-8?B?SWNTMjIrVlJFT3dxWjVCWGlBcW16Qk8rcWpHbDI4RmJZOHVyUGl6NjFoZjJt?=
 =?utf-8?B?b0t4K2ZqTUpERjY0ZTQyL0UzYkIyc1dTbndhdXYyQ0djZkJHcWRMaWtTS3VE?=
 =?utf-8?B?cTBkWGs3dEdrSVJUYjVlbk1kN2hsTFlpajRyQmZrQVQ5M1IyVnBUSXEwSEp2?=
 =?utf-8?B?WVp2ZFByVjVWczdVdXlscnFFQkdjNWVhTkRZanFDeC9vRjFQTjc0eVNSSW1S?=
 =?utf-8?B?VVVoQlJLWmZtN01WazZPN1dLVXcxbTRVMkVaaDRWelhrRkx1WnFSZG8wNVNv?=
 =?utf-8?B?SEFsZkEvbkM3K1o3TGlLcEVVWlhZYVBRaURBbHZpa2NlOEJaMkxETGpVaWJN?=
 =?utf-8?B?eDZlUkt2SmxPNGJoV3dKTEpmZGJkUjQ4elVpKzh6Wm5yaWcxa3NrSDgwR2dS?=
 =?utf-8?B?Zi9RZlA3Q2RyMG5raXFJTXFFNGFELzlwM252ZVNrWGxQOFVVY2hiTFdsZ0Rz?=
 =?utf-8?B?eE96WjZmbGswSllMeEJaOHlyTEE2c0pnQXhFcWtvbHh5YzRIV0NJbjVuQzVE?=
 =?utf-8?B?cXRRcklWNGZLVlU2Y1hqNjBVb3cwMjU0RlRwN2kyUmhFYnVnRFUzL2F2V1BM?=
 =?utf-8?B?NmYyOExtZWFXR3FuTE9UMURiWFQ1RGhiUE1jK1hZWXAycTlpMC8wSnF6U3lz?=
 =?utf-8?B?a040aCtnUkhYUG9vYmtzbjR1SmR0ME13QStqcnVqOFozTXRNMHJhSW5Fb25p?=
 =?utf-8?B?UlBIZHlnZkFwTitWem5tTnhUQXhybUllV3E5ZXBHY1RaRFNDbS9ub0d0YzFZ?=
 =?utf-8?B?enUyNEh1dFFUQVBWQ0k5OGZva3I0U0xDWkVpUGRCRkQ1RVFxWUxTMGwzZnhE?=
 =?utf-8?B?OGZMK2JWek9QeDhHVFBmUVFVQXc4UWVUSFRkWTRZZnNPU2hWL2svTnh2Y1VI?=
 =?utf-8?Q?/qetqP5X/q7pscLUBZxFUoyVVyuxINOENg5QgVV17fpX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11feee66-75dd-4def-1c06-08db99718dd1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:15:19.5000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYuyyWYab5uggh3lJgSuYhPPryHoHhyx8ABSUnHdkFE2WzPejA9j68OIX3XAlIF+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.08.23 um 15:58 schrieb Yue Haibing:
> Commit cd3a8a596214 ("drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue")
> removed the implementations but not the declarations.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   include/drm/ttm/ttm_bo.h | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 8b113c384236..0223a41a64b2 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -355,8 +355,6 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   void ttm_bo_put(struct ttm_buffer_object *bo);
>   void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
>   			  struct ttm_lru_bulk_move *bulk);
> -int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev);
> -void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place);
>   int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,

