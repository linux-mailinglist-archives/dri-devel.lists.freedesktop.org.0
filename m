Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8296C1EA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 17:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75210E7E3;
	Wed,  4 Sep 2024 15:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqfhc6Ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39910E0CB;
 Wed,  4 Sep 2024 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725462815; x=1756998815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1378A43NO4tuKmP7GKwz4fi1h8T7A0QTWdbncQIJsWQ=;
 b=Nqfhc6HoqjmVEGLCOB+7svGYB/aNbegwS+bEzm9PNC5ug1+h3t7j7PBl
 Emyq9J7URjYK99VvGcVOvqkMuotsDiumLcTyKL++pmt7QfGI4UDksIbhp
 sdr/A4PzWvsQKuI29S9hHv7t9caCMaVKBRWORvPO+EwN+hka519nw5b+/
 aeirl9PfwIkxtJ0SNmx7weIyIzTZEibQ0HJV4yAi0sz/yx/UPUoZEovyN
 oQLKwwum5i02tCuRjBEQeIqSoD8luMlPC+NX9K/nJ6LkuPCKOCqSbM/lA
 /ZpsuPKSoBTS2lQyMXcXbCYImNsDYPnoh7O5AQEW+12ND6V2+jn3qzIPe w==;
X-CSE-ConnectionGUID: 90RZzVQFSNa74XcLpDnzEg==
X-CSE-MsgGUID: Ut5HB9jKRpOT53Z/VjHJIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23934018"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="23934018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 08:13:35 -0700
X-CSE-ConnectionGUID: PSsdWLziSX+fCvn6m0BACA==
X-CSE-MsgGUID: AewQ9A3hRJK76XIbvyZaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65347868"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 08:13:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 08:13:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 08:13:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 08:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVdsOGfhyTFB6RCkS5bOnFa42CqMi97azMce6/T4bW+SxZCjGaI6iyuWMv/tc9YG+uyR7YATU/7Fb4NaQbkH6OyjQXfiXkCN4eq3JAnYyrbVkdQbREmXbUNHqiP2PYuymd6NlgxjyoNiBjAB0gaj+txl7Y2k0FvHA89gYAuI5UEL58ZPtK51yfrFKWtvluuV6eeoJkf+xQ93SP41Vkp7OrVQGBXTslS5G3XMEIHK1NinvxQOGQmzBD31LZf2xfWC8AbzejXVTo740KZdGM8YEA6sNLCQmc1IrPERMoSzVseJoSKc3BPM10/uJXG+eq9v5UV1eAxuZuTfKSZHtZTwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw8c1pPzFAU8+UEyL/0+xEaA5m1zkEz/mzhG441aDic=;
 b=K7B28iIBx6Qtzgbvij3j9JdX8SAFuhd4Yt3k4RgnwpTg/RrEKfQMPa+fCmxmc2g+CfFCkhg1wfouGaceu1LqBEZgnUEkGh0h3QakKs9sefUtZYFjYiVZ+tuEStmI8rrhQnMaOy53FZv6CX/O8qTWZN+02n4RPjmVfre6RMI2j3ZSp0yGlmZLrc9jooEz9H8RukpbtrEq0N23qYI3M44oamsIBe6grUyOxDuoPI2ceD0cknPIYKBvgGW0uZX1Fgnwko6/VJn4A7WaPWM2392+x6i8MEARdjWqxqG+z9I21e1GqB+sOqpSn5WvGEXfVrKTZKqFI1OhXqsdO2jRrkclPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 15:13:31 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 15:13:30 +0000
