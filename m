Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F67756D8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 21:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E1610E2B3;
	Mon, 17 Jul 2023 19:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B78510E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689622908; x=1721158908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8QeFMWb6Brc0fy5uvLesppIOOmD3w/wTnWRHUkfe444=;
 b=E5+ikau7nWWGfDXZdMdTJG3PHleRV9h3pOv0hZN5UNN44JVRh22PXDrG
 FmU9f3eSSy1YUsqp+U35qSMAk2HuNToHjXomzlvvztX9eZ0UXgEd8Ma48
 N92fNlk2rZewyb61RRSrbc/G7MJ9sC5gxbLQl2nmIUtICp65f+DkJTS0T
 pSsi3/of+D/7qmHUPGUyERl14nrsfwRhJVagvUpTdyk9C7r8E43L5piNN
 w25avF+1ssUl+9l5LTNRwpHaR0umBitQDFrRETdsDmysPALH1vMmbf2++
 vYe4CgJfSVFpe8ZR27mdyBsMAN/RteaHmpA31VV/NpY+Q6yWCQ5ZWP1ox g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432196202"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="432196202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 12:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758539645"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="758539645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 12:41:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 12:41:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 12:41:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 12:41:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 12:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5Ox4QnGOViswWXpIxIownePwATo6C7cbpitGw8FK7ODLSaQJLXxEHYD33Hxvb4JoJNYXb04PtPR8QhePcj4HIA53JwN7gHnecoLk+FR1639fiXqylXjhf9foYp58ytIygxvqkdMwWvP+4SG55gxZzA+eQzVKhz2NuY7BS4z0WmLm87YaLYuGnRVAnfFq+M7q7ej0A4C6DuQ2X6BzMkUfgeHEHarZK7zoKKxzXw+R0z9BtuHk7v8WCFNAQ3mwRc/ggdmj9/bbK6Oy0Bna0c8EvV6dAHii13gCnNjYu+iVyagDnRRFTqGNBl/6AUwvZw7CMq4dfDnxVSMC+mdBP2NEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+fRgcOTJoV/iI7aWX7OYmp183oiuBxiTykPPnW/dQo=;
 b=eHuphst4w2vgrNOJqNKxHVkiiP/tEEWqVcIZUAFX1pYZxCX1LnedMX40UoyrrA5ZRJuFr+X2uyTRv4ikU4IEZwu6FMcF2uR3Vy1gj4f1MAux0OGlMOAat8R4rTxJHqiVo/EHHA/ki6gwm6tbSMwcTBneqlChQS/y23rbqKQ0Z30yXKFmH2FNDYzKA0Wz8avnCc6sL0+ywFhZ3pin9mZ57CVlAGUgbwbM/mSdsBnaEoQ67SPIJLTP6omjA5/UJJa57wF8Km1pJQ3S2KdcwU+ieQyLhd0uKwCz9/c8QyaBBuBl2KETxJHePCtL7ImNV1OUrjpw2RdaReGmcqHo2hPv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 19:41:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 19:41:44 +0000
