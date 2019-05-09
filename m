Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A46185EB
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F1C899D4;
	Thu,  9 May 2019 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EF7899D5;
 Thu,  9 May 2019 02:16:18 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id D17EA3E93E;
 Thu,  9 May 2019 02:16:16 +0000 (UTC)
Date: Wed, 8 May 2019 22:16:16 -0400
From: Brian Masney <masneyb@onstation.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190509021616.GA26228@basecamp>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507063902.GA2085@tuxbook-pro>
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557368177;
 bh=tmkrzCFkH/2BB60qHGR1FIeTOycpUvg0bsZt2RenJj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vrIgonbPOsyhQUnSQavxiYuzFg2p2RJ6V0cNoEndlFVs9bQd14kx+Yn4NoHdfaTTA
 AheBy6TxmQlAuNm6VFM7ktM7MgtTlvwTKBBISivlWzlUyenbq0wClCIJf+Vfri0VX9
 /bZEl7e2Ig5Qcyqj9b8Gasm/3bC1mFgrD7lDx2CM=
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMTE6Mzk6MDJQTSAtMDcwMCwgQmpvcm4gQW5kZXJzc29u
IHdyb3RlOgo+IE9uIFN1biAwNSBNYXkgMDY6MDQgUERUIDIwMTksIEJyaWFuIE1hc25leSB3cm90
ZToKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpCj4gWy4uXQo+ID4gKwkJCQljbG9j
a3MgPSA8Jm1tY2MgTURTU19NRFBfQ0xLPiwKPiA+ICsJCQkJICAgICAgICAgPCZtbWNjIE1EU1Nf
QUhCX0NMSz4sCj4gPiArCQkJCSAgICAgICAgIDwmbW1jYyBNRFNTX0FYSV9DTEs+LAo+ID4gKwkJ
CQkgICAgICAgICA8Jm1tY2MgTURTU19CWVRFMF9DTEs+LAo+ID4gKwkJCQkgICAgICAgICA8Jm1t
Y2MgTURTU19QQ0xLMF9DTEs+LAo+ID4gKwkJCQkgICAgICAgICA8Jm1tY2MgTURTU19FU0MwX0NM
Sz4sCj4gPiArCQkJCSAgICAgICAgIDwmbW1jYyBNTVNTX01JU0NfQUhCX0NMSz47Cj4gPiArCQkJ
CWNsb2NrLW5hbWVzID0gIm1kcF9jb3JlIiwKPiA+ICsJCQkJICAgICAgICAgICAgICAiaWZhY2Ui
LAo+ID4gKwkJCQkgICAgICAgICAgICAgICJidXMiLAo+ID4gKwkJCQkgICAgICAgICAgICAgICJi
eXRlIiwKPiA+ICsJCQkJICAgICAgICAgICAgICAicGl4ZWwiLAo+ID4gKwkJCQkgICAgICAgICAg
ICAgICJjb3JlIiwKPiA+ICsJCQkJICAgICAgICAgICAgICAiY29yZV9tbXNzIjsKPiAKPiBVbmxl
c3MgSSBlbmFibGUgTU1TU19NTVNTTk9DX0FYSV9DTEsgYW5kIE1NU1NfUzBfQVhJX0NMSyBJIGdl
dCBzb21lCj4gdW5kZXJydW4gZXJyb3IgZnJvbSBEU0kuIFlvdSBkb24ndCBzZWUgYW55dGhpbmcg
bGlrZSB0aGlzPwo+IAo+IChUaGVzZSBjbG9ja3MgYXJlIGNvbnRyb2xsZWQgYnkgbXNtX2J1cyBk
b3duc3RyZWFtIGFuZCBzaG91bGQgYmUgZHJpdmVuCj4gYnkgaW50ZXJjb25uZWN0IHVwc3RyZWFt
KQo+IAo+IAo+IEFwYXJ0IGZyb20gdGhpcywgSSB0aGluayB0aGlzIGxvb2tzIG5pY2UuIEhhcHB5
IHRvIHNlZSB0aGUgcHJvZ3Jlc3MuCgpObywgSSdtIG5vdCBzZWVpbmcgYW4gdW5kZXJydW4gZXJy
b3JzIGZyb20gdGhlIERTSS4gSSB0aGluayB0aGUgY2xvY2tzCmFyZSBmaW5lIHNpbmNlIEknbSBh
YmxlIHRvIGdldCB0aGlzIHdvcmtpbmcgd2l0aCA0LjE3IHVzaW5nIHRoZXNlIHNhbWUKY2xvY2tz
LiBJIGp1c3Qgc2VudCBvdXQgdjIgYW5kIHRoZSBjb3ZlciBsZXR0ZXIgaGFzIHNvbWUgZGV0YWls
cywgYWxvbmcKd2l0aCB0aGUgZnVsbCBkbWVzZy4KCkJyaWFuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
