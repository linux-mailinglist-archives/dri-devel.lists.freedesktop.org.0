Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEAABB3CA
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 06:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81B10E037;
	Mon, 19 May 2025 04:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D488910E037
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 04:08:26 +0000 (UTC)
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4b13yq4b0szYl04q;
 Mon, 19 May 2025 12:06:27 +0800 (CST)
Received: from a008.hihonor.com (10.68.30.56) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 May
 2025 12:08:18 +0800
Received: from a010.hihonor.com (10.68.16.52) by a008.hihonor.com
 (10.68.30.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 May
 2025 12:08:17 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Mon, 19 May 2025 12:08:17 +0800
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
Thread-Index: AQHbw+qMldEo/aUx7kiLwLLmDDhXfrPP52GAgACTfSD//4oVgIAB7nTg//+OJQCAAiukIP//j3cAADMZG0D//5fGgP//aOTwgAC2pgD/+zby8A==
Date: Mon, 19 May 2025 04:08:17 +0000
Message-ID: <3d098b2109824738a5d1316bd1a516c1@honor.com>
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
 <e23bfe917c8744aa9162744bdd8ac458@honor.com>
 <772d694e-706a-4d98-a236-43d59094e8d6@amd.com>
In-Reply-To: <772d694e-706a-4d98-a236-43d59094e8d6@amd.com>
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
NSA2OjI5IFBNDQo+IFRvOiB3YW5ndGFvIDx0YW8ud2FuZ3Rhb0Bob25vci5jb20+OyBzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZzsNCj4gYmVuamFtaW4uZ2FpZ25hcmRAY29sbGFib3JhLmNvbTsgQnJp
YW4uU3RhcmtleUBhcm0uY29tOw0KPiBqc3R1bHR6QGdvb2dsZS5jb207IHRqbWVyY2llckBnb29n
bGUuY29tDQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby0NCj4gbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IHdhbmdiaW50aWFuKEJpbnRpYW5XYW5nKSA8
YmludGlhbi53YW5nQGhvbm9yLmNvbT47IHlpcGVuZ3hpYW5nDQo+IDx5aXBlbmd4aWFuZ0Bob25v
ci5jb20+OyBsaXVsdSA8bGl1bHUubGl1QGhvbm9yLmNvbT47IGhhbmZlbmcNCj4gPGZlbmcuaGFu
QGhvbm9yLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRtYWJ1Zi9oZWFwczogaW1w
bGVtZW50DQo+IERNQV9CVUZfSU9DVExfUldfRklMRSBmb3Igc3lzdGVtX2hlYXANCj4gDQo+IE9u
IDUvMTYvMjUgMTE6NDksIHdhbmd0YW8gd3JvdGU6DQo+ID4+Pj4gUGxlYXNlIHRyeSB1c2luZyB1
ZG1hYnVmIHdpdGggc2VuZGZpbGUoKSBhcyBjb25maXJtZWQgdG8gYmUgd29ya2luZw0KPiA+Pj4+
IGJ5DQo+ID4+IFQuSi4NCj4gPj4+IFt3YW5ndGFvXSBVc2luZyBidWZmZXIgSU8gd2l0aCBkbWFi
dWYgZmlsZSByZWFkL3dyaXRlIHJlcXVpcmVzIG9uZQ0KPiA+PiBtZW1vcnkgY29weS4NCj4gPj4+
IERpcmVjdCBJTyByZW1vdmVzIHRoaXMgY29weSB0byBlbmFibGUgemVyby1jb3B5LiBUaGUgc2Vu
ZGZpbGUgc3lzdGVtDQo+ID4+PiBjYWxsIHJlZHVjZXMgbWVtb3J5IGNvcGllcyBmcm9tIHR3byAo
cmVhZC93cml0ZSkgdG8gb25lLiBIb3dldmVyLA0KPiA+Pj4gd2l0aCB1ZG1hYnVmLCBzZW5kZmls
ZSBzdGlsbCBrZWVwcyBhdCBsZWFzdCBvbmUgY29weSwgZmFpbGluZyB6ZXJvLWNvcHkuDQo+ID4+
DQo+ID4+DQo+ID4+IFRoZW4gcGxlYXNlIHdvcmsgb24gZml4aW5nIHRoaXMuDQo+ID4gW3dhbmd0
YW9dIFdoYXQgbmVlZHMgZml4aW5nPyBEb2VzIHNlbmRmaWxlIGFjaGlldmUgemVyby1jb3B5Pw0K
PiA+IHNlbmRmaWxlIHJlZHVjZXMgbWVtb3J5IGNvcGllcyAoZnJvbSAyIHRvIDEpIGZvciBuZXR3
b3JrIHNvY2tldHMsIGJ1dA0KPiA+IHN0aWxsIHJlcXVpcmVzIG9uZSBjb3B5IGFuZCBjYW5ub3Qg
YWNoaWV2ZSB6ZXJvIGNvcGllcy4NCj4gDQo+IFdlbGwgd2h5IG5vdD8gU2VlIHNlbmRmaWxlKCkg
aXMgdGhlIGRlc2lnbmF0ZWQgTGludXggdUFQSSBmb3IgbW92aW5nIGRhdGENCj4gYmV0d2VlbiB0
d28gZmlsZXMsIG1heWJlIHNwbGljZSgpIGlzIGFsc28gYXBwcm9wcmlhdGUuDQo+IA0KPiBUaGUg
bWVtb3J5IGZpbGUgZGVzY3JpcHRvciBhbmQgeW91ciBkZXN0aW5hdGlvbiBmaWxlIGFyZSBib3Ro
IGEgZmlsZXMuIFNvIHRob3NlDQo+IHVBUElzIGFwcGx5Lg0KW3dhbmd0YW9dIEkgcmVhbGl6ZSBv
dXIgZGlzYWdyZWVtZW50IGxpZXMgaGVyZTogIA0KWW91IGJlbGlldmUgc2VuZGZpbGUgZW5hYmxl
cyB6ZXJvLWNvcHkgZm9yIHJlZ3VsYXIgZmlsZSDihpIgc29ja2V0L2ZpbGU6ICANCnNlbmRmaWxl
KGRzdF9zb2NrZXQsIHNyY19kaXNrKSAgDQpbZGlza10gLS1ETUEtLT4gW3BhZ2UgYnVmZmVyXSAt
LURNQS0tPiBbTklDXSAgDQpzZW5kZmlsZShkc3RfZGlzaywgc3JjX2Rpc2spICANCltkaXNrXSAt
LURNQS0tPiBbcGFnZSBidWZmZXJdIC0tRE1BLS0+IFtESVNLXSAgDQoNCkJ1dCBmb3IgcmVndWxh
ciBmaWxlIOKGkiBtZW1vcnkgZmlsZSAoZS5nLiwgdG1wZnMvc2htZW0pLCBhIENQVSBjb3B5IGlz
IHVuYXZvaWRhYmxlOiAgDQpzZW5kZmlsZShkc3RfbWVtZmlsZSwgc3JjX2Rpc2spICANCltkaXNr
XSAtLURNQS0tPiBbcGFnZSBidWZmZXJdIC0tQ1BVIGNvcHktLT4gW0RJU0tdICANCldpdGhvdXQg
bWVtb3J5LXRvLW1lbW9yeSBETUEsIHRoaXMgd2FzdGVzIENQVS9wb3dlciDigJQgY3JpdGljYWwg
Zm9yIGVtYmVkZGVkIGRldmljZXMuICANCg0KPiANCj4gTm93IHdoYXQgeW91IHN1Z2dlc3QgaXMg
dG8gYWRkIGEgbmV3IElPQ1RMIHRvIGRvIHRoaXMgaW4gYSB2ZXJ5IHNwZWNpZmljDQo+IG1hbm5l
ciBqdXN0IGZvciB0aGUgc3lzdGVtIERNQS1idWYgaGVhcC4gQW5kIGFzIGZhciBhcyBJIGNhbiBz
ZWUgdGhhdCBpcyBpbg0KPiBnZW5lcmFsIGEgY29tcGxldGUgbm8tZ28uDQo+IA0KPiBJIG1lYW4g
SSB1bmRlcnN0YW5kIHdoeSB5b3UgZG8gdGhpcy4gSW5zdGVhZCBvZiBpbXByb3ZpbmcgdGhlIGV4
aXN0aW5nDQo+IGZ1bmN0aW9uYWxpdHkgeW91J3JlIGp1c3QgaGFja2luZyBzb21ldGhpbmcgdG9n
ZXRoZXIgYmVjYXVzZSBpdCBpcyBzaW1wbGUgZm9yDQo+IHlvdS4NCj4gDQo+IEl0IG1pZ2h0IGJl
IHBvc3NpYmxlIHRvIGltcGxlbWVudCB0aGF0IGdlbmVyaWMgZm9yIERNQS1idWYgaGVhcHMgaWYN
Cj4gdWRtYWJ1ZiBhbGxvY2F0aW9uIG92ZXJoZWFkIGNhbid0IGJlIHJlZHVjZWQsIGJ1dCB0aGF0
IGlzIHRoZW4ganVzdCB0aGUNCj4gc2Vjb25kIHN0ZXAuDQpbd2FuZ3Rhb10gT24gZG1hYnVmOiAg
DQotIERNQUJVRiBsYWNrcyBEaXJlY3QgSS9PIHN1cHBvcnQsIGhlbmNlIG91ciBwcm9wb3NhbC4g
IA0KLSBtZW1mZCBzdXBwb3J0cyBEaXJlY3QgSS9PIGJ1dCBkb2VzbuKAmXQgZml0IG91ciB1c2Ug
Y2FzZS4gIA0KLSB1ZG1hYnVmIHZpYSBtZW1mZCB3b3JrcyBidXQgbmVlZHMgc3lzdGVtaWMgY2hh
bmdlcyAobG93IFJPSSkgYW5kIGhhcyBzbG93IGFsbG9jYXRpb24uICANCg0KWW91ciBvYmplY3Rp
b25zOiAgDQoxLiBBZGRpbmcgYW4gSU9DVEw/IFRoaXMgdGFyZ2V0cyBkbWFidWYgc3BlY2lmaWNh
bGx5LCBhbmQgb3VyIGZpeCBpcyBzaW1wbGUuICANCiAgIHNlbmRmaWxlIGRvZXNu4oCZdCByZXNv
bHZlIGl0Lg0KMi4gQWNjZXNzaW5nIHNndGFibGUgcGFnZXMgaW4gdGhlIGV4cG9ydGVyPyBBcyB0
aGUgZG1hYnVmIGNyZWF0b3IsIHRoZSBleHBvcnRlciAgDQogICBmdWxseSBjb250cm9scyBzZ3Rh
YmxlL3BhZ2UgZGF0YS4gV2UgY2FuIHJlc3RyaWN0IGFjY2VzcyB0byBjYXNlcyB3aXRoIG5vICAN
CiAgIGV4dGVybmFsIHVzZXJzLg0KDQpDb3VsZCB5b3UgY2xhcmlmeSB3aGljaCBwb2ludCB5b3Ug
b3Bwb3NlPw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo=
