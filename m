Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DCA73564
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D663210E8FB;
	Thu, 27 Mar 2025 15:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV7VyCzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE1410E8FB;
 Thu, 27 Mar 2025 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743088295; x=1774624295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=ywNX3W5LKlqevlM8ajWBRAVAVe8L9FPqQNAP0Z2ocrk=;
 b=bV7VyCzdNBhIfs7+ySWqPmmhOgMrlJwxdPuHvnuWBZ0M7kuGmr9aSpFu
 w5+PVknfB4AOC5KvFDAv5u8YarXx/zqrSC0uGCGxfS2Dxd7CM5Hw98Or+
 GNRMLMQ+VjvNIUgb2eqEU772w/XXQqA6rj3OnRbjHHoUiY01Xuqrmuoxj
 z5+/VEIFKFwHn2ss05sJSzva8ubb/mISYSewdfGyPURSzUVzkVhIDfYds
 a9jAeun+cRr503W7NdGrAoUl7mYl2NeHKQBP8LEgg1d8Mp658QgmBNTQG
 51KvRd2Ku8u6POjFe1LvlekDfVy8Azbfao5WfRYHorWGIuIUy7y+stZcc g==;
X-CSE-ConnectionGUID: 2lCwKL59SjW9SWec4dn1Bg==
X-CSE-MsgGUID: E5dllg37Tx2UAzCwyuQ0vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69791236"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208,217";a="69791236"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:11:33 -0700
X-CSE-ConnectionGUID: 3NYfC9cbQ9qikO/EH9dpMw==
X-CSE-MsgGUID: K5LnZIu2Q8+oO+yjenNNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
 d="scan'208,217";a="125389200"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 08:11:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 08:11:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 08:11:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 08:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8wl9zx/OJrExVodyLX0nfIA5Xw1blsBZ3WH0aY8vp47umTR2DRXRk0B+JWRp46ErsiU8SNtqbI7j8siSrNgpuNnb+aKliPHYoZK6MGhKXNzJk9jTu+QJz5JrKgd2m7VQ1tJIdw8C0ICUucVPZpO3TmW1xjY4ix9UHVWU3ItH1gni49tTHSARZIKKgSiffSZOSJPRRjR0W1RxrJ6xOYav1Hw73R2AFRgzxTuC8V0PrnvJoHHzf2YFQsG3uhbos4A53tskaMg8L/oFp+nFMR7Q03cAq405dmD0mOH3VsKCZ5sQ80vM0tS42NbvZ0KVN8TuYH1I+U29fA7yV8eFgocpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywNX3W5LKlqevlM8ajWBRAVAVe8L9FPqQNAP0Z2ocrk=;
 b=WfczC9aK8iJ+lFs6hX5Ih8UxrPHcRT2R3LOZQT4CrNpXJuZQPwTrPBbOeEziWBlpZzgJaKqO6SgsTkwya6NDL0xW6bc2Idas9zU7q5xNO05ToyLB64WOmHFL0j4RTzZ0g+f0Usr5x/N8H2lBmQrSDkS3tiED1rPyUOoWSzMV7ejpenjn2mlFxXdNW10UBVquscesvC2XjAW5jt9LeuUw0i5XteAGsoobUmuGvSmfufdXEgMXJ4YlLxJxT1zrGmBO/G7C/oIs4fgSRkd3XjD3sINTSXdFNNpynE2O6cwNrS8IUIUbPv0ijjfDS24XezxWWSNqOKoxVAaq07x4AREhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:10:46 +0000
