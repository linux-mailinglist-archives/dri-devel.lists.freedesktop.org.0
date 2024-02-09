Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9884F732
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F99F10F4B6;
	Fri,  9 Feb 2024 14:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="GyskleEx";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="7d0dkiv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0509910F4B6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707488557; x=1739024557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eBRX5LdurxXi8AFMQC4nzEtFc3W2AUS8lmxCO0eUr4Q=;
 b=GyskleExUKkiz4qgZdctf9yCQyktKPC0kTHYOX1f2W0+153V89005viQ
 v3uSrDxfY1aEUsDXSoIlMPFHbur8QMrpwWriJ/zX8LgsssyGrIws3RRw0
 XN8DQSkSQdVWW+DpKhRY4RjhI0FhfXGoCuXSb5+1ir+b3l1CZPMyNX5+E
 okMdi0LAlyOsr5qopIY+PbEDfm8C+bV2SEwGHXKzkwgRUKFwIukvMPuj7
 aNTXvxqz/tUmyDDm7Ee6tykuoZ0Yv4XAn1Ch84MHjMOMa8/0C7ME+gTjr
 flYl9mUlQ0ltuvrgbPaTF9AHkQlbiKekRlm0faWY5Ukv6HgZmRKsOOaHy A==;
X-CSE-ConnectionGUID: 5Inhev5iRPqGjcqAzOJPdA==
X-CSE-MsgGUID: OooabK2QS76Y9okRzgcFYw==
X-IronPort-AV: E=Sophos;i="6.05,257,1701154800"; d="scan'208";a="16536498"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2024 07:22:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 07:22:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 07:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt3Fzpfi+u82i0Q+anL3iG5zWZuRpcSH93uz86oowt3K7J10hDJuZG0qN9se+fPXtbvLL5xUWSExXz26ZNtPZ5MmZctnVvH0zMfgF78RRaqUarEjJ7HAUhPAZgjoUgQCR+svsISf5bz+KrV08120+9yVYp6upf00bMBKeLR7q3sEb/aSForJgt/cosIL0+NmUrNEkpqPIm6UU4eQ4ItQ7XzNh+fIccrINeOR1L7T921McJo5RFqQ1TfTWMtnD3k9ceZenDZjMbue8zxWdyl+py7HjLs/hKNORxfBu05kUxiZQrguQ4CefBA+99lLQbzEUI/X5CUXEuxRFHSCKUYeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBRX5LdurxXi8AFMQC4nzEtFc3W2AUS8lmxCO0eUr4Q=;
 b=Na6bZt4tavLv2avOVwy6GB2S1xd8+nlQ38YUrVUuHuuIGeWA9bdeaWksa6jHT5DylbgwjbvHxBtWJrlC1UOHvyHp9kPcAvFT4GGXb1FnsC5cEZ9cb3ffEgATcjFFgL7Gv+2ybxTnh+/gYG45s0h1UCnH6xED06/I9QWuFJw4KKUCd9VGe7Kg5AxO7YPHwo7F176O6CPGiN7H6BcVi6TpcEsOYwW4+I71FuDkCK5BamBZ69hldcpDai/jfgzMiI+yNM+WBgNplXP62mihjLtd686tgoCIXUQPYQWJSnd86hH3O6TuR61jnvwz0BQ4/l4nE0uyrha4Nm42uqKCzBO1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBRX5LdurxXi8AFMQC4nzEtFc3W2AUS8lmxCO0eUr4Q=;
 b=7d0dkiv6+ZQr4jyPOOf7i6nJPeaMyvEV1lBreYZjg6tekSkRXQnkWvRqL2KNqmqbN9ATceQ+h9djWbHokNgWkIhcYA3wgvJcODqXJC2wmswpRdlAUXeTexI+NWcSh2YAb2q/1Rpm3wJ+dROaPtc8qrZV5QK6ebLjygL3jaIRpcKby65m8JbtacnQ27BH/rF3UHypDHnc5DvntmCQEbE3PFek68ouc3q7kFnbsxQj/eC0osRCzsGTqQRyRUg11U4trrf+JCcvso94xEalMgL8jkzIT3Y62osB/7QwpsGEGqL6FiV0zQHFwXnOXPDo54A8ioibTN2+nue4vCx3JPFEkA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by IA1PR11MB8150.namprd11.prod.outlook.com (2603:10b6:208:44c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 14:22:28 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.025; Fri, 9 Feb 2024
 14:22:28 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Manikandan.M@microchip.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux@armlinux.org.uk>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <geert+renesas@glider.be>, <arnd@arndb.de>, <palmer@rivosinc.com>,
 <akpm@linux-foundation.org>, <gerg@linux-m68k.org>, <rdunlap@infradead.org>,
 <vbabka@suse.cz>, <linux-arm-kernel@lists.infradead.org>, <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-lvds
 compatible
Thread-Index: AQHaWbBvihkf+H6rV0avboHB5Zg4D7D/B+GAgAMLjoA=
Date: Fri, 9 Feb 2024 14:22:28 +0000
Message-ID: <39afd835-13be-4949-8a7a-4a81e0f3498b@microchip.com>
References: <20240207102802.200220-1-dharma.b@microchip.com>
 <20240207102802.200220-2-dharma.b@microchip.com>
 <20240207-raving-chatty-7961fb5c5d43@spud>
In-Reply-To: <20240207-raving-chatty-7961fb5c5d43@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|IA1PR11MB8150:EE_
x-ms-office365-filtering-correlation-id: 08814d74-9763-4755-75ff-08dc297a8b76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +6cNxBM+npaLlITMSyxmbxy1y1rAoUBd3bFRr1vhMxJzzvQ/cmwsMcNSQqQDqx628EEx8x4ARCuZ7O7maGPFG3HWPnMiP3j/aHIVr2XmxQqzWYdridQTcsF0YyvsvHBLiVy3dri8VWj3WOat3+zP2IY/K/HVgdPAeJkKSXvMB/p3Avot2mLdiLz9LpiB9Zzs0TDKlFSIIcU3WKOhDgJkSJrEMrRVd7wbs7H4fG6NlKeV7mGhNLjJk8naLwneQMtfhtxv/rNmPGtwDbHkrC1hkhy2TkUUxhs4rhy9Oud8nKQn6ZMdd8kBFoLgcDyGNaVf595sjoij75w4ZR+hp0094H8Y1PCAx1z1AXIQYYyCNQrKyuUsu2e5CaGGmLBR6fSuYhgnI8zISnRYzDzie9tL9eVP2C6DxhG/oUrRpXNT3ukVHnScC2cqCjhfkMVb8zuqYs6ArwHSU7jBi7sJXQqbzKv30t1S6WXUeerwKulLIBMKwHqxF0sp7GB7Vh7X/UMbC7JTWhasO1D62vNmD/OSG9lJyoCH0qawQEDT7si0gHNkfSnlZL26d9jS22z0xesGftz9KGisIHqq9/7Ocv4+BDniEQ96nheXYe36VHaZ4eFXl1n2nEKzZXdhVLWy7CFn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(53546011)(6486002)(83380400001)(478600001)(71200400001)(6512007)(2616005)(26005)(7416002)(2906002)(4744005)(316002)(6916009)(76116006)(66476007)(54906003)(64756008)(66556008)(66446008)(66946007)(8676002)(8936002)(5660300002)(91956017)(4326008)(38100700002)(38070700009)(36756003)(122000001)(31696002)(86362001)(6506007)(41300700001)(31686004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0l6QmFhM0ZrU0VybHBnOXNuQTl6Nno3YlFBUkVJS1k0YkRCclUrYS9hTkFq?=
 =?utf-8?B?Wld0cEZya3k1c2gwa2U4eFdrVENlTUxVeEF5OVpOMWp5ZzZHU096N01NVlB6?=
 =?utf-8?B?OW93NmttV3BOcWxEaUJFa1Z2UGRBYnl5TTlRQkFER2lwVFYwU2toK0k2V0VQ?=
 =?utf-8?B?U3JySWJlc0F0bzZtSTQvdU11bk0zcC93amgyTFIrNElFVzVDUUY1amNLTEVP?=
 =?utf-8?B?UDByQXlqS0dGTE90VTNNZi9sV001Ni9RUWVvYkV6Ly9OMEZTRnZrYzN6K3dj?=
 =?utf-8?B?d3cwMEs1K0JrSGJLdFZDMnlYT29zRFNkdnBiS2xRQUtwOVNJa0JldHNUSm0w?=
 =?utf-8?B?K3I2MWxjZUN3VHNqM2doZlQzclV3Z0l1R2Z0bXVaYTFKVDNtbkQwMHRSc3hm?=
 =?utf-8?B?UXVCUVVoZjY4SXlkZ1ZQSWlPVkgxbUdHUUJVaFdNQ00vNUY4dWFTRFE0TGJ5?=
 =?utf-8?B?SlNWL1FlQlJtV25YZlNtSlN3d1hlcE5qY3NuT2dEazh4aWcvMHZRaUdCVGR3?=
 =?utf-8?B?RlBwMFBSSmd5ZzB6R1VmL0VHUjE3YitMK1lkWUhSeEZlQ2tiL0VYVnI5R0gr?=
 =?utf-8?B?SFc0MW5rZDBkQzBFT2xQZmZaQkoyN1RJVVFqQzZ6N01BV3VzYzk3OXI0QkRl?=
 =?utf-8?B?NFp2ZVdQYTJFNXJoZkc0emtEUVE0dnY5Vis2dnduNW1DRmV0cW1YN1VqaHNM?=
 =?utf-8?B?MFVMU3pna0tVNkhCRnhLWUUzTFc5SngzOWhVdlhHN0xnc05ETFhGZ2pXV0d5?=
 =?utf-8?B?eGpLVDdpRlNrcHRLMTdoL3VVRHAvaTdDclo2OXNneW52OXpjWjByS0xMbi91?=
 =?utf-8?B?OXlRbzBiNE5CZlZMM1BjMmZlOEdXMmIyczVOTFlIZzIzRGk0MWJabmx3Ly9N?=
 =?utf-8?B?cHpLdTZQelQzcU13WHBpcXZ3b2c4b0Y5NHhmRk9YZWxYT1hROEk1Zjh0UUlh?=
 =?utf-8?B?K0hyYm9UQWlRek5zVUU5V09rRTBrSklndm5EWlhUOTRaRTdGbWE4amlUWHFn?=
 =?utf-8?B?SG5LYk1aenN6NXdNWks4ZzZoelZ0VjhISnc5aytMaDJZQzRmc1pPc3lpc0Yz?=
 =?utf-8?B?NjdLMVQ0bDBIS1FhS0FtaUpHcG0ySE91RWZnNnBjN1E0enZoZWh5QnAvR1FJ?=
 =?utf-8?B?NUlxR2Q3akVnRkprSEM2dGZwYlhpR25TcnIxSjI4VC9qME1mWklianRXWTdN?=
 =?utf-8?B?K1EwUlVUSy9aM0hxYkMyTTArR3FDQkg2U0tjbUVmMEFhRXI1R2FBalQ2cjhD?=
 =?utf-8?B?NlFUQ2Z2RHFyRXlYcnI3a2N2MnJ2Z1RwU282aHpsMWxGbnNYNVF4RC81cHYy?=
 =?utf-8?B?MU1mL2dZTENWWDh3V0pHemJCK0xmUWdxRHhtc1dWVmd1bGN4enA4NStIbS9K?=
 =?utf-8?B?T2ovakI3TFo1MU1sZlhBbWh1WlByb2VMYStkc2dXTFJRQjJPSXQ2K1VmeENn?=
 =?utf-8?B?dTZlbDFTZmlWM2tmWktxWUd5R0RVUm8zTk9VODVRWTNJVHIxLzdrL2hma3No?=
 =?utf-8?B?MzNJT1FqbXFtWlVYRHBSMHRGUWJ3OXlQM3dkcE9Jb3FRK2c5SnJiZm1NSzJW?=
 =?utf-8?B?M2UwVlZjVEh4Ylg5STRsRGx1R1dxQ3ZCSmRPQnpTN0E5VDRMa3A3N1BJT3JE?=
 =?utf-8?B?OGRXdzZPOXlqdWFjZjRTMTF1WW0zTnFHMGE3eXcvZFdxOFFZZEd4allLVGIr?=
 =?utf-8?B?ZUROR0U1RWRNWjRxazRkNUNkZ0tERHNPL04zOHVOcWVIc2x1QVhBcUhGdEJM?=
 =?utf-8?B?dTlUeGtUMmtJelB5aXFsVVVzMVlTMXorQWROSHdDNUR2amltOXBuYWFzNUZ2?=
 =?utf-8?B?Qjl2V21VL0ViM1o1ZXBBM3orNDNKM2FocU1pNW9YRzBidGV5OE5yQWZDYlFM?=
 =?utf-8?B?Z3FtYXJ5aTJoWTcreDUrTUFKcXE3eHgvek1GbEpoeGhSajRERXhOcWlkMUUz?=
 =?utf-8?B?UFlOcjZJbkNSaFR6Y0hvR2NpaldYODF1RGtDck9vdnlad3lyUE1nMjJDYnRH?=
 =?utf-8?B?SWtOenZXcU11OGNmQXVZK1JUMVVZZU02NTB6aG9DcDBGYWtQM0dVVTBGc2Zw?=
 =?utf-8?B?SE5oR1NVRUhncC81YWsweWx4Zjh0QjdXY3VxSXhsbWxKTFNrSTR5Z3BOcTQx?=
 =?utf-8?Q?cUPY1lPZduuz4XSUwX1MoyuOI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA6E75F9B6A8314B98002E6BACCA55D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08814d74-9763-4755-75ff-08dc297a8b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 14:22:28.2060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00fQjslz/HEO+8ZbIOCIE85grLMv/zzP7HMmw+Z4GBqSumbmnohlzwPDuKS3fjW5Ej5EJlYCr3O7RG3VxtN1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8150
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

SGkgQ29ub3IsDQoNCk9uIDA3LzAyLzI0IDk6MjIgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4g
JHN1YmplY3Q6IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IGFkZCBzYW05eDc1LWx2ZHMg
Y29tcGF0aWJsZQ0KPiANCj4gSWYgdGhlcmUncyBhIHJlc3BpbiBmb3Igc29tZSByZWFzb24sIHBs
ZWFzZSB1cGRhdGUgdGhlIHN1YmplY3QgdG8gbWF0Y2gNCj4gd2hhdCB0aGUgY29tbWl0IGlzIGFj
dHVhbGx5IGRvaW5nIChhZGRpbmcgYSB3aG9sZSBiaW5kaW5nKS4NCg0KQWJzb2x1dGVseSwgSSds
bCBtYWtlIHRoZSBhZGp1c3RtZW50IGFzIGZvbGxvd3M6ICJkdC1iaW5kaW5nczogZGlzcGxheTog
DQpicmlkZ2U6IGFkZCBzYW05eDc1LWx2ZHMgYmluZGluZyINCj4gDQo+IENoZWVycywNCj4gQ29u
b3IuDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg0K
