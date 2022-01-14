Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E448EA29
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 13:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4D010E21E;
	Fri, 14 Jan 2022 12:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607110E21E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI8V6QxGe7YiNgOTEM/eKz0gEQvzAa665mJMYgkSFV2DXnBFls0Sy/PbGgjLuCtbnHFgfquxnxk1z/SzXvv+IZbbaBAcPG5dSa87T5LX2Lb1/jixZYVUS81qOXjYuuYTmNHZvY+WGz/QQDSFcP/oqcOV8/1xf8rmfT5MG3BaqEOiX85o1+z8VQdNC2015rL1sXJlBJqKb9hzon60XD/TjvEFnFgGCtFou2eE6NMIp1fXc78CxNg1pw8d1vHdGx99OL0iJpMOxgLjSk1r9uav21cQEpBksAv7k2n4XYmR74gCcpqeMPkRwDf80xg9wY8fZ0l+U+TA6aahP0MC6gOZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLZ/mzZo3V2jhLcNlLW8uTYQboP6CjoSmmlBxU69LU0=;
 b=kymEiyrXo8ujVNQ9r7NC/VzO/OZv5HizpAT+MwVgJfK+qzhQB5EaqrRsh+YCCZzzqHOlPoVeKdyqQI9+skion+DyAFHJrZUYBUNUcsBlPnYNBaJFHFM45Ix7Bg1fRqwc5YV7Svd2BHZaOggUQiM4zyEiPqIRTMguJNFef/TgZUl8hjfCWWbGwNw/TZmmv/gYDwLVJ3AKgl0UFOoNRfYew9k1opbISk/ThiIdm3v8IzooJk4/3CRz3LITkvX5CaZiPlBAR/vjoH3w1mq+anw4tV5c9wGCib2vFekwaxyBHgQbAJHdrIpA0uODRpv4o46WBnrdnghmYORKvRm/J+gtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLZ/mzZo3V2jhLcNlLW8uTYQboP6CjoSmmlBxU69LU0=;
 b=bTEh3oXZ4w9WCV5uLW2ABJmv4BKShBOQR7B6uHhmyEZ8qhEZRHyKwBkce+IXX4IE4BeDydlqpQney5+7aWGgz/wC5SQ3ONNTcREh9i6SsnJ7G8TQGhaAOJ7VHCqY364/5rsCzVsqJWEv91m58OdVXhxL6pp0cxwQfZScRyDDiXs=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSZPR01MB8058.jpnprd01.prod.outlook.com (2603:1096:604:167::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 12:54:39 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f57b:c0dc:5495:2354]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::f57b:c0dc:5495:2354%8]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 12:54:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
