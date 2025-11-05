Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C2C363D2
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF6110E06F;
	Wed,  5 Nov 2025 15:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abYG753E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA54C10E768;
 Wed,  5 Nov 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355482; x=1793891482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GvgbyE8nFxGVHOfY00Di/Yl/nZnw7doh4L7QAzouJu0=;
 b=abYG753EgawTqXTD71xdhuRjzdb5O8bMl3cOQnUsnHJFHEZWriHMuRaz
 IrRsuVY33X+wbgme33OXpJcE/Xi9+G4tXM8JfiNa/FkBdMMNZOiPUlAjo
 TYY4KIdMUhv0BsBd4EYo+WD1PCA6+Yws2MuWD+Xe8bwKyN8TIr1Yh/7rD
 C0INpzpxFpY4r0H5pliA/1rqP81ho3vII6sNjDI1HaSV+YJ/25ItvU1wq
 FfNNHnFlYNGp32acmSrIg6pI4nd2F4/ykShkxq/2HwDtmWs9vLerNBj32
 W8LllybT8P83gHcanzOpl0jopHSNB0B/RxTSP52PeBunOc8zEuzDvHiYs A==;
X-CSE-ConnectionGUID: 3t6nzp7cTvyGx+IMkYZV8g==
X-CSE-MsgGUID: omgoJOVOTFejIhHVxWYXOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63482638"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="63482638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:16 -0800
X-CSE-ConnectionGUID: lZzi9WKKTKy5ilMfRUEehA==
X-CSE-MsgGUID: zrrfqqTaTrG4lWNbDOthsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="192649388"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:11:17 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:11:16 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:11:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIQO93TSj2bS4Ol0tfQlghai8meLvgvrbkFYajkL7t6aSb02ALhj+BA12pbEN+9T+0ih9hyp7VckdvJYMUfHj3HOUomuesPA6MpgfWJaxosTIoh2vjFb9mwqzymw6vhhKHLHLu5flMiTBDU/ZFUYoFKX+hc5QMrqkPiCx2TvdE5rth83MUaAwKXc3RN6gxaBuBfHpdRpGWoQS0uVLQlzUi5Atc6mC+nppS4tVxcyupMZTZibfieGGLkhluVs4wv44pE8Dzx4GD0Q12BKz1ZkSa9Hz1HMjFCt9UBK+xjwUxll+YrRWdUZHu2P8tAF4s81Miygvii0jUbo/cr74URKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8pZ43Tt6Ko6obd1CNjLgoXSsAWwtsO7KhyNYA4uiik=;
 b=N/6lUlRZNuoB9iUkqCzF50tA1x0xWBHHgeVm39utmYibLDkFWi6frPhzwOdM6j4WfTJebjF1IdRMVlmF2xv2kg13/UAlNL+Gw8YLA0Qbmu5PCExtI2BNflKkYZ4+5i0QDWSJFFHuX6/6DuMG2IsvXNyC5X+OrYuqRu/ZJnnjT0yS/uulHOkTf+kM14aSWY7PhS/5JiqV9IQL7c6jP+VdASX8BWgf7vRWmab2QiIjdluX7aPmgTC3GP/ycWe3JYhDKPFMXvLYRqov5oseZoXjpKWHPWkj1fqhmk7yB9pSNiEOA370BTO3C7QKJAorWPrEDyjz6zIUxRvNN1+ARNRTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:11:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:11:14 +0000
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
Subject: [PATCH v4 06/28] drm/xe/pf: Add helpers for migration data packet
 allocation / free
