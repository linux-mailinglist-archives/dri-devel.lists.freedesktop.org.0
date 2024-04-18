Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F948A934E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 08:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0477010FB0F;
	Thu, 18 Apr 2024 06:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="yiFHHhkZ";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="A/6B91Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F439113A3F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 06:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713422574; x=1744958574;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pkDd6yPx7DVJ7Sqyw11OCGMdgazBQh4jsBBCkMkO3V0=;
 b=yiFHHhkZ0XJDeBpoZ6QiSGV9N7zSZX/rXHxZDrtBlrWKJQOez3ZHZw+O
 +X0UpxZFDWVSPvvUD8Vt4GCxk/an1GsJwT2fpk06llsaM0GMm9C+yMC0Y
 vgnc8yCL+vtyCtWilv+4VN+VfCAf5SS2QEQcmmPWpKfSn/jy2UjUmg0jV
 t0wM3rANJeARO+lLgxNk5DObOi/QZcdhLkAxA22ttuUu2/xnFb6czxWvJ
 9Cy3+gogZab+rQAV1V2SqzkmeBpM9qXne7U4pPwnZTNhqNhRvjmxicZku
 SuO5BhRnVKPwWSvfJg5kKWilShZvHJLqsJ1vQeYk/Gv8xVFKT+QzeH8qL A==;
X-CSE-ConnectionGUID: BiGsHno1Q7aQ0rMjqdAKrw==
X-CSE-MsgGUID: RJeZ6Y30SKqR4tSHjR1RfA==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; d="scan'208";a="23578511"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2024 23:42:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 23:42:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 23:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMmPvLslH9Ah7WLBa7EFvKb3BZ1jNajCdNwVFe6f/GBEJ4WVrpJxteMvk6Tf2BZxBpwROtEWZMRfwvnGcld3uqzIypp2ioTyDnPSE2TlVxHoSurKoS+ejQZ65mqwtyaGgjfFiXPHzmliDQaM03q6seDbT8OGwO6VMkmC6IOnzKtmdPQ6gLKw0tWLZVZPJhOuJlLkOUK4KgUFQONnU8QZKER+saXtixRoOq47CsVVj0i3/izkacFl/dqly6BX8fVZM25moN90RGL9Kqgg9l0p7X8S47WvsdEeaGaQpBvAr3wg1Pop2mxrHH5Js50n2DWLckp+/odmk8rluLzByvtFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkDd6yPx7DVJ7Sqyw11OCGMdgazBQh4jsBBCkMkO3V0=;
 b=PaNcs0xzOPicFTUkNhn29El7bHVFX/wfAjS0u2LaUu9qz6ONenTYtNvyC1Ud2F2wGMkWSx7KqsLYqN5Y9I2mxZfkSJ3QrPY39A+IMNCPzKN+gFgf4VdnbYQV9LLZbYbQfaVWUYOVqKE6s1MnoChUoUBOOt/YTTo8meUtTi92ZdGHd+zNPRQoPXZZx2VJZxnpnbfFO1wF46MuU5S58cTcug/U+PJysbn2g4okodMmaJSgPExdFBHZOoQb5iZupDPTpNp02aDVoDfbbLkojRW0OS1VeXs4oFLFn/vT49PJtIscYRKnCNr655Z1d2+yKV6YXhwV2gCXcdVlITCRS6eEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkDd6yPx7DVJ7Sqyw11OCGMdgazBQh4jsBBCkMkO3V0=;
 b=A/6B91LsR953p/zCPY5VEyxF016+dZM363jfjPxJlR/zylh4ScHSGJoxtiGAbK0LxkjuUc2NlGQoW6f78R4YU8CnWMhjiNdrbt50YEN3Y1CEsQtB+H5JWegd7w6zAWhWz6ys5F2MTopQ+I+QwDFQ3Nl2pvX4Zb9O61maq0ah1mYqPSAIaZX9lSwdBCd9nEhXyK8dukzjBCn1AkIHNrvPCF+VsslqeF6oLgUISUVia03AzebHeRCahESVL9BomwXHwOJXrBN2zKhOdc2feiTb2HUqTwmpc14jpzpGImaYHN5JfU1LuFbLVB+vLCEiLu1M//7Op4YijkfAxVwd8zJmpQ==
