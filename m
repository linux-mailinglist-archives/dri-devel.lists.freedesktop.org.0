Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4628D38E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8310E7F5;
	Wed, 29 May 2024 14:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nduEP+SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A348110E2FB;
 Wed, 29 May 2024 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716992040; x=1748528040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CSaDLDvztVP0uP0Z1jgYQdvILnu797Fns/Rg047w/c4=;
 b=nduEP+SWp1AX6rf3ulhfmnWt3zAaca+/jJfeH6lFTdoZheAlFbnPZdCg
 FGCT7ZIsQkVfo7FrPh1ykPX1rSLXStVsHGDANwZmM5ATCm84jdaaDexIp
 SZ+W2JaqUckwEzhE2U6Kfh3/E7Tpb4KrCo7OiJbCFmvG0JYizFN+cBtkX
 fUrl261fJ80LaFj1Q8Eu3P1uI+DpMNvtjTiPAVsUKIU+xRJ5P4p0mdEt2
 9jNszLBpL3+jMlNsHYnQ+bmgneKFupRR6QlTqWG4u0Ddxh2USrjpx6xXP
 GyhHcqSW8uMM8WkQ9RAeOjQqApEK2E9RdT3IyRHP1bmsvQMqKErL+Igd4 w==;
X-CSE-ConnectionGUID: SUoi5dTmQ/mOyCWwXhnvJw==
X-CSE-MsgGUID: bm+UWrl8QpCPeigUbdbi/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17230912"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="17230912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:13:58 -0700
X-CSE-ConnectionGUID: Ku1H5dRbQxOpLVru/E9xpQ==
X-CSE-MsgGUID: SNMOGtNbQ5eTgHKI6qJoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35396192"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 07:13:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 07:13:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 07:13:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 07:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAe+IqhnH7fMbw5eSbPMQKokkkfciiYGjkBMzdJUndbKSi4t14K7Y2BKSg9h3peSEsNh6P71sMLf7+Dy+FB2hLipPnhDbVAonFAW76E4wp/tQh6KJNE2vnygNBo/VZYsfLQQ19WPCbntwiIExy4z/55QNNfHA35ZAKAUTG97/nTEzn1VgPow4fLA5VII45n4L6t5GQTZqTp/LM1LRbbI7tusm7D2dKSm01/bxm+OWhhyWifdfosyMAbsPAQ4uqbmUKIZwRWN3T2b/IcnzpWDTt1ZJ9xlCSqMMtBeqoE4MWJj62FRhwuofCFiuBMdbX279y1uBjQ850w+unvAB/dvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mwuzl4FibEVOihxSYaw1tGldRuONpzrhWZ3S1rD2AEg=;
 b=jgSzdRpsfi3XQwApt5L6q9T41nFiDU+icowXVgGaW0J0eExqW5Gg8UNuG6ztXcOw5TGS4UAbM3ikEkFyksD7Q7fd+FIN0c8WjPcgVPAX2bPGCikdrZ31YP8fEJ1WiNTENaGuSoseCnjEEDXVgdd5fGTG2f9xqR3Q6xn8Mxu6Cdhjoh8Pe2yxvgjVqFNOZxs6nHqfRZwV3DNNwE5nIPDLiwLKgQrLe9HHbdf9DlMaNYrsM1JPcG+aUax04wWvZtCiN9poIn4zUKH9R7GgeRNkjwiTvkG7FCT1RInXOTWEHw5Zt5CGKiBjkUStkd99v1yBTTo9Y+Ws+HPpiNwSGTRPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 29 May
 2024 14:13:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 14:13:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andi Shyti
 <andi.shyti@linux.intel.com>
Subject: RE: [PATCH] drm/i915/selftest_hangcheck: Fix potential UAF after HW
 fence revoke
Thread-Topic: [PATCH] drm/i915/selftest_hangcheck: Fix potential UAF after HW
 fence revoke
