Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3B71D0B86
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78C6E201;
	Wed, 13 May 2020 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691C6E848
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:12:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w19so7252618wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Pno9i7+IGC6ncAgSbnR2o7fvAJ+JWlp/1VRSmEok2Yw=;
 b=L6oC0ck1GXRkFvQwjkjuyakZ7R2BTTCSR0WyvgfJyjinrndC3FkuHzhxBBS7sEkB38
 d7g+D9wM6VAZ37CcRBBO17HSRHmx38VtG4xG4TXYxdNait6v39e6s2OasB4ClOMYsENZ
 CzKiF8/tQOHmApnCN9GLN3ZdncmL5EokgvhlGy/HLF6Sy2uJmprEsDFI4n5CjSBUPBn1
 sV2WCOjIMeohEnYlkJTf/ys6cw8rsWoZcyyazOftC/uSFkE7revwbFfJybwILjFDBbnM
 Vc25WUF5ie10c7ZK8mTVsfQhf1uiN2BNUJoH9bE5qq++9FT9LPYenwyw8kGwR7D/t0u6
 ccEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Pno9i7+IGC6ncAgSbnR2o7fvAJ+JWlp/1VRSmEok2Yw=;
 b=WSYfCH510rDmDXNltQOqs5phzXa878vXLJQ3QsVm5f3EiXhUByBkkAiX4hft4maKrT
 E3Mk3gnAxkNKlBO/ghgnKU+lqleLCN4803PZBWhFfjseAbEc0EdCloKfe19dxrMz5Nz1
 KdL9fKN9ja/vqI6od4NBep7HhCqbWyhDzEO/rAnoxhPN/gFklgC9nddjns0Vpdw8Cycs
 Xop/IwRhAEuDJbZgJz2PUss/D8BgT91wxJmXgGluyFZFfdSagcEJlvBcfXwjIVnUOMmF
 Wwoa9PNG8y0kTq22SfPRx/GcTYrQ5er1GbG/hsCDtgDIc3FoAiX9qsaurNMBS3yldpdK
 qsLQ==
X-Gm-Message-State: AGi0PubQ2AugWX6mcUr9ErZnKgWaJGjqLWTojrRYxXltp+/T4E5yfb4/
 dZT/wVAyPdlI75OmIRXSbB0=
X-Google-Smtp-Source: APiQypKqL2rnVh8By9cXsbO/XdQ3RA0DE9rNJHbugYnnyv953wCCWk7UPhM+SjiWIRiHq+kRn9EGhA==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr35725886wme.139.1589267535101; 
 Tue, 12 May 2020 00:12:15 -0700 (PDT)
