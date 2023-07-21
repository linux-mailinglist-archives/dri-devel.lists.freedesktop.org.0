Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9D75C801
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 15:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F4210E689;
	Fri, 21 Jul 2023 13:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52DE10E68A;
 Fri, 21 Jul 2023 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689946773; x=1721482773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=Om3sRWtpIPifBNt/BnaJg+azyIreUmqeY9F9Y2Vy8QA=;
 b=OGEeNpZRVwK7jdCU7BhloYlWTdhAxO+POj7BoVqgQpj3PhW7KPIB+f0o
 D2/57lVLxwab7TvG2j7Zrrowvd5HPpMBeAKOe3FiTZ6MLw9mlljnKXpwk
 vXOLFtEVFg7hiiwRE7oPZfCF6coUKlD+Sj2oMw+ZK0xwSGG8ES0G+7UgF
 2DJIOikiLYVoacbJ257nt9VZ+TH0L03qEQbuzvsRgUODPO8SBDkv3qDwR
 TA/EOks1gbpCe2GsEPFIrHOgH3GeF2986MJe3+jpj4qZKBDSFOF4TQNl+
 cOH2YnYvND9gGyAwaw4BCV+yyFgSfrCj/a4CRS8fa5QNKtbUc58CsnKo+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433253804"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="433253804"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="971451033"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="971451033"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2023 06:39:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 06:39:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 06:39:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 06:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiCGXImvhT1l3pZEkiLIXjECQwStzzFElRHO5RlK1XVs6O5rdTAmpb2xQIJUTp1chBk0sjLhJjkQG2OfTHhN8mSadd5HilSIBQC6p3s+VP28e69KXBaU7ad0o9ngmwn4+/RbB8d2l+3Ip4XSD9utGdyHch3s6fwIYTHeUrwstioklnCU0eRdTxwSdoNmY7BFSiITozKNXI0dfZnvNmLAVOE65fUawbTbUQjSwEJcl9vzupR/weLw57V/78XAUZEhkg8amgFOeWdk/zmetrRtlgC1NEmp/pfwzA6IPb18foZJovGlR1p/PIvYtwBkNolz46t2k4Y+drENducaMV+R8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKSouEocs8s4vRsZALi/L0LEX1a/NbCOClvOJVbpD+A=;
 b=W5w9yVUzQj5mnsNP658j24+15gnxhcNCui9dYjL5iww8P0MCFtu/lf6lSo7sDZuC1MUSZYe0AuYUWVJFj8vxfFJy30SRMw80g52yDOYulG0Ki0DPB6XafClw/w1TYUMlM2r/q8IseD2AL8UwDTB4ojMTFMKG2DlJP2My/4qy50JZCN0G0+kNdi0vrj5BpBzFMVVX+jxwIEN6DNnKNrPhVIdvMFTCksFVIrHG/828ekDdb+FpoabYFAbomR62XtJEcOqepMJf67gFAg4F5OeAT+5j9AQ/IeGn1r6EirEPiSNBgjcwFoCnNExGMR7gYmgI8PTm7NtF59m8F0XsziIzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 DM4PR11MB6143.namprd11.prod.outlook.com (2603:10b6:8:b1::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28; Fri, 21 Jul 2023 13:39:30 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301%7]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 13:39:30 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
