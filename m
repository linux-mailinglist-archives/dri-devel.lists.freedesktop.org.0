Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60876E4FCD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 20:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007E910E0D7;
	Mon, 17 Apr 2023 18:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292AA10E055;
 Mon, 17 Apr 2023 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681754646; x=1713290646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sL5fQ/ZuXdiZHpi4q9ShRCxbegfcSMgg80bUgnCS1FY=;
 b=EnOiWHEqLtEEENgds6u0fnCnz0CwNShyi/yKOzUeZU9DT4ZZVBT5jNWF
 G4EQks3THY/EsAfJ6v2BPwsBE4nKt5lhf5tCNyVbWKauNNZA7EdJqIlsA
 yPCf3FIhKqsthAJX3SgFUeLhpc0bxEz5S/1p7+E+HC0VqCHIwHghQVN8B
 ODUG8cxX2FPBpK9ESfQDlJAEpdo6J76sQXYvI3bHlb/rioUTHFUkLMbyO
 G36w0aofTzc1Vz0/o0Kliak2wbGIYLxVd87doUSmYtkXH8j+wi7QqqgQF
 gYcdbIv4pf44du28jr30v4vUIxm6As7eMyNPpRon0Rytzn0UWMMUVWLQg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324585220"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="324585220"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 11:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="802225329"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="802225329"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2023 11:03:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 11:03:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 11:03:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 11:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdVU9EUP/Wik3nhGBBZrZUZ5YMYcOaK6zXvmv6RVHYACgHDPI3Yz807Ah22uHQIPs1fNlXvcDEblr5KLU1oxmLQddF1L0pMfXRkMVCefSaRc/tUWoe213zOPF8pnzM6cYWjRFEwSusiHSZFaWQbALbtXapAjcKOaSRBChTkPzhxVtZRWqGZVVarHHvUBCwi+A8jsLMwWJDXzOgyNHaRRlhI9ygTx/Ht4b47ukqb5thqxc1rVEEsyc38pNPsxUt8FRneSCw4WZyb0PPpqjqux/UVvdeb2RHNQfT47ADzxF36ig+VEnIYl3NQ3nmb+tnzPcgbh/MiHfQsxOjRjL2VR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL5fQ/ZuXdiZHpi4q9ShRCxbegfcSMgg80bUgnCS1FY=;
 b=Jg2AjQCKEuUX25BJd0P9EwFJhxhFuGej2WdQQ0BnoJjHMjtW+Pz48w5xIr4MfXzurI3iDC5yNPVceI8dMDvcKXhUhXI1wBq8LibMTLDQrELdsuAMTw/5UEyA5xeY9t3skqzuFuZoTVXp24hAwWD5fAZUIx/arBaQg10sDd1V2WjVQj7t1n//MZkL5mvmQDD71ClXSisj/H3Q8ad7t4SDbHgHOvWiVyuT154cPaRUbuqMKhhF4hQxj+Fzi2MISaN4WSrxnzCT2N6tfEGS+X3xtdIeUwvWN0RXkXbpBasiEW9yH1xxLMzcjHiW5NnSwdo/S7WtqEVlq4TjPyCnFRh39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 18:03:43 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 18:03:42 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Topic: [PATCH v7 4/8] drm/i915/pxp: Add GSC-CS backend to send GSC fw
 messages
Thread-Index: AQHZaK91orwSNm/hP0+PCVhLzX02A68kwboAgAsayAA=
Date: Mon, 17 Apr 2023 18:03:42 +0000
Message-ID: <9f40c12b4b546cad1811466485508bc7aca41ed9.camel@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-5-alan.previn.teres.alexis@intel.com>
 <868c1fc2-1b10-9326-8fa5-1cb88d62816f@intel.com>
