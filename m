Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B08A158EE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 22:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA68010E261;
	Fri, 17 Jan 2025 21:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AN9WGb2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393510E066;
 Fri, 17 Jan 2025 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737148819; x=1768684819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4veNdnh003V0YJC2H8sVwl0lBoX8aacgNvS+/Tm8sS8=;
 b=AN9WGb2qejP8jeEls+9xF9ROJBVhIfU+HlTuZCbGFZJyHT85OoB+B6bD
 XZlpjjysJim0ihVjYUtc1srCxKvtKwvBPP50iIkXyjv1FMjHH4s5uMSiU
 g5QaQlP8qdvMlQczcln5yE7i39PtQIXfQa1Kjsj8bHlwE62axbbXSsKm9
 gQynZUs/VqLkkDTYOo9AuuvEwplGSKAqHQTtO1CZoVaB1tiSq+NvIRGt9
 DGPm11v8VP3xXupgEcvvp2rMCSGIfRX3OeU7tQFXDoJGLULoI0S1hnUR4
 7f9MDxt8xt0Va6VJMEXv9ySAw+5ydxv5fO+cRCVrhlBZg60yilP65K1OT w==;
X-CSE-ConnectionGUID: nTVIcbgfS6SAAipN16s/LQ==
X-CSE-MsgGUID: 2DE8Jj42QMCcufu0vBa/hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="60067618"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="60067618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 13:20:18 -0800
X-CSE-ConnectionGUID: TwNg0cH7TLOJITshY/zEWw==
X-CSE-MsgGUID: nAKeDssSRUCpshGfj9I/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="105950201"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 13:20:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 13:20:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 13:20:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 13:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHJcDw6e6WZAnA9GDijPYzNx02p26choQPeTXE3K96J6Nw/5XOKlXf0l99ki9No1OspwlnVTMPzN3WfKD1X3wFxSmZ5hfZW1hPHKra1QTxj4eoX2s8nlhLms1I3l4Y76WL3+UhtDW20uhq16Nsj9frP3qubSR+qnRB6UaqHNIgipcv5CYWplWcEnYH90WjdwfONZhnrAf/gvTv9Wuosm70tAdCTo6LvWdfTM3bHzhyDsbSgBP/OBJMjusivdVxY04QCIOI33+fCVw4+NXRRPhUR3vBqdl36z0bkqD1CX5BtCiketWJxJO2/oeeCyPbThHfjHCfxrJGW8+DDknsuxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoXAQw1i+VY7sGgtVRjHufAhnrexIuXaV8QR2+S9dzk=;
 b=UxbGJ1/Po/ndXWiTn6dvLIXhI/KtUtpdU8zV6k/mERIZQoNyiNp5q1jxsRDSbK7E5kuoQohpGJJPsH3Qf8KmLzyxLFwGNH1pc98yIa0DQwf4VzBogqyVLVE+/nO9yLxLY3f0EGvR4fHwzuRmZDn9LCeN8r037MlJYifpXjzcYF9sGJzk5TFECPKYs9axBzrM4EE7XmlXK2z/f6aZ6RADcl6AlSheJq8CO4DLlkNUfLyS51NZzncIl/ZO3biVcku7eL7XlawzCg+RwFDbfTd8xVg9D+84IK27kJDYJ0E6fYjMnH6YDq4l54tGgkllSwZT2i2KDaK4GUvJdo5lstiTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 21:20:15 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 21:20:15 +0000
