Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11F5EE472
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF2210E73E;
	Wed, 28 Sep 2022 18:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43A710E726;
 Wed, 28 Sep 2022 18:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664390160; x=1695926160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ii9F5b38Lywdd/7RVCRRB6LC8u9hmszooFK+6s0j01s=;
 b=djeipG265GCJqCtWu5Q6cgecc69mo52NIaTc+e3sh6DoyXP0F78E3sHd
 8nTBCyNJtGdTnNDdQOA9aXrGYp+YEIzvBjSozOCF5jiPOs3ku0UmQ8DUY
 dqzaMLBFkapSoTuDH4dJ1RKefzKxtjVOgdf8WX3SbB/jnhnWZKBfBYcoF
 15sZmupzVSS+SNHTZD5sz+jkxJEtK5Ths8HKNQ5r0Dw1cG6VqlQq8ti05
 HghZ664zlV9EA3mGTKn2mVRUHH+F2RyPbYECOd7vjOAbINY1xfT4GLK/w
 gT+E8ls1Kpa2TpHrJX7PWPvjXC8YmRerLml/j0qIcgbSF7vFMOVhm/rrt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="365733418"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="365733418"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="624256677"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="624256677"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2022 11:35:26 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 11:35:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 11:35:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 11:35:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 11:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyG4kt2mhRxzXOmLkfvi14fOYNfe3QPMYvqdvEFIRzhFlHLhDzWxBdZ6jU4vEgKnOQEkwnillLD9jBFcF1xFe1nOIGMQ6CyRaeLpMw8f9BOYh/COEwlcugWHbdF3Qeeov3MnmqfO6c4RCO7VuVwu7YHN3P9NPji1K86kLDD4b2fZkvYZb+UDLed1BozRFd4cBixJmW7XoPHVNNhDVMrlQd9PAAelwGwj996vj3S7JOlK9BHhDLrbigDT9E3MZM2mLLjiJcgnQynEWjF/CbydrELJUm/hp80xG8wOpWF6n7CQWS9Ec4sdkGwGz7y/1Q/KCzI+dTHXPUdOIeFX1B5Q5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhtdtQ9uN4pcQkC7fNI/HTFtdYTDA7teF/Ppgl85wE4=;
 b=nCzWJDl5YrVgeDk61ig0ioctOOz8y1h/Nmb/EZGwAfl4uavPI+kUjyejTbxD6VG2KOSZ8VKSuMTHOzqGDZmgnAZwL7cwiObPtjKqAFAI7Ira7GsQhLUVb9HCKGAfQKhrlXDDJKcUlzJ8CeGfh4Fr9BXG0XiQ7HvMIE8VXY5QgVCwJIXwr8ZvrcDxPIuxlRKVpVZqzjMERd90fc2cslMbo0FAlznr+8bl/Zm2mY3LilVUsc0E25DhHAYc2YdoUE8AboP6c91bBsOqTDSR3qUg4oatK0XvVFBJf44D/CwIaSL0tBGlyq/2xdFnPn+N0U9lcOrwulym8isWe83XCgzCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 18:35:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5654.025; Wed, 28 Sep 2022
 18:35:23 +0000
Date: Wed, 28 Sep 2022 14:35:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Perf_limit_reasons are only
 available for Gen11+
