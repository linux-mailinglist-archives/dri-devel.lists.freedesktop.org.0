Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDE4F9958
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9310E524;
	Fri,  8 Apr 2022 15:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71D010E501;
 Fri,  8 Apr 2022 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649431544; x=1680967544;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dEauW3GLpw0PL3QQeEvZzeh41d5OUV66h6KHLqwSC8s=;
 b=cTYcNMIDmorAc3iQshWhVPh5qdsPBMw1ULNZg8dQBBo5NE5HysVQgn1O
 e88EwvFS/8IAgW9OBRXk/vHqEm08LFXyHVJcyMXje0K8EPVJRhI1P0wqb
 0TMTvEw6utkdBTroyJbgupQZpgoUqAcq38yaRNSnW7lB+mOhH28Ova95G
 7rFSXOntGijPbRZ6oMjskbEsAW7mZhC17d4fu343w1zcyHRJtrERaIA1r
 dUiKiVbCRJzWM8SKiAGbOJDhgdaxcA80eYbH8BiuzC6b7btHF7DowCge8
 rxt7ExO6m2eyRIExvurocEyuPgH4dYk34Xfzbi6wXpI9dac1BwjMt0uZF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="259214468"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="259214468"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="524812376"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 08 Apr 2022 08:23:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 08:23:50 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 08:23:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 08:23:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 08:23:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj23aPGSyfcef/16yGFSfSu+AW9NumfBB7ARgpadMyjXeM055KCEaIKcq0eWZVaBQ/UaML/itZxBeA29KsdgYLdK2FQL26uvSHvKTWzv+RZyyLlGeYhf26hKI0mCVNelZTguTQdPLfU0CZH/uwaYkJUCsSQgU9QY2hJeNeUeaDRH9lM2lRIpYumO4TEv+WHKrzLY0cVGfVOZQUBwBr7N3vfKSV4gJNWYt8GK+K6Co04YVQyJnjvpea1dAGdmSdjFH+qvv8zd9BaDHHnEKGoLNfESricwe5iF11GeKCbOK6rsXo7wuKKJRia8vkeAoRPKXfFLANXLGWHPD/dkSQv1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OG8f0hy/EB5PuIqul3CrOVVFWRxjz38xvLZaMrXX+w=;
 b=ht9ydg7XHLp8U8yNfeVGqULUGl52ID6r245Mu+g7S4/WD51EUFMd2onikIaznJ1/HYCWEPG30krmYP0aBDhX6DoYCiqUyPGuisAZbD/2vzCWylJLI3pl9JCS6tEwDW3EaDCUmtBHSGn4TJZYEbzW/RWhAL8bahGON57WAApUlDT4shqzhj/Yuso7om4D9bYmuXl6Ms9ZxZoRTf9prUOR9sOtv9/o5w9YnIXvQcj8pbX5LTpJzzM5sajnYfZ3en9K7IiKmS807Ybi0weFbh3CPSO8nI4hzwReOvFaOjuWZuxZkJpFPmBT5VJbf8sEaqlXl9bwk5GpbLaDJYjrac4FJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.26; Fri, 8 Apr 2022 15:23:48 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::905:c4c3:7416:d3e9%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 15:23:48 +0000
