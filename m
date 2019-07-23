Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A78714A9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 11:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439F16E2C7;
	Tue, 23 Jul 2019 09:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525696E2BE;
 Tue, 23 Jul 2019 09:09:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C8327200B4;
 Tue, 23 Jul 2019 11:09:05 +0200 (CEST)
Date: Tue, 23 Jul 2019 11:09:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 17/23] drm/ast: Provide ddc symlink in connector sysfs
 directory
Message-ID: <20190723090904.GC787@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d3651bd2fd8ba69b8380304bca4c629a8c1da4e9.1562843413.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3651bd2fd8ba69b8380304bca4c629a8c1da4e9.1562843413.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=akpas9ZDeQi6sww-pK0A:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Enrico Weigelt <info@metux.net>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplai4KCk9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAxOjI2OjQ0UE0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBVc2UgdGhlIGRkYyBwb2ludGVyIHByb3ZpZGVk
IGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBp
ZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKPiBp
bmRleCBmZmNjYmVmOTYyYTQuLjFjYTliYzRhYTNiYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMKPiBAQCAtODkwLDYgKzg5MCwxMSBAQCBzdGF0aWMgaW50IGFzdF9jb25uZWN0b3JfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCWNvbm5l
Y3RvciA9ICZhc3RfY29ubmVjdG9yLT5iYXNlOwo+ICsJYXN0X2Nvbm5lY3Rvci0+aTJjID0gYXN0
X2kyY19jcmVhdGUoZGV2KTsKPiArCWlmICghYXN0X2Nvbm5lY3Rvci0+aTJjKQo+ICsJCURSTV9F
UlJPUigiZmFpbGVkIHRvIGFkZCBkZGMgYnVzIGZvciBjb25uZWN0b3JcbiIpOwo+ICsKPiArCWNv
bm5lY3Rvci0+ZGRjID0gJmFzdF9jb25uZWN0b3ItPmkyYy0+YWRhcHRlcjsKPiAgCWRybV9jb25u
ZWN0b3JfaW5pdChkZXYsIGNvbm5lY3RvciwgJmFzdF9jb25uZWN0b3JfZnVuY3MsIERSTV9NT0RF
X0NPTk5FQ1RPUl9WR0EpOwo+ICAKPiAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0
b3IsICZhc3RfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CkFnYWluLCBhc3NpZ25pbmcgYmVmb3Jl
IGRybV9jb25uZWN0b3JfaW5pdCgpLgpJIGRpZCBub3QgYXVkaXQgdGhlIHJlbWFpbmluZyBwYXRj
aGVzIC0geW91IGdvdCB0aGUgaWRlYS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
