Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4181E7EF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 16:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3AF10E09C;
	Tue, 26 Dec 2023 15:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC6A10E087;
 Tue, 26 Dec 2023 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703603525; x=1735139525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iJSRhiLjh3+22tsvnEAeuSm5TraPqsCp9QH/isC6P1U=;
 b=hUhaDhbXt32vge0H65I3+52+gZ08bF6fAKjRNJFh8+Q1EWYmWLy3zNEC
 UwsrAT9sTIYnhSQEkS5+ECOXYWjVckq14reTMTJsFfc2G5fhyt/0sshjn
 +/efROOZvY1sEss2R0EOxt8V+i3u90Vwm3ifac0UsTYaD0INDuOnMat+/
 mNdztaajlq7iFPsU4HRqgRmOo/QD52snesDfO6y9RhIltKpu8T7tDBpsm
 9DP2oE3Y/R/1LDkPNtQEGKsc2xeBlhUwrj732L7Jbjw04orU8mMFAvaSx
 PVV8/TY2guEZSXefiAry6bfnO2uLuSTjd+S69NH/AVew+hsrjI321q062 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3441128"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="3441128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 07:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="754198352"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="754198352"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 07:12:03 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 07:12:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 07:12:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 07:12:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byHdqcOJngLaGF1y/zhF+cGsWFnu8tF8aPFdxVyYIWXfwKYHpglndXEzwceg3ehIGIBwTSl1ZjedClhr8zcBALEVDmyovLOO0gYLhCg6mNkaXXNzzlZ5OHmvLHDrBG5Y3ipdVc8qOonkUlJS3lwKkLEsof3KLaWscHPjjUZbZuQDK49S8hVw1eOpw/F62d9cd2Wdq7a4WGmHwGBqHVLUZpnSjzCsMZtiTc+pclDXQEwAWEP+15LqTmyw28gss61GgaVZe6TCTjqG91SSUdmYv2J2D3s8M1UU+jiMhkDzVZslPX1QHH+GNZQdirOTAHC6O0rEBoSnkfdI5r33Oex9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/Y5Ez0Jy+hHd0ZXlCYNSgAANBoCzpkAG0WyM9AWYxw=;
 b=hH4CZ5vZ6pc49QmqsvM/Ya5mS72qtA3rcZGzLAnbG2Mz3ul3PsYXkQ3Q8RLPmDibTLmaQcts48uVtKllyMmqW8AF3kBihh/5bEsbw2kH5GBoimZVpyAy5dc00tLwQ2t1hi/NqIauwXO+4b14ovpQFwmeNxp+o43iG2MhsPOCpW4/vsYmBUZToN++z3BRmZVMF9SUtE1AIUHCZv8jvxg8IYKQsQQVsFl8+ZvDnbyMm6MwFPJdge698/MjxplF5l1JG2kMsksiD06clplAglsY73NWr4MEZdCMJuGRXttUWJbaV6fXVYd/YeTFsfBVQjYPVl7r6XvW+pXBCey9r33J2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Tue, 26 Dec
 2023 15:12:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 15:12:01 +0000
Date: Tue, 26 Dec 2023 10:11:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v8 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Message-ID: <ZYrtPPQARTXBSAgM@intel.com>
References: <20231212165716.57493-1-alan.previn.teres.alexis@intel.com>
 <20231212165716.57493-3-alan.previn.teres.alexis@intel.com>
 <ZXogv_iKOSLXnb8b@intel.com>
 <b89b77629fa2c54a7bef358eb66d89cfe454ba5e.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b89b77629fa2c54a7bef358eb66d89cfe454ba5e.camel@intel.com>
