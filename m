Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1777CD7EB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E779E10E0A7;
	Wed, 18 Oct 2023 09:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA76B10E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1697621193; x=1729157193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SZUGwkKxAaD9kCXxWfJe14NijipXvGUYKoIbWyoLbag=;
 b=RDbxjFwuaG7Ur4rEqwCsQ3rDGwYmhCDFZrOShs932uEvEVt6vAo1oPaW
 DFb2fPiWJGMrqpDf5KhC8vhCkNvC+eBk1pJZiQcWTUadn0mdTcwZsEcZ7
 yUQ4/MqZkq5HsUwv77EQqm8OEPYnpGZx2OxyWBJrIjP3qxzFWUp4bfGOz
 O5p6pc1IoIautoJ2kSFAedAwOXmT4k4H9HKR0Lz7z1inLkxdcsLYqmBW1
 /WdLMV1WQx+CDTnXbiP+qJAQCPfKK1KwVk/cv18qWjZOQKhczsYV6/zL9
 yRp919OLdyYCqRwPhSaDAHzJq4nmViF1pxVyLgazTXBEs0qEc5UxDGWkE A==;
X-CSE-ConnectionGUID: Eam252QJR7m7oioRypsZ3g==
X-CSE-MsgGUID: 3BfHpZOiRrSk04wt3PJHgA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="10174520"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Oct 2023 02:26:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 18 Oct 2023 02:26:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 18 Oct 2023 02:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh2mFFxYACGGvjrHvoSbUHVNWNwdmrIc+kFIn25DNE0uPiuCX09xvWDcGP/M9pZlnWAsTeus3EBpA1mwFiSI80Hh8gTJ2GVzABjN36uxf1CSOSzqBBqlKNOr151hJnW90uynQjldQeCvZXynuGsR7TJAWMNa61/vZ2k/+QS0HObls0BEj6nVkmSawr8RlLNVJUbjMcdPdkRo8Drz8Gzf2zbMbGvsST7oRMjTE0djwsAsseiEHj1uT2dk4XSXIBl4oU54zzUplmde0HR5TUoV/sJEcqHnfhyKhDMlZV3WO1RRyUq1YHAAHDk/RQSHmoV+HY9jix8frMm55qatzzhEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZUGwkKxAaD9kCXxWfJe14NijipXvGUYKoIbWyoLbag=;
 b=hOxdrRQkMuFfcDc8zoIlBh7X2e3szdS2XkMtrPU16DB7U2R75unKvbAgDXI+iVncdA0gpjZkCaNwVdWBxtYzf8sT1lnPgNK6gAQEsGmUO0JQ2i0DfcuZUP0oSdmyFAVH6z+IjLaxr1UnLrQxfkzaFDrdqgyKZ7G8LnmCT85WvCw+6p7UPF7Kt6vTsp1XWlfjSpB0rRgW1ix05S74OamwBtSuHXconlhptAno7DGpo/w5mJT0m7NEwnYOfV0jPiUWgC3C9rnLlmbR1UPXHVS+qIrzzp8ofiWrCNttJEYHfA8ljCB0wPgdUt/O8ZlOJniDs/xbkvpFgHcdqwR8VAsR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZUGwkKxAaD9kCXxWfJe14NijipXvGUYKoIbWyoLbag=;
 b=sO0oQDBavt1f+g3xpTmKd780aLDndnzeV6PI/SHXlP1Rgg6Qs+FJjLfWCewsq/DUJxSejQmFHnOj+eMjDkSBL5codh6QmymuT1ydgEji6qMDjSSDkHwXSEgmUxq4kHAEyb6E2mIrNdNx/oms/XUJ9fJVHI7LKEixrH6GyetDzSg=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.40; Wed, 18 Oct 2023 09:26:10 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::1425:fc01:8643:52c2]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::1425:fc01:8643:52c2%6]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 09:26:10 +0000
