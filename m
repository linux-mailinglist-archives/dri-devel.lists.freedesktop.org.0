Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09F1DF649
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941E76E172;
	Sat, 23 May 2020 09:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFCA6E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 07:25:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u12so4049280wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDvP7skNJs4tKTlKtdt9bUJvJfxMC8gHW2dP050hlR0=;
 b=rnwBD9Yxv/bc1SSHOCuVjW/0ZvN3Ty/t/Mfk+cHmcAelakXqHg7HQFhklxBkxpo0JJ
 4dmBdVqVyA3qgd83irkTn/vuX6biNTbWd9trr8Gp6HSnhdSmV9ivc0zLSTaP5WPcZXRw
 Av+LtYDLRLg/+kFc/DkMI2v/zeDzBk0F4Q4iw2XR18usJstbFFpj+4YGJwx0wcfirhMS
 cYNWE+Pf+VbegZFTY0jZ5O0BSACeuQz7KWCkyXlMEi/PPhsTkxgXh/q9OrnQtVxpN2l1
 CX25wHDdS49OV3flVdLBAgWY1NDAzRBDZ9Kjau1IzdLnVpJGQOg3PrLh+cwsapUbL3YH
 cyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDvP7skNJs4tKTlKtdt9bUJvJfxMC8gHW2dP050hlR0=;
 b=Ouz55+2cIvaXAKOjMQtL34dl31ZfwN5bALqdmkOwxS9UoSkGl0oDEQH7kCx3r/hRfx
 RPn2RDngjyEuvQm35GWhoeGSP8u9yYjxgyWwRQoDt4NVtqocULgVBJafPMMbDj8WSNgl
 0B8dToZmbaQ0yZu9xB0OMUCXQ8BIrfi0qz3Ix0QyY5w4UZrhZRrY3nzuEJ5ZgtC06bXw
 AMUPkkH3SVkyeqhhXvXcYqGZmU3QbxJkF8Snr0LYQs68Z+fPwFj/cP68Pc+5DfDPFZwe
 ftcSIb/oeARnPSGH9KU+iBvpDJ4ojPxVFJnpBLDCS1hXNoBinkhqQpvwlernD+Aqh9tH
 Ot3Q==
X-Gm-Message-State: AOAM531YkNLTIBrIiW7UjzuzzX4dT7QZ+DxOGnpUJm+s0uh+xfneEd4r
 4/GiMPs5wwq3Y5J/AwOCUAc=
X-Google-Smtp-Source: ABdhPJwLXPwMKkymEIty2nNVw6xiBfgdwwliFlwar3iAAZ9oqW1R/L+QdfQIxeDvNHspsL3mGaOtpg==
X-Received: by 2002:a05:600c:2146:: with SMTP id
 v6mr12656827wml.142.1590132331609; 
 Fri, 22 May 2020 00:25:31 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:31 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 3/5] mtd: rawnand: brcmnand: rename page sizes
Date: Fri, 22 May 2020 09:25:23 +0200
Message-Id: <20200522072525.3919332-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudCBwYWdlcyBzaXplcyBhcHBseSB0byBjb250cm9sbGVycyBhZnRlciB2My40CgpTaWdu
ZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgot
LS0KIHYzOiBubyBjaGFuZ2VzLgogdjI6IGFkZCBuZXcgcGF0Y2guCgogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYwppbmRleCA3MmIyNjhkOGUzYTQuLmVmNjBkYmJlYWMyYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC01NzEsNyArNTcxLDcgQEAgc3RhdGlj
IGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpj
dHJsKQogewogCXN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgYmxvY2tfc2l6ZXNfdjZbXSA9IHsg
OCwgMTYsIDEyOCwgMjU2LCA1MTIsIDEwMjQsIDIwNDgsIDAgfTsKIAlzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IGJsb2NrX3NpemVzX3Y0W10gPSB7IDE2LCAxMjgsIDgsIDUxMiwgMjU2LCAxMDI0
LCAyMDQ4LCAwIH07Ci0Jc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBwYWdlX3NpemVzW10gPSB7
IDUxMiwgMjA0OCwgNDA5NiwgODE5MiwgMCB9OworCXN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQg
cGFnZV9zaXplc192M180W10gPSB7IDUxMiwgMjA0OCwgNDA5NiwgODE5MiwgMCB9OwogCiAJY3Ry
bC0+bmFuZF92ZXJzaW9uID0gbmFuZF9yZWFkcmVnKGN0cmwsIDApICYgMHhmZmZmOwogCkBAIC02
MTgsNyArNjE4LDcgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0cnVjdCBi
cmNtbmFuZF9jb250cm9sbGVyICpjdHJsKQogCQljdHJsLT5tYXhfcGFnZV9zaXplID0gMTYgKiAx
MDI0OwogCQljdHJsLT5tYXhfYmxvY2tfc2l6ZSA9IDIgKiAxMDI0ICogMTAyNDsKIAl9IGVsc2Ug
ewotCQljdHJsLT5wYWdlX3NpemVzID0gcGFnZV9zaXplczsKKwkJY3RybC0+cGFnZV9zaXplcyA9
IHBhZ2Vfc2l6ZXNfdjNfNDsKIAkJaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA2MDApCiAJ
CQljdHJsLT5ibG9ja19zaXplcyA9IGJsb2NrX3NpemVzX3Y2OwogCQllbHNlCi0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