Date: Wed, 5 Nov 2025 16:10:04 +0100
Message-ID: <20251105151027.540712-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: b67da808-a921-4892-80f7-08de1c7d8fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVlkVW9xSXV6M2U0WmxjTWF6Sm91c1JCNEowQTUybWQ3eE1NaHFHa3g1RHBI?=
 =?utf-8?B?NFkrMU50K3dTYk9WbUNCbTJQSnRIZ0oyZklpZVhMUmU0YWJDSktEN1hSdGtp?=
 =?utf-8?B?U25NM3I0bUVIQjdpREVvcDlXY2xrdWRVbVZzS0d3RHNNSUhRZERJNjFYYzhk?=
 =?utf-8?B?VFlvZG11aDhySlBDd1pubnpUSmFNdGlFZjJidlh3LzA4Ry9MZFA4RVdGOU4r?=
 =?utf-8?B?amlKd25PK1QvaDFYR0FodWZnRlBUQ1BJVmoyZHgybDF3Ym1GajArbWN4WWpI?=
 =?utf-8?B?VTdJY3U1V2hGTzllMEtWRDhpMEZ0MzhyYnVzelRhRGg4bENwQ3Y1ZzM5bWJv?=
 =?utf-8?B?WHBPN3l4SWlHNHdvUVNjenpReE1SRTVjemJtLzV3VDdJVG1rQWRWWHljTmxB?=
 =?utf-8?B?RytWYllzMnpldXlqOGlraktlcWVFUE5PYU51UkxFZUhPenVraDk0U3VFRWps?=
 =?utf-8?B?SGxJOFYrK2crU2MxT2NYbFFJd2ZCcGs4QjBKYlRGbzZxWUx4QWdNakNDcSty?=
 =?utf-8?B?aDFhMzZlZFVPc3dUVzdibnhJcU84SVI1WVA2VExDSGJSQjdVaTFWUUNldElW?=
 =?utf-8?B?aUNnYmZISE5NME5CZnU0bUVadXF4ZWMybXlKYlAxMnE3WnJPL3BXS0N5NCtF?=
 =?utf-8?B?Uml3UnNadmwxR3NabXRGTmVwZ0NNUnBZdENXVDFTTzl1K0p1WXY1cXNHVHJ2?=
 =?utf-8?B?WkNBRVlsNjJKKzRSdDMvaDg5bUU3UVMxYkdBSE4yOVhnTGZSWmh6OGYrUGNL?=
 =?utf-8?B?M0Y0eFZZZDlUdUgyK0Ruems0RDgvSDRsTVMvc1c4a1IzL2NTVi9oaFFsNTdN?=
 =?utf-8?B?Zi9FL0xXdjBZZFlIRzk2Z1lsM1dxck51Z1B0UCtqbjNISHRvdVd4K1BWYnEw?=
 =?utf-8?B?aDh2STBSMldVZUpkaXJaNzJOZS9lZDVQOGxteG9yOVVXdzJISWNPSGhCb2lG?=
 =?utf-8?B?RXBXZ3FpNHc4aWhrYkN4RTJ0ZVdheU9SbGdsOHVRTkhMaTR3cDRuUHVpbXZr?=
 =?utf-8?B?Qm9qemhxMmJway81bjd2TElJL2VUdHJpZktiR0tmZzVmUkFOUG9hak1CNlli?=
 =?utf-8?B?L1JQYjdlaWlDb2pJKzFvQ2lFUmtKN0ZSOXV2bmt5SDByT2xwaUlkY1BDNWVD?=
 =?utf-8?B?bmJHcGRXQTFmMUhTOVZmQ2lQVFJvdVVSd0dzQ1g3dlhVTW8vejNKdGZnSzdk?=
 =?utf-8?B?bEowd1JnLzgvVVVnOGQxNTh2WHFFUGJ5UHUzeW4zOVJJanJRWDFPYU5RbTht?=
 =?utf-8?B?a3pNd2N6UEZ2RkFoSHdoUmx3Q0YwbXViYWU1MkxnRThoSnBZbFVBTGRDNTAy?=
 =?utf-8?B?SFU5VSttSWQvNjJmVFBrWjN1SUpIa0dHK0NxSHdveXovZ2xZdWlLS2oybUJ3?=
 =?utf-8?B?dGJnN0tmVVNrQVRNZlhxOGtkYTc3RHMxbFM1MHUrSFB4N01DQS9OQ1c4YVJw?=
 =?utf-8?B?NVI2Zkd2WE1UYXZnZ3prSThlbncyTU55TXFrSFhrUTBCeHBaT0ZHZ3hiQVRu?=
 =?utf-8?B?ckljT0V4Yk9ZdTd5bHpKYUdGYnRGVlcwWitha0VpN2VzOCtnK1oxTVZRcEc0?=
 =?utf-8?B?RUU4SC84eGZ2R3lNK3RWYWEwczVHNlhlSVlzOVlNT3puS0g1U2xDRWJwS2Nj?=
 =?utf-8?B?Uk52VUpXaVh0T0RNS3VmZGNKR3hsWHJTdnRQK3BvY1FPSWV0d1dpZ0NOdkVv?=
 =?utf-8?B?RThDVDdTTTEyVFFtNitMYnZick5sNnNNMXJJMy8rVnRYTERUWnRPMFovcUJ0?=
 =?utf-8?B?dWEvd2RFZFZoaEFPRURvWVFWTW9wNmRFR09aU2l4ZEFzS0ErNEUyRmpPUjdv?=
 =?utf-8?B?dDhjV0tjbHdQS1IyZnJxc0lacE1TZllheGFFOCtrMUtTZFZpUm01bGllYUpq?=
 =?utf-8?B?eWNLNWhJWWtnNjVqTmNuNmU3VFdFUU1ac2huS3RxV0ZrZUhEbzVHMkJjVlJs?=
 =?utf-8?B?VGZFSFUvaGdxbVNtUFhnd3BzcGtxTWdGbzJyNkFmbEUyOEtwL3BRd2pCd3ds?=
 =?utf-8?Q?shqdZM9Cb9KVw14qmxKRVopDVeL18I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGk2dWdBNEM1MGMzU2FmOE16ZUF3ckFLK2lOVDJPUFM2TDJ2TkxXWlpKQ01D?=
 =?utf-8?B?Nk83T0hMaEowZ0lHK2pvSnFNZ0FUbSt3ODdOa0d1dnM4MW5iZGpNZkw5Q05m?=
 =?utf-8?B?UURqL0Vld2UwOEFMNEt4SEZDTHdpQWRjRmNxeUtsMXNOQVVaeWNHSlF0L2U4?=
 =?utf-8?B?a0dRcmJnbTdxTDJ0aWRoWW1iV2RoMmJIamlhSnpWQlVaSlhmZCtzS2E5c2dP?=
 =?utf-8?B?RWw5SHJCTXFDVFNNWXRHUmJ1TUNjN3k5cjRXUW4yaFF4dS9PamZ6QytWVkxW?=
 =?utf-8?B?ZnBpbjlUM3JOdFdJNHBGODVxNkpUc2QxQ3VqaXY3cGg5aFFoeHMxWnFwamgr?=
 =?utf-8?B?WkVudVdRYS9SSXBBVFZZbmxqYnVIS2ttQWtRaDdReGEvUU01YXJxY3ZTU0FP?=
 =?utf-8?B?SjJUcVJsNnRGYjhjR1I2b2VJMjB3ZGNOT2VUTnVJRVlFSWtKUlZvZy80ZW51?=
 =?utf-8?B?eEpueFJZa3Zxc3dSTnZvMlpEeEo1bzZXTkViOXprQXliOVorRlhUQnZTWFNP?=
 =?utf-8?B?b3VMa3MzRVZoVEVpZk1qSGl5NUhMd01STmtGOXdCTVNkdXRyMjU5Z2p0cmNU?=
 =?utf-8?B?dks3WlBHKzNBVTRrOTF2czJpckRjUjJISElUamlWYkN6MDJob1hGVzYwek0w?=
 =?utf-8?B?NTBFR0w0MlZpRXZ0OVZWeThjRGlHTW5DOUhFUU9xdGwvbkJsd1hEU1hBbmY5?=
 =?utf-8?B?aTI3MDNCajFJci9TMXR2RjlNMjhucTZiZVF1azlaUDRDeHNNNGdsYXZQUWg2?=
 =?utf-8?B?S2JOR285M0VuRXkrU1FiZFdPNXlWZnpHekRnVWhrNlkvVkppOFJISk1YbVp4?=
 =?utf-8?B?aXVRL1ozRFIxRWhLaWh1akJER1JDMGpXdGF3UFVsQ1craWFUUUZtMVU2OWJI?=
 =?utf-8?B?WGtmS2VyeVhMa2w3WXhJenRzdnY5ck1lejEzY1o5YTkrOEhBbHhSQ2lXVDRM?=
 =?utf-8?B?SjdRd3lrSW1oSU13K3BoazdZN015Wlptc2ZnNnE4THVZeHl3cDN3Z3REbkhl?=
 =?utf-8?B?YVg1N3B1UGtkUEpFU2Rsdm9TNDZWS3hFT0cxNXZUQXpueXpyMmprc1ArWHlK?=
 =?utf-8?B?Zkp4aVNXdVVXVlVuWnl2RXlWL2lCZzlFRU5INWJGeWRGS2dNMUhwWjEycFEr?=
 =?utf-8?B?WkVoNy9tSktTQVJacFFEZTZ5cEtLODV1MlR4ZnQ4dmprbE9qNEFrNUJhVXNw?=
 =?utf-8?B?UnZzVDVEVTFoWnQ1ZXIwbXJ6NnZZR1lmQVgvNUlpdkErNXR2U0tqRW9pMXB5?=
 =?utf-8?B?R0xmdmdMbXhrQklQV0g5Z0xlais0aW14ZzluSVBwM2NHYkZIVjRBOTlLUHkv?=
 =?utf-8?B?QWhXUi9aeXF4d0pScU11d3BnemJ6L1d0MUpKbEdxMTNmbVRtZ0pSRHJsK211?=
 =?utf-8?B?WEFYQjF0alpZUktSYlFLUXAxK01UUnVVMGNmSHhwTjdMS3dKdFpuS0NPblo2?=
 =?utf-8?B?S01Gc1pyUDJnTlp5RFlZVnEyS2Y0Zy9KdWtmVXFSRGdrUTFUdnFpbCt1bi95?=
 =?utf-8?B?NXVyU0t0NTJiSWMzU0YvQzJwVUF4eWJCdk1tenkwSDErajd5WUhoRlRMM1RU?=
 =?utf-8?B?RVppdHFnSnF1N0FscVpSQ0NXOXVvNkFzU3hKZ255Q1lVcllvbG5Cb28wUzVX?=
 =?utf-8?B?ai9LU2lnZ0hHdzQ0bjJGakN1K3c0SHFCaTArWjlsNHpJZ2ozN0lmbVpwczNn?=
 =?utf-8?B?Q1ZqcCs5QUN4bmFjd2lSaE5Ubkg1OGNTRjY5Mnovb09xMzhVVU03NFZXb0VX?=
 =?utf-8?B?SlgveTJoU29ZOXV0dktBeVhUemNBeHd2ZVNFVFo2ZnpYR0dFa2xjL2dYL0Rx?=
 =?utf-8?B?N0REL1RJTEQzeC9XdUhDTkFuMDNoSkt3MVBXZmtQS0Q0Q09qUHpuWnRwK1Vl?=
 =?utf-8?B?RHJhenBURnFDTll0REhTSlNNTk0wUmJCQzR5T3QrWDlYdVBCVGN6ekxQN2Ri?=
 =?utf-8?B?SGRJOXBhN3MwTDdxSVNEMXVWZUhUTlQxNzNkNU55ZHRlNStTdDBmTlU2TTZP?=
 =?utf-8?B?Z2N3SEZQUkNtUk9DdmxreXlVMkFTbWhhQXpUTEtTOEVvdGNKZFVlRXc2QndB?=
 =?utf-8?B?d2hkYkVOS2JTVWRsNk1vYmtuMG5LRTIrcWcveG9hRGpDeEtMWUpabmkzRitD?=
 =?utf-8?B?akFvZzdYNlEzYnVTWnhhakpMaUxRcmJxbDVYdGxuajMxSG01dnJPZDFWTnlh?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67da808-a921-4892-80f7-08de1c7d8fb5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:11:14.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMTRll406gH/p9O+i8EItXwhvp6H9H8bXc91wc2E+DErTp9+rtc3gD6+umW/1N1MiXgKe3g9L2L09kjzjL/5Xj28kAIwGnI5a6AXeh2fQVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

