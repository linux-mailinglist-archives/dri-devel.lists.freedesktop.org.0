Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B15A7DE0D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 14:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5C710E44F;
	Mon,  7 Apr 2025 12:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3a6ziv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA8610E452;
 Mon,  7 Apr 2025 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744030031; x=1775566031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=46PIUAHVhZnoXlmcmAia+wcp0xZwwkG5L/NAbX67Yb4=;
 b=K3a6ziv6cIoWWm2KdqXZZ/ug8dz/gx76V3ELMOhY59d9nRNeuFxgKA62
 vnxwc8D90BJ+/1+ODcMtGIQjo1upYxkSzb+7VRuZCR5koZp653GQBTfWG
 wed0GloluINxuRpZ2ABv4zhHyz9IgELojo4ntxZUtZSK3XZmd+fQXsKJL
 3VgxEKSx494Hrtqn58dnO/VTnDHKVTTryf4e0W4g6Js+0q+rsceTV/tBV
 ubplZ5j4ocpuuauqUeyFJCSqBdnhiMDgMhDEBB2yUwbyvtARoPojPR8L+
 R11/2v9f+ujpLycRELZeMYCMh/53j0j2N3hegHpAejh7+HTnBfDHK3zAU g==;
X-CSE-ConnectionGUID: fcMSGyRVQvyNr6H7mkPEpA==
X-CSE-MsgGUID: IX+8flguQGSwAESd1PSYIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56075676"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56075676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 05:47:10 -0700
X-CSE-ConnectionGUID: P1Vs9DSvQ623b0ojv8hOvA==
X-CSE-MsgGUID: auvhW7m8SxOiQmcs2pddVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127700359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2025 05:47:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 05:47:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 05:47:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 05:47:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV6wHE0g8Ovl9z4KPwpV29BkFC8tVzm9p7cSFcuzdCoJbAIMcXa+lWBFi4ARHUMZQDXuhSYq6MYxWr5znRbtwuCckZVbCLHQ1i49gYBzmaWUs0t8Tn7h/9fGdRe25JOYpz2Uv2pxzjDL3zg442IRA7RwrfNvTwYE3KRtAY6jy9pVxuK3DkaQiPPDiXicNaoom494nynumc7pnIqz5VoPLS18i8+l9EcR8M2zenp8ZRSNWUGW9bTokSvhoOGrloaEjlJarXTjqnayuQbjOuI5MyHdzoDFy1kCOpwiqpHJM2hc/gWKGqoXiJlafTySVnW5SPC8yrnHHhW+JnYw7FOYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46PIUAHVhZnoXlmcmAia+wcp0xZwwkG5L/NAbX67Yb4=;
 b=SDDGw5YdoS7cSfa8Jb2hyVDTJynWGnIMiMdUI8BXSAtQvmnQvADJPIuvTeR+EMDqLHZ1l4lUKNQ8G51Vg41B/0IM/e2M85QVtBK4Y3jsLYT3xU3PocMDa71HeTpfZ7LcdMcfJ3/Ac4ArxUzEVPdU8TSV1L98S1FQ+qMEtQDtVPNEyFKlxdN3t1rut6pajFoIAB2VLuz0W93TlcNUT7BEDhmpbmbYOnpLMvaZ5uvEDiMCroBEhp/jZsUSuTi0rbp57Eff0H9q7TXD1d3z9cuaRWU4/cbIEtBQo5qluw22YgfhxdYqi5u5jQcc0vAqGuub+s3AciEjSTSyvtMOn9n7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 12:47:07 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 12:47:07 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 01/12] mtd: core: always create master device
Thread-Topic: [PATCH v7 01/12] mtd: core: always create master device
Thread-Index: AQHbnmT6czHkKmL9wkq39BK9P9qwmbOO8SWHgAjtlcA=
Date: Mon, 7 Apr 2025 12:47:07 +0000
Message-ID: <CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <20250326152623.3897204-2-alexander.usyskin@intel.com>
 <87ecycrko4.fsf@bootlin.com>
