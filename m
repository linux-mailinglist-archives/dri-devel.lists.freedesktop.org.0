Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6ED5C548
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 23:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90389BD4;
	Mon,  1 Jul 2019 21:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7782989BD4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 21:55:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 207so958672wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 14:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ejh504flrxv4/rJu7N/OK131VCazBveh9yTiENAmwg=;
 b=U+2gz98nkfx/ZVhL2v/+dWbri+oEd/uX7+VAAxqu9fR8US+Pt1Vt1Eh7ttYxogUs3I
 6UWhewCJt4wqVhoOpNrwNsg4HEfSBZgn+NTF1iEBWKO5iwRQopKuGQT6taEfTlKHAOqd
 ba1UGf3/Sl/9HcfY2jbSRmct7X/1GJ3cAmiaiVsDQ07zVRNfqJWLX6GL8FU+io4Vknw/
 cC2z1rSv/wHG27/q+c/mWCa3pniEBuH+sFFrga6MUwuKhj69eI7XDl8Mm8/RNo3dJ4b1
 mhSNw5qR/n1Ddkz2ntDyYX+unktlRljZEuD2USxzc3viTe5zb7WghlEcoWhsOcSgRxdb
 G7Qg==
X-Gm-Message-State: APjAAAUfJbg2g2kauIMIGvAMdbc7WYQ4bxdcloLDxVLZR7l02IcHit+H
 xVN6xR5RpyK7eXTJH5HMl69e70lLb0OGNBTBVoXXsA==
X-Google-Smtp-Source: APXvYqxrG5r0hxp5gNLuJsV9257JSZbGdgYzmk745sPYuXn1hyAQglK9dzaLJNCZrpRCqB7WvQOAJ+nbJvuxoGc/ZJQ=
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr787138wmg.164.1562018138931;
 Mon, 01 Jul 2019 14:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <8e19047d-b0b0-506f-7c3d-cd09075b9da7@redhat.com>