From: <Manikandan.M@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/7] Add support for XLCDC to sam9x7 SoC family.
Thread-Topic: [PATCH v7 0/7] Add support for XLCDC to sam9x7 SoC family.
Thread-Index: AQHZ926Vi/u1hgL2SUqXs/Ixl496grBPW2SA
Date: Wed, 18 Oct 2023 09:26:10 +0000
Message-ID: <5bb79c47-d378-4a3e-a7cf-c577d3e86ec2@microchip.com>
References: <20231005092954.881059-1-manikandan.m@microchip.com>
In-Reply-To: <20231005092954.881059-1-manikandan.m@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|DS0PR11MB6350:EE_
x-ms-office365-filtering-correlation-id: 9f1bda18-d594-4326-338b-08dbcfbc43bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9O7IGGARXjLonU55Fq8KnYzkqsA1EJEVlfTLNtrTlE/uTT1ir2jb7zkxB7oMnDuFaO7M1C1l6ok/ibcu1OFR/0S30udWUxfa/eNd3I2SZr3wUWjkeWSEOP0YrZxDoNURmUMfn2bLpVGA5jkoHACwtGm6jactwJDgoZvNYsGC9aT0TOmD3o/SDbiPS9sZoqezTA9I7DQE9k2paOa01+EkHde9ch3AB+Pz1eEqw/VL8HUsQLZj7bsAZutEb12ysxAo2b8N41BBY/xyXVjI7uwSOa+CW7xmi2alQjk8FbBULvgBKtbreOjO3hQcTBKkhGEmSZ4rWdh+/3w2wVBPPua9QBHFBIAEiVgcS7U8nE/rv2+yDL49kfTeKMu7pGi2GqOgjm6bX0tT5GHdae24zAYB4txP1uUF9HTFqIuflq9TA5bg3OEdrqfGKrW9j349K+ULWDE26Ic7jd85FmpnFH7YS0zfrxwJG/hSxxLuEAUngMSyZXupbW1c5jbeMdFmT0GrHVi17nXgPYDiRVUgcCMIh749F1qOyxZ3kiM8wkzqKGxY72NftgGijf9hgiVXuOm9fl/tyFDxmaC7+X5LSGlwlav+uCfllcQQl7NGTKhGaJFhnGb2RHlob8YMeDPnQDuojbvFgo0RYeiUt/+asmOFMTeg3QWtowsQRzhsOYdm92o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(83380400001)(38100700002)(107886003)(6512007)(38070700005)(36756003)(2616005)(122000001)(31696002)(2906002)(86362001)(316002)(110136005)(91956017)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(41300700001)(5660300002)(4326008)(8676002)(8936002)(478600001)(6506007)(53546011)(71200400001)(6486002)(921005)(26005)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVhmQzhUZGg2QVhTVDl2dVZWcWNNRlBHWDdXRDJMdkZLTzMwL3pSQzFjK3c4?=
 =?utf-8?B?RWI1Y1JrcVg1VGxKeHlNVVY2THBSU1Axb2FPY3Rtb0pCeXJuMW1oYnNUVElH?=
 =?utf-8?B?MXlwd3pLb0ZQUHBPTHZ2WFFZa3lxcVFWa2crYWRoeGNJaklJbEY5K05LUytF?=
 =?utf-8?B?S29kLzVmTWJkdVc1cUlSdEZBV1hnTW44QVZSUnJsVWMxaFZOb3h4Tnk5KytR?=
 =?utf-8?B?S3RVUHZReWg0TC84ZFFXNWErSFY0b1ZXanNqZmNSTGZjWGFEam9GWm1uTzB5?=
 =?utf-8?B?UXJGZEZrQlMyZDZ0Mjh3bVpwQ0REZzJjaTRZUkZ3dGJzNHQwcDZqMTRVdXlN?=
 =?utf-8?B?T0ZrRUc3NTZ5OFJuMEI5VmpRME84c3c3RnhLWFpjQlZuNkRJRUVOeTM1aTJ5?=
 =?utf-8?B?RkJTUGxPRGtRUVkwNkZGa0xYbU9SQkJERHJpbU5mejdydFh6RU9paDIyOVBR?=
 =?utf-8?B?QU8yaXZSZjQ5Y1l4cVRMeWpoZ3dyTUJkK1NWR0hCTElPV21nSzR3ZGxhdFR2?=
 =?utf-8?B?NjA0YWROdEtLT1FvTElHYUVyZXF6N2RzaElUTm80a1lQTTRqN2loblBKSUEz?=
 =?utf-8?B?aEorMDVjQk5vRjEwUFpqMnFqVWNUNWJoTlZHVko4cnNCNWxDa3ZFUmVYdzFK?=
 =?utf-8?B?VHRGclZOQzJuTXBxaEVYYkVLNUU1aVpPaXpwZVlOS1lFNVk0KzFKTlRKUEt0?=
 =?utf-8?B?dDF5WTBubEVDTnplczBXcCthNjk3UzVCQmVRVUFNYU9kNXA1SnRDdlRoVVJO?=
 =?utf-8?B?eXhIY09FcDI0TENrdEg0VmpGWmV4cm1XeG9lbkJtNm9pNnM1RU5VVUNWOGNL?=
 =?utf-8?B?cDNra1FKazFzRHVyZnRXTEtFOVhvWnRXY0s0THBJdEJQZ2lWU3ZWYUs1cklW?=
 =?utf-8?B?YVl2MG1FVlppUTlZSDI0dWJHZDNCUDRmMDJJZ0s1RGFwaGtmRENtVk0xbWlC?=
 =?utf-8?B?QUxKWkRWcTNvbjNMVlVySHpYNmdqK2RweG9CeWlVVjJZRXB1WmNRUDNGRjFr?=
 =?utf-8?B?ZnJKdlJ2dDZ3OWJUZ3JCamE5S2Npc0xhSVJwN2x3anlFMTRtMS9lZHRoKy96?=
 =?utf-8?B?NW53dlJseXcrOHo2Z1VZaHUyUGd4dkJwOS9ya1ZaZHdabVpZTWV4bFAxYjNV?=
 =?utf-8?B?ajlGa3VzU1dpVEtaYmxHcjdCUlVSRWNDeUxuUGl3NmI5MEpIeTZOc21aVlRm?=
 =?utf-8?B?cFQvaHp0eU94aG9hdDY4S28rdThHL0pGQkl2NHNRRStOalpEVUdhalRrcjc4?=
 =?utf-8?B?VlJZYzRONEFtVWtZd2pqME1BVk5ic0crRGN5bzQvNlJvSTh6SXRweHBzaStM?=
 =?utf-8?B?ZCt6WnhmeXVBSkwvSG9zMXQ5TEd3Mlk0encwUVZ5Zk9lL01KZFltMEg2REw5?=
 =?utf-8?B?VFVOUkxncmtrQ2RPMWN4bGpOZFpTbXZVT1RVVHVQd0dpYVZzMWJSK1crUjBC?=
 =?utf-8?B?TC8zdmVKRWJzbUdtSFNqVElIcC9maUcvVy8rR0ZaUFloTzVTWDhZQy8reElC?=
 =?utf-8?B?MGxiS2VTNWhxVjc5cVFKaWtpNUxsRVpNT3Z5UWlxVzRRTDYza2ZJWUZYZS9Z?=
 =?utf-8?B?RlNBcXFTcG1FQ1dKU2Q2cXdxS1N1c1B0cW5RQndOS00zdGQvcDUyamNNc2h2?=
 =?utf-8?B?d2ZoYjZwZmx5b3JvTVVnNnNEeGVXQWlTK3lNbHZIT09kZDVKTEVqUFQ3K0p1?=
 =?utf-8?B?UVJPR2pKSW5ocDYvV0g5VGh5QlcwTkFCRnZUaVJmYlpYdjVBcUZWNk1FTFA4?=
 =?utf-8?B?cHhGelViS1pXYitCOFRYbEdmVVBxNm04LzBMNWE4YXpqRWFrQ0tPbXBqMzEx?=
 =?utf-8?B?UmFZNENNSGl3NGdrdkhEOGc4dkt4ZVhRK1Q2dEszclNqdllkRHY0RmR3QlQ5?=
 =?utf-8?B?ZG14UWZkdGtjcng3aXFNRmg4MTRkY2l4Q2JSY2hmZzFDbC9BcWg3dFFES3E3?=
 =?utf-8?B?ZTVTRUVaTFRhOG5WM3lvRmU5WFl3SWhVREFtYXJmMmg4TGxwOWZjMUkrZVpM?=
 =?utf-8?B?Uk43Z0h4OU5qVGlWa1YrWkF4MTVTSmZVUXk2dE1jVGFpbVArN200ZGw2U2ZF?=
 =?utf-8?B?QXJTSS9tbmpXeXcwNDM2Lzk2alUvSVRhd00yQlFWd25IZGttSzhuUVZyV1hY?=
 =?utf-8?Q?LWwV2NZ0IptCLTqp/In87ZkPB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82FAB822CC2D524DB0E317635CBDB8AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1bda18-d594-4326-338b-08dbcfbc43bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 09:26:10.0196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRy9pk6GSGfaa7ecLDYEqMKLtw7IH2Vf1SOv5sRdMQ5I7omS/Y+JZ5NF9atpkxcnJi6OM+DtYmI8DIV7jArT17O4plVYnVxK8pTkqF045uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

