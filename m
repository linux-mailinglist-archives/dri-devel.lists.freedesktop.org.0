Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14301F0EFF
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A2B6E3C6;
	Sun,  7 Jun 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847F689EA3
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 16:17:28 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id z2so14502152ilq.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ygvf5nuvA+ffsLBARh1rJ/YbhDyymbtDFc6+0ZdklNU=;
 b=DXawI1l0fyQBTlt2vZQzdVugmfDMP6vgsM6hcYs2cNXdvCoB8uo6L1Rtb1F2kh7kuh
 gVmmFKmkwVLWyPX/+rKTYy/xYmKvsgixW8D0x4HOCItO7VtI1KpQCuWjqpFAaPs7TSiT
 pXzcpVFy2x9n0hCN6W/MRC9MYNiWIIrhCQCrBg4YpUj+j8rh38BLhiqAG8bXQlwYdWmG
 SIvBttV8fW+P1P5EosXau+3kzivmKhlhjrW1zrUYCgD/ksp1Img7rW3nhHTtXu/usRcZ
 szWNKUxfLt/cbxIx51s2o3OfeZjRecxVhL9okUrJera6gCeGFa8JBElCuj/V+94PZ3CF
 ouOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ygvf5nuvA+ffsLBARh1rJ/YbhDyymbtDFc6+0ZdklNU=;
 b=cQOwoBsee7omoZM3aa/BY7go8BUhPj+WPJ0o0eLpkSxjdXwxXrF0FLTRYR1ui9B+OF
 EZ67Ob4xg1TZbOskcQw+g8DP1t0xpmtYdyshPy5bl2+Ain2hYM2pdqkzNXE8matOzSt3
 WkCZrsmy/QLIh6ULH4oKdCpTtuPxbgJG6zqvWjTkbiCMNGhtm7j4vA1LwpMvYv+WfAi1
 MsRL7LVIxuubUs6LGh6v4YWSHiSkznwJJt5ZtePKe2ToxOKnovWoTacZet781ngzgc6Q
 ILU8/gw3pg8QdRVAYtadtIEIeIw4cHFM9cYHst5iA5cObXR5pj9Ov9vrfwHeXzzs2cNG
 rLFQ==
X-Gm-Message-State: AOAM533fvrGwM53zo7nz3AIO0z+pC2kjnMLydjt7SjPTIimmPx3msspz
 02iABGljtQSQa463JqtizRSD/EGsYMoZBFEyJFw=
X-Google-Smtp-Source: ABdhPJxPZR92PgNbrHhVIN6J3Db//aNWnmcAAYqj52c6L1iRqwi4S7TWwdI67C0lzMEZRb1oD388mfbG6GTLiinSdV8=
X-Received: by 2002:a92:d0a:: with SMTP id 10mr12215301iln.1.1591546647805;
 Sun, 07 Jun 2020 09:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-3-emil.l.velikov@gmail.com>
 <CAGWqDJ4rAmwMzb6Q61Ou9ZLNA2M-i-JhOSokVUkHYHa_-ZxCTw@mail.gmail.com>
 <CACvgo50=scDC32UrWQQ0QLXFTh1e8w8GcPFs52f6+jNMwesGOQ@mail.gmail.com>
 <CACvgo501vdL3mUDXrYuehcf2XrH2eq8AXkTBGiFUfFWiO8JCEQ@mail.gmail.com>
In-Reply-To: <CACvgo501vdL3mUDXrYuehcf2XrH2eq8AXkTBGiFUfFWiO8JCEQ@mail.gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Sun, 7 Jun 2020 21:47:16 +0530
Message-ID: <CAGWqDJ6z3+viK7xDf2k_YsVi7S=CgWzqbktrtp94_9dWRZiYaw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mipi: use dcs write for
 mipi_dsi_dcs_set_tear_scanline
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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

