Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F186B640E5D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 20:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0444B10E0D8;
	Fri,  2 Dec 2022 19:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB6C10E0D8;
 Fri,  2 Dec 2022 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670008929; x=1701544929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fQRBF8siaj/ndojfe6BOmBTbRf2bFA2HcZIRecDHtYI=;
 b=ZAi5sv1/ptjtezLDKcSZ+pmW5CxWCJ1sJNsgJC/qy1LSkV1r5LkJF92T
 dyk0H5h9M0X3UqM2XU3JYxAV4BFKBBTC+rl1a5YNeYyvJEibqDu+qv+Bl
 tpXeZCYgz+X7GCplgGYNdhWv/oX2vQU+wj9re/r8hZ2uA5GqvdxReks/+
 yfioQtQvxNWdKXrgdMuFfUXzfzzEJniUKYAPWFhVnyyePKgjNVKYGHhpO
 TX15UyJytjWoki9J/N7Wl9iwQWZXkwVCfxdko+uDzln0nR3OtWQ4pZz7a
 9k9gi0fIv57gV0GMT1II+X2FWGnR5zky2yaVLxnOBmy4iMfImyouW4uH9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="316053431"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="316053431"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 11:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="647279970"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="647279970"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 02 Dec 2022 11:22:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 11:22:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 11:22:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 11:22:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 11:22:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uf/L/xhzfRo8/uGJmlX9w2iYLJygC8An24AzTwaPaBZ36zTmg5HVftrtztWYNltVtFMlk3kJ8sK6DO6uLXfodamHtmrtvX9jwVv3rCEdEDJ0LGfIR8gA5v282Iv91JeymvVnKCxAYJt87CqvihfPDPm/8Je4lsyhBoM8SgiqPVPI6okQ2GrkNyUjdNqq/JbBULQSrJ5XHSI07vXoRkDtkQ8YCqnggiVeN37YkyTwozejRuFAFlL/KFGrnzrKxhDHUBmCh7O55MrHZ1swRLRyJarq9+rxxnMdVJtdvqCiZrUM01OVZn928PcbXR/raaNXWZEML0ek8i875FrybOmWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQRBF8siaj/ndojfe6BOmBTbRf2bFA2HcZIRecDHtYI=;
 b=E8fzy0wC+CPGMpBXMjpU4/ipm6KkqE1BEEd4Tsag/Doa8tZIYHw1brT8RntBJkhaMWu8JkIYXYs/92ya3Yas/vB/1eFXgyZiSRYYpPQ59j/jrolEyMKH61HUHd25iANCI/w25m9CTe3+K40GgwnxNrMCnHVNCBBQQZ/cs8mFz/PTvHdZUndMQJEirgm/OGXtwiEWJCx4tq5Sv817E1WI2LgzBnaf6RcWK1fgvOdC223xGvbd1GyLFVydj0PgIoo7rKGbS9lH4wCX3rwhx9kiKuXTpIAegvKO8DUr59TCh6mqZH6GfEKVQ9QBAhCDyuiegi5n7CYwXtHjbBOaZBKdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Fri, 2 Dec 2022 19:21:58 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 19:21:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 1/1] drm/i915/pxp: Promote pxp subsystem to
 top-level of i915
Thread-Topic: [Intel-gfx] [PATCH v7 1/1] drm/i915/pxp: Promote pxp subsystem
 to top-level of i915
Thread-Index: AQHZBesO2eT3g+iOU0Ce0scg+WKRba5ayM4AgAAyvQA=
Date: Fri, 2 Dec 2022 19:21:58 +0000
Message-ID: <0b6ea10288b9a350969b62393bda588ac5fa735f.camel@intel.com>
References: <20221202011407.4068371-1-alan.previn.teres.alexis@intel.com>
 <Y4omWlWLDvtPMVxG@intel.com>
