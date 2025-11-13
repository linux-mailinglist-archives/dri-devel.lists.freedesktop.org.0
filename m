Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C33C57A82
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 14:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B022B10E198;
	Thu, 13 Nov 2025 13:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkovbtLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E3210E152;
 Thu, 13 Nov 2025 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763040588; x=1794576588;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=EscDY9CvWlkzXrT0XvNQKFzI+YAbHwM6UatvMVEHes4=;
 b=MkovbtLzSVIBHAi+W1/Ql9HE73rq0IJ6yO6iXpktmcg/GT6TigZ3l0M6
 FuxQoLckdLBWj7Wr7Jroz7ZiqhrT7pKpNTCTWnK0T1zQNw3NciyNtW2JS
 dDCk803kz5+y0Wm09VQrXY2tXI22hVRxRMd0vZ8VTe6bc5Z22ZyicHY5m
 NS7ELxdR5Al0gN9zRxKEvhMkebTC4ZXAtC3l95VwPZRpdJs58JVj0HreJ
 FTzuNmZgSngKdWB1pPLnHY4+1OUGbt5j/TnZNlPhFT2T1VvHqH1XYypQv
 2I9XwqOW7j3SfZuifoVizHQ7HmH29sa77TNvzMK5f4SoEIEVyIfkWPAf1 g==;
X-CSE-ConnectionGUID: Q6c7WAMKRhSj/Namkhgz4g==
X-CSE-MsgGUID: uAxVoCQ3TKegpE/y3Jzltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76462346"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="76462346"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:29:48 -0800
X-CSE-ConnectionGUID: p7yVCcrmSSWxc6VnPyjs+w==
X-CSE-MsgGUID: wmxP31K3QZq+JiUa0HYX2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188791485"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:29:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:29:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:29:47 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:29:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9JLMTKaYFZllwQKuSMxwpgvgx1C66xYeqI58EFwDssfj5PVpOO2W+H3rUdnNhT/h3jltZIUJamvzdgUxygsBzffxFVeZtUIuQNLUY+MqcNaiphcMQiBcDoayvAdlvemUwitlFzM9etkS5XmwiUvdgrwAo3S0LuVRFl7tVOlTp4eHwHnCCweaFp7EHGzpampV0Yb2PEzY4USedwz4MdNDZf1Bh2/1nfasdwdwL8RLwEnmy6y6jLnyuOUz28An8PMeksOt0IdVJSvrlA4iGpNYyCwGXgLKiR+WmqKLp9u3MyHE/KRZL6D54Cf1BH6jCprbL+KBmNvAdiK2SF206zyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZUARkDnXO7Airq02lE/2NMA8FKrbEL8wFk6MCDQI9c=;
 b=TFM5P79uRFEa+BhNdCE6XUMvvc2LCQSsIqjhEWw3MhrzzqUKLTW/87wMsQAJWwn1hkgLVgnk53g4vnZTsIyCLVE0UXB0pDRgijb4XX7P7nznVyvdETjc7RIL+0q6YCCwR3eQmuTMIicZR5G0tathdxTKkcSdagU9AvVMSbe457+HLZqUMPPKM85FXPC1VIFkQPrblnRIjYMnI828lMw3ng8aZXwuO1vmyVozNALHK5MesRhHsO8Fm7gh9GoqxCy48qMp9n8OKqhaYNe9E4n2CzSXa+yAHVN/A5Fegac0pmbgU/VQW30wFdV/onc7z5pZVcSt4ZzCmoFyKavudrxLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:29:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:29:44 +0000
