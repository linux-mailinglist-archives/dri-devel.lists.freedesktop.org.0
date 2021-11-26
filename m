Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6A45E8E6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C394C6E845;
	Fri, 26 Nov 2021 07:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EA96E84A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcOwOc3o3RT02eLelpDZ5acn+vpZ4wZ5DLjlB9jisadD09mTTZUpLZE5/x3TRVkEiY5JCiVwVPonvj3KbcaAPxdUBKcKqJhID/GSb7MHqIsuytzAhN3y3x0Qc10x6zV48AkiULSJqUxuzOL1ektfNVeq2BwnAI4hAHNutsIlLaJAU26bctfObCdpiSPEWtQwteytnvituEjXIrcbAZE3OFr20ti/N+iKgtk3gCjF14J8ye4Sd5JIU8qJFzDWq44lZ6ZOmW7EsQZHlo7Jz8PTsZhYMU/gPB9vTV0gLryrQrlQ93Sw9YafivSpsTpwI60xspE10fN5sbo1jz/jX1cd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjpwjYSNDmGlhVOF+Agdgyj8Tcb01nV3M5I5ptf458=;
 b=VQcepyBBMTOZLz7mztc7TgM1YmY8m4S8bkf8+4MG/5Sbpq+QfTNabJuUvg6qw7VDVmrgVgPDPJHV+p+4mGjHEr5oPsz1OW7MQjZ55njMyeabdHEUiLoCzML4vAdUb7rS9Z9Q2dYTzfQv6eRP5hW/1EvqejlQjzfcSx0ILsZY23KA3Y8dtqCP9gjwW4AKEvuRu2kKHKG9jsnUfJaoiR7zSHItLi3R2H8qRcrIPWU+Zsg5xkWZScRFJlSk+Il2KV/ce58jfM3qKlSGE3nhh5vvWYXvYFP48IjQIyyIX2mWh8jr1f/8sfF8OCER/IC4Sq9jBZkk9ee7tXs4OovMJ7IJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjpwjYSNDmGlhVOF+Agdgyj8Tcb01nV3M5I5ptf458=;
 b=C/joV7RVv7ByFiKzgPS6imsa6vZKxdMLl77Czkli/IZD11y3+t1h3OfUi8gtzbUtL72TYFWF0iR7XnmppXa7SP9GCl2bkmQAe1IV0xOolTAJLx9SPobRdGKTCVMjHX9C8TfQN/UAlqEqkxTDF7gvdoRcChaoTxQX21oNzGi98sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Fri, 26 Nov
 2021 07:54:17 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:54:16 +0000
