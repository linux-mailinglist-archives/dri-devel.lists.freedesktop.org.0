Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9847B78D39F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAF910E4C3;
	Wed, 30 Aug 2023 07:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840910E2A8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6jiPvsKCDHg+XH1CUHyA5kTtX97DUAoUNKrMXpS6DbRIsdbQuDSypn9Aar5ewV23G5LAN3nDpIi0wcykvRX6/s7//NPstuTyqq2wFSFucCcQhPZ/Le1BwTN9Pme/PKriduWwmYNMqVkg2fTUQRkK0krgw6sYVKwgfjxZpVqQp/XfKGVCfOPXcNUh4pZMEWpMQiTrv8tsRBOVMmg/sxn/tcIq7pkU0NHcaLFNlLq18PKzYzLZXsNnWELaBJMR6FqhxukuWiRtfzhSy84IoUjkJqJ+7sazWuBUBx6TRy0FP57mJu7nQ1LMXk+T6PWYiwOyn2Jjac5VME+cP3lMQd5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0loHVv+9i78r63tVwNQN2DZg9OJwxWdlSJCeanSQt0=;
 b=ZW+op2Xx0zhmdS6kOwcUL1JSXN755eLTSuSBtAppAO3ZYaLoyDjRWmnYActzV7qVDvCnc0nI0QfqIyO0GZ+/5o+0lUTwXbd55UHh35IEg4V0XcxHY3T3pAj8OH4wuAjmHnwWPQPKnm71sJWLJqxM5/xwvSQBl2FffefihhqV7bYrnpJPNlIM53yMaTQRbc/QutwvVWrCNNciZR1g2QWOgnLMLQ+JS5Fx+5/31YJOIHFULJd/YLyzjI1EvxLGSHl8GhdFUEUZS83I10/qhloC9yBLByUlEziKMj1e+4ZXQnTUDX/fFletqG4z2OCnAkfPxFVA266rSW1Dg8HnNznu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0loHVv+9i78r63tVwNQN2DZg9OJwxWdlSJCeanSQt0=;
 b=m4IgYB9NHux8PmiKoNClMcAsZz3x9S48nCdiKoZ591ZdlSMtWjkgqaXXOmjXes7xmTg4M/WJrR86ngaZT53GlI6PhNVPhbmTcEsxmYAHFiP1ejij06NhKXPGoPcGTJfQaEgnpEd0T5XrnbPCmU9X0YpgTGgPT+5gXccF+VHnUnI=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DB9PR01MB7353.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:215::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 14:18:48 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077%7]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:18:48 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones
 <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han
 <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Pavel Machek
 <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ2mHPrVopNJPC/kuEF9j2J1TebbABF34AgAAdZbA=
Date: Tue, 29 Aug 2023 14:18:48 +0000
Message-ID: <DU2PR01MB8034C85013ECF222D12BAAA4F9E7A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230829101546.483189-1-f.suligoi@asem.it>
 <6dfae492-5533-df97-5c72-373d5e89444f@linaro.org>
