Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D752C52713
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA8D10E727;
	Wed, 12 Nov 2025 13:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBh0Jz0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F78810E721;
 Wed, 12 Nov 2025 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953790; x=1794489790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TxDgyQ2OxRQaRyJ31fQYnldxhVpXoodp0LUwhBWk8XY=;
 b=hBh0Jz0HnjqEakvhV9psG3nLkW17+hpSoYxr9rey45qYU7wKY0Ex1OOv
 ri3H8sYZhKhHV6gHAgF9ZNypzu1AESKQw6X7NNq8pO8+H6siDwUcGm3VG
 VS3g/MG3RpTPALQ3vixU14LrB0vCCwI0rM4OdzV3VU42lwVkZZVILKk4i
 sj908L3IB7gI5wF7sIAP4sczRcQAsF6BeJm5oWWiK7u2Ee9MDKMmEKl5N
 RQRvpWwOy9aIG4fLJtCvcxJNAUOmvnory3ujJclvJN1Wenez/I5j4SDFr
 9PpTR3xFbBVGFCkIEJ4dBDfdt+384HYA3Brayr7/7eTYeO3GgsobpOg7d A==;
X-CSE-ConnectionGUID: IWtrhoLzSXuaP56deLYvhg==
X-CSE-MsgGUID: u84vlDyiS1mulPmsmzyu3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64897907"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64897907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:10 -0800
X-CSE-ConnectionGUID: 3pkyWM1tQtu2QvX3HFWYiQ==
X-CSE-MsgGUID: h0w3o+jKSkqQNfC+mdwtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189195086"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:08 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryxFoY0MP0urzG9bRRdxgqClG+6q6/4HbPSc/6cq52NgjzwkX6bBjlQktEL/C1WGSI/V6VqXLn9P4PuxlC02Gq6URHnmH3dkBHAc6ctmKzqKnAZ1DrZx2UuyoyJMSVM5Hk4QNnQ6SQWTirGOETQvWTLCCvdX4DtIQO5LDpn0GmlXysckfaVc30CqraIY7+0TNdPBXcAuwimsswWn2YhRHFumA+03MccP1X7yD5bP60qd09NkiHmu1yBg29oRLD4uYBeerokor04yAvW6P3l7poLjXvnzvUGaOEWAbQHZkwwBOe18eEuP6aQTLBmsXOqOxnjKwXvLe6ZqETh19ng08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEOUehYqiFd0E+xsQo+IPBAmdA2LeSFSAGXK/PECRSM=;
 b=oyFLls388n3QELZSr36f4o+evce/7BeY2yF2zyIBRED69qLvHBIjnMPIyaHOB/1ERXg7en3TsY4iTR/q+1zcU5sn1OQLZr2+KNHcDAy6vFOvbPExBbuPvnJat5CNvLCm0yADkCxky+NWNs7aTr9G2yA8g2RIdCdJ1CQ4iED76NROVuKrWtKhw6g4HYx8G8R4Le2xEpRu4DEPM4JxRaJvbAYL10sLhAaKAd+UO/Aq8vTP/nXIm82/od4deUYpwUXFMIO0h8nFinhfToQaeKX9Ar46r0YQ+Zir2eoVkhCBGUc+kruKe2QoGh4kiSF9YPaSKmj0k4wF6vj7BmP7iNtzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:23:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:23:04 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 04/24] drm/xe/pf: Add save/restore control state stubs and
 connect to debugfs
