Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA08A7B5E1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 04:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B108810E1D3;
	Fri,  4 Apr 2025 02:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXKnw857";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B379710E090;
 Fri,  4 Apr 2025 02:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743733921; x=1775269921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=43I3wCtt4p+80U4/W9+JZtDaI5ngTedZtxcVsoDVCoA=;
 b=AXKnw857HyfhCew65HC42uc2LJCrPY2H6mRTGwFF03fy7ukkteALY+a6
 6a9uzERKM9mxdLH7Vjj0xy6a2ArgTjO2uk8SOYLhTkcJx2tzLlgVOIesh
 onxS3d+CIljd9EsZcuIMthaekcnNJMAgu22UvF1pWym0/Gua09g60viY4
 9IB9TzrHiLlCzDiajsfJ9EgLN1kIxMtlDfUF9UQpGby18i3qfwyaYKP6o
 Wk7FQrpk2jwoIGewxA9G1H2JmmoaAbVkz/MmiGIu0z7P59KWg01rTBNOZ
 P5/FucKspZUsbUedbwSvoNyewLnIzX8H9wub1YYta7gMc2TvxH3n/1UKh w==;
X-CSE-ConnectionGUID: 3htpZMBbRz2Ev+73D92HKQ==
X-CSE-MsgGUID: BMAB+6rsS5yRCygvFtmfbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55800876"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="55800876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 19:32:00 -0700
X-CSE-ConnectionGUID: xYwp519PRwSzHJM1L+z4RQ==
X-CSE-MsgGUID: qWFOSqphRVqXxabIbuaRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="126990595"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 19:32:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 19:31:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 19:31:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 19:31:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+gpZZR536yD0cbBEMS70mI7Layn6F6p8mRsqb0qsXDwMMJRuOpVETELAcyd9HNrwwxkNHepj7yehtm36oE0NZQGR+OJHUHmEo4+iUwITT8JL3F0gtQMDcYkVZQ/fLd1Q9gAjtS8t+h8ph7b8aw3seHoQQaaLZDEywZJrrO9v5lWIsj7GLfQsb/zD24iUdryamNcGo8hSwWHa/356HvUxGZl2Yl1tuAILx5QMAZSbOMvmObrGc7A+VDhL784lEtym4HPpPKMER2T3ZC4YuWabbYJXGyW7lmQvH/K6tMTWdWTtvFnCEfm5fQwwMK59VLsL3beNYn/964nmteXX5IyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq/3hAE7nBhQKYUX8UI+myNijiVbnafanBOxeQH6G/U=;
 b=W8xvVLCW1sMS175Fc4CrkSVYLclQcFAieF+ZuFnLGwFp+o7aV26pFscxOTx0Jz2J8S6SzCKp0QX626v788rgP/hmilGhvqZfmgeMdwgSeMhnQMU1s/eXpoGWXvSOU+D25knuDpuy12Tj7GAjP2PpniD38XiZ5NO4hH+7yMHs02zKSPK78wF3q1AiqAFPa5tQNe/bvzlSS+XgNork5lZvi0TjZjiqiPcWDp+SET06rX0j7BskkSE9mpVR8N1M6xe/X4lPzPDp6TLsWVAWuCoJontEg2TNrjR47u6MqthZZq0sHweIBap1AZnxKQhNSYY5ESD94Qa+S3RtKL8qYeBexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFC295640A5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::852) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 02:31:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Fri, 4 Apr 2025
 02:31:52 +0000
Date: Thu, 3 Apr 2025 19:33:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
Message-ID: <Z+9E4/Qqg/EWO+Wd@lstrano-desk.jf.intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-2-matthew.brost@intel.com>
 <3716deb0-563c-49fb-9360-743e4c45682c@intel.com>
 <Z+8MZriWfnG0m9va@lstrano-desk.jf.intel.com>
 <4b7252d6-273b-46d4-a1fd-e8d985a8db13@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4b7252d6-273b-46d4-a1fd-e8d985a8db13@intel.com>
