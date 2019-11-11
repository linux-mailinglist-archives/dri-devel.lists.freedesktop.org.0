Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2429F70A4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1966E873;
	Mon, 11 Nov 2019 09:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07236E874
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:26:00 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id l14so10680467oti.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 01:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXoglq2HEGDdo4LOv98irVHAcqDvGXkQImfN2dsHAxE=;
 b=j8UEyq2DHcNHg3KQEWlKBwBt6p47obQMbOAK13eBSZ/W465XjrZ0uREFhlDksAluJr
 PLN89UC4FYvTwyrT7OSOS7SnwTpZ8rnOxtNsoH0JH3+W134KxgpbEFmGo9agOcLecSZK
 ZzYaPVCd7NtR/9XoH4A2PPOurGabuEdeApTU9AhZk9EF1R9EIT9dfBDwGQx+HEdTERYB
 7gedJdpR4Hwlqei5NtB8mGmc6tyuW9xQL8u78R83bcPaxArDlyqfPn5hkjVyA5fnjVvh
 Vn2698FCfHW7Y15EcO7c3/kRRZDGEHLn4bEyFOrrrutqr9hYAU6fuPtL9AlWHH5u6Ceh
 sp2Q==
X-Gm-Message-State: APjAAAUPNns0oSyClRAJGMM60U+RMq4rZxBFUtLYL80apdesNRSnXQkX
 rRD05bnHK8K9OS3KQ9qO3zQ+gcO92xR7mrPeI+bxiA==
X-Google-Smtp-Source: APXvYqyxXGR/GFRfYZMcnGCeseuTt+OcRNUBL1iL//2g5PiPL6hLargtUGGz6VORQifhA3kf1d+EJRnZXG5mSgWYCII=
X-Received: by 2002:a05:6830:1649:: with SMTP id
 h9mr21653844otr.281.1573464359898; 
 Mon, 11 Nov 2019 01:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20191110184055.3979-1-hdegoede@redhat.com>
In-Reply-To: <20191110184055.3979-1-hdegoede@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 11 Nov 2019 10:25:47 +0100
Message-ID: <CAKMK7uEnpH3e+B_4Z5oMTDyJMe=aETUm0C_a7U9mOLPWyVVOew@mail.gmail.com>
Subject: Re: [PATCH] drm: Add DRM_MODE_TYPE_USERDEF flag to probed modes
 matching a video= argument
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YXoglq2HEGDdo4LOv98irVHAcqDvGXkQImfN2dsHAxE=;
 b=HDJXiC7ULpDOuoUO/EpllXMNbYwpRv50/kL2heJFMDJQY9baGdpzzF5yKSl/DeGydg
 wIOVwIIo25eXGBR1JEqUtWQzuw17hn3csIzbCO49u8YKkmAiLjiIGqqhtINO6FxfrACA
 QEO1arSDjmg0L38LTZTt/E8zo1mTOBLSOSrAs=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre=2DT=C3=A9treault?= <alexandretm@amotus.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMTAsIDIwMTkgYXQgNzo0MSBQTSBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IGRybV9oZWxwZXJfcHJvYmVfYWRkX2NtZGxpbmVfbW9kZSgp
