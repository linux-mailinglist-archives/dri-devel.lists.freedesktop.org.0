Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E314B3D2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 12:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97ED6EDF3;
	Tue, 28 Jan 2020 11:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 313 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jan 2020 11:57:25 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02D26EDF2;
 Tue, 28 Jan 2020 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xUdWWouPoTBLz4SlYbcfDB/esqjTyLlKextVomO06hg=; b=E1V7gKM5iZ7gHvo/0jRtcUIG9j
 2w4NZhY5mNb8I1KtZbFFATAXKXczW+jaM1ThwC0HRq3gNOZHIUEuntf9QaCMfQnKbtb5RNXuQBtQB
 b5d5yD1P0zdxiElFv1rkQywZ2HsJiOBgpkj5FMwYxHeiOFIwwy8phGv9ijhtqOgBe6KOb/8lvUum6
 6577ww/jgGd3AqsYu5KCfVmyFLKni04ueCpUUJqsgDFWSQerKyMcvJIc+XbQjlLOSYrelXFVm9X95
 89qE6NgufO3pyhMSQIQAQrUZXNXYrJhTo+IiPUiNMUsdezIHnylek5ExNx3d6b7XQeQ81kecfnS/O
 qB+EocXA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52048
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iwPPe-000880-68; Tue, 28 Jan 2020 12:52:10 +0100
Subject: Re: [PATCH 2/4] drm/fbdev-helper: don't force restores
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
 <20200128104602.1459802-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <098c0e3c-e885-ac32-9c71-77ba75cb33c6@tronnes.org>
