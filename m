Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDBF1A744B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9348A6E483;
	Tue, 14 Apr 2020 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1B989D5E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 16:35:35 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id f19so9962425iog.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8sqX19cKLRZEs4UkUnCQ2kQv2g8+YoFcNjNVuM8O2kQ=;
 b=adJ67/s1+CyO4xnndcjPcPXTmXBDUBrejTxddwjhL3Iq7kEvbV3OSjK3vT1j+Gtl+v
 Vsk3VSUZSs+PLnIhtkDJzB52BS5h1l4DZGNjFTBSd+E8+GYLFQSOo8zEbIU/vM0n1IC4
 0A9eZWXcgI44h/q4QAsNUXWGuivCedl4GwtsrVsww1SZADKQNL0pSSytEvKJvjAg+LB8
 6HGEWUNWURvrEJ6qoViiG5dx1VAU+NGQPHsmwype1UD5FIr6WHktO2sa3D63YtCrNa0+
 q23fAAt8V/IxvrtOPFG9O4xwjDsxcFodwolcP2QGleACOTSeEvwBIL2yUfo1cG1K2bNB
 72NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8sqX19cKLRZEs4UkUnCQ2kQv2g8+YoFcNjNVuM8O2kQ=;
 b=NNB9iH+V7vIq4hjuwJMEX+A0o1JP3QAnY+fvixzWb8Up1eddb+rOo8slJE8Ya+55yF
 tXqZK8guAWHKKEbuZZu1IvbKzjYK1v1S1zJtTut5E/Hz4nteGC+J2LxVoyAbGzneYBgO
 /C6iXyJBH6JncwEhkmas7D6Daz1CZCMLvj3IDiGI01u0wxJGeKQK6xp84JuhhQFaI7oB
 o+i/ImqvcCnkiuT3FbL3ME3CYaSm6W2ukqwe04OyFot9tC7bf9qazWWnhVZX6xe5O62T
 BSBbeS4TJsYfpKvg78UhNhETkfQc0ulZI3Xe6/9mLzzrTf7mmD6U00VJ6ezzaQAQTgxi
 VtWA==
X-Gm-Message-State: AGi0PuZQ0JurTv4cT7bIheRX9TfCMrQmX6UNlP+aLCGjdEsdfzE3BwDt
 osqtmbm4KDdikiDwSZoIr/wvBjLXr661bPmUplo=
X-Google-Smtp-Source: APiQypL9OM4cxON/ZjCb6YFq62C+scAbNM4g/Yf4PVR93wCxiDfal6C4bIsJsVTBJSmeKzNEqRqNc9sP4jXGN3BMiIE=
X-Received: by 2002:a02:2944:: with SMTP id p65mr16109022jap.89.1586795734257; 
 Mon, 13 Apr 2020 09:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
