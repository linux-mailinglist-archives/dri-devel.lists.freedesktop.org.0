Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4596253E7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 07:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7C610E778;
	Fri, 11 Nov 2022 06:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082DB10E76C;
 Fri, 11 Nov 2022 06:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668148713; x=1699684713;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KaWbtnvZ+zxNSi9PVLvfwTNQ0HLob92A+f1nZOAgtrU=;
 b=JuxO6iEkJSdsb9+VBeAriDAujJ6CJyQGmSN5Mq7udWe0eeuq8IFusPqR
 Rz3qQvkXlHqjLRzyd0sL4zYU7tJ+SIvtGu7ucbRLIbYQVui+Wl5/SxCJm
 TlWU6vWpoID2zvePePdE6aPg60BeTZsGbrG3h0UDSz45rnRQzRoL1MJ+z
 rWMtXokb0Hz0kegKcke6q3OjO2z1KcOAX6xs6kHIfjPHFO8CJS+HCL0jP
 RVZIuNuhGJ8u4dURoJaDX3zWCucrTld2x4GbQ2AK18+u9UE8RcjrpzzMf
 5qR6/wNRRFVMeYEk3/Oqpi1AIekXqF51oQ0x1IOQ+wJ/oQF7Zl7WmnN+i g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373667286"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="373667286"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 22:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="882662859"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="882662859"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2022 22:38:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 22:38:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 22:38:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 22:38:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 22:38:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggME3cLaOufVe/9aZhl5vpvJSN6ysTHXKZXGFNRHxa3+Rtg49Rl7rgicfISlupbHLy4eEYmTTrYsRoM5h8PTd1C9jh4qJIGLWbJiccV/F9/LancTbB9eMeLWkFnSOAGH6omZIwhjymUYhnvKtocJpU9NMZjT9LIHGF5wLv2MNMH5CBrhCeiWYz9XEgIqNdyJI+3rUJ/6U4GE/KA0h+Tefzv/tQeKjxJRZrxcTSrJ7zx1YJ2OnGNPRXm5lCC5j0vIA18dH7/XX0kaOZ5liV5mIQf/JPV7yIqRPnuUYFhFNA7xuh7WHdDHmu8OwSsVJNY4FYy5On1ndrdRz3FGr9xDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w/PXhDdgYjxBXCqJWfWznbRscTOmlSyqhsDF2Vqo+A=;
 b=Pgf+F74q10JUL4xkPWuVcGhcEm3pXPjog13dXK2B7SlvQ/E7I3LDwn1YSaOSxBTHNjHOOmJ5/1oRuiaw8UB2m/Xr9r4eTvc7OcUvXOkXPaMy65MerPhZitBdNjFfxWWYUBl9CZE61Q3gXiwMKJpMfBJFqNtnVOIPTvk51NQq/gEnBwFAZ/AC2m8W9fGdw3TPNhSqClG2r5JW4vdPhfenGqgC29d5y09ZhBa1Az0AU91lrKT0qMF5wrDWQ6RXgbEz8MQey9oa/92OoMKfO1h1n9+yQxi+wfr5OsudyIuy1tvSkKW8l6Ru+rtejqO/pvmvbPRPsydDWOrZx32m1yIC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 06:38:26 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%7]) with mapi id 15.20.5791.026; Fri, 11 Nov 2022
 06:38:26 +0000
