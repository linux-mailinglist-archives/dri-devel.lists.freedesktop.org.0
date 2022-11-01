Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B87614CB9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55B810E3D3;
	Tue,  1 Nov 2022 14:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C9710E3D3;
 Tue,  1 Nov 2022 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667313413; x=1698849413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZDwnUkLEt7J6WJJAjmT5ZeW8joowF0TCjnBC7UMX46g=;
 b=XW4v5pU6rHeAFjdfQffbxOZyDlkGg8JsxM8gRvL0gbXGJgSqw7WWRfop
 O2Org4yK8WoYNagcrLMp2gKaukASFZfUUNaEX94A5L7GfCwnTgcMX8Loj
 tadFRzv2H9BIqMGb7uSoN0bffdUYEd+Za+uf4ILG6/PPqoXQYTFEsomsG
 XWogxz4bwGoKCJ/1wou5Yd0b58JQRfOTGVT13hV+1LUgvDyoepPZ9UvFg
 ocua1fa5kf1WprXM9e4CWhYppZWjciEXOQ1i65E5TWlZho7PHX43Eng8b
 ryCAHqxLp0C7zW0DzEw3VyIflEY54z2sRrrot6+YjBf1Oo4QEeGq823wH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="309144625"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="309144625"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 07:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="776509437"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="776509437"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2022 07:36:52 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 07:36:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 07:36:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 07:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npvG2i0LgZ6D4UZPqPf+A8J8rDqSfTQwMGd03xCWlr92WSdOwHDXkIw2Oq1M+K8bf+xjZiA6OZJ4/sjiodzp5sgRnqOv4f2nRbDsHiZd4GUMWZY4qnS8BXpVPM7iRolJ6pQCqTnWEQFsSc7ukuNetSOSH2QYtGWXAhaw0wjX8LnYwmfpb11WIKP07h3ZqkRBDY4Bp65005n+mtFWQPwYDTCupMP2FPo99kA4yUeinGRwWxL6i+wm4WxPZyfpntuUpaLnhLVVYcsz6dZrAarlE7ols5lworwyRaWraSK4j/ADtl9CDLAVfvUym40j6yTTMsYZzUC8xprqVnYEtL6ESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww8szQGrglJyjc/zPf+CaXE4NPSczft9JrRw9WSR/+g=;
 b=mIuLwZrhhGJ5xTGxWLXO0K+ep699WXzky7AbKpT5j+FeCGfEKW4IBDEMbSqVBDr0vyWqBDJsfi8c1MxOYnCXhghGZbsiKTIbkIW/Wb0ZoEOKcqAImUKaZ4SVB3Zjl0ESSPxWTECQuC1HCnQAkYOsU3fidkubVB2CpAhDnbqBHg/F5ir6kyg5EhG7hqot1CTib98eeYUmtaYFPVnn9hSb+z76EYmxRqTwwscME1HjHtTIGwjsAsslrAIN2Hu6j7JjFEkXme39MmGNzzeuNI+2QUpJ+92ftzLLPJZOa1c2GMq7NB4wXn9XPH1oAA716B4hnu6xKdvn/9ElEPiV0o46uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 14:36:50 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 14:36:50 +0000
