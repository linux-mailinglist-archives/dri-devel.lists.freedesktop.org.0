Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FADB1E15E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3036010E1BB;
	Fri,  8 Aug 2025 05:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuyN/s9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5636010E1B9;
 Fri,  8 Aug 2025 05:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629340; x=1786165340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mL3z+KDmE8lsPTMdsDQf9mAyQ6qT46UYDUftbimMqrY=;
 b=LuyN/s9SCSM6n9cglZhrRC+akgqujxvkmNIl2k4gEQGhiKsOtpLAG4sC
 mJ7An8k7qzeFUtzsv3CQ3O2YHd//JeFWreqwJwJPEtEMT/RH2FB+ms4NJ
 EvdsmTBoHG537aipZO+gHZDgX/sdG+efy6w6UElmkmq9QroaJyvcNP7g+
 FZBMwdB/9zvLYDerHsYBxr+4xHMIgdmccv5+PXcBQX19KtdtY8l2HfK8P
 Pt2CtB8IT9TjXZhgUzhMNHhBaWLJXENUGEEaegv1dkJT9E7UQikhcCewd
 2Xdq/fA1L06exvihz2bhvsaj9KoiAl3OuhgjlX8a8ZJeY8Wa7tzUunYNm g==;
X-CSE-ConnectionGUID: +AulND72QoKEIOZiGaIN6A==
X-CSE-MsgGUID: r/qEtYd6RR2m4utBQVSxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68344331"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68344331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:02:19 -0700
X-CSE-ConnectionGUID: Amvl0rg3RzGtjy1M+U0oKw==
X-CSE-MsgGUID: L1oWINP9R06tEeZrlAi+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165142363"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:02:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:02:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:02:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k36OpWseogfiSpPMuCn1Tpzj0jWEJXpn/A2vANfRdTsovQSRU+m63pDgcItHIRKCo+B9nimCXs2kjNq1W0RpYdHtGmEChCj5QGLPwXMQxs0HfFyscFKpFTK522Iid0UGY30gAcJVM9NAnF4nSFwnhTGzyMMuX0XCjpta86ZZnO9r/RprGZBV6pVHhqO87Y3GNdWMDWrmpZE3g+bimzhranGNergmp776QlbtyV9RlN0B6m708GTxnv3juqbbb14b8EJO+MvgAuXzRGyEyiSQVn2WJ2R5yFrRN5rNm+bRAqYOuHfUBi4MLmHJhGqfc0QnGoLmNA4XsLodl3OcsGyciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL3z+KDmE8lsPTMdsDQf9mAyQ6qT46UYDUftbimMqrY=;
 b=AToTJ8Uv2SP18wD5G4uwpWpi6RaxeXtGk1Fy0pFczwAdO8PAG3Dm6+cov5QzeWQfrbcPJBCFOZvLZAW7uV86qv+hBiwLEuHMxNgvttU6dcBbtmPudVYxKJ8bcLN+x64kWC7+jwtBP7zt+8QRTjbODpAOV6ydtFtrliB0ChyrN4djwO//T0JHzgEoY/uFNIpOuivqBS4Dl8KBBn8JDe0jfc7T2gv+dGyew6qyvnS6Tl6QYZlkeicqVMd+ws9nvhW8JawtSOZUmswruyvMqKF1Ek6znPJkWqdnkr2Yk5OcP2xaUjY3Omp0M8ZGnqE2aPgJMSq5lECC495o5Z8KM4GxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 05:02:14 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:02:14 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
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
Subject: RE: [PATCH 1/8] drm/amd/display: use drmm_writeback_connector_init()
Thread-Topic: [PATCH 1/8] drm/amd/display: use drmm_writeback_connector_init()
Thread-Index: AQHcAutk8XdUsO9Rb06l9QdVYXULBLRYPNJA
Date: Fri, 8 Aug 2025 05:02:14 +0000
Message-ID: <DM3PPF208195D8DC88EBCF9305450C8FFA6E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-1-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-1-824646042f7d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB6053:EE_
x-ms-office365-filtering-correlation-id: 2de3bb8c-9734-414c-f947-08ddd638bda6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?TERPYkl6Q3UxQUs1QjJmVjMrMlNDdDdJMWNUNWtEekdndGRoVk85NGduNmtR?=
 =?utf-8?B?WHh2ZGh2cVhoZDUwTlI5WVR6ekxpRmJJRlZtcE5ZYmdORDlGUmVoS1dpMGpa?=
 =?utf-8?B?ZGFvQWxHQ2t3V0p5VEw0OEJScUdNRWVhNStpTVBXck4vQXk5MlN5dEN3elQ3?=
 =?utf-8?B?c0pVa2JpM21Ib3duelA2M1ZRQUdnZ3BSNVI0eHhCdVFrNGlIT016c0RxYnBS?=
 =?utf-8?B?dk54WXBNeWg3MWZZUGFhQU5RWSt2d2preXVyU0pMMmc3S1FRZDNHL0JOVHhY?=
 =?utf-8?B?VkVMNDFlSzBoSFVaZkVHVi9pZjhRa3pFMThFTVdWOXFyYlFUTStTbDRFeXRk?=
 =?utf-8?B?amx2R0lqcXJaanJ6RFJFbVNBQUwzQ0JjeGVFTGhZYUhGSlNGYUx3Rk5SblFl?=
 =?utf-8?B?RUk4VElsclNUakhRd0gvd3FqV3dPQ3FSYXh6ekw1a0NFSkhjWlRsYTd5UzFw?=
 =?utf-8?B?NUkxU0IxdUZmQU12cTZyNW5zRmUvaDZmazA3bGlmanB0c3M3aXBDUEFUMzRS?=
 =?utf-8?B?eWZJSmF3TXlGNDZFcVNaRkJLK1AwUjhWYjNPYXl4eFVWWmtRZmhwMnB6UVIz?=
 =?utf-8?B?SytUVStrRmpDV3A5VFFuaGIxTVB1bDNDbE1XVFRVUlQrT2o2cEpGT0JKci9D?=
 =?utf-8?B?eWZiOCtDTXI4dWRROTBpclc5TEhIMWY0Y0cwNlhjVG1xV2RXaktBVTFucnlF?=
 =?utf-8?B?R1RJcW9VZ3Y5dCt0L3lrd0ZzWDVHTlE5TUtQdDRTQVY3TVlYcWdRWmcydi90?=
 =?utf-8?B?Z2w3S01xUVdnL05iUThrLzdQd2RISTlIWnNyWWR1TlJROVBjU1ArcUJNdm8y?=
 =?utf-8?B?YXYyaVBkNFJLVXBJWkhPZlNzc1AxanFxd1VVM2lhVTdVZlhiNDVuRExTUXc2?=
 =?utf-8?B?TnBTelNldVNZRHZDRTUwa2lUNVp0NW1POHBGc1dlWHhjeVVxQ25XZlBvSWRz?=
 =?utf-8?B?WjU3eWNoNExuY3JnOGNCcFVndWErNDVGcE1GNzVOWUdjZ1k5L1ZXcXJVK3I4?=
 =?utf-8?B?azl5elpQeW9EUnA2MHplSlVoZXNWOEQ5c0U3OGs2VDl3aytlZzA5K2NlbEV0?=
 =?utf-8?B?bzBsQnhtK2RLUzl2MWxlSWNpY0VIRS9QdWFZL3BEOVNFSkpnSDR5dS9naHpW?=
 =?utf-8?B?Uk9XVnFRNExoUURLRTVjQXVWUWFtbG5WNXRMUFZOenlsOFQ2TGxGTHNuNCta?=
 =?utf-8?B?RmduTkdrMmFHNSt1UUFFU3ZlczNHb0RpemFvU1UvKzZrMzNxQ3c0S2Y2RU5J?=
 =?utf-8?B?Tm1tYk1GWVJnaHNwZ1dXUXJBNlJTbWdvOXVQL0lzODlSZUgveWZSSDRRd2FP?=
 =?utf-8?B?VS9VL0Z1SFZIWFNMMUNGVkRabFl3UmpGYzU1NVdWWDhqRkg1TFI2MUI3aGo4?=
 =?utf-8?B?N2xXRGJVRStMcm1vWGd4Z1NkOHhISW5IME0wS1VkQlFaKzVlekZtT1oycWk4?=
 =?utf-8?B?eElpSFFKdHN5NG1jVTZvRmptbm9qTzh5ekRBb2dFWVVDa1hqU1pWWXVyS09T?=
 =?utf-8?B?QnFvK2pIbWRudHNyWC9tMGpBV2dINzFKNjgxdTI5T2FGaGRqRDFmK0RFMjIv?=
 =?utf-8?B?WmV3WWJlckw1MjVUdk1pOFdNV1lpbG5GNHppTFRnVkp5NWJPVWVKSWd6OVJV?=
 =?utf-8?B?YWI0eEFpcWZLKzcwRnA3RlRKV09pUkd6WnRCY1FhM2UrRzBPbWFGNFIwa2d0?=
 =?utf-8?B?djgwWThJS3JtOGhKTHhCSVhNTGxuS0RNeERBUUJZYVVtVVVURFlxWWNPNENo?=
 =?utf-8?B?bjdQRHFuWGlFRjZzaDBNVTkyVHhKaUF0d2VmK3FOMmZhdlBHQ2NaOFU0bHRu?=
 =?utf-8?B?SHFLbHFhQlNtSW1Ud2dVdVRWNzkxNnp5ank0aXovMm1IUW5IL0RiNTRNNmt0?=
 =?utf-8?B?S1MrKzlaS1JuVS9ldXVPdkZRRmd4NmJOc1JFTWhoR1hPK2IrWnQ5TzN3bFdR?=
 =?utf-8?B?TmZzbkhDVGVMLzg0UVg2d2EvdEI3VUhEQ2FaNy9aZXlBdzNhRTNleTRCQnR2?=
 =?utf-8?Q?vqTF4uDx9Xpmm7eMA9bUSy/Ra0ojzo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmpJaFVjUXg0MklORTJwcGxYS3E3Nm9kclZQTTdZWEdRUE1qR0hjekxUWUtE?=
 =?utf-8?B?bzBra3EvMkJ1TFNjSUJsMU1GK0c5bWpTTG1DNW1NdmVkQm1xVDJsNkJqbnNv?=
 =?utf-8?B?eSs4U0NuUzZtTzdCL0FNYm11MTdLdDJibHhjdHpFa2JleGFnVjZ0dk1OQ3Vm?=
 =?utf-8?B?ZVJreHozcG02cjRkUERJMGtHemlSVEk1SXZnUnd6Ky9pQVM1UGg2RUNhOEhq?=
 =?utf-8?B?dGZBbWhQTVdLZHc2dFZITWxiUUFEbjVET3JJZURSMHExeEtOcDdwakhDUUVD?=
 =?utf-8?B?aTMyRklmMDV6eE1NU3BEVmIzNkM0TW0zbzVzZmthSlJLU1JFaG45SXRtVXUz?=
 =?utf-8?B?RGJienlZM2x5NkRqQVBkemNrem14ZkxYTjRjeGdIRjkzcUFrVjNubHk1a0dH?=
 =?utf-8?B?NFBDSTBhWmVkVVpYaWJFSUs2cG9tQjk5Nng5V3lydGFBUUZFMVFhc0V2dmRC?=
 =?utf-8?B?NlJJZ1RHM2hickxpN3JUYmlXVjh0OGlDakJpZjU3Y1ZabmZIaGh4dmNUdWpP?=
 =?utf-8?B?bXZFd015N0ZncWpBZE1QejRxUllBblhCRFg2dGRWVjR6TE5paFpCSXVWdzA0?=
 =?utf-8?B?WmMyOEl2RGR0N0xFdVp4UE1jdW55V1ZBV2RRTnpZMzZaNnFwNytWckdIaXVk?=
 =?utf-8?B?OENkN1liUXhFd1VvMi9aMU5KYkRGSk1HcXF5WlNRZk5xSUh4K0lRTGxWNXpO?=
 =?utf-8?B?YVdLeVlFbFZrd0pkbTNLOGMxTzFQZEtCWCtqL0NQN1JoZW9qM3FYc2VWSnMr?=
 =?utf-8?B?ci95UjhJUTNvaEdYVmlOQitqVXA5R3dnOXFESkJRVUk4VXYrMlhya29jY1Z5?=
 =?utf-8?B?aXZCOTZGL2xBWEc2Y0JyeVlLWlNtY3JVeUJycDYvd3JlM1NWUGNGVU44bklK?=
 =?utf-8?B?S1NsQS85bU1ZMWdFVnRrSk4wVVEwSUp2ZTB2czNOZVhEbm5NWjJQSCtaTWdp?=
 =?utf-8?B?Z2U3VHBTQ29qV1k3MUZ4di9aTlVRN29UbEFlYklZSFpjSVovWEl0eFpQWEU2?=
 =?utf-8?B?azhMOENHVElwYTIrT3VSUGpWV3had2NmK2E2RUZ0azMrY0MyUUdYVWErWFIv?=
 =?utf-8?B?aDRJc1hhcVZLeitmT0R1NDlXb1RUY01EYlZ1ZllaWGVzRklzWDR2THlrMHhx?=
 =?utf-8?B?WkFFenc0d3duVzZnYzFIa0lsS0d2Z3Y3MDV4dVk0a1g0Vjc2bGt4dG9NUTA3?=
 =?utf-8?B?SnVzeVJzaFNZNnZMR1RxN0dkVDlwSDAvTElrWGtBYW1ZV0ZOb25LcEgydE5s?=
 =?utf-8?B?WFo4a3pTUnVkSTdJL2xRNVB2M0lleHkySVhvTFU3ZmhPSmVTbDArOHFXL0ts?=
 =?utf-8?B?OU9HdWFtRzVxMUhrY3hiS3FUWFdvNk8vVmxNcEF2WDViMWorN1JHZUQ0SmVX?=
 =?utf-8?B?WHQxMWFLYlhFVnp1NHl3cTVVN1RIRWg0elJuRDdYRUNmUGQ5anpzVTU5RmZ4?=
 =?utf-8?B?VmxRZ2RVcmxHS2U0M2ZBanAreDJWdnozc3dORkhPRm53ZmEzWTdwQitJOHdw?=
 =?utf-8?B?ME1iUFdMb3BkbkxCUklmd1J1cW9Xd1hCRXoxaG44eHQxeWYyNXJjR1ovRVZo?=
 =?utf-8?B?cTZzQXlCQTV4dXluc3cxaUp1N2pMSncvVjdMcHh4cDVpaGFQbjIzdzBuVFJV?=
 =?utf-8?B?Z2F4UkNmVllmR2JSdkxkNlNZNWZpQkRUQUs4NE8wYStFbWljVTQ2ZUJwY1Ix?=
 =?utf-8?B?K0JNU1RDbVlWeE1vWnFwY3JxVlcvTWkvV0MrSUdaRVQyTkJodnRzUFNFNmtT?=
 =?utf-8?B?S1dDcEJ5YmtEejhaSkxCZGxqQ0poY2E3RnljRGs1SkpFa00vUy9hejM0eXhr?=
 =?utf-8?B?Vzc3aGtIRW81bE5GWmFNMkd2Qmw0bjIrOHVHT1B6blNhdHRwa3R0U09MaDQ3?=
 =?utf-8?B?bmptblp5a2l1K01qZWRudTA0UXN2dmgyWHJsaW9NbE1DZko4Z05oTDNtQ1RX?=
 =?utf-8?B?cUVaWkFEWUdiQ0xTYzV1TFlCN3VoYkViMW5lV2FwVktUczNzeTg2OUhzVXhs?=
 =?utf-8?B?cFlGT0JsKzZtNEdpT05LQWk2VVNKOU9CcFJ1T0pKbWhId2RGbGpWUURGQXFh?=
 =?utf-8?B?cU1nREpZU2U3WTBPRFVMcm0vOTNnYU40a25ocXZEREtxRkdWaDFnZW9YRlg0?=
 =?utf-8?Q?oDFc+k7evpZCXLtFfFqh0JuJe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3bb8c-9734-414c-f947-08ddd638bda6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:02:14.4234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hL/+hzwHQSF7nvNQUp/aYl40lBebktO69MQzHMvKPXglQUGw4Pvmu2ohoa/3SugJtv2Q7oQBefpcXU1I5fy63Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

