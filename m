Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27052332D1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F1E8989F;
	Thu, 30 Jul 2020 13:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764318989F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:17:26 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 93so9855862otx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l6NNuTlAlb+T71eovQReK+men4boXEXZJmc745e1mek=;
 b=Tj45p5a06zkqFl6bUdtEmCxMS67sh1pLfLaP0MJK1JKsob6GFGtCQSeLESCL2s30Bo
 ou0Hr4WM+OKrYig/4okfOklio8NyYxv+hqW65aWlMC+/KH2ReSdB2qWfNUvAmIpCL5GB
 NCD+kQkkx7Q/TROpmA3URVMeplfnD5XbvU6DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l6NNuTlAlb+T71eovQReK+men4boXEXZJmc745e1mek=;
 b=R8SRvab0I/QWmc31+vBlN4eG9XUt5hQLadWfNGL/DtaCwGNazRa7vOBhp9gU2wOXfG
 t8qTlz56b3fq5VR/3EaltERq/JaAfAzHNCwEixPIEO3tJdgjqiVr+y5hU+SDkTyA6wzk
 n6wV93864ZNtjAFNCBvrupAhg4Zf2KH+6d5lUfpevZb25gL4ClMsDSR64n6GeeAgJhNb
 yJRgKiyFU0tG4IXP7Ovy/iMkSdW77v+A4WtjIt7jwoHnIE0nLc6e+DtU0IYl04DwdzkX
 gPwFO2lvEXpzYqGWrCZ+Vc5aqxMJXVW7omMd/gstIDo3lzZ8prZNsr2wrS+iYuh6T27F
 dbFA==
X-Gm-Message-State: AOAM530qqT17Z2tOLiJGPjqHC3y9Xh9J44wStkzjyqDgcMh51NCnqMzJ
 geS9SivCJGhj2duQVIDh49JCflRE/f7Ge2W5j5N//g==
X-Google-Smtp-Source: ABdhPJyT+P5EKFUT/rekKMDvcsT0JZ6B1aXbsvpwMmAI2gySdtJl4PHRq6e+n9dVUTuKG5DRk4IoPKAkcy7FpSExRU8=
X-Received: by 2002:a9d:6052:: with SMTP id v18mr2134622otj.303.1596115045756; 
 Thu, 30 Jul 2020 06:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200728135839.1035515-1-daniel.vetter@ffwll.ch>
 <38cbc4fb-3a88-47c4-2d6c-4d90f9be42e7@shipmail.org>