In-Reply-To: <87ecycrko4.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|BL3PR11MB6508:EE_
x-ms-office365-filtering-correlation-id: 5553fa8a-3d02-4b74-3896-08dd75d24e1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZzEybVp4Ky8vM2pDT0h6NXh5Tm5qYkpRVm9OTEhaaDBJcVJMbVdMRHVMcEFp?=
 =?utf-8?B?SWh6dExleG1hZk5UMlBISUwvWE5iYzJmRFhleGNZT2hXaEFDcGRvd1FlNjlE?=
 =?utf-8?B?V1o3ZStPMThOS05nSVV2TTROZ0NpV2pQMnNkSis2NllYYUpPMXBqMUhvUjR2?=
 =?utf-8?B?VzZ5N0UvMnRVVUtTVjEvNUt5OGVNN3Z6MW5ka0pURVVZaFhhbzVOcm5DOHZC?=
 =?utf-8?B?QkR1NHUveFVmaGtBZGlHQVgrNEJPVUFMYnRTMW1BNUhGV3VRNkl3S29rNTNZ?=
 =?utf-8?B?YUVxNDVnNzFzY2p6ak9lM1pvd2huRDFGOWk1ajR2RmtLRU5GdlFyTGpYYXUv?=
 =?utf-8?B?UkNlWWhxbmx0TW81M2RVTG5hWG9qckYvV283bDk5RVZGblBUUkVyZlJvL3J2?=
 =?utf-8?B?Z00xSGFaQ3ZxRTRpVlNMRis5VGtRV2RWdk1XNzB4T2ZJb0psL1VJTUZGVWhJ?=
 =?utf-8?B?dFg2USs2TjkwSW9SVXFoUVdzWjlGUm5uMkh3Q3I4RHhrd2VLWE5Nd3VzMUIy?=
 =?utf-8?B?QStmRy96d0FrSkpFMUlmRGErZlVNbVhkUU5mb2lyc2d3TUx1Ymt2dW1Jajk1?=
 =?utf-8?B?KzdqMVNJVTJzd3Z4SnE0MG5IUFFnait0amJkQTJIQ1BEQ3ZxTDRYNHcwMCtW?=
 =?utf-8?B?VWdWaU9vYlZhMFlFbEZtUmJRU3BlOHBoQXpaV3dqNjd3SG1oTkRMSW0vc0R3?=
 =?utf-8?B?b0JabXhTNW9vZ2VYNk5XdjhWdHVqU28ycTN6eXc2ME5VQndKdmRmSUpJcGtw?=
 =?utf-8?B?U0RjUVB1QnBxRFA2VDhnTk94bTlQUmVqSGN4QWY2bmlRQnlYSjZNanIvNEhB?=
 =?utf-8?B?MXFhV1BFYkZ1eHcvanhQTVZQbkJFRS9BczhSOXg4RFRpSkhMUW4xQi9td044?=
 =?utf-8?B?WWl2b2h2b0VXL2d1aDMvb1FpTE5RZGFnVGZqcGZ2TjdNcElkQklxaThUSVRB?=
 =?utf-8?B?VXdpTXpuNzg4NUlvOFNEbmFTMjBOSVdxWWlwWGZteC9JLzU1bmljaGJMQTB2?=
 =?utf-8?B?YUNNZ0c0SzNyeEQ4SXg3RmJVcDE0K1JGRXc1U3JFM29MeXRTZDh0RVZvaml2?=
 =?utf-8?B?UEYyR1IyaEVHSnowSkszZmlCWlpUSTF2dllhYmdJdG42eVBYUlFPV3M0ZWho?=
 =?utf-8?B?YzZ4SkppTUVJaWJObkJpZzFWZnQ0YVhaeGtyWlFQa2l3b3VaMXBEd04rRCtv?=
 =?utf-8?B?MkVZLzE0OHVpajMxSk51R2Rvb0EwWlI2TnJVeEZZTkZvTnZZL3UxM3Q0cDBz?=
 =?utf-8?B?NElONnM3RG5NVjFaZld1bGJGMzloSXJoNTNWWkNqYTlkUzdlTTJUN0NaOHFr?=
 =?utf-8?B?TitVME1DS29SVG5QVGozanp5aFN0WWpEYXAvVzJXMktyTkhlZThzb0RCK2FE?=
 =?utf-8?B?RXNiaTB0RkpiT1JwSTI1MFN2YXI4RG02N0JYL3diVmF0dzFBV0tSOWdGWWhO?=
 =?utf-8?B?UVQ5V01zNHp0SW9zSkE0TzlYclBmMCttSzFDeGE1blJOV0VmNkZ1bjVPZEN2?=
 =?utf-8?B?bS91Ymt6Y2N4TFlucERFemszclRERUZpWjJLbmVvSElIUyt5TEhEb0hnTXEw?=
 =?utf-8?B?R2FtdGN2MXM3R1pyV2hCR2ZFWkkwb2d0eTFYK3QwSkVFRThQbGYrcnRmRDRT?=
 =?utf-8?B?akhsUE5WdzNTZ0VxZHhJalZwZGhIT0djM3ZxQ3RORDlib3FiYW1mZDNPYW5D?=
 =?utf-8?B?ZDRraWk2VHhBSjNZdWh6OFdoR0prcGFZa041WkprNUppTDVKTEFKTkFNMEdD?=
 =?utf-8?B?MzZQajh4b09SYWxGUnpXaWZtbUxpb3FybXpjMFVLZDZ0bll3dnVmNGxURzU5?=
 =?utf-8?B?b1RPc0k3cnFTeDgzZEJFRnFhczRMMmtFclRDU0J0VkV3R3NkNlhlR3ZYNzQ0?=
 =?utf-8?B?SkNialZ5RlY5bExyQ2pCbmYyZ3U3VTM3a2dyT3NlWFJyVG9ENk8zTTJIeFdl?=
 =?utf-8?Q?SSpx0ZD3YhTFBeiNJ2aF3tIFfUArjwIZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUJIVDRxeGpRNnhiY3JzZ0Y2K3dMSXY0NmRxb094SVFhYmxicUNFT1llN1Fq?=
 =?utf-8?B?WGhLVTNHejdHNjg0UmIwSGFBNWUwMDROcDJBampBZlFNdGl2aWRmZTNQQ0Vr?=
 =?utf-8?B?aGVOa3oyRlhCcnZmanpFU1hzTEdHWEFrSnhQY1F4NHZlNjRaNi80S3NlSVAy?=
 =?utf-8?B?Vkh3MjVmeDk4NXBScUQ4MlF1ZzFPZnVEem11NGNtbEJ6NFhBYzNXZGZYWXVN?=
 =?utf-8?B?WGlZNUZsVnpZTlExN3FHQXZQb0JycGcxT21Gem9DeGdOMzRmRE9SME5PRGVk?=
 =?utf-8?B?Q0VYSm9EM3NvRjJRNWZkRzFCc21OK3dsMkhpYTRVS0dFcHp1NkVTUmhaZ2Ri?=
 =?utf-8?B?RVlMU2xkcEc4bVdKaDI1SUoxMEwwWCt5YUpDcFNQY2dpNDhPaSt3RFBLdVRR?=
 =?utf-8?B?Um1zSUZOcXAvaWdDcGVOdzdhTWxYaUpyWUQ2WHhteFBJSmVLNURmRllpdWs5?=
 =?utf-8?B?Tkt2UE1Ra0g2Mk81TS81U2RGcHlOVmo2MkVPL2dNdGlmck80ZUFJaUdHNnFY?=
 =?utf-8?B?ayt1bGFBRWh0ejdxSlFBU1V2M0hUZDEyMXlKUzFEQWtSYmVKcWd0Vm5HdzJl?=
 =?utf-8?B?UTkzYU0ydlZDQjg2bDAvbGdleEpPZEtwd2dQM3BWM1FicnpEbXJCMEIzQ0Zn?=
 =?utf-8?B?dUh1TnJIeTE0R1pYeFdTcnhtRWZOSzVIVW40bUpPa3h2Ykp0RG83YVhqZlRw?=
 =?utf-8?B?TUNmWFhIQUR2SGpHUmZ2dDVoajIyZUlyYzh1Qms3aXBKNCtzWE4yNEVJRUZz?=
 =?utf-8?B?SnY1cnliU29zVmJsa1ZaeXlFa2JnbmlJeVNRdHg5Q1k0NGw0cktiaXZJS0Jk?=
 =?utf-8?B?alVkTDdVT0h3UjhRdEhINjArQzlTTWRjZnlab0g3cUlaUnFaKzhxMWtLTmNI?=
 =?utf-8?B?MmxqeXFRUDUzUUdpTlg3L1BDSTdqNllwYnIzWnRYbk92MGFVNVJYa1FmRm9G?=
 =?utf-8?B?aXhBSnY2U0RPQ2N3cWtFQjBlT0g5alJreGFEUEs2bjRnZkJJZWRWWXRVUGJS?=
 =?utf-8?B?eXg4cDZtcFFweUFZRUhkNU5JWkZBemJ0Y3VlVHBrSzRtRjNkOGdrUURGZCs5?=
 =?utf-8?B?WE9keGVNbkZoS2NCaTBrVDh0cmEwTzcvUlIrNVVvbE1mUm5uRy8wTTNPTEV6?=
 =?utf-8?B?dGpRSVFjSWhjRkdLL0YrT3A2QjNUQXZSY0pOUXFCZDdRTzZwTDMyaU0wS2hP?=
 =?utf-8?B?ZEN6a2dtQzFRWjdsUU5IRVlETFE1eS9nejduRXpEY0RrdkYvQmxHbThyR096?=
 =?utf-8?B?aW1WL2JFNkxwb0RHbzFLVjdqMVNzQmp3L2QrejRsQ1BaTVR1WmY5bWJ0QmVR?=
 =?utf-8?B?KzRxT1pGTm1wYytlL1R6SW4zYnR5ZkFxOHRnam5QTUFnMFhtZGhEV1JZVTRj?=
 =?utf-8?B?Wm1nTER4d20zNDAzNk15SUJNdXFzZmttK0EweVVKU3M4b2RkQ1F2eXgzMTlz?=
 =?utf-8?B?MGtoUDZNOFljL3k3TVUwK1lZZmhPMXlMM3cxd2R5NkVpUnlsVWlCQkdweGVW?=
 =?utf-8?B?dWNGc21LaHRQU1cyb0pyRjRma2cyVVhuZ0g2VzB0UkNKWjEvbFRUaUtXYmgv?=
 =?utf-8?B?bjd5dFpCazZnOE02MlBKRW13Mjc5MFkyb0E5eG1nR3h2SjY4ek5nRkd6aUpM?=
 =?utf-8?B?bHJ3OFlJUmNKcWR4WDk5eHlmVzFwV0dYbWozL3J4cDNXcmg0MUEzZ0VRcGxY?=
 =?utf-8?B?clZjLzYvekMxQTZyMWc4dXN6a0QxYVdiZENKZ09xSFd4ay91UFowWDBCVS8z?=
 =?utf-8?B?Zy8zbGZ0WDNHYThJWWJvRlQ0UEE2anRYdnJnMlVjcStBTUlWaURIbkxWWFRZ?=
 =?utf-8?B?RUJ1VjUzUVdzRkt3SmtFWDdvSnJ4cDBOcGNQSlQ2SHoyVDRuQnpqanhtNElI?=
 =?utf-8?B?RGNDbHBQZEhhd1ZVR3NETnhUREdmZlRVY3Rzdk9Ra0c3bERQVml0Ly9vcHFL?=
 =?utf-8?B?aUZMK3lUYnlvWWk0RTRHWHc4aVdXay95L0w2V1pOVUtrNWV2WnArWVpqV2FT?=
 =?utf-8?B?bzdsQzJDVmx6SnB6Mmh3WlBqb016eS9LQ0N3VjN4bXYwekJVSHh5eTBBVGZl?=
 =?utf-8?B?NU4vVkRUR3M4dHFVMDU3SmpWVmY1eWxkNHcwdEZCaDF3NVBpL1AzZmFTMXhp?=
 =?utf-8?Q?f9E87LD1pk8SKWGak0DpJpLJg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5553fa8a-3d02-4b74-3896-08dd75d24e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 12:47:07.0310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvUbyRSpQjkpLWuF5CZQ/rJvRj3NKRmPEysMC+mp1gCGLDAa0SAHr8c+D5mXs+puiM6k85PCzl9gEwSMIOOpfGeY0UEnZB4C/qMWk2lgG9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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

