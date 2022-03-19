Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1514DEA4F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437E10E268;
	Sat, 19 Mar 2022 19:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2137.outbound.protection.outlook.com [40.107.22.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C944710FDF2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 15:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiBZtblGvWQIErhQq7D7Uk+J0EvKMPNDKDe6j0tCbv/Gbg1UUXKy28CLCT38dlK0qCLwIBKigdQXQu9UD+JdxI76DXDkOWySx6OoBvTzSRJv3YZwAh4CxbcX5WmBLzHL9Y7hxW6d7Oxf4h52KIQZCBHJTjKC/SKssOZdIPvW+ZcWKeFHWaS5isb6MkiLJngDnnTx9w2ki8XVdfZFGHSM7lIZpnGV3UaBtCRgRmx9AMoZm3RxF4by8m5ZNcTTRnkZQBpaLTVfUaSCnqAifXzxog81f6CpV0c+T6IWcgibzwapcpMlaWiskfLQAnuSZTMz88RW+byFU32KtnGRGbniWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAF1ExWvkrhPOhMDmE6NdFF2rNWmZF/I3TWoUiA154U=;
 b=QCV78gBhfdxCh0S87sM3SIRuo3g3g4dLvdaQss+XP10fJA0wrBgBFm8vt+pwoK6HNyqrrfEN6pSZbhn2Y2lgULyp2oE2OalGMo6KSmUAHEGNJzDip9IPB463VyN7z76WAKHfQMpzHngeZSw5ruh3gLJ8b2nSGGltKPZIWNkXZ30f5oaHcmFxGcHi0q+yU7HuZQHHwPM1kWRNrY1SBEf3AuBqRON9l2Q9IqSYRe4axhVmEPnKmSabqHNWma+OX7xRQDRTj3wgBgiMktvLYdEHtcvBhNOYubp8hUAerLj8akJzzjeefOt2q5W/B2f+QZH0jUZQPPnKmFZofSrDEF5r/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAF1ExWvkrhPOhMDmE6NdFF2rNWmZF/I3TWoUiA154U=;
 b=XzqIfczTheJDfff1VD03T0qlde6pnHhOWAOOWj4XpSqvs7WMpdQOC72iw8Fx0WLHdyEcNxF9X6eV6akVZrjCH9pRyZq7ns2pjnb86cM/zfpHN2xV1Q+RqXMnJzv6XxJ7vee385Apd6+ERw3f/t4/Va0LhMTDavDS7nKTTp2ggvk=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by PA4PR03MB6895.eurprd03.prod.outlook.com (2603:10a6:102:e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Sat, 19 Mar
 2022 15:05:09 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::6123:22f6:a2a7:5c1e]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::6123:22f6:a2a7:5c1e%5]) with mapi id 15.20.5081.019; Sat, 19 Mar 2022
 15:05:09 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>
