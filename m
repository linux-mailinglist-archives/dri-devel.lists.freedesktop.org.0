Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08732614B41
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B1910E3AC;
	Tue,  1 Nov 2022 12:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CA810E06D;
 Tue,  1 Nov 2022 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667307310; x=1698843310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=csbk9+OjAxWSZwICKjX+Xj78BSwfPcSD4fxKh98xyAo=;
 b=Hdt3lba2TLxMK3Df5v+gvhOTh4pIbQGH28b5n9V2PXlYXQsgpACuE/kD
 zfGbv4hPdO+FbQu20KNWQEojMiFN4qZkC8Xq1IVuZjeKf3IZX5WMo8vRe
 mdyN4otPuUeXeumQAenJGJfV/p8lA/l8GNigGOW6BgBOmhuzILSQv8CxC
 6+oVa0S8tP29GAo7n3wGa8m7Ln8bkjmNWnw07d8T1qEpn5bXmwSuoeDmP
 MMg1hxBhbn34GKYlxq/h9+DYWaxAKYQMHqXYj1dBSIKApwkhwpFgkxVxQ
 iUJmh4Kzx+dpNvc9WCpM9NU2Kv8TUgtIKNkmHE7bjfdELqpKTmYltcq9W g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="288838373"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="288838373"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 05:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776483544"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="776483544"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2022 05:55:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 05:55:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 05:55:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 05:55:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVGsKMOrZpa/sqdC520kJKB6lUSG6yxT8OCrn1LeAlYy9DiC9SvmJMVD8J+eZGwEFxC0qHsK3byYj7cst3Zz/Mjlp7nlJfJ9ZBjsCrD5tgX7B/GMSUliHiTJBSBjp7zAEbVwCCfhmqdD34vnkLQ/egyD7v/KoTayc4IzvryFlE6UnYnrwfIFdP5U+VTSj+orfMjRXSk2PyTbLSl5e3c4vE4V2FnJfaWvMd0PV/WasOX4Gdsz8fM4UqNSz9Co/j8MLbtTMNZCAwlTexo/4oWaPYZIseXnZnfyVGv2pRyK7b6n2N2BBcfqhkqvMcWKvxBwe6HgIyHUnbqKQ4nhyQVHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFdo7z/nsG85jXzgGN5tBjo6XShPwsH1a4uLbOYix5U=;
 b=nY7EoEDY7pf8eMjhP/GpmshQ+5yBRRIsr2cEhEIJG6lAyNoaibwuqQjK6Kw4S+HuggHNzi+MCSOtkL+bj2To7LHGYxPWCU1y9Hkt5RWqW3Ha3NsqOfkU8ABJZclCSwc/gDolwQUWJQhDMsNFevnWD9etwaiM2NxW7Ir7SFDAGIMt24XIzHjDHctMwpuMXO0NdsenQkKBqLKKto3PWblN02NVxfHZ+Tpbf0yTMQiLY+mdDuRyXzy0uB3NI6A96Wtpzv5RIsZ5sKQM9KaPaX03aVW6Spof8wxmocH9cNfczt7STPjZgvWQEKbEBCb5MLS3pN5uVIXYLsxR3qSq5qia/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 12:55:06 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 12:55:06 +0000
