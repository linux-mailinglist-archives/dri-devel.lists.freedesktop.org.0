Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7AC827A88
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 23:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFB410E329;
	Mon,  8 Jan 2024 22:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5410E306;
 Mon,  8 Jan 2024 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704752160; x=1736288160;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zoqU6W1emdAjjdR6n/U5JvLzg/1YKvMbMOPtNp8HQKA=;
 b=GjtomFjJk794NKjdA1X3amGqix9c1FwOJT8OzhcqfrBNEtxGnWGWodrw
 y0sgR/DQVwRGRtQZbazk9VM9uaFvDhTXljcG6m9xLPokeMsknDOdx0RVs
 /51m6Ny7OAT9VXQlCHOymLk274fmAOSwg9t9Im2AQB4pTA7CRianAU5+B
 nbOSOvPiTnCVukptpt7nHRRx0uC9DK1OP8YrJ36rPotHAB65M0TQC/MJk
 z8d+ZUnu0jYgz9qey2Ocy1KSsJtbo1qpq+vUh9SjYrVMjaGAVYnTXcmy9
 reP2lQRPBcPc+iA9oFTpEfSuPKwJnTODW6iCX8B60IyYKgPRgOdYEvYR5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4797848"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="4797848"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 14:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872015544"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="872015544"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 14:15:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 14:15:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 14:15:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 14:15:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTCgljtWs57NiFt4BuzCfP7BDKVN2kOdB9y1YoSXXvv1U9o+Mm/ZrMJzCJXjonufz5UDDlRGaGmWOdsK2awjwcs9Jddz5gz8Q4vlKdT38AbcxBn4aHo2bqLw8X3ndz7/wHtzpS5kd9T+43JCJTqW3bMjIEW5w1kKq6NC/X/j9GdRltKz/4Exob0KPzoGGTOGZtKEfolgWZCKwNf1CRtCwMoO5N6TYnF23/PDQ8a/b0Ns3iau/d5/st2ckZMhvPr5FCmgNi05DKhIKjrWatTtIjQdAJB2ktzAJblOW+234oSJk6u8NOnA7TJn61LvOAlxhwBHl/bJ1jXSNyOf5hjn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYnR3g9lsjNnwjsxtZsA01L8k+wC+1e4navdyErIAAg=;
 b=m2vUFUCfiC3aOQ+nVTupfYn1x6skPP9pcQpYJrwilCP3dNzG3NrKCYFcQQ6sabQ+U4OxR8/svK1uSAShSvIaAPRJA0cBh/xK8h3gQEPEH/dYKwPzwx+tHKQdoXTkfTILSqDGoqQh8K+Bl+etCbf2wtRtD9d6go6uQ3qk0UL9crm4zl4nAKObo1mLPXupbK5A272W5rzxWuJWKxkcA6oH7UICRHrXZReGimFHzHgP9dCAuamXDySgXiQabCtDG7yjW0iEPH7nENSzgzWTRUsKv0yrUOqCFuYkdT70sx30t2CW5VS5wMlRzxz5TV3n0z+NWoeQA2dLnajrwbNfFKnOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 22:15:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 22:15:55 +0000
