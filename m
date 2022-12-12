Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D93649AD9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973C610E17B;
	Mon, 12 Dec 2022 09:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD7810E17A;
 Mon, 12 Dec 2022 09:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670836476; x=1702372476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JKN2jCLADqBQSD1+4i4fPRpaT1ht2jf+Uk4+HqI6ZzI=;
 b=AfhBZLpL7tJG/iQOgBmBRIsnXleDf4Xys+nns3A1TkizyPmc9dfaIo2T
 3LiqlOMOy3U32LVsgS560V9GwcDkbLZtqPss5eJjIXvzK0jzkA6nwyJ5x
 Q9VwvqBaKu4utSHWSHId6kGveBxH8lSkQBUs6/ey2Kjre2IPpygzwSBIN
 4GhRXI5evPuEIFwb6R4IM3OBl9vI+Ysm7ZSre+iulRyRPC0gB+JS7ZtEB
 AqHekkXFMujgEcMneJQREhMTGu5Wl+EjjovzI3HlJD7LYiEdJS0dww78S
 f7cnbfzp+MeWXjs0yFV/zxwC4vAKoRUjRCVa7g9xTDY3RjU75/235dB/1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="316500369"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; d="scan'208";a="316500369"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 01:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="598389970"
X-IronPort-AV: E=Sophos;i="5.96,237,1665471600"; d="scan'208";a="598389970"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 12 Dec 2022 01:14:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 01:14:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 01:14:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 01:14:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 12 Dec 2022 01:14:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4YPX/zgoh0No8f6+cr7kRJ61Mxeop8WIC40RvEXe/pTChLZNx0hy/g1Ot3cbmZN4n8BVnNd3Mgrujth6Ja7nW1dBfVOuZIxeoqc54I59Pko/z2llykrb8Xz5RhLD9aVHZFGrlFU0bBOdViLh7zMResM2yRO7PS9mUKMNewlKkjsOS4fF2nOuE9OShrG02UGJY0DQvkFGLrcPJzIPekb7Ht/SRWSRRiVBJ12yIufnh5UTsD8ouOuhZwvoaDRcEtFXJkomuKpUXH0ZBVeDFBAC9u+1uIEFvGXvJ5ryjUnfcs8arAxICAIfOjazc6RYhgVWbrTnqkFV7rpu28AVGtFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/Hz1tYafz00F8uRaZYSjD8W3atYwU8+tS671TZqGCs=;
 b=QwTPiJwi/yCpvi+UwYh8dZKgY25E/szwnIqEVI38SfmTC35fDLZCqmTnQk5f0fkNxO4IQhKHlRTgiCXIR0m3j1o2gTpBlhmqo/ZhrpUfCkadVENZFdbvN5ZB2VbQmAb8UHdQwMYMvKF2SN2qrcrB4mOIpz6VCFnOLSJ3sSP0dzn63bmHZ0oZkN8fn/PWKdzwj6zPgPccZ0kFyOgloD1boeBJEJa9TK6Zb6a0kY40/uRmEeWLFfxouFbLhYU3YDRZu0N7OTerE5tHT+3w3m6YaINSeV7lDb2d4FmVZ5Hgp5IZi4sElhfFjspCfSgy0AOwEu0Qp+Q7e5FsICya/1lH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 09:14:25 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::4e35:9914:650b:269a]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::4e35:9914:650b:269a%8]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 09:14:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 3/5] drm/i915/gt: kill fetch_and_zero usage
