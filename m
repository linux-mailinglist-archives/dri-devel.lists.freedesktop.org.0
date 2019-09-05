Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB659AA4F8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70726E0E6;
	Thu,  5 Sep 2019 13:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFC26E0E6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:48:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85DmfxW123274;
 Thu, 5 Sep 2019 08:48:41 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x85Dmf9c103233
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Sep 2019 08:48:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 5 Sep
 2019 08:48:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 5 Sep 2019 08:48:40 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85DmddD090190;
 Thu, 5 Sep 2019 08:48:40 -0500
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <20190904215200.GN5433@pendragon.ideasonboard.com>
 <67eafe69-e947-5572-b29c-f306b792f8ee@ti.com>
 <20190905100524.GF5035@pendragon.ideasonboard.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <de231767-b01e-d099-0bc6-973854d65a44@ti.com>
Date: Thu, 5 Sep 2019 16:48:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905100524.GF5035@pendragon.ideasonboard.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567691321;
 bh=tpFm5bSKbUaDkH7+A35DMf0G/Rpm6D8PcRp9diJd428=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=svbAMS+eMlxbKzvg4vaoYABW7FAvCrVM3N2bM2ycLR9WGV8Sie0/bx163PZDpP92a
 L9zmxsGzaaRgWY2g5q5hk3JWlvCuBm1yEGG61uXPDUT/ZudhEkA4JuZi/7YDwn0ksa
 GVL7+wJo0A3o9Zs8ISwpNUxnS8C5lTWjg+GwQ2wU=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDkvMjAxOSAxMzowNSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBKeXJpLAo+
