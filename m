Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 486915B91BB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1910E1DA;
	Thu, 15 Sep 2022 00:34:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C156510E1DA;
 Thu, 15 Sep 2022 00:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663202077; x=1694738077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ia0fwegOXUa59BgflByEi5vdYCSLS6CVs5ERT0b89Y4=;
 b=N7m3iTCqEZG02M1FbX9Um91qSnqeconaLXgwwvfpmS86Di8NKFc7osmz
 P5dOD7rXVQDSd4/ztRk6YAeEZQ79xv4dF/cjJRrAoB1dwiyf1G5TfFl0X
 F1P6VqOlFXkGjFS4vgYeY+YL3xJTP0Oip6cctB7HBgqniZptlxPB+vsba
 Sgm6U57qFjqomUO+ia0KYsqXQNU4k1uT5ByTjtotUqvlGllWeMhNCdIEE
 lHbxqTYXA0bvQFyfRFwk58IykdSmT8+m2px81ANFQGYiE98NgAtcFPNul
 0A7L6MT/R3RWq5iq/K8whOj37mGk5FJ5yp30O0YTH7mu9hidNhPFXT7RR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="298573319"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="298573319"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 17:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="706146276"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 17:34:37 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 17:34:37 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 17:34:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 17:34:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 17:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn8oh2ZvklUXU6CgPMR8RJkBSCxdGl08yP/knr6BM6zl8Qe3Ypy8UgC7aKFCt1z1mpgUMGpzVpJ6mWzaM+yPMTMbXN8vvA+iOFTsC1Rh4qSn7XhSg5zREqKYHZ6h/DSqY2vdccjrITwq/rHHvYAriEMyu94w1/Ph2dlaoa9HBQEmGScdpfMsvpaMYJIqNuW5g27C5hPEbKtIyZBi6KDhFIjSDvDbXFKWSS1UrE3KUyeJ737W2I4aOBAV7iiY8SeCVJJswqOeFc2gufZcIpFWHlj7HJoShudlj13YQj4Ar3LiWDDLSX+VuuO2ygDE95aNSDEZ1h3N9HzEd5rcuNsAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVyV5BvPFIRl0dKTilIlp3HF2MWPfdxcHEAEe5nfcrA=;
 b=JH1x76XQOfEsBkTq+h6hdXtgWyj7K74vFWuxP5z/WlvLY+mPlBKWfGsvoStrF/TKuYIFbXhrKnL5llBaP2ul2g/al01cG3siaFASzYQggDtjU1WGsy4MBdTU1kRoIlcDVtcuT53piCSn6xSRU77D/c9D24Bw7GtYH0aGVyGSG6Hlx8uVAiAZoialPQIGhvpXHlZw2G/8OyKXMIIaUCQnA95FeHXVU0Up9DMJqw8jqL/2t9aEWlDzkqBT0E76HEtbfV2386ymMyLWyien4+/5k9ErpSzNnhKqWcCLovncERs/eAr+Eu6thXmQZVOOPX73KENzf2GzU0IkfLBszR6rZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.16; Thu, 15 Sep 2022 00:34:34 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::c057:13f9:7c74:62b4]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::c057:13f9:7c74:62b4%4]) with mapi id 15.20.5632.014; Thu, 15 Sep 2022
 00:34:34 +0000
