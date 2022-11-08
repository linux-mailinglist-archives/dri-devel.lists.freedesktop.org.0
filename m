Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5832562180E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ABA10E4A3;
	Tue,  8 Nov 2022 15:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9B710E4B3;
 Tue,  8 Nov 2022 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667920992; x=1699456992;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N6c6OiszTXrzNBcvvSVCABlpDCyEeeVW0tK7X7M3RV8=;
 b=VJp3rRmvW+xMye/RN6k0GUY4T1MpFUzuVSjLs+UcMm3W1fXnuc0zHzck
 HYWfd+AK7Jv1fAToqpVCYClwSYCkYOvK+Ouh+n1e5LEET9ugI/kxzA1Mm
 hbummDtSi+IOTeRQel5PooduQ96HBdoJzP82s8maCxGqF2LiKD4lzPP2R
 VZ8BjbhNnxMN6GmDxid9fuftxj7wOtYcFJwbnKUD0KSnpTDWgLWk4d657
 SSUhuRF0PJxL88Lh05iCcPJE0DKkuDLFbx00QHGktIESzHQEX3NezLAO+
 Q9cEXB1T5kAhJmYgIhkZGOo/+tLsSl2qLYH79JUWmp9+9Lnhf2v47uUYg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="311875616"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="311875616"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 07:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="669580385"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="669580385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 08 Nov 2022 07:17:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 07:17:39 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 07:17:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 07:17:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 07:17:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJNCM3WfIGc/e3p4SUYg7uqA/gSPJRwt+4NZFdHq4vEzGFlpUGcnBnLsoQ8qbNo1KEwQ/YQFgf6xvoTATKX8UF4PxJguMCpKSAoJRSBPlXuLsqcAWW/eWec3KNHhMwneJ/mVXM3yOkc3UlaIZRVux25yiBpqqRfQiJUjO12KFd+StNG3OxRqhVgZk7XMnmqrpwHbPWwNtBaMIyCCUBVQWS2yU3ulQRRiAmwHh+kAUucPvptngnrXWvlin9rK7m1hI1LR/+2/5NtFPS06Pfoh2Cs2m+LZMvAHQ5Ht5HfKDo0x8sdkOAqhxstUh2dFo32lMqqkF0CO2JujvJKvigUKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm+U8dw1UOVdN4aK7gYSWgDoaCKuq6Vqt9ZM1XZnuAA=;
 b=ccd11vKBzItFq4RxozvAmZgCn9KWuKSyJenDgMSmN7aM5oCqRD2L7H++oTOKqr34RrHphfIW+t13Cu1Q4eg8phd1Z/MHvv/Ezia6sh7Fx17Hq4G72/i6H152XhofQoUDqDHAjoPX+klLDZtHgx81/U2Mq+W07b4Y7cIEoLWePnS/5n482rQT4MNAYjg8ighW6ZW+DIqBx7oDrQbRGs3Jj+fqZfx5jSuNcPIqBwzyQrXlf08DHJ6K5277uHRjSHEqlW6+I1+xA8lTDqa8d9gOBTXWEgbbSqLtkCkB8MHOYuG4CVyig1mcLGgRK2gvx01GyLpj/Yfy3Wxe3n3/O7Vdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CH0PR11MB5377.namprd11.prod.outlook.com (2603:10b6:610:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 15:17:37 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::ad39:e00a:a7cb:4ada%7]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 15:17:37 +0000