Received: from BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 06:42:22 +0000
Received: from BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::da31:bf91:c3ff:92a1]) by BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::da31:bf91:c3ff:92a1%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 06:42:21 +0000
From: <Dharma.B@microchip.com>
To: <dmitry.baryshkov@linaro.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>, <arnd@arndb.de>,
 <geert+renesas@glider.be>, <Jason@zx2c4.com>, <mpe@ellerman.id.au>,
 <gerg@linux-m68k.org>, <rdunlap@infradead.org>, <vbabka@suse.cz>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
 <Hari.PrasathGE@microchip.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: add lvds controller support for sam9x7
Thread-Topic: [PATCH v6 2/4] drm/bridge: add lvds controller support for sam9x7
Thread-Index: AQHakHDs0C/XrR4T2UWJXUnTkUvbELFsAeEAgAFlfwCAACo5gIAABJEA
Date: Thu, 18 Apr 2024 06:42:21 +0000
Message-ID: <8674f828-1830-4900-b009-9d8ac31763b2@microchip.com>
References: <20240417024137.144727-1-dharma.b@microchip.com>
 <20240417024137.144727-3-dharma.b@microchip.com>
 <xbefyxiyiwckjsi5wyqaf5thqgpyyizy7sjojed4yc7bvm46l3@omffdudkxyhl>
 <f79861d1-2216-41de-8093-621cb07ba06a@microchip.com>
 <ymw3bsbpqdfhwnidkvkenbv73fxdk3okuiqsmltknpnlzuwges@dqevpe6okpk4>
