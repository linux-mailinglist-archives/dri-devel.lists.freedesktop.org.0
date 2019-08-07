Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69F855DC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 00:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD6F6E773;
	Wed,  7 Aug 2019 22:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF0C6E773
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 22:33:23 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B57BF217D9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 22:33:22 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id r6so67233541qkc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 15:33:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUfzZBHdwaT39WCjDIXQxuEvt0VQLzu1Qcy47Ckd0mfFe0WJnN/
 NvbFKkav3Gx+LeNxe8N2NTUF82ldMlYht11oGA==
X-Google-Smtp-Source: APXvYqy7NJAR8YcIBRcv+4E+QWSMgMOBeZsAlb96cnT+PHplZa8qVQxPK4//IR288ljLcWwURkNhMpxKBUStzmpGHs0=
X-Received: by 2002:a37:a010:: with SMTP id j16mr10774647qke.152.1565217201895; 
 Wed, 07 Aug 2019 15:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190807145253.2037-1-sean@poorly.run>
 <20190807145253.2037-2-sean@poorly.run>
 <20190807210119.GF7444@phenom.ffwll.local>
In-Reply-To: <20190807210119.GF7444@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 Aug 2019 16:33:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKCdML_xLmWQBYWtgfofz8SAvS+2kOc7g+UkCQKji3dxg@mail.gmail.com>
Message-ID: <CAL_JsqKCdML_xLmWQBYWtgfofz8SAvS+2kOc7g+UkCQKji3dxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "drm/gem: Rename drm_gem_dumb_map_offset() to
 drm_gem_map_offset()"
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565217202;
 bh=CMOZ3PGCd9801AknKuGjjvaMse5+U/3CUvklfaeLWNs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zjCYYR6GYzESaltNsauwbIvmfT7J1G+t9p1VgvXGyI+k0DA2syF1xDzGpzwWU8v0l
 Ml68Q7sORTEqldNKx2EljVKlDxaBm4F58g78MBblfuR3jJLlQ3IdcN1KZhJscJ+FP/
 zqydd3i9eYto4A+Uk96yZlwjx0TsTcstl0xEt5QY=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAzOjAxIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMDo1Mjo0N0FNIC0wNDAw
LCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pgo+ID4KPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjIwZGY4M2E1Mzk0ZmJmN2MxNDg2YmE3ODQ4
Nzk0YjdiMzUxZDU5OC4KPiA+Cj4gPiBUdXJucyBvdXQgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQg
cmVhbGx5IG9ubHkgd29ya2VkIGZvciB0aGUgZHVtYiBidWZmZXIKPiA+IGNhc2UsIHNvIHJldmVy
dCB0aGUgbmFtZSBjaGFuZ2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgo+Cj4gVGhpcyBwYXJ0IG9mIHRoZSBzZXJpZXMgc2VlbXMgdW5lY2Vzc2FyeSB0byByZXZl
cnQ/CgpBbHJlYWR5IGNvbW1pdHRlZCwgc28gbGV0IG1lIGdvIHJldmVydCB0aGF0IHJpZ2h0IG5v
dyBmb3IgeW91LiBJIGNhbgpvbmx5IGhvcGUgdGhhdCdzIGVub3VnaCB0byBnZXQgbXkgY29tbWl0
IHJpZ2h0cyByZXZva2VkIHRvby4gOikKCj4gaW93IEkgc3RpbGwgbGlrZSB0aGlzLCBhbmQgSW0g
dHJ5aW5nIHRvIHNlbGwgR2VyZCBIb2ZmbWFubiBvbiBpdCBmb3Igc29tZQo+IG9mIGhpcyB0dG0g
cmVmYWN0b3JpbmcgLi4uIHJldmVydCBvZiB0aGUgcmV2ZXJ0IG9mIHRoZSByZXZlcnQgb2YgdGhl
Cj4gcmV2ZXJ0PyBQcm9iYWJseSBiZXR0ZXIgaWYgR2VyZCBjaGVycnktcGlja3MgaW50byBoaXMg
c2VyaWVzIChpZiBteQo+IHN1Z2dlc3Rpb24gd29ya3Mgb3V0KSBhbmQgbWF5YmUgcmVmZXJlbmNl
cyB0aGlzIGVudGlyZSBjaGFpbiBmb3IKPiBlbnRlcnRhaW5tZW50IHB1cnBvc2VzIDotKQo+IC1E
YW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
