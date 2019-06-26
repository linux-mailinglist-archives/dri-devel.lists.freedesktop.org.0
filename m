Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228B569E6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234586E420;
	Wed, 26 Jun 2019 13:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334CD6E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:00:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 03DA42003C;
 Wed, 26 Jun 2019 15:00:08 +0200 (CEST)
Date: Wed, 26 Jun 2019 15:00:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Message-ID: <20190626130007.GE23428@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190401171724.215780-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=cKMTf3WC4CzyLkAXteUA:9 a=CjuIK1q_8ugA:10 a=PO69wPE_V6wA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2xhcy4KCk9uIE1vbiwgQXByIDAxLCAyMDE5IGF0IDEwOjE3OjE3QU0gLTA3MDAsIERv
dWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gSSdtIHJldml2aW5nIFNlYW4gUGF1bCdzIG9sZCBwYXRj
aHNldCB0byBnZXQgbW9kZSBzdXBwb3J0IGluIGRldmljZQo+IHRyZWUuICBUaGUgY292ZXIgbGV0
dGVyIGZvciBoaXMgdjMgaXMgYXQ6Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJj
aGl2ZXMvZHJpLWRldmVsLzIwMTgtRmVicnVhcnkvMTY1MTYyLmh0bWwKPiAKPiBObyBjb2RlIGlz
IGRpZmZlcmVudCBiZXR3ZWVuIHY0IGFuZCB2NSwganVzdCBjb21taXQgbWVzc2FnZXMgYW5kIHRl
eHQKPiBpbiB0aGUgYmluZGluZ3MuCj4gCj4gSSd2ZSBwdWxsZWQgdG9nZXRoZXIgdGhlIHBhdGNo
ZXMgdGhhdCBkaWRuJ3QgbGFuZCBpbiB2MywgYWRkcmVzc2VkCj4gb3V0c3RhbmRpbmcgZmVlZGJh
Y2ssIGFuZCByZXBvc3RlZC4gIEF0b3AgdGhlbSBJJ3ZlIGFkZGVkIHBhdGNoZXMgZm9yCj4gcmsz
Mjg4LXZleXJvbi1jaHJvbWVib29rICh1c2VkIGZvciBqYXEsIGplcnJ5LCBtaWdodHksIHNwZWVk
eSkgYW5kCj4gcmszMjg4LXZlcnlvbi1taW5uaWUuCj4gCj4gUGxlYXNlIGxldCBtZSBrbm93IGhv
dyB0aGV5IGxvb2suCj4gCj4gSW4gZ2VuZXJhbCBJIGhhdmUgYWRkZWQgcGVvcGxlIHRvIHRoZSB3
aG9sZSBzZXJpZXMgd2hvIEkgdGhpbmsgd291bGQKPiBsaWtlIHRoZSB3aG9sZSBzZXJpZXMgYW5k
IHRoZW4gbGV0IGdldF9tYWludGFpbmVyIHBpY2sgZXh0cmEgcGVvcGxlIGl0Cj4gdGhpbmtzIGFy
ZSByZWxldmFudCB0byBlYWNoIGluZGl2aWR1YWwgcGF0Y2guICBJZiBJIHNlZSB5b3UgcmVzcG9u
ZCB0bwo+IGFueSBvZiB0aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLCB0aG91Z2gsIEknbGwgYWRk
IHlvdSB0byB0aGUgd2hvbGUKPiBzZXJpZXMgQ2MgbGlzdCBuZXh0IHRpbWUuCj4gCj4gQ2hhbmdl
cyBpbiB2NToKPiAtIFJlbW92ZWQgYml0IGFib3V0IE9TIG1heSBpZ25vcmUgKFJvYi9FemVxdWll
bCkKPiAtIEFkZGVkIEhlaWtvJ3MgVGVzdGVkLWJ5Cj4gLSBJdCdzIG5vdCBqdXN0IGplcnJ5LCBp
dCdzIG1vc3QgcmszMjg4IENocm9tZWJvb2tzIChIZWlrbykKCldoYXQgYXJlIHRoZSBwbGFucyB0
byBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzPwpPciBkaWQgeW91IGRyb3AgdGhlIHdob2xlIGlkZWEg
YWdhaW4/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