Message-ID: <9a91b6c1-b4b1-21cf-8f6b-79a27f58d71f@intel.com>
Date: Fri, 11 Nov 2022 14:38:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 11/11] iommufd: Allow iommufd to supply /dev/vfio/vfio
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
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
References: <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <9a47347a-c4b2-e589-c54f-b193d105c4ca@intel.com>
In-Reply-To: <9a47347a-c4b2-e589-c54f-b193d105c4ca@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|CH0PR11MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 186c556f-dfd7-444f-f2a1-08dac3af5660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWHEHkVKPd7jypnz9LF2pyw3tfVkmhFtuBKfLOloQ8D82Hy8QaSPrfGcPOPnfgI2yhsBY2wixbGrH1Cm0EQNp7LAa32DzFtO5Fj6agxli9TSSA8kJ4vfAOngM5KcVHQLT1siHVjlbDBAUfbiuCLNBoSaUrkfhDZ3gAyRRZu1V2kHy0BZts6PbbV4Lsasgib1h811SnN44Cbo2ekG5SoFLwA9MPjjgdlTwBghMh81My60vQyfm6PAywz48Y4qqgNwKUFSwBupNMQ+GaHoRAlziriI9iBtUvemiOYiXWXhzSlzCOCvNZ7aXtuVtLGPVEN94bXfxqnmIxlbYLySgnGwIeqsfgPQ+hN2a9oUnQLWRt86MEWomv4xfb3KmwcfBFN73bjVg3hfE6T/wW/SpnsJcLR1PYYdrVI0We6UlHhrbHrHgoUzU7HnTJ3c5Lok/GYs8dhwRjTJ30kF+WVYwj4Z75vdiyw0MD4RgQW0dDJtEj6J9KlHtKltoC2NXK4vQ0cloqwaJexEyn4jJhu5jgjHu/5kxGf8hTm9SP0w8N8NajuuI1E8pAr9rxmNiIXYkm3IIuW7aCRD5wRVRqg/sOICNuAKCN6dNzxjREzogJFIeT0dSM3a+CSNahQZHzc9Ou/BTOmxy4Sn2asCHe+CVUs9IZevdzgpV4pHazXyaTs1DSwe+chspJusp0qRGI3tem13phZeyan2jiC1FCEo/AKtxY6QDeeTGkfjCXK2qnN+qREyqIXjvlnUFkbGkJx35zcZwUwIaWBPDFmpxVJs/ftp1FyAGz/SHWngSU7ifq6MZMIOk6GheOxqBpC2sAx5DpCq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(4326008)(26005)(8676002)(6512007)(36756003)(66476007)(66556008)(66946007)(41300700001)(31696002)(54906003)(6636002)(110136005)(316002)(86362001)(53546011)(6486002)(6506007)(186003)(478600001)(83380400001)(5660300002)(2906002)(7416002)(7406005)(2616005)(8936002)(82960400001)(6666004)(921005)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW5ObmtsSGs0bnBVZDgrZm9wUC9JN1EyRUdqdWYyY1Rjb2pSTlk3SG90bFNJ?=
 =?utf-8?B?c280MnoyYnNiaDU1eXJ0Y2doYWhhRzIvWVZUeFVKK3NzMlZPQXhaNHRVMEVE?=
 =?utf-8?B?M2FNRXQrSjNIUkdRWHQvTmlKLzl3dkptL1g3aDNLeElwVEFPZ0podkxCU0p6?=
 =?utf-8?B?N3ZJa3J6ckdBMzJVZlFDZkZqRDhKNXo0clZWWDJIZFVmNjBSc010dHZtL0hz?=
 =?utf-8?B?cjd5NTRXYmpPbmdLaTMzcERGSTcvbklOanFiNWdLS1k3OXRpTy9rV0hNM3BR?=
 =?utf-8?B?NitVRWlHRzlJdXZEemZTTXpmalNkSjlJU3gwYkVUZFJaNjFFMXZWQUpLVFpI?=
 =?utf-8?B?RmRwR0c4ZzlzeUhTUVhjTVliWkxEbzZzbUFZYU5td2JBaXVnTnlyYkx6OG1I?=
 =?utf-8?B?ZkFROFV1SjlhRkVjK21pbGI4Wk5FYitrSlZURGQwdVBkOTFZeG9mbkFVUktz?=
 =?utf-8?B?czFWb0xqUDlCdTYzNWpscE56RXZpQVJBanE3L2RqVytYUTREY1pQQnQvQllv?=
 =?utf-8?B?WmVIbHBMM2lZaDJ5RTZYTEVvbTNTeEN4bkFoRXk2MmhRS21mcGs4UmlXTHJH?=
 =?utf-8?B?b1IyTmlFeG83Rmx0MThRL3lreGhzekljOTZFTmQ3b2JYRVVrZTl2WXRTNVRk?=
 =?utf-8?B?ZjRWYWc1dEhMdWxHdzRYaitpcmRoK3p3dzZFb1dLano2VDIrR3lSYU1XVkM3?=
 =?utf-8?B?YmhvME51NGUzM2NIYWRaRjhWODdNdVZhSWpFUWFPZ2lpU0FoeVZLUVRnakhX?=
 =?utf-8?B?MFNSVUc1UFV0Wm1Kd1JZYmNIYU9MZ1YvVlcxSHM1QkJydGNkOVEvM1JKVFE5?=
 =?utf-8?B?bm1GV2RKK2hEbkdRUkZ6WC9Xa2paL3BLbXY5WklGa3BYMk9yMW9LWkQ1dzBk?=
 =?utf-8?B?S3VUUU5qMDI4bmhDK29pWFBRVk1obWpTTjRDRGhWajZnZ0ZtY09NNkpadHZY?=
 =?utf-8?B?ZDBTdWM4ZFl0M2xWZkVVcGhYV3ozZmZxQVcvZkRRcEE1cTFldGtBdFJrUU52?=
 =?utf-8?B?dlQ2NmhOVi8rUXVZNVdLN1FUd042SzE4N2gvd1FQRjVJOUtjRks3b0c0VDBP?=
 =?utf-8?B?QzRubGRXTFpWZXkzWkdEYTlaSncxdXRHamRWOHBCQVpnQnBnNVZaVGVjT0Iw?=
 =?utf-8?B?MkI4clpuV3kzN0d3V2I1VE9sZm1lSjQreU9WYnlUQnZkN1AzaUlUcndBVnJI?=
 =?utf-8?B?OEVzcmFPT1N4WTlrWHRINHF0bGczYW00TWlMaWw4ODRNVEZsTllQVU5vQXBB?=
 =?utf-8?B?M1dLQnlzQnplR2JMWGNwd3RocWNCZW5KVGY1dXlhSzB4Q21GaGg4Z2FyWGFI?=
 =?utf-8?B?TGF5amhWeXdxV0JnbXhnai9hZDMvdGpjN2s0aVVLRjNxS2RlTS84RXVDUXFj?=
 =?utf-8?B?TVJSV1VkV3paVDE2WWtGcWZWZS95K2xhVnl2ZU1Zd200UU0rT1g1N2xqOXdK?=
 =?utf-8?B?dHRnc1hFVFF5RmZWVUdtTzBrcE1yTkRwT3RJTzJVKzZvTkRsVkVlMDRxMlVq?=
 =?utf-8?B?dzVTc3dMOGxydExmQ1Z1MCtBRjhPU29mQTg5RVFnenFWczVXYVBBYXAyZVdR?=
 =?utf-8?B?NHZlQjBSM0w5WTFveWpYWE5CM0FGSzlmVTkwbHBZYk1LY3NMNVNLUWppdlFY?=
 =?utf-8?B?OFJnT2NYVWp1ZDhpT20wNWhiYi9MT245RjVqYzVtVjY4N1dBTysrejMzZlND?=
 =?utf-8?B?d3BUQ3ZDR0VEb2J0aE9HS0hJczh2Uzl5bU9lKzR3RU0waXdibVVWaXJRZHlw?=
 =?utf-8?B?ZTVMSFJIRERKWjVJcmVMOGovMnpzREVQYWRxT24wWHdwMFJoMlVMMGlueTJJ?=
 =?utf-8?B?NzhKUjkwNDU4RXhLemRJUkUxaWhacUxyWWUzWWdFTFI4ZW5EUkhSandzcHJr?=
 =?utf-8?B?bEtGTUoveUdjREMzZzV1ejdyNnBmTk5hZm5GbHViZDFzMkRWajdXcmRXS2JX?=
 =?utf-8?B?REpZNlBOQXM0MzdoTGhkNmdnZGY5a05CMWsyWWJTbmNNOXhSQk9WNHk3bTA5?=
 =?utf-8?B?REcwcWJuT0ZZMkx1QlVUQlVFQ1RFUDRGWmJiWUJIR0NCbmZIY2FEOFRIeVZk?=
 =?utf-8?B?L3QyVEVVcjQvRSs3VGNjUkFJcE1KMzRmcC9UR2JRbEhQaE1vdEhvRWpaUnI4?=
 =?utf-8?Q?FVLcgzHKxqQdaJ+9CFfkqL+ms?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 186c556f-dfd7-444f-f2a1-08dac3af5660
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 06:38:26.6452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jw3NZ2FTx/2mLHAqJdTMYF+gLPzCQIBsNliBk/HfM30xLSKXJmWBQ4esh6sVDiAOk3E+Ply+1GgPCl2CgdotRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
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

