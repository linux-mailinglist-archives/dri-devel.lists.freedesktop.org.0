Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE17C526F5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A323210E711;
	Wed, 12 Nov 2025 13:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n15I+M2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C0510E090;
 Wed, 12 Nov 2025 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953772; x=1794489772;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=R85e3svg40A6sqtZa0a6KAFT8SAIfZoEmJf5Vy/0M+A=;
 b=n15I+M2WOEsXWNBOB5NvegnBKKCbcFzCluSIZZwnYOtLGww082ViQvlL
 LK179wcAp6CH9lsevJTcpuYll6rvMReiURMWHQNiV/Rv+rHhwwBKJSzex
 zuueIvjNiOgU4HltKS2tX0sHuRuZ+A9FfMPh1JB75mLrvUeIPsCSN1Hjx
 d6ReG6I6FMSImJ83Rtpq15hiMKwWxBY7sJzA4iHETXYsOqav1uF1OCp09
 dON1uWWf0Xpfpf2r7ceMyK3h7Vthd8SvAVO+O4DGHSEtewVgDoMrBj7Xi
 iCswbnPYSfEZ3j4NVzS/hQpSwHt/swPT3le69faY0lFysHW4YQLtFeBfM A==;
X-CSE-ConnectionGUID: /hPW/6wRQYm9jFxjmsx8UQ==
X-CSE-MsgGUID: i8ak+DJlRkqmenGEwzULpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64219363"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64219363"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:22:50 -0800
X-CSE-ConnectionGUID: StWw/hEKRR60Sw8ktYsQHQ==
X-CSE-MsgGUID: HwQ2DJhgRSC/S+WHam9QxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188508246"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:22:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:22:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:22:49 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:22:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSvB/FX4YF+gJTziu1StDHiTPaQGQgiD+KKmmreiRudMn8W5UeEwxc+aaqX214alcrvb5aWMS6SRfhgHchD66IYgBCgjKclo4jTdy0CI3O7U+Ea4uyHC2ZrxlHnGh0z39yuoMNQjnb0iXQQ9FnxkfGPvWZXqU9Vmv4qEx0yGViQQGoc6/1QyIfxflrbIruX9/g0sFuMOrGbVNcpkj4ITdrtgpKhenPtK8EZh/C+k+xQ0ZXrSyjxCTKvdetERqWnHSsosTU64/MDAensejoHHKzEN6ZmIGuz+t6jJ5pvc6tB1JrKPra6aNECSxmlUz9ZCoF92YMCbZxEiCkRXd0xjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGxXCPMmOi+Un2QHTPcK1MR0Z1hcjCpufmiu3CArTy8=;
 b=X28lizcTm+J2VyR4yybWNfRqDuWMTPX2EzutiZPQfAFaSXFX6DrZKITQ1q26eYzAR0fFsBxu5YUwvv/WG2cpxNGQvIws0P4uJXaVxU57z7GMfhTbvkWbgLTM4qogqfX6zoEv/GrVpjKGYiQF+HjAph4YC13sxUWVKuGSzVmjnc6DzNH3UPycMnC5zrgeYMjTsF89cCmlfjvOgSqS2ISDcpjwsjMXZnTlTZjbDBvw0MGZu+q8boWw2T0YnhPdjmnzW2fLogYfp58eZIHWuuG52EhKOYF8BhsjEsWhNgEakfv3N8vPUG1ecn9Ejn1K/urPxWdqzvOEs0Mds05x40Ru8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:22:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:22:46 +0000
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
Subject: [PATCH 00/24] drm/xe: VF Migration - Xe internals
Date: Wed, 12 Nov 2025 14:21:56 +0100
Message-ID: <20251112132220.516975-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 54acff4b-b3e1-4257-c7ba-08de21ee9160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm5uaHczUU1tV3NFdGZ0S0JqRnI0WkMwNk1xOXhXbnlHRTJFSjNTRW9QNi8v?=
 =?utf-8?B?OTV1SmRxRGViV0IvQWQ2bzk0cXhWc0JBaFc1WCtweFh3d0o5TytISlNISUNh?=
 =?utf-8?B?OGhOdkFJeHBCTGRacXNRZGdOSUxQWjhGT1hsMDBZcDlQNDJTUk5zbG9nbTZE?=
 =?utf-8?B?RnRTK04xeGkzbm4xanVnakpDODdMOW91K2QwbmJwVUxueDlBU2NXaER2eWdG?=
 =?utf-8?B?T3ovOFRtOFNWRTlrV3Q0d1gyazlkTmhEdG1LMkI1UDNGdXdGbnlZSTNjdzBp?=
 =?utf-8?B?K29ML1FjaUFGOC94MFhyYXhVbTN4di9Ka05mcFVldlYxZEdZUTI1SlVRRDJi?=
 =?utf-8?B?Tml1L1Q1Wk5NMnZnTTF3TG1ieDgzdE9pWXpCREh4bjZZanArYVI3QTdEUElK?=
 =?utf-8?B?d1ZDQzRCSGpqWnRRZmhoc0tFTWI0UGJXRHpPamREWDhsV2QwWjJ6Nk90M29z?=
 =?utf-8?B?VkhsZ085Q3B5WGJYdGt5UWlMTVVyeEg3MmFKcXRndkU4MjNFUURYNjYvMS9m?=
 =?utf-8?B?emUxOVBOeW44VmpjazdXYmtmdVhBd2Q2emxDbVZZd2R2Znp1R1BoWFV2N00r?=
 =?utf-8?B?UHdzVUJUOHNGMU5qWXhsZjJESkF3VnVwQ25BeFpvMnJZaE1SMWN2ZHdFeGFs?=
 =?utf-8?B?Sm9hOEdZWk51SWxNbWtjQXQva2sxbVUrRVlmMUVLeVNBMWVMS2Z0bnVGVkVI?=
 =?utf-8?B?MVNBZkxmdlB3VzlvL2tHVVlaT3JCV3ZtYUdHOExGNDlpNkN4d3U5Qnd4RHBF?=
 =?utf-8?B?Z3hVd0F2WitSK3QvdWJadjdzYng3c3BUK29VWFVOOUxEeEVUTnQ0WFlpdXBt?=
 =?utf-8?B?MXJEUTVlY1NBbWFuN3pxaWk4bUJReUxnSnpDcXQ5ZU5SVkdFMjR5eFAzMXNZ?=
 =?utf-8?B?dmtPOFlEWXhDM2k1NXNZRlFxMVZSdWRRUFl5L1VyTjA5SDZ5M1h5NFM1aGNL?=
 =?utf-8?B?ZnRPc1JPL2swZERUY1UwYXBMYWY0VzRyWlBRSWNMWVZLVUhCTzVYano5WXlv?=
 =?utf-8?B?aDFVeHprMGRmM3FpanF1Q2VVb0dUQnJhNEdoVlBtTlFjY25rNUUzcHg3MFhN?=
 =?utf-8?B?NnZmbnJrakhJMGRxL3J5QzgyRmYzbWhrQjhUZ0Rod3FsVXMxWmpXWFFlK2Rw?=
 =?utf-8?B?OE9UdFVMalJHZnJOMlBXUHUxWkRuL1FCcS9zaURoVmc3OWdidXFIM0tZbG9F?=
 =?utf-8?B?YnpORVQ3MWpObllhdS9aM3JsOFlXazlCOE16OFdnalJ1QTkxVHVvK3hZek1o?=
 =?utf-8?B?TytrRnpZTzR3cDlldWJJa1hROWUrUzFJd0V2aGV0aXhONnh2Y3dFeGIrWDdQ?=
 =?utf-8?B?c0toVldTMXBRQlFXazRSZldVZEtUaFkvY1ZXbGJFUkFGL1ROZ3dKb2ZGd1BQ?=
 =?utf-8?B?RThKaUFubVk5TnBwOTZCd3F1bXNzV2pjd3VBenFNK3hsVE5kNmx0SHREbGhI?=
 =?utf-8?B?b3JkZ1NGdlN2emJ3Z09tK0hnNzROQ0Q4U1VCYWFPeTYvMC9ZYnJvVTdVRFpI?=
 =?utf-8?B?TDlsV3IreHhOaURuZDh0YldEb2RKekNSYXJRNFB1VkRVOVJwQklRZVQ5aU5W?=
 =?utf-8?B?VDdyRkptc0w2S0w2Ti9pR1RqN0FTZ2wvek9SYnN6RFkrTjRRb09JV1AvdmNP?=
 =?utf-8?B?YkFlMVowSFgwZytkODRMN2Y4cllST0ZCSk5qaW05UkZuUGluM2F6Y1Z2dlc1?=
 =?utf-8?B?UTliYzMxODNGOWxkbmdFc2t2RzBxR3pqRVBiTTFqNnZraWxjRkJ2ek4rN0tD?=
 =?utf-8?B?bWpIWlQ4ZEk3TkRYMnlxbmVoWngzcDhuYVFvUmgvMEYwc2tudHBod1dSYVd0?=
 =?utf-8?B?Y3FyOE1wV212YjlqTFpiM0poYzVUdS9CK0ppRzd3OEp4WHlTUVRzSXVCQ1pS?=
 =?utf-8?B?UVlwY2tlWUw3MHFEZTFQdDk2WUJ0K21STVBRNkVrNVV6RmNnUlZ5WTVCNWJT?=
 =?utf-8?B?WWR3ZENEa3pyUEo0ekQxUjRjTGRjVHJxcHVMUU5SVmVUaFdGcDhuZGRWMzdV?=
 =?utf-8?B?RTJUWlRLUDNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzZQbWc5NTQwRVYyQ1JvcGdQSEEzcHVCd0lMbGdoalRCVXdwVXc3bmVRS2Qy?=
 =?utf-8?B?NUJUcjR3NG5Nb3BkdThvdUp0TzMwSjBWRGZuYlVnSFZjOHVwbVpvMEE5bjdk?=
 =?utf-8?B?bDJSWFlrRlZjNlVoWkZ1NnVZSjY5OStKd21PcUtlcytUOHo0VW1DV2xvSkZD?=
 =?utf-8?B?bDI4c1lpbUkyKzErQStyVzljNHFCUXJQZjhKOWhWamxhblRzMTBiOEhlRldE?=
 =?utf-8?B?UGRoUHlxa1FpLzBXaUNnRk8ybnNWdU04ZldGdWJYVExXdC9aK2dDM2dnZjBk?=
 =?utf-8?B?V3F0Z1FBeEJVKzJRelhWWGVRWS9pVVpUNmw3dFR5TDk2ck9oZlU2WkdqZzBG?=
 =?utf-8?B?VFBqRjBuaGxtQmxid294YjlUMXVDL3NONnFETkcwcS9NejAzdE1DRkJLWStv?=
 =?utf-8?B?bTA0dUNYY3VxcEhDYkVTRHBraUl2UGg0OVdvdnVSOEtwbkVjdU50ZzBQT21r?=
 =?utf-8?B?dEQ3bVNYTS9qVytnSFBMY3VBbmRLZk42QUp0UGliYzh4MXFDZ2w4ZC9qYjVo?=
 =?utf-8?B?M3R1WUJQQ1FiSjczTy9zbHp4UktGUEw0aDg3KzJsc3R5UVhRZlB5TEZSLzV2?=
 =?utf-8?B?OG5xQjVuaXBYUlZaRVZtUjJLQ2J1eXhjR3VSSWxIYlNNR05zUnJpNEhXdXhy?=
 =?utf-8?B?a3JLQTVpNjhpMXV6akUwWlBNT0dmdXVSR2ZuV2piMjJ6NVoycGdDTVdiVnZv?=
 =?utf-8?B?ZklIblVYd21SdllUWTc3Uk9GcVVkWkk5N0lmOVRCL2Zoc01HUk94TDg0UVB2?=
 =?utf-8?B?VU9BL1oybHM1US9WRGpId0RwQjhqL2Zld1FaU04zQWgxbkhxS01YUTNYSkZl?=
 =?utf-8?B?N3ZSTHpncDdidW84Y1hTaklITVUrMzlKSHc4aEpqVlBDTytrUWhVR2JFSFFK?=
 =?utf-8?B?ZjFoci9KVVo0REpScWFXS0hDc0JXMm9BZEUrLzMvcWczMG83bko2MWZ1M1pB?=
 =?utf-8?B?TkZLYWtwMGFFZHRuMXhGRW5nVU9xeEhjQ0tkR1NkM3pTL21ZbVh0bnFZUml6?=
 =?utf-8?B?S0prdU5CMUxXTzBOUSt5NU0vTXhIV3NOZEFicUtweWUxM2ZwRmw4NWlLRk9O?=
 =?utf-8?B?N2FnTmNZdkN3QTVUNGRqMUhOVW9qZXFEdFNOUHp5ZjNwZzhOS01YdGNmUmlV?=
 =?utf-8?B?cjhISzUvdW9aT0MrMUZuSE5FMDIzQm9XV0p5RmRMTUpMa0FGQVkzTjJvNXQv?=
 =?utf-8?B?dFMrY05DTXJ6QXNpOVZ6cm5ZZHovNEpCOU5VOUNaaWlPR1lKRENCMnYxMytL?=
 =?utf-8?B?dHRaNldaSGpsZzZaZjVFLy9DNFpicVhMSnJEQTBtKytNOEp3cmE5TityNlFS?=
 =?utf-8?B?SlpxbHZ1YjR2d1BFRDRucE55ZkdPbTR5S0RSYmJUU3UvZ2JoMGE1Q0dBWGtU?=
 =?utf-8?B?T0VRWmdRNkdtRkluSXRLMW0yU2U5cjJUblFKRS91VTJXS3VIY0dpMUkwYVlw?=
 =?utf-8?B?Z09PMXNub2czV25iNXNMdmprTlZiclBFa09GOXpwQTFJRkFjczE0Skp0NHJZ?=
 =?utf-8?B?dmM4QnlVMFZiMG0rQ1U5WXBRT0wvMGZVV1dvQTJqejNwNlFHU0ZnTWNud0V1?=
 =?utf-8?B?aGdYbGdFN2d2QnR5TVdyS0NmNUVGNjh4YytVS0RUMWZBYzV4NkFORVVta1Vm?=
 =?utf-8?B?cWxvUDRZRHpyRkwvZm03YVgrQWUrc2ttZXFJTlFsbS9yKzd0SXRUL1phODNT?=
 =?utf-8?B?R1dGZkc5ZG84L0hBb3BPTjFWSkRtam94RCswRk5Tbmdpd21MTEVWY0wxZWRk?=
 =?utf-8?B?bDVFUVd1L0MxVVcyWXFGL0tOV3VsSTl5N3pWdkNBbXV5dU4yUmJPYjJlYUhC?=
 =?utf-8?B?ZUkxTEFHeGtjNG5oN1FMdC9GQ3IyeHJaNE1hMGErRSt0SnA2UlBndFppODF0?=
 =?utf-8?B?M3lZZURkMzZsK3ZUTC9YVS9GLzBKcktDcG9aN3I5c1MwRC9BNHNNUVBwK1ZV?=
 =?utf-8?B?NXhMWGxtMXNlMXNSb1NzUkd1QTZuRnVXWEZwak1FcllqSXZCVWoreUhYL2dN?=
 =?utf-8?B?YVA0K1paZ205WkU2ZmR0TGFFZm9uQWdmS2ZsZEtwQkJnYmxFY0dlSjYzalU4?=
 =?utf-8?B?aXNYNVJtQXI3OW83U3E3YksyeUZWeTM2M3Q0cURtRS9RVmpCcmNHdG9YVWtY?=
 =?utf-8?B?U2xvRFFEK2RZQnplNXQ4WW9UVW5ISWlwUWVyWW5pY0xCaFE0M1lBcXNOMFlX?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54acff4b-b3e1-4257-c7ba-08de21ee9160
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:22:46.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqIXwj5iHoea4w4TImhmRf9hmVNxbVp0krr/1IbBgEanMggqzuByl5ZIlfP5lrqvgLGJzTxVEsVbQS1QYpHyP6HpAxFvjkbqO8244XByWdY=
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

