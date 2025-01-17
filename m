Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D565A14947
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 06:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D7710EA61;
	Fri, 17 Jan 2025 05:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecH6H0Q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BE310E27F;
 Fri, 17 Jan 2025 05:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737093051; x=1768629051;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BhTLbl/+6EXrsWU81Fy49UBtsA9jSAEsvwlFyx4Lo3A=;
 b=ecH6H0Q0ssub8dTF0LxavEia0+8Z10ss9u8jJCy9VukBU6j4bhHbJWwi
 +51VpZz8vQFHVJHJ2BPAmu9/L426jks3eeM4svBSvLpBS4Cg24AgRykVq
 GClEWIH2QIYkdjl8Szsobu74taAh7J2drxoRC3q/qKWR7Jfvv7dVcfCr7
 rk8rA9J1hJ6IBQo6bS3P2AWhGvcn6YLC5Zx5S3DWZQXGl6zkFjbyeMxO9
 A5RaA8e/i3OzOOUk+oapqqbvf4O5bvbKjX5ps/QmBBOaKQ0BIoI4ieS2O
 oRlk1zyi3a3zdQf3yJzIE9zA/YUD3mVJWplKvadIIkLmXHW76Lv6iFPXI w==;
X-CSE-ConnectionGUID: /2y4UobdQOecgOYNPN0fBQ==
X-CSE-MsgGUID: nRYFTHFoQeCFnbFU0H6Vjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37208056"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37208056"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 21:50:50 -0800
X-CSE-ConnectionGUID: +p9v6RaSRquXUn9aOmFK9g==
X-CSE-MsgGUID: CTJ6RBAZSI+MduSMl88gdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105501653"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 21:50:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 21:50:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 21:50:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 21:50:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZlRqqeSdHxBE1Tnok2xPRQ9x4t8NAs+/lgpJAa6p3HgvQryeMEkEuUkFejN30ygTMgyDutFevu4FbECKpUUicyU6Ym6cW8Wt3G5B8dhWdNta+o5BP73aQZYJu6FOL47HJwgPKV1DDpqfz++0JGHmHUdaDZzbJRqUYCZ4oce6SQlN9U9KX4RK1phRRMMvg5F5Qc+3zdRwyuOLE79JKEp5gTWHQkVt3nS+489S6GfuCpZgLZmoe2IADCa9tmP34WllSQMaUWJVgXTLbUdp0oflvZW06ZE9jcItFzcoNEb5EjNEem2w9t5FQGw3lmE8MvyCH55qGCSD575d1eNclIgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8+yOZrplrjWNFKbTOLT5fksxffesBYjw8Lbnacct8o=;
 b=h7j7DFPsU1XZKQ76rTVlR+UblXwIzrjo7Q49IP2VUFlQ7kn0oO3mCwKnEloljqnJZbGItAxt2e7mtEkBHM931MfJ61yW7rBTLagYiltDtzBzQSFxIHW5v4xqPOcSptBsuHZUsRXuHC3HjEP4pAAEgGqPNMz1cwQmcam56ymV3OV9CYoM5oI5T+2mzCZAzh8PABcnFDSnLxI3zvKhcorHWQevHdHbm5AKkE4c42C2z/iU00ml8FPPH+tEMrxQb0YJNoooZp74CA+Dk1cByR/Y+0zaNIMmJ+Ho4xUJHacyIMRiLyyzz9kkeDdQr4PqSWWoX3/vVxTByDfEQ0mK6Hmobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 05:50:03 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 05:50:03 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbYtFCB5lsX7WJdUO11PRG7LBZALMYRh8AgACXd6CAADEQgIAAGP2AgABDagCAAADIMIAABoiAgAENmCA=
Date: Fri, 17 Jan 2025 05:50:03 +0000
Message-ID: <IA0PR11MB730768155ADFB855C20AE3D7BA1B2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
 <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
 <IA0PR11MB73076D2B950535216961E209BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <sc52glzpdohjxjexpwayyud4mlbtygx5l4wuziw5oibqv674sf@6x2iohnm32e6>
