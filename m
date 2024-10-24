Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B29ADBAB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 07:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8EE10E8A5;
	Thu, 24 Oct 2024 05:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltuSZXqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0450110E070;
 Thu, 24 Oct 2024 05:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729749037; x=1761285037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=azPvWZDTJF31Q3ExUCDnNQmCjIATddZekOjrW2aBnfI=;
 b=ltuSZXqqF+iKJkVmLSWSB/rNR6Bjegb39iSUbyw/Z56tibE0qyzgaA5v
 6AJpjr8NXCumLlPKPHU0idvek0ip+aUwvrDY0zC9a2mP9si0eaCxF7lw3
 qjJvhua6ZBlag5s8clqzIqteLOZx0PJqwABMzAkLBQ9x8/CzhvUUBuo5z
 z70HsYlKhSo9cdXJ1NCL7RqXyRIB6ZrKqDdIIqMBFODzFSe6n04aGu4aA
 Z0KKjL9B86+6En4VfaaZbbUEcLrpx/YgUyEfSvBE4j4VSLijQ1iFKUURX
 0x1o/ZW+TbGGprzA0/xla2pC/EokXnCJAlj7r+bjK4523h4A3UMxURtwh w==;
X-CSE-ConnectionGUID: ibH2as8+TEiSqFAfzAtrVw==
X-CSE-MsgGUID: FZ+iTrYvSUmFIM/TWnAorg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="54767755"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="54767755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:50:36 -0700
X-CSE-ConnectionGUID: S2hv4eadQvC5//d1ofKSVw==
X-CSE-MsgGUID: PQWc9ioNSyuw4lH1ABCDTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="85609314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 22:50:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 22:50:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 22:50:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 22:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9vSHkIju+OgFHV0+jdJoFBE/HJn3OkIHvpz9mqsFaFmVim0P9acR2BQ9Pa+uvw5T0Wmfo/6wLZpL3m+8XqEgg2mn2IODqAuZixkNRPrL0jLWH4DzvXXytIO8v1D1JVa9/BYW6F7Q3mIZV8G2HMc2GNggxKLVRTEDK2Vx6gSrCixsMULve/XQ7by67H3TaGdQ0GGyIIQ0qD4jyiNRvvVkthGvegpXW/DRLBaTLbFHC3zXZIgaD14W7zoBZwJiQi7sZNSTrsrex1UP8zWpsA4m/xPasPK1DHlSlYO1VcnViM8taD0bixL25Lf9uGQnv0cfQiOvbn5kvX4l7MrWjXEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azPvWZDTJF31Q3ExUCDnNQmCjIATddZekOjrW2aBnfI=;
 b=Byt+ekqQCvsL3dIls0YWmaVZEdkpH9Q5Ar4644awEryfna+eID5lGJ/BPGlzbBFv3RopdQdMla16twx6glFDU09Yyze3aFVyrbdiPmqNTcd16Ch6QTivJpbVYhuuQILI9iTqNncP5eg4tqJG9g2erLqA1pgQLaN4jfA6zh4cHW2ybnm+uX6fmhlfRoioUOk9JNB+Pzs7+H5Rotuo6n/jKCaQYecNNXivbiMtiZZ+pnGUKgEu0FOKP+7LtE0a6BxLfJ6DLVgKCRThkG7/zKdGjW4Fjo/T5qiYMdxDOOWaYodPKmd6np+CREIPk8O0b0u8zu7s4wk1zvJRdeasg35Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Thu, 24 Oct
 2024 05:50:33 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 05:50:33 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>, Bjorn Helgaas <helgaas@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Topic: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Index: AQHbI3yK84LIcNeUG0KOOkjZ4cDCubKS47QAgABkQICAAha+cA==
Date: Thu, 24 Oct 2024 05:50:33 +0000
Message-ID: <IA0PR11MB718513F3D07518E9CCF3D498F84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241022151616.GA879071@bhelgaas>
 <26d7baf8-cfdc-4118-b423-5935128cc47f@deltatee.com>
