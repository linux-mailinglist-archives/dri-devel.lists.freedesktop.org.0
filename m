Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A880AE3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 14:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B22F6E1F6;
	Sun,  4 Aug 2019 12:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1343 seconds by postgrey-1.36 at gabe;
 Sun, 04 Aug 2019 12:27:07 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7586E1F2;
 Sun,  4 Aug 2019 12:27:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F19499B;
 Sun,  4 Aug 2019 14:27:05 +0200 (CEST)
Date: Sun, 4 Aug 2019 15:27:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6 01/24] drm: Add ddc link in sysfs created by
 drm_connector
Message-ID: <20190804122704.GC4984@pendragon.ideasonboard.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <d470def6cd661b777faeee67b5838a4623c4010e.1564161140.git.andrzej.p@collabora.com>
 <20190804120437.GB4984@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804120437.GB4984@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564921625;
 bh=TTcZ5zxHoEJlFyD4sUupeUJV7D7H8MNtMjjpLdb9sFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hLm16nBryxA3xsFc/9Y3E16EUjRZl+9oMozO9kxU25Prw9S8EhS7a2odqbTMoTOjC
 lv/qqxj0rg0W/AvKF/fZzkBQ62Y3MHSMyYUWiAbUFci7QQd+oTl4e6lrxHCf5RIgEo
 4cs5b/9/3DBsjWE9PWxh+Z0K8cBhTOF5coXD/kkM=
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

