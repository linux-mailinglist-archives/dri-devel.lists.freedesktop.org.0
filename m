Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A985E98528D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 07:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E48010E789;
	Wed, 25 Sep 2024 05:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLLTZRVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDE210E2D2;
 Wed, 25 Sep 2024 05:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727242688; x=1758778688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VMNPki0zB6T8Uhe3IU433gtjJn5c0ZUroM/jla2I+No=;
 b=WLLTZRVu5u0klidhRaiI3rncD0ZcG0ZS7uxupjOgrAmf6cvzTtXTq+6v
 4bm477ar+z+JBfMiHq2Tf/Wtij+5Ip3HmqDfVnDj/dHaht47YtpqOkew1
 AUzA7gyAiLkHI1ZoEj17eOrxJmzezD29CH0zrVcOjPnRmlYtg7uhIFW2p
 RCXKtewe8EibokMWEmPm1KmysENWgbX4wwkWO5R4PUHPTD9xHwe06/1F7
 HD6cCtPcOY3OmyFXeN54XNmuihOaELAZzDSdJSPzO0o46UBgCqEKq/69m
 obEBRe96pElmyTtQ4zO/xlER6aHlJAwk1UQl2+h8idB0bDOy9/1UW2d/N w==;
X-CSE-ConnectionGUID: IOFt+xu+SM+qT6rQp1hBZw==
X-CSE-MsgGUID: n5vf6OXZToOHnH4nUdf78Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43790820"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="43790820"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 22:38:02 -0700
X-CSE-ConnectionGUID: TCAZC/3JSmOBhytTOWPu0g==
X-CSE-MsgGUID: t+V5X5hSQ9Oko+OG6RqENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="71802413"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 22:38:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 22:38:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 22:38:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 22:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcb8YXKylxjS962/btOmT6DSzkzxmrSuT49gToJ4tp6mwzZULIMLtRsNbQiEcDk8bQNfoxco6q8p9ymzcAfJDsuOJj3kc8BeGnD7+WW65YHSH1pwOJ11bPcwWxN4T5ons6vqKlw/SorwuuSqQRYjL7m6XHU6u+KKwXsBbYOg45QmUj0jQaSJBVvDGpGjOvlS3RaDvCpL0lINfDXoe/OQGo1TDMOb7T1AszxHKcvGdUTRNJdamlTWgJ5DtwvoBlzjBrQsdXWPc6JIvGvhf8BruGJfPNfaMeSYubmxVPMkhJek+FWXh8yXdLPa1w43e0E7ve50HimoY2W8ldnzmaWdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq+TMKDiiJKbuB1L/PoucezxGxjDH+xGGFf0EbiNQ1U=;
 b=FLOfWpRWki4ZGZVKOuF0GYP9QK4wgbmLovRASCUvcDJpJoXcxMOHvER0z+5aabmQ4qCbd7gh1lEc+D8/ohoLaSylgB40qwzge0MLOEd796qK5lSPj3rACWHyQ8DFG+k+hmo67s8jSQR4UW69I3zmtmcUBP5ulc/BrXSpQP06fTnVUgK9+4aLnD/v+NhTveVWjYCS8CmP8+bpeFTXN5E35um3z74tuTo+ePKIa2Zl+rSRLhSY2npwUHZm8vcVzcwGZlxpF2bISmE7Nn2ZylBwiGJOBK+xF57RAP94F+suEX8hLF2jLFnTSzCm1ljZXVZbzVP3UU8ClsPh0wIoKT+96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 05:37:57 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 05:37:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv3 5/6] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Topic: [PATCHv3 5/6] drm/i915/histogram: histogram delay counter doesnt
 reset
