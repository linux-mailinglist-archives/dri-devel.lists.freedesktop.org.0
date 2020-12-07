Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6692D1C82
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0B789D73;
	Mon,  7 Dec 2020 21:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531089D73;
 Mon,  7 Dec 2020 21:57:47 +0000 (UTC)
X-Gm-Message-State: AOAM532A9VoFZhOMRDhgjCQro+cxztb0pQunIpNmIHaG+V7ZyYbAh41U
 Rbk0Sive5cHFqDCeHNGYUn0hJcDfvJF1OsoGsC8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607378267;
 bh=ksOiwcQuyTdGZ/0xs0Rr3mLefm+gUEwoODlr/FTT3Ws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bn2nl2YOJ1o9oYaE9lF5+mCXzzqHF51w0qB54r5FqFF7X1izJlfvlnOw5I7Q8GHKP
 RoqU57WTKC6faoiDe3Zw67frqSRE0l+IEo3kY5u2Vfbvse1KdQbjOweX7H2w0q5oPl
 5EjwaDkh/2qkB3wiU25+Jehl4xlayHZGwHxYTOuQK09tDDJwgSQ/s8WtTmFLA/C34u
 Wcm4Gor8fnFiYwhYtL3P0Wg+nJLvxmtoBhWSCAz2jwBEr+8DPeBarLBzhc0QsAGg1v
 iX7/TvPgtiZIwV82aMuBpA/+U2BIFKFOysBUcnCkGagTgi2RB2/neq3C+OQDn145wv
 e7H2EYDeqISRg==
X-Google-Smtp-Source: ABdhPJwFFIJ6eWvVRpDubr3SS1DWxrsa13Jhn19Yuha6L2b5D9qVbE12GKTRLJcaOLffzSjg4EZrJuLVG8mRfpqw3IM=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr14853258otk.251.1607378267025; 
 Mon, 07 Dec 2020 13:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20201204081349.1182302-1-arnd@kernel.org>
 <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
 <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
