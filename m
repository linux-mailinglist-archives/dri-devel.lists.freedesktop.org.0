Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168C341752
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF136E99F;
	Fri, 19 Mar 2021 08:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CA06E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id r12so8275321ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgIHEbwNozF8CQjai0jy8D0j5kT9wSfHdAr6OHIEyt8=;
 b=jFlylHIdiRjWW3YT3NJyatX6kumdMHVDL4w5muuu5ZNZkb2snt4y8ikCg0ranm6Ww8
 m96+ml0edqRsT4qgjrvCK1wmR2oixp86VlSHuHMKFeI7SwKtaHNkwIpQJGuwmFOBMvib
 8BnfX1G10yRT43gJCTd8AhCTP4I6RFuLd6Zp2FMpE0BRqb/AK6Zyb8wRvI9rSkXF8I5f
 XKXTj2wMGcieuKJSobaGIG2ybJpcCKSDTFqiahHaf4SOLV5wbFRZNMANF9OdrAHwTxfd
 +UzINV1MUayN9Bm9eBacrVY1zmu+7E+XNGBZY688dw0TJZxcrg7wwbkYDcuC1+rQr82C
 AGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgIHEbwNozF8CQjai0jy8D0j5kT9wSfHdAr6OHIEyt8=;
 b=hbJtBZRIZAE1CeVDg7VIYfm6VGbG+DrpMMb9Toyt8llqMMXKTKkBoYZX3O3MSyTneg
 YvxLdfIU+GnSo6iBKnRt6yr98SyAarpdFuaJQN0awUQsX3xd9PI14IzddH+s6E098+da
 kGflbuOMeujcncbLvqykrQZvwCX/gFSzRuR3S4qLFkjgPx86vIbZQQxCWON1arEl4gZq
 ip/sr7JDPvtrdpmEkESUxMl9pbet+uPgAGGqkC3FDCKm23bnfb49tLf9APeNRtkEnRWq
 pzOVWQpUX/4xk5N6llWJ5Gc5Hr95Z0MqeCxyLJEIYu1VTF9ojdQA8mjdyJ1EccBcXTtc
 01gg==
X-Gm-Message-State: AOAM530+sfDNyPKiXqueNIb0r0iJQ1hOclVDQw5cWVuq/cmU1DOe48le
 KVhijbwX5Qm5kJhP2UIq6ruT7g==
X-Google-Smtp-Source: ABdhPJyVuWB7o4CF5wAL/W6n7Ok9f0Tc0wd4Z4nANrbihKHz6pBJkEP20GSW1Lukf9i/YMR6XsDz9w==
X-Received: by 2002:a17:906:73c2:: with SMTP id
 n2mr3009679ejl.224.1616142286710; 
 Fri, 19 Mar 2021 01:24:46 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/19] drm/nouveau/nv50_display: Remove superfluous prototype
 for local static functions
Date: Fri, 19 Mar 2021 08:24:24 +0000
Message-Id: <20210319082428.3294591-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcjoKCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmM6MjUzMDoxOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKA
mG52NTBfZGlzcGxheV9maW5p4oCZCiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjcxOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnY1MF9kaXNwbGF5Lmg6MzY6Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2Yg4oCYbnY1
MF9kaXNwbGF5X2ZpbmnigJkgd2FzIGhlcgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252NTBfZGlzcGxheS5oOjM1OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKA
mG52NTBfZGlzcGxheV9pbml04oCZIHdhcyBoZXJlCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6MjU4MToxOiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mIOKAmG52
NTBfZGlzcGxheV9kZXN0cm954oCZIGZvbGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJhdGlvbgogSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Yzo3MToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM0OjY6IG5vdGU6
IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52NTBfZGlzcGxheV9kZXN0cm954oCZIHdhcyBo
ZXJlCgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCB8IDMgLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBf
ZGlzcGxheS5oCmluZGV4IGZiZDNiMTU1ODNiYzguLjI0MjE0MDFkMTI2MzYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oCkBAIC0zMSw3ICszMSw0IEBACiAjaW5jbHVkZSAi
bm91dmVhdV9yZWcuaCIKIAogaW50ICBudjUwX2Rpc3BsYXlfY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICopOwotdm9pZCBudjUwX2Rpc3BsYXlfZGVzdHJveShzdHJ1Y3QgZHJtX2RldmljZSAqKTsK
LWludCAgbnY1MF9kaXNwbGF5X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKik7Ci12b2lkIG52NTBf
ZGlzcGxheV9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICopOwogI2VuZGlmIC8qIF9fTlY1MF9ESVNQ
TEFZX0hfXyAqLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
