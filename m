Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E979C6B0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539F66E158;
	Mon, 26 Aug 2019 00:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FBA6ED46
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 21:30:16 +0000 (UTC)
Date: Fri, 23 Aug 2019 23:30:09 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Hardcode panel type to DPI
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <1566595809.1871.0@crapouillou.net>
In-Reply-To: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
References: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1566595814; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36+soEXPOoHZNuMMhNbTvqBQTVBS7s8ApVS247CCS8A=;
 b=Tzdft5aKRdLdGOkTI6LN/jBCaNwowyz4jydgh5bziIUihnETeocuou0Cu/3rRBiYzfxpvI
 ep0WcJn6fsnOoHe/Ge0+xX3K+KQVnRbqBDRnY0rIskHoT345vYj4OI0pptWIxyh7rDeXrS
 oaoWaBG3iy/+O0WfU2fsjjjI5pJu4JM=
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

SGkgTGF1cmVudCwKCgpMZSB2ZW4uIDIzIGFvw7t0IDIwMTkgw6AgMjM6MjMsIExhdXJlbnQgUGlu
Y2hhcnQgCjxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IGEgw6ljcml0IDoKPiBU
aGUgaW5nZW5pYyBkcml2ZXIgc3VwcG9ydHMgRFBJIHBhbmVscyBvbmx5IGF0IHRoZSBtb21lbnQs
IHNvIGhhcmRjb2RlCj4gdGhlaXIgdHlwZSB0byBEUEkgaW5zdGVhZCBvZiBVbmtub3duLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KPiAtLS0KPiBQYXVsLCBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1lcmdlZCBp
biB2NS4zLXJjMSwgdGhpcyBpcyBhIGNhbmRpZGF0ZSAKPiBmb3IKPiBhIHY1LjMgZml4LiBLZWVw
aW5nIHRoZSBjb25uZWN0b3IgdHlwZSBhcyB1bmtub3duIGNvdWxkIGNhdXNlIGEKPiB1c2Vyc3Bh
Y2UgZGVwZW5kZW5jeSBvbiBpdCwgcHJldmVudGluZyBpdCBmcm9tIGJlaW5nIGNoYW5nZWQgbGF0
ZXIuCgpNYWtlcyBzZW5zZS4KClJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBv
dWlsbG91Lm5ldD4KCgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9p
bmdlbmljLWRybS5jIAo+IGIvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwo+
IGluZGV4IGNlMWZhZTNhNzhhOS4uMmUyZWQ2NTNlOWM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW5n
ZW5pYy9pbmdlbmljLWRybS5jCj4gQEAgLTY3NSwxMCArNjc1LDkgQEAgc3RhdGljIGludCBpbmdl
bmljX2RybV9wcm9iZShzdHJ1Y3QgCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCXJldHVy
biByZXQ7Cj4gIAl9Cj4gCj4gLQlpZiAocGFuZWwpIHsKPiArCWlmIChwYW5lbCkKPiAgCQlicmlk
Z2UgPSBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkKGRldiwgcGFuZWwsCj4gLQkJCQkJCSAgIERS
TV9NT0RFX0NPTk5FQ1RPUl9Vbmtub3duKTsKPiAtCX0KPiArCQkJCQkJICAgRFJNX01PREVfQ09O
TkVDVE9SX0RQSSk7Cj4gCj4gIAlwcml2LT5kbWFfaHdkZXNjID0gZG1hX2FsbG9jX2NvaGVyZW50
KGRldiwgCj4gc2l6ZW9mKCpwcml2LT5kbWFfaHdkZXNjKSwKPiAgCQkJCQkgICAgICAmcHJpdi0+
ZG1hX2h3ZGVzY19waHlzLAo+IC0tCj4gUmVnYXJkcywKPiAKPiBMYXVyZW50IFBpbmNoYXJ0Cj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
