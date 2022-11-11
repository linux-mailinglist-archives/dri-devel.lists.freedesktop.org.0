Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD7625237
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 05:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A53910E74C;
	Fri, 11 Nov 2022 04:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB2510E747;
 Fri, 11 Nov 2022 04:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668139935; x=1699675935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cTw+XUvINNWi6KXpf+bxRWBH07GfHWKUTEdZf6hcS7k=;
 b=EtjAA0wdcc7v4XVaEBw7jQwMPO+74+vziYUKzMn4GQnfmw1EByhnZnII
 +eQ/Z2/H2BNqSnnatEPIbQvqti5Fn5rzzZdr5Fdg1OtgRaZDUm6/ZHXcF
 WNIwc4NcnjTe8BxdcYI9WXY35HimsYC/TQjToFkPiHmRW1aClQX75q1ND
 CBt5qvaaY1vymYujOkMFZO2S2lOsCnv9iSzAVMOdDc5BJLHoHweIP5YHY
 a1l9bw64gwxuWD41be1yq+U46qeZRveoXqigJ87gVVWdEehO0Cx6s9kEt
 Krj+xEq6rqXz01b2VAsvlBuBby9Ondu2SR7o57tM+exvuuKLyZKBfqIE6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291921969"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291921969"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="762538487"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="762538487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 10 Nov 2022 20:12:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 20:12:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 20:12:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 20:12:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 20:12:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHv4P3OE2Ny6fFXg1jnUGlDFCqr8uLuv7G1/RoJ7LZKb8DgpGAfqUuSt0v6GQdIK5hJ8TpTznzwTDIxPBUM6CZ9b64k02f+pdDEw0k5Ucuz2k+XACi8M5bt02ynjQKaqrSRkZqquV0M5iWSeDqiKKAmzu8MZ5UYkfhz6EecHxpcXY2ATdVPVznDwa5UBwn8Hs2MPHzWUXx6MZmDG05z82yzQRsgCi3qi/tIn8tokJPxCxS9snhnHwN6Kus/+3jPZQxHBdGvYVVUNMeGLNL4+NTW7zLCeUXYSrMMl+xnIl0PoysWOPTsDNQ+tJ625l4WGN41Wv3kPIaqbb1jEWF8YjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yswTuldVs88gTzDx1lM8DTtDjpWd1p84WTHTJELwu/0=;
 b=miOoyIgyzlzpMP153OiB0AamzdG896SXDbpO6MQRSYdSUFFQDiTP3XY1iywU1k3dMh5uhTucPwAnrjxH8pVIZA9AFHbG+D5pOrG+Rl0/3826d4zMghs2tV57mp8lMKqW39IKT3yORQteEJ3dsu6JH9xXjC3r/14crVJRvCVU7E4E146EinyEloWRlcZafCgiyIwhs6OTNDynzRsLFvMxfI+sZCkqaRbxpevtx4vePzQVlWbj1WtIZJfIlMeiAKvO7Qtl8hjhwih6LS9JJT2BLPhaMrVUrSvHSN4EYL8OnSlui5rDV5PPdRAvUSJg1jFP4QAfvAtneGIMnZvNrs9sLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Fri, 11 Nov
 2022 04:12:10 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%7]) with mapi id 15.20.5791.026; Fri, 11 Nov 2022
 04:12:10 +0000
