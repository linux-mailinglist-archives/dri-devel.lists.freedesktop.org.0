Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666CC76068
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 10:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7926E8A4;
	Fri, 26 Jul 2019 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3489D6E89F;
 Fri, 26 Jul 2019 08:09:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1040C803BB;
 Fri, 26 Jul 2019 10:08:56 +0200 (CEST)
Date: Fri, 26 Jul 2019 10:08:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v5 01/24] drm: Include ddc adapter pointer in struct
 drm_connector
Message-ID: <20190726080855.GA9143@ravnborg.org>
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <e82d6aca4f8abc95834c8a36c101d153518bb1ac.1563960855.git.andrzej.p@collabora.com>
 <20190726063759.GB6443@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726063759.GB6443@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=hD80L64hAAAA:8 a=e5mUnYsNAAAA:8 a=qxXKUbxsVWwuiIGZjhEA:9
 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Paul <sean@poorly.run>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Dave Airlie <airlied@redhat.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
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

SGkgQW5kcnplai4KCkFmdGVyIHJlYWRpbmcgdGhyb3VnaCB0aGUgc2VyaWVzIGEgZmV3IG1vcmUg
Y29tbWVudHMuCgoxKSBUaGUgc3ViamVjdCBvZiB0aGlzIHBhdGNoIGNvdWxkIGJlIGltcHJvdmVk
LgogICBDb25zaWRlciBzb21ldGhpbmcgbGlrZToKICAgZHJtOiBhZGQgZGRjIGxpbmsgaW4gc3lz
ZnMgY3JlYXRlZCBieSBkcm1fY29ubmVjdG9yCgogICBUaGlzIHNwZWxscyBvdXQgbXVjaCBiZXR0
ZXIgd2hhdCB0aGUgcGF0Y2ggYWNoaWV2ZS4KCgoyKSBUaGUgcHVycHNvZSBvZiBkcm1fY29ubmVj
dG9yLmRkYyBpcyB0byBwcm92aWRlIGRybV9jb25uZWN0b3Igd2l0aAogICBpbmZvIHRvIGNyZWF0
ZSB0aGUgc3ltbGluay4KICAgWWV0IGluIG1hbnkgZm9sbG93LXVwIHBhdGNoZXMgdGhlIGRyaXZl
cnMgYXJlIGNoYW5nZWQgc28KICAgZHJtX2Nvbm5lY3Rvci5kZGMgaXMgdGhlaXIgb25seSByZWZl
cmVuY2UgdG8gc3RydWN0IGkyY19hZGFwdGVyLgoKICAgQnV0IHRoZSBvd25lcnNoaXAgaXMgbm90
IGNsZWFyIGhlcmUuCiAgIFdobyBvd25zIHRoZSByZWZlcmVuY2UgdG8gaTJjX2FkYXB0ZXIgLSBh
bmQgd2hvIGhhcyB0aGUKICAgcmVzcG9uc2liaWxpdHkgdG8gY2FsbCBwdXQoKSBvbiB0aGUgYWRh
cHRlci4KCiAgIExvb2tpbmcgYXQgdGhlIGNvbnZlcnNpb25zIGRvbmUgdGhlbiBzb21lIGRyaXZl
cnMgYXJlIGNvbnZlcnRlZAogICBzbyB0aGV5IG9ubHkgdXNlIGRybV9jb25uZWN0b3IuZGRjLCBh
bmQgb3RoZXIgZHJpdmVycyBoYXZlIHRoZWlyIG93bgogICByZWZlcmVuY2UgdG8gaTJjX2FkYXB0
ZXIuCiAgIFRoZSBsYXR0ZXIgbG9va3MgbGlrZSB0aGUgY29ycmVjdCBzb2x1dGlvbiBhcyB0aGUg
b3duZXJzaGlwIG9mIHRoZQogICByZWZlcmVuY2UgYmVsb25ncyB0byB0aGUgZHJpdmVyIGFuZCBu
b3QgZHJtX2Nvbm5lY3Rvci4KCiAgIEluIG90aGVyIHdvcmRzIC0gYSBjb252ZXJzaW9uIHdoZXJl
IHRoZSBkcml2ZXJzIG9ubHkgYXNzaWduZWQKICAgZHJtX2Nvbm5lY3Rvci5kZGMgKHVzaW5nIGRy
bV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpKSwKICAgc2VlbXMgbGlrZSBhIG1vcmUgY2xlYW4g
ZGVzaWduIHRoYXQgZG9lcyBub3QgbWl4IHVwIG93bmVyc2hpcC4KICAgVGhpcyBpcyBhdCBsZWFz
dCBob3cgSSBzZWUgaXQuCiAgIEkgZGlkIG5vdCB0YWtlIHRoaXMgdHlwZSBvZiBsb29rIGF0IHRo
ZSBwYXRjaGVzIGJlZm9yZS4gU29ycnkKICAgZm9yIHByb3ZpZGluZyBmZWVkYmFjayB0aGlzIGxh
dGUuCgoJU2FtCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwODozNzo1OUFNICswMjAwLCBTYW0g
UmF2bmJvcmcgd3JvdGU6Cj4gSGkgQW5kcnplai4KPiAKPiBQYXRjaCBsb29rcyBnb29kLCBidXQg
b25lIGtlcm5lbC1kb2MgZGV0YWlsLgo+IAo+IE9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDAzOjU5
OjIzUE0gKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+IEFkZCBnZW5lcmlj
IGNvZGUgd2hpY2ggY3JlYXRlcyBzeW1ib2xpYyBsaW5rcyBpbiBzeXNmcywgcG9pbnRpbmcgdG8g
ZGRjCj4gPiBpbnRlcmZhY2UgdXNlZCBieSBhIHBhcnRpY3VsYXIgdmlkZW8gb3V0cHV0LiBGb3Ig
ZXhhbXBsZToKPiA+IAo+ID4gbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRj
Cj4gPiBscnd4cnd4cnd4IDEgcm9vdCByb290IDAgSnVuIDI0IDEwOjQyIC9zeXMvY2xhc3MvZHJt
L2NhcmQwLUhETUktQS0xL2RkYyBcCj4gPiAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgwMDAwLmky
Yy9pMmMtMgo+ID4gCj4gPiBUaGlzIG1ha2VzIGl0IGVhc3kgZm9yIHVzZXIgdG8gYXNzb2NpYXRl
IGEgZGlzcGxheSB3aXRoIGl0cyBkZGMgYWRhcHRlcgo+ID4gYW5kIHVzZSBlLmcuIGRkY3V0aWwg
dG8gY29udHJvbCB0aGUgY2hvc2VuIG1vbml0b3IuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggYWRkcyBh
biBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdCBkcm1fY29ubmVjdG9yLiBQYXJ0aWN1bGFy
Cj4gPiBkcml2ZXJzIGNhbiB0aGVuIHVzZSBpdCBpbnN0ZWFkIG9mIHVzaW5nIHRoZWlyIG93biBw
cml2YXRlIGluc3RhbmNlLiBJZiBhCj4gPiBjb25uZWN0b3IgY29udGFpbnMgYSBkZGMsIHRoZW4g
Y3JlYXRlIGEgc3ltYm9saWMgbGluayBpbiBzeXNmcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
QW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiA+IEFja2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gUmV2aWV3ZWQt
Ynk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgfCAgOCArKysrKysrKwo+ID4gIGluY2x1ZGUvZHJtL2Ry
bV9jb25uZWN0b3IuaCB8IDExICsrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5
c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiA+IGluZGV4IGFkMTA4MTBiYzk3
Mi4uZTk2MmE5ZDQ1ZjdlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNm
cy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiA+IEBAIC0xNCw2ICsx
NCw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9l
eHBvcnQuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvZ2ZwLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4
L2kyYy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9rZGV2X3QuaD4KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+ID4gIAo+ID4gQEAgLTI5NCw2ICsyOTUsOSBAQCBpbnQgZHJtX3N5c2ZzX2Nv
bm5lY3Rvcl9hZGQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiA+ICAJLyogTGV0
IHVzZXJzcGFjZSBrbm93IHdlIGhhdmUgYSBuZXcgY29ubmVjdG9yICovCj4gPiAgCWRybV9zeXNm
c19ob3RwbHVnX2V2ZW50KGRldik7Cj4gPiAgCj4gPiArCWlmIChjb25uZWN0b3ItPmRkYykKPiA+
ICsJCXJldHVybiBzeXNmc19jcmVhdGVfbGluaygmY29ubmVjdG9yLT5rZGV2LT5rb2JqLAo+ID4g
KwkJCQkgJmNvbm5lY3Rvci0+ZGRjLT5kZXYua29iaiwgImRkYyIpOwo+ID4gIAlyZXR1cm4gMDsK
PiA+ICB9Cj4gPiAgCj4gPiBAQCAtMzAxLDYgKzMwNSwxMCBAQCB2b2lkIGRybV9zeXNmc19jb25u
ZWN0b3JfcmVtb3ZlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gPiAgewo+ID4g
IAlpZiAoIWNvbm5lY3Rvci0+a2RldikKPiA+ICAJCXJldHVybjsKPiA+ICsKPiA+ICsJaWYgKGNv
bm5lY3Rvci0+ZGRjKQo+ID4gKwkJc3lzZnNfcmVtb3ZlX2xpbmsoJmNvbm5lY3Rvci0+a2Rldi0+
a29iaiwgImRkYyIpOwo+ID4gKwo+ID4gIAlEUk1fREVCVUcoInJlbW92aW5nIFwiJXNcIiBmcm9t
IHN5c2ZzXG4iLAo+ID4gIAkJICBjb25uZWN0b3ItPm5hbWUpOwo+ID4gIAo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaAo+ID4gaW5kZXggNGMzMGQ3NTE0ODdhLi4zM2E2ZmZmODVmZGIgMTAwNjQ0Cj4gPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaAo+ID4gQEAgLTQxLDYgKzQxLDcgQEAgc3RydWN0IGRybV9wcm9wZXJ0eTsKPiA+
ICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2I7Cj4gPiAgc3RydWN0IGRybV9wcmludGVyOwo+ID4g
IHN0cnVjdCBlZGlkOwo+ID4gK3N0cnVjdCBpMmNfYWRhcHRlcjsKPiA+ICAKPiA+ICBlbnVtIGRy
bV9jb25uZWN0b3JfZm9yY2Ugewo+ID4gIAlEUk1fRk9SQ0VfVU5TUEVDSUZJRUQsCj4gPiBAQCAt
MTMxMSw2ICsxMzEyLDE2IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yIHsKPiA+ICAJICogWzBdOiBw
cm9ncmVzc2l2ZSwgWzFdOiBpbnRlcmxhY2VkCj4gPiAgCSAqLwo+ID4gIAlpbnQgYXVkaW9fbGF0
ZW5jeVsyXTsKPiA+ICsKPiA+ICsJLyoqCj4gPiArCSAqIEBkZGM6IGFzc29jaWF0ZWQgZGRjIGFk
YXB0ZXIuCj4gPiArCSAqIEEgY29ubmVjdG9yIHVzdWFsbHkgaGFzIGl0cyBhc3NvY2lhdGVkIGRk
YyBhZGFwdGVyLiBJZiBhIGRyaXZlciB1c2VzCj4gPiArCSAqIHRoaXMgZmllbGQsIHRoZW4gYW4g
YXBwcm9wcmlhdGUgc3ltYm9saWMgbGluayBpcyBjcmVhdGVkIGluIGNvbm5lY3Rvcgo+ID4gKwkg
KiBzeXNmcyBkaXJlY3RvcnkgdG8gbWFrZSBpdCBlYXN5IGZvciB0aGUgdXNlciB0byB0ZWxsIHdo
aWNoIGkyYwo+ID4gKwkgKiBhZGFwdGVyIGlzIGZvciBhIHBhcnRpY3VsYXIgZGlzcGxheS4KPiA+
ICsJICovCj4gPiArCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwo+IAo+IFRvIGhlbHAgdGhlIHJl
YWRlciBjb3VsZCB5b3UgYWRkIGluIHRoZSBhYm92ZSBhIHJlZmVyZW5jZSB0bwo+IGRybV9jb25u
ZWN0b3JfaW5pdF93aXRoX2RkYygpIHNwIHRoZSByZWFkZXIgaXMgdG9sZCBob3cgdG8gaW5pdCB0
aGlzCj4gZmllbGQuCj4gCj4gRWl0aGVyIGFkZCBpdCBpbiBQQVRDSCAyIC0gb3IgbWVyZ2UgcGF0
Y2ggMSBhbmQgMi4KPiAKPiAJU2FtCj4gCj4gPiArCj4gPiAgCS8qKgo+ID4gIAkgKiBAbnVsbF9l
ZGlkX2NvdW50ZXI6IHRyYWNrIHNpbmtzIHRoYXQgZ2l2ZSB1cyBhbGwgemVyb3MgZm9yIHRoZSBF
RElELgo+ID4gIAkgKiBOZWVkZWQgdG8gd29ya2Fyb3VuZCBzb21lIEhXIGJ1Z3Mgd2hlcmUgd2Ug
Z2V0IGFsbCAwcwo+ID4gLS0gCj4gPiAyLjE3LjEKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
