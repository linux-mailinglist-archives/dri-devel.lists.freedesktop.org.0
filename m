Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D566A25D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F406E0B6;
	Tue, 16 Jul 2019 06:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7D26E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:45:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x3so12879548lfc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9T12+hl9hnnMUboHwVud3mcrGsBzqRgpDgDZvOPm4QM=;
 b=PnaP6mXZKwbEYdlLF6qtmVlc8qpD7xRpvd66HpKyRB4h1mg/P3J0jCHEUWgjBj5kmg
 w6CpG14zQxLEoiMKFPH2AFBibiWDEkxZ9eHZXX7IcOmnKdENewovZPRbXheLCt7fwV5v
 gaB4oEiSYuRlNPYXXEaJr6s11kMfOgNGBx8cMyfEPxPmV7FVIdRgD/7H50z3utSRPDfq
 YlyLpEjxWoPAsjbFsQUUqpGqvYsWT4yka/ICMGZuBsM1aeMbw8+Ly++cIQRw/abqPEHh
 0taKnTAy2La8H9+oFovOBe3btzh4k+8CTSAMK7Kzzgfdmky4hqA+v7SWDCvvc1RWZOx2
 3qkg==
X-Gm-Message-State: APjAAAXHzCz6epUUbkg2OXvJGcpntWFzQRrdV2PCfCEq/p5djDScLHKZ
 BBL9C8igz1p14vXxaeJmZWIg829x0mWw7A==
X-Google-Smtp-Source: APXvYqwyk/LQdueQBfzfgNpFZHPIHXYtgAPQ7kNoSLHSyP3c8nhws5NBrrENGV/UzzohOU8qysKVFg==
X-Received: by 2002:a19:ec15:: with SMTP id b21mr14822138lfa.32.1563259500690; 
 Mon, 15 Jul 2019 23:45:00 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.44.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:45:00 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/19] drm/i2c/ch7006: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:16 +0200
Message-Id: <20190716064220.18157-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9T12+hl9hnnMUboHwVud3mcrGsBzqRgpDgDZvOPm4QM=;
 b=hg8zKWwkCu52KIebcM6NZ5ZpH/Kt08qDIc1xxx+0qZ4+pJE0+IPBCXCJp7AaY1zNAc
 Guj7EzXBVy5cjvQvgDSjBDXCdYpWxcFdiPSOh1g6+dyqDYx5cCefbmCOCo526F4YAG/S
 o3wzCBcxgMeaAvMD7r6yMYebnmnl4niRnvhlpJLloBPkPcHcQRANHxCGhJ7CJpYVsSez
 424KS2mvnJ129RyNf37hNN/N0udDGVjAp2nOCpqLuhHjXf6wjtR/rHZlsjZNnHj8QgLo
 m1uEANJOd4XcUCwb9aOQZFRs0RoX+uGK38FZjDV8W6Mlcgc2wrOPPmLfRFJdxGqpVQ7u
 m+xQ==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2luZyB0aGUgZGVwcmVjYXRlZCBkcm1QLmggaGVhZGVyIGZpbGUuCkZpeCBmYWxsb3V0
LgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpBY2tlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTJjL2NoNzAwNl9wcml2LmggfCAxIC0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2kyYy9j
aDcwMDZfcHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2kyYy9jaDcwMDZfcHJpdi5oCmluZGV4IGI2
ZTA5MTkzNTk3Ny4uOTg2YjA0NTk5OTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTJj
L2NoNzAwNl9wcml2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2kyYy9jaDcwMDZfcHJpdi5oCkBA
IC0yNyw3ICsyNyw2IEBACiAjaWZuZGVmIF9fRFJNX0kyQ19DSDcwMDZfUFJJVl9IX18KICNkZWZp
bmUgX19EUk1fSTJDX0NINzAwNl9QUklWX0hfXwogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVy
X3NsYXZlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
