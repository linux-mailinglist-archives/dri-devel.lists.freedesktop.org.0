Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C906C8BA4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 07:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D910E13B;
	Sat, 25 Mar 2023 06:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646CA10E13B;
 Sat, 25 Mar 2023 06:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679725166; x=1711261166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eQarnWfUnRbY0fieJjNcWmKxOv9gHkGtGrwomqDBJsU=;
 b=h4jsweIV0LxxiED3U3kXuOSU5KkbQG43loYZSASlkfZ+K3vEje7+vdZH
 AsMJCcPIETfAI/JBqiDGSsvt9bvi6bf2zphRT4ctMfBZv1Y7yjiolbkTj
 N74rt91KGIk/l0aIF9l4sr6fju0lUpjMU0n/fAlYm1osFL+REiRhHq9nW
 CjVRDpCdYPMpZkfib6RpC0qqSCp0cG12nOE6UNPhgu7mmHs8VJ9PYgZzc
 VJRuCXRO4vzaWlY9QPqJTrmWZD/51r6V3sI8mgyLW5/HWcok4Kb/1QKQS
 9Nw3hWhFIeQ/g6lO4l7adjZvrabgQ43D6g0BJUNMOM/PSghmZHjuLzDwe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323826281"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="323826281"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 23:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="772134903"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="772134903"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2023 23:19:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 23:19:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 23:19:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 23:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzNEOeQmlYP58ka/1xm5O034Bid1eZSUuRrTL57UWnKrU2q1e7EOlpVZyNxQiGMTanqA4EboLmlY2VCXAQyRgGRXcH9/w6hId+QKWOjCgZE2hO9GzNJMpPULU3xOuD99fGMYtPsfyvKlYB5mJ39Qq6SkjqHQ17CqAR09vw2icFxZr9HKYJr2IR4YLuNhrPtSwOOFlrggAh8+qlIfFMv4IvdxhvPE/3xtftOZIoTVHrPn4IqOgbbK09E+9L0djzQVfoncclyM+SRrH0QCQrgJj4UYEsTeta698Vj0pZ/+zC3Re+7AucWVAsT4XB/QvMhLjL/nvwjNmhHCGa/fxXCDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQarnWfUnRbY0fieJjNcWmKxOv9gHkGtGrwomqDBJsU=;
 b=U9d+e3sliVX3fA498RF9dXxKCtoV6jDT27vEjee0cg02GUxydGKf5t9ibb8JCAf0WUBvfikhNIITQdMLDvsAxpjCqxwFOrBsxJx9fC894t0cLqgolg5QcgLOUT1UDLEZ80IyQpUUI3yHiYokvN/Uxixs2hHHm5t0unulATHZjNy/R3Wuu0gowNdtGB/1z0+dMri/BmmAa46rQlmMChTTQcmGGhtc5ohEQZpSkLSwuCxFDa2UAMbkL6+2Pu9D5xdowcfh5RT0LigFXuAoF+vJM6AOZ4Yy0lF6ZzGDBl0swEdy7pPCIt55v2UmMJHyW3tuVYwemOQMlUATs78mGkUoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sat, 25 Mar
 2023 06:19:22 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6178.041; Sat, 25 Mar 2023
 06:19:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZSxtxSfUqWny+hUmFCBmRtOC0Wq7p3LIAgCFQjwA=
