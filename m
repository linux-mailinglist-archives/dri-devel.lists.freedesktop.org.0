Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A97149B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 11:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C9C6E2C0;
	Tue, 23 Jul 2019 09:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6339F6E2C0;
 Tue, 23 Jul 2019 09:07:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 89772200AE;
 Tue, 23 Jul 2019 11:07:53 +0200 (CEST)
Date: Tue, 23 Jul 2019 11:07:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 16/23] drm/mgag200: Provide ddc symlink in connector
 sysfs directory
Message-ID: <20190723090752.GB787@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d32a6b1f0a3b79f1fbc8d0894080908526f6e61e.1562843413.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d32a6b1f0a3b79f1fbc8d0894080908526f6e61e.1562843413.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=akpas9ZDeQi6sww-pK0A:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplai4KCk9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAxOjI2OjQzUE0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBVc2UgdGhlIGRkYyBwb2ludGVyIHByb3ZpZGVk
IGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBp
ZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDkgKysrKystLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMKPiBpbmRleCBhMjUwNTQwMTVlOGMuLjhmYjk0NDRiMjE0MiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCj4gQEAgLTE3MDMsNiAr
MTcwMywxMSBAQCBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3IgKm1nYV92Z2FfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJCXJldHVybiBOVUxMOwo+ICAKPiAgCWNvbm5lY3RvciA9
ICZtZ2FfY29ubmVjdG9yLT5iYXNlOwo+ICsJbWdhX2Nvbm5lY3Rvci0+aTJjID0gbWdhZzIwMF9p
MmNfY3JlYXRlKGRldik7Cj4gKwlpZiAoIW1nYV9jb25uZWN0b3ItPmkyYykKPiArCQlEUk1fRVJS
T1IoImZhaWxlZCB0byBhZGQgZGRjIGJ1c1xuIik7Cj4gKwo+ICsJY29ubmVjdG9yLT5kZGMgPSAm
bWdhX2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyOwo+ICAKPiAgCWRybV9jb25uZWN0b3JfaW5pdChk
ZXYsIGNvbm5lY3RvciwKPiAgCQkJICAgJm1nYV92Z2FfY29ubmVjdG9yX2Z1bmNzLCBEUk1fTU9E
RV9DT05ORUNUT1JfVkdBKTsKTGlrZSBvbiBvdGhlciBwYXRjaCwgYXNzaWduaW5nIGNvbm5lY3Rv
ci0+ZGRjIGJlZm9yZQpkcm1fY29ubmVjdG9yX2luaXQoKSBsb29rcyB3cm9uZy4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