Thread-Index: AQHasbzIYQ6kcXgo40K+b2WkXWMtGrGuP/zg
Date: Wed, 29 May 2024 14:13:53 +0000
Message-ID: <CH0PR11MB5444D49736919E207064DEA0E5F22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240529113809.145084-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240529113809.145084-2-janusz.krzysztofik@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB8299:EE_
x-ms-office365-filtering-correlation-id: 3eb0115d-214e-44c4-ae46-08dc7fe99225
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?QfgFybSV6Xf37vAd8bsx8a0ISq9P44yjvWZGAy0g8cthzgSp6ZX/4tjAX1yg?=
 =?us-ascii?Q?Ufz0fycZUMUpRxt1+ylcgjmVYcNs9I6HSuNfjtr4bKCFxRV31ByYOoQ5rDVO?=
 =?us-ascii?Q?mr+6TOEhqpqXFAFA5fslv1kG907oLbGBstFb++0TX/X1U5DsFcufreDa+8bz?=
 =?us-ascii?Q?9nb9pxNyVunV0tki3Y77szj1+/kEXCpsTvXcezlikmaippFFRE7mJGrWEbQ0?=
 =?us-ascii?Q?9TZIHFgD+lCyY/VF5qNgK3/xhvCXk/ZBmzyypMx/kvb8evUsQL1fy/dPUZ7A?=
 =?us-ascii?Q?RDH6WM4J5YMZU59VNjDmOv1G6kPTH/6LHZ0r/TLYJ+ulzTFkBg/styToFulR?=
 =?us-ascii?Q?KDlnygBGf1fO/MWv67aTZq1Q7tJweux3oaGqOSd6PnxUT3srUJRRLUrWfvSB?=
 =?us-ascii?Q?bj0mVuMI033x6yzePy+CKCKVK1RXU3D4S6iMnFjY2b9f/NhksWXQIiVxTVzG?=
 =?us-ascii?Q?89KbRY6jESv2aiMHxjcoq+ckx50OE8M7NVnvbUpxrXZ9X5OBPYEmd/7yJ8MO?=
 =?us-ascii?Q?1wbsEd2U++Qzqt+uIujKnKBULTM/Av1B3cFhpKEU+6HeLEoKO8TeO063HxUj?=
 =?us-ascii?Q?Rr1Fj3SaDnQvccrDPlXWrIVBaoytPZVFmPaTtmWER9UN9YqafYKhnYo1c86R?=
 =?us-ascii?Q?x23aHvsuapD3kXLgHgzrjbTR1R99M0CPigUVYZZBp9h7Xxw9Ply9sm6J4dwE?=
 =?us-ascii?Q?5El0fL2l2g2UxghkxxXbRSMBaiTdlPFdzcMD6D/Ja4f0BN8lMFMTe/6OuiBR?=
 =?us-ascii?Q?V7IXLo/Umduc7/g7iZvApa/BIULG1pY8Kh79Na28ssERzCDVh0vvBE9CoK22?=
 =?us-ascii?Q?ceFVBRDZuyxYWm2YMnsCtgdNmbp/OmPJ77mIlZFtKCAjuyOoWmphyWY6zTaC?=
 =?us-ascii?Q?7xL0mmEg9J/Bvhl5v+UuJEDV4NGh0IeL2dEQuyJ2/9YV2UXDoKKlfd7qlDt+?=
 =?us-ascii?Q?u2hfGT2Jcdu/Nh1g/D+pCoIcXJWhm+NQCek5dh9ARtN0DRlKXu6UwNoAg0OM?=
 =?us-ascii?Q?BRJaCNAdlEB/ap3jHa6TkE4creOTZ0wv1Nn/QYHXx9x+EVPApXRN+RBJTpGF?=
 =?us-ascii?Q?77jAXA1RmKd5I+qqAfUJYvRAjn3riYb4Z16ok9PG9m8vZz6xF8UNRdz+zAsQ?=
 =?us-ascii?Q?1Nx2jdWuUYYxKJz9VqsgSw+6cXtlSVVjKmBR19HXBO12yWOaZpYqyE9TpXAC?=
 =?us-ascii?Q?hSC2pjbVs6gCJx5D4VDhk+jtdyQKkavf+Af7XcDrNw6MPjs38GruOFInvQzD?=
 =?us-ascii?Q?yuaLEGEXn0x5fEUCRzi9VUYxqYVV3/UlTuxtZQ2Yug=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?47+wtn9hMwynR1Sm71nYsvxNo+4x+WyLuC62zy2JHT6DWxwLUVXo+j8Zyo2I?=
 =?us-ascii?Q?xmqZGnSYRuulFd6/3Zv+WW5wYQCZSmwc7dPAnDU8/NmQFoSL0FWz7M6WGFBM?=
 =?us-ascii?Q?yhxlb9yRsKZx5o1nBAuoI/RPt261LDqeH33YeVFZpnQrFon9hm+HJA4BTliv?=
 =?us-ascii?Q?xf7r/spRhvgJpD2Uhyf8nOLp6/1pogFF0APOnPACAZvWX2EeYfX+ReVM/Ex0?=
 =?us-ascii?Q?Y7EvzYuGC9SFYCvM7QZcGswdZBgNsLof0cF/PnpmCiLMRxZaru3JuDEPduwz?=
 =?us-ascii?Q?5N/M5l6r7+Qcz0RzffQ30nuKEexnm/7JjY+VrOZM0lTV/VR7wNPR2cMvGz8m?=
 =?us-ascii?Q?UVtmoK+Pl4l2e2Fa3ewSKqG/6u190LDif22aDy4pz5RyXEJVUNXI5j9cjB/W?=
 =?us-ascii?Q?kmDyf4lqpWtPKOg9OC232U9idUO50zGCtOLUhEXVXs/W7WDgD1LKtv1BHqpO?=
 =?us-ascii?Q?27n+74ZdysjqXSslORPweRQ2C19G7fFOm5vK1COwj8eISS77THHXor+KyJNS?=
 =?us-ascii?Q?qD5V0CDndEHQHZy52v1Nd9kKqSOQ7j2A7mNxDuxgBOEo4shv3FQEEZ4lZYWc?=
 =?us-ascii?Q?onA6oScLjV9W/nETuiZyvS/T4uSuWldPZ/PhL/WHIeV8Z7cNyImcp4qEAWEF?=
 =?us-ascii?Q?iJBKf8rKqBoby3IICul+Kzl9wlhaqJxEpzvTK9KP+fGsXrtvQnQJE8h3t9B0?=
 =?us-ascii?Q?7QL5OfFs1NuuXhhrUtipsjoI2i7TSql93hubmY0qziZOz2cDRvWFzN0D6Heq?=
 =?us-ascii?Q?Yp8gx59BdLIZ8uAB7Bn12hfL+Nd9ADl5rRTclc7VX1t1nRXw0Gm9nAZ8HVlp?=
 =?us-ascii?Q?FEdqY+Gl32+TlEuxGu1dyPuEBIRuqz06Ppzcj8nV6UTOC8UNb46ilI1DwY29?=
 =?us-ascii?Q?Ye9fGiPZjk9/67nTVU242bPoGtIDJtP//nFaRB2CXu9dRAmFogdXYTQcRuUW?=
 =?us-ascii?Q?De3dHP+/2f7wo+4NPXnFl0aTitpyiGujsO0uTgKG8Yfb1qveZmQLjHorGYR1?=
 =?us-ascii?Q?wgMBCQu96jMu7TzLHDk3qlE3Wev+zfO4hXfS6yLGIkg+0YK+K/aQQ4+hgHfk?=
 =?us-ascii?Q?dIdGo5BlmwGoPogjXbHDf+uiOI7Z/0nmYpwUGzW80+8LXQYRDkgqnHOitB/8?=
 =?us-ascii?Q?dKRI8+jEwcPi08nsGwTSS2vSQh5mpKR9iGDj5FOPVaES0wnThox+scq5lGFp?=
 =?us-ascii?Q?IWDXfuJcksU2mtoSMZf8xqnVpl1Lp8b3xte7wkHbq7gR40jtZ/VGNiWg7MPz?=
 =?us-ascii?Q?HLzs8ZokFLaXXPi/T/f5P5nx9vlFXVxRqANKqNNDZUNEbltx9rnNWnfqH4Ka?=
 =?us-ascii?Q?vo9Lca+chcVDwOXrrlAuKPFDRk+chXTV9DFBpeBmZIaAiOViOyffpcQ0NmCX?=
 =?us-ascii?Q?juoWYoDTfk85HaUjLklruVjRsv9UzWoReQ2g4TPBJp7WTnWPkiNL1qZrNNbq?=
 =?us-ascii?Q?QHfErb7XrOnbkBqazGXeRTEnUAGJPpefpEHAuu2uJ15IlDzJkgJx8mpNi1Hv?=
 =?us-ascii?Q?rdct8EL8Pqun9yIllLYxwQjTcOiFQr13R+lMAso+qd0Wh00ekrLmoaYD/Cc/?=
 =?us-ascii?Q?k1Q2NV2GZn7SnParxCtYpB3UKWzfz99F7+puQ7SR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb0115d-214e-44c4-ae46-08dc7fe99225
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 14:13:53.5621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xbk9bnD6ZKOCh+n5bW+Gp6nbdxJEKLwdbZfK9ZKI5dO3VKEWErvcZDwrBJVIa3fOul6U4UiItLlpS/zwc+11Trll2ODvf8GRg8B1/N6pYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
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