X-ClientProxiedBy: MW2PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:302:1::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFC295640A5:EE_
X-MS-Office365-Filtering-Correlation-Id: 7699baa8-2b8e-4b39-24c5-08dd7320dbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HNcv19+/tMsoYF5y9SrUoxkbcZpji0m3MEpkODoZpzuyWeWDT/oJ6bqo5O5f?=
 =?us-ascii?Q?d7WnSBTGcci07dSJ1M0JaRy5jG4+j20Nh20lZtZXJ8tI6gC6mY6qfot5xSH7?=
 =?us-ascii?Q?pLFfjmGfZ7WpgnV03xDXntPHE+qOpHXdLbqHTTTBXWhIy3GTJvbY8F9Bz4KU?=
 =?us-ascii?Q?vBS4ZGj3nRKauy1bOC7ECBZdie8EeN0wGDkvcmCTvE1p8hzWp+/fRYTdmYX1?=
 =?us-ascii?Q?ZQwa0yI5J8jV84gadZMSP7dFt7809MmY5Gf5gAX5QEaiwVAB0zfCYKZBAtI7?=
 =?us-ascii?Q?bs3kxyVlMFoS2ukSQsGcdqgqT2ei0qhyWM2HwQrGRhEp+NE9kaBk6T9T9FS1?=
 =?us-ascii?Q?ZPbbCnBJHMCycp0LX+8gGN5VSYZg6+iAvQiC3RICU3/0SdtsNlyOpL4Xbmrg?=
 =?us-ascii?Q?p5wkrTT+1VtgjmfY7vw8FiPiqkbyjPtabkOOWCZz42H8wfLFIft7LIiVjQKj?=
 =?us-ascii?Q?wX8FaK2xHpJ3Elqo9677ZVtVCbtEvc2bfr2kPw5BaJTapapl+Cm5CaivRXCA?=
 =?us-ascii?Q?UT0jE/wBBUWmtKE+sEdtWEBnnCyswl479gDMt/UttHB3JeiOGWCXN8ksdndA?=
 =?us-ascii?Q?vLlXL6qup5Z6bSi3yDqpdBdxj8YqalTNpg3cMND0Yq0yOD24w0YktpDy97IP?=
 =?us-ascii?Q?m0wVr4DbXA69ejkHOgcap8y1gNdgLus9pQYJnQEzZjnk13oxT/iH0Kj5UxVI?=
 =?us-ascii?Q?JMO0TOOucPPSgnyTkh6SlOupFObDvhusDfA2dvBUXYtRN0MLVeCt0gvWgYjv?=
 =?us-ascii?Q?FtLpTh+95F7yKFHrurmnmI9UPcqnWjw/QsdGL+M6Rs1U8HkwkZDqYUHSpE/B?=
 =?us-ascii?Q?qauGqoqlrhtSaz3AxsSN2xfBZXto4dht7Zhxjh+hJ5iu69glkpaqMnNJUsS2?=
 =?us-ascii?Q?XrkhMSdiH8zrBHVrbtqTw5yCm/AjJUvAokmXV4MPdQEXeWwHtABjcq4V2ndu?=
 =?us-ascii?Q?LtP8jURhF7fXrDNo3cPgqYpUBhyMceEBfjccWEyBNVzAJu59bIJ/r+Nmo+K7?=
 =?us-ascii?Q?FOibEwmHn1DhooRP9NeOQ+1VWrqDnK1KJOZJ6oTsGNb5c4I/VdOc+SjuBo1g?=
 =?us-ascii?Q?59hBpPfgydEuExd98tRYBMr6CM4AHFFuIvvxIJ1lofDGNi1sJw69dGdHJUDO?=
 =?us-ascii?Q?wYqAoEgLu2fwav3KHq/3TdRvxSIaKK+3DUEGl07gnmVbja4XfqzqCS/SjkBm?=
 =?us-ascii?Q?ThS3p/6YJklBFdCi9YLxwepanRGl/Rc+Jk2dTfRsdB90UK9ZoE6zMN+c0Rsx?=
 =?us-ascii?Q?FDSnArueURJQyu5jOK3El3uiMXjko85wTHu71nthdWdH6dlzEIF4dnZ5jYjb?=
 =?us-ascii?Q?Ustet3Tin3sEsoEb1PpvGJyi3RDZFC6RMLGYGZMqJ+SVCVa0e3/+CRiXIO6I?=
 =?us-ascii?Q?/b7DrKWjxYK27xDQIyiN7DB0I4Tr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yfnE0sOGtsyT6t8VMzB0WAoYxgotQ64q2UoT4lGW+AGV1gIE5Y/DrVNJXBUO?=
 =?us-ascii?Q?nLHVPCR91G+p/z3SHWciEPmk5KAY0jyOfay51ayzj9Z+eLEVGd4aMQ9XvR54?=
 =?us-ascii?Q?Myrfx71+HQFfLKAnvguIvGXtil4qfTjzQm9bPp62OjDZv1hHDdgVAqVY6EhO?=
 =?us-ascii?Q?V4SduVKCUOXGUHdR801QLc+7TMVLXDI8YvZKgAstAH0ryy5e4ZcOKtFqiPcy?=
 =?us-ascii?Q?DMRf0ZT+EhByuW8m2hDD1GaX6hgQBf5xfWHZFuo38OHTbre2K7gC9qQDTiaw?=
 =?us-ascii?Q?n9WZHSoyxWe6lqFlZrVivzxKB3GZIm0AvquPp/MI1U5//ldbmElXWwA6SfBC?=
 =?us-ascii?Q?RtmNvBqgTtQBGQX+YQypju1SUGvij4uaJmWlLNllXfU91SmCMEjK5Rl4YgIM?=
 =?us-ascii?Q?InMctG7dtwJCiqY5Lm+M7klWSSgd5BFHbx+AMNqMlWJcKHYIkEY1ligB2JwY?=
 =?us-ascii?Q?YFEbkaG6F9uiPVzfACwgLFfnPAXw7iYy0y5ovmimePJOpDW6CKbfpOV6AY1x?=
 =?us-ascii?Q?A0Yt+QRXQw0dRHGnTyvrapCc7xEc9VBtlpgESV06b0+RANo1Frbq/9SJWpbQ?=
 =?us-ascii?Q?18xsB/zzTrmCVN5E1T4JV4z57wRJokgEL9asMTezjgq/fONPGDJgE6YpjHqr?=
 =?us-ascii?Q?xXvue5cfUXHS4hRNrecW4Y6d7X4s3H6WdlpjbIJFPzyhfa66uO8pZZNinIst?=
 =?us-ascii?Q?lY3qfoPtVsU03tZk8mcfTE66JqXohNTSO3002AXiG8tEX8oDm7MVS/4xQ7xe?=
 =?us-ascii?Q?royANu4Q+pNUd/pb/7uNVNjwQy/AX9snTr3kgjKWdp8AVq3BgBLvu2kPQXj7?=
 =?us-ascii?Q?T818z91dX38jADa9n+JaKQGlwnUnK4yQtkKIeE1vjRiTlDsQvmIQFtuwUgJy?=
 =?us-ascii?Q?Y5CXCQQCHCmnmyivQLd6xSKZwfulDyihwFaqBdMdjDcXowQYLmvuQzONKhVE?=
 =?us-ascii?Q?obFzPSVBMzzq/NN14+VJU+U9gSSH4cD5CPepbuKFAJrGrALV3FjWgGnAoh2o?=
 =?us-ascii?Q?WiADwEIy+fFMDUKt9ceTbhSQ0le02P7e+t3I7LCDGsrSHvQc5arfGSdzezh+?=
 =?us-ascii?Q?sD+m8s9k0+GH4iuKSo9H/CTNeFr4mEYeWNGRcN3HGpQg/6o/bbylLmlFshT6?=
 =?us-ascii?Q?LRB4eBk+4NDXnYwZoJWH+8dCxjRgdOK55XZ9fnrw5VbujwT6UnKxH09vEj4g?=
 =?us-ascii?Q?miAX4eVWuuwfj9zWjaL0vgyY0/ecbGoL2xiMazxO0xZRAEnLxd47tbklXsUj?=
 =?us-ascii?Q?jQ1W7mPDquYzTDyRPDHOQ4iIP6NueZCD8d8yI8ioz4WaGC1Ea/kunSFhtxJX?=
 =?us-ascii?Q?QWHezQD4VCvgV5JosCYqLqyFSNGJqANWEfTKtvEICM/3kk9k0LXGp6qIF2iT?=
 =?us-ascii?Q?QpYd3r5Gms2vj7YdBVIVxQIp6cz7bB4JXlEFp+kJvknzPUtyr7um2C17sjZv?=
 =?us-ascii?Q?PvmpVePZ9lKFNGEOwG1kCtYZOKp6Z65AHS/Qy0oZuQIlQ0WqwB2p8YAVQVcu?=
 =?us-ascii?Q?91eJNTdipCJ2vnUDBBa8YYL+rRzNEJ6zJ5oM8N7o/4DiohWtg5i5anUg/D0f?=
 =?us-ascii?Q?jofrHJBvuF6j7hh85miv+417ZFwrxS+0HqUYSPq8YC8fXeyEBmHDwR+/S7Yn?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7699baa8-2b8e-4b39-24c5-08dd7320dbd0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 02:31:52.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUi9KPKngQkDfJJjy2uBDCjWmFQErBSSXQ0nZ5qaqw5UeygNByykdAE2f91hbJRQ2g6sCBO9b8Z67JOEqWoZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC295640A5
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

