Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BC625242
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 05:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816E710E751;
	Fri, 11 Nov 2022 04:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634BC10E747;
 Fri, 11 Nov 2022 04:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140007; x=1699676007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A5zNGDWsnnBgQfdfU1v0kyzNGredYDObwEku5d9M5yU=;
 b=jigkkIp5M/DOlR9ZcZerY9jBiIk7/Pz5QsaP+cIuAmdsuvujwJQOFjvw
 dTe/pyxuwXTKlbeA7yvwJOAhaYnp+6cOGYL7miCAQaBVYUpx2xl4g+hRW
 PA1SJXb8rf6/V1pYVLhgx+h4CIkHYiITWuDwVHfOO5PmnPmr60F7JQCNn
 TbqPTYMwi5dLqMRwbdMQgj4opGybkP6w04JSJ7gIxsy4evemH3MtRH30L
 Eif0V3EsSRSe9YNlyuRT5Mdtsr6mCROL9/vy3b/YZh8ahOdE2/ugEZa9c
 StNYybkN9WAXD9gEL7Q3EnXHJW0KNOaE4k8h5tSG0gnAFhrmy38zUVKj1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="309144145"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="309144145"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="701076696"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="701076696"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2022 20:13:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 20:13:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 20:13:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 20:13:24 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 20:13:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOjyZLgZ5ilmztiqfZ6wYxBSNZR1uboGvvUelc/NWjjgP0MwISCARCpvR79fyGNaPQo0ak0zFfrj1QopvxAaAsctEjQUi7bjyB7Tw89WRnwnPOWYsXiyAKLUEKuHyn/onqNcbEUa648u4ArNf4ybV8BMYTjiUy+lgnwZOmLIzFxyNx/kGFDOoVmuxc9EPVK232L2N/4NyAMJ/2+OgeAyK2bDFKWsVrafsUD3fKR/Y6LV+fsRCHF8XwZpiKeG4PCbBUC0fNgnwK5JC7yjN6Aoy0qliXOtGuAVS83C10+5GeaFIPoI2fM66HEsrQykVtSGvvwnrYXdcsbPOr0M/s6fYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmM5juCY8JdMG8DeXrT1e5AckYB3UR98RM67cbFczOA=;
 b=mmaGZ9en2BcK+m5VPPWngoXAz9EKp81IBN6cKvhV1O4WVFaOyyfQwJ9DgZTQAH0RAwNkzpMxNdv3+03upXgb13iT9hqIGeuFDZP8FcvGhrz6X7hISPJ2FQaK61ACCQzMxMn0fi5qAE46+lt1F6fJ8SVRFMEnKJ4NlWzhtn0CmxUTzDiHe7R03Jb1ejq2J4oG/gsg7GxCdkaNdtjN03hHDQZ4jCBjFIKZuOHCwXBX5OO3QU/nB/CQ26ICjxy5ugmzEYY+dzvG7YL4QvZQKV8r0rRUx48d0Sx8p8SLQXPOVJvtX5wUX+q/gBwA5qps+lvYD55Q1avNWi0cCiMEdtSQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Fri, 11 Nov
 2022 04:13:22 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%7]) with mapi id 15.20.5791.026; Fri, 11 Nov 2022
 04:13:22 +0000
