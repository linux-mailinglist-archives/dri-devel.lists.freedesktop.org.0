Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096E966914
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 20:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E917B10EAD5;
	Fri, 30 Aug 2024 18:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xir+lpba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010A210EAD4;
 Fri, 30 Aug 2024 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725043454; x=1756579454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8mfHmnKSiYoBkSNb6r0SoQwk7I5ZAy7+sCV3PqW65Fk=;
 b=Xir+lpba9haMrbgyPEtUFw/dcC2DMHtQIRY5gO7EU/95VXOt5Vpe22Ii
 I3Sdin64QHzwWAdZfrajYSuotxI2GsW3Hgf/3H1a+JdI6EfZJYYvzqgV+
 2YnTo21cDLMXLzLw9DTp2ku3mt8smeSOlAboXIL2IhCMD114KV1wKdBsO
 0B+7aQhRVOdzIXbB/P0fKNxIvzb5JHIvShqlR493z6RxmSbHGLCJznwAn
 DrANdMnIDoPfVzwj0q7GGZRyMz4D9EsZ1n4yfOChja2ub8g5Z2jjTTChL
 Pt5IDEBBKUr7/vVMJTpoKfYkanixai0nkk6X9rADtiSAt5BXr0gr+XjHy Q==;
X-CSE-ConnectionGUID: JTknpo/XT1m7xsxoaSaXYQ==
X-CSE-MsgGUID: iQ9HV+lAS++znUCdffmfZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23863491"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="23863491"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 11:44:14 -0700
X-CSE-ConnectionGUID: NjuR+Kx3SbC4Esa5J9XjUg==
X-CSE-MsgGUID: eHpcGbSFQ2qHTZkdSWFWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="64024056"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 11:44:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 11:44:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 11:44:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 11:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIQXlslD2Vb79nIPjrX/PVmRyJoeelynQhQA7Jo/PT4MR+kvdywKfMG/PNYbqT4NHGp1rySIaJMAEfmIBwN+4EZc1rAwI9cBUoDWt2KWpxAyC9x4fvkv8yvjoRN28HP+8ipI6pa0rbLlCnkCFq6TilF4ibfYb500MgGGRmD784Gjb+eGznA+GceRbVzDy2rPa6nDK6zh9SSwFq305rrUw8oSYdVvdxp7psn557vsTJX9dRU3RPmgYT4fHbSXMrl9a5Vxv3DX44+ZUegChcEpksqjNuHtsg9oAV+4g4MXJzFUW7Wf/sjdQTp6kNHbTaXbNUadIDd8cEP9cFA2iPY8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3H1dTlFJAjAeOhiCr/6xBePe5BIFAJfsayDCoL4wO8o=;
 b=xNnO5/bxl2wnP7ELGbxPq3kFlMI+ukd1OS+zKKO/AZ2zWJDIOvxiJMVkKxGJFmvdr48XF4D576jw+tOKZmkEKrRl6FPoz4epu1kun0MZUYM3+whRTe2syeehmeXCIgEodbxzWZWWI87zrxfxdz6l86qJBANaEPi4wOwtc5oeo8WZogoUJoJS8Kv8IvEsWGRrXW0dt6aQwU6MDL9sL5oVqfAPNAmAUTB7O7WlCeqeLVhSm50fCvVSNudmKQiXMev9mRzg8DpXVlCrzEpa4awTl2OffJRbJfDWuKMLIDlwJEyoRE5zt3AfD46rCihztiEg7XjQzHe7k6Jw+hwg0ANk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 18:44:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 18:44:11 +0000
