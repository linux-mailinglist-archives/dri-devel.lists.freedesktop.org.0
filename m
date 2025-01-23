Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04845A19F53
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 08:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E91A10E789;
	Thu, 23 Jan 2025 07:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzHwJeis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC9C10E780;
 Thu, 23 Jan 2025 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737618438; x=1769154438;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=45UYrvb1T/dN8fEZOWIktyFDnEv0FB7fJp2vst8wovY=;
 b=TzHwJeisxmfcIqzJV1YHCkNvXIbRqzdg+q/hBfNzzpIAKthdNgMPZ56e
 RRBXt/jf4mbCTxvwOCLHVWQFdr9MQGRZwu93qf1qDRW+P7oCUFwzLw+Qp
 VnDhARhtwwafAiwR9zMRNmUnkT/Y8j8/+rL1LT3i8DCS8nZ4koUXzY5AH
 7COAQ4xyRalCKl4YWDGlNOeurWINOeaB2Hu+mR3XfyXIl4yYdfwb9HUBF
 eK53Zryj/xr84TmIEHgZo/STma1yaBd4cLNA2HoxIi+wYgrf14yCLlgQ2
 hEw7gNLhc0I0vmWo7IIGjYmSes9Q19JRYqzgpVZWV7+E93kiaGkMaigX1 g==;
X-CSE-ConnectionGUID: 6PvniNi3TtGH8tuVvjauxg==
X-CSE-MsgGUID: W+59WlfmQqWJLgyw2u8Axw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="42034685"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="42034685"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:47:18 -0800
X-CSE-ConnectionGUID: AIu+izAlTguvO8WQIejltQ==
X-CSE-MsgGUID: Pc0LJF36T/2j+n1bpQ2qLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107982166"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 23:47:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 23:47:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 23:47:17 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 23:47:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJdlPCMQaHaQEogkzBeO7n4wV0uUNKTtZNsBXZcbVQHBytviV0Q+v9IIQpqWnRkDm7ItoudSni8agRBqxUOpIWHAKphS3d1DaByuukpr2/q6Fqxz1DL3rbxoLKupygkOwFMHzya/LyUIKOOD0Z+tv4/oprJmr/PSjXP1Cpg1PuNlX2ZMdXb7+npJJElIVILcwRPJxcmDZq/Ac/cnO+eD0xToJiAocDMlag328/bgEQ5t2rXxHOwCUBohRSD6OD9IvN2QdyD+mUzvwM+F1b0TrjIITP8JZmAGvH3gW+Gs0bYg/11Ou7qhYqon27ZacFFREbMbCUqSTzwNvvag3ZJrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVdx9+8qNV+frtzsjNPuwDY4f5sdFh65p+lo0LJszRk=;
 b=f3V3xX9TPYsBgsUYQy8gbIpzKfh2+rd2Qd3en21vx3FqE/X6b7XmheOvt1CGSWDQKR//qqUyH2y5rAM++c8RqnwCG0B4zKbllk0SUQhxKM9/aBFc17hOWsZBKtg8fuexj5quBYk/So9uX+3KlBpP9JKgEMSEG/g+VQ3xQjfVEaaq0K1AYsx+e0b6eQUz/orrjfhWCxAVWxQxJOLOteiBL1WcE2uyYlOqmJg6YAnkIV5EvzhrmYKt97Dd431LT+Q25aM8CpVPVjHYM8St27AuQy36+Wrp8uGk71QLblQG3h/RMyTDAvCOUWuiCqs7fIR8PmpzIUdg/kunFyNqDsHVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 07:47:14 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 07:47:14 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzhgFMA5eT/kS28E0OXJhdlLMgNIsAgAJivbCAAXgNQA==
Date: Thu, 23 Jan 2025 07:47:14 +0000
Message-ID: <CH3PR11MB7300A783B09132F6612DDA1EBAE02@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com> <Z461PqtBPu2z9GPh@intel.com>
 <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|CO1PR11MB5188:EE_
