Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE45B5FFE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B721610E093;
	Mon, 12 Sep 2022 18:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7E110E092;
 Mon, 12 Sep 2022 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663006376; x=1694542376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=de/jAtIybAdvACYUhGHLse0/KrJQiBjxie5XvimIhuI=;
 b=MO3/wqHnJc4nCcuM1P8zWihLX+8ZtIYqLrZnDLrUlMFdUrYY0JhdwsWf
 Q8dLEnkIxtVEX5FkiwoX0U9XxzeHNoDmupb5a1mxqbpSo1Sf3KaMytyLR
 bIR/qXNrfYf0H9wv7C3mdJ0/xNYy5uIpl0GjfJf/GRyozdkE98xnOVLYW
 FDHadQj0wBqWspBfWpAcf9dYE/q0yDRWeYuE4N6xKuNA5vlMLqfGrkJSe
 fwRV88XDf5pKYYTEq05hrK5/43TfJnJi2XOZbPSFPHDzJT/dAhxJDD/T4
 jEm4LeYqV593ebjwG5lDEmQtBYA8Gs9iRMZBgwFZS2D38Z7KUMBtHnoIV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="297936663"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="297936663"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 11:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="649356124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 12 Sep 2022 11:12:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 11:12:52 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 11:12:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 11:12:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 11:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqOQ6NSnsHBJ0iP3rCT5/A8RMsBAeOonBFiyZBbGFiZtYH3/O4jgBohvMpTY1Cfcaqzc1x5uAAlOALFlDMVT2c4q9fV+4J3dPjKoPU41cYZiypbhSouVS0cNMs0GEjPyKH5MOBycoKpSeJK03N1WqalTfSy2YF24+S6N8WBb1W6vH0f6/XTHRPcsxjjzebCqA8Ba2G6I7wx8YyowVIzv6HQNPlXcOOplZJW6UYzmOZ0XDWvzNt0pvz8X40gQRnp2NOUgRt1EM1JUgNaSBaavhB6I/soPnAP6IdZ6rwwpGztWIgHTfJ5ZrQjhfNe7RvIPhyeMVW+2EK31Fr1YE/7HCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKr0NaPOb9BUHnEDJsXLXkLrnlGDjhfxkLBLJBf4X+A=;
 b=bBXXEG8KCQuj1LLsJ0AWrFkNohJvkxclov8JEKbBj45+hYvDyA1f6gKCrzknbV/wQHLRMVsMfxI9brB6m5ZlvkGQsvUDDWEjAaZeIefrQ+tVNhIQ2Ow/mOd1BM+PsvCLXwvar/qtEL0X4C0ZkMf50Y+hwhV8lKNK73oSP/ToEQrD7yEdFN8mhxKp+/AlZxmZIog+8agRJZWbZMzEmqT4tqbLZuBsJPIa7ROfmzxuaDXFqKGdNPXGcaGripcmb0nZT7//0uSGiluZ6zSaaKl5kkD1VmH+4UWFJ2DDVvcodBN8Wbt1UUk+9cVeqBYLQk0NfsMVEwqsbiTjQ5ry7t886w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 18:12:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 18:12:49 +0000
Date: Mon, 12 Sep 2022 11:12:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915: Skip applying copy engine
 fuses
