Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3EBA85E32
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D8010EBB7;
	Fri, 11 Apr 2025 13:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhb3VRC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E88D10EBAF;
 Fri, 11 Apr 2025 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744376862; x=1775912862;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=UJUk/uEgMNjdLbGrOrozKU3hl4QqY3UDxzRQnYowRkg=;
 b=nhb3VRC95wJpw2vZHToRtnpzjPygDzE0QYJleN/wilAefV/RafHW42Gw
 Vw8339GgLkfhx8y9Cx3tthu41+lkelNVcO1IYGHF+ZTCIVxr/utYSaa5N
 qHIFqHwZlQH7E7x+DPm0uei/yrg1GG9VDhfEZJ9fh2ltDy2hT0gBgE0yZ
 yYo4L4sgDul3CDCDBExTJvHtADTQSINPFpO2U8vd7fKyeuoCl5bZppm36
 mcusUWO2hm8FgaUmrn7JRtvfy+JdA5fSEEKs4TW6b3DAE+NpZYBFmrvyz
 lQkJAMvZ1D22SM4ulfJboRqDtJuA8cdbc+qaVSLYi1qcoKeYoAO0Q0KCA g==;
X-CSE-ConnectionGUID: BX/TDGECRQGI6uqF/G3oDg==
X-CSE-MsgGUID: ui5Gr2kCRQq+EnvijlZXag==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="57308742"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="57308742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 06:07:41 -0700
X-CSE-ConnectionGUID: OBR+LVEoS3uWVdAfd/QR/A==
X-CSE-MsgGUID: W42VYsuERNOiIMNgwFkZ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134171731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 06:07:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 06:07:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 06:07:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 06:07:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ads8gjKc5wQXFZbhx/mQgEL/vLeHeuqmOJHCOoynP+mrRO4HG6E5x7oPyPpohRiey/F1/JaD5J5GtkigEPQHHwjxdEr1rBVlNkvERkXoBesvfIQdXq96zpiXDwCNeSe73NN8+YrDnNMW44kt06IotEznl141YgoyeT/89q/2bayWlrgcmHh8MbqdDkEC1FMla+r6pLHQLPKX+JGo01eIOS3QFBnmakpJ/dvHdiuct1YmaNvr3zxdmK9Xn0RyOcBUI3/cyN6zlGgLE3cpD8gJ+yPc/AwSKh/F5Dfxz/Dl9JNInD53o8tWLIJU25d+KGRRuVJohN7aoq/39JzM+KWXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BslwpUQx2XOmU7FYUhc5/pc705gRdSG25+0+HzpBCOg=;
 b=J3JBffl72P6aj+WEsJRW01jBQePn9rjsJjdkAH7fMVes2LrRqcxhacB6VWoo6g/ZY/spaZAyLdJWmghyFdTAyFAzvxEtc3QcM47Hu3npI/l7gWpm2pXuxyWIMQsKyotkFImciOLn1Oj8HlxLNaxkXZb5GK021717QrOp6zL43RaAF/zi6TVKpbW0GXO4sglTtErvd16Vz5Tr+jEF9Im12XZTpPpu+oadOZZOi35k+FZ0hqlnictNhmuMN717ZxDhpETBNXCCCRQ2X6F2QwBd9w2xS0hj6zT9yVTeeFTM+dmGvMvDDHXYY5bMCo4xLGJiJs7xRVyKfhavtdYN+BQKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Fri, 11 Apr
 2025 13:07:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 13:07:37 +0000
