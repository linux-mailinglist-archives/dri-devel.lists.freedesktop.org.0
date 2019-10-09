Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88327D18B2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 21:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462F6E283;
	Wed,  9 Oct 2019 19:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBED6E283
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 19:24:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3EA088061B;
 Wed,  9 Oct 2019 21:24:48 +0200 (CEST)
Date: Wed, 9 Oct 2019 21:24:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
Message-ID: <20191009192447.GB2693@ravnborg.org>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
 <20190820103706.GB9745@ravnborg.org>
 <e9e47b5f-4da5-7131-d09c-92a7ec8ba46a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9e47b5f-4da5-7131-d09c-92a7ec8ba46a@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=CyJBAB4W5WolaSh6ElcA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taQoKT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDg6NTY6MTVBTSArMDMwMCwgVG9taSBW
YWxrZWluZW4gd3JvdGU6Cj4gSGkgU2FtLAo+IAo+IE9uIDIwLzA4LzIwMTkgMTM6MzcsIFNhbSBS
YXZuYm9yZyB3cm90ZToKPiAKPiA+ID4gQEAgLTEyMyw2ICsxMjMsMTggQEAgc3RhdGljIHZvaWQg
cGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4g
PiAgIAlkcm1fcGFuZWxfdW5wcmVwYXJlKHBhbmVsX2JyaWRnZS0+cGFuZWwpOwo+ID4gPiAgIH0K
PiA+ID4gK3N0YXRpYyBpbnQgcGFuZWxfYnJpZGdlX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLAo+ID4gPiArCQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikK
PiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgcGFuZWxfYnJpZGdlICpwYW5lbF9icmlkZ2UgPSBkcm1f
YnJpZGdlX3RvX3BhbmVsX2JyaWRnZShicmlkZ2UpOwo+ID4gPiArCj4gPiA+ICsJLyoKPiA+ID4g
KwkgKiBGSVhNRTogZHJtX3BhbmVsX2dldF9tb2RlcygpIHNob3VsZCB0YWtlIHRoZSBjb25uZWN0
b3IgYXMgYW4KPiA+ID4gKwkgKiBhcmd1bWVudC4KPiA+ID4gKwkgKi8KPiA+IE5vdGVkLCBJIGhh
dmUgcGF0Y2hlcyB0byBmaXggdGhpcy4gTmVlZHMgYSBsaXR0bGUgdGVzdGluZy9wb2xpc2hpbmcK
PiA+IGJlZm9yZSBJIHBvc3QgdGhlbS4KPiAKPiBEbyB5b3UgaGF2ZSBhbnkgdGVzdGFibGUgcGF0
Y2hlcyBmb3IgdGhpcz8KPiAKPiBJIHdhcyB0ZXN0aW5nIHRoaXMgc2VyaWVzIHdpdGggYSBUb3No
aWJhIERQSS0yLURTSSBicmlkZ2UgYW5kIGEgRFNJIHBhbmVsLAo+IGFuZCB3YXMgaGl0dGluZyBh
IGNyYXNoIGFzIHNpbXBsZS1wYW5lbCBjb3VsZG4ndCBnZXQgdGhlIGNvbm5lY3Rvci4KCgpJZiB0
aW1lIHBlcm1pdHMgSSB3aWxsIHJlZnJlc2ggdGhlIHBhdGNoZXMgdGhpcyB3ZWVrZW5kIGFuZCBz
ZW5kIHRoZW0Kb3V0LgpCdXQgcmlnaHQgbm93IGNhbm5vdCBwcm9taXNlIG11Y2ggYXMgSSBhbSBh
d2Z1bCBiZWhpbmQuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
