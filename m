Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBB2AE8A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC15F89819;
	Mon, 27 May 2019 06:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3DB89815;
 Mon, 27 May 2019 06:21:54 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id o5so6378399vsq.4;
 Sun, 26 May 2019 23:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxJhbGCQeRIczqHCGhPIuHhpBpASyG3xpi/UjbzUnfo=;
 b=SdsiSU+hRSYtka1e+G3Iicj1Yrq5HSmJPsMIia63/rjPlp8AtngpJxJLImUdojmNeE
 Cj3jRgeGRzHw5C49b5TzVGy8EnDvGyUz4IKrx0o6kU/9ocwMHV6sw14aANGxvQIeqteO
 EQIWQBxxvCFIINZzZDUzJ19wQv3xQCAUOqr9kxSQX7kGWXnn0D90chwzu1AjeCJ7Tq+S
 T9BMDiIwOKOq6bylOkgIavdK/P+oEQect2Zij+2XLvMCdeJlBYQ1l4OezQxAbEqYyzZu
 MlmeKeHWyEMVtXP7xnkpnwgVnrn/8wmwiEmDiz7+Hu0IIosk/FvaQYSXQ65Jjk7d5D3O
 BgVQ==
X-Gm-Message-State: APjAAAWgygBoE2UrzJn0LVXQ5dVM2izBR9vOLoTBr1xASfq+ZjxW75DT
 cR6m+lLxOdFELzDza7EsqAbPmiK2HvO3pTT7F9OgCg==
X-Google-Smtp-Source: APXvYqx4jqvstv3s86u3H1TOhXAG3iKtpXfUSFrgj79X2sBTuZskLWBOtLjfjwJ4bP8nFFfBhkujuQt1lfgpW6Sn+t0=
X-Received: by 2002:a05:6102:1050:: with SMTP id
 h16mr33145472vsq.132.1558938113452; 
 Sun, 26 May 2019 23:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190524171536.GA20883@embeddedor>
In-Reply-To: <20190524171536.GA20883@embeddedor>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 27 May 2019 16:21:42 +1000
Message-ID: <CACAvsv53mxOyQCyxxAoTkxocMTPedPb5F2orYAM8K_JcPuYGtw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: use struct_size() helper
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YxJhbGCQeRIczqHCGhPIuHhpBpASyG3xpi/UjbzUnfo=;
 b=NDysXy6M9PCmJgS0IeywzxchLf6sY+7dg8ySoS/e/SL3T5KU2od4fBZz/WBReeMKgh
 nqvav4L/pw9U2lc22xl8FfLUb2tYWnLfcqSswbGS+dsl850aaH3v+ibBaUtjvyAhfn2I
 hJ842lR0yQjII3AFJtH0xFEhK/uMWS19Iwwn2tJI+GpLXhewvXsGO3bGMMJrgeE4EA07
 rk4HnB3CBXkfCd4LQK8Jxd0V92ZgxEFJLBxdCF3hyBClHDPbHB6t1oH/+bCnsk7fKsYS
 02vIBmAagz1uQM7zfBfdsJGX0huLwNiCwkdUj50fi8viH3V/ey5iuW+7X19APnKG/ylF
 thig==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyNSBNYXkgMjAxOSBhdCAwMzozNSwgR3VzdGF2byBBLiBSLiBTaWx2YQo8Z3VzdGF2
b0BlbWJlZGRlZG9yLmNvbT4gd3JvdGU6Cj4KPiBNYWtlIHVzZSBvZiB0aGUgc3RydWN0X3NpemUo
KSBoZWxwZXIgaW5zdGVhZCBvZiBhbiBvcGVuLWNvZGVkIHZlcnNpb24KPiBpbiBvcmRlciB0byBh
dm9pZCBhbnkgcG90ZW50aWFsIHR5cGUgbWlzdGFrZXMsIGluIHBhcnRpY3VsYXIgaW4gdGhlCj4g
Y29udGV4dCBpbiB3aGljaCB0aGlzIGNvZGUgaXMgYmVpbmcgdXNlZC4KPgo+IFNvLCByZXBsYWNl
IHRoZSBmb2xsb3dpbmcgZm9ybToKPgo+IHNpemVvZigqa2luZCkgKyBzaXplb2YoKmtpbmQtPmRh
dGEpICogbW11LT5raW5kX25yOwo+Cj4gd2l0aDoKPgo+IHN0cnVjdF9zaXplKGtpbmQsIGRhdGEs
IG1tdS0+a2luZF9ucikKPgo+IFRoaXMgY29kZSB3YXMgZGV0ZWN0ZWQgd2l0aCB0aGUgaGVscCBv
ZiBDb2NjaW5lbGxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3Vz
dGF2b0BlbWJlZGRlZG9yLmNvbT4KVGhhbmtzIQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZpZi9tbXUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZpZi9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252aWYvbW11LmMKPiBpbmRleCBh
ZTA4YTFjYTgwNDQuLjU2NDFiZGEyMDQ2ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmlmL21tdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZpZi9t
bXUuYwo+IEBAIC0xMTAsNyArMTEwLDcgQEAgbnZpZl9tbXVfaW5pdChzdHJ1Y3QgbnZpZl9vYmpl
Y3QgKnBhcmVudCwgczMyIG9jbGFzcywgc3RydWN0IG52aWZfbW11ICptbXUpCj4KPiAgICAgICAg
IGlmIChtbXUtPmtpbmRfbnIpIHsKPiAgICAgICAgICAgICAgICAgc3RydWN0IG52aWZfbW11X2tp
bmRfdjAgKmtpbmQ7Cj4gLSAgICAgICAgICAgICAgIHUzMiBhcmdjID0gc2l6ZW9mKCpraW5kKSAr
IHNpemVvZigqa2luZC0+ZGF0YSkgKiBtbXUtPmtpbmRfbnI7Cj4gKyAgICAgICAgICAgICAgIHNp
emVfdCBhcmdjID0gc3RydWN0X3NpemUoa2luZCwgZGF0YSwgbW11LT5raW5kX25yKTsKPgo+ICAg
ICAgICAgICAgICAgICBpZiAocmV0ID0gLUVOT01FTSwgIShraW5kID0ga21hbGxvYyhhcmdjLCBH
RlBfS0VSTkVMKSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBkb25lOwo+IC0tCj4g
Mi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
