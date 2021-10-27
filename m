Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966AE43CD3A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 17:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6A46E8B2;
	Wed, 27 Oct 2021 15:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80115.outbound.protection.outlook.com [40.107.8.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B796E8B2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crfR6/3UtKPUx3VTVWkJ+vXA1PKTY/coVgI8LViGFHMID7NM4r+/QL3qj59GXFycc+9OhVHMBohiJM+k+wVVGoE5lxKV1GHddZ311wV+ltd1hLfwtCjemhQE5FIJIIsTDY+Mxty+lU6iaAf9KCquUflfrHKu5lH/LEV20DVKPVkHo0DBO1vHUcAb5nsHghE9RVpc0BtBUgfZzZd006PcUcXZycJLmv28FBmrhiUbqT5bOWsmr6Q9lf3LFCktDhFkB+yH3HHErada+fJcTZUyErt3b2NUb4G9Q4wgiaSiDIKIDlL8+bprZyOXLkNpaXgQPIYKtZThGQbY1rvQX0fZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGYVRu9fwwZR0hJkBJZPQCPz0coQlRW6gQhEflLTcVA=;
 b=fq5Voy2pez2Ti2/GrL/xT0/h555uIyBOmYSLVJkwKbiEhW8xS1ZLGcPzNdTM/TXt9OW73skV0sX5opQ0Rtxzf99+NUIDpv+jSRG+EXXr2Jn5W1/HxvsL9AbDVHNCA/FYFV1gPWjucXZ7R1+R3M2t+6mfICtf8jQSD28rCJXc1T4pB4gXd+NGmXbpRLRI2xmtXEO9BWo7deNBbgvk/nCSDYazgrNPoLNj+Rsi5TDQpWtOJynWEZ6UKIm0UbfWResp+VSSWRYAk2CNzXf7x1+D4OTEXLavsYlcTmqYAHr850uJnW/keWQL77MjMnkjfqoWe3hnU7wq6D1xbbjQmL0WrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGYVRu9fwwZR0hJkBJZPQCPz0coQlRW6gQhEflLTcVA=;
 b=pGHgBYST35TSwXOmbXv/QSn+iKJWY/M8Ow2fbQgjQJ85dmwpkU+vaK3FAFFRPEPLDhiPC0UwNEkftlUydWxtDBGEa2NI+JL+JzAk+pvMOyOPM3Tbw+A77hTFNPp8n/jR2cgR0nF0AdWiwLllrc5FxzEMUeBhd5OH+hOHg2jfjD0=
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com (2603:10a6:10:55::32)
 by DB6PR0501MB2181.eurprd05.prod.outlook.com (2603:10a6:4:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 15:13:38 +0000
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::91e8:e960:243:da70]) by DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::91e8:e960:243:da70%5]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 15:13:38 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "airlied@linux.ie" <airlied@linux.ie>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap
 from namespace DMA_BUF, but does not import it.
Thread-Topic: ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap
 from namespace DMA_BUF, but does not import it.