Date: Fri, 17 Jan 2025 16:20:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v3] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z4rJi3eoUCCJTTvs@intel.com>
References: <20250117202414.714469-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250117202414.714469-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0239.namprd04.prod.outlook.com
 (2603:10b6:303:87::34) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d3d760-417e-47a9-391b-08dd373cbc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G/8ym4nG2OUZTcl1hIgdsGfcrfXYLJZ11B16eMmu5/esuDDvn9iE8/+syyBg?=
 =?us-ascii?Q?4V+3dbGUi96aEdArZQSxMiSBReDZ3ff9fDkeLkKekvFWhxJzPEiT5eD5X/Tf?=
 =?us-ascii?Q?V/i3boy8UUYuDchfKoqJys+ISSx+0KEtgDDMh68B58GDHGji9iu+t9EV9DRm?=
 =?us-ascii?Q?89ts0WY/3PgmCN6U6i6fOausyJSAea8dtpqh6bxO0ODtRIk/g9HZyoD/y25a?=
 =?us-ascii?Q?sBqYwvvHqJBmUlBBYuz6gcehHlTX22Cx1io/eCwxjwEXkcWUs2L0k+c7bp/M?=
 =?us-ascii?Q?DIkJHhxi4e4rTzdTAtAAL84Ml9hcn7OpK8u80A8Dz3DgAqqC71Beo6chogik?=
 =?us-ascii?Q?1DzA8n8nwv00VHVjGM3vlxVfgLKfU7icchxlOXmM17j/OXSZhoLWGCKk7jCA?=
 =?us-ascii?Q?ljWXv/G17tpmFliqYn95ApQXkO9x1Nq0dFKPBD9yv7UM+neR2yU39xqkHNyY?=
 =?us-ascii?Q?9lNekMqgasr1kG10nWx//7nIDTwcSoiTJR9fRZeX6IQexSWK42iQanVSm421?=
 =?us-ascii?Q?qQzSjXRt2Ob852s8TlgOpNAUZhCcF2hCaoisWvMkcBufamqUWUZ6DisBTbie?=
 =?us-ascii?Q?8exwiLM7mtgcW3BWlxdoOPJndVi87jQzyHRt6bzbuCQIUzbYMO+Y5vvwu4Iq?=
 =?us-ascii?Q?jHXPKB/e0Qw6m7LHSLlwBzrIwfvZNDVBKAFRX9JHsTA7YzNZR4wQaBUuxvgT?=
 =?us-ascii?Q?M7ZOWw60Q6wC1NjnqbtCOVtSBuB/7pc6cNd3kXo31WPlZLPmWxOUnH1wsHbD?=
 =?us-ascii?Q?1WjZT4RHmv1Mc6dZxEtYhZwNcuWj7jLGbLEPkfRU6rHerNNTeypkyGeikmXu?=
 =?us-ascii?Q?ZWREjaiFE3x4A0yGUerM/pAB4QSHJGIvdhlfyfySVdUBV0/mjUHupF3P85YG?=
 =?us-ascii?Q?DnjD2X73nAGgKMAT98HNYda18yCCTtprhg+rrNR7/f0GCwipDbeYpn5doCEO?=
 =?us-ascii?Q?YzSlq2X4wFXBKWxOqUJcH/x2g8d5E5p1/pHBWeX45zW6nBavlqFodKHNN829?=
 =?us-ascii?Q?9gFTXal2RDMG1raJDd1Y74K1+XvKzwAe0/dQs8ac3LkxTXEmOnomHC3Y43TV?=
 =?us-ascii?Q?/TXydaFAcGVif0BtQJ/n+mJcrzjdMc/Xo9AP5S/NhwmWvrG6P7V3mC6tFupO?=
 =?us-ascii?Q?G4zhb0ecAmg1H0OFtQeMdtLVRWsPpop4kNaoTKCuxg0DZMs+eNpIszm2o9Sk?=
 =?us-ascii?Q?WWmrxU9V8zKuuYSCAVae3KdZosV8qCPgM94nn2FkxOFB9d1nNAaRovieMggA?=
 =?us-ascii?Q?jVZL0MVgpSqkoUqVbF7O8E1Jsdem6I+FSgU8H3AXuB7V+2c8I4SrTMu9u0jz?=
 =?us-ascii?Q?rv3oJCyl2kRrw/ZZJUYkL4ScylubnpDIbSCGYKvlrYsYTsq6PY03JLRZL4zX?=
 =?us-ascii?Q?YWF8QqIAwH6EnLoSmdJ3n1r9jU7B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8M8S2uMewDxVCyWDkjMtW1cUox7F3lYj257lr9G55hiCODPkFDT3f9zp2480?=
 =?us-ascii?Q?+jTLxrOijdcTD/RR8/cRZpQm79Rks3e38CFwe91MIWe6M6n56FM+qNqyfI6B?=
 =?us-ascii?Q?OpY8BE5Dtr2XrNzu/+cRnG88RF7ZnVLTftmr6b1F1b8DtNNsguSjhA56WyqC?=
 =?us-ascii?Q?GbqOdyQtLZMqAdNUMZr4TZkaRgNwZY2y9lSvrXk0qfsvTmKrnr90d//mRN1m?=
 =?us-ascii?Q?DLrd3uoeFpr2BE7MSFAatufEjHCQW4uFN2KKYsuS0ijYMETHXmlvJn9jjOmY?=
 =?us-ascii?Q?VMTXALgezSqeFGqjQCUFkfuoVRqHgrljrfXm2NlY4claKKq6OYnM9HBTHh3f?=
 =?us-ascii?Q?KzE92gb3DytAGPaBlxEqixyt3Vs34wTSK8gWvUGh6ZgQDb0lYXzLYIA7MznD?=
 =?us-ascii?Q?Rf2sVjRYJ6wj0dzMWqEjbFXMaw+arCuh2fjn7KdgGXckXRhAroX/ALM1Bf3q?=
 =?us-ascii?Q?qRbBJieYXkTHQPRlzRrCO/hKVLV0BBZiHHQPnu+ERgdZgzYEiFD5xC729c+e?=
 =?us-ascii?Q?RYcYyuGcM8L+gDo45cD+Ocjdro0Rl+fOCvdFapEKA9Q4YseB6EnEMk64sfdQ?=
 =?us-ascii?Q?gSdz370xLrWWJ47IwNSnEo2V2gDmma6IkpsKwB5OzpT+8shGlLsiMRvRbGI6?=
 =?us-ascii?Q?iOiZAgNMO5WPaj/2jCeGL1+UDEqqW1fFeeWEgY5Y9xH9vBdQOoNjU0RbHNO8?=
 =?us-ascii?Q?+hKWX14JBlY61KO9dptap6r/yuBQtncy6FqexdAfg74WhpLfwVnjAD8NrqSJ?=
 =?us-ascii?Q?5zbPbatc5FP6qr5c+HSwr6fJuk/iqyI6qJP8pMj8oPe8W1zuJCluwgg70Z/T?=
 =?us-ascii?Q?9kUs0el5CTPX1/ceOyh4w08MY4550TuYmS0jpLTULWPg6KIpaMQLYeUOwdwY?=
 =?us-ascii?Q?owpt/I8z1p4g+qauCpU9zUVuCpELhayjwy0li0V8puIRpDoKFXrFbVEHjPn3?=
 =?us-ascii?Q?ozmKKz/dXuVwovJHOpK6RsKjEtK/4Oa/G8k1t/09WPBj19ksPcvvsmh5Gp6U?=
 =?us-ascii?Q?ROd+s+dt41uHR/Ba6/7hx4AFDHxGyjz02scfYkD9YY2m2tVLkN/holrZYrYC?=
 =?us-ascii?Q?GurUxY554Gb/UgZ6MHo2rTWyJ8L6rWtDiqbBOPAh7FaBLGneddDyQNTUsqai?=
 =?us-ascii?Q?fAyPhJLcRY5EEN12nVAwKzwcYpQ5eTYNyEclFM6jYcHNZ9thpyTnZb5DGhHO?=
 =?us-ascii?Q?D6TG8s9j91s2m2+VdWzaxm1E6vI2P4WuOBz7bMSFwWRhGSgaYZptD6inHasg?=
 =?us-ascii?Q?CUFoJ7QkVjqkvd5z9nLrYk0fFGU+T1YitYSkRxYkqDq8uv0rZll7G1Yv+r+F?=
 =?us-ascii?Q?PYOSpFyzJvwVK9Jw0a2S2J+Z6iW1Z/VcxJ5VLMRl91NjmqTWqTZzXgj4M69M?=
 =?us-ascii?Q?xbU7kk7NUt7OI0wPYAg4UFvZ1wEvVlB6y6TuICw4lgH8XipIDGPLvDP/u6ws?=
 =?us-ascii?Q?pSVz8ypuR+2VmruZZcs5UJdoAjYK3ph8pzAh8J4Ettsqf3P4G5N8L1eVhi/F?=
 =?us-ascii?Q?R24W+hr7QWfoh8DS+NHctQJNyXDlz2ReT+0R14BbxEDLdE+/vc+7SrvB8Qc2?=
 =?us-ascii?Q?8BF2iGFXLPYfOMsCdpvFzqw6vqr7OKF7YJgeJKFdQH7awLDdC3GOE00zuMb+?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d3d760-417e-47a9-391b-08dd373cbc00
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 21:20:15.0559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqWBgE/3VNgm4+C6NYyO2oB9EjbLNKnkH/Qh96BncmnYqkJlkl3uQUlEyDkCzZGo4L2eXrX04KmyDTtLbM9HGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

