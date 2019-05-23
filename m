Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3628235
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 18:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8426E027;
	Thu, 23 May 2019 16:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C7589FA6;
 Thu, 23 May 2019 16:10:51 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D535217F9;
 Thu, 23 May 2019 16:10:51 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id z5so1034363qtb.0;
 Thu, 23 May 2019 09:10:51 -0700 (PDT)
X-Gm-Message-State: APjAAAXQdvkb3Qeg36wMms7nIAMaGSoLLcZtYIjQ97DY70qpIe25Wkej
 ltt73viZX6WUQhAmN+0/cGew6cUIaP1GmqKueQ==
X-Google-Smtp-Source: APXvYqz3aMyKfY9Kh2G7ct/P7xKbPM0jXnjnWBlvrMkzGlir9kfL/nY5Cx7zOLPgiQ799e5fkJxU3rR6cM+8zrt0T5o=
X-Received: by 2002:ac8:2d48:: with SMTP id o8mr81538936qta.136.1558627850320; 
 Thu, 23 May 2019 09:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190521105151.51ffa942@canb.auug.org.au>
 <20190523115355.joyeqlmbjkufueyn@flea>
In-Reply-To: <20190523115355.joyeqlmbjkufueyn@flea>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 May 2019 11:10:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKN6+f5FXUVs03VSv2AKvqaS0XemKFSYFthaxPoHJVwEg@mail.gmail.com>
Message-ID: <CAL_JsqKN6+f5FXUVs03VSv2AKvqaS0XemKFSYFthaxPoHJVwEg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558627851;
 bh=Ks4M8oPURw7oETjX9GzeqfgrTJjuIASee+rooCmyklQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=v+yufGtIIbg3T2fQeV07x1528svajwkiok0mjwSi9rnZ/j0HXNl8tqXpxW9PKKyfA
 zkNYrIzT7TY2FzPjp8oKrAqMO9bt0EiPK37CoHOaVjDvPjiIR8J8AKKPOXBqlf91sy
 IwxrykHg2xt+VxzOa03ixHol8tpqOURriI3mdVwM=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNjo1NCBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDEwOjUx
OjUxQU0gKzEwMDAsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPgo+ID4g
VG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSBkcm0tbWlzYyB0cmVlIGdvdCBhIGNvbmZs
aWN0IGluOgo+ID4KPiA+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRv
ci1wcmVmaXhlcy50eHQKPiA+Cj4gPiBiZXR3ZWVuIGNvbW1pdDoKPiA+Cj4gPiAgIDgxMjJkZTU0
NjAyZSAoImR0LWJpbmRpbmdzOiBDb252ZXJ0IHZlbmRvciBwcmVmaXhlcyB0byBqc29uLXNjaGVt
YSIpCj4gPgo+ID4gZnJvbSBMaW51cycgdHJlZSBhbmQgY29tbWl0czoKPiA+Cj4gPiAgIGI0YTJj
MDA1NWE0ZiAoImR0LWJpbmRpbmdzOiBBZGQgdmVuZG9yIHByZWZpeCBmb3IgVlhUIEx0ZCIpCj4g
PiAgIGIxYjBkMzZiZGIxNSAoImR0LWJpbmRpbmdzOiBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIGJp
bmRpbmcgZm9yIFRGQyBTOTcwMFJUV1Y0M1RSLTAxQiIpCj4gPiAgIGZiZDhiNjlhYjYxNiAoImR0
LWJpbmRpbmdzOiBBZGQgdmVuZG9yIHByZWZpeCBmb3IgRXZlcnZpc2lvbiBFbGVjdHJvbmljcyIp
Cj4gPgo+ID4gZnJvbSB0aGUgZHJtLW1pc2MgdHJlZS4KPiA+Cj4gPiBJIGZpeGVkIGl0IHVwIChJ
IGRlbGV0ZWQgdGhlIGZpbGUgYW5kIGFkZGVkIHRoZSBwYXRjaCBiZWxvdykgYW5kIGNhbgo+ID4g
Y2FycnkgdGhlIGZpeCBhcyBuZWNlc3NhcnkuIFRoaXMgaXMgbm93IGZpeGVkIGFzIGZhciBhcyBs
aW51eC1uZXh0IGlzCj4gPiBjb25jZXJuZWQsIGJ1dCBhbnkgbm9uIHRyaXZpYWwgY29uZmxpY3Rz
IHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91cgo+ID4gdXBzdHJlYW0gbWFpbnRhaW5lciB3aGVu
IHlvdXIgdHJlZSBpcyBzdWJtaXR0ZWQgZm9yIG1lcmdpbmcuICBZb3UgbWF5Cj4gPiBhbHNvIHdh
bnQgdG8gY29uc2lkZXIgY29vcGVyYXRpbmcgd2l0aCB0aGUgbWFpbnRhaW5lciBvZiB0aGUgY29u
ZmxpY3RpbmcKPiA+IHRyZWUgdG8gbWluaW1pc2UgYW55IHBhcnRpY3VsYXJseSBjb21wbGV4IGNv
bmZsaWN0cy4KPgo+IEkganVzdCB0b29rIHlvdXIgcGF0Y2ggYW5kIHB1c2hlZCBhIHRlbXAgYnJh
bmNoIHRoZXJlOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L21yaXBhcmQvbGludXguZ2l0L2NvbW1pdC8/aD1kcm0tbWlzYy1uZXh0JmlkPTM4MzJmMmNh
ZDUzMDdlYmNlZGVlYWQxM2ZiZDhkM2NmMDZiYTVlOTAKPgo+IFJvYiwgU3RlcGhlbiwgYXJlIHlv
dSBvayB3aXRoIHRoZSBjaGFuZ2U/IElmIHNvLCBJJ2xsIHB1c2ggaXQuCgpUaGUgJ3RmYycgbGlu
ZSBpcyBtaXNzaW5nIGEgJzonIG9uIHRoZSBlbmQuIERvZXMgdGhlIGZpbGUgcGFzcwpkdF9iaW5k
aW5nX2NoZWNrIGxpa2UgdGhhdD8KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
