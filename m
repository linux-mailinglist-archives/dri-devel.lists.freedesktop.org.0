Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F09ADB81
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 07:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E92610E1B6;
	Thu, 24 Oct 2024 05:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXB8fvGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD510E1B6;
 Thu, 24 Oct 2024 05:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729747569; x=1761283569;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dxF+J1DG5B3IpgPO3v0PpJzHe4uRhqjrT4VqJa6gCD0=;
 b=NXB8fvGAAfHtrDy/fPVOa2AxV+1t57aeSiBjK57BXJDiSk8i2n1OObM+
 BI/VMriCSKUi3Ize2AdUzXy9O/tbf0rXxx6JqNYuUS/ONzNN3b8D6hFea
 51lYse4fmhgZ9SRjRljabYu3OTRYESHRpbYuD6jJ3pE7lVqfhMIHOjAtV
 n29ArIVKByCDYGQvA3wg1nI0Aup19sErWuhDw2m0BadCWjmhM8baUGi7e
 AauNCS2DluTf9atdCNHhVpqWVyK7Zugjr67rCxHdTDnYtT9FokodB2g9r
 URCgwuVYuJkdEj84mBNMVGI/Jto8GUJAeKe4XmarKETo+f0RytxyEfDc0 g==;
X-CSE-ConnectionGUID: KDZ9fnTOSZ2pevtCJ38dkg==
X-CSE-MsgGUID: aHb5BhZbTVW38R60AyPgjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29472057"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="29472057"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:26:09 -0700
X-CSE-ConnectionGUID: 4+NTy0I9TFWdqaiZyvqTpg==
X-CSE-MsgGUID: 12fCqVupS8m2q1c3XiylNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="85274568"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 22:26:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 22:26:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 22:26:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 22:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syKceV7pbc38U4SnS7MU3ZA+12/wdyaIamnQwj4JSA710Vo1LuAkVBu7xKw0yLPz3f/W+UQMwHAt2oCZihhnK9fu26zjfwGhVWs4zryBDiRkyvGhlQMm7A2QkAQ5CrgGyNMfyRJY4XXiVAAAjHvkBZoC//uhCFc0xRmUBGwgxm3AYdMuMUvGqummPLT94gTfagTipOzQN81wL+gS1UxQ/evIjQNGlGLTNF/G+ekTL2Lz6TEYPJaDdu6Ki86KgXMg5moOgkQ/dyHTtOgDhXFCIWQXZlQM+/ty1ooSMLQ2iGUCE3s4dn5ic40aBimQNLIayY+/RwSTwJL6jfaOf/4vNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAgU/ZuydQLMN4Fha+8GTRg1W3ZkteKLFKo+i6Y65Vg=;
 b=zLCLbzRhK2oRLA4YR/jpZ7KeETXJB8cgeGErXDUtpXHd15DdncGZ7Wil81IdkuMaAbX1LpsWYE6UyOPTMk4Si41avUJSCXIMPW0O3AVWR1Uz06Rk78OKLLQwj4qJD6+eV6OZ6SlLGAiqRt3IKTRbGu+gKHWXNf7ZON83DG7QrKft+Nwiq5/W2SmAmnaS71mdbvWyMTGJMzIC9JkPzl0qQb1Mxt2oEQDZw06riVIw/PkeL6dBCuYrHbfIZ6ka7tvWbr7YZ29OHrdtrT7LIa6O43ABv3f5N6QJJLZCaXreOID3TL76tdR2zT/wXH1IAMvtN7zAKCQryV1wNoxFPUy6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 05:26:03 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 05:26:03 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv4 4/7] drm/i915/histogram: histogram interrupt handling
Thread-Topic: [PATCHv4 4/7] drm/i915/histogram: histogram interrupt handling
Thread-Index: AQHbD14xgE0t3xik8U+DH5H1dshgBrKViXSQ
Date: Thu, 24 Oct 2024 05:26:02 +0000
Message-ID: <SN7PR11MB6750B77A8EB237CB0E2BF374E34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
 <20240925150754.1876893-5-arun.r.murthy@intel.com>
