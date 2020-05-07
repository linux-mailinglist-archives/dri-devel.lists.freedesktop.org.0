Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE01C964C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 18:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3BC6E149;
	Thu,  7 May 2020 16:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964536E149
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 16:20:40 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id 1so3726238vsl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GccsOCDhb70WOL5uU78rTy2SGu1UZ4hTBYFq6qRLeQo=;
 b=ncFOIhneC4wuGcgi6c2BUTBg9RftvPUFAbbqUFYeEcpwZbmNkQRp9+xJ/rGnrN3rH3
 vPFnLLaOpp5fAaQsOd7fUGEQD1MD7q/LhKhG/+2TS1cls3i+cgjRu5t4YV+MLzeyZoLZ
 qnxFBsS+qQ+W4hGfFFhpRFMYC3ydkhdQ7inEXP3A0TIPX7GrgGGxWTPAN3kr0W4IKLX8
 DfgeoCAybsSnOxL+cpWPrzB/7SnLEskBjcesAOt9QhLfygA5YnrLGvsqzyAg0bgZaoLy
 9hXHMgKnFi6wTVzFZXlYUv5Y62FIKAgdtlRaNZlqz5r+LmbA47RewLzCX6EHbpKnx8x7
 2GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GccsOCDhb70WOL5uU78rTy2SGu1UZ4hTBYFq6qRLeQo=;
 b=oeaN6ctL5+jyfbA2WiXRonigHJiyHtroEXplCBUyEziIg47tcXL6pPEPqKErpd/PvH
 4vEy2Ctk+jjcSWgoBaWWiZHAqZK1cDSqSjMKrugoPkt2l/xuPoR1U1vrWFikktz9hPFY
 s/qJ6kBjxIJSOX79yTbAUwm0o1FJgbe98S86ULxLxNThwxW5nCw+oNN346aJ9+olzki6
 udkpuP/fUr7CNJeh9cWA1YSbaKetfJ7Zi03KCdqH4bNXnfy8d0zxWfDzKEgQqicp3bfW
 PUgTMj1+rnqXeUB9lYM68nuyyWXuS6vw5wom5NXdLBIL7Hl1qTcwJhAFIxfDvgdAWa42
 AuoA==
X-Gm-Message-State: AGi0Puac04+SlenBaLsgWhQNCvsQqBjUe6+QB8voAYfz4z4B9pES1YsW
 LcAE3QE1vZjpUEmTMar5xbVkX9fIqyRJAKviE0o=
X-Google-Smtp-Source: APiQypJydkN9Kury3yi6PnjiGnMysS5M1yLaIibTRKNMe3RsqAxeHB8rhDHzq3eqEJ2USUv5q711Grc6szgpDwM0UmE=
X-Received: by 2002:a67:c482:: with SMTP id d2mr14110577vsk.37.1588868439761; 
 Thu, 07 May 2020 09:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-3-emil.l.velikov@gmail.com>
 <CAGWqDJ4rAmwMzb6Q61Ou9ZLNA2M-i-JhOSokVUkHYHa_-ZxCTw@mail.gmail.com>
In-Reply-To: <CAGWqDJ4rAmwMzb6Q61Ou9ZLNA2M-i-JhOSokVUkHYHa_-ZxCTw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 7 May 2020 17:18:09 +0100
Message-ID: <CACvgo50=scDC32UrWQQ0QLXFTh1e8w8GcPFs52f6+jNMwesGOQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mipi: use dcs write for
 mipi_dsi_dcs_set_tear_scanline
