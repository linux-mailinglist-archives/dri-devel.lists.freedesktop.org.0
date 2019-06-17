Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA6494BD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 00:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A93789F2D;
	Mon, 17 Jun 2019 22:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6038B89F2D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 22:06:45 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE5BB2089E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 22:06:44 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id p15so12828795qtl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 15:06:44 -0700 (PDT)
X-Gm-Message-State: APjAAAV7Ik3R2JDU+yKEW21SPvdhMTDFcyX+F/Az9G9Bvxvo6U9pZvNf
 r011cJUawirvHf7f5u1J0vhCLMfiQbCvk4G8fw==
X-Google-Smtp-Source: APXvYqxlH9tPhbZNNJkrT85aR9svIHlNTL+sG99zdJoKOt8Ty1YrE3qm/ShFbczH/rR++XU8qWfC4jV3flp5vTydqXs=
X-Received: by 2002:a05:6214:248:: with SMTP id
 k8mr23820532qvt.200.1560809204093; 
 Mon, 17 Jun 2019 15:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
 <20190616081557.GA3826@kozik-lap>
In-Reply-To: <20190616081557.GA3826@kozik-lap>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 Jun 2019 16:06:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
Message-ID: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560809205;
 bh=1JsNZwhNkO0kTZcSPtRFxPGFWoSJ54GPBuKfdAJwxrc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FjF5FoB/JFxH3Vhztsb5WG5Vu6aseXi7fL2veRWd+mwQqvLdR0/TY1WpdTCkpmo9m
 fShDvxz4FPFJb7wRjNhSzq14v/3oet4IDfjLM9dBw1OkBhxoZwrkbtM53OoHV4eu1s
 cE+PVxXPNcKAjkzngjxA1zXPEbGLq/d7fgGGtw4Q=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMjoxNiBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDE6MzE6NDNQ
TSAtMDcwMCwgSm9zZXBoIEtvZ3V0IHdyb3RlOgo+ID4gRG9jdW1lbnQgdmVuZG9yIHNwZWNpZmlj
IGNvbXBhdGlibGUgc3RyaW5nIGZvciBNYWxpIGdwdXMgb24gRXh5bm9zIFNvQ3MuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1t
aWRnYXJkLnR4dCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS1taWRnYXJkLnR4dAo+ID4gaW5kZXggMWIxYTc0MTI5MTQxLi5hOTcwNGM3MzZk
MDcgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1
L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gPiBAQCAtMTgsNiArMTgsNyBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gICAgICArICJhbWxvZ2ljLG1lc29uLWd4bS1tYWxpIgo+
ID4gICAgICArICJyb2NrY2hpcCxyazMyODgtbWFsaSIKPiA+ICAgICAgKyAicm9ja2NoaXAscmsz
Mzk5LW1hbGkiCj4gPiArICAgICsgInNhbXN1bmcsZXh5bm9zLW1hbGkiCj4KPiBBcmUgdGhlcmUg
YW55IGRyaXZlciBkaWZmZXJlbmNlcyBmb3IgRXh5bm9zPyBJZiBub3QgdGhlbiB3aHkgYWRkaW5n
Cj4gYW5vdGhlciBjb21wYXRpYmxlPwoKV3JvbmcgcXVlc3Rpb24uIEFyZSB0aGVyZSBhbnkgaGFy
ZHdhcmUgZGlmZmVyZW5jZXM/IChUcmljayBxdWVzdGlvbgpiZWNhdXNlIGRpZmZlcmVuY2UgY29t
cGFyZWQgdG8gd2hhdD8pCgpSZWFsbHksIHRoaXMgc2hvdWxkbid0IGJlICdleHlub3MnLCBidXQg
cGVyIFNvQy4gQnV0IEknbGwgbGVhdmUgaXQgdG8KdGhlIFNhbXN1bmcgZm9sa3MgdG8gZGVjaWRl
IGhvdyBzcGVjaWZpYyBpdCBzaG91bGQgYmUuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
