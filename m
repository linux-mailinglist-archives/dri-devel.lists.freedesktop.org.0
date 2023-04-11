Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01066DD087
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 05:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4CB10E474;
	Tue, 11 Apr 2023 03:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C12D10E472;
 Tue, 11 Apr 2023 03:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681185327; x=1712721327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=fASxPFONr1iu10m4ct6RZA8sB7DhTrUgy1CrbrIev+4=;
 b=aiCOjaFMEApqK1hhWF1ykxU8RFxEsOXBhXW/05i24pmNuJzv77mGklfg
 CQ/UkKLgK/H86Ovha14QYt9yEqETNkcVhaiJUEEZQlw9K7IP1m/j4f9+s
 VXGPz1W8z0rGb5VPlmpj3nqBTFyyoqcvQaaI2JLj0b6iRk4mWY1E22bUQ
 5loNXvOwPp1H1ONF/PyeBjx54VAqkKA4X2o/qjMTQYnsN1YLFSz8xF5zp
 wr1rg3YCJ/oyXE1G2AmQ5UpVojr5CoXiLaeZcjpfj9kLojuiMY4ZC+YId
 tjzA+HGgl5RCoRUQEWFh+WL4DytFP9YsSIfJMcwV2pDSRuYnTBlGCx5Ma w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408654039"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
 d="scan'208,217";a="408654039"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 20:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862698044"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
 d="scan'208,217";a="862698044"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 20:55:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 20:55:26 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 20:55:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 20:55:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 10 Apr 2023 20:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IO9CdCMWV/u3PN7Nif16Ww0Yj+p9XXt2X5gP2GMkUc+26E+cT+uFY488onvFXRwFv7EoLti13QmOZf3WWPRQ/149MSN0Ke17NOz9MDxgtm1agY3BrxjvOhBcXhE35OSyvsfBsaU1yPvZPquHlSIfGV1DiBiP7ePBO4W1vRjp3IPEETHzt4c9rGbjsgXFUEPL5q2iyH1zO92g+UlaH0QpCIIm9Naj3lQlvctW6vR6aDtfbfdulK/MxTBzZMqSKr98jH/hh+yqmf2AD8PP0Ca8QqBa4MuYkI1KVa/4q3dReDhmSo9LG00WaoSosmy+RSwWzrVLppMEfjyt13R5EezuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZp5I1KU3l0S7hpdWv85YaUy53gNSgQkeQmZYFhvZxw=;
 b=UqttY5k8OF1q/jwAzP/VHdr353RtliWefz4XHw0//gpWxaILmqbI1kajSAuj7Tha0kDwNZ6OD1dqWqHaCdxfN9jUWvn/lFAUVs0ftSmn/wKY5GT8Yt50hJKCWbe3TBrte/dxvTlWaEhHLNz7EbZiI09DqaNNlmkEJl6qa951U/pyF0vBivF2LnFWJvaFPtIirxL+kS86VmKdUn1wFvpHq89jBIuOUz8oOib9aCl8zQO9avQ/k4Tsskgjkovy7YJR7IBYe7Rb+PvGMO70fapmjz6kog0VpNf6RAN6uHkkrYBTOWB+GtCqZ8pKXdKrjUN9IFitc3PuGPxnefu6n7BFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 03:55:16 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::12b1:c9af:ed85:e3ee%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 03:55:16 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Thread-Index: AQHZaSAps9DZ2MEczUy95kW+44Z9z68kwmkAgAC1ntA=
Date: Tue, 11 Apr 2023 03:55:16 +0000
Message-ID: <BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230407071236.1960642-1-fei.yang@intel.com>
 <20230407071236.1960642-2-fei.yang@intel.com>
 <20230410163434.GU4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230410163434.GU4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SN7PR11MB6970:EE_
