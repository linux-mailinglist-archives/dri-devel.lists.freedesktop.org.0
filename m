Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4846B00606
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A45D10E915;
	Thu, 10 Jul 2025 15:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n27QpJDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E448410E906;
 Thu, 10 Jul 2025 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160157; x=1783696157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U0/fLydlwgT/Mxh3znbQEBMMBrzp0Fvb6ydjwTo504g=;
 b=n27QpJDkgDr5e64qOe8hQ9a8V9a3kCZozOywQm31K+paektOIR8tNuXq
 hgRi1raivyip947G7YjTjxS7SdJalZrgHRP4790tTr2EhRaY8NJz5tFmy
 bu/1bB4PSW9y4UTC1WW9a8VPkKRbmx9yf+0DbmHXdSSsNU10JjGqbq6c6
 67M4WtEKdq9R+/wN7JW3UW0ZR7VAJOhXNxjPRZnI5QeeRyg6EQ99JTfHR
 2RMirlXzo2upWfPsKrFQBb9l+EKzJskT7c6pQLV8ejcPfVRKfSIwdELY4
 r+gsv0hxw6FEzqYgErUJyHJ9qHZ2ScFgHTkYbLpoE5adRtaPx0aGbKb0m g==;
X-CSE-ConnectionGUID: r/YWecbZTl2XDKhM047YfQ==
X-CSE-MsgGUID: S4n9Ms9QRbOH701DYZjTYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54416426"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54416426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:17 -0700
X-CSE-ConnectionGUID: SlKuMBcSTZ6BnPZYxJKBGg==
X-CSE-MsgGUID: cDVqZyPzSp+m5/pugyw6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160137879"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:09:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKrX++D7z4yEXLKeC2toptAISkDZ/FhPT2DkgYu2DRbB85ZKZiB4E+W1eecIO5xmieB536ReJ3QQSVlL6O3gCzrgD8hKLBDAVaZ37pIdLtGkkqwAWFGfFjjXC0mtLKhuYjhOL7hg1mVoTrOWGwISMtF9RGtwvHNNhoez5PpXSlWANv1MJ9OgV2ifLMUoAGXJIUOozUI31mk9u1VzPjPssRgAJWp6e7o3SFvbm9V622LhIBWwWgd39Dz+EvNSov+kBaDmd0viXXTdLzO7TLWRLMUYDsI/kEPr8uJ9Nr8CAclvoudIPO3dFvNNhrIuLbPTDtkMDuoetBso9TY+ASdApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUaP/97ATvRTyJhz1ZDVf0+rWAy2flLX6t6mk+1r/o8=;
 b=tgmI2EY6s/A5cfUWPuaUPVSQnUm4QRJTiOhKaid7v3wSDwG92iaNlncToHeDpFzT9hlnWGLxxmJ3U60D9KWYHn14kPdFB7K+80/3GSUjxBYoq4E0ALPkcFJK5bUfaLAYXglr2uAKh3U2RxS4d87oc27B3nQ3nE3uOS297UZS/lmdwDllOnh4X/SZnPB5mq/ZMkTjzHy1zXMxZ5PUcr3oa9eSmf4lX1P1+Z8258NaQV8ZQATabnuYIZM/PklPn99K0Qs1M8LXHuoCGLZZTEgsf2sDSU65JZadPaJGthUV+LDfr/j795/XR8sAeFNrohYhEItIrbe7kQVBplJHqUqA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8861.namprd11.prod.outlook.com (2603:10b6:208:59a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:08:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/9] mei: late_bind: add late binding component driver
