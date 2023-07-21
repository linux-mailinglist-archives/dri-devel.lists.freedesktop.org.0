Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8575C69D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B20110E666;
	Fri, 21 Jul 2023 12:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F6610E666;
 Fri, 21 Jul 2023 12:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689941428; x=1721477428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=l2R1+9cnTedga1JpOpsJ2nAOrEJdVg7H0qHEg4gHWC0=;
 b=UTuG4Oo/F3HjRJ+e0Uq4H7SA2fbyZzH/+7EYRlyhwniRgpkIdqk4x4rM
 r79m72QRfPmh39lUP1DTm+DxDSSCdSzqsYzjVnDYLg0JcvXDYytOUnCQJ
 hjC7BMa4DBgtajOc95A7/jhyQOIHjaWAh6lsdpjevIlEL8EiDmUmUq8Cl
 47un1UOYuOP7erUrqro43M7RfsdFx/LMaP7dpyeNEjzWlaMYkm/k6Yy0s
 NwxhUNseUr0IlJt0KIWLUHyTFDi3AbrX+9E0cI3xymBPaalPW7fLcpyGs
 EzfpCC9DyGwFYbfXyfhXtIoxRHckn/NDBBekTJx0GCEQAzVZyxKBqKuct g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365900979"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365900979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754438623"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="754438623"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 05:10:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 05:10:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 05:10:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 05:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfOzZKKAriI+YYWtJoSqAi0PqOe94xFBqSsV86Wj19MnbsJh4duu5kpeFibOhStWErKPscK4jE0ld9X6D4X6oQww3dvxqgup1RctzOP25um4RPPD2DWmERKzvXIHKlDQmJ0fSBwO+wtHBuqtU7kOwgqmyMDGXEoOsdVl4f78Tfbxugd5TLlX5BzcfBv3ZyYxOlJkgo9Pvlvycac3jIQsIbTyanXZr5FptLplggQ+d5c3KB25sResXDei7gIKIVuQoNFqxaqegV1NE5ZzGzOCKjxJiCP3WIK7HCWdaG9HVESNuF3UJptYL6X27CHs9wSlaRwdR4RSe7akYg3cIjElbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwlQYX83AiAGdsgVIyWMlN3xaNUqinq/qK7RNRnHuAY=;
 b=gtE3PZ0gRH9oqoe3dM06DFpY8ZDSkXA688CRZ7ViJJKdVweMNkmerCDIuUkASL9xdA2iMMn7Kk16dMzF8XMOslMYX7oKpP5BFwOZyDX+fPxeYkq5BFypa+CnjSh3PxoPwqhrPatQaYIWwF6QUOAxs37lR3cvr9+1xpqg/azs9/UaJKIwUJ9pm2IrCfK3hg2RX7YBmTAClZC4ZnPks77ByPmbTCR6GVwfaP17iKAWkEjXnW/0ZtrHsseeWa9g+B+QdvMkGn+XqNmcIQhjUvg9Otl+iVWP5kOJi8+LAg1Csy+CFVYi6rFQB7c0MCpBuPZw9Y5ke3xGCTQeAcAJfZdh1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 PH7PR11MB7074.namprd11.prod.outlook.com (2603:10b6:510:20d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Fri, 21 Jul 2023 12:10:22 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::7a40:3f62:1e7a:5301%7]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 12:10:22 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
Subject: Re: [v7, 7/9] drm/i915/gt: Ensure memory quiesced before invalidation
 for all engines
Thread-Topic: [v7, 7/9] drm/i915/gt: Ensure memory quiesced before invalidation
 for all engines
