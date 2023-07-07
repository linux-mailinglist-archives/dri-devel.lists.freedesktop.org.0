Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460ED74B595
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 19:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891C010E5C7;
	Fri,  7 Jul 2023 17:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A5C10E5C3;
 Fri,  7 Jul 2023 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688749992; x=1720285992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rtik87oXDePeAmtNqurTFHUoYSKJwNEPoAveQVUQyk8=;
 b=PayAGaUhGFUtvFaiZLTvIiYyupQHVN05SydrK6x/fW6bAVDx9cYU8z3W
 6pPb+93B5SRpSjBxy7dyIt6jrgslgZPulPpgHU6aycL2A2Ffn+TigX2go
 V5VKYzKvTgrYBdFSfu21d4W75wcJUBr49fS48qydABd588zpxYhVXs0lj
 hqpg1Co6gE7SJVC7niBN4o/Tzd1XUoiX/j2o/sEnc3slIW+PM6CLb7Avt
 SL5WEZzgZpUEjxcdWj9HVuDZqq0rbhB8139OI2RtGcbTaxO6aqSdam35L
 2roMD6XOlwWtksl5qcPMmk5hBZ7awv/OojJz5/hunEq9C42n90I7Ck9hb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="361408394"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="361408394"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 10:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894069254"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="894069254"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 10:13:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 10:13:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 10:13:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 10:13:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 10:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTFE+iGGPu6tsnnUeBimBBLNWYjPzcTkJ2WRTgeUJX/K7F+AvGXaX3GsyH2NVDJofw6koReY2EPVEl1HvSmUxnlu7FKOTXC6UT5PnWFoPEF1FNGUgU57047ArhQWT+UoyluUly41sWQyjYZ8hX9ml072QBsDS7u5ckjtWofEcbgzRAVxh388Cdgw2O3+41VAT4PRpy6ra5ZX4FFg+1YOX5dNvSbdk/gaTXq5mtb3NdIrAQTOF0VBVkf2zwNatDQtg+CPTp6mN3AGVPsEUcc/FR+J9zJe75jSkT58GEsyVqwv0GHyM96/BAQxae7q8URP1ve+gjONwEjtff4L5xi0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr3fO9wyc9ERQ43YRjk3anQl5Hze4RaSfavtxeTsrxY=;
 b=nKVzFwMMatLrqDd5RYMlI9NfnVx5XsjtfH065tlih7l56Sws4yg4yuGp2kCCga/Zh6BzFMvKlbT132qzqvidjuollFKuGKCtfoEHwDihmdRKMkGXt2TCcDHsbqZ6qS/grnIArxLRNgpNdKyr2aT47VxZC6fUO7uf2l/z5sz0nIhBsYcajTLQPbdNUTKTwVfekzgJ5on9ri62HBQcYscH1iOfM6iELb3j5J1bQgvO8pA8/WONVwoSEYrzA6/DrATwWWFq2yhUk3Gp1gDGeytJ+BnOkk2GWm6FY7gsJ3tXqYxicwcxB9e0853vhxocWoR1m6dZeWJWiadToeTpYi1XAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 17:13:08 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 17:13:08 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Remove dead code from gen8_pte_encode
