Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0EAB96FD
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1C710E9E8;
	Fri, 16 May 2025 07:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1082 seconds by postgrey-1.36 at gabe;
 Fri, 16 May 2025 07:58:34 UTC
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AD410E9C9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:58:34 +0000 (UTC)
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4ZzJpz5Lh1zYlsdM;
 Fri, 16 May 2025 15:38:35 +0800 (CST)
Received: from a005.hihonor.com (10.68.18.24) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 15:40:25 +0800
Received: from a010.hihonor.com (10.68.16.52) by a005.hihonor.com
 (10.68.18.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 15:40:25 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Fri, 16 May 2025 15:40:25 +0800
From: wangtao <tao.wangtao@honor.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "jstultz@google.com"
 <jstultz@google.com>, "tjmercier@google.com" <tjmercier@google.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>, yipengxiang
 <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>, "hanfeng
 00012985" <feng.han@honor.com>
Subject: RE: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Thread-Topic: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Thread-Index: AQHbw+qMldEo/aUx7kiLwLLmDDhXfrPP52GAgACTfSD//4oVgIAB7nTg//+OJQCAAiukIP//j3cAADMZG0A=
Date: Fri, 16 May 2025 07:40:25 +0000
Message-ID: <a3f57102bc6e4588bc7659485feadbc1@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
In-Reply-To: <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.163.18.240]
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE1LCAy
MDI1IDEwOjI2IFBNDQo+IFRvOiB3YW5ndGFvIDx0YW8ud2FuZ3Rhb0Bob25vci5jb20+OyBzdW1p
dC5zZW13YWxAbGluYXJvLm9yZzsNCj4gYmVuamFtaW4uZ2FpZ25hcmRAY29sbGFib3JhLmNvbTsg
QnJpYW4uU3RhcmtleUBhcm0uY29tOw0KPiBqc3R1bHR6QGdvb2dsZS5jb207IHRqbWVyY2llckBn
b29nbGUuY29tDQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby0NCj4gbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IHdhbmdiaW50aWFuKEJpbnRpYW5XYW5n
KSA8YmludGlhbi53YW5nQGhvbm9yLmNvbT47IHlpcGVuZ3hpYW5nDQo+IDx5aXBlbmd4aWFuZ0Bo
b25vci5jb20+OyBsaXVsdSAwMDAxMzE2NyA8bGl1bHUubGl1QGhvbm9yLmNvbT47IGhhbmZlbmcN
Cj4gMDAwMTI5ODUgPGZlbmcuaGFuQGhvbm9yLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAy
LzJdIGRtYWJ1Zi9oZWFwczogaW1wbGVtZW50DQo+IERNQV9CVUZfSU9DVExfUldfRklMRSBmb3Ig
c3lzdGVtX2hlYXANCj4gDQo+IE9uIDUvMTUvMjUgMTY6MDMsIHdhbmd0YW8gd3JvdGU6DQo+ID4g
W3dhbmd0YW9dIE15IFRlc3QgQ29uZmlndXJhdGlvbiAoQ1BVIDFHSHosIDUtdGVzdCBhdmVyYWdl
KToNCj4gPiBBbGxvY2F0aW9uOiAzMngzMk1CIGJ1ZmZlciBjcmVhdGlvbg0KPiA+IC0gZG1hYnVm
IDUzbXMgdnMuIHVkbWFidWYgNjk0bXMgKDEwWCBzbG93ZXIpDQo+ID4gLSBOb3RlOiBzaG1lbSBz
aG93cyBleGNlc3NpdmUgYWxsb2NhdGlvbiB0aW1lDQo+IA0KPiBZZWFoLCB0aGF0IGlzIHNvbWV0
aGluZyBhbHJlYWR5IG5vdGVkIGJ5IG90aGVycyBhcyB3ZWxsLiBCdXQgdGhhdCBpcw0KPiBvcnRo
b2dvbmFsLg0KPiANCj4gPg0KPiA+IFJlYWQgMTAyNE1CIEZpbGU6DQo+ID4gLSBkbWFidWYgZGly
ZWN0IDMyNm1zIHZzLiB1ZG1hYnVmIGRpcmVjdCA0NjFtcyAoNDAlIHNsb3dlcikNCj4gPiAtIE5v
dGU6IHBpbl91c2VyX3BhZ2VzX2Zhc3QgY29uc3VtZXMgbWFqb3JpdHkgQ1BVIGN5Y2xlcw0KPiA+
DQo+ID4gS2V5IGZ1bmN0aW9uIGNhbGwgdGltaW5nOiBTZWUgZGV0YWlscyBiZWxvdy4NCj4gDQo+
IFRob3NlIGFyZW4ndCB2YWxpZCwgeW91IGFyZSBjb21wYXJpbmcgZGlmZmVyZW50IGZ1bmN0aW9u
YWxpdGllcyBoZXJlLg0KPiANCj4gUGxlYXNlIHRyeSB1c2luZyB1ZG1hYnVmIHdpdGggc2VuZGZp
bGUoKSBhcyBjb25maXJtZWQgdG8gYmUgd29ya2luZyBieSBULkouDQpbd2FuZ3Rhb10gVXNpbmcg
YnVmZmVyIElPIHdpdGggZG1hYnVmIGZpbGUgcmVhZC93cml0ZSByZXF1aXJlcyBvbmUgbWVtb3J5
IGNvcHkuDQpEaXJlY3QgSU8gcmVtb3ZlcyB0aGlzIGNvcHkgdG8gZW5hYmxlIHplcm8tY29weS4g
VGhlIHNlbmRmaWxlIHN5c3RlbSBjYWxsDQpyZWR1Y2VzIG1lbW9yeSBjb3BpZXMgZnJvbSB0d28g
KHJlYWQvd3JpdGUpIHRvIG9uZS4gSG93ZXZlciwgd2l0aCB1ZG1hYnVmLA0Kc2VuZGZpbGUgc3Rp
bGwga2VlcHMgYXQgbGVhc3Qgb25lIGNvcHksIGZhaWxpbmcgemVyby1jb3B5Lg0KDQpJZiB1ZG1h
YnVmIHNlbmRmaWxlIHVzZXMgYnVmZmVyIElPIChmaWxlIHBhZ2UgY2FjaGUpLCByZWFkIGxhdGVu
Y3kgbWF0Y2hlcw0KZG1hYnVmIGJ1ZmZlciByZWFkLCBidXQgYWxsb2NhdGlvbiB0aW1lIGlzIG11
Y2ggbG9uZ2VyLg0KV2l0aCBEaXJlY3QgSU8sIHRoZSBkZWZhdWx0IDE2LXBhZ2UgcGlwZSBzaXpl
IG1ha2VzIGl0IHNsb3dlciB0aGFuIGJ1ZmZlciBJTy4NCg0KVGVzdCBkYXRhIHNob3dzOg0KdWRt
YWJ1ZiBkaXJlY3QgcmVhZCBpcyBtdWNoIGZhc3RlciB0aGFuIHVkbWFidWYgc2VuZGZpbGUuDQpk
bWFidWYgZGlyZWN0IHJlYWQgb3V0cGVyZm9ybXMgdWRtYWJ1ZiBkaXJlY3QgcmVhZCBieSBhIGxh
cmdlIG1hcmdpbi4NCg0KSXNzdWU6IEFmdGVyIHVkbWFidWYgaXMgbWFwcGVkIHZpYSBtYXBfZG1h
X2J1ZiwgYXBwcyB1c2luZyBtZW1mZCBvcg0KdWRtYWJ1ZiBmb3IgRGlyZWN0IElPIG1pZ2h0IGNh
dXNlIGVycm9ycywgYnV0IHRoZXJlIGFyZSBubyBzYWZlZ3VhcmRzIHRvDQpwcmV2ZW50IHRoaXMu
DQoNCkFsbG9jYXRlIDMyeDMyTUIgYnVmZmVyIGFuZCByZWFkIDEwMjQgTUIgZmlsZSBUZXN0Og0K
TWV0cmljICAgICAgICAgICAgICAgICB8IGFsbG9jIChtcykgfCByZWFkIChtcykgfCB0b3RhbCAo
bXMpDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS18LS0tLS0tLS0tLS18LS0t
LS0tLS0tLS0NCnVkbWFidWYgYnVmZmVyIHJlYWQgICAgfCA1MzkgICAgICAgIHwgMjAxNyAgICAg
IHwgMjU1NQ0KdWRtYWJ1ZiBkaXJlY3QgcmVhZCAgICB8IDUyMiAgICAgICAgfCA2NTggICAgICAg
fCAxMTc5DQp1ZG1hYnVmIGJ1ZmZlciBzZW5kZmlsZXwgNTA1ICAgICAgICB8IDEwNDAgICAgICB8
IDE1NDYNCnVkbWFidWYgZGlyZWN0IHNlbmRmaWxlfCA1MTAgICAgICAgIHwgMjI2OSAgICAgIHwg
Mjc4MA0KZG1hYnVmIGJ1ZmZlciByZWFkICAgICB8IDUxICAgICAgICAgfCAxMDY4ICAgICAgfCAx
MTE4DQpkbWFidWYgZGlyZWN0IHJlYWQgICAgIHwgNTIgICAgICAgICB8IDI5NyAgICAgICB8IDM0
OQ0KDQp1ZG1hYnVmIHNlbmRmaWxlIHRlc3Qgc3RlcHM6DQoxLiBPcGVuIGRhdGEgZmlsZSgxMDI0
TUIpLCBnZXQgYmFja19mZA0KMi4gQ3JlYXRlIG1lbWZkKDMyTUIpICMgTG9vcCBzdGVwcyAyLTYN
CjMuIEFsbG9jYXRlIHVkbWFidWYgd2l0aCBtZW1mZA0KNC4gQ2FsbCBzZW5kZmlsZShtZW1mZCwg
YmFja19mZCkNCjUuIENsb3NlIG1lbWZkIGFmdGVyIHNlbmRmaWxlDQo2LiBDbG9zZSB1ZG1hYnVm
DQo3LiBDbG9zZSBiYWNrX2ZkDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCg0K
