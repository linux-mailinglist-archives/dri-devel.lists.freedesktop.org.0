Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF30A329B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6DF6E2E3;
	Fri, 30 Aug 2019 08:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7476E090
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:03:39 +0000 (UTC)
Date: Thu, 29 Aug 2019 12:03:32 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Hardcode panel type to DPI
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <1567073012.1884.1@crapouillou.net>
In-Reply-To: <20190827050054.GA22071@ravnborg.org>
References: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
 <1566595809.1871.0@crapouillou.net> <20190827050054.GA22071@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1567073015; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vx/NEjsqNf+Yt1O3XK7J2vs2JGwe77L6TE/DebuJpZs=;
 b=wn8tsVvkGcbGzchoclHedlx9fODYgNRTF8noFZZQCv7ioHzyPGF9Uf+LdNYa//tN3Fybhe
 DcUiOgR54ozwRll4VCHqj036DD4ifD4tdFhgWNexwcSj8FwW+yxPZnvUs/m0tQt0DSf7s7
 kdez7wCD2NBVAAZuhewt+biMk1eG9cg=
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLCBMYXVyZW50LAoKCkxlIG1hci4gMjcgYW/Du3QgMjAxOSDDoCA3OjAwLCBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IGEgw6ljcml0IAo6Cj4gT24gRnJpLCBBdWcgMjMsIDIw
MTkgYXQgMTE6MzA6MDlQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPj4gIEhpIExhdXJl
bnQsCj4+IAo+PiAKPj4gIExlIHZlbi4gMjMgYW/Du3QgMjAxOSDDoCAyMzoyMywgTGF1cmVudCBQ
aW5jaGFydAo+PiAgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gYSDDqWNyaXQg
Ogo+PiAgPiBUaGUgaW5nZW5pYyBkcml2ZXIgc3VwcG9ydHMgRFBJIHBhbmVscyBvbmx5IGF0IHRo
ZSBtb21lbnQsIHNvIAo+PiBoYXJkY29kZQo+PiAgPiB0aGVpciB0eXBlIHRvIERQSSBpbnN0ZWFk
IG9mIFVua25vd24uCj4+ICA+Cj4+ICA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQg
Cj4+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4+ICA+IC0tLQo+PiAgPiBQ
YXVsLCBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1lcmdlZCBpbiB2NS4zLXJjMSwgdGhpcyBpcyBh
IAo+PiBjYW5kaWRhdGUgZm9yCj4+ICA+IGEgdjUuMyBmaXguIEtlZXBpbmcgdGhlIGNvbm5lY3Rv
ciB0eXBlIGFzIHVua25vd24gY291bGQgY2F1c2UgYQo+PiAgPiB1c2Vyc3BhY2UgZGVwZW5kZW5j
eSBvbiBpdCwgcHJldmVudGluZyBpdCBmcm9tIGJlaW5nIGNoYW5nZWQgCj4+IGxhdGVyLgo+PiAK
Pj4gIE1ha2VzIHNlbnNlLgo+PiAKPj4gIFJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVs
QGNyYXBvdWlsbG91Lm5ldD4KPiAKPiBJbiBhbm90aGVyIG1haWwgd2UgZGlzY3VzcyBDT05ORUNU
T1JfUEFORUwuIEJ1dCB3ZSBzaG91bGQgbm90IGhvbGQgdXAKPiBkdWUgdG8gdGhpcy4KPiBSZXZp
ZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IAo+IFBhdWwgLSB3aWxs
IHlvdSBhcHBseSB0byBkcm0tbWlzYy1maXhlcz8KCkkgcHVzaGVkIHRvIGRybS1taXNjLW5leHQg
KEkgaG9wZSB0aGF0J3MgT0sgYW5kIEkgZGlkbid0IHNjcmV3IHVwKSBhbmQgCmFsc28gZHJtLW1p
c2MtZml4ZXMuCgpUaGFua3MsCi1QYXVsCgoKPiAKPiAJU2FtCj4gCj4gCj4+IAo+PiAKPj4gID4K
Pj4gID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMK
Pj4gID4gYi9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4+ICA+IGluZGV4
IGNlMWZhZTNhNzhhOS4uMmUyZWQ2NTNlOWM2IDEwMDY0NAo+PiAgPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCj4+ICA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
bmdlbmljL2luZ2VuaWMtZHJtLmMKPj4gID4gQEAgLTY3NSwxMCArNjc1LDkgQEAgc3RhdGljIGlu
dCBpbmdlbmljX2RybV9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2RldmljZQo+PiAgPiAqcGRl
dikKPj4gID4gIAkJcmV0dXJuIHJldDsKPj4gID4gIAl9Cj4+ICA+Cj4+ICA+IC0JaWYgKHBhbmVs
KSB7Cj4+ICA+ICsJaWYgKHBhbmVsKQo+PiAgPiAgCQlicmlkZ2UgPSBkZXZtX2RybV9wYW5lbF9i
cmlkZ2VfYWRkKGRldiwgcGFuZWwsCj4+ICA+IC0JCQkJCQkgICBEUk1fTU9ERV9DT05ORUNUT1Jf
VW5rbm93bik7Cj4+ICA+IC0JfQo+PiAgPiArCQkJCQkJICAgRFJNX01PREVfQ09OTkVDVE9SX0RQ
SSk7Cj4+ICA+Cj4+ICA+ICAJcHJpdi0+ZG1hX2h3ZGVzYyA9IGRtYV9hbGxvY19jb2hlcmVudChk
ZXYsIAo+PiBzaXplb2YoKnByaXYtPmRtYV9od2Rlc2MpLAo+PiAgPiAgCQkJCQkgICAgICAmcHJp
di0+ZG1hX2h3ZGVzY19waHlzLAo+PiAgPiAtLQo+PiAgPiBSZWdhcmRzLAo+PiAgPgo+PiAgPiBM
YXVyZW50IFBpbmNoYXJ0Cj4+ICA+Cj4+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