Thread-Index: AQHXy0U4FC4V6ZmH5kqpsHl+5u0OvA==
Date: Wed, 27 Oct 2021 15:13:38 +0000
Message-ID: <8c6c30ad8997069f893588d8bd52f31e1d47506b.camel@toradex.com>
References: <CA+G9fYsOdhqbgRwuV7RD5k3Wh3n_Cb_EmMnkYOJ+4wZi-7MgrQ@mail.gmail.com>
In-Reply-To: <CA+G9fYsOdhqbgRwuV7RD5k3Wh3n_Cb_EmMnkYOJ+4wZi-7MgrQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d7c36bb-a3e7-4c40-6a6f-08d9995c5ac3
x-ms-traffictypediagnostic: DB6PR0501MB2181:
x-microsoft-antispam-prvs: <DB6PR0501MB2181F527BA750764EFA78CA7FB859@DB6PR0501MB2181.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdvfumQZcPeJWnIGik1JLr2kAbzFzav3s+lAXGDOzaMLql0aqWdYkcmcXkTj+UtXZmiOyqZ6w/oL7ooknwDRtVFwY02E4MOiATDvN0sK90QFuZnJwJwaxhuOXaAHBBPRuVVHaVY6Sm6TWfnjQ8pDRdgp+6W2ak/jXeUYwmxALBjGYno1OZQcjtgf16meYuDJwAHGB0XLz0Ajn7vheOVm9vWW6qcxdXAj1BEXmGxBKrqq9UujhVeM6OxXxSk0r55/vyXiYoM9D5kVYprel7O19+FqWrAyS3bQMjcKMqL/QxspgipW6LAIi4lIxS73bqahAw4ydvwkVd62zZu0PUPjKD3ftmYlOlYT0xh1+pqIvHtcuEKcGCAc3DhGPW5/GFMpdsVgxjbrU7bJ4PbMIpR3GVDLnCiiT6N7K5s2ittuZl5zmgBKOqAuZ/zaDmwONyru4/LqWQk0Qi78gJ/mWUDLqQqqmvK8EnzHRwY/JeDCJGYrUnLFnGvh3IFLF0snpmGz26C1chpN/1DfuOwlBg9BP9p+N85q2z92jCeHhD3W5lAoHQMa4gKGPnOEWn51n4ok0hmc0Oa4nOiQSvRwf7MJnUlO9v39Nbn4F7hiJoq08ebJCzqngp9jhovaRWfOx5pFCWIR5AvVo/pisApnj8M2vBI8GfPrH9kjFWBVwZPW49f0KYOERL7BexMaO5FwQ/ci+b62ShMmxSlVZYHIZTRgPO5M7BPYc+EoKSU6uqijF8rHtXo1Vb7jNVjQI0Hdw+YtNHgzNpQAXk2HX3kHJU8Lj/kHeGE3FjARdHXaOLau+hs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB5431.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(6506007)(54906003)(7416002)(122000001)(8936002)(86362001)(38100700002)(66556008)(26005)(4001150100001)(2616005)(83380400001)(8676002)(4326008)(36756003)(64756008)(5660300002)(44832011)(71200400001)(186003)(966005)(38070700005)(316002)(6486002)(91956017)(508600001)(76116006)(66446008)(66946007)(110136005)(6512007)(2906002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmdvWEE5NkJRNzE2WUtObjBvaGhDK24vTzh6cncyNnA5V2FaRGFNdFdnRUl3?=
 =?utf-8?B?RCtiUWxzamxxL0t3N2NyNVZLcXNVVkUxaDUvUVYzTDFUaTI2dHBMN09pZERt?=
 =?utf-8?B?Q3M4L2tnN0Zzb2dWc1pKd1RzY0tmTTF4Qm9kWC9oeTI3RStYeXRrSS9vMEV6?=
 =?utf-8?B?QXlQRVBhTU9kV241cHcrRjhhM1M5Um1FcTBhakJvZlBiRG84cGJJOGNraERF?=
 =?utf-8?B?d1JTZ0hNOTFpZmxXRXJ0UjhvQyt4SzcwK2ZLZUpoYzhxdkdhdXg1TDZ4SjJl?=
 =?utf-8?B?VlErZHFQa1JpTk1FUHNTeW9QcnhGZzIzY09JMGZ2QVo4U3dpUkNSOER0MFQ4?=
 =?utf-8?B?bE56ZXRXaDJVWCtvd0dPcmZCZzdhMCtnY2tmTWR4N1dNUDl3VmgxWVE0Ylhw?=
 =?utf-8?B?MDFocXEraGlWOGh1NmZ4RmMvaitnQ0VJdmVqTWJ4WVZPSDJZWTFNN2F0TGt2?=
 =?utf-8?B?VThqNnZGa0ZSeFhMNDVsMjJHckFwek9FWTRJU2h0cXZJREY3bTFlWDNLTUFr?=
 =?utf-8?B?Q2RCdEtRdjZhcHphVk1LajFPcVliWjM2SFdzVlduVFF0MWI0UFoxcisyQmxh?=
 =?utf-8?B?R1JwQVBNVzFHM1QrVkRUYnc3M2Q3YVBWVnVWSi9uSkU0T0E5MzFQZDFSTjZD?=
 =?utf-8?B?RmxKV3NDSTl4aFVoclZybUo2RkU5ejZlbWgwUDBnYjZrTW83aHBzQnVwZ3dx?=
 =?utf-8?B?b2d2SnFsaHVHczhyZVlhQlR3MXF0bUZDVE9XQkwvd2d0OXlhM1FWNVZRUXk1?=
 =?utf-8?B?anFLc0RncWZqMnh4ZWpQQVpRNUs5MVNrWmNaeERNTXBtTVlRSmhtMlg5Ti9I?=
 =?utf-8?B?TjA3ZXlvNS9Zb2UwK2toYnlTb0pxYjc0YW4weVZSR3ZhbTkxS0ZZdWovNTk2?=
 =?utf-8?B?UEp6Q1dCTHBmS3REb2F4Slh3NnJPSVlLSDA5L0M3VnQ0NkZFOFZtVGFnNnpG?=
 =?utf-8?B?a28rdW50VGRsb2YvS1RwbVA1V2JibnlUZDMrVmEzUnBZQWFHSmxSOWttWXE3?=
 =?utf-8?B?NHhLL3R5WEVTQ3cydUpycUtQNTROc2F5ejRnRHpCZWE0aEt5VVltNGRBbkF2?=
 =?utf-8?B?K2xTdUVZSFJHWS9aZis5MkFXM3Zad0ZUWGtHa2xTUXZrU0dOYWZHYVdKWldR?=
 =?utf-8?B?dnVVbkd4aHN3MWM5YmtPYlp1Vk1PaWNYZkN5ZFFMMnFPLzZLMXdIWXQrVDJW?=
 =?utf-8?B?RlJQaGVGUjA5UFFwdjVmMTROdGtUSEN0SnFYTUdqdGpXRUdrM2hsTHBnYXlo?=
 =?utf-8?B?R3pwcHp4alpLaUZDb0RVRjBmZ2I0M0h1b1oxSjBGUWJja2ZzZkNvWG5lVFhB?=
 =?utf-8?B?T0RBTXZLeUE3MlJMbjYyc1UwdGFIQVd1SnFSaUV4SUdaQWFlYjhrT3ExNGRQ?=
 =?utf-8?B?alowRDdZbmVwekhmc0Y1R1dCc1cyNmVGbUFWN1NCVGhrYzZ3dDFQMHpVWTFF?=
 =?utf-8?B?U0xRYS84WXg2bzdHUm41a21lZEN0cmNsUzhkUG0yaG50TGdCbzVwdktNd2RM?=
 =?utf-8?B?MWVPUFdqVm5HVno3QkNNaWJEMWxGcW1XZHdDYis4SU1nalc1QzlMN1Yybm0x?=
 =?utf-8?B?RkJnK1pFS0VQSWRLRElBQkZ2N3dWbDBhSGJCREJJc21tVnRpSmdDMm9mMVJm?=
 =?utf-8?B?OVowL1NFQW9zNkl6Rzh2TjVIb3BGRDhjUzRHTnd6NFloTGFoZGJNYXA4YTVT?=
 =?utf-8?B?UjhNZVhxbVBxVWt2OU15bmdWNTdjbmgzUkJjOEtqRkJGa1RuNU8yTDVRK2VV?=
 =?utf-8?B?b1ZTVkFWeDdlNlRHYk5SUGIzN2l4ZjJyemE3UmlIRWNFNkl2aDFSdFQrQW5x?=
 =?utf-8?B?Zjh4a2VUb3E5d0RrVnRqWm00N25iTTg4ZDNyS29aSFNlUVJtUVhKeTdpUzEv?=
 =?utf-8?B?QUdFNWhlTnhEVU1iWUdzaXZ2MEFxcUhvY24vV1ZyZ2FrbFkxTWZ6UXFkRi9L?=
 =?utf-8?B?NnZVMm9vV0hIanZOSmZtZ2tGOHIwYlIwa1BJSld5MHh2blJ6bkVsdkxCMjNh?=
 =?utf-8?B?di82M2N6WFFBbUpLNnFYblBUb2twNXE1ODljbmtKZnBrZUZEeTBwM3Q3NE4x?=
 =?utf-8?B?UnRSb29jY3VjYjBxWVZLWVlTQm5oWWhOcWlHQlNXbUZDVTh6WTJUdWpORnRy?=
 =?utf-8?B?d1paVnEzYytucTVZSitGN0J2Mzg3OUdFR0pVZ3BieVlFeXFmN21EaFRBenIw?=
 =?utf-8?B?QkZjVkplcGEvRXBSWGZMV294azc2RmdVWmhZRUVtOW1ia1RpRnpUdmRNL0Fw?=
 =?utf-8?Q?2AY9+S0GbZDKNJ5VGsZnhedasv4U2HBzc5zz+sU6ns=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70AACD7B662E684FA5AF584AF3A6BBDF@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB5431.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7c36bb-a3e7-4c40-6a6f-08d9995c5ac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 15:13:38.7113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSi0hGbXqXy35ZWpOg51UWjPnsbsZD3PKRsYiXKSP3VYBgNJvPGmnngewri5mF28crUq8KGqF/VDrSyhuMGqV89mwzQzfgr7EKe5AYvl2lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0501MB2181
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

T24gV2VkLCAyMDIxLTEwLTI3IGF0IDE4OjE0ICswNTMwLCBOYXJlc2ggS2FtYm9qdSB3cm90ZToN
Cj4gUmVncmVzc2lvbiBmb3VuZCBvbiBhcm02NCBnY2MtMTAgYW5kIGdjYy0xMSBidWlsdCB3aXRo
IGRlZmNvbmZpZw0KPiBGb2xsb3dpbmcgYnVpbGQgd2FybmluZ3MgLyBlcnJvcnMgcmVwb3J0ZWQg
b24gbGludXggbmV4dCAyMDIxMTAyNy4NCj4gDQo+IG1ldGFkYXRhOg0KPiDCoMKgwqAgZ2l0X2Rl
c2NyaWJlOiBuZXh0LTIwMjExMDI3DQo+IMKgwqDCoCBnaXRfcmVwbzogaHR0cHM6Ly9naXRsYWIu
Y29tL0xpbmFyby9sa2Z0L21pcnJvcnMvbmV4dC9saW51eC1uZXh0DQo+IMKgwqDCoCBnaXRfc2hv
cnRfbG9nOiBhZTUxNzkzMTdlNzkgKFwiQWRkIGxpbnV4LW5leHQgc3BlY2lmaWMgZmlsZXMgZm9y
IDIwMjExMDI3XCIpDQo+IMKgwqDCoCB0YXJnZXRfYXJjaDogYXJtNjQNCj4gwqDCoMKgIHRvb2xj
aGFpbjogZ2NjLTExDQo+IA0KPiBidWlsZCBlcnJvciA6DQo+IC0tLS0tLS0tLS0tLS0tDQo+IEVS
Uk9SOiBtb2Rwb3N0OiBtb2R1bGUgZHJtX2NtYV9oZWxwZXIgdXNlcyBzeW1ib2wgZG1hX2J1Zl92
dW5tYXAgZnJvbQ0KPiBuYW1lc3BhY2UgRE1BX0JVRiwgYnV0IGRvZXMgbm90IGltcG9ydCBpdC4N
Cj4gRVJST1I6IG1vZHBvc3Q6IG1vZHVsZSBkcm1fY21hX2hlbHBlciB1c2VzIHN5bWJvbCBkbWFf
YnVmX3ZtYXAgZnJvbQ0KPiBuYW1lc3BhY2UgRE1BX0JVRiwgYnV0IGRvZXMgbm90IGltcG9ydCBp
dC4NCj4gbWFrZVsyXTogKioqIFsvYnVpbGRzL2xpbnV4L3NjcmlwdHMvTWFrZWZpbGUubW9kcG9z
dDoxMzQ6DQo+IG1vZHVsZXMtb25seS5zeW12ZXJzXSBFcnJvciAxDQo+IG1ha2VbMl06ICoqKiBE
ZWxldGluZyBmaWxlICdtb2R1bGVzLW9ubHkuc3ltdmVycycNCj4gbWFrZVsyXTogVGFyZ2V0ICdf
X21vZHBvc3QnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IA0KPiBSZXBvcnRlZC1i
eTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPg0KPiAN
Cj4gYnVpbGQgbGluazoNCj4gLS0tLS0tLS0tLS0NCj4gaHR0cHM6Ly9idWlsZHMudHV4YnVpbGQu
Y29tLzIwNVNBVTE1OUowZzZsU2xSUlMxMW81aEh5WS9idWlsZC5sb2cNCj4gDQo+IGJ1aWxkIGNv
bmZpZzoNCj4gLS0tLS0tLS0tLS0tLQ0KPiBodHRwczovL2J1aWxkcy50dXhidWlsZC5jb20vMjA1
U0FVMTU5SjBnNmxTbFJSUzExbzVoSHlZL2NvbmZpZw0KPiANCj4gIyBUbyBpbnN0YWxsIHR1eG1h
a2Ugb24geW91ciBzeXN0ZW0gZ2xvYmFsbHkNCj4gIyBzdWRvIHBpcDMgaW5zdGFsbCAtVSB0dXht
YWtlDQo+IHR1eG1ha2UgLS1ydW50aW1lIHBvZG1hbiAtLXRhcmdldC1hcmNoIGFybTY0IC0tdG9v
bGNoYWluIGdjYy0xMQ0KPiAtLWtjb25maWcgZGVmY29uZmlnDQo+IA0KPiAtLQ0KPiBMaW5hcm8g
TEtGVA0KPiBodHRwczovL2xrZnQubGluYXJvLm9yZw0KDQpJIGFsc28ganVzdCBleHBlcmllbmNl
ZCB0aGlzIG9uZSBhbmQgd2lsbCBzZW5kIGEgZml4IHNob3J0bHkuDQo=
