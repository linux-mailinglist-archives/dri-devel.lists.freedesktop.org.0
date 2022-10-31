Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71A6133C3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 11:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65E88DA9;
	Mon, 31 Oct 2022 10:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E89510E190;
 Mon, 31 Oct 2022 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667212706; x=1698748706;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5NnA48ZX3VY5BT5H7bLTVoZrVVPezpOVIWaegytPDyI=;
 b=JFfAlrQTr3CgLagtnYoFIhALGnMp8DDdmwArzOksJzpVGfSjS0lCQBI2
 CCow9ydXqN/gSqyQW6+Dr50IjLf/E374g6dRLwdV6enc0KijXHxwxXpen
 XeRFxsMznXVQEwOa1jIT5WvqyrB1vggT9EoAfowoL2OnEnQ6Ix+Uou37o
 AYYn7/fRil/GsMkM8rmmfTxtI6nQ7EHYoZmALocTovVfrHc9pSz6ovRN7
 3oNzGgXNtcXf5C5rw40X5e2TZasrFO5qsCwAej+gS+KepUTTTDGIjIrUG
 yRnxLjH4I+fN/UTRmxu/0XDegjk9jFbneVhb6FesBWaB7a8+yhPKAnVXJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="292159692"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="292159692"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="722768354"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="722768354"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2022 03:38:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 03:38:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 03:38:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 03:38:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbCRV/iigLqpRUEs9NCLFlcX1vhAiWQTUM39JbRge1n6RfK6YwdcOteMkgxXmV7igToCTlj3ntAcuALZk6waZRQwhuNZjUCioo/EaOpEoJFba7VLcYBA3sS4Glb7K6bQ+NW/b+jPUbeZkywU+kTFnVUD+Nacz3JrXBnGYAUaZbNMG3itBAtjWAbZTRPGcaOs+qcpRhb/G1uW5FuB0abZCLqsXH2I7TiikrsWwLyUyPcSfWVeMAHCj3a4NHzhKG8MYyDC5BCUx9OCg87m+Mc+kHbyHPtWTL8XmMNb/H6D+FjjihnyammK+j0fcqIATcEAe2WuH8ch1u0wT/FHRTd3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7FrEOUwW+MrNtRwDKi8uUEP5XtLs++S4CtVqjHaHo4=;
 b=I92ZGNV5gkROo4q42/m6rejOEDD2TBUsqVnQt3J/Wmo2zYDWENFAmhHaNYjZTBI1z1KnFinUkIvO3DK8i4mUriNEZ5XxOGAuitzESmHrDPCMAAwUnMuJPGuQFAd6V6zYhoGFriWzWfd7OCXnlPm1nJgKHFZmZmRPyPjs02+mOpTa0Odh7/EqsiMQV3JDTG/9WMOifL+IoT7ZtYuR61dHlaiiEG13H8m9+NaXLfSq6z+VQp8MfjnZKwioZAs+pYZup+6i/H+Q5QBZWPXpdFPtWEHd+larVcwqcsUi9bD7TJ/kxiE9QIX+F5RgT3vD96LNbL3ysxiKRkN0NliQMxGJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 10:38:21 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::37e3:9536:43ed:2ecf%5]) with mapi id 15.20.5769.016; Mon, 31 Oct 2022
 10:38:21 +0000
