Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116780C76
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5089EA3;
	Sun,  4 Aug 2019 20:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9E889EA3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:36 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z28so23210839ljn.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TFw8aj8TVKqYV1qdWp7H7PSv0EjnAL5XrV9yT7wyYzI=;
 b=awyh6ttas3jrP0WOdYbrbDdIPsbWAWahaKFs3FKmQFybiMpwDahLiraN5a/W0Fzq/s
 OEkKvDj9X3JVffs+uwY7ivrWamfV49S68C02ZpluhlkcHzvprsIgOGki2aqhYhbsdEZv
 s/7B6D5Vnf5qLS6A11lIMJG9DxVsWbyIuK6OitRwJ0MhHy5UzpqwUsyCMVHAZsEvJFq7
 Eg1uXvW11Rd6ToFPHdgAQCBbEqiaJJmEsdMpp0bXCm5/VZ3CWnZHAfVVsm9Z4bzW+Gyr
 PNu5HqFxx5cxn4dcZm4xmggXZZej3lG3DlwEwrPIkyAvJUxuIGzjej3sbdul8PrOjY56
 vMjw==
X-Gm-Message-State: APjAAAUBAPK7ZP8im7ONZtxVHLVeW7lzNe5WLH7BbKvEoWbBOdIwYi7k
 qg2tTroIU4K3cfzgTqOHnREuvMdFT8NzZg==
X-Google-Smtp-Source: APXvYqyoAufw1JJb+gisc/+GrH+nZNn6Oe74hLjpr94kfXr5VFnqYqHplX0Q3NQsQ1CxOz1UwLnarA==
X-Received: by 2002:a2e:b0ea:: with SMTP id h10mr31006790ljl.50.1564949855034; 
 Sun, 04 Aug 2019 13:17:35 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 12/16] drm/panel: use inline comments in drm_panel.h