x-ms-office365-filtering-correlation-id: 7afdf4e8-7387-464d-cce4-08db3a408f88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qKYVwJZptUxGiOW4oMJCOFbGoWj0zqYYj4uO1V8dlKsDQkn2gK4ZIdcqE2N8tehQrYJmW0qYrl1TsZ/QlF93+vdA4iIDAcfNS5Rh0l4DNgXcxgz4k6czfnVppIVG74LgFx1RQYUML2eZuyf8uy2TKwD7QFTL3IqnvCsr/Kycvg6ybtmOQAmt/j27xk0a0smxYoAK0tk5Cp3nF1+/jk4ZC3j3+lxIPud3j//7jo0aTVq5R9sZCQDpE+GnX7B+kR2eBS1bHife+xdBSH7cgfUXIiXpCR9Cfwtq9kEZ+d2Ba23/Np0KrE2IyRuUDzVkYYpteFFsDOWX5yS12a6zHlwpeR+nkrW1n31EivKtUbgLZ2brT3ixPMYMGnARmSZvBuLL8J7tL9Ihk/rkdTRQbFi/+aPqciYsgGphwJl3BjvX16DpPxAbvDk8NgF/xwO0NIcAmbTo2JLss7ZcCLjqn4sRFlEmxuHfYQ35PgaDPb6AViWP8KrzIj7MKNe3UnnfbyvtbXv233PkKOpLqUSPBXKBMAOE6om48Ex8ir79PtuwWccT6f7WVbg9wn8u7e8ffpryWcSKLO3D4wTlhvuQzB1MnQKMMVLgWpebhNrXhb9tYBw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(33656002)(86362001)(2906002)(38070700005)(166002)(30864003)(55016003)(71200400001)(7696005)(9686003)(83380400001)(186003)(76116006)(6506007)(26005)(966005)(122000001)(478600001)(450100002)(4326008)(66556008)(66446008)(66476007)(66946007)(64756008)(316002)(8936002)(41300700001)(82960400001)(38100700002)(8676002)(6862004)(5660300002)(6636002)(54906003)(52536014)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6ZM75A1gvEU2pr3UMk4YTs044ooKY+1N6k3F1CnyDyfPywgLtfXVOASTBbHI?=
 =?us-ascii?Q?l2bnSl1ePq9tcDV4aqncuwOKHIW/iun6hAPGPUNDFSm7mW4LtloH9RPEhcMv?=
 =?us-ascii?Q?doiZB6CMU4n7IvLtV7c1ffB5u6ipCeU1JlrhHvVGflwUAkzaMXI4+IL3J5l7?=
 =?us-ascii?Q?+tFM0yN2lNhS0NvyVKE2LhCRA05Mf38ArIZCPG+rwE2jeOOepdim9sr6UhSg?=
 =?us-ascii?Q?OfenpFTakI0ce0/QKpYADJB59bwGnwn3Tk44aW9V1v5HQRadkHq4K+KJYFfs?=
 =?us-ascii?Q?3CQ84UtKyxOnlOt+tnxbDnembwCNOoMHKe3uBxrLOy0o0z7X2+qeS76NKB5N?=
 =?us-ascii?Q?Puz5soQ2fc+XldNsUNtE9MDhSFS5kmryChvrsEXBUjTiDMO66dG2PAOnH1Nc?=
 =?us-ascii?Q?iKGbpdPaV5OcfydiY0YJ040G4ab/Y8824ky2FAx2ZodRBEqR+hM85sgQeasN?=
 =?us-ascii?Q?CD2THGCOFfgJMfIRjzDmW43dvqCLfJOZvy/Oc1GhWjUYDyQrS6gOG8/phSMe?=
 =?us-ascii?Q?28Ji2gEDjufn5r7x5C1ecxNXs/2TYWVwTEbmoDLtAmxODmujgob3g03fkQh3?=
 =?us-ascii?Q?iwJapHx3GrOeZcCfRTKAuDffICoMuxTqvnXSTflYHxcS8QhE/SEZgZagTi0h?=
 =?us-ascii?Q?BCqhJz2fVPjFH5XK4375ICyVv9YaseT70wc8qKBrefk64s10xCLdShOHJ6zn?=
 =?us-ascii?Q?OYxO5fiRxeoc0dWYMuGfqs5hDFF6Gq1NiN4qum32XzGsoVj96SIclDxDq23v?=
 =?us-ascii?Q?Xvzsvax8hI/0R7QgnsWn1Iw9zV8N+5zb8M0lsuAd+9WM0FCltcrcM/J5XTue?=
 =?us-ascii?Q?xePDsaNsZ+nrxIYnHPK3LkJqoGuWrsRhXpsPhAb3KGjFC4AyA1OX9i+k/LgY?=
 =?us-ascii?Q?unTQh9Pp8EkOhnbAY5iF4u8hUJ5vZ3ucLnZcLTnP7RjKjTlaX+qdBn0FudgF?=
 =?us-ascii?Q?7H1D3pNsbS8NfeZo0kEvns7y4YFHeliCaLnEh9nvtuNxREDBk1hqkpEiuTvo?=
 =?us-ascii?Q?fnwHmlqIG1r7IEmQlWLGhXmN6W6EyioWNorGUD0FEbcKZKNRTKoLP5mUjTE4?=
 =?us-ascii?Q?J8WrydBag1zwgZ3N5H+Y1oQUjAsJIexeG0efJaM/Tkmd0zBn9aNeaJkp+wNU?=
 =?us-ascii?Q?m2dbvh15Oaso4yFLWWrb0TkxOvrPZgKip3kVUJbYTEjgB7Ym7vljwK+bWiju?=
 =?us-ascii?Q?W0rCyJGxLHo5AW3LCvosKZlliFL39WCzTPxRp7TbP/SHMATSVksjE4LjoFMG?=
 =?us-ascii?Q?0Ir/mSeciyfEuj1bDVzcbbwjFtbKqFUunFR6CWV9EJRCdCqvSAEncveU7WAh?=
 =?us-ascii?Q?KcDzBRY/iSZASndx7CaEc0zIT7WZITcDMR1miJpB0e8mL7oekPjtBIT9r9D6?=
 =?us-ascii?Q?e6+hd3JFFNPwHOa2UG7R1tTrxtlDbTyIAePSgFvNsoyoH3mJRRJAEsLekhez?=
 =?us-ascii?Q?f+iOWDHp98i6g5YDZC0sUGknyYNibKEVKXR6HU/kIgK3CR34PgdrVZouSdqX?=
 =?us-ascii?Q?4HLZW7M5/DObMg1tVsEZog7TOEqvIsCVIBfqtwL1yFXgi6h8bkGPvUyYVhAg?=
 =?us-ascii?Q?pDEdzA6wM+EJu5jR8JI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9BYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afdf4e8-7387-464d-cce4-08db3a408f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 03:55:16.3069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWOL3aAX/lTNmBibDCLpkOanuRiYTxDMmZpPO61urLTDyCP4fMrmgOAzS2Ve/BUYP4buVREXZPnioyLFAXd6gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9BYAPR11MB2567namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mtl: Define MOCS and PAT tab=
les for MTL
>
> On Fri, Apr 07, 2023 at 12:12:29AM -0700, fei.yang@intel.com<mailto:fei.y=
ang@intel.com> wrote:
>> From: Fei Yang fei.yang@intel.com<mailto:fei.yang@intel.com>
>>
>> On MTL, GT can no longer allocate on LLC - only the CPU can.
>> This, along with addition of support for ADM/L4 cache calls a MOCS/PAT
>> table update. Also defines PTE encode functions for MTL as it has
>> different PAT index definition than previous platforms.
>
> It might be best to keep the PTE encoding as a separate patch from the
> MOCS/PAT tables.  It's a different enough topic that it probably deserves
> a patch of its own.

Will update in the next revision.

