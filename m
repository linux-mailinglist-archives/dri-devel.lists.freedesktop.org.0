Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798183A1BB8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696176E9E9;
	Wed,  9 Jun 2021 17:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFBF6E9E9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY+TBmEdqzb+XUA3PssrW1DV77+zKM/KzMOUq3VfBUflHgsOnQ5Ql1K+kfiSFmZXki4QO1qhxH6HZG63Ta5WOzhZLfqXY+sqZMy3puLWWaVaE7f/zRERSmL0H0rq7me/uWrX4VBKug6F0IQZEmuFmncTOVXHVrLBANKErIdr5+EG6NIWaVIl31w/L/wPgRfoWYnbTM/wQgvdBDc5AEktdbCsUbXez+m1YTsieWsbKQu2Og8J5DRhPkAa9HH1nTw7W8copM15SkYOFUVKwD4rz4utxIdRm0Wl5vR2pGG/XnEkualZKqg0FOtiLZiJD00nrpD5jOPMydvKwYTtElxVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCjXPtukyM46VHnPomLyEVBKiQVsiKgO6iNJxFQtGVw=;
 b=K99vE6EoproaWdosAWUNSnHtKrjliy44WWDODelBO6YM6Ee30LdAU80Q/zdV8IAc1aNDMH+3jlABvs+jVFGQEJEqLN3ZeU1GgtouxvRQ73tirx7nUX8Yev/x0ZxBZqC/ckeYEOz//E5sqz/PIqQQPkGK0H4nogFph/UtHlkLbhfXg908LY2/mBtQf/Ixprca+3HBIYmhvAM+h12rKkzB9hagXDhgTroEXBI69zy2tZfKMMp1a0GrCuM0CPUTVrD7JFAfT5GnIjpKm695d2lKoqJCvFO/q+almWx3dHcLSeKFv3vCTaJwoJ3T1rhQ5kFrw0tn5ph+kL0M06Gg4lA+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCjXPtukyM46VHnPomLyEVBKiQVsiKgO6iNJxFQtGVw=;
 b=MLTcfVjNktwdtV/GjpfDfv3w0hZxBS0BncnQ3P+I4xqk0b9dVRf8gHgzmuci8SWwzf/7+DBr7JXyfRDD8M/UhNX1t54q6N0ydIUEFUTDQdgsrdhVq2FqeCl+/le39UvNAnNbMOGlqWZhkRPaqbi5A+pf6sAbIwMQGbZ+UFXRFug=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 17:24:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 17:24:30 +0000
Subject: Re: [PATCH 9/9] drm/vmwgfx: Fix implicit declaration error
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210609172307.131929-1-zackr@vmware.com>
 <20210609172307.131929-10-zackr@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5650bbe1-06fd-3992-ac0c-be27184ab39f@amd.com>
