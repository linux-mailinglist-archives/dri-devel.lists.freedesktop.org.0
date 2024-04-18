Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280BA8A9183
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 05:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87A6113967;
	Thu, 18 Apr 2024 03:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49143113967;
 Thu, 18 Apr 2024 03:19:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VKjcJ4Tgvz2CcFl;
 Thu, 18 Apr 2024 11:16:48 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (unknown [7.185.36.37])
 by mail.maildlp.com (Postfix) with ESMTPS id 4EB01180047;
 Thu, 18 Apr 2024 11:19:47 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 11:19:47 +0800
Received: from dggpeml500025.china.huawei.com ([7.185.36.35]) by
 dggpeml500025.china.huawei.com ([7.185.36.35]) with mapi id 15.01.2507.035;
 Thu, 18 Apr 2024 11:19:47 +0800
From: wangzhu <wangzhu9@huawei.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com"
 <sunpeng.li@amd.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "sanglipeng1@jd.com"
 <sanglipeng1@jd.com>, "sashal@kernel.org" <sashal@kernel.org>,
 "wayne.lin@amd.com" <wayne.lin@amd.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "hongao@uniontech.com" <hongao@uniontech.com>,
 "cssk@net-c.es" <cssk@net-c.es>, "nicholas.kazlauskas@amd.com"
 <nicholas.kazlauskas@amd.com>, "chiahsuan.chung@amd.com"
 <chiahsuan.chung@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "roman.li@amd.com" <roman.li@amd.com>, "aurabindo.pillai@amd.com"
 <aurabindo.pillai@amd.com>, "hansen.dsouza@amd.com" <hansen.dsouza@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, "Konstantin Meskhidze
 (A)" <konstantin.meskhidze@huawei.com>, "aric.cyr@amd.com"
 <aric.cyr@amd.com>, "jaehyun.chung@amd.com" <jaehyun.chung@amd.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHY1LjEwXSBkcm0vYW1kL2Rpc3BsYXk6IFdha2UgRE1D?=
 =?gb2312?Q?UB_before_executing_GPINT_commands?=
Thread-Topic: [PATCH v5.10] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Thread-Index: AQHaj6jIaiBHFvQAJEuj6ZpJX3IAY7FpzVWAgAOQixA=
Date: Thu, 18 Apr 2024 03:19:46 +0000
Message-ID: <a0b467dd1c074758aa89a18fa7a9c6ab@huawei.com>
References: <20240416024347.2446403-1-wangzhu9@huawei.com>
 <2024041633-breath-unfiled-86c1@gregkh>