Message-ID: <5d50d507-6cd9-5f38-23d4-85f784cb8609@intel.com>
Date: Fri, 11 Nov 2022 12:12:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
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
References: <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2ec539-9829-4495-2ba9-08dac39ae76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yP13JX/2/AnTjS59gu54gscTaxsPnqfIXuUIP7JeoR7w2lZMtYcuT401LYziKjo3QQCilCwdE7j9eNxLjPQ9EeLlh0J2pYGpLTckERH9jD5eZXbcnmY/3FwygI/ctL0RknxLbDagkpVGKrmFWDBjaL6HPg10IcDO9npCGPZpbJ934Y+D29WA3+VZKy8BMjPr82+vLyeTsoMn33r7z3KceXBiIAO5JW9usgdgaCvMhbZpRrgDQ2th9qhXR5l84Vw6qI/RVKFxS/SvM/YwhZy4dBziTagL3bNLphiyN3lepklGHSDEeNPsP44/n7B+v5owOIw/WCDoYWBZn9YRI0sa7eWtzZMKzbvKK3dw+rBHj24w/2unzHhk3ZxmUS35wB7RjU+HzEy/wHjQT7O0Z2A1yCRAQvMoBio46w4TBqVuxqBuHKSLo4IQrUcH9NhvnU7c25VSwftE+R/IExp6TbxAoApeYedMrz0BTQgTU7MEHDqzFdACy7kZ8fukvLdNX+ly2CO5t0KQ6EPi+pxWBR+5EkEY4bv/iJ92ry4YeBAWT1J97mlJOmlZT53q6ePq/o/waoJpDkknErzguPl9TUeLN5zMDBOsyf1BAwB6WeowY6abdCntkfqn1UUtmse6SGs+enhS6VzAFm4Q+hdILrUV1w1phfI+psgYM9xGjIZ9c+fBh2FCqJTIAH55JmuwAJjVpPwlw/gE0cAkcOwyxVuHFxAZTMQQaZm3Gty6QrTbFp58vRvcQBOrqkaPQxCJrGvuahc2nEBo8TXpqvw+HBG0YW6XPTwppiNG22OYu1+ldH9GdGCBfcMwfR89ovj49bV/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(6506007)(31686004)(36756003)(83380400001)(66946007)(6636002)(316002)(5660300002)(66476007)(54906003)(110136005)(8676002)(8936002)(4326008)(31696002)(66556008)(86362001)(82960400001)(921005)(38100700002)(41300700001)(478600001)(7416002)(6512007)(26005)(2616005)(53546011)(6486002)(6666004)(7406005)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2w1SVJ6bWRRMDV1UWcxOGRMZDYrdi9ndlhHRHpuQ0x0UW4yODFHMXlYT2xl?=
 =?utf-8?B?bVNDckVDb0tYMlpBUVdKbU9MdmZTMjZtVTBndjNZUXNpcmpCSVNxNzZmRFRZ?=
 =?utf-8?B?OW1nRENBcXZIdmswM1Avd2ozT25YMkZVdVdPT1ZXQjA1Qzkyd0lyZCszTlBm?=
 =?utf-8?B?aWhxTlhUYnJVYU1rZjBwc2JrZ3ljV3VmU29wRDQyd0cxQjRNVmJHMEgza3dO?=
 =?utf-8?B?eWx4N2w1Q3lEaDA2ak1lVjR6S1pTYzBrbmpEK2dJTkFGS3ZvVFp3OXNNVWpI?=
 =?utf-8?B?R0l5R0JGakZQQ1RhOGU5SU1ZNnZhRzY4cnYyVGpEbEsvYzJMVitGdnI3VzJT?=
 =?utf-8?B?Y1VUY3RIbytuUDFkeU5pSkxxVGxZYVg5N05NV3VvMFhOZmQxV3BzS1AwdlFG?=
 =?utf-8?B?cURQY2RTQ1VnVGF6TncxNkp0cXhERXhLZ09aOEx0cXpuTEVUWGpVSXpySnBn?=
 =?utf-8?B?MllMQjBzSk9XYWMxaEVPd2d1ajh6Y3lDTjFhUFo1Uk15UWVZMnBKdEJZM2Fz?=
 =?utf-8?B?U1lGMy95RFBlWEVXdUNvUUphbWVmbDd0UlNUTk1YUldCZXplQzhDd1Q0S1Rp?=
 =?utf-8?B?cUV1eTFVMGVZRzRZay8va29uUkJhSnpGRWFxc2dQZjVHM3ZWR1NCdUdoSmVU?=
 =?utf-8?B?K2FpTzJ4RWxoTGF2S29DcU5UR0F5MXJUelNFejJSYlJ0empQL2NRUXV4d3p5?=
 =?utf-8?B?ZWZKL0hiWU9uc2RKakRhaHNGcFZhWWt0eHpnOXNSUUtlMkFaa1hTNWZ2ek9l?=
 =?utf-8?B?SHp5SDYzQ3FpUy9WMGxEajBhUFFSYzBxM1hGeTRyaDVhZ0l2RUlNMGMwK1A1?=
 =?utf-8?B?M3hiWDdLL05HcThWRytVbjBWTFRRSFhOcmlvay8yUW01d1FuRHU0QkROekpm?=
 =?utf-8?B?a1dCa3VRSWxZdkNxaFdua0FvbUR2MHY3MWppd25YSVRWUkNWN2Nqakk1Uk1S?=
 =?utf-8?B?K1ZVck93cHhkMjd4TGZ3OHBVUGxtMGJ2OExrSXRBZVJ4VzZBQkRrUjVOQjFx?=
 =?utf-8?B?Y0pFZHVLMlUvZThnaGthY0c1QUtnRFE1TWZiS1VoSURIUTcyL3ZqL0VxZEVt?=
 =?utf-8?B?WlQxclhsM0FvMEZLRG9iaklZdVU4M2FDMDZDRnRUVEs4Q2lNTGdQVVVud3FX?=
 =?utf-8?B?dHFnZVBTL3JqdzVYbU9qMWs3dUVITXNXS3VBVG1mTmhKTjM3ZFcvNWFxQndk?=
 =?utf-8?B?ekQxS2h0Ly9qTmt3N2JieEMyd1VnbFE0L3ZyQmZMMnU2OFRsTGtibG9zZWNm?=
 =?utf-8?B?VHNjeXJIckszWnIwQWgzRVZINGFIdzNwSGVENWxqdmdRWWJLNnp0cmw5Wkx0?=
 =?utf-8?B?SWZ2NXZjdVBIWW1qV3ZZWXpSd1NZZ21DV2d0amFXazcxNHUwV0FqWlEyaXFp?=
 =?utf-8?B?aXpOaTNkRVFmUThoWHNmOGZpWUlxbnhhYXNMWHhFMHREc1NMalRBT2RwU082?=
 =?utf-8?B?RjhyRXJCcE5iTE96QnZIWjRmdVcxTVZaakFvek4yTnVhWlVTMWRSNTlIUlVS?=
 =?utf-8?B?WkVjcWREcXN3Nk9qZ3BKMEpwMXFIOVMvMFV6cGdVN3oyK0J3cnQrQVZFdjZZ?=
 =?utf-8?B?VDZKdmdqeGx0cXFTUk11TVF3TzNxcDhrR0pUQzg2Q1NXZUtudkxOWS9VWVZZ?=
 =?utf-8?B?aWV2cEpyUU1TUkZBVlFBblF1OUhYV1VzTWcySDRiRmk0bFl6M1NQSFZEU2pp?=
 =?utf-8?B?N091QXczM1NuUERIdmFjQ29MSjBvTklPYyt6elJRc2tUTkpBa2hvcFlQbXY4?=
 =?utf-8?B?SW1VUXowb2kxQlZrQWxJMENQdGhuRkN4bnM0eGhpMHhabTk2RFg4Vjgwd283?=
 =?utf-8?B?SE1CVklhenVBbFk4MFVjNVdKRms5V3RhRXAvWXoyQ2lBQ2x1V3pyck16SXo4?=
 =?utf-8?B?RmI2bVZPb2FtcDgzR3hOR0pBcHg3U0ZGS09PL2ZuQmxLU2Fwa2lXb2d3eFpV?=
 =?utf-8?B?ODVSQy91MFhrRjRoZ3VsdVV2aituUlJ6OGpHd3pFYkNUZXFHUnljUGhxV2ps?=
 =?utf-8?B?RERqTDB4Q2hxc29KZjRSUmdyVHhzRmppZ2tTd1ArNGI2SDBqMk53YU9BYU5G?=
 =?utf-8?B?NEJjWHJpMEtxYk9FdFFmNU94WUhqZ3Rab0JBQmdod2JjdlhoclhpWWtoeXBV?=
 =?utf-8?Q?3Nhjd6mRcbKctf+EfnwORJb6D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2ec539-9829-4495-2ba9-08dac39ae76e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:12:10.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfqBHcTsLVvAlZm/SjydpERLIw4Q9SXr3S3KZZ1tEWLf+9cUe+0zp3dqmFhjTHf8DjwgeYkfigEkXZSZfGnWaA==
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
> This creates the iommufd_device for the physical VFIO drivers. These are
> all the drivers that are calling vfio_register_group_dev() and expect the
> type1 code to setup a real iommu_domain against their parent struct
> device.
> 
> The design gives the driver a choice in how it gets connected to iommufd
> by providing bind_iommufd/unbind_iommufd/attach_ioas callbacks to
> implement as required. The core code provides three default callbacks for
> physical mode using a real iommu_domain. This is suitable for drivers
> using vfio_register_group_dev()
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/Makefile                         |  1 +
>   drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  3 +
>   drivers/vfio/iommufd.c                        | 99 +++++++++++++++++++
>   .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  6 ++
>   drivers/vfio/pci/mlx5/main.c                  |  3 +
>   drivers/vfio/pci/vfio_pci.c                   |  3 +
>   drivers/vfio/platform/vfio_amba.c             |  3 +
>   drivers/vfio/platform/vfio_platform.c         |  3 +
>   drivers/vfio/vfio.h                           | 15 +++
>   drivers/vfio/vfio_main.c                      | 13 ++-
>   include/linux/vfio.h                          | 25 +++++
>   11 files changed, 172 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/vfio/iommufd.c
> 
> diff --git a/drivers/vfio/Makefile b/drivers/vfio/Makefile
> index b693a1169286f8..3863922529ef20 100644
> --- a/drivers/vfio/Makefile
> +++ b/drivers/vfio/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_VFIO) += vfio.o
>   vfio-y += vfio_main.o \
>   	  iova_bitmap.o \
>   	  container.o
> +vfio-$(CONFIG_IOMMUFD) += iommufd.o
>   
>   obj-$(CONFIG_VFIO_VIRQFD) += vfio_virqfd.o
>   obj-$(CONFIG_VFIO_IOMMU_TYPE1) += vfio_iommu_type1.o
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index b16874e913e4f5..5cd4bb47644039 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -592,6 +592,9 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
>   	.read		= vfio_fsl_mc_read,
>   	.write		= vfio_fsl_mc_write,
>   	.mmap		= vfio_fsl_mc_mmap,
> +	.bind_iommufd	= vfio_iommufd_physical_bind,
> +	.unbind_iommufd	= vfio_iommufd_physical_unbind,
> +	.attach_ioas	= vfio_iommufd_physical_attach_ioas,
>   };
>   
>   static struct fsl_mc_driver vfio_fsl_mc_driver = {
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> new file mode 100644
> index 00000000000000..bf755d0f375c5d
> --- /dev/null
> +++ b/drivers/vfio/iommufd.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021-2022, NVIDIA CORPORATION & AFFILIATES
> + */
> +#include <linux/vfio.h>
> +#include <linux/iommufd.h>
> +
> +#include "vfio.h"
> +
> +MODULE_IMPORT_NS(IOMMUFD);
> +MODULE_IMPORT_NS(IOMMUFD_VFIO);
> +
> +int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
> +{
> +	u32 ioas_id;
> +	u32 device_id;
> +	int ret;
> +
> +	lockdep_assert_held(&vdev->dev_set->lock);
> +
> +	/*
> +	 * If the driver doesn't provide this op then it means the device does
> +	 * not do DMA at all. So nothing to do.
> +	 */
> +	if (!vdev->ops->bind_iommufd)
> +		return 0;
> +
> +	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> +	if (ret)
> +		return ret;
> +
> +	ret = iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
> +	if (ret)
> +		goto err_unbind;
> +	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
> +	if (ret)
> +		goto err_unbind;
> +	vdev->iommufd_attached = true;

it's better to set this bool in vfio_iommufd_physical_attach_ioas() as
the emulated devices uses iommufd_access instead. is it? or you mean this
flag to cover both cases?
  --
Regards,
Yi Liu
