Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854E5FC013
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 07:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DE110E0F3;
	Wed, 12 Oct 2022 05:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4269710E0F3;
 Wed, 12 Oct 2022 05:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665551728; x=1697087728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g7CB3zhTWOUC6zpSwlIrV9kY+ZW381v5bzKl4rGr9TM=;
 b=cGyThZb5IBSDehd6FaUCmMPDpPgTkKn3u5PboQlJs0NW8RSuoWxkP2bI
 D1AKcDzN71XwOKozri0F7IGEShxybrcihA+KlikP3fHAm0Tgj3ukRkcms
 o+OmJIlBd1Wk2ppr2MIHgwLFdInN9wXw/b7zpK7/a2AubzriMclwjKDda
 +Odz/fspDl/1/tVCNGPiYojMoF70OCJi/emC38bhahS6fMrrzwIgU7IgT
 H5igrf3vfxf9Q0byQwSi6I8RyB32m4Zh6dlDO2Kn4PqrXX9T2UTv6mEwd
 synpZnWP0DtbfqC6+vr1KFqF2H/DdobBM41mJ7s3qavNYyg6/kUBMzRjD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304687377"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="304687377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 22:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="657633073"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="657633073"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2022 22:15:26 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 22:14:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 11 Oct 2022 22:14:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 11 Oct 2022 22:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKJqRLRuS4tmfkGnxP2aq8wJzqhbEyd2/BqsUIqqBQWrbQpxx6iCR7hC31Py6s0nXgv4fcdQMOQu1KAMWvQ4J/eCYYreUeXafirtOsrjW6gk7giceTK/32Ub4DF5nX3NpR3Jrsj9n1xrukxO+Tu9v6215XEVdahLmwncEvcj/KWffjTosfWdpZuLHCDw4FVaBTw9WzVL/9ZG8nCFe30zKI98HvL0f+0LDFjc9gDJv9kBSHvs502JTkM2NvlVy/Za2q1aF3gqgDmVC2uvlI03fEetHzzf5l22MZpou01Xp60ZBFl9I399rE0PmosdQn05SVTPukrf+nrqJr84S2TFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYeo6wHhSO1GAGgPw1TAACiOLGvf1UJHV+kxYiMb42Y=;
 b=RPEgtnpDzKfNh6MyZAvzpJctes4BA3427oe7GKBYO2F04S2AOPceFkhDWYk/D2AXWllCS+kIxSlSIwCLmLKfXEEBwUhQNPnV0Q09Asr9P0407YfXO5J+FFMu9iVnqJyfq1ko9ITgJnW7ve/nX1PeQq1BAC7WQJ942Ac3SpSw3rUcS0QWx3IX5Tw+p5S/6Ptd6dDiZCT68mc4+DIcG/zQ+97ONme+A//JrTlO6WsvLPC3IWupacl1HjncZ29IeJMBfo2xQtr8mjVLOeZOQXKueSVkVrJC7XAHjFtQudO1jMXDUoFXOhzsuM/Lpjwm+R5nIRLvReMi4HwMh9oIf6RVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 05:14:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%4]) with mapi id 15.20.5676.031; Wed, 12 Oct 2022
 05:14:01 +0000
Date: Tue, 11 Oct 2022 22:13:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/i915: Add _PICK_EVEN_RANGES()
Message-ID: <20221012051359.bmyausqhzw2klcqe@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
 <20221011-pick-even-ranges-v1-1-1aaea52752ed@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221011-pick-even-ranges-v1-1-1aaea52752ed@intel.com>