PiBTdWJqZWN0OiBbUEFUQ0ggMS84XSBkcm0vYW1kL2Rpc3BsYXk6IHVzZSBkcm1tX3dyaXRlYmFj
a19jb25uZWN0b3JfaW5pdCgpDQo+IA0KPiBVc2UgZHJtbV9wbGFpbl9lbmNvZGVyX2FsbG9jKCkg
dG8gYWxsb2NhdGUgc2ltcGxlIGVuY29kZXIgYW5kDQo+IGRybW1fd3JpdGViYWNrX2Nvbm5lY3Rv
cl9pbml0KCkgaW4gb3JkZXIgdG8gaW5pdGlhbGl6ZSB3cml0ZWJhY2sgY29ubmVjdG9yDQo+IGlu
c3RhbmNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJh
cnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPg0KDQpJJ2xsIGJlIHNlbmRpbmcgYSBSRkMgdmVyc2lv
biBvZiBjb2RlIHJld29ya2luZyB0aGUgd3JpdGViYWNrIHN0cnVjdHVyZSB0byBzaXQgaW5zaWRl
IHRoZQ0KZHJtX2Nvbm5lY3RvciBzdHJ1Y3R1cmUgYW5kIHNlZSBob3cgdGhhdCBmYXJlcyB3aXRo
IGV2ZXJ5b25lIHNvIHRoYXQgd2UgY2FuIGdvIGFoZWFkIHdpdGggdGhlDQpyZWRlc2lnbg0KDQpM
R1RNLA0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29t
Pg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyAgICB8ICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV93Yi5jIHwgMTgNCj4gKysrKysrKysrKysrKy0tLS0tDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4g
aW5kZXgNCj4gMDk2YjIzYWQ0ODQ1ZDM2NWRhZDcwN2RlZWQ0ZTNlODRiMWY5OTQ1ZC4uYTk5NDhl
OGQ2N2E2ZTk1NTZkMjEwOTANCj4gYjVjZGQxMDEyNThkNjI0ODAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBAQCAt
MTAwMDMsNyArMTAwMDMsNyBAQCBzdGF0aWMgdm9pZCBkbV9zZXRfd3JpdGViYWNrKHN0cnVjdA0K
PiBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwNCj4gIAkJcmV0dXJuOw0KPiAgCX0NCj4gDQo+
IC0JYWNydGMgPSB0b19hbWRncHVfY3J0Yyh3Yl9jb25uLT5lbmNvZGVyLmNydGMpOw0KPiArCWFj
cnRjID0gdG9fYW1kZ3B1X2NydGMoY3J0Y19zdGF0ZS0+YmFzZS5jcnRjKTsNCj4gIAlpZiAoIWFj
cnRjKSB7DQo+ICAJCWRybV9lcnIoYWRldl90b19kcm0oYWRldiksICJubyBhbWRncHVfY3J0YyBm
b3VuZFxuIik7DQo+ICAJCWtmcmVlKHdiX2luZm8pOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fd2IuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3diLmMNCj4gaW5kZXgNCj4g
ZDk1MjdjMDVmYzg3OGVmNjkxNjc4MmZmOWZkZTg0NzgxMzkzODQ2MS4uODBjMzc0ODdjYTc3YzA0
OTRlYWY3NjljNWI5DQo+IGEzYzUzNDg2YWE1MmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3diLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fd2IuYw0KPiBAQCAtMTcx
LDcgKzE3MSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNz
DQo+IGFtZGdwdV9kbV93Yl9lbmNvZGVyX2hlbHBlcl9mdW5jcyA9DQo+IA0KPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGFtZGdwdV9kbV93Yl9jb25uZWN0b3JfZnVu
Y3MgPSB7DQo+ICAJLmZpbGxfbW9kZXMgPSBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0
b3JfbW9kZXMsDQo+IC0JLmRlc3Ryb3kgPSBkcm1fY29ubmVjdG9yX2NsZWFudXAsDQo+ICAJLnJl
c2V0ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9mdW5jc19yZXNldCwNCj4gIAkuYXRvbWljX2R1cGxp
Y2F0ZV9zdGF0ZSA9DQo+IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2R1cGxpY2F0ZV9zdGF0
ZSwNCj4gIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0
b3JfZGVzdHJveV9zdGF0ZSwNCj4gQEAgLTE5MCwxNyArMTg5LDI2IEBAIGludCBhbWRncHVfZG1f
d2JfY29ubmVjdG9yX2luaXQoc3RydWN0DQo+IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLA0K
PiAgCXN0cnVjdCBkYyAqZGMgPSBkbS0+ZGM7DQo+ICAJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBk
Y19nZXRfbGlua19hdF9pbmRleChkYywgbGlua19pbmRleCk7DQo+ICAJaW50IHJlcyA9IDA7DQo+
ICsJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOw0KPiArDQo+ICsJZW5jb2RlciA9IGRybW1f
cGxhaW5fZW5jb2Rlcl9hbGxvYygmZG0tPmFkZXYtPmRkZXYsIE5VTEwsDQo+ICsJCQkJCSAgIERS
TV9NT0RFX0VOQ09ERVJfVklSVFVBTCwNCj4gTlVMTCk7DQo+ICsJaWYgKElTX0VSUihlbmNvZGVy
KSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIoZW5jb2Rlcik7DQo+ICsNCj4gKwlkcm1fZW5jb2Rlcl9o
ZWxwZXJfYWRkKGVuY29kZXIsDQo+ICZhbWRncHVfZG1fd2JfZW5jb2Rlcl9oZWxwZXJfZnVuY3Mp
Ow0KPiArDQo+ICsJZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPSBhbWRncHVfZG1fZ2V0X2VuY29k
ZXJfY3J0Y19tYXNrKGRtLQ0KPiA+YWRldik7DQo+IA0KPiAgCXdiY29uLT5saW5rID0gbGluazsN
Cj4gDQo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3YmNvbi0+YmFzZS5iYXNlLA0KPiAm
YW1kZ3B1X2RtX3diX2Nvbm5faGVscGVyX2Z1bmNzKTsNCj4gDQo+IC0JcmVzID0gZHJtX3dyaXRl
YmFja19jb25uZWN0b3JfaW5pdCgmZG0tPmFkZXYtPmRkZXYsICZ3YmNvbi0NCj4gPmJhc2UsDQo+
ICsJcmVzID0gZHJtbV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoJmRtLT5hZGV2LT5kZGV2LCAm
d2Jjb24tDQo+ID5iYXNlLA0KPiANCj4gJmFtZGdwdV9kbV93Yl9jb25uZWN0b3JfZnVuY3MsDQo+
IC0NCj4gJmFtZGdwdV9kbV93Yl9lbmNvZGVyX2hlbHBlcl9mdW5jcywNCj4gKwkJCQkJICAgIGVu
Y29kZXIsDQo+ICAJCQkJCSAgICBhbWRncHVfZG1fd2JfZm9ybWF0cywNCj4gLQ0KPiBBUlJBWV9T
SVpFKGFtZGdwdV9kbV93Yl9mb3JtYXRzKSwNCj4gLQ0KPiBhbWRncHVfZG1fZ2V0X2VuY29kZXJf
Y3J0Y19tYXNrKGRtLT5hZGV2KSk7DQo+ICsNCj4gQVJSQVlfU0laRShhbWRncHVfZG1fd2JfZm9y
bWF0cykpOw0KPiANCj4gIAlpZiAocmVzKQ0KPiAgCQlyZXR1cm4gcmVzOw0KPiANCj4gLS0NCj4g
Mi4zOS41DQoNCg==
