Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782D74CE5D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C19010E1E7;
	Mon, 10 Jul 2023 07:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDF710E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLnxKgobCjXhFSTlLOtwAwOLYvFYMlFNrdrpJ5VzaOK5Y5EqNas7uLaY7hhqLFuZAdjsIN+Or/k2w93/NVcW8OT4RAbz7AuCozm28YoeJ+q+Uq74iLPRA86kbfKEZ3C8JFXCCt5n0nhWgI20KM8pFuhBkMb53ooJDaxDSr4y85Xu63vack2AmaWDRaWHj6ctDP10kqdn819xArwHy5+UC+x85CKi9OlzfpFQDRqZTp1dOTk8tWHHfY9FHd2SUY25vMBOi+AHDbhnXLdAoaBRRzC81QlgzjPF33al7vNs4drGwDmaQdCS1XapbOvweqMpymUVhfeMgrqwZ18VBAQM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz9cqCpkmaYjJbIw/3N9U/W9/JnB2J9rRruPZs7zj8A=;
 b=cgvmZmCApYCQHDj3mept5dyVSoCCU5mvZDqQDoiaKI00vMekHQEm0DSBbGY8mEyM6f3nMN42Inyt45qwEy/h96iHKzTASB7lHRcFX4CzDRElwGK/cdiDsjqtcOt/9n2WPDcV9ohXzunL8z9bwBUXuKRWiCEEXL9HR/2NannmnYOwTlYXcF741oC0PxTiJxU03bHHHf4dHk/j3qEWEd3/pxCpZeJf1c4SOTn1zL+Ki6shtOy9CT+Digvc1k/uu/9zCISaaV7gU0ZDxw5FtkmiDxVCaCKQAibLZH70i8g0IdKHZF/XXnnriFr2Nmny3nttiyZXWw9jleuiwCsrYrMeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz9cqCpkmaYjJbIw/3N9U/W9/JnB2J9rRruPZs7zj8A=;
 b=R2TeSxUhKsQA0gMuhcQgYO7YBsb8diSRSfgK3dpfvixAYH2bGOg7vsUv63ucqupSVKVa0m+QuiSbh+QuIgShigxfA/SRX+CGlN/avCmzKjwM/SzMHKUVdaCsDhvImG2JqjCnjuemXe1BqHJZg5zG3/AZlEU22vF7QCIZAkmE8h4=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8398.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:28:49 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 07:28:49 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: RE: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Topic: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Index: AQHZnyaWSldT+9YfOk2MiOGSER4/uq+VJu8AgB2DVsA=
