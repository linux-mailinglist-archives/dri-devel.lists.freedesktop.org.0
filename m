Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAD614CF5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982F710E3D4;
	Tue,  1 Nov 2022 14:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB2C10E3D4;
 Tue,  1 Nov 2022 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667313876; x=1698849876;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mxiNnAKSSI1nPyE5hvy2D94SfCK/k3ltMrvk4pEaV58=;
 b=gP0C57GSgBI761q6HdQMjp6kz6ZSYKdhrIUZnHnMtfq15NmmglltkuKs
 humvn8pwt74b18pUFLpRvPhM9XJTlWSFbcidZyYVtpT+ybYNmKOdGYTmG
 9yYFbrh5PxkkkNeBPnPjbpl8hSDSqC7gxY2EH0U8he//M8A83614Bl1OO
 VpZ4DowhZ/ZUWdUSi0be3Y5m1ESELdf+9emRzKr5c2e5ITZpCOQeOPX2J
 EM0BN+yXL/qD+gVenNMZAsi05X7K/i+B9wgX2XJ7+VqOgomr4mWtp/kEV
 Ra3lJuTM3zDPCRBQZVbuimRvXueWFjNQQ4A9/D3wmxCkAHFvikZdNNikz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310857105"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="310857105"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 07:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="611860008"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="611860008"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2022 07:39:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 07:39:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 07:39:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 07:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKkndF+cZClaVFxgoDVyJpBjp0YCQDOCcTh2vx3Sz4MCQFiYcbGISV1TaWNiMvhU1nKtjvvRncM+kLMIQ2YSBJ+Scqb6XDgSJ4n4RY34GQJJ6QbG6D3LpDWT1ERIPjhrU2VWnaJc69WW3I1fLgqMp1edyQWEpeO6Kin1xruigC9Fct+4TJK2t9dB7XquskdNarm2cA8LgnFjfGABLkrKtQHGcfKXZIirCPnZRjW48dzApjJnqwwSpbwnng9MO3UcAq/5GHL5uNkgjtfazPnHrKtj0mdpWFhG58QXlmiXA4tKUtpuc4P37WSyURA+/ehPD8unUiNGVg0UqVvv2s8/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fH3CsHT05ajPnf+LtXIPZvAgK3MDK4z2EKTwV6SQjrM=;
 b=ZhpZsCWMmkGZRiUIuYPdwb4wq3Ex74RdRsZYiBkBzoMi5dK1zsDX9t0D6+HGHWtKrTu82ybTxmb87BkGAY3SgxIVAYu8j10/RZQ5CwKJxajTk3rjER1Z+uCrp3kPpPnO2yQEjsOlRC2HH3iDqZz559IPkVvbvoF8j17GGetEU0FmsIZaSnJBJ8irjMQ5bNnFArbA0nGmaYyVXo28yxgTcDywciFrOQocKtRp2dAC3RdWiINqUVwx6n/4PN5gJ9IYKBjL00bRQ6rxOzTc8/B8lZ9P8PUoClA0QaOUPnFsD0x9eheK4bpquv5y5DRx9M+aBLa/waFSfzs9V8HK3DV4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 14:39:26 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 14:39:26 +0000
Message-ID: <4eac22f8-ef45-f804-9f65-a168900ada8f@intel.com>
Date: Tue, 1 Nov 2022 22:39:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 03/10] vfio: Rename vfio_device_assign/unassign_container()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Diana Craciun
 <diana.craciun@oss.nxp.com>, <dri-devel@lists.freedesktop.org>, Eric Auger
 <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>, "Harald
 Freudenberger" <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-gvt-dev@lists.freedesktop.org>, <iommu@lists.linux.dev>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, <kvm@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>, "Matthew
 Rosato" <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Robin Murphy
 <robin.murphy@arm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi
 Wang <zhi.a.wang@intel.com>
