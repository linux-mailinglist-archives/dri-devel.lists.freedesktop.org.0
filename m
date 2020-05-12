Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7971D0B9C
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6721C6E9AF;
	Wed, 13 May 2020 09:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCE489690
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:26:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i15so13971462wrx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gbPBxfMa1nptvQGMmZJZG7FYjOnjT5ftZuQZQ9k/QJ4=;
 b=lUkNo5DXhGx8+9zxaahYEiv6fa4sQ8jIdyIO0d5Yu4B5m9DgdTAtzg/h2oN9rcMUnd
 YpLPMk7/ICVqibbbWDImFLd4xp0NO3jMao0LlmSjYcFDtN4Zbu9sq9rkFZqbi4Rr1E0x
 e+KFWsi9vSZDVS0SXOyHPSqVAhjQymnBN8cvh81l39ZU34JgaiukwmJK9Asr1B5d62ZB
 GdW+T2NgDeZOyhsX9VJhOuwyLEDkoXUpMfMnnuDjf+iSkY++NllTkhy1/t4EW22q2qN8
 FttlwYdgjckL4Sj2rn/KEXZof5Euiy70Cobgeag3PknKUPw9UQ9pRVvrFI6/Oyatw7fO
 4a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gbPBxfMa1nptvQGMmZJZG7FYjOnjT5ftZuQZQ9k/QJ4=;
 b=oMym8Ykslxh8irWljkhDWn2p/dZKvVKUSHNOY/Yk2yK4D+Dl78nvDgPN+P19+ak8w/
 Txzv34engFXzhTfCU/7S/4VnyFxEJdAfIiamUOAoHQdXnOITnTkRkVvg0FauvVl5HIX8
 Mw4E9HLOqRUsQ5+NQliwy2RFaPCB0RzwAOab5zRcbT8B6JKaUQibOkzq491LUqcZ6IUF
 X1ErUEZVUkZ2AW8d6xHOvAvT4xGGRXIVHIDJUAFgcso3/kVwKZvj3g1vqf4dHl0s2IpT
 33KRfXQwgRhTP1W8KKiITzwqPqI/U5gtcc6ysbBuSyaXU57oKidDAJut5Qwm0em7jDBP
 BdlA==
X-Gm-Message-State: AGi0PuYeNRNbNW4DMGougzul032TbCo0m1UYN5cbTZmJiqjRsQJENPqD
 gNIQu5suFdNEBNrGu2RywNo=
X-Google-Smtp-Source: APiQypLbjYDF9zrKDc3vZ8Hb+TPGob1psFPW6L8iFmpDLgvz/GLPZb0yfprZn2dX1uY3hKrzvIR13g==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr23323393wrq.14.1589268388254; 
 Tue, 12 May 2020 00:26:28 -0700 (PDT)
