Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2DED3A37
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873FC6EBBF;
	Fri, 11 Oct 2019 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89296EBBF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:44:32 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w144so7217354oia.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 00:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wl/RavXeUW+CBWItd1cFCttxIHqQ+7aeywo4gzF8EY=;
 b=X/tx10JYf1bFD4zBstja+3/eOFi9N1Azrr+ROZaWENT+0xrGFHW9AYqPXZszjUVv5W
 Jcv08o2kLVUf5aHvwEqp1aroC5uUcwj1aampH7BrjJXVOSuoVvWynaG3vGeA5585+X8P
 5ugCOqlAnRUdwi3285Jb9ebpdB65KBM+0sfI8CYh07ZJJIrKBC9jzXqyuIXjCKvXwm4a
 +yhgu3uPLp+EsOB56/kJPnYWHzpwF0xEgM7GaI4MCJ6bMecWZCFo8lmGiOIsQBQvZJch
 0s2lESjhzgEiJeFpmRYWlS+F6lVfROMVmUBMtro9Wze/elJNU/Bh6vQGx5UgNOr2g7XT
 UdIA==
X-Gm-Message-State: APjAAAUbpw0KvGR6z1rn35cySaZBbbQsQHXtggmz6rCj8TRUuhldNUdR
 qd+ojEJsbUW4wjZjkh/WExoIe5WP3be+7HskXhg2ig==
X-Google-Smtp-Source: APXvYqyEuqVF+onOk/VM380ZRxL+ZvBAcvsm2JnheHb5Xj3YkJ9cfksdFDMdl9hhx0Yj1nIEocDwHg0DXI82PT2ybh8=
X-Received: by 2002:aca:1b10:: with SMTP id b16mr11434409oib.110.1570779871924; 
 Fri, 11 Oct 2019 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
 <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
 <CADnq5_O0QjK0gecUiO0K6Tm7UVY7aF4uuBcj_uvHPKJBtAyEPQ@mail.gmail.com>
 <20191009074700.ieujxt3ueads2cbt@ahiler-desk1.fi.intel.com>
 <55cad18c-b69f-226c-182e-cdaf743822e3@amd.com>
 <CAPM=9tyYAhYhDKWxthJCVur-7Goqyj4xor6xOUeWjALBdeQjgw@mail.gmail.com>
 <CAPM=9tzHc5JsScuh0B_Mgpne387_Q3sXY7FE9RguzjL057L+NQ@mail.gmail.com>
In-Reply-To: <CAPM=9tzHc5JsScuh0B_Mgpne387_Q3sXY7FE9RguzjL057L+NQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 11 Oct 2019 09:44:20 +0200
Message-ID: <CAKMK7uF3soAssQh94gGeoyciGmTQ4hDMVkS2F5UVNO-HKO6z_Q@mail.gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+wl/RavXeUW+CBWItd1cFCttxIHqQ+7aeywo4gzF8EY=;
 b=VzW/8361mPrFH8v6MO3TylS/lUSvt/teVkd32I8WQbkQpflBjCdMWTaKDC4k5zroL7
 4IkFBEZfoQRga1zIAjaScTxkoCw/1IToZTiKOEP3liCZZjki8Rcoja630EWgxlUEcQkH
 0RrXPSHHVuuqjrOiB23bdKiOtkOhnthgm+/bw=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgNjoyNCBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAxMSBPY3QgMjAxOSBhdCAxNDoyMCwgRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDEwIE9jdCAyMDE5
