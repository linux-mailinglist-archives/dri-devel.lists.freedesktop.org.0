Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18157B5A44
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 20:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBC910E132;
	Mon,  2 Oct 2023 18:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FA710E132
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 18:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUBvvAt5gkLe0cnwWrst1eia6wW2kLgvysE5su7rkw8FGUt1EXjWFtHVnBJIhUtMWTPrYAY//4Svco8wSW/3Cb4dAgQjd8VB8cEVVzYF0eZ0O5KVXoLFexnK3RuLok+WuPwgddIxAhMUEG0jlu7spqOh8Iq+ZySHT4GtM9llyyCWkYxiTrcw9Av+hJuwD+8LZxSo6b/Apjc2sS4hmsDzwb+b8GGpwE0kt/VOUkYyiu4BoM0Uy+rJbH9dvDLtwy5qT3IYYm7ugEoULYmZi3mksCa0dbn+RkDsqwrInsHbowYtbTSDYE+iTJ+3dM9XjPVv9DCXLdlQbI12F9HQWiJvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8It9jv/weByGrt0hj15vQYY+xWm6fwca5UrxXRijwk=;
 b=KiL6DtYwoMmNoVUbt2e5bHnX5kezH70EBW34IoDGabSoMYsBiVmf58oOrdRK702w4kYs+HJPw16jW8DiRaKQi0NUlqxtE053BkbO8cwNd2/rLEAjIYue6+UGFnkVbUH4RsPJdAiTSvUeyTlQ1F/O7cjsgE/VXMnJ9xs+E4CpBRQaFK9ilYxBfBzFHzEHx4fWZE4wtsNWGo8rjg0nJdWYTSjE7uIbKMzm7dCoRiDqKuGqTsrPCdKaLFH9m/9gD6DufWuEvaTj5VZsCttgjQFNSOAHEvSnbhl/l36Yi+OycON8GqM/od+eQKy1eXzxHXrvYOvlYGEmg4r9vrXlKZYT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8It9jv/weByGrt0hj15vQYY+xWm6fwca5UrxXRijwk=;
 b=wcRuZWmqlgquY6MwPmgg04wtXoK28/NsDT/jf96WDDtyVC0xkMwv4G2tllgTqaeCBxoJogDiWW/AzKFxDBolq+psLlY/VvCImC+1kPbEV5OzNCdvszGN0iqoDOUOaOUOq/3PePaZSL2dvIybRcRneHOLICpNgbWNflFu9s0+Fkw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11638.jpnprd01.prod.outlook.com (2603:1096:400:378::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 18:38:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fb78:2e8c:f7f9:5629]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fb78:2e8c:f7f9:5629%7]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 18:38:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: RE: [PATCH v11 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Thread-Topic: [PATCH v11 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Thread-Index: AQHZ9Svd2GZ29yOuVkaeVjino6eWCbA2fwaAgABVGlA=
Date: Mon, 2 Oct 2023 18:38:14 +0000
Message-ID: <OS0PR01MB59220D7498FA62057693EBAB86C5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20231002122740.220177-1-biju.das.jz@bp.renesas.com>
 <20231002122740.220177-2-biju.das.jz@bp.renesas.com>
 <169625346119.1584308.6712024438150463330.robh@kernel.org>
In-Reply-To: <169625346119.1584308.6712024438150463330.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11638:EE_
x-ms-office365-filtering-correlation-id: 2fc4787a-b589-4bbe-cabe-08dbc376bd29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RaBA9IeHDDe/tq7SfhA5OHSv6EHyNrdI2s7V+LdtADkYZEJkOMXqqbC96e9rZO8wHC0j4KVhn+5F3Xxj4ay3rptzoazT65pEgyVZ7jEh/Av7CMTjQS04b5CClTJWzMjemz/yQSbS16s/Wg2wBagJxs9zJzLQnfygnm/idAR0rjONt5fIZmrdxpK8YBDX/9nVuGeVyR3aqvQdjtuC6SUhejsaUhERnyaf/NPIzz8OsKfU/oUVJcKaqpiKGOX6lk1jGSgxsfMWOd1y2xD/KghrG5A0SeXUyFpYhp09Uoo8rLk+RpGwFhku2zG2QaN8y1zEXWD/axcS5JFN4Cmv9IbmW7HKyoybLQcuwUA/IUpKo5gSRwHqhX3iJw1EK6dbrTLuAXExd9/DDlUAVM2trhyE+VG36F3FhE4QRTv/t7Hbqg0PW+laagu0NJ5FcGGAeVyK7zmktt6vC0ld7WgYJ+PRINybdjh8ggisriFjBDMYT8UITEhmwrnGr58tTW4R2qWkLpnG7qoaMZI2ll1K+mmSuAz3BtddLSZ0WVx1WUOMiPHxZSRgGosGqZK6JCDFRIgZUQXnDyqCXOzmZFR2fVWmnIVpN8IV9VeJES2Y4K0M7Zr5LkSmuf1XNCM9a/tZ12J9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(55016003)(7696005)(71200400001)(6506007)(478600001)(38070700005)(38100700002)(122000001)(86362001)(2906002)(41300700001)(7416002)(9686003)(83380400001)(26005)(110136005)(33656002)(316002)(54906003)(66476007)(8936002)(5660300002)(76116006)(66446008)(66556008)(4326008)(66946007)(64756008)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFcrMFZZMUo1QkdJR1hXYXVNMVcyUitVWGRmak5XZWljV2U5NXAzcUdrU1lZ?=
 =?utf-8?B?ODJZT2pLTFkyRHltQlgwcUFCSGNCNVU0ZC9ueDJIR3pFZ2JWZ1dIQitSOU9F?=
 =?utf-8?B?ZUZuTTBFNlc4ajhrTDJOaUdNT0tHNEorbnpGTlYrOHRaQ2hOTlVKYmd2SVpW?=
 =?utf-8?B?SHZDY2NvTmNqVTNCTWs1M1VvYXJMRFRWZFRvc09Vd2hveEI3RG5YRVZHdnBn?=
 =?utf-8?B?czNCVWh0R1BkYUxFdjIxL1QxSjV3NnhOQzFudTZwMnFkTUU0Y0t0c3lKSjBx?=
 =?utf-8?B?dm1RbWpoZWZDb0lKRzlCdS9LVG5pT3pqU0Q1OWpxVmNNbkZKenpHOHlpakVO?=
 =?utf-8?B?aVZjSytnYkZOZEZ6d3plMVhXQzVJNTEzT09tWUlqY1RoOWJsNjVQUElJdW1p?=
 =?utf-8?B?eXJCd3owS2dwWk1RM2lXYnNUMFh2amJRQkZOT3FXc0RmWTV5ZjQwdEJIRHZY?=
 =?utf-8?B?QUVlcWtBUGVwVEVYYnFlYTg3blp3emZEc3lzZVA1dFpxTjFJbVIvQzZicXdP?=
 =?utf-8?B?SVRBR2hsTkFoaHpRMHdhVXhXNmh2Mndac0JlbzBCdXQ5SEszMDA3NmIwVU1S?=
 =?utf-8?B?Ky8vRmprQWsxUE9OeWp1VS9QSWpYMHBtOFZ4SWo2bUdmM0xNOEozTHB1L0FH?=
 =?utf-8?B?WkErSXh1T1B2S1hFcUxpSnlzL0o1ckxZZWk0cktTWllkTjdUYU1VbUgwc3di?=
 =?utf-8?B?QlRmY2tWc1BaT0VaSG9rMDRmYzBGUEluaEpaenlXdG82aFppcFRTOWJEUzFj?=
 =?utf-8?B?WVh1WXFVdU1IekFnZHNjUFREUUt6RlI3SUg3Wk5pdThJcVc0bzMzK0d2UHY5?=
 =?utf-8?B?TUZMS3RSU2I3ZHBiNzlxZDNkWEZRcmFYUVRzaysxWElGa1FPalBhUFgzS3pN?=
 =?utf-8?B?cm5LSGZYU1RNNVROQTZsdmtRVTAwaXV4NEpKUGxDUlBvaFllK3VPNDEzRnBI?=
 =?utf-8?B?aGd2RnpRMWV3ZkJkNUhkejAxbXV6dUJDdmFFeC8zRm5SbE00OVpuQ0h3YXIr?=
 =?utf-8?B?Tm9wNm90ZGdmVW1SZzdjWnNZWlRYRmgvOGVqZDBvQ29KYjQzOTFTcHdCVGtn?=
 =?utf-8?B?SWtJd3ZsRS9HV0ROOGJSYUFJUXEvOTQ3dkJ4TWNMVVU2SzlFdGZsTVNHdU9U?=
 =?utf-8?B?UVJiVGlkblRYTkR4aWtwVk9lZW1DbG1VMHR1QjRJYlE5QzVSaGFVQzlwZHZT?=
 =?utf-8?B?ZXlNUGNIRXlPTloyd1RGazFRSUQyTzFCM3NsY3A1QSs5aTZWOE1qNHNuc1A2?=
 =?utf-8?B?YjA4TXBQRWlHMmN1RVU2anh5MGdGa1pLUHh0Q0Nvd3NwM1UvSm1vRFFtT3lM?=
 =?utf-8?B?dG5qWnZLTVFHQjdCUUFhUzNaVVExR0RkSjBnS3k4WjVRT0xXY2tFdnVxeGpZ?=
 =?utf-8?B?QXZnUTA3QXFnaG8xWnNaWU5QQUkxelhRUjAvM0lFaitiZG05N3c0MWJhc0lC?=
 =?utf-8?B?ZENUMjJPV3N4R3ZYS3RGOVNLQXZkdE93d1Q5U2EvRkY0MHpZN2M3RDMrbWhY?=
 =?utf-8?B?R0VYYUNQUnQxNzk0dGN2Y0l3clA0Ni9Hb2FEWXEzeDIrVkRrTUhVS2JLamlH?=
 =?utf-8?B?WWRGb1AwS2hCQkJnVHI5c2trUXBNeVN2T2prdmlFME90Y1lockJmSXkya3hC?=
 =?utf-8?B?ZXU3aHF2cDhlbGNxdkV0a2tiWjd0a2E0L3FwQzNncWlTWVBJekg2TG04MXJC?=
 =?utf-8?B?T1J0cVhuMWRuNFVKZzUzUG96VWI3amY1MFhNcCt6NDFJLzllK2Y2RkdwSlNC?=
 =?utf-8?B?M2drTTB1bkxUajdmK2FON1hUcGR3N1k3bVFOUU5JWjlGWXc3Yzh3NGF3K1RJ?=
 =?utf-8?B?TjJVT0E2czNhd1UxaEVIU3cxZ1NsWURIOUY4Wmo1RHZSL1A5SjB4M2ZuVkVT?=
 =?utf-8?B?cmFNWUdHOEJCcnFjRGpHOWkvZ0I4UWJqQ201VDJzQmkvWU1WNzZPY0VRa0pP?=
 =?utf-8?B?WWxIcit6R2RWWWtMa0p0V2hCUFBUR05GOUtQZFN4cXI0aDhZQkhZcWNQQnYy?=
 =?utf-8?B?ZzEvQ3FBSXh2bWhPSjM2d3RSa2pVc0ZRQlE2V040ZXRldm5kK3RFaytlNVpB?=
 =?utf-8?B?WjJjcDMxSktxQi9sSEw0RlB6dlJZOXhIMEZuUXFJMGZGaUMzZU1Rd2xqWStW?=
 =?utf-8?B?SUpGUDVsWm8xOWtvOHhOQXpuN2djMmdQR3NjUU0wUnNZeFNuVjgvU1doMHZw?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc4787a-b589-4bbe-cabe-08dbc376bd29
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 18:38:14.9824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rhbw/XIh4tNyazAVvqtlraIavZfHzPNpzO9I6vx7iWdghbxIhVI151aETC9Y/7FTb0wTwAAoFt5DVMFMwBcQB/7UDNz5rrdYxvrnFo3RJk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11638
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDEvNF0gZHQtYmluZGluZ3M6IGRp
c3BsYXk6IERvY3VtZW50IFJlbmVzYXMgUlovRzJMDQo+IERVIGJpbmRpbmdzDQo+IA0KPiANCj4g
T24gTW9uLCAwMiBPY3QgMjAyMyAxMzoyNzozNyArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4g
VGhlIFJaL0cyTCBMQ0QgY29udHJvbGxlciBpcyBjb21wb3NlZCBvZiBGcmFtZSBDb21wcmVzc2lv
biBQcm9jZXNzb3INCj4gPiAoRkNQVkQpLCBWaWRlbyBTaWduYWwgUHJvY2Vzc29yIChWU1BEKSwg
YW5kIERpc3BsYXkgVW5pdCAoRFUpLg0KPiA+DQo+ID4gVGhlIERVIG1vZHVsZSBzdXBwb3J0cyB0
aGUgZm9sbG93aW5nIGhhcmR3YXJlIGZlYXR1cmVzIOKIkiBEaXNwbGF5DQo+ID4gUGFyYWxsZWwg
SW50ZXJmYWNlIChEUEkpIGFuZCBNSVBJIExJTksgVmlkZW8gSW50ZXJmYWNlIOKIkiBEaXNwbGF5
DQo+ID4gdGltaW5nIG1hc3RlciDiiJIgR2VuZXJhdGVzIHZpZGVvIHRpbWluZ3Mg4oiSIFNlbGVj
dGluZyB0aGUgcG9sYXJpdHkgb2YNCj4gPiBvdXRwdXQgRENMSywgSFNZTkMsIFZTWU5DLCBhbmQg
REUg4oiSIFN1cHBvcnRzIFByb2dyZXNzaXZlIOKIkiBJbnB1dCBkYXRhDQo+ID4gZm9ybWF0IChm
cm9tIFZTUEQpOiBSR0I4ODgsIFJHQjY2NiDiiJIgT3V0cHV0IGRhdGEgZm9ybWF0OiBzYW1lIGFz
IElucHV0DQo+ID4gZGF0YSBmb3JtYXQg4oiSIFN1cHBvcnRpbmcgRnVsbCBIRCAoMTkyMCBwaXhl
bHMgeCAxMDgwIGxpbmVzKSBmb3INCj4gPiBNSVBJLURTSSBPdXRwdXQg4oiSIFN1cHBvcnRpbmcg
V1hHQSAoMTI4MCBwaXhlbHMgeCA4MDAgbGluZXMpIGZvcg0KPiA+IFBhcmFsbGVsIE91dHB1dA0K
PiA+DQo+ID4gVGhpcyBwYXRjaCBkb2N1bWVudHMgdGhlIERVIG1vZHVsZSBmb3VuZCBvbiBSWi9H
MkwgTENEQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydA0KPiA+IDxsYXVyZW50LnBp
bmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4gPiB2MTAtPnYxOg0K
PiA+ICAqIE5vIGNoYW5nZQ0KPiA+IHY5LT52MTA6DQo+ID4gICogQWRkZWQgUmIgdGFnIGZyb20g
TGF1cmVudA0KPiA+ICAqIFVwZGF0ZWQgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gPiAgKiBV
cGRhdGVkIGRlc2NyaXB0aW9uIG9mIHRoZSBwb3J0IGJ5IGRyb3BwaW5nIHRoZSB0ZXh0ICJzcGVj
aWZpZWQgaW4NCj4gPiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgu
dHh0LiINCj4gPiAgKiBEcm9wcGVkIGVtcHR5IGVuZHBvaW50IGZyb20gZXhhbXBsZS4NCj4gPiB2
OC0+djk6DQo+ID4gICogTm8gY2hhbmdlDQo+ID4gdjctPnY4Og0KPiA+ICAqIE5vIGNoYW5nZQ0K
PiA+IHY2LT52NzoNCj4gPiAgKiBObyBjaGFuZ2UNCj4gPiB2NS0+djY6DQo+ID4gICogTm8gY2hh
bmdlLg0KPiA+IHY0LT52NToNCj4gPiAgKiBBZGRlZCBSYiB0YWcgZnJvbSBSb2IuDQo+ID4gdjMt
PnY0Og0KPiA+ICAqIENoYW5nZWQgY29tcGF0aWJsZSBuYW1lIGZyb20NCj4gPiByZW5lc2FzLGR1
LXI5YTA3ZzA0NC0+cmVuZXNhcyxyOWEwN2cwNDQtZHUNCj4gPiAgKiBzdGFydGVkIHVzaW5nIHNh
bWUgY29tcGF0aWJsZSBmb3IgUlovRzJ7TCxMQ30NCj4gPiB2MzogTmV3IHBhdGNoDQo+ID4gLS0t
DQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbCAgICB8IDEy
MSArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyMSBpbnNlcnRpb25z
KCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+DQo+IA0KPiBNeSBi
b3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5k
aW5nX2NoZWNrJw0KPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2
NS4xMyk6DQo+IA0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IC4vRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sOjY0OjEx
Og0KPiBbZXJyb3JdIHN0cmluZyB2YWx1ZSBpcyByZWR1bmRhbnRseSBxdW90ZWQgd2l0aCBhbnkg
cXVvdGVzIChxdW90ZWQtc3RyaW5ncykNCj4gDQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJv
cnM6DQo+IA0KPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3MpOg0KPiAN
Cj4gU2VlDQo+IA0KPiBUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxh
dGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kNCj4gc2hvdWxkIGJlIG5vdGVkIGluICp0
aGlzKiBwYXRjaC4NCj4gDQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2No
ZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBzdXJl
ICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8NCj4gZGF0ZToN
Cj4gDQo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVj
ayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYu
IE5vdGUNCj4gdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBm
aWxlIHRvIHNwZWVkIHVwIGNoZWNraW5nDQo+IHlvdXIgc2NoZW1hLiBIb3dldmVyLCBpdCBtdXN0
IGJlIHVuc2V0IHRvIHRlc3QgYWxsIGV4YW1wbGVzIHdpdGggeW91cg0KPiBzY2hlbWEuDQoNCkkg
d2lsbCBzZW5kIFYxMiBkcm9wcGluZyBxdW90ZXMgDQoiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZS1hcnJheSIgYWZ0ZXINCnRoZSBkcml2ZXIgcmV2aWV3Lg0KDQpDaGVl
cnMsDQpCaWp1DQoNCg==
