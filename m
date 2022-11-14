Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8636282EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D1510E294;
	Mon, 14 Nov 2022 14:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3509710E294;
 Mon, 14 Nov 2022 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668436905; x=1699972905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4BBB2d1tfy9zlEpRqMKkISYFdawNaxHzQsVAhO9mrCQ=;
 b=VzUiBtF9UvtHapPRd0R+IOnAa8+8wYynFz73/ZhpHFLN4hHnejPf+a29
 X6Tsw/C8MemUIGKzudiAPyCS701tnwjSenSTVr55j8utC67aAMvGIF+xw
 0UmTQG9pjVPr7PRDQzRvlPHXj4GCxrZFAOGqwynC/Jx16goEmYp7XdgRb
 tICDG0oHYACsu9SdWs0LZgFvCqIXuzuEiA3zeH6Poi5sRHP7WgZ4v1CtE
 KwrM1U2xXfzfBxakPY+C6QaCCgVNpGHZIzMSX4FsPI/xxsBJBZpPVDen2
 A1IN0dk1GPgKyINnw70djd75WGL3H3PljYY/FLTp3YGerXQ5t4MEpgaWm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="291696856"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="291696856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 06:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="640793765"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="640793765"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 14 Nov 2022 06:41:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 06:41:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 06:41:43 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 06:41:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8KQvZ63tGmGZvYafbYleBy2acrgOxnjPxP9rRT76wZn0hlcs79NZGM4jzZKHivjIPZvCI67ubxxXCHTTlvSKR3k5VLA/PuHMbD3fWcpObKw9EX//4Ng90AOvIGtYEA9MCWjTkJEdjFmMdsCgKAp0CfXKeA42gEwVHF/lioqYD7mR14IT4A9UbrmUYsc2XcG3n2nIizLSkRFiCrmypnJLs2Q1dgUfI2igBiLzKDc/LvS6AMZwFERGu0H99raMR9zWK5oAqC6AMy4ghikRBPYZ2S8lUcFmFZRuy3PrFWO8JPtcd+Xngxbsf+nMbIofF1sBmjqyqdbzAr80njyibUpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGhHZKVgmedFGiQbbxuA1d//eTYCzcDNm9Pt6B+GD+0=;
 b=G7m7iCcS2uJFez75vupdMiJsb7Ze8BMId2TH6LQ+CRSlrde6JOsWKFxLNXkwrydS1AmQrJmhVR8SZvnhEi4C3lqUrXbI7ZtRsJ0waG8AE0G+caXeHXRrPg0hW9XN84LsfiZVectBNwLPm3Ks1kXeVVD2QO7G6hzBhHBUwBDF1O9TukFbIO6/COz4VjvzCGtAxZGhekxfxNw+UJgOSUzr/O2YpP/GRPocjuaMCT99erxuS2Ifxo9Bq61KzOek3zusd/p30skM4YCTdyJzaK6aGIrlNjC7qMVTac3L0/j3+4U4E9clLtH4mUFuwmH6lhb1rtV/8rl0H7o9bCmJdFyJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 14:41:41 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:41:41 +0000
