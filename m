Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19A8187C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 13:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46D389C37;
	Mon,  5 Aug 2019 11:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6DF89B48
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 11:54:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F12E320039;
 Mon,  5 Aug 2019 13:54:51 +0200 (CEST)
Date: Mon, 5 Aug 2019 13:54:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Message-ID: <20190805115450.GB16513@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-6-sam@ravnborg.org>
 <8567eb4c916a0b1d134bd62112a11903@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8567eb4c916a0b1d134bd62112a11903@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=8AirrxEcAAAA:8 a=PwaXosQhBBzGxnEnWWMA:9 a=AW-sozriLiJjIiio:21
 a=XmQ5ioN8wHDAHHl3:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=ST-jHhOKWsTCqRlWije3:22
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam.ravnborg@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Enrico Weigelt <info@metux.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RlZmFuLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpPbiBNb24sIEF1ZyAwNSwgMjAx
OSBhdCAxMToxNjoyNkFNICswMjAwLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4gT24gMjAxOS0wOC0w
NCAyMjoxNiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gVXNlIGRybV9wYW5lbF9nZXRfbW9kZXMo
KSB0byBhY2Nlc3MgbW9kZXMuCj4gPiBUaGlzIGhhcyBhIG5pY2Ugc2lkZSBlZmZlY3QgdG8gc2lt
cGxpZnkgdGhlIGNvZGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KPiA+IENjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiA+
IENjOiBBbGlzb24gV2FuZyA8YWxpc29uLndhbmdAbnhwLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jIHwgMTAgKy0tLS0tLS0tLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4gPiBpbmRleCAy
NzlkODNlYWZmYzAuLmE5MmZkNmM3MGIwOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZnNs
LWRjdS9mc2xfZGN1X2RybV9yZ2IuYwo+ID4gQEAgLTY1LDE3ICs2NSw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcwo+ID4gZnNsX2RjdV9kcm1fY29ubmVjdG9yX2Z1
bmNzID0gewo+ID4gIHN0YXRpYyBpbnQgZnNsX2RjdV9kcm1fY29ubmVjdG9yX2dldF9tb2Rlcyhz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4gIHsKPiA+ICAJc3RydWN0IGZzbF9k
Y3VfZHJtX2Nvbm5lY3RvciAqZnNsX2Nvbm5lY3RvcjsKPiA+IC0JaW50ICgqZ2V0X21vZGVzKShz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gPiAtCWludCBudW1fbW9kZXMgPSAwOwo+ID4gIAo+
ID4gIAlmc2xfY29ubmVjdG9yID0gdG9fZnNsX2RjdV9jb25uZWN0b3IoY29ubmVjdG9yKTsKPiA+
IC0JaWYgKGZzbF9jb25uZWN0b3ItPnBhbmVsICYmIGZzbF9jb25uZWN0b3ItPnBhbmVsLT5mdW5j
cyAmJgo+ID4gLQkgICAgZnNsX2Nvbm5lY3Rvci0+cGFuZWwtPmZ1bmNzLT5nZXRfbW9kZXMpIHsK
PiA+IC0JCWdldF9tb2RlcyA9IGZzbF9jb25uZWN0b3ItPnBhbmVsLT5mdW5jcy0+Z2V0X21vZGVz
Owo+ID4gLQkJbnVtX21vZGVzID0gZ2V0X21vZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKPiA+
IC0JfQo+ID4gLQo+ID4gLQlyZXR1cm4gbnVtX21vZGVzOwo+ID4gKwlyZXR1cm4gZHJtX3BhbmVs
X2dldF9tb2Rlcyhmc2xfY29ubmVjdG9yLT5wYW5lbCk7Cj4gCj4gT2gsIHRoYXQgb2xkIGNvZGUg
bG9va3MgcmF0aGVyIG1lc3N5LiBUaGFua3MgZm9yIHRoZSBzaW1wbGlmaWNhdGlvbiEKPiAKPiBU
aGlzIGJlaGF2ZXMgc2xpZ2h0bHkgZGlmZmVyZW50IHNpbmNlIGl0IG5vdyByZXR1cm5zIC1FSU5W
QUwgb3IgLUVOT1NZUywKPiBidXQgdGhhdCBpcyB3aGF0IHdlIHdhbnQuCgpZb3UgYXJlIHJpZ2h0
LCBhbmQgSSB3aWxsIGFkZCB0aGlzIHRvIHRoZSBjaGFuZ2Vsb2cgd2hlbiBJIGFwcGx5LgoKCVNh
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