In-Reply-To: <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 13 Apr 2020 18:35:23 +0200
Message-ID: <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLAoKT24gTW9uLCAxMyBBcHIgMjAyMCBhdCAxNzo1NSwgU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMy8wNC8yMDIwIDE1OjMxLCBDbMOp
bWVudCBQw6lyb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBNb24sIDEzIEFwciAyMDIwIGF0
IDE2OjE4LCBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPiB3cm90ZToKPiA+
Pgo+ID4+IEhpIFN0ZXZlbiwKPiA+Pgo+ID4+IE9uIE1vbiwgMTMgQXByIDIwMjAgYXQgMTU6MTgs
IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBP
biAxMS8wNC8yMDIwIDIxOjA2LCBDbMOpbWVudCBQw6lyb24gd3JvdGU6Cj4gPj4+PiBPUFAgdGFi
bGUgY2FuIGRlZmluZWQgYm90aCBmcmVxdWVuY3kgYW5kIHZvbHRhZ2UuCj4gPj4+Pgo+ID4+Pj4g
UmVnaXN0ZXIgdGhlIG1hbGkgcmVndWxhdG9yIGlmIGl0IGV4aXN0Lgo+ID4+Pj4KPiA+Pj4+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4gPj4+
PiAtLS0KPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVx
LmMgfCAzNCArKysrKysrKysrKysrKysrKystLS0KPiA+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCAgfCAgMSArCj4gPj4+PiAgICAyIGZpbGVzIGNoYW5n
ZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gPj4+PiBpbmRleCA2MjU0
MWY0ZWRkODEuLjJkYzhlMjM1NTM1OCAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiA+Pj4+IEBAIC03OCwxMiArNzgsMjYgQEAg
aW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikK
PiA+Pj4+ICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGZkZXYtPnBkZXYtPmRldjsKPiA+
Pj4+ICAgICAgICBzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcTsKPiA+Pj4+ICAgICAgICBzdHJ1Y3Qg
dGhlcm1hbF9jb29saW5nX2RldmljZSAqY29vbGluZzsKPiA+Pj4+ICsgICAgIGNvbnN0IGNoYXIg
Km1hbGkgPSAibWFsaSI7Cj4gPj4+PiArICAgICBzdHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGUg
PSBOVUxMOwo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAgLyogUmVndWxhdG9yIGlzIG9wdGlvbmFsICov
Cj4gPj4+PiArICAgICBvcHBfdGFibGUgPSBkZXZfcG1fb3BwX3NldF9yZWd1bGF0b3JzKGRldiwg
Jm1hbGksIDEpOwo+ID4+Pgo+ID4+PiBUaGlzIGxvb2tzIGxpa2UgaXQgYXBwbGllcyBiZWZvcmUg
M2UxMzk5YmNjZjUxICgiZHJtL3BhbmZyb3N0OiBBZGQKPiA+Pj4gc3VwcG9ydCBmb3IgbXVsdGlw
bGUgcmVndWxhdG9ycyIpIHdoaWNoIGlzIGN1cnJlbnRseSBpbiBkcm0tbWlzYy1uZXh0Cj4gPj4+
IChhbmQgbGludXgtbmV4dCkuIFlvdSB3YW50IHNvbWV0aGluZyBtb3JlIGxpa2U6Cj4gPj4KPiA+
PiBUaGFua3MgZm9yIHlvdSByZXZpZXcsIGluZGVlZCBJIGRpZG4ndCBzZWUgdGhhdCBtdWx0aXBs
ZSByZWd1bGF0b3JzCj4gPj4gc3VwcG9ydCBoYXMgYmVlbiBhZGRlZC4KPiA+PiBXaWxsIHVwZGF0
ZSBpbiB2Mi4KPiA+Pgo+ID4+Pgo+ID4+PiAgICAgICBvcHBfdGFibGUgPSBkZXZfcG1fb3BwX3Nl
dF9yZWd1bGF0b3JzKGRldiwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwZmRldi0+Y29tcC0+c3VwcGx5X25hbWVzLAo+ID4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmZGV2LT5jb21wLT5udW1fc3VwcGxpZXMp
Owo+ID4+Pgo+ID4+PiBPdGhlcndpc2UgYSBwbGF0Zm9ybSB3aXRoIG11bHRpcGxlIHJlZ3VsYXRv
cnMgd29uJ3Qgd29yayBjb3JyZWN0bHkuCj4gPj4+Cj4gPj4+IEFsc28gcnVubmluZyBvbiBteSBm
aXJlZmx5IChSSzMyODgpIGJvYXJkIEkgZ2V0IHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPiA+Pj4K
PiA+Pj4gICAgICBkZWJ1Z2ZzOiBEaXJlY3RvcnkgJ2ZmYTMwMDAwLmdwdS1tYWxpJyB3aXRoIHBh
cmVudCAndmRkX2dwdScgYWxyZWFkeQo+ID4+PiBwcmVzZW50IQo+ID4+Pgo+ID4+PiBUaGlzIGlz
IGR1ZSB0byB0aGUgcmVndWxhdG9yIGRlYnVnZnMgZW50cmllcyBnZXR0aW5nIGNyZWF0ZWQgdHdp
Y2UgKG9uY2UKPiA+Pj4gaW4gcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoKSBhbmQgb25jZSBoZXJl
KS4KPiA+Pgo+ID4+IElzIGl0IGEgd2FybmluZyB0aGF0IHNob3VsZCBiZSBjb25zaWRlciBhcyBh
biBlcnJvcj8gTG9vaydzIG1vcmUgYW4gaW5mbyBubz8KPiA+PiBXaGF0IHNob3VsZCBiZSB0aGUg
Y29ycmVjdCBiZWhhdmlvciBpZiBhIGRldmljZSB3YW50IHRvIHJlZ2lzdGVyIHR3bwo+ID4+IHRp
bWVzIHRoZSBzYW1lIHJlZ3VsYXRvcj8KPiA+Cj4gPiBPciB3ZSBjYW4gY2hhbmdlIHRoZSBuYW1l
IGZyb20gdmRkX1hYWCB0byBvcHBfdmRkX1hYWCA/Cj4gPiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvb3BwL2RlYnVnZnMuYyNMNDUKPgo+IFll
cywgSSdtIG5vdCBzdXJlIHRoYXQgaXQncyBhY3R1YWxseSBhIHByb2JsZW0gaW4gcHJhY3RpY2Uu
IEFuZCBpdCBtYXkKPiB3ZWxsIGJlIGNvcnJlY3QgdG8gY2hhbmdlIHRoaXMgaW4gdGhlIGdlbmVy
aWMgY29kZSByYXRoZXIgdGhhbiB0cnkgdG8KPiB3b3JrIGFyb3VuZCBpdCBpbiBQYW5mcm9zdC4g
QnV0IHdlIHNob3VsZG4ndCBzcGFtIHRoZSB1c2VyIHdpdGggd2FybmluZ3MKPiBhcyB0aGF0IG1h
a2VzIHJlYWwgaXNzdWVzIGhhcmRlciB0byBzZWUuCj4KPiBZb3VyIHN1Z2dlc3Rpb24gdG8gY2hh
bmdlIHRoZSBuYW1lIHNlZW1zIHJlYXNvbmFibGUgdG8gbWUsIGJ1dCBJIGRvbid0Cj4gZnVsbHkg
dW5kZXJzdGFuZCB0aGUgb3BwIGNvZGUsIHNvIHdlJ2QgbmVlZCBzb21lIHJldmlldyBmcm9tIHRo
ZSBPUFAKPiBtYWludGFpbmVycy4gSG9wZWZ1bGx5IFZpcmVzaCwgTmlzaGFudGggb3IgU3RlcGhl
biBjYW4gcHJvdmlkZSBzb21lIGluc2lnaHQuCgpBZ3JlZSwgSSB3aWxsIHNlbmQgYSB2MiB3aXRo
IHRoZSByZW5hbWUgYW5kIHNlZSBpZiBPUFAgTWFpbnRhaW5lcnMgYWdyZWUuCgpSZWdhcmRzLApD
bGVtZW50Cgo+Cj4gU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
