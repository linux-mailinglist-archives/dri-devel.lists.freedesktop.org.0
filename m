Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BF56B6B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9536E43C;
	Wed, 26 Jun 2019 13:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57E6E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:59:20 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id m8so1654799vsj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GhqhnPbV/uaLvgnxDhBAxvq0EdyGOb3APouAoDW9+QU=;
 b=FBtUqFSIohKapUtqmYTwwwMb9O4lHetRZ7Zq7w+bUHr3KzeEYmHXIm7fassNrtoPdJ
 BnQ10P2zHqvaOYhd1YLUVi7/WoH2BC8r5ZckxLFsyQA5zbCVoCqIZq8U3cSInay0qkhY
 3QeluJnJjEdcEwKsGhAJnf3ZlLrGslk/GLce2CUBUWDTJl6njm8AO3rnVywCtHsIKDbX
 xKj+LucwuBOF2o9bRiNG+c/F6LEtJIWgmsG90CiW+tlPIIX5zHGF5sLyNV9tc7iPIWpi
 6NbSRNSfMdY6xEqXcyDW7VZcs4x7Hq0fcXQuIV28K4sFHBjIo2VHOF4mKPwoChNB4GnR
 dTSg==
X-Gm-Message-State: APjAAAUzfxGvge5WQgpjWQHAEjJG1kjLo30lmm4rC5Dj2i0cct6BBHzO
 n9ZvidMULkOcd3CXGVEskO7hgUCZ8Nr6zJH55oA=
X-Google-Smtp-Source: APXvYqxuAjJDG+bdy9n3FM2hp4ZvwsWe9K7pSQd2oR9W/Ijnwn8Ym2UBNMjNYv2Lhl6c4nNu+z6GG0yXNGLImk5/sec=
X-Received: by 2002:a67:7fd8:: with SMTP id a207mr3044275vsd.85.1561557559497; 
 Wed, 26 Jun 2019 06:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190425031842.17202-1-jerry.han.hq@gmail.com>
 <20190626125507.GC23428@ravnborg.org>
In-Reply-To: <20190626125507.GC23428@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 26 Jun 2019 14:59:42 +0100
Message-ID: <CACvgo50Rm_OLXDMjw32p=yxm24Xu+TG6YYK78PczrHWRqGkVLg@mail.gmail.com>
Subject: Re: [PATCH] [v8, 1/2] dt-bindings: panel: Add Boe Himax8279d is
 1200x1920, 4-lane MIPI-DSI LCD panel
To: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GhqhnPbV/uaLvgnxDhBAxvq0EdyGOb3APouAoDW9+QU=;
 b=P6l8lWDvN5isnCzXTrG0snp+OTaLxMM0Cc8/R4njOfXBjhSYcDRdw0gQ5fDHs4VCc5
 oM6GfQtEe1Zg56vDjH3sBW3fJLUOTY2GdO0itdp5JshwK9ogSm+FsYjZg3byV5V/hazO
 FdeZmRUp8iCQu1TmAsqeaS7keIC7bcNd6ksdy4nrMauyh0cyPLJzFsKIVB8OLiY6vcVZ
 xUotsuMYkDj+ljbnE2y6nDXDKNB9nYhsO/2DtZXV2LuZCmI0KOYlmk0aIS1AJZWPzRnb
 HmbnDPLQkPYErfudkBIBDvMarKRqU8an9hpGManl7KhOtg+mz9K0XOJJ1cwtRST0WQhk
 YiAQ==
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
Cc: Jerry Han <jerry.han.hq@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rock wang <rock_wang@himax.com.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBKdW4gMjAxOSBhdCAxMzo1NSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDExOjE4OjQyQU0gKzA4MDAs
IEplcnJ5IEhhbiB3cm90ZToKPiA+IFRoZSBCb2UgSGltYXg4Mjc5ZCBpcyBhIDguMCIgcGFuZWwg
d2l0aCBhIDEyMDB4MTkyMCByZXNvbHV0aW9uIGFuZAo+ID4gY29ubmVjdGVkIHRvIERTSSB1c2lu
ZyBmb3VyIGxhbmVzLgo+ID4KPiA+IFY4Ogo+ID4gLSBNb2RpZnkgY29tbXVuaWNhdGlvbiBhZGRy
ZXNzCj4gPgo+ID4gVjc6Cj4gPiAtIEFkZCB0aGUgaW5mb3JtYXRpb24gb2YgdGhlIHJldmlld2Vy
Cj4gPgo+ID4gVjY6Cj4gPiAtIEFkZCB0aGUgaW5mb3JtYXRpb24gb2YgdGhlIHJldmlld2VyCj4g
Pgo+ID4gVjU6Cj4gPiAtIEFkZGVkIGNoYW5nZWxvZwo+ID4KPiA+IFY0Ogo+ID4gLSBOb25lCj4g
Pgo+ID4gVjM6Cj4gPiAtIE5vbmUKPiA+Cj4gPiBWMjoKPiA+IC0gQWRkIGNvbXBhdGlibGUgZGV2
aWNlICJib2UsaGltYXg4Mjc5ZDEwcCIgKFNhbSkKPiA+IC0gQWRkIHRoZSBuZWNlc3NhcnkgcHJv
cGVydHkgZGVzY3JpcHRpb25zIChTYW0pCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmVycnkgSGFu
IDxqZXJyeS5oYW4uaHFAZ21haWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vo
b3JlQGNocm9taXVtLm9yZz4KPiA+IENjOiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5j
b20+Cj4gPiBDYzogUm9jayB3YW5nIDxyb2NrX3dhbmdAaGltYXguY29tLmNuPgo+Cj4gVGhhbmtz
LAo+IHBhdGNoIGFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCBhbmQgd2lsbCBiZSBwdXNoZWQgb3V0
IHNvb24uCj4KSXNuJ3QgYW4gYWNrL3JiIGZyb20gYSBEVCBtYWludGFpbmVyIGEgcmVxdWlyZW1l
bnQgYmVmb3JlIGJlaW5nIHBpY2tlZAp2aWEgdGhlIERSTSB0cmVlcz8KSXQgdXNlZCB0byBiZSBh
IHRoaW5nLCBhbHRob3VnaCBpdCBjb3VsZCBoYXZlIGNoYW5nZWQgcmVjZW50bHkuCgpBRkFJQ1Qg
dGhlcmUgYXJlIG5vIHVzZXJzIGZvciB0aGlzIGJpbmRpbmcsIHlldCBJJ20gbm90IHN1cmUgaWYg
dGhhdAppcyBhIHJlcXVpcmVtZW50LgoKUm9iIEgsIGNhbiB5b3UgcGxlYXNlIHNoYXJlIHNvbWUg
bGlnaHQ/ClBlcmhhcHMgaXQncyB3b3J0aCBkb2N1bWVudGluZyB0aGVzZSBzb21ld2hlcmUgdW5k
ZXIgRG9jdW1lbnRhdGlvbi8KYW5kIGFkZGluZyBhIGxpbmsgdG8gdGhvc2UgaW4gdGhlIERSTSBk
b2N1bWVudGF0aW9uLgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
