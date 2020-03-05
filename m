Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D072F17B7DF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B1A6EC6F;
	Fri,  6 Mar 2020 08:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs63.siol.net [185.57.226.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C7F6E347
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 16:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 1829A523028;
 Thu,  5 Mar 2020 17:53:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id IahrWYT3sMxp; Thu,  5 Mar 2020 17:53:25 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 9E9BC5230A3;
 Thu,  5 Mar 2020 17:53:25 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 9DDB9522F5B;
 Thu,  5 Mar 2020 17:53:23 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: dw-hdmi: rework csc related functions
Date: Thu, 05 Mar 2020 17:53:22 +0100
Message-ID: <2518078.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20200304235149.GH28814@pendragon.ideasonboard.com>
References: <20200304232512.51616-1-jernej.skrabec@siol.net>
 <20200304232512.51616-5-jernej.skrabec@siol.net>
 <20200304235149.GH28814@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCkRuZSDEjWV0cnRlaywgMDUuIG1hcmVjIDIwMjAgb2IgMDA6NTE6NDkgQ0VU
IGplIExhdXJlbnQgUGluY2hhcnQgbmFwaXNhbChhKToKPiBIaSBKZXJuZWosCj4gCj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMTI6MjU6MTJB
TSArMDEwMCwgSmVybmVqIFNrcmFiZWMgd3JvdGU6Cj4gPiBpc19jb2xvcl9zcGFjZV9jb252ZXJz
aW9uKCkgaXMgYSBtaXNub21lci4gSXQgY2hlY2tzIG5vdCBvbmx5IGlmIGNvbG9yCj4gPiBzcGFj
ZSBjb252ZXJzaW9uIGlzIG5lZWRlZCwgYnV0IGFsc28gaWYgZm9ybWF0IGNvbnZlcnNpb24gaXMg
bmVlZGVkLgo+ID4gVGhpcyBpcyBhY3R1YWxseSBkZXNpcmVkIGJlaGF2aW91ciBiZWNhdXNlIHJl
c3VsdCBvZiB0aGlzIGZ1bmN0aW9uCj4gPiBkZXRlcm1pbmVzIGlmIENTQyBibG9jayBzaG91bGQg
YmUgZW5hYmxlZCBvciBub3QgKENTQyBibG9jayBjYW4gYWxzbyBkbwo+ID4gZm9ybWF0IGNvbnZl
cnNpb24pLgo+ID4gCj4gPiBJbiBvcmRlciB0byBjbGVhciBtaXN1bmRlcnN0YW5kaW5ncywgbGV0
J3MgcmV3b3JrCj4gPiBpc19jb2xvcl9zcGFjZV9jb252ZXJzaW9uKCkgdG8gZG8gZXhhY3RseSB3
aGF0IGlzIHN1cHBvc2VkIHRvIGRvIGFuZCBhZGQKPiA+IGFub3RoZXIgZnVuY3Rpb24gd2hpY2gg
d2lsbCBkZXRlcm1pbmUgaWYgQ1NDIGJsb2NrIG11c3QgYmUgZW5hYmxlZCBvcgo+ID4gbm90Lgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lv
bC5uZXQ+Cj4gPiAtLS0KPiA+IAo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jIHwgMzEgKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBpbmRleAo+ID4gYzhhMDJlNWI1ZTFi
Li43NzI0MTkxZTBhOGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiA+IEBAIC05NjMsMTEgKzk2MywxNCBAQCBzdGF0aWMgdm9pZCBoZG1pX3Zp
ZGVvX3NhbXBsZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiA+IAo+ID4gIHN0YXRpYyBpbnQgaXNf
Y29sb3Jfc3BhY2VfY29udmVyc2lvbihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiA+ICB7Cj4gPiAK
PiA+IC0JcmV0dXJuIChoZG1pLT5oZG1pX2RhdGEuZW5jX2luX2J1c19mb3JtYXQgIT0KPiA+IC0J
CQloZG1pLT5oZG1pX2RhdGEuZW5jX291dF9idXNfZm9ybWF0KSB8fAo+ID4gLQkgICAgICAgKGhk
bWlfYnVzX2ZtdF9pc19yZ2IoaGRtaS0+aGRtaV9kYXRhLmVuY19pbl9idXNfZm9ybWF0KSAmJgo+
ID4gLQkJaGRtaV9idXNfZm10X2lzX3JnYihoZG1pLT5oZG1pX2RhdGEuZW5jX291dF9idXNfZm9y
bWF0KSAKJiYKPiA+IC0JCWhkbWktPmhkbWlfZGF0YS5yZ2JfbGltaXRlZF9yYW5nZSk7Cj4gPiAr
CXN0cnVjdCBoZG1pX2RhdGFfaW5mbyAqaGRtaV9kYXRhID0gJmhkbWktPmhkbWlfZGF0YTsKPiA+
ICsJYm9vbCBpc19pbnB1dF9yZ2IsIGlzX291dHB1dF9yZ2I7Cj4gPiArCj4gPiArCWlzX2lucHV0
X3JnYiA9IGhkbWlfYnVzX2ZtdF9pc19yZ2IoaGRtaV9kYXRhLT5lbmNfaW5fYnVzX2Zvcm1hdCk7
Cj4gPiArCWlzX291dHB1dF9yZ2IgPSBoZG1pX2J1c19mbXRfaXNfcmdiKGhkbWlfZGF0YS0KPmVu
Y19vdXRfYnVzX2Zvcm1hdCk7Cj4gPiArCj4gPiArCXJldHVybiAoaXNfaW5wdXRfcmdiICE9IGlz
X291dHB1dF9yZ2IpIHx8Cj4gPiArCSAgICAgICAoaXNfaW5wdXRfcmdiICYmIGlzX291dHB1dF9y
Z2IgJiYgaGRtaV9kYXRhLQo+cmdiX2xpbWl0ZWRfcmFuZ2UpOwo+ID4gCj4gPiAgfQo+ID4gIAo+
ID4gIHN0YXRpYyBpbnQgaXNfY29sb3Jfc3BhY2VfZGVjaW1hdGlvbihzdHJ1Y3QgZHdfaGRtaSAq
aGRtaSkKPiA+IAo+ID4gQEAgLTk5NCw2ICs5OTcsMTMgQEAgc3RhdGljIGludCBpc19jb2xvcl9z
cGFjZV9pbnRlcnBvbGF0aW9uKHN0cnVjdAo+ID4gZHdfaGRtaSAqaGRtaSk+IAo+ID4gIAlyZXR1
cm4gMDsKPiA+ICAKPiA+ICB9Cj4gPiAKPiA+ICtzdGF0aWMgYm9vbCBpc19jb252ZXJzaW9uX25l
ZWRlZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiAKPiBNYXliZSBpc19jc2NfbmVlZGVkID8KCk9r
LCBJJ2xsIGZpeCBkdXJpbmcgYXBwbHlpbmcuCgo+IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpUaGFua3MhCgpCZXN0
IHJlZ2FyZHMsCkplcm5lagoKPiAKPiA+ICt7Cj4gPiArCXJldHVybiBpc19jb2xvcl9zcGFjZV9j
b252ZXJzaW9uKGhkbWkpIHx8Cj4gPiArCSAgICAgICBpc19jb2xvcl9zcGFjZV9kZWNpbWF0aW9u
KGhkbWkpIHx8Cj4gPiArCSAgICAgICBpc19jb2xvcl9zcGFjZV9pbnRlcnBvbGF0aW9uKGhkbWkp
Owo+ID4gK30KPiA+ICsKPiA+IAo+ID4gIHN0YXRpYyB2b2lkIGR3X2hkbWlfdXBkYXRlX2NzY19j
b2VmZnMoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4gPiAgewo+ID4gIAo+ID4gIAljb25zdCB1MTYg
KCpjc2NfY29lZmYpWzNdWzRdID0gJmNzY19jb2VmZl9kZWZhdWx0Owo+ID4gCj4gPiBAQCAtMjAx
NCwxOCArMjAyNCwxOSBAQCBzdGF0aWMgdm9pZCBkd19oZG1pX2VuYWJsZV92aWRlb19wYXRoKHN0
cnVjdAo+ID4gZHdfaGRtaSAqaGRtaSk+IAo+ID4gIAloZG1pX3dyaXRlYihoZG1pLCBoZG1pLT5t
Y19jbGtkaXMsIEhETUlfTUNfQ0xLRElTKTsKPiA+ICAJCj4gPiAgCS8qIEVuYWJsZSBjc2MgcGF0
aCAqLwo+ID4gCj4gPiAtCWlmIChpc19jb2xvcl9zcGFjZV9jb252ZXJzaW9uKGhkbWkpKSB7Cj4g
PiArCWlmIChpc19jb252ZXJzaW9uX25lZWRlZChoZG1pKSkgewo+ID4gCj4gPiAgCQloZG1pLT5t
Y19jbGtkaXMgJj0gfkhETUlfTUNfQ0xLRElTX0NTQ0NMS19ESVNBQkxFOwo+ID4gIAkJaGRtaV93
cml0ZWIoaGRtaSwgaGRtaS0+bWNfY2xrZGlzLCBIRE1JX01DX0NMS0RJUyk7Cj4gPiAKPiA+IC0J
fQo+ID4gCj4gPiAtCS8qIEVuYWJsZSBjb2xvciBzcGFjZSBjb252ZXJzaW9uIGlmIG5lZWRlZCAq
Lwo+ID4gLQlpZiAoaXNfY29sb3Jfc3BhY2VfY29udmVyc2lvbihoZG1pKSkKPiA+IAo+ID4gIAkJ
aGRtaV93cml0ZWIoaGRtaSwgCkhETUlfTUNfRkxPV0NUUkxfRkVFRF9USFJPVUdIX09GRl9DU0Nf
SU5fUEFUSCwKPiA+ICAJCQo+ID4gIAkJCSAgICBIRE1JX01DX0ZMT1dDVFJMKTsKPiA+IAo+ID4g
LQllbHNlCj4gPiArCX0gZWxzZSB7Cj4gPiArCQloZG1pLT5tY19jbGtkaXMgfD0gSERNSV9NQ19D
TEtESVNfQ1NDQ0xLX0RJU0FCTEU7Cj4gPiArCQloZG1pX3dyaXRlYihoZG1pLCBoZG1pLT5tY19j
bGtkaXMsIEhETUlfTUNfQ0xLRElTKTsKPiA+ICsKPiA+IAo+ID4gIAkJaGRtaV93cml0ZWIoaGRt
aSwgCkhETUlfTUNfRkxPV0NUUkxfRkVFRF9USFJPVUdIX09GRl9DU0NfQllQQVNTLAo+ID4gIAkJ
Cj4gPiAgCQkJICAgIEhETUlfTUNfRkxPV0NUUkwpOwo+ID4gCj4gPiArCX0KPiA+IAo+ID4gIH0K
PiA+ICAKPiA+ICAvKiBXb3JrYXJvdW5kIHRvIGNsZWFyIHRoZSBvdmVyZmxvdyBjb25kaXRpb24g
Ki8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
