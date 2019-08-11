Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C889248
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 17:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3D89B03;
	Sun, 11 Aug 2019 15:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EB589B03
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 15:24:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4F8D520025;
 Sun, 11 Aug 2019 17:24:50 +0200 (CEST)
Date: Sun, 11 Aug 2019 17:24:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 2/4] drm/tiny/ili9341: Move driver to drm/panel
Message-ID: <20190811152448.GA14660@ravnborg.org>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801135249.28803-3-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=WZHNqt2aAAAA:8
 a=SJz97ENfAAAA:8 a=JiMZDR7rqWeD9vZXaSYA:9 a=wPNLvfGTeEIA:10
 a=PrHl9onO2p7xFKlKy1af:22 a=vFet0B0WnEQeilDPIY6i:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: David Lechner <david@lechnology.com>, daniel.vetter@ffwll.ch,
 emil.l.velikov@gmail.com, josef@lusticky.cz, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKTW9zdCBmZWVkYmFjayBvbiB0aGlzIGRyaXZlciB3YXMgY292ZXJlZCBpbiBj
b21tZW50IHRvIDEvNC4KT25seSBhIGZldyB0aGluZ3MgY2F1Z2h0IG15IGV5ZS4KCk9uIFRodSwg
QXVnIDAxLCAyMDE5IGF0IDAzOjUyOjQ3UE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToK
PiBNb3ZlIHRoZSBkcml2ZXIgdG8gZHJtL3BhbmVsIGFuZCB0YWtlIGFkdmFudGFnZSBvZiB0aGUg
bmV3IHBhbmVsIHN1cHBvcnQKPiBpbiBkcm1fbWlwaV9kYmkuIENoYW5nZSB0aGUgZmlsZSBuYW1l
IHRvIG1hdGNoIHRoZSBuYW1pbmcgc3RhbmRhcmQgaW4KPiBkcm0vcGFuZWwuIFRoZSBEUk0gZHJp
dmVyIG5hbWUgaXMga2VwdCBzaW5jZSBpdCBpcyBBQkkuCj4gCj4gQWRkIG1pc3NpbmcgTUFJTlRB
SU5FUlMgZW50cnkuCj4gCj4gQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+
IC0tLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDcgKwo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAg
MTIgKysKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgIHwg
ICAxICsKPiAgLi4uL3BhbmVsLWlsaXRlay1pbGk5MzQxLmN9ICAgICAgICAgICAgICAgICAgIHwg
MTc0ICsrKysrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgfCAgMTMgLS0KPiAgZHJpdmVycy9ncHUvZHJtL3RpbnkvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgIHwgICAxIC0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9u
cygrKSwgOTUgZGVsZXRpb25zKC0pCj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0ve3RpbnkvaWxp
OTM0MS5jID0+IHBhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzQxLmN9ICg2NiUpCj4gCj4gKwo+ICtz
dHJ1Y3QgaWxpOTM0MSB7Cj4gKwlzdHJ1Y3QgbWlwaV9kYmlfZGV2IGRiaWRldjsgLyogVGhpcyBt
dXN0IGJlIHRoZSBmaXJzdCBlbnRyeSAqLwoKQ2FuIHdlIGF2b2lkIHRoZSBuZWVkIGZvciB0aGlz
IHRvIGJlIHRoZSBmaXJzdCBlbnRyeT8KCgo+IC1zdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgaWxp
OTM0MV9kcml2ZXIgPSB7Cj4gLQkuZHJpdmVyX2ZlYXR1cmVzCT0gRFJJVkVSX0dFTSB8IERSSVZF
Ul9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQywKPiAtCS5mb3BzCQkJPSAmaWxpOTM0MV9mb3BzLAo+
IC0JLnJlbGVhc2UJCT0gbWlwaV9kYmlfcmVsZWFzZSwKPiAtCURSTV9HRU1fQ01BX1ZNQVBfRFJJ
VkVSX09QUywKPiAtCS5kZWJ1Z2ZzX2luaXQJCT0gbWlwaV9kYmlfZGVidWdmc19pbml0LAo+IC0J
Lm5hbWUJCQk9ICJpbGk5MzQxIiwKPiAtCS5kZXNjCQkJPSAiSWxpdGVrIElMSTkzNDEiLAo+IC0J
LmRhdGUJCQk9ICIyMDE4MDUxNCIsCj4gLQkubWFqb3IJCQk9IDEsCj4gLQkubWlub3IJCQk9IDAs
Cgo+ICtERUZJTkVfRFJNX01JUElfREJJX1BBTkVMX0RSSVZFUihpbGk5MzQxLCAiSWxpdGVrIElM
STkzNDEiLCAiMjAxODA1MTQiKTsKVXBkYXRlIHRoZSBkYXRlLiBUaGlzIGlzIGEgbWFqb3IgY2hh
bmdlIHNvIGxldCBpdCBiZSByZWZlbGN0ZWQgaW4gdGhlCmRhdGUuCgoJU2FtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
