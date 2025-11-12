Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC49C52710
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB1310E721;
	Wed, 12 Nov 2025 13:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0bCxaqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A4110E714;
 Wed, 12 Nov 2025 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953789; x=1794489789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UjsbzOlDBoG9GxDqlXnBQ+RZcfcuWEleSP1JkcaufHE=;
 b=i0bCxaqSqbbJM8yXlicE3iEYyZYz5TcEFFfSUJW4/3W+C5t1umLD0Tpg
 HRNfncEAZy0kn1zZzl0exn9A8T/x143Lrpx4EUU239q1RCunJexjg0Q5s
 +mVpW8ViPFMfKc5cXCmJKnbXGo8XkV3cLBI2Uo0ite7DAQswQdS5hqdPU
 hrknoYwK857L+1+MpbtyUIXDwGbcricrBkMhCHm8bk/aH6tuUwg0TDz03
 pAwcDwghZKlYhPVxD6Tmmcnzrn1yeSdRy6UN2QjalXBcGx3wjyqSVPq6b
 +3JLjzjLYHmSx/iMTNDNY0WGRKFOZ22NWwCtYFD0EUv6i/OhYoAN6sIFh A==;
X-CSE-ConnectionGUID: Wud20N72TdmalS4qTwx88A==
X-CSE-MsgGUID: 9FNz2gOmR2OAmiIXAtUMKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64897903"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64897903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:09 -0800
X-CSE-ConnectionGUID: /I1x31/HTUO5EyeMyOTzcw==
X-CSE-MsgGUID: qnY2Vf/BQsaMjfbhZ87uew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189195081"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:23:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:23:07 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:23:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2ZmJjYa9UMyEzk64weLqZIPJsNysusS2pjTPJ1zugylK2R4rxAgwebVy4kEpxBjcKN7IYIT85bvipeSUe7r04Ovl3sXaMsDGwONuAEvDHXer81pmfr+kLy8oM2iekM+PqBceLagrXgfGnmueFcsWKNDNnS+c62SBNylp8TNzU+SIvJXpmmE+zCbltQWcNYd3C5Q8ck/CVVcVYJlS2zPu/OPdRWFB0ORrKUPkxB9R6rt8JHPljjHvf6fIo5OpOWf/2s/hNyFV3rBREDcBh+azOUTZf80lQBxGL1JFLQuxVCxCKZ1qJ9FW0o2aUxPrM26P1Ao/ROvsJkXKHZtr6/u/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjzEH1sDsCnriHVSOqoOfbA6dNtug30ukoNSvrVcMi4=;
 b=b6zWxHLK/Xu1v9QwZhhydcNC4h7JhPsSa58+BqjhmJO87KWps7Ok7WyqSOGsnPw/OanK04N7tzxHg7VkcA85WocZ3Oiz4vLMwUbSfVjcBhWRWuCTEs/QthyZKMzXa1P+W3Gjaikzz6jLeww2ECICHQfh8AqYL/5H8lhCHFMZ3l3UCELT05pcoJ93JAKbhv+zyhHc/8ucNZwHaFiMq759OrXFZJpBy1+tugoiu7p7zd6HhOuvob3ADnksX1mNRMrJAoHzHaa+WunRIo1F5M8tzyQirfWYi/F44wL2EL8PsxBfPr1byRiqQFGTfoIbifkgfS94k4Qxvm3GbV8U2zU7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:22:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:22:59 +0000
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
 <michal.winiarski@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH 03/24] drm/xe/pf: Convert control state to bitmap
