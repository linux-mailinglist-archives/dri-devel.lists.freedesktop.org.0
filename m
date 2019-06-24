Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5E5058F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 11:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AB589337;
	Mon, 24 Jun 2019 09:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7113389337
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:22:01 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e3so20706999edr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 02:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+BUYv0zqx8JIAejbVUFuWCyUFzi0Ma0oiXTkdM9XeBA=;
 b=taQMXXBXQqS6s1mDwwICQ4f6zEY2I6dvaoW5mNalgU8xeHhI5/r+NWlhpXRK8mVGdE
 uja2mGWmb1SUY/Hdgh4M7tmDrAUWC0/gQIAPj/de1Z/UG0D5y5HuucoT7dSaZlRHd51+
 60Vp1ObIXqbCq3IJjxV2NUirbeRe8DV1MJEF7bcdJic7JWu/VQjJ+RginX+UnTIp5eic
 9NrXOTV3efygoNSVNkzIbMQmNFSl3CUxqpabG5l+tP8AQyS5zPEfvkejGxaioY8LtUFK
 gatzDsP8pf6FAHt7EWGpmlmRjRR7hrXTDc0bJ95XIAc2XtuR5mYB0NiwVmWyTy1rR5GS
 43UQ==
X-Gm-Message-State: APjAAAXy2m949VkJXNsvG4v46uTAlwDxIClo61CejL/NusgcPL38g8ws
 m/erlPkyYzDA0HwwUwOX99/KnuH6gAg=
X-Google-Smtp-Source: APXvYqz8Q2nVLs1tDAdsiwqZ2dYDUxN/Py220zuadxrweoxy+8stjJzd4MvG81Wi2CYIZ1kAGnzZXw==
X-Received: by 2002:a17:906:1dcb:: with SMTP id
 v11mr1768180ejh.218.1561368119634; 
 Mon, 24 Jun 2019 02:21:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c3sm1769156ejo.43.2019.06.24.02.21.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 02:21:58 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if enabled
Date: Mon, 24 Jun 2019 11:21:53 +0200
Message-Id: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+BUYv0zqx8JIAejbVUFuWCyUFzi0Ma0oiXTkdM9XeBA=;
 b=D5WZwKUOqaEYxf9YiCGA1hGGeS+fnJ87Uk5TnGhZMEmbhxOZBjbdtmZi5JFaciO6rf
 fYk4DRN8WEzOg5rJR6avnD3k16txo0YzxSmxnlh68316/FKyoLfFUebCQ7IGOZqBH7ii
 KwbVftADxitSPXm1+Z5+bbC5EWcXZytEwhHbc=
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
Cc: Sean Paul <sean@poorly.run>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgbGlua2luZyBmYWlsIHdoZW4gZmJjb24vZmJkZXYgaXMgbW9kdWxhciBhbmQgdmdhc3dp
dGNoZXJvbyBpcwplbmFibGVkOgoKeDg2XzY0LWxpbnV4LWdudS1sZDogZHJpdmVycy9ncHUvdmdh
L3ZnYV9zd2l0Y2hlcm9vLm86IGluIGZ1bmN0aW9uIGB2Z2Ffc3dpdGNodG9fc3RhZ2UyJzoKdmdh
X3N3aXRjaGVyb28uYzooLnRleHQrMHg5OTcpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmYmNv
bl9yZW1hcF9hbGwnCgp2MjogSSBmaXJzdCB0cmllZCB0byBmaXggdGhpcyB3aXRoIGFuIEVYUE9S
VF9TWU1CT0wsIGJ1dCB2Z2Ffc3dpdGNoZXJvbyBpcwpuZXZlciBhIG1vZHVsZSwgc28gdGhpcyBk
b2Vzbid0IHdvcmsuCgpSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1
Zy5vcmcuYXU+ClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
Rml4ZXM6IDFjZDUxYjVkMjAwZCAoInZnYXN3aXRjaGVyb286IGNhbGwgZmJjb25fcmVtYXBfYWxs
IGRpcmVjdGx5IikKQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgpD
YzogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgpDYzogWWlzaGVuZyBYaWUgPHlzeGllQGZveG1haWwuY29tPgpD
YzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkNjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmll
bC50aG9tcHNvbkBsaW5hcm8ub3JnPgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZn
ZXIua2VybmVsLm9yZwotLQp3cnQgbWVyZ2luZyBwcm9iYWJseSBiZXN0IGlmIE1hYXJ0ZW4gYWRk
cyB0aGlzIHRvIHRoZSB0b3BpYyBicmFuY2ggd2UKaGF2ZSBhbHJlYWR5IGFuZCBzZW5kcyBvdXQg
YW4gdXBkYXRlZCBwdWxsIHJlcXVlc3QuCgpBcG9sb2dpZXMgZm9yIHRoZSBtZXNzLgotRGFuaWVs
Ci0tLQogZHJpdmVycy9ncHUvdmdhL0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnIGIvZHJpdmVy
cy9ncHUvdmdhL0tjb25maWcKaW5kZXggODRhYjQ4MmQwZGI2Li5jOGM3NzBiMDVlZDkgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L3ZnYS9LY29u
ZmlnCkBAIC0yMyw2ICsyMyw3IEBAIGNvbmZpZyBWR0FfU1dJVENIRVJPTwogCWRlcGVuZHMgb24g
WDg2CiAJZGVwZW5kcyBvbiBBQ1BJCiAJZGVwZW5kcyBvbiBQQ0kKKwlkZXBlbmRzIG9uIChGUkFN
RUJVRkZFUl9DT05TT0xFPW4gfHwgRkI9eSkKIAlzZWxlY3QgVkdBX0FSQgogCWhlbHAKIAkgIE1h
bnkgbGFwdG9wcyByZWxlYXNlZCBpbiAyMDA4LzkvMTAgaGF2ZSB0d28gR1BVcyB3aXRoIGEgbXVs
dGlwbGV4ZXIKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
