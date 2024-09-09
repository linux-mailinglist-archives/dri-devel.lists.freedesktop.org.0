Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E197153B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 12:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6210E36E;
	Mon,  9 Sep 2024 10:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZCxKHZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9FC10E36D;
 Mon,  9 Sep 2024 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725877443; x=1757413443;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jCrn4pnzvg+/M5/ANFQAAspK6qRGKjoaiy4DP1HBs4Q=;
 b=bZCxKHZJ8O6Pa6Eac50RYJcFxKJtamI8JT8hI06lqV3ROKNj8GbUjL6B
 iGlphvhSg4RMBBETz5o7lrnRes07//GZimsYI+JukYfMWetlqvQzaoSXR
 UGDnO9UrQCo0ECoRQYQ9QPjb5/B1VYQcrMpBp6ZMVD1fCeEzruzezGzch
 Lz4D5n5uaem+eKjWWv9zirxeduCRzXLdtKhBHOqsgwRjZgl2YiSUx1r2v
 l630rrflQuJGRRHqzNP7o8pci4ShFnsM5laiIynlWaHmaVc4aYQHRgDyW
 WG7Kkftu8NA2RBj51TzOsj2GhH1lfgum1nIgiQbPoa9mS3T6yq1kdGP54 A==;
X-CSE-ConnectionGUID: oVZe9JlsRM6QOymM33/IlA==
X-CSE-MsgGUID: U1zKFf+2Rw6CR/T/BmMXyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="13437645"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="13437645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 03:24:03 -0700
X-CSE-ConnectionGUID: PLiNJze9SVyizRcQuWqWyQ==
X-CSE-MsgGUID: pM/MRyZxRHey0LIgZ33G1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="66933733"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 03:24:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 03:24:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 03:24:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 03:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+7R5eTtCE13POZRocxU6VFqKa1f+sJHxEmwjKFSOir03SqVttBjG1/jSaAQomP+zR2wY5KFTkLxjJL9bj+Wmi8UNCtieFrAOfFV+JXMG5pTiFzp2cd3DJLwl5QjfC508oRWGD7O9Nd8TyDaPztVEbUCdy0EQA/EXs2QcTc+CZnhO+MC3/j58IS9trlPh+10wYcsMlxH8ajMKa+UPEEBb00de1g/0ZOzmF4AsW9B4sFbL1owFNqAliND1MjwxDsTZjqLcpcFsR3HcNNh2ufn4D2SelzevdUPLABzvzaJlU76E5L2TFZj2pw3ZEFGg+ZFpyhDy6cnrPi8xR3CZBEf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgWEndxyVnYLLWD0oL/xXqxF7tvZWcVBJDUN77SxaUM=;
 b=HcxNuB5MQtxKppdvgnU3nwElOjLxP6VMCKu7tkSAQB9iG7HlqcDBIvvsSMsVeQ4/DcmKcW/ukiYgSg859zoHMYxBO8xctPyDcfrAthfX5O8dZWKxv9q1GS/UVw7NWhnuJAbKGD8iUnCQewlOuCka9WqpESIAkFdPiZ9jggSQilDVbdl/79RwUt+YGdLtNdav/O86H/9eQJmcRjxs66DyUxQHhYYahVG2to1yFSdRx8VX1DgvY2XgyO74UMz2rN7DTEhjAdMEXOsOHd+CRVOrj9qjAUIMQyphExBa1BcwEXMjSPOkj/Wb56X61D8hrxBl0DTQpnRsC3grmBwOXlVc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 10:23:58 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 10:23:58 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [3/5] drm/i915/display: Enable the second scaler for sharpness
Thread-Topic: [3/5] drm/i915/display: Enable the second scaler for sharpness
Thread-Index: AQHa0Q5E52S3Rty1VE2fyIdEWwyoTLI/jHCAgBAPWtA=
Date: Mon, 9 Sep 2024 10:23:58 +0000
Message-ID: <IA1PR11MB64671EC159C1EE038B269F50E3992@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-4-nemesa.garg@intel.com>
 <IA0PR11MB73074677799E85AD887310C4BA972@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73074677799E85AD887310C4BA972@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA3PR11MB7434:EE_