Message-ID: <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
Date: Mon, 31 Oct 2022 18:38:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
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
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 82937d22-c805-49c7-cc09-08dabb2c07c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jV/7JHLc8NPmtX5kQg8mLfgPx1C/7qkmFcuvgfzo1DlZb+J0LAxDJTS52qWEcoLZX29idvPf2E0Uo5xn4shOhPbm4hY8FHWZNw+UyORA2+M7At5yvxCerA4yOMECAthKRe0ooCJyfVJ0kmv6ef8dpN0fFYxNR5kq9X12srMWft0km+WD6rmo5Wq0Ri4vZEo/o20HnDMcjSDWUlJ38khALZeMsif4Fz8vhP8qy6JplMM1VGnud4iIIapC8wHgPLkayh6vDoIxshecoOH3l6ls0/kjMEycmYWCmDnJF8YTV7TIjO87N+uxIP8p250nrEfToN4RTedOwG0etNdr7vKSLMUbFLGYetXilai2bLP45nm7bF0yG3tFRS0LaUAje6quxHN1TrqHG9Z0xyHurEVozv7jbDZ4SD8wV/DY9WCGPVeQFW70oDXXyqm75yAHO19MMlOzsdncJ/JGKuWuNQUQ7J2A5yQb9kHn9FT+y9GHiGh7m/VA2VikmiQzEr+wKN+0FFbFFDunzlNyHSLQupoJ+ufgH9Ln0LmOnavQrhSU1GHUo0w2/FVVwAh/GlIgze7d0TVPURBVuMwieimZy0DY34ELNXxOqRNIF0KSAjKdf2+vYEA0YFKYzggXsg4sadZpSIvmyiQVi+XUzimkHknbLjv0HrN/fDA1pQkb37ZZ3zvWQa/ackoCSFQnWGMNg6W/UWKBUx5BmY2f9lmz9YjPY00oD0cuhM+MS951GFM725SSFOE6B0NZjX95u+K/o0omohXfer5FCJoyrgMaC4Yy/QaZBcd3sXP7CUiLK2gn3Y79WSOIhrBWfrMPeignMjECjA1s9HtrdRZOsTPFW7B/QG2je7iwtWr9UUX4r2WQTNPF5FMaDWGbYXQKMnUVj6jAWhjdXJeaIQaBHgDL7h+W/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(82960400001)(38100700002)(921005)(36756003)(86362001)(31696002)(2906002)(6486002)(966005)(6666004)(478600001)(7406005)(8676002)(316002)(6506007)(8936002)(4326008)(66946007)(66556008)(66476007)(7416002)(6636002)(54906003)(41300700001)(5660300002)(110136005)(2616005)(186003)(53546011)(26005)(6512007)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V21LTjhNaFlOOTVPQ1BmRDdwZTZac05LVDRGWFlsK1VuUmhtWURJRFNmak5i?=
 =?utf-8?B?dis3a1Nkakl1UWZ1R1Mvcnljckx3bFlsZXlVZWwrbnVlNFhmUGRKWkRlcFQ1?=
 =?utf-8?B?QWpidktHNjljcG0xaXFxdXJUdC8wOGR2TVJjdnI0OU9ia3VSeXNQMXlUcnNJ?=
 =?utf-8?B?akIzNHlmcHZyalcyb0x5KzJubmdlaWVRTGliMG5zR1lDSDJGVndGbDJNYlZ1?=
 =?utf-8?B?VXlSS09VNlVwZnVsZk85M3dSMDl3VkYwcTdUajQzanpEVWM3WmhONi9JaDVY?=
 =?utf-8?B?YXFHcHFWRUoyT3AwWW8wWDlVWStNeC9ZTTRXdHJsUnNyMkNMUk01Vnpsbmh6?=
 =?utf-8?B?WXZmdWFXU3RzVk5Ta2RJcWRzakE3OC9QUzUwMWlVb0Rsb1ppcVhTNkdqdTdV?=
 =?utf-8?B?cEorZlB6V1V1RjdaKys3ODk4bzB2T2I0SmZVb25JSUs0R3FyZmVUM0R6ekli?=
 =?utf-8?B?aEk2OGRqdFg5Ymp1QkhkTzZTOUJOVkwwcTlHclRqelZWZGl5SHdHN3JYMmc5?=
 =?utf-8?B?MEdmMUs1YzRrc1c5ZGw0cGFESU9IdjlIR2lSUXhNODIybXdxWE9aT09pUlNj?=
 =?utf-8?B?RUhQMm5SNlBNcG00OGpzRE91aExSRW1NQm8yNDBiaHlRNnhCRXFoR3pZc25r?=
 =?utf-8?B?M2ZSRDdWN3dQenM2UzhpUEtVUWk4WWQ2ZmNFN0o0QXhITHJWbGIrcHBsN1lI?=
 =?utf-8?B?Q0xScUQrNGFhUUxTdGw1OXN6d2RQNmt3Y2xLVC9WN0NHSnFmRDEzcTRtZ2tQ?=
 =?utf-8?B?c0Zac3NBZnhxdm9JTkN2OS9qcG5GdzlLbVkwSi9QYVdMM2F4UEMvTUR3RnlV?=
 =?utf-8?B?T0UybGU3dVRTVmtTR1U1Y1BJWmVWd3dvcUpuanhBTmJGL1B1d0hJWURWMFJP?=
 =?utf-8?B?TTMyVnhOd3JFSjhLYVJrSzNRa1NxVVd2anRmOVVYSEkxOUhtZG4xS3N6Zkpw?=
 =?utf-8?B?UlhMU0kwYm51elMvOUFmcG1wc3VINXhVaExmdE1FSDcxVUhtbTYrd1lmaVlJ?=
 =?utf-8?B?MzByb3kxLzFISkJTNU1jSC90L0VaUS9ucEFDMlp1Z2NTTUNXR0dIYjUra21h?=
 =?utf-8?B?Y01FeVNJSUFMWjFGSUwvak1EVzVNMUFWQ1NPdU4zM1VtZ2xyYWt6blJRU01M?=
 =?utf-8?B?L0hZNEVocmhQWmVlZzY1QjFMOGdzM05USlZBTCtQZThOUnllNGppNlZCTWJC?=
 =?utf-8?B?YXlkMlhSSDcwZUpRU3RxWG9HclhFcFYyTWFnTjZUVVVCVDRSU2dwMk0wcm9V?=
 =?utf-8?B?YjBxMUNvVXJJckoyYkx3cVhzV0JIUkg3ME9seG83SnhOZXRONzc0RnhhbCtO?=
 =?utf-8?B?ZlBWZ3AzNEwrQjRVZUp3ZTVHWU5zaEk4Yy96RGhueXI4UTVMSi8zYWdQTnFW?=
 =?utf-8?B?ZlhOZjFialFvQzJZUk1DajdyV2FZamhqRzFaS3FzQXVhRExrTmZXa2RRU0VK?=
 =?utf-8?B?b2JYT2d3V0dPOFhrRDZZMlpNZnlFMmRYcmFWb1U0ZmtNNUpJWWNvUUxkeDRN?=
 =?utf-8?B?NGhsVzdtMTFGZngrU1pWbVptV2xjc3FQT3Z0cDRhUW9Wdzd4TE5LUHdGRTFB?=
 =?utf-8?B?eFQwV3g3YVBORmxmQlpZeFAvUjBvSURGVi84eUZXZ3AzRDBUUnJWVHZKOHVG?=
 =?utf-8?B?NzVyMHRUOGY5SnpRRlFxRW1UcHgvcDkxWmNadzRtK0ZiNkdPMEl0cTcyMmlI?=
 =?utf-8?B?TWJRQ3dXb29Ca3RvQmd2M29EWWJtMStjL0Y2SzY3ak96NHp4NUZqYmRlcmpp?=
 =?utf-8?B?bStYV1MrbWp3UlJkNXYzeFhCU3FacjNyL3E5RlQ0dUNnUFJDenJjbHAzZkdl?=
 =?utf-8?B?SHlrd1JLRVlYOHFZMlA0T2FqL2dBQ2xXNjdWanNhUDFKSk9SUVVOeUVHQ2ND?=
 =?utf-8?B?NUtWOXl0OTRmWFZENnBjc1RlZnZWcFdOVmlUYm1mY0Q0cjVzU0hSTVhYcHVj?=
 =?utf-8?B?SkpNeiswVXU1bmFNUkgvbjZmeWw5ZW5Nc3BWUjZlSlVDblRJS1VIS21TTUk2?=
 =?utf-8?B?dGZ2dWhNMFlIUldlVHRPZm42TVFBUGV6c0U1OGhPV0JkWDRTeW45azZ5TzJv?=
 =?utf-8?B?Q2hPV3RhbEdmdC9sWlh5L2lxYmN5SmFNMVJSS2RsN3p2WHh5TFVtZUJpY2li?=
 =?utf-8?Q?mH7OSqWQcwcHheDBhCwjSffKI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82937d22-c805-49c7-cc09-08dabb2c07c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 10:38:21.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62AfrJE5Bx/Q9u52s5yBGdYIZkAJWY2xZB5WkgfkmFyX/+z2aC7po7xvUrCSVO3LOQQTQ0rsTm2D6kedBKBumQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
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

