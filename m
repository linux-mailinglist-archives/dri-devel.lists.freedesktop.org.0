Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE4315E12
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E799F89DA5;
	Tue,  7 May 2019 07:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FAF896E9;
 Mon,  6 May 2019 08:46:49 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id ADD7F3E941;
 Mon,  6 May 2019 08:46:48 +0000 (UTC)
Date: Mon, 6 May 2019 04:46:48 -0400
From: Brian Masney <masneyb@onstation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC 0/6] ARM: qcom: initial Nexus 5 display support
Message-ID: <20190506084648.GA270@basecamp>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <CACRpkda=JTfKC4z=1Gmt1BE5adwd8XGZ4ERTgapWX_BN9TFESw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda=JTfKC4z=1Gmt1BE5adwd8XGZ4ERTgapWX_BN9TFESw@mail.gmail.com>
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557132409;
 bh=xI56e4hzg4jsRuD6zEwMlE664g9qNhVDQ6VNP1rTbBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MbrvW8flOyL19oI0XQSJXHxCE4aknvmEvXhDIrAnh2i+7wuAD1LOHt7sh+PzCSKsZ
 6w54mSq6UnjAv9pT7IriI5tFztg2ea6akIdw++qmqmwJAItsPw4o6CkTgYry+K6eqJ
 bI0/YPJ1okYTxaDvcGPjj3HqDlx8j3eEeBrTA90U=
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDg6NDI6MzZBTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBTdW4sIE1heSA1LCAyMDE5IGF0IDM6MDQgUE0gQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+IAo+ID4gbWRwNV9nZXRfc2Nhbm91dHBvcygpIGFu
ZCBtZHA1X2dldF92YmxhbmtfY291bnRlcigpIGJvdGggcmV0dXJuIDAsIHdoaWNoCj4gPiBpcyBj
YXVzaW5nIHRoaXMgc3RhY2sgdHJhY2UgdG8gYmUgZHVtcGVkIGludG8gdGhlIHN5c3RlbSBsb2cg
c2V2ZXJhbAo+ID4gdGltZXM6Cj4gPgo+ID4gICAgIFdBUk5JTkc6IENQVTogMCBQSUQ6IDUgYXQg
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmM6MTQzMCBkcm1fYXRvbWljX2hlbHBl
cl93YWl0X2Zvcl92YmxhbmtzLnBhcnQuMSsweDI4OC8weDI5MAo+ID4gICAgIFtDUlRDOjQ5OmNy
dGMtMF0gdmJsYW5rIHdhaXQgdGltZWQgb3V0Cj4gPiAgICAgTW9kdWxlcyBsaW5rZWQgaW46Cj4g
PiAgICAgQ1BVOiAwIFBJRDogNSBDb21tOiBrd29ya2VyLzA6MCBOb3QgdGFpbnRlZCA1LjEuMC1y
YzYtbmV4dC0yMDE5MDQyNi0wMDAwNi1nMzVjMGQzMmE5NmUxLWRpcnR5ICMxOTEKPiA+ICAgICBI
YXJkd2FyZSBuYW1lOiBHZW5lcmljIERUIGJhc2VkIHN5c3RlbQo+ID4gICAgIFdvcmtxdWV1ZTog
ZXZlbnRzIGRlZmVycmVkX3Byb2JlX3dvcmtfZnVuYwo+ID4gICAgIFs8YzAzMTIyOWM+XSAodW53
aW5kX2JhY2t0cmFjZSkgZnJvbSBbPGMwMzBkNWFjPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQo+
ID4gICAgIFs8YzAzMGQ1YWM+XSAoc2hvd19zdGFjaykgZnJvbSBbPGMwYWMxMzRjPl0gKGR1bXBf
c3RhY2srMHg3OC8weDhjKQo+ID4gICAgIFs8YzBhYzEzNGM+XSAoZHVtcF9zdGFjaykgZnJvbSBb
PGMwMzIxNjYwPl0gKF9fd2Fybi5wYXJ0LjMrMHhiOC8weGQ0KQo+ID4gICAgIFs8YzAzMjE2NjA+
XSAoX193YXJuLnBhcnQuMykgZnJvbSBbPGMwMzIxNmUwPl0gKHdhcm5fc2xvd3BhdGhfZm10KzB4
NjQvMHg4OCkKPiA+ICAgICBbPGMwMzIxNmUwPl0gKHdhcm5fc2xvd3BhdGhfZm10KSBmcm9tIFs8
YzA3NjFhMGM+XSAoZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcy5wYXJ0LjErMHgy
ODgvMHgyOTApCj4gPiAgICAgWzxjMDc2MWEwYz5dIChkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zv
cl92YmxhbmtzLnBhcnQuMSkgZnJvbSBbPGMwN2IwYTk4Pl0gKG1kcDVfY29tcGxldGVfY29tbWl0
KzB4MTQvMHg0MCkKPiA+ICAgICBbPGMwN2IwYTk4Pl0gKG1kcDVfY29tcGxldGVfY29tbWl0KSBm
cm9tIFs8YzA3ZGRiODA+XSAobXNtX2F0b21pY19jb21taXRfdGFpbCsweGE4LzB4MTQwKQo+ID4g
ICAgIFs8YzA3ZGRiODA+XSAobXNtX2F0b21pY19jb21taXRfdGFpbCkgZnJvbSBbPGMwNzYzMzA0
Pl0gKGNvbW1pdF90YWlsKzB4NDAvMHg2YykKPiA+ICAgICBbPGMwNzYzM2Y0Pl0gKGRybV9hdG9t
aWNfaGVscGVyX2NvbW1pdCkgZnJvbSBbPGMwNzY2N2YwPl0gKHJlc3RvcmVfZmJkZXZfbW9kZV9h
dG9taWMrMHgxNjgvMHgxZDQpCj4gCj4gSSByZWNlbnRseSBtZXJnZWQgdGhpcyBwYXRjaDoKPiBo
dHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPWIzMTk4
YzM4ZjAyZDU0YTVlOTY0MjU4YTIxODBkNTAyYWJlNmVhZjAKPiAKPiBJIG5vdGljZWQgdGhhdCBE
U0kgaXMgc29tZXRpbWVzIHdheSBzbG93ZXIgdGhhbiBhIG1vbml0b3IsIGV2ZW4gIGluIEhTIG1v
ZGUuCj4gT24gdGhlIE1DREUgdGhpcyBoYXBwZW5lZCBvbiB0aGUgZmlyc3Qgc2NyZWVuIHVwZGF0
ZSwgd2hpY2ggd2FzIHNsb3dlcgo+IHRoYW4gNTBtcy4KPiAKPiBDaGVjayBpZiB5b3VyIHZibGFu
a3MgYXJlIHNpbXBseSBzbG93LCB0cnkgYnVtcGluZyB0aGlzIHRpbWVvdXQgZXZlbiBoaWdoZXIs
Cj4gSSBzcGVudCB3ZWVrcyBmaW5kaW5nIHRoaXMgaXNzdWUgd2hpY2ggYm9pbHMgZG93biB0byBh
biBhc3N1bXB0aW9uIHRoYXQKPiB0aGUgdmJsYW5rIHdpbGwgYmUgZmlyZWQgZnJvbSBzb21ldGhp
bmcgbGlrZSBhIG1vbml0b3IgYXQgNTAgb3IgNjAgSFoKPiB+MjAgbXMgc28gNTBtcyBzZWVtZWQg
bGlrZSBhIGdvb2QgdGltZW91dCBhdCB0aGUgdGltZS4KPiAKPiBPbiBhIERTSSBkaXNwbGF5IHRo
aXMgaXMgZHViaW91cywgYWJzb2x1dGVseSBpbiBMUCBtb2RlLCBhbmQgZXZlbgo+IGluIEhTIG1v
ZGUuCgpUaGF0IGRpZCBub3QgZml4IHRoZSBpc3N1ZSBmb3IgbWUsIGFuZCBJIHdlbnQgYXMgaGln
aCBhcyA1IHNlY29uZHMuClRoYXQncyBnb29kIHRvIGtub3cgdGhvdWdoIHNpbmNlIEkgd291bGQg
aGF2ZSBsaWtlbHkgcmFuIGludG8gdGhhdCBzYW1lCmlzc3VlIGRvd24gdGhlIGxpbmUuCgpCcmlh
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
