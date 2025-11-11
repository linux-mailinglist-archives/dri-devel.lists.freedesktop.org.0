Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE6C4A36A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953DB10E4D8;
	Tue, 11 Nov 2025 01:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJgwkyFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA1610E4D8;
 Tue, 11 Nov 2025 01:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823220; x=1794359220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=asdtQj/+hV2mr/yssYTzEhfVXHR74n/WMiOIztsrQvw=;
 b=XJgwkyFSeExHNDDJoz/gcP4mKKkg0HtDhv9zGiHQdSelKCDTgpOCObkM
 imWZS6YaypCAgQUjyR6/ahaehWc8uJVVIwAOffkPJ215GRPI3P+8w0EOA
 FifFfLeUx/wRgfFbNnTfiPdsDoL8vWJdxhc3EHDcuRz/7I5UCPGW8CJOr
 MIF9p9/K313saw2hPFragdLHgAPncFHbQgY3AkvyLaHbDXPDFikrieVSD
 2e9O/czkgiF6KfDcGT/sVJ2JQWsCIVgj7bVrRKMDmsbThrxvjNF9fK8Kq
 V7vGNZbUpL5H+e0MlrQmcG2TCQg7OnjjftunggWC5QFkgOFrdBaM/rzAT w==;
X-CSE-ConnectionGUID: pZzbB38ZRw+cxQn4WrWgLw==
X-CSE-MsgGUID: H1+NCGjSSJCH61O0CxkPxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82277678"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82277678"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:59 -0800
X-CSE-ConnectionGUID: Y9uADfuFTEa+meyjE0skMQ==
X-CSE-MsgGUID: qjHiLbdlQG+BX+G7mpqRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460458"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7wRWY2dY1EJmOyc29XFMnDcRedAN8Ng2ohmEb9rmUI48uIP7Raa820RtvX9f0DzeBTO4u1PZOnNW3BXU6/y6yh9H5FZ0M63pkcrfb3dQaiBIFd537gbRE0la2V2pTSJljTJ2crzVC9TkLMMOf9OuY872879Yf0tFTrBCxfYK4i21abeqTlEwMsL7+F+PwrbCXjHz0CPeuVm0pwweQFjCfDoVmksrva6n7Ezh8yTI1GMz0RTrBhLoUPrcexfuXU/3KiV1sC28pjLP9ncny9P9HTN6ejW+WFyjbl97guTRsCaLFEmxeZS+wDI+4JTfn8r3D3Ux0Kk3QM21qc1RgClIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQzEawINTQ9sdmQbZzsXV93fjTXCxLsOZ3g/3sZIVK8=;
 b=Cr/214Wr1m4EyqknnpAYJWSCwcYPPIUCAEt8XnNOiKwrJXH+ZAUC58Tm5kqt6iiNK4QB5qNMWkxQLmJkKuOcuMe0sIOBcNEw7ZmDMJaqUN8ycDdlJgjpYzPSYsSIo+mt3LNCvZdVL70Gk2aKL/ZTjpcMtvN06sV3Eu1XacnxE6PmXO+k/yb3YLZX2KdKykc0Dt1IWBaGug5FoEkMYSsHns0XP1X/9jZPhjWhiXYKETiaSSXO42q3PR8eZ2yiCJX5t8TrnKdHsBRvriBypbVShbu6PRm6vVqDGrRxmEoq3Hafx1vNC0xmcq9SUZfeJsP0tJX4qPkLZLJSAD0XuDmE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:06:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:56 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 26/28] drm/xe/pf: Export helpers for VFIO
