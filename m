Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3677280
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 22:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEEA6EE50;
	Fri, 26 Jul 2019 20:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585946EE4B;
 Fri, 26 Jul 2019 20:01:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x4so2429318wrt.6;
 Fri, 26 Jul 2019 13:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfVjmU6zckNNoodvMSaWRWYTNnSyu1bvmT3h34KJDJs=;
 b=tfFGAfeA9jPSsmYIe+K0AP59q/CB+eDR0cjG0elcgpiFIKueYmEbfSbXOMoEoTn1Je
 LxxG8FU/b4cC39mkI28QU4e1vYf+33tLEmB9SGOivJ7YnlajYvzf1AjswRl3DqQTT4uz
 pt7Ho9Jp2jqE32AVlPn0FJk02xTn/7ql6b0k5LlDSV97og5MYi0H0grs3FV4Rw5kPxIT
 +/v9preDuvdUSUZ/G3+1uKRbs9TUqCkTEMsSieSd0QYffnBKYh7Xk0FkZpL8MrgUERGV
 NqxBaTs3X7JRTILpbTJRY0V0q4FF/leMTyGulWerZQJxBpQ3G6Vottnjh6/oc30781Kf
 Mliw==
X-Gm-Message-State: APjAAAW61BeE6wNTkL1EXKo0gGbtxJ2h7fpVkT6pup8LuRcm0JQr6KzW
 eEYlHvLaYLtupokIPjtUmql/cNp5q39yaxetcmI=
X-Google-Smtp-Source: APXvYqzYfN2e53VE31jTG/HV3K11OB5CIxcMbrH1977yWkwnWA0P8bUKkQTRD0rxecBJcxOJVlvSZpeba1SvC3LN1RY=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr78465380wrr.341.1564171271875; 
 Fri, 26 Jul 2019 13:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <7fee0fa0d0f77af6595d283d5f3ae5d551475821.1564161140.git.andrzej.p@collabora.com>
 <CADnq5_O1B59Q+68fJgtf_bn_=WQ9yrVPq-V5tL1VQ3+vzgf1Zw@mail.gmail.com>
 <038809c7-e664-e365-a778-03bc11299193@collabora.com>
In-Reply-To: <038809c7-e664-e365-a778-03bc11299193@collabora.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Jul 2019 16:00:59 -0400
Message-ID: <CADnq5_PJj8_dtq0aJWECcRJ0_uC-XpG6Z6p9Gj3fV_fTLGwZBA@mail.gmail.com>
Subject: Re: [PATCH v6 22/24] drm/amdgpu: Provide ddc symlink in connector
 sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rfVjmU6zckNNoodvMSaWRWYTNnSyu1bvmT3h34KJDJs=;
 b=NA8IkunSglfLpeiY4HKXYERVf3hamv4cLI0On7Vvj+pha7RGhezryiHVGqhlB2OZLk
 nBbyynnjO2qBIzopg6liN5Xf2p89tf9HF0gyp73Mqun7/fbZF8op0DACICyOGSy6ra9G
 li70SIrDvhTzCTfJDaakdg8JsdpymTQ+Cd0rb8BFZSi1ckqT6pk3yBZrP1ZOWMvM+E1o
 d7OrPNjNIakYTUHRjpCTtxBC62pR+vygqSKsMLhDp0JMBYagmi2wzwSWCgfqWJPyWppi
 7AhbY80grQ8K1whExlNf7oUIFl4W8KcsCH40g2qpfPgz0cDGt84D4BGCx/Z8UWA+9kTl
 zGnQ==
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMzo0MiBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPgo+IFcgZG5pdSAy
Ni4wNy4yMDE5IG8gMjE6MjgsIEFsZXggRGV1Y2hlciBwaXN6ZToKPiA+IE9uIEZyaSwgSnVsIDI2
LCAyMDE5IGF0IDE6MjggUE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cj4gPiA8YW5kcnplai5wQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRl
ZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4KPiA+IE5vdGUg
dGhhdCB0aGlzIG9ubHkgY292ZXJzIHRoZSBsZWdhY3kgZGlzcGxheSBjb2RlLiAgVGhlIG5ldyBE
Qwo+ID4gZGlzcGxheSBjb2RlIGFsc28gbmVlZHMgdG8gYmUgY29udmVydGVkLiAgU2VlOgo+ID4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4gZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMK
Pgo+IEluIGFtZGdwdV9kbV9jb25uZWN0b3JfaW5pdCgpIHRoZSBkZGMgaXMgJmkyYy0+YmFzZSwg
aXMgaXQ/CgpZZXMuCgo+Cj4gQnV0IGl0IGlzIG5vdCBjbGVhciB0byBtZSBob3cgY2FuIEkgZmlu
ZCBkZGMgcG9pbnRlciBpbgo+IGRtX2RwX2FkZF9tc3RfY29ubmVjdG9yKCk/CgorIEhhcnJ5IGFu
ZCBOaWNrLgoKaG1tbSwgbm90IHN1cmUgYWJvdXQgTVNULiAgTWF5YmUganVzdCBza2lwIHRoZW0g
Zm9yIG5vdy4KCkFsZXgKCj4KPiBBbmRyemVqCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