In-Reply-To: <6dfae492-5533-df97-5c72-373d5e89444f@linaro.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DB9PR01MB7353:EE_
x-ms-office365-filtering-correlation-id: 8f9298d0-9c1b-4032-a446-08dba89adc8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6t8dzaM19HqgLGte8RpmgB/nI5zfN+eGxnTQEhHTrQklX/y3M6pzC/fVRco+NU1LWi9YFT51qgyaFPIZvP1NL0nRfDZCZCGqiB90jApy7xVBO/Bf/ud2jEG0Lv5A48DyaZo+ywmcmj/CtAhG55sdlXo+q0ipoftXNGwX5x3xNTkO8DxLK+tAio3yXr+GXbD3yoy4uHltqOT/qas62lbDmznNrWU58uAghrl9bnBUDljTfW+S7eTHSct6WoyYb3qJVk1dXfJ6sTA1ULK5D7PJihu52jyB4BVkE2HUowbxX0wm8F9K/+uJKWIrWlbPwvjZsE8NeNAEnAAU8W1E1v47Y4r98EESVjUY+b/tshF+bb8KaHqmw5Oez0o9+SNKQ5FzFfYlwL9uZZ6FDLOzpMb7JTdus3Q7cPfLQOQy6CVD19jojrQZ8wMkOEQibkIs+c6psvlMrvJFT6R0eHdkxfHj73kfdFweQY3LlPfhgliok5H1uNk7Q4rW5xkmBCQVjN6CUzDtzUgjCiYDDgV2XrXk14eV3s+9HQ4sct6ZCv+iEnc6WC0WdYWOJ1dUFPJ7/dcE09Ski/Vb2BwGf71Mk872ABubcuaRUqvlVJHVk4r0MOuYS0I0BDbs+uDeXA9Q+DbP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(396003)(39850400004)(346002)(136003)(366004)(1800799009)(186009)(451199024)(8936002)(122000001)(66946007)(110136005)(76116006)(478600001)(6506007)(7696005)(71200400001)(66446008)(64756008)(66556008)(66476007)(54906003)(38070700005)(316002)(38100700002)(41300700001)(9686003)(26005)(8676002)(5660300002)(83380400001)(2906002)(52536014)(86362001)(55016003)(7416002)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTJUclZqeUF6aWRQWE4yYTRNVzIydlVOV1hXRnZqTGQ5L1R6MjdmaS9uUUt3?=
 =?utf-8?B?QWZrSWUwbHJNc0J5dTJ6VTI3TDJFeGpoaXcvNjBWNHE1Z1FSeFdLNzE5TElY?=
 =?utf-8?B?Y0g2eTIxNjVwWjdwOVdaNmpQbERvV0lEL3JDZmY5cExKMnBhUWNxblNXUnoy?=
 =?utf-8?B?ZXJZL2VCdFpnbmpZdXE0ZVM1UWJxYkZkazBJMDlsTVV6YkFFb3NhNUhQQXZG?=
 =?utf-8?B?WUFsNUp2WWgxWWtsdUNxRVdPU3dIdlVFY2o4MDlpRVFSUnAxYjAzNGJMWXAz?=
 =?utf-8?B?SzZVaUZNVXBxMnJLYUJUUEF1MGJBWVlUWldYWWwyTUt0dkdGMk0wc01jMTQw?=
 =?utf-8?B?N2d6N2E3V2JtQXBxRUVRSENrdS9jdENsZEJObDBHMlFzSDhlN1orSndoTWJh?=
 =?utf-8?B?L2ZUMktQY2xKTDcxdnhCQ0hFckRCeG16RkhvZTFqWFNEaE5ZWG5sY1FDMjEv?=
 =?utf-8?B?MnFUaFZuZHJGS21pTVlUeFNJK3JUQmdNL3E3aUYwaWlRem1meDRJVnFSODky?=
 =?utf-8?B?OEM3aitzdEd5Y3c5bGtmbnB0dTJxZDZIMTZLTTBycjZ0MGhhZjBEM090MFVT?=
 =?utf-8?B?SnlSVnpzVXBzbG9GZG1QdzJMTXZZRGN0VU91SFEzWVNxSmRZVVZnTVlYd0g4?=
 =?utf-8?B?bTdIWWVRWmlUR0NYa2hieXNlNndnajlzK3NGWnBtUnp6bC9pTTJhMEd3Q1BE?=
 =?utf-8?B?QWxkemZxRllCanNhUzVQQkd4cXB6OWlvVlJ1ajhuVW5jQ25DWGRLVnZGb2RY?=
 =?utf-8?B?VVN2KzhJZFlNcjBzZzQzSE5rcFozdE93dHhVSUNEcytsTHlSbE5TNGdWMlkz?=
 =?utf-8?B?S3hYTmZTYTRvcDJsZys0citEK1lFNmIwZFFhKy9wQmhnekRDenlPKzhySVZs?=
 =?utf-8?B?dlJKSjZoWWlQdzRjM0VtNVlWRlppVGpmSmZodVd0bTI1aS9CZUZnMjdHblli?=
 =?utf-8?B?WVVhekloRXR3NFR3a0RvblJvblRGODQ3Smp2MjRhNnYwSHM1Rjk0aWwyMG0v?=
 =?utf-8?B?R1NyZDd5bERDTE5WTER4bDlwc1pDREdwK2xiTnpkeG85QWorMTZiUXBjM09z?=
 =?utf-8?B?Q0FCLys4QXJJZ21ldk1MZHpsUFdCaDR6YzNkTjVXSkM5bnZXT0hyaEVqaEJk?=
 =?utf-8?B?Qm9mNm5JQnhlUDJyOVdrSGtabUFrR0xnOUhxMVJFc21XSy9kTThZV2NtNHhZ?=
 =?utf-8?B?RlpNZDMwWTg3SmU5RlF2VVA5Z3hiTFpIOHVzZGxKajFBSWxzYk5aZTNQYVY2?=
 =?utf-8?B?QWJwNXhCNHM3Zm9oT2RiYkRDcjhUajQ0QVhaMXpNaGdweDRvMGF4T05oS3ZS?=
 =?utf-8?B?bmp6TDlucnZlQk84bkFzRkIvcXBHTWkybFhTWHpYcXZWdUJlMWJzYysvQkxC?=
 =?utf-8?B?VnVSSHRGUHVKdnB1WE9VYUV5eFk0MmFmR0J6elAyd3QyNHRzNnppMEVaNjli?=
 =?utf-8?B?YTV4cTVpb1FtdEVVdEdLcmZLZDBGcWdZVUR3T09Nblk5VitKT2tyUXZmKzBz?=
 =?utf-8?B?T01KUFNTaTV6aFhxQktwTU5aSnpPMFJpS1FQMHRMK01McmFKcGFIK0lWVWk3?=
 =?utf-8?B?VWtjY0ZDblN6eXpueUFoVEZvZzQydWlMTThxU0pwNmVmbGdGMjBueDlCanlE?=
 =?utf-8?B?NFV6bTcydWNST2RwOXVYSk16NnlqV2FXN2hRVktiM3dVaUMwVjAyQlVobHdj?=
 =?utf-8?B?bWRGQ09SY1V4Y2FzNFAyWDdLaisvbkVZc2Fzdi9ReVVtOUVEenJpQjJ6L3Ur?=
 =?utf-8?B?L1ZVWjFxcmZnM3dFbk9xN25CV2lXWk1VK0g4bWJQTGtvdXN1M3hmaENCZkZ3?=
 =?utf-8?B?dVU3b0VmZ3pzRFQ0WGJ4YVFjS0lMbFJJR0h6a0l1SU1FMXp4QlUwN2t0OW9Z?=
 =?utf-8?B?OGtQYzN5YitNTm83cndaUGxXenJRUlpvOWlUZ2t3cjZDSFBPRTM5Vi9KbFdZ?=
 =?utf-8?B?MHVUc3phYkpkaDJudlFGdXVIUHRGT1d3ZUVPTjRCUVdLWTF1TTgyK29talhj?=
 =?utf-8?B?UklQdzlDMTFROTd5UkV4QnBiMFp3dmtCVXRIQVdTRThvd3hOUUxxZlVzL1NH?=
 =?utf-8?B?OXZZNERBeDVuM25xZmpTNnUxVzlCZ2drZ2NiZVR2dEJMNmJid1pzVFU4ZUJY?=
 =?utf-8?Q?6IeA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9298d0-9c1b-4032-a446-08dba89adc8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:18:48.1400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXKXMr/AFIU1PTLnTbTqt5ACOENiAErML+CkUXjvlm71/DLWJHSUnLllY/RVfUK1NUCIbLLgDtsR7OC86mOPKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7353
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:32:27 +0000
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
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVwbGF5IGFuZCBjb3JyZWN0
aW9ucyENCkp1c3Qgc29tZSBxdWVzdGlvbnMgYWJvdXQgc29tZSBvZiB5b3VyIHJlbWFya3M6DQoN
Cj4gPiBAQCAtMCwwICsxLDIwMiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gDQo+ID4gKw0K
PiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIG1wcyxkaW1t
aW5nLW1vZGU6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIGRpbW1pbmcgbW9kZSAoUFdNIG9y
IGFuYWxvZyBieSBJMkMgY29tbWFuZHMpLg0KPiA+ICsgICAgJHJlZjogJy9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3N0cmluZycNCj4gDQo+IERyb3AgcXVvdGVzLCB5b3Ugc2hvdWxk
IHNlZSB3YXJuaW5ncyBmb3IgdGhpcy4NCj4gDQo+IEl0IGRvZXMgbm90IGxvb2sgbGlrZSB5b3Ug
dGVzdGVkIHRoZSBiaW5kaW5ncywgYXQgbGVhc3QgYWZ0ZXIgcXVpY2sgbG9vay4gUGxlYXNlDQo+
IHJ1biBgbWFrZSBkdF9iaW5kaW5nX2NoZWNrYCAoc2VlDQo+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5yc3QgZm9yIGluc3RydWN0aW9ucykuDQo+IE1h
eWJlIHlvdSBuZWVkIHRvIHVwZGF0ZSB5b3VyIGR0c2NoZW1hIGFuZCB5YW1sbGludC4NCj4gDQo+
ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAtIHB3bQ0KPiA+ICsgICAgICAtIGFuYWxvZy1pMmMN
Cj4gDQo+IFdoeSBkbyB5b3UgdGhpbmsgdGhpcyBpcyBhIHByb3BlcnR5IG9mIGEgYm9hcmQ/IElz
IFBXTSBzaWduYWwgb3B0aW9uYWw/DQo+IElmIHNvLCBpdHMgcHJlc2VuY2Ugd291bGQgZGVmaW5l
IGl0LiBPdGhlcndpc2UgaXQgc2VlbXMgeW91IHdhbnQgdG8gY29udHJvbCB0aGUNCj4gZHJpdmVy
Lg0KPiANCg0KVGhlIE1QMzMwOUMgZGV2aWNlIGFsd2F5cyBuZWVkIGEgSTJDIGJ1cyB0byByZC93
ciBpdHMgaW50ZXJuYWwgcmVnaXN0ZXJzLg0KQnV0IHRoZSBicmlnaHRuZXNzIGNhbiBiZSBjb250
cm9sbGVkIGluIG9uZSBvZiB0aGUgZm9sbG93aW5nIHdheXMgKG11dHVhbGx5IGV4Y2x1c2l2ZSwN
CmJ1dCBtYW5kYXRvcnkpOg0KLSBhIFBXTSBpbnB1dCBzaWduYWwNCiAgICBvcg0KLSBhIEkyQyBj
b21tYW5kDQpTbywgdGhlIGRyaXZlciBuZWVkcyBhIHByb3BlcnR5IHRvIHNlbGVjdCB0aGUgZGlt
bWluZyBtb2RlIHVzZWQ7IHRoaXMgcHJvcGVydHkgaXMgbWFuZGF0b3J5Lg0KVGhpcyBpcyB0aGUg
cmVhc29uIG9mIHRoZSBleGlzdGVuY2Ugb2YgdGhlICcgbXBzLGRpbW1pbmctbW9kZScgcHJvcGVy
dHkuDQpQV00gc2lnbmFsIGlzIG5vdCBvcHRpb25hbCwgaXQgaXMgcmVxdWlyZWQgaWYgYW5kIG9u
bHkgaWYgdGhlICdwd20nIGRpbW1pbmcgbW9kZSBpcyB1c2VkLg0KSWYgdGhlICdhbmFsb2ctaTJj
JyBkaW1taW5nIG1vZGUgaXMgdXNlZCwgaW5zdGVhZCwgdGhlIFBXTSBzaWduYWwgbXVzdCBub3Qg
YmUgdXNlZC4NClNvIHRoZSBwcm9wZXJ0eSAnbXBzLGRpbW1pbmctbW9kZScgY29udHJvbHMgaG93
IHRoZSBNUDMzMDlDIGlzIHVzZWQuDQpJIGNhbiBhZGQgbW9yZSBkZXRhaWxzIGFib3V0IHRoaXMg
aW4gdGhlIGRlc2NyaXB0aW9uIHNlY3Rpb24uDQouLi4NCiANCj4gPiArDQo+ID4gKyAgbXBzLG92
ZXJ2b2x0YWdlLXByb3RlY3Rpb24tMTN2Og0KPiA+ICsgICAgZGVzY3JpcHRpb246IG92ZXJ2b2x0
YWdlIHByb3RlY3Rpb24gc2V0IHRvIDEzLjVWLg0KPiA+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+
ICsgIG1wcyxvdmVydm9sdGFnZS1wcm90ZWN0aW9uLTI0djoNCj4gPiArICAgIGRlc2NyaXB0aW9u
OiBvdmVydm9sdGFnZSBwcm90ZWN0aW9uIHNldCB0byAyNFYuDQo+ID4gKyAgICB0eXBlOiBib29s
ZWFuDQo+ID4gKyAgbXBzLG92ZXJ2b2x0YWdlLXByb3RlY3Rpb24tMzV2Og0KPiA+ICsgICAgZGVz
Y3JpcHRpb246IG92ZXJ2b2x0YWdlIHByb3RlY3Rpb24gc2V0IHRvIDM1LjVWLg0KPiA+ICsgICAg
dHlwZTogYm9vbGVhbg0KPiANCj4gTm9wZSBmb3IgdGhlc2UgdGhyZWUuIFVzZSAtbWljcm92b2x0
IHN1ZmZpeCBmb3Igb25lIHByb3BlcnR5Lg0KDQpPaw0KDQo+IA0KPiA+ICsNCj4gPiArICBtcHMs
cmVzZXQtZ3Bpb3M6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogb3B0aW9uYWwgR1BJTyB0byByZXNl
dCBhbiBleHRlcm5hbCBkZXZpY2UgKExDRCBwYW5lbCwgRlBHQSwNCj4gPiArICAgICAgZXRjLikg
d2hlbiB0aGUgYmFja2xpZ2h0IGlzIHN3aXRjaGVkIG9uLg0KPiA+ICsgICAgbWF4SXRlbXM6IDEN
Cj4gDQo+IE5vLCB5b3Ugc2hvdWxkIG5vdCBhZGQgaGVyZSBHUElPcyBmb3Igb3RoZXIgZGV2aWNl
cy4NCg0KRG8geW91IG1lYW4gdGhhdCBJIGhhdmUgdG8gcmVtb3ZlIHRoaXMgcHJvcGVydHkgb3Ig
dGhhdCBJIGhhdmUgdG8gbW92ZSBpdCBzb21ld2hlcmUgZWxzZT8NCkkgYWRkZWQgdGhpcyBmZWF0
dXJlIGJlY2F1c2Ugc29tZXRpbWVzLCBpbiBlbWJlZGRlZCBib2FyZHMsIHlvdSBuZWVkIGEgcHVs
c2Ugc2lnbmFsIHRvDQp1c2UgYWZ0ZXIgdGhlIGJhY2tsaWdodCBwcm9iaW5nLCBmb3IgZXhhbXBs
ZSB0byByZXNldCBhbm90aGVyIGRldmljZSBpbiBzeW5jIHdpdGggdGhlIGJhY2tsaWdodA0KcHJv
YmUuDQpEbyB5b3UgdGhpbmsgSSBoYXZlIHRvIHJlbW92ZSB0aGlzIGZlYXR1cmUgZnJvbSB0aGUg
ZHJpdmVyPw0KDQouLi4NCg0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IGNvbW1vbi55YW1s
Iw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgbXBz
LGRpbW1pbmctbW9kZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAg
ICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gcHdtDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsg
ICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAtIHB3bXMNCj4gDQo+IFNvIHRoaXMgcHJvdmVz
IHRoZSBwb2ludCAtIG1wcyxkaW1taW5nLW1vZGUgbG9va3MgcmVkdW5kYW50IGFuZCBub3QNCj4g
aGFyZHdhcmUgcmVsYXRlZC4NCg0KU2VlIG15IHByZXZpb3VzIGNvbW1lbnQuDQoNCj4gDQo+ID4g
KyAgICAgIG5vdDoNCj4gPiArICAgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAgIC0gZW5h
YmxlLWdwaW9zDQo+ID4gKw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+
ID4gKyAgICAgICAgbXBzLGRpbW1pbmctbW9kZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0K
PiA+ICsgICAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gYW5hbG9nLWkyYw0K
PiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSBlbmFi
bGUtZ3Bpb3MNCj4gPiArICAgICAgbm90Og0KPiA+ICsgICAgICAgIHJlcXVpcmVkOg0KPiA+ICsg
ICAgICAgICAgLSBwd21zDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGli
bGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gbXBzLGRpbW1pbmctbW9kZQ0KPiA+ICsgIC0gbWF4
LWJyaWdodG5lc3MNCj4gPiArICAtIGRlZmF1bHQtYnJpZ2h0bmVzcw0KPiA+ICsNCj4gPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBJbnN0ZWFkOg0KPiB1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlDQo+IA0KDQpPaw0KDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiAr
ICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4gPiAr
ICAgIGkyYzMgew0KPiANCj4gaTJjDQo+IA0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsNCj4gDQo+IERyb3ANCj4gDQo+ID4gKyAgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgICBwaW5jdHJsLTAgPSA8
JnBpbmN0cmxfaTJjMz47DQo+ID4gKyAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiANCj4gRHJv
cCBhbGwgZXhjZXB0IG9mIGNlbGxzLg0KDQpPaw0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgICAv
KiBCYWNrbGlnaHQgd2l0aCBQV00gY29udHJvbCAqLw0KPiA+ICsgICAgICAgIGJhY2tsaWdodF9w
d206IGJhY2tsaWdodEAxNyB7DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXBzLG1w
MzMwOWMtYmFja2xpZ2h0IjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDB4MTc+Ow0KPiA+ICsg
ICAgICAgICAgICBtcHMsZGltbWluZy1tb2RlID0gInB3bSI7DQo+ID4gKyAgICAgICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKyAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwm
cGluY3RybF9mcGdhX3Jlc2V0PjsNCj4gPiArICAgICAgICAgICAgcHdtcyA9IDwmcHdtMSAwIDMz
MzMzMzMgMD47IC8qIDMwMCBIeiAtLT4gKDEvZikgKiAxKjEwXjkgKi8NCj4gPiArICAgICAgICAg
ICAgbWF4LWJyaWdodG5lc3MgPSA8MTAwPjsNCj4gPiArICAgICAgICAgICAgZGVmYXVsdC1icmln
aHRuZXNzID0gPDgwPjsNCj4gPiArICAgICAgICAgICAgbXBzLHN3aXRjaC1vbi1kZWxheS1tcyA9
IDw4MDA+Ow0KPiA+ICsgICAgICAgICAgICBtcHMsc3dpdGNoLW9mZi1kZWxheS1tcyA9IDwxMD47
DQo+ID4gKyAgICAgICAgICAgIG1wcyxvdmVydm9sdGFnZS1wcm90ZWN0aW9uLTI0djsNCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAqIEVuYWJsZSBhbiBGUEdB
IHJlc2V0IHB1bHNlIHdoZW4gTUlQSSBkYXRhIGFyZSBzdGFibGUsDQo+ID4gKyAgICAgICAgICAg
ICAqIGJlZm9yZSBzd2l0Y2ggb24gdGhlIGJhY2tsaWdodA0KPiA+ICsgICAgICAgICAgICAgKi8N
Cj4gPiArICAgICAgICAgICAgbXBzLHJlc2V0LWdwaW9zID0gPCZncGlvNCAyMCBHUElPX0FDVElW
RV9ISUdIPjsNCj4gDQo+IE5vcGUsIG5vcGUuIEZQR0EgcmVzZXQgcGluIGlzIG5vdCByZWxhdGVk
IHRvIHRoaXMgZGV2aWNlLg0KDQpTZWUgbXkgcHJldmlvdXMgY29tbWVudC9xdWVzdGlvbiBhYm91
dCB0aGlzIGZlYXR1cmUuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgIG1wcyxyZXNldC1vbi1kZWxh
eS1tcyA9IDwxMDA+Ow0KPiA+ICsgICAgICAgICAgICBtcHMscmVzZXQtb24tbGVuZ3RoLW1zID0g
PDEwPjsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gPiArDQo+ID4gKyAgLSB8DQo+
ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gKyAgICAvKiBC
YWNrbGlnaHQgd2l0aCBhbmFsb2cgY29udHJvbCB2aWEgSTJDIGJ1cyAqLw0KPiA+ICsgICAgaTJj
MyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3Np
emUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwx
MDAwMDA+Ow0KPiA+ICsgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKyAg
ICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzM+Ow0KPiA+ICsgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsNCj4gDQo+IERyb3AgZW50aXJlIGV4YW1wbGUuIEl0IGRpZmZlcnMgYnkgb25lIHBy
b3BlcnR5IC0gbWlzc2luZyBwd21zLg0KDQpPaw0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiBLcnp5c3p0b2YNCg0KVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsDQpGbGF2aW8NCg0K
