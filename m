Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08CB6E9815
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D294410EC87;
	Thu, 20 Apr 2023 15:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454710EC87
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:10:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwGy3LDZXEeLYAqBM8dq5nd0CNREHaUBy3/9+8IJr7mkaApjx4wdkgUgMLSeSD+NkTEVVQBDUhLPRqHKZ2jCkIUGDXnc5SnvSJCis90olZnWvJHsQCf6QDaFQ+jArADGwt8sYbxjQwcWY4Kyni5ZOqnmJGtcSuCGuUDkSP645E3119JBOvISh4HCFwptwrptb4882oV6yjX7RQKe5xlIed/WgZnfhTZfCFenD+iiwcRg6I2uQtJ29LR7Cznbl7MzGlx2yn6RanM/MPTIo95XO2MytBl5zbfIailw1Il9FzwH+KSChhWmsLEnu366sTyn9HoXEkOsR8TTPOFaYg8gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhMPXLtIOtn8iyxtlQqQJ+LyVIB7H84Ao+XYPL9t+Bs=;
 b=PCzT+WbiGeBTxE3XppP1dCDHiGzbr8tGDNUIqgcZ2Yomr9KIQjOfbgK4EnssRHG4SSZl9aTBjV4Q4fbytSTdZ91OYBdy0eh5MKhejZPHzI2xaBCtWTplZ/Kc7YX+ie5LIUwlmqj5qXmZ90utnGUZDF4/IPSTdMwCVr3vI3ozPmPY1hltz74kbDk2IeXNN4IsJMq7jpN3tKUwpqRpy/DeHhvFDTCBLSAWWeUyuqclbWdhYTfJ1bGdHM9zHfp8aAspxbNPcgC8ZmtnSfXhoZphdXHOwHqKqMDgNp+coM7ZcN2Ntsn+hYi6nraSts0n0wXOEE7zuxSkihaf12hJcgmEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhMPXLtIOtn8iyxtlQqQJ+LyVIB7H84Ao+XYPL9t+Bs=;
 b=XWIq7hUPl8Nwt1z39sKJQBzv77LTHZp5F1AQPxznqTLPxRTrRIBcYIvt3JKq7l12CN3y58bsUxl+574dO6Q6w9kpN1z6rUuLXZsZAHN6ZpCNowSJ9wsv2ex+ERk/C5Bz704k+fOzIEfCHqjE8/BrUkSBOe4LSlMoj6jDyyUw2vc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11444.jpnprd01.prod.outlook.com (2603:1096:400:371::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 15:10:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 15:10:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v7 2/8] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
Thread-Topic: [PATCH v7 2/8] dt-bindings: display: renesas, rzg2l-du: Document
 RZ/V2L DU bindings
