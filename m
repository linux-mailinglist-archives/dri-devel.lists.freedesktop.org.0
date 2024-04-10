Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209F8A0095
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 21:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB3C10E69F;
	Wed, 10 Apr 2024 19:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JladdeoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0EC10E69F;
 Wed, 10 Apr 2024 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712777356; x=1744313356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zt/AprsCdcZiP83gKHpsZImAjJMSySPI39+bDHiPYLQ=;
 b=JladdeoC4okQcXK+Zjklx18zG6Cfaei3awebO4CIEpb0jYOGXKm3KShw
 ReikssO2PuOI/0/VbZXw5LZYCPaAcRzUyWvd+VHaln7AjrPkpBU8AuBhC
 uwET20Mb7a1M4PyVpGv43ar4nL+4oG4Vwd8HAa5HPXEYdcNLynvkHtF4f
 0+cHqxmRfoKijWduKms5+c1OuwwIl++gH0orCZsggaTscVKQMC5TBch2Q
 vby7pGxEZ1D3AQ8WQUgLohYF03yYhnM99+Rv2ftWUhhu5ASDV5my/p4gJ
 c+9tmoibQviqZU7dm5II3tfaVURpt5ZMajbT1mc+B5b0UfsJCJ5wjGa7f Q==;
X-CSE-ConnectionGUID: CYQYGs6MTsigw1NXQ7LvUw==
X-CSE-MsgGUID: S3C3aBpcQRKd0Cx99NhO9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8325927"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8325927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 12:29:15 -0700
X-CSE-ConnectionGUID: RJVIxBkMT8mdv0YCAk0lPw==
X-CSE-MsgGUID: Htd4z3CqQniBzSRWa+4A+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="51641584"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 12:29:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 12:29:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 12:29:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 12:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR1LwkxFjQaGGh5T9N7Tqo9kEselZ5rhiAwRp+oeZgtbJ5eVm3nOFecRZuod29ChZS58BJwwoA/KRQiaxKt2DcJLoavKn+yUrBy0RaT+8dgCphffYiXMR2ONrnEjhOa3pOJL7511Djq/pD61Pm29oWASwbe+wT5xWDi5WwXy8zlUcD2gMs0z8zE5auGsqRTLdTWOM1QEr8cp7ktVaZ0CTUBydkcK45/EYlkNZFgufnR5aXq0xUvkjxysAgedK4DXjp00fELLvwSsYYzmLiGwkKECIBfulcS1Vi6xpZzvFJ51yaptwJwM6G5MOHEIoETB/YijBUpzWNR60jrCxrxxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpQssw48yUeglISVpM7+yRjCgU4mXJ2Xz5ma/cwPVW4=;
 b=Da0Wr27kLN5fCXlgUeflkJNbS7xH0FjhI7VPO5iVn0Yk4mJ7xO80lRF8nUTyDTkCRKb6lcivtyLek8c1FqJPOURGyzSHdmPqwGl26Q9h9qJY2Ft0Vp8O8oOzJmxK1NStaLb26+cQ5jXa00CDoBqYLKvhaqHai39HnvcB2nvtCa8HfBa9LMaUdp1RQ7+TIz3xo25UiWywfZR5vdfw2UKk5e6OUUTlGYyuSsvG18zvIo4T+8vxnEpV5dBZLP8egst9P6UIJWBt9Gt/aR2vh201tNBqxB8TJNmseLtlLmq6H1R9MwH0TYWQU830kI9ZbmuxmDDihC3Z+yYDgZLbpbrtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 19:29:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 19:29:13 +0000
Date: Wed, 10 Apr 2024 14:29:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <John.C.Harrison@intel.com>, <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <patches@lists.linux.dev>
Subject: Re: [PATCH] drm/xe: Add xe_guc_ads.c to uses_generated_oob
Message-ID: <r5fo23qfz4qyoum726645u5sb5j5pjgk774maqjgq6nrupn7iy@qgfpgbygm3pf>
References: <20240410-drm-xe-fix-xe_guc_ads-using-xe_wa_oob-v1-1-441f2d8e5d83@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240410-drm-xe-fix-xe_guc_ads-using-xe_wa_oob-v1-1-441f2d8e5d83@kernel.org>
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4829:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hTdsJNFWtDqjySQk6gM9MU3uUtWUJgLZObMEv/zlfjiBzYyghGvJ9nwXgloDNNL0sXh3hraAdWSLE6IMbw1ogZPmXE5E5VAaWX/tfSWzFYuCqNV27PpByXSPZcf/d9eCCgnvMKZeMFn7aIPDBsz70nwOgwIDABLglp1FCaMVxbTHC8YGmiPg/62/6mZv+No0lQzuAnQvCZtwNNFO3yhuh0M2toxbDQeMGKrSk5IIRKQEQ13ZeA8sxKakV3+eixkCyGtOtjeg5aoTlEIZeN9JXSMeh/4JdtlY/fP/Te1UQj/P5v0z0yvDVG9UVIXqWnLYA9wXkW0D5encCLiepbJoMEvdwloEwywGYzlAOGHkniaUBz870swmgSgTH5FGLaZG+xDxs1lXJxwlAuMS9NT81Q0S9Tfwu1pYO7kY+xiSax8Vqnt40VZOygz5nqaoawxlpBt4H8go9IZQwJ42Ch6IUmArV2bRzZ03JAkJs04OnLtTgfQUgZrmFgL/5SNeQLMX//J0Xdz1CD4NTto/zZv9r+eGV/CAu4d+aJ3crUSY7ZSZ+Rbn/D2b1B2kWfmA2l52+1V/fbC6uSCrYpZ7UDQZfpuyZoauz+Wbbf0nwuhxmnBW/S31fQyXji+vMNqebEKmCOZknPJwtgDDRrzhHLQtuSWEDmEy5GL5dGFFIrkXeqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wwkb0wZjlERChxkCBnkqY6FjclMlmb1QlFdmklnI1HZx2iYC6EVAcOjVeBp1?=
 =?us-ascii?Q?EEPmxlmxAY/dLvNHOgFSm6N7bJfE6Mk3I3BsxBsWvsaQeZfSpvF8uPzSSCWt?=
 =?us-ascii?Q?w3yu8MiaTj0wBBUTadWAbH1NgLa/+pe9A9TrsJcyfI1EajIzn4A3qnKZcDlV?=
 =?us-ascii?Q?PhNrDa8GWRG4PWEOgcW44nXvwgDy6dDlJZeJkGk14HpSPlya2tLH8GXQ78Cf?=
 =?us-ascii?Q?4lhrKu8n6Mkk7nZumr8YZS80z7axo4Yq8iTagN0dXs3EKZxqrysMjCsxCxeS?=
 =?us-ascii?Q?hdl5onb3BBt5qPDoPut+ROjBopjKoVXUXD79y91VF7WYZdAQaBnO3tU6gBs/?=
 =?us-ascii?Q?I0lKm9i9KG3G6zRoL5vgsIqYB+0jWQIy7znmWB9B8HRXpcdBji1bKiLSpo1J?=
 =?us-ascii?Q?ZCOexnt7Tf92SkZZwNfid2iKb1rT/HOIwo2FffUQVRevBU8dpewpnkWuk1ee?=
 =?us-ascii?Q?Eu4DtJeMtyAHIPe0mPLBxRhiYMwHmBcpf2UpVDAYVphsO2+/Y4FAxEBMV4JT?=
 =?us-ascii?Q?NKStDGX4/HR9tNx+rpE5sQZ2ZXB6PWpltcSz6K3cFnCfMulYszTBNlpozdau?=
 =?us-ascii?Q?97nPaAx5+o7+eXbZmwywkEeF+pQVFK42flFV8yCikd7o8gZncsWSBGP/UbDb?=
 =?us-ascii?Q?b8jzTtRw9CRZvBhyL5HLf0OoLsrTRbKFhyLjsBNp/5zMicv+9a4lXr1UjJ92?=
 =?us-ascii?Q?8z2ax0cUIvarlTJC9TAMStH32ctGCFsunqLF8+S+jGf1tupVr+nivQDqbgrz?=
 =?us-ascii?Q?OHY6UquJE4iIodEvCp8uUkiddRsvKy2iyqnkK/294iutVm7fAVsb9f7gXPxr?=
 =?us-ascii?Q?2uKqsBjECxA3qHwNxdYFPRdR9tD0QIUsTWiNbb4ulxcaiiFvKqI2cPrv8B/Z?=
 =?us-ascii?Q?mCep7urzhMgMw92iddN9QxT9kHo798t6oCciH03VY6xglC8/Fl0LaO3frX19?=
 =?us-ascii?Q?6bQxx2zGdu0iqEhIfOQhW10FtHcCpKIHgOBOk9q+jtcVz4Sbb9tUbanZvXqh?=
 =?us-ascii?Q?6ThzjhaBPjwWQrPmtNcfaxxke6NSB+vX2QLGR/Cb/ustKd9EQI74B14nFKD/?=
 =?us-ascii?Q?77iJ5UzXfofkMjvlVzbqxEyyZAykWrEk2y+igvmnkFq67BAqz9yBGJ9boxUJ?=
 =?us-ascii?Q?9BFQQAOgLYHdH9FxHdJLN8/fYvmP4xKebw8V+Ac+PFM9mKy9A+lyzY9Mk5ca?=
 =?us-ascii?Q?xUWEwqa+ARrwXgpfB6dO09jiPvX43tfJzwpslulj14v7V4DgjSpy8iZbJRP2?=
 =?us-ascii?Q?Nbd43/cQ/lutQdLnFnD5RYlr+oAbpkcIAT8oDS8VjI84Kn3rVA1PWz/WTSeN?=
 =?us-ascii?Q?pZJA2IYqc78Z8WATko5bI/GOL3wDTYNAKzgMB8ORQs2L7NXUkDE1z8XG5CAw?=
 =?us-ascii?Q?nzWGO7JNTUh5fPOkJvhOadn360mANu5erXfskmVrnyUmScOx4OS8Q/o1ZBsM?=
 =?us-ascii?Q?KVuZCq/N5Ns15kdWA/en5DzCywxTxVLKTveAraGIgoXkN24kBhDGzcPOjmC0?=
 =?us-ascii?Q?RQvvBeWwhr0Zl46ugJkSLgsqPreJ+SqPuo9oiNrSMK03iNlVMXl+kn5T00/T?=
 =?us-ascii?Q?SATNt89vXaBCowcDDXqgvWCou7FDsO+w1UaDxWvzuxgKLSeVAobJsjNgDFsq?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55808df9-6d27-4f0b-21df-08dc599480fb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 19:29:13.5436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eM59CrCPIJ3oj7ijpa9h47RbKUxAw95qSEWok2Bv+mMA+YUBSZayvPT+nXRJwBh3WzXl8u9e2Tkg21dVZLiDbE6r7ZJna9/iA9Mh0Mu1Rfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

On Wed, Apr 10, 2024 at 11:16:11AM -0700, Nathan Chancellor wrote:
>A recent change added a use of xe_wa_oob.h without adding the file that
>uses it to uses_generated_oob, which means xe_wa_oob.h does not get
>properly generated before attempting to build the object file:
>
>    LINK     resolve_btfids
>    CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
>  drivers/gpu/drm/xe/xe_guc_ads.c:10:10: fatal error: generated/xe_wa_oob.h: No such file or directory
>     10 | #include <generated/xe_wa_oob.h>
>        |          ^~~~~~~~~~~~~~~~~~~~~~~
>
>After adding '$(obj)/xe_guc_ads.o' to uses_generated_oob, xe_wa_oob.h is
>always generated before building the file, resulting in no errors:
>
>    LINK     resolve_btfids
>    HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
>    GEN     xe_wa_oob.c xe_wa_oob.h
>    CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
>
>Fixes: c151ff5c9053 ("drm/xe/lnl: Enable GuC Wa_14019882105")
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed to drm-xe-next.

We probably need to find a way to make sure we generate it before
anything else. Maybe it'd be simpler to just do this:

	diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
	index 60c90dc918b2..f34a12e3f47d 100644
	--- a/drivers/gpu/drm/xe/Makefile
	+++ b/drivers/gpu/drm/xe/Makefile
	@@ -46,18 +46,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
			 $(srctree)/$(src)/xe_wa_oob.rules
		$(call cmd,wa_oob)
	 
	-uses_generated_oob := \
	-       $(obj)/xe_gsc.o \
	-       $(obj)/xe_guc.o \
	-       $(obj)/xe_guc_ads.o \
	-       $(obj)/xe_migrate.o \
	-       $(obj)/xe_ring_ops.o \
	-       $(obj)/xe_vm.o \
	-       $(obj)/xe_wa.o \
	-       $(obj)/xe_ttm_stolen_mgr.o
	-
	-$(uses_generated_oob): $(generated_oob)
	-
	 # Please keep these build lists sorted!
	 
	 # core driver code
	@@ -322,3 +310,6 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
	 
	 $(obj)/%.hdrtest: $(src)/%.h FORCE
		$(call if_changed_dep,hdrtest)
	+
	+uses_generated_oob := $(xe-y)
	+$(uses_generated_oob): $(generated_oob)

Apparently works for me:

$ touch drivers/gpu/drm/xe/xe_wa_oob.rules
$ make O=build64 -j$(nproc)
make[1]: Entering directory '/home/lucas/p/linux-dim/drm-xe-next/build64'
   GEN     Makefile
mkdir -p /home/lucas/p/linux-dim/drm-xe-next/build64/tools/objtool && make O=/home/lucas/p/linux-dim/drm-xe-next/build64 subdir=tools/objtool --no-print-directory -C objtool
   INSTALL libsubcmd_headers
   CALL    ../scripts/checksyscalls.sh
   HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
   GEN     xe_wa_oob.c xe_wa_oob.h
   CC [M]  drivers/gpu/drm/xe/xe_gsc.o
   CC [M]  drivers/gpu/drm/xe/xe_guc.o
   CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
   CC [M]  drivers/gpu/drm/xe/xe_migrate.o
   CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
   CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
   CC [M]  drivers/gpu/drm/xe/xe_vm.o
   CC [M]  drivers/gpu/drm/xe/xe_wa.o
   LD [M]  drivers/gpu/drm/xe/xe.o
   MODPOST Module.symvers
Kernel: arch/x86/boot/bzImage is ready  (#1)
   LD [M]  drivers/gpu/drm/xe/xe.ko
make[1]: Leaving directory '/home/lucas/p/linux-dim/drm-xe-next/build64'


thanks
Lucas De Marchi
