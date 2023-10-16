Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B87CA453
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8925F10E173;
	Mon, 16 Oct 2023 09:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F3010E173
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:38:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNraea932aDhV2/CWQMrqQE9Zz1AyiFr2HZar4yPIHk3PbW8nt44y4lYUPxSIYcfjYRpTQK8HJHAjNfbbom+YBgUmR78qKSZ2VAZGfUN0d0rc74wcAlQd7Hw4mNwgQ5zg8RUqduTw7QixmsvvUtZIbYEC1rTCS1ipcuqboqw8jJ07qsEjxpbFMBVsBb3Akd2m8NJ8/eAJM1X266ueKbGjIyGQFhkk/asQ89dUigwXnf/EKiS1cW3FAmt8qs+opNlOyKAlf4lfP/Hcc0sO1nKBWEVJEztrUHPKdKqTV3ClK019XKd1VFktgLYbknP7N33ph0H4g+9q3Gbv60q8Sk1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FkpYjpAesdo7BFlLHYrRi5sum7m2dK9bWV/1UL2pZI=;
 b=CaoqD3eIp4kpZUuUEwpsZH4T0xafnGNGbMEg3FjfB2vyeHL2bgthW41UALihLbSi401SVsFQwA7nOqIyufpuIvcpZ+cH663vxN+7WuKyajO0feiATWYG61dlTHqWQylJ3ojsqkrPavaCnj2BT4QeNlZ1VXPrr6HvO7MNU/+TIUGoxyERC7ckAAfbw0ko+RO1b3Szt/c0Ipvamp1TRG8Hd5slHZlhJUxZ0QHjFU908tp2pQNI+FJGjmT7o5YDCFY6Bz9evpGKCaxtl7uBShJo6CsO1RVe4LtNb0gtSI4/BffhLnmwvizdKL1tIkgEqEKAtrfc58KgRnnbhszSV/fXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FkpYjpAesdo7BFlLHYrRi5sum7m2dK9bWV/1UL2pZI=;
 b=eTR70gi+3QCRG/R3Awn7CsFgThMo2g0h4l6TiV18p0nKH7BSxlQEzbhTMqImj6HObjwEZ6yZoKJlclYEo/4JxDD9ZcoPgb0PuEU7TRZ7m0GUMX+xO9k4EySm7Ay8o6OoiuNQNwfnbv8rrgl3uiwEQe1DGguvo5eufFuYYcPcDfc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8399.jpnprd01.prod.outlook.com
 (2603:1096:604:192::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 09:37:58 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::c90e:cd43:c967:5218]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::c90e:cd43:c967:5218%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:37:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Robert Foss <rfoss@kernel.org>
Subject: RE: [PATCH v2 5/8] drm: adv7511: Add reg_cec_offset variable to
 struct adv7511_chip_info
Thread-Topic: [PATCH v2 5/8] drm: adv7511: Add reg_cec_offset variable to
 struct adv7511_chip_info
Thread-Index: AQHZ2024w0fL+hA9GkCTJzOC8qA/2LBMZzWAgAAKsbA=
Date: Mon, 16 Oct 2023 09:37:57 +0000
Message-ID: <TYCPR01MB1126985230B9F3366651397BB86D7A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <20230830142358.275459-6-biju.das.jz@bp.renesas.com>
 <CAN6tsi7P4ooXeD_EGmMbGu-wtGaZjpbZ6N-Lkan+Q5GE4z-dQw@mail.gmail.com>
