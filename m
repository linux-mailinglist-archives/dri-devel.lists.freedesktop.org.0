Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8534A30
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155CB892EF;
	Tue,  4 Jun 2019 14:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98D94892EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 14:20:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73C1B341;
 Tue,  4 Jun 2019 07:20:48 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43D303F690;
 Tue,  4 Jun 2019 07:20:48 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 9C49868256F; Tue,  4 Jun 2019 15:20:46 +0100 (BST)
Date: Tue, 4 Jun 2019 15:20:46 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] drm/arm/hdlcd: Actually validate CRTC modes
Message-ID: <20190604142046.GM15316@e110455-lin.cambridge.arm.com>
References: <9db0bac184d9fa69c4f65bf954ab59b53d431e15.1558111042.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9db0bac184d9fa69c4f65bf954ab59b53d431e15.1558111042.git.robin.murphy@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDU6Mzc6MjFQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IFJhdGhlciB0aGFuIGFsbG93aW5nIGFueSBvbGQgbW9kZSB0aHJvdWdoLCB0aGVuIHN1
YnNlcXVlbnRseSByZWZ1c2luZwo+IHVubWF0Y2hhYmxlIGNsb2NrIHJhdGVzIGluIGF0b21pY19j
aGVjayB3aGVuIGl0J3MgdG9vIGxhdGUgdG8gYmFjayBvdXQKPiBhbmQgcGljayBhIGRpZmZlcmVu
dCBtb2RlLCBsZXQncyBkbyB0aGF0IHZhbGlkYXRpb24gdXAtZnJvbnQgd2hlcmUgaXQKPiB3aWxs
IGNhdXNlIHVuc3VwcG9ydGVkIG1vZGVzIHRvIGJlIGNvcnJlY3RseSBwcnVuZWQgaW4gdGhlIGZp
cnN0IHBsYWNlLgo+IAo+IFRoaXMgYWxzbyBlbGltaW5hdGVzIGFuIGlzc3VlIHdoZXJlYnkgYSBw
ZXJjZWl2ZWQgY2xvY2sgcmF0ZSBvZiAwIHdvdWxkCj4gY2F1c2UgYXRvbWljIGRpc2FibGUgdG8g
ZmFpbCBhbmQgcHJldmVudCB0aGUgbW9kdWxlIGZyb20gYmVpbmcgdW5sb2FkZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KCkFja2VkLWJ5
OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KClRoYW5rcyBmb3IgdGhlIHBhdGNo
IQoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAKPiBUaGlzIHN1cGVyc2VkZXMgbXkgcHJl
dmlvdXMgcGF0Y2ggaGVyZToKPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvMjg4NTUzLwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYyB8IDEx
ICsrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0Yy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMKPiBpbmRleCAwYjJiNjJmOGZhM2Mu
LmVjYWM2ZmUwYjIxMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Ny
dGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0Yy5jCj4gQEAgLTE4Niwy
MCArMTg2LDE5IEBAIHN0YXRpYyB2b2lkIGhkbGNkX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0
IGRybV9jcnRjICpjcnRjLAo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkbGNkLT5jbGspOwo+
ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGhkbGNkX2NydGNfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKPiAtCQkJCSAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUpCj4gK3N0
YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBoZGxjZF9jcnRjX21vZGVfdmFsaWQoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAo+ICsJCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+
ICB7Cj4gIAlzdHJ1Y3QgaGRsY2RfZHJtX3ByaXZhdGUgKmhkbGNkID0gY3J0Y190b19oZGxjZF9w
cml2KGNydGMpOwo+IC0Jc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUgPSAmc3RhdGUtPmFk
anVzdGVkX21vZGU7Cj4gIAlsb25nIHJhdGUsIGNsa19yYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAw
Owo+ICAKPiAgCXJhdGUgPSBjbGtfcm91bmRfcmF0ZShoZGxjZC0+Y2xrLCBjbGtfcmF0ZSk7Cj4g
IAlpZiAocmF0ZSAhPSBjbGtfcmF0ZSkgewo+ICAJCS8qIGNsb2NrIHJlcXVpcmVkIGJ5IG1vZGUg
bm90IHN1cHBvcnRlZCBieSBoYXJkd2FyZSAqLwo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJCXJl
dHVybiBNT0RFX05PQ0xPQ0s7Cj4gIAl9Cj4gIAo+IC0JcmV0dXJuIDA7Cj4gKwlyZXR1cm4gTU9E
RV9PSzsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgaGRsY2RfY3J0Y19hdG9taWNfYmVnaW4oc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+IEBAIC0yMjAsNyArMjE5LDcgQEAgc3RhdGljIHZvaWQgaGRs
Y2RfY3J0Y19hdG9taWNfYmVnaW4oc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICB9Cj4gIAo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyBoZGxjZF9jcnRjX2hlbHBl
cl9mdW5jcyA9IHsKPiAtCS5hdG9taWNfY2hlY2sJPSBoZGxjZF9jcnRjX2F0b21pY19jaGVjaywK
PiArCS5tb2RlX3ZhbGlkCT0gaGRsY2RfY3J0Y19tb2RlX3ZhbGlkLAo+ICAJLmF0b21pY19iZWdp
bgk9IGhkbGNkX2NydGNfYXRvbWljX2JlZ2luLAo+ICAJLmF0b21pY19lbmFibGUJPSBoZGxjZF9j
cnRjX2F0b21pY19lbmFibGUsCj4gIAkuYXRvbWljX2Rpc2FibGUJPSBoZGxjZF9jcnRjX2F0b21p
Y19kaXNhYmxlLAo+IC0tIAo+IDIuMjEuMC5kaXJ0eQo+IAoKLS0gCj09PT09PT09PT09PT09PT09
PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3Jl
IG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0t
LS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
