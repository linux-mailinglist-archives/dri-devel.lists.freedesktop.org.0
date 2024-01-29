Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFE4840064
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 09:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C29F112609;
	Mon, 29 Jan 2024 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE201124A0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzsdyAF9pf4PEXEgZcJTH72qFfz0qXJeay6L9GZ0RjypDTHuOKIssxuRW5vL/mb8vwvjwaMkA0EHeklrb0ly7ngbniNDgYLiqWU56acibheAzk591rwTGGmuGv++k5fjBbqhM5t5SqjhVpzTl058sSdaHhZ/oxO/PyoYeiqZjn+qkcn4UuxVh6q2HukFyCtiPNcS2dwKSOZ/HhV72occqr+Hb+X/tMXBIdvJcyNOw3NDkppX/G4YaKd/vqyuj3Gx44SRAQ/QiGd1JDsIvrobECxvNOzmqn6TsgCNVBsxf/tL7nnCY7vAPWehWfBk4TOhhpJfffsZJBZy+TluMXrvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyrJM+c5/v/FDTSDYWKIe8M1b14nUObFQRp4CNpEPCE=;
 b=SK7K7nZvRUT5K6GTzJzRO1XGb9raQAQ/Z3ezYkjKjkDHEP+rV0On1RMkZ5kMtNka+8ousRqFexuTGGc8koLYAxuBsPZ9bIaFmm0u+GHU3IO3pGoyvKdiq3w6Z3DJCB+5v4RR0hCg/bEPUGNKG9azu5yvXq2Yo6jAyXn2YJUj3YKiE1dzVno5sn7OGQ7YgKHumAxTSoCGnYq+xpdTHHw3Pe7TbaGWZCr47nzNtA4393N0ypJrwS43wZegR4FYlmaIVg/++4WjGhSkpuI8psNM9lz80wXZbEwicEHiSgxXY4gCdGKm1VZHHNgkvTtU1KKZtebJ42HSx3icew2fNISefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyrJM+c5/v/FDTSDYWKIe8M1b14nUObFQRp4CNpEPCE=;
 b=q04zGYJxkg62x8JxVNRdvuBjCov5ud66RgF3I9XGFXgQU991KSZzUWL5KwDCNF/n98yRws5GfMDs/Z9A54txRmKqEZd89q0iXbdvhjIfCZZ6V2if1qGV1SlbdmXSmtMgnZgOmlKSYBd6J27XhZeMS2PiP+//U2F0f4tkuyF7ui8=
