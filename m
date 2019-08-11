Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933F89467
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 23:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E959C6E3A8;
	Sun, 11 Aug 2019 21:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EB36E3A8
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 21:32:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AB9CF803E5;
 Sun, 11 Aug 2019 23:32:16 +0200 (CEST)
Date: Sun, 11 Aug 2019 23:32:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: Best practice for embedded code samles? [Was: drm/drv: Use // for
 comments in example code]
Message-ID: <20190811213215.GA26468@ravnborg.org>
References: <20190808163629.14280-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808163629.14280-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=VVlED5B4AAAA:8
 a=e5mUnYsNAAAA:8 a=hR6eB8P5VIS1gKZY23kA:9 a=wPNLvfGTeEIA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDY6MzY6MjhQTSArMDIwMCwgSm9uYXRoYW4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gVGhpcyBpbXByb3ZlcyBTcGhpbnggb3V0cHV0IGluIHR3byB3YXlzOgo+
IAo+IC0gSXQgYXZvaWRzIGFuIHVubWF0Y2hlZCBzaW5nbGUtcXVvdGUgKCcpLCBhYm91dCB3aGlj
aCBTcGhpbnggY29tcGxhaW5lZDoKPiAKPiAgIC8uLi4vRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWlu
dGVybmFscy5yc3Q6Mjk4Ogo+ICAgICBXQVJOSU5HOiBDb3VsZCBub3QgbGV4IGxpdGVyYWxfYmxv
Y2sgYXMgImMiLiBIaWdobGlnaHRpbmcgc2tpcHBlZC4KPiAKPiAgIEFuIGFsdGVybmF0aXZlIGFw
cHJvYWNoIHdvdWxkIGJlIHRvIHJlcGxhY2UgImNhbid0IiB3aXRoIGEgd29yZCB0aGF0Cj4gICBk
b2Vzbid0IGhhdmUgYSBzaW5nbGUtcXVvdGUuCj4gCj4gLSBJdCBsZXRzIFNwaGlueCBmb3JtYXQg
dGhlIGNvbW1lbnRzIGluIGl0YWxpY3MgYW5kIGdyZXksIG1ha2luZyB0aGUKPiAgIGNvZGUgc2xp
Z2h0bHkgZWFzaWVyIHRvIHJlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2No
w6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KClRoZSByZXN1bHQgbG9va3MgbXVjaCBiZXR0
ZXIgbm93IC0gdGhhbmtzLgoKSSB3b25kZXIgaWYgdGhlcmUgaXMgYSBiZXR0ZXIgd2F5IHRvIGVt
YmVkIGEgY29kZSBzYW1wbGUKdGhhbiByZXZlcnRpbmcgdG8gLy8gc3R5bGUgY29tbWVudHMuCgpB
cyB0aGUga2VybmVsIGRvIG5vdCBsaWtlIC8vIGNvbW1lbnRzIHdlIHNob3VsZCB0cnkgdG8gYXZv
aWQgdGhlbSBpbgpleGFtcGxlcy4KCk1hdXJvL0pvbj8KCglTYW0KCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHJ2LmMgfCAxNCArKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwo+IGluZGV4IDlk
MDA5NDdjYTQ0Ny4uNzY5ZmVlZmVlZWVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jCj4gQEAgLTMyOCwxMSAr
MzI4LDkgQEAgdm9pZCBkcm1fbWlub3JfcmVsZWFzZShzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikK
PiAgICoJCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07Cj4gICAqCQlpbnQgcmV0Owo+ICAgKgo+IC0g
KgkJWwo+IC0gKgkJICBkZXZtX2t6YWxsb2MoKSBjYW4ndCBiZSB1c2VkIGhlcmUgYmVjYXVzZSB0
aGUgZHJtX2RldmljZQo+IC0gKgkJICBsaWZldGltZSBjYW4gZXhjZWVkIHRoZSBkZXZpY2UgbGlm
ZXRpbWUgaWYgZHJpdmVyIHVuYmluZAo+IC0gKgkJICBoYXBwZW5zIHdoZW4gdXNlcnNwYWNlIHN0
aWxsIGhhcyBvcGVuIGZpbGUgZGVzY3JpcHRvcnMuCj4gLSAqCQldCj4gKyAqCQkvLyBkZXZtX2t6
YWxsb2MoKSBjYW4ndCBiZSB1c2VkIGhlcmUgYmVjYXVzZSB0aGUgZHJtX2RldmljZSAnCj4gKyAq
CQkvLyBsaWZldGltZSBjYW4gZXhjZWVkIHRoZSBkZXZpY2UgbGlmZXRpbWUgaWYgZHJpdmVyIHVu
YmluZAo+ICsgKgkJLy8gaGFwcGVucyB3aGVuIHVzZXJzcGFjZSBzdGlsbCBoYXMgb3BlbiBmaWxl
IGRlc2NyaXB0b3JzLgo+ICAgKgkJcHJpdiA9IGt6YWxsb2Moc2l6ZW9mKCpwcml2KSwgR0ZQX0tF
Uk5FTCk7Cj4gICAqCQlpZiAoIXByaXYpCj4gICAqCQkJcmV0dXJuIC1FTk9NRU07Cj4gQEAgLTM1
NSw3ICszNTMsNyBAQCB2b2lkIGRybV9taW5vcl9yZWxlYXNlKHN0cnVjdCBkcm1fbWlub3IgKm1p
bm9yKQo+ICAgKgkJaWYgKElTX0VSUihwcml2LT5wY2xrKSkKPiAgICoJCQlyZXR1cm4gUFRSX0VS
Uihwcml2LT5wY2xrKTsKPiAgICoKPiAtICoJCVsgRnVydGhlciBzZXR1cCwgZGlzcGxheSBwaXBl
bGluZSBldGMgXQo+ICsgKgkJLy8gRnVydGhlciBzZXR1cCwgZGlzcGxheSBwaXBlbGluZSBldGMK
PiAgICoKPiAgICoJCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRybSk7Cj4gICAqCj4gQEAg
LTM3MCw3ICszNjgsNyBAQCB2b2lkIGRybV9taW5vcl9yZWxlYXNlKHN0cnVjdCBkcm1fbWlub3Ig
Km1pbm9yKQo+ICAgKgkJcmV0dXJuIDA7Cj4gICAqCX0KPiAgICoKPiAtICoJWyBUaGlzIGZ1bmN0
aW9uIGlzIGNhbGxlZCBiZWZvcmUgdGhlIGRldm1fIHJlc291cmNlcyBhcmUgcmVsZWFzZWQgXQo+
ICsgKgkvLyBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBiZWZvcmUgdGhlIGRldm1fIHJlc291cmNl
cyBhcmUgcmVsZWFzZWQKPiAgICoJc3RhdGljIGludCBkcml2ZXJfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAqCXsKPiAgICoJCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0g
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiBAQCAtMzgxLDcgKzM3OSw3IEBAIHZvaWQg
ZHJtX21pbm9yX3JlbGVhc2Uoc3RydWN0IGRybV9taW5vciAqbWlub3IpCj4gICAqCQlyZXR1cm4g
MDsKPiAgICoJfQo+ICAgKgo+IC0gKglbIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIG9uIGtlcm5l
bCByZXN0YXJ0IGFuZCBzaHV0ZG93biBdCj4gKyAqCS8vIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVk
IG9uIGtlcm5lbCByZXN0YXJ0IGFuZCBzaHV0ZG93bgo+ICAgKglzdGF0aWMgdm9pZCBkcml2ZXJf
c2h1dGRvd24oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICoJewo+ICAgKgkJZHJt
X2F0b21pY19oZWxwZXJfc2h1dGRvd24ocGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldikpOwo+IC0t
Cj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
