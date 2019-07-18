Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD96D1BD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2C96E44A;
	Thu, 18 Jul 2019 16:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324A56E43D;
 Thu, 18 Jul 2019 16:15:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m23so27879253lje.12;
 Thu, 18 Jul 2019 09:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=10tid0SbgLAJHLT6Dj0qLt3vQF4EYXu9iEc1Prbvqgw=;
 b=pFNxjtcN5ICjR7KH/kUuJ5w7n+uLVi6pwMDJaNWl8MWNcceaxZv2jWOAvlwSHp0SiG
 SWTU2+5x9otyAJ8jzsC2KfDEZX32hppnTTe3WDuXBfOUG7R2XJDLQrMQFxjUR+z7x7g3
 whWk4KUExiqO8QcYI6hmN+xF9/9b0xHgZsdOsZdTz6nvmaCOK3ROv4z92fksocz8T0rV
 V5MFAdRwq1IpJEM2u1+YNh4Xe/1GmtJaYxuXPyPFSOhtnY5ucNJG1XYYI8/jgipzHT4Y
 7waA8yn5et6nniEybE56ciTt9Oh48P33wbs03ik8QA5M4tTRqrxqNWOguuQ59f16mJdB
 Xq5w==
X-Gm-Message-State: APjAAAXy4sF+kmYGdpRabKvE7m8xDbkHdkEWGAl96DPZYovz2/4MQZOt
 xTw/xJ8Pq/OCMJeCEZsmGGYSWd4YUP3A8Q==
X-Google-Smtp-Source: APXvYqyyjjeWlVtkKPLelpLxs1R+JrlmGdwZIcymn6kyrEpcWL3dqIF1rfaZdBXxlK39KQ9CMTcu6g==
X-Received: by 2002:a2e:8449:: with SMTP id u9mr7397629ljh.104.1563466537982; 
 Thu, 18 Jul 2019 09:15:37 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d21sm4057995lfc.73.2019.07.18.09.15.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 09:15:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v1 09/11] drm: direct include of drm.h in drm_syncobj.c
Date: Thu, 18 Jul 2019 18:15:05 +0200
Message-Id: <20190718161507.2047-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10tid0SbgLAJHLT6Dj0qLt3vQF4EYXu9iEc1Prbvqgw=;
 b=J4HaiI2YX0j86EbGPmKvLuVB5kkrIiE0JPi96w0PTtQJ+WeWorKnf0wnW+HqJlrJHy
 qSdv8E+D4s3mKf2JUwxbi4a6P4mdXz9PpqY7vzn+xQPe3zqR6ZiyipTZPLcT2I0k8qF8
 rQ3A2HUaq9nSap9dOrWxZnAly25OyGD+GbK4BBXzRKkfl/R23q0KH8smJcOanrChNrxz
 fKDfqji2nuSzVi1JOvd+scOOlXW9E+OfV9/aelFA12KAejJMYaE623VMeVj/kf76X6UO
 TGiUb/sVZ3RlJ4IVwUXT2s1y+ls+gxTsIZ8c3UksOk+MVAb1DOZL5ZdI8iKOu3BxyKg1
 mTww==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlbHkgb24gaW5jbHVkaW5nIGRybS5oIGZyb20gZHJtX2ZpbGUuaCwKYXMgdGhlIGlu
Y2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxsIGJlIGRyb3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwu
Y29tPgpDYzogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCmluZGV4IGExOTljOGQ1NmI5NS4uNzVjYjRiYjc2MTllIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYwpAQCAtNTMsNiArNTMsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3N5
bmNfZmlsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KIAorI2luY2x1ZGUgPGRybS9k
cm0uaD4KICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5o
PgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
