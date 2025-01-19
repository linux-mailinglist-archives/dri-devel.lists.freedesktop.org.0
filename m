Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF491A160BB
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 08:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1104810E2B8;
	Sun, 19 Jan 2025 07:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9tuSgfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABD10E2B8;
 Sun, 19 Jan 2025 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737271830; x=1768807830;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gImoSMzBWEcNsyis6SD32BrcLGYFpIaETaykBpqrye8=;
 b=k9tuSgfwwRO4URFyIAuFB/yyV+9qJUhAhr+6EszzXgH/5y+edOe0doCD
 SWb6hZPlpA8uiV/jVO0YVqU1MlqrnSmRyzUla3I0uIMtxg5sGZXm397Ek
 1Ehs/VRvpcmoupUrB+MtqrWPHiVTaAfCQY9GvTre2w9+uuXtk/yW1GoT+
 ZEOTIK97IxZWEqTPnDD60OOE/Qclj5DqwTUGCkcdq6p21wHMzzhYfbhed
 br0z+pYrKJeu+kFwJ9xfGWJnrxg+MI4na5yd/Eujbk0lUtnh9TC28ZFGI
 0yffZKDdiK2wflTzvpwmKWMsZw0UICCyiDIuA7hquNDWFRuAEdlLAQaI9 A==;
X-CSE-ConnectionGUID: lONsAGRUQominyKD27JB5Q==
X-CSE-MsgGUID: kgMxbhliTZehgAlpNg8/7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48651213"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; d="scan'208";a="48651213"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 23:30:28 -0800
X-CSE-ConnectionGUID: wnfMhksQTBKOIg7/rJF0UA==
X-CSE-MsgGUID: yXQRVAwXR9yAnX+4tUqqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; d="scan'208";a="111170657"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2025 23:30:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 18 Jan 2025 23:30:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 18 Jan 2025 23:30:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 18 Jan 2025 23:30:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9I4ZPUlKwGlPU4zszIozIj+Qe4OkhK+UmfS+nQ8ZokfzN3l5IPdyswF4aBLb25JaoIWlN+PyloyThHh0UswafxHG/hXLprvD+Z0rmx17e3bOb0A9hJxIm5WG3LyXwTrSqj3Gy/ySRQZkVzEKVILRF19NIi0/fgYBSEMFLZ7StlYidv0NorNP1QOBHDB9kA1js8tuo/l8wz3ShoeFdEnjU3ixS2oNVWH6imhWHtsWK82fiwG0EZ5+9r42og3EQzU+NgYjimuOxnJs3ppRzJ8GKRWYDK3q/3+1BJ1abFYP+OYdQj2NtKQE85qb3//O5dAZohtSsLe+bkKI6kr1oYSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gImoSMzBWEcNsyis6SD32BrcLGYFpIaETaykBpqrye8=;
 b=SMleKGP5W0WWrnFBqAViL01QXR/sBRPt0kWwq+WY6BLktcT/2wUwX33m+twhmFyBWkyDfOUAlrNqPbH/xSMW8XWq+leJYJDfOC4DsRYkTtu+4aw77rxDo92fRL1JGnPsMeYpn3WEjPrhgS3jkENEGPTDc5jK350N+mrQ/+Q6pzrhi1suslz0qTJQISJxrcWshPLLJ6daviLLhyLgTN0Ayatn5ltfYMu3vM4PReYt69sfyKLHVIqfKkSWq+QJedEcIyhVKu5BeDYsWwHcGtuVwUyHWUFGZLMh0IWe4MOUdrczSHGh+Wl0ZnxfVJh0soH9vV64uWsqkS/xH0srD1ZeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Sun, 19 Jan
 2025 07:30:10 +0000
Received: from IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d]) by IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d%4]) with mapi id 15.20.8356.014; Sun, 19 Jan 2025
 07:30:10 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, linux-mtd <linux-mtd@lists.infradead.org>, "DRI
 mailing list" <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v4 01/11] mtd: core: always create master device
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMYgWoAgACDNgDMz5OtTrM1NVtQ
Date: Sun, 19 Jan 2025 07:30:09 +0000
Message-ID: <IA1PR11MB63708F7387CC6C5C8C1B5A5DEDE42@IA1PR11MB6370.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
 <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <677101004.241399779.1737152836282.JavaMail.zimbra@nod.at>
