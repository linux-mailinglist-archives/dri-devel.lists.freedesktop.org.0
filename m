Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45981B0791
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231406EBEF;
	Thu, 12 Sep 2019 04:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3766E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 19:04:50 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36AFD33A;
 Wed, 11 Sep 2019 21:04:47 +0200 (CEST)
Subject: Re: [PATCH v4 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-2-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <92e70575-85b7-6f76-2fb0-3c2ba904df1c@ideasonboard.com>
Date: Wed, 11 Sep 2019 20:04:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-2-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568228688;
 bh=u1q/I3vU1x1bIgyh6oYR6LSkB6UUhuCroJOI5wBjTsA=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Rgk/yjgGWdTGMdRwARlsFOBcsqkc+jS5c3sHZ5gfncZO29DV5bmZP3THzCv7EyEWB
 TCKFEzCLzPI0K4dQmawhPGdp9Wn6kvMMTz6Q7PGYp4y4cFsr3jpIVcnMNO8NRB+l+F
 /jeQDinQ9vRXTBoiTIqOaG5nDpSmLhv+PHsxIgCM=
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
 linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMDYvMDkvMjAxOSAxNDo1NCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEFk
ZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciB0aGUgUmVuZXNhcyBSLUNh
ciBEaXNwbGF5Cj4gVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPiAKPiBDTU0gaXMgdGhl
IGltYWdlIGVuaGFuY2VtZW50IG1vZHVsZSBhdmFpbGFibGUgb24gZWFjaCBSLUNhciBEVSB2aWRl
bwo+IGNoYW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNs
dWRlZCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0Bq
bW9uZGkub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1s
ICAgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NCBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55
YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjllNTkyMjY4
OWNkNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sCj4gQEAgLTAsMCArMSw2NCBAQAo+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwj
Cj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iwo+ICsKPiArdGl0bGU6IFJlbmVzYXMgUi1DYXIgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUgKENN
TSkKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ICsgIC0gS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5i
aW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiArICAtIEphY29wbyBNb25kaSA8amFj
b3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Kwo+ICsgIFJlbmVz
YXMgUi1DYXIgY29sb3IgbWFuYWdlbWVudCBtb2R1bGUgY29ubmVjdGVkIHRvIFItQ2FyIERVIHZp
ZGVvIGNoYW5uZWxzLgo+ICsgIEl0IHByb3ZpZGVzIGltYWdlIGVuaGFuY2VtZW50IGZ1bmN0aW9u
cyBzdWNoIGFzIDEtRCBsb29rLXVwIHRhYmxlcyAoTFVUKSwKPiArICAzLUQgbG9vay11cCB0YWJs
ZXMgKENNVSksIDFELWhpc3RvZ3JhbSBnZW5lcmF0aW9uIChIR08pLCBhbmQgY29sb3IKCnMvQ01V
L0NMVS8KCgo+ICsgIHNwYWNlIGNvbnZlcnNpb24gKENTQykuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+
ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBlbnVtOgo+ICsgICAgICAg
IC0gcmVuZXNhcyxyOGE3Nzk1LWNtbQo+ICsgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2LWNtbQo+
ICsgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2NS1jbW0KPiArICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5OTAtY21tCj4gKyAgICAgICAgLSByZW5lc2FzLHI4YTc3OTk1LWNtbQo+ICsgICAgICAtIGVu
dW06Cj4gKyAgICAgICAgLSByZW5lc2FzLHJjYXItZ2VuMy1jbW0KPiArICAgICAgICAtIHJlbmVz
YXMscmNhci1nZW4yLWNtbQo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNs
b2NrczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIHJlc2V0czoKPiArICAgIG1heEl0ZW1z
OiAxCj4gKwo+ICsgIHBvd2VyLWRvbWFpbnM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVx
dWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGNsb2Nrcwo+ICsgIC0g
cmVzZXRzCj4gKyAgLSBwb3dlci1kb21haW5zCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2Nsb2NrL3I4YTc3OTYtY3BnLW1zc3IuaD4KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9wb3dlci9yOGE3Nzk2LXN5c2MuaD4KPiArCj4gKyAgICBjbW0wOiBjbW1AZmVhNDAwMDAgewo+
ICsgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5Ni1jbW0iOwo+ICsgICAgICAg
ICByZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKPiArICAgICAgICAgcG93ZXItZG9tYWlu
cyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47Cj4gKyAgICAgICAgIGNsb2NrcyA9IDwm
Y3BnIENQR19NT0QgNzExPjsKPiArICAgICAgICAgcmVzZXRzID0gPCZjcGcgNzExPjsKPiArICAg
IH07Cj4gLS0KPiAyLjIzLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
