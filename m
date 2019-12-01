Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCAD10E199
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 12:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223A789306;
	Sun,  1 Dec 2019 11:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3347489216
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 11:32:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E99F22003B;
 Sun,  1 Dec 2019 12:32:22 +0100 (CET)
Date: Sun, 1 Dec 2019 12:32:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 02/16] drm/exynos: fix opencoded use of drm_panel_*
Message-ID: <20191201113221.GB8753@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-3-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=DKRLh2KxCiw4lqZK9CoA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=1CNFftbPRP8L7MoqJWF3:22
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6MjNQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybV9wYW5lbF9hdHRhY2goKSB3aWxsIGNoZWNrIGlmIHRoZXJlIGlzIGEgY29udHJv
bGxlcgo+IGFscmVhZHkgYXR0YWNoZWQgLSBkcm9wIHRoZSBjaGVjayBpbiB0aGUgZHJpdmVyLgo+
IAo+IFVzZSBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgc28gdGhlIGRyaXZlciBubyBsb25nZXIgdXNl
cyB0aGUgZnVuY3Rpb24KPiBwb2ludGVyLgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKCVNh
bQoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4g
Q2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiBDYzogSm9vbnlvdW5nIFNoaW0g
PGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgo+IENjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIua2lt
QHNhbXN1bmcuY29tPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcu
Y29tPgo+IENjOiBLdWtqaW4gS2ltIDxrZ2VuZUBrZXJuZWwub3JnPgo+IENjOiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGkuYwo+IGluZGV4IDNjZWJiMTllYzFjNC4u
NTQ3OWZmNzFjYmM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGku
Ywo+IEBAIC00Myw3ICs0Myw3IEBAIGV4eW5vc19kcGlfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCj4gIHsKPiAgCXN0cnVjdCBleHlub3NfZHBpICpj
dHggPSBjb25uZWN0b3JfdG9fZHBpKGNvbm5lY3Rvcik7Cj4gIAo+IC0JaWYgKGN0eC0+cGFuZWwg
JiYgIWN0eC0+cGFuZWwtPmNvbm5lY3RvcikKPiArCWlmIChjdHgtPnBhbmVsKQo+ICAJCWRybV9w
YW5lbF9hdHRhY2goY3R4LT5wYW5lbCwgJmN0eC0+Y29ubmVjdG9yKTsKPiAgCj4gIAlyZXR1cm4g
Y29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7Cj4gQEAgLTg1LDcgKzg1LDcgQEAgc3RhdGljIGlu
dCBleHlub3NfZHBpX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ICAJfQo+ICAKPiAgCWlmIChjdHgtPnBhbmVsKQo+IC0JCXJldHVybiBjdHgtPnBhbmVsLT5mdW5j
cy0+Z2V0X21vZGVzKGN0eC0+cGFuZWwpOwo+ICsJCXJldHVybiBkcm1fcGFuZWxfZ2V0X21vZGVz
KGN0eC0+cGFuZWwpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gLS0gCj4gMi4yMC4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
