Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78334FE43
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 01:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909EC898EE;
	Sun, 23 Jun 2019 23:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12142898EE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 23:32:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 115892E7;
 Mon, 24 Jun 2019 01:32:46 +0200 (CEST)
Date: Mon, 24 Jun 2019 02:30:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Subject: Re: [PATCH 0/4] drm/bridge: dw-hdmi: Add support for HDR metadata
Message-ID: <20190623233017.GI6124@pendragon.ideasonboard.com>
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <085dc3be-20e5-b2fe-4c02-bf4a4d1473da@baylibre.com>
 <20190621090125.GX12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621090125.GX12905@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561332766;
 bh=ZwQFWKzylctm08JmQty7ouBHLLmW49Cc/PVD4oe55bw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=VmVfFMY8V1HSANbboGANKSV49ISdL/edBWNI5njU/0h59r7/z/3CNcCQ/iz/Hl7VI
 P3RlGCykuwWCZ2GniYPHndCKSgxtCOAfv+/PkjuhnBTenhDBxtjdSDPCVy4+aD97VD
 f9HK/fpZfAg8LZuiDTuGovSPYWtYwvVWuxVF4QGo=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MDE6MjVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEp1biAyMCwgMjAxOSBhdCAwNDo0MDoxMlBNICswMjAwLCBOZWlsIEFy
