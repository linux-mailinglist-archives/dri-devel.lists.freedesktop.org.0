Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E738EDE2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ECC6E9C5;
	Thu, 15 Aug 2019 14:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C876E9C5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:13:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4DF672002A;
 Thu, 15 Aug 2019 16:13:38 +0200 (CEST)
Date: Thu, 15 Aug 2019 16:13:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Message-ID: <20190815141337.GA2437@ravnborg.org>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
 a=qCD3WiFNeiuAlpbEp7oA:9 a=CjuIK1q_8ugA:10 a=QsnFDINu91a9xkgZirup:22
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8KCk9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEyOjA0OjI5UE0gKzAxMDAsIEZh
YnJpemlvIENhc3RybyB3cm90ZToKPiBXZSBuZWVkIHRvIGtub3cgaWYgdGhlIHBhbmVsIHN1cHBv
cnRzIGR1YWwtbGluaywgc2ltaWxhcmx5Cj4gdG8gYnJpZGdlcywgdGhlcmVmb3JlIGFkZCBhIHJl
ZmVyZW5jZSB0byBkcm1fdGltaW5ncyBpbgo+IGRybV9wYW5lbC4KCldoeSBkbyB3ZSBuZWVkIHRv
IGtub3cgdGhpcz8KV2h5IGlzIGl0IG5lZWRlZCBpbiBkcm1fcGFuZWwgYW5kIG5vdCBpbiBzb21l
IGRyaXZlciBzcGVjaWZpYyBzdHJ1Y3Q/CgpJIGNhbm5vdCBzZWUgdGhlIGZ1bGwgc2VyaWVzLCBh
cyBJIHdhcyBjb3BpZWQgb25seSBvbiBzb21lIG1haWxzLgpBd2FpdGluZyBkcmktZGV2ZWwgbW9k
ZXJhdG9yIGJlZm9yZSBJIGNhbiBzZWUgdGhlIHJlc3QuCgoJU2FtCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+
IC0tLQo+IHYxLT52MjoKPiAqIG5ldyBwYXRjaAo+IAo+ICBpbmNsdWRlL2RybS9kcm1fcGFuZWwu
aCB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+
IGluZGV4IDhjNzM4YzAuLmNkNmZmMDcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3Bh
bmVsLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+IEBAIC0yNiw2ICsyNiw3IEBA
Cj4gIAo+ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xpc3Qu
aD4KPiArI2luY2x1ZGUgPGRybS9kcm1fdGltaW5ncy5oPgo+ICAKPiAgc3RydWN0IGRldmljZV9u
b2RlOwo+ICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKPiBAQCAtODEsNiArODIsNyBAQCBzdHJ1Y3Qg
ZHJtX3BhbmVsX2Z1bmNzIHsKPiAgICogc3RydWN0IGRybV9wYW5lbCAtIERSTSBwYW5lbCBvYmpl
Y3QKPiAgICogQGRybTogRFJNIGRldmljZSBvd25pbmcgdGhlIHBhbmVsCj4gICAqIEBjb25uZWN0
b3I6IERSTSBjb25uZWN0b3IgdGhhdCB0aGUgcGFuZWwgaXMgYXR0YWNoZWQgdG8KPiArICogQHRp
bWluZ3M6IHRpbWluZyBpbmZvcm1hdGlvbgo+ICAgKiBAZGV2OiBwYXJlbnQgZGV2aWNlIG9mIHRo
ZSBwYW5lbAo+ICAgKiBAbGluazogbGluayBmcm9tIHBhbmVsIGRldmljZSAoc3VwcGxpZXIpIHRv
IERSTSBkZXZpY2UgKGNvbnN1bWVyKQo+ICAgKiBAZnVuY3M6IG9wZXJhdGlvbnMgdGhhdCBjYW4g
YmUgcGVyZm9ybWVkIG9uIHRoZSBwYW5lbAo+IEBAIC04OSw2ICs5MSw3IEBAIHN0cnVjdCBkcm1f
cGFuZWxfZnVuY3Mgewo+ICBzdHJ1Y3QgZHJtX3BhbmVsIHsKPiAgCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm07Cj4gIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ICsJY29uc3Qgc3Ry
dWN0IGRybV90aW1pbmdzICp0aW1pbmdzOwo+ICAJc3RydWN0IGRldmljZSAqZGV2Owo+ICAKPiAg
CWNvbnN0IHN0cnVjdCBkcm1fcGFuZWxfZnVuY3MgKmZ1bmNzOwo+IC0tIAo+IDIuNy40Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