Date: Wed, 4 Sep 2024 11:13:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <Zth5FgwA10kOjcPU@intel.com>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <Zs4HQR-gcZ_VHMMF@phenom.ffwll.local>
 <ZtheoXODm_6AFgcV@ashyti-mobl2.lan> <87y147qygt.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87y147qygt.fsf@intel.com>
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ceeab5e-f3a2-4e8c-71a0-08dcccf4224b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eelkrez0HnadRJ/3OJzczQ9gGMxoS5qlWEymN1ZsF+eSZ4qxB0H/Wd4nBZuA?=
 =?us-ascii?Q?bF+BNKFz+0jAunN1WVNoluwmwXb6yNC2dctwi1X9/aG/XJtDN96mvM6+0mlh?=
 =?us-ascii?Q?C17jjKTidJNbV04UembCk6bndDjYDVW0ojvDWwgIlF3rslRNxEX0hrTe128O?=
 =?us-ascii?Q?R84FBsBixlkIfHxvh9HBpV5cnfpoBqlbCQgJxQQZncrlBh6A+63AgQNdRHe3?=
 =?us-ascii?Q?GlA3Ooak6kypXirYGcXNCq1TZ8x9E7GiVn3t98FFjXAcLeZVJY5GRO4gBorx?=
 =?us-ascii?Q?NZgyvpmeWQncFwFAVVdo+XrmHtjtB1vEr/HouYheLwNRG4VPVw8f+l4Sc/mV?=
 =?us-ascii?Q?IGfCI+7oETgbrhh5iy0YzW52JOOY4M5jxAhD76Kj8yd5qB24xthTpUZX+/gp?=
 =?us-ascii?Q?Jf+j1ZtoKpksdUZwQ5yAhMEGGe8ER3YsIPf5UB2YpsS2iguPDqX3qoFmEMe7?=
 =?us-ascii?Q?cSCygzzCgql+DsF8VwfvKPCWVCiZT8HutXfvdFSf68qEGchmJM7VVf8XbA3d?=
 =?us-ascii?Q?p+ZX2At7teQo7xg7x1jR9T+oVrSw1e/ZlSVbx/nnLS1B3OnGXPsKiqv7hce7?=
 =?us-ascii?Q?eZp64vdXHkF1BQgk7xITLXxBjyrPnBkChyqPzszLirOdUPU3kWwP8JzKTJ+o?=
 =?us-ascii?Q?8anrUvZK2U8Qa5lvetMavGN5EKnGppQLTNv7Xt797bxlcZHstqsNFq1Jg/20?=
 =?us-ascii?Q?aoBNaJxIHfNmFz064Oo3Pq2jpoK+J52VeVnSTBuZ5ZZV5bZndMmWTL6cYvMI?=
 =?us-ascii?Q?CVZ4NDJvd2W6J6vMRNXlIyzC0tsOvuL9ZvHTvQ2t89HeALQShcLsk2yvH7N9?=
 =?us-ascii?Q?Z8+/kuuKV6bt54vlQl3w8QL8vzh2slLh3AbMEhCig+lpIrPSlT+qK3Uz9q+u?=
 =?us-ascii?Q?fhtz5/sMCacNKUSxekjAs13yc2rIdRuB2P0mxZAc7Ycq1Zf/530PDN9zCKEY?=
 =?us-ascii?Q?77WoxYzhRef5PfBqsN+yWDC+hEoRUPrc1vit9aCRiXyBQEQR9nL+YQz1H49S?=
 =?us-ascii?Q?yzcYQxjQy/7ys9VkrRdW+lEjPxFpS2fHbjtnntXlhyjPQYS+trIvKNcaim+G?=
 =?us-ascii?Q?b9e8aqdjiuXYSHONSB592RGZn9LlldD1FRJfnXZxjDh9/+qWQty+sTWjuIL/?=
 =?us-ascii?Q?34bW0wgFuyZnAT/Um+sk6OFbcxebinFlJjweBlLUckRWDd+lI7pRYXDS0NbL?=
 =?us-ascii?Q?LDiEF1sRm5y5RtOKVHQd1fNf2N+t8x/hgC4JG0lEO7S165zD9HWricmGkLwu?=
 =?us-ascii?Q?J48H+T4mNLzFDlCo4zQeQ4fcxLxZoW4HDylRwZPqhcDBZ2mTquKmFk9tCdgr?=
 =?us-ascii?Q?uHpjt766ISc4s/+mBVAQb+Sgaa//jVyxW3vts+b8kwcojw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XhGX56ahucmpN5MH0FqR9QO2ZWS4ZBQ/5W/OJ1V3rk8D35CAtFO16/mjoNlD?=
 =?us-ascii?Q?LnVBqQwyi4YWMHK5gNAaGFEaapK6tzCyKW5vJFPLGEzcd6SHDc5Y96lVYTZl?=
 =?us-ascii?Q?aScnakrsNB1aRPWT/j2XjhraR/J8nBP4D2m0TxwdhrodQ9Yk1ZZQ+qbfU9KZ?=
 =?us-ascii?Q?2srIIQ37T3E4MZrR8/YscfDJGCI4wVomVb2FthZKPiBuC4cwbB66E8NXH6Nw?=
 =?us-ascii?Q?Hp6JOpNg3DcVswCsqIj9CebLz6JjRj6n2ZrDQWdvDlISiRq/gTig5aEFvq4F?=
 =?us-ascii?Q?NiqXaBPMP380HnAlcEYd8xpc9wmUyUxu7p5Htiu3fRGh4aPdNLF+f8UFvrTy?=
 =?us-ascii?Q?yKlgwEtsjGs9FknCr9a6xcfLsBytN24Jetcnw2xph19qcs9zwwa9DFs5Gopx?=
 =?us-ascii?Q?HXmDqu6gnBm/P3BxuFT6kTZSr30YBYKZSc9JSQC2VW9++0lvbAUx5kO7Gqpx?=
 =?us-ascii?Q?FWCqg8ylETlv7WD283mNe5qs13YzIjXfghHGEmITU/XHdpre7avx2tL3+DXS?=
 =?us-ascii?Q?kZihCajf2hMOj2S8FaSdtDxOzVnxiAy6Nm1+RiW/uXWRldokpzG9cpyRmTvK?=
 =?us-ascii?Q?11Sa9vOrz3zlBc/NsdRLukkyu1EgnbL/EL00b5NppvLesVX6TbGDkno+Fqvh?=
 =?us-ascii?Q?pcboT2mZatQRQYSrkcdu14Or1JppmMVqm1H+ETJU+Yp8dRy9XCdIBgowamjk?=
 =?us-ascii?Q?DCDRlafuwy/6zYibdmbREZRUOFMIMzWXoDQkaW8AuM92SOBE0+HWvJr3KyIb?=
 =?us-ascii?Q?RF3Wzfz1WZr/zHklD67YLBqapATGxdg8z1Mf1kjYhAUmBIZ8z4LUp+ipUfJI?=
 =?us-ascii?Q?1a6zUPhqzK9/AmCIWBJKuCANYKVH3v2UieOnOMQZlSNYl88ZqGYNMggdN+Cw?=
 =?us-ascii?Q?PzQTPFX9uTTn/V4cINf80slgG1j+bYw4QONup9PMXJt5/n0PtJhOQn8qILEI?=
 =?us-ascii?Q?MGc7SGoC4TVcgzWyn0MQLuQnpBkFHZh0NLoWMAwX7y3uqqn/TVd7nRUkS/EK?=
 =?us-ascii?Q?+aj4L9u8BT2+SwFHs2wOEymHedwfAn+QVfJqBI2SNtMqSRdfjOGABmb97oLw?=
 =?us-ascii?Q?cJN2ef0lRKaJM6WsrKCYs70R7szNjneU3W+HDqsbhDWq58BmTicxGRuq6EJc?=
 =?us-ascii?Q?DK1yJgw6gblNlaFfvqGdOo/XbHYKfe+Z/HJxwt5dmhukZwZg1k1Kz0dV6Pfs?=
 =?us-ascii?Q?KCRmr0WQYk+5BSiYtE5H1HpVIh/Xi6XO8nzun0KyZ3r87FwyNqCD103pA3uf?=
 =?us-ascii?Q?p0rApE2NBQEbsVyh2fiEgRLbUu0DoIROpMNv8VKbmiLevUtAFM+NGubkC4YE?=
 =?us-ascii?Q?X75LvziUfXtaa2RdwH5AWZPYynoCL59NH7Rc27CGw+m7uGznU8C+OcqqY5jI?=
 =?us-ascii?Q?trhLcQx6xkK/n1gngSMnfgQI+q9ayV8qflTcSM4VXcQ3sDs6zO+STdUsI1/k?=
 =?us-ascii?Q?8pW8xC1xi73wJTnZymiMoCl8YLwtX/zceEKbbLod0m/5jEalCHCVhhjLAnjO?=
 =?us-ascii?Q?SwGuV+yDK/Fpx12NpivEhem8BHKkvxqMFLx9oF3SdUeVVhAZwnGbCUz9DOut?=
 =?us-ascii?Q?JNsDCypppQBZW8zDgSCh1qkpYb7JzFUjbWDAaaYOzy4Y2fKaZtUor73cdwF8?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ceeab5e-f3a2-4e8c-71a0-08dcccf4224b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 15:13:30.8791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/o+rsOmIHaoFkVbEKCu9OeJq0fKmfkhSKjoJ4qTM6fU2MOR4ZGRPRYiIbLmuKLNNG4bu5FDLx3fR80sIcSdPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 04, 2024 at 05:34:42PM +0300, Jani Nikula wrote:
> On Wed, 04 Sep 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > Hi Sima,
> >
> > On Tue, Aug 27, 2024 at 07:05:05PM +0200, Daniel Vetter wrote:
> >> On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> >> > The i915 driver generates sysfs entries for each engine of the
> >> > GPU in /sys/class/drm/cardX/engines/.
> >> > 
> >> > The process is straightforward: we loop over the UABI engines and
> >> > for each one, we:
> >> > 
> >> >  - Create the object.
> >> >  - Create basic files.
> >> >  - If the engine supports timeslicing, create timeslice duration files.
> >> >  - If the engine supports preemption, create preemption-related files.
> >> >  - Create default value files.
> >> > 
> >> > Currently, if any of these steps fail, the process stops, and no
> >> > further sysfs files are created.
> >> > 
> >> > However, it's not necessary to stop the process on failure.
> >> > Instead, we can continue creating the remaining sysfs files for
> >> > the other engines. Even if some files fail to be created, the
> >> > list of engines can still be retrieved by querying i915.
> >> > 
> >> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> >> 
> >> Uh, sysfs is uapi. Either we need it, and it _must_ be there, or it's not
> >> needed, and we should delete those files probably.
> >> 
> >> This is different from debugfs, where failures are consistently ignored
> >> because that's the conscious design choice Greg made and wants supported.
> >> Because debugfs is optional.
> >> 
> >> So please make sure we correctly fail driver load if these don't register.
> >> Even better would be if sysfs files are registered atomically as attribute
> >> blocks, but that's an entire different can of worms. But that would really
> >> clean up this code and essentially put any failure handling onto core
> >> driver model and sysfs code.
> >
> > This comment came after I merged the patch. So far, we have been
> > keeping the driver going even if sysfs fails to create, with the
> > idea of "if there is something wrong let it go as far as it can
> > and fail on its own".
> >
> > This change is just setting the behavior to what the rest of the
> > interfaces are doing, so that either we change them all to fail
> > the driver's probe or we have them behaving consistently as they
> > are.
> >
> > Tvrtko, Chris, Rodrigo any opinion from your side? Shall we bail
> > out as Sima is suggesting?

I agree with Sima. I'm sorry for not having thought about that
perspective sooner.

> 
> Are there any causes for sysfs creation errors that would be acceptable
> to ignore? I didn't see any examples. Or is this just speculative?

Sima's point is, if the driver can live on this speculative scenario,
without the sysfs uapi. It is because it is likely a bogus unneded
uapi. So, why should we?

I know, if we take all the frequency control in the sysfs. The driver
can be fully functional and we would opperate in our variable frequency
normally and admin doesn't necessarily need to know or to tweak the
frequency. From this perspective, I accepted Andi's patch.

And this isn't a bogus interface. However, if the sysfs failed to
be created and suddently the admin depends on that to inspect
for a performance case or something and the sysfs is not there.

When he runs his tools everything will fail and this is a bad regression
for that case which we shouldn't had caused/accepted to begin with.

So, in this speculative case it is better to stop probing the driver
if we are not able to create the sysfs.

> 
> IMO fail fast and loud. We get enough bug reports where there's some big
> backtrace splash copy-pasted on the bug, but the root cause happened
> much earlier and was ignored.
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
