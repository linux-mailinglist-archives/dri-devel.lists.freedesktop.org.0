Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41E905F5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 18:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C111A6E364;
	Fri, 16 Aug 2019 16:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1646E364
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 16:37:04 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m24so10053720otp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 09:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3TjiC7tL5tVLJpZgBmmeBYDZnQ+YoBFviaBZJfxvqRo=;
 b=TAxLXU+245nz8diWynEYoz5zOKJx4FEgzCzrq4n5EYxTX8u6m10L5p5mUufMCVMQlS
 P+d03QA6LdgC89os7+Nw/Zp89mYTytULBnsuRJDd73kxPll99brcPokXXJVAZy2ApbuK
 /YTCIbFVkVPFkTVxXs7PVaPpj5w69zkHECGIEDAV1k/7GeDiJlv21lam9dZN+mksHoH2
 zmdCh6PrDEpPrXuQOAq+OYI/QCR72Uhakp1hMykimeWlmzwDcpqvQaW044fM9fCCQ+VK
 FSZuBz3d5zriKd2IdtAFTc2PQqy55U1RF/AYusREUiDXrJPxyMPNy+msQV691B6iFRXM
 zX3Q==
X-Gm-Message-State: APjAAAXMxAdxCsdUhySy+FRwuTKUbsJsvRpkTCe5XEkJk2FX9LWs+HPq
 aEiHdKuGoBSrKZVAORCHOCQEFnyRFZOdDYRRxwtMTw==
X-Google-Smtp-Source: APXvYqxJCBauYrVR7fqS+LuWRAKsoJ5dG70QezYi/k/QXJiyisCvN0d9PyJccgTFO91to0aqDKVlvYvo6VHCa8rK6mw=
X-Received: by 2002:a9d:1ca3:: with SMTP id l35mr7813768ota.106.1565973423804; 
 Fri, 16 Aug 2019 09:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190815190525.GS9477@dhcp22.suse.cz>
 <20190815191810.GR21596@ziepe.ca>
 <20190815193526.GT9477@dhcp22.suse.cz>
 <CAKMK7uH42EgdxL18yce-7yay=x=Gb21nBs3nY7RA92Nsd-HCNA@mail.gmail.com>
 <20190815202721.GV21596@ziepe.ca>
 <CAKMK7uER0u1TqeJBXarKakphnyZTHOmedOfXXqLGVDE2mE-mAQ@mail.gmail.com>
 <20190816010036.GA9915@ziepe.ca>
 <CAKMK7uH0oa10LoCiEbj1NqAfWitbdOa-jQm9hM=iNL-=8gH9nw@mail.gmail.com>
 <20190816121243.GB5398@ziepe.ca>
 <CAKMK7uHk03OD+N-anPf-ADPzvQJ_NbQXFh5WsVUo-Ewv9vcOAw@mail.gmail.com>
 <20190816143819.GE5398@ziepe.ca>
