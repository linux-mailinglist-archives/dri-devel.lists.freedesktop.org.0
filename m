Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7038A42525
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141BB10E09C;
	Mon, 24 Feb 2025 15:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNK1qGwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E2F10E25B;
 Mon, 24 Feb 2025 15:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409531; x=1771945531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z8VtMlk6QBkcndmx4AxlczUinV8K5Rrm4T7hBjhY8RA=;
 b=jNK1qGwkBRvHhxmS/g4BYyq4d4JBCBylw1IgwvQ3RgOrqd/GVzUlk0xL
 udRPoJOAsV96+whxzx1Jb21YHzr4sOZQofe3TVhN6xNyP/01jawIscXNK
 rikMGatXgcoE/u20oTxwKGdDtq2TY/5vpvwCz0UUX+AzIkPYaTRW/tXIs
 ByW6gIVywxLfYcO57zCRnZxVRKRX57PHmS1IBq5Rdv4lNk+jkJnETsaPz
 10NkC921DhcCDJPuh57L+3TmJq1emt4QzA3eVMk80hcwoLgMO13shYPzh
 sQorFVhz+zNVF/9a1PKmEPf282O3qxv2X8CWStxGsa3neUtpe0ssGbrIC g==;
X-CSE-ConnectionGUID: 6RyLxKAqTJ6sh2PnfUin1g==
X-CSE-MsgGUID: SN+kMSU5Ri6RhUvFQx0LVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51795804"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51795804"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:05:31 -0800
X-CSE-ConnectionGUID: Aoa+FoeCQqy0694mV17nNw==
X-CSE-MsgGUID: cjL7zxXcRrm+4ddo5B7Zjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121044970"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 07:05:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 07:05:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 07:05:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:05:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtvN6etiit11kx12MpECJ0sy/2YMQCNdScE6vYLUO+4VCd5ys7icAa6nzugOxyOlvAbaDWjYKmDLnEG7mPawvkqNRpc3ZcFcwbgfK15InVBXgffcwwaRTh7qlxExYqkav4dclVHaS8iVvygQevJK02B6sqJdiiygpOFQe1HtBkRBWxHg2aNHcQyyOLyQxfQPHmwLm0Lw6CzyrkVfK5cTJIkt6c5jwKEZDaVjBX1JGpv4HKUFIhlRfGTbvhqabyaonb8QbtUf2kcwHBlth2tqM1QP8F3punrkpI34pJmWvhTvq1TZCyXhMMGaCTqfUdJUWRSc/BXCz18zG/ccd8kkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpbuee7b1Ei0FZxcT5hzkaJTSmszR89rqyQRyEAXn6g=;
 b=MfhmrKqWDEmpYN4BiZwbF2RGHIGqY7/umFQu11bXEkgXJUdTKlEeRbkgL903ZjrTDjMITHe0FI36PI/4mKpfPuN29r5pwBWnos7ASuMlqsgUQVJcBRxZBG6cADT51hmGmfEfhHrPja9RXro4z1ADMJGxkyiL/XWC7z/TK6pMGHpUevjoISAWJSvOlmXYjNLmI1lnC9aIAriaf8HGLm6h+coXSPyBSN70/M/W29WskPFWd8GxE2+907JzG6Jehmv/1dInZy50O7VH6OW+aLPKgtNKVF8UDtxXqmjBiMqJHYpZu/qzsm6K3Cv1lzOqYbHzLz0ZYJWl9KoXRJOtDrR5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:05:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:05:22 +0000
Date: Mon, 24 Feb 2025 09:05:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <da.gomez@kernel.org>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Justin Stitt
 <justinstitt@google.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>, Klaus Jensen <k.jensen@samsung.com>, Tamir Duberstein
 <tamird@gmail.com>, Theodore Ts'o <tytso@mit.edu>, <gost.dev@samsung.com>,
 Barry Song <baohua@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH RESEND v3] drm/xe: xe_gen_wa_oob: replace
 program_invocation_short_name
