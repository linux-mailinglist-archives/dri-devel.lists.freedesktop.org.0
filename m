Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1300A54C94
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3E10E979;
	Thu,  6 Mar 2025 13:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0zsmChp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FB310E977;
 Thu,  6 Mar 2025 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741269014; x=1772805014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mGVwsmqbs/gtga4UrpRZwj9xvxrwXdk+alAgnU0TV7A=;
 b=h0zsmChp8Gr0yq4bSgtQ770xgNSdS4RnzeibcbMB9RHN5OdbOXxud9sq
 LyIAmkebwA4o8vKDiud6rE8GVTrxtG5Lj7XI6PcFZrF7Ijv01c+LqMUPU
 R1kGylE7QZp2pcQ8kffoY1wTTT8muE5SIvZ3v/A4ZTRsWPzyOmzmyRlG3
 hF35GZ1iBHYKNVjDO/0MIU3b1i4hUNzvq5wcZfGSw0e9DNsE68C6PMAG4
 QbyH64M1T6qOEw8N5QNoGrS6TT5Mh9sQ0B2vvehVn1V79+YkPwt9YTHqb
 E55PIBLsFO8pem/Pj+lcX/5wnUrHCQWA6uafFVVbnlKzUdzxSnx008XXc A==;
X-CSE-ConnectionGUID: JZDEJ7A/QrSF0RwwDGWq1A==
X-CSE-MsgGUID: YIL5ETS7S3ae/6sNBlYyzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42166483"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42166483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:50:13 -0800
X-CSE-ConnectionGUID: hjmUUqbHQti7Wu3L7pTCLw==
X-CSE-MsgGUID: wIrkagmPSSGm8DT3CSqm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119542943"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 05:50:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 05:50:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 05:50:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 05:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEpAnNIOwlc2WGMKcN39950O7WA0GIQHv/+HRnFvWcNGuL2aSkt4swAvNMWhInNKgwEcFERO+dYCVwxYs4LigyHx2nOVFF69pXfCWD9ym6hD9UGRjlsrjGe/cW47GIIuWxINu87jMQ7XUh3kjreVEsPRtWGQH/XUPs48jce+X04bR5Tv3fqM/XTWzdpmVdFcnxF1xzEju+mapLjVIdXEDCucZwS4wF3Y2/9CO/1N99Q/MhxkWzrNBE1wOh3TlP2zU5lmHfdjdq2ymfOr5CMbank6kroOg8QjdbhSbdgp1FFDLHh1bitlDWaKWvhDFz2W9HD4nehNJc4IwDDbdsRDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vcHsNtIACe7SRs59gXOV1a94HunQIF03NS5qBsAJws=;
 b=noTyoat94ZG0cx+rmCd86FNjDb2f4ALnJGiooQl8eeCicqtmrWwFafLpiMfFMgAvmOLNKGG5UfvxjaQInHrUJ6YNdSl4gg1S1jpuWEbp8DiCxQ4lX6oYrrVTPb3A+XkFumEyYWkpa5p31jQwGgT/qQse9pLQbJq3x6Gm67/IvrVe7FXQDVbcsF2Ke+GjWw2Eqimrlpec5JInmCEiriCEZUh5Blt4jVQH2VGCT597twaDXlcWk13psmJy8vcFVSycel+fp2DE5daqmA7JInBiyqKnJIUtJLY47uwlzixq+NtMr3YZisZWMIR14Y7V8gaoBc0K9zWnlhs0QFT2Gh1LPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 13:49:51 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 13:49:50 +0000
