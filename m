Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F00AE59D1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 04:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E76810E49C;
	Tue, 24 Jun 2025 02:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvZtnWG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D06B10E49C;
 Tue, 24 Jun 2025 02:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750731804; x=1782267804;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nfyCtVtiq1i5z5sp7usBugmesEdLSf9a9+zLUgW+H30=;
 b=kvZtnWG4a62LFYO3eZkPHBslfjBjG7lptNVUo/29rLYxZxVkjZmqd/Gw
 VvIWKUNo9spE1xXEwQQwRJKg5YBwy+vp7agYuHf54UXehNHov+GSmTfsI
 +pDlswP0DwBIIgOULoELYEVrPjCQLer6azBhTXJaMZNoEQr49A9A/LMeU
 QRKTBqrsvHGXGlO2Lovty4Azls+wo6W2f269olC0R+PcclzVucDKxiYtw
 0cbuW+2d5QQ+gGIoDXJpxJB838z+32oMklt+vfibJ25IHL7nfeS/G2+YH
 lARf+3fuBrwuC6c8lOssIHfJexnZ5kWhOu5WIZXJmLeiVuL8gyBPAA1OP g==;
X-CSE-ConnectionGUID: plHNYbyISkq86UmgkmA30Q==
X-CSE-MsgGUID: O5IBCEUFSnO2/tGLsHjiGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53048775"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="53048775"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 19:23:19 -0700
X-CSE-ConnectionGUID: MW154cQ9QNyqPgniape/gA==
X-CSE-MsgGUID: DHS5X0p+R7SxujTlXIKbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="151948905"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 19:23:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 19:23:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 19:23:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.84)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 19:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbfAckYbF2kOeTyaOdtmUS3vru+98/M6aBSAfJrBVbTdAqyK1/fhaGu6hU5hFsykDtLmujFpwTy5FrUlAAVYEfXI/GtqRuS3WHfp5LLzj1MZn5IlZNeN2XmH8w5e9PWs02fglXXmzh/5/DImskiRsbJCDY4nQUvpm4yuf22o3szsco+Pf9e7qSb8BfF5QO6fFyC9Al+1z2Hd1gQktY/ormM7s0+yhfZ0w8e55jQjpyH8OpDYI5q5+mjpi/oXuIgBvdNuFvEW3QVb7+Np/XCSNtw916/YKurDGVB76L/c02kxQFjpxKLe8ng0SZwOTt3PxIORfrUZ6t2Fmhyi34HGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjGAp62A8z4NbUrHYQAkl0NakEcKFBbtyrZQRUxqhLw=;
 b=pJqLzdURtNSInq70x8dhtoSWmYtPTQEJcurn4p29fMHF/6Rw+T1PPDu4x77Z3ml8MZXjZTHHyI7VXkGIHjJGs1CYJrUGbkHnzAzg5U9vNBEkThtuBsccaZAWQYnuzW9313aykAe7QBDVbuAGCKPjN8ko+QOUSPFsCR2pVxQVtHHw/0wqhdkEx4ZbUmW0Fb78ks7n0YY0j4BSvWOfEstgbpUotqIg9DB7KnEWHSKE3Djn/+N7gcau5ITdhOKSUvmYAGgwI3nVv88OBTFvwoFn6/LIRArojMnjb1r69RL50+tr27mE3G28MLCAzk1HV2cNQP583SKIf0p6cE+y5HUh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 02:23:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 02:23:00 +0000
Date: Mon, 23 Jun 2025 19:24:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH 3/6] drm/ttm: fix error handling in
 ttm_buffer_object_transfer
Message-ID: <aFoMZ6TMZOVKA2R/@lstrano-desk.jf.intel.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
 <20250616130726.22863-3-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616130726.22863-3-christian.koenig@amd.com>
