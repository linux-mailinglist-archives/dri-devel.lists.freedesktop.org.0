Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE3C2283
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C4A6E435;
	Mon, 30 Sep 2019 13:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E746E435
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 13:54:47 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q1so38554401ion.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 06:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/6cTPKdYhCWm4oLn5nnbSZnKAi257wb/KoyfLSpOZ8=;
 b=pwPRdnqxrrUQzVjrUVGaR8mBE2FPEANR0pQNUdoWMJmgacvFa0HCUiEvXei0Bi7+da
 IxbeoIFC7JY3UxonsScz2TpQ69B5HuMX6sqXfns9etkVw1z9HvZSbggdpzMRL7Sa2juz
 XaG0QiH3R90q2r2iZJ9ti5rW6kX6KI6AWnbCG37VDJldeicXpAFLOSPB5AWduAcFp2Mu
 37p9t/4UNZdkNJzD5ISuO86lf3Hg0rfT09qsbN4vPvCb80giNPy9lPDoeoBNx4d9+Ipj
 Uyrm8y8R7A3gc2pqcnykPADx5dyRn5AP1PF0j0C64l4xcfIM434Ucr4RTkG/bA0r5QqC
 YM+g==
X-Gm-Message-State: APjAAAU2q+bVcsV5aOvBP2D7DGUhjYShsuWznXJomg3B20ObfqUhQMpJ
 8T23ITPS6yaXkRfZXdiLfJPsPnSy/Sw41ECV6KI=
X-Google-Smtp-Source: APXvYqxbNYGoI0Ebnhewnu+oe0JbB4iIoaKSizxLuOYI/fUvQoO0IBP74yP9CUOWd1hGyNh8HR7NMPqsFmwcwEM4XV0=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr1983384iof.276.1569851686291; 
 Mon, 30 Sep 2019 06:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