Date: Thu, 6 Mar 2025 13:49:40 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 0/4] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <rlqufcyrw6ikzhqzmratqxjabdj254h6g5yq7xivepj33bmtbj@ihdqk6bphvdc>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
 <3de2rgkr5lwzqs2v3rvmyds5zsjtj4eoitsojs5kd4bl545nn4@rzkcinr6f2bi>
 <2748512.BddDVKsqQX@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2748512.BddDVKsqQX@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: VI1PR07CA0158.eurprd07.prod.outlook.com
 (2603:10a6:802:16::45) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH0PR11MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: bb471c6c-517b-4c15-a2e6-08dd5cb5c427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3VFTk5QZ2t0MFV1YS96WStWak9HT0pRR2k0NkgzMEw2K1o4bmI5OThVKyt2?=
 =?utf-8?B?dkU2N0Ntclp1YU9xWHMzVUVpM2ZJdXFJS1AyR3pENUlndTRlaGhmNTB3bHBi?=
 =?utf-8?B?b0lSSG9sTHhkMlAveDgyc2Q1MGVpMnBjMFdyNjQxcmlDeFgxRnRRTlgxVDdP?=
 =?utf-8?B?WDZjb0JicVBFRGxCM2M4bGFMSCtTRHNCbkMzamtZTktCT2QvVkUzdWF4V2kr?=
 =?utf-8?B?ZTRFSFh2UCtkZ0h5Tkk5Rm8rNjJyMExUdTdKRXNXK2lnbzg1SkwvTWlTbkZn?=
 =?utf-8?B?aCszWHZ4dEw0NE9YM0oyQys3SW5pRVBWdmUvbmtMWWltakNoMy9HR3JYelh2?=
 =?utf-8?B?cU4xRjE1dUxZMTNOcXJsK2JmVTNZZ011bVhoT1l4MHI4U2U0TmdQY0NiM3VZ?=
 =?utf-8?B?dnlGbUx2cnEwUGdZMTNPd1FuKzRxdTNzam5SVXY2YjlQSGNzWGMyaGcyR2Jy?=
 =?utf-8?B?TkNjeDBJOTdGSnlMcHFmdE5HY3NMVEVBQWorQ3I2MDVQcUhTem9PUGFxdGI2?=
 =?utf-8?B?YjRRMmtOMWdQdGY1LytTQXU3d0RyZXUzMlRZRGIwOVhZRWJNSjRjL2ZlZzY1?=
 =?utf-8?B?clVBRmR2Z0FscFh6dG1MZ0hEaDJCd2REUEQydDJQUWFUeW8wc29EZ3hWRWVh?=
 =?utf-8?B?S3cvdnk0dFB2eTZhSUNFRkVoRXY4clBSbUNaVlNNZmRuWTZsaWtiTG1xNS81?=
 =?utf-8?B?UlF6OWZZNjV0QkdlRHhjWk1uTGgybVgyZW5acm5yZkNmNU45cG93WjBuRzVG?=
 =?utf-8?B?NEtSSHdyRk1oUmVzRisrY0FFRjBpZEJ5ak9IYjBRR0xwRzRYQ2QySVN3dGxO?=
 =?utf-8?B?dGJGSnlZeHV1NkZRb2hHdUR5ODBJb21qa3dHQjZvend4OWF3ZDBZVlJtM2xx?=
 =?utf-8?B?TGRSNGlZeVhOMTNBSTFxdG9TVGZycXRNbnR3YytIdlhrRngvaEk3S0JPUXg3?=
 =?utf-8?B?MTlabUJSZk00SlJEMThkSkhOcU9yQlpENDJaT3pzZTJ0bzJFQzJCbWdaTGlD?=
 =?utf-8?B?aE5VdkgyWnpmVHJSQjRYNHVqUlZWRlFHMis5cHIxKzFxakF2bmtuUE4xc01l?=
 =?utf-8?B?RU1KVzJMNnFYaHdTNVJxUFdMaVBKeHFWRXIwVU94NHVMeVJYckJPUTNBKzNs?=
 =?utf-8?B?NDY2Q0FYNTlhb2RxbHF6K3BIL3QyZjE4UmxqTHZmRmhYNnRyWGJJUmlBT3B2?=
 =?utf-8?B?aWQzdURxNHl2am1wTmdOV2R2ckthZVJibmhMQXJLY3RzZUpMcVNTcmFPQ1B6?=
 =?utf-8?B?M0NUTW9FK3dFZy9STzZYWnhOR3hhZGZ5ejB3Mno5Ukh6RDRidW03eUw4SWNE?=
 =?utf-8?B?V2dEZjY4T20vSm5mUFZyOXUrTWV4bHNIZ2krRWVXNi92Z3ovUkRmK1hCOGRy?=
 =?utf-8?B?cGRVU0J0azJadVFxQU5yei9OSDIyZlM3VE02TWticXhKUjdKc0lrMmVoSjZD?=
 =?utf-8?B?Wno5MG9NWEVJRTFyRlBWTExibTlLUVpBbUxGd1ludWtzWmRGc0NVUU01ZjNF?=
 =?utf-8?B?Q2RQSktKYncwbmF0c0Y3a2E5UFNwTHZJQm5reWhQdy9KeVpKUC9Cc1AxM2hn?=
 =?utf-8?B?ajhzRnhTQ2JqRlAwRFdSZTRKdzNBaXVzY1ZzRFVVOENPb1VQbnR2OE1peEp2?=
 =?utf-8?B?WFJhc2M3RXJDT3pLUStvck9PbmJxdUNOT1ptQzBIbU83dThyemVPU3VnbWRD?=
 =?utf-8?B?MUZBMTE4STd2ckRrNDlpWlYwMFk4SFBvQUx3ZDVDbjgrWHNJKzJDUHFXakZK?=
 =?utf-8?B?ZGFac0hzRGJhV2hUdzNrT1dOd29pRVdlTDNheHRMVGZ0UEhuRFRwbHcwMzE5?=
 =?utf-8?B?SitiVkFQK0JEYXRnN3YyQlFRVmJDL1FJbE1BbzFmNEZIU0JVTDRNOTJTNXk3?=
 =?utf-8?Q?enDypSlHgzuH+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlg3Z0s2eGZuZmN4ZnVNMFVZaFZ6Nzd1UDhXMlM2Z3dZNndNNUpESWpFMUpx?=
 =?utf-8?B?WHhrUWQ3S1VBSzZnRDZGU2k4QnJXdkloL2l2QUJCN0o5ZlNCUjFnV29KenB4?=
 =?utf-8?B?Mnl5Q0pVN01MZllLT091RDc3MWYzVkNBTHJ1cWZleEV2VXgxOHQ1T3F4Tks2?=
 =?utf-8?B?WDh0eEk2RUI0VUdZRmpCbEQ5SEgrbU05ZDB0a3N4YmFreFFNZmZ3NksyT1k4?=
 =?utf-8?B?eHEyM3prdXF4WUt5MzJjY21yUU1xVGx6V3YrVENWaUZWOGdXNzFIcXJLc21m?=
 =?utf-8?B?SjU1blFHbk5vSFhPeE1aaTNpYTlOdnJmRG42cFJxd3ZVZ3loUlB1QWxGL1Vk?=
 =?utf-8?B?NklVWGdtblNiWGU0OVpkVk9kU21iWVVBVlN4dnRKNWs1MFNnNE9nTGsxRVpr?=
 =?utf-8?B?UnovLy9aTmJnUHdiMXhlU0pNVUJNbVFIRmcyd0hYT0d5a0VDRUhHOG80SlNO?=
 =?utf-8?B?VDBoa0x2ai9IeC95ZlRiZ2U0THZjd09JYjc2cEJpTnBLQWozKzZmSVJydWxs?=
 =?utf-8?B?cmtEVE56QkM4czM1cXZjMmRNNVdwbWp2QkROZGwzREJkTFplNkIzUkNFVG14?=
 =?utf-8?B?cFNnbzZSZm5LNzZBb1JicHR0T0hZcFdTWklLK09BOUlZNk1Ia1hCZEFHcW54?=
 =?utf-8?B?SDVhSEVWUHZOM0RjNU1ZN2h6Tzg2QTFCSkN3QnhHQVMrNmljUU9XVUVkYnJv?=
 =?utf-8?B?L1Y4Q00vRXpyZGNuSVRuMXBrY0N4YzVjMFBNdWNCQXdzc2ROV0l5N2tqQnpQ?=
 =?utf-8?B?alBQWTBGWlJod0hpc0trcXJ3aXpiSStZbjZaTC9ZK3N1NHlyS0RTN0gva3pC?=
 =?utf-8?B?K2lQVTNPemIxcHkyVmRuOGFGUFNNbU9VQmYzWDltTzVVQVgzeHl2T0FFdTUz?=
 =?utf-8?B?Z1RYcmcrSW5WZkU4SUFhVW5kdDFUa2xMU0twVTMybVdZcGJRQVpsMFBObDF4?=
 =?utf-8?B?ZGg4elF6RzNDdzZ3Z3N4MkdXdWZKZVBvNDFlMzgzRjdqcW9kQ1J6MjBBMkNn?=
 =?utf-8?B?K2JyNVVvczNxWmpaMHYxUVZhbm0zWU8vZ2piZXdiUHhnZ05OeHlzazUySUxm?=
 =?utf-8?B?ZGZYSkd6UmJwbXFKUHVMbnlxS2JObG5BSWt4RmR1d2duK3pobndXa0x0SWgv?=
 =?utf-8?B?dGtZeXhmVk9ZRXpnTzZWRkdaUVNlUHNVQVBHRlVUVFAyUXNWYmlQMVF3MTlv?=
 =?utf-8?B?M0J4TjVGK0t1KzhQVnhpKzJBSGlkTTNZQ0lheERVTnhEb1dGbEFiTzB2VUhr?=
 =?utf-8?B?TWlEN2JiUzRDRkpvSitYekxHbUUyVXNtSkFoNGIySTdDYVZkY1AzUVJoRStT?=
 =?utf-8?B?UTdxTTFQNXM5a1JIZXcrWjJVSjBjNHdaWlE2Z3NZdnlhcStxSlpQWTNPalRG?=
 =?utf-8?B?a3RkbDZmcjQxcHBsblB6YWxwMWJlcnltKzdSdlY3RGJ0TVJheU5ra0xtTDND?=
 =?utf-8?B?K3c3aTBLMkNIWDRRMTRieEtPb1E4V3d0Vy8rVEpLbXdOS3FacWNNUFAyQU82?=
 =?utf-8?B?L0hxNmJOQ1NnL2hCaXVZbGtUZ3hNeU5FRUVpWVFxenYvMnpscUpxdFhzOGRB?=
 =?utf-8?B?UFhCbVVtOVJLVXo4WXI1WURINGUwSmVwSEMxeE92Q0xMSk1uN29ndmxxMy9t?=
 =?utf-8?B?cGtXRG91ekxtLzZRTG1vdWFZdmVVM2lPK2FMWHR1dlc0dkpWQmpHblg3STlJ?=
 =?utf-8?B?ZW5PV1ZjcjJxRHpsdVROYjByb1ZzRFc1eVBldVBOdGxxcElGYnNNemxDOUNz?=
 =?utf-8?B?UUkvZmRpMWgzMkpMb0RDVFJCb3V5V2RBTTNJK3g1ZGVvczJWeE10SWtOSEFC?=
 =?utf-8?B?VUl3L09uTXBnRzhXbU9nakpwUUVIRnprbVllMk55aUZBRk9NRDFnK0R4ZXI1?=
 =?utf-8?B?dHNaTU1SOU9EYUpneVQ0Z0VTaDFaWFM4VHA0UFJWdUNidGMwZDFiYjRmZUtR?=
 =?utf-8?B?L2ozcis5cUtHQ2UzNkJxamd2STRPbzNHMlVZTnpyZFQ5WDFPNzZSeGVkQ3dX?=
 =?utf-8?B?SlNWVHFHc2dtL1ViVStmK3NhUFg5dGR6c2c1bytDRlhDbnY4Tnd6am9uUHVV?=
 =?utf-8?B?T0o5K245K0Q1NVpPeEs3N3pKN25URjBmU2kwaUZNdTZ2aXlDaThmNDN2MXIz?=
 =?utf-8?B?N2lnM1ZYTmN4dkYzWGRkdTlZQ1hsSmJtWHRnZjJXcWp5ZjdGY2JWOHlSUWRR?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb471c6c-517b-4c15-a2e6-08dd5cb5c427
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 13:49:50.9173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNkTFsYkeHF/TtcCZxFrpbwZyvviN0/TwioXV2q0lscr6BqZ6yJO/+e/LHIULv2kYQLfuOjZvEmpdzQclB7vqdXDbrYOq/uz3ogUEapmwQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
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

