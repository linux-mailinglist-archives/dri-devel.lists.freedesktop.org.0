Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9A20B77A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 19:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845C96E3EF;
	Fri, 26 Jun 2020 17:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A126E3EF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 17:44:09 +0000 (UTC)
IronPort-SDR: JgZNzLHZCYceQJT8Dddk6FXjDhHa/86j2F7kHTbIh9y0kiHb/L+op38Z+JWCh5kcf8aotM1IY6
 JEei9COYHt4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9664"; a="142919396"
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="142919396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 10:44:09 -0700
IronPort-SDR: EtCg0XoBpsReuVKqfWEYWgE0x0WlT5HFm/ODFB3cKJWtU17OX7XKJosK3OgKup+shLhdwZR/Az
 GB9AoeBiq/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="302402227"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jun 2020 10:44:08 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 26 Jun 2020 10:44:05 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.193]) by
 FMSMSX109.amr.corp.intel.com ([169.254.15.60]) with mapi id 14.03.0439.000;
 Fri, 26 Jun 2020 10:44:05 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/ttm: make TT creation purely optional
Thread-Topic: [PATCH 2/2] drm/ttm: make TT creation purely optional
Thread-Index: AQHWSix3F23ZR5pk2keAuAmM0FFwzqjrLfAw
Date: Fri, 26 Jun 2020 17:43:56 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E866301154CA0FA@FMSMSX108.amr.corp.intel.com>
References: <20200624133558.1758-1-christian.koenig@amd.com>
 <20200624133558.1758-2-christian.koenig@amd.com>
