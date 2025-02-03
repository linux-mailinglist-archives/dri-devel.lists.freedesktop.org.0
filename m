Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8179A2674B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 00:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AD110E586;
	Mon,  3 Feb 2025 23:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXJxTacj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADF110E586;
 Mon,  3 Feb 2025 23:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738623601; x=1770159601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OUyr2Y8ixcbjnNEVnP+5LB0zCXzXEsGXpzlO/vnWEk8=;
 b=VXJxTacjbEWI7S6/jRtsqTJCN+BXQFK6cfDP89wssM8HFBzDHfyBRMYi
 0aT7pWoutoymkr4X/NL9S8UuA1dc74DIWFJEjH1zJbcVy2m2HBjmXf3HA
 V9HOh96Pn+j1PUEU3zDTHWjNLbM3bA2SozOs/Ao3h/tVi3lUUbgpslkXP
 H7TWUv6DNdo+ZBwvzVrpKku1DY3IrDLODk8bzP5XZzfRgf5CMVNaMndH+
 LH/IozbsWnsJtarZ6oReB1pUo238NQpbedksoTxWI2er4GtcanB7MHmK9
 GaZjbMP+kwqdOlsa2HaLs+H3YCANjjzEHaM5FuQ1O1pejWXABCFm2si3d g==;
X-CSE-ConnectionGUID: RMyHW9rdTkqSTHTGqOw6nQ==
X-CSE-MsgGUID: bszGwMb/Rmijg6aRJap7aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49743390"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="49743390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 15:00:01 -0800
X-CSE-ConnectionGUID: 9VqAkLGUSpil9f1CxfU1Pg==
X-CSE-MsgGUID: IfcGRsiTTxqLDwX9XVesSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="115404226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 15:00:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 15:00:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 15:00:00 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 14:59:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kr3fY9MWpuowrqY6RiHujugyP/hqA6qnCHxX1aT3vigoAG5xr2gETbCHFQzgdz5Hv3MkzGaeKN96pzzUDdEaJeR6V2E+OMv9c+0vBTSkfrUHz4b6CY5b0sEbdOhC/05H1S/a1hDZzfCEiGYSikvq59qv+opyzmzkXLdTCqKHbp0sti6tTCPKww/QwOnGQE2e+lB/2VSyag0nJVIrZz9qQWvM9cmhPz4je2B651H0w5Swi7a0k7keBao7EJeUaNTYAQpBF7gAU8edIF7FUp3A134ZEYgYRbBxfnb/hbHjfItqTyzByvbtyXgk3pVzz0061ZcO2WAi1qAlAS1NBHU3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRMM5xxb+myuKfZrx/gg8vECOZ++++lB7LHp4lX3Ou0=;
 b=WFB0HAXSi/TxYKMvxdDohmgSIK9Sct7ltHXzhOyC7BYXEEVdUU5zfA7ItfQAZh3B1OEzCOlYkdFI5H052pA3Ovc+spfMCbnonXdOQZZ6fGusvzirxOK8xLY0a6luO+fYuXw/HEPN/xlgzFoOEUTzyBYgRHHihmjm/qDfDyuyO/0c6U/0hxnUWodpFELhQX7c8diDs2F49l582SJj6cPFKHCvHSR0LyskHWKgj2MMnQxd5YVS3KcVWDLE394Cap5pxHJkkptZ8T4u6hF0GuZae/5ACCYz2q4soUiYLfROpHxSZm8i6c22kklIsUUlW1WEfvaTuV0ei1sNcKe7Eem8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 22:59:17 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 22:59:16 +0000
Date: Mon, 3 Feb 2025 17:59:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Sushma
 Venkatesh Reddy" <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH v4] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z6FKQOE4nc_kSxYC@intel.com>
References: <20250117215753.749906-1-vinay.belgaumkar@intel.com>
 <4f62fe21-2641-40ba-ace4-1429389068f5@intel.com>
 <Z4-ySdQ7sCymXRMx@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z4-ySdQ7sCymXRMx@intel.com>
