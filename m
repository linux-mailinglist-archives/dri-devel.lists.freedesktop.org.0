Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 996A07B5FC3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 06:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E010E021;
	Tue,  3 Oct 2023 04:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D08E10E021
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 04:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1696306750; x=1727842750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=w+wH1nIEYfqdOiQ3dPqdgQf6oUWPkQnhVd95q2BX08s=;
 b=cEP33n9DgRkiGwKzcKm1O7r/gQxa3ND5p9791T1XZk0RsUQFxz9jFWem
 h2ZYgS1sBAwhgFvKNM26d/HU+vqLrIvC6bENeVefWZlEfW1K0Yp63EKio
 AMFBH2PYC+O93WCO+geCPwHoeJMsmS/j4mzCg/LMlS0NfP94VYiGkZcou
 qWMyqFVz3v8Cb36x7rNZHF6VWUNKjk2CzQQKRxCRHWq9G4NN6+Sl12iog
 jDUZ6mrYM0uSYYPIKmMKn14h/Z515+FQfolLr5Y1zQaIS9iNB4pnkrs9U
 MGgSS4NcXtsRGoMrJlPQiKaAzxTsjrZFmUO9Su+VwGZuipaM829DhMVtg Q==;
X-CSE-ConnectionGUID: iRXXdZPaS+e6eTa3iqcIiA==
X-CSE-MsgGUID: udZpWNJwSK+qfAHGDIoKuA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="238350352"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 21:19:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 2 Oct 2023 21:18:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 2 Oct 2023 21:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHIuS/NFad4v2xP9g5vm0PNhVbc6EeM1kBczRUZL54yuee46FbGsVzlqC5V+CN4/Gv7PlRWulMv3Mbi4vZ2VA7RqRw1ib9srYh1fwibn4rgNRZxW9RLnhj0bm7gFSu4wKjJsBsfv8Kb6LckCYTykUS9jUGpIR94B/QTEOJ0AUnNZ4OHbboRN29MuDbu5hKN6hq32sxGihp5SSu3PYM3Aht3rd/xJOz7dJ7DolMQICFNRL0IC4WqzzgZiWScE9WcKMabqwYjlnOTVLZoSSsZcosQd/tOSjxvDtQkTNzqMeODg2tfbuoG+0qOttlJL2r297wDDiGanhr5uFG2+e22KCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+wH1nIEYfqdOiQ3dPqdgQf6oUWPkQnhVd95q2BX08s=;
 b=D9YC5xG7nQeeSZ9D5r3vboMWyazgToGeT51IQsABo6qHZsE3hwC1kBoWLCu8RKyFpyN1wGrjWxC0Uze1xo8vMhdlv+4k02btRHsugDzdD5PHyZm9qyOsvr78KttguuM5NjEuTe42XquZ/GJTWtNFIuQT8YMDaEPXIK/N4/45xgPvZmLIMTsG6aLxlz06nQY4UkXTHUqIbhKpt5zh/ddobkgdSSlQMTYxShMrwyYLVGciX+V6HDhYkMJitm0+K/MCCcbhMpxep0tV5QBjpF7+Im2B15jUwbf+HvMHAWwM93rOnUTBLzWJIw/OzDrDYXXxZLxhv5dPwJO9t09QxYHgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+wH1nIEYfqdOiQ3dPqdgQf6oUWPkQnhVd95q2BX08s=;
 b=J/o/3cgatfjgupA5y+JChmBzwdqNgqC56RoX21Ot65R7oHpLvzMnfNREC5bQK/OluBD/uC/Bc4dC/TkxQnlBPkQ93jC1cQ0qhx/XTrlwP7v94wICZqKLBd60oUfg0ixMtQphZ8W0+3dYNv8dMErpPwQs2FThv6H+a7YgBTHDwA8=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 04:18:38 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::8bf2:b185:cfb9:de89]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::8bf2:b185:cfb9:de89%5]) with mapi id 15.20.6813.017; Tue, 3 Oct 2023
 04:18:38 +0000
