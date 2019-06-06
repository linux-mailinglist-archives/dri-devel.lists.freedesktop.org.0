Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F49238579
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7313A89AC3;
	Fri,  7 Jun 2019 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED7C89690
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:19 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 131so1377162ljf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQfbJoiQ5WTWGjUJ1PADkmMlX7UTg1NHq4Oh3Ljtrbo=;
 b=LArkyXbOmrijpuqGS+VyrP+Z47rZe8ee9up0dSnMiRkw6M+HyqC/jlDZDWDMVd0oJy
 aPrJw3TwrwMG0VLkCOXhLfMg3cMeZXxuuwzxX3GZqcecvfAdVYBMn+y+N62V3Wdf+mru
 LV4Kxipdjf7DhgxK0EBYGGAu5cxhEXePjXPDMmeJXvf2GEsf8hnCg6htrW4xsEdCPnYH
 bU4Yt1eLKioSVbFxVNjXYd/nwu641GkjM/ihZS6QEFTq+/rsBk60P9JrP9Dr5bY8a1dr
 3YMUcEEsKzXOKGQ9Y0+5g/TtnswdPy9VKsxBxxjRtrkghqrQZ5sBWrtp7AqCxiwo/Bm9
 5QkA==
X-Gm-Message-State: APjAAAVKXjCciZw7YQg4JDMTkkJ9j7cb9Zmf4AqBeyrISu52B0PWPY5l
 NF0VDaYPcwKiVlmqAARIiaykFg==
X-Google-Smtp-Source: APXvYqynVELsYqcqQ3WkOuXVc21SB/kMXSnXwhm4rJjbGqpBW3X6B+fXTZsFIXnZIxLxYIvULF3Ugg==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr9015135ljj.117.1559814437482; 
 Thu, 06 Jun 2019 02:47:17 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id s20sm214365lfb.95.2019.06.06.02.47.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:16 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, b.zolnierkie@samsung.com
Subject: [PATCH 3/8] drivers: (video|gpu): fix warning same module names
Date: Thu,  6 Jun 2019 11:47:12 +0200
Message-Id: <20190606094712.23715-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQfbJoiQ5WTWGjUJ1PADkmMlX7UTg1NHq4Oh3Ljtrbo=;
 b=v0l1t7motrGGJZjUZw7mZhdXu71rcqkX14qgcfNJsj0pBDkflH+Yc72Rh58UO+K/ma
 NkcmwaO4ZRwUGSEf8FDCBIG9d5FZ14s3/Wu+e7uRpuc3N+NwdVmPkgZ3ASVth/T3MdYP
 zkyIoXbtLNxGxDWBwLZLLWP5BgK4Cj1MAjGGDwMPETEClXrqSkfGB+ui3a6x4JzT1JRI
 G7GVtXsWqf6Jrl0j4cKaP5Z91IJPDBMDrMDcVB3HTk4V95x6QgEjoib0TMkiQWzWtb0X
 Fwk6a3D+h0Vdr8Ji3cBC+l5ZJv9LqytaxcbMrFHRJKAG/dbb4ZLq/iU1m+2Kc78Nhxrd
 PHug==
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, f.fainelli@gmail.com,
 Anders Roxell <anders.roxell@linaro.org>, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 davem@davemloft.net, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@kernel.org, lee.jones@linaro.org, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19EUk1fTVhTRkIgYW5kIENPTkZJR19GQl9NWFMgZW5h
YmxlZCBhcwpsb2FkYWJsZSBtb2R1bGVzLCB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoK
d2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6CiAgZHJpdmVycy92aWRlby9mYmRldi9t
eHNmYi5rbwogIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYi5rbwoKUmV3b3JrIHNvIHRoZSBu
YW1lcyBtYXRjaGVzIHRoZSBjb25maWcgZnJhZ21lbnQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRlcnMg
Um94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214
c2ZiL01ha2VmaWxlIHwgNCArKy0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlICAgfCAz
ICsrLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL01ha2VmaWxlIGIvZHJpdmVycy9ncHUv
ZHJtL214c2ZiL01ha2VmaWxlCmluZGV4IGZmNmUzNTgwODhmYS4uNWQ0OWQ3NTQ4ZTY2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL214c2ZiL01ha2VmaWxlCkBAIC0xLDMgKzEsMyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5Ci1teHNmYi15IDo9IG14c2ZiX2Rydi5vIG14c2ZiX2NydGMubyBt
eHNmYl9vdXQubwotb2JqLSQoQ09ORklHX0RSTV9NWFNGQikJKz0gbXhzZmIubworZHJtLW14c2Zi
LXkgOj0gbXhzZmJfZHJ2Lm8gbXhzZmJfY3J0Yy5vIG14c2ZiX291dC5vCitvYmotJChDT05GSUdf
RFJNX01YU0ZCKQkrPSBkcm0tbXhzZmIubwpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9NYWtlZmlsZSBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZpbGUKaW5kZXggNjU1ZjI1Mzdj
YWMxLi43ZWU5Njc1MjVhZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZp
bGUKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9NYWtlZmlsZQpAQCAtMTMxLDcgKzEzMSw4IEBA
IG9iai0kKENPTkZJR19GQl9WR0ExNikgICAgICAgICAgICArPSB2Z2ExNmZiLm8KIG9iai0kKENP
TkZJR19GQl9PRikgICAgICAgICAgICAgICArPSBvZmZiLm8KIG9iai0kKENPTkZJR19GQl9NWDMp
CQkgICs9IG14M2ZiLm8KIG9iai0kKENPTkZJR19GQl9EQThYWCkJCSAgKz0gZGE4eHgtZmIubwot
b2JqLSQoQ09ORklHX0ZCX01YUykJCSAgKz0gbXhzZmIubworb2JqLSQoQ09ORklHX0ZCX01YUykJ
CSAgKz0gZmItbXhzLm8KK2ZiLW14cy1vYmpzCQkJICA6PSBteHNmYi5vCiBvYmotJChDT05GSUdf
RkJfU1NEMTMwNykJICArPSBzc2QxMzA3ZmIubwogb2JqLSQoQ09ORklHX0ZCX1NJTVBMRSkgICAg
ICAgICAgICs9IHNpbXBsZWZiLm8KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
