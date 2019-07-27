Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8177805
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 11:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5256EE96;
	Sat, 27 Jul 2019 09:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0D96EE96
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 09:56:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 393678032D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 11:56:25 +0200 (CEST)
Date: Sat, 27 Jul 2019 11:56:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: My penguin has blue feets (aka: RGB versus BGR troubles)
Message-ID: <20190727095624.GA25081@ravnborg.org>
References: <20190726203626.GA31474@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726203626.GA31474@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=X4hzUXDqc85gUMRKPU0A:9 a=CjuIK1q_8ugA:10
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLgoKVGhhbmtzIGZvciB0aGUgcmVzcG9uc2VzLgpJdCB0dXJucyBvdXQgdGhpcyB3YXMg
YSBQSUNOSUMgZXJyb3IKKFByb2JsZW0gSW4gQ2hhaXIsIE5vdCBJbiBDb21wdXRlcikKCk9uIEZy
aSwgSnVsIDI2LCAyMDE5IGF0IDEwOjM2OjI2UE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToK
PiBIaSBhbGwuCj4gCj4gVGhlIEF0bWVsIGF0OTFzYW05MjYzIGhhcyBhIG5pY2UgTENEQyBJUCBj
b3JlIHRoYXQgc3VwcG9ydHMgc2V2ZXJhbAo+IGZvcm1hdHM6Cj4gICAgIERSTV9GT1JNQVRfWEJH
Ujg4ODgsIERSTV9GT1JNQVRfQkdSODg4LCBEUk1fRk9STUFUX0JHUjU2NQo+IAo+IChJdCBhbHNv
IHN1cHBvcnRzIGEgcGFsbGV0aXplZCBDOCBmb3JtYXQsIGJ1dCB0aGF0cyBmb3IgbGF0ZXIpLgo+
IAo+IFRoZSBmb3JtYXRzIGFyZSBhbGwgQkdSIGZvcm1hdHMgLSBhbmQgc29tZSBib2FyZHMgYWN0
dWFsbHkgcmV2ZXJzZSBCbHVlCj4gYW5kIFJlZCB3aGVuIHdpcmluZyB1cCB0aGUgZGlzcGxheS4g
SSBoYXZlIGFkZGVkIGEgRFQgcHJvcGVydHkgdG8KPiBpZGVudGlmeSBib2FyZHMgd2l0aCB0aGlz
IGRpZmZlcmVuY2UuCj4gCj4gVGhlIHBlbmd1aW4gc2hvd24gZHVyaW5nIGJvb3Qgb2YgdGhlIGtl
cm5lbCBoYWQgYmx1ZSBmZWV0IHdoaWNoIGlzIGEKPiBjbGVhciBzaWduIHRoYXQgUkVEIGFuZCBH
UkVFTiB3YXMgcmV2ZXJzZWQuCj4gCj4gU28gdG8gZml4IHRoaXMgSSAoZ290IGhlbHAgZnJvbSBp
bWlya2luIG9uIGlyYykgSSBpbXBsbWVudGVkIGEgcXVpcmsuCj4gU2VlIHBhdGNoIGJlbG93Lgo+
IAo+IFdpdGggdGhlIHF1aXJrIGVuYWJsZWQgSSBzZWU6Cj4gLSBwZW5ndWluIHNob3duIGR1cmlu
ZyBrZXJuZWwgYm9vdCBoYXMgeWVsbG93IGZlZXRzIChPSykKPiAtIG1vZGV0ZXN0IHRlbGwgdGhl
IGRyaXZlciByZXBvcnRzOiBYQjI0IEJHMjQgQkcxNiAoYXMgZXhwZWN0ZWQpCj4gLSBtb2RldGVz
dCAtcyBmYWlscyB3aXRoOgo+ICAgICAjIG1vZGV0ZXN0IC1NIGF0bWVsLWxjZGMgLXMgMzQ6ODAw
eDQ4MC02MEh6Cm1vZGV0ZXN0IGRvIG5vdCBsaWtlIHRoZSAiSHoiIHByZWZpeCB3aGVuIHNwZWNp
ZnlpbmcgdGhlIHJlZnJlc2ggcmF0ZS4KV2hlbiBIeiBpcyBhZGRlZCBpdCByZXZlcnRzIGJhY2sg
dG8gWFIyNC4KClNvIHdoZW4gSSB1c2U6CiAgICAjIG1vZGV0ZXN0IC1NIGF0bWVsLWxjZGMgIC1z
IDM0OjgwMHg0ODBAQkcyNAoKVGhlbiBJIHNlZSB0aGUgZXhwZWN0ZWQgb3V0cHV0IHdpdGggdGhl
IHJpZ2h0IGNvbG9ycy4KCkkgYWxzbyBoYWQgZ290IHRoZSBmYWxzZSBpbXByZXNzaW9uIHRoYXQg
aWYgbm8gZm9ybWF0IHdhcyBzcGVjaWZpZWQKbW9kZXRlc3Qgd291bGQgdXNlIHRoZSBmaXJzdCBm
b3JtYXQgcmVwb3J0ZWQgZnJvbSB0aGUgZHJpdmVyLgpUaGlzIHdhcyBvYnZpb3VzbHkgYWxzbyB3
cm9uZy4KClNvIGFsbC1pbi1hbGwgLSBJIGFtIHF1aXRlIGhhcHB5IHdpdGggaG93IHRoaW5ncyB3
b3JrcyBub3cuCk5lZWRzIHRvIGRvIG1vcmUgdGVzdGluZywgcG9saXNoaW5nIGEgZmV3IHBhdGNo
ZXMgYW5kIHRoZW4KSSBjYW4gc2VuZCBvdXQgYSB2MyBvZiB0aGlzIGRyaXZlci4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