In-Reply-To: <677101004.241399779.1737152836282.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_|PH7PR11MB6650:EE_
x-ms-office365-filtering-correlation-id: f14720f7-7f45-4ec6-3966-08dd385b1ada
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UmsvRWU1TVdncG9WOUJQTHBNZ0Q3UmxCazVsU21kaXhua1BiQk1sMnptd0pm?=
 =?utf-8?B?MitXaGM4aGg4dU8xNzlWamIrazJOSVdnSzRyZGZxeGdDVDBaRDNkcUhGTEZn?=
 =?utf-8?B?MXV1NlFtQVd2VklRelhwZE5QWUhBaUxUVWh6QWtUWDhUVTBsQUg4WnF3TGRj?=
 =?utf-8?B?L3FxMndxV1lLbXprNTNJYk1mQnhNMHVSdHhsQVBOY3BTT3BHVHZKd2ZiVG9T?=
 =?utf-8?B?SVczdkRkWDZUNi9SeUJaMnRJRDM3a1QrV0Vjamw0VU40R3BYRU9DSW1PZExL?=
 =?utf-8?B?V3hHWDVubTFjOXFRSThMZGp5ZVBlVy85SjN3cUJjSHdwWGlKWENQNjJOR09l?=
 =?utf-8?B?V0FNMDNnVHRJMFJFSE1kZ09ONlhTbXBpMi9MTzZCRnpySFZocTZ5TDB2MHBs?=
 =?utf-8?B?c2ZWMUFzdTQrcnA3cXQxbTVTdENZL3lQSWRkMzVwd3NxQ1RGWjhuNDMxaXR4?=
 =?utf-8?B?VlhWM3FpYm90d0xBL2pVOHRhdEcveDZmTWZ4Tk5NZk9HU3RHN2QrZFh2MWJO?=
 =?utf-8?B?ZUJhRWFvdDl6L1BwbUV3cElEcm9UTjUwL1JkK3ZrNThSZm01LzJQODJUWUth?=
 =?utf-8?B?TFRkUWJ2a3c4M3p6M2N0YjlSd3c1WFFaNk1jNldpWFA5bTVmZVdYdHJQaktD?=
 =?utf-8?B?TDZtR3lVVkJDQXdNV1Bab2l6bC81Y1czclBaVVorNURSYXlZdTFaYzMybExM?=
 =?utf-8?B?VFZwb08yS2NtS1IySmZhOXNtNHo4T205TmxHVEViQVBMQXhsc0ltbmNmdHdL?=
 =?utf-8?B?V3lYS2lna1lpbVROdk1hQXMzQlk3YW92MGNJRXl0OUNBbjQ0RStteU01R1Bu?=
 =?utf-8?B?ODZ4cmRPOEEwYy9MV3pDOEU5K3krSmJ0MHN6RzFIMFEzMjhMOEhvR2tCRUlE?=
 =?utf-8?B?b1FoRVd5dXNHTklud0k1ZVdWU2p1Z2U4TmtnK2dCQkJ1RHIzY2JmNk0vZ0N6?=
 =?utf-8?B?M1hVT0VnMEZPY0VIVUxGTHNwR1QvTEhYYzZLU1pBdlJmSEhQUngwQ0VpclRM?=
 =?utf-8?B?VUN4K0IwOUVHa2YrZTRlMm9haW5VbzlhcTBZRGRXV2NNMW9nZ3lHUVpkaHg1?=
 =?utf-8?B?STJ6MUV4K2g2bzQ3ODlpQ3RzVG9vTmRjRkxlenZhbGNPN2NhTGdGNlBWWjkw?=
 =?utf-8?B?Tk5PUVRtT2ptYzQrZ28vRXdVdkZwZWJmV2d0N1hXRjA2ZW94NTlBUldLbVhq?=
 =?utf-8?B?VURWcEFVWHkyM1hYVUpYcUFpeHVqSmhoRHpsUC9aWkpKbll2aEo2WEFWa1k4?=
 =?utf-8?B?N3YrVVhEODlmMXFWZXcwQXIzMndmMzBraG1Fb3JMaDdBYXQzWXB0ekpsVHZQ?=
 =?utf-8?B?dDFFY3FBNXZVMWJ3aXpNRVpJYmRhSldVb3prb1htZzRaVkh1MnRtL3ArWE00?=
 =?utf-8?B?K0tFNmI2Mmk3clJDcEppemduTEtDd2ZiODdISDlVbTdxY3JXeG9uNG9tOEpV?=
 =?utf-8?B?STdaTWRTUWVwU0RNakUwek9zMVBNMVhZWU9uNDl1UWpwYk5YZjBIOXhLc080?=
 =?utf-8?B?YWxGRDRPTU9KM2xaR0JUdDRWdDFzTStmWnN5WmtNOTNDZlFFVFk4UHczUjJt?=
 =?utf-8?B?aXB6V2x2bFJqdWNnM0ZPczY3M3I5RHEyNUdKb3prZXN4SEkzazNkelhZbjds?=
 =?utf-8?B?VHVYVXVWZVJRNXROYXYreU54V3JlckxtU0IwKy94ZzF0RHAreGkwVnRwT0Zl?=
 =?utf-8?B?d3kzS0Jhb1VTZ0VwSVdjR0RobXNOa2RrMmEvNVRIcjM1OHpEZlBBTHAySFZK?=
 =?utf-8?B?Mm5SdDN1QjRtcDQxMGpubU55MlA4QXBNTVZCc1QwOUhud0p1dHZBVmJiSU0z?=
 =?utf-8?B?aHNtekxPWmkxeFM5NklFeGQrRW9walpucXZpQjR5aUkrcEtvVDZ1ZTFzWElh?=
 =?utf-8?B?UFNEZmx2MURkQUZsVWttQ1d2aUcxV0svdS84OTdqd0VIM2hlYkhsYmtXT1dI?=
 =?utf-8?Q?QDP3jxGc3fKhZGIJvqzKusO/6yJE5jE8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6370.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bm16QjViNjh2UFNGYm90L0lodDVPbnNUbkZyNC9EVWRaOTlzdWNzOGcwQjEr?=
 =?utf-8?B?OFJJdHF4eUpTcTQydG0wZXl0UEdzNExYQzZvbU55c1RpRWdMenRERTdqdGo5?=
 =?utf-8?B?UjNBTy93dE0zWlN3dG4yV1h5RjA4RW1pcm1RSyt4VkkvMk9RVHRlKzJ2SU9k?=
 =?utf-8?B?SXMrd3lUMzdNczBXUUFGV3RPWnI1NHJXVDFQS3JJVnd2K255emg5ODFOeW1o?=
 =?utf-8?B?M3k0b3dCOEZMTnNzTG90b1o0QktkNEUxNHBCb2xLU3RKMmNJMllGZkJpRGhC?=
 =?utf-8?B?Ni9pa1NpREtJM2t5cnIwWmJLdE8wK0hyazNEYnBrMHZaNm5sRWZxQUs3b1RD?=
 =?utf-8?B?ZjUrRk1TVUJmV3BuN3BvZFlVZ2xQS05PZFhIV04zUmR5eVFhU3hPM2srSzRk?=
 =?utf-8?B?blQzUitWT1gxVWlQdTlnbFdaVFlSSzRiVzFiWGZIbE5OaWlGZ3BaSVhpc0FO?=
 =?utf-8?B?ZCtkVEFPSThmVytVcHZ0S3V5MTFrUWEzUHRNY3pjYUE4VDNHVzBXeFpzSmJ0?=
 =?utf-8?B?cDJrY251MUlLMzNmaVFTT2R5bklBL0J4VHhndnBOdTB4Q0ZraE9uQ2VJZGMy?=
 =?utf-8?B?QTZuUWdvL2VucmQrWUpqVFZ2cUpTcFRmcU42aGhaOFk0S0pLenh1aEdjSU02?=
 =?utf-8?B?dDBVRHhjcmovNXhLYldYNVUxTnB6ZVlXcWpoUWswbW14KytzNlZULzlBSEc3?=
 =?utf-8?B?VjFXeXRsSWtGUUM0aDhMQTEzY002NnZ3b2NYaHErR1JSaTQ3ZUtqMndlR3lm?=
 =?utf-8?B?SW5FREZ2U1BsRzNSQjJwUzEwUGFiRDJBaUJLV3Y1V2tBbEJOaDdyWWF4WXhy?=
 =?utf-8?B?UlJRUFNJZ1A2WEViZGhGK1hKbSt0UjVkTm8rMmQ0R2k2d1MrbmdCcEhMMkdV?=
 =?utf-8?B?dkVCTUtHeGdIZGIxQWRtbVRvWkkwdC9seE92SFROWDRtaVpnNFBEWFJ5ZUtX?=
 =?utf-8?B?MU1kbkE0Y0sxWnEwb3cvSWF6a0dSSHpzK2hnN3VKeEpSUE4zUmhlMVdpeHBx?=
 =?utf-8?B?YWxuUjZyL3piV1lJSXQwYkNZMmlTd0JRdE91Tm1zQVpTZmlDYlBzM3pTa01Y?=
 =?utf-8?B?RzUrOU9Za2hJM2N1alRWYjZrVjZWOWFwaUdTVVZCcTVyZXg0WElVdHZuZW4z?=
 =?utf-8?B?S0RySlhYL2JUL0JUYzVzYVkydkNJQmFJTzh6eFByL01sOXNVRWs3NE5tREwy?=
 =?utf-8?B?bXNaZXRmaGo1RU9hejZKZWJZTTM0Q2RxQnNwZSs0RDNVdlNJdklwYTFSTHl6?=
 =?utf-8?B?RjBOVFE4NndkSUdIRmoxOGp1ZS94cDg5Nm5sUDlzVmh2KzRpODZBcUx0OUd2?=
 =?utf-8?B?ejRXVmc5U1IzZHhPOWR0UDZvdm1COTNqWVBrUk9WOC93V05NUWlmUjBNNllJ?=
 =?utf-8?B?Q2R0ZkpCeXhjVDdZSmt1RytreTlnNEJBYnl5WnN4SHZZeWNlWFpoY2twTkI4?=
 =?utf-8?B?Q2ljNHlqM3hxZVJhZkozZ3lpRTdXVkxudUZWbG9UVjRhYzFCTElIcFhYbW5k?=
 =?utf-8?B?TFhubG8wOCt5RWdrZXdjdHdyenpxTkpaQzZiSEtaWDJxdE9uQ2JyUENXdGlI?=
 =?utf-8?B?YVNmOHZaeU0vWjZ5eUJZOEw2eVhGcFNxcHN5NGxIZFBGdjRCVHdScWVRbEd0?=
 =?utf-8?B?djJ5VzdGcGJtQWNKY21wNkZSMFFvZk1qSFVkeDVkeGhEdmlNZXQ2dFg4bWZr?=
 =?utf-8?B?d1BYbVpka242RU9ZNGlBQUpvSjVPZ0pTKzl5OFNGa1NGUjJtQi9Vdk13TjJq?=
 =?utf-8?B?MU90WnU3S3lBSUNBV29CSFBKMmVCS3B0ZEZ5a1pPR05sK09VM0FyT3pPdWx2?=
 =?utf-8?B?OWFmZmZ4SkpZbEYwUlRXZWtEZ1BnSld4TFpVbDIzc0Fyayt5amVDaWw5T2RW?=
 =?utf-8?B?K1Q4c1U3Z2R3ejZuRVJOdGZpL3FvWnNHd3R2SmZOaGdDc2dJL2RKaFlOYmFr?=
 =?utf-8?B?ck9kT2xXNjZuN2tTSlNNS0xuVHAxS1dRRmgyRTRaSXZ5REF1QXBTSG4rdW9L?=
 =?utf-8?B?bW1Pd3NYcjU4MDBUdHpuMDYrWUc4OFNQb0NtWEtpZmpndWFTbUlyUEhwZkta?=
 =?utf-8?B?TEZIU0pQR2orZmVTL3A1VHRaNVNCdENZUzNXMjRUTDVPeEY0MWRXSmhIaXRJ?=
 =?utf-8?B?OGpnR0IxT0JXOWpsaktSeWxZNENKdnF4dXpXRjFoNkhoMmRrbTFmWE9tQ0ZV?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14720f7-7f45-4ec6-3966-08dd385b1ada
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 07:30:09.9967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPQ2K+v0c4d0C3A1LWAhD35CrSphK2uG9sRi6QJZ1iGIlSODz/76BidNhPADHOFyFUcRLvMjPN11AwNMl2ppbGGao2UK+PSX9E7c3porBUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
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

