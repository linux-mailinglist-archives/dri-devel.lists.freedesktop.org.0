Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51BE135E5D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F165F6E91E;
	Thu,  9 Jan 2020 16:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056996E91E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 16:34:05 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w30so5149127qtd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 08:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1y196/fnbEpnC9sIv+FxPS9US7j6TCqpE/hgHgeZN80=;
 b=EhEf2Ypd4dMBZL1Z4eZQUoeoV1U/sfXOUNMlTk4oE2ubSg61VXz6zmuEgcWWwsmB+J
 4J6HAPRoVsWWYJOFUxJk9ytcjgQULw+3vyUeU6CqlrluWB8XDJ6jM21AvFyzDL3tjNXH
 KfJ/hs7ieC+9nuZBKUxFfBBywnXjZksJ/xH6+nNA3q2db4/Qt4xj723DkuY5Bg9mq7PK
 yLOw9G7pSPhxDmIaBlfbb8l+eayJyYWZaWFYWj14m7ObLCal1BC92/pOB7Ygm+4xMITK
 W+o35n+tcdTqpW555uSrmszyURHyA/vInaYt/U4aw2272ihdC0Oz8XbirSqxxuXOwHnQ
 K6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1y196/fnbEpnC9sIv+FxPS9US7j6TCqpE/hgHgeZN80=;
 b=M/KijeecCZ2DJCI+DFoGk1AveQztW4PDGzouRh5DjSurJaOZZkBZrWIl6Y8oqsqoH/
 QUsU5s0RwVNO7Vgo0rIu/8hXCLjaL83bm4gnavAedtsH/qsxqW2DuXGR+JC12BPjcMWD
 FqsqgWWmjsj3uWem5wVDr5NJ1cDK2QTPKU0i5h/BwykaV+fFvbWIriznNe4ctR5vScjF
 Q9i6sE4P7IOEX2JmLCJEwjD95fwEgz1MpR5SaahmATubUgm3QSpjTJ4nCU+2/Y0cjKxB
 aKA36fJ1Lvyfw8no3ND4/yJe9REBFFdsoBWBirm+eD5qV11Ufmup/LwcgeXqW1PkxpEc
 0Qvw==
X-Gm-Message-State: APjAAAW6fVttQTTH+jRS0cmYdxLEHy6i8Yk1MyIvYXTpRFR6BImU1qbH
 bhLkcOjDprv0fkXHZamNPIgzcZlSUQLa/QHCqmQdTQ==
X-Google-Smtp-Source: APXvYqxidMsdaPP4lby56x2DJB/wrUu01RgG4Ruw+w38dqIgvpt/xG0nzmnXjBgDvkhYqRbjZLO1BxdtoV/O6qzpccA=
X-Received: by 2002:ac8:33ab:: with SMTP id c40mr8822381qtb.250.1578587644018; 
 Thu, 09 Jan 2020 08:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20191119105753.32363-1-benjamin.gaignard@st.com>
 <CA+M3ks7C+_B+4Jxy+55bFoWct7j=WseoPKxxh7KLOZ0LhEUL7Q@mail.gmail.com>
 <17fdbb6a-493d-d47c-9acf-3c79032359b0@st.com>
In-Reply-To: <17fdbb6a-493d-d47c-9acf-3c79032359b0@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 9 Jan 2020 17:33:53 +0100
Message-ID: <CA+M3ks5d9Vjw6kF1YsJVnx1HDOpvNiuMQUGgANfjd=XDohpjfA@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-cma-helpers: Fix include issue
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiA5IGphbnYuIDIwMjAgw6AgMTc6MjksIEJlbmphbWluIEdBSUdOQVJECjxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+IGEgw6ljcml0IDoKPgo+Cj4gT24gMTIvMy8xOSA1OjQ5IFBNLCBC
ZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IExlIG1lci4gMjAgbm92LiAyMDE5IMOgIDAwOjI4
LCBCZW5qYW1pbiBHYWlnbmFyZAo+ID4gPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4gYSDDqWNy
aXQgOgo+ID4+IEV4cG9ydGVkIGZ1bmN0aW9ucyBwcm90b3R5cGVzIGFyZSBtaXNzaW5nIGluIGRy
bV9mYl9jbWFfaGVscGVyLmMKPiA+PiBJbmNsdWRlIGRybV9mYl9jbWFfaGVscGVyIHRvIGZpeCB0
aGF0IGlzc3VlLgo+ID4+Cj4gPiBHZW50bGUgcGluZyB0byByZXZpZXdlcnMuCj4gPiBUaGFua3Ms
Cj4gPiBCZW5qYW1pbgo+Cj4gSSBrbm93IHRoYXQgcmVtb3Zpbmcgd2FybmluZ3MgaXMgbm90IGEg
c2V4eSB0YXNrLCBidXQgcmV2aWV3ZXJzIGFyZSB3ZWxjb21lLgoKQXBwbGllZCBvbiBkcm0tbWlz
Yy1uZXh0LCB3aXRoIFRob21hcyBhY2sgZXZlbiBpZiBkcmkgcGF0Y2h3b3JrIGRvZXNuJ3Qgc2hv
dyBpdC4KClRoYW5rcwpCZW5qYW1pbgoKPgo+IFRoYW5rcywKPgo+IEJlbmphbWluCj4KPiA+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0
LmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5j
IHwgMSArCj4gPj4gICBpbmNsdWRlL2RybS9kcm1fZmJfY21hX2hlbHBlci5oICAgICB8IDIgKysK
PiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2NtYV9oZWxwZXIuYwo+ID4+IGluZGV4IGMwYjBmNjAzYWY2My4uOTgwMWMwMzMz
ZWNhIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5j
Cj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKPiA+PiBAQCAt
OSw2ICs5LDcgQEAKPiA+PiAgICAqICBDb3B5cmlnaHQgKEMpIDIwMTIgUmVkIEhhdAo+ID4+ICAg
ICovCj4gPj4KPiA+PiArI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgo+ID4+ICAg
I2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+Cj4gPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9mcmFt
ZWJ1ZmZlci5oPgo+ID4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KPiA+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaCBiL2luY2x1ZGUv
ZHJtL2RybV9mYl9jbWFfaGVscGVyLmgKPiA+PiBpbmRleCA0YmVjYjA5OTc1YTQuLjc5NWFlYTFk
MGEyNSAxMDA2NDQKPiA+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZmJfY21hX2hlbHBlci5oCj4g
Pj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaAo+ID4+IEBAIC0yLDYgKzIs
OCBAQAo+ID4+ICAgI2lmbmRlZiBfX0RSTV9GQl9DTUFfSEVMUEVSX0hfXwo+ID4+ICAgI2RlZmlu
ZSBfX0RSTV9GQl9DTUFfSEVMUEVSX0hfXwo+ID4+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC90eXBl
cy5oPgo+ID4+ICsKPiA+PiAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXI7Cj4gPj4gICBzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlOwo+ID4+Cj4gPj4gLS0KPiA+PiAyLjE1LjAKPiA+Pgo+ID4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+ID4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+PiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
