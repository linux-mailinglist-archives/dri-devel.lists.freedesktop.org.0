Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C886FD96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D19010FEB5;
	Mon,  4 Mar 2024 09:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="DvEJ8sh4";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="blJIXvo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20A10FEB5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709544548; x=1741080548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NwBZmIath0N9QF3nX7P5X+7ptIHxMixEg1YB7aQUzw8=;
 b=DvEJ8sh4j4xtBJU3CSqyUJ+DCMBDRPU6q2qa8lD1Ko/Q09PzhQGbfByn
 gaPIyExcZD123X9s7p8G2PFkacbGSmJUdjHKfKMStj5cP/99eta/69EPk
 2UqRXUFfc8wjNh6FRaRetn9mYmwRaEU3bjk5HCu8wpAd+zBxRj1kkqSrF
 QIAkmRA1NQ3cvZWr/wcFbuTzBK9Olq5aVlz04gsy7qbDOBmOFCUsNCqQc
 QoGuPv8o9qHKwo3trSKcztJsjj1SzcB5My4gzkUIhk+1vkdXGJCCt1UEi
 fLiNpUrDxxm4yqfkacNzd5D1xEFNC1WI44TZBbe130v1TXTgu6qY6iMfg g==;
X-CSE-ConnectionGUID: UfO41WTLSxi42JAVRXPScg==
X-CSE-MsgGUID: rFrG+X9rTBGWVfkNe6Tp9Q==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; d="scan'208";a="184426315"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Mar 2024 02:29:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:28:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAvKBqbsjwuS+h09p39Z5qcTT/cpXsHZKM7meZ/Y5ewS04MHg1PTljwVdzaxBsqfq4Ah93QWY5M3GaeQlmpvDx+3ha2A95Te2xOmbBhzDJk6YamJADH3frMvYKjDZVr1KPQNMNI3IdtpHM8FOPS+D7q9qGNXYIxpSph4WRb86j9NVIAoqNBDJLzKxvSszOdkmy3p4TjfLJyc7DtHUfTKF9+vPWg3qY549M0ONAi5q1gAtT3gm6e/7YOZx4xzp4rC+x74JZ25rTv10ZRXCsZbSgm1kWWPzYQ5U+kBRLCIbMgs5RSLhULy+zyMqdUNXbqDW7uvNGNfM8e3x3ovrhe3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwBZmIath0N9QF3nX7P5X+7ptIHxMixEg1YB7aQUzw8=;
 b=ReoPi/T5zo3rRuXr5jNpgMzN00sH4lmgeD18Xap6tq9aNHK77XT3up5+fQPWggGJi0C20O+uWKEwQkUYS63zaw1s4IZtTwtVmA1uQmIK5MPJTXKcnBczS1FRCCX5FmUNzD2F8aJlhEXORIhomf5Jsy2dhnqaBdOPCu1IVSZnhsLHnnioPIZ9M/D68XrWyjDLTPgFE/HxO75sIbIjG4L08ATVRCkue9p/HMnZsnEpsp7wEfHBQNKBvU5bQjxC5BLlYGXI3SpyYQzVnSVH67x5ByYsTwIvMkGr7j+RWBNVuOtgFkwF4MEy4JcLDQYvahly0/4zjzwRcJfFFiHkpRMfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwBZmIath0N9QF3nX7P5X+7ptIHxMixEg1YB7aQUzw8=;
 b=blJIXvo2/VLHmPj6qPdFOUoX+ONBONcnwAYEt72eZgI+7az2A/J/gX7AnJSt5YbXO74cLYidB1KxcD6yq6DLuZ2BGXz3YZvSf08hTTBKd/0jXQKMxLinYzMQW6PDS6nAgALmuWQ4koXwB4+9Clw1VZL5DeAkcoAmzXuo8bvwpD3yrmg/oXKy/QzN3xXuMpu8B7HwnoDIhUK1jPjWQuZv3kfzeE31IKOmayzG8wejKa0OUPHeCFluBfY2LAkngQShDzyDVKt/yjbctv6cWd++iGht99HHbJ8/LGWp6PbFqraqfsVkM9qkZFoi6SkMHusV/9/dn9o/PptfT50avDYh9w==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 09:28:57 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 09:28:57 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Topic: [PATCH v2] dt-bindings: display: atmel, lcdc: convert to dtschema
