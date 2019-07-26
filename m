Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DA78610
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6379F89C93;
	Mon, 29 Jul 2019 07:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs36.siol.net [185.57.226.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDAB6EE3E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 19:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 69D62522FAD;
 Fri, 26 Jul 2019 21:19:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id yannSpSAHOqL; Fri, 26 Jul 2019 21:19:06 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id B632A522FAA;
 Fri, 26 Jul 2019 21:19:05 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-11-237.cable.triera.net
 [194.152.11.237]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id A3E9D522FA9;
 Fri, 26 Jul 2019 21:18:59 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6 20/24] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
Date: Fri, 26 Jul 2019 21:18:58 +0200
Message-ID: <2759414.3aNxrjZxYY@jernej-laptop>
In-Reply-To: <4bcf0f154c683c9787fa34f911ebc52de6b4a7a1.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <4bcf0f154c683c9787fa34f911ebc52de6b4a7a1.1564161140.git.andrzej.p@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: , Sam Ravnborg <sam@ravnborg.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	Douglas Anderson <dianders@chromium.org>,
	Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	kernel@collabora.com, linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
	Vincent Abriou <vincent.abriou@st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, x.intel.com@freedesktop.org,
	Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
	intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Alexios Zavras <alexios.zavras@intel.com>,
	Mamta Shukla <mamtashukla555@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Enrico Weigelt <info@metux.net>, amd-gfx@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
	Todor Tomov <todor.tomov@linaro.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Huang Rui <ray.huang@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgcGV0ZWssIDI2LiBqdWxpaiAyMDE5IG9iIDE5OjIzOjE0IENFU1QgamUgQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IApuYXBpc2FsKGEpOgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlk
ZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWog
UGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpBY2tlZC1ieTogSmVybmVq
IFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKVGhhbmtzIQoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
IGluZGV4Cj4gMjE4YTdiMjMwOGY3Li44M2I5NGI2NmU0NjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0yMjAwLDggKzIyMDAsMTAgQEAgc3Rh
dGljIGludCBkd19oZG1pX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UKPiAqYnJpZGdl
KQo+IAo+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgCiZkd19oZG1pX2Nv
bm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+IAo+IC0JZHJtX2Nvbm5lY3Rvcl9pbml0KGJyaWRnZS0+
ZGV2LCBjb25uZWN0b3IsIAomZHdfaGRtaV9jb25uZWN0b3JfZnVuY3MsCj4gLQkJCSAgIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSk7Cj4gKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoYnJp
ZGdlLT5kZXYsIGNvbm5lY3RvciwKPiArCQkJCSAgICAmZHdfaGRtaV9jb25uZWN0b3JfZnVuY3Ms
Cj4gKwkJCQkgICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAo+ICsJCQkJICAgIGhkbWktPmRk
Yyk7Cj4gCj4gIAlkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2Rl
cik7CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
