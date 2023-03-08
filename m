Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B036B0529
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4F910E66C;
	Wed,  8 Mar 2023 10:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D90F10E5F7;
 Wed,  8 Mar 2023 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678273091; x=1709809091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RidooafDuAh1jsRFETo8soejqPe47VcmXpSHXZVXMsI=;
 b=Il5SPtBnoLMO8tKc3qcuT1crRtyPEF/7+nEtIDqwhjYO4RgtAowqpvCm
 n9eUFL3Eyy2lXhW0qLKKNnyE7bzt8LeAuSv0VqbKDVFhNB5wV9tlVMfhb
 h0BDya7lMef3hv3WdtWj62uPjpT4tLftBY3ttC0m1M7HbdMgWEEnqcGsR
 e3RkutEZrdCNeLCGkrFbji3MjOt/lM4qnS+mLx2Pmaxi9IDX+v+J4I0Ng
 ElTAjOWRe+2xsePIiC4C6dfavhPdw3Dd86TrVkCaCQvOJJhjgsz6xmlNY
 l2EoCT2bI5+dymF2YsKCBQQ2lvAPPefxsPs2p9E0/w9wwTG2ieDu2We4S A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319955668"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="319955668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 02:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707141739"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="707141739"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 02:58:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 02:58:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 02:58:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 02:58:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guF/J7pj2iFfuNtjHgx4j25SlHVPtgM6c1Mau37wskH7Je6qpviQC8bWPiU5n8kcTvdKShGGX6Xbcw4ku46+7SLEbaATwJ3Xbui3UYiflZxVTgXHvFPur7Yh5lbTB0LYA1CoaxHFr24E+D1CMuIbYiVGXt1EdkadYnZKlHlXXKzenLl8KXKL7OftzhtvZbhaiOkNz9YZ7CcPWE21z+vdptDYVuCeYTWUP+SbWAVqynDFjcLDR74TszxFqpt2tDUMkoA+lasbNnKuD8s0UCwZ5lbeL1Nm5G4IRxrraj/XNROdsBULU+EVEpNiJJX0gMlo24eOgbh/tYgb+rdBu8o3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw8dwDjUyHHJ+zQkQxnU/WPIrARigZPM//dduxhrtnY=;
 b=OfoiGP9aTw+2cAJwigxRvpZISGyrmJyc8Z/5/f6RKtbpoDDKxQLVJQpXERjVK28owZ2GKFZBA4owVZuzfLNHg1K+aA9rme9hjWK9mqWTfaEUvPCAnf/21elP6w/boV947aWEGdIwn5ntyJUaDCQm7zwjRX+LO8QL8dN+L7A6lzPPe5WM2ZJUPV9kF30pXeIqrSugIf3nVRIcw8gISxCQSjHt99FbMzMKNBra4lbyboZZCOHkrCMf+e9CiQFJJ8nY3S/T1SmgHxWEuI5klDbXyCllrXEq4gKLGsCVn+aOYPLhSpGFutPrRE/3OKwGA0oEJVwr+UHImkWHShwpIZLzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Wed, 8 Mar 2023 10:58:08 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::f677:36e:9fae:b45e%6]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 10:58:07 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/7] drm/i915: Adding the new registers for DSC