In-Reply-To: <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 7 Dec 2020 22:57:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
Message-ID: <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Mauro Rossi <issor.oruam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgNywgMjAyMCBhdCA5OjUwIFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMDcuMTIuMjAgdW0gMjE6NDcgc2NocmllYiBB
bGV4IERldWNoZXI6Cj4gPiBPbiBGcmksIERlYyA0LCAyMDIwIGF0IDM6MTMgQU0gQXJuZCBCZXJn
bWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxh
cm5kQGFybmRiLmRlPgo+ID4+Cj4gPj4gQXMgdGhlIERSTV9BTURfRENfRENOM18wIGNvZGUgd2Fz
IHg4Ni1vbmx5IGFuZCBmYWlscyB0byBidWlsZCBvbgo+ID4+IGFybTY0LCBtZXJnaW5nIGl0IGlu
dG8gRFJNX0FNRF9EQyBtZWFucyB0aGF0IHRoZSB0b3AtbGV2ZWwgc3ltYm9sCj4gPj4gaXMgbm93
IHg4Ni1vbmx5IGFzIHdlbGwuCj4gPj4KPiA+PiBDb21waWxhdGlvbiBmYWlscyBvbiBhcm02NCB3
aXRoIGNsYW5nLTEyIHdpdGgKPiA+Pgo+ID4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZG1sL2RjbjMwL2Rpc3BsYXlfbW9kZV92YmFfMzAuYzozNjQxOjY6IGVycm9y
OiBzdGFjayBmcmFtZSBzaXplIG9mIDI0MTYgYnl0ZXMgaW4gZnVuY3Rpb24gJ2RtbDMwX01vZGVT
dXBwb3J0QW5kU3lzdGVtQ29uZmlndXJhdGlvbkZ1bGwnIFstV2Vycm9yLC1XZnJhbWUtbGFyZ2Vy
LXRoYW49XQo+ID4+IHZvaWQgZG1sMzBfTW9kZVN1cHBvcnRBbmRTeXN0ZW1Db25maWd1cmF0aW9u
RnVsbChzdHJ1Y3QgZGlzcGxheV9tb2RlX2xpYiAqbW9kZV9saWIpCj4gPj4KPiA+PiBJIHRyaWVk
IHRvIHNlZSBpZiB0aGUgc3RhY2sgdXNhZ2UgY2FuIGJlIHJlZHVjZWQsIGJ1dCB0aGlzIGlzIGNv
ZGUKPiA+PiB0aGF0IGlzIGRlc2NyaWJlZCBhcyAiVGhpcyBmaWxlIGlzIGdjYy1wYXJzYWJsZSBI
VyBnb3NwZWwsIGNvbWluZwo+ID4+IHN0cmFpZ2h0IGZyb20gSFcgZW5naW5lZXJzLiIgYW5kIGlz
IHdyaXR0ZW4gaW4gYSB3YXkgdGhhdCBpcyBpbmhlcmVudGx5Cj4gPj4gbm9ucG9ydGFibGUgYW5k
IG5vdCBtZWFudCB0byBiZSB1bmRlcnN0b29kIGJ5IGh1bWFucy4KPiA+Pgo+ID4+IFRoZXJlIGFy
ZSBwcm9iYWJseSBubyBub24teDg2IHVzZXJzIG9mIHRoaXMgY29kZSwgc28gc2ltcGxpZnkKPiA+
PiB0aGUgZGVwZW5kZW5jeSBsaXN0IGFjY29yZGluZ2x5Lgo+ID4gKyBEYW5pZWwsIFRpbW90aHkK
PiA+Cj4gPiBPdGhlcnMgY29udHJpYnV0ZWQgY29kZSB0byBlbmFibGUgdGhpcyBvbiBQUEM2NCBh
bmQgQVJNNjQuCj4gPiBVbmZvcnR1bmF0ZWx5LCB3ZSBkb24ndCBoYXZlIHRoZXNlIHBsYXRmb3Jt
cyB0byB0ZXN0IHdpdGggd2l0aGluIEFNRC4KPiA+IERvZXMgUFBDNjQgaGF2ZSB0aGUgc2FtZSBz
dGFjayBsaW1pdGF0aW9ucyBhcyBBUk02ND8gIEhhcnJ5LCBMZW8sIGNhbgo+ID4geW91IHRha2Ug
YSBsb29rIGF0IGZpeGluZyB0aGUgc3RhY2sgdXNhZ2U/Cj4KPiBUaGlzIHJlbWluZHMgbWUgdGhh
dCBJIHdhbnRlZCB0byByZXBseSBvbiB0aGlzLgo+Cj4gMjQxNiBpcyBldmVuIHRvIG11Y2ggb24g
eDg2IGlmIHlvdSBhZGQgLVdlcnJvciA6KQo+Cj4gU28gdGhpcyBuZWVkcyB0byBiZSBmaXhlZCBh
bnl3YXkuCgpSaWdodCwgbG9va2luZyBhdCBteSBsYXRlc3QgcmFuZGNvbmZpZyBsb2dzLCBJIHNl
ZSB0aGUgc2FtZSBwcm9ibGVtIG9uIHg4NgpidWlsZHMgd2l0aCBjbGFuZyBhcyB3ZWxsLCB0aG91
Z2ggSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoaWNoIG90aGVyCmNvbmZpZ3VyYXRpb24Kb3B0aW9u
cyBhcmUgbmVlZGVkIHRvIHRyaWdnZXIgaXQuCgpTbyBteSBwYXRjaCBjYW4gYmUgZGlzcmVnYXJk
ZWQsIGJ1dCBJIGFncmVlIHRoaXMgbmVlZHMgYSBiZXR0ZXIgZml4LAplaXRoZXIgaW4gY2xhbmcg
b3IgaW4gdGhlIGRjbiBkcml2ZXIuCgogICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
