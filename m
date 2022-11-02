Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBB8615CF5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 08:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5B810E443;
	Wed,  2 Nov 2022 07:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2D510E0E9;
 Wed,  2 Nov 2022 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667374090; x=1698910090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+HVCk4WQMC3PK8Xa0uiOI25nycQ5Wi522b2c5Pb+w1Y=;
 b=iz0TUooyVFKm6XdbjHLVjZgI2TW77/sjPqCv8biayOf4FtvSZXBka77G
 I3GZKWVpSoFpqcTPC/iKxmkY+3aNgkvZF0YDyoadPzqB3k9daryTCJ3jR
 ZVcrqY68dhpl3MGYBUPpNSm2uql2Qt3WdcqqvPrAghsxusZuI8UwIvetJ
 YbMbo2eXMFYZR+i8wcuzP7WLuuGpw2Mn9kL+an+GTbBAmZPzGc3yjD7WU
 68TD4grMqLjCDs6NfF9pBOlgNK4aA38JbshH6VT66I+FBTb3wacNX7z7M
 4YQCwwmkw7Yi6F/nw/xXYffO1hf9M5AfZZubaqTdWHnCoCjnb3Evmn9lV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="306952982"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="306952982"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 00:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="636684005"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="636684005"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 02 Nov 2022 00:28:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 00:28:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 00:28:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 00:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU50II7Itbc5SklvF4+tl65hjrjHIDoXyMQmKrLk7Y/Ho9ya03oCpy/c5+4pHomVyCwyhsIVXkYV25gpdho/9ClnAEoMMyrLRXoQgcmKFlk+BsMraGoB0Nw1Ndrj8C2+TIkMoIUFalO1QeEjEGbtW/PK7KUyFJtYSdqfeeoP9hJrrrhacbuG28EIXa4tV4I1MAIJUAQLrjf+aPl3k1u8wJdhxwGFJS0NXg82+fV03KHb0MHMS20c8rjTDG0xbiq1WsLvL+7B2qMh4K3Lo6/WFb/flCgtF6IzUbUvPGopmiCSKHw9NWbF53Y8Q4g1DCLk4/0aB5gMT6O75jagJoG3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAO3UiDf7T4/nZL2yrRBuuwu3ExDRxJcTQG+cWUvZq8=;
 b=W1l0U4q73xsW4+D3hSE3igaZy0rty+CI9W1TSyWkqcZqwUeq9z/7AnM+8ikMkXrVDS7Zjic+bu5XgEeLCpNPNopePue746bZr8k9y9kqGITfdnqx+wprooJh7G0UFGzUt12yrr2rt50mmJn4lQLpB0f0uYtfoq209kXP43clDIdjO+xNM8j2vkHf66ZNgXw5tEZFepo3AtqQHgY8Jy86n3gqEww0xZth5aWzUcb6smD9mw5o6RfVcw7FkB7gDvNmwHaJNzWEsJBHK9xjY36XW+cCa24wecrmNyyEc57X8nW/h6U4zezbOa6NMhiGZzU72Ti8z9kfLmRp3xmgrQeCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DM4PR11MB5344.namprd11.prod.outlook.com (2603:10b6:5:393::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 2 Nov
 2022 07:27:56 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Wed, 2 Nov 2022
 07:27:56 +0000
Message-ID: <58917b42-bfdd-c352-4b20-68ff135f968e@intel.com>
Date: Wed, 2 Nov 2022 15:28:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
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
References: <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|DM4PR11MB5344:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f26afd5-a8cd-41e9-7908-08dabca3c294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mo+bAOq8oe+0A9nEaV35rzicGgTuUSmknRdLHLTgTThLliNBJUXjsoAAc2R/2R6+ktWkxxs4fEJN5STd0JKaqC1qiJYYoW79yeO4djKnqvxFpflr6wcXQ7IMGVYYwA6Jl8vocElEI44jT2+HgPnpDwQHZuocJgW+77Jx3h8M0bAsjCKGIp/zVFhzvkUJF9tZyWwzyoa8M/r7L05+sBBU+otsSzts/eAa9d2swaYC0OEhO5s5WQIeFzlIy8MLZPHfCBbT7VguybyK7RTUvfA0l0+epFttVHIIoZPAfs20y3baaxQJ4GCebo5ONzbcge3oBL0WIu4x+cBVwR54mqsnVN0U58OPYO1W0/6YWxsouoFtnw2jjv1s2q41BdhVpFaXAGd+aeU104A8WnJcHg38ZxMH+YpJKkz11YAbmNnkkAwsoEm7zW4MESMiu+MnmdAvJHAGO3DOCASndSF3zmqAayVkY12MGNF8VnvNBeRT7R7c33VmONJxqZv3zx5QEcNHOT6mtn1TlwQertJFiQOx264PF5UipwS0Qo9P5DvT5qXOuXpUqtYvisoZJ565mCW+jdOi7zZ4qPLx9Nact/55jh90Mw4Oe7JUYJP5g8vHP+h5eS/85ryty4175neUJc+3xrYTGB/nFG5mmkYSKqk787vX0z35dsenGiIy4SOjHjSFMVtXr48e6ixcOx+O3jsNHWkFIiE5l1+MscT9uXv9JezRh3TNwaWw863bOE3ez27RBKLmlPxxi6351N2v9zYYWwPWqrrMJW/jdCnsFW7JU/T/6rcms7X1wfL+N5WG877haDbBTks3PeRDIJWiAvg/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199015)(31696002)(921005)(86362001)(36756003)(82960400001)(38100700002)(31686004)(6666004)(8676002)(316002)(53546011)(66476007)(66556008)(66946007)(54906003)(6506007)(6486002)(478600001)(6636002)(110136005)(2616005)(186003)(8936002)(7406005)(7416002)(5660300002)(83380400001)(2906002)(6512007)(26005)(41300700001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG52S2MvRTBpWHRuSGVGeGxWUytHdDdwUnIyZW5qT3ZidE1wbkJ0citMMlJY?=
 =?utf-8?B?bmV2SHowOTF6czlNcTRFRUlwQlZIejFPcHFSZHJ5Y01VZ1grbXhLUzhQblFS?=
 =?utf-8?B?cnlLeVBVbnUxSFFCWnVhbGswdllaU0J4dW5VWkZTNndrUndDaDVkZmZ3VTR1?=
 =?utf-8?B?eUttLzE3Ty84N0lXcDRGSkxobVp1NUoxaks3b2w5S0VzN1I4dFJhU29QRC9O?=
 =?utf-8?B?eXp5Y2pnUkxkV05QUTF3cFFIUkJUdzlSdnkzWElOUHEzdW5Ka28zeS9ucE9W?=
 =?utf-8?B?bitZUzZ0dWF2UmpFZk0zSHlEQm5NN1AwSERoaGxZVzBOekdKeGNJL0JURVM5?=
 =?utf-8?B?WXFMRWNpOHM4eisyK0pJT1lORXlRbVVtUFF0RkU1SC9qblgwWjdOZGc1UEVZ?=
 =?utf-8?B?S1FFK1ljdktEcW1ac0haeCtscWxRKzhBQXEybHRPOVl5K2V0Y2hQRE1YSWR0?=
 =?utf-8?B?UGt4VXBYS2pGTTFkRFJPZEhHZi9MVVlTdDUwdE53K2hLalQrZ2IxRGhKUlJ1?=
 =?utf-8?B?aWtnUVR4K3JzaHJYKzNKMGZhZ3dHWm5KWFhtV0dtQUNJZEdKWTROZGxKOEw2?=
 =?utf-8?B?ZXd2UzZpT2JPYlRkRUVKVEZFaTVjRU9meDN0a3dDbE41QjRMQW8xbkhtcXVl?=
 =?utf-8?B?d2lpNnhWcjBZUGpkVFB4QTBiRnpLcTBxUHkwSTNnQVVsb0QzaHBkbzFDNStO?=
 =?utf-8?B?cDBVTkl6dk9lU3B3Sjd6UDZFQ0Vwd2Zyc0RiSmlYZlYzVUlQbnJXcStjM3Rn?=
 =?utf-8?B?TFlYZ1VBelBZZTl5Nkp1bzFIWkIzaGhGckw1OTVWTE0reU9GMFJCbHRnQSsz?=
 =?utf-8?B?cEZjUGZMVDZ1L1lOb1VDQlRHcG9zRTMyTFJkZ0djZXNLN2JIWHNNQTczK1ls?=
 =?utf-8?B?cXNBUFd3cm1yZGkzajJSTkpWZzYwMEJpWGlycGF0d2o4TkRISk1TWEJVNTRl?=
 =?utf-8?B?RzFEVG1BdzhpRHRKd1kvZ2IzYTJ1SitpcUNCOWg0M2FnWjhmcVRzcUVOM0Z5?=
 =?utf-8?B?eEhWd2xQNzl3eURscERlajdEMmZmL1Z2UEhhb25MN1hEeHNzZEJqN0Y1L2NS?=
 =?utf-8?B?N0o1OXVaMG1sb0dLNWU1a0JhWno2enorMFRVUWdxZm1GNDM1d0Y3aGhERGxG?=
 =?utf-8?B?b29XYnIycEJVWW9TR1JuZkdGVnh3YWdDMHVRa2dIcnY4b0hmdU5ILzAxbDh3?=
 =?utf-8?B?ZmFIcGxGbFhIZ1ZUbi82U0JlcGJ2bVgzUHNXQ05XR21BaGpEOWJRYVNGekRB?=
 =?utf-8?B?clhHNldMVVQrcWo5SmU5YWNxV3d3cVVTQkJLUG9YbHdBSXdVaFJYekRIZWp5?=
 =?utf-8?B?WkN1R2hHT1dQZndaTy9LdUU1Q3NXWDVLNVhwWjZYb1VWNjVQZEtLbUMzT2xD?=
 =?utf-8?B?RGZOUFJqdXFYVXFnZXFYTFFYSm9leFZvWTJlQ1hwYW1UVW1YMzlQeHZxVmhL?=
 =?utf-8?B?MkkxS2JXZEVINlJrZWMzWGYrRjBPZ1d4bEhDWWxQU1VxWVc5ZEFLd3FXMG8v?=
 =?utf-8?B?L3hOOWNJcHE3Zm4vN1pRSnIvMThWckhzZ201c294b0FMcmoxUzNMUS9MK2do?=
 =?utf-8?B?V0hJMjNaOWxnUnB6RHpnRWhNQ2hsazVOc2hOTnl1YkVvNTFmY2xZaUhta1ps?=
 =?utf-8?B?bXJ6V0xSM1I2MWg1WHEyN3poZ3M2STFSaU1yRVhwNzJtUjBaejVPV0pVbWxI?=
 =?utf-8?B?MEhPdXRPckdiY3l4RkhHZ08wVWlzcWhKRFVzckVXTlVWNjZYZlZTbkdBMWhx?=
 =?utf-8?B?a1EvVHprTmtUb0FoWDA3OEo2WDlac2d5bG1RemRQQnpUc1BKVzdoejh2Rnor?=
 =?utf-8?B?QitrSTYrZGdQS1V5cUc0NURkWmVGRENHMExVMWVNNmxXM1g1Y012aTRRRHln?=
 =?utf-8?B?Q01UYkxOMmJnM2haSUc3L05DcnJic1A4T1AvZ0RZejhPRWtrVWgrSDVUOTJJ?=
 =?utf-8?B?UlJEcXNaQ0xwa3ZXZWQ2YnRLOFlZMjVLM3BJb3h0Q04wUStHeUJlS3hwRDgr?=
 =?utf-8?B?dzVXQ1c5MVdyUW9JMkI5SEdja2JzRnJPTndtMVlyb3VLMlFSZEF6N0RyNkRL?=
 =?utf-8?B?YkdiK3J0MGtQV0x1RXdIUHZYbGFqWTVmRVpKaUJ4akZBcEY0d1dRZGR2ZEFr?=
 =?utf-8?Q?F2mGvVQVu+N1HGKYbnmAFdaLh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f26afd5-a8cd-41e9-7908-08dabca3c294
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 07:27:56.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/JmQgJzvan35zuO/74DwPF37a5CkC4T1Kp12fpm84oqvtf3okzKa9csw5ZZIYLl9OpmYjB5Imt+TtCkxTZ/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5344
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

On 2022/10/26 02:50, Jason Gunthorpe wrote:
> This makes VFIO_GROUP_SET_CONTAINER accept both a vfio container FD and an
> iommufd.
> 
> In iommufd mode an IOAS will exist after the SET_CONTAINER, but it will
> not be attached to any groups.

is there any special reason that we cannot attach the IOAS in the SET
container phase or SET_IOMMU phase?

> 
>  From a VFIO perspective this means that the VFIO_GROUP_GET_STATUS and
> VFIO_GROUP_FLAGS_VIABLE works subtly differently. With the container FD
> the iommu_group_claim_dma_owner() is done during SET_CONTAINER but for
> IOMMFD this is done during VFIO_GROUP_GET_DEVICE_FD. Meaning that

s/IOMMFD/IOMMUFD

> VFIO_GROUP_FLAGS_VIABLE could be set but GET_DEVICE_FD will fail due to
> viability.
> 
> As GET_DEVICE_FD can fail for many reasons already this is not expected to
> be a meaningful difference.
> 
> Reorganize the tests for if the group has an assigned container or iommu
> into a vfio_group_has_iommu() function and consolidate all the duplicated
> WARN_ON's etc related to this.
> 
> Call container functions only if a container is actually present on the
> group.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/Kconfig     |  1 +
>   drivers/vfio/container.c |  7 ++--
>   drivers/vfio/vfio.h      |  2 ++
>   drivers/vfio/vfio_main.c | 76 ++++++++++++++++++++++++++++++++--------
>   4 files changed, 69 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index 86c381ceb9a1e9..1118d322eec97d 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -2,6 +2,7 @@
>   menuconfig VFIO
>   	tristate "VFIO Non-Privileged userspace driver framework"
>   	select IOMMU_API
> +	depends on IOMMUFD || !IOMMUFD
>   	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
>   	select INTERVAL_TREE
>   	help
> diff --git a/drivers/vfio/container.c b/drivers/vfio/container.c
> index d97747dfb05d02..8772dad6808539 100644
> --- a/drivers/vfio/container.c
> +++ b/drivers/vfio/container.c
> @@ -516,8 +516,11 @@ int vfio_group_use_container(struct vfio_group *group)
>   {
>   	lockdep_assert_held(&group->group_lock);
>   
> -	if (!group->container || !group->container->iommu_driver ||
> -	    WARN_ON(!group->container_users))
> +	/*
> +	 * The container fd has been assigned with VFIO_GROUP_SET_CONTAINER but
> +	 * VFIO_SET_IOMMU hasn't been done yet.
> +	 */
> +	if (!group->container->iommu_driver)
>   		return -EINVAL;
>   
>   	if (group->type == VFIO_NO_IOMMU && !capable(CAP_SYS_RAWIO))
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 247590334e14b0..985e13d52989ca 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -10,6 +10,7 @@
>   #include <linux/cdev.h>
>   #include <linux/module.h>
>   
> +struct iommufd_ctx;
>   struct iommu_group;
>   struct vfio_device;
>   struct vfio_container;
> @@ -60,6 +61,7 @@ struct vfio_group {
>   	struct kvm			*kvm;
>   	struct file			*opened_file;
>   	struct blocking_notifier_head	notifier;
> +	struct iommufd_ctx		*iommufd;
>   };
>   
>   /* events for the backend driver notify callback */
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index a8d1fbfcc3ddad..cf0ea744de931e 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -35,6 +35,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/interval_tree.h>
>   #include <linux/iova_bitmap.h>
> +#include <linux/iommufd.h>
>   #include "vfio.h"
>   
>   #define DRIVER_VERSION	"0.3"
> @@ -665,6 +666,16 @@ EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
>   /*
>    * VFIO Group fd, /dev/vfio/$GROUP
>    */
> +static bool vfio_group_has_iommu(struct vfio_group *group)
> +{
> +	lockdep_assert_held(&group->group_lock);
> +	if (!group->container)
> +		WARN_ON(group->container_users);
> +	else
> +		WARN_ON(!group->container_users);
> +	return group->container || group->iommufd;
> +}
> +
>   /*
>    * VFIO_GROUP_UNSET_CONTAINER should fail if there are other users or
>    * if there was no container to unset.  Since the ioctl is called on
> @@ -676,15 +687,21 @@ static int vfio_group_ioctl_unset_container(struct vfio_group *group)
>   	int ret = 0;
>   
>   	mutex_lock(&group->group_lock);
> -	if (!group->container) {
> +	if (!vfio_group_has_iommu(group)) {
>   		ret = -EINVAL;
>   		goto out_unlock;
>   	}
> -	if (group->container_users != 1) {
> -		ret = -EBUSY;
> -		goto out_unlock;
> +	if (group->container) {
> +		if (group->container_users != 1) {
> +			ret = -EBUSY;
> +			goto out_unlock;
> +		}
> +		vfio_group_detach_container(group);
> +	}
> +	if (group->iommufd) {
> +		iommufd_ctx_put(group->iommufd);
> +		group->iommufd = NULL;
>   	}
> -	vfio_group_detach_container(group);
>   
>   out_unlock:
>   	mutex_unlock(&group->group_lock);
> @@ -695,6 +712,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>   					  int __user *arg)
>   {
>   	struct vfio_container *container;
> +	struct iommufd_ctx *iommufd;
>   	struct fd f;
>   	int ret;
>   	int fd;
> @@ -707,7 +725,7 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>   		return -EBADF;
>   
>   	mutex_lock(&group->group_lock);
> -	if (group->container || WARN_ON(group->container_users)) {
> +	if (vfio_group_has_iommu(group)) {
>   		ret = -EINVAL;
>   		goto out_unlock;
>   	}
> @@ -717,12 +735,23 @@ static int vfio_group_ioctl_set_container(struct vfio_group *group,
>   	}
>   
>   	container = vfio_container_from_file(f.file);
> -	ret = -EINVAL;
>   	if (container) {
>   		ret = vfio_container_attach_group(container, group);
>   		goto out_unlock;
>   	}
>   
> +	iommufd = iommufd_ctx_from_file(f.file);
> +	if (!IS_ERR(iommufd)) {
> +		u32 ioas_id;
> +
> +		group->iommufd = iommufd;
> +		ret = iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
> +		goto out_unlock;
> +	}
> +
> +	/* The FD passed is not recognized. */
> +	ret = -EBADF;
> +
>   out_unlock:
>   	mutex_unlock(&group->group_lock);
>   	fdput(f);
> @@ -752,9 +781,16 @@ static int vfio_device_first_open(struct vfio_device *device)
>   	 * it during close_device.
>   	 */
>   	mutex_lock(&device->group->group_lock);
> -	ret = vfio_group_use_container(device->group);
> -	if (ret)
> +	if (!vfio_group_has_iommu(device->group)) {
> +		ret = -EINVAL;
>   		goto err_module_put;
> +	}
> +
> +	if (device->group->container) {
> +		ret = vfio_group_use_container(device->group);
> +		if (ret)
> +			goto err_module_put;
> +	}
>   
>   	device->kvm = device->group->kvm;
>   	if (device->ops->open_device) {
> @@ -762,14 +798,16 @@ static int vfio_device_first_open(struct vfio_device *device)
>   		if (ret)
>   			goto err_container;
>   	}
> -	vfio_device_container_register(device);
> +	if (device->group->container)
> +		vfio_device_container_register(device);
>   	mutex_unlock(&device->group->group_lock);
>   	return 0;
>   
>   err_container:
> -	vfio_group_unuse_container(device->group);
> -err_module_put:
> +	if (device->group->container)
> +		vfio_group_unuse_container(device->group);
>   	device->kvm = NULL;
> +err_module_put:
>   	mutex_unlock(&device->group->group_lock);
>   	module_put(device->dev->driver->owner);
>   	return ret;
> @@ -780,11 +818,13 @@ static void vfio_device_last_close(struct vfio_device *device)
>   	lockdep_assert_held(&device->dev_set->lock);
>   
>   	mutex_lock(&device->group->group_lock);
> -	vfio_device_container_unregister(device);
> +	if (device->group->container)
> +		vfio_device_container_unregister(device);
>   	if (device->ops->close_device)
>   		device->ops->close_device(device);
>   	device->kvm = NULL;
> -	vfio_group_unuse_container(device->group);
> +	if (device->group->container)
> +		vfio_group_unuse_container(device->group);
>   	mutex_unlock(&device->group->group_lock);
>   	module_put(device->dev->driver->owner);
>   }
> @@ -900,7 +940,7 @@ static int vfio_group_ioctl_get_status(struct vfio_group *group,
>   		return -ENODEV;
>   	}
>   
> -	if (group->container)
> +	if (group->container || group->iommufd)
>   		status.flags |= VFIO_GROUP_FLAGS_CONTAINER_SET |
>   				VFIO_GROUP_FLAGS_VIABLE;
>   	else if (!iommu_group_dma_owner_claimed(group->iommu_group))
> @@ -983,6 +1023,10 @@ static int vfio_group_fops_release(struct inode *inode, struct file *filep)
>   	WARN_ON(group->notifier.head);
>   	if (group->container)
>   		vfio_group_detach_container(group);
> +	if (group->iommufd) {
> +		iommufd_ctx_put(group->iommufd);
> +		group->iommufd = NULL;
> +	}
>   	group->opened_file = NULL;
>   	mutex_unlock(&group->group_lock);
>   	return 0;
> @@ -1879,6 +1923,8 @@ static void __exit vfio_cleanup(void)
>   module_init(vfio_init);
>   module_exit(vfio_cleanup);
>   
> +MODULE_IMPORT_NS(IOMMUFD);
> +MODULE_IMPORT_NS(IOMMUFD_VFIO);
>   MODULE_VERSION(DRIVER_VERSION);
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR(DRIVER_AUTHOR);

-- 
Regards,
Yi Liu
