Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58D9A8ED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0076EBD3;
	Fri, 23 Aug 2019 07:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3196EBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:34:58 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x3so7954894lji.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWhyqZI+RyxZp+FLk4Dgae8z/RXq1pkybZ7Bwrb+ZCM=;
 b=KmZ4wTj0kp03zNEVbwOEmaJVq24C9pdJ6ucE+7aKBugkzKEvjOLTh/okEGOSH+Aond
 jbgHaQQ+BRtTPe98GiMtmmOK9uL/ISeSja90jHwVb0+r3Wp0IwjABnVQGcCU3AySroPw
 gVdiQYlcDAD480Y4dM3X8tuxSaBTT0Ldvh7m1lHxuinz9AStMXo/Zb9MvWaHBUJSAxIv
 pT/q+hrrtziLEovuwTVgRgIG+mHKwIJzE+e3mSb6of4aI1SNZ2IbGmO9YnojuWzfYwEN
 ssuCy49jWmEsN8G634s3c3O4yqh8XA/a2fwrbX0/nxt8jJdzJkYcszC7sf/lrAsoi1GR
 VJxQ==
X-Gm-Message-State: APjAAAWc2tNojtu1gm9FuuyF/kPkFaqNgU2ZUhdCFs2OjZnnTIqU6PjP
 mw7hdRywOCafqoMitiZUG06Gog==
X-Google-Smtp-Source: APXvYqwE7u2Cs/tTCozVbGiGnJ7iMpM+OrgYgkUfeZIdWWR0fNMzgWHa/Qd+FYH1ykVSS4a9eQpqHA==
X-Received: by 2002:a2e:914c:: with SMTP id q12mr2052131ljg.34.1566545696789; 
 Fri, 23 Aug 2019 00:34:56 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:34:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/6 v2] drm/msm/dsi: Drop unused GPIO includes
Date: Fri, 23 Aug 2019 09:34:44 +0200
Message-Id: <20190823073448.8385-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWhyqZI+RyxZp+FLk4Dgae8z/RXq1pkybZ7Bwrb+ZCM=;
 b=iZWqkN2xUIjsY5VbuNfnpVbnLrR2fvQe/6iNNcrdauqIWg8r7Lk9WFj1khRph5byLA
 6RwOND0kiZNLX9/QXicq6PnTD0NyE7i2/icCnxLNy9dEW/MBWvqtrsMUWqYAXDaau8Ee
 McR3meUDHDe+NB+ZypD2E0zMsvAH2BYeZRjT86W6EtOyasq0OyPz1Hzj0u8s/2flH8gb
 TYakAXyFno2/OQgZMgVPPaNaDw+db76oJBcTJC9J+Q5lF88aKm6W0dktNQ4AtSgeeaZH
 IdMwt0tQzKHa7611JHWfdn40qS8MRaCeVqMtrDxRolM1hawqxFWbc6MT7SiIp+a9Srnx
 7Rzw==
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
Cc: dri-devel@lists.freedesktop.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBEU0kgZHJpdmVyIHVzZXMgdGhlIG5ldyBkZXNjcmlwdG9yIEFQSSBzbyB0aGVzZSBvbGQK
R1BJTyBBUEkgaW5jbHVkZXMgYXJlIHN1cnBsdXMuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpS
ZXZpZXdlZC1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+ClNpZ25lZC1v
ZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNoYW5n
ZUxvZyB2MS0+djI6Ci0gUmViYXNlZCBvbiB2NS4zLXJjMQotIENvbGxlY3RlZCByZXZpZXcgdGFn
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDIgLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCmluZGV4
IGFhMzVkMThhYjQzYy4uNGI2ZjYyMTM4MzkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfaG9zdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0
LmMKQEAgLTYsMTEgKzYsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+Ci0jaW5jbHVkZSA8bGludXgvZ3Bp
by5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9p
bnRlcnJ1cHQuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KLSNpbmNsdWRlIDxsaW51
eC9vZl9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAjaW5jbHVkZSA8bGludXgv
cGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