Date: Thu, 13 Nov 2025 08:29:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-fixes
Message-ID: <aRXdQnitzyFcokhF@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd282af-d5df-4575-167c-08de22b8b51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QDsV3gcqzz1d0+chSbJThrJq5/WsbCxMCkzDTdnwQVvejLIK6ROD/JTuYSCQ?=
 =?us-ascii?Q?V3jFyAh1ZS3ugWcyoyYf/0HInCdyHMy/zfkuZy9jCBj5PD3aZAQvpFZjKKOg?=
 =?us-ascii?Q?hPlKd7j31Ws3GZe7crtSud9AD2a0tAI7LZR59ac3NEqx0/LnG6aMUJKmlM5A?=
 =?us-ascii?Q?pMUA7VChzmGm/QTvUNwmLubM7S2yB/q9BbB3Wd+pXCEU7qma2CO+2xKOmKwy?=
 =?us-ascii?Q?MjpbD0uhllUSEOCtre4IU5mDZ+iNuNHEBtz51jPEunOTvHXGGauk3Hce+XJK?=
 =?us-ascii?Q?y7JzwFRYy+A/AfmxG1E70PwYAJ7c0RznKaWvUh1BCseyIII2b5+2+0XUxrwA?=
 =?us-ascii?Q?G9226KpVG5T9TBQYxC4KNFPSzIYTGyAh0IgjpoxikkG8PM7pxSeMbCn1rkC4?=
 =?us-ascii?Q?7ImkRrv7kHG57D+PwGGEsrePZ4wSOo9KC0pE1cxAi2GB5lZ66xdUm1mnnN8L?=
 =?us-ascii?Q?eeIppCS4RJ+E5UvjXTiL0fuc9JGxFllZB+qDWot4pbfZfxdpk0cX4oXlBwam?=
 =?us-ascii?Q?c1gIXCyzY5pVFwCSU+p0z/VORiN6+gAy9fFhmP0TWwVCS23Mhi7ekiTZGEba?=
 =?us-ascii?Q?4WfClPBHLoQYhsgkqc2M8DNxjpNYV3Y7nwBnlR6ffEwC/c0GxrsN69InPs4T?=
 =?us-ascii?Q?Uxt3EsIbTj+yyorULxXaczMvZAIOV3B/RW3PfkooUaK9u/GK01gK+1FiJ/Gm?=
 =?us-ascii?Q?NoiTmjOl+YMgHvkFqxC5el1ciwP2Op6wFYEAnkRFlgTbazBHT9GepXlb9Qlc?=
 =?us-ascii?Q?+Jkx3Yo8blBYVGViY6Y7zNOy1lLiAOIdv/KzChFt3h6FQ4vRYA5bvSAgvVvQ?=
 =?us-ascii?Q?vxSI6/Zk+1sA6g50kLWFPeWhbuHeSGAo6PHcojbo2eBEWHNeRQNn/103VWy7?=
 =?us-ascii?Q?zv1uO8JkiGIKh19BOhJz2Evtge9JsUK+K306blpTI/qde64fZ0Y8Bc1V/6bf?=
 =?us-ascii?Q?KPDK0igyJHCzZSmxUw1qyn8Jm7vSLfglCbb2eVE2r6WrOOLgkMU++CHagTyy?=
 =?us-ascii?Q?bLIhh8XKZeazJoaGQL0a6ARu+vKaVLgkYaeLySObDFEJe91khb4fMQGVZw6q?=
 =?us-ascii?Q?J7jgQsdCFKa0Hjnm3EybBoxIOMwTa/ufM2kH1deZjQkhmQz6i5wfVzCzm1tR?=
 =?us-ascii?Q?AmYjI3ax4xUbZ5o03EkehZHNSiuVX61g35m5xUqA/O9y0+qSTtLpAN4ofmWF?=
 =?us-ascii?Q?Q5fi/sxIK+BfTBL1FOjB3xlig1DJ8xZFAg2eJOzD8UTDatoQD2JdBYk13Apt?=
 =?us-ascii?Q?ms6WOyhMmWQdhxZfxVG8mu34ChFrJXdxlC+h/QzVJKYcPCz3iRoDbA8cvYiM?=
 =?us-ascii?Q?YTR+FLGim9MGSfXgSYyZuagJTQjJOY3RKJDCguZ0bax2r+4k0x6ECazormwg?=
 =?us-ascii?Q?sMfhDc+GJoH3Me3HrVm01NWMznbffVI8Cp1roKUIWKLYUBK5Qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2LPOyxaDcByo+NvkUcrkaTnynSL+wY+hZzag536tSsMUJTIH3N9hyvqOX+r?=
 =?us-ascii?Q?mQCaw3BniZpPpvPONrEK5ZbAuWyhXv+/ofZvjMMnCVh6ACOO4vZuAbMc9157?=
 =?us-ascii?Q?M4KsHCw88AWaJlo7vEMg5GSBCBpsf21uPc22ciBJiuAAm7qLeGafHKcItrkH?=
 =?us-ascii?Q?fuP9upVvKnb7XUHvvsPl3ho/RxCz19OFfr01rOjl75em2+j4YNydonRWZFfF?=
 =?us-ascii?Q?NNsEiU4pJk7FRzLum1jjHy4PspQTvmFBRqNsNXvAi2zmfizJ5Sw+HsNkLp9C?=
 =?us-ascii?Q?LSl27UQXz92kzRJLCZYU39dgrEQ6xTuKyy+yrsNtMwK1egEn0POuGk8fUoB6?=
 =?us-ascii?Q?kj6oIL6cilHbU5KvuND7BIVUUYdJ4/jArJFvEkNdvYlMhKaLZtY20lxNu518?=
 =?us-ascii?Q?H6ngjbNU4MXQETUtoXDd10JnG8kvCYHfW/cygs44SLuA6OXMosbINscoOgrj?=
 =?us-ascii?Q?ndn9nSWFXswXJ8FMng1Qxa/MqA8/4s0CEzMvgLfpc2wKK1/DLDIRtxmiH8Zi?=
 =?us-ascii?Q?Vqv6BRe21LFAQzHjA99wRfCcvpVmJe6FDLgPt5LE1+k/jCB/8/ngegDEFoj7?=
 =?us-ascii?Q?bPyqJNY3FJYO242WJp9RqemP0QB1LverwwqeH0VpR1AqkEiKrP5GBJ0LE1FE?=
 =?us-ascii?Q?Rp7kx/C+K6KCPRZl/PfxXp80qS5aAV9Gum1Qo0KXYAuqZilVZp0+CWzq1J2E?=
 =?us-ascii?Q?qrzIdKf3XzM69IXgd3Os5NBBwtULcotv9ikvSQoazNuq+UHMkjjI1tIOTakX?=
 =?us-ascii?Q?SAdyREUmpnRRkJtS9TneEZ8c6iv9lRquvnB8JEYp5va05/clhkaR7EZiWpk6?=
 =?us-ascii?Q?ioB2XbiY8zNBCF5uro7aei8nJE6Sow20Mk6l6lqB5rohWWgkBTucBW4qp100?=
 =?us-ascii?Q?GtXroVHwDx8q/Is63RXuRrNjmFR6HhnMYiFIA/bGvXTF50rUN7ErwuOjR1JG?=
 =?us-ascii?Q?uoQdukmGm5jtWgpHS59pC1MAMiQI2Yhpl8E7DC7R75kTxi4k/bi6p4UT8JbP?=
 =?us-ascii?Q?MEjVJi2/5+MjruFWhiVK1rihoisMmtYMCjocclqoKrKF/Fa/f1EzF9pFvH31?=
 =?us-ascii?Q?PbAol7as2qhWLeQXhYnsFzE5rux7hYiJLXBSmQDnE4Mk1SXaJLqEhQM78xZX?=
 =?us-ascii?Q?a6F8ttp3TAYlqi2sXBfOibCm1Um41hJbEOTKJbXZI/o8LQPm48//hHArrQou?=
 =?us-ascii?Q?iAiiOCvLytdqmu+p3Iisyn8XeC1d8a9KGo8olhuiI53LaybvT3KDwMUA8nxj?=
 =?us-ascii?Q?odfePGrNXVuAHuIlXLxAlolSD3HtDnN84ekw+3CYLQ1+Fb2qMKlfNp3EZ+RF?=
 =?us-ascii?Q?tPYViAo6eBhj+J3udOxerpJQJGWuL+9jG9A/bnps4RlH6Oqc+ymBAjs7NuBR?=
 =?us-ascii?Q?UXku8i5z0dNJ/MbBo37vXxUabf+LjrnmKvEmEUm7gBJ2HJUmNYmsGD3XNcnP?=
 =?us-ascii?Q?lDFn6u7gwA4nwzzbsCCayYpRi7e4XtuADAUW+EVDdupBJfbxJtBbuTd4Ls29?=
 =?us-ascii?Q?nwPpE8aJkO51WtM8//U7uoGDl8ZTkZ/iKhq+CEp58AuRaJ42vaZ0NgxmvtXT?=
 =?us-ascii?Q?eMpS97Uj1PvCh0c4JyfIli21sy9fSIVcbGmSlyOomIXd4RSJfKI2prMEji4q?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd282af-d5df-4575-167c-08de22b8b51c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:29:44.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW2l7Q7/YZKN1Q7A5/8Rdkup+DvFnr/o3u2w0QtzhvXormQ0IriVlw3pasv4rClD0qPZlBaLT+Xqcx24s8FTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

Hi Dave and Sima,

Here goes the drm-intel-fixes for this week.
With only 2 display fixes.

Thanks,
Rodrigo.

drm-intel-fixes-2025-11-13:
- Fix PSR's pipe to vblank conversion (Jani)
- Disable Panel Replay on MST links (Imre)
The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-11-13

for you to fetch changes up to f2687d3cc9f905505d7b510c50970176115066a2:

  drm/i915/dp_mst: Disable Panel Replay (2025-11-12 09:44:54 -0500)

----------------------------------------------------------------
- Fix PSR's pipe to vblank conversion (Jani)
- Disable Panel Replay on MST links (Imre)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp_mst: Disable Panel Replay

Jani Nikula (1):
      drm/i915/psr: fix pipe to vblank conversion

 drivers/gpu/drm/i915/display/intel_psr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
