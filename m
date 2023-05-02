Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25D6F498A
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 20:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBC510E03D;
	Tue,  2 May 2023 18:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D2010E03D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683051260; x=1714587260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RmHs+q9pxsm+ycRR28eXob61Q9umQ6vJiJljE0KtKHk=;
 b=CXn4UTu7FFMtyd5HX6bOLp2JaMpPW5WPDZZJrohH1DvYiy72sBkit7Bx
 Jyg5cZej0j2Gs8ldZhA0QX9msYazWlIeKdLvGRjrku033+E4kT/7jOVrq
 sMfK8muY7QuwxXxj73y1DjMiNi5JBKXkbS/YJUk80e2ew8j4WP5tuHn2J
 fnY67cCMFvRlwB6OA6ZF7mfbqGGACPxOFVbO52127NShtSYhcicFOvHBi
 toRhaeh0XJX5v/PKUjJtkE1FbPJvGh68nDBoJhRPF5ICnz4ntQMfWw9dr
 M2fJaaXp/JdX9mBY3gr6yUm5pBO0fv3kkcIv0XonYX/7OmGEqsua55cRD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347293913"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="347293913"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 11:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026183935"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="1026183935"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 11:12:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 11:12:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 11:12:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 11:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD6XdlrIaJzVGPe59w++xmQ+sVRF0duMT8bj/9pxNGWv/vK8IZcQskxN4O24ZjwJplPBZrgz26lzVnrzhwybePwsOfe8BSneNzOBOJIklST1/Xmqrxj1Nd2twg+INaHyNfMHkBAuOJAqfJGihLP+aiecpsK3AM+bk9L2b4ENoJJls+rtJd+Ff5/zZc5jcd4g4pVRGyykmK5P4C89OEA747F2dsuCByhk+vgh1hZc3YkTsp6ZHLx4vKaH/6VjwOxqszYM65BGfFTAjuXf65B+cFvFeRaJVn0ieZdTglBYSkkbAA+cy4BB0h4DjPFgfIphUgk/Ndq81oZH/XOZZoevTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vAogqSf2pyjJM7jS02r7KY8lf+1hXJmrKjAeAFE6Cs=;
 b=f6fGMNhKosy3PDBWX99qpKd75QZ7VMaBg05f5o/fS55KmX/dVH/TKcJ1nE+sth/J4MtlW/KkYE401UfV2N9wgIW7CeMIg/PjSgXKzITCA8iqqG8XuuINdBxZ7ZwC5fWdlvcvzd2Q9lqbLmZJA4nRT7mlHyZrkQ1aYmz+6IESHo7Vj0k0kYPRs+qmvVfXy1TRW+t4z4y9tfb00KIvK+K7MAk/WgknqD4ir7k9GjcY3ofpNLHJcfSlK4laRhGiK4Ou+utkWFblDExj8dKTBMHiHYuufjPPYJvsv5aNLa/qtMoEbC6hduW00+B0usSiIRZhaPvi9CVHqI6QDEIW2R1MgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 18:12:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 18:12:01 +0000
