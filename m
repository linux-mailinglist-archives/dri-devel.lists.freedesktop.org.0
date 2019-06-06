Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E737BD5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 20:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6708D89186;
	Thu,  6 Jun 2019 18:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC95C89186
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:06:41 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id q26so846081lfc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UEd66WheiI8yyTRsEa+z8oLhtOyljtbH2T2dZCHUna8=;
 b=seqaZyaDD532czcNBOQ0/Z8vrgxy5Ru30j9KmIbfmeUSWVQFEQOpUGyAPEbqheGeVA
 ephrDtSbZ22I4ndd5JtvRo6QcwvfqXUn/WKkR3xtkcHtjPQUnNGTqnwLO2jIXk0uCQ58
 yinGlzeZYV9QKzYpKz+TrMTEmkgnsaQkCNP4UnY2mN+BYPGAeRPZScLKfTRcclBDtVuB
 BC0X7+UowfhLmcKpOksCFGMy3TklZjUenjEmv2/y1HrvlsqBIRjLC5V20N1Bqzl2SvLr
 8nsTe7kZ5bcS0JLzvIB71BdeRSsjHeYPUteE6C5qHFc0d1QUONltgMnmxMB6HqhuO0xp
 yNlQ==
X-Gm-Message-State: APjAAAWvaXp6/e0Ws0hd/IwFymCxoQACQzfASwsDpWn5c49V9tdN4//h
 AjbP8k+/odUsBlRjMzoxuxAP0BSeQL50EeSsdvrI1A==
X-Google-Smtp-Source: APXvYqw2DQ1hkk9NGbrMoCpxPWvvSrGluX46vvZioEEIXVAu80TMiNPQs4dgaO2PEUOJN7DoCJlk4qvMl+vqvSMGZvQ=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr414494lfp.90.1559844400270;
 Thu, 06 Jun 2019 11:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jun 2019 20:06:28 +0200
Message-ID: <CAMuHMdXcsxnqxpQLundZq9rCTHBTN4bP4gSpUrYBCOP8NN7TXQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVGh1LCBKdW4gNiwgMjAxOSBhdCA0OjIxIFBNIEphY29wbyBNb25kaSA8
amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4gd3JvdGU6Cj4gQWRkIGRldmljZSB0cmVlIGJpbmRp
bmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFItQ2FyIERpc3BsYXkKPiBVbml0IENv
bG9yIE1hbmFnZW1lbnQgTW9kdWxlLgo+Cj4gQ01NIGlzIHRoZSBpbWFnZSBlbmhhbmNlbWVudCBt
b2R1bGUgYXZhaWxhYmxlIG9uIGVhY2ggUi1DYXIgRFUgdmlkZW8KPiBjaGFubmVsIG9uIEdlbjIg
YW5kIEdlbjMgU29DcyAoVjNIIGFuZCBWM00gZXhjbHVkZWQpLgoKUi1DYXIgR2VuMiAuLi4KCj4g
U2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoK
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmQ4ZDNjZjljZTJj
ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKPiBAQCAtMCwwICsxLDI1IEBACj4gKyogUmVuZXNh
cyBSLUNhciBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAoQ01NKQo+ICsKPiArUmVuZXNhcyBSLUNh
ciBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgY29ubmVjdGVkIHRvIFItQ2FyIERVIHZpZGVvIGNo
YW5uZWxzLgo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArIC0gY29tcGF0aWJsZTogc2hh
bGwgYmUgb25lIG9mOgo+ICsgICAtICJyZW5lc2FzLGNtbS1nZW4zIgo+ICsgICAtICJyZW5lc2Fz
LGNtbS1nZW4yIgoKImdlbjMiIGFuZCAiZ2VuMiIgZG9uJ3QgY2FycnkgbXVjaCBtZWFuaW5nIG9u
IHRoZWlyIG93biAoU0gyIGlzIGdlbjIgb2YKU3VwZXJIPykuIEZ1cnRoZXJtb3JlLCByZXZpc2lv
biBpbmZvIHNob3VsZCBpbW1lZGlhdGVseSBmb2xsb3cgdGhlIGNvbW1hLgoKInJlbmVzYXMscmNh
ci1nZW4zLWNtbSIgYW5kICJyZW5lc2FzLHJjYXItZ2VuMi1jbW0iPwoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
