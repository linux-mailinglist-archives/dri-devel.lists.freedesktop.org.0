Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342D77F817
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9E110E492;
	Thu, 17 Aug 2023 13:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE23410E492;
 Thu, 17 Aug 2023 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692280414; x=1723816414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k+SB9KT7WHoEzKFbnpHP/Ho4UMMGBor5bH3D+yLHh5c=;
 b=WkAWzmubOK6DY0h8eTOnfkfmc3ODQSyeJL9YeR5lqcavKpm53SMwCZg1
 HNXGpgEMRvUOLStlofLCeMTNGHvFBAKgDxH3V2T7N+Pj8cwdvbeulbq9k
 bT2V/AMUkWQPNjDbBheIzn+z2kd7agl69ewQdJVuFoHMpNZD3JxcWEugb
 fzfrzhcsEc/rV0iK+X48TFDIpFci5wc4L3EqeHZntKyZXkyQmx/DMtuHM
 /MX3D1jPwLHsdU+ffoMDg8NhkCtzj/FGWAkSfjZ5g0hLqUqX7BUdb8OhP
 ZUOrXPN4HcjMXHoDTFUjejilWK/g1DJbqFdzzax0VJzeonlGnKinu3s4q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403795492"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="403795492"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 06:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878238738"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 06:53:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 06:53:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 06:53:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 06:53:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 06:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=himr1sPMPa1axAo12uWAh/Zdu0WEsTBebDjSvNKdULnFcQ4FnnTKuXK5xIMijeEdK6QTfoKLWO9w4vYqGn4g4hY4sthB0I6ixxUWoU4CHyPOzGqTikvvCRZ01IS2hINQbCBINYI6ryddW+uu2TObuNmCtgFMByTEnuEZ6kaBPftUwTYd/ZZxXr/AsOHGG22wZ81BaQ67r7NkmORmeCVGWy5vnXxc1iyTt2VmmVP0JjNksz21DZ31PYF1tJyqTNB6xtIN0ht5HpTGOxzbXGbzEmc3i4hSnmABQp/yrV9i4Vebv3uH+1g39MtrrnZJC2UuJE6YD1NMkaE6hzhCiEu1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyIbfgzvHjIAslpohJf7HuBHvQwDzp4YSBQRjZ5j+Sc=;
 b=dnC+IqIwBo29CCTD2y85/3vLGhiqJ4cI7E4QmYsZhufqkO+2Yr6lhQ05JmzfWPfZJpCPiJE7vdS4rwUgjHaNoa1LiriG8N657W6dqQk6x/5zjjmHHyA4xrpTlJrZsA5xO92J/k7yvmPRFdGEuC4Q5wt5ae67yX4/HiZLHslEr3Sd5MkK/4X7tXHs0aw6XdV3UKS+hom4kLeBx74HMCh/i/yU/Qb3whYo7LKS3v/iveSd4uDmzxX2W6xlNL+Dh0VaXcfAG5uWQD2afeDvf0UmTYD5nc43i41syvZk8vgC7XJvBOo3cZYN61OnynBBCi+Bmx3yBby3KPMBFMlEVXirOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 13:53:10 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 13:53:10 +0000