Message-ID: <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a538e4-65ab-4bde-c72c-08dd54e4a945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?87Gtw3DbsI3puUgQlak/SqRInHzYnla/IF9WLEUsriwwli6N2f2zTI6Ln6ZT?=
 =?us-ascii?Q?0sNv6Y2JShHrbeCN7V3IEqnLAzpoyCPKEa/LJtSdewd2DhtEBNpiwLkJsF7X?=
 =?us-ascii?Q?437oeEdS7GmKocgkriH+Uo58I4ofi8tfAjVvz+ZCficnVwjRmFF/DzZGcByN?=
 =?us-ascii?Q?2rjB/Osxu7pymeQTqvZAWoMCvMgACGgNGo1/6BkLrTHEK9gD0oYvFOxl09ny?=
 =?us-ascii?Q?qXDfD02akC97UnXeQpY011lz/I54+xpz67eWPHlqG4RK3aL+pUNlRgfhH5F6?=
 =?us-ascii?Q?JuC0fFO/bACxOYPTCxIKp9ROEayS/j/Z4qZptJRIXZEZV6bcCOrOAFJlsAIq?=
 =?us-ascii?Q?4gU3UbzvpnDdKtxzJYSkAPLTCtyilYicUJ+/ChGIHrYA7jD8ksKh0hPD6LkN?=
 =?us-ascii?Q?CE1bIaZCkdQsSzoJjGGHP+rmBOyY47YKIkrl/eE2FyGSmhDAuWdOZ6+IrgQ3?=
 =?us-ascii?Q?fs68IEG9dXDts91ynazfTdA+KN1yHz567WZGtsvMiH6Tz4btNSPeq29niluC?=
 =?us-ascii?Q?uW+wAMomLl1ziGmlYIkIboF/6mfJZHGbjL42thYyS1mxScWofd3MJwmG9fRw?=
 =?us-ascii?Q?0zlIld60/FhhEK614kEDbsLiAPf1q2TCYVsRFe890AQAiC0v3fuvlp4wckin?=
 =?us-ascii?Q?o+R/mlSpqrvJOlF2NKyhqZkcVb3zOr2y5Hp/daPN7IjQ/rMPMUue4qOtXIrS?=
 =?us-ascii?Q?v2ZjLtAIe7woK/yXp92QpZ19PpELNAOg4J/y/v9Ds6N2KGmuNN9biLYEiZMi?=
 =?us-ascii?Q?Dv10cpfizOh3YIE3qtvdPN3nkO8EhZzW1GKDYODoqDckK4Vt66zIwQRcm8D8?=
 =?us-ascii?Q?T1Bw0pBCzLPzfY/U/Xo++v1XPh52FkpRLOrf8r5tUN9b/F1NOkOh3bqXmtdO?=
 =?us-ascii?Q?KpoKI9V11ocDsfRIaQ8ZYz1fkrLjizmoRSm42pE5xTjEr54nPZELY68CH/g6?=
 =?us-ascii?Q?I5q5JXQWMsVR0xq3STiSmfqQAdQmLmDT7CrvFGVGe2tdgpRN980OQSgleyb6?=
 =?us-ascii?Q?wYnQoHneLaHcP+T0HNZcYFuLApOKc1APkxV7ZeFgXCHK1QfZUsTAKqiiUZYe?=
 =?us-ascii?Q?+Uf9yjqxrDymMsUZ6dxtdrJrsed6C4PT8aMGQ44hTUObiSVURflVhiBMfuHm?=
 =?us-ascii?Q?JtNO9gQoZpCUDNfV6Uz0zP6XuYNzM9D4UhfUmT0YcRf80OsGQqTNDnV933b3?=
 =?us-ascii?Q?lJR6M9dUbfvwTWZI5bmSpIRT6iJJtcoPzIacWMmcHrLYkvaKPV5WZdUOTJYF?=
 =?us-ascii?Q?R1T9Um00Y/w4a2ACszFYXkpm6JWzHuHI9eW97nmFjr1daJFewlTfZHGouHVi?=
 =?us-ascii?Q?ZJpIZDAdD2X/Pet5AqDXTlbmFzfdVWbUC8y9U+NWQk9/pTITVJeySiqp2Puk?=
 =?us-ascii?Q?VvVkRHTWKqiXMu6E27D9duSUuXZ37UzdA9SFdvNTgMa/TY1I/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RuznmS5J5DCDEadHcHSt6mGuBl9JvQ7VPGjShRybwvcPd4tlh3f14fxT03bj?=
 =?us-ascii?Q?T06flZItl8rFChtZsGM0ceQuqTBMp2/i9GoXWjK3U5sNTJE5CLfuReYGy0fp?=
 =?us-ascii?Q?JxU0h+wnF3fUDJD8+XKHxVz0uFh9ZlF0GSUfxMmvSed5rQLh7XbDK32bbhSn?=
 =?us-ascii?Q?JK14aXWTKXHMCAZXM7vOmigf1am/HDEIEBYeVCYJ5pOIi+tN2PIOgpUXk4hH?=
 =?us-ascii?Q?/NWF6hSoNHLrkPPMb9cO4ZpXqqGJsRpkXDPorSquWb7rpIPi4tmfIsk1T/jc?=
 =?us-ascii?Q?4KOUEr92ag7VoL1+yL6b20GDA8rRhD9CQcbYU+8zJw+ksqO4rMy7NYLlbpFs?=
 =?us-ascii?Q?gphWLl88FEvpHCL3IKIQo5DGToRYSEjnuA5dBlwpnQB6pERgPfyFjYD0wQA7?=
 =?us-ascii?Q?34v4aqoXzefEoXJ8ZGuUtTGGdRK9dYuD7VNVPX0r1iRpv5qNzfTnehiKxtRW?=
 =?us-ascii?Q?L9ZGqo+3DcN1HsSsDFp/B1u+ZKmUWadtutqQvZ/ucezLHb+njqCIN9g3rcZI?=
 =?us-ascii?Q?MImVcAs4fJeIwzFE1FW21h0F2w4vA7xdDtfM9gOAyfnd4NuUVvpeRTsl7zYB?=
 =?us-ascii?Q?Wi96rBdMvlPZgSXCcBoPFtfsZXJmN2xTzkCBcnevLlxLsF3LzsdQQgEE1AVr?=
 =?us-ascii?Q?J591+ogPuwy0BAf9NjUmoBhH35PPWUtX7TouD2neEFsjkzgcX3XkH/K9qufU?=
 =?us-ascii?Q?9xvE+xkopfP+MWWVK1ywCDjNH8dV5RQtHZPOG/mFV7VSZ7KC/spxUJPiSpua?=
 =?us-ascii?Q?TdyC4OIXHgxOoQk45w1KNsmoEPlozJD5MN4Lr8EpvqrVSoWLhk4w2DMEnV+6?=
 =?us-ascii?Q?08gfOaQ1IUApXidkLQQVXOzPzhSRkRrFOxDc4Ye44UUkLA4J/hdsyz2A+srr?=
 =?us-ascii?Q?DyllRnMGtbb4Oe2RCabknD4W7wUF2ZEVmkoqGv+B9i71AyEV8eoDxOc40T2/?=
 =?us-ascii?Q?XyEXORnTMc1Z53w8yqZM9UYZuk7yOPYOVEbCE8cgGFGHCoJOxtPsIr00zRxE?=
 =?us-ascii?Q?X3U45nPYcVBeN+pHTpxwxrfE0kxqhntdUFsvPQhF7DbWdQzmsQMoA2ueBIzE?=
 =?us-ascii?Q?YNOK1XnDjQU6hfGgNHcGQIB2jHL9WJ/F9al90X1OzKhpIvFPQC63oBGDIjLW?=
 =?us-ascii?Q?5/JSa/k9WYGs4tB00iRTYqpbgZr36ByYprVqJuRoLjieR3p85IlUJmYchyUP?=
 =?us-ascii?Q?vaUqy14+Tz9a866+HoJ5LYa+/ELA2a/8Er+kyfDtnn9jsX/Gtjb1L4tA+XqO?=
 =?us-ascii?Q?clcbopx/VJt7Uo/KFC5mKyXtbuLq2PujMjIViH54U2EctEUU1rK0CA29ez1f?=
 =?us-ascii?Q?EDW6sgehPKsidE9leCEoBPpS4tUg7+sEVGv5OlFVf5JyASeSrXMsPy81qrbR?=
 =?us-ascii?Q?54VWdbJ+w2IvqbqJxGtoN4imSCsWOKlFkSBJHmWw/GoXwdGJPt5E58Vb2WYD?=
 =?us-ascii?Q?Y4PISb24kj7u+RHLMuqwRvbQNJF/JpHeOIrui2QWY/5L9Dsptn+XZrKyggte?=
 =?us-ascii?Q?Fhaonizq2RxIxSm1DiB6y74YYYelMK+kPA6jIIDVMcOjTZzUdP0Ezfbb2E1V?=
 =?us-ascii?Q?6NBwWmdvV/5VUjzKX54fI29mxjUJEbZmIkHdw2Hr/CMaOY94gSP3RnDb+jDz?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a538e4-65ab-4bde-c72c-08dd54e4a945
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:05:22.7616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssWsjkvkt/7OMbkEsVHcsoOdrwJaT/Sdc6IcijPlXYz7tIqm87Z2qhFLYTbxPtu9h82pZr65SNxaBBhQUjBdRW4wWOBRnL8aLacc8BTCpMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
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

