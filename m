Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1DDBA9C91
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5405510E22F;
	Mon, 29 Sep 2025 15:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+blMMqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA73110E22F;
 Mon, 29 Sep 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759159538; x=1790695538;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0yMBbTdrbZsoKnHaFswecQWWVrw035NB0ey/rqgunGY=;
 b=G+blMMqrA7ttYcvfLNEqjCwLhSBL1WXc1PMNA7de9PJ3nilChJ3rBgQU
 ZxrYfdmS8OBsWKQBe+yZQGlTNDmB6l1KPSvHctjsfhJNV2CkMLgVH+sMe
 QrWU796y6FZKCe2XN77TcgybCsjzsavo1gSetDNEw6D0qf5R/s0DlIwNJ
 vyMyR2sNALcpid8oYiHHnXKXz2FYL02hW4BNJCwG6/xdajAOqmibdlcn/
 I4/Mb3EOFM8rCdsBS9uTeOu0gBT2P67ygVSDgjIcy9OcP8jqp1Ey33VgL
 Kb64PAdSXy48vchVJ2MOJW420+jnqq3jReMX9z35UeQNZlmJLXAnugbED A==;
X-CSE-ConnectionGUID: viyxNbBUThulK4OvpCfC9A==
X-CSE-MsgGUID: sp02vNzRSIaxq09BADZfZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60615338"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="60615338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:25:37 -0700
X-CSE-ConnectionGUID: vS2lVLIiSOaesnaX4OriqQ==
X-CSE-MsgGUID: uoeqhmQtRhiBoZ3bnTr8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177387425"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:25:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:25:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 08:25:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.55)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAwpEE3TeyxfuQRigo3ZFdiwxt3TKU8egDzAdn/7KexEXXMPlkI0iHLcoIHdjPYDxlTTltodtWlkePpAD5nHhITvBtRWdJ9fl7gTa8ver572g9K+Z60GTVfDV3Lcz/dDfrIfE/eASzwb31JYNDIIU5aq7bbxsbspRIZ4GoWfc086A9pOA3IEYCSA20lIsCmuLjngURZFMP3MQo9aRTJxkr4ntyDNqOquYeKWlSp2t2DM/+VZvi2xur1XgM50PjxMNKiK65iwvJM4dwrrPckjSOFyG06v4eaNzq2Ou8SOZe6g0fTBUZp0N6OWX6gAQKxwUBFxfDQBm/TIfTdrQYNU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0lyNX3BUmvGp66jtnY0mXVEFk176o4Cm6HjnAa0dFc=;
 b=Z5LhSpWQae9MRZPSfIY2nZ4Xr4C58nQ+SWYgMWJMlswkLSFVK6RcuQP2X7++EEnGyHSMgpvi6Bnb9aW+3f7s4Tw4NK+gIHLdtiysg9nG6Y79zdKA/RzXu2Nj5najeblC5z/AmbHs1/oyM7hAO7vz1LAyQdI2YYGYPKRo8ac4DVrAlijbS0hTAtygyBy/8oCRPkbD5Oh5kUsdSmSgUp4AQEkKrYT5yTBUHtEFbxIp1IauYZsSs88NjBV7sm9x42uPvDl6gNBbhkE1xwJwflJFVhjQ55HicAm/MtDi32gW+lF2mbBsbp6jfL1oFOKojflhWHhmNoz3+CrelPEXhcH+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 15:25:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:25:30 +0000
