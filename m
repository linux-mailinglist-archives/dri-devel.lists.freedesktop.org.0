Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC047662FE4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 20:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E286510E1D4;
	Mon,  9 Jan 2023 19:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C647C10E1D4;
 Mon,  9 Jan 2023 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673291186; x=1704827186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+cidFi+BlpAp78LNvJTT9ElHxV0Psxw78Zz49lDRRMs=;
 b=PGpgmuUQTqsd2ORbJmwe+YFxZ9RvK3WGu3F1Z0vTlgQGZhDO4f8PsZdJ
 n2rACewsyAGHVrGoB/SrWzAjvy30VrqhW5OW/HwZhPcAAdGqHKtJiMvNH
 tFIOhJcaTInv4x3gGi3hqtfPfnYXNdr3D3bmrYE8Kq1HH5LanzQ/yfyqD
 95eMTHr2zFYIEqbnDhF8IntB4/QDpFZvmDfpFSNGjgJnyuiFVcMVCFagA
 Cf/Nw1tZ+kGduCJ+Lhs7pExV/UltVzBdKJ6SfNgUJ7kSxJwWttOrzXRXq
 ZcHU4orCgDhEba4gqh5TLtGBDu6cjNzj9EBLRf5HjlX39KgaWjd5nNewN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="306474267"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="306474267"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 11:06:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="656777011"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="656777011"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 09 Jan 2023 11:06:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 11:06:25 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 11:06:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 11:06:25 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 11:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQXXh7eVcHAlpRMa3CCYNP06CkoMxpMV+OeTwSnQ2kT8J9LVCxdxa78SgeH9ly/QwvavijUIYjLoh6IjlEFcKgw76jZVggm2dkTKwBulkbNh0OTNUzSGhVGEsAV4THJGvZSFAuiNEDNuka+4FLljG6/EJXKRP4mf+6VE8xmBpYDzhVsv33RSxGc27AQdqIzfhU5bDw2mQ05okBarFh+teI2TZDjAcxtqesYKwKUMiiZv5dQyFFQkXKhWLfiyridTfF8yO8I2FY5oitUPVJ+phqLSxaRoSxmV8QUKTgl5u6SWeS+lCeym+9TswXkcHhs4JPvE0ZOmjm6+ey5PYecXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj+bhPPBEB5wn0+zaIBGnduwFlF/ylV8YKCd/6dF75s=;
 b=j8CcaxIcJ5jIk/mNxNiCGfUcDPiZBHRcumPD6uXiw2Owfk9lIb3DueG90QoK6y1kh+GdF/fiwPqnnB2gBL/49TimiSH42uocfGnROMHbL5C4QtoKwwy4H3HXFThurLakwI/QWyMxgK+8KhsvkwbHpqqoC5UH3BDAwZaNy/AydPXNr+0jXbNLfK2NmosIV4F5WDQ5nJg0z7w7rd3XLcB7GXNsoknjEFslrog76HV1imGJjOojiSrl5veqQNrzFyZFD8Nh8BzwKvGZ0eEn0u5wTQkJ8CnkZRbmykld8c/j5077W2TNYmmUQS0rw6PKpPeXWGy/iZ1ASizbUJ5BuJYLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5379.namprd11.prod.outlook.com (2603:10b6:610:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 19:06:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 19:06:20 +0000
Date: Mon, 9 Jan 2023 14:06:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/i915/fbc: Avoid full proxy f_ops for FBC debug
 attributes
Message-ID: <Y7xlpbEDspHaT5Gq@intel.com>
References: <Y6qmNW6cOHjGwn03@qemulion> <Y6sn1BmhFJFssW0h@intel.com>
 <Y6s0FSK9+F+/oKSf@qemulion> <Y6wl9NhYZG5RjJL7@intel.com>
 <Y7PG5Hx5dDE7aHSx@qemulion>
 <alpine.DEB.2.22.394.2301041850570.7216@hadrien>
 <Y7XABJ9MWCWO5IUA@intel.com>
 <991ac2b4-f458-f6f2-f494-648ed61efcff@inria.fr>
 <Y7nQHfbKNmZ1sRbO@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y7nQHfbKNmZ1sRbO@ubun2204.myguest.virtualbox.org>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ade286d-390c-46da-8180-08daf2749753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MOYjGUM+OtZBwBr1Mh8KDhWI+2bJ2ROMh9xWgsYL42E3nNvw+ond4LxzUmEqyKkKIDjZ1iaMSABBL+AXuw9mgeJsM4n16h+qCSJoVubWccvVAPO3FnZL6AOO8wN0zYf2IyxhGQf+nks74Xh0wJhBYjKDd/CuSo6WUxty3581YWOz6O0rJs59e94TTikqlkLuFJ/IzJOv76oSfFVdeT5uTqWjGDnPdFNkZP3mY9u+3uKwSJuMNu50VeI3+rqruFF3S1qBZQlgtwnNVrYNTPBoi1Ak5HP00DYW/4ETCteDEiTjuCkTfbl7aTJnLhUdq7xpvTsTc/APwstA33czfHKpNhjktVI/0vr25oyTVZBd7OJsSGX7eKJ1INGpbKg4Gsx4eDkyqxFjDkwrOgtYzVcgj/qTBMGAVLmALoVKmJFlVrl/SMyfcufJfORLqzmF14AHZ1WLoUe7cNrqy9ArPgB3eoDTaa+f1tCDZMP5iTQ7YWKIVAZb52AoZJCL/5N0TopXvJoH8tUpKZHww/E/SDXa9/VHKFp0lUwXyCg//HMfRH8OPrAjul2uqsJyKc26cP21coONQ0i9rv3YKn0V4jPk35Wr3hz8gNSQDkdqHJvmn3TNx5jmcwpzl8Hq2MO81+KNZqj3Jd7rwWjq6nqkLoQkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(83380400001)(2906002)(44832011)(54906003)(2616005)(66476007)(66556008)(7416002)(5660300002)(66946007)(6666004)(26005)(186003)(36756003)(8936002)(6506007)(6512007)(478600001)(82960400001)(38100700002)(8676002)(41300700001)(6486002)(86362001)(4326008)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0I7Sc2XG1IiOUZZQ0lUt/5vYZmKkoHT4bKhRsjodtBpLET8jBN6hsMR+VJJo?=
 =?us-ascii?Q?ujdMnZHMw2/63aqGExStmP4bUSsex63hJXq74RH8D5A1YdcyCQJwYjkXfSDs?=
 =?us-ascii?Q?YtWyLxfqPsZ9+Y2B8yHbS585EkvANoRO6DDz5KQTRoBWk1UHtMFKBzrZnPel?=
 =?us-ascii?Q?yd2sI1G3/+dx5TeZQmJilVQl1SayRCCZBSTgWjrb8U3Q+Ba+EEeox9vAUe+Q?=
 =?us-ascii?Q?9KZAnO1myCnyFNcFNuybcTKKR90Fc2VLhjrpYuVQvRAATIsWgrFgYXyk7h3D?=
 =?us-ascii?Q?gpyUIh2B43VFUXYOOhvpQW9YVQNBbVBUkugr6p4b0Ha/W26ZZvWqTr0wJ3xt?=
 =?us-ascii?Q?QBG+mRITsUx5D8OD0lOUaWyUnpLNdi7Zr3GGXEgvWgY00yXi7Am/KYmeYh+X?=
 =?us-ascii?Q?J2BKgKmz2en7lgI3ZpESTxQbM+4pkv+iZj6ns3U+5OjS+OSdk2kf5UOZQJkz?=
 =?us-ascii?Q?m3kA6p6aYEpg70gOTPCNOMxl+lfKnIT3v1XEMZi+lHu6povsCdvksbxWTT4Q?=
 =?us-ascii?Q?+yeSQDmhfeF4woYy3C90vWyrJySW2qWqgwEmuKjmrd9tQ32lRYDK/smWtLa0?=
 =?us-ascii?Q?YbYXNJNhPZvRDQbQN/vMJltih/7yQXoFoQZudT6bu5T6KravWt6f8Lnhya9h?=
 =?us-ascii?Q?waIis5dLSCxZlANZkUDN4KP6L1q2JGWVJ+5sz7D9MamT9X/OhAg7pSSEzqhu?=
 =?us-ascii?Q?hmuRdBUJHHCh0P1kinQ8w42joD2KvOAXpvcSta57nVzItmGKheEE7zeDf44O?=
 =?us-ascii?Q?oKMQZwJSp9ZzzIPJyqZPNyTpYBzQDPPESoNHUWeX7XZNLBx+7XOOmyY9ZBLe?=
 =?us-ascii?Q?2Uxre1ShcgsBlPi21x+KGvZy/leQ++WacyI4fw2J3RKK0l60PcFp21H+v1yx?=
 =?us-ascii?Q?QdTpXz5C2rz6yYnRWFz6ngHrshYkyw8J1YNl+x4bY89fctCBFvBM/PMaM8rs?=
 =?us-ascii?Q?nqFtUKXF1PQ/4tDHIaJfCrFnU7jBgv3qrKl5hnCcOcLMUz6QGGg+4ps2erRC?=
 =?us-ascii?Q?JoxOlxvdbAn/RfFEbnNBpNXbYp+eVW0KCPjGV/4z1jEjN2+jmBdJ+y/BPzDa?=
 =?us-ascii?Q?WUJcCFOig1dBBd+cc/5tMJEvpQVAQ+cqv97fcHNiK/dTPhkwoWut3tjudGBn?=
 =?us-ascii?Q?WS3JQ5g+1LwnTQ8RHqcXlodh9SFOSoY598MUfQ8tAygsxx2b8ks/PmXoheuv?=
 =?us-ascii?Q?NxBRRqFqSQ58KIYp+COrAuA4O5NXeWx0nFIEatmiACpyg6cCqEKbLnenGQzG?=
 =?us-ascii?Q?rZg2PYXU8+A9/lTCpvco/xU3jF5IEk29K9bjbiVCw6/66EgR3RQA0SQnN1TZ?=
 =?us-ascii?Q?M5CW/G8/qmJY5GcnKEHT7WZQVsctETUgp8v1I/UeBisepPQ0kQMjiI/eF4FX?=
 =?us-ascii?Q?fuDst86kP/FFkOHDQB+UfsiH5EZE7KjoVuIzdQiIJ6ELAp3Tk6Mh7kitNaDs?=
 =?us-ascii?Q?1gDwNFamujydp24zZD63d80jS9+/bZjeD5sltDZF+7LK1XIA4lPU+OVh3jFm?=
 =?us-ascii?Q?F1ETHFmDOuDwrSQaiwQtJ8xWpsPXpUooZgorxqEaliqExxJ2GEd6tUHOQ0Xe?=
 =?us-ascii?Q?PflISnbT2zzmhUT+mCpQfJrDQJZk8pnlpiBoVPqtPi0uaCN2LgqmLXuIfKEi?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ade286d-390c-46da-8180-08daf2749753
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 19:06:20.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: io7ifq6d3k7ahMqLvBCQ8EQv+BahkHyrg3id2ZRElHbfvub5Ey+65Pk9AxDFIkl/05zGoa7ndukPT/EzZaBCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5379
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Saurabh
 Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Nicolai Stange <nicstange@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 08, 2023 at 01:33:41AM +0530, Deepak R Varma wrote:
> On Thu, Jan 05, 2023 at 09:13:35AM +0100, Julia Lawall wrote:
> > > Hi Julia, thanks for helping here.
> > >
> > > So, my question is why this
> > >
> > > make coccicheck M=drivers/gpu/drm/i915/ MODE=context COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > >
> > > didn't catch this chunck:
> > >
> > > -		debugfs_create_file("i915_fbc_false_color", 0644, parent,
> > > -				    fbc, &intel_fbc_debugfs_false_color_fops);
> > > +		debugfs_create_file_unsafe("i915_fbc_false_color", 0644, parent,
> > > +					   fbc, &intel_fbc_debugfs_false_color_fops);
> > >
> > > When I run it it only catches and replaces this:
> > >
> > > - DEFINE_SIMPLE_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> > > + DEFINE_DEBUGFS_ATTRIBUTE(dsa_fops, dsa_get, dsa_set, dsa_fmt);
> >
> > There is something strange in your question.  You have MODE=context but
> > you show the output for MODE=patch.  The rule dcf matches a call to
> > debugfs_create_file, and the context rule matching DEFINE_SIMPLE_ATTRIBUTE
> > is only activated if dcf succeeds.  So when the context rule gives a
> > report, there is always a corresponding call to debugfs_create_file in the
> > same file, it is just not highlighted.  So the request is that it should
> > be highlighted as well?
> 
> Hello Rodrigo,
> Not trying to speak for you, but I think Julia's comment appears to be the
> correct interpretation of your observation. Would you mind confirming/clarifying
> and suggest next steps for this proposal?

doh! newby coccinelle user detected! My bad, sorry!

make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

do shows everything.

So, could you please mention this line in the commit message so we don't forget that?

Also could you please provide patches for the other cases?
1 patch for each file is desirable in this case since it touches different areas.

> 
> Thank you,
> ./drv
> 
> >
> > julia
> >
> 
> 
