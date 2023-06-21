Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848A738B7D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D2710E322;
	Wed, 21 Jun 2023 16:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39210E31D;
 Wed, 21 Jun 2023 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687365412; x=1718901412;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gSYF97s6rl7z1Fkt8XEtCfCIMfdU3yUAxhsIVPnV/hw=;
 b=d5whaTluqL/PUD9o2G8iRo620/Vl6h3ofWrtPRjd44OBsrPnRURI2gQe
 Ird60LaP2wmRvq94I3YzpTFgf0Jr2Yy1ODO91LU7CN0DqX9U/0tnFNwX7
 C4/mhxdJF9jEhjrmfLgXIkb/4vNwLcsbXUBXdCpN7XujW/KAGWfw7nt4z
 8GSAX5Ha3djRKCCwfC+ZzFreP1jIBO14slRN9aiLoileRR8AtqV8zjm18
 I3XZrwCuZQF+Veu0ViIugXSru4NVqCnzVM5jECGt0nk+WIK9pCfgUkXfS
 z0QXqpyOCC4O8r51b+I62CXDx2K/Y2xSoqY690vd2Vg6EoO5X3RTVby/1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357730775"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="357730775"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 09:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="664728909"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="664728909"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 21 Jun 2023 09:35:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 09:35:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 09:35:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 09:35:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 09:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPYuFijmbhk1NWNPnXtlN8YVj8yqFbsUdMApFRaAe0WS8HuEX2FP4vW+Y9h7XMUyrC6OH5udmOLKiNCWWPmk0pM8RN8GNkL7RsFUJIhzortXAeuC7OTzLH0bOJu57aPsnqYR3SAhnz6i4jlxs1DlORSzHOjYenekeJk5kHAr/ti54t4s0P+XVUrpkeJjqpaaNf7mpp5182U8B3SwWXZJkmPB6AjruGIetdqvTuU/ZBf7zC1nAlkvh6lS1nCKfFO9MTiAXl5Gp2qv2GcDX1MZLaSKHWZXu8auPFmGbZlA4LcnuWnxExMNyg1QBv9dFJ37Lh0vibeYY32S//Xfm4bZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgeXEcmlceq/LkrM1+racpCbjK7hlv6542Q5aHzuji0=;
 b=X04hJpp+IMKwAgHQV8jLN9n7hTAwIRKR7T/xuokhMQwcqPuLi8XUwxw7li0aE04PQhLzeq8+jcdqNGr8EB5Ikjcur6m/3kJnk0MVVWru8wgJ07Z27AouyAKp4VbZX8j2NM20K79lypOjSXyJOutdLQjBcv2Ur1iMaVyLKqvHZksCcpgp9Fc9IxxWzmOTh5paXJo1E9s1nNsX2A0lzsk1SStBtW97vZORTo1pYQcG851Q4aTVlpYiaSYyAQnkNfQ9pFRgbvYl59kJcmYFb7Z3AZLBWPquCGjQSB0W2eSV/NPi95Kp++ZQsGiL7Md5EkYYBAV1O17UmMdyd2l+Gy1l6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 16:35:53 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::7237:cab8:f7f:52a5]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::7237:cab8:f7f:52a5%7]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 16:35:52 +0000
Date: Wed, 21 Jun 2023 09:35:43 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>, 
 Sumitra Sharma <sumitraartsy@gmail.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <649326df1b895_1c0dd29486@iweiny-mobl.notmuch>