Message-ID: <57cb20a3-b80c-25c2-ab27-52134982d7ac@intel.com>
Date: Tue, 1 Nov 2022 22:37:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 02/10] vfio: Move vfio_device_assign_container() into
 vfio_device_first_open()
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
References: <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <2-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 64aee8b1-e3c7-486e-8794-08dabc1682b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJz9IftXLVvtFk/ScBt0ZV3xmy4cHxp/HzXYgfekN9IArjMS7l03PHypE0FtWdL484eMQhROH/qaVWAaAzX1jwLpVjHs6RZlHVZWeKTfRvZOYgeA8lmkkn98ZDJ8Mc5N78XIKRhdN1CCa1Ms7B4WZVW0uTBII9yMElZ2TC8TnRbrtZO+wpbroosfXDhLPpE+qzSksZplFD8US7V12Yq+5iK0rL1D4py13XQ1s2x3YlyrBqb3cM+qa/xxVKvkY95L41HMCkMzDGGdYA46XSG10oD3hs+KEMrUYBq2Vm4q+qqWxjxNQitDKC1dzYpqaCFv06s4hcU1nVEvdFwIZaHpw3T7gUZE/y426+cnXIesoLRXPLh8uCsBeSwAWec//2xOyMJjJ4wlgQ3Tu74aS8Opj4QffC3XKRZEl5Xjw0+etFC0SJWiRv/B5uIp2VOvIquaxkl7wZyC6FavIwdOA0WYQ6KWnrvNov9LJXXYwTA+j7rlSTqjFF183Veq/7lmzMzCwEpB1PmwY++EZQvmxV0cqX3VHiztH2fhaJ45QKvh2laWBKq2x4UTyQZ6Rjeh+dLX7hOcqegxxcjVOfPv10SbVBfSqel4tKyLskHMqHC/I5vqaewG1GKg//Jh6jriQz6jJHyf8S6IsUxpvccm+ddOSCWEiLo+FlXApL0KEc6VwKEuqwMwsb0veoMkBXlgMQc5BxZ1ktvYq1HhRYxRe0hLea/dG7yv+chbb6tNY23dXYy5rlZJRjFrcmRrNtDwvDd+cLGRmUZauwtfdNOAhWB3+R1+jztIn08jcjaR0u1n8lYBYf30qK9VpBzKExeaugl2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(31696002)(36756003)(86362001)(31686004)(82960400001)(921005)(38100700002)(2906002)(83380400001)(6666004)(6512007)(2616005)(26005)(6506007)(478600001)(186003)(53546011)(4326008)(66556008)(316002)(7416002)(6486002)(54906003)(66946007)(7406005)(66476007)(6636002)(8676002)(41300700001)(8936002)(5660300002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azhuOEFVMnZuNVFBazhhUXNKU2M1ZHJabGMreEJJclRleE5TUTM0QzE5b1Fx?=
 =?utf-8?B?Skd3WTJsYTdVQ29YeTNFSk0vUmpJbTZNTVN1cjJaV2tzWkQvZnlDTVU2M005?=
 =?utf-8?B?QlNNdC9TRHJLMzZRQ1RXVlg5ay9FQlV2eWYxaldNaDFuRDBRc01OS2R0WjRU?=
 =?utf-8?B?aGdaeDBLT0svaGJGb1dHaU1kb3lhRmN6QVdOb3JSVjZhY2I5dWd3TndxTldy?=
 =?utf-8?B?WWlUK0d0SVFEamJRVkpCRlF3OGxPa3VST2ZsbG5vRmR4SjlYZlhGSGJmUjRw?=
 =?utf-8?B?d1dLeWsxd3JkS2pUMVBIcHBuOHVCSnhKUkZRa1V0VHBmUWxIK1RoRk1ZYjVV?=
 =?utf-8?B?TG4yYzBDbk5yUDRYWHRvWHJsUzl5blFPTGlQS3pGUkdpWTdWUTR6c0xqWDI0?=
 =?utf-8?B?MHp5SUNZR1I4TTlhRVpQeEh2OGZROUpxSk1QSmkvcnJaQkZ6bCs2cXRxWmNw?=
 =?utf-8?B?TExWQldQaVJJWHhaMktuditIZzVCMnkvZ0lJYlFQRlRpQTdwMUVyOWQ2RTNK?=
 =?utf-8?B?NjhsVktWUTlNK3R4ZDdzcm04VU5CZ1MvT0UvT1pEY1FSNnN0a1k2OFZwOWFm?=
 =?utf-8?B?dG9KaFIxR1RWd0EwVUZLRVRIdi9SbHMzT25aMjhDejZCV1JCVjlTWVd3WWY3?=
 =?utf-8?B?ZGphVStkSXVuOEdwc29FTHk3ZW9lNXBTcnJOdlJIUUZUcnZYY21jQ3lRQXJP?=
 =?utf-8?B?TWo1MUpoUVVrQmI3Sy80QlgvbFV6NjBRZitTNmpxTzdhaTJ2dUxzem5sVXE5?=
 =?utf-8?B?RENGT0lEdzVEbXpYUXVxUEdJbjVLM0ViZDM5cEpnRXozMnZsc1g0SHBtWFp3?=
 =?utf-8?B?YlRCR3BUSTlYWUNjVWRpVlJUY2gxaUJSaFg5aXppbU5FUURLRWMwcjdRT3Yz?=
 =?utf-8?B?YTFrUHFFa0JpVy9RS21Jbk9EU3gvdU9jM01mZzJ1SjZNQlpiR0plR0QyWXpJ?=
 =?utf-8?B?UHVrMUhJd05LL09JZE55SDc1bHVNRTRiOWMzMWRrRTdzWExUUlRON3ZiVzJX?=
 =?utf-8?B?NFNUTXFoOWNpTEJ6aisyc1UrTmQzWWt1UXFjWWU5c3NDSlM0SzVQbDJIYkQ4?=
 =?utf-8?B?TW1ZZnFHZGV2TTlaU2hWSkM2N3paOE41MXRvL0h3ZmtiK2xWaGJwTEltMitt?=
 =?utf-8?B?czNEd25lakgyZGliWmlGRzZFeXVEcUtqUVJ4akxHWGNsV2w1eXBmaDJlTlpQ?=
 =?utf-8?B?b1JPL21BanhkZ1YxTnJXa1kwVkszRUIrWHJyU3ZLWHY4MlpreHdnT3p4NzdM?=
 =?utf-8?B?d0FydVRaUllKRlNXaTVzYVpwREU2SzFlMmtZbHZPN0NNTFVpaEZ1ek1kZ2Mx?=
 =?utf-8?B?N3R3cDF4NEtLUzBNbGoxLzltVGo4Q2V5Rkl5dXUyZnFCOGhzRGlBaTlIQUND?=
 =?utf-8?B?TzdNa2tsV2dha0hOeVY2eWZIaGJIazc0NjBseURaR2p3RWJoRUZWRUtpL2JZ?=
 =?utf-8?B?OEtuZjZ6N1RXRTZGZmFtM25xVlFaL2VjcUJMTXIvbW1RcDlyYVlIcEp5M21K?=
 =?utf-8?B?N0dJN0tyKzBjWjFHMTdRTXNMWWhMd21GNUtRR0VPcEk3aVRxTHVPNmxnSmdq?=
 =?utf-8?B?VWpRQ3M3U0tna2ZXU1lVWjUrWmFaZFhtcGZ0TklqdFlSVmk1R0haNVRqRjZz?=
 =?utf-8?B?T2t2ZW1ORGIwczR2NWc5UkxzbEl2RFF6OWJzeTNub0hlT2hCQkVwVU5ZcEk1?=
 =?utf-8?B?dEhqYSt4V2xsM2JPdWZ2dTVDb0Fjb1JyaXRTRlpSNVBnZE9rUUhZdWxZYTh2?=
 =?utf-8?B?NU9odWNqWUNyS2J1MTFOZGU1YmhDNW1WL1AwV3ZFeE9hUm9Db3VYQ3lkUHpC?=
 =?utf-8?B?djgzaEZFVUZHTThDTm1ZczNqNlNEbUJLNC9sa3h5WXNza0lmZEFGRG9UOFZZ?=
 =?utf-8?B?b0N0R29LbDRVU2tXVzJITksranRsMXBYcE5GS0IrOVJEeVppZm9aWHBkZFpT?=
 =?utf-8?B?czRndzJyU1RjN1BlK0lRM01pWTRvTTE3enh3aFRvanRYTkd1YWpScCtVR0dH?=
 =?utf-8?B?WlQ4K1NyZXJteFNJSTd0TVRHYUl0ZWZNVk5scVNDUEd3S2RRdUJMRU9nb1hz?=
 =?utf-8?B?LzNMM0ZzWURrNmd1OUhiSExtV3huSEFLZTQ3QVhqRVFmRmNuVjJMTTB6WWY4?=
 =?utf-8?Q?Zv81PJBN1WCQKFCO6KG9cTWQK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aee8b1-e3c7-486e-8794-08dabc1682b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:36:49.8751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nln4iUfuwkRVqpQ4t+XEXKhv+tJRFjVzO3ZsESnkFyMyhQWiD5LlzlVVTJY9jTKTTucPWtIff9GWXQkV78oELQ==
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
> The only thing this function does is assert the group has an assigned
> container and incrs refcounts.
> 
> The overall model we have is that once a conatiner_users refcount is

