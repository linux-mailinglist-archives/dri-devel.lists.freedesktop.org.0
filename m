Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7BF97D81
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1898989F82;
	Wed, 21 Aug 2019 14:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBC689F82
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:46:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 997A933D;
 Wed, 21 Aug 2019 16:46:31 +0200 (CEST)
Date: Wed, 21 Aug 2019 17:46:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH RFC 07/19] drm/msm: Use drm_attach_bridge() to attach a
 bridge to an encoder
Message-ID: <20190821144625.GG5433@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-8-boris.brezillon@collabora.com>
 <20190819171939.GB27109@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819171939.GB27109@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566398791;
 bh=wi2tZgf20xokz5JzJVOq1pb+R9Z/qMoyyI/q6c50Vlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bsa0W4tYOh7HUtcN02q4mQJDbfj/ggNBMVvNpyTBkmZRZv573AHOVZFAriZ49Homl
 lUIwEzRSzo7duKxPzv/0NIQ78YoB0aIkzLAGM8/JR/zIyjaFhlIm8yPpT99URLwYqc
 O+hxnQdPu9ompfWGnw+79pUiFuLkIT6wR9txw9K4=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDc6MTk6MzlQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA1OjExOjM4UE0gKzAyMDAsIEJvcmlzIEJy
ZXppbGxvbiB3cm90ZToKPiA+IFRoaXMgaXMgcGFydCBvZiBvdXIgYXR0ZW1wdCB0byBtYWtlIHRo
ZSBicmlkZ2UgY2hhaW4gYSBkb3VibGUtbGlua2VkCj4gPiBsaXN0IGJhc2VkIG9uIHRoZSBnZW5l
cmljIGxpc3QgaGVscGVycy4gSW4gb3JkZXIgdG8gZG8gdGhhdCwgd2UgbXVzdAo+ID4gcGF0Y2gg
YWxsIGRyaXZlcnMgbWFuaXB1bGF0aW5nIHRoZSBlbmNvZGVyLT5icmlkZ2UgZmllbGQgZGlyZWN0
bHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KPiAKPiBTZWFuLCB0aGlzIHBhdGNoIGxvb2tzIGxpa2UgYSBuaWNlIGNsZWFudXAg
d2UgY2FuIGFwcGx5Cj4gb3V0c2lkZSB0aGUgc2VyaWVzLgo+IEl0IHdvdWxkIGJlIGdvb2QgdGhh
dCBkcml2ZXJzIGRvIG5vdCBwb2tlIGRpcmVjdCBpbgo+IHRoZSBlbmNvZGVyIGRhdGEgdGhhdCB0
aGlzIHBhdGNoIGZpeGVzLgoKQWdyZWVkLCBhbmQKClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMgICB8IDQgKysrLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vaGRtaS9oZG1pLmMgfCA0ICsrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZWRwL2VkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMKPiA+IGlu
ZGV4IDBmMzEyYWM1YjYyNC4uYWQ0ZTk2M2NjZDliIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9lZHAvZWRwLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2Vk
cC5jCj4gPiBAQCAtMTc4LDcgKzE3OCw5IEBAIGludCBtc21fZWRwX21vZGVzZXRfaW5pdChzdHJ1
Y3QgbXNtX2VkcCAqZWRwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gIAkJZ290byBmYWls
Owo+ID4gIAl9Cj4gPiAgCj4gPiAtCWVuY29kZXItPmJyaWRnZSA9IGVkcC0+YnJpZGdlOwo+ID4g
KwlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBlZHAtPmJyaWRnZSwgTlVMTCk7Cj4g
PiArCWlmIChyZXQpCj4gPiArCQlnb3RvIGZhaWw7Cj4gPiAgCj4gPiAgCXByaXYtPmJyaWRnZXNb
cHJpdi0+bnVtX2JyaWRnZXMrK10gICAgICAgPSBlZHAtPmJyaWRnZTsKPiA+ICAJcHJpdi0+Y29u
bmVjdG9yc1twcml2LT5udW1fY29ubmVjdG9ycysrXSA9IGVkcC0+Y29ubmVjdG9yOwo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2hkbWkvaGRtaS5jCj4gPiBpbmRleCAwZTQyMTdiZTNmMDAuLjU1YjlhOGM4MzEyYiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKPiA+IEBAIC0zMjcsNyArMzI3LDkgQEAg
aW50IG1zbV9oZG1pX21vZGVzZXRfaW5pdChzdHJ1Y3QgaGRtaSAqaGRtaSwKPiA+ICAJCWdvdG8g
ZmFpbDsKPiA+ICAJfQo+ID4gIAo+ID4gLQllbmNvZGVyLT5icmlkZ2UgPSBoZG1pLT5icmlkZ2U7
Cj4gPiArCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGhkbWktPmJyaWRnZSwgTlVM
TCk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlnb3RvIGZhaWw7Cj4gPiAgCj4gPiAgCXByaXYtPmJy
aWRnZXNbcHJpdi0+bnVtX2JyaWRnZXMrK10gICAgICAgPSBoZG1pLT5icmlkZ2U7Cj4gPiAgCXBy
aXYtPmNvbm5lY3RvcnNbcHJpdi0+bnVtX2Nvbm5lY3RvcnMrK10gPSBoZG1pLT5jb25uZWN0b3I7
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
