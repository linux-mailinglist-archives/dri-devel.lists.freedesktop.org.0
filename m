Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C4737913
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 04:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899D810E3A4;
	Wed, 21 Jun 2023 02:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3511510E3A3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 02:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2zukVBEuMWxJLk/qkiV3oVORgzZVdrpqkKqtOeWiDqVYgqvI8eFKeET2Re5qyQ6v+t8QWMJkAPqdw0Aog6zdmBCurEo/B7Ktbaz10AkigGoo09eFWyVo9q8p11sTT0SYADU3L6hpLdhERgF+hpQvC9VwedvClKBTWC0Qkw4yBFpArMIrvYq/wN6n3qRrqS2x53BcIYr5RHs5l44a2kzGeAtZtRZxfQR+arcVUYtPb4kFv24gXP5nVzZO9gr7uB1FnvIKYI1YLHi9NAhTwCnSrgpRXI6nYe+F9Sqj5bRViP6z3NUAdWKpNxTZSXJ4KEIWmExXBT4v1yIgvxxNJmT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEhTAxshwJ1c6WqhB7JgqwV7hHGym4f9OkwVKIdUpU0=;
 b=nlHOaa471P8llXDAxyef48bO98tYMSl+hxO1iAw2V+yQbtPnb3j9xu+eUD8weXpYpX5lirEIiWbzUb1D1Q9910J0Lq9aqLYmdKsCE28+2MgKhtovZoxRRnd+TLrkrT9FdUM4JhwMcWC2GRqUknyS1LT8nKthsMuV2Dg4zc0l+zxVlGRxmZ+NU4o5ujP+1TeJ2+0lzgO3Vz5aCZ9F3ow/VgtzXZ/W0QOEaYlyaSU+KpBB3YMAx3haPeZhxA7QRMfOB0UBbQRQn509geLky/F/LF/OlCK+qm4L3ulncfeQ2LpyMgeZHfkl+dvd408Q3xWtqkL19dGQ1ULFsaSArJMcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEhTAxshwJ1c6WqhB7JgqwV7hHGym4f9OkwVKIdUpU0=;
 b=qImspU8h6JSCUHFTQ0gzdi2YzFX+pzz/+oFNmz+3Bu4pox0vaM3NvXaIJzT0jYsY8V/uV1QzshG+aQ8r5CRIBIKinQtx7RZ5hAUM7tNTFqa3rj6eCRMKGEnUwWwz4hT0yCfu6WY0R9OfSOiVgHymsDS3daVvihrAHKS+CwK1jNk=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB7080.eurprd04.prod.outlook.com (2603:10a6:20b:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:23:17 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:23:16 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501 HDMI and DP
Thread-Topic: [EXT] Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501 HDMI and DP
Thread-Index: AQHZnyaUSqWcaXcpFUGfi3kfofmdrK+T3yMAgACnm7A=
Date: Wed, 21 Jun 2023 02:23:16 +0000
Message-ID: <PAXPR04MB94485F6E2DC5CDDBECED425FF45DA@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
 <20230620154856.GB3637514-robh@kernel.org>
In-Reply-To: <20230620154856.GB3637514-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM7PR04MB7080:EE_
x-ms-office365-filtering-correlation-id: 0ebd1511-eb17-495f-bfe2-08db71fe78f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tXrUJmyGXFHpEv1NvMmDoQzSmxnHSEAw0GQMnkBmGkr8nQvCnG8Oezitz2lktkzij0fRIdQjxZmQoQ6OnBhOvSi4arJqilN6/6bu5sv2GIrz9OozIxpxRvQUM3JDw9A4n10h2tHR4x4iXn5TbQ0q1uFMUYoyAPeadHER/szrwKXW7p1b7eF+Nyaxc687xtZFVPFk0rPqOGxx0Y3qmLDNjj30AJGI/tSZSJJlGk1Z2JWks7aHvPPEacrB5YJFORR3KePfRHC0cX+3dqBQ+ECFzPDaQ/OF4cKF236EL9KTWPb0kEO0Jrjz6pSb9ZPBXo6yawvAkAxXJGS6a5qrdsswCHGLHHYV7XeUFooMcbL0UBIr9aO4mGhkeT6G8Yj/mRoOBb9VvKZZPMhbViW6r0tLXyQHHWm00GaIJDHshD7iusK9q4twgyat/jBB9aiEEh4cE6k+Tz6TRsnEEq8TznsUIWom6LqDdn6n/l+DmL3XuLm61SGmbA/5dpPDhJEU3Wr6BRXX9Q7/ciMQN/ImNTy1yc7WKu836RIeIOft+iorKQUL6XySPDnLlBGte8NOyiCsqKlUq0U5p1PiyHuv7CiZZdnja/+IOPkE5u8+aGSeKfrX1KGufmY9bIsN/9c2h0sS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(53546011)(33656002)(6916009)(52536014)(5660300002)(44832011)(7416002)(8676002)(41300700001)(86362001)(8936002)(66476007)(64756008)(38070700005)(66556008)(76116006)(38100700002)(66446008)(122000001)(4326008)(316002)(55016003)(66946007)(6506007)(26005)(186003)(2906002)(9686003)(478600001)(45080400002)(83380400001)(71200400001)(7696005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VHpQSlhnQW4xcTFtdUowZ3gxNzVKZ1A3b1VIcU11dlk2UWNrclNPQ0Q4MlY1?=
 =?gb2312?B?OFhOV3JaSEliWnpaQ1VQTW0zR0pjV2xCT05laUc4UjVBUWdhaWhoUHY1eVAx?=
 =?gb2312?B?eU9NWE9HTnA0TW0xUmdaWmtUbzJoNC90dFV4OFNaSkk2RFlWWTlaeGF3cGM4?=
 =?gb2312?B?eEpreG9iejMxZm41RjF5MEIyd1BXLzg2OEx4b0VoeHk0M2crbytPSnhiL2Rj?=
 =?gb2312?B?WlFwSW9kNTZpL1RmYU5PUUJqdnBtdGZKbnBwNlBLVXlrSjJibU50a0MrQmhM?=
 =?gb2312?B?bWxFU2RSdURXMDFLRTU0cXRtZGk3eGVzM3gvSDZ1eG1YT3BHZ1hmeHNMS0la?=
 =?gb2312?B?UGVCdmY3QWNQZ1A0TURmRkk3TmRmRXByeCtUTzFhNE1uZTYvK0o4dXlGbHdv?=
 =?gb2312?B?Z25kZWFPYlBEU1FBYUdhYTZFajdlcElINE1Rb3FJalVpb3psdGZPZGlkTGhl?=
 =?gb2312?B?Z1lsRWNVZWFkL0xNQXFBK1NvZFJEdWNLS1FpeDVLOUxJMDA3WGgxeklCWFlu?=
 =?gb2312?B?NE9YQWtJTnNTMjVxaHdLb1RWTG1vaHdRWFl3RVhPcGxRcEV4aXBnaFFvQncw?=
 =?gb2312?B?MGtWZ05HVTQrcFdJZDd2RWV2RWtWdkxvNzUzSDR2dXBpR1IrQjJZbWpXYWlY?=
 =?gb2312?B?THYwTmc4R1d4STROMWIybkVKTHpQUDd6cmdqVDN4NVNBdTFXWC9ob2NldUYr?=
 =?gb2312?B?R2daaVFUdUVLcHhxc08wWmRhbCtvZHRuRU9ESEdaaldJSlAyZGluVDFuekNp?=
 =?gb2312?B?aE1Rb0lhWi80b1E0ek1OQjNON0ttS2E5OFV5NG5GckNxaVByeG1sTStBN0hJ?=
 =?gb2312?B?OXVPRXYzL2lkZDZySXMzSWxlRVlteFl2ZVpnUWdGaGhmK09EUHlqN0h0ZFJ6?=
 =?gb2312?B?TFZkb0FRdmtsNnNTQk9ZcWJLTWNnN3hwN0hmQTNWc2JXdFExRUJ1SVJ4c1R0?=
 =?gb2312?B?bWx5alVaUUhRYzBWTU5makdmeGJpNGJ5Q1J6ZXlRaXhVbmxvMGlnbXJtN0tu?=
 =?gb2312?B?Sm9uTzhPb3BmNDFHNkV3dTZGdkx4OUtkdHc1d2pyTFhCWFljYm1Yb1puYkpa?=
 =?gb2312?B?UWpCR09DZnRnSFNTUVBuOUhOazNrdzdKMGxoY2xhTEUzVFZOZ1MwRitJZVBT?=
 =?gb2312?B?QUpRVEhON1ZNTzVxdTh0MVdHT0tqTlZ1ZjB6dkNPL2RVckRLNDM1YkZFUk9H?=
 =?gb2312?B?MC9SWFdqQUl3N2p6VERaRzl1YkVxR0d5eTBZSTZSZjZEMi9aQ29oeTFuU0hp?=
 =?gb2312?B?OUgwbXBiTlY4TVBTTUhldFpFQ3pxRlJlOXRDSTVPSGJ6MmltRVk3K3YrSFN3?=
 =?gb2312?B?YnVJU0xpelFuVkVsQjN3SVBIbVlHeE9CRUtlMG5VRVZRa0cwcXQyR0RaL1d1?=
 =?gb2312?B?NyttdWdzaVkyVWdrdERtaURmM3Y1SWlhWEd0YWdpcmV5RlJSa0FiNEpRdUV0?=
 =?gb2312?B?dTk3RlNTOUhURHJRU09FTnR6NG9zcGJNR0o5WUpvbnQwU3ZOamJXSVl3VXJD?=
 =?gb2312?B?aXZyYVpTc2M4R20yZTZiWDljMUhwenIrNTZoN2tucDFBZnJGMkkrWmc2ZklV?=
 =?gb2312?B?N2pIczNKTURVYnBJbmkySXVodlQ2Z3ErUTBUditramZnNkdyV2djbmtnWkVL?=
 =?gb2312?B?d0hMUXVkWFNEWEMyTy8xWklFempxYmpKRFhHWmRSbjNJSklxMHB3R3FGMTk4?=
 =?gb2312?B?YzNoSzhmVDczWEVCQ0IvVEZaeDgxMkhnVFROTmt3NkxGem9YSmk0MEZDcGh4?=
 =?gb2312?B?Y0w3N25QSkc1em42MSt5c2s2SHpSWkVUZjhoVXBkR3JzTFdNWVRMTkpGTFNs?=
 =?gb2312?B?ajBBZFltUm1ucmdDbnNjQVJJUzNieW9kUjc2NGxlZWp0VWNQaHNWaGVrY2ZQ?=
 =?gb2312?B?SE95VXBXRVVPem1UYWxuTnFkU0hHUS9pSy94dDRLdUlyWUcxemVqNDZEdVNV?=
 =?gb2312?B?SG1vVW5TTHdjc2g5c2RiQjZsdzU1eUQyNE5yZFBrT2x6T3JrMnBlZnh1ZFBl?=
 =?gb2312?B?NGFOL3BndElEMmNwd0lsMlBsbW4yTk9kTFMxK1dVbVNQUkdIdHJZaXMxTWI5?=
 =?gb2312?B?eW54aTdHZnJwRi9mYmg0SmdLNzJEcy95dkFqSlNXY2UxTHJJVUtYWWZrTVhl?=
 =?gb2312?Q?TIUs=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebd1511-eb17-495f-bfe2-08db71fe78f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 02:23:16.7976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biEErM9EUeRiYUwumMOmhoc4qmYHHMetPdHgjUfOCh3O3Ublr411rel07M++pDLnX6ftKFSWXLb+hvJJOyvqiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7080
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gU2Vu
dDogMjAyM8TqNtTCMjDI1SAyMzo0OQ0KPiBUbzogU2FuZG9yIFl1IDxzYW5kb3IueXVAbnhwLmNv
bT4NCj4gQ2M6IGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8u
b3JnOw0KPiByb2JlcnQuZm9zc0BsaW5hcm8ub3JnOyBMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb207DQo+IGpvbmFzQGt3aWJvby5zZTsgamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyBh
aXJsaWVkQGdtYWlsLmNvbTsNCj4gZGFuaWVsQGZmd2xsLmNoOyBrcnp5c3p0b2Yua296bG93c2tp
K2R0QGxpbmFyby5vcmc7IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsgdmtvdWxAa2VybmVsLm9yZzsNCj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7IGtlcm5lbEBwZW5ndXRy
b25peC5kZTsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNvbT47IE9saXZlciBCcm93
biA8b2xpdmVyLmJyb3duQG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjYg
Mi84XSBkdC1iaW5kaW5nczogZGlzcGxheTogYnJpZGdlOiBBZGQgQ2FkZW5jZQ0KPiBNSERQODUw
MSBIRE1JIGFuZCBEUA0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4g
UGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5pbmcgYXR0YWNo
bWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9y
dA0KPiB0aGlzIGVtYWlsJyBidXR0b24NCj4gDQo+IA0KPiBPbiBUaHUsIEp1biAxNSwgMjAyMyBh
dCAwOTozODoxMkFNICswODAwLCBTYW5kb3IgWXUgd3JvdGU6DQo+ID4gQWRkIGJpbmRpbmdzIGZv
ciBDYWRlbmNlIE1IRFA4NTAxIERpc3BsYXlQb3J0IGFuZCBIRE1JIGRyaXZlci4NCj4gDQo+IEJp
bmRpbmdzIGFyZSBmb3IgaC93LCBub3QgYSBkcml2ZXIuDQpPSywgSSB3aWxsIGNoYW5nZSBpdCBp
biB0aGUgbmV4dCB2ZXJzaW9uLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmRvciBZ
dSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kaXNwbGF5L2JyaWRnZS9j
ZG5zLG1oZHA4NTAxLnlhbWwgICAgICAgICB8IDEwNQ0KPiArKysrKysrKysrKysrKysrKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9jZG5zLG1oZHA4NTAxLnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5zLG1oZHA4NTAxLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9jZG5zLG1oZHA4NTAxLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uYTU0NzU2ODE1ZTZmDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKw0K
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jZG5z
LG1oZHA4NTAxLnkNCj4gPiArKysgYW1sDQo+ID4gQEAgLTAsMCArMSwxMDUgQEANCj4gPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAx
LjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4NCj4gK2NldHJl
ZS5vcmclMkZzY2hlbWFzJTJGZGlzcGxheSUyRmJyaWRnZSUyRmNkbnMlMkNtaGRwODUwMS55YW1s
JQ0KPiAyMyZkYXQNCj4gPg0KPiArYT0wNSU3QzAxJTdDU2FuZG9yLnl1JTQwbnhwLmNvbSU3QzRk
NGUxMThkNjBkNzQ0YjVkYmE3MDhkYjcxDQo+IGE1ZGU3OSU3Qw0KPiA+DQo+ICs2ODZlYTFkM2Jj
MmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM4MjI4NzI5NDM5NjU1MzANCj4gMiU3
Q1Vua25vDQo+ID4NCj4gK3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pR
SWpvaVYybHVNeklpTENKQlRpSTZJazENCj4gaGFXd2kNCj4gPg0KPiArTENKWFZDSTZNbjAlM0Ql
N0MzMDAwJTdDJTdDJTdDJnNkYXRhPVVFc01ka1pCbWZEN3RNMXd6SjcxDQo+IERIUW9pNHpWT2tw
VA0KPiA+ICtBOVRORTdSeG4lMkI4JTNEJnJlc2VydmVkPTANCj4gPiArJHNjaGVtYToNCj4gPiAr
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAl
M0ElMkYlMkZkZXZpDQo+ID4NCj4gK2NldHJlZS5vcmclMkZtZXRhLXNjaGVtYXMlMkZjb3JlLnlh
bWwlMjMmZGF0YT0wNSU3QzAxJTdDU2FuZG9yLg0KPiB5dSU0MG4NCj4gPg0KPiAreHAuY29tJTdD
NGQ0ZTExOGQ2MGQ3NDRiNWRiYTcwOGRiNzFhNWRlNzklN0M2ODZlYTFkM2JjMmI0YzZmYQ0KPiA5
MmNkOTljNQ0KPiA+DQo+ICtjMzAxNjM1JTdDMCU3QzAlN0M2MzgyMjg3Mjk0Mzk2NTUzMDIlN0NV
bmtub3duJTdDVFdGcGJHWnMNCj4gYjNkOGV5SldJam9pDQo+ID4NCj4gK01DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzDQo+IDAwMCU3
QyUNCj4gPg0KPiArN0MlN0Mmc2RhdGE9WnUzdjB5RzJCWFdYdlRXVjVvTGlHdmR1M08zUGhLJTJG
cllOSklTMnpId3BJJTMNCj4gRCZyZXNlcnZlZA0KPiA+ICs9MA0KPiA+ICsNCj4gPiArdGl0bGU6
IENhZGVuY2UgTUhEUDg1MDEgRGlzcGxheXBvcnQgYnJpZGdlDQo+ID4gKw0KPiA+ICttYWludGFp
bmVyczoNCj4gPiArICAtIFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4gKw0KPiA+
ICtkZXNjcmlwdGlvbjoNCj4gPiArICBUaGUgQ2FkZW5jZSBNSERQODUwMSBEaXNwbGF5cG9ydC9I
RE1JIFRYIGludGVyZmFjZS4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0
aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gY2RucyxtaGRwODUwMS1kcA0KPiA+
ICsgICAgICAtIGNkbnMsbWhkcDg1MDEtaGRtaQ0KPiA+ICsgICAgICAtIGZzbCxpbXg4bXEtbWhk
cDg1MDEtZHANCj4gPiArICAgICAgLSBmc2wsaW14OG1xLW1oZHA4NTAxLWhkbWkNCj4gDQo+IElz
IERQIHZzLiBIRE1JIGZpeGVkIGZvciBhIHBhcnRpY3VsYXIgU29DIGltcGxlbWVudGF0aW9uIG9y
IGl0J3MgYSBib2FyZCBsZXZlbA0KPiBkZWNpc2lvbi4gSW4gdGhlIGxhdHRlciBjYXNlLCB0aGUg
dHlwZSBvZiBjb25uZWN0b3Igc2hvdWxkIGRldGVybWluZSB0aGUgbW9kZSwNCj4gbm90IGNvbXBh
dGlibGUuDQpEUCBvciBIRE1JIGlzIGJvcmQgbGV2ZWwgZGVjaXNpb24uIA0KQmVjYXVzZSBEUCBh
bmQgSERNSSBoYXZlIGRpZmZlcmVudCBpbml0aWFsaXplIHByb2Nlc3MgYW5kIGxlc3MgZnVuY3Rp
b25zIGNvdWxkIGJlIHJldXNlLCBzbyB0aGV5IGhhdmUgZGlmZmVyZW50IGRyaXZlcnMuDQpQbGVh
c2UgY2hlY2sgaXQgaW4gcGF0Y2gNCltQQVRDSCB2NiAzLzhdIGRybTogYnJpZGdlOiBDYWRlbmNl
OiBBZGQgTUhEUDg1MDEgRFAgZHJpdmVyDQpbUEFUQ0ggdjYgNS84XSBkcm06IGJyaWRnZTogQ2Fk
ZW5jZTogQWRkIE1IRFA4NTAxIEhETUkgZHJpdmVyDQoNCklmIHVzZSB0aGUgdHlwZSBvZiBjb25u
ZWN0b3IgdG8gZGV0ZXJtaW5lIHRoZSBtb2RlLCBoZG1pIGFuZCBEUCBkcml2ZXIgaGF2ZSB0byBj
b21iaW5lIGludG8gb25lIGRyaXZlci4NClNvIHRoZSBjb21wYXRpYmxlIG1heSB0aGUgYmV0dGVy
IGNob2ljZS4NCj4gDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+
ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjogTUhEUDg1MDEgRFAvSERNSSBBUEIgY2xvY2suDQo+IA0KPiBTZWVtcyBvZGQgdGhl
cmUncyBubyBjbG9jayB0aWVkIHRvIHRoZSBwaXhlbC9zZXJkZXMgY2xvY2suDQpNSERQODUwMSBm
b3IgaS5NWDhNUSB1c2UgdGhlIHBpeGVsIGNsb2NrIGZyb20gUEhZIFBMTCBub3QgZnJvbSBleHRl
cm5hbCBDQ00uDQpUaGUgcGl4ZWwgY2xvY2sgd2lsbCBiZSBzZXQgaW4gZnVuY3Rpb24gcGh5X2Nv
bmZpZ3VyZQ0KDQpCLlINClNhbmRvcg0KPiANCj4gPiArDQo+ID4gKyAgcGh5czoNCj4gPiArICAg
IG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBpdGVtczoN
Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogSG90cGx1ZyBjYWJsZSBwbHVnaW4uDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IEhvdHBsdWcgY2FibGUgcGx1Z291dC4NCj4gPiArDQo+ID4gKyAg
aW50ZXJydXB0LW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IHBs
dWdfaW4NCj4gPiArICAgICAgLSBjb25zdDogcGx1Z19vdXQNCj4gPiArDQo+ID4gKyAgcG9ydHM6
DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+
ID4gKw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgcG9ydEAwOg0KPiA+ICsgICAg
ICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgSW5wdXQgcG9ydCBmcm9tIGRpc3BsYXkg
Y29udHJvbGxlciBvdXRwdXQuDQo+ID4gKyAgICAgIHBvcnRAMToNCj4gPiArICAgICAgICAkcmVm
OiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gPiArICAgICAgICBkZXNj
cmlwdGlvbjoNCj4gPiArICAgICAgICAgIE91dHB1dCBwb3J0IHRvIERQL0hETUkgY29ubmVjdG9y
Lg0KPiA+ICsNCj4gPiArICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtIHBvcnRAMA0KPiA+ICsg
ICAgICAtIHBvcnRAMQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxl
DQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+
ICsgIC0gaW50ZXJydXB0LW5hbWVzDQo+ID4gKyAgLSBwaHlzDQo+ID4gKyAgLSBwb3J0cw0KPiA+
ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxl
czoNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9pbXg4
bXEtY2xvY2suaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4gKw0KPiA+ICsgICAgbWhkcF9kcDogZHAtYnJpZGdlQDMy
YzAwMDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4bXEtbWhkcDg1MDEt
ZHAiOw0KPiA+ICsgICAgICAgIHJlZyA9IDwweDMyYzAwMDAwIDB4MTAwMDAwPjsNCj4gPiArICAg
ICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDI1IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0K
PiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJwbHVnX2luIiwgInBsdWdfb3V0IjsNCj4g
PiArICAgICAgICBjbG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX0RJU1BfQVBCX1JPT1Q+Ow0KPiA+
ICsgICAgICAgIHBoeXMgPSA8JmRwX3BoeT47DQo+ID4gKw0KPiA+ICsgICAgICAgIHBvcnRzIHsN
Cj4gPiArICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgcG9ydEAwIHsNCj4g
PiArICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAg
ICBtaGRwX2luOiBlbmRwb2ludCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZkY3NzX291dD47DQo+ID4gKyAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAg
ICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgcG9ydEAxIHsNCj4gPiArICAgICAg
ICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBtaGRwX291
dDogZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmZHBfY29uPjsNCj4gPiArICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgIH07
DQo+ID4gKyAgICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K