Subject: Re: [v7,9/9] drm/i915/gt: Support aux invalidation on all engines
Thread-Topic: [v7,9/9] drm/i915/gt: Support aux invalidation on all engines
Thread-Index: AQHZu9jG6ZMU3BaY2kuFcpe+FqH5KA==
Date: Fri, 21 Jul 2023 13:39:30 +0000
Message-ID: <3494477.V25eIC5XRa@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230720210737.761400-10-andi.shyti@linux.intel.com>
In-Reply-To: <20230720210737.761400-10-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|DM4PR11MB6143:EE_
x-ms-office365-filtering-correlation-id: c9cce746-3bec-4c69-b77a-08db89efe91f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ut6TwKYNXWLIMPLpQYtCECVMOTEwp3wpGzm32IooPkugM+C3OgyM3IXUaNx3qwXmFNtvZILHl+9VzLmBTVuqNGnfTzxkZB6rpRWt5lNu961dcJSnQNteb6a3jYCoQGVdAMXqq9UgIhbK2+hjdoRCfhRUVGS+fKJ/F6oFiLhU3tvmRNy7mtPKGsP6FWCT8bbuQl9yPCGybQqK0bRYYZNZMSzU8ezDGDbGadpapyS4zxbhDdI8DvUTnMh1fxrXRbtVRj4z9p/9Ag6VwVRwtvrGiOJ9SMfmWnmuklx+/gQ798tqSMbFMETeA4ZWlnE07BzLKGY4aJKxJzvZ8SiNxeFJTO+t+1Yq07It+6/XP5uyaO+sYt93ef3DY3xnfLkk35Lske3uddzcZIGsEEZhIHtxU/qY9ygXzWj9MZ74T9h6u3ZGSsNLOtPoc4g7Bo/8RzM8x87dQvrIgFVRgEBUeLsT1v7uGX3nUV+iNdOPP3CgOL2iS+xCVi3gT37a0NoGRrKqU5DNUBDctbgvAfiVhPFOhhMg2b9twel+CJN4D6yPxmlmnULrxQr7XGN8h0uCMXQXuur0ZO0sd0jiD8KpXCtqWs+eA2ka047hoP8fdcapLIRDYbm2SGSMEU/2Rl+WQJ9EyHWf/+5SWRnBJbXzd3jucw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(6512007)(478600001)(6486002)(316002)(38070700005)(71200400001)(41300700001)(64756008)(66476007)(86362001)(4326008)(110136005)(91956017)(54906003)(66446008)(66556008)(66946007)(76116006)(6506007)(186003)(82960400001)(921005)(38100700002)(83380400001)(122000001)(2906002)(8676002)(8936002)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Oor0FDscTtK64P8j2DBpzFZbJOkNdTO0diiy7mWrtt2fP1/WGTwhGCRGV6Qd?=
 =?us-ascii?Q?SqhXFFedXoel0CEn1hcHfGiPpk/b3tTEfsy6DqJAe/jzvY210h1mZyQeu1VQ?=
 =?us-ascii?Q?nH+O0OQRqEwIu4w/Ag1VrtnPkKnFlsnqv/Edwua90M7qf+03Spdk1TSTOYel?=
 =?us-ascii?Q?uYQJFq+ue3lIaj7jbeiWxTakLkNQIHX+m8xK8FooHeUhV2N9CpIe4JkzzrDd?=
 =?us-ascii?Q?fD/WeqFvGuBikWW2sJ9dYpmek+fWft9O3FJITQWVH5YHvow+9mLRDhID80/I?=
 =?us-ascii?Q?78bw1WrnDlhAFtxTxoypV2oTwCyBlyh9Q+bfeTnCZzK+eMLpbRTxvf9cNftp?=
 =?us-ascii?Q?/zLtsKXCvKkxA8p/N4qUkaxDo1uTJFAWSgN834s7KRKAlwcj/x58Gl/EUHk2?=
 =?us-ascii?Q?NlJqVIaDvTp5X54aQyk1HKsBsNqWevL8vi4S6N1C42CtBQpCgO5oVBgry0Ia?=
 =?us-ascii?Q?PL7AnmUw5IpvZpRVrzSeUkTg7yV/L6IoBzV6mGQJ19WeZLckTYHZeL1/7U5H?=
 =?us-ascii?Q?uQAyMePU4rl4mf00CRWTlY0FQzXVYBNv0qpFl0FOUlSVOZeJnDVrqEeEFb0q?=
 =?us-ascii?Q?WclVwTgdRtC/oIsbk/+tNbf0pAxvZo1O/ZU3KTybCqJpSQ0eSF4LILLOjrpI?=
 =?us-ascii?Q?S9ZgB/eGy7vGzC8NEObn7cDKRZG7ZHpWeiqrYm+J4popKL8znic/ZL51/gO3?=
 =?us-ascii?Q?3dRvIVnYw1fwiprJZf5w3MmuIoJAa2bte1Ko1W+5k35Iiw8NqDvJCZFPdeNg?=
 =?us-ascii?Q?fPdJTD5zm2myfTlzW1x8uQl8qg7/b32zbbb8lkVVWPdv2H0kxSjewYdGGIFA?=
 =?us-ascii?Q?k75s0fYKHOx0a04TUrbJb6zclUGrTLjy6QJJad/gJIDUIvl/4IKWvK4klXWF?=
 =?us-ascii?Q?UckJjOjt47IGD8YHE4YWop0ll6E0jj4s6s5d8NeKqtmsJB3haSqSAQgNe/cY?=
 =?us-ascii?Q?gSvZzNbH3L9P9Zl9v/zdVKJn8dvhEsIz4SDl5K3vTm6v7gelD1Q/bP3qIGBi?=
 =?us-ascii?Q?XhneKREIhf18VkvtOeB+arl7X46DTbnDUtKRIgtvZeyvf4ss9UyLanY7eln2?=
 =?us-ascii?Q?N0Yi75eY8iu9UtFR40jU9gvviNBWZbdsBpZROetQXKWNQsK/p0ha0QGUwCMj?=
 =?us-ascii?Q?kUneLpWledcbp3blROLi8R47ETiVFPmT323ptVTpNqp6e0w5qldOrdJQg63k?=
 =?us-ascii?Q?+5e1Z/lLYEvTmell2Of+3PkYLnRFETGq+/2FmXejWsBDzZWdsP9JPCIrti3m?=
 =?us-ascii?Q?pcRqs8804y2wmqmA63lllABEv4D+WpXs99vBf/uBBohD0Oid30ew2dwFfFcz?=
 =?us-ascii?Q?oi7i89yQhR+veIRpJoJ53fWtXbw9cFRTkFGLYQgFn0GUFa9pGahcyV+MhQ6w?=
 =?us-ascii?Q?rrUQb3i4CP1SNYAme81IR6KIp5MzO49wghO4BK3LuZdOUR5HX8gWuHY4IHHm?=
 =?us-ascii?Q?6xRk9YSPynmTsOGebv7ucRmjABgHgO0Xgy0Lj4wjF0/8AaEc4hmUDoC83Oir?=
 =?us-ascii?Q?hVSJ1T08cfocG6aYTFr5rGx2DszDQSkCv9juRxqGWREXZTB+avTHVdOI3Ucs?=
 =?us-ascii?Q?hg6EfoE7XYAZPX6lRT2ZD9ENsE64EIr3V+pX/nEegqxtMLLytrDGi1KYIW89?=
 =?us-ascii?Q?NUMZMB3/sfhJbU/4oy3O0b8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F68D9139D822244BE62F9035002DAAA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cce746-3bec-4c69-b77a-08db89efe91f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 13:39:30.3833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eBxAP758Qe7C5lVpKxasL+eJJAv4eQ3tyT0FteY/4tW6BBSLGK5So2sjpkPYaBQb0VGW1IZBsPL+4zsVJWwAtuBgcgqcmBY08fkG8+65/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6143
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On Thursday, 20 July 2023 23:07:37 CEST Andi Shyti wrote:
> Perform some refactoring with the purpose of keeping in one
> single place all the operations around the aux table
> invalidation.
> =