Thread-Index: AQHZbG5SNql9gqV6yEOMl/SRkhbfnK80VNQAgAAFTFA=
Date: Thu, 20 Apr 2023 15:10:49 +0000
Message-ID: <OS0PR01MB5922F0D8367DA0F47938161F86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVTR8-yDfX24V-_+fR-i4pv8XH9fhDinRok1MAp+80psw@mail.gmail.com>
In-Reply-To: <CAMuHMdVTR8-yDfX24V-_+fR-i4pv8XH9fhDinRok1MAp+80psw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11444:EE_
x-ms-office365-filtering-correlation-id: 2f7a06cf-f661-43e2-98d9-08db41b16d34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvwMKwifNBfvRJaYsbqLlaT28P400dhU/6FVgyzbZNArxMLyGvN89fZGnjCt3rDytoxmOF9tdBQOHhs1d6oyskL9eh6ijDLkYl32iA+IJ4ziYRGT0nohOj/0sonJluMH1BAP2zcHL7VI89FX7RIvhpzvond8q3U7xnh8wJT/W0e5vYjOEP0UJKxmg8nfjHrAq7d44yvjwfwTr/ilbHbysG+NlVroWnzAfOqfK69n7M77LLKTcHYXimApXIWh0Z7fd9+Q+8gD3EcMiyTZeeUTOaqoccPoycOoLP7wMmlR/LzKEYJ14RATE85gu6Nvb0a41IXPbBZD5DAdV7jVVbKsHpKNB0DuoGf2TTywWBNr4y/sIlP6bI6z7UfXQF904HktQpkTwln5KmH+1b6FlHcdrd3LM4eEIKRLyweNgfTym9bJGgum/KQCCzMkRV+6FTxkISYJSkTv/VL/X+r/BLfLqivbQDCB7yXZgADAMW5vQhFvtyMJ5Yo02yZN+ZtQpu6HnLc8k/hdJqduvOCrURB2oJOwVd1pev2hvV9S8G6ATFWkI5nCDqwXPig/IILJvHmcUKwLUwebntjeb9uMKzlKZ5GHK7ffJX7FluKs/AagseWTt08M91an5onC/7PBNtbL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(186003)(6506007)(71200400001)(9686003)(53546011)(7696005)(52536014)(5660300002)(316002)(4326008)(41300700001)(66556008)(6916009)(66476007)(76116006)(66446008)(7416002)(66946007)(8936002)(8676002)(54906003)(478600001)(38070700005)(38100700002)(2906002)(64756008)(86362001)(33656002)(83380400001)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlhQVEFxQ2lvaTRydDZuY0FXZ0E2d0hmWGlyWGtnd0pHaGVxT1VZR3FHK2hm?=
 =?utf-8?B?L0Zqd0paVlZETFh0ZWRlSkxPdUVmbEV3R3VxRndzYS9pRlVVMTdyUmRyOGZk?=
 =?utf-8?B?bG5kVkV3MGEzVmVucE54bDEzZUlsdEZ2QnJZam1oYTZFSVJZREkwblR5OU43?=
 =?utf-8?B?S3JRVmJrdW1TNWtTSEgrYlczNTRndFVUVU5oQjdVQVc1N2FJamhlVXRNa0lz?=
 =?utf-8?B?VXdJaDlSZVJudU9DUm9vZ3JYQk16aFNzcDlhR2R3MGk5R25HMVp5ZlIxYXdj?=
 =?utf-8?B?dFgxcmd4allXbDN1REJQRDRvM2NqRlNpc3ZibWtGeks2UDFLVzN4WUhzR0N0?=
 =?utf-8?B?Zm1BNThVQXVYbVJ3L2piSzdQeitESTh4OTZ0ZEV3YjVGVVpMM3k4RGtxL3U2?=
 =?utf-8?B?Ky8ycXZoQUQrOXoxYVF1UEFMWVgwRGtqaGUycDVqNEF3UWQzMEhYZk5sOEhG?=
 =?utf-8?B?MlBtQUJDL2U3aG9RaGllbkx6UmJydFlMcFF4cVVoZFlnUUQ3bmtHZmdMVXNF?=
 =?utf-8?B?UytyQXAxMFVySk51bm5hNjhtcWo1S0NwMi9reHNweERCeEYyM1lRVktZdHdK?=
 =?utf-8?B?cm9iMEptVFVDT1kvQUJOQnQ2ZnpiMmhqeFhGK2hFSEc0cUJ0VUNMQWlpeVZ2?=
 =?utf-8?B?WjFwZVBIWjgvejE3M3RjYVZCYm1aQXRMNTkxaytBbk82WFkwb0J6K3cxRDRK?=
 =?utf-8?B?OEE2TFJVQ2thZml6QzEvZlBWVkpSWU5TU2N4UlVhUjhydkpEem50S0plTFMw?=
 =?utf-8?B?VGgyVnlCMDc5TWhXRWZaVU5sWjRWYjhGVmhTSnhmQjdyUTY0YUt3Zk1rSXdy?=
 =?utf-8?B?M1RZZXR4NzFUQ0RCa1VtcUEyNGRPa1pJQ1dFSUdKakZ4T0kzTnZJY0F0TUtk?=
 =?utf-8?B?NExEY2tPNCtwK1hLVktveTJjMFEvQUtqWjc5OXZ0L3R5aTc4ZHFsS1NwSHBW?=
 =?utf-8?B?YlFmekxKQjZQVGdzSVRsUnhOamxFSEd1SWhiR2ZtaGlxeFhlWVprOWVYeVZ2?=
 =?utf-8?B?VDVIRWRsL0lxUVN4QlNNcW5rV0Z4Mk53M0tXazZ2d1lHSVpIWnV1SStrNzM4?=
 =?utf-8?B?Zi9XZTdza3NiMnZWeGhzWnREaXVtZWZuV1dqd3M5SjljWGJMdmZEa2RTV1Uw?=
 =?utf-8?B?YjdKditTQlNzWHZ1VkNpdzBMWUxEVFlLNmN2MEpRcm9nS3pJWmpDcFVoV09h?=
 =?utf-8?B?eE12L2VBSER4UG5sMVJla3QzWm00bTVkZFpTSkpMNVV3SFd3bzZ5aFVTdWlh?=
 =?utf-8?B?TTFRZjZQQng4Mmx1R2hTbEF0ZjMvczdxU1BIZUhZQWRva1JPMVRUamVLek1F?=
 =?utf-8?B?dyticmlGWkZPeVovaGV5WHZHMDYxaGFxVWlOTDZucklISld4MVE3b1Z1SldD?=
 =?utf-8?B?SlBTYm9sZUdLMmFSblFNU1JMSGlDMWlyTjIzd0hlNGFaTG5GNVdoMmw2OStM?=
 =?utf-8?B?RHFZSGFmU1dHMVBuUHdCSWcwQWJLaFdzZzA2SnBIR3VjTnpyaGV4QTVxUkN0?=
 =?utf-8?B?RUYxMU1wNGZwU1VScWtkZWhvd1BVL1hFMUpPWW80RmtCVStNQyt3WnBkWUhY?=
 =?utf-8?B?RmFycTZGUHBlTW1lbVhFcm8zcG02ZGtnWSt3Y2dXOHpQWVh2a25DOUJQeC9G?=
 =?utf-8?B?enZiTFA1eHBMS1Y0QWVpTE04WndwSHlQWUJZK1NZcHJISlBUdXJEZkUxZVZ6?=
 =?utf-8?B?VTZsUGdueE9EblU2TEhlajQzZHVIQmEyS3cvbHdQaGZqdTNVaU5WVUcvV3g5?=
 =?utf-8?B?amdkUGI2R0o2S2NGbFU5VUsveExMcGZXNDNYUzJmaDg2eUhQREtSKzUwVitH?=
 =?utf-8?B?TVVTd1V3RE5ZZ3hpK3ZFdmw0RDk4czJhbHB5U2RTbnl0ei9tcmR3ZkRhZUNO?=
 =?utf-8?B?Rkg4blRsUnYyWVdQTk53R2Mya2toSzFjTERWaXBQQThqSW41dGVJdlh1dFhk?=
 =?utf-8?B?UW9LYnE0d09YMnJlcWZFU1NudHQ3emtwaGtQR0E0bHQ4VDExcjVxU1RVUVRQ?=
 =?utf-8?B?cnBsUWptbWpKMXFZZXhoVnpOSEFUSDd2UWtidVlFVjVjWldFdXdPcXg3VlZV?=
 =?utf-8?B?ZXhnKy9Idk5CZkdXdmNvZkQrR200Q1cyUGRUdEhVcExoYktYMDdZb1pQRTNG?=
 =?utf-8?Q?A9VU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7a06cf-f661-43e2-98d9-08db41b16d34
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 15:10:49.9920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oz5TR4+VRCuCtRrGvKrMR5BMLJWTzH209hOdY2jFTRVQutzmILjRnfsX5fxM42E9PdDrWZHZRZYEKoDXkkDSmbAx8Zj/XNTOWAjUuAoEQK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11444
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjcgMi84XSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTogRG9j
dW1lbnQNCj4gUlovVjJMIERVIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVl
LCBBcHIgMTEsIDIwMjMgYXQgMjoxMeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gRG9jdW1lbnQgRFUgZm91bmQgaW4gUlovVjJMIFNvQy4gVGhl
IERVIGJsb2NrIGlzIGlkZW50aWNhbCB0byBSWi9HMkwNCj4gPiBTb0MgYW5kIHRoZXJlZm9yZSB1
c2UgUlovRzJMIGZhbGxiYWNrIHRvIGF2b2lkIGFueSBkcml2ZXIgY2hhbmdlcy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiAtLS0NCj4gPiB2NzoNCj4gPiAgKiBOZXcgcGF0Y2guDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+IEBAIC0x
Niw4ICsxNiwxMyBAQCBkZXNjcmlwdGlvbjogfA0KPiA+DQo+ID4gIHByb3BlcnRpZXM6DQo+ID4g
ICAgY29tcGF0aWJsZToNCj4gPiAtICAgIGVudW06DQo+ID4gLSAgICAgIC0gcmVuZXNhcyxyOWEw
N2cwNDQtZHUgIyBSWi9HMntMLExDfQ0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gZW51
bToNCj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtZHUgIyBSWi9HMntMLExDfQ0K
PiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNTQtdnNwMiAgICAjIFJaL1YyTA0KPiA+ICsgICAgICAg
ICAgLSBjb25zdDogcmVuZXNhcyxyOWEwN2cwNDQtdnNwMiAjIFJaL0cyTCBmYWxsYmFjaw0KPiAN
Cj4gIiotdnNwMiIsIHJlYWxseT8gOy0pDQo+IA0KPiBBbmQgd2l0aCBzL3ZzcDIvZHUvLCBpdCBk
b2Vzbid0IG1hdGNoIHBhdGNoIDYvOCwgd2hlcmUgeW91IHVzZQ0KPiAicmVuZXNhcyxyOWEwN2cw
NTQtZHUiIHdpdGhvdXQgdGhlIGZhbGxiYWNrLg0KDQpPb3BzLCBUeXBvLiBDb3B5IHBhc3RlIGVy
cm9yIGZyb20gdnNwMi4NCg0KT0ssIHdpbGwgdXNlIGNvbXBhdGlibGUgcjlhMDdnMDQ0LWR1IGFz
IGZhbGxiYWNrIGluIDYvOCBhbmQgaW4gZHJpdmVyLg0KYXMgYm90aCBHMkwgYW5kIFYyTCBzdXBw
b3J0cyBlaXRoZXIgRFNJIG9yIERQSS4NCg0KQ2hlZXJzLA0KQmlqdQ0K