x-ms-office365-filtering-correlation-id: d38c5163-a939-4d12-dcb9-08dd3b8226f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jkBH/VNL37euBDnCuwgq5Ah2UsUZWJw7G0gFWZuNIjx+2YSFwb1bnCC3J5?=
 =?iso-8859-1?Q?/ht9I3ADDJ7ZL/IXPd2V0ExEB+5xFGpYgWng7Ebyg/xMYE2/L89/GWKGtD?=
 =?iso-8859-1?Q?Y1bp3oqg95VRun90S4a5PssmIlnIRD0ZzzCvEXNA6qn58PT/cuvdbmZIUz?=
 =?iso-8859-1?Q?NVonXRXH3sQnPHiVPuqts5VhAZrQMpJWvzBvA9rzpZwm2ZvopEdQUwHagX?=
 =?iso-8859-1?Q?Nup/LGLeZD9kIcSXaEgW1lHolrm8fBa3elFu4LpHrEd+eiRz2EMaDQnRLd?=
 =?iso-8859-1?Q?u1pxjkZP7vo+XKZZ+0mS8bMRZp9m49lVhV0hlvu7RgCalukwE/OcDO3YHj?=
 =?iso-8859-1?Q?L0nTZXOJ2QtN3WQwuBzN5vYliRizUncrhBGOdmBAQdmcb2cnSEqeMW27+Y?=
 =?iso-8859-1?Q?2odWJQpJrXu58Tzu6UMSsazvemexYMXjoErOtpxFxsYkqG59ydhBtH9OU7?=
 =?iso-8859-1?Q?leLPvM/bnQqg4cyCmhbkFxXgNhrD6zsFxuQydEw/agJ5E//Nw4TUxvnNqR?=
 =?iso-8859-1?Q?Xgz8TdMHZFy5uQyDB9xJG8cOk3jcNSfdnU6pz8SW4PrUSqidoPmw77i/4L?=
 =?iso-8859-1?Q?KMHV4+NQKMjKoM9E7OG4sODQhgqwbDzyVrHBs9Oc1vUzY9/RnQKjYA5kz1?=
 =?iso-8859-1?Q?P8MZ4VgE3PhI3jV8wuSjF8MV+rMMpB7yyvbNo9Nu8udjkqcuDLORciSPDk?=
 =?iso-8859-1?Q?T0SPdE/7kyJzRcVv+F75BAWBbdETXrufjOuNcRbR98t4LmgR9PW8Q3kh+M?=
 =?iso-8859-1?Q?OE1fA3bjG3mhHFz999M3U7PXaRXxm4KEn7kVLUXIcVbenNVAAWwasWQmvG?=
 =?iso-8859-1?Q?OwoXeyWVsZX8xBOA78rREhk5XyzP/OCOFA266u/owfpmjPcxgF4lPdnUCS?=
 =?iso-8859-1?Q?DnDe42hh24SOtDN/mNJNl+5q0fg2p2i/bKxqCOP0MqPQSrXfCB1gTF+o4G?=
 =?iso-8859-1?Q?pSW+rljftps24Zqktr6L+dSX/UF96KbKVt3eF6/GOhzPC+JUgxshmMaSlh?=
 =?iso-8859-1?Q?/s42q6jtpWtrFKnThMH0XBsEvJdBl52MW1qh/+8NaS0kPcbzUFdwQ7777t?=
 =?iso-8859-1?Q?u0WWEz+YSNbPkbNVkzEThV/87OUDBBYKZcVW3dJMaCOasUxUmhDo4beB0I?=
 =?iso-8859-1?Q?cuACwNZgMTEJj1ScjuyiT2dO1i26onWVs+K7t+R6t7MVcUIDG2ZiZ+XOeY?=
 =?iso-8859-1?Q?DZW1cMUo3WAylh1F6FORCG1w1n07NshNqXrusbQjIrpgZy9eSi1VFgF7Rh?=
 =?iso-8859-1?Q?eIXJkmiayBLHb9+WbaT3KifM5QT9719nm5eLoCXDmo3HEvgyLW85Uyj3sT?=
 =?iso-8859-1?Q?L0GVEwVFFltrbjMUARm/5ftUolxUUugTXa9iU28PlvbO4yXdAOGmvHTM4E?=
 =?iso-8859-1?Q?KcuzrjN0T/nL14NO5T2IuitaUtPMnnkwN+Lc32diYpL5tz02C4TRhEds5u?=
 =?iso-8859-1?Q?6IEFwhos2dyrjT9FMfBaXrdig1f/E0ciZvvipIzJ1F1twuxhJFRYkKS9mu?=
 =?iso-8859-1?Q?F9qTmzfU7bEDdJNpymcQYf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6TXtgWU41qJ1+kgMi18eQo/ZEoEtpWbmHcO7r5AQPKS8EqYNvjDBwdhOt/?=
 =?iso-8859-1?Q?e9nnhlIk6STRo4bQZRms1XZHxjy4uM4pz2AoeIwDRJSvFEjdJPe6fpugxC?=
 =?iso-8859-1?Q?erEhpPFYs44VTmyshoBK2z2zg73K07kLX1RSdoB0wKNfmoC0CzriIHtje6?=
 =?iso-8859-1?Q?k45KnPth2rA7msvF9HLB5Vc8X/NJKrQhBmbWAJbLfPRHg8FLqcaCzDAg0T?=
 =?iso-8859-1?Q?0+HLX2CmWU6FpW0ByIe81ldfg0kbyJ0rReBECDWEgSy6dOZecMG7TGcFAR?=
 =?iso-8859-1?Q?GBKHk4/bBDOrMan0zNZ5nxW8nKpg/LcP0RacE/5NIaip0gl4Qx9MZ3E6Ud?=
 =?iso-8859-1?Q?JNon4fZk4BrcoeqaX4EZtvaqgeRXAZ9m0VV7WN3uj5/mhdtKTXe13eTtld?=
 =?iso-8859-1?Q?GmJK+cZjtZTAdxPHBLA37AGziaHgbMJ1rTR3esO1tOfD5kBbLl3VSALfAh?=
 =?iso-8859-1?Q?QnSap48BZw8etXvdeBcx5IflUd5FY52AdzVHGFqZVADN7dklY5/PN4shq9?=
 =?iso-8859-1?Q?iXD330YqojODuIXnXKmkAPcPPQuBLJ/dGFOb2B0bhpecGwrbsLhh0HM0o+?=
 =?iso-8859-1?Q?z0dkfdzGuu/FjcrCf8zPBjbjYde1A9d1AGg3fryEB9bGJ9GZKaoMiG+MXk?=
 =?iso-8859-1?Q?CO0pcb2AvnizIC7Dk5/7ErJXRmuYclxHfJCdfuceMmAYCejsTfTioIvDVq?=
 =?iso-8859-1?Q?MPyM+hUa57bzTiV8a9sDWOKfgHcmk6ws79EtRxISAHDFoPDn6zAFx7tD5s?=
 =?iso-8859-1?Q?18MBnJnHe9n49IVWhyJGgjEh2Jj7a9d4vdvAZmPOq1S/CV+MoS2OOwc9Ji?=
 =?iso-8859-1?Q?kDUsVriB6Swy+JiiMd+lJZgjhqckMFJ6Uy/doqQMstxtsX4wj10U7e0Tem?=
 =?iso-8859-1?Q?KgUeAreKCH/vUVipWWaV8y4jZw2zUPNMXsHWTrt/jcPQ4peptJ5Db7CBPs?=
 =?iso-8859-1?Q?Zs52XLOTUV9OK2JSvenylUKaeYR+b7XT2fZ5vq7qIkReJlBNoxcohz9n3a?=
 =?iso-8859-1?Q?P4ef9p92XjYpaq0mvT0CRO97WZi2FBZItUINUrXbyYM95OHkQlHSldNr/f?=
 =?iso-8859-1?Q?E6Tn1Tyf4Rr43dCAIhd/2V7kGHBNBcsaIczEcM2F0mdeLbFTNbqzy3LkV9?=
 =?iso-8859-1?Q?L7LBvsDIDtBjin3HVkKEDNK0RjA60ammICuXZWPnzjI9eTox+7yPUkX0H4?=
 =?iso-8859-1?Q?4wgoSLdL+ZppWT2Pl0zIQ5gwftJiuBJjlUrf7II3/4makFZ5s3IyHwDhUJ?=
 =?iso-8859-1?Q?ZzkcAOo9tu5l2Zm8B7NjUSGh2N/tIvx2J3Dg6obEEcarBe91kLBlQMCPC8?=
 =?iso-8859-1?Q?KSyjzv8uPrL3Vs4DUoqCNZyZfudVyODxDODhE/FRaCgnVsIqc/NIJ6Q5Pl?=
 =?iso-8859-1?Q?kYuylBuHhevTPfpVJApV07feudzINlrVYCWpVmPqs4VM+XkEMzjDlb+MnQ?=
 =?iso-8859-1?Q?Lf9K+1nfiIzIx1I+I+3s0ZRg7aE1TT8j1iFfvuzxCG3eXpb+cEUkIcBXVy?=
 =?iso-8859-1?Q?n5ouxJtCunQrZ0z7DuVAwSRdyHmzwtb3xEw+EYfLCF8nbbuztd5pZCWCln?=
 =?iso-8859-1?Q?fX+qLr1QcySMyo9m0j8SIdTm0je6eUluzsmnM04gmOsmgHcQvtTSdJziN7?=
 =?iso-8859-1?Q?hmyYnBT/kztNyd+jZqcg3wbmQYXVoAjMl5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38c5163-a939-4d12-dcb9-08dd3b8226f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 07:47:14.1728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5+dXNvEBtLjEHxmOSOjGMyyNi56LfaZDHlX/S0Xou06SesUJJ+521iS2orKiv6xPH/DNEjeTGjrsj3j7IOmng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
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