Thread-Index: AQHbCpmyF4xyi6wn5ky5uxh4QIKSM7JoBMNQ
Date: Wed, 25 Sep 2024 05:37:57 +0000
Message-ID: <SN7PR11MB6750B0C0673F1CA78AA9114FE3692@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-6-arun.r.murthy@intel.com>
In-Reply-To: <20240919133140.1372663-6-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB8468:EE_
x-ms-office365-filtering-correlation-id: 741e9e03-8476-493a-b27a-08dcdd243645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Nj41EJB/AGVey98+HKLLhBYFHOz1j3VoUK4rUnH2om22dDpUIElI6yIEV2EW?=
 =?us-ascii?Q?L73IIO4PVem/JaUvLtCKXORWhXMM0dLoVO+0J55tnzLG3v5RnbvvRL9R2vzM?=
 =?us-ascii?Q?7qTkHmfWQ2bVgMDdj/02lOrMVm9pzevgZ0VO6dY/sKM4Teg+caPG1OCQgWik?=
 =?us-ascii?Q?7FEVzvP6Il/g9Tsbxsf/vI32dJF4nBGF1qAkcL3/idghJBhdI8BKAwdH2XDP?=
 =?us-ascii?Q?ShoPblTJHy40f3mTghhBJ0YiviQhgLerdHLRAXT0eoDGSIUdNrVAwquxa9U+?=
 =?us-ascii?Q?xOXLbPvAW7r36HeNmOkaGJZXGUBCzCkdtfTjw9/J8G+Tai8VJsByPMXevQVU?=
 =?us-ascii?Q?uDZszNhcb05koitFvflejLRNtCD0vQFZe0D6jMXkNcEidcVSqfAwngKzQ0pn?=
 =?us-ascii?Q?Go4k5it1ge6+LyU+cQYpkQvaK7Jj7IOdEclEUyJlIFdBmNJMonkyJjFfw42i?=
 =?us-ascii?Q?0KRjReEAo70OZw5oF49XVukGxlFjSUXEqOWwlEX70nwjZ7jAFr+BOkQPzLq+?=
 =?us-ascii?Q?ao7ZL6cqZEVKnd9BZcBJzdhu6ZBgrqht7HFOtRB+TB5mfntpjnIL6aVX28Ig?=
 =?us-ascii?Q?86gc9eKyXWPB9nJiJFcv7eLz3kT5Bq8m8vbArYSeVOVW3NKsEFM5aaVg843o?=
 =?us-ascii?Q?eHk5IEXR9WaCfgv+dA+wOZCtTkQkk8IDg4U4I+SOibnSsEurA/QhMuuw8zgh?=
 =?us-ascii?Q?iqvVgbqE5NxGXLYkXZ7bowV4nQ4x4LCCps9ivU1IXbP6rdtfYM0VgER2K+Kz?=
 =?us-ascii?Q?duU9I89koPQ0AAIsd7eWeanEXzbccTbqrYQjLCVd9SAwr4N+038TYZ9wj1Vm?=
 =?us-ascii?Q?oYkWIx/TRnhH1yAXZw4iIWmr1eZgfr8WteRReu1jehUuqVfolcQHxWBfTidE?=
 =?us-ascii?Q?QpRMtkfASQ7Z44AQ6OhlOEmsbfkyRzOD0rtDPNCuOw1KFAlUHGSqjKrzYltq?=
 =?us-ascii?Q?pIoghTqWghTBgP6crf5ZWigaeorQ8ldkRZumXJFPx7lXFsPd1m520iyJhp2d?=
 =?us-ascii?Q?2pB3EVQhzm8439mwGsSxpD96BRAU/0Mh2zL0DNikW3LHQQQ7ZzOzqVk0AcIt?=
 =?us-ascii?Q?LHODQW9v9Zs+Q/HvcB8pGcIkqPDDrXsSXK1c5gV9ABveZfMtyXt2/yNvt8Zw?=
 =?us-ascii?Q?ft7CQDKajBmnAsZPoxIQh+7F490z6zsoxkehdY1SIklKfE2sSo2RriqCLdlW?=
 =?us-ascii?Q?zSvB0QOLKr6xG1pUllgiqLCEPzL7irqVivPmjg+49+mj+vKJLY29/qpdz57z?=
 =?us-ascii?Q?45Ulyazs53umW19gMDbhYVKnfn0pddE56VYfwPzy21WCHLJtseKuxP9HacHm?=
 =?us-ascii?Q?Y4CFWEBRWA1ZzhqrLwEKoVY4hgvFg++SIcciqRF8IkPi69JeQYW61C43b9nH?=
 =?us-ascii?Q?iK2kV5DxHt1P1DKNRzGi29KGfIaZYw3khLSNFcs8VBzfLiubSw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qm2pcO64GsBZJE0OT0Kqz54sPz600P0RCBDvqKfDVTqS0awBOVJClFK9nZjk?=
 =?us-ascii?Q?C/BdIb+UH8TLlzDLC4BzDDA+z3xJvmYoo/39EseL7b3K3w3glKDNBGm9boJy?=
 =?us-ascii?Q?uefxbyJbnUtxse9Ntm4EI0s9Ot+z2U+iYeKeuDuQH7yDmyioGePb/PDXoW6F?=
 =?us-ascii?Q?sLmJVGX3Av2WTLfY9dTElybH0v77PdA5b4kTKvPLPxek8X2/A19/VAMksDp9?=
 =?us-ascii?Q?nIbjB7JIlG1YMKDQn6zgQMnsxP6/nQJZGhyBv23+r+y3+il8lHIj7Dixsgr+?=
 =?us-ascii?Q?uTo4JyhdiF37p5j6epFCmmIHe3P2iZFhUzncU0bVFLVd++ZLNxdDqu33sVX7?=
 =?us-ascii?Q?Aaj1+PI67v8csGeUdXuyeaxaSoi7Zw7Unk+hdTr9rDfv1w0b7POfhw4SfAk7?=
 =?us-ascii?Q?uER2MORsJOJFssk36rrnNNQdRuupN7XX5614cH8GLkzfan+1EXisSafmMAYl?=
 =?us-ascii?Q?Alpnpj+FDTKmnGxDxKYnijAjQxgIAPvLHr9M+1maC3WqalmVfDo+6w2xaT90?=
 =?us-ascii?Q?C8PlLuMEwM/IkFqEk8eEo9BQLGa7f/ymYcxReQrwaElclikgFwEhtAIUeeHo?=
 =?us-ascii?Q?XsfXk7x4OTZEFwzmD5JBd2FnP8nYEaCdjghCpTudMoLqk5++Oia7Ygw1SS+R?=
 =?us-ascii?Q?CD6ZHqMtI/XybJIp0YpjAJVPobOSs2ZgomlvidLnGityIiWvRqQtI/k5/cbR?=
 =?us-ascii?Q?TjFpD+grm8CA7/64iwJey1D+jQwnPZphTpz65GDOCfyUuL1Pzi5SpNcsYQJT?=
 =?us-ascii?Q?Ensa/DRa2OOl62IC9Yo9yMNKO++GitBnmhy5HAOpA5O1pRKfne2yiTrdI7W6?=
 =?us-ascii?Q?EK1UgLvWzFBb7xlxyktnPnlASP0SV63dULH0+wBgd2BDZKgD3Gz27BxijKwP?=
 =?us-ascii?Q?FrDkmj6qyNqYG6MsMqM5kAoaESj9ggjSFisTIpXiU97ehqr3xIzKO19cRtzD?=
 =?us-ascii?Q?JXoAgHtfoPS/UTV4k9y5pm1KtBti/sey0nBq2Z4MQxd9iMgbrPtBAtsL4oOG?=
 =?us-ascii?Q?OBUXKN6jZJo3PlkqAB40tbWaI9OgLowrFpnCQHNXy4hYICSzPxBcqG3aiB0x?=
 =?us-ascii?Q?Ls11BlP1OxDVsN81mdjEYW/6dQHmJCstg+Gn/BiygVMb8XUPHgljt52Wd3jM?=
 =?us-ascii?Q?qs0JgW7Gaz8OFJ/twPhbEPVQ99KcobKg5vT+WnQ1dLvy2Wl8sSWnCC3pavEB?=
 =?us-ascii?Q?4dv+1X8kDoaiuMZDnaW4BO2ENLUsw8oBKTmv9Z/A5IbOIw1YYW1ZM4JI5DnH?=
 =?us-ascii?Q?AM/RPcf7BoKM4Y6qs0GATi/aiXOHpAZfF4tInig3D9cEuk8XT1H4llG8FOcR?=
 =?us-ascii?Q?XJBlNI8YR/L2U6sYjvYpVchfkp9+WhNkFA6s6yUuyNCYVwXou129hZO4PXFb?=
 =?us-ascii?Q?Wg9kcIn8pdqlC0n9O2j3jNKQatMXp778e7lRvw2Nr7/3hfn9XmXOY5adZzRK?=
 =?us-ascii?Q?KDHEJQJiig9cqrROOcFOnIQzeg5iwBfqcdzbjNKJMXT1GbLDngwT2mYziOvw?=
 =?us-ascii?Q?0qU4+jP4GP0DUdqWms/LO7silJB9VrzgjXYGGhh4RUthy0sC23tVOwZv0dw/?=
 =?us-ascii?Q?fKEG7y/mlSR9CjsTJlJV88FuO+mAGAxI5MczZ6kR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741e9e03-8476-493a-b27a-08dcdd243645
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 05:37:57.8809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNMZ4PrF2OXnWR8ZVlFiuHLzteT1gA6r9bmbEKHyUoyn0mgSCCo/69xwaHB0HuIOg21Qdu411GswGOZGVaJdAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ar=
un
> R Murthy
> Sent: Thursday, September 19, 2024 7:02 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv3 5/6] drm/i915/histogram: histogram delay counter doesnt
> reset
>=20
> The delay counter for histogram does not reset and as a result the
> histogram bin never gets updated. Workaround would be to use save and
> restore histogram register.
> HSD: 14014889975