In-Reply-To: <20190816143819.GE5398@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Aug 2019 18:36:52 +0200
Message-ID: <CAKMK7uGzOO4nZPbZzmaDjjBGZiV2HjgdbT45q9Rd5wTO14VH2w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3TjiC7tL5tVLJpZgBmmeBYDZnQ+YoBFviaBZJfxvqRo=;
 b=JfOVHWNQNFhlm05DIsQUQILP6M8uBwVqZSzqy1eYSpIOTEaQbCtHbvykAwr22Tl6G1
 RNXH1jUaj+1SuMHTPPN2vG+sS56vR/rcdrJk34I37Kr5H+ovEq9dCHTkoSWPVy5ywMLh
 lz1n0dh2WMbvNoSKqCFONNRk5N6dN3lYNnwsE=
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
Cc: Feng Tang <feng.tang@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNDozOCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwNDoxMTozNFBNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gQWxzbywgYXNpZGUgZnJvbSB0aGlzIHBhdGNoICh3
aGljaCBpcyBwcmVwIGZvciB0aGUgbmV4dCkgYW5kIHNvbWUKPiA+IHNpbXBsZSByZW9yZGVyaW5n
IGNvbmZsaWN0cyB0aGV5J3JlIGFsbCBpbmRlcGVuZGVudC4gU28gaWYgdGhlcmUncyBubwo+ID4g
d2F5IHRvIHBhaW50IHRoaXMgYmlrZXNoZWQgaGVyZSAodGVjaG5pY29sb3IgcGVyaGFwcz8pIHRo
ZW4gSSdkIGxpa2UKPiA+IHRvIGdldCBhdCBsZWFzdCB0aGUgb3RoZXJzIGNvbnNpZGVyZWQuCj4K
PiBTdXJlLCBJIHRoaW5rIGZvciBjb25mbGljdCBhdm9pZGFuY2UgcmVhc29ucyBJJ20gcHJvYmFi
bHkgdGFraW5nCj4gbW11X25vdGlmaWVyIHN0dWZmIHZpYSBobW0uZ2l0LCBzbzoKPgo+IC0gQW5k
cmV3IGhhZCBhIG1pbm9yIHJlbWFyayBvbiAjMSwgSSBhbSBhbWJpdmFsZW50IGFuZCB3b3VsZCB0
YWtlIGl0Cj4gICBhcy1pcy4gWW91ciBkZWNpc2lvbiBpZiB5b3Ugd2FudCB0byByZXNwaW4uCgpJ
IGxpa2UgbWluZSBiZXR0ZXIsIHNlZSBhbHNvIHRoZSByZXBseSBmcm9tIFJhbHBoIENhbXBiZWxs
LgoKPiAtICMyLyMzIGlzIHRoaXMgaXNzdWUsIEkgd291bGQgc3RhbmQgYnkgdGhlIHByZWVtcHRf
ZGlzYWJsZS9ldGMgcGF0aAo+ICAgT3VyIHNpdHVhdGlvbiBtYXRjaGVzIHlvdXJzLCBkZWJ1ZyB0
ZXN0cyBydW4gbG9ja2RlcC9ldGMuCgpTaW5jZSBNaWNoYWwgcmVxdWVzdGVkIHRoZSBjdXJyZW50
IGZsYXZvdXIgSSB0aGluayB3ZSBuZWVkIHNwaW4gYSBiaXQKbW9yZSBvbiB0aGVzZSBoZXJlLiBJ
IGd1ZXNzIEknbGwganVzdCByZWJhc2UgdGhlbSB0byB0aGUgZW5kIHNvCnRoZXkncmUgbm90IGhv
bGRpbmcgdXAgdGhlIG90aGVycy4KCj4gLSAjNCBJIGxpa2UgYSBsb3QsIGV4Y2VwdCB0aGUgbWFw
IHNob3VsZCBlbmNsb3NlIHJhbmdlX2VuZCB0b28sCj4gICB0aGlzIGNhbiBiZSBkb25lIGFmdGVy
IHRoZSBtbV9oYXNfbm90aWZpZXJzIGluc2lkZSB0aGUKPiAgIF9fbW11X25vdGlmaWVyIGZ1bmN0
aW9uCgpUbyBtYWtlIHN1cmUgSSBnZXQgdGhpcyByaWdodDogVGhlIHNhbWUgbG9ja2RlcCBjb250
ZXh0LCBidXQgYWxzbwp3cmFwcGVkIGFyb3VuZCBpbnZhbGlkYXRlX3JhbmdlX2VuZD8gRnJvbSBt
eSB1bmRlcnN0YW5kaW5nIG9mIHB0ZQp6YXBwaW5nIHRoYXQgbWFrZXMgc2Vuc2UsIGJ1dCBJJ20g
ZGVmaW5pdGVseSBub3Qgd2VsbC12ZXJzZWQgZW5vdWdoCmZvciB0aGF0LgoKPiAgIENhbiB5b3Ug
cmVzcGluPwoKV2lsbCBkby4KCj4gICBJIHdpbGwgcHJvcG9zZSBwcmVsb2FkaW5nIHRoZSBtYXAg
aW4gYW5vdGhlciBwYXRjaAo+IC0gIzUgaXMgYWxyZWFkeSBhcHBsaWVkIGluIC1yYwoKWXVwLCBJ
J2xsIGRyb3AgdGhhdCBvbmUuCgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
