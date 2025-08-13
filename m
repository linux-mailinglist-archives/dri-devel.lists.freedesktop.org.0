Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7369B24687
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E9810E6D5;
	Wed, 13 Aug 2025 10:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbESFdfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC7210E6D2;
 Wed, 13 Aug 2025 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755079467; x=1786615467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZtkETacaJI4IQWUrcTL8/1bZ8SNYUZ4XLw6sw4BMlRg=;
 b=SbESFdfSBcza+wAZOmDb4PNcQgM0MpRMHNOm/fO0+KtlYzKj0+As8aif
 qmmXYVLdy0GvnpExr8MmfTRVk004c8NUOY5KveqOLiTAnhFYUSAUzS1ZO
 G07beO90w21HT99QuMJKoFsfLS6rX+6vAs7yMoMsTZXacUzR1t+IwuSiu
 GIbADxqMvaeCNGJftrlki+GfaBlVCiIbJN12rB6+MTR8A4LZmyOIqRVJ/
 +FzWyOc8suYIl9/ONeRVgKkMcQaDvQk1+fRPrN7m1YjbevDomMm5OnPxi
 AMUn9IYb7CmgUg589yDRtiuFHWjgWHNv2Ri+FD5g2fEAb68o7rG6ysWUT Q==;
X-CSE-ConnectionGUID: YWXNypYYQLKYLYIRwonHuA==
X-CSE-MsgGUID: 4WJiqmQeSgCNh4hIuao9qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57270692"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57270692"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:04:26 -0700
X-CSE-ConnectionGUID: borcEQNhSSSEx6gAAG8jlg==
X-CSE-MsgGUID: X/gNl/N1TXeWXXkfdoC5Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="197289297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:04:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 03:04:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 03:04:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.88) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 03:04:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQg325TvqcxCqoYYxWmnP4aC0ujfwpKYRmHDCTgGBoONc/loAFq5taVCE0MFtti49LFrJUuPCVDWwe/iVBye9/aJJFWvLOmEDAQNeEJ16/qc2t6IOa1dE/6OY7Sc7ktGs3rm9Xw8nyZ3RnOvFGIhNbhc3Es2f4e8YUHZSYq+Ee4cmGza31tdthEaZ8VXHzrDYfuma2mlwTR1vRXG2eTCVuLSa5VV/qv9Z6g2+NER1DiFprnYFrl74CBNRd4TWMUaZNeYwIy6JxnDyTPLa3C3PD+2FqvSJkZ4YAkPr2wJ3sBGGZ6VApeuEWOGSudDVXKblyvgVWUkcvI78A/GTj/NfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtkETacaJI4IQWUrcTL8/1bZ8SNYUZ4XLw6sw4BMlRg=;
 b=PWVCJdru3VD+r7y6meQ0fmETStw4dzyZrm3qJ0+hp6JjLcSNhBF7zDiOzuPR1XT1COCoTEInjIBcWAcKQYDC/b+8dp51Mfx7+aTxofUVT2RoWRYGiH1bC+8onQQz4FdCRHPeYSBInsRF8JQI5A4NhmL1bcmvQxsQ/sViOx65wxHPN3KWkv+igmaNTtx5riQtMsAas+Xnn7uPbAOWL29JwBuDnZUrtFXGqTg0DFAeHKu0YTA7/uGHJg5J9tHE2KPBJwQ49QC3Al1NNlujXCivwRdYATTa+zO3xh9AsJEiuZiu8rBqS9T9reasCQtmlT1JPATT44PZFFR0wmq3P7OruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY5PR11MB6415.namprd11.prod.outlook.com
 (2603:10b6:930:35::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 10:04:22 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 10:04:22 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "robin.clark@oss.qualcomm.com"
 <robin.clark@oss.qualcomm.com>, "abhinav.kumar@linux.dev"
 <abhinav.kumar@linux.dev>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, "marijn.suijten@somainline.org"
 <marijn.suijten@somainline.org>, "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Topic: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Thread-Index: AQHcCqI6AGKw1/GB0USjdMcIW4UewrRdM8uAgAAKoACAAA7iAIAAJHeAgALrc9A=
Date: Wed, 13 Aug 2025 10:04:22 +0000
Message-ID: <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
In-Reply-To: <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY5PR11MB6415:EE_
x-ms-office365-filtering-correlation-id: 2a9f6db5-cbf7-45c4-7623-08ddda50c6cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S/FncEyAn0tgVs6PY35DSFtDOykYEVRIssP4ROG9lpqnOeFy+aGjBj+CvJnO?=
 =?us-ascii?Q?Fw7G+oXYcU7yiQz0R2q6lGc82ZjFRYoSpeggErMn8hUrkZ8X8pVh2ycXM44V?=
 =?us-ascii?Q?9UOkBaFGYG9Cy1mD8/uZoDtc4vB21iOkT14vA4OTpBWjynamDI6Dzdt9eAC4?=
 =?us-ascii?Q?5DcHmNPF6jyL4nBPyZ6l+FPktVwnMqhg6B1WT3jQ3ZvODXrE7moAvTKglSOF?=
 =?us-ascii?Q?skFiHHWThuFvIGMAjfMdT3fT0K3sl49gGsxu82TbZjjgR39wQnloHkMXxfry?=
 =?us-ascii?Q?VVOneD1eH8zZGsQmt3wE+oR1Zmc6iQ7jqE8N0+Krvcu5XqadIPyiKr03aYq/?=
 =?us-ascii?Q?KXWkODWvYkoWiAe01OoFO4eRmxHDCS1EJHw26x7IDDDhm+fWfRRv1W0JNp6C?=
 =?us-ascii?Q?wnnhScHxCZijBnggOYkjKrZPge+hlhLu850lQLSo0HvlAxWKHYadpeV/HEDJ?=
 =?us-ascii?Q?aGRjugGNvi+xmEgcmrnqz4/ros1gw4ph/s2NfLzA14oqg5CxTYmrHmMG3cT1?=
 =?us-ascii?Q?fs2a4XePg71rJ5Pm+FBK40mmMe+qol1iyS+agz7ZoQFah80bL3X/pr5E7HHI?=
 =?us-ascii?Q?gziwUdoZple/fddvFo4wX/DvYRJbzjMcA8QV3WlyYk3v58ElU+Tm6PRtTlub?=
 =?us-ascii?Q?aafJm32Vd8rQs4KWJl/YQ48xa6GStvwjGsfygJ7nxjqEyUUaO/AXJfHxa8/o?=
 =?us-ascii?Q?baPh8fUgOVHCiXOSFSY24bvbMqz7xXlCZDwUr7sFuqPPpCwQHJdNTAyP9ri/?=
 =?us-ascii?Q?r9y+ygaslxA+bVmgmCjmD/AYrA15Mhnmyhypr6RwhJ/E1RP+ZyrtQA3avqZU?=
 =?us-ascii?Q?X581Q7R7ycjH2ZMXiQjgaNxyBjCDnQY64RwHg+REgFwCMmn77XfsYLF7hi7t?=
 =?us-ascii?Q?go63zClnDaPSsq3MWtm9aKEjHcR2IT1mjhKUECFT+3dHQTQVKPpVcUFYsAdy?=
 =?us-ascii?Q?waAwYVPRYP8NiQ1oJ1Bpbn3E87WGYNIuzwntcWjl3n0yOVF/BQyRz+3OjX6B?=
 =?us-ascii?Q?vOmTrEelHgSaBxLFiUoakN1XoCXJIEsqs3ntz3b1NzqpFOGb/h1a87UcFOb9?=
 =?us-ascii?Q?vr4G7d4bjAd4q1vMF01Gh5pAFjCGdEIpKPEKuULpfBhJV50tZkbiPH8u2YTM?=
 =?us-ascii?Q?Yjd07oGdNdG98hNmqSYZcDFb4u6wXoDSixAzN0m+LtMqTRwXXN20FhF+n07m?=
 =?us-ascii?Q?Z4LIDnyts+YcK3YLSi8J7pE/xq+AsqrcsTCOePJwyWN+6uje+bHPORiaYI6X?=
 =?us-ascii?Q?g7DVq6OvTpNG08UuBXQE8DKmi25+ZAaG3AhsOZ5aPhLO+v9hD2W54x/nNlYe?=
 =?us-ascii?Q?Di9rR9bbrjcgcHsGvRK7PPM0vcnNkevCoVO1QgiZhzHV2jJ7S2pxZepJJnij?=
 =?us-ascii?Q?eicIHjPNVCK5QDeuWpLgkIIiW4pPRToFNo6Sc96+ir2qeFDOTw63mkQRe3mg?=
 =?us-ascii?Q?epwBhiYTonX5rXrLKnKSn0F73k07zG+aWFYiSkyoWaFFhKuNsjNUew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZuITuh/Bk+vW8fN8wS40igUs4w9iTJXC0JVeTmeY0qOVgNuAnOOPxm9aI/de?=
 =?us-ascii?Q?/jxzpIHP6Rxn3/P7vpL+tdy8yIS1916tu6wcS6lnvhBdUnhNUWdCS9aQ3LB7?=
 =?us-ascii?Q?cb6JLrw6OM7RHy9w3AqzT2wFzzVH6yjeSNYhQeyFg7S5AocrbJvVLgrbSkN/?=
 =?us-ascii?Q?bLkD835qmQJjIRMGawLIkfEYFaQuWWi3eK2IVx/SgPdzgXvsb+je7KTTb3oy?=
 =?us-ascii?Q?CeMJObVbjzheMi7k2ti2k6MOlQbr7cC1RKqzOclq5/s7U6t5kNGIyXZqNWEG?=
 =?us-ascii?Q?tch1PbgPu/V60x1GLUDCoj5tuu+lGWVL6oDSWoweV3y/7/xxSo0SO3byAy8F?=
 =?us-ascii?Q?hOxsiRscRC2SSXxULAdMgUl9vE4k4pI66JsheMuFrukVdkmPSHQv2scQ1pi2?=
 =?us-ascii?Q?8VdkZ6Eq3XBs2U5FAIH1kFdweF1joKl32aKtxwww0gY5nKP0iXGIxTNWmuU9?=
 =?us-ascii?Q?yzstRzhsXXrPVrgrZtrT3yyu8HXq77d57eAOGLY7u7sFDLL2X6ENx0miBgve?=
 =?us-ascii?Q?VN7V1agWB3roYQu8DqzUcWd2Gu2MQ3ajkaKE8jootLU2Cog0oAdngz0BToBi?=
 =?us-ascii?Q?E+OwIiuLBp74bnybI3bn3iPkWU0pyVUBm3Ul8eEFKCyWHMiXKptJvH4Cb8ag?=
 =?us-ascii?Q?xeh3UvIb/tRjwwvnmPhTZiP2iCFBZeZjsVDhUWwnJDIBvJBRMCG1HPJfQunM?=
 =?us-ascii?Q?/2TUmsmM0ftDsk51R3Oy65eQ6h76FXj/W7Ug7L7Z7qLUSOFYoPI8yqM5R4Vw?=
 =?us-ascii?Q?UFtTje2QYagZsb46zj1IWv1TwL1zBRquvvCI7s8wcGb88zUtixc13OWir0X/?=
 =?us-ascii?Q?HPQPCv126o9F9htaF4fRBshxGt63yHr7AmRgjk/PhQtoghxe2oyIsWrkEC60?=
 =?us-ascii?Q?bJKx6xfoUg2Nte6CWJsfxUeQMVIcG5M/VTyv9cDHvAhMam72GaKAxIQuNtf5?=
 =?us-ascii?Q?JCbT6KW5pTn/28LGzW3JahkvwE0AcMakxCoD3izJXpellXINQEu8hOAx94+S?=
 =?us-ascii?Q?8HgCvw78J/B+eC07pY2kUQIz7OtbclmUEbOZtk1LNqPcOKhMWTEtv6CYb7CQ?=
 =?us-ascii?Q?ZtIXFQd6L8DR3f0g/aub9QzwDGF0Y39lOLk8ctAnGYkjlOMyDVCELm64noBA?=
 =?us-ascii?Q?QMAg3D2uzM+43dATjGPC34OysXpHtYbCti9J8N808XSwQD0mB22QL4BwduMV?=
 =?us-ascii?Q?cBxd9ar5sgImC5e4BExZtxkpW1Qy71PZgvjUyj1ZBmgTWuiEj7+nxwLRuSw3?=
 =?us-ascii?Q?V/DJECjQCSf/eIuLulmDBrH80/QUixbZc5jA75LESUMUOC/j0I7c1pFWupUU?=
 =?us-ascii?Q?sj78Yk1JRtCpkBJh+meuf4Tc1xLogwo4cLdPWv9rq9Aoy/tBbf/TDMQVAuT1?=
 =?us-ascii?Q?V0yaMZ/if9d41XhDIqsH1siVYM/35jQmOAs48c0lrC2tMKg1WgVSSSMqyJPi?=
 =?us-ascii?Q?lWWYRmsuTv+CUVGQiYZiIULkE5ZuaFFKyJpkpackocr9a0Lla6BZGFBVA9hF?=
 =?us-ascii?Q?y3mFb9kFJ7GazjBZeZAwGjRi5+D7UUv5WYgWKYw7SkLgn5Uf/AEbKqhWne3l?=
 =?us-ascii?Q?6KBRojBrbp6yYMLM+IXSBFreDMdQAryNSY+A3Dw/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9f6db5-cbf7-45c4-7623-08ddda50c6cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 10:04:22.3842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hv/H6cd8VEriFYJBcl8fwi8aHiIVoCdvIvpMTyayUFORDgLQFjU9XXHUuuNopbgo2wAnZnCv4I2OwhCZahr8gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

> > > };
> >
> > I still don't like that. This really doesn't belong here. If anything,
> > the drm_connector for writeback belongs to drm_crtc.
>=20
> Why? We already have generic HDMI field inside drm_connector. I am really
> hoping to be able to land DP parts next to it. In theory we can have a DV=
I-
> specific entry there (e.g. with the subconnector type).
> The idea is not to limit how the drivers subclass those structures.
>=20
> I don't see a good case why WB should deviate from that design.
>=20
> > If the issue is that some drivers need a custom drm_connector
> > subclass, then I'd rather turn the connector field of
> > drm_writeback_connector into a pointer.
>=20
> Having a pointer requires additional ops in order to get drm_connector fr=
om
> WB code and vice versa. Having drm_connector_wb inside drm_connector
> saves us from those ops (which don't manifest for any other kind of struc=
ture).
> Nor will it take any more space since union will reuse space already take=
n up by
> HDMI part.
>=20
> >

Seems like this thread has died. We need to get a conclusion on the design.
Laurent do you have any issue with the design given Dmitry's explanation as=
 to why this
Design is good for drm_writeback_connector.

Regards,
Suraj Kandpal

> > > I plan to add drm_connector_dp in a similar way, covering DP needs
> > > (currently WIP).
>=20
> --
> With best wishes
> Dmitry