Date: Fri, 30 Aug 2024 18:42:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
Message-ID: <ZtISn9eYyIGP6UF0@DUT025-TGLU.fm.intel.com>
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-2-matthew.brost@intel.com>
 <aebe8cee-8674-42f0-b112-439da1ef7073@amd.com>
 <ZszWJaX9I3sh5jxZ@DUT025-TGLU.fm.intel.com>
 <52a68584-daee-4415-8ea0-7ebc737f8e10@amd.com>
 <Zs36d0fJxz3aFIqS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs36d0fJxz3aFIqS@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: c2490964-ca69-4ccb-7595-08dcc923bccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NlPhHlS8d0nrslcaDPl1pSUhfHKyxxZxwOQSRncq9w4daCa5vVWXwHVSlb?=
 =?iso-8859-1?Q?5+BGzGApzEbzmGNcvdDRHStokLiX3erbD8EIALUikC42J5NwtG1IdnJXSK?=
 =?iso-8859-1?Q?YFWK+/gX+0D+vapV6dZFo0Ad/qliUJPXrrfuPkprh86GX+elgCgndmSPjY?=
 =?iso-8859-1?Q?CfqGHSil6CuD5NZbhtcv/6fgcZH1zO71RQBkuTi0jfeB56iU9JPn2TV0Ou?=
 =?iso-8859-1?Q?PnTwxPk3igd24a+VES5X8OMccXVu6H72q6saSxxv7EaOF6J3FSKz6IqdP2?=
 =?iso-8859-1?Q?caPJNa13buPIq/jfoZ2BTkhpmJ26K7pkaq3E/FwfS3bWeYCrX2zJoo+n/I?=
 =?iso-8859-1?Q?+PirDhDmrel5Yo8XIerVeehfdvuBuM0dxwWgoHDRWi1CAnCYwuYSm8wzZn?=
 =?iso-8859-1?Q?qk0tQdSgxgb5+w1QVLU5RGFhVKhXzVbb10a/SDkjwQ1ybTeJcgH4qIStUJ?=
 =?iso-8859-1?Q?enU7Wkht+f/+0OCv6LJ5SXw3sene1ZkixZ2M37dIDP4zBf6rTtdxHN5nsb?=
 =?iso-8859-1?Q?6XKodWdQmLuBNLguy4fKU96zVwcrM9p5ynN5iOa0BZeh+l1PC6rREpvGMW?=
 =?iso-8859-1?Q?vn78IswIZBDvr1+u3iUlCbAJJB/IZPKtDqqjvf3VZCCHlREg0T2ZxYKQva?=
 =?iso-8859-1?Q?XV/S3Dw8BQ+Mlj4XdQskH9a+ceaBUkWD+PajJfm4L7RiZo6ySeLg25ppDO?=
 =?iso-8859-1?Q?bMiGsAbs1vvjMwdlt+ddvnLX7dx3xOXY0LHZH0hFaFw9XO3v9vf1S3oPLh?=
 =?iso-8859-1?Q?9k0BSIvvcN4ui+FzvnsWWLW5EPj4EPOECTs74cJvlS9qWR2kyudfmwSAAW?=
 =?iso-8859-1?Q?oJBXExukZ6oLxzf2IyBpOsXMYajbP/yadJFtAcRDyAJWfr2lhmNU0iEhCo?=
 =?iso-8859-1?Q?ZF/QHOBOiKtHJHxURW3ki+VdUrrAq3xOnYVfDRHfZNJ0aofoXpT2cueyqh?=
 =?iso-8859-1?Q?60sjq9YzZsBcc+fCmyBu8JTFmcefAoQioY/DXyu9XSnXAXFeOIvIQCoTWf?=
 =?iso-8859-1?Q?xUj4PiPuFEkcUXxG3cpdE24DYSMCFWZc5BllpxYIrakeajQq02pBau+9YW?=
 =?iso-8859-1?Q?wwUYh7up/8KDh5ts5hlm5lhyP4pgRSTbRBVUp6IQjbT8BRuqvCCOfGVMEV?=
 =?iso-8859-1?Q?TpzGYhRGd7NGn1vj5Wf+dd/PF/dqJSqZ6E/Uo+sfRi9zTwbDNKHj0Dqq0p?=
 =?iso-8859-1?Q?NC2YXkQHMcCqmIMVAE5tQ4IowUVGfwGhLJcBPZ7W1hEnpLFtzaniaE4cYe?=
 =?iso-8859-1?Q?lV45vYKwQrF3ya2B8p/bMVWcMaJ2VmhdFZ4Tfq7XJrbPjiEuopdbHe8r0U?=
 =?iso-8859-1?Q?w+tRJ+jwm/Gfs5srH1Jt0aBkhMK8n1x8V66Bw/IezfLC0RuMad3uaDP5oM?=
 =?iso-8859-1?Q?if27n1udejMbA4JaTFAoC/BMp4qRJ41Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XRbpn+qzJ9Fn4FfzvD1ji9OZoUumpCM8tVXzPo8BSQ4dchPS/DswwKP8q8?=
 =?iso-8859-1?Q?sAp7Eyum+ZCdFc0QgumCL+cT+vCT8x2d8UFAKmphlAC8JiJn6Zx5Zp+Nfx?=
 =?iso-8859-1?Q?u1xOCjj/peH8mu2vovVKBOC3CJffBMqcGJrtdFiLW8k4xyUoViVWeznRun?=
 =?iso-8859-1?Q?8uWSV2anyxt8/lIU+xSnZ4DXABjvpyI8PQ92WbThCzWHvy2O3geu3+0Zha?=
 =?iso-8859-1?Q?4ekWDvGy+OOXEmUjqjGO99ODivB4jMSGDqBsAJW0V7FB75M8ScLFA7rQ8s?=
 =?iso-8859-1?Q?tz4DTug5KfvnCGJHz3LeTSArhl74GnIISYW1/d+pC10DXTVLTAwCRIBnvQ?=
 =?iso-8859-1?Q?IZuChHAy/GHk+0Gx1k7PdcpMo4ko6hEPpt+hC/D/GKnTkHDLROWgJd9Eiv?=
 =?iso-8859-1?Q?jn8ICbgjGQ4yuP1xYFYJYTRnrlroKnxlzKWw/ZuOtFyKzzJmgJkO2F6dHG?=
 =?iso-8859-1?Q?tTKFbVmVVyJ/1aEfd9KnjwOLRjqNW28UXs1p4lddCo+couM8LDZ4BIwzLi?=
 =?iso-8859-1?Q?iNEPDD1F02nU13iPv/qNuY8irD+60WD2ClFVwR5RUHMXFINSBUWWAZeIgM?=
 =?iso-8859-1?Q?MWmSzxWFkSBzQjGsBckTkjlLW6VIDRO2+yftP3pId2ldpjb38XCNQxEA4J?=
 =?iso-8859-1?Q?jZmDmpTzCrjaxVBjsEu2xrb4Hh7W7IKqr9swi5+IBt8uLOx/+evNpIYEmL?=
 =?iso-8859-1?Q?AAO+9xeD3JeKY2LckxoXjeOEzO2mBeRmBzHdvUhC3DvnIakTL06z1+VK3g?=
 =?iso-8859-1?Q?5YcWcgvfkmgySt2UPZQpppsRE1CqDUnFOcXPShrKpDCZztMAsUiid3+D3A?=
 =?iso-8859-1?Q?I0TNc39Z2QRDpRlUDkGgTJ7zBlnHEiI7IBPvihiGF1cDf3MnRKJ3IVYklY?=
 =?iso-8859-1?Q?GKKHxxmzlGB/Gn3TlsDZ0EA1keisPBhc3MWzZTqw0JG/PSQVPPkf2MjYGw?=
 =?iso-8859-1?Q?cqXzS8Y/jna715v3IDMuirvUsq4Xqe2oWG8hPB0ZFeriMnU2LnSNSF37sO?=
 =?iso-8859-1?Q?af5z8bdVfrOO6NEDRvLvMtaURXmAFS5GgDMSHmKV48WZnBlxZcZnbFgQHM?=
 =?iso-8859-1?Q?v5VdFVYKaHVkS1vGUKtBTrdfarJKGWC+B6LBkKa/UGiCT4O+d4FG6h35VR?=
 =?iso-8859-1?Q?SdqgeWaKB/fSrt1+lnA+qKqdz/SsI0jF/jqSdJXlHXjfseBuZojxkPWLZV?=
 =?iso-8859-1?Q?swQTYR/d+lIF0m2Y0sDFD1VoM/nJBOaXfeLouIaQRVfVGgIK7SirFAoDDI?=
 =?iso-8859-1?Q?AIeUR2eR9s5Ic/Vkuy/9JJd8PyhrgNquv1tZ0PmWWta9Hlz7ZYvhQNPmxu?=
 =?iso-8859-1?Q?yK+0pXfNHui5wojfdGX9LosIJgLqHEDzMXfgO1XmnbzTPp3uNC97JVOJpu?=
 =?iso-8859-1?Q?UzIXe8zvdHGO6JfJBTZw+QbWCIZMWzVXMNbU0kcyojoQcgOraSUC/5/YBq?=
 =?iso-8859-1?Q?hAR4tLFjxLmnKLPiJ79bB58lBWtui56fP0g8La1TGCfM1CR+NS9EaWEgZh?=
 =?iso-8859-1?Q?zNvW9c9zoEW/puvCDG5SqhToFDzeAqUifMuAD9/v+swFe+69ZQOWpahuu1?=
 =?iso-8859-1?Q?mfSdiWXzDiSu9EJJ5Ncfz236Wc+RmWaqxnAkdXiCV0p2zbkunlkJHp7cyC?=
 =?iso-8859-1?Q?j+2wmfQ0IwTwrVChYs20ITT7pa+v+kIFnxF+WQM0GFlsQ136XdFI06Rw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2490964-ca69-4ccb-7595-08dcc923bccc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 18:44:10.9514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzpkuRDHm8QK/IP/7RrRjeEMessqUhjdcUMlQiqnoYYSiA02trifX8iXS4HuG8P9yUnKfvOywYOyBcv/vXdvaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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