Date: Wed, 9 Jun 2021 19:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210609172307.131929-10-zackr@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e336:b828:6aae:e0f2]
X-ClientProxiedBy: PR3P189CA0070.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e336:b828:6aae:e0f2]
 (2a02:908:1252:fb60:e336:b828:6aae:e0f2) by
 PR3P189CA0070.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 17:24:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0257f85-31a9-4dd6-3473-08d92b6b70a2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4336A47D958BC2DCDCA32E7883369@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKCDa0yHqCYj3dqkWxiLuvwIw9JbzrZ/i4KOljfQ0wGjtt19D9T+t93dckCBqVfGMbUuwkSn6WXw4Rs/pjpuGpfCOtL9/GFFbZGD/X8IH0DIL3FOtM82r6kKThIJaT44AR9U/NOcGG5HuW9LiKRQ0EJfwUy6rG/KE41w7CzEfFlBhWqR/VCbQTbBv8dZ8P/kUl1D/h8qh+h8Uzhf9RLffxb8Wh+OKIXMNYwLOHk7oUzvx3f0LfDgUUbzNfGGp+icmbLHMGIH9sUqKOL/vowwQgJ2L69fQ19jfIBgmvmvox7DN1SRbnKnHSS4y0qEePQIjx+15xDziSGfRLgRZen+eews2NrrlKFIm4TIwwMvo7Mkw2fWOb19Z3ENvXT1anfM91UaHWgS58hnPcIbfKIcF1jaG1a0WCOMi8x3fGjqlr8FZrSBkF5qCV0Mo8U2j/C1YDVdU7CnJQI3LERP+TO5pgw0+IXqUgFPgK1poAY9whyPP1rdoax5dtimjkI9dhDJhS9LuzdFhmwLpnHNmUI7aNFM1b3A2ZDKJFU04zZynuACEoEF5YnBNiFgEEPML6Y4GykyXQuzxhYqhC8a33TnSZlusAXJ/1gqdbrgjw15/st4FiG8poDH5yPZMXeedCtqyALZLJl/OD8Hy2VR2HK1XKdA0rh3bFBSnqHnGiLwaKBvGamQUBbByshtQWDIPcN/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2616005)(6486002)(54906003)(498600001)(2906002)(186003)(36756003)(66476007)(66946007)(8936002)(8676002)(6666004)(38100700002)(5660300002)(16526019)(31696002)(4326008)(31686004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlFZdm02RjRWVkdqODNYMDRTb2JHeVJPNVhNOHV4TTQwZWs3bnV2ZFlmaVFF?=
 =?utf-8?B?L0taSzQrZGJIL3FxTGZlSzBKQklaQnJRWmt5anFKS0ViVHpaaVdkUjZDeGhn?=
 =?utf-8?B?dm9weDZGeUJ1cENBYnZLbk1TM3BveHRCNWZ1a2VRcXNRQjNtc2g0ODlEaUs5?=
 =?utf-8?B?MTBTSVc4U3Z5d29HdzRnQTYrWXQ4MUxNeG4xMG9RTTZrT2ZacEhISGpybWpJ?=
 =?utf-8?B?c0RvTE56MUxwV3FWL1FMWTJEK3p1Ky9tN2JjTG8zcDkrZGtjZ2VHTVZHQWhj?=
 =?utf-8?B?akZzdTYvU0dIblg4TDIzVUZCajJYcFZhdUpQQy8yNzBoN1h0QVlCaXA1VHhV?=
 =?utf-8?B?ckNsM2NJaTdERVk3OGpNTVJ2WXUxdU5hTlJPUzd1LzZPTHZURmVmWWtVRk9a?=
 =?utf-8?B?QXVDbGxMVEV1UmxxV2pSMjN5TzJWSGRHYnI5VE9mU2htc1RPVnFGTXdKVUJO?=
 =?utf-8?B?TlhpSEhhWE9UdlBTU2J5UUJJMFpZcC9VcVJmN3hranBlS3JRdWZjU3hzT3hu?=
 =?utf-8?B?REE4N2ZNaVdOWHFLelFZMDYraEI3blhPVk5nWlo2bHFTREl1ODZyVyt5RjA4?=
 =?utf-8?B?Qy9sNGJxZXdPNmczVmNOeDRPeWxYNmxMa01YMXVadWcremlMaUp4NG1Ka3Rh?=
 =?utf-8?B?aG90L09FYnRnSG5OTmdDMGJGZnFraVM2aHZ0QllNWkRLRUNVelZmSUVzUFd1?=
 =?utf-8?B?Rm9JaDJYYm91SXhBS1I2QWVVUXR6QVViM2hYcHRhUnJHcVMzalRvTUQrNzNF?=
 =?utf-8?B?M2ZCL1Z6bEJWVjdPdVIrT3J0dHJnam51bzBsazRxcXFhSlg3ZTE2TUFiR2ZG?=
 =?utf-8?B?Tm5CWkVsZlRHekw2Smw2STJpZVQ5SVpYWHVvRDVkRmQ4SkRjZW8xbWJsdjQz?=
 =?utf-8?B?UWJiQ0V0a1BkRVNhVkFLd25yZEwxRzFwT3VjT083cWZyK2dxWlQ2QXduejhr?=
 =?utf-8?B?eUNqOEkrQUR3eDd0N21qZmswRnEwTTcwbGJrYlZkQVJzemY3ZmZFVVB1UnRr?=
 =?utf-8?B?STNPVHRxMW90MkxBajdQQ1ZwUURLREtFemRnWWl2Y0tJQ1lHYlV3Y2E5THE5?=
 =?utf-8?B?c3IycFA1V2JENS9qR3BsMVZGUjRQSFEyTlpvdnFNaDFQUEJwRWs5S0MyQnJO?=
 =?utf-8?B?TWJ6NkVFRmdaOEMxcWg0V1hPa2xSWDZRUXE5bFJaaXU2Wkx5bVFIUVpVLzRZ?=
 =?utf-8?B?QjFsRWk3Tm9yNVNtaXhKMjY4MjBHQysyQVR1Ynp6Z0kzNTBGcmxYc3pDbDU0?=
 =?utf-8?B?eE1WREROeGdFZWdFMkY5KzJRMU0xSU1MOXI2UVZNQXNJZ3NUU20yTmErakNQ?=
 =?utf-8?B?b0lYNEZaaklhRmJVUzVZNEdYazgvMUJTV3ZrQ3JoYTdQcmFvSVhjNHRjbkZk?=
 =?utf-8?B?Z3JZTUxpcmY5eVJUcEFnY2l4OHdHQURNc0FmZDR3MkthQnNneFdyUWFBYVB0?=
 =?utf-8?B?a2htbjlENGN3VFZSR3Jtd2t3S2RRcEc1c0thU242Y1BQRVJwYnVvaEZ6bW5X?=
 =?utf-8?B?YmZzNHNQY25UMUdhYUdRd01wd2VIbS9uRXQ0ZjEzWWxldEk2K1VlNDl5cy85?=
 =?utf-8?B?M2NEc0ZEZ3QwRkZoK0N6dTJ0WUREdjJuVzRBcms1eHZvYTl3aVFGTkl1ZGph?=
 =?utf-8?B?TlQxYmZqNGpvZXE2Q3hqZVRBYzhxTnc0L2FwMFhnYitWM20xR3U1ZU1kVTBG?=
 =?utf-8?B?bHZZdEtXZUhJQnZvRDBFc251OGR1Z1A1dktmQ0VOMVlSc25RYUF6WjNzaDRt?=
 =?utf-8?B?K21kMmp6cGhWVDV1MG9VcmowMnd4NWZrU2JTVmdJYWpiTGRnbnNoakNsaGJk?=
 =?utf-8?B?bDlMbDVlSENuYlNMbklSMGZlbUF0Wms4OHlOUXFkTlRXeWdJdW5nM28wTFRx?=
 =?utf-8?Q?wzsdGsVQaUPf5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0257f85-31a9-4dd6-3473-08d92b6b70a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 17:24:30.2818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzNJoRbn6vLc9GfuATMh1/S7nHEdhC+GVK7/2Wv1M9Gp7DD8/40jxAbSyib0XbmZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: Martin Krastev <krastevm@vmware.com>, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.06.21 um 19:23 schrieb Zack Rusin:
> The declarations of ttm_range_man_init and ttm_range_man_fini
> have been moved to ttm_range_manager.h so we have to add it
> to the include list.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 3eb7d96e9415 ("drm/ttm: flip over the range manager to self allocated nodes")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Sorry for the noise.

> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index d51f215bd715..48a62fb0da2f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -36,6 +36,7 @@
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_sysfs.h>
>   #include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_range_manager.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <generated/utsrelease.h>
>   

