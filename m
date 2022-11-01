Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB34D614B33
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3079310E0CE;
	Tue,  1 Nov 2022 12:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423F110E0CE;
 Tue,  1 Nov 2022 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667307257; x=1698843257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fB36qCV3cY5H7WcV3IQHCDLGJPd/2B8jhZ2tzVCfBm4=;
 b=UaK4yL1LQ5xSyOz5R9IxEvp9otPzYLwKsk07mAqc7pLUqX2XkJlook+w
 pNPdZY5gcl3fK+0S4IjbRIQa4b04tFT2VbDUwRvM62KzmtvCJl02P7PdW
 xREqlm9JphkpgMzxeR69e2pIlpsuczXZ5+PMzatp5VstEqRGlb447NpFC
 4Ktv2aeGw3+PCUmwM+DAonpUXcMyQVQdHEiDcAL+AHizmstnZ+e6+vQ7a
 JEquBPGoorN2vQk5USMdQsxhFyWAhvZpxROuoeolBf4BiUSgvQIOqr3y6
 KRiF9VZ0K2BQ/M+F+xpLMAqOgAnrakAIwKpka+TLqA09yCsZp1//su7Go g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310222889"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="310222889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 05:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776483393"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="776483393"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2022 05:54:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 05:54:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 05:54:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 05:54:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTWd2BIHuQYp3fyzbv5YT8mHR3TtyRcMBFGVMSJsTJd6/9JmnFr1ehZsl8vUWDQgmubJx6ufN1AqBwezBIKG9xYNjM0tGgaCF1MvCVWRZr5Hn11BOCYSG+rcRaOpDwUPlRQ2ZiNuMeYQ/2cfCnM0SXZ1kCQF5HhDojKpXxWz2V48USFvpMm2K2eN42l/A4mJj6MN+526JDXegGGemMuBOfzQAc1O8RLpeerI6FYJ87fWOVJ5rk/rpuMyyRLHLENMS/D3VYjMDdLUPK81oHt4gnBkm21bewdObsf9HyOR7QE3KchNxC93XY6oM9P3QR+T3zFdrUf2MsFjntPYldxbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37xtDzB7uH66z0bS89k0KHV6XAPsHVBgLiAJBPusFmw=;
 b=gXcChk6BCNb5i2egUFl7CO+syafFQjFeeBbFfsLp5NahBb0h5oczM3DJla8xLigbnQTCMfGtuknKmd1BMcI9Tc8qCX4dTYpaA1P0rQtXat06OAvGoT5tg0Ts//hBVIcUwd8rHh946r2QOVurfroM9hsPn6SrvC+nfiUcxI58j80WZqYUhnDC6CR0OywH1NmuSAadOtyhacQQLY8IftoCaZwNlrvcG8Y+FRissRG0Q8oPDN3aObPBHzzg9KhDRs6nNuvXlavRjl1gUmm9nDWBLTCSv3k2uHqDbyRhtTO+IGM8F70vAEpm9BAmSQIdCcvEVYinReBUD7tCwS2JT5bjPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 12:54:14 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 12:54:14 +0000
