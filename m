Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C684F614CAD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CF710E3D7;
	Tue,  1 Nov 2022 14:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF810E3D4;
 Tue,  1 Nov 2022 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667313344; x=1698849344;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PnE+Krs+ihnmIhm7h32oZqMGJzpxpakNQgRpxCtVzTY=;
 b=WVywxiRL/0XgADEPp68oGtBApmUJ0edCxh9gVnkws9LmqEPr9a/ggVnN
 ToiXfYviD5Ny/FPFa2qwR3+hOtCNNAGTVSSj64iLb21phJeGWGcHJmrxM
 twy77VfbKywV+FkTOle5tSFUvHS9HIT7Zm+y1bu/qdQZteF0Uaj0fYvDP
 kzXSFgfOvujHNC/IgH56M+PDO/RigsUALpm7J8Wy6vPkQwZ/sBVNumM5O
 oRQShDMwW5kxEUosDvbxuO7P3SWmvda8XwRCj0haRy5zbxGPrA8L94SQI
 nvMJ4DK4gk6ZgrgUu6Dg1xGZR02GZCivp8DuUbMMNS3ukSHqaQu2n7bZo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="395456524"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="395456524"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 07:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="702888798"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="702888798"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2022 07:35:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 07:35:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 07:35:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 07:35:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 07:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8OB8hR47yY7JGAe4IFUm5LcjBnnLiowDy5ztqw88ixJlF/T7HPfnQ7dZbu9uGBwo4updpztVsPiE4ES8cMMd59ofvaI89p2vLvSAoaWMm7YQJIwRKIs0/BIda51N0OgWSGiUquPuAfF6F/VrYNLb8ZfqSTS+Yd5H/tTAyHvavMlpz3EKOv3SpcW8Whyy+xA7WwGVwZVZ6f2X0RfdoFyMBuEBK8Hj5azKlATi5gVg7YLCPLHt/halabwR21oQ+YlTSlDM2MNNYYuLmZdpOeqpPd0OXXRrps8lV/LgouC6myaTqxGhX45VaE8UzNZLUbxKsPdh43Rgf5OkL1WeQ6MeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK9HhWZ5xNZFKLk9jcN4r9U64yfgCqTVqCaKJgj0YVs=;
 b=CTdhTVUMRfhXOnC8Bu7jpzb+zqTmLIrwvxmYWy0/vsDP5UO7s+N6kc9Rer+sE38wfH+ZA/XdnKoaZRyv/o64zSjugW+4lumZGBOxu39xm4zp5vKUlKskdUS1iP98X169uwytberAsCDkcHibjJc8qgJngu9dE5VQZE5uU0AqtW6qZQAUUxLn2TwJEmcH6sF3dsf8uZcOdJj304TaUvlyafkm0bHtwz1/u0nQweqhXsQ8CPJZRkiVkl5bmyTbKfmQgxTeJLx0zgMY/DSrWzfpjeF2klEN7V5WUytqzPyRzMupBvL/EeyrIcaQ7HRdzW0byb0WhB8f4K11ec3H5jy8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 14:35:36 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 14:35:36 +0000
Message-ID: <ddd7b4b7-50bc-2ee3-9ba6-73628f5bb6dc@intel.com>
Date: Tue, 1 Nov 2022 22:36:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 01/10] vfio: Move vfio_device driver open/close code to a
 function
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
 <robin.murphy@arm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Zhi Wang" <zhi.a.wang@intel.com>
