Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC521634FF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 22:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992BD6EA95;
	Tue, 18 Feb 2020 21:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4186E417
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TPmsarhSMXCj8/dzvasFTlIDQfD072W6X2xvTvgEZbw=; b=a3IZXPKHmQ8XgvNMghLQCjcNMS
 cnBIQFzY9FK45CyIi3otsUEqT99xV+SHEPdt/Qcvi5F77KjXpp1+Hl+MTUV/SNL64diiyGjTOAiGG
 NcY7ddQ4N8XpXyzRc6B7eQgDtHWCekIk6MlTf77I5hYZZ7Ju6+KpnberyslQLk1Ey3FlDJ/3BYfzQ
 9Gf7rC0CmiET2txHVZ2OD+6tSUF3zlvP+K+meGc6imZQnEDOeVMjQiwCNbl4UxemScIUUHjIZzP6q
 jiyUCTB5tj9PLXJGQVq4HkBYEWVVAp+z4lUR/tmXRu/VJyOtWe9hZSK+R3GavH4NXZHFXU86etkw1
 N2N2tZZA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53174
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j4ASP-0006RE-7F; Tue, 18 Feb 2020 22:31:05 +0100
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <CAHp75Vc6=V=cXM0mmh88V6XLmJT6kFnJCS547vgxX0zBG+cTZQ@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <cda21859-0bd2-2a7f-c74a-360ef7aabadb@tronnes.org>
Date: Tue, 18 Feb 2020 22:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc6=V=cXM0mmh88V6XLmJT6kFnJCS547vgxX0zBG+cTZQ@mail.gmail.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, USB <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTguMDIuMjAyMCAyMS41Nywgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+IE9uIFN1biwg
RmViIDE2LCAyMDIwIGF0IDc6MzAgUE0gTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gQSB3aGlsZSBiYWNrIEkgaGFkIHRoZSBpZGVhIHRv
IHR1cm4gYSBSYXNwYmVycnkgUGkgWmVybyBpbnRvIGEgJDUKPj4gVVNCIHRvIEhETUkvU0RUVi9E
U0kvRFBJIGRpc3BsYXkgYWRhcHRlci4KPj4KPj4gVGhpbmtpbmcgYWJvdXQgaG93IHRvIHJlcHJl
c2VudCB0aGUgZGlzcGxheSB0byB0aGUgZHJpdmVyIEkgcmVhbGlzZWQKPj4gdGhhdCBoYXJkd2Fy
ZSB1c2UgcmVnaXN0ZXJzIGFzIEFQSS4gQW5kIExpbnV4IGRvZXMgaGF2ZSBhIGdlbmVyaWMKPj4g
cmVnaXN0ZXIgYWJzdHJhY3Rpb246IHJlZ21hcC4gRnVydGhlcm1vcmUgdGhpcyBtZWFucyB0aGF0
IGlmIEkgY2FuIGRvIGEKPj4gcmVnbWFwIG92ZXIgVVNCIGltcGxlbWVudGF0aW9uLCBpdCB3aWxs
IGJlIGVhc3kgdG8gZG8gb3RoZXIgZnVuY3Rpb25zCj4+IGxpa2UgZ3BpbywgYWRjIGFuZCBvdGhl
cnMuIEFmdGVyIGEgZmV3IGl0ZXJhdGlvbnMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQKPj4gdGhlIFVT
QiBzdWJzeXN0ZW0gYW5kIHNhdGlzZnlpbmcgZHJpdmVyIHJlcXVpcmVtZW50cywgSSBub3cgaGF2
ZQo+PiBzb21ldGhpbmcgdGhhdCBsb29rcyBwcm9taXNpbmcuCj4+Cj4+IEknbSBzZW5kaW5nIG91
dCBhbiBlYXJseSB2ZXJzaW9uIGhvcGluZyB0byBnZXQgZmVlZGJhY2sgZXNwZWNpYWxseSBvbgo+
PiB0aGUgY29yZSBwYXJ0cyB0aGF0IGhhbmRsZXMgcmVnbWFwIGFuZCBpbnRlcnJ1cHRzLgo+Pgo+
PiBPdmVydmlldzoKPj4KPj4gICAgICAgICAgIFVTQiBIb3N0ICAgICAgICAgIDogICAgICAgICBV
U0IgRGV2aWNlCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6Cj4+ICAgICAgICAgICAg
IC0tLS0tLS0tLS0tLS0tICA6ICAtLS0tLS0tLS0tLS0tLS0tLS0KPj4gLS0tLS0tLS0tLSAgfCBt
ZmQ6IG11ZCAgIHwgIDogIHwgZl9tdWQgICAgICAgICAgfCAgLS0tLS0tLS0tLQo+PiB8IERyaXZl
ciB8ICAtLS0tLS0tLS0tLS0tLSAgOiAgfCAgICAgICAgICAgICAgICB8ICB8IERyaXZlciB8Cj4+
IC0tLS0tLS0tLS0gIHwgcmVnbWFwLXVzYiB8ICA6ICB8IChtdWRfcmVnbWFwKSAgIHwgIC0tLS0t
LS0tLS0KPj4gICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0gIDogIC0tLS0tLS0tLS0tLS0tLS0t
LQo+Pgo+Pgo+PiBJJ3ZlIGF0dGFjaGVkIDIgZHJpdmVyczoKPj4gLSBncGlvL3BpbmN0cmw6IGlz
IG1vcmUgb3IgbGVzcyBmaW5pc2hlZAo+PiAtIGRpc3BsYXk6IG5lZWRzIGEgbG90IG1vcmUgd29y
awo+IAo+IENhbiByZWdtYXAtdXNiIGJlIHVzZWQgZm9yIGRyaXZlcnMvbWZkL2RsbjIuYyBmb3Ig
ZXhhbXBsZT8KPiAKCk5vLCBhcHBhcmVudGx5IGRsbi0yIHVzZXMgY3VzdG9tIHByb3RvY29sIHN0
cnVjdHMgZm9yIGVhY2ggZnVuY3Rpb24gd2l0aAphIGNvbW1vbiBoZWFkZXIuIHJlZ21hcC11c2Ig
aXMgYSByZWdpc3RlciBhYnN0cmFjdGlvbiB3aXRoIHRoZSBhYmlsaXR5CnRvIGJ1bGsgcmVhZC93
cml0ZSBtdWx0aXBsZSByZWdpc3RlcnMgaW4gb25lIHRyYW5zZmVyLgoKSSBzZWUgdGhhdCBkbG4t
MiBkb2VzIGEgbG90IG9mIHdoYXQgSSdtIGFpbWluZyBmb3IgZXhjZXB0IHRoYXQgaXQKZG9lc24n
dCBoYXZlIHRoZSBkaXNwbGF5IHBhcnQuCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
