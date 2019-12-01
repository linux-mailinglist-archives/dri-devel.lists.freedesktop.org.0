Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57310E19C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 12:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E9389DE5;
	Sun,  1 Dec 2019 11:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D19A89DE5
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 11:33:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4862A20040;
 Sun,  1 Dec 2019 12:33:08 +0100 (CET)
Date: Sun, 1 Dec 2019 12:33:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 06/16] drm/msm: fix opencoded use of drm_panel_*
Message-ID: <20191201113307.GD8753@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-7-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=QyXUC8HyAAAA:8 a=3jHMjg6xAAAA:8 a=ZTmiYS-oAAAA:8 a=L-wgLTOa4tQtTzOwMPYA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=_Ilv_KrDiT527o6t6YB_:22
 a=Bgfdu2smNuKfk3vLOmSO:22
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6MjdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFVzZSB0aGUgZnVuY3Rpb24gZHJtX3BhbmVsX2dldF9tb2RlcygpLgo+IAoKQXBwbGll
ZCB0byBkcm0tbWlzYy1uZXh0LgoKICAgICAgICBTYW0KCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBBbGV4aW9zIFphdnJhcyA8YWxleGlvcy56
YXZyYXNAaW50ZWwuY29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4KPiBDYzogQWxsaXNvbiBSYW5kYWwgPGFsbGlzb25AbG9odXRvay5uZXQ+Cj4gQ2M6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogRW5yaWNvIFdlaWdlbHQgPGluZm9AbWV0
dXgubmV0Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNf
Y29ubmVjdG9yLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NC9tZHA0X2x2ZHNfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9t
ZHA0X2x2ZHNfY29ubmVjdG9yLmMKPiBpbmRleCBlY2VmNGY1YjlmMjYuLjBlMjEyNTJmZDFkNiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29u
bmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNf
Y29ubmVjdG9yLmMKPiBAQCAtNTUsNyArNTUsNyBAQCBzdGF0aWMgaW50IG1kcDRfbHZkc19jb25u
ZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAlpZiAo
cGFuZWwpIHsKPiAgCQlkcm1fcGFuZWxfYXR0YWNoKHBhbmVsLCBjb25uZWN0b3IpOwo+ICAKPiAt
CQlyZXQgPSBwYW5lbC0+ZnVuY3MtPmdldF9tb2RlcyhwYW5lbCk7Cj4gKwkJcmV0ID0gZHJtX3Bh
bmVsX2dldF9tb2RlcyhwYW5lbCk7Cj4gIAo+ICAJCWRybV9wYW5lbF9kZXRhY2gocGFuZWwpOwo+
ICAJfQo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
