Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5D3E9979
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 22:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500996E07B;
	Wed, 11 Aug 2021 20:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5D56E07B;
 Wed, 11 Aug 2021 20:14:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="300799758"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="300799758"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 13:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="446084616"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2021 13:14:27 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 11 Aug 2021 13:14:26 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 11 Aug 2021 13:14:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 11 Aug 2021 13:14:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 11 Aug 2021 13:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVGtFZmE9idhNAA/mCLa4AN3p0484MSbwJi0pleivk1Bdj2Ep/He0R3iZnRLfHn2QGphEj7+9D+iSdW+A5LiblPdaaQWq+r0WsFRh+pNW1wlnNmrD1Lcj5wUsY+7kwQhYXGHK570R4bTp4PPmF0U5hCvNdsEMK2Wu/CYhXTUDO2/WJBPfFsvwqmxl0yA2HsvAY6EZasYFtsZ3R3W8vy25LMrp6wsjdb1uhvbU9+9DbVaQP2SjM48gaAY+om2uvA9V4nPqC0kMq/CXXysP2lR88/ZpapreDbGlHlw9zNcOR0iM8OyICVEAw9AskR0kngQfqY/g7IMchePbGazENUHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QpMAIaCLaIzRfONOi/H1wbLGwnzJSeeRa5dLAErWME=;
 b=Yl4lxcl2RiSF58xN4ckxNPup7BddqqIRkGinysJqr2Did20La94KB50Qb/dmoHhuekfL/2XN3F6/7bGeMixStirvFK9+6kj6DY+E82nAfkoP0QpsZ8Ns5qPW6FGp20M5KZKelOJNTtAVpuoqdfKsQ0aWHsuHjFPt989GQUqng0mkv5yjn//cKS5K7iaCA3y89leOQII5aiOg6RZ4uZpLs/v1F6E2HdAQ48jJEN4EKHjrYsoPv4hQ+R7RrsgXlBBZMBHPMT3HHCSe97mVUh/+2rAFuiPkYzJDlMPPhF/QeDocOSZ9B3mIBspwDRqcuVWBYTYSN0F1lEp0FMIY0DpbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QpMAIaCLaIzRfONOi/H1wbLGwnzJSeeRa5dLAErWME=;
 b=YOaTtLQhbjlbUicnkjv6c8kGZSYLtf/s4H0XtSQJUoCx2GeK6Hoi1MVTAi8CWRJE1LKFKkzAZI3VCiFine3i3HzkpLqCEPJKdrhCk/jkWs+1D4GjC1Pc0c6YpKe2UwaGY8DjVRmARARyL30UbMLTUzdnUbnEg27jCsktp3bAfz0=
Received: from SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 20:14:23 +0000
Received: from SA2PR11MB4842.namprd11.prod.outlook.com
 ([fe80::e89a:e691:4cd4:fcf3]) by SA2PR11MB4842.namprd11.prod.outlook.com
 ([fe80::e89a:e691:4cd4:fcf3%3]) with mapi id 15.20.4415.014; Wed, 11 Aug 2021
 20:14:23 +0000
From: "Li, Juston" <juston.li@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "C, Ramalingam"
 <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/hdcp: read RxInfo once when
 reading RepeaterAuth_Send_ReceiverID_List
Thread-Topic: [Intel-gfx] [PATCH v3 2/3] drm/i915/hdcp: read RxInfo once when
 reading RepeaterAuth_Send_ReceiverID_List
Thread-Index: AQHXjkLSYIGSpwKPFkaecn4Ba+q+c6tusz0AgAALLwA=
Date: Wed, 11 Aug 2021 20:14:22 +0000
Message-ID: <c8111f53d915185360acddf152277ee2e5b1d6cc.camel@intel.com>
References: <20210810235212.138721-1-juston.li@intel.com>
 <20210810235212.138721-3-juston.li@intel.com> <YRQmPJjT7SgGwXsX@intel.com>
