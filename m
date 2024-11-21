Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F029D4617
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 04:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA1810E06B;
	Thu, 21 Nov 2024 03:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fitSKn4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39DB10E06B;
 Thu, 21 Nov 2024 03:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732158544; x=1763694544;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VgiwaiCcqnUNy0LSMKQG3Z63wA9SnKSD1pVjhqOm/9E=;
 b=fitSKn4YBcZ84A3gIqbiMHNC7PtSneZJXE1Jvzo1kCP2+xNXuBsTDlwb
 KPDej/Poiksn3RGkWeWTghul+OWBB1j7V4fFI2DE+r5NBjG1myouCCYsb
 F181PyEXKy4Asefj/2tFCRrQoox37IAsHk6+2KNarBDhxkNth3eVDehce
 mZfHBNXBOD+9bkgjQbv1jzqgW7nVRDI04BF53+MZsUroqnGIPmW3Q6BIc
 rjKKrabWWmMY3kYrpw11HjWmOv3jy4LDvLovLyHdl5S+sen7FSu7zzK91
 YIKzy7H8lhTDsNtXdXn6J1fzhPghETiXOpTqpzAOKFn4KcfAwAvpuDkeg Q==;
X-CSE-ConnectionGUID: 9KRIXsy8QAGA0ssegxCDgw==
X-CSE-MsgGUID: wj5rLaMNRf2taP1e6Rs/Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42889680"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="42889680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 19:09:03 -0800
X-CSE-ConnectionGUID: hKPS9EM+TVmuXTUuI/GBBA==
X-CSE-MsgGUID: FSdGlXhkTxCnpuE1yQdl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90234669"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 19:08:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 19:08:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 19:08:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 19:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDHksOV+tLlVnXCHwuRHVGfTmvGCgo7oLfuDAJ0vSN1jddLX1SM1zMYZoedYEuMInfhP3M8vTLcyfz6hgz7pDR14ECG4ZRfgaZ8x6LN48rNrdS0ZbYgW2d6EEDYi6QHfpbPiXenBW39+wnmCPReQyaLlfzuZ525GoxdlYzN+Zscp2YIGvLiSJONVATC3IiX4pAnzfOBuPBxKNf9tI7DleX8nMKTnHd7vvVJ35zSmDslSVIFZD4kjFo6DXAntyzPF/2u5VUY17r/FuUF4XKn6NMWO3AxU70Ov6DQNevsXM45wF3/BRhszSPpCmkQZofav+bp6iBaxlvU9dJgNLLv+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbo3zjIi4ZY7sqotW+LGfGj9DyG4mX6m1H7aC8eZt84=;
 b=s3r1D1kqUXQb2/sfJUSmGguO8oRpVPVbwqQLG15eOIu0Ky8JTk/rGvxWRJEfnVrK2JbvhEJkuE9nlFjWMFQWTQEQc3eK6ny3jhLkJzkCcTy81ubqDJutV3hx9q4FHGwOV0LrWGY3m+Xxo2K7SMsrOA/O84PNiZTl61dlwasJuUZL0UCopUDm5ToH/A+maOp7VmKpOOAvLuPYotHoeEcxz2FNrKSUbTz8jeedVVc6QHbvxPbCmlKZVNa33OdL7LdpJvxTeq8RlDjitVUSdceAl4WK+EYDAEJWRpKuAyjisjoZgnDqtJGIKdaTY4bc7e+Ys4Z77xHEftU96BBNYEOoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 03:08:48 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 03:08:47 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv4 4/8] drm/i915/histogram: histogram interrupt handling
