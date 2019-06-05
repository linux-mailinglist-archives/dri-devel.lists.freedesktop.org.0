Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23748359BE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 11:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194238933C;
	Wed,  5 Jun 2019 09:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50052.outbound.protection.outlook.com [40.107.5.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FD38933C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 09:37:56 +0000 (UTC)
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB2973.eurprd08.prod.outlook.com (52.133.14.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 09:37:53 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e9f4:59c8:9be1:910b%4]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 09:37:53 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v1 1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Topic: [PATCH v1 1/2] drm/komeda: Add rotation support on Komeda driver
Thread-Index: AQHU+LnF01A1o5O/qEOerVAXVeralaaNDugAgAAESwA=
Date: Wed, 5 Jun 2019 09:37:53 +0000
Message-ID: <20190605093744.GA19841@lowry.li@arm.com>
References: <1555902945-2877-1-git-send-email-lowry.li@arm.com>
 <1555902945-2877-2-git-send-email-lowry.li@arm.com>
 <20190605092221.GS15316@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190605092221.GS15316@e110455-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::25) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 218497de-1d3d-4170-fac8-08d6e9997b2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB2973; 
x-ms-traffictypediagnostic: VI1PR08MB2973:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB29737C97EC7C6A15447298149F160@VI1PR08MB2973.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(73956011)(6512007)(9686003)(5660300002)(6486002)(6862004)(52116002)(102836004)(8936002)(305945005)(7736002)(66946007)(66446008)(64756008)(66476007)(66556008)(486006)(1076003)(6436002)(72206003)(61793004)(36756003)(4326008)(53936002)(229853002)(316002)(26005)(68736007)(6246003)(86362001)(14454004)(186003)(2906002)(476003)(11346002)(14444005)(256004)(99286004)(6636002)(76176011)(25786009)(71200400001)(8676002)(71190400001)(54906003)(3846002)(6116002)(6506007)(478600001)(81156014)(33656002)(66066001)(58126008)(386003)(81166006)(446003)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2973;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P+XzoqxEmT6kjCU9mnDLUVC8U3BQBAarwKXDFRzH+Bc0tR3pTapoMaW1SjQnjlRS51pOysGlm5XdCeLpqaiJy0daTbqRtye8Q+zmbX6qI6m/+kM2CclTsjmaB4lUv4UuatlNEfo/An2B7eZpURcdMk2xw+Kf8vJhqf72SaxZCesKOCN+5wVZP3oehCMlqrJXybcI94Yoak4Q9NKQT3/6X+bFvdpdbHApzvTujWLHra4gMe6Z2VaEaiqSNe+Zn737etc2xG15S+0f7ABtCCGDNF0QJxTTIoOD+HmcuKrohruA4ppMzfj57QoOdpdBJ/NhFH6wcFnYrQx/GYt9gsFyUO4xqSPxMkXOe7oR6Y21DjXB2zRrGm/DdIdv1aaoNa/J1+9hNSUJ5oJdAWHcwFx7oRZHxCA6sMo3XZhCX7DPJ4M=
Content-ID: <EBA83EBB92D4614CBB4F53B5CFC05076@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218497de-1d3d-4170-fac8-08d6e9997b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 09:37:53.0407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lowry.Li@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2973
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dbc4ReatIEzg3WG8h9Nac4gmgzTTwqfDAFOIPQyVp10=;
 b=z/6Hms99Vxve7hmqXdaj3l+8XL8v6RPlYzBSa7wrmFag/EfDezgw3piJk1sF6C+m5YkI2MANtbmkCZfAaxwiSliNjSGj4AU6mJFbEY0wN5PNjci4l/MCqPVYuoRPnHfPteH52SSMDBdf8cXK+EbW4v3b+Ka9+JuDKFXnHWwXYB4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDU6MjI6MjJQTSArMDgwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6DQo+IEhpIExvd3J5LA0KPiANCj4gT24gTW9uLCBBcHIgMjIsIDIwMTkgYXQgMDQ6MTY6MjZB
TSArMDEwMCwgTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToNCj4gPiAtIEFk
ZHMgcm90YXRpb24gcHJvcGVydHkgdG8gcGxhbmUuDQo+ID4gLSBLb21lZGEgZGlzcGxheSByb3Rh
dGlvbiBzdXBwb3J0IGRpdmVyZ2VzIGZyb20gdGhlIHNwZWNpZmljIGZvcm1hdHMsDQo+ID4gc28g
bmVlZCB0byBjaGVjayB0aGUgdXNlciByZXF1aXJlZCByb3RhdGlvbiB0eXBlIHdpdGggdGhlIGZv
cm1hdCBjYXBzDQo+ID4gYW5kIHJlamVjdCB0aGUgY29tbWl0IGlmIGl0IGNhbiBub3QgYmUgc3Vw
cG9ydGVkLg0KPiA+IC0gSW4gdGhlIGxheWVyIHZhbGlkYXRlIGZsb3csIHNldHMgdGhlIHJvdGF0
aW9uIHZhbHVlIHRvIHRoZSBsYXllcg0KPiA+IHN0YXRlLiBJZiByOTAgb3IgcjI3MCwgc3dhcCB0
aGUgd2lkdGggYW5kIGhlaWdodCBvZiB0aGUgZGF0YSBmbG93DQo+ID4gZm9yIG5leHQgc3RhZ2Uu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8bG93cnkubGlAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaCAgfCAxMSArKysrKysrKysrKw0KPiA+
ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMg
ICB8ICA3ICsrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGxhbmUuYyAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaA0KPiA+IGlu
ZGV4IGJjM2IyZGYzNi4uOTZkZTIyZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaA0KPiA+IEBA
IC03OSw2ICs3OSwxNyBAQCBzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzX3RhYmxlIHsNCj4gPiAg
DQo+ID4gIGV4dGVybiB1NjQga29tZWRhX3N1cHBvcnRlZF9tb2RpZmllcnNbXTsNCj4gPiAgDQo+
ID4gK3N0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqa29tZWRhX2dldF9mb3JtYXRfbmFtZSh1MzIg
Zm91cmNjLCB1NjQgbW9kaWZpZXIpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkcm1fZm9ybWF0X25h
bWVfYnVmIGJ1ZjsNCj4gPiArCXN0YXRpYyBjaGFyIG5hbWVbNjRdOw0KPiA+ICsNCj4gPiArCXNu
cHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgIiVzIHdpdGggbW9kaWZpZXI6IDB4JWxseC4iLA0K
PiA+ICsJCSBkcm1fZ2V0X2Zvcm1hdF9uYW1lKGZvdXJjYywgJmJ1ZiksIG1vZGlmaWVyKTsNCj4g
PiArDQo+ID4gKwlyZXR1cm4gbmFtZTsNCj4gPiArfQ0KPiANCj4gQ2FuIHlvdSByb2xsIHRoZSBj
b250ZW50IG9mIHRoaXMgZnVuY3Rpb24gaW5zaWRlIHRoZSBpZiAoKSB7Li4uLi59IHBhcnQ/IFdl
DQo+IG9ubHkgaGF2ZSBvbmUgdXNlIGZvciBpdCwgSSBkb24ndCBzZWUgdGhlIG5lZWQgdG8gc3Bs
aXQgaXQgaW50byBhIHNlcGFyYXRlDQo+IGZ1bmN0aW9uLg0KPiANCj4gV2l0aCB0aGF0OiBSZXZp
ZXdlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+DQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+IExpdml1DQo+IA0KSGkgTGl2aXUsDQoNClRoYW5rcyBhIGxvdCBmb3IgeW91ciBj
b21tZW50cy4gVGhpcyBmdW5jdGlvbiBpcyBnZW5lcmljIG9uZSB3aGljaA0Kd2lsbCBiZSBjYWxs
ZWQgZnJvbSBtYW55IHBsYWNlcyBmdXJ0aGVyLCBsaWtlIHByaW50IHRoZSBmb3JtYXQgc3RyaW5n
DQpsb2cgYW5kIGV0Yy4gU28gd2Ugc3BsaXQgaXQgb3V0IGluIGtvbWVkYV9mb3JtYXRfY2FwcyBo
ZWFkZXIgZmlsZQ0KaGVyZSA6KQ0KDQpCZXN0IHJlZ2FyZHMsDQpMb3dyeQ0KDQo+ID4gKw0KPiA+
ICBjb25zdCBzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzICoNCj4gPiAga29tZWRhX2dldF9mb3Jt
YXRfY2FwcyhzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzX3RhYmxlICp0YWJsZSwNCj4gPiAgCQkg
ICAgICAgdTMyIGZvdXJjYywgdTY0IG1vZGlmaWVyKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMN
Cj4gPiBpbmRleCA5YjI5ZTlhLi44YzEzM2U0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jDQo+ID4gQEAgLTMxNyw2ICszMTcsMTMgQEAgc3RydWN0IGtvbWVkYV9waXBlbGluZV9zdGF0
ZSAqDQo+ID4gIAkvKiB1cGRhdGUgdGhlIGRhdGEgZmxvdyBmb3IgdGhlIG5leHQgc3RhZ2UgKi8N
Cj4gPiAgCWtvbWVkYV9jb21wb25lbnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAmbGF5ZXIt
PmJhc2UsIDApOw0KPiA+ICANCj4gPiArCS8qDQo+ID4gKwkgKiBUaGUgcm90YXRpb24gaGFzIGJl
ZW4gaGFuZGxlZCBieSBsYXllciwgc28gYWRqdXN0ZWQgdGhlIGRhdGEgZmxvdyBmb3INCj4gPiAr
CSAqIHRoZSBuZXh0IHN0YWdlLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoZHJtX3JvdGF0aW9uXzkw
X29yXzI3MChzdC0+cm90KSkNCj4gPiArCQlzd2FwKGRmbG93LT5pbl9oLCBkZmxvdy0+aW5fdyk7
DQo+ID4gKw0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiAgDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jDQo+ID4gaW5kZXgg
MTRkNjg2MS4uNWU1YmZkYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYw0KPiA+IEBAIC05LDEyICs5LDE0IEBADQo+
ID4gICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPg0KPiA+ICAjaW5jbHVkZSAia29t
ZWRhX2Rldi5oIg0KPiA+ICAjaW5jbHVkZSAia29tZWRhX2ttcy5oIg0KPiA+ICsjaW5jbHVkZSAi
a29tZWRhX2ZyYW1lYnVmZmVyLmgiDQo+ID4gIA0KPiA+ICBzdGF0aWMgaW50DQo+ID4gIGtvbWVk
YV9wbGFuZV9pbml0X2RhdGFfZmxvdyhzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdCwNCj4gPiAg
CQkJICAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93X2NmZyAqZGZsb3cpDQo+ID4gIHsNCj4gPiAg
CXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3QtPmZiOw0KPiA+ICsJY29uc3Qgc3RydWN0
IGtvbWVkYV9mb3JtYXRfY2FwcyAqY2FwcyA9IHRvX2tmYihmYiktPmZvcm1hdF9jYXBzOw0KPiA+
ICANCj4gPiAgCW1lbXNldChkZmxvdywgMCwgc2l6ZW9mKCpkZmxvdykpOw0KPiA+ICANCj4gPiBA
QCAtMzUsNiArMzcsMTUgQEANCj4gPiAgCWRmbG93LT5pbl93ID0gc3QtPnNyY193ID4+IDE2Ow0K
PiA+ICAJZGZsb3ctPmluX2ggPSBzdC0+c3JjX2ggPj4gMTY7DQo+ID4gIA0KPiA+ICsJZGZsb3ct
PnJvdCA9IGRybV9yb3RhdGlvbl9zaW1wbGlmeShzdC0+cm90YXRpb24sIGNhcHMtPnN1cHBvcnRl
ZF9yb3RzKTsNCj4gPiArCWlmICghaGFzX2JpdHMoZGZsb3ctPnJvdCwgY2Fwcy0+c3VwcG9ydGVk
X3JvdHMpKSB7DQo+ID4gKwkJRFJNX0RFQlVHX0FUT01JQygicm90YXRpb24oMHgleCkgaXNuJ3Qg
c3VwcG9ydGVkIGJ5ICVzLlxuIiwNCj4gPiArCQkJCSBkZmxvdy0+cm90LA0KPiA+ICsJCQkJIGtv
bWVkYV9nZXRfZm9ybWF0X25hbWUoY2Fwcy0+Zm91cmNjLA0KPiA+ICsJCQkJCQkJZmItPm1vZGlm
aWVyKSk7DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJcmV0
dXJuIDA7DQo+ID4gIH0NCj4gPiAgDQo+ID4gQEAgLTIzMyw2ICsyNDQsMTEgQEAgc3RhdGljIGlu
dCBrb21lZGFfcGxhbmVfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLA0KPiA+ICANCj4g
PiAgCWRybV9wbGFuZV9oZWxwZXJfYWRkKHBsYW5lLCAma29tZWRhX3BsYW5lX2hlbHBlcl9mdW5j
cyk7DQo+ID4gIA0KPiA+ICsJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9yb3RhdGlvbl9wcm9wZXJ0
eShwbGFuZSwgRFJNX01PREVfUk9UQVRFXzAsDQo+ID4gKwkJCQkJCSBsYXllci0+c3VwcG9ydGVk
X3JvdHMpOw0KPiA+ICsJaWYgKGVycikNCj4gPiArCQlnb3RvIGNsZWFudXA7DQo+ID4gKw0KPiA+
ICAJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9wZXJ0eShwbGFuZSk7DQo+ID4gIAlp
ZiAoZXJyKQ0KPiA+ICAJCWdvdG8gY2xlYW51cDsNCj4gPiAtLSANCj4gPiAxLjkuMQ0KPiA+IA0K
PiANCj4gLS0gDQo+ID09PT09PT09PT09PT09PT09PT09DQo+IHwgSSB3b3VsZCBsaWtlIHRvIHwN
Cj4gfCBmaXggdGhlIHdvcmxkLCAgfA0KPiB8IGJ1dCB0aGV5J3JlIG5vdCB8DQo+IHwgZ2l2aW5n
IG1lIHRoZSAgIHwNCj4gIFwgc291cmNlIGNvZGUhICAvDQo+ICAgLS0tLS0tLS0tLS0tLS0tDQo+
ICAgICDCr1xfKOODhClfL8KvDQoNCi0tIA0KUmVnYXJkcywNCkxvd3J5DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
