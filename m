Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D509CF5A1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 21:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8610E8B0;
	Fri, 15 Nov 2024 20:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWoBytcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAC510E8B0;
 Fri, 15 Nov 2024 20:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731701939; x=1763237939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XMAdYvL5g+WjLdtIukU6pbaYaNMXLMUdajzsAVl/BzE=;
 b=AWoBytcUZ/L7SY7lYNapYyxzqL1BMkQeOXIpm7Q4FRQZvjF3J8turfAx
 +tkcv4UnzJhib8Z9GRWnC2n9v8CwlRgD3PB5lWIz7JFZXiwRKWzO2K+Zx
 aQa6wKiTumUOS+fFCLTF+7u6KZZx730nXATYGf7B9RvM7QeVDrWjPL3tM
 IqFGdqpx1onNQnlRMlrt3GOLQrbfW9bPpEs4iU3jYZDKq+GXHktJUkd91
 BSk70gL0F6sbZihFo/UT8hcUXzH2uXYb/jPNOL1s9+KGkiRG8AZdWI2J1
 E7ojaTYnTqKpedrHfu9r1CAJZoafbksLmhGwOQ/BycTGcWSFKilxSrVgX g==;
X-CSE-ConnectionGUID: 3kfkrcw9TnCNWcjqwDiQPw==
X-CSE-MsgGUID: jRMEvzWkRMaN+oO7GAaCJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="43117673"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="43117673"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:18:59 -0800
X-CSE-ConnectionGUID: bckLTTVRQqGnxlhZ4SU6mw==
X-CSE-MsgGUID: vju/y61YSv6CB8SEIJx9Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88823208"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 12:18:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:18:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 12:18:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 12:18:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut3GMWxfenFanjLsEkcijIJ5rau0CQMLihMKnoTVBWL+RrHHWEmadnGMNKl27SqwSnZ5REPPhvMpZswOomcPEFddrX+Y0EPhYM+txTiL8aAIW0tjCouJ7ESPmg329ofk/Imdl2WCuowQx26TEWLD3R1/vxm5uB+xyUhUKXgOC9qqyiZ3l01DApSmXSr6GZsa57W87a9d0EmbvUiD85xtk/mGQUDUqmDNetreekD8KfLJ2JG3P11FdIZ8i4wZiTs++5HgV3AOGr5+EvKvbZmKtOOGNLJv25PraG+MAqDuwUbRedh4ViyeAltugVfwR3bbKK7oJXRC43CJlmt6a3eypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY4vBHQbCh/91KMtzaCyeS2E0f1E4s2dDoY2p/I0X7E=;
 b=qPP3tNlk80vaHpCgtroVekqaqFgyXLPCWPwHn2lPwhefIGvE0wBBi8P/SUxlBVQpKkMim4XGW3vFo1LhtxUUCmsr31MBcLpdG8DB6Ri2Sn16WKCrsqjyGccTM5hU1wOkE0RWD6u4VFzDzWaGyVnq2ZUu0S+P37UN0m+uDwWYyOcLSrFrjbsLapGAsYDhXAVgI4FsMahFbLPPYezXnjOW5k9Y2Ax03bPnnMoZ5dC7y0kbXLAWRc8E581rH1bcop9TLTBQBejZDOvy7NmhwydAJhBlwN67QwJbrpniW81aV2TpiKSJH8AEjnyIdjIWERYe4LLraHXGnnWh4B3FVFSs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 20:18:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 20:18:56 +0000
