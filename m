Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505871871
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 14:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FA46E1D8;
	Tue, 23 Jul 2019 12:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A26E1D6;
 Tue, 23 Jul 2019 12:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 0B2192610F4
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
To: Sam Ravnborg <sam@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
Date: Tue, 23 Jul 2019 14:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723090532.GA787@ravnborg.org>
Content-Language: en-US
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
 Douglas Anderson <dianders@chromium.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVyBkbml1IDIzLjA3LjIwMTkgb8KgMTE6MDUsIFNhbSBSYXZuYm9yZyBwaXN6ZToK
PiBIaSBBbmRyemVqCj4gCj4gT24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDE6MjY6NDFQTSArMDIw
MCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+PiBVc2UgdGhlIGRkYyBwb2ludGVyIHBy
b3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5k
cnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMgfCAxICsKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNf
dGZwNDEwLmMKPj4gaW5kZXggNjJkMDE0YzIwOTg4Li5jMzczZWRiOTU2NjYgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCj4+IEBAIC0yMTksNiArMjE5LDcgQEAg
c3RhdGljIHN0cnVjdCBkcm1fY29ubmVjdG9yICp0ZnA0MTBfY29ubmVjdG9yX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAo+PiAgIAl0ZnA0MTBfY29ubmVjdG9yLT5tb2QgPSBtb2Q7Cj4+
ICAgCj4+ICAgCWNvbm5lY3RvciA9ICZ0ZnA0MTBfY29ubmVjdG9yLT5iYXNlOwo+PiArCWNvbm5l
Y3Rvci0+ZGRjID0gbW9kLT5pMmM7Cj4+ICAgCj4+ICAgCWRybV9jb25uZWN0b3JfaW5pdChkZXYs
IGNvbm5lY3RvciwgJnRmcDQxMF9jb25uZWN0b3JfZnVuY3MsCj4+ICAgCQkJRFJNX01PREVfQ09O
TkVDVE9SX0RWSUQpOwo+IAo+IFdoZW4gcmVhZGluZyB0aGlzIGNvZGUsIGl0IGxvb2tzIHN0cmFu
Z2UgdGhhdCB3ZSBzZXQgY29ubmVjdG9yLT5kZGMKPiAqYmVmb3JlKiB0aGUgY2FsbCB0byBpbml0
IHRoZSBjb25uZWN0b3IuCj4gT25lIGNvdWxkIHJpc2sgdGhhdCBkcm1fY29ubmVjdG9yX2luaXQo
KSB1c2VkIG1lbXNldCguLikgdG8gY2xlYXIgYWxsCj4gZmllbGRzIG9yIHNvLCBhbmQgaXQgd291
bGQgYnJlYWsgdGhpcyBvcmRlci4KCkkgdmVyaWZpZWQgdGhlIGNvZGUgb2YgZHJtX2Nvbm5lY3Rv
cl9pbml0KCkgYW5kIGNhbm5vdCBmaW5kIGFueSBtZW1zZXQoKQppbnZvY2F0aW9ucyB0aGVyZS4g
V2hhdCBpcyB5b3VyIGFjdHVhbCBjb25jZXJuPwoKQW5kcnplagpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
