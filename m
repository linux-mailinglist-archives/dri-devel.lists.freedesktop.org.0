Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA575C22417
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5A10EA40;
	Thu, 30 Oct 2025 20:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoBsNBkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECCC10EA3A;
 Thu, 30 Oct 2025 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856354; x=1793392354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SKasV+i47/V5sevWbbqAKw0vZAVwSmbHsK5cUC+pz7g=;
 b=MoBsNBkC4tSR6YX+ZNnhjrFRTAOoAdDg1mKtqWq3TMDgSVc7Qweun0OQ
 PgYrGZtdTK3omECdWjAHAaaOb9dkpHbJEelFVgZnJWAd5rxBaAyLZ3NBI
 pxZ8rwdZCWWrLEQ6sKJH9m9ZKatJ5yr6wQbJqHVtM8n3bGcVVFIkw0WKB
 ffVeokTkkNKYfkz27gnWm84hlveZaTych4xvDY1hW6h/AhPSwq2l2k2Qo
 0NRQucSmbVWWgPwWdWJIUhe/h03GfyMEwEriclullCitXf8CwKrauUmYq
 vEWhLgvZEKRhtd36/rcsb8qw/qFj2E5L4c00KxoSOPVUgca+hfLFvepsN g==;
X-CSE-ConnectionGUID: N1RioArqQCW/HABgDkeSgg==
X-CSE-MsgGUID: 5p44clerTmuIU1wn+yWZVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64052337"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64052337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:34 -0700
X-CSE-ConnectionGUID: NaGgpr4qT0uQcc/WLiHbzA==
X-CSE-MsgGUID: /n8XahXUQOqJOPFDiG/IAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186791138"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:32:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:32:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6kc45/mh4ag0ov1nAZfAhwqjmcPLlDUTXtwm8R61jVTJk7yEFJHO19ztFg0OUgmGYaxtmVZhvaze4Tss40YYaoFZ7xC5Fo5nCBL9Uh+n1+1boP5dY9/om4VpgnSm9cYBxHn1sx+8dledLqssGm2dYfBlCcWkEyZjFYH3L/D1hMSCxTKk/A6odIcu4Z8d6xivU2nA2vu4B8MwJkEzAnK2jPmOiU+gDoJTBHcVk54kbZuvdFVy+Ekdxm7fClD/o57Im0njoT3EVlxfgDU/gyRfKth8r4hHp3EAPnbRUFObxBco8FHTEdyPKlSL4frfK/6VPYxBd9eKiqX10AUjpLWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88+rS5H54of3i9Cl2YkPlc2w7E6GZqXa7fCZFo/jjqE=;
 b=GEVZwJP7+xD+EzTfbjSQQ7Z8P/2/hI7eJ9e02RnUKeQSl0N/A3oBYaf1Mr1IF+kUc1qQ9Ddk8SI7PrweChblhGnNUfinHU/o0eLmxB5rDIu3R4MEks+Eo0/Mz/+6tu6fUAqqPo5isWPrZnrwonQ/dp3FxwSp4hlq4m8MptSxpaSfbnnWvgoPkdygBlIXXGAa9pt++kyvnkx3u08Qrj8AtmVjgoMUB3llkn9IgZewHDlEP0z1C3YMjUv/69kp/uXyWWeJi8OxDZwvlS/A5MqbTGxMgLBcxtKmswwV43Eaw5osrJsaXNxrKjbcTR8Imi74RszO3FlqRr58POfPdMpXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:32:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:32:30 +0000
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
Subject: [PATCH v3 06/28] drm/xe/pf: Add helpers for migration data allocation
 / free