X-ClientProxiedBy: MW4PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:303:8d::8) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 683f3d3f-e840-44e9-a2fd-08dd44a66257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XVy0zvwLPTHmqm49++yekBewUSYvTtk1/4EEXdsTRnpnvO+TXMCElucmFXFc?=
 =?us-ascii?Q?cn/DRuImEqhE6704GShHuZy632G/hHp0cvPyXjs/pBiSodL9ZrV5mr2WY6gp?=
 =?us-ascii?Q?uVTUsSMVpWZkaTkg4LWk+6WbBzXYfLO+kkp5+OzoxZzrIHJxw+bvjaCrGiSp?=
 =?us-ascii?Q?Fc8uF3F9Jxb4Jj4IKxVeEpUKvmNgGFK+7TxF2GoMSkBheriO71YzAU+zYR8R?=
 =?us-ascii?Q?MfygoIsDWbIRkBsnD4SwUUvT2QqxmeAaKvEufAme12HTuyBPkzQzdIyxzA6W?=
 =?us-ascii?Q?zUM/nkqp0F6ACqmrKYOS2j3yKIQt9N4HpX6OV64pwRfWn9PM98c157y/pyod?=
 =?us-ascii?Q?qd3sMc26BiX4LsWGBVuK+uOAnbgxd4QeRsJcMWG7WUx9//hsB28tnSx3GP3y?=
 =?us-ascii?Q?QOxBim8arFcxnnRqeC468jTjtLc1wM2Pc0JLnpn9wWbYbSfz8N/zpVAEMzX5?=
 =?us-ascii?Q?JQT+/SfU6sOjrfi/naOdunBn6Zvs0HsQ47gqLZfXiwMOUE6rXqxh3KF9MCr8?=
 =?us-ascii?Q?ibDlMULQXDjefw9HMb4+I5xDj0PyXPxRZVKS9qrOlAV5jNZ3oBuetC+7ImU/?=
 =?us-ascii?Q?LUiy1Vpkgtk5ZGcqfqcF04lEr4i2VIADWlhJeXMRN9R545uPx9r1CgIQnRJ0?=
 =?us-ascii?Q?SzUQ/D6jJWb9PaS0qqLSqXp1JIs/aWB3wyG32fexVElzc30X4ZcZuHPsIQmm?=
 =?us-ascii?Q?OZnJXHF/8Lu6q6MHt9JIdJkSbW8pzZZ6jO9DEJ6P8MN2X60wrsTPZTa5j/+T?=
 =?us-ascii?Q?4RC/EBSgJ1Lmk3YMQAw1sRowcqQrflOrb5+Bfx9ykiEDZB3NZ/MUdA2fe9eC?=
 =?us-ascii?Q?kYNPhPa51trDxnHc9tDE17PRqyB3jkzYDbM/n9y+USePzocxzBilZ9q6uYf6?=
 =?us-ascii?Q?XSpzpZAuhZlvgD5Sv8j3NSb4gZR81f7LQVkXabIMxQKNV8vRuimFIR1kf+vU?=
 =?us-ascii?Q?kQ2JgbTz7lIu9TqiItWq+/aqo8cl4g030f883GUZLOmaSGlokc2cNvWbt9yc?=
 =?us-ascii?Q?cb6h5Y3SzLupCbHxteuCv5mPfG4P40uaKDsJWgbzUJVqR7ks05x6+njS3HeO?=
 =?us-ascii?Q?Sfdlr33v6PziGWJ2AQVkP4noaZLyA11/USQiRsii38cYpKaY1SUaN9gv4gSW?=
 =?us-ascii?Q?0QiXU2e63cJ+5lMEBPuc6B6zKQ1u+CHCOcQKEPr2vnyASmA45RYSW6xIKTC4?=
 =?us-ascii?Q?8JTy5gTNhSFVtMplyn16uohhpqXQgh/Q4XbV674zzCevZ67zpYkfk8aMzpCg?=
 =?us-ascii?Q?LGqGMgLpe+HPeIKd9VysVHtePLA7LBmDoNXfSYGKpB0IT5f3RfxEwFqTf7CD?=
 =?us-ascii?Q?znKh41/crk++gxkYWVO7ph2J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0630535UAwEWEbUoNab4R9g80m5dB4RHt/GxhAWGoEwl+dr9b2j9lE9mOH0?=
 =?us-ascii?Q?FBN7Fh6mZoC1dCPBR4jdxm2G/tLw1dMDoxo7nDR4dNC5A69LmpymZKt+PJwZ?=
 =?us-ascii?Q?e1bOwZJwGUleraltJ4kEFkN3XTtJte3EuYJKsOyD57a/ozCVsGB7MB8U18RE?=
 =?us-ascii?Q?4GO/cWz9DV9xFFwO+wcOtzhQDR/ogrV5z/xZz3412khAVCa8Q+WE2onj1ZUE?=
 =?us-ascii?Q?VUkrt78KCX9TofNxmqBRfJEc9q06ri5wUUiylt2unF1OaVezQe0naGJFECJI?=
 =?us-ascii?Q?70Ja0Cby7dLvXKPNNt8EUsAto8U5I0fQVFZNCl+oURvrYsi0OaKLU/NmFnK8?=
 =?us-ascii?Q?oW2KjSX59WEv9eg+16dGMCbxSB299SRV8TOoxNGWkwWbAdInjIb0AohZpNSE?=
 =?us-ascii?Q?h8nmJH1VFzzQoIUCHZkv+BBzWbtA6Q8aEbWDDuvNg7aaPM21GFYmtqrgZIg2?=
 =?us-ascii?Q?rk+wSS1+TcGA8TuWxa6X8alvzhqxWyUPuI1KlYXNKc6HrghwAsqwLR4PkOFx?=
 =?us-ascii?Q?VzRk6x+ZLdMnelfaMOyCxk50O9PaYVw7Vxo9UOKDvy2pXtSzPQGqie+0ZxSZ?=
 =?us-ascii?Q?N5N9KgcoFcIl3bhMrWR0sA8eO7wiy5LyCbVtCqWJ0x1sPeHYEo+na3rbV5/6?=
 =?us-ascii?Q?m6wqDI5sFMXVQl6ccRjZfm3OKeMXEuAv1W+9zNsb8kF38zeCMWqS8RFJK6NX?=
 =?us-ascii?Q?xfX6pyFh5JucGJ37qTt3A/BsplCjTZDMl8yP5Bwaa8NSEjXtO03HE2Zi5PZl?=
 =?us-ascii?Q?ILXgDE9QxIOY1xaHLYBpTvTv89IHjMUUezD2kXtZIZKPwGFxIplKqMSstIkJ?=
 =?us-ascii?Q?hmqabC0C74QPo7vUfhIbBxmUwdfydE/c06AdMFew2z0UzXye6VRB+67Hw2ct?=
 =?us-ascii?Q?yaYN6TijIiwUJREJ1FTf58PMY0A5TdnhCMYOKsD6pxinT7Xll9Li1TM4MU7z?=
 =?us-ascii?Q?vpdn+jhyVmaWQUV8rWzPSKI/KH5JhstkADkox6u2i/aBOp7wRrxy9wjkQm67?=
 =?us-ascii?Q?aiDkut78n60Y7ZWWxPKj1DsegMX/SLLtUlMWTTyrYd8rb+nq5WFOXU7Pwp1w?=
 =?us-ascii?Q?gNRLWAL1WcuTy3bN8H3Tk7qU2W3XFonxy+wFlagdIZTUJ1HZTEV/+NtIczdy?=
 =?us-ascii?Q?zyrohWGjEiSSw+yfIMEsL+mcPfpH13sq4JfHCIaupptbX17vVOsQlro93HYA?=
 =?us-ascii?Q?ZMkkINGyJWerGwkyQNov8Xv8CAqF+MxYYTgDjh9qKCH24nLjj1seuWljvISn?=
 =?us-ascii?Q?xK/do2z/cpJeNbePKI8O7YaFWi2Lt/2Tf+s6l5kYfyi7zCFgrV8kedkCVYIO?=
 =?us-ascii?Q?KPrHyc4IlisHJKUSsgOkWf9bkM6XRsOH+4gVMG6ap+QnYQRDHYoN5ypB6qTf?=
 =?us-ascii?Q?bfvXmeyfRgNMbG/EnswOvijUVpBPfD/lBfPPz8Fi+OW5iwolADuraSC4Z8Lq?=
 =?us-ascii?Q?cbXMS7y4DtajRBN6yDHDWKwaC9wuDfCTD2T6Nl+qDEtjmpaiwoJls+DPRlcn?=
 =?us-ascii?Q?i48GUhkvLPZmFZPS20eU6H+TER8krpaPfJmFl5U5EZbGG2t1bW/Y3QMRMLRg?=
 =?us-ascii?Q?5p6LufK2TzJfFRpLSBFFybc53dz+xGZxnAS7MunKHWmZgcDDZSpPKvHmHuhF?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 683f3d3f-e840-44e9-a2fd-08dd44a66257
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 22:59:16.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRAfa/4F0V/ZHG2bH7Db6s9G0KOS6R/ItVsLp+zv7arUleHCn0n3B8qqJrauhZxIg4oRowr/gUtApYhiEoEmzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
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

