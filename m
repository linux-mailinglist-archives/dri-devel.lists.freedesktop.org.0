Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB06A37A93
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 05:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F7210E302;
	Mon, 17 Feb 2025 04:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhI7XIGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C9910E095;
 Mon, 17 Feb 2025 04:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739766680; x=1771302680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9/URgJc3+Hp2khBJDl7lGS7nH1LoRarBFf1+jtaGdAU=;
 b=lhI7XIGFiU6EhhEpw6FR/GOflrZRuJzLi0KLbG6nFKENLrFT+TTPgvmx
 if20bzBiQTubYjUa7jsLrJzMTaEYEMTWWgpnlIBA2Aj49hy7NX7xPSBPl
 eAZl4zsn9F65duRXrudeXvaM1v5A8vn8cl7dOdcXN9zhG2Hti7RXvbsYY
 KpG8ZwLGxnqKi9D0rihTR5qJPGeAAI6nXTOuhvupDPNOtnvwEgUELpi+7
 s/xuAByCopmZDwU0K407DIv5YjEBJtQf1xwWEjG9uM8dkLaQnk+ehoLSw
 8ep5ny5OyYVulm2IPkLy7CneoAflUf+OOQYiSzlJYVJtKfv17GgPiLk/O g==;
X-CSE-ConnectionGUID: bzyI5oNBSr6mZr2cYldVag==
X-CSE-MsgGUID: sTvG8fZ7R46pyQcVI5AU5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40468788"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40468788"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 20:31:18 -0800
X-CSE-ConnectionGUID: S81FNMOaQZuvB+A/4E4m8g==
X-CSE-MsgGUID: XBOVm+wfQQiazE2wi683jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="119028230"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2025 20:31:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 20:31:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 20:31:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 20:31:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5ZdyXcIJaYgIquAaGWOpVpYCldg8SZ7ctxpHcP/3vEyb6h6TGknQq6VlDPVpTLQSewsqN7Mq/lV3KUbrMK/g6G6xTlicp6Mng1khLKxJTmS+cLmoaJXhLqSNVwsMQArdbtHLxp6KCmtQ144yHnGxNgvY54AnddkmCdS3l3gfwoANRvMTJs4UW3YsLbCTWfvBn1JtWSW1oZywTnTDpd6RkfNFBGkBRY5xj6l9XO8FBkSDtuuPQLLqPF972zg+/axd0xX3t6dBXxUBbI4YAseFe9ErT8YWaglyvaBxOC8FG5VN/+gOupGLaT1eHipbnpfMcvMOJ8+KNtKz7QKPa8qxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoMcaO9Kc6IzNxO1W3KBSHdqE/Rr3VkqzUTpG2qmWls=;
 b=a9C878nZG4BWCvB7rO0n2kCqVT5xKRs9TvPDNUX9n6imaU4vubpHP5r/hYZ9QpWmFbXNq//nkkn32RxAwPVjDvZnbAowliJnhUcnkjgSEE6FOqs0Sz3eWdy8zIgwBqPSrsnA0/uqBnX4aFcMxR/aurQK3YrlXB0wta89gZXBqwiwYZjn2pAcxhX9WJPv8gV4PnzP3SxxJttyzcf1ur/1HQjMxlZYvRs0kkyjMIrI83fCY7svF0BiiicD4ZLqFDl+hDEumpX6TJqhX0ViwsgRZwhra5YszrU03VtZpbzE14Fw506cxL5z97YKVsqbcJSYjLiitIcu7Ahj0i7iSsIfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:30:46 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%4]) with mapi id 15.20.8422.021; Mon, 17 Feb 2025
 04:30:46 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: "Karas, Krzysztof" <krzysztof.karas@intel.com>
Subject: RE: [PATCH v2] drm/i915/gt: Replace kmap with its safer
 kmap_local_page counterpart
Thread-Topic: [PATCH v2] drm/i915/gt: Replace kmap with its safer
 kmap_local_page counterpart