Date: Tue, 28 Jan 2020 12:52:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128104602.1459802-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjguMDEuMjAyMCAxMS40NSwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBJbnN0ZWFkIGNo
ZWNrIGZvciBtYXN0ZXIgc3RhdHVzLCBpbiBjYXNlIHdlJ3ZlIHJhY2VkLgo+IAo+IFRoaXMgaXMg
dGhlIGxhc3QgZXhjZXB0aW9uIHRvIHRoZSBnZW5lcmFsIHJ1bGUgdGhhdCB3ZSByZXN0b3JlIGZi
Y29uCj4gb25seSB3aGVuIHRoZXJlJ3Mgbm8gbWFzdGVyIGFjdGl2ZS4gQ29tcG9zaXRvcnMgYXJl
IHN1cHBvc2VkIHRvIGRyb3AKPiB0aGVpciBtYXN0ZXIgc3RhdHVzIGJlZm9yZSB0aGV5IHN3aXRj
aCB0byBhIGRpZmZlcmVudCBjb25zb2xlIGJhY2sgdG8KPiB0ZXh0IG1vZGUgKG9yIGp1c3Qgc3dp
dGNoIHRvIHRleHQgbW9kZSBkaXJlY3RseSwgd2l0aG91dCBhIHZ0IHN3aXRjaCkuCj4gCj4gVGhp
cyBpcyBrbm93biB0byBicmVhayBzb21lIHN1YnRlc3RzIG9mIGttc19mYmNvbl9mYnQgaW4gaWd0
LCBidXQgdGhleSdyZQo+IGp1c3Qgd3JvbmcgLSBpdCBkb2VzIGEgZ3JhcGhpY3MvdGV4dCBtb2Rl
IHN3aXRjaCBmb3IgdGhlIHZ0IHdpdGhvdXQKPiB1cGRhdGluZyB0aGUgbWFzdGVyIHN0YXR1cy4K
PiAKPiBBbHNvIGFkZCBhIGNvbW1lbnQgdG8gdGhlIGRybV9jbGllbnQtPnJlc3RvcmUgaG9vayB0
aGF0IHRoaXMgaXMgZXhwZWN0ZWQKPiBnb2luZyBmb3J3YXJkIGZyb20gYWxsIGNsaWVudHMgKHRo
ZXJlJ3MgY3VycmVudGx5IGp1c3Qgb25lKS4KPiAKPiB2MjogQWxzbyBkcm9wIHRoZSBmb3JjZSBp
biBwYW5fZGlzcGxheQo+IAo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDE0ICsrLS0tLS0t
LS0tLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9jbGllbnQuaCAgICAgICAgfCAgNSArKysrKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jCj4gaW5kZXggNGM3Y2JjZTdiYWU3Li45MjYxODdhODIyNTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiBAQCAtMjUwLDE3ICsyNTAsNyBAQCBpbnQgZHJt
X2ZiX2hlbHBlcl9yZXN0b3JlX2ZiZGV2X21vZGVfdW5sb2NrZWQoc3RydWN0IGRybV9mYl9oZWxw
ZXIgKmZiX2hlbHBlcikKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAltdXRleF9sb2NrKCZmYl9oZWxw
ZXItPmxvY2spOwo+IC0JLyoKPiAtCSAqIFRPRE86Cj4gLQkgKiBXZSBzaG91bGQgYmFpbCBvdXQg
aGVyZSBpZiB0aGVyZSBpcyBhIG1hc3RlciBieSBkcm9wcGluZyBfZm9yY2UuCj4gLQkgKiBDdXJy
ZW50bHkgdGhlc2UgaWd0IHRlc3RzIGZhaWwgaWYgd2UgZG8gdGhhdDoKPiAtCSAqIC0ga21zX2Zi
Y29uX2ZidEBwc3IKPiAtCSAqIC0ga21zX2ZiY29uX2ZidEBwc3Itc3VzcGVuZAo+IC0JICoKPiAt
CSAqIFNvIGZpcnN0IHRoZXNlIHRlc3RzIG5lZWQgdG8gYmUgZml4ZWQgc28gdGhleSBkcm9wIG1h
c3RlciBvciBkb24ndAo+IC0JICogaGF2ZSBhbiBmZCBvcGVuLgo+IC0JICovCj4gLQlyZXQgPSBk
cm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2ZvcmNlKCZmYl9oZWxwZXItPmNsaWVudCk7Cj4gKwly
ZXQgPSBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0KCZmYl9oZWxwZXItPmNsaWVudCk7Cj4gIAo+
ICAJZG9fZGVsYXllZCA9IGZiX2hlbHBlci0+ZGVsYXllZF9ob3RwbHVnOwo+ICAJaWYgKGRvX2Rl
bGF5ZWQpCj4gQEAgLTEzNTcsNyArMTM0Nyw3IEBAIHN0YXRpYyBpbnQgcGFuX2Rpc3BsYXlfYXRv
bWljKHN0cnVjdCBmYl92YXJfc2NyZWVuaW5mbyAqdmFyLAo+ICAKPiAgCXBhbl9zZXQoZmJfaGVs
cGVyLCB2YXItPnhvZmZzZXQsIHZhci0+eW9mZnNldCk7Cj4gIAo+IC0JcmV0ID0gZHJtX2NsaWVu
dF9tb2Rlc2V0X2NvbW1pdF9mb3JjZSgmZmJfaGVscGVyLT5jbGllbnQpOwo+ICsJcmV0ID0gZHJt
X2NsaWVudF9tb2Rlc2V0X2NvbW1pdCgmZmJfaGVscGVyLT5jbGllbnQpOwoKVGhpcyBuZWVkcyBf
Zm9yY2UgYmVjYXVzZSBkcm1fZmJfaGVscGVyX3Bhbl9kaXNwbGF5KCkgYWxyZWFkeSBob2xkcyB0
aGUKbG9ja3MuCgpXaXRoIHRoYXQgZml4ZWQ6ClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMg
PG5vcmFsZkB0cm9ubmVzLm9yZz4KCk1heWJlIGEgYmV0dGVyIGFuZCBtb3JlIGRlc2NyaXB0aXZl
IG5hbWUgd291bGQgaGF2ZSBiZWVuCmRybV9jbGllbnRfbW9kZXNldF9jb21taXRfbG9ja2VkKCku
CgpOb3JhbGYuCgo+ICAJaWYgKCFyZXQpIHsKPiAgCQlpbmZvLT52YXIueG9mZnNldCA9IHZhci0+
eG9mZnNldDsKPiAgCQlpbmZvLT52YXIueW9mZnNldCA9IHZhci0+eW9mZnNldDsKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oIGIvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5o
Cj4gaW5kZXggNWNmMmM1ZGQ4YjFlLi5kMDFkMzExMDIzYWMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2NsaWVudC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oCj4gQEAg
LTQ0LDYgKzQ0LDExIEBAIHN0cnVjdCBkcm1fY2xpZW50X2Z1bmNzIHsKPiAgCSAqIHJldHVybnMg
emVybyBnZXRzIHRoZSBwcml2aWxlZ2UgdG8gcmVzdG9yZSBhbmQgbm8gbW9yZSBjbGllbnRzIGFy
ZQo+ICAJICogY2FsbGVkLiBUaGlzIGNhbGxiYWNrIGlzIG5vdCBjYWxsZWQgYWZ0ZXIgQHVucmVn
aXN0ZXIgaGFzIGJlZW4gY2FsbGVkLgo+ICAJICoKPiArCSAqIE5vdGUgdGhhdCB0aGUgY29yZSBk
b2VzIG5vdCBndWFyYW50ZWUgZXhjbHVzaW9uIGFnYWluc3QgY29uY3VycmVudAo+ICsJICogZHJt
X29wZW4oKS4gQ2xpZW50cyBuZWVkIHRvIGVuc3VyZSB0aGlzIHRoZW1zZWx2ZXMsIGZvciBleGFt
cGxlIGJ5Cj4gKwkgKiB1c2luZyBkcm1fbWFzdGVyX2ludGVybmFsX2FjcXVpcmUoKSBhbmQKPiAr
CSAqIGRybV9tYXN0ZXJfaW50ZXJuYWxfcmVsZWFzZSgpLgo+ICsJICoKPiAgCSAqIFRoaXMgY2Fs
bGJhY2sgaXMgb3B0aW9uYWwuCj4gIAkgKi8KPiAgCWludCAoKnJlc3RvcmUpKHN0cnVjdCBkcm1f
Y2xpZW50X2RldiAqY2xpZW50KTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
