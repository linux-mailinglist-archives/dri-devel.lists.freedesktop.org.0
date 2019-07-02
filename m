Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A765D7B1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 23:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991D989A60;
	Tue,  2 Jul 2019 21:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C5989A4F;
 Tue,  2 Jul 2019 21:02:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so28619922edv.6;
 Tue, 02 Jul 2019 14:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HvMK1U3mSSIhGP7RCajA7JG3xXgs2w4egMaNm/sjjUA=;
 b=BDKi9EGNiBJFVOlegdxlmqK8xh8wU+OalBaYHyNJQZFSkK42kNAPfU8hkw1NKfMuUF
 DklVzhIGcw5jn6AlqnpgO0OcldSm415tQ2/MuiwxMhoKFSzZMqUyJeQVtz3HC0aAa2M/
 sxBYYqHxdQeh/SoMPOQCjK26pqLKlZ4nBil6BYBTY78sbLI5WACaknt1EYC+LSnZTU6h
 7HvNn/NW5gdEf2aD4PL6XEyAjHl5Pqy6ctwSZDRoKcpcJObw+eXcoifJCR8Rxl1ejlec
 QeFde4oc02e6CIbwGQriqOPw5RzpI4C20xY4F4tgXXh9Ty+mnR/UXrsu2XcvD5Mk5JvI
 PcGQ==
X-Gm-Message-State: APjAAAWHn4PCeJK6dHsCp0W8sarPOiRm6QdQroz8C0I53WylLBLXGEFY
 g8yIirJTm7uqf6brNGM2JW+dOhX17kDxPE48XlmphtGSoFkKTA==
X-Google-Smtp-Source: APXvYqwEwOLS0R67S4CWtviQf6gj1WsabSLC1YiBzuE0hxTXO8rI+xmH/s+9mAXwppDwa/sfJAdp+Bb1LMYRy544aRI=
X-Received: by 2002:a50:9203:: with SMTP id i3mr38838506eda.302.1562101325167; 
 Tue, 02 Jul 2019 14:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
 <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
In-Reply-To: <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2019 14:01:49 -0700
Message-ID: <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
Subject: Re: [PATCH 2/4] efi/libstub: detect panel-id
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HvMK1U3mSSIhGP7RCajA7JG3xXgs2w4egMaNm/sjjUA=;
 b=MW9ZpERJUQAII+y5hHpAXfKIB35FrQAFXdgIxpVSE/K3dtOZ8jbYpV1hW8xe8FJz+K
 0ClnaWJEzQWyez0nkZgKubQEdncxmmkvd1669rbTlj4+KDro37xffkFpMQXDtHEIP+24
 r1uc0v219ClLkICFhc894IOs6ubynozVJb6CSJ4oDFDRC9UpNgxOK+XECgubHiq0YIhB
 mqqT0cpFlxHgIwN48d/VhgHnBZ3n5bc0Wrw5Dv8PDmdGmtIyfB26KN/RYZqONoFXgl1q
 BSnW6MiWfFcbGg+YtjIVlwwFaW1zO5MIjD0vaXqVIdv1aIED6+KqqZhe5S/cGilU/WLV
 z8Eg==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-efi <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Julien Thierry <julien.thierry@arm.com>, Alexander Graf <agraf@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxOjM1IFBNIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hl
dXZlbEBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgMiBKdWwgMjAxOSBhdCAyMjoyNiwg
QXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIFN1biwgMzAgSnVuIDIwMTkgYXQgMjI6MzYsIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9t
aXVtLm9yZz4KPiA+ID4KPiA+ID4gT24gc25hcGRyYWdvbiBhYXJjaDY0IGxhcHRvcHMsIGEgJ1VF
RklEaXNwbGF5SW5mbycgdmFyaWFibGUgaXMgcHJvdmlkZWQKPiA+ID4gdG8gY29tbXVuaWNhdGUg
c29tZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZGlzcGxheS4gIENydXRpYWxseSBpdCBoYXMgdGhl
Cj4gPiA+IHBhbmVsLWlkLCBzbyB0aGUgYXBwcm9wcmlhdGUgcGFuZWwgZHJpdmVyIGNhbiBiZSBz
ZWxlY3RlZC4gIFJlYWQgdGhpcwo+ID4gPiBvdXQgYW5kIHN0YXNoIGluIC9jaG9zZW4vcGFuZWwt
aWQgc28gdGhhdCBkaXNwbGF5IGRyaXZlciBjYW4gdXNlIGl0IHRvCj4gPiA+IHBpY2sgdGhlIGFw
cHJvcHJpYXRlIHBhbmVsLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gSGkgUm9iLAo+ID4KPiA+IEkgdW5kZXJzdGFu
ZCB3aHkgeW91IGFyZSBkb2luZyB0aGlzLCBidXQgdGhpcyAqcmVhbGx5KiBiZWxvbmdzIGVsc2V3
aGVyZS4KPiA+Cj4gPiBTbyB3ZSBhcmUgZGVhbGluZyB3aXRoIGEgcGxhdGZvcm0gdGhhdCB2aW9s
YXRlcyB0aGUgVUVGSSBzcGVjLCBzaW5jZQo+ID4gaXQgZG9lcyBub3QgYm90aGVyIHRvIGltcGxl
bWVudCB2YXJpYWJsZSBzZXJ2aWNlcyBhdCBydW50aW1lIChiZWNhdXNlCj4gPiBNUyBsZXQgdGhl
IHZlbmRvciBnZXQgYXdheSB3aXRoIHRoaXMpLgo+ID4KPgo+IFRvIGNsYXJpZnksIHRoZSBhYm92
ZSByZW1hcmsgYXBwbGllcyB0byBwb3B1bGF0aW5nIHRoZSBEVCBmcm9tIHRoZSBPUwo+IHJhdGhl
ciB0aGFuIGZyb20gdGhlIGZpcm13YXJlLgoKeWVhaCwgaXQgaXNuJ3QgcHJldHR5LCBidXQgdGhl
cmUgKmFyZSogc29tZSBvdGhlciBzaW1pbGFyIGNhc2VzIHdoZXJlCmVmaS1zdHViIGlzIHBvcHVs
YXRpbmcgRFQuLiAobGlrZSB1cGRhdGVfZmR0X21lbW1hcCgpIGFuZAprYXNsci1zZWVkKS4uCgpp
dCB3b3VsZCBiZSBraW5kYSBuaWNlIHRvIGhhdmUgYW4gZWFybHktcXVpcmtzIG1lY2hhbmlzbSB3
aGVyZSB0aGlzCmNvdWxkIGZpdCwgYnV0IEkgdGhvdWdodCB0aGF0IG1pZ2h0IGJlIGVxdWFsbHkg
dW5wb3B1bGFyIDstKQoKPgo+ID4gRmlyc3Qgb2YgYWxsLCB0byBwYXNzIGRhdGEgYmV0d2VlbiB0
aGUgRUZJIHN0dWIgYW5kIHRoZSBPUyBwcm9wZXIsIHdlCj4gPiBzaG91bGQgdXNlIGEgY29uZmln
dXJhdGlvbiB0YWJsZSByYXRoZXIgdGhhbiBhIERUIHByb3BlcnR5LCBzaW5jZSB0aGUKPiA+IGZv
cm1lciBpcyBBQ1BJL0RUIGFnbm9zdGljLiBBbHNvLCBJJ2QgbGlrZSB0aGUgY29uc3VtZXIgb2Yg
dGhlIGRhdGEgdG8KPiA+IGFjdHVhbGx5IGludGVycHJldCBpdCwgaS5lLiwganVzdCBkdW1wIHRo
ZSB3aG9sZSBvcGFxdWUgdGhpbmcgaW50byBhCj4gPiBjb25maWcgdGFibGUgaW4gdGhlIHN0dWIs
IGFuZCBkbyB0aGUgcGFyc2luZyBpbiB0aGUgT1MgcHJvcGVyLgo+ID4KPiA+IEhvd2V2ZXIsIEkg
YW0gbm90IHRocmlsbGVkIGF0IGFkZGluZyBjb2RlIHRvIHRoZSBzdHViIHRoYXQKPiA+IHVuY29u
ZGl0aW9uYWxseSBsb29rcyBmb3Igc29tZSB2YXJpYWJsZSB3aXRoIHNvbWUgbWFnaWMgbmFtZSBv
biBhbGwKPiA+IEFSTS9hcm02NCBFRkkgc3lzdGVtcywgc28gdGhpcyB3aWxsIG5lZWQgdG8gbGl2
ZSB1bmRlciBhIEtjb25maWcKPiA+IG9wdGlvbiB0aGF0IGRlcGVuZHMgb24gQVJNNjQgKGFuZCBk
b2VzIG5vdCBkZWZhdWx0IHRvIHkpCgpJIGRlZm4gY2FuIGFkZCB0aGlzIHVuZGVyIGtjb25maWcu
LiBpcyBpdCBvayBpZiB0aGF0IG9wdGlvbiBpcwpzZWxlY3QnZCBieSBBUkNIX1FDT00/CgooSnVz
dCB0cnlpbmcgdG8gbWluaW1pemUgdGhlIHRoaW5ncyB0aGF0IGNhbiBnbyB3cm9uZyBhbmQgdGhl
ICJJIGdldCBhCmJsYW5rIHNjcmVlbiBhdCBib290IiBidWcgcmVwb3J0cyBJIGdldCA7LSkpCgo+
IC4uLiBidXQgc2F2aW5nIHZhcmlhYmxlcyBhdCBib290IHRpbWUgZm9yIGNvbnN1bXB0aW9uIGF0
IHJ1bnRpbWUgaXMKPiBzb21ldGhpbmcgdGhhdCB3ZSB3aWxsIGxpa2VseSBzZWUgbW9yZSBvZiBp
biB0aGUgZnV0dXJlLgoKSSB0aGluayB0aGlzIHdpbGwgYmUgbmljZSwgYnV0IGl0IGFsc28gZG9l
c24ndCBhZGRyZXNzIHRoZSBuZWVkIGZvciBhCnF1aXJrIHRvIGdldCB0aGlzIGludG8gL2Nob3Nl
bi4uICBJIGd1ZXNzIHdlICpjb3VsZCogdXNlIGEgc2hpbSBvcgpzb21ldGhpbmcgdGhhdCBydW5z
IGJlZm9yZSB0aGUga2VybmVsIHRvIGRvIHRoaXMuICBCdXQgdGhhdCBqdXN0IHNlZW1zCmxpa2Ug
YSBsb2dpc3RpY2FsL3N1cHBvcnQgbmlnaHRtYXJlLiAgVGhlcmUgaXMgb25lIGtlcm5lbCwgYW5k
IHRoZXJlCmFyZSBOIGRpc3RybydzLCBzbyBkZWJ1Z2dpbmcgYSB1c2VycyAiSSBkb24ndCBnZXQg
YSBzY3JlZW4gYXQgYm9vdCIKcHJvYmxlbSBiZWNhdXNlIHRoZWlyIGRpc3RybyBtaXNzZWQgc29t
ZSBzaGltIHBhdGNoIHJlYWxseSBqdXN0CmRvZXNuJ3Qgc2VlbSBsaWtlIGEgaGVhZGFjaGUgSSB3
YW50IHRvIGhhdmUuCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