In-Reply-To: <ymw3bsbpqdfhwnidkvkenbv73fxdk3okuiqsmltknpnlzuwges@dqevpe6okpk4>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6436:EE_|MN2PR11MB4695:EE_
x-ms-office365-filtering-correlation-id: 15137275-fd64-4fd9-ca99-08dc5f72b34f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IRJeKfFiXM5FxkLKCPZ7R7mkG932lVqMmPt2d7tReIw0xKoTqyXfSGiHGahQUzm2Cw6v5igNlOTAtyCizysDDWDv3Z56W8yiPf8FFcs86CWKb0z/K98krE5zILfTLbILM2/Q9DzVYgQIXadi4OdQpsd7bSz0QssSAJP5DL2mUJqIh6dB2aPKxS25ivaoFGNK3zUFzYUk1Kr4xOsl5lRNjkVVoUEGxtejqjrKD+TE+UYPUMQ97rsMDE/dsu011gr2GcgzeYLgyyFkdNU2DMTpfXBwXvK7Mu8ZqDlPko2NYenwsp7BQiIfqd9wI+sLkA1l8dOsDukJTHgrmf75+BVevA9Y1ORmw2rM+jslqtV9dAQMIhoieuZmxKz08XA/S7h9oYGASsIqp4bEu1c4wVC5/uvktAMFbAR82XRRbACZhLys5cQKiC2qe7i9qt8Zyc4TAQx+vNE00PFEH7XQaWsCpvAjRgLW+8UMQxyJ4Ow727dDgDX0ectnHN1alHHn/vWiU3iXjBzs8LreKIMozr6biJeDZyh8NoZ5tv2FEXQQ5u7444S/aVXMP8NWI2YlBm+EcpYwTNq3n4xGVynEPhCK6A7Ud8O76Y/8b6L+tzyvT9XPbFIQJwtOTu9/AlfQbh0IL58IQBmgdZ+umIBdlBzGPod+qy5auCQURZzYXEQqJv0s8qTkDGdLoQwibHe/DLP6+Dz9BF1ktgLLO3SccDXfqSsD0ipFCUWB/DFkBfcsz2s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6436.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTVvakFZSFBUM011NnNpU1F5dUdQbjFKZ25zS09vRWV5YUhCRFp2c0hNKzlJ?=
 =?utf-8?B?TC9KSkxIS3kraXFTcis2ZXVOV2w4SFFyY09LeU0zU21yT3RNMWpVQUVxYjQy?=
 =?utf-8?B?UW1CeTJQMys0RGFKTmdaWkI0TWhpanlwV1AwTUxOc3F5N1A4TGNOc0p6TGwr?=
 =?utf-8?B?TzYxSlMzSHI1d2I1YzVNNStSN1RZZXFTWVN3MUllODJKMVdzeFBHZEdDdzJ5?=
 =?utf-8?B?Q2lkT2kzMm5YZVZJcE8yRzFTMitLeU8vejJ5UEVxWVFHdzF1cThKb2cyOVh3?=
 =?utf-8?B?SmxHR3paUUV6N2dMZk5zQ1lMaEF2ZzREaTBWakwwUVduVFZUbklVaVdBd1Mr?=
 =?utf-8?B?VTVrY3czL0JjdVAyaC9tYWcycklsTU5oVlN3bnZIbzZiN3ZlR3RyTldiZi9j?=
 =?utf-8?B?T0lILy9pT0p6eXpNeWFPYTJITFlUUDlGZGt2ZTFqS2VGSHIrR3A4bzN2dEtL?=
 =?utf-8?B?NHptYkY3NTQ5RXF0RC9HRVZacGxqTC9US3pjTmo4K3QrSGRXREE5eHJwc09V?=
 =?utf-8?B?Vys3a3lqRk95M3lXTVhnWVhSbldjRWh0YnlIaDJ1MGR0K2ZXTXg4by9PVGZN?=
 =?utf-8?B?L0p5dUhzQUVvWVJlMWU5ZUZ0eTdTUXNGRy9KWE90NkUxS1gxS1hIVHhZUXRt?=
 =?utf-8?B?K2U1N1c0ZFQ1cmk4c3R2dU1DUVMyc0ZiSWYraTZhN3QweEhEc09jMTc5Z21n?=
 =?utf-8?B?R0tkUFA3V0Q3b281U0RrZE0vaUhvQkp3TXR0T0ZPNnd6MWZUN2I0N0xNTlhM?=
 =?utf-8?B?N29qcmpYVjZ5aXRncVg5RjAvZk54cm1JZVkwWE9hWFhmcDRHeTNVZXBRRHZv?=
 =?utf-8?B?UFZmRkpNRUxNbjhkVHVsdGwvRjZsZTNyZE9TRS9QTG4rUGQvSWN5ZE5jekZx?=
 =?utf-8?B?WEFnYksvUWRNUUk1USt3bEhQa3Yyd2w4VkxHZUFQMGwrc0lOUWFkNkpuZml3?=
 =?utf-8?B?M2tVUUNuNWxKVWMyTEEvYXNPVG1KbEJEZXczbVVlalRzQi9nUTVIT3JiQ1A3?=
 =?utf-8?B?MGx5ZHVVeXRQOWk5VXB1N25kOXVGdXpiQ1FTZUs4bXRIUUZhbDBoM0pYRHFy?=
 =?utf-8?B?SGI0RHJUOE9zcThKdEFDOHNmMzZVYVlGME1hdk5hY3pPd1FuVHlQVFZXY0dL?=
 =?utf-8?B?QldoR2pSbVBqZDQrYkVvdzR6SW4vdFZENWhXM2FSOGt4U1BFait3QUlURzFN?=
 =?utf-8?B?S1pITkFIK2JpSUk5WjBIS2lsTzFzQngxV0ZuNjRBak0xV2tBOTVpRUdZVVFI?=
 =?utf-8?B?UXpEUHFYZGFVWnBIV2ZMMkNVa3pGOW1HdEJGSEhrY2k3eE94dXdoaVJUMkth?=
 =?utf-8?B?OGhUQ0tCTEU4bm42dXA1Tk5adHBPajRsVlJZM1V4L2d1UXViMTgyNlovQkov?=
 =?utf-8?B?ZDNqOWcrVkt6czlTZVJTWWUwcCtOK2dEVUZHMUpNYldxU3dzUDVQRmNaZk4z?=
 =?utf-8?B?b2VEcnFBM0xnVTRLQWx4d25jUnBTaFA0bXNONmZQSWRYeTNVZ0RvNTAwWjZE?=
 =?utf-8?B?dmdkTnNPZTQxQmtxK2QvTlFSakp4TWZiNS9WTXVGY0t3ZGRLd3RWa1hyeFJv?=
 =?utf-8?B?RDlLbWZ2cmdPZ1BCd095RVRjU0ttdnZ5VDVDM1JSWjZ4TXNLdTEvaFFLUVhs?=
 =?utf-8?B?UmRaMy9nSW0zNHQxNmxoNEhld3o2Rkg3c0dHMHV0TURMZE9QOCt6SXVHaTNL?=
 =?utf-8?B?REZrSFM0OHVHSnpNRkhYaEhQMlZGTC85TFNSRHhiWWVOZ0liV1drKzBOQTlw?=
 =?utf-8?B?bTJzUXhLR21LOXRVbmlEQzVwR1A3MFFDWFZnUGNESEVZQzRSUUVyeHJTakJn?=
 =?utf-8?B?QkpidmhTbHc0OG9ScWMrai91UVpYSm1NV1YwSGMvbVF2NkU3N0I4dmxYaHBL?=
 =?utf-8?B?eXNzVENTQ0pTdy9heHhQQXNFY2l5SVlGdmtFWE5taVZMWHJTNTFENXZUcDBF?=
 =?utf-8?B?UFFoOHQ2VDlZUi92bGd4WXFIb0NieE5CL3VEbi9EQTRzWFFrcFBTbHNBQm5V?=
 =?utf-8?B?QTRQZU94VzNIVXFzN3JicTBHdjFvZUlmOVB0dnlpbUlMVDJwd1prcmxYOS9K?=
 =?utf-8?B?djkwZXV2ekEyNDBSbm4valRjNlAyV2RWYWQwSzFnYzN0bTBrQnFQWTczWU5M?=
 =?utf-8?Q?9PD7XqB8L5DY1vaMSf9cYlmR/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49F2E0C14F0A584880B3FBAEA0C1078C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15137275-fd64-4fd9-ca99-08dc5f72b34f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 06:42:21.9006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGwvyf3kU3W1gl4OXrRSWk0qQSaq0EAilYk1ONiDk/rYoWNSsNi46RIo3+EtZjXtEobbgG5yNMWoKPAV8CeYwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

