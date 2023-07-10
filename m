Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A272774CEB6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF1E10E200;
	Mon, 10 Jul 2023 07:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C065610E200
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbTDRVfKwTJfYAXS4K1c/UcrVN4Yf9FluVppajEaMaGRAF1fNFWN/DYSqf9Ar9o+LyBhCLcYgHWCjfNGliipWo2UfDXiQK3hvx6e+cLRgjxRIFWHe4FPBodTT6ysek+PC4hgYz2J6c/YbrudY76fHkWGIjgUrxpqg4Bg3f3YPyWelyFVYVdA4d2OPgfNN+KfSZ+86lK+Fx9mDvnA2+SDAI7mAD1yW/P1q9HJHosdHLQprKV4Kk4DvBPeNDLODO28WYHo3y/P7ab2SFqLMygyY8MaaJqk6QoXQq7hLPsyXHOr4zbYbeC79c+UciAQkQXqRkgWVWYSMqOvuofgCoUhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN34KHrAi2ckyAxueCsC+rGpwRVFahFPTRsex3bAqeY=;
 b=eUimexaRNifOMqeTaot6Yv3QKc/W2RCvz/P02YkENMnK/Jegkb4h+NIu6mTmCIQXUhYufVBC+eU1+bFqua1Pquep9vNrqZmVMOXPfaeJp0onX36UfgPRKMF7IK+ghrTNpOPIPfU2A6FibeUXETA3ai1nR6VSEBkqjBxTdOB1PKbcr0Sgcim9+N5rZQAtvnwP3h0iW82HOld+J5dQSvDhSafwhJMJ6aTscac/7PlyeWbp9VIZBxRh1mHtI0NXlXMR5WnXV3dOcQt4SUMs+8JBb83zFsl8oPQMgHTCY/wOZO0sTlc4E19UEiRM3ot6G9CXpAVBK+G6582l5hhRknzlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN34KHrAi2ckyAxueCsC+rGpwRVFahFPTRsex3bAqeY=;
 b=Cjz1cB7jcVhX6zZQGKfNGLmZ2ujKoyHZwqa1z0hluqaqA5ecFdggAcmwAAk2NYkUepzr/XbmbFazu+skIX5TvaIa+VODvxfX+zofFEUuWpx46DprOaezUyBdCebsGSMeB072qoyvx0J7MQzr9XvM1nOzveAcyTwBhoSDaVM2jho=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8985.eurprd04.prod.outlook.com (2603:10a6:20b:408::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Mon, 10 Jul
 2023 07:41:52 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 07:41:52 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: RE: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Topic: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Thread-Index: AQHZnyaWSldT+9YfOk2MiOGSER4/uq+aTasAgBhbjaCAABlCAIAAAdBQ
Date: Mon, 10 Jul 2023 07:41:52 +0000
Message-ID: <PAXPR04MB944842CEE34FA6BABC35AFA3F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
 <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <CAA8EJpoNTvaMKcn7ben=Ai7CkGcUnZ2g7UiH7Oy4zTX2zzKAxg@mail.gmail.com>
In-Reply-To: <CAA8EJpoNTvaMKcn7ben=Ai7CkGcUnZ2g7UiH7Oy4zTX2zzKAxg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM9PR04MB8985:EE_
x-ms-office365-filtering-correlation-id: 32b8a563-77a9-4755-c244-08db8119206f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kuEzz2Ok32ogkMQNu2AJfCp/irT8Atg2x+BcyCg9kj+w/RENWNnaGmBRQCb7MVxgH9Z4H29VHOQd66drbB1+ZnF3eyRR0tdg3uSQOL1xmfViofGJFVNS7wqe8Q361wGfXrBnC0lqqIM8XF5KWeC4J7ie0gc0OP8yoGuQ/gz4NgK44A9E224sv6HNhQlz2DXKgGTocW40J2frP2AxzdZw7jFTZPkD1Pu7JUwfuOXA2b0giDAjAqBlp7zBz2GGF8cx0X6RNV7p2VrwI7ZGG7BFGNrssmm0h41gCW928YSDwg5WGjbQX7ET9xrng1ABlxYIHdiD4nJwi58JsNOZOFU7IuDssucP7wUktKieMR3Fyc1BJiza9NpYQe87k2xtcUyQ2PnUaIadptVJWQq7C8HFa5SDsKJIIKhtGGZxK76KXSW9PTt23NpuUd0FnQrEBIC9VS0PAjs7FS5FqtILgU+rIEJjaXOhhcQzB2hxTTh7Ptxl5V1HeNfGBPxqpF1cl+CJctDWzo/Hu3KzGXjXG1CQAj5xwDPSFqkP+JXO5uLuLeHx7V7iPMm3L1wq9DqjRASiBne3CFjsRW7THkBdK1SKoiGD3fXFejKNoltiOct8HUd7IWsYdmWAbLImtWCdy1Wt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(71200400001)(38070700005)(38100700002)(186003)(122000001)(66556008)(76116006)(66446008)(66476007)(86362001)(64756008)(2906002)(7696005)(6916009)(54906003)(316002)(6506007)(9686003)(4326008)(478600001)(53546011)(83380400001)(55016003)(41300700001)(33656002)(8676002)(8936002)(44832011)(52536014)(66946007)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1I0WjJvc0tPYiswZXJjM3l0Z09Jcm5QWGxMSkhzb2sxeEh4L0xBTlBFRGRi?=
 =?utf-8?B?VFE1bFlxMkx3V1g5eGFrNUcyVHJwWDY1d0dOUk1oY0E5cTN0eDQ2SkZNaW9x?=
 =?utf-8?B?SWtDY1E5bWp6WkYyVldrRTN6a21SMHZ3MkRoOTlTckFxMW41cTRXLzFQNi9a?=
 =?utf-8?B?amxwU2ZvbXoxRWwxbFNaTE9QL2IzMG1FZHg2djhDYjU1THloVm9tUjBtTFlT?=
 =?utf-8?B?Y0daQ1JZUjJlUVFiUk1aMEdldHlXSkFlUU0zamgrbGNPMzJMVXU0emh6Vk5t?=
 =?utf-8?B?ZjBDWW56OEFia1NTb2ZKNUFBZmUyL0VTVkp3clNuRVpjUWJKOTIxRWV5QVpB?=
 =?utf-8?B?cElURlRvWkhGOW5EMlVSeXdEVUw4MUxCYXZSYmNSekpuMnJkMDFsQkhPRTRt?=
 =?utf-8?B?VENBNmk0ZWtPZ2pzZk1QYVMvNjA1YWNpK2lVWHphK3pMemNjNE9PNFd5aHZi?=
 =?utf-8?B?RjdCYVRQWEpqSk9BamM5WnhVQmdYbTVQdzh3N2FjSlZ5V0hWMm8vWmYvdERB?=
 =?utf-8?B?Vmo5Qmx5cXZCZWFOdFl0L1h6bzBRbktsdTFocVdoUm8rVURuWGhVNW5HN1Jo?=
 =?utf-8?B?T0ZyMVpvNjhKVEk0NzZ1TVBzcGgxR2FPSnJON3dDNmU4TXNpQ3JtQnJybDdS?=
 =?utf-8?B?bTBoRm5IYmx2eXlUbzEzK1BvL1g0WW5NeVRXMjNsSmhDWFo2d3Bwb2VtTHgy?=
 =?utf-8?B?SUNMb2dtcW5yU25pOTNiNnc0NVA1aHdXR3IxUXBKLzZ3RVd0OHp1cDJxR0R1?=
 =?utf-8?B?RG9QdjVQcGpLWkprazR2TzVrNGZZZ2JhME5LU2paa216dWpERS92UmI5bGg4?=
 =?utf-8?B?TExMM3gwUWEwVW9Fay9PcWlCcDAvQUJ5K2VsMjRyZFRQdWR5TnZtTEJFbVR0?=
 =?utf-8?B?U3JvZHlmcklSdkJKOG1wbU1xcEZ0ZjduYXVXZlJXOS8xR3hqZWsxeVpNQjBT?=
 =?utf-8?B?eEI5K1hKcVhwV3VFWDk0MmVqUUpRQU54R2s3azM1dXRxTTkva3hyMVZUVzBE?=
 =?utf-8?B?QjFDb08rYVVOTUUvakd6Rkd4SElGTnM4dEVWMDdoQ3UzL0w3bzJtV0tiZ1Zp?=
 =?utf-8?B?SlRiWUNaQ1NVRlFDY3lMYnBJb2dsZmNkdUFieHZqK3hIUnRUMjdkczFyc2V3?=
 =?utf-8?B?dGM5RlpacXM1YWpGUHpMd2tkSEVWY0tJZW5xNkErNWJ5RU1OalhlQzByQnV5?=
 =?utf-8?B?YVczY0NLNWlvREp1enJRenBZWTlCNFExSGc4bkdBV3VvelYrc0JkeWNNWEl0?=
 =?utf-8?B?TW5adjAreXMvS0lIUHc4em94MGpsOGJCeDlURUc2ai93SzFIS2tjcDZVQ0Yv?=
 =?utf-8?B?NUdrS3pKQnhBdEpWVGE0bmpZdk5XNTB3MGJ1MzBQTlBlSW1JbG5maHV0Z2E2?=
 =?utf-8?B?MFAzRWkybEpjcUpKQ3c2QVc2ckRUR014U3AzeTd1b3JuS0NOZDRoZ3ZBdEd1?=
 =?utf-8?B?K1VHc3lmelE2RjdJejBoeVg3UWlZQnBNdEtlNjVaWnkxOFBmYm5hT3ViZ3Fq?=
 =?utf-8?B?OXQ2dmFXUHRZUGNuOVFRRVJEeHBncXpjNEViamNqcnc5Ty9rcDZYczMzR0xI?=
 =?utf-8?B?czFvREE4aGc5aytuNzBZT1ZnQm82a0ttNmVFVnJEMnQ1UGVQTmp0M3R3MWJ4?=
 =?utf-8?B?SEhRUTRNdGxEVFhyVDhIYW5INGFXaktjWDJOQi84Tk5JK3g5cDFEUUwybjJS?=
 =?utf-8?B?YkJMYlVwNzh6Mm4wVUZTeHZJS2NCanh0cTZKM2NwS3VnS0dvdUN3TTZ5Qmpj?=
 =?utf-8?B?dWxUNGRJMmVtTUwzbndacldLOTNRTzBFeHJnS1pJdXFSV2ZTWHNlS0xUOUYv?=
 =?utf-8?B?VWhsbHRQRFQ2a2kycFpOMXBUVWlOSGRvZEtodjJlMkJmOWQ3RktBU1k0djhD?=
 =?utf-8?B?WWQ3R2xGdFdkMk1FZy8rYjBYcG9VN2tyRmlCUk03ZXNKNm90VFpodm01d2hV?=
 =?utf-8?B?MXlpek9GWmt3NElSYytJQlhzL1ZoQnBVNzBwOTFySWhoOEJhZWVjTmVKVWV3?=
 =?utf-8?B?N0sxRHAzVFQ3L3FNYkYxa1p2THcwMzYxSS83RG5Memwzc2h4WTk1T0hSaEVK?=
 =?utf-8?B?ZU5QdWhnSXFTd0FoNFdrako0bTlZUlpkcjlldz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b8a563-77a9-4755-c244-08db8119206f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 07:41:52.0927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUkYeCHA7AybZeldngZomwK0KJNWEwwbjYesxBnsg6pz+OClYd9f+E/mPCSC/QEj3uIJSgf6Xobjg/hlQrILHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8985
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMDIz5bm0N+aciDEw5pel
IDE1OjMwDQo+IFRvOiBTYW5kb3IgWXUgPHNhbmRvci55dUBueHAuY29tPg0KPiBDYzogYW5kcnpl
ai5oYWpkYUBpbnRlbC5jb207IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7DQo+IHJvYmVydC5m
b3NzQGxpbmFyby5vcmc7IExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsNCj4gam9u
YXNAa3dpYm9vLnNlOyBqZXJuZWouc2tyYWJlY0BnbWFpbC5jb207IGFpcmxpZWRAZ21haWwuY29t
Ow0KPiBkYW5pZWxAZmZ3bGwuY2g7IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxv
d3NraStkdEBsaW5hcm8ub3JnOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1
dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+IHZrb3VsQGtlcm5lbC5vcmc7IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBrZXJuZWxA
cGVuZ3V0cm9uaXguZGU7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBPbGl2ZXIg
QnJvd24NCj4gPG9saXZlci5icm93bkBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6
IFtQQVRDSCB2NiA0LzhdIHBoeTogQWRkIEhETUkgY29uZmlndXJhdGlvbiBvcHRpb25zDQo+IA0K
PiANCj4gT24gTW9uLCAxMCBKdWwgMjAyMyBhdCAxMDoyOCwgU2FuZG9yIFl1IDxzYW5kb3IueXVA
bnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBEbWl0cnksDQo+ID4NCj4gPiBUaGFua3MgZm9y
IHlvdXIgY29tbWVudHMsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+
DQo+ID4gPiBTZW50OiAyMDIz5bm0NuaciDI15pelIDI6MDINCj4gPiA+IFRvOiBTYW5kb3IgWXUg
PHNhbmRvci55dUBueHAuY29tPjsgYW5kcnplai5oYWpkYUBpbnRlbC5jb207DQo+ID4gPiBuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnOyByb2JlcnQuZm9zc0BsaW5hcm8ub3JnOw0KPiA+ID4gTGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBqb25hc0Brd2lib28uc2U7DQo+ID4gPiBq
ZXJuZWouc2tyYWJlY0BnbWFpbC5jb207IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwu
Y2g7DQo+ID4gPiByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2krZHRAbGlu
YXJvLm9yZzsNCj4gPiA+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gPiA+IHZrb3VsQGtlcm5lbC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+ID4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiA+
IENjOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5j
b20+OyBPbGl2ZXINCj4gPiA+IEJyb3duIDxvbGl2ZXIuYnJvd25AbnhwLmNvbT4NCj4gPiA+IFN1
YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjYgNC84XSBwaHk6IEFkZCBIRE1JIGNvbmZpZ3VyYXRp
b24NCj4gPiA+IG9wdGlvbnMNCj4gDQo+IElzIHRoaXMgcGFydCBuZWNlc3Nhcnk/DQpObywgZm9y
Z290IHRvIHJlbW92ZSB0aGUgQ2F1dGlvbiBpdCBpcyBhdXRvIGFkZGVkIGJ5IG1haWwgc3lzdGVt
Lg0KPiANCj4gPiA+DQo+ID4gPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQ
bGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcNCj4gPiA+IGxpbmtzIG9yIG9wZW5pbmcgYXR0
YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZQ0KPiA+ID4gdXNpbmcg
dGhlICdSZXBvcnQgdGhpcyBlbWFpbCcgYnV0dG9uDQo+ID4gPg0KPiA+ID4NCj4gPiA+IE9uIDE1
LzA2LzIwMjMgMDQ6MzgsIFNhbmRvciBZdSB3cm90ZToNCj4gPiA+ID4gQWxsb3cgSERNSSBQSFlz
IHRvIGJlIGNvbmZpZ3VyZWQgdGhyb3VnaCB0aGUgZ2VuZXJpYyBmdW5jdGlvbnMNCj4gPiA+ID4g
dGhyb3VnaCBhIGN1c3RvbSBzdHJ1Y3R1cmUgYWRkZWQgdG8gdGhlIGdlbmVyaWMgdW5pb24uDQo+
ID4gPiA+DQo+ID4gPiA+IFRoZSBwYXJhbWV0ZXJzIGFkZGVkIGhlcmUgYXJlIGJhc2VkIG9uIEhE
TUkgUEhZIGltcGxlbWVudGF0aW9uDQo+ID4gPiA+IHByYWN0aWNlcy4gIFRoZSBjdXJyZW50IHNl
dCBvZiBwYXJhbWV0ZXJzIHNob3VsZCBjb3ZlciB0aGUNCj4gPiA+ID4gcG90ZW50aWFsIHVzZXJz
Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5kb3IgWXUgPFNhbmRvci55dUBu
eHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBpbmNsdWRlL2xpbnV4L3BoeS9waHktaGRt
aS5oIHwgMzgNCj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ID4gPiAgIGluY2x1ZGUvbGludXgvcGh5L3BoeS5oICAgICAgfCAgNyArKysrKystDQo+ID4gPiA+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4g
PiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgNCj4g
PiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGh5L3BoeS1oZG1pLmgN
Cj4gPiA+ID4gYi9pbmNsdWRlL2xpbnV4L3BoeS9waHktaGRtaS5oIG5ldyBmaWxlIG1vZGUgMTAw
NjQ0IGluZGV4DQo+ID4gPiA+IDAwMDAwMDAwMDAwMC4uNTc2NWFhNWJjMTc1DQo+ID4gPiA+IC0t
LSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9waHkvcGh5LWhkbWkuaA0K
PiA+ID4gPiBAQCAtMCwwICsxLDM4IEBADQo+ID4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCAqLw0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAqIENvcHlyaWdodCAyMDIy
IE5YUA0KPiA+ID4gPiArICovDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNpZm5kZWYgX19QSFlfSERN
SV9IXw0KPiA+ID4gPiArI2RlZmluZSBfX1BIWV9IRE1JX0hfDQo+ID4gPiA+ICsNCj4gPiA+ID4g
Ky8qKg0KPiA+ID4gPiArICogUGl4ZWwgRW5jb2RpbmcgYXMgSERNSSBTcGVjaWZpY2F0aW9uDQo+
ID4gPiA+ICsgKiBSR0IsIFlVVjQyMiwgWVVWNDQ0OkhETUkgU3BlY2lmaWNhdGlvbiAxLjRhIFNl
Y3Rpb24gNi41DQo+ID4gPiA+ICsgKiBZVVY0MjA6IEhETUkgU3BlY2lmaWNhdGlvbiAyLmEgU2Vj
dGlvbiA3LjEgICovIGVudW0NCj4gPiA+ID4gK2hkbWlfcGh5X2NvbG9yc3BhY2Ugew0KPiA+ID4g
PiArICAgICBIRE1JX1BIWV9DT0xPUlNQQUNFX1JHQiwgICAgICAgIC8qIFJHQiA0OjQ6NCAqLw0K
PiA+ID4gPiArICAgICBIRE1JX1BIWV9DT0xPUlNQQUNFX1lVVjQyMiwgICAgIC8qIFlDYkNyIDQ6
MjoyICovDQo+ID4gPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfWVVWNDQ0LCAgICAgLyog
WUNiQ3IgNDo0OjQgKi8NCj4gPiA+ID4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFDRV9ZVVY0MjAs
ICAgICAvKiBZQ2JDciA0OjI6MCAqLw0KPiA+ID4gPiArICAgICBIRE1JX1BIWV9DT0xPUlNQQUNF
X1JFU0VSVkVENCwNCj4gPiA+ID4gKyAgICAgSERNSV9QSFlfQ09MT1JTUEFDRV9SRVNFUlZFRDUs
DQo+ID4gPiA+ICsgICAgIEhETUlfUEhZX0NPTE9SU1BBQ0VfUkVTRVJWRUQ2LCB9Ow0KPiA+ID4N
Cj4gPiA+IFRoaXMgZW51bSBkdXBsaWNhdGVzIGVudW0gaGRtaV9jb2xvcnNwYWNlIGZyb20gPGxp
bnV4L2hkbWkuaD4gSERNSQ0KPiA+ID4gMi4wIGRlZmluZXMgJzcnIHRvIGJlIElETy1kZWZpbmVk
Lg0KPiA+ID4NCj4gPiA+IFdvdWxkIGl0IGJlIGJldHRlciB0byB1c2UgdGhhdCBlbnVtIGluc3Rl
YWQ/DQo+ID4gQWNjZXB0LiBJIHdpbGwgY3JlYXRlIGhlYWQgZmlsZSBoZG1pX2NvbG9yc3BhY2Uu
aCB0byByZXVzZSBlbnVtDQo+IGhkbWlfY29sb3JzcGFjZSBpbiA8bGludXgvaGRtaS5oPi4NCj4g
DQo+IEhtbSwgeW91IG5lZWQgYW5vdGhlciBoZWFkZXIgZmlsZSB0byByZXVzZSB0aGlzIGVudW0u
DQo+IA0KPiA+DQo+ID4gQi5SDQo+ID4gU2FuZG9yDQo+ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+
ICsvKioNCj4gPiA+ID4gKyAqIHN0cnVjdCBwaHlfY29uZmlndXJlX29wdHNfaGRtaSAtIEhETUkg
Y29uZmlndXJhdGlvbiBzZXQNCj4gPiA+ID4gKyAqIEBwaXhlbF9jbGtfcmF0ZTogIFBpeGVsIGNs
b2NrIG9mIHZpZGVvIG1vZGVzIGluIEtIei4NCj4gPiA+ID4gKyAqIEBicGM6IE1heGltdW0gYml0
cyBwZXIgY29sb3IgY2hhbm5lbC4NCj4gPiA+ID4gKyAqIEBjb2xvcl9zcGFjZTogQ29sb3JzcGFj
ZSBpbiBlbnVtIGhkbWlfcGh5X2NvbG9yc3BhY2UuDQo+ID4gPiA+ICsgKg0KPiA+ID4gPiArICog
VGhpcyBzdHJ1Y3R1cmUgaXMgdXNlZCB0byByZXByZXNlbnQgdGhlIGNvbmZpZ3VyYXRpb24gc3Rh
dGUgb2YgYSBIRE1JDQo+IHBoeS4NCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArc3RydWN0IHBoeV9j
b25maWd1cmVfb3B0c19oZG1pIHsNCj4gPiA+ID4gKyAgICAgdW5zaWduZWQgaW50IHBpeGVsX2Ns
a19yYXRlOw0KPiA+ID4gPiArICAgICB1bnNpZ25lZCBpbnQgYnBjOw0KPiA+ID4gPiArICAgICBl
bnVtIGhkbWlfcGh5X2NvbG9yc3BhY2UgY29sb3Jfc3BhY2U7IH07DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyNlbmRpZiAvKiBfX1BIWV9IRE1JX0hfICovDQo+ID4gPg0KPiA+ID4gW3NraXBwZWQgdGhl
IHJlc3RdDQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IFdpdGggYmVzdCB3aXNoZXMNCj4gPiA+IERt
aXRyeQ0KPiA+DQo+IA0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0K
Qi5SDQpTYW5kb3INCg==