References: <3-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <3-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f15ef40-270f-4ec8-4fb5-08dabc16dfd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JpK24zAh0wz5HY5gQjQ94qzk5XDlGSt7sUuQqaz4xK2Ts7c0eA9pzNh5NCvhVO7w6Y8yKWPFM7f3KtRVRGjXyBGhsNW6PX/wCm0tqvZxLVRJjkd+1heRAe5JWgexbgefXxEypO6YYGi27uKWnJNpMMusIyN6OeWnYSjaA+5hneOWpVckOkQjA0KY3YNqMS0ize1glNCSK/U8uPeqJC9d4ViY787TeJIz+yjViqh2FAfYePl+0cFNjMonp4cy61UW0ErX4HGwqe/yC3qBXB3VuAQ9JlXwpkY1hnH1d1Ly1H4WCKZNYZRBBR1f5LHMJbgLf0x9FQhf1ojrWaA2XwADERAFfUs0sEMepCFCgkHWZ1n/bq4s0oMP7BTNSkj2/QOiWkgWaW1FWXJHDnceovAc8GOsphfSggeE7HJ5Mf63fWI+Ueqrlk+nkYAKJKjtADmcLFr2g50h8fQ2JLMAAcpcAFYn8t0aI/wZVx5Yd4kQnB91YQlXCY3kIc4QG6CWzK4FBwQDR808468UhNQOYZ13aMo7K/lVErYGI1d04mfYS2YzEPU3Umd72yip3rPdRrv7KX5D3U0FcpLNHd/3cKpbeOFdlrLlukVqsgaIX4bztmNKyeb/xyeAu8SuYCrlCdT6rCDe/WIh7dlxCAOXr43Yl8mJI5LfOvoJX7haJZbSardrbBAt5C9+hpwWk3cgmowMdRvROvIzAQV6OGEss3xwLzDzcTNPJ3xL1xhyYjB/pe2cv/2i4j1DGODyEqQeYbwEFxFVRK9Wq45z2RcL4v3BtJpjw0Rv3LZIdtu2GbuxtUa3FNP/+LtGPpzof85lH0XA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(31696002)(36756003)(86362001)(31686004)(82960400001)(921005)(38100700002)(2906002)(83380400001)(6666004)(6512007)(2616005)(26005)(6506007)(478600001)(186003)(53546011)(4326008)(66556008)(316002)(7416002)(6486002)(54906003)(66946007)(7406005)(66476007)(6636002)(8676002)(41300700001)(8936002)(5660300002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm92V242OU5tRXVrQllDK0JKZUJjalByTDFwcEs3WnQrUjIrUm8wNVh4OUcy?=
 =?utf-8?B?ODJ1L20veTJuRmE1M1dSZW5VL3FFWk9RSHZNSzBvTVRyZ1pVTUVKK1lSeEV4?=
 =?utf-8?B?ZDBJSXNqQURXbEFSOHBjYlJvcXkwV09SajlpWTNCd25Pb0s0NkxTenBUSVlr?=
 =?utf-8?B?ZHJrbHJpTHFnaVQ4K2tRQktheStoeEJpeXUvb0FJR1BkblhSZ2o0Y0lYTjZE?=
 =?utf-8?B?TnR1TzluNGRqNzVLb2NEWStGbzJDdVVzYmNFMGFVbkY1VjRQMElnZENvSXFG?=
 =?utf-8?B?N1RnSmZGS05CV1JkSDdBMWMwVkNjOHRwMmt4UnU4VTVNNlozc1pDcjJRZStI?=
 =?utf-8?B?UHZjaGR0QlNPTSttS1g0VlFLdjlVeG04UUVjWUR3UEtaemFzcjUveC90MmRs?=
 =?utf-8?B?Q0UvU3BMTVduM0RkMG9TUGpsQkFnMHROeEkxN0ZhRm5FWjZxRUEyWFJ3OHpE?=
 =?utf-8?B?a0tVV2F4aS9mMExiNFk0VUQ2TWpsK2RYNGFnZU83NGtXaXh3QXlFdWJidk1H?=
 =?utf-8?B?cUl0ZEhUOTNwNWY4cjhiN0l1TXBuNFNNR2RIbXRuREJkbWFSV3oyZm13QnZD?=
 =?utf-8?B?Z0thZjYwalppTUorOXlHT3JVdlNZNkhzd0F6a083VjRYbVZCbkN0VjVlK05z?=
 =?utf-8?B?ZytrMWhxSUxoV2JXTDRTNVM3MXkvaWlKVnY2S1lwR09BL3JJbWtsL3lwVkh5?=
 =?utf-8?B?emFBelF4akpERmRlZGRuNHhVQWV6OTkzaEs2QlBiUGUxVmdQZEIzV1JXdWFa?=
 =?utf-8?B?TkNtUjYyL2pQU1pSYUJmR29DTlNHRk9VME54cGVGeEo1L2N4cE1ad1VxVkVt?=
 =?utf-8?B?WDlUaURRaFlPKzNvUHlYYVF6aUx6VmxkTWNzQ1djUDFWeUJUa3ZZcTQ3N0g0?=
 =?utf-8?B?T0tMT1NSdjMyVklmcFV0V1Z6WHJuSEhkVk95cFhueDRzSlpnRWNMcW9PMHNn?=
 =?utf-8?B?alB0OTFCWkRGUnhDd25RbEpFak1NOEFnM2VMTnJ1ZFhUbHExMDJScE05Yktw?=
 =?utf-8?B?aWZDdmx5Z3RQRklWbjFZdm1IRjgwSTlqa0xsRjZzQ3F2V0RDOUhoRDdHckZp?=
 =?utf-8?B?TU4vYm5UZDJaZnpxOVFWUEtTNjhpTm9FUGlKQWRSa1BzS1dWUFBGeVQyQlF4?=
 =?utf-8?B?ZzVMNzB2RUNZWWRtWDJTd1NMcXU4cG82OXM0ZEkrSjhZcndkTkRnd3JndHlp?=
 =?utf-8?B?NG52SjUyUGFrRytnVTh6MklxcGNzTU5yNEsrU0JoTDkzNWtFMHNkRURvYVdE?=
 =?utf-8?B?bVpmMkkvL1krY2s3RkVQTGtvc3NsYTNIZUk4dkRlQkhoMTdudWlmR3B5T01Q?=
 =?utf-8?B?dUU2M2dDUHZhcDQrQUlSV3VVY3JEeTF4V1JpUklEbERDc0o3OHVlRjdxejNF?=
 =?utf-8?B?RlRSVUt2MDFDZ3J0eVdpazl3RjNsQ01KYkt2NnJvZ05BdU9CRnd0L0JZWFBF?=
 =?utf-8?B?R3pSc0ZKc2JaOEpialQ5R2hYc2dFeWpqUVgvaDZtVHFkTVFWU1NNVnB6NW9S?=
 =?utf-8?B?b3NDTUtQSmRJTDdQdmhlaWY0WGpNaUlSaXhJRHhsditQZnhjakdBY3lxdlcw?=
 =?utf-8?B?NkZYRWd5MEN5Sk1JdDdXUXErYVgwS0p5djVBZXFGbXR3R3ZlVjR6M3NISFVz?=
 =?utf-8?B?ckNIWDN1Tk9RUE41OFlaOGljZ0M4Ui9KcDA5WCtqQlNDRDJtdjQ0dENKM3pn?=
 =?utf-8?B?aTg4dlQzMm1TZTM2TWZ4Qm9VSFhoRmN2d2ltNmNQYzlYOE5rMko1Rnc5dHNE?=
 =?utf-8?B?Q3RxQzJFK3R0WUdGdGg5V0hoNkZUY29YaXA1aXVsZXQzdTJTT1UyRGhPN2sw?=
 =?utf-8?B?NkVHdFpBT3l3c3pGVW9wbTZ6WHhZSmRXSlcvNEVXbWoyWktxRTRrSzJFOVpI?=
 =?utf-8?B?aTUraFVPdWR3TGNXbG1pOXRKWWdscVM0aTZwdmJqSzFPSGd1dXR3ZFg5NnQ4?=
 =?utf-8?B?L01wUkpselluSnhsMHhzOFlscXFKcG1VVzhmdDZhNnpheUNxaDlncExxOXBo?=
 =?utf-8?B?M3NQNXkrRi8zOUVjQkJ1ZlJFaENSZXBlQnBMVGZ0N1FveFRVZFI4dmQzdTly?=
 =?utf-8?B?d1NvMDhGY1VMa2F3S1BGQkFETWZvLzdZazQvVTRwaVc4QzVLMUxuSGVvYXFa?=
 =?utf-8?Q?TtuD+3LZs8yTG7E7o5528tLA5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f15ef40-270f-4ec8-4fb5-08dabc16dfd9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:39:26.1583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nndxpYWEybgyMn3SK2Tkpa+AYQCTIDm+oeKz02FvtBAoU4kBPREITxTug+Pir0Y74H4J58kd7xa+7qpxi3NPdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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
Cc: Nicolin Chen <nicolinc@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/10/26 02:17, Jason Gunthorpe wrote:
> These functions don't really assign anything anymore, they just increment
> some refcounts and do a sanity check. Call them
> vfio_group_[un]use_container()
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/container.c | 14 ++++++--------
>   drivers/vfio/vfio.h      |  4 ++--
>   drivers/vfio/vfio_main.c |  6 +++---
>   3 files changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index dd79a66ec62cad..499777930b08fa 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -511,10 +511,8 @@ void vfio_group_detach_container(struct vfio_group *group)
>   	vfio_container_put(container);
>   }
>   
> -int vfio_device_assign_container(struct vfio_device *device)
> +int vfio_group_use_container(struct vfio_group *group)
>   {
> -	struct vfio_group *group = device->group;
> -
>   	lockdep_assert_held(&group->group_lock);
>   
>   	if (!group->container || !group->container->iommu_driver ||
> @@ -529,13 +527,13 @@ int vfio_device_assign_container(struct vfio_device *device)
>   	return 0;
>   }
>   
> -void vfio_device_unassign_container(struct vfio_device *device)
> +void vfio_group_unuse_container(struct vfio_group *group)
>   {
> -	lockdep_assert_held_write(&device->group->group_lock);
> +	lockdep_assert_held(&group->group_lock);
>   
> -	WARN_ON(device->group->container_users <= 1);
> -	device->group->container_users--;
> -	fput(device->group->opened_file);
> +	WARN_ON(group->container_users <= 1);
> +	group->container_users--;
> +	fput(group->opened_file);
>   }
>   
>   /*
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index bcad54bbab08c4..f95f4925b83bbd 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -112,8 +112,8 @@ void vfio_unregister_iommu_driver(const struct vfio_iommu_driver_ops *ops);
>   bool vfio_assert_device_open(struct vfio_device *device);
>   
>   struct vfio_container *vfio_container_from_file(struct file *filep);
> -int vfio_device_assign_container(struct vfio_device *device);
> -void vfio_device_unassign_container(struct vfio_device *device);
> +int vfio_group_use_container(struct vfio_group *group);
> +void vfio_group_unuse_container(struct vfio_group *group);
>   int vfio_container_attach_group(struct vfio_container *container,
>   				struct vfio_group *group);
>   void vfio_group_detach_container(struct vfio_group *group);
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 204443ba3b3cd9..8d809ecd982b39 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -749,7 +749,7 @@ static int vfio_device_first_open(struct vfio_device *device)
>   	 * it during close_device.
>   	 */
>   	mutex_lock(&device->group->group_lock);
> -	ret = vfio_device_assign_container(device);
> +	ret = vfio_group_use_container(device->group);
>   	if (ret)
>   		goto err_module_put;
>   
> @@ -764,7 +764,7 @@ static int vfio_device_first_open(struct vfio_device *device)
>   	return 0;
>   
>   err_container:
> -	vfio_device_unassign_container(device);
> +	vfio_group_unuse_container(device->group);
>   err_module_put:
>   	device->kvm = NULL;
>   	mutex_unlock(&device->group->group_lock);
> @@ -781,7 +781,7 @@ static void vfio_device_last_close(struct vfio_device *device)
>   	if (device->ops->close_device)
>   		device->ops->close_device(device);
>   	device->kvm = NULL;
> -	vfio_device_unassign_container(device);
> +	vfio_group_unuse_container(device->group);
>   	mutex_unlock(&device->group->group_lock);
>   	module_put(device->dev->driver->owner);
>   }

-- 
Regards,
Yi Liu
