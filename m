Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E257629CFD4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 12:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971686EC98;
	Wed, 28 Oct 2020 11:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7F56E4F9;
 Wed, 28 Oct 2020 11:55:11 +0000 (UTC)
IronPort-SDR: 63qJ2vXsD6tD031dGlii4DlH8OrsazQNbAspfaI7njSt4LTMvBLAI12CbmR79GIY3gYO6PUV4v
 CJig/6cvCIdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="165654062"
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="165654062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 04:55:10 -0700
IronPort-SDR: XnnD/VRxwDQ7dmm1xEx+pJgAnDwU6j3DS2XC2gYbRq6kcRJ5GnQoWSrlQON1msFfRRB2Fhf1xJ
 KuxOaihP4VmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="526301700"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 28 Oct 2020 04:55:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 04:55:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 04:55:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 04:55:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 04:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PafpBtd8N4beE5G6Ay1AqYMRyJ+4OYbygdYujT8GT/GukEdIMzs1sPdAkaZiJKn1Bc3K34HQjJtuH4Y68IhZu0caAKz2MkUkyZSooaRX3kGEOcBPdugdjuOsCv0ca8+7SFc8y+fLzF9mXCMT2e7tvFp4kjHWIbWFFKeNX724ml4QkTWb5WR+jA9Y4PjXnrW20nnbhEoFC0gp67MYMjvcUFsyBuGQ9PWK5+HynSiRo39vP/A97qk32zt3oNaAtGXfPSLOnEbYMHli5x8WH/ZWIK/0D7B03PyfCijf1PuZK8qpDw3G04gNcTnHr2lwykE32D2JFAWYX+wPFTLfWeenrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8RAHUTun2FZPvg9ZbRG4Hj7Bil0PepQ+81JCvqMUDk=;
 b=aY2bDJZwbKLlUvJSjNLRvJxptMdVgTyyBC7f0r4nAASc22wJEFp3Wi36sbkr15gMRHRWOwsBEc+uf8cQ0D6pbQ0BgwQCpN/Fe3ZMtcNpdJRnDcjLBcgIlrQ6aA7YgUe74xyAxojIWy9vQMSkjO1qO5TLgBC3gvKV3uAgyqyQSHB5M01XXwBMs37Xf6BLpHPm90j5VjqO5cjh1Aep0W4q/SRABIihiKEeVNgBhmk07kfD/622xq9nPfCHMh1qrfIqTB0CMVn5uocl3tpFMxWXS3Wl4B3eU57OUnX/0RgX31K26FR5YbBZc29a4VegyvQzMmEFwHLZzkhhyGrJBXcpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8RAHUTun2FZPvg9ZbRG4Hj7Bil0PepQ+81JCvqMUDk=;
 b=evlxIkVCf1DE4SMxxPSokOcUNE6mgACnevZ0sOfXI4a9qAV5/yByYHreE7aVEMcV2cfbhTkRnR0BKGQJsLla5AWwZHgcmV/+ajWQ8t+6VRr2IhutO5CGTz92y3p+jZ76mQS1UYI2HIFR89OVT9x0Vax37xpOrnxkthSLqtOreM8=
