Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D68C657D2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 15:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5331D6E219;
	Thu, 11 Jul 2019 13:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28C56E219
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:21:36 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r12so5781081edo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 06:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=j0PGDzjF751lq+wG7hd5A4SjZGnD+fRoABz1w7saNbY=;
 b=U8lfCxoe2ETdodhhN0FViJsD1BCXElPl1K5jrvaa/W14vRIbwlmyXrhZLVIbYNoPVD
 Vre30VSUxac8wsWxpH4oGkp6IyiTgfVNbwQ7xTqFq3axjNE45b+XvAst0h2OJrIqqo/H
 S9z+rmvGVmUEvJ2bwoUWs4FWJahTAZqkZl3NGoQRz0XA4Uls5Kee93mk/zs7sThNO+iT
 jx6B8cwCXC8jPSxc217GOjxvydQ8LgElIT3M8WtD6j/wCTQmFkLN02IHvjyPJGrszcun
 39CBcyqHP9LmXwk2aRd6Csfn785lqieBuph1UPrTiDTNvW0QaKEyLpfCIe6PgrjJmhgE
 3inQ==
X-Gm-Message-State: APjAAAWOBUyrQWg/0ZDID2huWA2ihrdmgAwBJSEbYrNFZ3cZvtdmd6BT
 yM0KM7+/GGmVJgOQ4vYBs7Q=
X-Google-Smtp-Source: APXvYqxoiLbZjEKrlTcp0swP5YJm39SDpWJzYqSNar79QbcJw/lYnhNk6alxjdxGJYUJ8T4GsmE6gg==
X-Received: by 2002:a17:906:474a:: with SMTP id
 j10mr3244938ejs.104.1562851295309; 
 Thu, 11 Jul 2019 06:21:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id d12sm1605711edp.16.2019.07.11.06.21.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 06:21:34 -0700 (PDT)
Date: Thu, 11 Jul 2019 15:21:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 23/23] drm/i915: Provide ddc symlink in hdmi connector
 sysfs directory
Message-ID: <20190711132130.GN15868@phenom.ffwll.local>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <1d9bb3d65127a5093d6e9f9cc62a5c7c7502f61d.1562843413.git.andrzej.p@collabora.com>
 <20190711115926.GT5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711115926.GT5942@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=j0PGDzjF751lq+wG7hd5A4SjZGnD+fRoABz1w7saNbY=;
 b=d+F2cnZTdXcZyijtUniQr3MFxPJ+Yn0fF1HQWIFBSN1t0i9LjEjcS0/wO2obiZk7GK
 G9YSUmZZud3xGDH70tZd3d5T6malhWgLBUwFtQQphPkwzOEnv87G8Ia4XZu0lntgkBCi
 Pb6qdCrxMlfipQtldxKylR/voUVov+SL0XpBg=
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
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 ChrisWilson@phenom.ffwll.local, Jonas Karlman <jonas@kwiboo.se>,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDI6NTk6MjZQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAxOjI2OjUwUE0gKzAyMDAsIEFuZHJ6
ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+IFVzZSB0aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQg
YnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFdlIGFscmVhZHkgaGF2ZSBhIHN5bWxpbmsg
dmlhIGludGVsX2hkbWlfY3JlYXRlX2kyY19zeW1saW5rKCkuIEkgZ3Vlc3MKPiB3ZSBzaG91bGQg
cmVtb3ZlIHRoYXQgaW4gZmF2b3Igb2YgdGhlIGdlbmVyaWMgb25lLiBPbGVnPwoKU2luY2UgdGhh
dCBjb21taXQgaXMgdmVyeSBuZXcgSSB0aGluayB3ZSBzaG91bGQgdHJ5IHJlYWwgaGFyZCB0byBh
dm9pZCB0aGUKaTkxNS1pc20gaGVyZSAuLi4KLURhbmllbAoKPiAKPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgNSAr
KystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4gPiBp
bmRleCAwZWJlYzY5YmJiZmMuLjY3OGZhNGQxYmQ0ZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwo+ID4gQEAgLTMwOTQsNiArMzA5NCw5IEBAIHZv
aWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICpp
bnRlbF9kaWdfcG9ydCwKPiA+ICAJCSBpbnRlbF9kaWdfcG9ydC0+bWF4X2xhbmVzLCBwb3J0X25h
bWUocG9ydCkpKQo+ID4gIAkJcmV0dXJuOwo+ID4gIAo+ID4gKwlpbnRlbF9oZG1pLT5kZGNfYnVz
ID0gaW50ZWxfaGRtaV9kZGNfcGluKGRldl9wcml2LCBwb3J0KTsKPiA+ICsJY29ubmVjdG9yLT5k
ZGMgPSBpbnRlbF9nbWJ1c19nZXRfYWRhcHRlcihkZXZfcHJpdiwgaW50ZWxfaGRtaS0+ZGRjX2J1
cyk7Cj4gPiArCj4gPiAgCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNvbm5lY3RvciwgJmludGVs
X2hkbWlfY29ubmVjdG9yX2Z1bmNzLAo+ID4gIAkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1J
QSk7Cj4gPiAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZpbnRlbF9oZG1p
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwo+ID4gQEAgLTMxMDUsOCArMzEwOCw2IEBAIHZvaWQg
aW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRl
bF9kaWdfcG9ydCwKPiA+ICAJaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTAgfHwgSVNfR0VN
SU5JTEFLRShkZXZfcHJpdikpCj4gPiAgCQljb25uZWN0b3ItPnljYmNyXzQyMF9hbGxvd2VkID0g
dHJ1ZTsKPiA+ICAKPiA+IC0JaW50ZWxfaGRtaS0+ZGRjX2J1cyA9IGludGVsX2hkbWlfZGRjX3Bp
bihkZXZfcHJpdiwgcG9ydCk7Cj4gPiAtCj4gPiAgCWlmIChXQVJOX09OKHBvcnQgPT0gUE9SVF9B
KSkKPiA+ICAJCXJldHVybjsKPiA+ICAJaW50ZWxfZW5jb2Rlci0+aHBkX3BpbiA9IGludGVsX2hw
ZF9waW5fZGVmYXVsdChkZXZfcHJpdiwgcG9ydCk7Cj4gPiAtLSAKPiA+IDIuMTcuMQo+IAo+IC0t
IAo+IFZpbGxlIFN5cmrDpGzDpAo+IEludGVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
