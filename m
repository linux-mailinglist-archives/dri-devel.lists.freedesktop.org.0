Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55326BE2A5E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B5810E9A3;
	Thu, 16 Oct 2025 10:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMqCFGtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A8F10E99C;
 Thu, 16 Oct 2025 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760609290; x=1792145290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uLuSgHBrmO7iZTMM82trhm3rjmWephgEmidj8HVS02I=;
 b=GMqCFGtUoUvCgUQH8Fh8NAsl235az1d9P/j2neKkxgnUkqDdgOsqnK/z
 W29R8jwcfHttGQdWtwAITxE2rV3RUnA5XKRh5j0yoLToYtX4gbYle71oZ
 1Ff8Vqs/eMZsyfbnpTt6jH4nlzqhGuaxriysndffrF5Y+6pqMjeJ5OrDZ
 469ahnKMcKV+j7wG34SxBh9GZ+eEgXIdiCDa4Lon70KtXxJ6oshuT0xaZ
 AP9CxSNpfY8B/wqtBnSpObilVoi7vJj2t/rOF1uV83YC4Y9gtsXEfRBEA
 z8wZaM3TbuG53wOf6TB/V1VaRwoUjxjUE6dxnM+10IBhhK6qhhT5Wag2l A==;
X-CSE-ConnectionGUID: hLjnkd1yQYaDCZAqGOqhYQ==
X-CSE-MsgGUID: EE7f6qWvSL27FEdmElyD2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62945811"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62945811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:08:10 -0700
X-CSE-ConnectionGUID: OFckHjQsQPKK1uS9JXuNyg==
X-CSE-MsgGUID: VlzPo3y7T3ysd5Xg1X1BUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="213375194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:08:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 03:08:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 03:08:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 03:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYqSPV0KR7OMpQyNF+HpsJqYpQPxezHNoGqPpK3zxEU1Gn9aEB52OuJB7s8BUJ88ZZ2A0333Mge0ZuQaDQDVFdLZ53OPwLu/Jqor2Qbtu/xGaf3qpLfK/m48ebSEVo9PS7p6EoDil9ByJ+b+vhMyBdt2f5YWYIt5rN/yG+E6i88olmaUFTkZ962+dsegcGr6iMCXQrcvKfvy2pRAchKJyGGJPDgPjJcRbeW1KC6a41X53dZ9hGhhswsHlInJI8qEJu+Cc/blXm2odXXBeQaq4jtl+LWjap+i/vpzkygAmfxTQSJiiIg4VygEOcZjWwRZKqieTxoAcNjz3yI71xl4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLuSgHBrmO7iZTMM82trhm3rjmWephgEmidj8HVS02I=;
 b=sI3V1CHi/wh1B4i4d6b8Ny38cS9e42M6t17HPWcSRecLQXyCfKDwX6FaDMWsKmClfHEcQsJL0RKNBJ2JfQkGjCS3fIjz+b8F0bA6FCc3m8dk8uIrvpgB4e95wBoLYpr7A0zQM5xUZG4rS4hdtSsCE2IwUP8W5exso0gTYOOImOB3ctThs7L0VcQduVyJmlwvCero+bvA2TUWvuhfhrNI6M36u9M+EkeCpvUoUBjBcDAF8gi0SXg1W55D9dAKAZtJ0QYkTDHktg+5I4mbVhNLB4Z+QcFFP8idJbVEK3A3rSkA22fz+3vlIlOKKX4L6hG/Io4YJ/6Hb+I+3lkIFiMeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Thu, 16 Oct 2025 10:08:06 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 10:08:05 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: RE: [PATCH] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
Thread-Topic: [PATCH] mei: intel_lb_mei_interface.h: mark struct member with
 kernel-doc
