Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E256984F2E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A072A6E720;
	Wed,  7 Aug 2019 14:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779A66E720
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:53:04 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id o82so556233ybg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yzd13DG1rp+WsyyQG2U0e84Dj24v4+N318aTRdw7530=;
 b=K2nJ/K1tN/DIugmpbw5HzBXfXrLRfOtYVs5mEiXnP59BvVvnWC/8Kzvgm1DONpAdyM
 BuQELiOsfN1P7yjMVPnQhoCems7txyK/AHSi6BCO8BrQpa19mOAiQTv1snSYsGPB59Hf
 1RMguaSXk2tLG9bIUcOP5c+53TRmUbUIicWVjl8f8TyoYoicbLhcR9UCXc90YxGqAYf1
 2A0tN0GupRf4sAuCZuGDgvyeER6HXjCyr9GWdTctpsqcCqjxPFt1No/4miwIqgNdZIzO
 bJ0QHu5P71LKfLCttrsNk/aLMmGYVxfqEw+HsZ1O02xNtkWUDT5mZ1LKQSv21PDFR/07
 TtDQ==
X-Gm-Message-State: APjAAAVJNIQWBvKC6UtKHGT6NcCL98lu2pJnbiiJPGSYI3vu10JyBr0v
 J929opNXl5KSP3ta7IOjpPT4J3tbOZE=
X-Google-Smtp-Source: APXvYqx03AXMou9AU1tg4JHLwJy/wNszNUqxKmPYcYWUlAFDE259ywtM6JOxtSfJYQnudOwFTVN4bw==
X-Received: by 2002:a25:ba81:: with SMTP id s1mr6797361ybg.354.1565189583544; 
 Wed, 07 Aug 2019 07:53:03 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id c123sm712935ywf.25.2019.08.07.07.53.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:53:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, robh@kernel.org, emil.velikov@collabora.com
Subject: [PATCH 2/2] Revert "drm/panfrost: Use drm_gem_map_offset()"
Date: Wed,  7 Aug 2019 10:52:48 -0400
Message-Id: <20190807145253.2037-3-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190807145253.2037-1-sean@poorly.run>
References: <20190807145253.2037-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yzd13DG1rp+WsyyQG2U0e84Dj24v4+N318aTRdw7530=;
 b=UDEy+ckbATFh4PJW7sT+KN15TaTALyWXTadz9Q5XHvUUXfIvpt2dllu585zi5pSKd2
 rl0VoHQlglfyH8hG8RZa4ZJmKIZqAceRE6gHNTKjDxwjHhhoY0aRjTHkWRurQXd3dN6n
 c70ZGiFEqHhoNY2s8fuB9UlaRN63r06a54tgpwTrhZIU/o2zcHF10E9wDdX233K+tQLe
 0OSPFlCvaigPrbY7otybF3V+XEVT/vg1epnifGAY3ADZVOHWZ1Sl3BakTdmtYEN8X+ot
 eyJoNWJzTvASOsu1Nf6gbTgNFDZPOT8x9/QCDC9ztnacyZ3ZPfKrMfVYYSRF1hFk8fyU
 3KYw==
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
Cc: Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClRoaXMgcmV2ZXJ0cyBjb21taXQg
NTgzYmJmNDYxMzNjNzI2YmFlMjc3ZThmNGUzMmJmYmEyYTUyOGM3Zi4KClR1cm5zIG91dCB3ZSBu
ZWVkIG1tYXAgdG8gd29yayBvbiBpbXBvcnRlZCBCT3MgZXZlbiBpZiB0aGUgY3VycmVudCBjb2Rl
CmlzIGJ1Z2d5LgoKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
U2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgMTYgKysrKysrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IGIyZTMyNWUyNzBiNy4uYjE4N2RhYTRk
YTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBAIC0yOTEsMTQg
KzI5MSwyNiBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX21tYXBfYm8oc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJICAgICAgc3RydWN0IGRybV9maWxlICpmaWxlX3By
aXYpCiB7CiAJc3RydWN0IGRybV9wYW5mcm9zdF9tbWFwX2JvICphcmdzID0gZGF0YTsKKwlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7CisJaW50IHJldDsKIAogCWlmIChhcmdzLT5mbGFn
cyAhPSAwKSB7CiAJCURSTV9JTkZPKCJ1bmtub3duIG1tYXBfYm8gZmxhZ3M6ICVkXG4iLCBhcmdz
LT5mbGFncyk7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCXJldHVybiBkcm1fZ2VtX21hcF9v
ZmZzZXQoZmlsZV9wcml2LCBkZXYsIGFyZ3MtPmhhbmRsZSwKLQkJCQkgICAgICAgJmFyZ3MtPm9m
ZnNldCk7CisJZ2VtX29iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlX3ByaXYsIGFyZ3Mt
PmhhbmRsZSk7CisJaWYgKCFnZW1fb2JqKSB7CisJCURSTV9ERUJVRygiRmFpbGVkIHRvIGxvb2sg
dXAgR0VNIEJPICVkXG4iLCBhcmdzLT5oYW5kbGUpOworCQlyZXR1cm4gLUVOT0VOVDsKKwl9CisK
KwlyZXQgPSBkcm1fZ2VtX2NyZWF0ZV9tbWFwX29mZnNldChnZW1fb2JqKTsKKwlpZiAocmV0ID09
IDApCisJCWFyZ3MtPm9mZnNldCA9IGRybV92bWFfbm9kZV9vZmZzZXRfYWRkcigmZ2VtX29iai0+
dm1hX25vZGUpOworCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKKworCXJl
dHVybiByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgcGFuZnJvc3RfaW9jdGxfZ2V0X2JvX29mZnNldChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAotLSAKU2VhbiBQYXVsLCBTb2Z0d2Fy
ZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
