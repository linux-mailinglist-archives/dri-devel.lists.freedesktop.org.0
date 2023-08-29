Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18F78C6D7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C1C10E27E;
	Tue, 29 Aug 2023 14:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C455510E284
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6eB7c60a1gRxJBqiIiCc58eGap6HxAtuPsPfePrP6AqrJCgkSAMr6qhBG9DDuWDYCUixoNYoueSm+3sNXcH1s7Qko6LaGPEFxzOPPTM0QBzEk6ECIle7DYHt3CnHjpEoCF71Dcb3ICDKCHGrfcCSYtkh1J3lXM4GG0KURdIjUGO9KDo9uB53d49oQ/dnstxZ7afbpBp39XtTZf0SwInUaPWEhwiP/YUCsP7H9QC6Tjbm41LGo6NylNPvBOPFFp9+i7tXfza6NmQazcMgsz28GyC08gYsgquGdXDhWc7IoEkvJWXCdUfTtbSTuZ+SuFB3D5UcJHCRdXk5lc2pe3Idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeOUG9O4/Nu9x2aUlMLdnZAB32+t5XNCVN1Jg97hxdk=;
 b=GI33JvBEKIoG+qUTZ+Jo3xqP6y6sDMej8MonCdquXngf9fAwrS1a8lLKq3KazLNnkQ2nQKQkP55CFt1ujJUCpnsvzHIbPrWlVdKoco0J6YVhtaMyaQamjRpMMI02LQSAjnxdKJFiaBtmgtSIvBahe5ZfqcUnzXh4S+Bxxx9NEqmaANUXpDdK+48AElRqNBISttsWpG+/0H1zJ0xWjmIxukiMXNdnEJzu6nzSoX8mw8iuBZ4dw0dqFE5RqydRI4v6pA0MPWygTKysj7Ask44jzL9gncSYIm3N1rQ4frZGk9JwSJ1FY40ujtlwYLzrKBDFoUy+mwZZ6TjqnLmcbrbBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeOUG9O4/Nu9x2aUlMLdnZAB32+t5XNCVN1Jg97hxdk=;
 b=lv51YFETYgp/M6XkRGHXxsNh9oLw1GNsFmcky5GTw1YuGCZ/EeBNsN2t/g+dA5BG4s1i2dPLbfF3bjzpPCJAVL282g9eXrGTZVLa2MF0kq5CvvFJB63LA40zUz0/im2hkxNviUVe6nwpDSwxpqL2GhUnrd5mb6tvb5Qd5dmhULE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9362.jpnprd01.prod.outlook.com (2603:1096:604:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:06:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:06:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 4/7] drm: adv7511: Add supply_names and num_supplies
 variables to struct adv7511_chip_info
Thread-Topic: [PATCH 4/7] drm: adv7511: Add supply_names and num_supplies
 variables to struct adv7511_chip_info
Thread-Index: AQHZzhDJz4yWOnQeC0WG2DLe6oGuybAA+CUAgABvipA=
Date: Tue, 29 Aug 2023 14:06:27 +0000
Message-ID: <OS0PR01MB592258F2B4494413DFD70F6986E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-5-biju.das.jz@bp.renesas.com>
 <20230829072634.GN17083@pendragon.ideasonboard.com>
