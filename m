Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC89D85DB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D6E10E64E;
	Mon, 25 Nov 2024 13:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXXTA5bO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4C110E64E;
 Mon, 25 Nov 2024 13:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732539949; x=1764075949;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=QNbENjsmkrDqJsH0Nt0uqdalRSOr0hoWCDXOWGtMiVE=;
 b=ZXXTA5bODDev4SGfW5iRL/4qsnCekpD1NwQlC75zz5RNHkSdRdCgv/H7
 NNlRk3rTRc1yaJShktSovBjAznWZqCaSvKisTI6ATbHCkzy/wI00NPc0K
 4EF55QrHbVYPq11LTtkAufJZ8aKd3m3NgBPqJV9x9hg9Dg3P6mBedpXzC
 u+7lvA59Iauf1OVTgjMV61Ihs4UUpgVNMfZFC6lAnb7EByEOyX51hTP1F
 i5lwmOoqErzQJAVgc74jwcXcdhu4uyYo1rOzzJOE5iMlV35/StIrFqINZ
 pTZnsEeVZpTl1NTfMi3/dWtZao6Af04cIIsojRWNUVpFYRkVv2F6VpsnR Q==;
X-CSE-ConnectionGUID: /adT54ovRbKvisvAj3iyTw==
X-CSE-MsgGUID: L/H2CemFSo2RLzRUfhnBYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32009169"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32009169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:05:49 -0800
X-CSE-ConnectionGUID: Nwpf4YwcTca8zyZaQicoOQ==
X-CSE-MsgGUID: aDmbyB5iTJCzZn19oC0YMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="122205177"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 05:05:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 05:05:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 05:05:48 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 05:05:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o602Fhd3/OBWrPxAUX7WcDrL08CJHZndD0sTdGUvO8v06lDlAg0TGVfzQQbRoQ3D6tIkRpx1wGD28Z0nkydSlMQKDpU3CaA6WJHI2S2vgTcjE6/5P3gVSIOmi/j4ViKI98zMyt9u79J9ytIQBOV8Icg6V44XigvnMFaQEsk6HSMBLYpQ4ZDHo0xu40j+DFSIcJ0AbzJZ7fv51JcbMBwRduEvyFuaFXKPt8a2HVuAIP1XiaUM9RAnzA+QMGkoiff3BG4CPBh9rsEHanrU9IyD3dr49bEDwo3n+BmIb1bD4rkwMIG/4c+MJfNP9n6KYUOyxwsCxbbog6rOv0x9+gkMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOZsA3ZHGusBSfGT7QK6TRgz1my6b/Po+h2c6yV58vw=;
 b=JiuT3VIj/X6cJndvY/bZ++uL8pHbtQ7zrDhE/XH2LI1U1ANUkpJl07kxLCT2mzmHrXzrhNRPhNOEbeGLlXsg7qScYCF57o2KgLfUwU170lhLlUjK4nixESzAb78NUa6NCYs2qqC/ZJC6c2X9ro7dSWBtvNuAeSUbli8Jb/xHk3zYtw6p5hgwKsVt61kQFoDjw7bVIlFs7+XI2l5byxf0fugmhBs2rrb25XHmYUhbUbjTMo2s9cO0yVnjghwet31eHqqp7Gp3vqfJQOzM1m9T4yJ63IZLTHjigAl5bSAoVCU8op1b3tOZEWFQxgIY+CpJlq+xCEdrQ/tdNV+MP77tFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 13:05:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 13:05:43 +0000
Date: Mon, 25 Nov 2024 21:05:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ltp@lists.linux.it>, <dri-devel@lists.freedesktop.org>, Arun R Murthy
 <arun.r.murthy@intel.com>, <oliver.sang@intel.com>
Subject: Re: [PATCHv2 3/3] drm/i915/display: Populate list of async supported
 formats/modifiers
