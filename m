Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E61D0B8A
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306C66E225;
	Wed, 13 May 2020 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF48689690
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:24:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u16so22031610wmc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=khsQQ8VJ5Tff/i0Hz7O7BvH/fLbHsQV/p8Ig95SYjfQ=;
 b=iQf4epHsIwHxz7PfeY0em2LSHNzVAwJ2pQuTSG8uKJX0aFXEAasTOm4Gg8Gtkeaaq0
 8tACOKLWsS6MKyahxI2JVwspVhOPfeCHJwnKF33sQ9VEUrFm/6lek+ESZQwlycVuIeS6
 jPGVIzzrjDu3DuABwRSFRz0mBAMjxzPZS2I4AO7uQZRJidSQPdVpF491vYMg1di/aMO1
 drJVi75PJCN3l5ib5azwGJUTGfM2XiMmIosH2Hc2Dv1PXfZiQySSSJjlM0W2TnbHk3Y4
 8p6Z5CRFadd8IHFXdMKQdVoUeCw0PBqx61isncR/LcvGKa5RoXYTmUOD/4uYeBwfoccv
 dGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=khsQQ8VJ5Tff/i0Hz7O7BvH/fLbHsQV/p8Ig95SYjfQ=;
 b=sw+Jpl1uDLtkyfS/IUt5gxTz0MDhuQ1vE1CHG2GOs2qQ3D4hm0B55wnhV36JOCUaCa
 xwxjNbESJPCyF2Bz9SKlyfltTB8kQAj+wNtqb/0aJIt/o/e4MEUjnOIA0BU0WMRV8Zmi
 r5IhLQfW5PjyB8b/FmnsPDoaX3MtMq/Uwp9KB/tGx1Ul4WLiKbUzs/z6iwzJDcQpnMNV
 2d5V6vRPpVrvS7TjVdREU8me+Ie335wpXom4HgUYhkuoIVDhRaeFL4YoRBO8POuxoedV
 05PhjuPIlQsFuL6ruJjXRWIJqVVvAnFN5/BQyuS+xtsUb1RZ16rZR1WLj1CgCEBEhuVS
 ILWg==
X-Gm-Message-State: AGi0Pubr2IjCYvB5tED6RVCQoXxORqdXW9rY/lhbBI7BO11xcjWbjHle
 UeyYbqcg/Mo9kC6Y93yoYWA=
X-Google-Smtp-Source: APiQypIFnh+o15hlQrsxwXRceIh6hJrYLP6JuLHt0SOBNmVimCpRbRykx+o1oAaPDyDdVdqAO+a3IQ==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr38204462wmc.83.1589268278210; 
 Tue, 12 May 2020 00:24:38 -0700 (PDT)
