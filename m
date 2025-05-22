Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B8AC09B7
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 12:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870CA10E944;
	Thu, 22 May 2025 10:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nf5zxv4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C9F10E944;
 Thu, 22 May 2025 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747909617; x=1779445617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AgNSwsuBDqiRqyfutCsvpSIoW5ShtFfsmWdUtLP4Gr8=;
 b=nf5zxv4NIDkVx0SAFMSfq6wC+OrG8gCCXnPah23SNeEATlEKPoksLXbs
 WhZhRlJKP/k/dDMXAovMMy0qnbLyHgdGng68Ouu44B3DMW0V/Igz2R9uW
 Z2A5UXXdrIvzLX0P2kwo40/TvMu8mdubk9ThzSx1Q8yVlADO/DVpuN1BB
 Qwyv6sNJaK95MOuZoj8IEgTLp0NJDRdzw22HOQhNoxFbgI+GGA+8nFJ7J
 vaetjVmwh9iUkAMt/Px43ITBeed1n366JvitAlq/r2+xJ0ZhmyOO/zpIW
 6hSAHZeKt9jLGwKkuAPfIjo/fDofUz2yNA+F7WXAjqTQeEmKVm0taBMDz w==;
X-CSE-ConnectionGUID: iMkq2W4dSJarcIcBfnSHtg==
X-CSE-MsgGUID: NL6eSUB3Q9Wl2JAr8oihBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49914694"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49914694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 03:26:54 -0700
X-CSE-ConnectionGUID: RIiMw14eS3ORlcT35HPYGQ==
X-CSE-MsgGUID: I/GYJHlhSVK9JXkTpRUY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140313251"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 03:26:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 03:26:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 03:26:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 03:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feOkQF+akHOewJKlkEWrpZO1lW/OQqBkZrCaZJ/SR82ytCKVrNrJY4gryvCy80oofFj8IhMaSYYL5GB7eFo4GI5tyCovJnv+HqXocecAwlxwLXY93aC9GKpmwX+3m4qTY2bGR53CxBHoP+QlNOkO1KGVZNTos7+BI2ErRTV8wFlbwygkQI5LOZLbiup1WdMt7+qhAg02vNDg6AFn47qf0tklwStb7erKjFh+eg4WKxASQ3rYfm0jkKillu80QPs9C+TdG4Z7TIt2EUGlmrXuh0At5yVgebbTdE9LELeSIM3TZ+msldph3CGfX78npt/H+8uK7jirwqzxQqF0cUi3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgNSwsuBDqiRqyfutCsvpSIoW5ShtFfsmWdUtLP4Gr8=;
 b=cajm8Ivouh/8SvQqIwZUdNtHVekH66ntQnP9SeTBoE3eVMsITVmULf+T8sM2jKM3kTo9Q+bsmb8oIx7AX1SZm+AFdFdvgbjRnqfTvmjr/cjOx+ZqI9xP0uDygZ9T/JnCx1YjufL7xwyXQAYhDRrSh7aijgU7LrshFZjjDeCTuIzz8EhbVazVxvmYXL0YpBqLc11JnVUvR4cPhRE7UyrAwI+xIx/xfMztuGdHo19OA9OmZ31WjqbjDnCQnD7zaYHVPpMpMd49pXmYVSS4iDx3qoJYa2ahC6mMtDLSjlHJuNN+jufnTuwO6/Ryy5JEjBfHbKGCfEQxQ9kalZLMOIJ+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 10:26:51 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 10:26:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: RE: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Thread-Topic: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Thread-Index: AQHbxaAAGk0T3Gb77EOFbnNMirDIEbPdkf4AgADqu6A=
Date: Thu, 22 May 2025 10:26:50 +0000
Message-ID: <CY5PR11MB6366226E8D55DBFC582AAA41ED99A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
 <aC428Ak5j_x6Cr2o@black.fi.intel.com>
