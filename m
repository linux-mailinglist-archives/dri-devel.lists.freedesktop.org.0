Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE586757BCD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 14:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96610E338;
	Tue, 18 Jul 2023 12:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE610E338
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689683332; x=1721219332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Igo9mSossM1JV4OWzdztBJxncdpLuQiV+l8+VaVgYYY=;
 b=k8NRb5I3KX7to6cJVqPE7L3LVOcm7t7Fy7vahI7jgdywD+VSDkPzLW6E
 Ftql5i+Vmrir00Tt008ziLMRp8CplKGlH334eh2nz7NOvM3xK53sZWIRt
 fnhKTNnTgip7bOIzwvBjPmOavs+zfHIQDUb0iOeHwXkYufYrK7E01wGqy
 rsz85yqCgd+yARQIPWdFQ89KUTvLJoFJPONvYtTYtq9i5W5UqpPCirlLA
 61pCQmMFS3AHmSC/nn78cwAeb81p0/q1SC51SgUgcfHOuB40L1Uavnkw5
 wD7zv2F49ASq4tHUFfvLUT9X87f2sOS2hDyA+p+qdtZZNjzegsY7tIa37 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="365067634"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="365067634"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 05:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673896589"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="673896589"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 05:28:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 05:28:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 05:28:49 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 05:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUaqFTCZ7lzX47C354b/VpaEf8RZ07/gM65bqGIkRhmfJ4sZHcLeP/2Hi3LG2GKZHURNQK1fpUF1euxT2xoLqF3qJVCMoWFcBoVVITpFNYKePNuyTve/BuhHnzLTBe4yBeYE6Ou3JFySJ+u6t795TR/9yUWNK0ibvAvXzZ57vBTWC3o6zSv5M7xIfRvwKJe8iZhlpzL/SV3tm/9J6ucf5qzXi++2+aZ2MuVEO/EB5JtwTJJh2tJDacQAbGunMOMmyglwfYFKMmkxgtA0vpVLRvaKFmzuAUh5Ppvma4ioJQW43+45gYgwdfSxEec6FF7pkGvdSOUT/fBGrjEEVvY+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i85UUkN72bwlPrSgMnrnD3i/z1ze8nNSURhwuiRfjcg=;
 b=SRo+EcQ89H0us/mZD2JcszYFKjy0Q7MpdlUC0FXn+xxfc36sJaFksocIcqJP4RQCq1vquiAZ0C/hLew/rf/DF8xahz7Yv8l0ctKemgBGzMvIcWvFlVbw1+5WjQMHK8QOE4CTHI3hK8DUVa7tnT7Qpw4FW/VB+N+rzoo9xe3hfIwCg5mQP9BcWsyM68AUfbORtBLQEV4ZAhpIzJJEZso7sgZQtY8TY5bBcdPCNjdzp4fajsYZiqtWMwucEPvZRFaKJapKzdkJb2nJvjTS2P5kqCuk9idWv61Z3/Af8/XqOBLCtfsw3H+lDj/zMcEs1YmmPvgAwyKN6v6s/AyW8jqxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Tue, 18 Jul
 2023 12:28:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:28:47 +0000