In-Reply-To: <8e19047d-b0b0-506f-7c3d-cd09075b9da7@redhat.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 1 Jul 2019 14:55:25 -0700
Message-ID: <CALAqxLUBfEOyMBtx0xzs8th-Xsi15mXqFmPOcLTihV_jfO=BjA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] DMA-BUF Heaps (destaging ION)
To: Laura Abbott <labbott@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6ejh504flrxv4/rJu7N/OK131VCazBveh9yTiENAmwg=;
 b=op+BjVzAkj4zZ7hkg/HTQgruGXXGSMJTDo6hpwdct0IVDfelNGJZS34uG7SbrhTZ98
 ZLNlFJaY+g0HQW7QfIeLZcrvNX4rLwfkOB2pbnZuxtkCSIBl5mYM+/iss5bUsuLX37Ly
 K0MLnHdGGGelTLzh49inafNaJctB7gk5A7d9LYryLKK/vA05u70s0k6QUCWUwEgZnID0
 H1gW5GaPfWLASaB/KCmB+9qtIUmdQl4r0L/W/CxPpEUKz/zVaxNB2QNVMwZv0b9VLZ6x
 vdaHUFIFyzsMMfFBnRStzfp/pdqCNJZ7LoSzGAAYVbpR6eYNUkAitpiNxoNmVvhVRLNA
 vsrg==
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
Cc: Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Sudipto Paul <Sudipto.Paul@arm.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAyOjQ1IFBNIExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IE9uIDYvMjQvMTkgMzo0OSBQTSwgSm9obiBTdHVsdHogd3JvdGU6
Cj4gPiBIZXJlIGlzIGFub3RoZXIgcGFzcyBhdCB0aGUgZG1hLWJ1ZiBoZWFwcyBwYXRjaHNldCBB
bmRyZXcgYW5kIEkKPiA+IGhhdmUgYmVlbiB3b3JraW5nIG9uIHdoaWNoIHRyaWVzIHRvIGRlc3Rh
Z2UgYSBmYWlyIGNodW5rIG9mIElPTgo+ID4gZnVuY3Rpb25hbGl0eS4KPiA+Cj4KPiBJJ3ZlIGdv
dHRlbiBib2dnZWQgZG93biB3aXRoIGJvdGggd29yayBhbmQgcGVyc29uYWwgdGFza3MKPiBzbyBJ
IGhhdmVuJ3QgaGFkIGEgY2hhbmNlIHRvIGxvb2sgdG9vIGNsb3NlbHkgYnV0LCBvbmNlIGFnYWlu
LAo+IEknbSBoYXBweSB0byBzZWUgdGhpcyBjb250aW51ZSB0byBtb3ZlIGZvcndhcmQuCj4KPiA+
IFRoZSBwYXRjaHNldCBpbXBsZW1lbnRzIHBlci1oZWFwIGRldmljZXMgd2hpY2ggY2FuIGJlIG9w
ZW5lZAo+ID4gZGlyZWN0bHkgYW5kIHRoZW4gYW4gaW9jdGwgaXMgdXNlZCB0byBhbGxvY2F0ZSBh
IGRtYWJ1ZiBmcm9tIHRoZQo+ID4gaGVhcC4KPiA+Cj4gPiBUaGUgaW50ZXJmYWNlIGlzIHNpbWls
YXIsIGJ1dCBtdWNoIHNpbXBsZXIgdGhlbiBJT05zLCBvbmx5Cj4gPiBwcm92aWRpbmcgYW4gQUxM
T0MgaW9jdGwuCj4gPgo+ID4gQWxzbywgSSd2ZSBwcm92aWRlZCByZWxhdGl2ZWx5IHNpbXBsZSBz
eXN0ZW0gYW5kIGNtYSBoZWFwcy4KPiA+Cj4gPiBJJ3ZlIGJvb3RlZCBhbmQgdGVzdGVkIHRoZXNl
IHBhdGNoZXMgd2l0aCBBT1NQIG9uIHRoZSBIaUtleTk2MAo+ID4gdXNpbmcgdGhlIGtlcm5lbCB0
cmVlIGhlcmU6Cj4gPiAgICBodHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9qb2huLnN0dWx0
ei9hbmRyb2lkLWRldi5naXQvbG9nLz9oPWRldi9kbWEtYnVmLWhlYXAKPiA+Cj4gPiBBbmQgdGhl
IHVzZXJzcGFjZSBjaGFuZ2VzIGhlcmU6Cj4gPiAgICBodHRwczovL2FuZHJvaWQtcmV2aWV3Lmdv
b2dsZXNvdXJjZS5jb20vYy9kZXZpY2UvbGluYXJvL2hpa2V5LysvOTA5NDM2Cj4gPgo+ID4gQ29t
cGFyZWQgdG8gSU9OLCB0aGlzIHBhdGNoc2V0IGlzIG1pc3NpbmcgdGhlIHN5c3RlbS1jb250aWcs
Cj4gPiBjYXJ2ZW91dCBhbmQgY2h1bmsgaGVhcHMsIGFzIEkgZG9uJ3QgaGF2ZSBhIGRldmljZSB0
aGF0IHVzZXMKPiA+IHRob3NlLCBzbyBJJ20gdW5hYmxlIHRvIGRvIG11Y2ggdXNlZnVsIHZhbGlk
YXRpb24gdGhlcmUuCj4gPiBBZGRpdGlvbmFsbHkgd2UgaGF2ZSBubyB1cHN0cmVhbSB1c2VycyBv
ZiBjaHVuayBvciBjYXJ2ZW91dCwKPiA+IGFuZCB0aGUgc3lzdGVtLWNvbnRpZyBoYXMgYmVlbiBk
ZXByZWNhdGVkIGluIHRoZSBjb21tb24vYW5kb2lkLSoKPiA+IGtlcm5lbHMsIHNvIHRoaXMgc2hv
dWxkIGJlIG9rLgo+ID4KPiA+IEkndmUgYWxzbyByZW1vdmVkIHRoZSBzdGF0cyBhY2NvdW50aW5n
IGZvciBub3csIHNpbmNlIGFueSBzdWNoCj4gPiBhY2NvdW50aW5nIHNob3VsZCBiZSBpbXBsZW1l
bnRlZCBieSBkbWEtYnVmIGNvcmUgb3IgdGhlIGhlYXBzCj4gPiB0aGVtc2VsdmVzLgo+ID4KPiA+
Cj4gPiBOZXcgaW4gdjY6Cj4gPiAqIE51bWJlciBvZiBjbGVhbnVwcyBhbmQgZXJyb3IgcGF0aCBm
aXhlcyBzdWdnZXN0ZWQgYnkgQnJpYW4gU3RhcmtleSwKPiA+ICAgIG1hbnkgdGhhbmtzIGZvciBo
aXMgY2xvc2UgcmV2aWV3IGFuZCBzdWdnZXN0aW9ucyEKPiA+Cj4gPgo+ID4gT3V0c3RhbmRpbmcg
Y29uY2VybnM6Cj4gPiAqIE5lZWQgdG8gYmV0dGVyIHVuZGVyc3RhbmQgdmFyaW91cyBzZWN1cmUg
aGVhcCBpbXBsZW1lbnRhdGlvbnMuCj4gPiAgICBTb21lIGNvbmNlcm4gdGhhdCBoZWFwIHByaXZh
dGUgZmxhZ3Mgd2lsbCBiZSBuZWVkZWQsIGJ1dCBpdHMKPiA+ICAgIGFsc28gcG9zc2libGUgdGhh
dCBkbWEtYnVmIGhlYXBzIGNhbid0IHNvbHZlIGV2ZXJ5b25lJ3MgbmVlZHMsCj4gPiAgICBpbiB3
aGljaCBjYXNlLCBhIHZlbmRvcidzIHNlY3VyZSBidWZmZXIgZHJpdmVyIGNhbiBpbXBsZW1lbnQK
PiA+ICAgIHRoZWlyIG93biBkbWEtYnVmIGV4cG9ydGVyLiBTbyBJJ20gbm90IHRvbyB3b3JyaWVk
IGhlcmUuCj4gPgo+Cj4gc3l6Ym90IGZvdW5kIGEgRG9TIHdpdGggSW9uIHdoaWNoIEkgQUNLZWQg
YSBmaXggZm9yLgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMDM3NjMzNjAtYTdkZS1k
ZTg3LWViOTAtYmE3ODM4MTQzOTMwQEktbG92ZS5TQUtVUkEubmUuanAvCj4gVGhpcyBzZXJpZXMg
ZG9lc24ndCBoYXZlIHRoZSBwYWdlIHBvb2xpbmcgc28gdGhhdCBwYXJ0aWN1bGFyIGJ1ZyBtYXkK
PiBub3QgYmUgYXBwbGljYWJsZSBidXQgZ2l2ZW4gdGhpcyBpcyBub3QgdGhlIGZpcnN0IHRpbWUg
SSd2ZQo+IHNlZW4gSW9uIHVzZWQgYXMgYSBEb1MgbWVjaGFuaXNtLCBpdCB3b3VsZCBiZSBnb29k
IHRvIHRoaW5rIGFib3V0Cj4gcHV0dGluZyBpbiBzb21lIGJhc2ljIGNoZWNrcy4KClllYSwgdGhl
cmUncyBubyBzaHJpbmtlciByaWdodCBub3cgKGFuZCBteSBXSVAgcGFnZSBwb29sCmltcGxlbWVu
dGF0aW9uIHN0ZWFscyB0aGUgbmV0d29yayBjb3JlJ3MgcGFnZXBvb2wsIHdoaWNoIGlzIHN0YXRp
Y2FsbHkKc2l6ZWQpLgoKQnV0IHRoZSBjaGVjayBpbiB0aGUgYWxsb2MgY29kZSBzZWVtcyByZWFz
b25hYmxlIHNvIEkgY2FuIGFkZCBpdCB0bwp3aGF0IEkgaGF2ZS4gQXBwcmVjaWF0ZSB0aGUgc3Vn
Z2VzdGlvbiEKCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
