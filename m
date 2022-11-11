Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A79D625251
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 05:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0276B10E74F;
	Fri, 11 Nov 2022 04:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38710E02A;
 Fri, 11 Nov 2022 04:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140140; x=1699676140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgDy9AHmqPS+bJYTSlZQMIAxLJAKbWLly54rTQ7bKyI=;
 b=C3vdyboIxtlYiP9+r+YB6ZMBrAX1OUO7sTKZxHmbQ7aJzygb1cPHZ1pB
 mxvYBpu3iVl7nWVb2OPROawdUFwt/DdVb5RqqYc456MnoTCHbJoEu+1lQ
 dyd3WluktkZjkPzd6TPgtAHUFKAWAwegdyO2pgdxLFqddIjGYJln6QFLJ
 QaO4qzGJTeEvt04fD/TrGqJzXTzMnzXYDU9obyX5APmR63i6NVhPpBLGN
 O20Am/vsE2qNgMud0CAIIxQySaM3qZ5Z7EyKBOJS3Cys0hSQS8cNs6l07
 YfkB32nH+2RFp+HmNSJBczjQa9gCNeCL7ISYDIXpV9zCQz235TJm8+G3y Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="313303327"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="313303327"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="726653136"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="726653136"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2022 20:15:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 20:15:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 20:15:39 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 20:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHLgu4Ck7RkszPLe3nt1ltr85x9UDKcTO1DfA18fHXb1mb6R8R5VzjmQxTCUqaPxEnrVoHS1VZgEncW8UjIGMe5kHBuSrkHe4nPBesUTE0h8dXTDQrTSCnnjv3BU668R+JLUGeVXyMNqUMWNrqOBF3oWXJfFf00F92vT8r17n/uLZcuLze7h1kLYeVM1aytJKgHBuNpyZqM3ckHfb7Mmg2+JS3tyrUDIfEQfyhO5gE1ldq66mS3jbKF62We9+5jZAhkfODo1/DBAvDeZwVTsnmxLUq0BX0eAaXegjeKkmWgyR7JSVOYpASaaHmzEVjv5L2RhvRS+TcQaxG/EdenFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9GpzT+uvR35rrUS7fgN8Da6nSTlkxmXYw73+ZWv6EQ=;
 b=Dd+Zud6u2SZ/aKKOTuu5hRO6toO60gjZNbjtqxJ6zwo7g8vcRDM2oD3Qm4KdXm1HcZ1RRPfxuHIMF5BJ5owg2xkrQiInJq7aKXjnTK+qDHy2wRfLlps0+/z1d05lWewpdZKo+O3vC6Zw9R/GcKXR6wnFb4y/uKUz7oGoog0U9LhP0fcc8tU99RAG3bh+rKRdRijKuTx7uNWYLOH94leJEmUVh7oPlI13f9UeIsfDVD01M7X1vSo8E6MErWnYgTGbW6zZQgZhEYhRMcuvk+BW6QtiiuuedcCJOXQpu9f6bygCwP95vH/TmB9RPUmCMNx4EYFcmts0D1rmVUn4xHyK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Fri, 11 Nov
 2022 04:15:37 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%7]) with mapi id 15.20.5791.026; Fri, 11 Nov 2022
 04:15:36 +0000
