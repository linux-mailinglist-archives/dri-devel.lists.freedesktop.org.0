Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB141CEB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778FB8929B;
	Wed, 12 Jun 2019 06:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72E489204;
 Tue, 11 Jun 2019 21:28:10 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id x21so2485621otq.12;
 Tue, 11 Jun 2019 14:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfYsg0/cES0OHcG6fX5W9snm90ggOgAM9kXY3QBEhu4=;
 b=dVr3UxQivP9+G/sHHivWWKE2OO3yfwwq3++88jYUUTfjw2a7ICVuz8MglPpNBnuM9J
 iE/4O/olKxO3Mfc2yca7QIn/bXjXRlT6elknNqp81lgi9Ut42sMAOb7vAhCS5HuKH1W8
 Bmv9fNkLiTiCOBCtLK2Vf2HT5JekXWmgfJ31vBrRFdeXE5ijW/qb4nsO2zxZWBKGxud9
 BNIwqob++V+8HO3exX6ZRt22LfNWVYnTj8xP1ZBxkqnUbGxwsoa6aTZCtkY+iQDFJbel
 Icvd+/JZEXEOUNnKvw8RAb2wQ2wYwIGr4raGRVRMht7WGDb3c3lQ36n8ik+eGU11YFVp
 FQaQ==
X-Gm-Message-State: APjAAAUXGzt1bAfNjcde6ejdHp6pYMrgn86VPS5TcujKFkWPB/PG34D9
 meCYYcDkQioMU+a9azencxBiJTEnF8XV6YY6UY0=
X-Google-Smtp-Source: APXvYqwZE6DuGW97Wtdkbau380s5wncliqmuWNA2I8e3nRFVHn0Gyt7oiNVh7GBK4ctz/0QIVrifVcW0qHRMDnaPYKk=
X-Received: by 2002:a9d:7b43:: with SMTP id f3mr18847440oto.337.1560288490020; 
 Tue, 11 Jun 2019 14:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
 <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
