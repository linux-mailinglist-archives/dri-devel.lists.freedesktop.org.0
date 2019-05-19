Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B442226F8
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492A889147;
	Sun, 19 May 2019 14:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAA789132
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r76so10069882lja.12
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rnVjGQEds6rRFs/NzOy61uplfQJJShylFtfiFTGIeuo=;
 b=hLNiUjUMS/6lJfk4SFR7ceqQbQzIdyePcH3AOQxbXKOlW3BaKGX123MV+igHEa6wGT
 bZxqUlTpI7tIvDiLlSYA5+6156srNjC9zP8Sltwtx5uau4rrAzlMQVlU/DwDWOIY3fqu
 8wrIFIwEwsaNP0GFtv28iu0Ayql16fqX1NXJRih0MXvdMSfH42E9y8aezrBnWtuVZdI8
 SKpc2Arx06CfOjRddEpOFNu5Cs7gW0cXoK+nmyNTxOjAu70iSeA5GUJ/Z/6Gadb42ez5
 6cCZpXs6j7nZxsntRWE5JPuATg8IBwUXszCGN2CZx0/nSWIuxKq/x038kPaD7I5R4YQJ
 uxPg==
X-Gm-Message-State: APjAAAWEmoa+IN1I5t8rV2vP3EEF0vIKCrBVaeh2Zeu2fIOnbZry4D5i
 5p4n4KjBusSuC5b3jAmjrW/sK/Zw
X-Google-Smtp-Source: APXvYqx3tcpOgn3RN5zOASJFbc1CHv9gdtyU4C1Zd+twnPoclOVnKrCjc8aqO82uVfoxPwH0T8EI4g==
X-Received: by 2002:a2e:298d:: with SMTP id p13mr34310563ljp.64.1558275651367; 
 Sun, 19 May 2019 07:20:51 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:50 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 02/06] drm: make drm_legacy.h self-contained
Date: Sun, 19 May 2019 16:20:32 +0200
Message-Id: <20190519142036.22861-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnVjGQEds6rRFs/NzOy61uplfQJJShylFtfiFTGIeuo=;
 b=ZD3A6FxbhGU5oiob37M1oEpb1DQQp19ut5HFUVBHwtzzJGY5n/M1Gg2VfRFK3Ef0sf
 cDeS8stuRvB332s5VuiBayumBMVolPJK/CfIQv0paWnHDxvS7AEprPBXgMVbzWxFj6WT
 IhhJkvjrT0qjjwxfbixVKqdNIGMg38T6W8+AeHKsTSmZEwFZJFk4DVaqq85WGIErhOZC
 GcIs4cqkAsglrEz8V3d4yO+MnRRuoRSivLzoy1PXEs2x5xJyNdh28yclddeYcOgZXDNs
 YnTp04+xTq1s6LTgOoH8QYUR1PsHMKAOwbg5Oy/d45xopmbPViXGf0pW2wIZEym1udcX
 qd1w==
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

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2xlZ2FjeS5oIHRvIGluY2x1ZGUgb3RoZXIgZmls
ZXMKanVzdCB0byBsZXQgaXQgYnVpbGQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgotLS0K
IGluY2x1ZGUvZHJtL2RybV9sZWdhY3kuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbGVnYWN5LmggYi9pbmNsdWRl
L2RybS9kcm1fbGVnYWN5LmgKaW5kZXggMjE4MmE1NmFjNDIxLi4xZDMyYWNkNzEyZGUgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9sZWdhY3kuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fbGVn
YWN5LmgKQEAgLTEsMTAgKzEsMTIgQEAKICNpZm5kZWYgX19EUk1fRFJNX0xFR0FDWV9IX18KICNk
ZWZpbmUgX19EUk1fRFJNX0xFR0FDWV9IX18KIAorI2luY2x1ZGUgPGRybS9kcm0uaD4KICNpbmNs
dWRlIDxkcm0vZHJtX2F1dGguaD4KICNpbmNsdWRlIDxkcm0vZHJtX2hhc2h0YWIuaD4KIAogc3Ry
dWN0IGRybV9kZXZpY2U7CitzdHJ1Y3QgZmlsZTsKIAogLyoKICAqIExlZ2FjeSBkcml2ZXIgaW50
ZXJmYWNlcyBmb3IgdGhlIERpcmVjdCBSZW5kZXJpbmcgTWFuYWdlcgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