Date: Fri, 26 Nov 2021 15:53:56 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 12/12] drm/amdgpu: drop amdgpu_gtt_node
Message-ID: <YaCSlIKLVVwOGQRz@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-13-christian.koenig@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124124430.20859-13-christian.koenig@amd.com>
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK2PR02CA0148.apcprd02.prod.outlook.com (2603:1096:202:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 07:54:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79b6ef96-b944-44d7-6873-08d9b0b1f217
X-MS-TrafficTypeDiagnostic: BYAPR12MB3479:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3479DE1D3C68AE96EC3209C5EC639@BYAPR12MB3479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OHVWbvicbLUPGK7urHFLtskjYE/cpqr9JMAXTNso3lTg5JnKYCPlgh9XXQJRy4f7RGfFH/cOvOyAYcqp0A2PwoSeLVlRrb4nr1KK5uB5ZS6vlHpbeaPqn2rYMQ57sohCJGwlzskS24XX883oOQymKID3fJwWpPtBL77wDt4Am5rjvpeLs4AqecfBMFwiPi3la37vjePmrScOesW3udwpuEbb0geFGGg4+3WrKXw4eiFlpXvqCue4a9wEAwuitnTjP6guGhi/9I4Slb8uAQGRBLT+VhsdRPRa93SWOmgxAZ/ZqCVAE4J+ByD9DHi/Mu+zbvMROTkKOt8YvtPFzBKjZpV5d1rJo3Tn1PdhdvgE6owSHHollvUspkdv4JB62Oz9MMY8nOw3XRGCFoyyHe0vryCyLW1Kk5dNkTZfHUQ+S2UNAeRvrChHoj+o0CyQMwlOLR7dxIY2RUDykO+hB4Qx9aiLh8NVzG22FFSw+vrxyuovrB/PBs4b3sJrBQRBSbQNaHWDNbRNGiuOyXvPOntY8FX+EheyL8JIaHThv0UmmkGNobq+hUuU8Ag3g4u8kN+e7OrpAgyL6EXtEhYR6tixe923EXFnV9oQl2q4l0995IWwbII9BosPQv5gFHa5KC5kjCCfoEkTonZRggv6GzRJ9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8886007)(4326008)(66574015)(7696005)(86362001)(66476007)(66556008)(508600001)(6666004)(8676002)(316002)(5660300002)(186003)(66946007)(6916009)(36756003)(54906003)(2906002)(83380400001)(55016003)(26005)(2616005)(956004)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LvHtGc71QZLfcde7raPIsOtFoKLCyIrsfy+LYT5ztle+8iQybvJVCc4DTm?=
 =?iso-8859-1?Q?YiLemtS9Ij46goRB9/GjENrVUAJ3GgZH7sQe7vtOlaTWqQbprQdOFNwdnJ?=
 =?iso-8859-1?Q?VQ8ze6LjCKX9zi3Cs9tpl533gphorAS80Rl0gTv+AUOOMyK5AoUmWzZM02?=
 =?iso-8859-1?Q?IZjQUZAtqEnDGVQyGGhjFrmuaReTE6E+c/cz+JW08eWHVLtiwMbTofx0T3?=
 =?iso-8859-1?Q?hHV+CVR8lAh+Wq5GYUOf3srBEkqVRJe3iR+4ZJilWTL/JkvR3yQjnqzVOp?=
 =?iso-8859-1?Q?b2vqxCWnfVl+dJLOqc+8GGiLcraVn97ADU+5187mpD3wEIUr86FMvrNPDr?=
 =?iso-8859-1?Q?sQOw5Dnf6kwYXuZfzU+x2a1Dq5hYBdHQ1BMk0cXXoUTpTEO9lPMSbZ3KiD?=
 =?iso-8859-1?Q?mVPujetPmHCTejQT6pCknFgMyfz5xtgTc45nuMtSXRLORxBg4x07qsLjBJ?=
 =?iso-8859-1?Q?TbAnfyGecX7HQnY1uJQmy0eMRE6Nif/4swrJB9XAVGVwZgeu/zPA+umqUz?=
 =?iso-8859-1?Q?KQo1o4LXppNa1OiMc9C+pD0yN54fjeM3WKV1Syvsdkq5wIuEMZFMUmMmBy?=
 =?iso-8859-1?Q?p5hN0I0r6FUe5oCscVHWVTisqQ47Z3rJ4d9UpdnunblaXnsm0Qf9qXHBPL?=
 =?iso-8859-1?Q?RbBGGyR4nGIxjdRxbF8pdBdYT/Qx9SArXJd0Oe0LNCDqdFI5aYp0drMo8F?=
 =?iso-8859-1?Q?tGItKOma//at7XYC4DvT0n/TFMm8QRjUxJ7lmv8EHlbpgUVKXa3gubeZkA?=
 =?iso-8859-1?Q?9iBbBIATTg3VR8r4pVHa4SNM/UJ2Q+KzOvO04AaH+LIW8IYZDAQ253vLwi?=
 =?iso-8859-1?Q?v/x4CH50IurT2AJuKYVBJQWxVMC0KI5hbsGxdf+3bEDlk44LSQbU9PlKuC?=
 =?iso-8859-1?Q?+ALisqkZnHrNfMCI6qASiUIYJzkcBuMWqH57YawS7GUlMLfswVMkLsbHJc?=
 =?iso-8859-1?Q?b8ZHXHNcOjfjNwM1cqb8dtFy3eh+0EeC7XM/mpRrdoHQHNGeogyKzydW+7?=
 =?iso-8859-1?Q?PMKKiTqmljoIGAQZazw2xY6uW1lD6S3P0j4Wtn88u4y7hlUg67xK2rMj5/?=
 =?iso-8859-1?Q?rfd6aFIEKQnOP+nnClG8fcHN1xRHnUbIUbl0HGyeIe0jOHkNOdCm3BQy5h?=
 =?iso-8859-1?Q?Sp6EFs2T6eCkRzPiQWM/vYZ2JWGXjooeoLvPPL26fXWgALbO9vdJ7MfuIs?=
 =?iso-8859-1?Q?oROuV8X3vTeunxbBHXakUo/U8+3un8AKzqpJnfR1v65InBf1ZXG2I4iC9v?=
 =?iso-8859-1?Q?YRrGDEb+WWuYv7VcbLGehg4QQRKF2tuSMQiB/nWOP9IxnpgI1OOP7YpvzQ?=
 =?iso-8859-1?Q?ggBm+9MfmlN1W1zOqunadfKXr/YckrVN+uVm2Sf0IvCHISUHWUQ17vOue6?=
 =?iso-8859-1?Q?p3gY8hqKsyjHwpugkvHkmpyeymmqF/4XJwR/2BtQDSLjnTFguFDnynIu3V?=
 =?iso-8859-1?Q?yCLUPPoy5I9n0zSPMUvdeljNCnUGDcePUU3yFfRdh3LW7L8de+bUmsoTQz?=
 =?iso-8859-1?Q?9x2FhJBjMLsB5HzGnhAYKPaBXR+zlY0qjifNoLmAa6Upz2o384O9nplHaB?=
 =?iso-8859-1?Q?eDuaMtU5TM7ur0HfdozDDGZEy7xAV9gccFKLfujzCjqT1X2sEt8+XVHCBf?=
 =?iso-8859-1?Q?W8D1HrGigZvC/vHIT+kCvb1hjkCaoNQ0O0UDegQvH7A7mqTjOR95bSDjxO?=
 =?iso-8859-1?Q?o5cftnE787W+DwTdNW8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b6ef96-b944-44d7-6873-08d9b0b1f217
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:54:16.8180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTcAtnbO3D1P4LyKqT2VaLDJLlvy7w8SaxFhjZKHQG65dQhrl9dt74HYkPhKc6RRZBZ1QqMc1ZVK1W98WVy4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 08:44:30PM +0800, Christian König wrote:
> We have the BO pointer in the base structure now as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Patch 7 -> Patch 12 are Reviewed-by: Huang Rui <ray.huang@amd.com>

