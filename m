Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F905C4A3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7789B69;
	Mon,  1 Jul 2019 20:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4457A89B96;
 Mon,  1 Jul 2019 13:27:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id A8ED5260DF9
Subject: Re: [PATCH v3 01/22] drm: Include ddc adapter pointer in struct
 drm_connector
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <d6381c020ea1c848a7044d830bdb0ec9663d1619.1561735433.git.andrzej.p@collabora.com>
 <9b03d145-ec50-927c-55a8-dff1cd51d655@suse.de>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <cf1984e4-50af-302d-ef67-9ad530118c29@collabora.com>
Date: Mon, 1 Jul 2019 15:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9b03d145-ec50-927c-55a8-dff1cd51d655@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 freedreno@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLiBQbGVhc2Ugc2VlIGlubGlu
ZS4KClcgZG5pdSAzMC4wNi4yMDE5IG/CoDEwOjEyLCBUaG9tYXMgWmltbWVybWFubiBwaXN6ZToK
PiBIaQo+IAo+IEkgbGlrZSB0aGUgaWRlYSwgYnV0IHdvdWxkIHByZWZlciBhIG1vcmUgc3RydWN0
dXJlZCBhcHByb2FjaC4KPiAKPiBTZXR0aW5nIGNvbm5lY3Rvci0+ZGRjIGJlZm9yZSBjYWxsaW5n
IGRybV9zeXNmc19jb25uZWN0b3JfYWRkKCkgc2VlbXMKPiBlcnJvciBwcm9uZS4gVGhlIGRlcGVu
ZGVuY3kgaXMgbm90IHJlYWxseSBjbGVhciBmcm9tIHRoZSBjb2RlIG9yIGludGVyZmFjZXMuCj4g
Cj4gVGhlIG90aGVyIHRoaW5nIGlzIHRoYXQgZHJpdmVycyBJIG1vc3RseSB3b3JrIG9uLCBhc3Qg
YW5kIG1nYWcyMDAsIGhhdmUKPiBjb2RlIGxpa2UgdGhpczoKPiAKPiAgICBzdHJ1Y3QgYXN0X2ky
Y19jaGFuIHsKPiAJc3RydWN0IGkyY19hZGFwdGVyIGFkYXB0ZXI7Cj4gCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXY7Cj4gCXN0cnVjdCBpMmNfYWxnb19iaXRfZGF0YSBiaXQ7Cj4gICAgfTsKPiAKPiAg
ICBzdHJ1Y3QgYXN0X2Nvbm5lY3RvciB7Cj4gCXN0cnVjdCBkcm1fY29ubmVjdG9yIGJhc2U7Cj4g
CXN0cnVjdCBhc3RfaTJjX2NoYW4gKmkyYzsKPiAgICB9Owo+IAo+IEl0IGFscmVhZHkgZW5jb2Rl
cyB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIGNvbm5lY3RvciBhbmQgZGRjIGFkYXB0ZXIuCj4gCj4g
SSBzdWdnZXN0IHRvIGludHJvZHVjZSBzdHJ1Y3QgZHJtX2kyY19hZGFwdGVyCj4gCj4gICAgc3Ry
dWN0IGRybV9pMmNfYWRhcHRlciB7Cj4gCXN0cnVjdCBpMmNfYWRhcHRlciBiYXNlOwo+IAlzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ICAgIH07Cj4gCj4gYW5kIGNvbnZlcnQgZHJp
dmVycyBvdmVyIHRvIGl0LiBBc3Qgd291bGQgbG9vayBsaWtlIHRoaXM6Cj4gCj4gICAgc3RydWN0
IGFzdF9pMmNfY2hhbiB7Cj4gCXN0cnVjdCBkcm1faTJjX2FkYXB0ZXIgYWRhcHRlcjsKPiAJc3Ry
dWN0IGkyY19hbGdvX2JpdF9kYXRhIGJpdDsKPiAgICB9Owo+IAoKVGhlcmUgYXJlIGZldyBmbGF2
b3JzIG9mIHRoZXNlIGRyaXZlcnMuIEluIHNvbWUgb2YgdGhlbQp0aGUgaTJjX2FkYXB0ZXIgZm9y
IGRkYyBpcyBhbGxvY2F0ZWQgYW5kIGluaXRpYWxpemVkIGJ5CnRoZSBkcml2ZXIsIHdoaWNoIG11
c3QgcHJvdmlkZSBhIHBsYWNlIGluIG1lbW9yeSB0byBob2xkCnRoZSBhZGFwdGVyLiBhc3QgaXMg
YW4gZXhhbXBsZSBvZiB0aGlzIGFwcHJvYWNoLgoKQnV0IHRoZXJlIGFyZSBvdGhlcnMsIHN1Y2gg
YXMgZm9yIGV4YW1wbGUgZXh5bm9zX2hkbWkuYy4KSXQgZ2V0cyBpdHMgZGRjIGFkYXB0ZXIgd2l0
aCBvZl9maW5kX2kyY19hZGFwdGVyX2J5X25vZGUoKQphbmQgbWVyZWx5IHN0b3JlcyBhIHBvaW50
ZXIgdG8gaXQsIHdoaWxlIG5vdCBtYW5hZ2luZyB0aGUKbWVtb3J5IG5lZWRlZCB0byBob2xkIHRo
ZSBpMmNfYWRhcHRlci4KCkRvIHlvdSBoYXZlIGFueSBpZGVhIGhvdyB0byBhY2NvbW1vZGF0ZSB0
aGVzZSB2YXJpb3VzCmZsYXZvcnMgb2YgZHJpdmVycyBpbiB0aGUgc2NoZW1lIHlvdSBwcm9wb3Nl
PwoKQW5kcnplagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
