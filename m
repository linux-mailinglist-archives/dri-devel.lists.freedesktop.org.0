Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949BDA99691
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 19:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0741810E6E3;
	Wed, 23 Apr 2025 17:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwlBj7u8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5688010E24A;
 Wed, 23 Apr 2025 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745429279; x=1776965279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KdHWyhHjNs4a6YmedUjca9NAU6W0AK+Y3MEO0yx2pes=;
 b=CwlBj7u8h65tLCyKcjO7QsOMot8rYJE3Cdfmf6BJLUSqdqf0EUfK8Hz6
 Z+a8+ryMFivH4Y0X4YZfAm6PzxbbhcpQhBLM8dUei+WSvLjmEKf3IRU9+
 mRgMcSi1/Bzr236sEIYMEYWWmuNW4MxGP6ODWv+A41/gIX0jh9id4GZSc
 hOtCtq0ki14VMuw3dwSpA57MeKjSL3kLFMNcZzptrW5pAhZ/6dqEt04gR
 tVQ8pJIH4vNe0xCGYpfJ4ABQrV8vY2MJ+RuYNvNxa4FNj/cDz1GddT16I
 bh4MqdEswG1joglVyLPZM7HgqX2hFI9WbKKx99h0fLdh69i+6nj0tF7wW w==;
X-CSE-ConnectionGUID: MWUYwM9wR5mxs0gtWLksOw==
X-CSE-MsgGUID: ur8OWmmuRy2pDuIB6sRZ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58027824"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="58027824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:27:58 -0700
X-CSE-ConnectionGUID: rjsmMRJhRBCkgHDZQt0mgw==
X-CSE-MsgGUID: kriPBMsLTj6zJbmRQU1Rew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="155594390"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:27:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 10:27:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 10:27:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 10:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUnKHyECBSzF4CnFyJKYp1lpOuorLNXCFCgyY80XFBmT2zmRxMl9lcQiag2wYYrgT7Jk97cRR6Q4Umg8LUw58/1goOQ35U+gPq6VSd4diWhvEW2m3NZvb8Rxa0J2zhSMPC8c3ruDMsAFoTp9bivJIjeVxixD0fUXyP7k6FkJ31g+peRzaQfMISgyimDuGqLaTJxMDaKDJlpRAzmfzqjQ8b8CSJhzMFSfqzVMwpImXkOaSKgvT4Tv/ZW7uZBQFegE/rPNC0IPOELrhZucqX/QdlW7JSPpYDTu8VSnSlM6SR+lHwlvJqPxCu5vTkyUpmwfFIi7e3q0bakqU/tnaSz63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U67xILy8G95PvoF6/X5mNUnvrByCjaXAxML8L3V9NE=;
 b=uya3OO9Cxef2SXEBOnYMkCEh34+r1L+3O41YNs1YmdqlwkoGW/7cNxEC8md/vReJEMnjcK5U5wVqVLRG/l5ji15g1nbVm5PftHtPlhXTb2lmXhJrmeHzTPvG8whASWk0cRY4YsnOUR8Q/XxoZEuEa+O1f2hV/jM11y8pkw3oqkV6M5Cfc236xupsdYqfMOVFZrSey3LibIlQzgc+VdAhSuKKfF01wxEo2fsyabpLGzb2m/h88fx17vhzRXzmDbpajM3Cbg2NiLmasLlrR7Ajz1KNEcFZRRUv3X4yarw57Waj4gNATTO3eg/J/pIWwg7ZYsPzbg1Mz/7YyOH5Cim6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.24; Wed, 23 Apr 2025 17:27:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Wed, 23 Apr 2025
 17:27:54 +0000
Date: Wed, 23 Apr 2025 10:29:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
Message-ID: <aAkja+b5DAyuYczd@lstrano-desk.jf.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-3-matthew.brost@intel.com>
 <5eab3a5e-361e-4192-9858-70f2fd56a055@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5eab3a5e-361e-4192-9858-70f2fd56a055@intel.com>
