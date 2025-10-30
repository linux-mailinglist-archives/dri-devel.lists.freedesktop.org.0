Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D4C22459
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51E410EA72;
	Thu, 30 Oct 2025 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jwp3Ruoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3533610EA6B;
 Thu, 30 Oct 2025 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856419; x=1793392419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TsC6jK1fOPWaEDmklQMNw3hKupgv0GyQZBoXEHz1+lk=;
 b=Jwp3RuooST15kbboU244NEQOydcZ5KIbPHI8cBqJsHnMVfQJehQUIQ/D
 Td6ancGV9Z45XEGMOQV7+qtkrmCmxXUHEau+OrjbgF/88sOyNUr/axZ1h
 VVn+P4GnUJVZh13jgbit+DIly2x+SafVNo8/pz3g9TfsATRsvvzCU0K51
 0vA+7AVKUHa02YmgI7/3lOrrqpTThBQvlf8kQ+vJtLGe/8VXIBDMdl2LU
 Hv2FlidhoKVMnKrkevC9jUsCvNkioqpFJAhbMHymSK6pG0CPDW/ldDjoZ
 BD323s+8bk+3rqMKZmstRTME/tV3JwcFW3OoNjgeUbgcQ43N2VXTt95up A==;
X-CSE-ConnectionGUID: DRGMFvTfQReLsyLFPpuC1w==
X-CSE-MsgGUID: UiBTKVuyQHyMXn1hHyRirA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664334"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:39 -0700
X-CSE-ConnectionGUID: dj1MJxxbRBuvUwHnhkAubA==
X-CSE-MsgGUID: FSTkHfsSSx2NiIPBMW7C6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262723"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXEXfKL13wUaZqGSmPlwB/S9KcOYnlCw7t93eGzJ5iXtCVmK6V3PkVrhNz/WYzsHWPOp4r6eN2/RGlf8M8AyQlgYWXBJGbYAYloXgdWzjW4rejcrbRiQF+X1JhI4Ez9bm5gRgxyLyXI7yiy0mY36L/MvTGfpW2tMeAwWRhN3BiVAmu4v+3lZ4V7McA2N3lIXrYyOUzuWfK4ySv3LkCF2c2SqCyEhxscxZqV2i/STanLac6vTfMYor+BJsvxEXNJW4CEX81GQXLU4PUrcmv+lfiN2gut2qdQOe5B7UL7PVk80VYM0beuG1hcX1v78lUVx2gtvbPtnqNWn+AwvGPR1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+g8F1eQSBXBcofDpiIZuRgoOZGJozLcJ2aRttAP/QM=;
 b=g/lXw017mHSxm5G5G73CscFmyUFLuy3Y1VViJsH+Susk6Ed8V5jI317AcgN2LhRLgVy574gg1xbhez/aQjHyBK2Z64URXvRhlhr+AXiCkNIoxuT6aYFVHB1pKN37PZQ/JOBqlCymMHJwy6cUNzRkZtPA7KKL8ZYXjYhyyYh4A+x8UvuN+4qx67R/9VyLGwtOAFl0ebmNfIHmAQOOh3dktDb4fJ5cxxo9XOhFFx3ROdqqE/YXbajbvk9239p4LscIsmTwELlpyQMmOcsPEJZNhdNwk6NPAfHaULyNMpAuWMXYRPovZXaBZBsWOZ3iP0DlYpPUtyfiYjWXoVvqsMTTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:35 +0000
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
Subject: [PATCH v3 20/28] drm/xe/pf: Add helper to retrieve VF's LMEM object
Date: Thu, 30 Oct 2025 21:31:27 +0100
Message-ID: <20251030203135.337696-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0095.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 386061e8-3e10-4a08-16bd-08de17f399b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VThianhFNzhobCtlVkI1ZStFMGRla2dpUW96U3hwSksyUjdPR1F5eXR2TjJw?=
 =?utf-8?B?WGsrZXo5NkdGMzFoS1Q5UmcwZVdhSGVpVVQrakdlZkd4TWVpZVBWQW9mTDUw?=
 =?utf-8?B?ZlJqTU00YndKVzU0ajY3UElCZmtKR1RoWnJMdm5UZ1NjdG5nckhrbmdqQmRv?=
 =?utf-8?B?NUV2Zk9uZUhSWjZ6MHF5TWNBMTR3WFRoT3BwQzVpSWlBNHdadzdySDNVWjRM?=
 =?utf-8?B?SXR1U1F5RERMZExzYkhTRS9oMVJxWjhiYjJ2Y3ZhQ1h4NTVXRGpYS1VGOGZY?=
 =?utf-8?B?aTNRaVNCR1V5YTFETkdEdGtJUytFRlBWK0NXUUVpTEhNTWNWcWNheDFSMkJr?=
 =?utf-8?B?dWpRK0ErWFM5TXNEV2xxeEFTRDB4aFcvZkV4cjZBTnE0NHJ6SHFDUmtzeUNm?=
 =?utf-8?B?S3gzT0dUZ0F1NW5PRW9rUVI3ZkxNc2pISGtBeHN1WjdxNnIyaFhnbkJZNzgz?=
 =?utf-8?B?U0xmUU1jOU16MmlHTmNSWS9ZMGR1VHJsTDdqYjhGYklRTGRjaTVTVk9Bekl2?=
 =?utf-8?B?eGdVVERmeW8reERta2REYkRUeDd5SXRtNmFac3BzSWZ3eVBkWkNQVllySmU1?=
 =?utf-8?B?RTByL2hlcmZXaEV2L0MwWWNBc2J5NmVscDI1bHArK0N1d3JueFBFdXVYNXg4?=
 =?utf-8?B?N09DTFZvY0orUWVWR2JuMERyU2s2Tml4amxVOEhkMGNvUUJoS0pGbFhwdlI5?=
 =?utf-8?B?Q29CRnZxTEZ4eWNidXBpVHJZMHh3ay9TWGpTT2kwM2tRMTJDeUVRVzZvUlh6?=
 =?utf-8?B?bnhlTXE0ZUdhd3R6UUdpMlpCS3lXdmV0OGMyS2RkZC84KzhjTG42Rzg1SnRU?=
 =?utf-8?B?QmdPNmZ4T0E1Tys0YnRhZTJ6VFF2TmM2SzdNRTBqOXJPOXI0UWRDUTFhS3hU?=
 =?utf-8?B?STVzcGpmNTlJaE8wS2wrb0NZZEJNb2xlT2sxQWpob2JsVVNUeDN4MkhFU2g5?=
 =?utf-8?B?VnZjUGFZc0VjV0ROeWk4V0xNdm5EdCtXdGI3NXUrSVZ0NitWd1l5R2hUUWlR?=
 =?utf-8?B?dVFERC9uQVZ4VXNqQUdKcGdiQ0w5Mml5VVY2OGg3RnM4Qk9PdUxMNGY2T1Zw?=
 =?utf-8?B?d1NIK1FaT3JaMUxOaytqL2ptVlFIYXBzL1RhUmoxcVdpd2hKOWx1YkgwV0Va?=
 =?utf-8?B?SnZlRjJwV2tlay94REpXYmJhRnlMcENCSFNzcGZ3Vi9hbEtMcFJpUVBQSXh3?=
 =?utf-8?B?bDNTNUxHbnlkK3lGT01YcmtCR3RJSmZKSlRxMjBvdGhDb3ZUeUY3L24rY0l3?=
 =?utf-8?B?YWJYYjNoYnpPSmp0cUtYQk1VSzhsWkFYVlliU0pqSnFOQW1ETWRDLzlYakZk?=
 =?utf-8?B?WWRPWjlLSDhENzdSVXF2SEtaR3g5NnVyNlBXSHRyNjlIR2piUFhXbXlqYllC?=
 =?utf-8?B?WnJtTXYrNkVhRURFdUxBNTRBNzNkS25TMzdzYXhRM0U3TmZoL3N2SGdEc0Yw?=
 =?utf-8?B?eUJXSHQ2UnQ5YkxaQ3didXkrWkpxd0Rqa1NXSjlOWGRRVnkza1NEc0FZcTBa?=
 =?utf-8?B?WWxidjZtaFVLUER6QUxPcTFFbHBPTHJwUWkyelJvZS9YK2lmWXh2bFpnQTNh?=
 =?utf-8?B?dGJrUzFKaURZV3RUMTNOcVh5bEJXWkpqZTREZUVpYTFjcngrSlY1R0hDU3dX?=
 =?utf-8?B?cXZEc2Z3TklCSEk5OGlOQkk5ZHRxRXFpVXg1QnZoUytoNi81cTB3cGZtMkpG?=
 =?utf-8?B?UTJiSWJmajFVSzRhYitnTUtJVFYzdFBwdTh3eFkyQllOdGZQQmtXSFJ0Wmlq?=
 =?utf-8?B?emhndElQL0dNNVlNYjdiZVdTaHo0ODhyajJ0UXVQOWJxay9Gdm9RaFlNS3c5?=
 =?utf-8?B?aHA4MEd3aTdSWUNxV3BiK1N5dWtqeXYwMVhCN1lOQUJTaFFIZy9vRTN3amVu?=
 =?utf-8?B?SmYxK1U0K2dGNUM1L0M5UnY4dHZlcTVDYU5WK25nU0dQSVEvOWI3OWJqc01O?=
 =?utf-8?B?Y1ZiNFdYYVlNbzFBdk5SMDUwdXo1QmcwR2dqMTlFdnlFM2hWbmhISE9GSTNX?=
 =?utf-8?Q?csWbN05rcSgSM0EcXp8BwCDnT9gOJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjdhQ3l4RmRZS2NKUFo1ZmZ5OHFDbENUWFA1L2FwRGhGQkVTR3ZXTndLQzRM?=
 =?utf-8?B?N3VTTFJRRkJFT0JUTmZ1TGJ0Ry9KSkd1dlViM0V4M0hqK2ZUYVhiSFVXSnk2?=
 =?utf-8?B?aE5Gekpwdk5xRDJkQjJ6ajJFcnBodVY1SDFDQVRkUFluNTh6UGVrRW9URnEx?=
 =?utf-8?B?cXhtdEU1UzJwak1oV2hxdXREUlhoakN0cVZXMXFTWVpQU3p6TExNUEJXNDhI?=
 =?utf-8?B?MndCTENQSEU1dHpNM0FSc29ZRWJzNG1RUzM4d1VUQ1dLTS9EU2t1MU9BVW1F?=
 =?utf-8?B?T1NXa2o4WDVHTXRSVTc3dlFzTVRhZWIzQ09reGZsd0RhV3o5QzNiRTh6UlFQ?=
 =?utf-8?B?ckN6MTA4S2NscHo2MEhhNGZwZXByM1VmN2ZwRDlYZDBGYlFQSTN4REtCV3Mz?=
 =?utf-8?B?SWRqWDF5dEwxWTdyU1ZFWDNZbVdsRDBLK0xpb2d0T1RFR1d3bjVYNm0xOG5o?=
 =?utf-8?B?aTdFM3VNSkdxN3lScnRGaCtjWUtYSHd1VklMVG1vZ2xjQ3lTOHNObmZTb0FI?=
 =?utf-8?B?YWYwQnVvMzdvWnFkNlZBYXcyRlBMZjdRREs2VFJJako0YTNnUmNnODNOMjFP?=
 =?utf-8?B?aFBPdGo2ZC82UWw3RUJSVHhOMkJOdExxQkt3TkE0aEJNV3ZOQnpmRXpRYWxy?=
 =?utf-8?B?cm11UGpva3RTUHNXdXVHQWpweHRTY0dqMGpyU0ozdkp1TFYwTUh3TDVrdmoz?=
 =?utf-8?B?OHltT04zcjVVYUhOMUJiUDNPUkZ1ZnpJa2RkR3AxK2xJZnluOUFqeDNPNW94?=
 =?utf-8?B?QXh6Ykh4WkZMeDk1d1MrdXVTS3JOUW5GQmdDNHlwRzFTK0VwUE5Ia21iSVFm?=
 =?utf-8?B?NkxEajhVcW9pTWkvQUREMXFjMTBaRHFYOEdXRXVEV0sveVlkOFNTS2xUMlVr?=
 =?utf-8?B?RjBtY2RQc2NUQk1odXJldDJRcFdmall6WklsZytxc2EyNWVqaXN6dFZFdTVz?=
 =?utf-8?B?azFqWnYxR2c2ZkdqZUR2aVZHN01NSDZ3ZjM4MXVIY1JIVElNbC9MWDlONUYz?=
 =?utf-8?B?eGVrU0J2R3Z2N1VPQm54SXB2WW4zSG5CYzZucmltelU1elYyMUx5ODRSN0hv?=
 =?utf-8?B?ZitvQ2RQTXV6d1hXOFBmTVNzcVpCcGpMTWxHd3JzNS9QNlhmQkZJMjcwTFNv?=
 =?utf-8?B?cHFFSXNSNk5MM21FSklpM0dRdXNId1VsKzIvN2Z5UkFuc3Mxd0xDQnRxemJO?=
 =?utf-8?B?YkFpeGhHeHJ6Ylg2OEpHNzF2eXExK3NNS1F3L29XOVcySHBaS0NSb1ZiSTNX?=
 =?utf-8?B?YkxzTE1jcDBqOHpCQTRHdnFzeWJtYzd5cUtLOVBSYzROYkZ0NnRWTXhkZnRX?=
 =?utf-8?B?bGxvSkZzZ1pRVlpNeFcrNTdnYTlsVmV4K1dXWmhKSXJ5V043VlpyT1I1RkNw?=
 =?utf-8?B?VjgrZVNjSEx5VkFrdUxkdjdpUG8zc25sc3JlOFVTS3k3dWE3RTlsMWpiUTU0?=
 =?utf-8?B?M0lHaEF6RzdkTWNFa1Uvc0ptaFRqK3RMY2ZGRzA3d0V1bWZwb3RVQ2RvVDRX?=
 =?utf-8?B?ejN5aEQ0M09rRlhWeDZkU2h4U0RtaGNtUS8wTGllQ0MrblRjeTI4ajloOVQ0?=
 =?utf-8?B?WmpDenNSK2JzZFVIb1dwOGVjZmZyVmRLOXRVaDYzQ01Cd0d5TFJyRzJ3VGNC?=
 =?utf-8?B?N1dLdlIwaVRkdHo3MVJjajJSdGxMeGxaRVUvZjQrQ0QyaDkzY2Q5d2xiVjda?=
 =?utf-8?B?aUJYY3llOVFpVVZUbEVQNFVzNlZPOWVrbTdnbjg3SDQ2VldnaXBESnM3SFVy?=
 =?utf-8?B?WnU3ZlUxN1NnenI3RlRFT1NXRlNPbWgzM2YyVDNhTFJtNzhza1M0eEZlQUpZ?=
 =?utf-8?B?Q0tGNW90YlhaWkxRT3dFVkx1RENpcnRmZGVVMmxsL0RwSXJiR0Z0QWVHem0x?=
 =?utf-8?B?eWVCZDRDaHl3KzNYNXVkUVUyZGhOa2FrREUyMjdPSHJ3N282M3IwUjFTUUZy?=
 =?utf-8?B?NzJwdVJTdFZLOXM5SCs4MUpIRXNuMENiVS9JTDNDUVIwV3BLZW04SHdpcnpv?=
 =?utf-8?B?NnhGaVB1NVV4OVl0NlE2TkRVN3ZOMEt4SkI3WXVIeFpTbU9rbXpwbWR3QVJj?=
 =?utf-8?B?bWpsMFJ5NEcxM1ZmTHF6ZWpXdGlsYnFObUY2M1lTZXZkQW9tVUF2RE9aZnhQ?=
 =?utf-8?B?UytHUWFVT1N0azVOMnBoNHN6QUkybTBFWThLTzFNQUIyUGt1a3hBZjVFMkVi?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 386061e8-3e10-4a08-16bd-08de17f399b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:35.7633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAlYFh/0k0xZYLvGSD6UNbB9xlivstQwZ56vbuXYVkMc9tY1r6r6flzULaR2sR2wr6YnmF9WxqzlHbiVKSTnyW4zZYTgoLeBVfihd33baa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Instead of accessing VF's lmem_obj directly, introduce a helper function
to make the access more convenient.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 55444883f2ac3..0815f761969f0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1651,6 +1651,32 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 					   "LMEM", n, err);
 }
 
+static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->lmem_obj;
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj() - Take a reference to the struct &xe_bo backing VF LMEM.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function can only be called on PF.
+ * The caller is responsible for calling xe_bo_put() on the returned object.
+ *
+ * Return: pointer to struct &xe_bo backing VF LMEM (if any).
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_bo_get(pf_get_vf_config_lmem_obj(gt, vfid));
+}
+
 static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 0293ba98eb6df..d9fbc6c30b158 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.50.1

