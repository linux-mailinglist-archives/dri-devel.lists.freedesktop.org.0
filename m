Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B9874E7C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CACD113782;
	Thu,  7 Mar 2024 12:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QrJuxX1m";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="jkdfk571";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC3113782
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 12:02:19 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4278A66D017177; Thu, 7 Mar 2024 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=W/dBLOg4bDmJCyY3rQVuW3tplQoFLU6LHuylGJR3N+8=; b=
 QrJuxX1mRrpe65ciKjKetYP7kJRL5ttosY1wR+oGgfRv+CW4y6i6ruErsajc11qZ
 hp/CgsfjpVUutQHfcqdIRj6nWNaPcG/miE1MdT2wcgbyh9TJK9T0+pYFdcA9/Z6N
 GwTYNtMgDW8zLKcJNfK8PDrW10smCxs/pHkZHLmKrDxtP1ro2ND490/1cR20c2Nw
 aywHNlrd0J5ajzGjYX9x+s2hoVEshAIx5wUx89gVkZjEto6BRkUwkHq3oCgM+5Qf
 /DBYHyjMZ4H30h0JqiDWRawONtHr6By3IVJO/0zMBDmxHhHvd2bgjGnPH8n7PxRR
 FWttFqQSv1nNI6KEUwBENg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3wku8sym54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Mar 2024 12:01:52 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 12:01:51 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 12:01:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzY73qHbR/vWRHRJjhRTdz50iULYeeRMBU5Y1x13qMqxF9RlPCqPGDv/Rvd8cAW8xv8VGdIWiTEPSznQW42rojLD6vUfYBuXUxZsauEXQz+1+V8kgTWZfvBzAqLmkPu+yndwzc3RUNakdF/If+prAM2Y4GZJ8cp2tO5HFQyvusAVZClL9sVWEo7mG/YAF8Rh+dIbq0IUdpxga6+0SmppQQbDkECi9n4NbUK4rXvzeJ+1vmUCFy0E/rgPFAZW+sse9w7hhawvYX1DSobOedTldyYsojfbjUvYlbD6HeTyoysfiDSsncIrNSCKSBi/wGqVQwTcKDIM4YVAYiuqxN3wWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/dBLOg4bDmJCyY3rQVuW3tplQoFLU6LHuylGJR3N+8=;
 b=WOgJNd6ehwav/2k7Km3A/C1rz/7gA/eL8yR2GXKUutVZ23z1mKSvOR1tFVPJSMsRVsn6Zallm5joS4s81RXlUMDjjeqzqEUJJUZtsK5Qf00cTkco6TQeG/G/Q0eZtjhhOnRN8v7oGEO+09TjV4j9Hs7sf603HjwAu5d7gkS7ThuBLxeJra7inzl/ErTPQbYoNpcXHCegs/hmdlU53cRUFZfhFXpIstuXQFIfCxN4xCXRI/FxSL/7Xgs6099pLjeR/JVNdz2OS1oHvYqjg3uXlAcM4sUK+VYgS36fpGLPweXuqSNf2owA2X0PUqxO76OiZWE2RpDCDVBMZDR+/TcGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/dBLOg4bDmJCyY3rQVuW3tplQoFLU6LHuylGJR3N+8=;
 b=jkdfk571st7tL2/5cNXIDidHbjLPhR0et5SgzWg6hwKbAgTGlrm3qhZgSSEkCZ3wDvjHIjgTGdQ8vqPXFzmczUjCBSLyxcaGP1RrppKf5rTJydS8WjbFPAMwVLmM8bDS7EavlKlLkT7VGuTDeecVRPH8ZQRrijIDz+5i+5TnRn0=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO4P265MB6187.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:279::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 12:01:49 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 12:01:49 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>
CC: "robh@kernel.org" <robh@kernel.org>, "aford@beaconembedded.com"
 <aford@beaconembedded.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "aford173@gmail.com" <aford173@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Topic: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Index: AQHacIc8pvVr4axcM0KRhQuvK3UiIg==
