Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A35A7232
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 02:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91F210E3B4;
	Wed, 31 Aug 2022 00:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1009610E3A8;
 Wed, 31 Aug 2022 00:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661904192; x=1693440192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tms/I5Vt4rzQR8cbXz250DyWAktSsL4T34aLYwq8OrA=;
 b=fHKGSkLOWF/b1wWKDJsWA4aGuNs0Hzijvp5Ty6tzXh/n1iVS6U07JeMH
 0oiyuJJMjSoPookEeyPfMoY7pP7Y3mPi+wC38MpdBdW07QbW+syx1dqoV
 PxT/FUPdWW6hKgpXHBMD3motMRuK5tyR9h2itO97yVoI+behhUq4dIqlY
 sN1SdoO7IxyDrbH//kSSWDKM0LQFtDE/I5qUVM86eijtVK7KHdoD3mwEw
 j7JiiAPGph2YELRQnzHSPLSl1Jw+SucuANO6QrRI3JuuYkJZH3r0r/0OJ
 jlDloB+0hsOXU7wU2WfxI/7k0igKo4MjbCXYP7qy7peVL1epy1pbENllG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="381630851"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="381630851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 17:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="614810345"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2022 17:03:11 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:03:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 17:03:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 17:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Owpci6p78G18Om0x3G7MEuv10msEzhBnGvkRS7NW5uKjj/e3VP/SBJ/O3cGrGm0Atuf6OkfhXu2NdmwK0vpWKuBhSbelbQEAuIZRhJFLq7QyO+0D8KDu1THphXPeHNTHXqqLys+D0Pqi4Jlqd06pcipcNH2H+EJPtN+xqr5ebe9suRz+XJfENgGS0Zcu/iesB/eqiblf53cdt0rK7tg/G9zFdp4sZmzuwY6Uu0Dk9MAkO3HJylOW5oC5rQUBKkqCrdZ/1It3Y1St1IcPTyxFqZwi+V46kH2p2GhNdf4RyHS2AGp1B8sUW8+qs/IyhQMSOLYoIt6WBVXO96CrYvXiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5OGCpaeiCM/C9TygtOw/zJxjyZD0tWEGu+Ix06Wem8=;
 b=m6b+imTjXMvGioEmGnwt7EYqVSHbRVH6PXs3iGhBv7mczlu5NmVTZnSo4KD8AQ5aKpsbwlQJo5Vq4PDjB9a9ZpigJcVspHpFkEtMDvjF79YWuyL5Axh3QmthVNlTiyPM3TtCBWiNdHYlGdc/GtaGoe83iwFDkrN1uZLW20CcYCMUe4IAFPAcsueX4BzUh3pLAyA/liBxMLyvrU6nEIuT7e3qVF+zmc3ZPz3+m20AzoUd/ugz8ho1dgr55eK7iHejDeSGWbH0ZSKkNKHNmdzVpIMj4zEyK8Xdm4NzOtxFbR4+qvJU4zM5VVMLpLaLM9+8nJXTErlVAvWjcO5ekzEODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 DM6PR11MB3818.namprd11.prod.outlook.com (2603:10b6:5:145::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.16; Wed, 31 Aug 2022 00:03:09 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%6]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 00:03:09 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/8] drm/i915: Use managed allocations for extra uncore
 objects
Thread-Topic: [PATCH 3/8] drm/i915: Use managed allocations for extra uncore
 objects