Date: Fri, 15 Nov 2024 15:18:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Zzesq5O0twGP8P96@intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <20241115164159.1081675-2-imre.deak@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115164159.1081675-2-imre.deak@intel.com>
X-ClientProxiedBy: MW4PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:303:83::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: c0644053-97f9-40f8-aef7-08dd05b2ba5b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m2zDpIG/fLuKswZBqU8oKC3SIkrmqno/hf6l6NJHcXHiOq3tRkic/OmRYJnX?=
 =?us-ascii?Q?5gu7eRBMTzUEqv16AhMnRV3lJJK9fB6vG6aEKJWvb7OHt+1CVn/NpL5sCiae?=
 =?us-ascii?Q?7hMMryGpzs+loQ8M4l5mKg3Et+VGZmCFxWdoNVuweqPRY+//HGfWdEXLPylh?=
 =?us-ascii?Q?jG6RfQChErL5Zn0EZETOVvJ56AXbkbPmDcLkzrVwchBBjvA6UUb5/NX7TBIq?=
 =?us-ascii?Q?jyiAxK17ASMjicQNQpkhE1/oyhOlYVtgeTC8/NG8iu1B0SEF1VlRUM4dB6Xv?=
 =?us-ascii?Q?6JOHecmvWN7GQsYd1zjf6ghNft5fD3uKStOIuTShZ5Jw+4iYb46A9AEXcWK2?=
 =?us-ascii?Q?QvWAu1WU99pZ3B9QCptgRWNcfb8+iTeQYk81zSvRWm1L6HR5RpTYy9u8LjuE?=
 =?us-ascii?Q?lMjGk2yybjBEcvj4kJyHQnCILgu5BUSjuOFY0Yf48syK4SDrC3eKaLFf0HNJ?=
 =?us-ascii?Q?xG9G1fZwJViokRVwozTnfIDMGmNajacFQ2MmW3M0CQCC/HMzEZas7VJBlOaw?=
 =?us-ascii?Q?XLXNS8DF29H6gPMM2ZLhLm/Q1HXENObppox2LVbcpT+eNANqRr7Y3aDwC+qr?=
 =?us-ascii?Q?9/0VUF7z1xQn13ZoULO4Hno2uoN9Ee532OgPtSRqGjLPJ2GkQDhAgizYqO0E?=
 =?us-ascii?Q?/0mV8V+cCn/mcLsQQY/JHPu9zHTQWnkV9E8+oto5PUv4wuhEAsMOjMyvY4Zz?=
 =?us-ascii?Q?XNA5j2jMgR7q/lCw0pwz7B9aCYowrSxo6vygl9w4jjH3sALrUkUOIMJMRKeT?=
 =?us-ascii?Q?05zMprCjnb5DJVz/QfdlGKddEymCVwDHRWAvQYCWywbEeF6zVT0KHXx6Ww81?=
 =?us-ascii?Q?KXYX4TmAvEMmfVJZ7scoosw4W9tXOwBJXSOm99Hlls5UByE4ncND35syOHwC?=
 =?us-ascii?Q?nTlvqGOo35an8/MYgbQ9yuwO5yyIY1oYw79w2sqG8bWe3q6bPfHFN5TPAGV/?=
 =?us-ascii?Q?oMHBZOGzJCloww045wlLu46eX6j53Js5SLpF7ZBPvLIX97W64Nd1d4BicCij?=
 =?us-ascii?Q?KXMoow85HerKu6KaSnANQVwiPYqvpLx5QNpTJiHjYg6wYuUfoXLXXyWVqLDb?=
 =?us-ascii?Q?rvI/JVXuyFdqp78MzpsNh00yFbWArlfdpL3XBgBN8Qx4avqo0ittJSKmGVGW?=
 =?us-ascii?Q?OZD70b2aigYDNRSR3GXNDdTWmMegh3h6M6Z1FEZ9cvnNIjov0+rEDYbb44t0?=
 =?us-ascii?Q?KTn3hA7bacsq89prI3Pjrva0QwcE7sAbwRqMKAqDcNyba8NjWSe+7uZXkqRv?=
 =?us-ascii?Q?eyyNPsFfqjUxAC1MAs9sUFEq69LgIWGEn0vsTCnOFHh6PSpIIEDMJxvH2vB/?=
 =?us-ascii?Q?nRT/lIsppbywrXm2JB8e/kW4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7V8Tqdnad5FIZmY83srUyl8YwhJ4zvlKzSEUhv+m7xOcHcyNMssww/DhtfI?=
 =?us-ascii?Q?NXHCn2s9st1Fp6MZdRjaQ0/5eQLIdSOiAGfyiEBlrKDu2sNOOvPb7SeOIUbD?=
 =?us-ascii?Q?P/65KaNzu5lx6X9cRZKylnZBqjTHBFv5xX1ewQ+MnKh3TpwSQgqbnHAwnRf8?=
 =?us-ascii?Q?AFAm6GVjlyGhrruaEoC4NRwSHRn/jZ9Z9LUdGhiyRUMQGHcUICDhcKKioi09?=
 =?us-ascii?Q?6mZ1qvVHrk1gWhdbJdvuxCQx83lqa/d37d2KzIfZbk79p/UFQTTy51S+zhQI?=
 =?us-ascii?Q?uEEtA4lHPlWqLL5OVW8CAPI9M9DWgurIV6p9UWa1uGqFw5yZ1dBu8pdo8xBx?=
 =?us-ascii?Q?25MvlgZD4LcdIson+Fmb03qDqanJYMY40c8GxuNvCSDx5tKloy8L3p+xvRIc?=
 =?us-ascii?Q?a45W+w6uP4kjHeyXAL3VZdwtGgsHlDNfbiK/qO3LvfwannAmmzEPQTae2Of4?=
 =?us-ascii?Q?I1JP3g3apAAYJM8hEGk8g4ZkjoP6UGlIoO72VNm4yambh69r8YTlb2+4S6bf?=
 =?us-ascii?Q?owHrpJm5l/LV+Fu7c5sbkaHMxZ6EMqxyvlN3b4q/4n5u9l5Ze/FWajGLOLdk?=
 =?us-ascii?Q?P8D9rKUrisDh3fqZiPivw3/tnx5CemXd2MmGiG9lUmTAgNcqUv6a7SfJm4Hb?=
 =?us-ascii?Q?AsM31cYzTJ/HsKO225lHsNw4vnenhrawFji85ZJXeYoKvzlO8QrfbpB5W1if?=
 =?us-ascii?Q?ZFh4bcNk3kTPx6R4pb+9twL6jgtd5kf0QSBP+KrUapJhljx+h8y8gw+sx6CQ?=
 =?us-ascii?Q?cr2z5GPJyzeoqnwBch3Cp2cWcs5EIZ39sR9ZUuenkrB5iptzTeyFJSUUJz5z?=
 =?us-ascii?Q?XwaN6FtT7bXwTODPXeC+hUKvZnq6dMOqvvKW0KYx6aP/aMzq+K6zhQkkTWak?=
 =?us-ascii?Q?GAI35rUBCccHZM2RaVi2h+7z28oT6Pot7TWexPA+TK5nRtCQ7sRL539P0l6L?=
 =?us-ascii?Q?U7wiU5YIJjSkDsSA0IzMSBJMfbftU5a2uZHaqFLeLdEFP9O616Jjbt33oSSp?=
 =?us-ascii?Q?L56AlvcrLhac9pcSR18V0xDdevwYMLCFIessA31V1dSEbsoAo4eAw/sz4xQ2?=
 =?us-ascii?Q?jxH5MtvjNDliiSYH9+RzZnir7dtWnIVHnIv+rFSOs/zn07/AIsW/KYbKffi1?=
 =?us-ascii?Q?Ufe4aohMUdIPFjoiTFzpMGnYMS3qFqp5zaSwE6/MJThYXq1lfBoi9K9eAMag?=
 =?us-ascii?Q?UBnsedQ09YY5lI6OdT0y3WDUVTUctzC4IoAAtI1Tf31C8LR5XCkLYkSer3nC?=
 =?us-ascii?Q?aHw6AGw6mQJgdCuXvGDyOBBKjLfMrNt4IuogH8klMx4KNz/Z6XYDT0RqkfIn?=
 =?us-ascii?Q?dlciS2DbXd79XmrwrvBjGD4lafvxjQl7PD/zCiqqlttEb629iegGjaGYZ5yB?=
 =?us-ascii?Q?dtegGaq7eXxHNeExZo0Hp4DEsHYa/BAbU8ONXhEXldpo9ceQHQTh288BxsIf?=
 =?us-ascii?Q?AYjU+iK8II/SBsYUD7GPYTH5nSFiz1xyYfvuFFKzS7p00RI2Jrh9jjrDjr0n?=
 =?us-ascii?Q?3ywlbka9KqhO4bfXNffa/425+W5lhQ8NPtpK7sCv1lJaZ8N5JSi+kf8C7Dm5?=
 =?us-ascii?Q?4xVrZbNsJbkhvjTHbg46xHikSUHdEDoMnY7dNhy0aEL3CmCwaAgXh4OADwj/?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0644053-97f9-40f8-aef7-08dd05b2ba5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:18:55.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3b+m2bKIK+barMkKBvhLPEKLTl81uo5ty0B64ZlAm38C4/GoafRXZw7O7UTYl60Iqj0vNEybx7KEG4amLNpYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
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