Date: Fri, 11 Apr 2025 09:07:32 -0400
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
Subject: [PULL] drm-intel-next
Message-ID: <Z_kTqPX5Mjruq1pL@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: 772d7740-d069-434a-341f-08dd78f9d533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3pvHx2Qws/KnXzrKNZOQ1fvhdERi1IXwV9ww8ynm9Z/7X8gDXDKex5TRzl?=
 =?iso-8859-1?Q?PGAtcD13VnJTnp4cLVuCjn3AbQBE1EfjIAGIkqO4cn7JHEAll04vgdxyLO?=
 =?iso-8859-1?Q?Fo1+DKlSb2p1zmCQHBD6TxiGMfureWwEQPADOTFCcIwvCTvjkfN1Q4h3IT?=
 =?iso-8859-1?Q?CBuRdf8G2Y1WN0BI1LOTc8uJZ9EgI2jVFPQ2iNPyOevK8qyhYI1VLWDtDc?=
 =?iso-8859-1?Q?RxJMV3Lt6AM4xGfjpawa93Y0+ve7k01bvxWdEy9+1ynRsozO/dUYU3ouEm?=
 =?iso-8859-1?Q?kQ2GTot/+cN55R64WU4CvSFlxBnSNpastBD50jSzlXI+xSgFxeuKw/hYYw?=
 =?iso-8859-1?Q?YGbmE4V5sajxFfcbpdZyZxTqD+cRYi913106+whIf9DWnCID30XYx/6FPe?=
 =?iso-8859-1?Q?8kwdtb48181wJiu71fJCNv/dXOur8pyLYO9eqJrnmI97fSB3taZD6Ki2qs?=
 =?iso-8859-1?Q?qnMwgshf9UYVv4TZU0vKB1FtBts8bQqQC4ayF7hcp2xY5TAUsjHob6RGhD?=
 =?iso-8859-1?Q?YstSIXpNafPgQ6mjkcwBtDKZUB1k7DQF5K7qFzo21hiemU2EeZgXAbe/8R?=
 =?iso-8859-1?Q?IEDvAZH6vqLZiayH2MkNxk6p57TOXQpPrWA7YZLmUg55Bc7FlmisKcdIwh?=
 =?iso-8859-1?Q?+39KtqvFEFkSmTxT+osOe5yIUePRhdjH/oA4+5t9VrjqG38Ze0UWLXzajP?=
 =?iso-8859-1?Q?TcN1Pj6MIYfvt5xk3iudLsairLYACTAyR6vCl0mtZ+BVYlms+cWaFE0t6i?=
 =?iso-8859-1?Q?s3j77qemrVqcIjC9OKqvmMrejYl55azRU9JwU4HyGKpN1vtEUPk8tA4au6?=
 =?iso-8859-1?Q?tmu9cxM9bGwQlLRFQsV2ueQUCPPQ4aCeFwjxBt0OMtYvo4DnkUHvyKXLXu?=
 =?iso-8859-1?Q?HUVWjdtJycRU3xDlu9l58KZ0QR3/WSyBtoxLpLrtiCfz2j2AoW66jyy9eR?=
 =?iso-8859-1?Q?TJJ0zMk9fHDR5xydv2lTIH639soWSQh2WdFVJGFSl59aN51iKJzKNZYZTQ?=
 =?iso-8859-1?Q?CaqX1Yv7HcbNmndrwxKGpZIN2g/SowSFT/Mifk8RzQ+xd/2y4/POojgK1o?=
 =?iso-8859-1?Q?NVXUxf3O2/bs8EVRJ+OTSoyxIJaOB32180r37iCm8RizHbY6G31QpaRGAw?=
 =?iso-8859-1?Q?uj4HGaHaoeNayBqlB7CfyKJ3GG1mYfhTGgRDb1po0B0tbg0aA7tsO0quWG?=
 =?iso-8859-1?Q?fFSRTlyXOm+/b0hoXcctaOpQCfCI+i4S4dCm7gOf1z22PrHdxFpJh2Ry56?=
 =?iso-8859-1?Q?U9ESPyZ9QN5B2eSVzDJOhVpogxz6KSjzx47CVHym1+dzzG/7Gprr6ZdaCH?=
 =?iso-8859-1?Q?H48o+VZ3VNNcWeN4salJwFHz24VehTfOfdn1Sgi9NIdoHFMkyvaYgsKgSF?=
 =?iso-8859-1?Q?PQvvKyTnLT4Z2vsWfSgbD5ESMYSWTyk8eyDiiq6vwe/DU2eX2e4Og=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d+f+bp9iMHNYfmteHNzuUWxDJepgLLlWdzv2o0wCaWGzPSeiKzSdHQ4pbs?=
 =?iso-8859-1?Q?oYYqTp+S5ovKfIvOiHkxUgOfJLwhF9BrGHoh3B6Lu9tiYEW9fhiJocdzYF?=
 =?iso-8859-1?Q?y0W1zaRk1i6NXLfEcpShCmoqvhN9skp8hjwC/7xoVRcARNHr3FBnUyXYUV?=
 =?iso-8859-1?Q?wst8TThBbPzGiBg7v7ONzePxFdaaICH+Dlw1ZhXIQBO7mIrwl6BHO0YI4l?=
 =?iso-8859-1?Q?aCkHA2rJqBSF1vDO5+ePENZRHBnSqjmClMBJqou8/7igpuxNqH0zxEuoZG?=
 =?iso-8859-1?Q?D2+licbiNrGV/coZ7YWFS7d1pYfUENoP0HFMvsLdzePL1pmbWJzf6q1UcM?=
 =?iso-8859-1?Q?W0YFUjE4gwjr5EBSbCAcZy9V94UD6TpZtIP7rUZXjI+MbqhQlAvZx6XmiK?=
 =?iso-8859-1?Q?XfQvhR6a/XAlemSeRyOUZnV1LCpYbZeYxBNv6hKYJ96eMsgDIymQQ/JEJ+?=
 =?iso-8859-1?Q?7ULMue0tJYhov+1vuxxFXYQzsZQW+cytS3DQm9VpMdNdBauCUO/StpetZ/?=
 =?iso-8859-1?Q?cQolAx54BDJMu+6GBWSLzKPIbRotoT9yr93vq/lwi2ukRS7jGXNo7FjEks?=
 =?iso-8859-1?Q?RiSASZ5Yz1D/k1LesN1SYvT9iCR/8dPGmzu65H7tQ7DyP93dGGK2qn1FZ9?=
 =?iso-8859-1?Q?2JJJjsu62jxe2he/uVbhvhRA5rZvhMQwKD/3Rk+ecWY38Ov44ZAzHKZm0u?=
 =?iso-8859-1?Q?wZl0JkhZQXnrND2Dk2rfW1W1pcMfmj8ETUqOIUeSD4hN/OcvjUkFfErtKQ?=
 =?iso-8859-1?Q?XjL1E67s4Adp0BABLGE/ZKSAMHQOeyx1EPKexF0e+ZMS860BnR0fbonJGS?=
 =?iso-8859-1?Q?KM28jXO1Q2MI0vAL6V280nnRhBkFawJra4kh5YiKa8JdJXelHEhatKihx+?=
 =?iso-8859-1?Q?TcH4WWns4oKxUmsCuimB3dbt/iD0Uh+rdgo8Hn4N2Fz4gyIw+IAjxx19TL?=
 =?iso-8859-1?Q?TNXoeBR0Vtm9VygEMWWnjBREMpINEdje1FrjjF+St5qyT9qrD7Gb0y1A71?=
 =?iso-8859-1?Q?gOK9DToqprGUTWUgJE50vpd8nNi4HbcGeH0UXsb4OE/mYjUpslrKSg+xXg?=
 =?iso-8859-1?Q?VqIGdtghwCoTzTN3nuU2eIUZKQyxzvsauDRs1FApqht+yReNYNfMfRAQUU?=
 =?iso-8859-1?Q?APmoHHTyFrKN4nNHkeolTcsXdlxIU5GVtGmlkImnCvBkiVzO8JjCd1McXK?=
 =?iso-8859-1?Q?9vJ0Omu8jhyt24oICF8phQdtgLxjp0od/TxRyxnBj+cp40SBGg3xwr4mJe?=
 =?iso-8859-1?Q?K9ENzeFZwmsTxNUUtOpYg8v9460IJsbLt87phA5raivLwLPOaLoUKMBGyu?=
 =?iso-8859-1?Q?GNuM1jCCGxQ71C25cjNchdp9DfyW7X70RyKuDUHO4OeqWwFPM9/YXWeq14?=
 =?iso-8859-1?Q?htp4YBKx6PqDQPUgU15XgmbI9h/hxIFZ9ej+5j0sVsoHFff6pU8G12eB2Z?=
 =?iso-8859-1?Q?ecsQ+AxiKKLJ3amVPTfNikLdF0YCnSlBnBL6lQaVGIV4ObBFqUCzah1h+u?=
 =?iso-8859-1?Q?1gq0m45ZotrbQKg7OEJdN3mvknO9+ikE9ENaksyXw5wec5QETZkbO+Qgir?=
 =?iso-8859-1?Q?dEMSLugRUumkwO17xtUiB2OTh1OP2xEu+2sFntkK//YN4YcCpZiUC3pctg?=
 =?iso-8859-1?Q?OAalnx58AzcVLmVj7v6nfJ0J9z+mq9Qh6ItmrJ4ExYEF1Z9LJHdspQqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 772d7740-d069-434a-341f-08dd78f9d533
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:07:37.8353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dz/YmC1RnpBNVNK2Y345iyn9Mf2KWPVU6ZzXK3Db1iGZyrDyW0awanMOhO8bZ46rU2bdsQtn3ySES/wTbgkww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
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

