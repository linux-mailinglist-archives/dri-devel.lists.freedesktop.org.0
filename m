Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F38B0FD8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BE710EEF1;
	Wed, 24 Apr 2024 16:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQZu8GSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C8710EEF1;
 Wed, 24 Apr 2024 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713976375; x=1745512375;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=ELCHovO+XWGaQgjrKMHG+5q7PstxsnFWI0MqXckHTPE=;
 b=KQZu8GSZ19N+i5XENOw2SakyJmjxpitNDjnfvuO8WGRVN6WpKxJBJ4X6
 SwuhEa/QcU92f9IHqA5mDyjpPr0jUYahQdbQnSyYRhs6LGwAVwuMtaTnf
 w4ODNIEdmK9XFLGMnBYE85KkqQvZwVJmbX+biWawis3Hmuj02dUr4BT7H
 t+gsjcfvT761Iblyh9PD4M63jQcPSmEneG23L9y7DHj/nmSdV1f67dMQj
 ymDECeus3ulfo40Eu/c4iqno2QPplUajXYoMJpImKtpO1zHnp/M9Cybpy
 ap5KMEIX4YpmZ+lfSBhxmc+7M/4paPhhEYOf6PMhJ27aJMlfreaaAOJKx Q==;
X-CSE-ConnectionGUID: Si6mGDBYTzS/9zw6wAhBzg==
X-CSE-MsgGUID: tp1R8q+VQLeVnSZxLpzZug==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32111919"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="32111919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:32:54 -0700
X-CSE-ConnectionGUID: JnhJ/aaMSPqBDL8ozmAySw==
X-CSE-MsgGUID: N2r6ULzsQUqZcIsXQYy1DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24807916"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 09:32:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 09:32:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 09:32:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 09:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPgsyHLLiXvqpgu4jx/mZGPvYlVCbwo0RYjpWfFojH6AzYi8uxpHGE34mKB0ijV8dRbsbTv3L3DcLMiWNQ8rVaoGaz/1iSNrLIJdpvsHknp3mpvo9ANN+BkqqqO249WA73vYBOKlNyZ3hmXDJ75a6rXcPSZqpjATCqsl52GIctpAl1akd0pFhSeAJPnN4FoIzXkoEd3cO+gBoG0VbKdZdOrKh88Hc7yBDstQy9FVQMi+bxWH9STENz9qMmS9NYr31MQJOHGwfHgiSQcvf5C3iOQYTWL/0pC/YLYTh1f56r+mRUC2IoenBLNavX++IxYB88lpEqTE1r51ozCXs0EZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jDJacofJ+sobFo4iYURGl8DLyGp0JYveayxiGwUqHk=;
 b=JKT5lp5fUNQPZxIkehqXofEF6KLbRq1ZB0peXhdBL/H3B3h0pC7cafCv6AOjCrZM1eLCgorWou0r5tP/JwfC0dombAZCi72cmDs7xi/cC0kSECGGXAVn/lG702aaiI/VicDpYzEFekkLQhIc8M91GYQQmYu4+88YMw8TTslQcOXqUzCdamXAg3F2t8tMFowlhNyPSPosxlrJVtLGraLoyuaHIFJPcUJvvDVVCaBM0NFFtruPHRMfwYClOUX77H8/Xvf3hWicVlOV5+n4Zh+HbcZvFuCk6b8s7/cFmLiUQvzL4eN/6wKg/QXWmULSqDthxE37Rde0ebbr1q+evfuhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 16:32:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 16:32:50 +0000
