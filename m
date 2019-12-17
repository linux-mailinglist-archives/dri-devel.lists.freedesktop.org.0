Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C90122DFA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6445B6E0E7;
	Tue, 17 Dec 2019 14:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9DB76E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:06:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EED61FB;
 Tue, 17 Dec 2019 06:06:53 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D2003F719;
 Tue, 17 Dec 2019 06:06:53 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 7AA3E682956; Tue, 17 Dec 2019 14:06:51 +0000 (GMT)
Date: Tue, 17 Dec 2019 14:06:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm/arm/mali: make malidp_mw_connector_helper_funcs static
Message-ID: <20191217140651.4xgr22hzpoj5sv44@e110455-lin.cambridge.arm.com>
References: <20191217115309.2133503-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217115309.2133503-1-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTE6NTM6MDlBTSArMDAwMCwgQmVuIERvb2tzIChDb2Rl
dGhpbmspIHdyb3RlOgo+IFRoZSBtYWxpZHBfbXdfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyBpcyBu
b3QgcmVmZXJlbmNlZCBieSBuYW1lCj4gb3V0c2lkZSBvZiB0aGUgZmlsZSBpdCBpcyBpbiwgc28g
bWFrZSBpdCBzdGF0aWMgdG8gYXZvaWQgdGhlCj4gZm9sbG93aW5nIHdhcm5pbmc6Cj4gCj4gZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYzo1OTo0MTogd2FybmluZzogc3ltYm9sICdtYWxp
ZHBfbXdfY29ubmVjdG9yX2hlbHBlcl9mdW5jcycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0
IGJlIHN0YXRpYz8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgKENvZGV0aGluaykgPGJl
bi5kb29rc0Bjb2RldGhpbmsuY28udWs+Cj4gLS0tCj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5k
dWRhdUBhcm0uY29tPgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29t
PgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiBDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3Rhcmtl
eUBhcm0uY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9tdy5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX213LmMKPiBpbmRleCA4NzVhM2E5ZWFiZmEuLjdkMGU3YjAzMWU0NCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9tdy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYwo+IEBAIC01Niw3ICs1Niw3IEBAIG1hbGlkcF9t
d19jb25uZWN0b3JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+
ICAJcmV0dXJuIE1PREVfT0s7Cj4gIH0KPiAgCj4gLWNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9y
X2hlbHBlcl9mdW5jcyBtYWxpZHBfbXdfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyBtYWxpZHBfbXdfY29u
bmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsKPiAgCS5nZXRfbW9kZXMgPSBtYWxpZHBfbXdfY29ubmVj
dG9yX2dldF9tb2RlcywKPiAgCS5tb2RlX3ZhbGlkID0gbWFsaWRwX213X2Nvbm5lY3Rvcl9tb2Rl
X3ZhbGlkLAo+ICB9Owo+IC0tIAo+IDIuMjQuMAo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09
CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5v
dCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0t
LS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
