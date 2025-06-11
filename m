Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9FFAD52B8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6B510E62F;
	Wed, 11 Jun 2025 10:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRg7UcAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0FA10E62A;
 Wed, 11 Jun 2025 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749639194; x=1781175194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ENKxHrzGnbblJ7vkV1oXf5vnqxzYRz7IpP/TGRC2e6M=;
 b=nRg7UcAtuVCuVWt+oJ3fVGDoHRZykoCy+fyjhQQUL9bUPdPo5gWB8qAV
 RqjNVR9BmgiviY2AL3yXcwUyLwx2Pjg31Cvh98XCG4BXjLBPvwmuFKiMv
 YiVzyqzo8ClaODPdjA64U/Qr3R9F6RvnAOaCvvIIdRk502HWoNoBH4IRh
 fwKcvCpOCsN+8eEy1cqZ1gS2sa6LsyqiqZyavEzmQBnCqm8CihpJ8ju5g
 EEOEnw5iuVOtdc5o42X1D6xs6CXMgeYXINNaObiPWCibsBLFH6Kclo6Mw
 qdqgZL33cyLRequBRPwbCFI5wFyJsDXZ9JSClBNcK87AgJAB1SNExPcTR Q==;
X-CSE-ConnectionGUID: 2XxFq7P/RpaAbc8SKPgUDA==
X-CSE-MsgGUID: efAJprlVRay0kX0+0qAYRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63186392"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63186392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:53:13 -0700
X-CSE-ConnectionGUID: o6+1R8IlTkShIfO34Arz0A==
X-CSE-MsgGUID: HkQgyz+qSf+5S9PEhBeh5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147074701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:53:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:53:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 03:53:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eaj24CXuHomsPy1x/X27OYYUFk1ivzbZcOxQi76NT4tj1ABlsjS/dnzw28N/gj6kYwgt6WTspyGzWjafePCni0/z8k820wDHfUGgC4grllgpcdiJGHfUyjlK3Mf2qjJRcxyXqbttroxjjTqHnr+WHXaQJmo+RtFZenJrOVfQ07TVU71O7YwPsa0atYhlUzHzCr3YFVRe8m6kch268I9Q0zGjVGPasU+cOEmvWbChjiavxsfxvlDB+HfQSK6iUwolztfZsRrI2MWT9Kh/euRD9weAgVHgzOfDc80IgwIRqkJxCmFD4mAFSXR+Vlp4sQXmwKALBHEHkqPSbocqsXv0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFQ2sEyEqiHUdtQbxFFh8g2eXJyBmVU5zCjANesWdRQ=;
 b=e/m4K4qCxphXc3ANIRWqY4QqH9Q4HA3UX4ye3Lc6tZExHML4pjSInay7KUnOAgem9ZZ0sdyccDI2I1+pie4cw0NncOsnBfADgl1HcU7jpLlIkDsK9DTBzx5NPN1RyH6QObjK4+v7RjPKWnqmG/yqssXBaDBDaQ42I7em3jeApu6orzVKiIgzCP87FYQAZiWgDZV/wpYdTZMUfmD25gCn0M7WxBNpBrk1FZ+ZYNp25TXcQVCUSuI2DNjXNuZx3+jQ9SqKvr1/8rBuU/U+gQYGt5fSjfF8YQ/fi/L1PbY5VRTZuhc3yA6OkEheNojntMK4g+Gax0oqABRqlziz/ueT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 10:52:49 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:52:49 +0000
