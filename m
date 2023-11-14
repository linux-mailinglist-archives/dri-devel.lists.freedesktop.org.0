Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274267EAD08
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 10:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2AF10E1DD;
	Tue, 14 Nov 2023 09:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B3410E1DD;
 Tue, 14 Nov 2023 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699954283; x=1731490283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AOqOsKzCluUmnaOmY9i0WQWtFJ5yOPEarHZAgc0WH7w=;
 b=StCKzrJuoC0hc+QTYlJtHEhnIgwcpDyqly2ares7ERJumduXgeKee4+Y
 5AjoKp2J0cdct+r/kxrntD+WXYM8YzwYiqu/m/EmGAJJkUyxKzjrQOX87
 Uqoybn9EwbCxW7DnqJfa7jmHqdN+eXiggrAYAd8fD5zksAxX/NEo74OBU
 JrD7XMhbtRHXRZWzQHM5BBGSPzhJmNjohANaUVgnryOHfjvVYUig0IuHG
 sfUH0VNaqJF+oFRsKHjRcKP9hEm8K/d+CcjrV+w/e+35Aup6WgXNYFMnZ
 5DdgZdvEraZeRlTpN3ciPAwliBayV5ybArarNWBGTYO3j88xzzAMsuzPP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="381018212"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="381018212"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 01:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011858463"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="1011858463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 01:31:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:31:22 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 01:31:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 01:31:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 01:31:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP/u5wqN+gg11RmELB96CxIn7HuqQKOYVtuYGdFAVHT2odILGoVFV0F2envXT+JZe/R1tbQ8dWLVl2abzHhBXfX7Q1Gqz2ZkpKefs7Rl+8HGqDnMON1HYzlLDXpySRYcouGCbk4LaTti2y0VNaBuCSTy7qf0uozdbQAz8OEaouPzGV3U6UZKmnow2+Zd3ACaskYG6eSMBaHQgAJjYTpxjCglIZd9h5PYsPlxBvSopP7LueEAe0VLUqZ5LlDwsvEQjbUK0Gxjv2FIoR9f/cmsDseNZMM61mzvgaaxIDjkDQ2fJUQIcPKSMf0HDbDjt/b6d7xQWocmeKsk/5S79oyRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSmZZJQ+IkT+EDY8JQYi2DAKra45uRIJUBH4BBey/Aw=;
 b=lbPKPE8Yb6LeS3JW/YSHBOrQFRdpke/ngETETeDdBHqSujozIEzAvDCueLe3t/GuFcp2VtBE5GwqE0KVxodYZqlSPCH4yvHSpWuwU2oFg7ySpidcvdrwV7h4Fs2fs3TvLnxDBDx0uNjig9Lckmy42hw8L4iWmYMlna7iyQF7x4pfWlH0z4YXQV4jQjxNZGqtqx80kThJV8CWW3sDmmynoQ5KNIWWr31hjNK17OlJ+TNsSBsBywImmTbkNXDl9vptsw589470OopGiZeOec8rrmXIH/sl2GftM3I1s60DamVY57ICEgDco2oGZbMHyNQmDYzsk4cV7K1rZRI7Y0Kt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 09:31:01 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 09:31:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 04/11] drm/i915/audio: Consider fractional vdsc bpp while
 computing tu_data
Thread-Topic: [PATCH 04/11] drm/i915/audio: Consider fractional vdsc bpp while
 computing tu_data
Thread-Index: AQHaE777UUPtxuBlGEGxHgP584eV1bB5j6og
Date: Tue, 14 Nov 2023 09:31:01 +0000
Message-ID: <SN7PR11MB675062D9F305D40BD887A2B2E3B2A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
 <20231110101020.4067342-5-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-5-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB7246:EE_
x-ms-office365-filtering-correlation-id: 4ec7ed10-e5c4-49c1-93f9-08dbe4f46a67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8BsOe2j4iUaPzc05+UDtEAZxEv5sOxg3+JuHZqlK1eLVt05F28ehO81Cbq7YmlwaZmwZ+xJrXBYSoEPQsLkGC5TBAZp2Ull5bAsV2fp3D15uOIA5OC2eK7EnaF1CWV5EOXgxdu6XmjJFrGkCIqtER3BGxeVTlmk12ZNBGwf8wgLslbJpBW6s3I/3RHvmn05swNZDYNxqq4w3qlnHMWOoIZpuiHHLDIyXQnGH/OsK/Lcx/7UDgQXfAmeHt92TymTLgjsj+yrFQDiIiTtveIQc3ufTUNcOEoMFqx3awlgRL8hwOTyU6GHGDkk8A0w0JvcJk28rfm9oHWhjQZuiyXnDgzJyE6EGlAwyrX2WTqOxRZln2GRa6UbJ25802KB+onSdH/5JGjsijUJjHpqJRVG5vVWWmCvn0Iip4vwEZdZrseochbwnUguYc9XFnY8lgtvMzRnb55NA6iqjtNr/FkWb7Q4WT7KiFa/p5JsvW0hh53WAOohquMydaY69t7Hu3sDnexnrCxR/rwQmohA15RBa9uWusjB0zwMatsLXr7BXDwEsavACga+cb0yfj0xGiZQw5dfBdrR7i5YRZd9lf/Y0Visc1ZhthXrAEk3hayR3eimTgo9/ME0HcXFC73MX+5vMwshF8ijBTT5e//EKgrOUXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(55016003)(66899024)(54906003)(66476007)(66946007)(76116006)(110136005)(66556008)(66446008)(2013699003)(38070700009)(38100700002)(33656002)(82960400001)(64756008)(122000001)(86362001)(9686003)(83380400001)(26005)(7696005)(71200400001)(6506007)(2906002)(478600001)(316002)(8676002)(5660300002)(8936002)(52536014)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bw9/aLoDTEqBusCPFV0xxuZAeDeLlAY7X5nB5pk+k3dldi0kCtvbNHPyFlta?=
 =?us-ascii?Q?yuvJqkaAq4nncbqQ02MThtSGu99QzO3dVwq6RzBlDpiNFOHgm96gl5uqHHJu?=
 =?us-ascii?Q?18I/3x/ajNlhXu+g6L5Sr3yp0d9hC0AzLUV6xqiwZ239feiudLh8P0Zrrn1I?=
 =?us-ascii?Q?dZXcyhm+nk+AXdH1ubk6y+IB3RNcPz8UIAnA+N/QLN/HoxHq0nOUfAoqNBX8?=
 =?us-ascii?Q?S5CL3qgYf3tr6U0EYWSeXAUYchZxjwkr31yYF5emmmzgBpR6z3rdIEZzrMBm?=
 =?us-ascii?Q?ZRrumZ/8yaCq/t5U/3r5U9HoZ3fDqJ+p8gkzRz69OpANBAokWKvP5vivFyR4?=
 =?us-ascii?Q?fOEF9A7Eeh/D3F1BY+ECiL07I/HGW63BjlzYCN/8IgcgGxxRkSal1ClgwKRy?=
 =?us-ascii?Q?ilohjYC8WJrZ8eSNh3cM/S20zT/pBzEUs+f1xmVVzFCAjN6mxtIgYKmMbFej?=
 =?us-ascii?Q?i1QezZXqVWM2W20n0EG7h9pnJPB5nWoMqGpuk7OWF7583qWAhy7wwH/LjdRV?=
 =?us-ascii?Q?DkFwJwOK9umOeyeMtJfjhwyg1fIk9N/8fnGOJzLHBC2vk0NGA7GxcpryQd6f?=
 =?us-ascii?Q?eWhEKqrcWd5HAtNksW5306Txf77PzN70tiiIw/Dk5S7IbS80SlkZbhjKu7CJ?=
 =?us-ascii?Q?ileX7X5pIw+/BLAQ5fDKIdo0rrTecgtikj575CpCu4XxB4GQoV5qmn3/r+cG?=
 =?us-ascii?Q?jdeDm0Ip1807+RN0z4Ecsif6nkCFq/9vh2nSeYeTMvKmLgC4izV3chessIio?=
 =?us-ascii?Q?UtrpJgTILuvWQnOvyq4YAIHnQks2TaZtxvNx+w6etiwS7beTcajkBo7eF//L?=
 =?us-ascii?Q?HjGOuJuhRvGGa7IQvbtUzahUCuz078b1gi4bTTLQehmQcvxguuUHvhni/YFB?=
 =?us-ascii?Q?gNbyX+aobeT4PHPdxYtyl5yrpnqvhDcysaGfR78+cDE5q5W4mzW8w/BR5Tew?=
 =?us-ascii?Q?HG4hF6C795sjkqQdkJve7aUPWDdchhQ49euW0sKwxfB5+NwxVSR45ajWf1rn?=
 =?us-ascii?Q?Yb8qfX0JhP8aAEiekc13+Dht6odhfLA5cDDermEhRHjMrm9zWONabw5s1MSt?=
 =?us-ascii?Q?wBZnEo3OxZH9AXzpm+0jfZ5sOTn+8ekEGqtnM5MmscCdDM2yNkQhOIskxA52?=
 =?us-ascii?Q?6dSOj3lTVxhCC/APtbCMY/ZAjQrM8PZ8To5wRDB0yMKIh0WgUjcErgxnxYNx?=
 =?us-ascii?Q?n3OiOJvFiDtvr0/2jIPfToGb9Fyst0sZgF8seLeUqDE4BeJJ9yBxqyt170gl?=
 =?us-ascii?Q?Hk8wEYgRf+uGN5NFAy3d24Vfc+fQIL0hJPSRronGxZgSurUSXCW1rLutNvNW?=
 =?us-ascii?Q?DQGOqcVRULyfXqR0Z78HkzWU8XbjcqQsboAU7kxWlb4nlf4C4+z7+WP40Ccn?=
 =?us-ascii?Q?8vbh+/v+CKVNJLzFk0Frlwl8h83C86vWUOiMuDHPt29ST48kN+BDy0TPwuJw?=
 =?us-ascii?Q?f/UAUpvlx3yfPh7u2SEzEdKo1igN/1ZxoqrM7JOnR6vPyA9eRPW+pZ2ZWTNE?=
 =?us-ascii?Q?tokrGvm8HFZSEQeN0nZhMNeyJcQPBqG8dLOmkxuW0SQQzCRK/zKcVYD/izYa?=
 =?us-ascii?Q?8w7T9GSHPZGMJjVEZquzouZq7CkwvU4xzm41q+66?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec7ed10-e5c4-49c1-93f9-08dbe4f46a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 09:31:01.0992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vz/tO2blg9UHauPj2wQzyu17N10EPxumIu83ZHSt8Ez+Im1MXTm33ixsYwuJMtfXfeVEaVUpGZZfPQNTYbO2QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> MTL+ supports fractional compressed bits_per_pixel, with precision of
> 1/16. This compressed bpp is stored in U6.4 format.
> Accommodate the precision during calculation of transfer unit data for
> hblank_early calculation.
>=20
> v2:
> -Fix tu_data calculation while dealing with U6.4 format. (Stan)
>=20
> v3:
> -Use BPP_X16_FMT to print vdsc bpp.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c
> b/drivers/gpu/drm/i915/display/intel_audio.c
> index aa93ccd6c2aa..8796d90c46a6 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -521,25 +521,25 @@ static unsigned int calc_hblank_early_prog(struct
> intel_encoder *encoder,
>  	unsigned int link_clks_available, link_clks_required;
>  	unsigned int tu_data, tu_line, link_clks_active;
>  	unsigned int h_active, h_total, hblank_delta, pixel_clk;
> -	unsigned int fec_coeff, cdclk, vdsc_bpp;
> +	unsigned int fec_coeff, cdclk, vdsc_bppx16;
>  	unsigned int link_clk, lanes;
>  	unsigned int hblank_rise;
>=20
>  	h_active =3D crtc_state->hw.adjusted_mode.crtc_hdisplay;
>  	h_total =3D crtc_state->hw.adjusted_mode.crtc_htotal;
>  	pixel_clk =3D crtc_state->hw.adjusted_mode.crtc_clock;
> -	vdsc_bpp =3D to_bpp_int(crtc_state->dsc.compressed_bpp_x16);
> +	vdsc_bppx16 =3D crtc_state->dsc.compressed_bpp_x16;
>  	cdclk =3D i915->display.cdclk.hw.cdclk;
>  	/* fec=3D 0.972261, using rounding multiplier of 1000000 */
>  	fec_coeff =3D 972261;
>  	link_clk =3D crtc_state->port_clock;
>  	lanes =3D crtc_state->lane_count;
>=20
> -	drm_dbg_kms(&i915->drm, "h_active =3D %u link_clk =3D %u :"
> -		    "lanes =3D %u vdsc_bpp =3D %u cdclk =3D %u\n",
> -		    h_active, link_clk, lanes, vdsc_bpp, cdclk);
> +	drm_dbg_kms(&i915->drm,
> +		    "h_active =3D %u link_clk =3D %u : lanes =3D %u vdsc_bpp =3D "
> BPP_X16_FMT " cdclk =3D %u\n",
> +		    h_active, link_clk, lanes, BPP_X16_ARGS(vdsc_bppx16),
> cdclk);
>=20
> -	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bpp || !cdclk))
> +	if (WARN_ON(!link_clk || !pixel_clk || !lanes || !vdsc_bppx16 ||
> +!cdclk))
>  		return 0;
>=20
>  	link_clks_available =3D (h_total - h_active) * link_clk / pixel_clk - 2=
8; @@
> -551,8 +551,8 @@ static unsigned int calc_hblank_early_prog(struct
> intel_encoder *encoder,
>  		hblank_delta =3D DIV64_U64_ROUND_UP(mul_u32_u32(5 *
> (link_clk + cdclk), pixel_clk),
>  						  mul_u32_u32(link_clk,
> cdclk));
>=20
> -	tu_data =3D div64_u64(mul_u32_u32(pixel_clk * vdsc_bpp * 8,
> 1000000),
> -			    mul_u32_u32(link_clk * lanes, fec_coeff));
> +	tu_data =3D div64_u64(mul_u32_u32(pixel_clk * vdsc_bppx16 * 8,
> 1000000),
> +			    mul_u32_u32(link_clk * lanes * 16, fec_coeff));
>  	tu_line =3D div64_u64(h_active * mul_u32_u32(link_clk, fec_coeff),
>  			    mul_u32_u32(64 * pixel_clk, 1000000));
>  	link_clks_active  =3D (tu_line - 1) * 64 + tu_data;
> --
> 2.40.1