In-Reply-To: <26d7baf8-cfdc-4118-b423-5935128cc47f@deltatee.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CYYPR11MB8359:EE_
x-ms-office365-filtering-correlation-id: 8f096607-f37c-401b-febe-08dcf3efc66b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U1BTdXYzeGlLdGhac1lpckpFUXIyOFp4d1NHRUorNXorb0pMN0dzalV2Qi96?=
 =?utf-8?B?cm9PaTZKUnFDV0hLc3lQQ0ZydGZMV0ZYYVIxenBPYVRlU1oyUVpUeEFFNzJt?=
 =?utf-8?B?NWdZMHBGK0U3b1FBSGxiczBsM3U5OTNRcGZIcFdYSEw2c1VmZHFQNG90OE1X?=
 =?utf-8?B?ZUhuNnkzZ1d4U09hVFlMa3UzWlh6VHloS3Z0YWtNbkdXUEE5aytMRW5rM3RL?=
 =?utf-8?B?UVJ0d2p0UHY0V3JuRzJZU3dhNzJkajNOT3hjdjc0WjIyNk00SEV2UVJJWnRF?=
 =?utf-8?B?eFNkTHBSbFBMSEY0dlY5djZBQ21HQ2lURVcvY2tpM1FvMmN0U0d6TWxRTFB0?=
 =?utf-8?B?Z01QMVJwcGhzVVJMSlFvaTdJejJWYWIxK3hmdnhNTzFaanc1dXBvdVZqODZl?=
 =?utf-8?B?bE8rRk4xS2FKMGp5Ynk1SE40TG5xdjM1TGxtS09uUWFBeFB1ZmJLTTZEdHJm?=
 =?utf-8?B?WnFGdWlsSHJEci9SL3A5NC9iNTNLeDU2QkFkYWg4dEFjellRZWFJbmdpb3Qr?=
 =?utf-8?B?NGhmVldSUGYrSDgzNDcxdlNDc3JoRUlrNC9YZC9jbmNTSEMvRWFRNUNMRFg3?=
 =?utf-8?B?bUlVRzZ6b2dRY0JDRVNlSThYQjhQeTRZczJYNk9lYUFQZUt5TTlzWEFHNHJZ?=
 =?utf-8?B?SHBFZ1VhdjV1U09JaUthUzFxS0dSMmIvRFFIVU1WZlZYQTczUWlGeERzN0hl?=
 =?utf-8?B?eFdNempHaDBDY3MyZEpYY09pUGx4OFVPNGlKT2k0SG9EZ2xmaUxRRGtyNE9x?=
 =?utf-8?B?ald1ZEpxVjF0UXpUWW4zOXh4SUtFR0xTYWQwUFBVcVZ5U1V0VzBmT05ObU5N?=
 =?utf-8?B?Z1dhSjZCcnFDRStsbmZRbXlIdFEySzdpQ1VtR3RNU3ZCTFkyMWUwY21tVTl6?=
 =?utf-8?B?TUxzdGM2YUZiVzV2aVg1eURzaW5yd21VUUFXb0Q3L1ZGbnVaYnE5ZGlHNG9n?=
 =?utf-8?B?eFpBZVBKSDVLL2FXZER2Ti93MmpqWS9vYUhPZHkyd0RWVjhNOEJ0ZEMwVW0r?=
 =?utf-8?B?ZlNNWWZrMmR6cFJtckR6VlVQcTlxQTdpT2FvUjRjMkozSVpPZ0RMRXRFS2ho?=
 =?utf-8?B?c2NoNVUwYks3Z2hidW9XUWY3QURFbFdXSXlGRUxPSGM3N2E1ZkFhTVhhaWJu?=
 =?utf-8?B?M0xXUFM3NStHMnNMUHMyK3NNQkJNQW04TExhMTNhVllYREtYZmVaeVUybVZm?=
 =?utf-8?B?SU1wampKemc3NVhOVXZBVVdwOEloU3lXUVhQZGtKK2JQaituaENNOHRpd0Mw?=
 =?utf-8?B?T3dtWW00ZTU3ZEQ5Ykc4U1dhV1hpdHFsSisySWZDSGNyUzVoTkxUN3hRaDVJ?=
 =?utf-8?B?VHk5ZitxUmNSWUZzUVBkUzBZWGNualN1ZDI0SHFQV1ZDbFF3Rk9QT1NMMjVH?=
 =?utf-8?B?TU13YmkweUJwZG9FbXFTb0xWZUgvN0U4TlJIajhid1U1RlNEK1BCZ0JYZTFx?=
 =?utf-8?B?RzlmYkVHZ1hwZ1NPdk5VbmJIL0laZDA2Mk1aZzhiT055M0FmU3RGR1hWNEZr?=
 =?utf-8?B?T01LcDJid0JRblJ0aDArbGVkYVBxVXl6MGhEd21iQnk3WkZiMGRaSVBiSXl3?=
 =?utf-8?B?RnNwZGhBT0RqT3ZYQUo4VldEMWVLTmFhaFA1dnBWdnlUYUhkSGp6SE1NR3pE?=
 =?utf-8?B?bW9oOHlsWk1xZUpoM2tGV2JmSG1SL0RTV1A3UEVPM2NWSmxGbkhvcFNadzZI?=
 =?utf-8?B?cXl0N0RkajM2c2xJUTczYUplaFpCRDV4VXgrWGRiZ0xjYldIT3EzQTNpSUtL?=
 =?utf-8?B?YUkyOGFOa3BIMTk0c0ZDVzNISEo2eUZDTmd5OTVHdlA2M3E2RU8xWUZOWTN3?=
 =?utf-8?Q?4nXOVbBIWOwGRHHvUML/vZC9RCbR9ifF+Umfk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RE9lcGsrOEl1MGUzSE1RQjhxRGxaSkxPeEgvaER5dlNKcElHK0J0TTc1SVJy?=
 =?utf-8?B?eGtyKytTajNIV2FtY09MZDJRK3BZT0gvMUQ1TXltZWpNK2wyQjVDeHhtc1Uw?=
 =?utf-8?B?bHlRdExnZFNtbEI0dUEvV1BuNXdMb1pnU2o4N1BXbW1ZTGVHNmlLOWFZbVlI?=
 =?utf-8?B?OU5jaENFZFRZU2JpNkx5VDJwVVNwK0VYM2FUOW1RYlMxa0xCQ250SEVVMXJh?=
 =?utf-8?B?ZUNubE1EcmJzSUZvRFdVdjFhYVRYcDY5QkFsT0NjTGZKNEgwaUUrOFJ6UVV3?=
 =?utf-8?B?TDRGZzhIZklyUVpRTUptTlhScVl4SnFFdnV3OGF5ZFBPRTFWeDh5NnlEV3JL?=
 =?utf-8?B?V1JDL1Q5OUMrQkNPUC8yRFYzMVREK1UwYzNsanZ5WFNSSmF1MUdXWHAvUVVJ?=
 =?utf-8?B?VUFDK2lhTGRJZTk2S0tnekJ3VWkvL3lQUndwSXY3Uk1Ybk92Qmx1ZDZVVm9X?=
 =?utf-8?B?bDZ5S2RLY3h4UDNjaklpdUt2cnpPM2tCNDFuTTh3TGIzSStEK3BIRmxXQ1Q3?=
 =?utf-8?B?cG04eFBPSC9KaWZ5dHRWZGROSHkxOEJPZGU2UzdSYzVDUjVLTmRpZkgwR1Ex?=
 =?utf-8?B?ZGZNdEJWa29FKzlBWkMvdGtZQjZMeFpvQk1TVTlkd2d1aWc4ZDV3WlNDMzdT?=
 =?utf-8?B?NHlsLzBGQk1nbUJienc5YmkwTlVrY2JCMkRLQ2JSRUlBR09SYVcwZWc5VVcz?=
 =?utf-8?B?VEVzZ2ZaT3pabGRCcHRPYWdXb0pZbXRWekkwa3hZSUtYNVhHM1k1US8yWTgr?=
 =?utf-8?B?SmpRc3hweDdEbTlLc284YjJVWjByMkR4bVo4NkZyb2I1QkE5YUhMNU1KTmdY?=
 =?utf-8?B?WjF6V2hMdnRPblZWclNteWJGMWpJVWZoN3dqb2RKNEFwaER3ZXc0bzJWTERp?=
 =?utf-8?B?dHpqL3BPQ0N4RUx0RU84dzl2MFFIZzN4dUx1ZlAzN2dXTEowQ2lDRkJnNEtM?=
 =?utf-8?B?RmIyK3orQVRKOTFxeVpnT2E1b2RQdkw2Nk01UWdSaHFvR09GWnhoazhENHBR?=
 =?utf-8?B?UzYyRFdadGswNnR1Z05HR3UxZ0lXazFhd045TElpZGVMR0U3NWtzdXZnNWdI?=
 =?utf-8?B?VVRNTkZ4QTdSZ3BvY01MYWJxYWV1b2RlYllacExrYnN3Tmt1Y0tOdXRtU1RG?=
 =?utf-8?B?cVdTTTR6UGNKWTk3b1BMVHZvK1MvS0pDN0JXR1lKb0I1Ukk1WTNwM1Z4TW5S?=
 =?utf-8?B?Z0NObmtkbk01eEtmd0NGVmU5RXJpSUhsUStNaFVLSGVCR1g5MnVkUVYwaEhM?=
 =?utf-8?B?K09SdjRUSWc5UlRoV21YUEJSbzlnZlI1Y3NmYW9BMmh6b2pSN1ZpQzJ6eEl4?=
 =?utf-8?B?SlF4dnZTb1VGRHQvdHA3c3N5ZXNHcExUemRkaHNJbkJBeXY5NWMrYmtjYXkr?=
 =?utf-8?B?a2RWTm5PMGhZMGhUdnlFM2RITjZlZHhobVRod0h3eHZyV2d2MmYzUXZ1TkRF?=
 =?utf-8?B?VW1JVFkycHhwS0pqS0dUd2Z1R2RwcTFSMk8zOWpjM1RMRGJCM0hzNWd1cEpu?=
 =?utf-8?B?VmZrZUxIRmdidlU1S0Zhd2VIVlZQL3JPL2Z5OHYvUEhpbWpYSVN4VE5ESEJY?=
 =?utf-8?B?VmJ3VlE3NTVyWk04WXhITkxMQnlIQ3BPZTk1dHdBcjRnSUorYi9KQWNadUJm?=
 =?utf-8?B?Ty9NM3lLNldkcFRNSWtLR2laUkdCdEdzYlNFdDI3RHRRTUZ1T1pkcnBNTmhC?=
 =?utf-8?B?NTB2QXBhNXg2bmh2M3F3dGovblNxb25zZXBBcWs5ZGRvS2dta1I0cHJPeGEw?=
 =?utf-8?B?K2d5K05Ed1BoQWFLdFpzWDFXc3p2eUZaVllEZklDMlRNQjllV1JUbXBWREVP?=
 =?utf-8?B?S0tnRDBkaUR0dG95TU1ScUJiSDZ1SmlSL2dtQVYxYUlUUzd2ZUpXQ1g5Yk1z?=
 =?utf-8?B?V2I4aSs2TWJZWVpYT0dldVg1cFdzYWplLzRlMWpFNlE3cG1ndGtkalRWMCtH?=
 =?utf-8?B?ektlaEthRzdzSy9NUGhVOG5oaU0zZStUNE5mbjRsRkpHeHZiWGNHNGhpRktl?=
 =?utf-8?B?NkNTT1EvL1J4Z1ZXUld2MDdoTW9pWHA5U1NFWTQ0YWtqRjFuZ1YwZ1g3UENB?=
 =?utf-8?B?RlhEbk9xa1NuWG16ckpPR0ErYjl6Z3UrSXpMMG55QlR0d21HT0JRUDFmL0xE?=
 =?utf-8?Q?b+RjgdN7jxXiMX1QQT27/t8cF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f096607-f37c-401b-febe-08dcf3efc66b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 05:50:33.1021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxvKSjcH67Obgm1HuAmeJNrkEKbME0enSxspm59bvyrqbnutU4wkz+XWZt+ARE4btWXaLwUq0o85o0m8jWG0JPfqJQOeE974yQYlWgPaDKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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

