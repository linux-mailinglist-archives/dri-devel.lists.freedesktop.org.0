Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE26BC2245C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E969110EA76;
	Thu, 30 Oct 2025 20:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODJujrQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F129E10EA76;
 Thu, 30 Oct 2025 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856424; x=1793392424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=482qvVyyDYSvkePI8pStpFK/IoNsA3dHOiPWis2GXIM=;
 b=ODJujrQlEaOt7RAjyHuryZ+WYVKtdMon26H0YXuGGdDqrDrZLZ6+grkC
 eMh6R5O+JuJRojeXHQ6C3Sy0sP+lhmg1PoHGlU28vBqtfX5dZhBbOmNyU
 nL8eSw5zAXhiE+D+6GlTGPDZ7JqdKAvswZ4yltc+MNKGnpA49eK21Ae8a
 GGu0sfgnqJKHizD7wCCSYB9AGmw9O6UNkNI2CiDNrrxCR071yF9oNGCG1
 GQuBoDvYi3jfDkQvdamIJXRkz/MY+rV7AGSVRM6s6DsovJNIhEDD9HpB0
 4vEdRyKa38g0w+Y2LEhsivAUkUudkxKUZe8b/gZQlPqhb2QEwz8IOuteh Q==;
X-CSE-ConnectionGUID: M1XumgSdQ3KbBcE/snpWgA==
X-CSE-MsgGUID: hFDw3Dq2T0+4At6jKSrnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67664340"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67664340"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:44 -0700
X-CSE-ConnectionGUID: 0Q2MzwS9SQSN4YwrJw0wxA==
X-CSE-MsgGUID: C/xDpym/TSSUE44D+JVitQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185262733"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:42 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJS3PsKkqlUxRZGputr1d7MaOkMzHVQLkejYycAwHhoQtylfZd90O/0n3Dr2Wa1xqCPQMsym4TaoVPPX+zUNDTFNpmpQ8jXaJ7mKMhYYRm2wUIpa0dxDFDws0+Y0hQ661ucJwqUmEH0wdkGyJJtWHLeVL9HQoC8UtVQMCQn4juyxmh9N0nFAq2ypKS6Wc50eNbaQL9ni15InBT80LkYZB+llVs+ZgDdUx/9VcsRurSqn/nDw1GseCfgcamSwGFWt91F8T3GC5cr2SGoPoq/l5oFb+aX06uq27YZDdnyrs9UxaCAVocMWns3IGaqVg0+yk37Gt83vh1hsfEW0vnsleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6oWePtbiMMIav168I76Up4+n1my8wGe9tOETkMu0ws=;
 b=tHvbLG9CA1WuYdsLHAp5GGd6iov4XYfANe4EdWJTivmHou2sS/S4vpszZYmCkfOOc4Ek5tHwzrBoXqgbumgiX/9zG+htZXWb5ysngvL8mvhpD4dGDYo8Xf0gehhVkYDd3UYRqeO/SC23qTr/DwoRBAvdWIjVV1sY91oZLz7Al+a+LlcxZUTGT9G4EhDiPCo74OHiyWAKzJE677eOytAv6cSu47O666u4DGGqFljkx3hChVK+qQtIW/abTefAUMqgZ34jBf6hBedu8NwXXGNpCD+C6DOKG5EPDVMQsjRR+Xh2bQSfy2YoiG1+dOqfWj2aSqJxcnfl0Fp0+8proiRndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:40 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:40 +0000
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
Subject: [PATCH v3 21/28] drm/xe/migrate: Add function to copy of VRAM data in
 chunks