On Fri, Jan 17, 2025 at 12:24:14PM -0800, Vinay Belgaumkar wrote:
> Default SLPC power profile is Base(0). Power Saving mode(1)
> has conservative up/down thresholds and is suitable for use with
> apps that typically need to be power efficient.
> 
> Selected power profile will be displayed in this format-
> 
> $ cat slpc_power_profile
> 
>   [base]    power_saving
> 
> $ echo power_saving > slpc_power_profile
> $ cat slpc_power_profile
> 
>   base    [power_saving]
> 
> v2: Disable waitboost in power saving profile, update sysfs
> format and add some kernel doc for SLPC (Rodrigo)
> 
> v3: Update doc with info about power profiles (Rodrigo)
> 
> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 47 +++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++
>  .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 66 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>  .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +
>  6 files changed, 126 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index d7784650e4d9..83a7cc7dfbc8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -464,6 +464,45 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>  	return err ?: count;
>  }
>  
> +static ssize_t slpc_power_profile_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +
> +	switch (slpc->power_profile) {
> +	case SLPC_POWER_PROFILES_BASE:
> +		return sysfs_emit(buff, "[%s]    %s\n", "base", "power_saving");
> +	case SLPC_POWER_PROFILES_POWER_SAVING:
> +		return sysfs_emit(buff, "%s    [%s]\n", "base", "power_saving");
> +	}
> +
> +	return sysfs_emit(buff, "%u\n", slpc->power_profile);
> +}
> +
> +static ssize_t slpc_power_profile_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	char power_saving[] = "power_saving";
> +	char base[] = "base";
> +	int err;
> +	u32 val;
> +
> +	if (!strncmp(buff, power_saving, sizeof(power_saving) - 1))
> +		val = SLPC_POWER_PROFILES_POWER_SAVING;
> +	else if (!strncmp(buff, base, sizeof(base) - 1))
> +		val = SLPC_POWER_PROFILES_BASE;
> +	else
> +		return -EINVAL;
> +
> +	err = intel_guc_slpc_set_power_profile(slpc, val);
> +	return err ?: count;
> +}
> +
>  struct intel_gt_bool_throttle_attr {
>  	struct attribute attr;
>  	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> @@ -668,6 +707,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
>  INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
>  
>  INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
> +INTEL_GT_ATTR_RW(slpc_power_profile);
>  
>  static const struct attribute *media_perf_power_attrs[] = {
>  	&attr_media_freq_factor.attr,
> @@ -864,6 +904,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>  			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
>  	}
>  
> +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
> +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
> +		if (ret)
> +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
> +				    ERR_PTR(ret));
> +	}
> +
>  	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
>  		ret = sysfs_create_files(kobj, throttle_reason_attrs);
>  		if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fa304ea088e4..2cfaedb04876 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1025,6 +1025,10 @@ void intel_rps_boost(struct i915_request *rq)
>  		if (rps_uses_slpc(rps)) {
>  			slpc = rps_to_slpc(rps);
>  
> +			/* Waitboost should not be done with power saving profile */
> +			if (slpc->power_profile == SLPC_POWER_PROFILES_POWER_SAVING)
> +				return;
> +
>  			if (slpc->min_freq_softlimit >= slpc->boost_freq)
>  				return;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> index c34674e797c6..6de87ae5669e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
>  
>  #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>  
> +enum slpc_power_profiles {
> +	SLPC_POWER_PROFILES_BASE = 0x0,
> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
> +};
> +
>  /**
>   * DOC: SLPC H2G MESSAGE FORMAT
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 706fffca698b..d5410d3415b2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -15,6 +15,35 @@
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_rps.h"
>  
> +/**
> + * DOC: SLPC - Dynamic Frequency management
> + *
> + * Single Loop Power Control (SLPC) is a GuC algorithm that manages
> + * GT frequency based on busyness and how KMD initializes it. SLPC is
> + * almost completely in control after initialization except for a few
> + * scenarios mentioned below.
> + *
> + * KMD uses the concept of waitboost to ramp frequency to RP0 when there
> + * are pending submissions for a context. It achieves this by sending GuC a
> + * request to update the min frequency to RP0. Waitboost is disabled
> + * when the request retires.
> + *
> + * Another form of frequency control happens through per-context hints.
> + * A context can be marked as low latency during creation. That will ensure
> + * that SLPC uses an aggressive frequency ramp when that context is active.
> + *
> + * Power profiles add another level of control to these mechanisms.
> + * When power saving profile is chosen, SLPC will use conservative
> + * thresholds to ramp frequency, thus saving power. KMD will disable
> + * waitboosts as well, which achieves further power savings. Base profile
> + * is default and ensures balanced performance for any workload.
> + *
> + * Lastly, users have some level of control through sysfs, where min/max
> + * frequency values can be altered and the use of efficient freq
> + * can be toggled.
> + *

this extra line can be removed, then

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + */
> +
>  static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>  {
>  	return container_of(slpc, struct intel_guc, slpc);
> @@ -265,6 +294,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  	slpc->num_boosts = 0;
>  	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
>  
> +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
> +
>  	mutex_init(&slpc->lock);
>  	INIT_WORK(&slpc->boost_work, slpc_boost_work);
>  
> @@ -567,6 +598,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
> +		return -EINVAL;
> +
> +	mutex_lock(&slpc->lock);
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	ret = slpc_set_param(slpc,
> +			     SLPC_PARAM_POWER_PROFILE,
> +			     val);
> +	if (ret)
> +		guc_err(slpc_to_guc(slpc),
> +			"Failed to set power profile to %d: %pe\n",
> +			 val, ERR_PTR(ret));
> +	else
> +		slpc->power_profile = val;
> +
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +	mutex_unlock(&slpc->lock);
> +
> +	return ret;
> +}
> +
>  void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  {
>  	u32 pm_intrmsk_mbz = 0;
> @@ -728,6 +787,13 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Enable SLPC Optimized Strategy for compute */
>  	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> +	/* Set cached value of power_profile */
> +	ret = intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
> +	if (unlikely(ret)) {
> +		guc_probe_error(guc, "Failed to set SLPC power profile: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 1cb5fd44f05c..fc9f761b4372 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
>  int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index a88651331497..83673b10ac4e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -33,6 +33,9 @@ struct intel_guc_slpc {
>  	u32 max_freq_softlimit;
>  	bool ignore_eff_freq;
>  
> +	/* Base or power saving */
> +	u32 power_profile;
> +
>  	/* cached media ratio mode */
>  	u32 media_ratio_mode;
>  
> -- 
> 2.38.1
> 
