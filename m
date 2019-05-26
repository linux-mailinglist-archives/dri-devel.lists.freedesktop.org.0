Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6B2AB68
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 19:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEAA89394;
	Sun, 26 May 2019 17:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D7D89395;
 Sun, 26 May 2019 17:35:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 136so281287lfa.8;
 Sun, 26 May 2019 10:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3ITXzxx/6Lab/Sya+XIDKQuQRI2sQcflbBULHcbr6+o=;
 b=o2td7c3c6ZpQVEpKjSwbg2CVYRmM8n5Lp+NmXq8RdwqCWQ1fdvzf5zE4DBAaSORxVF
 dDwWVcITk2HSwI57sfQDaI/LluoHQ/jhsocngDyd69OaziXq1UKGDpY+tQ6fcuJxGKLl
 Cv0sDsWZYEufw1WAhRdFN4IR04qFSjQ1+1peDZiIGkS+XAwVWniHvsSCIg4rm2J/eFwA
 662WuA/Ut7mKcavYFOOts9cL6V6QaaWpNPHGdlSVSCkuQ/w5xtBBM+UZtS1V9i8WBeQz
 ofqPblb3kez3cPJeIkFlaSFqLSDH8nvzl2LFOTvkb9BlJENkN2Sa7qJgnsovpsbAUMAh
 qXUw==
X-Gm-Message-State: APjAAAXrO4nSceKKlz41Fp5Rm1qOgXYetBLlFa6mFGwuFZ18Md7AGBJ1
 GUi2cOwJSeQ0ijof6ocxyqt+wIwe
X-Google-Smtp-Source: APXvYqy8A+mq5lc732K88bRDD0/RNqCma9j3tF8ZsWiv/Zn6pDEuk7vOQvBK7mMsY8BeLtAUD7w9LQ==
X-Received: by 2002:ac2:5285:: with SMTP id q5mr2562199lfm.146.1558892145072; 
 Sun, 26 May 2019 10:35:45 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n9sm1774489ljj.10.2019.05.26.10.35.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 10:35:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm: make drm/drm_legacy.h self-contained
Date: Sun, 26 May 2019 19:35:30 +0200
Message-Id: <20190526173535.32701-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526173535.32701-1-sam@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ITXzxx/6Lab/Sya+XIDKQuQRI2sQcflbBULHcbr6+o=;
 b=sbl0Atwu7MxdVg4HOMOhM/xVUwWvT3xuBftyao3/9jexRxZArU3wP1kLxXrThH4Mwx
 UeqyztAh9V4A3DGCCGW24pPV3jF7BKQVNLSXTNLKgsdhS+3rsgkNtp5/I0jzKQ7PkACl
 PP9d9IkIqYYc5WFwFZABjJzH2JpXYoGuvzusFpvt45k7oLcfX1ixDT6WPnDd0Zw6MARB
 5tN/x4LSOMglO2GYsvcCjIYEznxL7CnnF7Gx4hf1CfwdPzWN7PyqL1UhnKsMsM/d/rch
 IcZEHoZTEbHddlrdEOISby8NvaRL5L7mtyXZ0NZ0E0pLJx8wehSETcSbtjNEgAiGODC5
 ysEA==
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
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgaW5jbHVkZS9kcm0vZHJtX2xlZ2FjeS5oIHRvCmluY2x1
ZGUgb3RoZXIgZmlsZXMganVzdCB0byBsZXQgaXQgYnVpbGQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgotLS0KIGluY2x1ZGUvZHJtL2RybV9sZWdhY3kuaCB8IDEyICsrKysrKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fbGVnYWN5LmggYi9pbmNsdWRlL2RybS9kcm1fbGVnYWN5LmgK
aW5kZXggMjE4MmE1NmFjNDIxLi41OGRjMGMwNGJmOTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJt
L2RybV9sZWdhY3kuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fbGVnYWN5LmgKQEAgLTEsMTEgKzEs
NSBAQAogI2lmbmRlZiBfX0RSTV9EUk1fTEVHQUNZX0hfXwogI2RlZmluZSBfX0RSTV9EUk1fTEVH
QUNZX0hfXwotCi0jaW5jbHVkZSA8ZHJtL2RybV9hdXRoLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9o
YXNodGFiLmg+Ci0KLXN0cnVjdCBkcm1fZGV2aWNlOwotCiAvKgogICogTGVnYWN5IGRyaXZlciBp
bnRlcmZhY2VzIGZvciB0aGUgRGlyZWN0IFJlbmRlcmluZyBNYW5hZ2VyCiAgKgpAQCAtMzksNiAr
MzMsMTIgQEAgc3RydWN0IGRybV9kZXZpY2U7CiAgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09G
VFdBUkUuCiAgKi8KIAorI2luY2x1ZGUgPGRybS9kcm0uaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2F1
dGguaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2hhc2h0YWIuaD4KKworc3RydWN0IGRybV9kZXZpY2U7
CitzdHJ1Y3QgZmlsZTsKIAogLyoKICAqIExlZ2FjeSBTdXBwb3J0IGZvciBwYWxhdGVvbnRvbG9n
aWMgRFJNIGRyaXZlcnMKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