Message-ID: <9b2bb9f2-fc82-dd01-84ff-c2fe45e1a48a@intel.com>
Date: Tue, 8 Nov 2022 23:18:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y2ofNKmmAIMGYLFK@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0090.apcprd02.prod.outlook.com
 (2603:1096:4:90::30) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|CH0PR11MB5377:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e383e22-4117-4161-cd44-08dac19c5e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xew29/PCWSzuBaWVfVVSz4x/wdXOQKFnsubelNy7C2AuqZK83NgG8nz79/CHPr2VVuUdqSVhy1wBz3T+K5J1pQW+uAdXWi8Or9pHa9YWAYvbdLB/I+Zi48ex/S1wAAIIfbIndwqu0biyPl0b+4I0Gn9eyFj6LPfkD2wxsuZNA4dsYgl36CIaC0lEpRuSQ0/sjvix7qPN+lVhlpZDMrhmUr77BuP1OEL16/i21SL5pzhJRLrvm4lulG+p1qm+KTAcdKcVjqexEtQT1odQJ/Yg5PQcPub74rWN+8zMv0ZKVRsrUD5TyCbSToZ0eCWyvQI2gmKGm5/OWKJsN/s7jeJSq4XBg7pI3pXs6matg0j/Ufh2IAZO3Mm5vkG7qLtbld1U38Dfjyuu08NhFpPyK+GN4PgihoWwLUnKhF7aRwG8MprWBf3OxAiXecXOGyDMIF4vLj7cu5UncUUb3UkbFfY9hNQ5oqincXBvH2UcYWDom9MJDwhvQ9VEtFqe3xi44ggRREmXrT+Lt/LtsGZKxIqoa+jmHGykjgkJEVwiKoSl71YvrBi1/3QdkflvZSY3Nis0OwOEYeRDoFRZbKPhL9oYH+WvdP9NYa8IkhD8yAGSd1JIO8YpTVN74yNcA574US06fGqCiHJ1z3wmVt7plEJHX9nk9OTpCZDWjqXMmJu3cQfEQuOHpzskdhRZUPG3SPJqw7m6m2qqO3sL3cvcwCqw4YOK2MiKU732yXWrIFp83r+DwBCr81AiQzEW7ZknSEJuxJBzZlLhNrE/ZDE8Uce8YkuTgQFIczTAWU+KqqbfgDpWeoxw0aweCEmB6eG1ilebCpwmXwGVRGA4sBfyXXo3FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199015)(82960400001)(38100700002)(36756003)(31696002)(31686004)(86362001)(2906002)(4744005)(6486002)(7406005)(53546011)(2616005)(83380400001)(6666004)(186003)(6512007)(26005)(66556008)(66476007)(6506007)(66946007)(478600001)(5660300002)(8676002)(966005)(110136005)(4326008)(8936002)(316002)(41300700001)(54906003)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDQ2UHp5UnJRQVJBTG5KZDRWQmV2alMwejNuYURHdGVhUVdjeVhWRThaV3lm?=
 =?utf-8?B?VWFnU2ptVjZKTGJTWTRKNDhiNThnYVEwVmYwN3psYnRjWFJsKzg0aXczVEQ2?=
 =?utf-8?B?cWZibmx4a1FnWHRqdmw1VXByR1JxOXgwWFNocjRFT0pTVThKMXFBWVJoaVl0?=
 =?utf-8?B?L3R1SHZOZEh3cUZvOHdsQ1g4SjV2SDQ5YUpMUXpjZWJEYW1wcUhLMktKWlhZ?=
 =?utf-8?B?MGtFcVV3TUF3QU9DaG85MUZHVGV1Rm44MENxUnE5TEUrUDA3M1RxMHM3VW8w?=
 =?utf-8?B?WjM1aXM5c1lSN29KUVNsbEZSWHR4MkFjUWZiRm40TU02Q3hadU9BSnFDQitX?=
 =?utf-8?B?T0x6SWZ4WWJ4WDdNdHdMUFRQRHlQdU9RcjlESzBsT2RrZmlwT202MkhZVDhn?=
 =?utf-8?B?Uis3ZTI1YkIxUDdvOVpTdG03MWs5NDRMTFpFL0xNMTBOdVB6QzdLVzNnUnJG?=
 =?utf-8?B?TW14bkhIMHZ2QUtXZFZDYUpubThBQ2dVc2lLbDduR3FUWFpFc25paUt3aXdy?=
 =?utf-8?B?NVl2S1FkdmRrR0M5UHFiL3BQeEJLcXd4S1ZSMHp5K1piU2gwV2lWRkxMTzli?=
 =?utf-8?B?amZ5U3VuQlhDQlMrWEE2WXJIYm9mZUt3Nm9iTnB0NE5od1VNMFRCRFRBNzNJ?=
 =?utf-8?B?TkFnT2hHNEZlNGdkU0h2RUNFYzN1ZzRuUzNyemFuMVZnS2ZuRm5SalY0T1hO?=
 =?utf-8?B?SkZ1dHFZekFjc3dhdEkxMUJOODg1dTdXUnFHL2t0MnhOY2VZQ0FKVFg0R2hY?=
 =?utf-8?B?bzNBakx2ZG5abWRHY1JPbDljdXp5bzlBdHdlRzlFT0JDTi9LNnFPSThRdEFp?=
 =?utf-8?B?OGRwTXA4UlM3c29hWmtNakgya2k1dFh4RkdJbVN2VTdqYUs2NEFkWC9ZN2R3?=
 =?utf-8?B?SzkraTlteFBVNzNtWkovYmcyRjVWNkZ4Z0tXS2k4c2xzWTBiVGVJODM3bVB3?=
 =?utf-8?B?Wkh3NlozN0YyMzI4SDlIK3Q4WHFielAzWUpUa1FnS2x0OXFGMGdWWm5WV01F?=
 =?utf-8?B?T3ZZamJtaS9NK2VmZTRIK0ZqUUpFUmQvdjRlMytLMy8yYmNhb2NrcVdZV2Jt?=
 =?utf-8?B?NTlLZEJONFdDeHpmT1UrMnViZVVCdUh4N3ZNenpyY3VoZjd3aUVSZ056SzBi?=
 =?utf-8?B?QjdSWEtsMkNlZndWRzZCYkJYaVc2V3NaSExTcGxHbzV0T2tkOGZ4alRZT3lu?=
 =?utf-8?B?ekNmRFVla00vemU1bWlIL2s3bVpYM2xPNG84SHpCL1BQVGxYMW9FdENUR2cw?=
 =?utf-8?B?SUxTbmorNzFuT2lKRzRaelRnUjcvMktzZnZxTnZVaXIrREFITE1oNUJ5Yk9K?=
 =?utf-8?B?eVFLTVIvN1p4QnNPYmwzd0pmVm5RUktqd09pL1lYeU9XSGk2Ym9vZzI5cGUz?=
 =?utf-8?B?SFJKMWR6UTZyNXhGN1lJVmp0UHQ5V3ZCWHVFSWEwdEUwYWN0UTZoODBBZU1F?=
 =?utf-8?B?bi9WV2Npc1pqTVZlLzBOZTkzZmZqUVlnNzUxNnNzdjJ0MlRFemVJbjRFL09v?=
 =?utf-8?B?cEdOWTJYTXFVWlhRV1RGbmJPRFBXa1Nlb0dqVDFYTkF6ZktzUTZEbDNJZkk4?=
 =?utf-8?B?cUlNbHdGbGlNU0ZweUJxaWxVZXZ3TU1HUGVoTDBncldBTUQ1cW9YZTNCZUpZ?=
 =?utf-8?B?OWNNRzVEV291UytJdkdYUldCSjZXejBRem1WOXkrNGx5cDZwVEFTaEdqNGR4?=
 =?utf-8?B?NE55bmh5OU14QkRaanN0bjVEbWlGTzBnUlRmMng3dEs4a3BCNTBvc2hCM1hG?=
 =?utf-8?B?MnAvS3VUTWZSNGtiVW5GZFFQaDNIOTgvUEtIQWNVYis2OGtETlF2Q0R4dXZY?=
 =?utf-8?B?S1FpaGpZNE01MjY4TmRrakdWbFFsZnRReStPTVVrS0J6WkVSSU4wTTZScHF2?=
 =?utf-8?B?TGRCeGJXaktwK08vVW10SXNlZCtCOXd6NUMrcEh2cHdtTjJzNXkzdm9xdk1X?=
 =?utf-8?B?b1dLa1hMUEJCYVplZ2UrVEE4YzAzQkJ5UXBXREVudk9Da0g5cXlFajBRT1gw?=
 =?utf-8?B?TlJFNjZKUnJSOVYzcGJxY2p0V1JRQjJCZHVqWTgrZCtCdzFsdUs0aERGaDBJ?=
 =?utf-8?B?bkFyMzJ0VklpRGJLUTVIVU0yVWNWaVhNb1N1a1BKME1lVU5TT3hEZW5ZL0Yv?=
 =?utf-8?Q?xW8xIXsYy6DeRAM5K7K5Qgvse?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e383e22-4117-4161-cd44-08dac19c5e4a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 15:17:37.1283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/9xgdi73U6Eb7VA8V06DaZWGwaeWoXYY+Z4+0VTCkQSww0xS2enMd7zG+yxjKOU4Hfc0kbbuXuRYGQqQbXSWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5377
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

On 2022/11/8 17:19, Nicolin Chen wrote:
> On Mon, Nov 07, 2022 at 08:52:44PM -0400, Jason Gunthorpe wrote:
> 
>> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd
> [...]
>> v2:
>>   - Rebase to v6.1-rc3, v4 iommufd series
>>   - Fixup comments and commit messages from list remarks
>>   - Fix leaking of the iommufd for mdevs
>>   - New patch to fix vfio modaliases when vfio container is disabled
>>   - Add a dmesg once when the iommufd provided /dev/vfio/vfio is opened
>>     to signal that iommufd is providing this
> 
> I've redone my previous sanity tests. Except those reported bugs,
> things look fine. Once we fix those issues, GVT and other modules
> can run some more stressful tests, I think.

our side is also starting test (gvt, nic passthrough) this version. need to
wait a while for the result.

-- 
Regards,
Yi Liu
