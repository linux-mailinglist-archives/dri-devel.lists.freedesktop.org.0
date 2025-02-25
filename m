Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03548A44724
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A21C10E74A;
	Tue, 25 Feb 2025 17:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="mLpk/US7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2133.outbound.protection.outlook.com [40.107.249.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A2C10E667
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 12:24:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBqUMYwgidIaxsaiBbXS9BWf/Qs/RqiQr9CZ8ktkwqKNVPfAdYILVV9ejOEScu/eClPqhymI2sYLg6TsJ4+wvzobxjMFdRrjRO30VpM+PwhsmqXkyZQI42sqeYdan5x5OY77QnF4eM8QbR0zvT+dMQSxXgQqnSCWY+gaAD8LCYMIjcgHvDE6Vfw3v6buVBJ2C9lfgBLg0BPV5aigsdW9B9Q1LgQMupgtd2xMcvQLe9BX/NGFIkF6H3M1tDy24nWn/PlNW8IIndR7Djv7Lq2a5KlRbNoVgIL4/6b0vErTqX4/3C7mDjC3xJo02g7EBttRGK7qlKTnic+TJwGOB88KwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7weKjZz+ZHmIw4XnMzEwDLnpTVSDWqySPUaclt6rME=;
 b=VluapiWOF0rCuwsIvf/sHZVsVHyRoaUwIPWw4t/rYolNEyqcqTIrp4OTTPxN4D4OcpoPQ3Istk0Nl8OIGgxEYJj0XkYsgv/t/vjuezTnd1FqC1ayGzF+ppUY0A9p9fx0Nedqb9/VHCHrPjRRnC22J8hA7MHsdiS9w3yjCAJU7t+S3b33WrR4xC1ro5D0/mkGUR+J78Qn0mu4J9E506tIUTw7lA/7Y9860ScZAbjPOyGdHCIHYgz/f6q6QXKDBtKtvFZT6I4+v1bphbgsGkHUBVm4Knb5Ou6yXB8fHpBchb2f4lDPBllX7NGnyf3hsyxelSwEHguNrmyL/oe+rRRD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7weKjZz+ZHmIw4XnMzEwDLnpTVSDWqySPUaclt6rME=;
 b=mLpk/US7Gdnbr3RTP298WWttKFoyuREH3tTxA1AtGPvgG2m6THeTTf2Ak53BQzsEygGs/Bv77fejyhBPe0nQP7yOQxt51TYqrvBqtgjH8duRtksrvIYzOzI1ULIUMZIJ/TkOFJcl84MoLcSOgTAz3YaxbjW+oD5f3zgkTDfFfxTX5pMyAbKWsTWA99bdGEBmxsnBRqkO/D8h2tZ901SwqRRPf1ZpKbXF7afbg5MrVlKGMNdZH631j6yhruPHkKaP4qdM9DuTwIqzfyBXxaQ+s9Gop+n8Fk1A2RFEiMz8GkW6R8UK2xhTiysSltjKFmCSxbEVPI4CbR8cOo5Xh+5Aqg==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by VI0PR04MB10784.eurprd04.prod.outlook.com (2603:10a6:800:266::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 12:24:09 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 12:24:09 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Thread-Topic: [PATCH 05/14] dt-bindings: trivial-devices: add GOcontroll
 Moduline IO modules
Thread-Index: AQHbhsMosk0/ripJzU6HkH3zRHdpDrNW7EQAgACtnhWAAFAuAIAABT4Z
Date: Tue, 25 Feb 2025 12:24:09 +0000
Message-ID: <PA4PR04MB76306D77C93FF2C51524BD95C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-5-5ccbbf613543@gocontroll.com>
 <20250224204428.GA4050751-robh@kernel.org>
 <PA4PR04MB763009E88F6406CD84ACBD33C5C32@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <20250225-smart-industrious-groundhog-41deb2@krzk-bin>
In-Reply-To: <20250225-smart-industrious-groundhog-41deb2@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|VI0PR04MB10784:EE_
x-ms-office365-filtering-correlation-id: fec05d91-8d6e-4128-3ca3-08dd55974ddb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?z6JpjhtmQvVZRjCMxgcH2NzT7A0DW9k5PTql1yUoIA01yHHKbXfZpb3UY7?=
 =?iso-8859-1?Q?+AWc+4bSZZ4OM4fsxdUzBnKPqs0zG+DsySeFVZedllOIH0+lKFynMopSJ2?=
 =?iso-8859-1?Q?BaBoparlBIyq9KMLGL6jZIMz4hYgxU9ZAjpgMX9W/Sd4K/kbIp6raDNtcI?=
 =?iso-8859-1?Q?U8THooCNLNrE8+TJwiSzkaDylaiv6t/Uv0brquZvmdSxG+ak0wTbTXGVlp?=
 =?iso-8859-1?Q?8pUmnlTHzZgbfEEnBwmXEIeR+f4PcrRfpfuCH778nEMxmT5bwONb2zK37B?=
 =?iso-8859-1?Q?0WrgiH8pyW75QLkWdGYhj8PDVrHtMqcmfM/1k2nnDu7V042orBn1H3Yr/l?=
 =?iso-8859-1?Q?LJEI0UiiAhufkQSG256g4vr79lF7q58l9UPHSJVxEWpNSmtWF/n5AelevF?=
 =?iso-8859-1?Q?Jq/KWnEFsnANhFkrM6gAi88/nmQ/YWyrNyY/XLQToT6+d3V4evaMZb3rjU?=
 =?iso-8859-1?Q?4R5kt6LVDPPbHmkEODk5tiE5eAxhU6i0zRS96Gu62mhX2I64tLLl6rsyjz?=
 =?iso-8859-1?Q?cvi03c9J692UuPIo0FJGPnMvyl4ocAqS0281mUhkZ+8pZpGgeSq6env2Af?=
 =?iso-8859-1?Q?cbP/g5Vgsu39HLyAgRkv8GFSa+VEB9Cdn1glOuTe/vjDI41E6GMIJyJjBz?=
 =?iso-8859-1?Q?pcyX5AzyG72OHQ5C2Jn7xIMfu5wHNsXFenE1AWCJThkCkbkzWYZwSAU1Cj?=
 =?iso-8859-1?Q?5hxiuaIh5pwyvOMw6acy1O4zlGZW8qhE4ZGtRijndg5ug1p1Y+Gok49LVJ?=
 =?iso-8859-1?Q?kdZQcXGVLW1yuHsvSSDKgRDj5klIA+u/IziV7hCqw8b+5F7b1Ga3ksPwU3?=
 =?iso-8859-1?Q?9GyfS/m9jX5vm6R2ty33eXb3GeAwgqjF3YwODyefBquAbU1i8y71CSUe1u?=
 =?iso-8859-1?Q?8qPREyOC9ZelOil/b1nOKAv/mU6wpJU4J0JyjI7gtt/kuAM7XbJKTQPbFK?=
 =?iso-8859-1?Q?M3SwRQxpDSoOvtbLVFV97r3t9KCyrINh4bgXce2KudU7X7XWD02g0n4mKx?=
 =?iso-8859-1?Q?gzTnRt+8pGcoOGnVKOHWEYCOBtqZRjbQoQTX/9czPq9NYxKE/soKGbsy0y?=
 =?iso-8859-1?Q?l1kLc4lFgJ64OAUIxWNwliUs3I1+k5HPsaxsdNDb0iYY3yg9FwIx01KsqT?=
 =?iso-8859-1?Q?11oUYXNgeDaDYVCAvpnCQPvhABd2MWV6/6A/pAKbnN2s1PsVRd0V9MtsYo?=
 =?iso-8859-1?Q?ZDLpHdQ8761s+RNUiNC39sw7vKvWdVn6tJntzAGHeg/t7s0AuyHnmjUky3?=
 =?iso-8859-1?Q?KRWymHQ2e13sEg93i3MFzdBKzB1wtCrZ9SXTLJINKH6erFrvCpl5tQ8PXA?=
 =?iso-8859-1?Q?rbL9VoRsT2zWTsJCgCUaME1IjcprpnV4UPsdL7gIdxjj9lgzjnReS5hmWA?=
 =?iso-8859-1?Q?YLWaOs1Uv1BZHs2ffTVjK4+QUqTdLgq22kb+ViBStWsCi11v3kk1MdbEh/?=
 =?iso-8859-1?Q?q3PpcwwhZ9KMgwz0zOfhgWQFMoHG7H2ZLM1ZTD2nBK3qer5PGCfZTBSW7q?=
 =?iso-8859-1?Q?TolcvNI5nc1A6CrfudpSDy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JWhKC3yf/S9xKaWKgySku0xjjqXa3fK8l09pYa++5YvYzBMYzZIwnE8/vK?=
 =?iso-8859-1?Q?S64vvtT1Hn3crK2NibkPdhbQYlPs30SZnWmAjwKnW+Lxd5E7tFBYTKk2tA?=
 =?iso-8859-1?Q?JEm/phBMvxhcH79IvoFEfpA325BfxQ8yG4Kdo+GQdKxxGbGMLGvZIClpNj?=
 =?iso-8859-1?Q?/EYPBoY9mD6l1Ms71BjsO+QWZu8YiNcASJjlqSmPw05emXMFNr0IIj+1ud?=
 =?iso-8859-1?Q?kqTQPspGjgmB4sgVQjOepj6lE4szdh9kSPcCmiha+/qk6MuNo0EnJMpXZT?=
 =?iso-8859-1?Q?oRbtMN8Thlvx8zWtDmoOk63Epns8dlml/UZnwf585nmvdUAe4nNREMVh5w?=
 =?iso-8859-1?Q?mLt9bsJ/oBoPs6DvRAsUQds0yslmnLYEeIOgvW2KR+zKBAYnOZpq0ttHJl?=
 =?iso-8859-1?Q?6ITj1G3S5vD+DfnScknENAQZAUQa7Tvigr68Z6MgfChPBv8/2Ded/CQXyK?=
 =?iso-8859-1?Q?RhwVGFHCIEUW426fMqKKZj8NJwByxtokXsFnxkTLAqoAptVVi17CEXDpjy?=
 =?iso-8859-1?Q?b7Pxr5ay9RO+7WbOOxnxF5ROtPB5UIVZEjFGkY7V+PScvwC9C2XHmtXgHS?=
 =?iso-8859-1?Q?CjNCaAxNwsTpnl6HCpD5Qt7eLkS/ushwVdJzryc3+iASGI1uq2P/eAhaAi?=
 =?iso-8859-1?Q?WeQ26crD53cRbg7tr3sIDacjWNuQB+xdLWYpj81bwh3Bxmg8pq79vTMC7K?=
 =?iso-8859-1?Q?BTIo3FuKISRHeeHqMrtRrSruG7lLWTBXkNTt01LUzXfmCZ0OTmIX0qHv3N?=
 =?iso-8859-1?Q?9yTj2Cw1c56ZFQDZzDJWEzEbrhXqxaPwIEQf9h456GXcj8FUBcA9sMorRc?=
 =?iso-8859-1?Q?Iw4EuxWMQCs8GQ7c3yfDSUOA+wytqD8H+JjvPQwfSI855wX1ueFyDQatDg?=
 =?iso-8859-1?Q?PbMF01ZOJp1BR+jEgJa4MoYAjygZGaa3RFIrDQ8ZuDN0meYpy2ARKm2f7R?=
 =?iso-8859-1?Q?TVyHYlofK/P5KtO4t2ZFcShQp1SqGqbHc8Pno+vQCDHYP+irBcTqg5/04u?=
 =?iso-8859-1?Q?dqAALuUsTvjLHgJbALO7/36nATeRXSsxTVk21uzUJHCcasW0V2wvtEil1H?=
 =?iso-8859-1?Q?+pwBaZ8RkZQPbwnr/vcMB6BOCJmQY0eXWwzl3JEWkb/qI295Wu3jNs6o0K?=
 =?iso-8859-1?Q?tcZCnqfnuM3GIvjsQM1jLKRqa6EIb2VRV9JW74VD/h7gPVe5XdfiiWttJW?=
 =?iso-8859-1?Q?e/tYQQ/Q2CbvPE1knXrJr2fPzsd0xkBtGPtcfi0sr/dyOQkGy1M6MGN2YF?=
 =?iso-8859-1?Q?CwZ048+z7HDbhK0dhO6/Uz8Q80cou9crS+Xple/RjPDzRDD2BrpO0jPkZg?=
 =?iso-8859-1?Q?CHHv01hhoCPQ58D88ObxY1DCbXfAVIZyTni4tiiU5/cS1KwW0iWP6ZkTzB?=
 =?iso-8859-1?Q?U6ij5+wmm4kv0Y/UZGoCyYVeBy55G3GRY5k1e03jDmsmhjVqBKmiUhj4ev?=
 =?iso-8859-1?Q?hkTWmNUjMAXkPJI1Ku3FAHXqv1tPnucRJz55hxFpzi+eaj+IaOtfNaQpqV?=
 =?iso-8859-1?Q?CQV33NJTpWMa6CM1lbbgbTB9DfNVJ/AfO9FkZQNu8FgWhjhy6O2dBuzWl7?=
 =?iso-8859-1?Q?IgQqNOxkmaw/E8/7fyAOXxZ7DmXhlNbHf6SYAcxjywyTZldE63mlSQN9za?=
 =?iso-8859-1?Q?8FIzs868C0IpZ0UUSl/9yc/CpiJShodMFTwwexSvlbeK8D+EPYjgUcxl+o?=
 =?iso-8859-1?Q?FdyWyhFFqrPMRsFk0QdqOC/X956f8eNNaUQo6wIvAaBa3p8errYdpUlXMg?=
 =?iso-8859-1?Q?zMwQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec05d91-8d6e-4128-3ca3-08dd55974ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 12:24:09.0995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtmDnLrkqNqTXZiEyYhjqVi/G5RKv2F3oCTmOG2EGENM6b1qXGPWiWlbKc08C/adfYQYpfL+BaBz5Y7ccWlxZDtsZ2G4+Ks6qto0Ab69ekU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10784
X-Mailman-Approved-At: Tue, 25 Feb 2025 17:00:13 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent:=A0Tuesday, February 25, 2025 12:52 PM=0A=
=A0=0A=
>On Tue, Feb 25, 2025 at 07:39:52AM +0000, Maud Spierings | GOcontroll wrot=
e:=0A=
>> From:=A0Rob Herring <robh@kernel.org>=0A=
>> Sent:=A0Monday, February 24, 2025 9:44 PM=0A=
>> =A0=0A=
>> >On Mon, Feb 24, 2025 at 02:50:55PM +0100, Maud Spierings wrote:=0A=
>> >> The main point of the Moduline series of embedded controllers is its=
=0A=
>> >> ecosystem of IO modules, these currently are operated through the spi=
dev=0A=
>> >> interface. Ideally there will be a full dedicated driver in the futur=
e.=0A=
>> >>=0A=
>> >> Add the gocontroll moduline-module-slot device to enable the required=
=0A=
>> >> spidev interface.=0A=
>> >>=0A=
>> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> >> ---=0A=
>> >>=A0 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++=0A=
>> >>=A0 1 file changed, 2 insertions(+)=0A=
>> >>=0A=
>> >> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b=
/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> >> index 8255bb590c0cc619d15b27dcbfd3aa85389c0a54..24ba810f91b73efdc615c=
7fb46f771a300926f05 100644=0A=
>> >> --- a/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> >> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml=0A=
>> >> @@ -107,6 +107,8 @@ properties:=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - fsl,mpl3115=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # MPR121: Proximity Capacitive=
 Touch Sensor Controller=0A=
>> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - fsl,mpr121=0A=
>> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # GOcontroll Moduline module slot =
for spi based IO modules=0A=
>> >=0A=
>> >I couldn't find anything about SPI for GOcontroll Moduline. Can you=0A=
>> >point me to what this hardware looks like. Based on what I did find,=0A=
>> >this seems incomplete and not likely a trivial device.=0A=
>>=0A=
>> I'll give some more details, if there is a v2 of this patch I will also=
=0A=
>> add more information in the commit message.=0A=
>>=0A=
>> The module slots have a number of pins, a lot of them currently unused a=
s=0A=
>> they have not found a function yet, this is very much still a developing=
=0A=
>> product. The currently used interfaces to the SoC are:=0A=
>> 1. SPI bus as a spidev to ease developing new modules and quickly=0A=
>> integrate them. This is the main communication interface for control and=
=0A=
>> firmware updates.=0A=
>> 2. A reset pin, this is/was driven with the gpio-led driver but I doubt=
=0A=
>> that would get accepted upstream so I intend to switch to the much bette=
r=0A=
>> suited libgpio.=0A=
>=0A=
>reset-gpios is not in trivial devices, so that's already a hint you=0A=
>cannot use this binding.=0A=
>=0A=
>> 3. An interrupt pin, this is currently only used in the firmware update=
=0A=
>> utility [2] to speed up the update process. Other communication is done =
at=0A=
>> a regular interval.=0A=
>>=0A=
>> What is unused:=0A=
>> 1. A potentially multi-master i2c bus between all the module slots and=
=0A=
>> the SoC=0A=
>> 2. An SMBus alert line is shared between the modules, but not the SoC.=
=0A=
>> 3. A shared line designated as a clock line, intended to in the future=
=0A=
>> aid with synchronizing modules to each other for time critical control.=
=0A=
>>=0A=
>> current software that is used to work with the modules can be found at=
=0A=
>> [2] and [3], one of them is a Node-RED module the other is a blockset fo=
r=0A=
>> Matlab/Simulink generated code.=0A=
>>=0A=
>> If you know a better way I could describe this in the devicetree then I=
=0A=
>=0A=
>You need dedicated binding where you describe entire device, entire=0A=
>hardware, not what your driver supports in current release.=0A=
=0A=
I see now that I also forgot the patch that adds this compatible to the=0A=
spidev driver. Didn't check for the spidevs in testing I guess.=0A=
=0A=
Could I write bindings for this device, and then add the compatible to the=
=0A=
spidev driver for now? So it probes that driver, and then later when there=
=0A=
is a driver remove the compatible there and keep it only in the purpose=0A=
built driver?=0A=
=0A=
So I'll write gocontroll,moduline-module-slot.yaml, don't quite know where=
=0A=
that would go. Define all these attributes in there and then add the =0A=
compatible to drivers/spi/spidev.c=0A=
=0A=
Is that okay?=0A=
=0A=
Kind regards,=0A=
Maud=0A=
