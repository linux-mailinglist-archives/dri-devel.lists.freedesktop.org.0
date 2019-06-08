Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7439B9E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3278926C;
	Sat,  8 Jun 2019 08:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A75189266;
 Sat,  8 Jun 2019 08:03:06 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y198so3279394lfa.1;
 Sat, 08 Jun 2019 01:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IETlRUV8p2nUVRTHiexf1tqKSDRijAQ5i4xZ5iOUbUM=;
 b=TqU3ulczPolORZI1dziWHcgietKp72tUiDO+jLSYV22+YecLP04kgUi1C6sof8Ptgf
 pOHj2PvPcl51gxfAyXRgVOADLnZ7WiHxhWXslJ43FuMJJ8RtWUeXetQMr27qy7ID8qGo
 eJk5iJlkJUOYcTwAFdFjzP0oqcu14LGZYQsHrad9LbYsWWyRaYI9RKYdBCaVmMBoGrS/
 LCpUSOQA2nlm/i67FnRZZfM2o3kV70o2pl2v5+YwUeuWjXNLXvTvGa7psXUztmnSfnxf
 u+6RiajTzEYE9cI2GMXOpmuk6IXXfY9n6zefX0anCgYbYNwwcWy92oFwrRD3yRhBbWsI
 WHlQ==
X-Gm-Message-State: APjAAAWpB/bW4g700nu0EDrhh1pgHHX984hYdIl1M2Tg4oJXUTE92m6i
 WOHy9oscui20rrTiUasBvLZ/WwvkKZw=
X-Google-Smtp-Source: APXvYqzKw3P3NvOU8K1ns/qB6wC8wG3IiPpDNXaCv8WuHlESCltdQU9aSw48NMh4SkR9TNsjfL8PiQ==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr14504882lfn.46.1559980984210; 
 Sat, 08 Jun 2019 01:03:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f4sm756851ljm.13.2019.06.08.01.03.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:03:03 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 2/7] drm: drm_debugfs.h self-contained
Date: Sat,  8 Jun 2019 10:02:36 +0200
Message-Id: <20190608080241.4958-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608080241.4958-1-sam@ravnborg.org>
References: <20190608080241.4958-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IETlRUV8p2nUVRTHiexf1tqKSDRijAQ5i4xZ5iOUbUM=;
 b=Xvc8XS6ZqeTsQFsecC0mRbZkitfZjGd4DX1E3Op48RYXRlO4WdpglpiDRxBMwmmDc4
 uU3nGU+el3A4u/Y16bJLdmayHSaKr7R75QvSrMf/Hqq0iSsgIPLyMPnnT8FFRhUVPZYx
 IBvjapFgWkje4p/uXhW079RV/AS9iPa/jJ2ZOHc+dieR+4uubYK0WBuIpIehpZFh4TUZ
 Bo06GV8fIefzQNVBNtjqTF4OKY/nEKl9scg05ndL0PmLcQnU+IBo2Tqyu/4bqw6h9Tro
 x4cnmOkKJ3bQTRZK2P8ps/i+wU/Zqo7Dcg51jQreOoovl8ywrpgKrTREabngJr+nEtpZ
 syOA==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgcmVtb3ZpbmcgZHJtUC5oIGZyb20gZHJtL3JhZGVvbiBhIGZldyBmaWxlcyBlbmRlZAp1
cCBpbmNsdWRpbmcgZHJtX2RlYnVnZnMuaCBhcyB0aGUgZmlyc3QgZmlsZS4KVGhpcyBmYWlsZWQg
YnVpbGQgZHVlIHRvIG1pc3NpbmcgZGVwZW5kZW5jaWVzIGluIGRybV9kZWJ1Z2ZzLmguCgpBZGQg
dGhlIG1pc3NpbmcgaW5jbHVkZSBmaWxlcy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3Rs
aW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0t
LQogaW5jbHVkZS9kcm0vZHJtX2RlYnVnZnMuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZGVidWdmcy5oIGIvaW5j
bHVkZS9kcm0vZHJtX2RlYnVnZnMuaAppbmRleCBhYzBmNzVkZjFhYzkuLjc1MDFlMzIzZDM4MyAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RlYnVnZnMuaAorKysgYi9pbmNsdWRlL2RybS9k
cm1fZGVidWdmcy5oCkBAIC0zMiw2ICszMiw4IEBACiAjaWZuZGVmIF9EUk1fREVCVUdGU19IXwog
I2RlZmluZSBfRFJNX0RFQlVHRlNfSF8KIAorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisjaW5j
bHVkZSA8bGludXgvc2VxX2ZpbGUuaD4KIC8qKgogICogc3RydWN0IGRybV9pbmZvX2xpc3QgLSBk
ZWJ1Z2ZzIGluZm8gbGlzdCBlbnRyeQogICoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
