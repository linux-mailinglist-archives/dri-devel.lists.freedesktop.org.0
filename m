Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA929C97
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3655E6E12A;
	Fri, 24 May 2019 16:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDED26E12A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 16:59:20 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id t24so9289916otl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEsvEvFjlwXN7UDcC7wBfcVN0ngYDlTviwk40lFh0VE=;
 b=jBof+l7/TJQSg3J0qRbWxOXQ6mya1E8U1APnsELQdoaXivMUmdbuwwSTdy63fkob5D
 BAYPAEVXeq3dOaohj7RmXsrrj9E1ahnOCLuI7sxskKFBW6Gypcl5o1NkCYVrPtrYanZT
 XPqphuiGVs2jZMU2BEhUo71CNxyklbR4Ynq8MGcedz0lJJ+eePry5q1GmeY1uab5JRJ4
 DoaseBYE4OXLiIGA9oiFUdY2SLOnzhL5hjGdD+GX4WHW5R5jYR3RGaEQltHuhOhqa4RF
 UkcDTekC9DMP33onBZvQy1hX/CPwcVPq6av0JZgP/Yn8SCZ3DQ0V/AbT8Ty/GtDX+ZtK
 n5eQ==
X-Gm-Message-State: APjAAAU+7Kdn790Z8lugqLUgvu8HP133Bo1+iQMFYulqlYidtkWQBoEO
 sCvMwS3XyRYoF2NKODv7L2jDzWaPTet6C1QAjIN6Ew==
X-Google-Smtp-Source: APXvYqyPbMvtr56mDew3jzxBkjA+50maDgvK6bd7zBN/VZAbXpM4qVtqYD8AqQh52rPXg2kktDPJwMkBLyw2j0YmSis=
X-Received: by 2002:a05:6830:16d2:: with SMTP id
 l18mr29769854otr.303.1558717159283; 
 Fri, 24 May 2019 09:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190523154149.GB12159@ziepe.ca>
 <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca> <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca> <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca> <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca> <20190524162709.GD21222@phenom.ffwll.local>
 <20190524165301.GD16845@ziepe.ca>
In-Reply-To: <20190524165301.GD16845@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 24 May 2019 18:59:07 +0200
Message-ID: <CAKMK7uHODeVX4DHdM-w2xkqCmN71MaQH1ZiRZcPN38Hhy0A-sQ@mail.gmail.com>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gEsvEvFjlwXN7UDcC7wBfcVN0ngYDlTviwk40lFh0VE=;
 b=F+JKEfzZoisl55BG48UjSnmshBQgO9/0HkQVAr6Vyzhbpu8ZE5OYQdCLS2r7gg5Fet
 xsFTm/CY0rb9DvK2SU4u8wLrvEc5OpWNJcfbSDisSY2sMAlLWvWz1GZjZ2H3Uqu7oCCF
 IQMwHXKRFilGrj1cyLDjSwk6YUEP2rgdWgWYA=
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Doug Ledford <dledford@redhat.com>, Linux MM <linux-mm@kvack.org>,
 linux-rdma@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kaike Wan <kaike.wan@intel.com>,
 Christoph Hellwig <hch@infradead.org>, Leon Romanovsky <leonro@mellanox.com>,
 Jerome Glisse <jglisse@redhat.com>, Moni Shoua <monis@mellanox.com>,
 Artemy Kovalyov <artemyko@mellanox.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgNjo1MyBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAwNjoyNzowOVBNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gU3VyZSB0b3BpYyBicmFuY2ggc291bmRzIGZpbmUs
IHdlIGRvIHRoYXQgYWxsIHRoZSB0aW1lIHdpdGggdmFyaW91cwo+ID4gc3Vic3lzdGVtcyBhbGwg
b3Zlci4gV2UgaGF2ZSByZWFkeSBtYWRlIHNjcmlwdHMgZm9yIHRvcGljIGJyYW5jaGVzIGFuZAo+
ID4gYXBwbHlpbmcgcHVsbHMgZnJvbSBhbGwgb3Zlciwgc28gd2UgY2FuIGV2ZW4gc29hayB0ZXN0
IGV2ZXJ5dGhpbmcgaW4gb3VyCj4gPiBpbnRlZ3JhdGlvbiB0cmVlLiBJbiBjYXNlIHRoZXJlJ3Mg
Y29uZmxpY3RzIG9yIGp1c3QgdG8gbWFrZSBzdXJlCj4gPiBldmVyeXRoaW5nIHdvcmtzLCBiZWZv
cmUgd2UgYmFrZSB0aGUgdG9waWMgYnJhbmNoIGludG8gcGVybWFuZW50IGhpc3RvcnkKPiA+ICh0
aGUgbWFpbiBkcm0uZ2l0IHJlcG8ganVzdCBjYW4ndCBiZSByZWJhc2VkLCB0b28gbXVjaCBnb2lu
ZyBvbiBhbmQgdG9vCj4gPiBtYW55IHBlb3BsZSBpbnZvbHZkKS4KPgo+IFdlIGRvbid0IHJlYmFz
ZSByZG1hLmdpdCBlaXRoZXIgZm9yIHRoZSBzYW1lIHJlYXNvbnMgYW5kIG5vciBkb2VzCj4gbmV0
ZGV2Cj4KPiBTbyB0aGUgdXN1YWwgZmxvdyBmb3IgYSBzaGFyZWQgdG9waWMgYnJhbmNoIGlzIGFs
c28gbm8tcmViYXNlIC0KPiB0ZXN0aW5nL2V0YyBuZWVkcyB0byBiZSBkb25lIGJlZm9yZSB0aGlu
Z3MgZ2V0IGFwcGxpZWQgdG8gaXQuCgpSZWJhc2luZyBiZWZvcmUgaXQgZ2V0cyBiYWtlZCBpbnRv
IGFueSB0cmVlIGlzIHN0aWxsIG9rLiBBbmQgZm9yCnNvbWV0aGluZyBsaWtlIHRoaXMgd2UgZG8g
bmVlZCBhIHRlc3QgYnJhbmNoIGZpcnN0LCB3aGljaCBtaWdodCBuZWVkIGEKZml4dXAgcGF0Y2gg
c3F1YXNoZWQgaW4uIE9uIHRoZSBkcm0gc2lkZSB3ZSBoYXZlIGEgZHJtLWxvY2FsCmludGVncmF0
aW9uIHRyZWUgZm9yIHRoaXMgc3R1ZmYgKGxpa2UgbGludXgtbmV4dCwgYnV0IHdpdGhvdXQgYWxs
IHRoZQpvdGhlciBzdHVmZiB0aGF0J3Mgbm90IHJlbGV2YW50IGZvciBncmFwaGljcykuIEJ1dCB5
ZWFoIHRoYXQncyBqdXN0CmRldGFpbHMsIGVhc3kgdG8gZmlndXJlIG91dC4KLURhbmllbAotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
