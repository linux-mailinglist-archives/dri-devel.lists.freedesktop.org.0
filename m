Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E070A9C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C999C89E39;
	Mon, 22 Jul 2019 20:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68C589C53
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:24:27 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id q5so3261316ybp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IbSm7aUPCPODZOR8QIAKq+60N3QfY43kv2h3mhmy9JI=;
 b=HDBIrQgcdwrX3EKn0vvR6RDo/FAvOntXq/yvB3EcU7EbgmrkpvePzykmgRFQpwNf4K
 75YHZLxjdbdm6WyuXQmL1vAnCZVnpCd7rxnKe1n0vDUs440q97iXH37h8RKEcr5MerxB
 AbKacMt3q3rCxnPR19Ddp8Aw4k8PTjE7ZpFYEFUi7pSUCENLlMjjIV6/nRyXgpQDmIaF
 FrDlliqDGwVnt7Mzobu4W5G8P/ocanLUbJvmChOvXuBO5dsEhmxaM10fU53CTz3LQx7G
 VkSIHqZKcCI8UjQpfXPuIPhLxC3iyHPuxmdtD0W0xJr+hSt5izsiDQGTgm2sKvmKLnMx
 N1Dw==
X-Gm-Message-State: APjAAAWYjm/Sd25ezWQFOPOCLt8SUycP4r8O9vhzjhc6jrHGuewuTCwx
 /bH76f+VZkJwVWPbKfgI1ZZlpg==
X-Google-Smtp-Source: APXvYqyiLrWQvLw3OHqzVi7sTTnhZapQbW476w12mH0kcbo7VOE8BPKT9pASdcod3zGG35cHMYtwVA==
X-Received: by 2002:a05:6902:508:: with SMTP id
 x8mr47454720ybs.406.1563827066965; 
 Mon, 22 Jul 2019 13:24:26 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k126sm9433394ywf.36.2019.07.22.13.24.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 13:24:26 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:24:26 -0400
