Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DB9D97B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A56E32A;
	Mon, 26 Aug 2019 22:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525096E32A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:47:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5519A4;
 Tue, 27 Aug 2019 00:47:40 +0200 (CEST)
Date: Tue, 27 Aug 2019 01:47:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 07/14] arm64: dts: renesas: r8a77995: Add CMM units
Message-ID: <20190826224734.GP5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-8-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566859661;
 bh=5FneaKNOaJ6gc1HCDlkYzgekoyT6FJ9a1i4rQZk/G64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q77l1vMnetbiVN/hqkbVVfXAD+kTMJ38mjw6gRt05MANFlmT4HlwoO7DyVGFusuOo
 xTTzyk7bHrsTC+Fnf1feUNYglDXMosa8Md/TYj9swR4FqYuGkjHQNVES+ggCwfdc/p
 GYNWhQXH1pKuSu0W++YxwhftImTiWCLQkWGobEWY=
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEF1ZyAyNSwgMjAx
OSBhdCAwMzo1MTo0N1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIEQzIGRldmljZSB0cmVlIGFuZCByZWZlcmVuY2UgdGhlbSBmcm9t
Cj4gdGhlIERpc3BsYXkgVW5pdCB0aGV5IGFyZSBjb25uZWN0ZWQgdG8uCj4gCj4gV2hpbGUgYXQg
aXQsIHJlLXNvcnQgdGhlIGR1IGRldmljZSBub2RlIHByb3BlcnRpZXMgdG8gbWF0Y2ggdGhlIG9y
ZGVyaW5nCj4gZm91bmQgaW4gb3RoZXIgU29Dcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpBcGFydCBmcm9tIHRoZSBpc3N1ZSB3
aXRoIGNvbXBhdGlibGUgc3RyaW5nIGFzIHBvaW50ZWQgb3V0IGZvciBwYXRjaAowMy8xNCwKClJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRz
aSB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4
YTc3OTk1LmR0c2kKPiBpbmRleCAxODNmZWY4NmNmN2MuLmI5MWEyMGZiYmJjNiAxMDA2NDQKPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCj4gQEAgLTk5Myw2ICs5OTMs
MjIgQEAKPiAgCQkJaW9tbXVzID0gPCZpcG1tdV92aTAgOT47Cj4gIAkJfTsKPiAgCj4gKwkJY21t
MDogY21tQGZlYTQwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbS1yOGE3Nzk5
NSI7Cj4gKwkJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8
JmNwZyBDUEdfTU9EIDcxMT47Cj4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5OTVf
UERfQUxXQVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzExPjsKPiArCQl9Owo+ICsKPiAr
CQljbW0xOiBjbW1AZmVhNTAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMsY21tLXI4
YTc3OTk1IjsKPiArCQkJcmVnID0gPDAgMHhmZWE1MDAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2Nr
cyA9IDwmY3BnIENQR19NT0QgNzEwPjsKPiArCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3
Nzk5NV9QRF9BTFdBWVNfT04+Owo+ICsJCQlyZXNldHMgPSA8JmNwZyA3MTA+Owo+ICsJCX07Cj4g
Kwo+ICAJCWR1OiBkaXNwbGF5QGZlYjAwMDAwIHsKPiAgCQkJY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LGR1LXI4YTc3OTk1IjsKPiAgCQkJcmVnID0gPDAgMHhmZWIwMDAwMCAwIDB4NDAwMDA+Owo+IEBA
IC0xMDAzLDkgKzEwMTksMTEgQEAKPiAgCQkJY2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIjsK
PiAgCQkJcmVzZXRzID0gPCZjcGcgNzI0PjsKPiAgCQkJcmVzZXQtbmFtZXMgPSAiZHUuMCI7Cj4g
LQkJCXZzcHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+Owo+ICAJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOwo+ICAKPiArCQkJdnNwcyA9IDwmdnNwZDAgMD4sIDwmdnNwZDEgMD47Cj4gKwkJCWNtbXMg
PSA8JmNtbTAgJmNtbTE+Owo+ICsKPiAgCQkJcG9ydHMgewo+ICAJCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