Date: Wed, 11 Jun 2025 10:52:36 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v14 5/9] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
Message-ID: <ykondzwgaqboegfuv27en5r6nnnrk3q3s5eu47tz2zu3dnpslv@ciw32vfj2vwc>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
 <20250610-reftrack-dbgfs-v14-5-efb532861428@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250610-reftrack-dbgfs-v14-5-efb532861428@kernel.org>
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MN0PR11MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b31704-1dc4-40a4-7c30-08dda8d61b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWt0Uk1pK0dQRXMzdVR3b2c1QmJyZkdMazV6bnFaeGZOdnJwUnNNYXNkR2VE?=
 =?utf-8?B?MzJLQUlMZkt1Q3RGQTJtWDk5eGQxOVUyd0t2M2lQNW92VHlGc3FWL3YwV3M0?=
 =?utf-8?B?aGNBL2VGQytKaWJwV0lUL25VQ3R6REtSMWZSY1dmMUlyUGJWeGt3OThBVVV0?=
 =?utf-8?B?emd5MXpTSzJSZ09WakFSek04S1puNHB5RWtWS202TEdQbVd3Q1VOSGE3K0JH?=
 =?utf-8?B?dkIrclVLZ0NIOTdnbTY2YU05bk92YS8xTVVybitxMWp2WFRJaGplYWIxK2sw?=
 =?utf-8?B?S01xMklGWC94TmlGSTFYdUI3WTBzOU92N240Z3ZScTF5Q010SnZnS3BnN3la?=
 =?utf-8?B?V0hSeTBHc1RXOWZJZWFPSVlSK3VUVWV0QVRpWXduSmpjdWlpMnc0TTBrdW5L?=
 =?utf-8?B?WG9JTTVYNnhEOUExU09uMVpNY1dXa0ttMzJLdkwyWFZzVStOUnUvRk1yLzJN?=
 =?utf-8?B?RmpRUThSalhzT2hnam1xOUlHcFZGVHpsbDBrTCsvOVpiSXNLRnBpazRDNkJK?=
 =?utf-8?B?eUxCZ3BMZ0padDlJY0UvUWEzZW1BUER5d3c2OCtLb2lDWXVQUU5TSVZTOUh2?=
 =?utf-8?B?aWpCRVRLcWt6TDRZaGFEb3ZSMjc5NU1sZWlxY21zVDVEcmZCL0d2Z3ZXRkox?=
 =?utf-8?B?SkFOTHhHYm1wQ05aVnlpS2pXTEtXa1Q0MGdKOWlSODdyakg1LytTZThjYnY5?=
 =?utf-8?B?bVg1c0UxVUJTWFBoTGNWK0drbVJOTS9BWTMxSENOM2h6Uk91M2hYdXdFNkJx?=
 =?utf-8?B?aUNGVGYyclR1aWw0RDhzLzdsNjhEYVkrdUVPNlgzakxyaGY3NllHWFhESXZ4?=
 =?utf-8?B?M0QxWlZEVjRmVHVsaXVxQkgvVTNiVzJuRGZYM3Z3V09PaTVVQXROZ0tYMUxq?=
 =?utf-8?B?K3FESmdDZ25IVjVNN0FtRlRuRkFEdTJpcSsvMEUxV3hHZU9zSlZBMEE0b3JI?=
 =?utf-8?B?YkhJc2lYU3crTjFUWDJuUGJSY1hSYTJhVlh2UXlIR1RxcXlJd3YzSDdnZ01U?=
 =?utf-8?B?eU9zMTJUU3BLZnhES3VWSkliZG1OZGxiYTFWbC82VG94RldPWFMrbXp5Mzd1?=
 =?utf-8?B?NG11NVMxM0hEY1FTODJ6MUZ5eXpmNUNsU0V6YVFFdGkxSkpKYytoTjlwVWpM?=
 =?utf-8?B?U0ZNVTZnMGUySU1ERzhHY0d0OFdUUURvc095ZG83QUdsRXBMdnpkWDFtNXJB?=
 =?utf-8?B?UkFpU1g4Zy90ZkNJM3VSNWRsNmhFRW12Wlp0a0FSekJ6VVlib3ZjSUwwbTJW?=
 =?utf-8?B?S1VWQjFNaWRCb3FOdmtDdVdrZ0Y4S1VRRDAxbjBXb0JwTHkvSVpIWlk5dlJF?=
 =?utf-8?B?c1lDVXkyaUE0VHQwWWNMT0k3dXA3TFZjNHJTSjNqSnRTNWYyeWo4WnR3cUFh?=
 =?utf-8?B?Q2diWXhiM2N6TTYvS3VNdndGY1g3RmtKNmY0TUNJMFR5MGNnUG81UHdST3VK?=
 =?utf-8?B?bmFlQ0VqblNXRW44ZmYwOVV1SHlhYnpMV1VhYnJwSTdoYWswTllxSnE5UFNm?=
 =?utf-8?B?YUsrdEVpVitERDd2c3RwZFFBU0FMeWF5YXZMTmQyVFdxditUZ2w3Qi9BRGI0?=
 =?utf-8?B?Nnd2d2dBZXlNLzd5V2ZHcFBQTklvMnFZWC9CaGtmVGZOd0FZVTNVWVE2TnN2?=
 =?utf-8?B?UGRBaXFrbUg4VHc3Mkt1b1VvZDFtd21uc1B6bytSMUZrVWxXd0ZLY2Z4dzJ0?=
 =?utf-8?B?WjJkK1dSVUp2N0dJdzdjbmh3eGMwUldjdFR2OWpjNS9XMkVnaUtQejFtVGp5?=
 =?utf-8?B?amFaQ3AyNXNZZUgzM3ZRb2liWG5zdy9xSW5ia3d6WEJ2Nm4yVDkyMEpHOU1v?=
 =?utf-8?B?d2d3VXMzRWtsMUI0a0dkOWJaL0dKbWNpU2VBN3YrcVNVdG95K240Y3dRY3c1?=
 =?utf-8?B?bk9GbWM5S0RJVWZteFFRWjk5L3FMUzBJYnBHQkhmSXF2TDNYZy9laW5NSzhY?=
 =?utf-8?Q?8RaarIjXD9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRVanAvWWJ3Z2JWVVo4aDdNWDdjR2tVeXphd2lGUCsxRGRoclpNaFZjS1hG?=
 =?utf-8?B?R0V1enRDMHhMczY2NjIyNWpaaGM2dUE3cXFBSW1UUlpJYmZxSmJoTi9zWWZl?=
 =?utf-8?B?T2pxZTV6YlcvWHlNb3ZDSmtCdkZrZjRPUVBCc0RKY0VxUm9wcEtaNXFrOXpP?=
 =?utf-8?B?bi9hTTNvWGdtTGpPYkpuY0xvZ2pwNDRBL0FBejVvWUNheEJHOWEzbXF1bVdv?=
 =?utf-8?B?TGxmTlhDQ1Y2V3NEbHZZOGh6aVFMMFRsL29SazM1NlJhM1plN0NZOXhMbWlx?=
 =?utf-8?B?TERqN1RzUml5bjBoUUNDczViVDZabkg4SDJsTkFSS0puZTFQbEdzNDE4TFFu?=
 =?utf-8?B?bEhQdzFmWmxSenpuQVhxa252MVliQXJvNkRvUUx5V3NMWlhkV0ZWaVF0UVkv?=
 =?utf-8?B?dXk4cE54ejcvNmRCN2cwSnVKTCs1OGUzZlI1M3dCa2hIOVlXSjlkck5HbDRt?=
 =?utf-8?B?eEdUdVdXQmNrZ0E0TUN4dGswT1NDVU5uZDl5ZVB4SlVxbW5IcHZ3eTlpMit2?=
 =?utf-8?B?VTNzVHRKaU4zNlc4NWNZUzVoNnFVYjdxZ0JWaXlpbTNCTW5lL3NzUm5acEpr?=
 =?utf-8?B?Rllnem90QnJhejRVRHFkSU5iSWgyNmpwQy9mK2JCM3pHMmp2VWJ5cU1vNXNs?=
 =?utf-8?B?N2RGS29uWERBNGFFb25BczRJcHErS0NzT2tPMGJ6U0hiaGVKaHgycy9mNDhj?=
 =?utf-8?B?cmlzcmI0OWlZc1BydUhDNDB6ZWZoOVZqVUlRQlRtVm9xL1ZtR2lQUFhLT3F2?=
 =?utf-8?B?c1N0QnZuZmJwRkNkMW5IcmNYOWNPRUVDYitwNzlzd0E0SkY2OGU2VUVWSkFE?=
 =?utf-8?B?N3BORTN2aFF2SmMwYVV0ejRIVG1oZVFmYlJ5ZC9ONHZOdzcycUJjY3FOOVUy?=
 =?utf-8?B?UFNockNYVnRNaDhtZWR6RUFGbjh2ejlWL0ZiVEVlQmhydXJJVHFQeldWQlhT?=
 =?utf-8?B?WWlTLzJ0RzErcGxiOVVlZ3NJUzQyekFNRXFoQld2NGZIbHNpdXBiV1NqUmYz?=
 =?utf-8?B?MnhhWHBBOVlHeXJNajFnbXB3UkdJQ2ZDMU45NlVZTTJOajhpRTEyNGFGUjY2?=
 =?utf-8?B?NGh4Nk1oZFVCMmlhMjlNQmE5WWx2dnhrUFhGSjVVYUdlVE1SZlNxdUg2bGdG?=
 =?utf-8?B?Wm5FOEROUkl3QkZmYjFCM3pRODJ6bTQ4SGhwSWdsMUJRN1hGdkdzWlV1OW5S?=
 =?utf-8?B?L3pzeW9XMzFtRGtKS09wUXE3L1I1UURrQnF1SEFjdWI4M3dWMTVmS1JGdk9j?=
 =?utf-8?B?blNwaGV1azdGT0phK2J4aHN4K0o4TDEwcE9SNWdmUVVYNk9LUm9XWEVOdmk5?=
 =?utf-8?B?YXNJbFdqcjhicUw5T0xEL3NGcDZqQ0dtc09jWWFmajRvc3l6bmNpTFdSVTl0?=
 =?utf-8?B?Wkpkc3R4ZmpSa0pvVFVWMDBqdHI1SEF3eEhYT1grRC8xVDE2c1A0dzJROE9Q?=
 =?utf-8?B?RmpwNHhqYUExUlFqc0FUdzg4YW9CZmFCdjhIekJUU1RaN3YyOGJFS2lNM3ZQ?=
 =?utf-8?B?MTJDSkdVZys0cWZ5NU93VVZjWGxIVjlxRnZML3V2VlhEdGdKcEdjelFaREpW?=
 =?utf-8?B?cHhkTVRFUEV4RzU4L3Y4V1lRbWFMNms0UTc2TXJqWnJrUjNjZzdpWkFVYVMv?=
 =?utf-8?B?aXJmazJvUU9jKzIrVk4rRE8zc2JaZW9tQnV2MjBBSWwxenpWYWt2RGxmY05D?=
 =?utf-8?B?TkZieFVmTUQ4N09SOGp4U2g5cmxMcUVjYzI5bnI2SkhTNTFyNnpMWmJBd3NQ?=
 =?utf-8?B?UTRTMEVtTU5qTXBJc3JhZjErNHI0OUltaXVTeUdTNWxiTXljaitWTlh6TlFj?=
 =?utf-8?B?TktXbkJNR1RKckMzNVp0Z3RXcVgxYk9YdEczU0ZBTFNjWnpGckp2MzZkVUtm?=
 =?utf-8?B?UWtPb2tmN3hkRjJBTVJkb3M4MW9wQ1IzREZHOUNmNmFIakxtMnh2OGRlajNK?=
 =?utf-8?B?UUtOa1FCbUlNWXIydXZKYWRnZDVyWkMzMzlLbTlZanV3UmNyYy92V3piUHBn?=
 =?utf-8?B?Yk1CRmhBUFJYZmhBOXMzTlpoZHZjT3dKQWp1dkFySTZaYUVYRlR4ZTdQbEs3?=
 =?utf-8?B?d2ZTd2lHRERTbWVNemtLeHlyMzBrUTFDWG4vcDRsY2Yrc2hsNWRCS1E4SGM0?=
 =?utf-8?B?Zmc2b0k3TWxFN3pxZUNwaUFxZUUrQnlTQ0FHTUNpdEtJSUhJdzZHOEVQdU9w?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b31704-1dc4-40a4-7c30-08dda8d61b1c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:52:49.0979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8sYtlu2LuA7H6+N3QHCONDEHbE/xP1wVnR5mirkhKaBrpiIWaVtKSkcy/F5pH9/Qo5rPO53W2QT8Vg+9oiVV7jxpRI3HpHTGV6ryz4EPbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
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

Hi Jeff,

> Allow pr_ostream to also output directly to a seq_file without an
> intermediate buffer. The first caller of +ref_tracker_dir_seq_print()
> will come in a later patch, so mark that __maybe_unused for now. That
> designation will be removed once it is used.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