SGkgQW5kcnplaiwKCk9uIFN1biwgQXVnIDA0LCAyMDE5IGF0IDAzOjA0OjM3UE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgQW5kcnplaiwKPiAKPiBUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaCwgYW5kIHNvcnJ5IGZvciB0aGUgbGF0ZSByZXZpZXcgKEkndmUgYmVlbgo+IHRyYXZl
bGxpbmcgZm9yIHRoZSBwYXN0IGZldyB3ZWVrcykuCj4gCj4gT24gRnJpLCBKdWwgMjYsIDIwMTkg
YXQgMDc6MjI6NTVQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+ID4gQWRk
IGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGljIGxpbmtzIGluIHN5c2ZzLCBwb2lu
dGluZyB0byBkZGMKPiA+IGludGVyZmFjZSB1c2VkIGJ5IGEgcGFydGljdWxhciB2aWRlbyBvdXRw
dXQuIEZvciBleGFtcGxlOgo+ID4gCj4gPiBscyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1J
LUEtMS9kZGMKPiA+IGxyd3hyd3hyd3ggMSByb290IHJvb3QgMCBKdW4gMjQgMTA6NDIgL3N5cy9j
bGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjIFwKPiA+IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4
ODAwMDAuaTJjL2kyYy0yCj4gPiAKPiA+IFRoaXMgbWFrZXMgaXQgZWFzeSBmb3IgdXNlciB0byBh
c3NvY2lhdGUgYSBkaXNwbGF5IHdpdGggaXRzIGRkYyBhZGFwdGVyCj4gPiBhbmQgdXNlIGUuZy4g
ZGRjdXRpbCB0byBjb250cm9sIHRoZSBjaG9zZW4gbW9uaXRvci4KPiA+IAo+ID4gVGhpcyBwYXRj
aCBhZGRzIGFuIGkyY19hZGFwdGVyIHBvaW50ZXIgdG8gc3RydWN0IGRybV9jb25uZWN0b3IuIFBh
cnRpY3VsYXIKPiA+IGRyaXZlcnMgY2FuIHRoZW4gdXNlIGl0IGluc3RlYWQgb2YgdXNpbmcgdGhl
aXIgb3duIHByaXZhdGUgaW5zdGFuY2UuIElmIGEKPiA+IGNvbm5lY3RvciBjb250YWlucyBhIGRk
YywgdGhlbiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIGluIHN5c2ZzLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+
ID4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBS
ZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyB8ICA4ICsrKysrKysrCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwgMTEgKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3lzZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+ID4gaW5kZXggYWQx
MDgxMGJjOTcyLi5lOTYyYTlkNDVmN2UgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3N5c2ZzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+ID4gQEAg
LTE0LDYgKzE0LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gPiAgI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9nZnAuaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgvaTJjLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2tkZXZfdC5oPgo+ID4gICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgCj4gPiBAQCAtMjk0LDYgKzI5NSw5IEBAIGludCBkcm1f
c3lzZnNfY29ubmVjdG9yX2FkZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4g
IAkvKiBMZXQgdXNlcnNwYWNlIGtub3cgd2UgaGF2ZSBhIG5ldyBjb25uZWN0b3IgKi8KPiA+ICAJ
ZHJtX3N5c2ZzX2hvdHBsdWdfZXZlbnQoZGV2KTsKPiA+ICAKPiA+ICsJaWYgKGNvbm5lY3Rvci0+
ZGRjKQo+ID4gKwkJcmV0dXJuIHN5c2ZzX2NyZWF0ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtv
YmosCj4gPiArCQkJCSAmY29ubmVjdG9yLT5kZGMtPmRldi5rb2JqLCAiZGRjIik7Cj4gPiAgCXJl
dHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+IEBAIC0zMDEsNiArMzA1LDEwIEBAIHZvaWQgZHJtX3N5
c2ZzX2Nvbm5lY3Rvcl9yZW1vdmUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiA+
ICB7Cj4gPiAgCWlmICghY29ubmVjdG9yLT5rZGV2KQo+ID4gIAkJcmV0dXJuOwo+ID4gKwo+ID4g
KwlpZiAoY29ubmVjdG9yLT5kZGMpCj4gPiArCQlzeXNmc19yZW1vdmVfbGluaygmY29ubmVjdG9y
LT5rZGV2LT5rb2JqLCAiZGRjIik7Cj4gPiArCj4gPiAgCURSTV9ERUJVRygicmVtb3ZpbmcgXCIl
c1wiIGZyb20gc3lzZnNcbiIsCj4gPiAgCQkgIGNvbm5lY3Rvci0+bmFtZSk7Cj4gPiAgCj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJt
X2Nvbm5lY3Rvci5oCj4gPiBpbmRleCA0YzMwZDc1MTQ4N2EuLjMzYTZmZmY4NWZkYiAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ID4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiBAQCAtNDEsNiArNDEsNyBAQCBzdHJ1Y3QgZHJtX3Byb3Bl
cnR5Owo+ID4gIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYjsKPiA+ICBzdHJ1Y3QgZHJtX3ByaW50
ZXI7Cj4gPiAgc3RydWN0IGVkaWQ7Cj4gPiArc3RydWN0IGkyY19hZGFwdGVyOwo+ID4gIAo+ID4g
IGVudW0gZHJtX2Nvbm5lY3Rvcl9mb3JjZSB7Cj4gPiAgCURSTV9GT1JDRV9VTlNQRUNJRklFRCwK
PiA+IEBAIC0xMzExLDYgKzEzMTIsMTYgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igewo+ID4gIAkg
KiBbMF06IHByb2dyZXNzaXZlLCBbMV06IGludGVybGFjZWQKPiA+ICAJICovCj4gPiAgCWludCBh
dWRpb19sYXRlbmN5WzJdOwo+ID4gKwo+ID4gKwkvKioKPiA+ICsJICogQGRkYzogYXNzb2NpYXRl
ZCBkZGMgYWRhcHRlci4KPiA+ICsJICogQSBjb25uZWN0b3IgdXN1YWxseSBoYXMgaXRzIGFzc29j
aWF0ZWQgZGRjIGFkYXB0ZXIuIElmIGEgZHJpdmVyIHVzZXMKPiA+ICsJICogdGhpcyBmaWVsZCwg
dGhlbiBhbiBhcHByb3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgaW4gY29ubmVjdG9y
Cj4gPiArCSAqIHN5c2ZzIGRpcmVjdG9yeSB0byBtYWtlIGl0IGVhc3kgZm9yIHRoZSB1c2VyIHRv
IHRlbGwgd2hpY2ggaTJjCj4gPiArCSAqIGFkYXB0ZXIgaXMgZm9yIGEgcGFydGljdWxhciBkaXNw
bGF5Lgo+IAo+IFRoZSBmaXJzdCBzZW50ZW5jZSBpc24ndCB2ZXJ5IGNsZWFyLiBUaGUgcmVzdCBp
cyBtaXhpbmcgImRkYyBhZGFwdGVyIgo+IGFuZCAiaTJjIGFkYXB0ZXIiLiBIb3cgYWJvdXQgdGhl
IGZvbGxvd2luZyA/Cj4gCj4gIldoZW4gdGhlIGNvbm5lY3RvciBjYXJyaWVzIEREQyBzaWduYWxz
LCB0aGlzIGZpZWxkIHBvaW50cyB0byB0aGUgSTJDCj4gYWRhcHRlciBjb25uZWN0ZWQgdG8gdGhl
IEREQyBzaWduYWxzLCBpZiBhbnkuIFdoZW4gdGhpcyBmaWVsZCBpcyBub3QKPiBOVUxMIGEgc3lt
Ym9saWMgbGluayBpcyBjcmVhdGVkIGluIHRoZSBjb25uZWN0b3IncyBzeXNmcyBkaXJlY3Rvcnkg
dG8KPiBleHBvc2UgdGhlIEkyQyBhZGFwdGVyIHVzZWQgYnkgdGhlIGNvbm5lY3Rvci4iCj4gCj4g
U2hvdWxkIHdlIGFsc28gbWVudGlvbiB0aGF0IHRoZSBmaWVsZCBpc24ndCBtZWFudCB0byBiZSBz
ZXQgZGlyZWN0bHksCj4gYnV0IHNoYWxsIGJlIHNldCB3aXRoIGRybV9jb25uZWN0b3JfaW5pdF93
aXRoX2RkYygpID8KPiAKPiAiVGhpcyBmaWVsZCBzaGFsbCBub3QgYmUgc2V0IGRpcmVjdGx5IGJ5
IGRyaXZlcnMsIHVzZQo+IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpIGluc3RlYWQuIgoK
SSBzaG91bGQgaGF2ZSByZWFkIHBhdGNoIDAyLzI0IGJlZm9yZSBhbnN3ZXJpbmcgdGhpcyA6LSkK
Cj4gSSdtIGFsc28gc2xpZ2h0bHkgY29uY2VybmVkIGFib3V0IHRoZSBsaWZldGltZSBvZiB0aGlz
IHBvaW50ZXIsIGFuZCB3aGF0Cj4gd291bGQgaGFwcGVuIGlmIHRoZSBJMkMgYWRhcHRlciBkaXNh
cHBlYXJzIHdoaWxlIHRoZSBjb25uZWN0b3IgaXMgc3RpbGwKPiBleHBvc2VkIHRvIHVzZXJzcGFj
ZSwgYnV0IEkgc3VwcG9zZSB0aGlzIGlzbid0IGEgbmV3IGlzc3VlLCBleGlzdGluZwo+IGNvZGUg
bGlrZWx5IHN1ZmZlcnMgZnJvbSB0aGlzLgo+IAo+IFdpdGggdGhlIHVwZGF0ZWQgZG9jdW1lbnRh
dGlvbiwKPiAKPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgoKSSd2ZSBqdXN0IHJlYWxpc2VkIHRoYXQgdGhpcyBwYXRjaCBo
YXMgYmVlbiBhcHBsaWVkIGFscmVhZHkuIEknbGwgc2VuZAp0aGUgYWJvdmUgYXMgYSBkb2N1bWVu
dGF0aW9uIHVwZGF0ZSBwYXRjaC4KCj4gPiArCSAqLwo+ID4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmRkYzsKPiA+ICsKPiA+ICAJLyoqCj4gPiAgCSAqIEBudWxsX2VkaWRfY291bnRlcjogdHJhY2sg
c2lua3MgdGhhdCBnaXZlIHVzIGFsbCB6ZXJvcyBmb3IgdGhlIEVESUQuCj4gPiAgCSAqIE5lZWRl
ZCB0byB3b3JrYXJvdW5kIHNvbWUgSFcgYnVncyB3aGVyZSB3ZSBnZXQgYWxsIDBzCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