Received: from macbook-pro-alvaro.lan
 (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a81sm23626585wmh.7.2020.05.12.00.26.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:26:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512091958.0d153319@xps13>
Date: Tue, 12 May 2020 09:26:23 +0200
Message-Id: <461FD58F-ACD5-4158-BC0B-8C73C53D5C0D@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com> <20200512090844.21bcaf22@xps13>
 <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
 <20200512091958.0d153319@xps13>
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

SGkgTWlxdcOobCwKCj4gRWwgMTIgbWF5IDIwMjAsIGEgbGFzIDk6MTksIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IGVzY3JpYmnDszoKPiAKPiBIaSDDgWx2YXJvLAo+
IAo+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlIG9u
IFR1ZSwgMTIgTWF5IDIwMjAKPiAwOToxMjoxMCArMDIwMDoKPiAKPj4gSGkgTWlxdWVsLAo+PiAK
Pj4gSSBhbHNvIGhhZCBhIGhhcmQgdGltZSB1bmRlcnN0YW5kaW5nIHlvdXIgZW1haWwuCj4+IEl0
IHdhcyBxdWl0ZSBtaXNsZWFkaW5nLgo+PiAKPj4+IEVsIDEyIG1heSAyMDIwLCBhIGxhcyA5OjA4
LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiBlc2NyaWJpw7M6Cj4+
PiAKPj4+IEhpIMOBbHZhcm8sCj4+PiAKPj4+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKPj4+IDA4OjAwOjIzICsw
MjAwOgo+Pj4gCj4+Pj4gVGhlIGN1cnJlbnQgY29kZSBnZW5lcmF0ZXMgOCBvb2Igc2VjdGlvbnM6
Cj4+Pj4gUzEJMS01Cj4+Pj4gRUNDCTYtOAo+Pj4+IFMyCTktMTUKPj4+PiBTMwkxNi0yMQo+Pj4+
IEVDQwkyMi0yNAo+Pj4+IFM0CTI1LTMxCj4+Pj4gUzUJMzItMzcKPj4+PiBFQ0MJMzgtNDAKPj4+
PiBTNgk0MS00Nwo+Pj4+IFM3CTQ4LTUzCj4+Pj4gRUNDCTU0LTU2Cj4+Pj4gUzgJNTctNjMKPj4+
PiAKPj4+PiBDaGFuZ2UgaXQgYnkgbWVyZ2luZyBjb250aW51b3VzIHNlY3Rpb25zOgo+Pj4+IFMx
CTEtNQo+Pj4+IEVDQwk2LTgKPj4+PiBTMgk5LTIxCj4+Pj4gRUNDCTIyLTI0Cj4+Pj4gUzMJMjUt
MzcKPj4+PiBFQ0MJMzgtNDAKPj4+PiBTNAk0MS01Mwo+Pj4+IEVDQwk1NC01Ngo+Pj4+IFM1CTU3
LTYzCj4+Pj4gCj4+Pj4gRml4ZXM6IGVmNWVlZWE2ZTkxMSAoIm10ZDogbmFuZDogYnJjbTogc3dp
dGNoIHRvIG10ZF9vb2JsYXlvdXRfb3BzIikgIAo+Pj4gCj4+PiBTb3JyeSBmb3IgbGVhZGluZyB5
b3UgdGhlIHdyb25nIHdheSwgYWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdAo+Pj4gZGVzZXJ2
ZSBhIEZpeGVzIHRhZy4gIAo+PiAKPj4gRG8gSSBuZWVkIHRvIHJlc2VuZCB0aGlzIGFnYWluPwo+
PiBMb29rcyBsaWtlIG5vIG1hdHRlciB3aGF0IEkgZG8gaXTigJlzIGFsd2F5cyB3cm9uZy4uLgo+
IAo+IFBsZWFzZSBkb24ndCBnaXZlIHVwISBJdCBpcyBub3JtYWwgdG8gd29yayBiYWNrIGFuZCBm
b3J0aCB3aXRoIHRoZQo+IGNvbW11bml0eS4gSSBuZWVkIHRoZSBwYXRjaCB0byBiZSBjbGVhciBh
bmQgYnVnLWZyZWUgc28gSSBhc2sgeW91IHRvCj4gbWFrZSBjaGFuZ2VzIGFuZCBhc2sgcXVlc3Rp
b25zLCB0aGF0J3MgaG93IGl0IHdvcmtzLiBCdXQgYWxsIHlvdXIKPiBwYXRjaGVzIGFyZSBlbmhh
bmNpbmcgdGhpcyBkcml2ZXIgc28gcGxlYXNlIGtlZXAgcG9zdGluZyEKPiAKPj4gCj4+PiAKPj4+
PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwu
Y29tPgo+Pj4+IC0tLQo+Pj4+IHYzOiBpbnZlcnQgcGF0Y2ggb3JkZXIKPj4+PiB2Mjoga2VlcCBv
cmlnaW5hbCBjb21tZW50IGFuZCBmaXggY29ycmVjdGx5IHNraXAgYnl0ZSA2IGZvciBzbWFsbC1w
YWdlIG5hbmQKPj4+PiAKPj4+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jIHwgMzcgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+Pj4+IGluZGV4IDFjMTA3MDExMWViYy4uMGExZDc2
ZmRlMzdiIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jCj4+Pj4gQEAgLTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1t
aW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPj4+
PiAJc3RydWN0IGJyY21uYW5kX2NmZyAqY2ZnID0gJmhvc3QtPmh3Y2ZnOwo+Pj4+IAlpbnQgc2Fz
ID0gY2ZnLT5zcGFyZV9hcmVhX3NpemUgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xazsKPj4+PiAJaW50
IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7
Cj4+Pj4gKwl1MzIgbmV4dDsKPj4+PiAKPj4+PiAtCWlmIChzZWN0aW9uID49IHNlY3RvcnMgKiAy
KQo+Pj4+ICsJaWYgKHNlY3Rpb24gPiBzZWN0b3JzKQo+Pj4+IAkJcmV0dXJuIC1FUkFOR0U7Cj4+
Pj4gCj4+Pj4gLQlvb2JyZWdpb24tPm9mZnNldCA9IChzZWN0aW9uIC8gMikgKiBzYXM7Cj4+Pj4g
KwluZXh0ID0gKHNlY3Rpb24gKiBzYXMpOwo+Pj4+ICsJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQo+
Pj4+ICsJCW5leHQgKz0gNjsKPj4+PiAKPj4+PiAtCWlmIChzZWN0aW9uICYgMSkgewo+Pj4+IC0J
CW9vYnJlZ2lvbi0+b2Zmc2V0ICs9IDk7Cj4+Pj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA3Owo+
Pj4+ICsJaWYgKHNlY3Rpb24pIHsKPj4+PiArCQlvb2JyZWdpb24tPm9mZnNldCA9ICgoc2VjdGlv
biAtIDEpICogc2FzKSArIDk7Cj4+Pj4gCX0gZWxzZSB7Cj4+Pj4gLQkJb29icmVnaW9uLT5sZW5n
dGggPSA2Owo+Pj4+IC0KPj4+PiAtCQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBo
YXZlIEJCSSAqLwo+Pj4+IC0JCWlmICghc2VjdGlvbikgewo+Pj4+IC0JCQkvKgo+Pj4+IC0JCQkg
KiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPj4+
PiAtCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4KPj4+PiAtCQkJICovCj4+Pj4gLQkJCWlm
IChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgewo+Pj4+IC0JCQkJb29icmVnaW9uLT5vZmZzZXQgKz0g
MjsKPj4+PiAtCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Cj4+Pj4gLQkJCX0gZWxzZSB7Cj4+
Pj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOwo+Pj4+IC0JCQl9Cj4+Pj4gKwkJLyoKPj4+PiAr
CQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UK
Pj4+PiArCQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgo+Pj4+ICsJCSAqLwo+Pj4+ICsJCWlm
IChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgewo+Pj4+ICsJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7
Cj4+Pj4gKwkJfSBlbHNlIHsKPj4+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+Pj4+ICsJ
CQluZXh0LS07ICAKPj4+IAo+Pj4gVGhpcyBuZXh0LS0gc2VlbXMgdmVyeSBzdHJhbmdlLCBjYW4g
eW91IGV4cGxhaW4/ICAKPj4gCj4+IEluIHRoaXMgY2FzZSBuZXh0IHdpbGwgYmUgNiAod2hpY2gg
aXMgdGhlIGZpcnN0IEVDQyBieXRlKS4KPj4gSG93ZXZlciwgZm9yIHNtYWxsIHBhZ2UgTkFORHMg
Ynl0ZSA1IGlzIHJlc2VydmVkIGZvciBCQlQsIHNvIHdlIHdhbnQgbmV4dCB0byBiZSA1IG9ubHkg
aW4gdGhpcyBjYXNlLgo+IAo+IFRoYXQncyBjbGVhciwgcGxlYXNlIGFkZCBhIGNvbW1lbnQgdGhl
cmUgdGhlbi4KCklzbuKAmXQg4oCcU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3
aGlsZSBsYXJnZS1wYWdlIE5BTkQgdXNlIGJ5dGVzIDAgYW5kIDEu4oCdIGVub3VnaD8KRG8gd2Ug
cmVhbGx5IG5lZWQgYSBzcGVjaWZpYyBjb21tZW50IGJlZm9yZSBuZXh0LS0/Cgo+IAo+PiAKPj4+
IAo+Pj4+IAkJfQo+Pj4+IAl9Cj4+Pj4gCj4+Pj4gKwlvb2JyZWdpb24tPmxlbmd0aCA9IG5leHQg
LSBvb2JyZWdpb24tPm9mZnNldDsKPj4+PiArCj4+Pj4gCXJldHVybiAwOwo+Pj4+IH0KPj4+PiAK
Pj4+IAo+Pj4gCj4+PiBUaGFua3MsCj4+PiBNaXF1w6hsICAKPj4gCj4+IFJlZ2FyZHMsCj4+IMOB
bHZhcm8uCj4gCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKClJlZ2FyZHMsCsOBbHZhcm8uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