X-ClientProxiedBy: MW4PR04CA0145.namprd04.prod.outlook.com
 (2603:10b6:303:84::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 8273a19f-e794-40e8-d640-08dd828c2eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G5DbF/Wdm8K0zcgGwUPMW/c8kNjNsex84qTUpWC8OoGqI7hGPQyVTSoLpva4?=
 =?us-ascii?Q?1XzcchJpvJUooWrxYN9vG7kj/IigmaKd4XN+G52Zk2krDNOWaFX8TP9gODyK?=
 =?us-ascii?Q?R77MD43XUzzyosQoAWeNL19G8adwvYbSQ++11lzentfCi2kX7yf0bRaKh6Lh?=
 =?us-ascii?Q?21Uiwnv2ZYxwgi99gcgOHgXwYt3gCDrCEC6nhfNJ8E4P7jo5TIz3+zw6chB1?=
 =?us-ascii?Q?3A/yslA1qC4/JA9V2FiW5FpLbkPK2L7i3GqkkWj69lrSKwiP70o8aUeBgktc?=
 =?us-ascii?Q?IWzw7Mmxo23KbGM8R1FV+3/1kkauy88+aX2NP9wp1WVRDQb3SoLXzZuNCw20?=
 =?us-ascii?Q?UFi+wCvg6S8+hssiqNA8oDAEmfmww4NJxaLb95CzTBKZC7ia/1XmbyLHd1Fo?=
 =?us-ascii?Q?KSjb+dec0UJnCCrCZTyHSjbfHbp/odfix/iDUAlPdLfvBoCYVsXDeZvUBnI8?=
 =?us-ascii?Q?lUOMOiJcAlSbZZyTMj12CHJ11FI+KaeUc2ktqXXd35ExNBHNA9ABK+9rK0lu?=
 =?us-ascii?Q?vlxLrdJH21TcDbo3O8hH4U/k7bU04mywFHyMlW4QWLg5uLfjVEzKjZscIbib?=
 =?us-ascii?Q?c2YDZ04585cFHj0JoF7HqA/iEp1yN24WMhgsTXanwO/LlWdGd87WaqoWjOYr?=
 =?us-ascii?Q?tm1vlt3dXcPpU3GzYif1+KsqY0TZkki+zVWRerVYcMVFJJlcSEGGg/2eXlHF?=
 =?us-ascii?Q?r4iacDazsd6s5cyOMr9oH5hhrgGolYy1HoPIisIzkF/Vg3M/YU25PoxK6Xxs?=
 =?us-ascii?Q?9n4HdZYYW/XyyvKv73AmTIpd5Zrg505T08GBzEc94ZlThoiGG8yb8uywQzVm?=
 =?us-ascii?Q?C807Y/bRrjkrx6x0YwXjYFIWaCqpNclwvgE83wfQabvEaf5iM6DhyJ85JpEy?=
 =?us-ascii?Q?kJ1QNvLQf74FObRUOEDfy1/7VaxTfjlcFM9sq83ZrLBj5cYjViZrVUARSo7L?=
 =?us-ascii?Q?s3LHZ/IxO3Ee5mSJlF9TLjn7LyfmUDIDWjUNgQGZQm0lA5eWa8vOPuvSxdl2?=
 =?us-ascii?Q?WdVFWDX0gnzclBeeYekzaeTOe0aRl+E4DDSpJL5uuik8jbAVXR3H4J6xMRQ2?=
 =?us-ascii?Q?Du11BQDsp+xIGGax1Vv6c5iG4b6OkR10m3uTXq2lRgY7gg8nokF9bUmimaVp?=
 =?us-ascii?Q?7jfzjWEmPS8V8anmI53XKFDuVPqkOgk7eFJ6Y3P6q1wSJBdu1fm5LB1Jw601?=
 =?us-ascii?Q?1A77iO7abK8/bOyzge26R9LX8fDd5JCp1uz48uPyi+8RuI5GNDkZG08YTRL+?=
 =?us-ascii?Q?cMGMquO5x/PZWpxf6emzDKMsC9pi3NVOsNDdr5eZf4k6FXSNSjETaDVu8Hkc?=
 =?us-ascii?Q?GeSkffFejzzymX76cQTa8S6ojINgjna5x1EL2OALb9+omk5XVDxxoJs2c2Vy?=
 =?us-ascii?Q?ZpWARFXR7aYdBJFWoiuY7NKKVZfT0id+2s8q+oFlwAYFBMQXVipPdWq49bJZ?=
 =?us-ascii?Q?bYnTGzIHIUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NI2jwi3AtqrIHb0QPo18KoMuac1/xlx8WAkZYrkrLZ7RL/17i8uDHKiO2UhV?=
 =?us-ascii?Q?n1VncQYLhqP240JWsm5y02o/5M/CtLxcIQl5Rpj07B9rMdgnLozgDz2dvepF?=
 =?us-ascii?Q?iaDnt326KfFBCRSjVaYFNW36d6pHw/hnMeQLIpr72h23jw+zdVa2geYZvoL7?=
 =?us-ascii?Q?FolUi1ldWP78ORFhJemR80l+XIgVxJgqQZOaaIuhinztST2UnpsQRbo6Ucr9?=
 =?us-ascii?Q?IoPq6ysJyP9Gs2r+rkqFxNQynZg80WZvmPTIhVneVxFu3yAYie6zVF2Tq2gL?=
 =?us-ascii?Q?PgIHiCpunPifHqVPB2zsFtYKm5cR1DM6HilUIcKpe+SOUq39DhEWMxPUM4GR?=
 =?us-ascii?Q?Jgymj+E7++YpXLiNHT8iP27Sltq6i/YnN2ArJsdvmjeUF9VXK+A2LOgLtGMp?=
 =?us-ascii?Q?XHApK6dlc7TV0D7lvVK7we+gbtBNyrbKVWSuNavHmQqxYQbdH5SjDFWg+s04?=
 =?us-ascii?Q?BQZ4bqSnHxK0HsX2nji7ZEC6xSN4S8ByB3ktMSv0V5C1LrCTtJ2W9xMdgSV1?=
 =?us-ascii?Q?GTCN5UBxs6HEQwLu1rTDV9tY/WCT+Ftgk3KcDFGX6ReBAdCPllPPiez9iiB6?=
 =?us-ascii?Q?0Ts6El+JfTH18PlNyUwyuO41auDSjy1Nt/TGCsEtjKt1OU+ilwnpcVi2oaoK?=
 =?us-ascii?Q?Ytfibw7YStdTWjh4obKM5QxURQlVHfvxhDZzyy1jIBkeQFuH/vMoj5etRfLV?=
 =?us-ascii?Q?TYBItIRP5BFqPUIJi+hfJ1kY+aDhfrj5EroTALyizmhnS1rOnZYJ7u9q4RG5?=
 =?us-ascii?Q?H0Z+HCZ1G/9bsMQvVOBzvphb20sjRWUaCNiuka1DJo6g0NdvUYAKzwfjtCQI?=
 =?us-ascii?Q?xZaUDSBmr43vqr3ptDP7j+YFkuJRcMCbO3urzZu327b7VloFm8uM4t7LxN7s?=
 =?us-ascii?Q?44I2D8rMAWFIJ55LvvtyCIrTnnOyNf0CBnMSyQPDHM4HgScGWSpSVNt2Z+nA?=
 =?us-ascii?Q?v3urLeI9W5Ry2pwtGpcFb4uWFFF9jxySQAuGMiZ380LROFTcTzUXJs3f0OqP?=
 =?us-ascii?Q?3fsASU/TpcBbYJ7l+FOwLV5eSRXiCAQljpcopJEtZ8NLYhvRXFE4hrFEuNFX?=
 =?us-ascii?Q?plfrW7++6RDQjCQnIcA+9vE+f+3llPPhuvfrzgqfiu3XtVoWDHT1O+B+e81I?=
 =?us-ascii?Q?SlEKg3IDrM8pljjc7ajcxRc5QKxpzOslq3hE3Or7k4HlrQAIMF7tZL1xqUig?=
 =?us-ascii?Q?NebP/Ka8NS+szj1CFZETmlDdYRk6Ys00Cl98Q+iYAS1ybsBwQRP+J4ocCjV6?=
 =?us-ascii?Q?cLQuN2s+jRt+hGjAj1n/cTm5saZ6vHCKxdc4PaE8oogwd66tf+mdhPY3gkHf?=
 =?us-ascii?Q?ezAayToxoKXu91G0C1EQHNNCWixBU2QRksSoD+qPf9Kaot2gkWu7c/iWUc1n?=
 =?us-ascii?Q?PJMxTq2p2Lv+6ddZXxuN78DhX16uE/nwGYsQc7twyOTmsTq59rB8U1lzPyL5?=
 =?us-ascii?Q?dZt0VKFDpD5QIBEG0T6XqILCzXo5lcamNdUw5OVdIyzcrtKyGBYFtCyqh4J2?=
 =?us-ascii?Q?Hzm/aj1QzVwWtUOnziwqrpZ4OEyoCWuaeqFmmbk74XRYh2DfaFe+xVLEogNq?=
 =?us-ascii?Q?NgwETlR2ulu8rYgY5XyzIZg6V5w3Pg1RgarWtv9zX+9ttjOmbkWkJBoVXUmf?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8273a19f-e794-40e8-d640-08dd828c2eb5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:27:54.8668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeWZ3a2sC+kTZFhqEZLZJsFFwUMiPbSjWo29vDZJdJzMJBuc1wcVt9l+R4a/Kgo/NsZH6fSXtuurk3tl/U0MQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
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

On Tue, Apr 22, 2025 at 10:51:44PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 22-04-2025 22:34, Matthew Brost wrote:
> > Mixing GPU and CPU atomics does not work unless a strict migration
> > policy of GPU atomics must be device memory. Enforce a policy of must be
> > in VRAM with a retry loop of 2 attempts, if retry loop fails abort
> > fault.
> 
> retry loop of 3 attempts not 2. with that addressed, Patch looks good to me.
> Since both of us collaborated on this , it has my ack and need someone else
> also to review it.
> 
> Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> > 
> > v2:
> >   - Only retry migration on atomics
> >   - Drop alway migrate modparam
> > v3:
> >   - Only set vram_only on DGFX (Himal)
> >   - Bail on get_pages failure if vram_only and retry count exceeded (Himal)
> >   - s/vram_only/devmem_only
> >   - Update xe_svm_range_is_valid to accept devmem_only argument
> > v4:
> >   - Fix logic bug get_pages failure
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_module.c |  3 --
> >   drivers/gpu/drm/xe/xe_module.h |  1 -
> >   drivers/gpu/drm/xe/xe_svm.c    | 89 +++++++++++++++++++++++++---------
> >   drivers/gpu/drm/xe/xe_svm.h    |  5 --
> >   4 files changed, 65 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
> >   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
> >   MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
> > -module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
> > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
> > -
> >   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
> >   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 84339e509c80..5a3bfea8b7b4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,7 +12,6 @@
> >   struct xe_modparam {
> >   	bool force_execlist;
> >   	bool probe_display;
> > -	bool always_migrate_to_vram;
> >   	u32 force_vram_bar_size;
> >   	int guc_log_level;
> >   	char *guc_firmware_path;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 890f6b2f40e9..f749ae367a8f 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -650,9 +650,11 @@ void xe_svm_fini(struct xe_vm *vm)
> >   }
> >   static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > -				  struct xe_tile *tile)
> > +				  struct xe_tile *tile,
> > +				  bool devmem_only)
> >   {
> > -	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
> > +	return ((range->tile_present & ~range->tile_invalidated) & BIT(tile->id))
> > +		&& (!devmem_only || range->base.flags.migrate_devmem);

Typo...

s/migrate_devmem/has_devmem_pages/

Matt

> >   }
> >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > @@ -726,6 +728,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> >   }
> >   #endif
> > +static bool supports_4K_migration(struct xe_device *xe)
> > +{
> > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
> > +					       struct xe_vma *vma)
> > +{
> > +	struct xe_vm *vm = range_to_vm(&range->base);
> > +	u64 range_size = xe_svm_range_size(range);
> > +
> > +	if (!range->base.flags.migrate_devmem)
> > +		return false;
> > +
> > +	if (xe_svm_range_in_vram(range)) {
> > +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> > +		return false;
> > +	}
> > +
> > +	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> > +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> >   /**
> >    * xe_svm_handle_pagefault() - SVM handle page fault
> > @@ -750,12 +781,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >   		.check_pages_threshold = IS_DGFX(vm->xe) &&
> >   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > +		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >   	};
> >   	struct xe_svm_range *range;
> >   	struct drm_gpusvm_range *r;
> >   	struct drm_exec exec;
> >   	struct dma_fence *fence;
> >   	struct xe_tile *tile = gt_to_tile(gt);
> > +	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> >   	ktime_t end = 0;
> >   	int err;
> > @@ -777,23 +811,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   		return PTR_ERR(r);
> >   	range = to_xe_range(r);
> > -	if (xe_svm_range_is_valid(range, tile))
> > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> >   		return 0;
> >   	range_debug(range, "PAGE FAULT");
> > -	/* XXX: Add migration policy, for now migrate range once */
> > -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> > -	    xe_svm_range_size(range) >= SZ_64K) {
> > -		range->skip_migrate = true;
> > -
> > +	if (--migrate_try_count >= 0 &&
> > +	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
> >   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> >   		if (err) {
> > -			drm_dbg(&vm->xe->drm,
> > -				"VRAM allocation failed, falling back to "
> > -				"retrying fault, asid=%u, errno=%pe\n",
> > -				vm->usm.asid, ERR_PTR(err));
> > -			goto retry;
> > +			if (migrate_try_count || !ctx.devmem_only) {
> > +				drm_dbg(&vm->xe->drm,
> > +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				goto retry;
> > +			} else {
> > +				drm_err(&vm->xe->drm,
> > +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				return err;
> > +			}
> >   		}
> >   	}
> > @@ -801,15 +838,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> >   	/* Corner where CPU mappings have changed */
> >   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > -		if (err == -EOPNOTSUPP) {
> > -			range_debug(range, "PAGE FAULT - EVICT PAGES");
> > -			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > +			if (err == -EOPNOTSUPP) {
> > +				range_debug(range, "PAGE FAULT - EVICT PAGES");
> > +				drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > +						       &range->base);
> > +			}
> > +			drm_dbg(&vm->xe->drm,
> > +				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > +			range_debug(range, "PAGE FAULT - RETRY PAGES");
> > +			goto retry;
> > +		} else {
> > +			drm_err(&vm->xe->drm,
> > +				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> >   		}
> > -		drm_dbg(&vm->xe->drm,
> > -			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > -			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > -		goto retry;
> >   	}
> >   	if (err) {
> >   		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > @@ -843,9 +887,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >   	}
> >   	drm_exec_fini(&exec);
> > -	if (xe_modparam.always_migrate_to_vram)
> > -		range->skip_migrate = false;
> > -
> >   	dma_fence_wait(fence, false);
> >   	dma_fence_put(fence);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 3d441eb1f7ea..0e1f376a7471 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -39,11 +39,6 @@ struct xe_svm_range {
> >   	 * range. Protected by GPU SVM notifier lock.
> >   	 */
> >   	u8 tile_invalidated;
> > -	/**
> > -	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
> > -	 * locking.
> > -	 */
> > -	u8 skip_migrate	:1;
> >   };
> >   /**
> 
