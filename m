Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C01E33B3
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 01:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8776E26C;
	Tue, 26 May 2020 23:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E4CE6E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 23:30:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB62C1FB;
 Tue, 26 May 2020 16:30:23 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85D043F52E;
 Tue, 26 May 2020 16:30:23 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id CE3C3682B71; Wed, 27 May 2020 00:30:21 +0100 (BST)
Date: Wed, 27 May 2020 00:30:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/21] drm/arm: Use GEM CMA object functions
Message-ID: <20200526233021.GD159988@e110455-lin.cambridge.arm.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522135246.10134-4-tzimmermann@suse.de>
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

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgMDM6NTI6MjhQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGFybSBkcml2ZXIgdXNlcyB0aGUgZGVmYXVsdCBpbXBsZW1lbnRhdGlv
biBmb3IgQ01BIGZ1bmN0aW9ucy4gVGhlCj4gRFJNX0dFTV9DTUFfRFJJVkVSX09QUyBtYWNybyBu
b3cgc2V0cyB0aGVzZSBkZWZhdWx0cyBpbiBzdHJ1Y3QgZHJtX2RyaXZlci4KPiBBbGwgcmVtYWlu
aW5nIG9wZXJhdGlvbnMgYXJlIHByb3ZpZGVkIGJ5IENNQSBHRU0gb2JqZWN0IGZ1bmN0aW9ucy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KClRoYW5rcyEK
TGl2aXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMgfCAxMiArLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMKPiBpbmRleCAxOTQ0MTlmNDdjNWU1Li5jODNi
ODFhM2E1ODJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jCj4gQEAgLTI0MCwxNyArMjQw
LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGhkbGNkX2RyaXZlciA9IHsKPiAgCS5pcnFf
cHJlaW5zdGFsbCA9IGhkbGNkX2lycV9wcmVpbnN0YWxsLAo+ICAJLmlycV9wb3N0aW5zdGFsbCA9
IGhkbGNkX2lycV9wb3N0aW5zdGFsbCwKPiAgCS5pcnFfdW5pbnN0YWxsID0gaGRsY2RfaXJxX3Vu
aW5zdGFsbCwKPiAtCS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgPSBkcm1fZ2VtX2NtYV9mcmVl
X29iamVjdCwKPiAtCS5nZW1fcHJpbnRfaW5mbyA9IGRybV9nZW1fY21hX3ByaW50X2luZm8sCj4g
LQkuZ2VtX3ZtX29wcyA9ICZkcm1fZ2VtX2NtYV92bV9vcHMsCj4gLQkuZHVtYl9jcmVhdGUgPSBk
cm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZSwKPiAtCS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2Vt
X3ByaW1lX2hhbmRsZV90b19mZCwKPiAtCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3By
aW1lX2ZkX3RvX2hhbmRsZSwKPiAtCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gZHJtX2dlbV9j
bWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAo+IC0JLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBk
cm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4gLQkuZ2VtX3ByaW1lX3ZtYXAgPSBk
cm1fZ2VtX2NtYV9wcmltZV92bWFwLAo+IC0JLmdlbV9wcmltZV92dW5tYXAgPSBkcm1fZ2VtX2Nt
YV9wcmltZV92dW5tYXAsCj4gLQkuZ2VtX3ByaW1lX21tYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV9t
bWFwLAo+ICsJRFJNX0dFTV9DTUFfRFJJVkVSX09QUywKPiAgI2lmZGVmIENPTkZJR19ERUJVR19G
Uwo+ICAJLmRlYnVnZnNfaW5pdCA9IGhkbGNkX2RlYnVnZnNfaW5pdCwKPiAgI2VuZGlmCj4gLS0g
Cj4gMi4yNi4yCj4gCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8g
fAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhl
ICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8v
wq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