Message-ID: <9a47347a-c4b2-e589-c54f-b193d105c4ca@intel.com>
Date: Fri, 11 Nov 2022 12:16:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 11/11] iommufd: Allow iommufd to supply /dev/vfio/vfio
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
References: <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6fbca5-ad48-436c-8778-08dac39b624d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8Ae1+fZfQk/QUaRafHFRtXznoeTVKkpocFpFrPiGYTpalPrM0FEBBjwO8etqMoCIsn1YtScLxeWKkRCPafvuEjZAz7NOU+uid/GtyuYJQG/uiAup5PUabRXpDOVghls7WLFcmibUK63+L+EMh7MVGIx7+aVDtoVb6Ow2Cias7JNtXwGbrxg2QpGNapE9SLAnRMxfZz0Nru5ZI5O6mRZmdLXf2sKXeUvIotN/6Du3/p9PUSOXNFGWp4YiJ66zhGgWEz4beO2D2b1rfDpoNrxmVjLQJ03r8Qk/HgSRwiQsQeq3cU67FHnMdQNF8WHrf8zvft6g6Ni9FHKB+HNJzyNnObO6pVqL7k7OPKGQTFa7iWuDuKDqtlzNLAz1dTecdlRs6Qwns2ALaQZA7nm6bIOjm2G7UjGPOKtVq+wah6FHAuhNLLRe7/hvZIxKeLSKLPePSpNW0qSWI6FLxL9QZiChDXqAplLSSwtTZPQ40No/btvNd6wccJFeJB9dOt+t8phPCnAVN/Txwtp5AQVtcXKSl3ixf5RrhTDwEEciitEAMhOp/MwyWLMBt3TngT6XZP7zVcZCuk/SMCTeCTV+YE6pi9nt8bmVyGXvdgi17M4ltMRghmBc1rg5HSj9WMH71fD68ooc0SN91LzZLvbAvafmCdf2aNMz8dSxxVStinCdnVrkX6o/SkBi163FeNZ/5nX4fN7bCocUo46m1zLb0X6FpiXBWa1KhNHuWJaZlpPudZW7lgcNTBFuVOU060wgotNA8tWnRDJAHggCHqXU+YoYI7jwq06RLj0ixBTmCv4BapDG1v1O4vIbF780H85Umhq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(6506007)(31686004)(36756003)(83380400001)(66946007)(6636002)(316002)(5660300002)(66476007)(54906003)(110136005)(8676002)(8936002)(4326008)(31696002)(66556008)(86362001)(82960400001)(921005)(38100700002)(41300700001)(478600001)(7416002)(6512007)(26005)(2616005)(53546011)(6486002)(6666004)(7406005)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnpjUTNVN0N5cVV1SkZOcHNEdEd3R1lwdkVLSDFtY1hCZkhjdEFWekQxY085?=
 =?utf-8?B?MURSdXhEbWI4ditnbjh2aUx2YUlpS0tEai9Ed28vYkI3YnRCeDc2VXNGdXJO?=
 =?utf-8?B?R3hEbkZ1M3Ewdlpic1dJc0doSXkxNEozWWtLbDQ1cTlKeFJxaDJKWGJPd0w1?=
 =?utf-8?B?bG8zajAzd2xqb1p6dUM0QnF4T2ZOTFVkeGdxQzZXSUNHYWVnb1hXcktFN3Bz?=
 =?utf-8?B?NDRXRVg3cUVGQmlYOWZjcGgrNGNTNk52QUxrWFg0MERvbVl6b290OE5oSSs3?=
 =?utf-8?B?ZlZlck5TcFM1N054WXpRZTRDampTOFpxUS9OMGRyN1FBUXA3TXhsT1ljOTE3?=
 =?utf-8?B?cDhoUjVZbUZXR08xUnZqdm9OMmE5ZytEWCtWUEJ0bkpCMC9aUHp4RDA3WXF4?=
 =?utf-8?B?TjlIbUh3T2FUMkd0UUxDL05adnBKRmNDY3NkOFlZOTE1RFlxd2ZUNmVLeHV5?=
 =?utf-8?B?N0lSN0JkRUVsQ3lsL2dGVG10c0VrR011S1JJRFpOc0lDN2VXOWk4U2ZhN3VY?=
 =?utf-8?B?dEgyWW9vcENkUXR2SThYOHB4d20vNW5xN0RwdHNjbmhKcGkzNjQwcXN3MUJG?=
 =?utf-8?B?VnBQYThraHJ4RlZXemY1akpRUmlJTUE5WXkzQzgxb0Z2dENMQWx1ZUx1Y1hv?=
 =?utf-8?B?NEh5QURGRUFRTkJqdEM5bVlTRGtqVCt0cmJ2MXhCZUVTRUdGZWNySW1JMU5r?=
 =?utf-8?B?V3Ricm55ZGVZRlJwekxCMnZscVcxUzJ0UmFDM2tWZE93ellzR1JBOTRpREM5?=
 =?utf-8?B?VzlYNnF2V2JZRGN2Slc4NVNyZDVzbEVzcXNUajcrVUxvSVZjSDF2bGp3Wnor?=
 =?utf-8?B?VTBzR3RxV0lJWUJKRFpJY0FDTUpJbGc4MEp4QTdzN0hRaFRERFhkZXYwZFZa?=
 =?utf-8?B?RGtSbkt6Uld5SUlTS0ZnenhKNEoxRWl2R0FCaGNzMDYxeWxFK01JSUdlbDN2?=
 =?utf-8?B?aGM3ekNQYkxwUzBiOVJSTlVlcVR5TFd4VWU5azFZcDdobDhZMnpPN0JUR1Fz?=
 =?utf-8?B?c0dqamZmRXVJUmZHeS9BOHdhbkNqZ2JzNllobjROekdzbzdyWEVsMVB6cEM2?=
 =?utf-8?B?THhySHkvbzJRWCsxa3EwTitTVnBnUGMwd2VHMVN5YXRmTFlWeGp0NjJ6NTFG?=
 =?utf-8?B?UW9PSTB3TFRDUjJFeldGTE5PSFpBWGhMZ0lLYzZLdldoRUh2bzVTK0xOaENF?=
 =?utf-8?B?aXlkOFh5MG9MVnRnWHcvellsVzlWSHg0UXRxWmxJMTZOMk9JcC85OE1yaElQ?=
 =?utf-8?B?L1dWUnN3Vm9lU0NGY2Rtbk5xWGp4MzRST3lvOElRQkRYV0lKT1dXem9qOWVB?=
 =?utf-8?B?NjRpVVMzWTBwY1lybVJoaDRaNHJTS01hRXZ6VmhXN2hrS2VoNjM2akZZWm0v?=
 =?utf-8?B?VHFGMzJKOEEzY0Niektya0JicDVWMGwyQmJRRUFVOXpDMmZGM2tpWEd1ZGky?=
 =?utf-8?B?OHhYekxKZnVyRnJMSVBSS3RtcklZRWw3cVJ6aUI2WlArU0xZRjJNWGJaU2Vl?=
 =?utf-8?B?RGRtY2JlOXhQc0E3RFRTempDcXE5cXM4dTY2SkkyeEVrRzhZZ1QveGlWbFVN?=
 =?utf-8?B?VDV2VE5jWkp5aTNNK2ZzOGhaYkJLT3FUWW5TWU9NNjNJWXN2M3cyN2xDbkVD?=
 =?utf-8?B?eUREZEtjWmtkeVk2T0NxUTV0cE4vN3BLK2dBSVJNTGZQV1B4ajdSNWkzZjRD?=
 =?utf-8?B?SVNzbE9aUk5iZ0I3NVRyZE5OZW1RVklFLzNEM3ZTQUFlM2tuZ3RaU0d3WWhv?=
 =?utf-8?B?VWVPTnd0YnlZaTZySzUrOFVBWW1rVUFxcGhtZFFQc3c2NFVWd1FlSkdvUTM0?=
 =?utf-8?B?ek9KSFFYVXNpZ0pJQWVwMTVXcUhMWVptdFdNWTlkTFU5dmJHd0VEMk9NeDIz?=
 =?utf-8?B?TVYyZGIxaHdVL3JEY1J0WXpIeHZmQ3RnSzBER25wY3dxWFVLM0I2MFkyQ3BI?=
 =?utf-8?B?R1RXWERQNVpQeEE1dDZybUFBcG1ZZzFyU211cXZ5aXlyekV3bDIwOWo2eWt0?=
 =?utf-8?B?OTJvVkVVT2dLOUpncmk5cFZzbW04S3FWRWNWcjc0eDAxNlVwam9xMVN1dzdT?=
 =?utf-8?B?NnB3M3hiamxZZUNCZDhIUzZBSFozMmRjemU2anZhNFp1emUyanRoRmZmYUQ5?=
 =?utf-8?Q?8EX5Ouh6wQkpliaTleu8a1J88?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6fbca5-ad48-436c-8778-08dac39b624d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:15:36.7160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 559TuMQoo/0r/uznaXjKAq9TaEpAobCbsjIaNZIPi63lPt+n5RzdGLM6DLYEsVYJIh5ocGJbAkz2HjL9w1a/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
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



