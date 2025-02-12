Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F2A31D9A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 05:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CA110E7A8;
	Wed, 12 Feb 2025 04:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+UC9762";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E29510E79F;
 Wed, 12 Feb 2025 04:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739336245; x=1770872245;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=AQpPbs3ANiO1zq2hKzoZ8mztP1k1Qwws2zEi1j6lenE=;
 b=e+UC9762Mw7qz1OfSbcJ3blFbeX9DR0IP3izwUbfECMssA0sPtMWMuKb
 bQr1dQt1CQmNeGh3RVZEyBX+615/Qn74mToqkA0SBL9Eyi3NVAXkuXNuY
 Yxm8a1xurMVhwBThLicAvO8Ku8xV4Ikoh7/DcwH15zk3PTsxMDQBacBBc
 H0KJEJRartyANwNF+wLEKT6YZ3Gi93PBXDtqlUOVW1PdxFNJioKBQU2Jw
 T6mcP8sIRucMMYu3EMbMRkeJT0u5Nw8nqohIOwLh4vupPOGmb9hE/R6hE
 AkeE60qMVLOjIPr+dzKjeOvj3alFBJrnkIJhU1mKVwSCV4OkTzuwEjydT Q==;
X-CSE-ConnectionGUID: DR3R8ejOQ9mM5cX6RBoKig==
X-CSE-MsgGUID: N5k9XFyeTJmrHU1xJiJt6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40122056"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="40122056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 20:57:25 -0800
X-CSE-ConnectionGUID: iVq0sBg+QEqvWFSfYrLTJQ==
X-CSE-MsgGUID: 6kJ4X5b+S2OKsq0KR4WeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113608302"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 20:57:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 20:57:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 20:57:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 20:57:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKLj7DOMTgx0hPSW8+c0iJIr6MMT2h4jO+I8QvYu6Hug5c2r4+PZXkY48OZE1wuHPqZf1GpYu5tshs+ELjYqhdi2Fatw+j1NmMEx2AzvgBnAjJRrZyH2aNYHQJavOkRLbGbr6OPHaDW8d9noBiOHQZerxJwD7ZIE2t5LHV4Q1Q6U8Fl/lvqApGmwxzf1YgyutgRNxN4P6JHevhLtCmvbglfAQ9gJZpIISIfLPzw4QIsWUlamrdwn7/bIkoNTig5zeeUWZGUQjVDY6D4EWK8bx3OlY34FxpeZ1C/2ksZgLPkZ+JuGeA20J+UnkYodOHXlKWpbXhMnQ8VaAy8x7xHIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xS19ITpW6p3lFQ69S9JrjzYnurvyZFlE9K3RIGnEBE=;
 b=nMI92rH0fDDDf8rVdmxegIxVWxm4KvaLE3lDWEZ6/L26BJk+cgwBWW5rEr7jyLGF3/jQIi3zsu/W1xgl4//nfqrb9rDqDINc/HHw20Hro8YA8JrjT47FmbCtzRJvHQVt/jffrw3KwzlDdoczM/8cOyBU5z8ftA7R/rRwPNcKycT66Xmkl5szkWEmCfRgMAOHv2n0zrYnt20M/RJfk5XRjv559uU/fYVW2jQ1/A4JfqIMEqqjljBHzaSJALFj7trjzFHrLv9lOlXMecMfZFhy6/SmvKZXXJLduNhX8vtC0QtN1GAg02G3tE27ZAgyaFZVCsoMSHzhq/0QJTUCEFJEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 04:57:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 04:57:21 +0000
Date: Wed, 12 Feb 2025 12:57:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, <kvm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
 <intel-wired-lan@lists.osuosl.org>, <chrome-platform@lists.linux.dev>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <virtualization@lists.linux.dev>, <linux-watchdog@vger.kernel.org>,
 <linux-erofs@lists.ozlabs.org>, <rcu@vger.kernel.org>,
 <oliver.sang@intel.com>
