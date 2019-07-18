Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA36D2E7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 19:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACE56E428;
	Thu, 18 Jul 2019 17:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4956E428
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 17:40:30 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id f195so11565298ybg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l+1FrNNu6RWkcTjjfIpN7v4qd/Q00mT7mAH2ay5t5YU=;
 b=VMyIH8B0rG2LNhsTneGIGIT2AFQD/zltbfqo33iqvIk2dSLyPGkrm4xWDu3JVtuD3S
 EHKC08kJicvSg1Z/DSiXUjtob3QmxGXTLbxCo9wl7glzY0QwXGdkPxeWY93srDBxgPuH
 XXYok3fa/EvD71Q/7Py7HUHNLZFncaJo3oQXyguPbuSBer5TvIp+wPOHzeCV6Az0kwVk
 xxjzk59IXW5+KQpaNpjo1i/wkqbXnjGDOCvYnB0bP8Q5vVyHnjNI3qQSx6pv87BKlUSV
 OxhaqgP93NnWM2tZ02mFVviEtMcDVUrAUr/2LGG0GdfBTqqa7roILyQ5tt3O16tTCav3
 TwWw==
X-Gm-Message-State: APjAAAWtnoDiCqZQe9wJan9Uo4jcZ1QhNXBQgyK4S5qM6z8qIEQV/r5I
 7ktX1AR2HFTcPDZYLt28H4JCxkoH/PmM/A==
X-Google-Smtp-Source: APXvYqxJ1zzhHTOV/V5q7YuSBr7QrcgmxKPpucgiwKedIA1Pi+QKm5M5Imn/NYHMNbUAMKQOdVF3Ww==
X-Received: by 2002:a25:6346:: with SMTP id x67mr27596848ybb.346.1563471629832; 
 Thu, 18 Jul 2019 10:40:29 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 131sm6583625ywq.21.2019.07.18.10.40.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 10:40:29 -0700 (PDT)
Date: Thu, 18 Jul 2019 13:40:28 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Message-ID: <20190718174028.GE31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-3-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l+1FrNNu6RWkcTjjfIpN7v4qd/Q00mT7mAH2ay5t5YU=;
 b=biDTjzEvV5Wul7i/WyioSr3VmyuNnxd9hl/aYBxur1J6Nlh9JqlFb0SX0jszQpCzin
 DtF2vZkl1jAodp5GPZ848x9Bg3S7l99tSQNiR3UV5iI3T2AM6Ul0Yyjaj+HPsNHPbmEM
 hREO5I59HNuv1/JufTZlHI6uBu2224l76gZmOrBIYJ7P/j/8KEC7avxJPToSiwztK6iZ
 uFxLAt9tqS2/OoBrpFWslIOMZuqddBHI08EbjSsRKFuxkNbxSBSHHlQP7VKmVxJawD3G
 ORstO1Z9eGe8pSFWVeYtmngaruHc+XHO7DkCHJ8Egb5EFBlOdPb1P0Ffx818IOJV/gS3
 UiCQ==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTQ6NThQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybV9wcmludC5oIHVzZWQgRFJNX05BTUUgLSB0aHVzIGFkZGluZyBhIGRlcGVuZGVu
Y3kgZnJvbQo+IGluY2x1ZGUvZHJtL2RybV9wcmludC5oID0+IHVhcGkvZHJtL2RybS5oCj4gCj4g
SGFyZGNvZGUgdGhlIG5hbWUgImRybSIgdG8gYnJlYWsgdGhpcyBkZXBlbmRlbmN5Lgo+IFRoZSBp
ZGVhIGlzIHRoYXQgdGhlcmUgc2hhbGwgYmUgYSBtaW5pbWFsIGRlcGVuZGVuY3kKPiBiZXR3ZWVu
IGluY2x1ZGUvZHJtLyogYW5kIHVhcGkvKgoKWW91IG1pZ2h0IGFsc28gd2FudCB0byBjbGVhbiB1
cCB0aGUgb3RoZXIgdXNlcyBvZiBEUk1fTkFNRSBpbiBhcm1hZGEgYW5kIGk5MTUKd2hpbGUgeW91
J3JlIGF0IGl0LiBUaGUgZWFzaWVzdCB3YXkgdG8gc2F0aXNmeSBDaHJpcycgdXNlY2FzZSBhbmQg
cmVtb3ZlIHRoZQpkZXBlbmRlbmN5IHdvdWxkIGJlIHRvIGFkZCAjZGVmaW5lIERSTV9QUklOVF9O
QU1FICJkcm0iIGluIGRybV9wcmludC5oIGFuZCB1c2UKdGhhdC4KClNlYW4KCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFN1Z2dlc3RlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4K
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
Pgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fcHJp
bnQuaCB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIvaW5jbHVk
ZS9kcm0vZHJtX3ByaW50LmgKPiBpbmRleCBhNWQ2ZjJmM2U0MzAuLjc2MGQxYmQwZWFmMSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9wcmludC5oCj4gQEAgLTMyLDggKzMyLDYgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgo+ICAKPiAtI2luY2x1ZGUgPGRybS9kcm0u
aD4KPiAtCj4gIC8qKgo+ICAgKiBET0M6IHByaW50Cj4gICAqCj4gQEAgLTI4Nyw3ICsyODUsNyBA
QCB2b2lkIGRybV9lcnIoY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pOwo+ICAvKiBNYWNyb3MgdG8g
bWFrZSBwcmludGsgZWFzaWVyICovCj4gIAo+ICAjZGVmaW5lIF9EUk1fUFJJTlRLKG9uY2UsIGxl
dmVsLCBmbXQsIC4uLikJCQkJXAo+IC0JcHJpbnRrIyNvbmNlKEtFUk5fIyNsZXZlbCAiWyIgRFJN
X05BTUUgIl0gIiBmbXQsICMjX19WQV9BUkdTX18pCj4gKwlwcmludGsjI29uY2UoS0VSTl8jI2xl
dmVsICJbZHJtXSAiIGZtdCwgIyNfX1ZBX0FSR1NfXykKPiAgCj4gICNkZWZpbmUgRFJNX0lORk8o
Zm10LCAuLi4pCQkJCQkJXAo+ICAJX0RSTV9QUklOVEsoLCBJTkZPLCBmbXQsICMjX19WQV9BUkdT
X18pCj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwg
R29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
