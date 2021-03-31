Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F3350106
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982016EA90;
	Wed, 31 Mar 2021 13:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008E56EA90
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iua6uWn4M8XRJTXXJUBlwjr1wOuCnFvIWK321PjrRGFZ7xPqY9uMZ6nmUolrarKkYNzZB8fv4nH5jbNbra/+jOz+nwgt9V91pAhMT7gwbwW/K2JcAgRbogAsiUwwKlVz0efpqIPEZq9KakynvSkaUqXc3iJ2lt5hS5wyCP+SUZgdXV99MwBOr2CZNObi+UpKVx4IuDcJ0ic3CU5H5OCF1Z7q/BX5Ki/0kqu+wShiRSKDeilYpze09ygAJk6yKez1xRcilu2AXFsLXDVi1DbTO6l+23qvchFaugvGT49BqbvxNkTTA8dYtVD2ZMWSIYAVlTID8gtAU1AsF8dyx2ZGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXifBsN5n0n//EK0jzxvtIEsFE1hzwaexvcpOSHGbqM=;
 b=hXhBQ4jXXgNvVs0MT35w2jpDQWC1PQLG3+BUXLCPgB+EOSdK++/FRqanq4UUHirsfFK0lWzIw4e8hTSYtzwmWNaod1cEEe7p95eEZiSNpN/eRRUC/xiNRp5E7nDA09Rpfx3Mxum+wdLuBOPz7CT1RTT+b/ghxCfS3YRgGRhIwlSO/iU+LF5S/bDOXHTwN0xpeiCP1ADhMRJC2/oSJLWBLT5uUmeHYHvJjLwIujddtXjPDE/Zc0EByEWOylxvwdmuMZiNYtPLFRG2bBpdCbaDwmAIse4vZh6uIRUsZ4/hN0X76UD5/2Al0isAH0b3BvssZdYKchWZIcKx4PlYC0LAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXifBsN5n0n//EK0jzxvtIEsFE1hzwaexvcpOSHGbqM=;
 b=jRZDg03Kd6/PCt0pp1ptCZM/bmygzTot1XkmfntfhJGnWgF3hdeB2n2n0S4NEDllVTOzIkQzj9QsZkgNDU23EEzKKi6utEAxPfrs0E9guWl6hyOCFxA8QL4ARGAmnU0YxdlDoGDhmiahjdSz/Ii6DQxStfr8101F0mVZrUkTF6g=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 13:15:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 13:15:30 +0000