Date: Thu, 30 Oct 2025 21:31:28 +0100
Message-ID: <20251030203135.337696-22-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 04267896-d4cb-42dd-4f66-08de17f39c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzA0UjNiZGZia2ppKy9QNFhHM3FMMjlTd2E5NVl2aG5hNWF0eklCSFlJY2Jj?=
 =?utf-8?B?dUVZZ3YwVmVyRS9tZjF5cWxGSVQ5K0cvOGRUYU1XOS9GYlBjeFNxNUkvM3M0?=
 =?utf-8?B?ZzgyUkVZb3lXU0pJYm1UMWc2RzM4ZXovcWdmaXFPaHZOUFZSMnRIR1RRc3lw?=
 =?utf-8?B?am9JK1ZJenFDTERLL2VuS1pyK3gwOEpnTGZUeHFCT252SE9mdzN6QTJwNVZp?=
 =?utf-8?B?SzFvbjdPZGQwb3E2R09ZejUrKzkwVGdZNjc0TmppdzNCUFdiaEJmR2xtZ3V4?=
 =?utf-8?B?cFovU0V5OWc2TnpwU1lwQllPZzJmMHIvSm40UGZKUGFFWXZvQmxHRzFTU0pG?=
 =?utf-8?B?a0NETDNtY08veDZLV25pTExjakp2OFczTUhHdGVXRjFOd1Vaa2MxTXFiLzV5?=
 =?utf-8?B?bnBocDVtdnRaMlBiVzRtNGtyMFNlN2hUVllvMWRxaGoxMTJMUHFxLzFobEJ4?=
 =?utf-8?B?NE10NDJVck9wdWRsbWtKTUFGYllpTGhlaFNhVU0vRTZDejBoa3lweUMxU0pN?=
 =?utf-8?B?bTlXdElRcDBDYVlva3c0RkZja0JsU04weFJYQncySklxamh4ZysrdjJON1Jz?=
 =?utf-8?B?WnRsdHRuUDZhQURIT2hPNDRZbVpWZERNNk1RWEhnUTZmZHh3MVhCVDl4S2g4?=
 =?utf-8?B?ZU5hMWVlbzNTd0VpOTYzOUdSWVBGUWFQL1hHTnhaa2FSNDBxY3lmSlo5dWhH?=
 =?utf-8?B?SS9QRzk0WFJJcmZIaHh1Z2ROdWY0TkZQSkR4Ukt2ZzlLSU1aeFM5SFV5alpt?=
 =?utf-8?B?MlAwZ2VYc1JVaDJTdHRRZTUwRmdqNFFJQkhMYyt6M0tKSWwrNWJocVBZMk41?=
 =?utf-8?B?OWdjZzdrc2VsYTVmZ2s5RU9NdXRvVFpaSHNkWVFqT284Y24rQURnTGFmdC9C?=
 =?utf-8?B?K3pBUGl0ZWlHckMrRlNNZFdyeWhidU9vNWs5Tmo2cENiR0FxUHR5UmhEZDQy?=
 =?utf-8?B?UFVVbDZoYUpDenNlQS8zSEcrZlErNXBJRFpsL2Y4SzdWNnFiZHBrMG9tdHlw?=
 =?utf-8?B?QnJpc0ltVWRreGZzMmVMTUU0b2ZkRlR2YU1JZlJ6eVJNeEpBKy9vdkpYN3RB?=
 =?utf-8?B?OG4vZTQ5U2FHZGc5eTU5anV1ZkhpbkRzMFFTRXorbWxnWjcvTnpHQWoxVjFi?=
 =?utf-8?B?S3ZOa1Z6c0RGa0NUdHU2TXU2MDRpRTQ0RzBzcEJORVg0OHZtYzhDcVdCK1Fq?=
 =?utf-8?B?YkxOTTBTSGFpMG14dkxKLyszWCtpQVg1Qk1nTHBkdXRkYlhkSENiVWMrNngr?=
 =?utf-8?B?SmkrenBRS0JTZHlwR2I2N2twMlk1ZEsxN05ydE5veEp4MVdydEREdlRqdkRW?=
 =?utf-8?B?Ymp0WU5ZUmJ4dTNrVWZ5TURETlhBSDZ0Z1BCa3FtYXZHR0hwQnF2SmhXVVVx?=
 =?utf-8?B?b1ZJSENHUHdidFNGTFdvSjdQRVQ4cW5xejZlTmdhelV2a1VpWjQrZk40NWJV?=
 =?utf-8?B?UHExR1czcHFTZE1TY2UycEttR2diVnFPL0JyamMybzViOW5WdG5uL244aUVu?=
 =?utf-8?B?UDRRdFpPTGZ4dnV0Z0RzaFZKUStzc3Y4UTlsYnBSTzZxVHMxSUpOd0NJamty?=
 =?utf-8?B?bTUydEl5V09iL1hPQ3Bod1FYRmhFeThBZDhyZ3ZEc3MzQ2lTS2EzWi9xdExD?=
 =?utf-8?B?YkpzQTE5ZGZtYUpVZGtlME5DSDVYOVROcE8ybkdjb2hUOWpieFRoT201d1Bv?=
 =?utf-8?B?NFIxUkxGVXh2enBsc0dZa2swT2ZzZUNiRmNDaFBDWElqcTQ0QmVsK3VGaUxo?=
 =?utf-8?B?M05UNC9MWXE5SFYvWmVlUU04aFVSdm1VNzNxRG1TQUVVSTZTbTUxdFpaWExD?=
 =?utf-8?B?Vll3ejFuWkFSOFI5czdqdllvcEFYUGtJT1k3aTVNbWF2ZEYwU08vQjJsNkNV?=
 =?utf-8?B?UjFuRXhmcDU3Zm53ZTVPMm1qODh1Qm1URERKdVFHamkzakZaWDhPUXhFQ0hO?=
 =?utf-8?B?OXQvRlc4T1BLMXRvVGFWQWIxL2YycTNmdkNQYlVzTFpwL1dCN3VWMHRpSzBV?=
 =?utf-8?Q?aDRPam1qCxHKn77fUKhHHdoqbuMXjY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJiRHRXWUI5YjJCUlVPMkxzQTRsU0ZLWUVDVzNJVGh3WWlhMHhmN3gzNUdW?=
 =?utf-8?B?aE4zN0E2VUhZL1M2NlI4cW92cUtNdlRJRHhjQkRUMTlOYVc5MUhNazI2b0Yr?=
 =?utf-8?B?M2xhM0xXR3lLT0Uxa0JhMjgvOHhPeHJnSnNjQjJ5V0h2eUcyM2l6WDlZWXNt?=
 =?utf-8?B?TGdKdXYvWXBNdXlMUEsvZGNpUkxmSUJFNnE3OXVsNjVyZEhWYVB3MzNWVlVM?=
 =?utf-8?B?azJDUklDWERxY25sRDloV2RyTTJjWlVyTUhZVTJ3RmhIc0x6Y2FJUnFDYkF0?=
 =?utf-8?B?V0RoTTZvTVJsTjFYMUU2eWFpUmp4T2VBN1F3VVlRMGdySXFLL1ptOElVV1FT?=
 =?utf-8?B?QTh6a3l5Wkh3blp4Q2NlZzU2YVdJZmJxQ01abDJFcUZ4ODZDbmxwRFdxcDd1?=
 =?utf-8?B?UEptQ1cxKzU1dWFwMWpoTkJUZlZHMEZkVC9CUk9DQmMzcDEyU01MbjF5YXNG?=
 =?utf-8?B?Z1RxTWQyaFh6RTR3OFRHTE9PdGVKMGlyeDRhMGQ0alFOMGdid29BanNtSkR0?=
 =?utf-8?B?aTFJQ3FLK1I4Q0ZSZnUrc2hmeUFiS2FhMTgzM1JQVjJEcEMrc1dVdVUrdG1W?=
 =?utf-8?B?MzNBY1luR3BWSEZiSFBpV3Y1MW1kSUZ5cmQ5UVZLbVRBZDArZXUvNmEzTTE5?=
 =?utf-8?B?U3ZJNElNTnlNRlNJWEI4bExsSUdCTXk1Z0V4WHRwV2lFN3VoYkNjYm9EY2M5?=
 =?utf-8?B?cytrSlBxSWNPbkNLajV3N3JoUEVHWkVxUUlRRXFLU3RrNU15MlNYZ2l6engy?=
 =?utf-8?B?QmlJNSsyUzcycldoWjhoZVc2Q2E1S1J0SUtod0xqRElCYVRrdHhGU244dzUr?=
 =?utf-8?B?UDYzcGI0L1NVM2tFZ0tGSlQ0cy90ZE9pK1N4bExvNkt1N1NSVDYwVmltcTh2?=
 =?utf-8?B?UGF6RmlYbVN6dHk5ZlpMeUttOHJhSDc1c1lXbFE1UUtBN1ZMK0pBT0NqZUd6?=
 =?utf-8?B?OTgvVnkvZ2tLci9ubVk4UDhSYzhxQVpoazJiTE9vUXJpK0NrQ3MzN0t4YlNS?=
 =?utf-8?B?MjF2NlBRYlVXOTU4UG1FSkV1WXdIT2k0M2pPTnlKOEhmd3BobFN6YWMvNCtp?=
 =?utf-8?B?T3hqY2lCTUpidUQ3eDZZK2hqMVNsckltaUt1WFg1YUJoRC9iQnNwYk91SVNH?=
 =?utf-8?B?c0NOMFFnRm1XSGRkYlJvOXZWS21kZklVZENISXo4RFcxaURyc2Z2ZDhKL2dv?=
 =?utf-8?B?RmMyZHc0Vk1tZ0I5NXRRZWxoTTZIZHorZHhhMHhudWVjazVGblkxZlJZRitX?=
 =?utf-8?B?R0RxcERUNDhTSEROdGd1bmxra1hvNkNDRk1FUTA5QVB1bVRGYWcra2thekU5?=
 =?utf-8?B?ZVpkNThIeCtRVUZxWW9vL2lrWGNaYVVQNFZDTlhNWUFXVlR3L29XYjl3clNt?=
 =?utf-8?B?MlpkMy9GMUNZbHhBVkpyQXZSMmNCeTFxVnZOSnhtZ1NvNnRCZXQyaG1xaGZk?=
 =?utf-8?B?UEhvSmVQMzVjVGxzcWQwd3ljeGtydi9hTEVnLzVoNlFsUFVNOFZQajNYdGc1?=
 =?utf-8?B?dWxBVkpPeXJ0RFBNcnFzVThQZ2dWdEJBS1lkc3NQVHUzZnR0TU1HNTQrbHAx?=
 =?utf-8?B?cFBnTXUzN0ZRbzdnWVVBa2wzRHRRVm5VT0cyVlA4VVpHWFJSSFJJK2lzT0Z1?=
 =?utf-8?B?dyt0NEFFT0o2Qm4xSGZMNm5HN3lBZkpDZ0s4aitpTU13TkhJWnIrTnIvRUVS?=
 =?utf-8?B?QXVsS2JGWmJWVlZReHJVWFRsOGp6M0loNDZlazA3TU5sckViMTZDR2dGVlBh?=
 =?utf-8?B?Nk1ieVY1cXRiV0YwUWdWQTZGSnQ2SkJtK2JWWHd2bDdmZEh0cW5XVE9jMW04?=
 =?utf-8?B?MGlidnYzdlQ4MFgvTG9FUDFHZmU1L3lXTFJaeFBwUzJYaForYXVXNTcvQkZM?=
 =?utf-8?B?MGxMSjViN2ZiUHZoM0JzSkt6TDg5NmMyQnR5cVZ2bXZqUVpDZk11UHVHNHJu?=
 =?utf-8?B?NnFjTjlVR2xKVTRSVkZ0TiszQTlOakRmYTZzeWo2NjVpb2xkSEpkK1M2alVM?=
 =?utf-8?B?M3RiNzV6dWRzRk5MS3RmeVVUUlRyQzJpdXpwTFoyTHRyNU0xSW1GZ21IdldG?=
 =?utf-8?B?NmVIeHVqS0E5ZmM4dEZjM3drRlZNOUNOeEdWS01Mak1Wb2xLYlVaaDk3TjVl?=
 =?utf-8?B?YjNRQmp2Ri9uRFh6Y3dHQkNkU2o2djBLV2hidnYybG9qcXhsZDc1clZ0dTFG?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04267896-d4cb-42dd-4f66-08de17f39c97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:40.6048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAE11T4Ozvo0vdSDJRV40yj9ir5k/glRcLmoGI+RtVOtPgZOse+zLR2vhnv+J8W1a0sXj9Rtug3F7TPo+zu714UUW9JRnSn0LcSva80wwFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Introduce a new function to copy data between VRAM and sysmem objects.