bXN0cm9uZyB3cm90ZToKPiA+IEhpIEFuZHJ6ZWosCj4gPiAKPiA+IEdlbnRsZSBwaW5nLCBjb3Vs
ZCB5b3UgcmV2aWV3IHRoZSBkdy1oZG1pIGNoYW5nZXMgaGVyZSA/Cj4gCj4gYnR3IG5vdCBzdXJl
IHlvdSBhYnNvbHV0ZWx5IG5lZWQgcmV2aWV3IGZyb20gQW5kcnplaiwgd2UncmUgY3VycmVudGx5
IGEKPiBiaXQgdW5kZXJzdXBwbGllZCB3aXRoIGJyaWRnZSByZXZpZXdlcnMgSSB0aGluayAuLi4g
QmV0dGVyIHRvIHJhbXAgdXAKPiBtb3JlLgoKSSB0cnkgdG8gcmV2aWV3IERSTSBicmlkZ2UgcGF0
Y2hlcyB3aGVuIHBvc3NpYmxlLCBidXQgZHctaGRtaSBpcyBhCnNwZWNpYWwgY2FzZS4gSSB3YXMg
dG9sZCBieSB0aGUgc3VwcGxpZXIgb2YgYW4gU29DIGRhdGFzaGVldCB0aGF0CmNvbnRhaW5zIHRo
ZSBIRE1JIGVuY29kZXIgSVAgY29yZSBkb2N1bWVudGF0aW9uIHRoYXQgU3lub3BzeXMgcmVxdWly
ZWQKdGhlbSB0byByb3V0ZSBhbGwgY29udHJpYnV0aW9ucyBtYWRlIGJhc2VkIG9uIHRoYXQgZG9j
dW1lbnRhdGlvbiB0aHJvdWdoClN5bm9wc3lzJyBpbnRlcm5hbCBsZWdhbCByZXZpZXcgYmVmb3Jl
IHB1Ymxpc2hpbmcgdGhlbS4gSSB0aHVzIGRlY2lkZWQKdG8gbm90IGNvbnRyaWJ1dGUgdG8gdGhl
IGRyaXZlciBhbnltb3JlLCBhdCBsZWFzdCBmb3IgYXJlYXMgdGhhdCByZXF1aXJlCmFjY2VzcyB0
byBkb2N1bWVudGF0aW9uLgoKPiA+IE9uIDI2LzA1LzIwMTkgMjM6MTgsIEpvbmFzIEthcmxtYW4g
d3JvdGU6Cj4gPiA+IEFkZCBzdXBwb3J0IGZvciBIRFIgbWV0YWRhdGEgdXNpbmcgdGhlIGhkcl9v
dXRwdXRfbWV0YWRhdGEgY29ubmVjdG9yIHByb3BlcnR5LAo+ID4gPiBjb25maWd1cmUgRHluYW1p
YyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBhY2NvcmRpbmdseS4KPiA+ID4gCj4gPiA+
IEEgZHJtX2luZm9mcmFtZSBmbGFnIGlzIGFkZGVkIHRvIGR3X2hkbWlfcGxhdF9kYXRhIHRoYXQg
cGxhdGZvcm0gZHJpdmVycwo+ID4gPiBjYW4gdXNlIHRvIHNpZ25hbCB3aGVuIER5bmFtaWMgUmFu
Z2UgYW5kIE1hc3RlcmluZyBpbmZvZnJhbWVzIGlzIHN1cHBvcnRlZC4KPiA+ID4gVGhpcyBmbGFn
IGlzIG5lZWRlZCBiZWNhdXNlIEFtbG9naWMgR1hCQiBhbmQgR1hMIHJlcG9ydCBzYW1lIERXLUhE
TUkgdmVyc2lvbiwKPiA+ID4gYW5kIG9ubHkgR1hMIHN1cHBvcnQgRFJNIEluZm9GcmFtZS4KPiA+
ID4gCj4gPiA+IFRoZSBmaXJzdCBwYXRjaCBhZGQgZnVuY3Rpb25hbGl0eSB0byBjb25maWd1cmUg
RFJNIEluZm9GcmFtZSBiYXNlZCBvbiB0aGUKPiA+ID4gaGRyX291dHB1dF9tZXRhZGF0YSBjb25u
ZWN0b3IgcHJvcGVydHkuCj4gPiA+IAo+ID4gPiBUaGUgcmVtYWluaW5nIHBhdGNoZXMgc2V0cyB0
aGUgZHJtX2luZm9mcmFtZSBmbGFnIG9uIHNvbWUgU29DcyBzdXBwb3J0aW5nCj4gPiA+IER5bmFt
aWMgUmFuZ2UgYW5kIE1hc3RlcmluZyBJbmZvRnJhbWUuCj4gPiA+IAo+ID4gPiBOb3RlIHRoYXQg
dGhpcyB3YXMgYmFzZWQgb24gdG9wIG9mIGRybS1taXNjLW5leHQgYW5kIE5laWwgQXJtc3Ryb25n
J3MKPiA+ID4gImRybS9tZXNvbjogQWRkIHN1cHBvcnQgZm9yIEhETUkyLjAgWVVWNDIwIDRrNjAi
IHNlcmllcyBhdCBbMV0KPiA+ID4gCj4gPiA+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzU4NzI1LyNyZXYyCj4gPiA+IAo+ID4gPiBKb25hcyBLYXJsbWFuICg0
KToKPiA+ID4gICBkcm0vYnJpZGdlOiBkdy1oZG1pOiBBZGQgRHluYW1pYyBSYW5nZSBhbmQgTWFz
dGVyaW5nIEluZm9GcmFtZSBzdXBwb3J0Cj4gPiA+ICAgZHJtL3JvY2tjaGlwOiBFbmFibGUgRFJN
IEluZm9GcmFtZSBzdXBwb3J0IG9uIFJLMzMyOCBhbmQgUkszMzk5Cj4gPiA+ICAgZHJtL21lc29u
OiBFbmFibGUgRFJNIEluZm9GcmFtZSBzdXBwb3J0IG9uIEdYTCwgR1hNIGFuZCBHMTJBCj4gPiA+
ICAgZHJtL3N1bjRpOiBFbmFibGUgRFJNIEluZm9GcmFtZSBzdXBwb3J0IG9uIEg2Cj4gPiA+IAo+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgICB8IDEwOSAr
KysrKysrKysrKysrKysrKysrKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmggICB8ICAzNyArKysrKysrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fZHdfaGRtaS5jICAgICAgIHwgICA1ICsKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgfCAgIDIgKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX2R3X2hkbWkuYyAgICAgICB8ICAgMiArCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuOGlfZHdfaGRtaS5oICAgICAgIHwgICAxICsKPiA+ID4gIGluY2x1ZGUvZHJtL2Jy
aWRnZS9kd19oZG1pLmggICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gPiAgNyBmaWxlcyBjaGFu
Z2VkLCAxNTcgaW5zZXJ0aW9ucygrKQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