Message-ID: <b473f14a-8087-c0b9-43ce-f78fb92c41cb@intel.com>
Date: Mon, 14 Nov 2022 22:42:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
 <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
 <Y2vb4fuPZdYKR1M1@nvidia.com>
 <127303b5-8753-f866-1811-a67ff4bc021b@intel.com>
 <Y3JSyQRtGTkZpFFi@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y3JSyQRtGTkZpFFi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4adcfd5b-4051-40ba-bfc4-08dac64e57f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjncUQwOlrycc9LM2wH4u82pE7xQPOnx1LGp10RI8PlWD30yE3U4paMPD3usUyOfUG6gN54GARoJEhZ4sumEoyZ4hykXikxRrSE3lEJWzY8gHIN/xEbooQDVSwWlIsG3MpoIlMXOVAOgsWpMxsPBTYUqXvHxhbsYj/w/Grm4hc1jfjdaUBJMY01mVFkxzgCF3HRaIAgYoEHLWjc7hNSu3FBLsDoMD9se9HOtL+WZF68xhOVuZSqCy/h9zyu3XUIxMggcaTeA6UaLJdlqvynkt6HgZtR9civ1Omrkc3nTsfrZvXJdu/4A79LzpiNTTKFloFz8FstRKNAtFxj9b1yEHxVCD8GQhM5roLWgKNsx6CY9WhpSLwZuoiZ1TIsjZzao53fVZL/mKXfjtvQiqhkYK+O9Z4upAmVaCczu4LOM7tNTMzxXM7Pg+TzeS1nxkjXOGwe98vUKOsafqd598i1HnXUGMDHyoDEa+CKMxFF7EBxN1KndKFdd5nD9REZU3OPjICMx9jJKMg7Bf/W/Jt3P3WvCZyDzoiKKHeV4AHIgUnBOJrbaGuf/sb3X4d29ZuWgqS7o1Q+TvS1tBhcRkhrqzlJeqXyE0CuHHmTuXUsOzPgTobSS6yqO0us7WmQnLIKJxsw/aedTGkoNefYGsMv4u1L9xhF4YXOzq6yE6tyU+1NAxhbBgxLHvwld0raPYuDA6XRvFCWi9/c9Psoky1Za0QGwjDB6/vVHqwPQkiGMuNYIUFSQgj6N5mCQkghXtRZ9z1mrKm5dIQMyQwclaOwCw5syfZbdTDgNntkeiqKAM6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(6512007)(6666004)(31696002)(6506007)(86362001)(5660300002)(41300700001)(478600001)(53546011)(36756003)(26005)(7416002)(7406005)(8936002)(38100700002)(82960400001)(54906003)(6916009)(316002)(8676002)(66556008)(2616005)(6486002)(186003)(66946007)(66476007)(4326008)(2906002)(66899015)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjFFMEJleUhVS0tPMFhGdFNpZDhsMUFlU1IwWE1USUVyVGdUT0hVMUFlRmJM?=
 =?utf-8?B?V3pjUHArS2hsWXd5RlVENWF4NEI0cHVYd3BMVzVsRlVXWHRMU09LN2Zib3E0?=
 =?utf-8?B?N000TysxUEQzdHRXMWZUeWl3QkVUUHZsYm5ESXNmWGhGTVNwQ3NGK0dxM25o?=
 =?utf-8?B?bVR1aGVpdTlYNFc1ZjMzUDFEQTUwVUtwS2oyOEdsSkhCWUZPQWQxOFRrYWxn?=
 =?utf-8?B?QUVBM2xaS0pXK0Jqekl2ampOOVdjME03NUV5RS9KeFp0MDdvbmtRRmw4ZXNo?=
 =?utf-8?B?MUlQbkphck92RkxFNXNnUStqa3hNMEIrUURDSXc4K0hXVWdGeHhiMUdSM0Zh?=
 =?utf-8?B?T1c0eHBCdWlXR3ZZdUQxNWFHZW1KWnNza2dySmNyS0FuelR3NGpQd054Vkhh?=
 =?utf-8?B?S0hWV1dlUXZ6WEdic0gwZlJRbkFxV0ptTWpIRk93cDlTS28yRjRRQ29tUEZF?=
 =?utf-8?B?eEgzUi83MXRYNnFaMW5oQ29jeFp0aHE3NzFVS3l5cjRjQ3lJNzZkNE1vWUFJ?=
 =?utf-8?B?TzMxWlVDNHlLbnRPTWV3Rkg1eVlEUHk1bGZCRU0yanhGUkVjbFpxYWVIMlJq?=
 =?utf-8?B?aTk5SndPNlFuWTIyU1grZ1E4cmEwTmJkWGxTNzhvVmhIRDgrTWJNcW5EZWxm?=
 =?utf-8?B?M09zcUFsRklFaW42YVE2OG01U2ltbnorTCtudlFVSmg5dGVXWFFadVIrbzll?=
 =?utf-8?B?Kyt0LzJGU1VBbXlzOGZVN3FDUzB4ZDRQZU9ETkFUSFhoeXpmenlDRk4xS0h5?=
 =?utf-8?B?QWlSVGVqWGFLeDhKWldpaHptc3ptaFRIL1hGb044UUdibEN6dTB5UzNkd3NT?=
 =?utf-8?B?aU15RHc2RzU3S1JpTW1WWmpjUUYwdElPT2NCenZkd2l1N1FRUENFNGJnSnlD?=
 =?utf-8?B?Q1dCRUlRZXA3QkI0ZVlldXE4dDhRdEx5UHM3WHlObVR3UWxnUjFTTEtUVURw?=
 =?utf-8?B?SVlvUnM3RzZQaGhQeFRML1ZjaU1XSS9CRkRndm1zL0NvSGd2YUxpQmJHZWVu?=
 =?utf-8?B?RnBYemtZbVJUc1RzYzFjUmRHYmIra1pvSUV4ZXZvL0cvb09NSzlKM1pkaUdy?=
 =?utf-8?B?Rk1DNkNNOHcyY1RDeDBBY2gzNWFIVkk0cllodzhMTzJPQkUvZTEySVZsam5z?=
 =?utf-8?B?OUxod3p1alhiQXBZOGJnUVV2eld4K3NzWVFSKzZYa3EzSnRIMmp6VUl0eTEz?=
 =?utf-8?B?b3ZoVXByaU1kRzZUcG56UkdaZFgyZkNzV25rV1BtMGhKRk5iRDFGbThMWnZk?=
 =?utf-8?B?M3gzZ3NLZTZWUFEzSTdoQVJsc2dKcmNMTWgxZy9CMDYyNHdzMFFCRXdjTUpU?=
 =?utf-8?B?akJ1aDRSMGc5TGdueEh2b2t3REJSbXZyc0RiSEkrZWZGZ0M5cExrUkt2a0Yx?=
 =?utf-8?B?NkdLZ25jcDNmVHhzUGxLVzFKUkFHd1FhZk53TFE3b2RQSmJmVkd4WlJQQXdQ?=
 =?utf-8?B?ZjRoYldvam42TjZvakJEbDBVeEVjQ3hvMENLSDRESW8wcjlvUHNwZVZreWpE?=
 =?utf-8?B?QlRHNHpiY3F4VDVwV0FwYTN2MGRNNmEwMFpyclJxQ3grRUxPN1pWNzBaYXVz?=
 =?utf-8?B?NkNQcG1KaDRaQ3BocUJRVi9CTUpSVVJHRWJUTUNYdTBQYVFVSGgzbEZZZ05s?=
 =?utf-8?B?OFV0cVU2K1MxNkgrbjAxSGdQNm9xcEZDaWdaamVYU1FDazJLQ2FpYXl1Um90?=
 =?utf-8?B?TlNhTnhRWWh6K1pZdU13Z2NUMFlFYVNaa2RSSCtIb1R0Zm1pcXRDRzdzc2cw?=
 =?utf-8?B?WnBBNU9LR252NzVuSmd5aTI2NHBPQ1dyc0F1VkxZV1F2bHllRG9nZmFPbkFu?=
 =?utf-8?B?ejlUbSsrdVRWYkkzL3ZiWVdySWZQTFpoTXA3K1J2VU1NdExFQkwydTJOL1My?=
 =?utf-8?B?ZHcvZDdoc2lrQmVHa2dtbHlXOTBwdW4zMnk3Ni92bmdFUjlYSlhrWU1CU0tX?=
 =?utf-8?B?S3NMMnA4WjVaaElKa0U5RzVQZ0U4OXFuUWkyMEZuWDBFT2ErVGZidTRSSGRZ?=
 =?utf-8?B?aVNFVkpSWVQrNEhrQlVCc0RTeG5zMnFDVmRNKzhrMS83R1pNTFRnbFYyZDY3?=
 =?utf-8?B?eU1IY1E1TDQwcVlJc1NYbUFxbUEySVBTM29ZUWRVUDdscko1TE5IM1YzM1dC?=
 =?utf-8?Q?jYmS5zsbz4TSx+za7Uq85xsV7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adcfd5b-4051-40ba-bfc4-08dac64e57f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:41:41.6101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqlPQtn3kqy8MCHgIv+xEdd5Pq5KEmn0g/ci8sqPEVE+AiaXn57nUalW+/8J5wW4PyMNm76+UBKlh02hF09eKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
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
Cc: kvm@vger.kernel.org, "Hao, Xudong" <xudong.hao@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "Yang,
 Lixiao" <lixiao.yang@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, "He, Yu" <yu.he@intel.com>,
 Harald
 Freudenberger <freude@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/11/14 22:38, Jason Gunthorpe wrote:
