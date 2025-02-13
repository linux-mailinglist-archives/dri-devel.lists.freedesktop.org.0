Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D9A34BDC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5EB10EB5A;
	Thu, 13 Feb 2025 17:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ozpfun32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A92D10EB5A;
 Thu, 13 Feb 2025 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739467586; x=1771003586;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=97EjGnabgq5gmzVVi/mKuzmeeht67j0xEyJfQRH1Vsk=;
 b=Ozpfun3229j1QlLBjMXSYBVUVj+m5lEQKE/zky4gj/vzDNWL7F6XcicG
 rYQc9eV2phaJQ+MjQBDLuV0yX7bFxYK8120QXmfYR1sJe0t9AZg5AAffc
 mllZLK1HYhDGp7nYy5P4osH+9TOVjbeRWBOxPPbuvsCzmW4de+C4AVdnK
 WDAcwTXeT6P8LSPygK0kfn6NKH19mKqX2tsD9dx5SPrLaxIHfwXtzmrdP
 CATiQjGcDgWp4e8x7UmkX0KCC/wpVET6e/mgJ21N3eqaTzqIL2XIE9bY4
 ekHAluNfPfqY6cHaacAsvfLLz+s29th/ShymEzC4t/xq5vuqxO/SwdDyt w==;
X-CSE-ConnectionGUID: 1heb84AmSd+ZUuQvfZi14A==
X-CSE-MsgGUID: yNtu5uQHSEulUY02MNK2bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40448321"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40448321"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 09:26:26 -0800
X-CSE-ConnectionGUID: ZTIaLni5Qja5BEhTWAiMOA==
X-CSE-MsgGUID: VB9hdHdLSJGEQhcyt48zUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113069982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 09:26:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 09:26:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 09:26:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 09:26:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InSMj5Ydgoyar36hE79tgE0nnPfwW+JRxuF1xYqAvjX8fwbYrUJBtUZW6MqZWmKjT5ZTYadhPugbO1ULPkq0wkGItdH+GXdBjMxcrNwwrpP2gNCxBgwIpkAOUCfOV7uFfV31ZtB1XaUKhq1AjJymutuN0YpfIbH1FoFbdMp2dGkMOZE7dJL0XD6Z8lUQfDmJqTZ9eod9IcQHH/SncEchJovBKLa/AXhbmW0ePQF3/SABwdrCpZqBGMPAu+punRd2jvFuEQBWrKi1uzwcA3xXJ9jwNX5EyXaIOqcLFBgtVxq7MJtauHy/kFxSBBu7PAchUPaApVlc4lGWWUhVGIvAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNjfETtsUeXnZ6X/fzp/Fw+dwUwSy8GypeVj31lyGL8=;
 b=ZvTrPsEG2Z86mwzGVV2y049PlvIg0e+sljvv+5ZUg1Y4Icm/zTBsQoWfZu5+1fAgNvJHPwUdCT5Gx5yGsMTV+A+iqMwH/zI6+uKHik2z5fw+6nUFY1vzcy0yPl2Zwxt7ZqYEMJvcfnkvA29H+VAur2IKT1nSEWJF354F8DIAF10qINAqLG40UxvNV74Bsbi3+pubtPSdgYS6KdyOp7dQFjFANOFL1OsyP5Vjqz0jmmEtmwm/uI0nrTFO3sSgiqu2NEjoT5JNEk6cQiVgfTkSXTeLiZamUuylrELlV0Pn3h2X3gfcU/I3rMn7imtQMm3lbqVJ9L3aiKW5KymenECJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 17:25:36 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 17:25:36 +0000
