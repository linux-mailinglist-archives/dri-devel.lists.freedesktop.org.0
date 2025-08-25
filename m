Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF16B34050
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 15:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CBB10E47C;
	Mon, 25 Aug 2025 13:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaZ96eA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2789510E47B;
 Mon, 25 Aug 2025 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756127058; x=1787663058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iNFMb35pM999CWym7hMz2XWCYLUSKd0JHVo/YFgdS44=;
 b=WaZ96eA7ENv79BeHgCl9QGFf13tEJlFqWIz0rzX+eP0tzWaDA8UMJ/bW
 ndojcyIte2vuszYlFiZ+HOCYYuEKLB0NtIQ639g7xT0UQiLKtUFEQUomm
 oTwwkc1K/mC0r/JDehI+C8rOYqpMiEP3MArGkUjGz2aVR3HVBE4mIRno3
 KVT2E78TlOSl260ETz2L159FoAUL5zj/tMpWsQhZVvtW2dv1vAB5rmLGq
 HZlEQwpZB6+qbyJR4/wl8p938QhVli1H382+CTVwMKIExo2a6PTCI5uGP
 adoxVAKAhFVCsSjNB4elrL+zYelskQx0G1RLUsPXhkAkDOFuqeyKBRcoG Q==;
X-CSE-ConnectionGUID: q+F5j63nQaSAKmLde5HKOQ==
X-CSE-MsgGUID: rT7KlJUhTHG/wt34VV6+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58484068"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58484068"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:04:18 -0700
X-CSE-ConnectionGUID: 5NzRQ6gNSPKIljdbXNJeUw==
X-CSE-MsgGUID: O/pdTjYlRZ6v18JIlT5PRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168534400"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 06:04:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 06:04:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 06:04:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.84)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 06:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+6PxRau2AxkEEbePU38U1J8Xzv4eHEriKzJGQXQnJzIwB+AsCoUCK8ga9GjS+jgG334yyGSt9vXI2xL3knKbhAyZ4W5edVq3ij9aijmrklyDyQ9vm/7oeB4M3dyvflrF7xPuC0yRwrp7PiDGP5zZN2IFMrMN2+CPTJvSVC37r5kpAcx08gslBSMhhzhXgLZVONKX/fddKVegioKW1YrKEa6HGX29X9+EnlffWKwmD9/46ugfQ4BRgD6MDt++Wn7GUILiAaIbfWBJstPx4uSKekSww6UA2huW5mtrz+K7Aojw1+llka7enz3bYYk6azNqYGqz3FhzWxsX6FOnN19XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8aOD2r8l2fFAZqIxCwKGgPMGBh9KoJoSc6uQg61Chk=;
 b=birM23vX+g/DYVOnOP6K+1P16iCLO4TUzLMFUcXRv78jT8+milhmtaaT4rqTQ9V32elxHzIF4urh/LIC9PdJtyRZrd/gEQGiKWqLlHVXwfUtPYrFuM3QJoBJI0hNAFP079LD+1JYaKFCJ09eFFREPsnCUAsNNN9i7aur6PYdtHv544U1kDrxzmpwvjFFe2DctRltrcYbGdVcx2NJ+hUsFq3Mdfbfseu13FJKENifz84oXZFV/oCElwevusRuAqgwJvSGWBtcftYQrIA4oPNyg/hOoKTysgl0zlHgAK9L4ITHkZsyonZsUVGVYETTZmhfnM8tA715bG5gKJ7ZgYU8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 13:03:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 13:03:30 +0000
Date: Mon, 25 Aug 2025 08:03:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Achill Gilgenast <achill@achill.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: add missing include <libgen.h>
Message-ID: <62tjq6xmxnjptocofw23hjxogase6lk7uxf4nuilomqdzivsr3@svbbv7z2ugqx>
References: <20250825010914.99742-1-achill@achill.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250825010914.99742-1-achill@achill.org>
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 36875e4d-744a-4879-745e-08dde3d7c9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mT3v92UQVQG2a6oKVY0xJHD0MYN1sOeFL4ZJYv5Qpha5IBIAWD72ZKjYHop2?=
 =?us-ascii?Q?NuBz3lH76GC/Fy+l929DYapxYC+s7ybaoDksYzF6/NCQerFmO4UXecwXAPvA?=
 =?us-ascii?Q?UmjDBeMXVIInpTah+ggGIdXO6N8p4pKrCzae7l+grkCu30ZJvQd41I240d4h?=
 =?us-ascii?Q?O1VGnogiEwLg72WdvFGNusZwclH3Ytdc7NfSQBeqhIDo5AOOlQb1fJO7zCse?=
 =?us-ascii?Q?aRjIZk3XRHT+XvuAZPdahdDML/sf4RYhrzSqA/RGOMiELdHHOG77urfWlZ8A?=
 =?us-ascii?Q?ZVjd9buXNesX3eZkuTJSUqR9R+gQmUVrhmSCLDsLgks0z63C6/3MSjt/WNxl?=
 =?us-ascii?Q?pmYed/RL424sR/zxifxfDHcG1pCQICRAbJlaiyOJjMN4EJyLE/VAt7Ua1mVa?=
 =?us-ascii?Q?AxExAGqkl2cmFDhCQTisI/+/Qyne5Z0Owswjhj9PSaKJazhLruO5OKxUM04p?=
 =?us-ascii?Q?UiXCo/GCQw0gQfNOIU5gLHzUVkgopC1UjZ+wMD7reN6jc9gN3Bz55nF8QlWV?=
 =?us-ascii?Q?D0acYbulUwlQh2TIgOvJG0YI+j5WH5S6DiggfRFUWJZoMAqbUKg7NZ0Snl+U?=
 =?us-ascii?Q?TZ1emJypdyPiLcmOANPOyf3Lm2kB3O5h4xafdMpQbrbL3/bS58HE7bm0rpgV?=
 =?us-ascii?Q?WQ64P8Azhul8FpoiHdWTCz1bB60my8th6UoP5Wb4xnqE8yRKWsgbOujcs/2W?=
 =?us-ascii?Q?F5lcVZ+C9WJ/ZeL6SECWpFk4FAuB1QKu9DV86bg1kmbkfRnLJRk8p0UXDkqM?=
 =?us-ascii?Q?6JsIJ11UzgFET468bHgmUFDlRq2Ly7PdUZ1r+4VciubOkrqpYFpdZiwW5mBP?=
 =?us-ascii?Q?qYJt8Wtq2MFq2mfrROZQ5pkiA0aj02L+1ImPJaqkkyL+iPMzvY3W9et8e3dN?=
 =?us-ascii?Q?712e4rD+GViwEIbm28fU/k6YuZcoJBqFU3w4jeCbIwFkSleXbtAqUtGcR64O?=
 =?us-ascii?Q?2Qac7caOoi4MMb38hwZ9o45Ik+yWjAVbkYmnYK4qyZ0fZUEQjVFkihLpcWYK?=
 =?us-ascii?Q?8+htCPiBNIwsUwHDQ9de2vwowILTanhkM45y79g++jk9aHZvcS9StEtfxOYT?=
 =?us-ascii?Q?IGYR6PrGdaP1KdcNZFBXyDKk/oliXsn+YuGwd00JeRlLxbFKGHkicpnjCWio?=
 =?us-ascii?Q?sejqLXInL36vRka9wYi2SGd09iOBHOajtsALbgEYEn1hibSN3uT9W8no9/DT?=
 =?us-ascii?Q?7rKTptypUwOl4wKV0K0Bh8nbuJCJ5tMnHwSdN7FCsNP6ZAjCHraWRkJVE+3h?=
 =?us-ascii?Q?bq1WOP0cSsrKWllsWYggxq45G7L6Qe1p+cDq/cZ6HkP4c/x6pOOQPlcr29B4?=
 =?us-ascii?Q?p00I7NhIbmHGSD/26glNDgH/k8ndXSKdaiHpjgYCvD24Hhi/cl3DdUaOiq4G?=
 =?us-ascii?Q?r+1EeEWywHrwUNoMC85F+46XCJ3sElgHFMRJzMex3tKJ05VOmV7YBj7jc72G?=
 =?us-ascii?Q?TpJm5CvD17s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vn1mkfZJVCgs7gh13+wDqhrdHNnsTPSdHvifHSBiZztoypexem0NvOA1D+1m?=
 =?us-ascii?Q?zhBtOc/jCL1m21qqqqNGeDYbpHnoRWGwhyZ1i3EfW7qnke2z152IkVTmmQNI?=
 =?us-ascii?Q?JdS9YSAKQM5XCddkk+NZefatHCxETYjtQC/ECk1wx5dGa3iyFEfldTepUtLM?=
 =?us-ascii?Q?pYDmVQRaseaEXQ17IVAB6brkT4eLH7Dy5cH4Swux8gbUVIuAid6OINEo/wK/?=
 =?us-ascii?Q?kgQEp6b1kqvyC2pxSZZ9a0cqprItuCs0FQ3cU/Qyhq2rpd/kWOdzXRP2X+XY?=
 =?us-ascii?Q?LCFwtCxc2GRHPTpyXZ0BBzQqspjU0rIEoRobm9db53DaQSJSpc5YkMyLEBNV?=
 =?us-ascii?Q?5EIpZWxl0j3YiDgkksJcmx0pz1COVizhxeuOQvc3Be2MMwwPjzCVR/MET0TP?=
 =?us-ascii?Q?orK7sm3CCQk3gfVzOjObny7il7IE7tK62anCYFWRLXhY0vmjcaCX9eQRZWHO?=
 =?us-ascii?Q?IiqUg7zxL6C6o/ED9KFRFoVocyXAwjlvwZar+RGTRi0yEJUALXlAuDLgSPbS?=
 =?us-ascii?Q?49Zxn+FzvFX+yZo7R0v2qaXNiZQUp9Fiw32r/9InGAcRWEU8wEueGgmPxu0d?=
 =?us-ascii?Q?liNKhiielix+d4LpzOKRdaX0OykxJaJGAimmCYInAIeSSK92DDY3D6BKolWM?=
 =?us-ascii?Q?NK2axpV6uAQWrtE6ZIXrJaAZlfXZURNy7zSoj7rXJ1q0P5D0ny4yWZnrI3Es?=
 =?us-ascii?Q?KoxJGFSCLkMnAu7cS6l59YRA7QhmI99z9YIdsTzWQozAhLwk6uLjsBpeMvWA?=
 =?us-ascii?Q?ue0gyRvtG5d/iODMhRoc1JKBCZekYHkBV1aT5RwzSb6nlgJazCgWyspk8FHf?=
 =?us-ascii?Q?AdKW0O7Tqxch1+j0WMR7SKFq3czl162+q8sl6DeSB+R7GejCd0PFNV1VYatr?=
 =?us-ascii?Q?I6GShyzuHYL2zPUq7vs8l98nTiI4Oik90d2U6X8dYx6TBsW44rkvB57jd/wT?=
 =?us-ascii?Q?UAQUxAMP0PyRARENKoAc8pLykhG5mMKDivZczHnBH/x4rwhspD6bjrR7sg/k?=
 =?us-ascii?Q?TVIn5/z59WobggRHI6d69BiaHzXYoGsCjh5And+R9/lDulx2/FQulZBh1kJ1?=
 =?us-ascii?Q?CnE2OEhHtZS1qmOKHfENSpSjccP99QvHSCJdpTfjeYBZA50FV3cJ/ipSSpXT?=
 =?us-ascii?Q?LTmhLO2XNM15d7cx44ki91AfIfempS82BfOQl6gO7mz7Mtu6+RCWyhP6wHvZ?=
 =?us-ascii?Q?MHFQFjX7UFDVKFnIYYQCr03IbjGKWay0xXd9dZYP3pcQx2S/G/6BLLUcDGya?=
 =?us-ascii?Q?UG5F2wA4l4ZQthOvhqcXI2nnDUWdpypFbod0jKNBIzhi76yG2QbjU+uHywTb?=
 =?us-ascii?Q?wupOU0oY4FqPPBwSIwDxdsRlkLnHIxyoiVpoDRBoxNsUJSWbWIDCHb7IIN0a?=
 =?us-ascii?Q?oaKnZHsOHOvbL4qpXjKa6qcop8AEsNhdCxgYL4TvgsVEJKiaX2S2zdtryBUY?=
 =?us-ascii?Q?kLTuyRJma6/SFV/ePl8/tuLI/H67YYg9xL9kI7X7m7z28UAXadiAka5dKaGQ?=
 =?us-ascii?Q?Y1tFv7mDmWWYJ5/caZ2KXv4gkrrUBPgE9sVQjfyAIV5c3snov3WimVlKw6vl?=
 =?us-ascii?Q?t+TTTQuoVfGP+I5tDgpTj/dCeaGUFKteXmZSiIjGFCxolDtAolk5YvgY1qUW?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36875e4d-744a-4879-745e-08dde3d7c9c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 13:03:30.1551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Htiqd9vaWShBw/yFgY+xMx1tUH9C3J7aFeyj5+/kxK2TLuj09GqZgO0JXp8n4fy3uo2ZgB6s0gsCIrTTNyTAlIGK/8g5dOHNcnncyCkr7fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

On Mon, Aug 25, 2025 at 03:09:09AM +0200, Achill Gilgenast wrote:
>basename() got implicitly included on glibc but not on other libc's like
>musl libc and therefore fails to build:
>
>/home/achill/git/user-aports/experimental/linux-mainline/src/linux-6.17-rc3/drivers/gpu/drm/xe/xe_gen_wa_oob.c: In function 'fn_to_prefix':
>/home/achill/git/user-aports/experimental/linux-mainline/src/linux-6.17-rc3/drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:14: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Wimplicit-function-declaration]
>  130 |         fn = basename(fn);
>      |              ^~~~~~~~
>      |              rename
>/home/achill/git/user-aports/experimental/linux-mainline/src/linux-6.17-rc3/drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>  130 |         fn = basename(fn);
>      |            ^
>
>Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>Signed-off-by: Achill Gilgenast <achill@achill.org>

libgen.h provides a different basename than the one used here.
glibc defines it in string.h, but other libc's don't (or removed it
recently). See https://lore.kernel.org/intel-xe/w4j3kzezrd4xqc4q4vkpbbxqvqxitam5htkex6rj6dguj5kbw5@27gqnp6veuu4/

Lucas De Marchi
