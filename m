Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891D10FED3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605C6E52D;
	Tue,  3 Dec 2019 13:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1967D6E52D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:28:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38E8B309;
 Tue,  3 Dec 2019 14:28:31 +0100 (CET)
Date: Tue, 3 Dec 2019 15:28:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 19/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Message-ID: <20191203132824.GR4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-20-boris.brezillon@collabora.com>
 <20191202171724.GS4929@pendragon.ideasonboard.com>
 <20191203134222.4c20161f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203134222.4c20161f@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575379711;
 bh=8ReQL5yaxvRVkElkpcgUDGi0pgGxV8hS+QRHMVLH6Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uC/uYuaBb4VtgR98sjodf1WFciD7eYe4JZAMPVy0ANqgC/z9UvE389wd6un8XEH1m
 yN68/DBzPiMGV4PtpJRTauxzI9Lt5bu/4hIhgHv6V4pf8tmF6YXdXS2DqVx5G9ruNE
 fzJBLv/nLpMYX7mzdheR7neUgFiSAkgn+KcHWjuM=
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

SGkgQm9yaXMsCgpPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwMTo0MjoyMlBNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gTW9uLCAyIERlYyAyMDE5IDE5OjE3OjI0ICswMjAwIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAwNTo0NTox
MFBNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiA+IEFkZCBhIG5ldyBlbnRyeSBm
b3IgdGhlIFRvc2hpYmEgTFRBMDg5QUMyOTAwMCBwYW5lbC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4g
PiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAqIE5vbmUKPiA+ID4gLS0tCj4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAzNiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+
ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1w
bGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gPiBpbmRleCA1
ZDQ4NzY4NmQyNWMuLjI3YzkyYjQ0YmQ5NSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYwo+ID4gPiBAQCAtMjkzNyw2ICsyOTM3LDM5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGFuZWxfZGVzYyB0b3NoaWJhX2x0MDg5YWMyOTAwMCA9IHsKPiA+ID4gIAkuY29u
bmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywKPiA+ID4gIH07Cj4gPiA+ICAK
PiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB0b3NoaWJhX2x0YTA4
OWFjMjkwMDBfbW9kZSA9IHsKPiA+ID4gKwkuY2xvY2sgPSA3OTUwMCwKPiA+ID4gKwkuaGRpc3Bs
YXkgPSAxMjgwLAo+ID4gPiArCS5oc3luY19zdGFydCA9IDEyODAgKyAxOTIsCj4gPiA+ICsJLmhz
eW5jX2VuZCA9IDEyODAgKyAxOTIgKyAxMjgsCj4gPiA+ICsJLmh0b3RhbCA9IDEyODAgKyAxOTIg
KyAxMjggKyA2NCwKPiA+ID4gKwkudmRpc3BsYXkgPSA3NjgsCj4gPiA+ICsJLnZzeW5jX3N0YXJ0
ID0gNzY4ICsgMjAsCj4gPiA+ICsJLnZzeW5jX2VuZCA9IDc2OCArIDIwICsgNywKPiA+ID4gKwku
dnRvdGFsID0gNzY4ICsgMjAgKyA3ICsgMywKPiA+ID4gKwkudnJlZnJlc2ggPSA2MCwKPiA+ID4g
K307Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyB0b3NoaWJh
X2x0YTA4OWFjMjkwMDAgPSB7Cj4gPiA+ICsJLm1vZGVzID0gJnRvc2hpYmFfbHRhMDg5YWMyOTAw
MF9tb2RlLAo+ID4gPiArCS5udW1fbW9kZXMgPSAxLAo+ID4gPiArCS5zaXplID0gewo+ID4gPiAr
CQkud2lkdGggPSAxOTQsCj4gPiA+ICsJCS5oZWlnaHQgPSAxMTYsCj4gPiA+ICsJfSwKPiA+ID4g
KwkvKgo+ID4gPiArCSAqIEZJWE1FOgo+ID4gPiArCSAqIFRoZSBwYW5lbCBzdXBwb3J0cyAyIGJ1
cyBmb3JtYXRzOiBqZWlkYS0yNCBhbmQgamVpZGEtMTguIFRoZQo+ID4gPiArCSAqIG1vZGUgaXMg
c2VsZWN0ZWQgdGhyb3VnaCB0aGUgOGI2Yl9TRUwgcGluLiBJZiBhbnlvbmUgZXZlciBuZWVkcwo+
ID4gPiArCSAqIHN1cHBvcnQgZm9yIGplaWRhLTE4IHdlIHNob3VsZCBwcm9iYWJseSBwYXJzZSB0
aGUgJ2RhdGEtbWFwcGluZycKPiA+ID4gKwkgKiBwcm9wZXJ0eS4KPiA+ID4gKwkgKiBJbiB0aGUg
dW5saWtlbHkgZXZlbnQgd2hlcmUgOGI2Yl9TRUwgaXMgY29ubmVjdGVkIHRvIGEgR1BJTywgd2Un
ZAo+ID4gPiArCSAqIG5lZWQgYSBuZXcgaW5mcmEgdG8gYWxsb3cgYnVzIGZvcm1hdCBuZWdvdGlh
dGlvbiBhdCB0aGUgcGFuZWwgbGV2ZWwuCj4gPiA+ICsJICovCj4gPiA+ICsJLmJ1c19mb3JtYXQg
PSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9KRUlEQSwKPiA+ID4gKwkuYnVzX2ZsYWdzID0g
RFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9QT1NFREdF
LAo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlIHRwa19mMDdhXzAxMDJfbW9kZSA9IHsKPiA+ID4gIAkuY2xvY2sgPSAzMzI2MCwKPiA+
ID4gIAkuaGRpc3BsYXkgPSA4MDAsCj4gPiA+IEBAIC0zMzkyLDYgKzM0MjUsOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewo+ID4gPiAg
CX0sIHsKPiA+ID4gIAkJLmNvbXBhdGlibGUgPSAidG9zaGliYSxsdDA4OWFjMjkwMDAiLAo+ID4g
PiAgCQkuZGF0YSA9ICZ0b3NoaWJhX2x0MDg5YWMyOTAwMCwKPiA+ID4gKwl9LCB7Cj4gPiA+ICsJ
CS5jb21wYXRpYmxlID0gInRvc2hpYmEsbHRhMDg5YWMyOTAwMCIsICAKPiA+IAo+ID4gSXMgdGhp
cyByZWFsbHkgZGlmZmVyZW50IHRoYW4gInRvc2hpYmEsbHQwODlhYzI5MDAwIiA/IEJvdGggaGF2
ZSB0aGUKPiA+IGV4YWN0IHNhbWUgdGltaW5nLCB0aGUgb25seSBkaWZmZXJlbmNlIGlzIC5idXNf
Zm9ybWF0LCBhbmQgYWNjb3JkaW5nIHRvCj4gPiBodHRwczovL3d3dy5hdm5ldC1pbnRlZ3JhdGVk
LmV1L2ZpbGVhZG1pbi91c2VyX3VwbG9hZC9GaWxlcy9EaXNwbGF5cy9Db2xvdXJfVEZUL0xUMDg5
QUMyOTAwMC5wZGYKPiA+IHRoZSAidG9zaGliYSxsdDA4OWFjMjkwMDAiIGlzIGFuIExWRFMgcGFu
ZWwuCj4gCj4gSSB0aGluayB5b3UgY2FuIHNlbGVjdCB0aGUgTFZEUyBmb3JtYXQgb24gdGhlIExU
QSB2YXJpYW50IHdoaWNoIHlvdQo+IGNhbid0IGRvIG9uIHRoZSBMVDA4OUFDMjkwMDAuIEJ1dCBJ
IGFncmVlLCBMVDA4OUFDMjkwMDAgaXMgZGVmaW5pdGVseQo+IG5vdCBhbiBEUEkvUkdCIHBhbmVs
LiBBdCB0aGUgc2FtZSB0aW1lLCBjaGFuZ2luZyB0aGUgZGVmaW5pdGlvbiBpcwo+IGxpa2VseSB0
byBicmVhayBleGlzdGluZyB1c2VycyA6LSguCgpPciB0aGUgaW5mb3JtYXRpb24gY291bGQganVz
dCBiZSB1bnVzZWQgOi0pCgo+ID4gPiArCQkuZGF0YSA9ICZ0b3NoaWJhX2x0YTA4OWFjMjkwMDAs
Cj4gPiA+ICAJfSwgewo+ID4gPiAgCQkuY29tcGF0aWJsZSA9ICJ0cGssZjA3YS0wMTAyIiwKPiA+
ID4gIAkJLmRhdGEgPSAmdHBrX2YwN2FfMDEwMiwgIAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
