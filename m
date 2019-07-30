Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8713B7AFF8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 19:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009246E5E7;
	Tue, 30 Jul 2019 17:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9D66E5E1;
 Tue, 30 Jul 2019 17:30:22 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 33CE92001E;
 Tue, 30 Jul 2019 19:30:09 +0200 (CEST)
Date: Tue, 30 Jul 2019 19:30:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 19/23] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
Message-ID: <20190730173007.GA28537@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <ec88a18feffa37eceb947bb83a6f9f51fb575566.1562843413.git.andrzej.p@collabora.com>
 <449b11e6-2386-4e5b-26f7-eb6046911f24@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <449b11e6-2386-4e5b-26f7-eb6046911f24@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=IpJZQVW2AAAA:8 a=qT0gNff0UeYBFpdrloAA:9 a=CjuIK1q_8ugA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=IawgGOuG5U0WyFbmm1f5:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbC4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6
ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgfCA0MCArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiA+IAouLi4KPiAK
PiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgoK
VGhlcmUgaXMgbm93IGEgbXVjaCBzaW1wbGVyIHY2IG9mIHRoaXMgcGF0Y2guCkNhcmUgdG8gdGFr
ZSBhIGxvb2sgYW5kIGFjay9yLWI/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
