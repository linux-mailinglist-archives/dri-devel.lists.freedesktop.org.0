Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426382EAFC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 09:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B95410E43A;
	Tue, 16 Jan 2024 08:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2075.outbound.protection.partner.outlook.cn [139.219.17.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDC310E43A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 08:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ii9s8taqkwBuyBByQielUD/3IG3Nh0lXwp3X6ibVvJ93gb0yTbEQr4IeefqsgAH9lgVlNmAvqMCPy2gWZ0ikLRTOHrgtt1B+pDXtvcr5e3ry/7FRW8hQEkvOYF/VjVItmfB0vt+oUif0KRenY+AACZqaykTj5EfYHJNh37LWL6nzbeF6K7InjaC3PjLE4jgnmOWkEQ6qHmfa2EijwWyU/Awm0lFTELs5HI72VfRbrhbvSjMJDEmhv19UJJ5QAaFfmyXxrdQ8z9M5f0ah5Li8etKom8zgurtfxX4V8dF5r9qRN31rKv/sr6DJ/GEI6PQ1jKxPsirzKlZwE3XmUFQAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzzIoYdEVijIlMryrZa3NqHLckd8yHGGUhbsgQTRNNw=;
 b=KRCKrIITE+5iLuiNOQMpKwYNdqkP1Oz1pabcETQ379eZzijknDlJRfo1IuExpw/5Tcpbq5G7S0m6c4p0IF8vckMKVcRXwRUgLLZk1dcw6f/THeiZO95pT/JAPHuoE/193GUwaSarxylcYCuiXOjtBcrpFQHwsUROY6GvxhDj59bYj5SOcizZBp+CiJmZQDWU4FYtNBEWeBFQWOHn7km1Pn9TQuUoePoqZZHgsCqLukQWTKkL/l+6qnh2hqVtiCRhJ0FO1Dqg0SwcEa6SAnMT9S0Rlcf83Tt8evIQeFBOOipTvMscnX2IIWOpnGLJ9NNXi182Zj/Ng7CkmhXUocsQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1054.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Tue, 16 Jan
 2024 08:40:40 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::85fc:7fb9:8b00:dd88]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::85fc:7fb9:8b00:dd88%3])
 with mapi id 15.20.7135.019; Tue, 16 Jan 2024 08:40:40 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] gpu: drm: bridge: cadence: Add a driver and
 platform ops for StarFive JH7110 SoC
Thread-Topic: [PATCH v2 2/2] gpu: drm: bridge: cadence: Add a driver and
 platform ops for StarFive JH7110 SoC
Thread-Index: AQHaQs0EeUWZ9T6rEU2p9f7OMNv8XbDRMPeAgAr23NA=
Date: Tue, 16 Jan 2024 08:40:40 +0000
Message-ID: <NT0PR01MB1070A1E2AFF61EEA289B9FBDEF73A@NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn>
References: <20240109072516.24328-1-shengyang.chen@starfivetech.com>
 <20240109072516.24328-3-shengyang.chen@starfivetech.com>
 <fc30ce4736d43e367108c3651fec6f3b9a4d7852.camel@pengutronix.de>