> With this refactoring add more engines where the invalidation
> should be performed.
> =

> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all en=
gines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 58 +++++++++++++++---------
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +------
>  3 files changed, 41 insertions(+), 37 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i=
915/gt/gen8_engine_cs.c
> index 3ded597f002a2..30fb4e0af6134 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,9 +165,36 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | 1 << 8 | state;
>  }
>  =

> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_r=
eg_t inv_reg)
> +static i915_reg_t gen12_get_aux_inv_reg(struct intel_engine_cs *engine)
>  {
> -	u32 gsi_offset =3D gt->uncore->gsi_offset;
> +	if (!HAS_AUX_CCS(engine->i915))
> +		return INVALID_MMIO_REG;
> +
> +	switch (engine->id) {
> +	case RCS0:
> +		return GEN12_CCS_AUX_INV;
> +	case BCS0:
> +		return GEN12_BCS0_AUX_INV;
> +	case VCS0:
> +		return GEN12_VD0_AUX_INV;
> +	case VCS2:
> +		return GEN12_VD2_AUX_INV;
> +	case VECS0:
> +		return GEN12_VE0_AUX_INV;
> +	case CCS0:
> +		return GEN12_CCS0_AUX_INV;
> +	default:
> +		return INVALID_MMIO_REG;
> +	}
> +}
> +
> +u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
> +{
> +	i915_reg_t inv_reg =3D gen12_get_aux_inv_reg(engine);
> +	u32 gsi_offset =3D engine->gt->uncore->gsi_offset;
> +
> +	if (i915_mmio_reg_valid(inv_reg))
> +		return cs;

Is that correct?  Now the original body of gen12_emit_aux_table_inv() will =
be =

executed only if either (!HAS_AUX_CCS(engine->i915) or the engine is not on=
e =

of (RCS0, BCS0, VCS0, VCS2 or CCS0), ...

>  =

>  	*cs++ =3D MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
>  	*cs++ =3D i915_mmio_reg_offset(inv_reg) + gsi_offset;
> @@ -201,6 +228,11 @@ static u32 *intel_emit_pipe_control_cs(struct i915_r=
equest *rq, u32 bit_group_0,
>  	return cs;
>  }
>  =

> +static bool gen12_engine_has_aux_inv(struct intel_engine_cs *engine)
> +{
> +	return i915_mmio_reg_valid(gen12_get_aux_inv_reg(engine));
> +}
> +
>  static int mtl_dummy_pipe_control(struct i915_request *rq)
>  {
>  	/* Wa_14016712196 */
> @@ -307,11 +339,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u3=
2 mode)
>  =

>  		cs =3D gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
>  =

> -		if (!HAS_FLAT_CCS(rq->engine->i915)) {

... while before it was executed only if (!HAS_FLAT_CCS(rq->engine->i915)), =

which, according to commit description of PATCH 2/9, rather had the opposit=
e =

meaning.  Am I missing something?

Thanks,
Janusz

> -			/* hsdes: 1809175790 */
> -			cs =3D gen12_emit_aux_table_inv(rq->engine->gt, cs,
> -						      GEN12_CCS_AUX_INV);
> -		}
> +		cs =3D gen12_emit_aux_table_inv(engine, cs);
>  =

>  		*cs++ =3D preparser_disable(false);
>  		intel_ring_advance(rq, cs);
> @@ -322,7 +350,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32=
 mode)
>  =

>  int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  {
> -	intel_engine_mask_t aux_inv =3D 0;
>  	u32 cmd_flush =3D 0;
>  	u32 cmd =3D 4;
>  	u32 *cs;
> @@ -330,15 +357,11 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u=
32 mode)
>  	if (mode & EMIT_INVALIDATE)
>  		cmd +=3D 2;
>  =

> -	if (HAS_AUX_CCS(rq->engine->i915))
> -		aux_inv =3D rq->engine->mask &
> -			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -
>  	/*
>  	 * On Aux CCS platforms the invalidation of the Aux
>  	 * table requires quiescing memory traffic beforehand
>  	 */
> -	if (aux_inv) {
> +	if (gen12_engine_has_aux_inv(rq->engine)) {
>  		cmd +=3D 8; /* for the AUX invalidation */
>  		cmd +=3D 2; /* for the engine quiescing */
>  =

> @@ -381,14 +404,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u3=
2 mode)
>  	*cs++ =3D 0; /* upper addr */
>  	*cs++ =3D 0; /* value */
>  =

> -	if (aux_inv) { /* hsdes: 1809175790 */
> -		if (rq->engine->class =3D=3D VIDEO_DECODE_CLASS)
> -			cs =3D gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VD0_AUX_INV);
> -		else
> -			cs =3D gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VE0_AUX_INV);
> -	}
> +	cs =3D gen12_emit_aux_table_inv(rq->engine, cs);
>  =