Thread-Topic: [PATCH 3/7] drm/i915: Adding the new registers for DSC
Thread-Index: AQHZRn8rnz9sjE84nkC7IJf1Pbvkqa7wzFkg
Date: Wed, 8 Mar 2023 10:58:07 +0000
Message-ID: <DM4PR11MB63608B360592329EF088351DF4B49@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <20230222053153.3658345-4-suraj.kandpal@intel.com>
In-Reply-To: <20230222053153.3658345-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB6513:EE_
x-ms-office365-filtering-correlation-id: 659e73ff-2574-423e-ce16-08db1fc4000d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kYUHN2+JklylToH90021IJeyDnwOhwFVnHFG9fO8RvMWdPKYswNyIGNHlj599XR3TDzy4S14gVbxQ8OTefhLCLGobh7D0ejj3OrgWe/chHaVylIMoQ+UJGrj5Bxs9ieMZFt07EiTrmUE0y8ZhZzYNf6N0Dqde478YSPY6xU94iMfhaca0vB3kcnsEPpIx7oeiLxcuZLlZj42t4OzhONw0EAMwG5mI+fJdotvSz1Vioh8USDXnKTni8CvR75QBI1aK4MCPSVG8ng4b6ckpa0ZTogZFUxf1uG/asy+UOPG27x3YNQdn9yYQFg3AtO22KllVupQYBEcVPp3g8eqHTtRbhIa+/NsJBK/rZpw7geeGcWWuiar4k5/+vA156yCoBvV+vfqG+8kWnl5LwOmmC2sSj4vFDgSgIfsajbV5GpouJPR2Mc82r4qsc4QyJR/Unj3aLBmzAZtIZ7vZPqLZl/K8c1xQWVeriGvsUcby9TiImFw/UcELsTskHCu6MWMhXi4NaNROi0wFN0mzveecbMfNqUBOivY+NJgHCxCO9PLZdZxwBVtXXD0A6U5O1P2r5xYRjYw1jtMqjVO7okzVoV30FhM7nbnduQgRUjiBPIU2GP2YXFwWqJmzRE/6CRre9rGteJww1K9IAXmTBIE3YPkZXjWNUq88RonzzkLxA1eHeIle/RHMTdOACz97HmE8DhUmCAOOxWFEFTKWXSuqUm9Tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(26005)(6506007)(53546011)(107886003)(83380400001)(38070700005)(33656002)(122000001)(38100700002)(9686003)(86362001)(55016003)(82960400001)(186003)(66946007)(66556008)(41300700001)(66476007)(66446008)(4326008)(8676002)(2906002)(76116006)(52536014)(64756008)(5660300002)(8936002)(478600001)(71200400001)(450100002)(7696005)(316002)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/aiL1Wrm9BP5n4YVpu2U+Ltcr2Nt4DwZ/SL5wP5iTg3kNsF7bKvbEnyZznDi?=
 =?us-ascii?Q?1QImXfDiFGixNBPwW+5NWLUlnbwG9cQryMuB8XHrezMeH6koOy/ATgqzFlAV?=
 =?us-ascii?Q?ZrCt0dTzw6eicgRe4Ssy/DTQkEQsAHFEBOpqS5YyVuJE4eLY2r4iwc43D/06?=
 =?us-ascii?Q?skOAIuuBcaRaIkjcjrEiW08ix+eAxINaBvFpmXo2zaWnH5rtBXuOLorOtsT2?=
 =?us-ascii?Q?yMxEjNuyGF6FJdTjNzU/YfyzJfAYo0Ib4Csv1HuYBNDH6LZEmLDZ9FkKMpLV?=
 =?us-ascii?Q?PjZCMQzdfRRtdLBtX1yCCa4uk03gHQL0NVg2+CGXXTYWnfjhlhyZ18DYt4cx?=
 =?us-ascii?Q?rK8iFdT0Bm/sm2mnewzmZKOS3Vf6aQ1BKJGm7gXy7k8j6/YbogqP24a1iv7J?=
 =?us-ascii?Q?tlxcj8ZdhepaUmTxb7ZURyzNF4kCRi6oXMjojN/chL6Hj0zd+CqMgilMXyP6?=
 =?us-ascii?Q?fsf6aem/8rQKj3teEwS7bLRVQYm9WDj/j8B2ZH1Ziz5r5bB0xgaHNWKGw7xo?=
 =?us-ascii?Q?w0+7N+qj3HMPQb2RUNcaa12k8iujfQ/zcqyjBj6mstxWTjYUSnsizoD5vEl9?=
 =?us-ascii?Q?L69ik3bjYgl+Er+UGSI4HAgAXjKCqnjIkYU8ZuaBac2K4Pmd15yAWUnhldFN?=
 =?us-ascii?Q?lBc8nJyS8YTPglHQqiikDvGFDfm8Z8xo2yA8ACxgqt7FvIAOuADN/tZK2vGb?=
 =?us-ascii?Q?Li8TLCAZmNfVV7et/qR+cK3o3CANUb3DAZHMAbwid9ZpqPAJ4t8NMqlbzYYk?=
 =?us-ascii?Q?poWxtiIGjGokSFKRVZ5p7FndMTAy6LwFmza180SX7CSNYP8ckJsiHw8pvdLZ?=
 =?us-ascii?Q?JHF9U/Yi6M4eu7PDi09eS1nXTcrBLaK5AXcfi8mhQGXElGw1ElyDNT5/d7HY?=
 =?us-ascii?Q?eH5v1r+aHNlda1iu+30Gh5uLjPjauw4C+wjU7fgID7sJR3UFCkwXasnT+6S8?=
 =?us-ascii?Q?DblrAw70eENtm6yMynsHO2/5Q7uyqsaKFgyJHAxJEH1IZcNW7kxR366e/t+b?=
 =?us-ascii?Q?cmYxNSOdrytF2TOC9TffBDYXriH7WBA3qS61B6JB3hr2tv2G4p36kcsRQdkl?=
 =?us-ascii?Q?RHxm15Q4kUyH/LGePMwKaw+wW0iFR9U1UxKvCfZEx929SR75FsTa97d2Akl0?=
 =?us-ascii?Q?FM1OvnjAVj+Vw99Vx0E2ZXAOGPRKABgPi0hCx8dpVPbmGM0gE/hdtInsBIw+?=
 =?us-ascii?Q?GIAhI8ee7qhgSVuJC8kjKZtQDnl6eS+DeTAWlQA/++ULB4cdFbECw8qILBdT?=
 =?us-ascii?Q?/GI/cEk4vbeN71sel/mutgxVvQij8SeRFOlBob4YLRLpgzq7AAsyfmdJ1igf?=
 =?us-ascii?Q?v+H88RwSDMYzO2GW6eB6pEUcQzmT1/VsSQTEQCktcMJ+kvUK5PvKwQHUNbIi?=
 =?us-ascii?Q?oYYuJRcccJ3X3uGFxyWcdyJzoYK6RCxGLv+yN71wWzvldeyDjHyjyhV6dch4?=
 =?us-ascii?Q?dR2prYMThhjmdfk/PBpyS5X8MmfzHUnowCGBJig/Wa7R++1pADtitwyt6w7V?=
 =?us-ascii?Q?BRqQ2pPweOtGvyK6Gd/icXAKnW65OTjNJkBlwVP31+J6MAX0GSfFkbn+Yb/A?=
 =?us-ascii?Q?zXRHGarPNhSG77eseJuYrGrsAEjOxMqnrWfOvq6x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659e73ff-2574-423e-ce16-08db1fc4000d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 10:58:07.7856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nun1KTAqncxREx5NZ5GMnQ6alO6Lsh4u2KpTDavZuXeH+YqhpcAMhr6f2Dk2j9jljElh8KYscu77UhjTFtCyPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Wednesday, February 22, 2023 11:02 AM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>; K=
