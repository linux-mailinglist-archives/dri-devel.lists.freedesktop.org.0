Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9355614379
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 04:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CDA10E0AC;
	Tue,  1 Nov 2022 03:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45F10E05A;
 Tue,  1 Nov 2022 03:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667271863; x=1698807863;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/5KYaFUlq4+06Ehap6oxYSHUXsgQZ9ODPEofIk7Cyo4=;
 b=LXCIY7I4P6XsK94lhAt0HrExcPF1qDwLZlORCsaQUde0NKik2dve8Je3
 Dvvm+wnKOygB+vtrsfBB4aXExV2KtWQMfmDIpoo0A/NAJvt7IMIiY1/Qa
 6i54ITrK3SXqEI96L8ezZPwy4Z/0yLLn8scz+ezhTUFEy+BfCewpEt5HZ
 GZPXGDZ+eoW4/OtdCW0JCEhpmmM0YYRzk/utOxtqmo30JrTftxrsoKNjX
 y9fXJbhXcdJv+MI+j2p5djoVwAGTQa6muhNFae5qE1KvSLRiMZ0WhRyiu
 qQDrlqJQZiopWmelZh5stsv0eVF/cZ2vby7yDE8x9zfmGiaLwVdlItQoz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="306670031"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="306670031"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 20:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="759054062"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="759054062"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 31 Oct 2022 20:04:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 20:04:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 20:04:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 20:04:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVph5hYMAnstTg3Uwaz6r3hEFvoOQcZP3obCYEibD1zafCv4ytINhTlH0loeRDdTywgQiSFvSPGhJufr5p11MHtH+vwxvcUvIVab7Mi/l6JuhiL2ndbogDoXNauj3ViLJ1CQqxe3Zza51Bp7DKo0GajL226WkkNG2MXXRfay081ObgLDmxlMVZdyC1yF4dTYDVZcOIg1RUs9/1S6PpecwLqzcPTlsxdtWgWXGAbJ18MtIxsoHvikYYIERbwmBqdmC11GUUloiiArrWb9flK8vHQA4aO66VHjZs7K0ia8hmVEl0wIn9t1ftT1ndp0AOCsw0qwrUyoCKZvxNGrCkXjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZzcpQDxoKTZ7q91eBXmxHepq0vYXFbU79Ig5+zowFI=;
 b=d4JUzK2QCGcDVscMaXXeAloiy9Jz7jV7IUIL6d9jFpjGxlk56br7r+YqE7kGEbcLJT88Tjwwni3ktjYTyNQvdjw56jMiU2e/m8DzRBhSWPbmFPW4Otnmdav6kjL91baNCvAqzjxYINe6LfrSZCDMqaAtlF5Pisd/PKVXxpcbCxGX02ns8m10122k33C8N+xCKRAX/EIlFJ8OLzIEYZUZl2QxmMSfm2tWWDlMEe1gDZuoqUtJ/SNCl83TlW/Z9fIjEMGWigYdpS/KL9DMaowx7DnPbd5hn9fCgOn3jj6Qf3lId1HwNkhDkSSiEIISueFw3Fk+ob4bWO7pke3kyVpubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Tue, 1 Nov
 2022 03:04:15 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 03:04:15 +0000
Message-ID: <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
Date: Tue, 1 Nov 2022 11:04:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
 <Y1+9IB+DI9v+nD0P@nvidia.com>
 <d8a0352e-9e1d-5b01-7616-dccc73a172a6@intel.com>
 <Y2BZHZXJwxF5C4a8@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y2BZHZXJwxF5C4a8@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5ec9d6-a5c3-412b-5329-08dabbb5c219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 03vuDS3IIghcvi88hP9NkvT5+IJURAiaI+lHAH6PFUXrJmpdLWqARoi9tmHicEV0mMnuExtKZS6ftX8vgWRJdgatdAO9td6aSuU5ki5fitaA08MrCek8wBOrl0/AXHHU1YBBHvAXiGS8XnyCo7UZEvDHw7SUZvE2wqYHIylyr3zqwkqqYY9DZTH5iwOIVGoWWZhrnkAJVvBiQFhmU/jzk04NtXcxK/FNANLbYzzd+Jn+rQMOTeHKIwXOI8bIpi7w9Uk9lQOMaggIc06RcHkW0DMKPE+KXofHK/zi7G2FZvd7CylCwnZITeeiFYlEXf4TuaBBmov+UmphJsT3KtueLfPFQNCzc0bRvjCwQg8YcXsn8UTsYyJ0foFJASEL7xTGMlUGL9NvbhN/J4cPxojtnfsLQueR3M/ZV1VI7l1tXEPSAP55GAFgZIT6wDzphXqkKrqVfmP5ozDEkZM4FOLU++FF5kM1ANsinMT2gmIfg7c64ZRdQReP+lZvZXvy+e/E2GdjbBm0qX3/9p7rmOO93JPTP8RcxvjTGVYsqHP/1rO/OnAqQKIHNJcNBGakRjbgGMJKWU8DQBkMMM0YtsnWgyTkl/K2GIPyiLfW2rqd4lU7YeL1LjL7Cm2Uz6VLMyE7pPtjPhc3jncugUpcA52nzwfHF6VvdRu4QfOZLVO5OIQrValxKbveVtUvep4dOl55ZJPm8b6ycDA2jN5ackreKWafY/j+6XcOLWLC1B08HtVjdUbuK0H3vxl3XfUIGMWdoxCD2RJlH9Mvab1Dvk/R8jfPSwO7hVRqnNzhRa6Jo+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(83380400001)(36756003)(38100700002)(31696002)(82960400001)(86362001)(30864003)(2906002)(6666004)(6486002)(478600001)(6916009)(66556008)(316002)(8676002)(8936002)(41300700001)(54906003)(4326008)(45080400002)(66476007)(66946007)(7416002)(6506007)(5660300002)(2616005)(7406005)(53546011)(186003)(6512007)(26005)(31686004)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmo5cVU5RFZVakNPWVczbzJqV1lhakgzNU5MZUx6TzJrMWt3U0dOdXpLUDJL?=
 =?utf-8?B?MGEwbisra0dEeDQ2ZmNYMXJDZUh2VWxER3JUTlhMODN3S0ovYlpHTGJnVHpI?=
 =?utf-8?B?N0xTZ2V5Q0tZaFIrcUdtT1IwTm9OaG5JN0N6T0Z3Q041eDhoUXZYWTFwcFBK?=
 =?utf-8?B?OG8xQ0xGTXZrTEpFeC8rVzhhYzh1VUtJWmVITUVpU2QvNTNSdUR1cVFibGlr?=
 =?utf-8?B?azFzazNveUlQMEt2SWlzSXl3STVqcTFUVGo5bEdLRS9wQ0FYYXU1MVh0Y2NG?=
 =?utf-8?B?aDN2RFFTallsOXRJeWtvcEdFMStLZmt4MHZmb0E2d2RGOUhJVFIrZ1FnSEl4?=
 =?utf-8?B?dEhZU3N0R1d0M2V6V1JLNktaRDQ3WVNoRnU3dXV4aWVJWUhZeGRKUHB5SDd4?=
 =?utf-8?B?ZmNHSVF0SzNlUm5GRlJHSkJLbkpJdXhPbzRWWFVhbTRMTXBwS29jalo1WDBN?=
 =?utf-8?B?TndFNlo2N0RMNGQ2eW1zZnRnU0ZxRS9SaCs2RjkxRGhsZFhXbnpJTVF0aGlk?=
 =?utf-8?B?b3AxcGhyb1BFSUtDZURoREdlRHVGVnJrQm1nakJ6MXFYWTZsMUIwNW5SbzVH?=
 =?utf-8?B?U21GeTJzaHdLdkdzQ2xtWGhVUHAzMXNWSGk4cHEzaVhnb2F3QURieXpJb2Fj?=
 =?utf-8?B?dEY1R2hUWTVialRhUDRxMFZyOEpTRWhyRytBTTlwMlBid1JHbmQ4TTB3VktK?=
 =?utf-8?B?UFhxVU9SRFNoMFJUeDVLWHlvZUJQRlZ5Z3RMN0t6ZDVtc1VKUk93TDRRc01x?=
 =?utf-8?B?cUVmbmk3S2VXN2Jsd0NkOFlWWXNUS1VzaGxXTkdlVElEMUoxN2NTVHBqbEpv?=
 =?utf-8?B?SmpUWWxwRjJnNDhsQzRUandKZmZXaXRrdjQvZ1ZsdWxEQm5OcTZoWXV6cUJQ?=
 =?utf-8?B?OThBbWdtNEw3S0ZFOHhtYnlkWXFiZVB4azM2WlNvbzE4eDRwWkRHU1d0bnRz?=
 =?utf-8?B?MExoRE11aTUvRXhPMDBZazB6TzhUQnFmOVNKTWFzY2t3VFJKTDFPTXdGMEM1?=
 =?utf-8?B?SUN1T1NrZjI0V2VlSHpISlhpdWJuS1ZGRmkySWl1Z2ZqK25UbllDNE5WNTlU?=
 =?utf-8?B?SGhQdWF4dnkvcVMxc0FDaDc2K2xLSHkzWkd5KzZwNHNsdlIvRlphdXNJL0Zo?=
 =?utf-8?B?aW9MQTZLN1JSOG5HOGlSdFB3NjBFRnhCMm16UmJxQ3pZWDB1dnViOUMwYzdL?=
 =?utf-8?B?NHB0dERsWXVsd2NxbWNoN2ZxcXhqdmZ2dDV5UnlqUTRVeS9MSXQxZ3ZIVEpZ?=
 =?utf-8?B?bjdlUkc2UHBZTU5iNzhCSmROMUp1OVFQSE9iT1dNYkMyTkNIRFR4SVQ5a1lx?=
 =?utf-8?B?WGNYeVVTbDM5ZTBwcWExQXBrTmVKeFRubituLy92TkJidHp5UGRxZW1xOFFr?=
 =?utf-8?B?aDhGdnptS1A0NmloSGxTSFVGZHdQcm9aK2RicXVKaVhwNVZsQ1Q2MTJBZkpE?=
 =?utf-8?B?T0M0UzRhS0NHTUpvUkdSZlJXWEtWS1FhZDZzcFFrSkNTanJNeVZUMUtjYjkv?=
 =?utf-8?B?bTd2UEo4NkIvM3MvOUpDdytTd0xXQitUb3pubnVMVE9vZ0hMZmNRRVFjNG1u?=
 =?utf-8?B?TkEzYUhvRVhSSWlHbEE1UThSRDIxOTZOeDJMSkVvUTIxa3JqbzV3MnR3Vkhw?=
 =?utf-8?B?VEsxTy9ZTGlIdytEd0dDVXZBTzIyZGxlRnhxR2JrclZzbU8vTFFEUWI4d1ho?=
 =?utf-8?B?UW1rRjJsMVVUYlZjQU9xME14S3dCYnhMajdnMHhpSkdXNFlHb3RjNmtVbVpH?=
 =?utf-8?B?dENBRHRxL3ZhMXZIL01RUFlKSFhHdG5YUVAzNUN6bmxkbEF5RzhsVW9GTllF?=
 =?utf-8?B?U0tGR3ZaTE5LS2Uvb3lTeDVMNi96QjVHQ3JPbW95SC91cDdyU1hyOVAyRHZU?=
 =?utf-8?B?Z2cyc0NyNVdxUW9Wekk5WWgrbkhlVlgxZVc0R0dUZU5SYTd5UWRBWEV6Z2ho?=
 =?utf-8?B?RWRkdUlEY3JQUnJEWlRDc25ZdHVOS2RVdnIxTGVuc3FZaVd3OXFhdjlrN2dz?=
 =?utf-8?B?L2drSkZyVjN3UHNZamRPMTJzc0k1ZTVsWkJFU29wOHNEOFhVNDJvZlh1cEpD?=
 =?utf-8?B?elJZcWR6M2d5RExRc2o5a2oxS3BjNGMwTHRGZTdQTFRRUUVxdW9UY0RDT1lX?=
 =?utf-8?Q?CNeMdUYJq6iux8rWesjgEkVFb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5ec9d6-a5c3-412b-5329-08dabbb5c219
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 03:04:15.4373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXDVFjBPKwaY/XCuh24PKuUGPiFlz4UhiGMzvk9VDrc0guk/H65r1fCoJujaB185OUR2zF3hBPTGnsv7EXLVCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
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
 Nicolin Chen <nicolinc@nvidia.com>,
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