In-Reply-To: <2024041633-breath-unfiled-86c1@gregkh>
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
aGUgbGludXgtNi43IGJyYW5jaCB0byBmaXggaXQsIGl0cyBjb21taXQgaXMgMmVmOThjNmQ3NTNh
NzQ0ZTMzM2I3ZTM0YjljZjY4NzA0MGZiYTU3ZCAoImRybS9hbWQvZGlzcGxheTogV2FrZSBETUNV
QiBiZWZvcmUgZXhlY3V0aW5nIEdQSU5UIGNvbW1hbmRzIikuIFdoZW4gd2UgYXBwbHkgdGhpcyBw
YXRjaCB0byBsaW51eC01LjEwLCB0aGVyZSBhcmUgbG90cyBvZiBjb25mbGljdHMsIGFuZCB3ZSBm
b3VuZCB0aGVyZSBhcmUgbG90cyBvZiBkZXBlbmRlbnQgcGF0Y2hlcywgd2UgZG8gbm90IGFwcGx5
IGFsbCB0aGVzZSBwYXRjaGVzIHNpbmNlIHNvbWUgYXJlIG5vdCBtZWFudCB0byBmaXggdGhlIGN2
ZSwgc28gd2UganVzdCBnZXQgcGFydCBvZiB0aGVtLCBhbmQgZm9yIGVhY2ggcGF0Y2ggd2UganVz
dCBnZXQgdGhlIHBhcnQgd2hpY2ggaXMgaGVscGZ1bCB0byBmaXguDQoNCg0KLS0tLS3Tyrz+1K28
/i0tLS0tDQq3orz+yMs6IEdyZWcgS0ggW21haWx0bzpncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Z10gDQq3osvNyrG85DogMjAyNMTqNNTCMTbI1SAxMjo0OQ0KytW8/sjLOiB3YW5nemh1IDx3YW5n
emh1OUBodWF3ZWkuY29tPg0Ks63LzTogaGFycnkud2VudGxhbmRAYW1kLmNvbTsgc3VucGVuZy5s
aUBhbWQuY29tOyBhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tOyBjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb207IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsgc2FuZ2xpcGVuZzFAamQu
Y29tOyBzYXNoYWxAa2VybmVsLm9yZzsgd2F5bmUubGluQGFtZC5jb207IGpvc2h1YUBmcm9nZ2ku
ZXM7IGhvbmdhb0B1bmlvbnRlY2guY29tOyBjc3NrQG5ldC1jLmVzOyBuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb207IGNoaWFoc3Vhbi5jaHVuZ0BhbWQuY29tOyBtd2VuQGlnYWxpYS5jb207IHJv
bWFuLmxpQGFtZC5jb207IGF1cmFiaW5kby5waWxsYWlAYW1kLmNvbTsgaGFuc2VuLmRzb3V6YUBh
bWQuY29tOyBSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb207IEtvbnN0YW50aW4gTWVza2hpZHplIChB
KSA8a29uc3RhbnRpbi5tZXNraGlkemVAaHVhd2VpLmNvbT47IGFyaWMuY3lyQGFtZC5jb207IHpo
YW5namlhbGluIChGKSA8emhhbmdqaWFsaW4xMUBodWF3ZWkuY29tPjsgamFlaHl1bi5jaHVuZ0Bh
bWQuY29tOyBtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0K1vfM4jogUmU6IFtQQVRDSCB2NS4xMF0gZHJtL2FtZC9kaXNwbGF5OiBX
YWtlIERNQ1VCIGJlZm9yZSBleGVjdXRpbmcgR1BJTlQgY29tbWFuZHMNCg0KT24gVHVlLCBBcHIg
MTYsIDIwMjQgYXQgMDI6NDM6NDdBTSArMDAwMCwgWmh1IFdhbmcgd3JvdGU6DQo+IEZyb206IE5p
Y2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCj4gDQo+IHN0
YWJsZSBpbmNsdXNpb24NCj4gZnJvbSBzdGFibGUtdjYuNy4zDQo+IGNvbW1pdCAJMmVmOThjNmQ3
NTNhNyAoImRybS9hbWQvZGlzcGxheTogV2FrZSBETUNVQiBiZWZvcmUgZXhlY3V0aW5nIEdQSU5U
IGNvbW1hbmRzIikNCj4gY2F0ZWdvcnk6IGJ1Z2ZpeA0KPiBidWd6aWxsYTogaHR0cHM6Ly9naXRl
ZS5jb20vc3JjLW9wZW5ldWxlci9rZXJuZWwvaXNzdWVzL0k5QlY0Qw0KPiBDVkU6IENWRS0yMDIz
LTUyNjI0DQo+IA0KPiBSZWZlcmVuY2U6IA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tDQo+IG1pdC8/aWQ9MmVm
OThjNmQ3NTNhNzQ0ZTMzM2I3ZTM0YjljZjY4NzA0MGZiYTU3ZA0KPiANCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+IFsgVXBzdHJlYW0gY29tbWl0IGU1ZmZkMTI2M2Rk
NWIgKCJkcm0vYW1kL2Rpc3BsYXk6IFdha2UgRE1DVUIgYmVmb3JlIA0KPiBleGVjdXRpbmcgR1BJ
TlQgY29tbWFuZHMiKSBdDQo+IA0KPiBbV2h5XQ0KPiBETUNVQiBjYW4gYmUgaW4gaWRsZSB3aGVu
IHdlIGF0dGVtcHQgdG8gaW50ZXJmYWNlIHdpdGggdGhlIEhXIHRocm91Z2ggDQo+IHRoZSBHUElO
VCBtYWlsYm94IHJlc3VsdGluZyBpbiBhIHN5c3RlbSBoYW5nLg0KPiANCj4gW0hvd10NCj4gQWRk
IGRjX3dha2VfYW5kX2V4ZWN1dGVfZ3BpbnQoKSB0byB3cmFwIHRoZSB3YWtlLCBleGVjdXRlLCBz
bGVlcCANCj4gc2VxdWVuY2UuDQo+IA0KPiBJZiB0aGUgR1BJTlQgZXhlY3V0ZXMgc3VjY2Vzc2Z1
bGx5IHRoZW4gRE1DVUIgd2lsbCBiZSBwdXQgYmFjayBpbnRvIA0KPiBzbGVlcCBhZnRlciB0aGUg
b3B0aW9uYWwgcmVzcG9uc2UgaXMgcmV0dXJuZWQuDQo+IA0KPiBJdCBmdW5jdGlvbnMgc2ltaWxh
ciB0byB0aGUgaW5ib3ggY29tbWFuZCBpbnRlcmZhY2UuDQo+IA0KPiBDYzogTWFyaW8gTGltb25j
aWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+DQo+IENjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+
IFJldmlld2VkLWJ5OiBIYW5zZW4gRHNvdXphIDxoYW5zZW4uZHNvdXphQGFtZC5jb20+DQo+IEFj
a2VkLWJ5OiBXYXluZSBMaW4gPHdheW5lLmxpbkBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQo+IFRlc3Rl
ZC1ieTogRGFuaWVsIFdoZWVsZXIgPGRhbmllbC53aGVlbGVyQGFtZC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gDQo+IFRo
aXMgcGF0Y2ggY29tZXMgZnJvbSBmb2xsb3dpbmcgY29tbWl0czoNCj4gDQo+ICAxMTVjN2U3ZjA1
MDEgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBwc3IgZ2V0X3N0YXRlIGNhbGwiKQ0KPiAgMWQ0OTY5
MDdmMWM1ICgiZHJtL2FtZC9kaXNwbGF5OiBFbmdhZ2UgUFNSIHN5bmNocm9ub3VzbHkiKSAgDQo+
IDM0YmE0MzJjOTQ2ZCAoImRybS9hbWQvZGlzcGxheTogW0ZXIFByb21vdGlvbl0gUmVsZWFzZSAw
LjAuNDQiKQ0KPiAgNjcyMjUxYjIyM2MxICgiZHJtL2FtZC9kaXNwbGF5OiBbRlcgUHJvbW90aW9u
XSBSZWxlYXNlIDAuMC40MCIpDQo+ICAwNGYzYzg4ZjA5NTUgKCJkcm0vYW1kL2Rpc3BsYXk6IFJl
dHJ5IGdldHRpbmcgUFNSIHN0YXRlIGlmIGNvbW1hbmQgDQo+IHRpbWVzIG91dCIpICBiMzBlZGE4
ZDQxNmMgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBFVFcgbG9nIHRvIA0KPiBkbXViX3Bzcl9nZXRf
c3RhdGUiKSAgZjU5YTY2YzE5MTVlICgiZHJtL2FtZC9kaXNwbGF5OiB1c2UgZG8td2hpbGUtMCAN
Cj4gZm9yIERDX1RSQUNFX0xFVkVMX01FU1NBR0UoKSIpICBlOTdjYzA0ZmUwZmIgKCJkcm0vYW1k
L2Rpc3BsYXk6IA0KPiByZWZhY3RvciBkbXViIGNvbW1hbmRzIGludG8gc2luZ2xlIGZ1bmN0aW9u
IikNCj4gIDUyMmI5YTVkNTg1MiAoImRybS9hbWQvZGlzcGxheTogZHJhaW4gZG11YiBpbmJveCBp
ZiBxdWV1ZSBpcyBmdWxsIikgIA0KPiA5ZGNlOGMyYTVmMWIgKCJkcm0vYW1kL2Rpc3BsYXk6IFtG
VyBQcm9tb3Rpb25dIFJlbGVhc2UgMC4wLjE2MS4wIikNCj4gIDI3NjY0MTc3NTg0OCAoImRybS9h
bWQvZGlzcGxheTogW0ZXIFByb21vdGlvbl0gUmVsZWFzZSAwLjAuMTYyLjAiKQ0KPiAgODc3NDAy
OWY3NmI5ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMzUgQ0xLX01HUiIpICA2NTEzOGViNzJl
MWYgDQo+ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMzUgRE1VQiIpICBkYzAxYzRiNzliZmUg
KCJkcm0vYW1kL2Rpc3BsYXk6IA0KPiBVcGRhdGUgZHJpdmVyIGFuZCBJUFMgaW50ZXJvcCIpDQo+
ICA1Yjc5NTQyNzJhZTkgKCJkcm0vYW1kL2Rpc3BsYXk6IFtGVyBQcm9tb3Rpb25dIFJlbGVhc2Ug
MC4wLjE4My4wIikNCj4gIGRhMmQxNmZjZGRhMyAoImRybS9hbWQvZGlzcGxheTogRml4IElQUyBo
YW5kc2hha2UgZm9yIGlkbGUgDQo+IG9wdGltaXphdGlvbnMiKQ0KPiAgNWU4YTBkMzU5OGI0ICgi
ZHJtL2FtZC9kaXNwbGF5OiBOZWdhdGUgSVBTIGFsbG93IGFuZCBjb21taXQgYml0cyIpDQo+ICA4
MjBjMzg3MGM0OTEgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIERNQ1VCIGVudGVyL2V4aXQg
aWRsZSANCj4gaW50ZXJmYWNlIikgIDJlZjk4YzZkNzUzYSAoImRybS9hbWQvZGlzcGxheTogV2Fr
ZSBETUNVQiBiZWZvcmUgDQo+IGV4ZWN1dGluZyBHUElOVCBjb21tYW5kcyIpDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBaaHUgV2FuZyA8d2FuZ3podTlAaHVhd2VpLmNvbT4NCg0KSSdtIGNvbmZ1c2Vk
LCB3aGF0IGFyZSB3ZSBzdXBwb3NlZCB0byBkbyB3aXRoIHRoaXM/DQoNCmdyZWcgay1oDQo=