Date: Thu, 30 Oct 2025 21:31:13 +0100
Message-ID: <20251030203135.337696-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 7744dfeb-35b4-44a7-da84-08de17f372c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzI4dFdjUmZWcm96VDhFZy9hUDNXM3JBWnhUZXhRUGViSjB0QzFNNFFqZ0c1?=
 =?utf-8?B?NnZtN0tZVW1DOGdmakgyWFFYcnJMeXRYbFBLclY3Y01UVDA5bVFlNXJEYk9K?=
 =?utf-8?B?YzgzMFRoUDUzbHd2cDAvT0ZQNVpndzRiZDFqZUFRaVN1NmFEdWNPSW16bmxz?=
 =?utf-8?B?SUV6YnFPeVdhR3FiYk5pMklrY1BTMkd3UHduMGZWeGFCWVM1K3RiU1kyUkZv?=
 =?utf-8?B?UmVVTm1VYVdaekMzRWVEQzdsZUZvV21mTXF4TlFCYzc1dmdXUE5Ndng3T0Vw?=
 =?utf-8?B?Y0xUY3l2TW1pclB0MlRWNjRJZks3aVExaDdNNHg3djVENk5ZT2RhUWhqL2Yy?=
 =?utf-8?B?WURLalQ0TnBuZDY0OWVTRUdaT1VJZ1J1aW5lTjR2QWo0N0x2ZFpNMnc0MFEz?=
 =?utf-8?B?MzFnZDhDQmNnR1FYZVUzLzVxeUJzN3I4OE0xMy93NXJOUHhCMW9pNzAvQlFV?=
 =?utf-8?B?TUNLcXJCb0NvamhDaUtDTFNSSU5IdUVFeXhHeWV1T2U0UVJKTEVKWG1VcTNl?=
 =?utf-8?B?bHJVU3UwaDh1dzRiY0dpSWc0c0NxMXljeWJkVDlVR2dBOXZFYzVPY2tPS2FL?=
 =?utf-8?B?eXNUVGVoZmtCN3JSeGVKRnRJazYrSFMwZzVGTEc0ZEJxR1graWJRNkgyd3Zi?=
 =?utf-8?B?dzVGNDN6TWNTZk55WGZFekpZczEzelBRV00yYVNTMXdkYmVaNnEyS0FsYXJw?=
 =?utf-8?B?MGhMY0s3ZXFoZTZ2Z1FZamdvbUpra1U1bUdpQzNyNkg3ci9jMXloMEtEWmlj?=
 =?utf-8?B?TkFXNmpFRDRCWWJkUmVrSGtuRnZjRng4OFBpUmhCR2N3UVZpWG9VdmFUVkVq?=
 =?utf-8?B?M2tmZmRzUnBZS2FTbTRlZ1RBRFdVenhvb3NzUGtjQU5LVDdxM3V2VGZ3STVm?=
 =?utf-8?B?VEhwSDVjL3lCaEY3OEowUnlKTkFkcjJmNGtlZXZSc3BFYmNsUzg4TjNuYlJ5?=
 =?utf-8?B?d20xTnlHS0liVEkrWi92WEhtOHoyKzdLMlQ4MEVkT2xKU1M3STIwbnNmdEpr?=
 =?utf-8?B?UVI0ZERHd0RPL1FEQXY1MWdKUUJTNFRwSmxsbWE4T0M2SDkybDRhaSs3M1ZF?=
 =?utf-8?B?cTBraTRxU2tTMFpvYUloT0RmY3habnROVjlFcTJXK0hqZXNGNjN5YnN3SDJm?=
 =?utf-8?B?QXZzVlEvQWFpMm44ckVwUmk2NElKb0ZqeTNXekxzUGsxNUlPQ01VTFNtVHBQ?=
 =?utf-8?B?MDJaMnRsU0NEK3VZOVVGbitrVTdiZzN3MmVUQnpwZE5ESkJuNUo0SWQ2N3po?=
 =?utf-8?B?ZXJjek5VS0h3OHc0SE1GS1BjUFJGdEdnczA0VW9kYmdrak9YZkprK0dMNGYy?=
 =?utf-8?B?NmxHc3dpbGJkK1NjRUlmTjIvd1NWLy9iUzZCZWtWOGU0bFNzb0JKTTlScFBj?=
 =?utf-8?B?cVN0MUluVTBOY0dhbmNIZnZLUHo1ZUZhWVMyQ0lzbjhzRFJMWUlRS2FDV0Qv?=
 =?utf-8?B?S1dLd2MzS0g5NG5FTWxUci9uK090Tm1PS2N2NmhNdDVCbmxqbUJVRnlKbkVm?=
 =?utf-8?B?S2c3Q0xKNTZPQURZZVRhM0dZd3pyWVpFejFMSDN4RVNrR25uY1FsNXZweWNi?=
 =?utf-8?B?MitIQUhCT0Y2L1dSMjh2M1lyOG1LV3VQUGFiakQzd21WcWpJNVViVUhJR2h4?=
 =?utf-8?B?dzJHdmFHck5YZU1UbXB4L01mSFovY0JyanpxdVZ2OXA1NGwrOThXVTFkMlZZ?=
 =?utf-8?B?MlRtWXhoaFVsdXFTUWxXalNyM0gxaENZbkp6dDZ2dENzMmlBVkVQRmwxcExT?=
 =?utf-8?B?WVVuM0VpRkNoZEJ4SkhKdmFmcGREaG0yNUdmN2lYK3Mwc0JjSk1FU3psbXNX?=
 =?utf-8?B?a3RMK0o4blhINW50YUY4Y2ZyRDlYcnNJeFNqUUg0NDNmTll5eXd6T2hMYSs1?=
 =?utf-8?B?YjY1MmhveEU5bkJFMHRUdHZiMVNCaVpsL1JKWGdETUNaNE5OQk5iR3ZlUzhF?=
 =?utf-8?B?d2VBdytpQUlaZlJPcDhmcVliT1hOL0xocTRvNzRKeUZzTmU2S0VqVkwvdVU5?=
 =?utf-8?Q?FN5WH3E05etNMwiahzjr0FPDxyHA3s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0FTaHprYnB5MXV3K0ZnUmp5SFBQcXU4VEdzTTRJR3FxRm5TWkRwMGpWVWxj?=
 =?utf-8?B?WUJ2ZUQ5cmVBREV5a2ErL2lRTGxOb1FsOS9ETjFGbnRWbGkyQ0E4dHVTZ2cz?=
 =?utf-8?B?cEdOY01oOHlPYnkxckRXRjJNNlRCRTBtby90WWJVZFh0QVV4alpGbGEvWmNX?=
 =?utf-8?B?TlVLVWNQUmNHZm8rTnk4anVzTHVKSWgrdjJCVXUxKzVaLy9NY0E1ZHgrNEZW?=
 =?utf-8?B?alpCZVFBWTRtVk0vVlN3NW9TU2dzWW1nU3ovR2dwZnM2QWFEL3hwMDI2Wm54?=
 =?utf-8?B?alhnS1NJV2FnMXRhL0E5M3FGa0QvNjhNVytkYTkxWkhOazZpV2cvbFZrRm1O?=
 =?utf-8?B?VjY4ZHdMVkRaT2xOQXVsYnNvM3FnSkI4bkEyaXpzZU5WVFkxWTNXRzQxcHlC?=
 =?utf-8?B?dnJGazNyMVVZaGVEcUQyZURlWEljc2JYQ2hDWEZwRXFHZWlUTGFvcmRSdHQ0?=
 =?utf-8?B?UzA0WXVHTHB2MWVZS1djeVB4RllySllCeFJhZXlBcit1QTBlQW5yRFRrdWh6?=
 =?utf-8?B?M2ZjOVVldWlmQ1FLN0ZDWFVJT3lQdEtoQUdpeTFyWSthR0ZzQ3A3alZ0bG9Q?=
 =?utf-8?B?c1Y2OVN2cmFqODZhaW5kWHNUUE4yWUJldzgxQzRBWitvMHV6ZjhoN2JxNHhI?=
 =?utf-8?B?RzZpS1dJUUc3Uk9MVHd1bmpFYUJYSjVVa3JDUWY2WFdqSGMwbzNCeFUySzRW?=
 =?utf-8?B?OHhJQjlWaUJOVTNUWnptM3lFeXhXSDVEK1pRTEVMUUtkeGZQZi9hWnJKanVR?=
 =?utf-8?B?MloyMmlvbXZrNHZ2QmxZcGNuUjgrNGF2SXIyTXlsM1BPVWowVHNHbktISkdG?=
 =?utf-8?B?dU1wZnZTU1Zvb1Jybzd5eUxuOUloM1VGanRIck1sOVFKTXFZTVBhT3JIa0Zu?=
 =?utf-8?B?eVcwKzFCeEkyUGlLYU8vTWJya2VBZ3pCVFdCWGxQY1U4L2I1MkJwbGhtRmpW?=
 =?utf-8?B?UElDckhNNEljQ2JzYktaRkV4WW9tSW5EOElmdlFtSFpYbGZMbWZsTDZBR1U4?=
 =?utf-8?B?dXBST3FzMVRRWDkxQ3MrMU5jMWY4QWU1eXBqY1FKYUxIeG1kanZoQlNhN0dF?=
 =?utf-8?B?THhZUnk0MkhDSXZKc3VvTUNCRnNMN1JhV0R6UUQzSzZhVnM2R1BSTmlHWDFK?=
 =?utf-8?B?MWRyQ0ZMaW5DMEJ5OHM0bnVpN3FNaXUrZjZuSldzMVN1UjdKaG1wQUNUZ3Y5?=
 =?utf-8?B?MytSc2VLSFNYUFY2YjI0OHhoc2lhS0RQT1A0QmdwVElnTDN5NFlYUHk2aWJz?=
 =?utf-8?B?c2tTYWxXdXlUYS9sTzhCZEs2ZWVmSTlHbmN1Q1RCRFBvbkVNU2JDVC9lRlF0?=
 =?utf-8?B?N0crY09xQmp5b0F2RXJILzl6bHRncVA5U3ZNOUJzNm5POVBESWRQS0xMb3Zw?=
 =?utf-8?B?NlhCVG5saDNUNWt2NWRYTUZLck9kQ1pOeTlnanR3L0VrTndwZ1ZocU1DYUNK?=
 =?utf-8?B?cGszZXlVUGRKcFgwNVNPMXZXemRUREZzL1ppVUNwOTM5aUprTlJWc0FxYnZp?=
 =?utf-8?B?SFJVM2xJck9VRGpBN2ZZUEhUcDRYOGZZeW41dFlkR09lNllISXNSSEg5USty?=
 =?utf-8?B?N0NBRlAzT2IyWk0xVndxU0JlQk1rTzVQN0FPbTE2TnV2MTZQa3l5dW1jSUJM?=
 =?utf-8?B?RFRyS1BaWUJON1psU1cwZUkrTGRzVmtqRVZ3UXBrNlZJbll4VmYxNEg4a0I5?=
 =?utf-8?B?amxuMHkzL0pFbDU4SHFoaEhIZllBM2Z3WGdCb2ZxcGR2RFdoT1Jvdmgyb3BD?=
 =?utf-8?B?UWlDVmQ0Q0c1RThObkphaGpOVDA4UndZdWt5c0ZrcGxyN0Z3Qk0vSUltTzRh?=
 =?utf-8?B?ZTU5QVM1VUFyWDRQS3UxYlhlTVMvVHB5UGVTdktUNEdCRnBzOHFDYThyOUlD?=
 =?utf-8?B?OHpGanQySFVuaFphZDFxZFJ3Nzh5NUgyQWo5S0RpbEJzVmhuWE1OOHVsOTB5?=
 =?utf-8?B?eHJGSkU0NG9yWjBVaVozVG8vcnlWcFRHc1R5L3BKUmZYSzJCaVVWN0tkNFEz?=
 =?utf-8?B?aVI1TkgwUjRUL0dvbUloZWt1SWxGT2pxNFc4VURzY2V2eDVPRTRXbGF0R1NJ?=
 =?utf-8?B?U2pRcllDS1BqSGJ0cWd1b2JZUnYwRTM4c01zZ0Fia2JiRmp0a0Z6U2JOL0F0?=
 =?utf-8?B?dm00aCsxN3dEakhweisrbzZoazU4QStaTWQzd1Nwbmp2SjNBVWRFTXdhalpj?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7744dfeb-35b4-44a7-da84-08de17f372c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:32:30.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+8XXG9AgFfWWrD4Gb2mgez9iI9vkSToNfMouV8MG1kzlE4l/jLneZpEoDeI5YlcDS2urikMGD8Ok3ByugEJXQFpZfGAtlxxUBgHlrNeEzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
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
The helpers will also be used in upcoming changes that will start producing
migration data packets.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   7 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  29 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
 drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 126 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_migration_data.h  |  30 +++++
 6 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 89e5b26c27975..3d72db9e528e4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -173,6 +173,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
 	xe_pci_sriov.o \
