Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A885378
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 21:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552956E762;
	Wed,  7 Aug 2019 19:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651A76E762
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 19:17:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 62so59995703lfa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 12:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMxqo/U0nw6DmpEA9S3YJIdfMVgNoxeRFMQ95NzIcMY=;
 b=sYnzP3PDQK4hm1IyFVv4DSVG8bReqN9hsSgSe4xArdH/Po7zhmRBRJl7ba+jAbXk52
 kxQBuv1dcRQ2gR4XlujQ31i04B2n8piN0vVIt8WJsbAljGWj/tMT0ZRnvpavfQeEJuvA
 B8PHZyHGsvO/Yj4dSaHnH8Lj40BAGnOOgNEfVTT68uAbXNM4TDIrWUawWortuc1HqOzA
 l/6BFpJCLejkEXI+/wdJ7Jk/eMU95AEWGp+GrSbMdmWRzWsfUP1YVCgchCYS4Z9TrNsd
 oGTkIeZjfaOZclavGkP3sS7ofOIS3mdFq4OX1KsYI2Ut9vJwdJiCSAxia+juCuGdJgr8
 0p6w==
X-Gm-Message-State: APjAAAWqdSgZvXvZ9SONGfo/vOlBRX07ooOZd0EZ9gf/gdncNosxFepD
 GZtCvuzDm2PZh6WALD8oIOHMFc1dsTQ=
X-Google-Smtp-Source: APXvYqxswoxyyUNv5YA72tJw0PPSlvIVMX8LFVVTB1bbIMe7WFtPDP8KIC6kmBmM7RxFdvIbCJgzHg==
X-Received: by 2002:a19:ed11:: with SMTP id y17mr6770300lfy.141.1565205431260; 
 Wed, 07 Aug 2019 12:17:11 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id d16sm356307lfi.31.2019.08.07.12.17.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 12:17:09 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id t28so86535232lje.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 12:17:09 -0700 (PDT)
X-Received: by 2002:a2e:9b83:: with SMTP id z3mr5553524lji.84.1565205428980;
 Wed, 07 Aug 2019 12:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9twvwhm318btWy_WkQxOcpRCzjpok52R8zPQxQrnQ8QzwQ@mail.gmail.com>
 <CAHk-=wjC3VX5hSeGRA1SCLjT+hewPbbG4vSJPFK7iy26z4QAyw@mail.gmail.com>
 <CAHk-=wiD6a189CXj-ugRzCxA9r1+siSCA0eP_eoZ_bk_bLTRMw@mail.gmail.com>
 <48890b55-afc5-ced8-5913-5a755ce6c1ab@shipmail.org>
 <CAHk-=whwcMLwcQZTmWgCnSn=LHpQG+EBbWevJEj5YTKMiE_-oQ@mail.gmail.com>
 <CAHk-=wghASUU7QmoibQK7XS09na7rDRrjSrWPwkGz=qLnGp_Xw@mail.gmail.com>
 <20190806073831.GA26668@infradead.org>
 <CAHk-=wi7L0MDG7DY39Hx6v8jUMSq3ZCE3QTnKKirba_8KAFNyw@mail.gmail.com>
 <20190806190937.GD30179@bombadil.infradead.org>
 <20190807064000.GC6002@infradead.org>
In-Reply-To: <20190807064000.GC6002@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Aug 2019 12:16:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgUO5hWJmMT7r8aCzP7DOkg9ADkv6AzZ=SrKLOoKxzD_g@mail.gmail.com>
Message-ID: <CAHk-=wgUO5hWJmMT7r8aCzP7DOkg9ADkv6AzZ=SrKLOoKxzD_g@mail.gmail.com>
Subject: Re: drm pull for v5.3-rc1
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IMxqo/U0nw6DmpEA9S3YJIdfMVgNoxeRFMQ95NzIcMY=;
 b=QFLKrC5vkJW5FKE/Mdgg0Cdcp3sO/GQpVGltLV5Ca6yR5XaMmMWdxOVi8385PLpByn
 E/O5WhMsHLvDBDcmUFvSEBG08jBSq6LjIkgwV1Bf+j33ocpUvmt4+vvljJI1lHX8UUqK
 0knAjZ61PyQ7e0qOT6M/ZBN+bdOB8TBJJv+4A=
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
 Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>,
 Linux-MM <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMTo0MCBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gSSdtIG5vdCBhbiBhbGwgdGhhdCBodWdlIGZhbiBvZiBz