On Tue, Jan 21, 2025 at 09:42:17AM -0500, Rodrigo Vivi wrote:
> On Sat, Jan 18, 2025 at 06:47:27PM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 17.01.2025 22:57, Vinay Belgaumkar wrote:
> > > Default SLPC power profile is Base(0). Power Saving mode(1)
> > > has conservative up/down thresholds and is suitable for use with
> > > apps that typically need to be power efficient.
> > > 
> > > Selected power profile will be displayed in this format-
> > > 
> > > $ cat slpc_power_profile
> > > 
> > >   [base]    power_saving
> > > 
> > > $ echo power_saving > slpc_power_profile
> > > $ cat slpc_power_profile
> > > 
> > >   base    [power_saving]
> > > 
> > 
> > is that output aligned with the sysfs rules? from [1]
> 
> Please help me to understand why that is against the rule?
> 
> It is still ascii and it is one value per file.
> 
> How is this different from:
> 
> $ cat /sys/power/mem_sleep
> [s2idle] shallow deep
> 
> ?!

Hi Michal,

do you still see a problem here?
Anything I might be missing?

I'd like to get this patch merged soon

Thanks,
Rodrigo.

> 
> > 
> > "Attributes should be ASCII text files, preferably with only one value
> > per file. It is noted that it may not be efficient to contain only one
> > value per file, so it is socially acceptable to express an array of
> > values of the same type.
> > 
> > Mixing types, expressing multiple lines of data, and doing fancy
> > formatting of data is heavily frowned upon. Doing these things may get
> > you publicly humiliated and your code rewritten without not"
> > 
> > 
> > [1] https://www.kernel.org/doc/html/latest/filesystems/sysfs.html#attributes
> > 
