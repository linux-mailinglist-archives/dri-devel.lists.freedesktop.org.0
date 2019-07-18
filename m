Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684E6D1B0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E4B6E431;
	Thu, 18 Jul 2019 16:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F4C6E431;
 Thu, 18 Jul 2019 16:15:32 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p197so19602727lfa.2;
 Thu, 18 Jul 2019 09:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TBzEtdfCBC7JeGboomJdNlsAe05PLJaxt5wvtDjrcuc=;
 b=O/KQihKvdpoYqpoEE3MV6RGsi9hmb0NNG4hwZ4U/LhxItLPIhv/qaYVtvCxsh7eolm
 e+YNMMHNlZWYX7ZNZgFkn/HzEcBnBPTyEqxAcTxERWk4xFx+thlK9qhRoGO+5nNWtMi6
 N/jnvy2wk6UisA0DYuEYncVg66XAUZKH+tiUGRQD+jDtoQ4vxqIXPpwCihWyI6Non9Ku
 71D6uZKqhyaoGO91/fHh8/AhFceODjXpMFxiL0PptdSwfvDcT5LzCdPIQwdffi1vgn07
 G6dT07XlguF8Casy80P2wCaSw7DeFiuj7c02Ztav9JqEVrkVgyaBdSBhoY1pU10YbohK
 5zRA==
X-Gm-Message-State: APjAAAXBCTxFwI/MYICdYvSfRE5a/n0yaGTAcuzciBdc6KoZxbxfKf0E
 ZMpswYvLb7f4exQRchC9NlCp6ifr2GwS2w==
X-Google-Smtp-Source: APXvYqxR6UJvyzBrpoBKJ1t/MeC7+3uFD4fwDUCOIFsQ9De/62GDc97lhKJZ2LBIEMtYzSPi07yrWA==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr7852749lfn.46.1563466530686;
 Thu, 18 Jul 2019 09:15:30 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 04/11] drm/ati_pcigart: drop dependency on drm_os_linux.h
Date: Thu, 18 Jul 2019 18:15:00 +0200
Message-Id: <20190718161507.2047-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TBzEtdfCBC7JeGboomJdNlsAe05PLJaxt5wvtDjrcuc=;
 b=rCmwKJR0Ch/XIKuvX/iHVKTyWuto858/ULPTJNZuoxCPXol4vTi8kjxj+OdaXRHT2p
 6X2P9wZze0CqOaL4cU4Fu+dF5nzao2U+If/3C1Ki+1MGinO/FNJEwAznmWmf3mgwZopF
 cjQJhUjrAaTQ7iESM5EOl8nbtN5Kd82P/bCbjr9z/u0JOwcVUoQoGQeIsjyTbQwtPb8x
 rzCup7ZkSowfDduPVWmrzvT/m59PrUV7GE6LkJD8zixS/9mAKNe5A+RJhaj0lUXzlkhN
 2V+r1O1M7tPiHg09aIT6VLwMqOplw0dPGxu03kCzU5Too4xcj+CwW98qLmBs2roVk8GE
 0sJQ==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9vc19saW51eC5oIGhlYWRlciBpcyBkZXByZWNhdGVkLgpKdXN0IG9wZW5jb2RlIHRo
ZSBzb2xlIERSTV9XUklURTMyKCkuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNv
bT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hdGlfcGNpZ2FydC5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXRpX3BjaWdhcnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hdGlfcGNpZ2FydC5jCmlu
ZGV4IDJhNDEzZTI5MWE2MC4uNTgwYWEyNjc2MzU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXRpX3BjaWdhcnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRpX3BjaWdhcnQuYwpAQCAt
MzUsNyArMzUsNiBAQAogCiAjaW5jbHVkZSA8ZHJtL2F0aV9wY2lnYXJ0Lmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9kZXZpY2UuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX29zX2xpbnV4Lmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9wY2kuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAKQEAgLTE2OSw2
ICsxNjgsNyBAQCBpbnQgZHJtX2F0aV9wY2lnYXJ0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgc3RydWN0IGRybV9hdGlfcGNpZ2FydF9pbmZvICpnYQogCQlwYWdlX2Jhc2UgPSAodTMyKSBl
bnRyeS0+YnVzYWRkcltpXTsKIAogCQlmb3IgKGogPSAwOyBqIDwgKFBBR0VfU0laRSAvIEFUSV9Q
Q0lHQVJUX1BBR0VfU0laRSk7IGorKykgeworCQkJdTMyIG9mZnNldDsKIAkJCXUzMiB2YWw7CiAK
IAkJCXN3aXRjaChnYXJ0X2luZm8tPmdhcnRfcmVnX2lmKSB7CkBAIC0xODQsMTAgKzE4NCwxMiBA
QCBpbnQgZHJtX2F0aV9wY2lnYXJ0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0
IGRybV9hdGlfcGNpZ2FydF9pbmZvICpnYQogCQkJCWJyZWFrOwogCQkJfQogCQkJaWYgKGdhcnRf
aW5mby0+Z2FydF90YWJsZV9sb2NhdGlvbiA9PQotCQkJICAgIERSTV9BVElfR0FSVF9NQUlOKQor
CQkJICAgIERSTV9BVElfR0FSVF9NQUlOKSB7CiAJCQkJcGNpX2dhcnRbZ2FydF9pZHhdID0gY3B1
X3RvX2xlMzIodmFsKTsKLQkJCWVsc2UKLQkJCQlEUk1fV1JJVEUzMihtYXAsIGdhcnRfaWR4ICog
c2l6ZW9mKHUzMiksIHZhbCk7CisJCQl9IGVsc2UgeworCQkJCW9mZnNldCA9IGdhcnRfaWR4ICog
c2l6ZW9mKHUzMik7CisJCQkJd3JpdGVsKHZhbCwgKHZvaWQgX19pb21lbSAqKW1hcC0+aGFuZGxl
ICsgb2Zmc2V0KTsKKwkJCX0KIAkJCWdhcnRfaWR4Kys7CiAJCQlwYWdlX2Jhc2UgKz0gQVRJX1BD
SUdBUlRfUEFHRV9TSVpFOwogCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