Message-ID: <7f6bb57b-2982-92c8-ef29-a676878f6459@intel.com>
Date: Tue, 1 Nov 2022 20:55:31 +0800
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
 <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
 <Y2EFzjYn9IqbRmQs@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y2EFzjYn9IqbRmQs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b4d887-eea7-42c5-30a3-08dabc084cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: krdV5BRaW3Beqy+JzdhBZ5P2dz34Lu2IqiTtaXlIQM2KEwK6GDmOlg5ZkoIFIpOKjhvokuB9GXYWNGHb8CzkKyFZ2KSH8u8MlLa/lQH18V2/aNip6JIX9aWkLGyXE1QWxP4Pd54VzIXacUvxZTBHgYXg9K/ABipuxje+bun0rKMSPGkaSKv00/YyJEFThsBiPqIHmMyj/2IbBdAy7q1z6WWcIPxqyn6cOJBrvk1/D9lHZvhAXw/+f68ncULaUDlSo4ui9FaeRIVTJsaOG33rNXBqfNSUdPq+XX63MUQbokRmh7Hv9yV5Oc3Rr3iebskyxGgvW4SOEhdaNRNXvm8u/vUt5+1v9fKd875VOFnOziBdd9U4JoLRHq8usPAliefP81GuX90FXJ7q2RIhR0mv/wnIyfRpAbSVSQA97Lwa9wB4jaiZsgpSNbSgsOCAt5rmhiKmC6lR/bNoiA69viNYm9Ud6xwJ3aUM7AgT7zptb61qfw+CdBsXLoupWhNu3xwG+9+AkT0FhDGj0JHyZk/BRceJ58Z+CQI6xPOsocOTzBlZnMy8j+U/1ractTvgqGh3zQZCuG0O7vIA1XBEoVEfmvKkFMkadh5X+19S6AvT47T++IoYkEtI5nFNifN/jKiX+QFU+3LvyMHCWzCB0NTYIvCPAPn2/1hOsT+Xgwnt7Ypvqs1UFT/YAtO5Jq55t0PRYaQ/5lk4E7tboSENtWA6to4WYPMyZ+lBF3Ny0F+qD0BhiEcTyOVnh5NWRibJ6m9p3ncz+SGB3HNHbwk4/5xfMnJL5aixie8L2VnFPaJ/Ap0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(2906002)(6506007)(66946007)(6512007)(26005)(66476007)(54906003)(53546011)(66556008)(36756003)(82960400001)(6916009)(6666004)(4326008)(316002)(8676002)(41300700001)(38100700002)(31696002)(83380400001)(5660300002)(86362001)(8936002)(7406005)(7416002)(186003)(6486002)(2616005)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aThQOGxKdVFzSy9GbjlLL0lmcjhOb01IWUk3NHpnVDB6MmlWS1NscFliUDRy?=
 =?utf-8?B?aGJPQ2JESzJiajh4OXBGc2NYL2RMdDVYSWNTMXBsZzNmR2RyZ2hCQnZaSyth?=
 =?utf-8?B?WDUxM1pXaGtkTHdOSFlJR0k4THo0M2NoazhvUU9JMXRycW9CNEVGQk84NE5i?=
 =?utf-8?B?ekV4ejNTMFV5VzBDVWdaVTNPdU5qQXQ2MEcyeGR1N2pCSnlOYytmZ1ZYTk82?=
 =?utf-8?B?U29taVlpUVFocXVlQXYyZXBtK2J0MmpOL2R3eDNmRGlyQVVvSmdGS1VOYmxH?=
 =?utf-8?B?OWpjR3laOUowL1JwY1ppeWw1cU13V0FiK0VwQVBFUEh3Zm5TQmE1Z29IbEZ1?=
 =?utf-8?B?Q21DRzdNWXF2NUNDTmJFRXFHUjQ3MmlHc2pPQ1J6NlllUWUySjRWcldFRjFs?=
 =?utf-8?B?MzRiV2xWNzNVV1pyWkQ0YmdLVTFQcXF1bm1SUnhucElHaXRydmM0cEtZRVNU?=
 =?utf-8?B?eDhiWHdqL3ZWdUhRQXhWb3ZjY1ZMR2tLV1ZlWkhXdUxLZG5vN2QvS2xDR0ZI?=
 =?utf-8?B?N2RFOTZFRVltTkVva0hMWFg4UzdrWXVOS0R5S293aHVwME9RYWQzSmdqQzFE?=
 =?utf-8?B?RXJBa3dhY2E4MzJSbjd2cDB3MGRYb0hzdTFTaW5oeURkZUF3MTRQQWxCOUty?=
 =?utf-8?B?Z0RPOTRseXQwWDNKTDNiSUZJcE5Na1BqclhESG5jeDByS0wva3pFNGs1ekhX?=
 =?utf-8?B?cXBkdC8xWTkyOVBkN1hRNmNaK0kyOFR1aWY2azVPVzZadmRWRkRja2ZYYnhM?=
 =?utf-8?B?L0tJZk9pVG1UYi93ZE4yUnpNME95Z0lheUdJZWJLZ0RFanBlN1VHYzNDRG9j?=
 =?utf-8?B?a3A5YjlKbi9RQkhEaGhWK3Nlczlyb0lFcVZYeUdvMC9RTXhnVWNrSlFYalNy?=
 =?utf-8?B?Mko2Nzg3RG9DTEZvWmlhODRXK2NrckcyRGw0ZnRndjkvMXFiQ1B2enoxZjgx?=
 =?utf-8?B?YXl3ck52MTBlOTB3bVZYK25FNmZYTmpsdytFbnh3bkd2UVFFck9PT3ZYNmZ5?=
 =?utf-8?B?L0JxLzhMMVhPbnRzL2Q4bmMxcDBOVEpVUlZGWWtDMVZaeUFTMEoyb05FTHRk?=
 =?utf-8?B?b2h5LzNvQnM3Wnh0SThEdUIwOWhuREdQbXNrQXJNWjIvZkpEd0w4MU5XeXl5?=
 =?utf-8?B?S0sxbnFEaEtGMWJjRnZxMCtFd21UVU5rYXREUnE1eExrM0VvMHpWc1FOUWVG?=
 =?utf-8?B?MVRkZzN0b1V2aXEyR1BFRTNGdXA5NmowdE1PWTUydkVTb2EvT3NmMHFIMFhx?=
 =?utf-8?B?bVVncXNxWEJpb0ZQMXlRWVdoTU9mdmNMa2h4clJvek5LR29lRlc5NlBwUG9r?=
 =?utf-8?B?SnQ1cWJtWVpBVExSUXEzQ3FhOTFKaG9RLyt1RzltRC9ZWDNqT3p3UXdyQVFV?=
 =?utf-8?B?TVA5c2FSZE5ick45UEZiR3BrT2pINlNoN2FtUW10SGY1Z2IyUmVUZURweFkv?=
 =?utf-8?B?MjE3TTA5dTQ1RVNmNndrYmx3Ty9WLzJ4YkFsaytsaVdPVzVPdWZSdXZnV2NZ?=
 =?utf-8?B?VXJOSW5OQmdXZWUvVURlanRTWllBZ1J0NnRWc2R2ZFFaUGV1dFhqL1JUU3NJ?=
 =?utf-8?B?UlBVcC84STcyZjFaR2xKNlB1YW5NYjNRdFpwbVdNUWZ2MUJSK0lsMEo5dWZs?=
 =?utf-8?B?Nmw4UENyb2tvbVpyb2E1SW8vb0pHYW81YVZ4b2JFa3ZaQmZwb1I1eVR4WERi?=
 =?utf-8?B?ZHZEU0xia1FoTHBFVXJ6Qm9xbkxnOU8za0JxSmJUMVFhWitianRnYnJBUEZS?=
 =?utf-8?B?MDlxVEZYQlBoUllUNzYvMUgwVE1JTG1PdEx5YmJya1ZNcGlHYTUyRDVDNVVF?=
 =?utf-8?B?S3I3cUlmM0dRUXRlWG5XMkxMeHBGNEFnRGt4bzBEQ0hsd2VRaWZNbmllVW5T?=
 =?utf-8?B?YzI4cnhiT2lPd3NvNVVpcElOWnJoMDludHhBOEVqWHFLNDU2YzFxbW5wNXVh?=
 =?utf-8?B?Q3MzODJqWjRpTjJYcU1VRldXd1ZmclVEOWJ4REN4Mm1ac1dycmtjcnlldDlG?=
 =?utf-8?B?bEpzNE5OYnRoWTZ3eUtORDBLNUI1ckdSN0orb3ErSVJEdzJIWTdOcEJPa1cr?=
 =?utf-8?B?QWd4elh3M1hFNUlGeDJubXNQT3FoaHZaSmxXb3F1UnNUS1ZScEZzR2Mrdytj?=
 =?utf-8?Q?XF5mwDoQpaQkxnK/n8bLFPy+a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b4d887-eea7-42c5-30a3-08dabc084cbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:55:06.3923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phd3e6NtEaJE2lXw1T86lPoAvhJMnuv7KS42rWkubClNVSpKcoUjge3bC+ujlqsEXe9iRYXtixDefdcwaLSeKA==
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

On 2022/11/1 19:41, Jason Gunthorpe wrote:
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
> Oh, this is my mistake, I rushed a bit getting updated branches:
> 
> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 40eb6931ab2321..29e7b1fdd0cd4a 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -118,6 +118,7 @@ static void vfio_emulated_unmap(void *data, unsigned long iova,
>   }
>   
>   static const struct iommufd_access_ops vfio_user_ops = {
> +	.needs_pin_pages = 1,
>   	.unmap = vfio_emulated_unmap,
>   };

yes, it is. The call trace goes away. my colleague is running gvt full test 
now.

-- 
Regards,
Yi Liu