x-ms-office365-filtering-correlation-id: e90e696a-f73f-40f5-a77a-08dcd0b9843c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QCpIt6lKqNyJZBfq/adxge8g2kUJ8aVvi7v+H9ei3DwN4DVAXAnU+7B6tv3R?=
 =?us-ascii?Q?BO73f7MhyJaTYDf9qOTszJufzyEhMkx7xzHC6zqnqcSSkNpw/8qChEJf0svf?=
 =?us-ascii?Q?DzzrNFBpPERlhAuhZv48KVp3go6DuQ0y/WMemrO5cVo1mXD2jrNBJyuJ8wq9?=
 =?us-ascii?Q?5tOfGtiOj9nBEcvwwo9ego91enQQDKW/O6xoVZm7VCuFpiq4uSVr2UPrkcgK?=
 =?us-ascii?Q?gyGGc6G53Q/0Xs8Z03fAtKRhSSl4s5jEuzvBeYurTqbcpV8A/VhThw7iRo2M?=
 =?us-ascii?Q?Sad6EhYkMyeEWYwxiQAP0Q1WVBguOEBalMipQIdVQ9eTU1JyBwU2DoDp110R?=
 =?us-ascii?Q?d+6F9WshJ8RBFcdo4aJH6OvsBno5tb26xQTyKIFXCBs178QZa7fLp20VS5eB?=
 =?us-ascii?Q?ubWepwTAbYdilKmtE4TdatGVvxN9tJmM4arMrt78ndvxoEeUIYGTchB1FqeQ?=
 =?us-ascii?Q?TJKXg18T6cdpca+7JwVe5EwKlrYo9pHLgXZn+uJvG/wlpOosCt8wq45dABo1?=
 =?us-ascii?Q?9bwvvg4AnjVDgqMebh0G+RUiF67wcW/iuSdLnv1zWKlPE1WTGj86LGJLddiC?=
 =?us-ascii?Q?tdg3ewA5BCcW8V2LP79P25jv+o6O4k5IGjmzfImVFVynb9XOdEeRG4tcHrMh?=
 =?us-ascii?Q?bBVW4tyvKq0Fz6icVTIuqsX5vkFmBDKGTYOVUpDwbfV9tlqxoABGASRcQzlu?=
 =?us-ascii?Q?F+uqfWFHCCNKML0/iOLZPK8BR020z6iU1FUpjbpwyByTAXnLOzxWLNodhpSU?=
 =?us-ascii?Q?+35SSW+hy3hDpLfuKAiDQ951Nht7PRTaho7AXSUvqwnqQCiNI9Hg4RwmZoRu?=
 =?us-ascii?Q?WGFabkOXP43bRxcaztcraPZEJAn8ApqIWazmYm/zbXamZRtwgSbZaD/zacYT?=
 =?us-ascii?Q?OknpDkY83voz1rspxYTJOwFXxG4YqXuBrkMZK/q84ZOOXyOgakL4pkVPDv2I?=
 =?us-ascii?Q?G+seRmDGw6r4eCHWq9LkQqI9jxqXk/OrtpgRUaBw/90sxTEXLcHBFbudOQb/?=
 =?us-ascii?Q?Y49rVUQzBycVgtaML8Ix65wiL2E3dR4WLQX0Jz+Ad9k4vwHaDY2eKFKFYpWO?=
 =?us-ascii?Q?mOhsr3RIWees2tC11PesXCZoAEttqeLCxuCYkIvchy4wZFXyrl/GjUWhxOWG?=
 =?us-ascii?Q?OgVoSFQsC3QuNO6NHldBbwvpta3C4OmWUQes1ekLmBTzwDRTQlxtmi8u9Hvn?=
 =?us-ascii?Q?kZqBpAaL8qrrhPsHrlzL3nvm00UIRfBheMmNYVpPd2s1cjeOlfp36lcMuuo0?=
 =?us-ascii?Q?JFKEVH5q3/CQgqD2xCuHZEkF8RfR6fkC90QExlSkITFeR3JX3Zc742M6aWCo?=
 =?us-ascii?Q?7W7a7XI6EePi7paf7VsAixA/yHb51mJpgQCeHXtK8RnaCJFco6huKsALb/Rd?=
 =?us-ascii?Q?UNfvc2VbC630zTRFobichuZ9xJutMnTAIX/oOZqpVmzCDEyyGg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4LX14v/ZQl0bzT/WAo2jSF3zJeYLkl322jvoe8M9JS3KKL0artgcRfHiqyEZ?=
 =?us-ascii?Q?tSay8kwV2rE0PPYz/OouddKFEueSJn01oPkGoEY+mhblR+cGyWOiQdGlhYn7?=
 =?us-ascii?Q?0PO3q+3hU1wflvqQLZVs+mj8Tq9oOg896mhXAUMiyCbQetEYpB/UDLwMlT2W?=
 =?us-ascii?Q?fU4FI97EAXxLzH0Br26LbgIfHmeRb2KlbFLfY9sRCqDwGOmFNZJmcscS6baW?=
 =?us-ascii?Q?zNiWi9x5Idpw15Y1VhVgzSGiIEXUgI1qbX8BOO1FkCZyNjOeXhB+tos2LWgQ?=
 =?us-ascii?Q?DID54LGlYx/1yL98y5FFOqb1/Bc5UfkgDbeXyh/VNGOfx87S4K+Ue93X4Hnp?=
 =?us-ascii?Q?+z1iXp+Y4VY1qY2Pk4diCCt5ZJPaXBaI2kUdVg71ocYA0YTuHGA94jS56oI3?=
 =?us-ascii?Q?BT0qQF499AEWWyVhZ/Xj7/p85GNU70gvCB3iSJMHg0hPK6leviIqYXS2yZtc?=
 =?us-ascii?Q?D6mWOyYX4UUr8aXuNhNVjUlxLDvdN7qrpcclxjTQjljg1AzOqfdLeEjL+FMt?=
 =?us-ascii?Q?Ei6CE8Wxye8IVwy0kYxEhZuMDj/D3F9LsmOL2QfX6IZZn0iklPvk99S+ltFT?=
 =?us-ascii?Q?Jjub+sHfmB/zvHpwLw5u4b8H6Ug5cNFlRedv84uz72NMrL/Ru/hfDKRGZgah?=
 =?us-ascii?Q?icqRUJCFB7+4fcO5+MIhiTWMaxQXbnAHLTZQNRa8mHWXWzXzuVu8gNCVCS2f?=
 =?us-ascii?Q?F+929QfkrZhHkndOh7KcLruYDcphz1XI+CJTwhDgYKkTI2Y23ehNgOlq8XT1?=
 =?us-ascii?Q?WviBHNtM4VuJQHR57aVB0BCvMUsG60aVY18KdT4eOCqQKlFcoB/ScbfmryRO?=
 =?us-ascii?Q?cURuosprcz5erVG2EqJpkWRv7Be/Bb4kJq4uSC78r9askFx7pHZKsdWlqjp0?=
 =?us-ascii?Q?EEnNNLJBST/LwgVoNgFe7irRD/Gk787n836IyWXAfryJH51V3QuctkNH12nR?=
 =?us-ascii?Q?hKKqgwdxs30PXwx5x/ni/iDiW3Y1aZLEUuHgoPbIJy7fQsCbjm1N12ghW0dQ?=
 =?us-ascii?Q?t6Q4gjH3vZio2965rR20gE2Fxys5PLVJJgE2B1/bcWEXczqsyGsTq5hh6tUt?=
 =?us-ascii?Q?qaN13//fQgL5ViaYggmWteZHwpankiOdxQvzjGvIA7nqe7p+p9lR6oF0TBjt?=
 =?us-ascii?Q?ObjbU4topaXSxGigzoeLzJPUzHrIE54JvOu4jGcDHYpSlth3fYPpDTl3WuZH?=
 =?us-ascii?Q?CqUDz4DPAMyEH35znLZ8UkSt78O5pdyQHBEVyz5upsTgDfOWhCzS4nfl3ulh?=
 =?us-ascii?Q?xaTqhnNaI45T4K9NQzOg+OdrqvD+tKvKBsImygwsNdLFT6iHuYbhO6yXgdj2?=
 =?us-ascii?Q?OZ0cPVPv04AHKoreW0uay1YcoeUu5TLbfueshez1DNFedwbjZBaiOIOkrGFu?=
 =?us-ascii?Q?N5YJUfojlsxNs4S9cyAXcC4aFLA9kvbPQqwFPQ/q+JryKWFRLkLwO3ejJ34G?=
 =?us-ascii?Q?N57cqGLwAIsEjGlRYQUpGaItTxfVtn63O5LiQtEOr3KNNul6tN/gCkkR07w/?=
 =?us-ascii?Q?7ohSpQHQf68rKkuGdXlDSXv0pQfht6/veo+i3up3hlrTeIhcKuS8/56gHdfw?=
 =?us-ascii?Q?Dx3ABeFDcrsqy9ERVXYReMHWC8QqsR2dcKvmOOCb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90e696a-f73f-40f5-a77a-08dcd0b9843c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 10:23:58.5250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnv6Af4yP9a/M+jLPSwtGZxge325NAjOdScSKQ+Ik9u0lp/UXX1vErAAfb1D+hazgj19BAMdIztjCx5ABQX/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Friday, August 30, 2024 10:14 AM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: RE: [3/5] drm/i915/display: Enable the second scaler for sharpne=
