Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18635BD0EC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC5110E683;
	Mon, 19 Sep 2022 15:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2BA10E67F;
 Mon, 19 Sep 2022 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663601374; x=1695137374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I02tm8YZIe7vDRA6SIvUIml+JmBbqWm/csg/WBjyfXQ=;
 b=Gtgz96sDXqkAoWBNDAZBKmfAWlHVSl4gUIrlyNdAvh/fidv6LV7AjvlO
 O+gPZeAOqZH/kOlANAjGaG67MufZm0q/IIR0fQ9Zh9os4ABg5QI4MIyFe
 CKXPq5nB+F1EEvSGNLXFBuzKCZUdSpkQFJ4ErXJR0ofgp1GzpvN3Ah5Zf
 mTB2UY3yZ9WC1AS4gv6O7PWaeyXmMzoA4i0l2BzraZSdVK9fM5/sL+dZC
 4ypnW4r4liwCM+J7X7UdsAT18aeNKBnL4LqvwPNn9qSdft62g7j3G765N
 ++YWUtFMd4yV1PUH3cQ7mtpTHUxgzg+C87a8ajk6XeV84x2pL+ghq+Sjg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300805306"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="300805306"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 08:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="618528059"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 19 Sep 2022 08:29:17 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 08:29:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 08:29:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 08:29:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 08:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQp776F56X8W1yPaNv/eOB8jxW7IE91g8K6/TlwgUXRLmup6f2tOg5nf7LWdfLxQYjqGGf8HMpZ4nlynOGkGpDpRcMJY4QlMcnUMCo2Zed7nSOc2vMFFXzIDVJNpzU5AdWxdy+3Dmyup19q6Mpm3qP8QFHjBTufvf8sIDgqW8cSoMHICStGe2kMjLz9SzkXSo/FPjqD1zpwaBCvu4L6eXSp/G5+Qs59dSy5Qk7b5XsK+tjSVVRr70qEMIn64W1cXA4muRZyts+W1lyyiy0j8ThH53CVtG89OX3SeDTl0Rs5FOtszh4mWcIVw0kKsynvTPVLdhNqV3s/4dJxy4ylBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EnJM5Xa1GRgdYtEJMis2gzDh3M7g9zhCjmy6ERia5Q=;
 b=E4ch1TvX1SPR5Tn8XiCaKP3ZKZiRx35RizfdSS+4CSS/sanYNgzapp2pga+hTYcE7ntrDvEXtWbjazYzYLLiJ1eyCEpReh3KuCH3s64tUmmQR3iPaWAY+ufUUU8SahdxZfarUB52PFYU7l8a2OReNIuXusEd0mnvW4unjKWFyyKJNhs4v98YvtMzVR1bLAjX9iP6LhrCpOkMWDFOCGhTXwBbON+1rPPEXoeBD2+FucTU0UFznhjrk+w9Aj+T/c7HsLOGryKOv8bbsK2Z9Ft7YEn9YIwEpPE7Fx5J6ki0oCM6qzi8RnFD/6XsfWyaa3Gy3pMa1pmmYrNfgAKfEFXebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 15:29:15 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::6d1c:5833:c6ab:f244]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::6d1c:5833:c6ab:f244%5]) with mapi id 15.20.5632.015; Mon, 19 Sep 2022
 15:29:15 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Do not dereference NULL bo->resource
