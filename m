Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60D573F50
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C695908CD;
	Wed, 13 Jul 2022 22:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA608F425;
 Wed, 13 Jul 2022 22:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657749742; x=1689285742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F8ljn08dPxuQIkWFZwYYoeu/p3SAd/lCXiUiU62/q44=;
 b=JKrcE4Pzny4tfJ3q/vIxeaSJWCQouv8w6TzblgBrUNDcSI+BzLqEz4aP
 k4FCCGCZGgHQ6EVyyp2xLCx1do3uXYb5MYd93AF2U8Iq63r4eqwDeSFeo
 IrJFymAXVFAwaS77U1m15xe5NnlOKZOWJ82b8Wseg1Y7cjb7tOMWbCAP+
 ZiFs1bDPNAf+zyLA6KlQoF5TCE9VAi9Ihw7CrCLud/52n2drkWKaUGCdS
 Fu8XbpTQcRbHDQF/M8AmX1iZO567wc69dTHzG+ils3ZQyMy/fsZGol0Vk
 +pBCpJXvX186EDmzlAF32fWRN+YGYw2U4zM4fNeyE6i2VuPcoOLUsq4ce g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347037689"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347037689"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="922815436"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2022 15:02:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:02:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:02:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOOp8YdSO4LljaCcrqOVussZJBB6eSndQ+i/iTLQxsgK18xEQp3a8lUNvxb//WOxuBQA44Kp0wdGhkGy0XK7o9wWhCkKxkbUlrREtwkuUzA1B+Sec/9KS5wS0F3k8YJNqhsgA5U53HxI48aOF7/HbrrVpme9tclLeFNIcf3Sq8ivNzdPZn2lJPqGSDDuyczsvxZtQGTSaGqORB0ZeOnrWkWvcTj6gHuYWDduf5POxh1Sj6e1s0T2HKXO7hIGCiQFVgtfcpinH7fYrcKsqLl5KukBQqgNgbZFvOSlYcRCXEJ79HKLn2SpYt4Tn1y2LbyX4n++2PZS0O/2qkujgZnoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZq/UU29bnFRj0UW0NgXmOJrrH3drbldc7beTZU2k0E=;
 b=BpmUHsidflO2fGJo+sbkMousk+1hGtc3tOU0fRi57Gw/NiUkoy3DnLEG0Znv5m3QVRhZBEB7hJCF1OMpsgBmSdklnm/Ek+eRN/9CqehFGbMs4yJjWLYzc14bPNJDd1JNhKLNTufIazZuPbdgLcRe2RUl9BocvXtuSQPSaEYjG85xmZbQG2xq44OsThXlzWc7oO2KIOyageA/vAyTHMLn67k2bHA89FzSNwO3lPUn5gWs6alUMznkTqYou5vRyaY8Xw9Fx4baaPFGzyOamcGd0edRLOa8jdFeQ+uaDgyl5ifU08GVX8x5HRACtiTHHBx+kfB5CV25a/XHfWanruBC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR11MB1495.namprd11.prod.outlook.com (2603:10b6:910:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 22:02:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:02:19 +0000
Date: Wed, 13 Jul 2022 18:02:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 04/39] drm/i915: fix kernel-doc trivial warnings on
 i915/*.[ch] files
Message-ID: <Ys9A5fWUF4cwOI+9@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <edf15495f1da28766fe9baadd4ec71fd7bbe8b75.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edf15495f1da28766fe9baadd4ec71fd7bbe8b75.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 547e8d66-077d-4768-f039-08da651b5a03
X-MS-TrafficTypeDiagnostic: CY4PR11MB1495:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mhQSr65/qpOUzp1JNoC21k2JbjUQOLmF2JB/v113z8rgCtBQgc/BjjuWVzZXPkHE7tiCzPiTufLdqf+Zx9HLvXrDIxT9Qjywv8QUtC7L1SX1ZEOho8i0ZHPjTYnqj/HswY+2GNlu+M32i0HdLjic4mKgjs11WsEW2FStZHIrtsKp57ONb66yQ95j6JNQ9nP2ugnSc2zLavSUg2uJIjecNhxGa2zAabfuj6n2vCi4me4JshxOr0FfOJU9oNqjB08h7Zzrd9gHRVAq8/20R+JIUn+pujOgkNISDWyZaYiKMCEDgsCnHhNYrsfpApS7gfOf1x6Fjb1WfEICEIoc9eYl2h6Q6G0YSlvAJi32mbB87sy92S6pMOLUGYWqfWTdCSKIyMYAeZRBeGKpZVKtEOJ6dl/n4oJFjQF4o1b5j4CCSFQf45pc3S1xUUvs/3FoXPb5ycqs7bG9CXhhCKUeqAO9BSDbftwnwaTSy5VejBNBZREZd3U+SAM8PqxGokGiI05nF7Ok7S/j52TU4xphV1lnJdFKUlBoPpl9Xm3CtgWDWVdQzoNtu/a0Q247i2cAf6ariAjxnIkE18idSvWDbhHarqN5x1SKKHNhqMoAlH8IAQcxEA+JYtYMfgPgGhHEjIDSM5JcPzT02ge0bhQqU0SLqbaT4UtRKLdB/nBLyIOx4oKaRVD+tO11F0jO3EAenLpYo/ezP7Ui13yBaVcyWRdTuJ4LS+QesHrDbo1TZoNLR1Bs8e0SPT0LfYW/TCtDDE5TDBA9YpzQwPwKasgWHafn0FJVa10G+FCsXMuArOO5VvtuA08oBwzFlbmgVpueKYd8AReQsOznm0sV9Ed9NxTJkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(376002)(396003)(346002)(316002)(54906003)(41300700001)(8676002)(4326008)(38100700002)(66946007)(82960400001)(66476007)(66556008)(26005)(83380400001)(6506007)(6512007)(44832011)(478600001)(186003)(6666004)(30864003)(966005)(86362001)(2616005)(6916009)(6486002)(2906002)(5660300002)(36756003)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?soxrnbCqk+a0RT+PRG/iTTD5Z5YZsyfUdc9fEiSpO1z0raqDK2+pG6IQyg1G?=
 =?us-ascii?Q?JPD6B++qBA7/TEqmaXw5OgpUEa9HNs9WCplVYc6BIcX2LELzlollC/L5owIM?=
 =?us-ascii?Q?TqD0cysvo6sidBWJBqYcjkjb5lYYrjqiYPPNN/uWS2+QBSohbE/nrM2uxKDE?=
 =?us-ascii?Q?0wilEhM0GhMxQO5TDicoRU/3pK+sx1tDxEB9nWlQ5POJsl5dMA/hlENqSgE+?=
 =?us-ascii?Q?EFzh18l4GMfyLXKtLMAOkXsTDbAvTxhtziGFwYkqO0xFIVPRKQZBCn+jXlG9?=
 =?us-ascii?Q?IBY+vRDcz8yaYhTKXG3GV6wAt/tLSFcXSl71oVtpMWchKjg2tT7uc3a/PvFp?=
 =?us-ascii?Q?rD95uiNSCqTcLdHL8EkhyBzPGy0DyrhkF5yOr5i+zoQ6zFZZidXrzjliNzpL?=
 =?us-ascii?Q?SqUMDjjrCS+uIJ6QGEdGsIGfX9tmBZjsWb7HTsEJpfwBzVPYAPoDhmLBkZ+Y?=
 =?us-ascii?Q?zN5vjHg9I259Bxq8rRtW4tU96GyhtyEsjU0O9vBmBg5DLFc5C5pvN9ZL0Xo9?=
 =?us-ascii?Q?UG7SFYj5NOfMyzJQNQDbSTZbkrx/jNU+KkS7aeS0y/VOd1lUWdzaXiKGuKRL?=
 =?us-ascii?Q?cTCGNFjdAYtztcKr4tqFKJR1PN5m8ETzIpGRIDwCpSdYVOZ61QCgCpDK0BkL?=
 =?us-ascii?Q?lPMmmY5FEKEAu7qhc061yYNHPqiAcU6yYkpqaAf4mHeE/YyBbtiH2CniQiB6?=
 =?us-ascii?Q?uLMrZc31mBq2c3145A3Ty7lbShCAuUuNpabavO/eMudWEV1by1L3mYOA1bWs?=
 =?us-ascii?Q?D0ZXbtgZ7ulpXztf2geUDZ93t7dpDNREqgL6E5BRpWU4/feq/rqKtjsR0bSx?=
 =?us-ascii?Q?dvTtJIln5lODEkgRrZlEDLGfHGOer5bOtAAfKSX2VJqRZNAntlrGf+QuJYdl?=
 =?us-ascii?Q?gVtm6NTlIY3pLA6h1DMoQdP3Oighks+Kd7g9nea18N2HJ8SA5dl+4zCzYVOW?=
 =?us-ascii?Q?f04e9j1eC5Lf5I8DS9aBEEVtWSmzLnJ5KBs2PW3FVma4FECSVODeOPr6/rNy?=
 =?us-ascii?Q?IyeEsS3Y207Vej2HAm8Qk/9Wwhvl2MYdt/PdVUKLkWVrOcGEacB6wfw5wp/E?=
 =?us-ascii?Q?M5G8QZcDLSADy+zkBMmegji0DavaGTSXAbKwlzTvc+ri5/nx/1X1BITZMaq9?=
 =?us-ascii?Q?jH8JqxkulcH7L20eJqTgQB5Faz+DDx5SgEzywGjJ52SdGN4nvFgItwlxO+sm?=
 =?us-ascii?Q?RvGIij+skVMHFsTeDBzK7342RL3a233BMIziZi4jS4MAfAPGgDIVdRRd6rz2?=
 =?us-ascii?Q?ugwHYaXJO4XQpEBHM1AFZsD1KP8Y4K8vDNvm6owAOSRBgJPY9YvtyQEbcmDU?=
 =?us-ascii?Q?W1/093C9G0WkMg9QkvtQlkTnWlF6ywyQqc35o7FtNNmvzvzl/C+hpmLAKQ/c?=
 =?us-ascii?Q?GKJE2TcUL4g4h7dhWuS1hvoRJMxwEnigHMUCS5bJu+ORS53N+C815PIgx3jW?=
 =?us-ascii?Q?S0TxcLjliYFWmcAfmFZ6HiRKBVjsyaRNZtFhplVKRwfB7YWafsmb/OYge0pZ?=
 =?us-ascii?Q?Yfpx1xdXVUkRwcvSyl8esMXNW9oz5jV6t7RiSoKvBzosvWwHJbpHE5OJxFZr?=
 =?us-ascii?Q?KAnTRDhh/MW49iQm1zh3btBUlC/TMS7ph7M+3Uqh43YJYvyNLa3bOeVZ2IrF?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 547e8d66-077d-4768-f039-08da651b5a03
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:02:18.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3R2NuOc3ha+EfbRbxvfMzxtGR5ZTRyNYKHIYW6ZG49MjXRJngnKK+FT/e9BKUUNTgAKAHWV7vxRpVXwV/RPCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1495
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
Cc: David Airlie <airlied@linux.ie>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:52AM +0100, Mauro Carvalho Chehab wrote:
> There are several trivial warnings there, due to trivial things:
> 	- lack of function name at the kerneldoc markup;
> 	- renamed functions;
> 	- wrong parameter syntax.
> 
> Fix such warnings:
> 	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'active' not described in '__i915_active_fence_init'
> 	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fence' not described in '__i915_active_fence_init'
> 	drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fn' not described in '__i915_active_fence_init'
> 	drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'active' not described in 'i915_active_fence_set'
> 	drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'rq' not described in 'i915_active_fence_set'
> 	drivers/gpu/drm/i915/i915_active.h:102: warning: Function parameter or member 'active' not described in 'i915_active_fence_get'
> 	drivers/gpu/drm/i915/i915_active.h:122: warning: Function parameter or member 'active' not described in 'i915_active_fence_isset'
> 	drivers/gpu/drm/i915/i915_gem.c:443: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Reads data from the object referenced by handle.
> 	drivers/gpu/drm/i915/i915_gem.c:532: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * This is the fast pwrite path, where we copy the data directly from the
> 	drivers/gpu/drm/i915/i915_gem.c:717: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Writes data to the object referenced by handle.
> 	drivers/gpu/drm/i915/i915_gem.c:802: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Called when user space has done writes to this buffer
> 	drivers/gpu/drm/i915/i915_pmu.h:22: warning: cannot understand function prototype: 'enum i915_pmu_tracked_events '
> 	drivers/gpu/drm/i915/i915_pmu.h:33: warning: cannot understand function prototype: 'enum '
> 	drivers/gpu/drm/i915/i915_pmu.h:42: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * How many different events we track in the global PMU mask.
> 	drivers/gpu/drm/i915/i915_request.h:177: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Request queue structure.
> 	drivers/gpu/drm/i915/i915_request.h:473: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Returns true if seq1 is later than seq2.
> 	drivers/gpu/drm/i915/i915_scatterlist.c:63: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:153: warning: Incorrect use of kernel-doc format:          * release() - Free the memory of the struct i915_refct_sgt
> 	drivers/gpu/drm/i915/i915_scatterlist.h:157: warning: Function parameter or member 'release' not described in 'i915_refct_sgt_ops'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:180: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_put'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:191: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_get'
> 	drivers/gpu/drm/i915/i915_scatterlist.h:207: warning: Function parameter or member 'rsgt' not described in '__i915_refct_sgt_init'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'OP' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'COND' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'US' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'Wmin' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_utils.h:291: warning: Function parameter or member 'Wmax' not described in '__wait_for'
> 	drivers/gpu/drm/i915/i915_vma_resource.h:88: warning: Incorrect use of kernel-doc format:          * struct i915_vma_bindinfo - Information needed for async bind
> 	drivers/gpu/drm/i915/i915_vma_resource.h:123: warning: Function parameter or member 'bi' not described in 'i915_vma_resource'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

functions should change to have "()" or not?
whatever you decide, keep it consistent and feel free to use

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>




> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/i915_active.h       | 14 +++++++-------
>  drivers/gpu/drm/i915/i915_gem.c          | 10 ++++++----
>  drivers/gpu/drm/i915/i915_pmu.h          |  6 +++---
>  drivers/gpu/drm/i915/i915_request.h      |  4 ++--
>  drivers/gpu/drm/i915/i915_scatterlist.c  |  2 +-
>  drivers/gpu/drm/i915/i915_scatterlist.h  | 10 +++++-----
>  drivers/gpu/drm/i915/i915_utils.h        |  2 +-
>  drivers/gpu/drm/i915/i915_vma_resource.h |  2 +-
>  8 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
> index 7eb44132183a..77c676ecc263 100644
> --- a/drivers/gpu/drm/i915/i915_active.h
> +++ b/drivers/gpu/drm/i915/i915_active.h
> @@ -49,9 +49,9 @@ void i915_active_noop(struct dma_fence *fence, struct dma_fence_cb *cb);
>  
>  /**
>   * __i915_active_fence_init - prepares the activity tracker for use
> - * @active - the active tracker
> - * @fence - initial fence to track, can be NULL
> - * @func - a callback when then the tracker is retired (becomes idle),
> + * @active: the active tracker
> + * @fence: initial fence to track, can be NULL
> + * @fn: a callback when then the tracker is retired (becomes idle),
>   *         can be NULL
>   *
>   * i915_active_fence_init() prepares the embedded @active struct for use as
> @@ -77,8 +77,8 @@ __i915_active_fence_set(struct i915_active_fence *active,
>  
>  /**
>   * i915_active_fence_set - updates the tracker to watch the current fence
> - * @active - the active tracker
> - * @rq - the request to watch
> + * @active: the active tracker
> + * @rq: the request to watch
>   *
>   * i915_active_fence_set() watches the given @rq for completion. While
>   * that @rq is busy, the @active reports busy. When that @rq is signaled
> @@ -89,7 +89,7 @@ i915_active_fence_set(struct i915_active_fence *active,
>  		      struct i915_request *rq);
>  /**
>   * i915_active_fence_get - return a reference to the active fence
> - * @active - the active tracker
> + * @active: the active tracker
>   *
>   * i915_active_fence_get() returns a reference to the active fence,
>   * or NULL if the active tracker is idle. The reference is obtained under RCU,
> @@ -111,7 +111,7 @@ i915_active_fence_get(struct i915_active_fence *active)
>  
>  /**
>   * i915_active_fence_isset - report whether the active tracker is assigned
> - * @active - the active tracker
> + * @active: the active tracker
>   *
>   * i915_active_fence_isset() returns true if the active tracker is currently
>   * assigned to a fence. Due to the lazy retiring, that fence may be idle
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 702e5b89be22..41e83d078a70 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -439,7 +439,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>  }
>  
>  /**
> - * Reads data from the object referenced by handle.
> + * i915_gem_pread_ioctl - Reads data from the object referenced by handle.
>   * @dev: drm device pointer
>   * @data: ioctl data blob
>   * @file: drm file pointer
> @@ -528,7 +528,8 @@ ggtt_write(struct io_mapping *mapping,
>  }
>  
>  /**
> - * This is the fast pwrite path, where we copy the data directly from the
> + * i915_gem_gtt_pwrite_fast - This is the fast pwrite path, where we copy
> + *	the data directly from the
>   * user into the GTT, uncached.
>   * @obj: i915 GEM object
>   * @args: pwrite arguments structure
> @@ -713,7 +714,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
>  }
>  
>  /**
> - * Writes data to the object referenced by handle.
> + * i915_gem_pwrite_ioctl - Writes data to the object referenced by handle.
>   * @dev: drm device
>   * @data: ioctl data blob
>   * @file: drm file
> @@ -798,7 +799,8 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *data,
>  }
>  
>  /**
> - * Called when user space has done writes to this buffer
> + * i915_gem_sw_finish_ioctl - Called when user space has done writes to
> + *	this buffer
>   * @dev: drm device
>   * @data: ioctl data blob
>   * @file: drm file
> diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
> index 449057648f39..c30f43319a78 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -14,7 +14,7 @@
>  
>  struct drm_i915_private;
>  
> -/**
> +/*
>   * Non-engine events that we need to track enabled-disabled transition and
>   * current state.
>   */
> @@ -25,7 +25,7 @@ enum i915_pmu_tracked_events {
>  	__I915_PMU_TRACKED_EVENT_COUNT, /* count marker */
>  };
>  
> -/**
> +/*
>   * Slots used from the sampling timer (non-engine events) with some extras for
>   * convenience.
>   */
> @@ -37,7 +37,7 @@ enum {
>  	__I915_NUM_PMU_SAMPLERS
>  };
>  
> -/**
> +/*
>   * How many different events we track in the global PMU mask.
>   *
>   * It is also used to know to needed number of event reference counters.
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 47041ec68df8..66d6dee98525 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -172,7 +172,7 @@ enum {
>  	I915_FENCE_FLAG_COMPOSITE,
>  };
>  
> -/**
> +/*
>   * Request queue structure.
>   *
>   * The request queue allows us to note sequence numbers that have been emitted
> @@ -468,7 +468,7 @@ i915_request_has_initial_breadcrumb(const struct i915_request *rq)
>  	return test_bit(I915_FENCE_FLAG_INITIAL_BREADCRUMB, &rq->fence.flags);
>  }
>  
> -/**
> +/*
>   * Returns true if seq1 is later than seq2.
>   */
>  static inline bool i915_seqno_passed(u32 seq1, u32 seq2)
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index f63b50b71e10..128fab326bb0 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -56,7 +56,7 @@ static const struct i915_refct_sgt_ops rsgt_ops = {
>  /**
>   * i915_refct_sgt_init - Initialize a struct i915_refct_sgt with default ops
>   * @rsgt: The struct i915_refct_sgt to initialize.
> - * size: The size of the underlying memory buffer.
> + * @size: The size of the underlying memory buffer.
>   */
>  void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index b13e4cdea923..0b8bf4be4330 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -149,7 +149,7 @@ bool i915_sg_trim(struct sg_table *orig_st);
>   */
>  struct i915_refct_sgt_ops {
>  	/**
> -	 * release() - Free the memory of the struct i915_refct_sgt
> +	 * @release: Free the memory of the struct i915_refct_sgt
>  	 * @ref: struct kref that is embedded in the struct i915_refct_sgt
>  	 */
>  	void (*release)(struct kref *ref);
> @@ -159,7 +159,7 @@ struct i915_refct_sgt_ops {
>   * struct i915_refct_sgt - A refcounted scatter-gather table
>   * @kref: struct kref for refcounting
>   * @table: struct sg_table holding the scatter-gather table itself. Note that
> - * @table->sgl = NULL can be used to determine whether a scatter-gather table
> + * @table->sgl == NULL can be used to determine whether a scatter-gather table
>   * is present or not.
>   * @size: The size in bytes of the underlying memory buffer
>   * @ops: The operations structure.
> @@ -173,7 +173,7 @@ struct i915_refct_sgt {
>  
>  /**
>   * i915_refct_sgt_put - Put a refcounted sg-table
> - * @rsgt the struct i915_refct_sgt to put.
> + * @rsgt: the struct i915_refct_sgt to put.
>   */
>  static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
>  {
> @@ -183,7 +183,7 @@ static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
>  
>  /**
>   * i915_refct_sgt_get - Get a refcounted sg-table
> - * @rsgt the struct i915_refct_sgt to get.
> + * @rsgt: the struct i915_refct_sgt to get.
>   */
>  static inline struct i915_refct_sgt *
>  i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
> @@ -195,7 +195,7 @@ i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
>  /**
>   * __i915_refct_sgt_init - Initialize a refcounted sg-list with a custom
>   * operations structure
> - * @rsgt The struct i915_refct_sgt to initialize.
> + * @rsgt: The struct i915_refct_sgt to initialize.
>   * @size: Size in bytes of the underlying memory buffer.
>   * @ops: A customized operations structure in case the refcounted sg-list
>   * is embedded into another structure.
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..cae684c40d4f 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -256,7 +256,7 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>  	}
>  }
>  
> -/**
> +/*
>   * __wait_for - magic wait macro
>   *
>   * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
> index 5d8427caa2ba..14a0327b2080 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.h
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.h
> @@ -84,7 +84,7 @@ struct i915_vma_resource {
>  	intel_wakeref_t wakeref;
>  
>  	/**
> -	 * struct i915_vma_bindinfo - Information needed for async bind
> +	 * @bi: Information needed for async bind
>  	 * only but that can be dropped after the bind has taken place.
>  	 * Consider making this a separate argument to the bind_vma
>  	 * op, coalescing with other arguments like vm, stash, cache_level
> -- 
> 2.36.1
> 