Date: Thu, 13 Feb 2025 12:25:30 -0500
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
Subject: [PULL] drm-xe-fixes
Message-ID: <Z64rCicgpBe_t5GY@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: cc50e2d8-aea0-4acb-85d7-08dd4c536de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9XN3GCC+dE4+ZWZl0zrlO0mp0SblwZ0AtiZQrLNKfGuOilOD0Bq5+yxOWGn2?=
 =?us-ascii?Q?tT81MO+m/28ZpPQ8YN4W9k2h/oPxM0WnRoIzgx9JYmfflxkscnSegn+j1JJP?=
 =?us-ascii?Q?7JNJ/1+TDj7HcnCF04XwqF9pYlFcc9kK6ij7hIhgOq4Z/ge4mfGlvjlMUbzS?=
 =?us-ascii?Q?fKtPjXIu06NIfOUWqhbrjHCMUbCkBsPpnAu3fDSWHcDHJFRcUwMBcF3WPns1?=
 =?us-ascii?Q?blxIYy7ZodBC0xuBdLhf+0E19QnCvZwr9jSEMWX97sr06xqhOvhx6doLKdQ0?=
 =?us-ascii?Q?cmewvqsN8dy8csBGS80YDJemwo4Gme4EU+FiRXtU8A2KZh12xH8xzUVEAgN/?=
 =?us-ascii?Q?g/yrfnfTctOylEEX514PLJvGgNidpxmBRz8AalADCzh4UCpEUsRj3uWUzAAD?=
 =?us-ascii?Q?1tOI0zSiafGToO3+BYnbC/i77O7wecLUs2uWS5hCilndcYq1dMEz5VZkV31t?=
 =?us-ascii?Q?wU3l3iZrLBItwDvRVysle8BDciGlsvUXXw3V0A7MtZX/vwdaBfoNDCDLI8AI?=
 =?us-ascii?Q?oMq14FDeBbD/GEuql3vqfX6UJqhvft2wJ7ifNKqiUdWNcO7+9WrngWwL9TjQ?=
 =?us-ascii?Q?Lc1GsanNIo/4YK83sp/QrlfutUaMczQfKbwWeRYkOKAgY7/As0PFevSVqnsF?=
 =?us-ascii?Q?mOj4QjQOtgmMNtm9u7ppIn2YlufBimVrHYphyBBoT5gqjunyotuUQM4cT9Xl?=
 =?us-ascii?Q?UXcujf8LRyWLcZ8aqIWYmzMi8mklruNX0uH+7yc91jt9/+swWvG0q4GdSpy5?=
 =?us-ascii?Q?2KGBqoOLIEnfKNsUI6ts8C1VMX5AwcDwcRmvjHi+D/rnVsiN4deEUgzmzqEm?=
 =?us-ascii?Q?kU6Al9PJ1XhJMGzStjyeRm+pwG0/P22HOQKYs1kPtADjTtGXMHC7RLxjlQ/9?=
 =?us-ascii?Q?63GurniVrzFPTuAw4u0k+Ycr4jw9y8T4cgt+fFgvjk9jv8ngUmucBICSsj9+?=
 =?us-ascii?Q?LMkzJLMK+NMJ7L+gunN8m5JRXOiSZdsKbhPHzC2jUlzzefR+obMRWzYtYQLV?=
 =?us-ascii?Q?9UuTevIkBIqG3bLyXwN8o7NFLJMc7MvaV5/4TJGjTbgfmZvA0s9Zv6DyFYPD?=
 =?us-ascii?Q?Ty155UNATRMEeUmhPFI4Aj0WGvu8BotroqI7miecf+mUODG39m3LBFWJ46pa?=
 =?us-ascii?Q?mUSiGSuXNvzGlgiUwSD49stSRl+P+D5LTPMG+d2ywYlmfmjKbRyU+IEEVsPi?=
 =?us-ascii?Q?T2QuBIhIeROzNDNH9+BoOVPq5Q/qFMLFYTP7NotXdCCha6qfMmPTWriszdsY?=
 =?us-ascii?Q?RSpufWsKYv7rCH+6KWlz6h3WVIijmygyonZ0uJ8ClNR/jsHJaDxZIl+pwC3D?=
 =?us-ascii?Q?2VBPsQvI+KzTQAi32eVFkTMMKCdb3etCu9bPLfgCcltpbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucbnsIhMtKnZ8P/Cwoa2ZywJewjF9FNbYf5xgOkAR8phfxvSAiWWEgodwCZB?=
 =?us-ascii?Q?RFU8daDoXpmH2fvguWCWlT27Y9SSjiSfFEdsrZBCXqlm/AB1tW4kr2ZXeqv1?=
 =?us-ascii?Q?7XvGrD0e9HzP73SfV3LhG9KFL39PizrVuBR0DbbP/RdqRkdZP1AlQmPoHwmy?=
 =?us-ascii?Q?K2gBGDpse3Sw1Zh+eQYS5L5/c9sur1ytPBnY2Xpg8W69SPUorFZ56Bh11aK8?=
 =?us-ascii?Q?ioI7uOYntfEusvz3sJpLKs9Fg4+7BVtmEa6C5E9WhCOy2sPPyi7B4BRabjAm?=
 =?us-ascii?Q?jqeaOz7luCajfPZRAclIH3jtpAm7fwEdWC5y9gjEeak1D1tUlhgms4UImYmb?=
 =?us-ascii?Q?rzBoYNA6Tkd5NdIVjXF+TezkuoMWezBAUQ+58StZd8+SPrvJs8jryqJkeSz8?=
 =?us-ascii?Q?sYKXxlIcIfaLseT6QBJeRS2Vv2ISdaRo3hruiJskM9k3c/cKCIXdm7eSV9Ay?=
 =?us-ascii?Q?psZPmjB8SsLNBTAribtvjb1pMkOR6q95QrKoBBrq4jNZcV6WDHPnOqUtzrYo?=
 =?us-ascii?Q?5QMbCWe244afEYGtbc0Knpe96E37yYpDb+iyIX0sB1bIZNptdanrlPn8IuPv?=
 =?us-ascii?Q?OBgaIb2iRJwBLnezYLK+p/Db3rE4waqBhYWlrhio72Q8BDfeiy3vBtSmn8fl?=
 =?us-ascii?Q?QZkacCrRXZyZvg1eDqapJDKA+Rvb/PB/sqsrZCgTagcwouy16I9it6G0kmbb?=
 =?us-ascii?Q?fo9/wOYP7vtFqI3Y/2kj+A6ZxC3Pl6MrDBwjEM5n1nAsN9NFgR4e2wz0NEZD?=
 =?us-ascii?Q?yIbzirwKpxMI6NmGbweYpU5iYj94ALeI+PjBIYuizyVTMgjBCKk4hjojxp1l?=
 =?us-ascii?Q?r+mcUi4oPVsn/4fLkYOmglrUYtV3CxAHNRL7nFblMKz5YQYb3jnZc6DsXTJh?=
 =?us-ascii?Q?yR+5Vi+iUmP+Y4kb2+lcegmXvW10ZtMbYE+188xU0lzNmlITPGLnCYq/zxAu?=
 =?us-ascii?Q?IDs34JzJ4iP/T9hzT6QBjzzwuXf4CX+SNCuVrpGXi3OjLE2lcyfg+aUm+Ww7?=
 =?us-ascii?Q?NV2MZVI9e++8luFAFSSw7/vUIWVVKNAcYJcFwXh3MPD17B8sG1voKX3OTVww?=
 =?us-ascii?Q?svGAAsi23cxbXcE6z+yOgtNu38r5oVVz39vs9TK71YG4LUPl71lJYEycya2p?=
 =?us-ascii?Q?1gvS3yimnsglJrJFYtn206BxD9YnTOrDZVz7UjCt3obHbT8uSvvafLkkNjIl?=
 =?us-ascii?Q?Tu+S0QBkjjKb57vDJ6bm/BZxZ8jWRrNVMLGRg1waZEdgaIUufcrRCwKfS5Di?=
 =?us-ascii?Q?7pviZSpJqRXtIpZh4sbNZOxa20Yb3tUAxcFerc0fdPYD5ERRG52dFi7jJEP/?=
 =?us-ascii?Q?1Id88KaVo1UaM4KknokWEsQfoxNqTQpx4rej2qj3xF3mVz/q3MXWQoaZkX+D?=
 =?us-ascii?Q?1T7cWE23EAdY97k0GLTzvj1tvChe87+KRJgNHVEpX0zketWLcaCL8XZlxyv5?=
 =?us-ascii?Q?tyotMzsBFDvoCw+9mvUzzMZgXt5eev7PMtv1vfXzcUhWPMRiBv19VSsTcfT7?=
 =?us-ascii?Q?vOgOGNT4O0cGtQiREjHRtuA8UXtnSgtlwEmkiJGAcglPBCrD7xNo3qmPQmeD?=
 =?us-ascii?Q?zc81lysKuYmL2OwSTj24ry2/yAcTXhPAb2mriIKfH8kaeYa+k0XyeZ6etcG1?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc50e2d8-aea0-4acb-85d7-08dd4c536de1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:25:36.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JaqN1UothOrNG5xZ0jf7MP4nXUENiU1iQQ3sz4zC9vw/VTiVdh160wDzZ8xAbMb4HhHLwqqG7JfE6Glt997oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
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

Here goes the xe fixes for this round.

Thanks,
Rodrigo.

drm-xe-fixes-2025-02-13:
- Remove bo->clients out of bos_lock area (Tejas)
- Carve out wopcm portion from the stolen memory (Nirmoy)
The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-02-13

for you to fetch changes up to e977499820782ab1c69f354d9f41b6d9ad1f43d9:

  drm/xe: Carve out wopcm portion from the stolen memory (2025-02-12 09:08:24 -0500)

----------------------------------------------------------------
- Remove bo->clients out of bos_lock area (Tejas)
- Carve out wopcm portion from the stolen memory (Nirmoy)

----------------------------------------------------------------
Nirmoy Das (1):
      drm/xe: Carve out wopcm portion from the stolen memory

Tejas Upadhyay (1):
      drm/xe/client: bo->client does not need bos_lock

 drivers/gpu/drm/xe/xe_drm_client.c     |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 70 ++++++++++++++++++----------------
 2 files changed, 39 insertions(+), 33 deletions(-)