Date: Tue, 18 Jul 2023 09:28:40 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
Message-ID: <nuwcjml47rtbdmfjehtumqcnsvasjbovkbbmxv3kmoc4b7nj7a@23n22yebwz36>
References: <20230704025322.2623556-1-airlied@gmail.com>
 <20230704025322.2623556-3-airlied@gmail.com>
 <ZKhcbBHqkEmGtU6I@bombadil.infradead.org>
 <ls3fmucy6vgh2ifyqy5grxymynwhaceieacfpsiklkvscyzxdz@j4gpugiwfxuj>
 <CAMwc25qSx_O8Gah5-yeE-kFQVzqwWux35LxggMwa-WZN=OQmMQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMwc25qSx_O8Gah5-yeE-kFQVzqwWux35LxggMwa-WZN=OQmMQ@mail.gmail.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 559f4122-dcd5-441f-fc3d-08db878a88b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QIxFHeddN8HYQlgbGXcZ4KDjsvOeBJqXcKmrjF3J5PjU0OPgX+yuPVhFI40YD+OPviMwWZqFtMF0286c/pwolXIXSXGVSqCg60X8BdbJtHsz5lch/bxxCbozwhZjj8igVjCDz6P6/Qa2qYPuS8dHkjLQ0Jo1ie8t8G2VwO3CWIS+Ggz7cpRIgewKuns5ctOEzuyGGWcHJI+P7uoOmS725VCGkArhoZ7kevlBpSKwFBWd8yOo85rbTHjTl3XpNrz/Av7RKtxC8NYnbcJsU8c7GltKMU61yldEka2T/p3uIzDOdnwMOpx0y6bkwAfVDJ0JXM9h36+GUv0BhOvyjcnzJT21UGX8ZYuMaP+CBzRV4pYhsKG3Ptg2NXwf/rIKBzDWAL71rMV7Dv7sxqm0MuSC3F5VQY0EdG5W3+kw1QYSSF2g0dOQk1YvZmVrXXS8E1lAFkv4rKhkZN1UBtRb9m2elkkjkFzoafum0t7hcWR73l89AmGdBNJVTfvuRF9IQhQ2e60BnxJGJ+Mqf8B1XyPmYVlHXWdzCbv8340DeLryr8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(478600001)(8936002)(6512007)(2906002)(54906003)(966005)(316002)(4326008)(6916009)(8676002)(41300700001)(5660300002)(66476007)(6486002)(33716001)(9686003)(66556008)(66899021)(6666004)(66946007)(83380400001)(82960400001)(38100700002)(186003)(86362001)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHN5QVN4aDlLdUNOZ29IREg1bWp2TGc4cE5WMFZRUVZYN01STjZzV3NTTklI?=
 =?utf-8?B?b29wN3g5UUdIUi9NQXgxUy9sQitFUEFTclF3TzJtbWRFNVErRC83SThHMTRa?=
 =?utf-8?B?aVJzVUNpUXp5YnhnM0xmM0syVGxCUTFSdERwak5PV242Zjg4OUc0eGptR2ph?=
 =?utf-8?B?NmhId0lFVk90MmpvdmhUVHJnV3NpNC83OXBKOHJld0lYMjVhRThCcFBxUFZQ?=
 =?utf-8?B?SVhRdVVsUXQ3eVJJY3dpZnJEazVMYU01c2x0OW01TnBLcm9ZUzZPWWhOaWxJ?=
 =?utf-8?B?STdHc1FiUytHWXNzK21RUGxLU0JYY2IrYk00ODg3b1dZOGJJOGM0OHZLcEpw?=
 =?utf-8?B?THNmWW0rdHMyVzFpajlITytHOGZCZFlZSUIwcnJSQ2RRRDZZb0ErYWhQRXZJ?=
 =?utf-8?B?U3JRendIQmM1OGcvTlo3Si9iT1h1N3Z6d2NWSFVONEtJYUY1TmNudVd2dkRk?=
 =?utf-8?B?NVNIMmloQVpjSk5oTWgrNnV0S0xQN1IvQlVLRmVWWEppTHg4Sk5IdklYc3h2?=
 =?utf-8?B?ZGdrcmJ5ZjFTQWdwU2xDaExPK1ltRVBGc0FTWGh4azBvaUVVeHlIOXVMejhT?=
 =?utf-8?B?UVZvNTlqMzlmVVFKV0JLMnRmUm1aRndDNHpzeXMxYm5YblZOTFc0SVNKdk9p?=
 =?utf-8?B?UzZuaGZjdnlsckgvamxNTDYyZ0x0ZzhwQ2pXekhrVWtqa3VYaXRUc2Q0M1Vn?=
 =?utf-8?B?RlBDUlZSNktmdE1tUUtqRENMdVpvL3h4TUo0bitvRVRiY3VTYnkyQVlFdzIr?=
 =?utf-8?B?RHN3c0tZVDVaZzdJaFB0cDRNeXArWXdTeDg4cGJXaHhkYVRLZjgwSUNLUEsy?=
 =?utf-8?B?anZ1R3R0MGt0cDdhN0czVk1iaDdjd0tCZ0k3Zzc4RWNPOWpPcWdIVThqeVJ2?=
 =?utf-8?B?Tk1mMUJVNGJURE9UU3RpaFA1UzdySm5hMHlUM2Y2Nms5c2JwUWxWZEgxL2VR?=
 =?utf-8?B?Q3FKa2R5TFNVYkNnRENFM1E2VEx1WStLQ25YRUd0UHZ2NjhXS1lOY1BqQXFt?=
 =?utf-8?B?bit4UUVYVzJib1lIQm11d2t2c0FrM3diTHZrSGVNQTZPUGVzeWhnOGtlaHli?=
 =?utf-8?B?dXlvMzVWOXN5L2ErdkdWVTRKK3VET0xibU5DY2hQemFEWFN3blRXMEtCV2xI?=
 =?utf-8?B?NUJTRytLRk5XNEJ0SUZpNE9oZDdHOFNvL241RlNPWkVQOVJqNElRY2Nkbzda?=
 =?utf-8?B?cWRKdHdBck9aeWduc042RnN1aHdESXhHbmovWktSN3A1Q25WMks0YXZlN2E3?=
 =?utf-8?B?aUloUThGei9Gb1VCZWJ1TnRuWFozQ3V0TXlGL2Y3U3dReVZ0ZVUwdFRXOG41?=
 =?utf-8?B?VjR6Rk1hdTNEVVR4RThlRFptZXVDMmpRS2xGV3VOcXR6NGJ3YTlkN3B4U2xw?=
 =?utf-8?B?c3ROR2xLTlRLYkY3VGJld1c4L3dyVWg5U0JzYXNHczFxa0FtYVpDSGtpdTBW?=
 =?utf-8?B?QVhsRzEyc29DTnhpM0ltcXI1Vm1zRVd6dFA5MVowQzUxaHNaSUhlZk9uVEl2?=
 =?utf-8?B?dTBucEpoK2dDSC9IQnJOcm53KzNqQXg1bnlYNnpMQml4MEd3MndOT2pNcll4?=
 =?utf-8?B?anJKTExkclFBOVFYK2N2WHE2ejhSazVmb0p1d2JtVEhPOHVCYnJQV3k0WlhO?=
 =?utf-8?B?V3h6SUptdkszbVdlb1p3UE12TWp3NFp1U0FhWkM5VU5ZWTVyN1VIRVQvbUdV?=
 =?utf-8?B?aXJXNW85QVcxZnVtVGdCM2ZWRDRBZ2hTdDVJdTdITHVCRjBXa1NoZWZxZVU5?=
 =?utf-8?B?UG1KQ250enZ3YWd1YldkRUJKUll2Zi9yOXJVeExBRy9wVXB4MUV6VnhZdkx2?=
 =?utf-8?B?cC8yRW9YOGYrVWp6TUJrdU9jVkZGVldadWdaVEZoM2l1Z3Z1d241VG9vMXBy?=
 =?utf-8?B?OW5TRWc3bXkrT3VJZXYwbVNTTUpRdDFvdGUzRTVORXFOcHFhVXBsZFlPOUI5?=
 =?utf-8?B?dDMvS2pEcDlLTmRBalpieXFWS0IwWHVoMHJtSHk4RGswNmVJQXlJM1ZDSWhQ?=
 =?utf-8?B?Z3o1Y2xQQUd3Qyt1Y3kzcXZUQ2srV0pKNWRGL1dLbXl4U1ZyUmhjOHpYcTkz?=
 =?utf-8?B?MFpKdEcyZ0Y4MVVpN2N5MXUyTXBoVUlxd3NvQlB2YWx6bTVqcVdDYnhsL042?=
 =?utf-8?B?YTgxVjgydXZYV2lLWHkxRHl0cEZEVXIxcVNJYmlmVFdkWGNLVGRGWTFSVFRW?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 559f4122-dcd5-441f-fc3d-08db878a88b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:28:47.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hH0d5zOmN/lYfcks9YAeMcO9fgCynrqyKWhINfiZCJbiG3kyz+9knhe6U0UtFr06TJthqgQue3fHT3Kb/dD3tM2JAZNensFe0b532m7k1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, Lucas De Marchi <lucas.de.marchi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 10:52:47AM +1000, David Airlie wrote:
>On Tue, Jul 18, 2023 at 5:41 AM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>>
>> On Fri, Jul 07, 2023 at 11:41:48AM -0700, Luis Chamberlain wrote:
>> >On Tue, Jul 04, 2023 at 12:50:50PM +1000, Dave Airlie wrote:
>> >> From: Dave Airlie <airlied@redhat.com>
>> >>
>> >> This adds two tags that will go into the module info.
>> >>
>> >> The first denotes a group of firmwares, when that tag is present all
>> >> MODULE_FIRMWARE lines between the tags will be ignored by new versions of
>> >> dracut.
>> >>
>> >> The second makes an explicitly ordered group of firmwares to search for
>> >> inside a group setting. New dracut will pick the first available firmware
>> >> from this to put in the initramfs.
>> >>
>> >> Old dracut will just ignore these tags and fallback to installing all
>> >> the firmwares.
>> >>
>> >> The corresponding dracut code it at:
>> >> https://github.com/dracutdevs/dracut/pull/2309
>> >>
>> >> Cc: Luis Chamberlain <mcgrof@kernel.org>
>> >> Cc: linux-modules@vger.kernel.org
>> >> Cc: dri-devel@lists.freedesktop.org
>> >> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> >
>> >Lucas, did this end up working for you as well?
>>
>> I didn't try this yet, no. My opinion is similar to the first version of
>> this series:  this is the first case in which we are making the order of
>> 2 different keys to be relevant and it doesn't look so pretty. It may
>> also be hard to adapt some of the drivers like i915 to intertwine the 2
>> modinfo keys.
>
>This doesn't have as much reliance on order, it just relies on the
>group tags not being reordered outside the modinfos between them.
>
>>
>> However, the alternative I provided also has some flaws, so I said I'd
>> be ok continuing in this direction. Humn... how about merging part of my
>> suggestion to mitigate the duplication we have now?
>>
>>         - Document that when using a fw group, it's expected userspace
>>           will consider higher versions within a group to have higher
>>           prio and add only one of them. Thinking on a distro packaging,
>>           it could be extended to packaging fewer blobs too.
>>
>> If we agree on "firmware files within a group are version-sorted", then
>> we don't need the extra MODULE_FIRMWARE_GROUP_LIST, do we?
>
>But what is the versioning to be used, I have to be very careful to
>have this be backwards compat, and not suddenly stop pulling in some
>versions of a fw because they happen to have used a version scheme
>that this tramples.
>
>If you are saying, we need to define a firmware versioning rule, then
>that's a big task and would involve changing a bunch of things in the
>fw and drivers.
>
>i915:
>adlp_dmc_ver2_14.bin.xz
>dg2_guc_70.1.2.bin.xz
>mtl_guc_70.bin.xz