In-Reply-To: <sc52glzpdohjxjexpwayyud4mlbtygx5l4wuziw5oibqv674sf@6x2iohnm32e6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|LV2PR11MB6047:EE_
x-ms-office365-filtering-correlation-id: fac65fb8-eab6-4e43-36a3-08dd36bac9af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Kqne5c5zzOoy5xzWK9tXXxxhOjq3cHx+676EF+nBooa1thvYVbM3AuMsFNrl?=
 =?us-ascii?Q?frG/KB08cpS71v+uZGR0WeNECLAibpM+luSA53c5tuPpxOPC52T5i6FCfydV?=
 =?us-ascii?Q?uC3OxftrohT0L7ftikXUd+y2RJprOtL0F5rsm7DULs0J5Pj8hp0JFX5ue4Lz?=
 =?us-ascii?Q?WgwzOaHoYan2C9f9cvsqvXjBdEtHJafyglxnogMcjazNDfs1OJAuG7YjYdDE?=
 =?us-ascii?Q?WlvnVL23pJxnGMYQoVfxquLH5NseQcZG3xpcbtBT7KcZEVHqC8REhodZruCw?=
 =?us-ascii?Q?sVE6Wx5urhbbnb4qopVqyNshWRic+DJS68kWh3MZ0BlqQgeaWLwXtQUILDl3?=
 =?us-ascii?Q?4pyv2iKbBJCZOdkXQ+3U081uYCEe7IBsp7PkMhOeTe/3oR/GXnNLMadwxbnD?=
 =?us-ascii?Q?w4ANX5s7DpMXwF8ngand4rDS446ua5zUq6/hZTRg2ZgdfsoIywup5APKw9RQ?=
 =?us-ascii?Q?n6laQ2gCWgQiX0P7Obz0RR/fN8weO+eijRi3NGPr1ghieRkyGxXVsYoEJ4dL?=
 =?us-ascii?Q?BZejVKpI1AmVqr68xxSorq+SKy9h8qlaGouOB4ZUUKN9SCK/Xe1VUR0bxW1/?=
 =?us-ascii?Q?wxdB4vkJk2wkzS4tP2DaGz2sh9nI7eX2bTNqTeZ94Egn+N1pmc9eBbgptabo?=
 =?us-ascii?Q?9/srJJNAHiyiNbN9r+UPdsn/w/0NF0Su/Ky1UWs0dpXiWjwtRo+68NObPvli?=
 =?us-ascii?Q?6DyuAZ03FGtPWbooZxfYRsVuOI0tGNXaHxcnVw7BgPnET8zC2VEDiRUKWNyc?=
 =?us-ascii?Q?nHS9O4yWDReDQugKVg5vJ8Xk/Ubqje58Rb8bFfKFb9z7Q8rO6fLfw507lkhJ?=
 =?us-ascii?Q?+w0y3TmGm/ajQ8NhYOBpXQy3W3CJZzUtFsZY6ZO9MYYZ26JQlKUPyZEcHIxq?=
 =?us-ascii?Q?R4kWtlPQQumEh8/9991r/gYg/XE+LmmU5vh7rXsMXjqDzrZTGl7vJ4EV8T9z?=
 =?us-ascii?Q?XBq3VpKbiYL9H4XEv713JBh3xdbU7RWL+dC81qi9HiNutgkBgrjE/qIIfpA9?=
 =?us-ascii?Q?JA2JJQ9ky9W8oAaPTYi/8yf6S1q6WE2+9Bkt2qsUjtDFxuV43OYUXdF8usvl?=
 =?us-ascii?Q?026XHtfGKapGhRNJsq+T04A1ISJ4OfRP3yN/2LX4U2n+RvTfnUrCPnlkoUfy?=
 =?us-ascii?Q?yvb6WDK+Hyn/UpMJ2xLapbqostIZ+QchgzJipQSWGmTVtS4HDBpj5BwII7h7?=
 =?us-ascii?Q?B2o1xX711puNI6c/RpS3xvbkn8MlpIow22uGObsICOZOKyRMBkFX+6QCtUr6?=
 =?us-ascii?Q?AvwTDSR+1D0w37N1MD9FabFF98mv0DXzusLd7gH+x8Y5MiprnabLIPkQRBoE?=
 =?us-ascii?Q?YDWntvXAqP1rY6x9JasEOzeTLY/tuVChTvvS3AAaoO+a/5tiO3vYseKsiKqm?=
 =?us-ascii?Q?Xx1hF5jVlC1jp1OQ0hpMYtXZ0GPYU0lBIutw6pzraN8IuY4DVFnfseLHruJP?=
 =?us-ascii?Q?3NnjbCdaMAF2o+0THCZa6VDHf+R4aCN+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pzC2uBW67eNJ2JkFvmduAe+Hqs3DO8mH8dKasYY+zsoszzN81m/5d0bVgf52?=
 =?us-ascii?Q?Yslwcul28InbxvsHQgneM4phss6bLJENLWQN7oC7776psS5gTeXLL5f1Q/14?=
 =?us-ascii?Q?qtVMoUob8g3Pv8XBu1Rf/4c+5hwBhVSWfgi+Ma5BrAdWP3EIF6PoEZdnn56U?=
 =?us-ascii?Q?KRw0jLb2lw2+uMOJF5YyinJZCewhSkG1BK44IGmw2GRH6j3jIWpMbfZ5Dt1n?=
 =?us-ascii?Q?Y5jc4R2CidzBSbI6ujd8dU/FY8J9szct7MksLzxGAxLhyCQLg65E7WlNAZ+L?=
 =?us-ascii?Q?Z+U8RCpxSA1avWSyuLhga2fhonzZfB+cGDBK6hJ62M2/iJR1fjMMPWSZ/iFg?=
 =?us-ascii?Q?JFoWsbShwefDzBMfgfDNtqUXAvjBgXTQKtA7YRxb/oeV5IpabkTpJiHtuRFd?=
 =?us-ascii?Q?4NgLDI0FSzhKgV7tObpQiOCTkiLmSrlcQ70okEjobYTHpMXlJpH7qP9uQvlS?=
 =?us-ascii?Q?B/mQIkq8fxzn/Sk+7WoP7d0BRqWdKA+pRTpEYDDWncjlceBR6VDtNCPU+/Iw?=
 =?us-ascii?Q?CcjtmBm55nPty2Atw07GAcgMdOxkf/rw4EoWu5zHBhWIXEkxUfLlccDG0Ro+?=
 =?us-ascii?Q?VAzTH3G6fCmy2xBep7tGzNDim3D053aU5ha4G3hRJRknHqzd9xJqfOG4IXf6?=
 =?us-ascii?Q?N7//7Y8BwUSLmMgKRJsVsfc+xEqn3muoei5oeSeIZKdI/+zhnjd4PHQDnKJi?=
 =?us-ascii?Q?VQao/D068rTXvLB5LXsbeHQF0jbjcZOp3PEZPivnpE//BPFuaxZS01xdF0K4?=
 =?us-ascii?Q?FPAeHwLiZa7DsTxZ1eNXKfkHssAXbNZu86Zs3s7jUS6u4LQrvz9NB/GNqz0e?=
 =?us-ascii?Q?fygF00KuBjKertAdUUKgySuLrxGjgPpmkKLiae6pSCPAlWJ1TaLa6wBmabnc?=
 =?us-ascii?Q?hf4Qf8HMhiH1OdDpFcs28iTiNWDpEWxlljaDFEFGyjhmN6xcn0MA6ODo3/X1?=
 =?us-ascii?Q?L2aKJBLo3YlW2WlWEclCVxLjpR64llr1yA7McWXQ64ynIv5x622amJcddzSi?=
 =?us-ascii?Q?cQ8MuavuEUfrQ5GATO05IEGguVycfV8gmrrfkvT3exKIDvlc/CyTpiA3dBJP?=
 =?us-ascii?Q?+LEU2JNpWI2L9xEU5rgJ5G8GmQN1Sm/SsaxlS+yHM7U8nGtIavW7o4fzYwrT?=
 =?us-ascii?Q?0x1NNAQTTxGdi0AP0AnDBJ6SrJl08ks5YRWbCzTI8m10R6y7yX/x4JEbG0V7?=
 =?us-ascii?Q?3SsST/eBiLjb8yJmNuW6A0uwJvcXPT990incueR3OPU4C49VsmWhc5hwgrD6?=
 =?us-ascii?Q?2jPByS0HCpJib7cp1al1apCrCva6n3djfPFyRsJrxtqFbpb9nWU8T8B5k6VM?=
 =?us-ascii?Q?Jpb4M38XTXAYeNLsr1bfqbnTUL0ejNnhwqV9Y3jPVRhpNX5716Idd26a10mO?=
 =?us-ascii?Q?iY+wR+lHJzk/evNQRu22TACMJ/cEbIFbuwIzTcXC5/BYG2jg3fI7iNnUpbbx?=
 =?us-ascii?Q?OJkHSWjluZIlLEffJVuq0v1GSqjMYkjw+WE/cuctMOTSbmEpSn8EJQs+APJR?=
 =?us-ascii?Q?jIp2RoVGOKzw3r1/WlaBTArRKlHhNZnDRKbzag3SeL+sBKGubithIcvmFa9l?=
 =?us-ascii?Q?zbvglBknF10d28RkguYQZqY9fmn5RG4hZOUVSUwq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac65fb8-eab6-4e43-36a3-08dd36bac9af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 05:50:03.1625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cTd28i2bGhkWBcX8l76kDNKFF+jBc4X6wwpcQpckRTdIFD5M+WvE0xQA+kmVr8UzNocYCW1snFl3lNd2wQz3aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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