In-Reply-To: <Y4omWlWLDvtPMVxG@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ1PR11MB6251:EE_
x-ms-office365-filtering-correlation-id: ba4e632d-4024-464f-2ff4-08dad49a7b53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y3YrfTpFCcw1gtJZhVAvPhRUNigeEfaqfx+KmEuyN/q7Ri+tDPfzT/nVnQS6KtZH7EaOamw3mE0R0c8LwQoLcEJz5WL8bjubYmWv5eZDOVtB5vo5VVCqD01DlFNLLzow5vWV5XmdQCLdiFlAAHKT7dyHOfla9Y03ezjYBP+X/nR2XvABQdND5Tp9KdtUqNM7imNYuP6I3tpHMHIboRcdACItMmUR0+w/+bQhyRx6yyB5UbgMU3iefM7nzvpX8wnObGb0ARAdgIsIsLNSDyjMXo7V3np9Q9hjQEM/Yyn9FTLkJxpnwmd1JTR9JHaVYo5oqcuKAlEq9uhZ4fI6uNxTvBLHX80QalP1rBk7/81oSLDVXOx1s5elyvzfWrGIAibfSwb96RM8ud5HfN8mYrpGxBZw2pSpiYdJMlzu2oU3hw/yAFCMhydTBwnEfjRfJ6BzWVq/nmg43x1VseY1FeE+2Jl2DzD7/adwId4gIGuWWUKN36fDSTravMk4PjOBN4O6dobHpnT4VpeNt4bSmRsfAXV15HCDRsQVTzc9qJqk4rVKsbCwuUN44CA/Rc+leeVlk/ENYFnQBOL0hupA+G2rAvhdpuperqGkqVSNF08+SUyQfM3ZX6VICd+oLixWYrthxnj8QKzh0nuef30o8QsTTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(6512007)(71200400001)(478600001)(38070700005)(26005)(6486002)(66446008)(91956017)(186003)(6636002)(316002)(86362001)(36756003)(37006003)(966005)(122000001)(8676002)(4326008)(54906003)(2616005)(66946007)(64756008)(82960400001)(8936002)(66476007)(76116006)(83380400001)(66556008)(2906002)(6506007)(41300700001)(5660300002)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFFPVEpTVnZOVDhrZk8yVWUyQmNoTVZHWjEwNW55clJ3N1Z1NlZpQ1RlYnJx?=
 =?utf-8?B?aUI0dGlIekZTdHR6Q1hVR29rVWpLYWVGQXIrbkk2NHNtOVprRjFOTmEwSUV6?=
 =?utf-8?B?citvT1owdkZJLzlYN1poT1poWnpiNWFJQ0NFayt4Z1dRRzJNMmdEUTdLMWpw?=
 =?utf-8?B?aS80dnFqbUVwZmE4YVFBa3o1MHZTOThyV0hkRS9LdWpsUE9YMTJMd3NWOTk4?=
 =?utf-8?B?dGxmVjFBNlEzOUJjZHBYc3h6dEJGZFkvUDdwd2RxZWlBNlplaGk3dXpCN3VR?=
 =?utf-8?B?YlpoRllEbUdxMnZSdFp5UDFtZXZ0dW0vSVpqeEIyaHRQbThzRjluaEVIc1Nj?=
 =?utf-8?B?YmJsK0xxRlNRNXI1SG5zQkYxayttcy94R3lGa1psL3RWVWdVSkpHZE1Jck5m?=
 =?utf-8?B?UFBlcFE3Rm1VY0VnUEJUdHN3akYvQnlpMlNNU1QzYVp5VEhFTXRaYSsvUlF6?=
 =?utf-8?B?YUQyVHVpTTEzRkxIcCtIdUZpd3hMNTBxVGJieUMwRGo1ZTd0cFp3QzczR1ZE?=
 =?utf-8?B?MFVEbmZ0MXVYdWZWT1JGc295bzI3bnh5WklaaWhsV0FQUUh1U0tWeDZEVUEv?=
 =?utf-8?B?VjV1ZjdqNy81c0lnQUdFbzI3QXRSUU5hU21lemt2MnZTRm9tdWVIMnZmN3lQ?=
 =?utf-8?B?MndzeVQ4Tyt5NlN6L2FwRFVkTklUQXdqbWltT01aeGc3VUN6ZmdsMnFxL1pP?=
 =?utf-8?B?UW9EaEdNS2t2NURjR1pmKzBxME9WMzZxak40OXlTYUNtbElUYnQwRXFNNWZ1?=
 =?utf-8?B?WUY4bTBUZlFLK1ZJY3AwYjFRa1ZmcTRJTXpkSmljZHFENVp4WlFicTFjYWFn?=
 =?utf-8?B?VDlpdmt3cVFrTUFhVi9BU2FvOXdKZS9MMzBBWFNaT293TER2RFFxcUt0ZkRS?=
 =?utf-8?B?cGpYc29xdE5qL09ZOVROYlZrVXZxcnlieTZsb0dtMWl4RlNtcnJKcGFQUmp4?=
 =?utf-8?B?Zlo1MEZQMVdRYmFuWW1EQURQWjYyc1FRUzNEd3kza3JoaVRKZDFXdmxKbEN0?=
 =?utf-8?B?U1FxTWhkVTRLOXNTOFFkbEdqUFNSM011RnczcXNyaDdPenZMQUYxWDQ1SG1T?=
 =?utf-8?B?OXpjdjBMVkt1TFMwU3JTTis1ZEptMjhma29xV3RudnhhR21NTUpNdGpCcGc2?=
 =?utf-8?B?WVJ4b0hPcExhTzM5cTNzYitGVjBDZnRFNzdOOFprVGx1SUE4TmtOU1BiQWw2?=
 =?utf-8?B?QThPZzY4emxLNlpidWwxZU1CKzIrKzV4ZE1QOFplckRMZTlUazV4U2lvMjhx?=
 =?utf-8?B?d2doVjNxYmNNaUZNdVVkOHpVL29tcXo5WU1pNzlLYXVpaVlUc0o1M2UxVnlV?=
 =?utf-8?B?VXJDaG50d3dhTjh6ZVUxQTVRRmQ1SG40emQ1QjduNUcxT3FBWjhnT09vVFZH?=
 =?utf-8?B?RU1NS2RNNmsxUkt0OUdXUDRQQU90c2ZRTGhlQ3V5M3ZGZ0hlU3gxL1o5bVlv?=
 =?utf-8?B?b1QxYUVmenFLMjZ5enplL1ZXaWNqN2hYeGFxcWI4TWNMVlVYSEIzNEdhZGVF?=
 =?utf-8?B?RzdSWG1jWFc2MUFWSlluMWhkY1k0Zm80a1gvYlp3azN3SmZTT1V4dFQ4dHd5?=
 =?utf-8?B?dnpVSXNMV2xRdkRQcUM2YTVWRGRRMzlFdUlWTW85RnAwT3hpNWFtWk11TUxr?=
 =?utf-8?B?VlN6UTI0bG53bGJ4dmdnMys0aTZSK3BPbW9ZMFVjajEvZnBOMmo5TjNRR1Bi?=
 =?utf-8?B?ZHEyZUFlemEvMXllRnBHOWlyVCtldys0TXQzVFVhVGc4U1FZaTEveDBVQ0VS?=
 =?utf-8?B?dFFKYUJHUi83NllNcFlIVk9sZys2em1hU0lkV1VBeE92TWYxQWFFVVZzODlt?=
 =?utf-8?B?cFlLb25vMVhHNDR0VFB4S2FUaWh1YVlWNDFIc1NmSDI2U2J2eHR5RVNMUUZq?=
 =?utf-8?B?NW8vdkFGS0tyV21NUEZSbVpxSm91K0xYTklORE5FK1NSNzRDTUFod25KRDJQ?=
 =?utf-8?B?ZmUwT0JxbUN0R2krSnhFa0xOOGl5RjBOMU1iRmpIWGo1c2hSdFNJMWhPTFVa?=
 =?utf-8?B?bFZlMU1oS29lYThqUzAveUh1VWRpV0JFQit4MThSYTRHcWZWTUJTMldzdEhM?=
 =?utf-8?B?RXdmcDZvd2pnNkQ2c3FycnJBNTJ5cEUyaU9qK1Y4TkpKa2JrOEEyd0xCK3J6?=
 =?utf-8?B?aUpUaWJrVUpMNGFmT0ZXTUMvZGhtZ3l1Um5CYWZEd0xweGNsSXdwdU1NUHhq?=
 =?utf-8?Q?MD/iP+2Gl0H77oNbCTBmpmk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6892D457173D4489826AB16B9DF8FF9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4e632d-4024-464f-2ff4-08dad49a7b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 19:21:58.5291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBv3yAYseuuorfcF0oQyCGWosE3qU11n0KzARaDSYen6KvJXph4E9fuSYN80sUnKEdSiHeFajp3QdhVlSb+e7ZWdVSh/54UOzE3i6F0bQj+Wq+Kd2UcSfGlDp0qdwm0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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