Message-ID: <5526d4b0-5361-6714-dbf5-29751a452024@intel.com>
Date: Wed, 14 Sep 2022 17:34:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] drm/i915/guc: Fix release build bug in 'remove log
 size module parameters'
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220913010929.2734885-1-John.C.Harrison@Intel.com>
 <20220913010929.2734885-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220913010929.2734885-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::7) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4e5a25-97d2-4e7f-bf05-08da96b20f99
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/fciKvcwSuQ+ZR4jV5rQg+i83r/jrMqd+VMuohmiGt2w4IiindpTIUJzjD9t+mGV9vWVKZYrcr5QZ1FrSGoNR5Abv6Y9rzoI7EnSDVNedYHu0kxDWtj7MkqiC+K71pEYg1G/d21q6pg1Ms3Led+QmVcWEROowlp8TjvgJuDFns6mCJMRqwG0r7O+Q3+HnltxQXH12f7vljO7ZoXg4gEYihpohKv4ms4XnR9YquCjjcXrcptIthFbqhjxMCNaEqzyS3H0ghkGQj66m9ays6wbc6fjR28EhYPCGmCqdgIcMUfTZYTNXXTTk/S/caZPXV+Sjnw4C45Or9mYAbY9UgrYVchUNUQuFg4I8OJfKiMPkMY3mkPeyrYWTP6BmTLPDIkmDSiKHqANpyzWtgdfHbs5zr1x0NYDqEb2WpTf9MW3Ze7zRAJgCu7IyxI1Hy3lq+/5/yNue5rpqk4Hd+5Ga9VBEpHDGGF9+gB9sQj+m0efU7k8jWVJWibs5z0ivCZKhXVi/zeToPNoqtuNBrFgM5b8vMa3EqweIeUSpxz4swIAfcCTJx2MWBik6UbpK9FdjMOBfnWHy46HKNukt3V0kiUOLXMQjpLaFo4eGy5/0WfjVBuUsWJaaPRDzvGqbiQtB5tEmZh9lmZsmukK5MsKjzo0kj5Nm5EblO5VsR7gmQyuNzOL4qK6JqT/cJCgiXB5ZpoUSirQBgPgSb/H5yD9kQ5VTFSWA9VvixP32HJTBjKpfLCMg9P/0JXjXp15G1vpzgRlsWqSaWkQXlltowfqr7AR8C+5Qr+uNCt7ei6o/VrgYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(66476007)(186003)(66556008)(26005)(8676002)(4326008)(38100700002)(31696002)(86362001)(6486002)(8936002)(31686004)(54906003)(2906002)(6666004)(6512007)(6506007)(53546011)(316002)(66946007)(5660300002)(36756003)(478600001)(83380400001)(2616005)(82960400001)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHk0dGFYL2dNS09aOWMrNjJEM1RYeUJGS0ZldXNFQjI4VUpYa01ZcVcyS29Z?=
 =?utf-8?B?S2IvMENDM0ZwNXVQTzlnaWFvd2hPNWQrRHp0QlVsbUErOGIxWmdma25KK3p1?=
 =?utf-8?B?MVdIZ2kwczhCOTFMMCtYWTBzM3FTS3p1WnNKTTRjOENwbmRQcVJTcHYwYmpX?=
 =?utf-8?B?bXlmd084NkovSGhBN0ZsUHhSZFJpZnpVSXR1Snk0T1d6aG80S2pITlJWOUt6?=
 =?utf-8?B?L0JaUDJCMDBUNjVOL1FzTGI4MUlmQzViNWFtQlNJQkRUVVlnTWlGRzNTNWc0?=
 =?utf-8?B?UmhIaURWOUROc0pMVW00R2pUbElMSmliZlBuNFBFU28rWnBOQU5BQ1VrTDlO?=
 =?utf-8?B?ZGRLNjFZejhCTHljVHExR0p1SXNkb0l0SnVOYVhlTVFkbGxteDNDODBxbWlq?=
 =?utf-8?B?b2I3azZlUGxTdnUxdEZ1ZGhaZDFIYXhwQ0U1YlE2bHpVMjg2YmRsQUJOanA0?=
 =?utf-8?B?VzRTYUhJdUhYNzFCcWM3dFZPLzdnRU1jUG5sdVk0a1RFY3d6SGlpc0drQ3NB?=
 =?utf-8?B?bWJ3Y3JLSlZJZDhYT3ZjcC85NnNiVkp0TjhyeWlkbkw4VUtMS2d0aFE2OUEw?=
 =?utf-8?B?dTZJTTE1YjNXTzA4MmhyOUpNQWFRd1pSek1ML25qc2hKbHZSdDNvSm4wVzFx?=
 =?utf-8?B?RnZBZG1EMkl0WEQwOUV2emluQzU0T2lzbGNOdjkxQTRxMEpXTTZUVDFlTTJm?=
 =?utf-8?B?UnQxOGlzVE5LeThDbGl0alhaWlEycXNVcGh1VkdvUzZWTmZDa3BQMG5PYW9o?=
 =?utf-8?B?NmJXS0I2cFhHbStmZVVzWXVIVHBhd1o1SW1OWlN5ZVBtZi9jT08rVFVZSFdR?=
 =?utf-8?B?THRGK01jT1BjYlBUUm8wSHdMMStDREI5Y3dMamRqbUQvSXdnekoxYnBwNGh6?=
 =?utf-8?B?MlNWV1I4aWliQW9FUVpLbE1wODZXNVRyK3ZDb2FqYXdWWml3MTVmOERPM2Q4?=
 =?utf-8?B?UE8vcEVtY1c2eCtDZ0NLcnhBOFZNa1dsdXlmU1B4NkFka01GWFpuU0tJWHhs?=
 =?utf-8?B?M3NBZDlUVHZrY2F2dGtKSDV4b0I2VmJCaUxhMjF5QjRPdTZEOUMxMUZ3R3U0?=
 =?utf-8?B?VVB6Z2JTeVRJOFNVdXQ1UE9tajdLNEVZUTNMMHNaR1dXalZGV2paRmFxbVhP?=
 =?utf-8?B?TlV5TjEzR3FXanRnTnNZWWh2ak05TGJOeS9hU1k1Wk9xVTNGYUcxQ3JINVlH?=
 =?utf-8?B?aTFGMUt4SnBUdFhqUFBVUXB4QTZoSDVweVZYbVIvVjhoM3lHcEFrcS9JZ1hl?=
 =?utf-8?B?SFdOM3hmdUpVWW93cnc0WkRXZ3RFWDdoUnorRXYxcjF3YkZqT1k2K2xuZkk5?=
 =?utf-8?B?RE9EbmpCL0VUNWM4TUpkbXJOUDdtWGNvRnQ3cW9lNjJGcEhLNHVmUHdJeHlH?=
 =?utf-8?B?TjZ0b1FZQzlWTGFqV29xT3VZenpIc2xRQ3pCMklEMUdwTDFhVFBBTjRzTlEy?=
 =?utf-8?B?cW9WOG5xNGMrbUwrOTFEYjhWVTJUcjBzV21LYkF2V2VDUCt4d0svalNiOVJn?=
 =?utf-8?B?Q0RPZkw4OW9LaVQ0VlNSVzQ2MmtrNlRDb3JLS3RTRTJjNFBiT1lVRmRXaG5i?=
 =?utf-8?B?b0FRcGRZUTBsdnhRNUMxVjR4ME5kSGwvVWI2SnBKQ0U1SGhOYmJUTU4wSzFP?=
 =?utf-8?B?R0Y5SWU3L2FmZnpjTERXVEYzVWJJQ09Ub2dQUGdablAzY1BiZno1cDNtNUFS?=
 =?utf-8?B?ZUJJVEg0UVZFOEs3NW0zSkxWa2JDRHkzbnlXYjBmWW5nTTN3dHgram8wVDFP?=
 =?utf-8?B?VVoyVXhEbVBzQWlHVTVDV3NzOFpqY1IrQmYvNmxhYVhJR3ZPNFViZ1BXTFJr?=
 =?utf-8?B?dGxZbmdib1Qvd3p0ODBheGIwdXAyVnk4bGo4Y0F2SzFEaTYxU2Uyb0JtODUy?=
 =?utf-8?B?Q0g4Q2pWaWFzNTVraCthaTZyWmhhcUxHOHV2eVRYc3JnWkdBaDFWdmMrdUVi?=
 =?utf-8?B?Um9lL0w3Ujl6T1VNa2d6eTFZbkc3UTd5VHBoNzFzMTltWnZpMVJZaEMvZ1Rh?=
 =?utf-8?B?cVBydXRNYVJRTWJDOHJhc243aDZQYlp2ZHVkWk1oa1JUdFFoUXA5aU1SclhS?=
 =?utf-8?B?bGNUZ3JWdHhBTU81ZEZiR1Y1T1lVaXV6dWRtTlliSXNCMHR6dk1tRnN1aGVK?=
 =?utf-8?B?MVlnUlkvS1BLNDI1eitsNTlKTGlRR0N6eUdxOFVJdjE4S0hlVmhWRUdRMlZa?=
 =?utf-8?Q?2xef2OjF/MLTaFoKb9s692I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4e5a25-97d2-4e7f-bf05-08da96b20f99
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 00:34:34.0799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6z5yAjiogTL/r5FmMIZDWtg9gVFytbVbkMTVmQTqKlJbolFgaSB4tXBW0ODLV1iaM1yWd4pqB5cp9o6Duq5oCaP11LxtFYibzmtP/dPtOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Julia
 Lawall <Julia.Lawall@inria.fr>, DRI-Devel@Lists.FreeDesktop.Org, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/12/2022 6:09 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A patch was merged to remove the GuC log size override module
