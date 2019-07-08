Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329561A77
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 07:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3726899D5;
	Mon,  8 Jul 2019 05:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10089.outbound.protection.outlook.com [40.107.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16398932A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 05:54:47 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5102.eurprd08.prod.outlook.com (20.179.30.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 05:54:43 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Mon, 8 Jul 2019
 05:54:43 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>,
 nd
 <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar Zhang (Arm Technology
 China)" <Oscar.Zhang@arm.com>, "Tiannan Zhu (Arm Technology China)"
 <Tiannan.Zhu@arm.com>, "Jonathan Chai (Arm Technology China)"
 <Jonathan.Chai@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Julien Yin (Arm Technology China)"
 <Julien.Yin@arm.com>, "Channing Chen (Arm Technology China)"
 <Channing.Chen@arm.com>, "Yiqi Kang (Arm Technology China)"
 <Yiqi.Kang@arm.com>, "thomas Sun (Arm Technology China)"
 <thomas.Sun@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Subject: Re: [PATCH 1/2] drm/komeda: Disable slave pipeline support
Thread-Topic: [PATCH 1/2] drm/komeda: Disable slave pipeline support
Thread-Index: AQHVMyb5WQQBB7gGc06vpLjh/Rmuxqa78rAAgARKPgA=
Date: Mon, 8 Jul 2019 05:54:43 +0000
Message-ID: <20190708055434.GA3841@jamwan02-TSP300>
References: <20190705114357.17403-1-james.qian.wang@arm.com>
 <20190705122348.GN15868@phenom.ffwll.local>
In-Reply-To: <20190705122348.GN15868@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:203:52::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25e0adea-56a4-4fcb-f09b-08d70368c653
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5102; 
x-ms-traffictypediagnostic: VE1PR08MB5102:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <VE1PR08MB51025AE248BA1C64DC8F2554B3F60@VE1PR08MB5102.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(199004)(189003)(40434004)(6306002)(6636002)(6436002)(8936002)(81166006)(8676002)(81156014)(6512007)(2906002)(9686003)(53936002)(316002)(305945005)(68736007)(58126008)(53386004)(110136005)(6486002)(71200400001)(71190400001)(6246003)(229853002)(3846002)(6116002)(256004)(14444005)(5024004)(7736002)(966005)(1076003)(478600001)(476003)(486006)(33716001)(14454004)(446003)(25786009)(11346002)(102836004)(55236004)(26005)(2201001)(6506007)(86362001)(386003)(66066001)(33656002)(587094005)(186003)(76176011)(64756008)(99286004)(5660300002)(66446008)(66476007)(73956011)(66556008)(66946007)(2501003)(52116002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5102;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4mdlr1pgRmvyr0IwaV0ciP1mOXrvFxuRyHKkEhbQcATIlGUfCmXQjt3igKdZZ0UY6o3UtiNFcJyTncTEydDfRb4CD5Cdbh9sjuF1Zfg7wcQgnjZsCHkVQ78GavcvSNXWn6VLD287RA02BKkRSHmgXh2A+hb4y+htQlEln29TufuIqg5fPJ5DcWZLrtV31ftskG8Q4evKLL1i/Wq7m7LA5D8k7HSO3kFjY+A6L7Kk5Hgb6ICjexzuhHT7RUl8kyKq+0jfbcCd+axA+mQiITIUdG4uD5ctwfNZqbdUn3OhiIue8fFq0DKsJNTT4S2gu88TdoeZCig4VbOcSdeI4mD1G0nNqiTz3R5EYRbS05EOcTRZzmwfC3jsbAMh2tnY2DdxvK6L374kRycD37THLM6wq8/rwJ3VQZR9Cy9bMTQUUDE=
Content-ID: <97D9F1E29801684D905FF917FFED7923@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e0adea-56a4-4fcb-f09b-08d70368c653
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 05:54:43.8564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn0FHAAGeyrfyuH6ItbW+MBpVfF0cTy/MH2QCiCo3aM=;
 b=9gkKnKHFha5taGEm/fHxAiFuqVPkbsPByvP9WU0uauZniE5PcFFbuu3G2/hKPV5PgzQHqf3+9efIcX7hROp1zic31idFHpzymmilTGEZhQhuPcXAiNBvIM/jik33xnx2mjx36P5jaki4N6lUhIKKLYbjdrFnVEWAs5P90WaDG64=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDI6MjM6NDhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1bCAwNSwgMjAxOSBhdCAxMTo0NDoxNkFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IFNpbmNlIHRoZSBwcm9w
ZXJ0eSBzbGF2ZV9wbGFuZXMgaGF2ZSBiZWVuIHJlbW92ZWQsIHRvIGF2b2lkIHRoZSByZXNvdXJj
ZQo+ID4gYXNzaWdubWVudCBwcm9ibGVtIGluIHVzZXIgZGlzYWJsZSBzbGF2ZSBwaXBlbGluZSBz
dXBwb3J0IHRlbXBvcmFyaWx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPgo+IEkg
Z3Vlc3MgdGhlIHdheSB5b3UgaGF2ZSB0byBlbnVtZXJhdGUgdGhlIHBsYW5lcyBsaXN0aW5nIHRo
ZSBzbGF2ZSBwbGFuZXMKPiB3b250IGp1c3QgYXV0b21hdGljYWxseSB3b3JrIGluIGFueSBmYXNo
aW9uIGFuZCBmb3JjZSBhIGxvdCBtb3JlIGZhbGxiYWNrcwo+IHRvIHByaW1hcnkgcGxhbmUgb25s
eS4gQXQgbGVhc3QgdW50aWwgdmlydHVhbGl6YXRpb24gb2YgcGxhbmUgaHcgaXMgZG9uZS4KPiBT
byBtYWtlcyBzZW5zZSB0byBvdXRyaWdodCBkaXNhYmxlIGFsbCB0aGUgc2xhdmUgcGxhbmUgc3R1
ZmYgZm9yIG5vdy4gQW5kCj4gSSB0aGluayBpdCdzIG9rIHRvIGtlZXAgYWxsIHRoZSBjb2RlIHN0
aWxsLCB3ZSdsbCB1c2UgaXQgYWdhaW4uCj4KPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+IGluZGV4IGY0NDAwNzg4YWI5
NC4uOGVlODc5ZWUzZGRjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+IEBAIC00ODEsNyArNDgxLDcgQEAgaW50IGtv
bWVkYV9rbXNfc2V0dXBfY3J0Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gPiAgbWFz
dGVyID0gbWRldi0+cGlwZWxpbmVzW2ldOwo+ID4KPiA+ICBjcnRjLT5tYXN0ZXIgPSBtYXN0ZXI7
Cj4gPiAtY3J0Yy0+c2xhdmUgID0ga29tZWRhX3BpcGVsaW5lX2dldF9zbGF2ZShtYXN0ZXIpOwo+
Cj4gVGhpcyBtaWdodCBjYXVzZSBhbiB1bnVzZWQgZnVuY3Rpb24gd2FybmluZywgbWlnaHQgbmVl
ZCB0byBhbm5vdGF0ZSBpdAo+IHdpdGggX191bnVzZWQuCj4gLURhbmllbAoKSWYgc28sIEknZCBs
aWtlIHRvIGRyb3AgdGhpcyBjaGFuZ2UuCgpTaW5jZSBldmVuIHdpdGggdGhpcyBjaGFuZ2UsIHRo
YXQgc3RpbGwgY2FuIG5vdCBwYXNzIGFsbCBvdXIgdGVzdHMuCndlIGhhdmUgdG8gdXBkYXRlIHRo
ZSB1c2VyIHRlc3RzIG9yIHRoZSBrb21lZGEgaW1wbGVtZW50YXRpb24uCk9uY2Ugd2UgZmluaXNo
ZWQgdGhlIHVwZGF0aW5nLCB3ZSBzdGlsbCBuZWVkIHRvIHJldmVydCB0aGlzIGNoYW5nZS4KU28g
bWF5YmUganVzdCBkcm9wIGl0IGlzIG1vcmUgYmV0dGVyLgoKVGhhbmtzCkphbWVzCgo+ID4gK2Ny
dGMtPnNsYXZlICA9IE5VTEw7Cj4gPgo+ID4gIGlmIChjcnRjLT5zbGF2ZSkKPiA+ICBzcHJpbnRm
KHN0ciwgInBpcGUtJWQiLCBjcnRjLT5zbGF2ZS0+aWQpOwo+ID4gLS0KPiA+IDIuMjAuMQo+ID4K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo+Cj4gLS0KPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKSU1QT1JUQU5UIE5PVElDRTogVGhlIGNv
bnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFs
IGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQg
cmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5v
dCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBh
bnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1
bS4gVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
