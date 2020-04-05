Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A837B19EC1B
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 16:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24F89F27;
	Sun,  5 Apr 2020 14:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8551189F08;
 Sun,  5 Apr 2020 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qSKFkOsXDpN+Xq2VSS7sYPHPPvZw/JqfUbFanTqmA9k=; b=fVjTSOxE/5hlQB3jMpoPD61PYH
 rlkPRmGeZr9yVxbTyl0oa6cXKA9OjpcnPm+1wuw1p5YZ/ehsRzUb7ZIGllWIStfkJBAva5JuiKJQI
 TJ1WP4NJ1BFSxRblciUVpAQRrEvp1QdkEipUrIpG3Y719rOfhA2aijtsQ3IAwtQAN7lPyQHQGpboB
 ew5Cb00m0JQdZ4CLuUhUiHq7Uvj4qhDXjXZcUNjSOYJ70mF4apwn2x7kP3iHuyH1+f9MrqpxxX/yM
 NV+/E4mAjkVRcKLZjyyeNeiRihEcQF/MhZKNwdMHNNrKYw/eYDs/Y9RiIi3kHQORu5mHEeIto3Kug
 hxUKEGYQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52481
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jL6Y4-0001Gt-R7; Sun, 05 Apr 2020 16:46:56 +0200
Subject: Re: [PATCH 15/44] drm/udl: Use demv_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-16-daniel.vetter@ffwll.ch>
 <3e3f7726-f1d2-c29f-4fc8-c42002e7da13@tronnes.org>
 <CAKMK7uGthodxod5=cGWsiYNkqE_hvyekpcNegdunKa4Xycyezg@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <34e654ae-0cc9-e393-ac02-e4ac6eda60f6@tronnes.org>
