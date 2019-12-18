Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01811243BA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 10:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4451B6E2AF;
	Wed, 18 Dec 2019 09:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700060.outbound.protection.outlook.com [40.107.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B6E6E2A9;
 Wed, 18 Dec 2019 09:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcelOqhcZvTbrxMrFQ/NMUVlJIKPvqOu+2QkuroMV4+ph0RAdoWaB3EQ3f+0aPiV/GD+QZrNkdk/9+9s+tCXKJSOrnIHH0TpgN2EQJc9yfUeDz722PGdovCFX9tORJH7A/oEn8+3mSDGO46+C4oABoWcv5iy0i2yTeFjZ2++tG2nYcp76Ko38fPAff5N5lN3eGFoef5+/FIs/YB2eBYlTzRS9n05A61GtOEB2Uf4DmTakpx3zECh69Lw+74iu0dg4ss0Pgd8IR6IcBwrdexmD1UpqgFc1U3Pk3LtBdfoG2tWULQv3XMXZMzzMrFZgM98vCZ/ifa6vOnm5sqGbrJXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5OfwsjUGiaZ43qy+V2Ire2surpTTxyM9cCsVRGLMaE=;
 b=Pu0BcLdaMGIWewVvdeOVh9qauVJ2Pm+8jTf85/VO19oENAb6OYsquBJWFRVXydKiXZSaIOXKYSCniZNrNfrd0/65LWgxATWky9gqLOjSbQEs4x8M+oRqAfER6WoXQTR+MLsj9qOM339k95dL0wKESga5kmKW4Bp8R/l005LlcVA9CEy/VEYA+UPbyiNw7gzDdeDBZ5QfxVngFP0YkgZpcmpxxpYGBQ53PO4M51KuSsRM7rMXQ74tAr+4XDnf+U/Jv7dOk38mW/o+DzkMbEEaL4WRlvegd+xko7k8piqWXUCFD/BsPtq3v6tH4omWrY+KUbtTtqpKlVIc6gqaVwYj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5OfwsjUGiaZ43qy+V2Ire2surpTTxyM9cCsVRGLMaE=;
 b=plZKOqYphPATVKuDCDaFgBzFen/bq7a7uUB9eDlZ+FkrNk+MA3Oc72YciipMqR+QsHrLXvNFHS8bne0okm9PhNH0WNL7JcdG+xkoYDo3Sc2UmWCErehNV7Mr9a/uOqZQXQKsAzgnRxShIi/Uq9LxTQUyWmfxxbAanljOK+46wTk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1545.namprd12.prod.outlook.com (10.172.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Wed, 18 Dec 2019 09:52:16 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 09:52:16 +0000
Subject: Re: [PATCH 2/3] gpu: drm: dead code elimination
To: Pan Zhang <zhangpan26@huawei.com>, hushiyuan@huawei.com,
 alexander.deucher@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, ray.huang@amd.com, irmoy.das@amd.com, sam@ravnborg.org
References: <1576641000-14772-1-git-send-email-zhangpan26@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <435afef9-a62d-2f96-b21a-3686b8143f53@amd.com>
Date: Wed, 18 Dec 2019 10:52:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1576641000-14772-1-git-send-email-zhangpan26@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0024.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::37) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13f7849d-4c8b-42ed-22a5-08d7839ff6ae
X-MS-TrafficTypeDiagnostic: DM5PR12MB1545:|DM5PR12MB1545:|DM5PR12MB1545:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1545E23BC42221CD1E730BBC83530@DM5PR12MB1545.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0255DF69B9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(189003)(199004)(6486002)(31696002)(66946007)(86362001)(6666004)(2616005)(478600001)(5660300002)(66476007)(186003)(66556008)(316002)(8936002)(81156014)(81166006)(8676002)(4326008)(2906002)(6506007)(31686004)(6512007)(52116002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1545;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yw4HteKu7ELLWxS0APEpghXOC42iVk/xx5sOu+FAc36XpSMBAVki4ShgrNJYonewGPby3Atf1K9ZUtAWdU0YWq3AR+Tmw1d9qBMCrNSZqRu34wBz8vH5Hz1prNKrfgt9d8RoFcZ5PpHQ8JU+4n6ORCo34jDGI52kvhIvPCX17T4mytPD2QBMyfgzzfhvYTNQhMOiLWtps/pef4in0PFCmU7OhliSaleJShVXqFW6DZalZQPsN22zdZ2Nga9nD66fSi4JdzXQDt6siFYmE6vu+HAWbEgBZeufEUypR+K0qkFnve77SwiSnDXj0GTWUUlww/bVNEvAmz8/CCmQuH/4UeRKKj/lyoqz9+xxJWYDeRBrgzrObh9FoOFQT8cO+1dX0YHVXN+PZ+uYTNFFTpUNeQTOA0bhinjy8sBujGT8Cj/JAedN5unmo0H4ttZpOJjL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f7849d-4c8b-42ed-22a5-08d7839ff6ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 09:52:16.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZL6+kpCufD5DtfZ7bYmyyuu2cv7RBE99UEwNjBlvsFGhgw6qzfF36EflyFM/yAg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.12.19 um 04:50 schrieb Pan Zhang:
> this set adds support for removal of gpu drm dead code.
>
> patch2:
> `num_entries` is a data of unsigned type(compilers always treat as unsigned int) and SIZE_MAX == ~0,
>
> so there is a impossible condition:
> '(num_entries > ((~0) - 56) / 72) => (max(0-u32) > 256204778801521549)'.

NAK, that calculation is not correct on 32-bit systems.

Christian.

>
> Signed-off-by: Pan Zhang <zhangpan26@huawei.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 85b0515..10a7f30 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -71,10 +71,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   	unsigned i;
>   	int r;
>   
> -	if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
> -				/ sizeof(struct amdgpu_bo_list_entry))
> -		return -EINVAL;
> -
>   	size = sizeof(struct amdgpu_bo_list);
>   	size += num_entries * sizeof(struct amdgpu_bo_list_entry);
>   	list = kvmalloc(size, GFP_KERNEL);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
