Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894B15E884
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 18:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E37898BE;
	Wed,  3 Jul 2019 16:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC10898BE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 16:14:14 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id d17so2942449oth.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 09:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bnjzXKT5C42NdG96yfqtVA6JW42o/TIC+2l9c2Xe7kc=;
 b=Ien4r1I8/+YB7+LJ7s6uRg2LI8ziTwVasGw1BqI1Qsvd2AAnbhNxlbTAr9/jUg4Q7o
 eOsAoFTq+pMbUBen39nr4KjaqrwOgPJE2lvxP/jSkPk9Hx9UrguP3575ZksnQfeX9Rkb
 g19hB2iQaovLHMIbijmmYKlDOhgAWZq8wFHdmL+3fd39DmHzmXaik+/CTIchPvxKRypb
 FXrBW0ULLGpMWcDz6fw8VHpP9Nll2tZ/CxXoU1aXmQPR1czCtpoCFPJmWTTasI0R5Kw/
 8TdbHRM1qmNr6cPEQLlo/26eBQBFy4BOE4zhkUFEnvakaGYm6GP4cZbxXgzgrYYif7VP
 kzlg==
X-Gm-Message-State: APjAAAUJJnFg4BD3GjEjphSsny2LYrfvZQ/hL2+TJQo2iK3QPJl5ANnd
 25GoxrgOL7OI4Nes4JuwNdvgyG9b3Ai9G7gFznlHDw==
X-Google-Smtp-Source: APXvYqwxXiZEWBdkGzovoqcJfGT9TaOM41i0st1K1F3KXJcvhsEiTLNaABx1VS9MdW1Wg0fB0HOeWBQIgDKYhpjCr0Q=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr2150694otp.106.1562170453368; 
 Wed, 03 Jul 2019 09:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190703150330.21992-1-Liviu.Dudau@arm.com>
 <20190703152120.GI15868@phenom.ffwll.local>
 <20190703155916.GJ17204@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190703155916.GJ17204@e110455-lin.cambridge.arm.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Jul 2019 18:14:00 +0200
Message-ID: <CAKMK7uFjP+gUPR2Jc17L6MRJbo=4v4mm9tiWS3AB7dK8Wdju1A@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_debugfs_crc.c: Document that .verify_crc_source
 vfunc is required for enabling CRC support.
To: Liviu Dudau <Liviu.Dudau@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bnjzXKT5C42NdG96yfqtVA6JW42o/TIC+2l9c2Xe7kc=;
 b=CKZxRL3kg0tWNu7FwCYW8IifuAIjmQdqhEnDW/9mM0oV5i9UkGXr/edvT+JTAvuXVz
 6Ulnu3aEohO2Ln81YcAptITCM5otVdgQEJFlzpsA65QqqtUJBdHg/kTgtJAY7bvPV8ER
 HOdLrCC+t+TntEO/IexXACHjrsmbdeLG6hHrI=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 DRI devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCA1OjU5IFBNIExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBh
cm0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDA1OjIxOjIwUE0gKzAy
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAwNDow
MzozMFBNICswMTAwLCBMaXZpdSBEdWRhdSB3cm90ZToKPiA+ID4gZHJtX2RlYnVnZnNfY3J0Y19j
cmNfYWRkKCkgZnVuY3Rpb24gY2hlY2tzIHRoYXQgYm90aCAuc2V0X2NyY19zb3VyY2UgYW5kCj4g
PiA+IC52ZXJpZnlfY3JjX3NvdXJjZSBob29rcyBhcmUgcHJvdmlkZWQgYmVmb3JlIGVuYWJsaW5n
IGRlYnVnZnMgc3VwcG9ydCBmb3IKPiA+ID4gcmVhZGluZyBwZXItZnJhbWUgQ1JDIGRhdGEuIE1h
a2UgdGhhdCBleHBsaWNpdCBpbiB0aGUgZG9jdW1lbnRhdGlvbi4KPiA+ID4KPiA+ID4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGl2aXUg
RHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPgo+ID4gSSB0aGluayB3ZSBoYXZlIHNv
bWUgcmVmYWN0b3Jpbmcgcm9vbSBoZXJlIGlmIHdlIG1ha2UgdmVyaWZ5X2NyY19zb3VyY2UKPiA+
IG9wdGlvbmFsIChhbmQgb25seSBhbGxvdyAiYXV0byIgZm9yIHRoYXQgY2FzZSkuIEJ1dCB3b3Vs
ZCBvbmx5IHJlbW92ZSBsaWtlCj4gPiAzLTQgaW1wbGVtZW50YXRpb25zLCBzbyBJIGd1ZXNzIHRo
YXQncyBmb3Igd2hlbiB0aGUgbmV4dCB0cml2aWFsIG9uZSBzaG93cwo+ID4gdXAuCj4KPiBJJ20g
cHJlcGFyaW5nIGEgcGF0Y2ggdG8gYWRkIENSQyBzdXBwb3J0IGZvciBLb21lZGEsIGRvZXMgdGhp
cyBtZWFucyBJIG5lZWQKPiB0byBsb29rIGF0IHRoYXQgcmVmYWN0b3Jpbmc/CgpJZiBhbGwgeW91
IGRvIGlzIGFkZCBzdXBwb3J0IGZvciB0aGUgImF1dG8iIHNvdXJjZSwgdGhlbiBJIHRoaW5rIHRo
YXQKd291bGQgYmUgbmljZS4gU2hvdWxkbid0IGJlIHJlYWxseSBtb3JlIHdvcmsgdGhhbiBhbm90
aGVyIGNvcHlwYXN0YQp2ZXJzaW9uLCBhbmQgdGhlbiBpZiB5b3UgZG8gdGhlIDMgb3Igc28gcGF0
Y2hlcyB0byByZW1vdmUgdGhlIGNvcGllcwpmcm9tIGRyaXZlcnMgeW91IGFsc28gaGF2ZSBwZW9w
bGUgeW91IGNhbiB2b2x1bnRlZXIgdG8gcmV2aWV3IHRoZQplbnRpcmUgdGhpbmcgOi0pCi1EYW5p
ZWwKCj4KPiBCZXN0IHJlZ2FyZHMsCj4gTGl2aXUKPgo+Cj4gPiAtRGFuaWVsCj4gPgo+ID4gPiAt
LS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDYgKysrLS0tCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gPiA+IGluZGV4IDdjYTQ4NmQ3NTBl
OS4uNjYwNGVkMjIzMTYwIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnNfY3JjLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5j
Cj4gPiA+IEBAIC02Niw5ICs2Niw5IEBACj4gPiA+ICAgKiB0aGUgcmVwb3J0ZWQgQ1JDcyBvZiBm
cmFtZXMgdGhhdCBzaG91bGQgaGF2ZSB0aGUgc2FtZSBjb250ZW50cy4KPiA+ID4gICAqCj4gPiA+
ICAgKiBPbiB0aGUgZHJpdmVyIHNpZGUgdGhlIGltcGxlbWVudGF0aW9uIGVmZm9ydCBpcyBtaW5p
bWFsLCBkcml2ZXJzIG9ubHkgbmVlZCB0bwo+ID4gPiAtICogaW1wbGVtZW50ICZkcm1fY3J0Y19m
dW5jcy5zZXRfY3JjX3NvdXJjZS4gVGhlIGRlYnVnZnMgZmlsZXMgYXJlIGF1dG9tYXRpY2FsbHkK
PiA+ID4gLSAqIHNldCB1cCBpZiB0aGF0IHZmdW5jIGlzIHNldC4gQ1JDIHNhbXBsZXMgbmVlZCB0
byBiZSBjYXB0dXJlZCBpbiB0aGUgZHJpdmVyIGJ5Cj4gPiA+IC0gKiBjYWxsaW5nIGRybV9jcnRj
X2FkZF9jcmNfZW50cnkoKS4KPiA+ID4gKyAqIGltcGxlbWVudCAmZHJtX2NydGNfZnVuY3Muc2V0
X2NyY19zb3VyY2UgYW5kICZkcm1fY3J0Y19mdW5jcy52ZXJpZnlfY3JjX3NvdXJjZS4KPiA+ID4g
KyAqIFRoZSBkZWJ1Z2ZzIGZpbGVzIGFyZSBhdXRvbWF0aWNhbGx5IHNldCB1cCBpZiB0aG9zZSB2
ZnVuY3MgYXJlIHNldC4gQ1JDIHNhbXBsZXMKPiA+ID4gKyAqIG5lZWQgdG8gYmUgY2FwdHVyZWQg
aW4gdGhlIGRyaXZlciBieSBjYWxsaW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKS4KPiA+ID4g
ICAqLwo+ID4gPgo+ID4gPiAgc3RhdGljIGludCBjcmNfY29udHJvbF9zaG93KHN0cnVjdCBzZXFf
ZmlsZSAqbSwgdm9pZCAqZGF0YSkKPiA+ID4gLS0KPiA+ID4gMi4yMS4wCj4gPiA+Cj4gPgo+ID4g
LS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPgo+IC0tCj4gPT09PT09PT09PT09PT09PT09
PT0KPiB8IEkgd291bGQgbGlrZSB0byB8Cj4gfCBmaXggdGhlIHdvcmxkLCAgfAo+IHwgYnV0IHRo
ZXkncmUgbm90IHwKPiB8IGdpdmluZyBtZSB0aGUgICB8Cj4gIFwgc291cmNlIGNvZGUhICAvCj4g
ICAtLS0tLS0tLS0tLS0tLS0KPiAgICAgwq9cXyjjg4QpXy/CrwoKCgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcg
NDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