PiA+PiA+IFRoaXMgc3RyZWFtbGluZXMgZGV2aWNlIHRyZWUgYW5kIGFsbG93cyB0byBhbmNob3IN
Cj4gPj4gPiBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgb24gbWFzdGVyIGRldmljZSBpbiBhbGwg
Y2FzZXMuDQo+ID4+DQo+ID4+IFBsZWFzZSBleHBsYWluIGluIG1vcmUgZGV0YWlsIHdoeSB0aGlz
IGlzIG5lZWRlZC4NCj4gPj4gSWYgdGhpcyBjaGFuZ2UgbWFrZXMgdGhlIG92ZXJhbGwgc2l0dWF0
aW9uIGJldHRlciBhbmQgYnJlYWtzDQo+ID4+IG5vIHVzZXJzcGFjZSwgSSdtIGhhcHB5LiA6LSkN
Cj4gPj4NCj4gPg0KPiA+IFRoZSByZXN0IG9mIHRoZSBzZXJpZXMgaXMgYSBkcml2ZXIgdGhhdCBu
ZWVkIHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudC4NCj4gPiBBYnNlbmNlIG9mIHRoZSBtYXN0ZXIg
ZGV2aWNlIGJyZWFrcyBwb3dlciBtYW5hZ2VtZW50IGxvZ2ljLA0KPiA+IGFzIGtlcm5lbCBhdXRv
bWF0aWNhbGx5IHByb3BhZ2F0ZXMgc3RhdGUgZnJvbSBjaGlsZHJlbiB0byBwYXJlbnQuDQo+ID4g
SSBpbml0aWFsbHkgaG9va2VkIHJ1bnRpbWVfcG0gb24gY2hpcCBhdXhpbGlhcnkgZGV2aWNlLCBi
dXQgdGhpcyBpcyBhIGhhY2ssDQo+ID4gbm90IGEgc29sdXRpb24uDQo+IA0KPiBTbywgdGhlIHBy
b2JsZW0gaXMgdGhhdCBtdGQgcGFydGl0aW9ucyBkb24ndCBoYXZlIGEgY29tbW9uIHBhcmVudC9t
YXN0ZXINCj4gbGlrZQ0KPiB3ZSBoYXZlIGZvciBnZW5lcmljIGRpc2tzPw0KPiBQbGVhc2UgZ2l2
ZSBtb3JlIGRldGFpbHMuDQo+IFdlIGhhdmUgYWxyZWFkeSBhIG5vbi1vcHRpbWFsIHNpdHVhdGlv
biBpbiBtdGQgYW5kIEkgd2FudCB0byBmdWxseSB1bmRlcnN0YW5kDQo+IHRoZSByZXF1aXJlbWVu
dHMgdG8gZ2V0IGl0IHRoaXMgdGltZSByaWdodC4NCj4gDQoNClllcywgdGhlIG10ZCBtYXkgaGF2
ZSBtYXN0ZXIsIGlmIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGlzIHNldCwNCmJ1dCBp
dCBjYW1lIHdpdGggZm9yY2VkIHBhcnRpdGlvbiBhbmQgdXN1YWxseSB1bnNldCBpbiBnZW5lcmlj
IGRpc3RyaWJ1dGlvbnMuDQpJZiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBpcyB1bnNl
dCB0aGUgZGV2IHN0cnVjdHVyZSANCmlzIG5vdCBpbml0aWFsaXplZCBpbiBmdWxsLg0KSSd2ZSB0
cmllZCB0byBwcmVzZXJ2ZSBzdGF0dXMtcXVvIHdoZW4gQ09ORklHX01URF9QQVJUSVRJT05FRF9N
QVNURVIgaXMgc2V0DQphbmQgaW50cm9kdWNlIGluaXRpYWxpemVkIG1hc3RlciBkZXZpY2Ugc3Ry
dWN0dXJlIG90aGVyd2lzZS4NCg0KPiBUaGFua3MsDQo+IC8vUmljaGFyZA0KDQoNCi0gLSANClRo
YW5rcywNClNhc2hhDQoNCg0K
