Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934755FAE6F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 10:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C83A10E7DA;
	Tue, 11 Oct 2022 08:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E5A10E7DA;
 Tue, 11 Oct 2022 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665477023; x=1697013023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3GRdFXQEHCcmEsNDYjqLxjBIqCE3XSELj4KLu8AFDkA=;
 b=lQRZKwlcTTcIJGictasWg5IvPuUKvO8pWry/sWSCoTs0MzKQ10Miagy6
 CC8EA+bggY0fQt4Q/RGPgE9avvIKhgPMwN5iQMaiciYar5+4XlLyMjbxR
 QlzfdOvgC1m/bFAWd24aCHFqqoCdGosZiT4+SrXEmSVl6ZpJ8Tgyvw8Fk
 FN2dZ10n4NfthLhaD8jGFhRaAejhWFWuWuKzQ8ltPhSC+to/zCHjaCwLc
 9mSSH61AtgU30E3DeAIBLKAuNGcU13VZj7eYNdpeHgHoR/0zjGQSew6RG
 FnEkLokF9yFmpqkDZR1WjyabZ3CUaKwOXcSA6mqA5eKJjjkxp/kC9BYv/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="303184359"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="303184359"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 01:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="768716117"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="768716117"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2022 01:30:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 01:30:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 01:30:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 11 Oct 2022 01:30:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 11 Oct 2022 01:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORIWcIx2mGVIxKGeGFJ1G3Mi056pBKWnkKtgxFSpRcivuIyebFCsZvO3VhFPtXN67RwlCNST9HKI2FXy/UfEX87ELEU0p/VVOrj+xVsU2FXC5HErzEnyiJIIjR+5dn6vgIBnSDFvlHhc8LUNjsi2yWg9y+l7zWRbEJ+WMRHMeK8nNxvgpkvUnadDRcUyv2Vdhof6k/3JGu96CL3Fevu3JXGYxQtP0U5j7od/cpfF/+4nK+JtHotCJBkV5OLj4RrSwsycxHEghF9+MEukq0zwhudbEIis81+0FvkCNLQfcfRjkP8B7B1sZaH6XPJ+Ty35dDhKEByCNbdd/gR2WngI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXXxIgGquSx0ZSdQNlN1AHY2w14NAHrUAlTUU1B/y0M=;
 b=PNH+eLjjJRna5QdNxMGD3F+0zawca5L3ap4HYTcJ4jYZmyViTqXOM1agNGAEPy2roxHUrL2yGsYqAJ9cOFTdFWQGlyfWaAutKqshVP47U6zQO6Um90id5mVDOAsNkOOgRE6xZYyQc7znLMflfvLrZXjYMtchdz4LH5RGDb8Oq5zKf2yyuStMaO2+6elSN/YWrgSQDic/HRbKhUO953yh0nZSq1X7i8hY0qBZ4Rt6s+Rwao0oan95IaPkOgZ0vWLo4Y80bKraC3REYIyix2/hSK0D3csRgGonYufXJNYJ3YmIRx3cdRZ53o0aL1d8Hzr6/GFxPa0Vw9HJrixZA0A41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.15; Tue, 11 Oct 2022 08:30:18 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::6405:c026:bd12:85d4]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::6405:c026:bd12:85d4%8]) with mapi id 15.20.5676.036; Tue, 11 Oct 2022
 08:30:18 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Use graphics ver, rel info for media on old
 platforms
Thread-Topic: [PATCH] drm/i915: Use graphics ver, rel info for media on old
 platforms
Thread-Index: AQHY3P6MVfk8MIPQ50+mtw2OYRJK8K4Iy/kAgAAOXsA=
Date: Tue, 11 Oct 2022 08:30:18 +0000
Message-ID: <DM4PR11MB59714D6C8D496B5538DA27AB87239@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
 <87pmeyyg3n.fsf@intel.com>