Date: Wed, 12 Nov 2025 14:21:59 +0100
Message-ID: <20251112132220.516975-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: f71956d3-397e-4415-979d-08de21ee9987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlFIQ2pob2kxTzBFYnczT3hUcWJSdWtuZDROYWJiR0EySHo1SjNBOUFpUGZJ?=
 =?utf-8?B?TnpIWTJtZEJxWUZTY1AyNE5teVRDWTBueWFHallUeHNqNm16RitUakZ2c3ZP?=
 =?utf-8?B?WCt1dXJMaE40UHlWN0xMVVh2dnF4cUkzbDlycFZKbFBoM0Y4R1BkK2VaMk5V?=
 =?utf-8?B?bENJSkt5WFAzRlhLdmdaWWZSL3VXeHVJU1VHZUxyWnJwSWhzRVdnOEJJbzJo?=
 =?utf-8?B?SGFhYmpkM1FSbTB4THBUMVlnbkEzZzRMYnZ3amE5YXcxUmwyZlh4dCtEd1d4?=
 =?utf-8?B?UXdLcHNFUTd6WU11L0s1RXh4ajY2bm9UbE1na1lNQVZEaU1aTUVYamhWZjNl?=
 =?utf-8?B?eFdpamhkYytjNFlxdHk2dVU5bVdlS0FyM3UvSUppTFVzNklTSTlRY3dxY1dw?=
 =?utf-8?B?dDNCdmZZOFpza24xWFRISHVlOGNRblN5OTZuVnErSWh6MlpDbThJcGtreVY3?=
 =?utf-8?B?WHpPeUJxVldLWTBBVXpOSHNiRm5hR1hOSUZpeVdQclR0ajRpN3NHc1JZYXlS?=
 =?utf-8?B?ODNrYk4xenAwWW5LQjFQd0V5TDF3bWt3TTNnQVRGVU4zOEZ1TUpmcXcvOGMx?=
 =?utf-8?B?cVJscmlqOXZCRzNpQmJCR1VSWHpSQXVDbVlud2N5Yk5SNyt1cGk2U243T2tZ?=
 =?utf-8?B?WjdpNTBTU3M1cVdlWUd4K21QWVRpdS9ONldjb2R1bFpTakJydXgrMnVsZy9Y?=
 =?utf-8?B?WlU4K0ZEWURrZ2tZMXEyUlJJcVNMY3NkVG8wOVEybXpDWjJWVmpVeWZnQXZa?=
 =?utf-8?B?cDBLT1VlYnNsb0luNktqTXRrVlpqb21OL2V5SDhXek9WQU40V1E2dGdJNUpM?=
 =?utf-8?B?WndUeS9kelJQUHJBUU1WcXhmejBGZnFhSGlTQ3loVXR2R3ZhTzVkYnNtWGtJ?=
 =?utf-8?B?dXlqM29JdmdjV0ZwdW5ucVBoL3pYeEtiVWxjdDNLMFhuUkZpc2tTNUJFM1BB?=
 =?utf-8?B?TjUvZ0o3YXEzV3EwUkd0aGNqRXVqK1Q5enE1ZTJmbXplZHJLRlUzSG1CY1dN?=
 =?utf-8?B?NlhzV3lDNkhmT1RvdHpPaWxGTFF1bmdsWFdDOFVaQWpJUkFCd0JTSDFyOVFE?=
 =?utf-8?B?eUpnUE5GTkdXS0VscWVaOHVSTG03TDUrWWZpUFdMM28wVGx0eFJZLzI1SEdt?=
 =?utf-8?B?SUFzRUVFeERDZWszcUJGaHNyZFVkeG9LRGcxQUpjL3ZMRng1c3c3TTh5akxS?=
 =?utf-8?B?TURkeE80WDBTc2x6aHhsY2NGQnhheFdVOHZXeFBKVVVhYjZrOXBnTDdwUEx6?=
 =?utf-8?B?SXExTWVxSUcrVXdGV00yS1kvNFVWUWZwNVFSTVVLS0FnZy9ya0JhVXY0SHJo?=
 =?utf-8?B?UE9EMFBRT0l6bnNSZTNKUCs0T08xN2NPdkRxZDFIVDZ4cG14ZUxEcE1XSWI3?=
 =?utf-8?B?TXorR3loYVFpUjFnWG9qZUVYVm1uUzl0eXFKR0VkMGJpUzdONW5rUmJrZkZ6?=
 =?utf-8?B?c0I2Sm9zLzZ1dDg2cXZrWWxRMkJLNENJamxFUjB0bmFjNjlGYkNjMUN5UThr?=
 =?utf-8?B?M3g2SGtDVkxLOWRGNkF2L1RVeXdNWTZDTXNSUmxpMG9VbEpNblJPTUpySHVU?=
 =?utf-8?B?V2MrdUhNcThIL2M0a1ZGOXdKazlPZFlpaTZ0bHBHR1Z2bWx6MUNUSE5EaDRS?=
 =?utf-8?B?SUZEc1dnY05UK0NhTDJLSVdYUERETEpKS25HUkkvRXB3U1RuVmRtWmxOcFNC?=
 =?utf-8?B?M3U3bEh5SzZRM1Z6SHpuWGxHTCtnQ2xnbVVJQ0xlUXdScTNmekZqaENWbW02?=
 =?utf-8?B?R2J5MDRZQ0xxQndCV0JsbVg0cjN1bXh4aVZXOVNuUWszY3VVUkNVTlR5YUJY?=
 =?utf-8?B?eWVWN3hHeHhHYkxnaXBUM2hEYmdOUGQxVk0xMWx1TytHNTI0YXRPVGdNbk1Q?=
 =?utf-8?B?dTRBYnBZZ0hEWmYzS0U0bzN3WVRPR3pzQk9jUXUzb0w3aDdtem1ZZmJNdlMw?=
 =?utf-8?B?N3AvWEVuTkhMbWdIeGtkMkR1N2FQWTZ3NUpLL3laOFVldzhjYlRUYnk2UU1n?=
 =?utf-8?B?dFNaN3hraE1BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlZmYTYvRnFpUXRNRFhPK3hLU1RZWUNidWRDNHRwQVlPalRxdU0rdTlxejB6?=
 =?utf-8?B?SjRqMyt0VkFuNlEvdUEzd2w0N1FxdHpGbWZQV1RPR3VaUEJNZzdXc3VNWVB1?=
 =?utf-8?B?bUZaQkZHcTBsMlh4WmRmbGdSY3dQOE51Z3JwSkNvSGsxNGMrYzhkWWVxYVVh?=
 =?utf-8?B?OHp0Q2E5WEpKTldLb3lzOGhibk5UY2o0WTMyZEZ4a1gvcVJQVE9Tam1waHRS?=
 =?utf-8?B?VzF6YkR0Nk01SnRyMEhpWStyNFdheUt1dDdvTTl5UmdNbGFOZW95b2MrM0hX?=
 =?utf-8?B?TEFLdjRSMEN1U2xFRkFocTA0dm9SNVhiSS90b0lFUlYxd0tYdTNWV3hHWG5N?=
 =?utf-8?B?V04zTjJjenQ5MzVFOFhlcmp3WGFzdUVnaC9CTE9QeU4wVGYyandPcnVxYnlL?=
 =?utf-8?B?WlhIamZtRHJlYURNemJkTXR6MDBQVDRKdlA3OUNZQXAvd0k3VGR0WFNVelpR?=
 =?utf-8?B?VnFsZk8venRWcU1BejZCVEppd0lJVlRhQUx1clpvWHRFTTIzaHhXYXBnVGI4?=
 =?utf-8?B?YnBPV3RNU3NTc2JrOTZxeGRnTlB6aHZsR2JONG92N1NVOVNnaURiVDBVYjBk?=
 =?utf-8?B?V3NJN0U0MjdKalREWGd4MTYvbXBEZFpQR2FYVmtzTEFSckxOVDh4SS8wUzRo?=
 =?utf-8?B?VzY4TmVaWHN0ZEtTZFNNM3ZZMURWQmRZUnVRa0JObVRwdGZIS3BUeTczTlBv?=
 =?utf-8?B?Rmg4RjdMUXdVTTlSeFZFd2s1YkZsN2VmVDJRV2ZyMmc1RkhCaTZYRmtaTU0v?=
 =?utf-8?B?UjhRalFidXJObmpwcTVSVFFBUnV2QnJWVjltOGU4dythODVtTCswSDVxSnB4?=
 =?utf-8?B?Zm5WemF2SElrWlBXWEVzdVJzNzlWdGFjME5mclhjR2JvNmFxeWs0b3RSTFFs?=
 =?utf-8?B?UTR2U2JXQ3I0NUIyN2p4bXRXZ3dZbVh2b3RJVHE0ZG5HTnRuRVJhWWQwZUhW?=
 =?utf-8?B?cXEzS0IrTENQdUs4c0dpMHZjVUdGSnRNOFdOclB4Q0EyNUFUUmdkVjJLaUhj?=
 =?utf-8?B?bjdBUi9xRnhIN3RtQ2dYRy9Mb1JyczlFT2tnclM4SHRGVWIwN2d3SDVMV2tW?=
 =?utf-8?B?TFNZejVFaFc2L3J0YVRYV3YxWU5yVGE0eFVhK1VpNURWODRkMzBTeFZQb3ly?=
 =?utf-8?B?eUVVNHloVVh3NUFqOXAwMEU0TnVkYXA5VHk2TEtFN1QzS3dDRmhrQWR3Y2Ux?=
 =?utf-8?B?QWY0RGJVdmZtSncvM1BFNXgzekRZVDlhbXh3NDcvQmhJQTIwbmhLQ2JNRU5h?=
 =?utf-8?B?TkFSQ01qVnhjdmJndythdjZhbDNRd3VKeTJrdHR4a0lHTmJDNDJ5eVVIM0N6?=
 =?utf-8?B?MzhKQlBGSk9xMENHb0NFM1dsWEUvWmEvWmpnbVBtMk9Fbmcrdi8xOXVvNW9w?=
 =?utf-8?B?RmxYZ2JkRlhkeDVMbE1WTWxtRlUwVVpLVVNvR3JyVXZsdGhHaUZKVmcxd2lu?=
 =?utf-8?B?alpvRkVKc2k3YWdEaEZYdStzWFhxczc3Qm9ISE5BK3NmazRaZ0p5K2xkV09F?=
 =?utf-8?B?T0Uyc2Q3Y3UvaEtzc3RaQ3VSdmxOOG1FNEJmOWpNQTN6b2pRZHpsYzQ3aHIx?=
 =?utf-8?B?eUREVkxVU1h1L2FkbHhvUXRDVHduQyt5WVhZeHlKS1k0cUMzSVdiK3BYbm95?=
 =?utf-8?B?MkxtWmI5eWtoSm1UWll5TXB0ZU5lTHdhZTEwY1dwUXNxQndYWFhzbDF6RDhS?=
 =?utf-8?B?QUZyMkxTcVVKL1M5cXE0MnBGME54c3BwN25ObnoyZ1NuTm80L0FESXJmblRT?=
 =?utf-8?B?aHNnS052SFpqdFNHL0JXUmF3a1BxRnNoa0FtMk5GT2dBMnYxdW5CL3RxVXA0?=
 =?utf-8?B?cTJLRmx5Y3F4dHhYZkdkQ2pkS3BzRXNhTmk3aVk3VVN6MDVNMXBYSVpoc1Qr?=
 =?utf-8?B?NHFIdFlSb1FhQ0lvaTFGWFNVMVd4clV1aVFIcm9BTmhTSEo1RmZlYTlJWHlR?=
 =?utf-8?B?MmFOOHBJYW0rbXIyeGdHOUMweVB6YTVnRlNsVDRyOEZIYWVvTkU1eGxxcDdz?=
 =?utf-8?B?cGx5MnJwN1psSW1tTEIrQWh1OERTRlJIRFBraU5uTlRFUFRrR2FFbkJhcEhh?=
 =?utf-8?B?MWJaZ2ZOTU9uSnRSYzJxZFZJdzFnUGpjQVB0UUhYakhBajI5RC8rRzhlQnVs?=
 =?utf-8?B?UXZCTjIzbko3YmdBNEFuaHlBQXdPak05RVJicU1MQjFUSzJyaVcvalRIek9t?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71956d3-397e-4415-979d-08de21ee9987
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:22:59.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqFUoU+BIX+a9ccxFXZRsMONNGaobSYOqLKeX7tyXEuIPSXRQxHM0e3hRJCXfY+hFoXwj4PQkPp+jswZc8XrZuwtvrpnNldsR5YFCjbr53E=
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

In upcoming changes, the number of states will increase as a result of
introducing SAVE and RESTORE states.
This means that using unsigned long as underlying storage won't work on
32-bit architectures, as we'll run out of bits.
Use bitmap instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 9de05db1f0905..8a2577fda4198 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -225,7 +225,7 @@ static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
 
-	return &cs->state;
+	return cs->state;
 }
 
 static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index c80b7e77f1ad2..d9282eb259727 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -73,9 +73,11 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_STOP_FAILED,
 	XE_GT_SRIOV_STATE_STOPPED,
 
-	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
+	XE_GT_SRIOV_STATE_MISMATCH, /* always keep as last */
 };
 
+#define XE_GT_SRIOV_NUM_STATES (XE_GT_SRIOV_STATE_MISMATCH + 1)
+
 /**
  * struct xe_gt_sriov_control_state - GT-level per-VF control state.
  *
@@ -83,7 +85,7 @@ enum xe_gt_sriov_control_bits {
  */
 struct xe_gt_sriov_control_state {
 	/** @state: VF state bits */
-	unsigned long state;
+	DECLARE_BITMAP(state, XE_GT_SRIOV_NUM_STATES);
 
 	/** @done: completion of async operations */
 	struct completion done;
-- 
2.51.2