Message-ID: <202411252029.30061fde-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241118075315.466009-4-arun.r.murthy@intel.com>
X-ClientProxiedBy: SG2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:4:54::36) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 0caaff24-265b-4925-8812-08dd0d51de47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TOvuvhMY0GPqBJXk31/qIq+W2auieDuhrZpqN6lb43j95unahhHyPMLvxv31?=
 =?us-ascii?Q?NW+cFJXyI0QI4JFGNt1dpacYVN0iNOSgvXe5E9vhUY9f3LBufRD5icwUVJqH?=
 =?us-ascii?Q?gLO6q9nafFnhV361wLGPQ63LrdmyrRq3/GLXgyeg/mK53WrBCJLLDr4v1Mk4?=
 =?us-ascii?Q?rXiJiuefv8Yk5x38B0rhwHOZNJu1xGfXiMGNcMqMyif4vEGOKMreZ+Ml5kyL?=
 =?us-ascii?Q?eROWmy+qrvB1vqZ82Y0NUL6e72//NOAhSZl+PJfVlobaeQlX/NnKiUHBssWd?=
 =?us-ascii?Q?cI8PMNgc/p7/nfBFgfXLmwd7IR2iIWSJvokSXfX/XUYAPo164uxCgPXxxvtN?=
 =?us-ascii?Q?aLvquuixlavciIaBscpUwmOhgs0d/a+Mld5IXCf220zl2BF7vhr/j/fzgQi0?=
 =?us-ascii?Q?py7W7+O7wDiiqLA8CCMh3s1RevK6/UJ48LlBaqW9vXu1DFopU9mAHEGjvHdw?=
 =?us-ascii?Q?Kd5v0XbomxFQ9WiHv+1iD4o+147cqgk/RYKqrGLYEC01EeFS+GGbthGCWLm6?=
 =?us-ascii?Q?nKJi9Hf4u+6mKBzM2zO/ZI2UBZZDyvPUDWIL97zCDE9tyJnoESS0W9g+J/G4?=
 =?us-ascii?Q?+/QeYZulQ7Lwmr5afA/SQvvpezIE2l8bzPOEmrCXDSgat51zsz6BwyCBmI+A?=
 =?us-ascii?Q?Kdu4D2To09Va/Ef6QoZLTHd49oMl2QDyauWQV2WamV6J31vIwnKsggj9DoIg?=
 =?us-ascii?Q?DyvFBM/Z4IGgYwcUIxZYA3wyKvFkUpo/pY4uFcj2/qtK3j/xRe6Mt1qCjjPe?=
 =?us-ascii?Q?HMSEW+oCx3ovsfhQJZmIjjIuSh8l6gESnJ/LAu3+yrNfpjVfW8s2nHpXWFvH?=
 =?us-ascii?Q?0RYSCGNsYz9MaEJnbKkJNDULg+tUxUe6v9+ptHB9WknNyc5vM7mNdwF8GwMC?=
 =?us-ascii?Q?AVrVYv3wwhEAO+ZMUqKyLEXMNDwg+iMdska1zC/Z2JH7t+jXKd4GOjGsCOIm?=
 =?us-ascii?Q?IyBvm3X5TsFo8Wgc6BsYwXdYPW7DmRRTXAwpUslCxDVnl6lpwNgKQVrk7CPk?=
 =?us-ascii?Q?mzwDisrv4j0YSLpx09xnoXuXls0bW6eiMyPlZXJZcUNbGNPYoNTmdamm+W/o?=
 =?us-ascii?Q?VL9OstH0yzpehn0GFVvWC4/P8V88CUEcpX/CLUTjAyNR/0alLdZpdd74BU1u?=
 =?us-ascii?Q?bx3IxwuiOww2bPNiKe4rvlb+AHwToKDCuKusPTEhi59QuoE5/1hUjUCV8b2G?=
 =?us-ascii?Q?4cynFX+j7miuprEaCmlOi90tqQ3Yoj5SnDeIDdXHFtIX1cylLz8rK56sOZ+I?=
 =?us-ascii?Q?Ofh5ftE4ZjY/WEAU5rrPe5lKhui8YcXFP6J5pW1sILxI7sEel5U3X0djO1cD?=
 =?us-ascii?Q?bsP5GrnwNrdBqVqxVDX2585l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJCjPZLeW2TzZjb5MWwe1l3lK/9YOdfZDLxLVqzq1WvHMbaJF2RP6C+dkVLk?=
 =?us-ascii?Q?Q4sWYRcO3kHjgvpO3NdYel+r7oBBaZVBmw07KUl8C6ga53qqSlHyZNW/Zd4d?=
 =?us-ascii?Q?bP7Zq9TKzQdacbaSWSZWOa0/I5bmsgmjWq7cO8DqnqbY5ioLoDmYHnagBfID?=
 =?us-ascii?Q?aDDWf3sbFmX4xqxpq8aZ4rPbHyQoeAJxFnfrkDhKKK/XGUq1gcIkVS/GukKR?=
 =?us-ascii?Q?h6vwZxWUhfhpNL2oYnmaHyFH8cnlEA6g2DNT3SNCv2o+Jio5U5lu4FUsKWpN?=
 =?us-ascii?Q?j9DD7QU9HHCRwySZ8YGsQv+c46VKFT6eEiuDHGot55yKbUCiW8j+vE81vW4/?=
 =?us-ascii?Q?sLETN0UzQs8YJlZI2rVJRB8dNp1F91IySXdEDUPdpJw3GPAyoCTmtWdQzhe+?=
 =?us-ascii?Q?zqAUPgWzk7i8QbXNPcQh81V5M5Ax13RBSFxe+faVFiajs73SYMmXt3s2Rsnk?=
 =?us-ascii?Q?OwQf4SHveoSf20u6mMtf+xIdu0pGHY5CViVa03wyr55sTZmf8nT+Cu5Cgon6?=
 =?us-ascii?Q?pcTnR3oOM3uO5mnmSZHV7wvGezcO7BZki0wVdJ69akLaPh3IzfpLoK24B1Ui?=
 =?us-ascii?Q?5eUuSSErIcPks2I9qHSkzK8e6Jdph5xgqxMOfqoGZPtYWmHMT+LyfmToCMwT?=
 =?us-ascii?Q?0R7YznUPtTnbFiUohwJmEcjp+fR34JWyxYGgsGsGbVlfYcyG1R8gLAoFK+RO?=
 =?us-ascii?Q?Jzcdd+gL2N9DiJZoEwqtnp856HIGjzHhEYZdiEmSp95Pv2zHhOOf92wa2MZM?=
 =?us-ascii?Q?yMmDM1i2+ZXq7qETK/wLV0gmvnvrXSCJzFOd204NEEsBsMZyIbvLnc9tCcY5?=
 =?us-ascii?Q?4/XbfL/NtFmoyDM0bm1ltFLAFBqNWWyVSbWcusDax1RvxF8P9MNlA28uDFX3?=
 =?us-ascii?Q?Sahhms+4PxDBj9hSw88J19+R2wNxL5NtnYjG8k5T6QPKZCXA3hmQdq+VKNia?=
 =?us-ascii?Q?iVIKtQA+K0yzXSSLqScF4oxT44LJFq0misfCyRN36ced+6yvl0HHowtFBDzB?=
 =?us-ascii?Q?cCmfj6s8oCbyEe3IBlg0JiLed7A4/E0YqEu7aju2lTExVIWZNo+tpKFVrg5D?=
 =?us-ascii?Q?cnR7DfH7yOPPussCxsJnAYBL1GFU637tdfGUfXi4DfppVQh5GDAGN5xnk9ld?=
 =?us-ascii?Q?y+/c8kqJCaf+/1/2cOVecvSiV6mckI6dDDOAG7CxLyfDg9IKvdwu8uTUYKxh?=
 =?us-ascii?Q?WnTDyAam2rnlGjfRfasqIc8igxPflPm+rmuxJsQGzYXFoTzy1o7COOwWwrr0?=
 =?us-ascii?Q?qyJYRd27h6dyI/JPdJGYps2GX0Qmwnwo+AO6ek7pXDrMngCUrofKPiWlQIB2?=
 =?us-ascii?Q?CWduMbIDs4hqqC084Ji0JJ5DkCkgl1NSivpq49TSzXQ+hdKZrgZ48kT262qK?=
 =?us-ascii?Q?DOXyWEdgoZyBnmDsRAcxRWMPORbWv4hcMSpqtp2yZnn7or+rIv2XKa5kQDnV?=
 =?us-ascii?Q?gRRTksBziBBLD/Kjwi2bpymhXw0WnlMZG1v1a0MthU6dOzNREECn4B35+NlR?=
 =?us-ascii?Q?dxRRuKzMZ6w9IwsexIY30BFzvvv5eSoHQhHvK5SL3FGANfJgPnm0ya6ulLDg?=
 =?us-ascii?Q?3V2sEe0w/Sav+ugF37nP8MJY48z/E/mY2dxuCxzmkTIUXCrHdjV2y6V8ZxSV?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0caaff24-265b-4925-8812-08dd0d51de47
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:05:43.3357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezBRmJkBahbYa4i9YN9ZDmw15LgqiCahRr64Ihj2ttWb9Jks4EGgML3nyX2zxM2+h4AHsM8XK+laBjN9iMYT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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



