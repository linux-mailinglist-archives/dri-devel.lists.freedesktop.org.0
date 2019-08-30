Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C9A3B83
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 18:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E4D6E366;
	Fri, 30 Aug 2019 16:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D6E6E36D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 16:07:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 09:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; d="scan'208";a="175652042"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2019 09:07:28 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 30 Aug 2019 09:07:27 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.191]) by
 fmsmsx162.amr.corp.intel.com ([169.254.5.238]) with mapi id 14.03.0439.000;
 Fri, 30 Aug 2019 09:07:27 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH 2/9] dma-buf: make to_dma_fence_array NULL safe
Thread-Topic: [PATCH 2/9] dma-buf: make to_dma_fence_array NULL safe
Thread-Index: AQHVXB6k84SDbmKUDU2mbZRlFg1S3KcT4TCQ
Date: Fri, 30 Aug 2019 16:07:27 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663D3D993F4@FMSMSX108.amr.corp.intel.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
 <20190826145731.1725-3-christian.koenig@amd.com>
In-Reply-To: <20190826145731.1725-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzM4N2QxNTgtNzU5My00NDQ1LWJlZWYtMjZhMmQ1YmI4MTE3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieFJGZkxMV3Z2QWRGRTFOOXVtZkdmeFwveGoranRiOXB6UUFqcWZ0ZEplT3dlZEJnanRNWUl3bExXczg5YXZNSUkifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIFttYWlsdG86ZHJp
LWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYNCj5PZiBDaHJp
c3RpYW4gS8O2bmlnDQo+U2VudDogTW9uZGF5LCBBdWd1c3QgMjYsIDIwMTkgMTA6NTcgQU0NCj5U
bzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgY2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrOw0KPmRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g7IHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnOyBs
aW51eC0NCj5tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJv
Lm9yZw0KPlN1YmplY3Q6IFtQQVRDSCAyLzldIGRtYS1idWY6IG1ha2UgdG9fZG1hX2ZlbmNlX2Fy
cmF5IE5VTEwgc2FmZQ0KPg0KPkEgYml0IHN1cnByaXNpbmcgdGhhdCB0aGlzIHdhc24ndCBhbHJl
YWR5IHRoZSBjYXNlLg0KPg0KPlNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4tLS0NCj4gaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJy
YXkuaCB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmggYi9p
bmNsdWRlL2xpbnV4L2RtYS1mZW5jZS0NCj5hcnJheS5oDQo+aW5kZXggMzAzZGQ3MTIyMjBmLi5m
OTljZDdlYjI0ZTAgMTAwNjQ0DQo+LS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXku
aA0KPisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmgNCj5AQCAtNjgsNyArNjgs
NyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZG1hX2ZlbmNlX2lzX2FycmF5KHN0cnVjdCBkbWFfZmVu
Y2UNCj4qZmVuY2UpDQo+IHN0YXRpYyBpbmxpbmUgc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqDQo+
IHRvX2RtYV9mZW5jZV9hcnJheShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4gew0KPi0JaWYg
KGZlbmNlLT5vcHMgIT0gJmRtYV9mZW5jZV9hcnJheV9vcHMpDQo+KwlpZiAoIWZlbmNlIHx8IGZl
bmNlLT5vcHMgIT0gJmRtYV9mZW5jZV9hcnJheV9vcHMpDQo+IAkJcmV0dXJuIE5VTEw7DQo+DQo+
IAlyZXR1cm4gY29udGFpbmVyX29mKGZlbmNlLCBzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5LCBiYXNl
KTsNCg0KSXQgbG9va3MgbGlrZSBkbWFfZmVuY2VfaXNfYXJyYXkoKSBoYXMgdGhlIHNhbWUgaXNz
dWUuDQoNCklzIGl0IHdvcnRoIGZpeGluZz8NCg0KTWlrZQ0KDQoNCj4tLQ0KPjIuMTcuMQ0KPg0K
Pl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ZHJpLWRl
dmVsIG1haWxpbmcgbGlzdA0KPmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5odHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
