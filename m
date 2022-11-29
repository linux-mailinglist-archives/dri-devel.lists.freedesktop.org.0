Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6263BF33
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9510E3B3;
	Tue, 29 Nov 2022 11:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F610E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBSTrkY5uzpKgCATWzE7d/hTyx4GXrGMMTTJwi2szfkg7P3Y4O7Lsz1rufxHBvRv7mPG5Se3lRoHac/vAzaGBrORWC46OHI3qOQrvJY7NGiAryBJsD2qKrvGtSB0aIYPaLqNYiqd7igEe+Xm6yAcOegEE5Ipmfi+wujZRyA3QbPO0aEyFz4mNxyRYV/INWB9dtyvDaFf8SPM+GppsGBleo0nwZYwM1IFdXZ2QuDZx4dtNdUuhg21PGBnXf38sKbuUFLoRtpHy8QVmnYtsUhaiMRwyzFfIyvPYM4FPnAzXRL98tp+BEW4u53Q5624e6D0nQHaACA/liOCmajD5Hg2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEsXAPv06wU1hfDEkjjQRg37BAm8GUQ4UBEf1CgYduI=;
 b=WK1NSA9ZyP+SEIYA25n0Wk3KW1GH2oT3jz6+OCsAEDAGw7fKrkkLkHd7v8xHVf8+UtDSCSe4ZyV908QijpcG6/BPGeWoS0bae36QZueGfJ0xiAZ+Zq4kL5Lje0E/SnUaw4BA2MZlDpXWEUq/eqVnxxhwX5Xd+Z8Rrst1mNqEzqBVRxSexatCOp5d/XNnWgxxXqFwr905Y9uOYHQxCU3H/zSELHlnkXzrzuoE5m8MijG4nIKn+ya2sammB02Bn0Auyk+SzzZjlqal4HdT5g8ItfeFtQV4jD5ekhQWwuEafVFR3TkZeDh0/0uu+DA2GT5d53/z7yZgpLtoJsfIxFlGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEsXAPv06wU1hfDEkjjQRg37BAm8GUQ4UBEf1CgYduI=;
 b=oi0V3Fcr2Fwkg3wskap53gwXdCoQHu+Tvk9k3z+DU4Kt7uv7X5Yt973zIKDtjinxZh0CBhhGJsau7frQ4CPNsZZWDNknT33DT0XrvarSCkaLCEQiWboyryYbpIqrjrWtYQQd2JT+7haNShChowY+H7sotYhsw8ETd53iIVMqtq0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9668.jpnprd01.prod.outlook.com (2603:1096:400:220::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 11:40:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 11:40:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 7/7] drm: rcar-du: dsi: Add r8a779g0 support
Thread-Topic: [PATCH v2 7/7] drm: rcar-du: dsi: Add r8a779g0 support
Thread-Index: AQHY/wla4krYHqfwak68LJksVm8x9a5VK4AAgACiRgCAAAKU0A==
Date: Tue, 29 Nov 2022 11:40:12 +0000
Message-ID: <OS0PR01MB59224C2B4F889534922ACFE186129@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221123065946.40415-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y4VlHIpS9UnvWwt/@pendragon.ideasonboard.com>
 <d11033df-e103-e33c-c61a-a0725f7098b1@ideasonboard.com>
