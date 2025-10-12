Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE937BD0373
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 16:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC8410E167;
	Sun, 12 Oct 2025 14:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U59mQzZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C99910E167;
 Sun, 12 Oct 2025 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760278950; x=1791814950;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=YqpbUChYAbcnauAsAKbilzY+4rPbgvMGu+Jfs9PRZ4A=;
 b=U59mQzZAAJR/JE1id5p10LxUd/Ntu1IQd6BvZqlzfjNzFuTsT1d88RoX
 /NFrQC3BIDreUXplBlpHdjFCuRE6O2LTKUTv9FH97CAgGQuVTbu9yHdHF
 zjqXCNOBR06zAlLVnvtKHkOFhbd9YoBUw1M/wEJ/zNeg9fB431b/sm5h1
 uHx7/mgZQFLBZ2uOOFJTZCWRkhfAyWPD5HN6IIsomINHl42usDylt0W6L
 MX94lcmhxQWiScL9A37KSJq2FyUGe0UAd+TERNE2htkwsvZQ3Xx1wLE8m
 SPsqluL7np2mHDJFRH0Ak11+04mY5wvaZGvHInWiMWr59VP5DF7nE/95G g==;
X-CSE-ConnectionGUID: QDOetsFNSciYYzWl/E60Ew==
X-CSE-MsgGUID: T1Ax2oZmT2mLXyUdEczWww==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="85058731"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; d="scan'208";a="85058731"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 07:22:30 -0700
X-CSE-ConnectionGUID: yB+K1ybHRTeGB6cH6rioGQ==
X-CSE-MsgGUID: YjYT//ksR0CEAt9qRoznLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; d="scan'208";a="180504879"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 07:22:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 07:22:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 07:22:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 07:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hG5dNK+5MVUPPVyd5GOxQPEEqGU3s8LCKQsajhPtkhet2Y0qJZAYxAclFj/ws3UcGci3PdnPve6QL2LEVzXXPcwqhY7nK5/Iu+R3DQ1YLM8WrSYQubi2bpZhdiGeVIvGUCIs1u9r+7QQ+VFa4Us/2Tmk6wTlSn3aGuKoRS+Gq+oMPYB6RCmF2k0KAk5DkkIif1likMrcMChDyJYFZn93c5J4WKWK2U1CsQBqxhsyka4VZMh71J42XLbkHHROnk8nIKhgB69WFoktReDb5UM5POQVmoc48/prVdLXiq9tJvOR5Es7svL8em4ld9xJDXhJ6RVFxaLWOZhVWaji3kJOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrmPgeE/ShugFEd0m0M/Gz2C8Mh+X5SBju32Ug0Bx5I=;
 b=uonI41yCHUIuoy6DDFDsWAijxXaz6dXPuCQUv0+E3ReUVq1XaIVa/OLU9v/jWhRyDT2K/wf9Ht3rRmNXZoJr3zZ25hMFBHRmDFRhga3+Vd5EDXCblGzU8D6MV8yQw4NRkVjMWsUE79k0PBLPdv4wA242OwvaoxXK798Qe5ITiEYHEVPMk0oBcVWZwjqjZQWR9+OqiC2gE3fP3mIZ+1M+cgGn122g4b7Cewb5X3yhjt89664bbt91jNA96duiikYGZcVaj3E5as+5dJglmMMYiYrhBod1RQnN5FIOJq9L9gPeEeuA7DUUbH65ZM5s+orzcVZkg7GKNas1lgpkL9QaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 14:22:26 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 14:22:26 +0000
Date: Sun, 12 Oct 2025 22:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>, <linux-kernel@vger.kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
 Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, "Harry
 Wentland" <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP
 compilation units
