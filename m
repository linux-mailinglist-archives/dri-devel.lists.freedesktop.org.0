Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD4F1A96
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 16:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A332F6EDC0;
	Wed,  6 Nov 2019 15:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFEE6EDC2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:59:03 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id z10so22238530ilo.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 07:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTmvNusWN2c5MG6/BAIqeUf6hIHOhMcF2KJYDtbtvt8=;
 b=V9O8JXh6i+M3rrG0Obsk0Sb/oQEYjjBod+1n13lH8JysLATUHXYRXqCmyNanNMtnvo
 O75W2Np0yvyH0NSG9xvN5W8xjdPHnGaQEy/dox+od3Kqaj6KvE28FaQtdksRAylbsgK2
 Q5eEveeXnnsKmu4f+mdIB5PHoNZgkGGaYf2LqAvKw4pHKsFiwifNV3cets2b+GVR0zcj
 o0+ciEfB40A2L5PFBPqNITpkzvXTUrN8a47Ap2zon+aJXpjTC01wGF6M9up+ZqMjNX9C
 m4oEsLcc6P3/URjfPuBUXjTPt7GWB2pV8l3JFMy1GBYsCqoiiUUh0RhPldMaPGWv5XWu
 g+Kg==
X-Gm-Message-State: APjAAAXtHNwxQpY/0RQuuMMlbaPDKCgq+VWAQlEfRcE/e3jkVxk4/DEW
 tVmhDfO04pp9/u9fOF0Zr0jnuszjCIh1aW+abGEJgg==
X-Google-Smtp-Source: APXvYqyHPDXVunridE8njdx3JYwMYmzHl/72SZR5GTwewyAfNZD7ZXTP+VI3OOz5z37EYlrRoJTSjm4/xhly3AA6geo=
X-Received: by 2002:a92:4596:: with SMTP id z22mr3427340ilj.75.1573055942733; 
 Wed, 06 Nov 2019 07:59:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1566845537.git.andrzej.p@collabora.com>
 <1e343b02195757bfbf60ca8999cadeb376db204e.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <1e343b02195757bfbf60ca8999cadeb376db204e.1566845537.git.andrzej.p@collabora.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 6 Nov 2019 10:58:26 -0500
Message-ID: <CAMavQKJhC==nDFFqCXK-J-VLdDkZHUCoSLe6KgALLSYR7kFDfw@mail.gmail.com>
Subject: Re: [PATCH RESEND 07/14] drm/msm/hdmi: Provide ddc symlink in hdmi
 connector sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eTmvNusWN2c5MG6/BAIqeUf6hIHOhMcF2KJYDtbtvt8=;
 b=ccpy+gS6IGTTaTTSYtiJSpGEcbiv5wNleb628bgUAiGfYG8qovcbis91IrjxFSiyph
 3HfZZ8GEZqfFDt+kARDudOi3bo/7aW5DX4U8dH7bmhH4S/eOuaKOUrpahD82A4roSaH4
 4Pun2YIuRJIp54fpdSGnX2nYGvSWTZEm3inBN/1Y6y0NIlKCePzb4aQJX28WK/S6qIWG
 BRP0UWMYmC09tCUEXIt5L+5zb7GH36OBmpYYHGpmQl7imB48wFOElu0AlSBGt7dZxZM2
 V8oXCdqUbqkoa4VEY33b9E3erwZvhwW5kdZkadudfGVr4QJqNqKkA1333pCAgqQR6nT3
 /I6Q==
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
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Uma Shankar <uma.shankar@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Allison Randal <allison@lohutok.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMzoyNyBQTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJv
dmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiBBY2tlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3Yg
PGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKQWNrZWQtYnk6IFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29ubmVj
dG9yLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1p
X2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29ubmVjdG9yLmMK
PiBpbmRleCAwN2I0Y2I4NzdkODIuLjFmMDMyNjJiOGE1MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5jCj4gQEAgLTQ1MCw4ICs0NTAsMTAgQEAgc3RydWN0
IGRybV9jb25uZWN0b3IgKm1zbV9oZG1pX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBoZG1pICpoZG1p
KQo+Cj4gICAgICAgICBjb25uZWN0b3IgPSAmaGRtaV9jb25uZWN0b3ItPmJhc2U7Cj4KPiAtICAg
ICAgIGRybV9jb25uZWN0b3JfaW5pdChoZG1pLT5kZXYsIGNvbm5lY3RvciwgJmhkbWlfY29ubmVj
dG9yX2Z1bmNzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9I
RE1JQSk7Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoaGRtaS0+ZGV2LCBj
b25uZWN0b3IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmhkbWlfY29u
bmVjdG9yX2Z1bmNzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBoZG1pLT5pMmMpOwo+ICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3Rv
ciwgJm1zbV9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+Cj4gICAgICAgICBjb25uZWN0
b3ItPnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9DT05ORUNUIHwKPiAtLQo+IDIuMTcuMQo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