To: Vinay Simha B N <simhavcs@gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <treding@nvidia.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA3IE1heSAyMDIwIGF0IDEzOjI5LCBWaW5heSBTaW1oYSBCIE4gPHNpbWhhdmNzQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBFbWlsLAo+Cj4gUmVwbHkgaW5saW5lCj4KPiBPbiBUdWUsIDUg
TWF5IDIwMjAgYXQgOTozNSBQTSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+PiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgo+Pgo+PiBUaGUgaGVscGVyIHVzZXMgdGhlIE1JUElfRENTX1NFVF9URUFSX1NDQU5M
SU5FLCBhbHRob3VnaCBpdCdzIGN1cnJlbnRseQo+PiB1c2luZyB0aGUgZ2VuZXJpYyB3cml0ZS4g
VGhpcyBkb2VzIG5vdCBsb29rIHJpZ2h0Lgo+Pgo+PiBQZXJoYXBzIHNvbWUgcGxhdGZvcm1zIGRv
bid0IGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlIHR3byB3cml0ZXJzPwo+Pgo+PiBDYzogUm9iZXJ0
IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+PiBDYzogVmluYXkgU2ltaGEgQk4gPHNp
bWhhdmNzQGdtYWlsLmNvbT4KPj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+Cj4+IENjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+PiBGaXhlczog
ZTgzOTUwODE2MzY3ICgiZHJtL2RzaTogSW1wbGVtZW50IHNldCB0ZWFyIHNjYW5saW5lIikKPj4g
U2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4K
Pj4gLS0tCj4+IFJvYmVydCwgY2FuIHlvdSBwbGVhc2UgdGVzdCB0aGlzIGFnYWluc3QgdGhlIG9u
bHkgdXNlciAtIHRoZSBSYXlkaXVtCj4+IFJNNjcxOTEgcGFuZWwgZHJpdmVyIHRoYXQgeW91IGlu
dHJvZHVjZWQuCj4+Cj4+IFRoYW5rcwo+Pgo+PiBWaW5heSwgY2FuIHlvdSBjb25maXJtIGlmIHRo
aXMgaXMgYSBnZW51aW5lIHR5cG8gb3IgdGhlcmUncyBzb21ldGhpbmcKPj4gcmVhbGx5IHN1YnRs
ZSBoYXBwZW5pbmcuCj4KPiB0aGlzIGhhcyBiZWVuIHRlc3RlZCBvbiBuZXh1cyA3IHdpdGggamRp
IHBhbmVsLgpUaGUgamRpIHBhbmVsIChKREkgTFQwNzBNRTA1MDAwIEkgYmVsaWV2ZSkgZG9lcyBu
b3QgdXNlIHRoZSBmdW5jdGlvbiwgaG1tLgoKTG9va2luZyB0aHJvdWdoIHRoZSBNTCBhcmNoaXZl
IC0gdGhlIGNhbGwgaW4gdGhlIGZpcnN0IDQgcmV2aXNpb25zIG9mIHRoZSBwYXRjaC4KVGhlbiB3
aXRoIHY1IGl0IGhhcyBtYWdpY2FsbHkgZGlzYXBwZWFyZWQgYWxvbmdzaWRlIG1pcGlfZHNpX2Rj
c19zZXRfdGVhcl9vbigpLgoKTm8gY29tbWVudCBleHBsYWluaW5nIHdoeSB0aG91Z2ggLSBkb2Vz
IHRoZSBkcml2ZXIgd29yayB3L28gYm90aCBvZiB0aG9zZT8KCj4gSSBkaWQgbm90IHVuZGVyc3Rh
bmQgd2hhdCBpcyB0aGUgdHlwbyBoZXJlPwo+IFdlIG5lZWQgdG8gdXNlIERD4oCZcyB3cml0ZSBp
bnN0ZWFkIG9mIGdlbmVyaWMgd3JpdGU/CgpJIGJlbGlldmUgdGhlIGNsdWUgaXMgaW4gdGhlIGNv
bW1hbmQgbmFtZSAtIE1JUElfRFNJX0RDUy4gSSB3YXMgZ29pbmcKdG8gZG91YmxlLWNoZWNrIHdp
dGggdGhlIHNwZWMgYWx0aG91Z2ggaXQncyBtZW1iZXJzIG9ubHkgOi1cCkJhc2VkIG9uIHRoZSB1
c2FnZSBpbiBEUk0sIGFsbCBEQ1MgY29tbWFuZHMgYXJlIGlzc3VlZCB2aWEKbWlwaV9kc2lfZGNz
X3tyZWFkLHdyaXRlfQoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