Message-ID: <aOu5l1EM8PnoKEgD@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251009150621.3886079-2-ardb+git@google.com>
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|CH3PR11MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: f20a7b6e-eed5-408e-f72e-08de099ac493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kt00sA8StgTKrtvry9k6DPh1UmOj5fKPu9LIbqcx614R+sahUsfNxzzWzs33?=
 =?us-ascii?Q?3L0M5nC7QT5sh0eR+0kDauwZyiyMOAZbbUxPnBadzkuTBY8Q3ImKQriJP7Z5?=
 =?us-ascii?Q?+K0g3DgV3+j1Ty5kDUii+38J5MEScpL04Dy75R8a7IuWINQxVnpkr2BJHpIn?=
 =?us-ascii?Q?52fNlj39T148JfOD3hLmG/0c7WdetHXzhu2pwIq5AAhkkEKiOXXT1EOH/Wt4?=
 =?us-ascii?Q?u7aMlbMNfJ022q5oa0ROnIr74Ge4qO3TV4pN+RBr2JDwNK4EpOazuc28wiwK?=
 =?us-ascii?Q?X/kFAr/Gltsornn8oSUhYngmKiUwm4WnLKrrQ2cr7ZYj6sIdD8oGlVHQpuxV?=
 =?us-ascii?Q?ulEBnwqV2ECQo+rN22jWzBixLrqlhEXCMJKACm1+tQq2/OErv+k55kfPgwsF?=
 =?us-ascii?Q?DrzyOuEL03yi4VMvayTQ+OXPmbMjUJy8sMf9RUVwKAbcAUqt0FOKAMTpFpZL?=
 =?us-ascii?Q?21aUuqDKVcjsetUR7W97wTbFduL5tznL3FUHSnoKEIk818uSaZAMKUZ5HojK?=
 =?us-ascii?Q?94gnDWmjUTCBWadCnuc1h29lODUU65Y5TOPGZp2ZFXg7Iy4evhuzQB4q8GXK?=
 =?us-ascii?Q?ntr3KCZiUuOEdPgJFatZYBWd8AXFEUiKlAALDTOzR0FhOURtQUH+kR5grc0/?=
 =?us-ascii?Q?B+VXYqEeIn8wdF4b5VN7Tu2MLZBymC3VgvvxSTILghpQ9JkPWIAsK8u1o7Rf?=
 =?us-ascii?Q?cWv6O7dTDaEayV6YXFKO6W4j4TxFyNEgEKL2Mnktkd2+g/EM3cQSIjNtU51O?=
 =?us-ascii?Q?h89pmHtm10fCbA8CFUIEbrCEqjF49zYfaL4UsOCrLCFxrNpIgd1C1Wo982xB?=
 =?us-ascii?Q?mCNyelYkbpqg8fZx+2Bs3WhWdkGU3sSiFQY+u5Eq267XITo7+bWZZ/QM6tVU?=
 =?us-ascii?Q?D1QKR32AOzfPBI6ErpoBayHqOhswgmJ96zGSXH4yMeynQSkqVmqBnWptqnB0?=
 =?us-ascii?Q?Pi3OUdfPbawFDv1j3PI2C8unPehHoLydKLZSkhtNN6mNod4N101LlkOWPubb?=
 =?us-ascii?Q?s0FoUBOZgf6qy8iD4b6eGz6DZr4CyRoFj0hjuh8QIGDic6a9Wp4IMyL9YpMg?=
 =?us-ascii?Q?3eSJnD8oXJfSIsE58I/yTB2Z3MgGevqfoLSzBoW6w2IsFMagYZwBdQFktqq1?=
 =?us-ascii?Q?bl0K76PpRvI8r4Y1L15I3bdQmDMHnsMG1vG4e9C+F6UXAfWl8KH1i3QzOoot?=
 =?us-ascii?Q?6QXJEqU8id0JjijQINRgkSLCA+nGBn8DV+6XsdxpcOlSiai5TN9gooOOYvWW?=
 =?us-ascii?Q?lfUkf1Lj5CvjbgEG9BSGTXA91JzktnQ9mDXVX9RTnKlsjrwicGd3buJREoC8?=
 =?us-ascii?Q?SahKpWS3/Vp7hYX3QSxhPmzNQ4OF35WikNaysZnS1MN+t0A2CCKhTFY2RI6d?=
 =?us-ascii?Q?dU5n6kIx9c5MD5OwI7K0tmesHGhAg3qXCWNJcRpSSdhRLRz5qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/klI575KobwEIQYgnidnE0LsnDCPF37ZuzG84mjdQ1FD65g+MbAIx3qbUMz9?=
 =?us-ascii?Q?+V0phwZtTHV6x5kJdzdXNrNU53G+u/gKqS4Xr9B3Sj8F+vAkuUflM7Efcdf8?=
 =?us-ascii?Q?XJGRSRxUZw3+9zB6vSUd1ETBnbkq3ZSMORNTsE9W4uOLZ9u+UQ3/ctTiakOd?=
 =?us-ascii?Q?X87rEm1cLLZkG4G3S0DFacoLwCd1bSDIQLW88voxLLEH/I36C3kW1QxKidhQ?=
 =?us-ascii?Q?Kk1zIxZuVVeRyrgUtWK6Vu0SURvyFfb8t5BEjlVz415SUtlqFTyGaJgqkdc/?=
 =?us-ascii?Q?5xy8+U1q3C7wV6tshU5vbBMC0tC3eEHggE6lzJnBlREC+fo+9tIaPvWDuE7b?=
 =?us-ascii?Q?x/0b0HooBC2U9ZOPFbAcmV1OiK3Ni4rkMmdGj/9wrBkP6TTfVXzXgRMepVvR?=
 =?us-ascii?Q?IZj4P0lRMgtsuGOyS1Lo1QDsu6hx5QSTSlju6ott8urckBs6KGiNWR68ifU2?=
 =?us-ascii?Q?6TlPOJaRdXwGJdcPqHi0+y57008ZOQ6sARZr2LQFhK4wTy5IWk8AqQZBRXrX?=
 =?us-ascii?Q?rzX/DIQg5rTzDXovPhXOhKAPn01FgmJYSC0wJurL40dOBVQoFXZmG8YNSv7s?=
 =?us-ascii?Q?lunG5cbV2WGkTlMvYkrobMStLgiPCSoR5w9SUEzOsh+o4aAAQ5XrWfgoy3gy?=
 =?us-ascii?Q?axPdrirh11iHtgJCJn57HmM6I5lomwLbRM5WlRaGKf5ps+9s7W6BGB90ttna?=
 =?us-ascii?Q?tnRmf5oFavL4XjOqUkAJAWWA3zCt14gebQF/dBD35kPyWh6I4DgW3MEDPUUA?=
 =?us-ascii?Q?6xzxEC43PiXznNunP+n4+mqtZm94J13J+pAGduzJYxhzZM8w40Xfud4GY00V?=
 =?us-ascii?Q?B6JrEHD5aYDfQbgTp7PaN1FhIiYdJs2QiHV7fO4IycpcR2PZCKwpG4dfrWZJ?=
 =?us-ascii?Q?IyI2OxEI08Y4zr/MwC2uskwoYMiMJ51NlJ03KJ80noctoghueO2dOfcu4E6U?=
 =?us-ascii?Q?0zHc68P3MuZi6ZW3GAIaVPPuzVALQGSWpbyAQVxp6bmZ201yLJGv/CKG1L8V?=
 =?us-ascii?Q?A37q0ZHaCQBHUEib4PzBqMUl6pdJqvs54LUPqHQq0JTk6x26Gb7k1EyLuAh/?=
 =?us-ascii?Q?VKgzgLOfpmgA9O/g8C8LfadJNtOhYShwdzAN3WUi8sKZGiiTqSEKf13j/cnq?=
 =?us-ascii?Q?+b1eUw3OQWyV56ocAtWujQpF5y8xMWVczpL1JZXk6HEdZ4q5trWwj+WpI+Vc?=
 =?us-ascii?Q?9+LchRaeaAPCGgIW+/sfb8cr9AbDp9cW0edfOdpDs7RyecFB+U8wJHeD1pgu?=
 =?us-ascii?Q?6U3+6EdqrBwuhBqeG/h9HlyrlCvccdzf60uUMQ+OHRw2Meu2m4Qp+Eu9QVcS?=
 =?us-ascii?Q?otXIWMURm1bNyzLj/EBzuT1wCwOSX8t6H4AqjFBO82O7/59wIpKpwvmsKZ2M?=
 =?us-ascii?Q?QWxGjpjSJDgRyKI34qWI3jJur8MhhFo7S6Vgl5mdeV5q8zNU65AuUsqCzWH0?=
 =?us-ascii?Q?zM8IE0GbhWf1KLZZ6Q7YW2G6XTbSOUn6/0/2lgtk4O458UV2H50d+xewAWqq?=
 =?us-ascii?Q?v+nFZGLf4jwOvk1pKgGAMoFPORDSlFuLLZZliVMi+9KKUAZaXWVVJIZGgWhO?=
 =?us-ascii?Q?dYFhSe2AfGhMHxs9xnqOGfH8nKQivPhC9U+DnF7S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f20a7b6e-eed5-408e-f72e-08de099ac493
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 14:22:26.4629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fREswVULYZCz4gFQZs0YQBPohztuLti7WD5YHdOzS0rQxej7uYh5RcA1CsA5gr7y3wI+Q6uJV7ZWuz/vFdpCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/drm-amd-Permit-DC_FP_START-END-only-in-non-FP-compilation-units/20251010-120206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20251009150621.3886079-2-ardb%2Bgit%40google.com
patch subject: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP compilation units
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-071-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110219.Z6t2PJbZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110219.Z6t2PJbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510110219.Z6t2PJbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c:563:2: error: call to '__compiletime_assert_610' declared with 'error' attribute: BUILD_BUG failed
     563 |         DC_FP_START();
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.h:38:23: note: expanded from macro 'DC_FP_START'
      38 | #define DC_FP_START()   BUILD_BUG()
         |                         ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:583:2: note: expanded from macro '_compiletime_assert'
     583 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:576:4: note: expanded from macro '__compiletime_assert'
     576 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:39:1: note: expanded from here
      39 | __compiletime_assert_610
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c:615:2: error: call to '__compiletime_assert_612' declared with 'error' attribute: BUILD_BUG failed
     615 |         DC_FP_START();
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.h:38:23: note: expanded from macro 'DC_FP_START'
      38 | #define DC_FP_START()   BUILD_BUG()
         |                         ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:583:2: note: expanded from macro '_compiletime_assert'
     583 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:576:4: note: expanded from macro '__compiletime_assert'
     576 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:45:1: note: expanded from here
      45 | __compiletime_assert_612
         | ^
   2 errors generated.


