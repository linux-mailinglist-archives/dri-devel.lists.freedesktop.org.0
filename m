Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B03CE8E8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 19:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F1E6E1F5;
	Mon, 19 Jul 2021 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A1A89CB8;
 Mon, 19 Jul 2021 15:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY6k3d+57/+C9rDWHJS2eMXOi8xyIjpqMoQkMWDso3HTeO5+aj2+hHOjlWIQ+/hJK0G6UQTfKyn5OmvYBCrRhzFH1/fUTu0kSb1TTqHligw8LHS0O/yV8HIrQZUgbmmYlLlK8jxl8u7k6ozLrpnFfqY3N1eE2QLkapWJ8GnIB8vZznKFSLk1gv5my8OxdvTC/nwnP5q2sm+N8msJOxDLPiLxB0H6w4ZvZB44kvjBaS1dduk50HQV3+hv1tYt6yB9Qk1OqWAvgFxb/5KGHHd70c2sydw3tQ8DQbKW1Q1XT+KqiAPPMnEGgsXliFdjlhhVU1ivNKpWn6zLh77cCIFetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLkHLUlb7g5dwe6ybZKiouuFw+je3p7JaGptRL/Fp+E=;
 b=cnoZYOefzNjIFkWTrC5NN6Gpb7YDZgV5fZSET9JnINLc4TksaKwW3G70qreYpxXAvJ1/USu0LmeOKXSE3TfL7p/4q2Q5AkfXbJaeEE9QpwxBCS4BIyGwxeclcA96VxZjJl1TqBITgPcDTxolb3N+kZ+95XVIapKK56iUuIsjDSRUwl94lUgAWpaSw2TdRLv3DkYmKx3fMncYUyJCmnLt6eLopoQU9DVFQ+hEKW5N1b4JIjyphLtI2iO0VJ6bqgxJHeuY+NurJN5iwmYu6eP/p2MT+8Afxkr/ZRR8mW67J2kfYrKVDVTM2Qc3T1dg2nfELxtk0hiSSAjnZ3PG39lTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLkHLUlb7g5dwe6ybZKiouuFw+je3p7JaGptRL/Fp+E=;
 b=BGL7BMauW9EzgG9iYENzPUclTxtQ2h2z/Nh0WTckjYLb3MgS9nRVfUM3/0UwFzjA9S6YxGn38ICCpiX8wPbTXrkz/IvShzvRi75eurHw3R7AnJjw8wSqXM/FuMRVBn5yEiNFaLHebuoFNQKdrukur//weohxMGVl0DKDT4arppw=