Message-ID: <7eb6917c-a894-a10a-af8c-6753ab43eb80@intel.com>
Date: Thu, 17 Aug 2023 19:22:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 00/20] DSC misc fixes
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
 <87wmxu80db.fsf@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87wmxu80db.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: ffda466c-6fc6-4d33-3701-08db9f294adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bpU264wgY4qs/N3f58GEZWf1oiRqXid8pNFy8GC2NbVbi4HOkjYFOKonKikG8XckumQwnidhpFJCLM7RJMeLIlUN7pgRqfqKdaoBMCIBAIphLZKItl/c7e4sI19eCeKe6cWGkEFp1xwEm9XbS5XsDBpfYRDHCJMpalnixJ9Pi+m5Q/Lu7qcIk1+V5riCtz27/E2w6mFp0OA/OAG8l/BEDnw2lpDDJO2pPwNnVUbFwIlZIhHHdu8foHdxhieJSWdvjp2WKmR+cm0p6MZ5+FwbAyX6IBtSChPigw7kwA1u+Xx/T0ReT6LUITCVKdnYj4a3KR0/RM6ddfzDLB1rGSBd4v61U0qtX0vHkjV6V4lO6sWg2ysWcB1facCYsUZKAC00nne+v7LmcXofmFRuXoISlIksTXKjaivMNMXguitKKvpuiS7GPxT+qPnGAPaRIYAIuYzXLZw1HEyTwgEK6rJyjqj/XQd1z5TjLpmNYU3m+kWcbxup6QWIM6kSnjzAblqyOatsS4wRiYlMrS5/QNxUYDhkCEQOSe/gvXyK4XoLe92/HtX6+a4eW8AJVXCXh7ZrbFwozb7vd2pt4lIEd9t/LovXNdxtlSGaxtdy0EgRvf3lG1W8PhfkaxfGl5kQugt/C0sYH/l2+T3cncAGe4sEn2MSs6sqCb1/2rV83xeSsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(186009)(451199024)(1800799009)(36756003)(86362001)(31696002)(31686004)(83380400001)(4326008)(8676002)(53546011)(2906002)(5660300002)(8936002)(41300700001)(55236004)(6506007)(26005)(6486002)(6666004)(2616005)(6512007)(966005)(478600001)(316002)(66946007)(82960400001)(38100700002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDZpZUxTd0w4a1BDZmJ6SHhSQjZ3dTRyRGp2RXgwYlhWS1hMNEZ5Mmw5UjVq?=
 =?utf-8?B?aWwxcEVtZkpXSktKRFAxOHNjTS9PNDI2Ukd2NUxlbm4wV0l2d291YmJkUmJ0?=
 =?utf-8?B?RVc4cUZDTG9mSk16TXFqREtrVjJuNUhyQ0t1Z1UvTlZNV21GeFg5UmtOOTMy?=
 =?utf-8?B?NElqSFhpNkE5R285YnlqSWt3a0FRc3g0K2VJdWl4OVZSODN5QW54MDFMQW5k?=
 =?utf-8?B?eTlCYm1WRHJHcnJJNjZhYVZDNGtXUUZRZzJ3RG1CQnlmd3FhK0ZxbWQ0NlZM?=
 =?utf-8?B?cVFzeTduMWFYYld1V3FVZzZhbE9ZdHFFNkdoUGVvNkwveVU2eFNZTytHblA3?=
 =?utf-8?B?SnloS3NVOFNzQnpUWkpxcHhQQ0paN2Npelc4TTJBRTFoMHN1RkxGQ3UraUg5?=
 =?utf-8?B?NW5pak1ObmhHcEdGU1F3dkhVTVNsd0Yrb1laU1AxZWg0NGkwc3ZMc05OZDZx?=
 =?utf-8?B?RTQyWUV1Y0R6U2c1azZUeXRGUFgrZlVVZzNIRStsa3VwYnBWWUt2OEEwNkFq?=
 =?utf-8?B?UFBSak5kaXZJcXRORVJjMWcxMTBtNW5xVzAvdEZBOUthZ3FubmJYeXN2QUVL?=
 =?utf-8?B?V0ZxRWM0aU5MQ2IvMXRMalUxMWI2WjBod1c2alVWZVVQUzZEdWxqbWdqZEhO?=
 =?utf-8?B?bWt4aGYzbUpGcS93Qit4cEw3NUpSNFNhVzMyaEloVVQ4SnlxSG1zQXA1MVFw?=
 =?utf-8?B?WkhRcnRvbTBRMjc1L2t3TERWVzV5MWxkdm8xK1AxNksrLzBaTlQ4VCtiYXM2?=
 =?utf-8?B?dGlGM1llKzdpUlhlbjJsK05POVpPdWFydEdHYVlnRm1XdG5aeG8rdmplYWJQ?=
 =?utf-8?B?MlNzL1RScGNRT2g4MW9McVF6ZE5ZdlkvRnRpUE5CYWdwdFlqOE5meHNmeENX?=
 =?utf-8?B?dWlsdmdpQ0Y3eENlUVlhM3AxeXJQOUQzZmN1SzNoVWJCbUNPUzRuUngzSnhj?=
 =?utf-8?B?TnFERmh3QmhvYmFiSHZmUFpTbm1laTNCQjJwMkhJOUdhSWs5S21kb1pWU05V?=
 =?utf-8?B?S3REVUZjYUhZcWVjUUI1TVF3RzRjL202T2lhMXB3SHNjYlhad3lrVzNLc28z?=
 =?utf-8?B?MTdVN0JmM3padUlxZGxlMkRrVm50QjhQQzMyMVJmQlZYTFhqd1BVS0dEM0Yw?=
 =?utf-8?B?VHdjMVFmT210dDZMWC9OSGZvbkVXeFgydVRybis2NnJkZitBMmVjL1N2QkxV?=
 =?utf-8?B?UEwyWVV3SHpDL0ZVNytWdmpvbk1HY1FRc3ZaZm41RUNDSEdxdGdzQzMyVkhD?=
 =?utf-8?B?eGo2bG5yZ2JwK2kyTWpyUWY1ZjdiMFZBVXBFT2IyOE4rZlVXdWVLYzhTZVNp?=
 =?utf-8?B?eUN6TmxDUlo1V3JIVURGM2V4b3JmMzhpT2daUmFRM3hhOXpvVkV5bXlGOXFG?=
 =?utf-8?B?MzRiT1JMSzM5d3IyQkxhRzM4YlZxb2REQWl4cGJQWlBxNG5TZ3lzZzBUa21r?=
 =?utf-8?B?Zm9HZTZPSkpQY3FyRzJVYnI3dFlvaXF2d0NuWXkzZ3VRZThGTFBhd2g4WElt?=
 =?utf-8?B?KzJ1NWFZeXNVMnFlVENZMUp0TEcvR00xRXNDWlgrMDZvTGFOK3NMdGJLLzdp?=
 =?utf-8?B?LzRscGpDcld6YXp0MGV4WFRJWGk3SWJqejJaTnVFa0pyeTV3VGp6ZitSQ2hC?=
 =?utf-8?B?aGUyOWRhay9vdC9HSHVYQ242YkFpdVVvd2tMcmVCdUVkY3dIVEgwMmc0Szd0?=
 =?utf-8?B?bFBkaXFKdWV6eGVkeFBlSjJ1bzNDTzBvNWsyRHQxb3pMczQ5TTFyNDBhbVRw?=
 =?utf-8?B?OWVtajlqbTJTS2k4S1RONFErMjlNdm5uZC80L2VMM2ppQjl3VGdCVlRydnF0?=
 =?utf-8?B?MDNwTmxzL0d6Z3lnV25xQjl3MC9mT3pjcmQ1VGgzN1hOQ2NzeWRpMnIxc2Fz?=
 =?utf-8?B?YmVPeWpzNGFBb2R3eDQ4NGtTUzZ6aVRmc0YyYWM4ODlHeDJmZVl5VkRYR3gv?=
 =?utf-8?B?czRHOXExR2hSdUxNSHpyeTRaRXpibVRkNU1FNGtGTUpvSC9vTGI1SEJvT28r?=
 =?utf-8?B?VFlzTTk2c1FXQUdNRGxkOWlBVHBBY1N0RzNjQVkxZTZmYUx2cTNvRDQzME92?=
 =?utf-8?B?dVRSc0RrRkpDM2c0RlFFcUJQU0Nwa2JsL0pobURNai9UWkt1aWRqaEJMY0Rn?=
 =?utf-8?B?Rm0vdEsxb1BSa29ENmlBUnNKQW9pWVI3bmJyWWF2c1kveXY2YUk0Y3J3WU43?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffda466c-6fc6-4d33-3701-08db9f294adf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 13:53:10.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/B/UNm1lGZpDGZ6i27cEtme6mFf8R5bXATA0sJ0yQtFOgLMennOub/0leTW2v/YBPDjVHmsMq5XVJG/M8flD39MVk2fcaodOgQdr+5tDqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/17/2023 3:19 PM, Jani Nikula wrote:
> On Thu, 10 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> This series is an attempt to address multiple issues with DSC,
>> scattered in separate existing series.
> I think it's a good idea to have one person manage the series, and
> combine it all together, because it touches the same areas.
>
> However, once you have smaller batches of patches that are all reviewed,
> send them out as smaller series, and get them merged. Re-sending and
> rebasing ready patches as part of a 19-patch series where some patches
> aren't ready has become counter-productive.
>
> Getting patches upstream is like working on a machine that has a certain
> peak throughput. Send patches one by one, and it's inefficient. Send too
> many at once, and it bogs down. Personally, I think 5-10 non-trivial
> patches at a time is about right, get them reviewed and merged, rebase
> the rest locally, and again send the next 5-10.
>
> Or you can initially send a longer series, but once the first 5-10 have
> been reviewed, send them separately.

Yeah this indeed become bloated with assortment of fixes. Should have 
separated series as they got reviewed. Will take care going forward.

For this series, I will merge the reviewed i915 patches and send a 
separate series for the drm patch#8 (drm/display/dp: Fix the DP DSC 
Receiver cap size).

