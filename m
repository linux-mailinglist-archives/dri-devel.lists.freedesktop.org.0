Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FDA985719
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 12:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627DE10E7DF;
	Wed, 25 Sep 2024 10:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo+t+lIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D3110E311;
 Wed, 25 Sep 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727259723; x=1758795723;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uaaW8SGduaaEvQbJx847EinnoBgrMDmQ3vI5NXDr93o=;
 b=jo+t+lIpr3t39TIEY/QE5eMxkj3GDWROzMqYuwYbe3pAR/37jhm0r2XO
 aSG29qHMD8N8GwXKvkNrzca7oFkO8tKumpC+W1UltjItuFSWQLGrJDz+9
 6dTNrsUs275HBkxBgtBX1esmjnvmnhn8Czc8uPQEN9ULZSE3uknTRFjE4
 R8MfRKavcVa8K9tbbSuZz8p/QkWiw6cZq0aKnWe0o2PCGcQfv/KRUxkSu
 ApCoOpjdkoYqTzaHnhVM4ul7Ab5Brg1Lbt0iq8fSdzNpKqq7XGgaE7Ic2
 slkbXVRAO3aOztqCNL5nRQIVVaGOHVBXv2nlFwg6vyw8bp99P3ALPO6Qd g==;
X-CSE-ConnectionGUID: 08TdU8AmTKubp0V4LXrDDA==
X-CSE-MsgGUID: b+2NcA3nRG6Jut2PrR3byw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36878311"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="36878311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:22:02 -0700
X-CSE-ConnectionGUID: +Ze9HoySSIiQuUoOBu0vlw==
X-CSE-MsgGUID: Di4ZNut6TkGbGz8oxUJJvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71810459"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 03:22:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 03:22:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 03:22:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 03:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmDUrtYQaDl5kKtXUvoEMU6khz5m3fjFRWGkROkCMpDWReWUO6/K9H8p/cxoPlwe5eJwwF31yyghiaITcF+0YkdCpF6UAwY7yz05rRLOsKrmLWRFlqO1bizD8OExnq+3U+CZpT1GKLrYlIe79eh8O1hIdv5rFwHigv0jGwj0JeQf3j0Yzh1/kPnKED4zbIjrPPgzpEj+HAcQJwgrn2nxzKSzriWQ8SOKYpQwU2l6L0gg/L8DRTS+1k3jHIzE2indySZRZhkTXltS3kM2nUXAUCkBRD1czhhnU0nOxnDyRzrg1Yapa/UELdvRNOMgbL4jeuee3g6MLA6Cx+rpK7KZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95/A1bFRoQLXljAB9CV/ojrzXmPDC6aqXqcDUO8X8n8=;
 b=I44owoMIaOO7RM+nzJA5W60faqFxgabxjRDLabg+1vFMEDIM9e+elyopfI91Y8+2XUTgjCSAwXXGlRP/6/Ur69EFQi6fOztRwntUY1tgv5wyCcxj1KnNCIARyEUMZrXpYlTdD6/NcJMDKTogdrVfZW6Mx43NX+oV8xJrLCCZOpUWaVFbsrGLQcjB/cOY7XdF3pQtlgwYGWEEcZusRi2zVmjMtrktMTqJjh/rA8YwGSWmyhkRVrkaZ0uvSm1aYN1Cempl2IzPxRAL6xyJwQTWp3ii/W30w356yM6DfC9rW5Mbw8I8qNRoCmmExSHBJsRnAj8k6vPJtVRM2sMbFVuZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 10:21:59 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 10:21:59 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 6/6] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv3 6/6] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbCpm5LC6VBtL7VUmDLd8pXFhs7LJoPcyAgAAVoTA=
