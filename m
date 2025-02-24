Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9DA42C00
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 19:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563C910E4AB;
	Mon, 24 Feb 2025 18:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZ+yOFCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DB610E4AB;
 Mon, 24 Feb 2025 18:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740423078; x=1771959078;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=UG/CaYZG73Hcea4pvmBUeGVZJnZavqW/CLiHfBgGI/o=;
 b=EZ+yOFCCYLW6lQahO9QdQf1XKYBHSL5wNz1OUesgRfgzR6VfQ8IC5csQ
 1DOiYiP4Offcx0XMV1xuOfi3keHlvp5UrFjUl1NdrFm7Te6+WNReUNxYP
 YDpaQoU4oWGCh04owE2hzfSUJpIA4cLOQbt/5EfKeG33L1z54oN+9FK0L
 r66ZCH4dSZCETHlRJXAj5/GG+0vrBr5iVQC/XueNB06uNKJQQbe9ua1+k
 URDiZhogfW0dHqyYFspVpul5pMB9tZYkl9LvkUS7q3nQSRyszF/Ioz2PA
 Lm0LgDsU+nbGY+WwsM0w56Strv3dl8mz25VBzd6+jIbiGvB8XqGTE4SGs g==;
X-CSE-ConnectionGUID: DJGyd02tSg24P4ZNoKdNGw==
X-CSE-MsgGUID: fTcGIpZ5Seqgf3298KMzSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41106470"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41106470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:51:18 -0800
X-CSE-ConnectionGUID: okLYnCCfTWCf+v9z6m/uqQ==
X-CSE-MsgGUID: lnxmewXBTOSKimG9xHCiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="146981985"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 10:51:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 10:51:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 10:51:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 10:51:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yest2VKr0L6otMOoaUAtWsKQMBXBXG9LtqlbF8sZF9kveWO/cj4djqEtT/lMWYvYmPX8AMi32D3w9K8YwuCAPrSAPRlYDJEcbbI87kq9us2VsPIDZqvSDpH4+WJBi2bUI8SX0XJsBTjZ/dv6/2b+trWxwhkWj12c97JvsDpcvKjb/Ctu4qbu98CuXoHJ2t/9dIO/DplrcSr2RvHLfw9wn5slW215soCKc24zuyiEJEWAJDpebbFPbBwiKzOE/qFAvCHVHJ0FFy2jduBBD4w4ArvfHjGvnh7nqfaVhwvf2Wl3WKyNM3bnoyw3Eg5HCsH1WSGM3MoDKbO7mlXMyitpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBThDlB2QaEe0kDC5jrVT+CEmofCkq/SfGehiFYCp/4=;
 b=FCg2fthX7citYkRumhyc2vhKUJjQ6agbs7PBD6R70He8n1Gi0xg8uMoGcotM+VBp84q3dELSSeLB6SlojyRmubV5DCIitM9S/mTuYeR9N8ZFVuliePHCLnDvGwpHK6x90XmUBqCTRFgMI3KOtRSrvXIDviUaxmnnmaY8HXv7Fz2N7jDuZD+97p4iDKtcPYzxYcfkhbtg8jsZIhlWQhxuYW0QB3AnyNPV6eh9icLN7+rndrRUbaY0bpdeOLn0/QHJwvvwWu8kD3v7plsFbKaCoAl11wrIL9HuOX/feuQHCF558ltStYKmprC83yTmMXhMT8XqgFdn1BvjGrCBN6C+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7692.namprd11.prod.outlook.com (2603:10b6:8:ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Mon, 24 Feb
 2025 18:50:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:50:40 +0000
Date: Mon, 24 Feb 2025 12:50:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <m3gbuh32wgiep43i4zxbyhxqbenvtgvtao5sczivlasj7tikwv@dmlba4bfg2ny>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:907:1::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd84e00-e172-4bdc-2148-08dd550421e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WyFcnxDNlK73nzyxjLWR1qB3JaBAIB9Z3iDcXSnyPnd3rVgZ22m7e5FQrv?=
 =?iso-8859-1?Q?pV16wz+sEKWNuysJW36KspVuwfb9Sah5y/usSULhXbSEARyQUE9enBjEHD?=
 =?iso-8859-1?Q?3tTpcLSrWtz8dOPEbzqtXLNwaR2yT7B6X3bIMYeKF5JBnv8C/oTH1u7Wgq?=
 =?iso-8859-1?Q?O+ibUptyHoVf6OPNgPaBySMea420FwHYKCUyRQZNZdkcvE6wkoI3Ufwnhl?=
 =?iso-8859-1?Q?ABF8p61KB1TBagLbn3DwzdGN67oGwHCbtIpymSRUmhe3/aq+yWGHR+/YXV?=
 =?iso-8859-1?Q?zEo1/klW3RJRXVl3iTd9oIrEpUGVsFZYSzYSpq6jRyezmTEcVjuMGjbcVt?=
 =?iso-8859-1?Q?+K/bYiPuH/gN07SGPEwY6+wEbngYmtw5aVg4TLm4VIvCVQGSoZngEuaBfD?=
 =?iso-8859-1?Q?qjyFqsQYhTetLAe0hP9yq7XFOsXQOL19CcVSZTcPRtGqvFNSv4ulajcrfW?=
 =?iso-8859-1?Q?lPXm06t7IAEgsvnDfb2zsaoKEx8Q9YxCzeVPfDK0QifJgiURFz/LwDp85I?=
 =?iso-8859-1?Q?GFr2M+zkZzqsnfM5emWc9gQk8JohLtRX1l4vEH5aQ00s7RZrTY4/L9jhxn?=
 =?iso-8859-1?Q?fAwZ8oV2GI7pBqERuYQZPKsG9LoDe4bcQM2ZPm9crmBTexxQQO1DCRvzf0?=
 =?iso-8859-1?Q?LL4tEteb6zuPU7gEF5aXCx9nZjmh/R1RA9h/iGZ+m1Xqst5BMlLnD7o2x4?=
 =?iso-8859-1?Q?5WYCe9jFDuZK7qBELHW3H3WYEXd2FWdcPehs8RBJzokzmRvDpwhRxkzAnD?=
 =?iso-8859-1?Q?YlAlA4HatIXlolmag5EoBU6ZtpUOD49dp58Dtl3RFq7gMxhQaD5eBVsBOS?=
 =?iso-8859-1?Q?8QJ35Py2Bq0S5y264OwC1g/GNjljAQzI99tmwz8N47da4f5iKSDIrRoaFy?=
 =?iso-8859-1?Q?jDLeMtOYW10vBWRM9JZdq9DWzzmkUXNO3Be5OnA2ZPGDtfNd4dk39/nux+?=
 =?iso-8859-1?Q?Ed5fMu78oO+GrV8WzC/G7sd4cqHwgIyOxetlUoZ7gr2Lc7syn40rtiG6kp?=
 =?iso-8859-1?Q?JpbU+n7W0B8EZZul6rYD5wSVZCLuEtN6Igkzv7U7UnaHqTaO9Hi1G3LmMW?=
 =?iso-8859-1?Q?tNVFRd+Iz2sprUfvkEjLWwXn1jNw7B1SeCvGqItMBjSO7deN0XdIwKOTaf?=
 =?iso-8859-1?Q?4t1mlhxTez6aUgXM6d5Zcwp7dLydolEQCFa4rkGAn9sNXoA+iusPWtbhpz?=
 =?iso-8859-1?Q?L84ohTp7WZEM2KMrp2asYG0JMGMSk2VkivlCbbKn6HmpybmIClDrDg9J0w?=
 =?iso-8859-1?Q?uMmxq1CCMFhWxR+Ek5K2gh/Brez0SCkzlHDTJNeEJHncnEQzwF1OOxdukA?=
 =?iso-8859-1?Q?pQhncLtqHOPeNuO5ZtTiIDR/P378eBmGtazJDLhomk9rygb1daxXKSm275?=
 =?iso-8859-1?Q?halrcNW60TlCm8kA7JDK0op9H0/ZBPCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8NDL7A7o1z0dMLmQVPCvoBSGFw8GVg/g0wPIYzPqczUyYr4qduPmlKM3H0?=
 =?iso-8859-1?Q?xICmD4RAxsAgsDnn4XXtkPa4fzYHCwD5oIUjku4OaoucdqaT2x/bPrF5sR?=
 =?iso-8859-1?Q?Ytub9EAKYrRLK6lfxmb+ymIyt+GOpDR5SWPW+891jcq7SwM+7Pu5SNBQee?=
 =?iso-8859-1?Q?6ybM67ZBco+iZV7/O1uN201ex3GKRmpuuI3nYoF6jcoP3WFbhcpWuDLzIC?=
 =?iso-8859-1?Q?u17UrbeR/TfMXf5rxkvvygs7JbhMaUQRXW/0GtGDsw7mgGfcfPAM3kaSc3?=
 =?iso-8859-1?Q?UZZ6ag2H8nvlF3MCHnboRQ8rdR7C6X+gQjuj2PwsrnqQMxLRuKV7yX9O2F?=
 =?iso-8859-1?Q?s4UVaIzKAZCx7yX0qBmAAaDhINi+2FF521E4s9+WzYCzwAttPYhbPzFU1Y?=
 =?iso-8859-1?Q?TN3BhiUODjWKzImCTRL99woGxl2FK1+7b7NrnSlQZGEJf+Xmy9Yc2cvuqH?=
 =?iso-8859-1?Q?pwLktsa5Iokbv5G5/mwkFxqCk0pdWmhSuhB/VhoflumLZSX9XD2EUaMB23?=
 =?iso-8859-1?Q?GLshmU75AcG8BJFejqAG4JwEhpQEpt5uZHR4pec1wp3hWTh+STLBTjQfni?=
 =?iso-8859-1?Q?wvBZfWRMaPDTyNSqHvC295Tg89oOO3KdsGD5g/7AJsqnp3wM4+TBW9T7nO?=
 =?iso-8859-1?Q?0t5DVQANw9oBJLzQ0CAJK21m8RRd2C5nHCljDLz722Srk6oT26vgNi+RQX?=
 =?iso-8859-1?Q?3fAlSJFo6aY/zFHh4xb0+wv0BMHrm8kRgQ2nVa8psDGvxFO40Bzz+cSj1b?=
 =?iso-8859-1?Q?rGpXCMeGj5hJ73ZCrKk6Wtf/bEf26qFgom7QFKD9yz0XbWuW7d1TTvIm33?=
 =?iso-8859-1?Q?cjxyOZAxOYxrmZ1Hr+aQ/C9tpu/YzuwEqTzjvrthR6pgo72cvBfCQL+xWT?=
 =?iso-8859-1?Q?Ka9gdPtGTQ803acdDJI6nG6PY8ZBv+rG/OHqzZW4I9lKa9gi5YU9zyKIDi?=
 =?iso-8859-1?Q?R7M4hjv7PO79V2V9uv9dlziYCPpm9vGWml+m7nqiMp4W3a3omW9yzg9lxn?=
 =?iso-8859-1?Q?Igx648OuOxRZirfyNWWWtKvPIA0WL6eq68pu3wJzuxoGH3lNB4qMCf2xtm?=
 =?iso-8859-1?Q?4IlGNkPRijih3MnW5dCsp4iKN9+VT2HVdS7D+Mih+Ip/R6zVYxbcjFxsrZ?=
 =?iso-8859-1?Q?R5vDL3J4vg0PCJT+dbdXbJ09AiZrrXKIYTglQ3xQaEq9ChuIckEf9chuxo?=
 =?iso-8859-1?Q?brbwJqZXs55CokT80LAxjfGYBvgFjkd27KHvsYVlBNKncaDo2L9jkbvGYk?=
 =?iso-8859-1?Q?96p7OxZd8Pvd53in8P5vsJQ1Sw9KygRHwcfQVv+kvG5Wlh8n+DSRAI8kGT?=
 =?iso-8859-1?Q?u7RlW1Vc7L+6KnZO2hzqSsFusudJM6/vT0hRetPnPXKsI+/89AGu2/qRsU?=
 =?iso-8859-1?Q?rVfdZGcR5wZa3uSYKKJ6bG92eVhv5Y4delCpSW0neGblub4zC+dnklO4Tz?=
 =?iso-8859-1?Q?aEQGie+0xZjSbELTs/WpaZEDgPx6UqrGSDm4w0o5D73Ha+YgN0ItffBybF?=
 =?iso-8859-1?Q?MsTulEkAwE3nSIZ83GeIx61mB6/VHbrsw45FZ+S43eg/QiWQg/pAnOPXaZ?=
 =?iso-8859-1?Q?g7XSaoU/zC3Hs6OPnLQRBoiThCaloO5QUFL8Ly5+iwvoqd3BmSoO2MxabC?=
 =?iso-8859-1?Q?28nAFG011qKSlDVOi6Ua6HQ7bfi+wQ4ML3CP7Ovx6prAidiiWNTRyYYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd84e00-e172-4bdc-2148-08dd550421e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:50:40.3855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP6gNYz4SSDvlh0dscLRuTLXThmpT7iG607VYl7tUQzhAh8WtOKSABDsc0Ysve70t1QOSpUTNJYTTtpnAckawR5BC/Zr8EV6NjQkSHiR0KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7692
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

Here is the first drm-xe-next pull for 6.15. There are some additional
changes that we have in drm-xe-next that I decided to keep out for now
and also others that we should be merging early this week. I will see
how our CI goes with them before submitting second pull next week.

thanks
Lucas De Marchi

drm-xe-next-2025-02-24:
UAPI Changes:
  - Add mmap support for PCI memory barrier (Tejas, Matthew Auld)
  - Enable integration with perf pmu, exposing event counters: for now, just
    GT C6 residency (Vinay, Lucas)
  - Add "survivability mode" to allow putting the driver in a state capable of
    firmware upgrade on critical failures (Riana, Rodrigo)
  - Add PXP HWDRM support and enable for compatible platforms:
    Meteor Lake and Lunar Lake (Daniele, John Harrison)
  - Expose package and vram temperature over hwmon subsystem (Raag, Badal, Rodrigo)

Cross-subsystem Changes:
  - Backmege drm-next to synchronize with i915 display and other internal APIs

Display Changes (including i915):
  - Device probe re-order to help with flicker-free boot (Maarten)
  - Align watermark, hpd and dsm with i915 (Rodrigo)
  - Better abstraction for d3cold (Rodrigo)

Driver Changes:
  - Make sure changes to ccs_mode is with helper for gt sync reset (Maciej)
  - Drop mmio_ext abstraction since it didn't prove useful in its current form
    (Matt Roper)
  - Reject BO eviction if BO is bound to current VM (Oak, Thomas Hellström)
  - Add GuC Power Conservation debugfs (Rodrigo)
  - L3 cache topology updates for Xe3 (Francois, Matt Atwood)
  - Better logging about missing GuC logs (John Harrison)
  - Better logging for hwconfig-related data availability (John Harrison)
  - Tracepoint updates for xe_bo_create, xe_vm and xe_vma (Oak)
  - Add missing SPDX licenses (Francois)
  - Xe suballocator imporovements (Michal Wajdeczko)
  - Improve logging for native vs SR-IOV driver mode (Satyanarayana)
  - Make sure VF bootstrap is not attempted in execlist mode (Maarten)
  - Add GuC Buffer Cache abstraction for some CTB H2G actions and use
    during VF provisioning (Michal Wajdeczko)
  - Better synchronization in gtidle for new users (Vinay)
  - New workarounds for Panther Lake (Nirmoy, Vinay)
  - PCI ID updates for Panther Lake (Matt Atwood)
  - Enable SR-IOV for Panther Lake (Michal Wajdeczko)
  - Update MAINTAINERS to stop directing xe changes to drm-misc (Lucas)
  - New PCI IDs for Battle Mage (Shekhar)
  - Better pagefault logging (Francois)
  - SR-IOV fixes and refactors for past and new platforms (Michal Wajdeczko)
  - Platform descriptor refactors and updates (Sai Teja)
  - Add gt stats debugfs (Francois)
  - Add guc_log debugfs to dump to dmesg (Lucas)
  - Abstract per-platform LMTT availability (Piotr Piórkowski)
  - Refactor VRAM manager location (Piotr Piórkowski)
  - Add missing xe_pm_runtime_put when forcing wedged mode (Shuicheng)
  - Fix possible lockup when forcing wedged mode (Xin Wang)
  - Probe refactors to use cleanup actions with better error handling (Lucas)
  - XE_IOCTL_DBG clarification for userspace (Maarten)
  - Better xe_mmio initialization and abstraction (Ilia)
  - Drop unnecessary GT lookup (Matt Roper)
  - Skip client engine usage from fdinfo for VFs (Marcin Bernatowicz)
  - Allow to test xe_sync_entry_parse with error injection (Priyanka)
  - OA fix for polled read (Umesh)
The following changes since commit 7f2b5237e313e39008a85b33ca94ab503a8fdff9:

   drm/amd/display: restore invalid MSA timing check for freesync (2025-01-28 16:26:13 -0500)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-02-24

for you to fetch changes up to b7b68c6e36776a46d47743bc53b19089f5e0029a:

   drm/xe/wa: Limit char per line to 100 (2025-02-24 12:10:10 +0530)

----------------------------------------------------------------
UAPI Changes:
  - Add mmap support for PCI memory barrier (Tejas, Matthew Auld)
  - Enable integration with perf pmu, exposing event counters: for now, just
    GT C6 residency (Vinay, Lucas)
  - Add "survivability mode" to allow putting the driver in a state capable of
    firmware upgrade on critical failures (Riana, Rodrigo)
  - Add PXP HWDRM support and enable for compatible platforms:
    Meteor Lake and Lunar Lake (Daniele, John Harrison)
  - Expose package and vram temperature over hwmon subsystem (Raag, Badal, Rodrigo)

Cross-subsystem Changes:
  - Backmege drm-next to synchronize with i915 display and other internal APIs

Display Changes (including i915):
  - Device probe re-order to help with flicker-free boot (Maarten)
  - Align watermark, hpd and dsm with i915 (Rodrigo)
  - Better abstraction for d3cold (Rodrigo)

Driver Changes:
  - Make sure changes to ccs_mode is with helper for gt sync reset (Maciej)
  - Drop mmio_ext abstraction since it didn't prove useful in its current form
    (Matt Roper)
  - Reject BO eviction if BO is bound to current VM (Oak, Thomas Hellström)
  - Add GuC Power Conservation debugfs (Rodrigo)
  - L3 cache topology updates for Xe3 (Francois, Matt Atwood)
  - Better logging about missing GuC logs (John Harrison)
  - Better logging for hwconfig-related data availability (John Harrison)
  - Tracepoint updates for xe_bo_create, xe_vm and xe_vma (Oak)
  - Add missing SPDX licenses (Francois)
  - Xe suballocator imporovements (Michal Wajdeczko)
  - Improve logging for native vs SR-IOV driver mode (Satyanarayana)
  - Make sure VF bootstrap is not attempted in execlist mode (Maarten)
  - Add GuC Buffer Cache abstraction for some CTB H2G actions and use
    during VF provisioning (Michal Wajdeczko)
  - Better synchronization in gtidle for new users (Vinay)
  - New workarounds for Panther Lake (Nirmoy, Vinay)
  - PCI ID updates for Panther Lake (Matt Atwood)
  - Enable SR-IOV for Panther Lake (Michal Wajdeczko)
  - Update MAINTAINERS to stop directing xe changes to drm-misc (Lucas)
  - New PCI IDs for Battle Mage (Shekhar)
  - Better pagefault logging (Francois)
  - SR-IOV fixes and refactors for past and new platforms (Michal Wajdeczko)
  - Platform descriptor refactors and updates (Sai Teja)
  - Add gt stats debugfs (Francois)
  - Add guc_log debugfs to dump to dmesg (Lucas)
  - Abstract per-platform LMTT availability (Piotr Piórkowski)
  - Refactor VRAM manager location (Piotr Piórkowski)
  - Add missing xe_pm_runtime_put when forcing wedged mode (Shuicheng)
  - Fix possible lockup when forcing wedged mode (Xin Wang)
  - Probe refactors to use cleanup actions with better error handling (Lucas)
  - XE_IOCTL_DBG clarification for userspace (Maarten)
  - Better xe_mmio initialization and abstraction (Ilia)
  - Drop unnecessary GT lookup (Matt Roper)
  - Skip client engine usage from fdinfo for VFs (Marcin Bernatowicz)
  - Allow to test xe_sync_entry_parse with error injection (Priyanka)
  - OA fix for polled read (Umesh)

----------------------------------------------------------------
Ashutosh Dixit (3):
       drm/xe/oa: Add missing VISACTL mux registers
       drm/xe/oa: Preserve oa_ctrl unused bits
       drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked

Daniele Ceraolo Spurio (15):
       drm/xe/pxp: Initialize PXP structure and KCR reg
       drm/xe/pxp: Allocate PXP execution resources
       drm/xe/pxp: Add VCS inline termination support
       drm/xe/pxp: Add GSC session invalidation support
       drm/xe/pxp: Handle the PXP termination interrupt
       drm/xe/pxp: Add GSC session initialization support
       drm/xe/pxp: Add PXP queue tracking and session start
       drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues
       drm/xe/pxp/uapi: Add a query for PXP status
       drm/xe/pxp/uapi: Add API to mark a BO as using PXP
       drm/xe/pxp: add PXP PM support
       drm/xe/pxp: Add PXP debugfs support
       drm/xe/pxp: Enable PXP for MTL and LNL
       drm/xe/pxp: Fail the load if PXP fails to initialize
       drm/xe/pxp: Don't use 0 to indicate NULL

Dave Airlie (1):
       Merge tag 'amd-drm-fixes-6.14-2025-01-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next

Francois Dugast (4):
       drm/xe/xe3: Generate and store the L3 bank mask
       drm/xe: Add missing SPDX license identifiers
       drm/xe/gt_pagefault: Print engine class string
       drm/xe: Add stats for vma page faults

Gustavo Sousa (1):
       drm/xe: Fix sort order of .o lists in Makefile

Ilia Levi (2):
       drm/xe: s/xe_mmio_init/xe_mmio_probe_early
       drm/xe: Add xe_mmio_init() initialization function

Jakub Kolakowski (1):
       drm/xe/pf: Add runtime registers for graphics gen >= 30

John Harrison (2):
       drm/xe/guc: Drop error messages about missing GuC logs
       drm/xe: Upgrade complaint about missing slice info

José Roberto de Souza (1):
       drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump

Lucas De Marchi (24):
       MAINTAINERS: Also exclude xe for drm-misc
       drm/xe/pmu: Assert max gt
       drm/xe/pmu: Extract xe_pmu_event_update()
       drm/xe/pmu: Get/put runtime pm on event init
       drm/xe/pmu: Add attribute skeleton
       drm/xe/devcoredump: Move exec queue snapshot to Contexts section
       drm/xe: Fix and re-enable xe_print_blob_ascii85()
       drm/xe/guc: Fix size_t print format
       Merge drm/drm-next into drm-xe-next
       drm/xe: Remove xe_dummy_exit()
       drm/xe/debugfs: Add node to dump guc log to dmesg
       drm/xe: Add callback support for driver remove
       drm/xe: Fix xe_display_fini() calls
       drm/xe: Fix error handling in xe_irq_install()
       drm/xe: Fix xe_tile_init_noalloc() error propagation
       drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
       drm/xe: Remove leftover pxp comment
       drm/xe: Cleanup unwind of gt initialization
       drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
       drm/xe/oa: Move fini to xe_oa
       drm/xe: Move drm_dev_unplug() out of display function
       drm/xe/oa: Handle errors in xe_oa_register()
       drm/xe/pmu: Fail probe if xe_pmu_register() fails
       drm/xe/hwmon: Stop ignoring errors on probe

Maarten Lankhorst (6):
       drm/xe: Do not attempt to bootstrap VF in execlists mode
       drm/xe: Move suballocator init to after display init
       drm/xe/display: Add intel_plane_initial_vblank_wait
       drm/xe: Defer irq init until after xe_display_init_noaccel
       drm/xe/display: Use a single early init call for display
       drm/xe/display: Clarify XE_IOCTL_DBG message

Maciej Patelczyk (2):
       drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
       drm/xe: make change ccs_mode a synchronous action

Marcin Bernatowicz (2):
       drm/xe/vf: Return EOPNOTSUPP for DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if VF
       drm/xe/client: Skip show_run_ticks if unable to read timestamp

Matt Atwood (1):
       drm/xe/ptl: Update the PTL pci id table

Matt Roper (2):
       drm/xe: Remove unused "mmio_ext" code
       drm/xe: Drop unnecessary GT lookup in xe_exec_queue_create_ioctl()

Matthew Brost (1):
       drm/xe: Mark ComputeCS read mode as UC on iGPU

Michal Wajdeczko (24):
       drm/xe: Always setup GT MMIO adjustment data
       drm/xe/vf: Perform early GT MMIO initialization to read GMDID
       drm/xe/sa: Always call drm_suballoc_manager_fini()
       drm/xe/sa: Drop redundant NULL assignments
       drm/xe/sa: Improve error message on init failure
       drm/xe/sa: Tidy up coding style in init()
       drm/xe/sa: Allow making suballocations using custom gfp flags
       drm/xe/sa: Allow creating suballocator with custom guard size
       drm/xe/sa: Minor header cleanups
       drm/xe/guc: Introduce the GuC Buffer Cache
       drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
       drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
       drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
       drm/xe/pf: Fix migration initialization
       drm/xe/guc: Fix sizeof(32) typo
       drm/xe/pf: Use GuC Buffer Cache during policy provisioning
       drm/xe/pf: Move VFs reprovisioning to worker
       drm/xe/pf: Don't send BEGIN_ID if VF has no context/doorbells
       drm/xe/pf: Reset GuC VF config when unprovisioning critical resource
       drm/xe/relay: Don't use GFP_KERNEL for new transactions
       drm/xe/vf: Don't try to trigger a full GT reset if VF
       drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
       drm/xe: Enable SR-IOV for PTL
       drm/xe/pf: Release all VFs configs on device removal

Nirmoy Das (2):
       drm/xe/ptl: Apply Wa_14023061436
       drm/xe: Carve out wopcm portion from the stolen memory

Oak Zeng (5):
       drm/xe: Reject BO eviction if BO is bound to current VM
       drm/xe: trace bo create
       drm/xe: Print vm flags in xe_vm trace print
       drm/xe: Print vm parameter in xe_vma trace
       drm/xe: Fix a typo in xe_vm_doc.h

Piotr Piórkowski (3):
       drm/xe/pf: Use an explicit check to see if the device has LMTT
       drm/xe: Rename struct xe_mem_region to struct xe_vram_region
       drm/xe: Move VRAM manager to struct xe_vram_region

Priyanka Dandamudi (1):
       drm/xe: Add fault injection for xe_sync_entry_parse

Raag Jadav (1):
       drm/xe/hwmon: expose package and vram temperature

Riana Tauro (4):
       drm/xe: Add functions and sysfs for boot survivability
       drm/xe: Enable Boot Survivability mode
       drm/xe: Initialize mei-gsc and vsec in survivability mode
       drm/xe: Skip survivability mode for VF

Rodrigo Vivi (9):
       drm/xe: Introduce GuC PC debugfs
       drm/xe/lnl: Enable GuC SLPC DCC task
       drm/xe/uapi: Fix documentation indentation
       Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
       drm/xe: Fix PVC RPe and RPa information
       drm/xe/display: Add missing watermark ipc update at runtime resume
       drm/xe/display: Remove hpd cancel work sync from runtime pm path
       drm/{i915, xe}/display: Move dsm registration under intel_driver
       drm/xe/display: Spin-off xe_display runtime/d3cold sequences

Sai Teja Pottumuttu (2):
       drm/xe: Refactor dma_mask_size
       drm/xe: Refactor max_remote_tiles

Satyanarayana K V P (1):
       drm/xe: Suppress printing of mode when running in non-sriov mode

Shekhar Chauhan (1):
       drm/xe/bmg: Add new PCI IDs

Shuicheng Lin (1):
       drm/xe/debugfs: Add missing xe_pm_runtime_put in wedge_mode_set

Tejas Upadhyay (4):
       drm/xe/mmap: Add mmap support for PCI memory barrier
       drm/xe/client: bo->client does not need bos_lock
       drm/xe: Fix typo in xe_job_ptrs
       drm/xe/wa: Limit char per line to 100

Umesh Nerlige Ramappa (1):
       drm/xe/oa: Ensure that polled read returns latest data

Vinay Belgaumkar (4):
       drm/xe: Add locks in gtidle code
       drm/xe/ptl: Apply Wa_13011645652
       drm/xe/pmu: Enable PMU interface
       drm/xe/pmu: Add GT C6 events

Xin Wang (1):
       drm/xe/debugfs: fixed the return value of wedged_mode_set

  .../ABI/testing/sysfs-driver-intel-xe-hwmon        |  16 +
  MAINTAINERS                                        |   1 +
  drivers/gpu/drm/i915/display/intel_display.c       |   6 +-
  .../gpu/drm/i915/display/intel_display_driver.c    |   4 +
  drivers/gpu/drm/i915/display/intel_plane_initial.c |   7 +-
  drivers/gpu/drm/i915/display/intel_plane_initial.h |   2 +
  drivers/gpu/drm/i915/i915_driver.c                 |   5 -
  drivers/gpu/drm/xe/Kconfig.profile                 |   1 +
  drivers/gpu/drm/xe/Makefile                        |  19 +-
  drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h      |  41 +
  .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |   5 +
  .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |  18 +-
  drivers/gpu/drm/xe/display/intel_bo.c              |   2 +-
  drivers/gpu/drm/xe/display/intel_fb_bo.c           |   4 +-
  drivers/gpu/drm/xe/display/xe_display.c            | 181 ++--
  drivers/gpu/drm/xe/display/xe_display.h            |  10 +-
  drivers/gpu/drm/xe/display/xe_plane_initial.c      |  19 +-
  drivers/gpu/drm/xe/instructions/xe_instr_defs.h    |   1 +
  drivers/gpu/drm/xe/instructions/xe_mfx_commands.h  |  28 +
  drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |   5 +
  drivers/gpu/drm/xe/regs/xe_engine_regs.h           |   1 +
  drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   6 +
  drivers/gpu/drm/xe/regs/xe_irq_regs.h              |   8 +
  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |   3 +
  drivers/gpu/drm/xe/regs/xe_oa_regs.h               |   6 +
  drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |   2 +
  drivers/gpu/drm/xe/regs/xe_pxp_regs.h              |  23 +
  drivers/gpu/drm/xe/regs/xe_reg_defs.h              |  28 +-
  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c        | 334 ++++++++
  drivers/gpu/drm/xe/xe_bo.c                         | 175 +++-
  drivers/gpu/drm/xe/xe_bo.h                         |   8 +
  drivers/gpu/drm/xe/xe_bo_types.h                   |   6 +
  drivers/gpu/drm/xe/xe_debugfs.c                    |   6 +-
  drivers/gpu/drm/xe/xe_devcoredump.c                |  42 +-
  drivers/gpu/drm/xe/xe_devcoredump.h                |   2 +-
  drivers/gpu/drm/xe/xe_device.c                     | 283 +++++--
  drivers/gpu/drm/xe/xe_device.h                     |   8 +
  drivers/gpu/drm/xe/xe_device_types.h               |  55 +-
  drivers/gpu/drm/xe/xe_drm_client.c                 |  10 +-
  drivers/gpu/drm/xe/xe_exec.c                       |   6 +
  drivers/gpu/drm/xe/xe_exec_queue.c                 |  66 +-
  drivers/gpu/drm/xe/xe_exec_queue.h                 |   5 +
  drivers/gpu/drm/xe/xe_exec_queue_types.h           |   8 +
  drivers/gpu/drm/xe/xe_execlist.c                   |   2 +-
  drivers/gpu/drm/xe/xe_gsc.c                        |   9 -
  drivers/gpu/drm/xe/xe_gsc.h                        |   1 -
  drivers/gpu/drm/xe/xe_gsc_proxy.c                  |  63 +-
  drivers/gpu/drm/xe/xe_gsc_proxy.h                  |   1 -
  drivers/gpu/drm/xe/xe_gsc_types.h                  |   1 +
  drivers/gpu/drm/xe/xe_gt.c                         |  68 +-
  drivers/gpu/drm/xe/xe_gt.h                         |   1 -
  drivers/gpu/drm/xe/xe_gt_idle.c                    |  23 +-
  drivers/gpu/drm/xe/xe_gt_idle.h                    |   1 +
  drivers/gpu/drm/xe/xe_gt_idle_types.h              |   3 +
  drivers/gpu/drm/xe/xe_gt_mcr.c                     |   8 +-
  drivers/gpu/drm/xe/xe_gt_pagefault.c               |  15 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |  63 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |   6 +
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         | 161 ++--
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |   1 +
  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |  50 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |  23 +-
  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |  10 +
  drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |  19 +
  drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |   1 +
  drivers/gpu/drm/xe/xe_gt_stats.c                   |   2 +
  drivers/gpu/drm/xe/xe_gt_stats_types.h             |   2 +
  drivers/gpu/drm/xe/xe_gt_topology.c                |  16 +-
  drivers/gpu/drm/xe/xe_guc.c                        |   5 +
  drivers/gpu/drm/xe/xe_guc_buf.c                    | 176 ++++
  drivers/gpu/drm/xe/xe_guc_buf.h                    |  47 ++
  drivers/gpu/drm/xe/xe_guc_buf_types.h              |  28 +
  drivers/gpu/drm/xe/xe_guc_ct.c                     |   7 +-
  drivers/gpu/drm/xe/xe_guc_debugfs.c                |  28 +
  drivers/gpu/drm/xe/xe_guc_log.c                    |  13 +-
  drivers/gpu/drm/xe/xe_guc_pc.c                     |  81 +-
  drivers/gpu/drm/xe/xe_guc_pc.h                     |   2 +
  drivers/gpu/drm/xe/xe_guc_relay.c                  |   2 +-
  drivers/gpu/drm/xe/xe_guc_types.h                  |   3 +
  drivers/gpu/drm/xe/xe_heci_gsc.c                   |   3 +-
  drivers/gpu/drm/xe/xe_hwmon.c                      |  91 ++-
  drivers/gpu/drm/xe/xe_hwmon.h                      |   4 +-
  drivers/gpu/drm/xe/xe_irq.c                        |  34 +-
  drivers/gpu/drm/xe/xe_lmtt.c                       |   4 +-
  drivers/gpu/drm/xe/xe_lrc.c                        |  18 +-
  drivers/gpu/drm/xe/xe_lrc.h                        |   7 +-
  drivers/gpu/drm/xe/xe_mmio.c                       |  77 +-
  drivers/gpu/drm/xe/xe_mmio.h                       |   4 +-
  drivers/gpu/drm/xe/xe_module.c                     |   5 -
  drivers/gpu/drm/xe/xe_oa.c                         | 116 +--
  drivers/gpu/drm/xe/xe_oa.h                         |   4 +-
  drivers/gpu/drm/xe/xe_pci.c                        |  79 +-
  drivers/gpu/drm/xe/xe_pci_types.h                  |   5 -
  drivers/gpu/drm/xe/xe_pcode_api.h                  |  14 +
  drivers/gpu/drm/xe/xe_pm.c                         |  41 +-
  drivers/gpu/drm/xe/xe_pmu.c                        | 374 +++++++++
  drivers/gpu/drm/xe/xe_pmu.h                        |  18 +
  drivers/gpu/drm/xe/xe_pmu_types.h                  |  39 +
  drivers/gpu/drm/xe/xe_pxp.c                        | 906 +++++++++++++++++++++
  drivers/gpu/drm/xe/xe_pxp.h                        |  35 +
  drivers/gpu/drm/xe/xe_pxp_debugfs.c                | 120 +++
  drivers/gpu/drm/xe/xe_pxp_debugfs.h                |  13 +
  drivers/gpu/drm/xe/xe_pxp_submit.c                 | 588 +++++++++++++
  drivers/gpu/drm/xe/xe_pxp_submit.h                 |  22 +
  drivers/gpu/drm/xe/xe_pxp_types.h                  | 135 +++
  drivers/gpu/drm/xe/xe_query.c                      |  32 +
  drivers/gpu/drm/xe/xe_ring_ops.c                   |   4 +-
  drivers/gpu/drm/xe/xe_sa.c                         |  51 +-
  drivers/gpu/drm/xe/xe_sa.h                         |  30 +-
  drivers/gpu/drm/xe/xe_sched_job_types.h            |   4 +-
  drivers/gpu/drm/xe/xe_sriov.c                      |   2 +-
  drivers/gpu/drm/xe/xe_survivability_mode.c         | 238 ++++++
  drivers/gpu/drm/xe/xe_survivability_mode.h         |  18 +
  drivers/gpu/drm/xe/xe_survivability_mode_types.h   |  35 +
  drivers/gpu/drm/xe/xe_sync.c                       |   1 +
  drivers/gpu/drm/xe/xe_tile.c                       |  18 +-
  drivers/gpu/drm/xe/xe_tile.h                       |   1 +
  drivers/gpu/drm/xe/xe_trace_bo.h                   |  19 +-
  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |  87 +-
  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h             |   2 +-
  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |   3 +-
  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h         |   4 -
  drivers/gpu/drm/xe/xe_uc.c                         |  13 -
  drivers/gpu/drm/xe/xe_uc.h                         |   1 -
  drivers/gpu/drm/xe/xe_vm.c                         | 169 +++-
  drivers/gpu/drm/xe/xe_vm.h                         |   8 +
  drivers/gpu/drm/xe/xe_vm_doc.h                     |   2 +-
  drivers/gpu/drm/xe/xe_vm_types.h                   |   1 +
  drivers/gpu/drm/xe/xe_wa.c                         |   8 +-
  drivers/gpu/drm/xe/xe_wa_oob.rules                 |   1 +
  include/drm/intel/pciids.h                         |  11 +-
  include/uapi/drm/xe_drm.h                          | 123 ++-
  132 files changed, 5273 insertions(+), 777 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
  create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
  create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
  create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
  create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h
  create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
  create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
  create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h
  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
  create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
