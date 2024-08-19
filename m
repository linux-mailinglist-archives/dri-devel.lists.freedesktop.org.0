Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1D957118
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C743F10E300;
	Mon, 19 Aug 2024 16:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSlm+BEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635E510E300;
 Mon, 19 Aug 2024 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724086502; x=1755622502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XEBfde/FbbGxGU6CHWaDXd/uZJeMYRjgZbjnX8g7rMg=;
 b=mSlm+BEiEsginRBdhEyVFIMHUp2AIUi1TtZOtnjOIwZ85CUAhRskgXEM
 bh4yqp6GGmbM6Nu4B9NDY02xNJNuN/9lwygjAXHrRel6rzrzG5g9cyiVw
 8u3rQBYMt1ZT0KtHmMxpOjNtry8nQa6lkp3xQ232ZuZNHErUEJvCrab4T
 9yKgupDZaLX3xtkyPNyhQhTwlo/pO2aYzT5Vf9aqM40xjb0CIdWXqieUg
 U5xQYn/CGZhsoOf8NJIlUBFeURhL1Jc1j7xl2K2mql8IzU0CEygGOuHFM
 aBcr5ecqvRmF8XZV7ais9SywGPiz0j7U2jlYbgKEuuAwijjiHOmImtNtL A==;
X-CSE-ConnectionGUID: 7yMsDqgiSDaarGB0wZNXyA==
X-CSE-MsgGUID: XyirD/LnSaKtZmbCV1CDcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21889475"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="21889475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 09:55:02 -0700
X-CSE-ConnectionGUID: tczk3LLwTyKIvEy7VTgwSg==
X-CSE-MsgGUID: Zno1DnGjQiedOO+gHfm1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="91201334"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 09:55:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 09:55:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 09:55:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 09:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydL2FWfYXnjtHzpAdXnJVkc2obZrTl05339Azr19vsiNSalOOHx5M5DRTr0Jg6M+ZRaA+1G+g+ts8jO6sDAi/bfVYp7gqbDp4QzVvkoKb9KYuqUUYJGJK+EcHXP1aIfJNJ1e4KpXJ0uE+oUac9hX98yITdiTbA9Iy2Kusj+H7M7KvXnKeYGa6bbqdrVVZy3GWpZA2PlHT77S0ES8NFx2dGw1XIEzWgB6z2Gc8d7OPywRsKB9REJdlx3rzlmeNAYXzGf/R9YyWIGktz0YZyIEOIlNmq1hx4PRqc0gO2qlYQ6XS/sl4EAU56biesZaF4sOxfNE8CTGfbB44IhRcOR/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cnr9wpVDHMn+HleKE+Tp9MZi8Htwwr2F8UiYOIJYzk=;
 b=mP+zHHopNZ29Rj4nO19VWDozPRso6RgFzAI8BTolpGJmT1n5H4JHHpPVwW27tr8Jruc7Qm0bZwzTTbVAEoF8/9kIKS1w2USup9he8LU+0uOtrmWEA1k9YDxaMZtlH4UQAJQ68PgvirXJDY9GRDlBU+64EbyoS2beTnofMhk0UIuCm8OBpd/OGf7uHrhIoctG8Jb4C+tr1reARTB8aLqa2hRpqfO/q5QwfDvgST6ITFPsqoFy/llyH/VjT5nMsQO/pNzKZ7MwOLrvm46dRYYiawFdTJFfCU+EQIXDGToDHcjmkxmP6Qx3zQH+eunSZv6Mpyo/53Lv2mnCbOmDarI38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8720.namprd11.prod.outlook.com (2603:10b6:8:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 16:54:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Mon, 19 Aug 2024
 16:54:57 +0000
Date: Mon, 19 Aug 2024 16:53:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, Sima
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZsN4ldv+LdyJJ0nO@DUT025-TGLU.fm.intel.com>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
 <ZrzWJiJ2Yr0DJPG2@DUT025-TGLU.fm.intel.com>
 <ZsNhua9FIrDT92-r@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZsNhua9FIrDT92-r@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 689b9a65-9a0c-4725-2de7-08dcc06fa7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fu8tDHFtqgmvO8yIzcegim0KYXbP2nOL7Hnx3ljt/8N2IBgsbbXputQHP941?=
 =?us-ascii?Q?gK2zLEcpWSwCtxn1zSkGoahgZwQQa1vs/nuw9ToALOKij4OWpcGrx+MPsXfN?=
 =?us-ascii?Q?Pivg4PnM8wNCzCn57NHFcwUqhCeZCZ4bmRqt99XrUCihydLR5OtMxhZvn7nM?=
 =?us-ascii?Q?y2Z5ij3mkPK1xUivrok8O7+w2vlL79m6dxTKiQVIKYJEjkJPsoltOFfxVC1/?=
 =?us-ascii?Q?OgnwzM3Edr83aw42M+A/6fyS/3GPCETN7Xz4PEEMhw+rGGd+koaxpgiDa43F?=
 =?us-ascii?Q?2FZvHcFqGo2YCtye6ugsGE8oHjp1nzrBJWYU/WwvAfTkN6CJTd6KaeG5Rf1c?=
 =?us-ascii?Q?uCelX9s3yGPGsTowXaeSJMOG2suN7zCvg+ZpEz9PllGUsXrvWW/fpEXvca0Y?=
 =?us-ascii?Q?kMgGenBWfaj/jT3mTQvfOGbC7bMwvmWPea7GyxPE2DWmLo1r6x/rell4boGg?=
 =?us-ascii?Q?axp0/vPXWhKVnSAl5J1bG1R826EpOaPbTM9+cI4hZTa4jXzBtTpCg/qIKj7z?=
 =?us-ascii?Q?prO0GGFBsyiKl78aSIAzvnZnhFbzIkSOsZjvczddM9vC0U2sGbey3nAUes62?=
 =?us-ascii?Q?bd/UBRjwJmVGz9izvV5CzgCR4LdoAXRVNGO4q64DsjNZCYL/WbHv836bPWx0?=
 =?us-ascii?Q?3mt6h4ATEOePzR/9XLASqrptWPwlbWI48VTAEwCw/tPqTQYqSFuHUB+sk4R7?=
 =?us-ascii?Q?Vue0g6gON175YvfrWKosFNwU7iTRD1M0AoEUWflY6F1E/wuMhP9KLmq2qJ61?=
 =?us-ascii?Q?FqBeSDS1E6j3NmX3qzOjJL9Bb6qfIAY4B1bkpSYALVSkuerY6t6s0ysCd3JS?=
 =?us-ascii?Q?2XvhMpwoqTcW13PMZkzyd6RXlzPb22m6IOW7/kwavBNJuZLa3MI7O+I5z3rC?=
 =?us-ascii?Q?U73xeNsM/wiGSiBj0NFuRAPwoRsFukfcgVlo1fAlOwJNXIG3q9W/7+kC2n4t?=
 =?us-ascii?Q?oBUulCHckMHcMMnlbTZTdzdYqO5Y6XsGwqXBAJZcM1xdKWOjk1Nd5/Y9d4yS?=
 =?us-ascii?Q?vpuykCDBTvDp9+YdMR4UZ2MqrLa+fqBfitxVTd60XGSbB/s41jfkIXEiysvm?=
 =?us-ascii?Q?0EnqdAzMtkRFs7jxq+e5tj1QrC7xoPTNDE05ppvSmXpTwZksQjBwOrwtUqXh?=
 =?us-ascii?Q?oxdrI8tRAAT3GF5grHujlxGNbou0p9iqLXofZDGh/1tMULWRdB5Fln4n27d0?=
 =?us-ascii?Q?lj+yfZgO9Y8EBZov31OuvaxENGnGSlT9En5QL/xxqaBt4YY6DOsYC7QxYwG8?=
 =?us-ascii?Q?a81H4HK0EPNyW0W5mhl1z6CHBDWl/bnBijKxPYhdoOJ+HSbBMlV3ktGxi/Zj?=
 =?us-ascii?Q?Ue8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hiTXun6h25uelHC5FfiMIT+J9gWqgVpLhLGhdxNVh8eCqz1GpufELxESXf4/?=
 =?us-ascii?Q?PDgdQ3+wuC8sL//m170rz74LT2MWp7DENcQ33mca8Pq9Rkhnh9JLres67ryB?=
 =?us-ascii?Q?vVi5RH5eWY2j+4se+N3haANIZpioJrRqHT6koc7CFb8Opx8xJUmGoUoz0sEv?=
 =?us-ascii?Q?QMPf37k6rDD/DPDsTHa1IKMlGhu++G6cgdr3WraBdSl+XBdtjIqdv+6Ojhwj?=
 =?us-ascii?Q?mWxpzrVz9ixZcta6ktteNLzJYNJLbv9ubQPuIvqOxrhNidc5fBrzxkPq1oHk?=
 =?us-ascii?Q?xWVGizeRUaPXV074iftJmJL8u4MJEb67a1HFsAZUTQqFuqSiGpHob8/D0TSO?=
 =?us-ascii?Q?gKDoMRvk3BrCVU85ZAl4l27MhBfE5jcTv7c5jDZLYbAMPykmAe7o0HDoN4xp?=
 =?us-ascii?Q?CHNtm362g8YK+rRuEn2N6hlAShbl1QoZ28oJZX/gz2IVxtnHD3Ere3k1AXDY?=
 =?us-ascii?Q?Fniasla4uVyGnfeV2iy8axQ8RYcl6AIdnAsLk4rhSUKF7oCJ0otCt5kPYAle?=
 =?us-ascii?Q?Jt2jOq1qUd7bvm65aX0QWcXjbwF2nJLXtEpuHsB8EPY5N63WmyWWbHlxnjJh?=
 =?us-ascii?Q?SqQhEpOvy/0KNvHhnIckldX52NqDpLiHHslWg473nPjaAX6E3MgsiFXc7YUe?=
 =?us-ascii?Q?fijucxESME5YfOwDXJ8EoTyKbzF32QCfM2kPnmRQrdofcux7mRnCm118LiwC?=
 =?us-ascii?Q?ZNr6+V0f4LI5Vhc6sa9DaTR1+7T19DTaT9WSdXPXvHS7QhAySsZchy0RBpdh?=
 =?us-ascii?Q?14a2Xa8FRoVUfKGoZ8WD3GdMI8z2plE4jBJwb9JxTld36z3Gt701ozYVMiwY?=
 =?us-ascii?Q?lfh2EKRGNGvYAduEtZtJZYJ0ZK8SaTpsUrWqqjrQgnei6XQ4U48HZR/mCi9Z?=
 =?us-ascii?Q?a2UWsBtoEZcm/KM3zUn5UcIWlEz/MGXJifmb/JGriV/jxnSm2u4vNDp2MXPL?=
 =?us-ascii?Q?1J1Ec0/CdyQtJwRIwjdigxQHLw3oRui3Twali0qUN35swJPKKP5vj6HxYtit?=
 =?us-ascii?Q?FfZex18S6BAxDDJFy+DEYaqC1NFoT+HNOQKjLd8EELnkIdj4k3lO2A60I3dn?=
 =?us-ascii?Q?Z+9j+nFiNkLNxbUryQikCxprcv38h3EOWviX2bBPXNMt4JcpHzsYV3tU9Ncb?=
 =?us-ascii?Q?3OCo11Dn5hw7Y4aQhadXXfiLpT+h77LBw9Eny6T6Xzi6PWjvQsdDNyZ9fR16?=
 =?us-ascii?Q?klQa/mGjDXFN07t/rwO+8sjBkgF89xKnp/Nq5F5IuGgEEwNlawBdR8RZfPzM?=
 =?us-ascii?Q?P9/MkfUfX9fcWahdZGyUqKW+60xIC+MS9DAYzeJ0XUpgNETQTVEU5j2yDe+4?=
 =?us-ascii?Q?HAtctKrNu18f/jiW3hKLZf5/j8uR/DgIk1oVTE/It5jOKRaKRc2tjvfZHM14?=
 =?us-ascii?Q?QqXSinSzUZuWaiI7MMY3K9FQl0upcXJX1fQVXGzldwPqSslj+iSARamIF6tO?=
 =?us-ascii?Q?4oS7CZlojyUPdzZl+jsQTFlusFWV/sT32xjyplcoukRVkvUszji1YcKsPw0S?=
 =?us-ascii?Q?0Wn+MvjWm5Pje4Ske4U/PsZqCUNCUiLymkbBTXmfl4ykhzv4WGnu/Lr7sdBP?=
 =?us-ascii?Q?s22VPJqM7dcBrcrR/1K05Sz1dRtHufwG170P198vwI7F57Xm2FkhDuOUVtMF?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 689b9a65-9a0c-4725-2de7-08dcc06fa7c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 16:54:57.0086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AU8adzocTbgiaRGkTW1wMOjCbC0eAqkYWKTC27C5/t1bdz7alKA69VnKOutiklUNpbd6PE6wgS1xaj44uJVI4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8720
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

On Mon, Aug 19, 2024 at 05:16:09PM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> On Wed, Aug 14, 2024 at 04:07:02PM +0000, Matthew Brost wrote:
> > On Wed, Aug 14, 2024 at 03:48:32PM +0200, Andi Shyti wrote:
> > > I am resending this patch series, not to disregard the previous
> > > discussions, but to ensure it gets tested with the IGTs that
> > > Krzysztof has provided.
> > > 
> > > This patch series finalizes the memory mapping fixes and
> > > improvements by enabling partial memory mapping for CPU memory as
> > > well.
> > > 
> > > The concept of partial memory mapping, achieved by adding an
> > > object offset, was implicitly introduced in commit 8bdd9ef7e9b1
> > > ("drm/i915/gem: Fix Virtual Memory mapping boundaries
> > > calculation") for GTT memory.
> > > 
> > > To address a previous discussion with Sima and Matt, this feature
> > > is used by Mesa and is required across all platforms utilizing
> > > Mesa. Although Nirmoy suggested using the Fixes tag to backport
> > 
> > Other vendors than Intel too?
> 
> Yes, that's what I understood.
> 
> I hope Lionel can jump in and explain the use cases from Mesa
> perspective.
> 

Hearing from Lionel would be helpful.

> > > this to previous kernels, I view this as a new feature rather
> > > than a fix.
> > > 
> > > Lionel, please let me know if you have a different perspective
> > > and believe this should be treated as a bug fix, requiring it
> > > to be backported to stable kernels.
> > > 
> > > The IGTs have been developed in collaboration with the Mesa team
> > > to replicate the exact Mesa use case[*].
> > > 
> > > Thanks Chris for the support, thanks Krzysztof for taking care of
> > > the IGT tests, thanks Nirmoy for your reviews and thanks Sima and
> > > Matt for the discussion on this series.
> > > 
> > > Andi
> > > 
> > > [*] https://patchwork.freedesktop.org/patch/608232/?series=137303&rev=1
> > 
> > So here is really quick test [1] which I put together in Xe to test
> > partial mmaps, not as complete as the i915 one though.
> > 
> > It fails on the Xe baseline.
> > 
> > It pass if with [2] in drm_gem.c:drm_gem_mmap. Blindly changing that
> > function might not be the correct solution but thought I'd share as a
> > reference.
> 
> Thanks for sharing it. I took a quick look and I think there are
> a few things missing there. If you want and if this is not in
> anyone's task list, I can try to "port" this in XE.
> 

That would be great as I'm sure you undertstand what needs to be done
the best. Thanks for volunteering here.

> Is there any other objection to getting this merged into i915?
>

No as long as sima is ok with it, and we prioritize this for Xe as I
don't want to remove force probe with an incongruence in behavior from
the i915 or have a mesa use case broken.

Matt

> Andi