On Thu, Apr 03, 2025 at 03:41:16PM -0700, John Harrison wrote:
> On 4/3/2025 3:32 PM, Matthew Brost wrote:
> > On Thu, Apr 03, 2025 at 02:39:16PM -0700, John Harrison wrote:
> > > On 4/3/2025 1:27 PM, Matthew Brost wrote:
> > > > Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> > > > of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> > > > callback as needed.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
> > > >    drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
> > > >    drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
> > > >    3 files changed, 50 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > index 81b9d9bb3f57..a9e618abf8ac 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> > > >    	return &q->gt->uc.guc;
> > > >    }
> > > > -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > > +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > > > +				     ssize_t start,
> > > >    				     struct xe_devcoredump *coredump)
> > > >    {
> > > >    	struct xe_device *xe;
> > > > @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > >    	ss = &coredump->snapshot;
> > > >    	iter.data = buffer;
> > > > -	iter.start = 0;
> > > > +	iter.start = start;
> > > >    	iter.remain = count;
> > > >    	p = drm_coredump_printer(&iter);
> > > > @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> > > >    	ss->vm = NULL;
> > > >    }
> > > > +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> > > > +
> > > >    static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >    				   size_t count, void *data, size_t datalen)
> > > >    {
> > > > @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >    	/* Ensure delayed work is captured before continuing */
> > > >    	flush_work(&ss->work);
> > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > > > +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> > > > +
> > > >    	mutex_lock(&coredump->lock);
> > > >    	if (!ss->read.buffer) {
> > > > @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >    		return 0;
> > > >    	}
> > > > +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> > > > +	    offset < ss->read.chunk_position) {
> > > > +		ss->read.chunk_position =
> > > > +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> > > > +
> > > > +		__xe_devcoredump_read(ss->read.buffer,
> > > > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > > > +				      ss->read.chunk_position, coredump);
> > > > +	}
> > > > +
> > > >    	byte_copied = count < ss->read.size - offset ? count :
> > > >    		ss->read.size - offset;
> > > > -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > > > +	memcpy(buffer, ss->read.buffer +
> > > > +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> > > >    	mutex_unlock(&coredump->lock);
> > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > > > +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> > > > +
> > > >    	return byte_copied;
> > > >    }
> > > > @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > > >    	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > > >    	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> > > > -	xe_pm_runtime_put(xe);
> > > > +	ss->read.chunk_position = 0;
> > > >    	/* Calculate devcoredump size */
> > > > -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> > > > -
> > > > -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > > > -	if (!ss->read.buffer)
> > > > -		return;
> > > > +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> > > > +
> > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> > > > +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> > > > +					   GFP_USER);
> > > > +		if (!ss->read.buffer)
> > > > +			goto put_pm;
> > > > +
> > > > +		__xe_devcoredump_read(ss->read.buffer,
> > > > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > > > +				      0, coredump);
> > > > +	} else {
> > > > +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > > > +		if (!ss->read.buffer)
> > > > +			goto put_pm;
> > > > +
> > > > +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> > > > +				      coredump);
> > > > +		xe_devcoredump_snapshot_free(ss);
> > > > +	}
> > > > -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> > > > -	xe_devcoredump_snapshot_free(ss);
> > > > +put_pm:
> > > > +	xe_pm_runtime_put(xe);
> > > >    }
> > > >    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > > @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
> > > >    	if (offset & 3)
> > > >    		drm_printf(p, "Offset not word aligned: %zu", offset);
> > > > -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> > > > +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
> > > Is this related? Or should it be a separate patch?
> > > 
> > It is related. Now that __xe_devcoredump_read is called under
> > 'coredump->lock' we are in the path of reclaim, __xe_devcoredump_read
> > calls xe_print_blob_ascii85.
> > 
> > Both cases the allocation is relatively small, so would be fairly
> > unlikely to fail.
> > 
> > I could make this a seperate prep patch if you think that would be
> > better.
> Not worth splitting if this is the requirement. But maybe just add a comment
> to the commit message about why it is necessary.
> 

