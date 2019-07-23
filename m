Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B825171B6E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 17:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F03789CF7;
	Tue, 23 Jul 2019 15:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935E89C53;
 Tue, 23 Jul 2019 15:19:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 54655200D5;
 Tue, 23 Jul 2019 17:19:41 +0200 (CEST)
Date: Tue, 23 Jul 2019 17:19:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
Message-ID: <20190723151939.GA13718@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
 <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QX4gbG5DAAAA:8
 a=6mu-9OIm9KcVJ4iDVDwA:9 a=wPNLvfGTeEIA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmVqLgoKT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6NDQ6NTBQTSArMDIwMCwgQW5k
cnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IEhpIFNhbSwKPiAKPiBXIGRuaXUgMjMuMDcuMjAx
OSBvwqAxMTowNSwgU2FtIFJhdm5ib3JnIHBpc3plOgo+ID4gSGkgQW5kcnplago+ID4gCj4gPiBP
biBUaHUsIEp1bCAxMSwgMjAxOSBhdCAwMToyNjo0MVBNICswMjAwLCBBbmRyemVqIFBpZXRyYXNp
ZXdpY3ogd3JvdGU6Cj4gPiA+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdl
bmVyaWMgY29ubmVjdG9yLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0
cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMgfCAxICsKPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMv
dGlsY2RjX3RmcDQxMC5jCj4gPiA+IGluZGV4IDYyZDAxNGMyMDk4OC4uYzM3M2VkYjk1NjY2IDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwo+ID4gPiBA
QCAtMjE5LDYgKzIxOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdGZwNDEwX2Nv
bm5lY3Rvcl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4gICAJdGZwNDEwX2Nv
bm5lY3Rvci0+bW9kID0gbW9kOwo+ID4gPiAgIAljb25uZWN0b3IgPSAmdGZwNDEwX2Nvbm5lY3Rv
ci0+YmFzZTsKPiA+ID4gKwljb25uZWN0b3ItPmRkYyA9IG1vZC0+aTJjOwo+ID4gPiAgIAlkcm1f
Y29ubmVjdG9yX2luaXQoZGV2LCBjb25uZWN0b3IsICZ0ZnA0MTBfY29ubmVjdG9yX2Z1bmNzLAo+
ID4gPiAgIAkJCURSTV9NT0RFX0NPTk5FQ1RPUl9EVklEKTsKPiA+IAo+ID4gV2hlbiByZWFkaW5n
IHRoaXMgY29kZSwgaXQgbG9va3Mgc3RyYW5nZSB0aGF0IHdlIHNldCBjb25uZWN0b3ItPmRkYwo+
ID4gKmJlZm9yZSogdGhlIGNhbGwgdG8gaW5pdCB0aGUgY29ubmVjdG9yLgo+ID4gT25lIGNvdWxk
IHJpc2sgdGhhdCBkcm1fY29ubmVjdG9yX2luaXQoKSB1c2VkIG1lbXNldCguLikgdG8gY2xlYXIg
YWxsCj4gPiBmaWVsZHMgb3Igc28sIGFuZCBpdCB3b3VsZCBicmVhayB0aGlzIG9yZGVyLgo+IAo+
IEkgdmVyaWZpZWQgdGhlIGNvZGUgb2YgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgYW5kIGNhbm5vdCBm
aW5kIGFueSBtZW1zZXQoKQo+IGludm9jYXRpb25zIHRoZXJlLiBXaGF0IGlzIHlvdXIgYWN0dWFs
IGNvbmNlcm4/Ck15IGNvbmNlcm4gaXMgdGhhdCBkcm1fY29ubmVjdG9yX2luaXQoKSBtYXliZSBz
b21ldGltZSBpbiB0aGUgZnV0dXJlCndpbGwgaW5pdCBhbGwgZmlsZWRzIGluIGRybV9jb25uZWN0
b3IsIHNvIHdlIGxvb3NlIGFueSBhc3NpbmdtZW50cwpkb25lIHRvIGRybV9jb25uZWN0b3IgZnJv
bSAqYmVmb3JlKiB3ZSBjYWxsZWQgdGhlIGluaXQgZnVuY3Rpb24uCgpNb3ZpbmcgdGhlIGFzc2ln
bm1lbnQgdG8gYWZ0ZXIgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgd291bGQgbm90CmxldCB1cyBkZXBl
bmQgb24gdGhlIGFjdHVhbCBpbXBsbWVudGF0aW9uIG9mIGRybV9jb25uZWN0b3JfaW5pdCgpLgoK
CVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
