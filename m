Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D082EBB9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D6F10E448;
	Tue, 16 Jan 2024 09:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2049.outbound.protection.partner.outlook.cn [139.219.17.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037C110E448
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pom0Vn4Q4XEB+fA1szVYIalczLF0MVIG09pIg4wx+bZ323DwfLLNQ6J5I8QGWnd1x30MLL0rLoGqkbyFABQxjEqI9hG2/qkMyn6jLctlaZfwkJWMTIT/luUMjaSFLnTWi9tcNM1RvOByOtOnFtqtHZ8Z6Al4/JN7O1sS9bH8pt0HO58l3MCaU0dVr2soDmup9gPkUXxNObmNX3ieMyQY4NY9oSbYBIezJm3C78T645/1jZ9wuyhdmZSTzDsDk/9ddU/GllTiY6OCf3PwKBx2WiowJhN5h76xeuh7EvLdIJJ9NAEF/D//TOKcLlRWW05aZVZTRLP6d8Sh9ONYKPQekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGuJ5XEzeef2UP4N8Uzqabdpi9Umrnb2zufwoAQ55tc=;
 b=W8+jVG2joycJKwNuH+jt7ES9qREMaFsI3/1m3XbQ3SjmGR9Qh1u9zufbWJiykFvuzKqgsAaVIH2iO5O9RzNI9TgzYriEq7FXSycf3fXKXUKo7GH/NOABMgMcH9vbgdL0iWB6cGKiHUORJSmnfSRfISZpnjYrSnfaS9dNZ2tr6UYHzE6zhae2DaI6aYSoxeGOdt3a08Wjv+QfuNTDHhvhw8oxFp7uGW1lucbE2HMVNt+HkijvEV46fQH8YdlbNzeZSFodpnUADuaHIHs7VRaMcTeQkuY2wWwiXpkPnGJ79ictrLSlGxXqIo6KtF9Qp0aOTG7Eb69huLeATI2ZUAKxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB1077.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.22; Tue, 16 Jan
 2024 09:40:21 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 09:40:21 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Thread-Index: AQHaQsrah1i3yuxB3U6jMn0bFe2vKLDRrScAgAqKI/A=
Date: Tue, 16 Jan 2024 09:40:21 +0000
Message-ID: <ZQ0PR01MB1062EDD1B18349619DF14654EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <20240109070949.23957-2-shengyang.chen@starfivetech.com>
 <20240109-worsening-material-fae02ff4e611@spud>
In-Reply-To: <20240109-worsening-material-fae02ff4e611@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB1077:EE_
x-ms-office365-filtering-correlation-id: cfa60c10-1ece-423a-1ff8-08dc16772834
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SiHYfNYkRAC6fS8hJc1LpB/+BMwPyX1Mg2S6Ro9niceFpLeaScxCxFGdmLLhjPlE6YDlbKEOmle2datJSW3Q6VMTgfzlw/ngPidetGPOrkmBBe4XTgvx8c0Wzjw64AMBIHFvGeb41hnjDbHRZ9bMN6xJsWEmiLQ1Kiaqe21lHSkdLXWf4daieAheWpxOwwyy7j6M4kHLhNGrpz1NnvijGilwKXk9INNISSYXfDZ8dbP7iDlw8K0qoUXMZRxj6AlLS9ynU/k0WCfZzAi7M5kKKAGMvmVmcdseEJV5riS1PQ1kS+0luXigjp9lPiqgZsMQ4l+RMyokzBrAuBledioXt0c16bA4gxwgXXm4AGmd/wU3WOqq78zIV/DT3TBZ5W0PEoyHCXg7Hy9jICADMdY2uU5agEgQI0vvs+7cv2KWE10JeqhcNjRLnAPD9negr+vM4rikj1TwBfa0u8IIOmx9qBQ6hwMC2maKdHSVZFB3M6HWR85364TzccpZifFAjDNJN83PGj455vD3GGOlBQgXFn1WZfLjV+JFTPSKIZisrc6i4rHcmo7VBY05p9ZYbsWq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(39830400003)(366004)(136003)(346002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(9686003)(5660300002)(4326008)(7416002)(8676002)(2906002)(66556008)(7696005)(76116006)(53546011)(66476007)(54906003)(64756008)(8936002)(966005)(44832011)(41320700001)(508600001)(6916009)(55016003)(41300700001)(86362001)(33656002)(122000001)(38100700002)(66946007)(66446008)(40160700002)(38070700009)(40180700001)(83380400001)(26005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RmxJdXB4dnM2cEJIU3RabmZRTmttZHp2R2xuR3Q1N3cyUFRVTFF4b1JBRFRT?=
 =?gb2312?B?RFVjMVNkbkRla0hnWFhmRkZpcHlwSmdDQUpLRFNESXZzeFV5czcwOXlHVXRU?=
 =?gb2312?B?SEpDcGNLL3lDUjk2OGhXaFBrb1E1S2hRN2NQQ0pxS1JrU2hQWkwyVnA2SlhE?=
 =?gb2312?B?SnhQMDFxUzQxdEhnT3A1THNlRng2Vmh5ZmFpdk5KZzRhUTdyZDBqNWxYdFQ3?=
 =?gb2312?B?K09vd3JYWXphb0h3OGgwZ1NDL2pCUjJDNUs3R3NqUEJmRlpRcnVIekpZVUpE?=
 =?gb2312?B?bEdoMUhaYzBXQktkWDhpTXB3ZUZrNDN3cEI5d1l0RnBqd1AweVJNMkZoTXJP?=
 =?gb2312?B?THl3SWxVSTVvQVg4N2hYU0ZKNG9JYzRtMXFsWXlXd0h3dm5ybWtoSGdvMmw2?=
 =?gb2312?B?R1JBWHFIZ2RsOFhjV2RmRnQwSGpPK2tNbWZCUWtyWExBTWVJWXd6T0FYd2ZV?=
 =?gb2312?B?Wnc2VWxRRGxtM1YrNm1iSG5SRmxPM3FIUGlBQ2o1dEtBc1ErL3lRdEpxcDNa?=
 =?gb2312?B?d29RdUg3T0FrVlFrazI2ZVE5aVJWOUtiY0VlQlFPQ095azU0Vm9qQVZhSSt6?=
 =?gb2312?B?M0g1RTZRU0NEUzdhVjhOZ0ZwUkMvTW42Z1dxSm9BZ0t6QzhWYkEyRUcrcFdJ?=
 =?gb2312?B?NnJaM0NkQkRPUUtGWFI1cXV2TUxZSDJpVlRrQlF0THcvTnM2MzlXSkJLT3lj?=
 =?gb2312?B?MnRWTWxXT0hQMDUrMEVtY0xRUjYyQW02WUFsbmFXckNzaHQ5em1ERGF6NTAx?=
 =?gb2312?B?ZEh3Y25CT2N3ZXhjZHIrMnpENXo3aXJQWUJhZnpaeGs4Um9meVBTWkNiNm9T?=
 =?gb2312?B?elpLMFZCdVk4Zmdieno0M1R2em5rc1JzMmhoYjZDSTg2eVdFaUkyQ2xFSmhN?=
 =?gb2312?B?c1d2N2VzVFNzRkpwT2lKS3hsNU9LK3N2VkpDVTFZdU1TRTZweUtGMW1JVXVE?=
 =?gb2312?B?TThONlVHWHg5SHdYeXdpTW1RaXZ5Uk1DdWtoR2l0MDVmUkloYnRpUEFMc1Vi?=
 =?gb2312?B?eHg4RlNrdngzR1EweGczeHpIelpmU0NCWlgyZGU1NHFRRncrTHJzVTFzK0ov?=
 =?gb2312?B?VWUxWHZPWVNIUWNOaEcrM3h4RHE5UU9jZEE2cEFWYTNzanAwZmlVVFNqbG1F?=
 =?gb2312?B?eXpzRGlOdHF6dWhocWdVWmdmVld6VjltK1pSZnBkN2dmTWplblRaRG5lVzFm?=
 =?gb2312?B?blNoMzdVQ1A0Tzh5SjdraW02WUU4bzJTNnA0eWVoem80anc0TmJ0NUVsYklw?=
 =?gb2312?B?ZSs1SFJxQ0ZVZXYvbE0xRW9SQkd6OUdWOE9CQUU1dWdBQmlXUjBOaEl4eVoy?=
 =?gb2312?B?cU1ReHE1VW51QTFwOURpaGEvQm1xMlJkblFvRTFyKzBjVTQ0VW0raUhOZldN?=
 =?gb2312?B?MUp3WDZHZGM0bTZrYU96K21LTVBMRDMvUnQrNk5ZWXVXZmY3T2IyQytoaWli?=
 =?gb2312?B?MkszMmVmQmwwWEZtQVhzWlJsSFRKTDNvdHF1WVFPeXBJREZ6eXBsMitNTUhw?=
 =?gb2312?B?UWpLdStYQ0RTZGk4Z2FaTW1LU25xbkpOOTkwaGpaUExVRHE1aDhLOGkzdi9X?=
 =?gb2312?B?V0hZRFRMeDRTWXVMci91ZUNNVnZZOVJxSGM0c0EraEhSazZ5OVUweUJQTmZq?=
 =?gb2312?B?NGhNYzY5alhGTnZpbDNuRElOc3RMNFQrZGErcWk4ZVFacHNpSEp6akNPU3hy?=
 =?gb2312?B?L0R6dTQwNGFLZEp3a3VrZ29GY0E1RnhaT0VlN0loRTdtaWFXckRHbyt3TUhB?=
 =?gb2312?B?UlRvQ3I1dUg1WW9adjMxRFFic3B5Q2U5Q2RhZ2NuVlhKSnlKaFhhSmlPWDM2?=
 =?gb2312?B?WndXcEZPdW9KRHJSU1orNW5Ma0puaXRPbDYyNGFaeGo0K3BhSExkVVR3ODNv?=
 =?gb2312?B?dnFRZDVIcnhLSFdKOHduQVY1VkExLzhnVXRRMDFpRjN1b2ExSkJUbGtZbkxl?=
 =?gb2312?B?OXFHbmdJc0lHVnhiV1FzQ0Q3RStMTVpOS21VVEEyYlhuNDd6RDVSZkxXSzhT?=
 =?gb2312?B?V0tCdkJIbm5tWjZTUnk4TUVuR1hzTE5GY2ludGVmSkV4SEZmSUt5SkN2T0ZW?=
 =?gb2312?B?dUZSRUdGNWdwdHhOcXVQa0RKUEFZTDhrenArVW5UNXovUHFkOHhxdWpIK1gy?=
 =?gb2312?B?YW1pQXRHNEllQWVBdHlTZFRuYkpkRXFxK3U5UlJaVmdhemtIU2VwVTFwWGdN?=
 =?gb2312?B?cVE9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa60c10-1ece-423a-1ff8-08dc16772834
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:40:21.0730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aMUw7k+/v/pOmjj7XU3gD4uGARi71OlxVqSOHmY50d3+vpNDhr+B0qkDzpn5vY9qi20Ek2D0v4OvHpUAjJfsAHek6Y7WMZ5y4JLRt3DHFzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1077
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENvbm9yDQoNClRoYW5rcyBmb3IgY29tbWVudC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+DQo+IFNlbnQ6
IDIwMjTE6jHUwjEwyNUgMDozMg0KPiBUbzogU2hlbmd5YW5nIENoZW4gPHNoZW5neWFuZy5jaGVu
QHN0YXJmaXZldGVjaC5jb20+DQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9y
ZzsgcXVpY19qZXNzemhhbkBxdWljaW5jLmNvbTsgc2FtQHJhdm5ib3JnLm9yZzsNCj4gYWlybGll
ZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaDsgbWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tOw0KPiBtcmlwYXJkQGtlcm5lbC5vcmc7IHR6aW1tZXJtYW5uQHN1c2UuZGU7IHJvYmgr
ZHRAa2VybmVsLm9yZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBjb25v
citkdEBrZXJuZWwub3JnOyB3YWhyZW5zdEBnbXgubmV0Ow0KPiBkYXZlLnN0ZXZlbnNvbkByYXNw
YmVycnlwaS5jb207IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsgQ2hhbmdodWFuZw0KPiBMaWFu
ZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPjsgS2VpdGggWmhhbw0KPiA8a2Vp
dGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsgSmFjayBaaHUgPGphY2suemh1QHN0YXJmaXZldGVj
aC5jb20+Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8yXSBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IHBhbmVsLXNpbXBsZTog
QWRkDQo+IGNvbXBhdGlibGUgcHJvcGVydHkgZm9yIHdhdmVzaGFyZSA3aW5jaCB0b3VjaHNjcmVl
biBwYW5lbA0KPiANCj4gT24gVHVlLCBKYW4gMDksIDIwMjQgYXQgMDM6MDk6NDhQTSArMDgwMCwg
U2hlbmd5YW5nIENoZW4gd3JvdGU6DQo+ID4gVGhlIHdhdmVzaGFyZSA3IiA4MDB4NDgwIHBhbmVs
IGlzIGEgY2xvbmUgb2YgUmFzcGJlcnJ5IFBpIDciIDgwMHg0ODANCj4gPiBwYW5lbCBJdCBjYW4g
YmUgZHJpdmVkIGJ5IFJhc3BiZXJyeSBQaSBwYW5lbCdzIHByb2Nlc3MgYnV0IGl0IG5lZWRzDQo+
ID4gZGlmZmVyZW50IHRpbWluZyBmcm9tIFJhc3BiZXJyeSBQaSBwYW5lbC4gQWRkIGNvbXBhdGli
bGUgcHJvcGVydHkgZm9yIGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2VpdGggWmhhbyA8
a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZW5neWFu
ZyBDaGVuIDxzaGVuZ3lhbmcuY2hlbkBzdGFyZml2ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sICAg
ICAgICAgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0K
PiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbA0KPiA+IGluZGV4
IDExNDIyYWYzNDc3ZS4uMDJmNmIxYjJkZGM5IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlh
bWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9wYW5lbC1zaW1wbGUueWFtDQo+ID4gKysrIGwNCj4gPiBAQCAtMzM1LDYgKzMzNSw4IEBA
IHByb3BlcnRpZXM6DQo+ID4gICAgICAgIC0gdml2YXgsdHBjOTE1MC1wYW5lbA0KPiA+ICAgICAg
ICAgICMgVlhUIDgwMHg0ODAgY29sb3IgVEZUIExDRCBwYW5lbA0KPiA+ICAgICAgICAtIHZ4dCx2
bDA1MC04MDQ4bnQtYzAxDQo+ID4gKyAgICAgICAgIyBXYXZlc2hhcmUgNyIgKDgwMHg0ODApIHRv
dWNoc2NyZWVuIExDRCBwYW5lbA0KPiA+ICsgICAgICAtIHdhdmVzaGFyZSw3aW5jaC10b3VjaHNj
cmVlbg0KPiANCj4gSXMgIjdpbmNoLXRvdWNoc2NyZWVuIiByZWFsbHkgYSBzcGVjaWZpYyBlbm91
Z2ggaWRlbnRpZmllciBmb3IgdGhpcyBkZXZpY2U/DQo+IA0KDQpSZWZlcnJpbmcgdG8gb2ZmaWNp
YWwgd2Vic2l0ZVsxXSBhbmQgTmVpbCdzIHN1Z2dlc3Rpb24sIG1heWJlIEkgc2hvdWxkIGNoYW5n
ZSB0bw0KIjdpbmNoLXRvdWNoc2NyZWVuLWRzaS1sY2QiIG9yICJ3YXZlc2hhcmUsN2luY2gtZHNp
LXNrdTE5ODg1IiBpZiB0aGUgbmV4dCBwYXRjaCB2ZXJzaW9uIGlzIG5lZWRlZC4NCg0KWzFdOiBo
dHRwczovL3d3dy53YXZlc2hhcmUuY29tLzdpbmNoLWRzaS1sY2QuaHRtDQoNCj4gPiAgICAgICAg
ICAjIFdpbnN0YXIgRGlzcGxheSBDb3Jwb3JhdGlvbiAzLjUiIFFWR0EgKDMyMHgyNDApIFRGVCBM
Q0QgcGFuZWwNCj4gPiAgICAgICAgLSB3aW5zdGFyLHdmMzVsdGlhY2QNCj4gPiAgICAgICAgICAj
IFllcyBPcHRvZWxlY3Ryb25pY3MgWVRDNzAwVExBRy0wNS0yMDFDIDciIFRGVCBMQ0QgcGFuZWwN
Cj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQoNCg0KQmVzdCBSZWdhcmRzLA0KU2hlbmd5YW5nDQo=