T24gMDUvMTAvMjMgMjo1OSBwbSwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IFRo
aXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIHN1cHBvcnQgZm9yIFhMQ0RDIElQIG9mIHNhbTl4
NyBTb0MgZmFtaWx5DQo+IHRvIHRoZSBEUk0gc3Vic3lzdGVtLlhMQ0RDIElQIGhhcyBhZGRpdGlv
bmFsIHJlZ2lzdGVycyBhbmQgbmV3DQo+IGNvbmZpZ3VyYXRpb24gYml0cyBjb21wYXJlZCB0byB0
aGUgZXhpc3RpbmcgcmVnaXN0ZXIgc2V0IG9mIEhMQ0RDIElQLg0KPiBUaGUgbmV3IGNvbXBhdGli
bGUgc3RyaW5nICJtaWNyb2NoaXAsc2FtOXg3NS14bGNkYyIgaXMgZGVmaW5lZCBmb3Igc2FtOXg3
NQ0KPiB2YXJpYW50IG9mIHRoZSBzYW05eDcgU29DIGZhbWlseS5UaGUgaXNfeGxjZGMgZmxhZyB1
bmRlciBkcml2ZXIgZGF0YSBhbmQNCj4gSVAgc3BlY2lmaWMgZHJpdmVyIG9wcyBoZWxwcyB0byBk
aWZmZXJlbnRpYXRlIHRoZSBYTENEQyBhbmQgZXhpc3RpbmcgSExDREMNCj4gY29kZSB3aXRoaW4g
dGhlIHNhbWUgZHJpdmVyLg0KPiANCkhpIEFsbCwNCg0KSSB3b3VsZCBhcHByZWNpYXRlIGFueSBh
ZGRpdGlvbmFsIGluc2lnaHRzIHlvdSBtYXkgaGF2ZSBvbiB0aGUgcmVjZW50IA0KY2hhbmdlcyBp
biB0aGlzIHZlcnNpb24uDQoNCj4gY2hhbmdlcyBpbiB2NzoNCj4gKiBMQ0RDIElQIGRyaXZlciBv
cHMgZnVuY3Rpb25zIGFyZSBkZWNsYXJlZCBzdGF0aWMgYW5kIGl0cw0KPiBkZWNsYXJhdGlvbiBh
cmUgcmVtb3ZlZC4NCj4gDQo+IGNoYW5nZXMgaW4gdjY6DQo+ICogRml4ZWQgQ29zbWV0aWMgZGVm
ZWN0cy4NCj4gKiBBZGRlZCBjb21tZW50cyBmb3IgcmVhZGFiaWxpdHkuDQo+IA0KPiBjaGFuZ2Vz
IGluIHY1Og0KPiAqIHJldHVybiB2YWx1ZSBvZiByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQgaXMg
Y2hlY2tlZCBpbiBmYWlsdXJlDQo+IGNhc2UuDQo+ICogSExDREMgYW5kIFhMQ0RDIHNwZWNpZmlj
IGRyaXZlciBmdW5jdGlvbnMgYXJlIG5vdyBpbnZva2VkDQo+IHVzaW5nIGl0cyBJUCBzcGVjaWZp
YyBkcml2ZXIgb3BzIHcvbyB0aGUgbmVlZCBvZiBjaGVja2luZyBpc194bGNkYyBmbGFnLg0KPiAq
IFJlbW92ZWQgZW1wdHkgc3BhY2VzIGFuZCBibGFuayBsaW5lcy4NCj4gDQo+IGNoYW5nZXMgaW4g
djQ6DQo+ICogZml4ZWQga2VybmVsIHdhcm5pbmdzIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJv
Ym90Lg0KPiANCj4gY2hhbmdlcyBpbiB2MzoNCj4gKiBSZW1vdmVkIGRlLXJlZmVyZW5jaW5nIHRo
ZSB2YWx1ZSBvZiBpc194bGNkYyBmbGFnIG11bHRpcGxlIHRpbWVzIGluDQo+IGEgc2luZ2xlIGZ1
bmN0aW9uLg0KPiAqIFJlbW92ZWQgY3B1X3JlbGF4KCkgY2FsbCB3aGVuIHVzaW5nIHJlZ21hcF9y
ZWFkX3BvbGxfdGltZW91dC4NCj4gKiBVcGRhdGVkIHhmYWN0b3IgYW5kIHlmYWN0b3IgZXF1YXRp
b25zIHVzaW5nIHNoaWZ0IG9wZXJhdG9ycw0KPiAqIERlZmluZWQgQ1NDIGNvLWVmZmljaWVudHMg
aW4gYW4gYXJyYXkgZm9yIGNvZGUgcmVhZGFiaWxpdHkuDQo+IA0KPiBjaGFuZ2VzIGluIHYyOg0K
PiAqIENoYW5nZSB0aGUgZHJpdmVyIGNvbXBhdGlibGUgbmFtZSBmcm9tICJtaWNyb2NoaXAsc2Ft
OXg3LXhsY2RjIiB0bw0KPiAibWljcm9jaGlwLHNhbTl4NzUteGxjZGMiLg0KPiAqIE1vdmUgaXNf
eGxjZGMgZmxhZyB0byBkcml2ZXIgZGF0YS4NCj4gKiBSZW1vdmUgdW5zZWQgTWFjcm8gZGVmaW5p
dGlvbnMuDQo+ICogQWRkIGNvLWRldmVsb3BlZC1ieXMgdGFncw0KPiAqIFJlcGxhY2UgcmVnbWFw
X3JlYWQoKSB3aXRoIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dCgpIGNhbGwNCj4gKiBTcGxpdCBj
b2RlIGludG8gdHdvIGhlbHBlcnMgZm9yIGNvZGUgcmVhZGFibGl0aXR5Lg0KPiANCj4gRHVyYWkg
TWFuaWNrYW0gS1IgKDEpOg0KPiAgICBkcm06IGF0bWVsLWhsY2RjOiBEZWZpbmUgU0FNOVg3IFNv
QyBYTENEQyBzcGVjaWZpYyByZWdpc3RlcnMNCj4gDQo+IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFu
ICg2KToNCj4gICAgZHJtOiBhdG1lbC1obGNkYzogYWRkIGZsYWcgYW5kIGRyaXZlciBvcHMgdG8g
ZGlmZmVyZW50aWF0ZSBYTENEQyBhbmQNCj4gICAgICBITENEQyBJUA0KPiAgICBkcm06IGF0bWVs
LWhsY2RjOiBhZGQgTENEIGNvbnRyb2xsZXIgbGF5ZXIgZGVmaW5pdGlvbiBmb3Igc2FtOXg3NQ0K
PiAgICBkcm06IGF0bWVsX2hsY2RjOiBBZGQgc3VwcG9ydCBmb3IgWExDREMgaW4gYXRtZWwgTENE
IGRyaXZlcg0KPiAgICBkcm06IGF0bWVsLWhsY2RjOiBhZGQgRFBJIG1vZGUgc3VwcG9ydCBmb3Ig
WExDREMNCj4gICAgZHJtOiBhdG1lbC1obGNkYzogYWRkIHZlcnRpY2FsIGFuZCBob3Jpem9udGFs
IHNjYWxpbmcgc3VwcG9ydCBmb3INCj4gICAgICBYTENEQw0KPiAgICBkcm06IGF0bWVsLWhsY2Rj
OiBhZGQgc3VwcG9ydCBmb3IgRFNJIG91dHB1dCBmb3JtYXRzDQo+IA0KPiAgIC4uLi9ncHUvZHJt
L2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyAgICB8IDE3NSArKysrKysrLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyAgfCAxMDUgKysrKysN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuaCAgfCAgODYg
KysrKw0KPiAgIC4uLi9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMgICB8
IDM2OSArKysrKysrKysrKysrKystLS0NCj4gICBpbmNsdWRlL2xpbnV4L21mZC9hdG1lbC1obGNk
Yy5oICAgICAgICAgICAgICAgfCAgMTAgKw0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgNjQ3IGluc2Vy
dGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMs
DQpNYW5pa2FuZGFuIE0uDQoNCg==