In-Reply-To: <20230829072634.GN17083@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB9362:EE_
x-ms-office365-filtering-correlation-id: 2f463489-c019-4a3d-348a-08dba899234f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XNQ6Ul0pyBgSoughXVhV+Z/j+up5gATSVpPv0kgvb4oiXP2mlUkJQoBOINJ45j1hOfWvZK1C2mNos7wq9L9glMXqIsx/dX8/HdWFJ4uuK3+9GKX68P/EUGbSP5QvjWVc5yurGi00NZn3gpXDEFMyT0sxj4KG0Qosu+8ayOUv+14kQB/njDEyiaQ8tuo6HaAqjuGHxOYBsTJcIBmVZ9DNOtHdyI415ENRZJkVpQkrGNEUVyKKK5rIVuOhDIKLENl84B179rGQ899Yia6usKhtVUFqjiV85HOnL8SGnV1TdDDG87g3M1lFoGAORNRHQQK3gMWNzCnRlpwGDwL1J6CokOShoohI5+25WBOLcfxPtp7QUOmyqNfQyvPCLbk0FP/3d2Mf13mkrbmgDroBLll+t5SvMJ8sTLpAzoy5Mdfbe5z7Awmj4kNCQkT+JgbT1Md3E74H7BRXcur+fynVG6aAAci49ZSS5fgcJQrXU0a7KwqiRMGS+UfnwDqtw00WUJU8NMC7yXf3FKeKYejpKcm31AdIC+NyOBiltmgGdEr7CP38xEqfsEKBGKqgVkJ1mQUJx3n4N3wuFaDX32Gg0yYyz2BmOlQEs0U4MCsRlGO9h9GSwEorbi+NVf/hOkoY2gTu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(186009)(451199024)(1800799009)(6506007)(9686003)(7696005)(71200400001)(478600001)(83380400001)(2906002)(76116006)(7416002)(54906003)(64756008)(66446008)(6916009)(316002)(8936002)(66476007)(66946007)(41300700001)(52536014)(66556008)(5660300002)(8676002)(4326008)(86362001)(33656002)(55016003)(122000001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFcrWitaalgyclhpYkxtMUk1WWVJN0xrOXhrMjVKdENVVkVlQTIvT2FaM1VF?=
 =?utf-8?B?cUIzbXdiKzQvaG9kODNlNTVENDc3c2NhQTBMRnNlZDN5OU9WN2hvQ2xMUEZC?=
 =?utf-8?B?L0VydTQzUzkrWGRnSHh0R1U3dmhvWklaSkN3TVBQR2tEOTF2d2JpMzMzSGts?=
 =?utf-8?B?Zkphdm5wdktNSElVWXhQb3gvTkJQTUxqUWdIdGNxY0Ztc01XSHI5cnBGQ2dT?=
 =?utf-8?B?M0lvTWlEYStLWDhjNVNFN0xDK3MzbzdNVmlQdW1CSytRYVdlWWVidk5zekJL?=
 =?utf-8?B?dzdEV0NnZEJzaDk1TzIrL1F1UTlzWDZhaGFMd3I3aCtVUDBEMWJlTHZRbngr?=
 =?utf-8?B?OFE4bmxteGlYTUNiVWNFUDdWUzZaVmM1enlvaC9MbnBIUUtTQWROQmtKWDVX?=
 =?utf-8?B?dzdvRFA3NlVOTmQ5ZWtvdzg2ejZqWnYyYnR3TkJBZ1VqdW5Ma0sxYmpHV0pm?=
 =?utf-8?B?a3hPK2pQZVZVYkUxeXBXSUYyU09jbFRTOC83RGFDbi9CaDVRYWo5WGkyUWNX?=
 =?utf-8?B?ME1GSU1MdzdCZlduSUpXdEt3Kzhpb2U2ekRoaXdLL0dDVjdOc2lXb0IrZUtE?=
 =?utf-8?B?MVBHa1ZtdDFXajJKa1crdzh6ZDg1VlhBUnhKUUxMM1dPbytjUWhkMFNMVGkx?=
 =?utf-8?B?SDF2c1p4dy9LT2tSTWhSbkF1MmFNOFl0MlNnREYyZ1YwZEN5bmk1VEZrWmRU?=
 =?utf-8?B?VzBQeTRhTWtRRHdQMzc4SW5aaFMxSDNSbVZ4NmRUekFjdjllVkNmMjFXMVhm?=
 =?utf-8?B?Q1lLTEVid002UVorUWNITmtZQm54cmF3SnJLSXg5SitodE1VTDBjYlVZeW1x?=
 =?utf-8?B?YjAzMEpwWFRFd1VCWER0V0xtS21aQ1BXR1IvQkpWY1VXTzlsdWQycEU2Qyt4?=
 =?utf-8?B?YlhtMzZ2UjZGSUd3eXgzcWdhQkpQOVlIcGo0RDNRNU1MaHFZYTRWKzRKVlhk?=
 =?utf-8?B?NVRvQXI5dFoyZ0lZa0NBSUNzZExVR0lEQktTcW56NkdqaVFvWk1rUzVvbTVM?=
 =?utf-8?B?RlUybWprbFhTS0Nyb01FM200NGczOTJJTWsxdElJTUZ1ZFRVYVdIU2MvQVVk?=
 =?utf-8?B?dE96dUFxTEdpb2JUYXh4T0dja3VpUWJHMy9nTGx5WW1Sd0FYeXhuenVjcTd1?=
 =?utf-8?B?Qk5nZ2hMc3pweG5NUHF0eVJKQ25saWNvalBwVnJZTVNDTlI3NmxsV3owQWdN?=
 =?utf-8?B?c1JDeC9KdU5QdUtEN2YrVGlpOEZUWDBpdy9qT3VDYWZ0d2tyVWE2aW9FaE5i?=
 =?utf-8?B?N0tqZFlnN0NuQUlaNjYxQlpvZklDYWlFWWtPejFxV2ZkdHprZjFSN1VldUZC?=
 =?utf-8?B?cXJUdDFnenR0enUxdmdvc0FnQW5CV0MvQW9TeE81a3R4MFgvRWpOQ1ViM3Qz?=
 =?utf-8?B?VmlwUmJFNlpCM01TRXdZVktCeG1lajFxRVNGUXJ1TU1pVHZKYXF0MitWdE03?=
 =?utf-8?B?N1RVRDgyMWQ2UE8xN09zVllJMlhTNUlhc1dHRy9wem13aXRpMlJSdDh1eHJx?=
 =?utf-8?B?NndwRlIrckpJWWVWMmIvbExqSmpTcVA5akxJa003NnhpUHhVTUFLNmo5U0dF?=
 =?utf-8?B?cjZ0Z2FKQXhxTERWMkRVNWx3aE85WDVJc0VrbERMR3ZBeEhucTdNZWx4MGg0?=
 =?utf-8?B?ZWNsK21rbWN2NTRreGxWQmZydGdhTldlVU1TcDR4eEVHTUdmUzc3SnFrNlZ5?=
 =?utf-8?B?UGlheFk0U3VPRkg0VnZWUHNpdEo2OXlWWlQxUGpXa1dweUdiaGRyVEZTalV4?=
 =?utf-8?B?MEZDTWY0YkxOaDRkTHhDd3FBc2RXdUs3YTlGRG1GMVpOZVRld2dCVTY4UUM5?=
 =?utf-8?B?dWF3azdpSFRyelZmRXA3aUNSVFdIUW1BQVBvSjF3ZFVHZGpEdXJkVmJqM2No?=
 =?utf-8?B?S3JqdDVWUlhpTVdZUG9URy9va08ydGNiMWM3bjZITk92NlpXdUx2R0IrT2No?=
 =?utf-8?B?Q2h0K3JnekQ5UGhZVkZCRndLTG12K050V3NMOXNFdndxeTl6cnlwWlBDaHlp?=
 =?utf-8?B?ZFlqZHBlc0RtaVRYR3VZUjM4bnBwZ3hHVHRTa2J0dGFBTHNXbGlrVy9qS3hp?=
 =?utf-8?B?TWlxc1NqdHJNRTJ2OUFDMm05dXpCZkhCUDJrZ09EV2FnaCtVVk4yVWprYjl3?=
 =?utf-8?Q?jz2g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f463489-c019-4a3d-348a-08dba899234f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:06:27.8465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XP5Bd0R+YTEU8CGcuWKc5lO0s+9kJbDWddyipYxJlzPN5+fMQ4uCdyEjngnnYg5it9oy2hCJR9LSBiyFtpoXXdu6mRr0rE1ed3uvf8exR00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9362
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCA0LzddIGRybTogYWR2NzUxMTogQWRkIHN1cHBseV9uYW1lcyBhbmQgbnVtX3N1cHBs
aWVzDQo+IHZhcmlhYmxlcyB0byBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFN1biwgQXVnIDEz
LCAyMDIzIGF0IDA3OjA1OjA5UE0gKzAxMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoZSBBRFY3
NTExIGhhcyA1IHBvd2VyIHN1cHBsaWVzIGNvbXBhcmVkIHRvIDcgdGhhdCBvZiBBRFY3NXszMywz
NX0uDQo+ID4gQWRkIHN1cHBseV9uYW1lcyBhbmQgbnVtX3N1cHBsaWVzIHZhcmlhYmxlcyB0byBz
dHJ1Y3QNCj4gPiBhZHY3NTExX2NoaXBfaW5mbyB0byBoYW5kbGUgdGhpcyBkaWZmZXJlbmNlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUx
MS5oICAgICB8ICAzICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3
NTExX2Rydi5jIHwgMjkNCj4gPiArKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmgNCj4gPiBpbmRleCAwZTJjNzIx
YTg1NmYuLmIyOWQxMWNhZTkzMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTEuaA0KPiA+IEBAIC0zMzcsNiArMzM3LDggQEAgc3RydWN0IGFkdjc1MTFf
Y2hpcF9pbmZvIHsNCj4gPiAgCWVudW0gYWR2NzUxMV90eXBlIHR5cGU7DQo+ID4gIAl1bnNpZ25l
ZCBsb25nIG1heF9tb2RlX2Nsb2NrOw0KPiA+ICAJdW5zaWduZWQgbG9uZyBtYXhfbGFuZV9mcmVx
Ow0KPiA+ICsJY29uc3QgY2hhciAqIGNvbnN0ICpzdXBwbHlfbmFtZXM7DQo+ID4gKwl1bnNpZ25l
ZCBpbnQgbnVtX3N1cHBsaWVzOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCBhZHY3NTExIHsN
Cj4gPiBAQCAtMzc1LDcgKzM3Nyw2IEBAIHN0cnVjdCBhZHY3NTExIHsNCj4gPiAgCXN0cnVjdCBn
cGlvX2Rlc2MgKmdwaW9fcGQ7DQo+ID4NCj4gPiAgCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRh
ICpzdXBwbGllczsNCj4gPiAtCXVuc2lnbmVkIGludCBudW1fc3VwcGxpZXM7DQo+ID4NCj4gPiAg
CS8qIEFEVjc1MzMgRFNJIFJYIHJlbGF0ZWQgcGFyYW1zICovDQo+ID4gIAlzdHJ1Y3QgZGV2aWNl
X25vZGUgKmhvc3Rfbm9kZTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2
NzUxMS9hZHY3NTExX2Rydi5jDQo+ID4gaW5kZXggMjllMDg3ZTZkNzIxLi5mNmYxNWMxYjA4ODIg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9k
cnYuYw0KPiA+IEBAIC0xMDA0LDM3ICsxMDA0LDMwIEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3QNCj4gPiBhZHY3NTMzX3N1cHBseV9uYW1lc1tdID0gew0KPiA+DQo+ID4gIHN0YXRpYyBpbnQg
YWR2NzUxMV9pbml0X3JlZ3VsYXRvcnMoc3RydWN0IGFkdjc1MTEgKmFkdikgIHsNCj4gPiArCWNv
bnN0IGNoYXIgKiBjb25zdCAqc3VwcGx5X25hbWVzID0gYWR2LT5pbmZvLT5zdXBwbHlfbmFtZXM7
DQo+ID4gKwl1bnNpZ25lZCBpbnQgbnVtX3N1cHBsaWVzID0gYWR2LT5pbmZvLT5udW1fc3VwcGxp
ZXM7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmYWR2LT5pMmNfbWFpbi0+ZGV2Ow0KPiA+
IC0JY29uc3QgY2hhciAqIGNvbnN0ICpzdXBwbHlfbmFtZXM7DQo+ID4gIAl1bnNpZ25lZCBpbnQg
aTsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAtCWlmIChhZHYtPmluZm8tPnR5cGUgPT0gQURW
NzUxMSkgew0KPiA+IC0JCXN1cHBseV9uYW1lcyA9IGFkdjc1MTFfc3VwcGx5X25hbWVzOw0KPiA+
IC0JCWFkdi0+bnVtX3N1cHBsaWVzID0gQVJSQVlfU0laRShhZHY3NTExX3N1cHBseV9uYW1lcyk7
DQo+ID4gLQl9IGVsc2Ugew0KPiA+IC0JCXN1cHBseV9uYW1lcyA9IGFkdjc1MzNfc3VwcGx5X25h
bWVzOw0KPiA+IC0JCWFkdi0+bnVtX3N1cHBsaWVzID0gQVJSQVlfU0laRShhZHY3NTMzX3N1cHBs
eV9uYW1lcyk7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JYWR2LT5zdXBwbGllcyA9IGRldm1fa2Nh
bGxvYyhkZXYsIGFkdi0+bnVtX3N1cHBsaWVzLA0KPiA+ICsJYWR2LT5zdXBwbGllcyA9IGRldm1f
a2NhbGxvYyhkZXYsIG51bV9zdXBwbGllcywNCj4gPiAgCQkJCSAgICAgc2l6ZW9mKCphZHYtPnN1
cHBsaWVzKSwgR0ZQX0tFUk5FTCk7DQo+ID4gIAlpZiAoIWFkdi0+c3VwcGxpZXMpDQo+ID4gIAkJ
cmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBhZHYtPm51bV9zdXBw
bGllczsgaSsrKQ0KPiA+ICsJZm9yIChpID0gMDsgaSA8IG51bV9zdXBwbGllczsgaSsrKQ0KPiA+
ICAJCWFkdi0+c3VwcGxpZXNbaV0uc3VwcGx5ID0gc3VwcGx5X25hbWVzW2ldOw0KPiA+DQo+ID4g
LQlyZXQgPSBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldChkZXYsIGFkdi0+bnVtX3N1cHBsaWVzLCBh
ZHYtPnN1cHBsaWVzKTsNCj4gPiArCXJldCA9IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KGRldiwg
bnVtX3N1cHBsaWVzLCBhZHYtPnN1cHBsaWVzKTsNCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJcmV0
dXJuIHJldDsNCj4gPg0KPiA+IC0JcmV0dXJuIHJlZ3VsYXRvcl9idWxrX2VuYWJsZShhZHYtPm51
bV9zdXBwbGllcywgYWR2LT5zdXBwbGllcyk7DQo+ID4gKwlyZXR1cm4gcmVndWxhdG9yX2J1bGtf
ZW5hYmxlKG51bV9zdXBwbGllcywgYWR2LT5zdXBwbGllcyk7DQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgdm9pZCBhZHY3NTExX3VuaW5pdF9yZWd1bGF0b3JzKHN0cnVjdCBhZHY3NTExICphZHYp
ICB7DQo+ID4gLQlyZWd1bGF0b3JfYnVsa19kaXNhYmxlKGFkdi0+bnVtX3N1cHBsaWVzLCBhZHYt
PnN1cHBsaWVzKTsNCj4gPiArCXJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoYWR2LT5pbmZvLT5udW1f
c3VwcGxpZXMsIGFkdi0+c3VwcGxpZXMpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGJvb2wg
YWR2NzUxMV9jZWNfcmVnaXN0ZXJfdm9sYXRpbGUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+IHVu
c2lnbmVkIGludCByZWcpIEBAIC0xMzY3LDE5ICsxMzYwLDI1IEBAIHN0YXRpYyB2b2lkDQo+ID4g
YWR2NzUxMV9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykgIH0NCj4gPg0KPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZvIGFkdjc1MTFfY2hpcF9pbmZvID0gew0K
PiA+IC0JLnR5cGUgPSBBRFY3NTExDQo+ID4gKwkudHlwZSA9IEFEVjc1MTEsDQo+ID4gKwkuc3Vw
cGx5X25hbWVzID0gYWR2NzUxMV9zdXBwbHlfbmFtZXMsDQo+ID4gKwkubnVtX3N1cHBsaWVzID0g
QVJSQVlfU0laRShhZHY3NTExX3N1cHBseV9uYW1lcykNCj4gDQo+IFBsZWFzZSBhZGQgYSBjb21t
YSBhdCB0aGUgZW5kIG9mIHRoZSBsaW5lLiBTYW1lIGJlbG93Lg0KDQpBZ3JlZWQsDQoNCkNoZWVy
cywNCkJpanUNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gPiAgfTsNCj4gPg0KPiA+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZvIGFkdjc1MzNfY2hpcF9pbmZv
ID0gew0KPiA+ICAJLnR5cGUgPSBBRFY3NTMzLA0KPiA+ICAJLm1heF9tb2RlX2Nsb2NrID0gODAw
MDAsDQo+ID4gIAkubWF4X2xhbmVfZnJlcSA9IDgwMDAwMCwNCj4gPiArCS5zdXBwbHlfbmFtZXMg
PSBhZHY3NTMzX3N1cHBseV9uYW1lcywNCj4gPiArCS5udW1fc3VwcGxpZXMgPSBBUlJBWV9TSVpF
KGFkdjc1MzNfc3VwcGx5X25hbWVzKQ0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8gYWR2NzUzNV9jaGlwX2luZm8gPSB7DQo+ID4gIAkudHlw
ZSA9IEFEVjc1MzUsDQo+ID4gIAkubWF4X21vZGVfY2xvY2sgPSAxNDg1MDAsDQo+ID4gIAkubWF4
X2xhbmVfZnJlcSA9IDg5MTAwMCwNCj4gPiArCS5zdXBwbHlfbmFtZXMgPSBhZHY3NTMzX3N1cHBs
eV9uYW1lcywNCj4gPiArCS5udW1fc3VwcGxpZXMgPSBBUlJBWV9TSVpFKGFkdjc1MzNfc3VwcGx5
X25hbWVzKQ0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2Rldmlj
ZV9pZCBhZHY3NTExX2kyY19pZHNbXSA9IHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBM
YXVyZW50IFBpbmNoYXJ0DQo=