Date: Sat, 25 Mar 2023 06:19:21 +0000
Message-ID: <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
In-Reply-To: <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN9PR11MB5291:EE_
x-ms-office365-filtering-correlation-id: 13b9a5de-131d-4cdc-5de0-08db2cf8df9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oTYd4pS9cP9Vob61L4BgubF6fwJGMB7ZZK1GkFqPyJDRbk1TtdB9h0gfQM5m/Y7C7YJ6cpzKtifnFZXUwTg42NZbCB1sk07jhVis9t2e4QwgA07F4CwhlM1YXCQja1zVldOXHUA99zYCj1TqlSg4AV1n3Peu6xGQE4RsD8o8F7PqSetZe2dmdV+CgL53+VPhsUKhae2I3PrBbvxE/n88jlEgRdXfRR3QQYMa5s35vD6AEouv2NQXkDiVEEQj2l1YsiNUF+hZx5QKhe8ncQu+nz+KL+z3qgPrmAmfhK0R/+yM78RXVGQToDCOKAuE/zLBdXHWNuAAx6K70MaT7/vjVMh3OOXETcGZeO7vEfLSwGp0OFOk8kfcItQDGZLRnQ+kEqhWrh69JR0UtmLlHR8LjliVXZLHiCw7+LciY0hrJSb5kIBg5MFpQ/40a1sxqYhxeJyVGR1p7wOGQlmA/CUHpPCdyhwbTpdxnqoN0XVurPAYrzfkMxrd/rbDcX8mPwLs2ENQ95HMTZvyl0cYLaI0gwkmfKRZj/l+vh/CDj3XRkuwHxY/+XoSRY7rAuTLCVGe80e2Uakf+G0zJ/1wTseFascoiEs2crmbS56dJdCuaGWYwhe23N1reQ6LTyL/pT9a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(41300700001)(66946007)(8676002)(76116006)(91956017)(64756008)(66476007)(66446008)(66556008)(4326008)(186003)(82960400001)(6486002)(83380400001)(2906002)(71200400001)(5660300002)(122000001)(26005)(38100700002)(86362001)(6512007)(6506007)(8936002)(36756003)(110136005)(38070700005)(316002)(107886003)(2616005)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qys1ZE01RTRpbmg5RGVUUDZBMmNnT1luN0tWeGdlcngyNGovb0hicU5QNGtr?=
 =?utf-8?B?b2hHZE40YzB2QXk2UFpOUEkxWEl6Z0tabkUrdzBBRVpYdHFWQVJ4blBOamo5?=
 =?utf-8?B?MGRSNnp3djB3RkU5QW85eXhKelFFK0N3YzB6cENKUi9kTWpHV2xMVUI3dmpF?=
 =?utf-8?B?OGtKTVNqRTZEU2Y3QzliN0k0QWpRSitpWlN3S0VZaXdOeHd1T1VRQjZXWS9h?=
 =?utf-8?B?SXFKNldQd0U5a3lLLzdlRlJpSDJwelNLLy9GczcvcmhiNDRzMGJzN2NnTEg1?=
 =?utf-8?B?RkxMSE9uT2t0SXRTbG5oSXlVOFB6TTNrc2hIMW9DcWs2dzBWaEV0QTJWeFFm?=
 =?utf-8?B?SW5mbmxXZXlva3I3dTV2NDNRTjZBWFRQcldPWHcwb05BRmtmKzNpdi9ZWnd5?=
 =?utf-8?B?VSs0ZVVHdmtVUzBicTJTTVBydHVyNWg0RGgyZUl2ZWxtNXJtdS8zSDRlWUtu?=
 =?utf-8?B?SDNEZlpCMGJBZ1haeG55WXBKY2NJN0RkVWlFV0w5RFk0QWdVS0k2NVRPMFdP?=
 =?utf-8?B?ZmJXSDBoTjlPUitLdTRIclV2K0ZFMzF0RldZWlAzR1RvZnJ1dGVmNlRJVHlK?=
 =?utf-8?B?RCtwa2k5ZEl2enpRWU9vaUE4V3RPYTRLc0ptSjVSblJyM2tVb0h5c0xxRFM0?=
 =?utf-8?B?WjVXM1lFS3FkZ3JnZUI4Z1NKcTlQNXpUdVQ0M29oZU16RGRzWXBqNld2bGtJ?=
 =?utf-8?B?SndnRHdrS1lEMDZzb3RxUTVFWUZtbDJGWHp4SWFWY25lNit2bUJ2dG5vWkw4?=
 =?utf-8?B?Sit5bVFKZVNkdlFqNkYvdUdlTGlsMk9HZHQ5YTRXS25YNkNEVlFOVTdZR0RV?=
 =?utf-8?B?WEdzVEl5N3RNbFR2MDF4aHNrU2tuR0pYbkpCUEhrZ0hGRVZ1TXNTNUxlRFI5?=
 =?utf-8?B?NktSdkxjQWxyNTF5a0VIeTE5U3ZWR1VydEVNQ1VGOUs4bDVqcDc3bE10NUZS?=
 =?utf-8?B?YlZOT09jRFZKamo4OTViS0J0SXBjT1liRFVPRU10bnBaeVhPRElmM3dTVGo5?=
 =?utf-8?B?aUUyK0NJbTNPcWppVTZWbUk1K3I5ZzMwZnJ0NXN5cVRvVzFtY1hmeGFVOFcx?=
 =?utf-8?B?Y1RjTnd6SVpmR2s2WWJlNTFKbmdzYXVlclQzWHFlRHA5eUgwZ090blh6Q0Yw?=
 =?utf-8?B?WCtMbUw5THZRbDJqanJkREoxU0RUTU10cWhjcEI3UkttcUNzeUsrYzhGTWdp?=
 =?utf-8?B?b3I4bFg3MTlpRmZMcXJKdzVSVFlCZW5LZGZpSHlLUjBsM29yaWpySzNtQzd0?=
 =?utf-8?B?VXBQbnhmN3RzRkJlV0ZTSncrZUxxTm9CSXFFa1pmcVkyeXlsUFd3YVg2NFJ4?=
 =?utf-8?B?K1MvVnFOOGpoa2JQZmhaK1A1Wk16elFHbXZuM1lRT3Y0bEcweGVsUFF3b3ds?=
 =?utf-8?B?aVdWaVpTRTByNkZzWkZOWkhDZUdibHVSUFA4cXR4Ky9iSDZCcjdRb0tzMUds?=
 =?utf-8?B?cVNaQVRnUVREb3dVYTBwRWhYM3Q5QU1UUW1oZmtHQWJiUUd1Y1MxenZqczFD?=
 =?utf-8?B?OHRHTE9QM2IyWlhvakN5YjZPRy9lbE1GOEVJbEkzSEcwVTFLUFhzQlY0SzFI?=
 =?utf-8?B?eEpzbk9TYk9McFVQZGl5eXpFNHFNNlk1ckxhblN3Vm1rcWcxM0J0ejFCNnJn?=
 =?utf-8?B?S0sxclhkTXNXclVydmp2dzB4MHc2V1Y0VC9QcWVLOFFYWk5wNkM3Zmx1U21w?=
 =?utf-8?B?SWp4dXRURDI0aUZjUmt1WkM3Mnh0aXFhdWJwbElFRjdpZXE2Z1JDVG9MaHVI?=
 =?utf-8?B?VkM3elFLQWxINGpWS2wzMXc4a3VHQWJpdmhHYUU0bXQrc3dLUjR2MEhXVGlh?=
 =?utf-8?B?eVBMS3E5ZFloT2ZXQVIxUEYxZ2lCZVZZUU1YVzNnRC9NaDZBQzNaTzloSmVR?=
 =?utf-8?B?UUwvNlVoTzYyUk53eDl0WkwzamlUa1k0ZFJVQkNkdzRHUTNVYzhPeG9lNTFN?=
 =?utf-8?B?YWNZNWpxaW5rODFBVXBiWjdSbGx0cGdmMXJJZ2pyOWk3d05JU2h2WEdHRS9v?=
 =?utf-8?B?dis1ODhLa3JhSnhieHN2UnhPNS9ybC95SS9WeDVuQWt4Z1NHQjQrYkNjNTd2?=
 =?utf-8?B?QUFUT2VkUytBMXZ5YzBNVFU3OERlQjV1QUVsRGYrVTlMMjBQeUUzOUlLWjZC?=
 =?utf-8?B?RmlZeU0ya3h5YmlOU3V6RmwyVUtKR0pvY3U0OWxuUThFcVFqTmRQNHJxNmt2?=
 =?utf-8?Q?xHXfPzkZRW+QORPHm8Iwv0k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40F31DD535369A428F4CC0511C6E9F04@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b9a5de-131d-4cdc-5de0-08db2cf8df9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2023 06:19:21.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFF/wApU3nxl/OUpPTOUwYLMXOHjmU1jAJoIpWdAUdg0KF1/Eq9JJTcFvXo6jg4IYg3INOZovlEpK0VB9wcDGhnXyGF1tajJyKxmBDk5E/JHEQxkWaFbQgHuToEvNKNe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
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
Cc: "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWxhbjpzbmlwDQoNCj4gDQpAQCAtMzUzLDggKzM2NywyMCBAQCBpbnQgaW50ZWxfcHhwX3N0YXJ0
KHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCmFsYW46c25pcA0KPiA+ICsJaWYgKEhBU19FTkdJTkUo
cHhwLT5jdHJsX2d0LCBHU0MwKSkgew0KPiA+ICsJCS8qDQo+ID4gKwkJICogR1NDLWZ3IGxvYWRp
bmcsIEdTQy1wcm94eSBpbml0IChyZXF1aXJpbmcgYW4gbWVpIGNvbXBvbmVudCBkcml2ZXIpIGFu
ZA0KPiA+ICsJCSAqIEh1Qy1mdyBsb2FkaW5nIG11c3QgYWxsIG9jY3VyIGZpcnN0IGJlZm9yZSB3
ZSBzdGFydCByZXF1ZXN0aW5nIGZvciBQWFANCj4gPiArCQkgKiBzZXNzaW9ucy4gQ2hlY2tpbmcg
SHVDIGF1dGhlbnRpY2F0aW9uICh0aGUgbGFzdCBkZXBlbmRlbmN5KSAgd2lsbCBzdWZmaWNlLg0K
PiA+ICsJCSAqIExldCdzIHVzZSBhIG11Y2ggbGFyZ2VyIDggc2Vjb25kIHRpbWVvdXQgY29uc2lk
ZXJpbmcgYWxsIHRoZSB0eXBlcyBvZg0KPiA+ICsJCSAqIGRlcGVuZGVuY2llcyBwcmlvciB0byB0
aGF0Lg0KPiA+ICsJCSAqLw0KPiA+ICsJCWlmICh3YWl0X2ZvcihpbnRlbF9odWNfaXNfYXV0aGVu
dGljYXRlZCgmcHhwLT5jdHJsX2d0LT51Yy5odWMpLCA4MDAwKSkNCj4gDQo+IFRoaXMgYmlnIHRp
bWVvdXQgbmVlZHMgYW4gYWNrIGZyb20gdXNlcnNwYWNlIGRyaXZlcnMsIGFzIGludGVsX3B4cF9z
dGFydCANCj4gaXMgY2FsbGVkIGR1cmluZyBjb250ZXh0IGNyZWF0aW9uIGFuZCB0aGUgY3VycmVu
dCB3YXkgdG8gcXVlcnkgaWYgdGhlIA0KPiBmZWF0dXJlIGlzIHN1cHBvcnRlZCBpcyB0byBjcmVh
dGUgYSBwcm90ZWN0ZWQgY29udGV4dC4gVW5mb3J0dW5hdGVseSwgd2UgDQo+IGRvIG5lZWQgdG8g
d2FpdCB0byBjb25maXJtIHRoYXQgUFhQIGlzIGF2YWlsYWJsZSAoYWx0aG91Z2ggaW4gbW9zdCBj
YXNlcyANCj4gaXQgc2hvdWxkbid0IHRha2UgZXZlbiBjbG9zZSB0byA4IHNlY3MpLCBiZWNhdXNl
IHVudGlsIGV2ZXJ5dGhpbmcgaXMgDQo+IHNldHVwIHdlJ3JlIG5vdCBzdXJlIGlmIHRoaW5ncyB3
aWxsIHdvcmsgYXMgZXhwZWN0ZWQuIEkgc2VlIDIgcG90ZW50aWFsIA0KPiBtaXRpZ2F0aW9ucyBp
biBjYXNlIHRoZSB0aW1lb3V0IGRvZXNuJ3Qgd29yayBhcy1pczoNCj4gDQo+IDEpIHdlIHJldHVy
biAtRUFHQUlOIChvciBhbm90aGVyIGRlZGljYXRlZCBlcnJvciBjb2RlKSB0byB1c2Vyc3BhY2Ug
aWYgDQo+IHRoZSBwcmVyZXF1aXNpdGUgc3RlcHMgYXJlbid0IGRvbmUgeWV0LiBUaGlzIHdvdWxk
IGluZGljYXRlIHRoYXQgdGhlIA0KPiBmZWF0dXJlIGlzIHRoZXJlLCBidXQgdGhhdCB3ZSBoYXZl
bid0IGNvbXBsZXRlZCB0aGUgc2V0dXAgeWV0LiBUaGUgDQo+IGNhbGxlciBjYW4gdGhlbiBkZWNp
ZGUgaWYgdGhleSB3YW50IHRvIHJldHJ5IGltbWVkaWF0ZWx5IG9yIGxhdGVyLiBQcm86IA0KPiBt
b3JlIGZsZXhpYmlsaXR5IGZvciB1c2Vyc3BhY2U7IENvbnM6IG5ldyBpbnRlcmZhY2UgcmV0dXJu
IGNvZGUuDQo+IA0KPiAyKSB3ZSBhZGQgYSBnZXRwYXJhbSB0byBzYXkgaWYgUFhQIGlzIHN1cHBv
cnRlZCBpbiBIVyBhbmQgdGhlIHN1cHBvcnQgaXMgDQo+IGNvbXBpbGVkIGluIGk5MTUuIFVzZXJz
cGFjZSBjYW4gcXVlcnkgdGhpcyBhcyBhIHdheSB0byBjaGVjayB0aGUgZmVhdHVyZSANCj4gc3Vw
cG9ydCBhbmQgb25seSBjcmVhdGUgdGhlIGNvbnRleHQgaWYgdGhleSBhY3R1YWxseSBuZWVkIGl0
IGZvciBQWFAgDQo+IG9wZXJhdGlvbnMuIFBybzogc2ltcGxlciBrZXJuZWwgaW1wbGVtZW50YXRp
b247IENvbnM6IG5ldyBnZXRwYXJhbSwgcGx1cyANCj4gZXZlbiBpZiB0aGUgZ2V0cGFyYW0gcmV0
dXJucyB0cnVlIHRoZSBweHBfc3RhcnQgY291bGQgbGF0ZXIgZmFpbCwgc28gDQo+IHVzZXJzcGFj
ZSBuZWVkcyB0byBoYW5kbGUgdGhhdCBjYXNlLg0KPiANCg0KYWxhbjogSSd2ZSBjYydkIFJvZHJp
Z28sIEpvb25hcyBhbmQgTGlvbmVsLiBGb2xrcyAtIHdoYXQgYXJlIHlvdXIgdGhvdWdodHMgb24g
YWJvdmUgaXNzdWU/DQpSZWNhcDogT24gTVRMLCBvbmx5IHdoZW4gY3JlYXRpbmcgYSBHRU0gUHJv
dGVjdGVkIChQWFApIGNvbnRleHQgZm9yIHRoZSB2ZXJ5IGZpcnN0IHRpbWUgYWZ0ZXINCmEgZHJp
dmVyIGxvYWQsIGl0IHdpbGwgYmUgZGVwZW5kZW50IG9uICgxKSBsb2FkaW5nIHRoZSBHU0MgZmly
bXdhcmUsICgyKSBHdUMgbG9hZGluZyB0aGUgSHVDDQpmaXJtd2FyZSBhbmQgKDMpIEdTQyBhdXRo
ZW50aWNhdGluZyB0aGUgSHVDIGZ3LiBCdXQgc3RlcCAzIGFsc28gZGVwZW5kcyBvbiBhZGRpdGlv
bmFsDQpHU0MtcHJveHktaW5pdCBzdGVwcyB0aGF0IGRlcGVuZCBvbiBhIG5ldyBtZWktZ3NjLXBy
b3h5IGNvbXBvbmVudCBkcml2ZXIuIEknZCB1c2VkIHRoZQ0KOCBzZWNvbmQgbnVtYmVyIGJhc2Vk
IG9uIG9mZmxpbmUgY29udmVyc2F0aW9ucyB3aXRoIERhbmllbGUgYnV0IHRoYXQgaXMgYSB3b3Jz
ZS1jYXNlLg0KQWx0ZXJuYXRpdmVseSwgc2hvdWxkIHdlIGNoYW5nZSBVQVBJIGluc3RlYWQgdG8g
cmV0dXJuIC1FQUdBSU4gYXMgcGVyIERhbmllbGUncyBwcm9wb3NhbD8NCkkgYmVsaWV2ZSB3ZSd2
ZSBoYWQgdGhlIGdldC1wYXJhbSBjb252ZXJzYXRpb24gb2ZmbGluZSByZWNlbnRseSBhbmQgdGhl
IGRpcmVjdGlvbiB3YXMgdG8NCnN0aWNrIHdpdGggYXR0ZW1wdGluZyB0byBjcmVhdGUgdGhlIGNv
bnRleHQgYXMgaXQgaXMgbm9ybWFsIGluIDNEIFVNRCB3aGVuIGl0IGNvbWVzIHRvDQp0ZXN0aW5n
IGNhcGFiaWxpdGllcyBmb3Igb3RoZXIgZmVhdHVyZXMgdG9vLg0KDQpUaG91Z2h0cz8NCg==