In-Reply-To: <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 30 Sep 2019 08:54:34 -0500
Message-ID: <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: "H. Nikolaus Schaller" <hns@goldelico.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v/6cTPKdYhCWm4oLn5nnbSZnKAi257wb/KoyfLSpOZ8=;
 b=mYXxmzMjX2uupScR95FotMBV60td1h7GEI1SE1kqw7gcg+cUuNOF/LlEyv8C8cYA1X
 TnShjEcS4laWh9uKeWQkPd+sxEBwdg0NvOmq5aditwp160k4/U0uaHpNBeZRqsn/dcYi
 AZj2GK7NBcSceCOT6GoV88CRKsTOE3cN8ZjVlbofX1UuxXVZdL5zwgLFP4HEwViw9kxS
 3BSJmRYpS2lOchJETLBBTTzTvmE5YHtS1/u4slG6REkeQdRr7GbQ7I7W+OxT4V8Ocvqg
 4Q+A7ITlEQ2bYWrN27FnMvn79gJdgsYlFKinQnqGM3Si+CbXnqg+9lS1ajToADw3FA6W
 vzmw==
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgODozOSBBTSBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5z
QGdvbGRlbGljby5jb20+IHdyb3RlOgo+Cj4KPiA+IEFtIDMwLjA5LjIwMTkgdW0gMTA6NTMgc2No
cmllYiBUZXJvIEtyaXN0byA8dC1rcmlzdG9AdGkuY29tPjoKPiA+Cj4gPiBUaGUgYmVzdCBhY3Rp
b24gaGVyZSBpcyBwcm9iYWJseSB0byBkcm9wIHRoZSBtYXgtZGl2IHZhbHVlIGZvciB0aGlzIGNs
b2NrIHRvIDE2LiBDYW4gc29tZW9uZSBjaGVjayB0aGlzIHdpdGggdGhlaXIgZGlzcGxheSBzZXR1
cCBhbmQgc2VlIHdoYXQgaGFwcGVucz8gQXR0YWNoZWQgcGF0Y2ggc2hvdWxkIGRvIHRoZSB0cmlj
ay4KPgo+IEkgaGF2ZSBjaGVja2VkIG9uIEdUQTA0IGFuZCBPcGVuUGFuZG9yYSAoRE0zNzMwIHJl
c3AuIE9NQVAzNDMwKSBhbmQgZGlkIG5vdCBub3RpY2UgYSBuZWdhdGl2ZSBlZmZlY3QuCj4KPiAo
V2VsbCwgd2UgbmV2ZXIgc2VlIHRoZSBwcm9ibGVtIHRoYXQgaXMgZGlzY3Vzc2VkIGhlcmUgYW5k
IGhhdmUgYnVpbHQgd2l0aCBDT05GSUdfT01BUDJfRFNTX01JTl9GQ0tfUEVSX1BDSz0wKS4KCkkg
aGF2ZSBuZXZlciBiZWVuIGFibGUgdG8gdXNlIENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJf
UENLPTAsIGJ1dApJIGFzc3VtZSBpdCdzIGVpdGhlciBhIGZ1bmN0aW9uIG9mIHBjayBvciBhIGNv
bWJpbmF0aW9uIG9mIHBjayB3aXRoCnRoZSByZXNvbHV0aW9uLgoKQmFzZWQgb24gVG9taSdzIGNv
bW1lbnQsIEkgYXNzdW1lIGhlJ3Mgd29ya2luZyBvbiB0aGUgZm9sbG93aW5nLiAgQ2FuCnlvdSBh
bHNvIHRyeToKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMK
Yi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKaW5kZXggNTcxMWI3YTcyMGU2Li41
ZTU4NGYzMmVhNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3Mu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKQEAgLTEwOTAsNyArMTA5
MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1cmVzIG9tYXAzNHh4X2Rzc19mZWF0
cyA9IHsKCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRzc19mZWF0dXJlcyBvbWFwMzYzMF9kc3NfZmVh
dHMgPSB7CiAgICAgICAgLm1vZGVsICAgICAgICAgICAgICAgICAgPSAgICAgICBEU1NfTU9ERUxf
T01BUDMsCi0gICAgICAgLmZja19kaXZfbWF4ICAgICAgICAgICAgPSAgICAgICAzMiwKKyAgICAg
ICAuZmNrX2Rpdl9tYXggICAgICAgICAgICA9ICAgICAgIDE2LAogICAgICAgIC5mY2tfZnJlcV9t
YXggICAgICAgICAgID0gICAgICAgMTczMDAwMDAwLAogICAgICAgIC5kc3NfZmNrX211bHRpcGxp
ZXIgICAgID0gICAgICAgMSwKICAgICAgICAucGFyZW50X2Nsa19uYW1lICAgICAgICA9ICAgICAg
ICJkcGxsNF9jayIsCgoKSG9wZWZ1bGx5IGl0IGRvZXNuJ3QgYnJlYWsgdGhlIDM2MzAgZm9yIHlv
dSwgYnV0IGl0IGZpeGVkIG15IGlzc3VlCndpdGggbm8gYmFjayB0cmFjZToKClsgICAgOS45MTU1
ODhdIERTUzogc2V0IGZjayB0byA1NDAwMDAwMApbICAgIDkuOTE1NjE4XSBESVNQQzogbGNrID0g
NTQwMDAwMDAgKDEpClsgICAgOS45MTU2NDldIERJU1BDOiBwY2sgPSA5MDAwMDAwICg2KQpbICAg
IDkuOTE3NjMzXSBESVNQQzogY2hhbm5lbCAwIHhyZXMgNDgwIHlyZXMgMjcyClsgICAgOS45MTc2
NjNdIERJU1BDOiBwY2sgOTAwMDAwMAoKSSBkbyB3b25kZXIsIGhvd2V2ZXIgaWYgdGhlcmUgaXMg
YSBkaXZpZGVyIHRoYXQgaXMgaGlnaGVyIHRoYW4gMTYsIGJ1dApsb3dlciB0aGFuIDMyLgpJIHdh
cyBhYmxlIHRvIHJ1biBmY2sgYXQgMzZNSHogYmVmb3JlIHdpdGggZGl2aWRlIGJ5IDQgdG8gOU1I
eiwgc28gSQphbSBob3BpbmcgdGhhdCBieSBydW5uaW5nIGF0IDU0TUh6IC8gNiBkb2Vzbid0IGRy
YXcgbW9yZSBwb3dlci4gIEkgd2FzCnJlYWRpbmcgdGhyb3VnaCB0aGUgZGF0YXNoZWV0LCBidXQg
SSBjb3VsZCBub3QgZmluZCBhbnkgcmVmZXJlbmNlIHRvCnRoZSBtYXggZGl2aWRlci4KCmFkYW0K
Pgo+IEJSLAo+IE5pa29sYXVzCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