In-Reply-To: <fc30ce4736d43e367108c3651fec6f3b9a4d7852.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1070:EE_|NT0PR01MB1054:EE_
x-ms-office365-filtering-correlation-id: c58f903d-8181-418d-d202-08dc166ed1f1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t9+iy1WoQ+R7MSvXnYqrXxvMAtWLK4bImlGujS9kaEvU7sf/8z3ZOe59eonKBSJVWgOAK49BN8NhMIcwawUHzwOjR8ZOkOpOkF3NLVnCg+54eoiAOyC/jb+vBSV3uzFQM3hsuVk39KaRQIUN/8I/xptExRPYThBlYq53xpfCt+SAqeFIIJ+87Yd7LJ7jNbVlx8ovr8xAN8HeKuCWV6P3cL6p2k9xzslmmG43yDhT5hv4YXsKtjB8kflzPVT6TwE0v7mdFxdlFC066t2jE8QP2mFTYwUXUMq6fK/hbu99StCNhPBa+iDVnEslybBurPZgDhGsxoqXmyXDIUeoxH8OA7jasBPd5htyuz8weqd+Le4bKmzRYIiw0AR+sSr97HUPlq1jjeAUw3uPL1586CEe565/X3snm4f3DoL4Ao9U3+Moswoz/vQjtLUpMaonE6HWSOoenbFqhJUrxBq2KSvWq5YwzTL1cKSEJXIsGc6rE4MGX33YV0mNHs5bR8CRrArVriD09/ApAP6pUTmXgMZXCiJVdZFegQg4jVgsIcHMfPTCbakPvSw8sVfRqMFm0rFr0fHJefjIlvdKa1nZmXt6dw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(346002)(39830400003)(136003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(40160700002)(38070700009)(38100700002)(122000001)(55016003)(7696005)(86362001)(76116006)(508600001)(83380400001)(71200400001)(41320700001)(4326008)(64756008)(8676002)(66946007)(66556008)(66446008)(40180700001)(26005)(8936002)(110136005)(54906003)(66476007)(44832011)(9686003)(53546011)(33656002)(41300700001)(5660300002)(2906002)(7416002)(100166002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2t6MUZMQUt4UkJBeFpvWFdMNmZXelBRNWZuclJjaWVSMUVtVE15UHFWZVJM?=
 =?utf-8?B?NUM2R0k3ZjM5ay9kaWpQNEc1RWFvZU0renhKSkx1TUpFd1VHa2I3V2tJaVQ1?=
 =?utf-8?B?eUtUcy9MdmxQeFUzYmVCM3RqWGJhOW1WeEo3MHhjVFlRNkZIK0JQY1J0bXhM?=
 =?utf-8?B?OWs1RkoxRzdSay9Ja245Tkw0OTZqV29EMVMwUkdSMUZvR0Z4OFBqOEc1SVhL?=
 =?utf-8?B?ZXNtNS9WVjdtQjdUNklRakxuc2JzUEdqNng1S3RmM3U2Q0xoQUtJTHJmV3U5?=
 =?utf-8?B?M2ZWUjlCeit1bzBOcWh3ZHltL1N2ZzJSZG5UcDZJTXBWbEV6RVNBSXMrZkVj?=
 =?utf-8?B?NmUvRk44akI4bEcxNDdCTUtJUTArQjRTMHFURm5CYVhrbFlFbUZwZ2hqR0R6?=
 =?utf-8?B?TUxlL24wL0daNG1HdFVEc2R3RkNZZjBaMXFYWFgzUW9NRlpWWEt3OGhUTTlt?=
 =?utf-8?B?cFR5Q3pacEdOc2hhQW9JSFdSemtYVmxFUVdiejlUbjNWYWZtTFd4VkE0U241?=
 =?utf-8?B?SmhsaGU2UVM1WWlaZEJoNE5kWWlkOFNualRXeVhDbE9sK2YydXVjMnFyekRt?=
 =?utf-8?B?WDBScXBTMHVIdzdwTXlFMkt1VmwrNEFienJjYW02bzZlVjBsaTkyWmFyYXFJ?=
 =?utf-8?B?N2w3TVErci96cVlUcW5ZUTYzb3JrY2RGY3kzQ0l3d2pBNHYxclNVbEdnK2lX?=
 =?utf-8?B?aHE2SjluVm90eDFmNEptUElIRTlaRjN4SG5scm1GWWx1dzFIYXM0alJkUXBX?=
 =?utf-8?B?R0h5aU44RmQxQUM0SEx1YS9UV1RvdVoySFBnNm5PZTVQbmdVcmNnSUhTbTdi?=
 =?utf-8?B?TzdsV1A0alJ3TEtsMU04Z2FVb0ZXQmt0ZTlRaXJPallXejJKYldyTjN1V1VG?=
 =?utf-8?B?OVAzanY0MWNBVE11bmxnZnFOYTR6TnlVVVZPeGJKbUI3RDlSSGUvQWpibWNF?=
 =?utf-8?B?cXREeXpJa0ZOWjR0SktXc1dmL3hCTVlEcU0wdEJ0cWduUXBORHUyNk5ZalFL?=
 =?utf-8?B?dHFneTczSEhZbzAvTmpKYkxMK1J6TWxsM3J5bEtWcCtqcmp2Y0w5ZTdaeCsw?=
 =?utf-8?B?MU8ya1hDei94K3NXT2xJYzRzNFlLKzFVREZnK3lmbXIwMUtMUnQ0TGc1cERs?=
 =?utf-8?B?V3BWbVdqbVlDbU9QTTFVdHZWSVRTZWtxSWdwN2lnUmk1eXZzT3IxbXMrMHNZ?=
 =?utf-8?B?MGFuUVhhb3FVRmwzbFJaUzFKUStHcGtTSENZSnVZaTc2R0lOQVZhNWhFSGh4?=
 =?utf-8?B?N2tUWVJ4R0s4R2E3QS9UTFZuNnlHWFpQUFNSb3ZTTHYvTGZpMENUckZrM2hC?=
 =?utf-8?B?MkxISGE0Z1pRakd5RE5rWVdNOFhxN2ZaSXJYK1dBL1RDeFpqY2hYNXZSbnBr?=
 =?utf-8?B?bG0ycW5VRlpPMVpMUjQxQm5sTS90UjlpMERCbmlUdzBWMzM3S3RsZVRvaE1O?=
 =?utf-8?B?UGlScmFzaWpjNWorZEhreFBNcmVWSStueWhaZjg3cFkwckVqNXM4eDBlU0lI?=
 =?utf-8?B?N3Ntdldad1pyY1BHc1k1WjZkemVMYjVab2ROV3ZhM09IKzBvSWt1VzhqWWtL?=
 =?utf-8?B?WnRrUUpmc081LzlZVENhNExCaVU4dlZCYW83NFJMZExBUS9iK2U1emRwOVlj?=
 =?utf-8?B?SWhZYmJLTzY2YjhYWThyWFBMc0hpdWVCeURDYWU0LzZVVTBtUVJGY3BGNFlq?=
 =?utf-8?B?dEIwVFhGRE9BK1FQWWZvT3h1ODQycVR3eENzMUlGZGkxZGdydGozM1FlSWN1?=
 =?utf-8?B?cXpyRjQxTTlaS3QwT0RUWEVNblNXeCs0cUdtYjhJdGRVekIvLzZpU3hzazdI?=
 =?utf-8?B?MmlscVk2YVB3NFJnL0FOZ05Kamt3Q2w3REp1WnB5REp2ZzVDNmovU24xcUlQ?=
 =?utf-8?B?amN3eXp0QWM2a09jM0VkYk9MRHplNkhvd3JCZUtWR3IyUGtKZXBKZVdWTHQ3?=
 =?utf-8?B?ciswRFExUHZlV0V4ZXBTVDhuSDNOZzZTcndzS1Y4ejNVSTV0bFZib3pGcFcx?=
 =?utf-8?B?dkZ0V0lGckxCUW4xWEVGQWlYUlk4dm5TQXkrRzQvVXlpNjJDUTNwdHJmWlNR?=
 =?utf-8?B?UWNiak51QURMdVNzc3NGQm1CV1d1SnptZVFVMFRVcHFjZ0NlcUVwR1psOERt?=
 =?utf-8?B?T2tocUw4aUlMbS81Zmxhc1UyWnNBZzhGdGh5aGlqUVVDZU5CdzlXeUJ3cmJP?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c58f903d-8181-418d-d202-08dc166ed1f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 08:40:40.3723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fW3eb/KBktLvcaF/Sd1/fBBQMfaIHw5Ce+Lo3wbahXMh6XmpdEtQEJ0jAZ+q/+Sw+qFebQ7imPsufPUHe3s1/aUJGdYwZDDJhz3xFkFf1EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1054
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
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "r-ravikumar@ti.com" <r-ravikumar@ti.com>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "aford173@gmail.com" <aford173@gmail.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFBoaWxpcHANCg0KVGhhbmtzIGZvciByZXZpZXcgYW5kIGNvbW1lbnQuDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4NCj4gU2VudDogMjAyNOW5tDHmnIg55pelIDE3OjA4DQo+IFRvOiBTaGVuZ3lh
bmcgQ2hlbiA8c2hlbmd5YW5nLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT47DQo+IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBh
bmRyemVqLmhhamRhQGludGVsLmNvbTsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgcmZvc3NA
a2VybmVsLm9yZzsNCj4gTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tOyBqb25hc0Br
d2lib28uc2U7DQo+IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgbWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tOw0KPiBtcmlwYXJkQGtlcm5lbC5vcmc7IHR6aW1tZXJtYW5uQHN1c2Uu
ZGU7IGFpcmxpZWRAZ21haWwuY29tOw0KPiBkYW5pZWxAZmZ3bGwuY2g7IHJvYmgrZHRAa2VybmVs
Lm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOw0KPiBjb25vcitkdEBrZXJu
ZWwub3JnOyB0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tOyByLXJhdmlrdW1hckB0aS5j
b207DQo+IGFmb3JkMTczQGdtYWlsLmNvbTsgcmR1bmxhcEBpbmZyYWRlYWQub3JnOw0KPiB1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU7IGJicmV6aWxsb25Aa2VybmVsLm9yZzsgQ2hhbmdo
dWFuZyBMaWFuZw0KPiA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPjsgS2VpdGgg
Wmhhbw0KPiA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsgSmFjayBaaHUgPGphY2suemh1
QHN0YXJmaXZldGVjaC5jb20+Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBncHU6IGRybTogYnJpZGdlOiBjYWRlbmNlOiBBZGQg
YSBkcml2ZXIgYW5kDQo+IHBsYXRmb3JtIG9wcyBmb3IgU3RhckZpdmUgSkg3MTEwIFNvQw0KPiAN
Cj4gT24gRGksIDIwMjQtMDEtMDkgYXQgMTU6MjUgKzA4MDAsIFNoZW5neWFuZyBDaGVuIHdyb3Rl
Og0KPiA+ICtzdGF0aWMgaW50IGNkbnNfZHNpX2dldF9yZXNldChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBjZG5zX2RzaQ0KPiA+ICsqZHNpKSB7DQo+ID4gKwlkc2ktPmRwaV9yc3QgPSBkZXZt
X3Jlc2V0X2NvbnRyb2xfZ2V0KGRldiwgImRwaSIpOw0KPiA+ICsJaWYgKElTX0VSUihkc2ktPmRw
aV9yc3QpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKGRzaS0+ZHBpX3JzdCk7DQo+IA0KPiBQbGVh
c2UgdXNlIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKCkgZGlyZWN0bHkuDQo+IA0K
PiBBbHNvLCBjb25zaWRlciB1c2luZyBkZXZtX3Jlc2V0X2NvbnRyb2xfYnVsa19nZXRfZXhjbHVz
aXZlKCkgaW5zdGVhZCwgdG8NCj4gY29udHJvbCAiZHBpIi8iYXBiIi8idHhlc2MiIHJlc2V0cyB0
b2dldGhlciAtIGlmIHRoZSBoYXJkd2FyZSBjYW4gaGFuZGxlDQo+IGRlYXNzZXJ0aW5nIGluIHJl
dmVyc2VkIG9yZGVyLg0KPiANCg0Kb2ssIHdpbGwgZm9sbG93IHVwIHRoaXMgaXNzdWUuDQoNCj4g
PiArDQo+ID4gKwlkc2ktPmFwYl9yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KGRldiwgImFw
YiIpOw0KPiA+ICsJaWYgKElTX0VSUihkc2ktPmFwYl9yc3QpKQ0KPiA+ICsJCXJldHVybiBQVFJf
RVJSKGRzaS0+YXBiX3JzdCk7DQo+ID4gKw0KPiA+ICsJZHNpLT50eGVzY19yc3QgPSBkZXZtX3Jl
c2V0X2NvbnRyb2xfZ2V0KGRldiwgInR4ZXNjIik7DQo+ID4gKwlpZiAoSVNfRVJSKGRzaS0+dHhl
c2NfcnN0KSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihkc2ktPnR4ZXNjX3JzdCk7DQo+ID4gKw0K
PiA+ICsJZHNpLT50eGJ5dGVoc19yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KGRldiwgInR4
Ynl0ZWhzIik7DQo+ID4gKwlpZiAoSVNfRVJSKGRzaS0+dHhieXRlaHNfcnN0KSkNCj4gPiArCQly
ZXR1cm4gUFRSX0VSUihkc2ktPnR4Ynl0ZWhzX3JzdCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7
DQo+ID4gK30NCj4gDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0KDQoNCnRoYW5rcy4NCg0KQmVzdCBS
ZWdhcmRzLA0KU2hlbmd5YW5nDQo=
