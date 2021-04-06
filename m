Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BF354FFA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 11:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D4289DB7;
	Tue,  6 Apr 2021 09:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A289DB7;
 Tue,  6 Apr 2021 09:33:37 +0000 (UTC)
IronPort-SDR: 3vfA3i00V9cDqgzBaNdvQG0LUR85ffYTaaoKEhhrth14WGkJxr33M+hbPwe3QwUuWMHX6rkww0
 YP5G9LqFktng==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="257016056"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="257016056"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 02:33:34 -0700
IronPort-SDR: yNx+NRizR5mkR8GcZPzlI8J7Pj0MjByUv03J9PMpLpN8+8z9CtxNE4aHX/zeWYKFAFUMA0T4x4
 hC15JwVa90TA==
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; d="scan'208";a="457817452"
Received: from oowomilo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.33.55])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 02:33:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] pwm: Rename pwm_get_state() to better reflect its semantic
In-Reply-To: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
Date: Tue, 06 Apr 2021 12:32:58 +0300
Message-ID: <87tuojlpv9.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-clk@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Chen-Yu Tsai <wens@csie.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Stephen Boyd <sboyd@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwNiBBcHIgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gR2l2ZW4gdGhhdCBsb3dsZXZlbCBkcml2ZXJzIHVzdWFs
bHkgY2Fubm90IGltcGxlbWVudCBleGFjdGx5IHdoYXQgYQo+IGNvbnN1bWVyIHJlcXVlc3RzIHdp
dGggcHdtX2FwcGx5X3N0YXRlKCkgdGhlcmUgaXMgc29tZSByb3VuZGluZyBpbnZvbHZlZC4KPgo+
IHB3bV9nZXRfc3RhdGUoKSB0cmFkaXRpb25hbGx5IHJldHVybmVkIHRoZSBzZXR0aW5nIHRoYXQg
d2FzIHJlcXVlc3RlZCBtb3N0Cj4gcmVjZW50bHkgYnkgdGhlIGNvbnN1bWVyIChvcHBvc2VkIHRv
IHdoYXQgd2FzIGFjdHVhbGx5IGltcGxlbWVudGVkIGluCj4gaGFyZHdhcmUgaW4gcmVwbHkgdG8g
dGhlIGxhc3QgcmVxdWVzdCkuIFRvIG1ha2UgdGhpcyBzZW1hbnRpYyBvYnZpb3VzCj4gcmVuYW1l
IHRoZSBmdW5jdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCgo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX3BhbmVsLmMgfCAgNCArLS0KCkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3Vy
Y2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
