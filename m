Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629AE8179C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B11892B2;
	Mon,  5 Aug 2019 10:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0342892B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:54:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C82CF2F9;
 Mon,  5 Aug 2019 12:54:26 +0200 (CEST)
Date: Mon, 5 Aug 2019 13:54:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 12/16] drm/panel: use inline comments in drm_panel.h
Message-ID: <20190805105425.GG29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-13-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565002467;
 bh=RwQ5mnU7RUBzTgtf9QVDKC/TD/uPXzpxPEkwiDIp9go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o1GVXvYZTbKujwlbSWjhyKHPW4owM5I0zlEmcs35W5UJBLn/uX9Y1tgQEVNlHfCbu
 /nMXTotTJmqYaQ8CHoaAUSMqptXHOSOgKzy2jlzBudupzdlL+rtr7/MD3KkjGOYseq
 vW5cLPFJmFIz7+5Iycxf8kVVcCzLg1Lzyt0SrqHE=
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIEF1ZyAwNCwgMjAxOSBh
dCAxMDoxNjozM1BNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gSW5saW5lIGNvbW1lbnRz
IHByb3ZpZGUgYmV0dGVyIHNwYWNlIGZvciBhZGRpdGlvbmFsIGNvbW1lbnRzLgo+IENvbW1lbnRz
IHdhcyBzbGlnaHRseSBlZGl0ZWQgdG8gZm9sbG93IHRoZSBub3JtYWwgc3R5bGUsCj4gYnV0IG5v
IGNoYW5nZSB0byBhY3R1YWwgY29udGVudC4KPiBVc2VkIHRoZSBvcHBvcnR1bml5IHRvIGNoYW5n
ZSB0aGUgb3JkZXIgaW4gZHJtX3BhbmVsX2Z1bmNzCj4gdG8gZm9sbG93IHRoZSBvcmRlciB0aGV5
IHdpbGwgYmUgdXNlZCBieSBhIHBhbmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IFRo
aWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CgpSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0K
PiAgaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgMTYg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oIGIv
aW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiBpbmRleCAwNTNkNjExNjU2YjkuLjVlNjJkZWVhNDli
YSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9wYW5lbC5oCj4gQEAgLTM2LDE0ICszNiw2IEBAIHN0cnVjdCBkaXNwbGF5X3RpbWlu
ZzsKPiAgCj4gIC8qKgo+ICAgKiBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzIC0gcGVyZm9ybSBvcGVy
YXRpb25zIG9uIGEgZ2l2ZW4gcGFuZWwKPiAtICogQGRpc2FibGU6IGRpc2FibGUgcGFuZWwgKHR1
cm4gb2ZmIGJhY2sgbGlnaHQsIGV0Yy4pCj4gLSAqIEB1bnByZXBhcmU6IHR1cm4gb2ZmIHBhbmVs
Cj4gLSAqIEBwcmVwYXJlOiB0dXJuIG9uIHBhbmVsIGFuZCBwZXJmb3JtIHNldCB1cAo+IC0gKiBA
ZW5hYmxlOiBlbmFibGUgcGFuZWwgKHR1cm4gb24gYmFjayBsaWdodCwgZXRjLikKPiAtICogQGdl
dF9tb2RlczogYWRkIG1vZGVzIHRvIHRoZSBjb25uZWN0b3IgdGhhdCB0aGUgcGFuZWwgaXMgYXR0
YWNoZWQgdG8gYW5kCj4gLSAqIHJldHVybiB0aGUgbnVtYmVyIG9mIG1vZGVzIGFkZGVkCj4gLSAq
IEBnZXRfdGltaW5nczogY29weSBkaXNwbGF5IHRpbWluZ3MgaW50byB0aGUgcHJvdmlkZWQgYXJy
YXkgYW5kIHJldHVybgo+IC0gKiB0aGUgbnVtYmVyIG9mIGRpc3BsYXkgdGltaW5ncyBhdmFpbGFi
bGUKPiAgICoKPiAgICogVGhlIC5wcmVwYXJlKCkgZnVuY3Rpb24gaXMgdHlwaWNhbGx5IGNhbGxl
ZCBiZWZvcmUgdGhlIGRpc3BsYXkgY29udHJvbGxlcgo+ICAgKiBzdGFydHMgdG8gdHJhbnNtaXQg
dmlkZW8gZGF0YS4gUGFuZWwgZHJpdmVycyBjYW4gdXNlIHRoaXMgdG8gdHVybiB0aGUgcGFuZWwK
PiBAQCAtNjksMzEgKzYxLDg5IEBAIHN0cnVjdCBkaXNwbGF5X3RpbWluZzsKPiAgICogdGhlIHBh
bmVsLiBUaGlzIGlzIHRoZSBqb2Igb2YgdGhlIC51bnByZXBhcmUoKSBmdW5jdGlvbi4KPiAgICov
Cj4gIHN0cnVjdCBkcm1fcGFuZWxfZnVuY3Mgewo+IC0JaW50ICgqZGlzYWJsZSkoc3RydWN0IGRy
bV9wYW5lbCAqcGFuZWwpOwo+IC0JaW50ICgqdW5wcmVwYXJlKShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCk7Cj4gKwkvKioKPiArCSAqIEBwcmVwYXJlOgo+ICsJICoKPiArCSAqIFR1cm4gb24gcGFu
ZWwgYW5kIHBlcmZvcm0gc2V0IHVwLgo+ICsJICovCj4gIAlpbnQgKCpwcmVwYXJlKShzdHJ1Y3Qg
ZHJtX3BhbmVsICpwYW5lbCk7Cj4gKwo+ICsJLyoqCj4gKwkgKiBAZW5hYmxlOgo+ICsJICoKPiAr
CSAqIEVuYWJsZSBwYW5lbCAodHVybiBvbiBiYWNrIGxpZ2h0LCBldGMuKS4KPiArCSAqLwo+ICAJ
aW50ICgqZW5hYmxlKShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gKwo+ICsJLyoqCj4gKwkg
KiBAZGlzYWJsZToKPiArCSAqCj4gKwkgKiBEaXNhYmxlIHBhbmVsICh0dXJuIG9mZiBiYWNrIGxp
Z2h0LCBldGMuKS4KPiArCSAqLwo+ICsJaW50ICgqZGlzYWJsZSkoc3RydWN0IGRybV9wYW5lbCAq
cGFuZWwpOwo+ICsKPiArCS8qKgo+ICsJICogQHVucHJlcGFyZToKPiArCSAqCj4gKwkgKiBUdXJu
IG9mZiBwYW5lbC4KPiArCSAqLwo+ICsJaW50ICgqdW5wcmVwYXJlKShzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbCk7Cj4gKwo+ICsJLyoqCj4gKwkgKiBAZ2V0X21vZGVzOgo+ICsJICoKPiArCSAqIEFk
ZCBtb2RlcyB0byB0aGUgY29ubmVjdG9yIHRoYXQgdGhlIHBhbmVsIGlzIGF0dGFjaGVkIHRvIGFu
ZAo+ICsJICogcmV0dXJuIHRoZSBudW1iZXIgb2YgbW9kZXMgYWRkZWQuCj4gKwkgKi8KPiAgCWlu
dCAoKmdldF9tb2Rlcykoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwo+ICsKPiArCS8qKgo+ICsJ
ICogQGdldF90aW1pbmdzOgo+ICsJICoKPiArCSAqIENvcHkgZGlzcGxheSB0aW1pbmdzIGludG8g
dGhlIHByb3ZpZGVkIGFycmF5IGFuZCByZXR1cm4KPiArCSAqIHRoZSBudW1iZXIgb2YgZGlzcGxh
eSB0aW1pbmdzIGF2YWlsYWJsZS4KPiArCSAqLwo+ICAJaW50ICgqZ2V0X3RpbWluZ3MpKHN0cnVj
dCBkcm1fcGFuZWwgKnBhbmVsLCB1bnNpZ25lZCBpbnQgbnVtX3RpbWluZ3MsCj4gIAkJCSAgIHN0
cnVjdCBkaXNwbGF5X3RpbWluZyAqdGltaW5ncyk7Cj4gIH07Cj4gIAo+ICAvKioKPiAgICogc3Ry
dWN0IGRybV9wYW5lbCAtIERSTSBwYW5lbCBvYmplY3QKPiAtICogQGRybTogRFJNIGRldmljZSBv
d25pbmcgdGhlIHBhbmVsCj4gLSAqIEBjb25uZWN0b3I6IERSTSBjb25uZWN0b3IgdGhhdCB0aGUg
cGFuZWwgaXMgYXR0YWNoZWQgdG8KPiAtICogQGRldjogcGFyZW50IGRldmljZSBvZiB0aGUgcGFu
ZWwKPiAtICogQGxpbms6IGxpbmsgZnJvbSBwYW5lbCBkZXZpY2UgKHN1cHBsaWVyKSB0byBEUk0g
ZGV2aWNlIChjb25zdW1lcikKPiAtICogQGZ1bmNzOiBvcGVyYXRpb25zIHRoYXQgY2FuIGJlIHBl
cmZvcm1lZCBvbiB0aGUgcGFuZWwKPiAtICogQGxpc3Q6IHBhbmVsIGVudHJ5IGluIHJlZ2lzdHJ5
Cj4gICAqLwo+ICBzdHJ1Y3QgZHJtX3BhbmVsIHsKPiArCS8qKgo+ICsJICogQGRybToKPiArCSAq
Cj4gKwkgKiBEUk0gZGV2aWNlIG93bmluZyB0aGUgcGFuZWwuCj4gKwkgKi8KPiAgCXN0cnVjdCBk
cm1fZGV2aWNlICpkcm07Cj4gKwo+ICsJLyoqCj4gKwkgKiBAY29ubmVjdG9yOgo+ICsJICoKPiAr
CSAqIERSTSBjb25uZWN0b3IgdGhhdCB0aGUgcGFuZWwgaXMgYXR0YWNoZWQgdG8uCj4gKwkgKi8K
PiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7Cj4gKwo+ICsJLyoqCj4gKwkgKiBA
ZGV2Ogo+ICsJICoKPiArCSAqIFBhcmVudCBkZXZpY2Ugb2YgdGhlIHBhbmVsLgo+ICsJICovCj4g
IAlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gIAo+ICsJLyoqCj4gKwkgKiBAZnVuY3M6Cj4gKwkgKgo+
ICsJICogT3BlcmF0aW9ucyB0aGF0IGNhbiBiZSBwZXJmb3JtZWQgb24gdGhlIHBhbmVsLgo+ICsJ
ICovCj4gIAljb25zdCBzdHJ1Y3QgZHJtX3BhbmVsX2Z1bmNzICpmdW5jczsKPiAgCj4gKwkvKioK
PiArCSAqIEBsaXN0Ogo+ICsJICoKPiArCSAqIFBhbmVsIGVudHJ5IGluIHJlZ2lzdHJ5Lgo+ICsJ
ICovCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4gIH07Cj4gIAoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
