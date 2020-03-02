Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3931756C9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903D66E170;
	Mon,  2 Mar 2020 09:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1801C6E170
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:18:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0614654A;
 Mon,  2 Mar 2020 10:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583140724;
 bh=bWSWnRlEnxgw/Jwkv+DDpLesF0UhMGYrILmgH0Qtapw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zt/3yA7PpTzJsecJt56a6UHocBjCjfwDIIKR7c4qy2MfGDvzcZF/wB9G70unntQtS
 /KwBMmScCjYDFPEGhg2ub76ouw7LxQKPHZgdFroo6oYpsj1WcpDhP6iet5OkrVa8cY
 aaWRFDWDjOyXhQkzHqbeWdgP2xatlV4C0knL0oiQ=
Date: Mon, 2 Mar 2020 11:18:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector
 property
Message-ID: <20200302091818.GC11960@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-3-narmstrong@baylibre.com>
 <11463907.O9o76ZdvQC@jernej-laptop>
 <09d315b8-22f3-a25a-1aea-9c5d50c634d6@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09d315b8-22f3-a25a-1aea-9c5d50c634d6@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, boris.brezillon@collabora.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCBhbmQgSm9uYXMsCgooQ0MnaW5nIERhbmllbCBmb3IgYSBmcmFtZXdvcmsgcXVlc3Rp
b24pCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDA5
OjUwOjE4QU0gKzAxMDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9uIDE3LzAyLzIwMjAgMDc6
MzgsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPiA+IERuZSDEjWV0cnRlaywgMDYuIGZlYnJ1YXIg
MjAyMCBvYiAyMDoxODoyNSBDRVQgamUgTmVpbCBBcm1zdHJvbmcgbmFwaXNhbChhKToKPiA+PiBG
cm9tOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cj4gPj4KPiA+PiBBZGQgdGhlIG1h
eF9icGMgcHJvcGVydHkgdG8gdGhlIGR3LWhkbWkgY29ubmVjdG9yIHRvIHByZXBhcmUgc3VwcG9y
dAo+ID4+IGZvciAxMCwgMTIgJiAxNmJpdCBvdXRwdXQgc3VwcG9ydC4KPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gPj4gLS0tCj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNCArKysrCj4g
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4+IGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgaW5kZXgKPiA+PiA5ZTA5MjdkMjJk
YjYuLjA1MTAwMWY3N2RkNCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lu
b3BzeXMvZHctaGRtaS5jCj4gPj4gQEAgLTI0MDYsNiArMjQwNiwxMCBAQCBzdGF0aWMgaW50IGR3
X2hkbWlfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZQo+ID4+ICpicmlkZ2UpIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSwKPiA+PiAgCQkJCSAgICBoZG1pLT5kZGMpOwo+ID4+Cj4gPj4g
Kwlkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoY29ubmVjdG9yKTsKPiA+IAo+ID4g
V2h5IGlzIHRoaXMgcmVzZXQgbmVlZGVkPwo+IAo+IEkgYXNzdW1lIGl0J3MgdG8gYWxsb2NhdGUg
YSBuZXcgY29ubmVjdG9yIHN0YXRlIHRvIGF0dGFjaCBhIHRoZSBicGMgcHJvcGVyeS4KPiAKPiBC
dXQgaW5kZWVkLCB0aGlzIGhlbHBlciBpcyBuZXZlciB1c2VkIGhlcmUsIGJ1dCBvbmx5IGFzIGNh
bGxiYWNrIHRvIHRoZSBkcm1fY29ubmVjdG9yX2Z1bmNzLT5yZXNldC4KPiAKPiBCdXQsIGFtZGdw
dSBjYWxscyA6Cj4gCS8qCj4gCSAqIFNvbWUgb2YgdGhlIHByb3BlcnRpZXMgYmVsb3cgcmVxdWly
ZSBhY2Nlc3MgdG8gc3RhdGUsIGxpa2UgYnBjLgo+IAkgKiBBbGxvY2F0ZSBzb21lIGRlZmF1bHQg
aW5pdGlhbCBjb25uZWN0b3Igc3RhdGUgd2l0aCBvdXIgcmVzZXQgaGVscGVyLgo+IAkgKi8KPiAJ
aWYgKGFjb25uZWN0b3ItPmJhc2UuZnVuY3MtPnJlc2V0KQo+IAkJYWNvbm5lY3Rvci0+YmFzZS5m
dW5jcy0+cmVzZXQoJmFjb25uZWN0b3ItPmJhc2UpOwo+IAo+IHdoaWNoIGlzIHRoZSBzYW1lLgoK
QSBjb21tZW50IHdvdWxkIGJlIHVzZWZ1bDoKCgkvKgoJICogZHJtX2Nvbm5lY3Rvcl9hdHRhY2hf
bWF4X2JwY19wcm9wZXJ0eSgpIHJlcXVpcmVzIHRoZQoJICogY29ubmVjdG9yIHRvIGhhdmUgYSBz
dGF0ZS4KCSAqLwoJZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KGNvbm5lY3Rvcik7
CgoJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfbWF4X2JwY19wcm9wZXJ0eShjb25uZWN0b3IsIDgsIDE2
KTsKCkkgZG9uJ3QgbGlrZSB0aGlzIG11Y2ggdGhvdWdoLCBpdCBmZWVscyBsaWtlIHRoZSBpbml0
aWFsIHJlc2V0IHBlcmZvcm1lZApieSBkcm1fbW9kZV9jb25maWdfcmVzZXQoKSBzaG91bGQgc2V0
IGRlZmF1bHQgdmFsdWVzIGZvciBhbGwgc3RhdGUKbWVtYmVycyB0aGF0IGFyZSByZWxhdGVkIHRv
IHByb3BlcnRpZXMuIERhbmllbCwgd2hhdCdzIHRoZSByYXRpb25hbGUKYmVoaW5kIHRoZSBjdXJy
ZW50IGltcGxlbWVudGF0aW9uID8KClRoaXMgaXMgYSBEUk0gY29yZSBpc3N1ZSB0aGF0IHNob3Vs
ZG4ndCBibG9jayB0aGlzIHBhdGNoIHRob3VnaCwgc28KClJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+ID4+ICsKPiA+PiAr
CWRybV9jb25uZWN0b3JfYXR0YWNoX21heF9icGNfcHJvcGVydHkoY29ubmVjdG9yLCA4LCAxNik7
Cj4gPj4gKwo+ID4+ICAJaWYgKGhkbWktPnZlcnNpb24gPj0gMHgyMDBhICYmIGhkbWktPnBsYXRf
ZGF0YS0+dXNlX2RybV9pbmZvZnJhbWUpCj4gPj4gIAkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVy
dHkoJmNvbm5lY3Rvci0+YmFzZSwKPiA+PiAgCQkJY29ubmVjdG9yLT5kZXYtCj4gPj4gbW9kZV9j
b25maWcuaGRyX291dHB1dF9tZXRhZGF0YV9wcm9wZXJ0eSwgMCk7CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
