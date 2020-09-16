Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B1E26CE76
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 00:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAEA6EB42;
	Wed, 16 Sep 2020 22:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774B86EB40
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 22:15:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z4so8465268wrr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IlLynDXWA6Vc4pTOIis0zeNUkdqOrDALjwAKQG96ef8=;
 b=fjNCRpgiw1wF0DlArdhGUWN0Gqp+4eDdasszz1aF/djnRfDMSTGkiNehtea3PWQtNW
 FTAAyaHj/BJy54q54TzKHBYX0EOs+LQrQ40j4pZzmMRkWR7oDRyYSZdGmKJyu1zMW9pf
 bgpW67hhcILamTuCvbbtpVZsb5bTbaX62q5WwzgE1NTAT6bwk2EutAjW9CHPrxhmn3ep
 qy0GuOcY/wcFm9aw2LIaDNuMZrvH/I0gXvk0a4N90kFdSBuKyATGniIVqCcdgJB2pV0B
 GhMBDDDgtAKxLhyu67kLkx+gyLIvoUMLEDrvrXkZwZZd59fYQLAOL9y2R9KIEvBl4SC9
 7nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IlLynDXWA6Vc4pTOIis0zeNUkdqOrDALjwAKQG96ef8=;
 b=k1L+EXrJtvRTwQm4Cn7iHG4Ch1xA0JY3JhdAM7omdrxK4UHDspbRF3pSzaxeaAURc+
 U0msdLIgeukkiiV8lO75/+qmubrcylCgBXiM7rVMhSh7ZTMYeS4fNyZxcQEp1Ym/pNrZ
 l0vkaqJb/k20ngaL5eDZJudcjRFVNmhZYkM6JLJotZISwFj2VhA4YTk/wzoattAhf2Ro
 SsgwTgqlpopMtUXQCD9iaytlPWuI6tOqUGQqwRl9ZaAjQjehIPy5J9hlHdlHkijp6Klj
 FIfdyZTvF9/drkHXaE8SbGrV691vj+VfzaqkgSt31LCtOwNPT3qcxZgfSArcYJcLkmKX
 gjtg==
X-Gm-Message-State: AOAM531mYVIs0Sf72HRC+QppEoNniB0/D9g1AmpmIFUjcK1/AorWqin3
 cbp4ma1/09TYjJIXGEFx9L4nR15ugEwV8vFDdK4=
X-Google-Smtp-Source: ABdhPJxqDyjKYgfkcdQI0ldqigFZMkhmwzjMkAJCz+IuLc9Rc/7DzvhzDdfCDjlE6Zj5pF0pXWy3mqLaQFOjFpPZ8Zo=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr30599444wrl.419.1600294532001; 
 Wed, 16 Sep 2020 15:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <400f6ce9-e360-0860-ca2a-fb8bccdcdc9b@gmail.com>
 <20200109141436.GA22111@lst.de> <9ad75215-3ff1-ee76-9985-12fd78d6aa5f@amd.com>
 <801e4196-5e22-e805-4d45-0245efdaa508@mageia.org>