On Fri, Nov 15, 2024 at 06:41:57PM +0200, Imre Deak wrote:
> Atm when the connector is added to the drm_mode_config::connector_list,
> the connector may not be fully initialized yet. This is not a problem
> for user space, which will see the connector only after it's registered
> later, it could be a problem for in-kernel users looking up connectors
> via the above list.
> 
> To resolve the above issue, add a way to separately initialize the DRM
> core specific parts of the connector and add it to the above list. This
> will move adding the connector to the list after the properties on the
> connector have been added, this is ok since these steps don't have a
> dependency.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 103 ++++++++++++++++++++++++++------
>  include/drm/drm_connector.h     |   5 ++
>  2 files changed, 91 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849e..6132a7917b20c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -218,11 +218,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
>  	}
>  }
>  
> -static int __drm_connector_init(struct drm_device *dev,
> -				struct drm_connector *connector,
> -				const struct drm_connector_funcs *funcs,
> -				int connector_type,
> -				struct i2c_adapter *ddc)
> +static int __drm_connector_init_core(struct drm_device *dev,
> +				     struct drm_connector *connector,
> +				     const struct drm_connector_funcs *funcs,
> +				     int connector_type,
> +				     struct i2c_adapter *ddc)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int ret;
> @@ -273,6 +273,7 @@ static int __drm_connector_init(struct drm_device *dev,
>  	/* provide ddc symlink in sysfs */
>  	connector->ddc = ddc;
>  
> +	INIT_LIST_HEAD(&connector->head);
>  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
> @@ -288,14 +289,6 @@ static int __drm_connector_init(struct drm_device *dev,
>  
>  	drm_connector_get_cmdline_mode(connector);
>  
> -	/* We should add connectors at the end to avoid upsetting the connector
> -	 * index too much.
> -	 */
> -	spin_lock_irq(&config->connector_list_lock);
> -	list_add_tail(&connector->head, &config->connector_list);
> -	config->num_connector++;
> -	spin_unlock_irq(&config->connector_list_lock);
> -
>  	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
>  	    connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>  		drm_connector_attach_edid_property(connector);
> @@ -332,6 +325,84 @@ static int __drm_connector_init(struct drm_device *dev,
>  	return ret;
>  }
>  
> +/**
> + * drm_connector_init_core - Initialize the core state of a preallocated connector
> + * @dev: DRM device
> + * @connector: the connector to init
> + * @funcs: callbacks for this connector
> + * @connector_type: user visible type of the connector
> + *
> + * Initialises the core state of preallocated connector. This is
> + * equivalent to drm_connector_init(), without adding the connector to
> + * drm_mode_config::connector_list. This call must be followed by calling
> + * drm_connector_add() during initialization to expose the connector to
> + * in-kernel users via the above list.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_connector_init_core(struct drm_device *dev,
> +			    struct drm_connector *connector,
> +			    const struct drm_connector_funcs *funcs,
> +			    int connector_type)
> +{
> +	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
> +		return -EINVAL;
> +
> +	return __drm_connector_init_core(dev, connector, funcs, connector_type, NULL);
> +}
> +EXPORT_SYMBOL(drm_connector_init_core);
> +
> +/**
> + * drm_connector_add - Add the connector
> + * @connector: the connector to add
> + *
> + * Add the connector to the drm_mode_config::connector_list, exposing the
> + * connector to in-kernel users. This call must be preceded by a call to
> + * drm_connector_init_core().
> + */
> +void drm_connector_add(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	spin_lock_irq(&config->connector_list_lock);
> +	list_add_tail(&connector->head, &config->connector_list);
> +	config->num_connector++;
> +	spin_unlock_irq(&config->connector_list_lock);
> +}
> +EXPORT_SYMBOL(drm_connector_add);
> +
> +static void drm_connector_remove(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +
> +	if (list_empty(&connector->head))
> +		return;
> +
> +	spin_lock_irq(&dev->mode_config.connector_list_lock);
> +	list_del_init(&connector->head);
> +	dev->mode_config.num_connector--;
> +	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> +}
> +
> +static int __drm_connector_init(struct drm_device *dev,
> +				struct drm_connector *connector,
> +				const struct drm_connector_funcs *funcs,
> +				int connector_type,
> +				struct i2c_adapter *ddc)
> +{
> +	int ret;
> +
> +	ret = __drm_connector_init_core(dev, connector, funcs, connector_type, ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_add(connector);
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_connector_init - Init a preallocated connector
>   * @dev: DRM device
> @@ -659,10 +730,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  	connector->name = NULL;
>  	fwnode_handle_put(connector->fwnode);
>  	connector->fwnode = NULL;
> -	spin_lock_irq(&dev->mode_config.connector_list_lock);
> -	list_del(&connector->head);
> -	dev->mode_config.num_connector--;
> -	spin_unlock_irq(&dev->mode_config.connector_list_lock);
> +
> +	drm_connector_remove(connector);
>  
>  	WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
>  	if (connector->state && connector->funcs->atomic_destroy_state)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e3fa43291f449..8e8d130b40f98 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2122,6 +2122,11 @@ struct drm_connector {
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>  
> +int drm_connector_init_core(struct drm_device *dev,
> +			    struct drm_connector *connector,
> +			    const struct drm_connector_funcs *funcs,
> +			    int connector_type);
> +void drm_connector_add(struct drm_connector *connector);
>  int drm_connector_init(struct drm_device *dev,
>  		       struct drm_connector *connector,
>  		       const struct drm_connector_funcs *funcs,
> -- 
> 2.44.2
> 
