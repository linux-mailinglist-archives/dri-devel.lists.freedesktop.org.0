Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C024046E5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 10:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92B46E48F;
	Thu,  9 Sep 2021 08:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC88B6E48E;
 Thu,  9 Sep 2021 08:18:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="306287596"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="306287596"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 01:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="479543181"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 09 Sep 2021 01:17:59 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 01:17:58 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 01:17:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 01:17:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 01:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLEbXnYlD5i3mVsJmtV8iOBYEs8YwWSHqgXL9NryWARKKw0Mg+JE7LV/1I9Njf53V2wzZKokJeqa4x1VLc1IwURX83PPrEnGe902QTSpV4mLbT7YCLdo9jhw5DU2VSYgcSitKPVx67WFdnys8mX0yLrADz2xOM1yLjxPpeysCb7XSI0g+4I+2HFL+0C5lxiIv7xmi4ZVxBnjkLjNNtqYk9VwJqb4vH/I2qHFguxlqkDrkJEidXrzpOTycFbVSsjB6/WqUlkjiURLGUTNX50EQK41l3V6IzEUYSiwyppL+qF4MmZLh8Idv2YG1t8xcLgH/hocpD5v3l+HV8SXAN178g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=piAjHrgU0gk79QzOxWieJKDOyb5+Y4Ak2FjzhKICpWA=;
 b=hXECO/J7k514dnaBDeqObnNywbVYUCfzUTJEC51hFBeWIDi1UO87vrifb9+8BpgQzCbcxJL0of5fbsRBWGUVaA07+lTPx776DcD/KEs3Zy9VAA+5AEKHdx+Pb4yt9FeTawWwW3Kl76CNVkzts/7heiet83qda7XGIBvEpw9W4WcxTOH9YT6Tu+xlsQh7iKvVhd51rYymU6ubSgGdj+KjlCaBrpDettY4ev5m6XtNmEAumbPvfVy0zpFu/9QY5J/KSIhNbWzH7yg5vqGqZ0OyBdI1Vrf4pUvcM4v31JCGcTDcEfRrOqERTAGMFQyv8rkwk6ueeHLtsUa8tqLyxBlHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piAjHrgU0gk79QzOxWieJKDOyb5+Y4Ak2FjzhKICpWA=;
 b=uYLT9HqZEB8EC3SVs3XEmKb8AgpMvhuqKGMsr92YlsIbFwEdoPB1gfusrXsGPrXCMmQpmgkUZCJFMMmOLnul40t9o0lZxHRGldPv9q/D0jnsz/E4W7Ov0HtbaVW17WUn6ugmv04WJGfyZBfL4+P/SHwShcRLNM8avsReL7rKyHM=
