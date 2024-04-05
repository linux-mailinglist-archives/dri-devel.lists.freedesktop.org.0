Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896098998F9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 11:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA4C10E9AC;
	Fri,  5 Apr 2024 09:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KH9E3P5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F13810E9AB;
 Fri,  5 Apr 2024 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712307919; x=1743843919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MF4POa7zAHE4ofkszeT21EOJQYVqLkg9QObRJ/M8bzQ=;
 b=KH9E3P5Z7nO/EUezsXLPJc9pX9ih2021kqIOdwlaL0CCWYUttiyPCx3e
 bs3MIiX9Zp+YoLmhvqx9r6E2DG1nNLiNgbE49vT+00P1ilISjpZ5Pdeb6
 bbZin52zGcnrQQKodI2Ezon0HHMO7wZuChcSgRJVcx+ENlHbTwa2cBeGS
 yru633fJZdQnMjQgr65FFAb4ea165YQYPEM4BQoinq6KxRwYUyT6negeD
 RSHNIP6Db/PLtGtHDyTieyMgeYoNq+0RQ5uDorzbaMFVCPAZNK89Hv54l
 BdC9FAzPYHhFZMTNZALqkHGH0a6j6IMCAq9kaattThU8VGiAm3UdHP64H w==;
X-CSE-ConnectionGUID: 8mrt7fElRyKUdkQGG+tUqQ==
X-CSE-MsgGUID: UlucqwLMQfaAXFPA5V0mUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11403857"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11403857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:05:17 -0700
X-CSE-ConnectionGUID: pzKqRAOLTSCYZsvp9EOsKA==
X-CSE-MsgGUID: kXZi0E6PTnq9sGd4v/pZHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19544999"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 02:05:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 02:05:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 02:05:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 02:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQB7bUMQ3/oXrKurkSRZNe/XMl2iDADUCwisIQWevPYhh2OKIrdW8ngV0Cf8wNq/5+mihfXNNoeOjCk21iKfRFpWoIYOt2o9QRuKdoz25qfye8GCA6AeMO0gJDJA8oOIkp0Jy1aP6E25jpXVVczp1RKGkID+dxvH7aRcAQtQsgE3CixX/upDDKbCGOEa1aILTHlh7H6K1Gcs8ijwOIN33Yp3k/zbCy1erX8hUg1i90qc0OYi1Qq8mRaYz3s5rhX5hfEmfm5egdrl5KFVB5Y6hWPf7iAGLybShZcCfpjgiFe9Jtc52TaMWY0xIh55v7AWfQGK8wIRIXGsCyjPvfsySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF4POa7zAHE4ofkszeT21EOJQYVqLkg9QObRJ/M8bzQ=;
 b=B3R3W99BAaumYxH2AYv2EJBy2y6ZD685Cfe4PJNByvarU6YojIflpTshe4VFIz86MfGtp2IHb/ZQq32lZ6dDXFs5IMC98G6M43k2IWRyiT+Y7RHfg1RGD9/jsRGFO08QL74GlmpOUsmn82mUwXZCnANva5l0xedADCOe1VIQ3/CaQZYORUDDIMePr7XSmrMAPhJspg+4y+PNWjG8WLQMegPE+9t4IqVHLRTfAWCQ3lLzZzNCsW3MsroRPZpIHo970iyg/YRQb6WeYQKx/0BZSIvtVeciOB7bxivJb7vXUn86ymyS/lHkeHQq7HTkSyBxE042jrdBLHbgzHb/QbIRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Fri, 5 Apr 2024 09:04:53 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 09:04:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "javierm@redhat.com"
 <javierm@redhat.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 6/6] drm/i915: Implement fbdev emulation as in-kernel
 client
Thread-Topic: [PATCH v7 6/6] drm/i915: Implement fbdev emulation as in-kernel
 client
Thread-Index: AQHaa96tKEZt/+IvnUijseKX7vgb77FZkFqAgAAG6gCAAAGggA==
Date: Fri, 5 Apr 2024 09:04:53 +0000
Message-ID: <4f2dcd973fa09f77d78f93830073ae30c468677b.camel@intel.com>
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-7-tzimmermann@suse.de>
 <56b919497a8030839d8e4a2f946d4338b64b043d.camel@intel.com>
 <92fdee78-40c5-41c7-b685-d785f53ee7d3@suse.de>