Thread-Index: AQHbfnhZtvrZI8/1oU6U6jmbMaAMuLNK66IQ
Date: Mon, 17 Feb 2025 04:30:46 +0000
Message-ID: <SJ0PR11MB5867812DA2E2D366DBBA9F95D0FB2@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20250214003437.1311476-1-andi.shyti@linux.intel.com>
In-Reply-To: <20250214003437.1311476-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|IA1PR11MB7872:EE_
x-ms-office365-filtering-correlation-id: c76c4c43-7a01-4bf1-dc0a-08dd4f0bd936
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?g6ikLDq0+nmbBG/XuAHwuk+CJabjAirqwSJHu8HE6xMlvidzREBUxlQgEx4a?=
 =?us-ascii?Q?0PeGaJ2RoO0jBqCzv5GBrDCuf+HEpEITjFvouwa/h3Q5Deoc8T8SD6hQ2Bt/?=
 =?us-ascii?Q?QyhpEWmdzF4p0hHdjsw20C2dkjP0Ptx84Es3XRDFP/kbwPeM77VNknrTaseW?=
 =?us-ascii?Q?cJW++jgfmL3azryghMdirO+L/iR2VZx0z9XsdlvA3LfQqDeeP5EELpJB6Jal?=
 =?us-ascii?Q?mSEQhWDDBL0sRY4tDvdNp2sbLHcqEcXNS9AIvg7T5cfbPR7YO9vApxtNU8vd?=
 =?us-ascii?Q?Gt9L+28XXL5zU1syLji06k25ATfrICQgbmFx1EWr1yERXF2srBxn0nSjiV9m?=
 =?us-ascii?Q?M5bEsoJdyHW6JjOvnaXsAATigqb8nw7TrYeSvf7GLzgV8fdTxpDcqAAX96rM?=
 =?us-ascii?Q?G3MyEwQZF4/JF07ZWRtEMCycfoTjnszZh/41QIjoACzaC2czi383dI2gLZIF?=
 =?us-ascii?Q?T++lctpUHXWBu0KVYMw2t/951VgWhwAFF4gfRgF1f4dYON6i4uBrt6bPDpFw?=
 =?us-ascii?Q?ylLMc0kqTxO7+HGI6pMIVf2LsmBBCV5F9M61n0yOJ2DMR9lZHgTHSCrx+G/R?=
 =?us-ascii?Q?l9Hek96qxXPGrcVOvYSX0jGuTUaXxLPQcntK1IQ1SHxx6tCe/PVJn0BUyPJy?=
 =?us-ascii?Q?hR8jQgaAlhUiw8VUzSZqHm4gmU9Gh6T1sdZV14tGYxUtTZRSo1p5d9cu/qT4?=
 =?us-ascii?Q?DUs8bdG5rJ+AL/NAAYIrK0vIiEquk4C1iuMDt+ca0tOEI9ZSuQp7ZyYOA877?=
 =?us-ascii?Q?hML/1rT3LTPyc9rsSQNzXNH/wc99jq8WBegkLB699wa1rGqRqyaJSS8IVGuD?=
 =?us-ascii?Q?kcBgURHEsZZOf+MGIQhcX+MGAmTwA36R2wxwgbS7dPxqz5HVdkr4I47eizvJ?=
 =?us-ascii?Q?syrUcyG4rvTkmmesKAsg1AyCA+0pya3CLe9iOxzkAGBVzkCHAHeZgQebrHfc?=
 =?us-ascii?Q?cu35C5D/5kso+ZpxQZsM6umuuVII5y9vHjfKU3HySqODnxp+Un8fbje2sHy7?=
 =?us-ascii?Q?Vz6Xl0ymBGwhSF/C1Y83JPHQod6l+X6r4WGBftXWQpYQ78D8F5MpyrZ2263+?=
 =?us-ascii?Q?62Lv0sm8h9mf/U3rBqnyGJNuJZ5EuGsZkoymv4RegSDpjsT363JPEhrhgFDD?=
 =?us-ascii?Q?lC0pwmd9CvF1+Pp9jKcumIGAah9KV0M+zerRM4/MJsL7dEFieKZhwqlN/igz?=
 =?us-ascii?Q?jHt/ESA2JODEJPP+U+FNy480Tp07J1CiN598+Bj+3qJjlejpQ9FZCpyVL+Av?=
 =?us-ascii?Q?Tb5sfbDXUubm1WGdp9gWb94hafpFKp+t9/rTDc2JDjDV91wyK8uZM/RtlnCc?=
 =?us-ascii?Q?ga+WUHksWKUh1nLgKf3mKX8vXgCBA6uGDPFzcOjaI161VGKT/+7SKycbTgmt?=
 =?us-ascii?Q?OuAKwo4YfQXxZoddOSK4YX8WP5s7tMp8hlaJJ4uWmQ2D/HoNsH4LVTzOctnO?=
 =?us-ascii?Q?LXsNp2pYg1RKoV1Koi68Tu8JpgD7aJ+b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jYa3E63PDN16EIVmOn/4sfWUtZjAuk1FhCJQUpN4ElT05Kqx25GDblS5+ZUZ?=
 =?us-ascii?Q?E2TGZFh30/hkJWZ15yMJkmRok3ZV/KXV/10KHvmgPn1p8+TSvAlW0DtUAS7C?=
 =?us-ascii?Q?+jtzOpQ4pluSvwoaLUH/NOmVvFxRfqaUqMIsOSUMD/595aSt2al4JhnxG7Ub?=
 =?us-ascii?Q?151kdWy9x4+mOmxGowC+PDyGRTthOXt6jwGMIIvALaGX29BkSPgglHIn7mBJ?=
 =?us-ascii?Q?8FUpaVP/fzTHnopqDSwiQoXa93N8N4Hjf84YEoAozXJuvEMfLGwBWXdJUzO0?=
 =?us-ascii?Q?Qps5gWambAKi81uPo0d/ZbEbnR91h8U9n5s5gN8JcSjK7lbXcR8bUooPznHy?=
 =?us-ascii?Q?q5jHsSwCFcD0nHKS0uDIOYjfuoqBM3Su5hQVf+AjFJiS/2v3r1ys0XTQDkge?=
 =?us-ascii?Q?sU7zysR+DVojmS/Snr4hu9gOZfl1SwcyfjUUZ4PFrY8oXN/MqBGQvO6lkxSt?=
 =?us-ascii?Q?zu1IRDrPAGSWxVtuO4dZ9pfMW9FbPtzutPHc11x4qD+AHMfrKvjI3irpyu8M?=
 =?us-ascii?Q?FBjOtq+qIbO/K4aeCXsnc/voCYDgg3R/zCXsilBP4bePgO/Qo/v4mNYiCX4A?=
 =?us-ascii?Q?Zk4TDjd1cYl0YuXJvT10szPVV8gcR//Yb1xOF0sMwe2vdDPN+hUeDZdFXuek?=
 =?us-ascii?Q?U9+NDuUg4/fWcjrLJksur0rO/ISc9oL2+Rb6SRclXQkrx8WcdnJBWMhCsMNm?=
 =?us-ascii?Q?ThNgE0Tt7VpXNGjFpDDO1ho1WTaNPXa5mfQ7X4WaUqvHW77qDCXm+EvyCSYj?=
 =?us-ascii?Q?V4OQylqXHvRVYH9RoHYK2Ytit82TGfd3mmy4IPRKUwlThiUG2nX66klZFigv?=
 =?us-ascii?Q?ePVMKq52Wf0SO8bz0DRNGaLPlaDG/IBC/Xhk0ah5Pg8cD5OsaNqgVkbJk9t/?=
 =?us-ascii?Q?cKx0WvJOezIlK0q/e5dNY9uPcuGTF5YWQhCGU+qMwdPAPtjOy1Kx/uuKkyHL?=
 =?us-ascii?Q?js+cs62mrO/jQpYshgmdHNgh0ssOOshrcXk5nf8gaKh0EC4Lu1479MO9CHpS?=
 =?us-ascii?Q?UnN/S2miDWVRdK24E5dnN1CSjE+XddXV/8NtlDI6C3ewvk5PqhVk7kTP5fB4?=
 =?us-ascii?Q?OSa+5cLywjpi7lCJnpE45T+zgXnfgvjt4KBg5+tOOIXsA/XmDJ30ZIsQAz0h?=
 =?us-ascii?Q?/XImCQEjigicc4deuXKYuNlxoN1YQGDl9VNOu4PJAu03aDO8bcrJzHYBO3FV?=
 =?us-ascii?Q?T+whEJc+Iy14KarCYOlC3vkS8e+Sbc7rM+qz6xIoANJr6XmVV1+ezNUW7JPt?=
 =?us-ascii?Q?IS+RYpprYvB5XBrGE6SEuQl4tTiEAEZu/6QEcVYKkl4rpd+mj9N/mtTMvQeb?=
 =?us-ascii?Q?9g67C4gYx8QhF28OuJvNShSZ2NF/NL92jnsOONlV0QpZGzxutn7+61KcSp0A?=
 =?us-ascii?Q?pzZs9ml+i3bw3KaJtmJLqOxP4H1Q/DsB1PKlAAYY/LGlXGqfu/kGTdZ64nwq?=
 =?us-ascii?Q?4s63tYIksyhgYBDGYhAwyXl5LSYXJJWkKj+HQwddsSXEablwvxT4XmUAKDF2?=
 =?us-ascii?Q?Ic51N1I+lLfHf/DajFsjqucsnGjoQekKrdIux0CiZfN5FgPS9eLxMHxJDN1U?=
 =?us-ascii?Q?UPMqqZ39XCX0kgPHqfcbYalX+ebjkK/WfcGby4If?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76c4c43-7a01-4bf1-dc0a-08dd4f0bd936
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:30:46.3717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DgJDVN/MaX9bdEzhTTnyDMPRButpoRDiltG9VQZhsbSM3oa9Zo7KzVkJKBmTizds1uyG1juHdYLcR2vqD/8NIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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

