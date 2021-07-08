Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A36C3BF9E0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C4F6E8B9;
	Thu,  8 Jul 2021 12:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04F26E8B9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:10:28 +0000 (UTC)
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GLFB80yrzz6H8xQ;
 Thu,  8 Jul 2021 19:56:16 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 14:10:25 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2176.012;
 Thu, 8 Jul 2021 14:10:25 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/qxl: add NULL check for bo->resource
Thread-Topic: [PATCH] drm/qxl: add NULL check for bo->resource
Thread-Index: AQHXc+8Ca07buSFVIkqEd5aLMx9r/as4+/BQ
Date: Thu, 8 Jul 2021 12:10:25 +0000
Message-ID: <9aae31dac09b4430918f39b9c5d79c27@huawei.com>
References: <20210708114710.8186-1-christian.koenig@amd.com>
In-Reply-To: <20210708114710.8186-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.98.153]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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

PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIFttYWlsdG86Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBn
bWFpbC5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDgsIDIwMjEgMTo0NyBQTQ0KPiBXaGVu
IGFsbG9jYXRpb25zIGZhaWxzIHRoYXQgY2FuIGJlIE5VTEwgbm93Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBSZXBv
cnRlZC1ieTogRGFuaWVsIEJyaXN0b3QgZGUgT2xpdmVpcmEgPGJyaXN0b3RAa2VybmVsLm9yZz4N
Cj4gVGVzdGVkLWJ5OiBEYW5pZWwgQnJpc3RvdCBkZSBPbGl2ZWlyYSA8YnJpc3RvdEBrZXJuZWwu
b3JnPg0KDQpIaSBDaHJpc3RpYW4NCg0KdGhhbmtzLCBpdCB3b3JrZWQuDQoNClRlc3RlZC1ieTog
Um9iZXJ0byBTYXNzdSA8cm9iZXJ0by5zYXNzdUBodWF3ZWkuY29tPg0KDQpSb2JlcnRvDQoNCkhV
QVdFSSBURUNITk9MT0dJRVMgRHVlc3NlbGRvcmYgR21iSCwgSFJCIDU2MDYzDQpNYW5hZ2luZyBE
aXJlY3RvcjogTGkgUGVuZywgTGkgSmlhbiwgU2hpIFlhbmxpDQoNCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF90dG0uYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMNCj4gaW5kZXgg
MTlmZDM5ZDlhMDBjLi4zN2ExYjZhNmFkNmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX3R0bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jDQo+
IEBAIC0xMjcsNyArMTI3LDcgQEAgc3RhdGljIHZvaWQgcXhsX2JvX21vdmVfbm90aWZ5KHN0cnVj
dA0KPiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+ICAJc3RydWN0IHF4bF9ibyAqcWJvOw0KPiAg
CXN0cnVjdCBxeGxfZGV2aWNlICpxZGV2Ow0KPiANCj4gLQlpZiAoIXF4bF90dG1fYm9faXNfcXhs
X2JvKGJvKSkNCj4gKwlpZiAoIXF4bF90dG1fYm9faXNfcXhsX2JvKGJvKSB8fCAhYm8tPnJlc291
cmNlKQ0KPiAgCQlyZXR1cm47DQo+ICAJcWJvID0gdG9fcXhsX2JvKGJvKTsNCj4gIAlxZGV2ID0g
dG9fcXhsKHFiby0+dGJvLmJhc2UuZGV2KTsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
