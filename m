Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899679D4824
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 08:20:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9725710E88D;
	Thu, 21 Nov 2024 07:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfSt97dC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572CB10E87B;
 Thu, 21 Nov 2024 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732173598; x=1763709598;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vB2MRu0tLaUKykLiSE/oO0W6r1GDocGURTKPi8R9J+s=;
 b=RfSt97dCOhvfU3b+ometAsIk9PnBSmZtIvFbb3pkXUsrdLZ3vWMnWHGn
 h7ofbCdKt9B0HWCJvGjUuk0h07yTZhHWQHV1eO7ULRzO5S5ALNsrl8Aay
 APSyq4WdGVVHR1VeloeXbsp8r+REIOtLbU/HCW1PsmtybIW2VQ1MhFHWo
 1GoHTYbZ/wFjkTKT2jpRdk6FiBH02Yyc6M87GqKc7xw+HOMFBxmyIeUgW
 Ydp3xusXBw68SzrBnEZ9Lexi38VNoDgyZqem9m4qnMuJtYUQBv74/sd15
 Mwh+jxNka3dMgwCik+bb62by25yVvWe3HPUcqh8EMo5Hu1OxIYVy2sgFI g==;
X-CSE-ConnectionGUID: QYoYjYB5R6OEUiR2CHg1xg==
X-CSE-MsgGUID: LcvKgOt8QV2N7I+DvLbKRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42907647"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="42907647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 23:19:44 -0800
X-CSE-ConnectionGUID: 19w57mtQTVy2S3xACBmr4A==
X-CSE-MsgGUID: tbrkLyVzQ2O9QsSwhbin2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="127694308"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 23:19:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 23:19:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 23:19:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 23:19:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+jrE8zktaazJHHUlNaTwDKYSX9ZalhS18vD1x1RLR55EiWvHj5xtaWSbKViImr3YnH6d6VdxmMvDm6cYq1tHwNdVthaQThOCYu3mA8a6TFHU5LCA9fGPAFSq1ANuCGcyLKfqtchtzqmtqR5z4i07ty165v3Y2QMWzIMbV6vCX5fdFtMl5YpLMO4tx7e8Ex/ptBuorDPwh/c1irIAdVLMIQoNAZtOB7c89chXKJZTOgjkj4+ypiggDnIneD2T7wPilgW8cxL8/6iGnLZ7Wqg7xwrfmVJQ35M5LAB1h0kSnmTXAR40V+wjK3OpjrgfumsQ7DRckKPwAe4panlUDbU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcKlOCYfzxd75UM188Txl2KcD4eVbhR/4vXbtoqIWaQ=;
 b=GfTp12heCQLTB/ZqJPl97RXnD87BU6LCvUolnDWWKAQIse9RbqnR96FeDVYtYjAkLD+uREPJsgWqPpicE8Tbhh4KF3ACSIrrVlSruCSqWktAGgi6ipydGeipzjKdA2A5G72xbZqB7mH2rkSBwEyjpucbahWJXXZwmLJwtBUgBprZMXCBA9Ne4cioTX8TH0TjUgqTKejAu8Ig66/Y5ZzjaKqesrNjbCQFQpUY+kFc65S35wdANMUJTWkplqUStsFjUKd6ppQELpTKqVVB1Lpcz99elr1Hg1phcwztmFBGuijhuHv8ofJwB39ZxOZ+8vXQBCrMZCI1aWxV7sPmp1Pvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 07:19:35 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Thu, 21 Nov 2024
 07:19:35 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv5 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Topic: [PATCHv5 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Index: AQHbOnGEkW+zmqhp5EGxPW5uQDdE+bK/2NWAgAF8soA=
Date: Thu, 21 Nov 2024 07:19:35 +0000
Message-ID: <IA0PR11MB7307325876D19FC493394565BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-6-arun.r.murthy@intel.com>
 <SN7PR11MB6750D73A85B90DD5FB11301AE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750D73A85B90DD5FB11301AE3212@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB4976:EE_
x-ms-office365-filtering-correlation-id: 2ad165af-0c70-4609-5590-08dd09fcda14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PHgtJ36CXsd8Z1XQIOgAxwxOr1laPhZQE47lKAswWG9LZUlRgvPYuSSv33xy?=
 =?us-ascii?Q?+EjJErm5G3TfnmlpPsXxEMjtjBm6YmfcRh+Ui2JuXxJG1N2fQiW7pjxZdLzr?=
 =?us-ascii?Q?+L47NfoHudoo/oBhE7fwt0YYxR3SiQTACmaMzpt/4hsqh5cIDsfgHcJF8qVa?=
 =?us-ascii?Q?9gpGT1wW+7e/RXq7ke68avIHkpC50+Bz+evnD7nAWh32KRin+lK/kPvz55Ez?=
 =?us-ascii?Q?fjcYxxSIm7namauiWnXqzBeuO6CH3em8lALHeyfu+ZqCFdXZOV+yegH2qUzw?=
 =?us-ascii?Q?dYYUNWeknjgzbPlCFjeOBL2zFkHOy4q6EMzvB4sDIF8PWY+DoLQ90nKH2wR/?=
 =?us-ascii?Q?vP4KnZxfWddF6okg+SgEqqjvwSXwqB4De1jt8UNw+g55VTtcVOQHjJOz/lpx?=
 =?us-ascii?Q?zskGWsjSRl/9ne6n1zIL5iSici0WT17/stYlz68PeK0ROSERTH9kxn4D1MDm?=
 =?us-ascii?Q?ECcqf8uqSCrubPWYlGWhLI7IRHlRjfIlZWwGmyKGu/IbiEtmnP0eTgRENF2J?=
 =?us-ascii?Q?96C57AGB3SrGXCZZiRuiO5jAqjsirT5uREXgLpsteQgTftbNpR48dJ7FIKSj?=
 =?us-ascii?Q?yKWNiBemeTT7EVdJWhhmOvO168uCV6kibH8DCB3RA+eOPcRTZWyYHbhPeDB1?=
 =?us-ascii?Q?LMlgga/5IzsORAtPiT7EboUVU0u0y2j0uAEJ8/IJOf6lgZ45cZu8JKtnO8m1?=
 =?us-ascii?Q?z+jljgfw69OUeCQhrIJ4CuZi7N/XOCXP5Vbfqd7cjJmiEEibp9z74MOWy4Qb?=
 =?us-ascii?Q?GG4z9xUX5nugtY5929sxbUlOAYNPMx40lqRpjQ9540oLa2TbZZqpnqCEScyh?=
 =?us-ascii?Q?H9xWPjKpvDS6/i6ND8WFoMrd/lYFf1uGVwSrYnYcuwPQar9gYmqZxJaPyPxr?=
 =?us-ascii?Q?TNLNRhcys7bSGVoreGc3uZfj150IkT0/zFFKH9gnh7+j5RSR8yzCOW4n6zMU?=
 =?us-ascii?Q?AGqpHheTMJbYCp6uWifsLylOXJZ7UFnhWr3+hlxlXSIV8m7pQm+q92HFmw75?=
 =?us-ascii?Q?HMsK97k2NatmSB73t+mZf5x1b/RnbMcjRxk9LBd/BGKiauc1ke1hFmMEY0ab?=
 =?us-ascii?Q?JFPcNArKWP9xV3c6NrCsl+ALKKzqGXj6Ajlnh2TlpQb4sXS11xFPd3MbPbqC?=
 =?us-ascii?Q?L6/zxMc/Lu7SrTy5zlSeJwAYj06K5/Yqm5OgeV0+d0hb8ZSNus2MDtKRAqVN?=
 =?us-ascii?Q?Ov5kUfX9tF1Oa2F7ZJyTrDb4NvB1MK+5cufMSa9ZmvN58v2vri1Z/Mpk7E9j?=
 =?us-ascii?Q?HYsMxbjNbN2QkEkScoYLROFFIDf4MoO8EMsBneyzc8pQOX1dmWUVueFi3Tvd?=
 =?us-ascii?Q?0y4gaGSoz4tqKhmhAt8/2Gi6bmcFvII/Yr+laneIfSaNMmibZiKNxRD/Yvxt?=
 =?us-ascii?Q?HuTMQRg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C1Ybe+gCW/oRjpAn+m3Z5mah1TcgoKSCeVsfBvkyHD4S2p8L8qfwtwbMkiTg?=
 =?us-ascii?Q?LQTB5ZZ+xkbv/QMtzXl0lRd8pWYofMLkk/Wood/BkpAoVUrYOIshw1uX2ozJ?=
 =?us-ascii?Q?WizKkVQFEURZb8uQAjXv4tdSV99ywu7eMdsRR2N/QjZ98kyZrAiLHVOaLJq/?=
 =?us-ascii?Q?sPBUNKHd+uXTdUtScw0PtQY9dVriq9a/3lkkLTQ0oFlyTjalagR2XCCeVqII?=
 =?us-ascii?Q?xRPiAIc1NUfraDfGKLKg1/b1PC6qg8h7wmmlkb2fragCTZsov+HkJO2H3WDJ?=
 =?us-ascii?Q?GZbwM0M+6t8+0UhGOixkBy+twBL40jvvk3fGhujOg66rNbw7Bx3MjlBZm/gH?=
 =?us-ascii?Q?afTLVG1dWJvsp+2ARw8qw9y4uPM+O0ubVdVMknA4oF+omEI33qpdclQrcNje?=
 =?us-ascii?Q?BpbwpFiAPc0oT4L/jgwGYHpbNrqtR2zqwni8iLWe/vLgV9qILq/Uy+ZD4J3j?=
 =?us-ascii?Q?u1ypjRf2Ta3OISZ9iUTmBm/Hz8Bzq0IjMJBMYQdpONOsVb6NySABIElSGWRr?=
 =?us-ascii?Q?GHsv9/f4CxdlTpQ8+5mgufBBdlYC++D3B+7YtfzMp+syzdhm3Ss6r0ypG5L3?=
 =?us-ascii?Q?vgyZg7FSb5ERSjvybfFr/d080CYEpcpAhJTAtj+VnPjbC1XSGk89DD4x38h5?=
 =?us-ascii?Q?f2Tf+kJttYIqpzruzS24T/uD3j9TsD40gz7wAKgSxHq4yX8wjNbpXmFz5hFP?=
 =?us-ascii?Q?EPW1JO9l3T7uAPA8n9wYPhu7IoU1c6ILb8OE/3Lg75Vx/n14Dl9eyBI9trw5?=
 =?us-ascii?Q?71JWuhpMf7NI9kuCsPxfO6Fm0tp1r4CjtlU2Cp7AHh7JAk+U7+Ed9lQrUFkt?=
 =?us-ascii?Q?S549COz5edozalT964EHRY09BKI5Fpit5rsL3E1Crrin3NErK2Dl4GWPPspN?=
 =?us-ascii?Q?xm+r9SXMnxhEPfVUtVbgfz1vqHPbQJ2M4CXlLetRcJs+5jYs3OvET4z0Iv7T?=
 =?us-ascii?Q?LMGFJxm/TqSo3rHbsOMRQ5Im/d57s1WtezEv31LifherQzSFnuvj7jyHVgn5?=
 =?us-ascii?Q?ShtsTjw1TWQw2tsil/FaaM+kLWQLAGx4vcE4cPYgToM4xjh1gjCSN0h+t91u?=
 =?us-ascii?Q?DKxUPO8jRItT+dUc5Qjz8ikgXvhUqWa7TCq40tbYA+uujaMaxE/9mV5bswl9?=
 =?us-ascii?Q?mgNvmVk2gS8bg3KAsnBp3I7M9b/NJqtwFxVs+uwWbh684KrUQbGvj5K2AhTg?=
 =?us-ascii?Q?J1du0skpozLWgNht4LbwKFuw9BRGgB+IpLNxFRR9xh1B8ALo5tLbpIs684E7?=
 =?us-ascii?Q?KGujIye+zjRXGft1fDc14TpBxOx6D9fllfdtQ1LIceOgV88roL+xd0hkkec5?=
 =?us-ascii?Q?Z/jeqv5+kZY9e1d0GLjDDWaUBkoe50YresM38je80Sgc/XhHgZC5BeFom2Y5?=
 =?us-ascii?Q?HzM0J4QjIXs/Lei80bwNGw7tZ1tJ59bfhxSq9kQUVzFkU0byuGuUSBqpV6k6?=
 =?us-ascii?Q?3plKKpksjB9ESP2t8Iwpo2i9qCd6imD0yCO35YrcnizMz9cAOENCMGFOVOqO?=
 =?us-ascii?Q?ShS9HD/moE5OXfFGnDf6GZSEb5CaXWA9bokKkr0+fYN+ffnJXz0hLlYEe9dH?=
 =?us-ascii?Q?QwNUFxHL5fBkZTzXBuX/hau8h4zWj4ODxNL8aXuD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad165af-0c70-4609-5590-08dd09fcda14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 07:19:35.1400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcTeZFFtnfZCPsFhs7aULxbffsDJSvMoVCozSD/Ogmkh70Vpl+Y/XlA8I0M1gkO14QTu03fz7uMbKnDI9jZf1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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

> > CRTC properties have been added for enable/disable histogram, reading
> > the histogram data and writing the IET data.
> > "HISTOGRAM_EN" is the crtc property to enable/disable the global
> > histogram and takes a value 0/1 accordingly.
> > "Histogram" is a crtc property to read the binary histogram data.
> > "Global IET" is a crtc property to write the IET binary LUT data.
> >
> > v2: Read the histogram blob data before sending uevent (Jani)
> > v3: use drm_property_replace_blob_from_id (Vandita)
> >     Add substruct for histogram in intel_crtc_state (Jani)
> > v4:  Rebased after addressing comments on patch 1
> > v5: histogram check with old/new crtc_state (Suraj)
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
> >  drivers/gpu/drm/i915/display/intel_crtc.c     | 168 +++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |  18 ++
> >  .../drm/i915/display/intel_display_types.h    |  13 ++
> >  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
> >  6 files changed, 214 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> > b/drivers/gpu/drm/i915/display/intel_atomic.c
> > index 03dc54c802d3..a0d64a20b01e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> > @@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
> >
> >  	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
> >
> > +	if (crtc_state->histogram.global_iet)
> > +		drm_property_blob_get(crtc_state->histogram.global_iet);
> >  	/* copy color blobs */
> >  	if (crtc_state->hw.degamma_lut)
> >  		drm_property_blob_get(crtc_state->hw.degamma_lut);
> > @@ -278,6 +280,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
> >  	crtc_state->dsb_color_vblank =3D NULL;
> >  	crtc_state->dsb_commit =3D NULL;
> >  	crtc_state->use_dsb =3D false;
> > +	crtc_state->histogram.histogram_enable_changed =3D false;
> >
> >  	return &crtc_state->uapi;
> >  }
> > @@ -314,6 +317,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
> >  	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_vblank);
> >  	drm_WARN_ON(crtc->dev, crtc_state->dsb_commit);
> >
> > +	if (crtc_state->histogram.global_iet)
> > +		drm_property_blob_put(crtc_state->histogram.global_iet);
> >  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
> >  	intel_crtc_free_hw_state(crtc_state);
> >  	if (crtc_state->dp_tunnel_ref.tunnel)
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c
> > b/drivers/gpu/drm/i915/display/intel_crtc.c
> > index a2c528d707f4..3be81a5a789b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -11,6 +11,7 @@
> >  #include <drm/drm_plane.h>
> >  #include <drm/drm_vblank.h>
> >  #include <drm/drm_vblank_work.h>
> > +#include <drm/drm_atomic_uapi.h>
> >
> >  #include "i915_vgpu.h"
> >  #include "i9xx_plane.h"
> > @@ -27,6 +28,7 @@
> >  #include "intel_drrs.h"
> >  #include "intel_dsi.h"
> >  #include "intel_fifo_underrun.h"
> > +#include "intel_histogram.h"
> >  #include "intel_pipe_crc.h"
> >  #include "intel_psr.h"
> >  #include "intel_sprite.h"
> > @@ -210,6 +212,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
> > static void intel_crtc_free(struct intel_crtc *crtc)  {
> >  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> > +	intel_histogram_finish(crtc);
> >  	kfree(crtc);
> >  }
> >
> > @@ -229,6 +232,66 @@ static int intel_crtc_late_register(struct
> > drm_crtc
> > *crtc)
> >  	return 0;
> >  }
> >
> > +static int intel_crtc_get_property(struct drm_crtc *crtc,
> > +				   const struct drm_crtc_state *state,
> > +				   struct drm_property *property,
> > +				   uint64_t *val)
> > +{
> > +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> > +	const struct intel_crtc_state *intel_crtc_state =3D
> > +		to_intel_crtc_state(state);
> > +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> > +
> > +	if (property =3D=3D intel_crtc->histogram_en_property) {
> > +		*val =3D intel_crtc_state->histogram.histogram_enable;
> > +	} else if (property =3D=3D intel_crtc->global_iet_property) {
> > +		*val =3D (intel_crtc_state->histogram.global_iet) ?
> > +			intel_crtc_state->histogram.global_iet->base.id : 0;
> > +	} else if (property =3D=3D intel_crtc->histogram_property) {
> > +		*val =3D (intel_crtc_state->histogram.histogram) ?
> > +			intel_crtc_state->histogram.histogram->base.id : 0;
> > +	} else {
> > +		drm_err(&i915->drm,
> > +			"Unknown property [PROP:%d:%s]\n",
> > +			property->base.id, property->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int intel_crtc_set_property(struct drm_crtc *crtc,
> > +				   struct drm_crtc_state *state,
> > +				   struct drm_property *property,
> > +				   u64 val)
> > +{
> > +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> > +	struct intel_crtc_state *intel_crtc_state =3D
> > +		to_intel_crtc_state(state);
> > +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> > +	bool replaced =3D false;
> > +
> > +	if (property =3D=3D intel_crtc->histogram_en_property) {
> > +		intel_crtc_state->histogram.histogram_enable =3D val;
> > +		return 0;
> > +	}
> > +
> > +	if (property =3D=3D intel_crtc->global_iet_property) {
> > +		drm_property_replace_blob_from_id(crtc->dev,
> > +						  &intel_crtc_state-
> > >histogram.global_iet,
> > +						  val,
> > +						  sizeof(uint32_t) *
> > HISTOGRAM_IET_LENGTH,
> > +						  -1, &replaced);
> > +		if (replaced)
> > +			intel_crtc_state->histogram.global_iet_changed =3D
> > true;
> > +		return 0;
> > +	}
> > +
> > +	drm_dbg_atomic(&i915->drm, "Unknown property [PROP:%d:%s]\n",
> > +		       property->base.id, property->name);
> > +	return -EINVAL;
> > +}
> > +
> >  #define INTEL_CRTC_FUNCS \
> >  	.set_config =3D drm_atomic_helper_set_config, \
> >  	.destroy =3D intel_crtc_destroy, \
> > @@ -238,7 +301,9 @@ static int intel_crtc_late_register(struct drm_crtc
> *crtc)
> >  	.set_crc_source =3D intel_crtc_set_crc_source, \
> >  	.verify_crc_source =3D intel_crtc_verify_crc_source, \
> >  	.get_crc_sources =3D intel_crtc_get_crc_sources, \
> > -	.late_register =3D intel_crtc_late_register
> > +	.late_register =3D intel_crtc_late_register, \
> > +	.atomic_set_property =3D intel_crtc_set_property, \
> > +	.atomic_get_property =3D intel_crtc_get_property
> >
> >  static const struct drm_crtc_funcs bdw_crtc_funcs =3D {
> >  	INTEL_CRTC_FUNCS,
> > @@ -383,6 +448,10 @@ int intel_crtc_init(struct drm_i915_private
> > *dev_priv, enum pipe pipe)
> >  	intel_color_crtc_init(crtc);
> >  	intel_drrs_crtc_init(crtc);
> >  	intel_crtc_crc_init(crtc);
> > +	intel_histogram_init(crtc);
> > +
> > +	/* Initialize crtc properties */
> > +	intel_crtc_add_property(crtc);
> >
> >  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos,
> > PM_QOS_DEFAULT_VALUE);
> >
> > @@ -737,3 +806,100 @@ void intel_pipe_update_end(struct
> > intel_atomic_state *state,
> >  out:
> >  	intel_psr_unlock(new_crtc_state);
> >  }
> > +
> > +static const struct drm_prop_enum_list histogram_enable_names[] =3D {
> > +	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
> > +	{ INTEL_HISTOGRAM_ENABLE, "Enable" }, };
> > +
> > +/**
> > + * intel_attach_histogram_en_property() - add property to
> > +enable/disable histogram
> > + * @intel_crtc: pointer to the struct intel_crtc on which the global
> > +histogram
> > is to
> > + *		be enabled/disabled
> > + *
> > + * "HISTOGRAM_EN" is the crtc propety to enable/disable global
> > +histogram  */ void intel_attach_histogram_en_property(struct
> > +intel_crtc
> > +*intel_crtc) {
> > +	struct drm_crtc *crtc =3D &intel_crtc->base;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop =3D intel_crtc->histogram_en_property;
> > +	if (!prop) {
> > +		prop =3D drm_property_create_enum(dev, 0,
> > +						"Histogram_Enable",
> > +						histogram_enable_names,
> > +
> > 	ARRAY_SIZE(histogram_enable_names));
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_crtc->histogram_en_property =3D prop;
> > +	}
> > +
> > +	drm_object_attach_property(&crtc->base, prop, 0); }
> > +
> > +/**
> > + * intel_attach_global_iet_property() - add property to write Image
> > +Enhancement data
> > + * @intel_crtc: pointer to the struct intel_crtc on which global
> > +histogram is enabled
> > + *
> > + * "Global IET" is the crtc property to write the Image Enhancement
> > +LUT binary data  */ void intel_attach_global_iet_property(struct
> > +intel_crtc
> > +*intel_crtc) {
> > +	struct drm_crtc *crtc =3D &intel_crtc->base;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop =3D intel_crtc->global_iet_property;
> > +	if (!prop) {
> > +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> > DRM_MODE_PROP_ATOMIC,
> > +					   "Global IET", 0);
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_crtc->global_iet_property =3D prop;
> > +	}
> > +
> > +	drm_object_attach_property(&crtc->base, prop, 0); }
> > +
> > +/**
> > + * intel_attach_histogram_property() - crtc property to read the histo=
gram.
> > + * @intel_crtc: pointer to the struct intel_crtc on which the global h=
istogram
> > + *		was enabled.
> > + * "Global Histogram" is the crtc property to read the binary histogra=
m data.
> > + */
> > +void intel_attach_histogram_property(struct intel_crtc *intel_crtc) {
> > +	struct drm_crtc *crtc =3D &intel_crtc->base;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_property *prop;
> > +	struct drm_property_blob *blob;
> > +
> > +	prop =3D intel_crtc->histogram_property;
> > +	if (!prop) {
> > +		prop =3D drm_property_create(dev, DRM_MODE_PROP_BLOB |
> > +					   DRM_MODE_PROP_ATOMIC |
> > +					   DRM_MODE_PROP_IMMUTABLE,
> > +					   "Global Histogram", 0);
> > +		if (!prop)
> > +			return;
> > +
> > +		intel_crtc->histogram_property =3D prop;
> > +	}
> > +	blob =3D drm_property_create_blob(dev, sizeof(uint32_t) *
> > HISTOGRAM_BIN_COUNT, NULL);
> > +	intel_crtc->config->histogram.histogram =3D blob;
> > +
> > +	drm_object_attach_property(&crtc->base, prop, blob->base.id); }
> > +
> > +int intel_crtc_add_property(struct intel_crtc *intel_crtc) {
> > +	intel_attach_histogram_en_property(intel_crtc);
> > +	intel_attach_histogram_property(intel_crtc);
> > +	intel_attach_global_iet_property(intel_crtc);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h
> > b/drivers/gpu/drm/i915/display/intel_crtc.h
> > index de54ae1deedf..4e0a3c43d4f8 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> > @@ -7,6 +7,7 @@
> >  #define _INTEL_CRTC_H_
> >
> >  #include <linux/types.h>
> > +#include <drm/drm_crtc.h>
> >
> >  enum i9xx_plane_id;
> >  enum pipe;
> > @@ -59,4 +60,8 @@ void intel_wait_for_vblank_if_active(struct
> > drm_i915_private *i915,
> >  				     enum pipe pipe);
> >  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
> >
> > +int intel_crtc_add_property(struct intel_crtc *intel_crtc); void
> > +intel_attach_histogram_en_property(struct intel_crtc *intel_crtc);
> > +void intel_attach_global_iet_property(struct intel_crtc *intel_crtc);
> > +void intel_attach_histogram_property(struct intel_crtc *intel_crtc);
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index e790a2de5b3d..0c3008a2d774 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -93,6 +93,7 @@
> >  #include "intel_fifo_underrun.h"
> >  #include "intel_frontbuffer.h"
> >  #include "intel_hdmi.h"
> > +#include "intel_histogram.h"
> >  #include "intel_hotplug.h"
> >  #include "intel_link_bw.h"
> >  #include "intel_lvds.h"
> > @@ -4607,6 +4608,10 @@ static int intel_crtc_atomic_check(struct
> > intel_atomic_state *state,
> >  	if (ret)
> >  		return ret;
> >
> > +	/* HISTOGRAM changed */
>=20
> No need for the above comment
>=20
Done

Thanks and Regards,
Arun R Murthy
--------------------