Thread-Topic: [PATCH] drm/i915: Remove dead code from gen8_pte_encode
Thread-Index: AQHZsNEdOxgUICO4jU2A8KP/KKe2pa+uid+w
Date: Fri, 7 Jul 2023 17:13:07 +0000
Message-ID: <BYAPR11MB2567627D06D49E98A23102889A2DA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230707124644.3965281-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230707124644.3965281-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CY8PR11MB7364:EE_
x-ms-office365-filtering-correlation-id: 929b550b-d98e-4bac-9e14-08db7f0d6f33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ddAKtqcP0pgM6CdSsXWKz83U3wn0ha3MaRm9Nc0YnX0NVBgIonxBXWicVC7GtRwBUr0n8k7fhaOZRRy/9IGzl4vQZDfVfUOSsb7t1ygALgTNXJhlasPDgs0L+viQUCtb7ltxVA7KfAqVBYR3qdqbLdwGHSyxOaZac0ItWI+g1L7YlOuqnD9SitiXWqKzwzc1dN2bH1DNI4djZLzwErMBCHCG01ZnWit40nhuSb1IM964XFHOe5lnG50VtwSMVnwdMz7d6TfYYxSTNGNoO1CsLA06q4DRGi4+LYOPRxWOxRNUaiE8POntPluiJ+P2capaT8nhSnHbhRZA+hE5X9xfaeSjnVQez8M9JgHWL0LGUXOrWeqlphur9rzQt0cJowX5w6cgHt/g6c1faRjZBoK9YQpDPwXunHHnl8DdLsLuo9DgYKNapZzRjP7nf8afCoaBJYx9kW+ZLvD2zIDE0DEaVLcxUhtX+bVDBTeRb/0i5y5VyyNaganHGeo63Z454dqDFX5oFTcCiqkW7hKYqjCDXR8mNTHmMa4aLPIW0MmDrXLNanolJqd8sFf4ZVMRppLu3tdcVKTlZhnvwermG3xGnxCo5E3+JA88SD1sGvBm1w6N0e5dav542PyZMNnjTgkN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(110136005)(54906003)(478600001)(71200400001)(7696005)(26005)(6506007)(9686003)(186003)(76116006)(316002)(2906002)(66476007)(66556008)(66446008)(4326008)(41300700001)(64756008)(66946007)(5660300002)(52536014)(8936002)(8676002)(122000001)(38100700002)(82960400001)(33656002)(86362001)(38070700005)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Pg131XtjsaUwUkVi3lOJRQnuajQnLwHY549j829HjYRVVq14K1t/fr7yr+8?=
 =?us-ascii?Q?n9ByNeyEQhbk7+NXZzkl+6GPSDqmIDMd5ns99wMYVG0U6qlnvA+8+cE3xCdz?=
 =?us-ascii?Q?+ft9ozv9aoXz75kuixt4jmuRtDUFhdfYCPRKtuA0hJvJ81rDMM8WJ3jvckBU?=
 =?us-ascii?Q?VtSKGFBpLkYMoCjivcGhgmezFxN29HuvxJJ1i5edaDPTAhtS181nHtGyw2pH?=
 =?us-ascii?Q?EEqNXi2K0RXlJSq9WpewbMVyr/oa3FPNUfdfOQzlmtoTZnXOm8pwGBtAo8RN?=
 =?us-ascii?Q?D9u477yuC7PBwdoGeb6ur0HofvrNNv/I3kSbsWBhV5mDT2j3ECWQoXzdofQO?=
 =?us-ascii?Q?qSZeGIx0M1C704J66Xffrqswm3bawzpw4el15wS09EqluU+o5PbLRTrhE3oM?=
 =?us-ascii?Q?2kMMlTWXHnUjIdTNZOsANeKO0WYEBKCFaEZMa+0LWdtCnyjpKc/akqybnB0r?=
 =?us-ascii?Q?12+Ei3eumhKRwuI5mOOgczoL0yrg5ExqLVKT9q/OsL8togY4QIjv3zXWgp+U?=
 =?us-ascii?Q?G7zsBuJKUfHsB8R0lkvsx/DSUtbSyVMzWXbJX0K5ivcesgIxnCD2rLyXjy3z?=
 =?us-ascii?Q?/nYuJnDyg8QDUWf/2ojmfdbiMoRYfBPHv8hhxCqKwHEsJcEkzrtHFzDwCn7w?=
 =?us-ascii?Q?CEiW8iogMas1WNjBJui//V6bSqh3MV17ellIvQZZgNdZQ5E+mLbwrcCGJjH7?=
 =?us-ascii?Q?B9JwLpn5/9yv/+HYbBjDVhR5ea4AYeEUbFtK8WPoF7JePGwzxFHC3cOjdT21?=
 =?us-ascii?Q?vKiYPKbWnk2xuQMbjwAOXWDLtxRRZWR//edZ8XVLI1/JnR5UOi2g5eZB9P1a?=
 =?us-ascii?Q?VyzhMovMTfQ6nqqV/QmrdtngcecS8ry49cVlU+HLwo4qu8KgdtNsrGFZTOk9?=
 =?us-ascii?Q?bY8w4xzX7Y51qzmVnsX5IF06BJfWxdL8wmNhYn7RumwgIq+yPAzo6x5jUg0l?=
 =?us-ascii?Q?CLxVt9NTtbLMeP8WpJGIX6dxjWABC6va5FfEoPHtrU7myXoESb7WWuuEySsE?=
 =?us-ascii?Q?pv0dsuHVula0UgV9kiEl0TDd3yoUNI1dbkniS1pAiGWWRfGzjnFJQuLUYQ7y?=
 =?us-ascii?Q?OWyPdaSxWmhcHBxWgaP2QqNGtqwGi4rpTH55u4sP3GcLpWM9VAJLT8g6u3ci?=
 =?us-ascii?Q?6Hw2L0QAxo8uVQWNR1cBQWr8fVav1nXpD3jZTtjD1lFQCa79V/zfhL4No2KA?=
 =?us-ascii?Q?ymNGpc/a6d7Xy62QvS3IRbxg3q+K0ExhrY8MMIVPG25o/0tFnB729qlRIeKf?=
 =?us-ascii?Q?TZktOS1VZQqgCsdntXg57xAxbALASGQPl9OrLr0k9zhgCEbKbW6iEsKzdSEm?=
 =?us-ascii?Q?iVebVndLaG7DOUq3yjX0Ujqnk3enYjIQLwtDlTo5eVFNfhp0d6I56issn6JM?=
 =?us-ascii?Q?Gl3xihH6vOuZFJRb8R1UfdAKUowciuni5jjB6n7X7lxKoF1cyVJLDUOPcc2K?=
 =?us-ascii?Q?78Bx/TIWK8dybI3yC6DXPHNlmDBoXp287SFhDcEHogaPZMoLYd9SGRYp1bYk?=
 =?us-ascii?Q?nMnI8wTZ021pWlDka/HVY4JZnprRZ+cDtHFz/t431xC6FY8t49RzFdJQ/GHT?=
 =?us-ascii?Q?g9uCYJG21JkLUAfLw+o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929b550b-d98e-4bac-9e14-08db7f0d6f33
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 17:13:07.9760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Frl1g+pZGG27r/aSXLnQdjqj1eRBucmEUwyXylh/xPMyJmM2MVk1VkPUybhwlugVjQA4uvgJoIyUCSl879dMYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Commit 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> added a dedicated gen12_pte_encode but forgot to remove the Gen12
> specific bit from gen8_pte_encode.

Reviewed-by: Fei Yang <fei.yang@intel.com>

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/=
gt/gen8_ppgtt.c
> index f948d33e5ec5..c8568e5d1147 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -37,9 +37,6 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>       if (unlikely(flags & PTE_READ_ONLY))
>               pte &=3D ~GEN8_PAGE_RW;
>
> -     if (flags & PTE_LM)
> -             pte |=3D GEN12_PPGTT_PTE_LM;
> -
>       /*
>        * For pre-gen12 platforms pat_index is the same as enum
>        * i915_cache_level, so the switch-case here is still valid.
> --
> 2.39.2
