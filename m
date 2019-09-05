Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DDAAEB6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 00:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4436E0CD;
	Thu,  5 Sep 2019 22:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F4C6E0CD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 22:50:12 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c9so4858878qth.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 15:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mt9CnpWDYE9AuIn/hMdu40hiJSofbzdMOkAcHsCIv0A=;
 b=AWtVUTwCC0elvvmbdUh4lZFVMvVa/CpppIFpvb+R0FeFc6XUmnLDZ/XJFp7vE9JkKQ
 DNmX8CEmSuw9q4JVMH1BF4JRhtEnOUviGcc+D8haifPfe3iK2J9gsq7/X6tz1i2W2ebL
 8GjOOsarosmE5+br0ALgF9Ym9aeKZqMZRfw+4FvP3ktnbzzWgC+MqJMZRPf1rEzJ7HNr
 PaEEnzGNdR1XNd9LJQB6YR60HmtIPD+bKH2hIwf6zlZHR/jN+l+eFS52JOy56bnH+Ind
 Rb8+vlgwCImdohZAhgPQGPjsRReGehysIbpRVxUmmfn+jE7IGMY2rPP4TTzu/hiuw7zr
 XeBA==
X-Gm-Message-State: APjAAAVdIEEdKtL159duL52zXnYHCRUcKkCmGuzSKN2lOqnYx+9j7gjZ
 dtML3nun9/xLSmUCrzwcMdz4UDUEv5+KGE/J+HO75Q==
X-Google-Smtp-Source: APXvYqx+KZU9zIaMUMZ+jLWYnGv8HnZ+gqwV0E2600/1VRfMon8nX6vFFavjV+luTwMIWxrqVykRIXpwOLTFiFRi94I=
X-Received: by 2002:ac8:434e:: with SMTP id a14mr6318575qtn.278.1567723810989; 
 Thu, 05 Sep 2019 15:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190830074103.16671-1-bibby.hsieh@mediatek.com>
 <20190830074103.16671-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20190830074103.16671-2-bibby.hsieh@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 6 Sep 2019 06:49:59 +0800
Message-ID: <CANMq1KDUR2cFrQC0NdfvLD=0QDiYoyOTGMf3RWyg5PPSURhGMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: Support CMDQ interface in ddp component
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Mt9CnpWDYE9AuIn/hMdu40hiJSofbzdMOkAcHsCIv0A=;
 b=Vydhvi9xtxhqe5HoBNZPhdiSWovcw1HFQTA8soQuoeVMc6pIcQ5l37oQ3SalYjcgjm
 TrbR2gyQ0J8Z5UPkHYElYPnXXieZeIn8ra2Lk7QRG5pG5hbOY9DVaX9uLAGALyg85Txg
 Es6trlS030XfryZ7vU/40X/oGNBbzuCH/ebqU=
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
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMzo0MSBQTSBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhA
bWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+IFRoZSBDTURRIChDb21tYW5kIFF1ZXVlKSBpbiBNVDgx
ODMgaXMgdXNlZCB0byBoZWxwCj4gdXBkYXRlIGFsbCByZWxldmFudCBkaXNwbGF5IGNvbnRyb2xs
ZXIgcmVnaXN0ZXJzCj4gd2l0aCBjcml0aWNhbCB0aW1lIGxpbWF0aW9uLgo+IFRoaXMgcGF0Y2gg
YWRkIGNtZHEgaW50ZXJmYWNlIGluIGRkcF9jb21wIGludGVyZmFjZSwKPiBsZXQgYWxsIGRkcF9j
b21wIGludGVyZmFjZSBjYW4gc3VwcG9ydCBjcHUvY21kcSBmdW5jdGlvbgo+IGF0IHRoZSBzYW1l
IHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1i
eTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0gW3NuaXBd
Cj4gIHN0YXRpYyB2b2lkIG10a19nYW1tYV9zZXQoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRl
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkK
PiAgewo+IC0gICAgICAgdW5zaWduZWQgaW50IGksIHJlZzsKPiArICAgICAgIHVuc2lnbmVkIGlu
dCBpOwo+ICAgICAgICAgc3RydWN0IGRybV9jb2xvcl9sdXQgKmx1dDsKPiAgICAgICAgIHZvaWQg
X19pb21lbSAqbHV0X2Jhc2U7Cj4gICAgICAgICB1MzIgd29yZDsKPgo+ICAgICAgICAgaWYgKHN0
YXRlLT5nYW1tYV9sdXQpIHsKPiAtICAgICAgICAgICAgICAgcmVnID0gcmVhZGwoY29tcC0+cmVn
cyArIERJU1BfR0FNTUFfQ0ZHKTsKPiAtICAgICAgICAgICAgICAgcmVnID0gcmVnIHwgR0FNTUFf
TFVUX0VOOwo+IC0gICAgICAgICAgICAgICB3cml0ZWwocmVnLCBjb21wLT5yZWdzICsgRElTUF9H
QU1NQV9DRkcpOwo+ICsgICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3Qs
IEdBTU1BX0xVVF9FTiwgY29tcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IERJU1BfR0FNTUFfQ0ZHLCBHQU1NQV9MVVRfRU4pOwo+ICAgICAgICAgICAgICAgICBsdXRfYmFz
ZSA9IGNvbXAtPnJlZ3MgKyBESVNQX0dBTU1BX0xVVDsKPiAgICAgICAgICAgICAgICAgbHV0ID0g
KHN0cnVjdCBkcm1fY29sb3JfbHV0ICopc3RhdGUtPmdhbW1hX2x1dC0+ZGF0YTsKPiAgICAgICAg
ICAgICAgICAgZm9yIChpID0gMDsgaSA8IE1US19MVVRfU0laRTsgaSsrKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgd29yZCA9ICgoKGx1dFtpXS5yZWQgPj4gNikgJiBMVVRfMTBCSVRfTUFT
SykgPDwgMjApICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgoKGx1dFtpXS5n
cmVlbiA+PiA2KSAmIExVVF8xMEJJVF9NQVNLKSA8PCAxMCkgKwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKChsdXRbaV0uYmx1ZSA+PiA2KSAmIExVVF8xMEJJVF9NQVNLKTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICB3cml0ZWwod29yZCwgKGx1dF9iYXNlICsgaSAqIDQpKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3b3JkLCBj
b21wLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGlu
dCkobHV0X2Jhc2UgKyBpICogNCkpOwoKR3VlbnRlciBwb2ludGVkIG91dCB0aGF0IHRoaXMgbG9v
a3MgcXVpdGUgd3JvbmcuIFdlIHNob3VsZCBoYXZlOgp1bnNpZ25lZCBpbnQgbHV0X2Jhc2U7Cmx1
dF9iYXNlID0gRElTUF9HQU1NQV9MVVQ7Cm10a19kZHBfd3JpdGUoY21kcV9wa3QsIHdvcmQsIGNv
bXAsIGx1dF9iYXNlICsgaSAqIDQpOwoKT3IgbW9yZSBzaW1wbHk6Cm10a19kZHBfd3JpdGUoY21k
cV9wa3QsIHdvcmQsIGNvbXAsIERJU1BfR0FNTUFfTFVUICsgaSAqIDQpOwoKPiAgICAgICAgICAg
ICAgICAgfQo+ICAgICAgICAgfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