Date: Mon, 8 Jan 2024 17:15:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Message-ID: <ZZx0F5w6COxVcBVz@intel.com>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <ZYsb09nsERQFDCQl@intel.com>
 <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb63758-12d8-4fa0-2150-08dc10976234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDaj1uGku6ZVeVCTA00DtYTuWuqlxhJ0Ef/YZZDJfkIhEp28F/QjDo1cEU8PDIZtpk9WCd+bHI2DvfErFqApUFbEnM4K1Nsdgrl6CjmSktEy0HdI/KA+xhMUBPapMvBZvfQbyWEqLRmsjsYJh9GQmUtc+DDM/ATbcuWLe8efnN7B7Tvm5ugidg4jOMAk0R6RlT4euJTQIpbbNQxjLwfqKifXTK2+HD6bnZBgTroU85SicPzt5ap0+O8F6cxLIlxJAMjAlK5o6kTjConTOX4eNPcpxgEyqLCQ+mH7XQU9bdUZdQDqs3yPFh2a6lAOwuDgv5f89W/3UXYa/16qZ2KDH5lFns7zLaI+114UIphHUIODPyS7N6C3c5loS7ks8rRKOXzKrfJsIcimoind7Ok8UjRRDjQANG3cT7Txq7wRhNpjkwoKVgcPsmdiSbMWVpHL2rtalAYcWpqBPa4woLvfrCbgzqKTM9Z11qQwEEaeoMyCWHvOM3Fm2dmHKkP2cv9BQn2o2KYNESFVU0I+isP3WCqMYWp2Yvi5MfqR9NjrWr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2616005)(8936002)(8676002)(6506007)(6512007)(83380400001)(26005)(66574015)(41300700001)(6486002)(86362001)(4326008)(316002)(2906002)(4001150100001)(5660300002)(44832011)(66946007)(36756003)(6916009)(66476007)(66556008)(6666004)(966005)(478600001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Opx/xUiPqQd03BIUQ/qfLi3i/YAPU0xRy9G48i24jsbCxRD8gVfXguEgE5?=
 =?iso-8859-1?Q?95EsU4RB1h4aISTHW8Xc21Rh2ej0zuW3g7mFNz0FbcLQ+vi3fbSDTxh2tv?=
 =?iso-8859-1?Q?OI1m2x13B/aKJkzYmALKA31I+g0iu/CzwfXsG8p2EyzNNyn/uebCWZUdf2?=
 =?iso-8859-1?Q?Pcugbd+csRMAAB1BHX9nqwtmX1V2lb5jkKh/P9G6JTkiiEof+rujeoF7RC?=
 =?iso-8859-1?Q?U7p5snlBOTfxXd41jsabYuerCIjnW0XDvVe3zZWx/0/RTKyIpN2yTjP+Eu?=
 =?iso-8859-1?Q?/pX48MgzEx9vhz4LrFGGalJaSl2FcDmmqzXrFG/dEDjfBY+cvKhMC+eOBX?=
 =?iso-8859-1?Q?Oxl95yeqRZKt7YxAOxrvFY3vnIQliiyTmzUa4ZYZwXbvQ7KMBasAbVo2Pd?=
 =?iso-8859-1?Q?4b4JP7P9j960zfqwInZHnjL9QJ3vVZJIGdbvoiNg7FYWdn9P24fAz5ok+P?=
 =?iso-8859-1?Q?tDJ93yadJk296JghjOBB3TWS6e4dXJPSMVzBP1Srk0i3lU3Hj7zxVOweXe?=
 =?iso-8859-1?Q?JRFhtcxbJjDzrDtfgzIkoT0Gp5u1azHLeUIUEVJcKTkzjEN+oxndsAGRwL?=
 =?iso-8859-1?Q?+YJ9xYS7RHpdY24jbt8SXBn0vkcEuP+irUvHIwpjpQj/bwS9Y5hW+48EB2?=
 =?iso-8859-1?Q?VUrxk7+nv+FMk6FIxY3RErJsktptI1pKRBdQUlRJsGO4npWYHVcRm7x50W?=
 =?iso-8859-1?Q?cjZSfWjLVfEza+ZdHU8FYVrk8xm+Aqmzjdl0QcEfJclntq/zUYEpHPWuYJ?=
 =?iso-8859-1?Q?uAJpQEjIo8XvOxR5aFG7GKnF5Eyk25Mb8PolAMBqXEIw/Mg0US5rya72Nz?=
 =?iso-8859-1?Q?L+zquQN7QqOp7hB43jiqgXWA9INns5hL3kuTXBD5e8K8uUaBZPHF9WNSYU?=
 =?iso-8859-1?Q?fc0KXJOJEr4XUa21iS8mOZc0VoQX7ptUOj1L2yqCgp9i2PVosc+ENYab6T?=
 =?iso-8859-1?Q?sL/f0n5iBcajksvQpeR+Z5ELgpnWVO4z9SO+ZvT+YLUOl9PwE9+h5NRCs1?=
 =?iso-8859-1?Q?ye/N7HC0ZVpEW6hmsAbuBKkWd/w+pUBwH3LIqYhz3EGksEyE4XVpdpLphP?=
 =?iso-8859-1?Q?X/QVLx6X4GXhLXryEzuvXda/8WjdLVD9VknXIM0tQHvL8/bAeWI0WtoueL?=
 =?iso-8859-1?Q?uf3kUhl7GeabhwNqA/Snwp10ovNuDOf+h/t0h786TryzaRuHI4Mz9a7Pqj?=
 =?iso-8859-1?Q?TZUJ373I9KXFARArVpG28lanf2vuHvdRG+S21BH2NLN5yuGjEFYjAvJmQf?=
 =?iso-8859-1?Q?BtDsdb0jAwZgdHW8NrRsHm7FY29S4UGD2oe2QTCXJ/31NaUyjM5CL9P6VJ?=
 =?iso-8859-1?Q?F5pCnlIAWSsO6pd0kw7etJXq4tjUlyP2a51rGXPxLPATdXyUfRPMxuuWwq?=
 =?iso-8859-1?Q?AyHyioI3VwSRfP1/wbGKuaxVE4fiOYrmjWiEBo3yFI3Tl7GlKpyWC4qQws?=
 =?iso-8859-1?Q?JSxF5PCjf8hxJAXnEPyYkdb1KhiRaqn6cdN6SSvfARDITAZttbOT2BaS4q?=
 =?iso-8859-1?Q?LLcsnkgcyUfwkFrSalpRRmqFBFtVv4h+2rxUT4O1oGyPL5HAq6QlLl4Jo8?=
 =?iso-8859-1?Q?pUGnfhW/k9Ps+3NFb7tFRp7vXKR6+3mZs6di7qDEFe34W2aLmuGBzMXcJC?=
 =?iso-8859-1?Q?r4ta8wiHae5mhGJmC6suJXV249Nz5nKzTf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb63758-12d8-4fa0-2150-08dc10976234
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 22:15:55.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqeiGbubR3nLcX14xF4pRl0k//sZwID+izUMejB1O1pU/xhJUpUjVRvKazP62y1/M0Zx0FC9NNWUerRSoBojEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 02:50:57PM +0100, Thomas Hellström wrote:
> On Tue, 2023-12-26 at 13:30 -0500, Rodrigo Vivi wrote:
> > On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellström wrote:
> > > Add the xe repo to drm-tip and the dim tools.
> > > For now use the sha1 of the first drm-xe-next pull request for drm-
> > > tip,
> > > since that branch tip is currently adapted for our CI testing.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > Cc: daniel.vetter@ffwll.ch
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: dim-tools@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: intel-gfx@lists.freedesktop.org
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  nightly.conf | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/nightly.conf b/nightly.conf
> > > index 24126b61b797..accd3ff2cc39 100644
> > > --- a/nightly.conf
> > > +++ b/nightly.conf
> > > @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
> > >  https://anongit.freedesktop.org/git/drm/drm-tip
> > >  https://anongit.freedesktop.org/git/drm/drm-tip.git
> > >  "
> > > +drm_tip_repos[drm-xe]="
> > > +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> > > +https://gitlab.freedesktop.org/drm/xe/kernel.git
> > > +"
> > >  drm_tip_repos[drm-intel]="
> > >  ssh://git.freedesktop.org/git/drm/drm-intel
> > >  ssh://git.freedesktop.org/git/drm-intel
> > > @@ -65,14 +69,17 @@ drm_tip_config=(
> > >  	"drm			drm-fixes"
> > >  	"drm-misc		drm-misc-fixes"
> > >  	"drm-intel		drm-intel-fixes"
> > > +	"drm-xe			drm-xe-fixes"
> > >  
> > >  	"drm			drm-next"
> > >  	"drm-misc		drm-misc-next-fixes"
> > >  	"drm-intel		drm-intel-next-fixes"
> > > +	"drm-xe			drm-xe-next-fixes"
> > >  
> > >  	"drm-misc		drm-misc-next"
> > >  	"drm-intel		drm-intel-next"
> > >  	"drm-intel		drm-intel-gt-next"
> > > +	"drm-xe			drm-xe-next b6e1b7081768"
> > 
> > yeap, up to this commit nothing else should change, but
> > then we will need an extra rebase of the rest on top of drm/drm-next.
> > 
> > But then we need to decide where these following patches will live:
> > 880277f31cc69 drm/xe/guc: define LNL FW
> > 2cfc5ae1b8267 drm/xe/guc: define PVC FW
> > 52383b58eb8cf mei/hdcp: Also enable for XE
> > bea27d7369855 mei: gsc: add support for auxiliary device created by
> > Xe driver
> > fcb3410197f05 fault-inject: Include linux/types.h by default.
> > 8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs
> > 
> > 
> > Will it be the topic/core-for-CI?
> > or topic/xe-extras?
> > or what?
> 
> This sounds to me like topic/core-for-CI? Or is there any drawback with
> that?
> 
> > 
> > Anyway, for the inclusion like this, after our CI is ready:
> 
> Could we merge this patch already at this point, considering it will,
> at least for now, only update drm-tip with our fixes?

yeap, likely a good idea.
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

But we just move the final drm-xe-next after figuring out the topic
branches and the final rebases fixing the tags and the commiter's s-o-b
and the fixes tags.

> 
> Thanks,
> 
> /Thomas
> 
> 
> > 
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > >  
> > >  	"drm-intel		topic/core-for-CI"
> > >  	"drm-misc		topic/i915-ttm"
> > > -- 
> > > 2.42.0
> > > 
> 