Thread-Topic: [Intel-gfx] [PATCH 3/5] drm/i915/gt: kill fetch_and_zero usage
Thread-Index: AQHZC+X4wBrGZ4MKDEiT15gSBr11Da5p/DTg
Date: Mon, 12 Dec 2022 09:14:25 +0000
Message-ID: <SJ1PR11MB6204758F6EDFF3BE8101565081E29@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <20221209154843.4162814-3-andrzej.hajda@intel.com>
In-Reply-To: <20221209154843.4162814-3-andrzej.hajda@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ1PR11MB6084:EE_
x-ms-office365-filtering-correlation-id: f4daca2b-e12f-49cf-2b26-08dadc214389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O2hYyR/+GcL6ozWBoS4lsYLzwqijHle2jumHb7KRqjYDzMIbxERyT0s09XjLS3zTRcPWGm2GEdh/QzdvI0WbDGM8p58QnM5oLyvb5OVLKDJxo6Rwz9I+NT0AHDXlyBcsW+6oyvYYUWq6W0jQFSZZy15Cd2bQVHe1WDiCUZldTsyplHANQh7wnGiE0ZMmQ4dFWtttVolDokGiwxMKxoHfKc7nM/3e9E3ncx2sw/GnjmgwILGRHglDNNjJNXQrPSNa7eH6euxRW0sJu9ABLqr1p0lLUIAf+lpV+RBFWHkvy2rJ+eCy9tTblvsQEzJwclPYBciinXx/Pt4+5Zrdop1a+5/8y2KAK2W+CRl9aMbR/HXEMimmO0d9W5AHe3vF6k7rAJ+7jCgo0eGCPq0VbY0JJcCyZ9NFwTYyvwhlfaxMwGo4iE5PLd3QFp38WHckUUiIk160cBtUjSWttxbu1/nRSp1XJAEfhxX2BjrsEAr8P0upVOhfhSE5zBNOf+lXvfYqBgYaD2PXCoEo36/F6Yh6/naA798BxdNBPWOqmXaHFeffPpXFnsSXjNsNlLH201Mrsx5Rde/JPaf71jsDBrE/BbyUTkH/jQ/fWZa68wyhrH8sbvDnymBjQab1INQaHvAqGds3XEOh/KwdkMVp/SQCFFbpCB/0ZPVDQoLP6kecMi/fashUZ3ENsaTs632tVOa5jUnl0cc6/0drJiM6zsnWnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199015)(86362001)(7696005)(33656002)(2906002)(53546011)(6506007)(30864003)(41300700001)(122000001)(54906003)(4326008)(83380400001)(66446008)(66556008)(316002)(76116006)(66946007)(110136005)(8676002)(66476007)(64756008)(38070700005)(186003)(55016003)(82960400001)(9686003)(26005)(52536014)(8936002)(5660300002)(38100700002)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HspCJNzEvl7IWORIFL2GZutOPPZMpcPM5OUkPpv0f14qzaEV/2QnP84bjyY4?=
 =?us-ascii?Q?jddK7GkWITdkto0j+4yVAOCpqvZad/KOEYDDa7JB7/xnreVebpqPaUteYGQ3?=
 =?us-ascii?Q?Z44mZGf4/CFeDkcboXWKRgXtDdKjTGEolafnXBsrsZZwPpQI8RTQa7srnRRc?=
 =?us-ascii?Q?TKwo3qVpXK/duWTVrFa3VJdF9d4vAgo4OAIwCcaFDrjpzHjKixKMDYDjokBF?=
 =?us-ascii?Q?cvFtOH9tS6KsbvoK3utDZMmLd4GZUt0wfk6ux1Pqrk/dwNVh83omgSTzW4pK?=
 =?us-ascii?Q?gelA1uk6BXofo9CPPP1tov1m2cWAEUw0KX1DuQVLjvJK1CCwJoW3rv9rkMB+?=
 =?us-ascii?Q?BIRw9siJMEB1kxos58Lp/baASvE0NtueyxY5nNLOSGDf5D/Kk9ufPicc6iHH?=
 =?us-ascii?Q?kac+NA67IvAooHQWzCQpwy4K1z1qFiuVQxhrEuMSXPOe3VIbGZhBPvOZ1hLx?=
 =?us-ascii?Q?rcwlMk7zKejhWKoOYmHsDT5YLgqrgLzH6FBrHnwGwj50YoqEWeHLI5P6yH8j?=
 =?us-ascii?Q?eQOsxYvV6B2SYUwj+9F1EKCXOcnjTYwlJSKNMhHq2QL2d+TZhtGRdo+s0mZz?=
 =?us-ascii?Q?uzgJfw4NCgMR63EjJk7SmJQu7ISnSz3BCBQWO6A5/i4q3C1+LqNAmBaDu6qV?=
 =?us-ascii?Q?DZSLIlAd/cAHkjqPFXrdRM5p3SVgesPPbXH8XiB+jkLAhaK1LzfzTTVpDj/C?=
 =?us-ascii?Q?u/bWVdZVU3xfX3FPBq22rwh3o6ghMQ5Cen047Dcy2gEgypBf1BRQKoa8U4Al?=
 =?us-ascii?Q?qnheIMvmej1KCd8eGd3xATzBE1ia7o1IdkCNxQm7q3ssd7HBwp25N3DTrTMQ?=
 =?us-ascii?Q?Jza5PvR/rguEp4YXQxTk7LBos70JSI3W5xWKdr/BoTEiXmPUJ98JjCLoXRh7?=
 =?us-ascii?Q?iT3lIewQzKAjNOr2bXgX+jMg5U38eVsG55ufe1rjOfNGN1YXYQSbbpn13hl9?=
 =?us-ascii?Q?RMpGrlvAoI6tBbQWMFEqJsaIkb51cGYOv7pOnFDg2Dt8DFaWgxDHjBXKsv6N?=
 =?us-ascii?Q?iP3iWKbc875X+Fm6/l4g/0hpfB3m8UhiQw2U8GFEOJfBHN0ZuJ/4acB3E7Vj?=
 =?us-ascii?Q?hF97q+cICTpaK0qKzZF9haWVmruFySqkAfFENbXEkp8Flr2U83vBQMztWZ0k?=
 =?us-ascii?Q?XvQwqc2pa7IyOi8A+ZfLRYfzcjsaoWIymqCUkA+dUzMUHyQgyjkh+SdY42J5?=
 =?us-ascii?Q?4VDGiDHIPixHoKZP1gqdsf0k6kt4rgvXWcH8UvLAyLV3VBcoOFD59q5CzciA?=
 =?us-ascii?Q?sObImiQXCRswPMN7/4cUX/ztkZfCZajcpAPO9EsjgvrF1nt/FjMOtriXRhZ8?=
 =?us-ascii?Q?5sGbdMFvhwtS8J07BitS9S2Yj+lQpf9BJZiaMAZQPCCHmB/Ew/187FRGymIT?=
 =?us-ascii?Q?MPf15nu3osAWhOJXWRJLyvwnojrkWE5XdP3kJMw01cjhxS+mX0JE+YgxV2ZV?=
 =?us-ascii?Q?BsQWknM5Ld79vUcRUoAZaXyj7N1FCW/UqfAZWGLhjX5VVE+SEqrCKtqKeG4p?=
 =?us-ascii?Q?PIsoScXuAB5Qej0owMpl2DmppCOKiWMVjjg1AWpHRmqox2F01kRH6xVNLj6o?=
 =?us-ascii?Q?zpFpUILkMhJv2voFmB1Sm+GRx8kt5j/PlseQ/gY4x0HQi5vm5Noa/P/qam3f?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4daca2b-e12f-49cf-2b26-08dadc214389
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 09:14:25.1284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8dSDbfuoqF1QkE4sM3Ag4nscPcMvHXi/s4mSUQceTxE/PUWbtuU8KrcEGL74RAI7OKsY2WK1395Jj1XSvtmhY9/qgCC17eCcD66OPZb/Rs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Andrzej Hajda
> Sent: Friday, December 9, 2022 9:19 PM
> To: linux-kernel@vger.kernel.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Hajda, Andrzej <andrzej.hajda@intel.com>; Arnd Bergmann
> <arnd@arndb.de>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Andrew Morton
> <akpm@linux-foundation.org>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>
> Subject: [Intel-gfx] [PATCH 3/5] drm/i915/gt: kill fetch_and_zero usage
>=20
> Better use recently introduced kernel core helper.
>=20
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 2 +-
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c     | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_ggtt.c                 | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_gsc.c                  | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c                   | 4 ++--
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c                | 2 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.c                  | 6 +++---
>  drivers/gpu/drm/i915/gt/intel_migrate.c              | 2 +-
>  drivers/gpu/drm/i915/gt/intel_rc6.c                  | 2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c                  | 2 +-
>  drivers/gpu/drm/i915/gt/selftest_context.c           | 2 +-
>  drivers/gpu/drm/i915/gt/selftest_ring_submission.c   | 2 +-
>  drivers/gpu/drm/i915/gt/selftest_timeline.c          | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c                | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             | 2 +-
>  16 files changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index c33e0d72d6702b..de318d96d52abd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1024,7 +1024,7 @@ static void cleanup_status_page(struct
> intel_engine_cs *engine)
>  	/* Prevent writes into HWSP after returning the page to the system */
>  	intel_engine_set_hwsp_writemask(engine, ~0u);
>=20
> -	vma =3D fetch_and_zero(&engine->status_page.vma);
> +	vma =3D exchange(&engine->status_page.vma, NULL);
>  	if (!vma)
>  		return;
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 9a527e1f5be655..6029fafaaa674f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -229,7 +229,7 @@ static void heartbeat(struct work_struct *wrk)
>  	mutex_unlock(&ce->timeline->mutex);
>  out:
>  	if (!engine->i915->params.enable_hangcheck ||
> !next_heartbeat(engine))
> -		i915_request_put(fetch_and_zero(&engine-
> >heartbeat.systole));
> +		i915_request_put(exchange(&engine->heartbeat.systole, 0));
>  	intel_engine_pm_put(engine);
>  }
>=20
> @@ -244,7 +244,7 @@ void intel_engine_unpark_heartbeat(struct
> intel_engine_cs *engine)  void intel_engine_park_heartbeat(struct
> intel_engine_cs *engine)  {
>  	if (cancel_delayed_work(&engine->heartbeat.work))
> -		i915_request_put(fetch_and_zero(&engine-
> >heartbeat.systole));
> +		i915_request_put(exchange(&engine->heartbeat.systole, 0));
>  }
>=20
>  void intel_gt_unpark_heartbeats(struct intel_gt *gt) diff --git
> a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 49a8f10d76c77b..29e78078d55a8b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3197,7 +3197,7 @@ static void execlists_reset_cancel(struct
> intel_engine_cs *engine)
>  		RB_CLEAR_NODE(rb);
>=20
>  		spin_lock(&ve->base.sched_engine->lock);
> -		rq =3D fetch_and_zero(&ve->request);
> +		rq =3D exchange(&ve->request, NULL);
>  		if (rq) {
>  			if (i915_request_mark_eio(rq)) {
>  				rq->engine =3D engine;
> @@ -3602,7 +3602,7 @@ static void rcu_virtual_context_destroy(struct
> work_struct *wrk)
>=20
>  		spin_lock_irq(&ve->base.sched_engine->lock);
>=20
> -		old =3D fetch_and_zero(&ve->request);
> +		old =3D exchange(&ve->request, NULL);
>  		if (old) {
>  			GEM_BUG_ON(!__i915_request_is_complete(old));
>  			__i915_request_submit(old);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 0c7fe360f87331..2eb0173c6e968c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -684,7 +684,7 @@ static void fini_aliasing_ppgtt(struct i915_ggtt *ggt=
t)  {
>  	struct i915_ppgtt *ppgtt;
>=20
> -	ppgtt =3D fetch_and_zero(&ggtt->alias);
> +	ppgtt =3D exchange(&ggtt->alias, NULL);
>  	if (!ppgtt)
>  		return;
>=20
> @@ -1238,7 +1238,7 @@ bool i915_ggtt_resume_vm(struct
> i915_address_space *vm)
>  				   was_bound);
>=20
>  		if (obj) { /* only used during resume =3D> exclusive access */
> -			write_domain_objs |=3D fetch_and_zero(&obj-
> >write_domain);
> +			write_domain_objs |=3D exchange(&obj-
> >write_domain, 0);
>  			obj->read_domains |=3D I915_GEM_DOMAIN_GTT;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c
> b/drivers/gpu/drm/i915/gt/intel_gsc.c
> index bcc3605158dbde..7226b42bb70b2a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
> @@ -70,7 +70,7 @@ gsc_ext_om_alloc(struct intel_gsc *gsc, struct
> intel_gsc_intf *intf, size_t size
>=20
>  static void gsc_ext_om_destroy(struct intel_gsc_intf *intf)  {
> -	struct drm_i915_gem_object *obj =3D fetch_and_zero(&intf->gem_obj);
> +	struct drm_i915_gem_object *obj =3D exchange(&intf->gem_obj, NULL);
>=20
>  	if (!obj)
>  		return;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 4e7af9bc73ad05..a277bd47db813e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -757,7 +757,7 @@ int intel_gt_init(struct intel_gt *gt)
>  	intel_uc_fini(&gt->uc);
>  err_engines:
>  	intel_engines_release(gt);
> -	i915_vm_put(fetch_and_zero(&gt->vm));
> +	i915_vm_put(exchange(&gt->vm, 0));
>  err_pm:
>  	intel_gt_pm_fini(gt);
>  	intel_gt_fini_scratch(gt);
> @@ -806,7 +806,7 @@ void intel_gt_driver_release(struct intel_gt *gt)  {
>  	struct i915_address_space *vm;
>=20
> -	vm =3D fetch_and_zero(&gt->vm);
> +	vm =3D exchange(&gt->vm, NULL);
>  	if (vm) /* FIXME being called twice on error paths :( */
>  		i915_vm_put(vm);
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 16db85fab0b19b..f066936994a9e2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -123,7 +123,7 @@ static int __gt_unpark(struct intel_wakeref *wf)
> static int __gt_park(struct intel_wakeref *wf)  {
>  	struct intel_gt *gt =3D container_of(wf, typeof(*gt), wakeref);
> -	intel_wakeref_t wakeref =3D fetch_and_zero(&gt->awake);
> +	intel_wakeref_t wakeref =3D exchange(&gt->awake, 0);
>  	struct drm_i915_private *i915 =3D gt->i915;
>=20
>  	GT_TRACE(gt, "\n");
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c
> b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7771a19008c604..9a2bfb6d14196c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1144,7 +1144,7 @@ __lrc_alloc_state(struct intel_context *ce, struct
> intel_engine_cs *engine)  static struct intel_timeline *  pinned_timeline=
(struct
> intel_context *ce, struct intel_engine_cs *engine)  {
> -	struct intel_timeline *tl =3D fetch_and_zero(&ce->timeline);
> +	struct intel_timeline *tl =3D exchange(&ce->timeline, NULL);
>=20
>  	return intel_timeline_create_from_engine(engine,
> page_unmask_bits(tl));  } @@ -1261,8 +1261,8 @@ void lrc_fini(struct
> intel_context *ce)
>  	if (!ce->state)
>  		return;
>=20
> -	intel_ring_put(fetch_and_zero(&ce->ring));
> -	i915_vma_put(fetch_and_zero(&ce->state));
> +	intel_ring_put(exchange(&ce->ring, 0));
> +	i915_vma_put(exchange(&ce->state, 0));
>  }
>=20
>  void lrc_destroy(struct kref *kref)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index b405a04135ca21..2c076a51b66b30 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -1116,7 +1116,7 @@ void intel_migrate_fini(struct intel_migrate *m)  {
>  	struct intel_context *ce;
>=20
> -	ce =3D fetch_and_zero(&m->context);
> +	ce =3D exchange(&m->context, NULL);
>  	if (!ce)
>  		return;
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c
> b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 2ee4051e4d9613..2451ebddb0f982 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -702,7 +702,7 @@ void intel_rc6_fini(struct intel_rc6 *rc6)
>=20
>  	intel_rc6_disable(rc6);
>=20
> -	pctx =3D fetch_and_zero(&rc6->pctx);
> +	pctx =3D exchange(&rc6->pctx, NULL);
>  	if (pctx)
>  		i915_gem_object_put(pctx);
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c
> b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 9ad3bc7201cbaa..a102d8768e1d7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1831,7 +1831,7 @@ static void rps_work(struct work_struct *work)
>  	u32 pm_iir =3D 0;
>=20
>  	spin_lock_irq(gt->irq_lock);
> -	pm_iir =3D fetch_and_zero(&rps->pm_iir) & rps->pm_events;
> +	pm_iir =3D exchange(&rps->pm_iir, 0) & rps->pm_events;
>  	client_boost =3D atomic_read(&rps->num_waiters);
>  	spin_unlock_irq(gt->irq_lock);
>=20
> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c
> b/drivers/gpu/drm/i915/gt/selftest_context.c
> index 76fbae358072df..ca0a38de696eec 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> @@ -171,7 +171,7 @@ static int live_context_size(void *arg)
>  		 * active state is sufficient, we are only checking that we
>  		 * don't use more than we planned.
>  		 */
> -		saved =3D fetch_and_zero(&engine->default_state);
> +		saved =3D exchange(&engine->default_state, NULL);
>=20
>  		/* Overlaps with the execlists redzone */
>  		engine->context_size +=3D I915_GTT_PAGE_SIZE; diff --git
> a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> index 87ceb0f374b673..9e901f1d5d76a9 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
> @@ -269,7 +269,7 @@ static int live_ctx_switch_wa(void *arg)
>  		if (IS_GRAPHICS_VER(gt->i915, 4, 5))
>  			continue; /* MI_STORE_DWORD is privileged! */
>=20
> -		saved_wa =3D fetch_and_zero(&engine->wa_ctx.vma);
> +		saved_wa =3D exchange(&engine->wa_ctx.vma, NULL);
>=20
>  		intel_engine_pm_get(engine);
>  		err =3D __live_ctx_switch_wa(engine);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c
> b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> index 522d0190509ccc..d74b13b1b38a6e 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
> @@ -892,7 +892,7 @@ static int create_watcher(struct hwsp_watcher *w,
> static int check_watcher(struct hwsp_watcher *w, const char *name,
>  			 bool (*op)(u32 hwsp, u32 seqno))
>  {
> -	struct i915_request *rq =3D fetch_and_zero(&w->rq);
> +	struct i915_request *rq =3D exchange(&w->rq, NULL);
>  	u32 offset, end;
>  	int err;
>=20
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4f4b519e12c1b7..0085b1727dd47a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -166,7 +166,7 @@ static void __uc_capture_load_err_log(struct intel_uc
> *uc)
>=20
>  static void __uc_free_load_err_log(struct intel_uc *uc)  {
> -	struct drm_i915_gem_object *log =3D fetch_and_zero(&uc-
> >load_err_log);
> +	struct drm_i915_gem_object *log =3D exchange(&uc->load_err_log,
> NULL);
>=20
>  	if (log)
>  		i915_gem_object_put(log);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 6c83a8b66c9e32..44ff6da26bd698 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -1055,7 +1055,7 @@ void intel_uc_fw_cleanup_fetch(struct intel_uc_fw
> *uc_fw)
>  	if (!intel_uc_fw_is_available(uc_fw))
>  		return;
>=20
> -	i915_gem_object_put(fetch_and_zero(&uc_fw->obj));
> +	i915_gem_object_put(exchange(&uc_fw->obj, 0));

Should this be set to NULL instead?

Thanks,
Tejas
>=20
>  	intel_uc_fw_change_status(uc_fw,
> INTEL_UC_FIRMWARE_SELECTED);  }
> --
> 2.34.1