Received: from DBAPR04MB7384.eurprd04.prod.outlook.com (2603:10a6:10:1b1::20)
 by AS8PR04MB8769.eurprd04.prod.outlook.com (2603:10a6:20b:340::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:59:37 +0000
Received: from DBAPR04MB7384.eurprd04.prod.outlook.com
 ([fe80::58b8:bfbf:6d8e:9825]) by DBAPR04MB7384.eurprd04.prod.outlook.com
 ([fe80::58b8:bfbf:6d8e:9825%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 05:59:37 +0000
From: Alice Yuan <alice.yuan@nxp.com>
To: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "martin.kepplinger@puri.sm"
 <martin.kepplinger@puri.sm>, "kernel@puri.sm" <kernel@puri.sm>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH linux-next/master 1/1] media: staging/imx7: Add handler
 the abnormal interrupt BIT_STATFF_INT
Thread-Topic: [PATCH linux-next/master 1/1] media: staging/imx7: Add handler
 the abnormal interrupt BIT_STATFF_INT
Thread-Index: AQHaKXxoddjS7r7tM0+D9lkgOTL0mrDwnRdw
Date: Mon, 29 Jan 2024 05:59:37 +0000
Message-ID: <DBAPR04MB7384CB8916EDD06E21B34F379C7E2@DBAPR04MB7384.eurprd04.prod.outlook.com>
References: <20231208021940.883259-1-alice.yuan@nxp.com>
In-Reply-To: <20231208021940.883259-1-alice.yuan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
 martin.kepplinger@puri.sm, kernel@puri.sm, linux-media@vger.kernel.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR04MB7384:EE_|AS8PR04MB8769:EE_
x-ms-office365-filtering-correlation-id: 28d17297-b2bb-4b86-4a06-08dc208f79b1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +OJLEbXIgQ7aIouX7ZhjopqwSUt93UDmZmOFfAvNN3EYHEg1HmGHuudbB+kTjbrmSgPOyzCDco2jt9fDtiKCMG9Gyn4XCKqaq8aPNFhT/ufOWGFJhCcK76BBV+DXhJQCJ6cHjqhHFO+hxX/etrY+KGSoFALnGsdDxHPu7VQ1jOb/G417ShzULDKUSdevcn17sXHeKYd6L4BBHJoo4hmlEAM5Zj1BG1Pf9QaZTFJ0xGnNH8YKebOfsB+V4X5A0FGQE5m9Ku4yDdYzu5w94xlRlG0Cn3x4xKx+Q6RAGyH11n6QuojaGVjQourwRFt2jn9hwIUUz0mkAy6CdukGjsdjFY0CsOtc6ZussTOugYn6UAOxJpmxhT5gNoQ2x7r+DoSA7KF9MLYWC8TNeFxTcpG3i3NmqzxsKXk08Oykycz7dESXc0YfuN4kqI9yJo+V9NYulMxQIGj3DpxLeaR1EYB0wAkzguZ1MlE6IXwvzYSyFzfH2YPK7UfZsVyppfF8Jt1ieKzQya7uyvs3b8Ugcp81UiB5baxwB/TpZAkaPPdUeI8lys39xWyqPK+cZ65xpIRsrreWS7iX5EW0f6TSQDUqk00DLRnjAJpGHRe0be4wqqDWwPzbHXMtQ3N/pmfphtmk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBAPR04MB7384.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(55016003)(83380400001)(33656002)(86362001)(38070700009)(122000001)(38100700002)(26005)(9686003)(53546011)(7696005)(6506007)(2906002)(478600001)(41300700001)(110136005)(76116006)(316002)(71200400001)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(5660300002)(8936002)(4326008)(52536014)(44832011)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RC9iK3pxR2VvNTYvLzdLU3FBcHBtWHZxTDBMSTZab1RzZ0ZPcWNRM0YzL1hi?=
 =?gb2312?B?djRGMXVNTFVJd0pkZ1BncUlQU0ZMV2ZteVI4UU0xMGdlMGZZUWNPaFF3UlhF?=
 =?gb2312?B?QmVWOCttMG94RE56Wko3WldzSjc2MHc2bjJZWFZSM2lCWU8xRUp5MTVPcExP?=
 =?gb2312?B?elNYS00zY1BwSkV1TmRHQUxDY3ZUd3BBUmVqSjN4V2VTRHJ5TkJLdE1CYjEy?=
 =?gb2312?B?aVFGc3I2SkVOVmhlbGc5QjJDc0YzY1NZVFQ0dnIwM1k1eCthRVpURDF6SG01?=
 =?gb2312?B?V2prQnc3TC81MS9kWFpEa2ZKQ2pkZTQwbWh1NGphRUc5dkZEZHE3alFMNE1j?=
 =?gb2312?B?enNrMURLTzRrZGNVS1lkUlM3QmFTL2llUGRvd0RhWEZicjlsekY3clQ0elV6?=
 =?gb2312?B?ZGxob05IY3hsRmpaS1ZFTURBNEphRkk2cm4rR1BiTUJnNkY5UHdzb2NuTTla?=
 =?gb2312?B?ZjA1N3VwNWovV2owMlQwZ0V1VnZ3U0hWSFBTRm4wWEUxM2RqUlV3dHV3eXFu?=
 =?gb2312?B?eGhndm1oYVBiZThLZVNBL2xYcjB3dkt5cVg2VU11dU1VcHdpK2N0LzJrK29m?=
 =?gb2312?B?U2lMNmNIK1dqZ3VOUVluRVorekYrSHZEYVlhQ3JqclU0WXNac01SeU53TlBE?=
 =?gb2312?B?K1dSZmpTL2FXV3dEZnpIWmVhU2kzeXZkNHExK09yVmJaMXJ5VzkwVTQ3TWlF?=
 =?gb2312?B?SVJvVHNUclhTaVZYdjZ5RGdCeStKd2RtR2VoOE5GUXp3RXZ5dFkvUTV6VXVp?=
 =?gb2312?B?TGNFakVHcVQzV3ZCY2hqNERVYnBQM20yeDE0UE4zK3J4MFBYVjFHanhCRXRS?=
 =?gb2312?B?U3hOVGJDSW9qUlp1VFJiMUhnNjcvQlVlQUJQQ1VPVkJtNEpXMUpGTm5wbTBa?=
 =?gb2312?B?TjNSY2k1bm1xRXNFeFQya2Z0L3dwcWcrZEJ5Z1Bkek9jNmgyRzFlQVYwNzRU?=
 =?gb2312?B?S1FoZFl5Rnl1RHpSTGZ3WitpdlBaRzdhRFJQdjA2REVkTkxPSER1dCsvdGda?=
 =?gb2312?B?VnF3QktsZ2w1cURqNjFWQnJlV2x5QXhWaDBhR1Nzci92UDNnN3JkeVVOempq?=
 =?gb2312?B?bjlUaStxWDVEOCtHZld2TTZqSGVLWUdseGFBd0hYK2JVRlNOK1VzVHErOFNB?=
 =?gb2312?B?ZFJWSjlnaDg2OFNzYS9SRU9ZVVBkaHNUWHFqWXhaRlR6dHRicVZUTnlPL3pI?=
 =?gb2312?B?anRzdndzSnlqQnpSTlE0WmNFK1JKdkU3ZmRqemFtOUkwRFBzMENMZTkrVjBo?=
 =?gb2312?B?RnRrVG95ZHF5MzBUVlRlaWpyOURBK0lwS09lVy9aRW5JSk5DTDlkR3pHdVUr?=
 =?gb2312?B?anE4RG1ocWVIQjJxZ0hNS0F5UHNlOVFZeThlUFAxUDFsMVFnYXZ1Ym1rTWFo?=
 =?gb2312?B?UWhldExodGl6SE9xZVVQbFI3WTM4dmZieXF6N3RRMEljS3prUitKWmUyb0k3?=
 =?gb2312?B?SVluYzRWbWFoeDQ2cDY5U2hrWEN2NGF4ZDFMTUwzYS9SUkd3RWdhYUQyN2dM?=
 =?gb2312?B?RXJ5bGEyVEkwTUh3VmZwV0xFcEI4SXVUazhJV1YvdzVlVCsyb09VRjl2V2Z0?=
 =?gb2312?B?cVRDbERlQlFEZHQ2K3FWMHA2WGZvcmw0WUNwUTZidGplVWI4Z244RDVqVFFW?=
 =?gb2312?B?WVp1Tnd3Vit4MzFBSnlRV2pUajJGWUQxYUNaZ0U1c1VMOEQwOGdqd0ZsWURs?=
 =?gb2312?B?cC8rdE5hakRGR1VRTnZHZG9zTWlUQzJMbnFsTnVmdElKNWVTcURWM0YxTWZP?=
 =?gb2312?B?L29wSzNlSWt2TGpYZDhMZ0w1amNMZjNFRkt4Tm4wcmlhUTJGTm9uRmljRHpE?=
 =?gb2312?B?MFhRcW94SkxKc2NNejhFY0NlYzgvcUJMT1BrT2svN0d3MmxUZHNpTVhaVFNo?=
 =?gb2312?B?WGJjY2JrRVN5aXV5N2NBdndxblgyTVRTWE5DYTBBUmQ3ZlNRdWtWeFpoZUxz?=
 =?gb2312?B?SmN6Z3hxbGRZR0ZyMkRMdGVUYVVXY3NNZjdrYTBBVlJkV1BlQ2wwNVQrbE5z?=
 =?gb2312?B?RXhBVlhITk9EclJGMFplbHhvRnFlL1ZoMkIyTDZWSzBVeXJBcjhGUG1zSGRU?=
 =?gb2312?B?MVMyaE84WGlubXMvbUl2ZkZyMHo3eXo5OVdxY1dqeXhXdVFVUTFSRkgrOXI2?=
 =?gb2312?Q?anow=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR04MB7384.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d17297-b2bb-4b86-4a06-08dc208f79b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 05:59:37.3268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /e6ICztZzs2DjsopgWLCZ/dpPpmquuQf3vLe73GhQTTAXqq2KQTmpOYAFSIl19nL+SVET4PbkoX0SxDcAioauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8769
X-Mailman-Approved-At: Mon, 29 Jan 2024 08:37:49 +0000
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
 LnxRevLi <LnxRevLi@nxp.com>,
 "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QHJtZnJmc0BnbWFpbC5jb21ATGF1cmVudCBQaW5jaGFydEBtYXJ0aW4ua2VwcGxpbmdlckBwdXJp
LnNtQGtlcm5lbEBwdXJpLnNtQGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KDQpBbnkgZmVl
ZGJhY2s/DQoNClRoYW5rcw0KLS0tLS0tLS0tLS0tDQpCJlIuDQpOYW1lOiBBbGljZSBZdWFuDQpB
ZGRyZXNzOiBOby4xOTIsIFpoYW5namlhbmcgTGlhbmdqaW5nIFJvYWQsIFB1ZG9uZyBOZXcgQXJl
YSwgU2hhbmdoYWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGlj
ZSBZdWFuDQo+IFNlbnQ6IDIwMjPE6jEy1MI4yNUgMTA6MTUNCj4gVG86IHJtZnJmc0BnbWFpbC5j
b207IExhdXJlbnQgUGluY2hhcnQNCj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT47IG1hcnRpbi5rZXBwbGluZ2VyQHB1cmkuc207DQo+IGtlcm5lbEBwdXJpLnNtOyBsaW51eC1t
ZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IExueFJldkxpIDxMbnhSZXZMaUBueHAuY29tPjsg
bGludXgtZGV2ZWxAbGludXgubnhkaS5ueHAuY29tOw0KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7
IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IHBh
dGNod29yay1sc3RAcGVuZ3V0cm9uaXguZGUNCj4gU3ViamVjdDogW1BBVENIIGxpbnV4LW5leHQv
bWFzdGVyIDEvMV0gbWVkaWE6IHN0YWdpbmcvaW14NzogQWRkIGhhbmRsZXIgdGhlDQo+IGFibm9y
bWFsIGludGVycnVwdCBCSVRfU1RBVEZGX0lOVA0KPiANCj4gRnJvbTogImFsaWNlLnl1YW4iIDxh
bGljZS55dWFuQG54cC5jb20+DQo+IA0KPiBXaGVuIGRvIDI1OTJ4MTk0NCByZXNvbHV0aW9uIGNh
cHR1cmUsIHdlIGZvdW5kIHNvbWUgdGltZXMgdGhlDQo+ICJCSVRfU1RBVEZGX0lOVCIgaXMgYWJu
b3JtYWwsIHRoZSBzdGF0IGZpZm8gaXMgbm90IGZ1bGwsIGJ1dCBzdGlsbCB0aGUgRE1BIHRyYW5z
ZmVyDQo+IGRvbmUgaW50ZXJydXB0cyBnZW5lcmF0ZSwgYXQgdGhpcyB0aW1lIHdlIHdpbGwgZ2V0
IGJyb2tlbiBmcmFtZXMuDQo+IA0KPiBGcm9tIHRoZSByZWZlcmVuY2UgbWFudWFsIG9mIGlteDht
bSwgd2Uga25vdyB0aGUgU1RBVEZJRk8gZnVsbCBpbnRlcnJ1cHQNCj4gc3RhdHVzLCB0aGF0IGlu
ZGljYXRlcyB0aGUgbnVtYmVyIG9mIGRhdGEgaW4gdGhlIFNUQVRGSUZPIHJlYWNoZXMgdGhlIHRy
aWdnZXINCj4gbGV2ZWwuIEl0IGRlZmluZWQgY2xlYXJseSBhYm91dCBCSVRfU1RBVEZGX0lOVCwg
MDogU1RBVEZJRk8gaXMgbm90IGZ1bGwsIDE6DQo+IFNUQVRGSUZPIGlzIGZ1bGwuDQo+IA0KPiBT
byB3ZSBzaG91bGQgaGFuZGxlciB0aGUgYWJub3JtYWwgaW50ZXJydXB0cyB3aGVuIEJJVF9TVEFU
RkZfSU5UIGlzIDAsIHRoZQ0KPiBzdGF0IGZpZm8gaXMgbm90IGZ1bGwsIHdlIG5lZWQgdG8gZHJv
cCB0aGUgYnJva2VuIGZyYW1lcywgYW5kIHJlY292ZXJ5IGZyb20gdGhlDQo+IGFibm9ybWFsIHN0
YXR1cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGFsaWNlLnl1YW4gPGFsaWNlLnl1YW5AbnhwLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5j
IHwgMjUgKysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5jDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9ueHAvaW14Ny1tZWRpYS1jc2kuYw0KPiBpbmRleCAxNTA0OWM2YWFiMzcuLjkwMTJiMTU1YzJk
NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14Ny1tZWRpYS1j
c2kuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5j
DQo+IEBAIC0yNDksNiArMjQ5LDcgQEAgc3RydWN0IGlteDdfY3NpIHsNCj4gIAlib29sIGlzX3N0
cmVhbWluZzsNCj4gIAlpbnQgYnVmX251bTsNCj4gIAl1MzIgZnJhbWVfc2VxdWVuY2U7DQo+ICsJ
aW50IGZyYW1lX3NraXA7DQo+IA0KPiAgCWJvb2wgbGFzdF9lb2Y7DQo+ICAJc3RydWN0IGNvbXBs
ZXRpb24gbGFzdF9lb2ZfY29tcGxldGlvbjsgQEAgLTY4Niw2ICs2ODcsNyBAQCBzdGF0aWMNCj4g
dm9pZCBpbXg3X2NzaV9lbmFibGUoc3RydWN0IGlteDdfY3NpICpjc2kpDQo+ICAJaW14N19jc2lf
ZG1hcmVxX3JmZl9lbmFibGUoY3NpKTsNCj4gIAlpbXg3X2NzaV9od19lbmFibGUoY3NpKTsNCj4g
DQo+ICsJY3NpLT5mcmFtZV9za2lwID0gMDsNCj4gIAlpZiAoY3NpLT5tb2RlbCA9PSBJTVg3X0NT
SV9JTVg4TVEpDQo+ICAJCWlteDdfY3NpX2Jhc2VhZGRyX3N3aXRjaF9vbl9zZWNvbmRfZnJhbWUo
Y3NpKTsNCj4gIH0NCj4gQEAgLTc2NCw2ICs3NjYsMTIgQEAgc3RhdGljIGlycXJldHVybl90IGlt
eDdfY3NpX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQNCj4gKmRhdGEpDQo+ICAJCWlteDdfY3Np
X2Vycm9yX3JlY292ZXJ5KGNzaSk7DQo+ICAJfQ0KPiANCj4gKwlpZiAoIShzdGF0dXMgJiBCSVRf
U1RBVEZGX0lOVCkpIHsNCj4gKwkJZGV2X3dhcm4oY3NpLT5kZXYsICJTdGF0IGZpZm8gaXMgbm90
IGZ1bGxcbiIpOw0KPiArCQlpbXg3X2NzaV9lcnJvcl9yZWNvdmVyeShjc2kpOw0KPiArCQljc2kt
PmZyYW1lX3NraXArKzsNCj4gKwl9DQo+ICsNCj4gIAlpZiAoc3RhdHVzICYgQklUX0FERFJfQ0hf
RVJSX0lOVCkgew0KPiAgCQlpbXg3X2NzaV9od19kaXNhYmxlKGNzaSk7DQo+IA0KPiBAQCAtNzkw
LDE0ICs3OTgsMTkgQEAgc3RhdGljIGlycXJldHVybl90IGlteDdfY3NpX2lycV9oYW5kbGVyKGlu
dCBpcnEsIHZvaWQNCj4gKmRhdGEpDQo+IA0KPiAgCWlmICgoc3RhdHVzICYgQklUX0RNQV9UU0Zf
RE9ORV9GQjEpIHx8DQo+ICAJICAgIChzdGF0dXMgJiBCSVRfRE1BX1RTRl9ET05FX0ZCMikpIHsN
Cj4gLQkJaW14N19jc2lfdmIyX2J1Zl9kb25lKGNzaSk7DQo+IC0NCj4gLQkJaWYgKGNzaS0+bGFz
dF9lb2YpIHsNCj4gLQkJCWNvbXBsZXRlKCZjc2ktPmxhc3RfZW9mX2NvbXBsZXRpb24pOw0KPiAt
CQkJY3NpLT5sYXN0X2VvZiA9IGZhbHNlOw0KPiArCQlpZiAoY3NpLT5mcmFtZV9za2lwKSB7DQo+
ICsJCQlkZXZfd2Fybihjc2ktPmRldiwgInNraXAgZnJhbWU6ICVkXG4iLCBjc2ktPmZyYW1lX3Nr
aXApOw0KPiArCQkJY3NpLT5mcmFtZV9za2lwLS07DQo+ICsJCQlnb3RvIG91dDsNCj4gKwkJfSBl
bHNlIHsNCj4gKwkJCWlteDdfY3NpX3ZiMl9idWZfZG9uZShjc2kpOw0KPiArCQkJaWYgKGNzaS0+
bGFzdF9lb2YpIHsNCj4gKwkJCQljb21wbGV0ZSgmY3NpLT5sYXN0X2VvZl9jb21wbGV0aW9uKTsN
Cj4gKwkJCQljc2ktPmxhc3RfZW9mID0gZmFsc2U7DQo+ICsJCQl9DQo+ICAJCX0NCj4gIAl9DQo+
IC0NCj4gK291dDoNCj4gIAlzcGluX3VubG9jaygmY3NpLT5pcnFsb2NrKTsNCj4gDQo+ICAJcmV0
dXJuIElSUV9IQU5ETEVEOw0KPiAtLQ0KPiAyLjM3LjENCg0K