> parameters. That patch was broken and caused kernel error messages on
> boot in non CONFIG_DEBUG_GUC|GEM builds:
> [   12.085121] i915 0000:00:02.0: [drm] *ERROR* Zero GuC log crash dump size!
> [   12.092035] i915 0000:00:02.0: [drm] *ERROR* Zero GuC log debug size!
>
> So fit it.
>
> Fixes: f54e515c9180 ("drm/i915/guc: Remove log size module parameters")
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Julia Lawall <Julia.Lawall@inria.fr>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 25 +---------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index b071973ac41c1..55d3ef93e86f8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -36,24 +36,6 @@ struct guc_log_section {
>   	const char *name;
>   };
>   
> -static s32 scale_log_param(struct intel_guc_log *log, const struct guc_log_section *section,
> -			   s32 param)
> -{
> -	/* -1 means default */
> -	if (param < 0)
> -		return section->default_val;
> -
> -	/* Check for 32-bit overflow */
> -	if (param >= SZ_4K) {
> -		drm_err(&guc_to_gt(log_to_guc(log))->i915->drm, "Size too large for GuC %s log: %dMB!",
> -			section->name, param);
> -		return section->default_val;
> -	}
> -
> -	/* Param units are 1MB */
> -	return param * SZ_1M;
> -}
> -
>   static void _guc_log_init_sizes(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> @@ -78,15 +60,10 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   			"capture",
>   		}
>   	};
> -	s32 params[GUC_LOG_SECTIONS_LIMIT] = {
> -		GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE / SZ_1M,
> -		GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE / SZ_1M,
> -		GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE / SZ_1M,
> -	};
>   	int i;
>   
>   	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
> -		log->sizes[i].bytes = scale_log_param(log, sections + i, params[i]);
> +		log->sizes[i].bytes = sections[i].default_val;
>   
>   	/* If debug size > 1MB then bump default crash size to keep the same units */
>   	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&

If the user can't tweak the values anymore then we can guarantee that 
the sizes use the same units and change this if to a BUILD_BUG_ON() to 
check that.
Not a blocker for the fix.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele


