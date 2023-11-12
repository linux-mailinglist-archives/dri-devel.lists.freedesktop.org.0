Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45E7E8E6A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 06:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CA310E2ED;
	Sun, 12 Nov 2023 05:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6710E13A;
 Sun, 12 Nov 2023 05:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699765235; x=1731301235;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7BEZAnoOwh3JKkGkkt7uCUQaDyf0YhoDu64DyYrsEJ8=;
 b=Y/32w1F4Wuq8DvRN7REkYdNb8Kr7sQanWVukI8hwToMZ5gbwbfRbDL0l
 yl8/KnOgJGjAhBW8EVlt4GEY/vhqI7QIDbqtJ4dak2VlGmMfIQOaBOIfz
 7oajQUtbrLzlqTgL62KKkac79YJMJpN63dXWU65JjhrwT2Ta2HvO3DFUV
 1mBywnfOINbKKo+IT3tDt1Kx0XppG8ke6EH0ia50hwEiTcoqs3uOKotUB
 4pZutNLIZ3sJK6EOPEy/vxQMeYCjByPDNiGPmLCShGqK2Lyf7K2qqOQ1o
 TZSC+rcq2ylm86Fmcxc9h4DbXpJRML5on3z6oRThSqmQ6G9FSITPqGoCC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="421407752"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; d="scan'208";a="421407752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2023 21:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="5380639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2023 21:00:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 21:00:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 21:00:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sat, 11 Nov 2023 21:00:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sat, 11 Nov 2023 21:00:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDjlrpK+ENZBhhiRZJvva03r1E7aA+u+y/8C9r77DMz3Czp6EdBEJQnr1ZhV+fej/lKk2tF8qvcGoGscyW0pcMYmJb3uzOHf5RA6Bw7vflP7RzuIg+OqkGAYBUdTiekaylxIfw0hCwJADoU1QPok8KcksNBIiDbxiioKp/xv7OmCV2m9RKEApt/wKkXtk5Rh50RtHstPAT+hpiXobu+JF8B8fNWM7mUXkTbDWi3tgSpkOTqgsbwO3tLUchvEM58rKjmLdpHqtzlwRjCmRzTACzVY6wUDudyC5V5DYLRporSvXIf6bjf6P5Efsy9s85sS7jIiYdPQkXTjMs78IU+udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6TmYS+KR3CfPIfPdq+hwpTREQQ23c9QDpu6/wontGs=;
 b=nVQrrKpu+rLakP1FGZOiHctmaynwAla2SKgAkSXkym0eogLEOBwna9eYLqpZm1rIeALTcrNHBO7HyxyVeg30ojbA2RF87xtNXNVWJ5QCJtCOBAlRRCHZLmHdLDkqx0JZsY9s9C3IZWGE0sM73RLLaHHr8b4DS1PDTrer7JL4ZIIeciNCTRMiHie2pm9MWUfhd6ML+VOcdkhk7Dzkr+QZcYhJvjO6MSTy7TuD7A1qPErEPWqYK5Snjdut+ZRcswyYX8jl8GkVg9TJNO9usa6/p7dIz/LJQCsCGCF7whyRAha26iT4ZUvoZKyEJLzJeoNFwLXAlliflQL2i1S9hxSeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Sun, 12 Nov
 2023 05:00:32 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3f2c:c6e5:ae21:82cb%4]) with mapi id 15.20.6977.026; Sun, 12 Nov 2023
 05:00:31 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 11/11] drm/i915/dp_mst: Add support for forcing dsc
 fractional bpp via debugfs
Thread-Topic: [PATCH 11/11] drm/i915/dp_mst: Add support for forcing dsc
 fractional bpp via debugfs
Thread-Index: AQHaE78EtnWFAoROMUWT0++givHSZbB2IoZA
Date: Sun, 12 Nov 2023 05:00:31 +0000
Message-ID: <SN7PR11MB6750261BF92DBE2E556FEDC1E3ACA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20231110101020.4067342-1-ankit.k.nautiyal@intel.com>
 <20231110101020.4067342-12-ankit.k.nautiyal@intel.com>
