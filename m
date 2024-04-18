Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33C8A90DF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 03:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2E71138E8;
	Thu, 18 Apr 2024 01:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92AC1128BA;
 Thu, 18 Apr 2024 01:51:39 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VKghl6jVGzYdll;
 Thu, 18 Apr 2024 09:50:31 +0800 (CST)
Received: from dggpeml500026.china.huawei.com (unknown [7.185.36.106])
 by mail.maildlp.com (Postfix) with ESMTPS id 8B50E18006B;
 Thu, 18 Apr 2024 09:51:33 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 09:51:33 +0800
Received: from dggpeml500025.china.huawei.com ([7.185.36.35]) by
 dggpeml500025.china.huawei.com ([7.185.36.35]) with mapi id 15.01.2507.035;
 Thu, 18 Apr 2024 09:51:33 +0800
From: wangzhu <wangzhu9@huawei.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
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
 <JinZe.Xu@amd.com>, "lewis.huang@amd.com" <lewis.huang@amd.com>, Zhengzengkai
 <zhengzengkai@huawei.com>, "alex.hung@amd.com" <alex.hung@amd.com>,
 "syed.hassan@amd.com" <syed.hassan@amd.com>, "wayne.lin@amd.com"
 <wayne.lin@amd.com>, "nicholas.kazlauskas@amd.com"
 <nicholas.kazlauskas@amd.com>, "chiahsuan.chung@amd.com"
 <chiahsuan.chung@amd.com>, "aurabindo.pillai@amd.com"
 <aurabindo.pillai@amd.com>, "aric.cyr@amd.com" <aric.cyr@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHY2LjZdIGRybS9hbWQvZGlzcGxheTogV2FrZSBETUNV?=
 =?gb2312?Q?B_before_executing_GPINT_commands?=
Thread-Topic: [PATCH v6.6] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Thread-Index: AQHaj7JoVDAN/0mP/Uu5GFZtNQKS9LFpzsuAgANwVPA=
Date: Thu, 18 Apr 2024 01:51:33 +0000
Message-ID: <036c3371d3a64ef8881260197ce37dbc@huawei.com>
References: <20240416035240.2450127-1-wangzhu9@huawei.com>
 <2024041658-imagines-unlatch-a9b6@gregkh>
In-Reply-To: <2024041658-imagines-unlatch-a9b6@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.142]
Content-Type: text/plain; charset="gb2312"
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