> > On Wed, Jan 08, 2025 at 11:09:00AM +0530, Arun R Murthy wrote:
> > > Expose drm plane function to create formats/modifiers blob. This
> > > function can be used to expose list of supported formats/modifiers
> > > for sync/async flips.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_plane.c | 44
> > > +++++++++++++++++++++++++++++-------
> > --------
> > >  include/drm/drm_plane.h     |  4 ++++
> > >  2 files changed, 33 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > b/drivers/gpu/drm/drm_plane.c index
> > >
> >
> 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a906
> > 8
> > > b31c0563a4c0 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -191,7 +191,10 @@ modifiers_ptr(struct drm_format_modifier_blob
> > *blob)
> > >  	return (struct drm_format_modifier *)(((char *)blob) +
> > > blob->modifiers_offset);  }
> > >
> > > -static int create_in_format_blob(struct drm_device *dev, struct
> > > drm_plane *plane)
> > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > +				 struct drm_plane *plane, u64 *modifiers,
> > > +				 unsigned int modifier_count, u32 *formats,
> > > +				 unsigned int format_count, bool is_async)
> > >  {
> > >  	const struct drm_mode_config *config =3D &dev->mode_config;
> > >  	struct drm_property_blob *blob;
> > > @@ -200,14 +203,14 @@ static int create_in_format_blob(struct
> > > drm_device
> > *dev, struct drm_plane *plane
> > >  	struct drm_format_modifier_blob *blob_data;
> > >  	unsigned int i, j;
> > >
> > > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > > +	formats_size =3D sizeof(__u32) * format_count;
> > >  	if (WARN_ON(!formats_size)) {
> > >  		/* 0 formats are never expected */
> > >  		return 0;
> > >  	}
> > >
> > >  	modifiers_size =3D
> > > -		sizeof(struct drm_format_modifier) * plane->modifier_count;
> > > +		sizeof(struct drm_format_modifier) * modifier_count;
> > >
> > >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> > >  	/* Modifiers offset is a pointer to a struct with a 64 bit field
> > > so it @@ -223,37 +226,45 @@ static int create_in_format_blob(struct
> > > drm_device *dev, struct drm_plane *plane
> > >
> > >  	blob_data =3D blob->data;
> > >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > > -	blob_data->count_formats =3D plane->format_count;
> > > +	blob_data->count_formats =3D format_count;
> > >  	blob_data->formats_offset =3D sizeof(struct drm_format_modifier_blo=
b);
> > > -	blob_data->count_modifiers =3D plane->modifier_count;
> > > +	blob_data->count_modifiers =3D modifier_count;
> > >
> > >  	blob_data->modifiers_offset =3D
> > >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> > >
> > > -	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
> > > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> > >
> > >  	mod =3D modifiers_ptr(blob_data);
> > > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > > -		for (j =3D 0; j < plane->format_count; j++) {
> > > -			if (!plane->funcs->format_mod_supported ||
> > > +	for (i =3D 0; i < modifier_count; i++) {
> > > +		for (j =3D 0; j < format_count; j++) {
> > > +			if (is_async ||
> > > +			    !plane->funcs->format_mod_supported ||
> > >  			    plane->funcs->format_mod_supported(plane,
> > > -							       plane-
> > >format_types[j],
> > > -							       plane-
> > >modifiers[i])) {
> > > +							       formats[j],
> > > +							       modifiers[i])) {
> > >  				mod->formats |=3D 1ULL << j;
> > >  			}
> > >  		}
> > >
> > > -		mod->modifier =3D plane->modifiers[i];
> > > +		mod->modifier =3D modifiers[i];
> > >  		mod->offset =3D 0;
> > >  		mod->pad =3D 0;
> > >  		mod++;
> > >  	}
> > >
> > > -	drm_object_attach_property(&plane->base, config-
> > >modifiers_property,
> > > -				   blob->base.id);
> > > +	if (is_async)
> > > +		drm_object_attach_property(&plane->base,
> > > +					   config->async_modifiers_property,
> > > +					   blob->base.id);
> > > +	else
> > > +		drm_object_attach_property(&plane->base,
> > > +					   config->modifiers_property,
> > > +					   blob->base.id);
> >
> > IMO the function should only create the blob. Leave it to the caller to=
 attach
> it.
> >
> Prior to this change for sync formats/modifiers the property attach was a=
lso
> done in the same function. So retained it as it.
>=20
> > The 'is_async' parameter could also be replaced with with a function
> > pointer to the appropriate format_mod_supported() function. That makes
> > the implementation entirely generic.
> >
> If the list of formats/modifiers for sync and async is passed to this fun=
ction, then
> based on the list the corresponding function pointer can be called.
> This was done in the earlier patchset.
>=20
> > >
> > >  	return 0;
> > >  }
> > > +EXPORT_SYMBOL(drm_plane_create_format_blob);
> > >
> > >  /**
> > >   * DOC: hotspot properties
> > > @@ -476,7 +487,10 @@ static int __drm_universal_plane_init(struct
> > drm_device *dev,
> > >  	}
> > >
> > >  	if (format_modifier_count)
> > > -		create_in_format_blob(dev, plane);
> > > +		drm_plane_create_format_blob(dev, plane, plane->modifiers,
> > > +					     format_modifier_count,
> > > +					     plane->format_types,
> > format_count,
> > > +					     false);
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
> > >
> >
> e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf
> > 369
> > > 894a5657cd45 100644
> > > --- a/include/drm/drm_plane.h
> > > +++ b/include/drm/drm_plane.h
> > > @@ -1008,5 +1008,9 @@ int
> > > drm_plane_create_scaling_filter_property(struct drm_plane *plane,
> > > int
> > drm_plane_add_size_hints_property(struct drm_plane *plane,
> > >  				      const struct drm_plane_size_hint *hints,
> > >  				      int num_hints);
> > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > +				 struct drm_plane *plane, u64 *modifiers,
> > > +				 unsigned int modifier_count, u32 *formats,
> > > +				 unsigned int format_count, bool is_async);
> >
> > I don't think this needs to be exposed to anyone.
> > __drm_universal_plane_init() should just populate both the normal
> > blob, and and the async blob (iff
> > .format_mod_supported_async() is provided).
> >
> Ok!
>=20
For __drm_universal_plane_init() to have both the sync/async format/modifie=
rs list we will have to add new elements to struct drm_plane to hold the as=
ync formats/modifiers.
Then upon adding new elements in struct drm_plane we may not need to pass a=
 function pointer instead of is_async as commented above as well as this ne=
w elements added in the struct drm_plane helps out over here.

New elements to be added to the struct drm_plane=20
Struct drm_plane {
	U32 * formats_async;
	U32 format_async_count;
	U64 *async_modifiers,
	U32 async_modifier_count
}

Then the functionwith below changes it will be generic and no exporting of =
the func would be required
 create_format_blob()
{
	If(plane->format_count)
		/* Create blob for sync and call the format_mod_supported()  */

	If(plane->format_async_count)
		/* Create blob for async and call the format_mod_async_supported()  */
}

Is my understanding correct?

Thanks and Regards,
Arun R Murthy
--------------------