X-ClientProxiedBy: MW4PR04CA0282.namprd04.prod.outlook.com
 (2603:10b6:303:89::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 778dfc8f-1917-4fd7-3ec9-08ddb2c60a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8veZ5QzLFfXZh5osgPJOEOpE1WvPXHtNm81aHXOH2IHHVnt5cnN+537rWM?=
 =?iso-8859-1?Q?/m9er0409m4TalwVz0FH5uPSGfeZvK4NzkmGdN0cD8RdMlOKo6oGPyJOIS?=
 =?iso-8859-1?Q?dCBnmodxnRt0efjWtGvuY8aXRjcA2boVHkEZnXV5+tpRdpRkdcrCz4jRTY?=
 =?iso-8859-1?Q?cpyBfUonjln10Ll40yvGdNhNoKHHGLQz1BeUNfrMpaCodM+YNPCux9icT9?=
 =?iso-8859-1?Q?AlHTaZ7HCHKS8zTRJi/6uuZBrxyFIAuUjX3Z2QUSWn1s5PHadNyYEcpbbs?=
 =?iso-8859-1?Q?4AQIJym2xJ4mXs/qeNzfq6xirH+/OE9SuSDTexN9pdyLnyYhDwJI1JPDDH?=
 =?iso-8859-1?Q?TR9LDPlij7oK0FPt5Tp2+XjTK0x5T7Qrs+LLxTQAoVaBZZ+At3oKbZXKf5?=
 =?iso-8859-1?Q?NpFD+MmCwBj4eS46x+rHkEoXDS0cocq5eCLcuYFMd7RAGYGApeXTw3FB88?=
 =?iso-8859-1?Q?ObjqcF4epEJCtvn5P8n2H1mzMMYpmHIb32PjaEA6in9FjItU6hcn9mhg5G?=
 =?iso-8859-1?Q?5TjOizSPX7WVrnfpTGHmXuQd0b6FIJyhOYIDs+Fk1AXRaVkiriZRpFEstr?=
 =?iso-8859-1?Q?lvNCE+edxYxue4xAJd3zGH1oWEFj3tCTa/RK/amuas+AlCY1bsWogHzXxs?=
 =?iso-8859-1?Q?cP0ghpi7+FNHStuZuv1+u0y08bCg/1q+CS8aeaI9rvI+z3JRKcwPrF7DDm?=
 =?iso-8859-1?Q?GbxfFTskvVONBHhRZwNIVgFG0aBUtdtHTPsxQQH6F0IsimDVWsC2sYXI2P?=
 =?iso-8859-1?Q?OIX83X/wN1OBqfMN8nU/B3UxGBcSzF6jd1MIE/4tjXV4HV8xxo4FxEtk6Q?=
 =?iso-8859-1?Q?H+39gWfUB15pW0jmQy1QgEz6S4UiRne6L34a+xezv5fGPfNOG/6+qqm4L/?=
 =?iso-8859-1?Q?Xg2F9iym1mSUZsBfIJDwj2SQIt8AtMTizZCeE6CpA0MMUA3BJHtpk+QYUZ?=
 =?iso-8859-1?Q?D2jpmYuN1/xFIdK87+t8NO+vRCTMOG1652Uj1Zo8a8ulKsGI6rewrN6I/9?=
 =?iso-8859-1?Q?+9U6AxS3kOBUJQTWQdtmXAiFSt9vrGoE8ry6148r6pMf7UoGsPcNLVhjsb?=
 =?iso-8859-1?Q?OSXHCtUsuafUDxJsMtBO6X3e5phASx7LSMOh8W75z7js9D3ykmt1i+04qM?=
 =?iso-8859-1?Q?8tMj2aFjUbClzoOuTuV7FY1f6VcArswxgXx8PY//+kzSsh3Y3dEk3BWV01?=
 =?iso-8859-1?Q?4rQc3j3uuWoy6USOMpuTfql3JCagWM3aJGsPYxWhNAAWos7gB9AELH4Wvb?=
 =?iso-8859-1?Q?jdD25wO3E5LtWyPL4VL5/rHIKYrCzxvMdsP2v/TdG+HVVPv+lpmDC33bEX?=
 =?iso-8859-1?Q?jfq6H4JmJJM7hEON3LVHZeSSTrF0yXk+yW/BVVoIxvUl4i6EXPatS9m+VC?=
 =?iso-8859-1?Q?sgatl3Q9uG2VR+U2SH/Ho3Q9KPDJ/FjBTXLb4ad+IQGoWOurpmLn5C2HXW?=
 =?iso-8859-1?Q?x4WE3cyN23zVbmog7OjGAq+xQquf5Zaz1DpmiiapwpKlfker/i2hT8/7aR?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Djxd7UYiUmejDK5Y9PfAk4yU6I/7JD6ZE5i2UB9zTp2YTECnZi/TBe15GS?=
 =?iso-8859-1?Q?vi3vSsF8QBmPkMjhTBmyEAC6Ubyrf/K5OwJ5taY7J91Fds9e3NlU8Y4sTf?=
 =?iso-8859-1?Q?FshaMJDZlsO3/snD17d2rWnL7JXgFGMSsjyJtFIMgqXzYKqsQTlfb2zc8q?=
 =?iso-8859-1?Q?PeIDxcIIAYP8rIgmWJs5oyHyLaxM3zdOBhe+kfCqC5xBQTrnbcq301/0c4?=
 =?iso-8859-1?Q?9J3drKvaSup+3DeEtgS24xyRntDqFewwkMNJSyNgOOvqjeOnt3faYcslWe?=
 =?iso-8859-1?Q?l9QXcxsHE6qXBjzbhjomJYX3le2zfnViguG7N/kCeG9BT8RZnlcRCgmn5o?=
 =?iso-8859-1?Q?l5q8m/ZHGsFrW0zr6ygPpVhYIXSYbFOxZ8J0AdNUuWluSc0ypmLSumhE4D?=
 =?iso-8859-1?Q?9zAfW/oqeSr1wwUv2WaQnTiW2gQtmbtUPAFOAF/J1UXtt5EZUxEW0oIgMU?=
 =?iso-8859-1?Q?eeM9JXEDx8vrN+QUkWlEIaByDniq8Y3RSNAJfIMoxaGy2jgvhb/BdHSuEl?=
 =?iso-8859-1?Q?s/5Nbi0HgB3uYHeXgL1XCBoWQgZuXDTeAZ5Si/MZy/Nd2Y9yiPaIl51daV?=
 =?iso-8859-1?Q?7v73T4Ujq31C4H4fYyk1JAvxftHnwjU6UptMYFe86b8K0+W4Rtj6G6L6tg?=
 =?iso-8859-1?Q?NpRkOYtHCZU8fcSo2BEIhap59gIWxDOiH3VRjSFzwO8JI6L7P5uTesLR/A?=
 =?iso-8859-1?Q?R0w1Q4CLyfCgWN3vjepWrS/UinR4D2IX8V5OCSpIEae2lFE4XlZEDArXj7?=
 =?iso-8859-1?Q?zG+UI2v9y1cjgN5EVVJc20HgU08YH5wngzKzLBFm1vpGY8AQ3ADJH+ILMw?=
 =?iso-8859-1?Q?WjJMkkUrkDp4kw8hZ5BPxE4hrFxcTGV9+6lJ0NxCrxcs3R09T7hqIK3wEO?=
 =?iso-8859-1?Q?vtZfOl5c/0JkUjsA155Czqn9IvGMSxPmU7qUagmhKouftc9ata4MCHqcVI?=
 =?iso-8859-1?Q?Km3M14y95zDmfB485tdjD8Gq2k0lU3kU7Q3+5xHvcJBvHFkeMqYodEPPGd?=
 =?iso-8859-1?Q?PnKUaO66/qY7oBSdQM+zXtXh1y7m3qufRyFLYqZrzZV4t7BeaHiVYuCQb3?=
 =?iso-8859-1?Q?G1tds8cXSetQAFPVcYVslUrRrnZwzuoKvxvy1SiGve7M2ksplV3YrYDwi4?=
 =?iso-8859-1?Q?Xu2Z6p3gdVhD2yU9fZ0De//GYucFiMd/K1Ryp6wAIMCqGWrDGi0X3Ch9Cm?=
 =?iso-8859-1?Q?6qUsxiJIqBNq1aEIssT5BJgSeteRYM8DuPK64nWgjxhZsddDZstdECxoM9?=
 =?iso-8859-1?Q?CE9h3qpnFQkPPpWldqQQUjCXhdqd2bKkSALQnkUvBUkz5zKbWrld4+N1So?=
 =?iso-8859-1?Q?ggDWECjhf437XKpQqOSa2jQCZ1vN3axLof/HY9fSatuOiFcXwfuCH5TU04?=
 =?iso-8859-1?Q?m5s1c5YcQdZvsz5cdhJLKGcwVlG+QWdVVHIYOjuLapQqPBizlxstxJBeVT?=
 =?iso-8859-1?Q?qVT1X7AH15DHZkGsZLs0EQymvlif+KYxwUioWsWD0bUkQ86Cw8SH4yfdgT?=
 =?iso-8859-1?Q?ZTmdpGwPdsOIqRC9Uf1PuVqlqH6jeA1pvL75BYNVZV1kAAHBdIQVE2HKU1?=
 =?iso-8859-1?Q?wo7u1+kyLpz/XQ8t18y/LS3ykgvy0bQ3X1PCbQCmns9uTbq9tJzOpY3BMb?=
 =?iso-8859-1?Q?tE8elsP/bQ5L7p/s3hPA3Yz3mUyRTmDoaWQ/FIC/Q7gEMycRf/G0FmAw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 778dfc8f-1917-4fd7-3ec9-08ddb2c60a46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 02:23:00.5270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zDvshYpjAa9zaxKg74yKRp0KVAUAPCZHwYkWIBfLbfvWbaBoNOSzb/wSot3Zfdl/gzFQ6XUCvvo6o1EBkl6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6064
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 16, 2025 at 03:07:23PM +0200, Christian König wrote:
> Unlocking the resv object was missing in the error path, additionally to
> that we should move over the resource only after the fence slot was
> reserved.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Fixes tag?

You probably can merge this one by itself ahead of the rest of the series.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index b78365dc1fed..56f3152f34f5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -256,6 +256,13 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	ret = dma_resv_trylock(&fbo->base.base._resv);
>  	WARN_ON(!ret);
>  
> +	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
> +	if (ret) {
> +		dma_resv_unlock(&fbo->base.base._resv);
> +		kfree(fbo);
> +		return ret;
> +	}
> +
>  	if (fbo->base.resource) {
>  		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>  		bo->resource = NULL;
> @@ -264,12 +271,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  		fbo->base.bulk_move = NULL;
>  	}
>  
> -	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
> -	if (ret) {
> -		kfree(fbo);
> -		return ret;
> -	}
> -
>  	ttm_bo_get(bo);
>  	fbo->bo = bo;
>  
> -- 
> 2.34.1
> 
