Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE596E7F09
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1707110E0E8;
	Wed, 19 Apr 2023 16:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6313E10E052;
 Wed, 19 Apr 2023 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681920038; x=1713456038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VrLj3BeZT1t9BVU5gJZgd8S8+VsdgDOQ6RIL81+37qQ=;
 b=MerRmUmtIrxm+g+bg8IHVSZSPnfI4MG2n3c0/NvX0R5SxuGyeiY4bJmG
 owzSE5SYfXLTeAHFbpVZqonJa5FtDkDTCCBpe4o25KbyvKOpwOF6s/XOq
 aYZSw0ji7GwgemJED1t//JIkiEabppUbCFhzolNrd5ciRG+0bFVyrcPEO
 Ahlr/129jR2ge+/ISGKNMXuiWHUq2s4Vr4OYek/d37t81DcIBCxYwFWGJ
 YkbohDutpGOFlBht9HI7rohcxDKwnI/UzbN74XrxKYtsNgumLHUrLnXUq
 PSFkYKME7umNCNMDdttMvejtXgfvor7JCrAczqMmUjeh67Abw0AZTEJ5X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408396980"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408396980"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802960420"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802960420"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 09:00:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 09:00:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 09:00:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 09:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxMykw2ifNDM+5UJvDKAvNj4ot7JM+f+FLmvzUE0beIVAAxI+bjR5vSF7OZxVRVMYwQR7BZGr71KMpBXClBSbd485nufkxKoO+37+AOiB8TipNWqgJLgDSKMDyr3yLavuNILyr3QaMJ/dCsaYwhyiCC+7xAIOe6nxH1ox0FOhQ9iT5DTidHPYFvh4EuFtd5LeAJWUQvEGHiAirU2oRRxKFBeO8aTMPvK4BbFNol9oIpcm5gnRW6Ak/ROO6R0W/eCy34/bswxdvJr7BA9s5Eq3FrFEVY3UJ1s4AY6ktMQl9MSiLTxenlyaYtkpV4BbPTYFgGeNaxFYn9VkKgZF67Peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOpAFfy4VOIrOfFz9V85hGlJi0QmiytW/fLY5x6YkvM=;
 b=IztEJJ3zl7eBVGrQBr06/3xwV/nfUbrt0PSDaDQLBWZTqUBAYiUMsqa6+sc67ozcrMNKFuwd7TCbArpQery9ZY4bZsdqbT/e8kgvzh9gYRPSmNye9acCYnOyICxaTiuO5TarlqO0CvylPHPSpZHmk6xEiICxLnVwsKL1Crcj5uIk8U8F9C8q0N+dkPRghp/Wk8YMeos+XBa1HCna6sGRVYjqtPops1Cq11KdJbjjk+BN+hFalsmL3m0MRFcLfjGnMDJ+qeBmydZbNCac/CEZqcxiZdqdQ/S4eec5fkurEZ9yVkYOZ/kO/bmLacEnwidFY7bk452rgFUWsLO3OyWFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 16:00:29 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:00:28 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZcPU8pV7LJrvK6E+GLGIe52dGEa8yeroAgABQzaA=
Date: Wed, 19 Apr 2023 16:00:28 +0000
Message-ID: <SN6PR11MB2574A2515A7ABC4639252F519A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-3-fei.yang@intel.com>
 <ZD/KFgdE4mtvKCPJ@ashyti-mobl2.lan>
