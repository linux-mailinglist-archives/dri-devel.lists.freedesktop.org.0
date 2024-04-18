Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB88A917A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 05:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CD210FA0C;
	Thu, 18 Apr 2024 03:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C231510FA0C;
 Thu, 18 Apr 2024 03:14:33 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VKjXZ6T5Xz1HBjL;
 Thu, 18 Apr 2024 11:13:34 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (unknown [7.185.36.37])
 by mail.maildlp.com (Postfix) with ESMTPS id 5DDBB1402C7;
 Thu, 18 Apr 2024 11:14:29 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 11:14:29 +0800
Received: from dggpeml500025.china.huawei.com ([7.185.36.35]) by
 dggpeml500025.china.huawei.com ([7.185.36.35]) with mapi id 15.01.2507.035;
 Thu, 18 Apr 2024 11:14:29 +0800
From: wangzhu <wangzhu9@huawei.com>
To: Alex Deucher <alexdeucher@gmail.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "qingqing.zhuo@amd.com" <qingqing.zhuo@amd.com>, "stylon.wang@amd.com"
 <stylon.wang@amd.com>, "Josip.Pavic@amd.com" <Josip.Pavic@amd.com>,
 "trix@redhat.com" <trix@redhat.com>, "cruise.hung@amd.com"
 <cruise.hung@amd.com>, "Eric.Yang2@amd.com" <Eric.Yang2@amd.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>, "alvin.lee2@amd.com"
 <alvin.lee2@amd.com>, "jun.lei@amd.com" <jun.lei@amd.com>,
 "austin.zheng@amd.com" <austin.zheng@amd.com>, "sunglee@amd.com"
 <sunglee@amd.com>, "paul.hsieh@amd.com" <paul.hsieh@amd.com>,
 "hanghong.ma@amd.com" <hanghong.ma@amd.com>, "JinZe.Xu@amd.com"
 <JinZe.Xu@amd.com>, "lewis.huang@amd.com" <lewis.huang@amd.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "syed.hassan@amd.com"
 <syed.hassan@amd.com>, "wayne.lin@amd.com" <wayne.lin@amd.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "chiahsuan.chung@amd.com" <chiahsuan.chung@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>, "aric.cyr@amd.com"
 <aric.cyr@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjYuNl0gZHJtL2FtZC9kaXNwbGF5OiBXYWtlIERN?=
 =?utf-8?Q?CUB_before_executing_GPINT_commands?=
Thread-Topic: [PATCH v6.6] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Thread-Index: AQHaj7JoVDAN/0mP/Uu5GFZtNQKS9LFpzsuAgANwVPD//4MmAIAAmn4A
Date: Thu, 18 Apr 2024 03:14:28 +0000
Message-ID: <b9ab29ad37f94dfa81da3aa88c6456c2@huawei.com>
References: <20240416035240.2450127-1-wangzhu9@huawei.com>
 <2024041658-imagines-unlatch-a9b6@gregkh>
 <036c3371d3a64ef8881260197ce37dbc@huawei.com>
 <CADnq5_NML_BiqQx2UmwH86d3qv57D3tFRL--dro1qA99r0Qr5w@mail.gmail.com>
In-Reply-To: <CADnq5_NML_BiqQx2UmwH86d3qv57D3tFRL--dro1qA99r0Qr5w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.142]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