Thread-Index: AQHabfYI+gLMaRelpkmVzWvz4IGEx7EnMVkAgAAfcwA=
Date: Mon, 4 Mar 2024 09:28:57 +0000
Message-ID: <3d4e4b18-5318-4f1c-ab05-b925a0dfd317@microchip.com>
References: <20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com>
 <ce1c5ba1-4f6a-4d20-8a12-fbae9003657a@linaro.org>
In-Reply-To: <ce1c5ba1-4f6a-4d20-8a12-fbae9003657a@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|IA1PR11MB6514:EE_
x-ms-office365-filtering-correlation-id: 5e52fd22-ffac-4708-f3fb-08dc3c2d8457
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ORKlrlQ3FFtx/JjDAP/6LyPtU4WafuRPqDUHl7yzyXOIyXqOy/USfrZWKoOD2sIATDMhmWXYWMOGIPVACKGvIf6L/8WVN+MYmPp6I2Sj9AszOPTqGrBqb7yERA5MVtvEbeoBSpJ78iL0gObgW0q6eNCrnPj1pi5zZAgpJXrwMRB/UqS8CREdjyNnYvwdp0CDfkhv4waj+AquFOF/Jn/QSLCy5ScwZSG9ptO9aaFEdOGALOH+aHQ0jKSnKMZtdWGHLuLyR+WgZiMYC92NzH9bwvDfziiOcf5OB2OhZH+sn5fM6Rw8MRgLiRJKQTS4cI/r38fgjV9hb/pCagNCjo06dD5N2PEqOs/tMJlqY5/05sClSAuoGt2HBlYGjsm4WUcHjx05ZQynz60fHrMWNPRu9+2X6qx9nPS/WGbGN4VB+Kp0RGh04TISaGoNM8xI1PavmPcqtIBT21jHgEBBuVcQliRMbGtviRVba+PlgoiYikF3a+lxRK5tNGqGRR57xUeOt/hUYbkO1knhCMW78uc3Q48N5XXipFKe2w/USmIef/dW66Ny0TbdH5t9X82iLsTkkmJfL6c9+/nr6iyGlM4QtL7HACgwxq3wZ59JYdWJpXNMm55pUrYJNclaNNhs8SilAtoJIk+velVSBebBb8UJDK4T9f5ftDLmPav6O9bkrt2N0zfQx7zpalcyjuBW+Qw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(921011)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFhwbVJndXg1VGVrODh6NTNVVm1Yak44blJyRVBWY0hURCtSRTQ4WnFyMVVG?=
 =?utf-8?B?TGoxcnl2SUZJVVpiRjBxdi9MQ25lMGwyTUlZY3F5VkQxbXpXTjFra3g4Q2lk?=
 =?utf-8?B?MUNWQjJNOEVLNWhNMGhmdVN4TWE1dEsxei9SYkVZaWtta2c0USsyYUk2U1hn?=
 =?utf-8?B?bUpmOTZwZ3RLdGl5dXZyaUo2WStxbXZJK1MvVmpTSUFBbVlZOVlEajRwUDY4?=
 =?utf-8?B?T1pYSTRBWmhzSGhQQjNFbTB1R2lOWGFOS1RwT0t2cTBWRjd5ajZVSlpDNUpJ?=
 =?utf-8?B?RDduQ0FGM1d2b1NLOVZpSmt3L0NYRGRBUXJVMGdJeStsUU40SjhSbVZVbExw?=
 =?utf-8?B?ZThlMU9ua1d5VGRSeHNQVW12bDhNZUR1eUlQU0xvemx1TldKdHRvQk9jR2lh?=
 =?utf-8?B?anVscWF0eVcvRlV6d1FvengrYTJLUUZvZGwrWkRSM2JldnR3UXNmdmVLMEZl?=
 =?utf-8?B?NlVqdnYvUlNkY1MxWjJxZTV5MXU1TURPY1RXK0dDdy9xaTRLM0p4OHB4Zlp4?=
 =?utf-8?B?ZTFRdW45TFp4cXhOMk1IdGJXS3RMaVJmbjYzYzMyVEozaTJzZkhKVHJ0WEZ5?=
 =?utf-8?B?YUoxTHNBYWdtQis5OWRCSEc2b01mZStGa2V0M2RGVXVKejFmMU1ZRWxOY21S?=
 =?utf-8?B?cWtzYnF1RDBwZm8vZ0JsQW8vWkhqeG0zMVd2TGE5VmxmY1huYzdmYWltY0hp?=
 =?utf-8?B?Z0plSlA5dDRMMEI1a2E5NE5BNFZWQkp0dEtlVWgreVlsejdJRVNuMEpDenVE?=
 =?utf-8?B?VWM2bTBMYktyQk5tV2tFL3JCTjBWWGtQUWw3OUNVRFQ2OTY0eFBOVzlTTjV6?=
 =?utf-8?B?Y1hFVFowNE9kWWhyc1VkRy9LNG1ta3ZjcGo2UXNMcEFFNmxIN0FnUWJQdWxu?=
 =?utf-8?B?SWlnUTlsWSsxSU9vTkdkTUpENTg4MFVHRjlwSVdBY2FUbVkyQzRhMDZ0RGc0?=
 =?utf-8?B?WkFVYm5DWU9RWEVOWmxvZ08rckxvOGNDdWtObWxrQmJja3ZDclNDWXpNd0Qy?=
 =?utf-8?B?WjJGcVVucFUzbWZCTXZlNVE0Zy8ySmlzUnhualdtZFJvVk0yUkxXZ1pWNzRL?=
 =?utf-8?B?OTdUQ0FQTUtwVnp0SmlVOGlsUTl6NU9wbkcxL0dGblRlamg3azBOZU5Da0wr?=
 =?utf-8?B?MkloNjhGUUdOZEUzRkpmZ242bko3WlhXTURjSmM3UW1tZVhiU2NEdVVGaXQ4?=
 =?utf-8?B?VHZVa01nbmZWTllFMjRSaTIwZWViVXduK1pocmxCcEJWcU5aQnkxV0p3WFRj?=
 =?utf-8?B?aTVqUi93dzZ4Z1lWSTM1WTU1cCtzL2k0Y1NRWUZWTGR4bEcvTitINjJ4RzJj?=
 =?utf-8?B?OU8wbTdrU25PejYzaHE1My9QVUVlTjhLN0ZZYzJRZnhkd0xuTUhKQzVuUTJl?=
 =?utf-8?B?N3lsc0JjMnFyNFVMcHV2VWp3QjZGQ1YvS2gxN3lPd1dnZFcvaVRINzVETExz?=
 =?utf-8?B?anUwblIzVnhpMGloY1NKWGhNMG1kUWk1NUZWVFdwNWdDeU5qUGhjRlVleEJq?=
 =?utf-8?B?RW1mRURkYnh1SXQ5UERxd2p3UVp4YW1ORG8yWHEzQ09yRjRZL29IelJBZVla?=
 =?utf-8?B?VlhCK0x5Rlh5M3BrelJuTE03M1YwdVdHbkhFZXY1dVl2aWc5ejZ5eUV5M0xl?=
 =?utf-8?B?emZKVVdHYlpMOEMwVEhZMFlkSFZ3OGRRSjd1cW9BODFFMFMweTRDNmVBWnl4?=
 =?utf-8?B?U0tadEpMZDVaZFBWZXp2d25XRjZCZ0lqTGlaOWhnYlpGWG5OaDgwSEd0eGhm?=
 =?utf-8?B?VXQ0T3ZsZWllek00ekpjeE1DRU9GUHFqQytSNzlCNGVCVko4bG9qTkRpMUU0?=
 =?utf-8?B?cnJOdmk3VHMydmlobHl5V2pQYXM3Y3ZaYUNXOUYyOWxkWDI2RHlHR0MvODdT?=
 =?utf-8?B?ek9LR1BjMnhwMDFPeEM5NjcwQkNWQitDc3VXUGtmVExSOFNxUlBGazhVNWtJ?=
 =?utf-8?B?aHFkOGs3eXkwZUF5TVBkS3dBREE2anc5TGVoQUNwQmhyWldBQWV5UnRhYjlQ?=
 =?utf-8?B?Qm15NUlKSHNWYWZDM1pINDdTcGlpNDhWYU5HNXI2N3U3cDZydzhiakJORTV5?=
 =?utf-8?B?RmszTEtEeU1SU2d6TSt6T1NQV1NxVEV6aCtCN0hwcVdtK0ZDNTVKaytXWk96?=
 =?utf-8?Q?JqwgP9OPpQDxfn2NRDJxyor20?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F50D424098B10F4D9A0A40F73193D9E8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e52fd22-ffac-4708-f3fb-08dc3c2d8457
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 09:28:57.1062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9iKujvoBaW+TAtWQGtPP0t7uq2ZluxP6Ku91ORSmKlsM96CyEb05MJWhWJOMJg9m5EEdETQjL3R0ZJ/yGv8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

T24gMDQvMDMvMjQgMTowNiBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwNC8wMy8yMDI0IDA2OjM2LCBE
aGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+PiBDb252ZXJ0IHRoZSBhdG1lbCxsY2RjIGJp
bmRpbmdzIHRvIERUIHNjaGVtYS4NCj4+IENoYW5nZXMgZHVyaW5nIGNvbnZlcnNpb246IGFkZCBt
aXNzaW5nIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgcHJvcGVydGllcy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+
PiAtLS0NCj4+IFRoaXMgcGF0Y2ggY29udmVydHMgdGhlIGV4aXN0aW5nIGxjZGMgZGlzcGxheSB0
ZXh0IGJpbmRpbmcgdG8gSlNPTiBzY2hlbWEuDQo+PiBUaGUgYmluZGluZyBpcyBzcGxpdCBpbnRv
IHR3byBuYW1lbHkNCj4+IGxjZGMueWFtbA0KPj4gLSBIb2xkcyB0aGUgZnJhbWUgYnVmZmVyIHBy
b3BlcnRpZXMNCj4+IGxjZGMtZGlzcGxheS55YW1sDQo+PiAtIEhvbGRzIHRoZSBkaXNwbGF5IHBh
bmVsIHByb3BlcnRpZXMgd2hpY2ggaXMgYSBwaGFuZGxlIHRvIHRoZSBkaXNwbGF5DQo+PiBwcm9w
ZXJ0eSBpbiBsY2RjIGZiIG5vZGUuDQo+Pg0KPj4gVGhlc2UgYmluZGluZ3MgYXJlIHRlc3RlZCBh
Z2FpbnN0IHRoZSBleGlzdGluZyBhdDkxIGR0cyBmaWxlcyB1c2luZw0KPj4gZHRic19jaGVjay4N
Cj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gUnVuIGNoZWNrcGF0Y2ggYW5kIHJlbW92
ZSB3aGl0ZXNwYWNlIGVycm9ycy4NCj4+IC0gQWRkIHRoZSBzdGFuZGFyZCBpbnRlcnJ1cHQgZmxh
Z3MuDQo+PiAtIFNwbGl0IHRoZSBiaW5kaW5nIGludG8gdHdvLCBuYW1lbHkgbGNkYy55YW1sIGFu
ZCBsY2RjLWRpc3BsYXkueWFtbC4NCj4+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI0MDIyMy1sY2RjLWZiLXYxLTEtNGM2NGNiNjI3N2RmQG1pY3JvY2hpcC5jb20N
Cj4+IC0tLQ0KPj4gICAuLi4vYmluZGluZ3MvZGlzcGxheS9hdG1lbCxsY2RjLWRpc3BsYXkueWFt
bCAgICAgICB8IDk4ICsrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9hdG1lbCxsY2RjLnR4dCAgICAgfCA4NyAtLS0tLS0tLS0tLS0tLS0t
LS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy55YW1s
ICAgIHwgNzAgKysrKysrKysrKysrKysrKw0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDE2OCBpbnNl
cnRpb25zKCspLCA4NyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy1kaXNwbGF5LnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hdG1lbCxsY2RjLWRp
c3BsYXkueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uZWE0ZmQzNGI5ZTJjDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hdG1lbCxsY2RjLWRpc3BsYXkueWFtbA0KPj4g
QEAgLTAsMCArMSw5OCBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYXRtZWwsbGNkYy1kaXNwbGF5LnlhbWwj
DQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjDQo+PiArDQo+PiArdGl0bGU6IE1pY3JvY2hpcCdzIExDREMgRGlzcGxheQ0KPj4gKw0KPj4g
K21haW50YWluZXJzOg0KPj4gKyAgLSBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3Jv
Y2hpcC5jb20+DQo+PiArICAtIERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9j
aGlwLmNvbT4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoNCj4+ICsgIFRoZSBMQ0QgQ29udHJvbGxl
ciAoTENEQykgY29uc2lzdHMgb2YgbG9naWMgZm9yIHRyYW5zZmVycmluZyBMQ0QgaW1hZ2UgZGF0
YQ0KPj4gKyAgZnJvbSBhbiBleHRlcm5hbCBkaXNwbGF5IGJ1ZmZlciB0byBhIFRGVCBMQ0QgcGFu
ZWwuIFRoZSBMQ0RDIGhhcyBvbmUgZGlzcGxheQ0KPj4gKyAgaW5wdXQgYnVmZmVyIHBlciBsYXll
ciB0aGF0IGZldGNoZXMgcGl4ZWxzIHRocm91Z2ggdGhlIHNpbmdsZSBidXMgaG9zdA0KPj4gKyAg
aW50ZXJmYWNlIGFuZCBhIGxvb2stdXAgdGFibGUgdG8gYWxsb3cgcGFsbGV0aXplZCBkaXNwbGF5
IGNvbmZpZ3VyYXRpb25zLiBUaGUNCj4+ICsgIExDREMgaXMgcHJvZ3JhbW1hYmxlIG9uIGEgcGVy
IGxheWVyIGJhc2lzLCBhbmQgc3VwcG9ydHMgZGlmZmVyZW50IExDRA0KPj4gKyAgcmVzb2x1dGlv
bnMsIHdpbmRvdyBzaXplcywgaW1hZ2UgZm9ybWF0cyBhbmQgcGl4ZWwgZGVwdGhzLg0KPj4gKw0K
Pj4gKyMgV2UgbmVlZCBhIHNlbGVjdCBoZXJlIHNpbmNlIHRoaXMgc2NoZW1hIGlzIGFwcGxpY2Fi
bGUgb25seSBmb3Igbm9kZXMgd2l0aCB0aGUNCj4+ICsjIGZvbGxvd2luZyBwcm9wZXJ0aWVzDQo+
PiArDQo+PiArc2VsZWN0Og0KPj4gKyAgYW55T2Y6DQo+PiArICAgIC0gcmVxdWlyZWQ6IFsgJ2F0
bWVsLGRtYWNvbicgXQ0KPj4gKyAgICAtIHJlcXVpcmVkOiBbICdhdG1lbCxsY2Rjb24yJyBdDQo+
PiArICAgIC0gcmVxdWlyZWQ6IFsgJ2F0bWVsLGd1YXJkLXRpbWUnIF0NCj4+ICsgICAgLSByZXF1
aXJlZDogWyBiaXRzLXBlci1waXhlbCBdDQo+IA0KPiBXaHkgcXVvdGVzIGluIG90aGVyIHBsYWNl
cz8gDQoNCkkgZ290IHRoZSBmb2xsb3dpbmcgd2FybmluZ3Mgd2hlbiBJIHRyaWVkIHRvIGNvbXBp
bGUgd2l0aG91dCBhZGRpbmcgdGhlIA0KcXVvdGVzIGZvciBhdG1lbCwqDQoNCiJbd2FybmluZ10g
dG9vIGZldyBzcGFjZXMgYWZ0ZXIgY29tbWEgKGNvbW1hcykiDQoNCmFuZCB3aGVuIEkgYWRkIHF1
b3RlcyBmb3IgImJpdHMtcGVyLXBpeGVsIiBpdCBjb21wbGFpbmVkIHRoZSBmb2xsb3dpbmcNCg0K
IltlcnJvcl0gc3RyaW5nIHZhbHVlIGlzIHJlZHVuZGFudGx5IHF1b3RlZCB3aXRoIGFueSBxdW90
ZXMgDQoocXVvdGVkLXN0cmluZ3MpIg0KDQpTbyBJIGFkZGVkIHF1b3RlcyBmb3IgcHJvcGVydGll
cyB3aXRoIGNvbW1hIGluIHRoZW0uDQoNCj4gYml0cy1wZXItcGl4ZWwgaXMgZ2VuZXJpYyBwcm9w
ZXJ0eSwgc28geW91DQo+IGFyZSBub3cgc2VsZWN0aW5nIG90aGVyIGJpbmRpbmdzLiBSZWFkIGNh
cmVmdWxseSB3aGF0IFJvYiB3cm90ZS4NCg0KTXkgYmFkLCBJIHNob3VsZCBoYXZlIGlucXVpcmVk
IGJlZm9yZSBhcnJpdmluZyBhdCBhbnkgY29uY2x1c2lvbi4NClRoYW5rcyBmb3IgbGV0dGluZyBt
ZSBrbm93Lg0KDQpTaGFsbCBJIHNlbmQgdjMgYnkgcmVtb3ZpbmcgIi0gcmVxdWlyZWQ6IFsgYml0
cy1wZXItcGl4ZWwgXSIgaW4gc2VsZWN0Pw0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCj4gDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg0K
