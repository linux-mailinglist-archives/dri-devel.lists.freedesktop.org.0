Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E538B1E1A8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2364F10E4B5;
	Fri,  8 Aug 2025 05:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCWyKf+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686310E1BD;
 Fri,  8 Aug 2025 05:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754630670; x=1786166670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RNRjt7QNLqR+uF0uHXW5E1/SUzplXhhUxcxtdKP164k=;
 b=BCWyKf+RYq91b3qONI3Cihcd2akXbXF5s4jjoJeln6OAAgv3o6v9gBC0
 8c7YtR2B+lgoTlIrfdEran83ZgJ14I4GZFqZA4WrAvPX8b0OJ33InSPSc
 f0urkBlC0F7Q3V9pVJ52iTjYl5ChyI0TQI4YZosu/EgodGTryjR7eTNHl
 50qffTeVhIVMF7b0hMSeTnNsI14jxjAbY/xft+QNthfVE+gCRg5pz9jKv
 xnr7fUyopzDOroJMDb/Qmong0Bibqj5Y7mMeThAmb9cCqYuAEpFc1rKOm
 d3fLo468j8/JbjxSBotvoCP9YjZ94Xlc2BpprgV8p1ATrodQr4Otitbzc Q==;
X-CSE-ConnectionGUID: D3oCocf1TvOtY/segdTobQ==
X-CSE-MsgGUID: YME1FTWYSQqhVm9YmUbjHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44568583"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44568583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:24:29 -0700
X-CSE-ConnectionGUID: 9NJG4GGuSa2HvfXcu1fmKg==
X-CSE-MsgGUID: 6M96z+sARa6Is+l1R6b+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="188924638"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:24:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:24:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:24:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkSti03GeYIPiUjPad3BfTML10DIZCPuUbV8kAbCn2nvLWzrRoHMeScGdgw2A/yAw4E56ec9VpgqK4a3cHS/+s7q2Fr9HOBJgLyRTQQIPQ1S2wEVHQAvDa+gcFaxnxgiFwnFC9cIZrTwg2IoRCXkzWcXwzSh7VNjU+5+htMOfUotT6RAoC59x0Hhq9EXifbI28XGXa9+PsF4KLqRwzodD6Ud+qbQSIs3CRz1m1oPCGPVipE2SEeutmNa6gt263yxoCMrP+9dITX0JcaVS9Rfm+KMYkUhn947ewC7xs8DGRJ9ap2RR8q46rT4ws6kwpE9TeyCkf2+WNE2IrWXQ8f7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNRjt7QNLqR+uF0uHXW5E1/SUzplXhhUxcxtdKP164k=;
 b=Tq2nkzgXcCeT4QOkjSpDGDqJvN8aRAX4Knyll5Em3cmyGvo+SoB2BaWDxqKheoVm38DLnk2lH+Q3Q1qGr/c7GfsuWBq7z4y29Q8o/GURc2v0B4H4VEHKOgjT1tUO7+PyS6W0wXJcftM/FP3np/Dg5FH9egGtFcfY1xgM23etOG+4eEESEDMZrVE4avpzqvE9gxFcT7zAyDYrkr3PTcMwNmdxjqjPR62mVE3eo/8IkGJyk4aTpG0ES7cS4LxPbPBgctqpz2KCYfRsmFDS4WuXy6xumYuAnuJsv6aDqRI3gHhRHlu9OVh9/G31ZVdALkRVQBxCy++asHRG8JFHUOuGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB7392.namprd11.prod.outlook.com
 (2603:10b6:610:145::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 05:24:19 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:24:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Harry Wentland <harry.wentland@amd.com>, "Leo
 Li" <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJhIENhbmFs?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Thread-Topic: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Thread-Index: AQHcAutvtF48Hd1pDUSGm6UrRS1SEbRN1YcAgApofzCAAAS4gA==
Date: Fri, 8 Aug 2025 05:24:19 +0000
Message-ID: <DM3PPF208195D8D9DF6BA02300F667B1967E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
 <3c522dd8-0e56-4ab3-84da-d9193137d4fe@bootlin.com>
 <DM3PPF208195D8D863A5A2E8A151A77A7B3E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D863A5A2E8A151A77A7B3E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB7392:EE_
x-ms-office365-filtering-correlation-id: 03a9e947-1e12-4a5b-88fc-08ddd63bd364
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?VWliNjVSVGNMMWN6aUpzRjY3TGIvRWZRK1NGN1ZmNEVIbldGeVkyaW5OUk9i?=
 =?utf-8?B?RnhYeFcvNm5uN0o4T2JiVkV3YVBCTXI1Tm5yUnYyUW16bkpuRm5KNUVoZ0gv?=
 =?utf-8?B?Sng4T3pXckJWV1BGaXV0NTRIcFVNWnZBWDRFOUQ5M3c3V21iVGUrUUYvWGNx?=
 =?utf-8?B?OUpJVEdqbm5ZWHoxZVZqSDBETjR0ajl1U3lGNm4wQTNqd2VOTW0vOE1UQnMw?=
 =?utf-8?B?SFluS2xMY3o3MnlQTzdLbnZXczF5SFhzVGtGZEFDZjc2aktBZ1puY29Cd0Zu?=
 =?utf-8?B?by9lVWdmc2JCZnJkY3lPK2prdlRGOElUaHNEWWZKOHU5MWxkSG9tb0w0Y1hB?=
 =?utf-8?B?VVhQUkdRVWxSRzZDUThyK0FTRVlNTUhuZkMzL3IwMU5kL3NsTGhaczZYbEhk?=
 =?utf-8?B?MDVYRW9KanFsOGdkVUVBblZvdFdEbXlqbC9nTG9OT1ArWTJqaEtqemRLZWEv?=
 =?utf-8?B?dy8rK2lZRWxaRmR5bW9uazdyVnhuL0FRUS9leENlU1dVRXJMRmdXcGdXTXJy?=
 =?utf-8?B?Nkw2NEljZDRUNzBMMXlLMllsVzFUTUhrLzJrSTFMTUxMRXRXalFTczJLMHh6?=
 =?utf-8?B?bHRXdm13ZlRsWHMzWGNxU2h0QTFnK2huVE15ck9adTQxcWFaZnVOaVJaZ1pl?=
 =?utf-8?B?OXRRMG8zL01XWThIUFFIdkdZSGFERjRDczhKckxNT0VpeWNWemwrdWxzeVhI?=
 =?utf-8?B?enJHMXViM2lSeFEwSWE0UzlyTzg0UUZ0dUNLWDJncG1HSjZtVGN0eG5TTk5l?=
 =?utf-8?B?SWo1L0d6RDN5UzV5Z1NLTkN6NnFaMVRvR1hYdkZLMEloTkFueS96NTVoemRq?=
 =?utf-8?B?a0ZtU1oyQU1vV0hyUGwwV2MyS29jbzNrQWozVFhzZ0Y5eGhvQmhzSVppUGFm?=
 =?utf-8?B?WkFMdmh4bW02V0RLTHYvMVJSZVNLOGJ4VTlVNWEyWmtuV3RzaHAvczluNkc3?=
 =?utf-8?B?ZzI2UU91THMxbkJtd2lYRzZTNjFZdFlFdTRFOXBYMkVza0xNSHJEUi9tdzNi?=
 =?utf-8?B?UUlPSitJWTV5Y1ZrRFVmWnVDbjYzUy8xc0M2M0lLcmZxMzNjeHZnY2R2bjA2?=
 =?utf-8?B?Zm93bzBqVnd4eDcrdkxjQURadlBsZ1BPYmJsdjI2YWZzZmlTZXpvbHpEVkQ2?=
 =?utf-8?B?aUordERoekZwVWRUNkFJTWpFOVJiYjNXRldHQW94MFFTaFBhUUZDQU1yQi9s?=
 =?utf-8?B?cWlHS3B2cDBmY3hDUjQ4WlhVSkdmYnBTbUxqVW4xZlZUMHhZUTgrY3ROM2Mv?=
 =?utf-8?B?RVhmN251OE1mQTlvRVM0dkdkUVo1NzUzNGpYKzAwSzdCRGs0T3pwZFZqdk5I?=
 =?utf-8?B?dFpkMXVuekV1UTY1dmQrK1V0WWNISVRNMll5N1BKcnV6cHFwM0tTR0xGVStK?=
 =?utf-8?B?MkJTc1lNdFRJTFFxN2x2b2RPUTlWbi9PbitIdmFpRHJKNGhGZ2ZCd1UvSjhL?=
 =?utf-8?B?TGhqYjZHRXZ1Q2IzWGZiTmlTQ0JKdXJEYVVLSmtRTTNBMmdLV09UMSszbWZx?=
 =?utf-8?B?LzZrTzVJdzZFRzQ0YkVHVWV2ZU5kNzNJcUlCOGRTWDErRWVPVGV4T09IcWFy?=
 =?utf-8?B?ODFJRkx4ZUhaSS94NkZOR3k4NlNwaFhBeUt4dkZ2a0VLQkYvWisva2NtOU5F?=
 =?utf-8?B?WWcveVZDRWF6Q2liMTZJK0xYSkhLZTRMZlo0RXRGZzhBRWZsRElyRTJoVU02?=
 =?utf-8?B?SXh2Z0ZpT1ZhcmdtTkIrT25EeXh0aTIzUklpc2dIY2FodFc4M2o1ZUhkRmZl?=
 =?utf-8?B?MEVROUdSbjlIdVpOZDRVTkNJSVg3VFdlZWs5RzFqdWwzaEc4anYzbnNxZ2Yr?=
 =?utf-8?B?K0tLelJnMktYNWt4YSszNFhsNEhKZDJwalNzUjA3Nzc4VmFVWkdSMEFLSlpn?=
 =?utf-8?B?Vmp1eE5kNlZXcWpoV0ZFVVRHc3g5a3lkNDNBQS9rMkpMVXhnUGszc3AyWVNR?=
 =?utf-8?Q?FlwDwkqJABy8wmGJI0ohu8apO2MV4k4n?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGFqS2l0VnptNGtrZHpFL2x3WkhMMlU2bnA1MVd5bittSjRrOUhpOEoxck92?=
 =?utf-8?B?aEFUVlBQSXRWVmFuV2NCV3FLTzRCUjVEazc4blRtSzFPbld0R0dnc21wTlB2?=
 =?utf-8?B?UzF0SWpLMlZ1L3JyWGlrZ0dmb1U5RHlZY2pDbll2MU4xU3YwaVd0L3c0SmdN?=
 =?utf-8?B?OEVCS2sxekJjRnlTWFo2Q1YwK2NLSHdpbXJLcldBeHh6TEtFVkwwYjkrcUNi?=
 =?utf-8?B?WWJQL3dLdkNFWFV0V0xGc3BqOUVnWDR0ZDBCUWNIQmVNTXo5WDIvWmhMS1R3?=
 =?utf-8?B?aEdXa3Q4dktjd1NGWCtYaU9PVUFlVEsxVll0TmJjSlNzZTZHSGZHQnVCeTN3?=
 =?utf-8?B?N0U2anRxSjgybEZmR0ZSczNQOG9NU292ME1kdkRPQUwreXdZcys5S29ocThM?=
 =?utf-8?B?OXgzcnROb3RWdjlaaml5Z1BuQ08wbU94b2x2bE83VUxQeWFWS2JpY040R1d5?=
 =?utf-8?B?dU9CQXM0dmIzU3RzNnluVVphZkgwbmFoN0FWZnA0aXM1MW5ka3J6ZU1icGtm?=
 =?utf-8?B?RU5TcWNhdWtNMnpqMkdoNDIzcnEzdzRQTFVLcG1FRE1xbkNyeDlBclEvTndm?=
 =?utf-8?B?cUp3MTZraEcxenRiWEZrZzJRWVc4YmhJdzEwQ1RDNGZXamlVYnE5YXZ4cU12?=
 =?utf-8?B?VTE5U2ppTG91Q2s5VjRxSG1aSGRZZFIyWjBuN2FjdG9HenpBQSt2SXZNZUMz?=
 =?utf-8?B?NysrNUcxM2F1WlV0bTBTOU9sMTY1VVU3cVB0MnZ3YVcwbU1NUTNXc0hCakVM?=
 =?utf-8?B?ZnBPclZVQk5iZVZGYVExVXd3ZnZQVnhaVURuQzhLSmdhNTUxVURCdFJXTlY4?=
 =?utf-8?B?RWd5ZHNZUGwvUU5JdUR6UENybWo3QmJzdkNhQkg0OXJ5Z1dsa0RDNThjbW9a?=
 =?utf-8?B?WXU3MDlFMVAvRTFYQzFkZDBQd2p3bFp1ZWF5YU0rMFY1NWJ6T2ZreHU0QkxJ?=
 =?utf-8?B?VWkrSmU2YWhFd1EwdVZsSjF6eUtleER6WHdpYkxRakl2d09kZzVZUkpEbnRt?=
 =?utf-8?B?c3ozWThsdWRBakdHSWtsNklmdHR0TVlYSnJqaGJ1VSs4VUJ1bm1GMGNIWDh0?=
 =?utf-8?B?SmdTOUh6QnRzQXhSUlBKUlhsd1pXbDZOci9TMFFUaUNldURhb0tUeTVCcEZa?=
 =?utf-8?B?VGZoQnVaWHFFUjlqNGFaQktSbjZ1b2hsQzRaeUl0NFIwUjRDelNka0JReHkz?=
 =?utf-8?B?NUxWNXJDT3prdkZHeFJQN1pWUWpSbDhJVFNIUlNNSHJFdGdvU1JIV1FDbHNL?=
 =?utf-8?B?c2Q2Q0o5dVZsbFMxb2VKVytvSmI0V2hmdm5CWUZHSGVHZnVRSGZjWSt5VEp4?=
 =?utf-8?B?V2JtaHFDVlhXQ0pyL0hGRFcyTk1RRGZ6MXA1ZWhGYkk0M0tkTVVRZVpmUlVB?=
 =?utf-8?B?bzZBdlZOUnBLRGVGS3JwRERWYWllKzdSbkFjbXNKWWNPVWpjcUdGdjIydWsy?=
 =?utf-8?B?eVVjYzV6dy80TGxMZnpUT3J3cE9NQVhENkRJZTRCa0pTcWxlLyt0bGM4UHJn?=
 =?utf-8?B?RjU0cWtKYjkvNG5rU2owYysxb1poVXVrdFdHUUdZVVYrVXJvdGFXaDZ0eDhk?=
 =?utf-8?B?MHJ6UjN6dWJVNkxheXlySU5uZ3FTRGJyY1A5bjJ3aFk0UDlSa0drK1NoRUMr?=
 =?utf-8?B?WFVQRVcyVmMyaXJIY0FqRklWM2c4cFNzYUxkREVSa1B0SG5seVhmMk9ERUdW?=
 =?utf-8?B?azVtKy9pYjErNU9pREp2QkZyYVRnRHBJNmViM3B0SERrNVJNWUc4M2F4TFhS?=
 =?utf-8?B?MitKVVk1MXc1WU8zZDNnalZzd3hwb3hDWHY4enRGdlhNZ1JCQ1JabzBOdTVj?=
 =?utf-8?B?Y3UxamN4R2U0TmtsdFNQVk5FR2YyblhmNC9jTmorYnBLYmg1NmV3SGJvNjZR?=
 =?utf-8?B?U1lOMFhLU3lOcHBFSVQ3dVpJdEpCODQ4RVY5YnROMXlnSkQ2Q1czTWdUSU91?=
 =?utf-8?B?MVVCNmlNTk9DK2I4bG5nVFhTOHZGcjVPd3oyQ0FsMXdUOHFnYjVoaEFsQ3hV?=
 =?utf-8?B?eUNMS2p5a0g3SnREM05ua1pycllJZGw2aVQ3T1Zmc0tlekg0TDE3aVp4d3la?=
 =?utf-8?B?NXoyVDlML0gzY2hmQllKQ3liMGxUWW1aOWhCQWFyT2l6cWdyVjZTeGhRTWpM?=
 =?utf-8?Q?INTpXosxSK8i9bgZA/pF8xi4V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a9e947-1e12-4a5b-88fc-08ddd63bd364
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:24:19.4228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xj2K8SxuR8hY6hZANjkcurvpTyPSTN3mmrymVuWqzQzRqiIcmxDfnNFFyZi3eouaEhq6rn/7s0lUPmCMDrVVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FuZHBhbCwgU3VyYWoN
Cj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOCwgMjAyNSAxMDozNSBBTQ0KPiBUbzogTG91aXMgQ2hh
dXZldCA8bG91aXMuY2hhdXZldEBib290bGluLmNvbT47IERtaXRyeSBCYXJ5c2hrb3YNCj4gPGRt
aXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT47IEphbmkgTmlrdWxhDQo+IDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+OyBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT47DQo+IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPjsgUm9kcmlnbyBTaXF1ZWlyYSA8
c2lxdWVpcmFAaWdhbGlhLmNvbT47IEFsZXgNCj4gRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47
IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyDQo+IDxzaW1v
bmFAZmZ3bGwuY2g+OyBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT47IE1hYXJ0ZW4g
TGFua2hvcnN0DQo+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Ow0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT47IFJvYiBDbGFyaw0KPiA8cm9iaW4uY2xhcmtAb3NzLnF1YWxjb21tLmNv
bT47IERtaXRyeSBCYXJ5c2hrb3YgPGx1bWFnQGtlcm5lbC5vcmc+Ow0KPiBBYmhpbmF2IEt1bWFy
IDxhYmhpbmF2Lmt1bWFyQGxpbnV4LmRldj47IEplc3NpY2EgWmhhbmcNCj4gPGplc3NpY2Euemhh
bmdAb3NzLnF1YWxjb21tLmNvbT47IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPjsgTWFyaWpu
DQo+IFN1aWp0ZW4gPG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPjsgTGF1cmVudCBQaW5j
aGFydA0KPiA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+OyBUb21p
IFZhbGtlaW5lbg0KPiA8dG9taS52YWxrZWluZW4rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPjsg
S2llcmFuIEJpbmdoYW0NCj4gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNv
bT47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdu
dXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsNCj4gRGF2ZSBTdGV2ZW5zb24gPGRhdmUu
c3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT47IE1hw61yYSBDYW5hbA0KPiA8bWNhbmFsQGlnYWxp
YS5jb20+OyBSYXNwYmVycnkgUGkgS2VybmVsIE1haW50ZW5hbmNlIDxrZXJuZWwtDQo+IGxpc3RA
cmFzcGJlcnJ5cGkuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4gZnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggOC84XSBkcm06IHdyaXRlYmFjazogcmVuYW1lDQo+IGRybV93cml0
ZWJhY2tfY29ubmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKCkNCj4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+
DQo+IA0KPiBMR1RNLA0KPiBSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBh
bEBpbnRlbC5jb20+DQoNCk9uZSB0aGluZyBJIG5vdGljZWQgd2FzIGFmdGVyIHRoZSBSZW5hbWUg
Ym90aCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0DQpBbmQgZHJtbV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXQgaGF2ZSBpZGVudGljYWwgY29tbWVudHMgYm90aCBhbGxvd2luZyBjdXN0b20g
ZW5jb2RlcnMNClRvIGJlIHVzZWQgbm93IGlzIHRoYXQgd2hhdCB3ZSB3ZXJlIGFpbWluZyBmb3Ig
d2l0aCB0aGUgb25seSBkaWZmZXJlbmNlIGJlaW5nIHRoZSANCnJldCA9IGRybW1fYWRkX2FjdGlv
bl9vcl9yZXNldChkZXYsIGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2NsZWFudXAsDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3Yl9jb25uZWN0b3IpOw0KY2FsbCA/DQoN
ClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gDQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyB8IDE0ICsrKysrKystLS0tLS0tDQo+ID4gPiAgIGlu
Y2x1ZGUvZHJtL2RybV93cml0ZWJhY2suaCAgICAgfCAxMCArKysrKy0tLS0tDQo+ID4gPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4gPg0K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMNCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyBpbmRleA0KPiA+ID4NCj4gPg0KPiAx
YTAxZGY5MWIyYzU4NjhlMTU4ZDQ4OWI3ODJmNGM1N2M2MWEyNzJjLi5lYzI1NzVjNGMyMWI3NDQ5
NzA3YjA1OTUzDQo+ID4gMjJlDQo+ID4gPiAyMjAyYTBjZjk4NjUgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3dyaXRlYmFjay5jDQo+ID4gPiBAQCAtMjM1LDcgKzIzNSw3IEBAIHN0YXRpYyBp
bnQgX19kcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdA0KPiA+IGRybV9kZXZpY2Ug
KmRldiwNCj4gPiA+ICAgfQ0KPiA+ID4NCj4gPiA+ICAgLyoqDQo+ID4gPiAtICogZHJtX3dyaXRl
YmFja19jb25uZWN0b3JfaW5pdF93aXRoX2VuY29kZXIgLSBJbml0aWFsaXplIGENCj4gPiA+IHdy
aXRlYmFjayBjb25uZWN0b3Igd2l0aA0KPiA+ID4gKyAqIGRybV93cml0ZWJhY2tfY29ubmVjdG9y
X2luaXQgLSBJbml0aWFsaXplIGEgd3JpdGViYWNrIGNvbm5lY3Rvcg0KPiA+ID4gKyB3aXRoDQo+
ID4gPiAgICAqIGEgY3VzdG9tIGVuY29kZXINCj4gPg0KPiA+IElmIEkgdW5kZXJzdG9vZCBjb3Jy
ZWN0bHkgeW91ciBzZXJpZXMgeW91IHdhbnQgdG8gcmVkdWNlIHRoZSB1c2FnZSBvZg0KPiA+IG5v
bi0gZHJtbSB3cml0ZWJhY2ssIHNvIG1heWJlIHdlIGNhbiBhZGQgYSBjb21tZW50IHRvIGRpcmVj
dCBwb2VwbGUgdG8NCj4gPiBkcm1tIHZhcmlhbnQgdG8gYXZvaWQgbmV3IHVzYWdlIG9mIHRoaXMg
QVBJPw0KPiA+DQo+ID4gV2l0aCBvciB3aXRob3V0IHRoaXM6DQo+ID4NCj4gPiBSZXZpZXdlZC1i
eTogTG91aXMgQ2hhdXZldCA8bG91aXMuY2hhdXZldEBib290bGluLmNvbT4NCj4gPg0KPiA+ID4g
ICAgKg0KPiA+ID4gICAgKiBAZGV2OiBEUk0gZGV2aWNlDQo+ID4gPiBAQCAtMjYzLDExICsyNjMs
MTEgQEAgc3RhdGljIGludA0KPiA+ID4gX19kcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KHN0
cnVjdA0KPiA+IGRybV9kZXZpY2UgKmRldiwNCj4gPiA+ICAgICoNCj4gPiA+ICAgICogUmV0dXJu
czogMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUNCj4gPiA+ICAgICovDQo+
ID4gPiAtaW50IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gPiAtCQkJCQkgICAgICBzdHJ1Y3QgZHJtX3dyaXRlYmFj
a19jb25uZWN0b3INCj4gPiAqd2JfY29ubmVjdG9yLA0KPiA+ID4gLQkJCQkJICAgICAgc3RydWN0
IGRybV9lbmNvZGVyICplbmMsDQo+ID4gPiAtCQkJCQkgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Nv
bm5lY3Rvcl9mdW5jcw0KPiA+ICpjb25fZnVuY3MsDQo+ID4gPiAtCQkJCQkgICAgICBjb25zdCB1
MzIgKmZvcm1hdHMsIGludCBuX2Zvcm1hdHMpDQo+ID4gPiAraW50IGRybV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiA+ICsJCQkJIHN0cnVjdCBk
cm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KPiA+ICp3Yl9jb25uZWN0b3IsDQo+ID4gPiArCQkJCSBj
b25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0KPiA+ICpjb25fZnVuY3MsDQo+ID4gPiAr
CQkJCSBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuYywNCj4gPiA+ICsJCQkJIGNvbnN0IHUzMiAqZm9y
bWF0cywgaW50IG5fZm9ybWF0cykNCj4gPiA+ICAgew0KPiA+ID4gICAJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciA9ICZ3Yl9jb25uZWN0b3ItPmJhc2U7DQo+ID4gPiAgIAlpbnQgcmV0
Ow0KPiA+ID4gQEAgLTI4NCw3ICsyODQsNyBAQCBpbnQNCj4gPiA+IGRybV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gPg0K
PiA+ID4gICAJcmV0dXJuIHJldDsNCj4gPiA+ICAgfQ0KPiA+ID4gLUVYUE9SVF9TWU1CT0woZHJt
X3dyaXRlYmFja19jb25uZWN0b3JfaW5pdF93aXRoX2VuY29kZXIpOw0KPiA+ID4gK0VYUE9SVF9T
WU1CT0woZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCk7DQo+ID4gPg0KPiA+ID4gICAvKioN
Cj4gPiA+ICAgICogZHJtX3dyaXRlYmFja19jb25uZWN0b3JfY2xlYW51cCAtIENsZWFudXAgdGhl
IHdyaXRlYmFjaw0KPiA+ID4gY29ubmVjdG9yIGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
d3JpdGViYWNrLmgNCj4gPiA+IGIvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oIGluZGV4DQo+
ID4gPg0KPiA+DQo+IDg3OWNhMTAzMzIwY2MyMjVmZmIzNjg3NDE5MDg4MzYxMzE1NTM1ZmMuLjk1
ODQ2NmEwNWU2MDRiMzg3NzIyNjEwZmMxDQo+ID4gMWYNCj4gPiA+IDllODQxMzE2ZDIxYiAxMDA2
NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV93cml0ZWJhY2suaA0KPiA+ID4gKysrIGIv
aW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oDQo+ID4gPiBAQCAtMTM3LDExICsxMzcsMTEgQEAg
ZHJtX2Nvbm5lY3Rvcl90b193cml0ZWJhY2soc3RydWN0DQo+ID4gZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQ0KPiA+ID4gICAJcmV0dXJuIGNvbnRhaW5lcl9vZihjb25uZWN0b3IsIHN0cnVjdCBk
cm1fd3JpdGViYWNrX2Nvbm5lY3RvciwgYmFzZSk7DQo+ID4gPiAgIH0NCj4gPiA+DQo+ID4gPiAt
aW50IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsDQo+ID4gPiAtCQkJCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0K
PiA+ICp3Yl9jb25uZWN0b3IsDQo+ID4gPiAtCQkJCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jLA0K
PiA+ID4gLQkJCQljb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0KPiA+ICpjb25fZnVu
Y3MsIGNvbnN0IHUzMiAqZm9ybWF0cywNCj4gPiA+IC0JCQkJaW50IG5fZm9ybWF0cyk7DQo+ID4g
PiAraW50IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwNCj4gPiA+ICsJCQkJIHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KPiA+ICp3Yl9j
b25uZWN0b3IsDQo+ID4gPiArCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0K
PiA+ICpjb25fZnVuY3MsDQo+ID4gPiArCQkJCSBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuYywNCj4g
PiA+ICsJCQkJIGNvbnN0IHUzMiAqZm9ybWF0cywgaW50IG5fZm9ybWF0cyk7DQo+ID4gPg0KPiA+
ID4gICBpbnQgZHJtbV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCj4gPiA+ICAgCQkJCSAgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yDQo+ID4g
KndiX2Nvbm5lY3RvciwNCj4gPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IExvdWlzIENoYXV2ZXQsIEJv
b3RsaW4NCj4gPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+ID4gaHR0
cHM6Ly9ib290bGluLmNvbQ0KDQo=