In-Reply-To: <20240925150754.1876893-5-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM4PR11MB5293:EE_
x-ms-office365-filtering-correlation-id: e265c8eb-6eb6-43f9-12e2-08dcf3ec5a27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vkz+hI/ZsDNatH5QtVF1Mc9l7X8d/q9Po9thjxapVvmwI9aqfsI1HXs3pf1h?=
 =?us-ascii?Q?ADph1xTfuL6IDIBgYgc/QVZRDsLooEJAgBIG5SC5GPBqwlBy2bagyDZjukKk?=
 =?us-ascii?Q?0pAqivo+7GR9r2X9YqhLDAflrc3lhVbfZxIunoCEaaLBBo2JEMHo3e9zwLGl?=
 =?us-ascii?Q?g6Ncp6vWbXT2uezVMKDLmqSSHXXyXDFWJtPnydd6AD/Tn9MRLzwzmP0UpkZo?=
 =?us-ascii?Q?i2RMzmroz34l3NiyCPr47fxlqCDVFEKN54h4u7g8ALcjBc2EBkEI4FdNNFRd?=
 =?us-ascii?Q?SAQ1DZpqks48di/5oNDFEtnC0POXdS0yPmhCn24xLEQ/t2S0F0TvSELS832x?=
 =?us-ascii?Q?X5OfnGayfyLHNLSoCQtg9KXtmvC+m0FYEhm3mcGofhxOq0DAt6JSAV6BA2MU?=
 =?us-ascii?Q?82AUdAmrdRdAZbVKmpCvn2Sp/FWkZjBDLiHroXMcRq97TooZ4TGc3Y5f00hy?=
 =?us-ascii?Q?1Dt6SfeqCs5cD2P6BgAWG786ZWlpxkZqOXSpvg+DlHeoel2INlv5yoTGN4WQ?=
 =?us-ascii?Q?X5DnUUhgpL6DWsf+QXYsDn7ZloHYo5Dgi1+57O/eG/J+/n526eyd4ILRiY94?=
 =?us-ascii?Q?vGdKCheU73w1Tdw0uvFA0j0B7zcDiwsm8vtjLiv72u82KptTBm/NNjQJVU2z?=
 =?us-ascii?Q?N18SbKTKc/PBkft5CbgH7aVag/VFUDwpJPDWG5AoTP4Y1lQZ+erSXXShetEa?=
 =?us-ascii?Q?Ky4MIkyN5ObQY0TVA8N/4nJ+a8CbQIpQiMQPdnYvcBOtv69Groe9jftk7GFD?=
 =?us-ascii?Q?bBbQ2inBLraifuN+f5j1dImkKvoF06TLe2uqh+dMfJj++hngjlFIH1ErOuUY?=
 =?us-ascii?Q?mZ1AgTAovrv93JwaXo083iwj8HRSQTInX+0LfQGPPhFz2qbiUlIcZg6o5SHP?=
 =?us-ascii?Q?s2hFNbsPn3BiKYaq8LMvBPfAmrglQaIxh/vQ7WOhCcawpu1ajDjpdBOHGxjA?=
 =?us-ascii?Q?iONSdUUJ4nViYAA6Vh19fyE4VPCKFTXRU+XYQ0Ov9KWVRGL5jXj0GYjqFXBm?=
 =?us-ascii?Q?zdnNbK2T5w7KRcwlAfqjO2hbTosE4tHhUcLv8HsFiGmcl18rykCjD4m2fhnH?=
 =?us-ascii?Q?Gj0U5rHwhP5KZa3zlFZWFCqu53HwbFwo8924Timfv5tVoL8UZuR2fAAiQn81?=
 =?us-ascii?Q?v6xq2NH19nw7DASkZYtpIVfGBSzVLN4GjLl4YUkfo5QeDqrHyr3MnFQLrfbS?=
 =?us-ascii?Q?1yWr46CW/dRwZ80hBJfMPCPylqb8x09e4UL32apWqsWutFBM4ErOsNonjxcA?=
 =?us-ascii?Q?+e2kUgkEeCA8KlDaeCuKt4xNZqVIdDHIZFvBSKtKV8YQDGkHDwWl2QUh435E?=
 =?us-ascii?Q?O4dMZBKWESO2edLxXmBUbRwrkc7HtI3kmJlLzEwbTIYqIRt+9SqZzKoQggXA?=
 =?us-ascii?Q?AfsZBJE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?51Ogm9iJkJfizJLWYOvqye9d62ZtNAk2P7BeMG2gvlVp7jpNuECNIDdySFgR?=
 =?us-ascii?Q?FZTyV2jJDEVEni+CSVC7kToxzwCvDn9bjzpxI5/KIeNGVGEOPBY/XgKzj/kQ?=
 =?us-ascii?Q?VPfMx1OOixH4nQvAi7gTOkqDbVPp4AWF7OvY9O9aGafLSSmHEDIDxlVDgiLM?=
 =?us-ascii?Q?8a9GSMhZ1hQLA+Kl93kzyEWCok84ZYFvVYuXcv7BIGavuEdlbTmO/AvCIb2m?=
 =?us-ascii?Q?wqbo4jPmxONrJ9VdIe4biqdsxkzWWOEMGw+HuiOOKZNb3cX8DW5nA4YDseaX?=
 =?us-ascii?Q?+89yE4lC0dUrSSx4KPtutywgwKLQ5LbAVKDhU/MgS8WCiktnBPVJFvfzQ0WA?=
 =?us-ascii?Q?kJF8NlhQPtNH3dzGjIsGUOePnSgDV4lQaASfdqmyjphtaYadO5RxKU1M3nvx?=
 =?us-ascii?Q?qSTef01X2rjTH85f9NUHTuL09Gx2ZfPmEtTKEpNyGmnSE2jYYWrjaauRHCQo?=
 =?us-ascii?Q?+GyD5NeNi7L+OOWsiqfKP8mzE34sqTNkb2gKB1ry0eKIWHYrOYRhKqlN/mnA?=
 =?us-ascii?Q?gDbY5wADGphogdWIBcgWznYujpGfARKjOTFBSfKHjL3j4PekqmM2rPXQzvFg?=
 =?us-ascii?Q?r2+j9RzD5RZamPwaKVHQlY8qcdWsIyt7EpcUIlgVc85p9LjOiV+nP8562Clr?=
 =?us-ascii?Q?RmR70d7x0H4RFSvR1zSBXdYgyX75l4TGB6W9roBWuO7LjHftZd+m3W6if1mh?=
 =?us-ascii?Q?YJwtvh4B2eBn/AKKxWNsvaCGVEfQkmF7VKez9nbGKTaOf4HBw+E5XIxnL6HT?=
 =?us-ascii?Q?HlpNbPSkH0+mPWiSrvyd+lPq5lYdwOK1dmwz5ohPHHRtnENAp18B/xzdCUV/?=
 =?us-ascii?Q?As1c/oVOF79XlP4dQTdCE1ib9aQxtTrkV2e5PphhiCUxq4qNBU3DVMSpquTf?=
 =?us-ascii?Q?XDQy8xtz2ny4p15lzSFtpuAqFiDOyvaAtO2cKmR0CSeloyVK2AgZEFOLTuF9?=
 =?us-ascii?Q?mnCaaMaMDj5bZD1VbwDPebxT8ADLCa/v0/ruHsjiv3QcSryLNNwqEKPMU+sr?=
 =?us-ascii?Q?Z1G0wUN00q92fv8AELv0Gks8QjuZ53QNdPJ2BTZZJM8uLytxS2fWdQh2QYcb?=
 =?us-ascii?Q?F3R/fi7YdrGeN+J/kjtCqfV07k2JMoVHBZEyMgA5yeYbzauan/rij6xhtgkT?=
 =?us-ascii?Q?E96XmnI8Pn6PWJM5pp8HDaY8ixiXYofSqskuGOM35Gp3M7/ZoQ7RSsQt8/yS?=
 =?us-ascii?Q?cwgadatj5szvR0iw47HHIhnBxCVF0UmPknZmvn3KsIGZrT/WzD3lEdmD8QPj?=
 =?us-ascii?Q?LfNgq8Y1ZKp9Kuvj+xZG+IUDhggiLbswZt25fucJzXE1IB/GUOHq+bDrNOgP?=
 =?us-ascii?Q?6iKigglKAEfIrEagOeNwcbfYV9h7qBK5DYTNFIflGGRFJVFTS0d6uXy31dki?=
 =?us-ascii?Q?5GFpS8rOJ3Bc0pvucWneVfYxz6l5+ab/U5ra6o8z+iLW7Nem+YFzZCyjMUD8?=
 =?us-ascii?Q?FnowX75PmWb9tiQ8TpkXzmqtSaHrElyVWo0Iouy7VHDe+uhRH32OEwj5cUkr?=
 =?us-ascii?Q?yNrrlmqFQSYtcaF2PpixWJrutd4qjJjiW0oSf6wKCcB+YPG1WfDrRDEQBIWQ?=
 =?us-ascii?Q?1myuhUM4S5LjQJfbb838Ozssh1xVOliGTvGyNvRk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e265c8eb-6eb6-43f9-12e2-08dcf3ec5a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 05:26:02.9609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdPVK77Y1pixw+UnmelqFBpFyeEeJzJLV4i8EnsmWro3sa0F2JvonxZLAEOOH0uMTpk8B5U4a8PcGjHKXB/QFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Wednesday, September 25, 2024 8:38 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv4 4/7] drm/i915/histogram: histogram interrupt handling
