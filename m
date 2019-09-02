Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6ACA5BD0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 19:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CF489856;
	Mon,  2 Sep 2019 17:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD7389856
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 17:25:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h3so6687625ljb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 10:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=62vTxUHgE/OMxm3gMKaNUf3+MK+BhlnsjFDAmMOxaUk=;
 b=M/n7XeqRBQXVObXzOavRORWJwUpE6eweHN1+2E0QwpKzZOI3nuYCQhJ3cUt4WYDZMG
 jFzOHYHelmqT6g81fbBbaqEZHB0KaB8CQgkcxoxwAOQisfKrcSFZcz16cUr45C380IrN
 U2l+qQzqQ9C0MwREGp/wbaCRfsxy4J4Yq/BTlKxzShLhkJNidpFPjyGGJoAxjuBwSaaz
 9yhwlcewpy7eBkstbTDVL9fMzDPh/Q9FnbuMMZooVmEXZ5G2zmPkZ/KZ+1qh8hvfHTwq
 gAwUKzFLFQJ5HlyAFjyuSQtYS26BzB63MHBu1N2qd5abkKB6KsPIPs3S70/9hQzky1bP
 lJFg==
X-Gm-Message-State: APjAAAUDSUiD0vu7qZf7uR69Do57Co1S8y0exTdUs1gjEN2puDZbtW1W
 Hg6qvXVPVtzhY2A0EGBovwZBldGGSQ1WVYcWWdtvbyg4hhZIMA==
X-Google-Smtp-Source: APXvYqzE0sqSgi57ksg2TZl9KBZdsOK2CTw3IlMW9NN32MHrSaXraK9MsW5Edi7mh4UpqysP0Bx+3Bzc4cgWD8olEg0=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr16987380lji.37.1567445151833; 
 Mon, 02 Sep 2019 10:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902093517.GA12946@ulmo>
 <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
 <20190902144006.GB1445@ulmo>
In-Reply-To: <20190902144006.GB1445@ulmo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2019 19:25:40 +0200
Message-ID: <CACRpkdb6+aqj8A_JDHc82O17dVx9KjHPi-iCK_AjFMda0miChw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=62vTxUHgE/OMxm3gMKaNUf3+MK+BhlnsjFDAmMOxaUk=;
 b=gMaxh1HdAtK9R8ch98/m+Hr3Ioxn4cG1qi4Z622Rb8Ol7eHjh8nv0g8koqSZ5TxLDh
 qQzspGxQG4Sn8WpUvKJnpMWKddfCI5ioZuS60AzDPEzXDfYHAA98vv4naI0sGEf0fSpt
 Ej1/n8tm6Rg2xaBaQv7xubFSucmLRPALHpkIIn7QVUhroJ6H0KNDkZOvHBYg7ofGoVfd
 ukhV2I5JXYaca9FWs9UNDQK4XWHAHyNj9dftbjXXaYQukFNg7tCV6dTDiqdz2n/XcIBA
 AH49JFDerV9aY4dhpGyFnxyrU+XuRJYjiiLdx7XG/X/5rm2AbIlUxwMyPCmEl5OCzAyS
 Cm7A==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMiwgMjAxOSBhdCA0OjQwIFBNIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJl
ZGluZ0BnbWFpbC5jb20+IHdyb3RlOgoKPiBIbS4uLiBteSByZWNvbGxlY3Rpb24gaXMgdGhhdCBj
b21tYW5kIG1vZGUgaXMgb25seSBzdXBwb3J0ZWQgb24gInNtYXJ0Igo+IHBhbmVscyB0aGF0IGhh
dmUgYW4gaW50ZXJuYWwgZnJhbWVidWZmZXIuIFNvIHRoZSBjb21tYW5kcyBhY3R1YWxseQo+IGlu
c3RydWN0IHRoZSBwYW5lbCB0byB1cGRhdGUgdGhlaXIgaW50ZXJuYWwgZnJhbWVidWZmZXIsIHdo
aWNoIG1lYW5zIHlvdQo+IGNhbiB0ZWNobmljYWxseSBzd2l0Y2ggb2ZmIHRoZSBkaXNwbGF5IGVu
Z2luZSB3aGVuIHRoZXJlIGFyZSBubyB1cGRhdGVzLgoKVGhhdCBpcyBteSB1bmRlcnN0YW5kaW5n
IGFzIHdlbGwuCgo+IFVuZGVyIHRob3NlIGNpcmN1bXN0YW5jZXMgSSB0aGluayBpdCdkIG1ha2Ug
c2Vuc2UgdG8gZGVmYXVsdCB0byBjb21tYW5kCj4gbW9kZSBpZiBib3RoIHRoZSBwYW5lbCBhbmQg
dGhlIGhvc3Qgc3VwcG9ydCBpdCBhbmQgc3RpY2sgd2l0aCB2aWRlbyBtb2RlCj4gaWYgZm9yIGV4
YW1wbGUgdGhlIGhvc3QgY2FuJ3QgZG8gY29tbWFuZCBtb2RlLgoKTWFrZXMgc2Vuc2UgdG8gbWUu
CgpNYXliZSB3ZSBzaG91bGQgcmF0aGVyIGhhdmUgYSBnZW5lcmljIHNldHRpbmcgbGlrZToKZHNp
LWVuZm9yY2UtdmlkZW8tbW9kZTsKYW5kIHRoZSBkZWZhdWx0IGFsd2F5cyBiZWluZyBjb21tYW5k
IG1vZGUsIGlmCndlIGhhdmUgY29uc2Vuc3VzIHRoYXQgY29tbWFuZCBtb2RlIHNob3VsZCBhbHdh
eXMKYmUgcHJlZmVycmVkLgoKPiBPciBwZXJoYXBzIHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgY291
bGQgYmUgc2V0IGZyb20gc29tZSB1c2Vyc3BhY2UKPiBwb2xpY3kgbWFrZXIgdmlhIGEgY29ubmVj
dG9yIHByb3BlcnR5PyBBIGNvbXBvc2l0b3IgZm9yIGluc3RhbmNlIHdvdWxkCj4gaGF2ZSBhIHBy
ZXR0eSBnb29kIGlkZWEgb2Ygd2hhdCBraW5kIG9mIGFjdGl2aXR5IGlzIGdvaW5nIG9uLCBzbyBp
dAo+IGNvdWxkIGF0IHNvbWUgcG9pbnQgZGVjaWRlIHRvIHN3aXRjaCBiZXR3ZWVuIHZpZGVvIG1v
ZGUgYW5kIGNvbW1hbmQgbW9kZQo+IGlmIG9uZSBvZiB0aGVtIGlzIG1vcmUgYXBwcm9wcmlhdGUg
Zm9yIHRoZSBnaXZlbiB3b3JrbG9hZC4KCkl0J3MgcHJvYmFibHkgbW9yZSB0aGF0IHVzZXJzcGFj
ZSBzaG91bGQgYmUgbWFkZSBhd2FyZSBvZiB0aGUKZmFjdCB0aGF0IHdlIGhhdmUgcGFydGlhbCB1
cGRhdGVzLCBhbmQgaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGF0CmlzIGRvbmUgYnkgZGly
dHlyZWN0L2RhbWFnZSBBUEkgaW4KZHJtX2RhbWFnZV9oZWxwZXIuYwoKKFZlcnkgbmljZSBvdmVy
dmlldyBkb2MgYXQgdGhlIHRvcCBvZiB0aGUgZmlsZSEpCgpUaGUgZHJpdmVyIGVuYWJsZXMgZGFt
YWdlIGJ5IGNhbGxpbmcKZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoKQp0aGVuIGlu
IHRoZSAudXBkYXRlKCkgY2FsbGJhY2sgdXNlcyBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVy
Z2VkKCkKdG8gZmlndXJlIG91dCBkYW1hZ2VkIHJlY3RhbmdsZXMgYW5kIHVwZGF0ZSB0aG9zZSB3
aXRoIHNwZWNpYWwKY29tbWFuZHMuCgp0aW55ZHJtL2lsaTkyMjUuYyBpcyBhIHByZXR0eSBjbGVh
biBleGFtcGxlIG9mIGEgZHJpdmVyCmFjdHVhbGx5IGRvaW5nIHRoaXMuIFRoZXJlIGFyZSBub3Qg
bWFueSBvZiB0aGVtLgoKPiBDb21tYW5kIG1vZGUgY2FuIGFsc28gYmUgdXNlZCB0byBkbyBwYXJ0
aWFsIHVwZGF0ZXMsIGlmIEkgcmVtZW1iZXIKPiBjb3JyZWN0bHksIHdoaWNoIGFnYWluIHdvdWxk
IG1ha2UgaXQgcG9zc2libGUgZm9yIGEgY29tcG9zaXRvciB0byBzZW5kCj4gb25seSBhIHN1YnNl
dCBvZiBhIHNjcmVlbiB1cGRhdGUuCgpJbmRlZWQsIHdobyBuZWVkcyBhIGJsaXR0ZXIgd2hlbiB5
b3UgY2FuIGp1c3QgdXBkYXRlIHRoZQpkaXJ0eXJlY3RzLgoKSXQgaXMgYSBiaXQgdGVyc2UgYnV0
IGludHVpdGl2ZWx5IEkgZmVlbCB0aGF0IHRoZSBkYW1hZ2UgaW50ZXJmYWNlIGlzIHdoYXQKdXNl
cnNwYWNlIHNob3VsZCB1c2UsIHRoZW4gRFJNIHNob3VsZCBiZSBhYmxlIHRvIGluZmVyIHRoYXQg
YQpkYW1hZ2VkIHJlY3RhbmdsZSBjYW4gYmUgdXBkYXRlZCBvbiB0aGUgZGlzcGxheSwgYW5kIHRo
ZQpkaXNwbGF5IGNvbnRyb2xsZXIgbmVlZCB0byBhbm5vdW5jZSB0aGF0IGl0IGNhbiBoYW5kbGUg
dGhlc2UKcGFydGlhbCB1cGRhdGVzLgoKVGhpcyByZXF1aXJlcyB0aGF0IHRoZSBkaXNwbGF5IGNv
bnRyb2xsZXIgY2FuIGdlbmVyYXRlIHN1Y2gKY29tcGxleCBjb21tYW5kIHN0cmVhbXMgaW4gcmVz
cG9uc2UgdG8KZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZCgpCm9mIGNvdXJzZSwgZnJv
bSBhIERTSSBwcm90b2NvbApsZXZlbCBpdCBpcyBzdXBwb3J0ZWQsIGJ1dCB3ZSBhcmUgbm90IHdy
aXRpbmcgdGhlc2UgY29tbWFuZApzZXF1ZW5jZXMgd2l0aCBzb2Z0d2FyZSwgdGhleSBhcmUgZ2Vu
ZXJhdGVkIGJ5IGhhcmR3YXJlLgoKU28gdGhlIGRpc3BsYXkgY29udHJvbGxlciBEU0kgcG9ydGlv
bnMgbXVzdCBiZSBhYmxlIHRvIHNlbmQKaW5kaXZpZHVhbCByZWN0YW5nbGVzIGFzIHdlbGwuCgpC
dXQgdGhpcyBpcyBhbGwgc2NpZW5jZSBmaWN0aW9uLiBXaGF0IGFsbCBEU0kgZGlzcGxheSBjb250
cm9sbGVycwppbiBtYWlsaW5lIGRvIHRvZGF5IChJIHRoaW5rKSBpcyB0byBzaW1wbHkgc2NhbiBv
dXQgdGhlIHdob2xlCmZyYW1lYnVmZmVyIGNvbnRpbm91c2x5IHdpdGggYSB2YmxhbmsgVEUgSVJR
IHRvIGF2b2lkIHRlYXJpbmcuCgpBbmRyemVqIGtub3dzIGZvciBzdXJlIHdoYXQgaXMgb3V0IHRo
ZXJlIEkgdGhpbmsuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
