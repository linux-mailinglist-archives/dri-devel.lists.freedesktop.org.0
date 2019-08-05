Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919B6817AB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628F4892CA;
	Mon,  5 Aug 2019 10:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E73892CA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:56:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5F032F9;
 Mon,  5 Aug 2019 12:56:48 +0200 (CEST)
Date: Mon, 5 Aug 2019 13:56:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 13/16] drm/panel: drop return code from
 drm_panel_detach()
Message-ID: <20190805105647.GH29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-14-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565002609;
 bh=nisUIk5L2tjJD15aLfwBsmDwP/QvwsSaKKmQVHAH03Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DvfNSMsq9Iz0RSwd24A/p89jCmKQ/1WhEHui6UQFf0FmiuolkRgjJT1onBjHZcSvh
 oflCXD0nj+c/zQiVLayDOq4tm6eIeDOMhUCaJ1X7HVDwJsVexhwYAZeYr20JNNZny7
 Fc+8ZcDaBMGp3zyq7PONluW7eDNtNgQbtDMYivjY=
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
dCAxMDoxNjozNFBNICswMjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gVGhlcmUgYXJlIG5vIGVy
cm9ycyB0aGF0IGNhbiBiZSByZXBvcnRlZCBieSB0aGlzIGZ1bmN0aW9uLAo+IHNvIGRyb3AgdGhl
IHJldHVybiBjb2RlLgo+IEZpeCB0aGUgb25seSBicmlkZ2UgZHJpdmVyIHRoYXQgY2hlY2tlZCB0
aGUgcmV0dXJuIHJlc3VsdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5j
b20+Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1l
IFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogQW5kcnplaiBI
YWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5
ZW9uZy5tdW5AaW50ZWwuY29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKUmV2
aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhf
ZHBfY29yZS5jIHwgMyArLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jICAgICAgICAg
ICAgICAgICAgICAgICAgfCA2ICstLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKPiBpbmRleCBmMmY3ZjY5ZDZjYzMuLjIy
ODg1ZGNlYWExNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4X2RwX2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXhfZHBfY29yZS5jCj4gQEAgLTE3ODAsOCArMTc4MCw3IEBAIHZvaWQgYW5hbG9n
aXhfZHBfdW5iaW5kKHN0cnVjdCBhbmFsb2dpeF9kcF9kZXZpY2UgKmRwKQo+ICAJaWYgKGRwLT5w
bGF0X2RhdGEtPnBhbmVsKSB7Cj4gIAkJaWYgKGRybV9wYW5lbF91bnByZXBhcmUoZHAtPnBsYXRf
ZGF0YS0+cGFuZWwpKQo+ICAJCQlEUk1fRVJST1IoImZhaWxlZCB0byB0dXJub2ZmIHRoZSBwYW5l
bFxuIik7Cj4gLQkJaWYgKGRybV9wYW5lbF9kZXRhY2goZHAtPnBsYXRfZGF0YS0+cGFuZWwpKQo+
IC0JCQlEUk1fRVJST1IoImZhaWxlZCB0byBkZXRhY2ggdGhlIHBhbmVsXG4iKTsKPiArCQlkcm1f
cGFuZWxfZGV0YWNoKGRwLT5wbGF0X2RhdGEtPnBhbmVsKTsKPiAgCX0KPiAgCj4gIAlkcm1fZHBf
YXV4X3VucmVnaXN0ZXIoJmRwLT5hdXgpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKPiBpbmRleCA5OTQ2Yjhk
OWJhY2MuLmRhMTlkNWI0YTJmNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Bh
bmVsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKPiBAQCAtMjE5LDE1ICsy
MTksMTEgQEAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfYXR0YWNoKTsKPiAgICoKPiAgICogVGhp
cyBmdW5jdGlvbiBzaG91bGQgbm90IGJlIGNhbGxlZCBieSB0aGUgcGFuZWwgZGV2aWNlIGl0c2Vs
Zi4gSXQKPiAgICogaXMgb25seSBmb3IgdGhlIGRybSBkZXZpY2UgdGhhdCBjYWxsZWQgZHJtX3Bh
bmVsX2F0dGFjaCgpLgo+IC0gKgo+IC0gKiBSZXR1cm46IDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0
aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiAgICovCj4gLWludCBkcm1fcGFuZWxfZGV0YWNo
KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQo+ICt2b2lkIGRybV9wYW5lbF9kZXRhY2goc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCj4gIHsKPiAgCXBhbmVsLT5jb25uZWN0b3IgPSBOVUxMOwo+ICAJ
cGFuZWwtPmRybSA9IE5VTEw7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJP
TChkcm1fcGFuZWxfZGV0YWNoKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9w
YW5lbC5oIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiBpbmRleCA1ZTYyZGVlYTQ5YmEuLjYy
NGJkMTVlY2ZhYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gQEAgLTE1Myw3ICsxNTMsNyBAQCBpbnQgZHJtX3Bh
bmVsX2FkZChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gIHZvaWQgZHJtX3BhbmVsX3JlbW92
ZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gIAo+ICBpbnQgZHJtX3BhbmVsX2F0dGFjaChz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvcik7
Cj4gLWludCBkcm1fcGFuZWxfZGV0YWNoKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKPiArdm9p
ZCBkcm1fcGFuZWxfZGV0YWNoKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKPiAgCj4gIGludCBk
cm1fcGFuZWxfcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gIGludCBkcm1fcGFu
ZWxfdW5wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
