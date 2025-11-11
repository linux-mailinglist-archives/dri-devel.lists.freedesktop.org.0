Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE1C4A31F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C8E10E4C7;
	Tue, 11 Nov 2025 01:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLQPlKq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFB010E4CD;
 Tue, 11 Nov 2025 01:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823180; x=1794359180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=437Cru6JfWezish9NUBPFwHsFgBZlkMLEiy62oCbuEg=;
 b=KLQPlKq2WE8+02CnWGG+sUH8wTIv9b6hzO07OBSFecnEhTfxU/qHPzRT
 kdS0P7ZLtQ3MLhghPuO4GC2VauE7mP9P/gIWw8WoVwnhC2mZV+cF1HjPg
 4pYJ9WTaiZpTZjFgirZkz6BRlPvVeifpmET+XKF8H6Cm0kShoElxcB+g5
 d4s/by20VpTdUmijDFFBHElBKUAbepDSa4B9raJNlMwK0+wA+tdQLZkht
 7FjbhLnBX6657n2AElQWQROC3+DO+OSz9uQyrDAg6h5zIED/GwE2FG2dl
 hJvyCwDKlfEfm/G4X9MsjnjdszJmjjhbk9toMfbzWi2JjkQN1R6z03wW8 A==;
X-CSE-ConnectionGUID: typ8Y+1BRJOSX17xaCKuTg==
X-CSE-MsgGUID: 0krs225SSFKEbSAoem5tcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="87510876"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="87510876"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:20 -0800
X-CSE-ConnectionGUID: TJ7iiSL3Sqab3VVpntOR3g==
X-CSE-MsgGUID: U75NXYP/SiuI1MtOBoaJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460383"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:19 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE350Um8rN8nBo/e6GB8fiMuq80qSubBTCb1MuoOmtNqngtwJ7MP7diUHz7XeyIC4MY7edFa9qEHnDUcc1Kw+AjguwFA9yoGsCi38qWhe7xmf/SacLbv10SxfBuaRDgJD49qsUHJ0NrL1b3tVyFQmxVP1kX3aQoNrXmUEDJMu0cnyTiimecJcnLfTrwVqr6qqHWQIStxim2M5W3rXdR6948AgxI95IVl7Foraqo9LhHL6IdWanv/XqPVQ+rHih2Wczyg2ilFTMaFRmH3CwLIGgpUWhG0kEkDk54GPJTuexQhSaZKjVv1T0HuVl68fDxJ7XN/FykJrs+kMifl1lmb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsUW5tkZrVGXwKKn38PaoZ1IiDcvTzxy67AFzlCZYqM=;
 b=ZC8VSe+tgvnKXaOa6cVqtvJRZ4pg2Q26YKz0Ec2Fmaj6IXH9YQTdrrRl4QN0hAhK/5u0Ow9pXf77pIQPSiJPbMx+mLWu9ywOB4IWD47vNCMJPk4cjL2r8pFJhctqFnEJl8d7JIDkoq1f8rd2zahHFTeRITqdybEIZI7Z97QwvRmzwgjpjHt8FSwlo8AT+xu62fwXFZbXBVq52fdgRui5yi/yhJ7MIBZ4aphc8dEilQR4uJxZdsUrwlKMaGt5xrjlUklwPP8k8HFer8poe2RmcJV6S0NB60yxtKzCT4MvB6DcK6TK9+HQWPwpeBUapTAqosMirpTBFtfiOIAsVr66pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:06:14 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:14 +0000
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
Subject: [PATCH v5 16/28] drm/xe/pf: Handle GuC migration data as part of PF
 control
