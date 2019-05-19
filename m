Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F17226FA
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0C8915F;
	Sun, 19 May 2019 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BBA8915F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:56 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h13so8433847lfc.7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qq0xd3JW4W4qcU58TMIvDu6+klCvOBSKG2Ynq4DNHyQ=;
 b=KulH9K/OrAeAuuRW5kjLxjhNLYfP5Oa//YVuEI/HM3PCAh6gLoZu8atAtbqlorhN7w
 vF5XOvr6xcHlintB5iYYB5QJLjABMI6JNTIl3FCW6TZ+FfvDdFsao3XdSB0RlbdUxH+h
 k6fl12TiwEX0x9dW75wLacrcCDCsqz1a6VXDQ3Dx3qo28GN5R52+FeN1HIPzUapbKjew
 uX3c7y95Cb1+w0BkD7vTch+7CtH4appQqHiqN1n7cwHLnZuwTYeaIe+jNpIstI9U504w
 waALcC2ncziT6jzE/OjDMWKTpc/8Zmfx/3++yQFCaYtUtPIjePfpOaPZ63VTw5r/A36d
 Ro7g==
X-Gm-Message-State: APjAAAX8VwdiuKTB2XvAtSpulJZSAXfwmarDxwhSQwv0FLyMa7s1DbQt
 ne80VKZW+szQTOWtFkpZQ7vcyCt7
X-Google-Smtp-Source: APXvYqy277Qg9oCy2liaZa2tIpnCQNC4K1eYEx5fzEhDRHQ9LsJjbEAz5+EzbleLpQOJMH3wzWEZow==
X-Received: by 2002:ac2:5474:: with SMTP id e20mr32545096lfn.59.1558275654815; 
 Sun, 19 May 2019 07:20:54 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 05/06] drm: make drm_legacy.h self-contained
Date: Sun, 19 May 2019 16:20:35 +0200
Message-Id: <20190519142036.22861-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq0xd3JW4W4qcU58TMIvDu6+klCvOBSKG2Ynq4DNHyQ=;
 b=tugh6O70up2N5a/Lqibo3AXC1+Dr6XzfbbnX1GzQZmj/Eb5ayoHXHYqQ+/TkyB6/60
 xrp1EQq0WHIg4HRWiqancg382wRKB+yKYVOR0biKFku66CtBQE8b0PwY5hC0Wq0D/A4h
 RTMRGtr39TCZECacs/G+m1muWLtnuKvbt5NierscZhnRmZJcBxTyjDsvnbz5UkiIIBaG
 ZwryYA4stUSpVC5zN2ks7rPoAicBkh4MEDizP0fmo3JCvZRirhpwpAFNBmTzsvdBRgJ5
 k93jOwXRwcydlwWO1XBEnp6on9rlseN3OIsoe1EAeACmeyJC2ec5pbUok3Sk+tphE7lR
 m56w==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2lsZWdhY3kuaCB0byBpbmNsdWRlIG90aGVyCmZp
bGVzIGp1c3QgdG8gbGV0IGl0IGJ1aWxkCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5LmggfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5o
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9sZWdhY3kuaAppbmRleCAwMTNjY2RmZDkwYmUuLjFiZTNl
YTMyMDQ3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9sZWdhY3kuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5oCkBAIC0yOSwxMSArMjksMTUgQEAKICAqIGRyaXZl
cnMgdXNlIHRoZW0sIGFuZCByZW1vdmluZyB0aGVtIGFyZSBBUEkgYnJlYWtzLgogICovCiAjaW5j
bHVkZSA8bGludXgvbGlzdC5oPgorCisjaW5jbHVkZSA8ZHJtL2RybS5oPgorI2luY2x1ZGUgPGRy
bS9kcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KIAogc3RydWN0IGFn
cF9tZW1vcnk7CiBzdHJ1Y3QgZHJtX2RldmljZTsKIHN0cnVjdCBkcm1fZmlsZTsKK3N0cnVjdCBk
cm1fYnVmX2Rlc2M7CiAKIC8qCiAgKiBHZW5lcmljIERSTSBDb250ZXh0cwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