Here goes our first pull request towards 6.16.

It is worth to highlight the huge amount of patches around VRR refactor.
Also more chunks of clean-up towards a separated display.
And finally some changes in the debugfs entries.

Thanks,
Rodrigo.

drm-intel-next-2025-04-11:
Cross-subsystem Changes:
- Update GVT MAINTAINERS (Jani)

Driver Changes:
- Updates for xe3lpd display (Gustavo)
- Fix link training interrupted by HPD pulse (Imre)
- Watermark bound checks for DSC (Ankit)
- VRR Refactor and other fixes and improvements (Ankit)
- More conversions towards intel_display struct (Gustavo, Jani)
- Other clean-up patches towards a display separation (Jani)
- Maintain asciibetical order for HAS_* macros (Ankit)
- Fixes around probe/initialization (Janusz)
- Fix build and doc build issue (Yue, Rodrigo)
- DSI related fixes (Suraj, William, Jani)
- Improve DC6 entry counter (Mohammed)
- Fix xe2hpd memory type identification (Vivek)
- PSR related fixes and improvements (Animesh, Jouni)
- DP MST related fixes and improvements (Imre)
- Fix scanline_offset for LNL+/BMG+ (Ville)
- Some gvt related fixes and changes (Ville, Jani)
- Some PLL code adjustment (Ville)
- Display wa addition (Vinod)
- DRAM type logging (Lucas)
- Pimp the initial FB readout (Ville)
- Some sagv/bw cleanup (Ville)
- Remove i915_display_capabilities debugfs entry (Jani)
- Move PCH type to display caps debugfs entry (Jani)
The following changes since commit bb800b56f01f430f4d7b360c758a9ed28f758d75:

  drm/i915: Relocate intel_bw_crtc_update() (2025-03-07 19:11:41 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-04-11

for you to fetch changes up to 1954629dc649b25071eec0d353288c5ee303e358:

  drm/i915/debugfs: move PCH type to display caps (2025-04-11 09:47:39 +0300)

----------------------------------------------------------------
Cross-subsystem Changes:
- Update GVT MAINTAINERS (Jani)

Driver Changes:
- Updates for xe3lpd display (Gustavo)
- Fix link training interrupted by HPD pulse (Imre)
- Watermark bound checks for DSC (Ankit)
- VRR Refactor and other fixes and improvements (Ankit)
- More conversions towards intel_display struct (Gustavo, Jani)
- Other clean-up patches towards a display separation (Jani)
- Maintain asciibetical order for HAS_* macros (Ankit)
- Fixes around probe/initialization (Janusz)
- Fix build and doc build issue (Yue, Rodrigo)
- DSI related fixes (Suraj, William, Jani)
- Improve DC6 entry counter (Mohammed)
- Fix xe2hpd memory type identification (Vivek)
- PSR related fixes and improvements (Animesh, Jouni)
- DP MST related fixes and improvements (Imre)
- Fix scanline_offset for LNL+/BMG+ (Ville)
- Some gvt related fixes and changes (Ville, Jani)
- Some PLL code adjustment (Ville)
- Display wa addition (Vinod)
- DRAM type logging (Lucas)
- Pimp the initial FB readout (Ville)
- Some sagv/bw cleanup (Ville)
- Remove i915_display_capabilities debugfs entry (Jani)
- Move PCH type to display caps debugfs entry (Jani)

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/display: Read panel replay source status through PSR2 status register

Ankit Nautiyal (29):
      drm/i915/watermark: Check bounds for scaler_users for dsc prefill latency
      drm/i915/vrr: Remove unwanted comment
      drm/i915:vrr: Separate out functions to compute vmin and vmax
      drm/i915/vrr: Make helpers for cmrr and vrr timings
      drm/i915/vrr: Disable CMRR
      drm/i915/vrr: Track vrr.enable only for variable timing
      drm/i915/vrr: Use crtc_vtotal for vmin
      drm/i915/vrr: Prepare for fixed refresh rate timings
      drm/i915/display: Enable MSA Ignore Timing PAR only when in not fixed_rr mode
      drm/i915/display: Maintain asciibetical order for HAS_* macros
      drm/i915/display: Add fixed_rr to crtc_state dump
      drm/i915/vrr: Avoid reading vrr.enable based on fixed_rr check
      drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
      drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
      drm/i915/display: Disable PSR before disabling VRR
      drm/i915/display: Move intel_psr_post_plane_update() at the later
      drm/i915/vrr: Refactor condition for computing vmax and LRR
      drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disable}
      drm/i915/vrr: Set vrr.enable for VRR TG with fixed_rr
      drm/i915/display: Use fixed_rr timings in modeset sequence
      drm/i915/vrr: Use fixed timings for platforms that support VRR
      drm/i915/display: Use fixed rr timings in intel_set_transcoder_timings_lrr()
      drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset block
      drm/i915/vrr: Allow fixed_rr with pipe joiner
      drm/i915/vrr: Always use VRR timing generator for PTL+
      drm/i915/vrr: Set trans_vrr_ctl in intel_vrr_set_transcoder_timings()
      drm/i915/display: Introduce transcoder_has_vrr() helper
      drm/i915/display: Avoid use of VTOTAL.Vtotal bits
      drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_changed