SGkgTG9nYW4sDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzVdIFBDSS9QMlBETUE6IERv
bid0IGVuZm9yY2UgQUNTIGNoZWNrIGZvcg0KPiBmdW5jdGlvbnMgb2Ygc2FtZSBkZXZpY2UNCj4g
DQo+IA0KPiANCj4gT24gMjAyNC0xMC0yMiAwOToxNiwgQmpvcm4gSGVsZ2FhcyB3cm90ZToNCj4g
PiBPbiBTdW4sIE9jdCAyMCwgMjAyNCBhdCAxMDoyMToyOVBNIC0wNzAwLCBWaXZlayBLYXNpcmVk
ZHkgd3JvdGU6DQo+ID4+IEZ1bmN0aW9ucyBvZiB0aGUgc2FtZSBQQ0kgZGV2aWNlIChzdWNoIGFz
IGEgUEYgYW5kIGEgVkYpIHNoYXJlIHRoZQ0KPiA+PiBzYW1lIGJ1cyBhbmQgaGF2ZSBhIGNvbW1v
biByb290IHBvcnQgYW5kIHR5cGljYWxseSwgdGhlIFBGIHByb3Zpc2lvbnMNCj4gPj4gcmVzb3Vy
Y2VzIGZvciB0aGUgVkYuIFRoZXJlZm9yZSwgdGhleSBjYW4gYmUgY29uc2lkZXJlZCBjb21wYXRp
YmxlDQo+ID4+IGFzIGZhciBhcyBQMlAgYWNjZXNzIGlzIGNvbnNpZGVyZWQuDQo+ID4+DQo+ID4+
IEN1cnJlbnRseSwgYWx0aG91Z2ggdGhlIGRpc3RhbmNlICgyKSBpcyBjb3JyZWN0bHkgY2FsY3Vs
YXRlZCBmb3INCj4gPj4gZnVuY3Rpb25zIG9mIHRoZSBzYW1lIGRldmljZSwgYW4gQUNTIGNoZWNr
IGZhaWx1cmUgcHJldmVudHMgUDJQIERNQQ0KPiA+PiBhY2Nlc3MgYmV0d2VlbiB0aGVtLiBUaGVy
ZWZvcmUsIGludHJvZHVjZSBhIHNtYWxsIGZ1bmN0aW9uIG5hbWVkDQo+ID4+IHBjaV9kZXZzX2Fy
ZV9wMnBkbWFfY29tcGF0aWJsZSgpIHRvIGRldGVybWluZSBpZiB0aGUgcHJvdmlkZXIgYW5kDQo+
ID4+IGNsaWVudCBiZWxvbmcgdG8gdGhlIHNhbWUgZGV2aWNlIGFuZCBmYWNpbGl0YXRlIFAyUCBE
TUEgYmV0d2Vlbg0KPiA+PiB0aGVtIGJ5IG5vdCBlbmZvcmNpbmcgdGhlIEFDUyBjaGVjay4NCj4g
Pj4NCj4gPj4gdjI6DQo+ID4+IC0gUmVsYXggdGhlIGVuZm9yY21lbnQgb2YgQUNTIGNoZWNrIG9u
bHkgZm9yIEludGVsIEdQVSBmdW5jdGlvbnMNCj4gPj4gICBhcyB0aGV5IGFyZSBQMlBETUEgY29t
cGF0aWJsZSBnaXZlbiB0aGUgd2F5IHRoZSBQRiBwcm92aXNpb25zDQo+ID4+ICAgdGhlIHJlc291
cmNlcyBhbW9uZyBtdWx0aXBsZSBWRnMuDQo+ID4NCj4gPiBJIGRvbid0IHdhbnQgdmVyc2lvbiBo
aXN0b3J5IGluIHRoZSBjb21taXQgbG9nLiAgSWYgdGhlIGNvbnRlbnQgaXMNCj4gPiB1c2VmdWws
IGp1c3QgaW5jb3Jwb3JhdGUgaXQgaGVyZSBkaXJlY3RseSAod2l0aG91dCB0aGUgdmVyc2lvbiBp
bmZvKSwNCj4gPiBhbmQgcHV0IHRoZSB2ZXJzaW9uLXRvLXZlcnNpb24gY2hhbmdlbG9nIGJlbG93
IHRoZSAiLS0tIi4NCj4gPg0KPiA+PiBDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xl
LmNvbT4NCj4gPj4gQ2M6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4NCj4g
Pj4gQ2M6IDxsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBW
aXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+
PiAgZHJpdmVycy9wY2kvcDJwZG1hLmMgfCAxNyArKysrKysrKysrKysrKystLQ0KPiA+PiAgMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wMnBkbWEuYyBiL2RyaXZlcnMvcGNpL3AycGRtYS5j
DQo+ID4+IGluZGV4IDRmNDdhMTNjYjUwMC4uYTIzMGU2NjFmOTM5IDEwMDY0NA0KPiA+PiAtLS0g
YS9kcml2ZXJzL3BjaS9wMnBkbWEuYw0KPiA+PiArKysgYi9kcml2ZXJzL3BjaS9wMnBkbWEuYw0K
PiA+PiBAQCAtNTM1LDYgKzUzNSwxNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBtYXBfdHlwZXNf
aWR4KHN0cnVjdA0KPiBwY2lfZGV2ICpjbGllbnQpDQo+ID4+ICAJcmV0dXJuIChwY2lfZG9tYWlu
X25yKGNsaWVudC0+YnVzKSA8PCAxNikgfCBwY2lfZGV2X2lkKGNsaWVudCk7DQo+ID4+ICB9DQo+
ID4+DQo+ID4+ICtzdGF0aWMgYm9vbCBwY2lfZGV2c19hcmVfcDJwZG1hX2NvbXBhdGlibGUoc3Ry
dWN0IHBjaV9kZXYgKnByb3ZpZGVyLA0KPiA+PiArCQkJCQkgICBzdHJ1Y3QgcGNpX2RldiAqY2xp
ZW50KQ0KPiA+PiArew0KPiA+PiArCWlmIChwcm92aWRlci0+dmVuZG9yID09IFBDSV9WRU5ET1Jf
SURfSU5URUwpIHsNCj4gPj4gKwkJaWYgKHBjaV9pc192Z2EocHJvdmlkZXIpICYmIHBjaV9pc192
Z2EoY2xpZW50KSkNCj4gPj4gKwkJCXJldHVybiBwY2lfcGh5c2ZuKHByb3ZpZGVyKSA9PSBwY2lf
cGh5c2ZuKGNsaWVudCk7DQo+ID4+ICsJfQ0KPiANCj4gSSdkIGVjaG8gbWFueSBvZiBCam9ybidz
IGNvbmNlcm5zLiBJbiBhZGRpdGlvbiwgSSB0aGluayB0aGUgbmFtZSBvZiB0aGUNCj4gcGNpX2Rl
dnNfYXJlX3AycGRtYV9jb21wYXRpYmxlKCkgaXNuJ3QgcXVpdGUgcmlnaHQuIFNwZWNpZmljYWxs
eSB0aGlzIGlzDQo+IGRlYWxpbmcgd2l0aCBQQ0kgZnVuY3Rpb25zIHdpdGhpbiBhIHNpbmdsZSBk
ZXZpY2UgdGhhdCBhcmUga25vd24gdG8NCj4gYWxsb3cgUDJQIHRyYWZmaWMuIFNvIEkgdGhpbmsg
dGhlIG5hbWUgc2hvdWxkIHByb2JhYmx5IHJlZmxlY3QgdGhhdC4NCldvdWxkIHBjaV9kZXZmbnNf
c3VwcG9ydF9wMnBkbWEoKSBiZSBhIG1vcmUgYXBwcm9wcmlhdGUgbmFtZT8NCg0KVGhhbmtzLA0K
Vml2ZWsNCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gTG9nYW4NCg==
