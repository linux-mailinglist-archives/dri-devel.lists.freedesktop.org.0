Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3699663705
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AD610E10A;
	Tue, 10 Jan 2023 01:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483A110E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673315938; x=1704851938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zSybM59qqsNAjySqf1UbIoWYCfZfXyxdXdWhZ9h/kyE=;
 b=SFJ5YiWaB6oka4JxtEWlWY15aSqtpLnRZWmAHVBel+YbrrXF+6QSrAG0
 WGZR/bxuzf40oLkYK6cvPBvKuMskHCjf9ESYnfI+ElTz+XZOoZRlCZfV9
 UjtU7LORADbxJhU6Mr7geZzG73LG8CWM1pFGGo/PZiszuGHIgLO8PnN2E
 Qvd1cEl/TyRQpbCpsGOdFc797+0zyWsfindc9YiLYNP5c78dwb/zLak+f
 P4LEI0v/DGc396qE2WW22UjtdDNR3AVhTuj2d5HcQS9R/GXrLBGkDaTDs
 nbO7coDyQ3Zhmq5AwjaT58ywhKBoh1Kr5V6syuSn8HbNJPDr//wzGrgvz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="387485234"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="387485234"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 17:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="902203692"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="902203692"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2023 17:58:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 17:58:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 17:58:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 17:58:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFj4z35dgjsEor90nSBa1Au3nxNx5AgAavtWSeclAfTvJ30JBXSp6RxMOHectkr2CUNdE12HnnEk0/NVC7NrtMT95Ah8pSPOCfbcoObwnLJvdXFT+xZR2G0LeDfm0ehtpt7gmY9aQm8hrTjsAzQNckRghVS+GTR/GijbXspmRdkXoBHfejFE9DW6lJW3ZUhyZV0+xvXZcNf6yoikOLM6BkPPQKidgYNheWyLia0Ye3WGnjLzpRta0LEAlmTNmRbpAoys5qe6xhNyzaZ76eGCuqiRfj3c7JbuWakE89bqct/gnI7R5BjgRDrrUBdbb9S/J7SG7YgOIkKeQ9JfntWp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSybM59qqsNAjySqf1UbIoWYCfZfXyxdXdWhZ9h/kyE=;
 b=OjzSuDkmIqMy+oX64sOBV8u2l72RciCk4Z6hB+HwaPGHSz+z9yOtUhe9/ENClYy6y+YOorJVt6NJKUxE/UxaICYDbvyhv9ae1D2Gyk4rNzYfMUg8nSZWbwdP8XJyZuV3RHNYpwuChyx0kifu277Td6FMrx6eckeq4RgZG5vdzjB2QTH/idZFsXxtsccpF0cvrjl2DXdX2sxuAAi/cXX/tOUbg2Zzl7Pbmakl+ee6XMKmVVtgV5rnIK3CJYo4hEXbB3PKu8Ff1v0LNEgONBOcMM6gi3wrAWhiW+UhofGwKLDJFfU2PpfkMknLXkhB35GHjZvIfErA7sXd67jyUaRueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:443::14)
 by CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 01:58:52 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::6385:771:1bc4:2f6%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 01:58:52 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Thread-Topic: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Thread-Index: AQHY+vBKyFxofzKh1EOK+i6bB8w65a6RY7QAgAAKyICABYUoQA==
Date: Tue, 10 Jan 2023 01:58:52 +0000
Message-ID: <IA0PR11MB718594D9F06FC52B5CC07279F8FF9@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
 <Y7frUw39xU70WQkD@phenom.ffwll.local>
