Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3082EBBD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1248689FEA;
	Tue, 16 Jan 2024 09:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2056.outbound.protection.partner.outlook.cn [139.219.17.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E8589FEA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOLZ+YfX98LM5jElygPH1RcEHtn8dzmtTSLJ9nVFRVT6+C9G1dQhRXy6E0kWGxXdgo3dUnAEac23jGE05k2ok4C+AvWS6AUJHfADlu8FPHSUDGivSCMZrxxSw7+FdWuNBQlU6uZS7usg1PLXQ9bKZoVWiw4BAmFlRAxF3W03YJ+W7DJOJtA9n2lvYOQ6VLj0P1MZ2s/9gdhpoYOBlSufOaxtXUBux4exhQynGTBtewel4+AaFiibeDKZjcVOtX4ta5zfhm7wyy9DwtAu5FF5rd4rjQi7RHSjJOKMaaSHk/70wsqSWGDfYy7EGhJYpd/P7ndOm+SiLfp/I6kYrJBeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYfAFSkz+OsV9C1XCNWDCMU9cHcz8BFt+KXbjkWj9vk=;
 b=PrkWH+O23pwej9W5XuKN3t4B8SmfZ0v+HRHs2JTwcnoZq5yP9oFrcYRBOEkSubQEBArcPvjVIj3f4dDG+hU4vOLW8R2bB6Tbu6hcjvbLh5jcCdhLBxsDYAqIGR3zn/6csoZyts1xx+QC0lH1RlI5VsqD0+2qkssUBb/zIj2Wt4F5VLdiUMJyZZVNlOdIi9hj9rapv+vHZvIrkL5Q2BmcY02vl8jqCSayhPGNi2iCSIEQ64Pl2z8AkCFC6zW2KXR/lbCFjSon0M166q+iHygjoZyFuOcuz7SfbAxKbd7b/4bv1rkanbE2YgcINOXYuDcp277zG9jVZYkbrkW3tZ0YiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB1174.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 09:41:04 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 09:41:04 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Conor Dooley
 <conor@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Thread-Index: AQHaQsrah1i3yuxB3U6jMn0bFe2vKLDRrScAgAEVtYCACXbK8A==
Date: Tue, 16 Jan 2024 09:41:03 +0000
Message-ID: <ZQ0PR01MB106218474E32786793E2FBB6EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <20240109070949.23957-2-shengyang.chen@starfivetech.com>
 <20240109-worsening-material-fae02ff4e611@spud>
 <80b898a0-1f44-4623-9df2-edccb9307098@linaro.org>
In-Reply-To: <80b898a0-1f44-4623-9df2-edccb9307098@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB1174:EE_
x-ms-office365-filtering-correlation-id: 273e89bb-9576-4141-3e10-08dc167741c8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ktmtsJe3IWI5RHKfqb4qniI3T70S4dVQM5d2qa1m5PauKHg3If6bfWuyWOdKXUvN0JW7sKUK9vIMAFLrpKAYFreKTBZTb8AKWRMUmEwC5P04g0gKqqtH+CcctVB5mg4DHsdRyHO6nCEWbyFSRV5JanasnPeH1sbmjOyUaRkju4WHCAi9Y/uYTqQsiHHMzf0dWyQRh3JLlNgCzQDzYuaAgl/XJkDKWtwaEkSVQvMtkXj6a4yAWb7nJoyv2Pt6r2tKRSWCdJF9OS38t4P8Me/edOCqoZl+s6Jo1g4TW/4C1CdQBsvJmPaJNEPHI/loth/iwdI7+xk5ZH53CUccZlpMMlp99Y5w45DeqjSQF302sOlEtIZig4gPi2OM6Ch/yA4FxD7zOnmOOK8WRCMga9pdsSXpxhBA0BQQPdfaZkvlufdiW72vQXo5Acbb7P8aXjs7hWHO5csM8ivx00bjpl0F6XEwPzcNj20zHm3NaNI2GR8NRhAoAXzm0SwyFELD7fIAuA0f5N/rQsqP0oNDaN6x4ClNK/eKyoX4yiaNr/so61gNnYIj1gjIGF10uoC29F9o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(136003)(39830400003)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(40180700001)(4326008)(8676002)(8936002)(2906002)(5660300002)(44832011)(33656002)(41320700001)(7416002)(41300700001)(38100700002)(38070700009)(53546011)(55016003)(7696005)(40160700002)(71200400001)(26005)(508600001)(83380400001)(86362001)(9686003)(54906003)(64756008)(110136005)(122000001)(66446008)(66556008)(66476007)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEN6QTFLcUZiNCszZW5BeFVGemhJY1NwL3Q3eHdsNkF4OTZ3cDNrSTltdWRV?=
 =?utf-8?B?S2NzWHN4cDArRWxXeHVZWFZmaTJ6UTNvVlZvdndsdzBMT3NJRnZwZ245WkVj?=
 =?utf-8?B?Vm02SVFrUENrZWtHUCtYMUk3bmlJUEg3UjFFcTlpSnFENGZ2S3FGa2hvZ2kz?=
 =?utf-8?B?YTdxWUNxLy9JbUlSbVIvZ0puc1hnZkIzVEhDNFI0dDVLZ3hsekVnQndqWGFT?=
 =?utf-8?B?OFFmclhyZE9LU29ZejVOcUxTM05qRklaZyt3V2JLZ3puK2dPdTh1MXM5N29j?=
 =?utf-8?B?aWw4Wit1anZiN1dyYW1LL0JQVW8vdzNVZkd2SU9UbU0vdUNuZlRzcHdmQS9w?=
 =?utf-8?B?U3ROVGp4c25jYXhnVDIvNmRLSmltUU1pdU03Y1dCZzdxbzJvWnA1Mk1xNmVi?=
 =?utf-8?B?REUxUHVVN0pKSG4vVjBaMzFXc2Jab1dKUzVBL3NrL0NSV29ySXBaUkJtMzl4?=
 =?utf-8?B?KzAyVnh6bjlabVl1TW4vNXhFWXU4TmRyRmVxRDcvVXVWWTVVbjkrbUdaV2Nu?=
 =?utf-8?B?S2xodEYxSkNaMTFpR0tTLzU3d2gxa0pBT3Z2ZExvcFloN25jUGdORjgyUWpT?=
 =?utf-8?B?L1JVK1Zjb01aY2tQK0RHaHA2WWN2aXRtUjJyWGd3aXMwYVJhYW1rV3hOL1JC?=
 =?utf-8?B?MzJEUmdnQXlqNWNwZHRYQlVyK1ZXekorVlJWR1VUK1F2ejVibGRkamtHSGN4?=
 =?utf-8?B?QmpPSU1KUEZPNTNLcVlqMHkvNzc2akJqS1JVUnk2VTd5SUoybTJDbXhKK3M3?=
 =?utf-8?B?Ulg1QmVIa0ZZYVNydHhpK3A1NTh5VHNpRVU0M2ZzQncxS3VVd0NKUkZaZ1ky?=
 =?utf-8?B?M3N5K3hwdmtVQkNZdFlmM3dCK3hSbkFNekMxNEM4bHExM1FwSERWeCthc2Z4?=
 =?utf-8?B?MGNRUlBkSGtXckdJb01BWnIwb3NPb1JObTFmU2JoRC9YaGpuMkxhdlJINzJ2?=
 =?utf-8?B?SmVlejBXck1UdkUrVlRLQ0tiUDFQdGE0M2sycUxzVG1LNmhWVHAzMFNQak9H?=
 =?utf-8?B?VWIvSm5lQWxESGtubTFZUmg1RWVkODZST1hETDhVdk5MeHlJYnNERHl6bUYv?=
 =?utf-8?B?dWtyVUtMTndRWHRWTmduYmFHWGhjNnhOZDRYQSsyb2xieTZUU0R0aXkycEt4?=
 =?utf-8?B?OXArVTVhOXFNWjZqWEhteW9aM1NpNGhJMzZtbHphbG8vUHMxNDhUeHh6ckRB?=
 =?utf-8?B?NDJxbWVwZ1dybHJkSXQ5MXdaUC9RaEM0SDdkeUZWVEd1SGQ1MW1jTjJUdmN0?=
 =?utf-8?B?bFEvU0ZkaW5UNGFrYm13Q3liTTZTd2lFVUFxT1YvOTNZblkzRHRidzdEMmp2?=
 =?utf-8?B?YVR6TG8vRzh0U3hqbHp0dEt1Nk14NGZmaE5lQkphcXA1QWlyUHBwK2MwQ2xP?=
 =?utf-8?B?dytiN0tIbmlQL09SM1c4U2pVdFo1Z1kwejUyZklyZzkzU0hTYkpUUC9tWkQ4?=
 =?utf-8?B?TUlRbHRmT2dSNVBqN1hYUThjQmt4dzI2aHJ0bzE1b0RmODQxUDVoTmZyVWl0?=
 =?utf-8?B?bTFBZXFZZ0M1WTlSdVhNek1uWFFyRDliVEFlVkkwbi9GV0tFaGx1azNFcmZT?=
 =?utf-8?B?Mk9yZENHY3ZlWEdISDBSaU1hQmZ2MlZGbkF4ZFZHbXg2TlE5bmxIdVNGaStZ?=
 =?utf-8?B?bzJPeklubHk3SVlCQUV3YzRoYXJHOFNLVGxONGV4RFIxV1A4YnZnM00zajhV?=
 =?utf-8?B?L3Zvai9oejNFcXdDcGR1dTFjMWxobnNLSUg3TXJ0alFoL2ZZNkJPdUJJYTVL?=
 =?utf-8?B?UzZOa3F2aW1zQ3J2anZIRzRmV2FPZU8vVjRkQ3gvY1gxdlYyOXhuOFlraXov?=
 =?utf-8?B?MlgzNldiT0w1bU5QREthSlE4Wi85dzRNM3VMUnhBNFJlWGFmRHFERDlaMHJW?=
 =?utf-8?B?VzUzbnlvY3M1d25JZCs2N2N6UnYyUlFtNzBtVk1uZDEzZzNPQ0RYci9XZlZu?=
 =?utf-8?B?T0xxNmVVWmllOVordG05dkZzTDUrK20xbEx5bkNIWmhwRlVKWUkzUDdFWkNK?=
 =?utf-8?B?LzdNMTRCVnAzSHlIMGEwbHNqQm9hWkhLN0RKSVVqQWVSYUcxM0xRUE5FOXA1?=
 =?utf-8?B?MzdjdmI5dTZ2YkpLNStPMS9zN2JpcjZSUUZOYnZjWDByUUtBWG9weWt0ZzVj?=
 =?utf-8?B?MFNpdzhOT0NDV3ZOcWxpUmg5ZTZNeDI5eXFCSmpSelY5eWtvWnFuL2ppc0xE?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 273e89bb-9576-4141-3e10-08dc167741c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:41:03.9897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kDOfMFxrb5bkuUGwPm9BUJ+ieI27cAS9zsvJbLIeGwVsRmZwPXmLGTIAtdAH1neLGbcFPMAM+EkqzuXHd6zvhxl6GEfMmz78S4ZNaQ39Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1174
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
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4NCj4gU2VudDogMjAyNOW5tDHm
nIgxMOaXpSAxNzowNg0KPiBUbzogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPjsgU2hl
bmd5YW5nIENoZW4NCj4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+DQo+IENjOiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsNCj4gcXVpY19qZXNzemhhbkBxdWljaW5jLmNvbTsgc2FtQHJhdm5ib3JnLm9yZzsgYWlybGll
ZEBnbWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgbWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tOyBtcmlwYXJkQGtlcm5lbC5vcmc7DQo+IHR6aW1tZXJtYW5uQHN1c2UuZGU7IHJv
YmgrZHRAa2VybmVsLm9yZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBj
b25vcitkdEBrZXJuZWwub3JnOyB3YWhyZW5zdEBnbXgubmV0Ow0KPiBkYXZlLnN0ZXZlbnNvbkBy
YXNwYmVycnlwaS5jb207IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsgQ2hhbmdodWFuZw0KPiBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPjsgS2VpdGggWmhhbw0KPiA8
a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsgSmFjayBaaHUgPGphY2suemh1QHN0YXJmaXZl
dGVjaC5jb20+Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMS8yXSBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IHBhbmVsLXNpbXBs
ZTogQWRkDQo+IGNvbXBhdGlibGUgcHJvcGVydHkgZm9yIHdhdmVzaGFyZSA3aW5jaCB0b3VjaHNj
cmVlbiBwYW5lbA0KPiANCj4gT24gMDkvMDEvMjAyNCAxNzozMiwgQ29ub3IgRG9vbGV5IHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgSmFuIDA5LCAyMDI0IGF0IDAzOjA5OjQ4UE0gKzA4MDAsIFNoZW5neWFu
ZyBDaGVuIHdyb3RlOg0KPiA+PiBUaGUgd2F2ZXNoYXJlIDciIDgwMHg0ODAgcGFuZWwgaXMgYSBj
bG9uZSBvZiBSYXNwYmVycnkgUGkgNyIgODAweDQ4MA0KPiA+PiBwYW5lbCBJdCBjYW4gYmUgZHJp
dmVkIGJ5IFJhc3BiZXJyeSBQaSBwYW5lbCdzIHByb2Nlc3MgYnV0IGl0IG5lZWRzDQo+ID4+IGRp
ZmZlcmVudCB0aW1pbmcgZnJvbSBSYXNwYmVycnkgUGkgcGFuZWwuIEFkZCBjb21wYXRpYmxlIHBy
b3BlcnR5IGZvciBpdC4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogS2VpdGggWmhhbyA8a2Vp
dGguemhhb0BzdGFyZml2ZXRlY2guY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ3lhbmcg
Q2hlbiA8c2hlbmd5YW5nLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAg
ICAgICAgIHwgMiArKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdA0KPiA+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sDQo+ID4+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwNCj4g
Pj4gaW5kZXggMTE0MjJhZjM0NzdlLi4wMmY2YjFiMmRkYzkgMTAwNjQ0DQo+ID4+IC0tLQ0KPiA+
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVs
LXNpbXBsZS55YW1sDQo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YQ0KPiA+PiArKysgbWwNCj4gPj4gQEAgLTMz
NSw2ICszMzUsOCBAQCBwcm9wZXJ0aWVzOg0KPiA+PiAgICAgICAgIC0gdml2YXgsdHBjOTE1MC1w
YW5lbA0KPiA+PiAgICAgICAgICAgIyBWWFQgODAweDQ4MCBjb2xvciBURlQgTENEIHBhbmVsDQo+
ID4+ICAgICAgICAgLSB2eHQsdmwwNTAtODA0OG50LWMwMQ0KPiA+PiArICAgICAgICAjIFdhdmVz
aGFyZSA3IiAoODAweDQ4MCkgdG91Y2hzY3JlZW4gTENEIHBhbmVsDQo+ID4+ICsgICAgICAtIHdh
dmVzaGFyZSw3aW5jaC10b3VjaHNjcmVlbg0KPiA+DQo+ID4gSXMgIjdpbmNoLXRvdWNoc2NyZWVu
IiByZWFsbHkgYSBzcGVjaWZpYyBlbm91Z2ggaWRlbnRpZmllciBmb3IgdGhpcw0KPiA+IGRldmlj
ZT8NCj4gDQo+IFdhdmVzaGFyZSBoYXMgdmVyeSBwcmVjaXNlIFNLVXMsIHRoaXMgc2hvdWxkIGJl
IHNvbWV0aGluZyBsaWtlDQo+IHdhdmVzaGFyZSw3aW5jaC1kc2ktc2t1MTk4ODUgcGVyaGFwcw0K
PiANCj4gTmVpbA0KDQp0aGFua3MgZm9yIG1lbnRpb24sIEl0IHdpbGwgYmUgY2hlY2tlZCBpZiBu
ZXh0IHZlcnNpb24gaXMgbmVlZGVkLg0KDQo+IA0KPiA+DQo+ID4+ICAgICAgICAgICAjIFdpbnN0
YXIgRGlzcGxheSBDb3Jwb3JhdGlvbiAzLjUiIFFWR0EgKDMyMHgyNDApIFRGVCBMQ0QNCj4gcGFu
ZWwNCj4gPj4gICAgICAgICAtIHdpbnN0YXIsd2YzNWx0aWFjZA0KPiA+PiAgICAgICAgICAgIyBZ
ZXMgT3B0b2VsZWN0cm9uaWNzIFlUQzcwMFRMQUctMDUtMjAxQyA3IiBURlQgTENEIHBhbmVsDQo+
ID4+IC0tDQo+ID4+IDIuMTcuMQ0KPiA+Pg0KDQo=
