Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8AF77617
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 04:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B986EE85;
	Sat, 27 Jul 2019 02:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6604F6EE85
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 02:51:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126200118163.15.openmobile.ne.jp
 [126.200.118.163])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 711622E7;
 Sat, 27 Jul 2019 04:51:55 +0200 (CEST)
Date: Sat, 27 Jul 2019 05:51:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/4] video: of: display_timing: Add of_node_put() in
 of_get_display_timing()
Message-ID: <20190727025151.GE4902@pendragon.ideasonboard.com>
References: <20190722182439.44844-1-dianders@chromium.org>
 <20190722182439.44844-2-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722182439.44844-2-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564195917;
 bh=let5ORoniAHJEKYglIYJqD/D6mDARxa9CO3R2asqtA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgIJGFb5yr5PqP1+iroljmI1MG7Oaw1kCFt95u00pFPp0q8CGOmpzKOxwh+8QQhSk
 mw653DnnjwSqKr5dPcw+XdU0jlRm+faXrkvB31s1+6VpaeOKQsi/U/L1hPLEB4WZPv
 uRKGVNDXCmRwRYIjc7lgIL4IQeMfeI7ChPb/ngwo=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2xhcywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBKdWwgMjIsIDIw
MTkgYXQgMTE6MjQ6MzZBTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiBGcm9tIGNv
ZGUgaW5zcGVjdGlvbiBpdCBjYW4gYmUgc2VlbiB0aGF0IG9mX2dldF9kaXNwbGF5X3RpbWluZygp
IGlzCj4gbGFja2luZyBhbiBvZl9ub2RlX3B1dCgpLiAgQWRkIGl0Lgo+IAo+IEZpeGVzOiBmZmEz
ZmQyMWRlOGEgKCJ2aWRlb21vZGU6IGltcGxlbWVudCBwdWJsaWMgb2ZfZ2V0X2Rpc3BsYXlfdGlt
aW5nKCkiKQo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9t
aXVtLm9yZz4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+IAo+ICBkcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlf
dGltaW5nLmMgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlf
dGltaW5nLmMgYi9kcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMKPiBpbmRleCBmNWMx
YzQ2OWMwYWYuLjVlZWRhZTA3OTlmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL29mX2Rp
c3BsYXlfdGltaW5nLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL29mX2Rpc3BsYXlfdGltaW5nLmMK
PiBAQCAtMTE5LDYgKzExOSw3IEBAIGludCBvZl9nZXRfZGlzcGxheV90aW1pbmcoY29uc3Qgc3Ry
dWN0IGRldmljZV9ub2RlICpucCwgY29uc3QgY2hhciAqbmFtZSwKPiAgCQlzdHJ1Y3QgZGlzcGxh
eV90aW1pbmcgKmR0KQo+ICB7Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKnRpbWluZ19ucDsKPiAr
CWludCByZXQ7Cj4gIAo+ICAJaWYgKCFucCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiBAQCAtMTI5
LDcgKzEzMCwxMSBAQCBpbnQgb2ZfZ2V0X2Rpc3BsYXlfdGltaW5nKGNvbnN0IHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAsIGNvbnN0IGNoYXIgKm5hbWUsCj4gIAkJcmV0dXJuIC1FTk9FTlQ7Cj4gIAl9
Cj4gIAo+IC0JcmV0dXJuIG9mX3BhcnNlX2Rpc3BsYXlfdGltaW5nKHRpbWluZ19ucCwgZHQpOwo+
ICsJcmV0ID0gb2ZfcGFyc2VfZGlzcGxheV90aW1pbmcodGltaW5nX25wLCBkdCk7Cj4gKwo+ICsJ
b2Zfbm9kZV9wdXQodGltaW5nX25wKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIEVYUE9S
VF9TWU1CT0xfR1BMKG9mX2dldF9kaXNwbGF5X3RpbWluZyk7Cj4gIAoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