Date: Wed, 24 Apr 2024 12:32:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <Zik0LKEtN1PwXXGb@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df8dcf6-8bc6-4446-dfe1-08dc647c2eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?X1aljHGJ48V0Z9wOnRh+KAx3+Oe1pbL9S+Rz1u+ox+unFr1jDn5d/7YzBN?=
 =?iso-8859-1?Q?cBAlWwzW2gbpU3FzEHGfsebugcGVoh7GZR0Jfsk8is1aPXNzqrJpfxk1jl?=
 =?iso-8859-1?Q?vQB7u4HWNi+WmV1EM11sgmKMlTkvbuLduWRpZ7ZOXmGSaT6JxU4o+CZyx5?=
 =?iso-8859-1?Q?vWGOsSksW3sU5sYa3ZrXJRmvDMrH3z4TTUyvwkW6/jfUj3qsz6t46/mQ68?=
 =?iso-8859-1?Q?IydoJmxsPvVn+edzDsGxUio5k04cUMCo3UoyZoyLKDiyTGyu3SOB6k0WYp?=
 =?iso-8859-1?Q?NcwZLfF3UTF9L2nhN6801u6rhjgmcCx+v1M88uyUA/LQskEmMG/7qJkGOl?=
 =?iso-8859-1?Q?h+xLQ46txHFEBBJGFkKl3B3XlMWmMnDqe6dm/o21AB4dRK/MQ4+bv19zVX?=
 =?iso-8859-1?Q?3kXSiWjRhYYYWlTHcTI8M2ZwpNNYIZmnqyZvPd8YgglHn0Oxu5s4te1Qw/?=
 =?iso-8859-1?Q?ls1rv7jQ7rm4jKF3mU9plWnwI10dZ27xXTMyWcsgFRp6o7hc0UKw/FbpNt?=
 =?iso-8859-1?Q?0IMi+Sm/6ND+giyq4C6nsqGpUgg6BtEc0lo6A8MEZCHdlsJ9e3du3kQNB1?=
 =?iso-8859-1?Q?NJk7lZ4Cq8LNYKqt95n5nQX1EVVcQ2shIyKPPZKzPNpQvyzcxwpoUxdRQZ?=
 =?iso-8859-1?Q?mOATVPyuIk7aw24nSopEBM/Pvi99si08rr2nbW13/U/JUGaUxxbRbtetvZ?=
 =?iso-8859-1?Q?fF0V/LsJiRxCAVy5R62dh3GuXLMkjkXokIvU1H8LPmEsmgP7XbJ955lutW?=
 =?iso-8859-1?Q?CP/KTAKBBB/fmtDIk3hWkH9LV8FtiFeHxIgohtQweWxUN1aL+fV0mVzqVD?=
 =?iso-8859-1?Q?oSa+m9aGTiDKVKT/JKVVrbUMuUEAimj6GDu3zitqYMFHq6AzoOsANXixZQ?=
 =?iso-8859-1?Q?btNrUt4N7dXcUEO9k5TmWDeaijTfZjxsz/Yi/ffx3XNIiRu0XYXrPX6piM?=
 =?iso-8859-1?Q?QVgaq2NeGw5bk7Hn/+WkTQOZ6aoRH5OtizHPGM+Wrp85DCdyEQ2iFeYsdn?=
 =?iso-8859-1?Q?Xx2B7k1tCcfbzULbLa6zRjkE+lGKl8C1OYe2basvzNHy9uE+Qt/cz4VwQu?=
 =?iso-8859-1?Q?u8SBHv0i3UENF1Xl2Y5kbGLKjwdVew4kGTo5LNTpHKR9EBPlgHSHX3nk8c?=
 =?iso-8859-1?Q?tCkQNy5Wb9PHhUgAjFlYSywf+VG921qVU1TusSNvQy7fNcom/PmKcNuXpQ?=
 =?iso-8859-1?Q?9ogSfm86ou745jO2CSx4Vv/Vp5gdpBpLsi6XZgw2fIiXeQ6oLICpqfGqPp?=
 =?iso-8859-1?Q?qgYbXYac3ziZbCSYWfYhkbKaXckqIuQb2uWc//RNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RgvKPwfWCAuUikerEf3bDrx0OfuI5+eXK0r+0wSm9sMgkWth7Go0W2qDJG?=
 =?iso-8859-1?Q?Aj280VPHmfAuEt8MX/sQr2csNhWhSzKyDwppdIFEp2Ru0C9UPNnPMoHNCS?=
 =?iso-8859-1?Q?fbENpGUcemJVbuAFTyzWZLxG7vW4+PWrY8HnZngv+WUCW2vA1oI4Dj42Vz?=
 =?iso-8859-1?Q?zEa2pzGwew7hVH52HNu+IXKVktuL8TXP0QbbgjhcpR0WsEhGJ+GircRXAe?=
 =?iso-8859-1?Q?lJuHxSr01qw3IHYVw1hMbELIl9vepl8GBHAEq5pmYvVZ+hjapK9EPqZds0?=
 =?iso-8859-1?Q?I4q2xGlIHXRZkXoE92eugbIQAQUZ1JsEcJEG3F+Mt0NqhXHjf7Lz3ogtGx?=
 =?iso-8859-1?Q?Wl0juncnNOSd+sCwUFit+gkgKBom8uhP08E+mbI0B/qob2qOD9fhdFFT3s?=
 =?iso-8859-1?Q?T9vv51YaQoBTExZXijQsrwN9pTi24ukSXu7n/ZlhYrxRWiYBMDArURFOR8?=
 =?iso-8859-1?Q?jtTucvvqlPhx4fzAFKy23IUVflzaHF/+5r7Jjf0fubRUmKgZ8HOMF4wloA?=
 =?iso-8859-1?Q?YnuqIc7v97uEfVwIHAj8ITrC//vX0VSwWWHSkCVs9jdrpeTs72ykvARWQr?=
 =?iso-8859-1?Q?MZD3IiefsqkwVN73Bl6mEZ9p4hunJUiwCfWi/q/LfLXfT2xircTRc5mheO?=
 =?iso-8859-1?Q?WRkuNL3DQlLahl4X/+EIRALakRpTXgNDEET6W6vClDvg8eWjqG0ip0it+g?=
 =?iso-8859-1?Q?YZKN51Qgznjaa6W+oYq/y0dWmzjSkPlCSze7DlU3Y0dXw7oDD1MG8d8pvM?=
 =?iso-8859-1?Q?ANvqcyiLe4O+g2Y+GvqPj1IAia8Z4rlsXV/Jlgx9kNN2DbhHChINg6xXOl?=
 =?iso-8859-1?Q?eqmseucWs48NlXk5y6un7miS3QIFCZbaBpvFnvlD9BfxToPaYlZ2M72q5/?=
 =?iso-8859-1?Q?4uid5vVfV+iYq/+m0uURbA9Ko992vGm6b6tgosi8QRE4YWv+jCWayyZ+Wg?=
 =?iso-8859-1?Q?1R73aAWI/xozGskgLx28xGA2X+CbxKKRtNgz12a4GRpsAFnhXtvzCzZnES?=
 =?iso-8859-1?Q?9XTsn0bNe805jCiqGteRqm2mI2r3pY0soDT9Y6bn3dyEOGKA3t+RbmKvDs?=
 =?iso-8859-1?Q?Xna/rmPTrX5x6HgdkgauYkClIBDEdQp1rBguIiv4xHPgoDAZRCEsrdZ/VO?=
 =?iso-8859-1?Q?Df4jo+Zu4gvAfqkShIn5ilD3gKTgH/kFKej8bZGcqZ25ySZsKYft/YKcE8?=
 =?iso-8859-1?Q?WDd+RIg6jMcFa4o8n5rt5/YRldM8skS+JA6RX5ntOnsCK3MOCnkb7IApiw?=
 =?iso-8859-1?Q?2ID48+Clo3yM9wGHeUhYud9sVYEO+1qgmjGR8utJSjCwmL5REWDh6gAI6L?=
 =?iso-8859-1?Q?sFuE4//UTqoAQXGxh0KSTo8OA9GXjWtPmUAasTWF58mMLuc/KTGTZr8Zuy?=
 =?iso-8859-1?Q?SySA6OE3Fg+Y/l6lvBfdWk/7dNTjGALr/3vRZOR8tx5PF9T6a9LZM2BAHh?=
 =?iso-8859-1?Q?wt55iLe+PNoePS4mRUHkhh2FEdXz4+n54OFdDZeNRQC22pSTwNwRRz76pr?=
 =?iso-8859-1?Q?feOi5AHaiqKkMYBxBsUkU7LB0LqzgLI+t/BOFcTcB/7Js3NEzKPw5PRz6+?=
 =?iso-8859-1?Q?ccXsDveWv0hqlheFGlT4eLXQKsiZ/FfQsUufD8baG82zUXDJXyik+LP1Tz?=
 =?iso-8859-1?Q?4Gyyg5vboPQKK7G82h9etKw1SHrqQxXU5P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df8dcf6-8bc6-4446-dfe1-08dc647c2eba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:32:50.4809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTWn9vjclnt55M5BXjweO+8tr95P7bZw6x9dqWt37gngmS83j/b2cLxlxL0D943nCmoU5fOtaoeAEW/tZcNqrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
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