Gustavo Sousa (4):
      drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off
      drm/i915/display: Convert intel_bw.c internally to intel_display
      drm/i915/display: Convert intel_bw.c externally to intel_display
      drm/i915/xe3lpd: Update bandwidth parameters

Imre Deak (14):
      drm/i915/hpd: Track HPD pins instead of ports for HPD pulse events
      drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
      drm/i915/hpd: Add support for blocking the IRQ handling on an HPD pin
      drm/i915/dp: Fix link training interrupted by a short HPD pulse
      drm/i915/dp: Queue a link check after link training is complete
      drm/i915/crt: Use intel_hpd_block/unblock() instead of intel_hpd_disable/enable()
      drm/i915/pps: Let calling intel_pps_vdd_{on, off}_unlocked() w/o PPS lock held
      drm/i915/dp_mst: Fix side-band message timeouts due to long PPS delays
      drm/i915/dp: Rename intel_dp::link_trained to link.active
      drm/i915/dp_mst: Add intel_dp_mst_{inc, dec}_active_streams()
      drm/i915/dp_mst: Remove stream count assert from intel_dp_check_mst_status()
      drm/i915/dp_mst: Rename intel_dp_mst_encoder_active_links() to intel_dp_mst_active_streams()
      drm/i915/dp_mst: Use intel_dp_mst_active_streams() instead of open-coding it
      drm/i915/dp_mst: Rename intel_dp::mst.active_links to mst.active_streams

