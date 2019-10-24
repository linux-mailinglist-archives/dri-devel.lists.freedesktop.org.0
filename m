Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C272E35F7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019A6E431;
	Thu, 24 Oct 2019 14:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2736E44A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:51:17 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C42522166E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:51:16 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id o49so30414706qta.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 07:51:16 -0700 (PDT)
X-Gm-Message-State: APjAAAVvKBsRFv8B6Q+VdxUfHzEvhwBbT6Tp8y/0/av22Sh0c7DO67sb
 baOx8MMmBsVOEpc+N2TSIjvZaJdXyiz4j58PCg==
X-Google-Smtp-Source: APXvYqyXI1R6tgkLf27Se2dMkBgfCAIms6JME3RgcEqcC6jce5AGFooEv86GX0hr06greCwOgnLCH683ZJIx8hx7MRM=
X-Received: by 2002:a0c:f792:: with SMTP id s18mr14841198qvn.20.1571928675962; 
 Thu, 24 Oct 2019 07:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191024142211.GA29467@arm.com>
In-Reply-To: <20191024142211.GA29467@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Oct 2019 09:51:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJSSYdRyy=Hw4H613fWVyXM3ivFj8mgO6iwvXZQOr=9pA@mail.gmail.com>
Message-ID: <CAL_JsqJSSYdRyy=Hw4H613fWVyXM3ivFj8mgO6iwvXZQOr=9pA@mail.gmail.com>
Subject: Re: Question regarding "reserved-memory"
To: Ayan Halder <Ayan.Halder@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571928676;
 bh=MEaP5IL/IqooQRDNdNUcu8iypLi1gD3g0148DaXxsOA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AhLTlEblswmwrWUsuXYU6je5kiKbSEAz/M0zJZKKJ0DIQ60EIdRbWyrk5REfexOGm
 Oe4Ph5iPBlOcnF2uQ0YfG5vcfCeB+jCFaTgmE7IuBNtSLI7D7+S483zv39vG/VvGE/
 YHxedsM80fsfFCj4chEONOo9lXEDwHlLnhWbiK70=
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgOToyMiBBTSBBeWFuIEhhbGRlciA8QXlhbi5IYWxkZXJA
YXJtLmNvbT4gd3JvdGU6Cj4KPgo+IEhpIEZvbGtzLAo+Cj4gSSBoYXZlIGEgcXVlc3Rpb24gcmVn
YXJkaW5nICJyZXNlcnZlZC1tZW1vcnkiLiBJIGFtIHVzaW5nIGFuIEFybSBKdW5vCj4gcGxhdGZv
cm0gd2hpY2ggaGFzIGEgY2h1bmsgb2YgcmFtIGluIGl0cyBmcGdhLiBJIGludGVuZCB0byBtYWtl
IHRoaXMKPiBtZW1vcnkgYXMgcmVzZXJ2ZWQgc28gdGhhdCBpdCBjYW4gYmUgc2hhcmVkIGJldHdl
ZW4gdmFyaW91cyBkZXZpY2VzCj4gZm9yIHBhc3NpbmcgZnJhbWVidWZmZXIuCj4KPiBNeSBkdHMg
bG9va3MgbGlrZSB0aGUgZm9sbG93aW5nOi0KPgo+IC8gewo+ICAgICAgICAgLi4uLiAvLyBzb21l
IG5vZGVzCj4KPiAgICAgICAgIHRseEA2MDAwMDAwMCB7Cj4gICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4gICAgICAgICAgICAgICAgIC4uLgo+Cj4gICAgICAgICAg
ICAgICAgIGp1bm9fd3JhcHBlciB7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAuLi4gLyog
aGVyZSB3ZSBoYXZlIGFsbCB0aGUgbm9kZXMgKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogY29ycmVzcG9uZGluZyB0byB0aGUgZGV2aWNlcyBpbiB0aGUgZnBnYSAqLwo+Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgbWVtb3J5QGQwMDAwMDAgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwMCAweDYwMDAwMDAwIDB4MDAgMHg4MDAwMDAwPjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB9Owo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVz
ZXJ2ZWQtbWVtb3J5IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MHgwMT47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDB4MDE+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW5nZXM7Cj4K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJhbWVidWZmZXJAZDAwMDAwMCB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hh
cmVkLWRtYS1wb29sIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGludXgsY21hLWRlZmF1bHQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldXNhYmxlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwMCAweDYwMDAwMDAwIDB4MDAgMHg4MDAwMDAwPjsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDQ0PjsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAuLi4KPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+
IC4uLgo+IH0KPgo+IE5vdGUgdGhhdCB0aGUgZGVwdGggb2YgdGhlICJyZXNlcnZlZC1tZW1vcnki
IG5vZGUgaXMgMy4KPgo+IFJlZmVyIF9fZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkgOi0KPgo+ICAg
ICAgICAgaWYgKCFmb3VuZCAmJiBkZXB0aCA9PSAxICYmIHN0cmNtcCh1bmFtZSwgInJlc2VydmVk
LW1lbW9yeSIpID09IDApIHsKPgo+ICAgICAgICAgICAgICAgICBpZiAoX19yZXNlcnZlZF9tZW1f
Y2hlY2tfcm9vdChub2RlKSAhPSAwKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJy
KCJSZXNlcnZlZCBtZW1vcnk6IHVuc3VwcG9ydGVkIG5vZGUKPiBmb3JtYXQsIGlnbm9yaW5nXG4i
KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBicmVhayBzY2FuICovCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAg
ICAgICAgZm91bmQgPSAxOwo+Cj4gICAgICAgICAgICAgICAgIC8qIHNjYW4gbmV4dCBub2RlICov
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgfQo+Cj4gSXQgZXhwZWN0cyB0
aGUgInJlc2VydmVkLW1lbW9yeSIgbm9kZSB0byBiZSBhdCBkZXB0aCA9PSAxIGFuZCBzbyBpdAo+
IGRvZXMgbm90IHByb2JlIGl0IGluIG91ciBjYXNlLgo+Cj4gTmlldGhlciBmcm9tIHRoZQo+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvcmVzZXJ2ZWQt
bWVtb3J5LnR4dAo+ICBub3IgZnJvbSBjb21taXQgLSBlOGQ5ZDFmNTQ4NWI1MmVjM2M0ZDdhZjgz
OWU2OTE0NDM4ZjZjMjg1LAo+IEkgY291bGQgdW5kZXJzdGFuZCB0aGUgcmVhc29uIGZvciBzdWNo
IHJlc3RyaWN0aW9uLgo+Cj4gU28sIEkgc2VlayB0aGUgY29tbXVuaXR5J3MgYWR2aWNlIGFzIHRv
IHdoZXRoZXIgSSBzaG91bGQgZml4IHVwCj4gX19mZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKSBzbyBh
cyB0byBkbyBhd2F5IHdpdGggdGhlIHJlc3RyaWN0aW9uIG9yCj4gcHV0IHRoZSAicmVzZXJ2ZWQt
bWVtb3J5IiBub2RlIG91dHNpZGUgb2YgJ3RseEA2MDAwMDAwMCcgKHdoaWNoIGxvb2tzCj4gIGxv
Z2ljYWxseSBpbmNvcnJlY3QgYXMgdGhlIG1lbW9yeSBpcyBvbiB0aGUgZnBnYSBwbGF0Zm9ybSku
CgpGb3Igbm93LCBJJ20gZ29pbmcgdG8gc2F5IGl0IG11c3QgYmUgYXQgdGhlIHJvb3QgbGV2ZWwu
IEknZCBndWVzcyB0aGUKbWVtb3J5QGQwMDAwMDAgbm9kZSBpcyBhbHNvIGp1c3QgaWdub3JlZCAo
d3JvbmcgdW5pdC1hZGRyZXNzIEJUVykuCgpJIHRoaW5rIHlvdSdyZSBhbHNvIGZvcmdldHRpbmcg
dGhlIGxhdGVyIHVuZmxhdHRlbmVkIHBhcnNpbmcgb2YKL3Jlc2VydmVkLW1lbW9yeS4gVGhlIG90
aGVyIGNvbXBsaWNhdGlvbiBJSVJDIGlzIGJvb3Rpbmcgd2l0aCBVRUZJCmRvZXMgaXQncyBvd24g
cmVzZXJ2ZWQgbWVtb3J5IHRhYmxlIHdoaWNoIG9mdGVuIHVzZXMgdGhlIERUIHRhYmxlIGFzCml0
cyBzb3VyY2UuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