Date: Tue, 2 May 2023 11:11:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
 <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: c188b05a-af92-4868-8df3-08db4b38b98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xL+RUBpxbQS3vtVOuKY1oJuumlSgWZNp4XbuD4vv7cWc39rS94f8uZVK+R82ltTFEo8yRgABjjxMzja0z/IhGU+FMrFS7G+XDa3VUM7F+jgiYaancI3tq1dOLWbiFxetFvDoXu8YjzWfTZHMKiVHVVBBSa0/DSHcsKaLQvFyNApU9ucMF41YED9QprxPiHPJGTK24/gtFMLFNvSFPp4DMoQMVMxGXfLA1DYwBrCoafMHX/Ex/tmrd7fDiQ6UQXP25KlIT2p9qa+CxiVp2z7wPPbyXBEaSOTsPrQvhxwt9tNxTSlre4YUi8tWPOhBVsxMcVHYaB/aPn/MjnAXj1IiyKfw1sn7kv2WJ8SNjrc6uqjeg8PRmfGCSoLCNDvoifIyFX+yKK1dReclv6KTv3Vsn8oX4Ufr5k1nB/Mxq78YteIUjTEqdA6dz0vEXdpzZvTt8is7LtPdZVXgvdG+P8bDG1v4SYvkXLHVn3sSJ/+K7xq26GYM2qbUZDdDt8ZBPx4JMVtPseNAgJ9flcWtaf3aej1A7O44v7PxzaoLeRZIZuSR3k2dojvO4KvguAZqOQPrNfyd7sF72Ugiaq40RXahRkXLVDlXXzOeZYrQHIQ+ogrnjp8cL32ygyRy5AxZL7Vz2UP7pP33uRjK7mEgHsSTQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(4326008)(66946007)(6916009)(86362001)(66556008)(66476007)(6506007)(6512007)(8676002)(41300700001)(33716001)(8936002)(5660300002)(45080400002)(316002)(2906002)(478600001)(6486002)(6666004)(9686003)(26005)(82960400001)(186003)(38100700002)(83380400001)(130194005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WbuwESNlHvJoOe2Dl2F6UNoU22WAX6sGwpJhmIoRVQ/pVJr/chMbQ9sWs3c?=
 =?us-ascii?Q?Z2ibubwKtJ37ZdwRRSHo3AJq7+jB2f+YX15jdpv4vABNri966S9h1u4CYDdf?=
 =?us-ascii?Q?ZSkSj0tl3CkveOLTHLmf97v5Y1Ghuzo7Mf8+6dCnimv6S0vGVpZMu2IB9q1k?=
 =?us-ascii?Q?z3ZKoX5Mexo3deDScZGAOuJASmSbsI2KVHV0VFU6cf0Nw7vy4sNPcaSuTyBH?=
 =?us-ascii?Q?s1eI4uGyEklhHG7/IZ0QyTE2WDepXqrvWY/UbBuCQIixcPh0Kk2b+1GR2vzk?=
 =?us-ascii?Q?PuqFpK2RNPFL0fnsIUyoLn/DCn6EJqvaii3spiNdJEuXkLjwnjqSxHXShCkj?=
 =?us-ascii?Q?7xfyXwvYDscUZkGjAsqPT+cvaayn9R4s7mmBf/ZSt6cMzIMxVZa51g3NT/GR?=
 =?us-ascii?Q?ViD+xjsA4s4HnrqVaRc9EFPav77d/WkMQiOPZsy6XhSFpErO6DD6FzYPm7hz?=
 =?us-ascii?Q?xqeyauEq+uvyLuHtk9FUzIjYLXWF8TUC9fW8V9T3xBdAoEvo2UagmJbd2ocr?=
 =?us-ascii?Q?XeyCpjD0QSLfsy7FNRPzY0CWnModMoV8Skp1O/GhlYCqxnsDa3uk8pL7SULY?=
 =?us-ascii?Q?RpX68dVKPu4z5nhWd01DjHTfGFbhPc99EYF/0Dx2pZwqnpjxRSdEwXvrIEuq?=
 =?us-ascii?Q?aWIsP9OJVysSSPHAn0GJPx2O/gyGXS/vcj+CB4a/uNUHHLxFJLvNQEHcTdS4?=
 =?us-ascii?Q?HWRfKOLCphtE8STq8UMKfNy2751Y1g5Oggr6hxZ45mOaLEFaVZE0YZxeem3F?=
 =?us-ascii?Q?0x1MuXOax+WO9EEj0V132aArU08edgq190NUZ/fjYuts0ynFbOb58/QdGGC2?=
 =?us-ascii?Q?R+ZEduGA7FIjquvkaZYdjkW/cvXNOhmYE6UAdeVgEe/teftnMaNtEOx21pBm?=
 =?us-ascii?Q?NbBWzSU2rBN06s6sJcIytx+JBocE8RbePma+jmrG5EAML1qDkKhFS4KI/0Qa?=
 =?us-ascii?Q?gjU6WXdJ7aWQ3RDXEfr0bZabfos+bm3pOn3Qx9EaOECJ6ig994H/B7skfzgb?=
 =?us-ascii?Q?8h9J0Yxd4g3YyqWXVqihJp+Kf+F3XCP5FbvncczULYAn0S5ZtwVjWrMgfSKG?=
 =?us-ascii?Q?8jww85A1fnhfC085uCBdvbkyJo76Aa7z+0kenQ2FRtG45XP0Lsm5a0duy/jv?=
 =?us-ascii?Q?Z8r8jpFqUYs+Qjqhc5k6aRK8VfxUWcz7q9SBRnSQEO2bOvCiV+HESy9+8hq8?=
 =?us-ascii?Q?4OUlzmC9GKwJg4FK7brXh3Pg9OcLyjHeOar0m5Sq57Dc/3rdNUBycI2T9QYC?=
 =?us-ascii?Q?y5TUL+0iWZ3KPAWAXG8LndxFnI1yIMV7WoDbSB2I3bEneZRPaGYSISmNNgh5?=
 =?us-ascii?Q?USV1Crc8ASt1P1dLaox4n2fYMUeEZwD396/gMRtQEkQ3G5SmDA3NCE809KVI?=
 =?us-ascii?Q?ab0XaAHUKjdH+1yHybtjGY3vCkZauflfqCzS7cqWBqr4YsGsX8vJ4LzhcLg1?=
 =?us-ascii?Q?+m85xEg0TDmPh2x7ma1diJFksLkUutFnW5s3ZcnkuyJwoNo1VLirDAxLCN5W?=
 =?us-ascii?Q?ODEjbdXyni+rSF7kb2U5A/Cf7R0bi7gmaj9MrASvrC2ky85nZgqrTjtN9Qu2?=
 =?us-ascii?Q?5R0MzG98MktPZDcw+K17Hw1fSH+s86cGgqj1El/D6ME5x016YsQJbpKNQpyC?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c188b05a-af92-4868-8df3-08db4b38b98d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 18:12:00.8375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nav5Dlh/Z/SffVc5JLBe4fO3cqBmwQIwnI5kl/6JfGP57DXTvwFADBJSQOlTjh6iDNKcxl+tG6pxDMy5EAzXUi4xuiVLJ//O4aR+bREt3Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 03:56:53PM -0700, Luis Chamberlain wrote:
>On Mon, Apr 24, 2023 at 10:01:13AM -0700, Lucas De Marchi wrote:
>> On Mon, Apr 24, 2023 at 03:44:18PM +1000, Dave Airlie wrote:
>> > On Fri, 21 Apr 2023 at 05:09, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> > >
>> > > On Wed, Apr 19, 2023 at 02:36:52PM +1000, Dave Airlie wrote:
>> > > >From: Dave Airlie <airlied@redhat.com>
>> > > >
>> > > >This adds a tag that will go into the module info, only one firmware from
>> > > >the group given needs to be available for this driver to work. This allows
>> > > >dracut to avoid adding in firmware that aren't needed.
>> > > >
>> > > >This just brackets a module list in the modinfo, the modules in the list
>> > > >will get entries in reversed order so the last module in the list is the
>> > > >preferred one.
>> > > >
>> > > >The corresponding dracut code it at:
>> > > >https://github.com/dracutdevs/dracut/pull/2309
>> > >
>> > > it would be good to have the example usage in the commit message here so
>> > > it can be easily checked as reference for other drivers.
>> >
>> > Good point.
>> >
>> > >
>> > > I don't think we ever had any ordering in modinfo being relevant for
>> > > other things. Considering the use case and that we could also use a
>> > > similar thing for i915 / xe modules wrt to the major version,
>> > > couldn't we do something like below?
>> > >
>> > >         MODULE_FIRMWARE_GROUP("nvidia/ga106/gsp/gsp");
>> > >         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5258902.bin");
>> > >         MODULE_FIRMWARE("nvidia/ga106/gsp/gsp-5303002.bin");
>> > >
>> > > so the group is created by startswith() rather than by the order the
>> > > modinfo appears in the elf section. In i915 we'd have:
>> >
>> > The way userspace parses these is reverse order, and it doesn't see
>>
>> the main issue I have with it is that it relies on a order that is
>> implicit rather than intended. The order comes from how the .modinfo ELF
>> section is assembled together... so the fact that your call to
>> kmod_module_get_info() returns a list with the keys in the reverse order
>> of the MODULE_FIRMWARE() definitions, is basically because the compiler
>> toolchain did it did that way.
>>
>> It's worse when those sections come from different compilation units as
>> the order then is not predictable and can easily break with changes to
>> the build infra if the files are linked in different order.
>>
>> I think the grouping thing here would only be supported with firmware
>> defined on the same compilation unit, but it's something to keep in mind
>> and document.
>
>I had provided a simple API to help with explicit linker order years ago:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20170620-linker-tables-v8
>
>Other than that you have to rely on the order in the Makefile or way
>in which they are declared.

but that doesn't change the order inside a single section, .modinfo in
this case. Does it?

>
>> > the GROUP until after the FIRMWARE, so this can't work, as it already
>> > will have included all the ones below, hence why I bracketed top and
>> > bottom with a group.
>>
>> well... that is something that can be adapted easily by using a 2 pass
>> approach, filtering out the list based on the groups.
>>
>> I agree that yours is simpler though.  If we can rely on the
>> order produced by the compiler and we document the expectations of
>> MODULE_FIRMWARE_GROUP_ONLY_ONE, then I believe we can stay with the
>> simpler approach.
>>
>> Luis, any thoughts here?
>
>I see the Dracut code indicates that the order says now that you should
>put the preferred firmware last, and that seems to match most coding
>conventions, ie, new firmwares likely get added last, so it's a nice

not all. i915 for example keeps it newest first so when attempting
multiple firmware versions it starts from the preferred version.  It
will be harder to convert since it also uses a x-macro to make sure the
MODULE_FIRMWARE() and the the platform mapping are actually using the same
firmware.

>coincidence. Will this always work? I don't know. But if you like to

short answer: it depends if your compiler is gcc *and* -O2 is used
Longer debug ahead. Simple test with the expansion of MODULE_FIRMWARE
baked in:

	$ cat /tmp/a.c
	static const __attribute__((section("__modinfo_manual"), used, aligned(1))) char foo[] = "modinfo_manual_foo";
	static const __attribute__((section("__modinfo_manual"), used, aligned(1))) char bar[] = "modinfo_manual_bar";
	$ gcc -c -o /tmp/a.o /tmp/a.c
	$ objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual
	$ strings /tmp/modinfo_manual
	modinfo_manual_foo
	modinfo_manual_bar

However that doesn't match when building modules. In kmod:

diff --git a/testsuite/module-playground/mod-simple.c b/testsuite/module-playground/mod-simple.c
index 503e4d8..6dd5771 100644
--- a/testsuite/module-playground/mod-simple.c
+++ b/testsuite/module-playground/mod-simple.c
@@ -30,3 +30,9 @@ module_exit(test_module_exit);
  
  MODULE_AUTHOR("Lucas De Marchi <lucas.demarchi@intel.com>");
  MODULE_LICENSE("GPL");
+
+
+static const char __UNIQUE_ID_firmware404[] __attribute__((__used__)) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(1))) = "modinfo_cpp_foo";
+static const char __UNIQUE_ID_firmware405[] __attribute__((__used__)) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(1))) = "modinfo_cpp_bar";

	$ make ....
	$ objcopy -O binary --only-section=__modinfo_cpp testsuite/module-playground/mod-simple.ko /tmp/modinfo_cpp
	$ strings /tmp/modinfo_cpp
	modinfo_cpp_bar
	modinfo_cpp_foo