Thread-Index: AQHcPlFmK1Fbevk0Cki503RBNWWxNbTEhylQ
Date: Thu, 16 Oct 2025 10:08:05 +0000
Message-ID: <IA3PR11MB898737E5BCC26C83D5470439D0E9A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251016035942.1148176-1-rdunlap@infradead.org>
In-Reply-To: <20251016035942.1148176-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DS7PR11MB7929:EE_
x-ms-office365-filtering-correlation-id: 09aece5b-dd57-4891-2169-08de0c9be670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YXJYQTFEeW5BZnJPNy9YZnVudnJGcC90SDg4U090N3I2cmtvNmR4eC9lczBK?=
 =?utf-8?B?bWxaN2RPUG9iVUF5cW1ackNiSEdJdGxkYmY3cG1ZVXRIUGl1cVFOMDBUK3NK?=
 =?utf-8?B?OW5ZTzhBa1paUUtKYUN6Y2tVOXI0U2g1RTVZeVJmSWJVVktyK0ptMXhxb1dP?=
 =?utf-8?B?bHJlQ1lPSkJUYTlHVXVic0pmODlRKzVQaysyS0ZvK3diTG5lQThKSUhqZjJo?=
 =?utf-8?B?L1RIaVlUb01jb0IrTlpDKzJROU9xb2crR3RMbHM4N0s4dUVmbWhRbExIUmxt?=
 =?utf-8?B?czJvb20ydlRkNklydEp2bTdDa1p1QXpPdHdJRzkrRlpDUGdSdkJPL0w5S1VI?=
 =?utf-8?B?Q1ozbmRvQzlheS84QTBXWHRNS1RRdlFTVnUreFV3d2IzbXkrbGRiSm5acDZ2?=
 =?utf-8?B?SnB1SUdZc3U1VUJTSGVvWHB6dlRaVnR0a1djaldPUFp0VkkwZW95MXg5LzB6?=
 =?utf-8?B?OGNBb3hwQ2l0YUtNeGszelo0VlRMSUJsangyMUdqdi9wVXBjemZCaVRRaUov?=
 =?utf-8?B?Ry81aEM2eTJQYmZNQVdnN3RMRFhaNWlXNVYrL01SYWNmSHBzSFIyQ3lrV1M5?=
 =?utf-8?B?RW9WRU1jNEw0VUp3QmZIUWVqTklMN3cyQWgvYWt5T3BFL3ZaZlBsVFphNkxx?=
 =?utf-8?B?dmhlM0xJTmtIaGJKSHJsR1lwVjFYbE1GRjdGUldIaDcwSjJsSU1OQUlNWFBo?=
 =?utf-8?B?clpoVDlTUjIwSGJvV0JDdHhCU3lIU2FWUEJUb2JCdzB0WFpYVnFXRzk0QU12?=
 =?utf-8?B?b0hWeW1TUG5wOUJPNEI4Y3VETkdrV0VRSHBtcHVGVVR0RjI5Zm1QZlRHdEUv?=
 =?utf-8?B?enRXcXpWUEVNeTNwZVR3NGt2L0Q4YWV1TnpzdnBvUUpaVm5zbnBrK25rL0po?=
 =?utf-8?B?cHNyRkl0VzRJaUUzUEpvcUFBU0t6eWRnVkRTbXhMMXptSlFzUmhKRXlvME45?=
 =?utf-8?B?bm54UHlZVlB2WFhjdEF4WmJuRnhNTy9PVmVybUJ6Njd3WHYvb1d4NWZCV3dW?=
 =?utf-8?B?ZXVZOHZ0b3Z0QnlJVTNOMVUxSjQzc3RON2IrK0RIam8yU3pKa1pvdkR0T0du?=
 =?utf-8?B?b1kxS2NXT1BCRWNJMlpObXp0QUxkV1l2VVpRaXlLMG5YUUtWMjRvcm43QjA3?=
 =?utf-8?B?VkR4SXNqbktDU0Jzb2dLRGpqSkkwaTArNlJOTU1VUXpaVWd2RC9XbG0vU1hV?=
 =?utf-8?B?d3kzRExZYUJxeHNhano2RmdMaHRkZjlBemZsOVFNZ3dEWURFbm95T2k2eXBO?=
 =?utf-8?B?Z2VZZjUzYWR3ZWRQeERMUEFzVU9ocU5IaHJTdWN4QUNZUTR5b2RSYWhLTlNO?=
 =?utf-8?B?UzlmSlV5UkhFMml4UVNlZnVaVlJ6OFQxMlJLeUN3UlJpcloycEVxaGgyUFdj?=
 =?utf-8?B?L2U4ZTRmc0VLQlZSL1FVRG55VVczU0wzdE1sT2lueWE1RitJUktIdWZMbS8v?=
 =?utf-8?B?RlQ5M1VhY1hhVnVRdmRlK2xUZEFrRVFod3A1cG5qVitjemkvUFpuYklnTDYr?=
 =?utf-8?B?UnZhbXo3R3Zra3cvbDNsL3k5eXhLNHlETmlyYys0OG54eStLZXFEMDFDdS9P?=
 =?utf-8?B?cUR2blVqbU1XckhQNXNzM3hIWDlSeElyMmExQUc2WjljYTRNWlJYV3RHZVAz?=
 =?utf-8?B?dFZZZHFaN2dLdDZrYkFKakJSZ0RST2h3OEg5bWhoMXlxNnBNT1JNL3BSWnJv?=
 =?utf-8?B?cjVTS0tKdHZSRTAzZXRqM1Y5N1NxWkFjWUhYSmpMVDE0aEdFR3AzTC9ibSs5?=
 =?utf-8?B?Y0xwSXlqZ0JwbGw2RnZpNGh6VjJnUnN4YUpZa25lQnFpRktQNmx6UnFscnJt?=
 =?utf-8?B?djFMNC9neEdPSTNndUtnakJtN0hsb09pN0pZdU5yNXJ4b0Rmd1BnSTN0alE1?=
 =?utf-8?B?WTNnVm9ZY25KZGtIVFJSRzJUNW01azhjOE5EZ3RaU2E5WHNDQlBhWGJKZDhK?=
 =?utf-8?B?Ty9wS3M3a2d3WUpSenk5QkZQMnMzUHcxMU8rVXpnaHdwMUFra2JjYVUrYkhO?=
 =?utf-8?B?ZStEMW9FbVNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1BVeXVGNXRFVTBocFR4aXNIQy9GaFFFMk5OaDE2TjZFY1ZmcU0zS2dBbGlo?=
 =?utf-8?B?QTdFU21ORWdYSEdmK2k3WUVlNEwvT3EzbzhqcEhmajRobE1NZ0xPUXNEK0w3?=
 =?utf-8?B?ei9nSERyM0N5M0swNWpJcU5TdHFVd2tPR3BDNStVWWRwbmNyYWE1Z1o5N3I2?=
 =?utf-8?B?Ly8xKzdhblphZVZmR1NzQllMTzBMdC9rU2ZhRzVMaUh6dGFRRWxIMmVSZFlV?=
 =?utf-8?B?Ti9EbmtEYWxxNXQwcTV6Z0IxRWR2Myt0MHFvSFdpWUZGZEtKK2NrWjBzTTQy?=
 =?utf-8?B?T252UFF5Y3RMNWZzNmp2QTdkVDlPZ2VCUGFLU0RNSEQyNW1WdWFVaDdnWThD?=
 =?utf-8?B?d1Arb0VrTW4zYTV2MjdSU2Z5Slh3aWhtODZCaitxb21oQjdnakd1S3hmUW53?=
 =?utf-8?B?QXBxUXM1c0UybEVPTDJVMVgyY05xeXVJT0tNUUM5SXRIcTdFUnV1QjlPaEdI?=
 =?utf-8?B?TlJQTUxhMi9zdnBqa1hEYXplVjVHa0hKTWdmcU83cXVLVGI3N0d1NmxsNVFK?=
 =?utf-8?B?UjJEMjJvc1RqRE53dXAzdmI3UEROTUZxdU5hK29vekpPdXErc2VDM2Rkd0Nt?=
 =?utf-8?B?YjhTU0FNN0EvVWFzTnVBaG9tYjY4MkI1eGgxOW4rNGRYeUNLYmxndnh3SUYx?=
 =?utf-8?B?R0tvWDhLbHl2Wk1yVE5VaWNFVEI0eGRKc0xHNUp5R3pxRGxvRmlhY2tzdzN6?=
 =?utf-8?B?WTErWGRQa3dpR3VZSlZhemhRaGpiZ08yVE5DUEppYnFCRnFTRFA5ODdHMHNX?=
 =?utf-8?B?UkxhMlp5MnJOQzV5QTl6d1hzT1hjN0F6Vlc5bituRkxrTVN3NHBhc3V4WS81?=
 =?utf-8?B?allVaVE3c2s1VTJEUlJMZU54VjViNEtrNUZCcGg0ekE3K0dPUzJ4TGlyV1BG?=
 =?utf-8?B?cS81RjJLM0cxMnZzWU03VUh0Rzc0bXJ3d1NEUUZkK1diS1hoRTNlamcvS0Iv?=
 =?utf-8?B?S0MxWUpIaWl6bGw3QS9HVmlCQVA4Mk5pWFFXMmhaWnNaNjhNeEZwVk1qNnFU?=
 =?utf-8?B?M09mVzN2elhFTTROZFpicVpVbHdtYnRnenR2b3lXNVBWWHNzTG1IeHR5OXE2?=
 =?utf-8?B?eDJrZVpWcGVkMGx0dm84UUFuM05wN0JFMEdmWUkvb05WdG9uV2RlUC9ra0d6?=
 =?utf-8?B?cHEzNUhVSXROckQzTXJWUjdIcFdTSi9valJoblF1QzBhNmw3d0VEb2dwMWdM?=
 =?utf-8?B?VDFQVHVuRTc3Z2g0eXY3Z240ZHQ1b2paUEZRTVJJbndsUTRtWkVHWWN0TVJO?=
 =?utf-8?B?TlRWMTZsYmlYTTQ3bFh2dWNtK0IrZTlTRnNtV0tsSmhYZ2lBNXFHdHIxWkNJ?=
 =?utf-8?B?L2VMZ0l1SXl2SWdGdXBwWmw4YXlRWlJUUy9rZGF3UTdvaGp1RDM5eVVLM29X?=
 =?utf-8?B?QVdZeUdGVXFRUUNvR0Z0TG5nY1RvTzkweXdFZDhDemRKbmFvS3EzdkhNM2tM?=
 =?utf-8?B?aWJqWGdibEt4RFBJSVAwK3F4ZysrTkVZZVBuVk1nWFdSQlNOeHBhclpmMmIw?=
 =?utf-8?B?SEFCOGtlQ1dhaUc1TjNwV1BLNXlnOVJsWnN6UnoxbVpaNEpJSGZKUHhFVUlI?=
 =?utf-8?B?YVhvVUJNZERiVjI0b1hRVVRkK0NMdTVCWE4xWFpJb1ZjamMzS01leHFUL3g4?=
 =?utf-8?B?aVJ0bG9zdXRhZXBjWTFKNzJ4OERiSnkzaEFXeW5ITExBTmcvVXlxV1piZWZU?=
 =?utf-8?B?MWRoNmFJd1luUms3Zm10dmtmOC8wRWtqUm9qZkQ1dng5MDFMc0d4ekJKQkJM?=
 =?utf-8?B?NkZqcE5hd05DOHQzcG1rQlNFOVJOMVlQRm5QUUJwUExKcEFrdFpXL3MyRDJw?=
 =?utf-8?B?dUcwL2NOZUdoS01UdEF1VnRENnNqTG5oNEhoay9QeXpPWGlJbEdndzJnWndp?=
 =?utf-8?B?QXp2RmIvTTlpRStEVTdQNVpRMnRqZzllMUxNSzU5VTNSN3NZcGQ2N1JnM05E?=
 =?utf-8?B?bThhbnQ4WERtTmVrVnZhTUVPWlpjenNZOGwxdVZ5RHpVanJXQUt6Zm4zVUF0?=
 =?utf-8?B?WDFiVFRzMG5BdTYyQWtxY2xaUlU3UjFOQk9MYkNPSStKZVgwZ3BDVHdHOVk0?=
 =?utf-8?B?Y1ZVZnlZSEszQ0tBRG1KL29XR0hBempjdndmaDJzcCtCTWl5WGNtUjVPVGVJ?=
 =?utf-8?Q?vYdfQNC8h34gi4CA80Aw0lqGP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09aece5b-dd57-4891-2169-08de0c9be670
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 10:08:05.8531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lwIwpD68EbBoyjHlX9xfojs0lv/3SMoeuw1hIskLkxtLLdE9xyyzKrsNn4d/HiJjcnsprh7sgCKrNmWGTRocQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxpbnRlbC14
ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFJhbmR5DQo+IER1
bmxhcA0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxNiwgMjAyNSA5OjMwIEFNDQo+IFRvOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz47IFVzeXNraW4sIEFsZXhhbmRlcg0KPiA8YWxleGFuZGVyLnVzeXNr
aW5AaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
PjsNCj4gSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IFZpdmksIFJv
ZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPiBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBKb29uYXMgTGFodGluZW4NCj4gPGpvb25h
cy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+OyBUdnJ0a28gVXJzdWxpbiA8dHVyc3VsaW5AdXJz
dWxpbi5uZXQ+OyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYXZpZCBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwuY29t
PjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIG1l
aTogaW50ZWxfbGJfbWVpX2ludGVyZmFjZS5oOiBtYXJrIHN0cnVjdCBtZW1iZXIgd2l0aCBrZXJu
ZWwtDQo+IGRvYw0KPiANCj4gVXNlIGNvcnJlY3Qga2VybmVsLWRvYyBub3RhdGlvbiB0byBwcmV2
ZW50IDMga2VybmVsLWRvYyB3YXJuaW5ncy4NCj4gQHB1c2hfcGF5bG9hZCBpcyBhIHN0cnVjdCBt
ZW1iZXIgaGVyZSwgbm90IGEgZnVuY3Rpb24sIHNvIHVzZSAnQCcNCj4gYW5kICc6JyBpbiBpdHMg
ZGVzY3JpcHRpb24uDQo+IA0KPiBXYXJuaW5nOiBpbnRlbF9sYl9tZWlfaW50ZXJmYWNlLmg6NTUg
SW5jb3JyZWN0IHVzZSBvZiBrZXJuZWwtZG9jIGZvcm1hdDogICAgICAgICAgKg0KPiBwdXNoX3Bh
eWxvYWQgLSBTZW5kcyBhIHBheWxvYWQgdG8gdGhlIGF1dGhlbnRpY2F0aW9uIGZpcm13YXJlDQo+
IFdhcm5pbmc6IGludGVsX2xiX21laV9pbnRlcmZhY2UuaDo2NyBJbnZhbGlkIHBhcmFtOiAqIEBk
ZXY6IERldmljZSBzdHJ1Y3QNCj4gY29ycmVzcG9uZGluZyB0byB0aGUgbWVpIGRldmljZSAqIEB0
eXBlOiBQYXlsb2FkIHR5cGUgKHNlZSAmZW51bQ0KPiBpbnRlbF9sYl90eXBlKSAqIEBmbGFnczog
UGF5bG9hZCBmbGFncyBiaXRtYXAgKGUuZy4NCj4gJUlOVEVMX0xCX0ZMQUdTX0lTX1BFUlNJU1RF
TlQpICogQHBheWxvYWQ6IFBvaW50ZXIgdG8gcGF5bG9hZCBidWZmZXIgKg0KPiBAcGF5bG9hZF9z
aXplOiBQYXlsb2FkIGJ1ZmZlciBzaXplIGluIGJ5dGVzICogKiBSZXR1cm46IDAgc3VjY2Vzcywg
bmVnYXRpdmUgZXJybm8NCj4gdmFsdWUgb24gdHJhbnNwb3J0IGZhaWx1cmUsICogICAgICAgICBw
b3NpdGl2ZSBzdGF0dXMgcmV0dXJuZWQgYnkgZmlybXdhcmUgKi8gaW50DQo+ICgqcHVzaF9wYXls
b2FkKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiB0eXBlLCB1MzIgZmxhZ3MsIGNvbnN0IHZvaWQg
KnBheWxvYWQsDQo+IHNpemVfdCBwYXlsb2FkX3NpemUpDQo+IFdhcm5pbmc6IGludGVsX2xiX21l
aV9pbnRlcmZhY2UuaDo2NyBzdHJ1Y3QgbWVtYmVyICcqIEBkZXY6IERldmljZSBzdHJ1Y3QNCj4g
Y29ycmVzcG9uZGluZyB0byB0aGUgbWVpIGRldmljZSAqIEB0eXBlOiBQYXlsb2FkIHR5cGUgKHNl
ZSAmZW51bQ0KPiBpbnRlbF9sYl90eXBlJyBub3QgZGVzY3JpYmVkIGluICdpbnRlbF9sYl9jb21w
b25lbnRfb3BzJw0KPiANCg0KQSBzbWFsbCBjaGVja3BhdGNoIHdhcm5pbmcgbmVlZHMgdG8gYmUg
Zml4ZWQgaGVyZS4NCk90aGVyd2lzZSwgcGF0Y2ggTEdUTS4NCg0KUmV2aWV3ZWQtYnk6IE5pdGlu
IEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQoNCj4gRml4ZXM6IDc0MWVlYWJiN2M3OCAo
Im1laTogbGF0ZV9iaW5kOiBhZGQgbGF0ZSBiaW5kaW5nIGNvbXBvbmVudCBkcml2ZXIiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gLS0t
DQo+IENjOiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0K
PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBW
aXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRo
b21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxq
b29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR1
cnN1bGluQHVyc3VsaW4ubmV0Pg0KPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPg0KPiBDYzogU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xs
LmNoPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiAtLS0NCj4gIGlu
Y2x1ZGUvZHJtL2ludGVsL2ludGVsX2xiX21laV9pbnRlcmZhY2UuaCB8ICAgIDIgKy0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gLS0tIGxp
bnV4LW5leHQtMjAyNTEwMTMub3JpZy9pbmNsdWRlL2RybS9pbnRlbC9pbnRlbF9sYl9tZWlfaW50
ZXJmYWNlLmgNCj4gKysrIGxpbnV4LW5leHQtMjAyNTEwMTMvaW5jbHVkZS9kcm0vaW50ZWwvaW50
ZWxfbGJfbWVpX2ludGVyZmFjZS5oDQo+IEBAIC01Myw3ICs1Myw3IEBAIGVudW0gaW50ZWxfbGJf
c3RhdHVzIHsNCj4gICAqLw0KPiAgc3RydWN0IGludGVsX2xiX2NvbXBvbmVudF9vcHMgew0KPiAg
CS8qKg0KPiAtCSAqIHB1c2hfcGF5bG9hZCAtIFNlbmRzIGEgcGF5bG9hZCB0byB0aGUgYXV0aGVu
dGljYXRpb24gZmlybXdhcmUNCj4gKwkgKiBAcHVzaF9wYXlsb2FkOiBTZW5kcyBhIHBheWxvYWQg
dG8gdGhlIGF1dGhlbnRpY2F0aW9uIGZpcm13YXJlDQo+ICAJICogQGRldjogRGV2aWNlIHN0cnVj
dCBjb3JyZXNwb25kaW5nIHRvIHRoZSBtZWkgZGV2aWNlDQo+ICAJICogQHR5cGU6IFBheWxvYWQg
dHlwZSAoc2VlICZlbnVtIGludGVsX2xiX3R5cGUpDQo+ICAJICogQGZsYWdzOiBQYXlsb2FkIGZs
YWdzIGJpdG1hcCAoZS5nLiAlSU5URUxfTEJfRkxBR1NfSVNfUEVSU0lTVEVOVCkNCg==
