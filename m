Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41AB78838
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 11:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E54189613;
	Mon, 29 Jul 2019 09:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F5F895E1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 09:21:01 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hs1pz-0007uA-8k; Mon, 29 Jul 2019 11:20:59 +0200
Message-ID: <1564392057.7633.2.camel@pengutronix.de>
Subject: Re: [PATCH v6 10/24] drm/imx: imx-ldb: Provide ddc symlink in
 connector's sysfs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 29 Jul 2019 11:20:57 +0200
In-Reply-To: <bcfe39a0333df951a7d160b3a946c2c32e7eac7f.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <bcfe39a0333df951a7d160b3a946c2c32e7eac7f.1564161140.git.andrzej.p@collabora.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Armijn Hemel <armijn@tjaldur.nl>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTI2IGF0IDE5OjIzICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3og
d3JvdGU6Cj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25u
ZWN0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVq
LnBAY29sbGFib3JhLmNvbT4KCkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgoKVGhhbmtzIQoKcmVnYXJkcwpQaGlsaXBwCgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vaW14L2lteC1sZGIuYyB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaW14L2lteC1sZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jCj4gaW5kZXgg
ZGU2MmE0Y2Q0ODI3Li5kYjQ2MWI2YTI1N2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2lteC9pbXgtbGRiLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYwo+IEBA
IC00NjIsOSArNDYyLDEwIEBAIHN0YXRpYyBpbnQgaW14X2xkYl9yZWdpc3RlcihzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLAo+ICAJCSAqLwo+ICAJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaW14
X2xkYl9jaC0+Y29ubmVjdG9yLAo+ICAJCQkJJmlteF9sZGJfY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyk7Cj4gLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRybSwgJmlteF9sZGJfY2gtPmNvbm5lY3RvciwK
PiAtCQkJCSZpbXhfbGRiX2Nvbm5lY3Rvcl9mdW5jcywKPiAtCQkJCURSTV9NT0RFX0NPTk5FQ1RP
Ul9MVkRTKTsKPiArCQlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAmaW14X2xkYl9j
aC0+Y29ubmVjdG9yLAo+ICsJCQkJCSAgICAmaW14X2xkYl9jb25uZWN0b3JfZnVuY3MsCj4gKwkJ
CQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTLAo+ICsJCQkJCSAgICBpbXhfbGRiX2NoLT5k
ZGMpOwo+ICAJCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoJmlteF9sZGJfY2gtPmNvbm5l
Y3RvciwgZW5jb2Rlcik7Cj4gIAl9Cj4gIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
