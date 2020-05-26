Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB241E33C6
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 01:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCFA6E279;
	Tue, 26 May 2020 23:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFB556E279
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 23:33:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88649101E;
 Tue, 26 May 2020 16:33:36 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 655AF3F52E;
 Tue, 26 May 2020 16:33:36 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 11265682B70; Wed, 27 May 2020 00:33:35 +0100 (BST)
Date: Wed, 27 May 2020 00:33:35 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/21] drm/malidp: Use GEM CMA object functions
Message-ID: <20200526233335.GF159988@e110455-lin.cambridge.arm.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522135246.10134-12-tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, philippe.cornu@st.com,
 paul@crapouillou.net, laurent.pinchart@ideasonboard.com,
 mihail.atanassov@arm.com, sam@ravnborg.org, alexandre.torgue@st.com,
 marex@denx.de, abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, khilman@baylibre.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMDM6NTI6MzZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIG1hbGlkcCBkcml2ZXIgdXNlcyB0aGUgZGVmYXVsdCBpbXBsZW1lbnRh
dGlvbiBmb3IgQ01BIGZ1bmN0aW9uczsgZXhjZXB0Cj4gZm9yIHRoZSAuZHVtYl9jcmVhdGUgY2Fs
bGJhY2suIFRoZSBfX0RSTV9HRU1fQ01BX0RSSVZFUl9PUFMgbWFjcm8gbm93IHNldHMKPiB0aGVz
ZSBkZWZhdWx0cyBhbmQgLmR1bWJfY3JlYXRlIGluIHN0cnVjdCBkcm1fZHJpdmVyLiBBbGwgcmVt
YWluaW5nCj4gb3BlcmF0aW9ucyBhcmUgcHJvdmlkZWQgYnkgQ01BIEdFTSBvYmplY3QgZnVuY3Rp
b25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKQmVz
dCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2
LmMgfCAxMSArLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEw
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4gaW5kZXggZGVmOGM5
ZmZhZmNhZi4uOTJlMGJjYTZhYTJmNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4g
QEAgLTU2MywxNiArNTYzLDcgQEAgc3RhdGljIHZvaWQgbWFsaWRwX2RlYnVnZnNfaW5pdChzdHJ1
Y3QgZHJtX21pbm9yICptaW5vcikKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBtYWxp
ZHBfZHJpdmVyID0gewo+ICAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJf
TU9ERVNFVCB8IERSSVZFUl9BVE9NSUMsCj4gLQkuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkID0g
ZHJtX2dlbV9jbWFfZnJlZV9vYmplY3QsCj4gLQkuZ2VtX3ZtX29wcyA9ICZkcm1fZ2VtX2NtYV92
bV9vcHMsCj4gLQkuZHVtYl9jcmVhdGUgPSBtYWxpZHBfZHVtYl9jcmVhdGUsCj4gLQkucHJpbWVf
aGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gLQkucHJpbWVfZmRf
dG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCj4gLQkuZ2VtX3ByaW1lX2dl
dF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKPiAtCS5nZW1fcHJp
bWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAo+
IC0JLmdlbV9wcmltZV92bWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKPiAtCS5nZW1fcHJp
bWVfdnVubWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfdnVubWFwLAo+IC0JLmdlbV9wcmltZV9tbWFw
ID0gZHJtX2dlbV9jbWFfcHJpbWVfbW1hcCwKPiArCV9fRFJNX0dFTV9DTUFfRFJJVkVSX09QUyht
YWxpZHBfZHVtYl9jcmVhdGUpLAo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gIAkuZGVidWdm
c19pbml0ID0gbWFsaWRwX2RlYnVnZnNfaW5pdCwKPiAgI2VuZGlmCj4gLS0gCj4gMi4yNi4yCj4g
CgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUg
d29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3Vy
Y2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