ss
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Nemesa Garg
> > Sent: Monday, July 8, 2024 1:39 PM
> > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: Garg, Nemesa <nemesa.garg@intel.com>
> > Subject: [3/5] drm/i915/display: Enable the second scaler for
> > sharpness
> >
> > As only second scaler can be used for sharpness check if it is
> > available and if panel fitting is also not enabled, the set the
> > sharpness. Panel fitting will have the preference over sharpness proper=
ty.
> Can you reframe the commit message, it's a bit difficult to understand.
> Sure. Will do.
> >
> > v2: Added the panel fitting check before enabling sharpness
> >
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c  | 10 ++-
> >  .../drm/i915/display/intel_display_types.h    |  1 +
> >  .../drm/i915/display/intel_modeset_verify.c   |  1 +
> >  drivers/gpu/drm/i915/display/intel_panel.c    |  4 +-
> >  .../drm/i915/display/intel_sharpen_filter.c   | 10 +++
> >  .../drm/i915/display/intel_sharpen_filter.h   |  1 +
> >  drivers/gpu/drm/i915/display/skl_scaler.c     | 84 +++++++++++++++++--
> >  drivers/gpu/drm/i915/display/skl_scaler.h     |  1 +
> >  8 files changed, 99 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index a62560a0c1a9..385a254528f9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2028,7 +2028,7 @@ static void get_crtc_power_domains(struct
> > intel_crtc_state *crtc_state,
> >  	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
> >  	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
> >  	if (crtc_state->pch_pfit.enabled ||
> > -	    crtc_state->pch_pfit.force_thru)
> > +	    crtc_state->pch_pfit.force_thru ||
> > +crtc_state->hw.casf_params.need_scaler)
> >  		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask-
> > >bits);
> >
> >  	drm_for_each_encoder_mask(encoder, &dev_priv->drm, @@ -2284,7
> > +2284,7 @@ static u32 ilk_pipe_pixel_rate(const struct
> > +intel_crtc_state
> > *crtc_state)
> >  	 * PF-ID we'll need to adjust the pixel_rate here.
> >  	 */
> >
> > -	if (!crtc_state->pch_pfit.enabled)
> > +	if (!crtc_state->pch_pfit.enabled ||
> > +crtc_state->hw.casf_params.need_scaler)
> >  		return pixel_rate;
> >
> >  	drm_rect_init(&src, 0, 0,
> > @@ -4295,7 +4295,8 @@ static int intel_crtc_atomic_check(struct
> > intel_atomic_state *state,
> >
> >  	if (DISPLAY_VER(dev_priv) >=3D 9) {
> >  		if (intel_crtc_needs_modeset(crtc_state) ||
> > -		    intel_crtc_needs_fastset(crtc_state)) {
> > +		    intel_crtc_needs_fastset(crtc_state) ||
> > +		    crtc_state->hw.casf_params.need_scaler) {
> >  			ret =3D skl_update_scaler_crtc(crtc_state);
> >  			if (ret)
> >  				return ret;
> > @@ -5481,6 +5482,9 @@ intel_pipe_config_compare(const struct
> > intel_crtc_state *current_config,
> >  		PIPE_CONF_CHECK_BOOL(cmrr.enable);
> >  	}
> >
> > +	if (pipe_config->uapi.sharpness_strength > 0)
> > +		PIPE_CONF_CHECK_BOOL(hw.casf_params.need_scaler);
> > +
> >  #undef PIPE_CONF_CHECK_X
> >  #undef PIPE_CONF_CHECK_I
> >  #undef PIPE_CONF_CHECK_LLI
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 1c3e031ab369..130740aaaa21 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -834,6 +834,7 @@ struct intel_sharpness_filter {
> >  	u32 scaler_coefficient[119];
> >  	bool strength_changed;
> >  	u8 win_size;
> > +	bool need_scaler;
> Always for sharpness filter scaler is required, so does this need_scaler =
make
> sense?
> Rather should we not check for sharpness_filter enabled?
> need_scaler is getting set during compute config when sharpness strength =
is not 0 and pch_panel_fitting is not enabled.
If any of the above condition is not met then sharpness cannot be enabled.
So I need to rename this flag?
> >  };
> >
> >  struct intel_crtc_scaler_state {
> > diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> > b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> > index 3491db5cad31..ed75934bed6b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> > +++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> > @@ -177,6 +177,7 @@ verify_crtc_state(struct intel_atomic_state *state,
> >  		    crtc->base.name);
> >
> >  	hw_crtc_state->hw.enable =3D sw_crtc_state->hw.enable;
> > +	hw_crtc_state->hw.casf_params.need_scaler =3D
> > +sw_crtc_state->hw.casf_params.need_scaler;
> >
> >  	intel_crtc_get_pipe_config(hw_crtc_state);
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_panel.c
> > b/drivers/gpu/drm/i915/display/intel_panel.c
> > index 71454ddef20f..bfc725d2e178 100644
> > --- a/drivers/gpu/drm/i915/display/intel_panel.c
> > +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> > @@ -451,7 +451,9 @@ static int pch_panel_fitting(struct
> > intel_crtc_state *crtc_state,
> >
> >  	drm_rect_init(&crtc_state->pch_pfit.dst,
> >  		      x, y, width, height);
> > -	crtc_state->pch_pfit.enabled =3D true;
> > +
> > +	if (!crtc_state->hw.casf_params.need_scaler)
> > +		crtc_state->pch_pfit.enabled =3D true;
> >
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > index b3ebd72b4116..627a0dbd3dfd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > @@ -36,6 +36,16 @@ void intel_sharpness_filter_enable(struct
> > intel_crtc_state
> > *crtc_state)
> >  		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc-
> > >pipe, id, 1),
> >  				  crtc_state->hw.casf_params.
> > scaler_coefficient[index]);
> >  	}
> > +
> > +	casf_scaler_enable(crtc_state);
> > +}
> > +
> > +int intel_filter_compute_config(struct intel_crtc_state *crtc_state) {
> > +	if (!crtc_state->pch_pfit.enabled)
> > +		crtc_state->hw.casf_params.need_scaler =3D true;
> > +
> > +	return 0;
> >  }
> >
> >  static void convert_sharpness_coef_binary(struct scaler_filter_coeff
> > *coeff, diff --git
> > a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > index 6ab70a635e2f..d20e65971a55 100644
> > --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > @@ -23,5 +23,6 @@ struct scaler_filter_coeff {
> >
> >  void intel_sharpness_filter_enable(struct intel_crtc_state
> > *crtc_state);  void intel_sharpness_scaler_compute_config(struct
> > intel_crtc_state *crtc_state);
> > +int intel_filter_compute_config(struct intel_crtc_state *crtc_state);
> >
> >  #endif /* __INTEL_SHARPEN_FILTER_H__ */ diff --git
> > a/drivers/gpu/drm/i915/display/skl_scaler.c
> > b/drivers/gpu/drm/i915/display/skl_scaler.c
> > index baa601d27815..9d8bc6c0ab2c 100644
> > --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> > +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> > @@ -253,7 +253,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state
> > *crtc_state)
> >  				 drm_rect_width(&crtc_state->pipe_src),
> >  				 drm_rect_height(&crtc_state->pipe_src),
> >  				 width, height, NULL, 0,
> > -				 crtc_state->pch_pfit.enabled);
> > +				 crtc_state->pch_pfit.enabled ||
> > +				 crtc_state->hw.casf_params.need_scaler);
> >  }
> >
> >  /**
> > @@ -353,9 +354,10 @@ static int intel_atomic_setup_scaler(struct
> > intel_crtc_scaler_state *scaler_stat
> >  				     int num_scalers_need, struct intel_crtc
> *intel_crtc,
> >  				     const char *name, int idx,
> >  				     struct intel_plane_state *plane_state,
> > -				     int *scaler_id)
> > +				     int *scaler_id, bool casf_scaler)
> >  {
> >  	struct drm_i915_private *dev_priv =3D to_i915(intel_crtc->base.dev);
> > +	struct intel_crtc_state *crtc_state =3D
> > +to_intel_crtc_state(intel_crtc->base.state);
> >  	int j;
> >  	u32 mode;
> >
> > @@ -365,6 +367,11 @@ static int intel_atomic_setup_scaler(struct
> > intel_crtc_scaler_state *scaler_stat
> >  			if (scaler_state->scalers[j].in_use)
> >  				continue;
> >
> > +			if (!strcmp(name, "CRTC")) {
> > +				if (casf_scaler && j !=3D 1)
> Should the scaler id used for sharpness filter be stored and the same be =
used here
> to check if its in use?
> Instead of j do I need to use some variable representing scaler id for sh=
arpness.
Here need to check if scaler is assigned for crtc or plane and if it is for=
 crtc and if sharpness is enabled then, whether second scaler is
available or not. If second scaler is free then set scaler id as 1.

> > +					continue;
> > +			}
> > +
> >  			*scaler_id =3D j;
> >  			scaler_state->scalers[*scaler_id].in_use =3D 1;
> >  			break;
> > @@ -375,6 +382,10 @@ static int intel_atomic_setup_scaler(struct
> > intel_crtc_scaler_state *scaler_stat
> >  		     "Cannot find scaler for %s:%d\n", name, idx))
> >  		return -EINVAL;
> >
> > +	if (crtc_state->hw.casf_params.need_scaler) {
> > +		mode =3D SKL_PS_SCALER_MODE_HQ;
> > +	}
> > +
> >  	/* set scaler mode */
> >  	if (plane_state && plane_state->hw.fb &&
> >  	    plane_state->hw.fb->format->is_yuv && @@ -598,7 +609,8 @@ int
> > intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
> >
> >  		ret =3D intel_atomic_setup_scaler(scaler_state,
> > num_scalers_need,
> >  						intel_crtc, name, idx,
> > -						plane_state, scaler_id);
> > +						plane_state, scaler_id,
> > +						crtc_state-
> > >hw.casf_params.need_scaler);
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > @@ -678,6 +690,15 @@ static void
> > glk_program_nearest_filter_coefs(struct
> > drm_i915_private *dev_priv,
> >  	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(pipe, id, set),
> > 0); }
> >
> > +static u32 scaler_filter_select(void) {
> > +	return (PS_FILTER_PROGRAMMED |
> > +			PS_Y_VERT_FILTER_SELECT(1) |
> > +			PS_Y_HORZ_FILTER_SELECT(0) |
> > +			PS_UV_VERT_FILTER_SELECT(1) |
> > +			PS_UV_HORZ_FILTER_SELECT(0));
> > +}
> This looks to be a constant value, can it be a macro?
> Noted.
> > +
> >  static u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter=
, int set)  {
> >  	if (filter =3D=3D DRM_SCALING_FILTER_NEAREST_NEIGHBOR) { @@ -705,6
> > +726,48 @@ static void skl_scaler_setup_filter(struct drm_i915_private
> > *dev_priv, enum pipe
> >  	}
> >  }
> >
> > +void casf_scaler_enable(struct intel_crtc_state *crtc_state) {
> > +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>=20
> dev_priv =3D> i915
>=20
> > +	struct drm_display_mode *adjusted_mode =3D
> > +		&crtc_state->hw.adjusted_mode;
> > +	struct intel_crtc_scaler_state *scaler_state =3D
> > +		&crtc_state->scaler_state;
> > +	struct drm_rect src, dest;
> > +	int id, width, height;
> > +	int x, y;
> > +	enum pipe pipe =3D crtc->pipe;
> > +	u32 ps_ctrl;
> > +
> > +	width =3D adjusted_mode->crtc_hdisplay;
> > +	height =3D adjusted_mode->crtc_vdisplay;
> > +
> > +	x =3D y =3D 0;
> > +	drm_rect_init(&dest, x, y, width, height);
> > +
> > +	struct drm_rect *dst =3D &dest;
> Declaration to be in the beginning of the function.
> Also I don't see the value of dst being changed and dest being used elsew=
here in
> this function. In that case why is a copy of dest made?
> Will remove extra declaration.

Thanks and Regards,
Nemesa
> > +
> > +	x =3D dst->x1;
> > +	y =3D dst->y1;
> > +	width =3D drm_rect_width(dst);
> > +	height =3D drm_rect_height(dst);
> > +	id =3D scaler_state->scaler_id;
> > +
> > +	drm_rect_init(&src, 0, 0,
> > +		      drm_rect_width(&crtc_state->pipe_src) << 16,
> > +		      drm_rect_height(&crtc_state->pipe_src) << 16);
> > +
> > +	ps_ctrl =3D PS_SCALER_EN | PS_BINDING_PIPE | scaler_state-
> > >scalers[id].mode |
> > +		PS_BYPASS_ARMING | PS_DB_STALL | scaler_filter_select();
> > +
> > +	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
> > +	intel_de_write_fw(dev_priv, SKL_PS_WIN_POS(pipe, id),
> > +			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
> > +	intel_de_write_fw(dev_priv, SKL_PS_WIN_SZ(pipe, id),
> > +			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height)); }
> > +
> >  void skl_pfit_enable(const struct intel_crtc_state *crtc_state)  {
> >  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > @@ -875,16 +938,19 @@ void skl_scaler_get_config(struct
> > intel_crtc_state
> > *crtc_state)
> >  			continue;
> >
> >  		id =3D i;
> > -		crtc_state->pch_pfit.enabled =3D true;
> > +
> > +		if (!crtc_state->hw.casf_params.need_scaler)
> > +			crtc_state->pch_pfit.enabled =3D true;
> >
> >  		pos =3D intel_de_read(dev_priv, SKL_PS_WIN_POS(crtc->pipe, i));
> >  		size =3D intel_de_read(dev_priv, SKL_PS_WIN_SZ(crtc->pipe, i));
> >
> > -		drm_rect_init(&crtc_state->pch_pfit.dst,
> > -			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> > -			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> > -			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> > -			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> > +		if (!crtc_state->hw.casf_params.need_scaler)
> > +			drm_rect_init(&crtc_state->pch_pfit.dst,
> > +				      REG_FIELD_GET(PS_WIN_XPOS_MASK,
> > pos),
> > +				      REG_FIELD_GET(PS_WIN_YPOS_MASK,
> > pos),
> > +				      REG_FIELD_GET(PS_WIN_XSIZE_MASK,
> > size),
> > +				      REG_FIELD_GET(PS_WIN_YSIZE_MASK,
> > size));
> >
> >  		scaler_state->scalers[i].in_use =3D true;
> >  		break;
> > diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h
> > b/drivers/gpu/drm/i915/display/skl_scaler.h
> > index 63f93ca03c89..444527e6a15b 100644
> > --- a/drivers/gpu/drm/i915/display/skl_scaler.h
> > +++ b/drivers/gpu/drm/i915/display/skl_scaler.h
> > @@ -33,5 +33,6 @@ void skl_detach_scalers(const struct
> > intel_crtc_state *crtc_state);  void skl_scaler_disable(const struct
> > intel_crtc_state *old_crtc_state);
> >
> >  void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
> > +void casf_scaler_enable(struct intel_crtc_state *crtc_state);
> >
> >  #endif
> > --
> > 2.25.1
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