Date: Tue, 11 Nov 2025 02:04:27 +0100
Message-ID: <20251111010439.347045-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0049.eurprd03.prod.outlook.com
 (2603:10a6:803:118::38) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df06891-d4e6-436a-0124-08de20be82f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWQ1aC84S1E1RnAwQ1Y5M0hjbURibzdqUmpJVHY2MUlrL1JiNzc5NHUyNlB0?=
 =?utf-8?B?ZFJyTktBRkFwd0hoc29keGlhd21MRlRBZUQ2N2M0bDBJaHk2NkFDSURvZ05x?=
 =?utf-8?B?TlltaEFTR0xyY0IxTnoxbXhSWWRUYTZCMjBXQlpCZC82K05UTTNoWUh5Y3lp?=
 =?utf-8?B?WDE2dGVOaFIwNEZLSnkwdTlYN1FMa1ZqN2xvUEVuR2x4aTArYWs5V2lyUkVz?=
 =?utf-8?B?aXllZWhVbHJYZ2tIUFpKZU9xRHFoZFY2eTNRNjNvcHlyaXdnKzdNWXk2NzFP?=
 =?utf-8?B?VzBMcU1zZ2hrMFRQMnZkck1HMnJvQXVWQzhCNXF0eDhJQ3pFcGY1VlN5aDVK?=
 =?utf-8?B?WU1NbHpVdWFpY2dZVmt5dlpadmRPSGs4eVBVdXZ5MlZzUFNncXhhcHQwYUov?=
 =?utf-8?B?RFlaMnpiZzhEKzNjYUtIVFBrWmJueGJrc3dSaDlORmFOenFZeFVPNFRlM1Ju?=
 =?utf-8?B?RTNON0RDckN2aU1iNnF6Mzlmb3REcGdlWmpzWjdlMEtLTGQ3cGlZTFBLNkUr?=
 =?utf-8?B?dnZwQzF5bzBrbS9VVjZRNnJ0WlV1WjNXbEZBZjZoK1Q3ZSt1R2Y5Y2tpbEM4?=
 =?utf-8?B?ZUdtVzZLN01qNkZFa2pFTmtaM0JMTzZYSEJEVHNYbzlzMld3QnJKTThvYjQ5?=
 =?utf-8?B?M1dTbGJZaUU2djNvUThwQW44UzM4Tk5VbzNjWFdrWDhadFZibEdtQmhOMjI3?=
 =?utf-8?B?Nk5Tek9ZdHFPNGRsV2MramlXbHRzOVppNFRkMFlOUGNyUHI5WVVFdHpLdklj?=
 =?utf-8?B?ME9jSE9uWjNiUGV0NFo1V2JoZmxQN3MxNDFWNFk3RCtnRUcwZkpVNVdFKzlw?=
 =?utf-8?B?S1J6MytGUW1MaE5UY0x4NHNFaFoyQUFJOVRhcWptbXRGNThMbFhsa3RUd1dJ?=
 =?utf-8?B?L1ZVVWh1NWRVVm10c01wOEswVkRSbG1VVjBKYkdxallmVUNVV3NscW84UWhL?=
 =?utf-8?B?bXl2cDhaL3BoRjBreXRqWEhDVEt5eUVWTkxQQ3pZSWFsZG0xb2NmWFRDV0hV?=
 =?utf-8?B?NVU4N1YzK3FUdlFFZHFuaFcxcGFaRXFERm5FSmMvcitsTC80YklPZHNlZjZt?=
 =?utf-8?B?Y3ZQYVIwME1TQ0Ryb0UzTzd3K3FZNFh2ZytKRDc3LzRaNUZyejVYSmlORjRs?=
 =?utf-8?B?NnYxZFJJWExVK2lNSytocEVDNHRLRVgzdzdYN0JTWkhrMlhCeFU0Nm0xRkh2?=
 =?utf-8?B?NVNUL1NWeU5JV3d4Y2p3Z1JmeitOa0lRNGdjMUc1Z200YUlhRlhFK3RzMVhu?=
 =?utf-8?B?Ymd1ZDBNRVd6WlRKWW1XYWVETUZiVnFNR2plbnRtb1NoTUxNckY3a0dWSVVm?=
 =?utf-8?B?c29sL3lsaWlhWW1SelVmN3JKR2ZYNm1RaVBnNFRvUTRtbEp1aFRlMS91dXQ2?=
 =?utf-8?B?YnozNDNxU05jb3VkOHQzWlBwQjIzQmo5M3FmeVpHUHBLQ1R3eEp6cy9DdCtV?=
 =?utf-8?B?U0dNYlR3ejkwWlJHRlFIaGxVYXk0S0Q0V2JmZmFjS2lCdktwOW9sRGZ5S2Vz?=
 =?utf-8?B?enJJbkVmU3F6SXhVZ1NzVGhsN05DTFF6WkM5cXlJVlRaaG0rcUd2MDNsZzZj?=
 =?utf-8?B?SlozTy9lSSt0SkdWRzE3MHJPZ2I4UTRDMFB5QmVWMVhKMG04SVZnOS9jc2Vo?=
 =?utf-8?B?R3hnc01vSU9Vb3JRcmJmeXR2YmNza0tDWk1tUy9vVFdsRC90Njh6SnpmVU9p?=
 =?utf-8?B?azRhanBwM1N1cjFSeitGM3A3TExvZ1RYU2UzU3pTUWRIKzR5S3Q3SG9CYmQr?=
 =?utf-8?B?cUpCTkNBUTFLT0ZLUlF4aVNCMTJTUkpjS3MrWThnZ1JDWFlJbUoza1JmR2Z2?=
 =?utf-8?B?Y1N3RndNVzBMVkNhTXZQSXpPaDRPejA0bnRxZHA1Y00rZUNkQ0RHbzAxa1E3?=
 =?utf-8?B?UnNTNlYzdGEvd2o1V0xpYkI3TzNqWllLYmQvcVluL0d0NFVVTHB4Y0pwL1pP?=
 =?utf-8?B?SGkxUGpYRXdKVjdmS2FsMSs1TjN5U0Q5SkxGRXBLZ1JTZHYzVmxzV05GTXg0?=
 =?utf-8?Q?m6OP2Xm/S5cQEAnRoraRKLDz4TTEU4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBIK1dVSmd4K0lYcFU4L24vOE1hSFM3bXZJOUFkd2hidXNwR05sTVRCQnph?=
 =?utf-8?B?ZmFONk54L2kxQXhFM0w5a1hhenB0STJYTlRGTnhrbWg1UEdlYXBUUWR6Z1hQ?=
 =?utf-8?B?N2dZYWltVU9mTUttbWRqQklzQ3R3MVM5cjFtRHZqZlQrZTFVNGpPWG0wYXFI?=
 =?utf-8?B?U1hvUW1hNjBxenROQVVwZi9sRklpOUNrYU9SQUJuMXJHOTBaMUNjOEVocUxW?=
 =?utf-8?B?MFBJa3VlZnRQQXBRUlNMWkgxUGVSZXBnYXg1cWgycXc4STVKU3FXVDFMdzU0?=
 =?utf-8?B?VmZsTzNpNmswMG5ERndHNkVmNHloc1lmN0dLK3JUeDE5U2c4M0hsanE4SlBU?=
 =?utf-8?B?Mmw2c0JmSGIycm1wamdCNDB6ZDNlZHpCVjR2K2xSK2MwVitpeE02RVBzVEFF?=
 =?utf-8?B?V3lXL0JLZGZ6bTM1anRZZFByK1ptbStIbnBqLzVzQ0htZGhpNnFna042cHhl?=
 =?utf-8?B?cnZteGRKVmV4Tno2eFk3WmQzakRselc0WmJ5c2l1THhyMGtsYjVhQllkbit5?=
 =?utf-8?B?TEFGZGJGcGRQTlhFaEJWNDlUTERocHdwb2FRZG9jaEZ2Wjczb21qUjVHUHB3?=
 =?utf-8?B?TURQN2ZqT2lnRzM4MWNJVlRzY29OdktuREt3SysreWJMdk9BZTRlMjlWZUxV?=
 =?utf-8?B?ZFJDMkxxczJHNnVncDZ0dFB1UEZGQlpzenJRcVdMK1hBMzVmd0tXaG0zeHJC?=
 =?utf-8?B?SUpvQnd5L2pkbmxlNFJrMlo3REJkNmpPQkpudFMzVDZYN1FEc3FMcEc5dG5v?=
 =?utf-8?B?bzlHQXlpY3JHL1pPZnA1VU1qYTJ0Yi9CemNDZktRUlJYQUQxd1lTTzk2d2ZZ?=
 =?utf-8?B?QlZsRGswSXR1MStyWHUyUEhndFd2cVBmWitHSDd0TGE5L0ZkR3VPSFd6RHVk?=
 =?utf-8?B?bENOa0NoZER1UGRZTDNuYmNSV2FGTDlQSThDbDZqMG5ua3liaVRyaS9BTUZN?=
 =?utf-8?B?SjJqaVBDT21TeEZRZ0J1b2d5UmdlaVZ2UmdWdytCMmRkS2RFanl5UmU3RUZE?=
 =?utf-8?B?VlgwU2ZhVFk2WmZ2Tjc5OGxKcjBUSUJqWURIVnVaVmdISm9wZ2p0YjV1Qi9P?=
 =?utf-8?B?QWRTMFYrSDhFQVMvZ095ekY5dlpCaWNBbGhMRE5ycmlneUhJejhqa2p6d1Zk?=
 =?utf-8?B?OE1Obm9PMDR5ZXpTWVFSam1jWHo4Y0xkYVZpWmhiOFM0TFgwMWcxSXJOcHp5?=
 =?utf-8?B?bmljc2dSdG92SmZlSVBoOGp6ODN5NXh4aTBOUXNRYW9OZE1GaUV5Rko2aWFE?=
 =?utf-8?B?NjdBeDNZUlJjRFlldG9WenMwbWhpK1N5VFV6bjNqdWZqS2FuaStaK0ZoR2pq?=
 =?utf-8?B?dEVzYlo3TERZYmZINlUyZys3cUtsYW9ielltbm9ack5GdzIvSiszTXpxV0oz?=
 =?utf-8?B?ZXJRN1ZtSmE2T1V1YmxuZjBlazMxMU1QanJEQVBVSjZMR28zc3p6OHpzT3Fj?=
 =?utf-8?B?YkFlWGZka0FaVytCVWVEMzFxQTVHM3BUNUdVTVhyZlptNXc5RFZCMFJISDF0?=
 =?utf-8?B?bDZKaUtMU0p4dWVwdVV4bkVwVFdJVXdORmxTTnhnUmFKQmx2NkJkOS8wVEMv?=
 =?utf-8?B?VkhEN2t0dUxMbU5jbVVkRXBFNXVDUlFJVVRtMDczWTRjNVhKcEhsZmFXc2xC?=
 =?utf-8?B?WTc5SzUwVjZhaE9wMkgrL2NBc3E0eDF1SGJpQkNaNzh2bE5DQU5IcUh5YmdF?=
 =?utf-8?B?dXc2dVFRYTJON1dwdDVsZkVoU1F0MWRjWVllSW9jT0NnWUt6UWdGeVR4RDho?=
 =?utf-8?B?bGEzeVgyd3N1VTVSQUNkc29kUytWVGpITEVDOG5uQUhjNURMcStveGpBOExu?=
 =?utf-8?B?d1NHU2xKTktOTmhmeTVuT2Q1N1ZkVG5aaDFQZTlWM3RTL0VZbU92WVcwbFEy?=
 =?utf-8?B?WUtiWlhhc3ljZ09uVHBCRE5JUUFJaUE0OVZ3M1pYTFNFQkttSG4zUXBZSWlr?=
 =?utf-8?B?dHZEMGhFV2I5dUpSTFhQSWdUblAxdkVydmNuZmlabmhuVGhPU2wrVUJ1WVkr?=
 =?utf-8?B?S3p6UXo4NEtTdHd0RWsxRWkyS0orREl2SkQvN1dnUEdZZkF0Qy91YStNaklI?=
 =?utf-8?B?YXFiUnRIeE9NTVJ6VW1ua2VkbGxsWCtjdkVxRGpKcG1zNHhybUZoYUU5OEQx?=
 =?utf-8?B?dytTK1cwYmh3SVdQUldIS2xiZ2Q0Y1dxSEZzT2pncE9FdVJ2RDlWRUc3SWdD?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df06891-d4e6-436a-0124-08de20be82f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:14.7065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcs1MsjwAJSHQ2B5rnuS8OtV0cZfiye9kaE5utbF0rsgCdnukFD7QruD46rT27E/jarwfI/jPc5yp02wKdEywNGrkVindxby+fnrSW67IsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

