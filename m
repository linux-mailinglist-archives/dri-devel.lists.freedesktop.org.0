Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD746E5017
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 20:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188E110E08E;
	Mon, 17 Apr 2023 18:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA1B10E03F;
 Mon, 17 Apr 2023 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681755830; x=1713291830;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6E+LxYaw3QZTTKP9JOa/iCryN1QjMVtpAbdn1lSlKR8=;
 b=JSVoin0sRV+WUci0TyxNgKedPF32DIMvqwsIEkeIwopR9MTxSwvNund2
 6tuetrTtPRdQ/Hfd70k/aHcroxHtPHtcaco4vEbennHPYscUFVaXaZzkT
 mlXNpRNH0KR7mi+FQHIOjpNBGtc9VXQRuSDmwFSU3piZJ3X0xaMqEPMcF
 mS3vL87CUgcwmNEaBMrlzKU340GOmFhGxaJmxU1iGO2iXltzNNQzWJEh7
 xdKOLD4obiZFDf8wEBWI960LIVWO/s2ezmG52H3eE81rr7oeoJ8dANZIT
 ePij2awnc+9C2xU1qXKFEdtPsES/Sjn+9JqYVpuTW7aXy8I7HL3YrejEi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407865316"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="407865316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 11:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684260801"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="684260801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 11:21:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 11:21:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 11:21:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 11:21:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 11:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGL0qAqFuInEWSPhayTCkFw3QyujFsB/HJVcvUKJL3Nc7E+dwkXuW1rhl2WVE9CexTzehqcFsY8x8nyA5/4MQ9XIXcsZd84Lfm+HDH7RHw1cE6MZ+09dQtIpK2SOmIMmYAKbh+D6mzoKFMygXU8KNgjmngtHxlJcr4kMx4mhHEy1VMMaOLJh/8u5yz7NMxLScUJg0IefpoF6WU3dnWd3EgHk1wdZ+nZKyJe+gs+uH+YLn311ZcEqakGuPAO+xbX1Ot13gTwyWbu2ip/G03gMvSM2yTIwNYKr3wmbnhm52xReYKVfu8rqQuce0z399nlxSAKMQELV1zwmNr/OUZkoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E+LxYaw3QZTTKP9JOa/iCryN1QjMVtpAbdn1lSlKR8=;
 b=eI0dSpvgxmL3OqnFhTxLUdVn7FcekFVUBxrzZRGbBekXHvE98Bnl2mvcUbg1/uZyZn2Qx9gm6dBkI6wgxkxD+y4XaR5T2zuJQFPRdWeK0YUU7iE9oXuzCxtxI5capbCbqrDCCuNtZsdExih+0fUTB6FiHJAEei2fxYENT7JQB+ZjUzZpsBlZsz43HXmbFB+VBVzBof+HFVkUrODnm6jQigSkncB32fSeLMffvQnl+RF77ksoXVXPdSiygpCIWR9hTx+rObZGwake2UkrwXtPfUGCByvOiWwy4N8JRE0Upkp4Q3YenBssYe0AD03DXsACOYCkgJoZ/EJA/3v8nRBJvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 18:21:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 18:21:37 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v7 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZaK929cHyRqCE4UisbxWNBqH72a8kzl+AgAsTJIA=
Date: Mon, 17 Apr 2023 18:21:37 +0000
Message-ID: <9bb67b2ed9ae681388c0f39dba29532083b323ba.camel@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-6-alan.previn.teres.alexis@intel.com>
 <fc68c7f6-4306-b208-7b4a-d04b83969311@intel.com>
