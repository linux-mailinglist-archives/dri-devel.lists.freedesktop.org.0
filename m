Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE87AEDB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 19:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732B96E5D0;
	Tue, 30 Jul 2019 17:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDBA6E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 17:04:42 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61570
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsVYF-00026D-TI; Tue, 30 Jul 2019 19:04:39 +0200
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
 <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
 <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <01d421db-ff1e-51ec-ad99-af79a102ec47@tronnes.org>
Date: Tue, 30 Jul 2019 19:04:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=W3T+4oUQ0BtJSMpm4nrC3Nmw9+MyOjzKZLX0HSvmqls=; 
 b=rGIZudbIgG5uS6CR0e1xEToetxcS9xsKKlNLV/7+ybtH8eGuSG15/2LPsBztazywaDrJOK7SyZgEyyGmoH7XT9ckXL9XR1y0vdZ/CCWsbBtj6hIFhRDVqMyl4azbDuwKIoGdoX40txfXddzQWRJNpHjJScKUqXzkSDfnMEqRxcfLLZvCOCPZUaRooxlwfBWDdHI6PsxH0IllckUbFQXxQto6eqw73+rIBS1n6hSH2O1X1xwbiCxG+MAQcvQUGc4Mx0e6Kd+5Tlw+q4VQVxWKYDgB+bKdR7go3mx+yrTR4sGKla0r6GLuph9cKCzyv0jJrSgJ26zIc2DZklnOrgVZjA==;
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
Cc: Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzAuMDcuMjAxOSAxNy4yMiwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBUdWUsIEp1
bCAzMCwgMjAxOSBhdCA0OjMwIFBNIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
PiB3cm90ZToKPj4KPj4KPj4KPj4gRGVuIDI5LjA3LjIwMTkgMjEuNTUsIHNrcmV2IE5vcmFsZiBU
csO4bm5lczoKPj4+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25u
ZXMub3JnPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1p
bGk5MzQxLmMgfCAxNzkgKysrKysrKysrKysrKysrKysrLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4+Cj4+Cj4+IEkgaGF2ZSByZWFsaXNl
ZCB0aGF0IHRoaXMgd2lsbCBjaGFuZ2UgdGhlIERSTSBkcml2ZXIgbmFtZSBmcm9tIG1pMDI4M3F0
Cj4+IHRvIGRybV9taXBpX2RiaS4gVGhpcyBtZWFucyB0aGF0IHRoaXMgcGFuZWwgd2lsbCBsb29z
ZSBpdHMgTUVTQSBrbXNyb1sxXQo+PiBzdXBwb3J0LiBJIGhhdmVuJ3QgdHJpZWQgaXQsIGJ1dCB0
aGlzIGlzIHRoZSBmaXJzdCB0aGluZyB0aGF0IGdpdmVzIHRoaXMKPj4gZHJpdmVyIGFueSByZWFs
IGFkdmFudGFnZSBvdmVyIGl0cyBmYmRldiBjb3VudGVycGFydCBpbgo+PiBkcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQsIHNvIEkgZG9uJ3Qgd2FudCB0byBsb29zZSB0aGF0Lgo+PiBTbyBldmVuIGlmIE1J
UEkgREJJIHBhbmVsIHN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgaW4gc29tZSBmb3JtLCBJIHdpbGwK
Pj4gd2FpdCB3aXRoIGNvbnZlcnRpbmcgbWkwMjgzcXQgdW50aWwgc29tZW9uZSBoYXMgdXBkYXRl
ZCB0aGUga21zcm8gZHJpdmVyLgo+IAo+IFdoeSBkb2VzIGl0IGNoYW5nZT8gWW91IHNob3VsZCBi
ZSBhYmxlIHRvIHN0dWZmIHdoYXRldmVyIHlvdSBmZWVsIGxpa2UKPiBpbnRvIHRoZSBkcm0gZHJp
dmVyIG5hbWUsIHRoaXMgZG9lc24ndCBoYXZlIHRvIG1hdGNoIGVpdGhlciB5b3VyCj4gcGxhdGZv
cm0vc3BpL3doYXRldmVyIGRyaXZlciBuYW1lIG5vciB0aGUgbW9kdWxlIG9wdGlvbi4KClN0cmlj
dGx5IGl0IGRvZXNuJ3QgaGF2ZSB0byBjaGFuZ2UsIEkgY291bGQgcGFzcyBhIG1pMDI4M3F0IHNw
ZWNpZmljCnN0cnVjdCBkcm1fZHJpdmVyIHRvIGRybV9taXBpX2RiaV9wYW5lbF9yZWdpc3Rlcigp
IGFuZCBrZWVwIHRoZSBEUk0KZHJpdmVyIG5hbWUuCgpOb3JhbGYuCgo+IC1EYW5pZWwKPiAKPiAK
Pj4gTm9yYWxmLgo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2EvbWVzYS90cmVlL21hc3Rlci9zcmMvZ2FsbGl1bS93aW5zeXMva21zcm8vZHJtCj4+IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvYmxvYi9tYXN0ZXIvc3JjL2dhbGxp
dW0vdGFyZ2V0cy9kcmkvdGFyZ2V0LmMKPiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