Received: from macbook-pro-alvaro.lan
 (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a133sm7978655wme.43.2020.05.12.00.12.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:12:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512090844.21bcaf22@xps13>
Date: Tue, 12 May 2020 09:12:10 +0200
Message-Id: <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com> <20200512090844.21bcaf22@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWlxdWVsLAoKSSBhbHNvIGhhZCBhIGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIHlvdXIgZW1h
aWwuCkl0IHdhcyBxdWl0ZSBtaXNsZWFkaW5nLgoKPiBFbCAxMiBtYXkgMjAyMCwgYSBsYXMgOTow
OCwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+
IAo+IEhpIMOBbHZhcm8sCj4gCj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdt
YWlsLmNvbT4gd3JvdGUgb24gVHVlLCAxMiBNYXkgMjAyMAo+IDA4OjAwOjIzICswMjAwOgo+IAo+
PiBUaGUgY3VycmVudCBjb2RlIGdlbmVyYXRlcyA4IG9vYiBzZWN0aW9uczoKPj4gUzEJMS01Cj4+
IEVDQwk2LTgKPj4gUzIJOS0xNQo+PiBTMwkxNi0yMQo+PiBFQ0MJMjItMjQKPj4gUzQJMjUtMzEK
Pj4gUzUJMzItMzcKPj4gRUNDCTM4LTQwCj4+IFM2CTQxLTQ3Cj4+IFM3CTQ4LTUzCj4+IEVDQwk1
NC01Ngo+PiBTOAk1Ny02Mwo+PiAKPj4gQ2hhbmdlIGl0IGJ5IG1lcmdpbmcgY29udGludW91cyBz
ZWN0aW9uczoKPj4gUzEJMS01Cj4+IEVDQwk2LTgKPj4gUzIJOS0yMQo+PiBFQ0MJMjItMjQKPj4g
UzMJMjUtMzcKPj4gRUNDCTM4LTQwCj4+IFM0CTQxLTUzCj4+IEVDQwk1NC01Ngo+PiBTNQk1Ny02
Mwo+PiAKPj4gRml4ZXM6IGVmNWVlZWE2ZTkxMSAoIm10ZDogbmFuZDogYnJjbTogc3dpdGNoIHRv
IG10ZF9vb2JsYXlvdXRfb3BzIikKPiAKPiBTb3JyeSBmb3IgbGVhZGluZyB5b3UgdGhlIHdyb25n
IHdheSwgYWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdAo+IGRlc2VydmUgYSBGaXhlcyB0YWcu
CgpEbyBJIG5lZWQgdG8gcmVzZW5kIHRoaXMgYWdhaW4/Ckxvb2tzIGxpa2Ugbm8gbWF0dGVyIHdo
YXQgSSBkbyBpdOKAmXMgYWx3YXlzIHdyb25nLi4uCgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2
YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+PiAtLS0KPj4gdjM6IGlu
dmVydCBwYXRjaCBvcmRlcgo+PiB2Mjoga2VlcCBvcmlnaW5hbCBjb21tZW50IGFuZCBmaXggY29y
cmVjdGx5IHNraXAgYnl0ZSA2IGZvciBzbWFsbC1wYWdlIG5hbmQKPj4gCj4+IGRyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAzNyArKysrKysrKysrKystLS0tLS0tLS0t
LS0KPj4gMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+
PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+IGluZGV4IDFj
MTA3MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKPj4gQEAgLTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBi
cmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQg
c2VjdGlvbiwKPj4gCXN0cnVjdCBicmNtbmFuZF9jZmcgKmNmZyA9ICZob3N0LT5od2NmZzsKPj4g
CWludCBzYXMgPSBjZmctPnNwYXJlX2FyZWFfc2l6ZSA8PCBjZmctPnNlY3Rvcl9zaXplXzFrOwo+
PiAJaW50IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6
ZV8xayk7Cj4+ICsJdTMyIG5leHQ7Cj4+IAo+PiAtCWlmIChzZWN0aW9uID49IHNlY3RvcnMgKiAy
KQo+PiArCWlmIChzZWN0aW9uID4gc2VjdG9ycykKPj4gCQlyZXR1cm4gLUVSQU5HRTsKPj4gCj4+
IC0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOwo+PiArCW5leHQgPSAo
c2VjdGlvbiAqIHNhcyk7Cj4+ICsJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQo+PiArCQluZXh0ICs9
IDY7Cj4+IAo+PiAtCWlmIChzZWN0aW9uICYgMSkgewo+PiAtCQlvb2JyZWdpb24tPm9mZnNldCAr
PSA5Owo+PiAtCQlvb2JyZWdpb24tPmxlbmd0aCA9IDc7Cj4+ICsJaWYgKHNlY3Rpb24pIHsKPj4g
KwkJb29icmVnaW9uLT5vZmZzZXQgPSAoKHNlY3Rpb24gLSAxKSAqIHNhcykgKyA5Owo+PiAJfSBl
bHNlIHsKPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+PiAtCj4+IC0JCS8qIEZpcnN0IHNl
Y3RvciBvZiBlYWNoIHBhZ2UgbWF5IGhhdmUgQkJJICovCj4+IC0JCWlmICghc2VjdGlvbikgewo+
PiAtCQkJLyoKPj4gLQkJCSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0ZSA2IGZvciBCQkkgd2hp
bGUgbGFyZ2UtcGFnZQo+PiAtCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KPj4gLQkJCSAq
Lwo+PiAtCQkJaWYgKGNmZy0+cGFnZV9zaXplID4gNTEyKSB7Cj4+IC0JCQkJb29icmVnaW9uLT5v
ZmZzZXQgKz0gMjsKPj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aCAtPSAyOwo+PiAtCQkJfSBlbHNl
IHsKPj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOwo+PiAtCQkJfQo+PiArCQkvKgo+PiArCQkg
KiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPj4g
KwkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KPj4gKwkJICovCj4+ICsJCWlmIChjZmctPnBh
Z2Vfc2l6ZSA+IDUxMikgewo+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAyOwo+PiArCQl9IGVs
c2Ugewo+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+PiArCQkJbmV4dC0tOwo+IAo+IFRo
aXMgbmV4dC0tIHNlZW1zIHZlcnkgc3RyYW5nZSwgY2FuIHlvdSBleHBsYWluPwoKSW4gdGhpcyBj
YXNlIG5leHQgd2lsbCBiZSA2ICh3aGljaCBpcyB0aGUgZmlyc3QgRUNDIGJ5dGUpLgpIb3dldmVy
LCBmb3Igc21hbGwgcGFnZSBOQU5EcyBieXRlIDUgaXMgcmVzZXJ2ZWQgZm9yIEJCVCwgc28gd2Ug
d2FudCBuZXh0IHRvIGJlIDUgb25seSBpbiB0aGlzIGNhc2UuCgo+IAo+PiAJCX0KPj4gCX0KPj4g
Cj4+ICsJb29icmVnaW9uLT5sZW5ndGggPSBuZXh0IC0gb29icmVnaW9uLT5vZmZzZXQ7Cj4+ICsK
Pj4gCXJldHVybiAwOwo+PiB9Cj4+IAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpSZWdhcmRz
LArDgWx2YXJvLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
