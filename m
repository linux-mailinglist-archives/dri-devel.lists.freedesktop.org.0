Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35162D2636
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9466E9D2;
	Tue,  8 Dec 2020 08:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDE26E8ED
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 22:08:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 131so11662548pfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 14:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RH4pdeWWvfre3cu7j/0GaN4hr0feg8IAaGOFeWc7Icc=;
 b=tKQPYnaxHUT3G2ejHD48wVGmGAxvUk613h0F7isSh8Rgc19Xi7ydBlmSLt+L32+7oY
 oaI8J5ctkEvu4NmRRHSbig6Mwk8l/sPJN4pQ1dFXoLheHhD7L7F/TV8xzqy3iKTBP7D0
 VTLTwaXLdWl7QvZUXqoMT/FCnBtw4rwVKi1VaQklokAx67u+UrEnuDn5OxSNsZbPdveG
 5MdDQZMADa8lqv5gr27CUEnqeCW3aoM1Ap7KwfsRIStNtMC8K0Jr1RSz+BiWK/c7Dw6k
 UXWpYeADZyZffIi3l3+VK73Ra1zI5PQ73b8TAGv9keK7rW9e9cPSGgieCY5M8JLiA6ve
 WBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RH4pdeWWvfre3cu7j/0GaN4hr0feg8IAaGOFeWc7Icc=;
 b=EaTnE9UB5PLsdgEYWBf6kDEmGIwlPOUhd14LANSneJjroPyjIhvSoGBhzHdzzaSfd+
 d0RjP9gXsFAO8XhlXE7nn11X+8+ONweA64ZBpDOjTQNwFLrSwOeTBBFHVmVuIx/r3y1E
 JPReD/4EcSoCkToLL5C/cLbo79nyj6njQ7dOVVl+UFaVso7+4U1fPX1eqeA9mDCY3WT6
 Owe+o0R+Va+t+ML/VnTS0+aqnR8sJMMF3oS44+IeoGcFwfSsm7fG4S0CQe3fxZmS/95X
 XPQRQIQlkVe1WxLCgJ+EDtbjuqWU8hjA6Hmd5uRzQomIdWNM8FJaPcA5qj2ubNRisT4R
 AATQ==
X-Gm-Message-State: AOAM53083DLWvD6N2UYI+Ia3lgQl043O2EW82/BHdLbB/b2xl74d0fvP
 AAuaae+3ITaaOF3dNunjh6zVASmm2a9kpB3q5Ysm3w==
X-Google-Smtp-Source: ABdhPJwcEAD4avRJlrTqe4+EmXzyDwFajmE/uvoR8AgoDacymps++P6aOkJQm3MqgeYJqxpQEM4PRYwTnZFflhmAPRQ=
X-Received: by 2002:a17:90a:6fa1:: with SMTP id
 e30mr921328pjk.32.1607378885707; 
 Mon, 07 Dec 2020 14:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20201204081349.1182302-1-arnd@kernel.org>
 <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
 <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
 <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