Subject: [linus:master] [treewide]  b04e317b52:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202502121025.55bfa801-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: c46323ac-296c-42bc-785a-08dd4b21bb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uo0w6I6vEaKTOCsL7J8ifJ45cTTuQ7UqOValydjixMDw3twVrS4OVfepdsDw?=
 =?us-ascii?Q?PcyRBJ07OcBrIf/LxcwO/99xJKp9q0UG29kWiCFHsxg6fpaJa+Oz4o5aBLl1?=
 =?us-ascii?Q?3rznIjpUm1kISONqnkSnFlac+Fr2j85zPQiKhlw9az66GnuRfky7G7GJnI0A?=
 =?us-ascii?Q?E+LmTkYnsVET7KtAFJthQuNXyp846a+QPGAkwYEoTPuneoan5UMt8CmzZ4Bm?=
 =?us-ascii?Q?PGSdCSfNHSORQ3nELCE5IoWY1O12yKyZOioIebPLhVzYLeQe7ltUV7TxO7NB?=
 =?us-ascii?Q?1Y31gxPssspJHy1rQPtlnPkxLQ6ipFsvp7smEw4wETmrpj+RsElD3MItteKI?=
 =?us-ascii?Q?HLq5901/2WweX8xqFcUOrMUydVquWbPktX2zxTv7+STmLBpUAfHGJx9wPm2Y?=
 =?us-ascii?Q?t3vi6rg0W6AOLMRJEsW3ZyobsLab8zfYT2J+m/DNmL8Wub0xShPZ/Equrk7v?=
 =?us-ascii?Q?oMxvfvwJmuNkWzg6QgNdlqhczdn6rHlgfRoJmtXiM3+FyEvX+JgAsaBKr3cN?=
 =?us-ascii?Q?zzQdHHp/h+2L1BrnRCgnKwmRrvv3Zo5hBDHAICua8UY8QQLY6E+TOpBuczJb?=
 =?us-ascii?Q?uGJSJDdW8lvhXl57ggD2fjDJRRghlTrldMYRDwjvSKc6GTCyXi7X1r3G0cLb?=
 =?us-ascii?Q?AimKgWsXQnIDu9KRpYiYqytOo5OPnomE9kzKlxTdyhTXenvFRqo1YjqYppOA?=
 =?us-ascii?Q?ElkWo4Jio+ThalcuafQd95MXdjbsc/HuUYBtT2dD9Fz0pJ3DOQKtmijV5Ovc?=
 =?us-ascii?Q?o7cALViBOWMmD1k784EuIu94EuhRHfeYoTA567j4Vx0ZpuqP1rzPmbieRXVp?=
 =?us-ascii?Q?ooTTOvT7sedV/V8LQFCE+sdJeaOrZBlXUo7egVjtCKEGtnCgnoU8avPHbbtx?=
 =?us-ascii?Q?pAN59K3QId/lVaP4Igc2wD0YcgTHnR5dS8uamFQa0cIJDGmcRk85gbzTOi2d?=
 =?us-ascii?Q?PDZglBkS+0wrxllbCQz87gtFV5kcAKqTYRGTjYBfqVu7gKSJEHFGob1h5/Sr?=
 =?us-ascii?Q?dsJSTZH6ZU9w82PCl6c7aRcg5mUiyfX5pl+14LRRrNhM37QF+BlCSn4lzFTc?=
 =?us-ascii?Q?g89pe1eGkrcAfAXybcl4bs4r1S1h0sInVBFTDSz0vq7qhZoYzx6CcDyCO0YA?=
 =?us-ascii?Q?fM3yb5SQOLQ2SosVItpZv99z02frAPl8Ya0OItxnfUJRNS1kKNTB9Zqh4++R?=
 =?us-ascii?Q?AgjA/6/dv52kckc2NEDO0wZRmLf8o7dMXqnSpZ/kVsP/jf+dAnVldB7Z7pNM?=
 =?us-ascii?Q?iDOl7LsH8MLafJ6UkaVsAhdIVf/Z4fBgEtX8oAXl22JcHEvbmGlVHMSdIUE8?=
 =?us-ascii?Q?qFrzxZ/Y/XMbQrOwBl1wDiZZYzTRUi506Vh7xI1JhYRwGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zrKrFoT4L86AWYuH+4n/i+5S8HqBpf07m7dbtjR2bNubIPSfZD0CxtYiWnGI?=
 =?us-ascii?Q?IZYTXsIYzwHfKJwpQ/bMO/St9qOKjiyDE9yefNmRWqsHbTjZEXSb7taSbCQN?=
 =?us-ascii?Q?og5mlqxO97K36cVDO/bEb08/Xr9YVMidqiX+q6LQot08/Y1Mdavzk/2wb0Ul?=
 =?us-ascii?Q?eONBUAEi5CvvN5yxSRg+2yzZHtjSLIGkC7eIXosoCubODr+GXoId2Kl2dYiR?=
 =?us-ascii?Q?GBqP6AQQgf3v47OvaqLhy2jiB/fGJm05fwHDvyUP4BIyZrHAPYxPvjjDYwbI?=
 =?us-ascii?Q?Tqf+xQCrfLDR48HYbugCOUO0ByYZCB4KfM2raXDndeWQYocG+5FwBxCM9/gt?=
 =?us-ascii?Q?RpsElh6ziUsMIJv0tgoL8gAd5ra4a2dG3SuqEowlqLRlw/g9gr33oOn+klaP?=
 =?us-ascii?Q?Pz1yyu29HJYWzhgA3MlJor8pbLNKsQwrdAQavL12BkJ/f/hbgVAa3GMthBTm?=
 =?us-ascii?Q?iyxl5hXShF4y4Y/l1JWPXKQ48dUy/HXWZIZ4bBlp/ERV694qTwVLCG/dE0eT?=
 =?us-ascii?Q?Qq0sar7zOzrqHmqeT44C3wWkOfdv6Yq9LJTbfTjxxbC9k/mVZIaWgeBM1rdL?=
 =?us-ascii?Q?cSLrAwqvB8KRwrGPhHEt5TfFCgKk546ho1u1w28kOLhnPincavBJIHZdywh/?=
 =?us-ascii?Q?fmBaJufw9XzebE2AAWIo//oLG27Aa8z+czUrDEN8EoWTULL4OlOSzg+WEESe?=
 =?us-ascii?Q?33UE7E2S2rU20bt+zPAJ8W3hmplA1W70Ngdy3dusV5l8Y+Mp1GYn6J1csKyp?=
 =?us-ascii?Q?fyOdiEvOEPYC+how3CWISze2NYRurdV+reYXeB+mERwnrXuKNyh9TDhkfzez?=
 =?us-ascii?Q?Qjg6etk+wglUQvPh0yeURScQWDkhZuhzKr2K0ayIDWti2iiZ2wMJHXaicpxz?=
 =?us-ascii?Q?rDDelL1nq1gng185xUrdqLfaB14V17D2jQra/nRyzrtDr9gCbzGyAIYd47SQ?=
 =?us-ascii?Q?+twN0sbDFcQ1Ygw2aUJ+q16JANTTiBdNHSdWWc8iXoTTVcpUh7YC6YbGca56?=
 =?us-ascii?Q?GpHfaIwvBJHzCOB8mxalwLmgPRol7bursofdO6I+nxWEozermfdqx430ihHY?=
 =?us-ascii?Q?FuuE0Ml447SuO50C4yWZCfkoLdbXwKCI2vwKhbKNwNSrwTi7Ia/y62Rf+CW6?=
 =?us-ascii?Q?qQtXn0NHnt/FN+cPrz/P7JAc3nR9MSDW+ZrWR4QOHHsdqDz1j+uYCm813zli?=
 =?us-ascii?Q?lCg+RQ1Ll9a02Z1XgPvlOFf4UQHWOA6XDNO1bozzEj7vScdCG1xnc9nVIRAw?=
 =?us-ascii?Q?95X3RJ+ULbOzzn38nA7ANxAgyZS+6yAEt0bFPYqbTWero443GbTVzA6X8KVb?=
 =?us-ascii?Q?Y/YUTyptjMOiHkZqBYLznIQZo6yLm8VX8io3tPPNlMXfqcqLTclejBZ3HnRf?=
 =?us-ascii?Q?2c3VYENz1vPWtZtYl2JLBkZ19E9yOwO5vY5MmJiKFy2yIqomrUOBN04EALgv?=
 =?us-ascii?Q?Ikn5uuyWY2y/6MzzJ82VDvTbva1LY9HakhtJ1VhPZx0wd3cSVtCiZ6hOQPaN?=
 =?us-ascii?Q?9vi9+iLOJMKetZUBETrR4dH7fHhmLTGtDqDnHAKWe99i6oFnBl3RQJfMG+KK?=
 =?us-ascii?Q?odjtyn67cplQrrV4FDt5AfAgflHlHWDET4srGm3FaAT+DakLoxJLdtQTndb5?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c46323ac-296c-42bc-785a-08dd4b21bb95
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 04:57:21.0389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyN3mmZxBrwyJ6R8ZuLzRn9HoAcyKcqw/XreDJlhnnDYmw3Nn/aRxGMumgMEHGQ+sJiYnz2JYqc+wINeTP4EZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
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


