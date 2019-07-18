Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156D36D1A7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ADF6E433;
	Thu, 18 Jul 2019 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588CE6E431;
 Thu, 18 Jul 2019 16:15:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id z15so15343081lfh.13;
 Thu, 18 Jul 2019 09:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZMM3AoTDxthXTgGf4L3oHv9Xw8A43N9eoN7QWgZY2HA=;
 b=LqmEoisozdRWGpHjl0uGx0W8jTyLe4+cb7reAB8lO6IBKLxgrCiVwHpZtWpmTrpRmA
 DzWTYG0/9cJpLuVUInQSobVdNm7OLxLqgkSanp/bKfaoUqSJcnoOsQoyuWIKFLLfgWad
 gNjP6L2n/wIIC1LUcwM93QF7SZ2MxggLKUJ8ZLT6A/oH8r6IeZAHq4RGvxMumlTiJPOR
 Heu7fu7wyml6df0x1T1MqrHDUfNUW9XO+MVLZNrJeKOviiqpo1mB2YKyWGSBtOpL21ek
 +6PPG6AIYJg+/2Fuz4HTKTD5SZ8i5KgsFK9qyGOk2zRf8ux5ODwgDB3N2HeBiBrRsFqz
 gBvg==
X-Gm-Message-State: APjAAAVKeIICbdT3BbtIbsyxPaW3ve2dnf/PE2O4RCqmfGa5IIug5FWn
 cR0dndTlI0+TNDPky9KCkHbqboWpJhH18g==
X-Google-Smtp-Source: APXvYqxjOhgC8N6n7ZnOJ74I1kbAhFiifIbk15ykKdzDjD5ivSxzoVTvrE+Xh/kq9CdAYpSgPT/Trw==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr21168038lfn.85.1563466527477; 
 Thu, 18 Jul 2019 09:15:27 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Date: Thu, 18 Jul 2019 18:14:58 +0200
Message-Id: <20190718161507.2047-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMM3AoTDxthXTgGf4L3oHv9Xw8A43N9eoN7QWgZY2HA=;
 b=aM3juu6pRx62RK8ZsZjl3w2sEqjDvq1T9hwgF2fi2kslQZ9EVXRy1TrnvCoAA6wRjy
 0Hpa2xhbcQlNmWLfKyJ7d7t3Pe7t1boHg1EoiH8q2Yx6V6SuQml6DDhpfRmZhzTX+Z5V
 7ttwmNtHmnE89Xb9pXYXsvarcZWZTALLRTmPEeR6B3Kw/Dyycfa2IlODdlQg0SiwGqz0
 /gVPZFpXU6MohWNT2XzAkCuqQd5fFixQrnuDs22LDOt4CTm2M0C+o2awH9UGs9ajFJLw
 oqw+1J5RU3riDwdphpwIcpkaQzsHX6YgVfn+tXrnTmAWg7zoNE2VEG9zF19ChGelU3Oc
 5+FQ==
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
 Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX3ByaW50LmggdXNlZCBEUk1fTkFNRSAtIHRodXMgYWRkaW5nIGEgZGVwZW5kZW5jeSBmcm9t
CmluY2x1ZGUvZHJtL2RybV9wcmludC5oID0+IHVhcGkvZHJtL2RybS5oCgpIYXJkY29kZSB0aGUg
bmFtZSAiZHJtIiB0byBicmVhayB0aGlzIGRlcGVuZGVuY3kuClRoZSBpZGVhIGlzIHRoYXQgdGhl
cmUgc2hhbGwgYmUgYSBtaW5pbWFsIGRlcGVuZGVuY3kKYmV0d2VlbiBpbmNsdWRlL2RybS8qIGFu
ZCB1YXBpLyoKClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
U3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
PgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA0
ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2luY2x1ZGUvZHJtL2RybV9wcmlu
dC5oCmluZGV4IGE1ZDZmMmYzZTQzMC4uNzYwZDFiZDBlYWYxIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fcHJpbnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaApAQCAtMzIsOCAr
MzIsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2RlYnVn
ZnMuaD4KIAotI2luY2x1ZGUgPGRybS9kcm0uaD4KLQogLyoqCiAgKiBET0M6IHByaW50CiAgKgpA
QCAtMjg3LDcgKzI4NSw3IEBAIHZvaWQgZHJtX2Vycihjb25zdCBjaGFyICpmb3JtYXQsIC4uLik7
CiAvKiBNYWNyb3MgdG8gbWFrZSBwcmludGsgZWFzaWVyICovCiAKICNkZWZpbmUgX0RSTV9QUklO
VEsob25jZSwgbGV2ZWwsIGZtdCwgLi4uKQkJCQlcCi0JcHJpbnRrIyNvbmNlKEtFUk5fIyNsZXZl
bCAiWyIgRFJNX05BTUUgIl0gIiBmbXQsICMjX19WQV9BUkdTX18pCisJcHJpbnRrIyNvbmNlKEtF
Uk5fIyNsZXZlbCAiW2RybV0gIiBmbXQsICMjX19WQV9BUkdTX18pCiAKICNkZWZpbmUgRFJNX0lO
Rk8oZm10LCAuLi4pCQkJCQkJXAogCV9EUk1fUFJJTlRLKCwgSU5GTywgZm10LCAjI19fVkFfQVJH
U19fKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