PiBPbiAyNi8wMy8yMDI1IGF0IDE3OjI2OjEyICswMiwgQWxleGFuZGVyIFVzeXNraW4NCj4gPGFs
ZXhhbmRlci51c3lza2luQGludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiA+IENyZWF0ZSBtYXN0ZXIg
ZGV2aWNlIHdpdGhvdXQgcGFydGl0aW9uIHdoZW4NCj4gPiBDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUiBmbGFnIGlzIHVuc2V0Lg0KPiA+DQo+ID4gVGhpcyBzdHJlYW1saW5lcyBkZXZpY2Ug
dHJlZSBhbmQgYWxsb3dzIHRvIGFuY2hvcg0KPiA+IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCBv
biBtYXN0ZXIgZGV2aWNlIGluIGFsbCBjYXNlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+IA0KPiBJIHN1
Y2Nlc3NmdWxseSB0ZXN0ZWQgaXQsIHRoaXMgcGF0Y2ggd2lsbCBiZSBhcHBsaWVkIGF0IC1yYzEg
dG8gdGhlDQo+IG10ZC9uZXh0IHRyZWUuDQo+IA0KPiBJIHdhcyB3b25kZXJpbmcsIGRvIHlvdSB0
aGluayBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBrZWVwIHRoZSBjcmVhdGlvbg0KPiBvZiBtdGRf
bWFzdGVyIGFuZCBtYWtlIGl0IGEgc3ltYm9saWMgbGluayB0byBtdGR4IHdoZW4NCj4gTVREX1BB
UlRJVElPTkVEX01BU1RFUj15IG9yIHdoZW4gdGhlcmUgaXMgbm8gcGFydGl0aW9uPyBJbiBzaG9y
dCwgYWx3YXlzDQo+IGhhdmluZyBtdGRfbWFzdGVyeCwgYmVjYXVzZSBJIGZlYXIgYXQgc29tZSBw
b2ludCB3ZSdsbCBoYXZlIHByb2JsZW1zDQo+IG90aGVyd2lzZSA6LSkNCj4gDQo+IFJpZ2h0IG5v
dyB3ZSBoYXZlOg0KPiANCj4gLSBXaXRob3V0IHBhcnRpdGlvbjoNCj4gbXRkMCAobXRkMHJvIG10
ZGJsb2NrMCkNCj4gLSBXaXRoIHBhcnRpdGlvbiBhbmQgTVREX1BBUlRJVElPTkVEX01BU1RFUj1u
DQo+IG10ZDAgKG10ZDBybyBtdGRibG9jazApDQo+IG10ZF9tYXN0ZXIwDQo+IC0gV2l0aCBwYXJ0
aXRpb24gYW5kIE1URF9QQVJUSVRJT05FRF9NQVNURVI9eQ0KPiBtdGQwIChtdGQwcm8gbXRkYmxv
Y2swKSBbdGhpcyBpcyB0aGUgbWFzdGVyXQ0KPiBtdGQxIChtdGQxcm8gbXRkYmxvY2sxKQ0KPiAN
Cj4gSSBhbSBzdWdnZXN0aW5nOg0KPiAtIFdpdGhvdXQgcGFydGl0aW9uOg0KPiBtdGQwIChtdGQw
cm8gbXRkYmxvY2swKQ0KPiBtdGRfbWFzdGVyMCAtPiBsaW5rIHRvIG10ZDANCj4gLSBXaXRoIHBh
cnRpdGlvbiBhbmQgTVREX1BBUlRJVElPTkVEX01BU1RFUj1uDQo+IG10ZDAgKG10ZDBybyBtdGRi
bG9jazApDQo+IG10ZF9tYXN0ZXIwDQo+IC0gV2l0aCBwYXJ0aXRpb24gYW5kIE1URF9QQVJUSVRJ
T05FRF9NQVNURVI9eQ0KPiBtdGQwIChtdGQwcm8gbXRkYmxvY2swKSBbdGhpcyBpcyB0aGUgbWFz
dGVyXQ0KPiBtdGQxIChtdGQxcm8gbXRkYmxvY2sxKQ0KPiBtdGRfbWFzdGVyMCAtPiBsaW5rIHRv
IG10ZDANCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rPyBPciBtYXliZSBldmVuIGFsd2F5cyBtdGRf
bWFzdGVyIGluIHRoZSBmaXJzdCBwbGFjZS4NCj4gDQo+IFJpY2hhcmQsIHlvdXIgcG9pbnQgb2Yg
dmlldyBvbiB0aGlzPw0KPiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQoNClRoZSBtdGRfbWFzdGVy
IGlzIGNvbXBsZXRlbHkgZGlmZmVyZW50IGNsYXNzIHRvIGF2b2lkIG10ZCB0cmVlIGRpc3R1cmJh
bmNlcy4NCkl0IGlzIHJlYWwga2VybmVsIGRldmljZSBvYmplY3QsIEknbSBub3Qgc3VyZSBob3cg
d2UgY2FuIGRvICdsaW5rIHRvJyBtYWdpYyBoZXJlLg0KDQpBYm91dCBNVERfUEFSVElUSU9ORURf
TUFTVEVSIC0gd2UgY2FuIHRyZWF0IGl0IGFzIGFub3RoZXIgcGFydGl0aW9uIGFuZCANCmNyZWF0
ZSBtYXN0ZXIgZGV2aWNlIHBsdXMgd2hvbGUgZGV2aWNlIHBhcnRpdGlvbiBhcyBpdCdzIGNoaWxk
IHdpdGggYWxsIG90aGVyDQpwYXJ0aXRpb25zIGFzIGNoaWxkcmVuIG9mIG1hc3RlciBkZXZpY2Uu
DQpGb3IgdW5wYXJ0aXRpb25lZCBkZXZpY2UgdGhpcyBtZWFuIHRoYXQgd2UgY3JlYXRlIG1hc3Rl
ciBkZXZpY2UgYW5kIHBhcnRpdGlvbg0KcmVnYXJkbGVzcyBvZiBNVERfUEFSVElUSU9ORURfTUFT
VEVSIGZsYWcuDQoNCldlIGFsc28gY2FuIGFsd2F5cyBhZGQgbWFzdGVyIGRldmljZSBhbmQgYWRk
IHdob2xlIGRldmljZSBwYXJ0aXRpb24gYXMgaXQncyBjaGlsZCwNCndoaWxlIGFkZGluZyByZWFs
IHBhcnRpdGlvbiBhcyBjaGlsZHJlbiBvZiB0aGlzIHdob2xlIGRldmljZS4NClRoaXMgd2lsbCBj
cmVhdGUgdGhyZWUgbGF5ZXJzIG9mIGRldmljZXMgYW5kIHNvdW5kcyB0b28gY29tcGxpY2F0ZWQu
DQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0K