Date: Wed, 12 Nov 2025 14:22:00 +0100
Message-ID: <20251112132220.516975-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0164.eurprd09.prod.outlook.com
 (2603:10a6:800:120::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: ef09701b-c2a7-4edd-76c1-08de21ee9c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkpMV05JR1Z0dnptcU1tM0hPM2FFS0RQT1EyaWVKNGVuSzZod3d1WmRQUFl3?=
 =?utf-8?B?bCtSc2N3Y3M1K29PMmJUaitEd1RDYldLdHFzbmRXUzhKVW5rT29IZjUzdFJT?=
 =?utf-8?B?R0VZeDMzRllmNW5DL0VjMnkvY09vNE9FZ0hkRzk3QjlSdGcrKzdUSkZ3NlND?=
 =?utf-8?B?WHpoUHFvZTNBT0RZUVBsd2lSelQ0NHI5Q3lrWmZieTZsbkwxTzIzMC84ZC9h?=
 =?utf-8?B?djhtYkNVRVVjb0YwSTRlbmtvUEREZFRBd1I2Ri9senlIK01ySTZjOTNPQlJV?=
 =?utf-8?B?NC9qckdNRkp2TUxDemw1L29zRzlJMTVMRVJDc1FyOG5oTmRYNTVLRUFJS3dJ?=
 =?utf-8?B?elJCRVBsNmVBNlhSMHpJWkt6cnhDYlJzWHJIWUI5UEh3dDhqUFhXVUV3WGpu?=
 =?utf-8?B?c2UyKzg3N1hkWEhXTkpDT3o0cTJTM0pOc0lGRXBuZU9YY0dYSkQrTG5lbDJI?=
 =?utf-8?B?ZHUrS2lvZzByOGJzalFlRHRkVzdIMTM1MkI5bk0zbzhrb1JDd05XZDdpZUlZ?=
 =?utf-8?B?aWE0ZGJXRlcwK0JDTzF2d2QyYnpZYlpKdnpMTEVxbllramZUamhRTEEwai9j?=
 =?utf-8?B?VDFHbTNlVGwyNzlUMUwrdHZHTUlZeGJoS3hFWDlLN2Q2aTAxSEpYYk04VXFy?=
 =?utf-8?B?bzZlYmFYNVZpNWhJbUk4QkpHV0lkcVE4ajRNSG03MklEMUNia0t6dmhiUlMx?=
 =?utf-8?B?cklZempwWHJjdU02TDlFeGhwVlNMR2d4UTFON2sxUi9JdUNwUC9VSGZZZVVs?=
 =?utf-8?B?c0Qrd2MySlFsSUNMWk9Rc283UVF3NVhsVDJkcGRIQm1SVlFQY2dkQ2h2bVRE?=
 =?utf-8?B?akRZeU1VOUg5anFkY0tnOEV2RHpNZjNyYmF0K2VwR3lnQjVxMzJrdklYVUFJ?=
 =?utf-8?B?VFh3R2JpdWNKMFg1cm1sU1V1VjByRjJsTUltVkt4d2laaUVUS2xaTW9XR0o5?=
 =?utf-8?B?NmtJczErWThZbHdGaEpmTkkwMUtCV2M4MjFySWNFL1l1b1pnQ3BLbW10bEhZ?=
 =?utf-8?B?cHZLOE14bUdlNDAvQlJGbVpKbDVWWVFvdkZ3T21FdWV4K0xZMnZSNHExdlJh?=
 =?utf-8?B?Qjk4V2liZ1RGNi9ReS9FUUNBUGlBTHg2UU03bjlOS21SLzZWNFBhblBvcHZ6?=
 =?utf-8?B?cDZWWU9qQ0NuSmRTSEx1bFBaMjYreDF0M1MrTnhoNXNud3FIUWVDNlg5RGJt?=
 =?utf-8?B?eVJUL1YwMDJEak9GK2ZFcW9SM0Zib1Y0ZVdsMVRxeG5aRkZDUTFXOWZ1Skw4?=
 =?utf-8?B?cVYrZVpjVklsekpWSzVsUDczc2tJK1F1cGh6eUNoUTV1Ky9VRlRtZ0NmbWJa?=
 =?utf-8?B?cFhqSDE3YmI0OWM0a1M1UFVwd29RMGFFYkc4cDF1NDFFREJsSUhqUXNIRTNm?=
 =?utf-8?B?MStIWHlwcUE3eC8yU3E5Z0FHUlZZTWFBck43TWRDMWd5Zzd1RytZMXpHV01J?=
 =?utf-8?B?NWxhVVpEWHZwcFd1Z1ZKL0ZrWElBQVZzenBaeTZSM0NwRXdRSExQK1cvRWVn?=
 =?utf-8?B?VDZiTEVGek9hVGxpUmlWNjBlZXBEaXo2dng2cnYrcjV0NWpiL0lRWG1kZmpy?=
 =?utf-8?B?Y0JXS0pUYzNCamhWaGc0KzRHdGcvbThEUDNiVndyQi9tQ3BMNkhhakRsT0pF?=
 =?utf-8?B?T0ZSYWwzamtRQWUxNklJRk5JTmJNQkJZbzVtMFpmTWpUVnlMdFZsVWsvNW5h?=
 =?utf-8?B?VXBYbnBycW9TTkFoSlpJMjU4eW1vVFVWT3UweExOaE02T0lZRnJZR1poQmtH?=
 =?utf-8?B?WG5yOVVGbzNDazJGZHFtN3NBTmEvK2lEYllYMlM5WlVLcUt0MGU3Q1J5ZXZK?=
 =?utf-8?B?VVc4N0NLSGVab09Ua3dUdlZ1cUJiV1JTR09iVzdlbmJ5eE04dzZGamhJZ3Z4?=
 =?utf-8?B?NTFSanZXRGRYUDVhblFLL1VOaGJyM1Z0ZWhLOW1GSU1KQ3ZhRVRPTlVEUFly?=
 =?utf-8?Q?6f2f8lv5uhRCpvqCJH0Lhkj04AM5KAsM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z042cndSRmpkM0tkREt6SjJqdHdqOWpxeTlGSFpvZENJcGZ0OEUvSytIKzFp?=
 =?utf-8?B?R1ZWVnpYWittYVQ1VllrYTBuWERvTnE0TEVPbWhVdzdFUm0yQXFlMFdlUGRi?=
 =?utf-8?B?NjRvRDJaSUZHYmJMS2h1ZnZDMXJIN3Bqc1dCZHRTYUsvdGF1R21TM2FOajBP?=
 =?utf-8?B?ekY5Q21CWVR6dUNNTU0xYjEyM0thVDR5OWxMYnpkcUZkM29jYXQ3VWczWWVL?=
 =?utf-8?B?RlQzbzU3Z1JURmVLK3JTWGd4eUpWUHQrWmI1Z2h4aXNDSzE2SzgybHRWZDlm?=
 =?utf-8?B?V2pYSlpjM2VVdXNNMjFWVDBVOXJNZzAydzB3SlYxRHBNUzYwcFhBM1dPZTY1?=
 =?utf-8?B?Z2Q0Z3BoenF4ejlaRG1mT08zWGlyR0pVWGorZ0FkOHhlbWtFWjAxRWJ5KzRn?=
 =?utf-8?B?b0sybGMzTVNCUmEramlrUWpIcU5IS1ErRWljY3h6b0I2RlowbFlGTmxCUFox?=
 =?utf-8?B?MitZWW9mTGlSVHlXWTE0WUFKVGtjcXI3WVFWZGNVTkZKNHNiRWJPRVJhbmZ4?=
 =?utf-8?B?eVQvTUNqcnYyVGFOam9ZQ295dmE1Z2dBWUQ1OElLQUp6KzJzNHpQMjZoTWxZ?=
 =?utf-8?B?Z1c1WXZQa3NNdW95VTA3d3libi85Qm9HeGtZU0NGMy91SUxoSFRVUzB6MUE2?=
 =?utf-8?B?Ung0YXVtbDlZUjZvRVh0MFI4TWs1UUxGK0NoSURPdFo1aFNrcVhNZEVuWXJn?=
 =?utf-8?B?ZGZuYi9YeTVjVXpIc1RVdW9xWi8wa1VtdFh2REtkZC9rY3hta2VuTHBpcmFn?=
 =?utf-8?B?T241L3JKNUpvSDJueC9MbzkzZmpheC9yRDRldzJvdnVuN3NWYnEwQ3FVNVBV?=
 =?utf-8?B?QjVtTVRnN1krVGljUnU0TGtnalZkeVBzVERuenFnRkVGdkpLTzV1QVZ5Y1lk?=
 =?utf-8?B?Ri9TbEJaVWJwZDFIL3RsZUtpeCtRTnFCK2hCUWp6MFYvUFg3cE9GMDV0YzFX?=
 =?utf-8?B?NlZmUmRhSFdZZTJIRktlTzRQa3BrZWJrSGJRSTNXWHJHYnU2d252Ulc2eVlk?=
 =?utf-8?B?dytHem4yZ3MvQkwwTzRaL2s3Wm9lRkRaekt1TzhNbjNyUmQxMWx3aUU2MDN1?=
 =?utf-8?B?VTAveElHeWV5TUNTV2RCTnM3L1VtYnJTYzBIRG5XMnU3R0ZwU2thTVZmWGo4?=
 =?utf-8?B?Z0xlTk5DV2piRG1pVDNubmNyVVQrMEU1RjRYcURhRzU1VWlaNDdLQUZVdjVs?=
 =?utf-8?B?ZHhOU2REV1ZHQ0dhZzRkazVLUFN4d3JKNEIyQ1ZGNDlOUnAwM1hqeVk0anFH?=
 =?utf-8?B?RDJKblFTajhmN1FLRlpyTDRGMVk1cnBDY0hqcFkzK1lIQWNvTW1pQ1NaSEY5?=
 =?utf-8?B?SVdKb3NnQ3Mwa2VOUnBGQXRCS1ZpTEcxeU81S0NTNC9UdEsySmVVMlAxUmxw?=
 =?utf-8?B?blVCbEZsRGpRcUdCRXZCVTZlMG9SMjlab1ZSNTlQRnVVdVN4YlNDbnFaVDVF?=
 =?utf-8?B?Rm9WZFllVFAzWDFYemJqL0ZNWHlrNEh1bCtYUkZxTWNCZlZHVFNQaVFZQ3R0?=
 =?utf-8?B?UDhTVHBMdWpEVU9Pd2hVTUY4SW5pc0tqUnRlNFh0dWZMeWNDRkxYUUhDbWdo?=
 =?utf-8?B?RWNzMEV0SFBIRzZsZjNzdElJK2dYRm9CWFRhSFpHLzFCd3NCVkE1U2g1Vzdx?=
 =?utf-8?B?cHVJem4zdmwyTzB4bGZGeVdSajNlR1phbHBNa3BWOGhUam1GRnhkQktSUlEy?=
 =?utf-8?B?eTlmOGVKTHk0MlBZN0s1L01kaEtKRE5nRlRuOS96dERSQ2dtQkJ4TUx6cGpv?=
 =?utf-8?B?cXlxS2tnVXdPSGtSdVlMWEFlSjhvUWN0aS9DRFRydll2a0d6MTBIRlJPV25Z?=
 =?utf-8?B?eUlhNDY1T3N1T2xvQ1Zrd3ljZi81QXVER0kxclRnaFQ0L1dsZEpHVjRSUFdE?=
 =?utf-8?B?bWZYS1ltN2FXRzk1TXV4dHlydXFJeXhncTNtQWFaZEdSM0J1b2NIU2ZOZWxT?=
 =?utf-8?B?RmZlSGFWVEgzdEd4R2ppTkY4eUd0RmZnazhyOGt2d2c4a3VuczdHc1kyRENh?=
 =?utf-8?B?Z00xbTRyL3ZzOGMwT1M3N2UxUTVkR0d0RXJPTlJWVXNtSjVCVVFoZ3I3M083?=
 =?utf-8?B?a2pjM250Z01Bb0pDNGxqMmZEcXJEWmpnUDFKS29wc3E2T0VFWU1ZZFB4Tkg2?=
 =?utf-8?B?dzFuY2E0ZGxwODlrbGRVdHZVT3BkcXVJTkU1TmdMM2wwQ1VDQml1dStPcWUy?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef09701b-c2a7-4edd-76c1-08de21ee9c42
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:23:04.3610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MRz+GQARlxpbl0sFgS9r084Jbe5ALQ1xGzC+W/EPAToKCVgmlAfYY+2+ffYBd6+HSg27qw9qq/j6KbNRwYXKyxkej3NeMZZy8jRTghloeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

The states will be used by upcoming changes to produce (in case of save)
or consume (in case of resume) the VF migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 248 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   4 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  14 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  96 +++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  38 +++
 6 files changed, 404 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 8a2577fda4198..a571e1c02a3b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -184,6 +184,12 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
+	CASE2STR(SAVE_WIP);
+	CASE2STR(SAVE_FAILED);
+	CASE2STR(SAVED);
+	CASE2STR(RESTORE_WIP);
+	CASE2STR(RESTORE_FAILED);
+	CASE2STR(RESTORED);
 	CASE2STR(RESUME_WIP);
 	CASE2STR(RESUME_SEND_RESUME);
 	CASE2STR(RESUME_FAILED);
@@ -208,6 +214,8 @@ static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
 	case XE_GT_SRIOV_STATE_FLR_WIP:
 	case XE_GT_SRIOV_STATE_FLR_RESET_CONFIG:
 		return 5 * HZ;
+	case XE_GT_SRIOV_STATE_RESTORE_WIP:
+		return 20 * HZ;
 	default:
 		return HZ;
 	}