Subject: Re: [PATCH] drm/ttm: cleanup coding style a bit
To: Bernard Zhao <bernard@vivo.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210331131251.60883-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f1c86a25-9b72-0f34-1ec8-58ce19d32671@amd.com>
Date: Wed, 31 Mar 2021 15:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210331131251.60883-1-bernard@vivo.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:46d6:1b43:479c:c70b]
X-ClientProxiedBy: AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:46d6:1b43:479c:c70b]
 (2a02:908:1252:fb60:46d6:1b43:479c:c70b) by
 AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Wed, 31 Mar 2021 13:15:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b37cde10-d395-44cd-d922-08d8f4470e7e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB452002BA3E554E6EE22287C5837C9@MN2PR12MB4520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8ohR/BgMz59acMPYWShonIG2v+U45Oo1CqaN87M97Dx2L2qYnPMhVfR6O8p7EUNhjkeQ2ph9G9//BjzaTws8c+1C4PePf7ursU2oegtQv/dof7W9PR9C46j1BEFoNdfDv0XZpDjtORDQwz1Jw0AFRjJXvOWtq4ZHZsT0O0Rt20H+pqE8oS8viYmYyFN13e+/zFh4kvyA3DEzJnzev/xRzQC+pYeUAT2BYwVU8Bkc/b1nBledEDPvaVe9hVqyqJWM4tSO73+tJEjz6xaCy2hLRGJrEymMBOp1Nhh19l5By7bTpbHh3qvZ1EPlmBEwECU/alfTh2pv0Z0FV2t4xfhiLsyAwWN9v+QrBQIVmtymX8qdHPJ40y45YHdZABb2z7YZZmZ2DVNCgRn2/nr0iOirKTGe3LHDLQY1XKctOD6Og9LukeOf4tmSeySpYA3g/BKl0kMDGWXAm7z4FN03KSNR8BRTJ8knAPrE2X0JJ5epsJuM9+3/LgdEhFRSOEupd6/RU7G4Q9CmSmHfCEkruf1JEk5dvXJScGSzg0DUDX2G6+ysnkyQOYfMvUJNZOxolz7sBzoeZJbCNiHsKvmnd26jv5KsPTrh0xweb1Y0F0EU8t8Tn+JlxWtz3KcpbTAp+XMjbjJSivJ+/mAFx0/oYg+Szjy2u6tZaXq/9oNHqkAYiLDfs77zHDQpGxzj4X9Z2u3D4hKy+9T/8EWidPSTUFBc8W2KNZm+dH3lEwm5Q4ooc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(6486002)(8936002)(478600001)(110136005)(8676002)(52116002)(66476007)(86362001)(2616005)(66556008)(66946007)(31686004)(83380400001)(31696002)(2906002)(38100700001)(16526019)(36756003)(5660300002)(186003)(316002)(4326008)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0FJKzlrcVN6OWpueW04U3VWUm9nRmxFdkZZaG1YYVNMSy9nbytMN0RLU3Z0?=
 =?utf-8?B?TXI0V3FoYmIvNDFWOURrb3RKRkZNUjNjY1RWVFp4am56QnRlb2tCY3I0Q2J4?=
 =?utf-8?B?b2V1blF6Z3FFdHN0QndMVFFGRUFGQ0tGd0FQbGU3dDd3dEpJc2N5eFJMMDI0?=
 =?utf-8?B?ZFFub09YL29GQ2xmWENGYTFGTDFITmhtMk5TTnVxOEtJd3lXbEdJSkhNUCtC?=
 =?utf-8?B?aDdJQ0Z3bVI3Y0wveDdwdjlVN1BISnF0TzdLWjB2MXBjb3FIODA0MnBlb0l5?=
 =?utf-8?B?a2toM3E5cmhjYzkxL2FvM01RZGtHd0NUaWZqRms3bDQrUFFhRElDbThXeDZh?=
 =?utf-8?B?M0pQTWpGSHZ0SXdkd2hBUGZWNHJSWGpLWnlmTTJQRzRDMFU1WTJRMW9IckJm?=
 =?utf-8?B?ZVJOelNsbmlYNlg2dWcrSVl5VWhyenljM01sRis1RktXemhyL1hFOFZLcnRp?=
 =?utf-8?B?Vjdqa1lLK3hKWGI2Zm84RUhyYnNHUis5Um54N1crRVJGdWJuYXJNNmM5YWN3?=
 =?utf-8?B?MFpieUJaOExpeHM5RGhmOXh1b0RRUVVzMkNWUXk4dWJ0TkRHUjMvbmhLWStm?=
 =?utf-8?B?Zk9WbWxKMmZXa3EwSVIwbVg5MFRQZ3BOYXRONVFGSUVGcmtUTnc5VDRLYW9y?=
 =?utf-8?B?MXBVNUJwTEc0NFZjYUJoRnVPcEVVYjZCeGdvMWxDeStrTHZQbWN5enlnUDJ5?=
 =?utf-8?B?Q1VQQ3NEWWVtR05LZXlvR3BsL05zd3k0Y1ZLKzdGdEZJOGEyRkJMZFhwNWg1?=
 =?utf-8?B?M3UvWVF2RVoyRzhKK0U4UUMyWjVnS3kxMU9IMFVOVXZjbXJ6UzVKUnVURG9Z?=
 =?utf-8?B?TlRDS2JtVS9KYjRZVDRETTcrMWRJQ1Ruc3c5RTUzMkxxRm5CQzhKS3ZTOGpP?=
 =?utf-8?B?TnM0b1JNMHRnbGVESkhDTTV4SFZ6eERWTTc0K25iZktLMXpVcUtxblpLYnlO?=
 =?utf-8?B?QklFSVh0UXhWT1AraWxEMHJkOFZScDNFOWdoTldLaGV4SFIxV3J1bDYzU0NU?=
 =?utf-8?B?V0Z3ZlNsQS83WmFKeWU2WmNBd1lQbFVFalVSbFNSVVVyVXd0U0NYL0lEOU5a?=
 =?utf-8?B?cytLVFJlTmNNdGI2QitFTzFXNzJ1Mm9wcUtGem5nVmhndS9LbkNoV0pHT0xu?=
 =?utf-8?B?aEx0UE5SbXdkT2R0b1JVNzNTMHlwbG1waVFSeGNpYUgzK0s1TENJMmdPQ1Np?=
 =?utf-8?B?YTRTWTJBaU9Ga2hjbU10TTV5YW1DeVJSTzQ1dE0zcm5odStLN0ZXeWN4UTkw?=
 =?utf-8?B?dU1UdUJlOUdneXNBcGg4UW0wenFlcVlPZGVvdjBLNXhHSEE1bDhSU1ZSWG5L?=
 =?utf-8?B?aDBTNnRuZ20vd0lSNTRCT2RuS2E0OGxobkxLU2x3cXh6QWphVnowNGlNOW94?=
 =?utf-8?B?Q2FjeXE3ZUhnRVF3UlhEVjBIZ05OaGhGUlFyMWFjQlEwNnRYcUlqR1A0Zi93?=
 =?utf-8?B?UFJ2UXdqSCtFMVNNUHJXai82SzZrK0JBQjNNUGhpTW9HNVhnKzUvemVIZlJ6?=
 =?utf-8?B?RllqZG9ZZ1hnTjZ3elZjTHdUNGlMd1l2NVNwa3I2UFAwZENDb3JwVDRvYkRx?=
 =?utf-8?B?ZFI2UEYxRk5OcHNDV3ZWQlFLSURJQzdPQmIyVjNJMkZPZDhuUzE2Z08zMVBY?=
 =?utf-8?B?OStuS2xmbENNL0hsM0I2L3lHZldnVWJzdmFTRjUrMEo1T09jSWRQZ2JYTjRP?=
 =?utf-8?B?aHZhdG9RcGQ4dkZWa3V3Vmg3RTdWMFB2TG5Wbmg5b3lBVWp2Rnk1dlh2eXRW?=
 =?utf-8?B?bVo4VHJjS0o2a0l5cHRTK0g2TzIxL0dOTXl3eHhiR2QzeTkzZ3pxekVUa2FE?=
 =?utf-8?B?bFdBL2JvazJQTkxnNFlGYVU5TzNkekFJQ2pURGliemQzcEdKN29FUWtuWnFV?=
 =?utf-8?Q?yOh1rc0yItYTZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37cde10-d395-44cd-d922-08d8f4470e7e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:15:29.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1IYkMzkW3c9DXx1q4IhetnITbSEWThkTXwrYRcrkVDhNQ9ucz7mRvTEE9C2S7UL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.03.21 um 15:12 schrieb Bernard Zhao:
> Fix sparse warning:
> drivers/gpu/drm/ttm/ttm_bo.c:52:1: warning: symbol 'ttm_global_mutex' was not declared. Should it be static?
> drivers/gpu/drm/ttm/ttm_bo.c:53:10: warning: symbol 'ttm_bo_glob_use_count' was not declared. Should it be static?
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

You are based on an outdated branch, please rebase on top of drm-misc-next.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 101a68dc615b..eab21643edfb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -49,8 +49,8 @@ static void ttm_bo_global_kobj_release(struct kobject *kobj);
>   /*
>    * ttm_global_mutex - protecting the global BO state
>    */
> -DEFINE_MUTEX(ttm_global_mutex);
> -unsigned ttm_bo_glob_use_count;
> +static DEFINE_MUTEX(ttm_global_mutex);
> +static unsigned int ttm_bo_glob_use_count;
>   struct ttm_bo_global ttm_bo_glob;
>   EXPORT_SYMBOL(ttm_bo_glob);
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