On 2022/11/1 07:24, Jason Gunthorpe wrote:
> On Mon, Oct 31, 2022 at 08:25:39PM +0800, Yi Liu wrote:
>>> There is something wrong with the test suite that it isn't covering
>>> the above, I'm going to look into that today.
>>
>> sounds to be the cause. I didn't see any significant change in vfio_main.c
>> that may fail gvt. So should the iommufd changes. Then we will re-run the
>> test after your update.:-)
> 
> I updated the github with all the changes made so far, it is worth
> trying again!

gvt is still failing with below call trace in host side. vfio_unpin_pages()
is still in problem. Any idea on it?


[  206.464107] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.464167] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.464168] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.464171] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.464172] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.464173] Call Trace:
[  206.464174]  <TASK>
[  206.464175]  vfio_unpin_pages+0x49/0x60
[  206.464177]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.464187]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.464196]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.464229]  vfs_write+0xc6/0x3b0
[  206.464296] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.464301] R10: 00000000008b66a8 R11: 0000000000000293 R12: 
00000000008b66a8
[  206.464318] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.464357]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.464377] RSP: 0018:ffffc0b1c301fb90 EFLAGS: 00010283
[  206.464381] R10: 00000000000b66b4 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.464382] R13: 000000010d0f6000 R14: ffffc0b1c301fc58 R15: 
ffff9d7a8d400000
[  206.464384] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.464385] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.464386] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.464387] Call Trace:
[  206.464388]  <TASK>
[  206.464389]  ? x86_emulate_instruction+0x4cd/0x890 [kvm]
[  206.464415]  vfio_pin_pages+0x5e/0xb0
[  206.464417]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.464434]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.464505] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.464509] R10: 00000000008b66b0 R11: 0000000000000293 R12: 
00000000008b66b0
[  206.464513]  </TASK>
[  206.464519] ------------[ cut here ]------------
[  206.464558]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.464572] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.464578] RSP: 0018:ffffc0b1c301fbc0 EFLAGS: 00010246
[  206.464583] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.464584] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.464586] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.464588] Call Trace:
[  206.464588]  <TASK>
[  206.464590]  vfio_unpin_pages+0x49/0x60
[  206.464591]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.464610]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.464640]  vfio_device_fops_write+0x1f/0x40
[  206.464681] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.464690]  </TASK>
[  206.464702] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.464742]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.464756] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.464767] R13: 000000010d0f6000 R14: ffffc0b1c301fbd0 R15: 
ffff9d7a8d400000
[  206.464771] Call Trace:
[  206.464772]  <TASK>
[  206.464773]  ? writeback_registers+0x56/0xb0 [kvm]
[  206.464802]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.464811]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.464819]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.464826]  ? __kvm_io_bus_write+0x2d/0xc0 [kvm]
[  206.464854]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.464879]  ? intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.464902]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.464910] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.464912] R10: 00000000008b66b8 R11: 0000000000000293 R12: 
00000000008b66b8
[  206.464922] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.464960]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.464974] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.464985] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.464987] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.464988] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.464989] Call Trace:
[  206.464990]  <TASK>
[  206.464992]  vfio_unpin_pages+0x49/0x60
[  206.464993]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.465003]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.465012]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.465019]  ? __kvm_io_bus_write+0x2d/0xc0 [kvm]
[  206.465039]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.465047]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.465054]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.465061]  vfio_device_fops_write+0x1f/0x40
[  206.465063]  vfs_write+0xc6/0x3b0
[  206.465065]  ? intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.465081]  __x64_sys_pwrite64+0x96/0xc0
[  206.465100] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.465106] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.465159]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.465173] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.465175] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.465184] R13: 000000010d0f6000 R14: ffffc0b1c301fb68 R15: 
ffff9d7a8d400000
[  206.465186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.465188] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.465189] Call Trace:
[  206.465191]  ? segmented_write.isra.0+0x5e/0x90 [kvm]
[  206.465218]  vfio_pin_pages+0x5e/0xb0
[  206.465220]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.465230]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.465239]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.465247]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.465255]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.465261]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.465269]  vfio_device_fops_write+0x1f/0x40
[  206.465270]  vfs_write+0xc6/0x3b0
[  206.465272]  ? intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.465280]  ? __fget_light+0xa7/0x130
[  206.465285]  __x64_sys_pwrite64+0x96/0xc0
[  206.465320]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.465336] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.465338] R10: 00000000008b66c0 R11: 0000000000000293 R12: 
00000000008b66c0
[  206.465347] ------------[ cut here ]------------
[  206.465386]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.465400] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.465405] RSP: 0018:ffffc0b1c301fad0 EFLAGS: 00010246
[  206.465410] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.465412] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.465413] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.465414] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.465415] Call Trace:
[  206.465416]  <TASK>
[  206.465417]  vfio_unpin_pages+0x49/0x60
[  206.465419]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.465429]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.465438]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.465446]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.465461]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.465481]  __x64_sys_pwrite64+0x96/0xc0
[  206.465522]  ? do_syscall_64+0x69/0x90
[  206.465530] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.465538] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.465590]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.465604] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.465613] R10: 00000000000b66cc R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.465615] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.465617] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.465618] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.465619] Call Trace:
[  206.465620]  <TASK>
[  206.465621]  ? x86_emulate_instruction+0x4cd/0x890 [kvm]
[  206.465649]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.465672]  ? vmx_vcpu_put+0x122/0x210 [kvm_intel]
[  206.465702]  vfs_write+0xc6/0x3b0
[  206.465753]  ? do_syscall_64+0x69/0x90
[  206.465760] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.465762] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.465769]  </TASK>
[  206.465775] ------------[ cut here ]------------
[  206.465814]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.465828] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.465834] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.465835] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.465836] RBP: ffffc0b1c301fb10 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.465837] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.465838] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.465839] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.465841] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.465842] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.465843] Call Trace:
[  206.465844]  <TASK>
[  206.465845]  vfio_unpin_pages+0x49/0x60
[  206.465847]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.465857]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.465872]  ? vmx_vcpu_put+0x122/0x210 [kvm_intel]
[  206.465902]  vfio_device_fops_write+0x1f/0x40
[  206.465913]  ? __fget_light+0xa7/0x130
[  206.465957]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.465965] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.465982] ------------[ cut here ]------------
[  206.465986] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.466051] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.466052] Call Trace:
[  206.466052]  <TASK>
[  206.466083]  vfio_pin_pages+0x5e/0xb0
[  206.466085]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.466094]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.466102]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.466129]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.466165]  __x64_sys_pwrite64+0x96/0xc0
[  206.466176] RIP: 0033:0x7fcbbebcacbf
[  206.466187]  </TASK>
[  206.466193] ------------[ cut here ]------------
[  206.466194] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.466236]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.466250] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.466261] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.466268]  vfio_unpin_pages+0x49/0x60
[  206.466279]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.466288]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.466296]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.466304]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.466311]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.466322]  ? kvm_vcpu_ioctl+0x120/0x6f0 [kvm]
[  206.466342]  ? __fget_light+0xa7/0x130
[  206.466344]  __x64_sys_pwrite64+0x96/0xc0
[  206.466347]  do_syscall_64+0x59/0x90
[  206.466351]  ? do_syscall_64+0x69/0x90
[  206.466358] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.466387] ------------[ cut here ]------------
[  206.466427]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.466441] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.466443] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.466456] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.466504]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.466510]  ? restore_fpregs_from_fpstate+0x47/0xc0
[  206.466514]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.466521]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.466528]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.466537]  vfs_write+0xc6/0x3b0
[  206.466539]  ? vfio_device_fops_write+0x1f/0x40
[  206.466567]  __x64_sys_pwrite64+0x96/0xc0
[  206.466570]  do_syscall_64+0x59/0x90
[  206.466572]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.466574]  ? do_syscall_64+0x69/0x90
[  206.466575]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.466585] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.466599] ------------[ cut here ]------------
[  206.466600] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.466639]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.466653] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.466666] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.466672]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.466682]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.466691]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.466697]  ? restore_fpregs_from_fpstate+0x47/0xc0
[  206.466701]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.466709]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.466716]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.466723]  vfio_device_fops_write+0x1f/0x40
[  206.466724]  vfs_write+0xc6/0x3b0
[  206.466727]  ? vfio_device_fops_write+0x1f/0x40
[  206.466728]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.466752]  ? __fget_light+0xa7/0x130
[  206.466755]  __x64_sys_pwrite64+0x96/0xc0
[  206.466758]  do_syscall_64+0x59/0x90
[  206.466765]  ? do_syscall_64+0x69/0x90
[  206.466772] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.466794] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.466833]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.466847] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.466862] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.466883]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.466891]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.466899]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.466912]  vfio_device_fops_write+0x1f/0x40
[  206.466914]  vfs_write+0xc6/0x3b0
[  206.466918]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.466942]  ? __fget_light+0xa7/0x130
[  206.466945]  __x64_sys_pwrite64+0x96/0xc0
[  206.466947]  do_syscall_64+0x59/0x90
[  206.466949]  ? do_syscall_64+0x69/0x90
[  206.466958] RIP: 0033:0x7fcbbebcacbf
[  206.466963] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.466977] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.467057]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.467066]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.467074]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.467082]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.467089]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.467096]  vfio_device_fops_write+0x1f/0x40
[  206.467097]  vfs_write+0xc6/0x3b0
[  206.467099]  ? vfio_device_fops_write+0x1f/0x40
[  206.467101]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.467125]  ? __fget_light+0xa7/0x130
[  206.467128]  __x64_sys_pwrite64+0x96/0xc0
[  206.467131]  do_syscall_64+0x59/0x90
[  206.467132]  ? do_syscall_64+0x69/0x90
[  206.467134]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.467136]  ? do_syscall_64+0x69/0x90
[  206.467137]  ? do_syscall_64+0x69/0x90
[  206.467138]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.467142] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.467204]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.467218] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.467219] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.467220] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.467231] R10: 00000000000b66ec R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.467265]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.467273]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.467280]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.467287]  vfio_device_fops_write+0x1f/0x40
[  206.467288]  vfs_write+0xc6/0x3b0
[  206.467322]  ? __fget_light+0xa7/0x130
[  206.467324]  __x64_sys_pwrite64+0x96/0xc0
[  206.467327]  do_syscall_64+0x59/0x90
[  206.467329]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.467331]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.467333]  ? do_syscall_64+0x69/0x90
[  206.467335]  ? do_syscall_64+0x69/0x90
[  206.467336]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.467338]  ? do_syscall_64+0x69/0x90
[  206.467340]  ? do_syscall_64+0x69/0x90
[  206.467345] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.467363] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.467442]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.467450]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.467458]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.467466]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.467473]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.467480]  vfio_device_fops_write+0x1f/0x40
[  206.467482]  vfs_write+0xc6/0x3b0
[  206.467484]  ? intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.467491]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.467515]  ? __fget_light+0xa7/0x130
[  206.467518]  __x64_sys_pwrite64+0x96/0xc0
[  206.467520]  do_syscall_64+0x59/0x90
[  206.467522]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.467525]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.467533]  ? do_syscall_64+0x69/0x90
[  206.467542] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.467563] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.467678]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.467686]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.467693]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.467700]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.467707]  vfio_device_fops_write+0x1f/0x40
[  206.467709]  vfs_write+0xc6/0x3b0
[  206.467731]  ? __fget_light+0xa7/0x130
[  206.467733]  __x64_sys_pwrite64+0x96/0xc0
[  206.467736]  do_syscall_64+0x59/0x90
[  206.467738]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.467740]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.467742]  ? do_syscall_64+0x69/0x90
[  206.467744]  ? do_syscall_64+0x69/0x90
[  206.467748] RIP: 0033:0x7fcbbebcacbf
[  206.467751] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.467765] ------------[ cut here ]------------
[  206.467768] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.467847]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.467856]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.467864]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.467872]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.467879]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.467886]  vfio_device_fops_write+0x1f/0x40
[  206.467887]  vfs_write+0xc6/0x3b0
[  206.467890]  ? kvm_vcpu_ioctl+0x120/0x6f0 [kvm]
[  206.467910]  ? __fget_light+0xa7/0x130
[  206.467916]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.467922]  ? do_syscall_64+0x69/0x90
[  206.467925]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.467927] RIP: 0033:0x7fcbbebcacbf
[  206.467928] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.467933] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.467990]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.468003] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.468007] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.468098]  vfio_device_fops_write+0x1f/0x40
[  206.468122]  ? __fget_light+0xa7/0x130
[  206.468124]  ? __fget_light+0xa7/0x130
[  206.468126]  __x64_sys_pwrite64+0x96/0xc0
[  206.468129]  do_syscall_64+0x59/0x90
[  206.468130]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.468133]  ? do_syscall_64+0x69/0x90
[  206.468137]  ? do_syscall_64+0x69/0x90
[  206.468141] RIP: 0033:0x7fcbbebcacbf
[  206.468143] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.468145] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.468146] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.468147] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.468197]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.468211] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.468212] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.468215] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.468229] Call Trace:
[  206.468283]  vfs_write+0xc6/0x3b0
[  206.468312]  do_syscall_64+0x59/0x90
[  206.468313]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.468315]  ? do_syscall_64+0x69/0x90
[  206.468318]  ? do_syscall_64+0x69/0x90
[  206.468321]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.468323] RIP: 0033:0x7fcbbebcacbf
[  206.468324] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.468327] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.468328] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.468329] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.468336] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.468387]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.468404] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.468407] RSP: 0018:ffffc0b1c301fb50 EFLAGS: 00010283
[  206.468410] RBP: ffffc0b1c301fbb8 R08: 0000000000000001 R09: 
ffffc0b1c301fc18
[  206.468416] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.468532]  ? do_syscall_64+0x69/0x90
[  206.468538] RIP: 0033:0x7fcbbebcacbf
[  206.468539] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.468540] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.468542] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.468544] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.468545] R10: 00000000008b6700 R11: 0000000000000293 R12: 
00000000008b6700
[  206.468546] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.468549]  </TASK>
[  206.468549] ---[ end trace 0000000000000000 ]---
[  206.468557] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.468676]  vfio_device_fops_write+0x1f/0x40
[  206.468723] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.468724] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.468725] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.468726] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.468727] R10: 00000000008b6700 R11: 0000000000000293 R12: 
00000000008b6700
[  206.468728] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.468731]  </TASK>
[  206.468731] ---[ end trace 0000000000000000 ]---
[  206.468732] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.468742] ------------[ cut here ]------------
[  206.468743] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.468746] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.468808] R13: 000000010d0f6000 R14: ffffc0b1c301fba0 R15: 
ffff9d7a8d400000
[  206.468813] Call Trace:
[  206.468825]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.468921]  do_syscall_64+0x59/0x90
[  206.468938] RIP: 0033:0x7fcbbebcacbf
[  206.468942] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.468944] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.468945] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.468946] R10: 00000000008b6708 R11: 0000000000000293 R12: 
00000000008b6708
[  206.468947] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.468949]  </TASK>
[  206.468950] ---[ end trace 0000000000000000 ]---
[  206.468951] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.468955] ------------[ cut here ]------------
[  206.468956] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.468958] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.469023] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.469046]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.469140]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.469157] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.469158] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.469159] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.469161] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.469164]  </TASK>
[  206.469165] ---[ end trace 0000000000000000 ]---
[  206.469166] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.469176] ------------[ cut here ]------------
[  206.469179] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.469311]  ? __kvm_io_bus_write+0x2d/0xc0 [kvm]
[  206.469360]  __x64_sys_pwrite64+0x96/0xc0
[  206.469387] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.469391] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.469392] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.469394] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.469397]  </TASK>
[  206.469398] ---[ end trace 0000000000000000 ]---
[  206.469399] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.469403] ------------[ cut here ]------------
[  206.469404] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.469443]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.469457] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.469463] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.469466] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.469468] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.469486]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.469537]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.469569]  ? do_syscall_64+0x69/0x90
[  206.469579] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.469581] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.469582] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.469583] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.469584] R10: 00000000008b6710 R11: 0000000000000293 R12: 
00000000008b6710
[  206.469585] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.469587]  </TASK>
[  206.469588] ---[ end trace 0000000000000000 ]---
[  206.469589] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.469601] ------------[ cut here ]------------
[  206.469602] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.469605] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.469664] RBP: ffffc0b1c301fb10 R08: 0000000000000001 R09: 
ffffc0b1c301fb70
[  206.469669] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.469673]  ? x86_emulate_instruction+0x4cd/0x890 [kvm]
[  206.469772]  ? do_syscall_64+0x69/0x90
[  206.469782] RIP: 0033:0x7fcbbebcacbf
[  206.469785] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.469787] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.469788] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.469789] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.469790] R10: 00000000008b6718 R11: 0000000000000293 R12: 
00000000008b6718
[  206.469791] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.469793]  </TASK>
[  206.469794] ---[ end trace 0000000000000000 ]---
[  206.469795] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.469799] ------------[ cut here ]------------
[  206.469839]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.469853] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.469854] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.469858] RSP: 0018:ffffc0b1c301fad8 EFLAGS: 00010246
[  206.469861] RBP: ffffc0b1c301fb18 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.469897]  ? restore_fpregs_from_fpstate+0x47/0xc0
[  206.469939]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.469941]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.469943]  ? do_syscall_64+0x69/0x90
[  206.469945]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.469947]  ? do_syscall_64+0x69/0x90
[  206.469948]  ? do_syscall_64+0x69/0x90
[  206.469949]  ? do_syscall_64+0x69/0x90
[  206.469950]  ? do_syscall_64+0x69/0x90
[  206.469952]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.469954] RIP: 0033:0x7fcbbebcacbf
[  206.469955] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.469957] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.469958] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.469959] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.469960] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.469961] R10: 00000000008b6718 R11: 0000000000000293 R12: 
00000000008b6718
[  206.469962] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.469965]  </TASK>
[  206.469966] ---[ end trace 0000000000000000 ]---
[  206.469967] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.469977] ------------[ cut here ]------------
[  206.469978] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.470017]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.470035] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.470043] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.470161]  do_syscall_64+0x59/0x90
[  206.470172]  ? do_syscall_64+0x69/0x90
[  206.470175]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.470177] RIP: 0033:0x7fcbbebcacbf
[  206.470179] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.470180] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.470182] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.470183] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.470184] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.470185] R10: 00000000008b6720 R11: 0000000000000293 R12: 
00000000008b6720
[  206.470186] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.470188]  </TASK>
[  206.470189] ---[ end trace 0000000000000000 ]---
[  206.470190] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.470194] ------------[ cut here ]------------
[  206.470237]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.470251] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.470257] RSP: 0018:ffffc0b1c301fb30 EFLAGS: 00010246
[  206.470258] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.470262] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.470281]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.470359]  ? do_syscall_64+0x69/0x90
[  206.470367] RIP: 0033:0x7fcbbebcacbf
[  206.470368] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.470369] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.470371] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.470372] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.470373] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.470374] R10: 00000000008b6720 R11: 0000000000000293 R12: 
00000000008b6720
[  206.470375] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.470398] ------------[ cut here ]------------
[  206.470438]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.470457] RSP: 0018:ffffc0b1c301fb38 EFLAGS: 00010283
[  206.470458] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.470460] RBP: ffffc0b1c301fba0 R08: 0000000000000001 R09: 
ffffc0b1c301fc00
[  206.470465] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.470470]  vfio_pin_pages+0x5e/0xb0
[  206.470526]  ? __fget_light+0xa7/0x130
[  206.470547] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.470549] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.470550] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.470551] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.470552] R10: 00000000008b6728 R11: 0000000000000293 R12: 
00000000008b6728
[  206.470553] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.470556]  </TASK>
[  206.470556] ---[ end trace 0000000000000000 ]---
[  206.470557] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.470561] ------------[ cut here ]------------
[  206.470562] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.470601]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.470616] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.470619] RSP: 0018:ffffc0b1c301fb68 EFLAGS: 00010246
[  206.470623] RBP: ffffc0b1c301fba8 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.470627] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.470629] Call Trace:
[  206.470652]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.470698]  ? do_syscall_64+0x69/0x90
[  206.470711] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.470715] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.470716] R10: 00000000008b6728 R11: 0000000000000293 R12: 
00000000008b6728
[  206.470717] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.470719]  </TASK>
[  206.470720] ---[ end trace 0000000000000000 ]---
[  206.470721] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.470731] ------------[ cut here ]------------
[  206.470732] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.470734] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.470843]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.470878]  ? do_syscall_64+0x69/0x90
[  206.470886] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.470887] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.470888] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.470889] R10: 00000000008b6730 R11: 0000000000000293 R12: 
00000000008b6730
[  206.470890] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.470893]  </TASK>
[  206.470893] ---[ end trace 0000000000000000 ]---
[  206.470894] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.470898] ------------[ cut here ]------------
[  206.470899] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.470901] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.470967] Call Trace:
[  206.470996]  ? vmx_vcpu_put+0x122/0x210 [kvm_intel]
[  206.471040]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.471052] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.471054] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.471055] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.471056] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.471057] R10: 00000000008b6730 R11: 0000000000000293 R12: 
00000000008b6730
[  206.471058] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.471060]  </TASK>
[  206.471061] ---[ end trace 0000000000000000 ]---
[  206.471062] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.471072] ------------[ cut here ]------------
[  206.471073] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.471075] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.471136] R10: 00000000000b673c R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.471141] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.471207]  ? do_syscall_64+0x69/0x90
[  206.471216] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.471218] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.471219] R10: 00000000008b6738 R11: 0000000000000293 R12: 
00000000008b6738
[  206.471220] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.471224]  </TASK>
[  206.471225] ---[ end trace 0000000000000000 ]---
[  206.471227] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.471231] ------------[ cut here ]------------
[  206.471232] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.471234] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.471293] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.471296] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.471299] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.471314]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.471367]  ? do_syscall_64+0x69/0x90
[  206.471376] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.471379] R10: 00000000008b6738 R11: 0000000000000293 R12: 
00000000008b6738
[  206.471380] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.471383]  </TASK>
[  206.471384] ---[ end trace 0000000000000000 ]---
[  206.471385] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.471396] ------------[ cut here ]------------
[  206.471397] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.471399] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.471464] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.471500]  vfio_pin_pages+0x5e/0xb0
[  206.471519]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.471568]  vfio_device_fops_write+0x1f/0x40
[  206.471594] RIP: 0033:0x7fcbbebcacbf
[  206.471600] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.471605]  </TASK>
[  206.471606] ---[ end trace 0000000000000000 ]---
[  206.471606] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.471611] ------------[ cut here ]------------
[  206.471614] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.471671] RSP: 0018:ffffc0b1c301fb60 EFLAGS: 00010246
[  206.471673] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.471677] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.471681] Call Trace:
[  206.471684]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.471730]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.471754]  vfs_write+0xc6/0x3b0
[  206.471762]  ? __fget_light+0xa7/0x130
[  206.471781] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.471791] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.471801] ------------[ cut here ]------------
[  206.471804] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.471867] R13: 000000010d0f6000 R14: ffffc0b1c301fb70 R15: 
ffff9d7a8d400000
[  206.471903]  vfio_pin_pages+0x5e/0xb0
[  206.471921]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.471956]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.471978]  __x64_sys_pwrite64+0x96/0xc0
[  206.471988]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.472004] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.472019] ------------[ cut here ]------------
[  206.472022] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.472080] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.472081] RBP: ffffc0b1c301fb18 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.472085] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.472091]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.472116]  ? __kvm_io_bus_write+0x2d/0xc0 [kvm]
[  206.472152]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.472166]  __x64_sys_pwrite64+0x96/0xc0
[  206.472173]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.472179]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.472194] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.472213] ------------[ cut here ]------------
[  206.472256]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.472270] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.472272] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.472273] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.472275] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.472279] RBP: ffffc0b1c301fb68 R08: 0000000000000001 R09: 
ffffc0b1c301fbc8
[  206.472285] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.472315]  vfio_pin_pages+0x5e/0xb0
[  206.472333]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.472356]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.472370]  __x64_sys_pwrite64+0x96/0xc0
[  206.472379]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.472392] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.472405] ------------[ cut here ]------------
[  206.472406] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.472408] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.472468] RBP: ffffc0b1c301fb70 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.472472] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.472475] Call Trace:
[  206.472478]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.472513]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.472531]  ? __fget_light+0xa7/0x130
[  206.472537]  ? fire_user_return_notifiers+0x42/0x70
[  206.472554] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.472564] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.472575] ------------[ cut here ]------------
[  206.472576] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.472616]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.472630] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.472632] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.472632] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.472634] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.472642] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.472648]  ? kvm_pmu_trigger_event+0x59/0x250 [kvm]
[  206.472696]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.472738]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.472749]  ? kvm_vcpu_ioctl+0x120/0x6f0 [kvm]
[  206.472788]  ? do_syscall_64+0x69/0x90
[  206.472797] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.472804]  </TASK>
[  206.472804] ---[ end trace 0000000000000000 ]---
[  206.472805] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.472809] ------------[ cut here ]------------
[  206.472810] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.472812] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.472875] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.472882]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.472907]  ? __kvm_io_bus_write+0x2d/0xc0 [kvm]
[  206.472983]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.473001] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.473002] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.473003] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.473004] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.473005] R10: 00000000008b6758 R11: 0000000000000293 R12: 
00000000008b6758
[  206.473006] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.473009]  </TASK>
[  206.473010] ---[ end trace 0000000000000000 ]---
[  206.473011] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.473021] ------------[ cut here ]------------
[  206.473022] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.473024] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.473087] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.473091] Call Trace:
[  206.473118]  ? kvm_arch_vcpu_ioctl_run+0x3c4/0x1850 [kvm]
[  206.473171]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.473191] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.473196]  </TASK>
[  206.473197] ---[ end trace 0000000000000000 ]---
[  206.473198] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.473202] ------------[ cut here ]------------
[  206.473203] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.473205] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.473265] RSP: 0018:ffffc0b1c301fbc0 EFLAGS: 00010246
[  206.473269] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.473273] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.473278]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.473344]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.473365]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.473382] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.473401] ------------[ cut here ]------------
[  206.473402] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.473405] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.473442]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.473461] RSP: 0018:ffffc0b1c301fb20 EFLAGS: 00010283
[  206.473463] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.473468] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.473476]  vfio_pin_pages+0x5e/0xb0
[  206.473494]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.473536]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.473551]  vfs_write+0xc6/0x3b0
[  206.473583]  __x64_sys_pwrite64+0x96/0xc0
[  206.473592]  ? do_syscall_64+0x69/0x90
[  206.473603] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.473616] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.473653]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.473674] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.473675] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.473680] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.473686]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.473711]  ? kvm_arch_vcpu_put+0x1a9/0x200 [kvm]
[  206.473762]  vfs_write+0xc6/0x3b0
[  206.473793]  __x64_sys_pwrite64+0x96/0xc0
[  206.473800]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.473812] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.473833] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.473870]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.473884] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.473886] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.473887] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.473888] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.473894] R10: 00000000000b6774 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.473900] Call Trace:
[  206.473928]  vfio_pin_pages+0x5e/0xb0
[  206.473947]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.473965]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.473982]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.474011]  __x64_sys_pwrite64+0x96/0xc0
[  206.474022] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.474031] ---[ end trace 0000000000000000 ]---
[  206.474075]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.474089] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.474091] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.474092] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.474093] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.474095] RSP: 0018:ffffc0b1c301fbc0 EFLAGS: 00010246
[  206.474096] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.474097] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.474098] RBP: ffffc0b1c301fc00 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.474099] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.474100] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.474103] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.474104] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.474120]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.474152]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.474167]  vfs_write+0xc6/0x3b0
[  206.474196]  ? __fget_light+0xa7/0x130
[  206.474205]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.474209] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.474212] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.474281]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.474295] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.474296] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.474297] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.474299] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.474306] R13: 000000010d0f6000 R14: ffffc0b1c301fbd0 R15: 
ffff9d7a8d400000
[  206.474323]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.474349]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.474386]  ? intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.474400]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.474406]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.474413] RIP: 0033:0x7fcbbebcacbf
[  206.474416] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.474421] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.474470]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.474485] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.474486] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.474487] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.474489] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.474493] RBP: ffffc0b1c301fb78 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.474498] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.474499] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.474522]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.474554]  vfio_device_fops_write+0x1f/0x40
[  206.474577]  ? intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.474590]  do_syscall_64+0x59/0x90
[  206.474597]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.474604] RIP: 0033:0x7fcbbebcacbf
[  206.474607] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.474611] R10: 00000000008b6778 R11: 0000000000000293 R12: 
00000000008b6778
[  206.474668]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.474682] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.474683] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.474684] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.474686] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.474687] RSP: 0018:ffffc0b1c301fb20 EFLAGS: 00010283
[  206.474689] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.474690] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.474691] RBP: ffffc0b1c301fb88 R08: 0000000000000001 R09: 
ffffc0b1c301fbe8
[  206.474696] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.474700]  ? writeback_registers+0x56/0xb0 [kvm]
[  206.474774]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.474824]  vfs_write+0xc6/0x3b0
[  206.474834]  ? __fget_light+0xa7/0x130
[  206.474841]  ? fire_user_return_notifiers+0x42/0x70
[  206.474849]  ? do_syscall_64+0x69/0x90
[  206.474854] RIP: 0033:0x7fcbbebcacbf
[  206.474856] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.474864]  </TASK>
[  206.474873] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.474925] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.474935] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.474936] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.474939] Call Trace:
[  206.474943]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.474989]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.475012]  vfs_write+0xc6/0x3b0
[  206.475021]  ? __fget_light+0xa7/0x130
[  206.475028]  ? fire_user_return_notifiers+0x42/0x70
[  206.475036]  ? do_syscall_64+0x69/0x90
[  206.475042] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.475104]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.475118] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.475120] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.475121] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.475123] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.475124] RSP: 0018:ffffc0b1c301fb90 EFLAGS: 00010283
[  206.475125] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.475126] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.475127] RBP: ffffc0b1c301fbf8 R08: 0000000000000001 R09: 
ffffc0b1c301fc58
[  206.475128] R10: 00000000000b678c R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.475129] R13: 000000010d0f6000 R14: ffffc0b1c301fc58 R15: 
ffff9d7a8d400000
[  206.475134] Call Trace:
[  206.475158]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.475182]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.475204]  vfs_write+0xc6/0x3b0
[  206.475215]  do_syscall_64+0x59/0x90
[  206.475220] RIP: 0033:0x7fcbbebcacbf
[  206.475224] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.475239] ------------[ cut here ]------------
[  206.475279]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.475294] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.475295] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.475296] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.475298] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.475299] RSP: 0018:ffffc0b1c301fbc0 EFLAGS: 00010246
[  206.475300] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.475301] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.475302] RBP: ffffc0b1c301fc00 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.475304] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.475307] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.475323]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.475354]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.475368]  ? __fget_light+0xa7/0x130
[  206.475376]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.475381] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.475386] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.475442]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.475456] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.475458] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.475458] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.475460] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.475467] R13: 000000010d0f6000 R14: ffffc0b1c301fbb0 R15: 
ffff9d7a8d400000
[  206.475474]  vfio_pin_pages+0x5e/0xb0
[  206.475533]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.475549]  vfs_write+0xc6/0x3b0
[  206.475581]  do_syscall_64+0x59/0x90
[  206.475587]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.475594] RIP: 0033:0x7fcbbebcacbf
[  206.475597] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.475599] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.475650]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.475664] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.475665] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.475666] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.475668] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.475669] RSP: 0018:ffffc0b1c301fb18 EFLAGS: 00010246
[  206.475672] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.475676] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.475679] Call Trace:
[  206.475693]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.475743]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.475762]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.475795]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.475802]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.475807] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.475827] ------------[ cut here ]------------
[  206.475867]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.475881] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.475883] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.475884] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.475885] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.475887] RSP: 0018:ffffc0b1c301fad0 EFLAGS: 00010283
[  206.475888] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.475889] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.475890] RBP: ffffc0b1c301fb38 R08: 0000000000000001 R09: 
ffffc0b1c301fb98
[  206.475894] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.475918]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.475942]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.475957]  vfs_write+0xc6/0x3b0
[  206.476003]  ? __fget_light+0xa7/0x130
[  206.476012]  ? do_syscall_64+0x69/0x90
[  206.476020]  ? do_syscall_64+0x69/0x90
[  206.476026] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.476034]  </TASK>
[  206.476043] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.476079]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.476103] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.476106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.476131]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.476162]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.476193]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.476233]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.476242] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.476303]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.476317] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.476319] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.476320] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.476321] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.476323] RSP: 0018:ffffc0b1c301fb90 EFLAGS: 00010283
[  206.476324] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.476325] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.476326] RBP: ffffc0b1c301fbf8 R08: 0000000000000001 R09: 
ffffc0b1c301fc58
[  206.476327] R10: 00000000000b67a4 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.476333] Call Trace:
[  206.476346]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.476376]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.476389]  ? do_syscall_64+0x69/0x90
[  206.476395]  __x64_sys_pwrite64+0x96/0xc0
[  206.476403] RIP: 0033:0x7fcbbebcacbf
[  206.476405] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.476409] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.476458]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.476472] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.476474] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.476475] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.476476] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.476478] RSP: 0018:ffffc0b1c301fbc0 EFLAGS: 00010246
[  206.476479] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.476480] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.476481] RBP: ffffc0b1c301fc00 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.476484] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.476490]  vfio_unpin_pages+0x49/0x60
[  206.476491]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.476533]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.476547]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.476555]  ? do_syscall_64+0x69/0x90
[  206.476561] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.476563] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.476566] R10: 00000000008b67a0 R11: 0000000000000293 R12: 
00000000008b67a0
[  206.476582] ------------[ cut here ]------------
[  206.476621]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.476635] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.476636] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.476637] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.476639] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.476640] RSP: 0018:ffffc0b1c301faf0 EFLAGS: 00010283
[  206.476645] R13: 000000010d0f6000 R14: ffffc0b1c301fbb8 R15: 
ffff9d7a8d400000
[  206.476670]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.476708]  vfs_write+0xc6/0x3b0
[  206.476723]  ? do_syscall_64+0x69/0x90
[  206.476730]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.476734]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.476739] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.476742] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.476748] ---[ end trace 0000000000000000 ]---
[  206.476792]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.476806] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.476807] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.476808] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.476810] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.476811] RSP: 0018:ffffc0b1c301fb20 EFLAGS: 00010246
[  206.476814] RBP: ffffc0b1c301fb60 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.476825]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.476835]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.476850]  ? vmx_vcpu_put+0x122/0x210 [kvm_intel]
[  206.476890]  ? __fget_light+0xa7/0x130
[  206.476900]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.476907]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.476912] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.476913] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.476916] R10: 00000000008b67a8 R11: 0000000000000293 R12: 
00000000008b67a8
[  206.476971]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.476985] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.476986] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.476987] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.476989] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.476990] RSP: 0018:ffffc0b1c301fac0 EFLAGS: 00010283
[  206.476992] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.476993] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.476994] RBP: ffffc0b1c301fb28 R08: 0000000000000001 R09: 
ffffc0b1c301fb88
[  206.476995] R10: 00000000000b67b4 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.476996] R13: 000000010d0f6000 R14: ffffc0b1c301fb88 R15: 
ffff9d7a8d400000
[  206.476997] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.476998] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.476999] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.477000] Call Trace:
[  206.477048]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.477078]  vfio_device_fops_write+0x1f/0x40
[  206.477117]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.477126]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.477131] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.477133] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.477137] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.477148] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.477199] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.477200] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.477201] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.477204] RSP: 0018:ffffc0b1c301faf0 EFLAGS: 00010246
[  206.477207] RBP: ffffc0b1c301fb30 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.477247]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.477255]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.477276]  __x64_sys_pwrite64+0x96/0xc0
[  206.477313]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.477322]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.477327] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.477330] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.477337] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.477389]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.477403] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.477404] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.477405] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.477408] RSP: 0018:ffffc0b1c301fb10 EFLAGS: 00010283
[  206.477410] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.477415] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.477471]  vfs_write+0xc6/0x3b0
[  206.477505]  ? fire_user_return_notifiers+0x42/0x70
[  206.477518] RIP: 0033:0x7fcbbebcacbf
[  206.477522] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.477525] R10: 00000000008b67b8 R11: 0000000000000293 R12: 
00000000008b67b8
[  206.477531] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.477574]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.477589] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.477590] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.477592] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.477593] RSP: 0018:ffffc0b1c301fb40 EFLAGS: 00010246
[  206.477595] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.477598] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.477603] Call Trace:
[  206.477607]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.477697]  ? do_syscall_64+0x69/0x90
[  206.477701]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.477704] RIP: 0033:0x7fcbbebcacbf
[  206.477708] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.477711] R10: 00000000008b67b8 R11: 0000000000000293 R12: 
00000000008b67b8
[  206.477716] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.477730] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.477786] RSP: 0018:ffffc0b1c301fae0 EFLAGS: 00010283
[  206.477787] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.477788] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.477789] RBP: ffffc0b1c301fb48 R08: 0000000000000001 R09: 
ffffc0b1c301fba8
[  206.477790] R10: 00000000000b67c4 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.477791] R13: 000000010d0f6000 R14: ffffc0b1c301fba8 R15: 
ffff9d7a8d400000
[  206.477792] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.477794] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.477795] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.477824]  ? kvm_arch_vcpu_put+0x1a9/0x200 [kvm]
[  206.477873]  vfio_device_fops_write+0x1f/0x40
[  206.477926] RIP: 0033:0x7fcbbebcacbf
[  206.477929] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.477937]  </TASK>
[  206.477943] ------------[ cut here ]------------
[  206.477946] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.478007] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.478008] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.478010] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.478012] Call Trace:
[  206.478013]  <TASK>
[  206.478026]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.478076]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.478094]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.478152] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.478154] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.478155] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.478162] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.478183] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.478250] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.478251] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.478252] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.478254] Call Trace:
[  206.478254]  <TASK>
[  206.478256]  vfio_pin_pages+0x5e/0xb0
[  206.478275]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.478374] RIP: 0033:0x7fcbbebcacbf
[  206.478379] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.478391] ------------[ cut here ]------------
[  206.478430]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.478443] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.478449] RSP: 0018:ffffc0b1c301fb68 EFLAGS: 00010246
[  206.478453] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.478454] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.478455] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.478456] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.478457] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.478461]  vfio_unpin_pages+0x49/0x60
[  206.478462]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.478473]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.478488]  ? kvm_arch_vcpu_put+0x1a9/0x200 [kvm]
[  206.478539]  vfs_write+0xc6/0x3b0
[  206.478584] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.478587] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.478592]  </TASK>
[  206.478608] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.478674] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.478675] Call Trace:
[  206.478676]  <TASK>
[  206.478678]  vfio_pin_pages+0x5e/0xb0
[  206.478679]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.478696]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.478713]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.478751]  ? vfs_write+0xc6/0x3b0
[  206.478797] RIP: 0033:0x7fcbbebcacbf
[  206.478802] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.478808]  </TASK>
[  206.478814] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.478853]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.478871] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.478878] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.478879] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.478880] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.478881] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.478882] Call Trace:
[  206.478883]  <TASK>
[  206.478885]  vfio_unpin_pages+0x49/0x60
[  206.478905]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.478930]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.478993]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.479009] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.479010] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.479011] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.479014] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.479032] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.479095] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.479096] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.479097] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.479099] Call Trace:
[  206.479132]  vfio_pin_pages+0x5e/0xb0
[  206.479142]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.479201]  vfs_write+0xc6/0x3b0
[  206.479229] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.479234] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.479246] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.479310] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.479312] Call Trace:
[  206.479312]  <TASK>
[  206.479314]  vfio_unpin_pages+0x49/0x60
[  206.479325]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.479340]  ? vcpu_put+0x22/0x50 [kvm]
[  206.479384]  vfs_write+0xc6/0x3b0
[  206.479396]  do_syscall_64+0x59/0x90
[  206.479409] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.479414] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.479430] ------------[ cut here ]------------
[  206.479470]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.479484] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.479490] RSP: 0018:ffffc0b1c301fb48 EFLAGS: 00010283
[  206.479498] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.479499] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.479500] Call Trace:
[  206.479501]  <TASK>
[  206.479503]  vfio_pin_pages+0x5e/0xb0
[  206.479504]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.479513]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.479520]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.479527]  ? kvm_arch_vcpu_ioctl_run+0x3c4/0x1850 [kvm]
[  206.479553]  ? vcpu_put+0x22/0x50 [kvm]
[  206.479573]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.479581]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.479588]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.479595]  vfio_device_fops_write+0x1f/0x40
[  206.479597]  vfs_write+0xc6/0x3b0
[  206.479604]  ? __fget_light+0xa7/0x130
[  206.479615]  ? do_syscall_64+0x69/0x90
[  206.479627] R10: 00000000008b67e0 R11: 0000000000000293 R12: 
00000000008b67e0
[  206.479638] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.479677]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.479691] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.479705] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.479707]  <TASK>
[  206.479710]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.479720]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.479728]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.479735]  ? kvm_arch_vcpu_ioctl_run+0x3c4/0x1850 [kvm]
[  206.479789]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.479796]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.479803]  vfio_device_fops_write+0x1f/0x40
[  206.479804]  vfs_write+0xc6/0x3b0
[  206.479811]  ? __fget_light+0xa7/0x130
[  206.479821]  ? do_syscall_64+0x69/0x90
[  206.479833] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.479840] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.479850] ------------[ cut here ]------------
[  206.479890]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.479904] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.479915] R13: 000000010d0f6000 R14: ffffc0b1c301fc60 R15: 
ffff9d7a8d400000
[  206.479921]  <TASK>
[  206.479924]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.479933]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.479948]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.479963]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.479970]  vfio_device_fops_write+0x1f/0x40
[  206.479971]  vfs_write+0xc6/0x3b0
[  206.479976]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.479978]  ? __fget_light+0xa7/0x130
[  206.479980]  __x64_sys_pwrite64+0x96/0xc0
[  206.479983]  do_syscall_64+0x59/0x90
[  206.479988] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.480043]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.480057] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.480058] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.480062] RSP: 0018:ffffc0b1c301fbc8 EFLAGS: 00010246
[  206.480071] CR2: 000056165df16008 CR3: 000000011447c006 CR4: 
00000000003726e0
[  206.480130]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.480132]  ? __fget_light+0xa7/0x130
[  206.480134]  __x64_sys_pwrite64+0x96/0xc0
[  206.480139]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.480142] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.480144] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.480145] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.480146] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.480148] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.480152]  </TASK>
[  206.480165] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.480204]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.480224] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.480232] R13: 000000010d0f6000 R14: ffffc0b1c301fbf8 R15: 
ffff9d7a8d400000
[  206.480270]  vfio_pin_pages+0x5e/0xb0
[  206.480359]  do_syscall_64+0x59/0x90
[  206.480370] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.480371] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.480373] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.480374] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.480375] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.480376] R10: 00000000008b67f0 R11: 0000000000000293 R12: 
00000000008b67f0
[  206.480377] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.480379]  </TASK>
[  206.480388] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.480552]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.480555]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.480559] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.480560] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.480562] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.480563] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.480564] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.480565] R10: 00000000008b67f0 R11: 0000000000000293 R12: 
00000000008b67f0
[  206.480585] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.480731]  vfs_write+0xc6/0x3b0
[  206.480764]  ? __fget_light+0xa7/0x130
[  206.480766]  __x64_sys_pwrite64+0x96/0xc0
[  206.480769]  do_syscall_64+0x59/0x90
[  206.480771]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.480773]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.480775]  ? do_syscall_64+0x69/0x90
[  206.480777]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.480779]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.480781]  ? do_syscall_64+0x69/0x90
[  206.480783]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.480785] RIP: 0033:0x7fcbbebcacbf
[  206.480786] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.480788] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.480789] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.480790] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.480797] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.480841]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.480855] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.480857] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.480860] RSP: 0018:ffffc0b1c301faf8 EFLAGS: 00010246
[  206.480868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.480910]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.480936]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.480960]  ? __fget_light+0xa7/0x130
[  206.480965]  do_syscall_64+0x59/0x90
[  206.480967]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.480969]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.480971]  ? do_syscall_64+0x69/0x90
[  206.480973]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.480975]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.480977]  ? do_syscall_64+0x69/0x90
[  206.480979]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.480981] RIP: 0033:0x7fcbbebcacbf
[  206.480982] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.480992]  </TASK>
[  206.481045]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.481059] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.481060] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.481061] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.481064] RSP: 0018:ffffc0b1c301fac8 EFLAGS: 00010283
[  206.481065] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.481104]  vfio_pin_pages+0x5e/0xb0
[  206.481145]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.481153]  vfio_device_fops_write+0x1f/0x40
[  206.481154]  vfs_write+0xc6/0x3b0
[  206.481157]  ? kvm_vcpu_ioctl+0x120/0x6f0 [kvm]
[  206.481176]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.481200]  ? __fget_light+0xa7/0x130
[  206.481202]  __x64_sys_pwrite64+0x96/0xc0
[  206.481205]  do_syscall_64+0x59/0x90
[  206.481207]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481209]  ? do_syscall_64+0x69/0x90
[  206.481210]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481212]  ? do_syscall_64+0x69/0x90
[  206.481214]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.481218]  ? do_syscall_64+0x69/0x90
[  206.481220]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.481223] RIP: 0033:0x7fcbbebcacbf
[  206.481225] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.481230] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.481281]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.481299] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.481301] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.481305] RSP: 0018:ffffc0b1c301faf8 EFLAGS: 00010246
[  206.481311] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.481368]  vfio_device_fops_write+0x1f/0x40
[  206.481369]  vfs_write+0xc6/0x3b0
[  206.481392]  ? kvm_on_user_return+0x84/0xe0 [kvm]
[  206.481415]  ? __fget_light+0xa7/0x130
[  206.481418]  __x64_sys_pwrite64+0x96/0xc0
[  206.481420]  do_syscall_64+0x59/0x90
[  206.481422]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481424]  ? do_syscall_64+0x69/0x90
[  206.481425]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481427]  ? do_syscall_64+0x69/0x90
[  206.481429]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.481432]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481434]  ? do_syscall_64+0x69/0x90
[  206.481435]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.481437] RIP: 0033:0x7fcbbebcacbf
[  206.481438] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.481440] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.481441] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.481442] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.481448]  </TASK>
[  206.481502]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.481515] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.481517] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.481518] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.481519] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.481521] RSP: 0018:ffffc0b1c301fb58 EFLAGS: 00010283
[  206.481522] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.481529] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.481565]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.481580]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.481587]  vfio_device_fops_write+0x1f/0x40
[  206.481589]  vfs_write+0xc6/0x3b0
[  206.481591]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.481594]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481596]  ? __fget_light+0xa7/0x130
[  206.481598]  __x64_sys_pwrite64+0x96/0xc0
[  206.481601]  do_syscall_64+0x59/0x90
[  206.481603]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.481604]  ? do_syscall_64+0x69/0x90
[  206.481606]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.481608] RIP: 0033:0x7fcbbebcacbf
[  206.481609] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.481611] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.481612] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.481613] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.481614] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.481616] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.481664]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.481678] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.481683] RSP: 0018:ffffc0b1c301fb88 EFLAGS: 00010246
[  206.481684] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.481687] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.481729]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.481768]  ? do_syscall_64+0x69/0x90
[  206.481769]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.481771] RIP: 0033:0x7fcbbebcacbf
[  206.481773] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.481774] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.481775] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.481777] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.481778] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.481779] R10: 00000000008b6808 R11: 0000000000000293 R12: 
00000000008b6808
[  206.481780] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.481782]  </TASK>
[  206.481783] ---[ end trace 0000000000000000 ]---
[  206.481797] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.481946]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.481992]  ? do_syscall_64+0x69/0x90
[  206.481996]  ? do_syscall_64+0x69/0x90
[  206.481997]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.481999] RIP: 0033:0x7fcbbebcacbf
[  206.482001] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.482002] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.482004] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.482005] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.482006] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.482007] R10: 00000000008b6810 R11: 0000000000000293 R12: 
00000000008b6810
[  206.482008] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.482010]  </TASK>
[  206.482011] ---[ end trace 0000000000000000 ]---
[  206.482012] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.482016] ------------[ cut here ]------------
[  206.482017] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.482055]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.482073] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.482079] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.482084] Call Trace:
[  206.482150]  intel_vgpu_rw+0xa6/0x1e0 [kvmgt]
[  206.482194]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482198]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482199]  ? do_syscall_64+0x69/0x90
[  206.482201]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.482203] RIP: 0033:0x7fcbbebcacbf
[  206.482205] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.482206] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.482207] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.482209] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.482210] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.482211] R10: 00000000008b6810 R11: 0000000000000293 R12: 
00000000008b6810
[  206.482212] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.482278]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.482292] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.482294] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.482295] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.482298] RSP: 0018:ffffc0b1c301faa8 EFLAGS: 00010283
[  206.482299] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.482304] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.482388]  vfs_write+0xc6/0x3b0
[  206.482422]  ? do_syscall_64+0x69/0x90
[  206.482423]  ? fire_user_return_notifiers+0x42/0x70
[  206.482425]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.482428]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482430]  ? do_syscall_64+0x69/0x90
[  206.482431]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482433]  ? do_syscall_64+0x69/0x90
[  206.482434]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.482437] RIP: 0033:0x7fcbbebcacbf
[  206.482438] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.482439] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.482441] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.482444] R10: 00000000008b6818 R11: 0000000000000293 R12: 
00000000008b6818
[  206.482493]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.482507] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.482510] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.482513] RSP: 0018:ffffc0b1c301fad8 EFLAGS: 00010246
[  206.482515] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.482568]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.482607]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.482609]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482612]  ? fire_user_return_notifiers+0x42/0x70
[  206.482615]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.482617]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482619]  ? do_syscall_64+0x69/0x90
[  206.482621]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482623]  ? do_syscall_64+0x69/0x90
[  206.482624]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.482626] RIP: 0033:0x7fcbbebcacbf
[  206.482628] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.482690]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.482704] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.482705] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.482706] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.482709] RSP: 0018:ffffc0b1c301fb08 EFLAGS: 00010283
[  206.482713] R10: 00000000000b6824 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.482774]  vfs_write+0xc6/0x3b0
[  206.482776]  ? kvm_vcpu_ioctl+0x120/0x6f0 [kvm]
[  206.482796]  ? exit_to_user_mode_prepare+0x35/0x170
[  206.482798]  ? __fget_light+0xa7/0x130
[  206.482801]  __x64_sys_pwrite64+0x96/0xc0
[  206.482804]  do_syscall_64+0x59/0x90
[  206.482805]  ? do_syscall_64+0x69/0x90
[  206.482807]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482809]  ? do_syscall_64+0x69/0x90
[  206.482812]  ? do_syscall_64+0x69/0x90
[  206.482813]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.482816] RIP: 0033:0x7fcbbebcacbf
[  206.482818] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.482820] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.482823] R10: 00000000008b6820 R11: 0000000000000293 R12: 
00000000008b6820
[  206.482872]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.482886] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.482890] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.482931]  ? restore_fpregs_from_fpstate+0x47/0xc0
[  206.482985]  __x64_sys_pwrite64+0x96/0xc0
[  206.482987]  do_syscall_64+0x59/0x90
[  206.482989]  ? do_syscall_64+0x69/0x90
[  206.482991]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.482993]  ? do_syscall_64+0x69/0x90
[  206.482996]  ? do_syscall_64+0x69/0x90
[  206.482997]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.483000] RIP: 0033:0x7fcbbebcacbf
[  206.483001] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.483007] R10: 00000000008b6820 R11: 0000000000000293 R12: 
00000000008b6820
[  206.483062]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.483076] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.483077] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.483081] RSP: 0018:ffffc0b1c301fb28 EFLAGS: 00010283
[  206.483085] RBP: ffffc0b1c301fb90 R08: 0000000000000001 R09: 
ffffc0b1c301fbf0
[  206.483166]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.483198]  __x64_sys_pwrite64+0x96/0xc0
[  206.483200]  do_syscall_64+0x59/0x90
[  206.483202]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.483204]  ? do_syscall_64+0x69/0x90
[  206.483205]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.483207]  ? do_syscall_64+0x69/0x90
[  206.483209]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.483211] RIP: 0033:0x7fcbbebcacbf
[  206.483212] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.483214] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.483215] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.483216] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.483217] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.483223]  </TASK>
[  206.483230] ------------[ cut here ]------------
[  206.483270]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.483287] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.483290] RSP: 0018:ffffc0b1c301fb58 EFLAGS: 00010246
[  206.483294] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.483322]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.483414]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.483419] RIP: 0033:0x7fcbbebcacbf
[  206.483421] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.483422] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.483423] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.483425] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.483426] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.483427] R10: 00000000008b6828 R11: 0000000000000293 R12: 
00000000008b6828
[  206.483428] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.483444] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.483484]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.483502] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.483510] FS:  00007fcbb9200700(0000) GS:ffff9d81dac40000(0000) 
knlGS:0000000000000000
[  206.483559]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.483589]  ? do_syscall_64+0x69/0x90
[  206.483591]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.483593] RIP: 0033:0x7fcbbebcacbf
[  206.483594] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.483596] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.483597] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.483598] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.483599] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.483600] R10: 00000000008b6830 R11: 0000000000000293 R12: 
00000000008b6830
[  206.483601] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.483604]  </TASK>
[  206.483605] ---[ end trace 0000000000000000 ]---
[  206.483610] ------------[ cut here ]------------
[  206.483650]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.483667] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.483674] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.483679] Call Trace:
[  206.483701]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.483752]  ? do_syscall_64+0x69/0x90
[  206.483762] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.483764] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.483765] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.483766] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.483767] R10: 00000000008b6830 R11: 0000000000000293 R12: 
00000000008b6830
[  206.483768] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.483770]  </TASK>
[  206.483771] ---[ end trace 0000000000000000 ]---
[  206.483772] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.483782] ------------[ cut here ]------------
[  206.483783] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.483785] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.483878]  ? kvm_arch_vcpu_put+0x1a9/0x200 [kvm]
[  206.483970] RIP: 0033:0x7fcbbebcacbf
[  206.483974] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.483975] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.483977] R10: 00000000008b6838 R11: 0000000000000293 R12: 
00000000008b6838
[  206.483978] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.483981]  </TASK>
[  206.483982] ---[ end trace 0000000000000000 ]---
[  206.483983] gvt: vgpu 2: vfio_pin_pages failed for iova 
0x000000010d0f6000, ret -22
[  206.483987] ------------[ cut here ]------------
[  206.483988] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:524 iommufd_access_unpin_pages+0x117/0x130
[  206.483990] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.484085]  ? kvm_arch_vcpu_put+0x1a9/0x200 [kvm]
[  206.484162]  ? fire_user_return_notifiers+0x42/0x70
[  206.484181] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.484189] gvt: vgpu 2: fail to populate guest ggtt entry
[  206.484200] ------------[ cut here ]------------
[  206.484200] WARNING: CPU: 9 PID: 3362 at 
drivers/iommu/iommufd/device.c:591 iommufd_access_pin_pages+0x337/0x360
[  206.484243]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.484257] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.484259] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.484259] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.484261] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.484262] RSP: 0018:ffffc0b1c301fb30 EFLAGS: 00010283
[  206.484265] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.484267] R10: 00000000000b6844 R11: ffff9d7a97ce0000 R12: 
0000000000000001
[  206.484277]  gvt_dma_map_page+0xb7/0x130 [kvmgt]
[  206.484301]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.484327]  ? __fget_light+0xa7/0x130
[  206.484338]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.484345] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.484401]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.484414] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.484416] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.484417] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.484418] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.484425] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.484443]  intel_gvt_dma_map_guest_page+0x78/0x240 [kvmgt]
[  206.484482]  vfio_device_fops_write+0x1f/0x40
[  206.484488]  __x64_sys_pwrite64+0x96/0xc0
[  206.484498]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.484504] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.484567]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.484582] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.484583] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.484584] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.484585] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.484587] RSP: 0018:ffffc0b1c301fb60 EFLAGS: 00010283
[  206.484595] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  206.484597] Call Trace:
[  206.484598]  <TASK>
[  206.484653]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.484679]  ? kvm_vcpu_ioctl+0x120/0x6f0 [kvm]
[  206.484708]  ? do_syscall_64+0x69/0x90
[  206.484712] Code: 08 89 3c 24 48 89 4c 24 18 e8 3d f3 ff ff 4c 8b 54 24 
18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 12 00 00 00 0f 05 
<48> 3d 00 f0 ff ff 77 2d 44 89 c7 48 89 04 24 e8 6d f3 ff ff 48 8b
[  206.484722]  </TASK>
[  206.484768]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.484782] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.484783] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.484784] RIP: 0010:iommufd_access_unpin_pages+0x117/0x130
[  206.484786] Code: 48 39 45 c8 77 20 48 8b 45 d8 65 48 2b 04 25 28 00 00 
00 75 19 48 83 c4 20 5b 41 5c 41 5d 41 5e 5d c3 cc cc cc cc 0f 0b eb dc 
<0f> 0b eb d8 e8 70 1c 5a 00 0f 0b eb cf 66 66 2e 0f 1f 84 00 00 00
[  206.484787] RSP: 0018:ffffc0b1c301fb90 EFLAGS: 00010246
[  206.484788] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000027
[  206.484789] RDX: 0000000000000000 RSI: 000000010d0f6000 RDI: 
ffff9d7a8477d780
[  206.484790] RBP: ffffc0b1c301fbd0 R08: 0000000000000000 R09: 
705f6e69705f6f69
[  206.484791] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.484792] R13: 000000010d0f6000 R14: 0000000000000000 R15: 
ffff9d7a8d400000
[  206.484800]  gvt_dma_map_page.cold+0x75/0x14e [kvmgt]
[  206.484842]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.484883]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.484888] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.484891] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.484896]  </TASK>
[  206.484908] ------------[ cut here ]------------
[  206.484949]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.484963] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.484965] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.484966] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.484967] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.484969] RSP: 0018:ffffc0b1c301fac0 EFLAGS: 00010283
[  206.484970] RAX: ffff9d7a8d400000 RBX: 0000000000000000 RCX: 
ffff9d7a84422800
[  206.484971] RDX: 0000000000001000 RSI: ffff9d7a84422838 RDI: 
ffff9d7a8477d780
[  206.485007]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.485021]  intel_vgpu_write+0x1ab/0x240 [kvmgt]
[  206.485038]  do_syscall_64+0x59/0x90
[  206.485053]  ? do_syscall_64+0x69/0x90
[  206.485059] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.485061] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.485064] R10: 00000000008b6850 R11: 0000000000000293 R12: 
00000000008b6850
[  206.485076] Modules linked in: nfnetlink bridge stp llc bnep 
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic 
ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi 
snd_hda_codec snd_hda_core snd_hwdep snd_pcm intel_rapl_msr 
intel_rapl_common snd_seq_midi rtw88_8822be rtw88_8822b snd_seq_midi_event 
intel_tcc_cooling rtw88_pci x86_pkg_temp_thermal intel_powerclamp 
snd_rawmidi btusb rtw88_core btrtl coretemp btbcm snd_seq btintel 
snd_seq_device btmtk mac80211 mei_hdcp mei_pxp kvm_intel bluetooth 
snd_timer rapl ecdh_generic cfg80211 input_leds intel_cstate snd ecc 
serio_raw mei_me libarc4 ee1004 soundcore mei mac_hid acpi_pad sch_fq_codel 
kvmgt mdev kvm parport_pc nfsd ppdev lp auth_rpcgss parport nfs_acl lockd 
grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic zstd_compress 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx 
xor raid6_pq libcrc32c raid1 raid0 multipath linear dm_mirror 
dm_region_hash dm_log hid_generic i915 drm_buddy
[  206.485136] R10: 000000006776203a R11: 000000003a747667 R12: 
ffff9d7a84422800
[  206.485172]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.485198]  ? __fget_light+0xa7/0x130
[  206.485211]  ? do_syscall_64+0x69/0x90
[  206.485216]  ? syscall_exit_to_user_mode+0x26/0x50
[  206.485223] RIP: 0033:0x7fcbbebcacbf
[  206.485226] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.485229] RDX: 0000000000000008 RSI: 00007fcbb91ff4d8 RDI: 
0000000000000017
[  206.485232] R13: 000000010d0f6001 R14: 000055f21fd146f0 R15: 
000055f21fd14600
[  206.485292]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas 
video wmi
[  206.485307] CPU: 9 PID: 3362 Comm: qemu-system-x86 Tainted: G        W 
         6.1.0-rc2-iommufd-d2b2119+ #1