In-Reply-To: <38cbc4fb-3a88-47c4-2d6c-4d90f9be42e7@shipmail.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 30 Jul 2020 15:17:14 +0200
Message-ID: <CAKMK7uFe-70DE5qOBJ6FwD8d_A0yZt+h5bCqA=e9QtYE1qwASQ@mail.gmail.com>
Subject: Re: [PATCH] dma-resv: lockdep-prime address_space->i_mmap_rwsem for
 dma-resv
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
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
Cc: linux-xfs@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Dave Chinner <david@fromorbit.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Qian Cai <cai@lca.pw>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMjoxNyBQTSBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
Cjx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPgo+Cj4gT24gNy8yOC8yMCAzOjU4IFBN
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gR1BVIGRyaXZlcnMgbmVlZCB0aGlzIGluIHRoZWly
IHNocmlua2VycywgdG8gYmUgYWJsZSB0byB0aHJvdyBvdXQKPiA+IG1tYXAnZWQgYnVmZmVycy4g
Tm90ZSB0aGF0IHdlIGFsc28gbmVlZCBkbWFfcmVzdl9sb2NrIGluIHNocmlua2VycywKPiA+IGJ1
dCB0aGF0IGxvb3AgaXMgcmVzb2x2ZWQgYnkgdHJ5bG9ja2luZyBpbiBzaHJpbmtlcnMuCj4gPgo+
ID4gU28gZnVsbCBoaWVyYXJjaHkgaXMgbm93IChpZ25vcmUgc29tZSBvZiB0aGUgb3RoZXIgYnJh
bmNoZXMgd2UgYWxyZWFkeQo+ID4gaGF2ZSBwcmltZWQpOgo+ID4KPiA+IG1tYXBfcmVhZF9sb2Nr
IC0+IGRtYV9yZXN2IC0+IHNocmlua2VycyAtPiBpX21tYXBfbG9ja193cml0ZQo+ID4KPiA+IEkg
aG9wZSB0aGF0J3Mgbm90IGluY29uc2lzdGVudCB3aXRoIGFueXRoaW5nIG1tIG9yIGZzIGRvZXMs
IGFkZGluZwo+ID4gcmVsZXZhbnQgcGVvcGxlLgo+ID4KPiBMb29rcyBPSyB0byBtZS4gVGhlIG1h
cHBpbmdfZGlydHlfaGVscGVycyBydW4gdW5kZXIgdGhlIGlfbW1hcF9sb2NrLCBidXQKPiBkb24n
dCBhbGxvY2F0ZSBhbnkgbWVtb3J5IEFGQUlDVC4KPgo+IFNpbmNlIGh1Z2UgcGFnZS10YWJsZS1l
bnRyeSBzcGxpdHRpbmcgbWF5IGhhcHBlbiB1bmRlciB0aGUgaV9tbWFwX2xvY2sKPiBmcm9tIHVu
bWFwX21hcHBpbmdfcmFuZ2UoKSBpdCBtaWdodCBiZSB3b3J0aCBmaWd1cmluZyBvdXQgaG93IG5l
dyBwYWdlCj4gZGlyZWN0b3J5IHBhZ2VzIGFyZSBhbGxvY2F0ZWQsIHRob3VnaC4KCm9mYyBJJ20g
bm90IGFuIG1tIGV4cGVydCBhdCBhbGwsIGJ1dCBJIGRpZCB0cnkgdG8gc2Nyb2xsIHRocm91Z2gg
YWxsCmlfbW1hcF9sb2NrX3dyaXRlL3JlYWQgY2FsbGVycy4gRm91bmQgdGhlIGZvbGxvd2luZzoK
Ci0ga2VybmVsL2V2ZW50cy91cHJvYmVzLmMgaW4gYnVpbGRfbWFwX2luZm86CgogICAgICAgICAg
ICAvKgogICAgICAgICAgICAgKiBOZWVkcyBHRlBfTk9XQUlUIHRvIGF2b2lkIGlfbW1hcF9yd3Nl
bSByZWN1cnNpb24gdGhyb3VnaAogICAgICAgICAgICAgKiByZWNsYWltLiBUaGlzIGlzIG9wdGlt
aXN0aWMsIG5vIGhhcm0gZG9uZSBpZiBpdCBmYWlscy4KICAgICAgICAgICAgICovCgotIEkgZ290
IGxvc3QgaW4gdGhlIGh1Z2V0bGIuYyBjb2RlIGFuZCBjb3VsZG4ndCBjb252aW5jZSBteXNlbGYg
aXQncwpub3QgYWxsb2NhdGluZyBwYWdlIGRpcmVjdG9yaWVzIGF0IHZhcmlvdXMgbGV2ZWxzIHdp
dGggc29tZXRoaW5nIGVsc2UKdGhhbiBHRlBfS0VSTkVMLgoKU28gbG9va3MgbGlrZSB0aGUgcmVj
dXJzaW9uIGlzIGNsZWFybHkgdGhlcmUgYW5kIGtub3duLCBidXQgdGhlCmh1Z2VwYWdlIGNvZGUg
aXMgdG9vIGNvbXBsZXggYW5kIGZseWluZyBvdmVyIG15IGhlYWQuCi1EYW5pZWwKCj4KPiAvVGhv
bWFzCj4KPgo+CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
