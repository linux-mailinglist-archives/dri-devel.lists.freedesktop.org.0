Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C12B1943
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 11:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C426E4B1;
	Fri, 13 Nov 2020 10:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8526E49F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:43:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2163FABD1;
 Fri, 13 Nov 2020 10:43:18 +0000 (UTC)
Subject: Re: [PATCH] drm/udl: Fix missing error code in udl_handle_damage()
To: Dan Carpenter <dan.carpenter@oracle.com>, Dave Airlie <airlied@redhat.com>
References: <20201113101502.GD168908@mwanda>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3c055831-29e4-e03e-c7cc-3acb791688c7@suse.de>
Date: Fri, 13 Nov 2020 11:43:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113101502.GD168908@mwanda>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDEzLjExLjIwIHVtIDExOjE1IHNjaHJpZWIgRGFuIENhcnBlbnRlcjoKPiBJZiB1ZGxf
Z2V0X3VyYigpIGZhaWxzIHRoZW4gdGhpcyBzaG91bGQgcmV0dXJuIGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZQo+IGJ1dCBjdXJyZW50bHkgaXQgcmV0dXJucyBzdWNjZXNzLgo+IAo+IEZpeGVzOiA3OThj
ZTNmZTFjM2EgKCJkcm0vdWRsOiBCZWdpbi9lbmQgYWNjZXNzIHRvIGltcG9ydGVkIGJ1ZmZlcnMg
aW4gZGFtYWdlLWhhbmRsZXIiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBBcyBpdCBoYXMgYSBGaXhl
cyB0YWcsIGl0J3MgcHJvYmFibHkgd29ydGggdGFraW5nCmZvciBzaWxlbmNpbmcgY29tcGlsZXIg
d2FybmluZ3MgYWxvbmUuIEknbGwgYWRkIGl0IHRvIHRoZSB0cmVlLgoKSW4gcHJhY3RpY2UsIGl0
IGRvZXNuJ3QgcmVhbGx5IG1hdHRlci4gdWRsX2hhbmRsZV9kYW1hZ2UoKSBpcyBydW5uaW5nCmR1
cmluZyB0aGUgRFJNIGNvbW1pdCBwaGFzZSBhbmQgaXQncyB0b28gbGF0ZSB0byBoYW5kbGUgZXJy
b3JzLiBXZSBjb3VsZAphcyB3ZWxsIGNvbnZlcnQgdGhlIHRoZSBmdW5jdGlvbiB0byB2b2lkLgoK
QmVzdCByZWdhcmRzClRob21hcwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9k
ZXNldC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNl
dC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCj4gaW5kZXggNDJlZWJhMWRm
ZGJmLi45ZDM0ZWM5ZDAzZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bW9kZXNldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCj4gQEAg
LTMwNSw4ICszMDUsMTAgQEAgc3RhdGljIGludCB1ZGxfaGFuZGxlX2RhbWFnZShzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYiwgaW50IHgsIGludCB5LAo+ICAJdmFkZHIgPSBtYXAudmFkZHI7IC8q
IFRPRE86IFVzZSBtYXBwaW5nIGFic3RyYWN0aW9uIHByb3Blcmx5ICovCj4gIAo+ICAJdXJiID0g
dWRsX2dldF91cmIoZGV2KTsKPiAtCWlmICghdXJiKQo+ICsJaWYgKCF1cmIpIHsKPiArCQlyZXQg
PSAtRU5PTUVNOwo+ICAJCWdvdG8gb3V0X2RybV9nZW1fc2htZW1fdnVubWFwOwo+ICsJfQo+ICAJ
Y21kID0gdXJiLT50cmFuc2Zlcl9idWZmZXI7Cj4gIAo+ICAJZm9yIChpID0gY2xpcC55MTsgaSA8
IGNsaXAueTI7IGkrKykgewo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
Ckdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