> On Mon, Nov 14, 2022 at 08:51:58PM +0800, Yi Liu wrote:
> 
>> Our side, Yu He, Lixiao Yang has done below tests on Intel platform with
>> the above kernel, results are:
>>
>> 1) GVT-g test suit passed, Intel iGFx passthrough passed.
>>
>> 2) NIC passthrough test with different guest memory (1G/4G), passed.
>>
>> 3) Booting two different QEMUs in the same time but one QEMU opens
>> legacy /dev/vfio/vfio and another opens /dev/iommu. Tests passed.
>>
>> 4) Tried below Kconfig combinations, results are expected.
>>
>> VFIO_CONTAINER=y, IOMMUFD=y   -- test pass
>> VFIO_CONTAINER=y, IOMMUFD=n   -- test pass
>> VFIO_CONTAINER=n, IOMMUFD=y , IOMMUFD_VFIO_CONTAINER=y  -- test pass
>> VFIO_CONTAINER=n, IOMMUFD=y , IOMMUFD_VFIO_CONTAINER=n  -- no
>> /dev/vfio/vfio, so test fail, expected
>>
>> 5) Tested devices from multi-device group. Assign such devices to the same
>> VM, pass; assign them to different VMs, fail; assign them to a VM with Intel
>> virtual VT-d, fail; Results are expected.
>>
>> Meanwhile, I also tested the branch in development branch for nesting,
>> the basic functionality looks good.
>>
>> Tested-by: Yi Liu <yi.l.liu@intel.com>
> 
> Great thanks!

you are welcome. this is a team work. :)

> In future I also recommend running tests with the CONFIG_IOMMUFD_TEST
> turned on, it enables a bunch more fast path assertions that might
> catch something interesting

oh, sure. will try.

-- 
Regards,
Yi Liu
