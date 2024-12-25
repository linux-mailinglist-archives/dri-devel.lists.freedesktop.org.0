Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409D9FC5DA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 16:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51BE10E167;
	Wed, 25 Dec 2024 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpNxU+HY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CCB10E167
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735139773; x=1766675773;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=q2x5rz854dOhNAVQlb/Xbe6jwq+p7ZQ9YQOguHh8OjA=;
 b=fpNxU+HY38nDyupq93Cd1/ngQniBUSVqBZaezOAw7M5jNjL26qx0ieMw
 GxvEQSRT8K9UrMza263ZVhGCmUxOtroNGVj9OkgnKvAuD3gORgz8ni0bJ
 nESSemXRJiNDP0PYj566WmvhgJZLm2E16FbLkHzdrc5NZbhTiZ9dbvOeA
 2FJmyjfcn05xRMVVe6aq7TDU6UdQXwt0ed5B0ihY+xsyx0A1NlbA+p9RN
 NA7h95KSgYlP+QhzVi+8nuHVGUQd+tFMlI3k6m4XWMNiOeF1q92/arbB0
 ZBpn8hMN8mlNaNN3MMhg/ys7ZYYprPAAcbk5tF1VkgfG7MFcE8UaQ2k8t Q==;
X-CSE-ConnectionGUID: q/JJE1taSfajZt2HOcXwRg==
X-CSE-MsgGUID: WtAr+Gp7RTa4KW/f2m0VBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35747417"
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; d="scan'208";a="35747417"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2024 07:16:12 -0800
X-CSE-ConnectionGUID: 5cgYJ5RsTe6uiwXXNrAl/w==
X-CSE-MsgGUID: Tvxd0P4cQoCc98kXcJAJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,263,1728975600"; d="scan'208";a="130578934"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Dec 2024 07:16:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Dec 2024 07:16:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 25 Dec 2024 07:16:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 25 Dec 2024 07:16:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVd6qQwk/S4oljtxDOn8plZDmRf3wgKoQKggwKLygd3DuWQcFoLe8pvm8Ly82lB+9jfvzPU0Opt1Uii7ZmD/vnFGHLTBgBtyIXnUrjD+rcgpiDF5G/coe/Dj3lTXpISR2iDT78Ga+7naOfu6hONgyCs9xKuaJKwHI4/bxXmhf9phhBFwdsj4hnAt/rIwpKUSQ9h20RjaHicfFS/EbQiKguUwuf++82l9DWNvuRTvKjUM4h+U3swjhwJlIgzpJ3RU16ou0VRmuLxByHMxda62HPG1wKO3gEmYyyeLmEbTC1JQIPrabfkXhQM4m9rsPzR2oHhmGOHXnoqeXmErLT51GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDdfK0k79y6A/WLvhJCfCfmhhUiI2AqHf3hT3k3IIKg=;
 b=Y5pdDglU2aaA8PTAxQnVGFPmWHsm8B3y7irI9jwViDhF0GCzwfaGtFUmiNHy9WEtH9KaiCVsTNvjgUiCP6i/4AgUzHqR0BnJD05BmOp2Gj58sqLE6N7UKwXbfuuoB8eHrc83OfmZcykqbMWMGJ3CsNR0Do2YIVo8Rlk9631XL3rACvzmk6ygPXgzPDzJ9RnUyQPibR628IPxDPhDdYr5EB3nw1ILeNA3QX7DoMTfgJHkTCMk4J1cb4hFPmLZcvyOtmQ3r01xhMxdQfcK7gWJ8zT8BmmLK9QMK9E9pW0AJdH0zWzTqe0qghtxAMz5/Z4KxlDImVmcQFZdZvRyFD2nFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6331.namprd11.prod.outlook.com (2603:10b6:510:1fd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Wed, 25 Dec
 2024 15:16:04 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 15:16:04 +0000
Date: Wed, 25 Dec 2024 23:15:53 +0800
From: kerne test robot <oliver.sang@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 <oliver.sang@intel.com>
Subject: Re: [PATCH RESEND v3 4/4] drm/connector: warn when cleaning up a
 refcounted connector
Message-ID: <202412252329.a12c3be7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241216-drm-small-improvements-v3-4-78bbc95ac776@bootlin.com>
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 657ec5e4-ecfd-40ad-5660-08dd24f70c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cm1LsZp2uVcedFlNAoRUNY9iOQvk4F1xbEIm+zaToGxzRBkA9TlcmYKx0moI?=
 =?us-ascii?Q?4e60YwbULjSF21KyOBD3r0EMWpUymz2jdmDpl7sj0ohuDPiD7S9+UTdZD2zr?=
 =?us-ascii?Q?aMn9Mz2LPN8CQVF5tZuO5WFfIHVh79MByvMPgcHvK3DC1DjHuavL6E5mPHyt?=
 =?us-ascii?Q?AoiY4a4PtOggo2ujNffJs7KZ3r4wK9tV6EK2mEa0X8E5QFsCFoHPHYYEr+ih?=
 =?us-ascii?Q?uI1Q3uW6m75ot834ZjeSbg3DEmiFXvPxs9iGgs5G4Wb+2DH/Lv2JIdiW/96W?=
 =?us-ascii?Q?XX+A5WG5Lkf1zb0bRyoyKcNOhOrFL02rYoeRVJKlVe8jw1x44JM1LrareeAu?=
 =?us-ascii?Q?JQXqVAuZWgkvlN+jiT7WhFtGZl9uHbQSZD0OuZEDEkTkJAQF/dFOLXRB9HoP?=
 =?us-ascii?Q?1fnpCDIopdYsfXPYOFiXmtSzvxpAV7H1LKeSouNY2JYfLNRKnSphBL4oSw9U?=
 =?us-ascii?Q?hsmTGCraqOX/kmym0swiSJQzjQpiP/mYFxrArZ8BxH18f1m6hznrJ4x+lbM7?=
 =?us-ascii?Q?Nd9rZbmf/iN4HRF7yL0nf/TDN9Z3wSPfFbJTndqv5EX7gMcsYvLPNZlLuVmL?=
 =?us-ascii?Q?y48D3kni0D07TK4Dl7ZdVdcaUKvbH6ahxV6FsNyHooknRA++pHkWWNnNoJRj?=
 =?us-ascii?Q?usRLh1E5P9jyheUhSYMZAkH28eaAhy1dXQMld16EQQ0hoFf9Yjwz4sWbvXCc?=
 =?us-ascii?Q?kN0qvcdWb/Y230jDZRdkWnA6mmtajs348kP7rX6zTD8Vq9I7H2HlOFYSnfac?=
 =?us-ascii?Q?z6F67yHbGCuBUnTFyI+h2qTGImHHJJdktHb4BQWVwFasdBNiKAxjqFJfDKNj?=
 =?us-ascii?Q?rp0BAZF1jLrAng918twW95WD3niAUIGlRSBiGZ6fP0iB7tE15TuMiIZnRx1p?=
 =?us-ascii?Q?Zjn49SCqGxVRokcZpUmAb8mHLJSZFj4ndr7ZFLW6vuONVKxZ1XZsRnwCdSSs?=
 =?us-ascii?Q?fwSvCQ6HJlSsIQsRHpBqYQAcIWxINAvFXtRK01ToM7lecNhf9lad52Cg7sNA?=
 =?us-ascii?Q?YZj1KLBN8z/8n7LONhPDJMjyuqjb+ZFfvnuAT2oKnd67y1Q4vSRH5i2zy0T/?=
 =?us-ascii?Q?RyIsDFw5Ut5a7UTnmTHwz6R85DZY661v1D64rogGhkfiC7BwQLy/tLCnT2CU?=
 =?us-ascii?Q?1lLHAI+SsF4Tfsutsql92NBIl0E2L5/ZOz3wq6rq/dKDMmLhWF4d/o7NLgq6?=
 =?us-ascii?Q?MCdVmVeJum6BB/prmjL+f9wjWyIkbDPIEHpeRwFfvAGTagxbqUvMryyoan/1?=
 =?us-ascii?Q?/4cExzyu0CWCK5a6vhCRYr7DLo+kvgToCEFuofn+nK3cBgT1EbDYCr7THa4/?=
 =?us-ascii?Q?TMbOXiKO6Y3aAuoLx6tz9pVsAeXs7cwN3XmmUbiI+8mP2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lvN9ADjW6Uv+fSMKjksACkC2kXzOCwlIc6a3QH2qGsOKsPcK/QheDY4nQvAw?=
 =?us-ascii?Q?JILWD/ft4yOYktL7caC2EPqhc+XtSuZEmT6pz6bduNfZGeapZt29Pq8p9zx5?=
 =?us-ascii?Q?c12yIitR+0d6ZYYfkyjkMdm5sU9hGOh/FwO64Vm4VYd8d1J+52JBCjUXiZpJ?=
 =?us-ascii?Q?NQk2xCCVfMAPHz2pQWe/HlLBXV7yFLPBJZ+QEI746N6f78oXDqL3umA8Gv+i?=
 =?us-ascii?Q?GZp5eyzaz+TL4siTSbGbYKSPKE6oe23LpaJifdrGQREXgNx9OFEfe/Cf+ajm?=
 =?us-ascii?Q?nCFOXjUaReSNhLqqqfcv5FWedzpQgxHbIIws15qheAeGfwRZC8NzVeCugOfP?=
 =?us-ascii?Q?NIzwOL6KTq4S1cphfNmcvbHtinqE02nCVQWfyavtWPSzj8hcHC9lyFFyH3ji?=
 =?us-ascii?Q?iKWeNxtPj1zf1TmRRoaeD79mnDTuiVU2hYfZ0uar/yji0xv8o4DMohhTgTpa?=
 =?us-ascii?Q?rReDABDngfqTZh4wglGNejBr+fpyWuyZzCFjt2pTPD65HWCpwzXVuHeRmcb7?=
 =?us-ascii?Q?1TrSMyV0eKk1qh5DRdOz8Ug39Qawiktngw2BWOX1DF+p4orbkPCcLU12MvdV?=
 =?us-ascii?Q?TAB3XtRtRpp5gBL7VZ3en0Qx3sSermh1m8CwsbbL9X0T5vVOvdPcVTmZDXac?=
 =?us-ascii?Q?FSPFUzUHPTtEZvBjR086d6cI29jNzcceZVGY3lwqm046rpoBo/LnUcU9O+iF?=
 =?us-ascii?Q?3YzskPRE9e15/CVi3jgwwKTJbPW/P9Tg22quxr/UnhlUMZeQob4xfWtjcvKh?=
 =?us-ascii?Q?VJbRuQxOtCMQu7FrVWTadMyJ3lmey+eVd2cg/o9SZs5OTIk8hPySdxS0R/kj?=
 =?us-ascii?Q?G3uIlq0rn8VTR4ID7Ud2/yN9g6lTtlwcv+kNm9YlyFgOE4GhT28OkYs77AGI?=
 =?us-ascii?Q?qHQ568N9dlAmOqHRvXAPtVIW/EQgW8IG5ymXiOwVMHQ/ldX+YNaSwNWvtiKe?=
 =?us-ascii?Q?BTkh61qnejhpq8tYYWvIGMeB2uR6n1TDmHtxYTZxc0NMHAR93vC0zmBjoENB?=
 =?us-ascii?Q?2gkj7HxAFHKGcvr/ZHPmbXjHzyMethQ6sLRX1KchHsHhT2M24HZoCiS0fwtP?=
 =?us-ascii?Q?JGp3d4111k0fjTaw/+zaNR1W6MkaKDHFMvAXMkQ/lcDtS2Ka1QnvbeOnq86S?=
 =?us-ascii?Q?p4ygmO/3DYE0eDOJ8vpeFqQ/ui2LDzODV4nDgbBRkdNPXbjHDE4Jf8QXpmqW?=
 =?us-ascii?Q?Nr8RoMkNK1LNxCTmFZTbSmCD7cv3q/ylnWjGDZKk0A5zyjeKsZ/UUC4eCtMQ?=
 =?us-ascii?Q?w6IZaKT3DxVybp8qiatBZvJ8YB39dn95CfcYTY4yTR8ZeWz83hpOHbhRGp5e?=
 =?us-ascii?Q?u+X2oEPgwnUFaCASbw0Q8dLIozVpRaTN+PD0nuKFxM3TIgWE5gBmozn9kYVZ?=
 =?us-ascii?Q?vchP/BgXdloWb39HghWCJPyRoNqkF08FC/KflyYEEJqnVK1hIfDEZfpIX8QK?=
 =?us-ascii?Q?XEpxvz/9qR0rSk3GIa+7fgXkDz0aOQiwQE47CO/3JS16jZZ1oTBIc7JOt3Es?=
 =?us-ascii?Q?Oi/mxHFQwZcdA9020pZWxBMqWyGRU4ZweJoG25uISV3NjoJjQc0wB/n3yxGy?=
 =?us-ascii?Q?eHSj18SzEFjCrjyqkyp2cM5h9Cc/OYu4h52FfVFReh2H+2G8PNaxUROI2xoN?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 657ec5e4-ecfd-40ad-5660-08dd24f70c99
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 15:16:04.4474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHtUU0A/qH/AZMWlGPVKgmseIhQukFcF9DyzE6N8jqpO7rglC90L9IqWlpGjEc+Z8ExyCn7fU+o3gwsB4MSlTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6331
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


the WARN added in this commit is hit in our tests, below just FYI.


kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_connector.c:#drm_=
connector_cleanup[drm]" on:

commit: b7e98abf2a95872b85ec5e94c98c98a7c8d10519 ("[PATCH RESEND v3 4/4] dr=
m/connector: warn when cleaning up a refcounted connector")
url: https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-drm_m=
ode_object-fix-typo-in-kerneldoc/20241217-004320
patch link: https://lore.kernel.org/all/20241216-drm-small-improvements-v3-=
4-78bbc95ac776@bootlin.com/
patch subject: [PATCH RESEND v3 4/4] drm/connector: warn when cleaning up a=
 refcounted connector

in testcase: perf-fuzzer
version: perf-fuzzer-x86_64-a052241-1_20241102
with following parameters:

	runtime: 1h



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 20 threads 1 sockets (Commet Lake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412252329.a12c3be7-lkp@intel.co=
m


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241225/202412252329.a12c3be7-lkp@=
intel.com


[   75.546607][  T377] i915 0000:00:02.0: [drm] [ENCODER:98:DDI A/PHY A] fa=
iled to retrieve link info, disabling eDP
[   75.557310][  T377] ------------[ cut here ]------------
[   75.562737][  T377] WARNING: CPU: 9 PID: 377 at drivers/gpu/drm/drm_conn=
ector.c:631 drm_connector_cleanup+0x591/0x5c0 [drm]
[   75.574145][  T377] Modules linked in: intel_rapl_msr intel_rapl_common =
intel_uncore_frequency intel_uncore_frequency_common snd_sof_pci_intel_cnl =
snd_sof_intel_hda_generic soundwire_intel soundwire_cadence snd_sof_intel_h=
da_common snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda snd_so=
f_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_acpi_intel_match sou=
ndwire_generic_allocation x86_pkg_temp_thermal snd_soc_acpi intel_powerclam=
p btrfs soundwire_bus snd_soc_avs snd_soc_hda_codec snd_hda_ext_core corete=
mp snd_soc_core blake2b_generic snd_compress xor zstd_compress snd_hda_inte=
l kvm_intel tps6598x snd_intel_dspcfg raid6_pq netconsole libcrc32c regmap_=
i2c snd_intel_sdw_acpi i915(+) kvm snd_hda_codec sd_mod crct10dif_pclmul cr=
c32_pclmul snd_hda_core sg cec crc32c_intel snd_hwdep drm_buddy ghash_clmul=
ni_intel ipmi_devintf ipmi_msghandler drm_display_helper snd_pcm sdhci_pci =
ahci rapl i2c_designware_platform ttm i2c_designware_core libahci snd_timer=
 cqhci intel_cstate drm_kms_helper intel_lpss_pci sdhci i2c_i801
[   75.574336][  T377]  intel_uncore snd mei_me intel_lpss intel_gtt wmi_bm=
of pcspkr libata mmc_core i2c_smbus ppdev soundcore mei agpgart idma64 inte=
l_pch_thermal intel_wmi_thunderbolt serial_multi_instantiate parport_pc int=
el_pmc_core video parport intel_vsec pmt_telemetry wmi pinctrl_cannonlake p=
mt_class acpi_tad acpi_pad serio_raw binfmt_misc drm dm_mod ip_tables x_tab=
les sch_fq_codel
[   75.699513][  T377] CPU: 9 UID: 0 PID: 377 Comm: (udev-worker) Not taint=
ed 6.12.0-rc4-00004-gb7e98abf2a95 #1
[   75.709478][  T377] RIP: 0010:drm_connector_cleanup+0x591/0x5c0 [drm]
[   75.716148][  T377] Code: 00 e8 73 60 6a c2 4c 89 f7 e8 9b 8b 6f c2 48 8=
9 ef e8 73 f0 34 c1 e9 49 fb ff ff 0f 0b 48 89 df e8 64 e3 ff ff e9 c4 fa f=
f ff <0f> 0b e9 a4 fa ff ff be 03 00 00 00 48 89 ef e8 1b 93 95 c1 e9 21
[   75.735742][  T377] RSP: 0018:ffff88813ef1f2a8 EFLAGS: 00010202
[   75.741757][  T377] RAX: 0000000000000001 RBX: ffff88811ee48000 RCX: dff=
ffc0000000000
[   75.749672][  T377] RDX: 0000000000000003 RSI: ffffffffc03362c5 RDI: fff=
f88811ee48050
[   75.757588][  T377] RBP: ffff88811ee48000 R08: 0000000000000000 R09: fff=
fed1023dc900a
[   75.765506][  T377] R10: ffff88811ee48053 R11: 0000000000000000 R12: fff=
f8881400c8000
[   75.773423][  T377] R13: 0000000000000000 R14: ffffffffc19f9f80 R15: fff=
fffffc1a011a0
[   75.781342][  T377] FS:  00007f0aece108c0(0000) GS:ffff8883a1e80000(0000=
) knlGS:0000000000000000
[   75.790216][  T377] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   75.796737][  T377] CR2: 00005654bfbb9378 CR3: 0000000105976006 CR4: 000=
00000003726f0
[   75.804663][  T377] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[   75.812577][  T377] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[   75.820489][  T377] Call Trace:
[   75.823699][  T377]  <TASK>
[   75.826566][  T377]  ? drm_connector_cleanup+0x591/0x5c0 [drm]
[   75.832581][  T377]  ? __warn+0x9d/0x140
[   75.836581][  T377]  ? drm_connector_cleanup+0x591/0x5c0 [drm]
[   75.842597][  T377]  ? report_bug+0x1a6/0x1d0
[   75.847028][  T377]  ? handle_bug+0x53/0xa0
[   75.851288][  T377]  ? exc_invalid_op+0x13/0x40
[   75.855903][  T377]  ? asm_exc_invalid_op+0x16/0x20
[   75.860873][  T377]  ? drm_mode_object_read_refcount+0x35/0x40 [drm]
[   75.867428][  T377]  ? drm_connector_cleanup+0x591/0x5c0 [drm]
[   75.873436][  T377]  ? drm_connector_cleanup+0x34/0x5c0 [drm]
[   75.879362][  T377]  intel_dp_init_connector+0x773/0x920 [i915]
[   75.885913][  T377]  ? __pfx_intel_ddi_prepare_link_retrain+0x10/0x10 [i=
915]
[   75.893478][  T377]  intel_ddi_init+0x109c/0x1990 [i915]
[   75.899335][  T377]  ? __pfx_intel_ddi_init+0x10/0x10 [i915]
[   75.905503][  T377]  intel_bios_for_each_encoder+0x39/0x60 [i915]
[   75.912129][  T377]  intel_setup_outputs+0x754/0x1080 [i915]
[   75.918307][  T377]  ? intel_vga_disable+0xb4/0x1b0 [i915]
[   75.924306][  T377]  intel_display_driver_probe_nogem+0x1f2/0x2f0 [i915]
[   75.931534][  T377]  i915_driver_probe+0x301/0x7f0 [i915]
[   75.937450][  T377]  ? __pfx_i915_driver_probe+0x10/0x10 [i915]
[   75.943840][  T377]  ? drm_privacy_screen_get+0x1b4/0x1f0 [drm]
[   75.949954][  T377]  ? intel_display_driver_probe_defer+0x4b/0x60 [i915]
[   75.957193][  T377]  ? i915_pci_probe+0x149/0x210 [i915]
[   75.963002][  T377]  ? __pfx_i915_pci_probe+0x10/0x10 [i915]
[   75.969128][  T377]  local_pci_probe+0x72/0xd0
[   75.973650][  T377]  pci_call_probe+0xfc/0x2a0
[   75.978165][  T377]  ? __pfx_pci_call_probe+0x10/0x10
[   75.983305][  T377]  ? pci_match_device+0x1c0/0x230
[   75.988272][  T377]  ? pci_match_device+0x1d8/0x230
[   75.993233][  T377]  pci_device_probe+0x9d/0x150
[   75.997936][  T377]  ? driver_sysfs_add+0xb0/0x130
[   76.002830][  T377]  really_probe+0x13b/0x4e0
[   76.007275][  T377]  __driver_probe_device+0xc8/0x1e0
[   76.012414][  T377]  driver_probe_device+0x4a/0xf0
[   76.017294][  T377]  __driver_attach+0x136/0x290
[   76.021995][  T377]  ? __pfx___driver_attach+0x10/0x10
[   76.027210][  T377]  bus_for_each_dev+0xd0/0x140
[   76.031917][  T377]  ? __pfx_bus_for_each_dev+0x10/0x10
[   76.037233][  T377]  ? bus_add_driver+0x17a/0x320
[   76.042028][  T377]  bus_add_driver+0x19a/0x320
[   76.046636][  T377]  driver_register+0x9c/0x1c0
[   76.051245][  T377]  i915_init+0x21/0xe0 [i915]
[   76.056364][  T377]  ? __pfx_i915_init+0x10/0x10 [i915]
[   76.062066][  T377]  do_one_initcall+0x8e/0x250
[   76.066678][  T377]  ? __pfx_do_one_initcall+0x10/0x10
[   76.071896][  T377]  ? kasan_unpoison+0x23/0x50
[   76.076499][  T377]  ? __kasan_slab_alloc+0x2f/0x70
[   76.081447][  T377]  ? rcu_is_watching+0x1c/0x50
[   76.086149][  T377]  ? __kmalloc_cache_noprof+0x2c4/0x380
[   76.091631][  T377]  ? rcu_is_watching+0x1c/0x50
[   76.096329][  T377]  ? kasan_unpoison+0x23/0x50
[   76.100954][  T377]  do_init_module+0x13a/0x3e0
[   76.105561][  T377]  init_module_from_file+0xcf/0x130
[   76.110688][  T377]  ? __pfx_init_module_from_file+0x10/0x10
[   76.116435][  T377]  ? __lock_release+0x130/0x260
[   76.121821][  T377]  ? idempotent_init_module+0x456/0x470
[   76.127317][  T377]  ? idempotent_init_module+0x456/0x470
[   76.132795][  T377]  ? do_raw_spin_unlock+0x83/0xf0
[   76.137760][  T377]  idempotent_init_module+0x1b1/0x470
[   76.143067][  T377]  ? __pfx_idempotent_init_module+0x10/0x10
[   76.148885][  T377]  ? __seccomp_filter+0x101/0x730
[   76.153855][  T377]  ? cap_capable+0x9f/0xd0
[   76.158197][  T377]  ? security_capable+0x49/0xf0
[   76.162992][  T377]  __x64_sys_finit_module+0x78/0xd0
[   76.168126][  T377]  do_syscall_64+0x8c/0x170
[   76.172562][  T377]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[   76.178480][  T377]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[   76.184143][  T377]  ? do_syscall_64+0x98/0x170
[   76.188758][  T377]  ? ksys_read+0xdc/0x170
[   76.193029][  T377]  ? __pfx_ksys_read+0x10/0x10
[   76.197721][  T377]  ? __pfx___seccomp_filter+0x10/0x10
[   76.203026][  T377]  ? mark_held_locks+0x24/0x90
[   76.207724][  T377]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[   76.213636][  T377]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[   76.219287][  T377]  ? do_syscall_64+0x98/0x170
[   76.223898][  T377]  ? mark_held_locks+0x24/0x90
[   76.228599][  T377]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[   76.234514][  T377]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[   76.240174][  T377]  ? do_syscall_64+0x98/0x170
[   76.244781][  T377]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[   76.250698][  T377]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[   76.256359][  T377]  ? do_syscall_64+0x98/0x170
[   76.260965][  T377]  ? __pfx_ksys_read+0x10/0x10
[   76.265660][  T377]  ? mark_held_locks+0x24/0x90
[   76.270371][  T377]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[   76.276280][  T377]  ? syscall_exit_to_user_mode+0xa2/0x2a0
[   76.281940][  T377]  ? do_syscall_64+0x98/0x170
[   76.286542][  T377]  ? clear_bhb_loop+0x25/0x80
[   76.291148][  T377]  ? clear_bhb_loop+0x25/0x80
[   76.295752][  T377]  ? clear_bhb_loop+0x25/0x80
[   76.300364][  T377]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   76.306191][  T377] RIP: 0033:0x7f0aed521719
[   76.310543][  T377] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 0=
0 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
[   76.330135][  T377] RSP: 002b:00007ffee75cdb88 EFLAGS: 00000246 ORIG_RAX=
: 0000000000000139
[   76.338496][  T377] RAX: ffffffffffffffda RBX: 0000563966406a10 RCX: 000=
07f0aed521719
[   76.346406][  T377] RDX: 0000000000000000 RSI: 00007f0aed6b4efd RDI: 000=
0000000000014
[   76.354322][  T377] RBP: 00007f0aed6b4efd R08: 0000000000000000 R09: 000=
05639663cee60
[   76.362242][  T377] R10: 0000000000000014 R11: 0000000000000246 R12: 000=
0000000020000
[   76.370158][  T377] R13: 0000000000000000 R14: 0000563966417500 R15: 000=
07ffee75cddc0
[   76.378097][  T377]  </TASK>
[   76.381044][  T377] irq event stamp: 118993
[   76.385295][  T377] hardirqs last  enabled at (119007): [<ffffffff8125e4=
72>] __up_console_sem+0x52/0x60
[   76.394797][  T377] hardirqs last disabled at (119026): [<ffffffff8125e4=
57>] __up_console_sem+0x37/0x60
[   76.404286][  T377] softirqs last  enabled at (119020): [<ffffffff811535=
15>] handle_softirqs+0x255/0x370
[   76.413859][  T377] softirqs last disabled at (119015): [<ffffffff811537=
32>] __irq_exit_rcu+0xf2/0x110
[   76.423251][  T377] ---[ end trace 0000000000000000 ]---
[   76.457822][  T377] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on min=
or 0
[   76.512348][  T377] ACPI: video: Video Device [GFX0] (multi-head: yes  r=
om: no  post: no)
[   76.531042][  T377] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00=
/PNP0A08:00/LNXVIDEO:00/input/input5
[   76.602276][  T377] i915 0000:00:02.0: [drm] Cannot find any crtc or siz=
es


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