Date: Tue, 11 Nov 2025 02:04:37 +0100
Message-ID: <20251111010439.347045-27-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9ad16a-bd24-4bde-db9e-08de20be9b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk1Gcm5wa0t1SExUQWN4b2I5WmhvbEN6ZTJqSFpIeUg0ODN4bEVCenpoVFhM?=
 =?utf-8?B?RVpPdVRZaFVPQkthSUlMVjI4cjFJejhCZ0x4K0ZGQWd5dVcvSVpSblhHNEVS?=
 =?utf-8?B?aEFRT1IzSHFQR3FJSThKWFcrREJKdk5pWVNBZTZmMlh1Y1REdUt0dmc3RG5W?=
 =?utf-8?B?eXBtdysrb3NDcVBBZGVqOXEwMGlDejVXSnlxYWQ2eUkzdmovYUZyQkEraW5L?=
 =?utf-8?B?SWZhSE1UU3psYnFKcEdUWjNkcU4xa2k4MkFNSGU5alFuem9uQnBGQjlkZUw2?=
 =?utf-8?B?NUJyeFlVZmgvMStGM2hSYkVDUWN6QUNUays4bTVwTzZpaVBXUHViSHoyV3Na?=
 =?utf-8?B?cTZiNkJzdFMyOGxkd21kekNXekczenRlV011QURBbGpCR2hDcFpteU9oUlh5?=
 =?utf-8?B?aVlUdXhhcXA0ZVF2S2kyTlNPQklyeDFGTi9SQkovd3hXK29ESysrMG1wV2gy?=
 =?utf-8?B?cUhldkxGUnEreVVWdS84dzg2bjFmNGVDaFhJd1FQM2RVKzBTWW1GTy9abFRR?=
 =?utf-8?B?Y1BhTUZwUUtUL0taVDNWZWF5ckIvZE41aFpvTUpFSTRWZjBOMldJM1B2c0I1?=
 =?utf-8?B?K2NOWUYyOUxoc2tLcGpic1U2aUhXUDVoM09xZUlUZUxhOXNnYW0rV0t0NDg2?=
 =?utf-8?B?cWFGTEtkWDcrc3A4OXVrbCszU015Ylc1dWRoaHY4KzNYOFRrSWNxV0tDL3oy?=
 =?utf-8?B?dFJ1dGErdjJZcldmMkNvZW5jWWRSR2p6RmFUVTJ2V0FlaFVnQzF2TlU4N2ZD?=
 =?utf-8?B?WmtOak9KZGZaOG9oeWxBRlhudjYyVk5Wbmh1bFMzLy9aTkV0OHhMRjFIUnln?=
 =?utf-8?B?QmdCNE9UNXJqeTZkM25jK3JYSzFNQTBOTEtWdnVoc1NsVWkxN1E1TDMyeXk2?=
 =?utf-8?B?bTN5WFA3RnRpRHJYanhFZ1pZZVAyYW02U3V6cENkYWlmMk5WQXF1UXFjZE50?=
 =?utf-8?B?TVBRZjFNbExleXB6M3NHZWE2Mnpic0o4QzJuMVBEWVkrVmVDS2lEYzhKN0xH?=
 =?utf-8?B?YnRUYlZiK0ZZRzVMTnE2SWdETWVEN3dKV0ZOQkhGVjhTOG5QWi9LRE1uckdr?=
 =?utf-8?B?cDQ1MUFIdlRpZzB1Q3JrOGJRQWtCaVJyMC9mZUZLUUlDM2ZVUnQvRlhsV0Js?=
 =?utf-8?B?citORnhpNFFsY2lBTHhxZmhoazE3ay9EL1o4WFJFbjZaZ0w0SC84OEFoVWE5?=
 =?utf-8?B?OWZraEFHdWFURWZKQm16cDhhdHFtL2NoNFhGZXdMYXJVM0VuUkdPTkNXaDdH?=
 =?utf-8?B?WkpJSkZXdFFTcjlHdElTdllmdGRFNC9jbjdTY1pRS3lhSGQ0NHBWTnBFMXN4?=
 =?utf-8?B?RngrVnNtcUNnOVIyMDRZNXkycG9jQmxNOEx0LzlGYnlSYno0M3ZhVTVuMXlj?=
 =?utf-8?B?WnV4WkNGMkJKYzhLOVpWaDdWckJlNmpiemxyaEJMRys1Tng0enFQQnY4ekpu?=
 =?utf-8?B?ZU85Tmp3RUJ5V0dhTlgzanc4eVBSVFA5Z1NEcXRHaVo4aWkxeEpkZ1ZWTkNr?=
 =?utf-8?B?NXpzcjgvZFJqekw0aEkrTU5NYy9aaG53MkV4RHVqT2pIbXZSaFNCKzNyZjB3?=
 =?utf-8?B?a2JrZWlRaWh0czg4STlqSXNJZ0VDV3BiSmJGME5BSlM2VUZ3QXh6alNYdUtV?=
 =?utf-8?B?dnU0cisvY09mZ0lwNHZoc3ZHZkRLNERydUtYbFduWlpIOGlrdXl2cC9mSVE1?=
 =?utf-8?B?elNXNHBTaVZhYm0rZHJEMGYwVXlOZmF4SXVjUzh3bjg1ZG5ONWphVFgzbVdV?=
 =?utf-8?B?ZDh4UmYvcDdPM0FVRDcyT3BycEVHSTEyQkZtbUZtN0poaXp3VGdPS2NVcGV5?=
 =?utf-8?B?S094b0FOdlIyZ0d3bCs4N1dnQWJMVWJZdjFUQlYwYUcxWkt5ZTkzNjlrVHZa?=
 =?utf-8?B?UjJNN01qYUpmMDVtNEF2WHVycDZhdW1lK1BlQXRxc09PY2tGYjVJRjdjaFpi?=
 =?utf-8?B?RWdKV210SW84S1VxT1pQc3RES0NxeTZmTzVEa1lpWGZ0YkZUc1lucWxWdXZr?=
 =?utf-8?Q?lcIlAcsV6h00pf2Rv/6prvsm82YZkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0tLMk9QVmJUSDA4TzFJM0d3SW9YWEVablgvZWdwb3JQRTlUMyszZU5SRDJu?=
 =?utf-8?B?dnV5QUt1VHRmT2p3YVNJb1dtYThwZmx3L05vYnlvVnhycE9Ec3NoajA0WWl6?=
 =?utf-8?B?TmxWSi9HQ09UVVhtcFQyK2RqeTdGL21tSG5RcndpY1Q5MEVlVjAvV1llcTJh?=
 =?utf-8?B?dERNc3JGQzArRTBtVW1JdW9qblBWVXczRGNmQU1wTG0vYlZVZCtTR0JMcitG?=
 =?utf-8?B?cU8rRm1hdStlWGtuNWxNeTlMNDdWMVBESVdkUWY4Q2lpTmtKenF1c0oxb2Yy?=
 =?utf-8?B?RUhHdXBXdWVqMnp6cWhLL3RnN0FTUWJpUTJJd3hUZVpLRWpnN1RCdUxaanJn?=
 =?utf-8?B?bVUvaXdob0dKajZYekVxSWJSY0FBOFZ6SEZLK3I0UHF5MzJ1SWV5dXNVUklm?=
 =?utf-8?B?L0NRTytNeEJ2ZklyeCtXUnRua1RQenduVVJ5ei9GV0MwaGVXRkYyS2svQ0JN?=
 =?utf-8?B?aW1XMDdtaXhpZHFLait3OStiZzNQVVpQRTNvZzBJaksrL09UNW1YZTBhR3N3?=
 =?utf-8?B?aWp0RmhBQVcwRTZ6S2FQNHJiTm5Ma1VMQ3h0c2pONTVCWVlhR0w1M1dzVHc3?=
 =?utf-8?B?SlJrRU9PTGpFa1lFZHZ6TFY0MEx0OURyVXZCVi8zTmRGMlg2R0JQSjZzN0I0?=
 =?utf-8?B?c2JsVVNGaXAzWmxMR20zTHg2NndxRm4rak8rM0x5dDJrY1RBd1hqWUxjSk5m?=
 =?utf-8?B?akNUNVRhenlERTh5STJVcWIyc0Z2SlQ2SnpTcG5MaG1HWSszazBZeGdib1Zt?=
 =?utf-8?B?dVBWMW9ETm5JamF0aHdPTmpJdGpYMm5VZU50UGtGZENHSDNVVUtCdDJzcmEz?=
 =?utf-8?B?ekFnNXozZ0xxVDJBMzN4eSsvMHhHUlFmQ1VNNDNyeUVYdldpVUs1UVhvSlgr?=
 =?utf-8?B?OEZsYzBhTHI5Smo1a0oyYXo3Z01xdWJiY1ZLTDJiNHU4d05SdlFuakZpemdM?=
 =?utf-8?B?L1FrMEhQUGRBK2l3dW9JWFJOVjQ2ZkpyS3RaeXpDTUVvaVNkMDVkNkNQaEdm?=
 =?utf-8?B?T01aSVQ0T2ZiWUJlNHhoa0h0Q1pEdC9MVGVVMDloSWNoK1plakxqV0VmUitE?=
 =?utf-8?B?OXpoSEZlTmdqZENoL0dlYVhPcmlIWEV2OHUydTFIRXlpdjhqeTNaNUIrL3dX?=
 =?utf-8?B?RWY4bWhnQzl3cGY0VGF6NHROd0k4UmFaNExCT3BPT01jcWlYNWt6ZzZJK2dP?=
 =?utf-8?B?eGtjM2kxblJla3RybmNlM2FIWHFPWDJKZzJTWmNwbk14Y0JOZjljcVlGdHZn?=
 =?utf-8?B?dWhNSE5RSzZnRk1jUEdGRVM4WEFONlV3VFI1K1NlK2lQTWxsTW9YbFlJZXg3?=
 =?utf-8?B?bUdJSHhQR2NXSWxMaHJoeG5acVJ1RjV2dUFrb2VoSDJBbEZyUm9NdkJCeVFQ?=
 =?utf-8?B?dUlHWkdDQlVaUGdjQ3ZqQ3V3YXRyamlVT0NXSktIMGE5MEc4MVRYYWtsY2t2?=
 =?utf-8?B?UEZEd1pySkpyc1BpT0xCMEx1dnZ3UkhwNUlvVCtWa05iMmpIMFhFY1hUdHlo?=
 =?utf-8?B?eDkyWkRhejJTRVo0TVZ4cE5ERHZDUWdjZWZvNk94RkZQYVJLRWMrM2N5bkVT?=
 =?utf-8?B?VlNkb1VFSk9jWEQ4cFdOdDBZT1Rqb3BpUEZNZnRING1ET1ROeDdlZ1BmQmlU?=
 =?utf-8?B?Vms0UWFKYUluanR4TUloL0YzVXhBK1FSKzZIQ3VhMDBnV1JTc1BrYXdFY1oz?=
 =?utf-8?B?OC9lRjc1Z3pTQVlNT2FkSzBBTFlsRE1lVGdYZjJrRzUwT1c5amxWRXRDRURF?=
 =?utf-8?B?azRIUFk4ZGpkRE1QR2NzSW5EQktPK3JHQ0FtY3hGOHl4WkdkbysvL3pHcnN3?=
 =?utf-8?B?Z0ZnQUhhZnB3VXlCL2tiZGk3SE1MN2d6eFdlRi9tUDcvRzRjelRLMGc0TUZ5?=
 =?utf-8?B?bU8wRitWa2pwYkltK1diUUxtZHg1Qk83ZG1DQkRLUkZjL3QvdDE5R01kRWxq?=
 =?utf-8?B?WGNFeGd3SGRqcGlzZm5VVFNzZEpoZUQyalJOR0pzR250UDM1STlKVzd5VTh1?=
 =?utf-8?B?aXA1QzIvZmFvcU10Nk14RVoyN3B1a1kyR0tFbk9FVTlBQXhWTXB1dHZjUDV2?=
 =?utf-8?B?di9GYWxlcllGeVJrN2JXZmlhZk1MRW9velRiaFltbEt5eEd1NDJrS0hLLzJU?=
 =?utf-8?B?WWc2WmsyMTZkaEpsNUUyQmF5eWo1Z2RSR2l4SHdjeW5LYVEzNWhNNzcrdXhq?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9ad16a-bd24-4bde-db9e-08de20be9b90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:55.9979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+uRZLFdqq+zW6ezKSQ/5czf8VC8KW4Hli66aWmontEGVktkToIqWP8TVbYRiVK4BXc/+KJvZLCKVQ0MNMxqaSlHjwX4RwK9QKCxegjodTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