VGhlIENWRS0yMDIzLTUyNjI0IGlzIGZpeGVkIGluIGxpbnV4LTYuNyBzdGFibGUsIHdoaWxlIGl0
IGlzIG5vdCBmaXhlZCBpbiA2LjYsIHRoaXMgY29tbWl0IGlzIHByZXNlbnRlZCB0byBmaXggaXQg
aW4gbGludXgtNi42IHN0YWJsZS4NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6
OiBBbGV4IERldWNoZXIgW21haWx0bzphbGV4ZGV1Y2hlckBnbWFpbC5jb21dIA0K5Y+R6YCB5pe2
6Ze0OiAyMDI05bm0NOaciDE45pelIDk6NTgNCuaUtuS7tuS6ujogd2FuZ3podSA8d2FuZ3podTlA
aHVhd2VpLmNvbT4NCuaKhOmAgTogR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBoYXJyeS53ZW50bGFuZEBhbWQuY29tOyBzdW5wZW5nLmxpQGFtZC5jb207IFJvZHJpZ28uU2lx
dWVpcmFAYW1kLmNvbTsgYWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbTsgY2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IHFpbmdxaW5nLnpo
dW9AYW1kLmNvbTsgc3R5bG9uLndhbmdAYW1kLmNvbTsgSm9zaXAuUGF2aWNAYW1kLmNvbTsgdHJp
eEByZWRoYXQuY29tOyBjcnVpc2UuaHVuZ0BhbWQuY29tOyBFcmljLllhbmcyQGFtZC5jb207IG1h
cmlvLmxpbW9uY2llbGxvQGFtZC5jb207IGFsdmluLmxlZTJAYW1kLmNvbTsganVuLmxlaUBhbWQu
Y29tOyBhdXN0aW4uemhlbmdAYW1kLmNvbTsgc3VuZ2xlZUBhbWQuY29tOyBwYXVsLmhzaWVoQGFt
ZC5jb207IGhhbmdob25nLm1hQGFtZC5jb207IEppblplLlh1QGFtZC5jb207IGxld2lzLmh1YW5n
QGFtZC5jb207IFpoZW5nemVuZ2thaSA8emhlbmd6ZW5na2FpQGh1YXdlaS5jb20+OyBhbGV4Lmh1
bmdAYW1kLmNvbTsgc3llZC5oYXNzYW5AYW1kLmNvbTsgd2F5bmUubGluQGFtZC5jb207IG5pY2hv
bGFzLmthemxhdXNrYXNAYW1kLmNvbTsgY2hpYWhzdWFuLmNodW5nQGFtZC5jb207IGF1cmFiaW5k
by5waWxsYWlAYW1kLmNvbTsgYXJpYy5jeXJAYW1kLmNvbTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCuS4u+mimDogUmU6IFtQQVRDSCB2Ni42XSBkcm0vYW1kL2Rpc3BsYXk6
IFdha2UgRE1DVUIgYmVmb3JlIGV4ZWN1dGluZyBHUElOVCBjb21tYW5kcw0KDQpPbiBXZWQsIEFw
ciAxNywgMjAyNCBhdCA5OjUx4oCvUE0gd2FuZ3podSA8d2FuZ3podTlAaHVhd2VpLmNvbT4gd3Jv
dGU6DQo+DQo+IEhpIEdyZWcsIHRoYW5rcyBmb3IgeW91ciByZXBseS4gU2luY2UgdGhlcmUgaXMg
bm8gcGF0Y2ggdG8gZml4IENWRS0yMDIzLTUyNjI0IGluIGxpbnV4LTUuMTAsIHRoZXJlIGlzIGEg
cGF0Y2ggaW4gdGhlIGxpbnV4LTYuNyBicmFuY2gsIGl0cyBjb21taXQgaXMgMmVmOThjNmQ3NTNh
NzQ0ZTMzM2I3ZTM0YjljZjY4NzA0MGZiYTU3ZCAoImRybS9hbWQvZGlzcGxheTogV2FrZSBETUNV
QiBiZWZvcmUgZXhlY3V0aW5nIEdQSU5UIGNvbW1hbmRzIikuIFdoZW4gd2UgYXBwbHkgdGhpcyBw
YXRjaCB0byBsaW51eC01LjEwLCB0aGVyZSBhcmUgbG90cyBvZiBjb25mbGljdHMsIGFuZCB3ZSBm
b3VuZCB0aGVyZSBhcmUgbG90cyBvZiBkZXBlbmRlbnQgcGF0Y2hlcywgYW5kIGxvdHMgb2YgcGF0
Y2hlcyBhcmUgbm90IHByb3Bvc2VkIHRvIGZpeCB0aGUgY3ZlLCB0aGV5IGFyZSBwcmVzZW50ZWQg
dG8gYWRkIG5ldyBmdW5jdGlvbnMgb2YgdGhlIGtlcm5lbC4NCj4NCg0KV2h5IGlzIHRoZXJlIGEg
Q1ZFPyAgSGF2ZSB5b3UgdW5jb3ZlcmVkIHNvbWUgc3BlY2lmaWMgaXNzdWU/DQoNCkFsZXgNCg0K
PiBNeSBjb21taXQgY29tZXMgZnJvbSBuZWFybHkgMjAgcGF0Y2hlcy4gRm9yIGVhY2ggcGF0Y2gs
IG5vdCBhbGwgb2YgaXRzIGNvbnRlbnQgaXMgbWVhbnQgdG8gZml4IHRoZSBjdmUsIHNvIEkganVz
dCBnZXQgdGhlIHBhcnQgd2hpY2ggaXMgaGVscGZ1bCB0byBmaXguIEl0IGlzIHdoeSBJIGRvbid0
IHByZXNlbnQgdGhlIHBhdGNoZXMgb25lIGJ5IG9uZSBpbnN0ZWFkIG9mIG1lcmdpbmcgdGhlbSBp
bnRvIG9uZSBiaWcgcGF0Y2guDQo+DQo+DQo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCj4g5Y+R
5Lu25Lq6OiBHcmVnIEtIIFttYWlsdG86Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IOWP
kemAgeaXtumXtDogMjAyNOW5tDTmnIgxNuaXpSAxMjo1NA0KPiDmlLbku7bkuro6IHdhbmd6aHUg
PHdhbmd6aHU5QGh1YXdlaS5jb20+DQo+IOaKhOmAgTogaGFycnkud2VudGxhbmRAYW1kLmNvbTsg
c3VucGVuZy5saUBhbWQuY29tOyANCj4gUm9kcmlnby5TaXF1ZWlyYUBhbWQuY29tOyBhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tOyANCj4gY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tOyBhaXJsaWVk
QGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IA0KPiBxaW5ncWluZy56aHVvQGFtZC5jb207IHN0
eWxvbi53YW5nQGFtZC5jb207IEpvc2lwLlBhdmljQGFtZC5jb207IA0KPiB0cml4QHJlZGhhdC5j
b207IGNydWlzZS5odW5nQGFtZC5jb207IEVyaWMuWWFuZzJAYW1kLmNvbTsgDQo+IG1hcmlvLmxp
bW9uY2llbGxvQGFtZC5jb207IGFsdmluLmxlZTJAYW1kLmNvbTsganVuLmxlaUBhbWQuY29tOyAN
Cj4gYXVzdGluLnpoZW5nQGFtZC5jb207IHN1bmdsZWVAYW1kLmNvbTsgcGF1bC5oc2llaEBhbWQu
Y29tOyANCj4gaGFuZ2hvbmcubWFAYW1kLmNvbTsgSmluWmUuWHVAYW1kLmNvbTsgbGV3aXMuaHVh
bmdAYW1kLmNvbTsgDQo+IFpoZW5nemVuZ2thaSA8emhlbmd6ZW5na2FpQGh1YXdlaS5jb20+OyBh
bGV4Lmh1bmdAYW1kLmNvbTsgDQo+IHN5ZWQuaGFzc2FuQGFtZC5jb207IHdheW5lLmxpbkBhbWQu
Y29tOyBuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb207IA0KPiBjaGlhaHN1YW4uY2h1bmdAYW1k
LmNvbTsgYXVyYWJpbmRvLnBpbGxhaUBhbWQuY29tOyBhcmljLmN5ckBhbWQuY29tOyANCj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IA0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IOS4u+mimDogUmU6IFtQQVRD
SCB2Ni42XSBkcm0vYW1kL2Rpc3BsYXk6IFdha2UgRE1DVUIgYmVmb3JlIGV4ZWN1dGluZyANCj4g
R1BJTlQgY29tbWFuZHMNCj4NCj4gT24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMDM6NTI6NDBBTSAr
MDAwMCwgWmh1IFdhbmcgd3JvdGU6DQo+ID4gRnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmlj
aG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KPiA+DQo+ID4gc3RhYmxlIGluY2x1c2lvbg0KPiA+
IGZyb20gc3RhYmxlLXY2LjcuMw0KPiA+IGNvbW1pdCAyZWY5OGM2ZDc1M2E3NDRlMzMzYjdlMzRi
OWNmNjg3MDQwZmJhNTdkDQo+ID4gY2F0ZWdvcnk6IGJ1Z2ZpeA0KPiA+IGJ1Z3ppbGxhOiBodHRw
czovL2dpdGVlLmNvbS9zcmMtb3BlbmV1bGVyL2tlcm5lbC9pc3N1ZXMvSTlCVjRDDQo+ID4gQ1ZF
OiBDVkUtMjAyMy01MjYyNA0KPiA+DQo+ID4gUmVmZXJlbmNlOg0KPiA+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jDQo+
ID4gb20gbWl0Lz9pZD0yZWY5OGM2ZDc1M2E3NDRlMzMzYjdlMzRiOWNmNjg3MDQwZmJhNTdkDQo+
ID4NCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4gWyBVcHN0
cmVhbSBjb21taXQgZTVmZmQxMjYzZGQ1YjQ0OTI5YzY3NjE3MTgwMmU3YjZhZjQ4M2YyMSBdDQo+
ID4NCj4gPiBbV2h5XQ0KPiA+IERNQ1VCIGNhbiBiZSBpbiBpZGxlIHdoZW4gd2UgYXR0ZW1wdCB0
byBpbnRlcmZhY2Ugd2l0aCB0aGUgSFcgDQo+ID4gdGhyb3VnaCB0aGUgR1BJTlQgbWFpbGJveCBy
ZXN1bHRpbmcgaW4gYSBzeXN0ZW0gaGFuZy4NCj4gPg0KPiA+IFtIb3ddDQo+ID4gQWRkIGRjX3dh
a2VfYW5kX2V4ZWN1dGVfZ3BpbnQoKSB0byB3cmFwIHRoZSB3YWtlLCBleGVjdXRlLCBzbGVlcCAN
Cj4gPiBzZXF1ZW5jZS4NCj4gPg0KPiA+IElmIHRoZSBHUElOVCBleGVjdXRlcyBzdWNjZXNzZnVs
bHkgdGhlbiBETUNVQiB3aWxsIGJlIHB1dCBiYWNrIGludG8gDQo+ID4gc2xlZXAgYWZ0ZXIgdGhl
IG9wdGlvbmFsIHJlc3BvbnNlIGlzIHJldHVybmVkLg0KPiA+DQo+ID4gSXQgZnVuY3Rpb25zIHNp
bWlsYXIgdG8gdGhlIGluYm94IGNvbW1hbmQgaW50ZXJmYWNlLg0KPiA+DQo+ID4gQ2M6IE1hcmlv
IExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KPiA+IENjOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcNCj4gPiBSZXZpZXdlZC1ieTogSGFuc2VuIERzb3V6YSA8aGFuc2VuLmRzb3V6YUBh
bWQuY29tPg0KPiA+IEFja2VkLWJ5OiBXYXluZSBMaW4gPHdheW5lLmxpbkBhbWQuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNA
YW1kLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IERhbmllbCBXaGVlbGVyIDxkYW5pZWwud2hlZWxlckBh
bWQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4NCj4gPg0KPiA+IFRoaXMgY29tbWl0IGNvbWVzIGZyb20gZm9sbG93aW5nIGNv
bW1pdHM6DQo+ID4NCj4gPiAgODc3NDAyOWY3NmI5ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENO
MzUgQ0xLX01HUiIpICA2NTEzOGViNzJlMWYNCj4gPiAoImRybS9hbWQvZGlzcGxheTogQWRkIERD
TjM1IERNVUIiKSAgZGMwMWM0Yjc5YmZlICgiZHJtL2FtZC9kaXNwbGF5Og0KPiA+IFVwZGF0ZSBk
cml2ZXIgYW5kIElQUyBpbnRlcm9wIikNCj4gPiAgODIwYzM4NzBjNDkxICgiZHJtL2FtZC9kaXNw
bGF5OiBSZWZhY3RvciBETUNVQiBlbnRlci9leGl0IGlkbGUNCj4gPiBpbnRlcmZhY2UiKSAgMmVm
OThjNmQ3NTNhICgiZHJtL2FtZC9kaXNwbGF5OiBXYWtlIERNQ1VCIGJlZm9yZSANCj4gPiBleGVj
dXRpbmcgR1BJTlQgY29tbWFuZHMiKQ0KPg0KPiBXaHkgYXJlIHlvdSBwdXR0aW5nIG11bHRpcGxl
IGNvbW1pdHMgdG9nZXRoZXIgYW5kIG5vdCBqdXN0IHN1Ym1pdHRpbmcgdGhlIGluZGl2aWR1YWwg
b25lcz8gIEFuZCB3aGF0IGlzIHRoaXMgZm9yPw0KPg0KPiBjb25mdXNlZCwNCj4NCj4gZ3JlZyBr
LWgNCg==