In-Reply-To: <20231110101020.4067342-12-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: 6e470ed4-8715-4d53-71c1-08dbe33c4c31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: okOEmoDoA7i3qTv8c6vyE2xqaJuhMoEeWU8YbWhHsjtRtXa9gNr9zMZcRbjLXDCa0ZF48uUl9fi++W+H83gyJ3wsMMLbiTvcrFteWQNQQDLZ3qz7BMm3R+SHqkrx+gBFgSh+zCOH7lkTzolRri95hlI6/3y9foaPuObcQUEmGVtzwwnrlDTiz0qGMykzbbMVMTb3OMOs3wy3IKIcAyVMbwgy5/OGtPu4vJNkjOFCo6pF3QpUgG2OLjD05Y0utZ6aHvG/cbWM2a7LBbVew6IAEIgsMmcwrY2FniH9cjZ+Z4VcNdm9FclzcMJwlN0AzyYslXXnajJbPgfRjABr5gkObJPLWdFu4TNrvbmzwxsmPBkKFyxjz6yInaXwXycIz9/xu2yruK/3s/F+8XIjof7exCdUSR1pcY7PizIVwE1TYQxKy0z4TtfZJIl/lNGby8H931l/r6q1r/+q+TLkFdEJ1liklGldi2P7U7+9Pu64Ep9U+Kf8PBVRA7wEGB/ZMgH72hJHEg/KukbQyAKGpKkKe34LB0+huvSAtZvJ30L1tpHBXUgaPj+Ahgd60wOc59CIhShVz5h1zD27vHkAfKbxPBiHUw1lpdSnBiTyaGL1b+w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(8676002)(71200400001)(38100700002)(52536014)(2906002)(4326008)(122000001)(55016003)(41300700001)(53546011)(82960400001)(5660300002)(8936002)(9686003)(7696005)(66946007)(110136005)(26005)(478600001)(86362001)(66476007)(6506007)(316002)(76116006)(33656002)(66556008)(54906003)(64756008)(66446008)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VpQmZXro6EiCp55+WOcD01JTY2IGnzcjRG1edJJ3FdyyH+QlwLXtIi0vUzLB?=
 =?us-ascii?Q?TpedqI/BCLJlE/g3IsMmmFfjyRuRV1W0dIIyq3VqqKd9sqX/DwRALwDVTSg6?=
 =?us-ascii?Q?4GF93OKkF5B1fKu17TZcH7tCT6QUsw15TwWQlBOio1+id+Fy3YL3x7Z1fJ6b?=
 =?us-ascii?Q?xlfbqO7IC2Zpes0kbPCjZ0Uojy988FHMAYChvfTGXxmHm1MUGqqn0O32tyMn?=
 =?us-ascii?Q?quQYYZd6lFretM19Z6Dkco8LQ+xLNahqfSB7TbzQ/5T56jG7ylsvCp8pMpoo?=
 =?us-ascii?Q?zmRkO9DFcPd1nScQE8lnX4k7lFX18MA6yGWiNujaE+hpL6asPwow1Z0az3Qr?=
 =?us-ascii?Q?dr1taAA+0Ut6kTXIi287Mw/Gm35xEQJqgmEJI+uIEcCh3VsTobg97IerHukp?=
 =?us-ascii?Q?RWKDhIIFkDn/um4qqVgOytKl2/bwLdnMKhBQkz4KdlacaaPojyUaeYmIwjxj?=
 =?us-ascii?Q?1EiBdRzY8X3F9FNfRJpC2zKiJztehAYJaLsMA/Egv5RLUkRdZ8nGC2PRpzpi?=
 =?us-ascii?Q?2OoWgkTL9yOKjjXxYq2aQlX78lTaxI0fTic97YBBVMcvdhuOkXsSabAstqtO?=
 =?us-ascii?Q?+5CA6wU3Z5Th2OBC6RXTZos89OGPKhQSq6O/Hb2tMWN7fx6Um2v3zmPLMFbD?=
 =?us-ascii?Q?HFiIHKYxL2H+ClhbBkD8BLE9KLq+mQsTVtagX3GvCW1e4vgl2F5BS+fXelPP?=
 =?us-ascii?Q?NLX++IuO3UABWUTlGuB602XGYYRJbSHB32/TAuISRqP/Nf0SdA4ga/BbNxSt?=
 =?us-ascii?Q?7dbDhja+sjo0d4gP4ybMEwp9AvuD9wSchBszasnHSTnESj+kW/JXVKtqyq4+?=
 =?us-ascii?Q?0VgITZ43ACWTzcxlv7UHdTF9ROXJr1W9oi+mL+HtJ91onIPb76oeKpF5vl4G?=
 =?us-ascii?Q?/SDwlid1L+g65vM/7FE3gU3NDwBw/JzRe1vosahCmZNmJku07ck5Aw5lr+f7?=
 =?us-ascii?Q?N4CfC8dHfaC1E0jp3N+FIwpII6kkOdVB3WA6CmS4DwDUmUrfGcZfKak/YPDv?=
 =?us-ascii?Q?Ch3Vm43LVvYcxsFCks2+l3LWzETyU3Qjla7ImefIc+4DGtVwjpjioHpYMTJG?=
 =?us-ascii?Q?3IDpM9D0vnx08m1HGyqpahS2DW3cii6xvIYGi9m4lV4E/+34LkFcBz6QOVYM?=
 =?us-ascii?Q?7kKo2aypR0LryqrzcOcxZgu2LNCbOD5yiPVgM8xC/oGLpoQapVezcUIFWFbt?=
 =?us-ascii?Q?I+xQBaT5R3VWK4kksgFiNnOoHVGO5vt5+ZVABonNdwhiXlQcyYmt93wKLF9O?=
 =?us-ascii?Q?v7ZBlHqnAc0ytJY8DytjE9sfbwju5jq1U1qDBwwfJGudriesW1lt/trREaTM?=
 =?us-ascii?Q?qM0GZj9NVu+xK8T1qmseXefttJxbRFEE66P9i4S1AYkkvZ2Gy0jZp651Z1k2?=
 =?us-ascii?Q?D71QYdwO/8HnVdgSvsMeIO0dTRww76T1Za0YXuMcImX/uDXcb0PuowI9btIb?=
 =?us-ascii?Q?JgpQh9VNPwy8lIm/f87JQZtU9GFrKXD0UWqEuBFbeW3yUE+TJG/n1PliQ0Iq?=
 =?us-ascii?Q?j5LwzhY57MOVzwRdO8fOK7QbpLvF9nqjtYcHYg4vXpjwPGfEigT90I+Ndob/?=
 =?us-ascii?Q?rpEZbM4xEJj071VtLIBP5b6gOfO3C3biyJ7Lzp2T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e470ed4-8715-4d53-71c1-08dbe33c4c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2023 05:00:31.8407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23VPCwvXBH1FBJuChKcNcPO2J3Q8o1sIdE0f0rvhStxFdL0UTuFztG9qu3X8KHshylRDHnIC6L3IvruzUOLnpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Friday, November 10, 2023 3:40 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kulkarni, Vandita
