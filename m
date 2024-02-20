Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0185B17C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 04:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4894210E0CE;
	Tue, 20 Feb 2024 03:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="gghcM2A7";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="vZrculrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC31E10E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1708400070; x=1739936070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ijX3fv5HMN4LBAnNRRE9Ji/lgDM3sRPVs/OGytjA8oY=;
 b=gghcM2A7A8UaC6pqKuN/i4+EAhrTBJM/KlOLRt6ZjPtnPqpKnvAvmHh0
 r0izjnEwQCgCKtVxN3mf95WJkE51Ni7pyTfzUC2VP/Mtf7l40g8IBFsqI
 qt13AT20cqCjf9LILpBGRyvO1/dDnq72pDAW9qMhuu3p2YkS8XnA77TBQ
 cDmswS8/UpB8dtE6+4WmQI6PkqKq8TBmMI18lSj/tX9xdMGb8uEF6QJk2
 OE7ywDbv5sLKUlPzZzNeBmE5ITH/jT4sDV/9eukEJJ7x+FnXC3HbI92oL
 kqEvYJZKQpYu1KHnVRNgqOuNAyiAtBTBb4LEAlrJydIaLBNwewQyipvCl g==;
X-CSE-ConnectionGUID: G2wgUZJLRfiErdABW/Ff/A==
X-CSE-MsgGUID: qvhxMW0ASqGJtexkSyaknw==
X-IronPort-AV: E=Sophos;i="6.06,171,1705388400"; d="scan'208";a="247242155"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Feb 2024 20:34:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 20:34:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 20:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ8ciaktrceKZ/wMJ5hM5ghmUGGD/kN4i+A/3S+ZoywAkd0SRti4GbzgnZantRjJXUK+LPFcsLaO5DMBohKbQpZiHC00WPW5ajWz+AgNUJ0JXBDKrhFQF8TFhSxD7fbRXNWrGsboNpXkWQR57HOc2aI8JY5nTC7NDob+eOrXV4qHVFU9WPajAENa6fbRgYYcQLqz1YCj1tVkme3Piu57/JWkX0njdPfc8xWpfi9BqEzXWggqdLhM/WWfFxZfE2kSnmOOJs+0z5KXX3oUL/uXdts3Wri9VG7Oon2B+CFw07L22s9ugMKuKTHyGDCOiV4qT3ulO+LJEl5GdbvhqUgt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijX3fv5HMN4LBAnNRRE9Ji/lgDM3sRPVs/OGytjA8oY=;
 b=VY79EeCGKTVipu9wOfrmeLsCmmDhoa9tD2IU/sneGEJK1CD0DSb6Z/ppcr+TxBFRVYwo3UQj/BfURwj4NKHp6d9yYIliMfSN2oLD5br0M+AXbrjSB1qhY3za31Bii0tyrJVLR5r8nDzrDRQ4IzSlKKU1v3Mo6QFnLednaz0wTeErjans14zsJGW5eASG6ebY/nobNwswIXolGa1Efvkf1nCrE7WwYg/DJ3hD0NtL1YtDLJwU8LyivkwtsC3li1WX5pJCod9VCJ4+1dmnSXuV+hXAZbG5RKn+7giWc5F2/r0RviQvrkKnh4/Fps4IR4MLAeVuMnNN2eey99yzNMjQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijX3fv5HMN4LBAnNRRE9Ji/lgDM3sRPVs/OGytjA8oY=;
 b=vZrculrLOZxAUH1oRMRRsVYjaMUrIsE61bIVYeNXvURLsBPuabQWLaaF9S6XWGl2aUC6SaGbmwh0zE0rJrZ82QYqnhgzF32uUMV9VpJwh8zezikGkNhyEaTFNx35mdKyqyOwderMO08HcfEQzqx1xg1GhVi4WjC34c9oJHAN6Xm4GFkq3XkOA3cGEWMAlMp2V8N/1cLBLqh/JIxG6KxICwNf6kItFQYNLH1+UoGJiAyu6t49ojgiSnToQpOcHYsZKTs9/yVZVWSTc4nH2Jzs+NSjOqEWDNTSA0asCHxO+X7Xtn2uNiE+e8oa3n2La5VS9Tv6PGt7h011IG2YDVF9KQ==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Tue, 20 Feb
 2024 03:34:16 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.036; Tue, 20 Feb 2024
 03:34:16 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <lee@kernel.org>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <linux-pwm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Manikandan.M@microchip.com>,
 <Conor.Dooley@microchip.com>
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Thread-Topic: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Thread-Index: AQHaVW1agMCd01Ttxk+iqd3BnnFM67EATF8AgAZDsACADCB0AA==
Date: Tue, 20 Feb 2024 03:34:16 +0000
Message-ID: <ffd43756-b24e-4f19-be33-0e33047ad70c@microchip.com>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
In-Reply-To: <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|PH0PR11MB4775:EE_
x-ms-office365-filtering-correlation-id: 9ad023f9-b020-4df6-a614-08dc31c4d0df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Zbml+Z+95kL/GLmShgakba+7h6M5iHDg3RcGhZH+26HqXIhlfTyavcTD9B7TXmOM+GI4POYOyBBaZ7GXVqWbm9cP/quy7EyvJfzIZv+AyrwT8TjR7WvVzx/GX1z72KqBDC5BGlNvQ8jAaE0o0xmzEK8hRXA/Yu2zwn7MrbTkLjvnPk7zyhE0yOJi4SA1ikuBszghut9jRQB2JxIL+N3pSxnwjmQoEmsS0V3GT0gp5WTfEHDwnZg6sOr7mUzrl3dZBmWUiz5HgzFvWpMLA/krwg8MkdaB5y9yN8WEn4DlsTudZS9/8VBQ5FEXjYPHYVvB1uDW8qKYQWhA3MhDQNuiK4ordS2XQw4zcYBc0iGrX2zb1g/eNmEafJ4QMd5CR4JsBQVO5WBjl+OjmpTKnVg4mJI/BPHx7gRUxJTkz+CiYr+k/ibTKOQ65qpI7nKrzxq1gcqxIN9PxhMzBEQPP07WZzgey/Dpdef/EhN3aFo9dQx3lGX4fyiC9Q5Nr4EU8pDPGIzaJ0FUsqJDH8hrF988pVkhsLMRq+ip5a0QsiADHjl3v7QGUHCtivUNGLYOFnZ5NL5x2fVlqObomfgfqTJNUPSgwfTU0zim1CSpOUFFIhjY6qYmZK9twhaq2pWh6WgOwx+sLZ3IWdd4vCr/9mE8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(921011)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0dYOTN0ZVlla0RnVjhZQThTK3pvUGRFYmNKVjI3YkpaSDlBUHlHTm1GZkhP?=
 =?utf-8?B?VXdWS01sc1lkUkFBRDhHM2FiSmJVN29SS2dSMlRkWTlnMDRYQ3pGVWhtYVpl?=
 =?utf-8?B?Y3ErczNHK2owUTF1bEFOYlZBUzZKaU9BWDd4RE5takR6d3BlRUxROG5ua0du?=
 =?utf-8?B?N1h5L0xFS256VmQ2ZWRLTUJGbklzVzJlZUJZa2IxRUwwaWJ4S1NhTjd3Y1Vi?=
 =?utf-8?B?bSs5eG41QXBhTkFkYnJkY0gzWEplaHRMQXZNK1pYSG11dS90T2hGdEJLQklZ?=
 =?utf-8?B?ZEdoaE42dE5OSnVOQUFZVUZ5eVNRNlR5ZDBzYVJRZFZVZzV1Mkc2WGpOQzNv?=
 =?utf-8?B?T2lzTXRtaEQzemZIVnNEUzYzczBNand1bTViUHdvVDBxaDgrb2lHNjFGU3hB?=
 =?utf-8?B?RlVRdWxPNFhSaXNpWW9ZK0dvb1AxZjhRMHFLWndwTzNuMnUvYlZNSE5iWkZ0?=
 =?utf-8?B?cXhYY2g2a1RjVE5tRnRCRGl4a3VNZk55TkpqSEJBMlpLU2EzaHEvT0lHQWpX?=
 =?utf-8?B?ZWNxZTFneWVaMjl6UEErY1p2M2VIakF6alIrVU4yTWt5V0FUN0FyRmMwVU1U?=
 =?utf-8?B?RHptM3ppeDdjRlQwSGJLWUk5YUNySEhBSmlPd0R6c0hORHJqdGJwSENibnFS?=
 =?utf-8?B?bm1iUUZrbVEyTDJXTmE2T0JSWXlONlB0dUd4ZW9LbVU2ajE4UzNOQk0xSEQ3?=
 =?utf-8?B?OXFsdnVNQTBIQzVxRFVMdFZNNjh3WlFiY25QVVB2VEZFMlp6RktFQzBYdEph?=
 =?utf-8?B?UWRmWG9POGxOVFgwb0NXMHJNakRZRU9aSm1HVnRadDZGRktUUjR2ZnJMbllG?=
 =?utf-8?B?Q2hBWUtZUy9oaXh6YzJTZWx0SFk4dWNYUTFHSnZtYXZiTjJIWVhqRWVZQW1D?=
 =?utf-8?B?SmRkcS9aQ1N0c0V3M08zTHUrcFdaNll0NW1KM0d2MnF4MFVBMEFlcXB0V0RT?=
 =?utf-8?B?SVhDWml4Q2p5b3lic2xsZjVva21RUmF6bFlRQmhVNE1rMVJxcjBmTlFBT1ZR?=
 =?utf-8?B?blBzQ0RJZkpXcjUrM2YrMG1pSVR5ZkIzVUMwZXNReGdCM0taRU1hQmMwVEk2?=
 =?utf-8?B?R1ZyZEFiUHlDVUhzdFZiUDYxTDNhUjdNaU16NnZhNkpxMUpYY3hwbDhMdE5C?=
 =?utf-8?B?WTRRUTlRSVMvSitwU1dKMEdMTTJXbzF4T1VKeG5GQjNiV1ZsMks4Z2g5dFdL?=
 =?utf-8?B?amVJNFBHWjJ4cHBZUDd6SFBUYWJOUlR4SFNqTDFVenpucENsVHlRRFdFVXJs?=
 =?utf-8?B?TlF6UThNMnZ4UWVZSUIrbWJobDNENDJqYkZ2eHNyNlBqZlpLT2w5cmpqRVVX?=
 =?utf-8?B?citpYnp1aW53WGVGV2YzMWM4dkVPNUxTRmxROWVWL2dYVTcxbzY3dEtkR01n?=
 =?utf-8?B?bVdrUG9lRzQzS090dDJzTmJpRWN5V1VSd0pVOS95cndTN1B5NG1tbnFVa3dv?=
 =?utf-8?B?ckdKQVNlUXBEYmxqa2VEand1UUgvb0RwOXlid1M0MWxoOUlJWU1Sdks4NUFu?=
 =?utf-8?B?RG9nZEQ4YUptL0N5aFN3NEF5MmpxcmM1SjVYNDJpNEVhU3FUcDFnQ0ZiSGRv?=
 =?utf-8?B?QkRiREFBa05TU2tueUxvY2JreWF3L3pkdGtIZG9EZTA2L1crSzZCTFFlc21P?=
 =?utf-8?B?d0dta3M0eXdveUpjNWh5ck56TG1seGR4eC9keGZPcC9KRE0xTWJJbEZONGJi?=
 =?utf-8?B?bXo4c2NTL2c3QW4rYzdZcWpPVEFGeUZnajZ5QlVLQmlwNy9ncVlDcU1WeXF1?=
 =?utf-8?B?d1M5NTQrYzFEU2ppR3drTDZtdUtER0V3L3o5WkhuSFI1LzdkWG9XS28rdGpZ?=
 =?utf-8?B?YmFaOG1DV2hPTTZQWXAvN1NBbnRVYVk3YnBBRTk1MTVIRTR5NkxTaHA5amc1?=
 =?utf-8?B?Sy9ERzI0cWlaaUx4cTVSeUhPZ3ludjZqaVg3cVQyaW4wamM1QTJWRzZRSEVP?=
 =?utf-8?B?YTJhN0tpd1QxdVl6ZTU5MmNsUWN5Qzk5Mm04N2llWCthd2paVEJnOW8rK2JI?=
 =?utf-8?B?NWVQNDByQmNzc2paYnpDWGxDcGc0ZEdtTWZVS2ZCYmdjYzV6cEV1STV2V3NI?=
 =?utf-8?B?L0M3V2lVb25vZE9ieVJwcVRDc0N3TDNrMmVvenZ6QzB6Mm5UdGtOSFZLRVdS?=
 =?utf-8?Q?aJJqWpaw0BUvliOqNFjD4KmnM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8BFBA99F99BD5479C01B154B72ACAAE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad023f9-b020-4df6-a614-08dc31c4d0df
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 03:34:16.7392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnPXYEvbPI+Ij0wtGYnaaFS996Lyy6H3B85FgbF/uF7ZBvOs8sbsRn613E1UbHuOGO8KTkoyvhq+Amtv9VDPWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAxMi8wMi8yNCAzOjUzIHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDA4
LzAyLzIwMjQgMTE6NDMsIExlZSBKb25lcyB3cm90ZToNCj4+IE9uIEZyaSwgMDIgRmViIDIwMjQg
MDU6NDc6MzMgKzA1MzAsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+PiBDb252ZXJ0
IHRoZSBhdG1lbCxobGNkYyBiaW5kaW5nIHRvIERUIHNjaGVtYSBmb3JtYXQuDQo+Pj4NCj4+PiBB
bGlnbiBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIHByb3BlcnRpZXMgdG8gY2xlYXJseSBpbmRpY2F0
ZSB0aGF0IHRoZSBMQ0QNCj4+PiBjb250cm9sbGVyIGV4cGVjdHMgbHZkc19wbGxfY2xrIHdoZW4g
aW50ZXJmYWNlZCB3aXRoIHRoZSBsdmRzIGRpc3BsYXkuIFRoaXMNCj4+PiBhbGlnbm1lbnQgd2l0
aCB0aGUgc3BlY2lmaWMgaGFyZHdhcmUgcmVxdWlyZW1lbnRzIGVuc3VyZXMgYWNjdXJhdGUgZGV2
aWNlIHRyZWUNCj4+PiBjb25maWd1cmF0aW9uIGZvciBzeXN0ZW1zIHV0aWxpemluZyB0aGUgSExD
REMgSVAuDQo+Pj4NCj4+PiBbLi4uXQ0KPj4NCj4+IEFwcGxpZWQsIHRoYW5rcyENCj4+DQo+PiBb
My8zXSBkdC1iaW5kaW5nczogbWZkOiBhdG1lbCxobGNkYzogQ29udmVydCB0byBEVCBzY2hlbWEg
Zm9ybWF0DQo+PiAgICAgICAgY29tbWl0OiBjYjk0NmRiMTMzNWI1OTllY2UzNjNkMzM5NjZiZjY1
M2VkMGZhNThhDQo+Pg0KPiANCj4gTmV4dCBpcyBzdGlsbCBmYWlsaW5nLg0KPiANCj4gRGhhcm1h
LA0KPiBZb3UgbXVzdCBleHBsYWluIGFuZCBjbGVhcmx5IG1hcmsgZGVwZW5kZW5jaWVzIGJldHdl
ZW4gcGF0Y2hlcy4NCg0KSSBzaW5jZXJlbHkgYXBvbG9naXplIGZvciBhbnkgY29uZnVzaW9uIGNh
dXNlZCBieSB0aGUgb3ZlcnNpZ2h0LiBJIGhhdmUgDQpvcmdhbml6ZWQgdGhlIHBhdGNoZXMgYWNj
b3JkaW5nIHRvIHRoZWlyIGRlcGVuZGVuY2llcyBpbiB0aGUgcGF0Y2ggDQpzZXJpZXMsIGJ1dCB1
bmZvcnR1bmF0ZWx5LCBJIG5lZ2xlY3RlZCB0byBleHBsaWNpdGx5IG1lbnRpb24gdGhlc2UgDQpk
ZXBlbmRlbmNpZXMuIEkgdW5kZXJzdGFuZCB0aGUgaW1wb3J0YW5jZSBvZiBjbGVhciBjb21tdW5p
Y2F0aW9uIGluIG91ciANCmNvbGxhYm9yYXRpdmUgZWZmb3J0cy4gUGxlYXNlIGZlZWwgZnJlZSB0
byBwcm92aWRlIGd1aWRhbmNlIG9uIGhvdyBJIGNhbiANCmFzc2lzdCB5b3UgZnVydGhlciBpbiBy
ZXNvbHZpbmcgdGhpcyBtYXR0ZXIuDQoNCj4gDQo+IExlZSwNCj4gQ2FuIHlvdSBwaWNrIHVwIHR3
byBwcmV2aW91cyBwYXRjaGVzIGFzIHdlbGw/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KPiANCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0KDQo=
