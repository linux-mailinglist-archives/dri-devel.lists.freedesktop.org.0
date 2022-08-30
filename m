Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D85A711A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 00:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFD910E301;
	Tue, 30 Aug 2022 22:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5210610E301;
 Tue, 30 Aug 2022 22:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661899787; x=1693435787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gNvSPxS64ix+khqwhF9szP0KfH0GQW7SP/0ObDRw7QI=;
 b=RaAz6ZeB5keR1KdXiiYM3LuOaWiJun99vqLus2WIWgu+i3JJMULTX31A
 GHjrhqwm02OyWCG5AoahZbbDeHfjDrF6aCsXWF1bDZ/npkVM4TZAfQX5F
 54sYNdKWXyQ1nhd6yICX1s+Eixw2fcJBIkihQRa8tamHVmDnHcO33TfUv
 ADpQaXuW2AZGnQJ79UTsY/VOKOfP5uYCej/VpyCmSRJnJ0Xv318DuZK1l
 TI6ksNMMY1rHDU8jyIVrUwFODk2lhRkjB/928o8XpMq9jAdcpH+3SsQWg
 vLU2fdSHE7eF/D0lXG3fPPJsdezpNi/o30pwyf/E8hRxs9UlppSRPrYYO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="294064512"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="294064512"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 15:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="562837758"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 15:49:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 15:49:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 15:49:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 15:49:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 15:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StL/kAvUMA2KnfoyY1/iVGtt6XzyTKGFREbRIAeWCrxmDTld/ULs9yvZ6eUyrjp0awKNGugKKfw2rdrbXOJlTY60/FwaAAotqXiO9c7yiflmj587Z8m1d64YtDouV/WSRoiutwJn4nAQ75s8s8hHyVVeJDMcJ/s3z405mdoR5Z8Z7PPhsaVyIabxFLHt5r0d7Ft0WEpoyS6RoqSq+s514lcmZLCUf8LZjoIDfrswTyP8ZhdHrFntleN+X0B473WA6R9wVAPw+Nvp21mLqVDUZo1DnXypBPspG0SAXIXHKj59hg+UhsFeK8XNebWz7sQt68s803W9V0ECjgCi3yt+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbXfjuAsTJ7QwPoQPSjhMxNk5MNAw9NgSUSUIWWxpN4=;
 b=Rgy/HTwAS2BrrS1CG2Fwl7n1n++LmdRVGbiv4NoGmdkTGjkB6vm2EVJywdhXjORsqowrvXJZiZQx9hZ9o800+Qf2LGeuiw/ocPEgpTLP5dpKNOJqL+nAV1/guM6rLGOyw+sJd2zwDqmeJj3Lyd1iFAbB+M2EAXum+Eob+GiUmEUnyHGaXORM8cIl+H2VBpzaMO4pEUuNe9vR1cy/Qvu8r+DBZ4hj/FB7xJUHh+zOrUtz6gPa9nlsDVOeNa7yGgxJHEL+QLkznljxjYFMEDrL2dB53DOxBgU7eYFouJ7vBp8UW06n9JkWuTPqXNsQr+Q4GuI4EzTNYqCQDuTESOjV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 BY5PR11MB4117.namprd11.prod.outlook.com (2603:10b6:a03:18a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 22:49:42 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%6]) with mapi id 15.20.5588.010; Tue, 30 Aug 2022
 22:49:41 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/8] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend,resume}
Thread-Topic: [PATCH 1/8] drm/i915: Move locking and unclaimed check into
 mmio_debug_{suspend,resume}
