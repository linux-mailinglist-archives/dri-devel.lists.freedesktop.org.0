Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A68B0AAD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 10:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0616EC72;
	Thu, 12 Sep 2019 08:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB546EC72
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 08:52:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DD24308212D;
 Thu, 12 Sep 2019 08:52:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BACCF60852;
 Thu, 12 Sep 2019 08:52:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0879116E05; Thu, 12 Sep 2019 10:52:21 +0200 (CEST)
Date: Thu, 12 Sep 2019 10:52:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] drm/mgag200: Rename constant MGAREG_Status to
 MGAREG_STATUS
Message-ID: <20190912085220.mjuweujrhr6hponr@sirius.home.kraxel.org>
References: <20190912064230.27972-1-tzimmermann@suse.de>
 <20190912064230.27972-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912064230.27972-3-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 12 Sep 2019 08:52:22 +0000 (UTC)
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDg6NDI6MjlBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gUmVnaXN0ZXIgY29uc3RhbnRzIGFyZSB1cHBlciBjYXNlLiBGaXggTUdBUkVH
X1N0YXR1cyBhY2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KClJldmlld2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jIHwgNiArKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9yZWcu
aCAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21v
ZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCj4gaW5kZXggNWU3
NzhiNWYxYTEwLi4zMDJiYTQwZWIwMzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX21vZGUuYwo+IEBAIC03OSwxMiArNzksMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIG1nYV93
YWl0X3ZzeW5jKHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KQo+ICAJdW5zaWduZWQgaW50IHN0YXR1
cyA9IDA7Cj4gIAo+ICAJZG8gewo+IC0JCXN0YXR1cyA9IFJSRUczMihNR0FSRUdfU3RhdHVzKTsK
PiArCQlzdGF0dXMgPSBSUkVHMzIoTUdBUkVHX1NUQVRVUyk7Cj4gIAl9IHdoaWxlICgoc3RhdHVz
ICYgMHgwOCkgJiYgdGltZV9iZWZvcmUoamlmZmllcywgdGltZW91dCkpOwo+ICAJdGltZW91dCA9
IGppZmZpZXMgKyBIWi8xMDsKPiAgCXN0YXR1cyA9IDA7Cj4gIAlkbyB7Cj4gLQkJc3RhdHVzID0g
UlJFRzMyKE1HQVJFR19TdGF0dXMpOwo+ICsJCXN0YXR1cyA9IFJSRUczMihNR0FSRUdfU1RBVFVT
KTsKPiAgCX0gd2hpbGUgKCEoc3RhdHVzICYgMHgwOCkgJiYgdGltZV9iZWZvcmUoamlmZmllcywg
dGltZW91dCkpOwo+ICB9Cj4gIAo+IEBAIC05Myw3ICs5Myw3IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBtZ2Ffd2FpdF9idXN5KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KQo+ICAJdW5zaWduZWQgbG9u
ZyB0aW1lb3V0ID0gamlmZmllcyArIEhaOwo+ICAJdW5zaWduZWQgaW50IHN0YXR1cyA9IDA7Cj4g
IAlkbyB7Cj4gLQkJc3RhdHVzID0gUlJFRzgoTUdBUkVHX1N0YXR1cyArIDIpOwo+ICsJCXN0YXR1
cyA9IFJSRUc4KE1HQVJFR19TVEFUVVMgKyAyKTsKPiAgCX0gd2hpbGUgKChzdGF0dXMgJiAweDAx
KSAmJiB0aW1lX2JlZm9yZShqaWZmaWVzLCB0aW1lb3V0KSk7Cj4gIH0KPiAgCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmggYi9kcml2ZXJzL2dwdS9k
cm0vbWdhZzIwMC9tZ2FnMjAwX3JlZy5oCj4gaW5kZXggYzA5NmE5ZDZiY2JjLi42YzQ2MGQ5YTIx
NDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9yZWcuaAo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfcmVnLmgKPiBAQCAtMTAxLDcg
KzEwMSw3IEBACj4gICNkZWZpbmUgTUdBUkVHX0VYRUMJCTB4MDEwMAo+ICAKPiAgI2RlZmluZQlN
R0FSRUdfRklGT1NUQVRVUwkweDFlMTAKPiAtI2RlZmluZQlNR0FSRUdfU3RhdHVzCQkweDFlMTQK
PiArI2RlZmluZQlNR0FSRUdfU1RBVFVTCQkweDFlMTQKPiAgI2RlZmluZSBNR0FSRUdfQ0FDSEVG
TFVTSCAgICAgICAweDFmZmYKPiAgI2RlZmluZQlNR0FSRUdfSUNMRUFSCQkweDFlMTgKPiAgI2Rl
ZmluZQlNR0FSRUdfSUVOCQkweDFlMWMKPiAtLSAKPiAyLjIzLjAKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