On Tue, Aug 27, 2024 at 04:10:31PM +0000, Matthew Brost wrote:
> On Tue, Aug 27, 2024 at 08:37:56AM +0200, Christian König wrote:
> > Am 26.08.24 um 21:23 schrieb Matthew Brost:
> > > On Mon, Aug 26, 2024 at 07:57:07PM +0200, Christian König wrote:
> > > > Am 26.08.24 um 19:01 schrieb Matthew Brost:
> > > > > Useful to preallocate dma fence array and then arm in path of reclaim or
> > > > > a dma fence.
> > > > > 
> > > > > v2:
> > > > >    - s/arm/init (Christian)
> > > > >    - Drop !array warn (Christian)
> > > > > 
> > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > Thanks for the review.
> > > 
> > > Unfamilar with the merge flows to dma-buf subsystem. Do you merge this
> > > into a dma-buf branch that we can then pick up in 6.12?
> > 
> > I can push the patches into drm-misc-next or alternatively you pick them up
> > through an XE branch.
> > 
> > The change to the dma_fence_array is small enough that it probably won't
> > cause any conflict, so both approaches works for me.
> > 
> 
> Once I have a review on patch number 2, I'll go ahead and merge to
> drm-xe-next. Will also reply here once that has happened.
> 

Merged to drm-xe-next.

