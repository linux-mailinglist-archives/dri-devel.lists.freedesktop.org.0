Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E993891FA
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 16:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A446589E69;
	Sun, 11 Aug 2019 14:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE7B89E69
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 14:13:59 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61830
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hwobd-0005sh-9N; Sun, 11 Aug 2019 16:13:57 +0200
Subject: Re: [PATCH v2 4/9] drm/panel: Add driver for the LG Philips LB035Q02
 panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-5-laurent.pinchart@ideasonboard.com>
 <6a2a22b2-3db5-2d7b-d19b-4f3857351134@tronnes.org>
 <20190811133506.GB5011@pendragon.ideasonboard.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c60e0de5-88e0-50ec-adf1-6abccc7ec020@tronnes.org>
Date: Sun, 11 Aug 2019 16:13:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811133506.GB5011@pendragon.ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=bneRXkrZjuHjtczyCs2YrHNQok6E3SJuG3EnFe2qYN4=; 
 b=lrqfXIRfDubzRwG5b7iay3+0g/Gjxm3Nn3ClaL/BpfHYIrbzoRheogJe9cglB1kpGVdzjSd7GsdezlC7AsIbNvtSDL1zjI9ZolIAe0X8MNyqrlDzOJiHzz+SIksBRZTEjXGGEQT+SRdPQ/SjBzAJqle07kMOAHc42bPZMRoUhrZo5s1eQMZb0iOYGyDlxmK8vv1a11iJncZPQuTyvHKqsy+mxBzC0QR/XEud/um5142s2xDhrwChyl2DGaZuaLid8GDLUVN2btRegekl75z/+SlGFvcT0OMQc+ZObh7Yggw6BiQ8P/Be794Eo8jDjVZ9eq0hh7XlqPCi3aONFTn6Ww==;
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCkRlbiAxMS4wOC4yMDE5IDE1LjM1LCBza3JldiBMYXVyZW50IFBpbmNoYXJ0
Ogo+IEhpIE5vcmFsZiwKPiAKPiBPbiBTdW4sIEF1ZyAxMSwgMjAxOSBhdCAwMzoxOToxM1BNICsw
MjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+IFNhbSwKPj4KPj4gRGVuIDExLjA4LjIwMTkg
MDEuMTAsIHNrcmV2IExhdXJlbnQgUGluY2hhcnQ6Cj4+PiBUaGlzIHBhbmVsIGlzIHVzZWQgb24g
dGhlIEd1bXN0aXggT3Zlcm8gUGFsbzM1Lgo+Pj4KPj4+IFRoZSBjb2RlIGlzIGJhc2VkIG9uIHRo
ZSBvbWFwZHJtLXNwZWNpZmljIHBhbmVsLWxncGhpbGlwcy1sYjAzNXEwMgo+Pj4gZHJpdmVyLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+Cj4+PiAtLS0KPj4KPj4gPHNuaXA+Cj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWxnLWxiMDM1cTAyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtbGctbGIwMzVxMDIuYwo+Pgo+PiA8c25pcD4KPj4KPj4+ICtzdGF0aWMgaW50IGxi
MDM1cTAyX3dyaXRlKHN0cnVjdCBsYjAzNXEwMl9kZXZpY2UgKmxjZCwgdTE2IHJlZywgdTE2IHZh
bCkKPj4+ICt7Cj4+PiArCXN0cnVjdCBzcGlfbWVzc2FnZSBtc2c7Cj4+PiArCXN0cnVjdCBzcGlf
dHJhbnNmZXIgaW5kZXhfeGZlciA9IHsKPj4+ICsJCS5sZW4JCT0gMywKPj4+ICsJCS5jc19jaGFu
Z2UJPSAxLAo+Pj4gKwl9Owo+Pj4gKwlzdHJ1Y3Qgc3BpX3RyYW5zZmVyIHZhbHVlX3hmZXIgPSB7
Cj4+PiArCQkubGVuCQk9IDMsCj4+PiArCX07Cj4+PiArCXU4CWJ1ZmZlclsxNl07Cj4+PiArCj4+
PiArCXNwaV9tZXNzYWdlX2luaXQoJm1zZyk7Cj4+PiArCj4+PiArCS8qIHJlZ2lzdGVyIGluZGV4
ICovCj4+PiArCWJ1ZmZlclswXSA9IDB4NzA7Cj4+PiArCWJ1ZmZlclsxXSA9IDB4MDA7Cj4+PiAr
CWJ1ZmZlclsyXSA9IHJlZyAmIDB4N2Y7Cj4+PiArCWluZGV4X3hmZXIudHhfYnVmID0gYnVmZmVy
Owo+Pj4gKwlzcGlfbWVzc2FnZV9hZGRfdGFpbCgmaW5kZXhfeGZlciwgJm1zZyk7Cj4+PiArCj4+
PiArCS8qIHJlZ2lzdGVyIHZhbHVlICovCj4+PiArCWJ1ZmZlcls0XSA9IDB4NzI7Cj4+PiArCWJ1
ZmZlcls1XSA9IHZhbCA+PiA4Owo+Pj4gKwlidWZmZXJbNl0gPSB2YWw7Cj4+PiArCXZhbHVlX3hm
ZXIudHhfYnVmID0gYnVmZmVyICsgNDsKPj4+ICsJc3BpX21lc3NhZ2VfYWRkX3RhaWwoJnZhbHVl
X3hmZXIsICZtc2cpOwo+Pj4gKwo+Pj4gKwlyZXR1cm4gc3BpX3N5bmMobGNkLT5zcGksICZtc2cp
Owo+Pj4gK30KPj4KPj4gSnVzdCBhIG5vdGUgdG8gU2FtOgo+PiBUaGlzIGlzIHRoZSBzYW1lIHNw
aSBwcm90b2NvbCB0aGF0IHRoZSBpbGk5MzI1IGNvbnRyb2xsZXIgb24gdGhlIGh5MjhiCj4+IHBh
bmVsIHVzZXMuCj4+Cj4+IEkgcmVtZW1iZXJlZCB0aGF0IEkgaGF2ZSBleHBlcmltZW50ZWQgd2l0
aCBhIHJlZ21hcCBpbXBsZW1lbnRhdGlvbjoKPj4gaHR0cHM6Ly9naXRodWIuY29tL25vdHJvL3Rp
bnlkcm0vYmxvYi9tYXN0ZXIvdGlueWRybS1pbGk5MzI1LmMjTDE5MQo+IAo+IFRoYXQncyB1c2Vm
dWwgaW5mb3JtYXRpb24sIHRoYW5rcy4gVGhlIGNvbnRyb2xsZXIgc2VlbXMgZGlmZmVyZW50Cj4g
dGhvdWdoLCB0aGUgbGltaXRlZCBpbmZvcm1hdGlvbiBhdmFpbGFibGUgaW4KPiBodHRwczovL3d3
dy5iZXlvbmRpbmZpbml0ZS5jb20vbGNkL0xpYnJhcnkvTEctUGhpbGlwcy9MQjAzNVEwMi5wZGYK
PiBkb2Vzbid0IG1hdGNoIHRoZSByZWdpc3RlcnMgZnJvbQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9u
b3Ryby90aW55ZHJtL2Jsb2IvbWFzdGVyL2ZiX2lsaTkzMjUuYy4KPiAKCkkndmUgc2VlbiBzZXZl
cmFsIGNvbnRyb2xsZXJzIHRoYXQgdXNlIHRoaXMgcHJvdG9jb2wsIGFuZCBvbmUgdGhhdCBoYWQg
YQpkaWZmZXJlbnQgc3RhcnQgYnl0ZSBjb25maWd1cmF0aW9uLiBUaGUgZGV0YWlscyB1bmZvcnR1
bmF0ZWx5IGlzIGxvc3QgaW4KdGltZSwgaXQncyBiZWVuIGEgd2hpbGUgc2luY2UgSSB3b3JrZWQg
b24gdGhlc2UgY29udHJvbGxlcnMuCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
