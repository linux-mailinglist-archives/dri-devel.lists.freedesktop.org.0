Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4130BD57E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 01:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6A16EB0C;
	Tue, 24 Sep 2019 23:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEECC6EB0B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 23:30:31 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b24so2081500wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QHTP39nFweqt1m16Sib1EgwmmmjEwtT4qvFpNwr91Qk=;
 b=F0zgdnMtr7XBSW8Myz21THnSbzXT2k5lvI0i17zmDOH/sqLsHGcwBLw9SpKGC4o+1r
 TeO5XJMxotmypHr7fCuo50IusrpvSUM4U4HbusYrefu3dfsTUy93XXD4dcc88u1Hj1Cj
 WPfHgusibjbnsypo/DWeNKVwENIFWiPK2yR0NPcOvOVJg4Ws0WP5AX+Ab4N3/eCw0VQ1
 OtSI8d/iVE90Bo1hkZ3bsaxrddx2rrU/MPqSpgAP1dThKiqinoQuCYQSZg3c/BsWg1UY
 EUPYVXqy/QuEq+fCTUWjtwugtJbiDzOvGmZgbPvh9kX4OVUVW9cCeWUyq2YhmyC0J6I4
 9dRQ==
X-Gm-Message-State: APjAAAV4Gs9nebGW7mDtHrwNLoCGNRHFRb+KVtqxbSJEmJ/rT1+QftbG
 ntfLb2YnG8kl+YZyfvaeOtb2HvSjHxhV2+8OHV/9gw==
X-Google-Smtp-Source: APXvYqw7NBelUMhZZRzIPJCPw29a7H9gbddpg4JIm+bAj/LHy/g6u8Xg+trFRJIWOrxipQkaHkcIyORoqGP0v3+f6DM=
X-Received: by 2002:a1c:c189:: with SMTP id r131mr3368843wmf.153.1569367830395; 
 Tue, 24 Sep 2019 16:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 24 Sep 2019 16:30:18 -0700
