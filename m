Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C418D7539
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFED6E7B2;
	Tue, 15 Oct 2019 11:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444FC6E7B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:39:05 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF960324;
 Tue, 15 Oct 2019 13:39:01 +0200 (CEST)
Subject: Re: [PATCH v5 1/8] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-2-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ef8e16cf-a1ef-6cf7-8735-b620a3d8f318@ideasonboard.com>
Date: Tue, 15 Oct 2019 12:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015104621.62514-2-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571139542;
 bh=yoPsqnguXofm64qXBaPQ6QLvJoVxEAIjVYEFwiQ79VI=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YM/HSvh9aRCsibtOOiXQFe+YmDHCnEcfYjBb147pA0B6/MBqt3+bkBvTZ2rkwcMWw
 N/4AFHgP2TzQ6AmWRQKo+xYHbNCiKPEtk6v+Yf5557i1KaafWEDTnySU7r0V5X3zb4
 YJ4I4UejFCBGUdxu/XaXhAQpiHb+y6rSL9SLas6c=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, airlied@linux.ie,
 mark.rutland@arm.com, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, seanpaul@chromium.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMTUvMTAvMjAxOSAxMTo0NiwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEFk
ZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciB0aGUgUmVuZXNhcyBSLUNh
ciBEaXNwbGF5Cj4gVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPiAKPiBDTU0gaXMgdGhl
IGltYWdlIGVuaGFuY2VtZW50IG1vZHVsZSBhdmFpbGFibGUgb24gZWFjaCBSLUNhciBEVSB2aWRl
bwo+IGNoYW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNs
dWRlZCkuCj4gCgpMR1RNLiBHb29kIHRvIHNlZSBob3cgd2UgZ2V0IHN0YXJ0ZWQgd2l0aCB0aGUg
bmV3IHlhbWwgYmluZGluZ3MuIEkgZ3Vlc3MKd2UndmUgZ290IHBsZW50eSBvZiBjb252ZXJzaW9u
IHdvcmsgdG8gZG8gdGhlcmUgLi4KClJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFu
LmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgoKPiBSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCAgICAgICAgIHwgNjcgKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cmVuZXNhcyxjbW0ueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hNTcwMzdiOWU5YmEKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNh
cyxjbW0ueWFtbAo+IEBAIC0wLDAgKzEsNjcgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5Cj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwjCj4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6
IFJlbmVzYXMgUi1DYXIgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUgKENNTSkKPiArCj4gK21haW50
YWluZXJzOgo+ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgo+ICsgIC0gS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNA
aWRlYXNvbmJvYXJkLmNvbT4KPiArICAtIEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1v
bmRpLm9yZz4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Kwo+ICsgIFJlbmVzYXMgUi1DYXIgY29sb3Ig
bWFuYWdlbWVudCBtb2R1bGUgY29ubmVjdGVkIHRvIFItQ2FyIERVIHZpZGVvIGNoYW5uZWxzLgo+
ICsgIEl0IHByb3ZpZGVzIGltYWdlIGVuaGFuY2VtZW50IGZ1bmN0aW9ucyBzdWNoIGFzIDEtRCBs
b29rLXVwIHRhYmxlcyAoTFVUKSwKPiArICAzLUQgbG9vay11cCB0YWJsZXMgKENMVSksIDFELWhp
c3RvZ3JhbSBnZW5lcmF0aW9uIChIR08pLCBhbmQgY29sb3IKPiArICBzcGFjZSBjb252ZXJzaW9u
IChDU0MpLgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgb25lT2Y6
Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAgLSByZW5l
c2FzLHI4YTc3OTUtY21tCj4gKyAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5Ni1jbW0KPiArICAg
ICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2NS1jbW0KPiArICAgICAgICAgIC0gcmVuZXNhcyxyOGE3
Nzk5MC1jbW0KPiArICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk5NS1jbW0KPiArICAgICAgICAt
IGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMy1jbW0KPiArICAgICAgLSBpdGVtczoKPiArICAgICAg
ICAtIGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMi1jbW0KPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgcmVz
ZXRzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgcG93ZXItZG9tYWluczoKPiArICAgIG1h
eEl0ZW1zOiAxCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+
ICsgIC0gY2xvY2tzCj4gKyAgLSByZXNldHMKPiArICAtIHBvd2VyLWRvbWFpbnMKPiArCj4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjhhNzc5Ni1jcGctbXNzci5oPgo+ICsgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3I4YTc3OTYtc3lzYy5oPgo+ICsKPiArICAgIGNt
bTA6IGNtbUBmZWE0MDAwMCB7Cj4gKyAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3
Nzk2LWNtbSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtY21t
IjsKPiArICAgICAgICAgcmVnID0gPDAgMHhmZWE0MDAwMCAwIDB4MTAwMD47Cj4gKyAgICAgICAg
IHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNfT04+Owo+ICsgICAgICAg
ICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47Cj4gKyAgICAgICAgIHJlc2V0cyA9IDwmY3Bn
IDcxMT47Cj4gKyAgICB9Owo+IC0tCj4gMi4yMy4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