> <vandita.kulkarni@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> suijingfeng@loongson.cn
> Subject: [PATCH 11/11] drm/i915/dp_mst: Add support for forcing dsc
> fractional bpp via debugfs
>=20
> If force_dsc_fractional_bpp_en is set through debugfs allow DSC iff
> compressed bpp is fractional. Continue if the computed compressed bpp
> turns out to be a integer.
>=20

LGTM.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 322046bb7d42..26b51ba6871d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -172,6 +172,10 @@ static int
> intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  		struct intel_link_m_n remote_m_n;
>  		int link_bpp_x16;
>=20
> +		if (dsc && intel_dp->force_dsc_fractional_bpp_en &&
> +		    !to_bpp_frac(bpp_x16))
> +			continue;
> +
>  		drm_dbg_kms(&i915->drm, "Trying bpp " BPP_X16_FMT "\n",
> BPP_X16_ARGS(bpp_x16));
>=20
>  		ret =3D intel_dp_mst_check_constraints(i915, bpp_x16,
> adjusted_mode, crtc_state, dsc); @@ -225,12 +229,16 @@ static int
> intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  		drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
>  			    slots);
>  	} else {
> -		if (!dsc)
> -			crtc_state->pipe_bpp =3D to_bpp_int(bpp_x16);
> -		else
> +		if (dsc) {
>  			crtc_state->dsc.compressed_bpp_x16 =3D bpp_x16;
> +			if (intel_dp->force_dsc_fractional_bpp_en &&
> to_bpp_frac(bpp_x16))
> +				drm_dbg_kms(&i915->drm, "Forcing DSC
> fractional bpp\n");
> +		} else {
> +			crtc_state->pipe_bpp =3D to_bpp_int(bpp_x16);
> +		}
>  		drm_dbg_kms(&i915->drm, "Got %d slots for pipe bpp "
> BPP_X16_FMT " dsc %d\n",
>  			    slots, BPP_X16_ARGS(bpp_x16), dsc);
> +
>  	}
>=20
>  	return slots;
> --
> 2.40.1