Connect the helpers to allow save and restore of GuC migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 28 +++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 71 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  8 ++-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  5 ++
 4 files changed, 94 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index bb1ff5ff436c1..7527aed8c7c57 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -854,6 +854,20 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
 
 static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 {
+	int ret;
+
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_GUC)) {
+		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_GUC);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -892,6 +906,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
 		pf_enter_vf_wip(gt, vfid);
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
@@ -1079,12 +1094,21 @@ static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
 static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
+	int ret = 0;
 
-	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->hdr.type);
+	switch (data->hdr.type) {
+	case XE_SRIOV_PACKET_TYPE_GUC:
+		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
+		break;
+	default:
+		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n",
+				   vfid, data->hdr.type);
+		break;
+	}
 
 	xe_sriov_packet_free(data);
 
-	return 0;
+	return ret;
 }
 
 static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 5954c1a705f28..b065383331e6a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -177,23 +177,10 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 	return ret;
 }
 
-/**
- * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- *
- * This function is for PF only.
- *
- * Return: size in bytes or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
+static ssize_t pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t size;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
@@ -280,12 +267,19 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 {
 	ssize_t total = 0;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
 
-	/* Nothing to query yet - will be updated once per-GT migration data types are added */
+	size = pf_migration_guc_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -332,6 +326,53 @@ void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
 		xe_sriov_packet_free(data);
 }
 