In-Reply-To: <aC428Ak5j_x6Cr2o@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA1PR11MB7087:EE_
x-ms-office365-filtering-correlation-id: 356f8752-d649-4af6-9cab-08dd991b2a17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K3VQMmJOaWJ1QVAreFBrQ3lYamYvVDIzZXlaTjVEYkV6RnVWUHhJVm5QeHN6?=
 =?utf-8?B?d2YxbXFEcE5Md1I1ei8rYnhFTVVyVS9IM0dZM1RUVHRYblIrbVhtK0tMMnJx?=
 =?utf-8?B?RTZRMmVsTngxamFCVXd6QjYxQVpmWXJXUW1wTWRkYjVUdXo3dU1CbEMvcVB2?=
 =?utf-8?B?RnpvTzdKQWVLSmpBNFpiWG5KK2xmQ1BETEp2ZHFKSllscU4rMjZyS2YzRGhH?=
 =?utf-8?B?UCt6Z0NXOTFvS2g1M2JQcnVheHU5SXNURTM3cC9MSVNiMk8yRHkzUk5LSVp0?=
 =?utf-8?B?Z0dSQ3VUemRUK1o1ajc2eWlmT0RMVXE1MGtNclZvNTY1T0ZtaTBVdlNmNkdq?=
 =?utf-8?B?OFhBT0NlcFhrZjdCY1BDb2NDWm1mWGRkcUd0b1lCWWZ1bFNLWVYxTTkvNStV?=
 =?utf-8?B?ZjV3NTVtSGlHZVJoeElPYnJlaHFpdmtQUWkyUTlhWmxtWW9Bc3NvTHc3SVVN?=
 =?utf-8?B?bG5ObkUvVEUwTU1EZmE0d1owNWZWS1VRSjlCc1RiOVZtZXVLcGQ1TFpKVWtt?=
 =?utf-8?B?TlFKK2x5WThFZ0Q2a0Q0eEVPaXFHNUw3OFk0d2tqNTF6Qlg1UEZkTnpSWGRD?=
 =?utf-8?B?MDFnbHRXSFlDNzlZeDBScnVVMTZQeUJkNVhUaFh6dExsQitVaHRZdDhrNVNW?=
 =?utf-8?B?VEp2STVNMHRQY1hiVzBrSXAxanR0SzlvOURYQThLNUlwODJBbHoxL3ZHQkYv?=
 =?utf-8?B?bnF6VHFZTXcvbU9IOXNBTGpSZGxxRnE4Wmd5RVc2R0RjdWRtWXRjd0Z3Wmhj?=
 =?utf-8?B?WmhBVDNZTmRoOW9KZzBrbTlMQm5GU0J5Rm1JZFcyeGFRTGdXc0JSeldjOXY2?=
 =?utf-8?B?Uk5Ram5oQnRPeXFhZVVSVkF0R0pKaEc1VFlMUzhkMHlZRUVBTTZJWENWdUcz?=
 =?utf-8?B?NUtWOHFiV2ZQUmpFYVMzM3N4SXRmWnlsTTRKQ2RjZlFBNWY2U0FmR1o1OTc0?=
 =?utf-8?B?N2dHSkc4cGxxZGNUd2RrMWJrZjR4UFYzVlhxd2pMZDVDT1d3SUZUYjlwbjh1?=
 =?utf-8?B?TG5jTiszQkhtSE9od2xNUGYyaGs1NFlCOG5RS01FOXp6NWNGQ3Y3cG0xT1Ay?=
 =?utf-8?B?c0VFNk1Sams1YW8yYXAwRHB4Uk9NOVNUVEJYT0RYL1FSS2c0REpjUE1TNG1C?=
 =?utf-8?B?ZlVGeUtDeklvVnB3NWVPUU1DZGxzYXRHdHRDWk1lcDdaV21QZEhockFKWUY5?=
 =?utf-8?B?SDNLNVh4Z1hoaXo3dUZIZko3V25OOEpOYnVTNjYxR3JOUDk5YTdJSWNwZHdj?=
 =?utf-8?B?UU8rb0J5amNCVHczTVdLdUxKSTVvaEZhdGpSazR6Yk5kd2dBWDQ2NzVQTWc3?=
 =?utf-8?B?NWZYelduUGh5OWZxNDJKL1AxU1N5WXFyQkdGbDBmWTR6K2xxV0p0eFcxdWZ5?=
 =?utf-8?B?SEJuUHpiLytGZzhlSW1TNlU1U3ZFRzdVLzFWRFgwcXhGeTgrU1FIbG0rUkc5?=
 =?utf-8?B?VjhJeHBSZzNCc3F2bFpLMU1qOS9ySTZuUWlSU1Qrb1hmVEVmUnh0WmxHd2t3?=
 =?utf-8?B?eVJWakdGV2l6bXVvbGVQOVNmejJFMVlhbE5PWFU1Sm1PMW94WkhUVXB0VHFR?=
 =?utf-8?B?dFlIbmREcGszZTFVTk94a3VMTmRaQTNLdzV0ZDQ4WS81SGdsa0RHOXNTMEsy?=
 =?utf-8?B?alA1dFR1R0hYUlUvYnN5c2lEb3FZOTY0b256YTE0dUtKeUw3dUI0dDUzbjQr?=
 =?utf-8?B?Z0U0UGU1S1UwSnhOOWJ2QmVNMWVNR3kzbkc5eCs2d2dRQVRUR3luMUNEYndn?=
 =?utf-8?B?WnZhQ1JaTUFuRUdVN1BDL1Njc0hlOXpzdTRZU3hDWVBZVGtwajZxRXR2K3VO?=
 =?utf-8?B?UkVFanU0ZkZkdXZNVHJvM0E3bmJwT1E3ZHZBZ2E5eEhJVWZwa3gwUktHZ1Ey?=
 =?utf-8?B?NSs0alF0UXRpVmtDTGNkTzZMa2VtQzdUYVBKdmpWaDVoeVdSd010T1dJVlVZ?=
 =?utf-8?B?a21iYWpRUk9ucWpRNGdoMjVJRmY3SkFBRE96ZmlmZ25sNFhaVWloblNjYVVT?=
 =?utf-8?B?Uk5QM0QwSXdRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk8rM0pXaFNXTEh1UWhZWVgxN0MxTWY5VGdyQ3RrYzVGcVJDTVQ4RUZXK1Y1?=
 =?utf-8?B?VHNoaG54cWlqa25ZMEg1NWFpZGJjQUluN2ozWEl4alh0QmJEakpKWHFVMDFN?=
 =?utf-8?B?aVNjUzJsYTRjaWxBMHlLN0NLdlMyTWh3M0NGWVBPSnhjVUcyTVhQalJYQWFX?=
 =?utf-8?B?Qi9lbE1vRlpPZUd3L3pEL0FNTEgrSWtzZytyZWpHZ1liV1Nqc1VHMXVjdjRF?=
 =?utf-8?B?cWo2b1RzSnlzU01uZFJCQzhNM3pQeDBtZjF6ZzN4VU00VkxOZmkreko3V3dY?=
 =?utf-8?B?amtPNGpnWmdBU3ZQUEQ2elZPcTVoUnFtc2tHQjdCRE9BVkN4Sk1zNS9PTlJP?=
 =?utf-8?B?azF5cytNL2tCbkYzQ1VXL1lZQ3JlVC9SU2RJc0xGMTJPaTRwWHFuWXJRRlAz?=
 =?utf-8?B?UkFnOXpubFgraXZSSHRNZEZnMUxOd2tyTE9MQ29paHpUZHNxS3NIb0xPcytx?=
 =?utf-8?B?TDEzeGVSTGlKTVhpR3A4RGRqakIrd3dKZXlYa1FFRWJYT2IvQ2w3eUJDS040?=
 =?utf-8?B?dVorb2ZZVmtEdXloYzRPVGZvRW9rWkJTdzRoTG02TWtHMlVVamJoZWVqR3I3?=
 =?utf-8?B?Y1VXamIyOXp1RnlzUlphWTg5ZjNvK3FqM0RuMkpFZW9kVGYzTFROeWVXRFg3?=
 =?utf-8?B?WWQrRDNDdC9wd1FsMTJrTzdidldKMERYVjR2S0FDOGJzWjREWjNNOWVrZHR2?=
 =?utf-8?B?OE5Ca0J6UnB4N2h6NHkrcGNRN0xzWkRjWm9rNkFLMkdEMG5zUHJMNlRCeWZF?=
 =?utf-8?B?eHkrc3UwWDYzQzJUcGhycWhSWUFaRkZjdzZFay95MVVKQmh4ZENKRFhUcWZJ?=
 =?utf-8?B?bS9kU25uUHVVaDRta0dYNmZsYVlkZHowT2xNanhFZ0Q3MUI3SGJZOXBIazl4?=
 =?utf-8?B?VE1NMytUcWZNSk9xeVNoTkZLYXBYWENiZzBnTWFMMFhyTVRMVnVJelhqbFJo?=
 =?utf-8?B?RjR0eEtVYkhjWnJlUWZBR0hsMWFWTDd2NEhwQnlsRzVrcVFVQ0VrTXp4cFlM?=
 =?utf-8?B?clZ0dHUydE9sMERCNW16YVhpRVZWWWdNWnJZakVqMEJpaCtEdmV6RGo0RnBP?=
 =?utf-8?B?dVR6cjZNU1cxREF3THltVjl0dUtRVm8rSFdjTHFaN01QbmIvV1laUHl6cTlr?=
 =?utf-8?B?VVB3N3pzQk5NTGQzT0w5a3RhOGlmRjFNNTJEUWVHMy9pL1dxQWdrSzMyZm0w?=
 =?utf-8?B?YUJJSTV6LzdwQ0RZSU1HWGxUWVRhemN1ZWNYSjFKSHY0M2hPUnlMTGxOSFFp?=
 =?utf-8?B?dUVDZjc3cUFxY0RPbFpDYll2dTcwY0ZlWEZPSWxTT0Q5czMrb3BLbHRjR05D?=
 =?utf-8?B?cVB0T0x3L3JrQ04rb3ZVYWNoNTJCRjFoYTJZRTJhc0ZpcGZlUlNpSERQc25B?=
 =?utf-8?B?V3JWQnpKR3U5RFZ1VE8zMVJ5VDJiZFdNYmNPcldKQ3ZSY2YzN0N2cGdpWktD?=
 =?utf-8?B?TEdJM3I2RkNERVlqSG5MQThPYlR6anFRS1owdmxlQXl1NEZCcXMySVR6VzFK?=
 =?utf-8?B?eWNyaStPY2dpZUVRSkdVaFlTZUxJV05CU2U5MHFqVXlzMHNoa2ZqNEtDUmNY?=
 =?utf-8?B?V3laQmt5WUJYVmk0UG81cGVlaHJQQUJianNHMnc4bndZeEc2eW8rR3BQVVVF?=
 =?utf-8?B?N3FxVVRJelQ5eTR4bmtBY3dweE4wN2VBeCtTNjM0UWdSbEhjU2hOVTNDRlpX?=
 =?utf-8?B?VHVDS250UWd6RzhWclJSWmhqL0VIQnBNQmtSRkJqVGZ2T215aU1zeWsrS3Fu?=
 =?utf-8?B?SC9BK2JtK25CckRRZWRCbDRiRFF3QVZid1E1RWcwai93UXFrOWVLNEZ3MStm?=
 =?utf-8?B?MkRTUXprYXFnRVN0L3I1L3NaMldXTEtkUGlGUklPMVVhenRBVjFKc1hOdVZu?=
 =?utf-8?B?eXlqOXRDS2ZuS1E2emd4WDluL3hyeEZnaUVVa3JXTzdMOGZTT3ZxZy93UVFl?=
 =?utf-8?B?cWlDQmVwcU9SVG9Ia1FGVVdOOGxsZ2dFemVzNTh2aWFpcjFUSE9JbnZsWEFV?=
 =?utf-8?B?cnpxZ3hzK1BOYXlGQjVtc2N5aW9wdnJ5WnNhcWgwQmRwU1BZYjdtNlE4dlYv?=
 =?utf-8?B?dXB0MDZGK0pSaU9XWExvZDN6bzJHNDkzcHRmMU4rcTU5a3VZaEFvdUZVZU4v?=
 =?utf-8?Q?ESnDCw9PYJlo/B2YjldCSd9MC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356f8752-d649-4af6-9cab-08dd991b2a17
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 10:26:50.5750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWwtqjxC9dz68vI+bGmuIlr2daw9A/fMWewE/n5uSuSvYRirvL5/lGLVTpT+LWHEV6UkSXmlh6p9xVvCSFQf+f81bVw0Yxe5yhYV9Ut/SqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwMy8xMF0gbXRkOiBpbnRlbC1kZzogaW1wbGVtZW50
IGFjY2VzcyBmdW5jdGlvbnMNCj4gDQo+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDA0OjMzOjM4
UE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IEltcGxlbWVudCByZWFkKCks
IGVyYXNlKCkgYW5kIHdyaXRlKCkgZnVuY3Rpb25zLg0KPiANCj4gLi4uDQo+IA0KPiA+ICtfX21h
eWJlX3VudXNlZA0KPiA+ICtzdGF0aWMgc3NpemVfdCBpZGdfd3JpdGUoc3RydWN0IGludGVsX2Rn
X252bSAqbnZtLCB1OCByZWdpb24sDQo+ID4gKwkJCSBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sIGNv
bnN0IHVuc2lnbmVkIGNoYXIgKmJ1ZikNCj4gPiArew0KPiA+ICsJc2l6ZV90IGk7DQo+ID4gKwlz
aXplX3QgbGVuODsNCj4gPiArCXNpemVfdCBsZW40Ow0KPiA+ICsJc2l6ZV90IHRvNDsNCj4gPiAr
CXNpemVfdCB0b19zaGlmdDsNCj4gPiArCXNpemVfdCBsZW5fcyA9IGxlbjsNCj4gPiArCXNzaXpl
X3QgcmV0Ow0KPiA+ICsNCj4gPiArCWlkZ19udm1fc2V0X3JlZ2lvbl9pZChudm0sIHJlZ2lvbik7
DQo+ID4gKw0KPiA+ICsJdG80ID0gQUxJR05fRE9XTih0bywgc2l6ZW9mKHUzMikpOw0KPiA+ICsJ
dG9fc2hpZnQgPSBtaW4oc2l6ZW9mKHUzMikgLSAoKHNpemVfdCl0byAtIHRvNCksIGxlbik7DQo+
ID4gKwlpZiAodG8gLSB0bzQpIHsNCj4gPiArCQlyZXQgPSBpZGdfbnZtX3Jld3JpdGVfcGFydGlh
bChudm0sIHRvNCwgdG8gLSB0bzQsIHRvX3NoaWZ0LA0KPiAodWludDMyX3QgKikmYnVmWzBdKTsN
Cj4gDQo+IEZvcmdvdCB0byBhZGQsIHlvdSdyZSB1c2luZyBib3RoIHVpbnQzMl90IGFuZCB1MzIu
DQo+IFBlcmhhcHMgbWFrZSBpdCBjb25zaXN0ZW50Pw0KPiANClN1cmUsIG1pc3NlZCB0aGlzDQoN
Cj4gPiArCQlpZiAocmV0IDwgMCkNCj4gPiArCQkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwkJ
YnVmICs9IHRvX3NoaWZ0Ow0KPiA+ICsJCXRvICs9IHRvX3NoaWZ0Ow0KPiA+ICsJCWxlbl9zIC09
IHRvX3NoaWZ0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWxlbjggPSBBTElHTl9ET1dOKGxlbl9z
LCBzaXplb2YodTY0KSk7DQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbGVuODsgaSArPSBzaXplb2Yo
dTY0KSkgew0KPiA+ICsJCXU2NCBkYXRhOw0KPiA+ICsNCj4gPiArCQltZW1jcHkoJmRhdGEsICZi
dWZbaV0sIHNpemVvZih1NjQpKTsNCj4gPiArCQlpZGdfbnZtX3dyaXRlNjQobnZtLCB0byArIGks
IGRhdGEpOw0KPiA+ICsJCWlmIChpZGdfbnZtX2Vycm9yKG52bSkpDQo+ID4gKwkJCXJldHVybiAt
RUlPOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWxlbjQgPSBsZW5fcyAtIGxlbjg7DQo+ID4gKwlp
ZiAobGVuNCA+PSBzaXplb2YodTMyKSkgew0KPiA+ICsJCXUzMiBkYXRhOw0KPiA+ICsNCj4gPiAr
CQltZW1jcHkoJmRhdGEsICZidWZbaV0sIHNpemVvZih1MzIpKTsNCj4gPiArCQlpZGdfbnZtX3dy
aXRlMzIobnZtLCB0byArIGksIGRhdGEpOw0KPiA+ICsJCWlmIChpZGdfbnZtX2Vycm9yKG52bSkp
DQo+ID4gKwkJCXJldHVybiAtRUlPOw0KPiA+ICsJCWkgKz0gc2l6ZW9mKHUzMik7DQo+ID4gKwkJ
bGVuNCAtPSBzaXplb2YodTMyKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAobGVuNCA+IDAp
IHsNCj4gPiArCQlyZXQgPSBpZGdfbnZtX3Jld3JpdGVfcGFydGlhbChudm0sIHRvICsgaSwgMCwg
bGVuNCwgKHVpbnQzMl90DQo+ICopJmJ1ZltpXSk7DQo+IA0KPiBEaXR0byAoYW5kIGFsc28gaW4g
YWxsIG90aGVyIHBsYWNlcyBpZiBhbnkpLg0KPiANCj4gPiArCQlpZiAocmV0IDwgMCkNCj4gPiAr
CQkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gbGVuOw0KPiA+ICt9
DQo+IA0KPiBSYWFnDQo=
