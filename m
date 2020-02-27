Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5AB17219E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 15:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6956C6E44F;
	Thu, 27 Feb 2020 14:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73BA76E44F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 14:53:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF34230E;
 Thu, 27 Feb 2020 06:53:21 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF87D3F7B4;
 Thu, 27 Feb 2020 06:53:21 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 8E879682F2C; Thu, 27 Feb 2020 14:53:20 +0000 (GMT)
Date: Thu, 27 Feb 2020 14:53:20 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 07/21] drm/arm: make hdlcd_debugfs_init() return void
Message-ID: <20200227145320.GY364558@e110455-lin.cambridge.arm.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-8-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227120232.19413-8-wambui.karugax@gmail.com>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDM6MDI6MThQTSArMDMwMCwgV2FtYnVpIEthcnVnYSB3
cm90ZToKPiBTaW5jZSBjb21taXQgOTg3ZDY1ZDAxMzU2IChkcm06IGRlYnVnZnM6IG1ha2UKPiBk
cm1fZGVidWdmc19jcmVhdGVfZmlsZXMoKSBuZXZlciBmYWlsKSwgZHJtX2RlYnVnZnNfY3JlYXRl
X2ZpbGVzKCkKPiBuZXZlciBmYWlscywgYW5kIHNob3VsZCByZXR1cm4gdm9pZC4gVGhlcmVmb3Jl
LCByZW1vdmUgaXRzIHVzZSBhcyBhCj4gcmV0dXJuIHZhbHVlIGluIGhkbGNkX2RlYnVnZnNfaW5p
dCBhbmQgaGF2ZSB0aGUgbGF0dGVyIGZ1bmN0aW9uCj4gcmV0dXJuIHZvaWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogV2FtYnVpIEthcnVnYSA8d2FtYnVpLmthcnVnYXhAZ21haWwuY29tPgoKQWNrZWQt
Ynk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKTm90IHN1cmUgaG93IHlvdSdy
ZSBnb2luZyB0byBhZGRyZXNzIEdyZWcgS0gncyBjb21tZW50IChtYXliZSBvbmUgc2luZ2xlIHBh
dGNoIHRoYXQKY29udmVydHMgZGVidWdmc19pbml0IHRvIHZvaWQgKmFuZCogY2hhbmdlcyB0aGUg
c2lnbmF0dXJlIHRvIGFsbCBob29rcz8pIGJ1dCBJJ20KZ29pbmcgdG8gYXNzdW1lIHRoYXQgeW91
IHdpbGwgZ2V0IHRoZSB3aG9sZSBzZXJpZXMgbWVyZ2VkIGluIG9uZSBnbyBzbyBJIGRvbid0IGhh
dmUKdG8gcHVzaCB0aGlzIGluZGl2aWR1YWwgcGF0Y2ggaW50byBIRExDRCB0cmVlLgoKQmVzdCBy
ZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9kcnYuYyB8
IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9kcnYuYwo+IGluZGV4IDJlMDUzODE1YjU0YS4uMTk0
NDE5ZjQ3YzVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jCj4gQEAgLTIyNCwxMCArMjI0
LDExIEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2luZm9fbGlzdCBoZGxjZF9kZWJ1Z2ZzX2xpc3RbXSA9
IHsKPiAgCXsgImNsb2NrcyIsIGhkbGNkX3Nob3dfcHhsY2xvY2ssIDAgfSwKPiAgfTsKPiAgCj4g
LXN0YXRpYyBpbnQgaGRsY2RfZGVidWdmc19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQo+
ICtzdGF0aWMgdm9pZCBoZGxjZF9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3Ip
Cj4gIHsKPiAtCXJldHVybiBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoaGRsY2RfZGVidWdmc19s
aXN0LAo+IC0JCUFSUkFZX1NJWkUoaGRsY2RfZGVidWdmc19saXN0KSwJbWlub3ItPmRlYnVnZnNf
cm9vdCwgbWlub3IpOwo+ICsJZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGhkbGNkX2RlYnVnZnNf
bGlzdCwKPiArCQkJCSBBUlJBWV9TSVpFKGhkbGNkX2RlYnVnZnNfbGlzdCksCj4gKwkJCQkgbWlu
b3ItPmRlYnVnZnNfcm9vdCwgbWlub3IpOwo+ICB9Cj4gICNlbmRpZgo+ICAKPiAtLSAKPiAyLjI1
LjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4
IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBc
IHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
