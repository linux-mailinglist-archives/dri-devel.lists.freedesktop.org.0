Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627484902BF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009610E3F7;
	Mon, 17 Jan 2022 07:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D52110E80B;
 Mon, 17 Jan 2022 07:09:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZLy3S30Yk7A3iewxEBgIPCrJrf88gW46MQ3NN/uTnZzbKzliYTZmyX/sCJwuhjoKXoNarPYnfdhFdd2gStREQRuYIS3BiaZ+nl44iJdJNt/P3CjH7Ubcdg+4gGJ1jk2uzj8iAOs6mYyTAgt5alLPvcvf66uCNT1cgOXCPugUQOo+XKL7oMOnxhyKpmjG7uEhf7LFiUchcR2U+TAzH5Abhy1Kwlpf8k0cW42cxPXPkXJkGzG2wvNCKZ1mAO1CrQ5YPidw7Reka7cuMY9IX89o9IUO7dRHyB7Nl1QR7p+Kx+3kbGAKKhpqusF8IbB2GdVlrZOEhvOsoIcuJwkU9o+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+CrFSzYhDYQRnFFh8lhYPIrsoel8lifju2fY0hpHUY=;
 b=EGVHY0WQuujOyJfIP7ITAkCAM+4OrPZRC9N2FhYTh3l//ItCyYSuFSOhmWYLWxXTYpJJVegC1eyyjYKFSsUxtPCy8pXj6M5Brp9IknwlLLy8vnrQ1tWJKfx2xlJ8sUex+/8yxvPQ1XDPItlIZ5wKvh7LQc3drs3+KDoVKTdYbSBmPQSrChlf4of36t6R4Fs4/c3Rq+9iI+B9djhwIN+sa9lHWRsYZcYoha28CwGGVhmqio8iScfhlmEAaSmxuIAMQ/UvSVR18kVbEd7Q+rEDtCTViGGmJTqEq18aFG3Ee735eszhAEAaUUMAmUloTnKRSdWwMPz5Y9DOf1Jb1E1/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+CrFSzYhDYQRnFFh8lhYPIrsoel8lifju2fY0hpHUY=;
 b=lKvFvnUJhm2Vg3HNBcf8z4Qf/Q+Lw7IEkasNWcJ8bBP9CMlXcysLyAvyh98CbZvXjImv3WpCN5WNnZh9YYXs4feDWb24K8g5qRfYCWeLJpAxWVQJ241RolS3dbrR9YcG/bfP5MxYI8wFf1cN8hRiu4OSCekcEa/iLItDPklnqpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by BN6PR12MB1921.namprd12.prod.outlook.com
 (2603:10b6:404:fe::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 07:09:48 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 07:09:47 +0000
Subject: Re: [PATCH] drm/amdgpu: remove duplicate include
To: cgel.zte@gmail.com, alexander.deucher@amd.com
References: <20220115070202.850676-1-deng.changcheng@zte.com.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2570ce69-88ae-0927-d442-2efa20abd707@amd.com>
Date: Mon, 17 Jan 2022 08:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220115070202.850676-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6182693e-eefb-4613-58f5-08d9d9885842
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB19213C535D2C350B2728472E83579@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uu1pwMzIB/8TB4kflX6hKPYp1wcVcrqtSgG/0jaqfFpxuWuZvwqvzeyhN/yJGrfCcKtbYUwpbRj6hQXBCyMfPnwWAt0aLiw8rObj0w431Bk2fyxTDY3x/im0sFBeYSy1HxWB+OuftrQSFf+LaWOEu7Kqpve00zsJylwv1bBR2hyT+9Go7VM4VfjKZHD+mlBs/bCk4BUV7XSf8bmbpLgkmkpp1eXj0ZdqS61TXdNeobBa+nd1NDaM0a2AYpT5JVvVbZa70wOgrqtC59eNQxKnaS/q67yYWtsPRNEDVxJU9yYBoB/wmpEWmr+z54mPt7OwGYH09wRt5QGHiCcuTGbKej60hepBOpTBH0CSgsud1m9FdL0ipqJn4Ir5o+IDkMhpG5VjuScnomWc1GUlrulNr1FuVbGzlhWHQw9ZKErBy3vj8W7OD5VUMLWSGTHJlYA7fJ7gCL8v03t8SjJOuZpl2Gc4w0tTTIkKOuv88zFPpuSG081N28Lxg4GTMQ88oQPbObkV7/8xXevQP2cNmq3qwIwP7+zOJgwTNwo9lmPvMHdisVoEiYcd4fxMpEcwos7FQ6qt/4TytjisinRA96mmU28GbzIIzd/UU4qlJXbOHeBm1Q+IVthT4YtKvtIzgQHgRE/Eth2mzVZiPF4rKLY4BDQCNnnL0mv7E1K1OLFBJKg2Qk05pjKqjzBibrsvaSfJmbNM2x4w494z5JHOQlDdVb4qJXW1F5phmB8Xk3MH0PP6dAhI1db3fj7Y+Gv1lCzM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6636002)(6666004)(66476007)(31696002)(66556008)(4326008)(26005)(6506007)(6486002)(508600001)(186003)(66574015)(31686004)(316002)(2906002)(83380400001)(86362001)(6512007)(2616005)(38100700002)(54906003)(36756003)(4744005)(5660300002)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJhOFEvVWFySWJQcXhlbWJxUUltMmdDdE85azZjaXRLeG1ISnRuK1NoK3Bw?=
 =?utf-8?B?ZUhsejc0MTYyc0k3Z0tSdzB4eUtCREw2b0crWXRyWW1jU0IrQUQ0V09mSVli?=
 =?utf-8?B?eDlQZmVmZlkydHlzZSsyTlNRNUVTY2NNQ05qa1FFdXo5Ylh5T016SnBDbWM4?=
 =?utf-8?B?cmVtd2FJUkxDL1Z2bU1Vdng1dm94bTZyQUxPdytzS1NGNTJrd2s3c25ncXF1?=
 =?utf-8?B?YmRxWWx0NGIrUDJZREFuYnhoS3lyb2xYNEE5cW95dVJ6ZW9WRTdRMzJOdDZ0?=
 =?utf-8?B?VlJkTFllbjJhMEp1WlBuaC9tNzFxVUVUT0NiQnlKdDV1Ym5md1RWWFp0NFB1?=
 =?utf-8?B?SkprdEdPQWRVOTZxOGZ3RGNwR3AzMGQvN0hOcVcyN2FRT2U1ejExMFhPVU91?=
 =?utf-8?B?d3pFR0JxMDYxNXpmSkEwd0VLWUI1VDBYZTNKTEtyVXZRTHRtWUhWK3dLOS84?=
 =?utf-8?B?eGMxN0dKaWttSEdVaVA3dngyUHhNUEtpRFl3bEVRTlMxeE9rQkVBc1B6Q1Ra?=
 =?utf-8?B?MUxWZjg4eExVNFNqT0dVNlhZUnZFVVI0bEsrc3NyMGFySks0b1R5bHJmVkVw?=
 =?utf-8?B?ODFzUmQ2c0VKWTE2Mmh4T2FGam1MZTc4VXFidlc4b2NEbm1nMDRtenVMcHlJ?=
 =?utf-8?B?bXowYnFkVmpQR3NPc2hNbWwvMlFLUXp6Q3hyeTJtcGtldFhJWUVSOS9NcWxt?=
 =?utf-8?B?UUpoY0hOUm9YcC94anovM0tuZ2psWmdkRU9ZVklVSFpQdDgydG02M0VGTnlY?=
 =?utf-8?B?c2laTkdtZWg1UmswMEFTbkJiN0UxbFpLR3pUWlpKcHl0eGUycDBraEdBNFA3?=
 =?utf-8?B?Ylo3TWs5aXIzSUpQb056ZDBHQnpHdUFXcWtjNGZVSkt6eWFuZXNaVFoyR2FJ?=
 =?utf-8?B?aFFYUjJyRGo3aksrYm5YSklBamhyODg4Q2d6OWltUHhvUDI3clJmT01kd04v?=
 =?utf-8?B?SFdQRU5UaWRxT0lLZUw4WXplakhTaHM2N3FjZHpuaGUvWVlvL2p3ME53WlE5?=
 =?utf-8?B?RStyZXJrcHJQWWpIL0VWZkp4L3RRUytpREtZZmFCeW9xS3pKa1h3TlR1dWNT?=
 =?utf-8?B?bkIyVjVQdGpaN3FWRmJMMjA1TjJnRnZZVDdhYVFBbEt2QzhjZlpFNEFYelpG?=
 =?utf-8?B?ZDN3NVVYS04zTURXZE5FUzVZSkFLd2MvajVoMElINU5HWTc5dG5aakxzMlhn?=
 =?utf-8?B?b2tJb2FuYm1sV25teEJiVnk4ekx2aGNDSHZNcFNqSVN1NFpwMDQvVjZ4VG5U?=
 =?utf-8?B?LzlrVU55NGxWTVdSaU5ObkJ1OU1LSmwxanZuNWhzU2M2aitqNE5zN2hEOEFG?=
 =?utf-8?B?R0V3WEtVZzAxdlhsd2RuWXVBdllnYU5wUDZwZUo0cGV4cHY4c0pDajZtdnNu?=
 =?utf-8?B?QjBVRkpEUDJ0by9SUGpsU25ZaHdsV2pqMmRxRkVFNnVKc2REM21rb3h6c3FM?=
 =?utf-8?B?aGpDWUVLUVpQQmN6dlJKbDhHUy93K01hOHgxWHZiNWdBZ0liSUZydEVXY0FK?=
 =?utf-8?B?K2RSTmQ1RHBpcHI4OExFMUo5dGZTQ3ZJbW93T1hWRVRNQjI1NTBUcWcrTzBJ?=
 =?utf-8?B?UDVrUy9kRE5QVmR2Wk9HcHpXd1BsUWhSb2Niai9uTGpPeTE3dUlmQndCNHBK?=
 =?utf-8?B?UEVIMkxpTkVoNXprK3p4aFpOUldCV0YyVi9WS3FiY2dyREQ5alpsSUxKREwv?=
 =?utf-8?B?VEIrZjNPWkpxUTdGQ1NZc3FoWGJXcEg0Z1F5bFpuU0h4U1IyNExNK2JDNTFY?=
 =?utf-8?B?Nmp6QUx0bG5mWCszcnNZRjJPUGRwZFNmZExFdjhTcUJMa2tDbVNlTzhlaGtN?=
 =?utf-8?B?U2pDUExPSjlsK1pVZXBrR2FPSnovYkZWZyt3a2NvOXJIZEhvdlRSQkdqQlRO?=
 =?utf-8?B?M25jKzErdmpUblNaSEdUMnNiQ1hCVisvU1JwbXpZbFJSY3hTT3VEUjRBZVJL?=
 =?utf-8?B?QWp0dyt2ZURETURKdmJpYVM3NGg5dmZQa1V5Ni9OOHpFRUk5MzU0M0V1bkdY?=
 =?utf-8?B?WklZNnBKV1V2SDVLdEo2VTZjSmMzaWRNcmlGWTNuRVY4RHNCNmQ5K3BKaEZn?=
 =?utf-8?B?SGNSVDVIbkFDYVVQWGdEZ3dIY05RTTY2UldwaEF4Ny9YcXVoSXVSdWdjVG9q?=
 =?utf-8?Q?DQoQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6182693e-eefb-4613-58f5-08d9d9885842
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 07:09:47.2908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4CjmbmI/bAHLQpWvzAJYfjMmhAVbbbRC48cUQK1j2C9IRY+5oi8lKFwCjcktdvj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
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
Cc: Philip.Yang@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, Oak.Zeng@amd.com, kevin1.wang@amd.com, nirmoy.das@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, jonathan.kim@amd.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.01.22 um 08:02 schrieb cgel.zte@gmail.com:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> 'drm/drm_drv.h' included in 'amdgpu_ttm.c' is duplicated. It is also
>   included on 53 line.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 953d68b26f0b..ebd40d1a8aff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -43,7 +43,6 @@
>   #include <linux/sizes.h>
>   #include <linux/module.h>
>
> -#include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
> --
> 2.25.1
>