vim +563 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_wrapper.c

7966f319c66d94 Qingqing Zhuo    2023-07-28  547  
269c1d1443d668 Yan Li           2025-05-14  548  bool dml2_validate(const struct dc *in_dc, struct dc_state *context, struct dml2_context *dml2,
269c1d1443d668 Yan Li           2025-05-14  549  	enum dc_validate_mode validate_mode)
7966f319c66d94 Qingqing Zhuo    2023-07-28  550  {
7966f319c66d94 Qingqing Zhuo    2023-07-28  551  	bool out = false;
7966f319c66d94 Qingqing Zhuo    2023-07-28  552  
cc263c3a0c9f38 Joshua Aberback  2024-03-07  553  	if (!dml2)
7966f319c66d94 Qingqing Zhuo    2023-07-28  554  		return false;
cc263c3a0c9f38 Joshua Aberback  2024-03-07  555  	dml2_apply_debug_options(in_dc, dml2);
7966f319c66d94 Qingqing Zhuo    2023-07-28  556  
00c391102abc13 Aurabindo Pillai 2024-03-20  557  	/* DML2.1 validation path */
00c391102abc13 Aurabindo Pillai 2024-03-20  558  	if (dml2->architecture == dml2_architecture_21) {
269c1d1443d668 Yan Li           2025-05-14  559  		out = dml21_validate(in_dc, context, dml2, validate_mode);
00c391102abc13 Aurabindo Pillai 2024-03-20  560  		return out;
00c391102abc13 Aurabindo Pillai 2024-03-20  561  	}
7966f319c66d94 Qingqing Zhuo    2023-07-28  562  
366e77cd4923c3 Huacai Chen      2025-03-27 @563  	DC_FP_START();
366e77cd4923c3 Huacai Chen      2025-03-27  564  
269c1d1443d668 Yan Li           2025-05-14  565  	/* Use dml_validate_only for DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX path */
269c1d1443d668 Yan Li           2025-05-14  566  	if (validate_mode != DC_VALIDATE_MODE_AND_PROGRAMMING)
b02b0fc488ba6e Yan Li           2025-05-21  567  		out = dml2_validate_only(context, validate_mode);
7966f319c66d94 Qingqing Zhuo    2023-07-28  568  	else
b02b0fc488ba6e Yan Li           2025-05-21  569  		out = dml2_validate_and_build_resource(in_dc, context, validate_mode);
366e77cd4923c3 Huacai Chen      2025-03-27  570  
366e77cd4923c3 Huacai Chen      2025-03-27  571  	DC_FP_END();
366e77cd4923c3 Huacai Chen      2025-03-27  572  
7966f319c66d94 Qingqing Zhuo    2023-07-28  573  	return out;
7966f319c66d94 Qingqing Zhuo    2023-07-28  574  }
7966f319c66d94 Qingqing Zhuo    2023-07-28  575  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