T24gMTgvMDQvMjQgMTE6NTUgYW0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQg
MDM6NTQ6NTNBTSArMDAwMCwgRGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEhpIERt
aXRyeSwNCj4+DQo+PiBPbiAxNy8wNC8yNCAxMjowNSBwbSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90
ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIFdl
ZCwgQXByIDE3LCAyMDI0IGF0IDA4OjExOjM1QU0gKzA1MzAsIERoYXJtYSBCYWxhc3ViaXJhbWFu
aSB3cm90ZToNCj4+Pj4gQWRkIGEgbmV3IExWRFMgY29udHJvbGxlciBkcml2ZXIgZm9yIHNhbTl4
NyB3aGljaCBkb2VzIHRoZSBmb2xsb3dpbmc6DQo+Pj4+IC0gUHJlcGFyZXMgYW5kIGVuYWJsZXMg
dGhlIExWRFMgUGVyaXBoZXJhbCBjbG9jaw0KPj4+PiAtIERlZmluZXMgaXRzIGNvbm5lY3RvciB0
eXBlIGFzIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTIGFuZCBhZGRzIGl0c2VsZg0KPj4+PiB0byB0
aGUgZ2xvYmFsIGJyaWRnZSBsaXN0Lg0KPj4+PiAtIElkZW50aWZpZXMgaXRzIG91dHB1dCBlbmRw
b2ludCBhcyBwYW5lbCBhbmQgYWRkcyBpdCB0byB0aGUgZW5jb2Rlcg0KPj4+PiBkaXNwbGF5IHBp
cGVsaW5lDQo+Pj4+IC0gRW5hYmxlcyB0aGUgTFZEUyBzZXJpYWxpemVyDQo+Pj4+DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9j
aGlwLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFy
bWEuYkBtaWNyb2NoaXAuY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2hhbmdlbG9nDQo+Pj4+IHY1IC0+
IHY2DQo+Pj4+IC0gTm8gQ2hhbmdlcy4NCj4+Pj4gdjQgLT4gdjUNCj4+Pj4gLSBEcm9wIHRoZSB1
bnVzZWQgdmFyaWFibGUgJ2Zvcm1hdCcuDQo+Pj4+IC0gVXNlIERSTSB3cmFwcGVyIGZvciBkZXZf
ZXJyKCkgdG8gbWFpbnRhaW4gdW5pZm9ybWl0eS4NCj4+Pj4gLSByZXR1cm4gLUVOT0RFViBpbnN0
ZWFkIG9mIC1FSU5WQUwgdG8gbWFpbnRhaW4gY29uc2lzdGVuY3kgd2l0aCBvdGhlciBEUk0NCj4+
Pj4gICAgIGJyaWRnZSBkcml2ZXJzLg0KPj4+PiB2MyAtPiB2NA0KPj4+PiAtIE5vIGNoYW5nZXMu
DQo+Pj4+IHYyIC0+djMNCj4+Pj4gLSBDb3JyZWN0IFR5cG8gZXJyb3IgInNlcmlhbGl6ZXIiLg0K
Pj4+PiAtIENvbnNvbGlkYXRlIGdldCgpIGFuZCBwcmVwYXJlKCkgZnVuY3Rpb25zIGFuZCB1c2Ug
ZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKCkuDQo+Pj4+IC0gUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAn
cmV0JyBpbiBwcm9iZSgpLg0KPj4+PiAtIFVzZSBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkgYW5k
IGRyb3AgdGhlIG1jaHBfbHZkc19yZW1vdmUoKS4NCj4+Pj4gdjEgLT4gdjINCj4+Pj4gLSBEcm9w
ICdyZXMnIHZhcmlhYmxlIGFuZCBjb21iaW5lIHR3byBsaW5lcyBpbnRvIG9uZS4NCj4+Pj4gLSBI
YW5kbGUgZGVmZXJyZWQgcHJvYmUgcHJvcGVybHksIHVzZSBkZXZfZXJyX3Byb2JlKCkuDQo+Pj4+
IC0gRG9uJ3QgcHJpbnQgYW55dGhpbmcgb24gZGVmZXJyZWQgcHJvYmUuIERyb3BwZWQgcHJpbnQu
DQo+Pj4+IC0gUmVtb3ZlIHRoZSBNT0RVTEVfQUxJQVMgYW5kIGFkZCBNT0RVTEVfREVWSUNFX1RB
QkxFKCkuDQo+Pj4+IC0gc3ltYm9sICdtY2hwX2x2ZHNfZHJpdmVyJyB3YXMgbm90IGRlY2xhcmVk
LiBJdCBzaG91bGQgYmUgc3RhdGljLg0KPj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnICAgICAgICAgIHwgICA3ICsNCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9taWNyb2NoaXAtbHZkcy5jIHwgMjI4ICsrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDIzNiBpbnNlcnRpb25zKCspDQo+Pj4+ICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMNCj4+
Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZw0KPj4+PiBpbmRleCBlZmQ5OTZmNmMxMzguLjg4
OTA5OGUyZDY1ZiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29u
ZmlnDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZw0KPiANCj4gW3Nr
aXBwZWRdDQo+IA0KPj4+PiArICAgICBpZiAocmV0IDwgMCkgew0KPj4+PiArICAgICAgICAgICAg
IERSTV9ERVZfRVJST1IobHZkcy0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBsdmRzIHBjbGsgJWRc
biIsIHJldCk7DQo+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuOw0KPj4+PiArICAgICB9DQo+Pj4+
ICsNCj4+Pj4gKyAgICAgcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhsdmRzLT5kZXYpOw0KPj4+
PiArICAgICBpZiAocmV0IDwgMCkgew0KPj4+PiArICAgICAgICAgICAgIERSTV9ERVZfRVJST1Io
bHZkcy0+ZGV2LCAiZmFpbGVkIHRvIGdldCBwbSBydW50aW1lOiAlZFxuIiwgcmV0KTsNCj4+Pj4g
KyAgICAgICAgICAgICBjbGtfZGlzYWJsZShsdmRzLT5wY2xrKTsNCj4+Pg0KPj4+IFRoaXMgY2Fu
IHJlc3VsdCBpbiB1bmJhbGFuY2VkIGNsa19kaXNhYmxlKCksIGlmIHBtX3J1bnRpbWVfZ2V0X3N5
bmMoKQ0KPj4+IGZhaWxzLiBUaGlzIGZ1bmN0aW9uIGNhbGxzIGNsa19kaXNhYmxlKCksIGJ1dCB0
aGUgZnJhbWV3b3JrIGhhcyBubyB3YXkNCj4+PiB0byBrbm93IHRoYXQgLmVuYWJsZSgpIHdhcyBu
b3Qgc3VjY2Vzc2Z1bCBhbmQgY2FsbHMgLmRpc2FibGUoKSwgd2hpY2gNCj4+PiBhbHNvIGNhbGxz
IGNsa19kaXNhYmxlKCA+DQo+Pj4gUGxlYXNlIGNvbnNpZGVyIHR1cm5pbmcgcGNsayBpbnRvIHBt
X2NsayBzbyB0aGF0IGl0cyBzdGF0ZSBpcyBtYW5hZ2VkDQo+Pj4gYXV0b21hdGljYWxseSAob3Ig
YXQgbGVhc3QgbW92aW5nIGNsa19lbmFibGUvZGlzYWJsZSBpbnRvIHBtX29wcykuDQo+Pg0KPj4g
VGhpcyBwcm9jZXNzIGFwcGVhcnMgcmF0aGVyIGludHJpY2F0ZS4gTWF5IEkgc3VnZ2VzdCBvbWl0
dGluZyB0aGUNCj4+ICdjbGtfZGlzYWJsZScgb3BlcmF0aW9uIGhlcmU/DQo+IA0KPiBZZXMNCj4g
DQo+Pg0KPj4+DQo+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuOw0KPj4+PiArICAgICB9DQo+Pj4+
ICsNCj4+Pj4gKyAgICAgbHZkc19zZXJpYWxpc2VyX29uKGx2ZHMpOw0KPj4+PiArfQ0KPj4+PiAr
DQo+Pj4+ICtzdGF0aWMgdm9pZCBtY2hwX2x2ZHNfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKQ0KPj4+PiArew0KPj4+PiArICAgICBzdHJ1Y3QgbWNocF9sdmRzICpsdmRzID0gYnJp
ZGdlX3RvX2x2ZHMoYnJpZGdlKTsNCj4+Pj4gKw0KPj4+PiArICAgICBwbV9ydW50aW1lX3B1dChs
dmRzLT5kZXYpOw0KPj4+PiArICAgICBjbGtfZGlzYWJsZShsdmRzLT5wY2xrKTsNCj4+Pj4gK30N
Cj4+Pj4gKw0KPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIG1jaHBf
bHZkc19icmlkZ2VfZnVuY3MgPSB7DQo+Pj4+ICsgICAgIC5hdHRhY2ggPSBtY2hwX2x2ZHNfYXR0
YWNoLA0KPj4+PiArICAgICAuZW5hYmxlID0gbWNocF9sdmRzX2VuYWJsZSwNCj4+Pj4gKyAgICAg
LmRpc2FibGUgPSBtY2hwX2x2ZHNfZGlzYWJsZSwNCj4+Pj4gK307DQo+Pj4+ICsNCj4+Pj4gK3N0
YXRpYyBpbnQgbWNocF9sdmRzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
Pj4+ICt7DQo+Pj4+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+Pj4+
ICsgICAgIHN0cnVjdCBtY2hwX2x2ZHMgKmx2ZHM7DQo+Pj4+ICsgICAgIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqcG9ydDsNCj4+Pj4gKw0KPj4+PiArICAgICBpZiAoIWRldi0+b2Zfbm9kZSkNCj4+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+Pj4gKw0KPj4+PiArICAgICBsdmRzID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqbHZkcyksIEdGUF9LRVJORUwpOw0KPj4+
PiArICAgICBpZiAoIWx2ZHMpDQo+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
Pj4+ICsNCj4+Pj4gKyAgICAgbHZkcy0+ZGV2ID0gZGV2Ow0KPj4+PiArDQo+Pj4+ICsgICAgIGx2
ZHMtPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UobHZkcy0+ZGV2LA0KPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVN
LCAwKSk7DQo+Pj4+ICsgICAgIGlmIChJU19FUlIobHZkcy0+cmVncykpDQo+Pj4+ICsgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIobHZkcy0+cmVncyk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgbHZk
cy0+cGNsayA9IGRldm1fY2xrX2dldF9wcmVwYXJlZChsdmRzLT5kZXYsICJwY2xrIik7DQo+Pj4N
Cj4+PiBXaHkgZG8geW91IG5lZWQgX3ByZXBhcmVkIHZlcnNpb24/DQo+Pg0KPj4gSSB3aWxsIGNo
YW5nZSB0aGlzIHRvIGp1c3QgZGV2bV9jbGtfZ2V0KCkuDQo+Pg0KPj4+DQo+Pj4+ICsgICAgIGlm
IChJU19FUlIobHZkcy0+cGNsaykpDQo+Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJf
cHJvYmUobHZkcy0+ZGV2LCBQVFJfRVJSKGx2ZHMtPnBjbGspLA0KPj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiY291bGQgbm90IGdldCBwY2xrX2x2ZHMgcHJlcGFyZWRcbiIpOw0K
Pj4+PiArDQo+Pj4+ICsgICAgIHBvcnQgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUoZGV2LT5v
Zl9ub2RlLCAxLCAwKTsNCj4+Pj4gKyAgICAgaWYgKCFwb3J0KSB7DQo+Pj4+ICsgICAgICAgICAg
ICAgRFJNX0RFVl9FUlJPUihkZXYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAi
Y2FuJ3QgZmluZCBwb3J0IHBvaW50LCBwbGVhc2UgaW5pdCBsdmRzIHBhbmVsIHBvcnQhXG4iKTsN
Cj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+Pj4gKyAgICAgfQ0KPj4+PiAr
DQo+Pj4+ICsgICAgIGx2ZHMtPnBhbmVsID0gb2ZfZHJtX2ZpbmRfcGFuZWwocG9ydCk7DQo+Pj4+
ICsgICAgIG9mX25vZGVfcHV0KHBvcnQpOw0KPj4+PiArDQo+Pj4+ICsgICAgIGlmIChJU19FUlIo
bHZkcy0+cGFuZWwpKQ0KPj4+PiArICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOw0K
Pj4+PiArDQo+Pj4+ICsgICAgIGx2ZHMtPnBhbmVsX2JyaWRnZSA9IGRldm1fZHJtX3BhbmVsX2Jy
aWRnZV9hZGQoZGV2LCBsdmRzLT5wYW5lbCk7DQo+Pj4NCj4+PiBQbGVhc2UgdXNlIGluc3RlYWQ6
DQo+Pj4NCj4+PiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKGRldiwgZGV2LT5vZl9ub2RlLCAxLCAw
KTsNCj4+DQo+PiBTdXJlLCBOb3RlZC4gVGhhbmtzLg0KPj4+DQo+Pj4+ICsNCj4+Pj4gKyAgICAg
aWYgKElTX0VSUihsdmRzLT5wYW5lbF9icmlkZ2UpKQ0KPj4+PiArICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKGx2ZHMtPnBhbmVsX2JyaWRnZSk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgbHZkcy0+
YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7DQo+Pj4+ICsgICAgIGx2ZHMtPmJyaWRnZS50
eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0xWRFM7DQo+Pj4+ICsgICAgIGx2ZHMtPmJyaWRnZS5m
dW5jcyA9ICZtY2hwX2x2ZHNfYnJpZGdlX2Z1bmNzOw0KPj4+PiArDQo+Pj4+ICsgICAgIGRldl9z
ZXRfZHJ2ZGF0YShkZXYsIGx2ZHMpOw0KPj4+PiArICAgICBkZXZtX3BtX3J1bnRpbWVfZW5hYmxl
KGRldik7DQo+Pj4NCj4+PiBFcnJvciBjaGVjayBpcyBtaXNzaW5nLg0KPj4NCj4+IFN1cmUsIEkg
d2lsbCBhZGQgdGhpcw0KPj4NCj4+ICAgICAgICAgICByZXQgPSBkZXZtX3BtX3J1bnRpbWVfZW5h
YmxlKGRldik7DQo+PiAgICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4+ICAgICAgICAgICAgICAg
ICAgIERSTV9ERVZfRVJST1IobHZkcy0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBwbSBydW50aW1l
Og0KPiANCj4gRFJNX0RFVl9FUlJPUiBpcyBkZXByZWNhdGVkLCBwbGVzZSB1c2Ugc3VpdGFibGUg
cmVwbGFjZW1lbnQuDQoNClN1cmUsIEkgd2lsbCByZXBsYWNlIERSTV9ERVZfRVJST1IoKSB3aXRo
IGRldl9lcnIoKS4NCg0KPiANCj4+ICVkXG4iLCByZXQpOw0KPj4gICAgICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsNCj4+ICAgICAgICAgICB9DQo+Pg0KPj4NCj4gDQo+IC0tDQo+IFdpdGggYmVz
dCB3aXNoZXMNCj4gRG1pdHJ5DQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4N
Cg0K