Date: Mon, 17 Jul 2023 16:41:39 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
Message-ID: <ls3fmucy6vgh2ifyqy5grxymynwhaceieacfpsiklkvscyzxdz@j4gpugiwfxuj>
References: <20230704025322.2623556-1-airlied@gmail.com>
 <20230704025322.2623556-3-airlied@gmail.com>
 <ZKhcbBHqkEmGtU6I@bombadil.infradead.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZKhcbBHqkEmGtU6I@bombadil.infradead.org>
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: dc172bb6-c65c-41a7-bb3b-08db86fdd99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aHs9GSpUC0HFTxbbgn/3Xx4CXCJtH2jEpSFxNYMWmE1kHRtPzIRiPyieiPYWUMAq/o5sdYS30SaYjJdfmPflm5AEiyEgJHVsvDUkmiclO3Tto8Tb7n76rbVMArsnVkX93JOl6+sCa2EYPtbba92dGWP3rMQLTrAf4mYynbWCTQmfiAh8N3vHv+jz52XI5E4itWz0e0+7jJzeQ8IGZYhdMx+pD/Z+EKazoRrljMkLHpbOVmnVn6eLvtZRC9TJTS21LD8uhbt6yi4O5uL1GB9R7LyXwp/6VHyJSmVDdK3tzN5CWOpdM+aTI9VquLsf57iMg4D28gkwXmqhEBEhBHisBQEtNicX0uycTCPoctuNicrOT2UBSLX/dkdpNbLIRSMLe2yRvNs8MmGyPdvYfJZFcLiCF+bLpo2aSvCjlcPexYADaGiK5vevTgzxcjQUTBoQ6Sv3wbmp56uFgyLSAMztQYfdLKT6NEMU2rzKfGPq+Z33YdRAAxGZOFh3m6L4eDA1EIfeN8jYi0Gjsxp5SQpjMFBtOohXevD4ONQIGMqDsk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(86362001)(2906002)(33716001)(966005)(83380400001)(186003)(6512007)(9686003)(26005)(6506007)(82960400001)(6486002)(6666004)(54906003)(4326008)(66476007)(316002)(66946007)(38100700002)(6916009)(8936002)(66556008)(8676002)(478600001)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L64m9yyeQ8iN8x8lbxRggLDN2S0e3KeQzA4KGz54cia1YfGdJDslWXfjaEnL?=
 =?us-ascii?Q?SZwCub/b9YBnuM8uwklNt9yn3TXK8Tv4WGnDhQjH2r5zZh3M5EP5olrfvjq6?=
 =?us-ascii?Q?QdgWpJ9CTt8pMZQafaNVwCq/ezfw4xAGtLMpwjfdnDLqjpPdQuYsl342nBES?=
 =?us-ascii?Q?WObcobcjCx0QkfxduaEE4WhcUHaNBqmoP7Wdb3YwILz11n2xaB5sAWWVWr8Q?=
 =?us-ascii?Q?X9PY7H1OTte7YN4miXs+2HIdOaEQVQy8aicA4EfRojz6m5E2wJBFgeMAkxzd?=
 =?us-ascii?Q?MvluArknpp8r44IQmDpzDNPnUDN8Dfb+Ts4nU/VXO9pngeum1fBCLF3Mauz7?=
 =?us-ascii?Q?+fh2nvnizXwRPGy5M5g5X4xCrMCSn6H4HJsb4SKuGGGNW+4Kb7PY3CwjNaP9?=
 =?us-ascii?Q?EqLwXoqAySqU0/jvD6edmbcOniWNJlcneyu8WIpYzwf3f07R33pfVhJFjdGl?=
 =?us-ascii?Q?NquhWONuLgq1IUg4YFZyOyAOFdtzOm+WM/gy02YqLzAluReEgnLi0ouUF/Mm?=
 =?us-ascii?Q?w2VixGSTKNVg78oyJd64ea/EdSFw/1GEOfXVD2KPXRjh25zuPO9jhUKH/5Qr?=
 =?us-ascii?Q?jFKuzl/59674ZTh9K57GchhzS2ixYfWt0SzEf+VJ1F5nQ0xXK+uSsQA07ofB?=
 =?us-ascii?Q?ybd3LkhtxLliKp3eqePV4WLQb1UW5pHm9KKKZR2f1ffenlhU6VhSSxk178IN?=
 =?us-ascii?Q?0PUKVUIZN39Z5ob+EHjaM9PfdcCpolbp4ZAI5exYrzEeIXHLrhUBbrE6LmWQ?=
 =?us-ascii?Q?LLE9/4bIcDaF7tUx7LekuFRLTqIxpEwawetKkOWEHr3wDH/ltduNll73jGX2?=
 =?us-ascii?Q?vZ9jBWxS3aht1DuWQbFZaWItwfoMMtmtpSyD2feU19s1TLaakKFYKaSIve1f?=
 =?us-ascii?Q?CQlU8tbi0TS+ZyETKHzbHWJjbYCVaw0fpYmHCS7CtnAn+LrpOHOY5HVG1zZO?=
 =?us-ascii?Q?1XtiGp0XiOkoBoUQCMeTTDIqzUB7w7m+oX88DcrIxU73uPeHdq8kv8GDpE5U?=
 =?us-ascii?Q?WrL/fVOfot+ZeMxOGwIDHIAtr2wyEWum9ZS6qWptFHD9v3+4dpqvGlnuKBbN?=
 =?us-ascii?Q?34m8rsd6Fvswp/j+ssK82Iqbto0IPuth80NMuMDyLi4w9RDb20Hi4V1HE+jS?=
 =?us-ascii?Q?VGemdJoazbrDnWpfbHvLwDu1BQbU7Mrr3m80fbyI3S/3E4M/N+hYo/JLH06b?=
 =?us-ascii?Q?4Af2suBvi2c1nwfblgCHnx/T1Rd+f9fpEBbqe3fN6kI02CXks/4SJ7X4E21X?=
 =?us-ascii?Q?fSHec3pvMn348dFLk4sEjL3Bfyp2C7O+Ff4clfrf5OD3XheO95iN8SdGLAdk?=
 =?us-ascii?Q?Owp4CJGJnjRqPUXg24HkuPggfdZiGHo7S+Yrb+wBnLKARd1lTHJIJECZkRE0?=
 =?us-ascii?Q?c652ddZC+Qf9v3r8oh+OMnWvg0CBa/G7hNmD70bVDsZpJBqpvZgwEkPm2tld?=
 =?us-ascii?Q?4HKOHUls6CJSxmAmXFgSCGgxrbs/FoLlbHfeyW+wmcHCwmKnpKdLDnromeP7?=
 =?us-ascii?Q?7PPNxW9EZf/ax2TdnRS+yBptP/JUQnnJPxWk5NHguaoBimcsT58RciiaVkb2?=
 =?us-ascii?Q?VqVrECvIkI4KbqGEe+e6cUTme9pV3Hyruam25LngMEfNSMg3U+jppzRs3sBn?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc172bb6-c65c-41a7-bb3b-08db86fdd99c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 19:41:44.3562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLaZmdUAyBLhZynwVRb01tbMy2pgu5UdBhxqnJLdbZ9Eqpk2kFnEcD/wCBgOq/jQT2XdDrkmExebm13hqCX/Hr5iIXYfDQ9FjzRhvVrLmyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
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
Cc: Dave Airlie <airlied@redhat.com>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.de.marchi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 11:41:48AM -0700, Luis Chamberlain wrote:
>On Tue, Jul 04, 2023 at 12:50:50PM +1000, Dave Airlie wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> This adds two tags that will go into the module info.
>>
>> The first denotes a group of firmwares, when that tag is present all
>> MODULE_FIRMWARE lines between the tags will be ignored by new versions of
>> dracut.
>>
>> The second makes an explicitly ordered group of firmwares to search for
>> inside a group setting. New dracut will pick the first available firmware
>> from this to put in the initramfs.
>>
>> Old dracut will just ignore these tags and fallback to installing all
>> the firmwares.
>>
>> The corresponding dracut code it at:
>> https://github.com/dracutdevs/dracut/pull/2309
>>
>> Cc: Luis Chamberlain <mcgrof@kernel.org>
>> Cc: linux-modules@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>
>Lucas, did this end up working for you as well?

I didn't try this yet, no. My opinion is similar to the first version of
this series:  this is the first case in which we are making the order of
2 different keys to be relevant and it doesn't look so pretty. It may
also be hard to adapt some of the drivers like i915 to intertwine the 2
modinfo keys.

However, the alternative I provided also has some flaws, so I said I'd
be ok continuing in this direction. Humn... how about merging part of my
suggestion to mitigate the duplication we have now?

	- Document that when using a fw group, it's expected userspace
	  will consider higher versions within a group to have higher
	  prio and add only one of them. Thinking on a distro packaging,
	  it could be extended to packaging fewer blobs too.

If we agree on "firmware files within a group are version-sorted", then
we don't need the extra MODULE_FIRMWARE_GROUP_LIST, do we?

Nit: referencing dracut implementation IMO is ok, but on kernel-doc
parts we should prefer something more generic since dracut is far from
the only initrd generator nowadays.

thanks
Lucas De Marchi

>
>  Luis