In-Reply-To: <ZD/KFgdE4mtvKCPJ@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|PH0PR11MB4792:EE_
x-ms-office365-filtering-correlation-id: 7f1b2f9f-99a4-47cb-0039-08db40ef3259
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tLCzmY/qljWXWIg9+E9rSrQdDbjd/Vq8StVu5Af1qJwSdbkjvWJNPDHYrcT7jLsbgawx0ketlAkPaTo1lEjE1vtS+yxGS1EQnihTJfnUhF4WBs/k1bmgw6qVbQt4m04Wc8pyN71XpRVJpEnKT51IjFxH7o8PG8qWr3kILXJGWl4hWBtZrXDZ1HF1Zbl4ettG4xduz965mm/MwLce7EKc8H8SHsg1/usg5fBa4dVSXuUnPkCJwfdfuw0Qtcbea/w1hZE7MQTwDe87aKJlEhS6boz/NawNHPyEOfEbGGaEtTx28cRqY+Gj5k8stQt9ZY8J3B2L3hCBDex8d1y0z0DzponHRZJqTx+ctKZBQvM6saKNUBV247Amm7f7NLhDO5uhfnNAwmiFopkhvJb6VJfsOEdHxCeS6AGjb5/Hlm+IWoEglJsKnt3YW51OvS0s1TQiDDw2nlsKPUBJ/wVFFE7+a6cRW/YoEeRqAtskuyze6eN/xkyq1qdGbJw1WVf4dCktzch5hgtkXaRZyoAiN+SSZ2yN5tDN4bl2x57IEs7GRUTR68BlCMgoPsiI+WH7+CDV+EuS1DHDDg8c63sYUNYFGQgwq7e+gaR2U+SSiLwz59NZFyatRt+X8UJBbg+YZPxK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(38070700005)(2906002)(8936002)(38100700002)(8676002)(5660300002)(52536014)(33656002)(86362001)(55016003)(7696005)(71200400001)(9686003)(6506007)(26005)(54906003)(478600001)(83380400001)(186003)(316002)(4326008)(6916009)(82960400001)(66556008)(66476007)(64756008)(66446008)(76116006)(66946007)(122000001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vNT648u3Ook1of0dFGn4Y86kzDWV1SZhD1inJQqCtxlaYWUIZ8bUxu6qCpGw?=
 =?us-ascii?Q?80/X4ewobNXtdU90fviK5g/JhmerVCoNsUC72d4swP127qDU1oziWRvOaQZU?=
 =?us-ascii?Q?212i1AGk8YIZaBDv3zqUTCHtwv2GWBx1RascntqCTwXYYhpm8XKMmtcGSLjn?=
 =?us-ascii?Q?bBdd0D9kJNolQazvLhm43pPSoMLHvW2oXv5S0oSZyekM8tD1gro2k8TgchFL?=
 =?us-ascii?Q?Vlbwd4kyl7SWI+e5Q71uXoI2o3wyzbC5T5HbP8A57VsSIlqE9T6NpGd/zX7m?=
 =?us-ascii?Q?VCPaymIUpTRaQ4kpoGJQ+Ju3NuZLyz+0dIae7n0uONa7PJrjuhOOV24JJKTr?=
 =?us-ascii?Q?+ngkER/+7xWaNI+Xe13VKQZGVw1rZ58OY2vsHiZ0KkpM+Dd6Rs4hvnFk+qCs?=
 =?us-ascii?Q?/gpERW5t+N0rPoMS2fC2rlXgFsuxx4AgabYSTZAVFQl2gPSli+u3ze1SDmMn?=
 =?us-ascii?Q?EKhUFtej7h5Epyjib+vJ85Dr0flIhQGkpE7mP8YoL8dK+lQprhDfQMj55k05?=
 =?us-ascii?Q?1DXg/9bkiOiWub5JMNhyymt96S7/wA4EomeeH3A3Kb7pktrb6ZUp7lKzqZ3e?=
 =?us-ascii?Q?Y1wT/TClfvuCAjxSlPBE+O8aTrTSfrnxiqeuijCil8gIjfo4iwJvb0KueVKm?=
 =?us-ascii?Q?l/SC/eK9Hqp+JG6nQ7qPeSuUF+GbYbVZDPcAGJOuAB8y81Nis9p0UScdr5mU?=
 =?us-ascii?Q?r+u41Mxj4c/oLevV4qFOBYxIpEysQHgeWIRyeKqi7wwRCMqWubLu6r/ZWNWl?=
 =?us-ascii?Q?l55ysBwJM5IGq2L+n6GjqnnLtrtxXyLgPdOwTEwhENkYEZBOniexcOULNqYu?=
 =?us-ascii?Q?Yxva5KHEI3eNQYK5LlSeSJrD1SZVcZoBOMtwZX23ZcMGVDfOmtiIea4hodl8?=
 =?us-ascii?Q?nHzSRlEELqYtUTlFGvVXcHLFPXMaoHV//lS8YX0oTs9V+5fo4CeL8jn+zAml?=
 =?us-ascii?Q?67rcnLFyg8bFEhxBKFqabEDMdLspklMkB75uSDQEWBq80lQecqtFewbA96no?=
 =?us-ascii?Q?43UoM4K+K52K858zvSQMRtRMs1yVjEugaBZdzp7fwmB7giW+gEviaXjYn+Wr?=
 =?us-ascii?Q?BRE55aK4AX4uU3QmV5pwerJrX6NVITDwJXqtOx7PmC9vk2VLX8PFrhi2ttyI?=
 =?us-ascii?Q?1b/TA5tzEk1raNtLy3atBt5URaDlIL+XmAB9PAGDEbVNAsNV6glKoZbjRkmf?=
 =?us-ascii?Q?lLq+GqQbynLVkjLXjpEb2OUmzAZ74ma/rr9HjsfCCFtIuh2YLv8imjF/T0C9?=
 =?us-ascii?Q?y0pIrIYMgvuA2TlO4ZUeEd6U2gOO+Cge11ZOZTJI4twEAANyldkVxcL602Cw?=
 =?us-ascii?Q?61Ej3jtcDzW2V6AADZsnbATseohrxHHMHHocRm+8SAtpdxfzkMEVn+0Kqw4b?=
 =?us-ascii?Q?2+zH+D3gGF9ERxffGCu7lb/DLlsrMH7Lnq0r6HLfTQY1fKyro3KNTDW2GHzp?=
 =?us-ascii?Q?zoeygPzBRw+1w77WyhYkt4xo07ObOOw78C0H+SbFNIINTlqM1bvKvzEIy/vl?=
 =?us-ascii?Q?KqXYenN5fSXZkBlemk6kiOLdrl/ULLvOgbSK60U2lN2eMpgEv50Af+dPB1YQ?=
 =?us-ascii?Q?Fr3QLraFMkp4cyBmT5A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1b2f9f-99a4-47cb-0039-08db40ef3259
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 16:00:28.8606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7A06i0xI3hbPFuHh7lZ+DX5vVBb5XBe5ERQY8OpgvUJPI2v1hRZWBpBAyDvHS3LShxiIOH8dszkxA8nvtN2knw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi Fei,
>
> On Sun, Apr 16, 2023 at 11:24:57PM -0700, fei.yang@intel.com wrote:
>> From: Madhumitha Tolakanahalli Pradeep
>> <madhumitha.tolakanahalli.pradeep@intel.com>
>>
>> On MTL, GT can no longer allocate on LLC - only the CPU can.
>> This, along with addition of support for L4 cache calls a MOCS/PAT
>> table update.
>> Alos the PAT index registers are multicasted for primary GT,
>
> /Alos/Also/

Will update

>[...]
>
>> +static void xelpmp_setup_private_ppat(struct intel_uncore *uncore) {
>> +    intel_uncore_write(uncore, XELPMP_PAT_INDEX(0), MTL_PPAT_L4_0_WB);
>> +    intel_uncore_write(uncore, XELPMP_PAT_INDEX(1), MTL_PPAT_L4_1_WT);
>> +    intel_uncore_write(uncore, XELPMP_PAT_INDEX(2), MTL_PPAT_L4_3_UC);
>> +    intel_uncore_write(uncore, XELPMP_PAT_INDEX(3),
>> +                       MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
>> +    intel_uncore_write(uncore, XELPMP_PAT_INDEX(4),
>> +                       MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
>
> nit: I think it's more readable if we either keep everything in one
> line or we break the line for everyone. Even if we break the 80
> characters rule.

Will update

>[...]
>
>> @@ -603,16 +639,22 @@ void setup_private_pat(struct intel_gt *gt)
>>
>>      GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>>
>> -    if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>> -            xehp_setup_private_ppat(gt);
>> -    else if (GRAPHICS_VER(i915) >=3D 12)
>> -            tgl_setup_private_ppat(uncore);
>> -    else if (GRAPHICS_VER(i915) >=3D 11)
>> -            icl_setup_private_ppat(uncore);
>> -    else if (IS_CHERRYVIEW(i915) || IS_GEN9_LP(i915))
>> -            chv_setup_private_ppat(uncore);
>> -    else
>> -            bdw_setup_private_ppat(uncore);
>> +    if (gt->type =3D=3D GT_MEDIA) {
>> +            xelpmp_setup_private_ppat(gt->uncore);
>
>nit: if you add a return here you save the else.

Will update.

>> +    } else {
>> +            if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 70))
>> +                    xelpg_setup_private_ppat(gt);
>> +            else if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>> +                    xehp_setup_private_ppat(gt);
>> +            else if (GRAPHICS_VER(i915) >=3D 12)
>> +                    tgl_setup_private_ppat(uncore);
>> +            else if (GRAPHICS_VER(i915) >=3D 11)
>> +                    icl_setup_private_ppat(uncore);
>> +            else if (IS_CHERRYVIEW(i915) || IS_GEN9_LP(i915))
>> +                    chv_setup_private_ppat(uncore);
>> +            else
>> +                    bdw_setup_private_ppat(uncore);
>> +    }
>
> [...]
>
>> -static u32 global_mocs_offset(void)
>> +static u32 global_mocs_offset(struct intel_gt *gt)
>>  {
>> -    return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
>> +    return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) +
>> +gt->uncore->gsi_offset;
>
> There is one open question here coming from one of previous Matt's review=
s.
> Would it make sense to have this in a different patch?

I would prefer keeping it in this patch because the function is called by
intel_mocs_init(). Without it the MOCS initialization would be broken for
media GT.

> Andi
