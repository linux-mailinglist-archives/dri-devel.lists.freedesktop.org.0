Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46761362D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D044810E24B;
	Mon, 31 Oct 2022 12:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F2610E244;
 Mon, 31 Oct 2022 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667219125; x=1698755125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7MhpDoZ8tvchs+YekHGdKMKN9RgWllEKnxm/Esoz3Ug=;
 b=FXNGXNtI/J4Far41vZyTgsIolQhCKPV6yGxnNK4/BaY0Ju3aGtundKI4
 7TFKlw4JU62D8o+4emfJoRwebcOA/pgfMElJztcsP6Lq+24TvdPdKqzOx
 hCL4tfaSu5lbWcHXapGboSRi3F7X5uMbD9S22z5ke/dL9tVrtuK/ocZED
 hzA9p8042lNm7vm3jrbGWp7eCXQGq7xcbDNWElpw9oqw4JQIbBqtvyGyE
 qVgJAi0QANk+UDLqbKcL32gy0iDwNFBUOOpfJ6npB3+B7Y2WPJj8cW4tC
 /QVg65Zc2XKxjuuQGqnJHGEpLJ207aZcS4O75I9/UzKUK9ViGPnoDw1lF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="335541348"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="335541348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 05:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="722794402"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="722794402"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2022 05:25:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 05:25:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 05:25:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 05:25:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 05:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUDnNtwlbJrKkYVGw4g9GZWE+Gh+ngPfhPXOywb937vftVDiNNl2UpeA7wfCl715iYl7fbtknxOt0HfSWZKoSqGZ35Oq69c5w3mKifm3TArKJMXW9/fILsmOkdDrGWOXvfZljq1Oqlvmb/njQMJg5tGEMV56TvhkgYUMTVU5gKXsnUYSP1Mh4BAex7oGiYPmWzErLfrdv6XkCtlqCURxSs8WrBZGCeHgITmmc/jQYmaPyuJN5W81zUyMG0EnEiR5qQb8jFG4K7UZ5R1CSy19fxUNIzsWlww8HGeHAdlWIDyvySXovIRlvKhuPNc55TMH0qu7l8MpSSI8J5e6OfkO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mgZdoYkAREqGyZo62RnK5oPWtoqzOu317wWZiTYHPo=;
 b=LPFjLRtvejzAV14rraYUK1C9a0mpVf+ddV03iSsOHzrykdehJ7I0FJF+jBezpEaCPirm1xo/yvgeAwT0BYc44d34i5E/d/7ZeWXrEaTQB6S5Nss6k8klKfyywrlkH3q2c9pB8fjR+edaVYe6SjTTjGPAD6GM14FmYGl5bUsYUSxoQCWqWiqjhz3R/S4E4Q03foOUjtgd9OFGkmHs1MkU3YVfJAAAU7ZZ0OfeLQPI4DkYi+sDmnejF9NsP87zsZqKI+y+6GdRH/2szLbDxzMIo/oAyv0IdQJDwwCZg1jEKJoqoaLs3Y7FHFtazSuJbyAlppBUE7e7cHHTUIfsXCuAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 12:25:15 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Mon, 31 Oct 2022
 12:25:15 +0000