Hi Andi,=20

> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Friday, February 14, 2025 6:05 AM
> To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-
> devel@lists.freedesktop.org>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>; Karas, Krzysztof
> <krzysztof.karas@intel.com>; Gote, Nitin R <nitin.r.gote@intel.com>
> Subject: [PATCH v2] drm/i915/gt: Replace kmap with its safer kmap_local_p=
age
> counterpart
>=20
> kmap_local_page(), unlike kmap(), performs a contextualized mapping of pa=
ges.
> This means the pages are mapped locally to the thread that created them, =
making
> them invisible outside the thread and safer to use.
>=20
> Replace kmap() and kunmap() with kmap_local_page() and
> kunmap_local() counterparts for improved safety.
>=20
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> Cc: Nitin Gote <nitin.r.gote@intel.com>
>=20
> v1 -> v2:
>  - replaced kmap with the _local version also in the
>    intel_ggtt_fencing.c file. (Thanks Nitin)
>=20
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
>  drivers/gpu/drm/i915/gt/shmem_utils.c        | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> index 0ffba50981e3..00f7cd6debf3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -749,7 +749,7 @@ static void swizzle_page(struct page *page)
>  	char *vaddr;
>  	int i;
>=20
> -	vaddr =3D kmap(page);
> +	vaddr =3D kmap_local_page(page);
>=20
>  	for (i =3D 0; i < PAGE_SIZE; i +=3D 128) {
>  		memcpy(temp, &vaddr[i], 64);
> @@ -757,7 +757,7 @@ static void swizzle_page(struct page *page)
>  		memcpy(&vaddr[i + 64], temp, 64);
>  	}
>=20
> -	kunmap(page);
> +	kunmap_local(vaddr);
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c
> b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index bb696b29ee2c..365c4b8b04f4 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -108,7 +108,7 @@ static int __shmem_rw(struct file *file, loff_t off,
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
>=20
> -		vaddr =3D kmap(page);
> +		vaddr =3D kmap_local_page(page);
>  		if (write) {
>  			memcpy(vaddr + offset_in_page(off), ptr, this);
>  			set_page_dirty(page);
> @@ -116,7 +116,7 @@ static int __shmem_rw(struct file *file, loff_t off,
>  			memcpy(ptr, vaddr + offset_in_page(off), this);
>  		}
>  		mark_page_accessed(page);
> -		kunmap(page);
> +		kunmap_local(vaddr);
>  		put_page(page);
>=20
>  		len -=3D this;
> @@ -143,11 +143,11 @@ int shmem_read_to_iosys_map(struct file *file, loff=
_t
> off,
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
>=20
> -		vaddr =3D kmap(page);
> +		vaddr =3D kmap_local_page(page);
>  		iosys_map_memcpy_to(map, map_off, vaddr +
> offset_in_page(off),
>  				    this);
>  		mark_page_accessed(page);
> -		kunmap(page);
> +		kunmap_local(vaddr);
>  		put_page(page);
>=20
>  		len -=3D this;
> --
> 2.47.2

LGTM.
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

