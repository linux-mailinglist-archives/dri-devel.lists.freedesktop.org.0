Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1C10FDE4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD43C6E4BB;
	Tue,  3 Dec 2019 12:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6AF6E4C7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 12:42:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AA19128DB93;
 Tue,  3 Dec 2019 12:42:25 +0000 (GMT)
Date: Tue, 3 Dec 2019 13:42:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 19/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Message-ID: <20191203134222.4c20161f@collabora.com>
In-Reply-To: <20191202171724.GS4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-20-boris.brezillon@collabora.com>
 <20191202171724.GS4929@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

T24gTW9uLCAyIERlYyAyMDE5IDE5OjE3OjI0ICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDA1OjQ1
OjEwUE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IEFkZCBhIG5ldyBlbnRyeSBm
b3IgdGhlIFRvc2hpYmEgTFRBMDg5QUMyOTAwMCBwYW5lbC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+IC0t
LQo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+ICogTm9uZQo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+IGluZGV4IDVkNDg3Njg2ZDI1Yy4uMjdjOTJiNDRi
ZDk1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+IEBAIC0y
OTM3LDYgKzI5MzcsMzkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHRvc2hpYmFf
bHQwODlhYzI5MDAwID0gewo+ID4gIAkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNU
T1JfTFZEUywKPiA+ICB9Owo+ID4gIAo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSB0b3NoaWJhX2x0YTA4OWFjMjkwMDBfbW9kZSA9IHsKPiA+ICsJLmNsb2NrID0gNzk1
MDAsCj4gPiArCS5oZGlzcGxheSA9IDEyODAsCj4gPiArCS5oc3luY19zdGFydCA9IDEyODAgKyAx
OTIsCj4gPiArCS5oc3luY19lbmQgPSAxMjgwICsgMTkyICsgMTI4LAo+ID4gKwkuaHRvdGFsID0g
MTI4MCArIDE5MiArIDEyOCArIDY0LAo+ID4gKwkudmRpc3BsYXkgPSA3NjgsCj4gPiArCS52c3lu
Y19zdGFydCA9IDc2OCArIDIwLAo+ID4gKwkudnN5bmNfZW5kID0gNzY4ICsgMjAgKyA3LAo+ID4g
KwkudnRvdGFsID0gNzY4ICsgMjAgKyA3ICsgMywKPiA+ICsJLnZyZWZyZXNoID0gNjAsCj4gPiAr
fTsKPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgdG9zaGliYV9sdGEw
ODlhYzI5MDAwID0gewo+ID4gKwkubW9kZXMgPSAmdG9zaGliYV9sdGEwODlhYzI5MDAwX21vZGUs
Cj4gPiArCS5udW1fbW9kZXMgPSAxLAo+ID4gKwkuc2l6ZSA9IHsKPiA+ICsJCS53aWR0aCA9IDE5
NCwKPiA+ICsJCS5oZWlnaHQgPSAxMTYsCj4gPiArCX0sCj4gPiArCS8qCj4gPiArCSAqIEZJWE1F
Ogo+ID4gKwkgKiBUaGUgcGFuZWwgc3VwcG9ydHMgMiBidXMgZm9ybWF0czogamVpZGEtMjQgYW5k
IGplaWRhLTE4LiBUaGUKPiA+ICsJICogbW9kZSBpcyBzZWxlY3RlZCB0aHJvdWdoIHRoZSA4YjZi
X1NFTCBwaW4uIElmIGFueW9uZSBldmVyIG5lZWRzCj4gPiArCSAqIHN1cHBvcnQgZm9yIGplaWRh
LTE4IHdlIHNob3VsZCBwcm9iYWJseSBwYXJzZSB0aGUgJ2RhdGEtbWFwcGluZycKPiA+ICsJICog
cHJvcGVydHkuCj4gPiArCSAqIEluIHRoZSB1bmxpa2VseSBldmVudCB3aGVyZSA4YjZiX1NFTCBp
cyBjb25uZWN0ZWQgdG8gYSBHUElPLCB3ZSdkCj4gPiArCSAqIG5lZWQgYSBuZXcgaW5mcmEgdG8g
YWxsb3cgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiBhdCB0aGUgcGFuZWwgbGV2ZWwuCj4gPiArCSAq
Lwo+ID4gKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCODg4XzFYN1g0X0pFSURBLAo+
ID4gKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElY
REFUQV9EUklWRV9QT1NFREdFLAo+ID4gK307Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlIHRwa19mMDdhXzAxMDJfbW9kZSA9IHsKPiA+ICAJLmNsb2NrID0g
MzMyNjAsCj4gPiAgCS5oZGlzcGxheSA9IDgwMCwKPiA+IEBAIC0zMzkyLDYgKzM0MjUsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewo+
ID4gIAl9LCB7Cj4gPiAgCQkuY29tcGF0aWJsZSA9ICJ0b3NoaWJhLGx0MDg5YWMyOTAwMCIsCj4g
PiAgCQkuZGF0YSA9ICZ0b3NoaWJhX2x0MDg5YWMyOTAwMCwKPiA+ICsJfSwgewo+ID4gKwkJLmNv
bXBhdGlibGUgPSAidG9zaGliYSxsdGEwODlhYzI5MDAwIiwgIAo+IAo+IElzIHRoaXMgcmVhbGx5
IGRpZmZlcmVudCB0aGFuICJ0b3NoaWJhLGx0MDg5YWMyOTAwMCIgPyBCb3RoIGhhdmUgdGhlCj4g
ZXhhY3Qgc2FtZSB0aW1pbmcsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgLmJ1c19mb3JtYXQsIGFu
ZCBhY2NvcmRpbmcgdG8KPiBodHRwczovL3d3dy5hdm5ldC1pbnRlZ3JhdGVkLmV1L2ZpbGVhZG1p
bi91c2VyX3VwbG9hZC9GaWxlcy9EaXNwbGF5cy9Db2xvdXJfVEZUL0xUMDg5QUMyOTAwMC5wZGYK
PiB0aGUgInRvc2hpYmEsbHQwODlhYzI5MDAwIiBpcyBhbiBMVkRTIHBhbmVsLgoKSSB0aGluayB5
b3UgY2FuIHNlbGVjdCB0aGUgTFZEUyBmb3JtYXQgb24gdGhlIExUQSB2YXJpYW50IHdoaWNoIHlv
dQpjYW4ndCBkbyBvbiB0aGUgTFQwODlBQzI5MDAwLiBCdXQgSSBhZ3JlZSwgTFQwODlBQzI5MDAw
IGlzIGRlZmluaXRlbHkKbm90IGFuIERQSS9SR0IgcGFuZWwuIEF0IHRoZSBzYW1lIHRpbWUsIGNo
YW5naW5nIHRoZSBkZWZpbml0aW9uIGlzCmxpa2VseSB0byBicmVhayBleGlzdGluZyB1c2VycyA6
LSguCgo+IAo+ID4gKwkJLmRhdGEgPSAmdG9zaGliYV9sdGEwODlhYzI5MDAwLAo+ID4gIAl9LCB7
Cj4gPiAgCQkuY29tcGF0aWJsZSA9ICJ0cGssZjA3YS0wMTAyIiwKPiA+ICAJCS5kYXRhID0gJnRw
a19mMDdhXzAxMDIsICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