It doesn't seem to be ./scripts/Makefile.modfinal neither as it's also
inverted in testsuite/module-playground/mod-simple.o

After checking the options passed to gcc, here is the "culprit": -O2

	$ gcc -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
	modinfo_manual_foo
	modinfo_manual_bar
	$ gcc -O2 -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
	modinfo_manual_bar
	modinfo_manual_foo

It seems anything but -O0 inverts the section.

	$ gcc --version 
	gcc (GCC) 12.2.1 20230201

It doesn't match the behavior described in its man page though. Manually
specifying all the options that -O1 turns on doesn't invert it.

	$ gcc -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjustments \
		-fcompare-elim -fcprop-registers -fdce -fdefer-pop -fdelayed-branch
		-fdse -fforward-propagate -fguess-branch-probability -fif-conversion \
		-fif-conversion2 -finline-functions-called-once -fipa-modref \
		-fipa-profile -fipa-pure-const -fipa-reference -fipa-reference-addressable \
		-fmerge-constants -fmove-loop-stores -fomit-frame-pointer -freorder-blocks \
		-fshrink-wrap -fshrink-wrap-separate -fsplit-wide-types -fssa-backprop \
		-fssa-phiopt -ftree-bit-ccp -ftree-ccp -ftree-ch -ftree-coalesce-vars \
		-ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop \
		-ftree-fre -ftree-phiprop -ftree-pta -ftree-scev-cprop -ftree-sink -ftree-slsr \
		-ftree-sra -ftree-ter -funit-at-a-time -c -o /tmp/a.o /tmp/a.c \
		&& objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
	cc1: warning: this target machine does not have delayed branches
	modinfo_manual_foo
	modinfo_manual_bar

Why? I'm not sure.

Finally, clang doesn't invert it for any optimization value.

	$ clang -O -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
	modinfo_manual_foo
	modinfo_manual_bar
	$ clang -O1 -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
	modinfo_manual_foo
	modinfo_manual_bar
	$ clang -O2 -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
	modinfo_manual_foo
	modinfo_manual_bar

>hedge, then this seems fine so long as I'm folks follow up to fix issues
>later. I think it should and the simplicity is preferred, worth a shot
>I think.

Based on the above and my previous reply, I think we should have
something more explicit about the order rather than relying on the
toolchain behavior.

Lucas De Marchi

>
>But the examples on both sides are pretty terrible. I'd just like to ask
>all this gets extended in proper kdoc form and we are able to get users
>and developers to read this under "Module support" in:
>
>https://docs.kernel.org/core-api/kernel-api.html
>
>So go to town with a new section for:
>
>Documentation/core-api/kernel-api.rst
>
>  Luis