In-Reply-To: <868c1fc2-1b10-9326-8fa5-1cb88d62816f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB5197:EE_
x-ms-office365-filtering-correlation-id: 647ead86-db54-43f0-36f5-08db3f6e1463
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PZ7Uz+CKO4yhAMz2w3hGQF50j5akk857UdFxgrkFwt8esLMh1q3f//hqyH2zZBHO4JzHj5DaDvUiFvdRPb99DTXU9CP9eVUJGVO0T/N+c/CGh8MQSjVWql9bIQY5uC8SHvgMdEImddB+z7UgdQtX8rq08dDv1M2xemYi9PX0KTQVqvh70sv9fwol9Iy9M3LwG6lETN2Y44USqyCjym+DRJ5A3WsVKKtO6seANCAZoodOt/BZ0ni3Vtqh2IfGN7Qk8WwrMr3IebnYocYEuswTXuYSvK5JQo2enXMc9tARdw18IJXUTsGD5H1oBnci6Nh5wDn9Ctx8KdXYylW/hSEBpLFn9iw9mFeWzoqIwBOujU6TujPE7/yV8vagmgVIgQVSEUhOGI66qBo6tjh9PUIeN/f88KoDhBuJc8gneZdHe4O73XeVi+Yh9Wq4OKLasC8johfcmOMzzNPpTJYPQy9xKRAPyUTinky622dGSlhJytX883HI/0j747xmZp8Kb7I7Neac+SZx2rkwnCP5HHuX8HcCxM1It4b1VFO0iPyhfb/QQ6JaREEB5XjhcKa1lEVLTnhoCEPaEkfQKFsfe2U3FFRHSz3PJK0Gg9Ekpmvi0uDycbvqf36qc/3iCe1RMZrV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(71200400001)(478600001)(316002)(6486002)(26005)(6512007)(6506007)(86362001)(38070700005)(2906002)(4744005)(4326008)(5660300002)(66556008)(66446008)(66476007)(2616005)(66946007)(64756008)(76116006)(91956017)(8676002)(8936002)(41300700001)(107886003)(38100700002)(186003)(110136005)(54906003)(122000001)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGZTcWFVdW9QU3hBVnBDcGhkSG80K01PejB0dGJucGYrQnZnNmFzTFBUWWVo?=
 =?utf-8?B?T0t5WWdwQVppKzNCbmUvSkhpSmlIamFmY3huY01SZ3lvZWtYcldFR3dQdjAx?=
 =?utf-8?B?S2F0eEZSZTdTc1BJd292UUxwdFgrdEdxaHZtSlFRa1JHWG1tVzdScS9ENytT?=
 =?utf-8?B?YllSeW90emptWm0vZHVwckpiM3I1djVkdmZwMDBnMlF3M2wzYVplc0ZoWHhN?=
 =?utf-8?B?R2s2ZUVEMnNleHZaT2FYdGtoUWhoMmgrSXdrbkxQRW0xK2NZMVkxQmxyYUtY?=
 =?utf-8?B?VE9YVVZEazJzbzZSRXVLcWtGZVB5UWhITjR2SW9IVzdyWUcvUkEwS2g1SFI5?=
 =?utf-8?B?T2w1Sjl4V2FpWUJWNTVOYUNaWEFUR25CUWEzVXZEa0x3ZDZHZHpmdU1uSlJm?=
 =?utf-8?B?QjVWVzZ2Uk15MC9LdXUrWlJyVDlLYy8yZEM5UmsvSUhaZ0ltMXJFcW5vK1ly?=
 =?utf-8?B?WnlRSDd3bi9LbXlibHVHNmVqSE44d3FMbm16NDhJKzFmcGppVDNsakRCVHZI?=
 =?utf-8?B?S3VtU2F0Y2tkSHF2QnNxRUV5dS9SSktsM0gwVEVreTBCbmh3SUhHby9ObEFn?=
 =?utf-8?B?MXRCbldIUlpaTUdyZ3NOT0JIOXJZUEk1V2FjQll1SHB5ZE1BN09DeFdBOXBZ?=
 =?utf-8?B?MnBZMGxYT21DYitXMmQ1UkFKNWtuZ3hpK3FmdkI5dE9kUkEzYW9PUmpIaG1o?=
 =?utf-8?B?Y2dQditWVkVXMDZmTkljekZ2VWhzY2dJSWZXUGZoZTR0blpHblhHa2h2RWRT?=
 =?utf-8?B?VWdZUkZ1T01NQjM1c1dMdFR6Z1J1SXdIdFRqVWJmVVlwbDg0WnorWHUreDFl?=
 =?utf-8?B?eVBWQzcvVWUrL0lWeG5hSjlXMFloUGhjSUtLTEJRcHd4MGpQY04yam9jUGND?=
 =?utf-8?B?WjBKRjJIQ0dKbXVGY0JnVWFjTUFGdVZhdUw4N1RRTjZVZC9MNnhSWHN5bGRQ?=
 =?utf-8?B?NDdWZ000NC96dm02NVVCWHBoc3FJeEp2Y0l4YXR5cGhuZC95Q3llcVhGUnZL?=
 =?utf-8?B?YTBYWjFIY1dzcXhJL0x0c21xR2pUNTZmazY2OUZxZHljc3B2cnlhL2RPbTRw?=
 =?utf-8?B?aEdHNXVXd05UR1lWODZ0dmwvaWwwVWRMYW8zV3NHbmZGOXlLeVlKQUxIYWdJ?=
 =?utf-8?B?Q0xoZW5PdjZtWnMxVnZnSmRCMDFSYWUrR3B0RFNZL2NLS0hxSE1HTzlXaGZt?=
 =?utf-8?B?cEprenpRSTZkUDNiN050eHFwYW43UTZ2NW0vek5lMzN3VU9WNXZpMWc0VVp6?=
 =?utf-8?B?YkdyMGlnVnVqWjM5WmticTdFN3ZYb2IrcGN1RmQ3Q0J6ZGJKcGYxU2M3bmxO?=
 =?utf-8?B?cWovZ0RFUDFjSmtncHdiQ3hpR0JJWnJzMUVobFBHak5DZnQzM1ZPYmNPNzlm?=
 =?utf-8?B?aVZQTjFCVWR6TWZRVXRTS3pQd0hsbm10VlZpd1lKR0dKV2o5WVdBb2owVFc2?=
 =?utf-8?B?djY1bURWUHpSRDF2S1YzVUZWaytqUFlMSXN2N1lwZkZCcTZDZGFiejR3QzNM?=
 =?utf-8?B?eEEwUXpEOXVINDRHTlQ0TVVYTDRBWTNXUlVXTUpOVysxaktVOHR5SGl4QVNR?=
 =?utf-8?B?RWZuK0ZTbGsrZW1YcW1MTjFqVjR6UXYrTmVVcjZDdFlIUFVpY3J5OG9COGJ1?=
 =?utf-8?B?UzM5YkVDYlgvOG9JcnB1elkwajdjS0N4QzdLT0E4b3QvOVVVeTZFSGZIaUUr?=
 =?utf-8?B?bzZKOHlwWlN3TUlZd3JEaXpOMDRmWXJNWWdlUGh3ZHJOMkJPWVdiNkd3Wm5K?=
 =?utf-8?B?Z0wyVms5OUs3RlhRTm5ESXVEcEZwczh6cHh6d0VhQXptamRvUUp3Rm9NblBO?=
 =?utf-8?B?T0RVV0piNnhDblJReHo1Y2pyUENiWENRMkJBWDdyWnBBRHNHSjEvOUhUT0pH?=
 =?utf-8?B?ZUNUTDhwaEdpQVF4ZHN2VTNxd3d1eUh6b0tmVnNvanZLNzcxdGhBWU0rb0ZW?=
 =?utf-8?B?OW0yaDM4cDIwTWprdG1YTkJTenZEMnZ1TlFlN0lGbkJmcFV3aHpyYTVlVXNl?=
 =?utf-8?B?RmN2dmlIUWtIUW9NcXd2ZFE0ZDFDZnhueVpOeVdjb096dmhCdHRtVTZyZkpy?=
 =?utf-8?B?bWFMRkc3dkZIWEt3eGx5RURNR29NTXlTcCszWCtDdDRMZTRqbHgxQzBkK2Fk?=
 =?utf-8?B?cmMvMkpPQU1wc3kvVEtPczRTT1pTejYreTA4ZS9ncjVYczJnL0FVL05LcGU0?=
 =?utf-8?Q?JPWhRoNc/4cbB+lYY5gtMQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B80AEC8C9F68EC4F8A5B6AC5D6410408@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647ead86-db54-43f0-36f5-08db3f6e1463
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 18:03:42.3506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZZwC62F7dQoI+r5zR3eMtV7w+Ow+jeSA/oft+4lENgLh6AaEITuVuBQQawtodFjPwkmtr4CIZzf4/tV9EfHnJVS4UueN9QQuPMHNwi+o5/aFLQBwRHtrQuDkXsVScVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDA5OjI4IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQphbGFuOnNuaXANCj4gPiAgICNkZWZpbmUgR1NDX09VVEZMQUdfTVNHX1BF
TkRJTkcgMQ0KPiA+ICsjZGVmaW5lIEdTQ19JTkZMQUdfTVNHX0NMRUFOVVAgQklUKDEpDQo+IA0K
PiBGb3IgY29uc2lzdGVuY3kgdGhvc2Ugc2hvdWxkIGFsbCBiZSBCSVQoKSBkZWZpbmVzDQphbGFu
OiB3aWxsIGRvLg0KPiANCj4gV2l0aCB0aGUgZGVmaW5lIGZpeGVkOg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5j
b20+DQo+IA0KPiBEYW5pZWxlDQo+IA0KYWxhbjogdGhhbmtzIERhbmllbGUuDQoNCg==