Thread-Topic: [PATCH] drm/i915: Do not dereference NULL bo->resource
Thread-Index: AQHYzDjv8WD56W8eukKMhXZeptvpca3m4BFQ
Date: Mon, 19 Sep 2022 15:29:15 +0000
Message-ID: <CY5PR11MB62113BCB450D45C1DC8201DD954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220919150233.5457-1-nirmoy.das@intel.com>
In-Reply-To: <20220919150233.5457-1-nirmoy.das@intel.com>
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
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CY5PR11MB6162:EE_
x-ms-office365-filtering-correlation-id: c08d4dd8-e1fc-4cfe-789b-08da9a53b5f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x2V1MZTjrfH9U/cOYB8pD+om7ArE+Eae7OpfY87+f8EmL/zxVkUtFiNQHeny6f8eqwtQu4nrhbmKVPy11H1XbOuWpmVpoD744I9UbqXa/nv2PqlL6wv7s446a8NBjhZp9Q7S69Zmcln0qNpDLZ22sQNXDJtXvueHKnhbw7E1DrM0Efyb2/mVS5uKxRo2vsATqwElurSGU4TDFMCT5DIAL5BIgRu0RayXagMj3dViblFtCjvR7uzoNtkxuy5sMFUSsUJ/rxJ8pasOF2cFt8/3PjB/9LY+eCzFK6Ut0HjUA7zmyhYdAEqF/aYx6O3Zpqon+ApFonIkfKmYk30xP7rk7TvVbeUeph5CNwsN6XQIe5tw7+TQLinh0KemXkMyZqyQmDhh/U6cfZJnDxu48PjG7G6Nu2NvjroXsvkgNj0qiP2cWkl+ftpkxzhE0SRwlwQnfqYrhzT+Q+Rq3NSPMPYWqjimj1ZzXVB9adPRgTjzzN9+EUSlHH1xgzJ0iO8+o9bnvJk2UAWojlfFR8u7It4Fj0JfaHlXsG1vTbXLJGBHebY4C1G/gIJCwXFyAwsmEP8v0fNampxkCV/2UWAUfSmyD2s/yrAmEhHE56h2fxWkJhwN2o3P+gc62Wh4jzOAw81/WIPAWygrKtT28uWCZoiGFoGtVRtvnDO2mpYlzUxhUrVS/qxDatw15sz2m3YsV4Qf0ir6MMBQUMrh8/D+evj9gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199015)(122000001)(38100700002)(38070700005)(82960400001)(86362001)(33656002)(83380400001)(186003)(26005)(55016003)(2906002)(966005)(9686003)(478600001)(316002)(107886003)(6506007)(55236004)(53546011)(41300700001)(7696005)(450100002)(110136005)(76116006)(66476007)(66556008)(4326008)(66946007)(71200400001)(54906003)(66446008)(64756008)(8936002)(5660300002)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eQbnHpbjsLjyo122jnX6CjTKsCbd1tiYsaPSzAh0pLIWSxJc0oyuy0c/FmQ1?=
 =?us-ascii?Q?8cyxu/SIUN8texf9JBVDIEU3FzehZzOjlszMG4pkqH6KkfGhQdX2PZOesrB/?=
 =?us-ascii?Q?DfqlfpUAHjlrOg1C0Qg19oyJYvGTC4xk2kZ5SzJ4kg8N2I4OuKiUDoxLH6qq?=
 =?us-ascii?Q?tqu9cyARHPpYHCMe8Qy65TOtrPaXfkhoDQKm92YH2ZtugYMaNjTRwzbS0Kpk?=
 =?us-ascii?Q?MqxnxYuAZ1EdspisyCzzTob3NSzZ4QHrrTNPBhcjjnJwCzg4HC63eKm1A5iM?=
 =?us-ascii?Q?Wzjx9BRjvpLbSTqfmPBm5ecApq79FI4CyVE2+lPmx6+KSCpL/fSI4kkXc+t6?=
 =?us-ascii?Q?tr6/AvecPIzAlaSSKWQYfoR14S1hCcpqpcyweO4VoMdl7NMTYlHVNbNJbNT0?=
 =?us-ascii?Q?fwpO42mXy2h4KjOqQxtI8RVyXn8ScKiC2soQvXBUQinOA3gmIAcuTDzI9zxB?=
 =?us-ascii?Q?FB3UK93Wv2SMTruk5xz8hB3GrG+6jgU7Z0XF19GRnqiYKh2XCC6sDql0FlXX?=
 =?us-ascii?Q?v1mPb89HxUKoSxQHe2dCoxReldKAAjJBZYGkoazO2rEZduO4JGEbUxRGHgKA?=
 =?us-ascii?Q?8dFReOADWk4HdUsd5GcEVdvZAhTxqxWgT1patdNfltCg0BE0ieXnK7DgW1Z1?=
 =?us-ascii?Q?zvkxn464SgPi1RH3oKGABdOfk3MENTQFBIkEs9BaX7mCYzkdIe9beTwtsj8M?=
 =?us-ascii?Q?xM4zicFB9pV2hgQFUt5rTLMm9ag6qccEgNJ1sWbBiszmxn134DduW/F4g0sm?=
 =?us-ascii?Q?i/wJXny/GiKZixO1jy8y6hBjLvsYPBu+OgkVCu8SIiuzzc6IG60iecTm89+V?=
 =?us-ascii?Q?2/yd4Ycok2OXC53NPzGnT1iRR5RQalQzpFKhUUI4KC278hMt7LsRoPw6Xdg/?=
 =?us-ascii?Q?VkpqW7UvaFc2lbOxWcw1+YiIAmOewA7PAnPnMuGU7r/M14Q2slUYgeLQiBrX?=
 =?us-ascii?Q?MrPquGwuovKXJqc9YCKSFWVFzMuxkQWJPctYz2/6ZjW+afuhGfEpV4D4414r?=
 =?us-ascii?Q?nq7dQukTrSLImZcqAd7mXStKJr1o5H5zn+wOe2LoWIiXpQaog+Zr8dfBxXLX?=
 =?us-ascii?Q?6+PlN3OfncJCD2sSVt68AzSW1riTKq+ymTVdi9yT9URhpfEWL9GkVKouIl+R?=
 =?us-ascii?Q?uU1d6vh01iIhCO95JIAeBSX16rKsyINqr2IfSMbPe21cYeXQhbRFTvTtQa0p?=
 =?us-ascii?Q?gpLlvutY08VK4bzxQkXRnbrVqTBBQfS8Ytq7RI+etY7o/+rHLJFATNb+rChn?=
 =?us-ascii?Q?ZhxWSIebPJfD37vG5EjpvRSl7FnghvkPPhtXOQfmYFdpK4BGbGZ6Cx2pUjm0?=
 =?us-ascii?Q?Ypq6BYQUwTA1TDek/1elhGToLVr+uL9NYQsXMp8kDpnfC3MIbrOkbmDC5fwv?=
 =?us-ascii?Q?V+y1zM8/TOjEDQlpHldxgA9/ac1vbCEPZGZq+7y3XDnHTrZjqiUHIz12CFJl?=
 =?us-ascii?Q?Y6V0DKQfG3r65d+HvneqI02gwUGb+NhaEZdgyBrtoEXVvBTCjGtPCxcuu1uz?=
 =?us-ascii?Q?nyv2UjrSQFptwyUcU0a3IJOiHTL0hwCpvC7ifpqZcQVlQz3Ujll8FAkanTiS?=
 =?us-ascii?Q?EYW8f2ChO/rPLMbzjMt8OJyyLXDq5RAn5aaUWCbW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08d4dd8-e1fc-4cfe-789b-08da9a53b5f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 15:29:15.1250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUBCilskInAhhwDzZOdNrDJVIUC26ub3Xx0tVD/bYDGsV7CUh2hWasMrTZ5fzwcp5fcIYhgCcHuZewBZkvvS9gw2TC6Y7SPDkCbauPPr+fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Das, Nirmoy <nirmoy.das@intel.com>
> Sent: Monday, September 19, 2022 8:33 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH] drm/i915: Do not dereference NULL bo->resource
>=20
> bo->resource could be NULL hence add a NULL check for resource before
> bo->dereferencing it.
Will bo->resource will be NULL only in case of object is smem or it can be =
NULL even in lmem case as well ?
Thanks,
Anshuman Gupta.=20
>=20
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850
> Fixes: ad74457a6b5a96 ("drm/i915/dgfx: Release mmap on rpm suspend")
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 0544b0a4a43a..8608801cd9ab 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -513,7 +513,7 @@ static void i915_ttm_delete_mem_notify(struct
> ttm_buffer_object *bo)
>=20
>  	if (likely(obj)) {
>  		/* ttm_bo_release() already has dma_resv_lock */
> -		if (i915_ttm_cpu_maps_iomem(bo->resource))
> +		if (bo->resource && i915_ttm_cpu_maps_iomem(bo-
> >resource))
>  			wakeref =3D intel_runtime_pm_get(&to_i915(obj-
> >base.dev)->runtime_pm);
>=20
>  		__i915_gem_object_pages_fini(obj);
> --
> 2.37.3