On Mon, Feb 24, 2025 at 07:23:13AM +0100, da.gomez@kernel.org wrote:
>From: Daniel Gomez <da.gomez@samsung.com>
>
>program_invocation_short_name() may not be available in other systems.
>Instead, replace it with the argv[0] to pass the executable name.
>
>Fixes build error when program_invocation_short_name is not available:
>
>drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
>undeclared identifier 'program_invocation_short_name'    34 |
>program_invocation_short_name);       |                 ^ 1 error
>generated.
>
>Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
>Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>---
>This last patch allows for building the Linux kernel allyesconfig target
>for arm64 in macOS hosts with Clang/LLVM.
>
>Summary of previous feedback and work:
>
>Other Makefile targets, such as defconfig, can already be built
>successfully if the necessary headers are provided and the Linux kernel
>build system is configured appropriately. To facilitate this process,
>the Bee Headers [1] project was created not only to serve as reference
>but also to document [2] the process and supply the missing headers.
>
>To get started:
>
>1. Setup:
>	diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux
>
>	brew install coreutils findutils gnu-sed gnu-tar grep llvm make \
>	pkg-config
>	brew tap bee-headers/bee-headers
>	brew install bee-headers/bee-headers/bee-headers
>
>2. Build:
>	source bee-init
>	
>	make LLVM=1 defconfig
>	make LLVM=1 -j$(nproc)
>
>[1] Project: https://github.com/bee-headers
>[2] Documentation:
>https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md
>
>The changelog below has been refined to focus only on feedback related
>to the xe driver. Version 3 was submitted some time ago, and although
>some errors occurred in CI, they appear to be unrelated to the changes.

Is this the approach taken for other similar issues you had? Note that
argv[0] and program_invocation_short_name are not the same thing. For
this particular binary I don't really care and if it's the approach
taken in other places, I'm ok using it.

I was expecting you'd take the acks and merge it all through a single
tree since you received push back on the need to build the kernel in
macOS.  Is this the only thing missing and you'd want it to go through
drm?

Lucas De Marchi