@@ -329,6 +337,8 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
 }
 
 #define pf_enter_vf_state_machine_bug(gt, vfid) ({	\
@@ -359,6 +369,8 @@ static void pf_queue_vf(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_flr_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_stop_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid);
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid);
 static void pf_exit_vf_resume_wip(struct xe_gt *gt, unsigned int vfid);
 
@@ -380,6 +392,8 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
 
 		pf_exit_vf_flr_wip(gt, vfid);
 		pf_exit_vf_stop_wip(gt, vfid);
+		pf_exit_vf_save_wip(gt, vfid);
+		pf_exit_vf_restore_wip(gt, vfid);
 		pf_exit_vf_pause_wip(gt, vfid);
 		pf_exit_vf_resume_wip(gt, vfid);
 
@@ -399,6 +413,8 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -675,6 +691,8 @@ static void pf_enter_vf_resumed(struct xe_gt *gt, unsigned int vfid)
 {
 	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -753,6 +771,16 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 		return -EPERM;
 	}
 
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
 	if (!pf_enter_vf_resume_wip(gt, vfid)) {
 		xe_gt_sriov_dbg(gt, "VF%u resume already in progress!\n", vfid);
 		return -EALREADY;
@@ -776,6 +804,218 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
 	return -ECANCELED;
 }
 