Thread-Topic: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
Thread-Index: AQHYB9xdBYnK1xJ91Um+ElqRSTpeP6xiUBmAgAAqnuA=
Date: Fri, 14 Jan 2022 12:54:39 +0000
Message-ID: <TYCPR01MB5933D72E458EAB4D8CF02F9786549@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
In-Reply-To: <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6399a27f-4e55-4525-caca-08d9d75d068a
x-ms-traffictypediagnostic: OSZPR01MB8058:EE_
x-microsoft-antispam-prvs: <OSZPR01MB805884BE1AE17BB70601C7F886549@OSZPR01MB8058.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qw0CLP7V6GfN6Kkrf923EHWaDxYOOLdiXvFkJD6BQIqca7GwFgIUnwuNUWpuCmasFDKdfYfwXca62/5ePJCIgCE+xr8FhOvtEUVLgQSxwuGV47mNEyxWsJ/vCKn42eAg7hYjKOfRxCZvrXl0PuG+Jaw3ktPw8aCRZFOchDNenoHpdaSV1lbraHHo3QkkI3FbV6qiKucf/pdNU6H/GWGBErvi+63tBHfcw8ip8tVVe4Xo9gCquZLxAWdolULUxFtdTCdU/dNF3H1K+Bw2EZ3kT77gDkEFyWnFlzqjwTGKDKM/KiHBYFyJdCYJIf5pWCKiwTpONnFo5djxFMRGXnsd5fCYpfQ6KLdGNOZB4TrBZLid1w7klscm7DHenVuI4kig68GFi7aMHN0ZQKBfurG+7zQ18i9bDSOC/9d8NSusTz40WyByiOWTft76Eu0WaC919iVIHoAXfEzK8RQp/aSC4gvbBiwER8mMdSl/8LbpsxfynrrpoDKTMRj4sp/ThYDNJ4BmS043tuXAbUZDuP768F53JBrhDyvkpu9U57pg06Sf4lgiPqHCHbC/v/86W/aCcqRl9+6drK7FCC7Ua2x++1fGTEhPyQttlnvmkFz/6pkQ94yHcJuwglIJ184ult+5JGdArhHlDYCqq+pf9LWS8Dx6NHkmKedF8V1QEqiqJiEAYm+HXonyoDVS/xhuC6ITCqxe7sonrvLgVM/fqyoZwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB5933.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(66446008)(66476007)(66556008)(55016003)(9686003)(122000001)(83380400001)(66946007)(76116006)(2906002)(7696005)(8676002)(86362001)(71200400001)(26005)(8936002)(33656002)(316002)(4326008)(508600001)(6916009)(38070700005)(107886003)(38100700002)(6506007)(53546011)(186003)(5660300002)(52536014)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1JreU9hMVk3aks4MFkzYmE4aXN4WFN1aU5mUGZaUHBOQTRyamhGbm5XYU5B?=
 =?utf-8?B?dS95U0xSZ0lIQTRkTFdsUGxuaVNrbjlqWG9kbzliM2x6QlNlUEVVd3E2eGpu?=
 =?utf-8?B?KzUzQVRqMUE1c0c1M3F4NkZydUpOd015aUdZd3VNd090TCsyRWJDZ3JiNkE1?=
 =?utf-8?B?NUFGeThVMkk0Zkw3WkVGem1VVUFYcmpua2Fsd0lpUGZSTnl0VXUrMjNmM1I0?=
 =?utf-8?B?V21QYUpqRTY4MC81cmMvbHFIQkNLK2hhM2hBL0dzM1dWN2hkZlorMEM3WnU4?=
 =?utf-8?B?M1FWN3RxR3NCUkJRZllDdWZoTDhlS0xmRmcxcG9Ua1A5bXpPU2ZFL3I1cGla?=
 =?utf-8?B?SWdXTnlxRUJ1ZHJvbDNVbWpaVmZpNXZLaDBQa0ZEdVdJTVpzZGNxclozOThE?=
 =?utf-8?B?cXhHZFZMTkZrYXRlOVp6bThXLzhYR3JKQmszYmlGUFNrOWtjNUxHTmtSRmQ2?=
 =?utf-8?B?M3h0U0FOWXhTMHc4VjNHU3JLbHBTaEpXOEFMK2lsTlBpZnNuRkpEYTdYaVBm?=
 =?utf-8?B?aDk5a1M4dWlEaEVNVTRjMmYzeVZNV3c3VGlEYXVlUTRuT1M0MGlxKzhXSnVB?=
 =?utf-8?B?SjhpSmJoMnJORDJYbWF6VVJwK3EzTDlVTnBFL0xPSUlpSy9Xd3ZzWE83cGg4?=
 =?utf-8?B?S21tNEp6WFFXMnBTbVZqSzNMMFh3YVVTN0pERW9mbmZUd3BsODU5dnJLclN6?=
 =?utf-8?B?c3BrVjJQZGpCMVljand4a0xmREtyMjQvOTBGbEZCTVh6N0FRVEdEeUJ5ZTQ4?=
 =?utf-8?B?ejVobUd4aGtUKzlXU3I5ekpQVEw4elh1TFlaeFllNDlkVm5zenQzSG91b0tT?=
 =?utf-8?B?R2FjS0d0SUJGRlFsU1NKbHdFOXJIQlhZMTN0WE5veHJPSmJhQXRUSHJ4dHdM?=
 =?utf-8?B?OWhLTm9yU0Rma3duUEtjZkk2b2ttSnYycStZTGFpMjk3UjVlV0xEN0poeC9x?=
 =?utf-8?B?M05NTXpvUnBCa3dQNm42MENaRXJSLzRRWVRPY2U0NmdaSWl6NUxtMnhiSnV0?=
 =?utf-8?B?RkZvay8remJHNENtWUsvWUJMc2VaL3lpbGVRRHdZZlFIMjNYZC9MamRyakJo?=
 =?utf-8?B?UTlsUVJyK3dwNTB5WnVOOUROYWhWRlJiWTVyN1M2blJrdERiMmZRRHk2dlFB?=
 =?utf-8?B?UzV2aUs5NkM5YjNRNXl1OFN2ZjlIYnQwb1NnejduZUdqMG1ja2dBakZRMUpE?=
 =?utf-8?B?eitGQ0VhZUJqU284RUpSRUlnYXdCTS92eE5Hbmdia0djdXN6M01PZjV6OUth?=
 =?utf-8?B?WXEySHlWUzB2MEdlRFErazdva04yUHFXWEdVVGNFTW5vNURJQnhiYkQxb1BX?=
 =?utf-8?B?RFJUdXgwR1FUQUh5NDNDUUF3YU1hc25qeWVmSnVFWHRoRU9pcTZOUjBJREtn?=
 =?utf-8?B?YUFsV05PRHJhbUZqQktUbnNMYzcrNDk0V2dYWmVkemYzMCs4bHhhUFdsRFNp?=
 =?utf-8?B?V05HYkhBTHpSM0kvd1hFZ3lneldtaldxNkxzYXJ6cVRxTE9PeFlYR1VOZHM1?=
 =?utf-8?B?VXpDc3dTQzY3UVRGd1VFV25wMG1IckprdWk1TXdhcDJKWGdWajR1VmdTWmFT?=
 =?utf-8?B?VzFtbEpDckJraDBtSjdUdkxiclRCTDRvcUlFYjlNYVg4cWFPNmtLaEtLMVRn?=
 =?utf-8?B?TFBFKzdzdTJyejV0VGtGRitWdDkvUEZpalZvSXczT1ZXTVN3bU5oUUd3YlJC?=
 =?utf-8?B?bGdOQmplbFZ2dFVrWUN6RXRMUG53R0JVYWc3cFMybHhDNERnUW8wZy9BTXFI?=
 =?utf-8?B?aDBMcFk1cVJZMllLREtXMDNMdTE3K0p3cEhCRkpPYjNqTnVZUVhmMnJINDRh?=
 =?utf-8?B?clI4ZzR3MGViWUdEUnY2bUJEMC9HNllpRFhENUxkZ3JuRDd0OElHVHdMNTBj?=
 =?utf-8?B?VzlYRDRKNFR0L21QWkJmSzdKVW9ud2Q4bnNaZzBFWC9ENDA4NkozcHVWa2VL?=
 =?utf-8?B?UjBKMzI4SjgxVU5QZEoydnVDVWQyZ0FvVmR1WmhZYjZ4dW8yNzFZNTRuVkNM?=
 =?utf-8?B?WFR6Qmk0ZVRkdTJFSFdTeDBjWFlmZWo1NElRd3QzblBiVzMxTURnZCs0S2I4?=
 =?utf-8?B?bEpMZFJCUDRjVTB1VGdjZ0tNbFBpVTBaQmJ1MkIram9LWEQySlNpdmc2ZW1T?=
 =?utf-8?B?bnE5ZWQ2cmcwTjUrM1IvclNadld0eXYzMXhRUU8wRi9aUFQ5ZEdiK1BSNXZ4?=
 =?utf-8?B?YmJFN0hKMjNQTWdDVzZEckFqR3hqV1o4NURBcHd2bTVvc1l3WmV4VnJTZ1E5?=
 =?utf-8?B?SlpHY2xtb0NnMjA0Zzd1ZnRQWk5BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6399a27f-4e55-4525-caca-08d9d75d068a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 12:54:39.0700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3p4pzclJkikUw7sEmPVUNp23JzCP8T+fzKWjeiK0FcfDzl9+ZdhA+Ukriv0emRKSaao+S1REh0ArZAokqOi6Av9w43P+uVYrcNPTtjOB/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8058
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UkZDIDEwLzI4XSBkcm06IHJjYXItZHU6IG9mOiBJbmNyZWFzZSBidWZmIHNpemUgZm9yDQo+IGNv
bXBhdGlibGUgdmFyaWFibGUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIEphbiAxMiwg
MjAyMiBhdCA2OjQ2IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gSW5jcmVhc2UgYnVmZiBzaXplIGZvciBjb21wYXRpYmxlIHZhcmlhYmxlIHRv
IGF2b2lkIHN0YWNrIGNvcnJ1cHRpb24NCj4gPiB3aXRoIFJaL0cyTCBTb0MncyhyZW5lc2FzLGR1
LXI5YTA3ZzA0NGwpIHdoaWNoIHJlcXVpcmVzIGEgYnVmZiBzaXplDQo+ID4gbW9yZSB0aGFuIHRo
ZSBjdXJyZW50IGFsbG9jYXRlZCBzaXplLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X29mLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X29mLmMNCj4gPiBAQCAt
MjAwLDcgKzIwMCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByY2FyX2R1X29mX2x2ZHNfcGF0Y2go
Y29uc3QNCj4gc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWRzKQ0KPiA+ICAgICAgICAgc3RydWN0
IGRldmljZV9ub2RlICpsdmRzX25vZGU7DQo+ID4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
KnNvY19ub2RlOw0KPiA+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpkdV9ub2RlOw0KPiA+
IC0gICAgICAgY2hhciBjb21wYXRpYmxlWzIyXTsNCj4gPiArICAgICAgIGNoYXIgY29tcGF0aWJs
ZVsyNF07DQo+ID4gICAgICAgICBjb25zdCBjaGFyICpzb2NfbmFtZTsNCj4gPiAgICAgICAgIHVu
c2lnbmVkIGludCBpOw0KPiA+ICAgICAgICAgaW50IHJldDsNCj4gDQo+IFdoYXQgYWJvdXQgY2hh
bmdpbmcgdGhlIGNvZGUgdG8gdXNlIGthc3ByaW50ZigpIGluc3RlYWQsIHRvIHByZXZlbnQgdGhp
cw0KPiBmcm9tIGV2ZXIgaGFwcGVuaW5nIGFnYWluPw0KDQpPSy4gV2lsbCB0cnkgdG8gdXNlIGth
c3ByaW50Zi4gSXQgdG9vayBzb21lIHRpbWUgdG8gZmlndXJlIG91dCB0aGUgb3JpZ2luYWwgY29y
cnVwdGlvbg0KaXNzdWUgd2l0aCBSWi9HMkwsIHdoZXJlIHN0cmluZyBsZW5ndGggInNvY25hbWUt
bHZkcyIgaXMgYmV5b25kIHRoZSBsaW1pdC4NCg0KUmVnYXJkcywNCkJpanUNCg==
