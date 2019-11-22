Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC771071E7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 13:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5B6F540;
	Fri, 22 Nov 2019 12:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87346F540
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 12:01:42 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8fxIc6p"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id e07688vAMC1Q4Id
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 22 Nov 2019 13:01:26 +0100 (CET)
Date: Fri, 22 Nov 2019 13:01:25 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] drm/mcde: Do not needlessly logically and with 3
Message-ID: <20191122120035.GB2478@gerhold.net>
References: <20191122072508.25677-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122072508.25677-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574424100; 
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jxObSotcSgtqTEF3MASbg2EkxaL6xBePX9zqO02kJio=;
 b=e9pTZLUEvKBIo5ny6EXCrP0QPhDTQ7JV5FX/vrP+B2zR9pmjE5ShSMAECKbkt4eo7b
 4WAjKfVc6poEVW9eyv8eB/9e+bJ48KJcpWwCVVLj6tNJA+2b9Y/ZubCnnGJrU9G8GiRo
 SYts4z/RISlRlBkffYlQMqFYW1f9DRf/6WEEAFpD9JLNJE0KwaXX/NpSbUFCvaB55tVy
 1ZALTlnMoLs58g60X/Og2uerP+IdoxY/FXvjCkZq3wE1PaU//zw3/1GXew3N8yll6sqK
 LPtj5aFJWOC47bW587GmXdw4A4QGGChU581gw0kWPQYMYCfHVXCUJfpLFOOJB8jvQyNx
 V1vQ==
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
Cc: linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDg6MjU6MDhBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGUgaSBpbmRleCBpIGFsd2F5cyAwLi4zIGluIHRoZXNlIHN0YXRlbWVudHMgc28g
dGhlcmUKPiBpcyBubyBuZWVkIHRvIHRhZyAiJiAzIiB0byBjbGFtcCBpdCB0byAzIGhlcmUuIE1h
a2UKPiB0aGUgb3BlcmF0b3IgcHJlY2VkZW5jZSBleHBsaWNpdCBldmVuIGlmIGl0J3MgY29ycmVj
dAo+IGFzIGl0IGlzLCB0aGUgcGFyYW50aGVzaXMgY3JlYXRlcyBsZXNzIGNvZ25pdGl2ZSBzdHJl
c3MKPiBmb3IgaHVtYW5zLgo+IAo+IENjOiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9s
ZC5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgoKUmV2aWV3ZWQtYnk6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBnZXJob2xkLm5l
dD4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMgfCA4ICsrKystLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWNkZS9tY2RlX2RzaS5jCj4gaW5kZXggZGMwN2I1MzRmMDFmLi4yMWNlZTRkOWQyZmQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKPiBAQCAtMjM3LDI1ICsyMzcsMjUgQEAgc3Rh
dGljIHNzaXplX3QgbWNkZV9kc2lfaG9zdF90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAq
aG9zdCwKPiAgCWlmICh0eGxlbiA+IDApIHsKPiAgCQl2YWwgPSAwOwo+ICAJCWZvciAoaSA9IDA7
IGkgPCA0ICYmIGkgPCB0eGxlbjsgaSsrKQo+IC0JCQl2YWwgfD0gdHhbaV0gPDwgKGkgJiAzKSAq
IDg7Cj4gKwkJCXZhbCB8PSB0eFtpXSA8PCAoaSAqIDgpOwo+ICAJfQo+ICAJd3JpdGVsKHZhbCwg
ZC0+cmVncyArIERTSV9ESVJFQ1RfQ01EX1dSREFUMCk7Cj4gIAlpZiAodHhsZW4gPiA0KSB7Cj4g
IAkJdmFsID0gMDsKPiAgCQlmb3IgKGkgPSAwOyBpIDwgNCAmJiAoaSArIDQpIDwgdHhsZW47IGkr
KykKPiAtCQkJdmFsIHw9IHR4W2kgKyA0XSA8PCAoaSAmIDMpICogODsKPiArCQkJdmFsIHw9IHR4
W2kgKyA0XSA8PCAoaSAqIDgpOwo+ICAJCXdyaXRlbCh2YWwsIGQtPnJlZ3MgKyBEU0lfRElSRUNU
X0NNRF9XUkRBVDEpOwo+ICAJfQo+ICAJaWYgKHR4bGVuID4gOCkgewo+ICAJCXZhbCA9IDA7Cj4g
IAkJZm9yIChpID0gMDsgaSA8IDQgJiYgKGkgKyA4KSA8IHR4bGVuOyBpKyspCj4gLQkJCXZhbCB8
PSB0eFtpICsgOF0gPDwgKGkgJiAzKSAqIDg7Cj4gKwkJCXZhbCB8PSB0eFtpICsgOF0gPDwgKGkg
KiA4KTsKPiAgCQl3cml0ZWwodmFsLCBkLT5yZWdzICsgRFNJX0RJUkVDVF9DTURfV1JEQVQyKTsK
PiAgCX0KPiAgCWlmICh0eGxlbiA+IDEyKSB7Cj4gIAkJdmFsID0gMDsKPiAgCQlmb3IgKGkgPSAw
OyBpIDwgNCAmJiAoaSArIDEyKSA8IHR4bGVuOyBpKyspCj4gLQkJCXZhbCB8PSB0eFtpICsgMTJd
IDw8IChpICYgMykgKiA4Owo+ICsJCQl2YWwgfD0gdHhbaSArIDEyXSA8PCAoaSAqIDgpOwo+ICAJ
CXdyaXRlbCh2YWwsIGQtPnJlZ3MgKyBEU0lfRElSRUNUX0NNRF9XUkRBVDMpOwo+ICAJfQo+ICAK
PiAtLSAKPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