Hi Sima and Dave,

Here goes our last pull request towards 6.10.

drm-intel-next-2024-04-24:
Core Changes:
- Some DP/DP_MST DRM helpers (Imre)

Driver Changes (i915 Display):
- PLL refactoring (Ville)
- Limit eDP MSO pipe only for display version 20 (Luca)
- More display refactor towards independence from i915 dev_priv (Jani)
- QGV/SAGV related refactor (Stanislav)
- Few MTL/DSC and a UHBR monitor fix (Imre)
- BXT/GLK per-lane vswing and PHY reg cleanup (Ville)
The following changes since commit 700c34019555392a348f8c03237c1ebb5bf53eb4:

  drm/i915/display: tie DMC wakelock to DC5/6 state transitions (2024-04-17 11:41:23 +0300)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-next-2024-04-24

for you to fetch changes up to 6068bc209ac8d07a5d04e93f168465195e22a4cc:

  drm/i915/dsi: pass display to register macros instead of implicit variable (2024-04-23 17:00:14 +0300)

----------------------------------------------------------------
Core Changes:
- Some DP/DP_MST DRM helpers (Imre)

Driver Changes (i915 Display):
- PLL refactoring (Ville)
- Limit eDP MSO pipe only for display version 20 (Luca)
- More display refactor towards independence from i915 dev_priv (Jani)
- QGV/SAGV related refactor (Stanislav)
- Few MTL/DSC and a UHBR monitor fix (Imre)
- BXT/GLK per-lane vswing and PHY reg cleanup (Ville)

