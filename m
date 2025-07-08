Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50264AFD9B1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 23:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9D910E6E8;
	Tue,  8 Jul 2025 21:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mn8uhUDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EC810E1E3;
 Tue,  8 Jul 2025 21:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752009821; x=1783545821;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=z5ZdY0cvWDsTOfJkwZsWm7U+ldLZ95ZYxpVjq7+MS5c=;
 b=mn8uhUDXAy7UjCb+eywukce+OQIjVlSWdz8wqtoA6QaceWYzU033KUs3
 OifeTY5MM45aRLs0DfYU0ZPRY0t2DFK9o++mGdWuvm8RkBSw4OBPEymIP
 u9jq7GTbWBXuVlZxYMqTy8vIpc1P/TTlkz9b8Tg1gsZ6hTWpbCLtYkSVu
 gl9rTQNViy0vDKWiUYlZiXyJ4kigyzohL4NxPMVtHGtR7HdvEncpqDTBO
 fxl/114kO3fAAh9Wg7ZCTjswVlw9g1FS/uyCkcLgt+2afw82X8t0o/onz
 Z4d3MURa89qSInB1b6MuRAkeMYrpaIY/+wKXVpYjdWr0foQQwwyg+r5WN A==;
X-CSE-ConnectionGUID: 2x164iauS/GX0k5JKWxArQ==
X-CSE-MsgGUID: RVm/QzuSTI2rZGmxWZYC7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79697227"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="79697227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 14:23:41 -0700
X-CSE-ConnectionGUID: pcjCRZ9vRNWqsxF6Zh9tqg==
X-CSE-MsgGUID: duWe0NuwSyesqJXccyOXGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156083663"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 14:23:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 14:23:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 14:23:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 14:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwFLWHTWOEy2iv+COMeVD65IV5ZJM6xUq8KelhqN/9d9LZbWLgbptcabHANgelbY1fptihLxHn5+PnekJpf2UPWx04PnTGEImRKLU2NhcDrMAW0nVGdDPLt+E7Zx7z2pzUDViu2ujDew09fylAO5q5vwpvEP8n+naCCKj8p4Lk/HvdWU296UKm2NsgGOVAukOjzVo2w1gt8/tUIkOIlSkV0P69fH5x0k6TzNcTnso36ewomLKI5NhNfbJcBtAR/7fj0V1044iTROXjvKmurSHrEcKNMPW5qAM00Jk1x+BlVsuaKSP5ZT3EmLi0TotZnG51lVJsc0NalNlFkky81j2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V29owUu0d3Eygr1x+uH1EvVSjtuc5y2BNyYDlhZDOQ=;
 b=EqJdDGi24eqwqKxvYXji3yNjDBdkX4rrbkE5Y1BDUZN8mNMe0Hnlb4XJ8d5dblcU/wQzshr3IdtHlRmasy+jv9qZbxIZ7dGGTW14t2SNFYzGoKq+gk2s6nr+4OarhhuaPrTo8uL9BIrx5Ti3YIZWDAnM3oH3bN4bx3G3EU+xdhPLie0c5Ep6qdn89Orbv+MddA7BYFHBASitjXcVR8jZ3nOrHTGyYjhsiBWcTOaGOqFc3/wE/eLoW9PIi6o740Ck4MCQknC35Zpal1XXyhXMLlbzWC//O4vSghQoT4IBJfuE97aHxeGjWfD6MzLLIQy3DMk4ZEG0kpxj9mkJG5eL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 21:23:37 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 21:23:37 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Subject: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS to
 TRAINING_PATTERN_SET
