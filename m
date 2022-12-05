Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6E643103
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5345A10E135;
	Mon,  5 Dec 2022 19:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B85710E111;
 Mon,  5 Dec 2022 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670267079; x=1701803079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WK/WztSReHph+5qrkR3zSj9bf6Y3/YatXAFjc8PPs/w=;
 b=U4wX8drXSpr9uVxIAJJphZAgHHdlZqTNdyTPql2Yq5kyLV3gJ1Ydyamt
 +cOAlpy/Xw82sdCKfSrz6TsJjOWf3+xVm35oVXOzgamVZ3lT//aCGRiDa
 viKnKmpS/uBOLrTVaJcon3MLuvVYd6L6Jn+/X6bNXgSuaT/oUDyCVVNS1
 e+r6dmB4C66nOHrX9+dqEBsZ1vl7vBHiBsKwfUCNSPl5XWSce+kyuUlWd
 HWyRjAseuSdHziD3myFG+ycfD/4HQZXcTimlCsiuL4YljK6Khh+ewTLTV
 dJokQNY89QBRwk0xjLM5RNn1yQQf21rs/jmj0MOkmZBgtk0ByGtYsbYjU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="314086961"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="314086961"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 11:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="752315324"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="752315324"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2022 11:04:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 11:04:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 11:04:38 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 11:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZQM/BbU/iFTzFUqenVj4u9bHAXR0BteXg9pGVQN9gvrnGDkYCw7Y6JFlZS1Tharwb7y0gNbPicsjc2Vk2h/976xhYfYivghOBVAee2lmAfVE6eD5jvrK/dvujJzbzC1dR0YOq7G764ESrrrX0I5d3z+TBSie/EzH05GD9hlwNmSPAT7FaZ3budseM7vJ0Yw5QnYvCy2HVXFx9/PY/44iA+wrOxbVGjOoJlUwLi77zyMDunIQbdOnLL7/ikuwnp2+Sn2TOr7FcMZyk7UEnetp+RLjPg2ohpA5heTF9ao6ROkihc4ALuVDjO+GCZ1zVZwFy11FRqPCVSFYBc5eT4bYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK/WztSReHph+5qrkR3zSj9bf6Y3/YatXAFjc8PPs/w=;
 b=OaDvWH+DfeyiFqWiG25C/Gpw2wLFjdyRt6B0bVRtGvaIYe7LGEE8Q/Szy887roJOh/cKXHpptBVPKVv08gxHS0fIwLoYiy58tbadX1hiyUZYbIgQp+jlCdtJLkfB0ocxT2stWpXmYFND0OtzEBIzj/u66AYWN6OPWPHVhyEF1O4WM4sXgT4LAVV7KbKxy6GxolXnLwOcI5W9zLPUzGNstEXu0qloENaZ4a0Qcp09+ntKiXCnujKv0n129pVUvnbrH5rBTi9sIecfRgJv+XsYtOSWGjHvvSxZWtXBMI49l79f1MiQc+byyyy0TaOgOeRUJSTQt3UmIrgAvHVUsHMvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 19:04:36 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 19:04:36 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v8 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Topic: [PATCH v8 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Thread-Index: AQHZBqVvCNxykvRMx0GwcV7wAR5h3K5fmMmAgAATiQA=
Date: Mon, 5 Dec 2022 19:04:36 +0000
Message-ID: <9eeaf51cd9e32d5456611e2d7308722029176b31.camel@intel.com>
References: <20221202232821.4144884-1-alan.previn.teres.alexis@intel.com>
 <Y44xCSCGgSLkYpHc@intel.com>
In-Reply-To: <Y44xCSCGgSLkYpHc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5286:EE_
x-ms-office365-filtering-correlation-id: f28dfc6c-89ac-45d9-94a6-08dad6f38d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fDj/L4mz4Z5fGCpvSXXFJ5D/X4dO8H3YdlO2iHxaBcKEezhybjVIEe20hswoVUAstAZOkLkQQHLSAmNgsNlEVOI/mLbIXIYYbv9Om45DSGY1nzprX5Q2MCUdbsiUFSkrKoHtogyES5xmYD4ctWyg/XAlOck7GxrjfFoRBNHtdtca4cxB+05/TVAeSz6aYjWun05NI76QPeDci/7g0zobRdF+sPc76YSlswBM+cPJTTmZ5LnsgeFa8m1mDTUO0wN3rd3fjxyIr9XhJxVcur3UeLwqa2jfSw9WpwLyaUVjirSukjcEd0wIUI4w46LpWvK+aNkEKxKlTfq1GqTpLcFw1tm4mbY7SYtD3SS2B/GfiS6Ezk78doXkapdIfMuKUVaHluoKl7sTBUlqri/IIUQ1Xz70Ap2hS9c5fbZrgZEG2o4Aj63rZUWKYZGScz5Bkd1wBMuVVwFHtT1/cI7CyD6nbS1ljYQZS7vJ5JQZ8et63poyXjNGZ+7OUzYRhflIisYlzGpoZHtP8RGJH4hi+IJz4DIPcEp6BUE7HgXL/pzZm5tsXmQsyBDjDPg0CxYabf4KgPwiZ1Z27+3Ur1TmJ1ty2/4Gultol2kpnDLvnqxvDABz4agzqEqOWfRgg7hij+z6PNXJUJbcP7StOAoXFCXc0R3Q9aYLNjNMC+69OPL40u7uvcPEJks8eHBFuvltDCMT7MPCJO6SuV5lu9stkf3Osg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(82960400001)(122000001)(38100700002)(36756003)(38070700005)(86362001)(37006003)(54906003)(26005)(6512007)(6636002)(316002)(478600001)(107886003)(71200400001)(6486002)(6506007)(83380400001)(2906002)(5660300002)(76116006)(91956017)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(2616005)(4326008)(41300700001)(8936002)(186003)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TitFMTFWdndPUHg3Sm9CZmVUVkJlR3lzVDlGa3A4MEF6Mi9CZ0s1WnVsT0N4?=
 =?utf-8?B?OWVnbm9Lc2w1NG1DYzJKVXUwZTNEMWtRbTc1R1dvNnROYlBEU0srQWxWbTc3?=
 =?utf-8?B?ZkdhdVZNaXorZDNzWXFpM3dtWDdiMUIxZlJGSFArZzczMjR6VkdvVTJQVUFI?=
 =?utf-8?B?TnNaQkdrT0hqMjFjT1ZucmlvZWY0VG1lM1FOY2g2OUVQRFZIRzE1ckVyUFpZ?=
 =?utf-8?B?Q1M0TVJ3ZmUzcnBVeGkxeTlaZWh6QUhRcExKRFNLOEVLbHI3d2Rncjh1STNt?=
 =?utf-8?B?Ukt6VGlYMTUvQ0V3cnN4Ynp4UXpLekRhdEdyTmJNelpUcmZaVUJmUEtRR0Z1?=
 =?utf-8?B?eTF4YWdibk1mRTl6YkJGaFQ0TFJ2S05PbUM3cS82TWVKNTNXNHZ6NndoRnpw?=
 =?utf-8?B?aHVnQzZ6SnNFZUdjcUxKMVNwRGx4NFhOUDZhK0RQY2hJdVdBSGN3YnljRFN2?=
 =?utf-8?B?cTVmZW9VZlpkQ2RzTjRlMDB3eHJ5MXN3Sm1ZOU1HYUlMb0hBZXZCdlU3a2x0?=
 =?utf-8?B?ZVdXZ3ZaWU9tczVJNmRVTlhUQnIrNDBHZG1uaTRtQTByTThZL1huRFVEZ2xW?=
 =?utf-8?B?N0hHNWMySHNkaGZ0elI2N0JHMDg2NmJNbHRwYU1neFdZcWo4TmtwM1lNR05s?=
 =?utf-8?B?Sk9MM0VBUld3dTlsRFJyUFFwWmcxaVVwNUEzaVFDTXpYdVdKUTIxUmIzbHFR?=
 =?utf-8?B?VkRnK0FnZWtEWmlMYndNRFZka2g4aUVEWEdEVUdwQ0I2MGtjWDB3OVpuR2J0?=
 =?utf-8?B?dVZlMTA5bDZCNUh5akIrbkJWdXBPeVUzNUVXeTZBQ0l1MkMzc0t6c2xFcm9s?=
 =?utf-8?B?dmlPL2ZPM0Zrc3pzUDhLb2w2djExTUc4RmdlWUlxeGkvSnFOMjdSVS84MWwr?=
 =?utf-8?B?OFhhNkxSVmZqNGVnY1dpemhWTlFkQUZTbGVURmxwblY3dmRuVnArVmtYWENF?=
 =?utf-8?B?WDJxSFo0M2FvNzRWaXFaQVNGd3BQTmhvRGJSVUtaYmlFVzVlcG52NE1Wb2VP?=
 =?utf-8?B?VWsyMlBKNmFIcWlaeDk1b3F1emRqcmd6VTRmQ2FOZTRMM095bTR2bmtoTURK?=
 =?utf-8?B?eVZjSHlKWmxWUG1vcGNDRlM1U3Q0dVBrOUNVbUM5bTRCMWNLL2dDUGlYR2pQ?=
 =?utf-8?B?TVErSnYzTkVaQnhoZG1xTzVjMS81dVVMaUU1aUZ6YUcxbGgvZzZQd2Nqa3JZ?=
 =?utf-8?B?eE5HNVBCRi9wZ1c1KzFEUnAxVjhIWHdENEFtTExBdU1xSXVBWDNBaGdIS0M3?=
 =?utf-8?B?M0twaUJqam9yblIrKzFLSkVlR1VYZThqT0dOQm1Vb3hmMmJiK2h1M2wxZVJ6?=
 =?utf-8?B?a1FDTno3TGFiT09McmNJM0I4L3JnSXpadUVUUmorVzhDY0F5TFFsRGlORlJN?=
 =?utf-8?B?d2VZWTRYaWhMdHgwZUxrbW5kOEJ1STJ6b0Jpb0YyMzFDa2JzYUwyanVUQ2k3?=
 =?utf-8?B?ZWQ2QmFzZVcvUzNIQ2p2K3NqS3gxR2gycWdkeGp2ZE1XV0tFV3RDaEU0VG5l?=
 =?utf-8?B?RGtJRVdndVJwK21lNFBwYlFjeVRYY3l6SlloaU81Q25SZEtTNU5IcTNZMy9W?=
 =?utf-8?B?WGMrVTdNWE5kNURLRFJ1WldSYnpmQWZEclg3alNsZHMxcXlpT3o0L0FMOHMw?=
 =?utf-8?B?YktqY3Azbi9IVXV2VE02MzNWT0pOb0tLdXJjUWhwOGo4c0djRzEvQlJxNjhD?=
 =?utf-8?B?QXB5YnkzaDhzRUFJZEVJWkxUNW0zeERXTXZ5Mnh0N29xWFhIcjdKWitPdTcy?=
 =?utf-8?B?Rk1HRk0zSnhPQ2V3TUZVendqNVBTNFI5UjZlNVcvMC9OaGdwWUhxZm9MV1Vz?=
 =?utf-8?B?Q3duWFZob3NIY0NqNko4dHkyU3dwb1JHcWV0dEo2VVlNUG1ORjEvR0pFYlRC?=
 =?utf-8?B?VTMwZ2MvTUNYY3VFZ3hPemF1SVpxS2cyTGtCbDFXZlB0YXJxU0pVZWhnRHlr?=
 =?utf-8?B?QWpoeTFydk15bXZ5YW1VaFcwRkFVMUVlL0JhZU1KNkQyV0pGRjdZd3ROaU1o?=
 =?utf-8?B?TGFZT2cwMzlyek43TSsyTldIMkI2Q1NBeW9JNnRaMEZLckdIRlljOE1WbVVG?=
 =?utf-8?B?Q0d5SFpOU3RLSm0yT0t0N0RjczByVWE2SmdpdlhBME0vSHRvZkFCd3FNMkhY?=
 =?utf-8?B?RXNDT2J0ODM1SXVWbVd4TjFveXQyK21oMzhINkFuZUhGWHIxVWhJUTBKSjV4?=
 =?utf-8?Q?ePwke77OwFsq6r+RLciRgAo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7AFC6C3733DE544A41738AB5735A273@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28dfc6c-89ac-45d9-94a6-08dad6f38d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 19:04:36.6927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00ujh/baAnHZpp4myxx2TjtnbGSZK9J3TeUOKNhFT513aRKjp0CVrUzzIYb3fj+d0wlhwrudglFv/Qjbe9CZTgfef75kSIiWXr9+FQ35CrUGPq2q9dA3YB92a+qOvc2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIE1vbiwgMjAyMi0xMi0wNSBhdCAxMjo1NyAtMDUwMCwgVml2aSwgUm9kcmlnbyB3cm90
ZToNCj4gT24gRnJpLCBEZWMgMDIsIDIwMjIgYXQgMDM6Mjg6MjFQTSAtMDgwMCwgQWxhbiBQcmV2
aW4gd3JvdGU6DQo+ID4gDQo+ID4gDQo+ID4gDQoNCkFsYW46IFtzbmlwXQ0KDQo+ID4gQEAgLTEx
NjgsNiArMTE3Niw4IEBAIHN0YXRpYyBpbnQgaTkxNV9kcm1fcHJlcGFyZShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2KQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9
IHRvX2k5MTUoZGV2KTsNCj4gPiAgDQo+ID4gKwlpbnRlbF9weHBfc3VzcGVuZF9wcmVwYXJlKGk5
MTUtPnB4cCk7DQo+ID4gKw0KPiA+ICAJLyoNCj4gPiAgCSAqIE5CIGludGVsX2Rpc3BsYXlfc3Vz
cGVuZCgpIG1heSBpc3N1ZSBuZXcgcmVxdWVzdHMgYWZ0ZXIgd2UndmUNCj4gPiAgCSAqIG9zdGVu
c2libHkgbWFya2VkIHRoZSBHUFUgYXMgcmVhZHktdG8tc2xlZXAgaGVyZS4gV2UgbmVlZCB0bw0K
PiA+IEBAIC0xMjQ4LDYgKzEyNTgsOCBAQCBzdGF0aWMgaW50IGk5MTVfZHJtX3N1c3BlbmRfbGF0
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIGhpYmVybmF0aW9uKQ0KPiA+ICANCj4gPiAg
CWRpc2FibGVfcnBtX3dha2VyZWZfYXNzZXJ0cyhycG0pOw0KPiA+ICANCj4gPiArCWludGVsX3B4
cF9zdXNwZW5kKGRldl9wcml2LT5weHApOw0KPiA+ICsNCj4gDQo+IEJlZm9yZSB0aGlzIHBhdGNo
IHRoZSBweHBfc3VzcGVuZCB3YXMgZG9uZSByaWdodCBhZnRlciB1Y19zdXNwZW5kLg0KPiBSaWdo
dCBub3csIHRoZSB1Y19zdXNwZW5kIHdpbGwgaGFwcGVuIGNvdXBsZSBsaW5lcyBiZWxvdy4NCj4g
DQo+IA0KPiANCk9rYXkgLSBJIHNlZSB0aGlzIDJuZCBsZXZlbCBmbG93IGNoYW5nZSBidXQgdGhp
cyBoYXMgbm8gZnVuY3Rpb25hbCBjaGFuZ2UuIEkgaGF2ZSBnb25lIHRocm91Z2ggdGhlIGNvZGVz
IGFuZCB3aGV0aGVyDQppbnRlbF9weHBfc3VzcGVuZCBjYW1lIGluIGFmdGVyIGk5MTVfZ2VtX3N1
c3BlbmRfbGF0ZSBvciB0aGUgbWlkZGxlIG9mIGd0X3N1c3BlbmRfbGF0ZSAoYWZ0ZXIgdXNfc3Vz
cGVuZCksIGl0IGRvZXMgbm90DQptYWtlIGFueSBkaWZmZXJlbmNlLiBpbnRlbF9weHBfc3VzcGVu
ZCBvbmx5IGRpc2FibGVzIGRpc3BsYXktY29udHJvbC1ldmVudHMgb24gS0NSIHJlZ2lzdGVyIGFu
ZCBkaXNhYmxlcyBDUllQVE8tSVJRDQpyZWdpc3RlcnMuIEd1QyBvciBIdUMgaXMgb25seSBldmVy
IGRvaW5nIGFueSBQWFAgcmVsYXRlZCB3b3JrIGlmIGl0IHJlY2VpdmVzIHdvcmtsb2FkcyB2aWEg
ZXhlYy1idWYgKGtlcm5lbCBzaWRlIFBYUA0Kd29ya2xvYWQgc3Vic21pc3Npb24gaXMgbGltaXRl
ZCB0byBhcmItc2Vzc2lvbiBjcmVhdGlvbiB0b2RheSBPUiwgaW4gZnV0dXJlLCB0ZWFyZG93bi1m
bG93cyBhdCBzdXNwZW5kX3ByZXBhcmUgLSB0aGlzIGlzDQp1cGNvbWluZyBjaGFuZ2UgaW4gZmxp
Z2h0KS4gVGhhdCBzYWlkLCBzaW5jZSB0aGUgR1QgaXMgYWxyZWFkeSBxdWllc2NlZCBpbiBzdXNw
ZW5kX3ByZXBhcmUsIHRoZXJlZm9yZSBIdUMgb3IgR3VDIHNob3VsZA0KYmUgbm90IGRvaW5nIGFu
eXRoaW5nIGluc2lkZSBvZiBpOTE1X3N1c3BlbmRfbGF0ZSB3aGV0aGVyIGl0cyBiZWZvcmUgaTkx
NV9nZW1fc3VzcGVuZF9sYXRlIG9yIGJlZm9yZSB1Y19zdXNwZW5kLg0KDQoNCj4gSWYgdGhpcyBp
cyBva2F5LCB3aHkgY2FuJ3Qgd2UgbW92ZSBhbHJlYWR5IHRoZSBweHBfc3VzcGVuZCB0byB0aGUN
Cj4gc3VzcGVuZCBmdW5jdGlvbiBhbmQgbmVlZCB0byBrZWVwIHRoaXMgaW4gdGhlIHN1c3BlbmQg
bGF0ZT8NCj4gDQpXZSBjYW4gLSBidXQgaSBkb250IHNlZSBhbnkgZGlmZmVyZW5jZSBpbiBkb2lu
ZyBzbyBmdW5jdGlvbmFsbHkgc3BlYWtpbmcgLSBpIGRvIGhvd2V2ZXIgcHJlZmVyIG1pbmltaXpp
bmcgdGhlIGNvZGUgZmxvdw0KY2hhbmdlcyB0byANCg0KPiBPciB3ZSBkb24ndCBjaGFuZ2UgdGhl
IGZsb3cgYXQgYWxsLCBvciB3ZSBhbHJlYWR5IGZpeCB0aGUgdW5iYWxhbmNlZA0KPiB0aGluZy4N
Cj4gSSBiZWxpZXZlIHRoZSBmaXJzdCBvcHRpb24gaXMgYmV0dGVyIGFuZCBjaGFuZ2luZyB0aGUg
ZmxvdyBpbiBhDQo+IHNlcGFyYXRlZCBwYXRjaCBpcyBiZXR0ZXIuDQo+IA0KQWN0dWFsbHksIEkg
cmF0aGVyIGZpeCB0aGUgc3ltbWV0cnkgYXQgdGhlIHRoaXMgbGV2ZWw6IEFzIHBhcnQgb2YgdGhp
cyBmZWF0dXJlIHRvIHByb21vdGUgUFhQIC0gR3QgYmVjb21lcyBhIGRlcGVuZGVuY3kNCm9mIFBY
UC4gU28gYXQgaW5pdCwgd2UgZW5zdXJlIEdUIGlzIGluaXQgZmlyc3QgYW5kIHRoZW4gd2UgaW5p
dCBQWFAuIFRoZXJlZm9yZSB3ZSBzaG91bGQgZG8gdGhlIG9wcG9zaXRlIGZvciBmaW5pIC0NCmVu
c3VyZSBQWFAgZmluaSBpcyBkb25lIGZpcnN0IGFuZCB0aGUgY2xlYW51cCB0aGUgR1QuIFRoYXQg
d2h5IHRoZSBtb3ZlIGFib3ZlLiBCdXQgYXMgdGhlIGdsb2JhbCBpOTE1IGxldmVsIHdlIGFyZQ0K
a2VlcGluZyBpdCB3aXRoaW4gc3VzcGVuZF9sYXRlIC0gYWZ0ZXIgZXZlcnl0aGluZyB3YXMgcXVp
ZXNjZWQgaW4gc3VzcGVuZF9wcmVwYXJlLg0KDQo+IFNwZWNpYWxseSBiZWNhdXNlIEkgZG9uJ3Qg
dW5kZXJzdGFuZCBpZiBodWMgaGFzIGFueSBkZXBlbmRlbmN5IG9uDQo+IHRoZSBweHAuIE1heWJl
IHRoYXQgd2FzIHRoZSBvcmlnaW5hbCByZWFzb24gd2h5IHRoYXQgZnVuY3Rpb24gZW5kIHVwIHRo
ZXJlDQo+IGF0IGZpcnN0IHBsYWNlLg0KPiANCj4gSSBiZWxpZXZlIERhbmllbGUgaXMgdGhlIHJp
Z2h0IG9uZSB0byBsZXQgdXMga25vdyB0aGF0Lg0KPiANCkkgc3Bva2UgdG8gRGFuaWVsZSBhbmQg
aGUgY29uZmlybWVkIHdoYXQgaSBleHBsYWluZWQgYWJvdmUuDQoNCj4gPiAgCWk5MTVfZ2VtX3N1
c3BlbmRfbGF0ZShkZXZfcHJpdik7DQo+ID4gIA0KPiA+IA0KDQoNCg==
