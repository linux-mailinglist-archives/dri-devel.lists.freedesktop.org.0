Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF894A81C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 14:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5EA10E4F7;
	Wed,  7 Aug 2024 12:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fO/+oOvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FF110E4F5;
 Wed,  7 Aug 2024 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723035292; x=1754571292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r6tj3TgVFNXGfVv+Pf9qiCNFjhjh5UFiiASzhAMfkT8=;
 b=fO/+oOvcRwI6f/ZqXkvPa3eHaTvXqXaI4rz0Xbt53P7PGgejGrtwF1k7
 GACLSqVSg7PJp7UzE6TUoOkaM/PBeM7s9mlnheId65z8xBddl7Ck252Hd
 VvHTDHdh/LdqR9Jkbos71JeRc9uiGMa/Lg39VvoHx3YOioZcmrpxCw9ji
 He6w0JD1pSrKDFLoPId2ZOwOlkJyFYvKFX4pDmbfiLr9YEHccCWN4Otuc
 Se2Tdgs+aCA4/ADDnsQBSBFYQTAcu23OiS0V6jiykX30zlngfyGB5iZuI
 7q3A8ZkPq/5J4CAlPy0aKKIuY8OeeqnQzDywmjbLZ63gdORPR6nMMfCNf A==;
X-CSE-ConnectionGUID: DOCHkJmaSxOrk4Hb9kXscg==
X-CSE-MsgGUID: gymSHVCARVSjjFRMQgcuKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20766349"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20766349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 05:54:51 -0700
X-CSE-ConnectionGUID: 6gFiu+KnRqauJelxQ0L9fQ==
X-CSE-MsgGUID: DKm4q8g8QN+63VrsWU68fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="87509747"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 05:54:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 05:54:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 05:54:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 05:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EF0HWljDMi+VgldgRBfY+3W0PcYerxcI9Mrc1NfTBaK1T5P8wPVDtDs9iR8BFRyj+zqSPTKlrG8imTshsLjVTMce1eOTuXghS4cQMIJMNW6Mfo0jYNPfVz8bvtMJOylZ2Uw/bsf33WgihUETXmjSMeBHiL102tlLfe2sPyyCnrdTL/2YS1YaMC8JwyJlTg+dzim+AL9yus1ZM+PIBfzoe4L3hDKOm1uJWoH8JjxHif5N2IDUFRQ4b4NtNO2uJ4xdA1cbvpvoEIWkKqIiTD8NVFkguDOl6Btc1CV7OaPgurV9BOTAPCffh7pqM+c7FJQIBMhCIEthVghsf8Giq/vS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo8WiXoJYyumXBEfpelMCCIM8wLVwH4XWzFYORfmZYA=;
 b=IS5snj74wWQtuEABmee6ceQKsbfUNIsyrHYEXTjQippMbUvaVCQ53rGFF5qJUQU/0MygZk9xM/6eVEp5MJzBssxK3DPGA3TvklI7KiEqxlz50Wu6xI5g7HnQQzJjeVhTJ5fLDMB/Ce/jCGgvksdoLoQIX/oDLS+COvoSwAalyFfKwJGPvDv+TtaXyweGLTpy13mcOPwUoLgmjBNg+F0bz4lVUrGnHPvCwZRN6Z0gZ3Uo34Im5CH4WjpZEZ9j6//ULPRlMkqbTuPahA0Qzs0M8ZDAFryMoXSTzADipDai7Bm9y16ChUFg3cmC7WHaEKrqcSW93hgr0A9O/UwChlMYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 7 Aug
 2024 12:54:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 12:54:48 +0000
