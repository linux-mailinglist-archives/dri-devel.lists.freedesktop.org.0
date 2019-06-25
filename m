Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC856415
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162A16E2E1;
	Wed, 26 Jun 2019 08:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF016E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:34:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f15so8743242wrp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFDObtAhBFoq+e3uGBncXCZh94u1gqoIy533R027F8g=;
 b=quYhFrs/69St737OVdt/T/OZFtLPBZONSWFWwVm8Xw0HmB74SiuLj6Fea5cjRJJzR3
 Uij5ZQ2CCddMGe8ipTP3Aq6m9X1JYiNZdgTJcEcIwZKbdZPXBhvnJ+XwuygjbyYWspjh
 jZMG32IjrORQ+K4YUnZFG+/FtpFVC3DGA7zQM8MxY02SsBTSkbRFSENU+HSTfysMgVNk
 HhVt3bzkMi1ZpYGfGsl5GbO/84RWLWw8UCym/BJap3HE/83uWkn1WiIIm8cdlr9bhfh4
 W/O+dxFFw4JSI9isC7OznEjiZfdoI+yEJBxdOL6oSXveK9D3Dy/+f+Y5OV8gAetV4KCO
 ZiYg==
X-Gm-Message-State: APjAAAVS7860REexSjYY4ufS4uDO/jzmPyFM3jLC9tHh7nISWHGXlZCS
 nInREmAkagiBdOlu9K4NDJfGMQ==
X-Google-Smtp-Source: APXvYqw0FlaqXL9keBHWR7KbT8zOx0gQKa57yMr4s6cP5zk/w1cWEybKYPn7W1s8wCZ4fu5o6W6zoA==
X-Received: by 2002:adf:fc91:: with SMTP id g17mr25182759wrr.194.1561480498103; 
 Tue, 25 Jun 2019 09:34:58 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 05/12] ARM: davinci_all_defconfig: enable GPIO backlight
Date: Tue, 25 Jun 2019 18:34:27 +0200
Message-Id: <20190625163434.13620-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFDObtAhBFoq+e3uGBncXCZh94u1gqoIy533R027F8g=;
 b=G4Pw99p7XQ8OGBF3dnF0u8nsP2gzt973olZmzxwCvcharaKDy85867vLHAfEEMeOY6
 WbvGNVaQTvX6o6k0m03Dbg3bqJePqRGuhQt3WSt/PGG8Cb/oCVEqY2X6FLotNA0IXfJm
 ARyniYvJZe/t7VQyJcxGxpDqPU66WCtZIWCej1JRYrPbhTKgeT2by3xxii6Mp4ieweY4
 kcGKmEFn2Ow9kyf3HS2AOfy4WfOxqLajkqnTEHqnZVLC2+gcImOh2N06MabRO5E7+Uh0
 Rz8cDgo9FQcCj48JgPkYsVbGknrWRKT8C9/qsCP3bGmyaklMqjuX8zcNjbTiVOhmz5fy
 wOUA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkVu
YWJsZSB0aGUgR1BJTyBiYWNrbGlnaHQgbW9kdWxlIGluIGRhdmluY2lfYWxsX2RlZmNvbmZpZy4K
ClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJy
ZS5jb20+Ci0tLQogYXJjaC9hcm0vY29uZmlncy9kYXZpbmNpX2FsbF9kZWZjb25maWcgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Nv
bmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9kYXZpbmNpX2Fs
bF9kZWZjb25maWcKaW5kZXggMTNkNzg0NmM2MTNkLi4wNjg1NWIyYmNlN2UgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2Nv
bmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnCkBAIC0xNTgsNiArMTU4LDcgQEAgQ09ORklHX0ZC
PXkKIENPTkZJR19GSVJNV0FSRV9FRElEPXkKIENPTkZJR19GQl9EQThYWD15CiBDT05GSUdfQkFD
S0xJR0hUX1BXTT1tCitDT05GSUdfQkFDS0xJR0hUX0dQSU89bQogQ09ORklHX0ZSQU1FQlVGRkVS
X0NPTlNPTEU9eQogQ09ORklHX0xPR089eQogQ09ORklHX1NPVU5EPW0KLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
