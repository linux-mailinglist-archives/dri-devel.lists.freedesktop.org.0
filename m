Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21830A9AC6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 08:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7318089D43;
	Thu,  5 Sep 2019 06:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9F89D3E;
 Thu,  5 Sep 2019 06:40:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 23:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="173840408"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by orsmga007.jf.intel.com with ESMTP; 04 Sep 2019 23:40:20 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
 IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 5 Sep 2019 07:40:19 +0100
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.187]) by
 irsmsx155.ger.corp.intel.com ([169.254.14.248]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 07:40:19 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 03/19] drm/i915: Remove pointless
 planes_changed=true assignment
Thread-Topic: [Intel-gfx] [PATCH 03/19] drm/i915: Remove pointless
 planes_changed=true assignment
Thread-Index: AQHVNYwtRvRuKk/6yE2+m5BsxqzV26cc7RkA
Date: Thu, 5 Sep 2019 06:40:18 +0000
Message-ID: <9ad2cb8f4521b677bbb8d6bc3b7df8e6c51cf2ef.camel@intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20190708125325.16576-4-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.89]
Content-ID: <3BDB380A9010074AAD5D00650F79DDC4@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTA4IGF0IDE1OjUzICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gaTkxNSBkb2Vzbid0IHVzZSB0aGUgY3J0Y19zdGF0ZS0+cGxhbmVfY2hhbmdlZCBmbGFn
IGZvciBhbnl0aGluZywNCj4gc28gc2V0dGluZyBpdCBpcyBwb2ludGxlc3MuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMg
fCA3IC0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jDQo+IGluZGV4IDkw
Y2ExMWE0YWU4OC4uOTU0ZDRhOTMwODY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYXRvbWljLmMNCj4gQEAgLTM3OCwxMyArMzc4LDYgQEAgaW50IGludGVs
X2F0b21pY19zZXR1cF9zY2FsZXJzKHN0cnVjdA0KPiBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJp
diwNCj4gIAkJCQkJCXBsYW5lLT5iYXNlLmlkKTsNCj4gIAkJCQkJcmV0dXJuIFBUUl9FUlIoc3Rh
dGUpOw0KPiAgCQkJCX0NCj4gLQ0KPiAtCQkJCS8qDQo+IC0JCQkJICogdGhlIHBsYW5lIGlzIGFk
ZGVkIGFmdGVyIHBsYW5lDQo+IGNoZWNrcyBhcmUgcnVuLA0KPiAtCQkJCSAqIGJ1dCBzaW5jZSB0
aGlzIHBsYW5lIGlzIHVuY2hhbmdlZA0KPiBqdXN0IGRvIHRoZQ0KPiAtCQkJCSAqIG1pbmltdW0g
cmVxdWlyZWQgdmFsaWRhdGlvbi4NCj4gLQkJCQkgKi8NCj4gLQkJCQljcnRjX3N0YXRlLT5iYXNl
LnBsYW5lc19jaGFuZ2VkID0gdHJ1ZTsNCj4gIAkJCX0NCj4gIA0KPiAgCQkJaW50ZWxfcGxhbmUg
PSB0b19pbnRlbF9wbGFuZShwbGFuZSk7DQoNCg0KUmV2aWV3ZWQtYnk6IFN0YW5pc2xhdiBMaXNv
dnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
