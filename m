Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE50773D7
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 00:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB92A6EE69;
	Fri, 26 Jul 2019 22:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367E96EE69
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 22:07:16 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a127so41265716oii.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 15:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6gARgDgjkmsNobEWwqN/iNsV17txUcxT7IQ+X1KWfM=;
 b=c2beTM3Spm5hC62r44dgG/f12Xfw8/te2n8+FOhUyERFGN9T8zjsoJnRs/cog2QFqX
 5D3lwli9leJ51dASTKVepHOGDNzgI39tnWwHps1Cs2GJ5j+ofCkSARRhqRpahPWT+eId
 yIn6jv2ac/49bqv6GjRM9I+n6yAEa7LNJdfuyjo8FgvPhj4hRE0E6AOcb96n7U/rba9m
 oJQeqh2AXHxQ3tUFVTgx+xdzsobK/FCKnjKR8gMLh8uWmQl9YTgqc+Avrxt0yrOrXY2H
 nevN/BPWK+kY+ZYqcnzxSFeigP+FnSyDaQdiEPAmQIWauNIcFYXR4KDE7K0u9F1LPfTM
 gDkg==
X-Gm-Message-State: APjAAAXO27nkYpFeMU3xAyCCHLODHQAdYR73l3jzLzpMGRRPpvrwJ+Wb
 SWUquzOjmR1/YnBe3g0OiDR3Fs182/L77AdTfHXKGkni
X-Google-Smtp-Source: APXvYqxdSTxQVwm1qoPNCfE/ehXu7BNkYLFTK6Vu2qD2oXiEE2Q9ymzFs5KGJ32Dnh4KRmWFsWvI9Z5OecThSIhMs+Y=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr50787428oiy.110.1564178835368; 
 Fri, 26 Jul 2019 15:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907262223280.1791@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907262223280.1791@nanos.tec.linutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 27 Jul 2019 00:07:03 +0200
Message-ID: <CAKMK7uGq15vhfrtaHGCRm-ReMwRFGOOuzqHK15Fsw-kvSGh3bw@mail.gmail.com>
Subject: Re: [PATCH] drm/i810: Use CONFIG_PREEMPTION
To: Thomas Gleixner <tglx@linutronix.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=k6gARgDgjkmsNobEWwqN/iNsV17txUcxT7IQ+X1KWfM=;
 b=RPAMiGp9CkFr+TPTQUvskkY0nEe4VgXffTvkJI4hG4YY3gL99/RWzMmpdJjsCTC5+p
 xG6zopmKTz6n27ZEsZAkxmQk7xloTDs7pj3Q9+bHZANh0S8oC8tIjOa258o6gVy3Fzsk
 NrL7YWQBcElghpVsH8UdGp9zpIQ0S1oHKJGmE=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTA6MjUgUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gQ09ORklHX1BSRUVNUFRJT04gaXMgc2VsZWN0ZWQgYnkg
Q09ORklHX1BSRUVNUFQgYW5kIGJ5Cj4gQ09ORklHX1BSRUVNUFRfUlQuIEJvdGggUFJFRU1QVCBh
bmQgUFJFRU1QVF9SVCByZXF1aXJlIHRoZSBzYW1lCj4gZnVuY3Rpb25hbGl0eSB3aGljaCB0b2Rh
eSBkZXBlbmRzIG9uIENPTkZJR19QUkVFTVBULgo+Cj4gQ2hhbmdlIHRoZSBLY29uZmlnIGRlcGVu
ZGVuY3kgb2YgaTgxMCB0byAhQ09ORklHX1BSRUVNUFRJT04gc28gdGhlIGRyaXZlcgo+IGlzIG5v
dCBhY2NpZGVudGFsbHkgYnVpbHQgb24gYSBSVCBrZXJuZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KCk15IGtlcm5lbC9LY29uZmln
LnByZWVtcHQgaGVyZSBzdGlsbCBoYXMgdGhhdCBhcyBQUkVFTVBULiBEb2VzIHRoaXMKcGF0Y2gg
bmVlZCBzb21lIG90aGVycz8gSW4gdGhhdCBjYXNlIEFjayBmb3IgbWVyZ2luZyB0aHJvdWdoIHdo
YXRldmVyCnRyZWUgdGhvc2UgZ28gaW4gdGhyb3VnaC4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL0tjb25maWcgfCAgICAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwo+IEBAIC0zOTQsNyArMzk0LDcgQEAgY29uZmln
IERSTV9SMTI4Cj4gIGNvbmZpZyBEUk1fSTgxMAo+ICAgICAgICAgdHJpc3RhdGUgIkludGVsIEk4
MTAiCj4gICAgICAgICAjICFQUkVFTVBUIGJlY2F1c2Ugb2YgbWlzc2luZyBpb2N0bCBsb2NraW5n
Cj4gLSAgICAgICBkZXBlbmRzIG9uIERSTSAmJiBBR1AgJiYgQUdQX0lOVEVMICYmICghUFJFRU1Q
VCB8fCBCUk9LRU4pCj4gKyAgICAgICBkZXBlbmRzIG9uIERSTSAmJiBBR1AgJiYgQUdQX0lOVEVM
ICYmICghUFJFRU1QVElPTiB8fCBCUk9LRU4pCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIENo
b29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBJbnRlbCBJODEwIGdyYXBoaWNzIGNhcmQu
ICBJZiBNIGlzCj4gICAgICAgICAgIHNlbGVjdGVkLCB0aGUgbW9kdWxlIHdpbGwgYmUgY2FsbGVk
IGk4MTAuICBBR1Agc3VwcG9ydCBpcyByZXF1aXJlZAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
