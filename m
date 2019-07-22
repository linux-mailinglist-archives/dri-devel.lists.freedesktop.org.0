Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3E70557
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A31C89D4A;
	Mon, 22 Jul 2019 16:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350B989D4A;
 Mon, 22 Jul 2019 16:22:54 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id m8so26605570vsj.0;
 Mon, 22 Jul 2019 09:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tYxExvJcnjbj8NmRjZgQaR1vi9UiFQ9lCQ7wBStF2iE=;
 b=KKRmA9VyBA38hHg7by9IIi+PoXHGDv/ZvQ0KvxnMimjL7MRfmm81UVl5ZBI0pAffaf
 akgTQS13wLxtS2Pt6sKN46Pba3erG7kKt002cWf9IrJO02KA5SfS2/aRu766evcyGnwD
 ajvqYqMoZ/omQsoN0EBYHnUMtF4pwzIJ1rYHcGsNSP7sgNEnM0kbJJrUFLWc+h2AaPRd
 mOZm92kbCNw6AaXbDG9Qa0sW7fns5NAKt0QZBCbHGutCpCcXG+fS3I01jWKIsZXsDMV1
 sni8iQe+pQ7XQVpNdkgx55akt/zQJC6tvb8vvT+j8GS94QlvixHJImxuI518ph1G4ymx
 5ssg==
X-Gm-Message-State: APjAAAV95HYS08CwO1PguFDvlf9KcrPPrHTr6JLOfIq0tk9kJ0ydSl91
 8Ud4MYaMZ1lhGiUsoWFHtBooy/u5gAU88kFw0XU=
X-Google-Smtp-Source: APXvYqy4ro3uCRGDD3/sXb5+yk0eVkVPnzyQ2nHNPEyrZG8TiNnU4RCEZrocML9IJ+xTrRWILqgS+habmRJbKgsAFeg=
X-Received: by 2002:a67:eb87:: with SMTP id e7mr42267532vso.118.1563812573311; 
 Mon, 22 Jul 2019 09:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-5-sam@ravnborg.org>
In-Reply-To: <20190720084527.12593-5-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 22 Jul 2019 17:22:29 +0100
Message-ID: <CACvgo51SN0xWcyaNCqBn1Fr8N=+bb2XZRh5__LEyyFF4a2CF5w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/via: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tYxExvJcnjbj8NmRjZgQaR1vi9UiFQ9lCQ7wBStF2iE=;
 b=JgLBJFDyqjxEXT+KHUWAJst0Nfth3VQKv+V1lbM5UxgbPC34YDMme4L2w882pDiLKd
 wmhyxBUxQXDAMr5j3ZkXuWhhckvq5tg8/lheDadgnFKdnxq3F/6dEtXID89ziN7h5qlO
 XX2c6s0fomGj+FwFFr73H3I7agqO+SXrQlZX0hg3ToRevbOuydxKDx4Z1JpdGon76kBe
 yuxJfZ/sLre4anyZ5xmLVx9oZrhc9j3HlM7KIAjhiE2969vSH9EpjGRofOZ3pMfW+cHm
 Ew6N2PHRE8ceqfFuqUJaVRZi7woc58AP1XYL+R/7VIUPB/veRW/GaU+PcczwdRGnl1b/
 dkNw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMCBKdWwgMjAxOSBhdCAwOTo0NiwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIu
Cj4gV2hpbGUgdG91Y2hpbmcgdGhlIGZpbGVzIGRpdmlkZSBpbmNsdWRlIGZpbGVzIGluIGJsb2Nr
cwo+IGFuZCBzb3J0IHRoZSBmaWxlcyBhbHBoYWJldGljYWxseS4KPgo+IHYyOgo+IC0gUmVwbGFj
ZSBhbGwgdXNlcyBvZiBEUk1fV0FJVF9PTigpIHdpdGggVklBX1dBSVRfT04oKQo+ICAgYW5kIHRo
dXMgYXZvaWRpbmcgdG8gcHVsbCBpbiBkcm1fb3NfbGludXguaAo+Cj4gU2lnbmVkLW9mZi1ieTog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBLZXZpbiBCcmFjZSA8a2V2aW5i
cmFjZUBnbXguY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5j
b20+Cj4gQ2M6ICJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4K
PiBDYzogTWlrZSBNYXJzaGFsbCA8aHViY2FwQG9tbmlib25kLmNvbT4KPiBDYzogSXJhIFdlaW55
IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
Pgo+IENjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWEuYyAgICAgIHwgIDkgKysrKysrKystCj4gIGRyaXZlcnMv
Z3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyAgfCAxNyArKysrKysrKysrLS0tLS0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuYyAgICAgIHwgIDcgKysrKystLQo+ICBkcml2ZXJzL2dw
dS9kcm0vdmlhL3ZpYV9pcnEuYyAgICAgIHwgIDggKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfbWFwLmMgICAgICB8ICA2ICsrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlhL3Zp
YV9tbS5jICAgICAgIHwgIDcgKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV92ZXJp
Zmllci5jIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV92aWRlby5j
ICAgIHwgIDUgKysrLS0KPiAgOCBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAyMiBk
ZWxldGlvbnMoLSkKPgpXaXRoIHRoZSBzL0RSTV9XQUlUX09OL1ZJQV9XQUlUX09OLyBiaXRzIG1v
dmVkIHRvIDIvNCwgdGhpcyBwYXRjaCBpcwoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