-----Original Message-----
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>=20
Sent: Wednesday, May 29, 2024 4:37 AM
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org; Jani Nikula <jani.nikula@linux.intel.c=
om>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodr=
igo.vivi@intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Andi Shyti <and=
i.shyti@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Jan=
usz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/selftest_hangcheck: Fix potential UAF after HW fe=
nce revoke
>=20
> CI is sporadically reporting the following issue triggered by
> igt@i915_selftest@live@hangcheck test case:
>=20
> <6> [414.049203] i915: Running intel_hangcheck_live_selftests/igt_reset_e=
vict_fence
> ...
> <6> [414.068804] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
> <6> [414.068812] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
> <3> [414.070354] Unable to pin Y-tiled fence; err:-4
> <3> [414.071282] i915_vma_revoke_fence:301 GEM_BUG_ON(!i915_active_is_idl=
e(&fence->active))
> ...
> <4>[  609.603992] ------------[ cut here ]------------
> <2>[  609.603995] kernel BUG at drivers/gpu/drm/i915/gt/intel_ggtt_fencin=
g.c:301!
> <4>[  609.604003] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> <4>[  609.604006] CPU: 0 PID: 268 Comm: kworker/u64:3 Tainted: G     U  W=
          6.9.0-CI_DRM_14785-g1ba62f8cea9c+ #1