Date: Wed, 9 Jul 2025 00:23:31 +0300
Message-ID: <20250708212331.112898-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: d8525743-3098-4056-1401-08ddbe65b3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWNKcVBVa2Z1WDNybDd2MWtsaENJSTgyM0RhVDlseWVJUEFUM0o3QTVKLzly?=
 =?utf-8?B?aDNFVENXZk02b1pHWmlnRDZleFpsRlVGZU1qQVJ1U3VuY0RkalpZQ3pnTk0z?=
 =?utf-8?B?aVdzSGt6QmJYREdMckFmRUNpZzBnTTRUTUQrTGxjR25GNmFQR3hPa2NTRCt3?=
 =?utf-8?B?ZExWQm14anNCQ1l4MFd2YkczdGhLR01mZEFzYmE1VVc5U2ZpenJ3NmZiaXBn?=
 =?utf-8?B?ajRQSUJkTlRNaCs0OE94WS9JWko3Z083Wk03SDNKczRQQnlwdzE5K09kVHdD?=
 =?utf-8?B?NE5JeG03cVVtUXlLREt5M3lJL0NoaVNMOURhRWVYZFJ4UmsrMEpueHZxQ2g4?=
 =?utf-8?B?QU9wMjc3eVF0M3lHTXVrYzFGditURDhKUjMxZnpwaDFDMVBLdnR6WFB4K3RC?=
 =?utf-8?B?UXh6NkxISmR5eTJ0WW1KZ28wWjZJMzI4bjB1TTZheVNEYUprOE5uZlVPelFE?=
 =?utf-8?B?SVNKY05GN2pzVS85amdMelp2L2QwNGVLNUxqSmxBcVZLMHhoVTQ2LzVnc1ht?=
 =?utf-8?B?aWtYUFJkZkl1bllZY3A3blBmdTJEUFVMRkhkckkyL0RGRGxZNlVLc3VOTDBC?=
 =?utf-8?B?WU1aVUk5a0krYlRvaVdXKzF2NGFVODg1ajZ4Y0o1ODdIS2JRT1lwUmZmRjd3?=
 =?utf-8?B?YWgrRFZXaGNGZE5ibDE4ZWpaTnpKaUZuaGJkUHBoRFVYb0hxLzBhNThKaGQ2?=
 =?utf-8?B?RHpobmpCM2tWV3NxMUwxNGxXTGZra1Z2aWJjLzVXN29vNmwyM0VoUjNSNHVj?=
 =?utf-8?B?NHZYTjNDYWhpbWdOdVUxays4OTJkclFRWnZBeTFXaWk1bDJpUWNPWHl6ZFBt?=
 =?utf-8?B?Z1krUEFITHM3OE93MXBzbXBWUlVsQUpERElZb2thNEJMcEJRVFptQTNuWXVQ?=
 =?utf-8?B?NjBhUkVxYlBXUEN6ZXZBeUZySFV6cW5hL2FXTFl2R1RQSTFpQlZuZTJERFVU?=
 =?utf-8?B?NU1xbmtKWXlIVk1NeEh3NEhJT1RiQ05OZERxTUJ4R01VcnQxSmhPeklzcUc1?=
 =?utf-8?B?SEl1YTdIbVRJWmZ0RUd0Yk9IOGhCUWZsY2hwQjRJOWxCakR6ak1TdCsyYzBK?=
 =?utf-8?B?YithUlBMMTFib0hDNGk4Yy9LaDJxaGw2Rlk0MG9oZkZQKzA5Sms1aDUwUHlR?=
 =?utf-8?B?cG0vZDdmUzFJa293eStEbUdvSmI3TzdpWFVFQUNsa0JTRldhWTU4dHRTbXlS?=
 =?utf-8?B?WXloTUNwQW4yTHppclhhZ3lFc3NZb2pnNGx1bjlWOVpiS1U3ZUJBMk5TZWNp?=
 =?utf-8?B?di9hNVhiMW5vM0Q1bGgxSXcwMGVqQTBYWXRKSklVR1JGMFRGOGVUWTRyQUZR?=
 =?utf-8?B?Rm9HQWJKMktiK0xrdzBsbGRZUVdJdTBOYWdHK29lckliQ0ZMVUFWM0huL2xs?=
 =?utf-8?B?MTg2dU1sSEkrdGFKZExHU1RRTWVvOWJybDB5UjR5a3FMNGtIUTVKMUFMQUZJ?=
 =?utf-8?B?WmRCcTc5d00rR2pqMGlVV0FTdmlrRzhDTWRrbWZ6cW1wSkpWRUIwRmwyNmZi?=
 =?utf-8?B?Tng4ek43ZFFiNXJnaU41UWtoUzlYVWNRZjhHb1JDZmR3THdXZGsvT25GTzha?=
 =?utf-8?B?SmJsZS9PNXAvOVlJZEt0ZUpULzljVHZWZlU5aGwvdmtjVEdPQWxnMEU4bnZK?=
 =?utf-8?B?aUY2WUtNTnUwQXFMRHJlVjNCbUVMdmhDMUJLbGVORktOTjRlOTBMNG5vemMw?=
 =?utf-8?B?Z21KMkltdmp2TTFlLzlmREtVbWgxVzRVNHdEcFd5VXlyWFlndGlxSmdvRitz?=
 =?utf-8?B?RFFUUjNMM1hNeG5HV0pXOXcwQTlHUlFyOVNBWlNjc2VOeTMvTEdaaURaUWlh?=
 =?utf-8?Q?wtfxAi+cv1fCnObqE4I0O3VMIl/jCetAb9OvA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejZzMjdwa2x3OXBINk9yaGUyUUFIbVB6SjN5aGJlRXdIUndDNk5EcytyTCtk?=
 =?utf-8?B?OXF6NUpIdWkvb0lzcHZ0VnFlUmRKak40dEJmT0FQeCs0bXZUamtoOTd6Ri9Y?=
 =?utf-8?B?akVLTnBmSk1NM3ZLVWc1K1MzQTVROERhRHlxNFdXT0NKNmdyTXFlWmNObTc5?=
 =?utf-8?B?TmhHNGU0SjB6dUNjR3Q2bTRlMnhhUVFDSWQ5KzQ4K1RKanFPRmYzRUtDZ05o?=
 =?utf-8?B?aGN3VTZKVmo2UHNqbzd2aG9TSTBiRTM5YmRpVENDd2M3aGxweW9BOUVESExX?=
 =?utf-8?B?OWxVa25rQjZJdDFFVGRsODAxVlIyVkxjRER1WmQzbDR2QkQ1elIzYTVHMHIr?=
 =?utf-8?B?K3YzTTFJaThMd0twcFlDOENDcG9BRE83dWNTMVRJWWd5NXVYWXVIY2tXR2RC?=
 =?utf-8?B?ODZqMXNGeENOZDgwN3Z4eGFsc0VpODFLT1kxQk43UkZhaW02RGpkS2xVNWhl?=
 =?utf-8?B?MVRLQ0ZlWnAvOGpRQ2dTRXgzUlpPRE52UDBmR3B4SUl2MHhjWHRkOC93ZGxt?=
 =?utf-8?B?VmNUM3pxSzdRcVFscXQ1Z3h1Z3k1Ly9jYmhpMVcwb0MyNUl1c3hmZi9yRFFp?=
 =?utf-8?B?b3puc1djRXBFWkdTVlVKQzBRanNEcmkxamZMT2drVkpyYXlqL0hwZWxEcXdy?=
 =?utf-8?B?cG9TZ2J4ZjJrSk9XeGhoT3Rrc2Z1RnhJd3JMdUNPaE8xdjYwUjZiMGxPNzM2?=
 =?utf-8?B?YjBSRGdBSURlVXZIZkdMV253dlpNVG1mdVo5dnI3eXlRSFdGSVJaVkZWRE5N?=
 =?utf-8?B?OUZzSmczZnZSbENzWkg4bzNPbU1Qc3RtdGFTcFJCTGRPamRTaXdxdCs4Z3Vz?=
 =?utf-8?B?cVhBbCtuQXR4V1VJNGNVS3pBbk9IRTRVUFVqdjAwWEdHVWRCTVZBUlZTYkM0?=
 =?utf-8?B?RDhZV3l4Q2d5RkNOc0VCakx6Ymw1bk01aUxkK2R1TVZsUWd3aWdscERpMy9D?=
 =?utf-8?B?ejAxVEx2L1R4YXRRZXhzSDNDcGl2V0pUcUhGa21CN3d4VG1DMlZpajlKRDB4?=
 =?utf-8?B?YXlkeVhmZ1pHVGJsK2JlU21paTVld1NlYmpZLzlRZzNjd0hOREwyKzFNMG5a?=
 =?utf-8?B?ZGZNTnVwa1JiOXIrRWVvMlQ3d2lkdDZORzR1czY2SVZXVVlOaENkdmVMRGxM?=
 =?utf-8?B?QlNDSUR5VHhVdExVaXpyODd2SU5OdURLN25YUGRkV0RBdmQ1U0VzYm5OUDFr?=
 =?utf-8?B?V3hiNFV6cm5SWGFvVU1Rdmc3WDRSUmdaeE8vdGpDTXZleWFHZWNiNndWNmNZ?=
 =?utf-8?B?blNJME9NZWJkODR2WXRHaGh5RTMrS0FiZlBKN1lVTVpBdEJucENWVWVma0xJ?=
 =?utf-8?B?QUErRVZIeDdyN2JwUVpMeE1pRlAwSVE4NmRIa1lQc1VSUFBlL1ZabkZuK3gz?=
 =?utf-8?B?bnB4NVBmMVErb0RzNEgxb0tTQ2ErUm1FQnRtRGJsR1Q3R1FzdE9uYjNOV21I?=
 =?utf-8?B?SFVlMUNrVXlTeUlFcHBwZmZpZUZwQXBMenpLRTNqek5Qek1zRHFiUGFFZ01v?=
 =?utf-8?B?Rlh3TDlNT0lqMVJDU21qNmxjY00xM1k5Y0orNXplaC9ZTW5tSXc1MW02Y3Nh?=
 =?utf-8?B?anErWThsU0laSVdlQ0F6OUw3R0c4MGZ2YUgva3BTRkV3dm1VYXNZU2lpUjVN?=
 =?utf-8?B?ejQ0OFdxNko2bzJ5WG8rVHZ2MytSajdINHVyUW5YQ2dNcVZLUzZNTXlEWDJ4?=
 =?utf-8?B?aTdkMFBVbTdLS3JUNnFTNkpEYlFrMTQ0QjZITFFrL1BSLzhsdG4xV3JWNllS?=
 =?utf-8?B?VTBnRldkQ2pOTUNHYW5WWFdXeTdoc3NCMG55ODVTci9qdTAyRW9Va29XblY1?=
 =?utf-8?B?aUtqT3JEdGFjVklXamE1TUJybVRFUjJZZTJQMlcwaERCMW81TXlOcDdhVkZp?=
 =?utf-8?B?SHBhRnNIaXkxc05melV1T1hQWmpsaFFPdWZ5SEk3YmxoZGhtTDNNV1hBa2g2?=
 =?utf-8?B?T0ZXcUludk8xY1Q0dU5ST2JldndIekhHTEF2OHNXdVA5RSs2eTV2S0pwQkxN?=
 =?utf-8?B?Sm0reGlKYTRXUEZzUFZkdnFCWThHZkwzRHpRUmdpRnE0NXRqTHErRmFlMGVU?=
 =?utf-8?B?cVlJMkNKWHp2R2lzT2VJZGZSRC9NMEdja0kzNW5rVDhGYVArdkkveC83TzRB?=
 =?utf-8?Q?PwhpUpr0VCOkmsSh+WJwf6Nj8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8525743-3098-4056-1401-08ddbe65b3bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:23:37.5728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRHte6gTQm1m36ZvY4u9bpRInJTEqmEI7mNffwUdEBIIyOyHB587e3QsjTP9srSHsl2tZIlJ2D0trDKtT2uvpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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

Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
DPCD probing, since this results in link training failures at least when
using an Intel Barlow Ridge TBT hub at UHBR link rates (the
DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
link training). Since accessing DPCD_REV during link training is
prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
as it falls within the Standard's valid register address range
(0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
training on the above TBT hub.

However, reading the LANE0_1_STATUS register also has a side-effect at
least on a Novatek eDP panel, as reported on the Closes: link below,
resulting in screen flickering on that panel. One clear side-effect when
doing the 1-byte probe reads from LANE0_1_STATUS during link training
before reading out the full 6 byte link status starting at the same
address is that the panel will report the link training as completed
with voltage swing 0. This is different from the normal, flicker-free
scenario when no DPCD probing is done, the panel reporting the link
training complete with voltage swing 2.

Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
the above side-effect, the panel will link train with voltage swing 2 as
expected and it will stay flicker-free. This register is also in the
above valid register range and is unlikely to have a side-effect as that
of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
CR/EQ sequences and so it may cause a state change in the sink - even if
inadvertently as I suspect in the case of the above Novatek panel. As
opposed to this, reading TRAINING_PATTERN_SET is not part of the link
training sequence (it must be only written once at the beginning of the
CR/EQ sequences), so it's unlikely to cause any state change in the
sink.

As a side-note, this Novatek panel also lacks support for TPS3, while
claiming support for HBR2, which violates the DP Standard (the Standard
mandating TPS3 for HBR2).

Besides the Novatek panel (PSR 1), which this change fixes, I also
verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
panel as well as on the Intel Barlow Ridge TBT hub.

Note that in the drm-tip tree (targeting the v6.17 kernel version) the
i915 and xe drivers keep DPCD probing enabled only for the panel known
to require this (HP ZR24w), hence those drivers in drm-tip are not
affected by the above problem.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1c3920297906b..1ecc3df7e3167 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	int ret;
 
 	if (dpcd_access_needs_probe(aux)) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.44.2