References: <1-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <1-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebe9ef6-e7ee-439f-1bc7-08dabc1656fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfTk89ezNfdk2HB7mXmr3AvQ+KtKCBxUg0vjn41kibV1WRRDAHVZNicUtptpXBj1Zr2HMhXIeHjxU+qPgnKdIGFcHBIoDcZRmBOH6z6onwS9iCJ+HdBh/DnPi4fjqTyzXnqCKa2kEHgWipfDVkvJT1h4SGqs7kZTXSPLiOWbU8lOo+3aKIFJUROVKZJ/Klkk/9VbavOvo3E09j5brFPJQTFOXEhBbOwQVY0ZXdVqYi8qRlYLh6/lVpaYwazHXwyuyhgpSfH5I1bjpvry3JL+9AWccwiQOZmi2GXf2W2wHM99QvlaY9ZN3sD6KvwYtBr49EPd6IDg+4j6wRYTfKpQZjmXB/uEYBADQ0gk+lLpwNxXGXimIuVVJ4gomXKxU/j9UpPCZ1QADf0hH89kZs3sWpdP87yExgt9G/A41NQ6ImFfPggFL/C5FrsksHb0pS3Fh3BQjOoJu0vGfiy/QKre/dExJgCU6I+LqrpIRN3Nv3mbjALNMMni5e8VXFVokmRk4BYpi4m9oPLM52BR/B+4WWWlKZ6mPCVFVbx44tUwzNWO3CZOJ+LzrCUFojMxhEIotf6x8DvTRinXauPIUGcKJH01oKL7qfV994O+IMVbMVLSwiPbcB9csKUWUmJVDlwLA0WlKlZPQLVbshshyQNwi/xOaQmopXfQEA21h5aq9yPmapRId5LFzpguzoLLQMVDNKzNLgHSqT+1g171A5HbJ5PWoWb7J+45zPwelVxVjmiALL5Fmb8Zf7joPYIxyUMe3x+gJINSSdV0RDWsuttJHeTYu6UsZuSYexYDZIpMOH375MG45xxnBIOgN80pY4Pb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(31696002)(36756003)(86362001)(31686004)(82960400001)(921005)(38100700002)(2906002)(83380400001)(6666004)(6512007)(2616005)(26005)(6506007)(478600001)(186003)(53546011)(4326008)(66556008)(316002)(7416002)(6486002)(54906003)(66946007)(7406005)(66476007)(6636002)(8676002)(41300700001)(8936002)(5660300002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlFFczFwbFJVNjB0dDhLSGRjYUV1SDdzd2hYS1J3c2hWU0JiWGVXY2x5VC8y?=
 =?utf-8?B?SmVaRXhLTXVTd1JrNjVmdDRFeUFqMGFvN3h3OURaQmVaTi9WZ3hORW03SXU1?=
 =?utf-8?B?SytUT0FOSkhjMHZFekJFMjNGWXIrWXkrOUwybTlBOGUxQnEzSytzZ3BMcVp4?=
 =?utf-8?B?a3ZnYm5vdGhoNCttZ2h4U3BUNFdNWW5aY092YUFIRzZLV0VpWVQ1dklGVGhq?=
 =?utf-8?B?eXhLM2NRcWZqZTJDMitTNktLa0ZjV0tLQ243cHBjQTVGbklaQ1ZESzhtTkxa?=
 =?utf-8?B?M09pQ0tMQ1lYZzFHNm40YzhISmpISmlqcDcxbmMvNkJPRE1EWTJzRThGREll?=
 =?utf-8?B?VzBmcGNkMG90YjFjZHU2MEpYYm1Sdi82VGVCbngyeXZNRXdVMmtWMGRudEpH?=
 =?utf-8?B?bWhuaUVReDlEQ2lOMERnOU5WK00zMW9oUURvSkFXQXk4TnFYYlNPSUNOMncz?=
 =?utf-8?B?WDRZVXhBYmxxN3RBbFhXMk1CUlV2MlBzTis3WmM4TU8xSDA5RGp4QnRCendx?=
 =?utf-8?B?Yi9FaS92TkJTanduMnlqY2JnM0xXMjFkUFVKYWwwRm5OWjhhSjl1NnZUSUNL?=
 =?utf-8?B?YWJ2aUhEaE5pVU9jTzZHaWIwYlNrcTZnY1BYYWJtc3l6M0FLQ2ZuSmc1MVZa?=
 =?utf-8?B?emJ2MVJYZjA1Zlg5ckhrSXZYSzREOXhKZUYveHYzZjBhd2NKUkkrWnhJeVha?=
 =?utf-8?B?ZkFiYmtoMHJmU2dlQ2t2Ykw3UWhXaHJvbkIwamNsWURVazY2K3IwS0lIOXRa?=
 =?utf-8?B?aE5LZXlHL1pGQmpXT0FGQlNDaUoyZnhqUHJaNTFRTHh5aGkxNFkyUzd3eVlI?=
 =?utf-8?B?R1dtay9aWk5qaGxTUHJ3aTF3aUpVMUorVGdKcnB5WXhuK05rUFk1UmMvb2pF?=
 =?utf-8?B?OVJ2UldNZWc2VS9vekYwZE8vYnZ3TXUrVUNiZHFncXNkckJvRS9MbDFvUjVQ?=
 =?utf-8?B?ZW0wOFlTd1h5K0lZV0xWS3BnT3B2aUdyN1FKQllmRG1nTkE5eU9sa2gyZHhG?=
 =?utf-8?B?RFRZM0M0WDB3R1BZL2svRnhUV1FLYU9wNGNVNzJBRStlcldYa28xOHFNVTho?=
 =?utf-8?B?bDVXeS9zdEN1djB0RkZ1dDJaK0JPbndhN3A4M0xtYUxyQzRPUFFNbXJWTCtB?=
 =?utf-8?B?b29PNzVma1FTSzlKYktzcEJITUV0K2VDOWRFbG54Y3BaR3huSEY1Ym1BVXY4?=
 =?utf-8?B?aTI4ZDRQRERTMlFvODRVakpSbnFCUGZwQXlBSDlFYjluUWoyOTdnclI2SE1u?=
 =?utf-8?B?TnlpR2IyeTVhOXdoYkt6c0lhT283TG1WaVV2Zk9Ud3FCdjdVcXFMVG9qSmph?=
 =?utf-8?B?LzNkUHo5MTB2eHMrRDJ0VzlsdXBpdGJ2MTVKdWZxMGNHZVJqWFhEc2x6K3JQ?=
 =?utf-8?B?MTNoTUVqenBiU0EwQWVFUHN5QlZIMk90MWkxdjdhR0l6NnhBQjNzSGx5Zk9l?=
 =?utf-8?B?NWxaYUVRY2dtdUMxNzlRTFlVeUFyOUV2RDdlcTRIMGVPemZNMTcxY3pEb09P?=
 =?utf-8?B?VEVpOFR2STBUKzA1aDFRaWZhRndVQ3FLWHNXb1o3RUJQeUxyOTRhd2FSWW4z?=
 =?utf-8?B?amJxZ1ozKyszb21yZVloTWpvdGEzNXZ2Z01UamMwUkg2QmdYRnhzK0VGNjFr?=
 =?utf-8?B?SW81eDdSWVoyRUJCaU5QenRnd21ITUJjV3ZqczVHL0hyVVpnOHpyNkJmRlhk?=
 =?utf-8?B?KzNBZ2UvZktCUWg5ZXArc0FOQlFuZ2plamNLOG04cEZZZWZJdmRWODVrV1cy?=
 =?utf-8?B?dnhCNStNVERKNTY5SnNIa29GK3pQQy82dnFhdWM3c21mY0ducFF6S3N5dHNY?=
 =?utf-8?B?bDhUUEpGSHJRTGZZNWJFMlozMGxJejlWUFpRU1dsK21xMWgzTXJmNHUwNm9D?=
 =?utf-8?B?dTN2Sm9XNk82NEttaGFQbmFsQVJVMkZOR0FMT1pITmlTWGdzNUJ5cTh0QzEz?=
 =?utf-8?B?QXk3akJzVUFLMVFKTXVvV1ZjbldmVVZXVkhNd2dOSDFpdGpWMkNOa1dabldV?=
 =?utf-8?B?c3RrazkxR1YzS2ZTU1JlVStQMEdMNWxGdlY2MUE3MExsMjlUdkxhRUN2YkRD?=
 =?utf-8?B?cmZjUlZSZlpqZXUrUkN5RFFBV0FHaGs2b0lJdm1yOERxNzZHS3pzc3VhT0Vq?=
 =?utf-8?Q?uLXrvtDI3KMPSuOt44i+FcbKv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebe9ef6-e7ee-439f-1bc7-08dabc1656fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 14:35:36.5333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv/nW3HkFRzD0xv8pdIrkYHuU447Ek2+zJF3Av/Go3F/pUyXPIaHlKp85KV6lNjTFkq8lBzIEb1uuM4jL3Zluw==
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
> This error unwind is getting complicated. Move all the code into two
> pair'd function. The functions should be called when the open_count == 1
> after incrementing/before decrementing.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/vfio_main.c | 95 ++++++++++++++++++++++------------------
>   1 file changed, 53 insertions(+), 42 deletions(-)

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 2d168793d4e1ce..d043383fc3ba2b 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -734,6 +734,51 @@ bool vfio_assert_device_open(struct vfio_device *device)
>   	return !WARN_ON_ONCE(!READ_ONCE(device->open_count));
>   }
>   
> +static int vfio_device_first_open(struct vfio_device *device)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&device->dev_set->lock);
> +
> +	if (!try_module_get(device->dev->driver->owner))
> +		return -ENODEV;
> +
> +	/*
> +	 * Here we pass the KVM pointer with the group under the read lock.  If
> +	 * the device driver will use it, it must obtain a reference and release
> +	 * it during close_device.
> +	 */
> +	mutex_lock(&device->group->group_lock);
> +	device->kvm = device->group->kvm;
> +	if (device->ops->open_device) {
> +		ret = device->ops->open_device(device);
> +		if (ret)
> +			goto err_module_put;
> +	}
> +	vfio_device_container_register(device);
> +	mutex_unlock(&device->group->group_lock);
> +	return 0;
> +
> +err_module_put:
> +	device->kvm = NULL;
> +	mutex_unlock(&device->group->group_lock);
> +	module_put(device->dev->driver->owner);
> +	return ret;
> +}
> +
> +static void vfio_device_last_close(struct vfio_device *device)
> +{
> +	lockdep_assert_held(&device->dev_set->lock);
> +
> +	mutex_lock(&device->group->group_lock);
> +	vfio_device_container_unregister(device);
> +	if (device->ops->close_device)
> +		device->ops->close_device(device);
> +	device->kvm = NULL;
> +	mutex_unlock(&device->group->group_lock);
> +	module_put(device->dev->driver->owner);
> +}
> +
>   static struct file *vfio_device_open(struct vfio_device *device)
>   {
>   	struct file *filep;
> @@ -745,29 +790,12 @@ static struct file *vfio_device_open(struct vfio_device *device)
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	if (!try_module_get(device->dev->driver->owner)) {
> -		ret = -ENODEV;
> -		goto err_unassign_container;
> -	}
> -
>   	mutex_lock(&device->dev_set->lock);
>   	device->open_count++;
>   	if (device->open_count == 1) {
> -		/*
> -		 * Here we pass the KVM pointer with the group under the read
> -		 * lock.  If the device driver will use it, it must obtain a
> -		 * reference and release it during close_device.
> -		 */
> -		mutex_lock(&device->group->group_lock);
> -		device->kvm = device->group->kvm;
> -
> -		if (device->ops->open_device) {
> -			ret = device->ops->open_device(device);
> -			if (ret)
> -				goto err_undo_count;
> -		}
> -		vfio_device_container_register(device);
> -		mutex_unlock(&device->group->group_lock);
> +		ret = vfio_device_first_open(device);
> +		if (ret)
> +			goto err_unassign_container;
>   	}
>   	mutex_unlock(&device->dev_set->lock);
>   
> @@ -800,20 +828,11 @@ static struct file *vfio_device_open(struct vfio_device *device)
>   
>   err_close_device:
>   	mutex_lock(&device->dev_set->lock);
> -	mutex_lock(&device->group->group_lock);
> -	if (device->open_count == 1 && device->ops->close_device) {
> -		device->ops->close_device(device);
> -
> -		vfio_device_container_unregister(device);
> -	}
> -err_undo_count:
> -	mutex_unlock(&device->group->group_lock);
> +	if (device->open_count == 1)
> +		vfio_device_last_close(device);
> +err_unassign_container:
>   	device->open_count--;
> -	if (device->open_count == 0 && device->kvm)
> -		device->kvm = NULL;
>   	mutex_unlock(&device->dev_set->lock);
> -	module_put(device->dev->driver->owner);
> -err_unassign_container:
>   	vfio_device_unassign_container(device);
>   	return ERR_PTR(ret);
>   }
> @@ -1016,19 +1035,11 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
>   
>   	mutex_lock(&device->dev_set->lock);
>   	vfio_assert_device_open(device);
> -	mutex_lock(&device->group->group_lock);
> -	if (device->open_count == 1 && device->ops->close_device)
> -		device->ops->close_device(device);
> -
> -	vfio_device_container_unregister(device);
> -	mutex_unlock(&device->group->group_lock);
> +	if (device->open_count == 1)
> +		vfio_device_last_close(device);
>   	device->open_count--;
> -	if (device->open_count == 0)
> -		device->kvm = NULL;
>   	mutex_unlock(&device->dev_set->lock);
>   
> -	module_put(device->dev->driver->owner);
> -
>   	vfio_device_unassign_container(device);
>   
>   	vfio_device_put_registration(device);

-- 
Regards,
Yi Liu