these I know would never be part of a single group. 

>
>amdgpu:
>polaris11_mec.bin.xz
>polaris11_mec2.bin.xz
>polaris11_mec_2.bin.xz
>polaris11_mec2_2.bin.xz

not sure about these

>
>I don't see what is a version field I can sort on reliably here. Now
>maybe I could introduce a new field

What I meant was to pass the entire name through `sort -V`.
Looking at a few examples in i915 of what could be within a
group:

$ modinfo i915 | grep adlp_guc | awk '{print $2}' | sort -V | head -n 3
i915/adlp_guc_69.0.3.bin
i915/adlp_guc_70.bin
i915/adlp_guc_70.1.1.bin

Unfortunately the version sort would fail for this platform that was in
the transition of full-version -> major-only. We should really prefer
i915/adlp_guc_70.bin (that is actually 70.x.y) over
i915/adlp_guc_70.1.1.bin. So for i915 this would be only forward-looking
and we wouldn't be able to add the the groups for older platforms.

>
>Do you think we should just add explicit ordering to each module group?,
>
>so we create a
>
>MODULE_FIRMWARE_GROUP_VERSIONED("nvidia/ga106/gsp/gsp-5258902.bin", 1);
>MODULE_FIRMWARE_GROUP_VERSIONED("nvidia/ga106/gsp/gsp-5303002.bin", 2);

not sure. What would be the output of this define? Maybe we can use
__COUNTER__ so we don't need the param? If with this we can use modpost
to fixup the section order, then we are back to your previous solution,
which would be nicer than the duplication we have in this one.

Lucas De Marchi

>
>and I just output group brackets + that? and fix dracut to deal with it?
>
>Dave.
>