Should be Wa:  14014889975

Regards,
Suraj Kandpal
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_histogram.c  | 17 +++++++++++++++++
> .../gpu/drm/i915/display/intel_histogram_reg.h  |  1 +
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index d1af64f2a6ac..6529a59ca6b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -74,6 +74,11 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	struct intel_display *display =3D to_intel_display(intel_crtc);
>  	char *histogram_event[] =3D {"HISTOGRAM=3D1", NULL};
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 13))
> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_RESTORE, 0);
> +
>  	/*
>  	 * TODO: PSR to be exited while reading the Histogram data
>  	 * Set DPST_CTL Bin Reg function select to TC @@ -94,6 +99,12 @@
> static void intel_histogram_handle_int_work(struct work_struct *work)
>  				"sending HISTOGRAM event failed\n");
>  	}
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 13))
> +		/* Write the value read from DPST_CTL to
> DPST_CTL.Interrupt Delay Counter(bit 23:16) */
> +		intel_de_write(display, DPST_CTL(intel_crtc->pipe),
> intel_de_read(display,
> +			       DPST_CTL(intel_crtc->pipe)) |
> DPST_CTL_RESTORE);
> +
>  	/* Enable histogram interrupt */
>  	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> DPST_GUARD_HIST_INT_EN,
>  		     DPST_GUARD_HIST_INT_EN);
> @@ -245,6 +256,12 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc, u32 *data)
>  		return -EINVAL;
>  	}
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 12, 13))
> +		/* Write the value read from DPST_CTL to
> DPST_CTL.Interrupt Delay Counter(bit 23:16) */
> +		intel_de_write(display, DPST_CTL(intel_crtc->pipe),
> intel_de_read(display,
> +			       DPST_CTL(intel_crtc->pipe)) |
> DPST_CTL_RESTORE);
> +
>  	/*
>  	 * Set DPST_CTL Bin Reg function select to IE
>  	 * Set DPST_CTL Bin Register Index to 0 diff --git
> a/drivers/gpu/drm/i915/display/intel_histogram_reg.h
> b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
> index ed8f22aa8e75..ac392ed47463 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_reg.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
> @@ -16,6 +16,7 @@
>  #define DPST_CTL_RESTORE				REG_BIT(28)
>  #define DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
>  #define DPST_CTL_HIST_MODE				REG_BIT(24)
> +#define DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT
> 	REG_GENMASK(23, 16)
>  #define DPST_CTL_ENHANCEMENT_MODE_MASK
> 	REG_GENMASK(14, 13)
>  #define DPST_CTL_EN_MULTIPLICATIVE
> 	REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
>  #define DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
> --
> 2.25.1

