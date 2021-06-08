Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44F39EE37
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 07:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E506EAA5;
	Tue,  8 Jun 2021 05:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64506EAA5;
 Tue,  8 Jun 2021 05:37:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkRDtJRfQfJzWofZZ2oAFRULb0ogyMS2hkeyWMCRXe1BBNSt7UrO1GuaCUhfxQoZz0kWrSbFFN87P+KPI+oswHXx/DtVemXcVbSqW57jRPMG5i1khpBThFKsNMqYff8mCY9eSwZ7sLbpehAqc2jY9lXII6wrL8ThfIVvcdWF0VGERz4o7wfx7Af1pOBJBvCoYH8TGP1M9f9zHg/LKpzoAs1S2kfkrMnkyp7GBFXm1r8AkmNkPdIIYUbyMYG8CAyzYZ9HlhMKdD8mJ2Dmzp3O0GPU8U8JRxqO6WlD16okzwL948tOMTjpeOzd+0K2WlXiNh+9e/Es6AtcmUTUnuEY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTNAJUQR2SD9CghiugAauEXJNOjizMvw44Bl+waGFkc=;
 b=VTNHVWhdpeVi5OCLXPzy8O29i4pRZi6pC7PHmRGryqtWpcBO+RC1I/cGs4hrVHapGLMAEl1oddIyYXsIwnJzbC1aBDqAUh0H4n+P0HfDXMN4gBZ06f++lVilwGPo44UbLpz+InGtdUC6HTjXlOeiSz8P02hAmKpjTsGezzvwpuiKvEKA6rnxNmGXSZ3TWrwZKJuuVUasO+IhDhPOBxCgxnQLKZcYch7GPrf57Nbmk25uTsHVgCx7KsHRRK4Lcbn38Gu9yHm4wMZ3nlV14DuUTWD5nD3TMwxYRQgew+xbPFiww5lFTZ/rdwrh3QyJnqmw0GDwPIvhmJNDLLcsD4RbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTNAJUQR2SD9CghiugAauEXJNOjizMvw44Bl+waGFkc=;
 b=nBCOe5oiTdbDmkFv5af//u0WITTMU3lsUvR3MfdFXR5FEFEXV405ncz852WUeM6WJXknwkcafA2EHQrDr5MSrPPtca44dOrn0ISBoqXFI15y8kT5xCVVxDCyRO1g/FC/nm9V7NXAZV8linDL26qy5GUYHCS/K/SUrgAk7t0s200=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 8 Jun
 2021 05:37:48 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 05:37:48 +0000
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210608125046.07c6deca@canb.auug.org.au>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <22010e38-3686-87ce-532d-4a53cae990b1@amd.com>
Date: Tue, 8 Jun 2021 01:37:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210608125046.07c6deca@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27 via Frontend
 Transport; Tue, 8 Jun 2021 05:37:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1002deba-cd2c-4ce9-4e24-08d92a3f8c65