X-ClientProxiedBy: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: a173cb05-3b8c-489c-5530-08dc0625027d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqhLCx2xO8Y3rQ9LmvHtAHlNlEGDLZ0k6wCgivUI1gC95E+Rsq6mNCYrDHDPQtcGCunErL9AwuB9QxesgwgeboQwryWr0xFh6RwW7aC2MfTmEdUz29WFzqy6eiF/Rrv4PoFwMM6Ewh53W3JyNRdVVR13TPQUd9U/qXmqC2HswOTi2GtgB8uAU2bQRcxhhbneI6jxzBFM+twvhudLlWSjcsSUkA5/YkLgjxSgm3H2XXdhN5ULfOt0pzpIAeffxLOUZp+vboWRTGobfJIn1sH9T3QgIP48S1YG/XYcfP6i8mPMcwi6ssKc3QGAOH4/yy8X4fmPlprNOCfDIm9seP9PEQ/6DlTIV8zcF/fb1AHQIHx/ZoNTXOg9mZGG7WRwrsXtZEHyuGYgutinzfgIECp3vcSz/Ix+Vg9z3wWU6t+ilOQOnBLxf0JXy0vqOx2sZANMY2Wdjgw3CKpQU1edFkx3ceVy5KTscTGsjVjnZay3jyq3cSSSgCvrrMHKBji4i9BiCaVJHnRsh5o3C+zO0+nFEO0JXzhQTRjzCXLI5JvFnsnGRJ7yfqUHDLUOHbHHDvQQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(83380400001)(6636002)(316002)(66946007)(66556008)(66476007)(54906003)(37006003)(6506007)(44832011)(450100002)(8936002)(4326008)(6862004)(8676002)(6512007)(6666004)(107886003)(478600001)(26005)(2616005)(6486002)(38100700002)(41300700001)(4001150100001)(5660300002)(2906002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgJjitjVW24sAAp9ELfaKPDd+Swm97p0ZzRqsOQ2V1eVZrLPNSvyZplTjyXq?=
 =?us-ascii?Q?5AvYYMvHbPSQp/AWaro/6pbVPnqoi0MzZfs8aSQ8G208mwz/tDOOgc0sFVHM?=
 =?us-ascii?Q?yXRQ4Tjqn+TsRP11xbb7dDknstYkVy5ikQBneoEw2nDlo1Vs7J4KruNr64Ke?=
 =?us-ascii?Q?NBmiBBDTZzEFeNZWqmFJ4SufS/N6ZrIpWEkoh9h4Da+82tXVIKkbyG1tm8Kl?=
 =?us-ascii?Q?/0cI94EjcXZrXm+K2ZT1da4nRvAkhjC2rkninSRSuVm7Eq86BFf1slDXUjHI?=
 =?us-ascii?Q?cD1AkWbLp8NkVpfT7FL7BM0+g9GX+pSL37l9pi12SY8GG4PiYKtdvrujLRoQ?=
 =?us-ascii?Q?zwP6wDNMGWSV3BJJ8sHbTYTHN+iogVCsJ6AWMUS0i4+iP6RR7p97/gx9IUT5?=
 =?us-ascii?Q?3XFn9Rn7JwJnG92WyJRe7H0xEeeoPUQFx8GL/JiGKZ+fNJwh3WTU5u9jT2nO?=
 =?us-ascii?Q?Srxv8cIycQLJIPWH6lDViz9MIGI8bQVpEsV9BmooTn4RU6oOGpOli6T1WUxr?=
 =?us-ascii?Q?TeRKokk09Wvj4U9z64gS7uUfebfnP8eb9hK+b5nvNkeK3dcbzbCcSP4pW2UM?=
 =?us-ascii?Q?kMmiufTw/iUkR12Yhw8g0KMBfVyAMWEfyrKavvACKphlRNc4tcNQsAvnGCJx?=
 =?us-ascii?Q?pMqgP/H1Gan22pAXhEYP103v9Cjs+Gt5BFbXja16XrOuOqU0F5W19xso3tpG?=
 =?us-ascii?Q?CRO8LZBz/GstxHa19U4Z6VWZgCW5QXnwm11q7dUSV5O0syTrnzs5a5wK+vbL?=
 =?us-ascii?Q?OrDVPpWx+l90NaLNSKiCL7HSuRieTIw3/nLTCiZMBE0eEdEXU1Av0ktcMIwu?=
 =?us-ascii?Q?maGTT5cxdPRCxHy7LRkSrFHox6s4AQe6VxZoVaQ9LoeoCL4SCLS5f6rjAa84?=
 =?us-ascii?Q?7fwOFD3RGqJqdcd/4TevB3zTRy5ZHjhjGZKEV31y1Wbue1EbKAvXb6/86fuD?=
 =?us-ascii?Q?nUU1kpezDwUSiDw30CTxvKKrarO+aT0Ug3sX9oEjKIo2ptEe2/vqLti/ry0Y?=
 =?us-ascii?Q?Q3pZt+sFw7KBJ6UIBqgbmdaRuXPiS7m/rR1BMRa3b01BBH7OeO7sWvntEqxs?=
 =?us-ascii?Q?FSuoHMitCrKFmaZ5TKIkrXUBtKfJspt2yD2mVAQQLnoWYzcgUNKuiLgJzAGz?=
 =?us-ascii?Q?Z770hYgxeoSE8/LH1ozJav+NzTxT0Uw65qveROstxZwximgTLg9Qm/ZO8smq?=
 =?us-ascii?Q?9R5w3nkOvruqOMCoH5TubHgZywWxpOEYEUNS8gc7avBvneJG8TiSOy//pIPH?=
 =?us-ascii?Q?fiqPTdtZz79yQAI8DUXnujrSIs0Z1jhuYZf6LJs3FrTxqfbJ52cNpwcINaX0?=
 =?us-ascii?Q?JfZ5oT9l1WV8TfnFK1ozpIrq1YGNeC8f+FzSpgZKKmLgIlB07bAzbGtGHN2z?=
 =?us-ascii?Q?iNLj/vkQQE8+bJP71DMkkVDY4UJZieDV2xwGUMmibRb1LN3kxNZX+zY/oghL?=
 =?us-ascii?Q?CM7Y/W28uMUsR/5KaMSYa5MHQFx8ITIxEhfj/9pPXt8qugpcZdqgyKyY+BVt?=
 =?us-ascii?Q?kSUQEjXP40RQPtXBkANH7QCIp798gtaGRPI9wf3hHtyDv81HlyNQ+WRStXU9?=
 =?us-ascii?Q?+nw2nF26KrY/XGN09rLZjCzCqvbZt7zzGIFs2k1A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a173cb05-3b8c-489c-5530-08dc0625027d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 15:12:00.8201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrVPWbmnFKFH3+LhsHcDXmySJkqYtvqVR/e2NKV6kYui2yZ/SoaVjFtkm14v+ZJ8L8vrIy7LKZoTqXnbWAbOQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7388
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Jana,
 Mousumi" <mousumi.jana@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 11:08:59PM +0000, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-12-13 at 16:23 -0500, Vivi, Rodrigo wrote:
> > On Tue, Dec 12, 2023 at 08:57:16AM -0800, Alan Previn wrote:
> > > If we are at the end of suspend or very early in resume
> > > its possible an async fence signal (via rcu_call) is triggered
> > > to free_engines which could lead us to the execution of
> > > the context destruction worker (after a prior worker flush).
> alan:snip
> > 
> > > Thus, do an unroll in guc_lrc_desc_unpin and deregister_destroyed_-
> > > contexts if guc_lrc_desc_unpin fails due to CT send falure.
> > > When unrolling, keep the context in the GuC's destroy-list so
> > > it can get picked up on the next destroy worker invocation
> > > (if suspend aborted) or get fully purged as part of a GuC
> > > sanitization (end of suspend) or a reset flow.
> > > 
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > Tested-by: Mousumi Jana <mousumi.jana@intel.com>
> > > Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > 
> > Thanks for all the explanations, patience and great work!
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> alan: Thanks Rodrigo for the RB last week, just quick update:
> 
> I've cant reproduce the BAT failures that seem to be intermittent
> on platform and test - however, a noticable number of failures
> do keep occuring on i915_selftest @live @requests where the
> last test leaked a wakeref and the failing test hangs waiting
> for gt to idle before starting its test.
> 
> i have to debug this further although from code inspection
> is unrelated to the patches in this series.
> Hopefully its a different issue.

Yeap, likely not related. Anyway, I'm sorry for not merging
this sooner. Could you please send a rebased version? This
on is not applying cleanly anymore.
