Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CAE6025D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0900E6E42B;
	Fri,  5 Jul 2019 08:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010C6E421;
 Fri,  5 Jul 2019 08:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 88D8228627A
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <20190628161137.GH4779@pendragon.ideasonboard.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <44f98134-bc8a-133a-b702-589f007b175e@collabora.com>
Date: Fri, 5 Jul 2019 10:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628161137.GH4779@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
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
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDI4LjA2LjIwMTkgb8KgMTg6MTEsIExhdXJlbnQgUGluY2hhcnQgcGlzemU6Cj4gSGkg
QW5kcnplaiwKPiAKPiBKdXN0IEZZSSwgSSBoYXZlIGEgcGF0Y2ggc2VyaWVzIHRoYXQgcmV3b3Jr
cyBob3cgYnJpZGdlcyBhbmQgY29ubmVjdG9ycwo+IGFyZSBoYW5kbGVkLCBhbmQgaXQgd2lsbCBo
ZWF2aWx5IGNvbmZsaWN0IHdpdGggdGhpcy4gVGhlIHB1cnBvc2Ugb2YgdGhlCj4gdHdvIHNlcmll
cyBpc24ndCB0aGUgc2FtZSwgc28gYm90aCBtYWtlIHNlbnNlLiBJIHdpbGwgcG9zdCB0aGUgcGF0
Y2hlcwo+IHRoaXMgd2Vla2VuZCwgYW5kIHdpbGwgdGhlbiByZXZpZXcgdGhpcyBzZXJpZXMgaW4g
dGhhdCBjb250ZXh0Lgo+IEhvcGVmdWxseSB3ZSdsbCBnZXQgdGhlIGJlc3Qgb2YgYm90aCB3b3Js
ZHMgOi0pCgpIaSBMYXVyZW50LAoKRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHJldmlldyBteSBw
YXRjaCBzZXJpZXM/CgpBbmRyemVqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