Thread-Topic: [PATCHv4 4/8] drm/i915/histogram: histogram interrupt handling
Thread-Index: AQHbOnGEKlteGmv0hkSBzyfsJdKbVrK+eaoAgAKWUDA=
Date: Thu, 21 Nov 2024 03:08:47 +0000
Message-ID: <IA0PR11MB7307565973AF391005CD130EBA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-5-arun.r.murthy@intel.com> <87o72b316p.fsf@intel.com>
In-Reply-To: <87o72b316p.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH0PR11MB4871:EE_
x-ms-office365-filtering-correlation-id: 85f1c267-dfe8-4fe9-4b4b-08dd09d9d100
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bbwzShPnDtAiOKY//rlI3qJqhZShXpUGVf4+i9NlkTA+eFj7PsO0tyBpqSQq?=
 =?us-ascii?Q?Ea5HTIJEA3M1ac49ccZqtl15Of/lLdJHICXIWGzDtVwUtzez//M8OJSrDuqG?=
 =?us-ascii?Q?gnpuibefrmcqrPqwwVkojGFCehx3SEMkKLJiKO3j6bvpgpuvUdQISNkyfWSd?=
 =?us-ascii?Q?wYCz01dl7jjft1U8T2sZZYBdhcIduIkdoVvk+6YDghIqmnD9kUiSDMiXB0SF?=
 =?us-ascii?Q?o5RGw2BCHe6JmeVb+O3lOaRa6ghqgptVOb65CYT9TQ/qmlyiG5BktbalrrGD?=
 =?us-ascii?Q?zQxp2aITbRmTP686lj1Uakm5igNFBOECQXPJtvnGCbqsIL4/CU7ye5WoMWVl?=
 =?us-ascii?Q?zvyz4x4fpbIOQSVdJh+6vqFBRXLDCjYRsVBAd0lXTqendJvjryVxCnQ2YxtY?=
 =?us-ascii?Q?zuJmSP0XPUSipN4bwBftupxvBJlEGB4shvh8eDWuD7fpDE1CruJsvkezQGCX?=
 =?us-ascii?Q?QxOkQefERGF56QJZTin0Q9YYvNEugEmLOA/sgJrxucMRkFW4GID7d0ceGtMa?=
 =?us-ascii?Q?gtXrY9SUsris9Z2z0Txz+LUaWXsEoCxj9lrgze9M5PTeMRznMI6LXgdYXR4O?=
 =?us-ascii?Q?2WRqEkDsCrX6K3kboO9Nh8APzgKidyRDwcOWrGq6GgjHaZ7YUKLV4gUbqH/N?=
 =?us-ascii?Q?+0HFPo1IMrcvBx4parCDYhN6HaVrf//KC6n16xvf20KVNt75YHu7ui1emkHi?=
 =?us-ascii?Q?8hUfJo9UQ9CHzgZ4N6YP5X2r1KeAHlmzwYPWbo5pT/72grUHjXyAENMJhi+E?=
 =?us-ascii?Q?L+0DmPMepjx7g4Q6RClygwgVVB5JSC+Xhe6Eh4N78MPjSXFy+bW115KLdOYM?=
 =?us-ascii?Q?MSYQklYqBk1eJ9xcuLss8NkvfwvYNCaX+SnV/Cyr2fX9t6BxrmNVY+AJzG7C?=
 =?us-ascii?Q?EQW5FE7crzQnCCLNg5LkOe3Nj8vZZ/kKN50I2o9htuXeTh4B7BLtHjygbcor?=
 =?us-ascii?Q?DQ37FbYFtcdHoWceTzf+SQo3Ree0rvC+G++CwRwoYK0Q3Q1wLAQbofEqfNDw?=
 =?us-ascii?Q?5fyfA1jIlApKhIltUun9gh02zuemCu204EXnTHqyZmzHaxHiO7JQEx4qQsA4?=
 =?us-ascii?Q?0ir572viJc+JlJHX7M1sNviXkk8B6qCPaMPu96RbYfPunU1b7ZeqRsM0aJQR?=
 =?us-ascii?Q?DWxIs03WAjaQbwX9dklcugH4GLz9SrUZCgBlGldICVw4xdgwPZ0SJ1vVIYoF?=
 =?us-ascii?Q?s2bqyIr8hFqZN9bwBDVtTLiUpIKTwoEM4lW2W2YPHw2BIl8QP6C311Rj593m?=
 =?us-ascii?Q?NXC9dqEE6dp4TTjduQMv+TrCYPIaHQQqrb1rVYUONckkyTcd4uhKvMCESC2d?=
 =?us-ascii?Q?9x0ZUolisdoMEm0joWFBmnZP6yFsnobFJAmMo98y9EDdxQqUO4oIiqd9ekap?=
 =?us-ascii?Q?EBeC6SE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qJuN3kunAOrU5z9Nqn3RQ5HRZ7v8CKb0C5UaVnsNaF/ijooFWOM26uRCZwlM?=
 =?us-ascii?Q?WLl2HBp5E1hFb+KU6So+YweC9XTDLbWzcTpXJrzUu+WTDapREFvAKMf5S1em?=
 =?us-ascii?Q?IN9u6ZUeSlteKYyhe/lAPgMlR1fnOKfj5jwuGwx+SMBVTWl5W7zG7ek127Iy?=
 =?us-ascii?Q?D/xPmg7tUzhHiT1C+adfKi4N9iXfIPz8pweBBJjzpqBcyAGn+TK1nb5YXmFK?=
 =?us-ascii?Q?4B6VgxMGyIhr1zNq3WAul1dsr2cZ24Nrfq5vgj76EJ4lJ/tT2g5/gCcWcjHw?=
 =?us-ascii?Q?Cn6NJ3D/ZwUXwgcNU+5xKg1izqW/ZcLwuO2xS1l1FusCSCOcf6Pp5BqGOCLS?=
 =?us-ascii?Q?w5ISaX+rtNLZINctDiVOzmmejMMiV3na+o6+R2sYT0aK5s+yzH4c9jKJPb+u?=
 =?us-ascii?Q?O2HBMfKHqRprG6E2mUCiBS3wzgqq8it2K6EOwqiWefgl7TGoh1/FqEcxHTCQ?=
 =?us-ascii?Q?mFzyIdT1+KthEXY+vD3kRRZajZvxjFpA6FlaZHWYYWe5u6/Xeb237UJj8LwO?=
 =?us-ascii?Q?+0MyNpIJuH6WoFQeUJ5ZQXRlktfv9iXublf3ep/GAuPaBc9EUA3zpAEujIpZ?=
 =?us-ascii?Q?bLK1RasVsbmWyBJLg/Vs7NaqSNbc4U90gXqSZK6X2XRyfyLBhxMwPO58qDWa?=
 =?us-ascii?Q?GDbHm+XG//k5Zgsq+41qNBEDaTXk69JEuBm7Hcbh599Y8mxLRmXqOiSiauHj?=
 =?us-ascii?Q?Ff2JCoVIH95HfGtlpXpBC4ORnMmO9L65Jg3YyUZdnqMsrksVQgxdFQPkc58e?=
 =?us-ascii?Q?FVwWA5zjCGnTwKoaypYASw00bOGCz2/ZbaEmoyeCDLVOd8yVYcTnY6Sm3luM?=
 =?us-ascii?Q?7wskr20Se19f6MdYGfixT/oHoP850iN6zr2i4wzK2bmI8A0nlu3xY6JvgIrQ?=
 =?us-ascii?Q?MzKcUOr1js2mlvv78kkr4OzA/WTpwm9cLw3FQvyQEpBlDYhwWvx5Ry9jbZ69?=
 =?us-ascii?Q?MNIVRtGFkeM/FuVz4Rjaqeu2DmfxvBuvQGxyH7v86csqTWPUmzRkBjiPIY4V?=
 =?us-ascii?Q?EQzkyF43iNioOXe676WRvnVzbuyeoKPSDenc/mGNXHgItARE7D1CsOK3U2F4?=
 =?us-ascii?Q?XvUAtsUBBF9s7iVhTst16LctvCSYjK6ua8cP0Bg//7EnNDIO9LSS8su9DGrn?=
 =?us-ascii?Q?Ud5aR25WX+qVzFxrNhuO0mXJxowajkzaNcxcpy/bIWSmMhFjO7Ypo1Qb085V?=
 =?us-ascii?Q?4HPtamlxm0s6C3S7okAmoHfprERy3NOdquvF8MtzYPOTTURDjmrTIfhgJtx2?=
 =?us-ascii?Q?dcXYojSJGhwmueqJko4iZPAonBq9jRhmwG+awtC7E48m99+wVI1W2EXkB60d?=
 =?us-ascii?Q?avsl6i1+Y6kXk0pWO62mXMRksEnIYvywt35eXLXZPhNhyUBPzFlU/cEtcUG+?=
 =?us-ascii?Q?qQV7LnUkdVcUrksZ3H1g+MPLVHuoT6KBre27RaOuH7ZTy/OHiT4qnFaZuSte?=
 =?us-ascii?Q?jPBcFSwUWEz28v4q4zsn82cOYcGm5mLd98+m67Mi/qIewmDU4TUpep1chZdF?=
 =?us-ascii?Q?gShn7vHDmWZl+lyXl0v8cZSeLUmkNQRASxZt8cOcBWyFGk159NWVvRQJ+hFv?=
 =?us-ascii?Q?N5St2BRrJ2A8QNi4FCn7dvPcFzEHTC8C57NPzi71KMXPguH/LcWNPHb5SgJL?=
 =?us-ascii?Q?JHoAMe8Egz3E5VxQImFKixDhANBOl+pbSOoVHnukTHBs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f1c267-dfe8-4fe9-4b4b-08dd09d9d100
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 03:08:47.5309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3XJq/BJTX3ki3fDKC4VtqEK1jiNQmF4JvlaqU03Pc7M5LixK5tSNpRAZliY/A37VJZ8Jq1e2bP78nuYFHsQBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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