From: <Manikandan.M@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Thread-Topic: [PATCH v6 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Thread-Index: AQHZ8SfBdAZUB301qEihS7VC9aVTxbAvwDQAgAe+2IA=
Date: Tue, 3 Oct 2023 04:18:38 +0000
Message-ID: <8b721bd5-187c-6aad-39ee-e9a5ded6cee5@microchip.com>
References: <20230927094732.490228-1-manikandan.m@microchip.com>
 <20230927094732.490228-2-manikandan.m@microchip.com>
 <35d861b5-eca0-c817-684c-e39a841f17db@tuxon.dev>
In-Reply-To: <35d861b5-eca0-c817-684c-e39a841f17db@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|BL3PR11MB6313:EE_
x-ms-office365-filtering-correlation-id: a3467262-2651-4e95-396f-08dbc3c7d19b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W96jlU05Kh9Hc3eIPHPuI/rYIr5Ims/lpb6Yt8qlO35HRbUU+UjdyKVj1j+eFXWc59jjGlJQp4nLEszZB34SIHnn4ZCX8XBYmWu3jg3srf2xoyNjso5w5+Up1/Zgq6BdwTBl5mFQ5hJe4so7AjioOeURBcnR5EI4CFcWY5koNkomU//sqmusiPCzsoGM74OsfUo5MFV6Dvw8pIQjRdWGzGsRA9FTBY87J9TiwjkgAXhFLtiRruQMcLKFSIZ2WMv6hrBVLMeJiZhP/RfwrEi6C/lE/KVrx6+xfdttv4UvAzybVEB1699rRPtp6XkUeJRE+XiQBbB/bJRwxmejHXtIgWXj67WajDwcENiWOV1VaW+YXhouY70w68h9h9SXETEKRJkGapOV+QmQ2kAHEaRnLjUECJQaWX4s9mMSIuhIwXMnr4iHGOrDHc+Fe2i+8Pm0HH0gxxMVGJk0vVbUc78Y+DJsZs57ZAb1zLbgIYt1x2hGbHdjRpb1v3ZwDa4jg8WsdjOYOLtOZEKIE/r6/3E+UJ85XMS464aOi7fhu3apHXd7IlDAh2nj73Wdgz2ndfdc6ZT4AVWyPu9A7gPND1x7Q7/7wLXTpFEOpGCvnGVzwZ1S2pr7uoiW88uzRO2zi8JGkA0E5961lo2jvH08N0mXyizt+qzw6mOHvLFY38quMno=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(76116006)(316002)(66446008)(66476007)(66946007)(66556008)(64756008)(54906003)(8676002)(107886003)(8936002)(26005)(41300700001)(2616005)(36756003)(478600001)(83380400001)(53546011)(6486002)(71200400001)(6506007)(122000001)(38070700005)(86362001)(6512007)(38100700002)(921005)(31696002)(110136005)(91956017)(2906002)(7416002)(31686004)(5660300002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2IzQmFhNlJYeTBhVDFPUVR1dVpQalFzMnZXQm5Xb240VkhsckdYM1pVRW1i?=
 =?utf-8?B?amtnMEd3K25PdEdLZmhFUjJuOGpZNFR5T21wbm5HS2RleW9UekFNTVByT2Za?=
 =?utf-8?B?Q3MwR2U0b3ZCMEhvWnp5SU9qR1lDbC9QMnhRYWFkd0FXSlEwYWp2MFJTdENS?=
 =?utf-8?B?WDhaWDFpNVJhdnZjOVpJalBHQzRJNCtnbXpndHQweVF3Vnl1ejkzY2tsRlFm?=
 =?utf-8?B?Y3FobG5HR1ZpQW8vdEN5azBaaVlmN0k2dzhkaG9QdSthUXYzZjZqTVlIajFU?=
 =?utf-8?B?TE1VN2hKRXlIZENidDJZTVJwK05HSjYreDNpeGJNSVpSa3ZVZllPYTZ4TkpP?=
 =?utf-8?B?Ti9MSFVXeEo5L3NnWm1GVERQZjNoMFBaeUM2dXBqN3BMdlVhMytDTmJBQVBa?=
 =?utf-8?B?NlNVZHVGdUxIYjVUSUxXZmtFUHZSV3d5ZWVpRG5mditoUHBmL1BFNmlObjJo?=
 =?utf-8?B?eFhOUzhta3Bld1FCQzVrcHM3R01xQllneTFYYW52dmxSMkhsalFVL3BBWDd1?=
 =?utf-8?B?WE9neTM2Rjh2Qk5WdEl4KzEvQXBBTHNHTC9SWVlOVkE1UDd1SWRZRjJUZjZi?=
 =?utf-8?B?ZzllSEtDYmh0a1BubGtpNTYwTEJHeC8yS2VteDhySCtFTnlDNEVYSjlGUUgv?=
 =?utf-8?B?dWh5aFFMUVNMa3JMY3NYQm5jMXNsQk9qMG9XVTJTWk82aENBdTdYS2pFOGQ4?=
 =?utf-8?B?NUJKQTJWYjhyZitjTkVOK3Z3cmhCWWswWXZGbEc5ejVYOEVuRXZYV3hEQUhD?=
 =?utf-8?B?RkxBQzFDK3hnRk1qWkU2YjQ3c3BTNGFRRGJGR0laQ0YyNFJpdWtKdnZlaUtP?=
 =?utf-8?B?VjZ2czdjK1M2SVVSUU5sSVlVM2JUZkFPWCt3aWtaQTViR2JPb1RPMjNJdWFY?=
 =?utf-8?B?MktuNjJUSTdKQnoyL0F3d1ROdUh0NGdkaEhZcGtTMWtzTThoUTBvTDlUN3p1?=
 =?utf-8?B?SGlZN3VHY1BSY3FUenRHS1QwRmJUMnhpcmJta044aVJwc3ZNajdsMEpMSW5J?=
 =?utf-8?B?cjkrMWVQMkhNT1pEUUI0ZXpXeUJVNFdjWlpsRjhhRys1VlVKSnlvMmMyNzVD?=
 =?utf-8?B?aVlwOUd1MXZoMzhLYmQxOERjL1orSjVBdnM1Mml1WFZMellEUlF4UFprN1lO?=
 =?utf-8?B?RlpLditzOXdibzFjQ2dKMEJ2TzZjVzlqMVhLZWRHSU16ZitON0l6UWZ5SDJh?=
 =?utf-8?B?SUY2MVMvM1VTUFNTV1A1M2EzSjNXYjhuZlZxU1FVL3NVRkp6cW9aWXA5NVJ5?=
 =?utf-8?B?U1hRd0Y1SEJ2T2tsNEJjL0J1VktmcnVNa295MmtyRmg4dWMwa0FLVW9zTUh4?=
 =?utf-8?B?aENGSWR4ZmVxTktsWXRiWXZ1anRjdkhLZ2xGODZnaFRjd0Q3WmN0U2JDNHA0?=
 =?utf-8?B?OFoxaEtUWFpJQjc4R0djNGxHM3E2VnJQYytheXVtMmMweHJwbjNGb1hHV0Rh?=
 =?utf-8?B?YlluMENUL1pyRThKaEIybGZueWRkc0thSHNOTWZUVFE1UjRycjAwV3JnbThB?=
 =?utf-8?B?MFVoTkVIKzNkRU1udVZLNDNEcklOVk9aWUhuZVQ1VllnaGFGeUZMQlM5bCsy?=
 =?utf-8?B?STRXV1BwNjZONk1lQTNzS3RkM1F4K0VyakVYUFJway92RnIrUWROT3NCZzRn?=
 =?utf-8?B?eG56bzR6Y2dNZlJvSGEzQ2YvUHhoREtEcGhIbkVic2NjcGs2VGNIOERVdkU3?=
 =?utf-8?B?bjBBRG56QjdJdm16NDdHYWNRMHducGp5bjByNHVCck9FUkhsZjhJNDRjeU1J?=
 =?utf-8?B?Y0lSd3lERHloeEpoQ010MCtmL0hGR2ZtMDVGa3JNOXJCazhYWTQzNWl5Z3c1?=
 =?utf-8?B?SitaVFF2V0hNYSsrNlh5L3pMVE54VzJMSGpkMmQrYXNta3E0RjlTdmpqVXhG?=
 =?utf-8?B?RUlabUJFRG9KSFY2c0tVenFsVDczODJmS08zVm9UekZDQWpzSmV0b1BYOG5z?=
 =?utf-8?B?Z3J6Qm93allEZm5YTDJ2U0xoOWd0bEFodks2YVJnc0xsUzJKUlFNR3cwUUMy?=
 =?utf-8?B?T0ZlUEhJdUl2NHd0UzJmdzhUdmNGTE9kZ1BNTFc4SGVuWm52VFZIVEFnc3ZL?=
 =?utf-8?B?cVdqcndDZm1zZTZ5ajVBeml1SER4OWpTQ2dyaHlpeXp5cE9ETzE4R3BVQ3A3?=
 =?utf-8?Q?6jGxITLpbRKLlGA96mJNXSpu+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <940A85C27D443345A3A3E423EC700FBA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3467262-2651-4e95-396f-08dbc3c7d19b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 04:18:38.5383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qpSrmzJCGwFY/+hfh3r7IZ324C+UYbUG6iiyTO+gCei7koD+qOP8+O9QG9fHAItYoG4byCdF/PNoZvBHRLE5gw/8eTsxOXcG8HOOftktwhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDkvMjMgMTE6MzEgYW0sIGNsYXVkaXUgYmV6bmVhIHdyb3RlOg0KPiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLCBNYW5pa2FuZGFuLA0KPiANCj4gT24g
MjcuMDkuMjAyMyAxMjo0NywgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+PiArdm9p
ZCBhdG1lbF9obGNkY19wbGFuZV9zZXR1cF9zY2FsZXIoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5l
ICpwbGFuZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRt
ZWxfaGxjZGNfcGxhbmVfc3RhdGUgKnN0YXRlKTsNCj4+ICt2b2lkIGF0bWVsX3hsY2RjX3BsYW5l
X3NldHVwX3NjYWxlcihzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0
ZSAqc3RhdGUpOw0KPj4gK3ZvaWQgdXBkYXRlX2hsY2RjX2J1ZmZlcnMoc3RydWN0IGF0bWVsX2hs
Y2RjX3BsYW5lICpwbGFuZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdG1l
bF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICB1
MzIgc3IsIGludCBpKTsNCj4+ICt2b2lkIHVwZGF0ZV94bGNkY19idWZmZXJzKHN0cnVjdCBhdG1l
bF9obGNkY19wbGFuZSAqcGxhbmUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
YXRtZWxfaGxjZGNfcGxhbmVfc3RhdGUgKnN0YXRlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgdTMyIHNyLCBpbnQgaSk7DQo+PiArdm9pZCBobGNkY19hdG9taWNfZGlzYWJsZShzdHJ1Y3Qg
YXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lKTsNCj4+ICt2b2lkIHhsY2RjX2F0b21pY19kaXNhYmxl
KHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUpOw0KPj4gK3ZvaWQNCj4+ICthdG1lbF9o
bGNkY19wbGFuZV91cGRhdGVfZ2VuZXJhbF9zZXR0aW5ncyhzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxh
bmUgKnBsYW5lLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGUpOw0KPj4gK3ZvaWQNCj4+ICthdG1l
bF94bGNkY19wbGFuZV91cGRhdGVfZ2VuZXJhbF9zZXR0aW5ncyhzdHJ1Y3QgYXRtZWxfaGxjZGNf
cGxhbmUgKnBsYW5lLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGUpOw0KPj4gK3ZvaWQgaGxjZGNf
YXRvbWljX3VwZGF0ZShzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxjZGNfZGMgKmRjKTsNCj4+ICt2b2lkIHhs
Y2RjX2F0b21pY191cGRhdGUoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGF0bWVsX2hsY2RjX2RjICpkYyk7DQo+PiArdm9p
ZCBobGNkY19jc2NfaW5pdChzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPj4gKyAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2RjX2xheWVyX2Rlc2MgKmRlc2Mp
Ow0KPj4gK3ZvaWQgeGxjZGNfY3NjX2luaXQoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFu
ZSwNCj4+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBhdG1lbF9obGNkY19sYXllcl9k
ZXNjICpkZXNjKTsNCj4+ICt2b2lkIGhsY2RjX2lycV9kYmcoc3RydWN0IGF0bWVsX2hsY2RjX3Bs
YW5lICpwbGFuZSwNCj4+ICsgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2Rj
X2xheWVyX2Rlc2MgKmRlc2MpOw0KPj4gK3ZvaWQgeGxjZGNfaXJxX2RiZyhzdHJ1Y3QgYXRtZWxf
aGxjZGNfcGxhbmUgKnBsYW5lLA0KPj4gKyAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYXRt
ZWxfaGxjZGNfbGF5ZXJfZGVzYyAqZGVzYyk7DQo+PiArDQo+IA0KPiBUaGVzZSBhcmUgc3RpbGwg
aGVyZS4uLiBJc24ndCB0aGUgc29sdXRpb24gSSBwcm9wb3NlZCB0byB5b3UgaW4gdGhlDQo+IHBy
ZXZpb3VzIHZlcnNpb24gZ29vZCBlbm91Z2g/DQpIaSBDbGF1ZGl1DQoNClRoZXNlIGNoYW5nZXMg
d2VyZSBpbnRlZ3JhdGVkIGluIHRoZSBjdXJyZW50IHBhdGNoIHNldCBiYXNlZCBvbiB0aGUgDQpz
b2x1dGlvbiB3aGljaCB5b3UgcHJvcG9zZWQgaW4gdGhlIHByZXZpb3VzIHNlcmllcy4NClRoZSBY
TENEQyBhbmQgSExDREMgZnVuY3Rpb25zIGNhbGxzIGFyZSBtb3ZlZCB0byBJUCBzcGVjaWZpYyBk
cml2ZXItPm9wcw0KYW5kIHRoZWlyIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBhcmUgbWFkZSBoZXJl
IGluIGF0bWVsX2hsY2RjX2RjLmgNClJlc3Qgb2YgdGhlIGNoYW5nZXMgYXJlIGludGVncmF0ZWQg
aW4gUGF0Y2ggNC83Lg0KPiANCj4gVGhhbmsgeW91LA0KPiBDbGF1ZGl1IEJlem5lYQ0KDQotLSAN
ClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