typo.

s/conatiner_users/container_users

> incremented it cannot be de-assigned from the group -
> vfio_group_ioctl_unset_container() will fail and the group FD cannot be
> closed.
> 
> Thus we do not need to check this on evey device FD open, just the

s/evey/every

> first. Reorganize the code so that only the first open and last close
> manages the container.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/container.c |  4 ++--
>   drivers/vfio/vfio_main.c | 18 ++++++++----------
>   2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index d74164abbf401d..dd79a66ec62cad 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -531,11 +531,11 @@ int vfio_device_assign_container(struct vfio_device *device)
>   
>   void vfio_device_unassign_container(struct vfio_device *device)
>   {
> -	mutex_lock(&device->group->group_lock);
> +	lockdep_assert_held_write(&device->group->group_lock);
> +
>   	WARN_ON(device->group->container_users <= 1);
>   	device->group->container_users--;
>   	fput(device->group->opened_file);
> -	mutex_unlock(&device->group->group_lock);
>   }
>   
>   /*
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index d043383fc3ba2b..204443ba3b3cd9 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -749,16 +749,22 @@ static int vfio_device_first_open(struct vfio_device *device)
>   	 * it during close_device.
>   	 */
>   	mutex_lock(&device->group->group_lock);
> +	ret = vfio_device_assign_container(device);
> +	if (ret)
> +		goto err_module_put;
> +
>   	device->kvm = device->group->kvm;
>   	if (device->ops->open_device) {
>   		ret = device->ops->open_device(device);
>   		if (ret)
> -			goto err_module_put;
> +			goto err_container;
>   	}
>   	vfio_device_container_register(device);
>   	mutex_unlock(&device->group->group_lock);
>   	return 0;
>   
> +err_container:
> +	vfio_device_unassign_container(device);
>   err_module_put:
>   	device->kvm = NULL;
>   	mutex_unlock(&device->group->group_lock);
> @@ -775,6 +781,7 @@ static void vfio_device_last_close(struct vfio_device *device)
>   	if (device->ops->close_device)
>   		device->ops->close_device(device);
>   	device->kvm = NULL;
> +	vfio_device_unassign_container(device);
>   	mutex_unlock(&device->group->group_lock);
>   	module_put(device->dev->driver->owner);
>   }
> @@ -784,12 +791,6 @@ static struct file *vfio_device_open(struct vfio_device *device)
>   	struct file *filep;
>   	int ret;
>   
> -	mutex_lock(&device->group->group_lock);
> -	ret = vfio_device_assign_container(device);
> -	mutex_unlock(&device->group->group_lock);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>   	mutex_lock(&device->dev_set->lock);
>   	device->open_count++;
>   	if (device->open_count == 1) {
> @@ -833,7 +834,6 @@ static struct file *vfio_device_open(struct vfio_device *device)
>   err_unassign_container:

should the err_unassign_container be renamed to be err_dec_count?

other parts look good to me.

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

>   	device->open_count--;
>   	mutex_unlock(&device->dev_set->lock);
> -	vfio_device_unassign_container(device);
>   	return ERR_PTR(ret);
>   }
>   
> @@ -1040,8 +1040,6 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>   	device->open_count--;
>   	mutex_unlock(&device->dev_set->lock);
>   
> -	vfio_device_unassign_container(device);
> -
>   	vfio_device_put_registration(device);
>   
>   	return 0;

-- 
Regards,
Yi Liu
