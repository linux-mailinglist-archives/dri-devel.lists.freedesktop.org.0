Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484B1AE08F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE996EC2B;
	Fri, 17 Apr 2020 15:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BEC6EC2B;
 Fri, 17 Apr 2020 15:09:11 +0000 (UTC)
IronPort-SDR: ODZsE45/0R3+glPC/575sXiKgtIgwcUzxVzelKH97HQqFYOVn07jWFKCEMRmTgoyBj8O1/dT8I
 isuNXd/7loDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 08:09:10 -0700
IronPort-SDR: YV943VN4RvRxwBNaGd+i15CfuxNjgsjHwOTuzqFXqc7dooescyJYtN1j4vYcqXndYfhUMYBvfw
 fIs83Fc4pdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="257604714"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga006.jf.intel.com with ESMTP; 17 Apr 2020 08:09:03 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 17 Apr 2020 08:08:59 -0700
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 17 Apr 2020 08:08:58 -0700
Received: from bgsmsx101.gar.corp.intel.com ([169.254.1.75]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.253]) with mapi id 14.03.0439.000;
 Fri, 17 Apr 2020 20:38:55 +0530
From: "Kadiyala, Kishore" <kishore.kadiyala@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm: Fix page flip ioctl format check
Thread-Topic: [PATCH] drm: Fix page flip ioctl format check
Thread-Index: AQHWFMIEBaXQSCfpE0WBXKPpmYNWoah9aHEw
Date: Fri, 17 Apr 2020 15:08:55 +0000
Message-ID: <92C2E46C14A43E4BBF8F51564D4E955658821087@BGSMSX101.gar.corp.intel.com>
References: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200416170420.23657-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZQ0K
PiBTeXJqYWxhDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxNiwgMjAyMCAxMDozNCBQTQ0KPiBU
bzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPjsgc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFU
Q0hdIGRybTogRml4IHBhZ2UgZmxpcCBpb2N0bCBmb3JtYXQgY2hlY2sNCj4gDQo+IEZyb206IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBSZXZl
cnQgYmFjayB0byBjb21wYXJpbmcgZmItPmZvcm1hdC0+Zm9ybWF0IGluc3RlYWQgZmItPmZvcm1h
dCBmb3IgdGhlDQo+IHBhZ2UgZmxpcCBpb2N0bC4gVGhpcyBjaGVjayB3YXMgb3JpZ2luYWxseSBv
bmx5IGhlcmUgdG8gZGlzYWxsb3cgcGl4ZWwgZm9ybWF0DQo+IGNoYW5nZXMsIGJ1dCB3aGVuIHdl
IGNoYW5nZWQgaXQgdG8gZG8gdGhlIHBvaW50ZXIgY29tcGFyaXNvbiB3ZQ0KPiBwb3RlbnRpYWxs
eSBzdGFydGVkIHRvIHJlamVjdCBzb21lIChidXQgZGVmaW5pdGVseSBub3QgYWxsKSBtb2RpZmll
ciBjaGFuZ2VzIGFzDQo+IHdlbGwuIEluIGZhY3QgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIGRlcGVu
ZHMgb24gd2hldGhlciB0aGUgZHJpdmVyIG92ZXJyaWRlcw0KPiB0aGUgZm9ybWF0IGluZm8gZm9y
IGEgc3BlY2lmaWMgZm9ybWF0K21vZGlmaWVyIGNvbWJvLg0KPiBFZy4gb24gaTkxNSB0aGlzIG5v
dyByZWplY3RzIGNvbXByZXNzaW9uIHZzLiBubyBjb21wcmVzc2lvbiBjaGFuZ2VzIGJ1dA0KPiBk
b2VzIG5vdCByZWplY3QgYW55IG90aGVyIHRpbGluZyBjaGFuZ2VzLiBUaGF0J3MganVzdCBpbmNv
bnNpc3RlbnQgbm9uc2Vuc2UuDQo+IA0KPiBUaGUgbWFpbiByZWFzb24gd2UgaGF2ZSB0byBnbyBi
YWNrIHRvIHRoZSBvbGQgYmVoYXZpb3VyIGlzIHRvIGZpeCBwYWdlDQo+IGZsaXBwaW5nIHdpdGgg
WG9yZy4gQXQgc29tZSBwb2ludCBYb3JnIGdvdCBpdHMgYXRvbWljIHJpZ2h0cyB0YWtlbiBhd2F5
IGFuZA0KPiBzaW5jZSB0aGVuIHdlIGNhbid0IHBhZ2UgZmxpcCBiZXR3ZWVuIGNvbXByZXNzZWQg
YW5kIG5vbi1jb21wcmVzc2VkIGZicw0KPiBvbiBpOTE1LiBDdXJyZW50bHkgd2UgZ2V0IG5vIHBh
Z2UgZmxpcHBpbmcgZm9yIGFueSBnYW1lcyBwcmV0dHkgbXVjaCBzaW5jZQ0KPiBNZXNhIGxpa2Vz
IHRvIHVzZSBjb21wcmVzc2VkIGJ1ZmZlcnMuIE5vdCBzdXJlIGhvdyBjb21wb3NpdG9ycyBhcmUN
Cj4gd29ya2luZyBhcm91bmQgdGhpcyAoZG9uJ3QgdXNlIG9uZSBteXNlbGYpLiBJIGd1ZXNzIHRo
ZXkgbXVzdCBiZSBkb2luZw0KPiBzb21ldGhpbmcgdG8gZ2V0IG5vbi1jb21wcmVzc2VkIGJ1ZmZl
cnMgaW5zdGVhZC4gRWl0aGVyIHRoYXQgb3Igc29tZWhvdw0KPiBubyBvbmUgbm90aWNlZCB0aGUg
dGVhcmluZyBmcm9tIHRoZSBibGl0IGZhbGxiYWNrLg0KPiANCj4gTG9va2luZyBiYWNrIGF0IHRo
ZSBvcmlnaW5hbCBkaXNjdXNzaW9uIG9uIHRoaXMgY2hhbmdlIHdlIHByZXR0eSBtdWNoIGp1c3QN
Cj4gZGlkIGl0IGluIHRoZSBuYW1lIG9mIHNraXBwaW5nIGEgZmV3IGV4dHJhIHBvaW50ZXIgZGVy
ZWZlcmVuY2VzLg0KPiBIb3dldmVyLCBJJ3ZlIGRlY2lkZWQgbm90IHRvIHJldmVydCB0aGUgd2hv
bGUgdGhpbmcgaW4gY2FzZSBzb21lb25lIGhhcw0KPiBzaW5jZSBzdGFydGVkIHRvIGRlcGVuZCBv
biB0aGVzZSBjaGFuZ2VzLiBOb25lIG9mIHRoZSBvdGhlciBjaGVja3MgYXJlDQo+IHJlbGV2YW50
IGZvciBpOTE1IGFueXdheXMuDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBD
YzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0K
PiBGaXhlczogZGJkNGQ1NzYxZTFmICgiZHJtOiBSZXBsYWNlICdmb3JtYXQtPmZvcm1hdCcgY29t
cGFyaXNvbnMgdG8ganVzdA0KPiAnZm9ybWF0JyBjb21wYXJpc29ucyIpDQo+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQoNCkkn
dmUgdmFsaWRhdGVkIHRoaXMgcGF0Y2ggb24gVWJ1bnR1MTkxMCAoaGF2aW5nIFggU2VydmVyIHYx
LjIwLjUgKSB3aXRoIGNvbXByZXNzaW9uIGVuYWJsZWQgLg0KRmVlbCBmcmVlIHRvIGFkZCBteSBB
Y2tlZC1ieS8gVGVzdGVkLWJ5OiBLaXNob3JlIEthZGl5YWxhIDxraXNob3JlLmthZGl5YWxhQGlu
dGVsLmNvbT4NCg0KUmVnYXJkcywNCktpc2hvcmUNCiANCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3BsYW5lLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Bs
YW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gaW5kZXggZDZhZDYwYWIwZDM4
Li5mMmNhNTMxNWYyM2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gQEAgLTExNTMsNyArMTE1
Myw3IEBAIGludCBkcm1fbW9kZV9wYWdlX2ZsaXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UNCj4g
KmRldiwNCj4gIAlpZiAocmV0KQ0KPiAgCQlnb3RvIG91dDsNCj4gDQo+IC0JaWYgKG9sZF9mYi0+
Zm9ybWF0ICE9IGZiLT5mb3JtYXQpIHsNCj4gKwlpZiAob2xkX2ZiLT5mb3JtYXQtPmZvcm1hdCAh
PSBmYi0+Zm9ybWF0LT5mb3JtYXQpIHsNCj4gIAkJRFJNX0RFQlVHX0tNUygiUGFnZSBmbGlwIGlz
IG5vdCBhbGxvd2VkIHRvIGNoYW5nZSBmcmFtZQ0KPiBidWZmZXIgZm9ybWF0LlxuIik7DQo+ICAJ
CXJldCA9IC1FSU5WQUw7DQo+ICAJCWdvdG8gb3V0Ow0KPiAtLQ0KPiAyLjI0LjENCj4gDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