Thread-Index: AQHZu8xSQe1fgp1EkUqZBDCiG/x0yw==
Date: Fri, 21 Jul 2023 12:10:22 +0000
Message-ID: <2614817.k3LOHGUjKi@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230720210737.761400-8-andi.shyti@linux.intel.com>
In-Reply-To: <20230720210737.761400-8-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|PH7PR11MB7074:EE_
x-ms-office365-filtering-correlation-id: f91644df-f1e9-4ead-a5f3-08db89e37540
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kT6X7pziARqN/fD1iUA0nkgOQ/Z0EHMT5iO5HMV5uUo82gPKYGYcG8Fnd6tp+N1CVPD13T+6QeKicuHgb+EiZ5MaD57+W+KF4mwTk0/D3OYVxd8HCzCAY+bA2CVDu6ARtGjZEUSaipD2k2Q52OpL17lcxHKjHKglHbZNo/QMGNijbhEza8M8NXMmgN7Gzy1atQ2hM7zehpOYW/WL80rHuF+HxvQoWqvzWrnMuXDxI1OIN9M1XHbuT8JGHgKRQLsJuGyMe0xwm1eQjJVsNj7ucJdpEs5j0L4e1bZkhxpbEid7NzXw3GFJCot5icQLGeDXfQgsxFZcJ5D/rj9AaW82cP8G5o38iF9RMtqctwzvjnkPCEmgoO8KNKjOkD+kpwG+dOE5sM4F1af1znyLLYXdvgGDpUifRZpiB8Wu/aXiGgN98/Ng8FnH/F4mc+okkIyTk3J0tqlSpCu1EZJKobXA1pNPgnGZwj6Ah5aS3wSOPiofAYhq0DOe48/dSUDIBxiIH4pCP1SY2MBUPm2yZvmuhJuVHCOtCF+Bjdu6X6Stv7fGCp+HP9eOyjl7IT+VkhNbniKeSC9rvbV6OQVW+njzcDItSh/jm1uYB8Pimfm1YBvMc5De0YaSchKPwbNTTtl+GsgRGSTIFzk9lI70/wCmUNq9KTowWdbpqrrPTQ5N3s8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(478600001)(71200400001)(6486002)(91956017)(110136005)(54906003)(66556008)(83380400001)(86362001)(38070700005)(2906002)(6506007)(64756008)(921005)(186003)(316002)(6512007)(5660300002)(26005)(76116006)(82960400001)(66446008)(8936002)(66476007)(66946007)(41300700001)(38100700002)(122000001)(8676002)(4326008)(39026012);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sdpguGXaP2F3PR/qSRGU84YWhld8+Lzul/1o73V5k/BlrfWbmidQbsYiQPkR?=
 =?us-ascii?Q?VFAO9hh9qGiQCpttL6S2Xn9SetkpJtdZTRPtZvhCJFz2c5MM64OI8PNyBn+A?=
 =?us-ascii?Q?PUDVan1yEhwUjMbQuqT7I91zejqCzTLsTn7xm+2kx1dZMEFMgfcdzQUZ5tO2?=
 =?us-ascii?Q?Z2uzB2Xc+ZWGqE4J3/o6CPglrxvCGQr6hcBsVYfua+15r4grjLKBy1NmmObf?=
 =?us-ascii?Q?wQdPW1RSiB/Wd862sv2w77rLDOTj/7nbTZMfNH30SIPOWlbpRVMZA0ff+vGe?=
 =?us-ascii?Q?yVfN2dHULh93agFdK7IvXv3+hX4+sk61gJR0efxxr9Em8qNVWUji1zhmmkTL?=
 =?us-ascii?Q?+QokN/2NFxM+NRkwWErOJkLh5GsLp+fdTDxA0RwzYU475HIyGllBCKqjrl/u?=
 =?us-ascii?Q?BO4pI/LX8H3xM6j/ukU/CxRsSIJQBGc2dlKmE78SY7fYMyRKFIKbriGmXSgx?=
 =?us-ascii?Q?P6tSQJw5sq+c8jSv30JNC/BdqmWsgGOOLH9pUVKu4rHmAljB+6DbwhxwDBUo?=
 =?us-ascii?Q?moF5ip1uIpcI1ScCFmgCIDlAkTwZv9YwM+Qoz3bGi8PH/R3VlwvxXGTq+rGX?=
 =?us-ascii?Q?G0t+TK4GHp0mQOxNyKcpwwFMVFR0VuLkvEmzVuBNCOpSUZMhKz+kqo1lWP1i?=
 =?us-ascii?Q?PMcBZQ64GdPT8wNfAERwb1R6gFf2H3+5pJnEQ1RMHrdDK4f6LEsCYhEeg8B0?=
 =?us-ascii?Q?rgssanSXQKEFcPqUkOTKr8rOVrxVHTEIHf7Zg0YQ3VdhVC9go3i+eWBVmyvi?=
 =?us-ascii?Q?DuH21zJlbAGnDV/TkjcBaCEUWqJsRKFDdtckED/Ypj26Ihhul62+0ChpptfO?=
 =?us-ascii?Q?XGnAjU5WQ/dwRWcNJywHNjdMmTtR3UkFFbH4iffRC+2ry7Z3kFAiMktB2VqB?=
 =?us-ascii?Q?BBpjXyrxkGu8UgyOrIVwgSg1cQsYxrsK/bmjSMhEnxZm1GoSFMkXBSbHg3Us?=
 =?us-ascii?Q?p+bSZsitB+rqFAJvwc1pZbRkRedoq4372sktcLWGxQmZLc7NctNbd8ZW83No?=
 =?us-ascii?Q?MLxUnP5GEyhe6yGlBnGRFlRcsmwysTDkouFSnqWzog/lOkNQJMB1Se1a0R7w?=
 =?us-ascii?Q?GTkb7ju0maDXkMU6qotu5nxcFZVgaQSOCj/ix1fELc3nOWXtDpZc4EOPhYxZ?=
 =?us-ascii?Q?tbN9pMAxQZsiz3o67ptbQ4AJe42VelvfxYKjVUyyRRpcqm/+4TY3zAS4xiAk?=
 =?us-ascii?Q?qqlLqk9OPl5kA821am/DqL8AbcaIPx5UGzCDx3KkBi/+V9kr/JaRe73/b/DD?=
 =?us-ascii?Q?KQ1XUvAWoTrWrgq0EWKn2OC+pfae7k6GQtWCxWRqCH8iRXimO99iWVxkSYS+?=
 =?us-ascii?Q?IrljXCWjlgT26uiD/htYz3jF+Io9kfc2jEtCNvVXt6fqCokd0DniVfV8Gf/3?=
 =?us-ascii?Q?UFv7AJwtWe+9LYW9o1DGpEtmnwRfa+VNlX0isb3x2/T4r7Ht3Nt+35dTvN2s?=
 =?us-ascii?Q?0KJgEK1gxnWl5XupfIpM7VRf8/oCbWMc0grspUMPCHBsUKppKaJZqxlCvSm6?=
 =?us-ascii?Q?r0b0HMXrH3+26vuupfTgqXWBC7k3GYQoM8NhsNLVIQcB0wUsE2g7etvoMaT/?=
 =?us-ascii?Q?xnc/l0EGeWOp/lsS7wKUGqPuORc68XESr+YsiTUyffGmACLUigxTSluTbDVc?=
 =?us-ascii?Q?hYiAkDgXP5loMFyFbe+XAWw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2C55E64232F2394D86D35C3C795065FB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91644df-f1e9-4ead-a5f3-08db89e37540
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 12:10:22.0390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ra7iuPHKTDI3q80/IGDLNzDApGacfJtPI71hI0Jz1V5QiSYhhbBiXYw48JktdGzfrJq+ppztPcKenOAJnCdHDz6nvqMzX7isKsbIaNMvcTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7074
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