>=20
> Upon enabling histogram an interrupt is trigerred after the generation of=
 the
> statistics. This patch registers the histogram interrupt and handles the
> interrupt.
>=20
> v2: Added intel_crtc backpointer to intel_histogram struct (Jani)
>     Removed histogram_wq and instead use dev_priv->unodered_eq (Jani)
> v3: Replaced drm_i915_private with intel_display (Suraj)
>     Refactored the histogram read code (Jani)
> v4: Rebased after addressing comments on patch 1
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_irq.c  |  6 +-
>  .../gpu/drm/i915/display/intel_histogram.c    | 93 +++++++++++++++++++
>  .../gpu/drm/i915/display/intel_histogram.h    |  3 +
>  drivers/gpu/drm/i915/i915_reg.h               |  5 +-
>  4 files changed, 104 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c
> b/drivers/gpu/drm/i915/display/intel_display_irq.c
> index 6878dde85031..40514966a2ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -20,6 +20,7 @@
>  #include "intel_fdi_regs.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_gmbus.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug_irq.h"
>  #include "intel_pipe_crc_regs.h"
>  #include "intel_pmdemand.h"
> @@ -1190,6 +1191,9 @@ void gen8_de_irq_handler(struct drm_i915_private
> *dev_priv, u32 master_ctl)
>  		if (iir & gen8_de_pipe_underrun_mask(dev_priv))
>  			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
>=20
> +		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
> +			intel_histogram_irq_handler(display, pipe);
> +
>  		fault_errors =3D iir & gen8_de_pipe_fault_mask(dev_priv);
>  		if (fault_errors)
>  			drm_err_ratelimited(&dev_priv->drm,
> @@ -1756,7 +1760,7 @@ void gen8_de_irq_postinstall(struct
> drm_i915_private *dev_priv)
>  	struct intel_uncore *uncore =3D &dev_priv->uncore;
>=20
>  	u32 de_pipe_masked =3D gen8_de_pipe_fault_mask(dev_priv) |
> -		GEN8_PIPE_CDCLK_CRC_DONE;
> +		GEN8_PIPE_CDCLK_CRC_DONE |
> GEN9_PIPE_HISTOGRAM_EVENT;
>  	u32 de_pipe_enables;
>  	u32 de_port_masked =3D gen8_de_port_aux_mask(dev_priv);
>  	u32 de_port_enables;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 86439636b490..ce2a5eae2784 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -18,6 +18,8 @@
>  #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300    // 3.0% of
> the pipe's current pixel count.
>  #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000   // Precision
> factor for threshold guardband.
>  #define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
> +#define HISTOGRAM_BIN_READ_RETRY_COUNT 5 #define
> +HISTOGRAM_BIN_READ_DELAY 2
>=20
>  struct intel_histogram {
>  	struct intel_crtc *crtc;
> @@ -27,6 +29,92 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>=20
> +static bool intel_histogram_get_data(struct intel_crtc *intel_crtc) {
> +	struct intel_display *display =3D to_intel_display(intel_crtc);
> +	struct intel_histogram *histogram =3D intel_crtc->histogram;
> +	u8 index, retry_count;
> +	u32 dpstbin;
> +
> +	index =3D 0;
> +	retry_count =3D 0;
> +
> +	while (index < HISTOGRAM_BIN_COUNT) {
> +		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> +		if (!(dpstbin & DPST_BIN_BUSY)) {
> +			histogram->bin_data[index] =3D dpstbin &
> DPST_BIN_DATA_MASK;
> +			index++;
> +		} else {
> +			/*
> +			 * If DPST_BIN busy bit is set, then set the
> +			 * DPST_CTL bin reg index to 0 and proceed
> +			 * from beginning.
> +			 */
> +			retry_count++;
> +			if (retry_count >
> HISTOGRAM_BIN_READ_RETRY_COUNT) {
> +				drm_err(display->drm, "Histogram bin read
> failed with max retry\n");
> +				return false;
> +			}
> +			/* Add a delay before retrying */
> +			fsleep(HISTOGRAM_BIN_READ_DELAY);

Why the delay here the bspec does not mention this it does mention waiting =
for a vblank=20
After clearing DPST_CTL Register Function Select to TC which is what we sho=
uld be doing

> +			index =3D 0;
> +			intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +				     DPST_CTL_BIN_REG_FUNC_SEL |
> +				     DPST_CTL_BIN_REG_MASK, 0);

We should probably only be doing a intel_de_write here and clearing DPST_CT=
L
DPST_CTL_BIN_REG_FUNC_TC will only clear the required bit since that all th=
e bspec expects of us

Regards,
Suraj Kandpal

> +		}
> +	}
> +	return true;
> +}
> +
> +static void intel_histogram_handle_int_work(struct work_struct *work) {
> +	struct intel_histogram *histogram =3D container_of(work,
> +		struct intel_histogram, work.work);
> +	struct intel_crtc *intel_crtc =3D histogram->crtc;
> +	struct intel_display *display =3D to_intel_display(intel_crtc);
> +	char *histogram_event[] =3D {"HISTOGRAM=3D1", NULL};
> +
> +	/*
> +	 * TODO: PSR to be exited while reading the Histogram data
> +	 * Set DPST_CTL Bin Reg function select to TC
> +	 * Set DPST_CTL Bin Register Index to 0
> +	 */
> +	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
> +	if (intel_histogram_get_data(intel_crtc)) {
> +		/* Notify user for Histogram rediness */

Typo *readiness

> +		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
> +				       KOBJ_CHANGE, histogram_event))
> +			drm_err(display->drm,
> +				"sending HISTOGRAM event failed\n");
> +	}
> +
> +	/* Enable histogram interrupt */
> +	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> DPST_GUARD_HIST_INT_EN,
> +		     DPST_GUARD_HIST_INT_EN);
> +
> +	/* Clear histogram interrupt by setting histogram interrupt status bit*=
/
> +	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> +		     DPST_GUARD_HIST_EVENT_STATUS, 1); }
> +
> +void intel_histogram_irq_handler(struct intel_display *display, enum
> +pipe pipe) {
> +	struct intel_crtc *intel_crtc =3D
> +		to_intel_crtc(drm_crtc_from_index(display->drm, pipe));
> +	struct intel_histogram *histogram =3D intel_crtc->histogram;
> +	struct drm_i915_private *i915 =3D to_i915(intel_crtc->base.dev);
> +
> +	if (!histogram->enable) {
> +		drm_err(display->drm,
> +			"spurious interrupt, histogram not enabled\n");
> +		return;
> +	}
> +
> +	queue_delayed_work(i915->unordered_wq,
> +			   &histogram->work, 0);
> +}
> +
>  int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)  {
>  	struct intel_histogram *histogram =3D intel_crtc->histogram; @@ -105,6
> +193,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_cr=
tc)
>  	intel_de_rmw(display, DPST_CTL(pipe),
>  		     DPST_CTL_IE_HIST_EN, 0);
>=20
> +	cancel_delayed_work(&histogram->work);
>  	histogram->enable =3D false;
>  }
>=20
> @@ -166,6 +255,7 @@ void intel_histogram_finish(struct intel_crtc
> *intel_crtc)  {
>  	struct intel_histogram *histogram =3D intel_crtc->histogram;
>=20
> +	cancel_delayed_work_sync(&histogram->work);
>  	kfree(histogram);
>  }
>=20
> @@ -183,5 +273,8 @@ int intel_histogram_init(struct intel_crtc *intel_crt=
c)
>  	histogram->crtc =3D intel_crtc;
>  	histogram->can_enable =3D false;
>=20
> +	INIT_DEFERRABLE_WORK(&histogram->work,
> +			     intel_histogram_handle_int_work);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h
> b/drivers/gpu/drm/i915/display/intel_histogram.h
> index 9d66724f9c53..14f2425e3038 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.h
> @@ -9,6 +9,8 @@
>  #include <linux/types.h>
>=20
>  struct intel_crtc;
> +struct intel_display;
> +enum pipe;
>=20
>  #define HISTOGRAM_BIN_COUNT                    32
>  #define HISTOGRAM_IET_LENGTH                   33
> @@ -27,6 +29,7 @@ enum intel_global_hist_lut {  };
>=20
>  int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
> +void intel_histogram_irq_handler(struct intel_display *display, enum
> +pipe pipe);
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable); =
 int
> intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data);  i=
nt
> intel_histogram_init(struct intel_crtc *intel_crtc); diff --git
> a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h index
> 7396fc630e29..7e062d6c8901 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1643,7 +1643,7 @@
>  #define   PIPE_HOTPLUG_INTERRUPT_ENABLE		(1UL << 26)
>  #define   PIPE_VSYNC_INTERRUPT_ENABLE		(1UL << 25)
>  #define   PIPE_DISPLAY_LINE_COMPARE_ENABLE	(1UL << 24)
> -#define   PIPE_DPST_EVENT_ENABLE		(1UL << 23)
> +#define   PIPE_HISTOGRAM_EVENT_ENABLE		(1UL << 23)
>  #define   SPRITE0_FLIP_DONE_INT_EN_VLV		(1UL << 22)
>  #define   PIPE_LEGACY_BLC_EVENT_ENABLE		(1UL << 22)
>  #define   PIPE_ODD_FIELD_INTERRUPT_ENABLE	(1UL << 21)
> @@ -1666,7 +1666,7 @@
>  #define   PIPE_HOTPLUG_INTERRUPT_STATUS		(1UL << 10)
>  #define   PIPE_VSYNC_INTERRUPT_STATUS		(1UL << 9)
>  #define   PIPE_DISPLAY_LINE_COMPARE_STATUS	(1UL << 8)
> -#define   PIPE_DPST_EVENT_STATUS		(1UL << 7)
> +#define   PIPE_HISTOGRAM_EVENT_STATUS		(1UL << 7)
>  #define   PIPE_A_PSR_STATUS_VLV			(1UL << 6)
>  #define   PIPE_LEGACY_BLC_EVENT_STATUS		(1UL << 6)
>  #define   PIPE_ODD_FIELD_INTERRUPT_STATUS	(1UL << 5)
> @@ -2505,6 +2505,7 @@
>  #define  GEN12_DSB_1_INT		REG_BIT(14) /* tgl+ */
>  #define  GEN12_DSB_0_INT		REG_BIT(13) /* tgl+ */
>  #define  GEN12_DSB_INT(dsb_id)		REG_BIT(13 + (dsb_id))
> +#define  GEN9_PIPE_HISTOGRAM_EVENT	REG_BIT(12) /* skl+ */
>  #define  GEN9_PIPE_CURSOR_FAULT		REG_BIT(11) /* skl+ */
>  #define  GEN9_PIPE_PLANE4_FAULT		REG_BIT(10) /* skl+ */
>  #define  GEN8_PIPE_CURSOR_FAULT		REG_BIT(10) /* bdw */
> --
> 2.25.1

