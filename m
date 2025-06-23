Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D4AE4152
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8941B10E115;
	Mon, 23 Jun 2025 12:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwcFP3PK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053610E08C;
 Mon, 23 Jun 2025 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750683495; x=1782219495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m+BTQbWxW3nsfGqitUcfTPMTCnyeTZZ3fuyANKbemlI=;
 b=XwcFP3PKtcGgiaBQDX1uYkRmO0rt+mVec/okiSiueOmzVDNqJML/qdKq
 Qt2sCJDeYhIDXr8N3CPel62440gNhgn1wwYHmo0pOzuIuhC/Ou4fc3DFi
 8AmHMi/pptfAPfpR9BkPL+qCoWWPkULR+qBQWtXNbbO1YJax8U43y9trP
 RqhpNLkRPnGyUY+G62DkEXvu9+QIzzIRms35XzuyfmgMDLCSRvCrRDYG6
 FukbJdmZmlLSsUa+D7CuV5viJTXcmY2Tvjzf+Py4jIALVS//3pPuhQSi7
 +0Fl4fvCqRMreolJJwE7F8rfDVzscUtVES0HyAA86sBHppeBsaFgskvMQ w==;
X-CSE-ConnectionGUID: M397o5BiR3WfM9+z7pOgpg==
X-CSE-MsgGUID: F+RvMxBGT7uYHD5M6WCFUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63948072"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="63948072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:58:14 -0700
X-CSE-ConnectionGUID: wusaevbpTVmZfG5mM6JiAA==
X-CSE-MsgGUID: fn1fp0zMQcKIltGvepNICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182643112"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:58:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 05:58:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 05:58:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 05:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHO518///byu/1kWj/jmaY3SQjkt99EV/vmXhgBArsdP8cyIouUccxmKrWcl0TFeHXECM8cUT/E9t+af99yKV62gKeO88/PC0bhwlRCQEoEGtHYGW+zKz63yVwAnFITgCJHSQWXI+bV03vjJ5DjVjLs733L5NadSGLv5MdSHCDV/jIP97I00HeI1sAp0MRPnSX0HYN4ZMZfccuoKAmVx/Xs44usb/nUGeQ3W9Qv2TWwrLnw8FREVhEQ6bBZcXQO8wx6W4yJPlE1rMkUldA0GVW0nSMh38CkPYaJ1RzxWtdzcrqKxEXO2xqdBU1BZWs3m2JoPufWJW75gFZsV3KqKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxQl4/otKit9G9UbsobDiOKhdfXgWmzwUgRdbbCWFQA=;
 b=zGWHk47p0aLTIts2NlJ/0TlT8viEV7ce4yRqABK0zEbJs0NE/q6POMyfmKkBJwaV4SB6IuS85heVb+NvoUTulX1hFqloQqb0EvZYLJARB2trZT9E6e5/nvIjHNRss5YyCr8f/YK+0JkgSdijAWc4CSnmps+oQvV1JT5T7gRDf+8xc1tDb8vp95AG5ta6deBQLZsxcrTKAtRapOvdjF0Z9Go5twzMltD28Kkq/vIERLKFxkwMdYEWLBqbxvFXzPc4HAlWCdPZ3qxNWfI770V1sMzh/YUP1KhIqHBXul/wqx0JPVrnNONBENOPw5fDnhyLYduJhHNboyJakwl5EAIt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 12:58:11 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:58:11 +0000
Date: Mon, 23 Jun 2025 12:57:58 +0000
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
Subject: Re: [PATCH v15 3/9] ref_tracker: have callers pass output function
 to pr_ostream()
Message-ID: <k3hx66pbtheyfs56jjbsdjotgukwk42vlrdbgbwhsajzx2sjbh@qrd4ms2ihm3n>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
 <20250618-reftrack-dbgfs-v15-3-24fc37ead144@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250618-reftrack-dbgfs-v15-3-24fc37ead144@kernel.org>
