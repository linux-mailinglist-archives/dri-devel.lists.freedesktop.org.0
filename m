Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008580ACC
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 14:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FF189F63;
	Sun,  4 Aug 2019 12:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F59D89F5F;
 Sun,  4 Aug 2019 12:04:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91C9ECC;
 Sun,  4 Aug 2019 14:04:38 +0200 (CEST)
Date: Sun, 4 Aug 2019 15:04:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6 01/24] drm: Add ddc link in sysfs created by
 drm_connector
Message-ID: <20190804120437.GB4984@pendragon.ideasonboard.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <d470def6cd661b777faeee67b5838a4623c4010e.1564161140.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d470def6cd661b777faeee67b5838a4623c4010e.1564161140.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564920278;
 bh=2SwOpdn+JsWJJ3YIUkfnJDRn8tRwvwWSqCNnPU/obLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2qrSDC4m+7linuh4U0tX4WoTZLFLbWRikNUExG6T9mFEmXNNOgQ6bdB98G52bGcP
 b1qK/sMG06Mg9KraeCPnsSRfKXGEgIfbHXSwjDSiMkTDA4/z/LMPkVy6upg6msNkM0
 Y/l4WVpFHToSRb14NgmDlrX6OGlG9rTwrzLOXtUM=
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, linux-samsung-soc@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLCBhbmQgc29ycnkgZm9yIHRoZSBs
YXRlIHJldmlldyAoSSd2ZSBiZWVuCnRyYXZlbGxpbmcgZm9yIHRoZSBwYXN0IGZldyB3ZWVrcyku
CgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwNzoyMjo1NVBNICswMjAwLCBBbmRyemVqIFBpZXRy
YXNpZXdpY3ogd3JvdGU6Cj4gQWRkIGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGlj
IGxpbmtzIGluIHN5c2ZzLCBwb2ludGluZyB0byBkZGMKPiBpbnRlcmZhY2UgdXNlZCBieSBhIHBh
cnRpY3VsYXIgdmlkZW8gb3V0cHV0LiBGb3IgZXhhbXBsZToKPiAKPiBscyAtbCAvc3lzL2NsYXNz
L2RybS9jYXJkMC1IRE1JLUEtMS9kZGMKPiBscnd4cnd4cnd4IDEgcm9vdCByb290IDAgSnVuIDI0
IDEwOjQyIC9zeXMvY2xhc3MvZHJtL2NhcmQwLUhETUktQS0xL2RkYyBcCj4gCS0+IC4uLy4uLy4u
Ly4uL3NvYy8xMzg4MDAwMC5pMmMvaTJjLTIKPiAKPiBUaGlzIG1ha2VzIGl0IGVhc3kgZm9yIHVz
ZXIgdG8gYXNzb2NpYXRlIGEgZGlzcGxheSB3aXRoIGl0cyBkZGMgYWRhcHRlcgo+IGFuZCB1c2Ug
ZS5nLiBkZGN1dGlsIHRvIGNvbnRyb2wgdGhlIGNob3NlbiBtb25pdG9yLgo+IAo+IFRoaXMgcGF0
Y2ggYWRkcyBhbiBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdCBkcm1fY29ubmVjdG9yLiBQ
YXJ0aWN1bGFyCj4gZHJpdmVycyBjYW4gdGhlbiB1c2UgaXQgaW5zdGVhZCBvZiB1c2luZyB0aGVp
ciBvd24gcHJpdmF0ZSBpbnN0YW5jZS4gSWYgYQo+IGNvbm5lY3RvciBjb250YWlucyBhIGRkYywg
dGhlbiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIGluIHN5c2ZzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gQWNrZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gUmV2aWV3ZWQtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fc3lzZnMuYyB8ICA4ICsrKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaCB8IDExICsrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBpbmRleCBhZDEwODEwYmM5NzIuLmU5NjJhOWQ0NWY3ZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBAQCAtMTQsNiArMTQsNyBAQAo+ICAjaW5jbHVkZSA8bGlu
dXgvZXJyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2dmcC5oPgo+ICsjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZGV2
X3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgCj4gQEAgLTI5NCw2ICsyOTUsOSBA
QCBpbnQgZHJtX3N5c2ZzX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcikKPiAgCS8qIExldCB1c2Vyc3BhY2Uga25vdyB3ZSBoYXZlIGEgbmV3IGNvbm5lY3RvciAq
Lwo+ICAJZHJtX3N5c2ZzX2hvdHBsdWdfZXZlbnQoZGV2KTsKPiAgCj4gKwlpZiAoY29ubmVjdG9y
LT5kZGMpCj4gKwkJcmV0dXJuIHN5c2ZzX2NyZWF0ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtv
YmosCj4gKwkJCQkgJmNvbm5lY3Rvci0+ZGRjLT5kZXYua29iaiwgImRkYyIpOwo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gQEAgLTMwMSw2ICszMDUsMTAgQEAgdm9pZCBkcm1fc3lzZnNfY29ubmVj
dG9yX3JlbW92ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICB7Cj4gIAlpZiAo
IWNvbm5lY3Rvci0+a2RldikKPiAgCQlyZXR1cm47Cj4gKwo+ICsJaWYgKGNvbm5lY3Rvci0+ZGRj
KQo+ICsJCXN5c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtvYmosICJkZGMiKTsK
PiArCj4gIAlEUk1fREVCVUcoInJlbW92aW5nIFwiJXNcIiBmcm9tIHN5c2ZzXG4iLAo+ICAJCSAg
Y29ubmVjdG9yLT5uYW1lKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25u
ZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IDRjMzBkNzUxNDg3
YS4uMzNhNmZmZjg1ZmRiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC00MSw2ICs0MSw3IEBA
IHN0cnVjdCBkcm1fcHJvcGVydHk7Cj4gIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYjsKPiAgc3Ry
dWN0IGRybV9wcmludGVyOwo+ICBzdHJ1Y3QgZWRpZDsKPiArc3RydWN0IGkyY19hZGFwdGVyOwo+
ICAKPiAgZW51bSBkcm1fY29ubmVjdG9yX2ZvcmNlIHsKPiAgCURSTV9GT1JDRV9VTlNQRUNJRklF
RCwKPiBAQCAtMTMxMSw2ICsxMzEyLDE2IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKPiAgCSAq
IFswXTogcHJvZ3Jlc3NpdmUsIFsxXTogaW50ZXJsYWNlZAo+ICAJICovCj4gIAlpbnQgYXVkaW9f
bGF0ZW5jeVsyXTsKPiArCj4gKwkvKioKPiArCSAqIEBkZGM6IGFzc29jaWF0ZWQgZGRjIGFkYXB0
ZXIuCj4gKwkgKiBBIGNvbm5lY3RvciB1c3VhbGx5IGhhcyBpdHMgYXNzb2NpYXRlZCBkZGMgYWRh
cHRlci4gSWYgYSBkcml2ZXIgdXNlcwo+ICsJICogdGhpcyBmaWVsZCwgdGhlbiBhbiBhcHByb3By
aWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgaW4gY29ubmVjdG9yCj4gKwkgKiBzeXNmcyBk
aXJlY3RvcnkgdG8gbWFrZSBpdCBlYXN5IGZvciB0aGUgdXNlciB0byB0ZWxsIHdoaWNoIGkyYwo+
ICsJICogYWRhcHRlciBpcyBmb3IgYSBwYXJ0aWN1bGFyIGRpc3BsYXkuCgpUaGUgZmlyc3Qgc2Vu
dGVuY2UgaXNuJ3QgdmVyeSBjbGVhci4gVGhlIHJlc3QgaXMgbWl4aW5nICJkZGMgYWRhcHRlciIK
YW5kICJpMmMgYWRhcHRlciIuIEhvdyBhYm91dCB0aGUgZm9sbG93aW5nID8KCiJXaGVuIHRoZSBj
b25uZWN0b3IgY2FycmllcyBEREMgc2lnbmFscywgdGhpcyBmaWVsZCBwb2ludHMgdG8gdGhlIEky
QwphZGFwdGVyIGNvbm5lY3RlZCB0byB0aGUgRERDIHNpZ25hbHMsIGlmIGFueS4gV2hlbiB0aGlz
IGZpZWxkIGlzIG5vdApOVUxMIGEgc3ltYm9saWMgbGluayBpcyBjcmVhdGVkIGluIHRoZSBjb25u
ZWN0b3IncyBzeXNmcyBkaXJlY3RvcnkgdG8KZXhwb3NlIHRoZSBJMkMgYWRhcHRlciB1c2VkIGJ5
IHRoZSBjb25uZWN0b3IuIgoKU2hvdWxkIHdlIGFsc28gbWVudGlvbiB0aGF0IHRoZSBmaWVsZCBp
c24ndCBtZWFudCB0byBiZSBzZXQgZGlyZWN0bHksCmJ1dCBzaGFsbCBiZSBzZXQgd2l0aCBkcm1f
Y29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSA/CgoiVGhpcyBmaWVsZCBzaGFsbCBub3QgYmUgc2V0
IGRpcmVjdGx5IGJ5IGRyaXZlcnMsIHVzZQpkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBp
bnN0ZWFkLiIKCkknbSBhbHNvIHNsaWdodGx5IGNvbmNlcm5lZCBhYm91dCB0aGUgbGlmZXRpbWUg
b2YgdGhpcyBwb2ludGVyLCBhbmQgd2hhdAp3b3VsZCBoYXBwZW4gaWYgdGhlIEkyQyBhZGFwdGVy
IGRpc2FwcGVhcnMgd2hpbGUgdGhlIGNvbm5lY3RvciBpcyBzdGlsbApleHBvc2VkIHRvIHVzZXJz
cGFjZSwgYnV0IEkgc3VwcG9zZSB0aGlzIGlzbid0IGEgbmV3IGlzc3VlLCBleGlzdGluZwpjb2Rl
IGxpa2VseSBzdWZmZXJzIGZyb20gdGhpcy4KCldpdGggdGhlIHVwZGF0ZWQgZG9jdW1lbnRhdGlv
biwKClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cgo+ICsJICovCj4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKPiArCj4g
IAkvKioKPiAgCSAqIEBudWxsX2VkaWRfY291bnRlcjogdHJhY2sgc2lua3MgdGhhdCBnaXZlIHVz
IGFsbCB6ZXJvcyBmb3IgdGhlIEVESUQuCj4gIAkgKiBOZWVkZWQgdG8gd29ya2Fyb3VuZCBzb21l
IEhXIGJ1Z3Mgd2hlcmUgd2UgZ2V0IGFsbCAwcwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
