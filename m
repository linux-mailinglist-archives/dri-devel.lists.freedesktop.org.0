Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBA1D4AE0
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DF06EC68;
	Fri, 15 May 2020 10:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951FA6EC66;
 Fri, 15 May 2020 10:26:21 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id p139so440829vkd.7;
 Fri, 15 May 2020 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aMr6yoMCs38gQht1Q+DpQUXerErR+hPcKVQWVKr1Hes=;
 b=LHEtd14wpQ/xvWY0nqjoWZ0YY9SmVwQnPrbF+0apmeD++I78lItVhGT1UcqscnpnWx
 ntK8wfJX2BH+8NwNMVAMh2NcWXaqqcd9hAPCKw56r3AAI+GTF2ZQVNEkAuoYB5AEZA/t
 hZuZt9t+5gRlJHsCvX8BGnLVPayTEGIenUkwZs4fSeMdKsFIStxjIDqSCrI948yIgQpO
 SLe2hhAmno33uYTFdQLRHRtyVJGjzVipU/+iNrdwNAGoPwIakWI8Ti5/I51TkLA8/Apl
 psxtoaRmCh6SYhQ1ZyD1j9yLP+fkx3jqNi6k6LSoJikka6WqNBcHqV0xxPJctBim2/Qu
 mXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aMr6yoMCs38gQht1Q+DpQUXerErR+hPcKVQWVKr1Hes=;
 b=ct9uZ7BXxcGR0068Wr22w4/hU/4NurwNYpeNUiAp4SPXSMLuOS3skKHTA9bt7lKK2J
 AaflQxExYaGzmmI8eAZZdNyzqRsXgbiTsJeNUmVxBenF02vX3l4Y/4oil760uGWLvjf6
 HXaVhqH9QCLYeJ5FOHvf0IPxcpStku441JgDIv028nPTdXU1t4d7Z5GzN1+njXetiKOy
 RMrZrrsW7vN7IYEFO1ylZimxstHX4oxWlx2dfDVnkHfoVe+1vF8Cjol9O+N1An+J0PU+
 C4LUv4C/KCTLSvib+1L8yGjKQr9lVCOQtgYvQSuFs9u/VSApaUc+wFL8E6r05xDojg6l
 ZLWg==
X-Gm-Message-State: AOAM531k/LcrYxNYKWxSJa7XGFaMYaYrEo13s0F/KYhK+dc9adltqI8H
 HFaWkl5cMyb8SICniwjqzNj22PdYyX+kA815G8g=
X-Google-Smtp-Source: ABdhPJzmtQKzGpjXUkr9+/boRd3M8JqTHwX9p5GOdA5Yt+P4VvYy+uJALJLFu1sI+rl3gWZYfXMVYNZz7LZ8EDXJj+o=
X-Received: by 2002:a1f:24ce:: with SMTP id k197mr2045827vkk.13.1589538380663; 
 Fri, 15 May 2020 03:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200511123846.96594-1-christian.gmeiner@gmail.com>
 <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
 <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