we noticed the issue happens with a low rate on this commit, but keeps clean
on parent when we even run the tests up to 999 times. just FYI.

41f70d8e16349c65 b04e317b522630b46f78ee62ecb
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :999          2%          16:999   dmesg.INFO:task_blocked_for_more_than#seconds
           :999          2%          16:999   dmesg.Kernel_panic-not_syncing:hung_task:blocked_tasks


kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: b04e317b522630b46f78ee62ecbdc5734e8d43de ("treewide: Introduce kthread_run_worker[_on_cpu]()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      7ee983c850b40043ac4751836fbd9a2b4d0c5937]
[test failed on linux-next/master ed58d103e6da15a442ff87567898768dc3a66987]

in testcase: rcuscale
version: 
with following parameters:

	runtime: 300s
	scale_type: rcu



config: i386-randconfig-052-20250205
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202502121025.55bfa801-lkp@intel.com


[ 1023.501569][   T32] INFO: task UVCG:82 blocked for more than 491 seconds.
[ 1023.510932][   T32]       Tainted: G                T  6.13.0-rc2-00014-gb04e317b5226 #1
[ 1023.528506][   T32] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1023.551252][   T32] task:UVCG            state:D stack:0     pid:82    tgid:82    ppid:2      flags:0x00004000
[ 1023.582336][   T32] Call Trace:
[ 1023.599286][ T32] __schedule (kernel/sched/core.c:5372 kernel/sched/core.c:6756) 
[ 1023.617204][ T32] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 1023.637326][ T32] schedule (kernel/sched/core.c:6834 kernel/sched/core.c:6848) 
[ 1023.653175][ T32] schedule_preempt_disabled (kernel/sched/core.c:6906) 
[ 1023.672095][ T32] kthread (kernel/kthread.c:453) 
[ 1023.684220][ T32] ? kthread_flush_work (kernel/kthread.c:970) 
[ 1023.700611][ T32] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 1023.716756][ T32] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 1023.732758][ T32] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 1023.748605][ T32] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 1023.764004][ T32] entry_INT80_32 (arch/x86/entry/entry_32.S:942) 
[ 1023.776959][   T32]
[ 1023.776959][   T32] Showing all locks held in the system:
[ 1023.803410][   T32] 1 lock held by khungtaskd/32:
[ 1023.815913][ T32] #0: c3baa3d4 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire (include/linux/rcupdate.h:336) 
[ 1023.842061][   T32] 1 lock held by in:imklog/227:
[ 1023.849815][ T32] #0: ecd0e884 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos (fs/file.c:1194) 
[ 1023.877481][   T32] 1 lock held by dmesg/494:
[ 1023.885260][   T32] 2 locks held by depmod/567:
[ 1023.903871][   T32]
[ 1023.907007][   T32] =============================================
[ 1023.907007][   T32]
[ 1023.938278][   T32] Kernel panic - not syncing: hung_task: blocked tasks
[ 1023.951013][   T32] CPU: 0 UID: 0 PID: 32 Comm: khungtaskd Tainted: G                T  6.13.0-rc2-00014-gb04e317b5226 #1 78ab3595737b7bb7ccfbfed5c1dcb65e25af99a7
[ 1023.973770][   T32] Tainted: [T]=RANDSTRUCT
[ 1023.979010][   T32] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 1023.991787][   T32] Call Trace:
[ 1023.995862][ T32] dump_stack_lvl (lib/dump_stack.c:122) 
[ 1024.001535][ T32] dump_stack (lib/dump_stack.c:130) 
[ 1024.006622][ T32] panic (kernel/panic.c:258 kernel/panic.c:375) 
[ 1024.011360][ T32] check_hung_uninterruptible_tasks (kernel/hung_task.c:239) 
[ 1024.018678][ T32] watchdog (kernel/hung_task.c:398) 
[ 1024.023798][ T32] kthread (kernel/kthread.c:466) 
[ 1024.028697][ T32] ? check_hung_uninterruptible_tasks (kernel/hung_task.c:380) 
[ 1024.036601][ T32] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 1024.042763][ T32] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 1024.048431][ T32] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 1024.054588][ T32] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 1024.060422][ T32] entry_INT80_32 (arch/x86/entry/entry_32.S:942) 
[ 1024.067908][   T32] Kernel Offset: disabled



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250212/202502121025.55bfa801-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

