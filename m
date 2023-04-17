Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697046E50DD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 21:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F33F10E177;
	Mon, 17 Apr 2023 19:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09C410E18D;
 Mon, 17 Apr 2023 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681759661; x=1713295661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oxX/Eo5zmtuaj4X5UJzELAUEp8LSgA2rqjCsFW4WM8s=;
 b=dzOVJfBVYH46aSVYRIjkiOBFmoviETwfOdlBk9uswbcs8a2gVMJ/pQPc
 /q3NdTbykKwAiEGJgHMMz+LpQNAh++O93TlIzdUCovkd5aA4Xl5K4Lwc9
 Eh82v/NkODcfe1oMneOk867CREzTKO0OolkjypfElKEhuVuEuv1F801Bw
 cTPlI75QqynHW2zX2SgrZ1jfoOsJHsHqWT9w8Ocs9MB30AFL4Bs4SkBML
 hXvFck0JRvHM5nBRkYuKDt2zqNJp5IumSs7ucmshJv7Tk8BTT5RPNwvi6
 LFFhcY829qpY+RIZ4UWlwiWtzNPZqaGqqRWKTD5+ZYDSOT73/n/jYnXSb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407882876"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="407882876"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 12:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="814936286"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="814936286"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 17 Apr 2023 12:27:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 12:27:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 12:27:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 12:27:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEpKoiCFE51FAv//8e2ntCywS4q0sbv7XZ2xpslwtg5J98+GwIyWG0+xPkxpW9/e+rr6uYnYEdT9qPdqaURKPIVfsO4mvHpBsmh0awuZlFb92MgyY2I0BbyL4ZqKPw5LZrKfHPngox0DK1Ek0YmHoXG9PYsMEiurMeT5MENT5VZ34ZSYgul5Nt6gbqz1mTwEO5HHJtAhWrCuJVJnqEhCvTCl0yyoeO8ycUIQCv4Xro6E35vJj62n/EC0MFPgph1kbTGOw2bjwKcx/a/aamO5MTs6zRe7CESJMfMO0isVZsZ+wLu7PCJH2z8Ds+BIMCSh+pXVYbIckKrZzIWATOgDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxX/Eo5zmtuaj4X5UJzELAUEp8LSgA2rqjCsFW4WM8s=;
 b=YzGle5AakZFuehXzypJDZxzxEHKxHv0OQmQOMcYSppQaeorIZS1v/Ky+3xZhohQwKNPH6xk57/3lZBXNq5r7iMkTMdIEEbEchF+DVUILVPlUsetdDAaMGIoUqGQMaWibNi39vBTMusDiWrawxkYqoiCh9Fo47O+GNrEIUdXjpS5+6j4MgGCxC/LoA320LyKIfiN8tG0BxpZHypaQhwHDbPgrYxDYbDkNfL6HGk0ZXdxnHmceu97f32WFY2G6ljIvolNJGdWHjtio4BJ3K72TqLwsd5f5TK8LrgwcSVlSpEXppIsVav1fX9cX1FlzBEw8rVrWag+6xt4M4Kx6eVw4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 19:27:38 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 19:27:38 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v7 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZaK929cHyRqCE4UisbxWNBqH72a8kzl+AgAsTJICAAA8fAIAAA04A
Date: Mon, 17 Apr 2023 19:27:38 +0000
Message-ID: <68580b29d04b5f828f17549d92d1bd525e3218cf.camel@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-6-alan.previn.teres.alexis@intel.com>
 <fc68c7f6-4306-b208-7b4a-d04b83969311@intel.com>
 <9bb67b2ed9ae681388c0f39dba29532083b323ba.camel@intel.com>
 <55584390-8086-df81-5649-76e45039e306@intel.com>