Date: Wed, 7 Aug 2024 07:54:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v1] drm/xe/uapi: Bring back reset uevent
Message-ID: <heyznf7itnfzxq2onoknc2b6fvwtfww4vntama4b6edb24s4zy@adtwfvkzkad4>
References: <20240806043231.624645-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240806043231.624645-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: f6527934-a635-414e-70c3-08dcb6e01e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e0L2KLnXWAHnisw9K9lDgA7snIFZTjPpiRssz2HcWWWVdAs7hyC749myQAkb?=
 =?us-ascii?Q?3W7CCv5Rio6Db6dZqeC7CHTasUVdDP/sb+x09wjef69oGj2rBv7mSlQJCsg3?=
 =?us-ascii?Q?qzKEx92rIr4xAgXia8/kkApephMIruQMyjhBEnitre0JDab/NpRt2qJPbzCH?=
 =?us-ascii?Q?mHTI78S/gk/ZtRRTgrKa0TPdbU1DyV7R4Sz8QG0CQnC4PpXnApJRqSo7KFD0?=
 =?us-ascii?Q?X2OHYPFCGFl+Pjmk07UJVEf5r6k7jF4shs971Au4Z/U3AJ7MN0eYXgiicthT?=
 =?us-ascii?Q?aQ9dGhWV9tfzqP+JXKQxBagTZL1rTquZvvqSZTwUE0LoZA20u9t7ADY7CyOO?=
 =?us-ascii?Q?9v/Mbf0dKMGuUd0dA7RSirJF7AEAFhQSYgFjSmIHhLmSFnUBoKWh9O2TYxMQ?=
 =?us-ascii?Q?L36j+o5YcyvKz/4RACyzInmLAnMeVLGBLgBqp252HsH6zStnUokpzYiy8dYP?=
 =?us-ascii?Q?YjgXGF8NC6g+rMBAyKWMHrKohHbf0g9vhJLwwMDhkwu3L390LV8YrW/3Ep7Y?=
 =?us-ascii?Q?2EB0Lh26px2m03k1h55JwrmD7hLmMoPqtewY1IOstQSPW4MlXdfWpwzH6qTB?=
 =?us-ascii?Q?JYcefZtgZUQ7tyq38XEYyXR0MSPJx5+ziehdfjpkqax8xm7YzeLJX7nnnz0i?=
 =?us-ascii?Q?ZEmUqzhW3X06TDT+czjwXDII4n1o/JJQBMKC3uAqkJmEyjZlUeGxm1DOxn5f?=
 =?us-ascii?Q?jjLLhP5mRoM1OOl3GJ9fTLHuxuU2jzNwfaGGa8k540mYUa6YY+qHuT9YAR7E?=
 =?us-ascii?Q?MiZcD/fOZkBnisECzfz8kRbFRxX+zYLgJMxsVnO0n39IaLQnH8erBKR9sT84?=
 =?us-ascii?Q?zxCyshkctTziHxht4NcLffAu440dmW0R4dnkMrIiXvzuosRdFG5Yl9DCHCz7?=
 =?us-ascii?Q?keZkoPORJllsEJQ9tf4wQ1/0UYtu3NZ6S0s6/jngpYz7UEiC4NsFweTmnP/6?=
 =?us-ascii?Q?3soAaOGBlO8zlEyMVjA3Q3sUk4hZqz43EOvgW4KGs8lkBp+WeubB+MhtH6H6?=
 =?us-ascii?Q?bokcvqBVL5KQzhdeGfshNRe8ZZrjrblVqxEXuI3GVpSMEfjq9qWH+Aa/Xas2?=
 =?us-ascii?Q?MXFdnRihEYCzRUhYSOI57OYJ96unNpqZf3I0LEpR7OUyNEQdwvEad/eKh7XI?=
 =?us-ascii?Q?xsWI9IwwxF/OHKhpBep1Uq4ZZCqnPBLluj5kpiAsc6ISrI+c8E2rTboSY/Sb?=
 =?us-ascii?Q?mSeupR0CXgfI6xVFfPtKrRHPF9H3DZLSyxbBVpTYx1ujZ9S9A3Ahk01Shb+F?=
 =?us-ascii?Q?flHn8KB2ci2DpX/iDLAUQsoZJrvDLwcSeeoHc4rJRBzXpBxJu0yw5mm01mxQ?=
 =?us-ascii?Q?Ye3AKQWPfKZVF3ongrNXaZtnHpSbUNXY32/8v7AW//h4sA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bVssNJiY3DfAqwv0UoKKnGtJa1Q3UaUvUqy8iZx/bljKlkJQip60tE83R1CD?=
 =?us-ascii?Q?8A25R84NUXqRvZG8yn6kyq/jkaLEqZ4zvsesU7Z208+UEzCf/HysgE5L0LAD?=
 =?us-ascii?Q?wnGoVYgfAQqmwdNjjVga4x8EqoyopHbkMGNPIan0IQ7/Yplwh336n0jnfdwr?=
 =?us-ascii?Q?Lc98GSnxN9rUFx/1GphK602+tx/BtFmApBVeKDytOAHnb3uywmMRVefaSMC9?=
 =?us-ascii?Q?ltOxu4as2GDlOF1kDQaOoVmbEvRjKm1i707KRqPu4D81V4MnOM8XuzL5VbVe?=
 =?us-ascii?Q?2loqetXWGfZX9XVPY035um5JAkS5zt6kPqTSV+l+/R/zR5e1UNJU+AYrCwQP?=
 =?us-ascii?Q?ku4xHSEynffMAHYez9TcghJw4NXN7zg3fqX9Mn8YIzk5tsLHwTaXsF8vi4SH?=
 =?us-ascii?Q?rljwEFqI3GCaq3oIopZhoDIIbR2G1RAJXe4u9hxnONGn75pc35FblYflPVQa?=
 =?us-ascii?Q?CnYrH9gZ7fIaBDbJmWOqTZy05Fn2arkibBguj4QZ1xjmcvVJ6P8bmvugxgJ4?=
 =?us-ascii?Q?erEQpsNBFSy38bfNTBmUnEfmGVvkM+BGpqSkznJfHaRlxFB3eL8hY/yM0oBf?=
 =?us-ascii?Q?Q5x4csFjLDiOJKitohe1OEHSUu3rEo2xkbjuc5HEq3+ztCb/KKkGEwJa5N6T?=
 =?us-ascii?Q?mocH7YXOswNVYozBimN0flY4lhxhE/Wr/Lmk3VO7nFokaKbBvJFV9vI03jkP?=
 =?us-ascii?Q?5yWVEXQ0xXQhcTgptKwHBqV53UVzYPOtnVzpyhisvEAT6hhrudsTotr3y4yM?=
 =?us-ascii?Q?0epT0462EOHjmNKoWETwKBdV8Ro+pcMCNztjoja3WQp0VObGUiKpkB6oH0Sl?=
 =?us-ascii?Q?mihX+LprH2n8dpatIm1efUmgjqt4GW1sjYno6Jlw+TVMnNq9vUSXyjWEiEWf?=
 =?us-ascii?Q?aUns8ZRT8YnGLtdvb1ivm/uLsWX1R9+1/ttxoctxTjpQgj/VAypBDbdFESTh?=
 =?us-ascii?Q?JDxE32X/0AIhJRHtkMkfkRkeODpzvEloRhdJDYdBEpdzpjSuWo4nx/gHcecf?=
 =?us-ascii?Q?qQWj8nYq0V5x4F0eo14CjjdO/3MggCI0l3RkRjxR1rCIq0L/MaL/9LBlv24m?=
 =?us-ascii?Q?IUKJGCdH78PzzND5OYq0qyXObFel5uudg6pBQMwvsR+tTNNgXlpmpBrJ73e5?=
 =?us-ascii?Q?mGar84/hrdT+qrzeHLNQQs8l33bWPmBS6JwvHK/fG+H4BmUoStnVBK0P6edt?=
 =?us-ascii?Q?XioVUnUImXcwrwO4cvFCApEwCG/djlBorab7dzkQ3sZc/xufVh61oVSqZYW9?=
 =?us-ascii?Q?PzGL6vOFg3Ox28WYiMGMlr3+SJstErNb1OMVURU6JChBX1LfqdkNb4atZu+e?=
 =?us-ascii?Q?z+LNWiuRo3df6h2xoZQ4aXuAsAM6mXTeW6Z2OuTBrf+bJNJ4UWYFIQx2QLHF?=
 =?us-ascii?Q?EtO729IYn7ga0mCwhQhfw57jb+uhMRC3u7HSr6kp8l40dtwEgl/w29Dq25nJ?=
 =?us-ascii?Q?wLTGbuVz2+0hiwnyNr1Ur4nO2ulf9pvIUUgvl9aoGk+pl7NCyjEbn74X80DJ?=
 =?us-ascii?Q?gEBbf8JJrbq5kXX5fNirtcZuOrfAx1/vpaoNoovFhgLqzOoa/bxSWCoc022d?=
 =?us-ascii?Q?aUti7nPn5ef9cz93sWXI/eYcJQkKYd8R73x9LHKg25VeqdISNIVYezr2LETQ?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6527934-a635-414e-70c3-08dcb6e01e58
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 12:54:47.9471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2Xu/UXYy7SuQMRlGXjADR0JFC3y9lxkuSfklu7iWLUEZ4zw8Vq0MqPN3VozHSMUb4h2e1xX8GrtFBo+LjIRTE2rOsRHRBSh+qbTX0YF+Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