X-MS-TrafficTypeDiagnostic: BN9PR12MB5242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB524296A6E87D5D7881C5CFA892379@BN9PR12MB5242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J31hjLAvssCYOzc+RAbW0K4uY39gHXcQY5l+2rrU3L7909qDC1ET9PccfL9OJbI83viBiWj2vu9/gBUJ2f74yrxxiVPFxp5Qwx34MRCQdGS9XT9cnuUE4gckDEv2YYbDjOUrWQw9kS8fJvGLeYAg37fY00bZSfzn5Tf14mHN0NrUpqlf4WhF4fopExAXBksZFcXWUcgorCZYxru+xWqXG7wTgH2R/lQ5Vd0xSmMEjfm64o73P6gl1pDiT48v1FgDnZgbNSu+naGf65ggHQ6wn57Qh403m/2Cb6QeJ5nTBlNpAR1N9E30P8URUVNzEpF06NVPzILywcT/GnHmiNfWwdlfU9huF4SHy3D5WNsOyrE6g6oBGIVVZmr8AwREIkKRf+6NdC4lDRC+eFI464ImLSzoRhiqaxA06I/m3A7YZDokgvQAbl0BvOiR2JZRFn0OycplJJ/qxGCwmLEWTJFZpa2zhdH1clls3RVeS1NlG9RV+5FgL3igjdJRInCcL3GUhWUxdm5/5jv5pPGvYtOt/fbRt0kwXCYsdNe/GQuxDWpyVYEa07jK4Lp3FCpuSsq1UJK1glqLVI6eL1pLa/p7EOZ8v3+RnguIxyMQlNoP7eRoXDFVZP+BFoChQ1SWo5u0eeiCzuxqTEQXA1iAE5aL6+kXP6vLwlHOgDKH+yGXmQAcKSRiD4m0GZrudm8DS6Oi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(478600001)(2906002)(6486002)(54906003)(8936002)(16526019)(110136005)(31696002)(16576012)(38100700002)(186003)(8676002)(66476007)(66556008)(66946007)(36756003)(53546011)(44832011)(86362001)(83380400001)(6636002)(31686004)(5660300002)(956004)(316002)(4326008)(2616005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?WRjLjQzfFo8JRpmRvUPdp4fvPqFXZrk0kdFE0GE2INB0LsDp2j8WrdMF?=
 =?Windows-1252?Q?2e/0Qly53Ycliaxbz+Lq2+ckAVushn+cHZzAsNhVmt/f4mIebqYR/QtH?=
 =?Windows-1252?Q?0B5ItQSQ87y+Bl5op310w/uVP3HICCVCiegHgx5HrAOefPdTtxuVt9eG?=
 =?Windows-1252?Q?6MbrClTdr2klIAoQHr8CDTuYBYnkSeQ0yu+8fqbGW4tjauiDHdFrdiT5?=
 =?Windows-1252?Q?WU+uSoea6ZDzuGP65ZESHB63OBWwo7rZWwGeGHSiHwfkZemFnjtgZztH?=
 =?Windows-1252?Q?WthiNylENCg6K1B8kP8MGRSuKQX2SDIQx+gJCa8K/ES8FyKL2uyoWbYh?=
 =?Windows-1252?Q?S1DxMHJIKR9Cj7hkqIR/tlQPWqxDSpt1miSHOmOS0ovJbQSVuTT4WpIn?=
 =?Windows-1252?Q?ra+OT+iFhpNHxxD3RD8b8uBRHloRztZ7cAg/izqHkWwEFm4cm+KF2iHM?=
 =?Windows-1252?Q?7XLko6dQ+xkX7Sr3ZQUleQ+nyWeOubkHirvOq2BbCOaSWtMSdtZ6k32B?=
 =?Windows-1252?Q?KWnltA81hrtYpf79+HZf5oMXEwW4Pf4jRZ3pCGF9WCmhCcFaN2f6r2n3?=
 =?Windows-1252?Q?WdRkP83vMdGa2ro3C8udFCN5wLk6FGBMM+IbgNwaWf/Q4pcvM1nQ9LvU?=
 =?Windows-1252?Q?OKznTCLvtpavbDdFVdUM1WEz50anKH6KpxjIZN0jRS2m8DO9fiPVpq59?=
 =?Windows-1252?Q?Ai/b/ZOKEPx1tyZYDpr+UKsvGl68r1vT1ytYrZqch94eNiU4MGqwMokz?=
 =?Windows-1252?Q?rEtDYGh7Hg5oHNU9AflDQEzcmowaB2Zmn86fA2yRd0Af8jlwy9Q8mDKL?=
 =?Windows-1252?Q?DLmB0TqcCJkDi9XRXpvCVYYinCfDsBp1i4Jg+9S1xzDcNt6gxHToxJv7?=
 =?Windows-1252?Q?ulAP696Rdq/CMcbc5AWrTGnXaLk/KOAe8it0nEF2cHTRAD7HGNmIBOK8?=
 =?Windows-1252?Q?6xdt89imb7a6pPVfHeLRlD87VGkq87fea6hhVrkMwup0rOYd/M4hw7NT?=
 =?Windows-1252?Q?xR65E7FzScxikh3O3X28NOzrYeK2kVoVSKI6I6u2NslihDmNN0OCULbh?=
 =?Windows-1252?Q?azsaQVu9C6az8YL8gKtYvoYg6so3+hzIKeIUyNefj/H7mKHBQnoWJ5m9?=
 =?Windows-1252?Q?XpDVeIrsKsW1UF9/EkCkBQG9bZ/4Wm6rkXczji8ONLoGhTxXRfy/Ag/z?=
 =?Windows-1252?Q?Wz6+026vr4o/pWZBk0uzS0j2eTSrDDbXDuhuShsp6OaV2yaR63K4kEq6?=
 =?Windows-1252?Q?y6SHqXB2iHcOq1+eQqYtsG3G0Fx511XcLNro6LMlXEt+dBVThcWRUiJG?=
 =?Windows-1252?Q?mr/1K9nNUmo2WsOaMAOI2xDLN1U0JcSyoCsCNkwsXI4RKuKoBeCaSWSS?=
 =?Windows-1252?Q?fPkobdsqaEEW5miZKrZ5ezFWPJoLZ/n9CsqMjV3PY9nSSZiybv13oPdT?=
 =?Windows-1252?Q?nqPSULRGJpFSyxeOlnUE6w=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1002deba-cd2c-4ce9-4e24-08d92a3f8c65
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 05:37:47.9209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1hkYu3n0hRCbJgRftfO4Nhns/ppBBvS1v1Fe7kXSc/6zQj2JUuy9NlTGs/zH6xTu5dAdSAdymlEhflrEvhg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I based amdgpu_preempt_mgr on amdgpu_gtt_mgr and now I'm looking at what
changed there. Looks like I'll need to create a dummy node in
amdgpu_preempt_mgr_new to satisfy TTM, and free it in
amdgpu_preempt_mgr_del.

Thanks,
  Felix


Am 2021-06-07 um 10:50 p.m. schrieb Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function 'amdgpu_preempt_mgr_new':
> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:5: error: 'struct ttm_resource' has no member named 'mm_node'
>    75 |  mem->mm_node = NULL;
>       |     ^~
> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: At top level:
> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error: initialization of 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource **)' from incompatible pointer type 'int (*)(struct ttm_resource_manager *, struct ttm_buffer_object *, const struct ttm_place *, struct ttm_resource *)' [-Werror=incompatible-pointer-types]
>   129 |  .alloc = amdgpu_preempt_mgr_new,
>       |           ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: note: (near initialization for 'amdgpu_preempt_mgr_func.alloc')
>
> Caused by commit
>
>   cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
>
> from the drm-misc tree interacting with commit
>
>   b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG BOs")
>
> from the drm tree.
>
> I don't know how to fix this, so I added the following hack (a better
> fix would be nice):
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Jun 2021 12:41:16 +1000
> Subject: [PATCH] hack fix up for needed amdgpu_preempt_mgr_new() fix up
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index d607f314cc1b..e1a7b3e967b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -66,14 +66,16 @@ static DEVICE_ATTR_RO(mem_info_preempt_used);
>  static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>  				  struct ttm_buffer_object *tbo,
>  				  const struct ttm_place *place,
> -				  struct ttm_resource *mem)
> +				  struct ttm_resource **res)
>  {
> +#if 0
>  	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>  
>  	atomic64_add(mem->num_pages, &mgr->used);
>  
>  	mem->mm_node = NULL;
>  	mem->start = AMDGPU_BO_INVALID_OFFSET;
> +#endif
>  	return 0;
>  }
>  