In-Reply-To: <87pmeyyg3n.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SJ0PR11MB6813:EE_
x-ms-office365-filtering-correlation-id: b07c30f7-a906-4ec5-aa81-08daab62d42e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tez604qzEvvdPLXJj+gQTjxMfwk2MPztTTcnYrnudFAvo/nAvf0zMbP2NotPTAiS8GjlPMTfSmr8GYM9BlIVvapThFi8vvzyKUf5qSBkAw1DR/qjbj9cTy6qxFK6QPET1r/0PT6oO+RAshhbGheoZGivLsY3rfixlw+OpauRtSt0gO1FD/XbcHDEtJmmuojPLSfFIPXW1qaupVgAx3NebaM97AKNqCpypsAXjuMoGpihegEKOlflup3KrFyvbX7X0sAVxD1BQenrIAnHV1RnNIhInFo5NUNCpz7NnWq1A95nwjoEcDPvzAoOWdtcXI9a3FdbiYqCmkTAoR94SGsNxNPlRHzgVrU30aAUz4NZCYwTxqKPNhxlYwBUHhWDHBDQtqo5p4InPzCEYswoI0/Qnb9Xl5df8FFBmfElrTYlktX5fWkiC91Yf7PHGqH3PjuzNgdDI53m1F4G+x829NgHUD4X4rUyJfRWSuboqYt8JMKJq2LLZAgzXmqS1FpqP/36HhTY1QVAn67p7jp9C4NQS3tLy3tNS9mr6zExfFJNqMfLwq3OotH9ywQKeMAgTWpygjrVgqYT+NcOZ3Pz2tVmdR5yy2PKtwX3W4NywMVTA46wYK7IE2jcsAlFLxDudSpzKIMwDe5d4Ga+ijJ2Ems0cNTDuOc9O0Gp35H4x1FKZwZ2Whcil/oqsRjPeReD+eIwwd1rr6Y6ptcV62/8mkBnbwBJsJ7IYvlE6Y5w2FP6AMST33ExtfyKKqfxi1lmeYrF4BOVX8nYMTLwzxRpb1Y3Ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(2906002)(110136005)(54906003)(316002)(55016003)(186003)(41300700001)(52536014)(66946007)(83380400001)(76116006)(66476007)(66446008)(66556008)(8936002)(8676002)(38070700005)(71200400001)(4326008)(64756008)(5660300002)(33656002)(9686003)(26005)(122000001)(6506007)(7696005)(53546011)(82960400001)(86362001)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gU0XFk9gSskLQ1cT37xXniuORCzvWuZ+tuWvZcOsmj/tsKA4/EANTl5iafQe?=
 =?us-ascii?Q?VrIsxK6GsiHAL0dpdaI/05B+rM4rZSnmY+emch0ZsJSECUTC0tNLFegjF3Gz?=
 =?us-ascii?Q?5zekCywl1aC+GnHKsl0k6JWsLV3TQ7HRYCeg0d89Z24u7fdnshdi9xEIGixU?=
 =?us-ascii?Q?zZNG5/J80Vfr559HbL5Z5oB10TMGAjpx9PRNwuyCl30hcDSTEKfani9O+ktG?=
 =?us-ascii?Q?lBdkuPUfbuBNjFyeSJbxcKnALCZjWqZypaqXrfxa5On/gZ2gnBo+3uyJupGy?=
 =?us-ascii?Q?UpAc0jTVhYuHR1F7gE/IS23FkSQMbOwap1dETPNwl1/BsNGn3cvgEtIZH6ys?=
 =?us-ascii?Q?+14SS766nKQQx+Cz13ZaeZbkpCk195Ff/xycNgBwSrBQ05iNVlVofOvuNu5S?=
 =?us-ascii?Q?r+pLeL7z/F0Bo82Vj+t0HUr83rpdTS0R4zIGbpHr49T3JFNoOIWv7qHjkGIN?=
 =?us-ascii?Q?bGhfMMB4IswHTZCVrdTs+rPJk363+KvUs+5t92AHmsGoIw8yJvySGORsHAVv?=
 =?us-ascii?Q?qgOSGGr/j4mW+SAAqeKAOK2QmsTn0K1zYu8g8SbU8imrS7AR4ElmwW1K4PkG?=
 =?us-ascii?Q?zQLm5L6YLUEtIqjaYavmbrC3q7s4it0sVAM8+ZePOet3Bwsp2GpBZzmG4/Kv?=
 =?us-ascii?Q?v91KfotcYw3CEeVYweukvyNiMPFwBkqicPKoRaeWR+/mSbU/7tEr5+8DO/qF?=
 =?us-ascii?Q?gI0d/pIw6pm0Sci32KOXwB15roo4VvgSDmGjDZwLu9r0XPAnPfJjA3kHjyk1?=
 =?us-ascii?Q?R7bmbeLDhcS8hb3YaBk4yBMZ3yx/MGAzXtlqPBDmQvdJmgAZ7GjqgldPZFoa?=
 =?us-ascii?Q?wCxBYNr7G5GnK8F68Nbk8L/r7ml0iICYH70LEOlJ06+aS4vtbYByZOsG6WYY?=
 =?us-ascii?Q?j/MiNyIlylDCgziYROUDKyEYc2sbAUH2GnE1F2tQWKdSujYuyYAi9oqn+U9D?=
 =?us-ascii?Q?Ey/gtPJ29/K4XO3V5wnuhvIu3D2cXQ4y10cLHpQbb3JtYpCb6874sK0CCxHp?=
 =?us-ascii?Q?BOZu38Uj8HckqCV9JUEIcCUhE1Lfj17sGdoXT+B5TSDkcXhIa/+vC3b/We7s?=
 =?us-ascii?Q?6StpIpx8cNowLLOESUfNsx0ylfNNbdwU5plrgvTvj5XVWG2pjfQly8R1c7y4?=
 =?us-ascii?Q?PXZSynXoJUl8bZehoJ0YS4oIKujZ/P32R17OMhxJZg7zuw4CMnghp94x9BRz?=
 =?us-ascii?Q?BkrHeKBPal729PCL8XIml9713jwnxPU5y0qA7bj/e7Da+zomKRoxCv2q5xF+?=
 =?us-ascii?Q?pxtrnbsPe7/v/NrHEInon47e5PibyQ31z9P8GL2ETiNsTBpdjkdxCBshZshF?=
 =?us-ascii?Q?I8sA4VaMPYf266n6WP/A6nbxWqHcRycH+kBvo8ZKDppniUV5Ni0NXs6lbkHE?=
 =?us-ascii?Q?1AESDwR4dWc7q7OjqEKKTYrKRjiN3AW7aMi7B7EaDwlkjaCWUhyjIdhGxyd1?=
 =?us-ascii?Q?itSdYGnlVmNAiZ2O/NPC+mlbHAc8CaC23RAaUiC+fpX74QcEOYQv0YAglGSk?=
 =?us-ascii?Q?dmL+wFjZWwGb0SKQltQAp+MHCppLrxqMZ4xtFZ/DC1m/eUFG8TOifEPCgXc0?=
 =?us-ascii?Q?XtpT17xxjZ/5QK1xPYMr/3pHs8dCZzBXajpCPScPOxMOlLT1mlQajAPPYsjH?=
 =?us-ascii?Q?8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07c30f7-a906-4ec5-aa81-08daab62d42e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 08:30:18.1163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lk4++ds5oW9gPZHu9AJyIE4P8hPflgsTPSOgLJsac9vJfpXNoA69NklpaHQeL+l1g4SD/A1i9U8/AuJKMGXCxYCpumIFXJ4oyya7L45O5EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, October 11, 2022 12:28 AM
> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH] drm/i915: Use graphics ver, rel info for media on ol=
d
> platforms
>=20
> On Mon, 10 Oct 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com=
>
> wrote:
> > Platforms prior to MTL do not have a separate media and graphics versio=
n.
> > On platforms where GMD id is not supported, reuse the graphics ip versi=
on,
> > release info for media.
> >
> > The rest of the IP graphics, display versions would be copied during dr=
iver
> > creation.
> >
> > While at it warn if GMD is not used for platforms greater than gen12.
> >
> > Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch versio=
n
> from hw")
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_device_info.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
> b/drivers/gpu/drm/i915/intel_device_info.c
> > index 090097bb3c0a..ba178b61bceb 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.c
> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
> > @@ -329,8 +329,18 @@ static void intel_ipver_early_init(struct
> drm_i915_private *i915)
> >  {
> >  	struct intel_runtime_info *runtime =3D RUNTIME_INFO(i915);
> >
> > -	if (!HAS_GMD_ID(i915))
> > +	if (!HAS_GMD_ID(i915)) {
> > +		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)-
> >graphics.ip.ver > 12);
> > +		/*
> > +		 * On older platforms, graphics and media share the same ip
> > +		 * version and release.
> > +		 */
> > +		RUNTIME_INFO(i915)->media.ip.ver =3D
> > +			RUNTIME_INFO(i915)->graphics.ip.ver;
> > +		RUNTIME_INFO(i915)->media.ip.rel =3D
> > +			RUNTIME_INFO(i915)->graphics.ip.rel;
>=20
> You could assign the whole struct ip_version (*) at once, or is there a
> reason you're intentionally not assigning step?
Step info would anyways be determined later in the function intel_step_init=
.
We already have macros in place to handle common gt and media steps there.

Do you suggest we memcpy(&RUNTIME_INFO(i915)->media.ip, &RUNTIME_INFO->grap=
hics.ip, sizeof(struct ip_version)) here?

>=20
> BR,
> Jani.
>=20
> (*) Why does that name not have intel_ prefix?
Good question. Since introduced in " a5b7ef27da60 drm/i915: Add struct to h=
old IP version"
we have been using as is. The author might have felt that the structure is =
not big enough/used in as many places
to have an intel_ prefix. Do you see a symbol collision here that we need t=
o add intel_ prefix? If so should we do it
in a separate patch?

Thanks,
Radhakrishna(RK) Sripada
>=20
> >  		return;
> > +	}
> >
> >  	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
> >  		    &runtime->graphics.ip);
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