On Tue, Aug 06, 2024 at 10:02:31AM GMT, Raag Jadav wrote:
>From: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Bring back uevent for gt reset failure with better uapi naming.
>With this in place we can receive failure event using udev.
>
>$ udevadm monitor --property --kernel
>monitor will print the received events for:
>KERNEL - the kernel uevent
>
>KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
>ACTION=change
>DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
>SUBSYSTEM=pci
>DEVICE_STATUS=NEEDS_RESET
>REASON=GT_RESET_FAILED
>TILE_ID=0
>GT_ID=0
>DRIVER=xe
>PCI_CLASS=30000
>PCI_ID=8086:56B1
>PCI_SUBSYS_ID=8086:1210
>PCI_SLOT_NAME=0000:03:00.0
>MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
>SEQNUM=6104
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

please drop my s-o-b here and don't add me as the author of this patch,
which I certainly am not.

You need to point to the commit where it was reverted and *why* it's ok
to have this uapi now.

Lucas De Marchi


>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 27 +++++++++++++++++++++++++--
> include/uapi/drm/xe_drm.h  | 17 +++++++++++++++++
> 2 files changed, 42 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index b04e47186f5b..5ceef0059861 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -740,6 +740,30 @@ static int do_gt_restart(struct xe_gt *gt)
> 	return 0;
> }
>
>+static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_id)
>+{
>+	char *reset_event[5];
>+
>+	reset_event[0] = DRM_XE_RESET_REQUIRED_UEVENT;
>+	reset_event[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
>+	reset_event[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
>+	reset_event[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
>+	reset_event[4] = NULL;
>+	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
>+
>+	kfree(reset_event[2]);
>+	kfree(reset_event[3]);
>+}
>+
>+static void gt_reset_failed(struct xe_gt *gt, int err)
>+{
>+	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>+
>+	/* Notify userspace about gt reset failure */
>+	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>+				   gt_to_tile(gt)->id, gt->info.id);
>+}
>+
> static int gt_reset(struct xe_gt *gt)
> {
> 	int err;
>@@ -795,8 +819,7 @@ static int gt_reset(struct xe_gt *gt)
> 	XE_WARN_ON(xe_uc_start(&gt->uc));
> 	xe_pm_runtime_put(gt_to_xe(gt));
> err_fail:
>-	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>-
>+	gt_reset_failed(gt, err);
> 	xe_device_declare_wedged(gt_to_xe(gt));
>
> 	return err;
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 19619d4952a8..9ea3be97535e 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -20,6 +20,7 @@ extern "C" {
>  *   2. Extension definition and helper structs
>  *   3. IOCTL's Query structs in the order of the Query's entries.
>  *   4. The rest of IOCTL structs in the order of IOCTL declaration.
>+ *   5. uEvents
>  */
>
> /**
>@@ -1686,6 +1687,22 @@ struct drm_xe_oa_stream_info {
> 	__u64 reserved[3];
> };
>
>+/**
>+ * DOC: uevent generated by xe on it's pci node.
>+ *
>+ * DRM_XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
>+ * The REASON is provided along with the event for which reset is required.
>+ * On the basis of REASONS, additional information might be supplied.
>+ */
>+#define DRM_XE_RESET_REQUIRED_UEVENT "DEVICE_STATUS=NEEDS_RESET"
>+
>+/**
>+ * DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to DRM_XE_RESET_REQUIRED_UEVENT
>+ * incase of gt reset failure. The additional information supplied is tile id and
>+ * gt id of the gt unit for which reset has failed.
>+ */
>+#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT "REASON=GT_RESET_FAILED"
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.34.1
>