Regards,

Ankit


>
>
> BR,
> Jani.
>
>
>> Patches 1-4 are DSC fixes from series to Handle BPC for HDMI2.1 PCON
>> https://patchwork.freedesktop.org/series/107550/
>>
>> Patches 5-6 are from series DSC fixes for Bigjoiner:
>> https://patchwork.freedesktop.org/series/115773/
>>
>> Patches 7-17 are based on series to add DSC fractional BPP support:
>> https://patchwork.freedesktop.org/series/111391/
>>
>> Patch 20 is to fix compressed bpc for MST DSC, from Stan's series :
>> https://patchwork.freedesktop.org/series/116179/
>>
>> Rev2: Addressed review comments from Stan, Ville.
>>
>> Rev3: Split larger patches. Separate out common helpers.
>>
>> Rev4: Rebased, fixed checkpatch warnings.
>>
>> Rev5: Addressed review comments from Stan.
>> Added a patch to check if forced dsc format can be used before forcing.
>>
>> Rev6: Addressed review comments from Stan.
>>
>> Rev7: Reordered and rebased.
>>
>> Ankit Nautiyal (19):
>>    drm/i915/dp: Consider output_format while computing dsc bpp
>>    drm/i915/dp: Move compressed bpp check with 420 format inside the
>>      helper
>>    drm/i915/dp_mst: Use output_format to get the final link bpp
>>    drm/i915/dp: Use consistent name for link bpp and compressed bpp
>>    drm/i915/dp: Update Bigjoiner interface bits for computing compressed
>>      bpp
>>    drm/i915/intel_cdclk: Add vdsc with bigjoiner constraints on min_cdlck
>>    drm/i915/dp: Remove extra logs for printing DSC info
>>    drm/display/dp: Fix the DP DSC Receiver cap size
>>    drm/i915/dp: Avoid forcing DSC BPC for MST case
>>    drm/i915/dp: Add functions to get min/max src input bpc with DSC
>>    drm/i915/dp: Check min bpc DSC limits for dsc_force_bpc also
>>    drm/i915/dp: Avoid left shift of DSC output bpp by 4
>>    drm/i915/dp: Rename helper to get DSC max pipe_bpp
>>    drm/i915/dp: Separate out functions for edp/DP for computing DSC bpp
>>    drm/i915/dp: Add DSC BPC/BPP constraints while selecting pipe bpp with
>>      DSC
>>    drm/i915/dp: Separate out function to get compressed bpp with joiner
>>    drm/i915/dp: Get optimal link config to have best compressed bpp
>>    drm/i915/dp: Check src/sink compressed bpp limit for edp
>>    drm/i915/dp: Check if force_dsc_output_format is possible
>>
>> Stanislav Lisovskiy (1):
>>    drm/i915: Query compressed bpp properly using correct DPCD and DP Spec
>>      info
>>
>>   drivers/gpu/drm/i915/display/intel_cdclk.c  |  59 +-
>>   drivers/gpu/drm/i915/display/intel_dp.c     | 655 ++++++++++++++++----
>>   drivers/gpu/drm/i915/display/intel_dp.h     |  20 +-
>>   drivers/gpu/drm/i915/display/intel_dp_mst.c |  80 +--
>>   include/drm/display/drm_dp.h                |   2 +-
>>   5 files changed, 625 insertions(+), 191 deletions(-)