Received: from BYAPR02MB4535.namprd02.prod.outlook.com (2603:10b6:a03:14::16)
 by SJ0PR02MB8514.namprd02.prod.outlook.com (2603:10b6:a03:3f5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 15:38:31 +0000
Received: from BYAPR02MB4535.namprd02.prod.outlook.com
 ([fe80::559e:6c95:48ae:61ab]) by BYAPR02MB4535.namprd02.prod.outlook.com
 ([fe80::559e:6c95:48ae:61ab%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 15:38:31 +0000
From: Jianqiang Chen <jianqian@xilinx.com>
To: Michal Simek <michals@xilinx.com>, Qiang Yu <yuq825@gmail.com>, Marek
 Vasut <marex@denx.de>, Madhurkiran Harikrishnan <MADHURKI@xilinx.com>
Subject: RE: [PATCH] drm/lima: Convert to clk_bulk API
Thread-Topic: [PATCH] drm/lima: Convert to clk_bulk API
Thread-Index: AQHXfHMPVOitukVVVESdBV5slsAXQ6tKbt+g
Date: Mon, 19 Jul 2021 15:38:30 +0000
Message-ID: <BYAPR02MB45351BFFE6881440CBFC6FC7ACE19@BYAPR02MB4535.namprd02.prod.outlook.com>
References: <20210716182051.218575-1-marex@denx.de>
 <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
 <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
 <CAKGbVbtRuVeUBD+m3J5U5AP_FM5S7i_qGXR-AHNeLnRogutVEQ@mail.gmail.com>
 <7462de54-5193-1606-7a93-390ad93c3b17@denx.de>
 <CAKGbVbt2nwcpf-H=gzR1-jEus7Dse36ikBt5Rg+QjmxKWLYOQw@mail.gmail.com>
 <7e75b9d0-0295-d04d-527f-971633f36532@xilinx.com>
In-Reply-To: <7e75b9d0-0295-d04d-527f-971633f36532@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3529acef-00d4-4b5a-1772-08d94acb42e2
x-ms-traffictypediagnostic: SJ0PR02MB8514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB85142BE2006C0008E22862F5ACE19@SJ0PR02MB8514.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2vM5+rKvcBmPsRXOZhcrYRGn7i+uX94gNdwS/niFfRxw6fMlBFI+W9bXj1GmE4BFk//rK6YxknmVLPZwWY6ZDtWlp1COp3TFQ1zv0dndRa/Xunf6jhEhia7vJltwP3cp8NNsS59vW8MzzWZMUrGzaX6RbeTg/wqiamrWZeopAaFu5lLebETu03qeVIq1KakEu9tQpHxa2+Rf+xVOIbaOyxrnrGzQaFQ3vYT5xh+4ffxhZHVpHM9aj6shYg2CJNVRIA2OIcSwpeSeVeXamyqZbSwOEL8hPOaqvGmTBWJmcgXVXSbWmI0H+MXUg0c+hSirbdjZCSeGKUsfdz/05JaFcxPq1ItwpK7XYqQKvEbjL9VYnXE8qrfkPfTwp3CE3kbqL9j3mF4C7lumSVCsz5wezVTCTSDdi73jiagK4fGNpVXtiYIYQgiFKDKcAoAt3QeCBUINW7hmH2jjDKN2HzPsJjFhYXUKhkx08wH6Rk3bvCJ7Jf6sjDzOfrOpWYawfLIjWc4S+c+Jd10tpNB3Y13EQ0EmCgqWhu6dUl/KkdyvIuN9RY8j0qqDzAatyQn2Pdu/3ftZKEuXboQIW1rHyVBApUOG+gWvipSEZjRZxWJkdPtIMVsJZ/fg9Jlcllfyz1zdBmOxa9ZS0C1vAvjT6kqXOAoPps8UYqSrFf0AB0s/vPKu53lErHRRcC0ztvvs67mMIRAKVMMsoY3X0K004NosIOr/Qd6mZoM5kpiU5TUBx/pgrwVALfZyEOXZ+qncwpcqT1PQNXDcBTzIdglMbxxCR2mhGgqBiJPLmlDYp8/ZiD1OTUgVr1+Ksud1CJwYHISQTNX3iG9rg01gpWxCBhKMyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4535.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(122000001)(966005)(26005)(86362001)(8676002)(186003)(478600001)(38100700002)(8936002)(54906003)(110136005)(52536014)(5660300002)(6636002)(6506007)(53546011)(316002)(7696005)(66446008)(64756008)(66556008)(66476007)(76116006)(83380400001)(55016002)(66946007)(71200400001)(9686003)(4326008)(2906002)(33656002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1hQNTBSVHEvdE9YZmhhOW5rMHFlYlltVStSUEgxanE1cHJkMEttc1N3bnhu?=
 =?utf-8?B?bGdIL29xOU9FZnZ1c3FuNFd2alZtbVE4MjAvLytuOFVVTmUwQlg4K1dtNDNP?=
 =?utf-8?B?bHVLQ0Z1QkhTemtFSDZKVWlXTlNEVWgrUVc2aDlXNGVRMmdDZHNnK2dNVTFZ?=
 =?utf-8?B?S0Z3R1JKb3h0MlVSb0cya0lSSGV0SURpM0VoMzV5Z1c0aVhWN2ZnYW5Kb3BC?=
 =?utf-8?B?Q1VobWZ4TE5mMXFkVVhudXJnUFltTWM1Z0FZcjlBYmtERTFBQTMwb3VnYytl?=
 =?utf-8?B?TmtDRTkxSEwrZkQzclRzSHdWVTZ3SUlPS1BkckNpRGVvd1N0MjZHOHVFNVRW?=
 =?utf-8?B?a2RKWmJrQVJtMXhuTjNkZmhJcHJHdVp6MWNUaDlaa1k2RlY2a3IwK3FiNE1F?=
 =?utf-8?B?SVoyczZTWlk5VHJiU3RTQjdkc3BuU1VxaVg3UlllbHpycSswS21CeHc2MCtu?=
 =?utf-8?B?S29JMVF1UUFvak83ZTJ6RVhkNE5vR0RweDlUMVdKM0NhUUdocXEwZk02L21q?=
 =?utf-8?B?cHIrMEYxNnMxbVJRWm01QTZqTXd2WkU3cWpnMHpieWVJZDk4UlJEemkxWkxS?=
 =?utf-8?B?aHpSOWU3RjBmZytHR3ZUdXFqL3plbGYwUEZFQTNkaHdCV0tBQ1B5SFZmNVd5?=
 =?utf-8?B?YWdJVFpNeUhHRFQ5d093b284K0VZenZhanIrSmNYZUZMZ0p2LzhaN0JxM1V4?=
 =?utf-8?B?YXByaEpGVGpyZ091WHhPZ0FWSS9RaXZCc3p1Ull1Rjk1RUxTM3dDQWlCbkow?=
 =?utf-8?B?bGlFaDgxekdXQXZ0b21nNVhtR3RhUmNSYWJOSVJCK3Fnc2V6Y0VIa1poUnBn?=
 =?utf-8?B?S205REVhNnlIU2Y3VmVIRXJEME55aXBVNjZYSEwvN1M1NDRFYTNYc1Ixczdq?=
 =?utf-8?B?QVU0cFFwcTIrZlFiVWdNYnNtaVBhVGcxYmRwSkRzVC9OWTJQeEpkaS9Xb3cw?=
 =?utf-8?B?V0c3eWRvOGZXbHcxeE9iTUZVNEhxKzQvTExET2h3MHN3MjlhM2xUbElid1JV?=
 =?utf-8?B?YmpYMnBYWUNaNlFKK21saDA4SCtaWVRjczA5QmNYRVFaUEtFTDVQVnJFK2Fk?=
 =?utf-8?B?OGRlaFNSZzVEU0RLRTFUQjFSemNhR1FhK2RzVWRiVWp3Q3hwdlRQUWN1Vnd1?=
 =?utf-8?B?MCtUN0RXMlpYMlJxTXdoZGc2TFIwWUQvNTVwVk5ZNU1xaWw5RDlkUEpNNVZK?=
 =?utf-8?B?ajdXc0g3TUVLczVMZGZoOTFQSTgxc2h5bEpQYjJ0Z1hCODB5OGt5a1FLMmp5?=
 =?utf-8?B?dFAwZWU2QkhBWVNqYXRrcVNPVGRpa3QwOU01UDlMRjkrN3NHUEFHYUI2Tm1h?=
 =?utf-8?B?ZjQ3RThWczhFcEE4VTdXVWZzbzJEMnVpcHZjenZFcTJveFk5NUdTNlpzRVZZ?=
 =?utf-8?B?THlNRmtKaXM4Uk14VVFiVDJLSE1EVUJqdDI5NDFtcDJrWmIxSXd4Y01sRXB5?=
 =?utf-8?B?ZnUra0dEcG1lQndRUjFxWnN6OGtIQ3cwRVZYNzN3cm51M0F2TThyOU1TZHk0?=
 =?utf-8?B?OVA5c1FsOGlsWlAyaE1KQThHSXVkVm9yKys5NGVKRGdzNzFINDNYMjBET1pN?=
 =?utf-8?B?WUplSHBQT0NUS2h0Nkp1WkRJTFVoZ1pOQnNiVnlLUlBuVy8rK3NUN2R3UndB?=
 =?utf-8?B?cHNVRjlDZmg1VFhHSVNGZFJKMEZDeFJMZVU5RktWc3htOUlwMTlLVkQwUHRY?=
 =?utf-8?B?clBPVUhSalVDendOL2lTei81UDZWU3ZQYUllNG9PZmozUVBFV3dVS3VVZzlQ?=
 =?utf-8?Q?2bIOtJEImeWDqMU3r1CTC4EqnNh0lk8oGJBUAKX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4535.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3529acef-00d4-4b5a-1772-08d94acb42e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 15:38:30.9046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQkxfHv+73moDnwGeT1SqoOGh5dlx064bYljT55slXE0EC/DptXIAhmYt6gUy+122f2VQ8vY5orM2yNrbsL/gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8514
X-Mailman-Approved-At: Mon, 19 Jul 2021 17:43:09 +0000
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
Cc: Michal Simek <monstr@monstr.eu>, Michal Simek <michals@xilinx.com>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIE1hZHMuDQoNClRoYW5rcywNCkphc29uDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4gU2Vu
dDogTW9uZGF5LCBKdWx5IDE5LCAyMDIxIDEyOjUzIEFNDQo+IFRvOiBRaWFuZyBZdSA8eXVxODI1
QGdtYWlsLmNvbT47IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPjsNCj4gSmlhbnFpYW5nIENo
ZW4gPGppYW5xaWFuQHhpbGlueC5jb20+DQo+IENjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+OyBsaW1hQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gTWljaGFs
IFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+OyBNaWNoYWwgU2ltZWsgPG1vbnN0ckBtb25zdHIu
ZXU+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9saW1hOiBDb252ZXJ0IHRvIGNsa19idWxr
IEFQSQ0KPiANCj4gDQo+IA0KPiBPbiA3LzE4LzIxIDQ6NTYgQU0sIFFpYW5nIFl1IHdyb3RlOg0K
PiA+IE9uIFNhdCwgSnVsIDE3LCAyMDIxIGF0IDEwOjUyIFBNIE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPiB3cm90ZToNCj4gPj4NCj4gPj4gT24gNy8xNy8yMSA0OjIxIFBNLCBRaWFuZyBZdSB3
cm90ZToNCj4gPj4+IE9uIFNhdCwgSnVsIDE3LCAyMDIxIGF0IDk6MDggUE0gTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4gT24gNy8xNy8yMSAyOjM0IFBN
LCBRaWFuZyBZdSB3cm90ZToNCj4gPj4+Pj4gT24gU2F0LCBKdWwgMTcsIDIwMjEgYXQgMjoyMCBB
TSBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGU6DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4g
SW5zdGVhZCBvZiByZXF1ZXN0aW5nIHR3byBzZXBhcmF0ZSBjbG9jayBhbmQgdGhlbiBoYW5kbGlu
ZyB0aGVtDQo+ID4+Pj4+PiBzZXBhcmF0ZWx5IGluIHZhcmlvdXMgcGxhY2VzIG9mIHRoZSBkcml2
ZXIsIHVzZSBjbGtfYnVsa18qKCkgQVBJLg0KPiA+Pj4+Pj4gVGhpcyBwZXJtaXRzIGhhbmRsaW5n
IGRldmljZXMgd2l0aCBtb3JlIHRoYW4gImJ1cyIvImNvcmUiIGNsb2NrLA0KPiA+Pj4+Pj4gbGlr
ZSBaeW5xTVAsIHdoaWNoIGhhcyAiZ3B1Ii8iZ3B1X3BwMCIvImdwdV9wcDEiIGFsbCBhcyBzZXBh
cmF0ZQ0KPiA+Pj4+Pj4gY2xvY2suDQo+ID4+Pj4+DQo+ID4+Pj4+IEkgY2FuJ3QgZmluZCB0aGUg
WnlucU1QIERUUyBmaWxlIHVuZGVyIGFyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54DQo+ID4+Pj4+
IHdoaWNoIGhhcyBtYWxpIEdQVSBub2RlIHdpdGggYW4gdXBzdHJlYW0ga2VybmVsLCB3aGVyZSBp
cyBpdD8NCj4gPj4+Pg0KPiA+Pj4+IFBvc3RlZCBoZXJlOg0KPiA+Pj4+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0ta2VybmVsL3BhdGNoLzIwMjEwNzENCj4g
Pj4+PiA2MTgyNTQ0LjIxOTQ5MC0xLW1hcmV4QGRlbnguZGUvDQo+ID4+Pj4NCj4gPj4+Pj4gU28g
d2hhdCdzIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiAiZ3B1IiBjbGsgYW5kDQo+ICJncHVfcHAw
Ii8iZ3B1X3BwMSINCj4gPj4+Pj4gY2xrPyBEbyB0aGV5IG5lZWQgdG8gYmUgY29udHJvbGxlZCBz
ZXBhcmF0ZWx5IG9yIHdlIGNhbiBqdXN0DQo+ID4+Pj4+IGNvbnRyb2wgdGhlICJncHUiIGNsaz8g
QmVjYXVzZSB0aGUgZGV2ZnJlcSBjb2RlIGp1c3QgY29udHJvbHMgYSBzaW5nbGUNCj4gbW9kdWxl
IGNsay4NCj4gPj4+Pg0KPiA+Pj4+IFBlciB0aGUgZG9jcywgdGhleSBhcmUgc2VwYXJhdGUgZW5h
YmxlIGJpdHMgYW5kIHRoZSB6eW5xbXAgY2xvY2sNCj4gPj4+PiBjb250cm9sbGVyIGV4cG9ydHMg
dGhlbSBhcyBzZXBhcmF0ZSBjbG9jaywgc2VlIGJpdHMgMjQuLjI2IGhlcmU6DQo+ID4+Pj4NCj4g
Pj4+Pg0KPiBodHRwczovL3d3dy54aWxpbnguY29tL2h0bWxfZG9jcy9yZWdpc3RlcnMvdWcxMDg3
L2NyZl9hcGJfX19ncHVfcmVmDQo+ID4+Pj4gX2N0cmwuaHRtbA0KPiA+Pj4+DQo+ID4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gPj4+Pj4+IENjOiBR
aWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4NCj4gPj4+Pj4+IENjOiBsaW1hQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiA+Pj4+Pj4gLS0tDQo+ID4+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX2RldmZyZXEuYyB8IDE3ICsrKysrKysrKy0tLQ0KPiA+Pj4+Pj4gICAgZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9kZXZmcmVxLmggfCAgMSArDQo+ID4+Pj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vbGltYS9saW1hX2RldmljZS5jICB8IDQyICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0K
PiAtLS0tLQ0KPiA+Pj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuaCAg
fCAgNCArLS0NCj4gPj4+Pj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwg
MzIgZGVsZXRpb25zKC0pDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfZGV2ZnJlcS5jDQo+ID4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9s
aW1hL2xpbWFfZGV2ZnJlcS5jDQo+ID4+Pj4+PiBpbmRleCA4OTg5ZTIxNWRmYzkuLjUzM2IzNjkz
MmY3OSAxMDA2NDQNCj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2
ZnJlcS5jDQo+ID4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmZyZXEu
Yw0KPiA+Pj4+Pj4gQEAgLTU4LDcgKzU4LDcgQEAgc3RhdGljIGludCBsaW1hX2RldmZyZXFfZ2V0
X2Rldl9zdGF0dXMoc3RydWN0DQo+IGRldmljZSAqZGV2LA0KPiA+Pj4+Pj4gICAgICAgICAgIHN0
cnVjdCBsaW1hX2RldmZyZXEgKmRldmZyZXEgPSAmbGRldi0+ZGV2ZnJlcTsNCj4gPj4+Pj4+ICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGlycWZsYWdzOw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IC0gICAg
ICAgc3RhdHVzLT5jdXJyZW50X2ZyZXF1ZW5jeSA9IGNsa19nZXRfcmF0ZShsZGV2LT5jbGtfZ3B1
KTsNCj4gPj4+Pj4+ICsgICAgICAgc3RhdHVzLT5jdXJyZW50X2ZyZXF1ZW5jeSA9DQo+ID4+Pj4+
PiArIGNsa19nZXRfcmF0ZShkZXZmcmVxLT5jbGtfZ3B1KTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAg
ICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRldmZyZXEtPmxvY2ssIGlycWZsYWdzKTsNCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBAQCAtMTEwLDEyICsxMTAsMjMgQEAgaW50IGxpbWFfZGV2ZnJlcV9p
bml0KHN0cnVjdCBsaW1hX2RldmljZQ0KPiAqbGRldikNCj4gPj4+Pj4+ICAgICAgICAgICBzdHJ1
Y3QgbGltYV9kZXZmcmVxICpsZGV2ZnJlcSA9ICZsZGV2LT5kZXZmcmVxOw0KPiA+Pj4+Pj4gICAg
ICAgICAgIHN0cnVjdCBkZXZfcG1fb3BwICpvcHA7DQo+ID4+Pj4+PiAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBjdXJfZnJlcTsNCj4gPj4+Pj4+IC0gICAgICAgaW50IHJldDsNCj4gPj4+Pj4+ICsg
ICAgICAgaW50IGksIHJldDsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAgICAgICAgICAgaWYgKCFkZXZp
Y2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJvcGVyYXRpbmctcG9pbnRzLXYyIikpDQo+ID4+Pj4+
PiAgICAgICAgICAgICAgICAgICAvKiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVx
ICovDQo+ID4+Pj4+PiAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPj4+Pj4+DQo+ID4+
Pj4+PiArICAgICAgIC8qIEZpbmQgZmlyc3QgY2xvY2sgd2hpY2ggYXJlIG5vdCAiYnVzIiBjbG9j
ayAqLw0KPiA+Pj4+Pj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgbGRldi0+bnJfY2xrczsgaSsr
KSB7DQo+ID4+Pj4+PiArICAgICAgICAgICAgICAgaWYgKCFzdHJjbXAobGRldi0+Y2xrc1tpXS5p
ZCwgImJ1cyIpKQ0KPiA+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+
ID4+Pj4+PiArICAgICAgICAgICAgICAgbGRldmZyZXEtPmNsa19ncHUgPSBsZGV2LT5jbGtzW2ld
LmNsazsNCj4gPj4+Pj4+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPj4+Pj4+ICsgICAgICAg
fQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBJJ2QgcHJlZmVyIGFuIGV4cGxpY2l0IG5hbWUgZm9yIHRoZSBy
ZXF1aXJlZCBjbGsgbmFtZS4gSWYgc29tZSBEVFMNCj4gPj4+Pj4gaGFzIGRpZmZlcmVudCBuYW1l
IG90aGVyIHRoYW4gImNvcmUiIGZvciB0aGUgbW9kdWxlIGNsayAoaWUuDQo+ID4+Pj4+ICJncHUi
KSwgaXQgc2hvdWxkIGJlIGNoYW5nZWQgdG8gImNvcmUiLg0KPiA+Pj4+DQo+ID4+Pj4gVGhlIHBy
b2JsZW0gaGVyZSBpcywgdGhlIHp5bnFtcCBoYXMgbm8gY29yZSBjbG9jaywgaXQgaGFzICJncHUg
YW5kDQo+ID4+Pj4gYm90aCBwaXhlbCBwaXBlcyIgc3VwZXItY2xvY2stZ2F0ZSB3aGljaCBjb250
cm9scyBldmVyeXRoaW5nLCBhbmQNCj4gPj4+PiB0aGVuIHBlci1waXhlbC1waXBlIHN1Yi1jbG9j
ay1nYXRlcy4NCj4gPj4+DQo+ID4+PiBTbyB0aGUgImdwdSIgY2xrIGNhbiBnYXRlIGJvdGggImdw
dV9wcDAiIGFuZCAiZ3B1X3BwMSIgY2xrLCBob3cgYWJvdXQNCj4gZnJlcXVlbmN5Pw0KPiA+Pg0K
PiA+PiBJIGRvbid0IHRoaW5rIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGp1c3QgZ2F0ZSBvZmYgdGhl
IHJvb3QgY2xvY2sgd2hpbGUNCj4gPj4gdGhlIHN1Yi1jbG9jayBhcmUgc3RpbGwgZW5hYmxlZC4g
VGhhdCBtaWdodCBsZWFkIHRvIGxhdGNoIHVwcyAoK0NDDQo+ID4+IE1pY2hhbCwgaGUgbWlnaHQg
a25vdyBtb3JlKS4NCj4gPj4NCj4gPj4gQW5kIHdobyB3b3VsZCBlbmFibGUgdGhlIHN1Yi1jbG9j
ayBhbnl3YXksIGl0IHNob3VsZCBiZSB0aGUgR1BVIGRyaXZlciwNCj4gbm8/DQo+ID4+DQo+ID4g
UmlnaHQsIEkgdW5kZXJzdGFuZCBpdCdzIG5vdCBwcm9wZXIgZWl0aGVyIGJ5IEhXIG9yIFNXIHBv
aW50IG9mIHZpZXcNCj4gPiB0byBqdXN0IHVzZSByb290IGNsayBnYXRlLg0KPiA+DQo+ID4+PiBD
YW4gd2Ugc2V0IGNsb2NrIHJhdGUgZm9yICJncHUiIHRoZW4gImdwdV9wcDAiIGFuZCAiZ3B1X3Bw
MSIgcGFzcw0KPiA+Pj4gdGhyb3VnaCB0aGUgc2FtZSByYXRlPyBJZiBzbywgImdwdSIgd29ya3Mg
anVzdCBsaWtlICJjb3JlIi4NCj4gPj4NCj4gPj4gSSBkb24ndCB0aGluayB0aGUgenlucW1wIGlz
IGNhcGFibGUgb2YgYW55IERWRlMgb24gdGhlIEdQVSBhdCBhbGwsIGl0DQo+ID4+IGp1c3QgcnVu
cyBhdCBmaXhlZCBmcmVxdWVuY3kuDQo+ID4NCj4gPiBJIHNlZSB0aGUgR1BVX1JFRl9DVFJMIHJl
Z2lzdGVyIDEzOjggaXMgYSBkaXZpc29yLCBpcyB0aGlzIGZvciBhbGwNCj4gPiAiZ3B1Ii8iZ3B1
X3BwMCIvImdwdV9wcDEiIGNsayByYXRpbmc/IElmIHNvLCBjYW4gd2UgdXNlIGl0IHRvDQo+ID4g
ZHluYW1pY2FsbHkgY2hhbmdlIHRoZSBHUFUgY2xrIGZyZXEgYmVjYXVzZSBvdGhlciBTb0MgYWxz
byB1c2Ugc3lzdGVtDQo+ID4gY2xvY2sgdG8gZG8gR1BVIERWRlMsIHNlZSBzdW44aS1oMy5kdHNp
LiBJZiB3ZSBjYW4ndCB0aGVuIHp5bnFtcCB3b24ndA0KPiA+IGZpbmlzaA0KPiA+IGxpbWFfZGV2
ZnJlcV9pbml0KCkgYW5kIGdldCBoZXJlIGF0IGFsbCBiZWNhdXNlIGl0IGRvZXMgbm90IGhhdmUg
YW4NCj4gPiBPUFAgdGFibGUuDQo+ID4NCj4gDQo+IEppYW5xaWFuZzogUGxlYXNlIHRha2UgYSBs
b29rIGF0IHRoaXMgZnJvbSB6eW5xbXAgcG9pbnQgb2Ygdmlldy4NCg0KSGkgTWFkcywgY2FuIHlv
dSBjb21tZW50IG9uIHRoaXM/DQoNCj4gDQo+IFRoYW5rcywNCj4gTWljaGFsDQo=