----------------------------------------------------------------
Imre Deak (11):
      drm/i915/dp: Fix DSC line buffer depth programming
      drm/i915/dp_mst: Fix symbol clock when calculating the DSC DPT bpp limit
      drm/i915/dp_mst: Fix BW limit check when calculating DSC DPT bpp
      drm/i915/dp_mst: Account for channel coding efficiency in the DSC DPT bpp limit
      drm/i915/dp_mst: Account with the DSC DPT bpp limit on MTL
      drm/i915/dp_mst: Sanitize calculating the DSC DPT bpp limit
      drm/dp: Add drm_dp_128b132b_supported()
      drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
      drm/dp_mst: Add drm_dp_mst_aux_for_parent()
      drm/i915/dp_mst: Make HBLANK expansion quirk work for logical ports
      drm/i915/dp_mst: Enable HBLANK expansion quirk for UHBR rates

Jani Nikula (19):
      drm/i915: use system include for drm headers
      drm/i915/display: add intel_display -> drm_device backpointer
      drm/i915/display: add generic to_intel_display() macro
      drm/i915: add generic __to_intel_display()
      drm/i915/display: accept either i915 or display for feature tests
      drm/i915/quirks: convert struct drm_i915_private to struct intel_display
      drm/i915/display: rename __intel_wait_for_register_nowl() to indicate intel_de_
      drm/i915/dmc: convert dmc wakelock interface to struct intel_display
      drm/i915/de: allow intel_display and drm_i915_private for de functions
      drm/i915/dmc: use struct intel_display more
      drm/i915/dmc: handle request_firmware() errors separately
      drm/i915/dmc: improve firmware parse failure propagation
      drm/i915/dmc: split out per-platform firmware path selection
      drm/i915/dmc: change how to disable DMC firmware using module param
      drm/i915/display: move dmc_firmware_path to display params
      drm/i915/dsi: remove unused _MIPIA_AUTOPWG register definition
      drm/i915/dsi: add VLV_ prefix to VLV only register macros
      drm/i915/dsi: unify connector/encoder type and name usage
      drm/i915/dsi: pass display to register macros instead of implicit variable

Luca Coelho (1):
      drm/i915: limit eDP MSO pipe only for display version 20 and below

Stanislav Lisovskiy (4):
      drm/i915/display: Add meaningful traces for QGV point info error handling
      drm/i915/display: Extract code required to calculate max qgv/psf gv point
      drm/i915/display: Disable SAGV on bw init, to force QGV point recalculation
      drm/i915/display: handle systems with duplicate psf gv points