> On Thu, Jan 16, 2025 at 01:33:43PM +0000, Murthy, Arun R wrote:
> > > On Thu, Jan 16, 2025 at 12:33:20PM +0000, Murthy, Arun R wrote:
> > > > > > > On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wrote=
:
> > > > > > > > Display Histogram is an array of bins and can be generated
> > > > > > > > in many ways referred to as modes.
> > > > > > > > Ex: HSV max(RGB), Wighted RGB etc.
> > > > > > > >
> > > > > > > > Understanding the histogram data format(Ex: HSV max(RGB))
> > > > > > > > Histogram is just the pixel count.
> > > > > > > > For a maximum resolution of 10k (10240 x 4320 =3D 44236800)
> > > > > > > > 25 bits should be sufficient to represent this along with
> > > > > > > > a buffer of
> > > > > > > > 7 bits(future use) u32 is being considered.
> > > > > > > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > > > > > > > significant 5 bits, hence 32 bins.
> > > > > > > > Below mentioned algorithm illustrates the histogram
> > > > > > > > generation in hardware.
> > > > > > > >
> > > > > > > > hist[32] =3D {0};
> > > > > > > > for (i =3D 0; i < resolution; i++) {
> > > > > > > >     bin =3D max(RGB[i]);
> > > > > > > >     bin =3D bin >> 3; /* consider the most significant bits=
 */
> > > > > > > >     hist[bin]++;
> > > > > > > > }
> > > > > > > > If the entire image is Red color then max(255,0,0) is 255
> > > > > > > > so the pixel count of each pixels will be placed in the las=
t bin.
> > > > > > > > Hence except hist[31] all other bins will have a value zero=
.
> > > > > > > > Generated histogram in this case would be hist[32] =3D
> > > > > > > > {0,0,....44236800}
> > > > > > > >
> > > > > > > > Description of the structures, properties defined are
> > > > > > > > documented in the header file include/uapi/drm/drm_mode.h
> > > > > > > >
> > > > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > > > ---
> > > > > > > >  include/uapi/drm/drm_mode.h | 59
> > > > > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > >  1 file changed, 59 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > > > > b/include/uapi/drm/drm_mode.h index
> > > > > > > >
> > > > > > >
> > > > >
> > >
> c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> > > > > > > ec42
> > > > > > > > c18be34e2d05 100644
> > > > > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > > > > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> > > > > > > >     __u32 pad;
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +/*
> > > > > > > > + * Maximum resolution at present 10k, 10240x4320 =3D
> > > > > > > > +44236800
> > > > > > > > + * can be denoted in 25bits. With an additional 7 bits in
> > > > > > > > +buffer each bin
> > > > > > > > + * can be a u32 value.
> > > > > > > > + * Maximum value of max(RGB) is 255, so max 255 bins.
> > > > > > >
> > > > > > > HDR planes have higher max value for a component.
> > > > > > > Likewise even in an RGB24 case there are 256 possible values.
> > > > > > > It's not clear why
> > > > > > > 0 gets excluded.
> > > > > > >
> > > > > > This applies to only SDR and excludes HDR.
> > > > >
> > > > > Why?
> > > > >
> > > > We are limiting to only SDR. HDR includes a broad range of color
> > > > and finer details, which essentially means its an enhanced image.
> > > > We are trying to enhance the image quality of SDR with the support
> > > > of
> > > histogram.
> > >
> > > You are defining generic API. It might be broader than your existing =
usecase.
> > > Please consider supporting HDR too.
> > >
> > HDR image enhancement is very much complex including multiple stages su=
ch
> as image tone mapping and image denoising.
> > Here for SDR planes, image enhancement is done by playing around the
> contrast and color.
> > Maybe at this stage we can focus on SDR and can take this HDR at the ne=
xt
> stage.
>=20
> If you define max(colour) to be 255, then you can not expand it later.
> The API will have 8 bits for colour information everywhere.
>=20
Ok will rework to consider the HDR planes as well.

Thanks and Regards,
Arun R Murthy
--------------------