aGkgZW1pbCwKCk9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDM6MTcgUE0gRW1pbCBWZWxpa292IDxl
bWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgVmluYXksCj4KPiBPbiBUaHUs
IDcgTWF5IDIwMjAgYXQgMTc6MTgsIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDcgTWF5IDIwMjAgYXQgMTM6MjksIFZpbmF5IFNp
bWhhIEIgTiA8c2ltaGF2Y3NAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRW1pbCwKPiA+
ID4KPiA+ID4gUmVwbHkgaW5saW5lCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgNSBNYXkgMjAyMCBhdCA5
OjM1IFBNLCBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4gd3JvdGU6Cj4g
PiA+Pgo+ID4gPj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KPiA+ID4+Cj4gPiA+PiBUaGUgaGVscGVyIHVzZXMgdGhlIE1JUElfRENTX1NFVF9URUFSX1ND
QU5MSU5FLCBhbHRob3VnaCBpdCdzIGN1cnJlbnRseQo+ID4gPj4gdXNpbmcgdGhlIGdlbmVyaWMg
d3JpdGUuIFRoaXMgZG9lcyBub3QgbG9vayByaWdodC4KPiA+ID4+Cj4gPiA+PiBQZXJoYXBzIHNv
bWUgcGxhdGZvcm1zIGRvbid0IGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlIHR3byB3cml0ZXJzPwo+
ID4gPj4KPiA+ID4+IENjOiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4g
PiA+PiBDYzogVmluYXkgU2ltaGEgQk4gPHNpbWhhdmNzQGdtYWlsLmNvbT4KPiA+ID4+IENjOiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+ID4gPj4gQ2M6IFRoaWVycnkgUmVk
aW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gPiA+PiBGaXhlczogZTgzOTUwODE2MzY3ICgiZHJt
L2RzaTogSW1wbGVtZW50IHNldCB0ZWFyIHNjYW5saW5lIikKPiA+ID4+IFNpZ25lZC1vZmYtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiA+PiAtLS0KPiA+
ID4+IFJvYmVydCwgY2FuIHlvdSBwbGVhc2UgdGVzdCB0aGlzIGFnYWluc3QgdGhlIG9ubHkgdXNl
ciAtIHRoZSBSYXlkaXVtCj4gPiA+PiBSTTY3MTkxIHBhbmVsIGRyaXZlciB0aGF0IHlvdSBpbnRy
b2R1Y2VkLgo+ID4gPj4KPiA+ID4+IFRoYW5rcwo+ID4gPj4KPiA+ID4+IFZpbmF5LCBjYW4geW91
IGNvbmZpcm0gaWYgdGhpcyBpcyBhIGdlbnVpbmUgdHlwbyBvciB0aGVyZSdzIHNvbWV0aGluZwo+
ID4gPj4gcmVhbGx5IHN1YnRsZSBoYXBwZW5pbmcuCj4gPiA+Cj4gPiA+IHRoaXMgaGFzIGJlZW4g
dGVzdGVkIG9uIG5leHVzIDcgd2l0aCBqZGkgcGFuZWwuCj4gPiBUaGUgamRpIHBhbmVsIChKREkg
TFQwNzBNRTA1MDAwIEkgYmVsaWV2ZSkgZG9lcyBub3QgdXNlIHRoZSBmdW5jdGlvbiwgaG1tLgo+
ID4KPiA+IExvb2tpbmcgdGhyb3VnaCB0aGUgTUwgYXJjaGl2ZSAtIHRoZSBjYWxsIGluIHRoZSBm
aXJzdCA0IHJldmlzaW9ucyBvZiB0aGUgcGF0Y2guCj4gPiBUaGVuIHdpdGggdjUgaXQgaGFzIG1h
Z2ljYWxseSBkaXNhcHBlYXJlZCBhbG9uZ3NpZGUgbWlwaV9kc2lfZGNzX3NldF90ZWFyX29uKCku
Cj4gPgo+ID4gTm8gY29tbWVudCBleHBsYWluaW5nIHdoeSB0aG91Z2ggLSBkb2VzIHRoZSBkcml2
ZXIgd29yayB3L28gYm90aCBvZiB0aG9zZT8KPiA+Cj4gQW55IGlkZWFzLCBkb2VzIHRoZSBkcml2
ZXIgd29yayBpbiB0b2RheSdzIHN0YXRlPwpJbml0aWFsbHkgSSBoYWQgdXNlZCBjbWQgbW9kZSwg
bGF0ZXIgbW9kaWZpZWQgdG8gdmlkZW8gbW9kZSBwYW5lbCwKc2luY2UgdG8gY29udHJvbCB0aGUg
cGFuZWwgaW4gY21kIG1vZGUgaXMgbm90IGF2YWlsYWJsZSBmb3IgbWRwNC4Kc28gbWlwaV9kc2lf
ZGNzX3NldF90ZWFyX29uIHdhcyBub3QgdXNlZC4KCgo+Cj4gPiA+IEkgZGlkIG5vdCB1bmRlcnN0
YW5kIHdoYXQgaXMgdGhlIHR5cG8gaGVyZT8KPiA+ID4gV2UgbmVlZCB0byB1c2UgREPigJlzIHdy
aXRlIGluc3RlYWQgb2YgZ2VuZXJpYyB3cml0ZT8KPiA+Cj4gPiBJIGJlbGlldmUgdGhlIGNsdWUg
aXMgaW4gdGhlIGNvbW1hbmQgbmFtZSAtIE1JUElfRFNJX0RDUy4gSSB3YXMgZ29pbmcKPiA+IHRv
IGRvdWJsZS1jaGVjayB3aXRoIHRoZSBzcGVjIGFsdGhvdWdoIGl0J3MgbWVtYmVycyBvbmx5IDot
XAo+ID4gQmFzZWQgb24gdGhlIHVzYWdlIGluIERSTSwgYWxsIERDUyBjb21tYW5kcyBhcmUgaXNz
dWVkIHZpYQo+ID4gbWlwaV9kc2lfZGNzX3tyZWFkLHdyaXRlfQo+ID4KPiBEbyB5b3UgYWdyZWUg
d2l0aCB0aGUgcmF0aW9uYWxlPyBBbHRlcm5hdGl2ZWx5LCBkbyB5b3UgaGF2ZSBhCj4gcmVmZXJl
bmNlIHRvIHRoZSBBbmRyb2lkIHRyZWUgd2hlcmUgdGhlIGdlbmVyaWMgd3JpdGUgaXMgdXNlZC4K
PgpkZWZhdWx0IGFuZHJvaWQgbmV4dXMgNyBrZXJuZWwKaHR0cHM6Ly9naXRodWIuY29tL3ZpbmF5
c2ltaGFibi9tc20vY29tbWl0cy9uZXh1czctbXNtLWZsby0zLjQtbG9sbGlwb3AtcmVsZWFzZQo+
IFRoYW5rcwo+IEVtaWwKCgoKLS0KcmVnYXJkcywKdmluYXlzaW1oYQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