Hi Jason,

On 2022/10/26 02:17, Jason Gunthorpe wrote:
> This series provides an alternative container layer for VFIO implemented
> using iommufd. This is optional, if CONFIG_IOMMUFD is not set then it will
> not be compiled in.
> 
> At this point iommufd can be injected by passing in a iommfd FD to
> VFIO_GROUP_SET_CONTAINER which will use the VFIO compat layer in iommufd
> to obtain the compat IOAS and then connect up all the VFIO drivers as
> appropriate.
> 
> This is temporary stopping point, a following series will provide a way to
> directly open a VFIO device FD and directly connect it to IOMMUFD using
> native ioctls that can expose the IOMMUFD features like hwpt, future
> vPASID and dynamic attachment.
> 
> This series, in compat mode, has passed all the qemu tests we have
> available, including the test suites for the Intel GVT mdev. Aside from
> the temporary limitation with P2P memory this is belived to be fully
> compatible with VFIO.
> 
> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd

In our side, we found the gvt-g test failed. Guest i915 driver stuck at
init phase. While with your former version  (commit ID 
a249441ba6fd9d658f4a1b568453e3a742d12686), gvt-g test is passing. I
noticed there a quite a few change in iommufd/pages.c from last version.
We are internally tracing in the gvt-g side, may also good to have your
attention.