Hi Janusz,

thanks for a quick response.

> > throughout the series you modify the code right after
> > introducing it. 
> 
> Yes, that split among patches reflects my way of getting to a solution that 
> not only resolves the issue but also tries to address comments I got and take 
> care of resulting code clarity.  That's why I mentioned the possibility of 
> squashing one or more follow-ups with the initial patch.  Patch 1/4 alone is a 
> minimal fix that actually resolves the issues.  The rest is only about 
> satisfying Andi's comments (patch 2/4) and simplifying the code (patches 
> 3-4/4) that we may or may not want to apply or squash.

So this is more about an optional cleanup then. If the goal is
to get all of these patches merged together, I think it would
still be a bit more readable from git log perspective, if you
introduced the code in more straightforward way (previous review
comments on v1 and v2 are sound, I just think that doing the
cleanup first and then applying required fix for the issue
would result in less shuffling and smaller delta).

> > How about changing the order of things a bit:
> >  1) order the functions in a symmetrical way between
> >   register/unregister steps and group them as you see necessary,
> >   (At that point you would not be fixing the issue yet, but
> >   prepare the code for further changes)
> 
> Please note that I still haven't achieved full symmetry.  If I only had clues 
> from authors of patches that introduced asymmetry on why they did it that way 
> then I would think of reordering the steps to achieve full symmetry, each in a 
> separate patch, together with meaningful justification and possibly 
> alternative solutions to issues that asymmetry was trying to address.  Without 
> those clues, more work on analysis and more testing is needed, I believe, and 
> that would be still more beyond the scope of a quick fix I initially intended.

Fair enough. I didn't mean to suggest a full symmetry here: just
as much of it as you are sure will work.

> > 
> >  2) then introduce the new flag along with all the labels needed
> >   for clean unregistration.
> 
> The flag, or a single global point of indication if device registration 
> succeeded or not, was an idea suggested by Andi, and now objected by Jani from 
> the display code PoV, so not a final solution.

Let's wait for Jani's opinion on that matter.

> BTW, have you seen v1 of the series[1]?  How do you find it, compared to v2/3?

I think the flag is more explicit compared to v1 and the addition
of cleanup "by the way" of fixing the actual issue is a nice
addition compared to v2.

Best Regards,
Krzysztof