Message-ID: <3347e780-bb68-0c51-d92b-a0022a6cb087@intel.com>
Date: Tue, 1 Nov 2022 20:54:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
 <Y1+9IB+DI9v+nD0P@nvidia.com>
 <d8a0352e-9e1d-5b01-7616-dccc73a172a6@intel.com>
 <Y2BZHZXJwxF5C4a8@nvidia.com>
 <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
 <Y2CetBTVV1EkvDkg@Asurada-Nvidia>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y2CetBTVV1EkvDkg@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 7247623e-4850-4cff-e926-08dabc082d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PU/jqca/ooXdciRSlAVix8H5ZEBdet5pXix/BkTSWuu6eCdRI/RYBnHY0ThjZjr5B5ZY88Lw/ClFZR4Tc9UazqFDYwDuPzR27XKdOwZ3XOaCLhSfPUEmvW6BfFQ26eWf9+sQjsRD1z4l5uuQIIxdxVLnPROtSaVdsEKR9BhnOjQrnM8DfQ8YPAREH+G8vTUB5rxM5YSPDWRikaOO7aAqs/zLcfHg6Qs8bj9LsF9gBDrbuP7/CekZXlb6yc6dPFhau07kJQevaBNB3cul0mQen7lPfjbSrLLpQrD04QtRpwArdjTONLbCXxYdRKSrkvTLKc7ugGwTwgQg5KCYeOLsVgzfiHHbJBQIjQ+229wobw2bvdtygWoGwPrmQRt2B/GgiGQvgqLNy1uHd/ZT91I2RWCAuNGaDTnnfZiTq14Ul+brcYfvCm63q6fvDJvlb8N34Za4+KPDoh2Sjx0GOsoId8GZljj6wQ3hHB08IE3C+e6snGDXSL9v2GnBTN7RfCBsPREgPvYpwBsubM64NwCgX4AcSqJfqHDVbIIT5KtnAYVum/NYp4GOdpahyk3CiJTEaiiWXsnCpt/sAKtyqkahndDQi5irQ0dd1LamprhblxxZCY/Y1JRr4xTigUH+6OQ3aOujRFvAxGHDJFL7Bx/dbicAarc/BjhIsZDN4oMqbmxqgnEjLlrw+TbHjpVt9BlzFPHKPf+ucz5fO1iafLDk9zz50F1eInRUr8XI4NpmQe6I+iRJ07FtGakapis09aSR+i89NLm7fq3vvIstpTepPw69bVinF18DJtdxbcvBDGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(2906002)(110136005)(6506007)(66946007)(6512007)(26005)(66476007)(54906003)(53546011)(66556008)(36756003)(82960400001)(6666004)(4326008)(316002)(8676002)(41300700001)(38100700002)(31696002)(83380400001)(5660300002)(86362001)(8936002)(7406005)(7416002)(186003)(6486002)(2616005)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhBTVdIV3lhcHNtYkJ6RGxpR0szd3o2MVZ4R2k2aTJvd3A4OUxmTWpidU0z?=
 =?utf-8?B?MEFmbTUvaEg5ZzB3RE1rSmlGd1FlUEwyVmVSeFlGMERoNTFGSU5BTWN1S3FX?=
 =?utf-8?B?RFZCbEN2MElvM2dZMkxTNFJJQnI5bWlsRXlYaVJHWXhQM2lGYjBieTV6MUNl?=
 =?utf-8?B?WWhsemQ0VHpFYS9iRndQV3Fqb2RoNWpKc0hOWTNMWklESXVlV0tmR1N0N0FJ?=
 =?utf-8?B?b0grL0dlNG8zTWEwbW5MVlg3MzBMcThXYXFhcHVVUGV2dmdKaGo5UituMDN2?=
 =?utf-8?B?cVRrZzQvSVVvWXZ2OXBrM1hjeUJBanFvVW1nUndzeEVFRkxyVi95aDFnYlFC?=
 =?utf-8?B?Tlh5SHB4VnVCWFpnRFgzNXhjQklZV2xWZDNTY1dnMjBKQzJ3dXJyT0NSVjJp?=
 =?utf-8?B?bVlHMzZvcHlUMkV6MklxaTVPbjYyTTJ0R2F0Q0o1MnEwOWdiNy9rNW5nRTZM?=
 =?utf-8?B?U2c0QTFYTGpoOVp6MkkzU3JQN3pIV05SVUR6a1NEdlZXRzBSSTA2d3RYV0lk?=
 =?utf-8?B?bExieTRkcHpZKzl0cXliKzVQYkgxQ1hFQUlpd0xKNzIxa0k0dW05dEJVbUZk?=
 =?utf-8?B?cGNZdTNvUHl2by9ZOGsxWnE4V2s3VzRXQ1pMZ3hDVUl2YnkxUXdkZGNsMWxw?=
 =?utf-8?B?U1RkaWx5Vm5raTZCaUllK1VFL1ZtSng0R29KTXpkclVMc2VnUm5qSWptckRu?=
 =?utf-8?B?R0oyVjlHQWZBeTM0U0cxVDQycEdHdjFPdExhUUtyeWhvSVdObHFEOEoycUww?=
 =?utf-8?B?VTZvd1RiYlNZOEl3dkpTaENJOHBkYWVCMTBodXBHVzBkdHpWMHpsWmRHanBw?=
 =?utf-8?B?c0ZjNWdqM2pLblVGaVRrL1FmS0FHbXpydWg3UjUrcnJZNjROb1lIWWFwSGRj?=
 =?utf-8?B?NHRjSWxXTHpYTnhUaWVDbGlGT1ZueGtlcUtYZmZJZkFBK3Bja1dUZEpGS2s2?=
 =?utf-8?B?WGRxNDROOVRqcXRjbWErdzYvYWhvcHZ1L1JBdSs5M3lMQjdLcTNlYUNIa0ZV?=
 =?utf-8?B?Q0dOR1hHS0pmcWdEMk1yM0RLZVUzMmxFVDAxT0tQQXpNc3RWRksvczZrS2ho?=
 =?utf-8?B?d1VKbTg2RkR0Zm5KYjB0RXhqVk9DbXBDZk5zSmRSM3RJcXlUWGMyU1FBYk9Q?=
 =?utf-8?B?NjAwV0ZhMjdzQWxiNm1MSUZna0ZycWQ2NnV4STJDZjVCMm9GejZ5Ti9KTHdz?=
 =?utf-8?B?cnZHNFp3TEtIOTNHWFp5MVM1YkVxa2w1dVpvSnZJNjRVMkxYNER1STV2blI5?=
 =?utf-8?B?UC9tNkhFK251Y2xvdEEvUGVjUm9McUpCK0tTU2lBMERSSHdqdE9yYnBYczN5?=
 =?utf-8?B?VDJ5ZFhreXF2R0lZbngwVTZTKy8zcy9qOXZSdHJHWlc0SDVydGdPY2dwSWc1?=
 =?utf-8?B?ZERETmNGeTgrV3M3cDZOeUJ6dDJwQkpua0JVU05SY0hJdzdjbkVEZzZjdFQz?=
 =?utf-8?B?T2daZFVjWW82Y2dQRmQwN1p4QllYbEFHQzhLbmxsTmRaZnpleW04SXAwMXZ4?=
 =?utf-8?B?akZlb3lvWXRMRTRUazlXVWRzZUJGd3hiNzF0M3BRRTU2MDVDV1NoQTBIa3Rh?=
 =?utf-8?B?RXFlYyt6VWNRa2drM2QzT1FKaGNLcU8zTmk3aFBua2luckN6YUszOFd2cURj?=
 =?utf-8?B?WWJoemgrOTk4MVhEVjN6bkZabTVpdk9Jang3Z2JzcTFOOWZrMmNBa0lRSS9R?=
 =?utf-8?B?WDYvR2FkM0UrbUM1SVlRQ3FpelZMeVEyTUlkTkRVU2FjajNyOEJvOGxhRlk2?=
 =?utf-8?B?R1VuWFpQblJOWWxQakpzWUFOdzZHajNPSEJaVE55ckJFbEJYTXNUTGR5L3Ex?=
 =?utf-8?B?dlVyeUJVU3QvS25ZZFlOc1UxTlF1NnQ0MnlSUHJNUmlGemdVcDVMcXg4YnV5?=
 =?utf-8?B?dEFZSkl4akNzMHZkU3ZZNkhLQlFFWlBuaDMxNmF6Ly9ZMUZtQlVYR0JLSmhE?=
 =?utf-8?B?UnBTQ2svR3pNR2VtUjNzeDJ0a2ZXRWY2MTh3cGhDTjVocFBLVUw1YjRYSWVi?=
 =?utf-8?B?NEVENDV5TmxSbkRYUStzMHdyMjVlZWtROWRmdzFQcVd6OCt5b1VTYzA3RGxR?=
 =?utf-8?B?c0gvei9SR2tZTXVicHgwVXFPeGdLYjZNY09zb3B5SEJ6NVNocjcrUExlN1o1?=
 =?utf-8?Q?MB3DnFfyI/lmXiiKWv/7pHFC/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7247623e-4850-4cff-e926-08dabc082d64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:54:13.7912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUUU93TdBlwzghBjlxXm0GnKzrkXpFyz6ElVdSkcdlpxKBiov052nAz2BRAnQCKgAdzpYLh57jUi9g+tbf1YEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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

