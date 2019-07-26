Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BB87724B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 21:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275296EE4C;
	Fri, 26 Jul 2019 19:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD4B6EE48;
 Fri, 26 Jul 2019 19:42:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2CA2928C2D3
Subject: Re: [PATCH v6 22/24] drm/amdgpu: Provide ddc symlink in connector
 sysfs directory
To: Alex Deucher <alexdeucher@gmail.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <7fee0fa0d0f77af6595d283d5f3ae5d551475821.1564161140.git.andrzej.p@collabora.com>
 <CADnq5_O1B59Q+68fJgtf_bn_=WQ9yrVPq-V5tL1VQ3+vzgf1Zw@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <038809c7-e664-e365-a778-03bc11299193@collabora.com>
Date: Fri, 26 Jul 2019 21:42:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_O1B59Q+68fJgtf_bn_=WQ9yrVPq-V5tL1VQ3+vzgf1Zw@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCgpXIGRuaXUgMjYuMDcuMjAxOSBvwqAyMToyOCwgQWxleCBEZXVjaGVyIHBpc3pl
Ogo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDE6MjggUE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6
Cj4gPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4KPj4gVXNlIHRoZSBkZGMgcG9p
bnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gCj4g
Tm90ZSB0aGF0IHRoaXMgb25seSBjb3ZlcnMgdGhlIGxlZ2FjeSBkaXNwbGF5IGNvZGUuICBUaGUg
bmV3IERDCj4gZGlzcGxheSBjb2RlIGFsc28gbmVlZHMgdG8gYmUgY29udmVydGVkLiAgU2VlOgo+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwoK
SW4gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0KCkgdGhlIGRkYyBpcyAmaTJjLT5iYXNlLCBpcyBp
dD8KCkJ1dCBpdCBpcyBub3QgY2xlYXIgdG8gbWUgaG93IGNhbiBJIGZpbmQgZGRjIHBvaW50ZXIg
aW4KZG1fZHBfYWRkX21zdF9jb25uZWN0b3IoKT8KCkFuZHJ6ZWoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
