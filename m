Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53FE1F8E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050FE6E121;
	Wed, 23 Oct 2019 15:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7026E121
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:40:45 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id d126so4542357vkb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 08:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9h2bLlE5uiElXoN05sFkiX8cpYZeJb4T7lrsDWBorqE=;
 b=VXQmbSQ32PdvtOeHZTlfYa/Ixb4jy1CNuAXtLyN0/f1qlXE+Ewp+S5XFRypruzTnK5
 g4RvFFc4zeKk0N+GSXs6S6nzyX+KUJZEmu42FjdEVcBHmGlQZ2euREHgM/YdRV1qWV+6
 6awAAbjxSy4416R5RFDcW/pIXmp542xDOwjbzoAQm2KaCuAGLZe+OiJaXCfWw5p3iAwb
 9pKgs1J8g324sl0mMQBuZHhEtaT9mSc6qdTwVMh8vsX+riICrIQKTGXBQkqhxCGDIFuq
 v1Vc/qrksndi6jaiuhQUu68W2uLy18Lp5ZB6zRxNRyXDpqXegUqIz9iIMyWx63Xfn1QP
 fIOg==
X-Gm-Message-State: APjAAAUF0qK4DXb5uA3rndwC9rRFcK5eXvohTw9TSYsS2Tc315kr9k+2
 /iGT+LM5dtPkfiTpkPzzjEqz2zhuZP7qNcpQz+xn0w==
X-Google-Smtp-Source: APXvYqzaMIBdBVepIccYwBzdNqs3rmPjsUfK3AV3PIIRWofrSco90CTOzOVF8tSUUK/baA5la1UAjuL99PuFgJcw5Lo=
X-Received: by 2002:a1f:944a:: with SMTP id w71mr3666213vkd.60.1571845243467; 
 Wed, 23 Oct 2019 08:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191023101256.20509-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191023101256.20509-1-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2019 17:40:32 +0200
Message-ID: <CACRpkdYfh=9oextiC1rtQ2UQ72OW_0TqjCe4AmvRtXKVv_ZazQ@mail.gmail.com>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9h2bLlE5uiElXoN05sFkiX8cpYZeJb4T7lrsDWBorqE=;
 b=dz7Jck3bJtS+Q3i9sActcxjLeaJGGZ6fDfedCIA5pyBgDY4IPDQlFJhFT21PyFismE
 lq+2IGol/AMrZDdrr/b3ffMHRJFC52qLVAGiGon/4WQ5Xc8t/YNJJhAdAs1MjtOYDBk+
 TX8WITu1cQTk9oydx2umzGy06BmwQ70PMg3XGDSe/7GlL49s2H9D4xe7s8NeP5HkMsPs
 tMaF+Pnj7Wtowr4+u4wia30/J126VfShkz5+oSnX5MzcnbBJzRSwLdoRNMwjkZf33Oww
 Xy9N/L4lrnflRTgMoPwuOJjRTGIPCSp3w9LP9yOqhD73tobsarHI8UyVJU+9FyxiYBwP
 XifQ==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTI6MTMgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cgo+IFBhc3NpbmcgdGhlIHdyb25nIHR5cGUgZmVlbHMgaWNr
eSwgZXZlcnl3aGVyZSBlbHNlIHdlIHVzZSB0aGUgcGlwZSBhcwo+IHRoZSBmaXJzdCBwYXJhbWV0
ZXIuIFNwb3R0ZWQgd2hpbGUgZGlzY3Vzc2luZyBwYXRjaGVzIHdpdGggVGhvbWFzCj4gWmltbWVy
bWFubi4KPgo+IHYyOiBNYWtlIHhlbiBjb21waWxlIGNvcnJlY3RseQo+Cj4gQWNrZWQtQnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiAodjEpCj4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
Cj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KCk1ha2VzIHBlcmZlY3Qgc2Vuc2UuClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