IHByZWZlcnMgdXNpbmcgYSBwcm9iZWQgbW9kZSBtYXRjaGluZwo+IGEgdmlkZW89IGFyZ3VtZW50
IG92ZXIgY2FsY3VsYXRpbmcgb3VyIG93biB0aW1pbmdzIGZvciB0aGUgdXNlciBzcGVjaWZpZWQK
PiBtb2RlIHVzaW5nIENWVCBvciBHVEYuCj4KPiBCdXQgdXNlcnNwYWNlIGNvZGUgd2hpY2ggaXMg
YXV0by1jb25maWd1cmluZyB0aGUgbW9kZSBtYXkgd2FudCB0byBrbm93IHRoYXQKPiB0aGUgdXNl
ciBoYXMgc3BlY2lmaWVkIHRoYXQgbW9kZSBvbiB0aGUga2VybmVsIGNvbW1hbmRsaW5lIHNvIHRo
YXQgaXQgY2FuCj4gcGljayB0aGF0IG1vZGUgb3ZlciB0aGUgbW9kZSB3aGljaCBpcyBtYXJrZWQg
YXMgRFJNX01PREVfVFlQRV9QUkVGRVJSRUQuCj4KPiBUaGlzIGNvbW1pdCBzZXRzIHRoZSBEUk1f
TU9ERV9UWVBFX1VTRVJERUYgZmxhZyBvbiB0aGUgbWF0Y2hpbmcgbW9kZSwganVzdAo+IGFzIHdl
IHdvdWxkIGRvIG9uIHRoZSB1c2VyLXNwZWNpZmllZCBtb2RlIHdoZW4gbm8gbWF0Y2hpbmcgcHJv
YmVkIG1vZGUgaXMKPiBmb3VuZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhk
ZWdvZWRlQHJlZGhhdC5jb20+CgpXaWxsIGV4aXN0aW5nIHVzZXJzcGFjZSBkdHJ0IGhlcmUgd2l0
aCB0aGlzPyBTb21lIGxpbmtzIHRvIHBvcHVsYXIKb25lcyB3b3VsZCBiZSBnb29kIChzaW5jZSBl
c3NlbnRpYWxseSB0aGlzIGlzIHVhcGkgZmluZSB0dW5pbmcgd2UgbmVlZAp0aGF0IGFueXdheSku
IFdpdGggdGhhdCB3aWxsIGdldCBteSBhY2suCi1EYW5pbGUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgfCAyICsrCj4gIGluY2x1ZGUvZHJtL2RybV9tb2Rlcy5o
ICAgICAgICAgICAgfCAzICsrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCj4gaW5kZXggZWYy
YzQ2ODIwNWEyLi40ZmVkNjRiZTExZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wcm9iZV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVy
LmMKPiBAQCAtMTU3LDYgKzE1Nyw4IEBAIHN0YXRpYyBpbnQgZHJtX2hlbHBlcl9wcm9iZV9hZGRf
Y21kbGluZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAgfQo+Cj4g
KyAgICAgICAgICAgICAgIC8qIE1hcmsgdGhlIG1hdGNoaW5nIG1vZGUgYXMgYmVpbmcgcHJlZmVy
cmVkIGJ5IHRoZSB1c2VyICovCj4gKyAgICAgICAgICAgICAgIG1vZGUtPnR5cGUgfD0gRFJNX01P
REVfVFlQRV9VU0VSREVGOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0K
Pgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZXMuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9tb2Rlcy5oCj4gaW5kZXggZTk0NmUyMGM2MWQ4Li5jN2VmYjc0ODdlOWIgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZXMu
aAo+IEBAIC0yNTYsNyArMjU2LDggQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgewo+ICAgICAg
ICAgICogIC0gRFJNX01PREVfVFlQRV9EUklWRVI6IE1vZGUgY3JlYXRlZCBieSB0aGUgZHJpdmVy
LCB3aGljaCBpcyBhbGwgb2YKPiAgICAgICAgICAqICAgIHRoZW0gcmVhbGx5LiBEcml2ZXJzIG11
c3Qgc2V0IHRoaXMgYml0IGZvciBhbGwgbW9kZXMgdGhleSBjcmVhdGUKPiAgICAgICAgICAqICAg
IGFuZCBleHBvc2UgdG8gdXNlcnNwYWNlLgo+IC0gICAgICAgICogIC0gRFJNX01PREVfVFlQRV9V
U0VSREVGOiBNb2RlIGRlZmluZWQgdmlhIGtlcm5lbCBjb21tYW5kIGxpbmUKPiArICAgICAgICAq
ICAtIERSTV9NT0RFX1RZUEVfVVNFUkRFRjogTW9kZSBkZWZpbmVkIG9yIHNlbGVjdGVkIHZpYSB0
aGUga2VybmVsCj4gKyAgICAgICAgKiAgICBjb21tYW5kIGxpbmUuCj4gICAgICAgICAgKgo+ICAg
ICAgICAgICogUGx1cyBhIGJpZyBsaXN0IG9mIGZsYWdzIHdoaWNoIHNob3VsZG4ndCBiZSB1c2Vk
IGF0IGFsbCwgYnV0IGFyZQo+ICAgICAgICAgICogc3RpbGwgYXJvdW5kIHNpbmNlIHRoZXNlIGZs
YWdzIGFyZSBhbHNvIHVzZWQgaW4gdGhlIHVzZXJzcGFjZSBBQkkuCj4gLS0KPiAyLjIzLjAKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