Date: Mon, 10 Jul 2023 07:28:49 +0000
Message-ID: <PAXPR04MB9448FF24841F6FB62A314C78F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <ZJLdYlhnLVgK8J8r@matsya>
In-Reply-To: <ZJLdYlhnLVgK8J8r@matsya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM9PR04MB8398:EE_
x-ms-office365-filtering-correlation-id: 7640c8f5-ccc7-4d18-1ff8-08db81174e1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yqNX7CtuVjF7aMIFSVfneFVKWG69QtgAxvnUZt3IPpwSa3+QXMmkP+wVzIQ6ZUVBf7gcdqHXF4eFo5wlnZH+YQhJe+V8ClMO1/vQJNmB5UUeZQ7kB5A7790C2eeklVZNQa6B28zpX+FJOXUCRYek0nWG9yMYQ6TNEhXVoKRMQNsYkTDfLGek26ClEapZ/KU3TaC88HXLFZDJD7Nw98pt7xxDtoUCnJxbkOkb0+01s8cOuLk8ek1LqmW4ZJr3xRwic5Di3oEc5zefYJ0LojZSZp3bu/VhF0EvAEXBXGel+Y97LvWIOLGSj+jOl0Qiry3QDfWnwEf4IFx01woWSwxwsmQLFKLm0U8IEBNvAHtvOfy/lWCdtZ52dDrREcXaqYW93yG9LWEpHw8ne7L0+uGgXaefZMf/BRIlb3eAoy5lvyhSu2fhwZdU3YV49ontG7u3Fy+FLgTnBSG3wWfj5LGfBrIHG8DkgbhbewULyERaS8s88RXBSiNFL5+SJfKKGZg739bkIiXey6D765Jdcq1THdq6cVhLknZiPfRzBV2bGM5w6jYkTlzRro5rve22PqXBJhrUFOf9TJ1DCJfuEVrg4Cfpx2F8F2EdD/ME6gARm1vBmn9GtPEfsOe5Z+ApU22z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(38070700005)(33656002)(55016003)(71200400001)(7696005)(54906003)(76116006)(122000001)(9686003)(53546011)(6506007)(186003)(44832011)(7416002)(5660300002)(52536014)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(64756008)(66446008)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TEFSaFU5aUZJbGp6QmUreVRNcVNtQ2R4Q1UvWEFaQ1FEb1BsTWV2M3g3Vmp0?=
 =?gb2312?B?aFovQ1pIc2RMZVNoTzhrSkwzcFdFM3FMZmdxR2JqUkdNRkIwZkR3Q1NOcXRN?=
 =?gb2312?B?ZFlzd2Q0d2JGeGpCbEFzMjhZWVRQR3RSb1VOaDJGMS9xRjBsUzZ3VXY4RXpK?=
 =?gb2312?B?WTlrQXppVTN2clhDQnNLOE5wdVVFUFNmSGxHOWl5ZVRhZ3lBUjh5bVlQWmls?=
 =?gb2312?B?U2lYSlYyc2RlUXZETUppcjd4cFozb2daN1dZam43djEwVEdSeVY3RnpvT0g1?=
 =?gb2312?B?QmJYMG94UXZwZzNmRk1vZHp4U3FlbHdEMjZjbHozaHZUMDF3Vk1Na25rc3VU?=
 =?gb2312?B?NitEcHJSNW53UmdRR3ROYTdGaFUrN1hFdnRCQzRGajdXLzVXT3E1Y0ZmVXhX?=
 =?gb2312?B?TkhhemtxcnpQNVFia2ZBS0dVdjREdnFYUXc5UWNkN1UvMmtFVjdWanhIa2dP?=
 =?gb2312?B?VkF0b1BXSnpmLzZTd0RSWmZLRXJxV2phSWlhTnRHT0ZlL1R5amVtWndtQll4?=
 =?gb2312?B?TGd2aFJBMWkvM3ludmFBdzh1RlRmaUQ4bml5UkdDNVZsTTk0dmFuaDNhWTVM?=
 =?gb2312?B?MUtsSTNvN1hmekYyeTUwSVZZaFFIMGYxQUFwakhLRHV4WjNIRDZVSGg5b0tl?=
 =?gb2312?B?RU16Z0M4SmlkZ3pNWDkwbHdYQlI4c0syNnFGVjVxQWUwR3V1WmNYRW96OVk0?=
 =?gb2312?B?OWdBMjc4bkNtdWVzSG5qUXEvc0M4ckoxNWR1ZlQvU0NNVi8yOFdzbnZ4bkZm?=
 =?gb2312?B?clltVDd4MXNMcWZYejFrTUh1MHB6aUhVMXB6U3l4L3FrZ05GbGk2N1IxQk9m?=
 =?gb2312?B?WUdWd3g1bVh4K2xiQm5yNXFJUmcyWkFvWFdVNjdQaWlpQ0c0a3Zjby9Zb25t?=
 =?gb2312?B?TXVHT2V2VkZHVmpjbGtXWThpYU5jNU41L1RFdHdjZTNWUnUyTHEyNDYzbXZB?=
 =?gb2312?B?NTlEcEp1UDdOSVEvNWJKcyt0dnRYTGZxN24rTzRiK0pzdFNGQXpLVDZOSUFk?=
 =?gb2312?B?Y0t5U2ltNlRNNlUvdzFtZ21ZQWNyb0VJSDRxcnQyRUNqVld1dnVwbi9weVpT?=
 =?gb2312?B?K1ZSdHBlRWlNQjV1WHVtd2VicjNnNG5nRmNYLzNya3VkRmhLUG5kd0JHekNn?=
 =?gb2312?B?QXczTG9XU3l6WmpQSXphK2N6cEJYRy9KTE1xdlY1Q1lhYmI0Tkh2Q3RCK1BQ?=
 =?gb2312?B?UDlhdzZSN2pVTnc5c1VNUmZzbzRxeXlaV21SaWRtSWZaaFdLNlhRWDBNM09O?=
 =?gb2312?B?YmxhT1Nwcng3QUZXWjRPUis5MlpUaTFYMlMvaStOQ3J5ZEFkeUNDSHVjQk55?=
 =?gb2312?B?dVhsZDVUdlhoVVEzRlZ1NWVJQVQwcXovVVZnWjEwQ3o2S0pVZ0NLNCtCZTdU?=
 =?gb2312?B?ZjdjZCtJaVYzTENCYTU2YU92TXF3TGpmdWdWaWRoYWlHbTVUSmpmWDFDd21h?=
 =?gb2312?B?c2pEZGd6WXpaU0ZMUWlwL3JETXhhQXRZZGdqaWRvVE9BNHBkVWRaSVoyam9y?=
 =?gb2312?B?ZFZETkFXNzNWVFpWOVdiWFlYaUQrNkN0K2t0TkJjMnhiTGJQZ3ZyYWpzR1Vj?=
 =?gb2312?B?bE1mZ1c1RFdVcExGV0RmN2ViMzF1STFqQkhocm9ra2JVMmt4ejRhWm85a0tU?=
 =?gb2312?B?ZVplZGdQSDlsTm9abnV4QVVHR1RJTUtZRGp6b2xIeGw1bmdmVVVxWWt1QmE2?=
 =?gb2312?B?cVBRQUQySThsMW1DVDYwb2xJcG9XYjQ5cldiYUd4R1NmWitxM3FJMWIwY2JK?=
 =?gb2312?B?Y3RYVFA0aThUYlU3QzQ5eS9ydFhOdUlhTVpKaHJSRzg4NFpaRExuRFBDT2Q3?=
 =?gb2312?B?NDRQRCtBakJGVng4Z0sxUnJYUFBzeEhhU3k3bXMvZWJqd3pGVHdFa1BnZldh?=
 =?gb2312?B?am5FM0JXeGNTTGF4RytZVkpKVHo2VG5XejRONldkVlRuaHpha1dWb3FOQzJ2?=
 =?gb2312?B?c1BLTW9UaVFza2FvRlprb29Va3o0NWpNSE8vSXBva0U3aDZJdTZCL2FsWGY1?=
 =?gb2312?B?djEzZHlmWjJWS0dFSE9kVXl0QnVqVk9hQUdWYldXYXE1dzRXUmhJT2RZakg4?=
 =?gb2312?B?dGpYc2VLK0VGa1hkQzF6SXMvQWs0K0J4a2VIZz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7640c8f5-ccc7-4d18-1ff8-08db81174e1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 07:28:49.7343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11XhxMlFsWPwmcf3hXNuUJhrKW5O8/VUrxOUCVKHX/gfFQsaB+Q3S4cuyLCGQ5eG2XxOynugxHFZ+kVp74wkNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8398
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
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlub2QsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cywNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPg0KPiBT
ZW50OiAyMDIzxOo21MIyMcjVIDE5OjIyDQo+IFRvOiBTYW5kb3IgWXUgPHNhbmRvci55dUBueHAu
Y29tPg0KPiBDYzogYW5kcnplai5oYWpkYUBpbnRlbC5jb207IG5laWwuYXJtc3Ryb25nQGxpbmFy
by5vcmc7DQo+IHJvYmVydC5mb3NzQGxpbmFyby5vcmc7IExhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbTsNCj4gam9uYXNAa3dpYm9vLnNlOyBqZXJuZWouc2tyYWJlY0BnbWFpbC5jb207
IGFpcmxpZWRAZ21haWwuY29tOw0KPiBkYW5pZWxAZmZ3bGwuY2g7IHJvYmgrZHRAa2VybmVsLm9y
Zzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOw0KPiBzaGF3bmd1b0BrZXJuZWwu
b3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0K
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQub3JnOyBrZXJuZWxAcGVu
Z3V0cm9uaXguZGU7IGRsLWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+OyBPbGl2ZXIg
QnJvd24gPG9saXZlci5icm93bkBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHY2IDQvOF0gcGh5OiBBZGQgSERNSSBjb25maWd1cmF0aW9uIG9wdGlvbnMNCj4gDQo+IENhdXRp
b246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlj
a2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBv
cnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0dG9uDQo+
IA0KPiANCj4gT24gMTUtMDYtMjMsIDA5OjM4LCBTYW5kb3IgWXUgd3JvdGU6DQo+ID4gQWxsb3cg
SERNSSBQSFlzIHRvIGJlIGNvbmZpZ3VyZWQgdGhyb3VnaCB0aGUgZ2VuZXJpYyBmdW5jdGlvbnMg
dGhyb3VnaA0KPiA+IGEgY3VzdG9tIHN0cnVjdHVyZSBhZGRlZCB0byB0aGUgZ2VuZXJpYyB1bmlv
bi4NCj4gPg0KPiA+IFRoZSBwYXJhbWV0ZXJzIGFkZGVkIGhlcmUgYXJlIGJhc2VkIG9uIEhETUkg
UEhZIGltcGxlbWVudGF0aW9uDQo+ID4gcHJhY3RpY2VzLiAgVGhlIGN1cnJlbnQgc2V0IG9mIHBh
cmFtZXRlcnMgc2hvdWxkIGNvdmVyIHRoZSBwb3RlbnRpYWwNCj4gPiB1c2Vycy4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4gLS0tDQo+
ID4gIGluY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmggfCAzOA0KPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9saW51eC9waHkvcGh5LmggICAgICB8
ICA3ICsrKysrKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBpbmNsdWRlL2xpbnV4L3BoeS9waHkt
aGRtaS5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9waHkvcGh5LWhkbWku
aA0KPiA+IGIvaW5jbHVkZS9saW51eC9waHkvcGh5LWhkbWkuaCBuZXcgZmlsZSBtb2RlIDEwMDY0
NCBpbmRleA0KPiA+IDAwMDAwMDAwMDAwMC4uNTc2NWFhNWJjMTc1DQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgNCj4gPiBAQCAtMCwwICsx
LDM4IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ID4g
Ky8qDQo+ID4gKyAqIENvcHlyaWdodCAyMDIyIE5YUA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNp
Zm5kZWYgX19QSFlfSERNSV9IXw0KPiA+ICsjZGVmaW5lIF9fUEhZX0hETUlfSF8NCj4gPiArDQo+
ID4gKy8qKg0KPiA+ICsgKiBQaXhlbCBFbmNvZGluZyBhcyBIRE1JIFNwZWNpZmljYXRpb24NCj4g
PiArICogUkdCLCBZVVY0MjIsIFlVVjQ0NDpIRE1JIFNwZWNpZmljYXRpb24gMS40YSBTZWN0aW9u
IDYuNQ0KPiA+ICsgKiBZVVY0MjA6IEhETUkgU3BlY2lmaWNhdGlvbiAyLmEgU2VjdGlvbiA3LjEg
ICovIGVudW0NCj4gPiAraGRtaV9waHlfY29sb3JzcGFjZSB7DQo+ID4gKyAgICAgSERNSV9QSFlf
Q09MT1JTUEFDRV9SR0IsICAgICAgICAvKiBSR0IgNDo0OjQgKi8NCj4gPiArICAgICBIRE1JX1BI
WV9DT0xPUlNQQUNFX1lVVjQyMiwgICAgIC8qIFlDYkNyIDQ6MjoyICovDQo+ID4gKyAgICAgSERN
SV9QSFlfQ09MT1JTUEFDRV9ZVVY0NDQsICAgICAvKiBZQ2JDciA0OjQ6NCAqLw0KPiA+ICsgICAg
IEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDIwLCAgICAgLyogWUNiQ3IgNDoyOjAgKi8NCj4gDQo+
IEJldHRlciBhZGQgdGhpcyBjb21tZW50cyBhbmQgYWJvdmUgb25lIGFzIGV4cGVjdGVkIGJ5IGtl
cm5lbC1kb2MgZm9yDQo+IGVudW0uLg0KT0ssIEkgd2lsbCBhZGQgaXQgYW5kIGl0IHdpbGwgcmVw
bGFjZSBieSBlbnVtIGhkbWlfY29sb3JzcGFjZSBpbiA8bGludXgvaGRtaS5oPiBpbiB0aGUgbmV4
dCB2ZXJzaW9uLg0KDQo+IA0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ0
LA0KPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ1LA0KPiA+ICsgICAgIEhE
TUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ2LA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyoqDQo+
ID4gKyAqIHN0cnVjdCBwaHlfY29uZmlndXJlX29wdHNfaGRtaSAtIEhETUkgY29uZmlndXJhdGlv
biBzZXQNCj4gPiArICogQHBpeGVsX2Nsa19yYXRlOiAgUGl4ZWwgY2xvY2sgb2YgdmlkZW8gbW9k
ZXMgaW4gS0h6Lg0KPiA+ICsgKiBAYnBjOiBNYXhpbXVtIGJpdHMgcGVyIGNvbG9yIGNoYW5uZWwu
DQo+ID4gKyAqIEBjb2xvcl9zcGFjZTogQ29sb3JzcGFjZSBpbiBlbnVtIGhkbWlfcGh5X2NvbG9y
c3BhY2UuDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgc3RydWN0dXJlIGlzIHVzZWQgdG8gcmVwcmVz
ZW50IHRoZSBjb25maWd1cmF0aW9uIHN0YXRlIG9mIGEgSERNSSBwaHkuDQo+ID4gKyAqLw0KPiA+
ICtzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2hkbWkgew0KPiA+ICsgICAgIHVuc2lnbmVkIGlu
dCBwaXhlbF9jbGtfcmF0ZTsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgYnBjOw0KPiA+ICsgICAg
IGVudW0gaGRtaV9waHlfY29sb3JzcGFjZSBjb2xvcl9zcGFjZTsgfTsNCj4gPiArDQo+ID4gKyNl
bmRpZiAvKiBfX1BIWV9IRE1JX0hfICovDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
cGh5L3BoeS5oIGIvaW5jbHVkZS9saW51eC9waHkvcGh5LmggaW5kZXgNCj4gPiAzYTU3MGJjNTlm
YzcuLjkzZDc3ZDQ1YjFkNCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BoeS9waHku
aA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvcGh5L3BoeS5oDQo+ID4gQEAgLTE3LDYgKzE3LDcg
QEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KPiA+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9waHkvcGh5LWRwLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9waHkv
cGh5LWhkbWkuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHktbHZkcy5oPg0KPiA+ICAj
aW5jbHVkZSA8bGludXgvcGh5L3BoeS1taXBpLWRwaHkuaD4NCj4gPg0KPiA+IEBAIC00Miw3ICs0
Myw4IEBAIGVudW0gcGh5X21vZGUgew0KPiA+ICAgICAgIFBIWV9NT0RFX01JUElfRFBIWSwNCj4g
PiAgICAgICBQSFlfTU9ERV9TQVRBLA0KPiA+ICAgICAgIFBIWV9NT0RFX0xWRFMsDQo+ID4gLSAg
ICAgUEhZX01PREVfRFANCj4gPiArICAgICBQSFlfTU9ERV9EUCwNCj4gPiArICAgICBQSFlfTU9E
RV9IRE1JLA0KPiA+ICB9Ow0KPiA+DQo+ID4gIGVudW0gcGh5X21lZGlhIHsNCj4gPiBAQCAtNjAs
MTEgKzYyLDE0IEBAIGVudW0gcGh5X21lZGlhIHsNCj4gPiAgICogICAgICAgICAgIHRoZSBEaXNw
bGF5UG9ydCBwcm90b2NvbC4NCj4gPiAgICogQGx2ZHM6ICAgIENvbmZpZ3VyYXRpb24gc2V0IGFw
cGxpY2FibGUgZm9yIHBoeXMgc3VwcG9ydGluZw0KPiA+ICAgKiAgICAgICAgICAgdGhlIExWRFMg
cGh5IG1vZGUuDQo+ID4gKyAqIEBoZG1pOiAgICBDb25maWd1cmF0aW9uIHNldCBhcHBsaWNhYmxl
IGZvciBwaHlzIHN1cHBvcnRpbmcNCj4gPiArICogICAgICAgICAgIHRoZSBIRE1JIHBoeSBtb2Rl
Lg0KPiA+ICAgKi8NCj4gPiAgdW5pb24gcGh5X2NvbmZpZ3VyZV9vcHRzIHsNCj4gPiAgICAgICBz
dHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX21pcGlfZHBoeSAgICAgbWlwaV9kcGh5Ow0KPiA+ICAg
ICAgIHN0cnVjdCBwaHlfY29uZmlndXJlX29wdHNfZHAgICAgICAgICAgICBkcDsNCj4gPiAgICAg
ICBzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2x2ZHMgICAgICAgICAgbHZkczsNCj4gPiArICAg
ICBzdHJ1Y3QgcGh5X2NvbmZpZ3VyZV9vcHRzX2hkbWkgICAgICAgICAgaGRtaTsNCj4gPiAgfTsN
Cj4gPg0KPiA+ICAvKioNCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiANCj4gLS0NCj4gflZpbm9kDQoN
CkIuUg0KU2FuZG9yDQo=
