Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F7345882
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E211E6E842;
	Tue, 23 Mar 2021 07:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA78F6E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7cOxzkCvhOuNX5Y0xkvQ5abE9gOv2q3pJppbAYyIAHKlcUyC7lUCQW54PErHD6+IMzEgdqwQlFmQ2UHLOI6h54j9XBedaT2PVcJyeTnt53/IrEB7xXaaaEhvuMbsrsOlQ9fj6J+yWY3u8inHz/f8SnOZsocCjV00N0nbfdao81kDaeq4/OeXk1+kG5xU++ryhDj59SfHWHs8Ao3+dt85kgJTT6FsEiS31ZubK0MQU4/XF7HQ41kVKswyOvjP0Vq+eLAPT4pvIUuVU42fwRgIqij8iYDuo5Y2/3AjU59eeYAlgj3D4nl1LkfoJjgLMWOaLP2A5l4cidEeoltWc19tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzQZqYZBtOlnhHlWn87GRaWhwQosblctxwER1ZIpYlo=;
 b=JMEOB3/7mxQBtc0F1XizDoEDoaeAtMi59Ww/oErc3FoxxmsXS6Qx85ZtbvLvVwPtal346rp05ny/AEpv8bOnLNf+diYxL3NEp3Pwc59+Yw80vCVR2fUJJFWLhyvnh0zWTqptBxMT4x7QfkeF5NxhQ1iOiKvzYfVn7zpbtk5OkDznLVP/GkNNNT4xy9PyaZffnadh4wd7Y60Lrv3bi19zUkyzcLX9nN2HUXjtPaWYXqIV4FmViUmk6IFiPYeXsmp/LbxtewYII3b4qpWfLeS5klhzTM0jr2redqRuc3LlDO2ROL9sdP8QesYbrsR+5KguKXr7s1uX3XnokP7P9tSalA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzQZqYZBtOlnhHlWn87GRaWhwQosblctxwER1ZIpYlo=;
 b=OSX8kQ5klR8Tqmhj/6ezoZIQC+XzHRfcCnPDLQiKJcx8f+PDzA1FKancxsh+Wj39ZbyPmFJodCfB4kB2WsIpQbBCIvFh8xoTEo03VnTw17L8W04epUfHBZ7sMsKtnkYxpCNd6K7uErSvCdxELdCk+VSh67faznYZO7rsqxFI3Yw=
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com (2603:10a6:10:55::32)
 by DBAPR05MB7224.eurprd05.prod.outlook.com (2603:10a6:10:1ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 00:23:37 +0000
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::65bd:95f4:78b0:bcd1]) by DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::65bd:95f4:78b0:bcd1%5]) with mapi id 15.20.3955.024; Tue, 23 Mar 2021
 00:23:37 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "victor.liu@nxp.com"
 <victor.liu@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: Re: [PATCH v6 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Thread-Topic: [PATCH v6 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Thread-Index: AQHXH3rEds5XV99hOUeT6OcX8en2qg==
Date: Tue, 23 Mar 2021 00:23:37 +0000
Message-ID: <62306ab21ec234317ca4b8c2f06fc9cd4be0ead4.camel@toradex.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-2-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1615952569-4711-2-git-send-email-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=toradex.com;
x-originating-ip: [2a01:2ac:51dd:d885:51ae:2f9c:9f1e:70f4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17ef189b-2001-44b3-b8e9-08d8ed91e6f7
x-ms-traffictypediagnostic: DBAPR05MB7224:
x-microsoft-antispam-prvs: <DBAPR05MB7224AB325A5117DF2B9F526BFB649@DBAPR05MB7224.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CsvyQ0HeaWzNXy68ZwnCbwAGncAb+vF0124tD5jFCSIAGP8qjMB0wdzpVK6hUJkgVExhjBjVqLJ8DQ+5iOB3hDhk+c3q/aESQctM5eDbqRTlVmoXhMvo4rZy7ZtphHTGeF3sk/3f/mqLX0kZYY5FLtJGH/forHfRpCVEyK4a+6A9CSBhyfZ37HXKKelBxdJbrKmn+K0rrX07vwzOTmWNfAcJft8d5U+RKZ+XCzZwTJlqpz8mqMTwyeXSQqNIWLHKynzmqpzNPkQFiNKH1fgUHlAYOqYvdzrNwtZVXGYvsnLkTSPUkr0i+B3ZOeEqFNgKEsUJETEex5Xfwf3QNG0Yc6InFfyyDv863fv8u3hUAykEyFuaroFwWpyfTzjR4YTx5urR2cnEoUcTA5ABHkuLhXGcsAgoRDvC2THIWXhb/E5yeNwLq1/u/bPqM1McK/QwiF5CjD1NEZIPX/X74+yJYR6xz2xPlM6Yo2fhag30pC2KSKFm64i/xAm9F8aG5Itkj4VXNQJq4znZhH+1y/NZWvC/4uWTBxJYOHc8z+7qdRQOAWCGUFEK8ZCIb/3tWj/QrRPrq09M698OEhISdksOo9bqe//xHaVm/cBfadClISHrRu4k4Dfpxhq09eo5z/XWUWfcz0DF8NdnlJ5fKsecH9FPHjhSwGD5RsEbQQwo0Gc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB5431.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39840400004)(136003)(376002)(110136005)(186003)(83380400001)(71200400001)(316002)(2616005)(86362001)(54906003)(7416002)(4326008)(38100700001)(8676002)(66946007)(478600001)(44832011)(2906002)(6512007)(6486002)(8936002)(6506007)(76116006)(64756008)(36756003)(66446008)(66556008)(91956017)(66476007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?M3pPYm94cEc1QnpBSmFPUWJ3QlQzWlVDQm9CaEtPU1cxMS8wWmJEeVFVZkJY?=
 =?utf-8?B?L2N1Y0NZSVpSODh1MExaRGpxempZdkhwemVobit6SCtlTFc0TU4yNFF4dTBH?=
 =?utf-8?B?UHNWVGJrakRUbU03V0ZOMGMzY1BMN0Jrd1F2RXQ2cU1KSkVlN08vYUd2NlJW?=
 =?utf-8?B?WElTb1dqVjQ5M2wzVzJwL09IRVJhTHVmNmN1Ry9LZW9HUzc5MkJXRzJFcEhP?=
 =?utf-8?B?bE5RK2xQS3pENzB6ZmVUUmljTmpYRkJTU0tteEQ2TENNQlQ5eExqVVNxdkEz?=
 =?utf-8?B?cTE0d3J4aHhmUUxLdHVDL2tMNUtXTWFyQkNySFhoSE9WQ1VWNnE3NjRZSDRT?=
 =?utf-8?B?STlyRTFNRjdCeUw2NVI2U3JYMzFXbERVR1dyUFZWWExabWIzdUMzV0oweFRU?=
 =?utf-8?B?MHB6emxuTkRMUTZoSWFUMkFJUENXd1VKeWU5NEhPWTUxUWliUnlqbEtTQm15?=
 =?utf-8?B?TVlqdXFGb0lIU1U3bzZpSkdHQWRkZkUrYTVZeGlHbE9pMVhqR2hqcTlrMU13?=
 =?utf-8?B?S2pDYXFHVjN5MWM1Q1V6dHFvYThYTlJxTFZ1UCt4Sm1TZEVFOFFudmhBNTE5?=
 =?utf-8?B?UFJNMVNrdGRjTkZ4aUJGM05KQlQ5QVM0TjZpYjI4T0czVnZQZ2xHOHFyakVZ?=
 =?utf-8?B?MVd3VFBnNXJZNDA2YWZncGJCNkRHTzJvNklCMklWTnJkdDZqTTJxS0RTQk9N?=
 =?utf-8?B?bWFLeDFDbVRYQ0NCaTJ1VzZ5eXNUOEhscFhjR2pzelo4QkJtZHlqb3o5SnJS?=
 =?utf-8?B?eGNlVGdjUTNRaWJEeXEwVnpUVDVHTlpVZHJrK1RhSlFCK0E4VlFBRmNYNHcz?=
 =?utf-8?B?RVZqSGdnOGc0WHR2S3phS3g3SGlhdkU2aEQxM01hMFJhTWpuS09HTmNJUWpB?=
 =?utf-8?B?cHAyYnkybWNTby8rUWlkck03MGRKdEJBN1djVktYQkRTUzZGaWJQV3UyOTZI?=
 =?utf-8?B?Tm1ZUjN1cERlTzVGaGtDYjJyVFh2bS94SU55UHMrWnNLaFZSWEp6TU9xVGdx?=
 =?utf-8?B?VzNpOVMzTjN2ZWNTYUV0WVVBNlhjOWxzZUdzckkzUCtwbmlmNmJ2TEZqRXRm?=
 =?utf-8?B?ZVBqdVdXYk5JdTc2QXIrRkxnRS85U3hHaEpFQ2pqc3hiWjBCQnVrYTdpZ2RG?=
 =?utf-8?B?MXNWVWNzOC95MzhHbnhnT0pENWdQT0t0eVlobnZKZkdMNEV5NzFOM2x0QTJ1?=
 =?utf-8?B?akNRT1V1QkRBWTRvKzR2dWliTTJkMjZRaU1MN0pHencxVXFFOHlQRGE0MWFP?=
 =?utf-8?B?MExteDVPd3Vwc1AwTEV1RUlpWUIzVXl5eEgycEpoNWJMRFgyRFA2cUVBSW1l?=
 =?utf-8?B?WXRtenMxN2ZhSkUxRzlZQUY2dzhUNW9mN2lNK3RHT1dxQllWdFYyeG9wYkV3?=
 =?utf-8?B?UXArcVBDdTBDbEdpcjJDMnEveFVvQjZHNmpjb2piRmNNMkU3MkhjN0dLYUk5?=
 =?utf-8?B?bkRuaUNpcFBFRnNjNUdPYWJqd2RaVy9NL0dSOGdUYk0yOGtzWGQwWmRWM1NQ?=
 =?utf-8?B?Y250MzZJQVVENFFNaE9hNDl6NUp2Y1pJWXptOWhRVzhzN0NqYWxSaXA0cG41?=
 =?utf-8?B?YVRLTGpZV29Pd3lrTFVNY1RhOGRGQXZKTDJSMi9DTEFHNC9SNmEzaUhpZnI0?=
 =?utf-8?B?VzlPVUwwVWZwQ1VvMUs5a20wTnk5YjdQN1ZaSVdsSVZZa2RieG90c1p2N1lQ?=
 =?utf-8?B?RFNXblFoODBKTmxIUDR4QVFHNnFqclpHYVM3Y3JXeVJRU21kVFU4UXp1VFFX?=
 =?utf-8?B?dHc3VzZQVHpYYUVybW5kdGFIUXo3SXB2dUI2YjBqMlM1akhDOHo3dXgzNzh2?=
 =?utf-8?B?TjdaNnpZeGtnamRVWVRkQnRMdlg4Z3lMc0xOMmd0NWdvWlp6K3FFZGo5MlRS?=
 =?utf-8?B?N2djNDA1cHhaZnppSUJQNVhBelZRYnhzQVRnbmZha2FtckE9PQ==?=
x-ms-exchange-transport-forked: True
Content-ID: <43A712A554446D419881B31A6ABDE80A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB5431.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ef189b-2001-44b3-b8e9-08d8ed91e6f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 00:23:37.2041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbesMQR/NUkIGS5DP5JYIonRl/vVIDCF2i+KE2afzqHSCJgtR90PGhO3ZjUW8GrmMsd+32Z5bWMM3qlSqKGjevYaXQuyzP4yhZeRrUWdQbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB7224
X-Mailman-Approved-At: Tue, 23 Mar 2021 07:22:05 +0000
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTE3IGF0IDExOjQyICswODAwLCBMaXUgWWluZyB3cm90ZToNCj4gVGhp
cyBwYXRjaCBhZGRzIFJHQjY2Nl8xWDMwX0NQQURMTywgUkdCODg4XzFYMzBfQ1BBRExPLCBSR0I2
NjZfMVgzNl9DUEFETE8NCj4gYW5kIFJHQjg4OF8xWDM2X0NQQURMTyBidXMgZm9ybWF0cyB1c2Vk
IGJ5IGkuTVg4cW0vcXhwIHBpeGVsIGNvbWJpbmVyLg0KPiBUaGUgUkdCIHBpeGVscyB3aXRoIHBh
ZGRpbmcgbG93IHBlciBjb21wb25lbnQgYXJlIHRyYW5zbWl0dGVkIG9uIGEgMzAtYml0DQo+IGlu
cHV0IGJ1cygxMC1iaXQgcGVyIGNvbXBvbmVudCkgZnJvbSBhIGRpc3BsYXkgY29udHJvbGxlciBv
ciBhIDM2LWJpdA0KPiBvdXRwdXQgYnVzKDEyLWJpdCBwZXIgY29tcG9uZW50KSB0byBhIHBpeGVs
IGxpbmsuDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzLVFTRWo1
RllRaG00ZG5tK3lST2ZFMEFAcHVibGljLmdtYW5lLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQtcnlMbndJdVdqbmpnL0MxQlZoWmhhd0BwdWJs
aWMuZ21hbmUub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWluZyA8dmljdG9yLmxpdS0zYXJR
aThWTjNUY0BwdWJsaWMuZ21hbmUub3JnPg0KPiAtLS0NCj4gdjUtPnY2Og0KPiAqIEFkZCBMYXVy
ZW50J3MgUi1iIHRhZy4NCj4gDQo+IHY0LT52NToNCj4gKiBBZGQgUm9iZXJ0J3MgUi1iIHRhZy4N
Cj4gDQo+IHYzLT52NDoNCj4gKiBObyBjaGFuZ2UuDQo+IA0KPiB2Mi0+djM6DQo+ICogTm8gY2hh
bmdlLg0KPiANCj4gdjEtPnYyOg0KPiAqIE5vIGNoYW5nZS4NCj4gDQo+IMKgaW5jbHVkZS91YXBp
L2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaCB8IDYgKysrKystDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC9tZWRpYS1idXMtZm9ybWF0LmggYi9pbmNsdWRlL3VhcGkvbGludXgvbWVk
aWEtYnVzLWZvcm1hdC5oDQo+IGluZGV4IDBkZmMxMWUuLmVjMzMyM2QgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9saW51eC9tZWRpYS1idXMtZm9ybWF0LmgNCj4gKysrIGIvaW5jbHVkZS91
YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaA0KPiBAQCAtMzQsNyArMzQsNyBAQA0KPiDCoA0K
PiDCoCNkZWZpbmUgTUVESUFfQlVTX0ZNVF9GSVhFRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAweDAwMDENCj4gwqANCj4gLS8qIFJHQiAtIG5leHQgaXPCoMKgwqDCoMKg
wqDCoDB4MTAxZSAqLw0KPiArLyogUkdCIC0gbmV4dCBpc8KgwqDCoMKgwqDCoMKgMHgxMDIyICov
DQo+IMKgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjQ0NF8xWDEywqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDB4MTAxNg0KPiDCoCNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I0NDRfMlg4X1BB
REhJX0JFwqDCoMKgwqDCoMKgMHgxMDAxDQo+IMKgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjQ0
NF8yWDhfUEFESElfTEXCoMKgwqDCoMKgwqAweDEwMDINCj4gQEAgLTU5LDkgKzU5LDEzIEBADQo+
IMKgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDhfREVMVEHCoMKgwqDCoMKgwqDCoMKg
wqAweDEwMWQNCj4gwqAjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzFYN1g0X1NQV0fCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MTAxMQ0KPiDCoCNkZWZpbmUgTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVg3WDRfSkVJREHCoMKgwqDCoMKgwqDCoDB4MTAxMg0KPiArI2RlZmluZSBN
RURJQV9CVVNfRk1UX1JHQjY2Nl8xWDMwX0NQQURMT8KgwqDCoMKgwqDCoMKgMHgxMDFlDQo+ICsj
ZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMzBfQ1BBRExPwqDCoMKgwqDCoMKgwqAweDEw
MWYNCj4gwqAjZGVmaW5lIE1FRElBX0JVU19GTVRfQVJHQjg4ODhfMVgzMsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDB4MTAwZA0KPiDCoCNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgzMl9Q
QURIScKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgxMDBmDQo+IMKgI2RlZmluZSBN
RURJQV9CVVNfRk1UX1JHQjEwMTAxMF8xWDMwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MTAxOA0K
PiArI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDM2X0NQQURMT8KgwqDCoMKgwqDCoMKg
MHgxMDIwDQo+ICsjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMzZfQ1BBRExPwqDCoMKg
wqDCoMKgwqAweDEwMjENCj4gwqAjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCMTIxMjEyXzFYMzbC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgxMDE5DQo+IMKgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JH
QjE2MTYxNl8xWDQ4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MTAxYQ0KDQpJIGhhdmVuJ3QgZmln
dXJlZCBvdXQgd2hhdCBleGFjdGx5IHRoZSBpZGVhIG9mIHRoaXMgc3RyYW5nZSBvcmRlcmluZyBv
ZiB0aGluZ3MgaXMgYWJvdXQ/IENvdWxkIHlvdSBlbmxpZ2h0ZW4NCm1lPw0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
