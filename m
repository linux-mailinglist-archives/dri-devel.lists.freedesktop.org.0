Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FCC4FD960
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E92610E0A7;
	Tue, 12 Apr 2022 10:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88F210E0A7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkvcKLTz9/rMNwwtR8eB+mKzHTI/w6Z1DD89+r0DPPm34o3nw0T7/uLn3I3gk+HsYpud7gy4dImn2c7dm63hZWqKoPRzz9NDcrnRSVJbEveIhBtRF/+3dkfE3eKVxGG/WI0VNAlPpMEye0SYDx+vvaoK4fw0NuJIcXHSfgEbSej0ZYACh6X0EEZamES+JemB8wEdYcqwvUJu24jB8GkIfoG8Lh7UQJM1SSaVme2PfRtdbnVTPWMRNQ/lBfXjSkw0g6Ub2brYYK9MjV0ZdWHAs+fyRAFqKFoKGGJ6qt0WmdZO12i3ykjaxP06J28Z9Rbb766TEbuiGyU5UpBx57wqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pDm+l3J+HVet4jhIx8XNLEeSoB9DPV7seCbqRvo9hE=;
 b=RTQd+1oGg7WbgDWIuv0lePSvup8BneMn3L7rT8xao6glx5cJ2LAW0zUi4Q15ksDgazmZm13W24L2102AGMF24fMJV9FDnYvQ5eQBx9qp9pWdjjaXmJ0nCvTrPsGqBt0vezMN2M1bRZdYklr5HD/hrgBo9isT7jUJ7BHSdrDB9/4wMqAc8paOe1jD79Ma8hW68RQIgTM+RbNzeJ1O0ENrjc8qdNDMbzojNokETaLxNVLwp+FrhqavodeUmdmNAZw5hg8fWbSTS+5fDiL7AROt12xGJhZpXyl5STa5rtELE47GOZjwm9Dnguoc/mNJWxn0Y1Haiy4oXg+URK3YwQRFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pDm+l3J+HVet4jhIx8XNLEeSoB9DPV7seCbqRvo9hE=;
 b=gaX3y/rZP82NpaoPfGgxz8y++qWWq/aLJdN7y8B4IBAovi+ylcj5SSJBMh3rpqSoauaR6qAOJoY57RGpskXTUH00i612MogbG8YbTA86At+Clnjuxzs40FRd1+diP4fmQcPx67Qxz5Bptu5GxMdfBlsVmMNpiCqYU267Z6pj6Ts=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1923.jpnprd01.prod.outlook.com (2603:1096:603:1c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 10:40:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 10:40:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Thread-Topic: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Thread-Index: AQHYOTdPILt0vWqjr0eFmBKEOUG5TazsNjYAgAABaGA=
Date: Tue, 12 Apr 2022 10:40:24 +0000
Message-ID: <OS0PR01MB5922C4C58329F538A418547886ED9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUKDn3tAS01vm7be9SF0=rsWLMD1vxmNtdTyhHHBJHrtw@mail.gmail.com>
In-Reply-To: <CAMuHMdUKDn3tAS01vm7be9SF0=rsWLMD1vxmNtdTyhHHBJHrtw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0524451a-bb7c-4278-0137-08da1c70d9da
x-ms-traffictypediagnostic: OSAPR01MB1923:EE_
x-microsoft-antispam-prvs: <OSAPR01MB19230601A39125E9075DB4B586ED9@OSAPR01MB1923.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqXRvP0vP2Qe5G8OdgVpJfQQlTn6iVj53ES6Hwn89AamuiIYz1WnEzdDfchRh2ILoRzIj1ea0vIxueEtSjlKsCMsTdgwREs6Nc/CalwikqAxA33BGrbs0Zmke2DteQ6JolsYTvAycyJ4ZjR46Bv0WVOkR3lUiCYfLs9S+Gb4LtNrLPuoF8/ICQS8rKAurySLYg3l38g46pCoB+LZjoocFrzpMaDAm8SrCkvLKwZwVdKoy5QBMjngb5xw9SF3M7g3o/qBOI8THa2U1gOWG1g/R1ksE6sOEbAeq830jQp5S5IjvNnHv/TnXUnIT29T/GvdXzzqK7D6OZzLAg2H5T86s9AjnpjGiLrMXXm7KSWmEYgimOAJ2dFvZDpP8NzRbcPLKcCZ3EJRAvdsENz9t039BVwklMJZ4+i39Ei+OWYX12g2MOHwNH+0QyHfEmYqpxTkFm+8bmBAWJQmv130eZDpfpB4ZI7zY3z+ibnabZtJFdRhS/J96HhtL5whU4KEyR4/W1vA1kf+daPw6w2UV/n/JzwYjZMpQpqDU8VXeKG+15JsArUq3/+Pbg307oGUOd9mEcR1rQCIDOSeizj1k4wi50f1l/BqKaM6TL+KxFobDEJKPTuYM7ftn0aL6VMtRymItR0MUczJyggHicMI3bxvLSkothiQKvcY4gwzVD4pWZFDt1z5Tcp/v5NZZ1u09Aw1u0tQvqFNwGUf0pI/kqHD0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(52536014)(8936002)(38070700005)(7696005)(107886003)(86362001)(71200400001)(66446008)(4326008)(66556008)(8676002)(64756008)(66476007)(76116006)(5660300002)(66946007)(7416002)(316002)(54906003)(2906002)(6916009)(33656002)(508600001)(186003)(38100700002)(122000001)(26005)(55016003)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWIxTmpMdlIzZktuUDZFM2IwZzZzdlZDb1ZlZEdWT2NMNjhUaXhVcmhLYS9N?=
 =?utf-8?B?U0hVelhId0VyV2Uxd1lTblFWeUdwRHh0NE1qOXFDQVhCc2JVU1NoRVhNVHFO?=
 =?utf-8?B?NDcxRWp4Skx5NDZ3RDF1Qk56UlAvZUtHdytmSy9nN3JHOWw5clJIOGlXdHB6?=
 =?utf-8?B?N2lLM1JuNXljc1JPWEU5MFkwam1nMUtEbE9RM0sxY3c4SkxRVEtRTkZYcFhS?=
 =?utf-8?B?SXRGV0hzT2I2Y2ZVd3p2bzdVWlF3R3VucU10YzZ5aUNCRnRtTjJObzZVcW85?=
 =?utf-8?B?YmZ6YldsaUVtY1I5bldIN3FCV1BzNVhNRWJBZEl0eWRxSFB2OHN2RzZsR1FT?=
 =?utf-8?B?VDFkZUJQWENPYnN6V2p2V2RSb1l1THJrbTR1cFFmNFRrMXN6cms3L1UwbFBF?=
 =?utf-8?B?TDR3YVJRWTUzUHNTU01iM3ArZGxTb05nTmg0VTdpS2ZMdk96YlNMZkVMeDNE?=
 =?utf-8?B?SHNOTTc3V0granVFK05hcVpJMFJyc1NlaFRJT1FrZTY4ZG0wbGRYWUN5amV3?=
 =?utf-8?B?UTM0ZXlWR2RGcGJrYzd3amtoaHJ5aDcrYWc2c0xvVm9YbGkxbk5XSk5HMVFu?=
 =?utf-8?B?Mjl2b1FoNVZ0eWtDMUorekNac09vNCtDY1JjcC9hMWxpMVVzRHdra2owUFFi?=
 =?utf-8?B?bGd2TGlUKzV4bWdyQ0FRVVRFbVRFUElWT040QlJvTy9QZ3VwRTRIOGFFRTEy?=
 =?utf-8?B?d09URHk2VGJReW8rbkpJRVA1WnJLVklWQ2lTU0t1ZWJmSjFGU1VtcUdmVTZx?=
 =?utf-8?B?ZXdTeXN3TW1HQTdCeFFuclhVOTBJNldCWjdmczdBUGI5V3ViMWNHa1R0R3NX?=
 =?utf-8?B?ampBWTFmbHJBNVNsSk5rdGQ0S3pkVEgwNWM4UytWWVRlVkROc1Ivc2FObnB6?=
 =?utf-8?B?ZGwvVUhFR0ZTbWhoTTBWVTh5OEl0MmJDSEt5U0RXWHVHV2R6aXN2Qk5KOW9U?=
 =?utf-8?B?bDZIOE1yNUMyZVhIdGlXVFc3UHZ1dTdrS3ppV0RNMHVvejYxVENYUFBzSDVG?=
 =?utf-8?B?ckI2NVBkakFmUGJoRXJ5bk1qdWZmOTN2MDMwYmk4dnZrSmY3WHVaUzBnNit4?=
 =?utf-8?B?NEE1ZFV4VXBwVy9hbnFLekJOVHZKaDFIdzRTTjFrb21Jek9Ldm0zRkJwNkdE?=
 =?utf-8?B?YlVZeTF4RDFRZ3oxUUdGZDQrUTdZdjRzQjlaRmNETGQ4VnRYWVJDeXBhMmhN?=
 =?utf-8?B?dGV0eGk2ZDZnUnoxRzZjdnFkNGYzZTN1OXBuUXhSUk95OWNVbXFuVjJpR29E?=
 =?utf-8?B?QnY4cUFQaHY3YjZmY1RReWw5TENzbmJRN09CN1ZOZ244UDV5WmovcEJXeksz?=
 =?utf-8?B?Ym96Yi9sZWZkdkhNbVowRUJzU1E4OC9BaGx3dVZudExkZ3B1Tmo3QTE3Z2Fy?=
 =?utf-8?B?UDNhaG44SHp0a3dsVkUvbSsvUll2cU1tQy9xTzZxQm8yd0VzeEJwY3gvOGhs?=
 =?utf-8?B?UVlBWkU3STRwWUVUbnpJRFUrSjJodG9uQXFhRm9KYTFodjZXM1FienpFQnRj?=
 =?utf-8?B?enQwSmlZb2VJNm15ckdNWGU2dHNzckFRWnB2RmFhcThJQzQ0K0l6aTBwUUhS?=
 =?utf-8?B?M2dEeTNMWGtDQWJxRzNDbnFtTDAxWnc5OWRPbTYveWF1UEMvc2JzZGg1TWI4?=
 =?utf-8?B?c1l1OWlsQWFPKytGcCt0UndaYzZRTXE3SmZyRTkwaXNRalo0c1F6K2gwbElL?=
 =?utf-8?B?SEFBTmV0eHd4NksveElzWTBMbEN5NmNMWnJlYmUxNE5XVjdLU08zZmk2cnpE?=
 =?utf-8?B?NW00Z2xFWnRwUzVlK1czaTdmQzFJaTM5d1BpaHh1TU4wS1F2OVo5d0J3WUd6?=
 =?utf-8?B?OFE3WlhValI4eTVRdW0wcTkzbVp1RmRBWUZJT3Z1S3lxSktwOWR6bUdPbVph?=
 =?utf-8?B?Sjc3UmhROGd5dTNnOTNnS3BPL2R4c2VUNjZra1ZLbW96L3lDeGdtVi9QMWpH?=
 =?utf-8?B?c2FFSTdiU1RKMHZLZWo2Mmc5cFBuYkpBWWQvRnZZSkxRbTNTWkNpRXFFTXVQ?=
 =?utf-8?B?NS9kRkZPYlQ0UlBmLzEvcTBUWm9WQ3poWDRray9mQ2k0TmFONlJycy8wMGJ5?=
 =?utf-8?B?ZmZ1WEU4enhPa0Y1QjhvSkxCVHNkT3RndEkyeGNMcDhRcUhVWnk4bHlHSk1i?=
 =?utf-8?B?a2xQQW52ekRRcG91ZlNHUnl2WDcyWmxtcGR4K3BIbUp0Z3FCMzNNQ1RON01E?=
 =?utf-8?B?cVVaUjJ3alhDOVJXOUVyekM5ZGo3cXJiOUZjVUV2OHVkTk9DdE9Ebk42RUpo?=
 =?utf-8?B?T21RendiSGo1VmswMDNiMHUwbWNRbS8wU2tYU0RZWnJpTUtoUWJaMEUzdjg1?=
 =?utf-8?B?WHUyS0RZSWUyZUc1RTFwZjJ4R0tkL1NONTlmZ3E2VjlQU3NhRUYzWnVtS2l2?=
 =?utf-8?Q?miANhEQlUYuxaf2U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0524451a-bb7c-4278-0137-08da1c70d9da
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 10:40:24.2267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2MfjeJRuEIuY95KRB/lClyOjawHcpMctJNU0VTxxrnhe+xL7tNsls1yjVFK1NCbzUfoWKMaaHp1d+VBTD55AY5LWD7lJdvFVo3yTkowFnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1923
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxLzddIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzLGR1OiBEb2N1bWVudA0K
PiByOWEwN2cwNDRsIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBNYXIg
MTYsIDIwMjIgYXQgMjoxMSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IHdyb3RlOg0KPiA+IEV4dGVuZCB0aGUgUmVuZXNhcyBEVSBkaXNwbGF5IGJpbmRpbmdzIHRv
IHN1cHBvcnQgdGhlIHI5YTA3ZzA0NGwgRFUNCj4gPiBtb2R1bGUgZm91bmQgb24gUlovRzJMIExD
REMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUueWFtbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVz
YXMsZHUueWFtbA0KPiA+IEBAIC00MCw2ICs0MCw3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAg
IC0gcmVuZXNhcyxkdS1yOGE3Nzk5MCAjIGZvciBSLUNhciBFMyBjb21wYXRpYmxlIERVDQo+ID4g
ICAgICAgIC0gcmVuZXNhcyxkdS1yOGE3Nzk5NSAjIGZvciBSLUNhciBEMyBjb21wYXRpYmxlIERV
DQo+ID4gICAgICAgIC0gcmVuZXNhcyxkdS1yOGE3NzlhMCAjIGZvciBSLUNhciBWM1UgY29tcGF0
aWJsZSBEVQ0KPiA+ICsgICAgICAtIHJlbmVzYXMsZHUtcjlhMDdnMDQ0bCAjIGZvciBSWi9HMkwg
Y29tcGF0aWJsZSBEVQ0KPiANCj4gInJlbmVzYXMsZHUtcjlhMDdnMDQ0Ij8gQm90aCBSWi9HMkwg
YW5kIFJaL0cyTEMgaGF2ZSBhbiBMQ0RDLg0KPiBJIGJlbGlldmUgdGhlIGxhY2sgb2YgcGFyYWxs
ZWwgZGF0YSBzdXBwb3J0IG9uIFJaL0cyTEMgaXMganVzdCBhDQo+IGxpbWl0YXRpb24gb2YgdGhl
IHBhY2thZ2U/DQoNCkZyb20gdGhlIGJsb2NrIGRpYWdyYW0gMjQtYml0IHZpZGVvIGRhdGEgZnJv
bSBEVSBpcyBjb25uZWN0ZWQgdG8gYm90aCBEU0kgYW5kIHBhcmFsbGVsIGludGVyZmFjZS4NCkhv
d2V2ZXIsIFNvQyBwYWNrYWdpbmcgd2lzZSBSWi9HMkxDIHN1cHBvcnRzIG9ubHkgRFNJIGludGVy
ZmFjZS4NCg0KUlovRzJMIHN1cHBvcnRzIGJvdGggRFNJIGFuZCBwYXJhbGxlbCBpbnRlcmZhY2UN
ClJaL0cyTEMgc3VwcG9ydHMgb25seSBEU0kgaW50ZXJmYWNlDQoNCk9LLCB3ZSBjb3VsZCB1c2Ug
InJlbmVzYXMsZHUtcjlhMDdnMDQ0IiBhcyB3ZWxsLiANCg0KUmVnYXJkcywNCkJpanUNCg==
