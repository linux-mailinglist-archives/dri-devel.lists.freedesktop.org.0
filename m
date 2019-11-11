Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E3F7814
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 16:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACAE6E934;
	Mon, 11 Nov 2019 15:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D56F6E934
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 15:53:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8C0631B;
 Mon, 11 Nov 2019 07:53:14 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A893F534;
 Mon, 11 Nov 2019 07:53:14 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 6FFB2682AC2; Mon, 11 Nov 2019 15:53:13 +0000 (GMT)
Date: Mon, 11 Nov 2019 15:53:13 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 5/5] drm/komeda: add rate limiting disable to
 err_verbosity
Message-ID: <20191111155313.iiz37se2f7526ehp@e110455-lin.cambridge.arm.com>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
 <20191107114155.54307-6-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107114155.54307-6-mihail.atanassov@arm.com>
User-Agent: NeoMutt/20180716
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTE6NDI6NDRBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBJdCdzIHBvc3NpYmxlIHRvIGdldCBtdWx0aXBsZSBldmVudHMgaW4gYSBzaW5n
bGUgZnJhbWUvZmxpcCwgc28gYWRkIGFuCj4gb3B0aW9uIHRvIHByaW50IHRoZW0gYWxsLgo+IAo+
IFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFt
ZXMucWlhbi53YW5nQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8
bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgoKRm9yIHRoZSB3aG9sZSBzZXJpZXM6CgpBY2tlZC1i
eTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1
Cgo+IC0tLQo+IAo+ICB2MjogQ2xlYW4gdXAgY29udGludWF0aW9uIGxpbmUgd2FybmluZyBmcm9t
IGNoZWNrcGF0Y2guCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oICAgfCAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2V2ZW50LmMgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmgKPiBpbmRleCBkOWZjOWM0ODg1OWEuLjE1ZjUyZTMwNGMwOCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5o
Cj4gQEAgLTIyNCw2ICsyMjQsOCBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7Cj4gICNkZWZpbmUgS09N
RURBX0RFVl9QUklOVF9JTkZPX0VWRU5UUyBCSVQoMikKPiAgCS8qIER1bXAgRFJNIHN0YXRlIG9u
IGFuIGVycm9yIG9yIHdhcm5pbmcgZXZlbnQuICovCj4gICNkZWZpbmUgS09NRURBX0RFVl9QUklO
VF9EVU1QX1NUQVRFX09OX0VWRU5UIEJJVCg4KQo+ICsJLyogRGlzYWJsZSByYXRlIGxpbWl0aW5n
IG9mIGV2ZW50IHByaW50cyAobm9ybWFsbHkgb25lIHBlciBjb21taXQpICovCj4gKyNkZWZpbmUg
S09NRURBX0RFVl9QUklOVF9ESVNBQkxFX1JBVEVMSU1JVCBCSVQoMTIpCj4gIH07Cj4gIAo+ICBz
dGF0aWMgaW5saW5lIGJvb2wKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2V2ZW50LmMKPiBpbmRleCA3ZmQ2MjQ3NjFhMmIuLmJmMjY5NjgzZjgxMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9l
dmVudC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZXZlbnQuYwo+IEBAIC0xMTksNyArMTE5LDcgQEAgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0
cnVjdCBrb21lZGFfZXZlbnRzICpldnRzLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJLyog
cmVkdWNlIHRoZSBzYW1lIG1zZyBwcmludCwgb25seSBwcmludCB0aGUgZmlyc3QgZXZ0IGZvciBv
bmUgZnJhbWUgKi8KPiAgCWlmIChldnRzLT5nbG9iYWwgfHwgaXNfbmV3X2ZyYW1lKGV2dHMpKQo+
ICAJCWVuX3ByaW50ID0gdHJ1ZTsKPiAtCWlmICghZW5fcHJpbnQpCj4gKwlpZiAoIShlcnJfdmVy
Ym9zaXR5ICYgS09NRURBX0RFVl9QUklOVF9ESVNBQkxFX1JBVEVMSU1JVCkgJiYgIWVuX3ByaW50
KQo+ICAJCXJldHVybjsKPiAgCj4gIAlpZiAoZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJ
TlRfRVJSX0VWRU5UUykKPiAtLSAKPiAyLjIzLjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09
PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBu
b3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0t
LS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