Jani Nikula (48):
      drm/i915/color: prefer display->platform.<platform> checks
      drm/i915/connector: convert intel_connector.c to struct intel_display
      drm/i915/hotplug: convert intel_hotplug.[ch] to struct intel_display
      drm/i915/hotplug: convert hotplug debugfs to struct intel_display
      drm/i915/hotplug: convert hotplug irq handling to intel_de_*()
      drm/i915/hotplug: convert intel_hotplug_irq.[ch] to struct intel_display
      drm/i915/irq: convert intel_display_irq.[ch] interfaces to struct intel_display
      drm/i915/irq: convert rest of intel_display_irq.[ch] to struct intel_display
      drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG
      drm/i915/display: add display specific runtime PM wrappers
      drm/i915/display: conversions to with_intel_display_rpm()
      drm/i915/display: use display runtime PM interfaces for for atomic state
      drm/i915/display: convert to display runtime PM interfaces
      drm/i915/power: convert to display runtime PM interfaces
      drm/xe/compat: remove intel_runtime_pm.h
      drm/i915/dsi: convert vlv_dsi.[ch] to struct intel_display
      drm/i915/dsi: convert vlv_dsi_pll.[ch] to struct intel_display
      drm/i915/dsi: convert parameter printing to drm_printer
      drm/i915/dsi: convert intel_dsi_vbt.[ch] to struct intel_display
      drm/i915/dsi: convert intel_dsi_dcs_backlight.c to struct intel_display
      drm/i915/dvo: convert intel_dvo.[ch] to struct intel_display
      drm/i915/lvds: convert intel_lvds.[ch] to struct intel_display
      drm/i915/tc: convert intel_tc.c to struct intel_display
      drm/i915/atomic: convert intel_atomic.c to struct intel_display
      drm/i915/display: convert intel_crtc_state_dump.c to struct intel_display
      drm/i915/pch: convert intel_pch_display.[ch] to struct intel_display
      drm/i915/pch: convert intel_pch_refclk.c to struct intel_display
      drm/i915/dpll: convert intel_dpll.[ch] to struct intel_display
      drm/i915/ddi: convert intel_ddi.c to struct intel_display
      drm/i915/crc: convert intel_pipe_crc.c to struct intel_display
      drm/i915/psr: further conversions to struct intel_display
      drm/i915/wa: convert intel_display_wa.[ch] to struct intel_display
      drm/i915/display: drop some unnecessary intel_de_* compatibility wrappers
      drm/i915/gvt: fix unterminated-string-initialization warning
      drm/i915/gvt: update MAINTAINERS
      drm/i915: reduce intel_wakeref.h dependencies
      drm/i915/gvt: use hardcoded reference clocks
      drm/i915/dsi: separate clock and data lane prepare timing
      drm/i915/dsi: unify naming and simplify checks for dphy params
      drm/i915/wm: convert intel_wm.h external interfaces to struct intel_display
      drm/i915/wm: convert intel_wm.c internally to struct intel_display
      drm/i915/wm: convert skl_watermark.h external interfaces to struct intel_display
      drm/i915/wm: convert skl_watermarks.c internally to struct intel_display
      drm/i915/wm: convert i9xx_wm.h external interfaces to struct intel_display
      drm/i915/wm: convert i9xx_wm.c to intel_de_*() register interface
      drm/i915/wm: convert i9xx_wm.c internally to struct intel_display
      drm/i915/debugfs: remove i915_display_capabilities
      drm/i915/debugfs: move PCH type to display caps