>>
>> BSpec: 44509, 45101, 44235
>>
>> Cc: Matt Roper matthew.d.roper@intel.com<mailto:matthew.d.roper@intel.co=
m>
>> Cc: Lucas De Marchi lucas.demarchi@intel.com<mailto:lucas.demarchi@intel=
.com>
>> Signed-off-by: Madhumitha Tolakanahalli Pradeep
>> madhumitha.tolakanahalli.pradeep@intel.com<mailto:madhumitha.tolakanahal=
li.pradeep@intel.com>
>> Signed-off-by: Aravind Iddamsetty aravind.iddamsetty@intel.com<mailto:ar=
avind.iddamsetty@intel.com>
>> Signed-off-by: Fei Yang fei.yang@intel.com<mailto:fei.yang@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c    | 28 +++++++++
>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.h    |  3 +
>>  drivers/gpu/drm/i915/gt/intel_ggtt.c    | 27 +++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c     | 23 +++++++-
>>  drivers/gpu/drm/i915/gt/intel_gtt.h     | 20 ++++++-
>>  drivers/gpu/drm/i915/gt/intel_mocs.c    | 76 +++++++++++++++++++++++--
>>  drivers/gpu/drm/i915/gt/selftest_mocs.c |  2 +-
>>  drivers/gpu/drm/i915/i915_pci.c         |  1 +
>>  8 files changed, 173 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> index 4daaa6f55668..df4073d32114 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>>          return pte;
>>  }
>>
>> +static u64 mtl_pte_encode(dma_addr_t addr,
>> +                                       enum i915_cache_level level,
>> +                                       u32 flags)
>> +{
>> +       gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>> +
>> +       if (unlikely(flags & PTE_READ_ONLY))
>> +                      pte &=3D ~GEN8_PAGE_RW;
>> +
>> +       if (flags & PTE_LM)
>> +                      pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
>> +
>> +       switch (level) {
>> +       case I915_CACHE_NONE:
>> +                      pte |=3D GEN12_PPGTT_PTE_PAT1;
>> +                      break;
>> +       case I915_CACHE_LLC:
>> +       case I915_CACHE_L3_LLC:
>> +                      pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_P=
AT1;
>> +                      break;
>> +       case I915_CACHE_WT:
>> +                      pte |=3D GEN12_PPGTT_PTE_PAT0;
>> +                      break;
>> +       }
>> +
>> +       return pte;
>> +}
>> +
>>  static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool
>> create)  {
>>          struct drm_i915_private *i915 =3D ppgtt->vm.i915; diff --git
>> a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> index f541d19264b4..6b8ce7f4d25a 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h
>> @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt
>> *gt,
>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>                                         enum i915_cache_level level,
>>                                         u32 flags);
>> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>> +                                     unsigned int pat_index,
>> +                                     u32 flags);
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 3c7f1ed92f5b..4a16bfcde1de 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *g=
gtt)
>>          }
>>  }
>>
>> +u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>> +                                     enum i915_cache_level level,
>> +                                     u32 flags)
>> +{
>> +       gen8_pte_t pte =3D addr | GEN8_PAGE_PRESENT;
>> +
>> +       GEM_BUG_ON(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
>> +
>> +       if (flags & PTE_LM)
>> +                      pte |=3D GEN12_GGTT_PTE_LM;
>> +
>> +       switch (level) {
>> +       case I915_CACHE_NONE:
>> +                      pte |=3D MTL_GGTT_PTE_PAT1;
>> +                      break;
>> +       case I915_CACHE_LLC:
>> +       case I915_CACHE_L3_LLC:
>> +                      pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
>> +                      break;
>> +       case I915_CACHE_WT:
>> +                      pte |=3D MTL_GGTT_PTE_PAT0;
>> +                      break;
>> +       }
>> +
>> +       return pte;
>> +}
>> +
>>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>>                                         enum i915_cache_level level,
>>                                         u32 flags)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index 4f436ba7a3c8..1e1b34e22cf5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -468,6 +468,25 @@ void gtt_write_workarounds(struct intel_gt *gt)
>>          }
>>  }
>>
>> +static void mtl_setup_private_ppat(struct intel_uncore *uncore) {
>> +       intel_uncore_write(uncore, GEN12_PAT_INDEX(0),
>> +                                        MTL_PPAT_L4_0_WB);
>> +       intel_uncore_write(uncore, GEN12_PAT_INDEX(1),
>> +                                        MTL_PPAT_L4_1_WT);
>> +       intel_uncore_write(uncore, GEN12_PAT_INDEX(2),
>> +                                        MTL_PPAT_L4_3_UC);
>> +       intel_uncore_write(uncore, GEN12_PAT_INDEX(3),
>> +                                        MTL_PPAT_L4_0_WB | MTL_2_COH_1W=
);
>> +       intel_uncore_write(uncore, GEN12_PAT_INDEX(4),
>> +                                        MTL_PPAT_L4_0_WB | MTL_3_COH_2W=
);
>
> These registers are multicast registers on the primary GT.  We need
> to use XEHP_PAT_INDEX and the MCR-aware functions on the primary GT.

The multicast change has been merged to a different branch and not
validated extensively on MTL so far. Will post to mailing list after
proper validation.

> Although we're not programming the higher PAT entries on MTL (yet),
> there's also a jump in the MMIO offsets that we should incorporate
> into the PAT_INDEX macro to future-proof the code.
>
>> +
>> +       /*
>> +       * Remaining PAT entries are left at the hardware-default
>> +       * fully-cached setting
>> +       */
>> +}
>> +
>>  static void tgl_setup_private_ppat(struct intel_uncore *uncore)  {
>>          /* TGL doesn't support LLC or AGE settings */ @@ -603,7 +622,9 =
@@
>> void setup_private_pat(struct intel_gt *gt)
>>
>>          GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>>
>> -        if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>> +       if (IS_METEORLAKE(i915))
>> +                      mtl_setup_private_ppat(uncore);
>
> We need to handle the primary GT and media GT separately since the
> media GT registers are unicast whereas primary are multicast.

Same as above.

>See
> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/g=
pu/drm/xe/xe_pat.c
> for how this was handled in the Xe driver.
>
>> +       else if (GRAPHICS_VER_FULL(i915) >=3D IP_VER(12, 50))
>>                         xehp_setup_private_ppat(gt);
>>          else if (GRAPHICS_VER(i915) >=3D 12)
>>                         tgl_setup_private_ppat(uncore);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> index 69ce55f517f5..b632167eaf2e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES             REG_BIT(2)
>>  #define BYT_PTE_WRITEABLE                            REG_BIT(1)
>>
>> +#define GEN12_PPGTT_PTE_PAT3    BIT_ULL(62)
>>  #define GEN12_PPGTT_PTE_LM          BIT_ULL(11)
>> +#define GEN12_PPGTT_PTE_PAT2    BIT_ULL(7)
>> +#define GEN12_PPGTT_PTE_NC      BIT_ULL(5)
>> +#define GEN12_PPGTT_PTE_PAT1    BIT_ULL(4)
>> +#define GEN12_PPGTT_PTE_PAT0    BIT_ULL(3)
>
> Which bspec page is this from?  The PPGTT descriptions in
> the bspec are kind of hard to track down.

https://gfxspecs.intel.com/Predator/Home/Index/53521
PAT_Index[2:0] =3D {PAT, PCD, PWT} =3D BIT(7, 4, 3)
PAT_Index[3] =3D BIT(62)
PAT_Index[4] =3D BIT(61)

> But if these only apply to MTL, why are they labelled as "GEN12?"

These apply to GEN12plus.

>>
>> -#define GEN12_GGTT_PTE_LM           BIT_ULL(1)
>> +#define GEN12_GGTT_PTE_LM                         BIT_ULL(1)
>> +#define MTL_GGTT_PTE_PAT0                          BIT_ULL(52)
>> +#define MTL_GGTT_PTE_PAT1                          BIT_ULL(53)
>> +#define GEN12_GGTT_PTE_ADDR_MASK       GENMASK_ULL(45, 12)
>> +#define MTL_GGTT_PTE_PAT_MASK                               GENMASK_ULL=
(53, 52)
>>
>>  #define GEN12_PDE_64K BIT(6)
>>  #define GEN12_PTE_PS64 BIT(8)
>> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;  #define GEN8_PDE_IPS_64K
>> BIT(11)
>>  #define GEN8_PDE_PS_2M   BIT(7)
>>
>> +#define MTL_PPAT_L4_CACHE_POLICY_MASK             REG_GENMASK(3, 2)
>> +#define MTL_PAT_INDEX_COH_MODE_MASK              REG_GENMASK(1, 0)
>> +#define MTL_PPAT_L4_3_UC               REG_FIELD_PREP(MTL_PPAT_L4_CACHE=
_POLICY_MASK, 3)
>> +#define MTL_PPAT_L4_1_WT               REG_FIELD_PREP(MTL_PPAT_L4_CACHE=
_POLICY_MASK, 1)
>> +#define MTL_PPAT_L4_0_WB               REG_FIELD_PREP(MTL_PPAT_L4_CACHE=
_POLICY_MASK, 0)
>> +#define MTL_3_COH_2W     REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
>> +#define MTL_2_COH_1W     REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
>> +#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
>
>The values for these definitions don't seem to be aligned.

