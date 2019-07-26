Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D99771B2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 20:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F3C6EE32;
	Fri, 26 Jul 2019 18:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5450B6EE30;
 Fri, 26 Jul 2019 18:55:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CB69020127;
 Fri, 26 Jul 2019 20:55:39 +0200 (CEST)
Date: Fri, 26 Jul 2019 20:55:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Review required [Was: Associate ddc adapters with connectors]
Message-ID: <20190726185538.GD14981@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726183520.GA22572@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=nTBMXhx45H-Va90dJ2EA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
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

SGkgYWxsLgoKQW5kcnplaiBoYXZlIGRvbmUgYSBnb29kIGpvYiBmb2xsb3dpbmcgdXAgb24gZmVl
ZGJhY2sgYW5kIHRoaXMgc2VyaWVzIGlzCm5vdyByZWFkeS4KCldlIG5lZWQgYWNrIG9uIHRoZSBw
YXRjaGVzIHRvdWNoaW5nIHRoZSBpbmRpdmlkdWFsIGRyaXZlcnMgYmVmb3JlIHdlIGNhbgpwcm9j
ZWVkLgpQbGVhc2UgY2hlY2sgeW91ciBkcml2ZXJzIGFuZCBnZXQgYmFjay4KCglTYW0KCj4gSGkg
QW5kZXplai4KPiAKPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwNzoyMjo1NFBNICswMjAwLCBB
bmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4gPiBJdCBpcyBkaWZmaWN1bHQgZm9yIGEgdXNl
ciB0byBrbm93IHdoaWNoIG9mIHRoZSBpMmMgYWRhcHRlcnMgaXMgZm9yIHdoaWNoCj4gPiBkcm0g
Y29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhpcyBwcm9ibGVtLgo+ID4gCj4gPiBU
aGUgaWRlYSBpcyB0byBoYXZlIGEgc3ltYm9saWMgbGluayBpbiBjb25uZWN0b3IncyBzeXNmcyBk
aXJlY3RvcnksIGUuZy46Cj4gPiAKPiA+IGxzIC1sIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUkt
QS0xL2RkYwo+ID4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2Ns
YXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAo+ID4gCS0+IC4uLy4uLy4uLy4uL3NvYy8xMzg4
MDAwMC5pMmMvaTJjLTIKPiA+IAo+ID4gVGhlIHVzZXIgdGhlbiBrbm93cyB0aGF0IHRoZWlyIGNh
cmQwLUhETUktQS0xIHVzZXMgaTJjLTIgYW5kIGNhbiBlLmcuIHJ1bgo+ID4gZGRjdXRpbDoKPiA+
IAo+ID4gZGRjdXRpbCAtYiAyIGdldHZjcCAweDEwCj4gPiBWQ1AgY29kZSAweDEwIChCcmlnaHRu
ZXNzKTogY3VycmVudCB2YWx1ZSA9ICAgIDkwLCBtYXggdmFsdWUgPSAgIDEwMAo+ID4gCj4gPiBU
aGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcyBhZGRzIHN0cnVjdCBpMmNfYWRhcHRlciBwb2lu
dGVyIHRvIHN0cnVjdAo+ID4gZHJtX2Nvbm5lY3Rvci4gSWYgdGhlIGZpZWxkIGlzIHVzZWQgYnkg
YSBwYXJ0aWN1bGFyIGRyaXZlciwgdGhlbiBhbgo+ID4gYXBwcm9wcmlhdGUgc3ltYm9saWMgbGlu
ayBpcyBjcmVhdGVkIGJ5IHRoZSBnZW5lcmljIGNvZGUsIHdoaWNoIGlzIGFsc28gYWRkZWQKPiA+
IGJ5IHRoaXMgcGF0Y2guCj4gPiAKPiA+IFBhdGNoIDIgYWRkcyBhIG5ldyB2YXJpYW50IG9mIGRy
bV9jb25uZWN0b3JfaW5pdCgpLCBzZWUgdGhlIGNoYW5nZWxvZwo+ID4gYmVsb3cuCj4gPiAKPiA+
IFBhdGNoZXMgMy4uMjQgYXJlIGV4YW1wbGVzIG9mIGhvdyB0byBjb252ZXJ0IGEgZHJpdmVyIHRv
IHRoaXMgbmV3IHNjaGVtZS4KPiA+IAo+IC4uLgo+ID4gCj4gPiB2NS4udjY6Cj4gPiAKPiA+IC0g
aW1wcm92ZWQgc3ViamVjdCBsaW5lIG9mIHBhdGNoIDEKPiA+IC0gYWRkZWQga2VybmVsLWRvYyBm
b3IgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkKPiA+IC0gaW1wcm92ZWQga2VybmVsLWRv
YyBmb3IgdGhlIGRkYyBmaWVsZCBvZiBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+ID4gLSBhZGRlZCBS
ZXZpZXdlZC1ieSBpbiBwYXRjaGVzIDE3IGFuZCAxOAo+ID4gLSBhZGRlZCBBY2tlZC1ieSBpbiBw
YXRjaCAyCj4gPiAtIG1hZGUgdGhlIG93bmVyc2hpcCBvZiBkZGMgaTJjX2FkYXB0ZXIgZXhwbGlj
aXQgaW4gYWxsIHBhdGNoZXMsCj4gPiB0aGlzIG1hZGUgdGhlIGFmZmVjdGVkIHBhdGNoZXMgbXVj
aCBzaW1wbGVyCj4gCj4gTG9va3MgZ29vZCBub3cuCj4gUGF0Y2ggMSBhbmQgMiBhcmU6Cj4gUmV2
aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAKPiBUaGUgcmVtYWlu
aW5nIHBhdGNoZXMgYXJlOgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4gCj4gCVNhbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
