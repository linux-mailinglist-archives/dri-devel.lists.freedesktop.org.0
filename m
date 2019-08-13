Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8A8B430
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE3A6E0D3;
	Tue, 13 Aug 2019 09:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CC6E0D2;
 Tue, 13 Aug 2019 09:33:44 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b1so1864438otp.6;
 Tue, 13 Aug 2019 02:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fe2+dAApvC1/VPt5qF5G9PQvhNevUg8+Cv3+qUMDu8o=;
 b=JSUzXkypSgWfGW9XaWCnkDZD5BQTU2H1xpoNyTzv/9LscQOjMR1dU/MGr2+tlnzKKo
 WGBjwtJH6FN1+VfEFwX3OEc2EUhfxULHzKXa+qC7USwafKV+WtRW+oVl8AzR4SBpW21e
 8YcRc2JEaF2OmDuTiiaeYFI9wEFAsg/PHnK3ixvMkBlF2OB4g02J4X6bNmu4ORqCnaV/
 lFjzamf6KPiB7iZVmrfbDnjBu/tIozwBLGW/ZsKBWYnSEQsO92xH10pNfQcMSLmSg2Jh
 7wg+KYyslFulMuD/fmJ2Oib+eKjs8RTUeJU9Dzl/wyWsW8hTPqQ/Mp1gzey9xoyc3NbM
 aXsQ==
X-Gm-Message-State: APjAAAUbduH/nFO9TdyltTOTCLcfpwNUhEdI57GobOeJ6ZutJ9jSvpdS
 GiqDAmlrnOL/rbfEuQe1ppNJmixw/fuFtq4IEd0=
X-Google-Smtp-Source: APXvYqwEtEvl7H6vDy32xA+A2TjXiepeEmCEppGcjO6tLj2iPxuIL4+T4ZepBvzdNwRLEXhv/kpaoXuvNsmrqAGDsHI=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr73710oto.250.1565688823565;
 Tue, 13 Aug 2019 02:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <ebb75e71b8b7c8d65d54a947a03fd21b8969fb3a.1564161140.git.andrzej.p@collabora.com>
 <20190808034208.GA31284@roeck-us.net>
In-Reply-To: <20190808034208.GA31284@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Aug 2019 11:33:32 +0200
Message-ID: <CAMuHMdXyGtogEfyFP1RnG2kM504WZ=nzfN_3z6rk4wJZqHaJQw@mail.gmail.com>
Subject: Re: [PATCH v6 19/24] drm/bridge: dumb-vga-dac: Provide ddc symlink in
 connector sysfs directory
To: Guenter Roeck <linux@roeck-us.net>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jyri Sarha <jsarha@ti.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Enrico Weigelt <info@metux.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR8O8bnRlciwKCk9uIFRodSwgQXVnIDgsIDIwMTkgYXQgNTo0MiBBTSBHdWVudGVyIFJvZWNr
IDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDA3
OjIzOjEzUE0gKzAyMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+IFVzZSB0aGUg
ZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+Cj4gVGhpcyBwYXRjaCByZXN1bHRzIGluIGEgY3Jhc2ggd2hlbiBydW5uaW5nIHFlbXU6
dmVyc2F0aWxlcGIuCj4KPiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMGM1Cj4gcGdkID0gKHB0cnZhbCkKPiBb
MDAwMDAwYzVdICpwZ2Q9MDAwMDAwMDAKPiBJbnRlcm5hbCBlcnJvcjogT29wczogNSBbIzFdIEFS
TQo+IE1vZHVsZXMgbGlua2VkIGluOgo+IENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlciBOb3Qg
dGFpbnRlZCA1LjMuMC1yYzErICMxCj4gSGFyZHdhcmUgbmFtZTogQVJNLVZlcnNhdGlsZSAoRGV2
aWNlIFRyZWUgU3VwcG9ydCkKPiBQQyBpcyBhdCBzeXNmc19kb19jcmVhdGVfbGlua19zZCsweDM4
LzB4ZDgKPiBMUiBpcyBhdCBzeXNmc19kb19jcmVhdGVfbGlua19zZCsweDM4LzB4ZDgKCj4gWzxj
MDFhYzk0Yz5dIChzeXNmc19kb19jcmVhdGVfbGlua19zZCkgZnJvbSBbPGMwNGM3ZmMwPl0gKGRy
bV9jb25uZWN0b3JfcmVnaXN0ZXIucGFydC4xKzB4NDAvMHhhMCkKPiBbPGMwNGM3ZmMwPl0gKGRy
bV9jb25uZWN0b3JfcmVnaXN0ZXIucGFydC4xKSBmcm9tIFs8YzA0Yzg3ZTA+XSAoZHJtX2Nvbm5l
Y3Rvcl9yZWdpc3Rlcl9hbGwrMHg5MC8weGI4KQo+IFs8YzA0Yzg3ZTA+XSAoZHJtX2Nvbm5lY3Rv
cl9yZWdpc3Rlcl9hbGwpIGZyb20gWzxjMDRjZWZjYz5dIChkcm1fbW9kZXNldF9yZWdpc3Rlcl9h
bGwrMHg0NC8weDZjKQo+IFs8YzA0Y2VmY2M+XSAoZHJtX21vZGVzZXRfcmVnaXN0ZXJfYWxsKSBm
cm9tIFs8YzA0YjRlYmM+XSAoZHJtX2Rldl9yZWdpc3RlcisweDE1Yy8weDFjMCkKPiBbPGMwNGI0
ZWJjPl0gKGRybV9kZXZfcmVnaXN0ZXIpIGZyb20gWzxjMDRkZjJmOD5dIChwbDExMV9hbWJhX3By
b2JlKzB4MmUwLzB4NGFjKQo+IFs8YzA0ZGYyZjg+XSAocGwxMTFfYW1iYV9wcm9iZSkgZnJvbSBb
PGMwNDVlOGQ4Pl0gKGFtYmFfcHJvYmUrMHg5Yy8weDExOCkKClNlZWluZyB0aGUgc2FtZSB0aGlu
ZyBvbiBTYWx2YXRvci1YUywgZHVlIHRvIHZnYS0+ZGRjIGJlaW5nIC1FTk9ERVYuCgo+ICMgZmly
c3QgYmFkIGNvbW1pdDogW2E0ZjkwODdlODVkZTE0MWU0ZTZkMjFhYzJjNTgzYWUwOTZjYzlhYmFd
IGRybS9icmlkZ2U6IGR1bWItdmdhLWRhYzogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0
b3Igc3lzZnMgZGlyZWN0b3J5CgpGaXggc2VudApodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTkwODEzMDkzMDQ2LjQ5NzYtMS1nZWVydCtyZW5lc2FzQGdsaWRlci5iZS8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