Date: Mon, 29 Sep 2025 10:25:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <simona@ffwll.ch>, <airlied@gmail.com>, <mripard@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <geert@linux-m68k.org>,
 <tomi.valkeinen@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-samsung-soc@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <spice-devel@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 23/25] drm/xe: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <urjqzmhgj2otboptnkgwa3bampqxi362xxtlmbrwf5td3qm3rf@pplm7q755sgg>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-24-tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821081918.79786-24-tzimmermann@suse.de>
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7ce1ba-c1b5-42d1-e603-08ddff6c6cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JgDW+n75dUbON4IcrAM9gXBZeut+NEYdDAKyzZMSOy/a+UAuYmOb+aKsvU?=
 =?iso-8859-1?Q?tCxTC3tEevtR3QvGENanInjPLdTlWNlZcnks8+8Qp5gWnFCg1aY/14KpP1?=
 =?iso-8859-1?Q?4qi4d3SdqCXhs2SuIQ5kUf8ocjlXBi3gGUL3N6VtHgZ3QYyHHHmErPXO9f?=
 =?iso-8859-1?Q?gnwyFOh1aZZHuIVZ+jdZvWrAbQoa4X/M9Gx0268kC2MU+4SGTh6fNmstTq?=
 =?iso-8859-1?Q?yuIZugOJky1ADC4PCtssiCS6JwPmw55y6iVWduEskvnd9iqrTsu1yP0t1t?=
 =?iso-8859-1?Q?Ta4WQOWP6vcEv9zsP1a4fQe3Pu6eXuqkSyAo2Sc5nrUn/+TLN8ZCep9kL6?=
 =?iso-8859-1?Q?Q+9Br37abcU7w1/FWFihWz9YZH+HV6y/3XiCh4RGIiYa/XnhQZ/YhScxv2?=
 =?iso-8859-1?Q?5OvuNee3VvQajgQIrlDgY/yQLkGQNrK3uuXLghItw9ByUbiDwyXJuy/ykW?=
 =?iso-8859-1?Q?8TgF9r/OM17ur2r3p+knOkgFxpnV+/XndLk+9xdpOsNz9s+N0gsdCcNoSK?=
 =?iso-8859-1?Q?saksMVF0xvZYRUnGkkPMOSMo3tRhH6+SI2vhqcxS6hcfu0NEB4vMGuZmYf?=
 =?iso-8859-1?Q?z/TbXTR6VOMLmEmK3mllz5S2EHuY7mOZ7ex4f6VYQfBUWLD5h5LbjkVGZT?=
 =?iso-8859-1?Q?oA/a8HFZaVBgyhhsXAdyEMBm39S70+Cqaepit0axuvwgFeIdE1XkBrcz5a?=
 =?iso-8859-1?Q?RflIi0Ebji0+KsOSssR2H24pqCzwhW5eHXNEZwbPLGll2hpmzOGXoHF3Bz?=
 =?iso-8859-1?Q?Lc79hnyc9etauCvWTuwUoozkWAO44Iwe4+shAQgUNpCCGi7CV+coxseyUo?=
 =?iso-8859-1?Q?ywymFa0LuOTuFCn4goljNp4eMb/zKZnPmrrcu0OvktrQ5qosuafP+K2vmv?=
 =?iso-8859-1?Q?8iPf2rIricA/DwxlAShRF3F/2Fy6jMTWNnh6APdQUe1CJTMsgOhiRcd05e?=
 =?iso-8859-1?Q?YW8bF010UdNqsFwUUKnls+91hJ1i6llKjYn1VH3289GExOOE0gLUW+Xn2L?=
 =?iso-8859-1?Q?ZvT1FDXgQFj5EHUdxItCwyxt5yQA3fMcsaE5KRCnTM4N2j08tfaQo/oLXj?=
 =?iso-8859-1?Q?iKjGRZOOTwL9ZDDHVx8AtciEN5dNNotEUKZgMgB6UKtV7qql8ekeDpV18P?=
 =?iso-8859-1?Q?YXSXhQ5S0XP6e79FHqi+Pmw5pozxkkiomhzHrWcDz/qzEoLKtjyTgYSef8?=
 =?iso-8859-1?Q?S3a1oln1tvHgGho0n0pt1hPT0Lgi+/MCITrpuxS8e9Tozz429RqX6HdTGu?=
 =?iso-8859-1?Q?3zHqfcltAvbghVkwYdlHahSiy8WLYK8OTFwek9I9L+azzGQCSLClQqA5z2?=
 =?iso-8859-1?Q?apDFYN5gHs1R8/gZ4tBt2PrLkECT9zChKzIUcbH2adPfX+8usn45OXLA0e?=
 =?iso-8859-1?Q?WAPi8Ou/7jcUgs6Z3PwR+G/RNscLdUey7h8yOCZJTxdjlVml4iiGxZNxSm?=
 =?iso-8859-1?Q?4vuXK9k/zSmZVsXCJz7YXxG+tP4jZjELxTtG8yyHqeBJD0rs+JcQXGh+I0?=
 =?iso-8859-1?Q?rNuG3CeJO2uNuFBAoulLs8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tf+wSmX7h/PnweaMVgGBvU1wGT0ZB0STuf3BwXg60UfCA3drqBKZRzfS2o?=
 =?iso-8859-1?Q?/ZqyAt8WbVigpR4VfkcYUTV5JH4wmQjVB92GX9SXWnOdvX0yHShHvseWqJ?=
 =?iso-8859-1?Q?eZDiBjN3EnQvVHFuN1lmQZik9qaurcI4cnAmHN7UwET+zC1dYN+2HXw+kN?=
 =?iso-8859-1?Q?jXEQvFnrMgmwyy6xi3lPZ73k1wjUlfMbbCvgoIgfVr/W564ntjQwwWRe9v?=
 =?iso-8859-1?Q?9SfZrG/d253ATx7IpyWYhGRg3uTb+TwBEOFSzEl22OMYITk22ctzjVh+Bm?=
 =?iso-8859-1?Q?ZmtihVqNuZh03gk/k1fqMKCKLbfRrwmbQssAGaXI/ZHufVCNwn+7lmwk0T?=
 =?iso-8859-1?Q?CP9lUSbsgHw1tCLza/3qCGF8b2092Bzlgq+sD3uVfRD9hKAEMSaSW6Fbab?=
 =?iso-8859-1?Q?YZIg6TKncLqE1bwahGeLIKcPJsCoiE5Yg50PikcKh9YkTyPx7mpKz/vJ8H?=
 =?iso-8859-1?Q?oNyK3OObWUrdYNC071IO56fr62hyDlSIaiTjtLTmi5uKhRU8ljuyJ7PL+p?=
 =?iso-8859-1?Q?2RkLhJkCEOtWDU2RdJX6UgjUAsGzAsr2bYznvl/M0gDuGEItNvlZISCO9m?=
 =?iso-8859-1?Q?g5C2rMxSORI3gzgrwgFS9EzItU3VCJcqlr9hDrmJuxoAbk1nSAOvF6fluf?=
 =?iso-8859-1?Q?LAqrEqRdh2HXRC5fTtwfdCmfydp/hO0Yre55Vbww4HojqLu+EHq2WYmUd7?=
 =?iso-8859-1?Q?Qp9c3CoItHfMRMNTfx4O7qO0yi9wimzMAg+R+BmUzmcMQH3Q6MkTr1ayY8?=
 =?iso-8859-1?Q?F8baLI3Zgsj09YIuLO7JCFoxBR9ERxUYi81gE86u2y/jICQeUZbzTwQMGt?=
 =?iso-8859-1?Q?IakF75T0fSagXPQhtVPJwKb+xUlTGNcGGWvGqRgzUTkG/9wIRT5v4QVc98?=
 =?iso-8859-1?Q?SqGxkfewdurHzRIATCiyDv8BlEBusHKEdpX+gY24BZslMJ1YVDWeMkzPDS?=
 =?iso-8859-1?Q?rxBLSQIQ8j3eGiTGDVbqjOzFg8Q1x5cdpIIGYkoo5uUmx5onN623haWiGU?=
 =?iso-8859-1?Q?fSaSkyGTNbRaTHpSj+N+RhvNy4EV1KPhvvwpLVInZekMy4qTpf5ubCmtoj?=
 =?iso-8859-1?Q?5pwOeO5g7k1MAPL/a2rgceK8LoBbN8h7f3NExpmKEjbKu1FiG8uEQ+BMrq?=
 =?iso-8859-1?Q?QiqC8BZNY/+sowidrZ6lROpaxzecQ/h2vkSTDbFWqxZFfmn/zBNgevm6r9?=
 =?iso-8859-1?Q?gDnSYU8NChMM3/5O8rCs4XjqNgoZ9KIXeEs9SyPnjHPVP7yxOsySAO+dU8?=
 =?iso-8859-1?Q?S5qZsL+o3i71xBVpWiILJ0WVOLHghYmdKrvx6MsFWa7yBHyTPrTHh341cw?=
 =?iso-8859-1?Q?M7qCAORFBYr7Af5aAE0uKr9GGokIm9AYeZzpPKwX43CvrDLJEGIns1TzRU?=
 =?iso-8859-1?Q?+Qz5LXGuRr5O9V09fGEAIZZtS7YH0Qi6eWccHvSIeCEtCIqcov7bkMzq8H?=
 =?iso-8859-1?Q?KddXqiHCb+6Rf7yZqvmWQ11P44fhmrrtnnlZiW40JoFSLA2Qh9pFy9cyUq?=
 =?iso-8859-1?Q?z9B1ojp3dThQaNxhHdzpG7gbcdQT1tPzpH+C7Gkc3UHxQBo0zuTEyIWFpi?=
 =?iso-8859-1?Q?39Xm8PFGxEcvySM/nnU4Y3W2CrbOeb0yURH1IAPAZKBi41k9iv+GSveqDc?=
 =?iso-8859-1?Q?jEs7O4tDnTQqR/7eh3t+Ml3LB7BiINHuWC4QScIjbJNUeNzjTVfwJ1cg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7ce1ba-c1b5-42d1-e603-08ddff6c6cdd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 15:25:30.8021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZARfbdpVMrNRufPMp0vxzwZrI+oykbORRY+0kxlNZv8Erp/UhQ4BBo4LgIufw57mOjduLFIUfwUc6K6PQD0eQggml19NKcmIrHLZQXWOZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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

