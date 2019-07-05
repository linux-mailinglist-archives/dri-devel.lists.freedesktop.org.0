Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42D60254
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6506E424;
	Fri,  5 Jul 2019 08:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838196E421;
 Fri,  5 Jul 2019 08:39:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DADF324B;
 Fri,  5 Jul 2019 10:39:54 +0200 (CEST)
Date: Fri, 5 Jul 2019 11:39:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 00/22] Associate ddc adapters with connectors
Message-ID: <20190705083934.GB4994@pendragon.ideasonboard.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <20190628161137.GH4779@pendragon.ideasonboard.com>
 <44f98134-bc8a-133a-b702-589f007b175e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44f98134-bc8a-133a-b702-589f007b175e@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562315995;
 bh=USKu7A4PWilgTTdXdxKtoXPECYgfrGM8DlEj3pQAAto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1pwwLHVR/7eXdMJTO0WkEhUPtQkbyKj4lTdqiGuGovVQhxKvRxa7vEFFHzwMxUzs
 KX9kqTU82CYRsTLJToik+vtuoqGa2AcS0KkMZZSIIaakDJZZeoZQPm4UvzcK9CQVWb
 N0LtHMV3M7CG297W0BtkxJNNTlmHsl9sFp/OidcE=
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDEwOjM4OjI3QU0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBXIGRuaXUgMjguMDYuMjAxOSBvwqAxODoxMSwg
TGF1cmVudCBQaW5jaGFydCBwaXN6ZToKPiA+IEhpIEFuZHJ6ZWosCj4gPiAKPiA+IEp1c3QgRllJ
LCBJIGhhdmUgYSBwYXRjaCBzZXJpZXMgdGhhdCByZXdvcmtzIGhvdyBicmlkZ2VzIGFuZCBjb25u
ZWN0b3JzCj4gPiBhcmUgaGFuZGxlZCwgYW5kIGl0IHdpbGwgaGVhdmlseSBjb25mbGljdCB3aXRo
IHRoaXMuIFRoZSBwdXJwb3NlIG9mIHRoZQo+ID4gdHdvIHNlcmllcyBpc24ndCB0aGUgc2FtZSwg
c28gYm90aCBtYWtlIHNlbnNlLiBJIHdpbGwgcG9zdCB0aGUgcGF0Y2hlcwo+ID4gdGhpcyB3ZWVr
ZW5kLCBhbmQgd2lsbCB0aGVuIHJldmlldyB0aGlzIHNlcmllcyBpbiB0aGF0IGNvbnRleHQuCj4g
PiBIb3BlZnVsbHkgd2UnbGwgZ2V0IHRoZSBiZXN0IG9mIGJvdGggd29ybGRzIDotKQo+IAo+IEhp
IExhdXJlbnQsCj4gCj4gRGlkIHlvdSBoYXZlIGEgY2hhbmNlIHRvIHJldmlldyBteSBwYXRjaCBz
ZXJpZXM/CgpOb3QgeWV0IEknbSBhZnJhaWQuIEkndmUgYmVlbiBmYWlybHkgYnVzeSB0aGlzIHdl
ZWssIGFuZCBjb3VwbGVkIHdpdGgKc29tZSBoZWFsdGggaXNzdWVzIChidXQgSSdtIGZlZWxpbmcg
YmV0dGVyIG5vdywgc28gbm90aGluZyB0byB3b3JyeQphYm91dCkgaXQgZGVsYXllZCBteSByZXZp
ZXdzLiBJJ2xsIGdldCB0byBpdCBhcyBzb29uIGFzIHBvc3NpYmxlLiBUaGFuawp5b3UgZm9yIHBp
bmdpbmcgbWUuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
