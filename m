Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E924620A76
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 08:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E639A10E22F;
	Tue,  8 Nov 2022 07:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D80310E237;
 Tue,  8 Nov 2022 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667893278; x=1699429278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K5trhJyxzhawoheb+MrXfrarZLJsp8ocMcrZeF2hCno=;
 b=Sf3Y9tLXYhfMmQaiICpjq3NkdfbiwmiL73xEyyxlgkwzepAxRHE7PT/S
 DB3kCu5Jzp8y5f4T6yNzNV3DdQkoOBhqhpn1gkQU6r14FeRcEbKdoMExe
 1fiWCS5xq2/oQJHKdX+g09K0SDtLuj7nv6bjq30xBVzwJx0vmPdPSDn6r
 5Oy72cnwwKHWwOAEBtzHHecE7AcmHy9ZOO0G8yyPtemNG4yEWruGCNr5B
 +b/D8O9DzyvUOvvwVm9NMRkVOpkPi7T9JAFRBsDj9drTZIux960GZFjKi
 1WuKcffzN5eYDTxKIl49xAIjaG+zmWFEWQSQlM8+jIfges1HMYs3f6kJs w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="298145604"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="298145604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 23:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="811146810"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="811146810"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 07 Nov 2022 23:41:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 23:41:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 23:41:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 23:41:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqgNzMcGZsqcxp7F9VwgTnyuWmTSjiYK9gVY6erZvdZ9sc/782BSuJnQNhE5JvSBGDW+M/YPNVLyX2kFYmXG2ngRJgi5nAYtkhG/5QCxT7FY747yF8WuIQfGTXdKUXvmJYINyZxcLDcPrROz3QrtE0nEelXyDoN/6CQ2gqU4PlXemsb+Vjz6f7/JMANztf7v8auC36+T6hh9siB8CdvDtcFuGan+f5r+tLOEx/gthJBvwwiGGLXUxdhkAl3ovNCnGQK9rAmsvpod39SfnV7rrst+O8qcEju8leqkoyrJn/etfxYLge1PnKy0+KEQz2HncsAZxSRejYXA+fMgxWghUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45bqNvxnpe0UC05vAJHfujnb6vN22ep0ya74q/hJx7U=;
 b=k9z+WkqBKGJICQI2oMIILyEsdFlxHQkpEBJ4dcTaF6sp8rHsVkYCzlCP6dFfUkKe6EeHUQpC5CM8sEdtWzL5PcscWC0deXZK0JkaWA1xJpixx2vBgKG4X7Gzo5b8svj/Fv0FAWEkFGWOOs9yMKO/rejdxOAmDWvwaNSgGpDHC5yPJQaIo95b2VfYRVB+P/reOB9c5Xt8rY32CKr5NIvJxnPNmL5Ng8j69SYcARWMlL3rQIxoWHZ50qWhyk/dqsEwiniXtcgrV5MEJXK4npHhREibl6zOPwNkV6c+sG7NCq9M8t4ZDJ8gkldFnropKj3VoW27LoQltMBNiraWuUetYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 07:41:02 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%7]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 07:41:02 +0000