In-Reply-To: <d11033df-e103-e33c-c61a-a0725f7098b1@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9668:EE_
x-ms-office365-filtering-correlation-id: fe7a34e5-4d6b-4610-ce1c-08dad1fe7a18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZNVmVW2WGi8f/mrUu85NHJ1QtModFzbwV81GbNfgYYo+kjjLO8o1qzHcBJG4K0AyP3ySldYyELecYUYMNeDlCIhfwVLn45xXXk4ik4/j8CQMMdIpDh+5Llu9YkDbvA3UDaQPUU8KnWGdam57+aTEHNhTVXPpyRk+/p42f87sUaOAreigYkEu69XQUh4Hkj4ch2/v8bFVi5GmGVHK+VwqHnOR2927R1ZhhvwFiNenxarnnvb2VMKJMnwJA+QkKBhYqrPLesNPJCcphP9c0okQzfUzMmtVfW1neBiDqsGQ9zhBRnaRbxv+pLqJkTuiygeLVERV6MALn8vQkD+JrnW6ct1uyOhcExghVNXX6CE/USpTb7xkJY9jYx/mooyMdaaaGNDrUf04ylWJ7GwxzXYVVM0dr98WTCb5RaGAmbq73943/UOcGaJSkMpwVlVY29EVzK1+su0JREWFPXAInJyly6TuCI0H4nl+TJi6W0wwnV/afVEKXRYxycOjWbfFRLw5HrPEEszXdtAA6xKvupmBBKsyiZ/+PGHop7OaEFc402XEAn1QBdy7utklpaXwUsPfnIfBOVQTYFBURv6G03xM3QS2EjZRkoXHog7dhIYk6haLVrUGDQECQgnolZP/dTKKDC/nxHufoNFfq7rU6fw0y08Y4DQO7lf1VTLMCX9vCd/N5bX0xB/etN/OLWOHKuE6Jjp01qtrfJ+AlgEuSqura0sT02MzvpBERIAi3TAwSEI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(38100700002)(966005)(478600001)(41300700001)(4326008)(66476007)(64756008)(66446008)(2906002)(66556008)(76116006)(66946007)(71200400001)(8676002)(86362001)(122000001)(316002)(55016003)(110136005)(33656002)(7416002)(8936002)(38070700005)(52536014)(5660300002)(54906003)(83380400001)(186003)(53546011)(6506007)(7696005)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkdaWWNsNWhSTis5bXF0VTBGeUNHTkF1SnFwUlhES1hFK1pYbFZnc05pMUli?=
 =?utf-8?B?LzZGNlZGNjdGZDVmNXhqdFdPTlRsQkE5UEd5LzkrZk83Vkd0VXF5aE1FdGhJ?=
 =?utf-8?B?bjk1TmYzMHpnZ09CV21IeWZsQ0VnS0xsT0IvN2gyRW9obm1ZTXJ4d2JheUNB?=
 =?utf-8?B?MWRndG9ieUVsbk42Y1dZZU53NUJpK3NGajIrdWEyS29tTzd0SWRBMFplZFBu?=
 =?utf-8?B?dFVJbHNmR0tHektpQzNQOUxkN0FiY296WUE5U1VxM01IajVpY21HZTZlM1BR?=
 =?utf-8?B?aFhTM1YyOTg1OUp1NWhTS0J0dGkxZHhleU05anBkSUpFVko4ejVpQWxWODZN?=
 =?utf-8?B?SWhuQUhHaUVuQ0ozWUNaSjFMeFcwcTNseWhPaGprQjBNbzZUdkNjK2E3UzNU?=
 =?utf-8?B?L2pQTmhXZ3dIVWpLTlQ3d3hZVmx2MkZyUlFNd2REQnpVZys5TDE0aXFEK1Fk?=
 =?utf-8?B?YzQxeTFDSmpaUDdwMFQ5dXpiNi9lam4vcGwvY2VyZlNPbHdjazZzdXozejdr?=
 =?utf-8?B?a0Z0dDlvUDZZN083MmpxOVU2QUxEYmNkL0FxcW9ldnZTeDIrUmtJTFlzYU4x?=
 =?utf-8?B?eDVsSzV4ZC9VNmIvdDJtWkJzeG40YVhTbGFoby8wcEtnTCtadFdCYTQ3dHdZ?=
 =?utf-8?B?UzZEQ29NUEF1TWFBamNzM3N0ZjJKS3lUc3RNbGxYQkJjajV0VGEydXJGL1hi?=
 =?utf-8?B?WTYyMEszaHVsV3F4bWhKLzFnVHcxUmVvWGwyUDZXRXhjaERuMFk0dTY2NXZQ?=
 =?utf-8?B?MGczdjNZeEpkbXQ2c2NZUmVWV21TUi9aSkl0MVVlZVpVNVlQQzJwdVF2L082?=
 =?utf-8?B?dkJQNUd5TlZXQitqR0dDbnIwV3YrTVZjMEZ0TEFFYXJ4YmJ6akVwZE9pLzZq?=
 =?utf-8?B?aUltdEJpVVdWLzhmTWZ0eTN3N2E1OFpud2pRR3FXMGtPVHdJUkgrQ3MrY3NR?=
 =?utf-8?B?UGJWc0hKSlg2NFRaM1hFRXZsK1B0TEZFMjRSYm9jekUzOEU2L2JNM0dBM0dN?=
 =?utf-8?B?a1FjbTVObmpVV1E4M0E5SlFVZVNYUFRvb1plYzQ2RVFLQytXUWNCdXJLYTRI?=
 =?utf-8?B?VjZXWWtQTmJEbVpPSzAwZys4bFU5M2pvYUhoRVdmRkt0MHVLNFd6cmtSQzV0?=
 =?utf-8?B?N0dJMWVObFI4M0NXckpRQ1VsVy9QM1ZOTkh0Uk1jQ0tzQU1jRFJwU0hPeHBl?=
 =?utf-8?B?QWRrd01TdUpRQ21FYy9FdUUwVHVFOTBZelUvVXVVUGpEZVV3MjYzQ1dhWWJ4?=
 =?utf-8?B?R1BLZVB5aUlkQ1NQRDlWWlBWOWlVUGxaZjNuOWtzY09XT0lDYjExdkVtM1Jy?=
 =?utf-8?B?VkhkYVg4YnZYSVRRVVJGUGNMK3J3bDZUcDZPcWZsMVowRHU5UnZ0akw0N01Z?=
 =?utf-8?B?VXRSYk54Ri9JcnA1RXJ5RHJ6NmRVd1c4am1Jem5Pc0JsUTBwbThYcVdtakNj?=
 =?utf-8?B?VG5hQkJTdm1kK08yUzVuRGlQUEhyMTlaYjJpQjZRMVZramZNekozSGVxSDFn?=
 =?utf-8?B?U1hyVnpVSFcrakY3K3UzZ0VoWE9LdUF6MG8vdDZwK25ZTUMrSUxsK3NNQmVz?=
 =?utf-8?B?Y3A5TGxvbFRDV0JzN3VCTHRWT2ovaXdweUdxV01jRUNiWTZpdWMwdjFGN3I2?=
 =?utf-8?B?dWtYUm4vakR6ZWFvUXF5SitweGh5Z2pBOUpBc1laWDFwNmw4NVYvWFBWZVRp?=
 =?utf-8?B?Z3AxcXlzWU45anlSdVFpeUlMZDkzQWlXRnlJbjRaS0xwV0p1QWRILzBQdzk1?=
 =?utf-8?B?clI5Qm54L3daV2I4blJJNk9YMzY1LzJxZGpoNHh0NklzbW84VDdMUkNBcUNl?=
 =?utf-8?B?elFIeWN5RnplSENmVjlqOVBSeDVhTVo3b3liN0dSQ3prMDdBY3hwQ09WZDVM?=
 =?utf-8?B?Rloxb0hkaDJyTDhJK21BWFFHaVZ5dWwzSWtLMXdqRGRiajNoTERLT1dTOGRN?=
 =?utf-8?B?a0dKd2Nybjl5dXFURFBJZW5TelpKYXNjMTBtU1Q2dytOd1JzclVSRzlLQWtw?=
 =?utf-8?B?MjhlZjhJaXdheGUxYzlIZzFkbTFTMi9wcXNaOHgyaHZlcVJTSndGbk94TG1J?=
 =?utf-8?B?b2NzNWdEL3JoNTY3THV6WlNydlpXNFJqa2ZWOGRINDkrWStkWjJGZFlENi8z?=
 =?utf-8?B?Mm9BTnJodjk1Z3dBaXZuaGNpbE83U0tLWkZaTitKZ3k4L0ZNWTRmais0UlFD?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7a34e5-4d6b-4610-ce1c-08dad1fe7a18
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 11:40:12.6378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTwmpn2UbaxZLRjheo6s8qUak47bMGnmFhdHoAcJZm0b8fFVElDTT/yNtnH82G3dZgHwLKPeTB/sQlIEG/uw1J6CWWp+rKmohTXBvwTXAZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9668
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMjkgTm92
ZW1iZXIgMjAyMiAxMTozMA0KPiBUbzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBDYzogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFt
K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxp
bmFyby5vcmc+OyBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBBbmRyemVqIEhhamRhDQo+IDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ry
b25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsNCj4gUm9iZXJ0IEZvc3MgPHJvYmVydC5m
b3NzQGxpbmFyby5vcmc+OyBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Ow0KPiBKZXJu
ZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDcvN10gZHJtOiByY2FyLWR1OiBkc2k6IEFkZCByOGE3NzlnMCBzdXBwb3J0DQo+IA0K
PiBPbiAyOS8xMS8yMDIyIDAzOjQ5LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+IEhpIFRv
bWksDQo+ID4NCj4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gPg0KPiA+IE9uIFdlZCwg
Tm92IDIzLCAyMDIyIGF0IDA4OjU5OjQ2QU0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOg0K
PiA+PiBBZGQgRFNJIHN1cHBvcnQgZm9yIHI4YTc3OWcwLiBUaGUgbWFpbiBkaWZmZXJlbmNlcyB0
byByOGE3NzlhMCBhcmUgaW4NCj4gPj4gdGhlIFBMTCBhbmQgUEhUVyBzZXR1cHMuDQo+ID4+DQo+
ID4+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuDQo+ID4+IDx0b21pLnZhbGtlaW5lbity
ZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfbWlwaV9kc2kuYyAgICAgIHwgNDg0ICsrKysrKysrKysrKysrKy0NCj4g
LS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9taXBpX2RzaV9yZWdzLmgg
fCAgIDYgKy0NCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDM4NCBpbnNlcnRpb25zKCspLCAxMDYg
ZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX21pcGlfZHNpLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X21pcGlfZHNpLmMNCj4gPj4gaW5kZXggYTdmMmI3ZjY2YTE3Li43MjNjMzU3MjZjMzggMTAwNjQ0
DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbWlwaV9kc2kuYw0KPiA+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX21pcGlfZHNpLmMNCj4gPj4gQEAg
LTksNiArOSw3IEBADQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+
PiArI2luY2x1ZGUgPGxpbnV4L21hdGg2NC5oPg0KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4NCj4gPj4gICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gPj4gICAjaW5jbHVkZSA8bGlu
dXgvb2ZfZGV2aWNlLmg+DQo+ID4+IEBAIC0yOCw2ICsyOSwyMCBAQA0KPiA+PiAgICNpbmNsdWRl
ICJyY2FyX21pcGlfZHNpLmgiDQo+ID4+ICAgI2luY2x1ZGUgInJjYXJfbWlwaV9kc2lfcmVncy5o
Ig0KPiA+Pg0KPiA+PiArI2RlZmluZSBNSFoodikgKCh2KSAqIDEwMDAwMDB1KQ0KPiA+DQo+ID4g
SXNuJ3QgdGhlIFUgc3VmZml4IHVzdWFsbHkgc3BlbGxlZCBpbiB1cHBlcmNhc2UgPyBTYW1lIGJl
bG93Lg0KPiANCj4gSSBjb3VsZG4ndCBmaW5kIGFueSBjb2Rpbmcgc3R5bGUgZ3VpZGVsaW5lcyBv
biB0aGF0LiBJIGxpa2UgdGhlIGxvd2VyDQo+IGNhc2UgdmlzdWFsbHkuIFRoZSBzdWZmaXggc3Rh
bmRzIG91dCBtdWNoIGNsZWFyZXIgb24gMTAwMDAwMDB1IHRoYW4gb24NCj4gMTAwMDAwMDBVLiBC
dXQgSSBjYW4gY2hhbmdlIGl0IGlmIHlvdSBmZWVsIG90aGVyd2lzZS4NCg0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMS1yYzcvc291cmNlL2luY2x1ZGUvbGludXgvdW5pdHMu
aCNMMTENCg0KTWF5YmUgeW91IGNvdWxkIGFkZCBNSFogaGVyZT8/DQoNCkNoZWVycywNCkJpanUN
Cg==