Received: from BYAPR11MB3784.namprd11.prod.outlook.com (2603:10b6:a03:fe::10)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 08:17:52 +0000
Received: from BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::7d17:fce5:7d65:61e1]) by BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::7d17:fce5:7d65:61e1%5]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 08:17:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v7 15/17] drm/i915/pxp: add pxp debugfs
Thread-Topic: [Intel-gfx] [PATCH v7 15/17] drm/i915/pxp: add pxp debugfs
Thread-Index: AQHXm6xT5x39PfQ/w0y6x1tqXGuZfqubbxoA
Date: Thu, 9 Sep 2021 08:17:51 +0000
Message-ID: <feeca8386eb62d8fceef417f63d023277d047b5b.camel@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-16-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210828012738.317661-16-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb4d62fc-b2d4-468d-3634-08d9736a5180
x-ms-traffictypediagnostic: SJ0PR11MB5216:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB52169881DE78B1F0BB309C078AD59@SJ0PR11MB5216.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grgFT1EaB0jlorX9952LbetrwoFmJRkh+GSZtRCxkErMAjBc21FEwRUnvuxIhAof45Q9zwGLTnV0rck49vsATKA4vh1xit7HTQPrulQeYANZwfX8zs5E67GJB62UAP6z9eHEQQIrFcxn4B5SfdZjP7TNiDTWbqHmy4YFayxFFj7c0RBHvmz29vp52pWByJK7rsHqomoCXDkXcQOdmaYUU3blJ8KKH6Lw1LfzWjtU3nplKCAd5BODK5JmUH62vUJNtADtEQ3EDdBjfe3ka0gmdxVPW9aFwCx6Pvz5jY3AeF8CGEdcCi4fVGdkr6ImBuEvH4hAj0cfjSWM2OIKr1ZqpJdmQbJj0mgzUAO2RPqCbEr6TNBEBQEjW4kQwV+P5bkM4FqcZbx5CsiLVdLQOHkgaZfpLBDckf7Ouo4wRCynA2wcG3KUty5Uq9irgeqZAjiVKW2tkU3GScpeJlKMV8vcmByAp8FRL/u1oNmv+MEJJANtNLVOWTQZFhJ+Q3CCFINbcD4qeSDziG0Tx/4Pm8+uz+ZV6xfHRRQBuNefTD+0wODbVxbjmV/cmgxho+nwxiAshZXCP4J4PJFtg7nwVTMPWsu3lRtQnedjTz53p6QM8wiAE9bPUnL0R2Qh0BKWbsIiNMZeRZjrzXHBzXVvIPfrk7gv8i4gRS5YPONeU75p9mVTI0IoLLRhHohrHdzGyLSwe7t1qwyOTb49QFUqzSXZ4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3784.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(38100700002)(36756003)(2906002)(64756008)(66556008)(66476007)(122000001)(8936002)(6486002)(2616005)(83380400001)(450100002)(478600001)(86362001)(5660300002)(186003)(4326008)(6512007)(110136005)(38070700005)(76116006)(66446008)(316002)(8676002)(66946007)(71200400001)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjNucnFjRWVycW1pc2pCdGtHZDQwWGw2V0RTQzZEbGk4YmZjanUvak5pNEUx?=
 =?utf-8?B?VEpJdXdnRjZNcFlxUkhmeGtzdEM4VUR6ait0WDlQOXAzUGgwN1lNck84Vmgr?=
 =?utf-8?B?bW4zQmNFR1V0Z3FtYjdUR1ZubU9DeU5tK2dkMjhTM09wWDB6aG00WVEwbUNF?=
 =?utf-8?B?MEJ6TU5EeUxYeXZlV0JseFhEWlBnS3laZWhXQ080UExUbTNjeWdZODRLQ05x?=
 =?utf-8?B?YlZHdnllYzRCWFBUMk1tS0VSZVlQVjRIRE0yU2FvNW5CV1VnWkN0L3dRbE9E?=
 =?utf-8?B?UTVJMEEwcUR6ZzkxSWxLRzdGZmdZR3NnL1FvRnluK3oxeHgrTUxtYkw2R3VG?=
 =?utf-8?B?L0lOdUcyYTM1cTVMMG5RdTFPMHJhQ3VWSU9HeVJoS3hpWS84UG9pR0xCSWZL?=
 =?utf-8?B?TGpzaG5ZZS82ZmYxOVM0N09XL2Z2QklrL2lEQWk3MlJObjR3TEVwdHRSYm5u?=
 =?utf-8?B?emZIWGRRUjd0SUV3UnphVXNCT285YXZ4bGZSNHZFT1hVNWV2am9oWWwzamtX?=
 =?utf-8?B?dnZFOTJaM24yMExFVk1RVlA0N1F6VnpRTWw1V1BvWDZOWFplTysrUlZpZXdp?=
 =?utf-8?B?Qm9vUEUzdU5SR1ZWaWhURWVVSTdJMzN1em5JOVI0WGs3cWFtQ3graFUvVHdE?=
 =?utf-8?B?ZjByaU9ic1hVSGFVRFowdjFhb25hM09TditwNy9UWU13R2x6K1RlZGZqM09m?=
 =?utf-8?B?bzQxenNyQW1sOERKQ0QxaDhwdytUby9qWGc4ZXdLbmtlc2cyVnFta2J5UExs?=
 =?utf-8?B?L3JZQ1oxTEMvU3ZUUmt0Y3RMdVJxbGZvRzRrZzFneVZ1OXBUbzkrcFZsNUQ3?=
 =?utf-8?B?MVMrd2FTb3Z6V29BQXRtSEYwYVdXMzlrNGRxVWFxV1BVNnZNNmpsMnVqd1hw?=
 =?utf-8?B?Qm85Q09rNzdCdEp1YklhdUhrd05Tbmh3THJXeFRoYWpaZ0t0bmVHZVo2NzZ4?=
 =?utf-8?B?Uk5EbDgveWFEVDNtcWpHY2NJMUF1VGxQaDNHandMajZITkRkd2phWjFSVmJG?=
 =?utf-8?B?YmRXZ1JUMXY5SmZYWHd1bm15Y09NS2RRQXExcWFwZlBBTk1sdytTUjNaaVR0?=
 =?utf-8?B?MGtqMDJCUy9oQjdXVjF2WkF2NjBRNlNJeWRYbDdTYU5XeVFWbVIxbS9VTTd4?=
 =?utf-8?B?V0lRWmw4T1BIQ0VJTngySHQ5bkRsYjJ4WG4yT21MZUMrbnpCdURRdVA5eU9L?=
 =?utf-8?B?K082b1NmdFlPUXIrRGJCQys3QXE1U0RwUEFzOFJxeHlVNXYya0ErNTdYRGh1?=
 =?utf-8?B?emVSbkZNUUgrZ1QwaDRJWUgrU0x4aDk3OW5adHZ0Z3hmVEovZGExaUlkckNK?=
 =?utf-8?B?MXlVeDFzNUZ4VUk3VUErTHorTWhsdG9mdzdnUjczbDB6UWtNYitKNlZ5UEVy?=
 =?utf-8?B?bENTQW8xdFNVNDc1QVZxZmZQQmUzTmhpZEVqTm9pL2ROZ2YrME5Xdnc1M21p?=
 =?utf-8?B?TWVRU0NLREg0dmtSZmpSZ2hkd3ZDeHNZSlJzYWYyWFJ4U1pSc0FMMmwxZFM1?=
 =?utf-8?B?cWRIbVEvMExUTFo3TnI4TXRVRUtBajVGZ3QyWlVqQnJtemtmNHJrQklXYlFa?=
 =?utf-8?B?bTdNOEpRQmZrckgyc0xCazlHUUg4dnV4L0p5ak5tVTArV0FpK1ROYnZIemxO?=
 =?utf-8?B?OUhJdDFaVFY3Mm12VUZCRHdRK05XdEsrMnJrN3Z0M1ZyYm9DemZYQ1JNYjdp?=
 =?utf-8?B?TmhWU0twMFRjY2Z5bDB4UnZIOEM2dnE1MWpZTWR1UmV3TjVBbXdvVWxIUnJw?=
 =?utf-8?Q?KeqC3w5+sqY0AOtvp/lxSiDdBtwBZurdJoaEUrZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52AD2A64DD316143BC6716E02734E7FF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4d62fc-b2d4-468d-3634-08d9736a5180
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 08:17:51.9371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KuCgsKIwJFwGVdV/t06S+GDgGaR4Ua+uE7bLQQllrfzP9in3IzemhDkSPkY3fzGEfZ5lrLpyVLCu1WAOzD7QNiY/aISr6k9vcTTfZzqj1PE0+Z3jTgcPVjRi7xvqg0oR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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

