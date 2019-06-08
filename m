Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E939B9C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FEF89267;
	Sat,  8 Jun 2019 08:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE089262;
 Sat,  8 Jun 2019 08:03:04 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b11so3261305lfa.5;
 Sat, 08 Jun 2019 01:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zrkn3eY7+H9qyvDbC5RC9K93kcQiyv4rYLVWIYT41lA=;
 b=HvqTT5O8rOFb0Sa12ao1/ByVsBqCcxFgDq3CHtkaOcCXxmUcRf//z3aioIVrxrMHzL
 GYPqeZaVkEOGC8b92zcc0qyFZ3Z/SIViJhIoLz7v6b/Ro8VuMZymmqoeiYXvMWOPEpTD
 FEvq5TSJ3zG0IkalpLlx30/Ry0j7f0tdc8md6FjAMCPsNxCX0ivKZWeomPq9+u6jNDjI
 ssuUftMt2U6PdzvODGB2F/bY9Jm4dzrdGZo8MlnmXQSJugCzHQS3FYlAANg0tM2n/65G
 ETqjc6CEYZ6SCZX/k7+FlBAfZOHf2cuV84NuegAger/4lcJO4zJdK8AXnOy5lFqP2LBy
 OUvQ==
X-Gm-Message-State: APjAAAV6DGko7E5zTudM0ucZN5irhH4KveN5ktqwUM99ay9LivEglmnT
 ItJIr2pimYyFq60kD7mlLwX0W/VkzaI=
X-Google-Smtp-Source: APXvYqx+SMcybYjAzI9dkLGU282u4LNfPgDAaUy0DzQj8KPbBYIugCq9EqGeGqiCFEvgu2osB9g7yQ==
X-Received: by 2002:ac2:5337:: with SMTP id f23mr30065266lfh.15.1559980983159; 
 Sat, 08 Jun 2019 01:03:03 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f4sm756851ljm.13.2019.06.08.01.03.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:03:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/7] drm: drm_crtc.h self-contained
Date: Sat,  8 Jun 2019 10:02:35 +0200
Message-Id: <20190608080241.4958-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608080241.4958-1-sam@ravnborg.org>
References: <20190608080241.4958-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrkn3eY7+H9qyvDbC5RC9K93kcQiyv4rYLVWIYT41lA=;
 b=jV/Ua/uj9Wj5UxgskehcYeirpvXjoSyFOGzbU23a+Cei1FnyRkVC5KBw+i9frGXDVb
 IN3Hy5D3OSsibK8w69E78xRWVtpmODRolS8nUbJ8QTtJ+aGoDTQZdi8JIDwpU4Z//7Rv
 mF++bLLswRQpYm0iQ6PvbSSTWz1jTUJJobusXZScRz+YUhQar/NSOfavirDcL3GSbrYc
 Nz/1YTaAooHAj8rUxZ6GqZ3E4UeDAtwnPnHJx1GI7I1gApFJB7X/9J91Re2PGYlH1ETR
 +Moun/V3PNIVtjdS7lOZE3e0DeBEjr6r7Nwh3QSqzjtMVPwff/8Y6oK59WUewadTN0Yi
 WReQ==
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
cCBpbmNsdWRpbmcgZHJtX2NydGMuaCBhcyB0aGUgZmlyc3QgZmlsZS4KVGhpcyBmYWlsZWQgYnVp
bGQgZHVlIHRvIGEgbWlzc2luZyBkZXBlbmRlbmN5IGluIGRybV9jcnRjLmguCgpBZGQgdGhlIG1p
c3NpbmcgaW5jbHVkZSBmaWxlLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+
CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBpbmNs
dWRlL2RybS9kcm1fY3J0Yy5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oIGIvaW5jbHVkZS9kcm0vZHJtX2Ny
dGMuaAppbmRleCA1OGFkOTgzZDdjZDYuLmRjNDJiOWUzNTMzMyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2NydGMuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oCkBAIC0zOSw2ICsz
OSw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPgogI2luY2x1ZGUgPGRybS9k
cm1fbW9kZXMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgorI2luY2x1ZGUgPGRy
bS9kcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9wZXJ0eS5oPgogI2luY2x1ZGUg
PGRybS9kcm1fYnJpZGdlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9lZGlkLmg+Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