> It requires the iommufd series:
> 
> https://lore.kernel.org/r/0-v3-402a7d6459de+24b-iommufd_jgg@nvidia.com
> 
> Jason Gunthorpe (10):
>    vfio: Move vfio_device driver open/close code to a function
>    vfio: Move vfio_device_assign_container() into
>      vfio_device_first_open()
>    vfio: Rename vfio_device_assign/unassign_container()
>    vfio: Move storage of allow_unsafe_interrupts to vfio_main.c
>    vfio: Use IOMMU_CAP_ENFORCE_CACHE_COHERENCY for
>      vfio_file_enforced_coherent()
>    vfio-iommufd: Allow iommufd to be used in place of a container fd
>    vfio-iommufd: Support iommufd for physical VFIO devices
>    vfio-iommufd: Support iommufd for emulated VFIO devices
>    vfio: Make vfio_container optionally compiled
>    iommufd: Allow iommufd to supply /dev/vfio/vfio
> 
>   drivers/gpu/drm/i915/gvt/kvmgt.c              |   3 +
>   drivers/iommu/iommufd/Kconfig                 |  12 +
>   drivers/iommu/iommufd/main.c                  |  35 +-
>   drivers/s390/cio/vfio_ccw_ops.c               |   3 +
>   drivers/s390/crypto/vfio_ap_ops.c             |   3 +
>   drivers/vfio/Kconfig                          |  38 ++-
>   drivers/vfio/Makefile                         |   5 +-
>   drivers/vfio/container.c                      | 136 ++------
>   drivers/vfio/fsl-mc/vfio_fsl_mc.c             |   3 +
>   drivers/vfio/iommufd.c                        | 161 +++++++++
>   .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   6 +
>   drivers/vfio/pci/mlx5/main.c                  |   3 +
>   drivers/vfio/pci/vfio_pci.c                   |   3 +
>   drivers/vfio/platform/vfio_amba.c             |   3 +
>   drivers/vfio/platform/vfio_platform.c         |   3 +
>   drivers/vfio/vfio.h                           | 100 +++++-
>   drivers/vfio/vfio_iommu_type1.c               |   5 +-
>   drivers/vfio/vfio_main.c                      | 318 ++++++++++++++----
>   include/linux/vfio.h                          |  39 +++
>   19 files changed, 681 insertions(+), 198 deletions(-)
>   create mode 100644 drivers/vfio/iommufd.c
> 
> 
> base-commit: 3bec937e94942a6aee8854be1c1f5cc2b92d15e2

-- 
Regards,
Yi Liu