Hello,

kernel test robot noticed "BUG:KASAN:global-out-of-bounds_in_drm_plane_create_format_blob" on:

commit: ab8ee1a4b22d80e3812a6d9990b92d77eee4a17f ("[PATCHv2 3/3] drm/i915/display: Populate list of async supported formats/modifiers")
url: https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-plane-Expose-function-to-create-format-modifier-blob/20241121-105652
base: git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link: https://lore.kernel.org/all/20241118075315.466009-4-arun.r.murthy@intel.com/
patch subject: [PATCHv2 3/3] drm/i915/display: Populate list of async supported formats/modifiers

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20241111
with following parameters:

	test: lvm.local-00



config: x86_64-rhel-9.4-ltp
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (Kaby Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411252029.30061fde-lkp@intel.com


kern :err : [   44.116017] BUG: KASAN: global-out-of-bounds in drm_plane_create_format_blob (drivers/gpu/drm/drm_plane.c:191 drivers/gpu/drm/drm_plane.c:238) drm
kern  :notice: [   44.129098] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
kern  :err   : [   44.138344] Read of size 144 at addr ffffffffc1a99bc0 by task (udev-worker)/230

kern  :err   : [   44.138357] CPU: 1 UID: 0 PID: 230 Comm: (udev-worker) Not tainted 6.12.0-00003-gab8ee1a4b22d #1
kern  :err   : [   44.138361] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 12/22/2016
kern  :err   : [   44.138363] Call Trace:
kern  :err   : [   44.138365]  <TASK>
kern :err : [   44.138367] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1)) 
kern :err : [   44.138376] print_address_description+0x2c/0x3a0 
kern :err : [   44.196003] ? drm_plane_create_format_blob (drivers/gpu/drm/drm_plane.c:191 drivers/gpu/drm/drm_plane.c:238) drm
kern :err : [   44.202599] print_report (mm/kasan/report.c:489) 
kern :err : [   44.206894] ? kasan_addr_to_slab (mm/kasan/common.c:37) 
kern :err : [   44.211709] ? drm_plane_create_format_blob (drivers/gpu/drm/drm_plane.c:191 drivers/gpu/drm/drm_plane.c:238) drm
kern :err : [   44.218254] kasan_report (mm/kasan/report.c:603) 
kern :err : [   44.222465] ? drm_plane_create_format_blob (drivers/gpu/drm/drm_plane.c:191 drivers/gpu/drm/drm_plane.c:238) drm
kern :err : [   44.229022] kasan_check_range (mm/kasan/generic.c:183 mm/kasan/generic.c:189) 
kern :err : [   44.233763] __asan_memcpy (mm/kasan/shadow.c:105) 
kern :err : [   44.238065] drm_plane_create_format_blob (drivers/gpu/drm/drm_plane.c:191 drivers/gpu/drm/drm_plane.c:238) drm
kern :err : [   44.244436] ? skl_universal_plane_create (drivers/gpu/drm/i915/display/skl_universal_plane.c:2615) i915
kern :err : [   44.251192] skl_universal_plane_create (drivers/gpu/drm/i915/display/skl_universal_plane.c:2630) i915
kern :err : [   44.257773] intel_crtc_init (drivers/gpu/drm/i915/display/intel_crtc.c:312) i915
kern :err : [   44.263672] ? intel_gmbus_setup (drivers/gpu/drm/i915/display/intel_gmbus.c:935) i915
kern :err : [   44.269640] intel_display_driver_probe_nogem (drivers/gpu/drm/i915/display/intel_display_driver.c:441) i915
kern :err : [   44.277003] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:832) i915
kern :err : [   44.282751] ? __pfx_i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:751) i915
kern :err : [   44.289031] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:168) drm
kern :err : [   44.295046] ? intel_display_driver_probe_defer (drivers/gpu/drm/i915/display/intel_display_driver.c:81) i915
kern :err : [   44.302188] ? i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:998) i915
kern :err : [   44.307853] ? __pfx_i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:959) i915
kern :err : [   44.314024] local_pci_probe (drivers/pci/pci-driver.c:324) 
kern :err : [   44.318585] pci_call_probe (drivers/pci/pci-driver.c:392) 
kern :err : [   44.323139] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352) 
kern :err : [   44.328232] ? pci_assign_irq (drivers/pci/irq.c:149) 
kern :err : [   44.332888] ? pci_match_device (drivers/pci/pci-driver.c:159 (discriminator 1)) 
kern :err : [   44.337812] pci_device_probe (drivers/pci/pci-driver.c:452) 
kern :err : [   44.342468] ? pci_dma_configure (drivers/pci/pci-driver.c:1656) 
kern :err : [   44.347478] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658) 
kern :err : [   44.351871] __driver_probe_device (drivers/base/dd.c:800) 
kern :err : [   44.357038] driver_probe_device (drivers/base/dd.c:830) 
kern :err : [   44.361948] __driver_attach (drivers/base/dd.c:1217) 
kern :err : [   44.366602] ? __pfx___driver_attach (drivers/base/dd.c:1157) 
kern :err : [   44.371767] bus_for_each_dev (drivers/base/bus.c:370) 
kern :err : [   44.376413] ? __kasan_slab_alloc (mm/kasan/common.c:318 mm/kasan/common.c:345) 
kern :err : [   44.381325] ? __pfx_bus_for_each_dev (drivers/base/bus.c:358) 
kern :err : [   44.386587] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153) 
kern :err : [   44.391677] ? klist_add_tail (include/linux/list.h:150 include/linux/list.h:183 lib/klist.c:104 lib/klist.c:137) 
kern :err : [   44.396421] bus_add_driver (drivers/base/bus.c:675) 
kern :err : [   44.400984] driver_register (drivers/base/driver.c:246) 
kern :err : [   44.405631] i915_init (drivers/gpu/drm/i915/i915_driver.c:1395) i915
kern :err : [   44.410605] ? __pfx_i915_init (drivers/gpu/drm/i915/i915_config.c:13) i915
kern :err : [   44.416150] do_one_initcall (init/main.c:1269) 
kern :err : [   44.420704] ? __pfx_do_one_initcall (init/main.c:1260) 
kern :err : [   44.425872] ? __asan_register_globals (mm/kasan/generic.c:232 (discriminator 3)) 
kern :err : [   44.431218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
kern :err : [   44.435787] do_init_module (kernel/module/main.c:2543) 
kern :err : [   44.440356] load_module (kernel/module/main.c:3009) 
kern :err : [   44.444831] ? ima_post_read_file (security/integrity/ima/ima_main.c:835 security/integrity/ima/ima_main.c:817) 
kern :err : [   44.449914] ? __pfx_load_module (kernel/module/main.c:2856) 
kern :err : [   44.454736] ? security_kernel_post_read_file (security/security.c:3356) 
kern :err : [   44.460698] ? __pfx_kernel_read_file (fs/kernel_read_file.c:38) 
kern :err : [   44.465953] ? __pfx_down_write_killable (kernel/locking/rwsem.c:1586) 
kern :err : [   44.471467] ? init_module_from_file (kernel/module/main.c:3198) 
kern :err : [   44.476720] init_module_from_file (kernel/module/main.c:3198) 
kern :err : [   44.481796] ? __pfx_init_module_from_file (kernel/module/main.c:3174) 
kern :err : [   44.487485] ? __pfx_vm_mmap_pgoff (mm/util.c:578) 
kern :err : [   44.492477] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153) 
kern :err : [   44.497559] ? ksys_mmap_pgoff (mm/mmap.c:547) 
kern :err : [   44.502382] idempotent_init_module (kernel/module/main.c:3210) 
kern :err : [   44.507642] ? __pfx_idempotent_init_module (kernel/module/main.c:3202) 
kern :err : [   44.513422] ? __pfx___seccomp_filter (kernel/seccomp.c:1218) 
kern :err : [   44.518687] ? fdget (include/linux/atomic/atomic-arch-fallback.h:479 include/linux/atomic/atomic-instrumented.h:50 fs/file.c:1114 fs/file.c:1128) 
kern :err : [   44.522549] ? security_capable (security/security.c:1143) 
kern :err : [   44.527277] __x64_sys_finit_module (include/linux/file.h:68 kernel/module/main.c:3238 kernel/module/main.c:3220 kernel/module/main.c:3220) 
kern :err : [   44.532443] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :err : [   44.536824] ? sched_clock (arch/x86/include/asm/preempt.h:94 arch/x86/kernel/tsc.c:285) 
kern :err : [   44.541029] ? sched_clock_cpu (kernel/sched/clock.c:394) 
kern :err : [   44.545767] ? clockevents_program_event (kernel/time/clockevents.c:334 (discriminator 3)) 
kern :err : [   44.551465] ? __pfx_sched_clock_cpu (kernel/sched/clock.c:389) 
kern :err : [   44.556639] ? hrtimer_interrupt (kernel/time/hrtimer.c:1830) 
kern :err : [   44.561639] ? irqtime_account_irq (kernel/sched/cputime.c:64) 
kern :err : [   44.566730] ? __irq_exit_rcu (kernel/softirq.c:620 kernel/softirq.c:639) 
kern :err : [   44.571387] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :err   : [   44.577175] RIP: 0033:0x7f6c1bf48799
kern :err : [ 44.581479] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 37 06 0d 00 f7 d8 64 89 01 48
All code
========
   0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
   6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   d:	00 00 00 
  10:	90                   	nop
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d 37 06 0d 00 	mov    0xd0637(%rip),%rcx        # 0xd0671
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d 37 06 0d 00 	mov    0xd0637(%rip),%rcx        # 0xd0647
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241125/202411252029.30061fde-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