I need more time to read patch 5.

Thanks,
Ray

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 ++++++++-------------
>  1 file changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index ce5eeb3c1097..a55bbe1a154c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -26,23 +26,12 @@
>  
>  #include "amdgpu.h"
>  
> -struct amdgpu_gtt_node {
> -	struct ttm_buffer_object *tbo;
> -	struct ttm_range_mgr_node base;
> -};
> -
>  static inline struct amdgpu_gtt_mgr *
>  to_gtt_mgr(struct ttm_resource_manager *man)
>  {
>  	return container_of(man, struct amdgpu_gtt_mgr, manager);
>  }
>  
> -static inline struct amdgpu_gtt_node *
> -to_amdgpu_gtt_node(struct ttm_resource *res)
> -{
> -	return container_of(res, struct amdgpu_gtt_node, base.base);
> -}
> -
>  /**
>   * DOC: mem_info_gtt_total
>   *
> @@ -107,9 +96,9 @@ const struct attribute_group amdgpu_gtt_mgr_attr_group = {
>   */
>  bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
>  {
> -	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
> +	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
>  
> -	return drm_mm_node_allocated(&node->base.mm_nodes[0]);
> +	return drm_mm_node_allocated(&node->mm_nodes[0]);
>  }
>  
>  /**
> @@ -129,15 +118,14 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>  {
>  	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
>  	uint32_t num_pages = PFN_UP(tbo->base.size);
> -	struct amdgpu_gtt_node *node;
> +	struct ttm_range_mgr_node *node;
>  	int r;
>  
> -	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
> +	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
>  	if (!node)
>  		return -ENOMEM;
>  
> -	node->tbo = tbo;
> -	ttm_resource_init(tbo, place, &node->base.base);
> +	ttm_resource_init(tbo, place, &node->base);
>  	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
>  	    ttm_resource_manager_usage(man) > man->size) {
>  		r = -ENOSPC;
> @@ -146,8 +134,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>  
>  	if (place->lpfn) {
>  		spin_lock(&mgr->lock);
> -		r = drm_mm_insert_node_in_range(&mgr->mm,
> -						&node->base.mm_nodes[0],
> +		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
>  						num_pages, tbo->page_alignment,
>  						0, place->fpfn, place->lpfn,
>  						DRM_MM_INSERT_BEST);
> @@ -155,18 +142,18 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>  		if (unlikely(r))
>  			goto err_free;
>  
> -		node->base.base.start = node->base.mm_nodes[0].start;
> +		node->base.start = node->mm_nodes[0].start;
>  	} else {
> -		node->base.mm_nodes[0].start = 0;
> -		node->base.mm_nodes[0].size = node->base.base.num_pages;
> -		node->base.base.start = AMDGPU_BO_INVALID_OFFSET;
> +		node->mm_nodes[0].start = 0;
> +		node->mm_nodes[0].size = node->base.num_pages;
> +		node->base.start = AMDGPU_BO_INVALID_OFFSET;
>  	}
>  
> -	*res = &node->base.base;
> +	*res = &node->base;
>  	return 0;
>  
>  err_free:
> -	ttm_resource_fini(man, &node->base.base);
> +	ttm_resource_fini(man, &node->base);
>  	kfree(node);
>  	return r;
>  }
> @@ -182,12 +169,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>  static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>  			       struct ttm_resource *res)
>  {
> -	struct amdgpu_gtt_node *node = to_amdgpu_gtt_node(res);
> +	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
>  	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
>  
>  	spin_lock(&mgr->lock);
> -	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
> -		drm_mm_remove_node(&node->base.mm_nodes[0]);
> +	if (drm_mm_node_allocated(&node->mm_nodes[0]))
> +		drm_mm_remove_node(&node->mm_nodes[0]);
>  	spin_unlock(&mgr->lock);
>  
>  	ttm_resource_fini(man, res);
> @@ -204,16 +191,16 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>  int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man)
>  {
>  	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> +	struct ttm_range_mgr_node *node;
>  	struct amdgpu_device *adev;
> -	struct amdgpu_gtt_node *node;
>  	struct drm_mm_node *mm_node;
>  	int r = 0;
>  
>  	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
>  	spin_lock(&mgr->lock);
>  	drm_mm_for_each_node(mm_node, &mgr->mm) {
> -		node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
> -		r = amdgpu_ttm_recover_gart(node->tbo);
> +		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
> +		r = amdgpu_ttm_recover_gart(node->base.bo);
>  		if (r)
>  			break;
>  	}
> -- 
> 2.25.1
> 
