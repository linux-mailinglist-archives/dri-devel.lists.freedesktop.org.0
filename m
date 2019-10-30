Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E321EE9D33
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 15:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9551C6EA0E;
	Wed, 30 Oct 2019 14:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD216EA0E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 14:11:38 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57434
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iPohE-00083M-Mm; Wed, 30 Oct 2019 15:11:36 +0100
Subject: Re: [PATCH 1/2] drm/todo: Convert drivers to generic fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch
References: <20191029070616.3521-1-tzimmermann@suse.de>
 <20191029070616.3521-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <4da03bba-4f5b-5ccc-1118-de0449ab864b@tronnes.org>
Date: Wed, 30 Oct 2019 15:11:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029070616.3521-2-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yFwMngaiAomghVZVjlJ1rjW1AXRzGJVrDfY7p2RQocg=; b=RCMlTjx8k5bIMOC5qN4ikpYFsx
 rlFQeBtPhXBfgyL/a9pxc6IkHd2EbJ+T4ebANWXXD3uMBlTH70hgaRurBr8RU7QkGk/aNGAqyU9CV
 Xb35jiBdZ4dJ3GN1PHcN3ZKZAuCwY8sy6lrkyNwr53GDVb0Dx5KDaAjosJv5h79LlQseKN+MyvR4I
 WbyZpM5xR8I07mm/zmRYC56cyBl2kbTFd6aORK53GtRJ/XoJK/HJ2KKO3K2Jwd+QEkUtHn3GAgjMl
 i9rtWOuE/UKI4ayp4oD7X/Rngb6/0G4T44oHr/M+7ZFgNnOHrIsJ1bDJTQHmQwECGpOu7PMoKufR5
 skfQguzQ==;
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjkuMTAuMjAxOSAwOC4wNiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhpcyBy
ZXBsYWNlcyB0aGUgb3JpZ25hbCBUT0RPIGl0ZW0gZm9yIGRybV9mYl9oZWxwZXJfZmJkZXZfc2V0
dXAoKSBhbmQKPiBfdGVhcmRvd24oKSwgd2hpY2ggYXJlIGRlcHJlY2F0ZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4g
IERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMTUgKysrKysrKy0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5y
c3QKPiBpbmRleCA2NzkyZmE5YjZiNmIuLjRhYTc2NzQ2MWUwZSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0
Cj4gQEAgLTE3MSwxMCArMTcxLDEwIEBAIENvbnRhY3Q6IE1haW50YWluZXIgb2YgdGhlIGRyaXZl
ciB5b3UgcGxhbiB0byBjb252ZXJ0Cj4gIAo+ICBMZXZlbDogSW50ZXJtZWRpYXRlCj4gIAo+IC1D
b252ZXJ0IGRyaXZlcnMgdG8gdXNlIGRybV9mYl9oZWxwZXJfZmJkZXZfc2V0dXAvdGVhcmRvd24o
KQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICtDb252ZXJ0IGRyaXZlcnMgdG8gdXNlIGRybV9mYmRldl9nZW5lcmljX3NldHVw
KCkKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IAo+IC1Nb3N0IGRyaXZlcnMgY2FuIHVzZSBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCkgZXhj
ZXB0IG1heWJlOgo+ICtNb3N0IGRyaXZlcnMgY2FuIHVzZSBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1
cCgpIGV4Y2VwdCBtYXliZToKPiAgCj4gIC0gYW1kZ3B1IHdoaWNoIGhhcyBzcGVjaWFsIGxvZ2lj
IHRvIGRlY2lkZSB3aGV0aGVyIHRvIGNhbGwKPiAgICBkcm1faGVscGVyX2Rpc2FibGVfdW51c2Vk
X2Z1bmN0aW9ucygpCj4gQEAgLTE4NCw4ICsxODQsMTAgQEAgTW9zdCBkcml2ZXJzIGNhbiB1c2Ug
ZHJtX2ZiX2hlbHBlcl9mYmRldl9zZXR1cCgpIGV4Y2VwdCBtYXliZToKPiAgCj4gIC0gaTkxNSB3
aGljaCBjYWxscyBkcm1fZmJfaGVscGVyX2luaXRpYWxfY29uZmlnKCkgaW4gYSB3b3JrZXIKPiAg
Cj4gLURyaXZlcnMgdGhhdCB1c2UgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSgpIHRvIGNsZWFuIHVw
IHRoZSBmYmRldiBmcmFtZWJ1ZmZlciBjYW4KPiAtcHJvYmFibHkgdXNlIGRybV9mYl9oZWxwZXJf
ZmJkZXZfdGVhcmRvd24oKS4KPiArQ3VycmVudCBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBleHBl
Y3RzIHRoZSBmcmFtZWJ1ZmZlciBpbiBzeXN0ZW0KPiArbWVtb3J5IChvciBzeXN0ZW0tbGlrZSBt
ZW1vcnkpLiBUaGlzIG1pZ2h0IGJlIGEgcHJvYmxlbSBmb3IgY2VydGFpbgo+ICtkcml2ZXJzLiBH
ZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBzaG91bGQgaGF2ZSBhIHdheSBvZiBvcGVyYXRpbmcgb24K
PiArSS9PIG1lbW9yeS4KPiAgCj4gIENvbnRhY3Q6IE1haW50YWluZXIgb2YgdGhlIGRyaXZlciB5
b3UgcGxhbiB0byBjb252ZXJ0Cj4gIAoKSSB0aGluayB5b3UgY2FuIGp1c3QgZGVsZXRlIHRoZSBl
bnRpcmUgX3NldHVwL190ZWFyZG93biBlbnRyeSBpbmNsdWRpbmcKdGhlIGxpc3Qgb2YgZHJpdmVy
cy4gTWFueSBtb3JlIGRyaXZlcnMgaGF2ZSBpc3N1ZXMgd2l0aCB0aGUgZ2VuZXJpYwplbXVsYXRp
b24gc28gbm8gcG9pbnQgaW4gbGlzdGluZyBpbmRpdmlkdWFsIGRyaXZlcnMgYXQgdGhpcyBlYXJs
eSBzdGFnZS4KWW91IGNhbiBhZGQgdGhhdCB0aGUgZHJpdmVyIGhhcyB0byBiZSBhdG9taWMgYW5k
IHRoYXQgaXQgbmVlZHMgdG8Kc3VwcG9ydCBwcmltZSB2bWFwL21tYXAuIE1heWJlIGFsc28gdGhl
IGN1cnJlbnQgc2hhZG93IGJ1ZmZlcgpwZXJmb3JtYW5jZSBwZW5hbHR5IGZvciBzaG1lbSBiYWNr
ZWQgYnVmZmVycy4KCj4gQEAgLTMyOCw5ICszMzAsNiBAQCBkcm1fZmJfaGVscGVyIHRhc2tzCj4g
ICAgdGhlc2UgaWd0IHRlc3RzIG5lZWQgdG8gYmUgZml4ZWQ6IGttc19mYmNvbl9mYnRAcHNyIGFu
ZAo+ICAgIGttc19mYmNvbl9mYnRAcHNyLXN1c3BlbmQuCj4gIAo+IC0tIFRoZSBtYXggY29ubmVj
dG9yIGFyZ3VtZW50IGZvciBkcm1fZmJfaGVscGVyX2luaXQoKSBhbmQKPiAtICBkcm1fZmJfaGVs
cGVyX2ZiZGV2X3NldHVwKCkgaXNuJ3QgdXNlZCBhbnltb3JlIGFuZCBjYW4gYmUgcmVtb3ZlZC4K
PiAtCgpUaGlzIGVudHJ5IGlzIHN0aWxsIHZhbGlkIGZvciBkcm1fZmJfaGVscGVyX2luaXQoKS4K
Ck5vcmFsZi4KCj4gIC0gVGhlIGhlbHBlciBkb2Vzbid0IGtlZXAgYW4gYXJyYXkgb2YgY29ubmVj
dG9ycyBhbnltb3JlIHNvIHRoZXNlIGNhbiBiZQo+ICAgIHJlbW92ZWQ6IGRybV9mYl9oZWxwZXJf
c2luZ2xlX2FkZF9hbGxfY29ubmVjdG9ycygpLAo+ICAgIGRybV9mYl9oZWxwZXJfYWRkX29uZV9j
b25uZWN0b3IoKSBhbmQgZHJtX2ZiX2hlbHBlcl9yZW1vdmVfb25lX2Nvbm5lY3RvcigpLgo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
