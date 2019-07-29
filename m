Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60557879C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 10:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049A889CF7;
	Mon, 29 Jul 2019 08:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761889CF3;
 Mon, 29 Jul 2019 08:38:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 01:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; d="scan'208";a="190500548"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 01:38:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 02/24] drm: Add drm_connector_init() variant with ddc
In-Reply-To: <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p@collabora.com>
Date: Mon, 29 Jul 2019 11:42:43 +0300
Message-ID: <875znlp6yk.fsf@intel.com>
MIME-Version: 1.0
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
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNCBKdWwgMjAxOSwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29s
bGFib3JhLmNvbT4gd3JvdGU6Cj4gQWxsb3cgcGFzc2luZyBkZGMgYWRhcHRlciBwb2ludGVyIHRv
IHRoZSBpbml0IGZ1bmN0aW9uLiBFdmVuIGlmCj4gZHJtX2Nvbm5lY3Rvcl9pbml0KCkgc29tZXRp
bWUgaW4gdGhlIGZ1dHVyZSBkZWNpZGVzIHRvIGUuZy4gbWVtc2V0KCkgYWxsCj4gY29ubmVjdG9y
IGZpZWxkcyB0byB6ZXJvcywgdGhlIG5ld2x5IGFkZGVkIGZ1bmN0aW9uIGVuc3VyZXMgdGhhdCBh
dCBpdHMKPiBjb21wbGV0aW9uIHRoZSBkZGMgbWVtYmVyIG9mIGNvbm5lY3RvciBpcyBjb3JyZWN0
bHkgc2V0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVq
LnBAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5o
ICAgICB8ICA1ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gaW5kZXggMDY4ZDRiMDVmMWJlLi4wNmZiZmM0NGZiNDgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKPiBAQCAtMjk2LDYgKzI5NiwyNSBAQCBpbnQg
ZHJtX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIH0KPiAgRVhQT1JU
X1NZTUJPTChkcm1fY29ubmVjdG9yX2luaXQpOwo+ICAKPiAraW50IGRybV9jb25uZWN0b3JfaW5p
dF93aXRoX2RkYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICsJCQkJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwKPiArCQkJCWNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNz
ICpmdW5jcywKPiArCQkJCWludCBjb25uZWN0b3JfdHlwZSwKPiArCQkJCXN0cnVjdCBpMmNfYWRh
cHRlciAqZGRjKQoKUGxheWluZyB0aGUgZGV2aWwncyBhZHZvY2F0ZSBoZXJlIGEgYml0LiBXaGF0
IGlmIHlvdSBlbmQgdXAgYWRkaW5nCmFub3RoZXIgdGhpbmcgeW91IG5lZWQgdG8gaW5pdGlhbGl6
ZSBsaWtlIHRoaXM/IEFyZSB5b3UgZ29pbmcgdG8gbmVlZAp0aHJlZSBtb3JlIGZ1bmN0aW9ucyB0
byBhY2NvdW50IGZvciB0aGUgY29tYmluYXRpb25zPyBJbml0IHdpdGggZGRjLAp3aXRoIGZvbywg
d2l0aCBkZGMgYW5kIGZvbz8gU28gSSBnZW5lcmFsbHkgZnJvd24gdXBvbiBpbnRlcmZhY2VzIGxp
a2UKdGhpcy4KCklmIGV2ZXJ5b25lIHRoaW5rcyB0aGlzIGlzIHRoZSB3YXkgdG8gZ28sIEknbSBu
b3QgZ29pbmcgdG8gc3RhbmQgaW4gdGhlCndheSwgYnV0IHBlcnNvbmFsbHkgSSdkIHJhdGhlciBz
d2l0Y2ggb3ZlciBhbGwgb2YgaTkxNSB0byBhIG5ldyB2ZXJzaW9uCm9mIGRybV9jb25uZWN0b3Jf
aW5pdCgpIHRoYXQganVzdCB0YWtlcyBhbm90aGVyIHBhcmFtZXRlci4KCkJSLApKYW5pLgoKCj4g
K3sKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29u
bmVjdG9yLCBmdW5jcywgY29ubmVjdG9yX3R5cGUpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4g
cmV0Owo+ICsKPiArCS8qIHByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gc3lzZnMgKi8KPiArCWNvbm5l
Y3Rvci0+ZGRjID0gZGRjOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArRVhQT1JUX1NZTUJP
TChkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMpOwo+ICsKPiAgLyoqCj4gICAqIGRybV9jb25u
ZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkgLSBhdHRhY2ggZWRpZCBwcm9wZXJ0eS4KPiAgICog
QGNvbm5lY3RvcjogdGhlIGNvbm5lY3Rvcgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Y29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBpbmRleCAzM2E2ZmZm
ODVmZGIuLjkzN2ZkYTljMTM3NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVj
dG9yLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiBAQCAtMTQxMCw2ICsx
NDEwLDExIEBAIGludCBkcm1fY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
PiAgCQkgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKPiAgCQkgICAgICAg
Y29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLAo+ICAJCSAgICAgICBpbnQg
Y29ubmVjdG9yX3R5cGUpOwo+ICtpbnQgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gKwkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAo+ICsJCQkJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLAo+ICsJCQkJ
aW50IGNvbm5lY3Rvcl90eXBlLAo+ICsJCQkJc3RydWN0IGkyY19hZGFwdGVyICpkZGMpOwo+ICB2
b2lkIGRybV9jb25uZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3Rvcik7Cj4gIGludCBkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpOwo+ICB2b2lkIGRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcihz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwg
T3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