In-Reply-To: <fc68c7f6-4306-b208-7b4a-d04b83969311@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB8108:EE_
x-ms-office365-filtering-correlation-id: 29c0831f-6da9-43cd-c246-08db3f709556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8AoEbZ6m84HohlXK5SURk7PfkcdtudPuGmLBD+8h3SqGmjfEkFSWyAXOK6P0sGj5EjcYUoef/oybYZvN/ZlUdiojmS+cx8DdAZMrKHa67AcPJYRwxpD8LcoH1VYbWgy/44Ej6Qj3vCGnt0rfhDshXRRLzddyjDLhNtYiLGoe+0jHYnYXS7KziMH1NZHN2+tysBRrKxGsdNRce5vfitwknvzBM9ocAAx//QZDSCTkOXQsuOrUznYLGt/g/qB8LLnz1+lZ4j8S31j5wmC+QACwhcJ/NZs48Jghpa1IsKDIf2WAFx15jfcaU3isERoZQ+HX2mAOgbdj3RSRD584TOBZeyeAU7EkJChLZGvBznp+EcQ8QQL66cpZqTybe9aktY6z/xfvD36YMHeqxgcYzn7gedHv3eRibm/5GLzQNEhz4JaUIVlZR9b7YpqFRijin34RSmFpi9ut3R3EAVeQwriLE6cYW38XMgVWl63BBtZukPpnHgv/vdGguMNa7YiT0XcxwEWdPs79weIGLJ/wIgTUI8rl4oegPrDIq61beBV+pjVeZ3ENyJY/pkRw2hx4V/ADO5s67bW1WoyR1ZRI6sKhgfuoyGevTAEN/F+flSHojwgSgs49rHVEbtX8btfkVTrr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(478600001)(6512007)(186003)(6506007)(26005)(38070700005)(86362001)(107886003)(71200400001)(6486002)(91956017)(64756008)(66446008)(76116006)(66476007)(66556008)(66946007)(122000001)(82960400001)(2906002)(36756003)(4326008)(38100700002)(2616005)(8676002)(8936002)(41300700001)(83380400001)(5660300002)(110136005)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkpSYXYyc1NXcUlIaitxclZWOC9OUmlsUEZnUldCNkdrRExlWlZiekVrQ2Qw?=
 =?utf-8?B?R2xCZGV6VXlKYjFBT0dUcjFzOGoyaWVCRHdQU3BHSHJSVFBIR0lIYzV3by8w?=
 =?utf-8?B?azB6anZrT0ZQbGY5YjNrNEpOY1RrOGppdTFLWWR1dmVPV051a0piSHp0U2Vs?=
 =?utf-8?B?RGVwSEVka01GOXVsSFFhdkkyS2o5aXdBSTZ0NWV0RXpPYUxmd3RESlU0a3Qz?=
 =?utf-8?B?TysrNzRCL3hGRXZHNkd5MU1meEpPK2REK2t5bWk2aGEvb3M5aXJuU2J4cWxz?=
 =?utf-8?B?ZytZbHVWV1hseWZRdkR5SWpmb1BvVkxKdVhuTGVneHF2ejhhYU95OCs1SDNC?=
 =?utf-8?B?bW5GSGlzU2Z1UDgrei9MaCtyeDlNTWhvNENuUjlTT0RlMmcrNFhrQk1SRlYw?=
 =?utf-8?B?OWJDZGRtL2Jaek8zSTRUcVFCWUFIbUE3YzRSOVArQ3JvbjFVOXh3Vmx2SFVR?=
 =?utf-8?B?VXlCc0I2VDVPc0hNakg1TDU3dWdiUUhmc1JaYkxVallGclRKNG1JeGJocFlO?=
 =?utf-8?B?dUtnSkl5RS8vYWpRSnZYa2dQaGlkdzRZZzA1N1VzTzVtdm5SWHVkcHJoMDhE?=
 =?utf-8?B?N2lBMUE0citrb2dqbUM5cW1Jb281SnlrdVBtcVRiZ292Tm5jSVgvQTVaT0Q1?=
 =?utf-8?B?OXliR0lxV1FRTExUek9ocEczdmw3NklkQnZrdDFtYmVuOERLbkVFMkZNQkNi?=
 =?utf-8?B?SGUwVE5WTDJQd0phTXZnbDVoVU92aDdONTBocHpsSkU2RHpVdnRqc3pxdTBa?=
 =?utf-8?B?aWtONXdmcGR4QWhKcVJhVlNzZU1QQllJZXJUUStsUHo5aDRPcEQyRHF4V3ky?=
 =?utf-8?B?NGRHbTNCUHdwVDRBejNmczN6SUVRdXBqSXpOd2hxT08yaGtjeUtvYXo4MHho?=
 =?utf-8?B?aDV0MURTbFFjUFMwYVJTdzd0Nmc1bklRRndJNVNzNzd0NzB4ZkQ1Vk5Zek8y?=
 =?utf-8?B?Sm5KVThiQ2xRTVZzTENMNzJMbS9WMFI0SHkxN2Vaa0VhN2liUXRPN3hpaXFZ?=
 =?utf-8?B?YUF6dEZvZHBHWHZBdGdyZFJWczNmUXlkTnNEMlNrVHVnRm1scXN5WXZ0ZGw2?=
 =?utf-8?B?T3NKc0pqdU1LQ0pyN1RpeVZDd28yQmJ0VHE2R0pGQ0p5eThrRERYcERYMEpR?=
 =?utf-8?B?MitQR3U1eTJac28vTkNDSS9YN0ZHVERjU3c3NzZjK3VHUzlhVUxDMUtacFVY?=
 =?utf-8?B?eDRXRk9ad0t3ZGNiY3A1MFdMTWNUVEYwcmFNWnhtQ3JWbTEwNXhjQldmYkIx?=
 =?utf-8?B?OXBqRnNzcHdQRHBzclVzNFNwUzNCc05qWTVVcndsUHdENG1ZWGhXMk95Q3BL?=
 =?utf-8?B?WjJtV3JEem5aZThLZzhId3RSVlpPNjU1VG5uRTJSUTZSbnI0VjhWcTN3bUlG?=
 =?utf-8?B?OW1wbnRHVnlTV29rSWR4Vm5mRE1OdVczdkp6NDl1eDhWZDlzcjRIY2QySjdE?=
 =?utf-8?B?YWlSQUxzWlBROWViaG0vOUNDZWNTZmlPQS94cWFCTnE0TWM0N1NURkFMZmFx?=
 =?utf-8?B?WUFyYkpDS3lrT0RTTWFreWZaNW5OQzJ4UDFFRkxMdkJxd1ptR1gvbE1IaGZP?=
 =?utf-8?B?L2tiZjM1bTE1YlgyeWxqUUNXemJNYVM5bWZZM3ZUMWZndGowYWdvOW9zWFJh?=
 =?utf-8?B?SVdVdng2OXFGdjl4b1RqMnFnTDJ2bDF2U2V0V0xzVXlOSTNXWXhLWklvNmZk?=
 =?utf-8?B?WUE2NE5oWEdvTk5WeWtFYlFYem5WeTRoVHRtQjRiOVBJbzhBemZmWFdMVDNY?=
 =?utf-8?B?SHdlRzlveFJVNjZhM1dLbk93NUJLQm42b3BFRkdZRmFHQ0hueEhFeW9ydEdr?=
 =?utf-8?B?S2VsWERFdFRCVFcrYnRoWnd2NGlWUEFpZ0krNlJKb0pib1dZSFkzWEJwUzBK?=
 =?utf-8?B?RjNLSGtLOW4yUjNjd1RxOXZGWWpqM3dGUUpoNlVINnRsbEp6azN0RXlOQ0Z0?=
 =?utf-8?B?YWVxUjZqUHNRdjlsakUydytyQWVwbVhkOC9uNFZPYkxNREpzNGlaWkdZdVlp?=
 =?utf-8?B?bHd1aWR1dkhLVkQyN1EyWTlpU3hmVDU3bWZ1bVl0WS9oTnM0OWRNd2JtRXcr?=
 =?utf-8?B?RkVOZHN0SmdHOWFHQVN1ZWV1bkp3T2xUbEpZd0dNbzRPcitLSTZUaitLT1pp?=
 =?utf-8?B?WG04S1JrTVVSYWJUNEp6ZXZHRkZMdE9WelU1N0RkaSs1a09LQWp1WC92VC9N?=
 =?utf-8?Q?a/IYVcNV49VDyOpTWPGLA2U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F71CA123464A774EBBF3C2117144BBE5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c0831f-6da9-43cd-c246-08db3f709556
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 18:21:37.6993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHe36lm3idg4Qq/2ROFXw/S1Nn1Nkm8AjUY+RlmKxg7IkQ2hKWwcw8aY+bsFipWsuYSKmk+qPuHfHg4QTCoVOtd9nyJnUsyQQSip4OQZbjKZS7VcYxuV/LMuWQgSUqNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
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

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDEwOjE0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+IA0KPiANCmFsYW46c25pcA0KDQo+ID4gQEAgLTM1NCw4ICszNjgsMTQg
QEAgaW50IGludGVsX3B4cF9zdGFydChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gICAJaWYg
KCFpbnRlbF9weHBfaXNfZW5hYmxlZChweHApKQ0KPiA+ICAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
PiAgIA0KPiA+IC0JaWYgKHdhaXRfZm9yKHB4cF9jb21wb25lbnRfYm91bmQocHhwKSwgMjUwKSkN
Cj4gPiAtCQlyZXR1cm4gLUVOWElPOw0KPiA+ICsJaWYgKEhBU19FTkdJTkUocHhwLT5jdHJsX2d0
LCBHU0MwKSkgew0KPiA+ICsJCS8qIFVzZSBhIGxhcmdlciAxIHNlY29uZCB0aW1lb3V0IGNvbnNp
ZGVyaW5nIGFsbCB0aGUgZGVwZW5kZW5jaWVzLiAqLw0KPiA+ICsJCWlmICh3YWl0X2ZvcihpbnRl
bF9weHBfZ3NjY3NfaXNfcmVhZHlfZm9yX3Nlc3Npb25zKHB4cCksIDEwMDApKQ0KPiA+ICsJCQly
ZXR1cm4gLUVOWElPOw0KPiANCj4gVGhpcyBuZWVkcyBhIGNvbW1lbnQgdG8gZXhwbGFpbiB0aGF0
IHdlIGV4cGVjdCB1c2Vyc3BhY2UgdG8gcmV0cnkgbGF0ZXIgDQo+IGlmIHdlIHJldHVybiAtRU5Y
SU8gYW5kIHRoZXJlZm9yZSB0aGUgdGltZW91dCBpcyBzbWFsbGVyIHRoYXQgd2hhdCB3b3VsZCAN
Cj4gYmUgcmVxdWlyZWQgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIGluaXQgY2FuIGNvbXBsZXRlLiBJ
dCBhbHNvIG5lZWRzIGFuIA0KPiBhY2sgZnJvbSB0aGUgdXNlcnNwYWNlIGRyaXZlcnMgZm9yIHRo
aXMgYmVoYXZpb3IuDQo+IA0KYWxhbjogSSBhZ3JlZSB3aXRoIGEgcmVxdWlyZW1lbnQgdG8gY29t
bWVudCB0aGlzIGRvd24uIEhvd2V2ZXIsIGkgYmVsaWV2ZSBpdHMgYmV0dGVyDQp0byBwdXQgdGhp
cyBpbnQgdGhlIFVBUEkgaGVhZGVyIGZpbGUgY29tbWVudC1kb2N1bWVudGF0aW9uIHNpbmNlIGl0
IGFwcGxpZXMgdG8gYm90aA0KY3VycmVudCBNVEwgYXMgd2VsbCBhcyBwcmV2aW91cyBBREwgY2Fz
ZXMgKHRoaXMgaXMgbm90IG5ldyBiZWhhdmlvciBiZWluZyBpbnRyb2R1Y2VkDQppbiBNVEwgYnV0
IGl0IGlzIGZpeGluZyBvZiB0aGUgc3BlYyBvZiBleGlzdGluZyBiZWhhdmlvcikuDQpUaGF0IHNh
aWQsIHlvdXIgZmVlZGJhY2sgaXMgYWxyZWFkeSBiZWluZyBhZGRyZXNzZWQgYnkgcGF0Y2ggIzYg
YnV0IGkgd2lsbCBhbW1lbmQNCnBhdGNoICM2IHRvIGFkZCB0aGUgZGV0YWlsIHlvdSBoaWdobGln
aHRlZCBXUlQgfiJ0aW1lb3V0IGlzIG5vdCBsYXJnZXIgdGhhbiB0aGUgY29tcGxldGlvbi1ndWFy
YW50ZWUuLi4iLg0KDQo+IA0KYWxhbjpzbmlwDQo+ID4gK2Z3X2Vycl90b19zdHJpbmcodTMyIHR5
cGUpDQo+ID4gK3sNCj4gPiArCXN3aXRjaCAodHlwZSkgew0KPiA+ICsJY2FzZSBQWFBfU1RBVFVT
X0VSUk9SX0FQSV9WRVJTSU9OOg0KPiA+ICsJCXJldHVybiAiRVJSX0FQSV9WRVJTSU9OIjsNCj4g
PiArCWNhc2UgUFhQX1NUQVRVU19OT1RfUkVBRFk6DQo+ID4gKwkJcmV0dXJuICJFUlJfTk9UX1JF
QURZIjsNCj4gPiArCWNhc2UgUFhQX1NUQVRVU19QTEFURkNPTkZJR19LRjFfTk9WRVJJRjoNCj4g
PiArCWNhc2UgUFhQX1NUQVRVU19QTEFURkNPTkZJR19LRjFfQkFEOg0KPiA+ICsJCXJldHVybiAi
RVJSX1BMQVRGT1JNX0NPTkZJRyI7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCWJyZWFrOw0KPiA+
ICsJfQ0KPiA+ICsJcmV0dXJuIE5VTEw7DQo+ID4gK30NCj4gPiArDQo+IA0KPiBUaGVyZSBpcyBh
IGxvdCBvZiByZXBsaWNhdGlvbiBmb3IgdGhpcyBlcnJvciBoYW5kbGluZywgSSdtIHdvbmRlcmlu
ZyBpZiANCj4gaXQncyB3b3J0aCBhZGRpbmcgYSBjb21tb24gZnVuY3Rpb24gdG8gaGFuZGxlIHRo
aXMuIFNvbWV0aGluZyBsaWtlOg0KPiANCj4gaW50ZWxfcHhwX2hlYWRlcl9lcnJvcih1MzIgaGVh
ZGVyLCBjb25zdCBjaGFyICpvcCwgdTMyIGlkKQ0KPiB7DQo+IAlpZiAoaXNfZndfZXJyX3BsYXRm
b3JtX2NvbmZpZyhoZWFkZXIuc3RhdHVzKSkgew0KPiAJCWRybV9pbmZvX29uY2UoJmk5MTUtPmRy
bSwNCj4gCQkJICAgICAgIlBYUCAlcy0lZCBmYWlsZWQgZHVlIHRvIEJJT1MvU09DOjB4JTA4eDol
c1xuIiwNCj4gCQkJICAgICAgb3AsIGlkLCBoZWFkZXIuc3RhdHVzLA0KPiAJCQkgICAgICBmd19l
cnJfdG9fc3RyaW5nKGhlYWRlci5zdGF0dXMpKTsNCj4gCX0gZWxzZSB7DQo+IAkJZHJtX2RiZygm
aTkxNS0+ZHJtLCAiUFhQICVzLSVkIGZhaWxlZCAweCUwOHg6JXN0OlxuIiwNCj4gCQkJb3AsIGlk
LCBoZWFkZXIuc3RhdHVzLA0KPiAJCQlmd19lcnJfdG9fc3RyaW5nKGhlYWRlci5zdGF0dXMpKTsN
Cj4gCQlkcm1fZGJnKCZpOTE1LT5kcm0sICIgICAgIGNtZC1kZXRhaWw6IElEPVsweCUwOHhdLEFQ
SS1WZXItWzB4JTA4eF1cbiIsDQo+IAkJCWhlYWRlci5jb21tYW5kX2lkLCBoZWFkZXIuYXBpX3Zl
cnNpb24pOw0KPiAJfQ0KPiB9DQo+IA0KPiANCj4gTm90IGEgYmxvY2tlci4NCmFsYW46IFRoYW5r
cyAtIGkgd2lsbCBoYXZlIHRvIGFkZHJlc3MgYXMgYSBzdGFuZCBhbG9uZSBwYXRjaCBzaW5jZSBp
IGhhdmUgdG8NCnRoaW5rIGFib3V0IG1vdmluZyB0aGlzIHRvIGEgY29tbWVudCBoZWxwZXIgbGF5
ZXIgKGNvbW1vbiB0byBib3RoIEFETC1tZWktY29tcCBhbmQgTVRMLWdzY2NzKQ0Kd2hpbGUgcG90
ZW50aWFsbHkgaGF2ZSBkaWZmZXJlbnQgc2V0IG9mIGVycm9yIGNvZGVzIHRoYXQgY2FuIG1lYW4g
ZGlmZmVyZW50IHJlcG9ydGluZyBsZXZlbHMNCihpLmUuIG5vdGljZSBvbmNlIGNveiBpdHMgYSBw
bGF0Zm9ybSBsaW1pdCB2cyBhbHdheXMgZXJyIG91dCBpZiBpdHMgcnVudGltZSByZWxhdGVkKS4N
Ck9uY2UgdGhpcyBzZXJpZXMgZ2V0cyBtZXJnZWQgaXQgd2lsbCBiZSBlYXNpZXIgdG8gd29yayBv
biB0aGF0IHBhdGNoICh3aGljaCB3b3VsZCByZXF1aXJlIGJvdGgNCmJhY2tlbmRzIHRvIGJlIHBy
ZXNlbnQgaW4gdGhlIGJhc2VsaW5lKS4NCj4gPiANCmFsYW46c25pcA0KPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfZ3NjY3MuaA0KPiA+IEBAIC0xMCwxNCArMTAs
MTggQEANCj4gPiAgIA0KPiA+ICAgc3RydWN0IGludGVsX3B4cDsNCj4gPiAgIA0KPiA+IC0jZGVm
aW5lIEdTQ19SRVBMWV9MQVRFTkNZX01TIDIwMA0KPiA+ICsjZGVmaW5lIEdTQ19SRVBMWV9MQVRF
TkNZX01TIDIxMA0KPiANCj4gd2h5IG1vdmUgZnJvbSAyMDAgdG8gMjEwPyBub3QgYSBwcm9ibGVt
LCBJIGp1c3Qgd2FudCB0byB1bmRlcnN0YW5kIHdoeSANCj4gdGhpcyBpcyByZXF1aXJlZC4NCj4g
DQo+IERhbmllbGUNCmFsYW46IHNvIDIwMCBpcyBiYXNlZCBvbiB0aGUgZncgc3BlYyAtIGFuZCBm
cm9tIHJlYWwgdGVzdGluZyBpIG9ic2VydmVkIHRoZSBvY2Nhc2lvbmFsIGhpZ2hzIHRvdWNoaW5n
IH4xODVtcy4NCkhvd2V2ZXIsIHRoZSBzcGVjIGdpdmVzIHRoaXMgbnVtYmVyIGFzIHRoZSBleHBl
Y3RlZCBtYXggdGltZSB0aGUgZmlybXdhcmUgaXMgZ29pbmcgdG8gdGFrZSB0byBwcm9jZXNzIHRo
ZSByZXF1ZXN0DQphbmQgcG9zdCBhIHJlcGx5LiBUaGVyZWZvcmUgaXQgZG9lc24ndCBpbmNsdWRl
IHRoZSBhZGRpdGlvbmFsIG92ZXJoZWFkIGZvciB0aGUgcmVxdWVzdCBjcmVhdGlvbiwgZW1pc2lv
biwNCnN1Ym1pc3Npb24gdmlhIGd1YyBhbmQgdGhlIGNvbXBsZXRpb24gcGlwZWxpbmUgY29tcGxl
dGlvbiBpbmRpY2F0aW9uLiBBbGwgb2YgdGhlc2UgY29udHJpYnV0ZSBhZGRpdGlvbmFsIGxheWVy
cw0Kb2YgcG9zc2libGUgZGVsYXkuIFNpbmNlIGFyYi1zZXNzaW9uIGNyZWF0aW9uIGFuZCBpbnZh
bGlkYXRpb24gYXJlIG5vdCBjb21tb24gZXZlbnRzLA0KSSBiZWxpZXZlIGEgc2xpZ2h0bHkgd2lk
ZXIgb3ZlcmhlYWQgb2YgMTAgbWlsaXNlYyB3aWxsIG5vdCBodXJ0Lg0KDQo=