In-Reply-To: <55584390-8086-df81-5649-76e45039e306@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB6519:EE_
x-ms-office365-filtering-correlation-id: 92e4398c-8a71-479a-1082-08db3f79cdde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RkZHE05d1ZDZhxWBJ3Kp78Q0WwAtV9g6hB0EiRxXnRVcuKw7KsTUuq86EnwqmZBljn/NgSGLXT4M2FUl6wCuECN7k1qSwI9V9wsHRl+F3WL1HayNUZP7FFd6oKnYeAS4yujRBHleCEwKJhB7WRWXBoGo6eN62Brli7mB43kjb20nD4h/3iIwH4/8KmdUaGsME7rsYJdA5zXCMewS3It1KiKZDbtBFkl0yVZidGlQTDCbmxoVl2GFEYR9VfyiQ4ihQatVjJ0u4ENodK4PSs4yig3qFuSZTpGMPnjhX5cf3mGsm7Jol0YbgCVsfqzWXt9PDJPmTrmTVZa9Z7qR1DkOCKqzZQMUk1AvwoF8AfkcbyeyMZhKs31MVdm3FiM5p5gemlimjHg4FQsKzJOoqU7o5RU5D86jxiozSXrp7A6TK/oq0j6zGJ74wdGIn5kUk5EYyg8wlgqv/UBceF7bnSdQj06fPZBHmEgMIRlpDd9Wc7S2LTjU6maQoODDaJ8Yul2RJhs93FDX2xod0t7J4N1+QPPOzKoedAoasBWLi/f/GDCVddIS/YmQPpXqm4W9rOtZN+6LMdagQ8nm02dP1ESc7MpAOU37xcfrq00f9cJHIEjBlPodbAEW9vjsaGFPuu7A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(122000001)(2906002)(82960400001)(38070700005)(107886003)(478600001)(71200400001)(6486002)(2616005)(38100700002)(83380400001)(26005)(53546011)(6506007)(6512007)(86362001)(186003)(36756003)(41300700001)(316002)(5660300002)(8676002)(8936002)(54906003)(110136005)(4326008)(66556008)(66446008)(64756008)(66476007)(66946007)(91956017)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVdhZkJwUC9NSlNUUHdUVVVhVUFraFFJWUsrbUV6OFZ2MVpXbkw1dE1TTmFv?=
 =?utf-8?B?NG1samhBZ2lQWTcrdG81R1lRY2p3LzJtNm4wSmFhSTZCcXd1NXJTYzM0YlFj?=
 =?utf-8?B?VnJRRGtEZkoxYXZqTXk5WTBtM2pvMmdtYTRwNmNhZWFidlJsc3BLcUt6MGN4?=
 =?utf-8?B?N3YvanVTdGpTck1qalUyQTVEdDhUTGlrTGlYbVNaaVE2V3gxaG1Fd0o0ZXBG?=
 =?utf-8?B?WTNVN2I2L1RIeDNGOEtZTmVBbjF1czYxZ1I4SUdxTitJRW5jMTd2OTJxbTN2?=
 =?utf-8?B?Y3VzK1U2SW5mazVhQlJlYy82ckN1ci8zNEU1UWVHOEZrVHFsTVV3TXdFYXZY?=
 =?utf-8?B?L2xLbE1hL1UwSWxpL2g4V1VYZEpMYTUzOFBtdnpVR1JMcTRSOEd2RU55VVB0?=
 =?utf-8?B?VnhTajlWbnlFWm4yTEQxZ05uSlJ1YytGVDJtRjBYVUVDTHZYR0RkTVBVa3hR?=
 =?utf-8?B?ZUMrZ2kvQjFSYVhPZTNxVFlLWHdHeVh2WlM3YjM2bTRIbEVsQldFMW9ScWlI?=
 =?utf-8?B?T0lmM1ZsV1BNUTY0ckgrRjd3cUZlWHlhdGlyQklNMmNDUTcxV3ptVDloZ2w5?=
 =?utf-8?B?OEhobWtZbkFmK0RWTlpqRlRKcVpHN0NYblRsdmRUenRwWktSUzFMOFJJU0tG?=
 =?utf-8?B?MlNoenloVE5Ka3ByMGRiMWRNQlNOYkloNFVmT0hVdnA5UXMwSkhVQXJGTzgy?=
 =?utf-8?B?RWE3K1Z0WnI2K1hIU2cxUEtMRmVjeHBPUnlkV0tmbjN0WEEwTjVnQms4TzlN?=
 =?utf-8?B?ckRUYllqOGtOTExQVk5lMWxRWjhjdmxIbnBNcUxrRTQvck5KYTBLaTJuNFhW?=
 =?utf-8?B?WFdBdG1XSlMyaGFvMStNakFoT2c0VkM4UDMwSzhqMG96SVZ3VWh3YjN0TFc3?=
 =?utf-8?B?ZzNUbFpGclRMS2ZEMFMwSUMzOXk5ZjJGaWtiVWRIaUF0K3Z4L1pLUFZZNTVE?=
 =?utf-8?B?cGNtVFkxaTc4eEhvanF3OUNtalh1WUp0dEVUdmlRM1BVNkJGKy9MMmpVU0ti?=
 =?utf-8?B?YjBwTUxiQ3gxUHRIeUc5aHRVTmR4aWREZ0kyVUdVeWFBbFB3bE1INndsL1NF?=
 =?utf-8?B?bTJsekRoeXJDNXkyYjY5aEs3eEEzcjFmY3YvK0RWTXlaQ0hYaFZBcWF1bXRr?=
 =?utf-8?B?OHQ4ZXRPTU1VNFhob09JeERCa2VvcnpCVmszaDdOeXpwYTJ0V3M3Z2k4WU1s?=
 =?utf-8?B?RkNNZzlMTEdWR0krN3J5Qyt4SGJ0VEVGdEdVMWZBMmlvUkpEK1V5eUsvRTZZ?=
 =?utf-8?B?anpCUmgvajlqWHJrNTZHbktJSHdqZzZoQnV4cjhRMGsrZ2NGS2RrNnAwakdY?=
 =?utf-8?B?alFsQlFVQmE3UEpRL2gxTVFrLzVQajBlQWRrVk5od1Y4R2h2bEhFNmpKN28w?=
 =?utf-8?B?alV4aFBQZzR1eGxNcTFKbnY3MGtkcjB6bUtTZFQxdlA5MVBENWRlNzhqc1Rl?=
 =?utf-8?B?QjJ0eUFrVDBIQXNrSndQZ0l3WFAyUldnOE1jVXlJZUNlQUZjQTI1VDV4b3JG?=
 =?utf-8?B?a2FSNDBaVVpDRjZCeVVkam9yRFlWQzdWTVVpeFBVdE1qRmpHdXhZSG85Zi9B?=
 =?utf-8?B?TTBqcU5wc0pCZTNKZWJYcEsyNmFyUzBMQ0FwTk9Nc0MrUU1JODVySU83UXF2?=
 =?utf-8?B?a3JCN3JrL0ZFZkw4STExcEJEYk5HNlMxVHVRYXVxdi9WaVQ4QXJIQnE5a0VF?=
 =?utf-8?B?UUVCWmVYQ1Mwc1p4S1hQdGN2V2l3c0xHTWZobkZEQ28xZC9HdXpJaUl6LzNI?=
 =?utf-8?B?OWVsbkg4Tm1USlhaVFdBV1kwRkg1WGVKbGVrUFkzWGdjbzUwc2VEcTJsK3hU?=
 =?utf-8?B?WVJ6SHIzZTFVUko1SlEvUTcrSGE5N1BTaUI0ZjJadjFxL3h5SllEMHNUMGE5?=
 =?utf-8?B?U0hOcjRJNmxGVEFsRGxyYVhKNlluMjZmOGY2b2FiNlpqaktxTGs2SFA3eE9P?=
 =?utf-8?B?d1Zueit5dlV3bUhMN3o0aWZiakYvTUN2b0NOTFpLZkV0eUJ0akU3Rmp3WW9G?=
 =?utf-8?B?VGMzRHZxV2toWWhtazZNUkdqOWlQTy9ocUR5dFE4NTM3YmJDdHc5WGNYanlI?=
 =?utf-8?B?UmFuc0ZvREl3anZXOUEzYnRVUER1K0hVNEVwa2xaNUU1YWlPdm9XMlZ0UUYv?=
 =?utf-8?B?Q1BqblROcGg3NkcrdEdpVFRnanY0eWdTM1FQUVNnYkZLUjVZRmE3NkQ3ZXo4?=
 =?utf-8?Q?4r92WmsPadSDeYJK12XI/nc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94A4E28DDA0631449A8C8D2E82FD8685@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e4398c-8a71-479a-1082-08db3f79cdde
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 19:27:38.0312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s8E/1BgWI7l+h6Q7A/dmgOnIiuP1/SHLyePaMcIEFlfqGRydwE/A+Dt9/7BN9i1QEI69axTvIwBaCzdfM+g/3ol5dWOA0Y6MDXi0YWgLN6zJrZZWiJOcMn/GD4uqqsnu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
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

