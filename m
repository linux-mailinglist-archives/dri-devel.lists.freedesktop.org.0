Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E677475F18
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 08:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD996E890;
	Fri, 26 Jul 2019 06:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877996E88B;
 Fri, 26 Jul 2019 06:35:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4CC348032E;
 Fri, 26 Jul 2019 08:35:11 +0200 (CEST)
Date: Fri, 26 Jul 2019 08:35:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v5 02/24] drm: Add drm_connector_init() variant with ddc
Message-ID: <20190726063509.GA6443@ravnborg.org>
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=L5xsDtsewR9xm4AmGRwA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplai4KCk9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDAzOjU5OjI0UE0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBBbGxvdyBwYXNzaW5nIGRkYyBhZGFwdGVyIHBv
aW50ZXIgdG8gdGhlIGluaXQgZnVuY3Rpb24uIEV2ZW4gaWYKPiBkcm1fY29ubmVjdG9yX2luaXQo
KSBzb21ldGltZSBpbiB0aGUgZnV0dXJlIGRlY2lkZXMgdG8gZS5nLiBtZW1zZXQoKSBhbGwKPiBj
b25uZWN0b3IgZmllbGRzIHRvIHplcm9zLCB0aGUgbmV3bHkgYWRkZWQgZnVuY3Rpb24gZW5zdXJl
cyB0aGF0IGF0IGl0cwo+IGNvbXBsZXRpb24gdGhlIGRkYyBtZW1iZXIgb2YgY29ubmVjdG9yIGlz
IGNvcnJlY3RseSBzZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6
IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oICAgICB8ICA1ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+IGluZGV4IDA2OGQ0YjA1ZjFiZS4uMDZm
YmZjNDRmYjQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gQEAgLTI5Niw2ICsyOTYs
MjUgQEAgaW50IGRybV9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICB9
Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2Nvbm5lY3Rvcl9pbml0KTsKPiAgCj4gK2ludCBkcm1fY29u
bmVjdG9yX2luaXRfd2l0aF9kZGMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiArCQkJCXN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gKwkJCQljb25zdCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9mdW5jcyAqZnVuY3MsCj4gKwkJCQlpbnQgY29ubmVjdG9yX3R5cGUsCj4gKwkJCQlzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmRkYykKPiArewoKVGhpcyBpcyBnb29kLCB3aXRoIHRoaXMgaGVscGVy
IHRoZXJlIGlzIG5vIGxvbmdlciBhbnkgY29uZnVzaW9uIGFib3V0Cm9yZGVyaW5nLgoKZHJtX2Nv
bm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkgaXMgcGFydCBvZiB0aGUgcHVibGljIGludGVyZmFjZSBm
b3IKZHJtX2Nvbm5lY3RvciBhbmQgbmVlZHMga2VybmVsLWRvYyBkb2N1bWVudGF0aW9uLgoKCVNh
bQoKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29u
bmVjdG9yLCBmdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4g
cmV0Owo+ICsKPiArCS8qIHByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gc3lzZnMgKi8KPiArCWNvbm5l
Y3Rvci0+ZGRjID0gZGRjOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArRVhQT1JUX1NZTUJP
TChkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMpOwo+ICsKPiAgLyoqCj4gICAqIGRybV9jb25u
ZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkgLSBhdHRhY2ggZWRpZCBwcm9wZXJ0eS4KPiAgICog
QGNvbm5lY3RvcjogdGhlIGNvbm5lY3Rvcgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Y29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBpbmRleCAzM2E2ZmZm
ODVmZGIuLjkzN2ZkYTljMTM3NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBAQCAtMTQxMCw2ICsx
NDEwLDExIEBAIGludCBkcm1fY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiAgCQkgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiAgCQkgICAgICAg
Y29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLAo+ICAJCSAgICAgICBpbnQg
Y29ubmVjdG9yX3R5cGUpOwo+ICtpbnQgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gKwkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAo+ICsJCQkJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLAo+ICsJCQkJ
aW50IGNvbm5lY3Rvcl90eXBlLAo+ICsJCQkJc3RydWN0IGkyY19hZGFwdGVyICpkZGMpOwo+ICB2
b2lkIGRybV9jb25uZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3Rvcik7Cj4gIGludCBkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpOwo+ICB2b2lkIGRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcihz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsKPiAtLSAKPiAyLjE3LjEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