IGF0IDIxOjU4LCBLb2VuaWcsIENocmlzdGlhbgo+ID4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFtIDA5LjEwLjE5IHVtIDA5OjQ3IHNjaHJpZWIgQXJrYWRp
dXN6IEhpbGVyOgo+ID4gPiA+IE9uIFR1ZSwgT2N0IDA4LCAyMDE5IGF0IDA5OjEzOjQxQU0gLTA0
MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+ID4gPj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA0
OjA0IEFNIEtvZW5pZywgQ2hyaXN0aWFuCj4gPiA+ID4+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+ID4gPiA+Pj4gTXkgZ2l0IHZlcnNpb24gc2hvdWxkIGJlIHJlbGF0aXZlIG5l
dywgYnV0IEknbSB1c3VhbGx5IHVzaW5nIHRodW5kZXJiaXJkCj4gPiA+ID4+PiB0byBzZW5kIHB1
bGwgcmVxdWVzdHMgbm90IGdpdCBpdHNlbGYgc2luY2UgSSB3YW50IHRvIGVkaXQgdGhlIG1lc3Nh
Z2UKPiA+ID4gPj4+IGJlZm9yZSBzZW5kaW5nLgo+ID4gPiA+Pj4KPiA+ID4gPj4+IEhvdyB3b3Vs
ZCBJIGRvIHRoaXMgaW4gYSB3YXkgcGF0Y2h3b3JrIGxpa2VzIGl0IHdpdGggZ2l0Pwo+ID4gPiA+
PiBGV0lXLCBJIHVzdWFsbHkgZ2VuZXJhdGUgdGhlIGVtYWlsIGZpcnN0IGFuZCB0aGVuIHVzZSBn
aXQtc2VuZC1lbWFpbAo+ID4gPiA+PiB0byBhY3R1YWxseSBzZW5kIGl0Lgo+ID4gPiA+Pgo+ID4g
PiA+PiBBbGV4Cj4gPiA+ID4gSGV5LAo+ID4gPiA+Cj4gPiA+ID4gRkRPIHBhdGNod29yayBtYWlu
dGFpbmVyIGhlcmUuCj4gPiA+ID4KPiA+ID4gPiBJIGhhdmUgdHJpZWQgZmV3IHRoaW5ncyBxdWlj
a2x5IHdpdGggbm8gbHVjay4gVGhlcmUgaXMgc29tZXRoaW5nIGZpc2h5Cj4gPiA+ID4gYWJvdXQg
RkRPIGRlcGxveW1lbnQgb2YgcGF0Y2h3b3JrIC0geW91IGVtYWlsIHdvcmtzIGp1c3QgZmluZSBv
biBteQo+ID4gPiA+IGRldmVsb3BtZW50IGluc3RhbmNlLgo+ID4gPiA+Cj4gPiA+ID4gSSBoYXZl
IGNyZWF0ZWQgaXNzdWUgZm9yIHRoaXM6Cj4gPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL3BhdGNod29yay1mZG8vcGF0Y2h3b3JrLWZkby9pc3N1ZXMvMjgKPiA+ID4gPgo+ID4g
PiA+IFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KPiA+ID4KPiA+ID4gTWF5YmUgaXQncyB0
aGUgbm9uLUxhdGluIGxldHRlciBpbiBteSBsYXN0IG5hbWU/IEFueXdheSB3ZSBuZWVkIHRvIGdl
dAo+ID4gPiB0aGUgVFRNIGZpeGVzIHVwc3RyZWFtIGZvciA1LjQuCj4gPiA+Cj4gPiA+IERhdmUv
RGFuaWVsIGFueSBvYmplY3Rpb25zIHRoYXQgSSBwdXNoIHRob3NlIGRpcmVjdGx5IHRvIGRybS1t
aXNjLWZpeGVzPwo+ID4KPiA+IERvbid0IGJvdGhlciwgSSBjYW4gbWFudWFsbHkgcHJvY2VzcyBp
dCwganVzdCB0YWtlcyBhIGJpdCBtb3JlIGVmZm9ydC4KPgo+IEFjdHVhbGx5IGl0IGhhcyBhIHBy
b2JsZW0sIHlvdSBuZWVkIHRvIFNpZ25lZC1vZmYtYnkgYW55IGNvbW1pdHMgeW91IHRvdWNoLgo+
Cj4gVGhlIGZpcnN0IHBhdGNoIHNob3VsZCB0byBiZSBjb3JyZWVjdCBoYXZlIHlvdXIgU29iIGFm
dGVyIFRob21hcwo+IHJldmlldyBhcyB5b3UgdG91Y2hlZCBpdCBsYXN0LAo+IHRoZSBzZWNvbmQg
cGF0Y2ggbmVlZHMgeW91ciBTb2Igc29tZXdoZXJlIGluIGl0LgoKU28geWVhaCBtYXliZSAtbWlz
YyBiZWNhdXNlIHRoYXQgbWFrZXMgc3VyZSB0aGlzIGlzIGFsbCBjb3JyZWN0IDotKQotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgor
NDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