Message-ID: <YzST5ouKVrCGnUda@intel.com>
References: <20220919162401.2077713-1-ashutosh.dixit@intel.com>
 <871qrvzq2h.fsf@intel.com> <87v8p75pp9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87v8p75pp9.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b36a4b-06de-4ba9-a1b6-08daa1803402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MPmzDw3UfC9GLZ+I4scsxoNF50RacmiwvPqibWuwWAtJI/6rTwLOhOaQaDL7PlDX98ws+Yz5Fv5l6YpkXBfS615q+P8J98OqTUDWGsSdtthHNi6C0fbzgV5IhSCXOcigW62l+5ZjZs7w7c79mU81KSkxoAp4tofT1pespiQtvjZLrlWhtTXb24l2Tpq2kmgqpEBcdlF4PmVP9/+RFzAEp3ETrKe7ELzMX8uhC/sfwjefO7/vUdLlFY9u1CKYdVChOf2pvjlhI0mdxGM8niRcYTaZ8BptHYz4c5achFo8iXAFGwtIWk9bP9YlmPxxiDZba4ySqdcx1RHlPrDqkAuD4cl/p2PQpIg5GFK07s8msR05MjAek14obG7debFFSS/E4+Q4zVypSePgBVMZgvz56/vnPu/GzMPAYukrtrH+q9XBu16+bEF1OpJ98P/55AVgrAlSh1XOm1HRXN65Xa0gDqyYNJ38nU7OcXv9VpaCm9NaNHHiLIwKm6IFSeShAyJM/5mTPPg3rsSvjfNlQtcVhsP7df1vDUXpl1EHYKCYSAMHms/tOU8CrH8XHOck8uK+V+pGsAq1Y7ntL3pQnl76Y/Nk4RtyUYMJaejJl0c3sIv8NNvdLir1eiQM5VKDE+7iXbNX979dJWEYWUx8zPLspdX/1xkRdnzy4UtJO35Rm6t0QphE03fRC9bxcLEbdeGhwA32QBleKMCFDYNFB6pgODWo34DJObAaw81/sh5Tx7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(6506007)(26005)(6512007)(38100700002)(8676002)(82960400001)(37006003)(316002)(4326008)(66556008)(66476007)(66946007)(86362001)(36756003)(186003)(478600001)(6636002)(6666004)(966005)(6486002)(2616005)(2906002)(6862004)(8936002)(44832011)(83380400001)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQ3XW/cMnxzmffTJzSZG49EkTRPsMGVO9sv7hiKrUho4X0+9nyqPhbqhlN9p?=
 =?us-ascii?Q?TCLtzM63spCNdeYAYTY94qEAQgTkAsITGrriYVpHtCd/R8CQOZ/kW5nPIU4B?=
 =?us-ascii?Q?RYzkdjaUZW6kkAe6kEGzHkS9igA9BeDfi8+H5vncfuXJZz9vGHG+eomiSV+C?=
 =?us-ascii?Q?47tPh26bLPgJwLkxLE/F3GOVlTcS+bhSD1RhRHvtZ2titCqgPF7aA8RGlYKE?=
 =?us-ascii?Q?vEkHnnO1i2YWJhQNDYLvPfLZdVzqO9stm5MAx0bQQOjCvzT5PAgJpwUZZ/O7?=
 =?us-ascii?Q?CswveFGJ1pjBPv9ouPID2xrukPa7juViwAuqRz7gntZcSeY2iqOYVRjIONxL?=
 =?us-ascii?Q?RKBqGof9DDSpk18zaiLz/f7tyamRENQR+kfZxwIPAYZ9klKE7JpZSwwSNNrc?=
 =?us-ascii?Q?9RwhUDYw7ksjoSLp7rAJS9zpuFKIoeqB1ZzJ8EfFWiZITAHpFjd8RWDdNHSL?=
 =?us-ascii?Q?jHvUL5XDKLJZMq4+if/MnqrdE49fwOrOhmfXlU3AE2wWo5Ayxk9JqH3R3W9d?=
 =?us-ascii?Q?YhCaKTLgnSPAhvz/38JXS2S85tBvdEn32Lh9Ml7kAeUlLlCKhhR0Yym2V/n+?=
 =?us-ascii?Q?I5dtpFshALTK2aOftBG6Z8cPFrCvy0LGMm2hnP1OjXh2GAQeKHXp0Vvyz/hT?=
 =?us-ascii?Q?NC6cvbIQDnmHwukdb38lXg9r4LgABgqzVhLCsEVNv6bp1dd0OF6Ng1oSHqHI?=
 =?us-ascii?Q?rf8zAQ205sHN3JhnIAS19PLtOJDKp2OfsTHJxg2ERV+NF98iFJY8LpjXU9TK?=
 =?us-ascii?Q?XWGmtpbbxZK7SALPsIMHqObMIL6e8uZvMyTLKPOyiAqOvXnvG/utvKEePsmm?=
 =?us-ascii?Q?Lmlo96tPYG5bQ1FbXQvkByhGc0szX4FX5MjKSu2BKBrkhxSpzNtDbfBk87MJ?=
 =?us-ascii?Q?AELqx4CCu9SR5qiikn8w3HOZENZXxctEychrpsvLWZTvvtOBeiCv3CLFXNwW?=
 =?us-ascii?Q?P7VzbsRpC2W+DPA7Ruhd3eOeWZQZ0kKIwk4DpUu/zRcNfg0NOZj+2Oel6HQG?=
 =?us-ascii?Q?l5KjRC+v7W9TckekzqjJeo24s/gNvHYND8Azh5d4hKdKIPmoZptBYueDJv5E?=
 =?us-ascii?Q?jsJuDfDtJTK9WvGsA4XxCKwroh0swMJYdsk8Db+v9Gn0GNAGj4/Z6y91HcFo?=
 =?us-ascii?Q?W5dCwlBxX7MbpvX7xkwjtNFGmnj+cQJdxuXtMHG7I+uIzEGfbp4T1c2rrAZ3?=
 =?us-ascii?Q?96rvKaGf+/QCKQDGe9RRHPW8S2gx9Hkcjl2rQ76bjBoiTEIXh6DEvmjdlcSN?=
 =?us-ascii?Q?x7qZiR0rOfb6BSx/rcY7bGqUpyceOSHm7G7B+jqEpYgbOgK7Msjjg9jYMUaz?=
 =?us-ascii?Q?8isNzevEH0OBeTxbqTpQDVGbHBw6H+AuRRqtn7kgd/n7OT5dA+AwVhothewe?=
 =?us-ascii?Q?I7QrpecaWmLSnciZF1XxaGRHO6uJEYSJIdoOozO1eyeiWaa1z7zQVNq3cNNI?=
 =?us-ascii?Q?CHaFiPFfga7Ie4zL164Dlg6gb6/AluxEbuNWr+eEVNk0/XGVjzkQz8cC2Z08?=
 =?us-ascii?Q?ZMg2geNiu2OA2oB+Qdl5bb/0hS5qLjtkwaJAO85WfMIg3lB5yaw9RC1Aue18?=
 =?us-ascii?Q?dDNRE1YERFGbaNqf1QKgZYLdbeiC/05O41i6I152p0SqIHsbtaqLu16w1fls?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b36a4b-06de-4ba9-a1b6-08daa1803402
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 18:35:22.9007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGUNbAHpq1CTWJhAv7YdrMJRZ3x6JDb6qVmnN/laP/IGWhkb1kakKfsoIWm5jBGvtRVzWKQ9mrZSr1xK0MouQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 11:17:06AM -0700, Dixit, Ashutosh wrote:
> On Wed, 28 Sep 2022 04:38:46 -0700, Jani Nikula wrote:
> >
> > On Mon, 19 Sep 2022, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> > > Register GT0_PERF_LIMIT_REASONS (0x1381a8) is available only for
> > > Gen11+. Therefore ensure perf_limit_reasons sysfs/debugfs files are created
> > > only for Gen11+. Otherwise on Gen < 5 accessing these files results in the
> > > following oops:
> > >
> > > <1> [88.829420] BUG: unable to handle page fault for address: ffffc90000bb81a8
> > > <1> [88.829438] #PF: supervisor read access in kernel mode
> > > <1> [88.829447] #PF: error_code(0x0000) - not-present page
> > >
> > > Bspec: 20008
> > > Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6863
> > > Fixes: fe5979665f64 ("drm/i915/debugfs: Add perf_limit_reasons in debugfs")
> > > Fixes: fa68bff7cf27 ("drm/i915/gt: Add sysfs throttle frequency interfaces")
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >
> 
> Hi Jani,
> 
> > Ashutosh, can you provide a backport of this i.e. commit 0d2d201095e9
> > ("drm/i915: Perf_limit_reasons are only available for Gen11+") that
> > applies cleanly on drm-intel-fixes, please?
> 
> I've sent the patch:
> 
> https://patchwork.freedesktop.org/series/109196/
> 
> Not sure though if it is worth applying on drm-intel-fixes because of one
> conflict with drm-tip which will need to be resolved manually. On

The conflict shouldn't be that bad to resolve, but since the patch deviates
from the original, the new commit message needs to highlight and explain
that this is a backport and the reasons of the difference and including the sha
of the already merged patch. Similar to the option 3 of the stable rules. [1].

Well, another option is to wait until this patch gets propagated to Linus master
and then send the backported version to the stable mailing list. But again,
with the proper rules of the option 3. [1]

[1] - https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> drm-intel-fixes the crash mentioned above will be seen only on Gen < 5 if
> someone manually cat's the sysfs. We had to fix on drm-tip because there
> was a CI failure with Gen3 debugfs but that code is not in drm-intel-fixes.

since it is sysfs it is probably a good protection to have anyway.

> 
> Thanks.
> --
> Ashutosh
