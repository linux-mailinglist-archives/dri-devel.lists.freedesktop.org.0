Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E5A4FC9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0CF8916D;
	Mon,  2 Sep 2019 07:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3723E89C6A
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 12:29:15 +0000 (UTC)
Date: Sat, 31 Aug 2019 14:29:02 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Hardcode panel type to DPI
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <1567254542.1878.0@crapouillou.net>
In-Reply-To: <20190829144650.GC5875@pendragon.ideasonboard.com>
References: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
 <1566595809.1871.0@crapouillou.net> <20190827050054.GA22071@ravnborg.org>
 <1567073012.1884.1@crapouillou.net>
 <20190829144650.GC5875@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1567254549; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxYpy/dOaMqXJl2xI2QT0Lv/OpQBUEmTQ59v+8Nm2aQ=;
 b=IH9QDDTtrARWR8HSZ/3cc9G5cHcxOVKm943J0urgwiW/6KHalSBULFUQFAzN0JLPMlmgsb
 hGawTgQNRS3GnQ5TJjsFn4v8Jw4zfZQEMcSqr8dRt9OJvokMyyY4tD6/9Re0D0Mx5KrsES
 Y1LMGOB10g6mNKCIln5Lwlga6dimTqw=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSBqZXUuIDI5IGFvw7t0IDIwMTkgw6AgMTY6NDYsIExhdXJlbnQgUGluY2hhcnQgCjxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IGEgw6ljcml0IDoKPiBIaSBQYXVsLAo+IAo+