dXBlciBtYWdpYyBtYWNybyBsb29wcy4gIEJ1dCBpbiB0aGlzCj4gY2FzZSBJIGRvbid0IHNlZSBo
b3cgaXQgY291bGQgZXZlbiB3b3JrLCBhcyB3ZSBnZXQgc3BlY2lhbCBjYWxsYmFja3MKPiBmb3Ig
aHVnZSBwYWdlcyBhbmQgaG9sZXMsIGFuZCBwZW9wbGUgYXJlIHRyeWluZyB0byBhZGQgYSBmZXcg
bW9yZSBvcHMKPiBhcyB3ZWxsLgoKWWVhaCwgaW4gdGhpcyBjYXNlIHdlIGRlZmluaXRlbHkgZG9u
J3Qgd2FudCB0byBtYWtlIHNvbWUgbWFnaWMgbG9vcCB3YWxrZXIuCgpMb29wcyBhcmUgY2VydGFp
bmx5IHNpbXBsZXIgdGhhbiBjYWxsYmFja3MgZm9yIG1vc3QgY2FzZXMgKGFuZCBvZnRlbgpmYXN0
ZXIgYmVjYXVzZSB5b3UgZG9uJ3QgaGF2ZSBpbmRpcmVjdCBjYWxscyB3aGljaCBub3cgYXJlIGdl
dHRpbmcKcXVpdGUgZXhwZW5zaXZlKSwgYnV0IHRoZSB3YWxrZXIgY29kZSByZWFsbHkgZG9lcyBl
bmQgdXAgaGF2aW5nIHRvbnMKb2YgZGlmZmVyZW50IGNhc2VzIHRoYXQgeW91J2QgaGF2ZSB0byBo
YW5kbGUgd2l0aCBtYWdpYyBjb21wbGV4CmNvbmRpdGlvbmFscyBvciBzd2l0Y2ggc3RhdGVtZW50
cyBpbnN0ZWFkLgoKU28gdGhlICJ3YWxrIG92ZXIgcmFuZ2UgdXNpbmcgdGhpcyBzZXQgb2YgY2Fs
bGJhY2tzIiBpcyBnZW5lcmFsbHkgdGhlCnJpZ2h0IGludGVyZmFjZS4gSWYgdGhlcmUgaXMgc29t
ZSBwYXJ0aWN1bGFyIGNhc2UgdGhhdCBtaWdodCBiZSB2ZXJ5CnNpbXBsZSBhbmQgdGhlIGNhbGxi
YWNrIG1vZGVsIGlzIGV4cGVuc2l2ZSBkdWUgdG8gaW5kaXJlY3QgY2FsbHMgZm9yCmVhY2ggcGFn
ZSwgdGhlbiBzdWNoIGEgY2FzZSBzaG91bGQgcHJvYmFibHkgdXNlIHRoZSBub3JtYWwgcGFnZQp3
YWxraW5nIGxvb3BzICh0aGF0IHdlICp1c2VkKiB0byBoYXZlIGV2ZXJ5d2hlcmUgLSB0aGUgIndh
bGtfcmFuZ2UoKSIKaW50ZXJmYWNlIGlzIHRoZSAibmV3IiBtb2RlbCBmb3IgYWxsIHRoZSByYW5k
b20gb2RkIHNwZWNpYWwgY2FzZXMpLgoKICAgICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