In-Reply-To: <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
From: Shyam Saini <mayhs11saini@gmail.com>
Date: Wed, 12 Jun 2019 02:57:58 +0530
Message-ID: <CAOfkYf5_HTN1HO0gQY9iGchK5Anf6oVx7knzMhL1hWpv4gV20Q@mail.gmail.com>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yfYsg0/cES0OHcG6fX5W9snm90ggOgAM9kXY3QBEhu4=;
 b=uikxw7UtyOptEVyjeY2qK4xy247KZZSlixb4FYF44cy5IOYuGfhYNz0auK7eAN3lSf
 RDykMi53c/UWnKOss3Gbf99f02SgcsLInyU9jZT7mZ9OHg9hKC6fNrTncVfEUwMvFzyT
 LcQoyh1B+GWH1wcVdCBdLQqRjW9xbNzL/XHVXJwKNd+h41OfOLBnxXrK/w2EGMY7Sdql
 Ev+iISe8afAaHYadIsKtGIEgMDX6CnpwHgbsBe+aUSzQIjTpiqosNwjLo3ub7MMP5bSh
 sv6W0b+fg0PHcDLs3IdJMwn13c7joqsHqAOaS3kYpN0/uUkfhOoBhUB3X+c5vOw3dtMp
 LbTg==
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
Cc: Andreas Dilger <adilger@dilger.ca>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Network Development <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Shyam Saini <shyam.saini@amarulasolutions.com>, linux-mips@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, linux-sctp@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, bpf <bpf@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV3LAoKPgo+IE9uIFR1ZSwgMTEgSnVuIDIwMTkgMTU6MDA6MTAgLTA2MDAgQW5kcmVh
cyBEaWxnZXIgPGFkaWxnZXJAZGlsZ2VyLmNhPiB3cm90ZToKPgo+ID4gPj4gdG8gRklFTERfU0la
RU9GCj4gPiA+Cj4gPiA+IEFzIEFsZXhleSBoYXMgcG9pbnRlZCBvdXQsIEMgc3RydWN0cyBhbmQg
dW5pb25zIGRvbid0IGhhdmUgZmllbGRzIC0KPiA+ID4gdGhleSBoYXZlIG1lbWJlcnMuICBTbyB0
aGlzIGlzIGFuIG9wcG9ydHVuaXR5IHRvIHN3aXRjaCBldmVyeXRoaW5nIHRvCj4gPiA+IGEgbmV3
IG1lbWJlcl9zaXplb2YoKS4KPiA+ID4KPiA+ID4gV2hhdCBkbyBwZW9wbGUgdGhpbmsgb2YgdGhh
dCBhbmQgaG93IGRvZXMgdGhpcyBpbXBhY3QgdGhlIHBhdGNoIGZvb3RwcmludD8KPiA+Cj4gPiBJ
IGRpZCBhIGNoZWNrLCBhbmQgRklFTERfU0laRU9GKCkgaXMgdXNlZCBhYm91dCAzNTB4LCB3aGls
ZSBzaXplb2ZfZmllbGQoKQo+ID4gaXMgYWJvdXQgMzB4LCBhbmQgU0laRU9GX0ZJRUxEKCkgaXMg
b25seSBhYm91dCA1eC4KPgo+IEVyay4gIFNvcnJ5LCBJIHNob3VsZCBoYXZlIGdyZXBwZWQuCj4K
PiA+IFRoYXQgc2FpZCwgSSdtIG11Y2ggbW9yZSBpbiBmYXZvdXIgb2YgInNpemVvZl9maWVsZCgp
IiBvciAic2l6ZW9mX21lbWJlcigpIgo+ID4gdGhhbiBGSUVMRF9TSVpFT0YoKS4gIE5vdCBvbmx5
IGRvZXMgdGhhdCBiZXR0ZXIgbWF0Y2ggIm9mZnNldG9mKCkiLCB3aXRoCj4gPiB3aGljaCBpdCBp
cyBjbG9zZWx5IHJlbGF0ZWQsIGJ1dCBpcyBhbHNvIGNsb3NlciB0byB0aGUgb3JpZ2luYWwgInNp
emVvZigpIi4KPiA+Cj4gPiBTaW5jZSB0aGlzIGlzIGEgcmF0aGVyIHRyaXZpYWwgY2hhbmdlLCBp
dCBjYW4gYmUgc3BsaXQgaW50byBhIG51bWJlciBvZgo+ID4gcGF0Y2hlcyB0byBnZXQgYXBwcm92
YWwvbGFuZGluZyB2aWEgc3Vic3lzdGVtIG1haW50YWluZXJzLCBhbmQgdGhlcmUgaXMgbm8KPiA+
IGh1Z2UgdXJnZW5jeSB0byByZW1vdmUgdGhlIG9yaWdpbmFsIG1hY3JvcyB1bnRpbCB0aGUgdXNl
cnMgYXJlIGdvbmUuICBJdAo+ID4gd291bGQgbWFrZSBzZW5zZSB0byByZW1vdmUgU0laRU9GX0ZJ
RUxEKCkgYW5kIHNpemVvZl9maWVsZCgpIHF1aWNrbHkgc28KPiA+IHRoZXkgZG9uJ3QgZ2FpbiBt
b3JlIHVzZXJzLCBhbmQgdGhlIHJlbWFpbmluZyBGSUVMRF9TSVpFT0YoKSB1c2VycyBjYW4gYmUK
PiA+IHdoaXR0bGVkIGF3YXkgYXMgdGhlIHBhdGNoZXMgY29tZSB0aHJvdWdoIHRoZSBtYWludGFp
bmVyIHRyZWVzLgo+Cj4gSW4gdGhhdCBjYXNlIEknZCBzYXkgbGV0J3MgbGl2ZSB3aXRoIEZJRUxE
X1NJWkVPRigpIGFuZCByZW1vdmUKPiBzaXplb2ZfZmllbGQoKSBhbmQgU0laRU9GX0ZJRUxEKCku
Cj4KPiBJJ20gYSBiaXQgc3VycHJpc2VkIHRoYXQgdGhlIEZJRUxEX1NJWkVPRigpIGRlZmluaXRp
b24gZW5kcyB1cCBpbgo+IHN0ZGRlZi5oIHJhdGhlciB0aGFuIGluIGtlcm5lbC5oIHdoZXJlIHN1
Y2ggdGhpbmdzIGFyZSBub3JtYWxseQo+IGRlZmluZWQuICBXaHkgaXMgdGhhdD8KClRoYW5rcyBm
b3IgcG9pbnRpbmcgb3V0IHRoaXMsIEkgd2FzIG5vdCBhd2FyZSBpZiB0aGlzIGlzIGEgY29udmVu
dGlvbi4KQW55d2F5LCBJJ2xsIGtlZXAgRklFTERfU0laRU9GIGRlZmluaXRpb24gaW4ga2VybmVs
LmggaW4gbmV4dCB2ZXJzaW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
