Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81910F02D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0AC6E2DA;
	Mon,  2 Dec 2019 19:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342526E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:24 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m6so868399ljc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Y1mqiAE5RcwUiFVegDkD/kI5NKO3CN9zEHEAS4n6tI=;
 b=ZxjisF+hQ3Oo7LGguO22FSD8XZWPFYzEv2HoYeQhcvDjiwWlKzM3Htk/680A/ut3ph
 g7wfRU7NFf3vxM6gkWl0TNPmL57tyv5hLDgCrrovcA//8L87V04x8qWvT62/nR6vA2Ss
 Sx1Wlt1aB11YKsUXM35sK9hOV2EE0/vYXC5CXTLKHo/p/uvxjGcyyjqEpuOzo01TV8Qw
 ftged9UwDYUg9iNC1DjJRfHYQh48RBHNI18m0O3ikUlGiucmJJ3ACFMT3HViN4AwNBBE
 0Ctt4pqEMOibpUf74bru8c6HvVYhVJ8+dH8suBYA5aqwBMgw4eGe+EETbhkF3DikrevE
 nq8g==
X-Gm-Message-State: APjAAAU9ZQ6/nz1vkzgzYlQgpNmTP9r/5bDPi33Q2FbZ0FUlYjYIcU49
 MDreNnl14lusqhVSHe+f/skE91ZsC+HlFw==
X-Google-Smtp-Source: APXvYqxkxVmRA7p6+jFuEl6sc6enaU4TOldkVPnjP/5gpD+fwCWFbaI2otg2zdXHDExHl1Fmyas7wg==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr265078ljg.3.1575315202212;
 Mon, 02 Dec 2019 11:33:22 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:21 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 09/26] drm/panel: feiyang-fy07024di26a30d: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:13 +0100
Message-Id: <20191202193230.21310-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Y1mqiAE5RcwUiFVegDkD/kI5NKO3CN9zEHEAS4n6tI=;
 b=eLSVwBKzRfmXzJ69INKynMpE4N+QQ7C9joHALFYJRJTjHtsbtAjm27xqORSgSJupcp
 S0nGdqqVn2kkSardiQERm/a90jeAPPwGzVanVoD35JhitHcJH53uxrfd7S2Zi58vhbzD
 FUorU2ibBmatCrIxrMQB+K6o40M7+/0VcP3JSzDRyM1/xNcRLTV/gvQg2ucde6SD5EbP
 KLhChZtOknbLmrQ7u8kIrf6AmS0NqVBWY/0VOEMtArY1WWLoUolWQKGFBK/eWf8pcYxE
 TmnkPIOHMXGihWqlXSE1d4uJJhE7omNjuBNqZznXzaSsMk2nsVlWG+zqWOJ3mzb1lva1
 xjvw==
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
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
SmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1mZWl5YW5nLWZ5MDcwMjRk
aTI2YTMwZC5jIHwgMTAgKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtZmVpeWFuZy1meTA3MDI0ZGkyNmEzMGQuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1mZWl5YW5nLWZ5MDcwMjRkaTI2YTMwZC5jCmluZGV4IDAxNTdkMTg0NGUzZS4uOTViNzg5YWI5
ZDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZmVpeWFuZy1meTA3
MDI0ZGkyNmEzMGQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtZmVpeWFuZy1m
eTA3MDI0ZGkyNmEzMGQuYwpAQCAtOSw3ICs5LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX3BhbmVs
Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgogCi0jaW5jbHVkZSA8bGludXgvYmFja2xp
Z2h0Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4
L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CkBAIC0yMiw3ICsyMSw2IEBAIHN0
cnVjdCBmZWl5YW5nIHsKIAlzdHJ1Y3QgZHJtX3BhbmVsCXBhbmVsOwogCXN0cnVjdCBtaXBpX2Rz
aV9kZXZpY2UJKmRzaTsKIAotCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlCSpiYWNrbGlnaHQ7CiAJ
c3RydWN0IHJlZ3VsYXRvcgkqZHZkZDsKIAlzdHJ1Y3QgcmVndWxhdG9yCSphdmRkOwogCXN0cnVj
dCBncGlvX2Rlc2MJKnJlc2V0OwpAQCAtMTAyLDcgKzEwMCw2IEBAIHN0YXRpYyBpbnQgZmVpeWFu
Z19lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJbXNsZWVwKDIwMCk7CiAKIAltaXBp
X2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb24oY3R4LT5kc2kpOwotCWJhY2tsaWdodF9lbmFibGUoY3R4
LT5iYWNrbGlnaHQpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xMTEsNyArMTA4LDYgQEAgc3RhdGlj
IGludCBmZWl5YW5nX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CiAJc3RydWN0
IGZlaXlhbmcgKmN0eCA9IHBhbmVsX3RvX2ZlaXlhbmcocGFuZWwpOwogCi0JYmFja2xpZ2h0X2Rp
c2FibGUoY3R4LT5iYWNrbGlnaHQpOwogCXJldHVybiBtaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlf
b2ZmKGN0eC0+ZHNpKTsKIH0KIApAQCAtMjI1LDkgKzIyMSw5IEBAIHN0YXRpYyBpbnQgZmVpeWFu
Z19kc2lfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCQlyZXR1cm4gUFRSX0VS
UihjdHgtPnJlc2V0KTsKIAl9CiAKLQljdHgtPmJhY2tsaWdodCA9IGRldm1fb2ZfZmluZF9iYWNr
bGlnaHQoJmRzaS0+ZGV2KTsKLQlpZiAoSVNfRVJSKGN0eC0+YmFja2xpZ2h0KSkKLQkJcmV0dXJu
IFBUUl9FUlIoY3R4LT5iYWNrbGlnaHQpOworCXJldCA9IGRybV9wYW5lbF9vZl9iYWNrbGlnaHQo
JmN0eC0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKIAlyZXQgPSBkcm1fcGFu
ZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAlpZiAocmV0IDwgMCkKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