References: <20230620180759.GA419158@sumitra.com>
 <79e1f37f-3ffa-0195-860b-08cc890d810e@shipmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79e1f37f-3ffa-0195-860b-08cc890d810e@shipmail.org>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: b38ac795-bcde-42e6-460a-08db72759402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXBYidUpR0ijTzIfBAmWetn6PcGvnWd3LV8uyjp9Ba+UQlQvEmV2B/VqHn7+tdf3JUCI7O3LOoJz9xXPgT6Pakaty3m7BcrIfV0OVia6cdy2supMsud2xYUAiX6vRfpBTzQQD2IbqtqskBnKvfoMb819CqrpN2/tNhgjz6yJ27Luc9PenEfgXAYQiDkeHTztQRenZXX+iU4o9CHjK2aI+qaayfbsavcpMD+yCrBfoX/kJ9HHI1B4G8MKUIUyYHGEtMPxlnk5bK58v/RSvAGeQusAe3assC6pf/maGKpW1rrnx/rj/nCmaTeoXPm68tUDB3K3XcFSTmSd6OvVCV5ORvogLSeO3dESO3yzWFFAK1YAL+aWHyEyKIV9Dg79CAuIfDeb29zL75WgIKgojhluSQCjUCFjSqPK0IyApP6sLOaN4dWiGl41TKP1lglqjpCUBLlXZ8tl9Ny4MyBXNoTgRG2l+Sg/qPT6AtAQMalNeREPvjA9Cav3sh6CMQLvMX2bVc1+nOpwITGn7YWrGdTE8hcWhTsZdP+tbBigSM4nxEwzef557y0BNoUimZAq8SsAEs03mitgs9qOr03iJWjNISLeq0xQi8Scz/e4CA42nuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(6512007)(7416002)(44832011)(5660300002)(41300700001)(8936002)(66476007)(8676002)(82960400001)(66556008)(38100700002)(4326008)(66946007)(86362001)(316002)(6506007)(6486002)(2906002)(9686003)(26005)(186003)(54906003)(478600001)(110136005)(83380400001)(6666004)(60764002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4wLJSdcD0qdd10tl4d4V2nwgyB0gjN7Yn8E/Nrs+PeW+cQfhQzOFh0KpOr?=
 =?iso-8859-1?Q?0iGBI5XMJ6M+n09TOLnligAfiTNB0fLMSRmO1dH7N73YQs59KFFlyKha6l?=
 =?iso-8859-1?Q?uX33g48IzI1k5iYsrbjmVXMgpx9D9Yp1ATCc76GbYbyXOQFuu2r1YPydpK?=
 =?iso-8859-1?Q?o3MTnD7Gb572ucs8hhZAXKiTT0JeU52TwlGG2WLR9HZ3Urd8QN7QGetCy4?=
 =?iso-8859-1?Q?I06fJYsN9fdu3uKtMHiusTP7h89hVNV28pPma7JHxqHPX3Cd1zV3Ok0dBp?=
 =?iso-8859-1?Q?tCDDsZS8pE42D/cZtypJmqKXhdLl2SN5JK07oubqv0Qt65zEAUSyZsyUfn?=
 =?iso-8859-1?Q?hgp7y/6UTnQOZhezOvOi88fWhrFPAfphYmkkRI3ZGqLed/QTpbmNRc/Pmy?=
 =?iso-8859-1?Q?8X10yJbMIFo/3zHwQtVcyqUfn2QmhpID8vjHOD9MjshfAvbrBSyOfbAhZw?=
 =?iso-8859-1?Q?BcBGPB9YYoakog5BoakZe98+KLEIVe03UYspVRvKOerXtYYCnd6xwqqLZ3?=
 =?iso-8859-1?Q?5/x5cJfIPpt7tO/bWw6nj5+aLUGilUCoPO23G3SuzmMNlwxXAWQJhOZG79?=
 =?iso-8859-1?Q?DkGZwwweejfyJEnEEQQYTrDonDp1XN/kNVQBJ3ltwREiLtnpkuirDgXzPI?=
 =?iso-8859-1?Q?99/VhL3aG5xumYnxCRFx+yXNl+sRLbxLMCXTh8gP5YGKUwvC/ATwQ0deuW?=
 =?iso-8859-1?Q?KF66xopt///QY+SbxR4fO8A7yzwC2wBOJ5YcEKHFAsLXq+K6g/yDgw66oN?=
 =?iso-8859-1?Q?K+DYxuIgsnvbrA8Ixp2QZ9N56x1cJx7s9zi2rFwWlS/gzAaViA1g86Phpg?=
 =?iso-8859-1?Q?oHyk4T5t5vpjWu/3sEaXoscTfsgGwcMshNu6vNyHE9IKC5AoWfgsJsplhV?=
 =?iso-8859-1?Q?rIdhbr/CE/n1s9XVxv/sbB63VEI4MLAG0YDFppyBojfC1xjr9ayDYh7qfz?=
 =?iso-8859-1?Q?+P2hmkahkWKkjvLTIzTvDqJDTq4ZBacOGBB6S3X7xm7BKWsCAim5SYKCgl?=
 =?iso-8859-1?Q?+IFfnz/4BWhh8uNMXXdR8PdRZrNZ4I/lUblGl4HBd2p/+IlN3Q+FEfqyAW?=
 =?iso-8859-1?Q?2aJ4I1U9FUqAuIDXIXjSI6prGJTzQCGiUNQ/6HSWDvLRKYL9Em6GeEXhnq?=
 =?iso-8859-1?Q?lpgeW+0gZTRo2t8XDwS9jwfR/RWSNxYfcybfz2kr1j8JR3LaqrSDcPW/ye?=
 =?iso-8859-1?Q?PEDpgyhKheI3G+YzWJ6anXu9px5f86kbb+Eem7Zq04nz+0Hzmt/czyVOER?=
 =?iso-8859-1?Q?P6bH2iRApVorEloKdZo0G2VWVlIuYbc8XBDWtGnTUloIKKsH4hir7StdLf?=
 =?iso-8859-1?Q?Hb7yMJRuITxIQP7MZnppjlraewMSI9f//s1pQ+n9M7IsiUZUFr34m/cycR?=
 =?iso-8859-1?Q?TOqApGzU0xjHZ0pNsJcAvOz4DqygE4M+Xqf28ucHK/ZdHkvk0amL4QPXU4?=
 =?iso-8859-1?Q?93qG+1R3Xpzc+632NSihyrC7EDeyy2gDIg/5W6YJmwygSNWDzmtVMLQsEV?=
 =?iso-8859-1?Q?WVFSGLgB00yHpqzvFAUouYQXZs53NodCiiZ8T5UsXG+mu4DYPrZZr7GJ7O?=
 =?iso-8859-1?Q?zwuoS1xR0BKZMvn0IxfkmE5E0p7C0VP0sZPg4WnGKVL1D0Fo8GGgnWgB/x?=
 =?iso-8859-1?Q?qoZt9VlP4FXOj6TPhEPJGjeAyL8PSJEmxN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b38ac795-bcde-42e6-460a-08db72759402
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:35:52.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55cTgIPdqj6RyrwGXRhjiR27xTP0lkaGruHrmGXcvks3uLu9T3OmEuUDc2eH2VGBB8Evwc4PA9WM2hv2PUvitA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Deepak R
 Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Hellström (Intel) wrote:
> 
> I think one thing worth mentioning in the context of this patch is that 
> IIRC kmap_local_page() will block offlining of the mapping CPU until 
> kunmap_local(), so while I haven't seen any guidelines around the usage 
> of this api for long-held mappings, I figure it's wise to keep the 
> mapping duration short, or at least avoid sleeping with a 
> kmap_local_page() map active.
> 
> I figured, while page compression is probably to be considered "slow" 
> it's probably not slow enough to motivate kmap() instead of 
> kmap_local_page(), but if anyone feels differently, perhaps it should be 
> considered.

What you say is all true.  But remember the mappings are only actually
created on a HIGHMEM system.  HIGHMEM systems are increasingly rare.  Also
they must suffer such performance issues because there is just no other
way around supporting them.

Also Sumitra, and our kmap conversion project in general, is focusing on
not using kmap* if at all possible.  Thus the reason V1 tried to use
page_address().

Could we guarantee the i915 driver is excluded from all HIGHMEM systems?

> 
> With that said, my Reviewed-by: still stands.

Thanks!
Ira