+	xe_sriov_migration_data.o \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index ad9dcd3f56453..02019b646389c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
@@ -851,6 +852,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
@@ -1048,6 +1051,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
 static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
+
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
@@ -1080,6 +1085,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
 
+	xe_sriov_migration_data_free(data);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index e61e6f4215864..40b75b5fe9229 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -14,6 +14,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_migration_data.h"
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
+	struct xe_sriov_migration_data *data;
+
+	if (ptr_ring_empty(&migration->ring))
+		return;
+
+	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
+
+	while ((data = ptr_ring_consume(&migration->ring)))
+		xe_sriov_migration_data_free(data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
@@ -543,11 +563,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
 	return ERR_PTR(-EAGAIN);
 }
 
+static void pf_mig_data_destroy(void *ptr)
+{
+	struct xe_sriov_migration_data *data = ptr;
+
+	xe_sriov_migration_data_free(data);
+}
+
 static void action_ring_cleanup(void *arg)
 {
 	struct ptr_ring *r = arg;
 
-	ptr_ring_cleanup(r, NULL);
+	ptr_ring_cleanup(r, pf_mig_data_destroy);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 9e67f18ded205..1ed2248f0a17e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 
 bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
+void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_migration_data *data);
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
new file mode 100644
index 0000000000000..2371ca3e6b9a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_sriov_migration_data.h"
+
+static bool data_needs_bo(struct xe_sriov_migration_data *data)
+{
+	return data->type == XE_SRIOV_MIGRATION_DATA_TYPE_VRAM;
+}
+
+/**
+ * xe_sriov_migration_data() - Allocate migration data packet
+ * @xe: the &xe_device
+ *
+ * Only allocates the "outer" structure, without initializing the migration
+ * data backing storage.
+ *
+ * Return: Pointer to &xe_sriov_migration_data on success,
+ *         NULL in case of error.
+ */
+struct xe_sriov_migration_data *xe_sriov_migration_data_alloc(struct xe_device *xe)
+{
+	struct xe_sriov_migration_data *data;
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
+ * xe_sriov_migration_data_free() - Free migration data packet.
+ * @data: the &xe_sriov_migration_data packet
+ */
+void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
+{
+	if (data_needs_bo(data))
+		xe_bo_unpin_map_no_vm(data->bo);
+	else
+		kvfree(data->buff);
+
+	kfree(data);
+}
+
+static int mig_data_init(struct xe_sriov_migration_data *data)
+{
+	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
+
+	if (data->size == 0)
+		return 0;
+
+	if (data_needs_bo(data)) {
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
+#define XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION 1
+/**
+ * xe_sriov_migration_data_init() - Initialize the migration data header and backing storage.
+ * @data: the &xe_sriov_migration_data packet
+ * @tile_id: tile identifier
+ * @gt_id: GT identifier
+ * @type: &xe_sriov_migration_data_type
+ * @offset: offset of data packet payload (within wider resource)
+ * @size: size of data packet payload
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
+				 enum xe_sriov_migration_data_type type, loff_t offset, size_t size)
+{
+	data->version = XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION;
+	data->type = type;
+	data->tile = tile_id;
+	data->gt = gt_id;
+	data->offset = offset;
+	data->size = size;
+	data->remaining = size;
+
+	return mig_data_init(data);
+}
+
+/**
+ * xe_sriov_migration_data_init() - Initialize the migration data backing storage based on header.
+ * @data: the &xe_sriov_migration_data packet
+ *
+ * Header data is expected to be filled prior to calling this function.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
+{
+	if (data->version != XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION)
+		return -EINVAL;
+
+	data->remaining = data->size;
+
+	return mig_data_init(data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
new file mode 100644
index 0000000000000..3958f58a170f5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_MIGRATION_DATA_H_
+#define _XE_SRIOV_MIGRATION_DATA_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+enum xe_sriov_migration_data_type {
+	/* Skipping 0 to catch uninitialized data */
+	XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
+	XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
+	XE_SRIOV_MIGRATION_DATA_TYPE_GGTT,
+	XE_SRIOV_MIGRATION_DATA_TYPE_MMIO,
+	XE_SRIOV_MIGRATION_DATA_TYPE_GUC,
+	XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
+};
+
+struct xe_sriov_migration_data *xe_sriov_migration_data_alloc(struct xe_device *xe);
+void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
+
+int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
+				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
+int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
+
+#endif
-- 
2.50.1