IE9uIFRodSwgQXVnIDI5LCAyMDE5IGF0IDEyOjAzOjMyUE0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwg
d3JvdGU6Cj4+ICBMZSBtYXIuIDI3IGFvw7t0IDIwMTkgw6AgNzowMCwgU2FtIFJhdm5ib3JnIGEg
w6ljcml0IDoKPj4gID4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTE6MzA6MDlQTSArMDIwMCwg
UGF1bCBDZXJjdWVpbCB3cm90ZToKPj4gID4+ICBMZSB2ZW4uIDIzIGFvw7t0IDIwMTkgw6AgMjM6
MjMsIExhdXJlbnQgUGluY2hhcnQgYSDDqWNyaXQgOgo+PiAgPj4+IFRoZSBpbmdlbmljIGRyaXZl
ciBzdXBwb3J0cyBEUEkgcGFuZWxzIG9ubHkgYXQgdGhlIG1vbWVudCwgc28gCj4+IGhhcmRjb2Rl
Cj4+ICA+Pj4gdGhlaXIgdHlwZSB0byBEUEkgaW5zdGVhZCBvZiBVbmtub3duLgo+PiAgPj4+Cj4+
ICA+Pj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCAKPj4gPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPj4gID4+PiAtLS0KPj4gID4+PiBQYXVsLCBhcyB0aGUgZHJp
dmVyIGhhcyBiZWVuIG1lcmdlZCBpbiB2NS4zLXJjMSwgdGhpcyBpcyBhIAo+PiBjYW5kaWRhdGUg
Zm9yCj4+ICA+Pj4gYSB2NS4zIGZpeC4gS2VlcGluZyB0aGUgY29ubmVjdG9yIHR5cGUgYXMgdW5r
bm93biBjb3VsZCBjYXVzZSBhCj4+ICA+Pj4gdXNlcnNwYWNlIGRlcGVuZGVuY3kgb24gaXQsIHBy
ZXZlbnRpbmcgaXQgZnJvbSBiZWluZyBjaGFuZ2VkIAo+PiBsYXRlci4KPj4gID4+Cj4+ICA+PiAg
TWFrZXMgc2Vuc2UuCj4+ICA+Pgo+PiAgPj4gIFJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4KPj4gID4KPj4gID4gSW4gYW5vdGhlciBtYWlsIHdlIGRpc2N1
c3MgQ09OTkVDVE9SX1BBTkVMLiBCdXQgd2Ugc2hvdWxkIG5vdCAKPj4gaG9sZCB1cAo+PiAgPiBk
dWUgdG8gdGhpcy4KPj4gID4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KPj4gID4KPj4gID4gUGF1bCAtIHdpbGwgeW91IGFwcGx5IHRvIGRybS1taXNjLWZpeGVz
Pwo+PiAKPj4gIEkgcHVzaGVkIHRvIGRybS1taXNjLW5leHQgKEkgaG9wZSB0aGF0J3MgT0sgYW5k
IEkgZGlkbid0IHNjcmV3IHVwKSAKPj4gYW5kCj4+ICBhbHNvIGRybS1taXNjLWZpeGVzLgo+IAo+
IEkgKnRoaW5rKiB5b3Ugb25seSBuZWVkZWQgdG8gcHVzaCB0byBkcm0tbWlzYy1maXhlcy4gUHVz
aGluZyB0aGUgc2FtZQo+IHBhdGNoIHRvIGJvdGggd2lsbCBnZW5lcmF0ZSBhIGNvbmZsaWN0IHdo
ZW4gZHJtLW1pc2MtbmV4dCBpcyBtZXJnZWQgCj4gd2l0aAo+IGRybS1taXNjLWZpeGVzICh3aGlj
aCB3aWxsIGhhcHBlbiBpbiBsaW51eC1uZXh0IGZpcnN0LCBhbmQgdGhlbiB3aGVuCj4gTGludXMg
bWVyZ2VzIHRoZSBkcm0tbWlzYy1uZXh0IGJyYW5jaCBpbnRvIGhpcyB0cmVlIGZvciB2NS41KS4K
CkdpdCBpcyBzbWFydCBhbmQgc2hvdWxkbid0IGNvbmZsaWN0IG9uIHRoYXQsIGJ1dCBpZiBpdCBk
b2VzIEkgYXBvbG9naXplLgoKCj4gCj4+ICA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPj4gID4+PiBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L2luZ2VuaWMtZHJtLmMKPj4gID4+PiBpbmRleCBjZTFmYWUzYTc4YTkuLjJlMmVkNjUzZTljNiAx
MDA2NDQKPj4gID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
Cj4+ICA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+PiAg
Pj4+IEBAIC02NzUsMTAgKzY3NSw5IEBAIHN0YXRpYyBpbnQgaW5nZW5pY19kcm1fcHJvYmUoc3Ry
dWN0Cj4+ICA+PiBwbGF0Zm9ybV9kZXZpY2UKPj4gID4+PiAqcGRldikKPj4gID4+PiAgCQlyZXR1
cm4gcmV0Owo+PiAgPj4+ICAJfQo+PiAgPj4+Cj4+ICA+Pj4gLQlpZiAocGFuZWwpIHsKPj4gID4+
PiArCWlmIChwYW5lbCkKPj4gID4+PiAgCQlicmlkZ2UgPSBkZXZtX2RybV9wYW5lbF9icmlkZ2Vf
YWRkKGRldiwgcGFuZWwsCj4+ICA+Pj4gLQkJCQkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9Vbmtu
b3duKTsKPj4gID4+PiAtCX0KPj4gID4+PiArCQkJCQkJICAgRFJNX01PREVfQ09OTkVDVE9SX0RQ
SSk7Cj4+ICA+Pj4KPj4gID4+PiAgCXByaXYtPmRtYV9od2Rlc2MgPSBkbWFfYWxsb2NfY29oZXJl
bnQoZGV2LCAKPj4gc2l6ZW9mKCpwcml2LT5kbWFfaHdkZXNjKSwKPj4gID4+PiAgCQkJCQkgICAg
ICAmcHJpdi0+ZG1hX2h3ZGVzY19waHlzLAo+IAo+IC0tCj4gUmVnYXJkcywKPiAKPiBMYXVyZW50
IFBpbmNoYXJ0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
