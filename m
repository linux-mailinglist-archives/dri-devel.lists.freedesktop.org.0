Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C472A76
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 10:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA226E4AA;
	Wed, 24 Jul 2019 08:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0FE6E4AA;
 Wed, 24 Jul 2019 08:51:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7B36728C14E
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
 <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
 <acfd895d-ab59-0190-e25c-1827bd8d214b@suse.de>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <f051455a-3559-8f8e-cc76-1a6388b102b5@collabora.com>
Date: Wed, 24 Jul 2019 10:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <acfd895d-ab59-0190-e25c-1827bd8d214b@suse.de>
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
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKVyBkbml1IDI0LjA3LjIwMTkgb8KgMTA6MDEsIFRob21hcyBaaW1tZXJtYW5u
IHBpc3plOgo+IEhpCj4gCgoKPiAKPiBJIHRoaW5rIHRoaXMgZWNob2VzIG15IGNvbmNlcm4gYWJv
dXQgdGhlIGltcGxpY2l0IG9yZGVyIG9mIG9wZXJhdGlvbi4gSXQKPiBzZWVtcyB0b28gZWFzeSB0
byBnZXQgdGhpcyB3cm9uZy4gSWYgeW91IGRvbid0IHdhbnQgdG8gYWRkIGFuIGFkZGl0aW9uYWwK
PiBpbnRlcmZhY2UgZm9yIHNldHRpbmcgdGhlIGRkYyBmaWVsZCwgd2h5IG5vdCBhZGQgYSBkZWRp
Y2F0ZWQgaW5pdGlhbGl6ZXIKPiBmdW5jdGlvbiB0aGF0IHNldHMgdGhlIGRkYyBmaWVsZD8gU29t
ZXRoaW5nIGxpa2UgdGhpcy4KPiAKPiBpbnQgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGNv
bm5lY3RvciwgZnVuY3MsIC4uLiwgZGRjKQo+IHsKPiAJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0
KGNvbm5lY3RvciwgZnVuY3MsIC4uLik7Cj4gCWlmIChyZXQpCj4gCQlyZXR1cm4gcmV0Owo+IAo+
IAlpZiAoIWRkYykKPiAJCXJldHVybiAwOwo+IAo+IAljb25uZWN0b3ItPmRkYyA9IGRkYzsKPiAJ
Lyogc2V0IHVwIHN5c2ZzICovCj4gCj4gCXJldHVybiAwOwo+IH0KPiAKClRydWUuIEkgd2lsbCBz
ZW5kIGEgdjUgc29vbi4KClRoYW5rcywKCkFuZHJ6ZWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
