Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3106EE7C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 10:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4659D6E890;
	Sat, 20 Jul 2019 08:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1666E88A;
 Sat, 20 Jul 2019 08:45:56 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b17so23323776lff.7;
 Sat, 20 Jul 2019 01:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3CsnQP6tvpanmnXgS6dwE2otzR47Y3wWJh7ZT0YV+B4=;
 b=nAlCw8savWcdQpqGQc/zHpBJDiGkuD82gz2cxh9EfjkdUSz+Fr2/hQxcOXcYvZ1JGT
 wmYtD6p1ELcxMOUuqppOus/4XQocxcR26zGvycjYWkYi1iDqJZCw6Mgr9+pR1+p28tbY
 +j2df5hpsLjWF6DTKvWZ75vVIIixfkrCY9ajNxvvyoIHR1bGhWGeLWm58HX4wRQkIHDG
 9OCeP7lukW9w4nuTyeYQf21Phs2r6SO4/9b7YKD5bdHkKqbWmRWknGKMwpgxzTkQ5er1
 O/WLJbHaj1yS59BpK8z4JVWUVsBYEJsa5MdyKOztgoZUC/FkUWRAwh97qv+jrHpG+8xx
 uwFQ==
X-Gm-Message-State: APjAAAVS1gyzzYUQnpAyfeQUoBLZYunyyjKAdjsI5EXq4YcelmU+D9l2
 oYcz4N9E5Q0LslaITMyXdW05oCZzRxQ=
X-Google-Smtp-Source: APXvYqxur/qbwDqruEq4ksD5w1kS/TYdrzOrfzSqrwv6bePsRUnApHByOB19SH9qsFTEC9Ssp/ClhQ==
X-Received: by 2002:ac2:5bc7:: with SMTP id u7mr26589181lfn.167.1563612354532; 
 Sat, 20 Jul 2019 01:45:54 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o3sm5047022lfb.40.2019.07.20.01.45.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 01:45:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/via: make via_drv.h self-contained
Date: Sat, 20 Jul 2019 10:45:26 +0200
Message-Id: <20190720084527.12593-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190720084527.12593-1-sam@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3CsnQP6tvpanmnXgS6dwE2otzR47Y3wWJh7ZT0YV+B4=;
 b=JFWxQSVDqV1HsL9KjilMsPcAvZfmwX6Vw2Vt1XiuXmYN/jpcCl7rzuzaETaOwyB0KU
 zy0wejb4PXXlYGeC+6fre3LYzFEneLtoAwDV3bi4NeF3EWicwMgdl29Rx7wTB79tXxB0
 DOebm4uahnzRnMcSLQi/t9uAaAmRLrbOcI4L+lGwDeYp63GGkWe3YO2ihyLlsDIqFyCG
 hDRpYzSVPvS9pIjiQTCzf0NSuA0hVaznB/HfCArF7XCGqR3qhJus1unEkWfMjU/YvOG1
 KMuNCJOg8o+4DEUI/hgNebzXGh0qvRGG9t2Rc5D/scAhwFJjZzaYF8iRl6RJk8eB0ev6
 WREw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgaW5jbHVkZSBvZiBoZWFkZXIgZmlsZSB0byBtYWtlIHRoaXMgaGVhZGVyIGZpbGUKc2Vs
Zi1jb250YWluZWQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+CkNjOiBLZXZpbiBCcmFjZSA8a2V2aW5icmFjZUBnbXguY29tPgpDYzogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpDYzogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxn
dXN0YXZvQGVtYmVkZGVkb3IuY29tPgpDYzogTWlrZSBNYXJzaGFsbCA8aHViY2FwQG9tbmlib25k
LmNvbT4KQ2M6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgpDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFf
ZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaAppbmRleCA2NjRiN2Y4YTIwYzQu
LmE1OGFmMGFkNTEwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmgKQEAgLTI0LDEzICsyNCwxNiBAQAog
I2lmbmRlZiBfVklBX0RSVl9IXwogI2RlZmluZSBfVklBX0RSVl9IXwogCisjaW5jbHVkZSA8bGlu
dXgvaXJxcmV0dXJuLmg+CiAjaW5jbHVkZSA8bGludXgvamlmZmllcy5oPgogI2luY2x1ZGUgPGxp
bnV4L3NjaGVkLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQvc2lnbmFsLmg+CiAjaW5jbHVkZSA8
bGludXgvd2FpdC5oPgogCisjaW5jbHVkZSA8ZHJtL2RybV9pb2N0bC5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fbGVnYWN5Lmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9tbS5oPgorI2luY2x1ZGUgPGRybS92
aWFfZHJtLmg+CiAKICNkZWZpbmUgRFJJVkVSX0FVVEhPUgkiVmFyaW91cyIKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