> <4>[  609.604008] Hardware name: Intel Corporation Alder Lake Client Plat=
form/AlderLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
> <4>[  609.604010] Workqueue: i915 __i915_gem_free_work [i915]
> <4>[  609.604149] RIP: 0010:i915_vma_revoke_fence+0x187/0x1f0 [i915]
> ...
> <4>[  609.604271] Call Trace:
> <4>[  609.604273]  <TASK>
> ...
> <4>[  609.604716]  __i915_vma_evict+0x2e9/0x550 [i915]
> <4>[  609.604852]  __i915_vma_unbind+0x7c/0x160 [i915]
> <4>[  609.604977]  force_unbind+0x24/0xa0 [i915]
> <4>[  609.605098]  i915_vma_destroy+0x2f/0xa0 [i915]
> <4>[  609.605210]  __i915_gem_object_pages_fini+0x51/0x2f0 [i915]
> <4>[  609.605330]  __i915_gem_free_objects.isra.0+0x6a/0xc0 [i915]
> <4>[  609.605440]  process_scheduled_works+0x351/0x690
>=20
> Since no other tests nor users report that issue, I believe it is specifi=
c
> to that test case, which should just wait after reset it triggers for
> actual completion of a request that it forced to claim using a hardware
> fence before it releases allocated resources.  Fix it.
>=20

+ Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10021

> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/d=
rm/i915/gt/selftest_hangcheck.c
> index 9ce8ff1c04fe5..b47c99f38a525 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -1568,6 +1568,8 @@ static int __igt_reset_evict_vma(struct intel_gt *g=
t,
> =20
>  out_rq:
>  	i915_request_put(rq);
> +	if (flags & EXEC_OBJECT_NEEDS_FENCE)
> +		i915_active_wait(&arg.vma->fence->active);
>  out_obj:
>  	i915_gem_object_put(obj);
>  fini:
> --=20
> 2.45.1
>=20
>=20
