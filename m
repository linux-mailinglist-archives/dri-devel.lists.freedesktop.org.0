Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF04D4FCF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 17:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A338B10E5B8;
	Thu, 10 Mar 2022 16:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2493A10E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 16:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rzu/PKoROrqtGOBz0od4LY+BJzdioTPWKxGCOU7DRh90Ly9Tq8nRCOLAMDaJSpoY2PeKBB8yZRWriSxf9c+t7j6nUrFkRiFUweBaR3ua5IoRFQI5eMEEB1rjFVPnsUZjJSl0EnsmtpHKtCx4hEkt7gha37NhQj/Kw+6X4/KqieZ9Cg200/79cJe1SfXyOS5G/DiRlIyo9Yr/ElTrCBH2aF2D76T/pcJ/tLgbzJrR2jN30yMsmKHCHws5FsI4f073CG6Zyy6YoFUKNX94bOkPCEjMNvibL1shxYvQdXm6JsDMfy7g9ynbnTKfF/2/ZvUJg1Pb+49ql0JbLqkNhNRTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dXyY4HKriuiT+be/UcEgHVCT6GtBcnPJuzMajJffMs=;
 b=nz7edcFvdhSVPq1gUfjP5pFptt9O0ZnyEsYJFcqMPWS7Bqk/85KVL29lhzHJ1vvpjJ+n8HLbOgAFPR2byJJ3kQ2YY7drMv8YZvGgVORQiCQs6grxEWRerflCSIwFuwkjyIRWDEDyqYycFNgggCGtpgrwtXOAAZO1Ll83qjjxCoPxTKgH2aaVsYkqUfxYQqyPA15p3ZV1+TSl6sLCmKwgtaUSQqZ0o0eMBG9kTE+6rG6UDDvC3HAuU4crHBusd5TQasnrm3UnvQU2XNKV5AyjpmxC9FjGjZn6m3z+dNxV6Zg2Sr8QRrQ31XmgOQD6X4/2FCh5jelCT2vIk9wN7gznog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dXyY4HKriuiT+be/UcEgHVCT6GtBcnPJuzMajJffMs=;
 b=nCE+BJeJBU6hWZ0XRhEINIk8wj/H84TXNgo7TH0cqpS59k0qvuGRtf49xgNB7z/FfVHrJ7EeVfk+EOAVOUPehJFHKXH4W2oh+oZ+ACZxTBULXXxhvaRs5CcHIlwVX5psCj2LA4JywegbWiATXdmuSPbNiFRwiTZA60/5tg+G5kM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB4297.jpnprd01.prod.outlook.com (2603:1096:404:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 16:56:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 16:56:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Thread-Topic: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Thread-Index: AQHYM8fvckkeEfT5Y0ipcPVDIHWbCay40imAgAAAWmA=
Date: Thu, 10 Mar 2022 16:56:03 +0000
Message-ID: <OS0PR01MB5922625472A180B7E3165008860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
 <Yioo1Wgo1eC6IIvf@pendragon.ideasonboard.com>
In-Reply-To: <Yioo1Wgo1eC6IIvf@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44c3c39c-94a9-4162-31a6-08da02b6dc79
x-ms-traffictypediagnostic: TY2PR01MB4297:EE_
x-microsoft-antispam-prvs: <TY2PR01MB4297BD951E1A662B99A74B00860B9@TY2PR01MB4297.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BVdH9jB3F9bIjzPCH/NbH8ODJMW50zchSUgm+ishqW45u45NWrknPTuOFEjt20L8VMxcS3Ok7bFGD2kr66usrjJlf4VX8r4SH3f8XyjfNrARwjLGjbMgfjmpsSk7DhHUWcQODOQxxfXl32O8HxmktYGpJjnhbXMxfTgEmrF6+42A5vkBfK6ykWEmAaffc8bqaQ3dwN6ejJjCB9NyPFJeBUwr5fL1CGgq8vAo8r164BvZO6fdDthDgK6dhocISBVFF84BsyD+XINJuV5iftTcaY7N3UzkToMA4Xo5QQlOByLc2D1dV5tl7rh1SApYN4M+MBL6qsXaVdexo2bA3kTtluQCXePbtBvD0/vQ54I0oh3cF77m+NrkYcKeuRgLoHLnzA30xwTDRT8fNUSXhr5Z448Tt5k0f3rj6/4OA+UX4oyBCloptP33bt5yUEjC9fMWoHhgMcj/HchiSX5GnCL984te1WUNSEshbmhL006DR0kpBvopnHvqIBgLX5tH8J4xpEdKKEaGo7d6X9MjKLLwGpPttkgS1wK2GVFpASBZDNW4yKG2RVm6r3fcGFlEgT8TCJ7VNUc3XNJUmlx/iL33QvfqfOv/9BC1Pa/ePbmT2Gf7BGyN12hEJcpu7VOkvJN3fwO0T0EaTcSN2jsreWmuKI6dS0fpE7E4WcuokOa8/4J3mxAkR0fURGjeWszqi5bRY2btXP6qR/bayNS7TKCCCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(86362001)(4326008)(66556008)(122000001)(508600001)(316002)(38070700005)(76116006)(66946007)(64756008)(7696005)(6506007)(9686003)(52536014)(38100700002)(54906003)(83380400001)(8936002)(66476007)(5660300002)(71200400001)(55016003)(2906002)(33656002)(186003)(26005)(66446008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGFJT3RQNENPZ2ptbGRzQjNud2szb2VVOC9zT0hnQU9jSDZkd2I5dzBocjZM?=
 =?utf-8?B?Qjg2RFQzUzg2NVpUL2lXbWl1VGhwQ3VmbCszcHJjQSs1Zm02YjNIa05kVzBI?=
 =?utf-8?B?TEgrWmdpeWRRMHFOcjhNa2VvbktUM2VUSDJhQkZ3VGRDSGFOWTlLbHl3TzlV?=
 =?utf-8?B?S3pHZG5NbWFDK2lOZ3JmYTM1S21GVmlQcHNPL09Uc2JqYnU0eUtrVjRjWXY1?=
 =?utf-8?B?OVJhWGwzRlloM0Z2L2Y3emh0dnlob1U3ak1XdXBqQkZqYzY5VGwzZHkxT3N0?=
 =?utf-8?B?WHBJa1VnUU5UUVNXeTVkN0lLREIvdStHc3NJOC9iU3Iwa2dvRHdIbmF4NCtz?=
 =?utf-8?B?R2ordjlXYysrNHEyaThIUWR6OXRIZ051ckQySDZnb1hMSExRRHpTcHZNK28z?=
 =?utf-8?B?eTZrYk9aTmFjQnJDYU1JQ0NxajFzZUowYUxHZjlRa2lzTXREaTMzRFVVdE03?=
 =?utf-8?B?TDRMS0lPaVY3NnI2UEovdUlQZ01qZ25nQWJzZWo4bkVIOVJaSENFNWVZYk5U?=
 =?utf-8?B?R2RSOXpiU0RVRmlvdCt5THgySkJjaVl5UXF5UXBFd0hRT1ZrSVkyaURXQktM?=
 =?utf-8?B?cC8wTGNiL3luRWpjSlBoeHBWN01IdHRVcDQya0ZnWlllU3pORTFEbDdwZlR6?=
 =?utf-8?B?YzZnZVFIRzVqMWljQ2R0MlF3aEF0b1hVLyszall5SXE0OWpKWnBVaHNNRzRv?=
 =?utf-8?B?bFcvRVFPWmQ0M3RhbjNLbC9DVVRwY0NxKzFmWmhoWGRFZ0lYa1l3VGlTcXRj?=
 =?utf-8?B?YWt6R2x3c200OEgzOStQV1g5L0gxRlJTN1VVWHlzeTJyc1g3TkZPMko4OGU4?=
 =?utf-8?B?UUlGZUs2dlloWVVTaklDTHgrODZiWVRRL1pDTElRNVNYckZuVFNvTEFDUGxS?=
 =?utf-8?B?b2RqR0c3dUkvakd1WDlpOTZPaFdQY3pHQzdVdkRPbFZvZUFlcXJqWis4NEUr?=
 =?utf-8?B?K3hPMk9mcXQzSm1BYmp4ZHVrVGVjNHVnMUVYNFJGQ3RGNTJBQy9ZSUlmSTBk?=
 =?utf-8?B?VDhXNjRrdlVlc3FSTGxVU1Y2TnVzZkRKTXdSTVhXOHc3dy8rUFNLZDJDc2hG?=
 =?utf-8?B?eklKZFZic3FEUkFkSnRPT3FkY2pTdnp2ekxNU0tMQURqS2J0WTU0bmRIZG40?=
 =?utf-8?B?WktXWkNtejg0bS92NUQ0RGZxamtwVWtjeGJvYlY3dzR2RlFpTHFKQU1yZ2I4?=
 =?utf-8?B?b3NPSVRCc1dVb2JmZ2RWR2JrbzJZMEJkUGtkYzZ5RGsrY0pTTkNmSGkydWIz?=
 =?utf-8?B?emJ3bXlUSkxHSzRGYllsYmVPWm9ZbWgvY3UxRFJJT0pYR0pCUXlobUREcFVS?=
 =?utf-8?B?aitmbFlEK25ncGd5RFlQby9SS1h1SHpNdDdmNEhyY1ZaTG9JN3pjbnFpZG5S?=
 =?utf-8?B?d2oyR3Rtek9TRDUzYmdHRDc4UUFmNVZjYkkzQUhiOHNaRFl3cTlGY05ES01R?=
 =?utf-8?B?QnpiZEpIb1k2d0tIQ1NDSmkvSTJTOTlQL2dTd0hwUGh3a0IzaFNRcWVXdzA2?=
 =?utf-8?B?QkNyUnpZUmNUT3o0a2RodERKQ0x0Z0J1QkVHMWJNRjd1WDNNbWI0bEthT3Ir?=
 =?utf-8?B?M2tWVncwUURtU1AyOHV2NXFLcllCSVlHYjBta3ora0dUTWRCN0JUWmMvaEp1?=
 =?utf-8?B?YXIwa1ZkRERQcW8yQkZiczVScVNMSXFxUFN2T1M1U1ZxTjllS21qTkNwRkJu?=
 =?utf-8?B?MUs3ZkU2STZBNUN1SUdOeTVxdkdPUmE1bWxQd0tmN0ZUd0JxUUlLZzYrV1Fa?=
 =?utf-8?B?UEFjNk9Ub1hvTXBKYnpKSi9aRE95S3N0aElSVFp3elRTMVFaaWtUUHIxVUJZ?=
 =?utf-8?B?OHUyTVVtTE0vU29pc0F6UDF2am1SM2tMZVFmOWNWdlJwN3dWemZTVWducXZa?=
 =?utf-8?B?VTY4OW1PWTYvK09ISUNrREc0eVBCNHZJVzVYWkJKMWFlQXlpZUdiTmZjOWth?=
 =?utf-8?B?OWZkSlM1aS9LSWJnczZTbGtpUmhJZ2hnQ1BVS2FFcVgwdDFXeHFQNzUrTmJN?=
 =?utf-8?B?amFqR0NITEVDd0d3U1ZiNlN2YXEvczdXSkRGS0lESHRxZ0ErTlplS2YrQ1U0?=
 =?utf-8?B?R0pnSWFDSG5YcHoyNmlCZVloZkRPNWErNlJJR2pMeVd6OFRLRTgzS3hPL2s4?=
 =?utf-8?B?bCtmelhRTnIyMUdRQjV1UkRPRWMwRk4wdUlWTTJXdllxWThtYkNxWnFZT3V4?=
 =?utf-8?B?QTAxdndPOFNYbU9HZFZrMjdFS3VJMFdXWGNZRmk4TUtTc25MSFljcndEcFc5?=
 =?utf-8?B?SUMrZTR1YlJ1RlI5QlV1dXB3NXdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c3c39c-94a9-4162-31a6-08da02b6dc79
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 16:56:03.1955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rjjeXC8tjidixkWyLqJ4usGyHCpFiMHMpTIZUV/kS/Jv4TqTZXWELeLhCAAO9ROL/ZLDp+NLHhKycpZ3Ooj6A3rfJXDAW/BbcOZVBglHL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4297
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?UmljYXJkbyBDYcOxdWVsbw==?= <ricardo.canuelo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBkcm06IGJyaWRnZTogYWRpLGFkdjc1MzM6IERvY3Vt
ZW50DQo+IGFkaSxkaXNhYmxlLWxhbmVzLW92ZXJyaWRlIHByb3BlcnR5DQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBXZWQsIE1hciAwOSwg
MjAyMiBhdCAwMzoxMTowOFBNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBPbiBSZW5lc2Fz
IFJaL3tHMkwsVjJMfSBwbGF0Zm9ybXMgY2hhbmdpbmcgdGhlIGxhbmVzIGZyb20gNCB0byAzIGF0
DQo+ID4gbG93ZXIgZnJlcXVlbmNpZXMgY2F1c2VzIGRpc3BsYXkgaW5zdGFiaWxpdHkuIE9uIHN1
Y2ggcGxhdGZvcm1zLCBpdCBpcw0KPiA+IGJldHRlciB0byBhdm9pZCBzd2l0Y2hpbmcgbGFuZXMg
ZnJvbSA0IHRvIDMgYXMgaXQgbmVlZHMgZGlmZmVyZW50IHNldA0KPiA+IG9mIFBMTCBwYXJhbWV0
ZXIgY29uc3RyYWludHMgdG8gbWFrZSB0aGUgZGlzcGxheSBzdGFibGUgd2l0aCAzIGxhbmVzLg0K
PiANCj4gSXMgdGhpcyBiZWNhdXNlIHRoZSBQTEwgY2FsY3VsYXRpb24gY29kZSBkb2Vzbid0IHdv
cmsgcHJvcGVybHksIG9yIGJlY2F1c2UNCj4gdGhlIGhhcmR3YXJlIGNhbid0IHN1cHBvcnQgdGhp
cyA/DQoNClBMTCBDYWxjdWxhdGlvbiBpcyBjb3JyZWN0LCB0aGF0IGlzIHRoZSByZWFzb24gaXQg
d29ya3MgZm9yIGFsbCByZXNvbHV0aW9uDQp3aXRoIDQgbGFuZXMuIFRoZXJlIGFyZSAyIGNsb2Nr
cyBnZW5lcmF0ZWQgYnkgUExMNSB3aGljaCBpcyBjb25uZWN0ZWQgdG8gYSBtdXgNCndpdGggY2xv
Y2sgc291cmNlcywgbmFtZWx5ICdGT1VUUE9TVERJVicgYW5kICdGT1VUMVBIMCcNCg0KVGhpcyBN
dXggaXMgY29ubmVjdGVkIHRvIERTSSBkaXZpZGVycy4gDQoNCidGT1VUUE9TVERJVicgc2hvdWxk
IGJlIHNlbGVjdGVkIGlmIChQTExfSU5QVVRfRlJFUS9WQ0xLKSBpcyBvZGQgYW5kICdGT1VUMVBI
MCcgc2hvdWxkDQpiZSBzZWxlY3RlZCBpZiBpdCBpcyBldmVuLg0KDQpUaGUgUExMIGNhbGN1bGF0
aW9uIG1ha2VzIHVzZSBvZiBldmVuIHNlbGVjdGlvbignRk9VVDFQSDAnKSBhbmQgdmlkZW8gd29y
a3MgZm9yIGFsbCBmcmVxdWVuY2llcw0Kd2l0aCA0IGxhbmVzLg0KDQpXaXRoICdGT1VUMVBIMCcg
YXMgY2xvY2sgc291cmNlLCBpZiBJIHN3aXRjaCB0byAzIGxhbmVzIGZvciBsYW5lcyBpdCBkb2Vz
bid0IHdvcmsuIA0KQnV0IGl0IHdvcmsgd2l0aCA0bGFuZXMgb24gYWxsIGZyZXF1ZW5jaWVzLg0K
DQpIVyBjYW4gc3VwcG9ydCAzIGxhbmVzLCBpZiBJIHNldCBwYXJhbWV0ZXIgdG8gbWFrZSAoUExM
X0lOUFVUX0ZSRVEvVkNMSykgb2RkIGFuZCBzZWxlY3QNCidGT1VUUE9TVERJVicgYXMgY2xrIHNv
dXJjZSB0byBEU0kgZGl2aWRlci4NCg0KSSBhbSBub3Qgc3VyZSBhYm91dCB0aGUgcmF0aW9uYWwg
YmVoaW5kIHRoZSBjb25zdHJhaW50IHRvIFN3aXRjaCB0byAzIGxhbmVzIGZvcg0KbG93ZXIgZnJl
cXVlbmN5IGZvciB0aGlzIEFEVjc1MzUgY2hpcCwgYXMgb24gb3VyIHBsYXRmb3JtIGl0IGNhbiB3
b3JrIHdpdGggNGxhbmVzDQpvbiBhbGwgZnJlcXVlbmNpZXMuDQoNCkNoZWVycywNCkJpanUNCg0K
PiANCj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgJ2FkaSxkaXNhYmxlLWxhbmVzLW92ZXJyaWRl
JyBwcm9wZXJ0eSB0byBkaXNhYmxlDQo+ID4gbGFuZSBzd2l0Y2hpbmcgYXQgbG93ZXIgZnJlcXVl
bmNpZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MzMueWFtbCAgICAgIHwgNSArKysr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvYWRpLGFkdjc1MzMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3NTMzLnlhbWwNCj4gPiBpbmRleCBmMzYyMDkxMzdj
OGEuLjJkYzM3ODAzOWQyMSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hZGksYWR2NzUzMy55YW1sDQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxh
ZHY3NTMzLnlhbQ0KPiA+ICsrKyBsDQo+ID4gQEAgLTg0LDYgKzg0LDExIEBAIHByb3BlcnRpZXM6
DQo+ID4gICAgICAgIHRpbWluZ3MgZm9yIEhETUkgb3V0cHV0Lg0KPiA+ICAgICAgdHlwZTogYm9v
bGVhbg0KPiA+DQo+ID4gKyAgYWRpLGRpc2FibGUtbGFuZXMtb3ZlcnJpZGU6DQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gPiArICAgICAgRGlzYWJsZXMgdGhlIG92ZXJyaWRpbmcgbGFuZXMgYXQg
bG93ZXIgZnJlcXVlbmNpZXMuDQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKw0KPiA+ICAg
IGFkaSxkc2ktbGFuZXM6DQo+ID4gICAgICBkZXNjcmlwdGlvbjogTnVtYmVyIG9mIERTSSBkYXRh
IGxhbmVzIGNvbm5lY3RlZCB0byB0aGUgRFNJIGhvc3QuDQo+ID4gICAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+
IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
