Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2299E45056A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EAC89D60;
	Mon, 15 Nov 2021 13:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D9C89D5B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG7Dahy8mPYCJBIhSpZS9lO2HiVBTal+7i7aJ8/aiu2/FuVtxuyUzkEH+2vMsjBZwCRrFocCHEVLama39gSsHjZK861Aef06Pud/aBoNB2qwlSs1M+VLV1A847jpsj/05bc1zI4bCG10/yxWvjwCWtNtbhZsvxoLyNkd5NyJgLrLx0RgoZfZ/OmyBc8BfMrYaLtAGdkzF3J/2sM8tO14InFeW9jpFCAA+crBGP/PyQBXfVfS8a+TTyrT25dX+pggX6gVFIDdBJVbA3bfBbF6ElAHBkLhVcEN+qxaelnBXn5piN3ivc37ZhNF7A75qdlltSDxtT+xYG6PpxZH7Q5MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNuZrcoCe0bM8rW+4ywpNWeFdtT4ueX0l0ToU8lbiyE=;
 b=mdxVk2kZHlKucdCNlItGokyX3bTda50XBhOL7irRkmhwhuPExdDbha0VHBnrrZkl5nJEtsc0W3oX8w2X9lCfGxkDExawRmARmC+8NBz9mndPEVvYETYXrDEu8W7l/mRUAOKCE2tP6YEo/pjXA3JLRuQ79etzkOz0A7ayaWTRIp1wsJlnBrvYPSgM/SiOcyR3jppcaUf7tHydRM2hJT0VCuiewba1/U1RkAk9X8Nvmco3usUANvR2nqcfuJKF4yP1NCJt6tO73QJwxy1OmiZebQTM709TQkkCaoXn/tNvp+wfw5gAOcBqNLy+XjyP3MM43PWBjilfhn/0/oAHcNe+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNuZrcoCe0bM8rW+4ywpNWeFdtT4ueX0l0ToU8lbiyE=;
 b=arpCyrcuZIAuy80YuuZkE3mObCjNRv1SCG+c5QhnJjNON0BvNAjxvp1JxSbcKBK+rsWh/t2C4A7nnZa0UFTV0u//afUoS2XE9eY5GyMvdDMYUPu0CdqOrDAI6yl1ClhSZg7Nmp4e9oDorWZuLHB9f4g3n3BGYNkG9MBakyRbGg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1407.namprd12.prod.outlook.com
 (2603:10b6:300:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 13:28:19 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 13:28:18 +0000
Subject: Re: [PATCH 1/3] drm/ttm: Don't include drm_hashtab.h
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 ray.huang@amd.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2b2eb217-3a7e-5f66-ee97-7b222ff2086a@amd.com>
Date: Mon, 15 Nov 2021 14:28:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211115125539.1730-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0097.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::38) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6]
 (2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6) by
 AM6P192CA0097.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 13:28:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10dea227-b9a4-4d75-013f-08d9a83bc93b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1407:
X-Microsoft-Antispam-PRVS: <MWHPR12MB140736E83038001E6984CB2983989@MWHPR12MB1407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+Imr/qWOcBZlMSQcyh1ANmWLLnaTx73tVKExT7iaemu/xPNcZ7jmkfv51LPSHRnhxlHBOGxnEFu4W4qSJH7ZF4fOkhoYDOITEMm6HH26DSCF7uzB4n6n8xkuUttFPpZ0vYH0wJJwtYHc+IezEZva9cnaW0QPut9uRVtHps2MjvkPiQ7oh2Kp6hFi6kWhAT3+bF67PETkOr93uibMnQFH9RmJQxyg0hoONO75qLplqpic2KajlZb9yesZHpWfZzgLispKM2WeT2sibkvE4GcqOUc1TX5/TCn0LyoJV4/lo1Aprbm+dU27o9kZE8eO6VvdeycoXsiZs/w003XyCejsdrGnw4JYdzxR5BjJIHjTyY5yorgR2mr9+6eofDDi0Qn9uIwaI0oavbOAQO/js0atpYpbmjwremm8+XC63hd/sV3itH1ohU/6bYePlnB7Jof1Z8zBiNuc3tI4SnlstZcllQ23mN3IMwgndm4+5lzSgsG9WPdmdEKOk9V97pMuqQ3b8xqspZiEr03wUE6wb/e5Jts1nYPa1n4JPBjWo1lJd3pwFPmM1TMXbgRSqWpj8Wr13GW5n3iiAYB/qrSuU6ioOe2txDPUHwyQdCyHDjxkbWM/NVESsPJCxAxJitTrxVKSeax+nx2ctKnqNC3jtdDGs4OdMmM32rmJ8c9LlxL74826cNYeRYsjv/sXQ/vsBbSebhAxF/dn27r5WED8Wm7dI6iAcfj2qrxFu2zi8YmHTB0JaCn4+ubR3lGuaHNIRrs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(508600001)(8936002)(86362001)(66556008)(2616005)(5660300002)(38100700002)(2906002)(66476007)(186003)(66574015)(83380400001)(6486002)(31686004)(36756003)(66946007)(8676002)(4744005)(316002)(31696002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGNEQ0tFMUtha29FbGJJUWRmZEF0UmZoRDNmUEhZSWYzYmllOWI2c0xHNjhT?=
 =?utf-8?B?RDZwODFZSlJZaUlZRUNLNFNuMW4vek16OG5wa2MyeVNpRVE5VEtkRGZ0bXJh?=
 =?utf-8?B?ZlpzRVVMa0JSei9WQU1NTUhBUlNpOW54V25OMS9mejBPL01mamhyYWl4bmYy?=
 =?utf-8?B?MVQrRlZodGdHWE95dEtRNEIxRFpTOEgyemFSVFQ0NjVxc2JzMSt6TENvenBp?=
 =?utf-8?B?MWsxZjQ1dklCZVlTNUdnd2hpdXlURGJQQUVGYk9ETHlRbElOc0V1NDJtOTds?=
 =?utf-8?B?OXdhbGVWZ3pCWGRBYU9wUm1hKzBhQ0JCa1hEc0RlOGhQUFNlTU5BZ29lRktn?=
 =?utf-8?B?VVZQQ1NaWmVZeFg0UDRBdDRhZDJoVldmSE5vc2s3MC9rR1JqQmxNLzdETjIy?=
 =?utf-8?B?QXgreXRHL2ZyTEFyWTBSUnZKNXA0VVViOWxtazZBZ0V6eEE0dEpiTW5ZU25m?=
 =?utf-8?B?a0o2RWNPM2RWMEhVY1JXblBPZ1NidzlzUEhnZ1lOWGh1U0NZV2JWWm5kNnk2?=
 =?utf-8?B?d3RWTlNYWktsTDVWWXNSV093Z0JDWithSWxkK3d2RUNpTUlyTGcrVjhtTXRW?=
 =?utf-8?B?SElnRnRxQnc4OFJzVklqNmthSFI2QmN6VFhRMngxK2o0ekJidWI1L0FtbXND?=
 =?utf-8?B?V1lQdUN0RWxINkdVM2tsYVhYWGRPNVlZY1BUQk5qQVhMSGgxR3JENTV2dGdq?=
 =?utf-8?B?SWh3SmhlZ1A4MGNKc1VaVkVJTlpoVklxUVAybTl6OEx5d3k0TjJlM3I2dC9T?=
 =?utf-8?B?Wjd2cEQxZHd4NDVMbjNUanNxRnNHazVJd0c3MWdOTzZIY2dxOCt4dzkzRXcz?=
 =?utf-8?B?SHV5UDdQRE8xRHlwU2tvQXJlYS9ic3k0NjhmbkUwcWpFOWdLYUtzRnAvTzdM?=
 =?utf-8?B?NTdxaFo1YXB3OGxzQldsaVBzUjdaZVgwT1NTNGZIekdtM05vb0hTMDlrR1Mz?=
 =?utf-8?B?dE93TDBDdDMxNDhkOUxmUkFtQlhhNjNrWUVncjdLSERjcnZ6c1VsSFhtMVVn?=
 =?utf-8?B?K3pmNEhreVVmK0w1NXFPWVBHZjNUN2RJT1RDYVZpeTczOGN4UzZxcUV1dVFq?=
 =?utf-8?B?bHJ6eUZNWndYZGNVTGNPczd2R1dadTNoOS9aOFVqblBDRXhKcVkvTjRXdWR0?=
 =?utf-8?B?bWxveHNYZlpqWWhzSHhOdGJzRHBRaGljTllzY0JwNkNtSDF2cWlXZzE4UVU5?=
 =?utf-8?B?Q20wZlFpRS9XNVhadHl4a3RQNWJuOUJHK1hyaWpCL0ZiMVNxajF4UVlwem5V?=
 =?utf-8?B?a2FvaGRQRFJMTlNlRUhqcFNFWmw2d3BsUzhyWTRVZ2IzQXIwV1VjNWwxdTMy?=
 =?utf-8?B?ZWw5WkdteHFuSVoxcG9DOGMvWVZBdGIwM091aHloYk12NU1ka0hKakhQVG81?=
 =?utf-8?B?cHhuVE5MWWFEc1BNMkxYUTRQbzl2WGorSDljdG1lcDhLMXhJUGdpZytaclFO?=
 =?utf-8?B?V0x6R0lEVkpIRTdXMWUzV2hYSk5iZUVDRGlxenlZbXlSREhDNEo3S2MxUkhY?=
 =?utf-8?B?WGllLzBrUHVTU09wMGdOWnh4NDJEYmd5aGJPdDNmVEt0WmVLb1hYdVUzRU5M?=
 =?utf-8?B?eHJmbWdZWVdidTBhZ0Y1NXBDOWtjcG1Sb3p6NXg5WHMrMFJPSVM3dWRuekxM?=
 =?utf-8?B?RFJwUmszYmI0TFJ1RUtHN3FNUXYrdW9tajZlVkNCQkhMZlA0c1JsNmIzbUdL?=
 =?utf-8?B?dk1ROW1ERCtiTWFrbHppbldNMWxuNGsxOStaU3VEdW41SzRDYkU1V25SWXhx?=
 =?utf-8?B?SFNwTk1yRDdtQkVPYkRDQTIxa1pIZ2k1L1VCZnhLdktIZmUrVGNsWkFtSDFW?=
 =?utf-8?B?dmw2VmpqRy81UThkKytyN2pmRGUyUVgrdjhWWHJQbGl0YXloUjZEQm14UGNX?=
 =?utf-8?B?YmwyMUhmK1U2T05LZk9OUmU2MThZNG1OUkFoWFR1aUVCcGphcmRzaFYyay9h?=
 =?utf-8?B?RElvajZEbXJkQldMdkYvSHpmcy8rK0V4SzVJQnBSa2RZUjREZVVVY3V4RS9E?=
 =?utf-8?B?SmFqcHdoczhzbEhLVGRGdExXRExJb1FZT1VzV2k1dXBLWXVOdnpMNktYNUdW?=
 =?utf-8?B?ZjdGU0JUTmRqR0EyQk1Jay83MWgzNlRRaHNSRFU3TmZCSk94d0QzWG5vUldo?=
 =?utf-8?B?VTRrTjhFZzgxejlDYm1TT2ovYnhwSk1oQmVnSW93eUFVMDl2aDM1dFQvLzlP?=
 =?utf-8?Q?OtUYQZxlKrewCbzobwawE6Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dea227-b9a4-4d75-013f-08d9a83bc93b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 13:28:18.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V26Q8IYHcx9eApJHbNQc8hrlWurLsL7lTBRjcPHv1zpQS8JPbU3jxNPrrVROGJKw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1407
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.11.21 um 13:55 schrieb Thomas Zimmermann:
> Remove the include statement for drm_hashtab.h. It's not required
> by TTM.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/drm/ttm/ttm_bo_api.h | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index cd785cfa3123..c17b2df9178b 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -32,7 +32,6 @@
>   #define _TTM_BO_API_H_
>   
>   #include <drm/drm_gem.h>
> -#include <drm/drm_hashtab.h>
>   #include <drm/drm_vma_manager.h>
>   #include <linux/kref.h>
>   #include <linux/list.h>