Sure.

> > 
> > > >    	if (!line_buff) {
> > > >    		drm_printf(p, "Failed to allocate line buffer\n");
> > > >    		return;
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > index 1a1d16a96b2d..a174385a6d83 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
> > > >    	struct {
> > > >    		/** @read.size: size of devcoredump in human readable format */
> > > >    		ssize_t size;
> > > > +		/** @read.chunk_position: position of devcoredump chunk */
> > > > +		ssize_t chunk_position;
> > > >    		/** @read.buffer: buffer of devcoredump in human readable format */
> > > >    		char *buffer;
> > > >    	} read;
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > index af2c817d552c..21403a250834 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
> > > >    	if (num_dw == 0)
> > > >    		return -EINVAL;
> > > > -	hwconfig = kzalloc(size, GFP_KERNEL);
> > > > +	hwconfig = kzalloc(size, GFP_ATOMIC);
> > > Likewise this?
> Hmm, hadn't realised we were doing an alloc/copy/free for every config table
> access. Is that just to avoid doing iosys type reads because the table is in
> LMEM? Seems a lot of overhead for each individual u32 read!
> 
> But also why are we doing table reads during core dump -> text printing?
> AFAICT, the only reads are in the steering code for doing EU register reads.
> Don't all the reg reads happen up front and then we stop accessing the
> hardware while doing the chunked dump? If we are re-reading hardware state
> when doing the text conversion we can end up with inconsistent dumps as the
> state changes from one chunk to the next?
> 

Honestly not familiar with this code at all, lockdep puked and just fixed it. :)

On its surface, it does like an unnecessary allocation.

Matt

> John.
> 
> 
> > > 
> > Same as above.
> > 
> > Matt
> > 
> > > John.
> > > 
> > > >    	if (!hwconfig)
> > > >    		return -ENOMEM;
> 