Received: from SJ0PR11MB5070.namprd11.prod.outlook.com
 ([fe80::2698:e0e9:162a:a498]) by SJ0PR11MB5070.namprd11.prod.outlook.com
 ([fe80::2698:e0e9:162a:a498%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 15:10:46 +0000
From: "Mehmood, Arshad" <arshad.mehmood@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
CC: dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Ayyalasomayajula, Usharani"
 <usharani.ayyalasomayajula@intel.com>
Subject: Re: [PATCH v4 00/15] CCS static load balance
Thread-Topic: [PATCH v4 00/15] CCS static load balance
Thread-Index: AQHbnMDyRmk5dK9LQEW71zVvhG1RdbODhTUAgAApbACAAuCmAIAAiwNE
Date: Thu, 27 Mar 2025 15:10:46 +0000
Message-ID: <SJ0PR11MB5070CA93947629F6DB8CBCFF85A12@SJ0PR11MB5070.namprd11.prod.outlook.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
 <174289108243.28532.3277935060267794468@jlahtine-mobl>
 <Z-KLCnjl3vjHAZAL@ashyti-mobl2.lan>
 <174305817284.14046.5109974456042494206@jlahtine-mobl>
In-Reply-To: <174305817284.14046.5109974456042494206@jlahtine-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5070:EE_|CY8PR11MB7105:EE_
x-ms-office365-filtering-correlation-id: ded67c91-e7fd-4bcd-52d9-08dd6d418d4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|8096899003|7053199007; 
x-microsoft-antispam-message-info: =?Windows-1252?Q?UKH8m7R5BnJ/ku1bEZ6G9q/J28bGNvcTlXVXZcJNlHBqHtwuOKGEe7Kx?=
 =?Windows-1252?Q?A1Ik/dr53W7Hd3/wjbtoOyZoCV9cT/ddpjcyui1CgX/YNGU3Oilmr/TB?=
 =?Windows-1252?Q?7+ahyLO1W44zRFfsKJBtwsI6TiJ1Xt0YTuzbHqKCgA+69+Bsu+BnaBI8?=
 =?Windows-1252?Q?aGHI7qdvjj0G9yPLc+kSde4Z7Kr+cWTcma8zk35gk10lLvwuXz621F+p?=
 =?Windows-1252?Q?hJ3GUPcKLwMduMpAhp3oGHFMsbRV1ul2wsO+zR6/D0k9n9c6hY7UkCdS?=
 =?Windows-1252?Q?yulifKGT5CM36/PXvuX1uX5k1uFQbobMoAIRg13s0kVvu2BoH1tKD/YO?=
 =?Windows-1252?Q?XWTNPRdj7wvlfyZLutU2dPN1IePIxTdw7jq+RsVH8GwGlQk54AU+50t8?=
 =?Windows-1252?Q?dmEXJOhw8kU37xrr5XrKnNtz7f871XD99Xisxp5EZ6ZlGXon4AI/ChLo?=
 =?Windows-1252?Q?ISZbGV1X4egpKeNxEkWijGo05aTD8bFwv3QenqUOKJvtjWQdqQINSaLB?=
 =?Windows-1252?Q?oCyoQ0a1on2yrbihW1CaVIZ0cjzBdhXHd2GwZDrN9/0suLth2NNq1uRt?=
 =?Windows-1252?Q?vuPh0s4VpA+MKXkWyo6nRcqOOOFnBJ1rXSP/5T89ghYXPoMPGWKgHBHS?=
 =?Windows-1252?Q?PxJbiv4JF+SCW1f4JQdUa/l/z73YF5Td8NuP1IN77CBskHg0hqHMPQRx?=
 =?Windows-1252?Q?OBckyignuJ9DnM/xe6NZGZvBAoaGsurxz96+9lcZZA5c/PB3tUVVhIUs?=
 =?Windows-1252?Q?v9dhiXXA5QqCPu+wEc1zH/xsM2fzM/lJ1c5T8kavINUrVFZHruO6MhEd?=
 =?Windows-1252?Q?NEjKZ8BqRVxmB24Gr9ZLwe9+IUJfUpVLRQVnmz5dLNm5v+xDGUM43s90?=
 =?Windows-1252?Q?NUEeURTA6RA3skjbjqEZUN2wYaU4HriXiQOgDuAAdeg9i2xFORIhO9rT?=
 =?Windows-1252?Q?yIdZ+ICzJYBIAApVPL4+FaOIcOmpBIw3mp755yQOMlCeOz38uUtz4EMe?=
 =?Windows-1252?Q?D+JP9tAlMfw9afTfFkB0GBfYuKCZwPpG5FczLo5cIZmPH9VTxxcDXCeL?=
 =?Windows-1252?Q?t+R56NXGYOWi86W0ZViXHYFzZC1fcvbnjGUYFQ2Xc7X6XEwC+KOPKmsv?=
 =?Windows-1252?Q?d8PvHhCk0XCitJqqfwQJ2UVmA6U8AgdW2/0aSPhmPhsya0EtJvraV95b?=
 =?Windows-1252?Q?pSgaUUDuTC3f2QjRusLBOJe0u4CIGhjR3sSJmNHqwecBDj5mGChfjr1q?=
 =?Windows-1252?Q?LuszsowOfAjD4npTKubNGlY6pnBeaBNI5ZrHCW9rad3TGLpLwrB3dqJU?=
 =?Windows-1252?Q?+Yp8eq0Lkz8c90dpagH96TlF0EVmZxOmKokzkFRCfI3RXO+Cb7CCE1R1?=
 =?Windows-1252?Q?eG4cQDk3rRshrRMrZHO8fCIGYAaBPGzBzJPcDKOlQ8+ih/sxUXcSikYT?=
 =?Windows-1252?Q?r+/87QkWS4uCmqKNsID5ERKWi9uR3qwQfW02hv9qAEHHBQuwaFqd6UyB?=
 =?Windows-1252?Q?agQKr4cc8lV7mSsy7rEur32BrLzM7TuazxQmjFg1t64P0PDY1UOAYo1P?=
 =?Windows-1252?Q?l9ErYVsc0Swp2ALR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5070.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?DVTXE3Zv2kKeLk0mGaMbfIzjZDNtQD3TNGqIISkOUYAZxkIxl/Kj/Y3T?=
 =?Windows-1252?Q?UOVYxy4hy3ZKVkk98TguZBNzkajOluj+oikZ5ktzXUJFo59gzxHyPttZ?=
 =?Windows-1252?Q?URbHfgux2TYpELcOyVttFRNEKOGP8ODo/N7Ayihth9J7EwbyodPCLBNb?=
 =?Windows-1252?Q?oggLZrW51pBPasshIGvJ7N5rsvNZ6JU33Z6UI7Y5KQXq5FF3ipeBx57o?=
 =?Windows-1252?Q?gwmgHevsBnGTjUcSJb6sO2uYXgkF1tDhVNsvkrvkhm5Zsye/0iJoJ0T+?=
 =?Windows-1252?Q?7bQQWvUQR2Y6CUy9Ql9J95t/p7Nn4h1qfNcgh9G9ap7DYsqj6oTR9KHj?=
 =?Windows-1252?Q?9kMsJDFLzP7/kTTuOnxNM5p6bzYb7rdTTVpjrltelBRuzmuAEsCrHqe/?=
 =?Windows-1252?Q?r72XTziPfba9luFkG7VzDivkAiOfCzJDyVDjmgAhHxXBcv4/fi6OX5wa?=
 =?Windows-1252?Q?33Bh4fsgPz3+Kv8fFhKMdtufuMZ64RJn/B1Pz6SVpNiewDBIVTHEQUYa?=
 =?Windows-1252?Q?jve77pv2mm3aN0llTYtZw6rrPbVYJwZ5Of3wBK9Joc/CiaZrrbUNX8qZ?=
 =?Windows-1252?Q?P0/4HrJDbelj2FyLj5W//yruB8R1rJ49j0JlfvkWw0V+gfhYxUBhMxt2?=
 =?Windows-1252?Q?y+KOrcYPiUKsCB2qXhAhPkJdUfccDuhaTJZ0T5g0lvweA/HthAZQlq63?=
 =?Windows-1252?Q?LHWXus22VvsX9TSXJO9RHxf3TkR2g2LsCJ4uSMlt8o42UQ9CxTLZgh8B?=
 =?Windows-1252?Q?fyLTq2iCvXCsdKSvpNdw95dXkYp577RiirO+AOPFEa++vH39+iRhFHLY?=
 =?Windows-1252?Q?4XNxZ/kXU7bhJWguPRrNTQA5qHl2IaPwKUhH9NNVXg5zYe8RzKgNNJ0y?=
 =?Windows-1252?Q?3YcxnHJyLIz9BNtoxMeUn56Ehrlj0UUQPSz1bFdTGeuUWBNWct1+zmR6?=
 =?Windows-1252?Q?8roV6z1sN895edn01Yqyt3G8MXuHvjwvZ1S3JXX7qXK7kDsKYre74sfZ?=
 =?Windows-1252?Q?jHII0CBr/h8TirMbr3NmZ3Z0CSdAHNvaxcChDKxaKJUOnf+3ZqRt1UIr?=
 =?Windows-1252?Q?vV6Nrnqb1HII8IgSF1OwbSkge/5KfqaKYwchHxBNzco2+ZIW2y9YngOI?=
 =?Windows-1252?Q?jKyofGGy6xoctWqKzNij2BUMkt6yFMwrs/A2vSrwz/xLOo+sS8maj57H?=
 =?Windows-1252?Q?rhjiAYNx6WzvY40pFmjXupAKXUW+iyrg+63bbdiEmVobSrQHfVKrOG1N?=
 =?Windows-1252?Q?DjNhh2qynGGZMZbOyoDWkNB/SPV3SMDhozlLK/IH9T746e8RBKVpao2n?=
 =?Windows-1252?Q?dzJnYi6sZTo0kN/QdwZB92s4X7n/4NlXUbdOMEsl2O9ffZoNQkvQF6Xx?=
 =?Windows-1252?Q?WiiZTuT5p2NCjahyl0Lxul9qocIjTsVNtNPZfmZ6tVJE53vxTrWpV676?=
 =?Windows-1252?Q?e96RHMKYCKRp+BFC/Eog7f1xOqovCBXTzJD+cbHVCjohFbPUCU22b9Tf?=
 =?Windows-1252?Q?IOUTdTnrOH/g84pREijtuOLAFQLltv6mafKnA4Be7wE35jQH7F5CpE5z?=
 =?Windows-1252?Q?F3cbq1pDXX1xwjMqlfoISHVps3LYgBdczvUTLtnpIrDxNiG15AYvCDy5?=
 =?Windows-1252?Q?cVMuvkWSg5rvby/OzStDvJRPDxR6tVPZ4/hdrZG5eRK9HulJh5y4rSLr?=
 =?Windows-1252?Q?gcBgh3OC6pBSEzj8a53H7gTKAl/0w22M?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR11MB5070CA93947629F6DB8CBCFF85A12SJ0PR11MB5070namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded67c91-e7fd-4bcd-52d9-08dd6d418d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 15:10:46.7274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKUNH1YUicKg3Oi1NFZxgGZ23/cDewrfk83HYJYCd0As++UAwW/i4sQGCBg34kvZ5HS3kmrBHLZB3Pw+XhKYgiIN2LcLtkXr/ybvAFT7nww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
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

--_000_SJ0PR11MB5070CA93947629F6DB8CBCFF85A12SJ0PR11MB5070namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I=92d like to provide additional context regarding the necessity of these p=
atches.
The shift from dynamic load balancing mode to fixed mode, with CCS usage re=
stricted to a single unit, has led to a notable performance regression, wit=
h workloads experiencing an approximately 10% FPS drop.

For example, on DG2, the ResNet-50 inference benchmark previously achieved =
~10,500 FPS in dynamic load balancing mode. However, after limiting CCS to =
1 in fixed mode, performance dropped to ~9,200 FPS. With these patches, ena=
bling all 4 CCS units via sysfs (in fixed mode) restores performance back t=
o nearly 10,500 FPS, effectively matching the previous dynamic mode results=
.

Given customer expectations to maintain prior performance levels, these pat=
ches are essential to ensuring workloads utilizing multiple CCS units do no=
t experience unnecessary degradation. The proposed sysfs interface provides=
 configurability, allowing controlled re-enablement of all 4 CCS units whil=
e keeping fixed mode intact. Since fixed mode is now in use, having a confi=
gurable approach ensures flexibility to address different scenarios that ma=
y arise.

Let me know if you need further details.

Regards,
Arshad
________________________________
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Sent: Thursday, March 27, 2025 2:49 PM
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>; dri-devel <dri-devel@lists.fre=
edesktop.org>; intel-gfx <intel-gfx@lists.freedesktop.org>; Tvrtko Ursulin =
<tursulin@ursulin.net>; Chris Wilson <chris.p.wilson@linux.intel.com>; Simo=
na Vetter <simona.vetter@ffwll.ch>; Mehmood, Arshad <arshad.mehmood@intel.c=
om>; Mrozek, Michal <michal.mrozek@intel.com>; Andi Shyti <andi.shyti@kerne=
l.org>; Ayyalasomayajula, Usharani <usharani.ayyalasomayajula@intel.com>
Subject: Re: [PATCH v4 00/15] CCS static load balance

Quoting Andi Shyti (2025-03-25 12:52:58)
> On Tue, Mar 25, 2025 at 10:24:42AM +0200, Joonas Lahtinen wrote:

<SNIP>

> > Do you have a reference to some GitLab issues or maybe some external
> > project issues where regressions around here are discussed?
>
> AFAIK, there's no GitLab issue for this because we're not fixing
> a bug here; we're adding a new sysfs interface.

This sysfs interface was exactly designed to address performance
regressions coming from limiting the number of CCS to 1.

So unless we have a specific workload and end-user reporting a
regression on it, there's no incentive to spend any further time here.

<SNIP>

> Arshad and Usha can definitely help if there are any technical
> questions about how the application uses the interface.

I don't have any technical questions as I specified the interface
initially :)

This is not about technical opens about how the interface works.
To recap, when we initially implemented the 1CCS mode, we got active
feedback on the community on regressions.

We were careful to verify that all userspace would cleanly fall back to
using 1CCS mode after it was implemented. And indeed, nobody has been
asking for the 4CCS mode back after the 1CCS mode bugs were fixed.

So as far as I see it, there are no users for this interface in
upstream, and thus we should not spend the time on it.

Regards, Joonas

--_000_SJ0PR11MB5070CA93947629F6DB8CBCFF85A12SJ0PR11MB5070namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I=92d like to provide additional context regarding the necessity of these p=
atches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The shift from dynamic load balancing mode to fixed mode, with CCS usage re=
stricted to a single unit, has led to a notable performance regression, wit=
h workloads experiencing an approximately 10% FPS drop.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
For example, on DG2, the ResNet-50 inference benchmark previously achieved =
~10,500 FPS in dynamic load balancing mode. However, after limiting CCS to =
1 in fixed mode, performance dropped to ~9,200 FPS. With these patches, ena=
bling all 4 CCS units via sysfs
 (in fixed mode) restores performance back to nearly 10,500 FPS, effectivel=
y matching the previous dynamic mode results.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Given customer expectations to maintain prior performance levels, these pat=
ches are essential to ensuring workloads utilizing multiple CCS units do no=
t experience unnecessary degradation. The proposed sysfs interface provides=
 configurability, allowing controlled
 re-enablement of all 4 CCS units while keeping fixed mode intact. Since fi=
xed mode is now in use, having a configurable approach ensures flexibility =
to address different scenarios that may arise.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Let me know if you need further details.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Arshad</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Joonas Lahtinen &lt;j=
oonas.lahtinen@linux.intel.com&gt;<br>
<b>Sent:</b> Thursday, March 27, 2025 2:49 PM<br>
<b>To:</b> Andi Shyti &lt;andi.shyti@linux.intel.com&gt;<br>
<b>Cc:</b> Andi Shyti &lt;andi.shyti@linux.intel.com&gt;; dri-devel &lt;dri=
-devel@lists.freedesktop.org&gt;; intel-gfx &lt;intel-gfx@lists.freedesktop=
.org&gt;; Tvrtko Ursulin &lt;tursulin@ursulin.net&gt;; Chris Wilson &lt;chr=
is.p.wilson@linux.intel.com&gt;; Simona Vetter &lt;simona.vetter@ffwll.ch&g=
t;;
 Mehmood, Arshad &lt;arshad.mehmood@intel.com&gt;; Mrozek, Michal &lt;micha=
l.mrozek@intel.com&gt;; Andi Shyti &lt;andi.shyti@kernel.org&gt;; Ayyalasom=
ayajula, Usharani &lt;usharani.ayyalasomayajula@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4 00/15] CCS static load balance</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Quoting Andi Shyti (2025-03-25 12:52:58)<br>
&gt; On Tue, Mar 25, 2025 at 10:24:42AM +0200, Joonas Lahtinen wrote:<br>
<br>
&lt;SNIP&gt;<br>
<br>
&gt; &gt; Do you have a reference to some GitLab issues or maybe some exter=
nal<br>
&gt; &gt; project issues where regressions around here are discussed?<br>
&gt; <br>
&gt; AFAIK, there's no GitLab issue for this because we're not fixing<br>
&gt; a bug here; we're adding a new sysfs interface.<br>
<br>
This sysfs interface was exactly designed to address performance<br>
regressions coming from limiting the number of CCS to 1.<br>
<br>
So unless we have a specific workload and end-user reporting a <br>
regression on it, there's no incentive to spend any further time here.<br>
<br>
&lt;SNIP&gt;<br>
<br>
&gt; Arshad and Usha can definitely help if there are any technical<br>
&gt; questions about how the application uses the interface.<br>
<br>
I don't have any technical questions as I specified the interface<br>
initially :)<br>
<br>
This is not about technical opens about how the interface works.<br>
To recap, when we initially implemented the 1CCS mode, we got active<br>
feedback on the community on regressions.<br>
<br>
We were careful to verify that all userspace would cleanly fall back to<br>
using 1CCS mode after it was implemented. And indeed, nobody has been<br>
asking for the 4CCS mode back after the 1CCS mode bugs were fixed.<br>
<br>
So as far as I see it, there are no users for this interface in<br>
upstream, and thus we should not spend the time on it.<br>
<br>
Regards, Joonas<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB5070CA93947629F6DB8CBCFF85A12SJ0PR11MB5070namp_--