X-ClientProxiedBy: BYAPR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:a03:100::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a5b768-4395-4cef-490c-08daac1092f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaMtDlUievVbi67g3yeulE9kWrKwp+NYVCtjscSeqoyL9b9JxMbIaNjtZt2aDfjK0wQDbS7kU73u45r+X+xMjdTRErmV6cbHoUGLZchuqmGim8pbtMGl9CFvRzZ1nzc7nPrnQXTBBkqpiQdXnPLn8G5u6sB6ybmdm2wcw2pdFcF0LtYY/kAvdXzdlqchCsfiUIH8wQzTe7r1gqHqoxR6h5F1bZ2rQzHJOYmQBtjvz+PYvNhcU2jDDn9jqJuQ4K9OEMDxRRd46GYsWoQBCAs2Ugm97QsREQexg5HgIXFDbgprB8FD4j7qCQHiYSSwkuyYC/cmb8U2ZS5h0WSu35iYk6dCQArE723EIgscTa5XZQhluZq34/FKqUWedlaRSo2cbgeWqzd7y+F8CE5TjpF66sk6KvkwjHMT+aymWiuLqZXW5hRyO1IBDHEqa2xYBR2ZHISKBTqJMpEJTb310zAOeU/lCrD0AtU7CQ9Ia0wjaiu7S8nPoUx07CugVx+OhQu+KYIrHR1+k8EJIZ3AmgVRdwGq2jgNAGjP72o+yMZoyi6OebceGeyN8l9vM1DEvwx4USM4FeYsJK8TA27JrlR3P3sQawI6N6YLRMPg3+KIXzrS/WhmK6EMLnR83uugpC62xsCSIV1yZqrxJZXNuCeor2JFyTHKG213hD4Tp/2PZD7jnwADPE5UPeqFRJQdBmlPXnty7d1epbVQZcAp7tQxvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(2906002)(66476007)(66556008)(66946007)(41300700001)(5660300002)(8676002)(4326008)(26005)(8936002)(36756003)(86362001)(82960400001)(38100700002)(6512007)(9686003)(6506007)(54906003)(1076003)(186003)(6486002)(478600001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hJB9SuT9RVvx2rymFDAsefHUUknDdyn86sdYJk+1jocsLgl988pgOwQC7fLQ?=
 =?us-ascii?Q?30SngFr9S02ueLKYKlvg8/78XET07Ds+CHXpDZohYhqhTz+rge6E2dX9LjvG?=
 =?us-ascii?Q?IKDK3Xk+jF1TeFA98/PkPnhM5dOPfljXcofMcoD3L+nkuyLofJC54jCKO/RZ?=
 =?us-ascii?Q?LUb+yJnEl2k51uNi0oGfBhqkT23oNzD/xcMoAtkrnHxUjqcPRhBYkrDnzUBw?=
 =?us-ascii?Q?tHNIhD8n+Qrc7r8yYiwbYTtG5iXRfm14N6VFfUNzD2g0Gq0/K8dzM1UF14Dj?=
 =?us-ascii?Q?mib0nD4kV21NGaX9LJsbfROEEGVYugqHnt2qo32dS3rYRy988pOcaHUVW6Ze?=
 =?us-ascii?Q?/9EU1fCMeBRBAHqHqMmShP53bRAjQUwbgitJ49RhXZGDGsc5ckHf/v7ZQbsv?=
 =?us-ascii?Q?j4/HgBAd1xvWETzWD98LJHIUXsSTTOBhdh1fHcGCnmie2TL9D7iRlD3WkEdY?=
 =?us-ascii?Q?fB49TonkTKu6Y4ppk89ZpIPkDlCZy0ezyCdMD7JJAVEay5eTrAilBHHwk/cG?=
 =?us-ascii?Q?IRnNcTy6YZLbhz9ipj33j07JpURvaWbJdCognUtYHq+IC7a/DuMZlbLp8aE9?=
 =?us-ascii?Q?/yCf4X0AuaFTdT3AU9yl/waTb1RxrX5KEfSRMOuwlSlloZ0JZP5I1uY9LuEI?=
 =?us-ascii?Q?6IfYX/oCbVdGxPbXl0SyL9UHn8cPHKIGH1yRFtn3mIq+YEDdjHKSCAHy7qYZ?=
 =?us-ascii?Q?TFjRfZ4Vy8Q6zbdUQCvUCsbK19HYCuqHgxYAuzQIraJtytBIETnjX+Dxo0jA?=
 =?us-ascii?Q?ljlTK6frD76fFnKUN3mDV4Xm1ggoMiMW/6wYyc90gg3UwVuMiS7xhFrIjceU?=
 =?us-ascii?Q?WsMI8q6wehAtxKOJo8mvwe+HtmGLyR09KpIUPRYwprCiUj0kxGl1QsYVxB5X?=
 =?us-ascii?Q?ofbiJtj3uFOSObt/zKqzRtY7B+simiLXDHnvvh7psgyWfN+7NdqBkWOXwsk9?=
 =?us-ascii?Q?N+VVQ5mS8A4mwMVA3B/0JVAfAaWDAj+FYD+vyptP2svwac0ETB/YV+xrsRkO?=
 =?us-ascii?Q?/EGyfVF5h8SO5JEDOwrXbPrlIIwV8Dibcf2YNImGFZxCpcR027QaIYpYMEp/?=
 =?us-ascii?Q?QTbasWnRWBQnBgNrU9N9tg4Qg/bx0U/iZxWeh+yYToQLKtjftOvyUcSM0ric?=
 =?us-ascii?Q?3IoC4yzBmBbw2KOeaZIqFHmhOwHiUsYZre1CaQcjSIjJ+lNN7WzSh0fUYpYW?=
 =?us-ascii?Q?Tn109RYlvAGaU+ktP6EFPteAIa0mNNM9MauE3qL95+mRt10VNt4xNzA8BU/o?=
 =?us-ascii?Q?DRtMjKJQTVGzpoPqqfrFRKGfxOHlSx/RtndfLvvk4aGsSo9F4vcDy25K2Eb9?=
 =?us-ascii?Q?Ah3deevQsgqrI+vGBVlTkEnKbbedFQcFXCIU0Z9UBVam9Ibe3p75erfDwlfs?=
 =?us-ascii?Q?Dow3gOY7lev29ypu4CsGqG6SrlxYisjjdoYz3370IDwsphv4+Dh02xVMvLUO?=
 =?us-ascii?Q?8wcmTkee4rt6+xW3RzAoquZR0lKDkKOy7aAuSgx2mOt+FZktl3IKywHD8+/e?=
 =?us-ascii?Q?JtIeV2F2I7rjngK8KgendUM9YrkWNM6yOjj6+I/eXrVyUlw+/8xv8KtWlp9j?=
 =?us-ascii?Q?4GODJtn1te2Q2IAWLwQhMmJq2U4Rh8hjdYa1khhv4f+BVJoyrbyniucg/bkq?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a5b768-4395-4cef-490c-08daac1092f8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 05:14:01.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P3LweLcqaNpX1thg+5qbniOInKw9fFLvcXUywyEgi6XqXmEJlQg67DspS6HZkDTv5RudHc9AdNM1NwTqsFR7DkJ0LuwDN8VG3KNkeQj8lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 11, 2022 at 09:51:08PM -0700, Lucas De Marchi wrote:
>It's a constant pattern in the driver to need to use 2 ranges of MMIOs
>based on port, phy, pll, etc. When that happens, instead of using
>_PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is discouraged
>due to some reasons like:
>
>	1) It increases the code size since the array is declared in each
>	   call site
>	2) Developers need to be careful not to incur an out-of-bounds array
>	   access
>	3) Developers need to be careful that the indexes match the
>	   table. For that it may be that the table needs to contain
>	   holes, making (1) even worse.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>(cherry picked from commit 55a65ca6e5d8f7f46fe4cf29c76a9f1b4ddef5ce)
>---
> drivers/gpu/drm/i915/i915_reg.h | 18 ++++++++++++++++--
> 1 file changed, 16 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index 3edfbe92c6dd..d157dd693e41 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -126,10 +126,24 @@
> #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>
> /*
>- * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
>+ * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced addres offsets. The
>+ * @__use_first_range argument selects if the first or second range should be
>+ * used. It's usually in the form like ``(pll) < n``, in which ``n`` is the
>+ * number of registers in the first range. Example::
>  *
>- * Always prefer _PICK_EVEN() over this if the numbers are evenly spaced.
>+ * #define _FOO_A			0xf000
>+ * #define _FOO_B			0xf004
>+ * #define _FOO_C			0xf008
>+ * #define _SUPER_FOO_A			0xa000
>+ * #define _SUPER_FOO_B			0xaf00
>+ * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, (x) < 3,	\
>+ *					      _FOO_A, _FOO_B,			\
>+ *					      _SUPER_FOO_A, _SUPER_FOO_B))
>  */
>+#define _PICK_EVEN_RANGES(__index, __use_first_range, __a, __b, __c, __d)	\
>+	 ((__use_first_range) ? _PICK_EVEN(__index, __a, __b) :			\
>+	  _PICK_EVEN(__index, __c, __d))

humn.. I tried to simplify this with a "__use_first_range" but now this
is broken as the index doesn't start on zero for the second range. This
should actually be something like:

#define _PICK_EVEN_RANGES(__index, __c_idx, __a, __b, __c, __d)		\
	 ((__index < __c_idx) ? _PICK_EVEN(__index, __a, __b) :		\
	  _PICK_EVEN((__index) - __c_idx, __c, __d))

Lucas De Marchi

>+
> #define _PICK(__index, ...) (((const u32 []){ __VA_ARGS__ })[__index])
>
> /*
>
>-- 
>b4 0.10.1