SGkgR3JlZywgdGhhbmtzIGZvciB5b3VyIHJlcGx5LiBTaW5jZSB0aGVyZSBpcyBubyBwYXRjaCB0
byBmaXggQ1ZFLTIwMjMtNTI2MjQgaW4gbGludXgtNS4xMCwgdGhlcmUgaXMgYSBwYXRjaCBpbiB0
aGUgbGludXgtNi43IGJyYW5jaCwgaXRzIGNvbW1pdCBpcyAyZWY5OGM2ZDc1M2E3NDRlMzMzYjdl
MzRiOWNmNjg3MDQwZmJhNTdkICgiZHJtL2FtZC9kaXNwbGF5OiBXYWtlIERNQ1VCIGJlZm9yZSBl
eGVjdXRpbmcgR1BJTlQgY29tbWFuZHMiKS4gV2hlbiB3ZSBhcHBseSB0aGlzIHBhdGNoIHRvIGxp
bnV4LTUuMTAsIHRoZXJlIGFyZSBsb3RzIG9mIGNvbmZsaWN0cywgYW5kIHdlIGZvdW5kIHRoZXJl
IGFyZSBsb3RzIG9mIGRlcGVuZGVudCBwYXRjaGVzLCBhbmQgbG90cyBvZiBwYXRjaGVzIGFyZSBu
b3QgcHJvcG9zZWQgdG8gZml4IHRoZSBjdmUsIHRoZXkgYXJlIHByZXNlbnRlZCB0byBhZGQgbmV3
IGZ1bmN0aW9ucyBvZiB0aGUga2VybmVsLg0KDQpNeSBjb21taXQgY29tZXMgZnJvbSBuZWFybHkg
MjAgcGF0Y2hlcy4gRm9yIGVhY2ggcGF0Y2gsIG5vdCBhbGwgb2YgaXRzIGNvbnRlbnQgaXMgbWVh
bnQgdG8gZml4IHRoZSBjdmUsIHNvIEkganVzdCBnZXQgdGhlIHBhcnQgd2hpY2ggaXMgaGVscGZ1
bCB0byBmaXguIEl0IGlzIHdoeSBJIGRvbid0IHByZXNlbnQgdGhlIHBhdGNoZXMgb25lIGJ5IG9u
ZSBpbnN0ZWFkIG9mIG1lcmdpbmcgdGhlbSBpbnRvIG9uZSBiaWcgcGF0Y2guDQoNCg0KLS0tLS3T
yrz+1K28/i0tLS0tDQq3orz+yMs6IEdyZWcgS0ggW21haWx0bzpncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZ10gDQq3osvNyrG85DogMjAyNMTqNNTCMTbI1SAxMjo1NA0KytW8/sjLOiB3YW5nemh1
IDx3YW5nemh1OUBodWF3ZWkuY29tPg0Ks63LzTogaGFycnkud2VudGxhbmRAYW1kLmNvbTsgc3Vu
cGVuZy5saUBhbWQuY29tOyBSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb207IGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb207IGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbTsgYWlybGllZEBsaW51eC5pZTsg
ZGFuaWVsQGZmd2xsLmNoOyBxaW5ncWluZy56aHVvQGFtZC5jb207IHN0eWxvbi53YW5nQGFtZC5j
b207IEpvc2lwLlBhdmljQGFtZC5jb207IHRyaXhAcmVkaGF0LmNvbTsgY3J1aXNlLmh1bmdAYW1k
LmNvbTsgRXJpYy5ZYW5nMkBhbWQuY29tOyBtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tOyBhbHZp
bi5sZWUyQGFtZC5jb207IGp1bi5sZWlAYW1kLmNvbTsgYXVzdGluLnpoZW5nQGFtZC5jb207IHN1
bmdsZWVAYW1kLmNvbTsgcGF1bC5oc2llaEBhbWQuY29tOyBoYW5naG9uZy5tYUBhbWQuY29tOyBK
aW5aZS5YdUBhbWQuY29tOyBsZXdpcy5odWFuZ0BhbWQuY29tOyBaaGVuZ3plbmdrYWkgPHpoZW5n
emVuZ2thaUBodWF3ZWkuY29tPjsgYWxleC5odW5nQGFtZC5jb207IHN5ZWQuaGFzc2FuQGFtZC5j
b207IHdheW5lLmxpbkBhbWQuY29tOyBuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb207IGNoaWFo
c3Vhbi5jaHVuZ0BhbWQuY29tOyBhdXJhYmluZG8ucGlsbGFpQGFtZC5jb207IGFyaWMuY3lyQGFt
ZC5jb207IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQrW98ziOiBSZTogW1BB
VENIIHY2LjZdIGRybS9hbWQvZGlzcGxheTogV2FrZSBETUNVQiBiZWZvcmUgZXhlY3V0aW5nIEdQ
SU5UIGNvbW1hbmRzDQoNCk9uIFR1ZSwgQXByIDE2LCAyMDI0IGF0IDAzOjUyOjQwQU0gKzAwMDAs
IFpodSBXYW5nIHdyb3RlOg0KPiBGcm9tOiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+DQo+IA0KPiBzdGFibGUgaW5jbHVzaW9uDQo+IGZyb20gc3RhYmxl
LXY2LjcuMw0KPiBjb21taXQgMmVmOThjNmQ3NTNhNzQ0ZTMzM2I3ZTM0YjljZjY4NzA0MGZiYTU3
ZA0KPiBjYXRlZ29yeTogYnVnZml4DQo+IGJ1Z3ppbGxhOiBodHRwczovL2dpdGVlLmNvbS9zcmMt
b3BlbmV1bGVyL2tlcm5lbC9pc3N1ZXMvSTlCVjRDDQo+IENWRTogQ1ZFLTIwMjMtNTI2MjQNCj4g
DQo+IFJlZmVyZW5jZTogDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb20NCj4gbWl0Lz9pZD0yZWY5OGM2ZDc1M2E3
NDRlMzMzYjdlMzRiOWNmNjg3MDQwZmJhNTdkDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiANCj4gWyBVcHN0cmVhbSBjb21taXQgZTVmZmQxMjYzZGQ1YjQ0OTI5YzY3
NjE3MTgwMmU3YjZhZjQ4M2YyMSBdDQo+IA0KPiBbV2h5XQ0KPiBETUNVQiBjYW4gYmUgaW4gaWRs
ZSB3aGVuIHdlIGF0dGVtcHQgdG8gaW50ZXJmYWNlIHdpdGggdGhlIEhXIHRocm91Z2ggDQo+IHRo
ZSBHUElOVCBtYWlsYm94IHJlc3VsdGluZyBpbiBhIHN5c3RlbSBoYW5nLg0KPiANCj4gW0hvd10N
Cj4gQWRkIGRjX3dha2VfYW5kX2V4ZWN1dGVfZ3BpbnQoKSB0byB3cmFwIHRoZSB3YWtlLCBleGVj
dXRlLCBzbGVlcCANCj4gc2VxdWVuY2UuDQo+IA0KPiBJZiB0aGUgR1BJTlQgZXhlY3V0ZXMgc3Vj
Y2Vzc2Z1bGx5IHRoZW4gRE1DVUIgd2lsbCBiZSBwdXQgYmFjayBpbnRvIA0KPiBzbGVlcCBhZnRl
ciB0aGUgb3B0aW9uYWwgcmVzcG9uc2UgaXMgcmV0dXJuZWQuDQo+IA0KPiBJdCBmdW5jdGlvbnMg
c2ltaWxhciB0byB0aGUgaW5ib3ggY29tbWFuZCBpbnRlcmZhY2UuDQo+IA0KPiBDYzogTWFyaW8g
TGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+DQo+IENjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnDQo+IFJldmlld2VkLWJ5OiBIYW5zZW4gRHNvdXphIDxoYW5zZW4uZHNvdXphQGFtZC5jb20+
DQo+IEFja2VkLWJ5OiBXYXluZSBMaW4gPHdheW5lLmxpbkBhbWQuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+
IFRlc3RlZC1ieTogRGFuaWVsIFdoZWVsZXIgPGRhbmllbC53aGVlbGVyQGFtZC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4g
DQo+IFRoaXMgY29tbWl0IGNvbWVzIGZyb20gZm9sbG93aW5nIGNvbW1pdHM6DQo+IA0KPiAgODc3
NDAyOWY3NmI5ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMzUgQ0xLX01HUiIpICA2NTEzOGVi
NzJlMWYgDQo+ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMzUgRE1VQiIpICBkYzAxYzRiNzli
ZmUgKCJkcm0vYW1kL2Rpc3BsYXk6IA0KPiBVcGRhdGUgZHJpdmVyIGFuZCBJUFMgaW50ZXJvcCIp
DQo+ICA4MjBjMzg3MGM0OTEgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIERNQ1VCIGVudGVy
L2V4aXQgaWRsZSANCj4gaW50ZXJmYWNlIikgIDJlZjk4YzZkNzUzYSAoImRybS9hbWQvZGlzcGxh
eTogV2FrZSBETUNVQiBiZWZvcmUgDQo+IGV4ZWN1dGluZyBHUElOVCBjb21tYW5kcyIpDQoNCldo
eSBhcmUgeW91IHB1dHRpbmcgbXVsdGlwbGUgY29tbWl0cyB0b2dldGhlciBhbmQgbm90IGp1c3Qg
c3VibWl0dGluZyB0aGUgaW5kaXZpZHVhbCBvbmVzPyAgQW5kIHdoYXQgaXMgdGhpcyBmb3I/DQoN
CmNvbmZ1c2VkLA0KDQpncmVnIGstaA0K