Message-ID: <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QHTP39nFweqt1m16Sib1EgwmmmjEwtT4qvFpNwr91Qk=;
 b=HX8vHE8fBjrUs/CVGfNAJGsLjN+de7NZnyh2Zgq1EDIa0m15x/dYo6+iSKBOJ2FhvE
 YCSNgkRSx8sPkaZnYCgVpBOrDYMd3j63a1T7WyM77OKvz6Lk9qph9YTwA8QV6Pl7he9I
 mqnRO2wVbRd3iLXyITvkIIfUjV13DgnYwq3Y38KzTKkJicDcwarqjtZKCQaU1pgOXtHM
 LhFYO6iHYxPKfk4edVLmaE9EIK/irVLld4YLa6I/aJO1il1bEN9K7niBq7eokz30c9c2
 Ndq+9EKm8oDqOqp/04otT7Zs6R5+9XZX6bg4WujIY8M4Z72aSbxfTMe/9mTHyWwrfsbk
 jIkg==
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMzoyNCBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDQ6MjkgUE0gSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoaXMgcGF0Y2ggcmVt
b3ZlcyB0aGUgZGVwcmVjYXRlZCBBbmRyb2lkLm1rIGZpbGVzIGFuZCByZXBsYWNlcwo+ID4gdGhl
bSB3aXRoIEFuZHJvaWQuYnAgZmlsZXMsIHVzZWQgaW4gQW5kcm9pZCBOIGFuZCBuZXdlcgo+ID4g
cmVsZWFzZXMuCj4gPgo+ID4gVGhpcyBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gYnVpbGQgbGliZHJt
L21hc3RlciBhZ2FpbnN0IHJlY2VudAo+ID4gQW5kcm9pZCByZWxlYXNlcyBhbmQgQU9TUC9tYXN0
ZXIsIGFzIHNvbWUgb2YgdGhlIFRyZWJsZSBidWlsZAo+ID4gb3B0aW9ucyByZXF1aXJlZCBzaW5j
ZSBBbmRyb2lkIE8gY2Fubm90IGJlIGV4cHJlc3NlZCBpbgo+ID4gQW5kb3JpZC5tayBmaWxlcy4K
PiA+Cj4gPiBQYXRjaCBvcmlnaW5hbGx5IGJ5IERhbiBXaWxsZW1zZW4gd2l0aCBmaXhlcyBmb2xk
ZWQgaW4gYnk6Cj4gPiAgSmVycnkgWmhhbmcsIEVsaW90dCBIdWdoZXMgYW5kIG15c2VsZi4KPiA+
Cj4gPiBXaGlsZSB0aGlzIGRvZXMgY29zdCBjb21wdGFiaWxpdHkgd2l0aCBvbGRlciBwcmUgQW5k
cm9pZCBOCj4gPiByZWxlYXNlcywgSSdkIGNvbnRlbmQgdGhhdCBiZWluZyBhYmxlIHRvIGJ1aWxk
L3Rlc3QKPiA+IGxpYmRybS9tYXN0ZXIgYWdhaW5zdCBBT1NQL21hc3RlciBhbmQgcmVjZW50IHJl
bGVhc2VzIGlzIG1vcmUKPiA+IHZhbHVhYmxlIHRoZW4gc29sZXkgbWFpbnRhaW5pbmcgc3VwcG9y
dCBmb3Igb2xkIGFuZCB1bnN1cHBvcnRlZAo+ID4gQW5kcm9pZCByZWxlYXNlcy4KPgo+IFRyeWlu
ZyB0byBtYWludGFpbiBzb21ldGhpbmcgdGhhdCB3b3JrcyBhY3Jvc3MgbW9yZSB0aGFuIDMgcmVs
ZWFzZXMgb3IKPiBzbyBpcyBwYWluZnVsLiBJIGRvbid0IHRoaW5rIGFuZHJvaWQteDg2IGZvbGtz
IGhhdmUgdGhlIGJhbmR3aWR0aCB0bwo+IG1haW50YWluIHRoaW5ncyBvbGRlciB0aGFuIHRoYXQg
KmFuZCogdXBkYXRlIHRvIG5ld2VyIHZlcnNpb25zLiBTbyBJCj4gdGhpbmsgb25seSBzdXBwb3J0
aW5nIHRoZSBuIGxhdGVzdCByZWxlYXNlcyBpcyBnb29kLgo+Cj4gQXJlIC5icCBmaWxlcyBmb3Ig
bWFzdGVyL1EgY29tcGF0aWJsZSBiYWNrIHRvIE4gKG9yIE8pPyBJSVJDLCBhdCBsZWFzdAo+IGZv
ciB0aGUgZmlyc3QgY291cGxlIG9mIHJlbGVhc2VzIHdpdGggLmJwIGZpbGVzLCB0aGV5IHNlZW1l
ZCB0byBoYXZlCj4gaW5jb21wYXRpYmxlIGNoYW5nZXMuCgpJIHRoaW5rIHRoZXJlIGhhdmUgcG9z
c2libHkgYmVlbiBzb21lIGluY29tcGF0aWJsZSBjaGFuZ2VzLCBhcyBJIGtub3cKZWFybHkgdy8g
YnAgZmlsZXMgdGhpbmdzIHdlcmUgbW9yZSBpbiBmbHV4LiBUaGF0IHNhaWQsIHRoZXJlIGhhdmVu
J3QKYmVlbiBtYW55IGNoYW5nZXMgdG8gdGhlIGxpYmRybSBicCBmaWxlcyBzaW5jZSB0aGUgY29u
dmVyc2lvbiB3YXMKZmlyc3QgZG9uZSBpbiAyMDE3IChzbyBBbmRyb2lkIE8pLiBJJ2xsIGNoZWNr
b3V0IE4gYW5kIHZhbGlkYXRlIHNvIEkKY2FuIHByb3ZpZGUgYSBtb3JlIGNvbmNyZXRlIGFzc3Vy
YW5jZS4KCnRoYW5rcwotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