In-Reply-To: <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 15 May 2020 12:26:09 +0200
Message-ID: <CAH9NwWcjrd2cNrVpMaHQPyrwzKASetGXcb=sjA4VDThyV6h5Vg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bAoKQW0gRnIuLCAxNS4gTWFpIDIwMjAgdW0gMTI6MTIgVWhyIHNjaHJpZWIgUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Ogo+Cj4gSGkgQ2hyaXN0aWFuLAo+Cj4gTGUg
dmVuLiAxNSBtYWkgMjAyMCDDoCAxMjowOSwgQ2hyaXN0aWFuIEdtZWluZXIKPiA8Y2hyaXN0aWFu
LmdtZWluZXJAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4gPiBBbSBNby4sIDExLiBNYWkgMjAyMCB1
bSAxNDozOCBVaHIgc2NocmllYiBDaHJpc3RpYW4gR21laW5lcgo+ID4gPGNocmlzdGlhbi5nbWVp
bmVyQGdtYWlsLmNvbT46Cj4gPj4KPiA+PiAgVGhlIEdDODYwIGhhcyBvbmUgR1BVIGRldmljZSB3
aGljaCBoYXMgYSAyZCBhbmQgM2QgY29yZS4gSW4gdGhpcwo+ID4+IGNhc2UKPiA+PiAgd2Ugd2Fu
dCB0byBleHBvc2UgcGVyZm1vbiBpbmZvcm1hdGlvbiBmb3IgYm90aCBjb3Jlcy4KPiA+Pgo+ID4+
ICBUaGUgZHJpdmVyIGhhcyBvbmUgYXJyYXkgd2hpY2ggY29udGFpbnMgYWxsIHBvc3NpYmxlIHBl
cmZtb24gZG9tYWlucwo+ID4+ICB3aXRoIHNvbWUgbWV0YSBkYXRhIC0gZG9tc19tZXRhLiBIZXJl
IHdlIGNhbiBzZWUgdGhhdCBmb3IgdGhlIEdDODYwCj4gPj4gIHR3byBlbGVtZW50cyBvZiB0aGF0
IGFycmF5IGFyZSByZWxldmFudDoKPiA+Pgo+ID4+ICAgIGRvbXNfM2Q6IGlzIGF0IGluZGV4IDAg
aW4gdGhlIGRvbXNfbWV0YSBhcnJheSB3aXRoIDggcGVyZm1vbgo+ID4+IGRvbWFpbnMKPiA+PiAg
ICBkb21zXzJkOiBpcyBhdCBpbmRleCAxIGluIHRoZSBkb21zX21ldGEgYXJyYXkgd2l0aCAxIHBl
cmZtb24KPiA+PiBkb21haW4KPiA+Pgo+ID4+ICBUaGUgdXNlcnNwYWNlIGRyaXZlciB3YW50cyB0
byBnZXQgYSBsaXN0IG9mIGFsbCBwZXJmbW9uIGRvbWFpbnMgYW5kCj4gPj4gIHRoZWlyIHBlcmZt
b24gc2lnbmFscy4gVGhpcyBpcyBkb25lIGJ5IGl0ZXJhdGluZyBvdmVyIGFsbCBkb21haW5zCj4g
Pj4gYW5kCj4gPj4gIHRoZWlyIHNpZ25hbHMuIElmIHRoZSB1c2Vyc3BhY2UgZHJpdmVyIHdhbnRz
IHRvIGFjY2VzcyB0aGUgZG9tYWluCj4gPj4gd2l0aAo+ID4+ICBpZCA4IHRoZSBrZXJuZWwgZHJp
dmVyIGZhaWxzIGFuZCByZXR1cm5zIGludmFsaWQgZGF0YSBmcm9tIGRvbXNfM2QKPiA+PiB3aXRo
Cj4gPj4gIGFuZCBpbnZhbGlkIG9mZnNldC4KPiA+Pgo+ID4+ICBUaGlzIHJlc3VsdHMgaW46Cj4g
Pj4gICAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBh
ZGRyZXNzIDAwMDAwMDAwCj4gPj4KPiA+PiAgT24gc3VjaCBhIGRldmljZSBpdCBpcyBub3QgcG9z
c2libGUgdG8gdXNlIHRoZSB1c2Vyc3BhY2UgZHJpdmVyIGF0Cj4gPj4gYWxsLgo+ID4+Cj4gPj4g
IFRoZSBmaXggZm9yIHRoaXMgb2ZmLWJ5LW9uZSBlcnJvciBpcyBxdWl0ZSBzaW1wbGUuCj4gPj4K
PiA+PiAgUmVwb3J0ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+
ID4+ICBUZXN0ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4+
ICBGaXhlczogZWQxZGQ4OTliYWEzICgiZHJtL2V0bmF2aXY6IHJld29yayBwZXJmbW9uIHF1ZXJ5
Cj4gPj4gaW5mcmFzdHJ1Y3R1cmUiKQo+ID4+ICBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
ID4+ICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJA
Z21haWwuY29tPgo+ID4+ICAtLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfcGVyZm1vbi5jIHwgMiArLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X3BlcmZtb24uYwo+ID4+ICBpbmRleCBlNjc5NWJhZmNiYjkuLjM1ZjcxNzFlNzc5YSAx
MDA2NDQKPiA+PiAgLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9u
LmMKPiA+PiAgKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMK
PiA+PiAgQEAgLTQ1Myw3ICs0NTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1f
ZG9tYWluCj4gPj4gKnBtX2RvbWFpbihjb25zdCBzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKPiA+
PiAgICAgICAgICAgICAgICAgIGlmICghKGdwdS0+aWRlbnRpdHkuZmVhdHVyZXMgJiBtZXRhLT5m
ZWF0dXJlKSkKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPj4KPiA+
PiAgLSAgICAgICAgICAgICAgIGlmIChtZXRhLT5ucl9kb21haW5zIDwgKGluZGV4IC0gb2Zmc2V0
KSkgewo+ID4+ICArICAgICAgICAgICAgICAgaWYgKChtZXRhLT5ucl9kb21haW5zIC0gMSkgPCAo
aW5kZXggLSBvZmZzZXQpKSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldCAr
PSBtZXRhLT5ucl9kb21haW5zOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiA+PiAgICAgICAgICAgICAgICAgIH0KPiA+PiAgLS0KPiA+PiAgMi4yNi4yCj4gPj4KPiA+
Cj4gPiBwaW5nCj4KPiBJJ2xsIG1lcmdlIGl0IHRvbW9ycm93IGlmIHRoZXJlJ3Mgbm8gZnVydGhl
ciBmZWVkYmFjay4KPgoKV29ya3MgZm9yIG1lIHRvby4uIGFzIGZhciBhcyBMdWNhcyAodGhlIG1h
aW50YWluZXIpIGlzIGhhcHB5IHdpdGggaXQuCgotLSAKZ3JlZXRzCi0tCkNocmlzdGlhbiBHbWVp
bmVyLCBNU2MKCmh0dHBzOi8vY2hyaXN0aWFuLWdtZWluZXIuaW5mby9wcml2YWN5cG9saWN5Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