Date: Sun, 5 Apr 2020 16:46:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGthodxod5=cGWsiYNkqE_hvyekpcNegdunKa4Xycyezg@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDUuMDQuMjAyMCAxNS40Nywgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBTdW4sIEFw
ciA1LCAyMDIwIGF0IDEyOjE4IFBNIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
PiB3cm90ZToKPj4KPj4KPj4KPj4gRGVuIDAzLjA0LjIwMjAgMTUuNTcsIHNrcmV2IERhbmllbCBW
ZXR0ZXI6Cj4+PiBBbHNvIGluaXQgdGhlIGZiZGV2IGVtdWxhdGlvbiBiZWZvcmUgd2UgcmVnaXN0
ZXIgdGhlIGRldmljZSwgdGhhdCB3YXkKPj4+IHdlIGNhbiByZWx5IG9uIHRoZSBhdXRvLWNsZWFu
dXAgYW5kIHNpbXBsaWZ5IHRoZSBwcm9iZSBlcnJvciBjb2RlIGV2ZW4KPj4+IG1vcmUuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4+PiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+IENjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KPj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KPj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
Pgo+Pj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+Pj4gQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4+IENjOiBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAbGludXRyb25peC5kZT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2Rydi5jIHwgMzYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZHJ2LmMKPj4+IGluZGV4IDFjZTJkODY1YzM2ZC4uNGJhNTE0OWZkZDU3IDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jCj4+PiBAQCAtNTcsMjcgKzU3LDIwIEBAIHN0YXRpYyBz
dHJ1Y3QgdWRsX2RldmljZSAqdWRsX2RyaXZlcl9jcmVhdGUoc3RydWN0IHVzYl9pbnRlcmZhY2Ug
KmludGVyZmFjZSkKPj4+ICAgICAgIHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGw7Cj4+PiAgICAgICBp
bnQgcjsKPj4+Cj4+PiAtICAgICB1ZGwgPSBremFsbG9jKHNpemVvZigqdWRsKSwgR0ZQX0tFUk5F
TCk7Cj4+PiAtICAgICBpZiAoIXVkbCkKPj4+IC0gICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
LUVOT01FTSk7Cj4+PiAtCj4+PiAtICAgICByID0gZHJtX2Rldl9pbml0KCZ1ZGwtPmRybSwgJmRy
aXZlciwgJmludGVyZmFjZS0+ZGV2KTsKPj4+IC0gICAgIGlmIChyKSB7Cj4+PiAtICAgICAgICAg
ICAgIGtmcmVlKHVkbCk7Cj4+PiAtICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHIpOwo+Pj4g
LSAgICAgfQo+Pj4gKyAgICAgdWRsID0gZGV2bV9kcm1fZGV2X2FsbG9jKCZpbnRlcmZhY2UtPmRl
diwgJmRyaXZlciwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdWRs
X2RldmljZSwgZHJtKTsKPj4+ICsgICAgIGlmIChJU19FUlIodWRsKSkKPj4+ICsgICAgICAgICAg
ICAgcmV0dXJuIHVkbDsKPj4+Cj4+PiAgICAgICB1ZGwtPnVkZXYgPSB1ZGV2Owo+Pj4gICAgICAg
dWRsLT5kcm0uZGV2X3ByaXZhdGUgPSB1ZGw7Cj4+PiAtICAgICBkcm1tX2FkZF9maW5hbF9rZnJl
ZSgmdWRsLT5kcm0sIHVkbCk7Cj4+Pgo+Pj4gICAgICAgciA9IHVkbF9pbml0KHVkbCk7Cj4+PiAt
ICAgICBpZiAocikgewo+Pj4gLSAgICAgICAgICAgICBkcm1fZGV2X3B1dCgmdWRsLT5kcm0pOwo+
Pj4gKyAgICAgaWYgKHIpCj4+PiAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHIpOwo+Pj4g
LSAgICAgfQo+Pj4KPj4+ICAgICAgIHVzYl9zZXRfaW50ZmRhdGEoaW50ZXJmYWNlLCB1ZGwpOwo+
Pj4gKwo+Pj4gICAgICAgcmV0dXJuIHVkbDsKPj4+ICB9Cj4+Pgo+Pj4gQEAgLTkxLDIzICs4NCwx
NyBAQCBzdGF0aWMgaW50IHVkbF91c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVy
ZmFjZSwKPj4+ICAgICAgIGlmIChJU19FUlIodWRsKSkKPj4+ICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIodWRsKTsKPj4+Cj4+PiArICAgICByID0gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAo
JnVkbC0+ZHJtLCAwKTsKPj4KPj4gSXQgZG9lc24ndCBmZWVsIHJpZ2h0IHRvIGhhdmUgYSBjbGll
bnQgb3BlbiB0aGUgZGV2aWNlIGJlZm9yZSB0aGUgRFJNCj4+IGRldmljZSBpdHNlbGYgaXMgcmVn
aXN0ZXJlZC4gSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCBpdCB3aGVyZSBpdCBpcyBidXQKPj4gaWdu
b3JlIGFueSBlcnJvcnMuIEEgZmFpbGluZyBjbGllbnQgc2hvdWxkbid0IHByZXZlbnQgdGhlIGRy
aXZlciBmcm9tCj4+IHByb2JpbmcuIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkgZG8gcHJpbnQg
ZXJyb3JzIGlmIGl0IGZhaWxzLiBTbyB5ZWFoLAo+PiBpbiBoaW5kc2lnaHQgSSBzaG91bGQgaGF2
ZSBtYWRlIGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkgcmV0dXJuIHZvaWQuCj4gCj4gSG0sIHdl
IGhhdmUgYWxsIGtpbmRzIG9mIHVzYWdlIHJpZ2h0IG5vdywgc29tZSBjaGVjayBmb3IgZXJyb3Jz
LCBzb21lCj4gZG9udCwgc29tZSBkbyB0aGlzIGJlZm9yZSBkcm1fZGV2X3JlZ2lzdGVyLCBzb21l
IGFmdGVyLiBJZiB5b3VyCj4gcmVjb21tZW5kYXRpb24gaXMgdG8gbm90IGNoZWNrIGZvciBlcnJv
cnMgdGhlbiBJJ20gaGFwcHkgdG8gaW1wbGVtZW50Cj4gdGhhdCwgYnV0IHdlJ3JlIGEgYml0IGlu
Y29uc2lzdGVudC4gTWF5YmUgd2Ugc2hvdWxkIGRvIGEgcGF0Y2ggdGhhdCBhdAo+IGxlYXN0IGFs
d2F5cyByZXR1cm5zIDAgbm8gbWF0dGVyIHdoYXQsIHBsdXMgZG9jdW1lbnQgdGhhdCB0aGUgcmV0
dXJuCj4gdmFsdWUgIHNob3VsZG4ndCBiZSBjaGVja2VkPwoKWWVhaCwgYWx3YXlzIHJldHVybmlu
ZyB6ZXJvIGFuZCBkb2N1bWVudGluZyBpdCB3b3VsZCBiZSBhIGdvb2Qgc3RhcnQuCgpJIGNvdW50
ZWQgNDEgZHJpdmVycyB1c2luZyBnZW5lcmljIGZiZGV2IG5vdywgZGlkbid0IGtub3cgaXQgd2Fz
IHRoYXQKbXVjaCB1c2VkLiBPbmx5IDExIGRyaXZlcnMgYXJlIGhhbmQgcm9sbGluZyB0aGVpciBv
d246CmFybWFkYQpnbWE1MDAKYW1kCm9tYXBkcm0Kbm91dmVhdQppOTE1Cm1zbQp0ZWdyYQpleHlu
b3MKcmFkZW9uCnJvY2tjaGlwCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