[  206.485308] Hardware name: Supermicro C7Z370-CG-IW/C7Z370-CG-IW, BIOS 
1.1 02/08/2018
[  206.485309] RIP: 0010:iommufd_access_pin_pages+0x337/0x360
[  206.485311] Code: 7f 68 89 45 b4 48 83 c7 08 e8 05 de 5a 00 48 8b 75 b8 
44 8b 45 b4 e9 36 fe ff ff 48 8b 75 b8 41 b8 fe ff ff ff e9 27 fe ff ff 
<0f> 0b 41 b8 ea ff ff ff e9 35 fe ff ff 41 b8 ea ff ff ff e9 2a fe
[  206.485312] RSP: 0018:ffffc0b1c301fb70 EFLAGS: 00010283
[  206.485322] Call Trace:
[  206.485342]  intel_vgpu_emulate_ggtt_mmio_write+0x47e/0x550 [kvmgt]
[  206.485349]  ? kvm_arch_vcpu_put+0x1a9/0x200 [kvm]
[  206.485376]  intel_vgpu_emulate_mmio_write+0x2eb/0x360 [kvmgt]
[  206.485426]  ? __fget_light+0xa7/0x130
[  206.485436]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  206.485441] RSP: 002b:00007fcbb91ff490 EFLAGS: 00000293 ORIG_RAX: 
0000000000000012
[  206.485442] RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 
00007fcbbebcacbf
[  206.485444] RBP: 0000000000000008 R08: 0000000000000000 R09: 
ffffffffffffffff
[  206.485449] ---[ end trace 0000000000000000 ]---
[  206.485494]  i2c_algo_bit ttm drm_display_helper cec rc_core 
drm_kms_helper crct10dif_pclmul syscopyarea usbhid crc32_pclmul 
polyval_clmulni sysfillrect hid polyval_generic ghash_clmulni_intel 
sysimgblt fb_sys_fops sha512_ssse3 aesni_intel crypto_simd mxm_wmi psmouse 
cryptd drm e1000e ahci i2c_i801 xhci_pci i2c_smbus libahci xhci_pci_renesas vi

-- 
Regards,
Yi Liu