Date: Thu, 10 Jul 2025 11:08:33 -0400
Message-ID: <20250710150831.3018674-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb0ba10-503a-4850-0d3c-08ddbfc3a97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UjRW/0nD+KWLbPGb6Gt8cwtXpektQ8INuCPB0fi+YCWyz7HzGGfQzgx7zBUg?=
 =?us-ascii?Q?avWCnXA3RXIA3aXFtvoxju0lHQs+Wn94PLp8Y3IN0sQY4TguLm/Av57b36bt?=
 =?us-ascii?Q?4xajsTG2J9jqG2r/EuejGSICWu4bIXH2c2zSkki7p0hR1htQAr+wwRehqGSY?=
 =?us-ascii?Q?9hgT9lUZ4e6FiYZC4Mk/H3QBmoWNkmXpT/UbQvlk6r15iLwLEKhdGiPF1Xa/?=
 =?us-ascii?Q?y2hDs4ngkmm27FjVzoJLeF1yS6HCLpw4AU0TdV2JDFgmUdScHRWbuXvp2sTd?=
 =?us-ascii?Q?wg3aljopXm4FT8Q632P2AoBE9Ptzn8lPu5BjPM9R0qbhJyI8mCTCpvRHX0CT?=
 =?us-ascii?Q?KD1qjElSeSd6kOREQO1zGWsUnlXwmNcMf3XTQBo4D/PaqHVjavtMLI9/VvJp?=
 =?us-ascii?Q?jZKgCxOU6xXyF1XOW6qQ2d9UcC3ysy8Lad08EHas6N/KLapRYeWjaAViV+zj?=
 =?us-ascii?Q?y6RcLApqcovpP7jPVSx8pW0N0R8hCZirQfFngDfXEQnutdAUkr28nZp6b7UQ?=
 =?us-ascii?Q?Ybf14o0h5JoOSIfsq0mExmmxBPmsLZtYxCToIm5h/zSg07p2HhbEO8rqve8b?=
 =?us-ascii?Q?K8eBiIa3/xjdbtAut5dGbz88uhU0ol+8NYGswNlx1wUT/OwQYEHRq9+o8dnN?=
 =?us-ascii?Q?ACTR7NOxhpZhqafJyLAMfscOrrR/QwW68//9YEuCC0rt4UfM0YgqyRzgWChS?=
 =?us-ascii?Q?B82kYkWAq3dyfTrOzwOJMMJ2zBvgzHcAiUMmqg4NwfAZJWWFV58eCr5UBn9X?=
 =?us-ascii?Q?MivRSoc3Sm37R80PQoXwR6/DGjJfaf82cvBHZDa7bHPCg564jJ42DRZMEptt?=
 =?us-ascii?Q?yzyZcE5QIeXvaN7UCj5BDAm6HX+ck4sbMUyZmy47kJIx0Z1y6yRT5q6pNv8f?=
 =?us-ascii?Q?eJAe0W/8Bw5FrnuvQH7k0J0ebJX294VXg6CM/euRPwguqxKn9iJbeywnc8mV?=
 =?us-ascii?Q?7H2ClY0QPW9FwCjuPLcAQEw6usw/ZGisFgmShhML1+PwZVASSt5Ounee2dpc?=
 =?us-ascii?Q?S8tq7Mlj2r7wpMUMIlQgtgmQq0Kc6eZjfEGs7LiikIJMXKOBRQB4CE8D62gf?=
 =?us-ascii?Q?EmedJEI9dlCXXqbhgodvASH82teJchw/aIX3r3Mq1sA9tGUJKMqOTajNwCy5?=
 =?us-ascii?Q?RNDvRNaY/D3rE0jARY75VAAIWXE5GAfTWMckXVEiDNaLAteOWlSgONLWTcN4?=
 =?us-ascii?Q?TbEcLz8e1J9lo7l4oZBi9ghoAnfLzfWNhVOmMlxnnhQXIxWszNweI7JT8EEs?=
 =?us-ascii?Q?Qv7HxaWAQLVPBAYqmuN+3L/0CVFWed7EqqFp8O4DwAZltbaWXjA4yU4CJb7F?=
 =?us-ascii?Q?MtF55qWSt2/XyF2/Q0A0mIDPCiIDmVcRJelQSD4c+rBRGB/EOIrrv0Tpl8IA?=
 =?us-ascii?Q?HadAolI/tuaBGCMd05qG+Pjl9lqbnAzKLDZHGDhrvX9QqzmmIBsyBRRk/lpt?=
 =?us-ascii?Q?ZJiag0eZ4TI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yt9I7XipUmgu2BA4rvxlVEU8jx0Yov4de0jQZpK/VWuLyXCO87zpfYewIZJr?=
 =?us-ascii?Q?J6YOlLJWXSwBbBt0UPg3CFQ7833Z5XyzxKFylFSuPdJuIf3+x1rMviOYFVni?=
 =?us-ascii?Q?w04rFRpgPNJhUy30UdAzKn8vWatluct5z2TiIGB1tIrkH4JJyO0P6I3M8Mzs?=
 =?us-ascii?Q?PrmQBVGdIaIBeYbj2kwWK84wPOksPjkuivtMYwdoYG/B4NXRoGCnBpxxoxXH?=
 =?us-ascii?Q?zx5SsIvEWn1/wxFJ40bs/p/4c6u6puU9hpxNWjY/R2bsCNCjaNJUIKzBcia+?=
 =?us-ascii?Q?xhEUx+uaMEu6goLoiwTYQNl27x/mTG4SLPm6eITKuekq16nAoc7WhjGVV+QX?=
 =?us-ascii?Q?zdfqXYLhykQFfVK0ekf4P/s7a48cVBQ9zUHgMaNWLv/9lwZxrs7HAxu/6sH4?=
 =?us-ascii?Q?5K6d6eU0O2aIOOHM41KGq/M0nI5pP8l9QMY75y9XZCaNbK4VT8Tm2n+iyMt7?=
 =?us-ascii?Q?VaJDBo4FJ4zessb3OXvyGPbC9lXL7jLhF3fz50K3Nc+BPnPnX6o/lznQvMQX?=
 =?us-ascii?Q?y0645Cazqe1dbWYphKm6GW0vvxVeTWDTAX3872ku5TLRKJrE1Iga8qvd7WN2?=
 =?us-ascii?Q?iyEYGRoayXxuiwkX3Unt3BqcFRCX+fScTA+GTUQd414Y5JrzZjr2xa9gt4Xk?=
 =?us-ascii?Q?QWgNV9nmv2Q5mah4qAau8CirPc45KaNhQjfskdkz3Fz69Zua6H6gKI9vQ2/z?=
 =?us-ascii?Q?yQ6sjf7f9vNmAP7slMTa8TnXEDNW2UZ82mlw8+MoWWcMfRqxSC1c6Oqpo/tK?=
 =?us-ascii?Q?+DGoCd6pUa6LaX+m2Wk+HtWtnHNJaHVBEVGkwxDxbLgORbw8Grl6X8saAKz8?=
 =?us-ascii?Q?SyKC/xdY09Lpyn8YQmEOs1fBv0aHA3cURWe/i8i38WkmMq2NCW+BDPnkf410?=
 =?us-ascii?Q?5zCtTMbWjC73RPh5aGI3Z481+SpXpcgteBwuLBcul2YDwPZF2KRyI6HykReR?=
 =?us-ascii?Q?+EEO4DJoDWLOXi31t3uP/mBxAHHRD49cCelxbIueyvUFaNcYtM909WTOn4g0?=
 =?us-ascii?Q?h6u51ZyvoHOWXcU7YwmeYksXE7iaZbUT6pqveiu0VUbct1YH+CWagb9ZuqTv?=
 =?us-ascii?Q?7DgqeX4+Y3+KHjSjepPJyho9I2wnmcrXXWQulDAGEg9JA5d0pP9/GdawP5LE?=
 =?us-ascii?Q?lVMRrfYQ1SszI7B4dAEKzs8JfSg1V7UmRfmwRzpCY+traE9M1TPdvYnEdUFo?=
 =?us-ascii?Q?/HvT8WrOkCfGoN0QmD5x8xHFzq/wwhTwls/TsK562RQzRXN6upw/DarK50vw?=
 =?us-ascii?Q?6tvlh4otlWhISyVPBOMJdaJpRAE6tfC8IreE4dd6daQxWk5I7TCG+Uxe6WuS?=
 =?us-ascii?Q?mM1tU8EOTvEoB2+LNu/a6Q1HD6blo73fe2Tz8qnHUsBfqfOZZVh6V1H6U2W0?=
 =?us-ascii?Q?Bc9vrUcUsN6q24ADvMBP8fRvo5pvgpxeMXBTR28Ii8PoadyM8843IOHddZra?=
 =?us-ascii?Q?LI/+NaYP8lpe7AemyMhsSaSsDonF6LHR7LlhkCD5akY0xNhvMhUY9Le8bIFt?=
 =?us-ascii?Q?jTMAMGm6YodC6yOo4EOAWBV/zDxmqGOxs9Nk+A7KWFtu3iCjxJheCSOBvFuv?=
 =?us-ascii?Q?oSpUUDaCp0vRVZ4/+SpTHQ1dTMY/dQj0moufyPFEFzIH98gKzloFSwvQBqlm?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb0ba10-503a-4850-0d3c-08ddbfc3a97f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:44.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y2q/m4h/dGoz2OVQndQX1oZC5yEm/OK+m76/czuiHG9LCXO5N+Ju6b4uc87aSkbaHGkRTvNUgYU3ISPAA0cbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8861
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