Janusz Krzysztofik (3):
      drm/i915: Downgrade device register error if injected
      drm/i915: Fix PXP cleanup missing from probe error rewind
      drm/i915: Fix harmful driver register/unregister asymmetry

Jouni Högander (2):
      drm/i915/psr: Add PSR pause/resume reference count
      drm/i915/psr: Prevent DP Panel Replay as well when CRC is enable

Lucas De Marchi (2):
      drm/i915/dram: Add missing INTEL_DRAM str conversions
      drm/i915/dram: Consolidate logging of DRAM type

Mohammed Thasleem (1):
      drm/i915/dmc: Create debugfs entry for dc6 counter

Rodrigo Vivi (1):
      drm/i915/display: Fix htmldocs build

Suraj Kandpal (1):
      drm/i915/vdsc: Use the DSC config tables for DSI panels

Ville Syrjälä (33):
      drm/i915: Fix scanline_offset for LNL+ and BMG+
      drm/i915: Reverse the scanline_offset if ladder
      drm/i915: Replace the HAS_DDI() in intel_crtc_scanline_offset() with specific platform checks
      drm/i915/gvt: Stop using intel_runtime_pm_put_unchecked()
      drm/i915: Enable/disable shared dplls just the once for joined pipes
      drm/i915: Move intel_disable_shared_dpll() into ilk_pch_post_disable()
      drm/i915: Extract intel_memory_type_is_local()
      drm/i915: Expose intel_memory_type_str()
      agp/intel-gtt: Add intel_gmch_gtt_read_entry()
      drm/i915/ggtt: Add intel_ggtt_read_entry()
      drm/i915: Use intel_ggtt_read_entry() in the BIOS FB takeover
      drm/i915: Verify the BIOS FB first PTE on non-LMEMBAR systems
      drm/i915: Use a nicer way to lookup the memory region in BIOS FB takeover
      drm/i915: Lookup the memory region first in the BIOS FB takeover
      drm/i915: Use intel_memory_region_type_is_local() in the BIOS FB takeover
      drm/i915: Eliminate the initial_plane_phys_{smem,lmem}() duplication
      drm/i915/dp: Reject HBR3 when sink doesn't support TPS4
      drm/i915: Drop the cached per-pipe min_cdclk[] from bw state
      drm/i915: s/intel_crtc_bw/intel_dbuf_bw/
      drm/i915: Extract intel_dbuf_bw_changed()
      drm/i915: Pass intel_dbuf_bw to skl_*_calc_dbuf_bw() explicitly
      drm/i915: Avoid triggering unwanted cdclk changes due to dbuf bandwidth changes
      drm/i915: Do more bw readout
      drm/i915: Flag even inactive crtcs as "inherited"
      drm/i915: Drop force_check_qgv
      drm/i915: Extract intel_bw_modeset_checks()
      drm/i915: Extract intel_bw_check_sagv_mask()
      drm/i915: Make intel_bw_check_sagv_mask() internal to intel_bw.c
      drm/i915: Make intel_bw_modeset_checks() internal to intel_bw_atomic_check()
      drm/i915: Skip bw stuff if per-crtc sagv state doesn't change
      drm/i915: Eliminate intel_compute_sagv_mask()
      drm/i915: Apply the combo PLL frac w/a on DG1
      drm/i915: Simplify combo PLL frac w/a

