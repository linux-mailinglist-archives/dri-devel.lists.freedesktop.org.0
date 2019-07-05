Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26F60C33
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C726E542;
	Fri,  5 Jul 2019 20:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08A66E53C;
 Fri,  5 Jul 2019 20:17:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f17so10789244wme.2;
 Fri, 05 Jul 2019 13:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/iTpIGfcdfMflHMyEWbw4EdjqMFQEqZQGAIiD0MIao=;
 b=kj1r26Yygh+ZU51D1Aau23bLZ8DIj4TUwbRc8j1+MStSzwtJLP4wvzEylKBCc6bG4i
 REa9jAK6qz7TXlmZQRiF2y0r+rsNmpT5/pa0Y5nMoUEamzyuMAeCJqmHnjTY8oFevLaY
 TGWj7h6bzPQYtXxIYU5EPRkysTtfpstPF5q7aPU95Q9sS7LLtp2LWaGQF37CblfLPTUp
 tbBNdvIfFRqAfZEsVipLMTTvmj1KQwbxpYuA6S4d2OcFMQEciXIALYSRgsJDKmfNt5Ha
 cfNGNrunrzug30/eaycpg7NkuX7WvS991MPPMeXhpWn+8af65V5exxmwVg7qGDxmraQw
 6thA==
X-Gm-Message-State: APjAAAVbTkgzmWksWXyxIvQ5c6LJ/rlItXLwRrWqNQUlARO871tuzIwB
 ctfRIIKK7UanYfzK+2SC2xZvKSYz33aUqoSDURE=
X-Google-Smtp-Source: APXvYqxtncXSNQsuqv+XBX4ubNNyHvajFyBwC9MK90SlQRArdnj3y199piB6SReYqNtKwbqfabUsfhSnoa5sJps0UxU=
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr4823424wme.67.1562357859403; 
 Fri, 05 Jul 2019 13:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
 <5e355b8bec8fb3907566a741db8cc3e356246a32.1561735433.git.andrzej.p@collabora.com>
 <CADnq5_MrVoScVFgj3TP2Z+Ky8_32k=Cou5jebuMT5gE1+GZ0cA@mail.gmail.com>
 <fc26ac17-dc18-f995-53cf-42b50754c916@collabora.com>
In-Reply-To: <fc26ac17-dc18-f995-53cf-42b50754c916@collabora.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jul 2019 16:17:28 -0400
Message-ID: <CADnq5_MT58vOop65dOSK95R2khChAAzkWfsO9-RYYvJ37XbPug@mail.gmail.com>
Subject: Re: [PATCH v3 21/22] drm/amdgpu: Provide ddc symlink in connector
 sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=D/iTpIGfcdfMflHMyEWbw4EdjqMFQEqZQGAIiD0MIao=;
 b=eDiOfIOLjT4rkhyi+kYllYkUYaclNQGbFElvDThHvjkc4Xs+f5p+s4DA/I9sTI7Ter
 MyasGPxqa1gPF8s6Dp0i7R//AuhT8MhZhqirXLK4O3z0PcpKb7nKUkBpz28mx3SAE4Bu
 b55KZE8THFi1KZq8f6ZRQdDb9jtBEDB0mD1BBbr9lVw4vTHV20vpH71HUobjrnRLihbD
 eUgLhS8AvFakMSn/2KzLgNzl8lbWqMpJTl/D8D34h/fOCNKFn6jgrDrCgEUF0fGt0fgw
 qJ8pueVxoRXBij0UO8EG5WgkO2NqQZY5byyDrG/oDJ+bYXcr9XKjv4SOUxsEKR2BuQTI
 PAQw==
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Todor Tomov <todor.tomov@linaro.org>, Huang Rui <ray.huang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA5OjE3IEFNIEFuZHJ6ZWogUGlldHJhc2lld2ljego8YW5k
cnplai5wQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gVyBkbml1IDAyLjA3LjIwMTkgbyAyMjo1
NCwgQWxleCBEZXVjaGVyIHBpc3plOgo+ID4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTI6MzEg
UE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cj4gPiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+IHdy
b3RlOgo+ID4+Cj4gPj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJp
YyBjb25uZWN0b3IuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdp
Y3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+ID4+IC0tLQo+ID4+ICAgLi4uL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jICAgIHwgNzAgKysrKysrKysrKysrKystLS0t
LQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVj
dG9ycy5jCj4gPj4gaW5kZXggNzNiMmVkZTc3M2QzLi41ZjhhN2UzODE4YjkgMTAwNjQ0Cj4gPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nvbm5lY3RvcnMuYwo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMKPiA+
PiBAQCAtMTU3MywxMSArMTU3MywxNSBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWls
ZWQ7Cj4gPj4gICAgICAgICAgICAgICAgICBhbWRncHVfY29ubmVjdG9yLT5jb25fcHJpdiA9IGFt
ZGdwdV9kaWdfY29ubmVjdG9yOwo+ID4+ICAgICAgICAgICAgICAgICAgaWYgKGkyY19idXMtPnZh
bGlkKSB7Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRj
X2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOwo+ID4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzKQo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfY29ubmVjdG9yICphY24gPSBhbWRncHVfY29u
bmVjdG9yOwo+ID4+ICsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBhY24tPmRkY19idXMg
PSBhbWRncHVfaTJjX2xvb2t1cChhZGV2LCBpMmNfYnVzKTsKPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoYWNuLT5kZGNfYnVzKSB7Cj4gPgo+ID4gVGhpcyBodW5rIHNlZW1zIHBvaW50
bGVzcyB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLiAgQ2FuIHlvdSBkcm9wCj4gPiB0aGlz
IGh1bms/ICBTYW1lIGNvbW1lbnQgb24gZWFjaCBpbnN0YW5jZSBvZiB0aGlzIGJlbG93LiAgVGhp
cyBhbHNvCj4gPiBvbmx5IGNvdmVycyB0aGUgbGVnYWN5IG1vZGVzZXR0aW5nIGNvZGUgd2hpY2gg
aXMgbm90IHVzZWQgYnkgZGVmYXVsdAo+ID4gb24gbW9zdCBjaGlwcy4gIFRoZSBEQyBjb2RlIGlu
IGFtZC9kaXNwbGF5LyBpcyBwcm9iYWJseSBtb3JlIHJlbGV2YW50Lgo+ID4KPgo+IElmIEkgZG9u
J3QgZG8gdGhhdCBjaGVja3BhdGNoIHJlcG9ydHMgdGhhdCBsaW5lcyBJIGNyZWF0ZWQgZXhjZWVk
IDgwIGNoYXJhY3RlcnMuCgpEb24ndCB3b3JyeSBhYm91dCB0aGF0LgoKQWxleApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