The existing xe_migrate_copy() is tailored for eviction and restore
operations, which involves additional logic and operates on entire
objects.
The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
from a dedicated buffer object, which is essential in case of VF
migration.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 128 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h |   8 ++
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 56a5804726e96..dbe9320863ab0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -29,6 +29,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sa.h"
@@ -1210,6 +1211,128 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
 	return migrate->q;
 }
 
+/**
+ * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
+ * @vram_bo: The VRAM buffer object.
+ * @vram_offset: The VRAM offset.
+ * @sysmem_bo: The sysmem buffer object.
+ * @sysmem_offset: The sysmem offset.
+ * @size: The size of VRAM chunk to copy.
+ * @dir: The direction of the copy operation.
+ *
+ * Copies a portion of a buffer object between VRAM and system memory.
+ * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
+ * copying to system memory.
+ *
+ * Return: Pointer to a dma_fence representing the last copy batch, or
+ * an error pointer on failure. If there is a failure, any copy operation
+ * started by the function call has been synced.
+ */
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir)
+{
+	struct xe_device *xe = xe_bo_device(vram_bo);
+	struct xe_tile *tile = vram_bo->tile;
+	struct xe_gt *gt = tile->primary_gt;
+	struct xe_migrate *m = tile->migrate;
+	struct dma_fence *fence = NULL;
+	struct ttm_resource *vram = vram_bo->ttm.resource;
+	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
+	struct xe_res_cursor vram_it, sysmem_it;
+	u64 vram_L0_ofs, sysmem_L0_ofs;
+	u32 vram_L0_pt, sysmem_L0_pt;
+	u64 vram_L0, sysmem_L0;
+	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
+	bool use_comp_pat = to_sysmem &&
+		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
+	int pass = 0;
+	int err;
+
+	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
+	xe_assert(xe, xe_bo_is_vram(vram_bo));
+	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
+	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
+	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
+
+	xe_res_first(vram, vram_offset, size, &vram_it);
+	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
+
+	while (size) {
+		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 update_idx;
+		bool usm = xe->info.has_usm;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
+		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
+
+		xe_dbg(xe, "Pass %u, size: %llu\n", pass++, vram_L0);
+
+		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
+		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
+					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
+
+		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
+					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
+		batch_size += EMIT_COPY_DW;
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			return ERR_PTR(err);
+		}
+
+		if (xe_migrate_allow_identity(vram_L0, &vram_it))
+			xe_res_next(&vram_it, vram_L0);
+		else
+			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
+
+		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb->len;
+
+		if (to_sysmem)
+			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
+		else
+			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
+
+		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			xe_bb_free(bb, NULL);
+			err = PTR_ERR(job);
+			return ERR_PTR(err);
+		}
+
+		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
+		xe_assert(xe, dma_resv_test_signaled(vram_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+		xe_assert(xe, dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP));
+
+		scoped_guard(mutex, &m->job_mutex) {
+			xe_sched_job_arm(job);
+			dma_fence_put(fence);
+			fence = dma_fence_get(&job->drm.s_fence->finished);
+			xe_sched_job_push(job);
+
+			dma_fence_put(m->fence);
+			m->fence = dma_fence_get(fence);
+		}
+
+		xe_bb_free(bb, fence);
+		size -= vram_L0;
+	}
+
+	return fence;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1912,11 +2035,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
 	return true;
 }
 
-enum xe_migrate_copy_dir {
-	XE_MIGRATE_COPY_TO_VRAM,
-	XE_MIGRATE_COPY_TO_SRAM,
-};
-
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4fad324b62535..d7bcc6ad8464e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -28,6 +28,11 @@ struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
 
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
 /**
  * struct xe_migrate_pt_update_ops - Callbacks for the
  * xe_migrate_update_pgtables() function.
@@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
+					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
+					     u64 size, enum xe_migrate_copy_dir dir);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
-- 
2.50.1

