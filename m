Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E7892CF
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 19:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F306E352;
	Sun, 11 Aug 2019 17:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAC66E352
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 17:20:57 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62428
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hwrWZ-0003KQ-4Y; Sun, 11 Aug 2019 19:20:55 +0200
Subject: Re: [PATCH v2 4/9] drm/panel: Add driver for the LG Philips LB035Q02
 panel
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
 <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
 <20190811164951.GD14660@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <19674e30-bbc2-6cc7-856f-7488d7173dc6@tronnes.org>
Date: Sun, 11 Aug 2019 19:20:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811164951.GD14660@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Su+tAizg6R1AmUbV1qi7CUImWUE/FT4gN9hqreaAkI8=; 
 b=E9ELkTIYRZaNMoYhmE2Bs7V+FogHlyVcwhSzhbsyTe18uxP3Cp1W2FUJ2cSRQ332YMymzEDYy3W5iKXzks2AQ05eauAAVstH9D/JbyXw1RFAg6Gv+4Hr5fTpRK7P2xRvI7Y/NicntWUm2jOfijeQMjlGKGaaXn0xFkNfECh/M7nYDGJOI+9EmrdHAq6J+WvsH8bO8lphrHweJJJXbKrTwNBami7/yk163LmsNW3/e18z3/Rv0pbBQHCwFbvGVvJYUCD6pt0Fd8EyEnKewzWtfOaN96KJtyT8R1U6jIJogTW94CmD5lDrHXchtDlW3g4TSQEq/sD9aBhIxjsj+KYOdQ==;
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTEuMDguMjAxOSAxOC40OSwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPj4+ICtzdGF0aWMgaW50IGxiMDM1cTAyX3dyaXRlKHN0cnVjdCBsYjAzNXEwMl9kZXZpY2Ug
KmxjZCwgdTE2IHJlZywgdTE2IHZhbCkKPj4+ICt7Cj4+PiArCXN0cnVjdCBzcGlfbWVzc2FnZSBt
c2c7Cj4+PiArCXN0cnVjdCBzcGlfdHJhbnNmZXIgaW5kZXhfeGZlciA9IHsKPj4+ICsJCS5sZW4J
CT0gMywKPj4+ICsJCS5jc19jaGFuZ2UJPSAxLAo+Pj4gKwl9Owo+Pj4gKwlzdHJ1Y3Qgc3BpX3Ry
YW5zZmVyIHZhbHVlX3hmZXIgPSB7Cj4+PiArCQkubGVuCQk9IDMsCj4+PiArCX07Cj4+PiArCXU4
CWJ1ZmZlclsxNl07Cj4+PiArCj4+PiArCXNwaV9tZXNzYWdlX2luaXQoJm1zZyk7Cj4+PiArCj4+
PiArCS8qIHJlZ2lzdGVyIGluZGV4ICovCj4+PiArCWJ1ZmZlclswXSA9IDB4NzA7Cj4+PiArCWJ1
ZmZlclsxXSA9IDB4MDA7Cj4+PiArCWJ1ZmZlclsyXSA9IHJlZyAmIDB4N2Y7Cj4+PiArCWluZGV4
X3hmZXIudHhfYnVmID0gYnVmZmVyOwo+Pj4gKwlzcGlfbWVzc2FnZV9hZGRfdGFpbCgmaW5kZXhf
eGZlciwgJm1zZyk7Cj4+PiArCj4+PiArCS8qIHJlZ2lzdGVyIHZhbHVlICovCj4+PiArCWJ1ZmZl
cls0XSA9IDB4NzI7Cj4+PiArCWJ1ZmZlcls1XSA9IHZhbCA+PiA4Owo+Pj4gKwlidWZmZXJbNl0g
PSB2YWw7Cj4+PiArCXZhbHVlX3hmZXIudHhfYnVmID0gYnVmZmVyICsgNDsKPj4+ICsJc3BpX21l
c3NhZ2VfYWRkX3RhaWwoJnZhbHVlX3hmZXIsICZtc2cpOwo+Pj4gKwo+Pj4gKwlyZXR1cm4gc3Bp
X3N5bmMobGNkLT5zcGksICZtc2cpOwo+Pj4gK30KPj4KPj4gSnVzdCBhIG5vdGUgdG8gU2FtOgo+
PiBUaGlzIGlzIHRoZSBzYW1lIHNwaSBwcm90b2NvbCB0aGF0IHRoZSBpbGk5MzI1IGNvbnRyb2xs
ZXIgb24gdGhlIGh5MjhiCj4+IHBhbmVsIHVzZXMuCj4+Cj4+IEkgcmVtZW1iZXJlZCB0aGF0IEkg
aGF2ZSBleHBlcmltZW50ZWQgd2l0aCBhIHJlZ21hcCBpbXBsZW1lbnRhdGlvbjoKPj4gaHR0cHM6
Ly9naXRodWIuY29tL25vdHJvL3Rpbnlkcm0vYmxvYi9tYXN0ZXIvdGlueWRybS1pbGk5MzI1LmMj
TDE5MQo+IAo+IHJlZ21hcCBzZWVtcyBhIHRvbyBsaW1pdGVkIGludGVyZmFjZSB0byB1c2Ugd2hl
biB0cnlpbmcgdG8gZ2VuZXJhbGl6ZQo+IHRoaXMuCj4gV2Ugc2hvdWxkIHJhdGhlciBnbyBmb3Ig
YSBpbGktbGliIG9yIHNvbWV0aGluZyB0aGF0IGNhbiBiZSB1c2VkIGluIGFsbAo+IHRoZSBwcmVz
ZW50IGFuZCBmdXR1cmUgaWxpIGJhc2VkIGRyaXZlcnMuCj4gT2J2aW91c2x5IGl0IGRlcGVuZHMg
b24gaG93IHNpbWlsYXIgdGhlIGlsaSBiYXNlZCBjaGlwcyBhcmUuCj4gCj4gSSBkaWQgYSBxdWlj
ayBsb29rIGFuZCB0aGlzIGRyaXZlciBkaWQgbm90IG1hdGNoIHRoZSBpbGk5MzI1IGRhdGFzaGVl
dAo+IGFzIGRpZmZlcmVudCBiaXRzIHdhcyBhcmUgaW4gcmVnaXN0ZXIgMHgxLgo+IFNvIGl0IHNt
ZWVscyBsaWtlIGFub3RoZXIsIHNpbWlsYXIuIGlsaSB2YXJhaW50Lgo+IAo+IFNvIGZvciB0aGlz
IGRyaXZlciB3ZSB3b3VsZCBqdXN0IHVzZSB0aGUgaGFyZGNvZGVkIHZhcmFpbnQgYWxyZWFkeQo+
IHByZXNlbnQuIFRoZW4gd2UgbWF5IHJlLXZpc2l0IGlsaS1saWIgaWRlYSBsYXRlciBpZiB3ZSBz
ZWUgdG9vIG11Y2gKPiBzaW1pbGFyIGNvZGUuCj4gVGhpcyBpcyBhcyBJIHNlZSBpdCBmb3Igbm93
Li4uCj4gCgpZZWFoLCBubyBwb2ludCBpbiBjaGFuZ2luZyB0aGlzIGRyaXZlciB1bnRpbCB0aGVy
ZSBhcmUgbW9yZSBzaW1pbGFyCmNvbnRyb2xsZXJzLiBKdXN0IHdhbnRlZCB0byBwb2ludCBvdXQg
dGhhdCB0aGUgaHkyOGIgcGFuZWwgeW91IG9yZGVyZWQKdXNlcyB0aGUgc2FtZSBwcm90b2NvbC4K
CkEgd2ViIHNlYXJjaCBoZWxwZWQgbXkgbWVtb3J5LCB0aGVzZSAzIHN1cHBvcnRlZCBieSBzdGFn
aW5nL2ZidGZ0IHVzZSBhCnN0YXJ0Ynl0ZTogaWxpOTMyMCwgaWxpOTMyNSBhbmQgaHg4MzQ3ZC4g
VGhlIGlsaSBjaGlwcyBhcmUgYWxtb3N0CmlkZW50aWNhbC4gVGhlIHNlYXJjaCByZXZlYWxlZCBt
YW55IG1vcmUgaW5jbHVkaW5nOgpzdDc3OTMsIHN0Nzc4MXIsIFM2RTYzRDYsICttYW55IGlsaXRl
ay4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
