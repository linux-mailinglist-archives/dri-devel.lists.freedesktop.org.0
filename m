Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66796458837
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 04:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788686E15F;
	Mon, 22 Nov 2021 03:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741AF6E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 03:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4Rsw3bbHTvCFdesDTEZoqovIdtBs/l9uqQXC0eo0JLAetc4ZmbFjLzJiNN9ESbjiOjEOXNjvTSVlLnfljqx7CvmJiTSp+SQez3QRM6SStbZu8yNV0CffWrWdWgQJLYUWBnL196/VuVGnn+ofT25fZR3sDlSElSP2A68idSUx3OgoQi5sL3YkjgZn3/ZXrZWtwsmXvWYLClidq8JWyg894Kh9B+cs5Nu1FMai93xa1W4fJtFfeGf74ngl03iIPSvXPNgk1E2rPBncBwGfPoOdKGy/MetLMbQmucWcv/wDjvUAmRVJWH8Ym4vbdnmuJKL6kE/UCpwAYK0qveZRCENNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npJGYoMDNG+vBWY2QQWwspi60XxIlFn4PWvZgsBvBhE=;
 b=WS9kf53qXYmDy3pCJryds15FovepHBBdyxewFovJFkso3g3uHNuT4HIRAq22k9LSAUYb9kS52wbNSYld0iQGEMEYJl0PPRSTHolX9Deuu/dE0o4E8EdP3qNXUoPhWCB4G1c8ee4NbaUvgHmtiLt7p2isToPLJffBHjnGn51K1jZp5GA0qF36pZkEBTyIBt+CKRF+SvbBB2Wz+kYdCwM/4Eaisj+EH318YRaMve94KDmFcApQlGUcgSd8g7Ws3RNPalx9aKfbJO7dHbGANsPstJG5YyCjP9y4cEIkPT1PD+jOybXWEBbt1h3G1M9vb7av0DupcQmWbZzoG0Rumlsjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npJGYoMDNG+vBWY2QQWwspi60XxIlFn4PWvZgsBvBhE=;
 b=jpk9PELEOmXEpoYUOAkyLMyAft9v3cWiNEFN9fRRoo818K5pi9rLkNGyky1vp1lNELg/hECelueWnBbDvPLJfAYJTtNKKcFcoub16eXF4u+NyxB13jAbja6FsxBUZ9XHnZUybNVreWPzL9ngbOpUABAYbeVOeHgVPIWHz8jLMnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BY5PR12MB4019.namprd12.prod.outlook.com (2603:10b6:a03:1a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 03:15:11 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 03:15:11 +0000
Date: Mon, 22 Nov 2021 11:14:44 +0800
From: Huang Rui <ray.huang@amd.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm: ttm: correct ttm_range_manager kernel-doc notation
Message-ID: <YZsLJOUUBMnBUCu7@hr-amd>
References: <20211121155453.29736-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211121155453.29736-1-rdunlap@infradead.org>
X-ClientProxiedBy: SG2PR04CA0181.apcprd04.prod.outlook.com
 (2603:1096:4:14::19) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from hr-amd (165.204.134.251) by
 SG2PR04CA0181.apcprd04.prod.outlook.com (2603:1096:4:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 03:15:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a126940-742a-4615-0923-08d9ad664b6b
X-MS-TrafficTypeDiagnostic: BY5PR12MB4019:
X-Microsoft-Antispam-PRVS: <BY5PR12MB401953D44662A02A0D51D74AEC9F9@BY5PR12MB4019.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YafmOtNKPe4JaVtST3FdMh8FYm+loPBXwsfdgALalrQjbVKT2e6Yrc4LqYporQGOTd5OD7owixuXpiGka3Q6WACCYeUdAg9Aqptk/+l9U6RkfJmrEm7LRQoH0AD7i5S261Moet7o/dnRD9FDAv+bBhyHk75T3jKWHQogOaa4/TAICBY5AK/pgTwDDH+2Lzp/oLBME+ONOxQ/rYdG13xlE8PZcRDw2o8D7huEz5HqhovBD+ms4AgJgWIpg32+dm8VDlalhN6bj+ORZsumsl+HB8jIt8boirlvwx5NbKRszSKyavBIdFcWWX3/e12UXILx6ff6P3wxApVIuYmXid4zMJyNOfgbBSsC5USLlv1h1VrzEqaNJumSqvBSvPv1gntD1gcND2LCA4uG4E4mW79oUx8BsK7QQDUtg2yUpQ8sVKmL4ptXYiwOi42rrDS8/OKdHZtY78QIE2B7NmojWFG5/NAPK5Bcw8oxLMlAVxQnLSAQgYXS1+1baLr8wOqsRwBZREaGF/KnKfdAQdRTQmKq9eADwSWYikK/ZIcbqgkv9ZtuoprZBAD1l+7rrL4Dfob764UrGIpGXmnQWHO2xgswZQXvYNdBxMFmc7R4yuB80QN4QUqhnrlyUyK0oXGEP/ahTyKzLyFkidbyWpOIZ96qMBUjzbcYSJV6OdbOWW6TLEv359kv8uolPFIkHO7/wH/nPA51tcgId+SnxiMwmsM6+kQGVYGmgYB6IQaYPN3VTV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(54906003)(6496006)(6666004)(38100700002)(83380400001)(66476007)(66946007)(4326008)(316002)(8936002)(8676002)(26005)(66574015)(508600001)(84970400001)(2906002)(956004)(33716001)(55016002)(66556008)(186003)(5660300002)(6916009)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ITSBVRPWD+z1H1NqUHtKvm3YV30JsFlRyQcydJM4F2RXWk8dfPJ9hvk3l9?=
 =?iso-8859-1?Q?4jp+2Yx18dqHepAJCmt0/pUfyYxLmvD6wFbYXHbzBwsjdbxJXmIO+3FZBS?=
 =?iso-8859-1?Q?jKGKfRwul5H5QAq6vgb+OiK4AvK7OBbdytHfW0jiiKmxTF0jB0l+2wmfGE?=
 =?iso-8859-1?Q?cDpkW173mqR2LJI/AVIt/H+IEzlBG0cJbgRAzO/TuF3q6V6Nxp0R+Alnc+?=
 =?iso-8859-1?Q?ycURHKTJzZnJ8RuNeeiJswmaE+FCXxITJUWI5aKsgVsNAw71R9JUJZrEJR?=
 =?iso-8859-1?Q?dUS9R3GYs+dHJA3WQuL7y0nhKPCU48akU/iGRqFHBGIrsjrKx+5pvUKkIS?=
 =?iso-8859-1?Q?YQDntgd36gU4Ssos9j6PRfF69YaeYrsgsEDIYqtkXOqgBTuWPmchuMwjF1?=
 =?iso-8859-1?Q?UertvXWChLTJW7s5SfCL+oWaxAFYHZe+oKqpfQpbegBVQ9Nd00oJcwNLHf?=
 =?iso-8859-1?Q?oiOMAHIVLbi1cu+vIIY73Gn3GFzz6arvv1JaAYvc0WjyLxx2JG2fX86vvG?=
 =?iso-8859-1?Q?TQvg6L78S9ply8pwcPf1q7lIpYscgybv5n+ervPPbYIySfOY5QoZl17w2i?=
 =?iso-8859-1?Q?xdWUxd4q46QyggqR5ZXV2gQNcdSivgl2Oxis5sjZGbZQkYD9t5jgvAQ2co?=
 =?iso-8859-1?Q?+lYagJjnHu34sQYV5vHk2mZZIZv+IWnDR7aOqThNwDswzl+cZAzlURthA5?=
 =?iso-8859-1?Q?r3xEWA5yzGGbvDvU6ZCNjsZpRD0w8KZcr8theRoj9BrepyOxcj8Z7HTgVy?=
 =?iso-8859-1?Q?ZaD3PBsWUUAhME2naRrINtSNjmWNghQcOIYQ0y2GNUqdTOeWYfiRCw/S3E?=
 =?iso-8859-1?Q?M9ysULjXBlCmx38Sl8kiPDvRNVyG2y48Isfd95dp0FETiJIsiHOxYp7UDH?=
 =?iso-8859-1?Q?HT2K0FmugWMV5RSxXdh1WlRYvqCMSdEWWqFnXI8PloLwQrYw5Uyyl6widV?=
 =?iso-8859-1?Q?ZQbF6KPzB9VT7Z5BJhrHcV9K4x1D08Z2XinBxP8Yxo0RC00t1/IdFwXf6b?=
 =?iso-8859-1?Q?O0GFv5B99X8sJFT18+ar20mbh1vNrOvkwe/N1tGypnA/Ev7F1ZmkJ8EPuP?=
 =?iso-8859-1?Q?RNO6v1EBaH62JhJT6WlBNOh3CxDctK1f50Vith47RfefD9tnzqrtPr9KW4?=
 =?iso-8859-1?Q?SItnWEyHHl8l6L7As7P3SfmUZ6aBvCdsdYD3DSoe0o6tyTScLNRL+kBnLk?=
 =?iso-8859-1?Q?LvojBN7863MPAhPZkOqJoViyg1ujPDY+cQ7xskvglrRyqrN8zwOTpJ/HC2?=
 =?iso-8859-1?Q?E7SW8nBwMLjLpFeeEOAFCF8faqbgI5JOnwSFODOyAXReFmWIiGovyurpys?=
 =?iso-8859-1?Q?EoAqagpNb47BkcWDLGfuKWBBBRJ9y5KHZyWDY39nc9yK8ObSurXPVyL42G?=
 =?iso-8859-1?Q?zSPzBXETm31xYFmYtgT4ftvximTDHx09qgP/6HGklDyJUwDtYqghevd8jd?=
 =?iso-8859-1?Q?f8w0ng260QaLb74LB6vdxDERP0dkNcJjU+4FW6PvRgNf3tUJ8gD8TxS217?=
 =?iso-8859-1?Q?wXg0nBp9HBFHBbJMCERV0AGKQCC69E+1R/tDRLHhQPHKSO/A/b5eC3HPqC?=
 =?iso-8859-1?Q?9a6sI8Y+mPnsqzl2FY+1Xao8VoVn1rG6sATRGy4Vq/n3KPM1KuL+sLTDij?=
 =?iso-8859-1?Q?fAie6qIlnmIh0slb9B95Y0kpRJvif+/QlqG1FcaQEpDuL9ZSabkuwM8E/4?=
 =?iso-8859-1?Q?QxjNV/FEnHP5l1xtqtI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a126940-742a-4615-0923-08d9ad664b6b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 03:15:11.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqfxopqRTwi1mN43QQ78/uhhd7dEhFYzc88QRWbaUk68HdrsImttKyXqsaDNFrbxogWN/4tHL6EUTEj0Cu61hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4019
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 21, 2021 at 11:54:52PM +0800, Randy Dunlap wrote:
> Fix kernel-doc warnings in ttm_range_manager.c:
> 
> drivers/gpu/drm/ttm/ttm_range_manager.c:144: warning: expecting prototype for ttm_range_man_init(). Prototype was for ttm_range_man_init_nocheck() instead
> drivers/gpu/drm/ttm/ttm_range_manager.c:178: warning: expecting prototype for ttm_range_man_fini(). Prototype was for ttm_range_man_fini_nocheck() instead
> 
> Also fix subsequent warnings from scripts/kernel-doc.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_range_manager.c |   11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> --- linux-next-20211118.orig/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ linux-next-20211118/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -128,15 +128,17 @@ static const struct ttm_resource_manager
>  };
>  
>  /**
> - * ttm_range_man_init
> + * ttm_range_man_init_nocheck - Initialise a generic range manager for the
> + * selected memory type.
>   *
>   * @bdev: ttm device
>   * @type: memory manager type
>   * @use_tt: if the memory manager uses tt
>   * @p_size: size of area to be managed in pages.
>   *
> - * Initialise a generic range manager for the selected memory type.
>   * The range manager is installed for this device in the type slot.
> + *
> + * Return: %0 on success or a negative error code on failure
>   */
>  int ttm_range_man_init_nocheck(struct ttm_device *bdev,
>  		       unsigned type, bool use_tt,
> @@ -166,12 +168,13 @@ int ttm_range_man_init_nocheck(struct tt
>  EXPORT_SYMBOL(ttm_range_man_init_nocheck);
>  
>  /**
> - * ttm_range_man_fini
> + * ttm_range_man_fini_nocheck - Remove the generic range manager from a slot
> + * and tear it down.
>   *
>   * @bdev: ttm device
>   * @type: memory manager type
>   *
> - * Remove the generic range manager from a slot and tear it down.
> + * Return: %0 on success or a negative error code on failure
>   */
>  int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
>  		       unsigned type)