From: Alexander Usyskin <alexander.usyskin@intel.com>

Introduce a new MEI client driver to support Late Binding firmware
upload/update for Intel discrete graphics platforms.

Late Binding is a runtime firmware upload/update mechanism that allows
payloads, such as fan control and voltage regulator, to be securely
delivered and applied without requiring SPI flash updates or
system reboots. This driver enables the Xe graphics driver and other
user-space tools to push such firmware blobs to the authentication
firmware via the MEI interface.

The driver handles authentication, versioning, and communication
with the authentication firmware, which in turn coordinates with
the PUnit/PCODE to apply the payload.

This is a foundational component for enabling dynamic, secure,
and re-entrant configuration updates on platforms like Battlemage.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

Changes in this revision:
- Proper commit message
- Proper explanation of 'Late Binding' on Kconfig help and doc
- Consistency in naming:
  + mei_ prefix where it makes sense
  + use 'lb' for short of 'Late Binding' instead of 'late_bind'
    Including s/CONFIG_INTEL_MEI_LATE_BIND/CONFIG_INTEL_MEI_LB
  + remove stray 'struct module'
  + Fix structs and enum documentation style and fields
  + Remove 'CSC' to avoid yet another acronym. 'Authentication firmware' it is.
  + specify size unit
  + s/push_config/push_payload

 drivers/misc/mei/Kconfig                   |  13 +
 drivers/misc/mei/Makefile                  |   1 +
 drivers/misc/mei/mei_lb.c                  | 315 +++++++++++++++++++++
 include/drm/intel/i915_component.h         |   1 +
 include/drm/intel/intel_lb_mei_interface.h |  70 +++++
 5 files changed, 400 insertions(+)
 create mode 100644 drivers/misc/mei/mei_lb.c
 create mode 100644 include/drm/intel/intel_lb_mei_interface.h

diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index 7575fee96cc6..f8b04e49e4ba 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -81,6 +81,19 @@ config INTEL_MEI_VSC
 	  This driver can also be built as a module. If so, the module
 	  will be called mei-vsc.
 
+config INTEL_MEI_LB
+	tristate "Intel Late Binding (LB) support on ME Interface"
+	depends on INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  Enable support for Intel Late Binding (LB) via the MEI interface.
+
+	  Late Binding is a method for applying firmware updates at runtime,
+	  allowing the Intel Xe driver to load firmware payloads such as
+	  fan controller or voltage regulator. These firmware updates are
+	  authenticated and versioned, and do not require firmware flashing
+	  or system reboot.
+
 source "drivers/misc/mei/hdcp/Kconfig"
 source "drivers/misc/mei/pxp/Kconfig"
 source "drivers/misc/mei/gsc_proxy/Kconfig"
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
index 6f9fdbf1a495..a203ed766b33 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
 obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
+obj-$(CONFIG_INTEL_MEI_LB) += mei_lb.o
 
 obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o
 mei-vsc-hw-y := vsc-tp.o
diff --git a/drivers/misc/mei/mei_lb.c b/drivers/misc/mei/mei_lb.c
new file mode 100644
index 000000000000..fddef862712d
--- /dev/null
+++ b/drivers/misc/mei/mei_lb.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Intel Corporation
+ */
+#include <drm/intel/i915_component.h>
+#include <drm/intel/intel_lb_mei_interface.h>
+#include <linux/component.h>
+#include <linux/pci.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+
+#include "mkhi.h"
+
+/**
+ * DOC: Late Binding Firmware Update/Upload
+ *
+ * Late Binding is a firmware update/upload mechanism that allows configuration
+ * payloads to be securely delivered and applied at runtime, rather than
+ * being embedded in the system firmware image (e.g., IFWI or SPI flash).
+ *
+ * This mechanism is used to update device-level configuration such as:
+ * - Fan controller
+ * - Voltage regulator (VR)
+ *
+ * Key Characteristics:
+ * ---------------------
+ * - Runtime Delivery:
+ *   Firmware blobs are loaded by the host driver (e.g., Xe KMD)
+ *   after the GPU or SoC has booted.
+ *
+ * - Secure and Authenticated:
+ *   All payloads are signed and verified by the authentication firmware.
+ *
+ * - No Firmware Flashing Required:
+ *   Updates are applied in volatile memory and do not require SPI flash
+ *   modification or system reboot.
+ *
+ * - Re-entrant:
+ *   Multiple updates of the same or different types can be applied
+ *   sequentially within a single boot session.
+ *
+ * - Version Controlled:
+ *   Each payload includes version and security version number (SVN)
+ *   metadata to support anti-rollback enforcement.
+ *
+ * Upload Flow:
+ * ------------
+ * 1. Host driver (KMD or user-space tool) loads the late binding firmware.
+ * 2. Firmware is passed to the MEI interface and forwarded to
+ *    authentication firmware.
+ * 3. Authentication firmware authenticates the payload and extracts
+ *    command and data arrays.
+ * 4. Authentication firmware delivers the configuration to PUnit/PCODE.
+ * 5. Status is returned back to the host via MEI.
+ */
+
+#define INTEL_LB_CMD 0x12
+#define INTEL_LB_RSP (INTEL_LB_CMD | 0x80)
+
+#define INTEL_LB_SEND_TIMEOUT_MSEC 3000
+#define INTEL_LB_RECV_TIMEOUT_MSEC 3000
+
+/**
+ * struct mei_lb_req - Late Binding request structure
+ * @header: MKHI message header (see struct mkhi_msg_hdr)
+ * @type: Type of the Late Binding payload
+ * @flags: Flags to be passed to the authentication firmware (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
+ * @reserved: Reserved for future use by authentication firmware, must be set to 0
+ * @payload_size: Size of the payload data in bytes
+ * @payload: Payload data to be sent to the authentication firmware
+ */
+struct mei_lb_req {
+	struct mkhi_msg_hdr header;
+	__le32 type;
+	__le32 flags;
+	__le32 reserved[2];
+	__le32 payload_size;
+	u8  payload[] __counted_by(payload_size);
+} __packed;
+
+/**
+ * struct mei_lb_rsp - Late Binding response structure
+ * @header: MKHI message header (see struct mkhi_msg_hdr)
+ * @type: Type of the Late Binding payload
+ * @reserved: Reserved for future use by authentication firmware, must be set to 0
+ * @status: Status returned by authentication firmware (see enum intel_lb_status)
+ */
+struct mei_lb_rsp {
+	struct mkhi_msg_hdr header;
+	__le32 type;
+	__le32 reserved[2];
+	__le32 status;
+} __packed;
+
+static int mei_lb_check_response(const struct device *dev, const struct mkhi_msg_hdr *hdr)
+{
+	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
+		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
+			hdr->group_id, MKHI_GROUP_ID_GFX);
+		return -EINVAL;
+	}
+
+	if (hdr->command != INTEL_LB_RSP) {
+		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
+			hdr->command, INTEL_LB_RSP);
+		return -EINVAL;
+	}
+
+	if (hdr->result) {
+		dev_err(dev, "Error in result: 0x%x\n", hdr->result);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mei_lb_push_payload(struct device *dev,
+			       enum intel_lb_type type, u32 flags,
+			       const void *payload, size_t payload_size)
+{
+	struct mei_cl_device *cldev;
+	struct mei_lb_req *req = NULL;
+	struct mei_lb_rsp rsp;
+	size_t req_size;
+	ssize_t bytes;
+	int ret;
+
+	cldev = to_mei_cl_device(dev);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret) {
+		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
+		return ret;
+	}
+
+	req_size = struct_size(req, payload, payload_size);
+	if (req_size > mei_cldev_mtu(cldev)) {
+		dev_err(dev, "Payload is too big %zu\n", payload_size);
+		ret = -EMSGSIZE;
+		goto end;
+	}
+
+	req = kmalloc(req_size, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	req->header.group_id = MKHI_GROUP_ID_GFX;
+	req->header.command = INTEL_LB_CMD;
+	req->type = cpu_to_le32(type);
+	req->flags = cpu_to_le32(flags);
+	req->reserved[0] = 0;
+	req->reserved[1] = 0;
+	req->payload_size = cpu_to_le32(payload_size);
+	memcpy(req->payload, payload, payload_size);
+
+	bytes = mei_cldev_send_timeout(cldev,
+				       (void *)req, req_size, INTEL_LB_SEND_TIMEOUT_MSEC);
+	if (bytes < 0) {
+		dev_err(dev, "mei_cldev_send failed. %zd\n", bytes);
+		ret = bytes;
+		goto end;
+	}
+
+	bytes = mei_cldev_recv_timeout(cldev,
+				       (void *)&rsp, sizeof(rsp), INTEL_LB_RECV_TIMEOUT_MSEC);
+	if (bytes < 0) {
+		dev_err(dev, "mei_cldev_recv failed. %zd\n", bytes);
+		ret = bytes;
+		goto end;
+	}
+	if (bytes < sizeof(rsp.header)) {
+		dev_err(dev, "bad response header from the firmware: size %zd < %zu\n",
+			bytes, sizeof(rsp.header));
+		ret = -EPROTO;
+		goto end;
+	}
+	if (mei_lb_check_response(dev, &rsp.header)) {
+		dev_err(dev, "bad result response from the firmware: 0x%x\n",
+			*(uint32_t *)&rsp.header);
+		ret = -EPROTO;
+		goto end;
+	}
+	if (bytes < sizeof(rsp)) {
+		dev_err(dev, "bad response from the firmware: size %zd < %zu\n",
+			bytes, sizeof(rsp));
+		ret = -EPROTO;
+		goto end;
+	}
+
+	dev_dbg(dev, "status = %u\n", le32_to_cpu(rsp.status));
+	ret = (int)le32_to_cpu(rsp.status);
+end:
+	mei_cldev_disable(cldev);
+	kfree(req);
+	return ret;
+}
+
+static const struct intel_lb_component_ops mei_lb_ops = {
+	.push_payload = mei_lb_push_payload,
+};
+
+static int mei_lb_component_master_bind(struct device *dev)
+{
+	return component_bind_all(dev, (void *)&mei_lb_ops);
+}
+
+static void mei_lb_component_master_unbind(struct device *dev)
+{
+	component_unbind_all(dev, (void *)&mei_lb_ops);
+}
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_lb_component_master_bind,
+	.unbind = mei_lb_component_master_unbind,
+};
+
+/**
+ * mei_lb_component_match - compare function for matching mei late bind.
+ *
+ *    This function checks if requester is Intel PCI_CLASS_DISPLAY_VGA or
+ *    PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is the
+ *    grand parent of mei_if i.e. lb mei device
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (INTEL_COMPONENT_LB)
+ * @data: compare data (lb mei device on mei bus)
+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_lb_component_match(struct device *dev, int subcomponent,
+				  void *data)
+{
+	struct device *base = data;
+	struct pci_dev *pdev;
+
+	if (!dev)
+		return 0;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
+	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
+		return 0;
+
+	if (subcomponent != INTEL_COMPONENT_LB)
+		return 0;
+
+	base = base->parent;
+	if (!base) /* mei device */
+		return 0;
+
+	base = base->parent; /* pci device */
+
+	return !!base && dev == base;
+}
+
+static int mei_lb_probe(struct mei_cl_device *cldev,
+			const struct mei_cl_device_id *id)
+{
+	struct component_match *master_match = NULL;
+	int ret;
+
+	component_match_add_typed(&cldev->dev, &master_match,
+				  mei_lb_component_match, &cldev->dev);
+	if (IS_ERR_OR_NULL(master_match))
+		return -ENOMEM;
+
+	ret = component_master_add_with_match(&cldev->dev,
+					      &mei_component_master_ops,
+					      master_match);
+	if (ret < 0)
+		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
+
+	return ret;
+}
+
+static void mei_lb_remove(struct mei_cl_device *cldev)
+{
+	component_master_del(&cldev->dev, &mei_component_master_ops);
+}
+
+#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
+			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
+
+static struct mei_cl_device_id mei_lb_tbl[] = {
+	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_lb_tbl);
+
+static struct mei_cl_driver mei_lb_driver = {
+	.id_table = mei_lb_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_lb_probe,
+	.remove	= mei_lb_remove,
+};
+
+module_mei_cl_driver(mei_lb_driver);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MEI LB");
diff --git a/include/drm/intel/i915_component.h b/include/drm/intel/i915_component.h
index 4ea3b17aa143..8082db222e00 100644
--- a/include/drm/intel/i915_component.h
+++ b/include/drm/intel/i915_component.h
@@ -31,6 +31,7 @@ enum i915_component_type {
 	I915_COMPONENT_HDCP,
 	I915_COMPONENT_PXP,
 	I915_COMPONENT_GSC_PROXY,
+	INTEL_COMPONENT_LB,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/intel/intel_lb_mei_interface.h b/include/drm/intel/intel_lb_mei_interface.h
new file mode 100644
index 000000000000..602822706eb0
--- /dev/null
+++ b/include/drm/intel/intel_lb_mei_interface.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2025 Intel Corporation
+ */
+
+#ifndef _INTEL_LB_MEI_INTERFACE_H_
+#define _INTEL_LB_MEI_INTERFACE_H_
+
+#include <linux/types.h>
+
+struct device;
+
+/**
+ * INTEL_LB_FLAGS_IS_PERSISTENT - Mark the payload as persistent
+ *
+ * This flag indicates that the Late Binding payload should be stored
+ * persistently in flash across warm resets.
+ */
+#define INTEL_LB_FLAGS_IS_PERSISTENT	BIT(0)
+
+/**
+ * intel_lb_type - enum to determine late binding payload type
+ */
+enum intel_lb_type {
+	INTEL_LB_TYPE_FAN_CONTROL = 1,
+};
+
+/**
+ * enum intel_lb_status - Status codes returned on Late Binding transmissions
+ * @INTEL_LB_STATUS_SUCCESS: Operation completed successfully
+ * @INTEL_LB_STATUS_4ID_MISMATCH: Mismatch in the expected 4ID (firmware identity/token)
+ * @INTEL_LB_STATUS_ARB_FAILURE: Arbitration failure (e.g. conflicting access or state)
+ * @INTEL_LB_STATUS_GENERAL_ERROR: General firmware error not covered by other codes
+ * @INTEL_LB_STATUS_INVALID_PARAMS: One or more input parameters are invalid
+ * @INTEL_LB_STATUS_INVALID_SIGNATURE: Payload has an invalid or untrusted signature
+ * @INTEL_LB_STATUS_INVALID_PAYLOAD: Payload contents are not accepted by firmware
+ * @INTEL_LB_STATUS_TIMEOUT: Operation timed out before completion
+ */
+enum intel_lb_status {
+	INTEL_LB_STATUS_SUCCESS           = 0,
+	INTEL_LB_STATUS_4ID_MISMATCH      = 1,
+	INTEL_LB_STATUS_ARB_FAILURE       = 2,
+	INTEL_LB_STATUS_GENERAL_ERROR     = 3,
+	INTEL_LB_STATUS_INVALID_PARAMS    = 4,
+	INTEL_LB_STATUS_INVALID_SIGNATURE = 5,
+	INTEL_LB_STATUS_INVALID_PAYLOAD   = 6,
+	INTEL_LB_STATUS_TIMEOUT           = 7,
+};
+
+/**
+ * struct intel_lb_component_ops - Ops for Late Binding services.
+ * @push_payload: Callback to send a Late Binding payload
+ */
+struct intel_lb_component_ops {
+	/**
+	 * push_payload - Sends a payload to the authentication firmware
+	 * @dev: Device struct corresponding to the mei device
+	 * @type: Payload type (see enum intel_lb_type)
+	 * @flags: Payload flags bitmap (e.g. %INTEL_LB_FLAGS_IS_PERSISTENT)
+	 * @payload: Pointer to payload buffer
+	 * @payload_size: Payload buffer size in bytes
+	 *
+	 * Return: 0 success, negative errno value on transport failure,
+	 *         positive status returned by firmware
+	 */
+	int (*push_payload)(struct device *dev, u32 type, u32 flags,
+			    const void *payload, size_t payload_size);
+};
+
+#endif /* _INTEL_LB_MEI_INTERFACE_H_ */
-- 
2.49.0