Received: from CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14)
 by MWHPR11MB1408.namprd11.prod.outlook.com (2603:10b6:300:24::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 11:55:04 +0000
Received: from CO1PR11MB5075.namprd11.prod.outlook.com
 ([fe80::81b3:1531:c581:6723]) by CO1PR11MB5075.namprd11.prod.outlook.com
 ([fe80::81b3:1531:c581:6723%4]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 11:55:04 +0000
From: "Pandey, Hariom" <hariom.pandey@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
Thread-Index: AQHWm/Dp6z1PH5QIPE+D2JT4cvgJtamK2W6AgAAAfICAAAIHAIAAAfcAgAQXZwCAAFXLAIAASytggAjP0ACABu2hAIAAARkAgAFlrVCAC/qO4IAAVPwAgAAAT6A=
Date: Wed, 28 Oct 2020 11:55:04 +0000
Message-ID: <CO1PR11MB50756238298DCDD2AFCC7F3EF6170@CO1PR11MB5075.namprd11.prod.outlook.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
 <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
 <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
 <20201019182936.GA3149316@intel.com>
 <160313241261.4425.3184593266306110227@build.alporthouse.com>
 <CO1PR11MB50750A169A14FCC84C70C936F61F0@CO1PR11MB5075.namprd11.prod.outlook.com>
 <CO1PR11MB5075AAFA3500F4A3A610FC52F6170@CO1PR11MB5075.namprd11.prod.outlook.com>
 <D7AA9562-983D-4F83-BFD7-6E66801FA273@intel.com>
In-Reply-To: <D7AA9562-983D-4F83-BFD7-6E66801FA273@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [171.60.153.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b409eac8-8c49-4044-5e8a-08d87b384ee6
x-ms-traffictypediagnostic: MWHPR11MB1408:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB14083EE482C36987A323FE7EF6170@MWHPR11MB1408.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nUe5CNPChI0njk5t27IUeYxmqlORNUkd/lj3+8GGdtiUvnqhFZOfi5KU1RxDUFVZlr8iKBTj6JhjrAB+2kGWmSlEfa6fcvQ3pX86bWzj1S6oqC9sArQ1eXvQWDKmRR5e1LAz8Bxxy37F1zLdjOLitwMdYoQm71V2JaLmifuGg61HkORbHBhB1YteAsmThR4i4SB2PGxHQxxd27sA3muoEV3AbO6AgqzX6AY+buVd44MeiQ/pT9IeeXBjUwj2WePHQmF3QYnnR0W0ufmzE9MiRsoj98ig8s5cIFmJ3+3zpu30AYXmCa+L8g/DPBaCHjdoCpA3ApfDjRa+er9jGhzXQRV7SPHK7zpTTaLn5kFunixV9gjn4Kqu2G3/meuRZWwu2OxagyyFrh2z43iyWb2pjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5075.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(53546011)(26005)(316002)(33656002)(6506007)(6636002)(5660300002)(6862004)(9686003)(54906003)(8676002)(86362001)(8936002)(83380400001)(71200400001)(2906002)(186003)(966005)(52536014)(478600001)(55016002)(107886003)(76116006)(66476007)(66446008)(64756008)(66556008)(66946007)(4001150100001)(7696005)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ik5MOk8wmdbqb+A/8i80oNd3XeWyA01WaKPmFv2w4L0O2TT7b91l3/SJ6TjsV1/elMhyOlldFXo6qd+gIfCmZ/wpEVrKkmtLHScmM8KBjVbz3Ica995ESoQSkgKE1+symwhg+Z9pYT2uEOZg/SPtZxIGih8Qwd7LG+DtPNAQqR4vvZa7pH/0FoEzAMzFxEbdsKfbd0oaPE7Lz+FE6O4UEWFPxlJkPFoACenmS0ci92b2RWAyMeeCdR0FSbmSC7O2FgCn+JSlOY2W3gJ2d03nUbwS4ppY18Y9p+akOPRB8HicD1DB0pKyKaWjSv2s+1yX+iayKpP7TuEKNHptLBVamVJT5m0oCrdorW/YokvO69P0rbO4hSL05qlZj3V8lX3ToNY/FGstn93WYy0KokhN99Kcuh1aYMpQKdnMMoJXs/XLucfn8OXyp+2Sbr/CjHd7z54tUFzDQTYdcj11ERy6WDHrHjx8jbtjU7m40khdVSosg8riXhsYkdYn61gXbtF8i5kigUIG1EMzGQaHVtiDaMbw4TimbRhsbm8alYI0pPC2Uk2/PHCoqT7FuZsVgcTw2eA+7k57Uerc9yCK+7PYm2iiQU8IbBin7iOqsRf1Wy67vp3QphdF049m2HiPVbvhlkXh49DtL1dCvPzHpMI8mw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5075.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b409eac8-8c49-4044-5e8a-08d87b384ee6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 11:55:04.2999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCxZJPuNrHuXv4Gz/41qdS073fTlVvUxTQMMd22GySZaST/ictaMKSNoz+OhvuUefO0cdMVqntnQC98r1XDOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1408
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
Cc: "Ausmus, James" <james.ausmus@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Szwichtenberg, Radoslaw" <radoslaw.szwichtenberg@intel.com>, "K,
 SrinivasX" <srinivasx.k@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Souza, 
 Jose" <jose.souza@intel.com>, "Meena, Mahesh" <mahesh.meena@intel.com>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T2ssIEkgaGF2ZSBpbml0aWF0ZWQgdGhlIHN0ZXBzIHRvIHVwZ3JhZGUgdGhlIENJIG1hY2hpbmUn
cyBzaWxpY29uICYgQklPUy4NCg0KVGhhbmtzDQpIYXJpb20gUGFuZGV5DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI4LCAyMDIwIDU6MjQgUE0NCj4g
VG86IFBhbmRleSwgSGFyaW9tIDxoYXJpb20ucGFuZGV5QGludGVsLmNvbT47IFN6d2ljaHRlbmJl
cmcsIFJhZG9zbGF3DQo+IDxyYWRvc2xhdy5zendpY2h0ZW5iZXJnQGludGVsLmNvbT4NCj4gQ2M6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPjsgQXVzbXVzLCBKYW1lcw0K
PiA8amFtZXMuYXVzbXVzQGludGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFNvdXphLCBKb3Nl
IDxqb3NlLnNvdXphQGludGVsLmNvbT47IGRyaS1kZXZlbA0KPiA8ZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz47IFN1cmVuZHJha3VtYXIgVXBhZGh5YXksIFRlamFza3VtYXJYDQo+IDx0
ZWphc2t1bWFyeC5zdXJlbmRyYWt1bWFyLnVwYWRoeWF5QGludGVsLmNvbT47IEssIFNyaW5pdmFz
WA0KPiA8c3Jpbml2YXN4LmtAaW50ZWwuY29tPjsgTWVlbmEsIE1haGVzaCA8bWFoZXNoLm1lZW5h
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSF0gZHJtL2k5MTUv
ZWhsOiBSZW1vdmUgcmVxdWlyZV9mb3JjZV9wcm9iZQ0KPiBwcm90ZWN0aW9uDQo+IA0KPiANCj4g
DQo+ID4gT24gT2N0IDI3LCAyMDIwLCBhdCAxMTo0OSBQTSwgUGFuZGV5LCBIYXJpb20NCj4gPGhh
cmlvbS5wYW5kZXlAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIENocmlzLA0KPiA+DQo+
ID4gQXdhaXRpbmcgeW91ciBraW5kIHJlc3BvbnNlIGhlcmXigKYNCj4gDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvQ0lfRFJNXzkyMDgvZmktZWhsLQ0KPiAxL2ln
dEBpOTE1X3NlbGZ0ZXN0QGxpdmVAZ3RfcG0uaHRtbA0KPiAiRGlkIG5vdCBlbnRlciBSQzYhIg0K
PiANCj4gQ2hyaXMgYWxyZWFkeSB0b2xkIHRoYXQgd2UgbmVlZCB0byBnZXQgUkM2IHdvcmtpbmcg
b24gQ0kuDQo+IElmIHdlIG5lZWQgQklPUyB1cGRhdGUgb3IgbWFjaGluZSByZXBsYWNlbWVudCB0
aGVyZSB3ZSBuZWVkIHRvIHdvcmsgd2l0aA0KPiBDSSB0ZWFtIHRvIG1ha2UgdGhhdCBoYXBwZW4u
DQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gSGFyaW9tIFBhbmRleQ0KPiA+DQo+ID4gRnJvbTog
UGFuZGV5LCBIYXJpb20NCj4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIwLCAyMDIwIDk6Mjgg
UE0NCj4gPiBUbzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+ID4g
Q2M6IEF1c211cywgSmFtZXMgPGphbWVzLmF1c211c0BpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkN
Cj4gPiA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QCA8bGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFNvdXphLCBKb3Nl
IDxqb3NlLnNvdXphQGludGVsLmNvbT47DQo+ID4gZHJpLWRldmVsQCA8bGlzdHMuZnJlZWRlc2t0
b3Aub3JnIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ow0KPiA+IFN1cmVuZHJha3Vt
YXIgVXBhZGh5YXksIFRlamFza3VtYXJYDQo+ID4gPHRlamFza3VtYXJ4LnN1cmVuZHJha3VtYXIu
dXBhZGh5YXlAaW50ZWwuY29tPjsgSywgU3Jpbml2YXNYDQo+ID4gPHNyaW5pdmFzeC5rQGludGVs
LmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPiA+IE1lZW5h
LCBNYWhlc2ggPE1haGVzaC5NZWVuYUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUkU6IFtJbnRl
bC1nZnhdIFtQQVRDSF0gZHJtL2k5MTUvZWhsOiBSZW1vdmUNCj4gPiByZXF1aXJlX2ZvcmNlX3By
b2JlIHByb3RlY3Rpb24NCj4gPg0KPiA+IEhpIENocmlzLA0KPiA+DQo+ID4gV2UgaGF2ZSBydW4g
UkM2IHRlc3QgY2FzZXMgYXMgcmVjZW50bHkgYXMgNCBkYXlzIGFnbyBvbiBFSEwgYW5kIHRoZXkg
aGF2ZQ0KPiBwYXNzZWQuIEJlbG93IGFyZSB0aGUgcGFzcyBsb2cgbGlua3MgJiBhdHRhY2hlZCBl
bWFpbCBoYXMgdGhlIERSTS9JR1QgdGFnDQo+IHdoZXJlIHRoZXkgaGF2ZSBwYXNzZWQuIFdlIGFy
ZSBmaW5kaW5nIHRoYXQgdGhlIOKAnEVITCBCQVQgc2V0dXDigJ0gaXMgbm90IHVwdG8NCj4gZGF0
ZSBpbiB0ZXJtcyBvZiBTaWxpY29uICYgQklPUyB3aGljaCB3ZSBhcmUgd29ya2luZyB0byB1cGdy
YWRlLiBCdXQganVzdCBmb3INCj4gdGhhdCwgc2hvdWxkIHdlIGJsb2NrIHRoaXMgcGF0Y2g/IEp1
c3QgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgYXMgdGhlcmUgaXMgbm8NCj4gaW5oZXJlbnQgb3IgbGF0
ZW50IFJDNiBpc3N1ZSBhbnltb3JlLg0KPiA+DQo+ID4g4oCiIGlndEBpOTE1X3BtX3JjNl9yZXNp
ZGVuY3lAcmM2LWFjY3VyYWN5IC0tLSBQQVNTIC0gTG9nIOKAog0KPiA+IGlndEBpOTE1X3BtX3Jj
Nl9yZXNpZGVuY3lAcmM2LWZlbmNlIC0tLSBQQVNTIOKAkyBMb2cg4oCiDQo+ID4gaWd0QGk5MTVf
cG1fcmM2X3Jlc2lkZW5jeUByYzYtaWRsZSAtLS0gUEFTUyAtIExvZyDigKINCj4gPiBpZ3RAcGVy
ZkByYzYtZGlzYWJsZSAtLS0gUEFTUyAtIExvZyDigKIgaWd0QHBlcmZfcG11QHJjNiAtLS0gUEFT
UyAtIExvZw0KPiA+IOKAoiBpZ3RAcGVyZl9wbXVAcmM2LXJ1bnRpbWUtcG0gLS0tIFBBU1MgLSBM
b2cg4oCiDQo+ID4gaWd0QHBlcmZfcG11QHJjNi1ydW50aW1lLXBtLWxvbmcgLS0tIFBBU1Mg4oCT
IExvZw0KPiA+DQo+ID4NCj4gPiBUaGFua3MNCj4gPiBIYXJpb20gUGFuZGV5DQo+ID4NCj4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjAs
IDIwMjAgMTI6MDQgQU0NCj4gPiA+IFRvOiBLLCBTcmluaXZhc1ggPHNyaW5pdmFzeC5rQGludGVs
LmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPiA+IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+
ID4gQ2M6IFBhbmRleSwgSGFyaW9tIDxoYXJpb20ucGFuZGV5QGludGVsLmNvbT47IEF1c211cywg
SmFtZXMNCj4gPiA+IDxqYW1lcy5hdXNtdXNAaW50ZWwuY29tPjsgTmlrdWxhLCBKYW5pIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+Ow0KPiA+ID4gaW50ZWwtZ2Z4QCA8bGlzdHMuZnJlZWRlc2t0b3Au
b3JnIGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Ow0KPiA+ID4gU291emEsIEpvc2Ug
PGpvc2Uuc291emFAaW50ZWwuY29tPjsgZHJpLWRldmVsQA0KPiA+ID4gPGxpc3RzLmZyZWVkZXNr
dG9wLm9yZyBkcmktIGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47DQo+ID4gPiBTdXJlbmRy
YWt1bWFyIFVwYWRoeWF5LCBUZWphc2t1bWFyWA0KPiA+ID4gPHRlamFza3VtYXJ4LnN1cmVuZHJh
a3VtYXIudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhd
IFtQQVRDSF0gZHJtL2k5MTUvZWhsOiBSZW1vdmUNCj4gPiA+IHJlcXVpcmVfZm9yY2VfcHJvYmUg
cHJvdGVjdGlvbg0KPiA+ID4NCj4gPiA+IFF1b3RpbmcgUm9kcmlnbyBWaXZpICgyMDIwLTEwLTE5
IDE5OjI5OjM2KQ0KPiA+ID4gPg0KPiA+ID4gPiBJIGp1c3QgY2hlY2tlZCB0aGUgQ0kgcGljdHVy
ZSBhbmQgaXQgbG9va3MgbXVjaCBiZXR0ZXIgaW5kZWVkLg0KPiA+ID4gPg0KPiA+ID4gPiBPbmx5
IGJhZCBjYXNlIGJlaW5nIHRoZSBndF9wbSwgd2hpY2ggaXMgYWxzbyBmYWlsaW5nIG9uIG90aGVy
IHBsYXRmb3Jtcy4NCj4gPiA+DQo+ID4gPiBOb3QgbmVhcmx5IGluIHRoZSBzYW1lIG1hbm5lci4g
Q0kgaXMgaW5kaWNhdGluZyB0aGF0IHRoZXJlIGlzIG5vIFJDNg0KPiA+ID4gZW50cnkgYW5kIG5v
IHBvd2VyIHNhdmluZyBhdCBhbGw7IG5laXRoZXIgaW4gdGhlIHNlbGZ0ZXN0cyBub3IgdmlzaWJs
ZSBmcm9tDQo+IHVzZXJzcGFjZS4NCj4gPiA+IFRoYXQgaXMgYSBjcml0aWNhbCBiYXR0ZXJ5IGVh
dGluZyBidWcuDQo+ID4gPg0KPiA+ID4gSWYgdGhlcmUncyBhIHBhdGNoIHRvIGZpeCBpdCBmb3Ig
ZWhsIGFuZCBqc2wsIHNlbmQgaXQgdG8gQ0kgZm9yIHByb3ZpbmcuDQo+ID4gPiAtQ2hyaXMNCj4g
PiA8TWFpbCBBdHRhY2htZW50LmVtbD4NCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