> On Tue, 19 Nov 2024, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > Upon enabling histogram an interrupt is trigerred after the generation
> > of the statistics. This patch registers the histogram interrupt and
> > handles the interrupt.
> >
> > v2: Added intel_crtc backpointer to intel_histogram struct (Jani)
> >     Removed histogram_wq and instead use dev_priv->unodered_eq (Jani)
> > v3: Replaced drm_i915_private with intel_display (Suraj)
> >     Refactored the histogram read code (Jani)
> > v4: Rebased after addressing comments on patch 1
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  .../gpu/drm/i915/display/intel_display_irq.c  |  6 +-
> >  .../gpu/drm/i915/display/intel_histogram.c    | 93 +++++++++++++++++++
> >  .../gpu/drm/i915/display/intel_histogram.h    |  3 +
> >  drivers/gpu/drm/i915/i915_reg.h               |  5 +-
> >  4 files changed, 104 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c
> > b/drivers/gpu/drm/i915/display/intel_display_irq.c
> > index f0d3bdb5fc60..cb60c9db4418 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> > @@ -20,6 +20,7 @@
> >  #include "intel_fdi_regs.h"
> >  #include "intel_fifo_underrun.h"
> >  #include "intel_gmbus.h"
> > +#include "intel_histogram.h"
> >  #include "intel_hotplug_irq.h"
> >  #include "intel_pipe_crc_regs.h"
> >  #include "intel_pmdemand.h"
> > @@ -1179,6 +1180,9 @@ void gen8_de_irq_handler(struct
> drm_i915_private *dev_priv, u32 master_ctl)
> >  		if (iir & GEN8_PIPE_FIFO_UNDERRUN)
> >  			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
> >
> > +		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
> > +			intel_histogram_irq_handler(display, pipe);
> > +
> >  		fault_errors =3D iir & gen8_de_pipe_fault_mask(dev_priv);
> >  		if (fault_errors)
> >  			drm_err_ratelimited(&dev_priv->drm,
> > @@ -1764,7 +1768,7 @@ void gen8_de_irq_postinstall(struct
> drm_i915_private *dev_priv)
> >  	struct intel_uncore *uncore =3D &dev_priv->uncore;
> >
> >  	u32 de_pipe_masked =3D gen8_de_pipe_fault_mask(dev_priv) |
> > -		GEN8_PIPE_CDCLK_CRC_DONE;
> > +		GEN8_PIPE_CDCLK_CRC_DONE |
> GEN9_PIPE_HISTOGRAM_EVENT;
> >  	u32 de_pipe_enables;
> >  	u32 de_port_masked =3D gen8_de_port_aux_mask(dev_priv);
> >  	u32 de_port_enables;
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index e751977fc6f7..16f29923ef10 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -18,6 +18,8 @@
> >  #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300    // 3.0% of
> the pipe's current pixel count.
> >  #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000   // Precision
> factor for threshold guardband.
> >  #define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
> > +#define HISTOGRAM_BIN_READ_RETRY_COUNT 5 #define
> > +HISTOGRAM_BIN_READ_DELAY 2
>=20
> The above are only used once each. Please just put the values inline. Her=
e, you
> don't even know what "2" means without looking up the code.
>=20
> >
> >  struct intel_histogram {
> >  	struct intel_crtc *crtc;
> > @@ -27,6 +29,92 @@ struct intel_histogram {
> >  	u32 bin_data[HISTOGRAM_BIN_COUNT];
> >  };
> >
> > +static bool intel_histogram_get_data(struct intel_crtc *intel_crtc) {
> > +	struct intel_display *display =3D to_intel_display(intel_crtc);
> > +	struct intel_histogram *histogram =3D intel_crtc->histogram;
> > +	u8 index, retry_count;
>=20
> These should be ints.
>=20
> > +	u32 dpstbin;
> > +
> > +	index =3D 0;
> > +	retry_count =3D 0;
> > +
> > +	while (index < HISTOGRAM_BIN_COUNT) {
>=20
> This should be a for loop
>=20
> 	for (index =3D 0; index < ARRAY_SIZE(histogram->bin_data); i++)
>=20
> Any retries should be handled in a separate loop instead of abusing the t=
op
> level loop for two things.
>=20
> Based on how this is now, looks like the retry loop should be outside of =
this
> function altogether? I.e. a single busy response leads to retry from star=
t?
>=20
> > +		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> > +		if (!(dpstbin & DPST_BIN_BUSY)) {
> > +			histogram->bin_data[index] =3D dpstbin &
> DPST_BIN_DATA_MASK;
> > +			index++;
> > +		} else {
> > +			/*
> > +			 * If DPST_BIN busy bit is set, then set the
> > +			 * DPST_CTL bin reg index to 0 and proceed
> > +			 * from beginning.
> > +			 */
>=20
> That's just saying the same thing as the code in English. What's the poin=
t?
>=20
> > +			retry_count++;
> > +			if (retry_count >
> HISTOGRAM_BIN_READ_RETRY_COUNT) {
> > +				drm_err(display->drm, "Histogram bin read
> failed with max retry\n");
> > +				return false;
> > +			}
> > +			/* Add a delay before retrying */
>=20
> The comment says the same thing as the code.
>=20
> > +			fsleep(HISTOGRAM_BIN_READ_DELAY);
> > +			index =3D 0;
> > +			intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> > +				     DPST_CTL_BIN_REG_FUNC_SEL |
> > +				     DPST_CTL_BIN_REG_MASK, 0);
>=20
> This is duplicated; see the retry loop placement.
>=20
> > +		}
> > +	}
> > +	return true;
> > +}
> > +
> > +static void intel_histogram_handle_int_work(struct work_struct *work)
> > +{
> > +	struct intel_histogram *histogram =3D container_of(work,
> > +		struct intel_histogram, work.work);
> > +	struct intel_crtc *intel_crtc =3D histogram->crtc;
> > +	struct intel_display *display =3D to_intel_display(intel_crtc);
> > +	char *histogram_event[] =3D {"HISTOGRAM=3D1", NULL};
>=20
> Not sure it's great that this is a global uevent instead of having more d=
etailed
> information. Maybe it should have the CRTC details?
>=20

Done!

> > +
> > +	/*
> > +	 * TODO: PSR to be exited while reading the Histogram data
> > +	 * Set DPST_CTL Bin Reg function select to TC
> > +	 * Set DPST_CTL Bin Register Index to 0
> > +	 */
> > +	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> > +		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
> > +	if (intel_histogram_get_data(intel_crtc)) {
> > +		/* Notify user for Histogram rediness */
> > +		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
> > +				       KOBJ_CHANGE, histogram_event))
> > +			drm_err(display->drm,
> > +				"sending HISTOGRAM event failed\n");
> > +	}
>=20
> So you probably want to add the retry loop here. This avoids duplicating =
the
> DPST_CTL rmw.
>=20
Done!
But moved this retry change to 8th patch in this series where changes are L=
NL are done.

Thanks and Regards,
Arun R Murthy
--------------------
