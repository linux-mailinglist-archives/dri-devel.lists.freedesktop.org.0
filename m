Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD798226FD
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48789256;
	Sun, 19 May 2019 14:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7368915F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:57 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c17so8464979lfi.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=quXBsXarHy8sh7eI4VnnOVkloyrYcJZ6jVyc4yKf6z0=;
 b=umjz7L8/61pxtmfuv2d3D/a1Yia2qE9p5qFgT67UdN8gownsdDilb6u1GnYk12jVBZ
 pI/ecdvEUKJoCWQggC1l5bP2rb3CsHELJ9lS8YqHvDw3e08AdzUzexrxBxnpncYUs2oL
 /ajcNAXuqD+VF9RX6Ewevtqtl9cfQ40DK0JFGNveg2GDoe1dE56Z9yBlFr6Wl+C5cCfO
 OACpkU9mDAg9dtxNubiIqW25vVTGtR41+8hwLJTgs6I+XGYhh+gNARssPgzkftrQ5oQA
 sp+ftSqwvYgzOQPFikfPwa/fB98MEI0G50kwwQSbW7gindU3AZtNIuvEW8K5tXsDCK5Z
 VuMQ==
X-Gm-Message-State: APjAAAUFqaenxgeOCcyLY9qmnzRPGurkaY8o/N3SHJus7W01qH5HFbJ/
 VPBmhGy99ywVHuOgd7cAYgR8ZFv9
X-Google-Smtp-Source: APXvYqzZqbTyk/hKmtt8pZNmjpECzmeeSIWb/KPgG6Oti3u2eZ/zS7sdb18gnOKqjQWRxc/lsIytXA==
X-Received: by 2002:a19:f817:: with SMTP id a23mr5751476lff.123.1558275655927; 
 Sun, 19 May 2019 07:20:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 06/06] drm: make drm_trace.h self-contained
Date: Sun, 19 May 2019 16:20:36 +0200
Message-Id: <20190519142036.22861-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=quXBsXarHy8sh7eI4VnnOVkloyrYcJZ6jVyc4yKf6z0=;
 b=ceV0c8WQUsM3JtNOSrcUyUEDxAplyTQf62HFNFluAuIfrJUma5y3KMBwVx07lpR1i8
 FPIC/YXpz8XXn+PQ4piCx1d6pX6LyFUG/etCVJMQHxj6Lyj8Kvy1SSTeOdsucxBmJLUX
 8sKPDyEjkSMO+NsejJMA22FrvYh/bSbYx1dgvizdZRdcV56ehCVueqJQkobkq16dQVRU
 KEJszmx8DXOO+wuU3ddlBmQJz+nclfinjKlBpdhundDD8msOCJPZ/65+ym5OsRUpAITQ
 IXZykTrvmsHK5oYeRuiDifyY1CCyAoplOKTvfnXUThKWuN+rKW2uZ8jB4CGVASuZUYte
 0jEQ==
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

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX3RyYWNlLmggdG8gaW5jbHVkZSBvdGhlcgpmaWxl
cyBqdXN0IHRvIGxldCBpdCBidWlsZAoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oIGIvZHJp
dmVycy9ncHUvZHJtL2RybV90cmFjZS5oCmluZGV4IGJhY2NjNjNkYjEwNi4uNDcxZWI5Mjc0NzRi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV90cmFjZS5oCkBAIC02LDYgKzYsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+CiAjaW5jbHVkZSA8bGludXgvdHJhY2Vwb2ludC5oPgogCitzdHJ1Y3QgZHJtX2ZpbGU7CisK
ICN1bmRlZiBUUkFDRV9TWVNURU0KICNkZWZpbmUgVFJBQ0VfU1lTVEVNIGRybQogI2RlZmluZSBU
UkFDRV9JTkNMVURFX0ZJTEUgZHJtX3RyYWNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