In-Reply-To: <801e4196-5e22-e805-4d45-0245efdaa508@mageia.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Sep 2020 18:15:21 -0400
Message-ID: <CADnq5_PgQq4U86sSvpXSP6d9LUQHhohi4u2d6TjAPRA--1vM5A@mail.gmail.com>
Subject: Re: Regression in 5.4 kernel on 32-bit Radeon IBM T40
To: Thomas Backlund <tmb@mageia.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Woody Suwalski <terraluna977@gmail.com>, Christoph Hellwig <hch@lst.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Pavel Machek <pavel@ucw.cz>, "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgNDoyMCBBTSBUaG9tYXMgQmFja2x1bmQgPHRtYkBtYWdl
aWEub3JnPiB3cm90ZToKPgo+IERlbiAwOS0wMS0yMDIwIGtsLiAxNzoxMiwgc2tyZXYgQ2hyaXN0
aWFuIEvDtm5pZzoKPiA+IEhpIENocmlzdG9waCwKPiA+Cj4gPiBBbSAwOS4wMS4yMCB1bSAxNTox
NCBzY2hyaWViIENocmlzdG9waCBIZWxsd2lnOgo+ID4+IEhpIFdvb2R5LAo+ID4+Cj4gPj4gc29y
cnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBJJ3ZlIGJlZW4gb2ZmIHRvIGEgdmFjYXRpb24gb3ZlciB0
aGUgaG9saWRheXMuCj4gPj4KPiA+PiBPbiBTYXQsIERlYyAxNCwgMjAxOSBhdCAxMDoxNzoxNVBN
IC0wNTAwLCBXb29keSBTdXdhbHNraSB3cm90ZToKPiA+Pj4gUmVncmVzc2lvbiBpbiA1LjQga2Vy
bmVsIG9uIDMyLWJpdCBSYWRlb24gSUJNIFQ0MAo+ID4+PiB0cmlnZ2VyZWQgYnkKPiA+Pj4gY29t
bWl0IDMzYjNhZDM3ODhhYmE4NDZmYzhiOWEwNjVmZTI2ODVhMGI2NGY3MTMKPiA+Pj4gQXV0aG9y
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+Pj4gRGF0ZTogICBUaHUgQXVnIDE1
IDA5OjI3OjAwIDIwMTkgKzAyMDAKPiA+Pj4KPiA+Pj4gSG93ZHksCj4gPj4+IFRoZSBhYm92ZSBw
YXRjaCBoYXMgdHJpZ2dlcmVkIGEgZGlzcGxheSBwcm9ibGVtIG9uIElCTSBUaGlua3BhZCBUNDAs
Cj4gPj4+IHdoZXJlCj4gPj4+IHRoZSBzY3JlZW4gaXMgY292ZXJlZCB3aXRoIGEgbG90cyBvZiBy
YW5kb20gc2hvcnQgYmxhY2sgaG9yaXpvbnRhbAo+ID4+PiBsaW5lcywKPiA+Pj4gb3IgZGlzdG9y
dGVkIGxldHRlcnMgaW4gWCB0ZXJtcy4KPiA+Pj4KPiA+Pj4gVGhlIGN1bHByaXQgc2VlbXMgdG8g
YmUgdGhhdCB0aGUgZG1hX2dldF9yZXF1aXJlZF9tYXNrKCkgaXMgcmV0dXJuaW5nIGEKPiA+Pj4g
dmFsdWUgMHgzZmZmZmZmZgo+ID4+PiB3aGljaCBpcyBzbWFsbGVyIHRoYW4gZG1hX2dldF9tYXNr
KCkweGZmZmZmZmZmLlRoYXQgcmVzdWx0cyBpbgo+ID4+PiBkbWFfYWRkcmVzc2luZ19saW1pdGVk
KCk9PTAgaW4gdHRtX2JvX2RldmljZSgpLCBhbmQgdXNpbmcgNDAtYml0cyBkbWEKPiA+Pj4gaW5z
dGVhZCBvZiAzMi1iaXRzLgo+ID4+IFdoaWNoIGlzIHRoZSBpbnRlbmRlZCBiZWhhdmlvciBhc3N1
bWluZyB5b3VyIHN5c3RlbSBoYXMgMUdCIG9mIG1lbW9yeS4KPiA+PiBEb2VzIGl0Pwo+ID4KPiA+
IEFzc3VtaW5nIHRoZSBzeXN0ZW0gZG9lc24ndCBoYXZlIHRoZSAxR0Igc3BsaXQgdXAgc29tZWhv
dyBjcmF6eSBvdmVyIHRoZQo+ID4gYWRkcmVzcyBzcGFjZSB0aGF0IHNob3VsZCBpbmRlZWQgd29y
ayBhcyBpbnRlbmRlZC4KPiA+Cj4gPj4KPiA+Pj4gSWYgSSBoYXJkY29kZSAiMSIgYXMgdGhlIGxh
c3QgcGFyYW1ldGVyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpIGluCj4gPj4+IHBsYWNlIG9mCj4g
Pj4+IGEgY2FsbCB0byBkbWFfYWRkcmVzc2luZ19saW1pdGVkKCksdGhlIHByb2JsZW0gZ29lcyBh
d2F5Lgo+ID4+IEknbGwgbmVlZCBzb21lIGhlbHAgZnJvbSB0aGUgZHJtIC8gcmFkZW9uIC8gVFRN
IG1haW50YWluZXJzIGlmIHRoZXJlIGFyZQo+ID4+IGFueSBvdGhlciBzaWRlIGVmZmVjdHMgZnJv
bSBub3QgcGFzc2luZyB0aGUgbmVlZF9kbWEzMiBwYXJhbXRlcnMuCj4gPj4gT2J2aW91c2x5IGlm
IHRoZSBkZXZpY2UgZG9lc24ndCBoYXZlIG1vcmUgdGhhbiAzMi1iaXRzIHdvcnRoIG9mIGRyYW0g
YW5kCj4gPj4gbm8gRE1BIG9mZnNldCB3ZSBjYW4ndCBmZWVkIHVuYWRkcmVzc2FibGUgbWVtb3J5
IHRvIHRoZSBkZXZpY2UuCj4gPj4gVW5mb3J0dW5hdGVseSBJIGhhdmUgYSB2ZXJ5IGhhcmQgdGlt
ZSBmb2xsb3dpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mCj4gPj4gdGhlIFRUTSBwb29sIGlmIGl0
IGRvZXMgYW55dGhpbmcgZWxzZSBpbiB0aGlzIGNhc2UuCj4gPgo+ID4gVGhlIG9ubHkgb3RoZXIg
dGhpbmcgd2hpY2ggY29tZXMgdG8gbWluZCBpcyB1c2luZyBodWdlIHBhZ2VzLiBDYW4geW91Cj4g
PiB0cnkgYSBrZXJuZWwgd2l0aCBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgZGlzYWJsZWQ/
Cj4gPgo+Cj4KPiBBbnkgcHJvZ3Jlc3Mgb24gdGhpcyA/Cj4KPiBXZSBoYXZlIGEgYnVncmVwb3J0
IGluIE1hZ2VpYSB3aXRoIHRoZSBodzoKPiBEZWxsIEluc3Bpcm9uIDUxMDAsIDMyLWJpdCBQNCBw
cm9jZXNzb3IsIDJHQiBvZiBSQU0sIFJhZGVvbiBNb2JpbGl0eQo+IDc1MDAgKFJWMjAwKSBncmFw
aGljcwo+Cj4gdGhhdCBnZXRzIGRpc3BsYXkgaXNzdWVzIHRvbyBhbmQgcmV2ZXJ0aW5nIHRoZSBv
ZmZlbmRpbmcgY29tbWl0IHJlc3RvcmVzCj4gbm9ybWFsIGJlaGF2aW91ci4KPgo+IGFuZCB0aGUg
c2FtZSBpc3N1ZSBpcyBzdGlsbCB0aGVyZSB3aXRoIDUuNSBzZXJpZXMga2VybmVscy4KCkRvZXMg
ZGlzYWJsaW5nIEhJTUVNIG9yIHNldHRpbmcgcmFkZW9uLmFncG1vZGU9LTEgb24gdGhlIGtlcm5l
bApjb21tYW5kIGxpbmUgaW4gZ3J1YiBmaXggdGhlIGlzc3VlPwoKQWxleApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