X-ClientProxiedBy: VI1PR07CA0246.eurprd07.prod.outlook.com
 (2603:10a6:802:58::49) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: c436d9c8-9913-4b1b-db5c-08ddb2559b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjRuZFl6QUlBcWFacjNrUXliSXh5a2J2cHJLK3ExbG03Rm1pR1E1UUhtUWFi?=
 =?utf-8?B?NnBaTWttdFovQW1qUzJZTjExVHRkRndOdnBTaStCRjJUSTl2VE1ZYS93MjhY?=
 =?utf-8?B?NW9NaGlrZzVnSWY3Q3lUdHF6cnB0dGU2UWpHR051RU9qc21FbTZtZGh3SU96?=
 =?utf-8?B?bjVjVWc3TERFS2RsRUpkRUc3eG51eUhyUklHZi9vU21iNjd3RTdWS21ycFRr?=
 =?utf-8?B?WElGbEh1L3hJR3JKUUFZaGh5L1VZK1R3b1ZZdlh4MFFTMDc0MkdMUUtNeitl?=
 =?utf-8?B?a2xSL0VQS1hkUk40YkxKeVVNTkN6REVTMVZJTllFcjlVOE9qcmJzdmpSUTVh?=
 =?utf-8?B?Ti9za3VVZ2p0aFQ2b3dqTUFSZDRGSVZPbW1PNzl2VlptMFdpeTRmaklJTW04?=
 =?utf-8?B?K2pEZWlNSXNDMzRJejlYTG5lUTdhZE5lcnhQYlBqY2wxWG9WVkxsQzk1NzJa?=
 =?utf-8?B?WFRYcFU0VzhabGh3VlFJcVQ0d3U4QUt1UGtuQ3I5V3ZST0gwMGpOZUZ5VEt0?=
 =?utf-8?B?QTk3WHEvYVhBVFFLQzJKTGVOQk16L2l1a0t2cmxYRmp1VXEyUVQvVjZtR1lx?=
 =?utf-8?B?MnpkYnFTOHM5ekJldWxsVDE5WXA1OE5MMXRzMzMwUUlOWTJUcFpDTm5mbkFN?=
 =?utf-8?B?QmI3TTZVY2FlemNCUEVHaHlVZzdrNHZvUjhGY3J0RnRnNkhTQ0ZPNm5sWEx3?=
 =?utf-8?B?NWFubVB4ZUtUdUI1bU9uRERiMXNFNnl1WkxNY1hzYmd4dUZTVnBCcHMrUFFN?=
 =?utf-8?B?UEp1QnNUMUovdzVJNERCT1hXY1d4Z29GYkdDMlJyMkFQcXp0Y0ZMUFZMV0p3?=
 =?utf-8?B?NjJoY0tnZGwvTUUySVllbmU1VkFnQ29RY2ZXeFJJK2xmOTBjalpGK25LS21U?=
 =?utf-8?B?cEloc3FSUVJUYjRwQkRhN25WNFUzb1cwQVJWR2hlVHNsR21KR3BZdjFCTWVW?=
 =?utf-8?B?NTZQNWQwRE9sZlkxbHloNlg0TzhIdlJpSElMSi9UTFdNU0syaUo5ejV4YlpU?=
 =?utf-8?B?TTFzc0w5V1l0dUtXbEJXTkZiWjVvZXFpZlRueEY3QnV6OXFRMG1nZllpODVM?=
 =?utf-8?B?R2F1bGFRc1NGNG13VlVwVFhQMzA2UjZZc1hSbXlJTHBRZGw3TW5iL01SM05M?=
 =?utf-8?B?LzV5S2NTSWtENW9HQy9yS0dJeTZRNmh6bnB3U284Qnk4SlpQVGFyNSs2cGpF?=
 =?utf-8?B?V0ptWnF2a3JNNjEyTzQ4SjdwdmdNaGdPUWEzNVlWVjd1R0o1a0w4Sk40dkxj?=
 =?utf-8?B?T05od0ZXMEh4MGhhMkRQM3VHVTcrcy9qWFNLNHlTYlBZRzBxREV3TElNMFlT?=
 =?utf-8?B?T0k0ZzZ6aXZ3azFKbE1pWVJ6Rmd0K0I4UzdyRS9MZ2k5QUpQenBpMHRBVmJN?=
 =?utf-8?B?RzBpVDdpd2hVVzZxRURNakZMUVlHVUZ2RkVSN3kzem1FTit3WElVQWI1OEZE?=
 =?utf-8?B?R3VvSFlUOXhFYzNmRFoxSm85UzFLbTNzc0paSWFIMFB1dC8vU3EwMHJmR0NR?=
 =?utf-8?B?MSt5ckVDdmV0ejdZOHY4MmlOZ2FlZXRoaHJqMVBNMkI0TkNQbW9jQWpwWmtz?=
 =?utf-8?B?MGc1bVpZcmRtYlh0djAvaXkzOFUwZDYwakt0ODhhbXpRMzQ0ZUVTcFg3Y2dG?=
 =?utf-8?B?VHFQcDlGQjZtSi9Ibm4wNWs3dk9TRStxbitBcXFKd1paeUg4NHlBZ2twa0lV?=
 =?utf-8?B?eXNGT0FtNk9XOHhlTkFSdG1aWUhBOVpCTnNrSFN6RVFWa1ZSR1crSUhoaHZy?=
 =?utf-8?B?WnZJcUxpNDY2TVNEVmMyc0x4bk5rZEdHcU5YV1d6aGkwRXJKL1pSMVUzNjBo?=
 =?utf-8?B?U2ZFNmd4MkxHTTY2dGlXa21rMXJNUjJUTEJRMXpHNExsT0k2TS9rQm9FcDBW?=
 =?utf-8?B?Z1cwZmFvaXN4RXkrUkxHUzVIVkdTMDJ0dytxL3JQN3drKzZKZU85UG1rS0xi?=
 =?utf-8?Q?HPR38GH2Ue4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFR1UWE4eVhRY3dtcVlBaDdUZm5XUlB5cUptcy9walBDVmd1RG1pc3RudDds?=
 =?utf-8?B?MWYvdzNDcm8zOG5ycGpxQUJwUEg0VW43ckpZVmlTOXdtNWozOVo3YjVCd1kv?=
 =?utf-8?B?bWRnL1VkTFkyc2hVYTl0TS9EMWlKYmtOZTVOWTRrUUtsSVBBams5R1lzR214?=
 =?utf-8?B?N1RvNnJtVDJiSUZuaVV5UUEwMGxXL1VNMGNQNlhOanBkMTFzUy92dGJZci8w?=
 =?utf-8?B?U1hHbFk4VVdPN2g4ME5QdW9reUlCWVovY21aei9Wb01ROXlnRmFPY0g4dERN?=
 =?utf-8?B?SzVRem1JWlJWUk9IeVFja3hwQUxHRXFoRTBFcWkxWm9rL0xRb1d4OW92Q3Fi?=
 =?utf-8?B?WVJYUERnVUZGR2ZHUGNnNFUxR1NaWjdLUnV3NVp0RFVxdlg2ak1yVmZSd21F?=
 =?utf-8?B?dXgyL05sRmN1anB2NmtZdjQ0VkZ2NWF1d2J2TjNGQkVHazRBVXQvdHdVSUR1?=
 =?utf-8?B?SXphdmlkRUNlYlkxdEx1blpCTVh0c0hXbmw2R1hSMTExTlRKL3AxemhWOHMy?=
 =?utf-8?B?WFlvdy9SN2wyOVFZQU4zUkl1NmlWUXV1QllTaGpOQ3daY250enpBZ2VxaGRn?=
 =?utf-8?B?SVU4a0F0RENBV2xjU2RSUnBBaWlFSTNrQnhxMzhieDRiRzBzRkVUSUtydzNB?=
 =?utf-8?B?bG9QU21lS0pjdW1pN2w4Rmpac1dQNE0vUDhBampmZElSTFd0ci9Mc1ZQdGxq?=
 =?utf-8?B?TmVrUFRvMWRwWGNzd0djbjdkVENyWmMzeHMvZEVBVjJFbnJlVmJuNGFlYmFR?=
 =?utf-8?B?QkhSR1gxWVhycWgrdE1nRDlhNlEybnNUcDRoaTJUMEZvUmxURUNaM01yTklD?=
 =?utf-8?B?aGRaOVpMekRDcjhiWmpUV0pwNkVHUXFMY2I5S2JqYnJYeFB2UDVQNmwzd2RL?=
 =?utf-8?B?SWttOTgzdXY1eFlCaHZqNzhJMWJkZUU1QWNBditnSUxzbEtFL3lCbWYwVk80?=
 =?utf-8?B?QTFQV1NNWmZLM1dMUk80ejZDZHRXem5DdEx0MFEyQWNDY0dORjVSOW5Qdmww?=
 =?utf-8?B?RFBaMnFGTWNSUXVUd0NTVWpxbEEwUE8xQmNlaStudEZYZ2JhNTdxVy9lYzhP?=
 =?utf-8?B?OG9kNFJsMlZTS21xU3VEUTZBaGFlM3NsTDltMFVTdzRzVVlsbDY0eWVQcXE5?=
 =?utf-8?B?b3EwVmFkUXhiamZmdVBtVVJGMWV0QjNSNnhVVC9mSVFnK0NycEZndi9PS1cv?=
 =?utf-8?B?aU84R2ROU05BVi9CQnpETUFEUFZmaEMzTG1KTHdQd2hOMWRZbFFkcmRzdVNP?=
 =?utf-8?B?V3p6bFFIbjlCU3dkS09FNmlzNVFkZS9TSUZhVFk3eVRPT1BzYXBVdzhoclA1?=
 =?utf-8?B?aSs4Ync1UXFZU2UrcXY1NFY0RS9MZ3E2Uk9NT25aUmVNcEhxYXRGQ203K2w1?=
 =?utf-8?B?dW11SkxxUU54bGdwbHdsN05iWFZQRHI2SzJnZDhjOElEa2hadFJ3TkNaWG96?=
 =?utf-8?B?eVk0VklHQ0lHc2dJWXNNL3NNQkR0TmNpUzVlWk0vN0JObnZVQjRlRlAvNTA5?=
 =?utf-8?B?RHRjVFlnaFlYK055Vk1HUVJROCtJOUNQWjN0K1ZXMkpadXR4dkJjMXpqMTE0?=
 =?utf-8?B?NC9jVnhma3dFZStSWUpYM0VHUGszWmNkK0dDb2F0U0ZyeFFFc2Q0RW5ON2U3?=
 =?utf-8?B?TnBmbWpQeWtYb242TndocFUvTTNlOHo2YldDWGFxRzIvdk13SmQ2ZytQZ1RY?=
 =?utf-8?B?MnlpUUx2R1VYSndHdlVMSnRHRVdZVm1PQXhLZURvb3pacU5OR0ZFcnRMZTM0?=
 =?utf-8?B?eCtBSmVHSS9TNHo5bWRrSVV1eXJlZnNQR2E5eTFuSkpGblhHVENmaUlUM2I2?=
 =?utf-8?B?ZzgvdUNIT0dTNjE5eHVpZmFRVjJvakxYb0hHRWxhNXpoNGwwdXZYMDNqdW40?=
 =?utf-8?B?MHBPQmllVWFVazd2b1JWNUlUM3p1allOcVBzdjJNS2Zia2xMTDJ2OWNhVEtO?=
 =?utf-8?B?VVR4NGpmck5DWFczN2h2UWVmMGpkN0c1L1NiQWlMV0VGZlJwN1hxUDBZeXJr?=
 =?utf-8?B?TWJZUG9wZGphcGc5ODhxQS9NY3hDbS9FbWNwUjVqZXdTV0loY3NleHZmNXBv?=
 =?utf-8?B?Z0FFVUhZVWpZOTJpR2tqTXQrMXdMQXp0UmVpUERtdnMyckJaQXRXQmJXVnFJ?=
 =?utf-8?B?YWEyTHAwcTlCNXV4YkhOQTVWUFNwZDU5aUdqQ3NLTlg3MXNkcmtCanBSQjNM?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c436d9c8-9913-4b1b-db5c-08ddb2559b8a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 12:58:10.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5xtT2bU0/TalffTBaavRrkp28F4MH0AmgysGp0io5xf3nQT/W86J1HsLEUaM8ja95/xrM3FR3rvCGx5mu45o+nbppf1M4NDBYjQmthb9FU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
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

> In a later patch, we'll be adding a 3rd mechanism for outputting
> ref_tracker info via seq_file. Instead of a conditional, have the caller
> set a pointer to an output function in struct ostream. As part of this,
> the log prefix must be explicitly passed in, as it's too late for the
> pr_fmt macro.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/ref_tracker.h |  2 ++
>  lib/ref_tracker.c           | 52 ++++++++++++++++++++++++++++++++-------------
>  2 files changed, 39 insertions(+), 15 deletions(-)
Looks good to me:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
