Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283187BE83
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 12:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E511F89C7F;
	Wed, 31 Jul 2019 10:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D06089C61;
 Wed, 31 Jul 2019 10:40:18 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E4FE120020;
 Wed, 31 Jul 2019 12:40:08 +0200 (CEST)
Date: Wed, 31 Jul 2019 12:40:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: Review required [Was: Associate ddc adapters with connectors]
Message-ID: <20190731104007.GA23138@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org>
 <20190726185538.GD14981@ravnborg.org>
 <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=MKLiDCnLOtWFweQeVuoA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbC4KCk9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDEwOjAwOjE0QU0gKzAyMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+IEhpIFNhbSwKPiAKPiBPbiAyNi8wNy8yMDE5IDIwOjU1LCBTYW0g
UmF2bmJvcmcgd3JvdGU6Cj4gPiBIaSBhbGwuCj4gPiAKPiA+IEFuZHJ6ZWogaGF2ZSBkb25lIGEg
Z29vZCBqb2IgZm9sbG93aW5nIHVwIG9uIGZlZWRiYWNrIGFuZCB0aGlzIHNlcmllcyBpcwo+ID4g
bm93IHJlYWR5Lgo+ID4gCj4gPiBXZSBuZWVkIGFjayBvbiB0aGUgcGF0Y2hlcyB0b3VjaGluZyB0
aGUgaW5kaXZpZHVhbCBkcml2ZXJzIGJlZm9yZSB3ZSBjYW4KPiA+IHByb2NlZWQuCj4gPiBQbGVh
c2UgY2hlY2sgeW91ciBkcml2ZXJzIGFuZCBnZXQgYmFjay4KPiAKPiBJIGNhbiBhcHBseSBhbGwg
Y29yZSBhbmQgbWFpbnRhaW5lci1hY2tlZCBwYXRjaGVzIGZvciBub3cgOgo+IDEsIDIsIDcsIDEw
LCAxMSwgMTYsIDE3LCAxOCwgMTksIDIwLCAyMSwgMjIsIDIzCj4gCj4gYW5kIEFuZHJ6ZWogY2Fu
IHJlc2VuZCBub3QgYXBwbGllZCBwYXRjaGVzIHdpdGggWW91cnMgYW5kIEVtaWwncyBSZXZpZXdl
ZC1ieSwKPiBzbyB3ZSBjYW4gd2FpdCBhIGZldyBtb3JlIGRheXMgdG8gYXBwbHkgdGhlbS4KClNv
dW5kcyBsaWtlIGEgZ29vZCBwbGFuLgpUaGFua3MgZm9yIHRoYWtpbmcgY2FyZSBvZiB0aGlzLgoK
CVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