On Thu, Aug 21, 2025 at 10:17:30AM +0200, Thomas Zimmermann wrote:
>Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
>and buffer size. Align the pitch to a multiple of 8. Align the
>buffer size according to hardware requirements.
>
>Xe's internal calculation allowed for 64-bit wide buffer sizes, but
>the ioctl's internal checks always verified against 32-bit wide limits.
>Hance, it is safe to limit the driver code to 32-bit calculations as
>well.
>
>v3:
>- mention 32-bit calculation in commit description (Matthew)
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

to merge this via drm-misc.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 6fea39842e1e..2be7a618165a 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -9,6 +9,7 @@
> #include <linux/nospec.h>
>
> #include <drm/drm_drv.h>
>+#include <drm/drm_dumb_buffers.h>
> #include <drm/drm_gem_ttm_helper.h>
> #include <drm/drm_managed.h>
> #include <drm/ttm/ttm_backup.h>
>@@ -3130,14 +3131,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
> 	struct xe_device *xe = to_xe_device(dev);
> 	struct xe_bo *bo;
> 	uint32_t handle;
>-	int cpp = DIV_ROUND_UP(args->bpp, 8);
> 	int err;
> 	u32 page_size = max_t(u32, PAGE_SIZE,
> 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>
>-	args->pitch = ALIGN(args->width * cpp, 64);
>-	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>-			   page_size);
>+	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
>+	if (err)
>+		return err;
>
> 	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
> 			       DRM_XE_GEM_CPU_CACHING_WC,
>-- 
>2.50.1
>