On Thursday, 20 July 2023 23:07:35 CEST Andi Shyti wrote:
> Commit af9e423a8aae =


You can't use this commit ID, it is invalid (the patch you are referring to =

belongs to your series, then is not available in any official repository, =

hence no stable commit ID yet).

> ("drm/i915/gt: Ensure memory quiesced before
> invalidation") has made sure that the memory is quiesced before
> invalidating the AUX CCS table. Do it for all the other engines
> and not just RCS.

Why do we need that now for other engines, while that former patch seemed t=
o =

suggest we didn't?

Thanks,
Janusz

> =

> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 36 ++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i=
915/gt/gen8_engine_cs.c
> index 202d6ff8b5264..b6dd22eb2d9b2 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -316,26 +316,40 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u=
32 mode)
>  int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  {
>  	intel_engine_mask_t aux_inv =3D 0;
> -	u32 cmd, *cs;
> +	u32 cmd_flush =3D 0;
> +	u32 cmd =3D 4;
> +	u32 *cs;
>  =

> -	cmd =3D 4;
> -	if (mode & EMIT_INVALIDATE) {
> +	if (mode & EMIT_INVALIDATE)
>  		cmd +=3D 2;
>  =

> -		if (HAS_AUX_CCS(rq->engine->i915) &&
> -		    (rq->engine->class =3D=3D VIDEO_DECODE_CLASS ||
> -		     rq->engine->class =3D=3D VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv =3D rq->engine->mask &
> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -			if (aux_inv)
> -				cmd +=3D 4;
> -		}
> +	if (HAS_AUX_CCS(rq->engine->i915))
> +		aux_inv =3D rq->engine->mask &
> +			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> +
> +	/*
> +	 * On Aux CCS platforms the invalidation of the Aux
> +	 * table requires quiescing memory traffic beforehand
> +	 */
> +	if (aux_inv) {
> +		cmd +=3D 4; /* for the AUX invalidation */
> +		cmd +=3D 2; /* for the engine quiescing */
> +
> +		cmd_flush =3D MI_FLUSH_DW;
> +
> +		if (rq->engine->class =3D=3D COPY_ENGINE_CLASS)
> +			cmd_flush |=3D MI_FLUSH_DW_CCS;
>  	}
>  =

>  	cs =3D intel_ring_begin(rq, cmd);
>  	if (IS_ERR(cs))
>  		return PTR_ERR(cs);
>  =

> +	if (cmd_flush) {
> +		*cs++ =3D cmd_flush;
> +		*cs++ =3D 0;
> +	}
> +
>  	if (mode & EMIT_INVALIDATE)
>  		*cs++ =3D preparser_disable(true);
>  =

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