Vinod Govindapillai (3):
      drm/i915/fbc: keep FBC disabled if selective update is on in xe2lpd
      drm/i915/fbc: update the panel_replay dependency in fbc wa's
      drm/i915/display: implement wa_18038517565

Vivek Kasireddy (1):
      drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC

William Tseng (1):
      drm/i915/dsi: let HW maintain the HS-TRAIL timing

Yue Haibing (1):
      drm/i915/display: Fix build error without DRM_FBDEV_EMULATION

 MAINTAINERS                                        |    9 +-
 drivers/char/agp/intel-gtt.c                       |   55 +
 drivers/gpu/drm/i915/Makefile                      |    1 +
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_ivch.c            |    2 +
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_sil164.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |    2 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |    2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    8 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   24 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             | 1216 ++++++++++----------
 drivers/gpu/drm/i915/display/i9xx_wm.h             |   18 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  102 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   23 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    5 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  649 ++++++-----
 drivers/gpu/drm/i915/display/intel_bw.h            |   18 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   11 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   18 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +
 drivers/gpu/drm/i915/display/intel_connector.c     |   45 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   17 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   47 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  919 +++++++--------
 drivers/gpu/drm/i915/display/intel_de.h            |   16 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  134 ++-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   11 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   37 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   10 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   37 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  746 ++++++------
 drivers/gpu/drm/i915/display/intel_display_irq.h   |   75 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   69 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |    1 +
 .../drm/i915/display/intel_display_power_well.c    |   33 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    4 +-
 drivers/gpu/drm/i915/display/intel_display_rpm.c   |   68 ++
 drivers/gpu/drm/i915/display/intel_display_rpm.h   |   37 +
 drivers/gpu/drm/i915/display/intel_display_types.h |    8 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |   30 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |   11 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    1 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |   59 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   70 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   21 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   48 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   73 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  323 +++---
 drivers/gpu/drm/i915/display/intel_dpll.h          |   13 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   16 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    7 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   21 +-
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    7 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  209 ++--
 drivers/gpu/drm/i915/display/intel_dvo.c           |   64 +-
 drivers/gpu/drm/i915/display/intel_dvo.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    7 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   47 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   11 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |    2 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   31 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    3 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  633 ++++++----
 drivers/gpu/drm/i915/display/intel_hotplug.h       |   31 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  625 +++++-----
 drivers/gpu/drm/i915/display/intel_hotplug_irq.h   |   28 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |    1 +
 drivers/gpu/drm/i915/display/intel_load_detect.c   |    1 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |  142 +--
 drivers/gpu/drm/i915/display/intel_lvds.h          |   18 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   35 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  170 +--
 drivers/gpu/drm/i915/display/intel_pch_display.h   |   10 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  126 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |   18 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  140 +--
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   89 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |    2 +
 drivers/gpu/drm/i915/display/intel_pps.c           |   17 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  149 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +
 drivers/gpu/drm/i915/display/intel_tc.c            |  288 +++--
 drivers/gpu/drm/i915/display/intel_tv.c            |    4 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   13 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   23 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |  320 +++++-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    6 +
 drivers/gpu/drm/i915/display/intel_wm.c            |  171 +--
 drivers/gpu/drm/i915/display/intel_wm.h            |   14 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  746 ++++++------
 drivers/gpu/drm/i915/display/skl_watermark.h       |   24 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  160 ++-
 drivers/gpu/drm/i915/display/vlv_dsi.h             |    6 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |  118 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |    3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   56 +
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |    8 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    6 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |    6 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |    7 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |    5 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |    6 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |    9 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   27 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |    7 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c            |    5 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    2 -
 drivers/gpu/drm/i915/i915_driver.c                 |   42 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    2 +
 drivers/gpu/drm/i915/i915_irq.c                    |  123 +-
 drivers/gpu/drm/i915/i915_reg.h                    |    6 +
 drivers/gpu/drm/i915/intel_memory_region.c         |   15 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |    3 +
 drivers/gpu/drm/i915/intel_wakeref.h               |   11 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   21 +-
 drivers/gpu/drm/xe/Makefile                        |    1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    1 -
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |   76 --
 drivers/gpu/drm/xe/display/xe_display.c            |   42 +-
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |   71 ++
 drivers/gpu/drm/xe/display/xe_display_wa.c         |    6 +-
 drivers/gpu/drm/xe/xe_device_types.h               |    2 +
 include/drm/intel/intel-gtt.h                      |    2 +
 133 files changed, 5551 insertions(+), 4748 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rpm.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_rpm.c
