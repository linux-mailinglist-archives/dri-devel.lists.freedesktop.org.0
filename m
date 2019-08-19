Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76295887
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AAA6E612;
	Tue, 20 Aug 2019 07:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA42689A88
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:39:39 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z3so4796340iog.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 07:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uihSuMZgomyGZANDE8KD/f274IaYbI03Q2f2KOfxM+I=;
 b=Ykvx/ZWkv3NTqLXwwy8sGy2CAhjeWcIeO0MHvfVEB/wgJ1I5N92cvb8f7obdNWss7n
 3qzFEQBR1ku96xWbtPagU7QAJeYz14CW+dSY2Cf4tZND3wLGCFHsOZMTNZry6zd4ALqi
 FX45l6IPFSqsaUh8WnmzPiDAa4ZGNqo0/ey5kCayqarbXhMoDVNrQn2OgvEacTrnqt68
 ys8Bflyl6LPp07SWn/d0FePWxbwQbmtMmUnOnkUksSjJJ89D606XvJDjBiR7jyQP1qrn
 jcw/L71SIorUVXpUxt672tc6nHVgk31BUQvMNPP1kO9NahK1cFt4XajO+RlbOqaIE4nV
 ODOQ==
X-Gm-Message-State: APjAAAXS1QmNuq4sjievqqSDRotoIrlB3guMinlolsiRt1yVUuichGTI
 LyFOd8yuUwopmBexZcihKsFwWRxBd7OdxwGJr/GJWw==
X-Google-Smtp-Source: APXvYqz6Nv2dbwOe9HSAvOxPraz8WQBelvTJmAdxSGjJxMIvJwbUVb+lNapnG//etYvf72f9eR76xtLaC0ncZuslMFg=
X-Received: by 2002:a02:495:: with SMTP id 143mr26534114jab.94.1566225579086; 
 Mon, 19 Aug 2019 07:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
 <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
 <20190819052337.GA16622@lst.de>
In-Reply-To: <20190819052337.GA16622@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 19 Aug 2019 07:39:28 -0700
Message-ID: <CAJs_Fx4YfU8iqN+t-h-HxsWRd-KAasHcQaV-9p4Wz=A--5Epew@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uihSuMZgomyGZANDE8KD/f274IaYbI03Q2f2KOfxM+I=;
 b=G1P7027eiopfDNG6P5YZ9VLMsznbA4z4vedgr8lIVKSFnae2VedRHZ6nX8k5yHQCUK
 KT2VGNI0tUXnWAj13PW27yUJ1Je5CbSjrJc4637U4Q++6YLy84df+X0IxMvBMxp8Ga5J
 gsL2kdXf74WAqz9w/dKETVrKY5fhbOpIzd3+c=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 Deepak Sharma <deepak.sharma@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Enrico Weigelt <info@metux.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMTgsIDIwMTkgYXQgMTA6MjMgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDI6MDQ6MzVQTSAtMDcw
MCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gSSBkb24ndCBkaXNhZ3JlZSBhYm91dCBuZWVkaW5nIGFu
IEFQSSB0byBnZXQgdW5jYWNoZWQgbWVtb3J5IChvcgo+ID4gaWRlYWxseSBqdXN0IHNvbWV0aGlu
ZyBvdXRzaWRlIG9mIHRoZSBsaW5lYXIgbWFwKS4gIEJ1dCBJIHRoaW5rIHRoaXMKPiA+IGlzIGEg
c2VwYXJhdGUgcHJvYmxlbS4KPiA+Cj4gPiBXaGF0IEkgd2FzIGhvcGluZyBmb3IsIGZvciB2NS40
LCBpcyBhIHdheSB0byBzdG9wIGFidXNpbmcgZG1hX21hcC9zeW5jCj4gPiBmb3IgY2FjaGUgb3Bz
IHRvIGdldCByaWQgb2YgdGhlIGhhY2sgSSBoYWQgdG8gbWFrZSBmb3IgdjUuMy4gIEFuZCBhbHNv
Cj4gPiB0byBmaXggdmdlbSBvbiBub24teDg2LiAgKFVuZm9ydHVuYXRlbHkgY2hhbmdpbmcgdmdl
bSB0byB1c2VkIGNhY2hlZAo+ID4gbWFwcGluZ3MgYnJlYWtzIHg4NiBDSSwgYnV0IGZpeGVzIENJ
IG9uIGFybS9hcm02NC4uKSAgV2UgY2FuIGRvIHRoYXQKPiA+IHdpdGhvdXQgYW55IGNoYW5nZXMg
aW4gYWxsb2NhdGlvbi4gIFRoZXJlIGlzIHN0aWxsIHRoZSBwb3NzaWJpbGl0eSBmb3IKPiA+IHBy
b2JsZW1zIGR1ZSB0byBjYWNoZWQgYWxpYXMsIGJ1dCB0aGF0IGhhcyBiZWVuIGEgcHJvYmxlbSB0
aGlzIHdob2xlCj4gPiB0aW1lLCBpdCBpc24ndCBzb21ldGhpbmcgbmV3Lgo+Cj4gQnV0IHRoYXQg
anVzdCBtZWFucyB3ZSBzdGFydCBleHBvc2luZyByYW5kb20gbG93LWxldmVsIEFQSXMgdGhhdAo+
IHBlb3BsZSB3aWxsIHF1aWNrbHkgYWJ1c2UuLiAgSW4gZmFjdCBldmVuIHlvdXIgc2ltcGxlIHBs
YW4gdG8gc29tZQo+IGV4dGVudCBhbHJlYWR5IGlzIGFuIGFidXNlIG9mIHRoZSBpbnRlbnQgb2Yg
dGhlc2UgZnVuY3Rpb25zLCBhbmQKPiBpdCBhbHNvIHJlcXVpcmVzIGEgbG90IG9mIGtub3dsZWRn
ZSBpbiB0aGUgZHJpdmVyIHRoYXQgaW4gdGhlIG5vcm1hbAo+IGNhc2VzIGRyaXZlcnMgY2FuJ3Qg
a25vdyAoZS5nLiBpcyB0aGUgZGV2aWNlIGRtYSBjb2hlcmVudCBvciBub3QpLgoKSSBjYW4gYWdy
ZWUgdGhhdCBtb3N0IGRyaXZlcnMgc2hvdWxkIHVzZSB0aGUgaGlnaGVyIGxldmVsIEFQSXMuLiBi
dXQKbm90IHRoYXQgd2UgbXVzdCBwcmV2ZW50ICphbGwqIGRyaXZlcnMgZnJvbSB1c2luZyB0aGVt
LiAgTW9zdCBvZiB3aGF0CkRNQSBBUEkgaXMgdHJ5aW5nIHRvIHNvbHZlIGRvZXNuJ3QgYXBwbHkg
dG8gYSBkcml2ZXIgbGlrZSBkcm0vbXNtLi4Kd2hpY2ggaXMgaG93IHdlIGVuZGVkIHVwIHdpdGgg
aGFja3MgdG8gdHJ5IGFuZCBtaXN1c2UgdGhlIGhpZ2ggbGV2ZWwKQVBJIHRvIGFjY29tcGxpc2gg
d2hhdCB3ZSBuZWVkLgoKUGVyaGFwcyB3ZSBjYW4gcHJvdGVjdCB0aGUgcHJvdG90eXBlcyB3aXRo
ICNpZmRlZiBMT1dMRVZFTF9ETUFfQVBJIC8KI2VuZGlmIHR5cGUgdGhpbmcgdG8gbWFrZSBpdCBt
b3JlIG9idmlvdXMgdG8gb3RoZXIgZHJpdmVycyB0aGF0IGl0CnByb2JhYmx5IGlzbid0IHRoZSBB
UEkgdGhleSBzaG91bGQgdXNlPwoKQlIsCi1SCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