>  	if (mode & EMIT_INVALIDATE)
>  		*cs++ =3D preparser_disable(false);
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i=
915/gt/gen8_engine_cs.h
> index a44eda096557c..867ba697aceb8 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> @@ -13,6 +13,7 @@
>  #include "intel_gt_regs.h"
>  #include "intel_gpu_commands.h"
>  =

> +struct intel_engine_cs;
>  struct intel_gt;
>  struct i915_request;
>  =

> @@ -46,7 +47,7 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request =
*rq, u32 *cs);
>  u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  =

> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_r=
eg_t inv_reg);
> +u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs);
>  =

>  static inline u32 *
>  __gen8_emit_pipe_control(u32 *batch, u32 bit_group_0,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/g=
t/intel_lrc.c
> index 235f3fab60a98..119deb9f938c7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1371,10 +1371,7 @@ gen12_emit_indirect_ctx_rcs(const struct intel_con=
text *ce, u32 *cs)
>  	    IS_DG2_G11(ce->engine->i915))
>  		cs =3D gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVAL=
IDATE, 0);
>  =

> -	/* hsdes: 1809175790 */
> -	if (!HAS_FLAT_CCS(ce->engine->i915))
> -		cs =3D gen12_emit_aux_table_inv(ce->engine->gt,
> -					      cs, GEN12_CCS_AUX_INV);
> +	cs =3D gen12_emit_aux_table_inv(ce->engine, cs);
>  =

>  	/* Wa_16014892111 */
>  	if (IS_MTL_GRAPHICS_STEP(ce->engine->i915, M, STEP_A0, STEP_B0) ||
> @@ -1399,17 +1396,7 @@ gen12_emit_indirect_ctx_xcs(const struct intel_con=
text *ce, u32 *cs)
>  						    PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE,
>  						    0);
>  =

> -	/* hsdes: 1809175790 */
> -	if (!HAS_FLAT_CCS(ce->engine->i915)) {
> -		if (ce->engine->class =3D=3D VIDEO_DECODE_CLASS)
> -			cs =3D gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VD0_AUX_INV);
> -		else if (ce->engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS)
> -			cs =3D gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VE0_AUX_INV);
> -	}
> -
> -	return cs;
> +	return gen12_emit_aux_table_inv(ce->engine, cs);
>  }
>  =

>  static void
> =


---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu usta=
wy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w trans=
akcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