These are aligned with https://gfxspecs.intel.com/Predator/Home/Index/45101

>> +
>>  enum i915_cache_level;
>>
>>  struct drm_i915_gem_object;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c
>> b/drivers/gpu/drm/i915/gt/intel_mocs.c
>> index 69b489e8dfed..89570f137b2c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
>> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
>>  #define LE_COS(value)                           ((value) << 15)
>>  #define LE_SSE(value)                            ((value) << 17)
>>
>> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
>> +#define _L4_CACHEABILITY(value)    ((value) << 2)
>
> We should use REG_GENMASK + REG_FIELD_PREP for new code, which will help
> ensure that we don't try to pack a value into a field that's too big to f=
it.
>
>> +#define IG_PAT(value)                          ((value) << 8)

This is used in defining MOCS table. I think it's easier to read with IG_PA=
T(0)
and IG_PAT(1), than with and without IG_PAT.

> Do we need this one parameterized?  It's just a boolean flag, so
>
>        #define IG_PAT          REG_BIT(8)
>
> would be fine (and then don't include the flag on the entries where it is=
n't set.
>
>> +
>>  /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per wo=
rd */
>>  #define L3_ESC(value)                            ((value) << 0)
>>  #define L3_SCC(value)                           ((value) << 1)
>> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
>>  /* Helper defines */
>>  #define GEN9_NUM_MOCS_ENTRIES               64  /* 63-64 are reserved, =
but configured. */
>>  #define PVC_NUM_MOCS_ENTRIES   3
>> +#define MTL_NUM_MOCS_ENTRIES 16
>>
>>  /* (e)LLC caching options */
>>  /*
>> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
>>  #define L3_2_RESERVED                       _L3_CACHEABILITY(2)
>>  #define L3_3_WB                                    _L3_CACHEABILITY(3)
>>
>> +/* L4 caching options */
>> +#define L4_0_WB                                  _L4_CACHEABILITY(0)
>> +#define L4_1_WT                                   _L4_CACHEABILITY(1)
>> +#define L4_2_RESERVED                      _L4_CACHEABILITY(2)
>
> This definition is unnecessary and unused.
>
>> +#define L4_3_UC                                   _L4_CACHEABILITY(3)
>> +
>>  #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>>          [__idx] =3D { \
>>                         .control_value =3D __control_value, \ @@ -416,6 =
+427,57 @@ static
>> const struct drm_i915_mocs_entry pvc_mocs_table[] =3D {
>>          MOCS_ENTRY(2, 0, L3_3_WB),
>>  };
>>
>> +static const struct drm_i915_mocs_entry mtl_mocs_table[] =3D {
>
> The entries below with WB L4 cache don't include L4_0_WB.  That works
> out okay since the value is 0, but it seems like it would still be worth
> including it, just to make the table meaning more clear.
>
> Conversely, I'd drop the "IG_PAT(0)" on entry 0 since that's just a simpl=
e
> boolean flag, so the "0" there is easier to misread than just not includi=
ng
> it at all.
>
>> +       /* Error - Reserved for Non-Use */
>> +       MOCS_ENTRY(0,
>> +                         IG_PAT(0),
>> +                         L3_LKUP(1) | L3_3_WB),
>> +       /* Cached - L3 + L4 */
>> +       MOCS_ENTRY(1,
>> +                         IG_PAT(1),
>> +                         L3_LKUP(1) | L3_3_WB),
>> +       /* L4 - GO:L3 */
>> +       MOCS_ENTRY(2,
>> +                         IG_PAT(1),
>> +                         L3_LKUP(1) | L3_1_UC),
>> +       /* Uncached - GO:L3 */
>> +       MOCS_ENTRY(3,
>> +                         IG_PAT(1) | L4_3_UC,
>> +                         L3_LKUP(1) | L3_1_UC),
>> +       /* L4 - GO:Mem */
>> +       MOCS_ENTRY(4,
>> +                         IG_PAT(1),
>> +                         L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>> +       /* Uncached - GO:Mem */
>> +       MOCS_ENTRY(5,
>> +                         IG_PAT(1) | L4_3_UC,
>> +                         L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>> +       /* L4 - L3:NoLKUP; GO:L3 */
>> +       MOCS_ENTRY(6,
>> +                         IG_PAT(1),
>> +                         L3_1_UC),
>> +       /* Uncached - L3:NoLKUP; GO:L3 */
>> +       MOCS_ENTRY(7,
>> +                         IG_PAT(1) | L4_3_UC,
>> +                         L3_1_UC),
>> +       /* L4 - L3:NoLKUP; GO:Mem */
>> +       MOCS_ENTRY(8,
>> +                         IG_PAT(1),
>> +                         L3_GLBGO(1) | L3_1_UC),
>> +       /* Uncached - L3:NoLKUP; GO:Mem */
>> +       MOCS_ENTRY(9,
>> +                         IG_PAT(1) | L4_3_UC,
>> +                         L3_GLBGO(1) | L3_1_UC),
>> +       /* Display - L3; L4:WT */
>> +       MOCS_ENTRY(14,
>> +                         IG_PAT(1) | L4_1_WT,
>> +                         L3_LKUP(1) | L3_3_WB),
>> +       /* CCS - Non-Displayable */
>> +       MOCS_ENTRY(15,
>> +                         IG_PAT(1),
>> +                         L3_GLBGO(1) | L3_1_UC),
>> +};
>> +
>>  enum {
>>          HAS_GLOBAL_MOCS =3D BIT(0),
>>          HAS_ENGINE_MOCS =3D BIT(1),
>> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct =
drm_i915_private *i915,
>>          memset(table, 0, sizeof(struct drm_i915_mocs_table));
>>
>>          table->unused_entries_index =3D I915_MOCS_PTE;
>> -        if (IS_PONTEVECCHIO(i915)) {
>> +       if (IS_METEORLAKE(i915)) {
>> +                      table->size =3D ARRAY_SIZE(mtl_mocs_table);
>> +                      table->table =3D mtl_mocs_table;
>> +                      table->n_entries =3D MTL_NUM_MOCS_ENTRIES;
>> +                      table->uc_index =3D 9;
>> +                      table->unused_entries_index =3D 1;
>> +       } else if (IS_PONTEVECCHIO(i915)) {
>>                         table->size =3D ARRAY_SIZE(pvc_mocs_table);
>>                         table->table =3D pvc_mocs_table;
>>                         table->n_entries =3D PVC_NUM_MOCS_ENTRIES; @@ -6=
46,9 +714,9 @@ void
>> intel_mocs_init_engine(struct intel_engine_cs *engine)
>>                         init_l3cc_table(engine->gt, &table);  }
>>
>> -static u32 global_mocs_offset(void)
>> +static u32 global_mocs_offset(struct intel_gt *gt)
>>  {
>> -        return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
>> +       return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) +
>> +gt->uncore->gsi_offset;
>
> Isn't this going to double-apply the GSI offset in __init_mocs_table?

Good point. Not sure if there are test cases to validate this, but do need
to double check.

> We do need to handle the offset manually in read_mocs_table() since
> those reads are done with an MI_STORE_REGISTER_MEM instruction.
>
> Handling the GSI offset properly deserves its own patch with a dedicated
> commit message explaining the details.
>
>>  }
>>
>>  void intel_set_mocs_index(struct intel_gt *gt) @@ -671,7 +739,7 @@
>> void intel_mocs_init(struct intel_gt *gt)
>>           */
>>          flags =3D get_mocs_settings(gt->i915, &table);
>>          if (flags & HAS_GLOBAL_MOCS)
>> -                       __init_mocs_table(gt->uncore, &table, global_moc=
s_offset());
>> +                      __init_mocs_table(gt->uncore, &table, global_mocs=
_offset(gt));
>>
>>          /*
>>           * Initialize the L3CC table as part of mocs initalization to m=
ake
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> index ca009a6a13bd..730796346514 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
>> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
>>                         return 0;
>>
>>          if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
>> -                       addr =3D global_mocs_offset();
>> +                      addr =3D global_mocs_offset(rq->engine->gt);
>>          else
>>                         addr =3D mocs_offset(rq->engine);
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c
>> b/drivers/gpu/drm/i915/i915_pci.c index cddb6e197972..025d32c0b161
>> 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -1146,6 +1146,7 @@ static const struct intel_device_info mtl_info =3D=
 {
>>          .has_flat_ccs =3D 0,
>>          .has_gmd_id =3D 1,
>>          .has_guc_deprivilege =3D 1,
>> +       .has_llc =3D 0,
>
> This should also be in its own patch since it isn't directly related to t=
he
> MOCS / PAT tables.

Will update in the next revision.

> Matt
>
>>          .has_mslice_steering =3D 0,
>>          .has_snoop =3D 1,
>>          .__runtime.memory_regions =3D REGION_SMEM | REGION_STOLEN_LMEM,
>> --
>> 2.25.1
>>
>
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
>

--_000_BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9BYAPR11MB2567namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">&gt;Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/mt=
l: Define MOCS and PAT tables for MTL<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; On Fri, Apr 07, 2023 at 12:12:29AM -0700, <a hr=
ef=3D"mailto:fei.yang@intel.com">
fei.yang@intel.com</a> wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; From: Fei Yang <a href=3D"mailto:fei.yang@i=
ntel.com">fei.yang@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; On MTL, GT can no longer allocate on LLC - =
only the CPU can.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; This, along with addition of support for AD=
M/L4 cache calls a MOCS/PAT
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; table update. Also defines PTE encode funct=
ions for MTL as it has
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; different PAT index definition than previou=
s platforms.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; It might be best to keep the PTE encoding as a =
separate patch from the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; MOCS/PAT tables.&nbsp; It's a different enough =
topic that it probably deserves<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; a patch of its own.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Will update in the next revision.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; BSpec: 44509, 45101, 44235<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Cc: Matt Roper <a href=3D"mailto:matthew.d.=
roper@intel.com">
matthew.d.roper@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Cc: Lucas De Marchi <a href=3D"mailto:lucas=
.demarchi@intel.com">
lucas.demarchi@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Signed-off-by: Madhumitha Tolakanahalli Pra=
deep <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <a href=3D"mailto:madhumitha.tolakanahalli.=
pradeep@intel.com">
madhumitha.tolakanahalli.pradeep@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Signed-off-by: Aravind Iddamsetty <a href=
=3D"mailto:aravind.iddamsetty@intel.com">
aravind.iddamsetty@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Signed-off-by: Fei Yang <a href=3D"mailto:f=
ei.yang@intel.com">
fei.yang@intel.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; ---<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/gen8_ppgtt.c&=
nbsp;&nbsp;&nbsp; | 28 +++++++++<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/gen8_ppgtt.h&=
nbsp;&nbsp;&nbsp; |&nbsp; 3 +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/intel_ggtt.c&=
nbsp;&nbsp;&nbsp; | 27 +++++++++<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/intel_gtt.c&n=
bsp;&nbsp;&nbsp;&nbsp; | 23 +++++++-<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/intel_gtt.h&n=
bsp;&nbsp;&nbsp;&nbsp; | 20 ++++++-<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/intel_mocs.c&=
nbsp;&nbsp;&nbsp; | 76 +++++++++++++++++++++++--<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/gt/selftest_mocs=
.c |&nbsp; 2 +-<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; drivers/gpu/drm/i915/i915_pci.c&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; 8 files changed, 173 insertions(+), 7=
 deletions(-)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt/gen8_p=
pgtt.c <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index 4daaa6f55668..df4073d32114 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -55,6 +55,34 @@ static u64 gen8_pte_enco=
de(dma_addr_t addr,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return pte;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +static u64 mtl_pte_encode(dma_addr_t addr,=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; enum i915_cache_level level,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &nbsp; u32 flags)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +{<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gen8_=
pte_t pte =3D addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (u=
nlikely(flags &amp; PTE_READ_ONLY))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte &amp;=3D ~GEN8_PAGE_RW;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (f=
lags &amp; PTE_LM)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switc=
h (level) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_NONE:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D GEN12_PPGTT_PTE_PAT1;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_LLC:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_L3_LLC:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_WT:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D GEN12_PPGTT_PTE_PAT0;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n pte;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +}<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; static void gen8_ppgtt_notify_vgt(str=
uct i915_ppgtt *ppgtt, bool
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; create)&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct drm_i915_private *i915 =3D ppgtt-&gt;vm.i915; diff --git
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h <o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index f541d19264b4..6b8ce7f4d25a 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.h<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.h<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -18,5 +18,8 @@ struct i915_ppgtt *gen8_p=
pgtt_create(struct intel_gt
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; *gt,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; u64 gen8_ggtt_pte_encode(dma_addr_t a=
ddr,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;enum i915_cache_level level,<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;u32 flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +u64 mtl_ggtt_pte_encode(dma_addr_t addr,<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pat_index,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; u32 flags);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #endif<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt/intel_=
ggtt.c <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/intel_ggtt.c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index 3c7f1ed92f5b..4a16bfcde1de 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -220,6 +220,33 @@ static void guc_ggtt_i=
nvalidate(struct i915_ggtt *ggtt)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +u64 mtl_ggtt_pte_encode(dma_addr_t addr,<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; enum i915_cache_level level,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; u32 flags)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +{<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gen8_=
pte_t pte =3D addr | GEN8_PAGE_PRESENT;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GEM_B=
UG_ON(addr &amp; ~GEN12_GGTT_PTE_ADDR_MASK);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (f=
lags &amp; PTE_LM)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D GEN12_GGTT_PTE_LM;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switc=
h (level) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_NONE:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D MTL_GGTT_PTE_PAT1;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_LLC:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_L3_LLC:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
I915_CACHE_WT:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pte |=3D MTL_GGTT_PTE_PAT0;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n pte;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +}<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; u64 gen8_ggtt_pte_encode(dma_addr_t a=
ddr,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;enum i915_cache_level level,<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;u32 flags)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt/intel_=
gtt.c <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/intel_gtt.c<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index 4f436ba7a3c8..1e1b34e22cf5 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_gtt.c<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -468,6 +468,25 @@ void gtt_write_workaro=
unds(struct intel_gt *gt)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +static void mtl_setup_private_ppat(struct =
intel_uncore *uncore) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel=
_uncore_write(uncore, GEN12_PAT_INDEX(0),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MTL_PPAT_L4_0_WB);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel=
_uncore_write(uncore, GEN12_PAT_INDEX(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MTL_PPAT_L4_1_WT);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel=
_uncore_write(uncore, GEN12_PAT_INDEX(2),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MTL_PPAT_L4_3_UC);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel=
_uncore_write(uncore, GEN12_PAT_INDEX(3),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MTL_PPAT_L4_0_WB | MTL_2_COH_1W);<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intel=
_uncore_write(uncore, GEN12_PAT_INDEX(4),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; MTL_PPAT_L4_0_WB | MTL_3_COH_2W);<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; These registers are multicast registers on the =
primary GT.&nbsp; We need<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; to use XEHP_PAT_INDEX and the MCR-aware functio=
ns on the primary GT.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The multicast change has been merged to a different =
branch and not<o:p></o:p></p>
<p class=3D"MsoNormal">validated extensively on MTL so far. Will post to ma=
iling list after<o:p></o:p></p>
<p class=3D"MsoNormal">proper validation.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Although we're not programming the higher PAT e=
ntries on MTL (yet),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; there's also a jump in the MMIO offsets that we=
 should incorporate<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; into the PAT_INDEX macro to future-proof the co=
de.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Rem=
aining PAT entries are left at the hardware-default<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ful=
ly-cached setting<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +}<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; static void tgl_setup_private_ppat(st=
ruct intel_uncore *uncore)&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* TGL doesn't support LLC or AGE settings */ @@ -603,7 +622,9 @@
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; void setup_private_pat(struct intel_gt *gt)=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; GEM_BUG_ON(GRAPHICS_VER(i915) &lt; 8);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 if (GRAPHICS_VER_FULL(i915) &gt;=3D IP_VER(12, 50))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (I=
S_METEORLAKE(i915))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; mtl_setup_private_ppat(uncore);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; We need to handle the primary GT and media GT s=
eparately since the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; media GT registers are unicast whereas primary =
are multicast.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Same as above.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;See<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pat.c">
https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu=
/drm/xe/xe_pat.c</a><o:p></o:p></p>
<p class=3D"MsoNormal">&gt; for how this was handled in the Xe driver.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else =
if (GRAPHICS_VER_FULL(i915) &gt;=3D IP_VER(12, 50))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; xehp_setup_private_ppat(gt);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else if (GRAPHICS_VER(i915) &gt;=3D 12)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; tgl_setup_private_ppat(uncore);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt/intel_=
gtt.h <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/intel_gtt.h<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index 69ce55f517f5..b632167eaf2e 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_gtt.h<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define BYT_PTE_SNOOPED_BY_CPU_CACHES=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RE=
G_BIT(2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define BYT_PTE_WRITEABLE&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 REG_BIT(1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT3&nbsp;&nbsp;&n=
bsp; BIT_ULL(62)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define GEN12_PPGTT_PTE_LM&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(11)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT2&nbsp;&nbsp;&n=
bsp; BIT_ULL(7)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_PPGTT_PTE_NC&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; BIT_ULL(5)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT1&nbsp;&nbsp;&n=
bsp; BIT_ULL(4)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_PPGTT_PTE_PAT0&nbsp;&nbsp;&n=
bsp; BIT_ULL(3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Which bspec page is this from?&nbsp; The PPGTT =
descriptions in<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; the bspec are kind of hard to track down.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gfxspecs.intel.com/Predator/Home/=
Index/53521">https://gfxspecs.intel.com/Predator/Home/Index/53521</a><o:p><=
/o:p></p>
<p class=3D"MsoNormal">PAT_Index[2:0] =3D {PAT, PCD, PWT} =3D BIT(7, 4, 3)<=
o:p></o:p></p>
<p class=3D"MsoNormal">PAT_Index[3] =3D BIT(62)<o:p></o:p></p>
<p class=3D"MsoNormal">PAT_Index[4] =3D BIT(61)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; But if these only apply to MTL, why are they la=
belled as &quot;GEN12?&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These apply to GEN12plus.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -#define GEN12_GGTT_PTE_LM&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_GGTT_PTE_LM&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(1)<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_GGTT_PTE_PAT0&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(52)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_GGTT_PTE_PAT1&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT_ULL(53)<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define GEN12_GGTT_PTE_ADDR_MASK&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; GENMASK_ULL(45, 12)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_GGTT_PTE_PAT_MASK&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; GENMASK_ULL(53, 52)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define GEN12_PDE_64K BIT(6)<o:p></o:=
p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define GEN12_PTE_PS64 BIT(8)<o:p></o=
:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t=
;&nbsp; #define GEN8_PDE_IPS_64K
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; BIT(11)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define GEN8_PDE_PS_2M&nbsp;&nbsp; BI=
T(7)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_PPAT_L4_CACHE_POLICY_MASK&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GEN=
MASK(3, 2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_PAT_INDEX_COH_MODE_MASK&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG=
_GENMASK(1, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_PPAT_L4_3_UC&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_FIEL=
D_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_PPAT_L4_1_WT&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_FIEL=
D_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_PPAT_L4_0_WB&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_FIEL=
D_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_3_COH_2W&nbsp;&nbsp;&nbsp;&nbs=
p; REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_2_COH_1W&nbsp;&nbsp;&nbsp;&nbs=
p; REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_0_COH_NON&nbsp;&nbsp; REG_FIEL=
D_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;The values for these definitions don't seem to b=
e aligned.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These are aligned with <a href=3D"https://gfxspecs.i=
ntel.com/Predator/Home/Index/45101">
https://gfxspecs.intel.com/Predator/Home/Index/45101</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; enum i915_cache_level;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; struct drm_i915_gem_object;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt/intel_=
mocs.c <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/intel_mocs.c<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index 69b489e8dfed..89570f137b2c 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/intel_mocs.c<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -40,6 +40,10 @@ struct drm_i915_mocs_tab=
le {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define LE_COS(value)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((value) =
&lt;&lt; 15)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define LE_SSE(value)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((v=
alue) &lt;&lt; 17)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +/* Defines for the tables (GLOB_MOCS_0 - G=
LOB_MOCS_16) */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define _L4_CACHEABILITY(value)&nbsp;&nbsp=
;&nbsp; ((value) &lt;&lt; 2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; We should use REG_GENMASK + REG_FIELD_PREP for =
new code, which will help<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; ensure that we don't try to pack a value into a=
 field that's too big to fit.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define IG_PAT(value)&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((value) &lt;&lt; 8)=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is used in defining MOCS table. I think it's ea=
sier to read with IG_PAT(0)<o:p></o:p></p>
<p class=3D"MsoNormal">and IG_PAT(1), than with and without IG_PAT.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Do we need this one parameterized?&nbsp; It's j=
ust a boolean flag, so<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #defi=
ne IG_PAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_BIT(8)<=
o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; would be fine (and then don't include the flag =
on the entries where it isn't set.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; /* Defines for the tables (LNCFMOCS0 =
- LNCFMOCS31) - two entries per word */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define L3_ESC(value)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((v=
alue) &lt;&lt; 0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define L3_SCC(value)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((value) =
&lt;&lt; 1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -50,6 +54,7 @@ struct drm_i915_mocs_tabl=
e {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; /* Helper defines */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define GEN9_NUM_MOCS_ENTRIES&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 64&nbsp; /* 63-64 are reserved, but configured. */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define PVC_NUM_MOCS_ENTRIES&nbsp;&nb=
sp; 3<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define MTL_NUM_MOCS_ENTRIES 16<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; /* (e)LLC caching options */<o:p></o:=
p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; /*<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -73,6 +78,12 @@ struct drm_i915_mocs_tab=
le {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define L3_2_RESERVED&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _L3_CACHEABILITY(2)<o:p></o:p></p=
>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define L3_3_WB&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _L3_CACHEABILITY(3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +/* L4 caching options */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define L4_0_WB&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; _L4_CACHEABILITY(0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define L4_1_WT&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; _L4_CACHEABILITY(1)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define L4_2_RESERVED&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _L4_CACHEABILITY(2)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; This definition is unnecessary and unused.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +#define L4_3_UC&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; _L4_CACHEABILITY(3)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; #define MOCS_ENTRY(__idx, __control_v=
alue, __l3cc_value) \<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; [__idx] =3D { \<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; .control_value =3D __control_value, \ @@ -416,6 +427,5=
7 @@ static
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; const struct drm_i915_mocs_entry pvc_mocs_t=
able[] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; MOCS_ENTRY(2, 0, L3_3_WB),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; };<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +static const struct drm_i915_mocs_entry mt=
l_mocs_table[] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; The entries below with WB L4 cache don't includ=
e L4_0_WB.&nbsp; That works<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; out okay since the value is 0, but it seems lik=
e it would still be worth<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; including it, just to make the table meaning mo=
re clear.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Conversely, I'd drop the &quot;IG_PAT(0)&quot; =
on entry 0 since that's just a simple<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; boolean flag, so the &quot;0&quot; there is eas=
ier to misread than just not including<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; it at all.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Er=
ror - Reserved for Non-Use */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(0,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(0),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_3_WB),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Ca=
ched - L3 + L4 */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(1,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp; IG_PAT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_3_WB),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* L4=
 - GO:L3 */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(2,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Un=
cached - GO:L3 */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(3,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1) | L4_3_UC,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* L4=
 - GO:Mem */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(4,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Un=
cached - GO:Mem */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(5,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1) | L4_3_UC,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* L4=
 - L3:NoLKUP; GO:L3 */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(6,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Un=
cached - L3:NoLKUP; GO:L3 */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(7,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1) | L4_3_UC,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* L4=
 - L3:NoLKUP; GO:Mem */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(8,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_GLBGO(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Un=
cached - L3:NoLKUP; GO:Mem */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(9,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1) | L4_3_UC,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_GLBGO(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Di=
splay - L3; L4:WT */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(14,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1) | L4_1_WT,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_LKUP(1) | L3_3_WB),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* CC=
S - Non-Displayable */<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MOCS_=
ENTRY(15,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; IG_PAT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp; L3_GLBGO(1) | L3_1_UC),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +};<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; enum {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; HAS_GLOBAL_MOCS =3D BIT(0),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; HAS_ENGINE_MOCS =3D BIT(1),<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -445,7 +507,13 @@ static unsigned int ge=
t_mocs_settings(const struct drm_i915_private *i915,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memset(table, 0, sizeof(struct drm_i915_mocs_table));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; table-&gt;unused_entries_index =3D I915_MOCS_PTE;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 if (IS_PONTEVECCHIO(i915)) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (I=
S_METEORLAKE(i915)) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; table-&gt;size =3D ARRAY_SIZE(mtl_mocs_table);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; table-&gt;table =3D mtl_mocs_table;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; table-&gt;n_entries =3D MTL_NUM_MOCS_ENTRIES;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; table-&gt;uc_index =3D 9;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; table-&gt;unused_entries_index =3D 1;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } els=
e if (IS_PONTEVECCHIO(i915)) {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; table-&gt;size =3D ARRAY_SIZE(pvc_mocs_table);<o:p></o=
:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; table-&gt;table =3D pvc_mocs_table;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; table-&gt;n_entries =3D PVC_NUM_MOCS_ENTRIES; @@ -646,=
9 +714,9 @@ void
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; intel_mocs_init_engine(struct intel_engine_=
cs *engine)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; init_l3cc_table(engine-&gt;gt, &amp;table);&nbsp; }<o:=
p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -static u32 global_mocs_offset(void)<o:p></=
o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +static u32 global_mocs_offset(struct intel=
_gt *gt)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) +
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +gt-&gt;uncore-&gt;gsi_offset;<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Isn't this going to double-apply the GSI offset=
 in __init_mocs_table?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Good point. Not sure if there are test cases to vali=
date this, but do need<o:p></o:p></p>
<p class=3D"MsoNormal">to double check.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; We do need to handle the offset manually in rea=
d_mocs_table() since<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; those reads are done with an MI_STORE_REGISTER_=
MEM instruction.<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Handling the GSI offset properly deserves its o=
wn patch with a dedicated<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; commit message explaining the details.<o:p></o:=
p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; void intel_set_mocs_index(struct inte=
l_gt *gt) @@ -671,7 +739,7 @@
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; void intel_mocs_init(struct intel_gt *gt)<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;*/<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; flags =3D get_mocs_settings(gt-&gt;i915, &amp;table);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (flags &amp; HAS_GLOBAL_MOCS)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; __init_mocs_table(gt-&gt;uncore, &amp;table, global_mocs_of=
fset());<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; __init_mocs_table(gt-&gt;uncore, &amp;table, global_mocs_offset(g=
t));<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /*<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;* Initialize the L3CC table as part of mocs initalization to ma=
ke
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/gt/selfte=
st_mocs.c <o:p>
</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/gt/selftest_mocs.c<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; index ca009a6a13bd..730796346514 100644<o:p=
></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/gt/selftest_mocs=
.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/gt/selftest_mocs=
.c<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -137,7 +137,7 @@ static int read_mocs_ta=
ble(struct i915_request *rq,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (HAS_GLOBAL_MOCS_REGISTERS(rq-&gt;engine-&gt;i915))<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; addr =3D global_mocs_offset();<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; addr =3D global_mocs_offset(rq-&gt;engine-&gt;gt);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; addr =3D mocs_offset(rq-&gt;engine);<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; diff --git a/drivers/gpu/drm/i915/i915_pci.=
c <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; b/drivers/gpu/drm/i915/i915_pci.c index cdd=
b6e197972..025d32c0b161
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; 100644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --- a/drivers/gpu/drm/i915/i915_pci.c<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +++ b/drivers/gpu/drm/i915/i915_pci.c<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt; @@ -1146,6 +1146,7 @@ static const struct i=
ntel_device_info mtl_info =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .has_flat_ccs =3D 0,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .has_gmd_id =3D 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .has_guc_deprivilege =3D 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .has_=
llc =3D 0,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; This should also be in its own patch since it i=
sn't directly related to the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; MOCS / PAT tables.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Will update in the next revision.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Matt<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .has_mslice_steering =3D 0,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .has_snoop =3D 1,<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; .__runtime.memory_regions =3D REGION_SMEM | REGION_STOLEN_LMEM,<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&gt;&gt; --<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; 2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; -- <o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Matt Roper<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Graphics Software Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Linux GPU Platform Enablement<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Intel Corporation<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR11MB2567AA0E08E6C8ED118CA8389A9A9BYAPR11MB2567namp_--