Message-ID: <76050092-5d2f-a79f-6775-44a6c1213f61@intel.com>
Date: Fri, 8 Apr 2022 20:53:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] drm/amd/display: Move connector debugfs to drm
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <ville.syrjala@linux.intel.com>, <swati2.sharma@intel.com>
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
 <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
 <16c42991-7b44-3eab-261a-3c60f4d1fee3@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <16c42991-7b44-3eab-261a-3c60f4d1fee3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5ca2ee-9356-4825-7cdc-08da1973c6f8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3253:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB32537BECA5C7C3A8CDE856FD8DE99@BYAPR11MB3253.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAsRclZm+CkPiumEt5+hnNCQH0kbay2g+MJeRCFuyq+dpWjY40yG9TL6H/N8iRO/DgjQORcTL1pr2kElyEPg8AxBHTszKiy7kkpqGR18VquBa2Y4iVNa1enNw7Gwzh1Y+F/ScwUcI5RYC/f+OJ09rHhQ8C5pheY70M2mPpQplsc/A5JVx1zFkXgZvWPvBp8pemjkT4tG6IKoVXb4wzciKOkYaQwtXuX1laCQUG0Epzgs2R5QdTbFUFZlvL6f7RVOKE6x/54eOedhup80paWNDRrIQIZ0npPse1JReXzpguc6ak/mpBUwv+49dM2+vgciA0UlbWJsXmyHg6DFwpfY1jdpV+xx7S9zYXTqLIiAJe+VH0HocevZlzstiiZ3IRkD6Ml6Vj8684QII5ua/35/G9uDK12bZ+gMwl39fMC5Pm9dSPjF9pZawTOs/VqmQivjllhCUQFN4axnbeq4UdbEVtcDbO2o9g3Rz+JIFvuYKAaxy3HnD2M+10cKjH49muh742Ypfycoqn8tYTo8wR5HQ++1YVR6sOdG32wZcam0Q/Crd9Zqr0Nt218PATE3JeY5lR+6xkrqCqOx+h+Phll/rwhCnMyRs/uRtlYMvNfucflyH7AIoRwN+2/fq1EScrdoCaXO55193gx8kbgxREF0BZpvcIj9929+d9ZUBbZV2wBjvOB5plQHI89/eOHQl4zZ8LDnL6C0b1622kECBhWOPxOoYnljDdS1IGkfnHLGBwsljls+Z5gTbM1GxAx4vYSZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(6486002)(966005)(38100700002)(8676002)(4326008)(26005)(186003)(66476007)(5660300002)(6666004)(66556008)(36916002)(8936002)(508600001)(83380400001)(82960400001)(36756003)(6512007)(2906002)(6636002)(316002)(31686004)(31696002)(2616005)(6506007)(86362001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTNYTkVrUVh1aVVpalJRdFBoblpXRjI3aVNycHRTQ0dTaCtDRjFjaE5mV2Z2?=
 =?utf-8?B?NGFINms1Z25oeDRHSmRVV0JtK21VTTdGbDhVdUV2SUlHSXBqR1VMUWZYK0hm?=
 =?utf-8?B?SWZXUityQm1VVGtlZkJjZmk5c1RwY3EzdWliQlJtaHRURWFnaWdteE1kSGpX?=
 =?utf-8?B?ZExhU0NDRE4rUDNQMEFHZHAvOXJwdi9iblVwY0JlWjQ1Q0Y4VDZ0YkJ5eW5W?=
 =?utf-8?B?SDlYemdMVTIwVjQ4YkJVVm5WVWZnVUM2TmZlZXlTWFhxa2t4TStuTHYya3Rr?=
 =?utf-8?B?MkZXdFJ6dWdHQnQwRGd4cGpoWDN1cmF0cGYxOTFEdThRUDRhNmY1Z3VqQ0Mr?=
 =?utf-8?B?YmsyRWJNRnhremdiS3NpT21jdkhqQmdCOE5XRC96RHdoeFlpVytOcEJRR3RS?=
 =?utf-8?B?N2RoWUMycXNMeUl6Zmxnam1mSEF3SVNydWRmSFB2TWtlTEtWdXBaVDFRWUhW?=
 =?utf-8?B?YVdsbFltNlFtaC9WYndEa055RmZodDdLVEY4WEJoWlpwM09ZRFY3MysyUnBL?=
 =?utf-8?B?ZEtQRllsUElyckgwa0pXdnZ5c0lYd3c5bkYzQ2RJbDQvblZtdmNrTjhscTFE?=
 =?utf-8?B?Y0JEdDlPZWxZaW9aRkZpVk5WdkNSVTBvRHkxMW5jaDBuaFdEUng4RUlYQy9y?=
 =?utf-8?B?Q1l0SEViMnhTWWtnRWRPbFpCRzY4SHlFakZBQkl0RVFhNUh5Ynp3T2hXYkht?=
 =?utf-8?B?QitsNUx3cXh4NS95Z2U5NHh4ZnBqWUxWRjZtMFJXRWdQL2dEakZZVnVTZ28x?=
 =?utf-8?B?SzlWT3U4aWZ6NUtSOEg2SjAvQkJXbm03NTFLdm03TEtadTlPS01KcU91TnVn?=
 =?utf-8?B?Q294dzN5Z0xNSHA0VWlwTTdCVkhqeDdsL1JHd1JZRE9jSzc0Z3ByYVJ2dmc4?=
 =?utf-8?B?cXl4K0x5QTRldWl1VmY0QlZXZ2VkQXR1eTFOWlBhSTlQRGRnOFowaFZsakJ1?=
 =?utf-8?B?Y2VzRWdpNWJiMzZxMjBiTTl0SzhOKzVwRElheUdoaVFxbWFUdGxNSVgzMDRQ?=
 =?utf-8?B?S0FNajg4VDVGRkZ5clkwV3hPUXpqRUdsM24xTHBWWlRwSnJWaWxPYVJQcmNP?=
 =?utf-8?B?eXlialJ6NzF1MU8xckxIWWZqM01ESjM1M3ZPWWhIQnJJckV0VmhyTGlicU5Z?=
 =?utf-8?B?eHRLclJVdzZGbkFXVC9pUEdkUk5aSFlVR0xPazFNWEJWTjdlNDRLWnJueENn?=
 =?utf-8?B?aGhLRFdjaHdWa1lPemhJR3krcS8yd1ViaHRBRXhvTEN4ckVyTm5TS1B6N1RD?=
 =?utf-8?B?Uld0Uk9pdlg5Ym1xd0ZsNlFqbEpUbXF5ckNJeDFFbVJEMTE5SjRpOHZTMHJL?=
 =?utf-8?B?bVRHM0Zvc0x3ZVdhNjNsNHVHSjdRMmhBRDhtTEhoaDlxY3lKVXJzWGZJOWsy?=
 =?utf-8?B?dFh2RW9OTkFJUlhxS1Z2WDRBUC9VUFdIUzc0L2YwbWhuNnhGUXRldnNDMk1t?=
 =?utf-8?B?anliaHI3V3lUVHE3QnRlcG51N3FDakdCOER5UldXZ25aK0NnVEI4Zk5ZUFpW?=
 =?utf-8?B?VHBkK3RUTjQ4M0xpeXY1Q2g3NC9GSHdIRTBMWndZR2pOVW1KdnIxZkEvaThX?=
 =?utf-8?B?VXJoMGtnVUtrbzhwMzJlOXViZEN3OXUzWTE4NE0xZ3dNTDh6U001djlHZkJw?=
 =?utf-8?B?eEpkWllzNWVTeXMvTFZIdGRmVExjL2cxamFhc2ttbGZBOHJiVDZQUVByNFNY?=
 =?utf-8?B?MHlNV3UwZkUrNmhRamwycGw4R05sL1lrazRtWTBQY1RJWHRTdy94RDkvV3ho?=
 =?utf-8?B?S0FkcnRXNDVkZldzVVdQUlBvZXk5SXh4bUZXY3ZGQ3hGdjFsWFhsS0xPSUFp?=
 =?utf-8?B?U0ptU1hnV1Q1YUVIaGVTcHd1a045ekJFVk5DK01jeVZNUXl1N1VGVmlPaTJQ?=
 =?utf-8?B?RzlXdHNiWFRKVkt6UWpZWUozMTVOUlE2eDZ6RnNaQWVYUGkvcCtNbUN5NHE1?=
 =?utf-8?B?YVIwdmxXaFBTVUIveXVmYnZnYVIzUzN4clVlTnZaQ09LbXUrYlNxdEhZQmtP?=
 =?utf-8?B?enQwUmtnMktHeG9BaVRlcG4weTJ3OXRpeS8ySml4Rks5NUJJU2VOdytCZGdx?=
 =?utf-8?B?VTJzajJJMlZuQjcrWmtRRHlrTGxHNEZaa08zTElnSG4rd3F1VjhCdFFYMXAw?=
 =?utf-8?B?Y3NldFo4QmpBQmxBdUFkTUNnaWVBZkZoY0NKRDJjY0RpV0hkUlo0Sys5OTJN?=
 =?utf-8?B?UjBDWWdxWFdXT0ZNV3hnMVBVNGcwaE1JdHhYc2MxRUkrOHcrVmJTQU00RFFH?=
 =?utf-8?B?Nk5CMWhVcjJ3TEVYVjJZOUF3WXAxcGFuYmZCS1hxclYzRHlpaUVxOGsxZk82?=
 =?utf-8?B?RnVBRnhNVjA3Y3huMkNVeGJqQUl5ZCtFNFlwSjdwUk5zbDd5eVpIdldaaklj?=
 =?utf-8?Q?mOr1OfTbvOKmVsnjc3+YJIEE62B+nxXVEK+Ye?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5ca2ee-9356-4825-7cdc-08da1973c6f8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:23:47.9578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md0DUxzLjcoW/EwNESwmfKahHwtRegtwfO7txoX+RjzsB1u0Cl3rCauY/zF4dQULzPBd1jarxqGrJ5qMiPhKdZd0eM0ERbjWGZ2nyXDheCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri-08-04-2022 08:33 pm, Harry Wentland wrote:
> 
> 
> On 2022-04-08 02:53, Bhanuprakash Modem wrote:
>> As drm_connector already have the display_info, instead of creating
>> "output_bpc" debugfs in vendor specific driver, move the logic to
>> the drm layer.
>>
>> This patch will also move "Current" bpc to the crtc debugfs from
>> connector debugfs, since we are getting this info from crtc_state.
>>
> 
> Does the amd_max_bpc test pass after this change?

We need IGT fix along with this change. And I have made the required 
changes in IGT: https://patchwork.freedesktop.org/series/102387/

- Bhanu

> 
> Harry
> 
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 --
>>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 38 +++++++------------
>>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |  2 -
>>   3 files changed, 13 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 73423b805b54..f89651c71ec7 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6615,14 +6615,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>>   	return &state->base;
>>   }
>>   
>> -#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>>   static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>>   {
>>   	crtc_debugfs_init(crtc);
>>   
>>   	return 0;
>>   }
>> -#endif
>>   
>>   static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>>   {
>> @@ -6720,9 +6718,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>>   	.enable_vblank = dm_enable_vblank,
>>   	.disable_vblank = dm_disable_vblank,
>>   	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>>   	.late_register = amdgpu_dm_crtc_late_register,
>> -#endif
>>   };
>>   
>>   static enum drm_connector_status
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> index da17ece1a2c5..3ee26083920b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
>> @@ -873,28 +873,18 @@ static int psr_capability_show(struct seq_file *m, void *data)
>>   }
>>   
>>   /*
>> - * Returns the current and maximum output bpc for the connector.
>> - * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
>> + * Returns the current bpc for the crtc.
>> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_bpc
>>    */
>> -static int output_bpc_show(struct seq_file *m, void *data)
>> +static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
>>   {
>> -	struct drm_connector *connector = m->private;
>> -	struct drm_device *dev = connector->dev;
>> -	struct drm_crtc *crtc = NULL;
>> +	struct drm_crtc *crtc = m->private;
>> +	struct drm_device *dev = crtc->dev;
>>   	struct dm_crtc_state *dm_crtc_state = NULL;
>>   	int res = -ENODEV;
>>   	unsigned int bpc;
>>   
>>   	mutex_lock(&dev->mode_config.mutex);
>> -	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> -
>> -	if (connector->state == NULL)
>> -		goto unlock;
>> -
>> -	crtc = connector->state->crtc;
>> -	if (crtc == NULL)
>> -		goto unlock;
>> -
>>   	drm_modeset_lock(&crtc->mutex, NULL);
>>   	if (crtc->state == NULL)
>>   		goto unlock;
>> @@ -924,18 +914,15 @@ static int output_bpc_show(struct seq_file *m, void *data)
>>   	}
>>   
>>   	seq_printf(m, "Current: %u\n", bpc);
>> -	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
>>   	res = 0;
>>   
>>   unlock:
>> -	if (crtc)
>> -		drm_modeset_unlock(&crtc->mutex);
>> -
>> -	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +	drm_modeset_unlock(&crtc->mutex);
>>   	mutex_unlock(&dev->mode_config.mutex);
>>   
>>   	return res;
>>   }
>> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
>>   
>>   /*
>>    * Example usage:
>> @@ -2541,7 +2528,6 @@ static int target_backlight_show(struct seq_file *m, void *unused)
>>   DEFINE_SHOW_ATTRIBUTE(dp_dsc_fec_support);
>>   DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
>>   DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
>> -DEFINE_SHOW_ATTRIBUTE(output_bpc);
>>   DEFINE_SHOW_ATTRIBUTE(dp_lttpr_status);
>>   #ifdef CONFIG_DRM_AMD_DC_HDCP
>>   DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
>> @@ -2788,7 +2774,6 @@ static const struct {
>>   	const struct file_operations *fops;
>>   } connector_debugfs_entries[] = {
>>   		{"force_yuv420_output", &force_yuv420_output_fops},
>> -		{"output_bpc", &output_bpc_fops},
>>   		{"trigger_hotplug", &trigger_hotplug_debugfs_fops},
>>   		{"internal_display", &internal_display_fops}
>>   };
>> @@ -3172,9 +3157,10 @@ static int crc_win_update_get(void *data, u64 *val)
>>   
>>   DEFINE_DEBUGFS_ATTRIBUTE(crc_win_update_fops, crc_win_update_get,
>>   			 crc_win_update_set, "%llu\n");
>> -
>> +#endif
>>   void crtc_debugfs_init(struct drm_crtc *crtc)
>>   {
>> +#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
>>   	struct dentry *dir = debugfs_lookup("crc", crtc->debugfs_entry);
>>   
>>   	if (!dir)
>> @@ -3190,9 +3176,11 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>>   				   &crc_win_y_end_fops);
>>   	debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
>>   				   &crc_win_update_fops);
>> -
>> -}
>>   #endif
>> +	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
>> +			    crtc, &amdgpu_current_bpc_fops);
>> +}
>> +
>>   /*
>>    * Writes DTN log state to the user supplied buffer.
>>    * Example usage: cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>> index 3366cb644053..071200473c27 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>> @@ -31,8 +31,6 @@
>>   
>>   void connector_debugfs_init(struct amdgpu_dm_connector *connector);
>>   void dtn_debugfs_init(struct amdgpu_device *adev);
>> -#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>>   void crtc_debugfs_init(struct drm_crtc *crtc);
>> -#endif
>>   
>>   #endif
> 