IAo+IE9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDAxOjAwOjUxUE0gKzAzMDAsIEp5cmkgU2FyaGEg
d3JvdGU6Cj4+IE9uIDA1LzA5LzIwMTkgMDA6NTIsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4+
Pj4+Pj4+ICBzdGF0aWMgdm9pZCBvbWFwX2NydGNfd3JpdGVfY3J0Y19wcm9wZXJ0aWVzKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YykKPj4+Pj4+Pj4gIHsKPj4+Pj4+Pj4gIAlzdHJ1Y3Qgb21hcF9kcm1f
cHJpdmF0ZSAqcHJpdiA9IGNydGMtPmRldi0+ZGV2X3ByaXZhdGU7Cj4+Pj4+Pj4+IEBAIC00MDIs
NyArNDI4LDE2IEBAIHN0YXRpYyB2b2lkIG9tYXBfY3J0Y193cml0ZV9jcnRjX3Byb3BlcnRpZXMo
c3RydWN0IGRybV9jcnRjICpjcnRjKQo+Pj4+Pj4+PiAgCWluZm8uZGVmYXVsdF9jb2xvciA9IDB4
MDAwMDAwOwo+Pj4+Pj4+PiAgCWluZm8udHJhbnNfZW5hYmxlZCA9IGZhbHNlOwo+Pj4+Pj4+PiAg
CWluZm8ucGFydGlhbF9hbHBoYV9lbmFibGVkID0gZmFsc2U7Cj4+Pj4+Pj4+IC0JaW5mby5jcHJf
ZW5hYmxlID0gZmFsc2U7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKwlpZiAoY3J0Yy0+c3RhdGUtPmN0
bSkgewo+Pj4+Pj4+PiArCQlzdHJ1Y3QgZHJtX2NvbG9yX2N0bSAqY3RtID0KPj4+Pj4+Pj4gKwkJ
CShzdHJ1Y3QgZHJtX2NvbG9yX2N0bSAqKSBjcnRjLT5zdGF0ZS0+Y3RtLT5kYXRhOwo+Pj4+Pj4+
PiArCj4+Pj4+Pj4+ICsJCWluZm8uY3ByX2VuYWJsZSA9IHRydWU7Cj4+Pj4+Pj4+ICsJCW9tYXBf
Y3J0Y19jcHJfY29lZnNfZnJvbV9jdG0oY3RtLCAmaW5mby5jcHJfY29lZnMpOwo+Pj4+Pj4+Cj4+
Pj4+Pj4gQXMgYW4gb3B0aW1pc2F0aW9uIGl0IHdvdWxkIGJlIG5pY2UgdG8gb25seSB3cml0ZSB0
aGUgY29lZmZpY2llbnRzIHdoZW4KPj4+Pj4+PiB0aGV5IGFjdHVhbGx5IGNoYW5nZS4gVGhhdCBj
b3VsZCBiZSBpbXBsZW1lbnRlZCBvbiB0b3Agb2YgdGhpcyBzZXJpZXMuCj4+Pj4+Pgo+Pj4+Pj4g
RS5nLiBhcHBseSB0aGlzID8KPj4+Pj4+Cj4+Pj4+PiAtIGlmIChjcnRjLT5zdGF0ZS0+Y3RtKQo+
Pj4+Pj4gKyBpZiAoY3J0Yy0+c3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCAmJiBjcnRjLT5zdGF0
ZS0+Y3RtKQo+Pj4+Pgo+Pj4+PiBTb21ldGhpbmcgbGlrZSB0aGF0LCBidXQgLm1ncl9zZXR1cCgp
IHNob3VsZCB0aGVuIGJlIHRhdWdodCBub3QgdG8gd3JpdGUKPj4+Pj4gdW5jaGFuZ2VkIENUTSB0
YWJsZXMgdG8gcmVnaXN0ZXJzLiBEbyB5b3UgdGhpbmsgaXQgd291bGQgYmUgd29ydGggaXQgPwo+
Pj4+Cj4+Pj4gSG1tbSwgamVzcyBJIHNob3VsZCBkbyBpdCBsaWtlIHRoaXM6Cj4+Pj4gaWYgKGNy
dGMtPnN0YXRlLT5jb2xvcl9tZ210X2NoYW5nZWQpIHsKPj4+PiAJaWYgKGNydGMtPnN0YXRlLT5j
dG0pIHsKPj4+PiAuLi4KPj4+Pj4+Pj4gKwl9IGVsc2Ugewo+Pj4+Pj4+PiArCQlpbmZvLmNwcl9l
bmFibGUgPSBmYWxzZTsKPj4+Pj4+Pj4gKwl9Cj4+Pj4gfQo+Pj4+Cj4+Pj4gVGhpcyB3YXkgdGhl
IHdob2xlIENQUiBmdW5jdGlvbmFsaXR5IGlzIHR1cm5lZCBvZmYsIGlmIHRoZSB0aGVyZSBpcyBu
bwo+Pj4+IENUTSBpbiB0aGUgY3J0YyBzdGF0ZS4KPj4+Cj4+PiBZZXMsIGJ1dCB5b3Ugd291bGQg
YWxzbyBuZWVkIHRvIHVwZGF0ZSAubWdyX3NldHVwKCkgOi0pIEEgbmV3Cj4+PiBjb2xvcl9tZ210
X2NoYW5nZWQgZmxhZyB3b3VsZCBiZSBuZWVkZWQgaW4gdGhlIGluZm8gc3RydWN0dXJlIHRvby4K
Pj4KPj4gSSBhbSBzdGFydGluZyB0byB0aGluZyB0aGF0IHN1Y2ggYW4gIm9wdGltaXphdGlvbiIg
bWF5IG5vdCBiZSB3b3J0aCB0aGUKPj4gYWRkZWQgY29tcGxleGl0eS4gVGhlIGFyaXRobWV0aWMg
YW5kIHdyaXRpbmcgdGhyZWUgcmVnaXN0ZXJzIGlzIG5vdCB0aGF0Cj4+IGNvc3RseSBhbmQgd2Ug
ZG8gbm90IGNvbW1pdCBhIG5ldyBjcnRjIHN0YXRlIHRoYXQgb2Z0ZW4uCj4gCj4gV2UgY2FsbCBv
bWFwX2NydGNfd3JpdGVfY3J0Y19wcm9wZXJ0aWVzKCkgaW4gb21hcF9jcnRjX2F0b21pY19mbHVz
aCgpLAo+IHNvIHRoYXQncyBhdCBldmVyeSBwYWdlIGZsaXAuLi4KPiAKClN0aWxsLCB0aGUgbWdy
X3NldHVwKCkgYWNjZXNzZXMgZml2ZSBkaWZmZXJlbnQgcmVnaXN0ZXJzIGV2ZW4gaWYgd2UgZG8K
bm90IHRvdWNoIENQUiBzZXR0aW5ncyAoYW5vdGhlciA0IHJlZ2lzdGVycykuIEFsbCBvZiB0aG9z
ZSBoYXZlIHN0YXRpYwp2YWx1ZXMgaW4gdGhlIG1haW5saW5lIG9tYXBkcm0gKHRoZXJlIGFyZSBj
dXN0b20gcHJvcGVydGllcyB0byBjb250cm9sCnRob3NlIGluIHRpLWxpbnV4KS4KCkkgd291bGQg
cmF0aGVyIGtlZXAgdGhpcyBwYXRjaCBhcyBpdCBpcyBhbmQgaW1wbGVtZW50IGFub3RoZXIgb25l
IHdpdGggYQpjYWNoZWQgc3RydWN0IG9tYXBfb3ZlcmxheV9tYW5hZ2VyX2luZm8sIHRoYXQgY2Fs
bHMgbWdyX3NldHVwKCkgb25seSBpZgp0aGUgaW5mbyB2YWx1ZXMgaGF2ZSBjaGFuZ2VkLgoKV2l0
aCB0aGUgY2FjaGVkIHZhbHVlcyBpbiBwbGFjZSB0aGUgdW5uZWVkZWQgY29udmVyc2lvbiBhcml0
aG1ldGljIGNhbgphbHNvIGJlIHNraXBwZWQgYmFzZWQgb24gY29sb3JfbWdtdF9jaGFuZ2VkLgoK
QlIsCkp5cmkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