Message-ID: <20220912181247.dfyupvp4qxbavnen@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
 <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
 <Yx9liQu4JmnVmWVn@alfio.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Yx9liQu4JmnVmWVn@alfio.lan>
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: a637b42a-3577-4fdb-7208-08da94ea66ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZE8Y1UBgkE4FN09GF5W40NOTJeEeIcX78WXdVWhlziEYvG+5m+E80euIQCN+HjS4ui/oLLwxbyVrSzr3ZrDrJm5fIgw2BVpPkaj+bqZJUSOhsUfafMiM3w/tIf+hV7EgabZAIZk4wM//xSvBbrWaZCkrqWgdCdOMZPsdcnWRA2aOmz75+piXm66nRwFNFMwhRU1psId0aADGEzgrmqeDuyMfY9G9EWK4L0hhRgFLSfsByBMICHPKVsdxBJaKVAzkVq2RJgieUC//30Z1vNJ17puNRLiFJoOAXt1+v0MTfRH3Lnu3jbCp5W9BfobJHcI60T5eqbeB78NcuYdFqSIYdX1R3mJk5uLrQjIkSCWDiIsFT76g65ei62PBIXq/hKfFc03MOOm7RHzfhqfGaSKpAXvi49MpKRiNOqz0brbGb8TqFuPlzkYBQrQAp+gJeYsbcxYOy+asqUVHCdeUTVhry5igeFjTQPc19ZzqTk7UeFx8mfilSNuzXrLRoi69iL92v5ugp0wYG/m5R8S7Muu//3eiuPlUf5Pit6yF823Lsr+IMGWPXQ9DEzRcH9vlnTn2y754J44cOqKsIQ4l+y+aXMDn9v0C8etdT1+SdDdrQjNp+hj8DuI6jcGFcDD1oiD13HAKCCBKvlsaO9Uw+l0snxA0pViS6DYF3ZpVqnPxAs5bzMSs+rOKLdr4l78sfLCX760MTSNQuCKMX64nB9E0Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(41300700001)(186003)(82960400001)(86362001)(38100700002)(8676002)(8936002)(478600001)(1076003)(6506007)(26005)(5660300002)(6512007)(66946007)(83380400001)(2906002)(36756003)(6916009)(66476007)(66556008)(316002)(4326008)(9686003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irETdcN7gcvNKuE7x+pS7gqgr0hHrCzr6qJRNyA7YtGyqmo6u1RlPjoZI0G/?=
 =?us-ascii?Q?2p004XutDl5QsOpZ539S1s7gmP4y1Jnatv+F8q96/wczjE93hf3qfALdjuXu?=
 =?us-ascii?Q?cRwoLbQef5uKBN3SpQ1iHR4U+T/WezsNcViyK/H2B3E/yQmg+btDSWZuIjHU?=
 =?us-ascii?Q?sNFVbNn3hhq19w/caVVZFxJ81NHxbSuPthG653yRs3KpcKTyKIaIGkF68cTO?=
 =?us-ascii?Q?CnEB9kOoFVlupTLflfqqDtGCxcxnrdCtM3S5m/FLoxgRgOS/gaObshCaJXQT?=
 =?us-ascii?Q?JWVQFXR0ImBTaSzKQCox+Cte/ubJwJO6n1npcG6ptvxjcZ+2gvZ24pVlcEYV?=
 =?us-ascii?Q?wI5l04x6+OxN8zCi8SqxM5pXqENzdL3DlO30ikCXof9e7pmzBeT0MUVIphI0?=
 =?us-ascii?Q?WHLrWejjZ2/+h3b8PCm8hXI6VkCV5ISgi59zBDvQ69jF/Nb7SosidDnHzfb7?=
 =?us-ascii?Q?0/PXlaEyoDi3kb5WADTXh7H0z6sfw/fhvHdRiMuHK4emygfsuNpxdUlu4dZS?=
 =?us-ascii?Q?td9+WKyv+2Ehlc9N1kCRwLYPPDbO841MO3rwFUyliVuKmzI3VlqgBtLssYjm?=
 =?us-ascii?Q?HzdaVt5858EQVQP2nHtfPIOkpj58YoPao72XesIzwduoYAbjy+3jvUU0TEEM?=
 =?us-ascii?Q?R2Top5tZb8SepqMC9GfokhPfvHx3ZfUQqhwcmTMVxMaPdwRhcWFRaUMkYwtp?=
 =?us-ascii?Q?j6qfCw+DS4vVsUT2VDAUoupoRqHR2CQ9dji18ohVTMJFVYPaiLtyNx0racVr?=
 =?us-ascii?Q?ExoeTk6dzr69t9jy1wOKTWGv3AawAjXm9uYq99Pv2VHFsaTBG9c/JoxDdSBv?=
 =?us-ascii?Q?NFptN8FdsZ3st7dfbwdNJODfjVG8LNkZE2i6+YRIC5yKcih1mLdvoUkAEXgJ?=
 =?us-ascii?Q?NsJqKJ7AOu5Lwgn5OpTRMG1xyAntCcxXsIlP192Lnt27kAV7N4g9nuZ7GXeL?=
 =?us-ascii?Q?0N5LL9gfD2acdpcj+pN089aRZ1tja16ztt9CJr4EEBG+OxqPeAw5T4aodMEe?=
 =?us-ascii?Q?bc7VynzyyUMYXrb/bBbnrgR1B+0PyticTFPq7XDtxrcBqnmh7khncNGE7FgO?=
 =?us-ascii?Q?sVxT8G8oYNJ7Vce6QVgdWijOILOGmWyCunygwwZUondnHumiOmlzZdUJOCqL?=
 =?us-ascii?Q?PgfGBu2mfNhUn5tlufMIBJfRXc0fc6eUsHSei572zHzpPLK60rfKNSbWmn+2?=
 =?us-ascii?Q?BXZ83CqSFxbgUdZO3RQ1FNMw7JpoZo137PeYBir+L4cw1eISncl6u2qZsqlf?=
 =?us-ascii?Q?BA6i7JFefyN2aQfX49y+vdWEp4G6W8NR3ZsGWONpF5M65ifWi/KsffkLe8fn?=
 =?us-ascii?Q?dXmfbgqnks90YrcG6EW2w8SJNEN3BXOP6qMSNMHSaMDFz/6XKZ+DQLvQGGCb?=
 =?us-ascii?Q?nTItPfTSjM4gUiubTrwZ0BVBChnGeWQyLoP0PKsIXkLpQ1V4KkNvcL37mvjK?=
 =?us-ascii?Q?ytmSBM00BhcGBvZhwQouxXJyYeOUyb/UWiHhgaHuReqUat9hJ9VA8tWwylcA?=
 =?us-ascii?Q?FXxfndwT5ute5HmBF2f4SX1zwXZ3eJzUjOuh48RZlyN8Cr8wgd9IGFmE++0z?=
 =?us-ascii?Q?YsL2yjrpVRpJ55WaPYdfAIlKcI50rV9kkbuHPBcXXV5PXFxVNxF8R1cgNuP+?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a637b42a-3577-4fdb-7208-08da94ea66ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 18:12:49.6163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aqGiExuJC/chyznKVC7hsvWwZ+4afr5MkMg8H7v41JbwkGXZMTrBDxWiaLgOhYIwXbbsBdZUQLC9mWmGhHXlYXZGPDIrq2FJKZhINJvFrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 06:59:53PM +0200, Andi Shyti wrote:
>Hi Lucas,
>
>On Mon, Sep 12, 2022 at 09:19:38AM -0700, Lucas De Marchi wrote:
>> Support for reading the fuses to check what are the Link Copy engines
>> was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
>> copy engines"). However they were added unconditionally because the
>> FUSE3 register is present since graphics version 10.
>>
>> However the bitfield with meml3 fuses only exists since graphics version
>> 12. Moreover, Link Copy engines are currently only available in PVC.
>> Tying additional copy engines to the meml3 fuses is not correct for
>> other platforms.
>>
>> Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
>> may extend this function later if it's needed to fuse off copy engines.
>>
>> Currently it's harmless as the Link Copy engines are still not exported:
>> info->engine_mask only has BCS0 set and the register is only read for
>> platforms that do have it.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 814f83b5fe59..1f7188129cd1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -764,6 +764,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
>>  	unsigned long meml3_mask;
>>  	unsigned long quad;
>>
>> +	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
>> +	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
>> +		return;
>> +
>
>Isn't it easier if you wrote
>
>	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 60) ||
>	    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>		return;
>
>?
>
>You save a parenthesis and a negation '!'.

but that makes it wrong. I'd really want the range
12.60 <= version < 12.70, so it applies to PVC  but is then disabled
again for MTL.  Depending on how this evolves for future platforms, we
may change it to a feature flag or just check by platform
name. For now I think this is the most future-proof option.

Lucas De Marchi

>
>Anyway, looks good:
>
>Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
>Andi
>
>>  	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
>>  	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
>>
>>
>> --
>> b4 0.10.0-dev-df873
