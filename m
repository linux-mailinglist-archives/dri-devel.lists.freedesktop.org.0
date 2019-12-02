Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6EA10EE04
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA9A8932A;
	Mon,  2 Dec 2019 17:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7814C8826D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 17:17:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D198309;
 Mon,  2 Dec 2019 18:17:31 +0100 (CET)
Date: Mon, 2 Dec 2019 19:17:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 19/21] drm/panel: simple: Add support for Toshiba
 LTA089AC29000 panel
Message-ID: <20191202171724.GS4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-20-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-20-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575307051;
 bh=s7J25vEgjKQ7uxoOTPNljX92zYrKAqcEPb8GugLEtKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CvxYYvpQEGQ2wAg7VTDGItUSAO2+4n/Fh61GcQkofU4QzuEPrnvknCP5928eTA21E
 V9jZ8yq+3pvtijpYgIGngJQ+f3ChrCRHt+bEEeA0WeUL0UoYSfnwbdefUxaixwdhWZ
 RFwHUReYF8AJzOwASZC0NlRXUHogvlMvrCfGn3ww=
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
IGF0IDA1OjQ1OjEwUE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBBZGQgYSBuZXcg
ZW50cnkgZm9yIHRoZSBUb3NoaWJhIExUQTA4OUFDMjkwMDAgcGFuZWwuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIGluIHYzOgo+ICogTm9uZQo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYwo+IGluZGV4IDVkNDg3Njg2ZDI1Yy4uMjdjOTJiNDRiZDk1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+IEBAIC0yOTM3LDYgKzI5MzcsMzkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHRvc2hpYmFfbHQwODlhYzI5MDAwID0gewo+ICAJ
LmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0xWRFMsCj4gIH07Cj4gIAo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgdG9zaGliYV9sdGEwODlhYzI5MDAw
X21vZGUgPSB7Cj4gKwkuY2xvY2sgPSA3OTUwMCwKPiArCS5oZGlzcGxheSA9IDEyODAsCj4gKwku
aHN5bmNfc3RhcnQgPSAxMjgwICsgMTkyLAo+ICsJLmhzeW5jX2VuZCA9IDEyODAgKyAxOTIgKyAx
MjgsCj4gKwkuaHRvdGFsID0gMTI4MCArIDE5MiArIDEyOCArIDY0LAo+ICsJLnZkaXNwbGF5ID0g
NzY4LAo+ICsJLnZzeW5jX3N0YXJ0ID0gNzY4ICsgMjAsCj4gKwkudnN5bmNfZW5kID0gNzY4ICsg
MjAgKyA3LAo+ICsJLnZ0b3RhbCA9IDc2OCArIDIwICsgNyArIDMsCj4gKwkudnJlZnJlc2ggPSA2
MCwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyB0b3NoaWJhX2x0
YTA4OWFjMjkwMDAgPSB7Cj4gKwkubW9kZXMgPSAmdG9zaGliYV9sdGEwODlhYzI5MDAwX21vZGUs
Cj4gKwkubnVtX21vZGVzID0gMSwKPiArCS5zaXplID0gewo+ICsJCS53aWR0aCA9IDE5NCwKPiAr
CQkuaGVpZ2h0ID0gMTE2LAo+ICsJfSwKPiArCS8qCj4gKwkgKiBGSVhNRToKPiArCSAqIFRoZSBw
YW5lbCBzdXBwb3J0cyAyIGJ1cyBmb3JtYXRzOiBqZWlkYS0yNCBhbmQgamVpZGEtMTguIFRoZQo+
ICsJICogbW9kZSBpcyBzZWxlY3RlZCB0aHJvdWdoIHRoZSA4YjZiX1NFTCBwaW4uIElmIGFueW9u
ZSBldmVyIG5lZWRzCj4gKwkgKiBzdXBwb3J0IGZvciBqZWlkYS0xOCB3ZSBzaG91bGQgcHJvYmFi
bHkgcGFyc2UgdGhlICdkYXRhLW1hcHBpbmcnCj4gKwkgKiBwcm9wZXJ0eS4KPiArCSAqIEluIHRo
ZSB1bmxpa2VseSBldmVudCB3aGVyZSA4YjZiX1NFTCBpcyBjb25uZWN0ZWQgdG8gYSBHUElPLCB3
ZSdkCj4gKwkgKiBuZWVkIGEgbmV3IGluZnJhIHRvIGFsbG93IGJ1cyBmb3JtYXQgbmVnb3RpYXRp
b24gYXQgdGhlIHBhbmVsIGxldmVsLgo+ICsJICovCj4gKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JV
U19GTVRfUkdCODg4XzFYN1g0X0pFSURBLAo+ICsJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19E
RV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSwKPiArfTsKPiArCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB0cGtfZjA3YV8wMTAyX21vZGUg
PSB7Cj4gIAkuY2xvY2sgPSAzMzI2MCwKPiAgCS5oZGlzcGxheSA9IDgwMCwKPiBAQCAtMzM5Miw2
ICszNDI1LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGxhdGZvcm1fb2Zf
bWF0Y2hbXSA9IHsKPiAgCX0sIHsKPiAgCQkuY29tcGF0aWJsZSA9ICJ0b3NoaWJhLGx0MDg5YWMy
OTAwMCIsCj4gIAkJLmRhdGEgPSAmdG9zaGliYV9sdDA4OWFjMjkwMDAsCj4gKwl9LCB7Cj4gKwkJ
LmNvbXBhdGlibGUgPSAidG9zaGliYSxsdGEwODlhYzI5MDAwIiwKCklzIHRoaXMgcmVhbGx5IGRp
ZmZlcmVudCB0aGFuICJ0b3NoaWJhLGx0MDg5YWMyOTAwMCIgPyBCb3RoIGhhdmUgdGhlCmV4YWN0
IHNhbWUgdGltaW5nLCB0aGUgb25seSBkaWZmZXJlbmNlIGlzIC5idXNfZm9ybWF0LCBhbmQgYWNj
b3JkaW5nIHRvCmh0dHBzOi8vd3d3LmF2bmV0LWludGVncmF0ZWQuZXUvZmlsZWFkbWluL3VzZXJf
dXBsb2FkL0ZpbGVzL0Rpc3BsYXlzL0NvbG91cl9URlQvTFQwODlBQzI5MDAwLnBkZgp0aGUgInRv
c2hpYmEsbHQwODlhYzI5MDAwIiBpcyBhbiBMVkRTIHBhbmVsLgoKPiArCQkuZGF0YSA9ICZ0b3No
aWJhX2x0YTA4OWFjMjkwMDAsCj4gIAl9LCB7Cj4gIAkJLmNvbXBhdGlibGUgPSAidHBrLGYwN2Et
MDEwMiIsCj4gIAkJLmRhdGEgPSAmdHBrX2YwN2FfMDEwMiwKCi0tIApSZWdhcmRzLAoKTGF1cmVu
dCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