Thread-Index: AQHYu8ku4VJ/BZ1O7kSnUsmL4EeQQK3IIlVg
Date: Wed, 31 Aug 2022 00:03:09 +0000
Message-ID: <DM4PR11MB5971D34072BA4E27D18F3C7987789@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-4-matthew.d.roper@intel.com>
In-Reply-To: <20220829170238.969875-4-matthew.d.roper@intel.com>
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
x-ms-office365-filtering-correlation-id: 379076c2-852c-4ef2-ab92-08da8ae4302b
x-ms-traffictypediagnostic: DM6PR11MB3818:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6KvPISNhEqw1aNuwE5h62ASi+GtzZxbLki52Su6lZXqVMwZ3FreBT2jA0HeKb2AjZu8fNuYjP+1g8IYi5GqP53tz4zHpAByi3j61qDN6DnmiGB52xlFEmWy21gvxMcRTAqq34AuHsewbmCazNPfM/NM7gGsp2aCF4lBO4j+uN2xlE4cRHeLWEC6LT8YMhUBBIT+wgGez8IYDFHhbLJoVMxFctfjBM82jKVclzjJENlATyny0KQsV/6y2YCrTBIMIL7ZA94cM3aqm+ADnYxCzA292CpbVWBQlE2NLJlxiuUK9lr4rkPY9YBS5xntDvgGyO4k2WFeY0sYsWQXeoj96IDYPkapLDLv4zGjhbciRBfIfDHS1rA2tgLml76ON0MOsTn1KGa3J4IeeFuaK1jWa71U97e3grAQC44+Jj+3qkQs3hGx34uvoPdNCKZULL2jTFMHbVzOY9985yyOks+3dyNwASRVq0bXP9r4Bmx0Ahz5XntBjdoQF80EI4ZASTKmZTrZ17A+23eMtYLf+fK+XVorHPY3v8ZKbMgdR6u0UGdkIp69T15ZYpXcurLBeaJSyeGFASwjFYBsBKNN/fD7Suku9FIO5VYNkk6B8mquk1TOcyKAAxquWqDJsAZ3zvmH2GuwkKoHFyg46NZr5yz6osqP1OV/NO+HFVE+tRplblFSJvAMQVqt3qwvhXstHx9zwXkKioveRf7XLC+2u1Ua3jyZmus91HUIE230Wb5XgvvMFn9feS+QPOINpIJpOW/UhUEqUjVEiOXhVK9LKOMDI7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(136003)(39860400002)(346002)(396003)(86362001)(9686003)(53546011)(6506007)(26005)(478600001)(122000001)(33656002)(83380400001)(82960400001)(41300700001)(71200400001)(7696005)(38070700005)(186003)(4326008)(66476007)(450100002)(8676002)(66446008)(64756008)(110136005)(76116006)(316002)(38100700002)(66946007)(66556008)(52536014)(8936002)(2906002)(55016003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NVieYsJQRCDPQJoI4yGf6Y1XR1gJce7P+vrWhsUJd3ZrUDm2rNEEtSuR66L+?=
 =?us-ascii?Q?ilQ4YCPgbhO1/6DO5YyA2Fwi7fi1zljzYvG2exLQ/qQY6UKp09iopduYV6JL?=
 =?us-ascii?Q?tqKK+rXiFhZkAv3vChqb5Fx1FOmuBJR34zqg5oBkxjLD4KG5LA3tHoQePTEs?=
 =?us-ascii?Q?Y13bAIt9G65wyxxtrCdNMYEU/1GLyOk6OM6yWgh9SlEdKrUBZzmYsuUkZQFf?=
 =?us-ascii?Q?Wd5z5O7o3jQqkmEZ3nYrtgTIbBgPzbI2r9C5KTjikLEdFQ7ZluliFDEterfk?=
 =?us-ascii?Q?WFhYS/11wfGlJVdUY41WEKx5XIesS5t05FZti3WJ02ysGF3YkqBGm6CC/06w?=
 =?us-ascii?Q?PG/53xsx7AYHPOb2oEyVslqHKGYgYvVlAipd+qZNZXeQTAoCbTdfPuZbPT12?=
 =?us-ascii?Q?jdGKXOMvP/xdtbl4ctf1/FM2amNzK+CJ0C4fSClri2UYXlfbu+vvMuLYXS5S?=
 =?us-ascii?Q?C8zIg8oX10EVhtl6AajQGt9ZylC45VKb4DkbEO6RPLdWSB/qF0fnQQu7ASUr?=
 =?us-ascii?Q?+G5VvcyB2Vgv88n4GG81MaPGunLV6hh9DgrJ4LCsGPe5AcVUxUo7h5PP+f6a?=
 =?us-ascii?Q?icykCrw3ZT4s7tz7tkJ9ducCmrM+M4ISL1HJwq/Ejj/3LmnnTXWx1SrZIsYH?=
 =?us-ascii?Q?+3ezpr081+XuWAO99ehRECiZ2eZX82XEjgaZfNcK9GA3Cr5rvH18iz/fZpsF?=
 =?us-ascii?Q?MhuIlkusfSi8n/xDNBPJGKLfxROK3brbQOsKLtOzdo9ODEQXayOg0plNpA7X?=
 =?us-ascii?Q?MYIQuHslR5iDryxSdLDW7mlesetTHscMwgX/3D0vk6LpetwvXhJREPNi6cyZ?=
 =?us-ascii?Q?F5S5iXEHYDHEzFpRhG4ody6f9DcDmt/QZwf8SopbIaPZfsLQ38fQWnOTlss1?=
 =?us-ascii?Q?RHHSnwR6grKznmQt+tMMFb2EJMXARCiqZYJOBPOc0/H6sXGf4mEl5rvZM+4u?=
 =?us-ascii?Q?bFSev1/blkcQ753ydeLhsjAgEIPHQGxfE9txhDIotrpz3THDouofe+XLSOi1?=
 =?us-ascii?Q?C3Lo1w7FL3pwrNqHlCqinDTjAC2VdIoS1zUHmGz6J1XsPCQfBVvK5SZYZgsI?=
 =?us-ascii?Q?XR/gfeD7qqxwV0DSC8SAaSsnNt46aDC/K9gbT5H4RNrxoWbZcyqqmbnNOAh6?=
 =?us-ascii?Q?uPx+ME1aPiR3J8lzuIET4LfE/B4317VVpFJ8bltW4zNjHZQalyw2PTpv3tNf?=
 =?us-ascii?Q?GgUAVRih+JNeUekfNS5/n4d/9+GekkLpcNzwapNo156NzIgcHcMM/7bSaZFx?=
 =?us-ascii?Q?PWPOpiDieOIPCGdNjdAyJEUwWFdAg9vcCUtRyT+1rugP6UHFNKX3jvOVjL5Y?=
 =?us-ascii?Q?avA5gG7gXCfSQ6LfD3+TzQ/RF/zZW6pLzS1/Txd7UdN9WV3NOD0+ixuj+4y1?=
 =?us-ascii?Q?ptR2E8kXjvFokVxVfZEYDWPjoYGMVpZztwpb1c/Wn+l4OC1xm38TB36kkqgj?=
 =?us-ascii?Q?l2OVPQnfFyLrWQVqId2AHXevjr1qJhZR0Wu7oia/s30cuAbi1mG7e3GTMLl4?=
 =?us-ascii?Q?HGQ+VLXY9STZwbOHK4jPLR+4FeurRNjqfX3GAmRI4rmx1zz7r+CKA77tANCA?=
 =?us-ascii?Q?agr7K/fwtVP/DwrGSU2AOF8/sEW9Hsq/Qao4golud+2aH4C7YWK7/VxmtEgI?=
 =?us-ascii?Q?lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379076c2-852c-4ef2-ab92-08da8ae4302b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 00:03:09.1066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kaJQU99So7O37m3uT3iFLAe8nhJgY+Y5Jzr6b49nMs/E0jixu05n8AD3DaiSRVYb+G1Swr707Dlg/ocfrC9Lj4u5ZS3jikZ+9dHyY2Ccg7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3818
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
> Subject: [PATCH 3/8] drm/i915: Use managed allocations for extra uncore
> objects
>=20
> We're slowly transitioning the init-time kzalloc's of the driver over to
> DRM-managed allocations; let's make sure the uncore objects allocated
> for non-root GTs are thus allocated.
>=20
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

- RK Sripada
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a82b5e2e0d83..cf7aab7adb30 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -783,7 +783,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt,
> phys_addr_t phys_addr)
>  	if (!gt_is_root(gt)) {
>  		struct intel_uncore *uncore;
>=20
> -		uncore =3D kzalloc(sizeof(*uncore), GFP_KERNEL);
> +		uncore =3D drmm_kzalloc(&gt->i915->drm, sizeof(*uncore),
> GFP_KERNEL);
>  		if (!uncore)
>  			return -ENOMEM;
>=20
> @@ -808,10 +808,8 @@ intel_gt_tile_cleanup(struct intel_gt *gt)
>  {
>  	intel_uncore_cleanup_mmio(gt->uncore);
>=20
> -	if (!gt_is_root(gt)) {
> -		kfree(gt->uncore);
> +	if (!gt_is_root(gt))
>  		kfree(gt);
> -	}
>  }
>=20
>  int intel_gt_probe_all(struct drm_i915_private *i915)
> --
> 2.37.2

