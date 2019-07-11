Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE365644
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 14:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BD66E20F;
	Thu, 11 Jul 2019 12:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401496E20C;
 Thu, 11 Jul 2019 12:00:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 05:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,478,1557212400"; d="scan'208";a="156799836"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 Jul 2019 05:00:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Jul 2019 15:00:17 +0300
Date: Thu, 11 Jul 2019 15:00:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 01/23] drm: Include ddc adapter pointer in struct
 drm_connector
Message-ID: <20190711120017.GU5942@intel.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <5957ae96ee20eed5cfcb8a9619e2f61d71fe227e.1562843413.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5957ae96ee20eed5cfcb8a9619e2f61d71fe227e.1562843413.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Gleixner <>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDE6MjY6MjhQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEFkZCBnZW5lcmljIGNvZGUgd2hpY2ggY3JlYXRlcyBzeW1ib2xpYyBs
aW5rcyBpbiBzeXNmcywgcG9pbnRpbmcgdG8gZGRjCj4gaW50ZXJmYWNlIHVzZWQgYnkgYSBwYXJ0
aWN1bGFyIHZpZGVvIG91dHB1dC4gRm9yIGV4YW1wbGU6Cj4gCj4gbHMgLWwgL3N5cy9jbGFzcy9k
cm0vY2FyZDAtSERNSS1BLTEvZGRjCj4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAx
MDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAo+IAktPiAuLi8uLi8uLi8u
Li9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCj4gCj4gVGhpcyBtYWtlcyBpdCBlYXN5IGZvciB1c2Vy
IHRvIGFzc29jaWF0ZSBhIGRpc3BsYXkgd2l0aCBpdHMgZGRjIGFkYXB0ZXIKPiBhbmQgdXNlIGUu
Zy4gZGRjdXRpbCB0byBjb250cm9sIHRoZSBjaG9zZW4gbW9uaXRvci4KPiAKPiBUaGlzIHBhdGNo
IGFkZHMgYW4gaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvci4gUGFy
dGljdWxhcgo+IGRyaXZlcnMgY2FuIHRoZW4gdXNlIGl0IGluc3RlYWQgb2YgdXNpbmcgdGhlaXIg
b3duIHByaXZhdGUgaW5zdGFuY2UuIElmIGEKPiBjb25uZWN0b3IgY29udGFpbnMgYSBkZGMsIHRo
ZW4gY3JlYXRlIGEgc3ltYm9saWMgbGluayBpbiBzeXNmcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IFJldmlld2VkLWJ5OiBB
bmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3N5c2ZzLmMgfCAgNyArKysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aCB8IDExICsrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5c2ZzLmMKPiBpbmRleCBhZDEwODEwYmM5NzIuLjI2ZDM1OWIzOTc4NSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5c2ZzLmMKPiBAQCAtMjk0LDYgKzI5NCw5IEBAIGludCBkcm1fc3lzZnNfY29u
bmVjdG9yX2FkZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJLyogTGV0IHVz
ZXJzcGFjZSBrbm93IHdlIGhhdmUgYSBuZXcgY29ubmVjdG9yICovCj4gIAlkcm1fc3lzZnNfaG90
cGx1Z19ldmVudChkZXYpOwo+ICAKPiArCWlmIChjb25uZWN0b3ItPmRkYykKPiArCQlyZXR1cm4g
c3lzZnNfY3JlYXRlX2xpbmsoJmNvbm5lY3Rvci0+a2Rldi0+a29iaiwKPiArCQkJCSAmY29ubmVj
dG9yLT5kZGMtPmRldi5rb2JqLCAiZGRjIik7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiBAQCAt
MzAxLDYgKzMwNCwxMCBAQCB2b2lkIGRybV9zeXNmc19jb25uZWN0b3JfcmVtb3ZlKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAgCWlmICghY29ubmVjdG9yLT5rZGV2KQo+
ICAJCXJldHVybjsKPiArCj4gKwlpZiAoY29ubmVjdG9yLT5kZGMpCj4gKwkJc3lzZnNfcmVtb3Zl
X2xpbmsoJmNvbm5lY3Rvci0+a2Rldi0+a29iaiwgImRkYyIpOwo+ICsKPiAgCURSTV9ERUJVRygi
cmVtb3ZpbmcgXCIlc1wiIGZyb20gc3lzZnNcbiIsCj4gIAkJICBjb25uZWN0b3ItPm5hbWUpOwo+
ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oCj4gaW5kZXggY2E3NDVkOWZlYWY1Li4xYWQzZDFkNTRiYTcgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oCj4gQEAgLTIzLDYgKzIzLDcgQEAKPiAgI2lmbmRlZiBfX0RSTV9D
T05ORUNUT1JfSF9fCj4gICNkZWZpbmUgX19EUk1fQ09OTkVDVE9SX0hfXwo+ICAKPiArI2luY2x1
ZGUgPGxpbnV4L2kyYy5oPgoKc3RydWN0IGkyY19hZGFwdGVyOwp3b3VsZCBzdWZmaWNlLgoKPiAg
I2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xsaXN0Lmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9jdHlwZS5oPgo+IEBAIC0xMzA4LDYgKzEzMDksMTYgQEAgc3RydWN0IGRy
bV9jb25uZWN0b3Igewo+ICAJICogWzBdOiBwcm9ncmVzc2l2ZSwgWzFdOiBpbnRlcmxhY2VkCj4g
IAkgKi8KPiAgCWludCBhdWRpb19sYXRlbmN5WzJdOwo+ICsKPiArCS8qKgo+ICsJICogQGRkYzog
YXNzb2NpYXRlZCBkZGMgYWRhcHRlci4KPiArCSAqIEEgY29ubmVjdG9yIHVzdWFsbHkgaGFzIGl0
cyBhc3NvY2lhdGVkIGRkYyBhZGFwdGVyLiBJZiBhIGRyaXZlciB1c2VzCj4gKwkgKiB0aGlzIGZp
ZWxkLCB0aGVuIGFuIGFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBpbiBjb25u
ZWN0b3IKPiArCSAqIHN5c2ZzIGRpcmVjdG9yeSB0byBtYWtlIGl0IGVhc3kgZm9yIHRoZSB1c2Vy
IHRvIHRlbGwgd2hpY2ggaTJjCj4gKwkgKiBhZGFwdGVyIGlzIGZvciBhIHBhcnRpY3VsYXIgZGlz
cGxheS4KPiArCSAqLwo+ICsJc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4gKwo+ICAJLyoqCj4g
IAkgKiBAbnVsbF9lZGlkX2NvdW50ZXI6IHRyYWNrIHNpbmtzIHRoYXQgZ2l2ZSB1cyBhbGwgemVy
b3MgZm9yIHRoZSBFRElELgo+ICAJICogTmVlZGVkIHRvIHdvcmthcm91bmQgc29tZSBIVyBidWdz
IHdoZXJlIHdlIGdldCBhbGwgMHMKPiAtLSAKPiAyLjE3LjEKCi0tIApWaWxsZSBTeXJqw6Rsw6QK
SW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