Message-ID: <78d1994d-f6ac-7d1e-7d00-4a98c309bc5b@intel.com>
Date: Tue, 8 Nov 2022 15:41:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:3:17::29) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: f103a80f-4d84-47f5-5088-08dac15c95c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkVD2135236drKujZef2j5ECx8/ujEiIfv0+ps3zY2QqOOeJiGNlLQIfSzz9+wGYGtKgFiydYcc1wTNSw+Ggpt4m9SzljfuGLvtmLchvuqeKV8VQ1LFn3HZHWB+R6UyRlTMAMvQ+tNRX37sV6/hN20bnrfP0wdKQ5uPGR7zszxK4WGBb1uaDHBCa4MuNNNMP4dr6m3XmQc3J+pid7hX9P/l/BD6GRbR0vXurUJ3U9A2KjQ044wpMkSo4/B9ytWAiQUTe71b6eJxej5/RuoA0P4NbqtiFRNL6uhOy/bTmJKjq9hE4xnLzztBJfNvWiBdCMkoNuhu/aNMSzYcBf9zWK7eRrb27VxKnRUr6ZkqBs47PKzw92K9jIrcegG5racEvfPizUUfOYZwi9cAy0RLyXu1xA7dvv9yTmEjPb6fyfEX9STbQw0/5biZ5XljKGGrf3nFRmJqHzIivz0jaZUj/iUxHw9I7Hxg7I+jeO8B3YPIXEX/a+5xV3K0eMrNvMPri3SYuVGGLXzJOKHDU8YIiuk9qMutvX9ATq0XfeCS9VuXZPxJidBwBQUiAUFTxlmzcUVIkvrCKl14jIgD9NBLeEOgkqYfbRbakFgyGDO3TA/YBjf0kRukzKXLL/53LaftRFeWHbced2B6Mlb17wJfRsrdVW4hm+voZuPJ5i0wky+32nFFdsbHb1/63uqOWmWZZN2kFG5LB/yPIMxm0BPjhpWneOdJrCH5LWATUuR8WfU90zQMSRdowmVHvZBhtaKLW6ZXEPBHgViDEfISGumr2X1PzmW6L/Hdq2tQXD3QXriM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199015)(31686004)(31696002)(86362001)(53546011)(2906002)(6486002)(478600001)(82960400001)(38100700002)(36756003)(26005)(83380400001)(6512007)(2616005)(186003)(54906003)(66476007)(4326008)(8676002)(66946007)(66556008)(110136005)(6666004)(316002)(41300700001)(5660300002)(8936002)(6506007)(7406005)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi90OTdoRGN1OVphV2ZyZjZ1endnM0ovdmpEY3gyVnNSYm9kdVMyZmRJWDRF?=
 =?utf-8?B?Tmh1SDQwQ0orb1NEaVJmejBKeUpQRkxWMTEzSjJKSXR3K08yc01yNFg0dUQ5?=
 =?utf-8?B?cjkzcG8rN1lWN0o3WS9Nc0JqUGNCdVg5KzNQS2E4TkZpR1dKU200SmFWMUFu?=
 =?utf-8?B?cHRXcmd2akE5a0t4RmkrNlhJMUg4WEw0UTVQL2I4NXNzeVpoSHUzYXpiYy9x?=
 =?utf-8?B?M09ZVkJOL1cvUm1SWGQ2ZWU3RXVJWlhMcGpBWThZbkJieUtQWEFlU2NqN1Va?=
 =?utf-8?B?bkR0SHJxNXlDaURNVTJnUXV3c1RJSUYwN3N5Y0tVTElXKzdFWnQ2NEFGaG9z?=
 =?utf-8?B?VWQraVZRSDdyTjZZS01ma1NTWWRMVzJ0cHlram04c0RUNHh1N1JwRnZTc2J4?=
 =?utf-8?B?TkxpV0IzMnRwU1pBNG41T2hRWHBmb0djOU1RUzVxMVhmUzdHeEw2eTF5cCth?=
 =?utf-8?B?NXZjNlpPWlE0V1YyV1AwVWQ1cWhYbGhLUm1XTnRYc1VGVVNVK2g0LzB2WUtw?=
 =?utf-8?B?RlBPZnJ2SVpNTzh4VnB2OG9CcituMmlZY1JBWlhSZ1JXbDd4WVhDeFFlUXBv?=
 =?utf-8?B?NW5qRGJIQklGWFF6WDhieGFpOWFQa3h0UXU2VWdkdmc4ODJWeEduMXdJeTht?=
 =?utf-8?B?RlJIVnZpZGt2bU5NQjNqck1BYXdGbk56clNYUkxER0tvem1BTHBLWlMvVU5y?=
 =?utf-8?B?bmVyQ1BMN0dSOUs3cEczTDFKUnpIcDA3UGdpUnAwWDlxS005dGR5RWNQSTA3?=
 =?utf-8?B?WnpTMWdEUTUyMDJCWnlNdGNsTTF4WnJKZGc2WXFjclQwdHJlTTNUbEp4WE93?=
 =?utf-8?B?dkx3aUcxTFpNUUN6a2dzcWtXblRWY25CYk40ZGd5aTBHWkp2KzhoRzRvZEd2?=
 =?utf-8?B?WjJLejNrL0JCclVIbTF4U0FNRkVrSkJqZ3FEY3lVd3hJVGxhenprSE5WTWpx?=
 =?utf-8?B?cFA3c2toS2x6NUxNdmplYXlLZ2ROaW14a0w2NVVwYmp0T1pTdWpSVUU0YlVl?=
 =?utf-8?B?VktpZWV3SFEzUmcxMnhWTVVOWjlxaHBqT1g3U2M3bmR4WUMvMTZPcGs4VzFI?=
 =?utf-8?B?Y0MvRFZ1KytUb0pZbmJTOTRmc0F1dVpUV3hNK2FSNnFQSk1raEhVM1dkQnov?=
 =?utf-8?B?ZzBtWUxUS2hxaUpLZEJmckN4WFVDS0VkaWN2andYUmUydFRGdFV2eU1wS3pr?=
 =?utf-8?B?WG5QVDBJUWM2Q1lyVk1GOTZ1c1F6ZXllbUZISmUrTDFWZXE3bk1XNXEwZytI?=
 =?utf-8?B?R2RiZlZGR2M1RDE3WHdnUU03ZzJrcnRmeXp0bS94WlZhZVNIdzhyM3dWdGNs?=
 =?utf-8?B?eWt6Q01zZ3hvV24zZXM3RUZjQVR0eGRzYy8xbUNnN1V2RXUvbHlhOGpCNFls?=
 =?utf-8?B?ZjVDejdLNm04bmt4YjZWQUoyaUhobHNZWTlCM3NiSk9xVHhpMkRxMWVaRGUy?=
 =?utf-8?B?dzBFRXE1bHJCeDYzanY3OTNMZEhtRXMrQy9KR0VocktDVTJYak1panJvMnRn?=
 =?utf-8?B?RUU5dWtFRDQwSXJCektGS1l0eHRYODc2RGs4OU1GL1FwaEt5NTN4Sit3aWZJ?=
 =?utf-8?B?NEpTL3BBS2FXbFlRZjdxWUdrVWlOdnpXYmtkUitudzZMWVFpN2xNL0J1dUlG?=
 =?utf-8?B?MTVYY1RWbm1XSTBqbFM5OG9VdkxKeW5naks5MFZjMVhoQ3A4NFgwUmpyRHpX?=
 =?utf-8?B?UzViZzFLUnAwdTAzSGlQRTNRcVRPc0ordHY4U3FmcC94d09YWDRiYXl5QTk4?=
 =?utf-8?B?R2tNNm5PbjZjaTlPbWUzYmNFZnJoVm1QY05CL3pwVThMb2pBZDlqMnpXTUlv?=
 =?utf-8?B?Nk1UYm1IUFVQWkQ0T0wxWnNsVUtnV2FnN2Y0U1kvN2gwaWwxRDdieVZuWDZS?=
 =?utf-8?B?WEY2TzZqYUluY0cvTXphNVo5R3crb3BkWTJlb2FqSWE4dDZyTHdVNDQyUVl4?=
 =?utf-8?B?MEVKNVV1RXdVVFJUYzM5UnlKWnV6RFNKOUdIVW5HZ0lQRU42QldXRXQ5UU9x?=
 =?utf-8?B?VGtWb2srWUR1MjlqL1M4RVV6SmNrUWVwd3lMODd1TWx1QTd3c1l4WlQ4QzVi?=
 =?utf-8?B?VkRSaVZuTnJCd3I3dU9ZQXhKNThON1JvVElDYXJiOVZXK1B1RE5CZElENFE4?=
 =?utf-8?Q?ng3w8vLtszJHkC0apaP1aDM0j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f103a80f-4d84-47f5-5088-08dac15c95c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 07:41:02.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5XwFuZ1qc+mRY9U9a9KpO6f7tdh6CDnufRtxgr2E1WQCWW96oJlU1WC1RSsGKqky58L6gvhuL72K6rSO67HAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil
 Pasic <pasic@linux.ibm.com>, iommu@lists.linux.dev,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/11/8 14:10, Nicolin Chen wrote:
> On Mon, Nov 07, 2022 at 08:52:51PM -0400, Jason Gunthorpe wrote:
> 
>> @@ -795,6 +800,10 @@ static int vfio_device_first_open(struct vfio_device *device)
>>   		ret = vfio_group_use_container(device->group);
>>   		if (ret)
>>   			goto err_module_put;
>> +	} else if (device->group->iommufd) {
>> +		ret = vfio_iommufd_bind(device, device->group->iommufd);
> 
> Here we check device->group->iommufd...
> 
>> +		if (ret)
>> +			goto err_module_put;
>>   	}
>>   
>>   	device->kvm = device->group->kvm;
>> @@ -812,6 +821,7 @@ static int vfio_device_first_open(struct vfio_device *device)
>>   	device->kvm = NULL;
>>   	if (device->group->container)
>>   		vfio_group_unuse_container(device->group);
>> +	vfio_iommufd_unbind(device);
> 
> ...yet, missing here, which could result in kernel oops.
> 
> Should probably add something similar:
> +	if (device->group->iommufd)
> +		vfio_iommufd_unbind(device);
> 
> Or should check !vdev->iommufd_device inside the ->unbind.

this check was in prior version, but removed in this version. any
special reason? Jason?

> 
>>   err_module_put:
>>   	mutex_unlock(&device->group->group_lock);
>>   	module_put(device->dev->driver->owner);
>> @@ -830,6 +840,7 @@ static void vfio_device_last_close(struct vfio_device *device)
>>   	device->kvm = NULL;
>>   	if (device->group->container)
>>   		vfio_group_unuse_container(device->group);
>> +	vfio_iommufd_unbind(device);
> 
> Ditto

-- 
Regards,
Yi Liu