From: Sean Paul <sean@poorly.run>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Message-ID: <20190722202426.GL104440@art_vandelay>
References: <20190722181945.244395-1-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722181945.244395-1-mka@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IbSm7aUPCPODZOR8QIAKq+60N3QfY43kv2h3mhmy9JI=;
 b=QldmT9XYK72SQ7U5ZxUvFimH+3fpq2KpaUvK4DEG6/EWgWERMqrrT4+MiCC0IWH3od
 j4KowEjinazaD1qQm76hTIXKFED8g/eZLUSCIYV1i1IfC6lJ/Vb3HHnebc25GjVEpTC9
 9FfCuNm1aCAuWjvqSIk63VhYZVBtTf6Yq0ybK9NiF5EdpahXmdtOqj2lAiFTOr2KEmj+
 pcXQdynuGP63E8J3loL6eM3KW7YYvjQ6/tpG2QY4uobV8JM9JYIDTs9NwAPtKUj7Ag+C
 XPKiv/+QqcmXBDFTXdetWaxlTb3p1uW5kGS7ilfnH94zyq3uWUB4eObAFfqOgQra6SVG
 aHcg==
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6MTk6NDVBTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gVGhlIEREQy9DSSBwcm90b2NvbCBpbnZvbHZlcyBzZW5kaW5nIGEgbXVsdGkt
Ynl0ZSByZXF1ZXN0IHRvIHRoZQo+IGRpc3BsYXkgdmlhIEkyQywgd2hpY2ggaXMgdHlwaWNhbGx5
IGZvbGxvd2VkIGJ5IGEgbXVsdGktYnl0ZQo+IHJlc3BvbnNlLiBUaGUgaW50ZXJuYWwgSTJDIGNv
bnRyb2xsZXIgb25seSBhbGxvd3Mgc2luZ2xlIGJ5dGUKPiByZWFkcy93cml0ZXMgb3IgcmVhZHMg
b2YgOCBzZXF1ZW50aWFsIGJ5dGVzLCBoZW5jZSBEREMvQ0kgaXMgbm90Cj4gc3VwcG9ydGVkIHdo
ZW4gdGhlIGludGVybmFsIEkyQyBjb250cm9sbGVyIGlzIHVzZWQuIFRoZSBJMkMKClRoaXMgaXMg
dmVyeSBsaWtlbHkgYSBzdHVwaWQgcXVlc3Rpb24sIGJ1dCBJIGRpZG4ndCBzZWUgYW4gYW5zd2Vy
IGZvciBpdCwgc28KSSdsbCBqdXN0IGFzayA6KQoKSWYgdGhlIGNvbnRyb2xsZXIgc3VwcG9ydHMg
eGZlcnMgb2YgOCBieXRlcyBhbmQgMSBieXRlcywgY291bGQgeW91IGp1c3Qgc3BsaXQKdXAgYW55
IG9mIHRoZXNlIHRyYW5zYWN0aW9ucyBpbnRvIGxlbi84K2xlbiU4IHRyYW5zYWN0aW9ucz8KClNl
YW4KCj4gdHJhbnNmZXJzIGNvbXBsZXRlIHdpdGhvdXQgZXJyb3JzLCBob3dldmVyIHRoZSBkYXRh
IGluIHRoZSByZXNwb25zZQo+IGlzIGdhcmJhZ2UuIEFib3J0IHRyYW5zZmVycyB0by9mcm9tIHNs
YXZlIGFkZHJlc3MgMHgzNyAoRERDKSB3aXRoCj4gLUVPUE5PVFNVUFAsIHRvIG1ha2UgaXQgZXZp
ZGVudCB0aGF0IHRoZSBjb21tdW5pY2F0aW9uIGlzIGZhaWxpbmcuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBp
biB2MjoKPiAtIGNoYW5nZWQgRERDX0kyQ19BRERSIHRvIEREQ19DSV9BRERSCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgOCArKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCAwNDViMWIxM2ZkMGUuLjI4OTMzNjI5ZjNjNyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gQEAgLTM1
LDYgKzM1LDcgQEAKPiAgCj4gICNpbmNsdWRlIDxtZWRpYS9jZWMtbm90aWZpZXIuaD4KPiAgCj4g
KyNkZWZpbmUgRERDX0NJX0FERFIJCTB4MzcKPiAgI2RlZmluZSBERENfU0VHTUVOVF9BRERSCTB4
MzAKPiAgCj4gICNkZWZpbmUgSERNSV9FRElEX0xFTgkJNTEyCj4gQEAgLTMyMiw2ICszMjMsMTMg
QEAgc3RhdGljIGludCBkd19oZG1pX2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwK
PiAgCXU4IGFkZHIgPSBtc2dzWzBdLmFkZHI7Cj4gIAlpbnQgaSwgcmV0ID0gMDsKPiAgCj4gKwlp
ZiAoYWRkciA9PSBERENfQ0lfQUREUikKPiArCQkvKgo+ICsJCSAqIFRoZSBpbnRlcm5hbCBJMkMg
Y29udHJvbGxlciBkb2VzIG5vdCBzdXBwb3J0IHRoZSBtdWx0aS1ieXRlCj4gKwkJICogcmVhZCBh
bmQgd3JpdGUgb3BlcmF0aW9ucyBuZWVkZWQgZm9yIEREQy9DSS4KPiArCQkgKi8KPiArCQlyZXR1
cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICAJZGV2X2RiZyhoZG1pLT5kZXYsICJ4ZmVyOiBudW06ICVk
LCBhZGRyOiAlI3hcbiIsIG51bSwgYWRkcik7Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IG51bTsg
aSsrKSB7Cj4gLS0gCj4gMi4yMi4wLjY1Ny5nOTYwZTkyZDI0Zi1nb29nCj4gCgotLSAKU2VhbiBQ
YXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