On 2022/11/11 12:16, Yi Liu wrote:
> 
> 
> On 2022/11/8 08:52, Jason Gunthorpe wrote:
>> If the VFIO container is compiled out, give a kconfig option for iommufd
>> to provide the miscdev node with the same name and permissions as vfio
>> uses.
>>
>> The compatibility node supports the same ioctls as VFIO and automatically
>> enables the VFIO compatible pinned page accounting mode.
>>
>> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> ---
>>   drivers/iommu/iommufd/Kconfig | 12 ++++++++++++
>>   drivers/iommu/iommufd/main.c  | 36 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/iommu/iommufd/Kconfig b/drivers/iommu/iommufd/Kconfig
>> index 399a2edeaef6de..f387f803dc6f7f 100644
>> --- a/drivers/iommu/iommufd/Kconfig
>> +++ b/drivers/iommu/iommufd/Kconfig
>> @@ -12,6 +12,18 @@ config IOMMUFD
>>         If you don't know what to do here, say N.
>>   if IOMMUFD
>> +config IOMMUFD_VFIO_CONTAINER
>> +    bool "IOMMUFD provides the VFIO container /dev/vfio/vfio"
>> +    depends on VFIO && !VFIO_CONTAINER
>> +    default VFIO && !VFIO_CONTAINER
>> +    help
>> +      IOMMUFD will provide /dev/vfio/vfio instead of VFIO. This relies on
>> +      IOMMUFD providing compatibility emulation to give the same ioctls.
>> +      It provides an option to build a kernel with legacy VFIO components
>> +      removed.
>> +
>> +      Unless testing IOMMUFD say N here.
>> +
>>   config IOMMUFD_TEST
>>       bool "IOMMU Userspace API Test support"
>>       depends on RUNTIME_TESTING_MENU
>> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
>> index ab3fa05f38505d..1eeb326f74f005 100644
>> --- a/drivers/iommu/iommufd/main.c
>> +++ b/drivers/iommu/iommufd/main.c
>> @@ -18,6 +18,7 @@
>>   #include <uapi/linux/iommufd.h>
>>   #include <linux/iommufd.h>
>> +#include "io_pagetable.h"
>>   #include "iommufd_private.h"
>>   #include "iommufd_test.h"
>> @@ -25,6 +26,7 @@ struct iommufd_object_ops {
>>       void (*destroy)(struct iommufd_object *obj);
>>   };
>>   static const struct iommufd_object_ops iommufd_object_ops[];
>> +static struct miscdevice vfio_misc_dev;
>>   struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>>                            size_t size,
>> @@ -170,6 +172,16 @@ static int iommufd_fops_open(struct inode *inode, 
>> struct file *filp)
>>       if (!ictx)
>>           return -ENOMEM;
>> +    /*
>> +     * For compatibility with VFIO when /dev/vfio/vfio is opened we default
>> +     * to the same rlimit accounting as vfio uses.
>> +     */
>> +    if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER) &&
>> +        filp->private_data == &vfio_misc_dev) {
>> +        ictx->account_mode = IOPT_PAGES_ACCOUNT_MM;
>> +        pr_info_once("IOMMUFD is providing /dev/vfio/vfio, not VFIO.\n");
>> +    }
>> +
>>       xa_init_flags(&ictx->objects, XA_FLAGS_ALLOC1 | XA_FLAGS_ACCOUNT);
>>       ictx->file = filp;
>>       filp->private_data = ictx;
>> @@ -395,6 +407,15 @@ static struct miscdevice iommu_misc_dev = {
>>       .mode = 0660,
>>   };
>> +
>> +static struct miscdevice vfio_misc_dev = {
>> +    .minor = VFIO_MINOR,
>> +    .name = "vfio",
>> +    .fops = &iommufd_fops,
>> +    .nodename = "vfio/vfio",
>> +    .mode = 0666,
>> +};
>> +
>>   static int __init iommufd_init(void)
>>   {
>>       int ret;
>> @@ -402,18 +423,33 @@ static int __init iommufd_init(void)
>>       ret = misc_register(&iommu_misc_dev);
>>       if (ret)
>>           return ret;
>> +
>> +    if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)) {
>> +        ret = misc_register(&vfio_misc_dev);
>> +        if (ret)
>> +            goto err_misc;
>> +    }
>>       iommufd_test_init();
>>       return 0;
>> +err_misc:
>> +    misc_deregister(&iommu_misc_dev);
>> +    return ret;
>>   }
>>   static void __exit iommufd_exit(void)
>>   {
>>       iommufd_test_exit();
>> +    if (IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER))
>> +        misc_deregister(&vfio_misc_dev);
>>       misc_deregister(&iommu_misc_dev);
>>   }
>>   module_init(iommufd_init);
>>   module_exit(iommufd_exit);
>> +#if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER)
>> +MODULE_ALIAS_MISCDEV(VFIO_MINOR);
>> +MODULE_ALIAS("devname:vfio/vfio");
> 
> will this line also result in systemd to create this devnodes at boot
> based on the module info even if the IOMMUFD_VFIO_CONTAINER is not
> configured?

stale comment. it's already under if IS_ENABLED(CONFIG_IOMMUFD_VFIO_CONTAINER).

looks good to me.

Reviewed-by: Yi Liu <yi.l.liu@intel.com>

>> +#endif
>>   MODULE_DESCRIPTION("I/O Address Space Management for passthrough 
>> devices");
>>   MODULE_LICENSE("GPL");
> 

-- 
Regards,
Yi Liu