In-Reply-To: <92fdee78-40c5-41c7-b685-d785f53ee7d3@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM3PR11MB8683:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NW574MxIbgYd4qm5uEeCu20L3dRxubHu0DCJJ7SDhRQSBGyhdygsH7jm/5iDJ5HP/7R5UYo/nfyOIqpwQEMsOa9KuIxhKgNUpD6a9ZMds5U9/LlHQSAmPnlmRkeeWMsgIXTdJdeW7MGdTl5Ss0vmZfSoNAOhoVCDzZ0td3CEYJnIxyKyzNaW34k/wTPQHqe97je3n/lzsPsYt1oUoK7UFkSCVTJNiorvgURToKDrYC9UnfmwniIRfNvbbe4lFHQ9PlWVKJlcth1EaI8GbEoJDsf6+UH7EopgbP2VqCe0R8kqdTcnUef9GEOqzF2pLqACMkrTBCw0diSEZPQBA7BpX8WzBmmVXMTRMJQJOvJtwFIJTShDiRNpRfdQPHGVIboDoP6Rv7ooMNKbLy6coeTV7LV+kDjXsqpzfrc2uxW/3RHgViNskGRpOsZfWqF0ziVjq1nM0IaHdTjWuaK6gLYQBt59kkDYETT54euESnwDEAh/ODpcCODXotqc+CE7YkOi00n+QokKDf9i7JI9KJjrXPK3zKhMIF9sjqg0qXCyM5u+w6uFBmaeZDqHBxJB+Jll3MBcuJvN0UywhWmqv7zIuPcOBKU3sgzz5D4ULA2shSno1aNkctRDgqN0tvq/To4ZNgN4gx6XB5wfQ9gQehBsE55dZ3qCfKw7NoohYYmV5R9gwJsfoHW8VjN9Y0kzpswNmSc7WubyxXeyFcZVgJWwnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011); DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUpiYXY1alJtU3dtMmNOYlVpZjcvZXFFOU9YU3NnUytWN2IxRTBjT2tISGZU?=
 =?utf-8?B?SkFiNUZZVUM4L3UyUjg1MDA4ejVHN2E1NFV1K1grd3dpRGxNeE1XUXQ4NnZm?=
 =?utf-8?B?RUVHT243cHdsMGpUZm1GdmtJbEoyVVhLNFFLUjF6UTBPQXBqdUU3NWtvOERF?=
 =?utf-8?B?VWxYbWRLTHBnOVFqQWVPUGsvRXFOYkt3bE93Wmc2bUJuWnlCL2dBQXpxV1F0?=
 =?utf-8?B?amxiMmZkSE83OXpTRFZRNGJDRFRTOWlLT3NoNWZzazhON2FJd0xwZ3A3Rkt0?=
 =?utf-8?B?SmxMNHloTzNRMERxa1dCbmdKbzBwa2dyNi9iU0MzOWI1cDkyMDFXTXhUV2p4?=
 =?utf-8?B?RWxTOHFER3R2L3dHSUc5dkFXRGZzUi8wa2I5QURDeUJSRHhRYjhlRVBQMUJR?=
 =?utf-8?B?dkoyV1pSUGU1aFdCNUkvOVZabjlEdTNtOVV6MXBLR3B2Y0ZvZmV1cXNYeGhu?=
 =?utf-8?B?RW1GRitLY00rNEFId0xSTHVLb1dYQVZNN1psNFBtQVFkZEVjS3NVZzRCNjFL?=
 =?utf-8?B?amN2OHVYNHpxYVJPbVFUQzdOSnFwOTM4MGcwN1VYeFR6YmFLREZ5d2c0MVUw?=
 =?utf-8?B?OFhaNVRZbzM1a1BvTjNYRU52WCtFeXFZb0FYTCtxejlodkl2SGhKdVJRNk80?=
 =?utf-8?B?Y0pJWTREeWpPSEZieTdjOTN0VUlEalVYZ29hc2FHSml0Y2x1Mkc2Zll1dmlZ?=
 =?utf-8?B?VkZzaGJTZUNLdlFuODhzZnNzb3pYc2RkY3V1andBUGJaV1BvaVdZaFVyaTNh?=
 =?utf-8?B?Wis4d2I5a01GUUJuZ085K2tMOUI2dnVyVWZLTENzL015cVJvNlFucFZxcGNP?=
 =?utf-8?B?Ri9qazBxN2cvRFc5U2JFbUJ3bzBseTMvRXBBYzNLekh0RGozR2JmcS9NR0F1?=
 =?utf-8?B?YUd6anh1eXZlTldqWmNST0ZyWjgvMWdEK0orSy9seU94dGVXNnJvU2Y4S3Zl?=
 =?utf-8?B?ZTZZaklITDAxNUhRMDlZTUlXRjlaYkxWdVJVVGNlZ0RqUStkR1RBZVV3VGti?=
 =?utf-8?B?RDcyTnZqRk5QeThoSkNVeXdsTTVXR2EvV081d2p2bFVDYWFITnhIUmtNQzRp?=
 =?utf-8?B?RlNtZWdXMkZnOE0va2VNWS8zVGlqb0J1ZjYzRDI5ZkVsU3R2dTd5T0NIblZv?=
 =?utf-8?B?MDI1ZzVCSC9BdUtJT3Q0UmliQTFrTVlxRURRODlMN3czYmF4VXpjc09CYU5u?=
 =?utf-8?B?bXQ0T2dBcnJKMVM4a2ZCUEFWeEozK01BdjhrVGF2UFZodHlGOUdxdmIyd0ZN?=
 =?utf-8?B?a2FhT2diUXFOc041UXNPbzNUY0paVEVOd1U5ZjAxS2VRTVkweGJuY0ptRHhr?=
 =?utf-8?B?UzV1QmJYeVpDNzd3OWtUcUVtUG4rRDV4NWhtQ2N5cExWcFpjeEZDNCt4eUNE?=
 =?utf-8?B?MGg3UEdEc2w1YUM3VFcwL0MvcnZFZlcwR1ZaQWdtV0EwTkxEOGIyY0ZieWdM?=
 =?utf-8?B?UHJJWlFiZlVWbmxGRkZtYkZrRFRoUEVFM05TNytJbjY1TzFkTGI3dlN5d2N6?=
 =?utf-8?B?a3FrUlZ4ZEdvMzI0cnc1NnNaMDFIRWpqeG1uSjhNU3h0N25aenVQTTNUWjNi?=
 =?utf-8?B?bGo0RkkrTDk0TitDR1BpNDVsQ0tqYk9ZWEV1b3QyRHNOZjVIVFZWNmxvc2Ro?=
 =?utf-8?B?YUZhL1NTbHlJZVJnNjV3U2VWb0RqOGV4akl0d25RQWZRK3VxaGNqbVBUY08y?=
 =?utf-8?B?WlVRS0tUSlVMQzY2dTJBcUxEbENhTFJNRU04RDNZeVd6L3ZLaEVGR1FONk53?=
 =?utf-8?B?dFhEeHZqenFSb2s4N1hUODBPREEyTkE1RmVEckRDTjRDM2E3MGtCM1Z1d3NW?=
 =?utf-8?B?QlVXS0NLdGFWREVQdDk1WmloWm9YZktZVkpPd0F1SkRYQ0dtcXFsa0lpUS8z?=
 =?utf-8?B?bkMyYTl5dmNoYUxha2RwVFFFUnJVL0JWV2t0QlVmZUU0OFR3MFZ2UVdZZm8v?=
 =?utf-8?B?MjhpVlZHT3RDS2h5bmFDZ21RRHFVcEVaNzVPR1JjcFF5bFVOd2laTElZTE9H?=
 =?utf-8?B?NkZqZWlMbkFVUTNlamswM3k3SmwyWjB0dFJEWlN2RzVWT2E2Witwbk0vQlll?=
 =?utf-8?B?a2xCanp6RklDNWJPeTNpajVGUGJzYmNlR1dMQTF1WVg5dERzSkhXRFBGMFBm?=
 =?utf-8?B?QVB1RnJMQWRtZCtvMWpabmJVYmhmMG1SWVZmT0FlYldzNXRCSGY2aDQ3eVZr?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FE6E09CAA1C7543A5AB059012F622D7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf5aa01-7052-4dd0-15c4-08dc554f74f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 09:04:53.2368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAen02DLfjNklBtvxUCmGiEAx2j0qliOm8vSNMjKTWIEGqLCDQAcRjHp55YhfuftH7ocDTCdgTRc4XBfcwFWTbXTxJAw0KqQLQXLk9meF/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

