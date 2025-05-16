Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD528AB9953
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB8610EA1D;
	Fri, 16 May 2025 09:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E8A10EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:49:55 +0000 (UTC)
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZzMhN1wWlzYl4JC;
 Fri, 16 May 2025 17:48:04 +0800 (CST)
Received: from a003.hihonor.com (10.68.18.8) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:49:53 +0800
Received: from a010.hihonor.com (10.68.16.52) by a003.hihonor.com (10.68.18.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:49:53 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Fri, 16 May 2025 17:49:53 +0800
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
Thread-Index: AQHbw+qMldEo/aUx7kiLwLLmDDhXfrPP52GAgACTfSD//4oVgIAB7nTg//+OJQCAAiukIP//j3cAADMZG0D//5fGgP//aOTw
Date: Fri, 16 May 2025 09:49:53 +0000
Message-ID: <e23bfe917c8744aa9162744bdd8ac458@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
In-Reply-To: <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
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
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAxNiwgMjAy
NSA0OjM2IFBNDQo+IFRvOiB3YW5ndGFvIDx0YW8ud2FuZ3Rhb0Bob25vci5jb20+OyBzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZzsNCj4gYmVuamFtaW4uZ2FpZ25hcmRAY29sbGFib3JhLmNvbTsgQnJp
YW4uU3RhcmtleUBhcm0uY29tOw0KPiBqc3R1bHR6QGdvb2dsZS5jb207IHRqbWVyY2llckBnb29n
bGUuY29tDQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby0NCj4gbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IHdhbmdiaW50aWFuKEJpbnRpYW5XYW5nKSA8
YmludGlhbi53YW5nQGhvbm9yLmNvbT47IHlpcGVuZ3hpYW5nDQo+IDx5aXBlbmd4aWFuZ0Bob25v
ci5jb20+OyBsaXVsdSAwMDAxMzE2NyA8bGl1bHUubGl1QGhvbm9yLmNvbT47IGhhbmZlbmcNCj4g
MDAwMTI5ODUgPGZlbmcuaGFuQGhvbm9yLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJd
IGRtYWJ1Zi9oZWFwczogaW1wbGVtZW50DQo+IERNQV9CVUZfSU9DVExfUldfRklMRSBmb3Igc3lz
dGVtX2hlYXANCj4gDQo+IE9uIDUvMTYvMjUgMDk6NDAsIHdhbmd0YW8gd3JvdGU6DQo+ID4NCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBN
YXkgMTUsIDIwMjUgMTA6MjYgUE0NCj4gPj4gVG86IHdhbmd0YW8gPHRhby53YW5ndGFvQGhvbm9y
LmNvbT47IHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnOw0KPiA+PiBiZW5qYW1pbi5nYWlnbmFyZEBj
b2xsYWJvcmEuY29tOyBCcmlhbi5TdGFya2V5QGFybS5jb207DQo+ID4+IGpzdHVsdHpAZ29vZ2xl
LmNvbTsgdGptZXJjaWVyQGdvb2dsZS5jb20NCj4gPj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPj4gbGluYXJvLSBt
bS1zaWdAbGlzdHMubGluYXJvLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4g
Pj4gd2FuZ2JpbnRpYW4oQmludGlhbldhbmcpIDxiaW50aWFuLndhbmdAaG9ub3IuY29tPjsgeWlw
ZW5neGlhbmcNCj4gPj4gPHlpcGVuZ3hpYW5nQGhvbm9yLmNvbT47IGxpdWx1IDAwMDEzMTY3IDxs
aXVsdS5saXVAaG9ub3IuY29tPjsNCj4gPj4gaGFuZmVuZw0KPiA+PiAwMDAxMjk4NSA8ZmVuZy5o
YW5AaG9ub3IuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZG1hYnVmL2hlYXBz
OiBpbXBsZW1lbnQNCj4gPj4gRE1BX0JVRl9JT0NUTF9SV19GSUxFIGZvciBzeXN0ZW1faGVhcA0K
PiA+Pg0KPiA+PiBPbiA1LzE1LzI1IDE2OjAzLCB3YW5ndGFvIHdyb3RlOg0KPiA+Pj4gW3dhbmd0
YW9dIE15IFRlc3QgQ29uZmlndXJhdGlvbiAoQ1BVIDFHSHosIDUtdGVzdCBhdmVyYWdlKToNCj4g
Pj4+IEFsbG9jYXRpb246IDMyeDMyTUIgYnVmZmVyIGNyZWF0aW9uDQo+ID4+PiAtIGRtYWJ1ZiA1
M21zIHZzLiB1ZG1hYnVmIDY5NG1zICgxMFggc2xvd2VyKQ0KPiA+Pj4gLSBOb3RlOiBzaG1lbSBz
aG93cyBleGNlc3NpdmUgYWxsb2NhdGlvbiB0aW1lDQo+ID4+DQo+ID4+IFllYWgsIHRoYXQgaXMg
c29tZXRoaW5nIGFscmVhZHkgbm90ZWQgYnkgb3RoZXJzIGFzIHdlbGwuIEJ1dCB0aGF0IGlzDQo+
ID4+IG9ydGhvZ29uYWwuDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gUmVhZCAxMDI0TUIgRmlsZToNCj4g
Pj4+IC0gZG1hYnVmIGRpcmVjdCAzMjZtcyB2cy4gdWRtYWJ1ZiBkaXJlY3QgNDYxbXMgKDQwJSBz
bG93ZXIpDQo+ID4+PiAtIE5vdGU6IHBpbl91c2VyX3BhZ2VzX2Zhc3QgY29uc3VtZXMgbWFqb3Jp
dHkgQ1BVIGN5Y2xlcw0KPiA+Pj4NCj4gPj4+IEtleSBmdW5jdGlvbiBjYWxsIHRpbWluZzogU2Vl
IGRldGFpbHMgYmVsb3cuDQo+ID4+DQo+ID4+IFRob3NlIGFyZW4ndCB2YWxpZCwgeW91IGFyZSBj
b21wYXJpbmcgZGlmZmVyZW50IGZ1bmN0aW9uYWxpdGllcyBoZXJlLg0KPiA+Pg0KPiA+PiBQbGVh
c2UgdHJ5IHVzaW5nIHVkbWFidWYgd2l0aCBzZW5kZmlsZSgpIGFzIGNvbmZpcm1lZCB0byBiZSB3
b3JraW5nIGJ5DQo+IFQuSi4NCj4gPiBbd2FuZ3Rhb10gVXNpbmcgYnVmZmVyIElPIHdpdGggZG1h
YnVmIGZpbGUgcmVhZC93cml0ZSByZXF1aXJlcyBvbmUNCj4gbWVtb3J5IGNvcHkuDQo+ID4gRGly
ZWN0IElPIHJlbW92ZXMgdGhpcyBjb3B5IHRvIGVuYWJsZSB6ZXJvLWNvcHkuIFRoZSBzZW5kZmls
ZSBzeXN0ZW0NCj4gPiBjYWxsIHJlZHVjZXMgbWVtb3J5IGNvcGllcyBmcm9tIHR3byAocmVhZC93
cml0ZSkgdG8gb25lLiBIb3dldmVyLCB3aXRoDQo+ID4gdWRtYWJ1Ziwgc2VuZGZpbGUgc3RpbGwg
a2VlcHMgYXQgbGVhc3Qgb25lIGNvcHksIGZhaWxpbmcgemVyby1jb3B5Lg0KPiANCj4gDQo+IFRo
ZW4gcGxlYXNlIHdvcmsgb24gZml4aW5nIHRoaXMuDQpbd2FuZ3Rhb10gV2hhdCBuZWVkcyBmaXhp
bmc/IERvZXMgc2VuZGZpbGUgYWNoaWV2ZSB6ZXJvLWNvcHk/DQpzZW5kZmlsZSByZWR1Y2VzIG1l
bW9yeSBjb3BpZXMgKGZyb20gMiB0byAxKSBmb3IgbmV0d29yayBzb2NrZXRzLA0KYnV0IHN0aWxs
IHJlcXVpcmVzIG9uZSBjb3B5IGFuZCBjYW5ub3QgYWNoaWV2ZSB6ZXJvIGNvcGllcy4NCg0KPiAN
Cj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiANCj4gDQo+ID4NCj4gPiBJZiB1ZG1hYnVmIHNl
bmRmaWxlIHVzZXMgYnVmZmVyIElPIChmaWxlIHBhZ2UgY2FjaGUpLCByZWFkIGxhdGVuY3kNCj4g
PiBtYXRjaGVzIGRtYWJ1ZiBidWZmZXIgcmVhZCwgYnV0IGFsbG9jYXRpb24gdGltZSBpcyBtdWNo
IGxvbmdlci4NCj4gPiBXaXRoIERpcmVjdCBJTywgdGhlIGRlZmF1bHQgMTYtcGFnZSBwaXBlIHNp
emUgbWFrZXMgaXQgc2xvd2VyIHRoYW4gYnVmZmVyIElPLg0KPiA+DQo+ID4gVGVzdCBkYXRhIHNo
b3dzOg0KPiA+IHVkbWFidWYgZGlyZWN0IHJlYWQgaXMgbXVjaCBmYXN0ZXIgdGhhbiB1ZG1hYnVm
IHNlbmRmaWxlLg0KPiA+IGRtYWJ1ZiBkaXJlY3QgcmVhZCBvdXRwZXJmb3JtcyB1ZG1hYnVmIGRp
cmVjdCByZWFkIGJ5IGEgbGFyZ2UgbWFyZ2luLg0KPiA+DQo+ID4gSXNzdWU6IEFmdGVyIHVkbWFi
dWYgaXMgbWFwcGVkIHZpYSBtYXBfZG1hX2J1ZiwgYXBwcyB1c2luZyBtZW1mZCBvcg0KPiA+IHVk
bWFidWYgZm9yIERpcmVjdCBJTyBtaWdodCBjYXVzZSBlcnJvcnMsIGJ1dCB0aGVyZSBhcmUgbm8g
c2FmZWd1YXJkcw0KPiA+IHRvIHByZXZlbnQgdGhpcy4NCj4gPg0KPiA+IEFsbG9jYXRlIDMyeDMy
TUIgYnVmZmVyIGFuZCByZWFkIDEwMjQgTUIgZmlsZSBUZXN0Og0KPiA+IE1ldHJpYyAgICAgICAg
ICAgICAgICAgfCBhbGxvYyAobXMpIHwgcmVhZCAobXMpIHwgdG90YWwgKG1zKQ0KPiA+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tfC0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLXwtLS0tLS0tLS0tLQ0K
PiA+IHVkbWFidWYgYnVmZmVyIHJlYWQgICAgfCA1MzkgICAgICAgIHwgMjAxNyAgICAgIHwgMjU1
NQ0KPiA+IHVkbWFidWYgZGlyZWN0IHJlYWQgICAgfCA1MjIgICAgICAgIHwgNjU4ICAgICAgIHwg
MTE3OQ0KPiA+IHVkbWFidWYgYnVmZmVyIHNlbmRmaWxlfCA1MDUgICAgICAgIHwgMTA0MCAgICAg
IHwgMTU0Ng0KPiA+IHVkbWFidWYgZGlyZWN0IHNlbmRmaWxlfCA1MTAgICAgICAgIHwgMjI2OSAg
ICAgIHwgMjc4MA0KPiA+IGRtYWJ1ZiBidWZmZXIgcmVhZCAgICAgfCA1MSAgICAgICAgIHwgMTA2
OCAgICAgIHwgMTExOA0KPiA+IGRtYWJ1ZiBkaXJlY3QgcmVhZCAgICAgfCA1MiAgICAgICAgIHwg
Mjk3ICAgICAgIHwgMzQ5DQo+ID4NCj4gPiB1ZG1hYnVmIHNlbmRmaWxlIHRlc3Qgc3RlcHM6DQo+
ID4gMS4gT3BlbiBkYXRhIGZpbGUoMTAyNE1CKSwgZ2V0IGJhY2tfZmQgMi4gQ3JlYXRlIG1lbWZk
KDMyTUIpICMgTG9vcA0KPiA+IHN0ZXBzIDItNiAzLiBBbGxvY2F0ZSB1ZG1hYnVmIHdpdGggbWVt
ZmQgNC4gQ2FsbCBzZW5kZmlsZShtZW1mZCwNCj4gPiBiYWNrX2ZkKSA1LiBDbG9zZSBtZW1mZCBh
ZnRlciBzZW5kZmlsZSA2LiBDbG9zZSB1ZG1hYnVmIDcuIENsb3NlDQo+ID4gYmFja19mZA0KPiA+
DQo+ID4+DQo+ID4+IFJlZ2FyZHMsDQo+ID4+IENocmlzdGlhbi4NCj4gPg0KDQo=