+static void pf_migration_save_data_todo(struct xe_gt *gt, unsigned int vfid,
+					enum xe_sriov_packet_type type)
+{
+	set_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ */
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+
+	migration->save.data_remaining = 0;
+
+	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
+	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_data_pending() - Check if migration data type needs to be saved.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_packet_type of data to be checked
+ *
+ * Return: true if the data needs saving, otherwise false.
+ */
+bool xe_gt_sriov_pf_migration_save_data_pending(struct xe_gt *gt, unsigned int vfid,
+						enum xe_sriov_packet_type type)
+{
+	return test_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_save_data_complete() - Complete migration data type save.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @type: the &xe_sriov_packet_type to be marked as completed.
+ */
+void xe_gt_sriov_pf_migration_save_data_complete(struct xe_gt *gt, unsigned int vfid,
+						 enum xe_sriov_packet_type type)
+{
+	clear_bit(type, &pf_pick_gt_migration(gt, vfid)->save.data_remaining);
+}
+
 /**
  * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index fd81942bfd7a2..1cba651b521fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -10,12 +10,12 @@
 
 struct xe_gt;
 struct xe_sriov_packet;
+enum xe_sriov_packet_type;
 
 /* TODO: get this information by querying GuC in the future */
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_packet *data);
@@ -26,6 +26,12 @@ bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
 bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
 
+void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
+bool xe_gt_sriov_pf_migration_save_data_pending(struct xe_gt *gt, unsigned int vfid,
+						enum xe_sriov_packet_type type);
+void xe_gt_sriov_pf_migration_save_data_complete(struct xe_gt *gt, unsigned int vfid,
+						 enum xe_sriov_packet_type type);
+
 int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 75d8b94cbbefb..9f24878690d9c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -16,6 +16,11 @@
 struct xe_gt_sriov_migration_data {
 	/** @ring: queue containing VF save / restore migration data */
 	struct ptr_ring ring;
+	/** @save: structure for currently processed save migration data */
+	struct {
+		/** @save.data_remaining: bitmap of migration types that need to be saved */
+		unsigned long data_remaining;
+	} save;
 };
 
 #endif
-- 
2.51.2