Vendor-specific VFIO driver for Xe will implement VF migration.
Export everything that's needed for migration ops.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   2 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 247 +++++++++++++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h  |  30 ++++
 3 files changed, 279 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4b273b025d2a..eef09c44fbde6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -184,6 +184,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_sysfs.o \
 	xe_tile_sriov_pf_debugfs.o
 
+xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
new file mode 100644
index 0000000000000..5aed2efbf6502
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/intel/xe_sriov_vfio.h>
+
+#include "xe_assert.h"
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_vfio_get_pf() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
+{
+	return xe_pci_get_pf(pdev);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_migration_supported() - Check if migration is supported.
+ * @xe: the PF &xe_device
+ *
+ * Return: true if migration is supported, false otherwise.
+ */
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
+{
+	return xe_sriov_pf_migration_supported(xe);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will wait until VF FLR is processed by PF on all tiles (or
+ * until timeout occurs).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_wait_flr(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_suspend_device() - Suspend VF.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will pause VF on all tiles/GTs.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_pause_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_device() - Resume VF.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will resume VF on all tiles.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_resume_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid)
+{
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_error() - Move VF device to error state.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Reset is needed to move it out of error state.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_control_stop_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_read() - Read migration data from the VF device.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_write() - Write migration data to the VF device.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid)
+{
+	if (vfid == PFID || vfid > xe_sriov_pf_get_totalvfs(xe))
+		return -EINVAL;
+
+	xe_assert(xe, !xe_pm_runtime_suspended(xe));
+
+	return xe_sriov_pf_migration_size(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
new file mode 100644
index 0000000000000..bcd7085a81c55
--- /dev/null
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VFIO_H_
+#define _XE_SRIOV_VFIO_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct xe_device;
+
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev);
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid);
+
+#endif
-- 
2.51.2