On 2022/11/8 08:52, Jason Gunthorpe wrote:
> If the VFIO container is compiled out, give a kconfig option for iommufd
> to provide the miscdev node with the same name and permissions as vfio
> uses.
> 
> The compatibility node supports the same ioctls as VFIO and automatically
> enables the VFIO compatible pinned page accounting mode.
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommufd/Kconfig | 12 ++++++++++++
>   drivers/iommu/iommufd/main.c  | 36 +++++++++++++++++++++++++++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/Kconfig b/drivers/iommu/iommufd/Kconfig
> index 399a2edeaef6de..f387f803dc6f7f 100644
> --- a/drivers/iommu/iommufd/Kconfig
> +++ b/drivers/iommu/iommufd/Kconfig
> @@ -12,6 +12,18 @@ config IOMMUFD
>   	  If you don't know what to do here, say N.
>   
>   if IOMMUFD
> +config IOMMUFD_VFIO_CONTAINER
> +	bool "IOMMUFD provides the VFIO container /dev/vfio/vfio"
> +	depends on VFIO && !VFIO_CONTAINER
> +	default VFIO && !VFIO_CONTAINER
> +	help
> +	  IOMMUFD will provide /dev/vfio/vfio instead of VFIO. This relies on
> +	  IOMMUFD providing compatibility emulation to give the same ioctls.
> +	  It provides an option to build a kernel with legacy VFIO components
> +	  removed.
> +
> +	  Unless testing IOMMUFD say N here.
> +
>   config IOMMUFD_TEST
>   	bool "IOMMU Userspace API Test support"
>   	depends on RUNTIME_TESTING_MENU
> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
> index ab3fa05f38505d..1eeb326f74f005 100644
> --- a/drivers/iommu/iommufd/main.c
> +++ b/drivers/iommu/iommufd/main.c
> @@ -18,6 +18,7 @@
>   #include <uapi/linux/iommufd.h>
>   #include <linux/iommufd.h>
>   
> +#include "io_pagetable.h"
>   #include "iommufd_private.h"
>   #include "iommufd_test.h"
>   
> @@ -25,6 +26,7 @@ struct iommufd_object_ops {
>   	void (*destroy)(struct iommufd_object *obj);
>   };
>   static const struct iommufd_object_ops iommufd_object_ops[];
> +static struct miscdevice vfio_misc_dev;
>   
>   struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>   					     size_t size,
> @@ -170,6 +172,16 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
>   	if (!ictx)
>   		return -ENOMEM;
>   
> +	/*
> +	 * For compatibility with VFIO when /dev/vfio/vfio is opened we default
> +	 * to the same rlimit accounting as vfio uses.
> +	 */
> +	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER) &&
> +	    filp->private_data == &vfio_misc_dev) {
> +		ictx->account_mode = IOPT_PAGES_ACCOUNT_MM;
> +		pr_info_once("IOMMUFD is providing /dev/vfio/vfio, not VFIO.\n");
> +	}
> +
>   	xa_init_flags(&ictx->objects, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
>   	ictx->file = filp;
>   	filp->private_data = ictx;
> @@ -395,6 +407,15 @@ static struct miscdevice iommu_misc_dev = {
>   	.mode = 0660,
>   };
>   
> +
> +static struct miscdevice vfio_misc_dev = {
> +	.minor = VFIO_MINOR,
> +	.name = "vfio",
> +	.fops = &iommufd_fops,
> +	.nodename = "vfio/vfio",
> +	.mode = 0666,
> +};
> +
>   static int __init iommufd_init(void)
>   {
>   	int ret;
> @@ -402,18 +423,33 @@ static int __init iommufd_init(void)
>   	ret = misc_register(&iommu_misc_dev);
>   	if (ret)
>   		return ret;
> +
> +	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)) {
> +		ret = misc_register(&vfio_misc_dev);
> +		if (ret)
> +			goto err_misc;
> +	}
>   	iommufd_test_init();
>   	return 0;
> +err_misc:
> +	misc_deregister(&iommu_misc_dev);
> +	return ret;
>   }
>   
>   static void __exit iommufd_exit(void)
>   {
>   	iommufd_test_exit();
> +	if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER))
> +		misc_deregister(&vfio_misc_dev);
>   	misc_deregister(&iommu_misc_dev);
>   }
>   
>   module_init(iommufd_init);
>   module_exit(iommufd_exit);
>   
> +#if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)
> +MODULE_ALIAS_MISCDEV(VFIO_MINOR);
> +MODULE_ALIAS("devname:vfio/vfio");

will this line also result in systemd to create this devnodes at boot
based on the module info even if the IOMMUFD_VFIO_CONTAINER is not
configured?

> +#endif
>   MODULE_DESCRIPTION("I/O Address Space Management for passthrough devices");
>   MODULE_LICENSE("GPL");

-- 
Regards,
Yi Liu