Date: Wed, 25 Sep 2024 10:21:59 +0000
Message-ID: <IA0PR11MB7307181EA5C6C135E28BD6A9BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-7-arun.r.murthy@intel.com> <87y13g2jkq.fsf@intel.com>
In-Reply-To: <87y13g2jkq.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SA1PR11MB8277:EE_
x-ms-office365-filtering-correlation-id: 36a709f7-e3f9-4296-f747-08dcdd4be3b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ElcZ0Jxe13FpuFJ9NXcb/1POcpQPFfIwKGfxNR/e1Bw7EamJo71FJDbZO+u6?=
 =?us-ascii?Q?p6EIf6cI/AlA73jEnBpmv0+67zKBPm3zk5HIkB7YYOvreoQV1aYmVvFANCQz?=
 =?us-ascii?Q?XhuiZ/ARugjuMzmN4jHWtU5fHCq8e8MtNaoLvYfi6pho3HKuLHTpeUohELHF?=
 =?us-ascii?Q?X0e5Cmi4T/Qj29mwKBOKkMqOTyKwUrucUzfictcmW243bIDncY98z4yegqaa?=
 =?us-ascii?Q?fWYlWcacOnTNbXgAkF/BrYsfcPbXuwfmbJzkXmTcF0NhrIg9OvMP/eVzGlD2?=
 =?us-ascii?Q?clqgkvqhN8kyzPuRTwFHLMXlfUb+GSrV2eKDVqN/basL8DCtFLl8tPWUiQwY?=
 =?us-ascii?Q?4iT7n/GSWbvBC838QomGNWsDN6GbzSOE7mN4HFfECCiRZTHz3GkLim6TjEM0?=
 =?us-ascii?Q?zZeitN6nCL24ngbFJV9hu27cO/K0X2a6avEYS9XSXR3h2kAZUBSjvrCZ9K1R?=
 =?us-ascii?Q?je0zwFtQVbVzcqAVpNvDEE8OEX327dX5zWIMr04vtQCoV5/wxWf4eI+oJ2da?=
 =?us-ascii?Q?/n75L7Ove2Jlw+UJwl0yRHqbi+EQI5Wl5flZst1uCp/LwemXyf7pWp2muc/m?=
 =?us-ascii?Q?sDGpPklTvze2xqhV+7xJhyoN/lG3Yoa3TSOnoFqE2LUK4PNGhM8rnaFQ0+KY?=
 =?us-ascii?Q?2PZXLWETg5BQ3MYo+xw40aMfmcBalswccq7AZKAUN1OzLRCugBSE7njm2tAd?=
 =?us-ascii?Q?Pp1cj450DLX0AF11FbXIPwQY93SgzT1B4uytui1TNv8I64MSk9hgDjlgRzeI?=
 =?us-ascii?Q?ydypIMcT0jhcI5/J87tvyLTvr2uqtNqJDhiQE8oMawQ1Ve/FxBAqJK+bf5+X?=
 =?us-ascii?Q?Fyb4z4c+pp54Iq5Wf1ZFV4RpjSyivmwygBF8BdElj/pxIfMH0vYS7Dotp0Hd?=
 =?us-ascii?Q?24hFHeSYL+DIcLLwTw5L+QWNmx/Z5b5iK5XhmG2wRsRYmNYUf50jkJT4h1Ky?=
 =?us-ascii?Q?Z0qIE0Vsl8aDPhY/Cdr5Da+R/PM1C1fy28X2iu+NxUo7rY6ChM6k6zkBDMCS?=
 =?us-ascii?Q?oazi5GZ1pgJUn9/s5W9gpnU5pqsUxWbGc1gjlKVkLscol/ff12lIqbdhBH9e?=
 =?us-ascii?Q?l2qGcn/L8t2l9y+i8RR5GqkFQiDa1zsiImgb5VYiMKdi4/aRN5YnxyXJ+3X6?=
 =?us-ascii?Q?hw+HhcJ8/IhdqCnpibpXdUyUIMB3AQUTDWWkmrQxdtjRMdviIe+boUF25Z9t?=
 =?us-ascii?Q?ABn+OviSUL5tiDE1h/VJDxuU6xuj5e/FSTz5XYyA68IMIdgIQqVYAH4L2PEW?=
 =?us-ascii?Q?8hv26W8tZ4NjHRWp9HM3TKFPbIXVXE3ZIPxQiauLJIJdk1UztAOxyO1EytaH?=
 =?us-ascii?Q?WxGOnu9RRre6tRM52Y4wgbmpbDNK7abAVlUP1c/wI5IeUiwa1lo71UM6sfgF?=
 =?us-ascii?Q?w/fydhuk36C2+KQoTHG2oQ752wz5thqkYYIkg8h4+2KMoEjARw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fPNyFJjvanKO8K8T/vxrzsEqvSNRCqEjDE013Mp/at5XJcAr4StTVKkvhH4Y?=
 =?us-ascii?Q?8k/rANeyAHfcTYIPmPevMQEpGaZ4iVuOd+5544oONFdCr4ItA08Wf+FM4GtW?=
 =?us-ascii?Q?ICKz/lyEr719evap1P+xEg0RTAyfCYloCL1MM7khcH22y4fzZ/NuYFZvYchw?=
 =?us-ascii?Q?tN7Wfp2v58tJMqyQ/7L58tf9WxX9yQDb3+FU4USKTSJRGBIQHC3Spt7szZhV?=
 =?us-ascii?Q?L6BpKXntE6GEVP8Swvmqp6ibMPyUcgQebeOaP333kqet/fYq0X90kb5zFczV?=
 =?us-ascii?Q?e+UyYQSjDhCw0W+k8Q1TnyKX4kQ3v0xJdYFXrT9T1VopASz0K5/WiAHvjDXf?=
 =?us-ascii?Q?49i+7DPUdYGeL/1Cc9AEZ8hZSmCzG0IjSJRQVNcA53Njpcki2ZtX12XA7/nu?=
 =?us-ascii?Q?RlsvwWO8vx+v6M9FrAqd/r8vQlGBkaeCq+ruo9cbMJMdacIIsqkn8bu8Jqzw?=
 =?us-ascii?Q?ensLAnEVvc1Hjcr9/EBYshAjfOropHVSSTM2ms9aKSQVKhJj/mAjxgFWHRJ2?=
 =?us-ascii?Q?ZdRiufse7IsC7zvG4oGBrY/7y5B2Kt3is61soua2/J4a2vbQwIMryYx9S1hc?=
 =?us-ascii?Q?gg2dZYviU2yS4h92VMMtCE+yF8+WnoIhdT+vj3FUuZFERmxTdqeVTES8V79y?=
 =?us-ascii?Q?/ll9Hra6LX7JwRBdwhcBcAh4FbQIcI/DzkuUS8gxwC5l1IfvdpQwbwUrixcr?=
 =?us-ascii?Q?ueU9XSAhhNm/6EpfdTw/xJp6/6jCFjhDI9qKTw4OVHeTlo4slXtatSG1fHUs?=
 =?us-ascii?Q?Db8D8RkFTlOzwDHioAkylnja01TiBPOx4worYk1vGAFicNkQoTPoW3KNWKwY?=
 =?us-ascii?Q?maLXzy5ZJGEQc61lCSqZh9LT/RbmbsRA1ihUlfD08SprcmaQfu92l8WA2owG?=
 =?us-ascii?Q?n/uUq/RpHJ98ItoM83tlQbDJSgb1p+JHURJ3q5ISjnGUtF+ioShM/JGkwfV9?=
 =?us-ascii?Q?hvd/CkFvfWLL21qL4PPwgvu9lmuP5azSYGqGuByas13JXfqVSgWnWvt2gWlB?=
 =?us-ascii?Q?auZqKW0j6QlWnORWcPK8x14g2Snl5Z1CDoRF95N33ofAwjNuTDkKyQTBytwz?=
 =?us-ascii?Q?oZxgMiAbwOa+4eQ+Rv9e9ecu7MTp1i6zd9zVP2YfNaq+Y+T1wsp/tEOkFzOH?=
 =?us-ascii?Q?joYmwh25WTDSYeoWwrRcNAsByGDt3BTvWUF0Gkf91Dl9dAZ2/sLQvGtOIBTb?=
 =?us-ascii?Q?cwRHLGXAxFgNyeYvyrhTx4Qyoi1UmqRDXh/ZRbTm5i+N4kx5ERK1LsTF0roj?=
 =?us-ascii?Q?bRgZeBZmixjQtyb6Xw8K7wOfHt8tN4d1Yzg1vMbfXWKgu7o8Gy/Hkb57lFod?=
 =?us-ascii?Q?O/bpEavgE5FciCS29hi2iIX7YAO8RVk/WiwfPsd8jgyJ1+Z1lGd5HIZSwnvt?=
 =?us-ascii?Q?GPXfw3pfh8iLhvNlnzIFLzHx7aQhwXtZA4dNMn4bwppjszBLgBLO2hloQA5z?=
 =?us-ascii?Q?GSDkhbgmBh5kJR8rm9Av+hcaVXc0ftEpIam/F3XJx0GrQ+Qukx6ZELikIwGZ?=
 =?us-ascii?Q?x6KcPMzRUBvAx+RZqQbf3+n4a2craS8f1MnDmPrDl0DiFuxQihComYSV5rns?=
 =?us-ascii?Q?jj+hs/EEMtTtqUJhpgK8+k0WE1UwjqFFrNEYuvUyrxs1uF78cJRpsw1OsIGi?=
 =?us-ascii?Q?8JNeADhO+lnLfqK1cLIPmKkRG7HmAf+3+FGqE2mGaxVN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a709f7-e3f9-4296-f747-08dcdd4be3b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 10:21:59.1769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5DTCK2RaZHowvxu5LibZQ+n412NxG8gn5DHGMKW41JVHdGY+qC2kGYfC1g52QhCU/2SlozE/5FhfP98WuI7dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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

> >  .../gpu/drm/i915/display/intel_histogram.c    | 111 +++++++++++++-----
> >  .../drm/i915/display/intel_histogram_reg.h    |  25 ++++
> >  2 files changed, 105 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> > b/drivers/gpu/drm/i915/display/intel_histogram.c
> > index 6529a59ca6b6..02d5270b0232 100644
> > --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> > +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> > @@ -29,6 +29,51 @@ struct intel_histogram {
> >  	u32 bindata[HISTOGRAM_BIN_COUNT];
> >  };
> >
> > +static __inline__ void set_bin_index_0(struct intel_display *display,
> > +enum pipe pipe)
>           ^^^^^^^^^^
>=20
> Why?
>=20
Sorry, didn't get your question. Is it why "enum pipe pipe"

Thanks and Regards,
Arun R Murthy
--------------------