Date: Thu, 7 Mar 2024 12:01:49 +0000
Message-ID: <2cdbd8b216a37727c1996440f88229be05ee7efc.camel@imgtec.com>
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
 <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
 <CAMuHMdW5vWg=tpB9PCRXmdBmLtt0wNN9dOEN1Lp_N7R68jz0tA@mail.gmail.com>
In-Reply-To: <CAMuHMdW5vWg=tpB9PCRXmdBmLtt0wNN9dOEN1Lp_N7R68jz0tA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO4P265MB6187:EE_
x-ms-office365-filtering-correlation-id: acb35a49-4535-4073-3304-08dc3e9e5ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Spr+TfTOTrG37IxLQw7JQMHSH+JsB+CZhfrPJi4DnT5tQMotUV5JBVM66x/gZKwK4+6ZsiwhPN6gKZ7CaRx0JCERW4dei6iz+kFr4MeqRUIuUrSPeg8Ugbh31AkYuO+lLh1fKGz2wlhPOBq9Q5chSnNUfRC7Yp3cxoMSYGptGBgcwlj3wY05PmmGEK/iz65jwRL0iE6ill3dXtBhZJfHf/EIyeyqmk4wgdRxXOBbiKbrIwUX3UNgQTjJZDXj8w9N4rT2ezIKctf62KPxEWEJ/yxwoPyD59CPKOOG1uJvzp0jS7uYTWqHouQPzTeVin1cSqU7guawYmwQxJ3+BaZkMgYh7C3zgOUuXnXhDD/gNosRynJWD1DASipw3ktoHPgjPd1GeuJX7JbS6iq/GE5yxiUixnH/6A2kUYWrbsAseDHg4q7OzPGblDdWAXHKHTJsBxG7Obz8W+I92NcSuAxEvZDEFQAWagH10FgxOZX/LWbmfEFo0z2IK6yTARyukKTHcJm9fAAhzl1r9qPVDIrk2rW7r1oqQdK3qvZHNPaXI3Yty+uJkyT/48eud4dZx0I1ac9hkcx9uS5TRY0sRBEj7eytCBjoIAgRn3xNTcagUACY7FEbhfPOVVrk1B1M6iUZYKq61PlSjpZ6RKhcs2+SD8VQSHXMacvO8KKkKWIjfUU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zjhya0gyT3J6SHhtdTRQdXVsQzkxTGVtWWVXeXoxVlZsdVV0M0txV2lVTzBQ?=
 =?utf-8?B?Q2VsdmdyUTNkUDNRdVBtdTlEQzQvdERyOXZCZXBiMXE0U3NHWkMxTXd2TzlQ?=
 =?utf-8?B?YzRPQ3d3NlBVeGQzaWc0RCt0NUpLOVhoa2JWNEd4S01Wc2tFdG1oa2lXUnNy?=
 =?utf-8?B?TlNZamRLWjlSU1k1ZDJRSHBkNU5zZ2lzVTh2T3N2aEhKUnJZU1g1aXZQYWZF?=
 =?utf-8?B?K0Q5V0FtN2JCbTl2NmkvWEtoYkp0MEViKythdDkvaWNIaTVwLzFBNHI0bjlO?=
 =?utf-8?B?OHhwK2t0Rjh1UlYxRWZnMjFieWkyTm1WWVo3NlNEVzBadzk4NG5jOEJ0a2RB?=
 =?utf-8?B?R1Z6cHFGbGJEQWtrVlZJZ1ZRTHBpK0dhLzlBaUZOZ3hWeCtPdFVrZkpyTW1h?=
 =?utf-8?B?WEJlYU41MEIzZzNPelJ3SExjVUw5Zm84ajBJcTZkeFg2bnJYdy9UUW9NSllX?=
 =?utf-8?B?TDc3NGhmRU9WRmVvNUozcGhPT2c1djJOY0plZVNJeFd3SkxPdkYrVUN4VmIr?=
 =?utf-8?B?ZUM3WU9BNUw1Z1Ayb3lDaEVnZzJIdlc2Q05Ea0VLNWtiOW1JVTlBaFZPNmRx?=
 =?utf-8?B?Yks0Z2MxRTZQNWt1Mlg5UUQ3bXNQN1F4a3ZUcnREOWsxY25WOTcxZ2I2Tmkw?=
 =?utf-8?B?TTVTYm83TFRwSTlxZU5NNFlxQnJDMytXK0s0VVF0SEw4emM0OFZiVmNaWXBV?=
 =?utf-8?B?TzhZY2Ura1oyZ2R6MXdGR2FCUVJneldWWjhySzBsYTY1TThSM1FvMy9oUnd6?=
 =?utf-8?B?aGx0TEYvZUZoUGhIa3owY08yYS9MKzlMZ3lvZlliRWF1dTRjLytrU2NMNTc4?=
 =?utf-8?B?SCs3bGF0S3M2amlFWGRrWkYxUnFsOHNiYlI5YTJsSFFSTHVOVU1KSkt5M2Zo?=
 =?utf-8?B?UHJUMUlEUGlYS0tQbGpqVVZmQ1NIQkFFbnFLbFc3Z09XaGxneXJ3NWhqaXFj?=
 =?utf-8?B?cExuSHNpUXBtVllOb2dMcnB2UnpzdXo0cERsTFJRdGI5VSt3Y2pNK3pjSTJi?=
 =?utf-8?B?WU9yZTlvYVdyeHZEVXhlb0Vhd1c4SEVzOERmUHNkaVlHWFRDZWxKVkJIOS8w?=
 =?utf-8?B?aXlrZlFFSEEzS0M2eGIweTQ4THQwQzJ3ZDZYMGE3MlI3YUJ2U3c0YWxvVzZ1?=
 =?utf-8?B?d290bWxNdE1CcnRwZlFTaHhsZUxTRlBuS3ovN1RhcCtEM0Z1TmRZcTEyVXRT?=
 =?utf-8?B?MXIwYjVEd3UxcjNzeXgyVjNFejdLTmpHdDYweXlkVW9Oc3lYSE9OaUZRazNS?=
 =?utf-8?B?MlZHQjcxMlFFa2ZVa000YlRZMjNFRUFHVmE4dE1QTnBFL1lJempHVWFPK3Vx?=
 =?utf-8?B?SlVROTkzWUtJZVZIcGlyb29BQXozb3NhZWxQZnBiMDVtYm5DTHAyYjdJRXVt?=
 =?utf-8?B?d3hXVng3ZUpMOFZsaklPNE0vOFE3V2h0TXBMSUd4RC9FNVoraE9Td0w2bC9G?=
 =?utf-8?B?aGFtUCt5aGc0MGtxOUh0K0s5eFM3RU1oY05OcnhoQlFMbG43K3VQM2QwTHZa?=
 =?utf-8?B?aHMrMzQyeU1ldHFNODNJMGV5TXNjQTdiYWJ0NUZweWpWVnNDQ25BQXpOclg0?=
 =?utf-8?B?VHpGbSsvTklRcE04WFNWckhRTVdvUi9YVUw0SW9jRnhDYVZBQzJDUkx6OVBu?=
 =?utf-8?B?S2pSaGIreDJkOVhOOFl6SnBjQXBBOFYxRnF2YXhRc3lUQmRRUytQR3VieTBD?=
 =?utf-8?B?TFNwMjI5MHc4dEtGQk1EOFc1WEttcnF5WnEyK0U0MGp4a1BvYTFRQXdHV2ov?=
 =?utf-8?B?eHdkUW9oalJLaGhIYjlpTkl5d01ZUTZTM1BGbC84RmZVWUQzTG40SHBjVHM3?=
 =?utf-8?B?cm9Damw4OEVoOHBMdG5veDgwczlFUEFDZnVJdlhyNlNrY1ZuSDZLVjBZUCti?=
 =?utf-8?B?M0hBQjdLZUVGS3UyWTBzUGI3YitPaFMwMUM2Z0p0MlNFRXE0SStGL0R6SnRv?=
 =?utf-8?B?N3A0dlptbUNXYTg1MElVUktvVDFTemFqeGFzdWMzQWIrM2JkZW1DM0lLMktt?=
 =?utf-8?B?MkJ3QUxUZG85UHNaa1FuWG1WMVdla2dpNndOOC9QNnZTYkkzUUNZVnVhTTJ6?=
 =?utf-8?B?NEhvYzJkVzNrZEM5OTFhelZKakJCK0x5U05ncmRCd0tjQVhDRTZPY29nVW9o?=
 =?utf-8?B?R0N1dzZCeFc2SUxpWHZ1UzlncmQ0RjMxTmJENGhoYk1DcDA5ZWd1L1NFeEZu?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0268ED04CDAE2A4CB6B18730425771AA@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acb35a49-4535-4073-3304-08dc3e9e5ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 12:01:49.5287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OIxj4z+BW3m6DIXXG4EH48UT6ElEWfHXpC6N2YWIuzyaDuAuXRJ3APkQ4DlJVFFofM+skuV8leQvz1G7UXGFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6187
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: co7iiM8In7b-1-rsf-eHqLwX_w5X_4xP
X-Proofpoint-ORIG-GUID: co7iiM8In7b-1-rsf-eHqLwX_w5X_4xP
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

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgMjAyNC0wMi0yNyBhdCAxMjowNCArMDEwMCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBNYXR0LA0KPiANCj4gT24gVHVlLCBGZWIgMjcsIDIwMjQg
YXQgMTA6MzHigK9BTSBNYXR0IENvc3RlciA8TWF0dC5Db3N0ZXJAaW1ndGVjLmNvbT4gd3JvdGU6
DQo+ID4gSGkgQWRhbSwNCj4gPiANCj4gPiBUaGFua3MgZm9yIHRoZXNlIHBhdGNoZXMhIEknbGwg
anVzdCByZXBseSB0byB0aGlzIG9uZSBwYXRjaCwgYnV0IG15DQo+ID4gY29tbWVudHMgYXBwbHkg
dG8gdGhlbSBhbGwuDQo+ID4gDQo+ID4gT24gMjcvMDIvMjAyNCAwMzo0NSwgQWRhbSBGb3JkIHdy
b3RlOg0KPiA+ID4gVGhlIEdQVSBvbiB0aGUgUlovRzJNIGlzIGEgUm9ndWUgR1g2MjUwIHdoaWNo
IHVzZXMgZmlybXdhcmUNCj4gPiA+IHJvZ3VlXzQuNDUuMi41OF92MS5mdyBhdmFpbGFibGUgZnJv
bSBJbWFnaW5hdGlvbi4NCj4gPiA+IA0KPiA+ID4gV2hlbiBlbnVtZXJhdGVkLCBpdCBhcHBlYXJz
IGFzOg0KPiA+ID4gICBwb3dlcnZyIGZkMDAwMDAwLmdwdTogW2RybV0gbG9hZGVkIGZpcm13YXJl
IHBvd2VydnIvcm9ndWVfNC40NS4yLjU4X3YxLmZ3DQo+ID4gPiAgIHBvd2VydnIgZmQwMDAwMDAu
Z3B1OiBbZHJtXSBGVyB2ZXJzaW9uIHYxLjAgKGJ1aWxkIDY1MTMzMzYgT1MpDQo+ID4gDQo+ID4g
VGhlc2UgbWVzc2FnZXMgYXJlIHByaW50ZWQgYWZ0ZXIgdmVyaWZ5aW5nIHRoZSBmaXJtd2FyZSBi
bG9i4oCZcyBoZWFkZXJzLA0KPiA+ICpiZWZvcmUqIGF0dGVtcHRpbmcgdG8gdXBsb2FkIGl0IHRv
IHRoZSBkZXZpY2UuIEp1c3QgYmVjYXVzZSB0aGV5IGFwcGVhcg0KPiA+IGluIGRtZXNnIGRvZXMg
Km5vdCogaW1wbHkgdGhlIGRldmljZSBpcyBmdW5jdGlvbmFsIGJleW9uZCB0aGUgaGFuZGZ1bCBv
Zg0KPiA+IHJlZ2lzdGVyIHJlYWRzIGluIHB2cl9sb2FkX2dwdV9pZCgpLg0KPiA+IA0KPiA+IFNp
bmNlIE1lc2EgZG9lcyBub3QgeWV0IGhhdmUgc3VwcG9ydCBmb3IgdGhpcyBHUFUsIHRoZXJl4oCZ
cyBub3QgYSBsb3QNCj4gPiB0aGF0IGNhbiBiZSBkb25lIHRvIGFjdHVhbGx5IHRlc3QgdGhlc2Ug
YmluZGluZ3MuDQo+IA0KPiBPSy4NCj4gDQo+ID4gV2hlbiB3ZSBhZGRlZCB1cHN0cmVhbSBzdXBw
b3J0IGZvciB0aGUgZmlyc3QgR1BVICh0aGUgQVhFIGNvcmUgaW4gVEnigJlzDQo+ID4gQU02Miks
IHdlIG9wdGVkIHRvIHdhaXQgdW50aWwgdXNlcnNwYWNlIHdhcyBzdWZmaWNpZW50bHkgcHJvZ3Jl
c3NlZCB0bw0KPiA+IHRoZSBwb2ludCBpdCBjb3VsZCBiZSB1c2VkIGZvciB0ZXN0aW5nLiBUaGlz
IHRob3VnaHQgcHJvY2VzcyBzdGlsbA0KPiA+IGFwcGxpZXMgd2hlbiBhZGRpbmcgbmV3IEdQVXMu
DQo+ID4gDQo+ID4gT3VyIG1haW4gY29uY2VybiBpcyB0aGF0IGFkZGluZyBiaW5kaW5ncyBmb3Ig
R1BVcyBpbXBsaWVzIGEgbGV2ZWwgb2YNCj4gPiBzdXBwb3J0IHRoYXQgY2Fubm90IGJlIHRlc3Rl
ZC4gVGhhdCBpbiB0dXJuIG1heSBtYWtlIGl0IGNoYWxsZW5naW5nIHRvDQo+ID4ganVzdGlmeSBV
QVBJIGNoYW5nZXMgaWYvd2hlbiB0aGV54oCZcmUgbmVlZGVkIHRvIGFjdHVhbGx5IG1ha2UgdGhl
c2UgR1BVcw0KPiA+IGZ1bmN0aW9uYWwuDQo+IA0KPiBJIGd1ZXNzIHRoYXQgYXBwbGllcyB0byAi
W1BBVENIIDAwLzExXSBEZXZpY2UgdHJlZSBzdXBwb3J0IGZvcg0KPiBJbWFnaW5hdGlvbiBTZXJp
ZXM1IEdQVSIsIHRvbywgd2hpY2ggaGFzIGJlZW4gaW4gbGludXgtbmV4dCBmb3IgYWJvdXQNCj4g
YSBtb250aD8NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMTA5MTcxOTUwLjMx
MDEwLTEtYWZkQHRpLmNvbS8NCj4gDQoNClRoZSBjb25jZXJuIE1hdHQgaGFzIGV4cHJlc3NlZCBp
cyBtb3N0bHkgcmlnaHQuIEhvd2V2ZXIsIGFkZGluZyBEVCBiaW5kaW5ncw0KZG9lc24ndCBwcmV2
ZW50IHVzIGZyb20gbWFraW5nIFVBUEkgY2hhbmdlcy4gVGhlIHRoaW5nIHRoYXQgd291bGQgcHJl
dmVudCB0aGlzDQppcyBhZGRpbmcgdGhlIGNvbXBhdGlibGUocykgdG8gdGhlIGRyaXZlcidzIGBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkYCB0YWJsZSwgc28gdGhpcw0KaXMgd2hhdCB3ZSBuZWVkIHRvIGF2
b2lkIGRvaW5nIHVudGlsIHN1ZmZpY2llbnQgdGVzdGluZyBoYXMgYmVlbiBkb25lLg0KDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4NCj4gPiA+IA0K
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5k
dHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kNCj4gPiA+IGlu
ZGV4IGE4YTQ0ZmU1ZTgzYi4uODkyM2Q5NjI0YjM5IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kNCj4gPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gPiBAQCAtMjM1Miw2ICsyMzUy
LDE2IEBAIGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZjEwMTAwMDAgew0KPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDQwOD47DQo+ID4gPiAgICAgICAgICAgICAg
IH07DQo+ID4gPiANCj4gPiA+ICsgICAgICAgICAgICAgZ3B1OiBncHVAZmQwMDAwMDAgew0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3NzRhMS1n
cHUiLCAiaW1nLGltZy1heGUiOw0KPiA+IA0KPiA+IFRoZSBHWDYyNTAgaXMgKm5vdCogYW4gQVhF
IGNvcmUgLSBpdCBzaG91bGRu4oCZdCBiZSBsaXN0ZWQgYXMgY29tcGF0aWJsZQ0KPiA+IHdpdGgg
b25lLiBGb3IgcHJpb3IgYXJ0LCBzZWUgWzFdIHdoZXJlIHdlIGFkZGVkIHN1cHBvcnQgZm9yIHRo
ZSBNVDgxNzMNCj4gPiBmb3VuZCBpbiBFbG0gQ2hyb21lYm9va3MgUjEzIChhbHNvIGEgU2VyaWVz
NlhUIEdQVSkuDQo+IA0KPiBJQy4gQW5kIHRoZSBiaW5kaW5ncyBpbiBbMl0uDQo+IA0KPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZmQwMDAwMDAgMCAweDIwMDAwPjsNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDExMj47DQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSI7DQo+ID4gDQo+
ID4gU2VyaWVzNlhUIGNvcmVzIGhhdmUgdGhyZWUgY2xvY2tzIChzZWUgWzFdIGFnYWluKS4gSSBk
b27igJl0IGhhdmUgYQ0KPiA+IFJlbmVzYXMgVFJNIHRvIGhhbmQg4oCTIGRvIHlvdSBrbm93IGlm
IHRoZWlyIGRvY3MgZ28gaW50byBkZXRhaWwgb24gdGhlDQo+ID4gR1BVIGludGVncmF0aW9uPw0K
PiANCj4gTm90IHJlYWxseS4gVGhlIGRpYWdyYW0gaW4gdGhlIEhhcmR3YXJlIFVzZXIncyBNYW51
YWwganVzdCBzaG93cyB0aGUNCj4gZm9sbG93aW5nIGNsb2NrIGlucHV0czoNCj4gICAtIENsb2Nr
IChaR8+VKSBmcm9tIENQRywNCj4gICAtIENsb2NrIChTM0Qxz5UpIGZyb20gQ1BHLA0KPiAgIC0g
TVNUUCAoU1QxMTIpIGZyb20gQ1BHLg0KPiANCj4gWkcgaXMgdGhlIG1haW4gKHByb2dyYW1tYWJs
ZSkgM0RHRSBjbG9jaywgcnVubmluZyBhdCB1cCB0byA2MDAgTUh6Lg0KPiBTM0QxIGlzIHRoZSBm
aXhlZCAyNjYgTUh6IEFYSSBidXMgY2xvY2suDQo+IE1TVFAxMTIgaXMgdGhlIGdhdGVhYmxlIG1v
ZHVsZSBjbG9jayAocGFydCBvZiB0aGUgU1lTQy9DUEcgY2xvY2sNCj4gZG9tYWluKSwgYW5kIGl0
cyBwYXJlbnQgaXMgWkcuDQo+IA0KPiBBY2NvcmRpbmcgdG8gdGhlIHNvdXJjZXM6DQo+ICAgLSAi
Y29yZSIgaXMgdGhlIHByaW1hcnkgY2xvY2sgdXNlZCBieSB0aGUgZW50aXJlIEdQVSBjb3JlLCBz
byB3ZSB1c2UNCj4gICAgIE1TVFAxMTIgZm9yIHRoYXQuDQo+ICAgLSAic3lzIiBpcyB0aGUgb3B0
aW9uYWwgc3lzdGVtIGJ1cyBjbG9jaywgc28gdGhhdCBjb3VsZCBiZSBTM0QxLA0KPiAgIC0gIm1l
bSIgaXMgdGhlIG9wdGlvbmFsIG1lbW9yeSBjbG9jaywgbm8gaWRlYSB3aGF0IHRoYXQgd291bGQg
bWFwIHRvLg0KPiANCg0KVGhlIHN5cyBhbmQgbWVtIGNsb2NrcyBhcmUgb3B0aW9uYWwgaW4gdGhl
IGRyaXZlciBhcyBBWEUgY2FuIGJlIGNvbmZpZ3VyZWQgYXQNCmludGVncmF0aW9uIHRpbWUgdG8g
b3BlcmF0ZSB3aXRoIGEgc2luZ2xlIGNsb2NrICgiY29yZSIpIG9yIHRocmVlIGNsb2Nrcw0KKCJj
b3JlIiwgInN5cyIgYW5kICJtZW0pLiBTZXJpZXM2WFQgZG9lc24ndCBoYXZlIHRoaXMgY29uZmln
dXJhYmlsaXR5IGFuZA0KZXhwZWN0cyBhbGwgdGhyZWUgY2xvY2tzLg0KDQo+IEJ1dCBJTUhPIHRo
ZSB0d28gb3B0aW9uYWwgY2xvY2tzIGRvIG5vdCBtYXR0ZXIgYXQgYWxsICh0aGUgZHJpdmVyDQo+
IGRvZXNuJ3QgY2FyZSBhYm91dCB0aGVpciByYXRlcywgYW5kIGp1c3QgZW5hYmxlcyB0aGVtIHRv
Z2V0aGVyIHdpdGgNCj4gdGhlIGNvcmUgY2xvY2spLCBhbmQgUzNEMSBpcyBhbHdheXMtb24sIHNv
IEknZCBqdXN0IGxpbWl0IGNsb2NrcyB0bw0KPiBhIHNpbmdsZSBpdGVtLg0KPiANCg0KVGhleSBt
YXR0ZXIgaW4gdGhhdCwgaWYgcHJlc2VudCwgd2UgbWF5IGJlIGFibGUgdG8gbWFrZSBhZGRpdGlv
bmFsIHBvd2VyDQpzYXZpbmdzLiBUaGUgZHJpdmVyIGRvZXNuJ3QgYXR0ZW1wdCB0byB0YWtlIGFk
dmFudGFnZSBvZiB0aGlzIGF0IHByZXNlbnQgKGFuZA0KY2FuJ3QgZm9yIEFNNjJ4IGFueXdheSks
IGJ1dCB0aGlzIHNob3VsZG4ndCBpbmZsdWVuY2UgdGhlIERUIGJpbmRpbmdzLg0KDQo+IEp1c3Qg
d29uZGVyaW5nOiBpcyB0aGUgYXZhaWxhYmlsaXR5IG9mIDEgY2xvY2sgc3BlY2lmaWMgdG8gQVhF
LCBvciB0bw0KPiB0aGUgQVhFIGludGVncmF0aW9uIG9uIEFNNjJ4Pw0KPiANCg0KVGhpcyBpcyBz
b21ldGhpbmcgVEkgaGF2ZSBjb25maWd1cmVkIGFzIHBhcnQgb2YgdGhlaXIgaW50ZWdyYXRpb24g
Zm9yIEFNNjJ4Lg0KDQpUaGFua3MNCkZyYW5rDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDExOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzRBMV9QRF8zREdf
Qj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDExMj47DQo+ID4g
KyAgICAgICAgICAgICB9Ow0KPiA+IFsxXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2ltYWdpbmF0aW9uL2xpbnV4Ly0vYmxvYi9iMzUwNmI4YmM0NWVkNmQ0MDA1ZWIzMmE5OTRkZjBl
MzNkNjYxM2YxL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kjTDk5My0x
MDA2DQo+IA0KPiBbMl0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ltYWdpbmF0aW9u
L2xpbnV4Ly0vYmxvYi9iMzUwNmI4YmM0NWVkNmQ0MDA1ZWIzMmE5OTRkZjBlMzNkNjYxM2YxL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiAN
Cj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
