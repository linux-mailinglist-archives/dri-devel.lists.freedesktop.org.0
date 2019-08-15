Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419E58EAF8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 14:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715356E8BC;
	Thu, 15 Aug 2019 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF92D6E8BC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 12:03:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09E0F2AF;
 Thu, 15 Aug 2019 14:03:17 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:03:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Message-ID: <20190815120315.GL5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565870598;
 bh=x6tXLrhBDxMnnhW530edcIgz9qxsaLzKSDv1wQnDanY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVdrCHQmu9La5DxbcRx/V8Wf3UXbSLxrTF9w9DN+puobrZePFG0I4mbJHc4H/5pfE
 tDCfkC+xfAdgb/yeE0xZUoqGJG7D7Mex9OMpYiO65ntNAfMsyrm5k4PqWPmtwqI9xk
 g6BcXZz6M+s4elsH1RyDFvK74XHUSxc4aVUaFKG8=
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
 Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgQXVnIDE1LCAy
MDE5IGF0IDEyOjA0OjI5UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiBXZSBuZWVk
IHRvIGtub3cgaWYgdGhlIHBhbmVsIHN1cHBvcnRzIGR1YWwtbGluaywgc2ltaWxhcmx5Cj4gdG8g
YnJpZGdlcywgdGhlcmVmb3JlIGFkZCBhIHJlZmVyZW5jZSB0byBkcm1fdGltaW5ncyBpbgo+IGRy
bV9wYW5lbC4KClBhbmVscyBtYXkgYWxzbyBuZWVkIHRvIHJlcG9ydCBzZXR1cC9ob2xkIHRpbWUs
IHNvIGl0J3Mgbm90IGFib3V0CmR1YWwtbGluayBvbmx5LiBJIHdvdWxkIG1ha2UgdGhpcyBleHBs
aWNpdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+IAo+IC0tLQo+IHYxLT52MjoK
PiAqIG5ldyBwYXRjaAo+IAo+ICBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCB8IDMgKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+IGluZGV4IDhjNzM4YzAu
LmNkNmZmMDcgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+IEBAIC0yNiw2ICsyNiw3IEBACj4gIAo+ICAjaW5jbHVk
ZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiArI2luY2x1ZGUg
PGRybS9kcm1fdGltaW5ncy5oPgoKWW91IGNhbiBqdXN0IGFkZCBhIGZvcndhcmQtZGVjbGFyYXRp
b24gb2Ygc3RydWN0IGRybV90aW1pbmcuCgo+ICAKPiAgc3RydWN0IGRldmljZV9ub2RlOwo+ICBz
dHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKPiBAQCAtODEsNiArODIsNyBAQCBzdHJ1Y3QgZHJtX3BhbmVs
X2Z1bmNzIHsKPiAgICogc3RydWN0IGRybV9wYW5lbCAtIERSTSBwYW5lbCBvYmplY3QKPiAgICog
QGRybTogRFJNIGRldmljZSBvd25pbmcgdGhlIHBhbmVsCj4gICAqIEBjb25uZWN0b3I6IERSTSBj
b25uZWN0b3IgdGhhdCB0aGUgcGFuZWwgaXMgYXR0YWNoZWQgdG8KPiArICogQHRpbWluZ3M6IHRp
bWluZyBpbmZvcm1hdGlvbgo+ICAgKiBAZGV2OiBwYXJlbnQgZGV2aWNlIG9mIHRoZSBwYW5lbAo+
ICAgKiBAbGluazogbGluayBmcm9tIHBhbmVsIGRldmljZSAoc3VwcGxpZXIpIHRvIERSTSBkZXZp
Y2UgKGNvbnN1bWVyKQo+ICAgKiBAZnVuY3M6IG9wZXJhdGlvbnMgdGhhdCBjYW4gYmUgcGVyZm9y
bWVkIG9uIHRoZSBwYW5lbAo+IEBAIC04OSw2ICs5MSw3IEBAIHN0cnVjdCBkcm1fcGFuZWxfZnVu
Y3Mgewo+ICBzdHJ1Y3QgZHJtX3BhbmVsIHsKPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07Cj4g
IAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ICsJY29uc3Qgc3RydWN0IGRybV90
aW1pbmdzICp0aW1pbmdzOwo+ICAJc3RydWN0IGRldmljZSAqZGV2Owo+ICAKPiAgCWNvbnN0IHN0
cnVjdCBkcm1fcGFuZWxfZnVuY3MgKmZ1bmNzOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