On 2022/11/1 12:21, Nicolin Chen wrote:
> On Tue, Nov 01, 2022 at 11:04:38AM +0800, Yi Liu wrote:
>> On 2022/11/1 07:24, Jason Gunthorpe wrote:
>>> On Mon, Oct 31, 2022 at 08:25:39PM +0800, Yi Liu wrote:
>>>>> There is something wrong with the test suite that it isn't covering
>>>>> the above, I'm going to look into that today.
>>>>
>>>> sounds to be the cause. I didn't see any significant change in vfio_main.c
>>>> that may fail gvt. So should the iommufd changes. Then we will re-run the
>>>> test after your update.:-)
>>>
>>> I updated the github with all the changes made so far, it is worth
>>> trying again!
>>
>> gvt is still failing with below call trace in host side. vfio_unpin_pages()
>> is still in problem. Any idea on it?
> 
>> [  206.464318] WARNING: CPU: 9 PID: 3362 at
>> drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
> 
> Judging from this WARNING, and since gvt (mdev) needs pin_pages(),
> I assume this might be a fix, though Jason's latest change for the
> iova_alignment seems to be added for CONFIG_IOMMUFD_TEST only.
> 
> ------
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 72a289c5f8c9..185075528d5e 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -120,6 +120,7 @@ static void vfio_emulated_unmap(void *data, unsigned long iova,
>   }
>   
>   static const struct iommufd_access_ops vfio_user_ops = {
> +	.needs_pin_pages = 1,
>   	.unmap = vfio_emulated_unmap,
>   };
>   
> ------
> 
> Perhaps you can try it first to see if we can test the rest part of
> the routine for now, till Jason acks tomorrow.

fyi. it works so far. :-)

-- 
Regards,
Yi Liu
