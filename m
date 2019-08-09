Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D487B30
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 15:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1B06ED5F;
	Fri,  9 Aug 2019 13:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1E46ED5F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 13:33:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 48D3980369;
 Fri,  9 Aug 2019 15:33:10 +0200 (CEST)
Date: Fri, 9 Aug 2019 15:33:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 24/60] drm/panel: Add driver for the Toppology TD043MTEA1
 panel
Message-ID: <20190809133308.GA19924@ravnborg.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-21-laurent.pinchart@ideasonboard.com>
 <20190710130917.GA11170@ravnborg.org>
 <20190808155454.GS6055@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808155454.GS6055@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Q-DjPuP9MojZYegYwH8A:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gPiA+ICtzdGF0aWMgaW50IHRkMDQzbXRlYTFfZGlzYWJsZShzdHJ1Y3Qg
ZHJtX3BhbmVsICpwYW5lbCkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgdGQwNDNtdGVhMV9kZXZp
Y2UgKmxjZCA9IHRvX3RkMDQzbXRlYTFfZGV2aWNlKHBhbmVsKTsKPiA+ID4gKwo+ID4gPiArCWlm
ICghbGNkLT5zcGlfc3VzcGVuZGVkKQo+ID4gPiArCQl0ZDA0M210ZWExX3Bvd2VyX29mZihsY2Qp
Owo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIDA7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRp
YyBpbnQgdGQwNDNtdGVhMV9lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCj4gPiA+ICt7
Cj4gPiA+ICsJc3RydWN0IHRkMDQzbXRlYTFfZGV2aWNlICpsY2QgPSB0b190ZDA0M210ZWExX2Rl
dmljZShwYW5lbCk7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiArCS8qCj4gPiA+ICsJ
ICogSWYgd2UgYXJlIHJlc3VtaW5nIGZyb20gc3lzdGVtIHN1c3BlbmQsIFNQSSBtaWdodCBub3Qg
YmUgZW5hYmxlZAo+ID4gPiArCSAqIHlldCwgc28gd2UnbGwgcHJvZ3JhbSB0aGUgTENEIGZyb20g
U1BJIFBNIHJlc3VtZSBjYWxsYmFjay4KPiA+ID4gKwkgKi8KPiA+ID4gKwlpZiAobGNkLT5zcGlf
c3VzcGVuZGVkKQo+ID4gPiArCQlyZXR1cm4gMDsKPiA+IAo+ID4gSSBkbyBub3QgcmVjYWxsIHRo
aXMgaXMgbmVlZGVkIGluIG90aGVyIHBhbmVsIGRyaXZlcnMsIHNvIGxvb2sgYXQgd2hhdAo+ID4g
b3RoZXIgc3BpIGJhc2VkIHBhbmVscyBkbyBoZXJlLgo+ID4gSSB0aGluayB0aGlzIGlzIHNvbWV0
aGluZyB0aGF0IHRvZGF5IGlzIG5vdCByZXF1aXJlZC4KPiAKPiBUaGUgcHJvYmxlbSBoZXJlIGlz
IHRoYXQgdGhlIGRpc3BsYXkgY29udHJvbGxlciBtYXkgYmUgcmVzdW1lZCBiZWZvcmUKPiB0aGUg
U1BJIGJ1cy4gSGFzIHRoYXQgYmVlbiBzb2x2ZWQgc29tZXdoZXJlIGluIGNvcmUgY29kZSA/CgpJ
IGR1bm5vLiBTbyB0aGUgY29uY2x1c2lvbiBpcyB0byBrZWVwIGl0IGFzIGlzLCBhbmQgYW55IGNo
YW5nZQp3aWxsIHdhaXQgdW50aWwgc29tZW9uZSB3aXRoIEhXIGNhbiBzdGVwIHVwLgoKQXMgZm9y
IGFsbCB5b3VyIG90aGVyIGZlZWRiYWNrIHRvIHRoaXMgYW5kIHRoZSBvdGhlciBwYW5lbCBkcml2
ZXJzCnRoZXkgZGlkIG5vdCB0cmlnZ2VyIGFueSByZXBzb25zZSBmcm9tIG1lLgoKTG9va3MgZm9y
d2FyZCBmb3IgbmV4dCBpdGVyYXRpb24gb2YgdGhpcyBuaWNlIHNldCBvZiBwYXRjaGVzLgpDYW4g
d2UgbWF5YmUgZ2V0IHRoZSBwYW5lbCBkcml2ZXJzIGluIGJlZm9yZSBzb21lIG9mIHRoZSBpbmZy
YXN0cnVjdHVyZQp3b3JrPwpJIGtub3cgdGhlIHVzZXJzIHRoZW4gbWF5IGNvbWUgYSBiaXQgbGF0
ZXIsIGJ1dCBJIHRoaW5rIHRoYXRzIE9LLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