Message-ID: <81f6239a-13b0-a6a0-1ff0-936624020e87@intel.com>
Date: Fri, 11 Nov 2022 12:13:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/11] vfio: Move container related MODULE_ALIAS
 statements into container.c
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
References: <9-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <9-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e107619-d05e-48da-f447-08dac39b11e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvkHADmEp/OBNYVompXJckyniHLD/MN7FqVX50DEJ9qKLx+CC5A0fLfONS6M7dBDFQlG2tIt6Dss5xpaEFbASg57yxZlTHkaGxb21M7vpcKQlj1iLbDZ6HVJo44zDFRu8X1mIsgcUaFvpVdXrPKCqT+uA1JU5t+eYJZ230hDhDZZltEjc2R99Qgg206RFnpLdavBlDI11OMWE7L+pTSqDcf8VwrKs1Xqo/D7UAZsFzkeKEqGwwSqF3CQs2748CpsXgEBCOtWjefQHORrQlETpMxYZ7s7bZ77RotpF7W05VkKNz2h7FHvZE8HpsAH8IR6rpxOVSyBex+x1omSKuTEr0g2UHQ2phKfDUHv2oJOHljIiK+oOJtdRqGZNaqfsvp1K6aVUdldbDlSaMKeZsBnivQq6m/dfm5mWSEpn4eDc9Pix1Mo3VS+4IkVQ48+SSs2792NPReQCtRIHz7wf6JHBv1EA0ener4dt4IBoDeUqogn9Kr/Wawjji4/JvvTYSpCAXyRtjqJBbYdGDuJkMHIdfWCtRI/KBc7qwwfRq5ZgzG8Cdt2y2nuuhyO4SrtKj42A5B9/K6FZH1jR8stT1twRXeedHeuBfcMTFyPzfWIxAuDIe4pO1i2D420/d0qTAUgB0G+iYA8OqHYpMpt/TpcmP/eS4xwmXAewXpRAD624r3awAFEnINMLxpJALm+hSwu5mL/ur4NswbOazrEYE8VvxIVatqP3PYYQhC+8PIdlOpDZ9glTM2AYs8C2lX8ZDm/tmUhgwooUH6g0IG/O8mhRRXdhYwpL7t34yj+zzhSlcOiVCnBW3rXxa/Rg2JxVfwx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(6506007)(31686004)(36756003)(83380400001)(66946007)(6636002)(316002)(5660300002)(66476007)(54906003)(110136005)(8676002)(8936002)(4326008)(31696002)(66556008)(86362001)(82960400001)(921005)(38100700002)(41300700001)(478600001)(7416002)(6512007)(26005)(2616005)(53546011)(6486002)(6666004)(7406005)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnMybCtqUzh2UWI5cFJ5dUFSOTYxT3AzVVpjalZUREJYWFB2aWd2R0dqQmtn?=
 =?utf-8?B?SzM1YTN6WDdFUHo1T1AyV3M2ZzkzdXkwRmVOS1oyUm1MbFZtT3RqVWdnYlM3?=
 =?utf-8?B?VFhhekp6VFQrU1Fla1BHaVBudWk4OS9aVVZpTC9jYU10TlZWNDgyTE41dDdJ?=
 =?utf-8?B?ZDdLL3dXTUxyR1ptSVF6Q1BDZ1kyWjFkeDloZlhMNDhkWngrV1RKSGFxNnYx?=
 =?utf-8?B?VjV0SEZxKzVPQXRxNVdCMWh2aFJ6R09mYnhYWENzcUEweUZEWFlJOUY5Nlho?=
 =?utf-8?B?bXU0ZElUMUViUE0xYmp2dndnNHVZTGd1SlMwSURIWUZqQXg5R0E1aTVmQi9z?=
 =?utf-8?B?NzA0YldzUXA1bHcwNkxIMHNxWGpSajkwZEVEQncrQk5pWlMySGRxaVFJb0xk?=
 =?utf-8?B?R3JKQmJkOUVHc0V0WkhBeFF2ZE5wL0hXWGI4UlMxOW4xM1NoVVk0OHhLbU9i?=
 =?utf-8?B?OUpsTm5hRDhWQkVNdkNpV05yUmFQQklXZFE1MHRyVk5MNitEWXZzZEk4T1VM?=
 =?utf-8?B?bXpVbStkTVZEMHJmWE8yclEwSEFRbitCZjNsWHVvWTlybUxWVXdhcVZvdmF2?=
 =?utf-8?B?TkMyU3lxWExCZnJBR0F2Y3U2SFJhNE5LZTdpbG05eSsyQy9oNWtFNERKZ0k2?=
 =?utf-8?B?K2lDMFk3Q2w3NWNrWG1ueVdMTFQwNVE2N05NUkxpU3pnM0dEQjVPSVgybUVJ?=
 =?utf-8?B?eks3d2IwZktUVmN1d0ducUQ1QVZ5b3R3dE9aSTFyOFRjbzN4T3ZIRGVJeGxK?=
 =?utf-8?B?ck1BRHhaNTdQWTljQVNNbVRTS1Mzc1BDWENMb1p3RmVZTElQcUttRzVYV3J1?=
 =?utf-8?B?TmVMY2MxQnZabXpvY3VpWWpnL2VhTkFhZzNETFlpTkpKbUUzOVFZMkkxMDZQ?=
 =?utf-8?B?ZGlLVkhFVUJES2tWS3A3QXJiMXhFMUs5VTJwNnBoUW5ORkxPempHeTdGQmV6?=
 =?utf-8?B?bXRBN29peGZBZ21UMFZIYjZMWG0vNVlQaFBYL1lUYnNEcW1tTGE1dWwrc1pH?=
 =?utf-8?B?c2lHcDBGQTAzUkh0ZUpZL29PV3pPZkIxbjcrOEQzV0RRMEQ0bFdwUjhFRXc1?=
 =?utf-8?B?Vnk4amFnWjVTV0srV0JoZ29hNnFkRWlINElIWXpua2gwT3RJUWt1RjAxSlFw?=
 =?utf-8?B?cHpkalhES2s4OVNvZWpSNm1sNGNwVi9VTE9kT2pJWTBvNVJoUmxHQzFpU2RB?=
 =?utf-8?B?WWpseWpMa21Qa2pQUjJNNmRPL1c0WXRrVmJSdjlXVnNZbzNvWjAxSEdqVFVN?=
 =?utf-8?B?UG10aFNsZXpSeW13SHhRQjdCU2dieWcwK2g3YmVyeE1obFU1dzhKZGJmR1RC?=
 =?utf-8?B?dTc5aEN6UlV3LzN6bXhsSHIrc0dPUEZlM3pwMmE2TjlnZGh1K2E1WDVBZzh4?=
 =?utf-8?B?ODBrdEhBRGJWQStycmN1Mlk0eGVaL0lCTEhQZGZLNEdpYlpxZzZWemJkS0I0?=
 =?utf-8?B?MWVkK2JXQmN4Mjk3T3hZTEFvSUpMNDF3VWpSdVhjNTd6bmU4M0x4czJNaVZy?=
 =?utf-8?B?VkFocDlYdGF2c3JLQm1oZFhrUHBKc1crdzh1aHNmZUNYb21IU0FYVi9NNkox?=
 =?utf-8?B?RlI1amhSTzVZcWZzMm9xVVVYaTU5ZmMrK0xDYzFPUEg0ak9GUHNsV3JzUTd0?=
 =?utf-8?B?U1VtRk0wU2xhdXI1ZHQzY0xTOEJaY0xFVXpKaXFDOGYrdC9SaHZPbEM2Tmlk?=
 =?utf-8?B?czVXcnhYTkl4aXJoNVFCRVVCOFQ4V1JKbzQwaHlTd3dkOXZVaE5rQzZENnV1?=
 =?utf-8?B?Z3dmc2YyemdYZXRqeGNuMHE1R3ZwTC9WT05FekFHQTB1VjRGWG5LOGtrMW1B?=
 =?utf-8?B?NUxZY29tb2hJenZ4SENmNG9QdERyYWRJNXpjcHFWQ1pUd1E0T1VkdExGSkFN?=
 =?utf-8?B?TzBSc0k4RlM3aWlDam5sWUdLdjkyK0p5UXRhQUlBR0F4ZEdBdTA3NU5jazB2?=
 =?utf-8?B?OEN2RE5qaFlmUitmSDNtenMxV0NRTzUwSUUrWElSOWpLMnlMUFM4cjYvcXVs?=
 =?utf-8?B?L0tSTFNxZTBGL1RVclkraVRTZUdOa3RFVWdzKzhYSS9vdmR3b0ZBUTRxVmFD?=
 =?utf-8?B?RUsvTUpYY1d1ZmJ6YU82RkZEZ29DdEFxVlF5ckgxYUFmWEFBZDM3VUZlMGdn?=
 =?utf-8?Q?KGY1k4lgcXqbDbHxKCy0sW/dy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e107619-d05e-48da-f447-08dac39b11e9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:13:21.8469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvC+AqCfpviM2yg0NN/lZ+gWfBE5qLnynqpxXSzAi/JO9g7L5QaEtKJ92ttN5MK/67GRHeThCVrGw4fGQtw2Eg==
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
> The miscdev is in container.c, so should these related MODULE_ALIAS
> statements. This is necessary for the next patch to be able to fully
> disable /dev/vfio/vfio.
> 
> Fixes: cdc71fe4ecbf ("vfio: Move container code into drivers/vfio/container.c")
> Reported-by: "Liu, Yi L" <yi.l.liu@intel.com>

s/Liu Yi L/Yi Liu :)

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/container.c | 3 +++
>   drivers/vfio/vfio_main.c | 2 --
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index 7f3961fd4b5aac..6b362d97d68220 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -608,3 +608,6 @@ void vfio_container_cleanup(void)
>   	misc_deregister(&vfio_dev);
>   	mutex_destroy(&vfio.iommu_drivers_lock);
>   }
> +
> +MODULE_ALIAS_MISCDEV(VFIO_MINOR);
> +MODULE_ALIAS("devname:vfio/vfio");
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index cf49c5200a4c05..ee09ccf4a608e1 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -2064,6 +2064,4 @@ MODULE_VERSION(DRIVER_VERSION);
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR(DRIVER_AUTHOR);
>   MODULE_DESCRIPTION(DRIVER_DESC);
> -MODULE_ALIAS_MISCDEV(VFIO_MINOR);
> -MODULE_ALIAS("devname:vfio/vfio");
>   MODULE_SOFTDEP("post: vfio_iommu_type1 vfio_iommu_spapr_tce");

-- 
Regards,
Yi Liu