Cc: "Vivi@freedesktop.org" <Vivi@freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIEZyaSwgMjAyMi0xMi0wMiBhdCAxMToyMiAtMDUwMCwgVml2aSwgUm9kcmlnbyB3cm90
ZToNCj4gT24gVGh1LCBEZWMgMDEsIDIwMjIgYXQgMDU6MTQ6MDdQTSAtMDgwMCwgQWxhbiBQcmV2
aW4gd3JvdGU6DQo+ID4gU3RhcnRpbmcgd2l0aCBNVEwsIHRoZXJlIHdpbGwgYmUgdHdvIEdULXRp
bGVzLCBhIHJlbmRlciBhbmQgbWVkaWENCj4gPiB0aWxlLiBQWFAgYXMgYSBzZXJ2aWNlIGZvciBz
dXBwb3J0aW5nIHdvcmtsb2FkcyB3aXRoIHByb3RlY3RlZA0KPiA+IGNvbnRleHRzIGFuZCBwcm90
ZWN0ZWQgYnVmZmVycyBjYW4gYmUgc3Vic2NyaWJlZCBieSBwcm9jZXNzDQo+ID4gd29ya2xvYWRz
IG9uIGFueSB0aWxlLiBIb3dldmVyLCBkZXBlbmRpbmcgb24gdGhlIHBsYXRmb3JtLA0KPiA+IG9u
bHkgb25lIG9mIHRoZSB0aWxlcyBpcyB1c2VkIGZvciBjb250cm9sIGV2ZW50cyBwZXJ0YWluaW5n
IHRvIFBYUA0KPiA+IA0KQWxhbjogW3NuaXBdDQoNCj4gPiBAQCAtMTE2OCw2ICsxMTc2LDggQEAg
c3RhdGljIGludCBpOTE1X2RybV9wcmVwYXJlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ID4g
IHsNCj4gPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gdG9faTkxNShkZXYpOw0K
PiA+ICANCj4gPiArCWludGVsX3B4cF9zdXNwZW5kX3ByZXBhcmUoaTkxNS0+cHhwKTsNCj4gPiAr
DQo+ID4gIAkvKg0KPiA+ICAJICogTkIgaW50ZWxfZGlzcGxheV9zdXNwZW5kKCkgbWF5IGlzc3Vl
IG5ldyByZXF1ZXN0cyBhZnRlciB3ZSd2ZQ0KPiA+ICAJICogb3N0ZW5zaWJseSBtYXJrZWQgdGhl
IEdQVSBhcyByZWFkeS10by1zbGVlcCBoZXJlLiBXZSBuZWVkIHRvDQo+ID4gQEAgLTEyNDgsNiAr
MTI1OCw4IEBAIHN0YXRpYyBpbnQgaTkxNV9kcm1fc3VzcGVuZF9sYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIGJvb2wgaGliZXJuYXRpb24pDQo+ID4gIA0KPiA+ICAJZGlzYWJsZV9ycG1fd2Fr
ZXJlZl9hc3NlcnRzKHJwbSk7DQo+ID4gIA0KPiA+ICsJaW50ZWxfcHhwX3N1c3BlbmQoZGV2X3By
aXYtPnB4cCk7DQo+IA0KPiBpcyB0aGlzIHJlYWxseSBuZWVkZWQgaGVyZSBpbiB0aGUgc3VzcGVu
ZF9sYXRlPw0KPiB3aHkgbm90IGluIHN1c3BlbmQoKT8NCj4gDQo+IEluIGdlbmVyYWwgd2hhdCBp
cyBuZWVkZWQgaW4gc3VzcGVuZF9sYXRlIGlzIHJlc3VtZWQgZnJvbSB0aGUgcmVzdW1lX2Vhcmx5
LA0KPiB3aGF0IGRvZXNuJ3QgbG9vayB0aGUgY2FzZSBoZXJlLiBTbyBzb21ldGhpbmcgbG9va3Mg
b2ZmLg0KPiANCg0KQWN0dWFsbHkgdGhpcyBwYXRjaCBpcyBOT1QgY2hhbmdpbmcgdGhlIGNvZGUg
ZmxvdyBvZiB3aGVuIHRoZXNlIHB4cCBwbSBmdW5jdGlvbnMgYXJlIGdldHRpbmcgY2FsbGVkIGZy
b20gYW4gaTkxNS1sZXZlbA0KcGVyc3BlY3RpdmUgLSBpIGFtIG1lcmVseSBtb3ZpbmcgaXQgZnJv
bSBpbnNpZGUgZ3QgbGV2ZWwgdG8gdG9wIGxldmVsIHVwOg0KDQpPcmlnaW5hbCAtLT4gaTkxNV9k
cm1fc3VzcGVuZF9sYXRlIGNhbGxzIGk5MTVfZ2VtX3N1c3BlbmRfbGF0ZSBjYWxscyBpbnRlbF9n
dF9zdXNwZW5kX2xhdGUgY2FsbHMgaW50ZWxfcHhwX3N1c3BlbmQNClBhdGNoIC0tPiBpOTE1X2Ry
bV9zdXNwZW5kX2xhdGUgY2FsbHMgaW50ZWxfcHhwX3N1c3BlbmQgKGJlZm9yZSBjYWxsaW5nIGk5
MTVfZ2VtX3N1c3BlbmRfbGF0ZSkNCg0KUHV0dGluZyB0aGF0IGFzaWRlLCBpIHRoaW5rIHRoZSBv
cmlnaW5hbCBjb2RlIHdhcyBkZXNpZ25lZCB0byBoYXZlIHRoZSBzdXNwZW5kLXByZXBhcmUgZG8g
bmVhcmx5IGV2ZXJ5dGhpbmcgZXhjZXB0DQpkaXNhYmxlIHRoZSBLQ1IgcmVnaXN0ZXJzIHdoaWNo
IGlzIHBvc3Rwb25lZCBpbiBvcmRlciB0byBoYW5kbGUgYSBmYWlsZWQgc3lzdGVtLXN1c3BlbmQt
cHJlcGFyZSAoYWZ0ZXIgcHhwJ3Mgc3VzcGVuZC0NCnByZXBhcmUpLiBBIGZhaWxlZCBzeXN0ZW0t
c3VzcGVuZC1wcmVwYXJlIChhZnRlciBweHAncyBzdXNwZW5kLXByZXBhcmUpIHdvdWxkIGJlIHJl
Y292ZXJhYmxlIHdpdGggbm8tb3AgZnJvbSBweHAncw0KcGVyc3BlY3RpdmUgYXMgdGhlIFVNRCB3
b3VsZCBiZSBmb3JjZWQgdG8gcmVjcmVhdGUgdGhlIHB4cCBjb250ZXh0IHRoYXQgcmVjcmVhdGVz
IGFyYiBzZXNzaW9uIGFnYWluIGFuZCBiZWNhdXNlIHRoZSBLQ1INCnJlZ2lzdGVycyBoYWRudCBi
ZWVuIGRpc2FibGVkLCBub3RoaW5nIG1vcmUgaXMgcmVxdWlyZWQuIEknbSBub3QgMTAwJSBzdXJl
IHNvIEknbGwgcGluZyBEYW5pZWxlIGp1bXAgaW4gdG8gY29ycmVjdCBtZS4gDQoNClRoYXQgc2Fp
ZCwgdGhlIGJldHRlciB3YXksIGZvciBjb2RlIHJlYWRpYmlsaXR5LCB3b3VsZCBiZSBjb21wbGV0
ZWx5IHNraXAgaGF2aW5nIGFuIGludGVsX3B4cF9zdXNwZW5kIGFuZCBqdXN0IGRpc2FibGUNCnRo
ZSBLQ1IgaW4gaW50ZWxfcHhwX3N1c3BlbmRfcHJlcGFyZSBhbmQgaW5zdGVhZCBhZGQgYW4gaTkx
NSBjYWxsYmFjayBmb3IgcmVzdW1lX2NvbXBsZXRlICh3aGljaCBpcyB0aGUgc3ltbWV0cmljYWwN
Cm9wcG9zaXRlIG9mIHN1c3BlbmRfcHJlcGFyZSBhbmQgc3VycHJpc2luZ2x5IG5vbi1leGlzdGVu
ZCBpbiBpOTE1IGNvZGViYXNlKSBpbiBvcmRlciB0byByZS1zdGFydCBrY3IgcmVnaXN0ZXJzIHRo
ZXJlIGZvcg0KdGhlIGNhc2Ugb2YgYSBmYWlsZWQtc3lzdGVtLXN1c3BlbmQtcHJlcGFyZSBvciBj
b21wbGV0aW9uIG9mIHJlc3VtZS4gSSBoYXZlIGEgc2VwYXJhdGUgc2VyaWVzIHRoYXQgaXMgYXR0
ZW1wdGluZyB0byBmaXgNCnNvbWUgb2YgdGhpcyBsYWNrIG9mIHN5bW1ldHJ5IGhlcmU6wqBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTEzMjc5Lz9zZXJpZXM9MTExNDA5
JnJldj0xIGJ1dCBpIGhhZG4ndA0KcmVtb3ZlZCB0aGUgaW50ZWxfcHhwX3N1c3BlbmQgYmVjYXVz
ZSBpIGFtIG5vdCBzdXJlIGlmIHRoZSBpOTE1LXJlc3VtZS1jb21wbGV0ZSBjYWxsYmFjayB3b3Vs
ZCBzdGlsbCBiZSBjYWxsZWQgaWYgaTkxNQ0KaXRzZWxmIHdhcyB0aGUgcmVhc29uIGZvciB0aGUg
ZmFpbGVkIHN1c3BlbmQtcHJlcGFyZSBBTkQgdGhlIHB4cC1zdXNwZW5kLXByZXBhcmUgaGFkIG9j
Y3VyZWQuIFNvIGkgbmVlZCB0byBjcmFmdCBvdXQgYQ0Kd2F5IHRvIHRlc3QgdGhhdC4NCg0KRG8g
eW91IHdhbnQgdG8gY29udGludWUgcHVyc3VpbmcgdGhlIGZpbmFsIGZpeHVwcyBmb3IgcHhwJ3Mg
c3VzcGVuZC1yZXN1bWUgZmxvd3MgaW4gdGhpcyBwYXRjaD8gQWdhaW4sIGkgYW0gTk9UIGNoYW5n
aW5nDQp0aGlzIGZsb3cgLSBqdXN0IG1vdmluZyBpdCBmcm9tIGluc2lkZS1ndCB0byBvdXRzaWRl
IGdlbS1ndCB3aGVyZSBmb3Igc3VzcGVuZCB3ZSBtb3ZlIGl0IG91dHNpZGUtYW5kLWJlZm9yZSBh
bmQgZm9yDQpyZXN1bWUgd2UgbW92ZSBpdCBvdXRzaWRlLWFuZC1hZnRlci4NCg0KPiA+IA0KPiA+
IA0KDQpBbGFuOiBbc25pcF0NCg0KPiA+ICsNCj4gPiAgCWk5MTVfZ2VtX3N1c3BlbmRfbGF0ZShk
ZXZfcHJpdik7DQo+ID4gIA0KPiA+ICAJZm9yX2VhY2hfZ3QoZ3QsIGRldl9wcml2LCBpKQ0KPiA+
ICtpbnQgaW50ZWxfcHhwX2luaXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+ID4g
K3sNCj4gPiArCXN0cnVjdCBpbnRlbF9weHAgKm5ld3B4cDsNCj4gPiArDQo+ID4gKwluZXdweHAg
PSBremFsbG9jKHNpemVvZigqbmV3cHhwKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIW5ld3B4
cCkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlpOTE1LT5weHAgPSBuZXdw
eHA7DQo+IA0KPiBpOTE1LT5weHAgaXMgYWxyZWFkeSBhbiBpbnRlbF9weHAgKiwgd2h5IGNhbid0
IHdlIHNpbXBseQ0KPiBkbyANCj4gaTkxNS0+cHhwID0ga3phbGxvYyhzaXplb2YoLi4uDQo+IAkg
IGlmICghaTkxNS0+cHhwKQ0KPiAJICByZXR1cm4gLUVOT01FTTsNCj4gPw0KPiANCnllcyBidXQg
aSB3YW50ZWQgdG8gYXZvaWQgdXNpbmcgJ2k5MTUtPnB4cCcgZm9yIGFsbCB0aGUgY29kZXMgYmVs
b3cgYW5kIGp1c3QgdXNlIGEgbG9jYWwgdmFyaWFibGUgdG8ga2VlcCBpdCBzaG9ydGVyLg0KQnV0
IHNpbmNlIHRoYXQncyB3aGF0IHlvdSBwcmVmZXIsIEkgd2lsbCByZXNwaW4gYWNjb3JkaW5nbHku
DQoNCj4gPiArDQo+ID4gKwluZXdweHAtPmN0cmxfZ3QgPSBweHBfZ2V0X2N0cmxfZ3QoaTkxNSk7
DQo+ID4gKwlpZiAoIW5ld3B4cC0+Y3RybF9ndCkNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4g
PiAgDQo+ID4gIAkvKg0KPiA+ICAJICogSWYgSHVDIGlzIGxvYWRlZCBieSBHU0MgYnV0IFBYUCBp
cyBkaXNhYmxlZCwgd2UgY2FuIHNraXAgdGhlIGluaXQgb2YNCj4gPiAgCSAqIHRoZSBmdWxsIFBY
UCBzZXNzaW9uL29iamVjdCBtYW5hZ2VtZW50IGFuZCBqdXN0IGluaXQgdGhlIHRlZSBjaGFubmVs
Lg0KPiA+ICAJICovDQo+ID4gLQlpZiAoSEFTX1BYUChndC0+aTkxNSkpDQo+ID4gLQkJcHhwX2lu
aXRfZnVsbChweHApOw0KPiA+IC0JZWxzZSBpZiAoaW50ZWxfaHVjX2lzX2xvYWRlZF9ieV9nc2Mo
Jmd0LT51Yy5odWMpICYmIGludGVsX3VjX3VzZXNfaHVjKCZndC0+dWMpKQ0KPiA+IC0JCWludGVs
X3B4cF90ZWVfY29tcG9uZW50X2luaXQocHhwKTsNCj4gPiArCWlmIChpbnRlbF9weHBfaXNfc3Vw
cG9ydGVkKG5ld3B4cCkpDQo+ID4gKwkJcHhwX2luaXRfZnVsbChuZXdweHApOw0KPiA+ICsJZWxz
ZSBpZiAoaW50ZWxfaHVjX2lzX2xvYWRlZF9ieV9nc2MoJm5ld3B4cC0+Y3RybF9ndC0+dWMuaHVj
KSAmJg0KPiA+ICsJCSBpbnRlbF91Y191c2VzX2h1YygmbmV3cHhwLT5jdHJsX2d0LT51YykpDQo+
ID4gKwkJaW50ZWxfcHhwX3RlZV9jb21wb25lbnRfaW5pdChuZXdweHApOw0KPiA+ICsNCj4gPiAr
CXJldHVybiAwOw0KPiA+ICB9DQo+ID4gDQoNCkFsYW46IFtzbmlwXQ0KDQo+ID4gIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGludGVsX3B4cCAqaTkxNV9kZXZfdG9fcHhwKHN0cnVjdCBkZXZpY2UgKmk5
MTVfa2RldikNCj4gPiAgew0KPiA+ICAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBr
ZGV2X3RvX2k5MTUoaTkxNV9rZGV2KTsNCj4gPiAgDQo+ID4gLQlyZXR1cm4gJnRvX2d0KGk5MTUp
LT5weHA7DQo+ID4gKwlyZXR1cm4gaTkxNS0+cHhwOw0KPiANCj4gaG1tbS4uLiBub3cgdGhhdCB3
ZSBoYXZlIHB4cCB1bmRlciBpOTE1LCB3ZSBzaG91bGQgc2ltcGx5IGtpbGwgdGhpcyBmdW5jdGlv
bg0KPiBhbmQgbW92ZSBpdCB0byBzaW1wbHkgdXNlIGk5MTUtPnB4cC4NCj4gDQpBbGFuOiBzdXJl
IHdpbGwgcmVtb3ZlIHRoaXMuDQoNCg==
