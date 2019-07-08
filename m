Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2F161971
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 05:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CE889994;
	Mon,  8 Jul 2019 03:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641E889994
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 03:16:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [210.160.37.25])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F8C0CC;
 Mon,  8 Jul 2019 05:16:29 +0200 (CEST)
Date: Mon, 8 Jul 2019 06:16:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 11/19] arm64: dts: renesas: r8a77965: Add CMM units
Message-ID: <20190708031601.GB5046@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190706140746.29132-12-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562555790;
 bh=TCTDoX46oBqy8Inp3/0TzEzIxNsKLKy2zEALHLlQl/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NONJyOdjJ/Hp+cUGaja110D0tDbo+w7qTWYf6muzbpgkQxMEwDucpaR7uHh1vSJF/
 OJIhmpUaUnWwSDEfiZNhyVe2dql65FfIqQauvPGP17GNN0vihTiTRFNkaDvATB7SQF
 SCzqgRPglnrxV8yrz1kTRwPhX7pXm3mEd4lPb2f4=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTYXQsIEp1bCAwNiwgMjAx
OSBhdCAwNDowNzozOFBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gQWRkIENNTSB1bml0
cyB0byBSZW5lc2FzIFItQ2FyIE0zLU4gZGV2aWNlIHRyZWUgYW5kIHJlZmVyZW5jZSB0aGVtIGZy
b20KPiB0aGUgRGlzcGxheSBVbml0IHRoZXkgYXJlIGNvbm5lY3RlZCB0by4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgoKPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kgfCAy
NSArKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5
NjUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS5kdHNpCj4gaW5k
ZXggYjcwMWFlYjRmNDM4Li5hYWQ5ZWE2N2MzNzkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OTY1LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjhhNzc5NjUuZHRzaQo+IEBAIC0yMzA3LDYgKzIzMDcsMzAgQEAKPiAgCQkJcmVz
ZXRzID0gPCZjcGcgNjAyPjsKPiAgCQl9Owo+ICAKPiArCQljbW0wOiBjbW1AZmVhNDAwMDAgewo+
ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI7Cj4gKwkJCXJlZyA9IDww
IDB4ZmVhNDAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47
Cj4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NjVfUERfQUxXQVlTX09OPjsKPiAr
CQkJcmVzZXRzID0gPCZjcGcgNzExPjsKPiArCQl9Owo+ICsKPiArCQljbW0xOiBjbW1AZmVhNTAw
MDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI7Cj4gKwkJCXJl
ZyA9IDwwIDB4ZmVhNTAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9E
IDcxMD47Cj4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NjVfUERfQUxXQVlTX09O
PjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzEwPjsKPiArCQl9Owo+ICsKPiArCQljbW0zOiBjbW1A
ZmVhNzAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW4zLWNtbSI7Cj4g
KwkJCXJlZyA9IDwwIDB4ZmVhNzAwMDAgMCAweDEwMDA+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIDcwOD47Cj4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5NjVfUERfQUxX
QVlTX09OPjsKPiArCQkJcmVzZXRzID0gPCZjcGcgNzA4PjsKPiArCQl9Owo+ICsKPiAgCQljc2ky
MDogY3NpMkBmZWE4MDAwMCB7Cj4gIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2NS1j
c2kyIjsKPiAgCQkJcmVnID0gPDAgMHhmZWE4MDAwMCAwIDB4MTAwMDA+Owo+IEBAIC0yNDU3LDYg
KzI0ODEsNyBAQAo+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAKPiAgCQkJdnNwcyA9IDwm
dnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNwZDAgMT47Cj4gKwkJCWNtbXMgPSA8JmNtbTAgJmNt
bTEgJmNtbTM+Owo+ICAKPiAgCQkJcG9ydHMgewo+ICAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