In-Reply-To: <20200624133558.1758-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBXZWRuZXNkYXksIEp1bmUgMjQsIDIwMjAgOTozNiBBTQ0KPlRvOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogW1BBVENIIDIvMl0gZHJtL3R0
bTogbWFrZSBUVCBjcmVhdGlvbiBwdXJlbHkgb3B0aW9uYWwNCj4NCj5XZSBvbmx5IG5lZWQgdGhl
IHBhZ2UgYXJyYXkgd2hlbiB0aGUgQk8gaXMgYWJvdXQgdG8gYmUgYWNjZXNzZWQuDQo+DQo+U28g
bm90IG9ubHkgcG9wdWxhdGUsIGJ1dCBhbHNvIGNyZWF0ZSBpdCBvbiBkZW1hbmQuDQo+DQo+U2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0K
Pi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgfCAyNiArKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAg
OSArKysrKysrLS0NCj4gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgIHwgIDUgKysr
KysNCj4gMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkN
Cj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMNCj5pbmRleCAxNWY5YjE5ZmEwMGQuLjBlMGE5ZGFkZjNlZCAx
MDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+KysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPkBAIC02NjcsMTMgKzY2Nyw4IEBAIHN0YXRpYyBpbnQg
dHRtX2JvX2V2aWN0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+IAlwbGFjZW1lbnQu
bnVtX2J1c3lfcGxhY2VtZW50ID0gMDsNCj4gCWJkZXYtPmRyaXZlci0+ZXZpY3RfZmxhZ3MoYm8s
ICZwbGFjZW1lbnQpOw0KPg0KPi0JaWYgKCFwbGFjZW1lbnQubnVtX3BsYWNlbWVudCAmJg0KPiFw
bGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50KSB7DQo+LQkJcmV0ID0gdHRtX2JvX3BpcGVsaW5l
X2d1dHRpbmcoYm8pOw0KPi0JCWlmIChyZXQpDQo+LQkJCXJldHVybiByZXQ7DQo+LQ0KPi0JCXJl
dHVybiB0dG1fdHRfY3JlYXRlKGJvLCBmYWxzZSk7DQo+LQl9DQo+KwlpZiAoIXBsYWNlbWVudC5u
dW1fcGxhY2VtZW50ICYmDQo+IXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1lbnQpDQo+KwkJcmV0
dXJuIHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsNCj4NCj4gCWV2aWN0X21lbSA9IGJvLT5t
ZW07DQo+IAlldmljdF9tZW0ubW1fbm9kZSA9IE5VTEw7DQo+QEAgLTEyMDAsMTMgKzExOTUsOCBA
QCBpbnQgdHRtX2JvX3ZhbGlkYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+IAkv
Kg0KPiAJICogUmVtb3ZlIHRoZSBiYWNraW5nIHN0b3JlIGlmIG5vIHBsYWNlbWVudCBpcyBnaXZl
bi4NCj4gCSAqLw0KPi0JaWYgKCFwbGFjZW1lbnQtPm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVu
dC0NCj4+bnVtX2J1c3lfcGxhY2VtZW50KSB7DQo+LQkJcmV0ID0gdHRtX2JvX3BpcGVsaW5lX2d1
dHRpbmcoYm8pOw0KPi0JCWlmIChyZXQpDQo+LQkJCXJldHVybiByZXQ7DQo+LQ0KPi0JCXJldHVy
biB0dG1fdHRfY3JlYXRlKGJvLCBmYWxzZSk7DQo+LQl9DQo+KwlpZiAoIXBsYWNlbWVudC0+bnVt
X3BsYWNlbWVudCAmJiAhcGxhY2VtZW50LQ0KPj5udW1fYnVzeV9wbGFjZW1lbnQpDQo+KwkJcmV0
dXJuIHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsNCj4NCj4gCS8qDQo+IAkgKiBDaGVjayB3
aGV0aGVyIHdlIG5lZWQgdG8gbW92ZSBidWZmZXIuDQo+QEAgLTEyMjMsMTQgKzEyMTMsNiBAQCBp
bnQgdHRtX2JvX3ZhbGlkYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+IAkJdHRt
X2ZsYWdfbWFza2VkKCZiby0+bWVtLnBsYWNlbWVudCwgbmV3X2ZsYWdzLA0KPiAJCQkJflRUTV9Q
TF9NQVNLX01FTVRZUEUpOw0KPiAJfQ0KPi0JLyoNCj4tCSAqIFdlIG1pZ2h0IG5lZWQgdG8gYWRk
IGEgVFRNLg0KPi0JICovDQo+LQlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVN
ICYmIGJvLT50dG0gPT0gTlVMTCkgew0KPi0JCXJldCA9IHR0bV90dF9jcmVhdGUoYm8sIHRydWUp
Ow0KPi0JCWlmIChyZXQpDQo+LQkJCXJldHVybiByZXQ7DQo+LQl9DQo+IAlyZXR1cm4gMDsNCj4g
fQ0KPiBFWFBPUlRfU1lNQk9MKHR0bV9ib192YWxpZGF0ZSk7DQo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYw0KPmIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jDQo+aW5kZXggNTJkMmI3MWYxNTg4Li5mODQxNGY4MjAzNTAgMTAwNjQ0DQo+LS0t
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+KysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+QEAgLTU4MCwxMiArNTgwLDE3IEBAIHN0YXRpYyBpbnQg
dHRtX2JvX2ttYXBfdHRtKHN0cnVjdA0KPnR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4gCQkuaW50
ZXJydXB0aWJsZSA9IGZhbHNlLA0KPiAJCS5ub193YWl0X2dwdSA9IGZhbHNlDQo+IAl9Ow0KPi0J
c3RydWN0IHR0bV90dCAqdHRtID0gYm8tPnR0bTsNCj4rCXN0cnVjdCB0dG1fdHQgKnR0bTsNCj4g
CXBncHJvdF90IHByb3Q7DQo+IAlpbnQgcmV0Ow0KPg0KPi0JQlVHX09OKCF0dG0pOw0KPisJaWYg
KCFiby0+dHRtKSB7DQo+KwkJcmV0ID0gdHRtX3R0X2NyZWF0ZShibywgdHJ1ZSk7DQoNCldvdWxk
IGl0IGJlIHJlYXNvbmFibGUgdG8gbW92ZSB0aGUgTlVMTCBjaGVjayBpbnRvIHR0bV90dF9jcmVh
dGUoKT8NCg0KS2luZCBvZiBhbiBvcHBvc2l0ZSBwYXRoIE5VTEwgY2hlY2ssIGJ1dCBpdCBtYWtl
cyB0aGUgcGF0aCBhIGxpdHRsZQ0KbW9yZSBjbGVhbi4NCg0KTWlrZQ0KDQo+KwkJaWYgKHJldCkN
Cj4rCQkJcmV0dXJuIHJldDsNCj4rCX0NCj4NCj4rCXR0bSA9IGJvLT50dG07DQo+IAlyZXQgPSB0
dG1fdHRfcG9wdWxhdGUodHRtLCAmY3R4KTsNCj4gCWlmIChyZXQpDQo+IAkJcmV0dXJuIHJldDsN
Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPmIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPmluZGV4IDBhZDMwYjExMjk4Mi4uYmRmZWQ2NzI1
ZDZmIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4rKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jDQo+QEAgLTM0OSw2ICszNDksMTEgQEAg
dm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0DQo+dm1fZmF1bHQgKnZt
ZiwNCj4NCj4gCQl9Ow0KPg0KPisJCWlmICghYm8tPnR0bSAmJiB0dG1fdHRfY3JlYXRlKGJvLCB0
cnVlKSkgew0KPisJCQlyZXQgPSBWTV9GQVVMVF9PT007DQo+KwkJCWdvdG8gb3V0X2lvX3VubG9j
azsNCj4rCQl9DQo+Kw0KPiAJCXR0bSA9IGJvLT50dG07DQo+IAkJaWYgKHR0bV90dF9wb3B1bGF0
ZShiby0+dHRtLCAmY3R4KSkgew0KPiAJCQlyZXQgPSBWTV9GQVVMVF9PT007DQo+LS0NCj4yLjE3
LjENCj4NCj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