In-Reply-To: <CAN6tsi7P4ooXeD_EGmMbGu-wtGaZjpbZ6N-Lkan+Q5GE4z-dQw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8399:EE_
x-ms-office365-filtering-correlation-id: ac974020-05fd-4271-7006-08dbce2b94e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/f0qoK9BfwE9n8p+mXcjAVWTdv2Ee/zUNIonYRAGBwypzzW34nbuR+yWfCP3WHIOkHkDYPBFivFJZy0sCipbBcTEHkB2Vet7IhnBFAz0sXIMxEbVylT0L6vTxUoDfohczdfbIcBjYL9D7Qlm8VRzkYn9anPBUAWh3j5eDA8BlEwKQjUTZvSmDx/ifw9/DBzGFmSWO5lXa+bfQqQ1Yud2oHjEobdefJ4U714KYa/hEKGjb6GKSC7nUyZyxsbC+enHOpOmrLmanlRVhtUAA3yCM7SdeHPXDh27p906fEYwemCyQRLnH3yTGISCdltWs4EmrE4OgR0hCyyUXDdfXz790HcNKPGCm5iedbSzDHVhX7rG8dXu5FZ+loATTCQNs2kk8qIhlKAUBU6SRShxmCAoWpX6liH7GByksRcaib7FF97uDjKDzdW6rk31j9gMnji1hXp9PotGLU0ccKUCHu5eabFD2Thq27yQ8kk62syzdepGtdEUbDfTJnes6GSnxkxiPmc74ESmVemAfyp6Ked7JbG9/XIYOCvq7Y0k1F1FBhjOYgR/1fQMIhFwD4GzQ38S90QcueXNtKrLxm+NotHFwr1AkwTYZ4D/n2LIjLE5IR5wzcpkciVRU4P99gcdFsB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(71200400001)(66446008)(66476007)(66556008)(76116006)(64756008)(54906003)(6916009)(66946007)(26005)(41300700001)(6506007)(53546011)(7696005)(316002)(9686003)(7416002)(8676002)(8936002)(52536014)(4326008)(4744005)(2906002)(5660300002)(33656002)(38070700005)(122000001)(86362001)(83380400001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDdSRUNJK2cxRmcrR21RRC9oeHluUWR0RGNMQ0FlUUNDdFNWc2s1WGgrRlJo?=
 =?utf-8?B?QmlBZlhDWUdHVUo1VGtJUTcyNmVzdVk5dTZpclpmVXBreE0xenRRd3FVNHIw?=
 =?utf-8?B?VHVlT0I3SnlSK2lNN00rWHAvTWE5NmFWSXpLblp5aDZ4NEJGUHFEQjVLM3hL?=
 =?utf-8?B?MHVQalp1QnNoUHJjU0FMNWZuM3FsMUdjaExnTll5VDFYNVBtMnQreEFFTkZh?=
 =?utf-8?B?T0hpQ256VWZTSTZUWTJlc0ZJMWplNmFvSkk0UVlqYUJWcDAxbXh2SGpja1lI?=
 =?utf-8?B?cjV2UFRCWU12VUZucWF0MzdqSTBzeUNZMFFCZm5yblR3amVLS3MxZUk5SUdG?=
 =?utf-8?B?Z1dwZGM0QVhIN0piWlZCOUlGSmtPa01QM0I3RWdpaWxINTJ6TUZSUys5TTJB?=
 =?utf-8?B?TFlmRnZBay9ycVBYZ3lqNHdoYkdFdDN5VC9RakxiZFZlWHRod014T01kSGgv?=
 =?utf-8?B?RC9pZE9KUWZoT0h3U2prQjIrZkFDMUExamYxT3FPd3lqdisxTmdUVCtEUGhq?=
 =?utf-8?B?RDlvR0tyV2NhcDRuMm15VlFMcEQ2V0R6ZzIrVTZ0dGFWajFNamtVc01SQzZk?=
 =?utf-8?B?VU9vN3AvUDBORDdXZ0hPem9MVzk0TVEzR2FhTkExU1l3UFBxK0tGTk4zTzNq?=
 =?utf-8?B?M0J4bE13VG13QTB5bERabXViRXR2Q0M3bmExMG5MR3FOaGxSMU9kc0F0MGs1?=
 =?utf-8?B?MXR0aFhKVC9FNTJTK0ZkZXlFR1d0VXVQbGJDRDRqblBnc1FtVDFWVzExdnhH?=
 =?utf-8?B?WnE2SllkcXVHYTdsL1dneDlGQk5pdnowNk0ydGt2SVdqTlRzbU16T2d1ZjNh?=
 =?utf-8?B?NW9JcmNvTlpsbFAzblI2OXdPVktpd01SVGhjSkxhOFVSQjdkcGtvTHE0dk43?=
 =?utf-8?B?VGlPa1hWUW54N3Q5Nm1sUHdUTHowNFBqVGMyUmFLeXh1YnZDdTZqTi9ES2pj?=
 =?utf-8?B?UE9QM05KQXl3RnlESGlldXE1MEZDQ3QwYkZYdlgxTE1IbW5YTWx3a0UzMDZn?=
 =?utf-8?B?azJ6UVBGVi9PSGgvQ2VhbGxCaUFJei9kOWFZa2dCR3NoMmNwd0RmT0cvRmpI?=
 =?utf-8?B?bmUrZ0NZVlAzV2dkMlhvRUltQi84UXVZQVRqT1RybXp1VnBvdGhET2hRdTRB?=
 =?utf-8?B?TnQ0bFBZS0Y1YVlCR2JSNXBGTHhzb05wYTlENldPYnd4cU50MkQ4RC9HOEEr?=
 =?utf-8?B?SThacWM2Zk1xRm1nazR0UWpZN3VjcDNvSlFOanVPSmUrYWhZRnl4ZkhXeUVC?=
 =?utf-8?B?OHlzTW11bUhLd3lFSk4yU3hWSGZSOFJJWWxHNGxITzBHWDdadmZUQTMxRGYv?=
 =?utf-8?B?am92Y1dsTUFUckVibkNDekJIVmg5dUFpSndIY2Z2TlEwd1MrUUd1c0YyRi9U?=
 =?utf-8?B?ckZGdDlyNExhNnhBQkl2blI0RFUyWHJERDdvd0w0cEdzZmExNm4zZ0lJUmNC?=
 =?utf-8?B?dHBSM3daN0lHK2FxUVIyeVA1bUkwOW55aGR1b0lpSnVWYTZuQXhrTFU2ekNW?=
 =?utf-8?B?Y1BJZmlnUVhKQjlJRHg2SkJWSk5rZitDemNiOHRWNHM2dWY2N2dnM043YU5S?=
 =?utf-8?B?THVVMTViNVg5Z0FMOWxWemNheGgzUWhETzlpQlgwYldjQ3V4eFNQNXdZb3l0?=
 =?utf-8?B?M3R3TkxhV0ZvRjBSNmlFTzlFYVBscHcwYzZWOXJxNitYL3I5NGdpVmJsMkV3?=
 =?utf-8?B?Y2ZFeTNZL3NRMjZhUURHc3Q2NmdpTCtZbWRHeDVBWWRwaXdFL3VJTjFrMlhW?=
 =?utf-8?B?eG9Fbi9GNTdXbGREcWR2Tks3N0xLUG4xNlB0ZHBIRUl4ZWlod3lkUW9NSnZH?=
 =?utf-8?B?R1ZrQ2VqT2RReFBsYWhhMVRkaldnRkh3cndIKzcxN1ltU3dYK0xjUGd2cU8v?=
 =?utf-8?B?cVpOTUdaNzlvb3ZMSHpyWi9aZUswekI1bjJ2Z05MTzYzOU5iUzNYUFdNeXEv?=
 =?utf-8?B?STYzb0JDZnVvTmp2ZXZ3NTJCc1VOd1RFeXFBS1Rqc29paXU0YnhvVVZLV2Zv?=
 =?utf-8?B?QjBXNHJIeGVDZXVUdnYzSE1UTlUwTjI2aU1zUG5sVi9aMUl5MWhCS3BvTjlQ?=
 =?utf-8?B?cVhNZlJHR1RLTEFkaEdjUHg3bnpqQURNaW5Zb1JWSFp5TXM3RXJQVENtV1lM?=
 =?utf-8?B?dDBGMTEvVS9BdXc5bG1SOHJMS2Fjb01odmVxbkdHOFE5eU1FeVZNRWZLcGlM?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac974020-05fd-4271-7006-08dbce2b94e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:37:57.9265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpfThHqfJGsP+IIsgr4zBrg35Uo2zc5xM5mWw5OSyRFGYLSdbh8Gh3HfOW2z+YH0jbQlZT4IVAIMtEADrcu0BSCxk7ICypP1JHKOd+Vk70o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8399
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0IEZvc3MsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjIgNS84XSBkcm06IGFkdjc1MTE6IEFkZCByZWdfY2VjX29mZnNldCB2YXJp
YWJsZSB0bw0KPiBzdHJ1Y3QgYWR2NzUxMV9jaGlwX2luZm8NCj4gDQo+IE9uIFdlZCwgQXVnIDMw
LCAyMDIzIGF0IDQ6MjTigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIEFEVjc1MzMgYW5kIEFEVjc1MzUgaGF2ZSBhbiBvZmZz
ZXQoMHg3MCkgZm9yIHRoZSBDRUMgcmVnaXN0ZXIgbWFwDQo+ID4gY29tcGFyZWQgdG8gQURWNzUx
MS4gQWRkIHRoZSByZWdfY2VjX29mZnNldCB2YXJpYWJsZSB0byBzdHJ1Y3QNCj4gPiBhZHY3NTEx
X2NoaXBfaW5mbyB0byBoYW5kbGUgdGhpcyBkaWZmZXJlbmNlIGFuZCBkcm9wIHRoZQ0KPiA+IHJl
Z19jZWNfb2Zmc2V0IHZhcmlhYmxlIGZyb20gc3RydWN0IGFkdjc1MTEuDQo+ID4NCj4gPiBUaGlz
IHdpbGwgYXZvaWQgYXNzaWduaW5nIHJlZ19jZWNfb2Zmc2V0IGJhc2VkIG9uIGNoaXAgdHlwZSBh
bmQgYWxzbw0KPiA+IHRlc3RpbmcgZm9yIG11bHRpcGxlIGNoaXAgdHlwZXMgZm9yIGNhbGxpbmcN
Cj4gYWR2NzUzM19wYXRjaF9jZWNfcmVnaXN0ZXJzKCkuDQo+IA0KPiBzL2ZvciBjYWxsaW5nL2J5
IGNhbGxpbmcvID8NCg0KT0suIEkgZ3Vlc3MgaXQgd2lsbCBiZSB0YWtlbiBjYXJlIHdoaWxlIGFw
cGx5aW5nLg0KT3RoZXJ3aXNlIHBsZWFzZSBsZXQgbWUga25vdyBpZiBJIG5lZWQgdG8gc2VuZCBW
My4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iZXJ0IEZvc3MgPHJm
b3NzQGtlcm5lbC5vcmc+DQo=