Now that it's possible to free the packets - connect the restore
handling logic with the ring.
The helpers will also be used in upcoming changes that will start
producing migration data packets.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  33 ++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 129 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |  30 ++++
 6 files changed, 202 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cb6b30fd8c2d8..e4b273b025d2a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
 	xe_pci_sriov.o \
+	xe_sriov_packet.o \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index db57f9d9b491f..25937592bc42f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
@@ -852,6 +853,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
@@ -1074,6 +1077,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
@@ -1108,6 +1113,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
 
+	xe_sriov_packet_free(data);
+
 	return 0;
 }
 
@@ -1201,8 +1208,10 @@ int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid
  */
 int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
-	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
 		return -EIO;
+	}
 
 	pf_exit_vf_restore_wait_data(gt, vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index d9ca9ea737dcc..c492677db28d9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -14,6 +14,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_packet.h"
 #include "xe_sriov_pf_migration.h"
 
 #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
@@ -418,6 +419,25 @@ bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
 	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_ring_free() - Consume and free all data in migration ring
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ */
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	struct xe_sriov_packet *data;
+
+	if (ptr_ring_empty(&migration->ring))
+		return;
+
+	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
+
+	while ((data = ptr_ring_consume(&migration->ring)))
+		xe_sriov_packet_free(data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
@@ -544,8 +564,10 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
 	data = ptr_ring_consume(&migration->ring);
 	if (data) {
 		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
-		if (ret)
+		if (ret) {
+			xe_sriov_packet_free(data);
 			return ERR_PTR(ret);
+		}
 
 		return data;
 	}
@@ -559,11 +581,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
 	return ERR_PTR(-EAGAIN);
 }
 
+static void pf_mig_packet_destroy(void *ptr)
+{
+	struct xe_sriov_packet *data = ptr;
+
+	xe_sriov_packet_free(data);
+}
+
 static void action_ring_cleanup(void *arg)
 {
 	struct ptr_ring *r = arg;
 
-	ptr_ring_cleanup(r, NULL);
+	ptr_ring_cleanup(r, pf_mig_packet_destroy);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index b29d34a835b71..b4c7b5dc9e914 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
new file mode 100644
index 0000000000000..2cdcfb2073d00
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_sriov_packet.h"
+
+static bool pkt_needs_bo(struct xe_sriov_packet *data)
+{
+	return data->type == XE_SRIOV_PACKET_TYPE_VRAM;
+}
+
+/**
+ * xe_sriov_packet_alloc() - Allocate migration data packet
+ * @xe: the &xe_device
+ *
+ * Only allocates the "outer" structure, without initializing the migration
+ * data backing storage.
+ *
+ * Return: Pointer to &xe_sriov_packet on success,
+ *         NULL in case of error.
+ */
+struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe)
+{
+	struct xe_sriov_packet *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	data->xe = xe;
+	data->hdr_remaining = sizeof(data->hdr);
+
+	return data;
+}
+
+/**
+ * xe_sriov_packet_free() - Free migration data packet.
+ * @data: the &xe_sriov_packet
+ */
+void xe_sriov_packet_free(struct xe_sriov_packet *data)
+{
+	if (IS_ERR_OR_NULL(data))
+		return;
+
+	if (pkt_needs_bo(data))
+		xe_bo_unpin_map_no_vm(data->bo);
+	else
+		kvfree(data->buff);
+
+	kfree(data);
+}
+
+static int mig_pkt_init(struct xe_sriov_packet *data)
+{
+	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
+
+	if (data->size == 0)
+		return 0;
+
+	if (pkt_needs_bo(data)) {
+		struct xe_bo *bo;
+
+		bo = xe_bo_create_pin_map_novm(data->xe, gt->tile, PAGE_ALIGN(data->size),
+					       ttm_bo_type_kernel,
+					       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED, false);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		data->bo = bo;
+		data->vaddr = bo->vmap.vaddr;
+	} else {
+		void *buff = kvzalloc(data->size, GFP_KERNEL);
+
+		if (!buff)
+			return -ENOMEM;
+
+		data->buff = buff;
+		data->vaddr = buff;
+	}
+
+	return 0;
+}
+
+#define XE_SRIOV_PACKET_SUPPORTED_VERSION 1
+/**
+ * xe_sriov_packet_init() - Initialize migration packet header and backing storage.
+ * @data: the &xe_sriov_packet
+ * @tile_id: tile identifier
+ * @gt_id: GT identifier
+ * @type: &xe_sriov_packet_type
+ * @offset: offset of data packet payload (within wider resource)
+ * @size: size of data packet payload
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
+			 enum xe_sriov_packet_type type, loff_t offset, size_t size)
+{
+	data->version = XE_SRIOV_PACKET_SUPPORTED_VERSION;
+	data->type = type;
+	data->tile = tile_id;
+	data->gt = gt_id;
+	data->offset = offset;
+	data->size = size;
+	data->remaining = size;
+
+	return mig_pkt_init(data);
+}
+
+/**
+ * xe_sriov_packet_init_from_hdr() - Initialize migration packet backing storage based on header.
+ * @data: the &xe_sriov_packet
+ *
+ * Header data is expected to be filled prior to calling this function.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data)
+{
+	if (data->version != XE_SRIOV_PACKET_SUPPORTED_VERSION)
+		return -EINVAL;
+
+	data->remaining = data->size;
+
+	return mig_pkt_init(data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
new file mode 100644
index 0000000000000..2c5a49897d763
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PACKET_H_
+#define _XE_SRIOV_PACKET_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+enum xe_sriov_packet_type {
+	/* Skipping 0 to catch uninitialized data */
+	XE_SRIOV_PACKET_TYPE_DESCRIPTOR = 1,
+	XE_SRIOV_PACKET_TYPE_TRAILER,
+	XE_SRIOV_PACKET_TYPE_GGTT,
+	XE_SRIOV_PACKET_TYPE_MMIO,
+	XE_SRIOV_PACKET_TYPE_GUC,
+	XE_SRIOV_PACKET_TYPE_VRAM,
+};
+
+struct xe_sriov_packet *xe_sriov_packet_alloc(struct xe_device *xe);
+void xe_sriov_packet_free(struct xe_sriov_packet *data);
+
+int xe_sriov_packet_init(struct xe_sriov_packet *data, u8 tile_id, u8 gt_id,
+			 enum xe_sriov_packet_type, loff_t offset, size_t size);
+int xe_sriov_packet_init_from_hdr(struct xe_sriov_packet *data);
+
+#endif
-- 
2.51.2

