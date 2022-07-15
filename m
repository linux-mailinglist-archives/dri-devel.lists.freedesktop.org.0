Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3155576F0D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B77D10EA80;
	Sat, 16 Jul 2022 14:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5775C10E153;
 Fri, 15 Jul 2022 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657920947; x=1689456947;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bPUpIugxGxuUjoJYsfUI5cWQvLeCm6KqPOG+EPuMXwI=;
 b=AVBWLCZyDkqjU+sBn8skp2PiTgw/NiEEvIrdJRdwBgOF7fw+LD4E9zuc
 l0cCwP06EZUF6rtjO+stAXT/02ZZQFNDC40OFhXT4Ap4Aw/lpSA9u07wC
 f1h5iMvYuj5F7jwx2gvhrLaS7+7XkbINlQVVYpso4F569AFPuIMPghF+1
 iOmZjf2p13xyqbSMg3Us6LLwAgomfcBeymYVmW/1ySUOV34ZFKT2Jd6PF
 OXV16ws1J4w7GTc0bP1IqfRI8YbXpfRHLU0yRPCsFEXMNk2uYoAaz2Dsk
 B9n4dBc7tN24mzlcyTDvxQorje/vaTVokH5Ufd5VNnpvJVzyCySQnSUku g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="349867337"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="349867337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="773125054"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 15 Jul 2022 14:35:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:35:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:35:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLOshZ3CelViv5h4EAGdJZ+9JohlmZ9PI6N/tEwxN57JaFr98Cr2T/NV8KMuBpAM1XVhS86Vo6YpbSSXkEVOW+eqWTIcawVc7ZfD2+3vlwXV/SbMLYRhmYkEyu0rGXMI1BG5RR0ftUXYxp5+zAaFAkR94tGieChZjZyFD2l4pG3+z1+S9RKtFSnh6sXRS/mzv8dAxD+ozMXWxetwlBt2DmNTN7XWnjddH67loG5JQs5oKxXpgCypqTnhOrqL6pgX40O4oXNXZhdlU8UdwLXQuPLdNH+vx3UTh+KxjAIvwKhDT3yC9tg5i2fQcZDuD5IbIYeqQFYTlofs7zDx5rvRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOuylYqn6rBxwF43eyjHM6tzHOWHAusOLpJRYj7fVk0=;
 b=PuhzNuZzxWU3sdFYdYMtc9VeXbPRkHa+SxmBlNUAloIFM9gxJgNTbjgMR7Ah5Bf/aehiumT6/Oli81zfUmy2MP+vpwV0b0x2hrVkQ8X8VLNQLRE3nli/p9omTwi2Bbu4qkK46fGXBZs6yCCInnVcKjgHNWWhKrEMX5e3wEdPBMSnwMEp8VKMMtRHyLlUDnUUDWdPr95ll/SqxKGNsg/zwVi7EESHB4kpn3ogO82YrgXVBRH87adCqWwlN5SD+kRCftyGjr10YKdkKv+y690cVVWTuoq/fCT1NHiGVddvqoHTiM9G96cy8k0oHz1nmQe+ahvnp/FyYJcp1MIMh1JA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Fri, 15 Jul 2022 21:35:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:35:39 +0000
Date: Fri, 15 Jul 2022 17:35:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 24/39] drm/i915: dvo_sil164.c: use SPDX header
Message-ID: <YtHdp6ju3IfjF8Bq@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <002a8d51244a70572744de86cacbdae293e7d503.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002a8d51244a70572744de86cacbdae293e7d503.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc6f349e-5aa7-4783-6a4b-08da66a9f631
X-MS-TrafficTypeDiagnostic: DM6PR11MB4074:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SilYVL5unPX6w8Qih2aBAOX0wCtDsP2tEJP6zzzwGwEBdnIF5F/y7Af2MKkJeKcQa2TgeG2ChXdppUPwp76ShqMyzTfUz85npJFN4KWvK2O5eO69rDp/0TmPkl625++neDtPkOYv7xH2IQEZMpNsV9IyPRcNqj77ibdlPHb/fihiPj/DrbGRBvKSlFisI49Y1IQ6QiViY3a7PKye84lg9UIwS7jO/x3xt1hya0hQjzJW5Yrc1eSAj/2oDcGcJ0Xmx3UGvvlzJcbA57WeuRON/yD3lI7NIZDIdZ25d3jCOTrWzToiAVtNxODzkmvsA+Mx/vcdXPqQ0pDaJsoZWC3LR8fY+ZTSoe97Mxmu438wrBohQRvKuRtACSnJfF3BMSHjQ+X17DPhm3wNAY/snCPX9WSmsqVQgXWJv3zD4vmY+GIA0ShKcr21y7KKGsS82pPR8rYkHpFMJWpGLqegNbhI8UOfN1R/LF3HamNS5Pj8TKitGhP9jwIF3kqZhYD9eRJK+fy3dHdWCY789xOmtcl34xEXCQtDB56eI54MQQw7YJPwTYHKtH/LP4rRFN00mZXK5XcyC8PfC32A9F03RSjuGXX1GADYC+VHW3UyxKC1RX6Mh/rC5A4hUsEePqB5QQXRVtvf+Ijzw26LMXq7PeBDOGoHyWyTLz2a2Ds5AmMO+ampAn/GX1CmUaLC321mb3NUL8M3hosQ1H1VvlGGqVny0gqHy7RvvOi05XwYwWHdias15ufEfhpyToSQRGwF6VhyaGAC/BHrpFq0qQRmgyzmvGiPHTuoYn3aux9BHIb7ZOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(136003)(396003)(346002)(366004)(966005)(478600001)(6916009)(54906003)(316002)(6666004)(2616005)(82960400001)(6486002)(83380400001)(41300700001)(2906002)(6506007)(186003)(8676002)(26005)(44832011)(8936002)(5660300002)(66946007)(4326008)(66476007)(6512007)(86362001)(36756003)(66556008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Cy09UuwqO+8Sp6wHWXBYFvwL3RpXy5coSd+DZcF9mXPmimKxaJ/87f/DVQ?=
 =?iso-8859-1?Q?BClk2r9nWrx/Sjx9BxwcFXf2Iop1ONpAEPGyyMz3QgOWEMdcogy5usb8mM?=
 =?iso-8859-1?Q?kQOmwC44cyz3uYGhShK0KbxGALaEaBqh1MXkv2J7NBwB9cYakZ13t/iops?=
 =?iso-8859-1?Q?/r2f59bA+pRVHbcFpPxDaHejX3nCnx6ppGleS777Q5L2OF1dHnt8/XFIsk?=
 =?iso-8859-1?Q?4aNUCeXaeHw9ypadDcf7C2wWw4NoQ/qLuNUYxl4Jk0VMmXUvm3iQBF19js?=
 =?iso-8859-1?Q?jh1ktEkGIzV3oyJFI2WeXCMfGbeiC7cqaedHcS3ksrlkHOXhTg1dVzm66b?=
 =?iso-8859-1?Q?1b4sFcO+OOuwDP4Zo1Fau8YWOPBvPVYn5Qmbo8Z/MA/ANkbxBtl71aiw7w?=
 =?iso-8859-1?Q?H7fWUEy9Gnerb/+aHl5VTnMffS5p8+oVYx/EXmUlqhRqRGxDqmnKPuxCqS?=
 =?iso-8859-1?Q?jk0BPDaX5HaVf3JdPrmmwfi2yhy2TLpmlk6eeL9lq7hTYsuSTdzxsvflha?=
 =?iso-8859-1?Q?DR37XA+/1SuVazG2injLjmrM/MRkzBGAghYbvkMp2wLST0AVi/xLHOQOU0?=
 =?iso-8859-1?Q?PQ3dXmv7+kZwF8d1YIgnLySRJcuolKdcboKw/H77B5DSyrJgyTBdPo1J9M?=
 =?iso-8859-1?Q?8GOhsbo+m9eB/JAvOXyORwzX10CmP3W4s1Dvsu9f6hnH9SKkmMP66fb7Na?=
 =?iso-8859-1?Q?XT8YqR4GwqwZ8VQS1l6d4Yp360iaFVDQd2G/8FSeKHl3yXGPG5heAwXGLV?=
 =?iso-8859-1?Q?KsuHLqxXY6BPwpYBdhilHfSFBiSAoCVeLZVhhYb/KKTeevIHFS6kNKYdAF?=
 =?iso-8859-1?Q?Wt4cyBceA6soj0gzIOTBB44h3D3e8qdvrTvZcptvdEyi8vpgXq2RlErCL2?=
 =?iso-8859-1?Q?0Hlf+HQbN/4MPfZ1AxffPXzo8flvGkOvyazlMDW0fWA2Cu0cC6khFP2/hu?=
 =?iso-8859-1?Q?jpbX01VHF+oSvoLtxj5SLbdbqUzGedT8x/WIFrA7s9URKiBp1am6a6VCm5?=
 =?iso-8859-1?Q?D4ZwM+VT4KSVGAf+3DMH4A0dK8ZA25KdWpgr1xwU0Zgj6aE1Xp7igLvoM9?=
 =?iso-8859-1?Q?YtADahKkCLVh0BaeeP+TI2cxPPNppi3xTe2/QAfCoVSdGu7NdGAjqrDKX2?=
 =?iso-8859-1?Q?S00Mi71hYQRxD1I1G4iQi3ffwOYuOvy5NsQJUbg9L+Sk1TjiWey2/rjl/l?=
 =?iso-8859-1?Q?oS4zMj7uEqDmOUnWiHnUDaC4TD/ZwB4w55ZJZJb7QQTL1NNpO+notSHH2l?=
 =?iso-8859-1?Q?p67xx1Cbcr//qUwcAaO93gAfamXG3UQABV62QdagFeRy7sZlRjwhKCVjoI?=
 =?iso-8859-1?Q?9q6wYK8wd597qDhTo63m4slr5fX9FQUBDjSHvDUt9JdcKlVvAfeOK60IxJ?=
 =?iso-8859-1?Q?4kUN2d3X/NRyn89nMFyM3jCXklmfLz8xx/bBd/Wtovr0Nby6pFZ/BC0n0o?=
 =?iso-8859-1?Q?sfHe2P4H8K6bMOXjd55Hz72S2LdV8tf/ik9v+FzQ3qiaW4X4/0NZTQrsRr?=
 =?iso-8859-1?Q?1Z5KNuy7zdMYKANLwxPOPNeR1qjWG0a4IkSskcfUqMI40uhJ3twFGlhV50?=
 =?iso-8859-1?Q?lMdiQHW0JEEP1tTKFNcJIn1cLMly6QyvYDaHBRevNVE68kyc76UQUtCS2m?=
 =?iso-8859-1?Q?f3OsUSbc3vPiiYyiMOVmPZ5D8w2YogNFS/+lo38HaEEeQ+YfgMkiMMkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6f349e-5aa7-4783-6a4b-08da66a9f631
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:35:39.4955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpS4QCl4YyT+oikyCorIOBD7pCct69r1exsaBCCerDQsayvmWrBQEmqZYJr3g0dpbdepf3MiAD90dZjap+IYzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4074
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
Cc: David Airlie <airlied@linux.ie>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:12AM +0100, Mauro Carvalho Chehab wrote:
> This file is licensed with MIT license.	Change its license text
> to use SPDX.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/display/dvo_sil164.c | 32 +++++------------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/dvo_sil164.c b/drivers/gpu/drm/i915/display/dvo_sil164.c
> index 0dfa0a0209ff..12974f7c9dc1 100644
> --- a/drivers/gpu/drm/i915/display/dvo_sil164.c
> +++ b/drivers/gpu/drm/i915/display/dvo_sil164.c
> @@ -1,30 +1,10 @@
> -/**************************************************************************
> +// SPDX-License-Identifier: MIT
>  
> -Copyright © 2006 Dave Airlie
> -
> -All Rights Reserved.
> -
> -Permission is hereby granted, free of charge, to any person obtaining a
> -copy of this software and associated documentation files (the
> -"Software"), to deal in the Software without restriction, including
> -without limitation the rights to use, copy, modify, merge, publish,
> -distribute, sub license, and/or sell copies of the Software, and to
> -permit persons to whom the Software is furnished to do so, subject to
> -the following conditions:
> -
> -The above copyright notice and this permission notice (including the
> -next paragraph) shall be included in all copies or substantial portions
> -of the Software.
> -
> -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> -OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> -MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
> -IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> -ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> -TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> -SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> -
> -**************************************************************************/
> +/*
> + * Copyright © 2006 Dave Airlie
> + *
> + * All Rights Reserved.
> + */
>  
>  #include "intel_display_types.h"
>  #include "intel_dvo_dev.h"
> -- 
> 2.36.1
> 