Subject: Re: [PATCH 0/2] drm: bridge: adv7511: two fixes for CEC
Thread-Topic: [PATCH 0/2] drm: bridge: adv7511: two fixes for CEC
Thread-Index: AQHYO6H5g+mOB3NTQEipoMml5TIbJw==
Date: Sat, 19 Mar 2022 15:05:09 +0000
Message-ID: <87r16y56fu.fsf@bang-olufsen.dk>
References: <20220319145939.978087-1-alvin@pqrs.dk>
In-Reply-To: <20220319145939.978087-1-alvin@pqrs.dk> ("Alvin
 =?utf-8?Q?=C5=A0ipraga=22's?=	message of "Sat, 19 Mar 2022 15:59:37 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fab82d32-a299-4f19-b28e-08da09b9dc5e
x-ms-traffictypediagnostic: PA4PR03MB6895:EE_
x-microsoft-antispam-prvs: <PA4PR03MB68955B4D9F85F19DFBE9E4F983149@PA4PR03MB6895.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Jn+vvffqCl84a+71MOQi3QQKzROD1bZr7KRyDY8/JpwcTUa12zmq6yEhpVdx+UAd7SeuTocJtvjd4oDIoUsr7aib7vXYOZx1dJLMEeWJRzgO/u+f+OvjnvK/7RD6V2Zd+C3GujhQkx5wq1qjSuEiMTzOnvjO4ieBrlwE4VVsDMKZcLQz5PNZ0HwbIH1dnCKQTKnl8MSEpIzxt8PX61qL/o4H507A0inXFcHe7kFrD+4uGlYBe6iXfQopJczdDrv6VK/DDzixOWtQ0fo5S6zMN4f+2u5QDUQC9ynilHKMhAgLr/5o55Dv3XUoOJlHdrP3Nabjw5+XdV1yJck4s8zLfB3QnQADnV7x/OpQasajyGs0B3838b8h32zAFpr/K1k6Rt+XT6fveY6KD96SQg2OSdoOzOEhFnWsjrmOVyQ7b964W/MhPYLNUDXGNeWQnvE1noE7Kc5GGY4aFDM2mtBvEzfq2F28eV7nSh29oPSqqF6B4tFf7/yLGPCyLWVKld3AWTtp6VYXLmjuVllE+/v0ZDm4bXaU7axofUXWE0xi/Wr+igbIlggN6RoI0NYj+c2Pgk5w76CpPWRTzS8Bjtwh5mZYWXlh0Ipmo0SLViCYxiCInJmLM8WmIL7s3R75YYnIxOE6X0Br7HxsCbAhhgRlGCStmvGCoCw0eUHKKhV/lTMuj+Njhya/VsCdEFgHSf6E+vAW5/zh4dYRXo3t8vhAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3943.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(186003)(122000001)(38100700002)(83380400001)(26005)(86362001)(4326008)(54906003)(2906002)(91956017)(76116006)(316002)(8676002)(66946007)(66476007)(66446008)(64756008)(66556008)(85202003)(7416002)(8936002)(8976002)(36756003)(5660300002)(85182001)(4744005)(508600001)(6506007)(2616005)(6512007)(71200400001)(6916009)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERidlpob1dTSFVMWDg1di9ZZ1lxS09PYlN6RzV5MXBLc2pWZGhJQjVxd254?=
 =?utf-8?B?R1RySDdTM1pXUW5CclZqUHBHTnlRMFp0cnFDNUhVajlmc1RrU2pBa0tIOFVt?=
 =?utf-8?B?QTlWelNxaTZwdDFWL0hVUU1tQ0YvQ3RVcW0zTzQ2eVkvYzRMTUZVQ2c4SFgx?=
 =?utf-8?B?R1RSaHl6L3kreU1rYVhZYWNQQkxyWmZScEpZcDJsVXJlOXJ2K00rR0RpWld3?=
 =?utf-8?B?NWptWEVXT1NSR0E4dFh2aUtWTHM5cElpa201V2xNZllMT1N2VHp4L1U0Ynpz?=
 =?utf-8?B?YlU4ZFV0dFBPdzZrNFJHOUpxeEpiU1E2bFpGSHU1TVdkQ3A4elJxUzRRN1B5?=
 =?utf-8?B?dkV3ZnBUUWp4UGMzdUE2bWdCODZIc3FIaW83R3FhaWJUTVNSRjB0M3lXeXh0?=
 =?utf-8?B?L2dYd2ExdkRxc1VvQmg2cWdLVzE5VGNFU3lnRzBrK1Y0anRHZjZxcStzS2V0?=
 =?utf-8?B?ejB5b0xvbU5hMURNWG1odkRGMUh4NlZKdldFd2JPby9MZi9rQ24rSmlxSXgx?=
 =?utf-8?B?VkNDMkNCYTZIK3lBa0lpM1VCa3VmVDExVUY5ZjZ4cXB2U0RIdXhUNytDSmRC?=
 =?utf-8?B?TGdBd0tJSlJYQXNsRkJtcENUT1lVZGhEQnNaTTZOeVRLdG1LY2RHc29haUc2?=
 =?utf-8?B?R3JnMmVaeFczWXhIelZENzVCWTZHT2xlWHI2Z1hkaDN0THFvMjl2STRVeEJq?=
 =?utf-8?B?RCtjamFCbkV5ekw0dVZQMks1TjRqRzZ1emJiNm92MzBSeHY5S1krZWdGMU5l?=
 =?utf-8?B?TDVUNGF6QTJrUks4VFdPVXlzay8ycDJra3hRVlRTS3JrVzk0dWoxTzEwakla?=
 =?utf-8?B?Um5nRmVDNzVnSm50clZaRVBSTGRXc0RDdXQvaTl4dHcxYndOMHY4azNYeWRJ?=
 =?utf-8?B?UTdQaVFNWE1kay9IK3h5aTRhMmRUeDh3WkdFbm1KdTNQL0J2MzZTc2NFb05F?=
 =?utf-8?B?SGNHS2dJU3UwZjh6QTg2VDY2Z3c0RlFzQjBMTHl4aXVabUdVbkh0VUV0VGZ2?=
 =?utf-8?B?U2tWMTJNUHpCekNPU3pnVUh2eDZTY2NVaWEzWklrS2FEclA4VzBMZzMybmox?=
 =?utf-8?B?emFmSXZlZTFReHd6NWNkRWk4ODlwY0hnMHN1ckVvbW14NVdjV2ZWV0c3SWww?=
 =?utf-8?B?dHBub2lsRjZ2a0xUZzNZQWFvVERiUzNLVEp3bWs3WjVIbWtlNGtyU1NFL1p1?=
 =?utf-8?B?TSt5ZHhvQm9VNEFmVHRvSXQ1OC9HS3VLd3RDTW9jbmErN2Y2QWdtV2FQT09T?=
 =?utf-8?B?LzNubzQrN3NGOCtCNlIrdExlMXVDMkszV2I4YU1ZTDdYbm5IVXZQbXV1a0d4?=
 =?utf-8?B?S1F3QWJsckg5WWFDMmdxTDNzOHFIV1p6T2ZZbUtycWsvUWZZYTBYNG9tS1lp?=
 =?utf-8?B?a3h6OFJxeGNmQmh1UGVRUE1TOGRtTHJnc241SWxVZ2lwT1c1UUhRdktNeDB0?=
 =?utf-8?B?WVB6TGs3MFNlNktQYkY1WTdvZm5sVVFXRnVMdjV2eWtzNU41dDU4MWROSmhR?=
 =?utf-8?B?OWg0N3dzZWV3cXVYdVBPZW1YbGhuMU1ESWNGTERnVmNISEJ3OXFNdVRJRkdQ?=
 =?utf-8?B?WDNuU29QMHNvazRsSGpwN2lBQm5zY3pnZkUxeWNVc2hrMi9SbHNlaDhlT1pD?=
 =?utf-8?B?RkI2c0VQY04xK3F3QUtQOWFkd3cyZG93SzlaeVA0b0cxdmtWaDIxYjQxV3hx?=
 =?utf-8?B?c0RGcSs5WHNMbDdid0dKbE1WOUVKUk40Zm13cGthSVJBOXkydndkNGhIajEz?=
 =?utf-8?B?QzVFSkoxUDY0bHdOc2pCTnY4Uk14VVFucmxndVJxb3ZxWGMrNk5hMW1hbm1T?=
 =?utf-8?B?b0xXZzV1ZGEyUk9paGluTGVaSVQ1TFBkd1B5Rk10N1dxK3ZiTjlWeU0rQ0tS?=
 =?utf-8?B?VWczRHRCQTN5Rkc4MWI5RHdNblhWSWlvRDkrR2MwSUw0bU9weHpoL3lrVFor?=
 =?utf-8?Q?JOBrCwTvxYjdWFivqklmLchOsfmiG+Tw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82FA79C35FA5224F8446E344E53459DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab82d32-a299-4f19-b28e-08da09b9dc5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2022 15:05:09.6202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCDtFG0v1AfAXDsO1OdoRepOG+PPBueHQIXulwUlYlNHg50IHtQKxivDaUno3oiOtF5O8HEB1Fd6ZGPoP9p16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6895
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWx2aW4gxaBpcHJhZ2EgPGFsdmluQHBxcnMuZGs+IHdyaXRlczoNCg0KPiBGcm9tOiBBbHZpbiDF
oGlwcmFnYSA8YWxzaUBiYW5nLW9sdWZzZW4uZGs+DQo+DQo+IFRoZSBwYXRjaGVzIGFyZSBzZW50
IGFnYWluc3QgZHJtLW1pc2MtbmV4dC4gVGhhbmtzIQ0KDQpXaG9vcHMsIEkgbWVhbnQgZHJtLW1p
c2MtZml4ZXMsIHNpbmNlIHRoZXNlIGFyZSBmaXhlcy4gOi0pDQoNClNlcGFyYXRlIHBhdGNoZXMg
YWltZWQgYXQgZHJtLW1pc2MtbmV4dCBpbmNvbWluZy4NCg0KPg0KPiBBbHZpbiDFoGlwcmFnYSAo
Mik6DQo+ICAgZHJtOiBicmlkZ2U6IGFkdjc1MTE6IGZpeCBDRUMgcG93ZXIgZG93biBjb250cm9s
IHJlZ2lzdGVyIG9mZnNldA0KPiAgIGRybTogYnJpZGdlOiBhZHY3NTExOiB1bnJlZ2lzdGVyIGNl
YyBpMmMgZGV2aWNlIGFmdGVyIGNlYyBhZGFwdGVyDQo+DQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMS5oICAgICB8IDUgKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2NlYy5jIHwgNCArKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyB8IDUgKystLS0NCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ==