In-Reply-To: <Y7frUw39xU70WQkD@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CO1PR11MB5187:EE_
x-ms-office365-filtering-correlation-id: 00853cff-2b69-438a-fe2e-08daf2ae3939
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sjOFa+aZCvzYEXOKcTU9SSMtPB6bON/PQyDcWSejuqPmFKFFEewGTekGgp8S+VuBnPWfMDFR7GMeg6Yhn6fP8Ti8JCPK9Td37sYLt0WVqq8pHCnrA/H7E50iTwdrJFofzzPlNSvrEO4Fl0gegSo9JmImAYRdPEdjBhnOpG8MIrPj0az0hAW5wtMx0o6qCEouYj119gQLSJYDxhocGMUSttu8PtDmzAkNWhWzIGeB+g91QO2APiVUKPQWwbIlTxA/YkPLQM+6UNnLy7QfEQmfULLhBnCh3JNzZ3z79zsfm5T9cHUt3e16CMkQcIJjuuA6lQ+VjH/xrj7My0QLl5gO9nxmbTZTbtHeaODerp9ZkMKGB7ryI5WkNRUDsdRbQ1a7RHu3v2s9vFI4M7POhhKb+vnhjxzFXshSGiD6McAtXhFLIoIqcWFy25cNZ839ImgSTeEgF7m7QCYnojc9H1hTmKuvlev5/YtyBe1VgIlLjrZRT1M3ChgUgL/uB+CU6VQHZXioj5gqeFGLH4U68QGxIDF1KAmGKdyJRvkagnqET5sgIugzrSM8IibTZx4mQDznU6DXNaKhm68lOQ1JfdDQ2swXcQCcSF9mFpVVxQgRhBdbz79CJrGPzUHtbWPguYLUOzz5B7YzeLSj62gwu6iBMPMnyhl4Mm8T5gVFVPnx+WbGX8q8lIMStSSpB06wxXSYAC1gJ/wmXPgQ13XzetxPYWCAqoSpcr/YB7Z9jkFFKqg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199015)(66946007)(52536014)(41300700001)(2906002)(8936002)(5660300002)(8676002)(66476007)(66446008)(76116006)(66556008)(64756008)(316002)(7696005)(110136005)(71200400001)(54906003)(966005)(33656002)(478600001)(6506007)(186003)(4326008)(26005)(55016003)(9686003)(83380400001)(86362001)(38100700002)(82960400001)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cloyTGFqRWhzakdlK2pzSTNKMThqbERaajJmTGUrNFpuQnd5dXJmYW93dmtG?=
 =?utf-8?B?bjRiNW1ZUGp5K3gxcUloV096d25VWFVtMzYrKzdDaU5DOVgvNDNyWGEzZ0lT?=
 =?utf-8?B?RENmWUJ0bytMMHJ6ZmRFMnNmS0luQ3BOWjNsTWVZd3V5Mnk2NlNzT3VJVFJL?=
 =?utf-8?B?OFhFdkdJdm9POEN3MlQwdU44T0NoRE42SHVNRFE3MHp3RmZ6cnJsUThRVnI3?=
 =?utf-8?B?VGZvbzVUVzc1M0lidXcxWTUxQjN1dTAxZ3RjcnkwUEw0NStwNnl6VjZUcjRq?=
 =?utf-8?B?R0xDVkdnYkpXdlJ0WFVZMmM3REZtZHZsREZ4L3ZmU3ZrZ01VUlZ1WkhsNURp?=
 =?utf-8?B?N2hZdWNzOWpCSitOTHJMbzdSRWtQSEVORldiN3RLc1FseVdLTEtIWWIzcG9O?=
 =?utf-8?B?RVVzMG02ZFAyeGtzM3FtR21sQTQ4cEpWOFJTZEFKT3hkUE5IdzVUbHNWRFVZ?=
 =?utf-8?B?ekJkYlVjdFd1dFF1MGV3STYrc3JSWDRodjV4MW5ZTkZkaWZHeTg2M1NJUi9H?=
 =?utf-8?B?NllCWWpVNTcyMlZoOHJ5clA5YjNLVlFOQjgyY2wwa1gyQndnZm5scTQ1ZnpR?=
 =?utf-8?B?bHdkRVBMVXo2a0RRY1QyRzNjejkxMWJlTVFhalhuQloxaGFGNXJkbzVGdlBy?=
 =?utf-8?B?TU8vQWhmdCt1ZTZGVFJTTm8vQnJWOUNiOC90K3JqdW9zb0pqME1saktkMjZ5?=
 =?utf-8?B?K2hEcUxxUmZkeFJrT2RkOVhOTUoxMXVqNG9NNVU4c0RxbzA5NU9GdEpuT3Vo?=
 =?utf-8?B?elgxdWdKaExtcG5UejBkbUVZeHBTSWNXK1F2b0tKdElNSVB2cFVNSnFsQnh4?=
 =?utf-8?B?QlRLaG00T3B3d0lyR0F2ZlEraFZCV1JjL3Jsb29wYjVDZy9ka2ZqUGxKdmxR?=
 =?utf-8?B?ZGJJNFNjbkNWTXFES200NWxtSlY2Qnp4RUZOeWJIS1hyY3ZYQ2dqRzlHZW9L?=
 =?utf-8?B?NG84bitudi9ScWs4UjNPanNDSHlPOUtOdDBIVXJKK04rSmNhRXhla0RPVGM3?=
 =?utf-8?B?T3RpaEh3WGt4Z3Zub3lGOTlPak9paHkxRm15MWcxbUQvSkhVdmlCRWdUaEhm?=
 =?utf-8?B?b0JDWGE1SzdQTUMwbGR2UC92eGFhRVVtQ2xJMk1Yc0t5MXNWdHNtSnh6dmRG?=
 =?utf-8?B?UW5LTkN4MnV6OUU0Q3NWRGFoSkdmYmh0cTU3RzMwaTFtbjZCOXR5LzhkbnNp?=
 =?utf-8?B?MFY3Y0MrTXJjRE1QK3h4c1p3V0R0SEphUlExUEpjTGNYZ3NGYmVuTXhkUTd1?=
 =?utf-8?B?SktkRTlJbnJ6YW1RWEhEUUJzamVKME9BekEwN2lnazZBN2pkSlEyR3ViQkdG?=
 =?utf-8?B?SnI2UkpOUTU2TTJvL1c0b21tdnR5OEhrSXJMRWVuSkVYZTB5b3RCK2o0V1dw?=
 =?utf-8?B?YzZzcSs3MVYzaHdxc0pYUzdqMVNmQk1rbE10aXBodTYzU0ZNb0NIaHZtRjdJ?=
 =?utf-8?B?Y0ZFYnlZcjFnb3Ezc3NoQnZVaVovTk5Pdis4ZlFSWDB5YWs3YURyWUp0Tm5S?=
 =?utf-8?B?TWF4NVY0dm1memtlQkdkUHlTbmlKRENoOXJHb0ZrNUxIbjA3TXZBaEl3Ykc3?=
 =?utf-8?B?MGlGQ3ZkdlZvdmpHcndBSDBsTXFqUk44c1Qzb0ZpaFl6ZkV5VEQ5NE5lSXd5?=
 =?utf-8?B?Q0hWTWRaQ1ZQODdyZ2VMUDJjWTR1MTA3OE5KVFFpaHl5YmhLVDFldTAwejUz?=
 =?utf-8?B?WHNZMjBhVFpLNS94UVBncENxZjlZZ3haZVdHcldkcjh1LzlzSUNXajNnNkFq?=
 =?utf-8?B?SlA4Rit5SnlkR0pkR085eWlxWHFSZzBNTmVDbkNUZmNZRFpsOU1iNHM2VHdF?=
 =?utf-8?B?aEIxR25ObzZqOHk1THZqODQwMDFzUFEyYUVqdGFvTVBvUWJUcVEvamlyMHJW?=
 =?utf-8?B?YTYwQjJyMXhRSWprV0M1WVhXMnFFSFlzRWgwaFFLM0l2Rmh1bFJKTGU4NWtZ?=
 =?utf-8?B?TXViNEV6eHZ4MExXeFM5WS9BT2tNRlNFMUY1TmpmNVBKT1FjOGRsN0x5cEp6?=
 =?utf-8?B?bmJKcVpXc2t4SXpxNzl1QkVBdmUvQjZWVG9TMVdoL1A4QitVWVZKeXZFVWVa?=
 =?utf-8?B?eklvT2FBazB5MlRPM1NSRjV6bnc3Sy91TVh3WmhSWlhIc3NkNUMyU3I4dW5K?=
 =?utf-8?B?SkNHSjRidFltSThVeXJ0b1BRbXZ2Smo3WUlwd0t0V0JhN0xKR1FCZnFHOXNT?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00853cff-2b69-438a-fe2e-08daf2ae3939
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 01:58:52.4210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6nSAPVjUDsBTIlhF7c2ExxW+M5Q3vKqXDc/cw6vya3YQJjaFHUvGnofJ5luGbYxOg1n1TiKV4Ppn6f7oZTg95diwQucF2K86GqhyTEiHPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLA0KDQo+IA0KPiBPbiBGcmksIEphbiAwNiwgMjAyMyBhdCAwOTo1Njo0MEFNICsw
MTAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOg0KPiA+IE9uIFRodSwgTm92IDE3LCAyMDIyIGF0IDA1
OjMwOjU0UE0gLTA4MDAsIFZpdmVrIEthc2lyZWRkeSB3cm90ZToNCj4gPiA+IFNldHRpbmcgdGhp
cyBwcm9wZXJ0eSB3aWxsIGFsbG93IHRoZSB1c2Vyc3BhY2UgdG8gbG9vayBmb3IgbmV3IG1vZGVz
IG9yDQo+ID4gPiBwb3NpdGlvbiBpbmZvIHdoZW4gYSBob3RwbHVnIGV2ZW50IG9jY3Vycy4NCj4g
Pg0KPiA+IFRoaXMgd29ya3MganVzdCBmaW5lIGZvciBtb2RlcyB0b2RheS4NCj4gPg0KPiA+IEkg
YXNzdW1lIHRoaXMgaXMgdGhpcyBuZWVkIHRvIGhhdmUgdXNlcnNwYWNlIGFsc28gY2hlY2sgZm9y
IHBvc2l0aW9uDQo+ID4gaW5mbyB1cGRhdGVzIGFkZGVkIGJ5IHBhdGNoICMxKT8NCj4gDQo+IFdo
YXQgZG9lcyB0aGlzIHRoaW5nIGV2ZW4gZG8/IFF1aWNrIGdyZXAgc2F5cyBxeGwgYW5kIHZtd2dm
eCBhbHNvIHVzZQ0KPiB0aGlzLCBidXQgaXQncyBub3QgZG9jdW1lbnRlZCBhbnl3aGVyZSwgYW5k
IGl0J3MgYWxzbyBub3QgZG9uZSB3aXRoIGFueQ0KPiBwaWVjZSBvZiBjb21tb24gY29kZS4gV2hp
Y2ggYWxsIGxvb2tzIHJlYWxseSBmaXNoeS4NCltLYXNpcmVkZHksIFZpdmVrXSBBRkFJVSwgdGhp
cyBwcm9wZXJ0eSBhcHBlYXJzIHRvIGJlIHVzZWZ1bCBvbmx5IGZvciB2aXJ0dWFsDQpHUFUgZHJp
dmVycyB0byBzaGFyZSB0aGUgSG9zdCBvdXRwdXQocykgbGF5b3V0IHdpdGggdGhlIEd1ZXN0IGNv
bXBvc2l0b3IuIFRoZQ0Kc3VnZ2VzdGVkX3gveSBwcm9wZXJ0aWVzIGFyZSBzcGVjaWZpY2FsbHkg
dXNlZCBmb3IgdGhpcyBwdXJwb3NlIGJ1dCBpdCBsb29rcyBsaWtlDQp0aGUgaG90cGx1Z19tb2Rl
X3VwZGF0ZSBwcm9wZXJ0eSBhbHNvIG5lZWRzIHRvIGJlIHNldCBpbiBvcmRlciB0byBoYXZlIEd1
ZXN0DQpjb21wb3NpdG9ycyAoTXV0dGVyIGNhcmVzIGJ1dCBXZXN0b24gZG9lcyBub3QpIGxvb2sg
YXQgc3VnZ2VzdGVkX3gveS4NCg0KPiANCj4gSSB0aGluayB3ZSBuZWVkIHRvIGRvIGEgYml0IG9m
IHJlZmFjdG9yaW5nL2RvY3VtZW50aW5nIGhlcmUgZmlyc3QuDQpbS2FzaXJlZGR5LCBWaXZla10g
SnVzdCBmb3IgcmVmZXJlbmNlLCBoZXJlIGlzIERhdmUncyBjb21taXQgdGhhdCBhZGRlZCB0aGlz
DQpwcm9wZXJ0eSBmb3IgcXhsOg0KY29tbWl0IDQ2OTViMDM5NzBkZjM3OGRjYjkzZmUzZTcxNTgz
ODFmMWU5ODBmYTINCkF1dGhvcjogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCkRh
dGU6ICAgRnJpIE9jdCAxMSAxMTowNTowMCAyMDEzICsxMDAwDQoNCiAgICBxeGw6IGFkZCBhIGNv
bm5lY3RvciBwcm9wZXJ0eSB0byBkZW5vdGUgaG90cGx1ZyBzaG91bGQgcmVzY2FuIG1vZGVzLg0K
DQogICAgU28gR05PTUUgdXNlcnNwYWNlIGhhcyBhbiBpc3N1ZSB3aXRoIHdoZW4gaXQgcmVzY2Fu
cyBmb3IgbW9kZXMgb24gaG90cGx1Zw0KICAgIGV2ZW50cywgaWYgdGhlIG1vbml0b3IgaGFzIG5v
IEVESUQgaXQgYXNzdW1lcyB0aGF0IG5vdGhpbmcgaGFzIGNoYW5nZWQgb24NCiAgICBFRElEIGFz
IHdpdGggcmVhbCBodyB3ZSdkIG5ldmVyIGhhdmUgbmV3IG1vZGVzIHdpdGhvdXQgYSBuZXcgRURJ
RCwgYW5kIHRoZXkNCiAgICBraW5kIG9mZiByZWx5IG9uIHRoZSBiZWhhdmlvdXIgbm93LCBob3dl
dmVyIHdpdGggdmlydHVhbCBHUFVzIHdlIHdvdWxkDQogICAgbGlrZSB0byByZXNjYW4gdGhlIG1v
ZGVzIGFuZCBnZXQgYSBuZXcgcHJlZmVycmVkIG1vZGUgb24gaG90cGx1ZyBldmVudHMNCiAgICB0
byBoYW5kbGUgZHluYW1pYyBndWVzdCByZXNpemluZyAod2hlcmUgeW91IHJlc2l6ZSB0aGUgaG9z
dCB3aW5kb3cgYW5kIHRoZQ0KICAgIGd1ZXN0IHJlc2l6ZXMgd2l0aCBpdCkuDQoNCiAgICBUaGlz
IGlzIGEgc2ltcGxlIHByb3BlcnR5IHdlIGNhbiBtYWtlIHVzZXJzcGFjZSB3YXRjaCBmb3IgdG8g
dHJpZ2dlciBuZXcNCiAgICBiZWhhdmlvdXIgYmFzZWQgb24gaXQsIGFuZCBjYW4gYmUgdXNlZCB0
byByZXBsYWNlZCBFRElEIGhhY2tzIGluIHZpcnR1YWwNCiAgICBkcml2ZXJzLg0KDQpBcmUgeW91
IHN1Z2dlc3RpbmcgdGhhdCB0aGlzIHByb3BlcnR5IG5lZWRzIHRvIGJlIHBhcnQgb2YgZHJtX21v
ZGVfY29uZmlnDQpqdXN0IGxpa2Ugc3VnZ2VzdGVkX3gveSBwcm9wZXJ0aWVzPw0KDQo+IA0KPiBB
bHNvIGluIHByaW5jaXBsZSwgdXNlcnNwYWNlIG5lZWRzIHRvIGxvb2sgYXQgZXZlcnl0aGluZyBp
biB0aGUgY29ubmVjdG9yDQo+IGFnYWluIHdoZW4gaXQgZ2V0cyBhIGhvdHBsdWcgZXZlbnQuIFdl
IGRvIGhhdmUgaG90cGx1ZyBldmVudHMgZm9yIHNwZWNpZmljDQo+IHByb3BlcnRpZXMgbm93YWRh
eXMsIGJ1dCB0aG9zZSBhcmUgZmFpcmx5IG5ldy4NCltLYXNpcmVkZHksIFZpdmVrXSBGcm9tIHdo
YXQgSSB1bmRlcnN0YW5kLCBNdXR0ZXIgZG9lcyBwcm9iZSBhbGwgdGhlDQpjb25uZWN0b3IgcHJv
cGVydGllcyBkdXJpbmcgaG90cGx1ZyBidXQgaXQgc3RpbGwgbmVlZHMgdGhpcyBwcm9wZXJ0eSB0
byBiZSBzZXQgaW4NCm9yZGVyIHRvIGNvbnNpZGVyIHN1Z2dlc3RlZF94L3kgdmFsdWVzLiBBbmQs
IGl0IGFwcGVhcnMsIHNvbWUgY3VzdG9tZXJzIGFuZA0KdXNlcnMgaGF2ZSByZWxpZWQgb24gdGhp
cyBiZWhhdmlvciBmcm9tIHdoZW4gdGhlc2UgcHJvcGVydGllcyB3ZXJlIGZpcnN0DQppbnRyb2R1
Y2VkIGZvciB2aXJ0dWFsIEdQVSBkcml2ZXJzLg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IC1EYW5p
ZWwNCj4gLS0NCj4gRGFuaWVsIFZldHRlcg0KPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24NCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gNCg==