Ville Syrjälä (26):
      drm/i915: Replace hand rolled PLL state dump with intel_dpll_dump_hw_state()
      drm/i915: Use printer for the rest of PLL debugfs dump
      drm/i915: Rename PLL hw_state variables/arguments
      drm/i915: Introduce some local PLL state variables
      drm/i915: Extract ilk_fb_cb_factor()
      drm/i915: Extract ilk_dpll_compute_fp()
      drm/i915: Extract i9xx_dpll_get_hw_state()
      drm/i915: Pass the PLL hw_state to pll->enable()
      drm/i915: Extract i965_dpll_md()
      drm/i915: Extract {i9xx,i8xx,ilk,vlv,chv}_dpll()
      drm/i915: Inline {i9xx,ilk}_update_pll_dividers()
      drm/i915: Modernize i9xx_pll_refclk()
      drm/i915: Drop pointless 'crtc' argument from *_crtc_clock_get()
      drm/i915: s/pipe_config/crtc_state/ in legacy PLL code
      drm/i915: Add local DPLL 'hw_state' variables
      drm/i915: Carve up struct intel_dpll_hw_state
      drm/i915: Unionize dpll_hw_state
      drm/i915: Suck snps/cx0 PLL states into dpll_hw_state
      drm/i915/dpio: Clean up bxt/glk PHY registers
      drm/i915/dpio: Add per-lane PHY TX register definitons for bxt/glk
      drm/i915/dpio: Extract bxt_dpio_phy_regs.h
      drm/i915/dpio: Introdude bxt_ddi_phy_rmw_grp()
      drm/i915/dpio: Use intel_de_rmw() for BXT DPIO latency optim setup
      drm/i915/dpio: s/ddi/dpio/ for bxt/glk PHY stuff
      drm/i915/dpio: Program bxt/glk PHY TX registers per-lane
      drm/i915: Enable per-lane DP drive settings for bxt/glk

Vinod Govindapillai (2):
      drm/i915/display: extract code to prepare qgv points mask
      drm/i915/display: force qgv check after the hw state readout

 drivers/gpu/drm/display/drm_dp_helper.c            |   2 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  22 +-
 drivers/gpu/drm/i915/display/bxt_dpio_phy_regs.h   | 273 ++++++++++++
 drivers/gpu/drm/i915/display/intel_backlight.c     |  40 +-
 drivers/gpu/drm/i915/display/intel_bw.c            | 160 +++++--
 drivers/gpu/drm/i915/display/intel_bw.h            |   6 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  33 +-
 drivers/gpu/drm/i915/display/intel_de.h            | 157 ++++---
 drivers/gpu/drm/i915/display/intel_display.c       |  38 +-
 .../drm/i915/display/intel_display_conversion.h    |  22 +
 drivers/gpu/drm/i915/display/intel_display_core.h  |   3 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  39 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   3 +
 .../gpu/drm/i915/display/intel_display_device.h    |   5 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   5 +-
 .../gpu/drm/i915/display/intel_display_params.c    |   4 +
 .../gpu/drm/i915/display/intel_display_params.h    |   1 +
 .../drm/i915/display/intel_display_power_well.c    |  24 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  80 ++--
 drivers/gpu/drm/i915/display/intel_dmc.c           | 179 +++++---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |  72 +--
 drivers/gpu/drm/i915/display/intel_dmc_wl.h        |  12 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  18 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 106 +++--
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      | 213 +++++----
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |  48 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          | 328 ++++++++------
 drivers/gpu/drm/i915/display/intel_dpll.h          |  12 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      | 488 ++++++++++++---------
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |  80 +++-
 drivers/gpu/drm/i915/display/intel_panel.c         |  10 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   6 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |  56 +--
 drivers/gpu/drm/i915/display/intel_quirks.h        |   6 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   2 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |   1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             | 467 ++++++++++----------
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |  22 +-
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        | 327 +++++++-------
 drivers/gpu/drm/i915/gvt/display.c                 |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c                |   7 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |   1 +
 drivers/gpu/drm/i915/i915_params.c                 |   3 -
 drivers/gpu/drm/i915/i915_params.h                 |   1 -
 drivers/gpu/drm/i915/i915_reg.h                    | 262 -----------
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |  19 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   2 +
 drivers/gpu/drm/xe/xe_device_types.h               |   3 -
 include/drm/display/drm_dp_helper.h                |   6 +
 include/drm/display/drm_dp_mst_helper.h            |   7 +
 include/drm/display/drm_dsc.h                      |   3 -
 include/drm/i915_component.h                       |   2 +-
 56 files changed, 2067 insertions(+), 1652 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/bxt_dpio_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_conversion.h
