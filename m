Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7F65DCD0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 20:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9498510E474;
	Wed,  4 Jan 2023 19:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543BF10E474;
 Wed,  4 Jan 2023 19:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672860867; x=1704396867;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E3ComwFojvOa8qiNIYkgYAOFyApd7XHHOEWI4z8/WW8=;
 b=dPFvgJLSR2p31CVW0aq5V95eNe2BozCxFACQu7qmykcc3Fll16GoPb3O
 E98nA95/H8UCQNExSlESARxJJBt8yL7T1MyCztFKjeaPxJId5ssqbr07n
 HMfxsJbqDKGdgAPlaelacsRyKsRanwhmH9qjnEOHNQcIV9F/wQ8PGfEkW
 yS0bVcA2kPGjMEG72IN9BLPlS2/xJvc3GeWC7AhWNm7adOz1sOnax4lOv
 xGSiITXWdFokfdHEjcx/pEg3c9LopjlXAYV1EdiJjbHpDcfje0XZ+zn93
 FEil9I0h3Hr7GQcgeV6AVGrHlFE5QGUPt7NPyT03VDPtvNDyUxM/xVuLq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="309790545"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="309790545"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 11:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="687633249"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="687633249"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 04 Jan 2023 11:34:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 11:34:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 11:34:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 11:34:26 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 4 Jan 2023 11:34:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZxtufq2gI1sOtjJCHbl0HKvGf2GfdP90+D53vwG5vnMadcxzug3fXF12VG+Ferur1LDKE0SbaRBI6xxol33cUZzz570iEVkHwZ1O7KH4jzSqxwCKwe4maGmf3DBao4zGMNUPu6jNjS2tDZq8edkc44Krghq0p6IEnNzSQbxOe0sQeZA5zFACi24ZreF6nx/umdbuzNeR7DYySCkAylf4R2wMnts8hnPvYG+k5y6u0YYsnr0SMABxa1oEDrrYR8JfVpZr17TN1swbPkJ16T6stfpuxnykh/WXZ6ge3bBnST7bjxA6AgSunxE2SaMAGjISWNITQ1i2BahRsns6aVI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U0Q6/h8wDaBWnMGOujil7BE9rcott5NkffuSzNbr74=;
 b=WstFL59/C7nymXALaS/McbQrR+HgRNvjPOLLZ3vdI9SBtbzB11dDWsWGopIPsNPvTkEqX3ynsexFzT2gnqumabSTThBVrCtRCpGrsF+NsraU3PqamLkqN5P0q9OFpKZLFAx9jBi0wlevfccR0lfi3gyZCUCzbFrQTTH4URtdvotNYGMPRKxiKjVDEnrzQHV+c9HwRtc5Q4pdsjBDBTP6W0eFiMiG/jnulgKyWXaNCG8PhOXafpi04i2i0FJEf9JeiHfGYTdY32iwnt4EXBkQwgFlcAvZ3TR/tXqpR2tZ/MivePNuEQVeNLBQCFn8YlcK9hoA7Xm1YOGdiJmv5FLnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5503.namprd11.prod.outlook.com (2603:10b6:5:39f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 19:34:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 19:34:23 +0000
Date: Wed, 4 Jan 2023 11:34:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Message-ID: <Y7XUvMUDYEHwX17+@mdroper-desk1.amr.corp.intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
 <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
 <20221223182807.tfyrx2yrjbv4flx7@ldmartin-desk2.lan>
 <2641f51d-8b79-0d47-90f5-b60e9f6edf33@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2641f51d-8b79-0d47-90f5-b60e9f6edf33@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 7192dfb7-848d-474d-7277-08daee8aaee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBcvoayt6vOcRzSox5XIH8wKh/ZZ4Bep8O3TQ6YAcW40rSnJnFbedxBqR3Dwf6RRsZkKZWeKb/UcYIxsEK54us3V3EwzwOFc72JMX8mbAK3FL/NCXE9wtg+mttR9LJQhLg0B3BXyjBDfS2+2cpQuPnxQWDGf1KGOQOs3arp7kl7fBgkrXjbaHBYDOtiDneLc+RgmWHLPj5K2I8unXCOTAAVSSQKGnWqPOHHqcDjswuh+IcfkrUSQqK+xUzchHSE7r4oXGmSav6OUPqQ+LW1LIM4ccRust553GYAP/Nmu/WZB9J38YtJnadqSUBelmbQJr/N3aSPusMtCNzSGL5THnqDsAqScTq8o0KmExPqZGGZp4i6oXoeVMzBSwt/J1CsutC7Vx8tcghPNzEMZElUe3wOI1FhYF9+cBEI3Sq6hc7XKx//CP8cqVrpsdCiDcIXI7YWmMlbF7SRIrdaTHiIRmlbk9+rE14khycxBBmjyVRRvlOVU9s5zZ/2xI7Yp/qUpJ9KJPx+K8CwKv/JQ4xOYeY5W5jzLR5+PJ1H02S7TFthwcZEf33T0CPhfSZzKW9AmqQMR4cZ/4T1alN77ANgpMsku1vu+pY91DXOFQbWhiBKiEeULYznPYzWjBCrHpSwGX+QfGZj+235Kq7x0E89e3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(6512007)(82960400001)(478600001)(966005)(6486002)(5660300002)(38100700002)(30864003)(8936002)(6506007)(66476007)(66946007)(66899015)(41300700001)(66556008)(4326008)(8676002)(53546011)(66574015)(316002)(6916009)(26005)(86362001)(83380400001)(54906003)(186003)(2906002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5zVQSfTpmf2Q28ybpFtHmww5EMEBRNGeVqbdkUyucKURKFtl2UdM60NEm1?=
 =?iso-8859-1?Q?5FwJxMsAtJ/J9WoE4XtrGAV7LnkyDm+LuzS9mHNBGeUztdCI7+KZSSvIOl?=
 =?iso-8859-1?Q?KdzRBf3qinTs4cxjm069NvybrcUPnxUsJ1YLGFU2La1TY8GfuIIrfhA7+M?=
 =?iso-8859-1?Q?w3fprYSnLfCj2on6vZQPnolkVh77SMO8fDRjF3wMjgxPp3nabBQI3tjoCP?=
 =?iso-8859-1?Q?k8rOV8YGZn5mfJQCu9TNgEQguCJzdNBiaDlsJH97i5cBdaS+riCuvVoqQR?=
 =?iso-8859-1?Q?QPgx8HJdhjPx84MIkIais79zl2uFX7awtB8Y3gi3HlB2Ej4y2qefTAcSeZ?=
 =?iso-8859-1?Q?0LyoseVoBd5V25jVBWDvibHeOgEnZjyVUlAFGI2WYNqdrC9axgZ5ViwpWH?=
 =?iso-8859-1?Q?jIoG1PXlG9Qvr7Oeene/yzAg3nc+hhGCXB/pNLnOOw6BRcKYSc+oMjuulU?=
 =?iso-8859-1?Q?MPwzNodRLTZFGi2VLD0A/5V+Mm26JOBSiqQAiV9BBeFnoAdV9VysedF3aT?=
 =?iso-8859-1?Q?M/c5+SzkDf79Qs95iCDHpNPUVsJiznPYUC7y4AZdUQVAgQSOpkS+v1UxjG?=
 =?iso-8859-1?Q?0P0dLkN4uWKoHmzAaaEFpWQyT+/1/EnMeg8fEXQ68GoqaQWDq1c71bC/oA?=
 =?iso-8859-1?Q?m+1t5MLswPW6Dm3deN+mncSoQhcj5a5iO6z//ZpIQGF9wCIiB2pp/onRo9?=
 =?iso-8859-1?Q?8ZnPwqybsisJ+DSseZJKNNyFD72FpYDpyHUj2LoY+m2cAYONaVdPmmIqmB?=
 =?iso-8859-1?Q?r7eTr8ALRix7H22swt9eAyPOly8HC46DrRaB2XJHfx4z9Zyy/2u/IDRkP+?=
 =?iso-8859-1?Q?HRht3VK5REPgNRwQFSRoi7eC1aprhNgtZMg5PhBl/FhYxXUau/wN2TdShI?=
 =?iso-8859-1?Q?xghIGxTVURHxAKqm5NOVMbZGGgygDLPIsYbYaeaSviFdu24qMxmDZPbzx8?=
 =?iso-8859-1?Q?chB9UC0dG09llzjwVh4vcxzDmCfwhj8gAZMRPwZnDXnxpmHeODV/bWUFu7?=
 =?iso-8859-1?Q?s9+J9DTW4WpvTAyjkyEDHMH5lhR8d8uW8ts9xNpthyTTXUe1tjkxsACLtx?=
 =?iso-8859-1?Q?Ynz1xl191zS6KvB/vnlQNOMuUsc4YIM8F1bXbiUpudZjib2vI1WwkA7VXi?=
 =?iso-8859-1?Q?CTkb+4bxm44TO90VZPO8US58HW8gTHIvwcfZRt9BfOL22bESc0OccFlRD2?=
 =?iso-8859-1?Q?Bpo9SsB2VHKNqiJ5y1FVQT5gtO3PwlKUjXTSIhix4s3xNl3YVxBm+m6yhv?=
 =?iso-8859-1?Q?JK3Htjr5D4UaPeYDhzX1t4khuDwUiPiBUemgIUuYbyaLMh42x3kVClp5+g?=
 =?iso-8859-1?Q?Su8XMvYJYGG1+sr0blj3FbJ7Nn0NtlHnTgJy/2s1Zaop8pUvCcTlM2RK8R?=
 =?iso-8859-1?Q?gEygu+5l7d5NIUOHp+Anqp26TDfHPk/pgCrXg0yjunmJ5B5RRZtVCeRdd7?=
 =?iso-8859-1?Q?V5L5YfG4DCdEILfxsEmrCtJTidiQzAdwMvx0RLSeNvgM6+JqyVK0fh/kKP?=
 =?iso-8859-1?Q?UzaOp3grg0up6TYoguqmPXVaUei4x6QKGrgmbsg2VzI5bPfAmQowc3Grym?=
 =?iso-8859-1?Q?GE8bHUcW5nV9z3U+UXQF5WiacXc91Qlq4p4/JbKatecoIz0FfrE2bYMRdQ?=
 =?iso-8859-1?Q?f+IBJ7kVhnspnH2vT9/mJ1uCneMV54io9mErMD45IYJ8geeSIWVaXGqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7192dfb7-848d-474d-7277-08daee8aaee8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 19:34:23.5432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8axU3vaYEUHYPK+ZLVMikTMsy2+ACVBfaIRUZIV5h3lpjPNVCk3VC+y6f+uplLl6ZfN1YmVUJpelZvvI+xlG7K37QjIKfbw5xu6DaD/43sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5503
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 09:58:13AM +0000, Tvrtko Ursulin wrote:
> 
> On 23/12/2022 18:28, Lucas De Marchi wrote:
> > On Fri, Dec 23, 2022 at 09:02:35AM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 22/12/2022 15:55, Lucas De Marchi wrote:
> > > > On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 22/12/2022 08:25, Lucas De Marchi wrote:
> > > > > > The comments are redundant to the checks being done to apply the
> > > > > > workarounds and very often get outdated as workarounds need to be
> > > > > > extended to new platforms or steppings.  Remove them altogether with
> > > > > > the following matches (platforms extracted from intel_workarounds.c):
> > > > > > 
> > > > > >     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> > > > > > 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
> > > > > >     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
> > > > > > 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
> > > > > > 
> > > > > > Same things was executed in the gem directory, omitted
> > > > > > here for brevity.
> > > > > 
> > > > > > There were a few false positives that included the workaround
> > > > > > description. Those were manually patched.
> > > > > 
> > > > > sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
> > > > 
> > > > then there are false negatives. We have Was in the form
> > > > "Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
> > > > we simply don't see. After running that in gt/:
> > > > 
> > > > $ git grep ": mtl" -- drivers/gpu/drm/i915/
> > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> > > > drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
> > > > drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
> > > > 
> > > > I was going with the platform names to avoid the false
> > > > negatives and because I was entertaining the idea of only doing this for
> > > > latest platforms where we do have the "Wa_[[:number:]]" form
> > > > 
> > > > > 
> > > > > Maybe..
> > > > > 
> > > > > Matt recently said he has this worked planned, but more
> > > > > importantly - I gather then that the WA lookup tool
> > > > > definitely does not output these strings?
> > > > 
> > > > Whatever it does it's true only at the time it's called. It
> > > > simply tells what
> > > > are the platforms and steppings the Wa applies to. We can change the
> > > > output to whatever we want, but that is not the point.
> > > > Those comments get stale and bring no real value as they match 1:1
> > > > what the code is supposed to be doing. Several times a patch has to
> > > > update just that comment to "extend a workaround" to a next platform.
> > > > This is not always done, so we get a comment that doesn't match what is
> > > > supposed to be there.
> > > 
> > > Tl;dr; version - lets park this until January and discuss once
> > > everyone is back.
> > 
> > I'll leave my comment here since I will be out until mid January.
> > 
> > > 
> > > Longer version. I've been trying to get us talking about this a
> > > couple times before and I'd really like to close with an explicit
> > > consensus, discussion points addressed instead of skipped and just
> > > moving ahead with patches.
> > > 
> > > References:
> > >  3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
> > >  Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com
> > > 
> > > So point I wanted to discuss is whether these comments are truly
> > > useless or maybe they can help during review. If the tool can
> > > actually output them then I am leaning towards that they can be.
> > 
> > I consider "can the tool output xyz?" asking the wrong question.
> > "The tool", which is our own small python script querying a database can
> > output anything like that if we want to. The database has information of
> > what are the platforms/steppings for each the WA is known to be applied
> > *today*. And that can change and do change often, particularly for early
> > steppings and recent platforms.
> > 
> > > Thought is, when a patch comes for review adding a new platform,
> > > stepping, whatever, to an existing if condition, if it contains the
> > > comments reviewer can more easily spot a hyphotetical logic
> > > inversion error or similar. It is also trivial to check that both
> > > condition and comment have been updated. (So lets not be rash and
> > > remove something maybe useful just because it can go stale *only if*
> > > reviewers are not giving sufficient attention that changes are made
> > > in tandem.)
> > 
> > I can argue to the other side too. We don't have comments in the kernel
> > like
> > 
> >      /* Add 1 to i */
> >      i += 1;
> > 
> > This is exactly what these comments are doing. And they are misleading
> 
> I'll file this under "Reductio ad absurdum", kind of. :)
> 
> > and may introduce bugs rather than helping reviewing:
> > 
> >      Wa_12345:tgl[a0,c0)
> >      if (IS_TGL_GRAPHICS_STEP(STEP_A0, STEP_B0)
> > 
> > One might read the comment, skipping over the condition and thinking
> > "ok, we already extended this WA to B* steppings, which doesn't match
> > the code.
> 
> That would be reviewer error to assume B0 is the last B stepping, without
> actually checking. Equally as reviewer error would be to assume any WA
> adding patch is adding the correct conditions, again, without actually
> checking. Which leads me to ...
> 
> > > From a slightly different angle - do we expect anyone reviewing
> > > workaround patches will cross-check against the tool? Would it be
> > > simpler and more efficient that they could just cross-check against
> > > the comment output from the tool and put into the patch by the
> > > author?

I think this is the source of the confusion; the comment lines in i915
are not something the 'wa' tool outputs directly; the comments are
written manually by the developer at the same time the code is written;
the wa tool is just a quick python script I wrote one day to dump
database information from the command line and avoid needing to fire up
a web browser and click through a series of slow website links.  Also,
since the wa tool queries internal databases, it spits out a bunch of
Intel-internal terminology that doesn't match the terminology used in
i915 code, and it also includes a bunch of garbage data that needs to be
filtered out (duplicated records, mangled/incomplete records, etc.).
Exactly how things are expressed (platform name like "DG2" or IP name
like "Xe_HPG" also varies from platform to platform according to how the
hardware guys decided to categorize things).

Since the code and the comments are both something written by hand by
the developer, there's no reason to believe the comments will be more
accurate than the code.  They'll likely be far less accurate since they
can't be tested like the code is, and because the existing codebase is
wildly inconsistent with how we even format/represent them.

> > 
> > see above. Someone cross-checking the comment is cross-checking the
> > wrong thing. As I said, it happens more on early enabling of a platform.
> 
> ... my point which seems to have been missed by both, well question really,
> do you expect every reviewer to cross-check against the WA database when
> reviewing WA changes? I don't see that was answered.
> 
> I guarantee that it won't happen and people will rubber stamp. So my
> argument was that we could make it both easier for reviewers *and* decrease
> the likelyhood of misses, if we kept platforms designators in comments.

Yes, reviewers are absolutely supposed to be checking the stepping
bounds of every workarounds change they review.  That's one of the most
important parts of reviewing a workaround and it should be very quick
and easy to do.  If people are giving rubber stamps without doing that,
then they're not really doing a full review.  But I'm also not aware of
any cases where we're getting rubber stamps; most of the non-comment
review misses we have seem to either come from misunderstanding the
semantics of platforms (especially cases like DG2 where different
G10/G11/G12 variants have different stepping schemes) or technical
misunderstanding of the implementation details (register reset
characteristics, masked vs non-masked registers, context membership,
etc.).

> 
> Yeah it is much easier to rip them out that to find and fix the ones which
> went out of sync but that shouldn't be high on the list of criteria.
> 
> Argument that it is easy to overlook during review that comments and code do
> not match I don't think holds. That describes a very sloppy review. And if
> review is assumed to be that sloppy, do you really trust review to check
> against the WA database?

It's the same reason people who write prose can't find their own
spelling/grammer mistakes.  The mistakes are "obvious," but since their
brain already knows what it's "supposed" to say, they just can't see the
error themselves.  Once you've reviewed the code, it just gets really
hard to see where the comment doesn't align, especially for the
workarounds that apply to a bunch of platforms.

For example, if I'm reviewing a patch that adds:

    /* Wa_12345:tgl,dg1[a0],rkl,adls,dg2_g10,dg2_g12[a0..c0) */
    if (IS_TIGERLAKE(i915) || IS_DG1(i915) || IS_ROCKETLAKE(i915) ||
        IS_ALDERLAKE_P(i915) || IS_DG2_G10(i915) ||
        IS_DG2_GRAPHICS_STEP(i915, G12, STEP_A0, STEP_C0))

I'm always looking at the code first and comparing that to the
workaround database.  If I then review the comment second, I'm much less
likely to catch the subtle errors (there are two of them in this example
where the code and comment don't match!) because I mentally already know
what the bounds are "supposed" to be and the comment all just kind of
blends together.

> 
> So my argument is that it is trivial for reviewers to spot comments and code
> do not match. Trivial and fast. And it's trivial (I hope) for the WA tool to
> output the right format for pasting in comments.

Given how much terminology mismatch there is between the internal
database and how we refer to things in i915 code, it's not trivial.
It's also not super easy to even figure out which platforms to include
in the list.  The workaround database is going to include platforms for
which there is no i915 support (e.g., LKF) stuff like CNL (support
already removed from i915), and future/potential platforms we can't talk
about yet, etc.  Finally, when there are duplicated/conflicting records
(because the people inputting the information are just human too), it
takes a bit of human intelligence to read between the lines and figure
out what the reality is supposed to be.

Sure, these problems could probably all be solved with enough effort,
but given how often the internal formatting and behavior of the database
itself changes, it would be painful to keep it always working properly.

> 
> Those are the points I would like to have explicitly discounted before
> proceeding. Maybe to be even clearer the workflow would be like this:
> 
> Patch author:
> 
> 1. Runs the WA tool for a WA number. Tool outputs text.
> 2. Pastes text verbatim in the comment.

This one isn't correct today (and as noted above, not terribly easy to
accomplish).  It's

   2.  Developer manually writes code comment based on interpreting wa's
       output.


Matt

> 3. Adjusts code to match.
> 
> Reviewer:
> 
> 1. Verifies both code and comment were changed.
> 2. Verifies code matches the comment.
> 
> If the counter proposal is, patch author:
> 
> 1. Runs the WA tool for a WA number. Tool outputs text.
> 2. Adjusts code to match.
> 
> Reviewer:
> 
> 1. Runs the WA tool. Tool outputs text.
> 2. Checks patch matchs the WA tool output.
> 
> I will accept it but I strongly believe skipping of step 2 will happen and
> it will be impossible to know. Rubber stamping with the options of
> comments+code at least leaves a trace of comment and code being out of sync.
> 
> > > And point here to stress out is that accidental logic errors (missed
> > > workarounds) can be super expensive to debug in the field. Sometimes
> > > it can literally take _months_ for sporadic and hard to reproduce
> > > issues to get debugged, handed over between the teams, etc. So any
> > > way in which we can influence the likelyhood of that happening is
> > > something to weigh carefully.
> > 
> > yes, that's why I want to remove the comments: from my experience they
> > are more a source of bugs rather than helping.
> > 
> > > Secondary but also important - if i915 is end of line then an extra
> > > why we want to rip out this for ancient platforms. Is the
> > > cost/benefit positive there?
> > 
> > yep, here I agree and was my argument about using the platform names
> > rather than a more "catch all" regex. I think doing this only for tgl+
> > platforms or even dg2+ would be ok.
> 
> Okay this is something to have as a 2nd option indeed. DG2 is out of force
> probe so maybe try with MTL. Although different rules for different
> platforms I don't know if will work in practice. Could be justt too
> complicated to be practical.
> 
> > > As a side note, and going back to the question of what the tool can
> > > output. Long time ago I had an idea where we could improve all this
> > > by making it completely data-driven. Have the WA database inspecting
> > > tool output a table which could be directly pasted into code and
> > > interpreted by i915.
> > > 
> > > For reference look at intel_workarounds_table.h in
> > > https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3
> > > and see what you thing. That was just a sketch of the idea, not
> > > complete, and yes, i915 end of life point makes it moot.
> > 
> > now that xe is announced I can talk about this part... this was more
> > or less what I implemented in xe: it's a table with
> > "register + condition + action". There are the most common condition
> > checks builtin + a function hook for the more advanced ones. During
> > binding the driver walks the table and coalesces the entries creating
> > a per-register value that can be used at the proper times, depending if
> > they are gt, engine, context workarounds.
> 
> Cool, I support that high level approach.
> 
> Regards,
> 
> Tvrtko

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