In-Reply-To: <CAK8P3a09KQS7S5-vJU7ECJh0HXUhwZW9zOOp4c32mtvM5XcU1g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Dec 2020 14:07:53 -0800
Message-ID: <CAKwvOd=-2zoc06EY4R9ZJ0M874bQv3NuT8a0q9=RoYeMMtnXVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Roman Li <Roman.Li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgNywgMjAyMCBhdCAxOjU3IFBNIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyA3LCAyMDIwIGF0IDk6NTAgUE0gQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+IEFtIDA3LjEyLjIw
IHVtIDIxOjQ3IHNjaHJpZWIgQWxleCBEZXVjaGVyOgo+ID4gPiBPbiBGcmksIERlYyA0LCAyMDIw
IGF0IDM6MTMgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+
IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiA+Pgo+ID4gPj4gQXMgdGhl
IERSTV9BTURfRENfRENOM18wIGNvZGUgd2FzIHg4Ni1vbmx5IGFuZCBmYWlscyB0byBidWlsZCBv
bgo+ID4gPj4gYXJtNjQsIG1lcmdpbmcgaXQgaW50byBEUk1fQU1EX0RDIG1lYW5zIHRoYXQgdGhl
IHRvcC1sZXZlbCBzeW1ib2wKPiA+ID4+IGlzIG5vdyB4ODYtb25seSBhcyB3ZWxsLgo+ID4gPj4K
PiA+ID4+IENvbXBpbGF0aW9uIGZhaWxzIG9uIGFybTY0IHdpdGggY2xhbmctMTIgd2l0aAo+ID4g
Pj4KPiA+ID4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2Rj
bjMwL2Rpc3BsYXlfbW9kZV92YmFfMzAuYzozNjQxOjY6IGVycm9yOiBzdGFjayBmcmFtZSBzaXpl
IG9mIDI0MTYgYnl0ZXMgaW4gZnVuY3Rpb24gJ2RtbDMwX01vZGVTdXBwb3J0QW5kU3lzdGVtQ29u
ZmlndXJhdGlvbkZ1bGwnIFstV2Vycm9yLC1XZnJhbWUtbGFyZ2VyLXRoYW49XQo+ID4gPj4gdm9p
ZCBkbWwzMF9Nb2RlU3VwcG9ydEFuZFN5c3RlbUNvbmZpZ3VyYXRpb25GdWxsKHN0cnVjdCBkaXNw
bGF5X21vZGVfbGliICptb2RlX2xpYikKPiA+ID4+Cj4gPiA+PiBJIHRyaWVkIHRvIHNlZSBpZiB0
aGUgc3RhY2sgdXNhZ2UgY2FuIGJlIHJlZHVjZWQsIGJ1dCB0aGlzIGlzIGNvZGUKPiA+ID4+IHRo
YXQgaXMgZGVzY3JpYmVkIGFzICJUaGlzIGZpbGUgaXMgZ2NjLXBhcnNhYmxlIEhXIGdvc3BlbCwg
Y29taW5nCj4gPiA+PiBzdHJhaWdodCBmcm9tIEhXIGVuZ2luZWVycy4iIGFuZCBpcyB3cml0dGVu
IGluIGEgd2F5IHRoYXQgaXMgaW5oZXJlbnRseQo+ID4gPj4gbm9ucG9ydGFibGUgYW5kIG5vdCBt
ZWFudCB0byBiZSB1bmRlcnN0b29kIGJ5IGh1bWFucy4KPiA+ID4+Cj4gPiA+PiBUaGVyZSBhcmUg
cHJvYmFibHkgbm8gbm9uLXg4NiB1c2VycyBvZiB0aGlzIGNvZGUsIHNvIHNpbXBsaWZ5Cj4gPiA+
PiB0aGUgZGVwZW5kZW5jeSBsaXN0IGFjY29yZGluZ2x5Lgo+ID4gPiArIERhbmllbCwgVGltb3Ro
eQo+ID4gPgo+ID4gPiBPdGhlcnMgY29udHJpYnV0ZWQgY29kZSB0byBlbmFibGUgdGhpcyBvbiBQ
UEM2NCBhbmQgQVJNNjQuCj4gPiA+IFVuZm9ydHVuYXRlbHksIHdlIGRvbid0IGhhdmUgdGhlc2Ug
cGxhdGZvcm1zIHRvIHRlc3Qgd2l0aCB3aXRoaW4gQU1ELgo+ID4gPiBEb2VzIFBQQzY0IGhhdmUg
dGhlIHNhbWUgc3RhY2sgbGltaXRhdGlvbnMgYXMgQVJNNjQ/ICBIYXJyeSwgTGVvLCBjYW4KPiA+
ID4geW91IHRha2UgYSBsb29rIGF0IGZpeGluZyB0aGUgc3RhY2sgdXNhZ2U/Cj4gPgo+ID4gVGhp
cyByZW1pbmRzIG1lIHRoYXQgSSB3YW50ZWQgdG8gcmVwbHkgb24gdGhpcy4KPiA+Cj4gPiAyNDE2
IGlzIGV2ZW4gdG8gbXVjaCBvbiB4ODYgaWYgeW91IGFkZCAtV2Vycm9yIDopCj4gPgo+ID4gU28g
dGhpcyBuZWVkcyB0byBiZSBmaXhlZCBhbnl3YXkuCj4KPiBSaWdodCwgbG9va2luZyBhdCBteSBs
YXRlc3QgcmFuZGNvbmZpZyBsb2dzLCBJIHNlZSB0aGUgc2FtZSBwcm9ibGVtIG9uIHg4Ngo+IGJ1
aWxkcyB3aXRoIGNsYW5nIGFzIHdlbGwsIHRob3VnaCBJJ20gbm90IGVudGlyZWx5IHN1cmUgd2hp
Y2ggb3RoZXIKPiBjb25maWd1cmF0aW9uCj4gb3B0aW9ucyBhcmUgbmVlZGVkIHRvIHRyaWdnZXIg
aXQuCj4KPiBTbyBteSBwYXRjaCBjYW4gYmUgZGlzcmVnYXJkZWQsIGJ1dCBJIGFncmVlIHRoaXMg
bmVlZHMgYSBiZXR0ZXIgZml4LAo+IGVpdGhlciBpbiBjbGFuZyBvciBpbiB0aGUgZGNuIGRyaXZl
ci4KCklmIHlvdSBjb3VsZCBnaXZlIGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgv
ZnJhbWUtbGFyZ2VyLXRoYW4KYSBzcGluIGFnYWluLCBJIHdvdWxkIGFwcHJlY2lhdGUgYW55IGZl
ZWRiYWNrLgoKCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