In-Reply-To: <YRQmPJjT7SgGwXsX@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f71acb97-561f-4906-e843-08d95d049c2d
x-ms-traffictypediagnostic: SA0PR11MB4704:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB470405C4C92BB7BE542ABB05FDF89@SA0PR11MB4704.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4o1/vftcArWnPoxWYWOHaHDM+qpXwcJAiK+8YM2sNdBsXfQVPs9mHWwGMQJxOrWC1nAdzsG8ctPdtVryF+vW4DoVz/hGH5F3QWmxhpn+5JzkkewVrwM8nliJQPS9KUvdfoo+XWI+9/M+zCiNNdB4nm3lPMw0BX/jw9WSVTJUvHJ0hL2L7a4laBxBhzlc6GB2EPDIvnzngMIGqwLYOjKEsCeKM2ZnKQ5XkPG7fMBX72v8iIaqEhnGUEClouWlYT9XcsjOvMgL9tGfet7VeZ8HEuNWxmUAloaBPMU7NlSyhfxKS7OIMout4YFAvduVxYhRV/xZCbs1L6R694wVk6rPmB7Yp9nuBvShXgaHzzjax1NNG3vQpxC4oxh7z5kGUrVNr3QY73a+jQ8Dt9aeVXJKHo7iDv690ewOWKL6AGfmvXPks9Cq1GtdpsF9fb6XD6FGA6yk7yMeH4JqRLuJybqELRitm95iPzS4fxkyuOf6EW74bGNWDvkSVQEP/Gfw8Di9abiRJAOftT/2GixM2kRzx+emDPrE8P1eU89BlfGQrtH6idQuxHVovqrvcFZUerLmE6sh0KZ8MVvExRlpNjF7xU8qBWcIVDyKV5Xk+NhpsN3+vIckEsRfahf0I2jETLGTsQozPpAcq9ZR60G1Xi9YhuDTiL3ilH2QGCXyNZZGbjEGWA9CvGP85FizbxGQvM2WERdv7ro+AprlmX2J/W/A8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4842.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(86362001)(36756003)(478600001)(6512007)(8936002)(186003)(4326008)(71200400001)(38070700005)(5660300002)(6486002)(26005)(122000001)(8676002)(2616005)(83380400001)(107886003)(6506007)(110136005)(76116006)(91956017)(316002)(2906002)(54906003)(66446008)(66476007)(66556008)(64756008)(66946007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1hrSkNjVU1qUkJYRGdpQ1FpV2tNSENKVGR1ZTNEc0dVUS85bWU5ZjdQdjZQ?=
 =?utf-8?B?dndJSjIvdjkvR2RHUWhxb01jb1FjTHlzZ3JpVG91Y3JBUlIxZmljZXVEU0c5?=
 =?utf-8?B?aHh0ZHZ6WTlXY1pOSzVzN3RNRmlYUUZBWS9BUGNBV21hSHgwUzg3L3RxNjAz?=
 =?utf-8?B?THpVM2VodUs3YmlVVjBDZmRpdktDelVGZ2xxM3Ayc3hzd3dDcXJFeDhrS3J1?=
 =?utf-8?B?S2RjeVJMMU14MGZXaHBpYzloZnZ6VitRU2tXTGpZVE9MYUdMa1RWT0ZINmJZ?=
 =?utf-8?B?NGdrNHdUdXdFTVhlcXZIbGo3dmhjZkNLWWNVMGhtTmJGYzNlbGMzM25TS2c2?=
 =?utf-8?B?ZXNCeTVHSVhmTGhjSEU3c21RYzFXUzI0aENiUk0zb2RXSjlzcjlYVjdQS3Vw?=
 =?utf-8?B?NStKWFQwUXM5c09hMmxyTlpmek1XbXVmL2VDT1pxUHBlKzdSR3BJd0t3SWhG?=
 =?utf-8?B?MFhla05ta3RoMjZBdFNyOFJzNHFicXN2a0hWMVllekYrRkZRVW5pN1JnbjBo?=
 =?utf-8?B?dDBqTDFmajZtTEpNSWdNY3BWMzAyTll6VXJ1My9sNkE3YzFDdldDVzYreVBi?=
 =?utf-8?B?NDRMQUZMelNIcUxlYU4vN2pyWUZvSHBDRkZjZEw4N1RiK20yUUVJcFJpQ3NB?=
 =?utf-8?B?MmhLYXpiamlMZkJBRG9xSmttc1JVU1Q3QUpKclExZWcwUlhxNXpGcEl4dyt0?=
 =?utf-8?B?WnpET3lBdFRSUjI3a0k4b0Q2R3V2SUJacHlQWDFTbUx3b2JwaWtvWkJuV3pn?=
 =?utf-8?B?VWp6R3RHT2UzVGNkWisrNGhxQVNpMTl1TWJXOEY3bC9MN1pDU3VJTkZZMkpW?=
 =?utf-8?B?S0U3REF6SytXMmVNdFN6TFBmTWhzYjVRQWc1RTVRTGtDM2ZyWkllZ0lXbEE1?=
 =?utf-8?B?NStuWURXYVNlVTVMeDkwR2ZES0JteC9id0RUZE9GVHZpTFlrZ3prbFpIRDR5?=
 =?utf-8?B?djZoajYyd2RydkpoL2gyMlpteWxHaU5Kc0FOcTY3WkJCTk9ManBHeEFINzBH?=
 =?utf-8?B?cHR5R3ltbjdmazY3MDBsUlJRb3ZydG5CV3d4aGZlZUMzdW5heU1HaFVReGR6?=
 =?utf-8?B?YlJDY3ppRUxTS29VVEUxSHgxYzBPaGk0V3VLMEVOOHN1ZmI1RXhYZUFRc2tC?=
 =?utf-8?B?ck9CMEUzKzg2VTdYOHNmUENnc1NaWFdnWG1kSkU4T0RrUm5WcDJKbVpLMUp1?=
 =?utf-8?B?aTQ1djRoaWFQY2JVa3A2L3kyN0ZRQ0tWQjNqTVQ1VFJtenpkK3RlOXJJM0dY?=
 =?utf-8?B?c3hlTUNwM0ZQVktISmJJZWxaYm82MFZqTmJHVzdwbWlNVS9yeFhNQW40a3hR?=
 =?utf-8?B?YTBTL3djWFEyQzdaTjNJbGphKzZ1dkNZL1NObytuVzJnblN2OG1ibnZZWXZR?=
 =?utf-8?B?RVUrYlY2NVZsREtzZHVpZzBTUk81VXFVQzZrUGdSaVdZdjluS3Z0SXhKNzF0?=
 =?utf-8?B?ZmNqWDUxcTI3QU5rY28rcDlQc1ZpS0RCZkdzeEswcXh4S2JmQzRSeGdyM3RH?=
 =?utf-8?B?OTRtdlhmRnpmZE9WelowY05iKytHeUp2VTYyUDZvU2ZuVkM2eURudm1rY29Y?=
 =?utf-8?B?UnphSTFvVU9yTlB0bXlMSm9vUm5uWnNLU2hYcGwweFBXRm9wQ050VHJ5SFJp?=
 =?utf-8?B?MkdyU0FCNGpmWU5RRHY3VVhaMmwxNlVla2JSVTRwazBqQXZmbnZ3djZncUVi?=
 =?utf-8?B?Nnc4K3RDUU5Ga29UMWx2NEJ4eEx3ck81MURSdGtpNVlNMFJlNkpyUVVYTWxv?=
 =?utf-8?Q?ohkTd16nV/de11xcppgPsDeRRW2lRRkX1WYWOdv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EED1F6DB9115AB47A1014D171B51206C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4842.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71acb97-561f-4906-e843-08d95d049c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 20:14:22.9758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5vGSWutX6wJgAz6TcfrmyK80jEtXnf6OV4ayDwHfGTGybHWMm7YEU00mzQLe6V//YJcOlP/0eRGx/29UhooYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

T24gV2VkLCAyMDIxLTA4LTExIGF0IDE1OjM0IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgQXVnIDEwLCAyMDIxIGF0IDA0OjUyOjExUE0gLTA3MDAsIEp1c3RvbiBMaSB3cm90
ZToNCj4gPiBXaGVuIHJlYWRpbmcgUmVwZWF0ZXJBdXRoX1NlbmRfUmVjZWl2ZXJJRF9MaXN0LCBS
eEluZm8gaXMgcmVhZCBieQ0KPiA+IGl0c2VsZg0KPiA+IG9uY2UgdG8gcmV0cmlldmUgdGhlIERF
VklDRV9DT1VOVCB0byBjYWxjdWxhdGUgdGhlIHNpemUgb2YgdGhlDQo+ID4gUmVjZWl2ZXJJRCBs
aXN0IHRoZW4gcmVhZCBhIHNlY29uZCB0aW1lIGFzIGEgcGFydCBvZiByZWFkaW5nDQo+ID4gUmVj
ZWl2ZXJJRA0KPiA+IGxpc3QuDQo+ID4gDQo+ID4gT24gc29tZSBNU1QgZG9ja2luZyBzdGF0aW9u
cywgUnhJbmZvIGNhbiBvbmx5IGJlIHJlYWQgYWZ0ZXIgdGhlDQo+ID4gUnhTdGF0dXMNCj4gPiBS
RUFEWSBiaXQgaXMgc2V0IG90aGVyd2lzZSB0aGUgcmVhZCB3aWxsIHJldHVybiAtRUlPLiBUaGUg
c3BlYw0KPiA+IHN0YXRlcyB0aGF0DQo+ID4gdGhlIFJFQURZIGJpdCBzaG91bGQgYmUgY2xlYXJl
ZCBhcyBzb29uIGFzIFJ4SW5mbyBoYXMgYmVlbiByZWFkLg0KPiA+IA0KPiA+IEluIHRoaXMgY2Fz
ZSwgdGhlIGZpcnN0IFJ4SW5mbyByZWFkIHN1Y2NlZWRzIGJ1dCBhZnRlciB0aGUgUkVBRFkNCj4g
PiBiaXQgaXMNCj4gPiBjbGVhcmVkLCB0aGUgc2Vjb25kIHJlYWQgZmFpbHMuDQo+ID4gDQo+ID4g
Rml4IGl0IGJ5IHJlYWRpbmcgUnhJbmZvIG9uY2UgYW5kIHN0b3JpbmcgaXQgYmVmb3JlIHJlYWRp
bmcgdGhlDQo+ID4gcmVzdCBvZg0KPiA+IFJlcGVhdGVyQXV0aF9TZW5kX1JlY2VpdmVySURfTGlz
dCBvbmNlIHdlIGtub3cgdGhlIHNpemUuDQo+ID4gDQo+ID4gTW9kaWZ5IGdldF9yZWNlaXZlcl9p
ZF9saXN0X3NpemUoKSB0byByZWFkIGFuZCBzdG9yZSBSeEluZm8gaW4gdGhlDQo+ID4gbWVzc2Fn
ZSBidWZmZXIgYW5kIGFsc28gcGFyc2UgREVWSUNFX0NPVU5UIHNvIHdlIGtub3cgdGhlIHNpemUg
b2YNCj4gPiBSZXBlYXRlckF1dGhfU2VuZF9SZWNlaXZlcklEX0xpc3QuDQo+ID4gDQo+ID4gQWZ0
ZXJ3YXJkcywgcmV0cmlldmUgdGhlIHJlc3Qgb2YgdGhlIG1lc3NhZ2UgYXQgdGhlIG9mZnNldCBm
b3INCj4gPiBzZXFfbnVtX1YuDQo+ID4gDQo+ID4gQ2hhbmdlcyBpbiB2NDoNCj4gPiAtIHJlYmFz
ZSBhbmQgZWRpdCBjb21taXQgbWVzc2FnZQ0KPiA+IA0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4g
LSByZW1vdmUgY29tbWVudA0KPiA+IA0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSByZW1vdmUg
dW5uZWNlc3NhcnkgbW92aW5nIG9mIGRybV9pOTE1X3ByaXZhdGUgZnJvbSBwYXRjaCAxDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPg0KPiA+
IEFja2VkLWJ5OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9oZGNwLmMg
fCAzMCArKysrKysrKysrLS0tLS0tDQo+ID4gLS0tLQ0KPiA+IMKgaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiA+
IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9oZGNwLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfaGRj
cC5jDQo+ID4gaW5kZXggMWQwMDk2NjU0Nzc2Li41MjZmZDU4YjliNTEgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9oZGNwLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2hkY3AuYw0KPiA+IEBAIC00
OTYsMTEgKzQ5NiwxMCBAQCBnZXRfcnhpbmZvX2hkY3BfMV9kZXZfZG93bnN0cmVhbShzdHJ1Y3QN
Cj4gPiBpbnRlbF9kaWdpdGFsX3BvcnQgKmRpZ19wb3J0LCBib29sICpoZGNwDQo+ID4gwqB9DQo+
ID4gwqANCj4gPiDCoHN0YXRpYw0KPiA+IC1zc2l6ZV90IGdldF9yZWNlaXZlcl9pZF9saXN0X3Np
emUoc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydA0KPiA+ICpkaWdfcG9ydCkNCj4gPiArc3NpemVf
dCBnZXRfcmVjZWl2ZXJfaWRfbGlzdF9yeF9pbmZvKHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQN
Cj4gPiAqZGlnX3BvcnQsIHUzMiAqZGV2X2NudCwgdTggKmJ5dGUpDQo+ID4gwqB7DQo+ID4gLcKg
wqDCoMKgwqDCoMKgdTggcnhfaW5mb1tIRENQXzJfMl9SWElORk9fTEVOXTsNCj4gPiAtwqDCoMKg
wqDCoMKgwqB1MzIgZGV2X2NudDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3NpemVfdCByZXQ7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgdTggKnJ4X2luZm8gPSBieXRlOw0KPiA+IMKgDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoHJldCA9IGRybV9kcF9kcGNkX3JlYWQoJmRpZ19wb3J0LT5kcC5hdXgsDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIERQX0hEQ1BfMl8yX1JFR19SWElORk9fT0ZGU0VULA0KPiA+IEBAIC01MDgsMTUgKzUwNywx
MSBAQCBzc2l6ZV90IGdldF9yZWNlaXZlcl9pZF9saXN0X3NpemUoc3RydWN0DQo+ID4gaW50ZWxf
ZGlnaXRhbF9wb3J0ICpkaWdfcG9ydCkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCAhPSBI
RENQXzJfMl9SWElORk9fTEVOKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIHJldCA+PSAwID8gLUVJTyA6IHJldDsNCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDC
oGRldl9jbnQgPSAoSERDUF8yXzJfREVWX0NPVU5UX0hJKHJ4X2luZm9bMF0pIDw8IDQgfA0KPiA+
ICvCoMKgwqDCoMKgwqDCoCpkZXZfY250ID0gKEhEQ1BfMl8yX0RFVl9DT1VOVF9ISShyeF9pbmZv
WzBdKSA8PCA0IHwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSERD
UF8yXzJfREVWX0NPVU5UX0xPKHJ4X2luZm9bMV0pKTsNCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKg
wqDCoGlmIChkZXZfY250ID4gSERDUF8yXzJfTUFYX0RFVklDRV9DT1VOVCkNCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2NudCA9IEhEQ1BfMl8yX01BWF9ERVZJQ0VfQ09V
TlQ7DQo+ID4gLQ0KPiA+IC3CoMKgwqDCoMKgwqDCoHJldCA9IHNpemVvZihzdHJ1Y3QgaGRjcDJf
cmVwX3NlbmRfcmVjZWl2ZXJpZF9saXN0KSAtDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoEhEQ1BfMl8yX1JFQ0VJVkVSX0lEU19NQVhfTEVOICsNCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgKGRldl9jbnQgKiBIRENQXzJfMl9SRUNFSVZFUl9JRF9MRU4pOw0K
PiA+ICvCoMKgwqDCoMKgwqDCoGlmICgqZGV2X2NudCA+IEhEQ1BfMl8yX01BWF9ERVZJQ0VfQ09V
TlQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpkZXZfY250ID0gSERDUF8y
XzJfTUFYX0RFVklDRV9DT1VOVDsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
cmV0Ow0KPiA+IMKgfQ0KPiA+IEBAIC01MzQsNiArNTI5LDcgQEAgaW50IGludGVsX2RwX2hkY3Ay
X3JlYWRfbXNnKHN0cnVjdA0KPiA+IGludGVsX2RpZ2l0YWxfcG9ydCAqZGlnX3BvcnQsDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBoZGNwMl9kcF9tc2dfZGF0YSAqaGRjcDJfbXNn
X2RhdGE7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGt0aW1lX3QgbXNnX2VuZCA9IGt0aW1lX3NldCgw
LCAwKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBtc2dfZXhwaXJlZDsNCj4gPiArwqDCoMKg
wqDCoMKgwqB1MzIgZGV2X2NudDsNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBoZGNwMl9t
c2dfZGF0YSA9IGdldF9oZGNwMl9kcF9tc2dfZGF0YShtc2dfaWQpOw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBpZiAoIWhkY3AyX21zZ19kYXRhKQ0KPiA+IEBAIC01NDYsMTcgKzU0MiwyMSBAQCBpbnQg
aW50ZWxfZHBfaGRjcDJfcmVhZF9tc2coc3RydWN0DQo+ID4gaW50ZWxfZGlnaXRhbF9wb3J0ICpk
aWdfcG9ydCwNCj4gPiDCoA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBoZGNwLT5jcF9pcnFfY291bnRf
Y2FjaGVkID0gYXRvbWljX3JlYWQoJmhkY3AtDQo+ID4gPmNwX2lycV9jb3VudCk7DQo+ID4gwqAN
Cj4gPiArwqDCoMKgwqDCoMKgwqAvKiBEUCBhZGFwdGF0aW9uIG1zZ3MgaGFzIG5vIG1zZ19pZCAq
Lw0KPiA+ICvCoMKgwqDCoMKgwqDCoGJ5dGUrKzsNCj4gPiArDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oGlmIChtc2dfaWQgPT0gSERDUF8yXzJfUkVQX1NFTkRfUkVDVklEX0xJU1QpIHsNCj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gZ2V0X3JlY2VpdmVyX2lkX2xpc3Rfc2l6
ZShkaWdfcG9ydCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IGdl
dF9yZWNlaXZlcl9pZF9saXN0X3J4X2luZm8oZGlnX3BvcnQsDQo+ID4gJmRldl9jbnQsIGJ5dGUp
Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCA8IDApDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJl
dDsNCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzaXplID0gcmV0
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBieXRlICs9IHJldDsNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2l6ZSA9IHNpemVvZihzdHJ1Y3QNCj4gPiBo
ZGNwMl9yZXBfc2VuZF9yZWNlaXZlcmlkX2xpc3QpIC0NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgSERDUF8yXzJfUlhJTkZPX0xFTiAtIEhEQ1BfMl8yX1JFQ0VJVkVSX0lEU19N
QVhfTEVODQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoZGV2X2Nu
dCAqIEhEQ1BfMl8yX1JFQ0VJVkVSX0lEX0xFTik7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4g
PiAtwqDCoMKgwqDCoMKgwqBieXRlc190b19yZWN2ID0gc2l6ZSAtIDE7DQo+ID4gwqANCj4gPiAt
wqDCoMKgwqDCoMKgwqAvKiBEUCBhZGFwdGF0aW9uIG1zZ3MgaGFzIG5vIG1zZ19pZCAqLw0KPiA+
IC3CoMKgwqDCoMKgwqDCoGJ5dGUrKzsNCj4gPiArwqDCoMKgwqDCoMKgwqBieXRlc190b19yZWN2
ID0gc2l6ZSAtIDE7DQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgd2hpbGUgKGJ5dGVzX3Rv
X3JlY3YpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxlbiA9IGJ5dGVz
X3RvX3JlY3YgPiBEUF9BVVhfTUFYX1BBWUxPQURfQllURVMgPw0KPiA+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgNCj4gPiBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaA0KPiANCj4gSSB3YXMgYWJvdXQgdG8gbWVyZ2UgdG8gZHJtLWludGVsLW5leHQgYnV0IHRo
ZW4gSSBub3RpY2VkIHRoaXMuLg0KPiANCj4gU28gd2UgbmVlZCB0byBjYyBEYXZlIGFuZCBEYW5p
ZWwgaGVyZSB0byBnZXQgYW4gYWNrIGZyb20gdGhlbS4NCj4gDQo+ID4gaW5kZXggM2YyNzE1ZWI5
NjVmLi43NDc2ZTdjNmQwYmUgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oDQo+ID4gQEAgLTE0
MTMsNyArMTQxMyw3IEBAIGVudW0gZHJtX2RwX3BoeSB7DQo+ID4gwqAjZGVmaW5lDQo+ID4gRFBf
SERDUF8yXzJfTENfSU5JVF9PRkZTRVTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERQX0hEQ1Bf
Ml8yX1JFR19STl9PRkZTRVQNCj4gPiDCoCNkZWZpbmUNCj4gPiBEUF9IRENQXzJfMl9MQ19TRU5E
X0xQUklNRV9PRkZTRVTCoMKgwqDCoMKgwqBEUF9IRENQXzJfMl9SRUdfTFBSSU1FX09GRlNFDQo+
ID4gVA0KPiA+IMKgI2RlZmluZQ0KPiA+IERQX0hEQ1BfMl8yX1NLRV9TRU5EX0VLU19PRkZTRVTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERQX0hEQ1BfMl8yX1JFR19FREtFDQo+ID4g
WV9LU19PRkZTRVQNCj4gPiAtI2RlZmluZQ0KPiA+IERQX0hEQ1BfMl8yX1JFUF9TRU5EX1JFQ1ZJ
RF9MSVNUX09GRlNFVMKgwqDCoMKgwqDCoMKgwqBEUF9IRENQXzJfMl9SRUdfUlhJTg0KPiA+IEZP
X09GRlNFVA0KPiA+ICsjZGVmaW5lDQo+ID4gRFBfSERDUF8yXzJfUkVQX1NFTkRfUkVDVklEX0xJ
U1RfT0ZGU0VUwqDCoMKgwqDCoMKgwqDCoERQX0hEQ1BfMl8yX1JFR19TRVFfDQo+ID4gTlVNX1Zf
T0ZGU0VUDQo+IA0KPiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhpcyBzbyBJJ20gbm90IHN1cmUg
aWYgdGhpcyBzaG91bGQgYmUgYQ0KPiBzZXBhcmF0ZWQgcGF0Y2gNCj4gb3IgYmV0dGVyIGV4cGxh
aW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IA0KPiBEYXZlL0RhbmllbCBob3cgZG8geW91
IHByZWZlciB0aGlzPw0KDQpBY3R1YWxseSB0aGlzIGlzIGp1c3QgaW5jb3JyZWN0LCBJIHNob3Vs
ZCBub3QgYmUgY2hhbmdpbmcgdGhpcyBkZWZpbmUuDQoNCkluc3RlYWQsIEknbGwgY2hhbmdlIGlu
dGVsX2RwX2hkY3AyX3JlYWRfbXNnKCkgdG8gdXBkYXRlIHRoZSBvZmZzZXQgYW5kDQphZGQgSERD
UF8yXzJfUlhJTkZPX0xFTiB0byBpdCBhZnRlciByZWFkaW5nIFJ4SW5mby4NCmVnLiBEUF9IRENQ
XzJfMl9SRVBfU0VORF9SRUNWSURfTElTVF9PRkZTRVQgKyBIRENQXzJfMl9SWElORk9fTEVOID0N
CkRQX0hEQ1BfMl8yX1JFR19TRVFfTlVNX1ZfT0ZGU0VUIHdoaWNoIGlzIHRoZSBvZmZzZXQgd2Ug
bmVlZCB0bw0KY29udGludWUgcmVhZGluZyBmcm9tLg0KDQpXaWxsIHNlbmQgb3V0IG5ldyByZXZp
c2lvbg0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0IFJvZHJpZ28hDQoNCj4gDQo+ID4g
wqAjZGVmaW5lDQo+ID4gRFBfSERDUF8yXzJfUkVQX1NFTkRfQUNLX09GRlNFVMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgRFBfSERDUF8yXzJfUkVHX1ZfT0YNCj4gPiBGU0VUDQo+ID4g
wqAjZGVmaW5lDQo+ID4gRFBfSERDUF8yXzJfUkVQX1NUUkVBTV9NQU5BR0VfT0ZGU0VUwqDCoMKg
RFBfSERDUF8yXzJfUkVHX1NFUV9OVU1fTV9PRg0KPiA+IEZTRVQNCj4gPiDCoCNkZWZpbmUNCj4g
PiBEUF9IRENQXzJfMl9SRVBfU1RSRUFNX1JFQURZX09GRlNFVMKgwqDCoMKgRFBfSERDUF8yXzJf
UkVHX01QUklNRV9PRkZTRQ0KPiA+IFQNCj4gPiAtLSANCj4gPiAyLjMxLjENCj4gPiANCg0K