T24gTW9uLCAyMDIzLTA0LTE3IGF0IDEyOjE1IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gT24gNC8xNy8yMDIzIDExOjIxIEFNLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyMy0wNC0xMCBhdCAxMDoxNCAtMDcwMCwgQ2VyYW9s
byBTcHVyaW8sIERhbmllbGUgd3JvdGU6DQo+ID4gPiA+IEBAIC0zNTQsOCArMzY4LDE0IEBAIGlu
dCBpbnRlbF9weHBfc3RhcnQoc3RydWN0IGludGVsX3B4cCAqcHhwKQ0KPiA+ID4gPiAgICAJaWYg
KCFpbnRlbF9weHBfaXNfZW5hYmxlZChweHApKQ0KPiA+ID4gPiAgICAJCXJldHVybiAtRU5PREVW
Ow0KPiA+ID4gPiAgICANCj4gPiA+ID4gLQlpZiAod2FpdF9mb3IocHhwX2NvbXBvbmVudF9ib3Vu
ZChweHApLCAyNTApKQ0KPiA+ID4gPiAtCQlyZXR1cm4gLUVOWElPOw0KPiA+ID4gPiArCWlmIChI
QVNfRU5HSU5FKHB4cC0+Y3RybF9ndCwgR1NDMCkpIHsNCj4gPiA+ID4gKwkJLyogVXNlIGEgbGFy
Z2VyIDEgc2Vjb25kIHRpbWVvdXQgY29uc2lkZXJpbmcgYWxsIHRoZSBkZXBlbmRlbmNpZXMuICov
DQo+ID4gPiA+ICsJCWlmICh3YWl0X2ZvcihpbnRlbF9weHBfZ3NjY3NfaXNfcmVhZHlfZm9yX3Nl
c3Npb25zKHB4cCksIDEwMDApKQ0KPiA+ID4gPiArCQkJcmV0dXJuIC1FTlhJTzsNCj4gPiA+IFRo
aXMgbmVlZHMgYSBjb21tZW50IHRvIGV4cGxhaW4gdGhhdCB3ZSBleHBlY3QgdXNlcnNwYWNlIHRv
IHJldHJ5IGxhdGVyDQo+ID4gPiBpZiB3ZSByZXR1cm4gLUVOWElPIGFuZCB0aGVyZWZvcmUgdGhl
IHRpbWVvdXQgaXMgc21hbGxlciB0aGF0IHdoYXQgd291bGQNCj4gPiA+IGJlIHJlcXVpcmVkIHRv
IGd1YXJhbnRlZSB0aGF0IHRoZSBpbml0IGNhbiBjb21wbGV0ZS4gSXQgYWxzbyBuZWVkcyBhbg0K
PiA+ID4gYWNrIGZyb20gdGhlIHVzZXJzcGFjZSBkcml2ZXJzIGZvciB0aGlzIGJlaGF2aW9yLg0K
PiA+ID4gDQo+ID4gYWxhbjogSSBhZ3JlZSB3aXRoIGEgcmVxdWlyZW1lbnQgdG8gY29tbWVudCB0
aGlzIGRvd24uIEhvd2V2ZXIsIGkgYmVsaWV2ZSBpdHMgYmV0dGVyDQo+ID4gdG8gcHV0IHRoaXMg
aW50IHRoZSBVQVBJIGhlYWRlciBmaWxlIGNvbW1lbnQtZG9jdW1lbnRhdGlvbiBzaW5jZSBpdCBh
cHBsaWVzIHRvIGJvdGgNCj4gPiBjdXJyZW50IE1UTCBhcyB3ZWxsIGFzIHByZXZpb3VzIEFETCBj
YXNlcyAodGhpcyBpcyBub3QgbmV3IGJlaGF2aW9yIGJlaW5nIGludHJvZHVjZWQNCj4gPiBpbiBN
VEwgYnV0IGl0IGlzIGZpeGluZyBvZiB0aGUgc3BlYyBvZiBleGlzdGluZyBiZWhhdmlvcikuDQo+
ID4gVGhhdCBzYWlkLCB5b3VyIGZlZWRiYWNrIGlzIGFscmVhZHkgYmVpbmcgYWRkcmVzc2VkIGJ5
IHBhdGNoICM2IGJ1dCBpIHdpbGwgYW1tZW5kDQo+ID4gcGF0Y2ggIzYgdG8gYWRkIHRoZSBkZXRh
aWwgeW91IGhpZ2hsaWdodGVkIFdSVCB+InRpbWVvdXQgaXMgbm90IGxhcmdlciB0aGFuIHRoZSBj
b21wbGV0aW9uLWd1YXJhbnRlZS4uLiIuDQo+IA0KPiBDYW4geW91IG1vdmUgdGhhdCBjb21tZW50
IHVwZGF0ZSBmb3IgdGhlIGNvbnRleHQgZ2V0cGFyYW0gZnJvbSB0aGUgbmV4dCANCj4gcGF0Y2gg
dG8gdGhpcyBvbmU/IHRoYXQgd2F5IGl0J3MgYWxsIG5pY2VseSBzZWxmLWNvbnRhaW5lZCBpbiB0
aGlzIHBhdGNoLg0KYWxhbjogc291bmRzIGdvb2QgLSB3aWxsIGRvDQphbGFuOnNuaXANCg0KPiA+
ID4gPiANCj4gPiA+ID4gLSNkZWZpbmUgR1NDX1JFUExZX0xBVEVOQ1lfTVMgMjAwDQo+ID4gPiA+
ICsjZGVmaW5lIEdTQ19SRVBMWV9MQVRFTkNZX01TIDIxMA0KPiA+ID4gd2h5IG1vdmUgZnJvbSAy
MDAgdG8gMjEwPyBub3QgYSBwcm9ibGVtLCBJIGp1c3Qgd2FudCB0byB1bmRlcnN0YW5kIHdoeQ0K
PiA+ID4gdGhpcyBpcyByZXF1aXJlZC4NCj4gPiA+IA0KPiA+ID4gRGFuaWVsZQ0KPiA+IGFsYW46
IHNvIDIwMCBpcyBiYXNlZCBvbiB0aGUgZncgc3BlYyAtIGFuZCBmcm9tIHJlYWwgdGVzdGluZyBp
IG9ic2VydmVkIHRoZSBvY2Nhc2lvbmFsIGhpZ2hzIHRvdWNoaW5nIH4xODVtcy4NCj4gPiBIb3dl
dmVyLCB0aGUgc3BlYyBnaXZlcyB0aGlzIG51bWJlciBhcyB0aGUgZXhwZWN0ZWQgbWF4IHRpbWUg
dGhlIGZpcm13YXJlIGlzIGdvaW5nIHRvIHRha2UgdG8gcHJvY2VzcyB0aGUgcmVxdWVzdA0KPiA+
IGFuZCBwb3N0IGEgcmVwbHkuIFRoZXJlZm9yZSBpdCBkb2Vzbid0IGluY2x1ZGUgdGhlIGFkZGl0
aW9uYWwgb3ZlcmhlYWQgZm9yIHRoZSByZXF1ZXN0IGNyZWF0aW9uLCBlbWlzaW9uLA0KPiA+IHN1
Ym1pc3Npb24gdmlhIGd1YyBhbmQgdGhlIGNvbXBsZXRpb24gcGlwZWxpbmUgY29tcGxldGlvbiBp
bmRpY2F0aW9uLiBBbGwgb2YgdGhlc2UgY29udHJpYnV0ZSBhZGRpdGlvbmFsIGxheWVycw0KPiA+
IG9mIHBvc3NpYmxlIGRlbGF5LiBTaW5jZSBhcmItc2Vzc2lvbiBjcmVhdGlvbiBhbmQgaW52YWxp
ZGF0aW9uIGFyZSBub3QgY29tbW9uIGV2ZW50cywNCj4gPiBJIGJlbGlldmUgYSBzbGlnaHRseSB3
aWRlciBvdmVyaGVhZCBvZiAxMCBtaWxpc2VjIHdpbGwgbm90IGh1cnQuDQo+IA0KPiBBZ3JlZWQu
IENhbiB5b3UgYWRkIGEgY29tbWVudD8gc29tZXRoaW5nIGxpa2UgIk1heCBGVyByZXNwb25zZSB0
aW1lIGlzIA0KPiAyMDBtcywgdG8gd2hpY2ggd2UgYWRkIDEwbXMgdG8gYWNjb3VudCBmb3Igb3Zl
cmhlYWQiLg0KYWxhbjogd2lsbCBkbyBhbmQgdGhhbmtzIGZvciB0aGUgY29uZGl0aW9uYWwgcmIu
IHdpbGwgZml4IHRoZXNlIGFjY29yZGluZ2x5Lg0KDQo+IFdpdGggdGhvc2UgMiBuaXRzIGFkZHJl
c3NlZDoNCj4gDQo+IFJldmlld2VkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxl
LmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiANCj4gRGFuaWVsZQ0KDQo=