T24gRnJpLCAyMDI0LTA0LTA1IGF0IDEwOjU5ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDA1LjA0LjI0IHVtIDEwOjM0IHNjaHJpZWIgSG9nYW5kZXIsIEpv
dW5pOg0KPiBbLi4uXQ0KPiA+ID4gwqAgDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcml2ZXIuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X2RyaXZlci5jDQo+ID4gPiBpbmRleCBlMGYxM2M2MmExODMyLi42OTE3OGI3Mzg0NWUxIDEwMDY0
NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYw0KPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYw0KPiA+ID4gQEAgLTgxNiw2
ICs4MTYsOCBAQCBpbnQgaTkxNV9kcml2ZXJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+
ID4gPiBjb25zdA0KPiA+ID4gc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4gPiA+IMKgIA0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaTkxNS0+ZG9fcmVsZWFzZSA9IHRydWU7DQo+ID4gPiDC
oCANCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGludGVsX2ZiZGV2X3NldHVwKGk5MTUpOw0KPiA+ID4g
Kw0KPiA+IFRoaXMgZG9lc24ndCB3b3JrIGZvciBYZS4gSSBwcm9wb3NlIHlvdSBtb3ZlIGl0IHRv
DQo+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RpcnZlci5j
OmludGVsX2Rpc3BsYXlfZA0KPiA+IHJpdmUNCj4gPiByX3Byb2JlPyBPdGhlcndpc2UgcGF0Y2gg
bG9va3Mgb2sgdG8gbWUuDQo+IA0KPiBDYW4geW91IHNheSB3aHkgaXQgZG9lc24ndCB3b3JrPyBJ
dCdzIGJlZW4gYSB3aGlsZSwgYnV0IElJUkMgSSByYW4NCj4gdGhpcyANCj4gcGF0Y2ggb24geGUg
Zm9yIHRlc3RpbmcuDQoNCmk5MTVfZHJpdmVyX3Byb2JlIGlzIG5vdCB1c2VkIGJ5IFhlIGRyaXZl
ciBhbmQgSSBjYW4ndCBmaW5kIG93biBjYWxsIHRvDQppbnRlbF9mYmRldl9zZXR1cCBpbiBYZSBk
cml2ZXIuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5kZXINCiANCj4gDQo+IEJlc3QgcmVnYXJkcw0K
PiBUaG9tYXMNCj4gDQo+ID4gDQo+ID4gQlIsDQo+ID4gDQo+ID4gSm91bmkgSMO2Z2FuZGVyDQo+
ID4gDQo+ID4gDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiA+IMKgIA0K
PiA+ID4gwqDCoG91dF9jbGVhbnVwX2dlbToNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiBpbmRleCBjZGJjM2YwNGM4MGE3Li5jYTVjYmUx
ZDhhMDNiIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNw
bGF5LmMNCj4gPiA+IEBAIC0yMTQsOSArMjE0LDcgQEAgdm9pZCB4ZV9kaXNwbGF5X2Zpbmkoc3Ry
dWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZv
LmVuYWJsZV9kaXNwbGF5KQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybjsNCj4gPiA+IMKgIA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgLyogcG9sbCB3b3JrIGNh
biBjYWxsIGludG8gZmJkZXYsIGhlbmNlIGNsZWFuIHRoYXQgdXANCj4gPiA+IGFmdGVyd2FyZHMg
Ki8NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2hwZF9wb2xsX2ZpbmkoeGUpOw0KPiA+
ID4gLcKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfZmluaSh4ZSk7DQo+ID4gPiDCoCANCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2hkY3BfY29tcG9uZW50X2ZpbmkoeGUpOw0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfYXVkaW9fZGVpbml0KHhlKTsNCj4gDQoNCg==