Date: Sun,  4 Aug 2019 22:16:33 +0200
Message-Id: <20190804201637.1240-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFw8aj8TVKqYV1qdWp7H7PSv0EjnAL5XrV9yT7wyYzI=;
 b=rwd7igj5BUr8/KxH5fDWHXDr9Bb3jwowv9EXwDKoBAF6i6RKSOD2641bxv40d1HHKN
 90PRk5+MErpunsqUa+ibcmpfyC1UfMifTvwajUbZ8ZqHuCMYFJKBBAjwFBo2W68OzUai
 G53Jvo1D5DDJzo+gKXvmakpxb/DH5/PhMw8aEahnixPu/po32d3aI+NDSSadM47kTbM/
 lqjP4OcW0y9Bk1NfPNwspN6J3RHQ7WY7F72jJQW2++3tGl6ZnUz3D5o0HtacBnaewCu6
 3kXeiK7YR5BoUUssAQyLfTo21VXL0dOrPgDks3dsZ86AAQ5AoD6rN4Cu2hcIz7NKG/Ie
 NLxA==
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5saW5lIGNvbW1lbnRzIHByb3ZpZGUgYmV0dGVyIHNwYWNlIGZvciBhZGRpdGlvbmFsIGNvbW1l
bnRzLgpDb21tZW50cyB3YXMgc2xpZ2h0bHkgZWRpdGVkIHRvIGZvbGxvdyB0aGUgbm9ybWFsIHN0
eWxlLApidXQgbm8gY2hhbmdlIHRvIGFjdHVhbCBjb250ZW50LgpVc2VkIHRoZSBvcHBvcnR1bml5
IHRvIGNoYW5nZSB0aGUgb3JkZXIgaW4gZHJtX3BhbmVsX2Z1bmNzCnRvIGZvbGxvdyB0aGUgb3Jk
ZXIgdGhleSB3aWxsIGJlIHVzZWQgYnkgYSBwYW5lbC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5o
IHwgODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fcGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCmluZGV4IDA1
M2Q2MTE2NTZiOS4uNWU2MmRlZWE0OWJhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFu
ZWwuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMzYsMTQgKzM2LDYgQEAgc3Ry
dWN0IGRpc3BsYXlfdGltaW5nOwogCiAvKioKICAqIHN0cnVjdCBkcm1fcGFuZWxfZnVuY3MgLSBw
ZXJmb3JtIG9wZXJhdGlvbnMgb24gYSBnaXZlbiBwYW5lbAotICogQGRpc2FibGU6IGRpc2FibGUg
cGFuZWwgKHR1cm4gb2ZmIGJhY2sgbGlnaHQsIGV0Yy4pCi0gKiBAdW5wcmVwYXJlOiB0dXJuIG9m
ZiBwYW5lbAotICogQHByZXBhcmU6IHR1cm4gb24gcGFuZWwgYW5kIHBlcmZvcm0gc2V0IHVwCi0g
KiBAZW5hYmxlOiBlbmFibGUgcGFuZWwgKHR1cm4gb24gYmFjayBsaWdodCwgZXRjLikKLSAqIEBn
ZXRfbW9kZXM6IGFkZCBtb2RlcyB0byB0aGUgY29ubmVjdG9yIHRoYXQgdGhlIHBhbmVsIGlzIGF0
dGFjaGVkIHRvIGFuZAotICogcmV0dXJuIHRoZSBudW1iZXIgb2YgbW9kZXMgYWRkZWQKLSAqIEBn
ZXRfdGltaW5nczogY29weSBkaXNwbGF5IHRpbWluZ3MgaW50byB0aGUgcHJvdmlkZWQgYXJyYXkg
YW5kIHJldHVybgotICogdGhlIG51bWJlciBvZiBkaXNwbGF5IHRpbWluZ3MgYXZhaWxhYmxlCiAg
KgogICogVGhlIC5wcmVwYXJlKCkgZnVuY3Rpb24gaXMgdHlwaWNhbGx5IGNhbGxlZCBiZWZvcmUg
dGhlIGRpc3BsYXkgY29udHJvbGxlcgogICogc3RhcnRzIHRvIHRyYW5zbWl0IHZpZGVvIGRhdGEu
IFBhbmVsIGRyaXZlcnMgY2FuIHVzZSB0aGlzIHRvIHR1cm4gdGhlIHBhbmVsCkBAIC02OSwzMSAr
NjEsODkgQEAgc3RydWN0IGRpc3BsYXlfdGltaW5nOwogICogdGhlIHBhbmVsLiBUaGlzIGlzIHRo
ZSBqb2Igb2YgdGhlIC51bnByZXBhcmUoKSBmdW5jdGlvbi4KICAqLwogc3RydWN0IGRybV9wYW5l
bF9mdW5jcyB7Ci0JaW50ICgqZGlzYWJsZSkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwotCWlu
dCAoKnVucHJlcGFyZSkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOworCS8qKgorCSAqIEBwcmVw
YXJlOgorCSAqCisJICogVHVybiBvbiBwYW5lbCBhbmQgcGVyZm9ybSBzZXQgdXAuCisJICovCiAJ
aW50ICgqcHJlcGFyZSkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOworCisJLyoqCisJICogQGVu
YWJsZToKKwkgKgorCSAqIEVuYWJsZSBwYW5lbCAodHVybiBvbiBiYWNrIGxpZ2h0LCBldGMuKS4K
KwkgKi8KIAlpbnQgKCplbmFibGUpKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKKworCS8qKgor
CSAqIEBkaXNhYmxlOgorCSAqCisJICogRGlzYWJsZSBwYW5lbCAodHVybiBvZmYgYmFjayBsaWdo
dCwgZXRjLikuCisJICovCisJaW50ICgqZGlzYWJsZSkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
OworCisJLyoqCisJICogQHVucHJlcGFyZToKKwkgKgorCSAqIFR1cm4gb2ZmIHBhbmVsLgorCSAq
LworCWludCAoKnVucHJlcGFyZSkoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOworCisJLyoqCisJ
ICogQGdldF9tb2RlczoKKwkgKgorCSAqIEFkZCBtb2RlcyB0byB0aGUgY29ubmVjdG9yIHRoYXQg
dGhlIHBhbmVsIGlzIGF0dGFjaGVkIHRvIGFuZAorCSAqIHJldHVybiB0aGUgbnVtYmVyIG9mIG1v
ZGVzIGFkZGVkLgorCSAqLwogCWludCAoKmdldF9tb2Rlcykoc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwpOworCisJLyoqCisJICogQGdldF90aW1pbmdzOgorCSAqCisJICogQ29weSBkaXNwbGF5IHRp
bWluZ3MgaW50byB0aGUgcHJvdmlkZWQgYXJyYXkgYW5kIHJldHVybgorCSAqIHRoZSBudW1iZXIg
b2YgZGlzcGxheSB0aW1pbmdzIGF2YWlsYWJsZS4KKwkgKi8KIAlpbnQgKCpnZXRfdGltaW5ncyko
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwsIHVuc2lnbmVkIGludCBudW1fdGltaW5ncywKIAkJCSAg
IHN0cnVjdCBkaXNwbGF5X3RpbWluZyAqdGltaW5ncyk7CiB9OwogCiAvKioKICAqIHN0cnVjdCBk
cm1fcGFuZWwgLSBEUk0gcGFuZWwgb2JqZWN0Ci0gKiBAZHJtOiBEUk0gZGV2aWNlIG93bmluZyB0
aGUgcGFuZWwKLSAqIEBjb25uZWN0b3I6IERSTSBjb25uZWN0b3IgdGhhdCB0aGUgcGFuZWwgaXMg
YXR0YWNoZWQgdG8KLSAqIEBkZXY6IHBhcmVudCBkZXZpY2Ugb2YgdGhlIHBhbmVsCi0gKiBAbGlu
azogbGluayBmcm9tIHBhbmVsIGRldmljZSAoc3VwcGxpZXIpIHRvIERSTSBkZXZpY2UgKGNvbnN1
bWVyKQotICogQGZ1bmNzOiBvcGVyYXRpb25zIHRoYXQgY2FuIGJlIHBlcmZvcm1lZCBvbiB0aGUg
cGFuZWwKLSAqIEBsaXN0OiBwYW5lbCBlbnRyeSBpbiByZWdpc3RyeQogICovCiBzdHJ1Y3QgZHJt
X3BhbmVsIHsKKwkvKioKKwkgKiBAZHJtOgorCSAqCisJICogRFJNIGRldmljZSBvd25pbmcgdGhl
IHBhbmVsLgorCSAqLwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07CisKKwkvKioKKwkgKiBAY29u
bmVjdG9yOgorCSAqCisJICogRFJNIGNvbm5lY3RvciB0aGF0IHRoZSBwYW5lbCBpcyBhdHRhY2hl
ZCB0by4KKwkgKi8KIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOworCisJLyoqCisJ
ICogQGRldjoKKwkgKgorCSAqIFBhcmVudCBkZXZpY2Ugb2YgdGhlIHBhbmVsLgorCSAqLwogCXN0
cnVjdCBkZXZpY2UgKmRldjsKIAorCS8qKgorCSAqIEBmdW5jczoKKwkgKgorCSAqIE9wZXJhdGlv
bnMgdGhhdCBjYW4gYmUgcGVyZm9ybWVkIG9uIHRoZSBwYW5lbC4KKwkgKi8KIAljb25zdCBzdHJ1
Y3QgZHJtX3BhbmVsX2Z1bmNzICpmdW5jczsKIAorCS8qKgorCSAqIEBsaXN0OgorCSAqCisJICog
UGFuZWwgZW50cnkgaW4gcmVnaXN0cnkuCisJICovCiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0Owog
fTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