Hi,

This is a subset of the series adding VFIO driver variant for Xe VF
migration, split to reduce the churn and allow other Xe specific changes
touching the same areas to progress without causing conflicts.
While the VFIO side is still under review, and there are opens related
to locking issues on VFIO-core side, most of the Xe-related changes are
already reviewed and ready to be merged.
The subset only contains those "ready" changes.

Link to last revision of previous series containing VFIO changes:
https://lore.kernel.org/lkml/20251111010439.347045-1-michal.winiarski@intel.com/

Lukasz Laguna (2):
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/migrate: Add function to copy of VRAM data in chunks

Michał Winiarski (22):
  drm/xe/pf: Remove GuC version check for migration support
  drm/xe: Move migration support to device-level struct
  drm/xe/pf: Convert control state to bitmap
  drm/xe/pf: Add save/restore control state stubs and connect to debugfs
  drm/xe/pf: Add data structures and handlers for migration rings
  drm/xe/pf: Add helpers for migration data packet allocation / free
  drm/xe/pf: Add support for encap/decap of bitstream to/from packet
  drm/xe/pf: Add minimalistic migration descriptor
  drm/xe/pf: Expose VF migration data size over debugfs
  drm/xe: Add sa/guc_buf_cache sync interface
  drm/xe: Allow the caller to pass guc_buf_cache size
  drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF
    migration
  drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
  drm/xe/pf: Don't save GuC VF migration data on pause
  drm/xe/pf: Switch VF migration GuC save/restore to struct migration
    data
  drm/xe/pf: Handle GuC migration data as part of PF control
  drm/xe/pf: Add helpers for VF GGTT migration data handling
  drm/xe/pf: Handle GGTT migration data as part of PF control
  drm/xe/pf: Handle MMIO migration data as part of PF control
  drm/xe/pf: Handle VRAM migration data as part of PF control
  drm/xe/pf: Add wait helper for VF FLR
  drm/intel/bmg: Allow device ID usage with single-argument macros

 drivers/gpu/drm/xe/Makefile                   |    2 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |  104 ++
 drivers/gpu/drm/xe/xe_ggtt.h                  |    3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |    2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   83 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  650 ++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   10 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   47 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 1006 ++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   48 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    5 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   13 +-
 drivers/gpu/drm/xe/xe_guc_buf.c               |   57 +-
 drivers/gpu/drm/xe/xe_guc_buf.h               |    2 +
 drivers/gpu/drm/xe/xe_migrate.c               |  128 ++-
 drivers/gpu/drm/xe/xe_migrate.h               |    8 +
 drivers/gpu/drm/xe/xe_sa.c                    |   21 +
 drivers/gpu/drm/xe/xe_sa.h                    |    1 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          |  520 +++++++++
 drivers/gpu/drm/xe/xe_sriov_packet.h          |   30 +
 drivers/gpu/drm/xe/xe_sriov_packet_types.h    |   75 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c              |    5 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |  128 +++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |    5 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  101 ++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  342 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   29 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   37 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |    6 +
 include/drm/intel/pciids.h                    |    2 +-
 33 files changed, 3216 insertions(+), 328 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h

-- 
2.51.2