Message-ID: <d8a0352e-9e1d-5b01-7616-dccc73a172a6@intel.com>
Date: Mon, 31 Oct 2022 20:25:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
 <Y1+9IB+DI9v+nD0P@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <Y1+9IB+DI9v+nD0P@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 1311be73-370b-4168-b91e-08dabb3af6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXEwYhK37kaFR4vEwxMUm8Hiu+5LqjFtr20meP0VlqmGm7n/HccafCBHb14d2ZiU8d/IXDAiUnjFJBwRs7SWCoMoac2DtYp2JIMeBjMWEMIFyNnVBR6csPiGCgPK3p9sNiZrnjBboh9G4y0lUWGJHtc13lqqcmz/GtVI2tyiyGU1kIq94R19XO9uyZrl/Lamf1EroICPMlwzBQNvVL66sxMAbYPPwwK+3U/2MZQmcZxXXXPr/I7aQnYcyL2tfH6rP3nKE6hRd84GngUcwXxY82WNK9N2rojMlAZf9IU1BvOgsoXFTxdDAdslUT0w0zTXrRdHmNb/Vv9GcZ90olu9x7c/F0iVP0dsa0QnUvSapO4WycHvrSEqwi7XUDCZmSn9aSadZQYEs+M7SiOel5tHVAY3T42EjUKGOGd0npu97N67MiK192zovyQ85FGVGN3smcxmpeHLI3EoKtw7sFfyGMs4YuUfqmYeTm1MDx7Q1Z27n/eByrALatWkYRcwg9+7fEfa4wceShzLJF94/y3jvI+91SgsNzR33dJjeekMpCKXKodzCUbUR7wOdDcSUlxtM6KO9T3fqhdj95alQ0YsKAgXQGABvLpugV9sklRqlZhmhawyJR1lCaSUVtOgq20D5DrDwjkphSlb3bzi8JtyGf6W4+n4rc24TNHIF5Ax7vBUcrx8Un05NcFsQmjlL9xe8WYeeB+CgzyS+eYGjAQOY8gM4gSYPRTibzWC7VWcN92l3M4u109WFqwimP9i26kAtLA9ETVZQYL0FYOWB70lbondNm6UQFD2doyG39edz/XbptprUk+/BBuGTEUMUJkEyTRlK6YZBDelkQXEdgcUOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199015)(6512007)(31696002)(186003)(36756003)(41300700001)(2616005)(6666004)(7416002)(5660300002)(2906002)(7406005)(53546011)(83380400001)(6506007)(26005)(8936002)(6486002)(966005)(38100700002)(31686004)(86362001)(6916009)(66556008)(316002)(4326008)(66476007)(66946007)(8676002)(478600001)(82960400001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJXd1NnaWkvM1JIS0dYN2N5OG4rTWdyMHBKWkhYdjd3TGZxaGVSYXg5aS9n?=
 =?utf-8?B?VnJqN1Z3cU4zMit0VXN5akZiTzBEVkZHSkFaanQ4RGxCdG8weEt5ekJnL1Av?=
 =?utf-8?B?cVpXQnRWZmQyZ0IwbXBkRDBLTkR0aVBFKzB1Umh3a0JFbUcwaFArSDJSZ0tT?=
 =?utf-8?B?dkFDL0Zsb2g2RXR0QzV3WkE3akN1OFVYZ2RqcVI2b2dmdmYrV1pSaTY3aENL?=
 =?utf-8?B?L0RpYjlQV0FFU2xBWUlvWVJLRm1QYjZzcm5kV01ueVpENmI3bU5QSkc1MGMy?=
 =?utf-8?B?OG10Q2NZK2R3RTlLalg2N3plMU5ac3dxWGJGU2xyWVZCVEdzTzA5YmNzSm9p?=
 =?utf-8?B?ejE3QWlBSGhmMDM2cW03bGFNb1Ywc25kcE0rb3BaQU5HTmpYeU1XdW9UZ2Jw?=
 =?utf-8?B?WkttVktNbVh2NDUrYTdUUEROSGJIbnNicmtKMVF3NU1WY3RHTFVjOURUdzFr?=
 =?utf-8?B?QnBMb2VGL0JHNEt6SEZXd1VEcGNwTWVoL0M2dnlrcU1vVlBicnpBVkZkbnhY?=
 =?utf-8?B?cE52Q3VpT3FVOHpkOHJEbStHRDBWSlh0MEtoNE45VjZKdk1vYm05SStUKzRQ?=
 =?utf-8?B?a2pBc0I0Mzd3cnZFL3JOa0FVdFJDQmdMcXU1N285Zm02WHg4S2ZtT0xiTUFS?=
 =?utf-8?B?Vjd3RUhxU2o2bHJWeHVmUHZ0cWZVZE95Ti9RSkxBMmtQWEE4dXZCSm1UeU01?=
 =?utf-8?B?WE5XMlVWaXpzYVJDUmU2a0dyL0M2dlFTWGdRblI5WTdSeHFRWXZwMndxeFZx?=
 =?utf-8?B?L3ZMMDFWR0JSRHRmazVZSElMRG13U3p5OVN5Ujcza1lKeXpteHFXemFtM2pr?=
 =?utf-8?B?UitzQlY2R29jNFFQZCtBQVBTZ0NWV0lNazArZjFkem90RG5ZQVlidlkvMno2?=
 =?utf-8?B?cEJMNEpEUURMTmtmd3MzMzhSU1lkQSs2dmJ2TmhtY0ZzVmNwRDZRb2h1TTBr?=
 =?utf-8?B?Uk1ZUVM2WkhYUjdpRmMxTHhWUEYrcFZWQ0cwZTk3aytZSFE2aUpXejRLaWNS?=
 =?utf-8?B?NzU4Sk9BcUJuS2JRZUN0TjVuOG5SQ2RSalVsTklBR0xHMFczK09RNTV2OSt2?=
 =?utf-8?B?ckgyWmd3Q01iVzU3RHdlbXdid1lsRkU0eVVrZXBEdDNYMVZQZXZsOTJrUE9i?=
 =?utf-8?B?SDRqOGVWWlhPQkRxNDBVTTI2eG8vSlh3SUpOOGpvYzRBaFZjYUhjZmZWRW8w?=
 =?utf-8?B?RDVySHF3QUtCaDJNc2d5dXdyVnMvbjk5NmdXcUpqQmN5cndpV1pFdFB1ZWlr?=
 =?utf-8?B?QmdPSy9SMWNHYVFHTXBNaXlQemdqYUU1U2lZK1RUclM0ZUNIMWRTSURscGR5?=
 =?utf-8?B?QVZzWVdvSUpnRmVGNXNBNVBrN2hYcjJHV2VJbEJBT0ZrV2EvVk9iSmZocWNq?=
 =?utf-8?B?VVFScDhVYW1takxpQkY5UVl6eWoyYS9JRlR3Wi92RUtTanRBMzZHTlQ5bWZI?=
 =?utf-8?B?a0ZrMEIvdXI1VGFHNkVuVEVlME5tN1N2QVg3U3dGcXkvckc5bmxWbDRsRC8z?=
 =?utf-8?B?VWNlNCtJYmMvUXNKdk1oU2tzRmJreGZLcFVqaG1RckExZkk5bE0rWExibS81?=
 =?utf-8?B?RWdsUGVGVks2QjVLc0hsV2lTN2NXajBrV1VJTCtGcHNNakZFMmlETUI0YkpY?=
 =?utf-8?B?RXV1WU5pVWFnRm1BOUxZNExIbzVpem9pTnV0U1VXRFFXRHF6QVkrZEs5Zm93?=
 =?utf-8?B?eFlLVXpBRWlUSGRhWUp6Nmt6MStlbWxxcU9YR1NDamw5bG1McWE3aDFJenhJ?=
 =?utf-8?B?TWlKdkhPL1h0Qy95UVRPa2dRU0VhWVIwVGtla2tJWk8xR3pTNWg2ZDExRVRK?=
 =?utf-8?B?VlBLdmJyZGVTUk1KL2svYU8wK2ROa1dscjNnQmMzMTMrQmZIdkFUamNVOElt?=
 =?utf-8?B?QWdHZVFjRGNQNWkzM2RoUW9lTU84Nm5hRnR2ajNPVDRZQ0FTeDRGZDRINkpK?=
 =?utf-8?B?Z1NmNzdOQ2xWM3dVc3BXaGQ4RWEwM1QzS0RsMityL2VQbWZzQ3d2aDhCTEpP?=
 =?utf-8?B?Vk1FdWJMY0hUWlBGRmxaRGZtSVpvS09ZTTFUUW8rYm5nUE4ycndtN2ZxOU5W?=
 =?utf-8?B?NEZTTUE0WVpmdmRlUUt2VVNZZWZZUmdYaGh3Tk1kdUdqWXlFUmpGbGdGOVhn?=
 =?utf-8?Q?kstabdzHigKUvL8/er1HBCjDo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1311be73-370b-4168-b91e-08dabb3af6e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 12:25:15.5065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR18y8gUshE6TU8zYQ1VNntXZRQcky6GbDCRK6A0Yy7fpiRP/8ke6Rvp0jCBZKrt7kTpbnnADbGXR8sQim1A3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On 2022/10/31 20:18, Jason Gunthorpe wrote:
> On Mon, Oct 31, 2022 at 06:38:45PM +0800, Yi Liu wrote:
>> Hi Jason,
>>
>> On 2022/10/26 02:17, Jason Gunthorpe wrote:
>>> This series provides an alternative container layer for VFIO implemented
>>> using iommufd. This is optional, if CONFIG_IOMMUFD is not set then it will
>>> not be compiled in.
>>>
>>> At this point iommufd can be injected by passing in a iommfd FD to
>>> VFIO_GROUP_SET_CONTAINER which will use the VFIO compat layer in iommufd
>>> to obtain the compat IOAS and then connect up all the VFIO drivers as
>>> appropriate.
>>>
>>> This is temporary stopping point, a following series will provide a way to
>>> directly open a VFIO device FD and directly connect it to IOMMUFD using
>>> native ioctls that can expose the IOMMUFD features like hwpt, future
>>> vPASID and dynamic attachment.
>>>
>>> This series, in compat mode, has passed all the qemu tests we have
>>> available, including the test suites for the Intel GVT mdev. Aside from
>>> the temporary limitation with P2P memory this is belived to be fully
>>> compatible with VFIO.
>>>
>>> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd
>>
>> In our side, we found the gvt-g test failed. Guest i915 driver stuck at
>> init phase. While with your former version  (commit ID
>> a249441ba6fd9d658f4a1b568453e3a742d12686), gvt-g test is passing.
> 
> Oh, I didn't realize you grabbed such an older version for this testing..

yeah, this was grabbed before your posting. :-)

>> noticed there a quite a few change in iommufd/pages.c from last version.
>> We are internally tracing in the gvt-g side, may also good to have your
>> attention.
> 
> syzkaller just ran into this that I was starting to investigate:
> 
> @@ -1505,7 +1505,7 @@ int iopt_pages_fill_xarray(struct iopt_pages *pages, unsigned long start_index,
>          int rc;
>   
>          pfn_reader_user_init(&user, pages);
> -       user.upages_len = last_index - start_index + 1;
> +       user.upages_len = (last_index - start_index + 1) * sizeof(*out_pages);
>          interval_tree_for_each_double_span(&span, &pages->access_itree,
> 
> It would certainly hit gvt - but you should get WARN_ON's not hangs
> 
> There is something wrong with the test suite that it isn't covering
> the above, I'm going to look into that today.

sounds to be the cause. I didn't see any significant change in vfio_main.c
that may fail gvt. So should the iommufd changes. Then we will re-run the
test after your update.:-)

-- 
Regards,
Yi Liu