Matt

> Matt
> 
> > Christian.
> > 
> > > 
> > > Matt
> > > 
> > > > > ---
> > > > >    drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
> > > > >    include/linux/dma-fence-array.h   |  6 +++
> > > > >    2 files changed, 63 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> > > > > index c74ac197d5fe..0659e6b29b3c 100644
> > > > > --- a/drivers/dma-buf/dma-fence-array.c
> > > > > +++ b/drivers/dma-buf/dma-fence-array.c
> > > > > @@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
> > > > >    EXPORT_SYMBOL(dma_fence_array_ops);
> > > > >    /**
> > > > > - * dma_fence_array_create - Create a custom fence array
> > > > > + * dma_fence_array_alloc - Allocate a custom fence array
> > > > > + * @num_fences:		[in]	number of fences to add in the array
> > > > > + *
> > > > > + * Return dma fence array on success, NULL on failure
> > > > > + */
> > > > > +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> > > > > +{
> > > > > +	struct dma_fence_array *array;
> > > > > +
> > > > > +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > > > > +}
> > > > > +EXPORT_SYMBOL(dma_fence_array_alloc);
> > > > > +
> > > > > +/**
> > > > > + * dma_fence_array_init - Arm a custom fence array
> > > > > + * @array:		[in]	dma fence array to arm
> > > > >     * @num_fences:		[in]	number of fences to add in the array
> > > > >     * @fences:		[in]	array containing the fences
> > > > >     * @context:		[in]	fence context to use
> > > > >     * @seqno:		[in]	sequence number to use
> > > > >     * @signal_on_any:	[in]	signal on any fence in the array
> > > > >     *
> > > > > - * Allocate a dma_fence_array object and initialize the base fence with
> > > > > - * dma_fence_init().
> > > > > - * In case of error it returns NULL.
> > > > > - *
> > > > > - * The caller should allocate the fences array with num_fences size
> > > > > - * and fill it with the fences it wants to add to the object. Ownership of this
> > > > > - * array is taken and dma_fence_put() is used on each fence on release.
> > > > > - *
> > > > > - * If @signal_on_any is true the fence array signals if any fence in the array
> > > > > - * signals, otherwise it signals when all fences in the array signal.
> > > > > + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
> > > > > + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
> > > > >     */
> > > > > -struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > > > -					       struct dma_fence **fences,
> > > > > -					       u64 context, unsigned seqno,
> > > > > -					       bool signal_on_any)
> > > > > +void dma_fence_array_init(struct dma_fence_array *array,
> > > > > +			  int num_fences, struct dma_fence **fences,
> > > > > +			  u64 context, unsigned seqno,
> > > > > +			  bool signal_on_any)
> > > > >    {
> > > > > -	struct dma_fence_array *array;
> > > > > -
> > > > >    	WARN_ON(!num_fences || !fences);
> > > > > -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > > > > -	if (!array)
> > > > > -		return NULL;
> > > > > -
> > > > >    	array->num_fences = num_fences;
> > > > >    	spin_lock_init(&array->lock);
> > > > > @@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > > >    	 */
> > > > >    	while (num_fences--)
> > > > >    		WARN_ON(dma_fence_is_container(fences[num_fences]));
> > > > > +}
> > > > > +EXPORT_SYMBOL(dma_fence_array_init);
> > > > > +
> > > > > +/**
> > > > > + * dma_fence_array_create - Create a custom fence array
> > > > > + * @num_fences:		[in]	number of fences to add in the array
> > > > > + * @fences:		[in]	array containing the fences
> > > > > + * @context:		[in]	fence context to use
> > > > > + * @seqno:		[in]	sequence number to use
> > > > > + * @signal_on_any:	[in]	signal on any fence in the array
> > > > > + *
> > > > > + * Allocate a dma_fence_array object and initialize the base fence with
> > > > > + * dma_fence_init().
> > > > > + * In case of error it returns NULL.
> > > > > + *
> > > > > + * The caller should allocate the fences array with num_fences size
> > > > > + * and fill it with the fences it wants to add to the object. Ownership of this
> > > > > + * array is taken and dma_fence_put() is used on each fence on release.
> > > > > + *
> > > > > + * If @signal_on_any is true the fence array signals if any fence in the array
> > > > > + * signals, otherwise it signals when all fences in the array signal.
> > > > > + */
> > > > > +struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > > > +					       struct dma_fence **fences,
> > > > > +					       u64 context, unsigned seqno,
> > > > > +					       bool signal_on_any)
> > > > > +{
> > > > > +	struct dma_fence_array *array;
> > > > > +
> > > > > +	array = dma_fence_array_alloc(num_fences);
> > > > > +	if (!array)
> > > > > +		return NULL;
> > > > > +
> > > > > +	dma_fence_array_init(array, num_fences, fences,
> > > > > +			     context, seqno, signal_on_any);
> > > > >    	return array;
> > > > >    }
> > > > > diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> > > > > index 29c5650c1038..079b3dec0a16 100644
> > > > > --- a/include/linux/dma-fence-array.h
> > > > > +++ b/include/linux/dma-fence-array.h
> > > > > @@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
> > > > >    	for (index = 0, fence = dma_fence_array_first(head); fence;	\
> > > > >    	     ++(index), fence = dma_fence_array_next(head, index))
> > > > > +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> > > > > +void dma_fence_array_init(struct dma_fence_array *array,
> > > > > +			  int num_fences, struct dma_fence **fences,
> > > > > +			  u64 context, unsigned seqno,
> > > > > +			  bool signal_on_any);
> > > > > +
> > > > >    struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > > >    					       struct dma_fence **fences,
> > > > >    					       u64 context, unsigned seqno,
> > 