SSBkb250IHNlZSBhbnkgaXNzdWVzIGV4Y2VwdCBhIGNvdXBsZSBvZiBuaXRzLiANCg0KUmV2aWV3
ZWQtYnkgOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4N
Cg0KLi4uYWxhbg0KDQpPbiBGcmksIDIwMjEtMDgtMjcgYXQgMTg6MjcgLTA3MDAsIERhbmllbGUg
Q2VyYW9sbyBTcHVyaW8gd3JvdGU6DQo+IDIgZGVidWdmcyBmaWxlcywgb25lIHRvIHF1ZXJ5IHRo
ZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUgcHhwIHNlc3Npb24gYW5kIG9uZQ0KPiB0byB0cmlnZ2Vy
IGFuIGludmFsaWRhdGlvbiBmb3IgdGVzdGluZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgMSAr
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9kZWJ1Z2ZzX2d0LmMgICAgICAgICB8ICAyICsN
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfZGVidWdmcy5jIHwgNzggKysr
KysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBf
ZGVidWdmcy5oIHwgMjEgKysrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEwMiBpbnNlcnRpb25z
KCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF9kZWJ1Z2ZzLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9weHAvaW50ZWxfcHhwX2RlYnVnZnMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gaW5k
ZXggNmY2Y2JiZTk4Yjk2Li45YTQ0ZDZmMDFlM2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxl
DQo+IEBAIC0yODQsNiArMjg0LDcgQEAgaTkxNS15ICs9IGk5MTVfcGVyZi5vDQo+ICBpOTE1LSQo
Q09ORklHX0RSTV9JOTE1X1BYUCkgKz0gXA0KPiAgCXB4cC9pbnRlbF9weHAubyBcDQo+ICAJcHhw
L2ludGVsX3B4cF9jbWQubyBcDQo+ICsJcHhwL2ludGVsX3B4cF9kZWJ1Z2ZzLm8gXA0KPiAgCXB4
cC9pbnRlbF9weHBfaXJxLm8gXA0KPiAgCXB4cC9pbnRlbF9weHBfcG0ubyBcDQo+ICAJcHhwL2lu
dGVsX3B4cF9zZXNzaW9uLm8gXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvZGVidWdmc19ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZGVidWdmc19ndC5jDQo+
IGluZGV4IDU5MWViNjA3ODVkYi4uYzI3ODQ3ZGRiNzk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9kZWJ1Z2ZzX2d0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvZGVidWdmc19ndC5jDQo+IEBAIC05LDYgKzksNyBAQA0KPiAgI2luY2x1ZGUgImRlYnVn
ZnNfZ3QuaCINCj4gICNpbmNsdWRlICJkZWJ1Z2ZzX2d0X3BtLmgiDQo+ICAjaW5jbHVkZSAiaW50
ZWxfc3NldV9kZWJ1Z2ZzLmgiDQo+ICsjaW5jbHVkZSAicHhwL2ludGVsX3B4cF9kZWJ1Z2ZzLmgi
DQo+ICAjaW5jbHVkZSAidWMvaW50ZWxfdWNfZGVidWdmcy5oIg0KPiAgI2luY2x1ZGUgImk5MTVf
ZHJ2LmgiDQo+ICANCj4gQEAgLTI4LDYgKzI5LDcgQEAgdm9pZCBkZWJ1Z2ZzX2d0X3JlZ2lzdGVy
KHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ICAJaW50ZWxfc3NldV9kZWJ1Z2ZzX3JlZ2lzdGVyKGd0
LCByb290KTsNCj4gIA0KPiAgCWludGVsX3VjX2RlYnVnZnNfcmVnaXN0ZXIoJmd0LT51Yywgcm9v
dCk7DQo+ICsJaW50ZWxfcHhwX2RlYnVnZnNfcmVnaXN0ZXIoJmd0LT5weHAsIHJvb3QpOw0KPiAg
fQ0KPiAgDQo+ICB2b2lkIGludGVsX2d0X2RlYnVnZnNfcmVnaXN0ZXJfZmlsZXMoc3RydWN0IGRl
bnRyeSAqcm9vdCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRl
bF9weHBfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9kZWJ1
Z2ZzLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hMjZl
NDM5NmJhNmMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9w
eHAvaW50ZWxfcHhwX2RlYnVnZnMuYw0KPiBAQCAtMCwwICsxLDc4IEBADQo+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjEgSW50
ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvZGVidWdmcy5o
Pg0KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gKw0KPiArI2luY2x1ZGUgImd0L2Rl
YnVnZnNfZ3QuaCINCj4gKyNpbmNsdWRlICJweHAvaW50ZWxfcHhwLmgiDQo+ICsjaW5jbHVkZSAi
cHhwL2ludGVsX3B4cF9pcnEuaCINCj4gKyNpbmNsdWRlICJpOTE1X2Rydi5oIg0KPiArDQo+ICtz
dGF0aWMgaW50IHB4cF9pbmZvX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQ0K
PiArew0KPiArCXN0cnVjdCBpbnRlbF9weHAgKnB4cCA9IG0tPnByaXZhdGU7DQo+ICsJc3RydWN0
IGRybV9wcmludGVyIHAgPSBkcm1fc2VxX2ZpbGVfcHJpbnRlcihtKTsNCj4gKwlib29sIGVuYWJs
ZWQgPSBpbnRlbF9weHBfaXNfZW5hYmxlZChweHApOw0KPiArDQo+ICsJaWYgKCFlbmFibGVkKSB7
DQo+ICsJCWRybV9wcmludGYoJnAsICJweHAgZGlzYWJsZWRcbiIpOw0KPiArCQlyZXR1cm4gMDsN
Cj4gKwl9DQo+ICsNCj4gKwlkcm1fcHJpbnRmKCZwLCAiYWN0aXZlOiAlc1xuIiwgeWVzbm8oaW50
ZWxfcHhwX2lzX2FjdGl2ZShweHApKSk7DQo+ICsJZHJtX3ByaW50ZigmcCwgImluc3RhbmNlIGNv
dW50ZXI6ICV1XG4iLCBweHAtPmtleV9pbnN0YW5jZSk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4g
K30NCj4gK0RFRklORV9HVF9ERUJVR0ZTX0FUVFJJQlVURShweHBfaW5mbyk7DQo+ICsNCj4gK3N0
YXRpYyBpbnQgcHhwX2ludmFsX2dldCh2b2lkICpkYXRhLCB1NjQgKnZhbCkNCj4gK3sNCj4gKwkv
KiBub3RoaW5nIHRvIHJlYWQgKi8NCj4gKwlyZXR1cm4gLUVQRVJNOw0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgaW50IHB4cF9pbnZhbF9zZXQodm9pZCAqZGF0YSwgdTY0IHZhbCkNCj4gK3sNCj4gKwlz
dHJ1Y3QgaW50ZWxfcHhwICpweHAgPSBkYXRhOw0KPiArCXN0cnVjdCBpbnRlbF9ndCAqZ3QgPSBw
eHBfdG9fZ3QocHhwKTsNCj4gKw0KPiArCWlmICghaW50ZWxfcHhwX2lzX2FjdGl2ZShweHApKQ0K
PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKw0KPiArCS8qIHNpbXVsYXRlIGFuIGludmFsaWRhdGlv
biBpbnRlcnJ1cHQgKi8NCj4gKwlzcGluX2xvY2tfaXJxKCZndC0+aXJxX2xvY2spOw0KPiArCWlu
dGVsX3B4cF9pcnFfaGFuZGxlcihweHAsIEdFTjEyX0RJU1BMQVlfUFhQX1NUQVRFX1RFUk1JTkFU
RURfSU5URVJSVVBUKTsNCj4gKwlzcGluX3VubG9ja19pcnEoJmd0LT5pcnFfbG9jayk7DQo+ICsN
Cj4gKwlpZiAoIXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmcHhwLT50ZXJtaW5hdGlvbiwN
Cj4gKwkJCQkJIG1zZWNzX3RvX2ppZmZpZXMoMTAwKSkpDQo+ICsJCXJldHVybiAtRVRJTUVET1VU
Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK0RFRklORV9TSU1QTEVfQVRUUklC
VVRFKHB4cF9pbnZhbF9mb3BzLCBweHBfaW52YWxfZ2V0LCBweHBfaW52YWxfc2V0LCAiJWxseFxu
Iik7DQo+ICt2b2lkIGludGVsX3B4cF9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCBpbnRlbF9weHAg
KnB4cCwgc3RydWN0IGRlbnRyeSAqZ3Rfcm9vdCkNCj4gK3sNCj4gKwlzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRlYnVnZnNfZ3RfZmlsZSBmaWxlc1tdID0gew0KPiArCQl7ICJpbmZvIiwgJnB4cF9pbmZv
X2ZvcHMsIE5VTEwgfSwNCj4gKwkJeyAiaW52YWxpZGF0ZSIsICZweHBfaW52YWxfZm9wcywgTlVM
TCB9LA0KTklUIG9ubHk6IGNvbnNpZGVyIG5hbWluZyB0byAiaW52YWxpZGF0ZV9kaXNwbGF5IiBv
ciAiZGlzcGxheV9pbnZhbCIgc2luY2Ugd2UgYXJlIHVzaW5nIHRoaXMgdG8gdHJpZ2dlcg0KZGlz
cGxheSBweHAgdGVhcmRvd24gc3BlY2lmaWMgaXJxIGNvZGUgcGF0aC4NCj4gKwl9Ow0KPiArCXN0
cnVjdCBkZW50cnkgKnJvb3Q7DQo+ICsNCj4gKwlpZiAoIWd0X3Jvb3QpDQo+ICsJCXJldHVybjsN
Cj4gKw0KPiArCWlmICghSEFTX1BYUCgocHhwX3RvX2d0KHB4cCktPmk5MTUpKSkNCj4gKwkJcmV0
dXJuOw0KPiArDQo+ICsJcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcigicHhwIiwgZ3Rfcm9vdCk7
DQo+ICsJaWYgKElTX0VSUihyb290KSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJaW50ZWxfZ3Rf
ZGVidWdmc19yZWdpc3Rlcl9maWxlcyhyb290LCBmaWxlcywgQVJSQVlfU0laRShmaWxlcyksIHB4
cCk7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxf
cHhwX2RlYnVnZnMuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfZGVidWdm
cy5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2I3NDU0
ZDgzOGU5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhw
L2ludGVsX3B4cF9kZWJ1Z2ZzLmgNCj4gQEAgLTAsMCArMSwyMSBAQA0KPiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIwIElu
dGVsIENvcnBvcmF0aW9uDQpOSVQgLSAyMDIxDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBfX0lO
VEVMX1BYUF9ERUJVR0ZTX0hfXw0KPiArI2RlZmluZSBfX0lOVEVMX1BYUF9ERUJVR0ZTX0hfXw0K
PiArDQo+ICtzdHJ1Y3QgaW50ZWxfcHhwOw0KPiArc3RydWN0IGRlbnRyeTsNCj4gKw0KPiArI2lm
ZGVmIENPTkZJR19EUk1fSTkxNV9QWFANCj4gK3ZvaWQgaW50ZWxfcHhwX2RlYnVnZnNfcmVnaXN0
ZXIoc3RydWN0IGludGVsX3B4cCAqcHhwLCBzdHJ1Y3QgZGVudHJ5ICpyb290KTsNCj4gKyNlbHNl
DQo+ICtzdGF0aWMgaW5saW5lIHZvaWQNCj4gK2ludGVsX3B4cF9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0
cnVjdCBpbnRlbF9weHAgKnB4cCwgc3RydWN0IGRlbnRyeSAqcm9vdCkNCj4gK3sNCj4gK30NCj4g
KyNlbmRpZg0KPiArDQo+ICsjZW5kaWYgLyogX19JTlRFTF9QWFBfREVCVUdGU19IX18gKi8NCj4g
LS0gDQo+IDIuMjUuMQ0KPiANCg0K
