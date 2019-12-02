Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F210EDF4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC7C6E265;
	Mon,  2 Dec 2019 17:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555A06E265
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 17:11:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF60309;
 Mon,  2 Dec 2019 18:11:47 +0100 (CET)
Date: Mon, 2 Dec 2019 19:11:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge: lvds-transmitter:
 Add new props
Message-ID: <20191202171140.GR4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-18-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575306707;
 bh=ez0gH51I6qgqPMXkNunJleNN5vTi8Yxzgob6Cd0I57o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WYDlkz0FLmNriDMNvtU7AA1Jg1mck8b1K80YvWKz+qwTOwsiDeZS2epsAZmEOe3Mp
 ycr8rihRYkRCNOQfwX6v1HMTXAvN7fUkm+DQMTshAMyG1oI6VPxfJWnWXbe8NU6JlI
 XXnWRjS8/APlLqEkvAJrU0WKD8FUXeL7+ttzv6cw=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgT2N0IDIzLCAyMDE5
IGF0IDA1OjQ1OjA4UE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBBZGQgdGhlIGRh
dGEtbWFwcGluZyBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgb3V0cHV0IGJ1cyBmb3JtYXQgYW5k
Cj4gdGhlIGJ1cy13aWR0aCBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgaW5wdXQgYnVzIGZvcm1h
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gKiBOZXcgcGF0Y2gKPiAtLS0K
PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0ICAgIHwg
MTMgKysrKysrKysrKysrKwoKUGxlYXNlIG5vdGUgdGhhdCBsdmRzLXRyYW5zbWl0dGVyIGhhcyBi
ZWVuIHJlbmFtZWQgdG8gbHZkcy1jb2RlYyBhbmQKY29udmVydGVkIHRvIFlBTUwgYXMgcGFydCBv
ZiBhIHB1bGwgcmVxdWVzdCBJJ3ZlIHJlY2VudGx5IHNlbnQgKFsxXSkuClRoaXMgcGF0Y2ggd2ls
bCB0aHVzIG5lZWQgdG8gYmUgcmViYXNlZC4KClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvMzQyNzU0LwoKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0Cj4gaW5kZXgg
NjAwOTFkYjVkZmE1Li43YjQzYjZmMjAyNzkgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0Cj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2
ZHMtdHJhbnNtaXR0ZXIudHh0Cj4gQEAgLTM2LDYgKzM2LDE5IEBAIGdyYXBoIGJpbmRpbmdzIHNw
ZWNpZmllZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0Lgo+
ICAtIFZpZGVvIHBvcnQgMCBmb3IgcGFyYWxsZWwgaW5wdXQKPiAgLSBWaWRlbyBwb3J0IDEgZm9y
IExWRFMgb3V0cHV0Cj4gIAo+ICtPcHRpb25hbCBwb3J0IDAgbm9kZSBwcm9wZXJ0aWVzOgo+ICsK
PiArLSBidXMtd2lkdGg6IG51bWJlciBvZiBkYXRhIGxpbmVzIHVzZSB0byB0cmFuc21pdCB0aGUg
UkdCIGRhdGEuCj4gKwkgICAgIENhbiBiZSAxOCBvciAyNC4KPiArCj4gK09wdGlvbmFsIHBvcnQg
MSBub2RlIHByb3BlcnRpZXM6Cj4gKwo+ICstIGRhdGEtbWFwcGluZzogc2VlIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2x2ZHMueWFtbAo+ICsJCWZvciBt
b3JlIGRldGFpbHMgYWJvdXQgdGhpcyBMVkRTIGRhdGEtbWFwcGluZyBwcm9wZXJ0eS4KPiArCQlT
dXBwb3J0ZWQgdmFsdWVzOgo+ICsJCSJqZWlkYS0xOCIKPiArCQkiamVpZGEtMjQiCj4gKwkJInZl
c2EtMjQiCj4gIAo+ICBFeGFtcGxlCj4gIC0tLS0tLS0KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
