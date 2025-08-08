Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B37B1E167
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE65210E3DD;
	Fri,  8 Aug 2025 05:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRhUjgQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE4E10E3DD;
 Fri,  8 Aug 2025 05:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629374; x=1786165374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TxlVtNId+dzqsvQVuSzG9jGCutCoI336XqjgrZgAmYs=;
 b=TRhUjgQzWwo8Ba1zoSNyRs0AdiHOmsXjlPnoCT6SGFu9CsHJv4hYc431
 VS+G8/+KbGSI5HQCgl3hpj4NJRWSWSLLJjACxC6I1KiPXOeY1bvYlegM9
 DBDY3BZqFARD6uqUYILAKaqB8HbBiE7NP6wDvu1FFPgaUgAaq8f6W1xwS
 EYP/NG9XsbW/EqTknoa4ZinnRnegp99ucz1+WGSv+KTS8gwy12BhHZlQn
 IwjIBaTjkL1qYbrq9Cq8rfkzXtQhQp+j+62p1fSTjaTk+XO8LjTim+yvJ
 TxRqNDbyhnI3WrTuqYER9DhyZUXM/4q4gjH39nqN6809xIg4yb/4CA4cH Q==;
X-CSE-ConnectionGUID: go4K87DMTpSKp4qBMRFRhg==
X-CSE-MsgGUID: ELNYpTp9Rui68agZIjbbFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44566817"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44566817"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:02:53 -0700
X-CSE-ConnectionGUID: ghawQR7RRVa7d7J20yJe1Q==
X-CSE-MsgGUID: J2G4a+TFRteZ2oLFv06kdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="170622050"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:02:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:02:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:02:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.67)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOBgB67Jr1KJjRORGCI7qQ2ym7m51anbgx5+YmxGGrOMf999OraWAgXj5pA1LiCHvIuFh8+QfnDglLRer3SnumqDkJ25rz8fakoiRy1K3v13PYy4sW3Z4NVIcdxAg/JdHGP1GZyhlDUEW6fKeOW2n/nZ/8R6touF2JL3NSnXDCO2nz6ppwYETcqNRjaI560PJK1zKULFcjzAjw7CPvVDeHkkYXemciVmK/I07fh7zJAKSfU7ZDBf/ev97NLLiwYxuo6DsQvFcA4zxyBi4xZ1ncjFSgeGNNs11HMERtwhV5+pkPJ/3Mvxnesz/PCE5M3ZjGME3XRVYAzUdjty33Y75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxlVtNId+dzqsvQVuSzG9jGCutCoI336XqjgrZgAmYs=;
 b=bAmfoL7/ZHy6Nc85Y0um9awzPDE4Y88/9O48LhrqSpqlsb4Amaw6nrIzgLF2kdiw06Iq3d+Kzm2KOe24GiDhmInUTqEzSBW32x87BQcoQBiWKcFDVo/mjeMW0+xSTRJjYdKoC36oGmL1rZFQzIlI/oMIz9Tme5Juyh3gGH4yrnDlSUIuRvfbunz6YojpssPuwpMqRity47KiZRTB6FjKI6odYefONToWR+Edf73Dk1Ds6jYcuMppv9wxwFN5ZNs956H0UBCx7qFrdSFQPE6g6kzPMBQFyChxNLXLjQOBuUC/FaOkf92CPWsdtX3Gk0tl79t3/u1Bww5AZYB6SI28LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV1PR11MB8819.namprd11.prod.outlook.com
 (2603:10b6:408:2b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 05:02:50 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:02:50 +0000
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
Subject: RE: [PATCH 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Thread-Topic: [PATCH 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Thread-Index: AQHcAutmkrpOXmPeFUCNgp6T7ZeAjrRYPXhQ
Date: Fri, 8 Aug 2025 05:02:50 +0000
Message-ID: <DM3PPF208195D8D1A7E33BF0D245F75350AE32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-4-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-4-824646042f7d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV1PR11MB8819:EE_
x-ms-office365-filtering-correlation-id: a4a927e8-9fa5-4b01-1a81-08ddd638d30e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?MHJSdy9oMkIreGtFbXVBV3pQTXJJMGoyQ3VaQjBrMTB1RDhkSzNGa2JnZzRY?=
 =?utf-8?B?dXAvQ0xiWGxqTkoxZGQ4dEd2NDNWc3NiUWkwTVdCTmVCVTcyYTZ0MUV2TTcx?=
 =?utf-8?B?NXZHbEUwM3YvSWRKc3JhRVRqVDcxcVYyNTJsOXhZd2luQUFud0R4cnJMWm1T?=
 =?utf-8?B?VkpDVXFVQWZGWkVWVms0UFpSQzRZUW5yVXR4M1BLUGdaUVVCeWFEcVlCd2M0?=
 =?utf-8?B?Z3llRklOamRBYTYwRmZ4TGNuYk9ONXBpak9wcEtqZHgwK1ZpYmhrU2xFc2NQ?=
 =?utf-8?B?VUhHN3dBaUlpTXljQnpBVTNhTTN1UnFmTnJ0ei9kMTA3K0E3ZVFObjQwK3c2?=
 =?utf-8?B?TW9UVUZHYmtjbWJYeDI5Um9raUdzNzNrdE9RZ3YyQU1JT0xjbkNLcGVmRTRh?=
 =?utf-8?B?ZzZ0TUhYbktsL0V6RkdTejlTZjBueE03dHJDYlpmZHZxamNJL2JiOXErbGdL?=
 =?utf-8?B?WGxQYkJJU1R6dUJIVjlPMFdCZis2cWhUMUpsZ2ZRV0JyaHg4c1lxaHU4TTcz?=
 =?utf-8?B?ajN4ZkN1MzNId2JqM0ZOdHpwSDZFNVFxNU00YUJDSUp6dzBiMkhBZWZZMzNB?=
 =?utf-8?B?UVl6ZnQvY1dHQ25jQzc1NjBXVUNzb2xnNFRTd3dWTmFhaVZFekdaUWdGa3lS?=
 =?utf-8?B?UGNrZUVhSys4RWxWSFNOMmdoZUF1SWFrUVQxMHlOWURUc09LU0Y0Y0ZiWWNX?=
 =?utf-8?B?Tlg1emYzQWpCcDNxbEdwdmp5a255Y05lWW9UYnY5SGE4Y2w1MFhHd0pBWmhN?=
 =?utf-8?B?WWF5QklqNHhlZTl2OVRJd3pIaU1wY203SnR6VThyVkdYZjIyS3gzL3VjbzRo?=
 =?utf-8?B?dnVJV3RsWHpLdWZCUVcvbXM0bXl0b2RFVXNoWXlMUlpuR2xZUWNzclJVaXhJ?=
 =?utf-8?B?MTRTYmlqckpyWW1QN2NGRFRualVHbFR2Z3BzZW9nSTN3bUoyOVA2dmpjclRl?=
 =?utf-8?B?S1NPd3I0ZFk3VkJlN0M1WGpIZktWN2ZqYlh3RUtkMnEwYldseWpGbUJlQU4r?=
 =?utf-8?B?TXl3SkRMeDdJSk5YRjBiMkZmcUl5T0J0bDRVY2pNZSsydVRVTGZkWlRGWkRk?=
 =?utf-8?B?R3hyTDdTYlBkd1NIY1Z2SklYMlFlVk5reld0Ni9UeUdkNEpTTzRkUFlUZ2hG?=
 =?utf-8?B?ZEcyWVRIcXRsamtxTGQ5dHFpY3p0RUpXYkF1eDdBaXlTV2h2b1hheC8yaGlP?=
 =?utf-8?B?MEYxVWxUZVE2dVNBREljWW1ZbjlEc2lXb3I3MjZlSitaSVNGYVloZnQ0NHMx?=
 =?utf-8?B?U0V1eHBZL0NzdktHUkpmamxjcCs1dGgxSmErZ0hhRG5kUy9lUmwrUUNWNmdY?=
 =?utf-8?B?NncwMTAzUXZzMDFRZ285MENxanN0S0NIdkQycEVlc2t1aVhtRDdVM3h5THpY?=
 =?utf-8?B?Um1NVHVrOWJwR1NZYUhlRloyUE1uNURGd0xMWXA0Vm9jM2t2NXd3MHlmMkdN?=
 =?utf-8?B?YndDMVI2QnBudXVHLzZGSmwvcjFhTjJwaC9JNW96aEdncWEvNmV0aWs0UU5L?=
 =?utf-8?B?VEtHY0hCczZUdGJmZXBuL2NyQTZxYTJSNTZlOVdEZnFyS2FFYkcvVjRJMHlW?=
 =?utf-8?B?R1dwVU5JVVFRdjREMGNqVWM1ZnlKTFkwQ0IyWDVtNGZLN3owci9iYm56Wnk1?=
 =?utf-8?B?MnFsQUZOb0gxV2RGR1gzOG1tZ1JaYnd2T0Jxd052N3FGOFJCZU9XOGVWMElx?=
 =?utf-8?B?Y3J1aWlZKzRKMVRLOVVmZ2VrNUloVlFERFc0UVE3eVU1ZXlGdjNvZjhSYjdX?=
 =?utf-8?B?UHJ5WVBDNkJJQlZBVWliS05PMVNmTUNyZSthUVUrdk1FV2ZBZlFzVkdmOFIz?=
 =?utf-8?B?K1N1dllNSUlLb29jSHNXdUlKRUJsT0U3a0Q1MllSQU5seTZGbnlsdmN1b2ZJ?=
 =?utf-8?B?dXVKcUs0M1R6QXROUW55by9SN3pOeGVvNE1YNC9kdzUxNFJNOE5XNlo3TkVG?=
 =?utf-8?B?SWlZMThHT3hTM1laME1uOGo0RlFLMVdDMGNLZS9jb04vMXUrMytvSUxybURJ?=
 =?utf-8?Q?kOpQgBdhZthG2oDq3fChrFMXOSB/gE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWJlNDR5S2F0OWdudWZZaUZvOGhsM2U0ZkhpcjE5U2ZoeFhoRVdEdWROZkFP?=
 =?utf-8?B?ck5YQ1dXWGRjQks4OGpjbDBnam1oNnpkbE1IZld0NnpSRmMyM3lxcWp1ZjI1?=
 =?utf-8?B?VVZvejVIa3UrVSs2ck1aMlN1cVFKemtnaUY5U0pGSmFiUVR4cC9OUmtXYmkr?=
 =?utf-8?B?ZzR3RGJCdzRPUUI4RzQvVGlQQVNucGpFVE4xVks3QkVtekxCeWozZzVDT1Bw?=
 =?utf-8?B?YW1WT3M3NGhoSDZrUGRYalhYQkpPR0Q5eTQrZEM5RndpSGtoQkdpZUozN3RN?=
 =?utf-8?B?bzJDTDB6YTZIQnFDM2VUeDdjMU5BUDFGNktROFc1MFNGVkxibjVrNHNoOVZu?=
 =?utf-8?B?QVJnZi9qVUwrTmt6QStNdzg0RW1UOEpESS9jbU9BN2c2VnBtbEk1a2crMUh0?=
 =?utf-8?B?T0FpU3QvVE5jbzdEUXZUdlBSTTUwRUpQTTdXTUlpeVlhaEdjdWdIUzZTOU5L?=
 =?utf-8?B?Y25iaFNXSnprZlVoWW95Szc2Szg4VlZvL0d2MENNNzdiME40UUM3RVk0c0ZY?=
 =?utf-8?B?Q1JVb1RCeVZFcmV1bzBFWFNGR0F0bW9ja2locW1QcjRiZ2VzdGxFOS91bGdU?=
 =?utf-8?B?azVxOXhkM2drSDJXOVFtYm80bkJRT2piS3FUTEFSWlBCaTNzY0d6blpIeHln?=
 =?utf-8?B?eldIQTg4VEFyTkYxZ21yUFg4Wkw0U1VWT3dBRGZIVmQvOURWQnJLMzh5Mkpy?=
 =?utf-8?B?c29OcjFsSWdNeE1sMmpnYS9Tb1lSRGpodnFpUjlkUnNoc1hNd3dDTnVrRVY0?=
 =?utf-8?B?WnA0WU5pVE01M3Iyb3pYZXFPNXUxWjI3YWRFeHpxcTExR282M2JzVFR4ZUJp?=
 =?utf-8?B?L2JyNHMyckNQT2VUWm00MHNSOXZnU2h4VSs2SktWVVlwTEkzVmhkREtwM3c1?=
 =?utf-8?B?ankyUCtLeWVwOHhCQldYTHJqRGF0ZGxyaG8xMG5kcjROWTJHajlRL21KdXh3?=
 =?utf-8?B?UHJUQTJzSlcveVVhUnhiN2JmZjdwdkxWdnlxYmNvUWxsZnZyM1VTazJHd1BG?=
 =?utf-8?B?aGt3enJ6LzJIdCtKV1VVVU9IWWFsRXB0aVZidFQ4U2NORkFRSnp6cThPQWtk?=
 =?utf-8?B?Ny9IZWk5OFpNb2tYU05USXlocU1Ka0o0RkFLVDBMcm5oTmt2enM0QmxqZkJu?=
 =?utf-8?B?Q1RJVGhrVjYyL0R1cVQvRytUaS9keVdYN2c3TThMY2FZUEZZbVN2ZGEzbjhQ?=
 =?utf-8?B?UGwxR0kwM2kzRFFDcWh6cU03NmkyZFJneFJsK2pMa2Nma2RGR3pZaTdtM00w?=
 =?utf-8?B?UHdGNzBhL1lVS3IyUVNmdnIrUTNNa25PK2hlQnBvK1RScjFjTGloOUdEeVRC?=
 =?utf-8?B?Z3BjdlFrL2JmT1Y2WlNxNVF5QTFVWWd0NXVVUGZadFJGSmxib0hhb2JxTGVu?=
 =?utf-8?B?ci9mbEIvcnk2bjU2V29WSWdjSkJheHZOZ095Y3IraDdTc2J2TUNtZVJTMy9W?=
 =?utf-8?B?WldVZGFleWFHd1R5TDZPaGgrODFla1h1WVFreG1KLzJOdFhVQXBYVloyUEFT?=
 =?utf-8?B?VDhTOG9YQUFOSElsTWRkTVBVVi9DS1M5djE2aVNqaEVvTmhQaklJYk5xa1g2?=
 =?utf-8?B?OHNkb0tlN0ZtdW5uSW40R2pXZEp1MmgyQ0RNVEdOb1ZkNkZlRmFjaVR6OGNz?=
 =?utf-8?B?NEN5dGptWXVYMHp6UEVUT29QSU5rcWxGL3JRMWJHZm5MQ3crdmk2cFBxeHpr?=
 =?utf-8?B?OWtqSGFUNldVajJNQzZ6NldUcDE5TEdJS3V0MmU0cHdjUWx3djNtbnBZZXdF?=
 =?utf-8?B?dTg4MXliQlNZbzhXSU50K2NqQ3hSbkk2blhBVUNhay9HM3NaZndFa0V2cVNi?=
 =?utf-8?B?eGkvRWZ3R1pwQUIwS0NTcjJaNG0rMDdnK1FhMC8wTVFiaWZkeUdxLytHaDRF?=
 =?utf-8?B?MnpiUXUvSXNlTFhoWUZma0dmSU0zMHlhSkRHdFJTSWNERVAra0pIK28yMVlv?=
 =?utf-8?B?OXJuWWR3RmhjakJqRTJFd0hFVkI5Rmx1N0FydVBFdEZlY2R4aVhrSTYwMHBR?=
 =?utf-8?B?cUx1OGZ6UkJJNGpteXFkV2JXT1NUZzBqN0JReFQ4ZSszMFF0RGJUb05MdUhO?=
 =?utf-8?B?MWdIR01Lck9JK0ZobDFiRldNZnF6Zm96TlE3RGxaczBqT3hHb0oxZ2p6ZTRG?=
 =?utf-8?Q?yAvnkpxxWA+kAXt/DeWAbCWA7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a927e8-9fa5-4b01-1a81-08ddd638d30e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:02:50.3873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vt3+eC0f9XxkfC6gXMWQXSGhj3ecFmN6392R6F/iuFxEF15C4vPJmgNh9giRbQioM1FiZr+KusagAOoQxTY47Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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

PiBTdWJqZWN0OiBbUEFUQ0ggNC84XSBkcm0vbXNtL2RwdTogdXNlIGRybW1fd3JpdGViYWNrX2Nv
bm5lY3Rvcl9pbml0KCkNCj4gDQo+IFVzZSBkcm1tX3BsYWluX2VuY29kZXJfYWxsb2MoKSB0byBh
bGxvY2F0ZSBzaW1wbGUgZW5jb2RlciBhbmQNCj4gZHJtbV93cml0ZWJhY2tfY29ubmVjdG9yX2lu
aXQoKSBpbiBvcmRlciB0byBpbml0aWFsaXplIHdyaXRlYmFjayBjb25uZWN0b3INCj4gaW5zdGFu
Y2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNo
a292QG9zcy5xdWFsY29tbS5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBh
bCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfd3JpdGViYWNrLmMgfCAxMCArKystLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV93cml0ZWJhY2suYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV93cml0ZWJhY2suYw0KPiBpbmRleA0KPiA4
ZmY0OTYwODI5MDJiMWVlNzEzZTgwNjE0MGYzOWI0NzMwZWQyNTZhLi5jZDczNDY4ZTM2OWE5M2M1
MDMwM2RiMmE3DQo+IGQ0NDk5YmNiMTdiZTVkMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X3dyaXRlYmFjay5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV93cml0ZWJhY2suYw0KPiBAQCAtODAsNyArODAsNiBAQCBzdGF0
aWMgaW50IGRwdV93Yl9jb25uX2F0b21pY19jaGVjayhzdHJ1Y3QNCj4gZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLCAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzDQo+IGRw
dV93Yl9jb25uX2Z1bmNzID0gew0KPiAgCS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5l
Y3Rvcl9yZXNldCwNCj4gIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nv
bm5lY3Rvcl9tb2RlcywNCj4gLQkuZGVzdHJveSA9IGRybV9jb25uZWN0b3JfY2xlYW51cCwNCj4g
IAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9DQo+IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl9kdXBsaWNhdGVfc3RhdGUsDQo+ICAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21p
Y19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsDQo+ICB9Ow0KPiBAQCAtMTMxLDEyICsx
MzAsOSBAQCBpbnQgZHB1X3dyaXRlYmFja19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0
cnVjdA0KPiBkcm1fZW5jb2RlciAqZW5jLA0KPiANCj4gIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9h
ZGQoJmRwdV93Yl9jb25uLT5iYXNlLmJhc2UsDQo+ICZkcHVfd2JfY29ubl9oZWxwZXJfZnVuY3Mp
Ow0KPiANCj4gLQkvKiBEUFUgaW5pdGlhbGl6ZXMgdGhlIGVuY29kZXIgYW5kIHNldHMgaXQgdXAg
Y29tcGxldGVseSBmb3Igd3JpdGViYWNrDQo+IC0JICogY2FzZXMgYW5kIGhlbmNlIHNob3VsZCB1
c2UgdGhlIG5ldyBBUEkNCj4gZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdF93aXRoX2VuY29k
ZXINCj4gLQkgKiB0byBpbml0aWFsaXplIHRoZSB3cml0ZWJhY2sgY29ubmVjdG9yDQo+IC0JICov
DQo+IC0JcmMgPSBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2RlcihkZXYs
DQo+ICZkcHVfd2JfY29ubi0+YmFzZSwgZW5jLA0KPiAtCQkJJmRwdV93Yl9jb25uX2Z1bmNzLCBm
b3JtYXRfbGlzdCwgbnVtX2Zvcm1hdHMpOw0KPiArCXJjID0gZHJtbV93cml0ZWJhY2tfY29ubmVj
dG9yX2luaXQoZGV2LCAmZHB1X3diX2Nvbm4tPmJhc2UsDQo+ICsJCQkJCSAgICZkcHVfd2JfY29u
bl9mdW5jcywgZW5jLA0KPiArCQkJCQkgICBmb3JtYXRfbGlzdCwgbnVtX2Zvcm1hdHMpOw0KPiAN
Cj4gIAlpZiAoIXJjKQ0KPiAgCQlkcHVfd2JfY29ubi0+d2JfZW5jID0gZW5jOw0KPiANCj4gLS0N
Cj4gMi4zOS41DQoNCg==