+static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
+}
+
+static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
+		return false;
+
+	pf_enter_vf_saved(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_save_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u save already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_save_vf() - Complete a VF migration data save sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
+static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
+}
+
+static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+
+	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_mismatch(gt, vfid);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
+		return false;
+
+	pf_enter_vf_restored(gt, vfid);
+
+	return true;
+}
+
+static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		pf_enter_vf_wip(gt, vfid);
+		pf_queue_vf(gt, vfid);
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOPPED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is stopped!\n", vfid);
+		return -EPERM;
+	}
+
+	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED)) {
+		xe_gt_sriov_dbg(gt, "VF%u is not paused!\n", vfid);
+		return -EPERM;
+	}
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_dbg(gt, "VF%u save is in progress!\n", vfid);
+		return -EBUSY;
+	}
+
+	if (!pf_enter_vf_restore_wip(gt, vfid)) {
+		xe_gt_sriov_dbg(gt, "VF%u restore already in progress!\n", vfid);
+		return -EALREADY;
+	}
+
+	return 0;
+}
+
+static int pf_wait_vf_restore_done(struct xe_gt *gt, unsigned int vfid)
+{
+	unsigned long timeout = pf_get_default_timeout(XE_GT_SRIOV_STATE_RESTORE_WIP);
+	int err;
+
+	err = pf_wait_vf_wip_done(gt, vfid, timeout);
+	if (err) {
+		xe_gt_sriov_notice(gt, "VF%u RESTORE didn't finish in %u ms (%pe)\n",
+				   vfid, jiffies_to_msecs(timeout), ERR_PTR(err));
+		return err;
+	}
+
+	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_finish_restore_vf() - Complete a VF migration data restore sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	int ret;
+
+	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		ret = pf_wait_vf_restore_done(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
+		pf_enter_vf_mismatch(gt, vfid);
+		return -EIO;
+	}
+
+	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+
+	return 0;
+}
+
 /**
  * DOC: The VF STOP state machine
  *
@@ -817,6 +1057,8 @@ static void pf_enter_vf_stopped(struct xe_gt *gt, unsigned int vfid)
 
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUMED);
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED);
+	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 	pf_exit_vf_mismatch(gt, vfid);
 	pf_exit_vf_wip(gt, vfid);
 }
@@ -1463,6 +1705,12 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_save_guc(gt, vfid))
 		return true;
 
+	if (pf_handle_vf_save(gt, vfid))
+		return true;
+
+	if (pf_handle_vf_restore(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 8a72ef3778d47..0286536375d17 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -16,6 +16,10 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index d9282eb259727..c0ce05818e24f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -31,6 +31,12 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
+ * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
+ * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
+ * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
+ * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
+ * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
+ * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
  * @XE_GT_SRIOV_STATE_RESUME_SEND_RESUME: indicates that the PF is about to send RESUME command.
  * @XE_GT_SRIOV_STATE_RESUME_FAILED: indicates that a VF resume operation has failed.
@@ -63,6 +69,14 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
+	XE_GT_SRIOV_STATE_SAVE_WIP,
+	XE_GT_SRIOV_STATE_SAVE_FAILED,
+	XE_GT_SRIOV_STATE_SAVED,
+
+	XE_GT_SRIOV_STATE_RESTORE_WIP,
+	XE_GT_SRIOV_STATE_RESTORE_FAILED,
+	XE_GT_SRIOV_STATE_RESTORED,
+
 	XE_GT_SRIOV_STATE_RESUME_WIP,
 	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
 	XE_GT_SRIOV_STATE_RESUME_FAILED,
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 416d00a03fbb7..e7b904e57b68c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -149,3 +149,99 @@ int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_control_trigger_save_vf() - Start VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_control_finish_save_vf() - Complete VF migration data SAVE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_save_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_trigger_restore_vf() - Start VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_trigger_restore_vf(gt, vfid);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+/**
+ * xe_sriov_pf_control_finish_restore_vf() - Complete VF migration data RESTORE sequence on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_control_finish_restore_vf(gt, vfid);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 2d52d0ac1b28f..30318c1fba34e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -13,5 +13,9 @@ int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_trigger_restore_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_finish_restore_vf(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c55326..e0e6340c49106 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -136,11 +136,31 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
  *      │   │   ├── reset
  *      │   │   ├── resume
  *      │   │   ├── stop
+ *      │   │   ├── save
+ *      │   │   ├── restore
  *      │   │   :
  *      │   ├── vf2
  *      │   │   ├── ...
  */
 
+static int from_file_read_to_vf_call(struct seq_file *s,
+				     int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(s->file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = call(xe, vfid);
+	xe_pm_runtime_put(xe);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
 					  size_t count, loff_t *ppos,
 					  int (*call)(struct xe_device *, unsigned int))
@@ -179,10 +199,26 @@ static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
 }										\
 DEFINE_SHOW_STORE_ATTRIBUTE(OP)
 
+#define DEFINE_VF_CONTROL_ATTRIBUTE_RW(OP)					\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return from_file_read_to_vf_call(s,					\
+					 xe_sriov_pf_control_finish_##OP);	\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_trigger_##OP);	\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
 DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
 DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
 
 static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 {
@@ -190,6 +226,8 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
 	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
 	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
 	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
+	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
 }
 
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
-- 
2.51.2