ulkarni,
> Vandita <vandita.kulkarni@intel.com>
> Subject: [PATCH 3/7] drm/i915: Adding the new registers for DSC

Nit: drm/i915/dsc would be better.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Adding new DSC register which are introducted MTL onwards
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Vandita Kulkarni <Vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 596efc940ee7..9e25e21d37e4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7715,6 +7715,8 @@ enum skl_power_gate {
>  #define ICL_DSC1_PICTURE_PARAMETER_SET_0(pipe)	_MMIO_PIPE((pipe) -
> PIPE_B, \
>=20
> _ICL_DSC1_PICTURE_PARAMETER_SET_0_PB, \
>=20
> _ICL_DSC1_PICTURE_PARAMETER_SET_0_PC)
> +#define  DSC_NATIVE_422_ENABLE		BIT(23)
> +#define  DSC_NATIVE_420_ENABLE		BIT(22)
>  #define  DSC_ALT_ICH_SEL		(1 << 20)
>  #define  DSC_VBR_ENABLE			(1 << 19)
>  #define  DSC_422_ENABLE			(1 << 18)
> @@ -7959,6 +7961,32 @@ enum skl_power_gate {
>  #define  DSC_SLICE_PER_LINE(slice_per_line)		((slice_per_line) << 16)
>  #define  DSC_SLICE_CHUNK_SIZE(slice_chunk_size)		((slice_chunk_size)
> << 0)
>=20
> +/* MTL Display Stream Compression registers */
> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB	0x782B4
> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB	0x783B4
> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC	0x784B4
> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC	0x785B4
> +#define MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe)
> 	_MMIO_PIPE((pipe) - PIPE_B, \
> +
> _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB, \
> +
> _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC)
> +#define MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe)
> 	_MMIO_PIPE((pipe) - PIPE_B, \
> +
> _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB, \
> +
> _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC)
> +#define DSC_SL_BPG_OFFSET(offset)		((offset) << 27)
> +
> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB	0x782B8
> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB	0x783B8
> +#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC	0x784B8
> +#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC	0x785B8
> +#define MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe)
> 	_MMIO_PIPE((pipe) - PIPE_B, \
> +
> _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB, \
> +
> _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC)
> +#define MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe)
> 	_MMIO_PIPE((pipe) - PIPE_B, \
> +
> _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB, \
> +
> _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC)
> +#define DSC_NSL_BPG_OFFSET(offset)		((offset) << 16)
> +#define DSC_SL_OFFSET_ADJ(offset)		((offset) << 0)
> +
>  /* Icelake Rate Control Buffer Threshold Registers */
>  #define DSCA_RC_BUF_THRESH_0			_MMIO(0x6B230)
>  #define DSCA_RC_BUF_THRESH_0_UDW		_MMIO(0x6B230 + 4)
> --
> 2.25.1