Thread-Index: AQHYu8kuwBfnY1i3REGIGwUuTtgKk63IDbQQ
Date: Tue, 30 Aug 2022 22:49:41 +0000
Message-ID: <DM4PR11MB59718C51A4AD28437C4680F187799@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-2-matthew.d.roper@intel.com>
In-Reply-To: <20220829170238.969875-2-matthew.d.roper@intel.com>
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
x-ms-office365-filtering-correlation-id: bfb5f62d-7939-4b74-5b7b-08da8ad9ed3c
x-ms-traffictypediagnostic: BY5PR11MB4117:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: InbO5liI2nLZV95eYYqo/GSqxMHHgRG55FGHSi3LhKuaxACMRMYPDQ/DAaIOZcJmxpLTindCN46a5fThxFN2M86S9Q8gbVM3seUJY7P9/PGACfcd3+MS5jKfy7VDUADms5LfMWw1653R2rGN9wLyNfOqAp2zdCUY6it6mW1wrO+tRX2APQ8ltupIepQGXYrE3jDigbOg9yR4s8MIaxEVK4Hq2I4aV2e+AASoc+J30buINExBHWE2mBL464AgRHMlwe/FF4ZjxtUjByGNNTNssWDTlboIdOLsyVBgTUEBToj5uL8KOBY8dO4qD04e2JJnm8upDcyC054WTwIvG7mAOccmix49QN7FZboWREJVJdvnNjKaORqOnBKAf3HSXIE/z2Ry809NU+H/+ApnNMVdVtTBCMGw1rYBbgpLMWy9z34vqErzUJbOKn5Nt2AQUwQuSvSuh0rPX4BckIefS7b1BhLnyfnCMTTnDvRvokSt6CAYR9gMfWkF0EVXnEvrPfWPy0vq/nNainoxAuteVzXLX06WR161Br1CTUVWo3YRiiact3EF2g6PBk8ixi6AxpOKmMfBtsvjbxhWMdif5s0gxqrryznuSOxJnb/Leb6XK4M1BjSfeOBnsgVCBrNOCLrXVW1TvwQ4nJLtHtcrsceV0dBvrK631g2woxlgMCu4eZ7ryNeVHD34bvEF3yu6LI1PczsacFNPiAzvyg7L9O4sS00SUNmw3GC9etq7PejMHrGTS2lDbRK8vmER43XUWTk1zLlDB25T43CY/MwAKxyvpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(39860400002)(376002)(136003)(66476007)(122000001)(55016003)(38070700005)(86362001)(82960400001)(5660300002)(66446008)(66556008)(4326008)(8676002)(64756008)(478600001)(38100700002)(41300700001)(8936002)(66946007)(76116006)(110136005)(52536014)(316002)(450100002)(186003)(26005)(71200400001)(83380400001)(7696005)(53546011)(15650500001)(33656002)(2906002)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?29jfNMuWDXjxshwBJKQC8ZhA0DcnNpdD1gx7CLRa3hYaN9nm/NRu0uRRJQ4I?=
 =?us-ascii?Q?IOg1xErtYv9M5NdsxnMvnwV29PREzEozPeXuzCpLb0PCCAFLS9xV4Gu9/nWJ?=
 =?us-ascii?Q?2WTavm9Rw7B+2oXKD5jNw5ErxDLVTMwPgDXkMaqMsAmw+b5l4vyuV0NWCRq4?=
 =?us-ascii?Q?Mt1zGMf88R17S0LugBILltF9LnRzGrvU3TuiUhgfIrY5PZKSyQNaPir8Q2az?=
 =?us-ascii?Q?LKtOj7e2TMD8isPkZ9TWS5X8Y3nDk8Y3gkpzlVbXeoiJDcSwbV9o+aIRHFZm?=
 =?us-ascii?Q?QGQNOlUqL1bSTXRgXBcW9fUZZdKEeuR+7qQz2CCX/ihQvDwfd/9ejg0Oam5U?=
 =?us-ascii?Q?h1+zJkphuJq4pf/H41Kn2X9JV71OTBiUT1RuIg2Rcez+Z5dtxKWbuvGNrluK?=
 =?us-ascii?Q?mFn+xafGmsawFkweL7+hsaOfjvYsJ2GtB5KdmujdIa9MavuxY0l7Ly+kZsdT?=
 =?us-ascii?Q?rzjICtt0uqq/xxMbgK2/zmF7nqdfvSlj560BJAtmnUSf6VshgRnO8dOtmCs/?=
 =?us-ascii?Q?YBqyDtvSs6BKQ0oe2tgLIWuaNx5V0fWoAPuC/O6cnEUGZA3CBsWjCs0iErrD?=
 =?us-ascii?Q?KhnSoGnokrd3GkR90cXDSa/r2I+klvaJxA5fh3AaxJG6TyGp1BheYiRyWIRs?=
 =?us-ascii?Q?ryuOXmDFLLMidWsYWZrPNxhKNkZ0HoDHd6GN3XWm7NEgTpjcTOLXTg/Z1P/4?=
 =?us-ascii?Q?iPYF5gMzQyn+VAGtT3Sc85eEzSCDh3R4iN0yXEJDH+yngWg7sBJ+udb9n9/r?=
 =?us-ascii?Q?FRXUSOY7SJjihlLLEiVZ0h2TdWQJuljfOhyG5oTQ6ijYYOt6kjEiE2w+miDg?=
 =?us-ascii?Q?mTmFDqRCMek2liHM2JqB4SCzDbLYxPbc21ouLlr281LDA2FVpuzWGUNGMzUl?=
 =?us-ascii?Q?ihsJZjbY1itGY+AlhuP5YkwxPkgbHb9l9Tme52VlYOK5p9mHfyw3Lq69hYEN?=
 =?us-ascii?Q?C6ndJ0d292RXYvoQANN+1DAF3rIBy2Z7OYY+baz1F3drdVQsrJveZZ3EFhME?=
 =?us-ascii?Q?TkDbfGqrm9S5Z6djgt74pbOWx/AJhr7RqlL3gGhsgl9j/R9b33gZi1TzqEmV?=
 =?us-ascii?Q?UkA0EUCUjmPPLS1doi39ynO9zkXSL4GgRajsqNi8xOuSiElTae+vh6SjJuAQ?=
 =?us-ascii?Q?juLkEra5l7FamYbDVd+aG07UJT/FxuNcFZQJEQEkR+e8jj64oL6UgSnL0UeG?=
 =?us-ascii?Q?YOj8iCKviT3P/8dnyojCqYbFyE5qFRy6vpByVYAKZRJzyM/u4fWBKwM2+9mN?=
 =?us-ascii?Q?/gKFvJ9STXnbU9uqIle7cO+i0FmKDQvAj9OvrUxFRKtQPl6g+MjnuNIPvltc?=
 =?us-ascii?Q?uKyKf1x7kfamzgGcEKu8LhF8xUO+uqhG9ArdZjXVnRZg/bk3G1US6W2NcAT0?=
 =?us-ascii?Q?9N/yAf41dRexlZOYkDS6yw5cu66iW15r27pXeSYgjNyYXgo75U/a2oic1/Eh?=
 =?us-ascii?Q?WXfv+AS/KzsToMzG3PZzGGY8X/9vengsYJ/Xm7acJ7Q8MMGY/dNW9ZCelXA9?=
 =?us-ascii?Q?PGrexBaT4kPK/yl9o8WCOZ8nIRGYk0Pfb1jS6kO6ZB8XBy3fAY4h5zSTJLkW?=
 =?us-ascii?Q?i5kiteSGK7fhyE12DWLlmWXUIwE5oFisZ+b67wK9VKvSK6arirvs6ywy3lw0?=
 =?us-ascii?Q?mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb5f62d-7939-4b74-5b7b-08da8ad9ed3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 22:49:41.8726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hCXnzgHckGFiawV8azI67XXklUA9TR6PA+gQnDsaaWieRzuzZwFFMuuig1gXSmQCbKvvWTwMKL7jeceiqDhto9zcVXsQdDnP4162Sj53V+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4117
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Monday, August 29, 2022 10:03 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 1/8] drm/i915: Move locking and unclaimed check into
> mmio_debug_{suspend,resume}
>=20
> Moving the locking for MMIO debug (and the final check for unclaimed
> accesses when resuming debug after a userspace-initiated forcewake) will
> make it simpler to completely skip MMIO debug handling on uncores that
> don't support it in future patches.
>=20
LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 41 +++++++++++++++--------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c
> b/drivers/gpu/drm/i915/intel_uncore.c
> index 9b81b2543ce2..e717ea55484a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -50,23 +50,33 @@ intel_uncore_mmio_debug_init_early(struct
> intel_uncore_mmio_debug *mmio_debug)
>  	mmio_debug->unclaimed_mmio_check =3D 1;
>  }
>=20
> -static void mmio_debug_suspend(struct intel_uncore_mmio_debug
> *mmio_debug)
> +static void mmio_debug_suspend(struct intel_uncore *uncore)
>  {
> -	lockdep_assert_held(&mmio_debug->lock);
> +	spin_lock(&uncore->debug->lock);
>=20
>  	/* Save and disable mmio debugging for the user bypass */
> -	if (!mmio_debug->suspend_count++) {
> -		mmio_debug->saved_mmio_check =3D mmio_debug-
> >unclaimed_mmio_check;
> -		mmio_debug->unclaimed_mmio_check =3D 0;
> +	if (!uncore->debug->suspend_count++) {
> +		uncore->debug->saved_mmio_check =3D uncore->debug-
> >unclaimed_mmio_check;
> +		uncore->debug->unclaimed_mmio_check =3D 0;
>  	}
> +
> +	spin_unlock(&uncore->debug->lock);
>  }
>=20
> -static void mmio_debug_resume(struct intel_uncore_mmio_debug
> *mmio_debug)
> +static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
> +
> +static void mmio_debug_resume(struct intel_uncore *uncore)
>  {
> -	lockdep_assert_held(&mmio_debug->lock);
> +	spin_lock(&uncore->debug->lock);
> +
> +	if (!--uncore->debug->suspend_count)
> +		uncore->debug->unclaimed_mmio_check =3D uncore->debug-
> >saved_mmio_check;
>=20
> -	if (!--mmio_debug->suspend_count)
> -		mmio_debug->unclaimed_mmio_check =3D mmio_debug-
> >saved_mmio_check;
> +	if (check_for_unclaimed_mmio(uncore))
> +		drm_info(&uncore->i915->drm,
> +			 "Invalid mmio detected during user access\n");
> +
> +	spin_unlock(&uncore->debug->lock);
>  }
>=20
>  static const char * const forcewake_domain_names[] =3D {
> @@ -677,9 +687,7 @@ void intel_uncore_forcewake_user_get(struct
> intel_uncore *uncore)
>  	spin_lock_irq(&uncore->lock);
>  	if (!uncore->user_forcewake_count++) {
>  		intel_uncore_forcewake_get__locked(uncore,
> FORCEWAKE_ALL);
> -		spin_lock(&uncore->debug->lock);
> -		mmio_debug_suspend(uncore->debug);
> -		spin_unlock(&uncore->debug->lock);
> +		mmio_debug_suspend(uncore);
>  	}
>  	spin_unlock_irq(&uncore->lock);
>  }
> @@ -695,14 +703,7 @@ void intel_uncore_forcewake_user_put(struct
> intel_uncore *uncore)
>  {
>  	spin_lock_irq(&uncore->lock);
>  	if (!--uncore->user_forcewake_count) {
> -		spin_lock(&uncore->debug->lock);
> -		mmio_debug_resume(uncore->debug);
> -
> -		if (check_for_unclaimed_mmio(uncore))
> -			drm_info(&uncore->i915->drm,
> -				 "Invalid mmio detected during user access\n");
> -		spin_unlock(&uncore->debug->lock);
> -
> +		mmio_debug_resume(uncore);
>  		intel_uncore_forcewake_put__locked(uncore,
> FORCEWAKE_ALL);
>  	}
>  	spin_unlock_irq(&uncore->lock);
> --
> 2.37.2

