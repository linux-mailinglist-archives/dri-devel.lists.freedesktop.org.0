Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59DE838F9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 20:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7563D89B97;
	Tue,  6 Aug 2019 18:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9E489B97
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 18:51:02 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id m8so49513192lji.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 11:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YFrdn8TjmQNSnIaAcCuqbEzq3mrXCDg59WKear6Xdpg=;
 b=k3gnkZC4W82Px+LWEDfRLTAiEKA/MGSNw8cjaAGXm5g+UsYGF+Zx5/DCeT3MMDSJwz
 aeyFnZxID6mbq1B31a4q/w5eOXSbPnd3IFhftCI+sgcArRz8jhbYrACIY/GJzciRstAr
 feUdbYUcWIYON3/BvFkbkDQ6oc3DsJBblLT3SffPVNZDdpCHasDZNXK59oHZUOXMrP+m
 zOz0eCCdQ8vYINTcZapIlFe0hL6ZETnCBH2MgU9UTn1Vf2GsKkgCbmapafqIGBTqGvps
 G6qeEKQ17JP6Aod9WCKyamwet68OBJXJAl6SmMBBHglD58hUWmUDepLNRlgmztHCgHmN
 1XSA==
X-Gm-Message-State: APjAAAV2+gtT/OeOKPKITKY4pSxcDsGlFNSlRH4KbJ6Y+OEOoGVqyDrK
 N2CkMN1GRDjxuj0ijvqmpdjqCySLYNo=
X-Google-Smtp-Source: APXvYqyQtBIzbU8sDkX9BA9EcfPDAeQRWZ7paMFqLin4Qt5GT8tTXOidAs44aL9BRRVVt0TSEsN03Q==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr2545759lji.64.1565117460608;
 Tue, 06 Aug 2019 11:51:00 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id c89sm9746207ljf.83.2019.08.06.11.50.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 11:50:59 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id c9so61959027lfh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 11:50:59 -0700 (PDT)
X-Received: by 2002:a19:c20b:: with SMTP id l11mr3479307lfc.106.1565117458380; 
 Tue, 06 Aug 2019 11:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
 <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
In-Reply-To: <20190806073831.GA26668@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 Aug 2019 11:50:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
Message-ID: <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YFrdn8TjmQNSnIaAcCuqbEzq3mrXCDg59WKear6Xdpg=;
 b=MlysRV02mcMixM5P973XDGPSxckBz4Nea7C3SNGSHcfQXpMYCeOaEo4xQvZFVIgIBy
 AFFjp9IQ8QdVB/2B+8z1j1rT4dC0Ak27vpobppoYytcpWfuMnn4/z0OVQMXSAxk5j/X4
 5pVDLEKsr8UIaKS0UpizhCPTazxnvNME05Bg0=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas@shipmail.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Linux-MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMjozOCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gU2VlbXMgbGlrZSBubyBvbmUgdG9vayB0aGlzIHVwLiAg
QmVsb3cgaXMgYSB2ZXJzaW9uIHdoaWNoIEkgdGhpbmsgaXMKPiBzbGlnaHRseSBiZXR0ZXIgYnkg
YWxzbyBtb3ZpbmcgdGhlIG1tX3dhbGsgc3RydWN0dXJlIGluaXRpYWxpemF0aW9uCj4gaW50byB0
aGUgaGVscGVycywgd2l0aCBhbiBvdXRjb21lIG9mIGp1c3QgYSBoYW5kZnVsIG9mIGFkZGVkIGxp
bmVzLgoKQWNrLiBBZ3JlZWQsIEkgdGhpbmsgdGhhdCdzIGEgbmljZXIgaW50ZXJmYWNlLgoKSW4g
ZmFjdCwgSSBkbyBub3RlIHRoYXQgYSBsb3Qgb2YgdGhlIHVzZXJzIGRvbid0IGFjdHVhbGx5IHVz
ZSB0aGUKInZvaWQgKnByaXZhdGUiIGFyZ3VtZW50IGF0IGFsbCAtIHRoZXkganVzdCB3YW50IHRo
ZSB3YWxrZXIgLSBhbmQganVzdApwYXNzIGluIGEgTlVMTCBwcml2YXRlIHBvaW50ZXIuIFNvIHdl
IGhhdmUgdGhpbmdzIGxpa2UgdGhpczoKCj4gKyAgICAgICBpZiAod2Fsa19wYWdlX3JhbmdlKCZp
bml0X21tLCB2YSwgdmEgKyBzaXplLCAmc2V0X25vY2FjaGVfd2Fsa19vcHMsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCkpIHsKCmFuZCBpbiBhIHBlcmZlY3Qgd29ybGQgd2UnZCBoYXZl
IGFyZ3VtZW50cyB3aXRoIGRlZmF1bHQgdmFsdWVzIHNvIHRoYXQKd2UgY291bGQgc2tpcCB0aG9z
ZSBlbnRpcmVseSBmb3Igd2hlbiBwZW9wbGUganVzdCBkb24ndCBuZWVkIGl0LgoKSSdtIG5vdCBh
IGh1Z2UgZmFuIG9mIEMrKyBiZWNhdXNlIG9mIGEgbG90IG9mIHRoZSBjb21wbGV4aXR5IChhbmQg
c29tZQpyZWFsbHkgYmFkIGRlY2lzaW9ucyksIGJ1dCBtYW55IG9mIHRoZSBfc3ludGFjdGljXyB0
aGluZ3MgaW4gQysrIHdvdWxkCmJlIG5pY2UgdG8gdXNlLiBUaGlzIG9uZSBkb2Vzbid0IHNlZW0g
dG8gYmUgb25lIHRoYXQgdGhlIGdjYyBwZW9wbGUKaGF2ZSBwaWNrZWQgdXAgYXMgYW4gZXh0ZW5z
aW9uIDsoCgpZZXMsIHllcywgd2UgY291bGQgZG8gaXQgd2l0aCBhIG1hY3JvLCBJIGd1ZXNzLgoK
ICAgI2RlZmluZSB3YWxrX3BhZ2VfcmFuZ2UobW0sIHN0YXJ0LGVuZCwgb3BzLCAuLi4pIFwKICAg
ICAgIF9fd2Fsa19wYWdlX3JhbmdlKG1tLCBzdGFydCwgZW5kLCAoTlVMTCAsICMjIF9fVkFfQVJH
U19fKSkKCmJ1dCBJJ20gbm90IHN1cmUgaXQncyB3b3J0aHdoaWxlLgoKICAgICAgICAgICAgICAg
ICAgTGludXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