Received: from macbook-pro-alvaro.lan
 (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id v124sm30170851wme.45.2020.05.12.00.24.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:24:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200512091637.198dd0c2@xps13>
Date: Tue, 12 May 2020 09:24:32 +0200
Message-Id: <50E32C0E-7485-4180-A072-F7F1CFB45B06@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
 <20200512065111.716801-1-noltari@gmail.com> <20200512091637.198dd0c2@xps13>
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

SGkgTWlxdcOobAoKPiBFbCAxMiBtYXkgMjAyMCwgYSBsYXMgOToxNiwgTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+IAo+IEhpIMOBbHZhcm8sCj4g
Cj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGUgb24g
VHVlLCAxMiBNYXkgMjAyMAo+IDA4OjUxOjExICswMjAwOgo+IAo+PiBUaGUgY3VycmVudCBjb2Rl
IGNoZWNrcyB0aGF0IHRoZSB3aG9sZSBPT0IgYXJlYSBpcyBlcmFzZWQuCj4+IFRoaXMgaXMgYSBw
cm9ibGVtIHdoZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB0byB0aGUgT09CLCBzaW5j
ZSBpdCB3aWxsCj4+IGZhaWwgZHVlIHRvIHRoZSB1c2FibGUgT09CIGJ5dGVzIG5vdCBiZWluZyAw
eGZmLgo+PiBDb3JyZWN0IHRoaXMgYnkgb25seSBjaGVja2luZyB0aGF0IGRhdGEgYW5kIEVDQyBi
eXRlcyBhcmVuJ3QgMHhmZi4KPj4gCj4+IEZpeGVzOiAwMmI4OGVlYTlmOWMgKCJtdGQ6IGJyY21u
YW5kOiBBZGQgY2hlY2sgZm9yIGVyYXNlZCBwYWdlIGJpdGZsaXBzIikKPj4gU2lnbmVkLW9mZi1i
eTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPj4gLS0tCj4+
IHYzOiBGaXggY29tbWl0IGxvZyBhbmQgbWVyZ2UgbmFuZF9jaGVja19lcmFzZWRfZWNjX2NodW5r
IGNhbGxzLgo+PiB2MjogQWRkIEZpeGVzIHRhZwo+PiAKPj4gZHJpdmVycy9tdGQvbmFuZC9yYXcv
YnJjbW5hbmQvYnJjbW5hbmQuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KPj4gMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPj4gaW5kZXggZTRlM2NlZWFjMzhmLi44MGZl
MDFmMDM1MTYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+PiBAQCAtMjAxOCw4ICsyMDE4LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkX2J5X3Bp
byhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPj4gc3RhdGlj
IGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LAo+PiAJCSAgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLCB1NjQgYWRkcikKPj4g
ewo+PiArCXN0cnVjdCBtdGRfb29iX3JlZ2lvbiBvb2JlY2M7Cj4+IAlpbnQgaSwgc2FzOwo+PiAt
CXZvaWQgKm9vYiA9IGNoaXAtPm9vYl9wb2k7Cj4+ICsJdm9pZCAqb29iOwo+PiAJaW50IGJpdGZs
aXBzID0gMDsKPj4gCWludCBwYWdlID0gYWRkciA+PiBjaGlwLT5wYWdlX3NoaWZ0Owo+PiAJaW50
IHJldDsKPj4gQEAgLTIwMzUsMTEgKzIwMzYsMTkgQEAgc3RhdGljIGludCBicmNtc3RiX25hbmRf
dmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+PiAJaWYgKHJldCkKPj4g
CQlyZXR1cm4gcmV0Owo+PiAKPj4gLQlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBp
KyssIG9vYiArPSBzYXMpIHsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBp
KyspIHsKPj4gCQllY2NfY2h1bmsgPSBidWYgKyBjaGlwLT5lY2Muc2l6ZSAqIGk7Cj4+IC0JCXJl
dCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhlY2NfY2h1bmssCj4+IC0JCQkJCQkgIGNo
aXAtPmVjYy5zaXplLAo+PiAtCQkJCQkJICBvb2IsIHNhcywgTlVMTCwgMCwKPj4gKwo+PiArCQlp
ZiAobXRkLT5vb2JsYXlvdXQtPmVjYyhtdGQsIGksICZvb2JlY2MpKSB7Cj4gCj4gUGxlYXNlIHVz
ZSB0aGUgbXRkY29yZS5jJ3MgaGVscGVycwo+IChtdGRfb29ibGF5b3V0X3NldC9nZXRfZGF0YS9m
cmVlL2VjYy9ieXRlcykuCj4gCj4gQWxzbywgd2hhdCBhcmUgeW91IHRyeWluZyB0byBkaXNjcmlt
aW5hdGUgd2l0aCB0aGUgcmV0dXJuIGNvZGUgb2YgdGhlCj4gZnVuY3Rpb24/IFNob3VsZG4ndCB0
aGlzIGZ1bmN0aW9uICJhbHdheXMiIHdvcms/CgpKdXN0IG1ha2luZyBzdXJlIGl0IGRvZXNu4oCZ
dCByZXR1cm4gYW4gRVJBTkdFIGluIGNhc2UgY2hpcC0+ZWNjLnNpemUgZG9lc27igJl0IG1hdGNo
IHRoZSBzZWN0aW9ucyBmcm9tIG10ZC0+b29ibGF5b3V0LT5lY2MsIHdoaWNoIHNob3VsZG7igJl0
IGhhcHBlbiwgc28gSSB0aGluayB3ZSBjYW4gcmVtb3ZlIHRoYXQuLi4KCj4gCj4+ICsJCQlvb2Ig
PSBOVUxMOwo+PiArCQkJb29iZWNjLmxlbmd0aCA9IDA7Cj4+ICsJCX0gZWxzZSB7Cj4+ICsJCQlv
b2IgPSBjaGlwLT5vb2JfcG9pICsgb29iZWNjLm9mZnNldDsKPj4gKwkJfQo+PiArCj4+ICsJCXJl
dCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhlY2NfY2h1bmssIGNoaXAtPmVjYy5zaXpl
LAo+PiArCQkJCQkJICBvb2IsIG9vYmVjYy5sZW5ndGgsCj4+ICsJCQkJCQkgIE5VTEwsIDAsCj4+
IAkJCQkJCSAgY2hpcC0+ZWNjLnN0cmVuZ3RoKTsKPiAKPiBBcyBJIHRvbGQgeW91LCB0aGlzIGhl
bHBlciB0YWtlcyAibWFpZCBkYXRhIiB0aGVuICJzcGFyZSBhcmVhIiB0aGVuCj4gImVjYyBieXRl
cyIuIFRoZSBuYW1lcyBhcmUgcHJldHR5IGltcG9ydGFudCBoZXJlIGFzIHlvdSB3YW50IHRvIGF2
b2lkCj4gY2hlY2tpbmcgdGhlIHNwYXJlIE9PQiBieXRlcyBvbiBwdXJwb3NlLCBzbyBtYXliZSB5
b3UgY291bGQgaGF2ZSBtb3JlCj4gbWVhbmluZ2Z1bCBuYW1lcyBhbmQgY2FsbCAiZWNjIiBpbnN0
ZWFkIG9mICJvb2IiIHRoZSBlY2MgcmVnaW9uPwoKQWN0dWFsbHkgSSB0aG91Z2h0IHlvdSBtZWFu
dCB0aGUgY29tbWl0IGxvZywgbm90IHRoZSBjb2RlIGl0c2VsZi4uLgoKPiAKPj4gCQlpZiAocmV0
IDwgMCkKPj4gCQkJcmV0dXJuIHJldDsKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKUmVnYXJk
cywKw4FsdmFyby4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
